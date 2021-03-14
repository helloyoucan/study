package main

import (
	"fmt"
	"html/template"
	"net/http"
)

func sayHello(w http.ResponseWriter, r *http.Request) {
	// 2.解析模板
	t, err := template.ParseFiles("./hello.tmpl")
	if err != nil {
		fmt.Print("Parse template failed,err:", err)
		return
	}
	// 3.渲染模板
	err = t.Execute(w, "小灿")
	if err != nil {
		fmt.Print("render template failed,err:", err)
		return
	}
}
func main() {
	http.HandleFunc("/", sayHello)
	err := http.ListenAndServe(":9000", nil)
	if err != nil {
		fmt.Print("Http server start failed,err:", err)
		return

	}
}
