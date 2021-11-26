package DictManage

type Glossary struct {
	Id              string `json:"id,omitempty" gorm:"id;primaryKey"`
	Noun            string `json:"noun,omitempty" gorm:"noun"`
	Explain         string `json:"explain,omitempty" gorm:"explain"`
	Transliteration string `json:"transliteration,omitempty" gorm:"transliteration"`
	IsDefault       int    `json:"is_default,omitempty" gorm:"is_default;default:0"`
}
