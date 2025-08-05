pub const NucleotideError = error{Invalid};

pub const Counts = struct {
    a: u32,
    c: u32,
    g: u32,
    t: u32,
};

pub fn countNucleotides(s: []const u8) NucleotideError!Counts {
    var molecule = Counts{ .a = 0, .c = 0, .g = 0, .t = 0 };
    for (s) |c| {
        switch (c) {
            'A' => molecule.a += 1,
            'C' => molecule.c += 1,
            'G' => molecule.g += 1,
            'T' => molecule.t += 1,
            else => return NucleotideError.Invalid,
        }
    }
    return molecule;
}
