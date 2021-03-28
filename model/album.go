package model

import (
	"time"

	"gorm.io/gorm"
)

// Album - represent a movie album in Inflix store
type Album struct {
	gorm.Model
	Title      string    `json:"title"`
	Release    time.Time `json:"release"`
	Production string    `json:"production"`
	Director   string    `json:"director"`
	IsPremium  bool      `json:"is_premium"`
}

//TableName - to reriteve the db table name
func (album *Album) TableName() string {
	return "album"
}
