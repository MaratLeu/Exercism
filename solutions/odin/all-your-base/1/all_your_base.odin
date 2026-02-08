package all_your_base

Error :: enum {
	None,
	Invalid_Input_Digit,
	Input_Base_Too_Small,
	Output_Base_Too_Small,
	Unimplemented,
}

pow :: proc(number: int, power: int) -> int {
	result := 1
	for i := 0; i < power; i += 1 {
		result *= number
	}
	return result
}

convert_10_base_to_Nth_base :: proc(number: ^int, base: int) -> [dynamic]int {
	result: [dynamic]int
	rem := 0
  if number^ == 0 {
    append(&result, 0)
    return result
  }
	for number^ != 0 {
		rem = number^ % base
		number^ /= base
		append(&result, rem)
	}
	return result
}

rebase :: proc(input_base: int, digits: []int, output_base: int) -> ([]int, Error) {
	// Please implement the `rebase` procedure.
  if input_base < 2 do return nil, Error.Input_Base_Too_Small
  if output_base < 2 do return nil, Error.Output_Base_Too_Small
   
  digits_len:= len(digits)
	ten_base := 0
	for digit, index in digits {
    if digit >= input_base || digit < 0 {
      return nil, .Invalid_Input_Digit
    }
		// Convert to 10 base system
		ten_base += digit * pow(input_base, digits_len - index - 1)	
	}

  reverse_output := convert_10_base_to_Nth_base(&ten_base, output_base)
  defer delete(reverse_output)
  result := make([]int, len(reverse_output))

  for x, index in reverse_output {
      result[len(result) - index - 1] = x
  }
	return result, .None
}

