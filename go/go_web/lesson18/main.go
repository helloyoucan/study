package main
//gin中间件
import (
	"fmt"
	"github.com/gin-gonic/gin"
	"net/http"
	"time"
)

func indexHandler(c *gin.Context){
	name,ok:=c.Get("name") //中间件Set进入的,//在上下文c中取值(跨中间件存储值)
	if !ok {
		name="default name"
	}
	fmt.Printf("name:",name)
	c.JSON(http.StatusOK,gin.H{
		"msg":name,
	})
}
//定义一个中间件m1：统计耗时
func m1(c *gin.Context)  {
	fmt.Println("m1 in...")
	//计时
	start :=time.Now()
	c.Next() //调用后续的处理函数
	//go funcXXX(c.Copy())//在funcXXX中只能使用c的拷贝
	// c.Abort() //阻止后续的处理函数
	cost :=time.Since(start)
	fmt.Printf("cont:%v\n",cost)
	fmt.Printf("m1 out....")
}
func m2(c *gin.Context)  {
	fmt.Println("m2 in...")
	c.Set("name","xiao can")//在上下文c中设置值
	c.Next() //调用后续的处理函数
	//c.Abort() //阻止后续的处理函数(不会执行后面的处理函数,没有响应)
	//return //返回到m1,然后"m1 out...."
	fmt.Printf("m2 out....")
}

func authMiddleware(doCheck bool)gin.HandlerFunc  {
	// 连接数据库
	// 或作一些其它操作
	return func(c *gin.Context){
		if doCheck {
			// 是否登录的判断
			// if 是登录用户
			c.Next()
			// else
			// c.About()
		}else {
			c.Next()
		}

	}
}
func main() {
	//r:=gin.Default()//默认使用了Logger和Recovery中间件
	r:=gin.New()//这样就不会使用Logger和Recovery中间件
	r.Use(m1,m2,authMiddleware(true)) //全局注册中间件m1 //执行顺序 m1 in --m2 in --m2 out--m1 out（先进后出）
	r.GET("/index"/*,m1*/,indexHandler)
	r.GET("/shop"/*,m1*/, func(c *gin.Context) {
		c.JSON(http.StatusOK,gin.H{
			"msg":"/shop",
		})
	})

	r.GET("/user"/*,m1*/, func(c *gin.Context) {
		c.JSON(http.StatusOK,gin.H{
			"msg":"/user",
		})
	})
	// 路由组注册中间件方法一
	xxGroup := r.Group("/xx",authMiddleware(true))
	{
		xxGroup.GET("/index", func(c *gin.Context) {
			c.JSON(http.StatusOK,gin.H{
				"msg":"/xx/index",
			})
		})
	}
	// 路由组注册中间件方法二
	xx2Group := r.Group("/xx2")
	xx2Group.Use(authMiddleware(true))
	{
		xx2Group.GET("/index", func(c *gin.Context) {
			c.JSON(http.StatusOK,gin.H{
				"msg":"/xx2/index",
			})
		})
	}
	r.Run(":9090")
}
