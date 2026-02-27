package allergies

Allergen :: enum {
	Eggs,
	Peanuts,
	Shellfish,
	Strawberries,
	Tomatoes,
	Chocolate,
	Pollen,
	Cats,
}

allergic_to :: proc(score: int, allergen: Allergen) -> bool {
	// Implement this procedure.
	up_score := score % 256
	switch allergen {
	case .Eggs:
		return up_score >= 1
	case .Peanuts:
		return up_score >= 2
	case .Shellfish:
		return up_score >= 4
	case .Strawberries:
		return up_score >= 8
	case .Tomatoes:
		return up_score >= 16
	case .Chocolate:
		return up_score >= 32
	case .Pollen:
		return up_score >= 64
	case .Cats:
		return up_score >= 128
	}
	return false
}

list :: proc(score: int) -> []Allergen {
	// Implement this procedure.
	binary_representation: [8]int
	up_score := score % 256
	i: u8 = 0
	binary_representation[i] = up_score >> i

	for i in 0 ..= 7 {
	}
	return nil
}
