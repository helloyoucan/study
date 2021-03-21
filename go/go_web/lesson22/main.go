package main

import (
	"fmt"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
)

type User struct {
	gorm.Model
	Name string
	Age int64
}
func main() {
// 连接MySQL数据库
	db ,err:=gorm.Open("mysql","root:123456@(127.0.0.1:3306)/db3?charset=utf8mb4&parseTime=True&loc=Local")
	if err != nil {
		panic(err)
	}
	defer db.Close()
	// 2.把模型与数据库中的表对应起来（也可新增字段，但不能修改字段）
	db.AutoMigrate(&User{})

	// 3.创建
	u1 := User{Name: "小灿",Age: 18}
	db.Create(&u1)
	u2 := User{Name: "大飞",Age: 20}
	db.Create(&u2)

	// 4.查询
	//var user User // 声明模型结构体类型变量user
	//db.First(&user) //根据主键查询第一条数据（主键必须为数字）
	// 这样写也是可以的
	user :=new(User)//new和make的区别：1.new是用于基本的数据类型或结构体，返回对应类型的指针;2.make是一些固定的类型申请内存，申请什么类型就返回什么类型
	db.First(user) //注意这里没有&
	fmt.Printf("u:%#v\n",user)
	db.Take(&user) // 随机获取一条记录
	db.Last(&user) // 根据主键查询最后一条记录
	//users:=[...]User{}
	var users []User  //切片（动态数组）
	db.Take(&users) // 查询所以记录
	db.First(&user,10) // 查询指定的某条记录（仅当主键为整型时可用）
}
