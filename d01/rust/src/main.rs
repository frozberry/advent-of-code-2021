use std::fs::File;
use std::io::{BufRead, BufReader};

fn main() {
    let lines = lines_from_file("../input.txt");
    let nums: Vec<u32> = lines
        .iter()
        .map(|line| line.parse::<u32>().unwrap())
        .collect();

    part1(nums)
    // part2(nums)
}

fn part1(nums: Vec<u32>) {
    let mut sum = 0;

    for i in 1..nums.len() {
        if nums[i] > nums[i - 1] {
            sum += 1
        }
    }

    println!("sum: {:?}", sum)
}

fn part2(nums: Vec<u32>) {
    let mut sum = 0;

    for i in 0..nums.len() - 3 {
        let a = nums[i] + nums[i + 1] + nums[i + 2];
        let b = nums[i + 1] + nums[i + 2] + nums[i + 3];

        if b > a {
            sum += 1
        }
    }

    println!("sum: {:?}", sum)
}

fn lines_from_file(filename: &str) -> Vec<String> {
    let file = File::open(filename).expect("no such file");
    let buf = BufReader::new(file);
    buf.lines()
        .map(|l| l.expect("Could not parse line"))
        .collect()
}
