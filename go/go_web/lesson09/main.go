package main

import (
	"github.com/gin-gonic/gin"
	"html/template"
	"net/http"
)
func main() {
	r:=gin.Default()
	// 加载静态文件
	r.Static("/xxx","./statics")
	// gin框架中给模板添加自定义函数
	r.SetFuncMap(template.FuncMap{
		"safe": func(str string) template.HTML {
			return template.HTML(str)
		},
	})
	//r.LoadHTMLFiles("templates/index.tmpl") //模板解析
	r.LoadHTMLGlob("templates/**/*") //模板解析
	r.GET("/users", func(c *gin.Context) {
		// HTTP请求
		c.HTML(http.StatusOK,"users/index.tmpl",gin.H{
			"title":"<a href='http://baidu.com'>百度一下<a>",
		})
	})
	r.GET("/posts", func(c *gin.Context) {
		// HTTP请求
		c.HTML(http.StatusOK,"posts/index.tmpl",gin.H{
			"title":"<a href='http://baidu.com'>百度一下<a>",
		})
	})

	r.Run(":9000")
}
