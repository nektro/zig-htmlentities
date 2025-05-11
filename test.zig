const std = @import("std");
const htmlentities = @import("htmlentities");

test {
    try std.testing.expectEqual(@as(usize, 2231), htmlentities.ENTITIES.len);

    const aelig = htmlentities.lookup("&AElig").?;
    try std.testing.expectEqualStrings("&AElig", aelig.entity);
    try std.testing.expectEqual(htmlentities.Codepoints{ .Single = 198 }, aelig.codepoints);
    try std.testing.expectEqualStrings("Æ", aelig.characters);

    const afr = htmlentities.lookup("&Afr;").?;
    try std.testing.expectEqualStrings("&Afr;", afr.entity);
    try std.testing.expectEqual(htmlentities.Codepoints{ .Single = 120068 }, afr.codepoints);
    try std.testing.expectEqualStrings("𝔄", afr.characters);

    const bnequiv = htmlentities.lookup("&bnequiv;").?;
    try std.testing.expectEqualStrings("&bnequiv;", bnequiv.entity);
    try std.testing.expectEqual(htmlentities.Codepoints{ .Double = [2]u32{ 8801, 8421 } }, bnequiv.codepoints);
    try std.testing.expectEqualStrings("\u{2261}\u{20E5}", bnequiv.characters);
}
