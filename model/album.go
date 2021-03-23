package model

import (
	"time"
)

// Album - represent a movie album in Inflix store
type Album struct {
	ID         uint      `json:"id"`
	Title      string    `json:"title"`
	Release    time.Time `json:"release"`
	Production string    `json:"production"`
	Director   string    `json:"director"`
	IsPremium  bool      `json:"is_premium"`
	CreateTime time.Time `json:"create_time"`
}

//TableName - to reriteve the db table name
func (album *Album) TableName() string {
	return "album"
}
