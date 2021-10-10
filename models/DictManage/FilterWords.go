package DictManage

type FilterWords struct {
	ID   string `json:"id,omitempty" gorm:"id"`
	Word string `json:"word,omitempty" gorm:"word"`
}
