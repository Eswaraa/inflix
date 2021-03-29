package main

import (
	"fmt"

	"github.com/Eswaraa/inflix/config"
	"github.com/Eswaraa/inflix/model"
	"github.com/Eswaraa/inflix/rest"
	_ "github.com/go-sql-driver/mysql"
	"github.com/jinzhu/gorm"
)

var err error

func main() {

	// Creating a connection to the database
	config.DB, err = gorm.Open("mysql", config.DbConnectionString(config.BuildDBConfig()))

	if err != nil {
		fmt.Println("Error Connecting to Inflix DB: ", err)
	}

	defer config.DB.Close()

	// run the migrations: todo struct
	config.DB.AutoMigrate(&model.Album{})

	//setup routes
	r := rest.SetupRouter()

	// running
	r.Run()

	// const layoutISO = "2006-01-02"
	// mydate := "2019-12-31"
	// t, _ := time.Parse(layoutISO, mydate)
	// fmt.Println(t)                   // 1999-12-31 00:00:00 +0000 UTC
	// fmt.Println(t.Format(layoutISO)) // December 31, 1999
	// var a model.Album
	// data := `
	// {
	// 	"title":"ABC",
	// 	"release":"2019-12-31",
	// 	"production":"Rox",
	// 	"director":"HK",
	// 	"is_premium":true
	// }`

	// err := json.Unmarshal([]byte(data), &a)
	// if err != nil {
	// 	panic(err)
	// }
	// fmt.Printf("%+v\n", a)
	// fmt.Println(a.Release.Month())
	// out, err := json.Marshal(a)
	// if err != nil {
	// 	panic(err)
	// }
	// fmt.Println(string(out))
}
