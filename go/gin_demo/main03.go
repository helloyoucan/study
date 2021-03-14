package main

//
//import (
//	"fmt"
//	"github.com/gin-gonic/gin"
//	"html/template"
//)
//
//func sayHello(c *gin.Context) {
//	tmpl, err := template.ParseFiles("./hello.html")
//	if err != nil {
//		fmt.Print("获取模板错误：", err)
//		return
//	}
//	tmpl.Execute(c.Writer, "小灿")
//}
//func main() {
//	r := gin.Default() //返回默认的路由引擎
//	// 知道用户是否GET请求/hello时，执行sayHello这个函数
//	r.GET("/html", sayHello)
//
//	//启动服务
//	r.Run(":9090")
//}
