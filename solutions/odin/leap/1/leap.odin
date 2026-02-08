package leap

is_leap_year :: proc(year: int) -> bool {
	if year % 4 == 0 {
		if year % 100 == 0 && year % 400 != 0 {
			return false;
		}
		return true;
	}
	return false
}
