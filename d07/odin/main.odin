package main
import "core:os"
import "core:fmt"
import "core:strings"
import "core:strconv"
import "core:math"
import "core:slice"


main :: proc () {
	part1()
	part2()
}

part1 :: proc() {
	nums := get_input("../input.txt")
	max := slice.max(nums)

	totals := [dynamic]int{}
	for i in 0..<max {
		total := 0
		for crab in nums {
			total += abs(crab - i)
		}
		append(&totals, total)
	}

	fmt.println("Part 1: ", slice.min(totals[:]))
}

part2 :: proc() {
	nums := get_input("../input.txt")
	max := slice.max(nums)

	totals := [dynamic]int{}
	for i in 0..<max {
		total := 0
		for crab in nums {
			total += triangle(abs(crab - i))
		}
		append(&totals, total)
	}

	fmt.println("Part 2: ", slice.min(totals[:]))
}

triangle :: proc (n: int) -> int {
	sum := (n * (n + 1)) / 2
	return sum
}

get_input :: proc(file_name: string) -> []int {
	data, _ := os.read_entire_file(file_name)
	str := string(data)
	values := strings.split(str, ",")
	ints := make([]int, len(values))
	for value, i in values {
		ints[i] = strconv.atoi(value)
	}
	delete(values)
	return ints
}

abs :: proc(n: int) -> int {
	if n < 0 do return -n
	return n
}