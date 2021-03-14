package main

import (
	"github.com/gin-gonic/gin"
	"net/http"
)

func main() {
	r:=gin.Default()
	// 访问/index的GET请求会走这一条处理逻辑
	// 路由
	r.GET("/index", func(c *gin.Context) {
		c.JSON(http.StatusOK,gin.H{
			"method":"GET",
		})
	})
	r.POST("/index", func(c *gin.Context) {
		c.JSON(http.StatusOK,gin.H{
			"method":"POST",
		})
	})
	r.PUT("/index", func(c *gin.Context) {
		c.JSON(http.StatusOK,gin.H{
			"method":"PUT",
		})
	})
	r.DELETE("/index", func(c *gin.Context) {
		c.JSON(http.StatusOK,gin.H{
			"method":"DELETE",
		})
	})
	// Any 请求方法集合
	r.Any("/user", func(c *gin.Context) {
		switch c.Request.Method {
		case "GET":
			c.JSON(http.StatusOK,gin.H{
				"method":"GET",
			})
			break
		case http.MethodPost:
			c.JSON(http.StatusOK,gin.H{
				"method":"POST",
			})
			break
		}
		c.JSON(http.StatusOK,gin.H{
			"method":"Any",
		})
	})
    // 访问了没有定义的路由
	r.NoRoute(func(c *gin.Context) {
		c.JSON(http.StatusNotFound,gin.H{
			"msg":"404页面",
		})
	})

	//路由组
	// 把公用的前缀提取出来，创建一个路由组
	// 视频的首页和详情页
	videoGroup :=r.Group("/video")
	{
		videoGroup.GET("/index", func(c *gin.Context) {
			c.JSON(http.StatusOK,gin.H{
				"msg":"/video/index",
			})
		})
		videoGroup.GET("/detail", func(c *gin.Context) {
			c.JSON(http.StatusOK,gin.H{
				"msg":"/video/detail",
			})
		})
	}
	//商城的首页和详情页
	shopGroup :=r.Group("/shop")
	{
		shopGroup.GET("/index", func(c *gin.Context) {
			c.JSON(http.StatusOK,gin.H{
				"msg":"/shop/index",
			})
		})
		shopGroup.GET("/detail", func(c *gin.Context) {
			c.JSON(http.StatusOK,gin.H{
				"msg":"/shop/detail",
			})
		})
	}
	r.Run(":9000")
}
