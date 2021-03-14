package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"net/http"
)
type UserInfo struct { //这个结构提需要传递到ShouldBind，小写字母不能在其他地方被访问，所以需要大写字母为首字母
	Username string `form:"username" json:"user"` // 使用struct tag指定接收的字段，这里是：通过user接收赋值到Username
	Password string `form:"password" json:"pwd"`
}
/**
ShouldBind
1.如果是GET请求，只使用Form绑定引擎（query）
2.如果是POST请求，首先检查content-type是否为JSON或XML，然后再使用Form（form-data）
 */
func main() {
	r:=gin.Default()
	r.LoadHTMLFiles("./index.html")
	r.GET("/user", func(c *gin.Context) {
		var u UserInfo// 声明一个UserInfo类型的变量u
		err:=c.ShouldBind(&u)//ShouldBind要修改u的值，但是在go中传递参数都是值拷贝，所以需要吧u的指针地址传递过去让ShouldBind修改（通过反射去找到结构体内的字段）
		if err != nil {
			c.JSON(http.StatusBadRequest,gin.H{
				"error":err.Error(),
			})
		}else {
			fmt.Printf("%#v\n",u)
			c.JSON(http.StatusOK,gin.H{
				"status":"ok",
			})
		}
	})
	r.GET("/index", func(c *gin.Context) {
		c.HTML(http.StatusOK,"index.html",nil)
	})
	r.POST("/form", func(c *gin.Context) {
		var u UserInfo
		err:=c.ShouldBind(&u)
		if err != nil {
			c.JSON(http.StatusBadRequest,gin.H{
				"error":err.Error(),
			})
		}else {
			fmt.Printf("%#v\n",u)
			c.JSON(http.StatusOK,gin.H{
				"status":"form ok",
			})
		}
	})
	//接收json格式的数据
	r.POST("/json", func(c *gin.Context) {
		var u UserInfo
		err:=c.ShouldBind(&u)
		if err != nil {
			c.JSON(http.StatusBadRequest,gin.H{
				"error":err.Error(),
			})
		}else {
			fmt.Printf("%#v\n",u)
			c.JSON(http.StatusOK,gin.H{
				"status":"json ok",
			})
		}
	})
	r.Run(":9000")
}
