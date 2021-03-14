package main

import (
	"github.com/gin-gonic/gin"
	"net/http"
)

func main() {
	r :=gin.Default()

	// GET请求URL?后面的querystring参数
	r.GET("/web", func(c *gin.Context) {
		// 获取浏览器那边发送请求携带的query string参数
		//username :=c.DefaultQuery("username","啊肥") //获取不到就使用默认值
		username,ok :=c.GetQuery("username")
		password :=c.Query("password") // 通过Query获取请求中携带的query string 参数
		if !ok{
			username="不ok"
		}
		c.JSON(http.StatusOK,gin.H{
			"username":username,
			"password":password,
		})

	})
	r.Run(":9000")
}
