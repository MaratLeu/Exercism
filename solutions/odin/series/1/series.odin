package series

Error :: enum {
	None,
	Invalid_Series_Length_Too_Large,
	Invalid_Series_Length_Zero,
	Invalid_Series_Length_Negative,
	Invalid_Sequence_Empty,
	Unimplemented,
}

series :: proc(sequence: string, series_len: int) -> ([]string, Error) {
	// Implement this procedure.
	seq_len := len(sequence)
	if seq_len == 0 {
		return nil, .Invalid_Sequence_Empty
	} else if series_len == 0 {
		return nil, .Invalid_Series_Length_Zero
	} else if series_len > seq_len {
		return nil, .Invalid_Series_Length_Too_Large
	} else if series_len < 0 {
		return nil, .Invalid_Series_Length_Negative
	}
	num_of_subseq := seq_len - series_len + 1

	ans := make([]string, num_of_subseq)
	for i in 0 ..< num_of_subseq {
		ans[i] = sequence[i:i + series_len]
	}
	return ans, .None
}
