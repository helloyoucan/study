package main

import (
	"github.com/gin-gonic/gin"
	"net/http"
)
// 获取请求的path（URL）的参数，返回都是字符串
// 注意URL的匹配不要冲突（例如"/:a/:b"和"/user/:name/:age"就冲突了，因为user匹配到:a了）
func main() {
	r:=gin.Default()

	r.GET("/user/search/:username/:address", func(c *gin.Context) {
		// 获取路径参数
		username :=c.Param("username")
		address :=c.Param("address")
		c.JSON(http.StatusOK,gin.H{
			"username": username,
			"address":address,
		})
	})
	r.Run(":9000")
}
