package main
import (
	"github.com/gin-gonic/gin"
	"net/http"
)

func main() {
	r:=gin.Default()
	r.LoadHTMLFiles("./login.html","./index.html")
	r.GET("/login", func(c *gin.Context) {
		c.HTML(http.StatusOK,"login.html",nil)
	})

	r.POST("/login", func(c *gin.Context) {
		// 获取form表单提交的数据
		//username:=c.PostForm("username")
		//password:=c.PostForm("password")
		//c.JSON(http.StatusOK,gin.H{
		//	"username":username,
		//	"password":password,
		//})
		//username := c.DefaultPostForm("aaa-username","小米")
		password := c.DefaultPostForm("aaa-password","123456")
		username,ok:=c.GetPostForm("u")
		if !ok {
			username="no ok"
		}
		c.HTML(http.StatusOK,"index.html",gin.H{
			"name":username,
			"psd":password,
		})
	})
	r.Run(":9000")
}
