package darts
import "core:math"
score :: proc(x, y: f64) -> int {
	// Implement this procedure.
	point_dist := math.pow(x, 2) + math.pow(y, 2)
	switch {
	case point_dist <= 1.0:
		return 10
	case point_dist <= 25.0:
		return 5
	case point_dist <= 100.0:
		return 1
	case:
		return 0
	}
	return 0
}
