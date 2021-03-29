package util

import (
	"log"
	"strconv"
	"time"
)

type SimpleDate struct {
	time.Time
}

const layoutISO = "2006-01-02"

func (sd SimpleDate) MarshalJSON() ([]byte, error) {
	out := sd.Format(layoutISO)
	log.Printf("\n Date Un Formatted %v", sd)
	log.Printf("\n Date Formatted %s", out)
	return []byte(`"` + out + `"`), nil
}

func (sd *SimpleDate) UnmarshalJSON(b []byte) error {
	dateStr, err := strconv.Unquote(string(b))
	if err != nil {
		return nil
	}
	log.Printf("Layout: %s", layoutISO)
	log.Printf("Date String: %s", dateStr)
	t, err := time.Parse(layoutISO, dateStr)
	if err != nil {
		return err
	}
	*sd = SimpleDate{t}
	return nil
}
