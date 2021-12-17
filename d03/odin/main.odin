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
	lines := get_input("../test.txt")
	fmt.println(lines)

	foo := "hello"
	bar := foo << 1
	fmt.println(bar)
	fmt.println(cast(rune)bar)

	// fmt.println("Part 1: ", sum)
}

part2 :: proc() {
	lines := get_input("../test.txt") 

	// fmt.println("Part 2: ", sum)
}

get_input :: proc(file_name: string) -> []string {
	data, _ := os.read_entire_file(file_name)
	str := string(data)

	return strings.split(str, "\n")
}