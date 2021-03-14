package main

import (
	"github.com/gin-gonic/gin"
	"net/http"
	"path"
)

func main() {
	r:=gin.Default()
	r.LoadHTMLFiles("./index.html")
	r.GET("/index", func(c *gin.Context) {
		c.HTML(http.StatusOK,"index.html",nil)
	})
	// 处理multipart forms 提交文件时默认的内存限制是32MB
	// 可通过下面修改
	r.MaxMultipartMemory=8<<20 //8MB
	r.POST("/upload", func(c *gin.Context) {
		// 从请求中读取文件
		f,err := c.FormFile("f1")
		if err != nil {
			c.JSON(http.StatusBadRequest,gin.H{
				"status":err.Error(),
			})
		}else {
			//将读取到的文件保存在本地（服务器本地）
			//dst := fmt.Sprintf("./%s",f.Filename)
			dst := path.Join("./",f.Filename) //在指定目录保存
			c.SaveUploadedFile(f,dst) //需要处理储错误
			c.JSON(http.StatusOK,gin.H{
				"status":"ok",
			})
		}

	})
	r.Run(":9000")
}
