package main

import (
	"fmt"
	"html/template"
	"net/http"
)

func f1(w http.ResponseWriter, r *http.Request) {
	// 定义一个函数k
	// 要么只有一个返回值，要么有两个返回值，第二个返回值必须是error类型
	k := func(name string) (string, error) {
		return name + "哈哈哈哈", nil
	}

	// 定义模板
	//t, err := template.New("f.tmpl").ParseFiles("./f.tmpl")
	t := template.New("f.tmpl") //创建一个名称为f.tmpl的模板对象，名字需要和模板的名字对应上

	//告诉模板引擎，我现在多了一个自定义函数kua
	t.Funcs(template.FuncMap{
		"kua": k,
	})
	// 解析模板
	_, err := t.ParseFiles("./f.tmpl")
	if err != nil {
		fmt.Print("parse template error", err)
		return
	}
	name := "小灿"
	// 渲染模板
	t.Execute(w, name)

}
func demo01(w http.ResponseWriter, r *http.Request) {
	// 定义模板
	//解析模板
	t, err := template.ParseFiles("./t.tmpl", "./ul.tmpl") //注意顺序，需要嵌套的在后面
	if err != nil {
		fmt.Print("parse template error:", err)
		return
	}
	// 渲染模板
	name := "小小"
	// 渲染模板
	t.Execute(w, name)
}
func main() {
	http.HandleFunc("/", f1)
	http.HandleFunc("/tmplDemo", demo01)
	err := http.ListenAndServe(":9000", nil)
	if err != nil {
		fmt.Print("http server run error:", err)
		return
	}
}
