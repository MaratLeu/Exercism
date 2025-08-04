pub fn isIsogram(str: []const u8) bool {
    var array: [26]u8 = undefined;
    @memset(array[0..], 0);
    const lower = 97; // ascii of 'a'
    for (str) |c| {
        if (c == 32 or c == 45) continue;
        var char: u8 = c;
        if (c >= 65 and c <= 90) {
            char += 32; // upper to lower (i.e. A = 65, a = 97)
        }

        if (char < 97 or char > 122) continue;
        array[char - lower] += 1;
        if (array[char - lower] > 1) return false;
    }
    return true;
}
