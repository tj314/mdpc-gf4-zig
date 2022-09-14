const Allocator = @import("std").mem.Allocator;
const ArrayList = @import("std").ArrayList;

pub fn Polynomial(comptime T: type) type {
    return struct {
        coeficients: ArrayList(T),

        pub fn init(alloc: Allocator) {
            coeficients.init(alloc);
        }
    };
}