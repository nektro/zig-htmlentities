const std = @import("std");
const testing = std.testing;

pub const Entity = struct {
    entity: []const u8,
    codepoints: Codepoints,
    characters: []const u8,
};

pub const Codepoints = union(enum) {
    Single: u32,
    Double: [2]u32,
};

pub const ENTITIES = @import("entities.zig").ENTITIES;

fn compare(lhs: Entity, rhs: Entity) std.math.Order {
    return std.mem.order(u8, lhs.entity, rhs.entity);
}

pub fn lookup(entity: []const u8) ?Entity {
    const context: Entity = .{ .entity = entity, .codepoints = .{ .Single = 0 }, .characters = "" };
    const maybe_index = std.sort.binarySearch(Entity, &ENTITIES, context, compare);

    if (maybe_index) |index| {
        return ENTITIES[index];
    }
    return null;
}
