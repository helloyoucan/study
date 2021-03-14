package main
//import (
//	"fmt"
//	"io/ioutil"
//	"net/http"
//)
//func sayHello(w http.ResponseWriter,r *http.Request){
//	b,_ :=ioutil.ReadFile("./hello.txt")
//	_,_ = fmt.Fprintf(w,string(b))
//}
//func main() {
//	http.HandleFunc("/hello",sayHello)
//	err := http.ListenAndServe(":9090",nil) //nil是空值
//	if err != nil{
//		fmt.Printf("http server failed. err%v\n",err)
//		return
//	}
//}
