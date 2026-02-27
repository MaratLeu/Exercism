package acronym

import "core:strings"
abbreviate :: proc(phrase: string) -> string {
	// Implement this procedure.
	builder: strings.Builder
	strings.builder_init(&builder)
	defer strings.builder_destroy(&builder)
	splits := [?]string{" ", "_", "-", ","}
	parts, _ := strings.split_multi(phrase, splits[:])

	for part, i in parts {
		strings.write_rune(&builder, rune(part[0]))
	}
	acronym := strings.to_string(builder)
	return strings.to_upper(acronym)
}
