package main

import (
	"github.com/gin-gonic/gin"
	"net/http"
)
func main() {
	r := gin.Default()

	r.GET("/json", func(c *gin.Context) {
		// 方式一：使用map
		//data := map[string]interface{}{
		//	"name":"小灿",
		//	"message":"hello",
		//	"age":18,
		//}
		data:=gin.H{
			"name":"小灿",
			"message":"hello",
			"age":18,
		}


		c.JSON(http.StatusOK,data)
	})
	//方法二：结构体，灵活使用struct tag来做定制化操作
	type msg struct{
		Name string `json:"name"` //使用struct tag
		name2 string //Go语言通过首字母的大小写来控制访问权限。首字母小写，无法被外部包访问和解析
		Message string ``
		Age int
	}
	r.GET("/json2", func(c *gin.Context) {
		data:=msg{
			Name: "小灿",
			name2:"返回的json中没有这个",
			Message: "hello",
			Age: 19,
		}
		c.JSON(http.StatusOK,data)//json的序列化
	})
	r.Run(":9000")
}
