package main

import (
	"fmt"
	"html/template"
	"net/http"
)

func index(w http.ResponseWriter, r *http.Request) {
	// 定义模板
	//解析模板
	t, err := template.New("index.tmpl").Delims("{[", "]}").ParseFiles("./index.tmpl")
	if err != nil {
		fmt.Print("Parse template error:", err)
		return
	}
	//渲染模板
	msg := "自定义模板标识符"
	//渲染模板
	err = t.Execute(w, msg)
	if err != nil {
		fmt.Print("Execute template error:", err)
		return
	}
}
func xss(w http.ResponseWriter, r *http.Request) {
	// 定义模板
	//解析模板
	// 解析模板之前定义一个子自定义函数safe
	t, err := template.New("xss.tmpl").Funcs(template.FuncMap{
		"safe": func(str string) template.HTML {
			return template.HTML(str)
		},
	}).ParseFiles("./xss.tmpl")
	if err != nil {
		fmt.Print("Parse template error:", err)
		return
	}
	//渲染模板
	msg := "<script>alert('哈哈')</script><a href='www.baidu.com'>百度一下</a>"
	msg2 := "<a href='www.baidu.com'>百度一下</a>"
	//渲染模板
	err = t.Execute(w, map[string]string{
		"msg":  msg,
		"msg2": msg2,
	})
}
func main() {
	http.HandleFunc("/index", index)
	http.HandleFunc("/xss", xss)
	err := http.ListenAndServe(":9000", nil)
	if err != nil {
		fmt.Print("http server run error:", err)
		return
	}
}
