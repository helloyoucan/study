package main

import (
	"fmt"
	"html/template"
	"net/http"
)

func index(w http.ResponseWriter, r *http.Request) {
	//定义模板
	//解析模板
	t, err := template.ParseFiles("./index2.tmpl")
	if err != nil {
		fmt.Print("Parse template error:", err)
		return
	}
	msg := "index"
	//渲染模板
	t.Execute(w, msg)

}
func home(w http.ResponseWriter, r *http.Request) {
	//定义模板
	//解析模板
	t, err := template.ParseFiles("./home2.tmpl")
	if err != nil {
		fmt.Print("Parse template error:", err)
		return
	}
	msg := "home"
	//渲染模板
	t.Execute(w, msg)
}
func index2(w http.ResponseWriter, r *http.Request) {
	// 定义模板（模板继承的方式）
	//解析模板
	t, err := template.ParseFiles("./templates/base.tmpl", "./templates/index2.tmpl")
	if err != nil {
		fmt.Print("Parse template error:", err)
		return
	}
	//渲染模板
	msg := "index2"
	//渲染模板
	t.ExecuteTemplate(w, "index2.tmpl", msg)
}
func home2(w http.ResponseWriter, r *http.Request) {
	// 定义模板（模板继承的方式）
	//解析模板
	t, err := template.ParseFiles("./templates/base.tmpl", "./templates/home2.tmpl")
	if err != nil {
		fmt.Print("Parse template error:", err)
		return
	}
	//渲染模板
	msg := "home2"
	//渲染模板
	t.ExecuteTemplate(w, "home2.tmpl", msg)
}
func main() {
	http.HandleFunc("/index", index)
	http.HandleFunc("/home", home)

	http.HandleFunc("/index2", index2)
	http.HandleFunc("/home2", home2)
	err := http.ListenAndServe(":9000", nil)
	if err != nil {
		fmt.Print("http server run error:", err)
		return
	}
}
