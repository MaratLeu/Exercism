package flatten_array

Item :: union {
	i32,
	[]Item,
}

flatten :: proc(input: Item) -> []i32 {
	result: [dynamic]i32 = {}
	stack: [dynamic]Item = {}
	defer delete(stack)

	append(&stack, input)
	for len(stack) > 0 {
		item := pop(&stack)
		switch value in item {
		case i32:
			append(&result, value)
		case []Item:
			#reverse for v in value {
				append(&stack, v)
			}
		}
	}
	return result[:]
}
