package robot_simulator

Heading :: enum {
	North,
	East,
	South,
	West,
}

Position :: struct {
	x: int,
	y: int,
}

Robot :: struct {
	pos: Position,
	hd:  Heading,
}

create_robot :: proc(x, y: int, dir: Heading) -> Robot {
	// Implement this procedure.
	return Robot{pos = {x, y}, hd = dir}
}

follow_commands :: proc(r: ^Robot, cmds: string) {
	// Implement this procedure.
	for cmd in cmds {
		if cmd == 'R' {
			switch r.hd {
			case .North:
				r.hd = .East
			case .East:
				r.hd = .South
			case .South:
				r.hd = .West
			case .West:
				r.hd = .North
			}
		} else if cmd == 'L' {
			switch r.hd {
			case .North:
				r.hd = .West
			case .East:
				r.hd = .North
			case .South:
				r.hd = .East
			case .West:
				r.hd = .South
			}
		} else {
			switch r.hd {
			case .North:
				r.pos.y += 1
			case .South:
				r.pos.y -= 1
			case .East:
				r.pos.x += 1
			case .West:
				r.pos.x -= 1
			}
		}
	}
}
