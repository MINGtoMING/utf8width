const std = @import("std");
const unicode = std.unicode;

pub const UnicodeVersion = @import("version.zig").UnicodeVersion;
pub const ZeroWidth = @import("tables/ZeroWidth.zig");
pub const EastAsianWidth = @import("tables/EastAsianWidth.zig");
pub const VariationSelector16 = @import("tables/VariationSelector16.zig");

pub fn utf8CodepointWidth(codepoint: u21, version: UnicodeVersion) !u3 {
    if (codepoint >= 0x20 and codepoint < 0x7F) {
        return 1;
    }

    if ((codepoint != 0 and codepoint < 0x20) or (codepoint >= 0x7F and codepoint < 0x0A0)) {
        return error.InvalidControlCharacterWidth;
    }

    if (ZeroWidth.init(version).contains(codepoint)) {
        return 0;
    }

    if (EastAsianWidth.init(version).contains(codepoint)) {
        return 2;
    } else {
        return 1;
    }
}

pub fn utf8SliceWidth(bytes: []const u8, version: UnicodeVersion) !usize {
    const utf8_view = try unicode.Utf8View.init(bytes);
    var utf8 = utf8_view.iterator();
    var width: usize = 0;
    var prev_codepoint: ?u21 = null;
    while (utf8.nextCodepoint()) |codepoint| {
        if (codepoint == 0x200D) {
            _ = utf8.nextCodepoint();
            continue;
        }

        if (codepoint == 0xFE0F and prev_codepoint != null) {
            if (VariationSelector16.init(version).contains(prev_codepoint.?)) {
                width += 1;
            }
            continue;
        }

        width += try utf8CodepointWidth(codepoint, version);
        prev_codepoint = codepoint;
    }
    return width;
}

const expect = std.testing.expect;
const expectError = std.testing.expectError;

test "empty_string" {
    const bytes: []const u8 = "";
    try expect(try utf8SliceWidth(bytes, .@"15.1.0") == 0);
}

test "ascii_string" {
    const bytes: []const u8 = "Hello Zig!";
    const utf8_view = try unicode.Utf8View.init(bytes);
    var utf8 = utf8_view.iterator();
    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 1);
    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 1);
    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 1);
    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 1);
    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 1);
    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 1);
    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 1);
    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 1);
    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 1);
    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 1);
    try expect(try utf8SliceWidth(bytes, .@"15.1.0") == 10);
}

test "east_asian_wide_string" {
    const bytes: []const u8 = "你干嘛!哎呦!";
    const utf8_view = try unicode.Utf8View.init(bytes);
    var utf8 = utf8_view.iterator();
    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 2);
    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 2);
    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 2);
    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 1);
    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 2);
    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 2);
    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 1);
    try std.testing.expect(try utf8SliceWidth(bytes, .@"15.1.0") == 12);
}

test "null_width_0" {
    const bytes: []const u8 = "a\x00f";
    const utf8_view = try unicode.Utf8View.init(bytes);
    var utf8 = utf8_view.iterator();
    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 1);
    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 0);
    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 1);
    try std.testing.expect(try utf8SliceWidth(bytes, .@"15.1.0") == 2);
}

test "control_c0_width_error" {
    const bytes: []const u8 = "\x1b[0m";
    const utf8_view = try unicode.Utf8View.init(bytes);
    var utf8 = utf8_view.iterator();

    try expectError(error.InvalidControlCharacterWidth, utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0"));
    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 1);
    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 1);
    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 1);
    try expectError(error.InvalidControlCharacterWidth, utf8SliceWidth(bytes, .@"15.1.0"));
}

test "conbining_width" {
    {
        const bytes: []const u8 = std.fmt.comptimePrint("--{u}--", .{0x05bf});
        const utf8_view = try unicode.Utf8View.init(bytes);
        var utf8 = utf8_view.iterator();

        try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 1);
        try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 1);
        try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 0);
        try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 1);
        try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 1);
        try std.testing.expect(try utf8SliceWidth(bytes, .@"15.1.0") == 4);
    }
    {
        const bytes: []const u8 = std.fmt.comptimePrint("cafe{u}", .{0x0301});
        const utf8_view = try unicode.Utf8View.init(bytes);
        var utf8 = utf8_view.iterator();

        try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 1);
        try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 1);
        try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 1);
        try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 1);
        try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 0);
        try std.testing.expect(try utf8SliceWidth(bytes, .@"15.1.0") == 4);
    }
    {
        const bytes: []const u8 = std.fmt.comptimePrint("{u}{u}", .{ 0x0410, 0x0488 });
        const utf8_view = try unicode.Utf8View.init(bytes);
        var utf8 = utf8_view.iterator();

        try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 1);
        try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 0);
        try std.testing.expect(try utf8SliceWidth(bytes, .@"15.1.0") == 1);
    }
}

