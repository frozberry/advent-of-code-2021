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
	lines := get_input("../input.txt")
	sum := 0

	stack := [dynamic]string{}

	for line, j in lines {
		for i in 0..<len(line) {
			char := line[i]
			if is_open(char) {
				push_closing(char, &stack)
			} else {
				popped := pop(&stack)
				if popped != string([]u8{char}) {
					sum += char_to_score(char)
					break
				}
			}
		}
	}

	fmt.println("Part 1: ",sum)
}

push_closing :: proc(char: u8, stack: ^[dynamic]string) {
	str := string([]u8{char})
	if str == "(" {
		append(stack, ")")
	}
	if str == "[" {
		append(stack, "]")
	}
	if str == "{" {
		append(stack, "}")
	}
	if str == "<" {
		append(stack, ">")
	}
}

is_open :: proc(char: u8) -> bool {
	str := string([]u8{char})
	opens := []string{")", "]", "}", ">"} 
	return !slice.contains(opens, str)
}

char_to_score :: proc(char: u8) -> int {
	str := string([]u8{char})
	if str == ")" {
		return 3
	}
	if str == "]" {
		return 57
	}
	if str == "}" {
		return 1197
	}
	if str == ">" {
		return 25137
	}

	return 0
}

incomplete_to_score :: proc(str: string) -> int {
	if str == ")" {
		return 1
	}
	if str == "]" {
		return 2 
	}
	if str == "}" {
		return 3
	}
	if str == ">" {
		return 4
	}

	return 0
}


part2 :: proc() {
	lines := get_input("../input.txt")
	sum := 0
	scores := [dynamic]int{}

	for line, j in lines {
		stack := [dynamic]string{}

		corrupt := false
		for i in 0..<len(line) {
			char := line[i]
			if is_open(char) {
				push_closing(char, &stack)
			} else {
				popped := pop(&stack)
				if popped != string([]u8{char}) {
					corrupt = true
					break
				}
			}
		}

		if !corrupt {
			slice.reverse(stack[:])
			stack_score := 0
			for item in stack {
				score := incomplete_to_score(item)
				stack_score *= 5
				stack_score += score 

			}
			append(&scores, stack_score)
		}
	}

	slice.sort(scores[:])
	median := scores[len(scores) / 2]

	fmt.println("Part 2: ", median)
}

get_input :: proc(file_name: string) -> []string {
	data, _ := os.read_entire_file(file_name)
	str := string(data)
	values := strings.fields(str)
	return values
}