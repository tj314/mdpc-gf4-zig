const std = @import("std");
const GF4 = @import("galois_fields/gf4.zig").GF4;
const Polynomial = @import("polynomial/polynomial.zig").Polynomial;

pub fn main() anyerror!void {
    var n1 = GF4.zero;
    var n2 = GF4.one;
    var n3 = n1.add(&n2);
    std.debug.print("{s}", .{n3.toStr()});

    _ = Polynomial(GF4);
}

test "basic test" {
    try std.testing.expectEqual(10, 3 + 7);
}
