package space_age

Planet :: enum {
	Mercury,
	Venus,
	Earth,
	Mars,
	Jupiter,
	Saturn,
	Uranus,
	Neptune,
}

age :: proc(planet: Planet, seconds: int) -> f64 {
	// Implement the procedure.
	age: f64 = cast(f64)seconds / 31557600; 
	switch planet {
		case .Mercury: age /= 0.2408467
		case .Venus: age /= 0.61519726
		case .Earth: age /= 1
		case .Mars: age /= 1.8808158
		case .Jupiter: age /= 11.862615
		case .Saturn: age /= 29.447498
		case .Uranus: age /= 84.016846
		case .Neptune: age /= 164.79132
	}	
	return age
}
