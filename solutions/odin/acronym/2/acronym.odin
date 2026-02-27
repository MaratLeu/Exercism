package acronym

import "core:strings"

is_alpha :: proc(c: rune) -> bool {
	switch c {
	case 'a' ..= 'z', 'A' ..= 'Z':
		return true
	case:
		return false
	}
}

skippable := []rune{',', '.', '!', ';', '\''}
whitespace := []rune{' ', '-'}

RuneType :: enum {
	Whitespace,
	Skippable,
	Letter,
}

get_rune_type :: proc(r: rune) -> RuneType {
	if is_alpha(r) do return .Letter
	for s in skippable {
		if s == r do return .Skippable
	}
	return .Whitespace
}

abbreviate :: proc(phrase: string) -> (output: string) {
	// Implement this procedure.
	last_was_ws := true
	sb: strings.Builder
	strings.builder_init(&sb)
	defer strings.builder_destroy(&sb)
	for c in phrase {
		switch get_rune_type(c) {
		case .Whitespace:
			last_was_ws = true
		case .Letter:
			if last_was_ws {
				strings.write_rune(&sb, c)
				last_was_ws = false
			}
		case .Skippable:
		}
	}
	output = strings.to_upper(strings.to_string(sb))
	return
}
