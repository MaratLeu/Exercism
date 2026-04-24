package anagram

import "core:strings"

find_anagrams :: proc(word: string, candidates: []string) -> []string {
	// Implement this procedure.
	array_len := len(candidates)
	result: [dynamic]string
	for candidate in candidates {
		if (strings.equal_fold(word, candidate)) {
			append(&result, candidate)
		}
	}
	return result[:]
}
