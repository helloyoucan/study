package main

import (
	"database/sql"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
	"time"
)
//定义模型
// 列名由字段名称进行下划线分割来生成 例如 MemberNumber会变为member_number
// （配置了默认值的情况下，默认零值不会保存到数据库）默认所有字段的零值, 比如 0, '', false 或者其它 零值，都不会保存到数据库内，使用指针可以避免这种情况。
type UserInfo struct {
	gorm.Model //内嵌的gorm.Model  // 名为`ID`的字段会默认作为表的主键
	Name string
	Age sql.NullInt64 //零值类型
	Birthday *time.Time
	Email string `gorm:"type:varchar(100);unique_index"` //unique_index是唯一的意思
	Role string `gorm:"size:255"` // 设置字段大小为255
	MemberNumber *string `gorm:"unique;not null"` //设置会员号（member number）唯一且不为空
	Num int `gorm:"AUTO_INCREMENT"` //设置num为·自增类型
	Address string `gorm:"index:addr"` //给address 字段创建名为addr得索引
	IgnoreMe int `gorm:"-"` //忽略字段
	AnimalId  int64 `gorm:"column:beast_id"` //使用struct tag指定字段名
}

// 使用`AnimalID`作为主键
type Animal struct {
	AnimalID int64 `gorm:"primary_key"`
	Name     string
	Age      int64
}
type User struct {
	
} // 默认表名是 `users`
// 将 User 的表名设置为 `profiles`
// 唯一指定表名
func (User) TableName() string { //不明白这里的写法(User是个接收器，通过.CreateTable(&User{})绑定了)
	return "profiles"
}

//表名默认就是结构体名称的复数
func main() {
	//连接数据库
	db,err:=gorm.Open("mysql","root:123456@(127.0.0.1:3306)/db1?charset=utf8mb4&parseTime=True&loc=Local")
	if err != nil {
		panic(err) //终止运行
	}
	defer db.Close() //延迟执行语句，用来添加函数结束时执行的代码
	// 禁用默认表名的复数形式，如果置为 true，则 `User` 的默认表名是 `user`
	//db.SingularTable(true)
	//GORM还支持更改 默认表名称规则 ：
	gorm.DefaultTableNameHandler = func (db *gorm.DB, defaultTableName string) string  {
		return "prefix_" + defaultTableName
	}
	db.AutoMigrate(&UserInfo{})
	db.AutoMigrate(&Animal{})
	db.AutoMigrate(&User{})
	// 使用User结构体创建名交 haha 的表
	db.Table("haha").CreateTable(&User{})
}
