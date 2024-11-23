const std = @import("std");  
const UnicodeVersion = @import("../version.zig").UnicodeVersion;

const EastAsianWidth = @This();

version: UnicodeVersion,

pub inline fn init(version: UnicodeVersion) EastAsianWidth {
    return .{ .version = version };
}

pub inline fn contains(self: EastAsianWidth, codepoint: u21) bool {
    return switch (self.version) {
		.@"4.1.0" => switch (codepoint) {
			// Source: EastAsianWidth-4.1.0.txt
			// Date: 2005-03-17, 15:21:00 PST [KW]
			0x01100...0x01159, // Hangul Choseong Kiyeok  ..Hangul Choseong Yeorinhi
			0x0115f...0x0115f, // Hangul Choseong Filler
			0x02329...0x0232a, // Left-pointing Angle Brac..Right-pointing Angle Bra
			0x02e80...0x02e99, // Cjk Radical Repeat      ..Cjk Radical Rap
			0x02e9b...0x02ef3, // Cjk Radical Choke       ..Cjk Radical C-simplified
			0x02f00...0x02fd5, // Kangxi Radical One      ..Kangxi Radical Flute
			0x02ff0...0x02ffb, // Ideographic Description ..Ideographic Description
			0x03000...0x03029, // Ideographic Space       ..Hangzhou Numeral Nine
			0x03030...0x0303e, // Wavy Dash               ..Ideographic Variation In
			0x03041...0x03096, // Hiragana Letter Small A ..Hiragana Letter Small Ke
			0x0309b...0x030ff, // Katakana-hiragana Voiced..Katakana Digraph Koto
			0x03105...0x0312c, // Bopomofo Letter B       ..Bopomofo Letter Gn
			0x03131...0x0318e, // Hangul Letter Kiyeok    ..Hangul Letter Araeae
			0x03190...0x031b7, // Ideographic Annotation L..Bopomofo Final Letter H
			0x031c0...0x031cf, // Cjk Stroke T            ..Cjk Stroke N
			0x031f0...0x0321e, // Katakana Letter Small Ku..Parenthesized Korean Cha
			0x03220...0x03243, // Parenthesized Ideograph ..Parenthesized Ideograph
			0x03250...0x032fe, // Partnership Sign        ..Circled Katakana Wo
			0x03300...0x04db5, // Square Apaato           ..Cjk Unified Ideograph-4d
			0x04e00...0x09fbb, // Cjk Unified Ideograph-4e..Cjk Unified Ideograph-9f
			0x0a000...0x0a48c, // Yi Syllable It          ..Yi Syllable Yyr
			0x0a490...0x0a4c6, // Yi Radical Qot          ..Yi Radical Ke
			0x0ac00...0x0d7a3, // Hangul Syllable Ga      ..Hangul Syllable Hih
			0x0f900...0x0fa2d, // Cjk Compatibility Ideogr..Cjk Compatibility Ideogr
			0x0fa30...0x0fa6a, // Cjk Compatibility Ideogr..Cjk Compatibility Ideogr
			0x0fa70...0x0fad9, // Cjk Compatibility Ideogr..Cjk Compatibility Ideogr
			0x0fe10...0x0fe19, // Presentation Form For Ve..Presentation Form For Ve
			0x0fe30...0x0fe52, // Presentation Form For Ve..Small Full Stop
			0x0fe54...0x0fe66, // Small Semicolon         ..Small Equals Sign
			0x0fe68...0x0fe6b, // Small Reverse Solidus   ..Small Commercial At
			0x0ff01...0x0ff60, // Fullwidth Exclamation Ma..Fullwidth Right White Pa
			0x0ffe0...0x0ffe6, // Fullwidth Cent Sign     ..Fullwidth Won Sign
			0x20000...0x2fffd, // Cjk Unified Ideograph-20..(nil)
			0x30000...0x3fffd, // Cjk Unified Ideograph-30..(nil)
			=> true,
			else => false,
		},
		.@"5.0.0" => switch (codepoint) {
			// Source: EastAsianWidth-5.0.0.txt
			// Date: 2006-02-15, 14:39:00 PST [KW]
			0x01100...0x01159, // Hangul Choseong Kiyeok  ..Hangul Choseong Yeorinhi
			0x0115f...0x0115f, // Hangul Choseong Filler
			0x02329...0x0232a, // Left-pointing Angle Brac..Right-pointing Angle Bra
			0x02e80...0x02e99, // Cjk Radical Repeat      ..Cjk Radical Rap
			0x02e9b...0x02ef3, // Cjk Radical Choke       ..Cjk Radical C-simplified
			0x02f00...0x02fd5, // Kangxi Radical One      ..Kangxi Radical Flute
			0x02ff0...0x02ffb, // Ideographic Description ..Ideographic Description
			0x03000...0x03029, // Ideographic Space       ..Hangzhou Numeral Nine
			0x03030...0x0303e, // Wavy Dash               ..Ideographic Variation In
			0x03041...0x03096, // Hiragana Letter Small A ..Hiragana Letter Small Ke
			0x0309b...0x030ff, // Katakana-hiragana Voiced..Katakana Digraph Koto
			0x03105...0x0312c, // Bopomofo Letter B       ..Bopomofo Letter Gn
			0x03131...0x0318e, // Hangul Letter Kiyeok    ..Hangul Letter Araeae
			0x03190...0x031b7, // Ideographic Annotation L..Bopomofo Final Letter H
			0x031c0...0x031cf, // Cjk Stroke T            ..Cjk Stroke N
			0x031f0...0x0321e, // Katakana Letter Small Ku..Parenthesized Korean Cha
			0x03220...0x03243, // Parenthesized Ideograph ..Parenthesized Ideograph
			0x03250...0x032fe, // Partnership Sign        ..Circled Katakana Wo
			0x03300...0x04db5, // Square Apaato           ..Cjk Unified Ideograph-4d
			0x04e00...0x09fbb, // Cjk Unified Ideograph-4e..Cjk Unified Ideograph-9f
			0x0a000...0x0a48c, // Yi Syllable It          ..Yi Syllable Yyr
			0x0a490...0x0a4c6, // Yi Radical Qot          ..Yi Radical Ke
			0x0ac00...0x0d7a3, // Hangul Syllable Ga      ..Hangul Syllable Hih
			0x0f900...0x0fa2d, // Cjk Compatibility Ideogr..Cjk Compatibility Ideogr
			0x0fa30...0x0fa6a, // Cjk Compatibility Ideogr..Cjk Compatibility Ideogr
			0x0fa70...0x0fad9, // Cjk Compatibility Ideogr..Cjk Compatibility Ideogr
			0x0fe10...0x0fe19, // Presentation Form For Ve..Presentation Form For Ve
			0x0fe30...0x0fe52, // Presentation Form For Ve..Small Full Stop
			0x0fe54...0x0fe66, // Small Semicolon         ..Small Equals Sign
			0x0fe68...0x0fe6b, // Small Reverse Solidus   ..Small Commercial At
			0x0ff01...0x0ff60, // Fullwidth Exclamation Ma..Fullwidth Right White Pa
			0x0ffe0...0x0ffe6, // Fullwidth Cent Sign     ..Fullwidth Won Sign
			0x20000...0x2fffd, // Cjk Unified Ideograph-20..(nil)
			0x30000...0x3fffd, // Cjk Unified Ideograph-30..(nil)
			=> true,
			else => false,
		},
		.@"5.1.0" => switch (codepoint) {
			// Source: EastAsianWidth-5.1.0.txt
			// Date: 2008-03-20, 17:42:00 PDT [KW]
			0x01100...0x01159, // Hangul Choseong Kiyeok  ..Hangul Choseong Yeorinhi
			0x0115f...0x0115f, // Hangul Choseong Filler
			0x02329...0x0232a, // Left-pointing Angle Brac..Right-pointing Angle Bra
			0x02e80...0x02e99, // Cjk Radical Repeat      ..Cjk Radical Rap
			0x02e9b...0x02ef3, // Cjk Radical Choke       ..Cjk Radical C-simplified
			0x02f00...0x02fd5, // Kangxi Radical One      ..Kangxi Radical Flute
			0x02ff0...0x02ffb, // Ideographic Description ..Ideographic Description
			0x03000...0x03029, // Ideographic Space       ..Hangzhou Numeral Nine
			0x03030...0x0303e, // Wavy Dash               ..Ideographic Variation In
			0x03041...0x03096, // Hiragana Letter Small A ..Hiragana Letter Small Ke
			0x0309b...0x030ff, // Katakana-hiragana Voiced..Katakana Digraph Koto
			0x03105...0x0312d, // Bopomofo Letter B       ..Bopomofo Letter Ih
			0x03131...0x0318e, // Hangul Letter Kiyeok    ..Hangul Letter Araeae
			0x03190...0x031b7, // Ideographic Annotation L..Bopomofo Final Letter H
			0x031c0...0x031e3, // Cjk Stroke T            ..Cjk Stroke Q
			0x031f0...0x0321e, // Katakana Letter Small Ku..Parenthesized Korean Cha
			0x03220...0x03243, // Parenthesized Ideograph ..Parenthesized Ideograph
			0x03250...0x032fe, // Partnership Sign        ..Circled Katakana Wo
			0x03300...0x04db5, // Square Apaato           ..Cjk Unified Ideograph-4d
			0x04e00...0x09fc3, // Cjk Unified Ideograph-4e..Cjk Unified Ideograph-9f
			0x0a000...0x0a48c, // Yi Syllable It          ..Yi Syllable Yyr
			0x0a490...0x0a4c6, // Yi Radical Qot          ..Yi Radical Ke
			0x0ac00...0x0d7a3, // Hangul Syllable Ga      ..Hangul Syllable Hih
			0x0f900...0x0fa2d, // Cjk Compatibility Ideogr..Cjk Compatibility Ideogr
			0x0fa30...0x0fa6a, // Cjk Compatibility Ideogr..Cjk Compatibility Ideogr
			0x0fa70...0x0fad9, // Cjk Compatibility Ideogr..Cjk Compatibility Ideogr
			0x0fe10...0x0fe19, // Presentation Form For Ve..Presentation Form For Ve
			0x0fe30...0x0fe52, // Presentation Form For Ve..Small Full Stop
			0x0fe54...0x0fe66, // Small Semicolon         ..Small Equals Sign
			0x0fe68...0x0fe6b, // Small Reverse Solidus   ..Small Commercial At
			0x0ff01...0x0ff60, // Fullwidth Exclamation Ma..Fullwidth Right White Pa
			0x0ffe0...0x0ffe6, // Fullwidth Cent Sign     ..Fullwidth Won Sign
			0x20000...0x2fffd, // Cjk Unified Ideograph-20..(nil)
			0x30000...0x3fffd, // Cjk Unified Ideograph-30..(nil)
			=> true,
			else => false,
		},
		.@"5.2.0" => switch (codepoint) {
			// Source: EastAsianWidth-5.2.0.txt
			// Date: 2009-06-09, 17:47:00 PDT [KW]
			0x01100...0x0115f, // Hangul Choseong Kiyeok  ..Hangul Choseong Filler
			0x02329...0x0232a, // Left-pointing Angle Brac..Right-pointing Angle Bra
			0x02e80...0x02e99, // Cjk Radical Repeat      ..Cjk Radical Rap
			0x02e9b...0x02ef3, // Cjk Radical Choke       ..Cjk Radical C-simplified
			0x02f00...0x02fd5, // Kangxi Radical One      ..Kangxi Radical Flute
			0x02ff0...0x02ffb, // Ideographic Description ..Ideographic Description
			0x03000...0x03029, // Ideographic Space       ..Hangzhou Numeral Nine
			0x03030...0x0303e, // Wavy Dash               ..Ideographic Variation In
			0x03041...0x03096, // Hiragana Letter Small A ..Hiragana Letter Small Ke
			0x0309b...0x030ff, // Katakana-hiragana Voiced..Katakana Digraph Koto
			0x03105...0x0312d, // Bopomofo Letter B       ..Bopomofo Letter Ih
			0x03131...0x0318e, // Hangul Letter Kiyeok    ..Hangul Letter Araeae
			0x03190...0x031b7, // Ideographic Annotation L..Bopomofo Final Letter H
			0x031c0...0x031e3, // Cjk Stroke T            ..Cjk Stroke Q
			0x031f0...0x0321e, // Katakana Letter Small Ku..Parenthesized Korean Cha
			0x03220...0x03247, // Parenthesized Ideograph ..Circled Ideograph Koto
			0x03250...0x032fe, // Partnership Sign        ..Circled Katakana Wo
			0x03300...0x04dbf, // Square Apaato           ..Cjk Unified Ideograph-4d
			0x04e00...0x0a48c, // Cjk Unified Ideograph-4e..Yi Syllable Yyr
			0x0a490...0x0a4c6, // Yi Radical Qot          ..Yi Radical Ke
			0x0a960...0x0a97c, // Hangul Choseong Tikeut-m..Hangul Choseong Ssangyeo
			0x0ac00...0x0d7a3, // Hangul Syllable Ga      ..Hangul Syllable Hih
			0x0f900...0x0faff, // Cjk Compatibility Ideogr..(nil)
			0x0fe10...0x0fe19, // Presentation Form For Ve..Presentation Form For Ve
			0x0fe30...0x0fe52, // Presentation Form For Ve..Small Full Stop
			0x0fe54...0x0fe66, // Small Semicolon         ..Small Equals Sign
			0x0fe68...0x0fe6b, // Small Reverse Solidus   ..Small Commercial At
			0x0ff01...0x0ff60, // Fullwidth Exclamation Ma..Fullwidth Right White Pa
			0x0ffe0...0x0ffe6, // Fullwidth Cent Sign     ..Fullwidth Won Sign
			0x1f200...0x1f200, // Square Hiragana Hoka
			0x1f210...0x1f231, // Squared Cjk Unified Ideo..Squared Cjk Unified Ideo
			0x1f240...0x1f248, // Tortoise Shell Bracketed..Tortoise Shell Bracketed
			0x20000...0x2fffd, // Cjk Unified Ideograph-20..(nil)
			0x30000...0x3fffd, // Cjk Unified Ideograph-30..(nil)
			=> true,
			else => false,
		},
		.@"6.0.0" => switch (codepoint) {
			// Source: EastAsianWidth-6.0.0.txt
			// Date: 2010-08-17, 12:17:00 PDT [KW]
			0x01100...0x0115f, // Hangul Choseong Kiyeok  ..Hangul Choseong Filler
			0x02329...0x0232a, // Left-pointing Angle Brac..Right-pointing Angle Bra
			0x02e80...0x02e99, // Cjk Radical Repeat      ..Cjk Radical Rap
			0x02e9b...0x02ef3, // Cjk Radical Choke       ..Cjk Radical C-simplified
			0x02f00...0x02fd5, // Kangxi Radical One      ..Kangxi Radical Flute
			0x02ff0...0x02ffb, // Ideographic Description ..Ideographic Description
			0x03000...0x03029, // Ideographic Space       ..Hangzhou Numeral Nine
			0x03030...0x0303e, // Wavy Dash               ..Ideographic Variation In
			0x03041...0x03096, // Hiragana Letter Small A ..Hiragana Letter Small Ke
			0x0309b...0x030ff, // Katakana-hiragana Voiced..Katakana Digraph Koto
			0x03105...0x0312d, // Bopomofo Letter B       ..Bopomofo Letter Ih
			0x03131...0x0318e, // Hangul Letter Kiyeok    ..Hangul Letter Araeae
			0x03190...0x031ba, // Ideographic Annotation L..Bopomofo Letter Zy
			0x031c0...0x031e3, // Cjk Stroke T            ..Cjk Stroke Q
			0x031f0...0x0321e, // Katakana Letter Small Ku..Parenthesized Korean Cha
			0x03220...0x03247, // Parenthesized Ideograph ..Circled Ideograph Koto
			0x03250...0x032fe, // Partnership Sign        ..Circled Katakana Wo
			0x03300...0x04dbf, // Square Apaato           ..Cjk Unified Ideograph-4d
			0x04e00...0x0a48c, // Cjk Unified Ideograph-4e..Yi Syllable Yyr
			0x0a490...0x0a4c6, // Yi Radical Qot          ..Yi Radical Ke
			0x0a960...0x0a97c, // Hangul Choseong Tikeut-m..Hangul Choseong Ssangyeo
			0x0ac00...0x0d7a3, // Hangul Syllable Ga      ..Hangul Syllable Hih
			0x0f900...0x0faff, // Cjk Compatibility Ideogr..(nil)
			0x0fe10...0x0fe19, // Presentation Form For Ve..Presentation Form For Ve
			0x0fe30...0x0fe52, // Presentation Form For Ve..Small Full Stop
			0x0fe54...0x0fe66, // Small Semicolon         ..Small Equals Sign
			0x0fe68...0x0fe6b, // Small Reverse Solidus   ..Small Commercial At
			0x0ff01...0x0ff60, // Fullwidth Exclamation Ma..Fullwidth Right White Pa
			0x0ffe0...0x0ffe6, // Fullwidth Cent Sign     ..Fullwidth Won Sign
			0x1b000...0x1b001, // Katakana Letter Archaic ..Hiragana Letter Archaic
			0x1f200...0x1f202, // Square Hiragana Hoka    ..Squared Katakana Sa
			0x1f210...0x1f23a, // Squared Cjk Unified Ideo..Squared Cjk Unified Ideo
			0x1f240...0x1f248, // Tortoise Shell Bracketed..Tortoise Shell Bracketed
			0x1f250...0x1f251, // Circled Ideograph Advant..Circled Ideograph Accept
			0x20000...0x2fffd, // Cjk Unified Ideograph-20..(nil)
			0x30000...0x3fffd, // Cjk Unified Ideograph-30..(nil)
			=> true,
			else => false,
		},
		.@"6.1.0" => switch (codepoint) {
			// Source: EastAsianWidth-6.1.0.txt
			// Date: 2011-09-19, 18:46:00 GMT [KW]
			0x01100...0x0115f, // Hangul Choseong Kiyeok  ..Hangul Choseong Filler
			0x02329...0x0232a, // Left-pointing Angle Brac..Right-pointing Angle Bra
			0x02e80...0x02e99, // Cjk Radical Repeat      ..Cjk Radical Rap
			0x02e9b...0x02ef3, // Cjk Radical Choke       ..Cjk Radical C-simplified
			0x02f00...0x02fd5, // Kangxi Radical One      ..Kangxi Radical Flute
			0x02ff0...0x02ffb, // Ideographic Description ..Ideographic Description
			0x03000...0x03029, // Ideographic Space       ..Hangzhou Numeral Nine
			0x03030...0x0303e, // Wavy Dash               ..Ideographic Variation In
			0x03041...0x03096, // Hiragana Letter Small A ..Hiragana Letter Small Ke
			0x0309b...0x030ff, // Katakana-hiragana Voiced..Katakana Digraph Koto
			0x03105...0x0312d, // Bopomofo Letter B       ..Bopomofo Letter Ih
			0x03131...0x0318e, // Hangul Letter Kiyeok    ..Hangul Letter Araeae
			0x03190...0x031ba, // Ideographic Annotation L..Bopomofo Letter Zy
			0x031c0...0x031e3, // Cjk Stroke T            ..Cjk Stroke Q
			0x031f0...0x0321e, // Katakana Letter Small Ku..Parenthesized Korean Cha
			0x03220...0x03247, // Parenthesized Ideograph ..Circled Ideograph Koto
			0x03250...0x032fe, // Partnership Sign        ..Circled Katakana Wo
			0x03300...0x04dbf, // Square Apaato           ..Cjk Unified Ideograph-4d
			0x04e00...0x0a48c, // Cjk Unified Ideograph-4e..Yi Syllable Yyr
			0x0a490...0x0a4c6, // Yi Radical Qot          ..Yi Radical Ke
			0x0a960...0x0a97c, // Hangul Choseong Tikeut-m..Hangul Choseong Ssangyeo
			0x0ac00...0x0d7a3, // Hangul Syllable Ga      ..Hangul Syllable Hih
			0x0f900...0x0faff, // Cjk Compatibility Ideogr..(nil)
			0x0fe10...0x0fe19, // Presentation Form For Ve..Presentation Form For Ve
			0x0fe30...0x0fe52, // Presentation Form For Ve..Small Full Stop
			0x0fe54...0x0fe66, // Small Semicolon         ..Small Equals Sign
			0x0fe68...0x0fe6b, // Small Reverse Solidus   ..Small Commercial At
			0x0ff01...0x0ff60, // Fullwidth Exclamation Ma..Fullwidth Right White Pa
			0x0ffe0...0x0ffe6, // Fullwidth Cent Sign     ..Fullwidth Won Sign
			0x1b000...0x1b001, // Katakana Letter Archaic ..Hiragana Letter Archaic
			0x1f200...0x1f202, // Square Hiragana Hoka    ..Squared Katakana Sa
			0x1f210...0x1f23a, // Squared Cjk Unified Ideo..Squared Cjk Unified Ideo
			0x1f240...0x1f248, // Tortoise Shell Bracketed..Tortoise Shell Bracketed
			0x1f250...0x1f251, // Circled Ideograph Advant..Circled Ideograph Accept
			0x20000...0x2fffd, // Cjk Unified Ideograph-20..(nil)
			0x30000...0x3fffd, // Cjk Unified Ideograph-30..(nil)
			=> true,
			else => false,
		},
		.@"6.2.0" => switch (codepoint) {
			// Source: EastAsianWidth-6.2.0.txt
			// Date: 2012-05-15, 18:30:00 GMT [KW]
			0x01100...0x0115f, // Hangul Choseong Kiyeok  ..Hangul Choseong Filler
			0x02329...0x0232a, // Left-pointing Angle Brac..Right-pointing Angle Bra
			0x02e80...0x02e99, // Cjk Radical Repeat      ..Cjk Radical Rap
			0x02e9b...0x02ef3, // Cjk Radical Choke       ..Cjk Radical C-simplified
			0x02f00...0x02fd5, // Kangxi Radical One      ..Kangxi Radical Flute
			0x02ff0...0x02ffb, // Ideographic Description ..Ideographic Description
			0x03000...0x03029, // Ideographic Space       ..Hangzhou Numeral Nine
			0x03030...0x0303e, // Wavy Dash               ..Ideographic Variation In
			0x03041...0x03096, // Hiragana Letter Small A ..Hiragana Letter Small Ke
			0x0309b...0x030ff, // Katakana-hiragana Voiced..Katakana Digraph Koto
			0x03105...0x0312d, // Bopomofo Letter B       ..Bopomofo Letter Ih
			0x03131...0x0318e, // Hangul Letter Kiyeok    ..Hangul Letter Araeae
			0x03190...0x031ba, // Ideographic Annotation L..Bopomofo Letter Zy
			0x031c0...0x031e3, // Cjk Stroke T            ..Cjk Stroke Q
			0x031f0...0x0321e, // Katakana Letter Small Ku..Parenthesized Korean Cha
			0x03220...0x03247, // Parenthesized Ideograph ..Circled Ideograph Koto
			0x03250...0x032fe, // Partnership Sign        ..Circled Katakana Wo
			0x03300...0x04dbf, // Square Apaato           ..Cjk Unified Ideograph-4d
			0x04e00...0x0a48c, // Cjk Unified Ideograph-4e..Yi Syllable Yyr
			0x0a490...0x0a4c6, // Yi Radical Qot          ..Yi Radical Ke
			0x0a960...0x0a97c, // Hangul Choseong Tikeut-m..Hangul Choseong Ssangyeo
			0x0ac00...0x0d7a3, // Hangul Syllable Ga      ..Hangul Syllable Hih
			0x0f900...0x0faff, // Cjk Compatibility Ideogr..(nil)
			0x0fe10...0x0fe19, // Presentation Form For Ve..Presentation Form For Ve
			0x0fe30...0x0fe52, // Presentation Form For Ve..Small Full Stop
			0x0fe54...0x0fe66, // Small Semicolon         ..Small Equals Sign
			0x0fe68...0x0fe6b, // Small Reverse Solidus   ..Small Commercial At
			0x0ff01...0x0ff60, // Fullwidth Exclamation Ma..Fullwidth Right White Pa
			0x0ffe0...0x0ffe6, // Fullwidth Cent Sign     ..Fullwidth Won Sign
			0x1b000...0x1b001, // Katakana Letter Archaic ..Hiragana Letter Archaic
			0x1f200...0x1f202, // Square Hiragana Hoka    ..Squared Katakana Sa
			0x1f210...0x1f23a, // Squared Cjk Unified Ideo..Squared Cjk Unified Ideo
			0x1f240...0x1f248, // Tortoise Shell Bracketed..Tortoise Shell Bracketed
			0x1f250...0x1f251, // Circled Ideograph Advant..Circled Ideograph Accept
			0x20000...0x2fffd, // Cjk Unified Ideograph-20..(nil)
			0x30000...0x3fffd, // Cjk Unified Ideograph-30..(nil)
			=> true,
			else => false,
		},
		.@"6.3.0" => switch (codepoint) {
			// Source: EastAsianWidth-6.3.0.txt
			// Date: 2013-02-05, 20:09:00 GMT [KW, LI]
			0x01100...0x0115f, // Hangul Choseong Kiyeok  ..Hangul Choseong Filler
			0x02329...0x0232a, // Left-pointing Angle Brac..Right-pointing Angle Bra
			0x02e80...0x02e99, // Cjk Radical Repeat      ..Cjk Radical Rap
			0x02e9b...0x02ef3, // Cjk Radical Choke       ..Cjk Radical C-simplified
			0x02f00...0x02fd5, // Kangxi Radical One      ..Kangxi Radical Flute
			0x02ff0...0x02ffb, // Ideographic Description ..Ideographic Description
			0x03000...0x03029, // Ideographic Space       ..Hangzhou Numeral Nine
			0x03030...0x0303e, // Wavy Dash               ..Ideographic Variation In
			0x03041...0x03096, // Hiragana Letter Small A ..Hiragana Letter Small Ke
			0x0309b...0x030ff, // Katakana-hiragana Voiced..Katakana Digraph Koto
			0x03105...0x0312d, // Bopomofo Letter B       ..Bopomofo Letter Ih
			0x03131...0x0318e, // Hangul Letter Kiyeok    ..Hangul Letter Araeae
			0x03190...0x031ba, // Ideographic Annotation L..Bopomofo Letter Zy
			0x031c0...0x031e3, // Cjk Stroke T            ..Cjk Stroke Q
			0x031f0...0x0321e, // Katakana Letter Small Ku..Parenthesized Korean Cha
			0x03220...0x03247, // Parenthesized Ideograph ..Circled Ideograph Koto
			0x03250...0x032fe, // Partnership Sign        ..Circled Katakana Wo
			0x03300...0x04dbf, // Square Apaato           ..Cjk Unified Ideograph-4d
			0x04e00...0x0a48c, // Cjk Unified Ideograph-4e..Yi Syllable Yyr
			0x0a490...0x0a4c6, // Yi Radical Qot          ..Yi Radical Ke
			0x0a960...0x0a97c, // Hangul Choseong Tikeut-m..Hangul Choseong Ssangyeo
			0x0ac00...0x0d7a3, // Hangul Syllable Ga      ..Hangul Syllable Hih
			0x0f900...0x0faff, // Cjk Compatibility Ideogr..(nil)
			0x0fe10...0x0fe19, // Presentation Form For Ve..Presentation Form For Ve
			0x0fe30...0x0fe52, // Presentation Form For Ve..Small Full Stop
			0x0fe54...0x0fe66, // Small Semicolon         ..Small Equals Sign
			0x0fe68...0x0fe6b, // Small Reverse Solidus   ..Small Commercial At
			0x0ff01...0x0ff60, // Fullwidth Exclamation Ma..Fullwidth Right White Pa
			0x0ffe0...0x0ffe6, // Fullwidth Cent Sign     ..Fullwidth Won Sign
			0x1b000...0x1b001, // Katakana Letter Archaic ..Hiragana Letter Archaic
			0x1f200...0x1f202, // Square Hiragana Hoka    ..Squared Katakana Sa
			0x1f210...0x1f23a, // Squared Cjk Unified Ideo..Squared Cjk Unified Ideo
			0x1f240...0x1f248, // Tortoise Shell Bracketed..Tortoise Shell Bracketed
			0x1f250...0x1f251, // Circled Ideograph Advant..Circled Ideograph Accept
			0x20000...0x2fffd, // Cjk Unified Ideograph-20..(nil)
			0x30000...0x3fffd, // Cjk Unified Ideograph-30..(nil)
			=> true,
			else => false,
		},
		.@"7.0.0" => switch (codepoint) {
			// Source: EastAsianWidth-7.0.0.txt
			// Date: 2014-02-28, 23:15:00 GMT [KW, LI]
			0x01100...0x0115f, // Hangul Choseong Kiyeok  ..Hangul Choseong Filler
			0x02329...0x0232a, // Left-pointing Angle Brac..Right-pointing Angle Bra
			0x02e80...0x02e99, // Cjk Radical Repeat      ..Cjk Radical Rap
			0x02e9b...0x02ef3, // Cjk Radical Choke       ..Cjk Radical C-simplified
			0x02f00...0x02fd5, // Kangxi Radical One      ..Kangxi Radical Flute
			0x02ff0...0x02ffb, // Ideographic Description ..Ideographic Description
			0x03000...0x03029, // Ideographic Space       ..Hangzhou Numeral Nine
			0x03030...0x0303e, // Wavy Dash               ..Ideographic Variation In
			0x03041...0x03096, // Hiragana Letter Small A ..Hiragana Letter Small Ke
			0x0309b...0x030ff, // Katakana-hiragana Voiced..Katakana Digraph Koto
			0x03105...0x0312d, // Bopomofo Letter B       ..Bopomofo Letter Ih
			0x03131...0x0318e, // Hangul Letter Kiyeok    ..Hangul Letter Araeae
			0x03190...0x031ba, // Ideographic Annotation L..Bopomofo Letter Zy
			0x031c0...0x031e3, // Cjk Stroke T            ..Cjk Stroke Q
			0x031f0...0x0321e, // Katakana Letter Small Ku..Parenthesized Korean Cha
			0x03220...0x03247, // Parenthesized Ideograph ..Circled Ideograph Koto
			0x03250...0x032fe, // Partnership Sign        ..Circled Katakana Wo
			0x03300...0x04dbf, // Square Apaato           ..Cjk Unified Ideograph-4d
			0x04e00...0x0a48c, // Cjk Unified Ideograph-4e..Yi Syllable Yyr
			0x0a490...0x0a4c6, // Yi Radical Qot          ..Yi Radical Ke
			0x0a960...0x0a97c, // Hangul Choseong Tikeut-m..Hangul Choseong Ssangyeo
			0x0ac00...0x0d7a3, // Hangul Syllable Ga      ..Hangul Syllable Hih
			0x0f900...0x0faff, // Cjk Compatibility Ideogr..(nil)
			0x0fe10...0x0fe19, // Presentation Form For Ve..Presentation Form For Ve
			0x0fe30...0x0fe52, // Presentation Form For Ve..Small Full Stop
			0x0fe54...0x0fe66, // Small Semicolon         ..Small Equals Sign
			0x0fe68...0x0fe6b, // Small Reverse Solidus   ..Small Commercial At
			0x0ff01...0x0ff60, // Fullwidth Exclamation Ma..Fullwidth Right White Pa
			0x0ffe0...0x0ffe6, // Fullwidth Cent Sign     ..Fullwidth Won Sign
			0x1b000...0x1b001, // Katakana Letter Archaic ..Hiragana Letter Archaic
			0x1f200...0x1f202, // Square Hiragana Hoka    ..Squared Katakana Sa
			0x1f210...0x1f23a, // Squared Cjk Unified Ideo..Squared Cjk Unified Ideo
			0x1f240...0x1f248, // Tortoise Shell Bracketed..Tortoise Shell Bracketed
			0x1f250...0x1f251, // Circled Ideograph Advant..Circled Ideograph Accept
			0x20000...0x2fffd, // Cjk Unified Ideograph-20..(nil)
			0x30000...0x3fffd, // Cjk Unified Ideograph-30..(nil)
			=> true,
			else => false,
		},
		.@"8.0.0" => switch (codepoint) {
			// Source: EastAsianWidth-8.0.0.txt
			// Date: 2015-02-10, 21:00:00 GMT [KW, LI]
			0x01100...0x0115f, // Hangul Choseong Kiyeok  ..Hangul Choseong Filler
			0x02329...0x0232a, // Left-pointing Angle Brac..Right-pointing Angle Bra
			0x02e80...0x02e99, // Cjk Radical Repeat      ..Cjk Radical Rap
			0x02e9b...0x02ef3, // Cjk Radical Choke       ..Cjk Radical C-simplified
			0x02f00...0x02fd5, // Kangxi Radical One      ..Kangxi Radical Flute
			0x02ff0...0x02ffb, // Ideographic Description ..Ideographic Description
			0x03000...0x03029, // Ideographic Space       ..Hangzhou Numeral Nine
			0x03030...0x0303e, // Wavy Dash               ..Ideographic Variation In
			0x03041...0x03096, // Hiragana Letter Small A ..Hiragana Letter Small Ke
			0x0309b...0x030ff, // Katakana-hiragana Voiced..Katakana Digraph Koto
			0x03105...0x0312d, // Bopomofo Letter B       ..Bopomofo Letter Ih
			0x03131...0x0318e, // Hangul Letter Kiyeok    ..Hangul Letter Araeae
			0x03190...0x031ba, // Ideographic Annotation L..Bopomofo Letter Zy
			0x031c0...0x031e3, // Cjk Stroke T            ..Cjk Stroke Q
			0x031f0...0x0321e, // Katakana Letter Small Ku..Parenthesized Korean Cha
			0x03220...0x03247, // Parenthesized Ideograph ..Circled Ideograph Koto
			0x03250...0x032fe, // Partnership Sign        ..Circled Katakana Wo
			0x03300...0x04dbf, // Square Apaato           ..Cjk Unified Ideograph-4d
			0x04e00...0x0a48c, // Cjk Unified Ideograph-4e..Yi Syllable Yyr
			0x0a490...0x0a4c6, // Yi Radical Qot          ..Yi Radical Ke
			0x0a960...0x0a97c, // Hangul Choseong Tikeut-m..Hangul Choseong Ssangyeo
			0x0ac00...0x0d7a3, // Hangul Syllable Ga      ..Hangul Syllable Hih
			0x0f900...0x0faff, // Cjk Compatibility Ideogr..(nil)
			0x0fe10...0x0fe19, // Presentation Form For Ve..Presentation Form For Ve
			0x0fe30...0x0fe52, // Presentation Form For Ve..Small Full Stop
			0x0fe54...0x0fe66, // Small Semicolon         ..Small Equals Sign
			0x0fe68...0x0fe6b, // Small Reverse Solidus   ..Small Commercial At
			0x0ff01...0x0ff60, // Fullwidth Exclamation Ma..Fullwidth Right White Pa
			0x0ffe0...0x0ffe6, // Fullwidth Cent Sign     ..Fullwidth Won Sign
			0x1b000...0x1b001, // Katakana Letter Archaic ..Hiragana Letter Archaic
			0x1f200...0x1f202, // Square Hiragana Hoka    ..Squared Katakana Sa
			0x1f210...0x1f23a, // Squared Cjk Unified Ideo..Squared Cjk Unified Ideo
			0x1f240...0x1f248, // Tortoise Shell Bracketed..Tortoise Shell Bracketed
			0x1f250...0x1f251, // Circled Ideograph Advant..Circled Ideograph Accept
			0x20000...0x2fffd, // Cjk Unified Ideograph-20..(nil)
			0x30000...0x3fffd, // Cjk Unified Ideograph-30..(nil)
			=> true,
			else => false,
		},
		.@"9.0.0" => switch (codepoint) {
			// Source: EastAsianWidth-9.0.0.txt
			// Date: 2016-05-27, 17:00:00 GMT [KW, LI]
			0x01100...0x0115f, // Hangul Choseong Kiyeok  ..Hangul Choseong Filler
			0x0231a...0x0231b, // Watch                   ..Hourglass
			0x02329...0x0232a, // Left-pointing Angle Brac..Right-pointing Angle Bra
			0x023e9...0x023ec, // Black Right-pointing Dou..Black Down-pointing Doub
			0x023f0...0x023f0, // Alarm Clock
			0x023f3...0x023f3, // Hourglass With Flowing Sand
			0x025fd...0x025fe, // White Medium Small Squar..Black Medium Small Squar
			0x02614...0x02615, // Umbrella With Rain Drops..Hot Beverage
			0x02648...0x02653, // Aries                   ..Pisces
			0x0267f...0x0267f, // Wheelchair Symbol
			0x02693...0x02693, // Anchor
			0x026a1...0x026a1, // High Voltage Sign
			0x026aa...0x026ab, // Medium White Circle     ..Medium Black Circle
			0x026bd...0x026be, // Soccer Ball             ..Baseball
			0x026c4...0x026c5, // Snowman Without Snow    ..Sun Behind Cloud
			0x026ce...0x026ce, // Ophiuchus
			0x026d4...0x026d4, // No Entry
			0x026ea...0x026ea, // Church
			0x026f2...0x026f3, // Fountain                ..Flag In Hole
			0x026f5...0x026f5, // Sailboat
			0x026fa...0x026fa, // Tent
			0x026fd...0x026fd, // Fuel Pump
			0x02705...0x02705, // White Heavy Check Mark
			0x0270a...0x0270b, // Raised Fist             ..Raised Hand
			0x02728...0x02728, // Sparkles
			0x0274c...0x0274c, // Cross Mark
			0x0274e...0x0274e, // Negative Squared Cross Mark
			0x02753...0x02755, // Black Question Mark Orna..White Exclamation Mark O
			0x02757...0x02757, // Heavy Exclamation Mark Symbol
			0x02795...0x02797, // Heavy Plus Sign         ..Heavy Division Sign
			0x027b0...0x027b0, // Curly Loop
			0x027bf...0x027bf, // Double Curly Loop
			0x02b1b...0x02b1c, // Black Large Square      ..White Large Square
			0x02b50...0x02b50, // White Medium Star
			0x02b55...0x02b55, // Heavy Large Circle
			0x02e80...0x02e99, // Cjk Radical Repeat      ..Cjk Radical Rap
			0x02e9b...0x02ef3, // Cjk Radical Choke       ..Cjk Radical C-simplified
			0x02f00...0x02fd5, // Kangxi Radical One      ..Kangxi Radical Flute
			0x02ff0...0x02ffb, // Ideographic Description ..Ideographic Description
			0x03000...0x03029, // Ideographic Space       ..Hangzhou Numeral Nine
			0x03030...0x0303e, // Wavy Dash               ..Ideographic Variation In
			0x03041...0x03096, // Hiragana Letter Small A ..Hiragana Letter Small Ke
			0x0309b...0x030ff, // Katakana-hiragana Voiced..Katakana Digraph Koto
			0x03105...0x0312d, // Bopomofo Letter B       ..Bopomofo Letter Ih
			0x03131...0x0318e, // Hangul Letter Kiyeok    ..Hangul Letter Araeae
			0x03190...0x031ba, // Ideographic Annotation L..Bopomofo Letter Zy
			0x031c0...0x031e3, // Cjk Stroke T            ..Cjk Stroke Q
			0x031f0...0x0321e, // Katakana Letter Small Ku..Parenthesized Korean Cha
			0x03220...0x03247, // Parenthesized Ideograph ..Circled Ideograph Koto
			0x03250...0x032fe, // Partnership Sign        ..Circled Katakana Wo
			0x03300...0x04dbf, // Square Apaato           ..Cjk Unified Ideograph-4d
			0x04e00...0x0a48c, // Cjk Unified Ideograph-4e..Yi Syllable Yyr
			0x0a490...0x0a4c6, // Yi Radical Qot          ..Yi Radical Ke
			0x0a960...0x0a97c, // Hangul Choseong Tikeut-m..Hangul Choseong Ssangyeo
			0x0ac00...0x0d7a3, // Hangul Syllable Ga      ..Hangul Syllable Hih
			0x0f900...0x0faff, // Cjk Compatibility Ideogr..(nil)
			0x0fe10...0x0fe19, // Presentation Form For Ve..Presentation Form For Ve
			0x0fe30...0x0fe52, // Presentation Form For Ve..Small Full Stop
			0x0fe54...0x0fe66, // Small Semicolon         ..Small Equals Sign
			0x0fe68...0x0fe6b, // Small Reverse Solidus   ..Small Commercial At
			0x0ff01...0x0ff60, // Fullwidth Exclamation Ma..Fullwidth Right White Pa
			0x0ffe0...0x0ffe6, // Fullwidth Cent Sign     ..Fullwidth Won Sign
			0x16fe0...0x16fe0, // Tangut Iteration Mark
			0x17000...0x187ec, // (nil)
			0x18800...0x18af2, // Tangut Component-001    ..Tangut Component-755
			0x1b000...0x1b001, // Katakana Letter Archaic ..Hiragana Letter Archaic
			0x1f004...0x1f004, // Mahjong Tile Red Dragon
			0x1f0cf...0x1f0cf, // Playing Card Black Joker
			0x1f18e...0x1f18e, // Negative Squared Ab
			0x1f191...0x1f19a, // Squared Cl              ..Squared Vs
			0x1f200...0x1f202, // Square Hiragana Hoka    ..Squared Katakana Sa
			0x1f210...0x1f23b, // Squared Cjk Unified Ideo..Squared Cjk Unified Ideo
			0x1f240...0x1f248, // Tortoise Shell Bracketed..Tortoise Shell Bracketed
			0x1f250...0x1f251, // Circled Ideograph Advant..Circled Ideograph Accept
			0x1f300...0x1f320, // Cyclone                 ..Shooting Star
			0x1f32d...0x1f335, // Hot Dog                 ..Cactus
			0x1f337...0x1f37c, // Tulip                   ..Baby Bottle
			0x1f37e...0x1f393, // Bottle With Popping Cork..Graduation Cap
			0x1f3a0...0x1f3ca, // Carousel Horse          ..Swimmer
			0x1f3cf...0x1f3d3, // Cricket Bat And Ball    ..Table Tennis Paddle And
			0x1f3e0...0x1f3f0, // House Building          ..European Castle
			0x1f3f4...0x1f3f4, // Waving Black Flag
			0x1f3f8...0x1f3fa, // Badminton Racquet And Sh..Amphora
			0x1f400...0x1f43e, // Rat                     ..Paw Prints
			0x1f440...0x1f440, // Eyes
			0x1f442...0x1f4fc, // Ear                     ..Videocassette
			0x1f4ff...0x1f53d, // Prayer Beads            ..Down-pointing Small Red
			0x1f54b...0x1f54e, // Kaaba                   ..Menorah With Nine Branch
			0x1f550...0x1f567, // Clock Face One Oclock   ..Clock Face Twelve-thirty
			0x1f57a...0x1f57a, // Man Dancing
			0x1f595...0x1f596, // Reversed Hand With Middl..Raised Hand With Part Be
			0x1f5a4...0x1f5a4, // Black Heart
			0x1f5fb...0x1f64f, // Mount Fuji              ..Person With Folded Hands
			0x1f680...0x1f6c5, // Rocket                  ..Left Luggage
			0x1f6cc...0x1f6cc, // Sleeping Accommodation
			0x1f6d0...0x1f6d2, // Place Of Worship        ..Shopping Trolley
			0x1f6eb...0x1f6ec, // Airplane Departure      ..Airplane Arriving
			0x1f6f4...0x1f6f6, // Scooter                 ..Canoe
			0x1f910...0x1f91e, // Zipper-mouth Face       ..Hand With Index And Midd
			0x1f920...0x1f927, // Face With Cowboy Hat    ..Sneezing Face
			0x1f930...0x1f930, // Pregnant Woman
			0x1f933...0x1f93e, // Selfie                  ..Handball
			0x1f940...0x1f94b, // Wilted Flower           ..Martial Arts Uniform
			0x1f950...0x1f95e, // Croissant               ..Pancakes
			0x1f980...0x1f991, // Crab                    ..Squid
			0x1f9c0...0x1f9c0, // Cheese Wedge
			0x20000...0x2fffd, // Cjk Unified Ideograph-20..(nil)
			0x30000...0x3fffd, // Cjk Unified Ideograph-30..(nil)
			=> true,
			else => false,
		},
		.@"10.0.0" => switch (codepoint) {
			// Source: EastAsianWidth-10.0.0.txt
			// Date: 2017-03-08, 02:00:00 GMT [KW, LI]
			0x01100...0x0115f, // Hangul Choseong Kiyeok  ..Hangul Choseong Filler
			0x0231a...0x0231b, // Watch                   ..Hourglass
			0x02329...0x0232a, // Left-pointing Angle Brac..Right-pointing Angle Bra
			0x023e9...0x023ec, // Black Right-pointing Dou..Black Down-pointing Doub
			0x023f0...0x023f0, // Alarm Clock
			0x023f3...0x023f3, // Hourglass With Flowing Sand
			0x025fd...0x025fe, // White Medium Small Squar..Black Medium Small Squar
			0x02614...0x02615, // Umbrella With Rain Drops..Hot Beverage
			0x02648...0x02653, // Aries                   ..Pisces
			0x0267f...0x0267f, // Wheelchair Symbol
			0x02693...0x02693, // Anchor
			0x026a1...0x026a1, // High Voltage Sign
			0x026aa...0x026ab, // Medium White Circle     ..Medium Black Circle
			0x026bd...0x026be, // Soccer Ball             ..Baseball
			0x026c4...0x026c5, // Snowman Without Snow    ..Sun Behind Cloud
			0x026ce...0x026ce, // Ophiuchus
			0x026d4...0x026d4, // No Entry
			0x026ea...0x026ea, // Church
			0x026f2...0x026f3, // Fountain                ..Flag In Hole
			0x026f5...0x026f5, // Sailboat
			0x026fa...0x026fa, // Tent
			0x026fd...0x026fd, // Fuel Pump
			0x02705...0x02705, // White Heavy Check Mark
			0x0270a...0x0270b, // Raised Fist             ..Raised Hand
			0x02728...0x02728, // Sparkles
			0x0274c...0x0274c, // Cross Mark
			0x0274e...0x0274e, // Negative Squared Cross Mark
			0x02753...0x02755, // Black Question Mark Orna..White Exclamation Mark O
			0x02757...0x02757, // Heavy Exclamation Mark Symbol
			0x02795...0x02797, // Heavy Plus Sign         ..Heavy Division Sign
			0x027b0...0x027b0, // Curly Loop
			0x027bf...0x027bf, // Double Curly Loop
			0x02b1b...0x02b1c, // Black Large Square      ..White Large Square
			0x02b50...0x02b50, // White Medium Star
			0x02b55...0x02b55, // Heavy Large Circle
			0x02e80...0x02e99, // Cjk Radical Repeat      ..Cjk Radical Rap
			0x02e9b...0x02ef3, // Cjk Radical Choke       ..Cjk Radical C-simplified
			0x02f00...0x02fd5, // Kangxi Radical One      ..Kangxi Radical Flute
			0x02ff0...0x02ffb, // Ideographic Description ..Ideographic Description
			0x03000...0x03029, // Ideographic Space       ..Hangzhou Numeral Nine
			0x03030...0x0303e, // Wavy Dash               ..Ideographic Variation In
			0x03041...0x03096, // Hiragana Letter Small A ..Hiragana Letter Small Ke
			0x0309b...0x030ff, // Katakana-hiragana Voiced..Katakana Digraph Koto
			0x03105...0x0312e, // Bopomofo Letter B       ..Bopomofo Letter O With D
			0x03131...0x0318e, // Hangul Letter Kiyeok    ..Hangul Letter Araeae
			0x03190...0x031ba, // Ideographic Annotation L..Bopomofo Letter Zy
			0x031c0...0x031e3, // Cjk Stroke T            ..Cjk Stroke Q
			0x031f0...0x0321e, // Katakana Letter Small Ku..Parenthesized Korean Cha
			0x03220...0x03247, // Parenthesized Ideograph ..Circled Ideograph Koto
			0x03250...0x032fe, // Partnership Sign        ..Circled Katakana Wo
			0x03300...0x04dbf, // Square Apaato           ..Cjk Unified Ideograph-4d
			0x04e00...0x0a48c, // Cjk Unified Ideograph-4e..Yi Syllable Yyr
			0x0a490...0x0a4c6, // Yi Radical Qot          ..Yi Radical Ke
			0x0a960...0x0a97c, // Hangul Choseong Tikeut-m..Hangul Choseong Ssangyeo
			0x0ac00...0x0d7a3, // Hangul Syllable Ga      ..Hangul Syllable Hih
			0x0f900...0x0faff, // Cjk Compatibility Ideogr..(nil)
			0x0fe10...0x0fe19, // Presentation Form For Ve..Presentation Form For Ve
			0x0fe30...0x0fe52, // Presentation Form For Ve..Small Full Stop
			0x0fe54...0x0fe66, // Small Semicolon         ..Small Equals Sign
			0x0fe68...0x0fe6b, // Small Reverse Solidus   ..Small Commercial At
			0x0ff01...0x0ff60, // Fullwidth Exclamation Ma..Fullwidth Right White Pa
			0x0ffe0...0x0ffe6, // Fullwidth Cent Sign     ..Fullwidth Won Sign
			0x16fe0...0x16fe1, // Tangut Iteration Mark   ..Nushu Iteration Mark
			0x17000...0x187ec, // (nil)
			0x18800...0x18af2, // Tangut Component-001    ..Tangut Component-755
			0x1b000...0x1b11e, // Katakana Letter Archaic ..Hentaigana Letter N-mu-m
			0x1b170...0x1b2fb, // Nushu Character-1b170   ..Nushu Character-1b2fb
			0x1f004...0x1f004, // Mahjong Tile Red Dragon
			0x1f0cf...0x1f0cf, // Playing Card Black Joker
			0x1f18e...0x1f18e, // Negative Squared Ab
			0x1f191...0x1f19a, // Squared Cl              ..Squared Vs
			0x1f200...0x1f202, // Square Hiragana Hoka    ..Squared Katakana Sa
			0x1f210...0x1f23b, // Squared Cjk Unified Ideo..Squared Cjk Unified Ideo
			0x1f240...0x1f248, // Tortoise Shell Bracketed..Tortoise Shell Bracketed
			0x1f250...0x1f251, // Circled Ideograph Advant..Circled Ideograph Accept
			0x1f260...0x1f265, // Rounded Symbol For Fu   ..Rounded Symbol For Cai
			0x1f300...0x1f320, // Cyclone                 ..Shooting Star
			0x1f32d...0x1f335, // Hot Dog                 ..Cactus
			0x1f337...0x1f37c, // Tulip                   ..Baby Bottle
			0x1f37e...0x1f393, // Bottle With Popping Cork..Graduation Cap
			0x1f3a0...0x1f3ca, // Carousel Horse          ..Swimmer
			0x1f3cf...0x1f3d3, // Cricket Bat And Ball    ..Table Tennis Paddle And
			0x1f3e0...0x1f3f0, // House Building          ..European Castle
			0x1f3f4...0x1f3f4, // Waving Black Flag
			0x1f3f8...0x1f3fa, // Badminton Racquet And Sh..Amphora
			0x1f400...0x1f43e, // Rat                     ..Paw Prints
			0x1f440...0x1f440, // Eyes
			0x1f442...0x1f4fc, // Ear                     ..Videocassette
			0x1f4ff...0x1f53d, // Prayer Beads            ..Down-pointing Small Red
			0x1f54b...0x1f54e, // Kaaba                   ..Menorah With Nine Branch
			0x1f550...0x1f567, // Clock Face One Oclock   ..Clock Face Twelve-thirty
			0x1f57a...0x1f57a, // Man Dancing
			0x1f595...0x1f596, // Reversed Hand With Middl..Raised Hand With Part Be
			0x1f5a4...0x1f5a4, // Black Heart
			0x1f5fb...0x1f64f, // Mount Fuji              ..Person With Folded Hands
			0x1f680...0x1f6c5, // Rocket                  ..Left Luggage
			0x1f6cc...0x1f6cc, // Sleeping Accommodation
			0x1f6d0...0x1f6d2, // Place Of Worship        ..Shopping Trolley
			0x1f6eb...0x1f6ec, // Airplane Departure      ..Airplane Arriving
			0x1f6f4...0x1f6f8, // Scooter                 ..Flying Saucer
			0x1f910...0x1f93e, // Zipper-mouth Face       ..Handball
			0x1f940...0x1f94c, // Wilted Flower           ..Curling Stone
			0x1f950...0x1f96b, // Croissant               ..Canned Food
			0x1f980...0x1f997, // Crab                    ..Cricket
			0x1f9c0...0x1f9c0, // Cheese Wedge
			0x1f9d0...0x1f9e6, // Face With Monocle       ..Socks
			0x20000...0x2fffd, // Cjk Unified Ideograph-20..(nil)
			0x30000...0x3fffd, // Cjk Unified Ideograph-30..(nil)
			=> true,
			else => false,
		},
		.@"11.0.0" => switch (codepoint) {
			// Source: EastAsianWidth-11.0.0.txt
			// Date: 2018-05-14, 09:41:59 GMT [KW, LI]
			0x01100...0x0115f, // Hangul Choseong Kiyeok  ..Hangul Choseong Filler
			0x0231a...0x0231b, // Watch                   ..Hourglass
			0x02329...0x0232a, // Left-pointing Angle Brac..Right-pointing Angle Bra
			0x023e9...0x023ec, // Black Right-pointing Dou..Black Down-pointing Doub
			0x023f0...0x023f0, // Alarm Clock
			0x023f3...0x023f3, // Hourglass With Flowing Sand
			0x025fd...0x025fe, // White Medium Small Squar..Black Medium Small Squar
			0x02614...0x02615, // Umbrella With Rain Drops..Hot Beverage
			0x02648...0x02653, // Aries                   ..Pisces
			0x0267f...0x0267f, // Wheelchair Symbol
			0x02693...0x02693, // Anchor
			0x026a1...0x026a1, // High Voltage Sign
			0x026aa...0x026ab, // Medium White Circle     ..Medium Black Circle
			0x026bd...0x026be, // Soccer Ball             ..Baseball
			0x026c4...0x026c5, // Snowman Without Snow    ..Sun Behind Cloud
			0x026ce...0x026ce, // Ophiuchus
			0x026d4...0x026d4, // No Entry
			0x026ea...0x026ea, // Church
			0x026f2...0x026f3, // Fountain                ..Flag In Hole
			0x026f5...0x026f5, // Sailboat
			0x026fa...0x026fa, // Tent
			0x026fd...0x026fd, // Fuel Pump
			0x02705...0x02705, // White Heavy Check Mark
			0x0270a...0x0270b, // Raised Fist             ..Raised Hand
			0x02728...0x02728, // Sparkles
			0x0274c...0x0274c, // Cross Mark
			0x0274e...0x0274e, // Negative Squared Cross Mark
			0x02753...0x02755, // Black Question Mark Orna..White Exclamation Mark O
			0x02757...0x02757, // Heavy Exclamation Mark Symbol
			0x02795...0x02797, // Heavy Plus Sign         ..Heavy Division Sign
			0x027b0...0x027b0, // Curly Loop
			0x027bf...0x027bf, // Double Curly Loop
			0x02b1b...0x02b1c, // Black Large Square      ..White Large Square
			0x02b50...0x02b50, // White Medium Star
			0x02b55...0x02b55, // Heavy Large Circle
			0x02e80...0x02e99, // Cjk Radical Repeat      ..Cjk Radical Rap
			0x02e9b...0x02ef3, // Cjk Radical Choke       ..Cjk Radical C-simplified
			0x02f00...0x02fd5, // Kangxi Radical One      ..Kangxi Radical Flute
			0x02ff0...0x02ffb, // Ideographic Description ..Ideographic Description
			0x03000...0x03029, // Ideographic Space       ..Hangzhou Numeral Nine
			0x03030...0x0303e, // Wavy Dash               ..Ideographic Variation In
			0x03041...0x03096, // Hiragana Letter Small A ..Hiragana Letter Small Ke
			0x0309b...0x030ff, // Katakana-hiragana Voiced..Katakana Digraph Koto
			0x03105...0x0312f, // Bopomofo Letter B       ..Bopomofo Letter Nn
			0x03131...0x0318e, // Hangul Letter Kiyeok    ..Hangul Letter Araeae
			0x03190...0x031ba, // Ideographic Annotation L..Bopomofo Letter Zy
			0x031c0...0x031e3, // Cjk Stroke T            ..Cjk Stroke Q
			0x031f0...0x0321e, // Katakana Letter Small Ku..Parenthesized Korean Cha
			0x03220...0x03247, // Parenthesized Ideograph ..Circled Ideograph Koto
			0x03250...0x032fe, // Partnership Sign        ..Circled Katakana Wo
			0x03300...0x04dbf, // Square Apaato           ..Cjk Unified Ideograph-4d
			0x04e00...0x0a48c, // Cjk Unified Ideograph-4e..Yi Syllable Yyr
			0x0a490...0x0a4c6, // Yi Radical Qot          ..Yi Radical Ke
			0x0a960...0x0a97c, // Hangul Choseong Tikeut-m..Hangul Choseong Ssangyeo
			0x0ac00...0x0d7a3, // Hangul Syllable Ga      ..Hangul Syllable Hih
			0x0f900...0x0faff, // Cjk Compatibility Ideogr..(nil)
			0x0fe10...0x0fe19, // Presentation Form For Ve..Presentation Form For Ve
			0x0fe30...0x0fe52, // Presentation Form For Ve..Small Full Stop
			0x0fe54...0x0fe66, // Small Semicolon         ..Small Equals Sign
			0x0fe68...0x0fe6b, // Small Reverse Solidus   ..Small Commercial At
			0x0ff01...0x0ff60, // Fullwidth Exclamation Ma..Fullwidth Right White Pa
			0x0ffe0...0x0ffe6, // Fullwidth Cent Sign     ..Fullwidth Won Sign
			0x16fe0...0x16fe1, // Tangut Iteration Mark   ..Nushu Iteration Mark
			0x17000...0x187f1, // (nil)
			0x18800...0x18af2, // Tangut Component-001    ..Tangut Component-755
			0x1b000...0x1b11e, // Katakana Letter Archaic ..Hentaigana Letter N-mu-m
			0x1b170...0x1b2fb, // Nushu Character-1b170   ..Nushu Character-1b2fb
			0x1f004...0x1f004, // Mahjong Tile Red Dragon
			0x1f0cf...0x1f0cf, // Playing Card Black Joker
			0x1f18e...0x1f18e, // Negative Squared Ab
			0x1f191...0x1f19a, // Squared Cl              ..Squared Vs
			0x1f200...0x1f202, // Square Hiragana Hoka    ..Squared Katakana Sa
			0x1f210...0x1f23b, // Squared Cjk Unified Ideo..Squared Cjk Unified Ideo
			0x1f240...0x1f248, // Tortoise Shell Bracketed..Tortoise Shell Bracketed
			0x1f250...0x1f251, // Circled Ideograph Advant..Circled Ideograph Accept
			0x1f260...0x1f265, // Rounded Symbol For Fu   ..Rounded Symbol For Cai
			0x1f300...0x1f320, // Cyclone                 ..Shooting Star
			0x1f32d...0x1f335, // Hot Dog                 ..Cactus
			0x1f337...0x1f37c, // Tulip                   ..Baby Bottle
			0x1f37e...0x1f393, // Bottle With Popping Cork..Graduation Cap
			0x1f3a0...0x1f3ca, // Carousel Horse          ..Swimmer
			0x1f3cf...0x1f3d3, // Cricket Bat And Ball    ..Table Tennis Paddle And
			0x1f3e0...0x1f3f0, // House Building          ..European Castle
			0x1f3f4...0x1f3f4, // Waving Black Flag
			0x1f3f8...0x1f3fa, // Badminton Racquet And Sh..Amphora
			0x1f400...0x1f43e, // Rat                     ..Paw Prints
			0x1f440...0x1f440, // Eyes
			0x1f442...0x1f4fc, // Ear                     ..Videocassette
			0x1f4ff...0x1f53d, // Prayer Beads            ..Down-pointing Small Red
			0x1f54b...0x1f54e, // Kaaba                   ..Menorah With Nine Branch
			0x1f550...0x1f567, // Clock Face One Oclock   ..Clock Face Twelve-thirty
			0x1f57a...0x1f57a, // Man Dancing
			0x1f595...0x1f596, // Reversed Hand With Middl..Raised Hand With Part Be
			0x1f5a4...0x1f5a4, // Black Heart
			0x1f5fb...0x1f64f, // Mount Fuji              ..Person With Folded Hands
			0x1f680...0x1f6c5, // Rocket                  ..Left Luggage
			0x1f6cc...0x1f6cc, // Sleeping Accommodation
			0x1f6d0...0x1f6d2, // Place Of Worship        ..Shopping Trolley
			0x1f6eb...0x1f6ec, // Airplane Departure      ..Airplane Arriving
			0x1f6f4...0x1f6f9, // Scooter                 ..Skateboard
			0x1f910...0x1f93e, // Zipper-mouth Face       ..Handball
			0x1f940...0x1f970, // Wilted Flower           ..Smiling Face With Smilin
			0x1f973...0x1f976, // Face With Party Horn And..Freezing Face
			0x1f97a...0x1f97a, // Face With Pleading Eyes
			0x1f97c...0x1f9a2, // Lab Coat                ..Swan
			0x1f9b0...0x1f9b9, // Emoji Component Red Hair..Supervillain
			0x1f9c0...0x1f9c2, // Cheese Wedge            ..Salt Shaker
			0x1f9d0...0x1f9ff, // Face With Monocle       ..Nazar Amulet
			0x20000...0x2fffd, // Cjk Unified Ideograph-20..(nil)
			0x30000...0x3fffd, // Cjk Unified Ideograph-30..(nil)
			=> true,
			else => false,
		},
		.@"12.0.0" => switch (codepoint) {
			// Source: EastAsianWidth-12.0.0.txt
			// Date: 2019-01-21, 14:12:58 GMT [KW, LI]
			0x01100...0x0115f, // Hangul Choseong Kiyeok  ..Hangul Choseong Filler
			0x0231a...0x0231b, // Watch                   ..Hourglass
			0x02329...0x0232a, // Left-pointing Angle Brac..Right-pointing Angle Bra
			0x023e9...0x023ec, // Black Right-pointing Dou..Black Down-pointing Doub
			0x023f0...0x023f0, // Alarm Clock
			0x023f3...0x023f3, // Hourglass With Flowing Sand
			0x025fd...0x025fe, // White Medium Small Squar..Black Medium Small Squar
			0x02614...0x02615, // Umbrella With Rain Drops..Hot Beverage
			0x02648...0x02653, // Aries                   ..Pisces
			0x0267f...0x0267f, // Wheelchair Symbol
			0x02693...0x02693, // Anchor
			0x026a1...0x026a1, // High Voltage Sign
			0x026aa...0x026ab, // Medium White Circle     ..Medium Black Circle
			0x026bd...0x026be, // Soccer Ball             ..Baseball
			0x026c4...0x026c5, // Snowman Without Snow    ..Sun Behind Cloud
			0x026ce...0x026ce, // Ophiuchus
			0x026d4...0x026d4, // No Entry
			0x026ea...0x026ea, // Church
			0x026f2...0x026f3, // Fountain                ..Flag In Hole
			0x026f5...0x026f5, // Sailboat
			0x026fa...0x026fa, // Tent
			0x026fd...0x026fd, // Fuel Pump
			0x02705...0x02705, // White Heavy Check Mark
			0x0270a...0x0270b, // Raised Fist             ..Raised Hand
			0x02728...0x02728, // Sparkles
			0x0274c...0x0274c, // Cross Mark
			0x0274e...0x0274e, // Negative Squared Cross Mark
			0x02753...0x02755, // Black Question Mark Orna..White Exclamation Mark O
			0x02757...0x02757, // Heavy Exclamation Mark Symbol
			0x02795...0x02797, // Heavy Plus Sign         ..Heavy Division Sign
			0x027b0...0x027b0, // Curly Loop
			0x027bf...0x027bf, // Double Curly Loop
			0x02b1b...0x02b1c, // Black Large Square      ..White Large Square
			0x02b50...0x02b50, // White Medium Star
			0x02b55...0x02b55, // Heavy Large Circle
			0x02e80...0x02e99, // Cjk Radical Repeat      ..Cjk Radical Rap
			0x02e9b...0x02ef3, // Cjk Radical Choke       ..Cjk Radical C-simplified
			0x02f00...0x02fd5, // Kangxi Radical One      ..Kangxi Radical Flute
			0x02ff0...0x02ffb, // Ideographic Description ..Ideographic Description
			0x03000...0x03029, // Ideographic Space       ..Hangzhou Numeral Nine
			0x03030...0x0303e, // Wavy Dash               ..Ideographic Variation In
			0x03041...0x03096, // Hiragana Letter Small A ..Hiragana Letter Small Ke
			0x0309b...0x030ff, // Katakana-hiragana Voiced..Katakana Digraph Koto
			0x03105...0x0312f, // Bopomofo Letter B       ..Bopomofo Letter Nn
			0x03131...0x0318e, // Hangul Letter Kiyeok    ..Hangul Letter Araeae
			0x03190...0x031ba, // Ideographic Annotation L..Bopomofo Letter Zy
			0x031c0...0x031e3, // Cjk Stroke T            ..Cjk Stroke Q
			0x031f0...0x0321e, // Katakana Letter Small Ku..Parenthesized Korean Cha
			0x03220...0x03247, // Parenthesized Ideograph ..Circled Ideograph Koto
			0x03250...0x032fe, // Partnership Sign        ..Circled Katakana Wo
			0x03300...0x04dbf, // Square Apaato           ..Cjk Unified Ideograph-4d
			0x04e00...0x0a48c, // Cjk Unified Ideograph-4e..Yi Syllable Yyr
			0x0a490...0x0a4c6, // Yi Radical Qot          ..Yi Radical Ke
			0x0a960...0x0a97c, // Hangul Choseong Tikeut-m..Hangul Choseong Ssangyeo
			0x0ac00...0x0d7a3, // Hangul Syllable Ga      ..Hangul Syllable Hih
			0x0f900...0x0faff, // Cjk Compatibility Ideogr..(nil)
			0x0fe10...0x0fe19, // Presentation Form For Ve..Presentation Form For Ve
			0x0fe30...0x0fe52, // Presentation Form For Ve..Small Full Stop
			0x0fe54...0x0fe66, // Small Semicolon         ..Small Equals Sign
			0x0fe68...0x0fe6b, // Small Reverse Solidus   ..Small Commercial At
			0x0ff01...0x0ff60, // Fullwidth Exclamation Ma..Fullwidth Right White Pa
			0x0ffe0...0x0ffe6, // Fullwidth Cent Sign     ..Fullwidth Won Sign
			0x16fe0...0x16fe3, // Tangut Iteration Mark   ..Old Chinese Iteration Ma
			0x17000...0x187f7, // (nil)
			0x18800...0x18af2, // Tangut Component-001    ..Tangut Component-755
			0x1b000...0x1b11e, // Katakana Letter Archaic ..Hentaigana Letter N-mu-m
			0x1b150...0x1b152, // Hiragana Letter Small Wi..Hiragana Letter Small Wo
			0x1b164...0x1b167, // Katakana Letter Small Wi..Katakana Letter Small N
			0x1b170...0x1b2fb, // Nushu Character-1b170   ..Nushu Character-1b2fb
			0x1f004...0x1f004, // Mahjong Tile Red Dragon
			0x1f0cf...0x1f0cf, // Playing Card Black Joker
			0x1f18e...0x1f18e, // Negative Squared Ab
			0x1f191...0x1f19a, // Squared Cl              ..Squared Vs
			0x1f200...0x1f202, // Square Hiragana Hoka    ..Squared Katakana Sa
			0x1f210...0x1f23b, // Squared Cjk Unified Ideo..Squared Cjk Unified Ideo
			0x1f240...0x1f248, // Tortoise Shell Bracketed..Tortoise Shell Bracketed
			0x1f250...0x1f251, // Circled Ideograph Advant..Circled Ideograph Accept
			0x1f260...0x1f265, // Rounded Symbol For Fu   ..Rounded Symbol For Cai
			0x1f300...0x1f320, // Cyclone                 ..Shooting Star
			0x1f32d...0x1f335, // Hot Dog                 ..Cactus
			0x1f337...0x1f37c, // Tulip                   ..Baby Bottle
			0x1f37e...0x1f393, // Bottle With Popping Cork..Graduation Cap
			0x1f3a0...0x1f3ca, // Carousel Horse          ..Swimmer
			0x1f3cf...0x1f3d3, // Cricket Bat And Ball    ..Table Tennis Paddle And
			0x1f3e0...0x1f3f0, // House Building          ..European Castle
			0x1f3f4...0x1f3f4, // Waving Black Flag
			0x1f3f8...0x1f3fa, // Badminton Racquet And Sh..Amphora
			0x1f400...0x1f43e, // Rat                     ..Paw Prints
			0x1f440...0x1f440, // Eyes
			0x1f442...0x1f4fc, // Ear                     ..Videocassette
			0x1f4ff...0x1f53d, // Prayer Beads            ..Down-pointing Small Red
			0x1f54b...0x1f54e, // Kaaba                   ..Menorah With Nine Branch
			0x1f550...0x1f567, // Clock Face One Oclock   ..Clock Face Twelve-thirty
			0x1f57a...0x1f57a, // Man Dancing
			0x1f595...0x1f596, // Reversed Hand With Middl..Raised Hand With Part Be
			0x1f5a4...0x1f5a4, // Black Heart
			0x1f5fb...0x1f64f, // Mount Fuji              ..Person With Folded Hands
			0x1f680...0x1f6c5, // Rocket                  ..Left Luggage
			0x1f6cc...0x1f6cc, // Sleeping Accommodation
			0x1f6d0...0x1f6d2, // Place Of Worship        ..Shopping Trolley
			0x1f6d5...0x1f6d5, // Hindu Temple
			0x1f6eb...0x1f6ec, // Airplane Departure      ..Airplane Arriving
			0x1f6f4...0x1f6fa, // Scooter                 ..Auto Rickshaw
			0x1f7e0...0x1f7eb, // Large Orange Circle     ..Large Brown Square
			0x1f90d...0x1f971, // White Heart             ..Yawning Face
			0x1f973...0x1f976, // Face With Party Horn And..Freezing Face
			0x1f97a...0x1f9a2, // Face With Pleading Eyes ..Swan
			0x1f9a5...0x1f9aa, // Sloth                   ..Oyster
			0x1f9ae...0x1f9ca, // Guide Dog               ..Ice Cube
			0x1f9cd...0x1f9ff, // Standing Person         ..Nazar Amulet
			0x1fa70...0x1fa73, // Ballet Shoes            ..Shorts
			0x1fa78...0x1fa7a, // Drop Of Blood           ..Stethoscope
			0x1fa80...0x1fa82, // Yo-yo                   ..Parachute
			0x1fa90...0x1fa95, // Ringed Planet           ..Banjo
			0x20000...0x2fffd, // Cjk Unified Ideograph-20..(nil)
			0x30000...0x3fffd, // Cjk Unified Ideograph-30..(nil)
			=> true,
			else => false,
		},
		.@"12.1.0" => switch (codepoint) {
			// Source: EastAsianWidth-12.1.0.txt
			// Date: 2019-03-31, 22:01:58 GMT [KW, LI]
			0x01100...0x0115f, // Hangul Choseong Kiyeok  ..Hangul Choseong Filler
			0x0231a...0x0231b, // Watch                   ..Hourglass
			0x02329...0x0232a, // Left-pointing Angle Brac..Right-pointing Angle Bra
			0x023e9...0x023ec, // Black Right-pointing Dou..Black Down-pointing Doub
			0x023f0...0x023f0, // Alarm Clock
			0x023f3...0x023f3, // Hourglass With Flowing Sand
			0x025fd...0x025fe, // White Medium Small Squar..Black Medium Small Squar
			0x02614...0x02615, // Umbrella With Rain Drops..Hot Beverage
			0x02648...0x02653, // Aries                   ..Pisces
			0x0267f...0x0267f, // Wheelchair Symbol
			0x02693...0x02693, // Anchor
			0x026a1...0x026a1, // High Voltage Sign
			0x026aa...0x026ab, // Medium White Circle     ..Medium Black Circle
			0x026bd...0x026be, // Soccer Ball             ..Baseball
			0x026c4...0x026c5, // Snowman Without Snow    ..Sun Behind Cloud
			0x026ce...0x026ce, // Ophiuchus
			0x026d4...0x026d4, // No Entry
			0x026ea...0x026ea, // Church
			0x026f2...0x026f3, // Fountain                ..Flag In Hole
			0x026f5...0x026f5, // Sailboat
			0x026fa...0x026fa, // Tent
			0x026fd...0x026fd, // Fuel Pump
			0x02705...0x02705, // White Heavy Check Mark
			0x0270a...0x0270b, // Raised Fist             ..Raised Hand
			0x02728...0x02728, // Sparkles
			0x0274c...0x0274c, // Cross Mark
			0x0274e...0x0274e, // Negative Squared Cross Mark
			0x02753...0x02755, // Black Question Mark Orna..White Exclamation Mark O
			0x02757...0x02757, // Heavy Exclamation Mark Symbol
			0x02795...0x02797, // Heavy Plus Sign         ..Heavy Division Sign
			0x027b0...0x027b0, // Curly Loop
			0x027bf...0x027bf, // Double Curly Loop
			0x02b1b...0x02b1c, // Black Large Square      ..White Large Square
			0x02b50...0x02b50, // White Medium Star
			0x02b55...0x02b55, // Heavy Large Circle
			0x02e80...0x02e99, // Cjk Radical Repeat      ..Cjk Radical Rap
			0x02e9b...0x02ef3, // Cjk Radical Choke       ..Cjk Radical C-simplified
			0x02f00...0x02fd5, // Kangxi Radical One      ..Kangxi Radical Flute
			0x02ff0...0x02ffb, // Ideographic Description ..Ideographic Description
			0x03000...0x03029, // Ideographic Space       ..Hangzhou Numeral Nine
			0x03030...0x0303e, // Wavy Dash               ..Ideographic Variation In
			0x03041...0x03096, // Hiragana Letter Small A ..Hiragana Letter Small Ke
			0x0309b...0x030ff, // Katakana-hiragana Voiced..Katakana Digraph Koto
			0x03105...0x0312f, // Bopomofo Letter B       ..Bopomofo Letter Nn
			0x03131...0x0318e, // Hangul Letter Kiyeok    ..Hangul Letter Araeae
			0x03190...0x031ba, // Ideographic Annotation L..Bopomofo Letter Zy
			0x031c0...0x031e3, // Cjk Stroke T            ..Cjk Stroke Q
			0x031f0...0x0321e, // Katakana Letter Small Ku..Parenthesized Korean Cha
			0x03220...0x03247, // Parenthesized Ideograph ..Circled Ideograph Koto
			0x03250...0x04dbf, // Partnership Sign        ..Cjk Unified Ideograph-4d
			0x04e00...0x0a48c, // Cjk Unified Ideograph-4e..Yi Syllable Yyr
			0x0a490...0x0a4c6, // Yi Radical Qot          ..Yi Radical Ke
			0x0a960...0x0a97c, // Hangul Choseong Tikeut-m..Hangul Choseong Ssangyeo
			0x0ac00...0x0d7a3, // Hangul Syllable Ga      ..Hangul Syllable Hih
			0x0f900...0x0faff, // Cjk Compatibility Ideogr..(nil)
			0x0fe10...0x0fe19, // Presentation Form For Ve..Presentation Form For Ve
			0x0fe30...0x0fe52, // Presentation Form For Ve..Small Full Stop
			0x0fe54...0x0fe66, // Small Semicolon         ..Small Equals Sign
			0x0fe68...0x0fe6b, // Small Reverse Solidus   ..Small Commercial At
			0x0ff01...0x0ff60, // Fullwidth Exclamation Ma..Fullwidth Right White Pa
			0x0ffe0...0x0ffe6, // Fullwidth Cent Sign     ..Fullwidth Won Sign
			0x16fe0...0x16fe3, // Tangut Iteration Mark   ..Old Chinese Iteration Ma
			0x17000...0x187f7, // (nil)
			0x18800...0x18af2, // Tangut Component-001    ..Tangut Component-755
			0x1b000...0x1b11e, // Katakana Letter Archaic ..Hentaigana Letter N-mu-m
			0x1b150...0x1b152, // Hiragana Letter Small Wi..Hiragana Letter Small Wo
			0x1b164...0x1b167, // Katakana Letter Small Wi..Katakana Letter Small N
			0x1b170...0x1b2fb, // Nushu Character-1b170   ..Nushu Character-1b2fb
			0x1f004...0x1f004, // Mahjong Tile Red Dragon
			0x1f0cf...0x1f0cf, // Playing Card Black Joker
			0x1f18e...0x1f18e, // Negative Squared Ab
			0x1f191...0x1f19a, // Squared Cl              ..Squared Vs
			0x1f200...0x1f202, // Square Hiragana Hoka    ..Squared Katakana Sa
			0x1f210...0x1f23b, // Squared Cjk Unified Ideo..Squared Cjk Unified Ideo
			0x1f240...0x1f248, // Tortoise Shell Bracketed..Tortoise Shell Bracketed
			0x1f250...0x1f251, // Circled Ideograph Advant..Circled Ideograph Accept
			0x1f260...0x1f265, // Rounded Symbol For Fu   ..Rounded Symbol For Cai
			0x1f300...0x1f320, // Cyclone                 ..Shooting Star
			0x1f32d...0x1f335, // Hot Dog                 ..Cactus
			0x1f337...0x1f37c, // Tulip                   ..Baby Bottle
			0x1f37e...0x1f393, // Bottle With Popping Cork..Graduation Cap
			0x1f3a0...0x1f3ca, // Carousel Horse          ..Swimmer
			0x1f3cf...0x1f3d3, // Cricket Bat And Ball    ..Table Tennis Paddle And
			0x1f3e0...0x1f3f0, // House Building          ..European Castle
			0x1f3f4...0x1f3f4, // Waving Black Flag
			0x1f3f8...0x1f3fa, // Badminton Racquet And Sh..Amphora
			0x1f400...0x1f43e, // Rat                     ..Paw Prints
			0x1f440...0x1f440, // Eyes
			0x1f442...0x1f4fc, // Ear                     ..Videocassette
			0x1f4ff...0x1f53d, // Prayer Beads            ..Down-pointing Small Red
			0x1f54b...0x1f54e, // Kaaba                   ..Menorah With Nine Branch
			0x1f550...0x1f567, // Clock Face One Oclock   ..Clock Face Twelve-thirty
			0x1f57a...0x1f57a, // Man Dancing
			0x1f595...0x1f596, // Reversed Hand With Middl..Raised Hand With Part Be
			0x1f5a4...0x1f5a4, // Black Heart
			0x1f5fb...0x1f64f, // Mount Fuji              ..Person With Folded Hands
			0x1f680...0x1f6c5, // Rocket                  ..Left Luggage
			0x1f6cc...0x1f6cc, // Sleeping Accommodation
			0x1f6d0...0x1f6d2, // Place Of Worship        ..Shopping Trolley
			0x1f6d5...0x1f6d5, // Hindu Temple
			0x1f6eb...0x1f6ec, // Airplane Departure      ..Airplane Arriving
			0x1f6f4...0x1f6fa, // Scooter                 ..Auto Rickshaw
			0x1f7e0...0x1f7eb, // Large Orange Circle     ..Large Brown Square
			0x1f90d...0x1f971, // White Heart             ..Yawning Face
			0x1f973...0x1f976, // Face With Party Horn And..Freezing Face
			0x1f97a...0x1f9a2, // Face With Pleading Eyes ..Swan
			0x1f9a5...0x1f9aa, // Sloth                   ..Oyster
			0x1f9ae...0x1f9ca, // Guide Dog               ..Ice Cube
			0x1f9cd...0x1f9ff, // Standing Person         ..Nazar Amulet
			0x1fa70...0x1fa73, // Ballet Shoes            ..Shorts
			0x1fa78...0x1fa7a, // Drop Of Blood           ..Stethoscope
			0x1fa80...0x1fa82, // Yo-yo                   ..Parachute
			0x1fa90...0x1fa95, // Ringed Planet           ..Banjo
			0x20000...0x2fffd, // Cjk Unified Ideograph-20..(nil)
			0x30000...0x3fffd, // Cjk Unified Ideograph-30..(nil)
			=> true,
			else => false,
		},
		.@"13.0.0" => switch (codepoint) {
			// Source: EastAsianWidth-13.0.0.txt
			// Date: 2029-01-21, 18:14:00 GMT [KW, LI]
			0x01100...0x0115f, // Hangul Choseong Kiyeok  ..Hangul Choseong Filler
			0x0231a...0x0231b, // Watch                   ..Hourglass
			0x02329...0x0232a, // Left-pointing Angle Brac..Right-pointing Angle Bra
			0x023e9...0x023ec, // Black Right-pointing Dou..Black Down-pointing Doub
			0x023f0...0x023f0, // Alarm Clock
			0x023f3...0x023f3, // Hourglass With Flowing Sand
			0x025fd...0x025fe, // White Medium Small Squar..Black Medium Small Squar
			0x02614...0x02615, // Umbrella With Rain Drops..Hot Beverage
			0x02648...0x02653, // Aries                   ..Pisces
			0x0267f...0x0267f, // Wheelchair Symbol
			0x02693...0x02693, // Anchor
			0x026a1...0x026a1, // High Voltage Sign
			0x026aa...0x026ab, // Medium White Circle     ..Medium Black Circle
			0x026bd...0x026be, // Soccer Ball             ..Baseball
			0x026c4...0x026c5, // Snowman Without Snow    ..Sun Behind Cloud
			0x026ce...0x026ce, // Ophiuchus
			0x026d4...0x026d4, // No Entry
			0x026ea...0x026ea, // Church
			0x026f2...0x026f3, // Fountain                ..Flag In Hole
			0x026f5...0x026f5, // Sailboat
			0x026fa...0x026fa, // Tent
			0x026fd...0x026fd, // Fuel Pump
			0x02705...0x02705, // White Heavy Check Mark
			0x0270a...0x0270b, // Raised Fist             ..Raised Hand
			0x02728...0x02728, // Sparkles
			0x0274c...0x0274c, // Cross Mark
			0x0274e...0x0274e, // Negative Squared Cross Mark
			0x02753...0x02755, // Black Question Mark Orna..White Exclamation Mark O
			0x02757...0x02757, // Heavy Exclamation Mark Symbol
			0x02795...0x02797, // Heavy Plus Sign         ..Heavy Division Sign
			0x027b0...0x027b0, // Curly Loop
			0x027bf...0x027bf, // Double Curly Loop
			0x02b1b...0x02b1c, // Black Large Square      ..White Large Square
			0x02b50...0x02b50, // White Medium Star
			0x02b55...0x02b55, // Heavy Large Circle
			0x02e80...0x02e99, // Cjk Radical Repeat      ..Cjk Radical Rap
			0x02e9b...0x02ef3, // Cjk Radical Choke       ..Cjk Radical C-simplified
			0x02f00...0x02fd5, // Kangxi Radical One      ..Kangxi Radical Flute
			0x02ff0...0x02ffb, // Ideographic Description ..Ideographic Description
			0x03000...0x03029, // Ideographic Space       ..Hangzhou Numeral Nine
			0x03030...0x0303e, // Wavy Dash               ..Ideographic Variation In
			0x03041...0x03096, // Hiragana Letter Small A ..Hiragana Letter Small Ke
			0x0309b...0x030ff, // Katakana-hiragana Voiced..Katakana Digraph Koto
			0x03105...0x0312f, // Bopomofo Letter B       ..Bopomofo Letter Nn
			0x03131...0x0318e, // Hangul Letter Kiyeok    ..Hangul Letter Araeae
			0x03190...0x031e3, // Ideographic Annotation L..Cjk Stroke Q
			0x031f0...0x0321e, // Katakana Letter Small Ku..Parenthesized Korean Cha
			0x03220...0x03247, // Parenthesized Ideograph ..Circled Ideograph Koto
			0x03250...0x04dbf, // Partnership Sign        ..Cjk Unified Ideograph-4d
			0x04e00...0x0a48c, // Cjk Unified Ideograph-4e..Yi Syllable Yyr
			0x0a490...0x0a4c6, // Yi Radical Qot          ..Yi Radical Ke
			0x0a960...0x0a97c, // Hangul Choseong Tikeut-m..Hangul Choseong Ssangyeo
			0x0ac00...0x0d7a3, // Hangul Syllable Ga      ..Hangul Syllable Hih
			0x0f900...0x0faff, // Cjk Compatibility Ideogr..(nil)
			0x0fe10...0x0fe19, // Presentation Form For Ve..Presentation Form For Ve
			0x0fe30...0x0fe52, // Presentation Form For Ve..Small Full Stop
			0x0fe54...0x0fe66, // Small Semicolon         ..Small Equals Sign
			0x0fe68...0x0fe6b, // Small Reverse Solidus   ..Small Commercial At
			0x0ff01...0x0ff60, // Fullwidth Exclamation Ma..Fullwidth Right White Pa
			0x0ffe0...0x0ffe6, // Fullwidth Cent Sign     ..Fullwidth Won Sign
			0x16fe0...0x16fe3, // Tangut Iteration Mark   ..Old Chinese Iteration Ma
			0x17000...0x187f7, // (nil)
			0x18800...0x18cd5, // Tangut Component-001    ..Khitan Small Script Char
			0x18d00...0x18d08, // (nil)
			0x1b000...0x1b11e, // Katakana Letter Archaic ..Hentaigana Letter N-mu-m
			0x1b150...0x1b152, // Hiragana Letter Small Wi..Hiragana Letter Small Wo
			0x1b164...0x1b167, // Katakana Letter Small Wi..Katakana Letter Small N
			0x1b170...0x1b2fb, // Nushu Character-1b170   ..Nushu Character-1b2fb
			0x1f004...0x1f004, // Mahjong Tile Red Dragon
			0x1f0cf...0x1f0cf, // Playing Card Black Joker
			0x1f18e...0x1f18e, // Negative Squared Ab
			0x1f191...0x1f19a, // Squared Cl              ..Squared Vs
			0x1f200...0x1f202, // Square Hiragana Hoka    ..Squared Katakana Sa
			0x1f210...0x1f23b, // Squared Cjk Unified Ideo..Squared Cjk Unified Ideo
			0x1f240...0x1f248, // Tortoise Shell Bracketed..Tortoise Shell Bracketed
			0x1f250...0x1f251, // Circled Ideograph Advant..Circled Ideograph Accept
			0x1f260...0x1f265, // Rounded Symbol For Fu   ..Rounded Symbol For Cai
			0x1f300...0x1f320, // Cyclone                 ..Shooting Star
			0x1f32d...0x1f335, // Hot Dog                 ..Cactus
			0x1f337...0x1f37c, // Tulip                   ..Baby Bottle
			0x1f37e...0x1f393, // Bottle With Popping Cork..Graduation Cap
			0x1f3a0...0x1f3ca, // Carousel Horse          ..Swimmer
			0x1f3cf...0x1f3d3, // Cricket Bat And Ball    ..Table Tennis Paddle And
			0x1f3e0...0x1f3f0, // House Building          ..European Castle
			0x1f3f4...0x1f3f4, // Waving Black Flag
			0x1f3f8...0x1f3fa, // Badminton Racquet And Sh..Amphora
			0x1f400...0x1f43e, // Rat                     ..Paw Prints
			0x1f440...0x1f440, // Eyes
			0x1f442...0x1f4fc, // Ear                     ..Videocassette
			0x1f4ff...0x1f53d, // Prayer Beads            ..Down-pointing Small Red
			0x1f54b...0x1f54e, // Kaaba                   ..Menorah With Nine Branch
			0x1f550...0x1f567, // Clock Face One Oclock   ..Clock Face Twelve-thirty
			0x1f57a...0x1f57a, // Man Dancing
			0x1f595...0x1f596, // Reversed Hand With Middl..Raised Hand With Part Be
			0x1f5a4...0x1f5a4, // Black Heart
			0x1f5fb...0x1f64f, // Mount Fuji              ..Person With Folded Hands
			0x1f680...0x1f6c5, // Rocket                  ..Left Luggage
			0x1f6cc...0x1f6cc, // Sleeping Accommodation
			0x1f6d0...0x1f6d2, // Place Of Worship        ..Shopping Trolley
			0x1f6d5...0x1f6d7, // Hindu Temple            ..Elevator
			0x1f6eb...0x1f6ec, // Airplane Departure      ..Airplane Arriving
			0x1f6f4...0x1f6fc, // Scooter                 ..Roller Skate
			0x1f7e0...0x1f7eb, // Large Orange Circle     ..Large Brown Square
			0x1f90c...0x1f93a, // Pinched Fingers         ..Fencer
			0x1f93c...0x1f945, // Wrestlers               ..Goal Net
			0x1f947...0x1f978, // First Place Medal       ..Disguised Face
			0x1f97a...0x1f9cb, // Face With Pleading Eyes ..Bubble Tea
			0x1f9cd...0x1f9ff, // Standing Person         ..Nazar Amulet
			0x1fa70...0x1fa74, // Ballet Shoes            ..Thong Sandal
			0x1fa78...0x1fa7a, // Drop Of Blood           ..Stethoscope
			0x1fa80...0x1fa86, // Yo-yo                   ..Nesting Dolls
			0x1fa90...0x1faa8, // Ringed Planet           ..Rock
			0x1fab0...0x1fab6, // Fly                     ..Feather
			0x1fac0...0x1fac2, // Anatomical Heart        ..People Hugging
			0x1fad0...0x1fad6, // Blueberries             ..Teapot
			0x20000...0x2fffd, // Cjk Unified Ideograph-20..(nil)
			0x30000...0x3fffd, // Cjk Unified Ideograph-30..(nil)
			=> true,
			else => false,
		},
		.@"14.0.0" => switch (codepoint) {
			// Source: EastAsianWidth-14.0.0.txt
			// Date: 2021-07-06, 09:58:53 GMT [KW, LI]
			0x01100...0x0115f, // Hangul Choseong Kiyeok  ..Hangul Choseong Filler
			0x0231a...0x0231b, // Watch                   ..Hourglass
			0x02329...0x0232a, // Left-pointing Angle Brac..Right-pointing Angle Bra
			0x023e9...0x023ec, // Black Right-pointing Dou..Black Down-pointing Doub
			0x023f0...0x023f0, // Alarm Clock
			0x023f3...0x023f3, // Hourglass With Flowing Sand
			0x025fd...0x025fe, // White Medium Small Squar..Black Medium Small Squar
			0x02614...0x02615, // Umbrella With Rain Drops..Hot Beverage
			0x02648...0x02653, // Aries                   ..Pisces
			0x0267f...0x0267f, // Wheelchair Symbol
			0x02693...0x02693, // Anchor
			0x026a1...0x026a1, // High Voltage Sign
			0x026aa...0x026ab, // Medium White Circle     ..Medium Black Circle
			0x026bd...0x026be, // Soccer Ball             ..Baseball
			0x026c4...0x026c5, // Snowman Without Snow    ..Sun Behind Cloud
			0x026ce...0x026ce, // Ophiuchus
			0x026d4...0x026d4, // No Entry
			0x026ea...0x026ea, // Church
			0x026f2...0x026f3, // Fountain                ..Flag In Hole
			0x026f5...0x026f5, // Sailboat
			0x026fa...0x026fa, // Tent
			0x026fd...0x026fd, // Fuel Pump
			0x02705...0x02705, // White Heavy Check Mark
			0x0270a...0x0270b, // Raised Fist             ..Raised Hand
			0x02728...0x02728, // Sparkles
			0x0274c...0x0274c, // Cross Mark
			0x0274e...0x0274e, // Negative Squared Cross Mark
			0x02753...0x02755, // Black Question Mark Orna..White Exclamation Mark O
			0x02757...0x02757, // Heavy Exclamation Mark Symbol
			0x02795...0x02797, // Heavy Plus Sign         ..Heavy Division Sign
			0x027b0...0x027b0, // Curly Loop
			0x027bf...0x027bf, // Double Curly Loop
			0x02b1b...0x02b1c, // Black Large Square      ..White Large Square
			0x02b50...0x02b50, // White Medium Star
			0x02b55...0x02b55, // Heavy Large Circle
			0x02e80...0x02e99, // Cjk Radical Repeat      ..Cjk Radical Rap
			0x02e9b...0x02ef3, // Cjk Radical Choke       ..Cjk Radical C-simplified
			0x02f00...0x02fd5, // Kangxi Radical One      ..Kangxi Radical Flute
			0x02ff0...0x02ffb, // Ideographic Description ..Ideographic Description
			0x03000...0x03029, // Ideographic Space       ..Hangzhou Numeral Nine
			0x03030...0x0303e, // Wavy Dash               ..Ideographic Variation In
			0x03041...0x03096, // Hiragana Letter Small A ..Hiragana Letter Small Ke
			0x0309b...0x030ff, // Katakana-hiragana Voiced..Katakana Digraph Koto
			0x03105...0x0312f, // Bopomofo Letter B       ..Bopomofo Letter Nn
			0x03131...0x0318e, // Hangul Letter Kiyeok    ..Hangul Letter Araeae
			0x03190...0x031e3, // Ideographic Annotation L..Cjk Stroke Q
			0x031f0...0x0321e, // Katakana Letter Small Ku..Parenthesized Korean Cha
			0x03220...0x03247, // Parenthesized Ideograph ..Circled Ideograph Koto
			0x03250...0x04dbf, // Partnership Sign        ..Cjk Unified Ideograph-4d
			0x04e00...0x0a48c, // Cjk Unified Ideograph-4e..Yi Syllable Yyr
			0x0a490...0x0a4c6, // Yi Radical Qot          ..Yi Radical Ke
			0x0a960...0x0a97c, // Hangul Choseong Tikeut-m..Hangul Choseong Ssangyeo
			0x0ac00...0x0d7a3, // Hangul Syllable Ga      ..Hangul Syllable Hih
			0x0f900...0x0faff, // Cjk Compatibility Ideogr..(nil)
			0x0fe10...0x0fe19, // Presentation Form For Ve..Presentation Form For Ve
			0x0fe30...0x0fe52, // Presentation Form For Ve..Small Full Stop
			0x0fe54...0x0fe66, // Small Semicolon         ..Small Equals Sign
			0x0fe68...0x0fe6b, // Small Reverse Solidus   ..Small Commercial At
			0x0ff01...0x0ff60, // Fullwidth Exclamation Ma..Fullwidth Right White Pa
			0x0ffe0...0x0ffe6, // Fullwidth Cent Sign     ..Fullwidth Won Sign
			0x16fe0...0x16fe3, // Tangut Iteration Mark   ..Old Chinese Iteration Ma
			0x17000...0x187f7, // (nil)
			0x18800...0x18cd5, // Tangut Component-001    ..Khitan Small Script Char
			0x18d00...0x18d08, // (nil)
			0x1aff0...0x1aff3, // Katakana Letter Minnan T..Katakana Letter Minnan T
			0x1aff5...0x1affb, // Katakana Letter Minnan T..Katakana Letter Minnan N
			0x1affd...0x1affe, // Katakana Letter Minnan N..Katakana Letter Minnan N
			0x1b000...0x1b122, // Katakana Letter Archaic ..Katakana Letter Archaic
			0x1b150...0x1b152, // Hiragana Letter Small Wi..Hiragana Letter Small Wo
			0x1b164...0x1b167, // Katakana Letter Small Wi..Katakana Letter Small N
			0x1b170...0x1b2fb, // Nushu Character-1b170   ..Nushu Character-1b2fb
			0x1f004...0x1f004, // Mahjong Tile Red Dragon
			0x1f0cf...0x1f0cf, // Playing Card Black Joker
			0x1f18e...0x1f18e, // Negative Squared Ab
			0x1f191...0x1f19a, // Squared Cl              ..Squared Vs
			0x1f200...0x1f202, // Square Hiragana Hoka    ..Squared Katakana Sa
			0x1f210...0x1f23b, // Squared Cjk Unified Ideo..Squared Cjk Unified Ideo
			0x1f240...0x1f248, // Tortoise Shell Bracketed..Tortoise Shell Bracketed
			0x1f250...0x1f251, // Circled Ideograph Advant..Circled Ideograph Accept
			0x1f260...0x1f265, // Rounded Symbol For Fu   ..Rounded Symbol For Cai
			0x1f300...0x1f320, // Cyclone                 ..Shooting Star
			0x1f32d...0x1f335, // Hot Dog                 ..Cactus
			0x1f337...0x1f37c, // Tulip                   ..Baby Bottle
			0x1f37e...0x1f393, // Bottle With Popping Cork..Graduation Cap
			0x1f3a0...0x1f3ca, // Carousel Horse          ..Swimmer
			0x1f3cf...0x1f3d3, // Cricket Bat And Ball    ..Table Tennis Paddle And
			0x1f3e0...0x1f3f0, // House Building          ..European Castle
			0x1f3f4...0x1f3f4, // Waving Black Flag
			0x1f3f8...0x1f3fa, // Badminton Racquet And Sh..Amphora
			0x1f400...0x1f43e, // Rat                     ..Paw Prints
			0x1f440...0x1f440, // Eyes
			0x1f442...0x1f4fc, // Ear                     ..Videocassette
			0x1f4ff...0x1f53d, // Prayer Beads            ..Down-pointing Small Red
			0x1f54b...0x1f54e, // Kaaba                   ..Menorah With Nine Branch
			0x1f550...0x1f567, // Clock Face One Oclock   ..Clock Face Twelve-thirty
			0x1f57a...0x1f57a, // Man Dancing
			0x1f595...0x1f596, // Reversed Hand With Middl..Raised Hand With Part Be
			0x1f5a4...0x1f5a4, // Black Heart
			0x1f5fb...0x1f64f, // Mount Fuji              ..Person With Folded Hands
			0x1f680...0x1f6c5, // Rocket                  ..Left Luggage
			0x1f6cc...0x1f6cc, // Sleeping Accommodation
			0x1f6d0...0x1f6d2, // Place Of Worship        ..Shopping Trolley
			0x1f6d5...0x1f6d7, // Hindu Temple            ..Elevator
			0x1f6dd...0x1f6df, // Playground Slide        ..Ring Buoy
			0x1f6eb...0x1f6ec, // Airplane Departure      ..Airplane Arriving
			0x1f6f4...0x1f6fc, // Scooter                 ..Roller Skate
			0x1f7e0...0x1f7eb, // Large Orange Circle     ..Large Brown Square
			0x1f7f0...0x1f7f0, // Heavy Equals Sign
			0x1f90c...0x1f93a, // Pinched Fingers         ..Fencer
			0x1f93c...0x1f945, // Wrestlers               ..Goal Net
			0x1f947...0x1f9ff, // First Place Medal       ..Nazar Amulet
			0x1fa70...0x1fa74, // Ballet Shoes            ..Thong Sandal
			0x1fa78...0x1fa7c, // Drop Of Blood           ..Crutch
			0x1fa80...0x1fa86, // Yo-yo                   ..Nesting Dolls
			0x1fa90...0x1faac, // Ringed Planet           ..Hamsa
			0x1fab0...0x1faba, // Fly                     ..Nest With Eggs
			0x1fac0...0x1fac5, // Anatomical Heart        ..Person With Crown
			0x1fad0...0x1fad9, // Blueberries             ..Jar
			0x1fae0...0x1fae7, // Melting Face            ..Bubbles
			0x1faf0...0x1faf6, // Hand With Index Finger A..Heart Hands
			0x20000...0x2fffd, // Cjk Unified Ideograph-20..(nil)
			0x30000...0x3fffd, // Cjk Unified Ideograph-30..(nil)
			=> true,
			else => false,
		},
		.@"15.0.0" => switch (codepoint) {
			// Source: EastAsianWidth-15.0.0.txt
			// Date: 2022-05-24, 17:40:20 GMT [KW, LI]
			0x01100...0x0115f, // Hangul Choseong Kiyeok  ..Hangul Choseong Filler
			0x0231a...0x0231b, // Watch                   ..Hourglass
			0x02329...0x0232a, // Left-pointing Angle Brac..Right-pointing Angle Bra
			0x023e9...0x023ec, // Black Right-pointing Dou..Black Down-pointing Doub
			0x023f0...0x023f0, // Alarm Clock
			0x023f3...0x023f3, // Hourglass With Flowing Sand
			0x025fd...0x025fe, // White Medium Small Squar..Black Medium Small Squar
			0x02614...0x02615, // Umbrella With Rain Drops..Hot Beverage
			0x02648...0x02653, // Aries                   ..Pisces
			0x0267f...0x0267f, // Wheelchair Symbol
			0x02693...0x02693, // Anchor
			0x026a1...0x026a1, // High Voltage Sign
			0x026aa...0x026ab, // Medium White Circle     ..Medium Black Circle
			0x026bd...0x026be, // Soccer Ball             ..Baseball
			0x026c4...0x026c5, // Snowman Without Snow    ..Sun Behind Cloud
			0x026ce...0x026ce, // Ophiuchus
			0x026d4...0x026d4, // No Entry
			0x026ea...0x026ea, // Church
			0x026f2...0x026f3, // Fountain                ..Flag In Hole
			0x026f5...0x026f5, // Sailboat
			0x026fa...0x026fa, // Tent
			0x026fd...0x026fd, // Fuel Pump
			0x02705...0x02705, // White Heavy Check Mark
			0x0270a...0x0270b, // Raised Fist             ..Raised Hand
			0x02728...0x02728, // Sparkles
			0x0274c...0x0274c, // Cross Mark
			0x0274e...0x0274e, // Negative Squared Cross Mark
			0x02753...0x02755, // Black Question Mark Orna..White Exclamation Mark O
			0x02757...0x02757, // Heavy Exclamation Mark Symbol
			0x02795...0x02797, // Heavy Plus Sign         ..Heavy Division Sign
			0x027b0...0x027b0, // Curly Loop
			0x027bf...0x027bf, // Double Curly Loop
			0x02b1b...0x02b1c, // Black Large Square      ..White Large Square
			0x02b50...0x02b50, // White Medium Star
			0x02b55...0x02b55, // Heavy Large Circle
			0x02e80...0x02e99, // Cjk Radical Repeat      ..Cjk Radical Rap
			0x02e9b...0x02ef3, // Cjk Radical Choke       ..Cjk Radical C-simplified
			0x02f00...0x02fd5, // Kangxi Radical One      ..Kangxi Radical Flute
			0x02ff0...0x02ffb, // Ideographic Description ..Ideographic Description
			0x03000...0x03029, // Ideographic Space       ..Hangzhou Numeral Nine
			0x03030...0x0303e, // Wavy Dash               ..Ideographic Variation In
			0x03041...0x03096, // Hiragana Letter Small A ..Hiragana Letter Small Ke
			0x0309b...0x030ff, // Katakana-hiragana Voiced..Katakana Digraph Koto
			0x03105...0x0312f, // Bopomofo Letter B       ..Bopomofo Letter Nn
			0x03131...0x0318e, // Hangul Letter Kiyeok    ..Hangul Letter Araeae
			0x03190...0x031e3, // Ideographic Annotation L..Cjk Stroke Q
			0x031f0...0x0321e, // Katakana Letter Small Ku..Parenthesized Korean Cha
			0x03220...0x03247, // Parenthesized Ideograph ..Circled Ideograph Koto
			0x03250...0x04dbf, // Partnership Sign        ..Cjk Unified Ideograph-4d
			0x04e00...0x0a48c, // Cjk Unified Ideograph-4e..Yi Syllable Yyr
			0x0a490...0x0a4c6, // Yi Radical Qot          ..Yi Radical Ke
			0x0a960...0x0a97c, // Hangul Choseong Tikeut-m..Hangul Choseong Ssangyeo
			0x0ac00...0x0d7a3, // Hangul Syllable Ga      ..Hangul Syllable Hih
			0x0f900...0x0faff, // Cjk Compatibility Ideogr..(nil)
			0x0fe10...0x0fe19, // Presentation Form For Ve..Presentation Form For Ve
			0x0fe30...0x0fe52, // Presentation Form For Ve..Small Full Stop
			0x0fe54...0x0fe66, // Small Semicolon         ..Small Equals Sign
			0x0fe68...0x0fe6b, // Small Reverse Solidus   ..Small Commercial At
			0x0ff01...0x0ff60, // Fullwidth Exclamation Ma..Fullwidth Right White Pa
			0x0ffe0...0x0ffe6, // Fullwidth Cent Sign     ..Fullwidth Won Sign
			0x16fe0...0x16fe3, // Tangut Iteration Mark   ..Old Chinese Iteration Ma
			0x17000...0x187f7, // (nil)
			0x18800...0x18cd5, // Tangut Component-001    ..Khitan Small Script Char
			0x18d00...0x18d08, // (nil)
			0x1aff0...0x1aff3, // Katakana Letter Minnan T..Katakana Letter Minnan T
			0x1aff5...0x1affb, // Katakana Letter Minnan T..Katakana Letter Minnan N
			0x1affd...0x1affe, // Katakana Letter Minnan N..Katakana Letter Minnan N
			0x1b000...0x1b122, // Katakana Letter Archaic ..Katakana Letter Archaic
			0x1b132...0x1b132, // Hiragana Letter Small Ko
			0x1b150...0x1b152, // Hiragana Letter Small Wi..Hiragana Letter Small Wo
			0x1b155...0x1b155, // Katakana Letter Small Ko
			0x1b164...0x1b167, // Katakana Letter Small Wi..Katakana Letter Small N
			0x1b170...0x1b2fb, // Nushu Character-1b170   ..Nushu Character-1b2fb
			0x1f004...0x1f004, // Mahjong Tile Red Dragon
			0x1f0cf...0x1f0cf, // Playing Card Black Joker
			0x1f18e...0x1f18e, // Negative Squared Ab
			0x1f191...0x1f19a, // Squared Cl              ..Squared Vs
			0x1f200...0x1f202, // Square Hiragana Hoka    ..Squared Katakana Sa
			0x1f210...0x1f23b, // Squared Cjk Unified Ideo..Squared Cjk Unified Ideo
			0x1f240...0x1f248, // Tortoise Shell Bracketed..Tortoise Shell Bracketed
			0x1f250...0x1f251, // Circled Ideograph Advant..Circled Ideograph Accept
			0x1f260...0x1f265, // Rounded Symbol For Fu   ..Rounded Symbol For Cai
			0x1f300...0x1f320, // Cyclone                 ..Shooting Star
			0x1f32d...0x1f335, // Hot Dog                 ..Cactus
			0x1f337...0x1f37c, // Tulip                   ..Baby Bottle
			0x1f37e...0x1f393, // Bottle With Popping Cork..Graduation Cap
			0x1f3a0...0x1f3ca, // Carousel Horse          ..Swimmer
			0x1f3cf...0x1f3d3, // Cricket Bat And Ball    ..Table Tennis Paddle And
			0x1f3e0...0x1f3f0, // House Building          ..European Castle
			0x1f3f4...0x1f3f4, // Waving Black Flag
			0x1f3f8...0x1f3fa, // Badminton Racquet And Sh..Amphora
			0x1f400...0x1f43e, // Rat                     ..Paw Prints
			0x1f440...0x1f440, // Eyes
			0x1f442...0x1f4fc, // Ear                     ..Videocassette
			0x1f4ff...0x1f53d, // Prayer Beads            ..Down-pointing Small Red
			0x1f54b...0x1f54e, // Kaaba                   ..Menorah With Nine Branch
			0x1f550...0x1f567, // Clock Face One Oclock   ..Clock Face Twelve-thirty
			0x1f57a...0x1f57a, // Man Dancing
			0x1f595...0x1f596, // Reversed Hand With Middl..Raised Hand With Part Be
			0x1f5a4...0x1f5a4, // Black Heart
			0x1f5fb...0x1f64f, // Mount Fuji              ..Person With Folded Hands
			0x1f680...0x1f6c5, // Rocket                  ..Left Luggage
			0x1f6cc...0x1f6cc, // Sleeping Accommodation
			0x1f6d0...0x1f6d2, // Place Of Worship        ..Shopping Trolley
			0x1f6d5...0x1f6d7, // Hindu Temple            ..Elevator
			0x1f6dc...0x1f6df, // Wireless                ..Ring Buoy
			0x1f6eb...0x1f6ec, // Airplane Departure      ..Airplane Arriving
			0x1f6f4...0x1f6fc, // Scooter                 ..Roller Skate
			0x1f7e0...0x1f7eb, // Large Orange Circle     ..Large Brown Square
			0x1f7f0...0x1f7f0, // Heavy Equals Sign
			0x1f90c...0x1f93a, // Pinched Fingers         ..Fencer
			0x1f93c...0x1f945, // Wrestlers               ..Goal Net
			0x1f947...0x1f9ff, // First Place Medal       ..Nazar Amulet
			0x1fa70...0x1fa7c, // Ballet Shoes            ..Crutch
			0x1fa80...0x1fa88, // Yo-yo                   ..Flute
			0x1fa90...0x1fabd, // Ringed Planet           ..Wing
			0x1fabf...0x1fac5, // Goose                   ..Person With Crown
			0x1face...0x1fadb, // Moose                   ..Pea Pod
			0x1fae0...0x1fae8, // Melting Face            ..Shaking Face
			0x1faf0...0x1faf8, // Hand With Index Finger A..Rightwards Pushing Hand
			0x20000...0x2fffd, // Cjk Unified Ideograph-20..(nil)
			0x30000...0x3fffd, // Cjk Unified Ideograph-30..(nil)
			=> true,
			else => false,
		},
		.@"15.1.0" => switch (codepoint) {
			// Source: EastAsianWidth-15.1.0.txt
			// Date: 2023-07-28, 23:34:08 GMT
			0x01100...0x0115f, // Hangul Choseong Kiyeok  ..Hangul Choseong Filler
			0x0231a...0x0231b, // Watch                   ..Hourglass
			0x02329...0x0232a, // Left-pointing Angle Brac..Right-pointing Angle Bra
			0x023e9...0x023ec, // Black Right-pointing Dou..Black Down-pointing Doub
			0x023f0...0x023f0, // Alarm Clock
			0x023f3...0x023f3, // Hourglass With Flowing Sand
			0x025fd...0x025fe, // White Medium Small Squar..Black Medium Small Squar
			0x02614...0x02615, // Umbrella With Rain Drops..Hot Beverage
			0x02648...0x02653, // Aries                   ..Pisces
			0x0267f...0x0267f, // Wheelchair Symbol
			0x02693...0x02693, // Anchor
			0x026a1...0x026a1, // High Voltage Sign
			0x026aa...0x026ab, // Medium White Circle     ..Medium Black Circle
			0x026bd...0x026be, // Soccer Ball             ..Baseball
			0x026c4...0x026c5, // Snowman Without Snow    ..Sun Behind Cloud
			0x026ce...0x026ce, // Ophiuchus
			0x026d4...0x026d4, // No Entry
			0x026ea...0x026ea, // Church
			0x026f2...0x026f3, // Fountain                ..Flag In Hole
			0x026f5...0x026f5, // Sailboat
			0x026fa...0x026fa, // Tent
			0x026fd...0x026fd, // Fuel Pump
			0x02705...0x02705, // White Heavy Check Mark
			0x0270a...0x0270b, // Raised Fist             ..Raised Hand
			0x02728...0x02728, // Sparkles
			0x0274c...0x0274c, // Cross Mark
			0x0274e...0x0274e, // Negative Squared Cross Mark
			0x02753...0x02755, // Black Question Mark Orna..White Exclamation Mark O
			0x02757...0x02757, // Heavy Exclamation Mark Symbol
			0x02795...0x02797, // Heavy Plus Sign         ..Heavy Division Sign
			0x027b0...0x027b0, // Curly Loop
			0x027bf...0x027bf, // Double Curly Loop
			0x02b1b...0x02b1c, // Black Large Square      ..White Large Square
			0x02b50...0x02b50, // White Medium Star
			0x02b55...0x02b55, // Heavy Large Circle
			0x02e80...0x02e99, // Cjk Radical Repeat      ..Cjk Radical Rap
			0x02e9b...0x02ef3, // Cjk Radical Choke       ..Cjk Radical C-simplified
			0x02f00...0x02fd5, // Kangxi Radical One      ..Kangxi Radical Flute
			0x02ff0...0x03029, // Ideographic Description ..Hangzhou Numeral Nine
			0x03030...0x0303e, // Wavy Dash               ..Ideographic Variation In
			0x03041...0x03096, // Hiragana Letter Small A ..Hiragana Letter Small Ke
			0x0309b...0x030ff, // Katakana-hiragana Voiced..Katakana Digraph Koto
			0x03105...0x0312f, // Bopomofo Letter B       ..Bopomofo Letter Nn
			0x03131...0x0318e, // Hangul Letter Kiyeok    ..Hangul Letter Araeae
			0x03190...0x031e3, // Ideographic Annotation L..Cjk Stroke Q
			0x031ef...0x0321e, // (nil)                   ..Parenthesized Korean Cha
			0x03220...0x03247, // Parenthesized Ideograph ..Circled Ideograph Koto
			0x03250...0x04dbf, // Partnership Sign        ..Cjk Unified Ideograph-4d
			0x04e00...0x0a48c, // Cjk Unified Ideograph-4e..Yi Syllable Yyr
			0x0a490...0x0a4c6, // Yi Radical Qot          ..Yi Radical Ke
			0x0a960...0x0a97c, // Hangul Choseong Tikeut-m..Hangul Choseong Ssangyeo
			0x0ac00...0x0d7a3, // Hangul Syllable Ga      ..Hangul Syllable Hih
			0x0f900...0x0faff, // Cjk Compatibility Ideogr..(nil)
			0x0fe10...0x0fe19, // Presentation Form For Ve..Presentation Form For Ve
			0x0fe30...0x0fe52, // Presentation Form For Ve..Small Full Stop
			0x0fe54...0x0fe66, // Small Semicolon         ..Small Equals Sign
			0x0fe68...0x0fe6b, // Small Reverse Solidus   ..Small Commercial At
			0x0ff01...0x0ff60, // Fullwidth Exclamation Ma..Fullwidth Right White Pa
			0x0ffe0...0x0ffe6, // Fullwidth Cent Sign     ..Fullwidth Won Sign
			0x16fe0...0x16fe3, // Tangut Iteration Mark   ..Old Chinese Iteration Ma
			0x17000...0x187f7, // (nil)
			0x18800...0x18cd5, // Tangut Component-001    ..Khitan Small Script Char
			0x18d00...0x18d08, // (nil)
			0x1aff0...0x1aff3, // Katakana Letter Minnan T..Katakana Letter Minnan T
			0x1aff5...0x1affb, // Katakana Letter Minnan T..Katakana Letter Minnan N
			0x1affd...0x1affe, // Katakana Letter Minnan N..Katakana Letter Minnan N
			0x1b000...0x1b122, // Katakana Letter Archaic ..Katakana Letter Archaic
			0x1b132...0x1b132, // Hiragana Letter Small Ko
			0x1b150...0x1b152, // Hiragana Letter Small Wi..Hiragana Letter Small Wo
			0x1b155...0x1b155, // Katakana Letter Small Ko
			0x1b164...0x1b167, // Katakana Letter Small Wi..Katakana Letter Small N
			0x1b170...0x1b2fb, // Nushu Character-1b170   ..Nushu Character-1b2fb
			0x1f004...0x1f004, // Mahjong Tile Red Dragon
			0x1f0cf...0x1f0cf, // Playing Card Black Joker
			0x1f18e...0x1f18e, // Negative Squared Ab
			0x1f191...0x1f19a, // Squared Cl              ..Squared Vs
			0x1f200...0x1f202, // Square Hiragana Hoka    ..Squared Katakana Sa
			0x1f210...0x1f23b, // Squared Cjk Unified Ideo..Squared Cjk Unified Ideo
			0x1f240...0x1f248, // Tortoise Shell Bracketed..Tortoise Shell Bracketed
			0x1f250...0x1f251, // Circled Ideograph Advant..Circled Ideograph Accept
			0x1f260...0x1f265, // Rounded Symbol For Fu   ..Rounded Symbol For Cai
			0x1f300...0x1f320, // Cyclone                 ..Shooting Star
			0x1f32d...0x1f335, // Hot Dog                 ..Cactus
			0x1f337...0x1f37c, // Tulip                   ..Baby Bottle
			0x1f37e...0x1f393, // Bottle With Popping Cork..Graduation Cap
			0x1f3a0...0x1f3ca, // Carousel Horse          ..Swimmer
			0x1f3cf...0x1f3d3, // Cricket Bat And Ball    ..Table Tennis Paddle And
			0x1f3e0...0x1f3f0, // House Building          ..European Castle
			0x1f3f4...0x1f3f4, // Waving Black Flag
			0x1f3f8...0x1f3fa, // Badminton Racquet And Sh..Amphora
			0x1f400...0x1f43e, // Rat                     ..Paw Prints
			0x1f440...0x1f440, // Eyes
			0x1f442...0x1f4fc, // Ear                     ..Videocassette
			0x1f4ff...0x1f53d, // Prayer Beads            ..Down-pointing Small Red
			0x1f54b...0x1f54e, // Kaaba                   ..Menorah With Nine Branch
			0x1f550...0x1f567, // Clock Face One Oclock   ..Clock Face Twelve-thirty
			0x1f57a...0x1f57a, // Man Dancing
			0x1f595...0x1f596, // Reversed Hand With Middl..Raised Hand With Part Be
			0x1f5a4...0x1f5a4, // Black Heart
			0x1f5fb...0x1f64f, // Mount Fuji              ..Person With Folded Hands
			0x1f680...0x1f6c5, // Rocket                  ..Left Luggage
			0x1f6cc...0x1f6cc, // Sleeping Accommodation
			0x1f6d0...0x1f6d2, // Place Of Worship        ..Shopping Trolley
			0x1f6d5...0x1f6d7, // Hindu Temple            ..Elevator
			0x1f6dc...0x1f6df, // Wireless                ..Ring Buoy
			0x1f6eb...0x1f6ec, // Airplane Departure      ..Airplane Arriving
			0x1f6f4...0x1f6fc, // Scooter                 ..Roller Skate
			0x1f7e0...0x1f7eb, // Large Orange Circle     ..Large Brown Square
			0x1f7f0...0x1f7f0, // Heavy Equals Sign
			0x1f90c...0x1f93a, // Pinched Fingers         ..Fencer
			0x1f93c...0x1f945, // Wrestlers               ..Goal Net
			0x1f947...0x1f9ff, // First Place Medal       ..Nazar Amulet
			0x1fa70...0x1fa7c, // Ballet Shoes            ..Crutch
			0x1fa80...0x1fa88, // Yo-yo                   ..Flute
			0x1fa90...0x1fabd, // Ringed Planet           ..Wing
			0x1fabf...0x1fac5, // Goose                   ..Person With Crown
			0x1face...0x1fadb, // Moose                   ..Pea Pod
			0x1fae0...0x1fae8, // Melting Face            ..Shaking Face
			0x1faf0...0x1faf8, // Hand With Index Finger A..Rightwards Pushing Hand
			0x20000...0x2fffd, // Cjk Unified Ideograph-20..(nil)
			0x30000...0x3fffd, // Cjk Unified Ideograph-30..(nil)
			=> true,
			else => false,
		},
	};
}