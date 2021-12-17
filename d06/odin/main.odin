package main
import "core:os"
import "core:fmt"
import "core:strings"
import "core:strconv"
import "core:slice"

main :: proc () {
	part1()
	part2()
}

part1 :: proc() {
	nums := get_input("../input.txt")

	fish := slice.to_dynamic(nums)

	for i in 0..<255 {
		fmt.println(i)
		for count, i in fish {
			if count == 0 {
				fish[i] = 6
				append(&fish, 9)
			} else {
				fish[i] = count - 1
			}
		} 
	}

	population := len(fish)
	fmt.println("Part 1: ", population)
}

part2 :: proc() {
	nums := get_input("../input.txt")

	days: [9]int

	for count in nums {
		days[count] += 1
	}

	for i in 0..<256 {
		prev := days
		for j := 8; j >= 0; j -= 1 {
			if j != 0 {
				days[j - 1] = prev[j]
			} else {
				days[8] = prev[0]
				days[6] += prev[0]
			}
		} 
	}

	population := 0
	for i in days {
		population += i
	}

	fmt.println("Part 2: ", population)
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