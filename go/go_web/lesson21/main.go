package main

import (
	"database/sql"
	"fmt"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
)
// 1.定义模型（所有字段的零值, 比如0, "",false或者其它零值，都不会保存到数据库内，但会使用他们的默认值。使用指针或实现 Scanner/Valuer接口可以解决这个问题）
type User struct {
	ID int64
	Name string `gorm:"default:'我是默认值'"` //默认值是创建表时生效的（已创建列的不行）
	Name2 *string `gorm:"default:'我是默认值2'"`//1.使用指针解决零值问题
	Name3 sql.NullString `gorm:"default:'我是默认值3'"` // sql.NullString 实现了Scanner/Valuer接口
	Age int64
}
func main() {
	//连接数据库
	db,err:=gorm.Open("mysql","root:123456@(127.0.0.1:3306)/db2?charset=utf8mb4&parseTime=True&loc=Local")
	if err != nil {
		panic(err) //终止运行
	}
	defer db.Close() //延迟执行语句，用来添加函数结束时执行的代码
	// 2.把模型与数据库中的表对应起来
	db.AutoMigrate(&User{})

	// 3.创建
	u :=User{Name:"",Name2:new(string),Age: 18} // 在代码层面创建一个User对象
	fmt.Println(db.NewRecord(&u))//判断主键是否为空 true
	db.Debug().Create(&u)//这里传指针或值都可以。传值会产生拷贝的过程
	fmt.Println(db.NewRecord(&u))//判断主键是否为空 false

	u2 :=User{Name:"",Name3:sql.NullString{"", true},Name2:new(string),Age: 18} //使用Scanner/Valuer接口方式实现零值存入数据库
	db.Debug().Create(&u2)
}

