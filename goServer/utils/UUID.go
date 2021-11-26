package utils

import (
	"github.com/satori/go.uuid"
)

func UUID4() string {
	return uuid.NewV4().String()
}
