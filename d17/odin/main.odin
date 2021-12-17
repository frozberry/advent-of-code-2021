package main
import "core:os"
import "core:fmt"
import "core:strings"
import "core:strconv"

main :: proc() {
	part1()
	part2()
}

part1 :: proc() {
	x_min := 138
	x_max := 184
	y_min := -125
	y_max := -71

	x := 0
	y := 0

	highest_y_hit := 0

	for i in 0 .. x_max {
		for j in 0 .. 1000 {
			highest_y := 0

			x_vel := i
			y_vel := j

			for {
				step(&x, &y, &x_vel, &y_vel)

				if missed_area(x, y, x_vel, y_vel, x_min, x_max, y_min) {
					x = 0
					y = 0
					break
				}

				max(&highest_y, y)

				if in_area(x, y, x_min, x_max, y_min, y_max) {
					max(&highest_y_hit, highest_y)
					x = 0
					y = 0
					break
				}
			}
		}
	}

	fmt.println("Part1: ", highest_y_hit)
}

part2 :: proc() {
	x_min := 138
	x_max := 184
	y_min := -125
	y_max := -71

	x := 0
	y := 0

	hit := 0

	for i in 0 .. x_max {
		for j in y_min .. 1000 {
			x_vel := i
			y_vel := j

			for {
				step(&x, &y, &x_vel, &y_vel)

				if missed_area(x, y, x_vel, y_vel, x_min, x_max, y_min) {
					x = 0
					y = 0
					break
				}

				if in_area(x, y, x_min, x_max, y_min, y_max) {
					hit += 1
					x = 0
					y = 0
					break
				}
			}
		}
	}

	fmt.println("Part2: ", hit)
}


step :: proc(x: ^int, y: ^int, x_vel: ^int, y_vel: ^int) {
	x^ += x_vel^
	y^ += y_vel^
	y_vel^ -= 1

	if x_vel^ > 0 {
		x_vel^ -= 1
	} else if x_vel^ < 0 {
		x_vel^ += 1
	}

	return
}

in_area :: proc(x: int, y: int, x_min: int, x_max: int, y_min: int, y_max: int) -> bool {
	return x >= x_min && x <= x_max && y >= y_min && y <= y_max
}

max :: proc(max: ^int, compare: int) {
	if compare > max^ {
		max^ = compare
	}
	return
}

missed_area :: proc(
	x: int,
	y: int,
	x_vel: int,
	y_vel: int,
	x_min: int,
	x_max: int,
	y_min: int,
) -> bool {
	past_x := x > x_max
	stopped_before_x := x < x_min && x_vel <= 0
	under_y := y < y_min && y_vel <= 0

	return past_x || stopped_before_x || under_y
}
