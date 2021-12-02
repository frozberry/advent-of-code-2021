package main
import "core:os"
import "core:fmt"
import "core:strings"
import "core:strconv"

main :: proc () {
	part1()
	// part2()
}

part1 :: proc() {
	instructions := get_input("../test.txt")

	hor := 0
	vert := 0

	for i in instructions {
		fmt.println(i)
	}


	// fmt.println("Part 1: ", sum)
}

part2 :: proc() {
	// nums := get_input("../test.txt") 

	// fmt.println("Part 2: ", sum)
}

get_input :: proc(file_name: string) -> []string {
	data, _ := os.read_entire_file(file_name)
	lines := [dynamic]string{}
	for b in data {

	}
	return str
	// ints := make([]int, len(values))
	// for value, i in values {
	// 	ints[i] = strconv.atoi(value)
	// }
	// delete(values)
	// return ints
}