package main

import (
	"fmt"
	"html/template"
	"net/http"
)

type User struct {
	Name   string
	Gender string
	//gender string 在结构体中，通过首字母的大小写，来表示是否对外暴露，大写则暴露
	Age int
}

func sayHello(w http.ResponseWriter, r *http.Request) {
	// 定义模板
	//解析模板
	t, err := template.ParseFiles("./hello.tmpl")
	if err != nil {
		fmt.Print("parse template failed,err:", err)
		return
	}
	//渲染模板
	u1 := User{
		Name:   "小灿",
		Gender: "男",
		Age:    18,
	}
	m1 := map[string]interface{}{
		"name":   "小肥", //苏醒首字母大小写均可
		"gender": "女",
		"age":    18,
	}
	hobbyList := []string{
		"篮球",
		"主球",
		"喝酒",
	}
	//t.Execute(w, u1)
	//t.Execute(w, m1)
	t.Execute(w, map[string]interface{}{
		"u1":    u1,
		"m1":    m1,
		"hobby": hobbyList,
	})
}
func main() {
	http.HandleFunc("/", sayHello)
	err := http.ListenAndServe(":9000", nil)
	if err != nil {
		fmt.Print("Http server start failed,err:", err)
		return

	}
}
