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
	nums := get_input("../input.txt")
	
	sum := 0
	for i in 1..<10 {
	 	if nums[i] > nums[i - 1] do sum += 1 {
			sum += 1
		}
	}

	fmt.println("Part 1: ", sum)
}

part2 :: proc() {
	nums := get_input("../input.txt") 

	sum := 0
	for i in 0..<len(nums) - 3 {
		a := nums[i] + nums[i + 1] + nums[i + 2]
		b := nums[i + 1] + nums[i + 2] + nums[i + 3]
		if b > a {
			sum += 1
		}
	}
	
	fmt.println("Part 2: ", sum)
}

get_input :: proc(file_name: string) -> []int {
	data, _ := os.read_entire_file(file_name)
	str := string(data)
	values := strings.fields(str)
	ints := make([]int, len(values))
	for value, i in values {
		ints[i] = strconv.atoi(value)
	}
	delete(values)
	return ints
}
