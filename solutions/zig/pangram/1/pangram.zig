const std = @import("std");

pub fn isPangram(str: []const u8) bool {
    var pan_set = std.bit_set.ArrayBitSet(usize, 26).initEmpty();
    
    for (str) |char| {
        switch(char) {
        'a'...'z' => pan_set.set(char - 'a'),
        'A'...'Z' => pan_set.set(char - 'A'),
        else => continue,
        }
    }
    if (pan_set.count() == pan_set.capacity()) {
        return true;
    }
    return false;
}

