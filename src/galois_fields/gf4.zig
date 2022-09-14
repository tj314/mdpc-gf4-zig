pub const GF4 = enum(u2) {
    zero,
    one,
    alpha,
    alpha_plus_one,

    const Self = @This();

    pub fn add(self: *Self, other: *GF4) GF4 {
        return ADDITION[@enumToInt(self.*)][@enumToInt(other.*)];
    }

    pub fn sub(self: *Self, other: *GF4) GF4 {
        return ADDITION[@enumToInt(self.*)][@enumToInt(other.*)];
    }

    pub fn mul(self: *Self, other: *GF4) GF4 {
        return MULTIPLICATION[@enumToInt(self.*)][@enumToInt(other.*)];
    }

    pub fn div(self: *Self, other: *GF4) ?GF4 {
        if (other.* == GF4.zero) {
            return null;
        } else if (self.* == GF4.zero) {
            return GF4.zero;
        } else {
            return DIVISION[@enumToInt(self.*) - 1][@enumToInt(other.*)];
        }
    }

    pub fn toStr(self: Self) []const u8 {
        return switch(self) {
            GF4.zero => "zero",
            GF4.one => "one",
            GF4.alpha => "alpha",
            GF4.alpha_plus_one => "alpha + 1",
        };
    }
};

const ADDITION = [4][4]GF4{
    [_]GF4{GF4.zero, GF4.one, GF4.alpha, GF4.alpha_plus_one},
    [_]GF4{GF4.one, GF4.zero, GF4.alpha_plus_one, GF4.alpha},
    [_]GF4{GF4.alpha, GF4.alpha_plus_one, GF4.zero, GF4.one},
    [_]GF4{GF4.alpha_plus_one, GF4.alpha, GF4.one, GF4.zero},
};

const MULTIPLICATION = [4][4]GF4{
    [_]GF4{GF4.zero, GF4.zero, GF4.zero, GF4.zero},
    [_]GF4{GF4.zero, GF4.one, GF4.alpha, GF4.alpha_plus_one},
    [_]GF4{GF4.zero, GF4.alpha, GF4.alpha_plus_one, GF4.one},
    [_]GF4{GF4.zero, GF4.alpha_plus_one, GF4.one, GF4.alpha},
};

const DIVISION = [3][3]GF4{
    [_]GF4{GF4.one, GF4.alpha_plus_one, GF4.alpha},
    [_]GF4{GF4.alpha, GF4.one, GF4.alpha_plus_one},
    [_]GF4{GF4.alpha_plus_one, GF4.alpha, GF4.one},
};
