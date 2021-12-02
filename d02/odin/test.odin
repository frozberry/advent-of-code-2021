package main

import "core:os"
import "core:fmt"
import "core:strings"
import "core:strconv"

main :: proc() {
	data, _ := os.read_entire_file("../test.txt")
	str := string(data)
	foo := strings.split(str, "\n")
	fmt.println(foo)
	values := strings.fields(str)
	ints := make([]int, len(values))
	for value, i in values {
		ints[i] = strconv.atoi(value)
	}
	delete(values)
}