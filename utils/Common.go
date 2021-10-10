package utils

import "sort"

func IsHave(strArr []string, str string) bool {
	sort.Strings(strArr)
	index := sort.SearchStrings(strArr, str)
	return index < len(strArr) && strArr[index] == str
}
