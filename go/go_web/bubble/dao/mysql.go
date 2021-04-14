package dao

import (
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
)

var (
	DB *gorm.DB
)

func InitMysql() (err error) {
	dsn:="root:123456@tcp(127.0.0.1:3306)/bubble?charset=utf8mb4&parseTime=True&loc=Local"
	DB , err=gorm.Open("mysql",dsn)
	if err != nil {
		return
	}
	return DB.DB().Ping()
}

func Close()  {
	DB.Close() //程序退出关闭数据库连接
}