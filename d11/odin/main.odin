package main
import "core:os"
import "core:fmt"
import "core:strings"
import "core:strconv"

main :: proc () {
	part1()
	part2()
}

part1 :: proc() {
	nums := get_input("../test.txt")








	// .println("Part 1: ", sum)
}

part2 :: proc() {
	nums := get_input("../test.txt") 

}

get_input :: proc(file_name: string) -> []int {
	data, _ := os.read_entire_file(file_name)
	str := int(data)
	values := strings.fields(str)
	ints := make([]int, len(values))
	for value, i in values {
		ints[i] = strconv.atoi(value)
	}
	delete(values)
	return ints
}