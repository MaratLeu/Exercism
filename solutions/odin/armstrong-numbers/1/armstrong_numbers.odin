package armstrong_numbers

pow :: proc(x: u8, pow: u8) -> u128 {
	mult: u128 = 1
	i: u8 = 0
	for ; i < pow; i += 1 {
		mult *= u128(x)
	}
	return mult
}

is_armstrong_number :: proc(n: u128) -> bool {
	if n < 10 {
		return true
	}
	arr: [dynamic]u8
	defer delete(arr)
	defer clear_dynamic_array(&arr)
	copy_n := n
	count_of_digits: u8 = 0
	for {
		rem := u8(copy_n % 10)
		append_elem(&arr, rem)

		count_of_digits += 1
		if copy_n / 10 != 0 {
			copy_n /= 10
		} else {
			break
		}
	}

	sum: u128 = 0
	for i in arr {
		sum += pow(i, count_of_digits)
	}
	if sum == n {
		return true
	}
	return false
}
