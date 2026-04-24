package anagram

import "core:slice"
import "core:sort"
import "core:strings"
import "core:unicode/utf8"

find_anagrams :: proc(word: string, candidates: []string) -> []string {
	// Implement this procedure.
	array_len := len(candidates)
	result: [dynamic]string

	lower_word := strings.to_lower(word)
	defer delete(lower_word)

	sorted_word := utf8.string_to_runes(lower_word)
	defer delete(sorted_word)
	slice.sort(sorted_word)

	for candidate in candidates {
		if (len(word) != len(candidate)) do continue

		lower_candidate := strings.to_lower(candidate)
		defer delete(lower_candidate)

		if lower_word == lower_candidate do continue

		sorted_candidate := utf8.string_to_runes(lower_candidate)
		defer delete(sorted_candidate)
		slice.sort(sorted_candidate)

		if (slice.equal(sorted_word, sorted_candidate)) do append(&result, candidate)
	}
	return result[:]
}
