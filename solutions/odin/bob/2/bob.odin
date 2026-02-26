package bob
import "core:strings"

is_silence :: proc(input: string) -> bool {
	return len(input) == 0
}

is_question :: proc(input: string) -> bool {
	return strings.ends_with(input, "?")
}

is_shout :: proc(input: string) -> bool {
	big_letter := false
	for ch in input {
		switch ch {
		case 'a' ..= 'z':
			return false
		case 'A' ..= 'Z':
			big_letter = true
		case:
			continue
		}
	}
	return big_letter
}

response :: proc(input: string) -> string {
	input := strings.trim_space(input)
	switch {
	case is_silence(input):
		return "Fine. Be that way!"
	case is_question(input) && is_shout(input):
		return "Calm down, I know what I'm doing!"
	case is_question(input):
		return "Sure."
	case is_shout(input):
		return "Whoa, chill out!"
	case:
		return "Whatever."
	}
}
