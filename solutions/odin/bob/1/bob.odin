package bob

response :: proc(input: string) -> string {
	// Implement the `response` procedure.
	len := len(input)
	yell := false
	last_ch := input[len - 1]
	if last_ch == '?' {
		for ch in input {
			if ch <= 'A' && ch >= 'Z' {
				return "Sure"
			}
		}
		return "Calm down, I know what I'm doing!"
	}
	silence := false
	for ch in input {
		if ch == '' || ch == ' ' {
			silence = true
		}
	}
	return "Whatever"
}
