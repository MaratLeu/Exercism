package two_fer

import "core:strings"

two_fer :: proc(name: string = "you") -> string {
	// Implement this procedure.
	sb := strings.builder_make()
	strings.write_string(&sb, "One for ")
	strings.write_string(&sb, name)
	strings.write_byte(&sb, ',')
	strings.write_string(&sb, " one for me.")

	result := strings.to_string(sb)
	return result
}