test "balinese_script" {
    const bytes: []const u8 = std.fmt.comptimePrint("{u}{u}{u}{u}", .{ 0x1B13, 0x1B28, 0x1B2E, 0x1B44 });
    const utf8_view = try unicode.Utf8View.init(bytes);
    var utf8 = utf8_view.iterator();

    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 1);
    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 1);
    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 1);
    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 0);
    try std.testing.expect(try utf8SliceWidth(bytes, .@"15.1.0") == 3);
}

test "kr_jame" {
    const bytes: []const u8 = std.fmt.comptimePrint("{u}{u}", .{ 0x1100, 0x1161 });
    const utf8_view = try unicode.Utf8View.init(bytes);
    var utf8 = utf8_view.iterator();

    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 2);
    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 0);
    try std.testing.expect(try utf8SliceWidth(bytes, .@"15.1.0") == 2);
}

test "kr_jame_filler" {
    const bytes: []const u8 = std.fmt.comptimePrint("{u}{u}", .{ 0x1100, 0x1160 });
    const utf8_view = try unicode.Utf8View.init(bytes);
    var utf8 = utf8_view.iterator();

    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 2);
    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 0);
    try std.testing.expect(try utf8SliceWidth(bytes, .@"15.1.0") == 2);
}

test "devanagari_script" {
    const bytes: []const u8 = std.fmt.comptimePrint("{u}{u}{u}{u}", .{ 0x0915, 0x094D, 0x0937, 0x093F });
    const utf8_view = try unicode.Utf8View.init(bytes);
    var utf8 = utf8_view.iterator();

    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 1);
    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 0);
    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 1);
    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 0);
    try std.testing.expect(try utf8SliceWidth(bytes, .@"15.1.0") == 2);
}

test "tamil_script" {
    const bytes: []const u8 = std.fmt.comptimePrint("{u}{u}{u}{u}", .{ 0x0b95, 0x0bcd, 0x0bb7, 0x0bcc });
    const utf8_view = try unicode.Utf8View.init(bytes);
    var utf8 = utf8_view.iterator();

    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 1);
    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 0);
    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 1);
    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 0);
    try std.testing.expect(try utf8SliceWidth(bytes, .@"15.1.0") == 2);
}

test "kannada_script" {
    const bytes: []const u8 = std.fmt.comptimePrint("{u}{u}{u}{u}", .{ 0x0cb0, 0x0ccd, 0x0c9d, 0x0cc8 });
    const utf8_view = try unicode.Utf8View.init(bytes);
    var utf8 = utf8_view.iterator();

    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 1);
    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 0);
    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 1);
    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 0);
    try std.testing.expect(try utf8SliceWidth(bytes, .@"15.1.0") == 2);
}

test "kannada_script_2" {
    const bytes: []const u8 = std.fmt.comptimePrint("{u}{u}{u}{u}", .{ 0x0cb0, 0x0cbc, 0x0ccd, 0x0c9a });
    const utf8_view = try unicode.Utf8View.init(bytes);
    var utf8 = utf8_view.iterator();

    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 1);
    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 0);
    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 0);
    try expect(try utf8CodepointWidth(utf8.nextCodepoint().?, .@"15.1.0") == 1);
    try std.testing.expect(try utf8SliceWidth(bytes, .@"15.1.0") == 2);
}

test "zero_wide_conflict" {
    try expect(try utf8CodepointWidth(0x03029, .@"4.1.0") == 2);
    try expect(try utf8CodepointWidth(0x0302a, .@"4.1.0") == 0);
    try expect(try utf8CodepointWidth(0x03099, .@"4.1.0") == 0);
    try expect(try utf8CodepointWidth(0x0309a, .@"4.1.0") == 0);
    try expect(try utf8CodepointWidth(0x0309b, .@"4.1.0") == 2);
}