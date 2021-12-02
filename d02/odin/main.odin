package main
import "core:os"
import "core:fmt"
import "core:strings"
import "core:strconv"

main :: proc () {
	part1("../test.txt")
	part1("../input.txt")

	part2("../test.txt")
	part2("../input.txt")
}

part1 :: proc(file_name: string) {
	lines := get_input(file_name)

	hor := 0
	depth := 0

	for line in lines {
		command := strings.split(line, " ")
		instruction := command[0]
		num := strconv.atoi(command[1])

		if instruction == "forward" {
			hor += num
		}
		if instruction == "down" {
			depth += num
		}
		if instruction == "up" {
			depth -= num
		}

	}

	fmt.println("Part 1: ", hor * depth)
}

part2 :: proc(file_name: string) {
	lines := get_input(file_name)

	hor := 0
	depth := 0
	aim := 0

	for line in lines {
		command := strings.split(line, " ")
		instruction := command[0]
		num := strconv.atoi(command[1])

		if instruction == "forward" {
			hor += num
			depth += aim * num
		}
		if instruction == "down" {
			aim += num
		}
		if instruction == "up" {
			aim -= num
		}
	}

	fmt.println("Part 2: ", hor * depth)
}

get_input :: proc(file_name: string) -> []string {
	data, _ := os.read_entire_file(file_name)
	str := string(data)
	return strings.split(str, "\n")
}