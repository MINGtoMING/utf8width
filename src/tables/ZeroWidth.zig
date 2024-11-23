const std = @import("std");  
const UnicodeVersion = @import("../version.zig").UnicodeVersion;

const ZeroWidth = @This();

version: UnicodeVersion,

pub inline fn init(version: UnicodeVersion) ZeroWidth {
    return .{ .version = version };
}

pub inline fn contains(self: ZeroWidth, codepoint: u21) bool {
    return switch (self.version) {
		.@"4.1.0" => switch (codepoint) {
			// Source: DerivedGeneralCategory-4.1.0.txt
			// Date: 2005-02-26, 02:35:50 GMT [MD]
			0x00000...0x00000, // (nil)
			0x000ad...0x000ad, // Soft Hyphen
			0x00300...0x0036f, // Combining Grave Accent  ..Combining Latin Small Le
			0x00483...0x00486, // Combining Cyrillic Titlo..Combining Cyrillic Psili
			0x00488...0x00489, // Combining Cyrillic Hundr..Combining Cyrillic Milli
			0x00591...0x005b9, // Hebrew Accent Etnahta   ..Hebrew Point Holam
			0x005bb...0x005bd, // Hebrew Point Qubuts     ..Hebrew Point Meteg
			0x005bf...0x005bf, // Hebrew Point Rafe
			0x005c1...0x005c2, // Hebrew Point Shin Dot   ..Hebrew Point Sin Dot
			0x005c4...0x005c5, // Hebrew Mark Upper Dot   ..Hebrew Mark Lower Dot
			0x005c7...0x005c7, // Hebrew Point Qamats Qatan
			0x00600...0x00603, // Arabic Number Sign      ..Arabic Sign Safha
			0x00610...0x00615, // Arabic Sign Sallallahou ..Arabic Small High Tah
			0x0064b...0x0065e, // Arabic Fathatan         ..Arabic Fatha With Two Do
			0x00670...0x00670, // Arabic Letter Superscript Alef
			0x006d6...0x006e4, // Arabic Small High Ligatu..Arabic Small High Madda
			0x006e7...0x006e8, // Arabic Small High Yeh   ..Arabic Small High Noon
			0x006ea...0x006ed, // Arabic Empty Centre Low ..Arabic Small Low Meem
			0x0070f...0x0070f, // Syriac Abbreviation Mark
			0x00711...0x00711, // Syriac Letter Superscript Alaph
			0x00730...0x0074a, // Syriac Pthaha Above     ..Syriac Barrekh
			0x007a6...0x007b0, // Thaana Abafili          ..Thaana Sukun
			0x00901...0x00903, // Devanagari Sign Candrabi..Devanagari Sign Visarga
			0x0093c...0x0093c, // Devanagari Sign Nukta
			0x0093e...0x0094d, // Devanagari Vowel Sign Aa..Devanagari Sign Virama
			0x00951...0x00954, // Devanagari Stress Sign U..Devanagari Acute Accent
			0x00962...0x00963, // Devanagari Vowel Sign Vo..Devanagari Vowel Sign Vo
			0x00981...0x00983, // Bengali Sign Candrabindu..Bengali Sign Visarga
			0x009bc...0x009bc, // Bengali Sign Nukta
			0x009be...0x009c4, // Bengali Vowel Sign Aa   ..Bengali Vowel Sign Vocal
			0x009c7...0x009c8, // Bengali Vowel Sign E    ..Bengali Vowel Sign Ai
			0x009cb...0x009cd, // Bengali Vowel Sign O    ..Bengali Sign Virama
			0x009d7...0x009d7, // Bengali Au Length Mark
			0x009e2...0x009e3, // Bengali Vowel Sign Vocal..Bengali Vowel Sign Vocal
			0x00a01...0x00a03, // Gurmukhi Sign Adak Bindi..Gurmukhi Sign Visarga
			0x00a3c...0x00a3c, // Gurmukhi Sign Nukta
			0x00a3e...0x00a42, // Gurmukhi Vowel Sign Aa  ..Gurmukhi Vowel Sign Uu
			0x00a47...0x00a48, // Gurmukhi Vowel Sign Ee  ..Gurmukhi Vowel Sign Ai
			0x00a4b...0x00a4d, // Gurmukhi Vowel Sign Oo  ..Gurmukhi Sign Virama
			0x00a70...0x00a71, // Gurmukhi Tippi          ..Gurmukhi Addak
			0x00a81...0x00a83, // Gujarati Sign Candrabind..Gujarati Sign Visarga
			0x00abc...0x00abc, // Gujarati Sign Nukta
			0x00abe...0x00ac5, // Gujarati Vowel Sign Aa  ..Gujarati Vowel Sign Cand
			0x00ac7...0x00ac9, // Gujarati Vowel Sign E   ..Gujarati Vowel Sign Cand
			0x00acb...0x00acd, // Gujarati Vowel Sign O   ..Gujarati Sign Virama
			0x00ae2...0x00ae3, // Gujarati Vowel Sign Voca..Gujarati Vowel Sign Voca
			0x00b01...0x00b03, // Oriya Sign Candrabindu  ..Oriya Sign Visarga
			0x00b3c...0x00b3c, // Oriya Sign Nukta
			0x00b3e...0x00b43, // Oriya Vowel Sign Aa     ..Oriya Vowel Sign Vocalic
			0x00b47...0x00b48, // Oriya Vowel Sign E      ..Oriya Vowel Sign Ai
			0x00b4b...0x00b4d, // Oriya Vowel Sign O      ..Oriya Sign Virama
			0x00b56...0x00b57, // Oriya Ai Length Mark    ..Oriya Au Length Mark
			0x00b82...0x00b82, // Tamil Sign Anusvara
			0x00bbe...0x00bc2, // Tamil Vowel Sign Aa     ..Tamil Vowel Sign Uu
			0x00bc6...0x00bc8, // Tamil Vowel Sign E      ..Tamil Vowel Sign Ai
			0x00bca...0x00bcd, // Tamil Vowel Sign O      ..Tamil Sign Virama
			0x00bd7...0x00bd7, // Tamil Au Length Mark
			0x00c01...0x00c03, // Telugu Sign Candrabindu ..Telugu Sign Visarga
			0x00c3e...0x00c44, // Telugu Vowel Sign Aa    ..Telugu Vowel Sign Vocali
			0x00c46...0x00c48, // Telugu Vowel Sign E     ..Telugu Vowel Sign Ai
			0x00c4a...0x00c4d, // Telugu Vowel Sign O     ..Telugu Sign Virama
			0x00c55...0x00c56, // Telugu Length Mark      ..Telugu Ai Length Mark
			0x00c82...0x00c83, // Kannada Sign Anusvara   ..Kannada Sign Visarga
			0x00cbc...0x00cbc, // Kannada Sign Nukta
			0x00cbe...0x00cc4, // Kannada Vowel Sign Aa   ..Kannada Vowel Sign Vocal
			0x00cc6...0x00cc8, // Kannada Vowel Sign E    ..Kannada Vowel Sign Ai
			0x00cca...0x00ccd, // Kannada Vowel Sign O    ..Kannada Sign Virama
			0x00cd5...0x00cd6, // Kannada Length Mark     ..Kannada Ai Length Mark
			0x00d02...0x00d03, // Malayalam Sign Anusvara ..Malayalam Sign Visarga
			0x00d3e...0x00d43, // Malayalam Vowel Sign Aa ..Malayalam Vowel Sign Voc
			0x00d46...0x00d48, // Malayalam Vowel Sign E  ..Malayalam Vowel Sign Ai
			0x00d4a...0x00d4d, // Malayalam Vowel Sign O  ..Malayalam Sign Virama
			0x00d57...0x00d57, // Malayalam Au Length Mark
			0x00d82...0x00d83, // Sinhala Sign Anusvaraya ..Sinhala Sign Visargaya
			0x00dca...0x00dca, // Sinhala Sign Al-lakuna
			0x00dcf...0x00dd4, // Sinhala Vowel Sign Aela-..Sinhala Vowel Sign Ketti
			0x00dd6...0x00dd6, // Sinhala Vowel Sign Diga Paa-pilla
			0x00dd8...0x00ddf, // Sinhala Vowel Sign Gaett..Sinhala Vowel Sign Gayan
			0x00df2...0x00df3, // Sinhala Vowel Sign Diga ..Sinhala Vowel Sign Diga
			0x00e31...0x00e31, // Thai Character Mai Han-akat
			0x00e34...0x00e3a, // Thai Character Sara I   ..Thai Character Phinthu
			0x00e47...0x00e4e, // Thai Character Maitaikhu..Thai Character Yamakkan
			0x00eb1...0x00eb1, // Lao Vowel Sign Mai Kan
			0x00eb4...0x00eb9, // Lao Vowel Sign I        ..Lao Vowel Sign Uu
			0x00ebb...0x00ebc, // Lao Vowel Sign Mai Kon  ..Lao Semivowel Sign Lo
			0x00ec8...0x00ecd, // Lao Tone Mai Ek         ..Lao Niggahita
			0x00f18...0x00f19, // Tibetan Astrological Sig..Tibetan Astrological Sig
			0x00f35...0x00f35, // Tibetan Mark Ngas Bzung Nyi Zla
			0x00f37...0x00f37, // Tibetan Mark Ngas Bzung Sgor Rtags
			0x00f39...0x00f39, // Tibetan Mark Tsa -phru
			0x00f3e...0x00f3f, // Tibetan Sign Yar Tshes  ..Tibetan Sign Mar Tshes
			0x00f71...0x00f84, // Tibetan Vowel Sign Aa   ..Tibetan Mark Halanta
			0x00f86...0x00f87, // Tibetan Sign Lci Rtags  ..Tibetan Sign Yang Rtags
			0x00f90...0x00f97, // Tibetan Subjoined Letter..Tibetan Subjoined Letter
			0x00f99...0x00fbc, // Tibetan Subjoined Letter..Tibetan Subjoined Letter
			0x00fc6...0x00fc6, // Tibetan Symbol Padma Gdan
			0x0102c...0x01032, // Myanmar Vowel Sign Aa   ..Myanmar Vowel Sign Ai
			0x01036...0x01039, // Myanmar Sign Anusvara   ..Myanmar Sign Virama
			0x01056...0x01059, // Myanmar Vowel Sign Vocal..Myanmar Vowel Sign Vocal
			0x01160...0x011ff, // Hangul Jungseong Filler ..Hangul Jongseong Ssangni
			0x0135f...0x0135f, // Ethiopic Combining Gemination Mark
			0x01712...0x01714, // Tagalog Vowel Sign I    ..Tagalog Sign Virama
			0x01732...0x01734, // Hanunoo Vowel Sign I    ..Hanunoo Sign Pamudpod
			0x01752...0x01753, // Buhid Vowel Sign I      ..Buhid Vowel Sign U
			0x01772...0x01773, // Tagbanwa Vowel Sign I   ..Tagbanwa Vowel Sign U
			0x017b4...0x017d3, // Khmer Vowel Inherent Aq ..Khmer Sign Bathamasat
			0x017dd...0x017dd, // Khmer Sign Atthacan
			0x0180b...0x0180d, // Mongolian Free Variation..Mongolian Free Variation
			0x018a9...0x018a9, // Mongolian Letter Ali Gali Dagalga
			0x01920...0x0192b, // Limbu Vowel Sign A      ..Limbu Subjoined Letter W
			0x01930...0x0193b, // Limbu Small Letter Ka   ..Limbu Sign Sa-i
			0x019b0...0x019c0, // New Tai Lue Vowel Sign V..New Tai Lue Vowel Sign I
			0x019c8...0x019c9, // New Tai Lue Tone Mark-1 ..New Tai Lue Tone Mark-2
			0x01a17...0x01a1b, // Buginese Vowel Sign I   ..Buginese Vowel Sign Ae
			0x01dc0...0x01dc3, // Combining Dotted Grave A..Combining Suspension Mar
			0x0200b...0x0200f, // Zero Width Space        ..Right-to-left Mark
			0x02028...0x0202e, // Line Separator          ..Right-to-left Override
			0x02060...0x02063, // Word Joiner             ..Invisible Separator
			0x0206a...0x0206f, // Inhibit Symmetric Swappi..Nominal Digit Shapes
			0x020d0...0x020eb, // Combining Left Harpoon A..Combining Long Double So
			0x0302a...0x0302f, // Ideographic Level Tone M..Hangul Double Dot Tone M
			0x03099...0x0309a, // Combining Katakana-hirag..Combining Katakana-hirag
			0x0a802...0x0a802, // Syloti Nagri Sign Dvisvara
			0x0a806...0x0a806, // Syloti Nagri Sign Hasanta
			0x0a80b...0x0a80b, // Syloti Nagri Sign Anusvara
			0x0a823...0x0a827, // Syloti Nagri Vowel Sign ..Syloti Nagri Vowel Sign
			0x0d7b0...0x0d7ff, // Hangul Jungseong O-yeo  ..(nil)
			0x0fb1e...0x0fb1e, // Hebrew Point Judeo-spanish Varika
			0x0fe00...0x0fe0f, // Variation Selector-1    ..Variation Selector-16
			0x0fe20...0x0fe23, // Combining Ligature Left ..Combining Double Tilde R
			0x0feff...0x0feff, // Zero Width No-break Space
			0x0fff9...0x0fffb, // Interlinear Annotation A..Interlinear Annotation T
			0x10a01...0x10a03, // Kharoshthi Vowel Sign I ..Kharoshthi Vowel Sign Vo
			0x10a05...0x10a06, // Kharoshthi Vowel Sign E ..Kharoshthi Vowel Sign O
			0x10a0c...0x10a0f, // Kharoshthi Vowel Length ..Kharoshthi Sign Visarga
			0x10a38...0x10a3a, // Kharoshthi Sign Bar Abov..Kharoshthi Sign Dot Belo
			0x10a3f...0x10a3f, // Kharoshthi Virama
			0x1d165...0x1d169, // Musical Symbol Combining..Musical Symbol Combining
			0x1d16d...0x1d182, // Musical Symbol Combining..Musical Symbol Combining
			0x1d185...0x1d18b, // Musical Symbol Combining..Musical Symbol Combining
			0x1d1aa...0x1d1ad, // Musical Symbol Combining..Musical Symbol Combining
			0x1d242...0x1d244, // Combining Greek Musical ..Combining Greek Musical
			0xe0001...0xe0001, // Language Tag
			0xe0020...0xe007f, // Tag Space               ..Cancel Tag
			0xe0100...0xe01ef, // Variation Selector-17   ..Variation Selector-256
			=> true,
			else => false,
		},
		.@"5.0.0" => switch (codepoint) {
			// Source: DerivedGeneralCategory-5.0.0.txt
			// Date: 2006-02-27, 23:41:27 GMT [MD]
			0x00000...0x00000, // (nil)
			0x000ad...0x000ad, // Soft Hyphen
			0x00300...0x0036f, // Combining Grave Accent  ..Combining Latin Small Le
			0x00483...0x00486, // Combining Cyrillic Titlo..Combining Cyrillic Psili
			0x00488...0x00489, // Combining Cyrillic Hundr..Combining Cyrillic Milli
			0x00591...0x005bd, // Hebrew Accent Etnahta   ..Hebrew Point Meteg
			0x005bf...0x005bf, // Hebrew Point Rafe
			0x005c1...0x005c2, // Hebrew Point Shin Dot   ..Hebrew Point Sin Dot
			0x005c4...0x005c5, // Hebrew Mark Upper Dot   ..Hebrew Mark Lower Dot
			0x005c7...0x005c7, // Hebrew Point Qamats Qatan
			0x00600...0x00603, // Arabic Number Sign      ..Arabic Sign Safha
			0x00610...0x00615, // Arabic Sign Sallallahou ..Arabic Small High Tah
			0x0064b...0x0065e, // Arabic Fathatan         ..Arabic Fatha With Two Do
			0x00670...0x00670, // Arabic Letter Superscript Alef
			0x006d6...0x006e4, // Arabic Small High Ligatu..Arabic Small High Madda
			0x006e7...0x006e8, // Arabic Small High Yeh   ..Arabic Small High Noon
			0x006ea...0x006ed, // Arabic Empty Centre Low ..Arabic Small Low Meem
			0x0070f...0x0070f, // Syriac Abbreviation Mark
			0x00711...0x00711, // Syriac Letter Superscript Alaph
			0x00730...0x0074a, // Syriac Pthaha Above     ..Syriac Barrekh
			0x007a6...0x007b0, // Thaana Abafili          ..Thaana Sukun
			0x007eb...0x007f3, // Nko Combining Short High..Nko Combining Double Dot
			0x00901...0x00903, // Devanagari Sign Candrabi..Devanagari Sign Visarga
			0x0093c...0x0093c, // Devanagari Sign Nukta
			0x0093e...0x0094d, // Devanagari Vowel Sign Aa..Devanagari Sign Virama
			0x00951...0x00954, // Devanagari Stress Sign U..Devanagari Acute Accent
			0x00962...0x00963, // Devanagari Vowel Sign Vo..Devanagari Vowel Sign Vo
			0x00981...0x00983, // Bengali Sign Candrabindu..Bengali Sign Visarga
			0x009bc...0x009bc, // Bengali Sign Nukta
			0x009be...0x009c4, // Bengali Vowel Sign Aa   ..Bengali Vowel Sign Vocal
			0x009c7...0x009c8, // Bengali Vowel Sign E    ..Bengali Vowel Sign Ai
			0x009cb...0x009cd, // Bengali Vowel Sign O    ..Bengali Sign Virama
			0x009d7...0x009d7, // Bengali Au Length Mark
			0x009e2...0x009e3, // Bengali Vowel Sign Vocal..Bengali Vowel Sign Vocal
			0x00a01...0x00a03, // Gurmukhi Sign Adak Bindi..Gurmukhi Sign Visarga
			0x00a3c...0x00a3c, // Gurmukhi Sign Nukta
			0x00a3e...0x00a42, // Gurmukhi Vowel Sign Aa  ..Gurmukhi Vowel Sign Uu
			0x00a47...0x00a48, // Gurmukhi Vowel Sign Ee  ..Gurmukhi Vowel Sign Ai
			0x00a4b...0x00a4d, // Gurmukhi Vowel Sign Oo  ..Gurmukhi Sign Virama
			0x00a70...0x00a71, // Gurmukhi Tippi          ..Gurmukhi Addak
			0x00a81...0x00a83, // Gujarati Sign Candrabind..Gujarati Sign Visarga
			0x00abc...0x00abc, // Gujarati Sign Nukta
			0x00abe...0x00ac5, // Gujarati Vowel Sign Aa  ..Gujarati Vowel Sign Cand
			0x00ac7...0x00ac9, // Gujarati Vowel Sign E   ..Gujarati Vowel Sign Cand
			0x00acb...0x00acd, // Gujarati Vowel Sign O   ..Gujarati Sign Virama
			0x00ae2...0x00ae3, // Gujarati Vowel Sign Voca..Gujarati Vowel Sign Voca
			0x00b01...0x00b03, // Oriya Sign Candrabindu  ..Oriya Sign Visarga
			0x00b3c...0x00b3c, // Oriya Sign Nukta
			0x00b3e...0x00b43, // Oriya Vowel Sign Aa     ..Oriya Vowel Sign Vocalic
			0x00b47...0x00b48, // Oriya Vowel Sign E      ..Oriya Vowel Sign Ai
			0x00b4b...0x00b4d, // Oriya Vowel Sign O      ..Oriya Sign Virama
			0x00b56...0x00b57, // Oriya Ai Length Mark    ..Oriya Au Length Mark
			0x00b82...0x00b82, // Tamil Sign Anusvara
			0x00bbe...0x00bc2, // Tamil Vowel Sign Aa     ..Tamil Vowel Sign Uu
			0x00bc6...0x00bc8, // Tamil Vowel Sign E      ..Tamil Vowel Sign Ai
			0x00bca...0x00bcd, // Tamil Vowel Sign O      ..Tamil Sign Virama
			0x00bd7...0x00bd7, // Tamil Au Length Mark
			0x00c01...0x00c03, // Telugu Sign Candrabindu ..Telugu Sign Visarga
			0x00c3e...0x00c44, // Telugu Vowel Sign Aa    ..Telugu Vowel Sign Vocali
			0x00c46...0x00c48, // Telugu Vowel Sign E     ..Telugu Vowel Sign Ai
			0x00c4a...0x00c4d, // Telugu Vowel Sign O     ..Telugu Sign Virama
			0x00c55...0x00c56, // Telugu Length Mark      ..Telugu Ai Length Mark
			0x00c82...0x00c83, // Kannada Sign Anusvara   ..Kannada Sign Visarga
			0x00cbc...0x00cbc, // Kannada Sign Nukta
			0x00cbe...0x00cc4, // Kannada Vowel Sign Aa   ..Kannada Vowel Sign Vocal
			0x00cc6...0x00cc8, // Kannada Vowel Sign E    ..Kannada Vowel Sign Ai
			0x00cca...0x00ccd, // Kannada Vowel Sign O    ..Kannada Sign Virama
			0x00cd5...0x00cd6, // Kannada Length Mark     ..Kannada Ai Length Mark
			0x00ce2...0x00ce3, // Kannada Vowel Sign Vocal..Kannada Vowel Sign Vocal
			0x00d02...0x00d03, // Malayalam Sign Anusvara ..Malayalam Sign Visarga
			0x00d3e...0x00d43, // Malayalam Vowel Sign Aa ..Malayalam Vowel Sign Voc
			0x00d46...0x00d48, // Malayalam Vowel Sign E  ..Malayalam Vowel Sign Ai
			0x00d4a...0x00d4d, // Malayalam Vowel Sign O  ..Malayalam Sign Virama
			0x00d57...0x00d57, // Malayalam Au Length Mark
			0x00d82...0x00d83, // Sinhala Sign Anusvaraya ..Sinhala Sign Visargaya
			0x00dca...0x00dca, // Sinhala Sign Al-lakuna
			0x00dcf...0x00dd4, // Sinhala Vowel Sign Aela-..Sinhala Vowel Sign Ketti
			0x00dd6...0x00dd6, // Sinhala Vowel Sign Diga Paa-pilla
			0x00dd8...0x00ddf, // Sinhala Vowel Sign Gaett..Sinhala Vowel Sign Gayan
			0x00df2...0x00df3, // Sinhala Vowel Sign Diga ..Sinhala Vowel Sign Diga
			0x00e31...0x00e31, // Thai Character Mai Han-akat
			0x00e34...0x00e3a, // Thai Character Sara I   ..Thai Character Phinthu
			0x00e47...0x00e4e, // Thai Character Maitaikhu..Thai Character Yamakkan
			0x00eb1...0x00eb1, // Lao Vowel Sign Mai Kan
			0x00eb4...0x00eb9, // Lao Vowel Sign I        ..Lao Vowel Sign Uu
			0x00ebb...0x00ebc, // Lao Vowel Sign Mai Kon  ..Lao Semivowel Sign Lo
			0x00ec8...0x00ecd, // Lao Tone Mai Ek         ..Lao Niggahita
			0x00f18...0x00f19, // Tibetan Astrological Sig..Tibetan Astrological Sig
			0x00f35...0x00f35, // Tibetan Mark Ngas Bzung Nyi Zla
			0x00f37...0x00f37, // Tibetan Mark Ngas Bzung Sgor Rtags
			0x00f39...0x00f39, // Tibetan Mark Tsa -phru
			0x00f3e...0x00f3f, // Tibetan Sign Yar Tshes  ..Tibetan Sign Mar Tshes
			0x00f71...0x00f84, // Tibetan Vowel Sign Aa   ..Tibetan Mark Halanta
			0x00f86...0x00f87, // Tibetan Sign Lci Rtags  ..Tibetan Sign Yang Rtags
			0x00f90...0x00f97, // Tibetan Subjoined Letter..Tibetan Subjoined Letter
			0x00f99...0x00fbc, // Tibetan Subjoined Letter..Tibetan Subjoined Letter
			0x00fc6...0x00fc6, // Tibetan Symbol Padma Gdan
			0x0102c...0x01032, // Myanmar Vowel Sign Aa   ..Myanmar Vowel Sign Ai
			0x01036...0x01039, // Myanmar Sign Anusvara   ..Myanmar Sign Virama
			0x01056...0x01059, // Myanmar Vowel Sign Vocal..Myanmar Vowel Sign Vocal
			0x01160...0x011ff, // Hangul Jungseong Filler ..Hangul Jongseong Ssangni
			0x0135f...0x0135f, // Ethiopic Combining Gemination Mark
			0x01712...0x01714, // Tagalog Vowel Sign I    ..Tagalog Sign Virama
			0x01732...0x01734, // Hanunoo Vowel Sign I    ..Hanunoo Sign Pamudpod
			0x01752...0x01753, // Buhid Vowel Sign I      ..Buhid Vowel Sign U
			0x01772...0x01773, // Tagbanwa Vowel Sign I   ..Tagbanwa Vowel Sign U
			0x017b4...0x017d3, // Khmer Vowel Inherent Aq ..Khmer Sign Bathamasat
			0x017dd...0x017dd, // Khmer Sign Atthacan
			0x0180b...0x0180d, // Mongolian Free Variation..Mongolian Free Variation
			0x018a9...0x018a9, // Mongolian Letter Ali Gali Dagalga
			0x01920...0x0192b, // Limbu Vowel Sign A      ..Limbu Subjoined Letter W
			0x01930...0x0193b, // Limbu Small Letter Ka   ..Limbu Sign Sa-i
			0x019b0...0x019c0, // New Tai Lue Vowel Sign V..New Tai Lue Vowel Sign I
			0x019c8...0x019c9, // New Tai Lue Tone Mark-1 ..New Tai Lue Tone Mark-2
			0x01a17...0x01a1b, // Buginese Vowel Sign I   ..Buginese Vowel Sign Ae
			0x01b00...0x01b04, // Balinese Sign Ulu Ricem ..Balinese Sign Bisah
			0x01b34...0x01b44, // Balinese Sign Rerekan   ..Balinese Adeg Adeg
			0x01b6b...0x01b73, // Balinese Musical Symbol ..Balinese Musical Symbol
			0x01dc0...0x01dca, // Combining Dotted Grave A..Combining Latin Small Le
			0x01dfe...0x01dff, // Combining Left Arrowhead..Combining Right Arrowhea
			0x0200b...0x0200f, // Zero Width Space        ..Right-to-left Mark
			0x02028...0x0202e, // Line Separator          ..Right-to-left Override
			0x02060...0x02063, // Word Joiner             ..Invisible Separator
			0x0206a...0x0206f, // Inhibit Symmetric Swappi..Nominal Digit Shapes
			0x020d0...0x020ef, // Combining Left Harpoon A..Combining Right Arrow Be
			0x0302a...0x0302f, // Ideographic Level Tone M..Hangul Double Dot Tone M
			0x03099...0x0309a, // Combining Katakana-hirag..Combining Katakana-hirag
			0x0a802...0x0a802, // Syloti Nagri Sign Dvisvara
			0x0a806...0x0a806, // Syloti Nagri Sign Hasanta
			0x0a80b...0x0a80b, // Syloti Nagri Sign Anusvara
			0x0a823...0x0a827, // Syloti Nagri Vowel Sign ..Syloti Nagri Vowel Sign
			0x0d7b0...0x0d7ff, // Hangul Jungseong O-yeo  ..(nil)
			0x0fb1e...0x0fb1e, // Hebrew Point Judeo-spanish Varika
			0x0fe00...0x0fe0f, // Variation Selector-1    ..Variation Selector-16
			0x0fe20...0x0fe23, // Combining Ligature Left ..Combining Double Tilde R
			0x0feff...0x0feff, // Zero Width No-break Space
			0x0fff9...0x0fffb, // Interlinear Annotation A..Interlinear Annotation T
			0x10a01...0x10a03, // Kharoshthi Vowel Sign I ..Kharoshthi Vowel Sign Vo
			0x10a05...0x10a06, // Kharoshthi Vowel Sign E ..Kharoshthi Vowel Sign O
			0x10a0c...0x10a0f, // Kharoshthi Vowel Length ..Kharoshthi Sign Visarga
			0x10a38...0x10a3a, // Kharoshthi Sign Bar Abov..Kharoshthi Sign Dot Belo
			0x10a3f...0x10a3f, // Kharoshthi Virama
			0x1d165...0x1d169, // Musical Symbol Combining..Musical Symbol Combining
			0x1d16d...0x1d182, // Musical Symbol Combining..Musical Symbol Combining
			0x1d185...0x1d18b, // Musical Symbol Combining..Musical Symbol Combining
			0x1d1aa...0x1d1ad, // Musical Symbol Combining..Musical Symbol Combining
			0x1d242...0x1d244, // Combining Greek Musical ..Combining Greek Musical
			0xe0001...0xe0001, // Language Tag
			0xe0020...0xe007f, // Tag Space               ..Cancel Tag
			0xe0100...0xe01ef, // Variation Selector-17   ..Variation Selector-256
			=> true,
			else => false,
		},
		.@"5.1.0" => switch (codepoint) {
			// Source: DerivedGeneralCategory-5.1.0.txt
			// Date: 2008-03-20, 17:54:57 GMT [MD]
			0x00000...0x00000, // (nil)
			0x000ad...0x000ad, // Soft Hyphen
			0x00300...0x0036f, // Combining Grave Accent  ..Combining Latin Small Le
			0x00483...0x00489, // Combining Cyrillic Titlo..Combining Cyrillic Milli
			0x00591...0x005bd, // Hebrew Accent Etnahta   ..Hebrew Point Meteg
			0x005bf...0x005bf, // Hebrew Point Rafe
			0x005c1...0x005c2, // Hebrew Point Shin Dot   ..Hebrew Point Sin Dot
			0x005c4...0x005c5, // Hebrew Mark Upper Dot   ..Hebrew Mark Lower Dot
			0x005c7...0x005c7, // Hebrew Point Qamats Qatan
			0x00600...0x00603, // Arabic Number Sign      ..Arabic Sign Safha
			0x00610...0x0061a, // Arabic Sign Sallallahou ..Arabic Small Kasra
			0x0064b...0x0065e, // Arabic Fathatan         ..Arabic Fatha With Two Do
			0x00670...0x00670, // Arabic Letter Superscript Alef
			0x006d6...0x006e4, // Arabic Small High Ligatu..Arabic Small High Madda
			0x006e7...0x006e8, // Arabic Small High Yeh   ..Arabic Small High Noon
			0x006ea...0x006ed, // Arabic Empty Centre Low ..Arabic Small Low Meem
			0x0070f...0x0070f, // Syriac Abbreviation Mark
			0x00711...0x00711, // Syriac Letter Superscript Alaph
			0x00730...0x0074a, // Syriac Pthaha Above     ..Syriac Barrekh
			0x007a6...0x007b0, // Thaana Abafili          ..Thaana Sukun
			0x007eb...0x007f3, // Nko Combining Short High..Nko Combining Double Dot
			0x00901...0x00903, // Devanagari Sign Candrabi..Devanagari Sign Visarga
			0x0093c...0x0093c, // Devanagari Sign Nukta
			0x0093e...0x0094d, // Devanagari Vowel Sign Aa..Devanagari Sign Virama
			0x00951...0x00954, // Devanagari Stress Sign U..Devanagari Acute Accent
			0x00962...0x00963, // Devanagari Vowel Sign Vo..Devanagari Vowel Sign Vo
			0x00981...0x00983, // Bengali Sign Candrabindu..Bengali Sign Visarga
			0x009bc...0x009bc, // Bengali Sign Nukta
			0x009be...0x009c4, // Bengali Vowel Sign Aa   ..Bengali Vowel Sign Vocal
			0x009c7...0x009c8, // Bengali Vowel Sign E    ..Bengali Vowel Sign Ai
			0x009cb...0x009cd, // Bengali Vowel Sign O    ..Bengali Sign Virama
			0x009d7...0x009d7, // Bengali Au Length Mark
			0x009e2...0x009e3, // Bengali Vowel Sign Vocal..Bengali Vowel Sign Vocal
			0x00a01...0x00a03, // Gurmukhi Sign Adak Bindi..Gurmukhi Sign Visarga
			0x00a3c...0x00a3c, // Gurmukhi Sign Nukta
			0x00a3e...0x00a42, // Gurmukhi Vowel Sign Aa  ..Gurmukhi Vowel Sign Uu
			0x00a47...0x00a48, // Gurmukhi Vowel Sign Ee  ..Gurmukhi Vowel Sign Ai
			0x00a4b...0x00a4d, // Gurmukhi Vowel Sign Oo  ..Gurmukhi Sign Virama
			0x00a51...0x00a51, // Gurmukhi Sign Udaat
			0x00a70...0x00a71, // Gurmukhi Tippi          ..Gurmukhi Addak
			0x00a75...0x00a75, // Gurmukhi Sign Yakash
			0x00a81...0x00a83, // Gujarati Sign Candrabind..Gujarati Sign Visarga
			0x00abc...0x00abc, // Gujarati Sign Nukta
			0x00abe...0x00ac5, // Gujarati Vowel Sign Aa  ..Gujarati Vowel Sign Cand
			0x00ac7...0x00ac9, // Gujarati Vowel Sign E   ..Gujarati Vowel Sign Cand
			0x00acb...0x00acd, // Gujarati Vowel Sign O   ..Gujarati Sign Virama
			0x00ae2...0x00ae3, // Gujarati Vowel Sign Voca..Gujarati Vowel Sign Voca
			0x00b01...0x00b03, // Oriya Sign Candrabindu  ..Oriya Sign Visarga
			0x00b3c...0x00b3c, // Oriya Sign Nukta
			0x00b3e...0x00b44, // Oriya Vowel Sign Aa     ..Oriya Vowel Sign Vocalic
			0x00b47...0x00b48, // Oriya Vowel Sign E      ..Oriya Vowel Sign Ai
			0x00b4b...0x00b4d, // Oriya Vowel Sign O      ..Oriya Sign Virama
			0x00b56...0x00b57, // Oriya Ai Length Mark    ..Oriya Au Length Mark
			0x00b62...0x00b63, // Oriya Vowel Sign Vocalic..Oriya Vowel Sign Vocalic
			0x00b82...0x00b82, // Tamil Sign Anusvara
			0x00bbe...0x00bc2, // Tamil Vowel Sign Aa     ..Tamil Vowel Sign Uu
			0x00bc6...0x00bc8, // Tamil Vowel Sign E      ..Tamil Vowel Sign Ai
			0x00bca...0x00bcd, // Tamil Vowel Sign O      ..Tamil Sign Virama
			0x00bd7...0x00bd7, // Tamil Au Length Mark
			0x00c01...0x00c03, // Telugu Sign Candrabindu ..Telugu Sign Visarga
			0x00c3e...0x00c44, // Telugu Vowel Sign Aa    ..Telugu Vowel Sign Vocali
			0x00c46...0x00c48, // Telugu Vowel Sign E     ..Telugu Vowel Sign Ai
			0x00c4a...0x00c4d, // Telugu Vowel Sign O     ..Telugu Sign Virama
			0x00c55...0x00c56, // Telugu Length Mark      ..Telugu Ai Length Mark
			0x00c62...0x00c63, // Telugu Vowel Sign Vocali..Telugu Vowel Sign Vocali
			0x00c82...0x00c83, // Kannada Sign Anusvara   ..Kannada Sign Visarga
			0x00cbc...0x00cbc, // Kannada Sign Nukta
			0x00cbe...0x00cc4, // Kannada Vowel Sign Aa   ..Kannada Vowel Sign Vocal
			0x00cc6...0x00cc8, // Kannada Vowel Sign E    ..Kannada Vowel Sign Ai
			0x00cca...0x00ccd, // Kannada Vowel Sign O    ..Kannada Sign Virama
			0x00cd5...0x00cd6, // Kannada Length Mark     ..Kannada Ai Length Mark
			0x00ce2...0x00ce3, // Kannada Vowel Sign Vocal..Kannada Vowel Sign Vocal
			0x00d02...0x00d03, // Malayalam Sign Anusvara ..Malayalam Sign Visarga
			0x00d3e...0x00d44, // Malayalam Vowel Sign Aa ..Malayalam Vowel Sign Voc
			0x00d46...0x00d48, // Malayalam Vowel Sign E  ..Malayalam Vowel Sign Ai
			0x00d4a...0x00d4d, // Malayalam Vowel Sign O  ..Malayalam Sign Virama
			0x00d57...0x00d57, // Malayalam Au Length Mark
			0x00d62...0x00d63, // Malayalam Vowel Sign Voc..Malayalam Vowel Sign Voc
			0x00d82...0x00d83, // Sinhala Sign Anusvaraya ..Sinhala Sign Visargaya
			0x00dca...0x00dca, // Sinhala Sign Al-lakuna
			0x00dcf...0x00dd4, // Sinhala Vowel Sign Aela-..Sinhala Vowel Sign Ketti
			0x00dd6...0x00dd6, // Sinhala Vowel Sign Diga Paa-pilla
			0x00dd8...0x00ddf, // Sinhala Vowel Sign Gaett..Sinhala Vowel Sign Gayan
			0x00df2...0x00df3, // Sinhala Vowel Sign Diga ..Sinhala Vowel Sign Diga
			0x00e31...0x00e31, // Thai Character Mai Han-akat
			0x00e34...0x00e3a, // Thai Character Sara I   ..Thai Character Phinthu
			0x00e47...0x00e4e, // Thai Character Maitaikhu..Thai Character Yamakkan
			0x00eb1...0x00eb1, // Lao Vowel Sign Mai Kan
			0x00eb4...0x00eb9, // Lao Vowel Sign I        ..Lao Vowel Sign Uu
			0x00ebb...0x00ebc, // Lao Vowel Sign Mai Kon  ..Lao Semivowel Sign Lo
			0x00ec8...0x00ecd, // Lao Tone Mai Ek         ..Lao Niggahita
			0x00f18...0x00f19, // Tibetan Astrological Sig..Tibetan Astrological Sig
			0x00f35...0x00f35, // Tibetan Mark Ngas Bzung Nyi Zla
			0x00f37...0x00f37, // Tibetan Mark Ngas Bzung Sgor Rtags
			0x00f39...0x00f39, // Tibetan Mark Tsa -phru
			0x00f3e...0x00f3f, // Tibetan Sign Yar Tshes  ..Tibetan Sign Mar Tshes
			0x00f71...0x00f84, // Tibetan Vowel Sign Aa   ..Tibetan Mark Halanta
			0x00f86...0x00f87, // Tibetan Sign Lci Rtags  ..Tibetan Sign Yang Rtags
			0x00f90...0x00f97, // Tibetan Subjoined Letter..Tibetan Subjoined Letter
			0x00f99...0x00fbc, // Tibetan Subjoined Letter..Tibetan Subjoined Letter
			0x00fc6...0x00fc6, // Tibetan Symbol Padma Gdan
			0x0102b...0x0103e, // Myanmar Vowel Sign Tall ..Myanmar Consonant Sign M
			0x01056...0x01059, // Myanmar Vowel Sign Vocal..Myanmar Vowel Sign Vocal
			0x0105e...0x01060, // Myanmar Consonant Sign M..Myanmar Consonant Sign M
			0x01062...0x01064, // Myanmar Vowel Sign Sgaw ..Myanmar Tone Mark Sgaw K
			0x01067...0x0106d, // Myanmar Vowel Sign Weste..Myanmar Sign Western Pwo
			0x01071...0x01074, // Myanmar Vowel Sign Geba ..Myanmar Vowel Sign Kayah
			0x01082...0x0108d, // Myanmar Consonant Sign S..Myanmar Sign Shan Counci
			0x0108f...0x0108f, // Myanmar Sign Rumai Palaung Tone-5
			0x01160...0x011ff, // Hangul Jungseong Filler ..Hangul Jongseong Ssangni
			0x0135f...0x0135f, // Ethiopic Combining Gemination Mark
			0x01712...0x01714, // Tagalog Vowel Sign I    ..Tagalog Sign Virama
			0x01732...0x01734, // Hanunoo Vowel Sign I    ..Hanunoo Sign Pamudpod
			0x01752...0x01753, // Buhid Vowel Sign I      ..Buhid Vowel Sign U
			0x01772...0x01773, // Tagbanwa Vowel Sign I   ..Tagbanwa Vowel Sign U
			0x017b4...0x017d3, // Khmer Vowel Inherent Aq ..Khmer Sign Bathamasat
			0x017dd...0x017dd, // Khmer Sign Atthacan
			0x0180b...0x0180d, // Mongolian Free Variation..Mongolian Free Variation
			0x018a9...0x018a9, // Mongolian Letter Ali Gali Dagalga
			0x01920...0x0192b, // Limbu Vowel Sign A      ..Limbu Subjoined Letter W
			0x01930...0x0193b, // Limbu Small Letter Ka   ..Limbu Sign Sa-i
			0x019b0...0x019c0, // New Tai Lue Vowel Sign V..New Tai Lue Vowel Sign I
			0x019c8...0x019c9, // New Tai Lue Tone Mark-1 ..New Tai Lue Tone Mark-2
			0x01a17...0x01a1b, // Buginese Vowel Sign I   ..Buginese Vowel Sign Ae
			0x01b00...0x01b04, // Balinese Sign Ulu Ricem ..Balinese Sign Bisah
			0x01b34...0x01b44, // Balinese Sign Rerekan   ..Balinese Adeg Adeg
			0x01b6b...0x01b73, // Balinese Musical Symbol ..Balinese Musical Symbol
			0x01b80...0x01b82, // Sundanese Sign Panyecek ..Sundanese Sign Pangwisad
			0x01ba1...0x01baa, // Sundanese Consonant Sign..Sundanese Sign Pamaaeh
			0x01c24...0x01c37, // Lepcha Subjoined Letter ..Lepcha Sign Nukta
			0x01dc0...0x01de6, // Combining Dotted Grave A..Combining Latin Small Le
			0x01dfe...0x01dff, // Combining Left Arrowhead..Combining Right Arrowhea
			0x0200b...0x0200f, // Zero Width Space        ..Right-to-left Mark
			0x02028...0x0202e, // Line Separator          ..Right-to-left Override
			0x02060...0x02064, // Word Joiner             ..Invisible Plus
			0x0206a...0x0206f, // Inhibit Symmetric Swappi..Nominal Digit Shapes
			0x020d0...0x020f0, // Combining Left Harpoon A..Combining Asterisk Above
			0x02de0...0x02dff, // Combining Cyrillic Lette..Combining Cyrillic Lette
			0x0302a...0x0302f, // Ideographic Level Tone M..Hangul Double Dot Tone M
			0x03099...0x0309a, // Combining Katakana-hirag..Combining Katakana-hirag
			0x0a66f...0x0a672, // Combining Cyrillic Vzmet..Combining Cyrillic Thous
			0x0a67c...0x0a67d, // Combining Cyrillic Kavyk..Combining Cyrillic Payer
			0x0a802...0x0a802, // Syloti Nagri Sign Dvisvara
			0x0a806...0x0a806, // Syloti Nagri Sign Hasanta
			0x0a80b...0x0a80b, // Syloti Nagri Sign Anusvara
			0x0a823...0x0a827, // Syloti Nagri Vowel Sign ..Syloti Nagri Vowel Sign
			0x0a880...0x0a881, // Saurashtra Sign Anusvara..Saurashtra Sign Visarga
			0x0a8b4...0x0a8c4, // Saurashtra Consonant Sig..Saurashtra Sign Virama
			0x0a926...0x0a92d, // Kayah Li Vowel Ue       ..Kayah Li Tone Calya Plop
			0x0a947...0x0a953, // Rejang Vowel Sign I     ..Rejang Virama
			0x0aa29...0x0aa36, // Cham Vowel Sign Aa      ..Cham Consonant Sign Wa
			0x0aa43...0x0aa43, // Cham Consonant Sign Final Ng
			0x0aa4c...0x0aa4d, // Cham Consonant Sign Fina..Cham Consonant Sign Fina
			0x0d7b0...0x0d7ff, // Hangul Jungseong O-yeo  ..(nil)
			0x0fb1e...0x0fb1e, // Hebrew Point Judeo-spanish Varika
			0x0fe00...0x0fe0f, // Variation Selector-1    ..Variation Selector-16
			0x0fe20...0x0fe26, // Combining Ligature Left ..Combining Conjoining Mac
			0x0feff...0x0feff, // Zero Width No-break Space
			0x0fff9...0x0fffb, // Interlinear Annotation A..Interlinear Annotation T
			0x101fd...0x101fd, // Phaistos Disc Sign Combining Oblique Stroke
			0x10a01...0x10a03, // Kharoshthi Vowel Sign I ..Kharoshthi Vowel Sign Vo
			0x10a05...0x10a06, // Kharoshthi Vowel Sign E ..Kharoshthi Vowel Sign O
			0x10a0c...0x10a0f, // Kharoshthi Vowel Length ..Kharoshthi Sign Visarga
			0x10a38...0x10a3a, // Kharoshthi Sign Bar Abov..Kharoshthi Sign Dot Belo
			0x10a3f...0x10a3f, // Kharoshthi Virama
			0x1d165...0x1d169, // Musical Symbol Combining..Musical Symbol Combining
			0x1d16d...0x1d182, // Musical Symbol Combining..Musical Symbol Combining
			0x1d185...0x1d18b, // Musical Symbol Combining..Musical Symbol Combining
			0x1d1aa...0x1d1ad, // Musical Symbol Combining..Musical Symbol Combining
			0x1d242...0x1d244, // Combining Greek Musical ..Combining Greek Musical
			0xe0001...0xe0001, // Language Tag
			0xe0020...0xe007f, // Tag Space               ..Cancel Tag
			0xe0100...0xe01ef, // Variation Selector-17   ..Variation Selector-256
			=> true,
			else => false,
		},
		.@"5.2.0" => switch (codepoint) {
			// Source: DerivedGeneralCategory-5.2.0.txt
			// Date: 2009-08-22, 04:58:21 GMT [MD]
			0x00000...0x00000, // (nil)
			0x000ad...0x000ad, // Soft Hyphen
			0x00300...0x0036f, // Combining Grave Accent  ..Combining Latin Small Le
			0x00483...0x00489, // Combining Cyrillic Titlo..Combining Cyrillic Milli
			0x00591...0x005bd, // Hebrew Accent Etnahta   ..Hebrew Point Meteg
			0x005bf...0x005bf, // Hebrew Point Rafe
			0x005c1...0x005c2, // Hebrew Point Shin Dot   ..Hebrew Point Sin Dot
			0x005c4...0x005c5, // Hebrew Mark Upper Dot   ..Hebrew Mark Lower Dot
			0x005c7...0x005c7, // Hebrew Point Qamats Qatan
			0x00600...0x00603, // Arabic Number Sign      ..Arabic Sign Safha
			0x00610...0x0061a, // Arabic Sign Sallallahou ..Arabic Small Kasra
			0x0064b...0x0065e, // Arabic Fathatan         ..Arabic Fatha With Two Do
			0x00670...0x00670, // Arabic Letter Superscript Alef
			0x006d6...0x006e4, // Arabic Small High Ligatu..Arabic Small High Madda
			0x006e7...0x006e8, // Arabic Small High Yeh   ..Arabic Small High Noon
			0x006ea...0x006ed, // Arabic Empty Centre Low ..Arabic Small Low Meem
			0x0070f...0x0070f, // Syriac Abbreviation Mark
			0x00711...0x00711, // Syriac Letter Superscript Alaph
			0x00730...0x0074a, // Syriac Pthaha Above     ..Syriac Barrekh
			0x007a6...0x007b0, // Thaana Abafili          ..Thaana Sukun
			0x007eb...0x007f3, // Nko Combining Short High..Nko Combining Double Dot
			0x00816...0x00819, // Samaritan Mark In       ..Samaritan Mark Dagesh
			0x0081b...0x00823, // Samaritan Mark Epentheti..Samaritan Vowel Sign A
			0x00825...0x00827, // Samaritan Vowel Sign Sho..Samaritan Vowel Sign U
			0x00829...0x0082d, // Samaritan Vowel Sign Lon..Samaritan Mark Nequdaa
			0x00900...0x00903, // Devanagari Sign Inverted..Devanagari Sign Visarga
			0x0093c...0x0093c, // Devanagari Sign Nukta
			0x0093e...0x0094e, // Devanagari Vowel Sign Aa..Devanagari Vowel Sign Pr
			0x00951...0x00955, // Devanagari Stress Sign U..Devanagari Vowel Sign Ca
			0x00962...0x00963, // Devanagari Vowel Sign Vo..Devanagari Vowel Sign Vo
			0x00981...0x00983, // Bengali Sign Candrabindu..Bengali Sign Visarga
			0x009bc...0x009bc, // Bengali Sign Nukta
			0x009be...0x009c4, // Bengali Vowel Sign Aa   ..Bengali Vowel Sign Vocal
			0x009c7...0x009c8, // Bengali Vowel Sign E    ..Bengali Vowel Sign Ai
			0x009cb...0x009cd, // Bengali Vowel Sign O    ..Bengali Sign Virama
			0x009d7...0x009d7, // Bengali Au Length Mark
			0x009e2...0x009e3, // Bengali Vowel Sign Vocal..Bengali Vowel Sign Vocal
			0x00a01...0x00a03, // Gurmukhi Sign Adak Bindi..Gurmukhi Sign Visarga
			0x00a3c...0x00a3c, // Gurmukhi Sign Nukta
			0x00a3e...0x00a42, // Gurmukhi Vowel Sign Aa  ..Gurmukhi Vowel Sign Uu
			0x00a47...0x00a48, // Gurmukhi Vowel Sign Ee  ..Gurmukhi Vowel Sign Ai
			0x00a4b...0x00a4d, // Gurmukhi Vowel Sign Oo  ..Gurmukhi Sign Virama
			0x00a51...0x00a51, // Gurmukhi Sign Udaat
			0x00a70...0x00a71, // Gurmukhi Tippi          ..Gurmukhi Addak
			0x00a75...0x00a75, // Gurmukhi Sign Yakash
			0x00a81...0x00a83, // Gujarati Sign Candrabind..Gujarati Sign Visarga
			0x00abc...0x00abc, // Gujarati Sign Nukta
			0x00abe...0x00ac5, // Gujarati Vowel Sign Aa  ..Gujarati Vowel Sign Cand
			0x00ac7...0x00ac9, // Gujarati Vowel Sign E   ..Gujarati Vowel Sign Cand
			0x00acb...0x00acd, // Gujarati Vowel Sign O   ..Gujarati Sign Virama
			0x00ae2...0x00ae3, // Gujarati Vowel Sign Voca..Gujarati Vowel Sign Voca
			0x00b01...0x00b03, // Oriya Sign Candrabindu  ..Oriya Sign Visarga
			0x00b3c...0x00b3c, // Oriya Sign Nukta
			0x00b3e...0x00b44, // Oriya Vowel Sign Aa     ..Oriya Vowel Sign Vocalic
			0x00b47...0x00b48, // Oriya Vowel Sign E      ..Oriya Vowel Sign Ai
			0x00b4b...0x00b4d, // Oriya Vowel Sign O      ..Oriya Sign Virama
			0x00b56...0x00b57, // Oriya Ai Length Mark    ..Oriya Au Length Mark
			0x00b62...0x00b63, // Oriya Vowel Sign Vocalic..Oriya Vowel Sign Vocalic
			0x00b82...0x00b82, // Tamil Sign Anusvara
			0x00bbe...0x00bc2, // Tamil Vowel Sign Aa     ..Tamil Vowel Sign Uu
			0x00bc6...0x00bc8, // Tamil Vowel Sign E      ..Tamil Vowel Sign Ai
			0x00bca...0x00bcd, // Tamil Vowel Sign O      ..Tamil Sign Virama
			0x00bd7...0x00bd7, // Tamil Au Length Mark
			0x00c01...0x00c03, // Telugu Sign Candrabindu ..Telugu Sign Visarga
			0x00c3e...0x00c44, // Telugu Vowel Sign Aa    ..Telugu Vowel Sign Vocali
			0x00c46...0x00c48, // Telugu Vowel Sign E     ..Telugu Vowel Sign Ai
			0x00c4a...0x00c4d, // Telugu Vowel Sign O     ..Telugu Sign Virama
			0x00c55...0x00c56, // Telugu Length Mark      ..Telugu Ai Length Mark
			0x00c62...0x00c63, // Telugu Vowel Sign Vocali..Telugu Vowel Sign Vocali
			0x00c82...0x00c83, // Kannada Sign Anusvara   ..Kannada Sign Visarga
			0x00cbc...0x00cbc, // Kannada Sign Nukta
			0x00cbe...0x00cc4, // Kannada Vowel Sign Aa   ..Kannada Vowel Sign Vocal
			0x00cc6...0x00cc8, // Kannada Vowel Sign E    ..Kannada Vowel Sign Ai
			0x00cca...0x00ccd, // Kannada Vowel Sign O    ..Kannada Sign Virama
			0x00cd5...0x00cd6, // Kannada Length Mark     ..Kannada Ai Length Mark
			0x00ce2...0x00ce3, // Kannada Vowel Sign Vocal..Kannada Vowel Sign Vocal
			0x00d02...0x00d03, // Malayalam Sign Anusvara ..Malayalam Sign Visarga
			0x00d3e...0x00d44, // Malayalam Vowel Sign Aa ..Malayalam Vowel Sign Voc
			0x00d46...0x00d48, // Malayalam Vowel Sign E  ..Malayalam Vowel Sign Ai
			0x00d4a...0x00d4d, // Malayalam Vowel Sign O  ..Malayalam Sign Virama
			0x00d57...0x00d57, // Malayalam Au Length Mark
			0x00d62...0x00d63, // Malayalam Vowel Sign Voc..Malayalam Vowel Sign Voc
			0x00d82...0x00d83, // Sinhala Sign Anusvaraya ..Sinhala Sign Visargaya
			0x00dca...0x00dca, // Sinhala Sign Al-lakuna
			0x00dcf...0x00dd4, // Sinhala Vowel Sign Aela-..Sinhala Vowel Sign Ketti
			0x00dd6...0x00dd6, // Sinhala Vowel Sign Diga Paa-pilla
			0x00dd8...0x00ddf, // Sinhala Vowel Sign Gaett..Sinhala Vowel Sign Gayan
			0x00df2...0x00df3, // Sinhala Vowel Sign Diga ..Sinhala Vowel Sign Diga
			0x00e31...0x00e31, // Thai Character Mai Han-akat
			0x00e34...0x00e3a, // Thai Character Sara I   ..Thai Character Phinthu
			0x00e47...0x00e4e, // Thai Character Maitaikhu..Thai Character Yamakkan
			0x00eb1...0x00eb1, // Lao Vowel Sign Mai Kan
			0x00eb4...0x00eb9, // Lao Vowel Sign I        ..Lao Vowel Sign Uu
			0x00ebb...0x00ebc, // Lao Vowel Sign Mai Kon  ..Lao Semivowel Sign Lo
			0x00ec8...0x00ecd, // Lao Tone Mai Ek         ..Lao Niggahita
			0x00f18...0x00f19, // Tibetan Astrological Sig..Tibetan Astrological Sig
			0x00f35...0x00f35, // Tibetan Mark Ngas Bzung Nyi Zla
			0x00f37...0x00f37, // Tibetan Mark Ngas Bzung Sgor Rtags
			0x00f39...0x00f39, // Tibetan Mark Tsa -phru
			0x00f3e...0x00f3f, // Tibetan Sign Yar Tshes  ..Tibetan Sign Mar Tshes
			0x00f71...0x00f84, // Tibetan Vowel Sign Aa   ..Tibetan Mark Halanta
			0x00f86...0x00f87, // Tibetan Sign Lci Rtags  ..Tibetan Sign Yang Rtags
			0x00f90...0x00f97, // Tibetan Subjoined Letter..Tibetan Subjoined Letter
			0x00f99...0x00fbc, // Tibetan Subjoined Letter..Tibetan Subjoined Letter
			0x00fc6...0x00fc6, // Tibetan Symbol Padma Gdan
			0x0102b...0x0103e, // Myanmar Vowel Sign Tall ..Myanmar Consonant Sign M
			0x01056...0x01059, // Myanmar Vowel Sign Vocal..Myanmar Vowel Sign Vocal
			0x0105e...0x01060, // Myanmar Consonant Sign M..Myanmar Consonant Sign M
			0x01062...0x01064, // Myanmar Vowel Sign Sgaw ..Myanmar Tone Mark Sgaw K
			0x01067...0x0106d, // Myanmar Vowel Sign Weste..Myanmar Sign Western Pwo
			0x01071...0x01074, // Myanmar Vowel Sign Geba ..Myanmar Vowel Sign Kayah
			0x01082...0x0108d, // Myanmar Consonant Sign S..Myanmar Sign Shan Counci
			0x0108f...0x0108f, // Myanmar Sign Rumai Palaung Tone-5
			0x0109a...0x0109d, // Myanmar Sign Khamti Tone..Myanmar Vowel Sign Aiton
			0x01160...0x011ff, // Hangul Jungseong Filler ..Hangul Jongseong Ssangni
			0x0135f...0x0135f, // Ethiopic Combining Gemination Mark
			0x01712...0x01714, // Tagalog Vowel Sign I    ..Tagalog Sign Virama
			0x01732...0x01734, // Hanunoo Vowel Sign I    ..Hanunoo Sign Pamudpod
			0x01752...0x01753, // Buhid Vowel Sign I      ..Buhid Vowel Sign U
			0x01772...0x01773, // Tagbanwa Vowel Sign I   ..Tagbanwa Vowel Sign U
			0x017b4...0x017d3, // Khmer Vowel Inherent Aq ..Khmer Sign Bathamasat
			0x017dd...0x017dd, // Khmer Sign Atthacan
			0x0180b...0x0180d, // Mongolian Free Variation..Mongolian Free Variation
			0x018a9...0x018a9, // Mongolian Letter Ali Gali Dagalga
			0x01920...0x0192b, // Limbu Vowel Sign A      ..Limbu Subjoined Letter W
			0x01930...0x0193b, // Limbu Small Letter Ka   ..Limbu Sign Sa-i
			0x019b0...0x019c0, // New Tai Lue Vowel Sign V..New Tai Lue Vowel Sign I
			0x019c8...0x019c9, // New Tai Lue Tone Mark-1 ..New Tai Lue Tone Mark-2
			0x01a17...0x01a1b, // Buginese Vowel Sign I   ..Buginese Vowel Sign Ae
			0x01a55...0x01a5e, // Tai Tham Consonant Sign ..Tai Tham Consonant Sign
			0x01a60...0x01a7c, // Tai Tham Sign Sakot     ..Tai Tham Sign Khuen-lue
			0x01a7f...0x01a7f, // Tai Tham Combining Cryptogrammic Dot
			0x01b00...0x01b04, // Balinese Sign Ulu Ricem ..Balinese Sign Bisah
			0x01b34...0x01b44, // Balinese Sign Rerekan   ..Balinese Adeg Adeg
			0x01b6b...0x01b73, // Balinese Musical Symbol ..Balinese Musical Symbol
			0x01b80...0x01b82, // Sundanese Sign Panyecek ..Sundanese Sign Pangwisad
			0x01ba1...0x01baa, // Sundanese Consonant Sign..Sundanese Sign Pamaaeh
			0x01c24...0x01c37, // Lepcha Subjoined Letter ..Lepcha Sign Nukta
			0x01cd0...0x01cd2, // Vedic Tone Karshana     ..Vedic Tone Prenkha
			0x01cd4...0x01ce8, // Vedic Sign Yajurvedic Mi..Vedic Sign Visarga Anuda
			0x01ced...0x01ced, // Vedic Sign Tiryak
			0x01cf2...0x01cf2, // Vedic Sign Ardhavisarga
			0x01dc0...0x01de6, // Combining Dotted Grave A..Combining Latin Small Le
			0x01dfd...0x01dff, // Combining Almost Equal T..Combining Right Arrowhea
			0x0200b...0x0200f, // Zero Width Space        ..Right-to-left Mark
			0x02028...0x0202e, // Line Separator          ..Right-to-left Override
			0x02060...0x02064, // Word Joiner             ..Invisible Plus
			0x0206a...0x0206f, // Inhibit Symmetric Swappi..Nominal Digit Shapes
			0x020d0...0x020f0, // Combining Left Harpoon A..Combining Asterisk Above
			0x02cef...0x02cf1, // Coptic Combining Ni Abov..Coptic Combining Spiritu
			0x02de0...0x02dff, // Combining Cyrillic Lette..Combining Cyrillic Lette
			0x0302a...0x0302f, // Ideographic Level Tone M..Hangul Double Dot Tone M
			0x03099...0x0309a, // Combining Katakana-hirag..Combining Katakana-hirag
			0x0a66f...0x0a672, // Combining Cyrillic Vzmet..Combining Cyrillic Thous
			0x0a67c...0x0a67d, // Combining Cyrillic Kavyk..Combining Cyrillic Payer
			0x0a6f0...0x0a6f1, // Bamum Combining Mark Koq..Bamum Combining Mark Tuk
			0x0a802...0x0a802, // Syloti Nagri Sign Dvisvara
			0x0a806...0x0a806, // Syloti Nagri Sign Hasanta
			0x0a80b...0x0a80b, // Syloti Nagri Sign Anusvara
			0x0a823...0x0a827, // Syloti Nagri Vowel Sign ..Syloti Nagri Vowel Sign
			0x0a880...0x0a881, // Saurashtra Sign Anusvara..Saurashtra Sign Visarga
			0x0a8b4...0x0a8c4, // Saurashtra Consonant Sig..Saurashtra Sign Virama
			0x0a8e0...0x0a8f1, // Combining Devanagari Dig..Combining Devanagari Sig
			0x0a926...0x0a92d, // Kayah Li Vowel Ue       ..Kayah Li Tone Calya Plop
			0x0a947...0x0a953, // Rejang Vowel Sign I     ..Rejang Virama
			0x0a980...0x0a983, // Javanese Sign Panyangga ..Javanese Sign Wignyan
			0x0a9b3...0x0a9c0, // Javanese Sign Cecak Telu..Javanese Pangkon
			0x0aa29...0x0aa36, // Cham Vowel Sign Aa      ..Cham Consonant Sign Wa
			0x0aa43...0x0aa43, // Cham Consonant Sign Final Ng
			0x0aa4c...0x0aa4d, // Cham Consonant Sign Fina..Cham Consonant Sign Fina
			0x0aa7b...0x0aa7b, // Myanmar Sign Pao Karen Tone
			0x0aab0...0x0aab0, // Tai Viet Mai Kang
			0x0aab2...0x0aab4, // Tai Viet Vowel I        ..Tai Viet Vowel U
			0x0aab7...0x0aab8, // Tai Viet Mai Khit       ..Tai Viet Vowel Ia
			0x0aabe...0x0aabf, // Tai Viet Vowel Am       ..Tai Viet Tone Mai Ek
			0x0aac1...0x0aac1, // Tai Viet Tone Mai Tho
			0x0abe3...0x0abea, // Meetei Mayek Vowel Sign ..Meetei Mayek Vowel Sign
			0x0abec...0x0abed, // Meetei Mayek Lum Iyek   ..Meetei Mayek Apun Iyek
			0x0d7b0...0x0d7ff, // Hangul Jungseong O-yeo  ..(nil)
			0x0fb1e...0x0fb1e, // Hebrew Point Judeo-spanish Varika
			0x0fe00...0x0fe0f, // Variation Selector-1    ..Variation Selector-16
			0x0fe20...0x0fe26, // Combining Ligature Left ..Combining Conjoining Mac
			0x0feff...0x0feff, // Zero Width No-break Space
			0x0fff9...0x0fffb, // Interlinear Annotation A..Interlinear Annotation T
			0x101fd...0x101fd, // Phaistos Disc Sign Combining Oblique Stroke
			0x10a01...0x10a03, // Kharoshthi Vowel Sign I ..Kharoshthi Vowel Sign Vo
			0x10a05...0x10a06, // Kharoshthi Vowel Sign E ..Kharoshthi Vowel Sign O
			0x10a0c...0x10a0f, // Kharoshthi Vowel Length ..Kharoshthi Sign Visarga
			0x10a38...0x10a3a, // Kharoshthi Sign Bar Abov..Kharoshthi Sign Dot Belo
			0x10a3f...0x10a3f, // Kharoshthi Virama
			0x11080...0x11082, // Kaithi Sign Candrabindu ..Kaithi Sign Visarga
			0x110b0...0x110ba, // Kaithi Vowel Sign Aa    ..Kaithi Sign Nukta
			0x110bd...0x110bd, // Kaithi Number Sign
			0x1d165...0x1d169, // Musical Symbol Combining..Musical Symbol Combining
			0x1d16d...0x1d182, // Musical Symbol Combining..Musical Symbol Combining
			0x1d185...0x1d18b, // Musical Symbol Combining..Musical Symbol Combining
			0x1d1aa...0x1d1ad, // Musical Symbol Combining..Musical Symbol Combining
			0x1d242...0x1d244, // Combining Greek Musical ..Combining Greek Musical
			0xe0001...0xe0001, // Language Tag
			0xe0020...0xe007f, // Tag Space               ..Cancel Tag
			0xe0100...0xe01ef, // Variation Selector-17   ..Variation Selector-256
			=> true,
			else => false,
		},
		.@"6.0.0" => switch (codepoint) {
			// Source: DerivedGeneralCategory-6.0.0.txt
			// Date: 2010-08-19, 00:48:09 GMT [MD]
			0x00000...0x00000, // (nil)
			0x000ad...0x000ad, // Soft Hyphen
			0x00300...0x0036f, // Combining Grave Accent  ..Combining Latin Small Le
			0x00483...0x00489, // Combining Cyrillic Titlo..Combining Cyrillic Milli
			0x00591...0x005bd, // Hebrew Accent Etnahta   ..Hebrew Point Meteg
			0x005bf...0x005bf, // Hebrew Point Rafe
			0x005c1...0x005c2, // Hebrew Point Shin Dot   ..Hebrew Point Sin Dot
			0x005c4...0x005c5, // Hebrew Mark Upper Dot   ..Hebrew Mark Lower Dot
			0x005c7...0x005c7, // Hebrew Point Qamats Qatan
			0x00600...0x00603, // Arabic Number Sign      ..Arabic Sign Safha
			0x00610...0x0061a, // Arabic Sign Sallallahou ..Arabic Small Kasra
			0x0064b...0x0065f, // Arabic Fathatan         ..Arabic Wavy Hamza Below
			0x00670...0x00670, // Arabic Letter Superscript Alef
			0x006d6...0x006dd, // Arabic Small High Ligatu..Arabic End Of Ayah
			0x006df...0x006e4, // Arabic Small High Rounde..Arabic Small High Madda
			0x006e7...0x006e8, // Arabic Small High Yeh   ..Arabic Small High Noon
			0x006ea...0x006ed, // Arabic Empty Centre Low ..Arabic Small Low Meem
			0x0070f...0x0070f, // Syriac Abbreviation Mark
			0x00711...0x00711, // Syriac Letter Superscript Alaph
			0x00730...0x0074a, // Syriac Pthaha Above     ..Syriac Barrekh
			0x007a6...0x007b0, // Thaana Abafili          ..Thaana Sukun
			0x007eb...0x007f3, // Nko Combining Short High..Nko Combining Double Dot
			0x00816...0x00819, // Samaritan Mark In       ..Samaritan Mark Dagesh
			0x0081b...0x00823, // Samaritan Mark Epentheti..Samaritan Vowel Sign A
			0x00825...0x00827, // Samaritan Vowel Sign Sho..Samaritan Vowel Sign U
			0x00829...0x0082d, // Samaritan Vowel Sign Lon..Samaritan Mark Nequdaa
			0x00859...0x0085b, // Mandaic Affrication Mark..Mandaic Gemination Mark
			0x00900...0x00903, // Devanagari Sign Inverted..Devanagari Sign Visarga
			0x0093a...0x0093c, // Devanagari Vowel Sign Oe..Devanagari Sign Nukta
			0x0093e...0x0094f, // Devanagari Vowel Sign Aa..Devanagari Vowel Sign Aw
			0x00951...0x00957, // Devanagari Stress Sign U..Devanagari Vowel Sign Uu
			0x00962...0x00963, // Devanagari Vowel Sign Vo..Devanagari Vowel Sign Vo
			0x00981...0x00983, // Bengali Sign Candrabindu..Bengali Sign Visarga
			0x009bc...0x009bc, // Bengali Sign Nukta
			0x009be...0x009c4, // Bengali Vowel Sign Aa   ..Bengali Vowel Sign Vocal
			0x009c7...0x009c8, // Bengali Vowel Sign E    ..Bengali Vowel Sign Ai
			0x009cb...0x009cd, // Bengali Vowel Sign O    ..Bengali Sign Virama
			0x009d7...0x009d7, // Bengali Au Length Mark
			0x009e2...0x009e3, // Bengali Vowel Sign Vocal..Bengali Vowel Sign Vocal
			0x00a01...0x00a03, // Gurmukhi Sign Adak Bindi..Gurmukhi Sign Visarga
			0x00a3c...0x00a3c, // Gurmukhi Sign Nukta
			0x00a3e...0x00a42, // Gurmukhi Vowel Sign Aa  ..Gurmukhi Vowel Sign Uu
			0x00a47...0x00a48, // Gurmukhi Vowel Sign Ee  ..Gurmukhi Vowel Sign Ai
			0x00a4b...0x00a4d, // Gurmukhi Vowel Sign Oo  ..Gurmukhi Sign Virama
			0x00a51...0x00a51, // Gurmukhi Sign Udaat
			0x00a70...0x00a71, // Gurmukhi Tippi          ..Gurmukhi Addak
			0x00a75...0x00a75, // Gurmukhi Sign Yakash
			0x00a81...0x00a83, // Gujarati Sign Candrabind..Gujarati Sign Visarga
			0x00abc...0x00abc, // Gujarati Sign Nukta
			0x00abe...0x00ac5, // Gujarati Vowel Sign Aa  ..Gujarati Vowel Sign Cand
			0x00ac7...0x00ac9, // Gujarati Vowel Sign E   ..Gujarati Vowel Sign Cand
			0x00acb...0x00acd, // Gujarati Vowel Sign O   ..Gujarati Sign Virama
			0x00ae2...0x00ae3, // Gujarati Vowel Sign Voca..Gujarati Vowel Sign Voca
			0x00b01...0x00b03, // Oriya Sign Candrabindu  ..Oriya Sign Visarga
			0x00b3c...0x00b3c, // Oriya Sign Nukta
			0x00b3e...0x00b44, // Oriya Vowel Sign Aa     ..Oriya Vowel Sign Vocalic
			0x00b47...0x00b48, // Oriya Vowel Sign E      ..Oriya Vowel Sign Ai
			0x00b4b...0x00b4d, // Oriya Vowel Sign O      ..Oriya Sign Virama
			0x00b56...0x00b57, // Oriya Ai Length Mark    ..Oriya Au Length Mark
			0x00b62...0x00b63, // Oriya Vowel Sign Vocalic..Oriya Vowel Sign Vocalic
			0x00b82...0x00b82, // Tamil Sign Anusvara
			0x00bbe...0x00bc2, // Tamil Vowel Sign Aa     ..Tamil Vowel Sign Uu
			0x00bc6...0x00bc8, // Tamil Vowel Sign E      ..Tamil Vowel Sign Ai
			0x00bca...0x00bcd, // Tamil Vowel Sign O      ..Tamil Sign Virama
			0x00bd7...0x00bd7, // Tamil Au Length Mark
			0x00c01...0x00c03, // Telugu Sign Candrabindu ..Telugu Sign Visarga
			0x00c3e...0x00c44, // Telugu Vowel Sign Aa    ..Telugu Vowel Sign Vocali
			0x00c46...0x00c48, // Telugu Vowel Sign E     ..Telugu Vowel Sign Ai
			0x00c4a...0x00c4d, // Telugu Vowel Sign O     ..Telugu Sign Virama
			0x00c55...0x00c56, // Telugu Length Mark      ..Telugu Ai Length Mark
			0x00c62...0x00c63, // Telugu Vowel Sign Vocali..Telugu Vowel Sign Vocali
			0x00c82...0x00c83, // Kannada Sign Anusvara   ..Kannada Sign Visarga
			0x00cbc...0x00cbc, // Kannada Sign Nukta
			0x00cbe...0x00cc4, // Kannada Vowel Sign Aa   ..Kannada Vowel Sign Vocal
			0x00cc6...0x00cc8, // Kannada Vowel Sign E    ..Kannada Vowel Sign Ai
			0x00cca...0x00ccd, // Kannada Vowel Sign O    ..Kannada Sign Virama
			0x00cd5...0x00cd6, // Kannada Length Mark     ..Kannada Ai Length Mark
			0x00ce2...0x00ce3, // Kannada Vowel Sign Vocal..Kannada Vowel Sign Vocal
			0x00d02...0x00d03, // Malayalam Sign Anusvara ..Malayalam Sign Visarga
			0x00d3e...0x00d44, // Malayalam Vowel Sign Aa ..Malayalam Vowel Sign Voc
			0x00d46...0x00d48, // Malayalam Vowel Sign E  ..Malayalam Vowel Sign Ai
			0x00d4a...0x00d4d, // Malayalam Vowel Sign O  ..Malayalam Sign Virama
			0x00d57...0x00d57, // Malayalam Au Length Mark
			0x00d62...0x00d63, // Malayalam Vowel Sign Voc..Malayalam Vowel Sign Voc
			0x00d82...0x00d83, // Sinhala Sign Anusvaraya ..Sinhala Sign Visargaya
			0x00dca...0x00dca, // Sinhala Sign Al-lakuna
			0x00dcf...0x00dd4, // Sinhala Vowel Sign Aela-..Sinhala Vowel Sign Ketti
			0x00dd6...0x00dd6, // Sinhala Vowel Sign Diga Paa-pilla
			0x00dd8...0x00ddf, // Sinhala Vowel Sign Gaett..Sinhala Vowel Sign Gayan
			0x00df2...0x00df3, // Sinhala Vowel Sign Diga ..Sinhala Vowel Sign Diga
			0x00e31...0x00e31, // Thai Character Mai Han-akat
			0x00e34...0x00e3a, // Thai Character Sara I   ..Thai Character Phinthu
			0x00e47...0x00e4e, // Thai Character Maitaikhu..Thai Character Yamakkan
			0x00eb1...0x00eb1, // Lao Vowel Sign Mai Kan
			0x00eb4...0x00eb9, // Lao Vowel Sign I        ..Lao Vowel Sign Uu
			0x00ebb...0x00ebc, // Lao Vowel Sign Mai Kon  ..Lao Semivowel Sign Lo
			0x00ec8...0x00ecd, // Lao Tone Mai Ek         ..Lao Niggahita
			0x00f18...0x00f19, // Tibetan Astrological Sig..Tibetan Astrological Sig
			0x00f35...0x00f35, // Tibetan Mark Ngas Bzung Nyi Zla
			0x00f37...0x00f37, // Tibetan Mark Ngas Bzung Sgor Rtags
			0x00f39...0x00f39, // Tibetan Mark Tsa -phru
			0x00f3e...0x00f3f, // Tibetan Sign Yar Tshes  ..Tibetan Sign Mar Tshes
			0x00f71...0x00f84, // Tibetan Vowel Sign Aa   ..Tibetan Mark Halanta
			0x00f86...0x00f87, // Tibetan Sign Lci Rtags  ..Tibetan Sign Yang Rtags
			0x00f8d...0x00f97, // Tibetan Subjoined Sign L..Tibetan Subjoined Letter
			0x00f99...0x00fbc, // Tibetan Subjoined Letter..Tibetan Subjoined Letter
			0x00fc6...0x00fc6, // Tibetan Symbol Padma Gdan
			0x0102b...0x0103e, // Myanmar Vowel Sign Tall ..Myanmar Consonant Sign M
			0x01056...0x01059, // Myanmar Vowel Sign Vocal..Myanmar Vowel Sign Vocal
			0x0105e...0x01060, // Myanmar Consonant Sign M..Myanmar Consonant Sign M
			0x01062...0x01064, // Myanmar Vowel Sign Sgaw ..Myanmar Tone Mark Sgaw K
			0x01067...0x0106d, // Myanmar Vowel Sign Weste..Myanmar Sign Western Pwo
			0x01071...0x01074, // Myanmar Vowel Sign Geba ..Myanmar Vowel Sign Kayah
			0x01082...0x0108d, // Myanmar Consonant Sign S..Myanmar Sign Shan Counci
			0x0108f...0x0108f, // Myanmar Sign Rumai Palaung Tone-5
			0x0109a...0x0109d, // Myanmar Sign Khamti Tone..Myanmar Vowel Sign Aiton
			0x01160...0x011ff, // Hangul Jungseong Filler ..Hangul Jongseong Ssangni
			0x0135d...0x0135f, // Ethiopic Combining Gemin..Ethiopic Combining Gemin
			0x01712...0x01714, // Tagalog Vowel Sign I    ..Tagalog Sign Virama
			0x01732...0x01734, // Hanunoo Vowel Sign I    ..Hanunoo Sign Pamudpod
			0x01752...0x01753, // Buhid Vowel Sign I      ..Buhid Vowel Sign U
			0x01772...0x01773, // Tagbanwa Vowel Sign I   ..Tagbanwa Vowel Sign U
			0x017b4...0x017d3, // Khmer Vowel Inherent Aq ..Khmer Sign Bathamasat
			0x017dd...0x017dd, // Khmer Sign Atthacan
			0x0180b...0x0180d, // Mongolian Free Variation..Mongolian Free Variation
			0x018a9...0x018a9, // Mongolian Letter Ali Gali Dagalga
			0x01920...0x0192b, // Limbu Vowel Sign A      ..Limbu Subjoined Letter W
			0x01930...0x0193b, // Limbu Small Letter Ka   ..Limbu Sign Sa-i
			0x019b0...0x019c0, // New Tai Lue Vowel Sign V..New Tai Lue Vowel Sign I
			0x019c8...0x019c9, // New Tai Lue Tone Mark-1 ..New Tai Lue Tone Mark-2
			0x01a17...0x01a1b, // Buginese Vowel Sign I   ..Buginese Vowel Sign Ae
			0x01a55...0x01a5e, // Tai Tham Consonant Sign ..Tai Tham Consonant Sign
			0x01a60...0x01a7c, // Tai Tham Sign Sakot     ..Tai Tham Sign Khuen-lue
			0x01a7f...0x01a7f, // Tai Tham Combining Cryptogrammic Dot
			0x01b00...0x01b04, // Balinese Sign Ulu Ricem ..Balinese Sign Bisah
			0x01b34...0x01b44, // Balinese Sign Rerekan   ..Balinese Adeg Adeg
			0x01b6b...0x01b73, // Balinese Musical Symbol ..Balinese Musical Symbol
			0x01b80...0x01b82, // Sundanese Sign Panyecek ..Sundanese Sign Pangwisad
			0x01ba1...0x01baa, // Sundanese Consonant Sign..Sundanese Sign Pamaaeh
			0x01be6...0x01bf3, // Batak Sign Tompi        ..Batak Panongonan
			0x01c24...0x01c37, // Lepcha Subjoined Letter ..Lepcha Sign Nukta
			0x01cd0...0x01cd2, // Vedic Tone Karshana     ..Vedic Tone Prenkha
			0x01cd4...0x01ce8, // Vedic Sign Yajurvedic Mi..Vedic Sign Visarga Anuda
			0x01ced...0x01ced, // Vedic Sign Tiryak
			0x01cf2...0x01cf2, // Vedic Sign Ardhavisarga
			0x01dc0...0x01de6, // Combining Dotted Grave A..Combining Latin Small Le
			0x01dfc...0x01dff, // Combining Double Inverte..Combining Right Arrowhea
			0x0200b...0x0200f, // Zero Width Space        ..Right-to-left Mark
			0x02028...0x0202e, // Line Separator          ..Right-to-left Override
			0x02060...0x02064, // Word Joiner             ..Invisible Plus
			0x0206a...0x0206f, // Inhibit Symmetric Swappi..Nominal Digit Shapes
			0x020d0...0x020f0, // Combining Left Harpoon A..Combining Asterisk Above
			0x02cef...0x02cf1, // Coptic Combining Ni Abov..Coptic Combining Spiritu
			0x02d7f...0x02d7f, // Tifinagh Consonant Joiner
			0x02de0...0x02dff, // Combining Cyrillic Lette..Combining Cyrillic Lette
			0x0302a...0x0302f, // Ideographic Level Tone M..Hangul Double Dot Tone M
			0x03099...0x0309a, // Combining Katakana-hirag..Combining Katakana-hirag
			0x0a66f...0x0a672, // Combining Cyrillic Vzmet..Combining Cyrillic Thous
			0x0a67c...0x0a67d, // Combining Cyrillic Kavyk..Combining Cyrillic Payer
			0x0a6f0...0x0a6f1, // Bamum Combining Mark Koq..Bamum Combining Mark Tuk
			0x0a802...0x0a802, // Syloti Nagri Sign Dvisvara
			0x0a806...0x0a806, // Syloti Nagri Sign Hasanta
			0x0a80b...0x0a80b, // Syloti Nagri Sign Anusvara
			0x0a823...0x0a827, // Syloti Nagri Vowel Sign ..Syloti Nagri Vowel Sign
			0x0a880...0x0a881, // Saurashtra Sign Anusvara..Saurashtra Sign Visarga
			0x0a8b4...0x0a8c4, // Saurashtra Consonant Sig..Saurashtra Sign Virama
			0x0a8e0...0x0a8f1, // Combining Devanagari Dig..Combining Devanagari Sig
			0x0a926...0x0a92d, // Kayah Li Vowel Ue       ..Kayah Li Tone Calya Plop
			0x0a947...0x0a953, // Rejang Vowel Sign I     ..Rejang Virama
			0x0a980...0x0a983, // Javanese Sign Panyangga ..Javanese Sign Wignyan
			0x0a9b3...0x0a9c0, // Javanese Sign Cecak Telu..Javanese Pangkon
			0x0aa29...0x0aa36, // Cham Vowel Sign Aa      ..Cham Consonant Sign Wa
			0x0aa43...0x0aa43, // Cham Consonant Sign Final Ng
			0x0aa4c...0x0aa4d, // Cham Consonant Sign Fina..Cham Consonant Sign Fina
			0x0aa7b...0x0aa7b, // Myanmar Sign Pao Karen Tone
			0x0aab0...0x0aab0, // Tai Viet Mai Kang
			0x0aab2...0x0aab4, // Tai Viet Vowel I        ..Tai Viet Vowel U
			0x0aab7...0x0aab8, // Tai Viet Mai Khit       ..Tai Viet Vowel Ia
			0x0aabe...0x0aabf, // Tai Viet Vowel Am       ..Tai Viet Tone Mai Ek
			0x0aac1...0x0aac1, // Tai Viet Tone Mai Tho
			0x0abe3...0x0abea, // Meetei Mayek Vowel Sign ..Meetei Mayek Vowel Sign
			0x0abec...0x0abed, // Meetei Mayek Lum Iyek   ..Meetei Mayek Apun Iyek
			0x0d7b0...0x0d7ff, // Hangul Jungseong O-yeo  ..(nil)
			0x0fb1e...0x0fb1e, // Hebrew Point Judeo-spanish Varika
			0x0fe00...0x0fe0f, // Variation Selector-1    ..Variation Selector-16
			0x0fe20...0x0fe26, // Combining Ligature Left ..Combining Conjoining Mac
			0x0feff...0x0feff, // Zero Width No-break Space
			0x0fff9...0x0fffb, // Interlinear Annotation A..Interlinear Annotation T
			0x101fd...0x101fd, // Phaistos Disc Sign Combining Oblique Stroke
			0x10a01...0x10a03, // Kharoshthi Vowel Sign I ..Kharoshthi Vowel Sign Vo
			0x10a05...0x10a06, // Kharoshthi Vowel Sign E ..Kharoshthi Vowel Sign O
			0x10a0c...0x10a0f, // Kharoshthi Vowel Length ..Kharoshthi Sign Visarga
			0x10a38...0x10a3a, // Kharoshthi Sign Bar Abov..Kharoshthi Sign Dot Belo
			0x10a3f...0x10a3f, // Kharoshthi Virama
			0x11000...0x11002, // Brahmi Sign Candrabindu ..Brahmi Sign Visarga
			0x11038...0x11046, // Brahmi Vowel Sign Aa    ..Brahmi Virama
			0x11080...0x11082, // Kaithi Sign Candrabindu ..Kaithi Sign Visarga
			0x110b0...0x110ba, // Kaithi Vowel Sign Aa    ..Kaithi Sign Nukta
			0x110bd...0x110bd, // Kaithi Number Sign
			0x1d165...0x1d169, // Musical Symbol Combining..Musical Symbol Combining
			0x1d16d...0x1d182, // Musical Symbol Combining..Musical Symbol Combining
			0x1d185...0x1d18b, // Musical Symbol Combining..Musical Symbol Combining
			0x1d1aa...0x1d1ad, // Musical Symbol Combining..Musical Symbol Combining
			0x1d242...0x1d244, // Combining Greek Musical ..Combining Greek Musical
			0xe0001...0xe0001, // Language Tag
			0xe0020...0xe007f, // Tag Space               ..Cancel Tag
			0xe0100...0xe01ef, // Variation Selector-17   ..Variation Selector-256
			=> true,
			else => false,
		},
		.@"6.1.0" => switch (codepoint) {
			// Source: DerivedGeneralCategory-6.1.0.txt
			// Date: 2011-11-27, 05:10:22 GMT [MD]
			0x00000...0x00000, // (nil)
			0x000ad...0x000ad, // Soft Hyphen
			0x00300...0x0036f, // Combining Grave Accent  ..Combining Latin Small Le
			0x00483...0x00489, // Combining Cyrillic Titlo..Combining Cyrillic Milli
			0x00591...0x005bd, // Hebrew Accent Etnahta   ..Hebrew Point Meteg
			0x005bf...0x005bf, // Hebrew Point Rafe
			0x005c1...0x005c2, // Hebrew Point Shin Dot   ..Hebrew Point Sin Dot
			0x005c4...0x005c5, // Hebrew Mark Upper Dot   ..Hebrew Mark Lower Dot
			0x005c7...0x005c7, // Hebrew Point Qamats Qatan
			0x00600...0x00604, // Arabic Number Sign      ..Arabic Sign Samvat
			0x00610...0x0061a, // Arabic Sign Sallallahou ..Arabic Small Kasra
			0x0064b...0x0065f, // Arabic Fathatan         ..Arabic Wavy Hamza Below
			0x00670...0x00670, // Arabic Letter Superscript Alef
			0x006d6...0x006dd, // Arabic Small High Ligatu..Arabic End Of Ayah
			0x006df...0x006e4, // Arabic Small High Rounde..Arabic Small High Madda
			0x006e7...0x006e8, // Arabic Small High Yeh   ..Arabic Small High Noon
			0x006ea...0x006ed, // Arabic Empty Centre Low ..Arabic Small Low Meem
			0x0070f...0x0070f, // Syriac Abbreviation Mark
			0x00711...0x00711, // Syriac Letter Superscript Alaph
			0x00730...0x0074a, // Syriac Pthaha Above     ..Syriac Barrekh
			0x007a6...0x007b0, // Thaana Abafili          ..Thaana Sukun
			0x007eb...0x007f3, // Nko Combining Short High..Nko Combining Double Dot
			0x00816...0x00819, // Samaritan Mark In       ..Samaritan Mark Dagesh
			0x0081b...0x00823, // Samaritan Mark Epentheti..Samaritan Vowel Sign A
			0x00825...0x00827, // Samaritan Vowel Sign Sho..Samaritan Vowel Sign U
			0x00829...0x0082d, // Samaritan Vowel Sign Lon..Samaritan Mark Nequdaa
			0x00859...0x0085b, // Mandaic Affrication Mark..Mandaic Gemination Mark
			0x008e4...0x008fe, // Arabic Curly Fatha      ..Arabic Damma With Dot
			0x00900...0x00903, // Devanagari Sign Inverted..Devanagari Sign Visarga
			0x0093a...0x0093c, // Devanagari Vowel Sign Oe..Devanagari Sign Nukta
			0x0093e...0x0094f, // Devanagari Vowel Sign Aa..Devanagari Vowel Sign Aw
			0x00951...0x00957, // Devanagari Stress Sign U..Devanagari Vowel Sign Uu
			0x00962...0x00963, // Devanagari Vowel Sign Vo..Devanagari Vowel Sign Vo
			0x00981...0x00983, // Bengali Sign Candrabindu..Bengali Sign Visarga
			0x009bc...0x009bc, // Bengali Sign Nukta
			0x009be...0x009c4, // Bengali Vowel Sign Aa   ..Bengali Vowel Sign Vocal
			0x009c7...0x009c8, // Bengali Vowel Sign E    ..Bengali Vowel Sign Ai
			0x009cb...0x009cd, // Bengali Vowel Sign O    ..Bengali Sign Virama
			0x009d7...0x009d7, // Bengali Au Length Mark
			0x009e2...0x009e3, // Bengali Vowel Sign Vocal..Bengali Vowel Sign Vocal
			0x00a01...0x00a03, // Gurmukhi Sign Adak Bindi..Gurmukhi Sign Visarga
			0x00a3c...0x00a3c, // Gurmukhi Sign Nukta
			0x00a3e...0x00a42, // Gurmukhi Vowel Sign Aa  ..Gurmukhi Vowel Sign Uu
			0x00a47...0x00a48, // Gurmukhi Vowel Sign Ee  ..Gurmukhi Vowel Sign Ai
			0x00a4b...0x00a4d, // Gurmukhi Vowel Sign Oo  ..Gurmukhi Sign Virama
			0x00a51...0x00a51, // Gurmukhi Sign Udaat
			0x00a70...0x00a71, // Gurmukhi Tippi          ..Gurmukhi Addak
			0x00a75...0x00a75, // Gurmukhi Sign Yakash
			0x00a81...0x00a83, // Gujarati Sign Candrabind..Gujarati Sign Visarga
			0x00abc...0x00abc, // Gujarati Sign Nukta
			0x00abe...0x00ac5, // Gujarati Vowel Sign Aa  ..Gujarati Vowel Sign Cand
			0x00ac7...0x00ac9, // Gujarati Vowel Sign E   ..Gujarati Vowel Sign Cand
			0x00acb...0x00acd, // Gujarati Vowel Sign O   ..Gujarati Sign Virama
			0x00ae2...0x00ae3, // Gujarati Vowel Sign Voca..Gujarati Vowel Sign Voca
			0x00b01...0x00b03, // Oriya Sign Candrabindu  ..Oriya Sign Visarga
			0x00b3c...0x00b3c, // Oriya Sign Nukta
			0x00b3e...0x00b44, // Oriya Vowel Sign Aa     ..Oriya Vowel Sign Vocalic
			0x00b47...0x00b48, // Oriya Vowel Sign E      ..Oriya Vowel Sign Ai
			0x00b4b...0x00b4d, // Oriya Vowel Sign O      ..Oriya Sign Virama
			0x00b56...0x00b57, // Oriya Ai Length Mark    ..Oriya Au Length Mark
			0x00b62...0x00b63, // Oriya Vowel Sign Vocalic..Oriya Vowel Sign Vocalic
			0x00b82...0x00b82, // Tamil Sign Anusvara
			0x00bbe...0x00bc2, // Tamil Vowel Sign Aa     ..Tamil Vowel Sign Uu
			0x00bc6...0x00bc8, // Tamil Vowel Sign E      ..Tamil Vowel Sign Ai
			0x00bca...0x00bcd, // Tamil Vowel Sign O      ..Tamil Sign Virama
			0x00bd7...0x00bd7, // Tamil Au Length Mark
			0x00c01...0x00c03, // Telugu Sign Candrabindu ..Telugu Sign Visarga
			0x00c3e...0x00c44, // Telugu Vowel Sign Aa    ..Telugu Vowel Sign Vocali
			0x00c46...0x00c48, // Telugu Vowel Sign E     ..Telugu Vowel Sign Ai
			0x00c4a...0x00c4d, // Telugu Vowel Sign O     ..Telugu Sign Virama
			0x00c55...0x00c56, // Telugu Length Mark      ..Telugu Ai Length Mark
			0x00c62...0x00c63, // Telugu Vowel Sign Vocali..Telugu Vowel Sign Vocali
			0x00c82...0x00c83, // Kannada Sign Anusvara   ..Kannada Sign Visarga
			0x00cbc...0x00cbc, // Kannada Sign Nukta
			0x00cbe...0x00cc4, // Kannada Vowel Sign Aa   ..Kannada Vowel Sign Vocal
			0x00cc6...0x00cc8, // Kannada Vowel Sign E    ..Kannada Vowel Sign Ai
			0x00cca...0x00ccd, // Kannada Vowel Sign O    ..Kannada Sign Virama
			0x00cd5...0x00cd6, // Kannada Length Mark     ..Kannada Ai Length Mark
			0x00ce2...0x00ce3, // Kannada Vowel Sign Vocal..Kannada Vowel Sign Vocal
			0x00d02...0x00d03, // Malayalam Sign Anusvara ..Malayalam Sign Visarga
			0x00d3e...0x00d44, // Malayalam Vowel Sign Aa ..Malayalam Vowel Sign Voc
			0x00d46...0x00d48, // Malayalam Vowel Sign E  ..Malayalam Vowel Sign Ai
			0x00d4a...0x00d4d, // Malayalam Vowel Sign O  ..Malayalam Sign Virama
			0x00d57...0x00d57, // Malayalam Au Length Mark
			0x00d62...0x00d63, // Malayalam Vowel Sign Voc..Malayalam Vowel Sign Voc
			0x00d82...0x00d83, // Sinhala Sign Anusvaraya ..Sinhala Sign Visargaya
			0x00dca...0x00dca, // Sinhala Sign Al-lakuna
			0x00dcf...0x00dd4, // Sinhala Vowel Sign Aela-..Sinhala Vowel Sign Ketti
			0x00dd6...0x00dd6, // Sinhala Vowel Sign Diga Paa-pilla
			0x00dd8...0x00ddf, // Sinhala Vowel Sign Gaett..Sinhala Vowel Sign Gayan
			0x00df2...0x00df3, // Sinhala Vowel Sign Diga ..Sinhala Vowel Sign Diga
			0x00e31...0x00e31, // Thai Character Mai Han-akat
			0x00e34...0x00e3a, // Thai Character Sara I   ..Thai Character Phinthu
			0x00e47...0x00e4e, // Thai Character Maitaikhu..Thai Character Yamakkan
			0x00eb1...0x00eb1, // Lao Vowel Sign Mai Kan
			0x00eb4...0x00eb9, // Lao Vowel Sign I        ..Lao Vowel Sign Uu
			0x00ebb...0x00ebc, // Lao Vowel Sign Mai Kon  ..Lao Semivowel Sign Lo
			0x00ec8...0x00ecd, // Lao Tone Mai Ek         ..Lao Niggahita
			0x00f18...0x00f19, // Tibetan Astrological Sig..Tibetan Astrological Sig
			0x00f35...0x00f35, // Tibetan Mark Ngas Bzung Nyi Zla
			0x00f37...0x00f37, // Tibetan Mark Ngas Bzung Sgor Rtags
			0x00f39...0x00f39, // Tibetan Mark Tsa -phru
			0x00f3e...0x00f3f, // Tibetan Sign Yar Tshes  ..Tibetan Sign Mar Tshes
			0x00f71...0x00f84, // Tibetan Vowel Sign Aa   ..Tibetan Mark Halanta
			0x00f86...0x00f87, // Tibetan Sign Lci Rtags  ..Tibetan Sign Yang Rtags
			0x00f8d...0x00f97, // Tibetan Subjoined Sign L..Tibetan Subjoined Letter
			0x00f99...0x00fbc, // Tibetan Subjoined Letter..Tibetan Subjoined Letter
			0x00fc6...0x00fc6, // Tibetan Symbol Padma Gdan
			0x0102b...0x0103e, // Myanmar Vowel Sign Tall ..Myanmar Consonant Sign M
			0x01056...0x01059, // Myanmar Vowel Sign Vocal..Myanmar Vowel Sign Vocal
			0x0105e...0x01060, // Myanmar Consonant Sign M..Myanmar Consonant Sign M
			0x01062...0x01064, // Myanmar Vowel Sign Sgaw ..Myanmar Tone Mark Sgaw K
			0x01067...0x0106d, // Myanmar Vowel Sign Weste..Myanmar Sign Western Pwo
			0x01071...0x01074, // Myanmar Vowel Sign Geba ..Myanmar Vowel Sign Kayah
			0x01082...0x0108d, // Myanmar Consonant Sign S..Myanmar Sign Shan Counci
			0x0108f...0x0108f, // Myanmar Sign Rumai Palaung Tone-5
			0x0109a...0x0109d, // Myanmar Sign Khamti Tone..Myanmar Vowel Sign Aiton
			0x01160...0x011ff, // Hangul Jungseong Filler ..Hangul Jongseong Ssangni
			0x0135d...0x0135f, // Ethiopic Combining Gemin..Ethiopic Combining Gemin
			0x01712...0x01714, // Tagalog Vowel Sign I    ..Tagalog Sign Virama
			0x01732...0x01734, // Hanunoo Vowel Sign I    ..Hanunoo Sign Pamudpod
			0x01752...0x01753, // Buhid Vowel Sign I      ..Buhid Vowel Sign U
			0x01772...0x01773, // Tagbanwa Vowel Sign I   ..Tagbanwa Vowel Sign U
			0x017b4...0x017d3, // Khmer Vowel Inherent Aq ..Khmer Sign Bathamasat
			0x017dd...0x017dd, // Khmer Sign Atthacan
			0x0180b...0x0180d, // Mongolian Free Variation..Mongolian Free Variation
			0x018a9...0x018a9, // Mongolian Letter Ali Gali Dagalga
			0x01920...0x0192b, // Limbu Vowel Sign A      ..Limbu Subjoined Letter W
			0x01930...0x0193b, // Limbu Small Letter Ka   ..Limbu Sign Sa-i
			0x019b0...0x019c0, // New Tai Lue Vowel Sign V..New Tai Lue Vowel Sign I
			0x019c8...0x019c9, // New Tai Lue Tone Mark-1 ..New Tai Lue Tone Mark-2
			0x01a17...0x01a1b, // Buginese Vowel Sign I   ..Buginese Vowel Sign Ae
			0x01a55...0x01a5e, // Tai Tham Consonant Sign ..Tai Tham Consonant Sign
			0x01a60...0x01a7c, // Tai Tham Sign Sakot     ..Tai Tham Sign Khuen-lue
			0x01a7f...0x01a7f, // Tai Tham Combining Cryptogrammic Dot
			0x01b00...0x01b04, // Balinese Sign Ulu Ricem ..Balinese Sign Bisah
			0x01b34...0x01b44, // Balinese Sign Rerekan   ..Balinese Adeg Adeg
			0x01b6b...0x01b73, // Balinese Musical Symbol ..Balinese Musical Symbol
			0x01b80...0x01b82, // Sundanese Sign Panyecek ..Sundanese Sign Pangwisad
			0x01ba1...0x01bad, // Sundanese Consonant Sign..Sundanese Consonant Sign
			0x01be6...0x01bf3, // Batak Sign Tompi        ..Batak Panongonan
			0x01c24...0x01c37, // Lepcha Subjoined Letter ..Lepcha Sign Nukta
			0x01cd0...0x01cd2, // Vedic Tone Karshana     ..Vedic Tone Prenkha
			0x01cd4...0x01ce8, // Vedic Sign Yajurvedic Mi..Vedic Sign Visarga Anuda
			0x01ced...0x01ced, // Vedic Sign Tiryak
			0x01cf2...0x01cf4, // Vedic Sign Ardhavisarga ..Vedic Tone Candra Above
			0x01dc0...0x01de6, // Combining Dotted Grave A..Combining Latin Small Le
			0x01dfc...0x01dff, // Combining Double Inverte..Combining Right Arrowhea
			0x0200b...0x0200f, // Zero Width Space        ..Right-to-left Mark
			0x02028...0x0202e, // Line Separator          ..Right-to-left Override
			0x02060...0x02064, // Word Joiner             ..Invisible Plus
			0x0206a...0x0206f, // Inhibit Symmetric Swappi..Nominal Digit Shapes
			0x020d0...0x020f0, // Combining Left Harpoon A..Combining Asterisk Above
			0x02cef...0x02cf1, // Coptic Combining Ni Abov..Coptic Combining Spiritu
			0x02d7f...0x02d7f, // Tifinagh Consonant Joiner
			0x02de0...0x02dff, // Combining Cyrillic Lette..Combining Cyrillic Lette
			0x0302a...0x0302f, // Ideographic Level Tone M..Hangul Double Dot Tone M
			0x03099...0x0309a, // Combining Katakana-hirag..Combining Katakana-hirag
			0x0a66f...0x0a672, // Combining Cyrillic Vzmet..Combining Cyrillic Thous
			0x0a674...0x0a67d, // Combining Cyrillic Lette..Combining Cyrillic Payer
			0x0a69f...0x0a69f, // Combining Cyrillic Letter Iotified E
			0x0a6f0...0x0a6f1, // Bamum Combining Mark Koq..Bamum Combining Mark Tuk
			0x0a802...0x0a802, // Syloti Nagri Sign Dvisvara
			0x0a806...0x0a806, // Syloti Nagri Sign Hasanta
			0x0a80b...0x0a80b, // Syloti Nagri Sign Anusvara
			0x0a823...0x0a827, // Syloti Nagri Vowel Sign ..Syloti Nagri Vowel Sign
			0x0a880...0x0a881, // Saurashtra Sign Anusvara..Saurashtra Sign Visarga
			0x0a8b4...0x0a8c4, // Saurashtra Consonant Sig..Saurashtra Sign Virama
			0x0a8e0...0x0a8f1, // Combining Devanagari Dig..Combining Devanagari Sig
			0x0a926...0x0a92d, // Kayah Li Vowel Ue       ..Kayah Li Tone Calya Plop
			0x0a947...0x0a953, // Rejang Vowel Sign I     ..Rejang Virama
			0x0a980...0x0a983, // Javanese Sign Panyangga ..Javanese Sign Wignyan
			0x0a9b3...0x0a9c0, // Javanese Sign Cecak Telu..Javanese Pangkon
			0x0aa29...0x0aa36, // Cham Vowel Sign Aa      ..Cham Consonant Sign Wa
			0x0aa43...0x0aa43, // Cham Consonant Sign Final Ng
			0x0aa4c...0x0aa4d, // Cham Consonant Sign Fina..Cham Consonant Sign Fina
			0x0aa7b...0x0aa7b, // Myanmar Sign Pao Karen Tone
			0x0aab0...0x0aab0, // Tai Viet Mai Kang
			0x0aab2...0x0aab4, // Tai Viet Vowel I        ..Tai Viet Vowel U
			0x0aab7...0x0aab8, // Tai Viet Mai Khit       ..Tai Viet Vowel Ia
			0x0aabe...0x0aabf, // Tai Viet Vowel Am       ..Tai Viet Tone Mai Ek
			0x0aac1...0x0aac1, // Tai Viet Tone Mai Tho
			0x0aaeb...0x0aaef, // Meetei Mayek Vowel Sign ..Meetei Mayek Vowel Sign
			0x0aaf5...0x0aaf6, // Meetei Mayek Vowel Sign ..Meetei Mayek Virama
			0x0abe3...0x0abea, // Meetei Mayek Vowel Sign ..Meetei Mayek Vowel Sign
			0x0abec...0x0abed, // Meetei Mayek Lum Iyek   ..Meetei Mayek Apun Iyek
			0x0d7b0...0x0d7ff, // Hangul Jungseong O-yeo  ..(nil)
			0x0fb1e...0x0fb1e, // Hebrew Point Judeo-spanish Varika
			0x0fe00...0x0fe0f, // Variation Selector-1    ..Variation Selector-16
			0x0fe20...0x0fe26, // Combining Ligature Left ..Combining Conjoining Mac
			0x0feff...0x0feff, // Zero Width No-break Space
			0x0fff9...0x0fffb, // Interlinear Annotation A..Interlinear Annotation T
			0x101fd...0x101fd, // Phaistos Disc Sign Combining Oblique Stroke
			0x10a01...0x10a03, // Kharoshthi Vowel Sign I ..Kharoshthi Vowel Sign Vo
			0x10a05...0x10a06, // Kharoshthi Vowel Sign E ..Kharoshthi Vowel Sign O
			0x10a0c...0x10a0f, // Kharoshthi Vowel Length ..Kharoshthi Sign Visarga
			0x10a38...0x10a3a, // Kharoshthi Sign Bar Abov..Kharoshthi Sign Dot Belo
			0x10a3f...0x10a3f, // Kharoshthi Virama
			0x11000...0x11002, // Brahmi Sign Candrabindu ..Brahmi Sign Visarga
			0x11038...0x11046, // Brahmi Vowel Sign Aa    ..Brahmi Virama
			0x11080...0x11082, // Kaithi Sign Candrabindu ..Kaithi Sign Visarga
			0x110b0...0x110ba, // Kaithi Vowel Sign Aa    ..Kaithi Sign Nukta
			0x110bd...0x110bd, // Kaithi Number Sign
			0x11100...0x11102, // Chakma Sign Candrabindu ..Chakma Sign Visarga
			0x11127...0x11134, // Chakma Vowel Sign A     ..Chakma Maayyaa
			0x11180...0x11182, // Sharada Sign Candrabindu..Sharada Sign Visarga
			0x111b3...0x111c0, // Sharada Vowel Sign Aa   ..Sharada Sign Virama
			0x116ab...0x116b7, // Takri Sign Anusvara     ..Takri Sign Nukta
			0x16f51...0x16f7e, // Miao Sign Aspiration    ..Miao Vowel Sign Ng
			0x16f8f...0x16f92, // Miao Tone Right         ..Miao Tone Below
			0x1d165...0x1d169, // Musical Symbol Combining..Musical Symbol Combining
			0x1d16d...0x1d182, // Musical Symbol Combining..Musical Symbol Combining
			0x1d185...0x1d18b, // Musical Symbol Combining..Musical Symbol Combining
			0x1d1aa...0x1d1ad, // Musical Symbol Combining..Musical Symbol Combining
			0x1d242...0x1d244, // Combining Greek Musical ..Combining Greek Musical
			0xe0001...0xe0001, // Language Tag
			0xe0020...0xe007f, // Tag Space               ..Cancel Tag
			0xe0100...0xe01ef, // Variation Selector-17   ..Variation Selector-256
			=> true,
			else => false,
		},
		.@"6.2.0" => switch (codepoint) {
			// Source: DerivedGeneralCategory-6.2.0.txt
			// Date: 2012-05-20, 00:42:34 GMT [MD]
			0x00000...0x00000, // (nil)
			0x000ad...0x000ad, // Soft Hyphen
			0x00300...0x0036f, // Combining Grave Accent  ..Combining Latin Small Le
			0x00483...0x00489, // Combining Cyrillic Titlo..Combining Cyrillic Milli
			0x00591...0x005bd, // Hebrew Accent Etnahta   ..Hebrew Point Meteg
			0x005bf...0x005bf, // Hebrew Point Rafe
			0x005c1...0x005c2, // Hebrew Point Shin Dot   ..Hebrew Point Sin Dot
			0x005c4...0x005c5, // Hebrew Mark Upper Dot   ..Hebrew Mark Lower Dot
			0x005c7...0x005c7, // Hebrew Point Qamats Qatan
			0x00600...0x00604, // Arabic Number Sign      ..Arabic Sign Samvat
			0x00610...0x0061a, // Arabic Sign Sallallahou ..Arabic Small Kasra
			0x0064b...0x0065f, // Arabic Fathatan         ..Arabic Wavy Hamza Below
			0x00670...0x00670, // Arabic Letter Superscript Alef
			0x006d6...0x006dd, // Arabic Small High Ligatu..Arabic End Of Ayah
			0x006df...0x006e4, // Arabic Small High Rounde..Arabic Small High Madda
			0x006e7...0x006e8, // Arabic Small High Yeh   ..Arabic Small High Noon
			0x006ea...0x006ed, // Arabic Empty Centre Low ..Arabic Small Low Meem
			0x0070f...0x0070f, // Syriac Abbreviation Mark
			0x00711...0x00711, // Syriac Letter Superscript Alaph
			0x00730...0x0074a, // Syriac Pthaha Above     ..Syriac Barrekh
			0x007a6...0x007b0, // Thaana Abafili          ..Thaana Sukun
			0x007eb...0x007f3, // Nko Combining Short High..Nko Combining Double Dot
			0x00816...0x00819, // Samaritan Mark In       ..Samaritan Mark Dagesh
			0x0081b...0x00823, // Samaritan Mark Epentheti..Samaritan Vowel Sign A
			0x00825...0x00827, // Samaritan Vowel Sign Sho..Samaritan Vowel Sign U
			0x00829...0x0082d, // Samaritan Vowel Sign Lon..Samaritan Mark Nequdaa
			0x00859...0x0085b, // Mandaic Affrication Mark..Mandaic Gemination Mark
			0x008e4...0x008fe, // Arabic Curly Fatha      ..Arabic Damma With Dot
			0x00900...0x00903, // Devanagari Sign Inverted..Devanagari Sign Visarga
			0x0093a...0x0093c, // Devanagari Vowel Sign Oe..Devanagari Sign Nukta
			0x0093e...0x0094f, // Devanagari Vowel Sign Aa..Devanagari Vowel Sign Aw
			0x00951...0x00957, // Devanagari Stress Sign U..Devanagari Vowel Sign Uu
			0x00962...0x00963, // Devanagari Vowel Sign Vo..Devanagari Vowel Sign Vo
			0x00981...0x00983, // Bengali Sign Candrabindu..Bengali Sign Visarga
			0x009bc...0x009bc, // Bengali Sign Nukta
			0x009be...0x009c4, // Bengali Vowel Sign Aa   ..Bengali Vowel Sign Vocal
			0x009c7...0x009c8, // Bengali Vowel Sign E    ..Bengali Vowel Sign Ai
			0x009cb...0x009cd, // Bengali Vowel Sign O    ..Bengali Sign Virama
			0x009d7...0x009d7, // Bengali Au Length Mark
			0x009e2...0x009e3, // Bengali Vowel Sign Vocal..Bengali Vowel Sign Vocal
			0x00a01...0x00a03, // Gurmukhi Sign Adak Bindi..Gurmukhi Sign Visarga
			0x00a3c...0x00a3c, // Gurmukhi Sign Nukta
			0x00a3e...0x00a42, // Gurmukhi Vowel Sign Aa  ..Gurmukhi Vowel Sign Uu
			0x00a47...0x00a48, // Gurmukhi Vowel Sign Ee  ..Gurmukhi Vowel Sign Ai
			0x00a4b...0x00a4d, // Gurmukhi Vowel Sign Oo  ..Gurmukhi Sign Virama
			0x00a51...0x00a51, // Gurmukhi Sign Udaat
			0x00a70...0x00a71, // Gurmukhi Tippi          ..Gurmukhi Addak
			0x00a75...0x00a75, // Gurmukhi Sign Yakash
			0x00a81...0x00a83, // Gujarati Sign Candrabind..Gujarati Sign Visarga
			0x00abc...0x00abc, // Gujarati Sign Nukta
			0x00abe...0x00ac5, // Gujarati Vowel Sign Aa  ..Gujarati Vowel Sign Cand
			0x00ac7...0x00ac9, // Gujarati Vowel Sign E   ..Gujarati Vowel Sign Cand
			0x00acb...0x00acd, // Gujarati Vowel Sign O   ..Gujarati Sign Virama
			0x00ae2...0x00ae3, // Gujarati Vowel Sign Voca..Gujarati Vowel Sign Voca
			0x00b01...0x00b03, // Oriya Sign Candrabindu  ..Oriya Sign Visarga
			0x00b3c...0x00b3c, // Oriya Sign Nukta
			0x00b3e...0x00b44, // Oriya Vowel Sign Aa     ..Oriya Vowel Sign Vocalic
			0x00b47...0x00b48, // Oriya Vowel Sign E      ..Oriya Vowel Sign Ai
			0x00b4b...0x00b4d, // Oriya Vowel Sign O      ..Oriya Sign Virama
			0x00b56...0x00b57, // Oriya Ai Length Mark    ..Oriya Au Length Mark
			0x00b62...0x00b63, // Oriya Vowel Sign Vocalic..Oriya Vowel Sign Vocalic
			0x00b82...0x00b82, // Tamil Sign Anusvara
			0x00bbe...0x00bc2, // Tamil Vowel Sign Aa     ..Tamil Vowel Sign Uu
			0x00bc6...0x00bc8, // Tamil Vowel Sign E      ..Tamil Vowel Sign Ai
			0x00bca...0x00bcd, // Tamil Vowel Sign O      ..Tamil Sign Virama
			0x00bd7...0x00bd7, // Tamil Au Length Mark
			0x00c01...0x00c03, // Telugu Sign Candrabindu ..Telugu Sign Visarga
			0x00c3e...0x00c44, // Telugu Vowel Sign Aa    ..Telugu Vowel Sign Vocali
			0x00c46...0x00c48, // Telugu Vowel Sign E     ..Telugu Vowel Sign Ai
			0x00c4a...0x00c4d, // Telugu Vowel Sign O     ..Telugu Sign Virama
			0x00c55...0x00c56, // Telugu Length Mark      ..Telugu Ai Length Mark
			0x00c62...0x00c63, // Telugu Vowel Sign Vocali..Telugu Vowel Sign Vocali
			0x00c82...0x00c83, // Kannada Sign Anusvara   ..Kannada Sign Visarga
			0x00cbc...0x00cbc, // Kannada Sign Nukta
			0x00cbe...0x00cc4, // Kannada Vowel Sign Aa   ..Kannada Vowel Sign Vocal
			0x00cc6...0x00cc8, // Kannada Vowel Sign E    ..Kannada Vowel Sign Ai
			0x00cca...0x00ccd, // Kannada Vowel Sign O    ..Kannada Sign Virama
			0x00cd5...0x00cd6, // Kannada Length Mark     ..Kannada Ai Length Mark
			0x00ce2...0x00ce3, // Kannada Vowel Sign Vocal..Kannada Vowel Sign Vocal
			0x00d02...0x00d03, // Malayalam Sign Anusvara ..Malayalam Sign Visarga
			0x00d3e...0x00d44, // Malayalam Vowel Sign Aa ..Malayalam Vowel Sign Voc
			0x00d46...0x00d48, // Malayalam Vowel Sign E  ..Malayalam Vowel Sign Ai
			0x00d4a...0x00d4d, // Malayalam Vowel Sign O  ..Malayalam Sign Virama
			0x00d57...0x00d57, // Malayalam Au Length Mark
			0x00d62...0x00d63, // Malayalam Vowel Sign Voc..Malayalam Vowel Sign Voc
			0x00d82...0x00d83, // Sinhala Sign Anusvaraya ..Sinhala Sign Visargaya
			0x00dca...0x00dca, // Sinhala Sign Al-lakuna
			0x00dcf...0x00dd4, // Sinhala Vowel Sign Aela-..Sinhala Vowel Sign Ketti
			0x00dd6...0x00dd6, // Sinhala Vowel Sign Diga Paa-pilla
			0x00dd8...0x00ddf, // Sinhala Vowel Sign Gaett..Sinhala Vowel Sign Gayan
			0x00df2...0x00df3, // Sinhala Vowel Sign Diga ..Sinhala Vowel Sign Diga
			0x00e31...0x00e31, // Thai Character Mai Han-akat
			0x00e34...0x00e3a, // Thai Character Sara I   ..Thai Character Phinthu
			0x00e47...0x00e4e, // Thai Character Maitaikhu..Thai Character Yamakkan
			0x00eb1...0x00eb1, // Lao Vowel Sign Mai Kan
			0x00eb4...0x00eb9, // Lao Vowel Sign I        ..Lao Vowel Sign Uu
			0x00ebb...0x00ebc, // Lao Vowel Sign Mai Kon  ..Lao Semivowel Sign Lo
			0x00ec8...0x00ecd, // Lao Tone Mai Ek         ..Lao Niggahita
			0x00f18...0x00f19, // Tibetan Astrological Sig..Tibetan Astrological Sig
			0x00f35...0x00f35, // Tibetan Mark Ngas Bzung Nyi Zla
			0x00f37...0x00f37, // Tibetan Mark Ngas Bzung Sgor Rtags
			0x00f39...0x00f39, // Tibetan Mark Tsa -phru
			0x00f3e...0x00f3f, // Tibetan Sign Yar Tshes  ..Tibetan Sign Mar Tshes
			0x00f71...0x00f84, // Tibetan Vowel Sign Aa   ..Tibetan Mark Halanta
			0x00f86...0x00f87, // Tibetan Sign Lci Rtags  ..Tibetan Sign Yang Rtags
			0x00f8d...0x00f97, // Tibetan Subjoined Sign L..Tibetan Subjoined Letter
			0x00f99...0x00fbc, // Tibetan Subjoined Letter..Tibetan Subjoined Letter
			0x00fc6...0x00fc6, // Tibetan Symbol Padma Gdan
			0x0102b...0x0103e, // Myanmar Vowel Sign Tall ..Myanmar Consonant Sign M
			0x01056...0x01059, // Myanmar Vowel Sign Vocal..Myanmar Vowel Sign Vocal
			0x0105e...0x01060, // Myanmar Consonant Sign M..Myanmar Consonant Sign M
			0x01062...0x01064, // Myanmar Vowel Sign Sgaw ..Myanmar Tone Mark Sgaw K
			0x01067...0x0106d, // Myanmar Vowel Sign Weste..Myanmar Sign Western Pwo
			0x01071...0x01074, // Myanmar Vowel Sign Geba ..Myanmar Vowel Sign Kayah
			0x01082...0x0108d, // Myanmar Consonant Sign S..Myanmar Sign Shan Counci
			0x0108f...0x0108f, // Myanmar Sign Rumai Palaung Tone-5
			0x0109a...0x0109d, // Myanmar Sign Khamti Tone..Myanmar Vowel Sign Aiton
			0x01160...0x011ff, // Hangul Jungseong Filler ..Hangul Jongseong Ssangni
			0x0135d...0x0135f, // Ethiopic Combining Gemin..Ethiopic Combining Gemin
			0x01712...0x01714, // Tagalog Vowel Sign I    ..Tagalog Sign Virama
			0x01732...0x01734, // Hanunoo Vowel Sign I    ..Hanunoo Sign Pamudpod
			0x01752...0x01753, // Buhid Vowel Sign I      ..Buhid Vowel Sign U
			0x01772...0x01773, // Tagbanwa Vowel Sign I   ..Tagbanwa Vowel Sign U
			0x017b4...0x017d3, // Khmer Vowel Inherent Aq ..Khmer Sign Bathamasat
			0x017dd...0x017dd, // Khmer Sign Atthacan
			0x0180b...0x0180d, // Mongolian Free Variation..Mongolian Free Variation
			0x018a9...0x018a9, // Mongolian Letter Ali Gali Dagalga
			0x01920...0x0192b, // Limbu Vowel Sign A      ..Limbu Subjoined Letter W
			0x01930...0x0193b, // Limbu Small Letter Ka   ..Limbu Sign Sa-i
			0x019b0...0x019c0, // New Tai Lue Vowel Sign V..New Tai Lue Vowel Sign I
			0x019c8...0x019c9, // New Tai Lue Tone Mark-1 ..New Tai Lue Tone Mark-2
			0x01a17...0x01a1b, // Buginese Vowel Sign I   ..Buginese Vowel Sign Ae
			0x01a55...0x01a5e, // Tai Tham Consonant Sign ..Tai Tham Consonant Sign
			0x01a60...0x01a7c, // Tai Tham Sign Sakot     ..Tai Tham Sign Khuen-lue
			0x01a7f...0x01a7f, // Tai Tham Combining Cryptogrammic Dot
			0x01b00...0x01b04, // Balinese Sign Ulu Ricem ..Balinese Sign Bisah
			0x01b34...0x01b44, // Balinese Sign Rerekan   ..Balinese Adeg Adeg
			0x01b6b...0x01b73, // Balinese Musical Symbol ..Balinese Musical Symbol
			0x01b80...0x01b82, // Sundanese Sign Panyecek ..Sundanese Sign Pangwisad
			0x01ba1...0x01bad, // Sundanese Consonant Sign..Sundanese Consonant Sign
			0x01be6...0x01bf3, // Batak Sign Tompi        ..Batak Panongonan
			0x01c24...0x01c37, // Lepcha Subjoined Letter ..Lepcha Sign Nukta
			0x01cd0...0x01cd2, // Vedic Tone Karshana     ..Vedic Tone Prenkha
			0x01cd4...0x01ce8, // Vedic Sign Yajurvedic Mi..Vedic Sign Visarga Anuda
			0x01ced...0x01ced, // Vedic Sign Tiryak
			0x01cf2...0x01cf4, // Vedic Sign Ardhavisarga ..Vedic Tone Candra Above
			0x01dc0...0x01de6, // Combining Dotted Grave A..Combining Latin Small Le
			0x01dfc...0x01dff, // Combining Double Inverte..Combining Right Arrowhea
			0x0200b...0x0200f, // Zero Width Space        ..Right-to-left Mark
			0x02028...0x0202e, // Line Separator          ..Right-to-left Override
			0x02060...0x02064, // Word Joiner             ..Invisible Plus
			0x0206a...0x0206f, // Inhibit Symmetric Swappi..Nominal Digit Shapes
			0x020d0...0x020f0, // Combining Left Harpoon A..Combining Asterisk Above
			0x02cef...0x02cf1, // Coptic Combining Ni Abov..Coptic Combining Spiritu
			0x02d7f...0x02d7f, // Tifinagh Consonant Joiner
			0x02de0...0x02dff, // Combining Cyrillic Lette..Combining Cyrillic Lette
			0x0302a...0x0302f, // Ideographic Level Tone M..Hangul Double Dot Tone M
			0x03099...0x0309a, // Combining Katakana-hirag..Combining Katakana-hirag
			0x0a66f...0x0a672, // Combining Cyrillic Vzmet..Combining Cyrillic Thous
			0x0a674...0x0a67d, // Combining Cyrillic Lette..Combining Cyrillic Payer
			0x0a69f...0x0a69f, // Combining Cyrillic Letter Iotified E
			0x0a6f0...0x0a6f1, // Bamum Combining Mark Koq..Bamum Combining Mark Tuk
			0x0a802...0x0a802, // Syloti Nagri Sign Dvisvara
			0x0a806...0x0a806, // Syloti Nagri Sign Hasanta
			0x0a80b...0x0a80b, // Syloti Nagri Sign Anusvara
			0x0a823...0x0a827, // Syloti Nagri Vowel Sign ..Syloti Nagri Vowel Sign
			0x0a880...0x0a881, // Saurashtra Sign Anusvara..Saurashtra Sign Visarga
			0x0a8b4...0x0a8c4, // Saurashtra Consonant Sig..Saurashtra Sign Virama
			0x0a8e0...0x0a8f1, // Combining Devanagari Dig..Combining Devanagari Sig
			0x0a926...0x0a92d, // Kayah Li Vowel Ue       ..Kayah Li Tone Calya Plop
			0x0a947...0x0a953, // Rejang Vowel Sign I     ..Rejang Virama
			0x0a980...0x0a983, // Javanese Sign Panyangga ..Javanese Sign Wignyan
			0x0a9b3...0x0a9c0, // Javanese Sign Cecak Telu..Javanese Pangkon
			0x0aa29...0x0aa36, // Cham Vowel Sign Aa      ..Cham Consonant Sign Wa
			0x0aa43...0x0aa43, // Cham Consonant Sign Final Ng
			0x0aa4c...0x0aa4d, // Cham Consonant Sign Fina..Cham Consonant Sign Fina
			0x0aa7b...0x0aa7b, // Myanmar Sign Pao Karen Tone
			0x0aab0...0x0aab0, // Tai Viet Mai Kang
			0x0aab2...0x0aab4, // Tai Viet Vowel I        ..Tai Viet Vowel U
			0x0aab7...0x0aab8, // Tai Viet Mai Khit       ..Tai Viet Vowel Ia
			0x0aabe...0x0aabf, // Tai Viet Vowel Am       ..Tai Viet Tone Mai Ek
			0x0aac1...0x0aac1, // Tai Viet Tone Mai Tho
			0x0aaeb...0x0aaef, // Meetei Mayek Vowel Sign ..Meetei Mayek Vowel Sign
			0x0aaf5...0x0aaf6, // Meetei Mayek Vowel Sign ..Meetei Mayek Virama
			0x0abe3...0x0abea, // Meetei Mayek Vowel Sign ..Meetei Mayek Vowel Sign
			0x0abec...0x0abed, // Meetei Mayek Lum Iyek   ..Meetei Mayek Apun Iyek
			0x0d7b0...0x0d7ff, // Hangul Jungseong O-yeo  ..(nil)
			0x0fb1e...0x0fb1e, // Hebrew Point Judeo-spanish Varika
			0x0fe00...0x0fe0f, // Variation Selector-1    ..Variation Selector-16
			0x0fe20...0x0fe26, // Combining Ligature Left ..Combining Conjoining Mac
			0x0feff...0x0feff, // Zero Width No-break Space
			0x0fff9...0x0fffb, // Interlinear Annotation A..Interlinear Annotation T
			0x101fd...0x101fd, // Phaistos Disc Sign Combining Oblique Stroke
			0x10a01...0x10a03, // Kharoshthi Vowel Sign I ..Kharoshthi Vowel Sign Vo
			0x10a05...0x10a06, // Kharoshthi Vowel Sign E ..Kharoshthi Vowel Sign O
			0x10a0c...0x10a0f, // Kharoshthi Vowel Length ..Kharoshthi Sign Visarga
			0x10a38...0x10a3a, // Kharoshthi Sign Bar Abov..Kharoshthi Sign Dot Belo
			0x10a3f...0x10a3f, // Kharoshthi Virama
			0x11000...0x11002, // Brahmi Sign Candrabindu ..Brahmi Sign Visarga
			0x11038...0x11046, // Brahmi Vowel Sign Aa    ..Brahmi Virama
			0x11080...0x11082, // Kaithi Sign Candrabindu ..Kaithi Sign Visarga
			0x110b0...0x110ba, // Kaithi Vowel Sign Aa    ..Kaithi Sign Nukta
			0x110bd...0x110bd, // Kaithi Number Sign
			0x11100...0x11102, // Chakma Sign Candrabindu ..Chakma Sign Visarga
			0x11127...0x11134, // Chakma Vowel Sign A     ..Chakma Maayyaa
			0x11180...0x11182, // Sharada Sign Candrabindu..Sharada Sign Visarga
			0x111b3...0x111c0, // Sharada Vowel Sign Aa   ..Sharada Sign Virama
			0x116ab...0x116b7, // Takri Sign Anusvara     ..Takri Sign Nukta
			0x16f51...0x16f7e, // Miao Sign Aspiration    ..Miao Vowel Sign Ng
			0x16f8f...0x16f92, // Miao Tone Right         ..Miao Tone Below
			0x1d165...0x1d169, // Musical Symbol Combining..Musical Symbol Combining
			0x1d16d...0x1d182, // Musical Symbol Combining..Musical Symbol Combining
			0x1d185...0x1d18b, // Musical Symbol Combining..Musical Symbol Combining
			0x1d1aa...0x1d1ad, // Musical Symbol Combining..Musical Symbol Combining
			0x1d242...0x1d244, // Combining Greek Musical ..Combining Greek Musical
			0xe0001...0xe0001, // Language Tag
			0xe0020...0xe007f, // Tag Space               ..Cancel Tag
			0xe0100...0xe01ef, // Variation Selector-17   ..Variation Selector-256
			=> true,
			else => false,
		},
		.@"6.3.0" => switch (codepoint) {
			// Source: DerivedGeneralCategory-6.3.0.txt
			// Date: 2013-07-05, 14:08:45 GMT [MD]
			0x00000...0x00000, // (nil)
			0x000ad...0x000ad, // Soft Hyphen
			0x00300...0x0036f, // Combining Grave Accent  ..Combining Latin Small Le
			0x00483...0x00489, // Combining Cyrillic Titlo..Combining Cyrillic Milli
			0x00591...0x005bd, // Hebrew Accent Etnahta   ..Hebrew Point Meteg
			0x005bf...0x005bf, // Hebrew Point Rafe
			0x005c1...0x005c2, // Hebrew Point Shin Dot   ..Hebrew Point Sin Dot
			0x005c4...0x005c5, // Hebrew Mark Upper Dot   ..Hebrew Mark Lower Dot
			0x005c7...0x005c7, // Hebrew Point Qamats Qatan
			0x00600...0x00604, // Arabic Number Sign      ..Arabic Sign Samvat
			0x00610...0x0061a, // Arabic Sign Sallallahou ..Arabic Small Kasra
			0x0061c...0x0061c, // Arabic Letter Mark
			0x0064b...0x0065f, // Arabic Fathatan         ..Arabic Wavy Hamza Below
			0x00670...0x00670, // Arabic Letter Superscript Alef
			0x006d6...0x006dd, // Arabic Small High Ligatu..Arabic End Of Ayah
			0x006df...0x006e4, // Arabic Small High Rounde..Arabic Small High Madda
			0x006e7...0x006e8, // Arabic Small High Yeh   ..Arabic Small High Noon
			0x006ea...0x006ed, // Arabic Empty Centre Low ..Arabic Small Low Meem
			0x0070f...0x0070f, // Syriac Abbreviation Mark
			0x00711...0x00711, // Syriac Letter Superscript Alaph
			0x00730...0x0074a, // Syriac Pthaha Above     ..Syriac Barrekh
			0x007a6...0x007b0, // Thaana Abafili          ..Thaana Sukun
			0x007eb...0x007f3, // Nko Combining Short High..Nko Combining Double Dot
			0x00816...0x00819, // Samaritan Mark In       ..Samaritan Mark Dagesh
			0x0081b...0x00823, // Samaritan Mark Epentheti..Samaritan Vowel Sign A
			0x00825...0x00827, // Samaritan Vowel Sign Sho..Samaritan Vowel Sign U
			0x00829...0x0082d, // Samaritan Vowel Sign Lon..Samaritan Mark Nequdaa
			0x00859...0x0085b, // Mandaic Affrication Mark..Mandaic Gemination Mark
			0x008e4...0x008fe, // Arabic Curly Fatha      ..Arabic Damma With Dot
			0x00900...0x00903, // Devanagari Sign Inverted..Devanagari Sign Visarga
			0x0093a...0x0093c, // Devanagari Vowel Sign Oe..Devanagari Sign Nukta
			0x0093e...0x0094f, // Devanagari Vowel Sign Aa..Devanagari Vowel Sign Aw
			0x00951...0x00957, // Devanagari Stress Sign U..Devanagari Vowel Sign Uu
			0x00962...0x00963, // Devanagari Vowel Sign Vo..Devanagari Vowel Sign Vo
			0x00981...0x00983, // Bengali Sign Candrabindu..Bengali Sign Visarga
			0x009bc...0x009bc, // Bengali Sign Nukta
			0x009be...0x009c4, // Bengali Vowel Sign Aa   ..Bengali Vowel Sign Vocal
			0x009c7...0x009c8, // Bengali Vowel Sign E    ..Bengali Vowel Sign Ai
			0x009cb...0x009cd, // Bengali Vowel Sign O    ..Bengali Sign Virama
			0x009d7...0x009d7, // Bengali Au Length Mark
			0x009e2...0x009e3, // Bengali Vowel Sign Vocal..Bengali Vowel Sign Vocal
			0x00a01...0x00a03, // Gurmukhi Sign Adak Bindi..Gurmukhi Sign Visarga
			0x00a3c...0x00a3c, // Gurmukhi Sign Nukta
			0x00a3e...0x00a42, // Gurmukhi Vowel Sign Aa  ..Gurmukhi Vowel Sign Uu
			0x00a47...0x00a48, // Gurmukhi Vowel Sign Ee  ..Gurmukhi Vowel Sign Ai
			0x00a4b...0x00a4d, // Gurmukhi Vowel Sign Oo  ..Gurmukhi Sign Virama
			0x00a51...0x00a51, // Gurmukhi Sign Udaat
			0x00a70...0x00a71, // Gurmukhi Tippi          ..Gurmukhi Addak
			0x00a75...0x00a75, // Gurmukhi Sign Yakash
			0x00a81...0x00a83, // Gujarati Sign Candrabind..Gujarati Sign Visarga
			0x00abc...0x00abc, // Gujarati Sign Nukta
			0x00abe...0x00ac5, // Gujarati Vowel Sign Aa  ..Gujarati Vowel Sign Cand
			0x00ac7...0x00ac9, // Gujarati Vowel Sign E   ..Gujarati Vowel Sign Cand
			0x00acb...0x00acd, // Gujarati Vowel Sign O   ..Gujarati Sign Virama
			0x00ae2...0x00ae3, // Gujarati Vowel Sign Voca..Gujarati Vowel Sign Voca
			0x00b01...0x00b03, // Oriya Sign Candrabindu  ..Oriya Sign Visarga
			0x00b3c...0x00b3c, // Oriya Sign Nukta
			0x00b3e...0x00b44, // Oriya Vowel Sign Aa     ..Oriya Vowel Sign Vocalic
			0x00b47...0x00b48, // Oriya Vowel Sign E      ..Oriya Vowel Sign Ai
			0x00b4b...0x00b4d, // Oriya Vowel Sign O      ..Oriya Sign Virama
			0x00b56...0x00b57, // Oriya Ai Length Mark    ..Oriya Au Length Mark
			0x00b62...0x00b63, // Oriya Vowel Sign Vocalic..Oriya Vowel Sign Vocalic
			0x00b82...0x00b82, // Tamil Sign Anusvara
			0x00bbe...0x00bc2, // Tamil Vowel Sign Aa     ..Tamil Vowel Sign Uu
			0x00bc6...0x00bc8, // Tamil Vowel Sign E      ..Tamil Vowel Sign Ai
			0x00bca...0x00bcd, // Tamil Vowel Sign O      ..Tamil Sign Virama
			0x00bd7...0x00bd7, // Tamil Au Length Mark
			0x00c01...0x00c03, // Telugu Sign Candrabindu ..Telugu Sign Visarga
			0x00c3e...0x00c44, // Telugu Vowel Sign Aa    ..Telugu Vowel Sign Vocali
			0x00c46...0x00c48, // Telugu Vowel Sign E     ..Telugu Vowel Sign Ai
			0x00c4a...0x00c4d, // Telugu Vowel Sign O     ..Telugu Sign Virama
			0x00c55...0x00c56, // Telugu Length Mark      ..Telugu Ai Length Mark
			0x00c62...0x00c63, // Telugu Vowel Sign Vocali..Telugu Vowel Sign Vocali
			0x00c82...0x00c83, // Kannada Sign Anusvara   ..Kannada Sign Visarga
			0x00cbc...0x00cbc, // Kannada Sign Nukta
			0x00cbe...0x00cc4, // Kannada Vowel Sign Aa   ..Kannada Vowel Sign Vocal
			0x00cc6...0x00cc8, // Kannada Vowel Sign E    ..Kannada Vowel Sign Ai
			0x00cca...0x00ccd, // Kannada Vowel Sign O    ..Kannada Sign Virama
			0x00cd5...0x00cd6, // Kannada Length Mark     ..Kannada Ai Length Mark
			0x00ce2...0x00ce3, // Kannada Vowel Sign Vocal..Kannada Vowel Sign Vocal
			0x00d02...0x00d03, // Malayalam Sign Anusvara ..Malayalam Sign Visarga
			0x00d3e...0x00d44, // Malayalam Vowel Sign Aa ..Malayalam Vowel Sign Voc
			0x00d46...0x00d48, // Malayalam Vowel Sign E  ..Malayalam Vowel Sign Ai
			0x00d4a...0x00d4d, // Malayalam Vowel Sign O  ..Malayalam Sign Virama
			0x00d57...0x00d57, // Malayalam Au Length Mark
			0x00d62...0x00d63, // Malayalam Vowel Sign Voc..Malayalam Vowel Sign Voc
			0x00d82...0x00d83, // Sinhala Sign Anusvaraya ..Sinhala Sign Visargaya
			0x00dca...0x00dca, // Sinhala Sign Al-lakuna
			0x00dcf...0x00dd4, // Sinhala Vowel Sign Aela-..Sinhala Vowel Sign Ketti
			0x00dd6...0x00dd6, // Sinhala Vowel Sign Diga Paa-pilla
			0x00dd8...0x00ddf, // Sinhala Vowel Sign Gaett..Sinhala Vowel Sign Gayan
			0x00df2...0x00df3, // Sinhala Vowel Sign Diga ..Sinhala Vowel Sign Diga
			0x00e31...0x00e31, // Thai Character Mai Han-akat
			0x00e34...0x00e3a, // Thai Character Sara I   ..Thai Character Phinthu
			0x00e47...0x00e4e, // Thai Character Maitaikhu..Thai Character Yamakkan
			0x00eb1...0x00eb1, // Lao Vowel Sign Mai Kan
			0x00eb4...0x00eb9, // Lao Vowel Sign I        ..Lao Vowel Sign Uu
			0x00ebb...0x00ebc, // Lao Vowel Sign Mai Kon  ..Lao Semivowel Sign Lo
			0x00ec8...0x00ecd, // Lao Tone Mai Ek         ..Lao Niggahita
			0x00f18...0x00f19, // Tibetan Astrological Sig..Tibetan Astrological Sig
			0x00f35...0x00f35, // Tibetan Mark Ngas Bzung Nyi Zla
			0x00f37...0x00f37, // Tibetan Mark Ngas Bzung Sgor Rtags
			0x00f39...0x00f39, // Tibetan Mark Tsa -phru
			0x00f3e...0x00f3f, // Tibetan Sign Yar Tshes  ..Tibetan Sign Mar Tshes
			0x00f71...0x00f84, // Tibetan Vowel Sign Aa   ..Tibetan Mark Halanta
			0x00f86...0x00f87, // Tibetan Sign Lci Rtags  ..Tibetan Sign Yang Rtags
			0x00f8d...0x00f97, // Tibetan Subjoined Sign L..Tibetan Subjoined Letter
			0x00f99...0x00fbc, // Tibetan Subjoined Letter..Tibetan Subjoined Letter
			0x00fc6...0x00fc6, // Tibetan Symbol Padma Gdan
			0x0102b...0x0103e, // Myanmar Vowel Sign Tall ..Myanmar Consonant Sign M
			0x01056...0x01059, // Myanmar Vowel Sign Vocal..Myanmar Vowel Sign Vocal
			0x0105e...0x01060, // Myanmar Consonant Sign M..Myanmar Consonant Sign M
			0x01062...0x01064, // Myanmar Vowel Sign Sgaw ..Myanmar Tone Mark Sgaw K
			0x01067...0x0106d, // Myanmar Vowel Sign Weste..Myanmar Sign Western Pwo
			0x01071...0x01074, // Myanmar Vowel Sign Geba ..Myanmar Vowel Sign Kayah
			0x01082...0x0108d, // Myanmar Consonant Sign S..Myanmar Sign Shan Counci
			0x0108f...0x0108f, // Myanmar Sign Rumai Palaung Tone-5
			0x0109a...0x0109d, // Myanmar Sign Khamti Tone..Myanmar Vowel Sign Aiton
			0x01160...0x011ff, // Hangul Jungseong Filler ..Hangul Jongseong Ssangni
			0x0135d...0x0135f, // Ethiopic Combining Gemin..Ethiopic Combining Gemin
			0x01712...0x01714, // Tagalog Vowel Sign I    ..Tagalog Sign Virama
			0x01732...0x01734, // Hanunoo Vowel Sign I    ..Hanunoo Sign Pamudpod
			0x01752...0x01753, // Buhid Vowel Sign I      ..Buhid Vowel Sign U
			0x01772...0x01773, // Tagbanwa Vowel Sign I   ..Tagbanwa Vowel Sign U
			0x017b4...0x017d3, // Khmer Vowel Inherent Aq ..Khmer Sign Bathamasat
			0x017dd...0x017dd, // Khmer Sign Atthacan
			0x0180b...0x0180e, // Mongolian Free Variation..Mongolian Vowel Separato
			0x018a9...0x018a9, // Mongolian Letter Ali Gali Dagalga
			0x01920...0x0192b, // Limbu Vowel Sign A      ..Limbu Subjoined Letter W
			0x01930...0x0193b, // Limbu Small Letter Ka   ..Limbu Sign Sa-i
			0x019b0...0x019c0, // New Tai Lue Vowel Sign V..New Tai Lue Vowel Sign I
			0x019c8...0x019c9, // New Tai Lue Tone Mark-1 ..New Tai Lue Tone Mark-2
			0x01a17...0x01a1b, // Buginese Vowel Sign I   ..Buginese Vowel Sign Ae
			0x01a55...0x01a5e, // Tai Tham Consonant Sign ..Tai Tham Consonant Sign
			0x01a60...0x01a7c, // Tai Tham Sign Sakot     ..Tai Tham Sign Khuen-lue
			0x01a7f...0x01a7f, // Tai Tham Combining Cryptogrammic Dot
			0x01b00...0x01b04, // Balinese Sign Ulu Ricem ..Balinese Sign Bisah
			0x01b34...0x01b44, // Balinese Sign Rerekan   ..Balinese Adeg Adeg
			0x01b6b...0x01b73, // Balinese Musical Symbol ..Balinese Musical Symbol
			0x01b80...0x01b82, // Sundanese Sign Panyecek ..Sundanese Sign Pangwisad
			0x01ba1...0x01bad, // Sundanese Consonant Sign..Sundanese Consonant Sign
			0x01be6...0x01bf3, // Batak Sign Tompi        ..Batak Panongonan
			0x01c24...0x01c37, // Lepcha Subjoined Letter ..Lepcha Sign Nukta
			0x01cd0...0x01cd2, // Vedic Tone Karshana     ..Vedic Tone Prenkha
			0x01cd4...0x01ce8, // Vedic Sign Yajurvedic Mi..Vedic Sign Visarga Anuda
			0x01ced...0x01ced, // Vedic Sign Tiryak
			0x01cf2...0x01cf4, // Vedic Sign Ardhavisarga ..Vedic Tone Candra Above
			0x01dc0...0x01de6, // Combining Dotted Grave A..Combining Latin Small Le
			0x01dfc...0x01dff, // Combining Double Inverte..Combining Right Arrowhea
			0x0200b...0x0200f, // Zero Width Space        ..Right-to-left Mark
			0x02028...0x0202e, // Line Separator          ..Right-to-left Override
			0x02060...0x02064, // Word Joiner             ..Invisible Plus
			0x02066...0x0206f, // Left-to-right Isolate   ..Nominal Digit Shapes
			0x020d0...0x020f0, // Combining Left Harpoon A..Combining Asterisk Above
			0x02cef...0x02cf1, // Coptic Combining Ni Abov..Coptic Combining Spiritu
			0x02d7f...0x02d7f, // Tifinagh Consonant Joiner
			0x02de0...0x02dff, // Combining Cyrillic Lette..Combining Cyrillic Lette
			0x0302a...0x0302f, // Ideographic Level Tone M..Hangul Double Dot Tone M
			0x03099...0x0309a, // Combining Katakana-hirag..Combining Katakana-hirag
			0x0a66f...0x0a672, // Combining Cyrillic Vzmet..Combining Cyrillic Thous
			0x0a674...0x0a67d, // Combining Cyrillic Lette..Combining Cyrillic Payer
			0x0a69f...0x0a69f, // Combining Cyrillic Letter Iotified E
			0x0a6f0...0x0a6f1, // Bamum Combining Mark Koq..Bamum Combining Mark Tuk
			0x0a802...0x0a802, // Syloti Nagri Sign Dvisvara
			0x0a806...0x0a806, // Syloti Nagri Sign Hasanta
			0x0a80b...0x0a80b, // Syloti Nagri Sign Anusvara
			0x0a823...0x0a827, // Syloti Nagri Vowel Sign ..Syloti Nagri Vowel Sign
			0x0a880...0x0a881, // Saurashtra Sign Anusvara..Saurashtra Sign Visarga
			0x0a8b4...0x0a8c4, // Saurashtra Consonant Sig..Saurashtra Sign Virama
			0x0a8e0...0x0a8f1, // Combining Devanagari Dig..Combining Devanagari Sig
			0x0a926...0x0a92d, // Kayah Li Vowel Ue       ..Kayah Li Tone Calya Plop
			0x0a947...0x0a953, // Rejang Vowel Sign I     ..Rejang Virama
			0x0a980...0x0a983, // Javanese Sign Panyangga ..Javanese Sign Wignyan
			0x0a9b3...0x0a9c0, // Javanese Sign Cecak Telu..Javanese Pangkon
			0x0aa29...0x0aa36, // Cham Vowel Sign Aa      ..Cham Consonant Sign Wa
			0x0aa43...0x0aa43, // Cham Consonant Sign Final Ng
			0x0aa4c...0x0aa4d, // Cham Consonant Sign Fina..Cham Consonant Sign Fina
			0x0aa7b...0x0aa7b, // Myanmar Sign Pao Karen Tone
			0x0aab0...0x0aab0, // Tai Viet Mai Kang
			0x0aab2...0x0aab4, // Tai Viet Vowel I        ..Tai Viet Vowel U
			0x0aab7...0x0aab8, // Tai Viet Mai Khit       ..Tai Viet Vowel Ia
			0x0aabe...0x0aabf, // Tai Viet Vowel Am       ..Tai Viet Tone Mai Ek
			0x0aac1...0x0aac1, // Tai Viet Tone Mai Tho
			0x0aaeb...0x0aaef, // Meetei Mayek Vowel Sign ..Meetei Mayek Vowel Sign
			0x0aaf5...0x0aaf6, // Meetei Mayek Vowel Sign ..Meetei Mayek Virama
			0x0abe3...0x0abea, // Meetei Mayek Vowel Sign ..Meetei Mayek Vowel Sign
			0x0abec...0x0abed, // Meetei Mayek Lum Iyek   ..Meetei Mayek Apun Iyek
			0x0d7b0...0x0d7ff, // Hangul Jungseong O-yeo  ..(nil)
			0x0fb1e...0x0fb1e, // Hebrew Point Judeo-spanish Varika
			0x0fe00...0x0fe0f, // Variation Selector-1    ..Variation Selector-16
			0x0fe20...0x0fe26, // Combining Ligature Left ..Combining Conjoining Mac
			0x0feff...0x0feff, // Zero Width No-break Space
			0x0fff9...0x0fffb, // Interlinear Annotation A..Interlinear Annotation T
			0x101fd...0x101fd, // Phaistos Disc Sign Combining Oblique Stroke
			0x10a01...0x10a03, // Kharoshthi Vowel Sign I ..Kharoshthi Vowel Sign Vo
			0x10a05...0x10a06, // Kharoshthi Vowel Sign E ..Kharoshthi Vowel Sign O
			0x10a0c...0x10a0f, // Kharoshthi Vowel Length ..Kharoshthi Sign Visarga
			0x10a38...0x10a3a, // Kharoshthi Sign Bar Abov..Kharoshthi Sign Dot Belo
			0x10a3f...0x10a3f, // Kharoshthi Virama
			0x11000...0x11002, // Brahmi Sign Candrabindu ..Brahmi Sign Visarga
			0x11038...0x11046, // Brahmi Vowel Sign Aa    ..Brahmi Virama
			0x11080...0x11082, // Kaithi Sign Candrabindu ..Kaithi Sign Visarga
			0x110b0...0x110ba, // Kaithi Vowel Sign Aa    ..Kaithi Sign Nukta
			0x110bd...0x110bd, // Kaithi Number Sign
			0x11100...0x11102, // Chakma Sign Candrabindu ..Chakma Sign Visarga
			0x11127...0x11134, // Chakma Vowel Sign A     ..Chakma Maayyaa
			0x11180...0x11182, // Sharada Sign Candrabindu..Sharada Sign Visarga
			0x111b3...0x111c0, // Sharada Vowel Sign Aa   ..Sharada Sign Virama
			0x116ab...0x116b7, // Takri Sign Anusvara     ..Takri Sign Nukta
			0x16f51...0x16f7e, // Miao Sign Aspiration    ..Miao Vowel Sign Ng
			0x16f8f...0x16f92, // Miao Tone Right         ..Miao Tone Below
			0x1d165...0x1d169, // Musical Symbol Combining..Musical Symbol Combining
			0x1d16d...0x1d182, // Musical Symbol Combining..Musical Symbol Combining
			0x1d185...0x1d18b, // Musical Symbol Combining..Musical Symbol Combining
			0x1d1aa...0x1d1ad, // Musical Symbol Combining..Musical Symbol Combining
			0x1d242...0x1d244, // Combining Greek Musical ..Combining Greek Musical
			0xe0001...0xe0001, // Language Tag
			0xe0020...0xe007f, // Tag Space               ..Cancel Tag
			0xe0100...0xe01ef, // Variation Selector-17   ..Variation Selector-256
			=> true,
			else => false,
		},
		.@"7.0.0" => switch (codepoint) {
			// Source: DerivedGeneralCategory-7.0.0.txt
			// Date: 2014-02-07, 18:42:12 GMT [MD]
			0x00000...0x00000, // (nil)
			0x000ad...0x000ad, // Soft Hyphen
			0x00300...0x0036f, // Combining Grave Accent  ..Combining Latin Small Le
			0x00483...0x00489, // Combining Cyrillic Titlo..Combining Cyrillic Milli
			0x00591...0x005bd, // Hebrew Accent Etnahta   ..Hebrew Point Meteg
			0x005bf...0x005bf, // Hebrew Point Rafe
			0x005c1...0x005c2, // Hebrew Point Shin Dot   ..Hebrew Point Sin Dot
			0x005c4...0x005c5, // Hebrew Mark Upper Dot   ..Hebrew Mark Lower Dot
			0x005c7...0x005c7, // Hebrew Point Qamats Qatan
			0x00600...0x00605, // Arabic Number Sign      ..Arabic Number Mark Above
			0x00610...0x0061a, // Arabic Sign Sallallahou ..Arabic Small Kasra
			0x0061c...0x0061c, // Arabic Letter Mark
			0x0064b...0x0065f, // Arabic Fathatan         ..Arabic Wavy Hamza Below
			0x00670...0x00670, // Arabic Letter Superscript Alef
			0x006d6...0x006dd, // Arabic Small High Ligatu..Arabic End Of Ayah
			0x006df...0x006e4, // Arabic Small High Rounde..Arabic Small High Madda
			0x006e7...0x006e8, // Arabic Small High Yeh   ..Arabic Small High Noon
			0x006ea...0x006ed, // Arabic Empty Centre Low ..Arabic Small Low Meem
			0x0070f...0x0070f, // Syriac Abbreviation Mark
			0x00711...0x00711, // Syriac Letter Superscript Alaph
			0x00730...0x0074a, // Syriac Pthaha Above     ..Syriac Barrekh
			0x007a6...0x007b0, // Thaana Abafili          ..Thaana Sukun
			0x007eb...0x007f3, // Nko Combining Short High..Nko Combining Double Dot
			0x00816...0x00819, // Samaritan Mark In       ..Samaritan Mark Dagesh
			0x0081b...0x00823, // Samaritan Mark Epentheti..Samaritan Vowel Sign A
			0x00825...0x00827, // Samaritan Vowel Sign Sho..Samaritan Vowel Sign U
			0x00829...0x0082d, // Samaritan Vowel Sign Lon..Samaritan Mark Nequdaa
			0x00859...0x0085b, // Mandaic Affrication Mark..Mandaic Gemination Mark
			0x008e4...0x00903, // Arabic Curly Fatha      ..Devanagari Sign Visarga
			0x0093a...0x0093c, // Devanagari Vowel Sign Oe..Devanagari Sign Nukta
			0x0093e...0x0094f, // Devanagari Vowel Sign Aa..Devanagari Vowel Sign Aw
			0x00951...0x00957, // Devanagari Stress Sign U..Devanagari Vowel Sign Uu
			0x00962...0x00963, // Devanagari Vowel Sign Vo..Devanagari Vowel Sign Vo
			0x00981...0x00983, // Bengali Sign Candrabindu..Bengali Sign Visarga
			0x009bc...0x009bc, // Bengali Sign Nukta
			0x009be...0x009c4, // Bengali Vowel Sign Aa   ..Bengali Vowel Sign Vocal
			0x009c7...0x009c8, // Bengali Vowel Sign E    ..Bengali Vowel Sign Ai
			0x009cb...0x009cd, // Bengali Vowel Sign O    ..Bengali Sign Virama
			0x009d7...0x009d7, // Bengali Au Length Mark
			0x009e2...0x009e3, // Bengali Vowel Sign Vocal..Bengali Vowel Sign Vocal
			0x00a01...0x00a03, // Gurmukhi Sign Adak Bindi..Gurmukhi Sign Visarga
			0x00a3c...0x00a3c, // Gurmukhi Sign Nukta
			0x00a3e...0x00a42, // Gurmukhi Vowel Sign Aa  ..Gurmukhi Vowel Sign Uu
			0x00a47...0x00a48, // Gurmukhi Vowel Sign Ee  ..Gurmukhi Vowel Sign Ai
			0x00a4b...0x00a4d, // Gurmukhi Vowel Sign Oo  ..Gurmukhi Sign Virama
			0x00a51...0x00a51, // Gurmukhi Sign Udaat
			0x00a70...0x00a71, // Gurmukhi Tippi          ..Gurmukhi Addak
			0x00a75...0x00a75, // Gurmukhi Sign Yakash
			0x00a81...0x00a83, // Gujarati Sign Candrabind..Gujarati Sign Visarga
			0x00abc...0x00abc, // Gujarati Sign Nukta
			0x00abe...0x00ac5, // Gujarati Vowel Sign Aa  ..Gujarati Vowel Sign Cand
			0x00ac7...0x00ac9, // Gujarati Vowel Sign E   ..Gujarati Vowel Sign Cand
			0x00acb...0x00acd, // Gujarati Vowel Sign O   ..Gujarati Sign Virama
			0x00ae2...0x00ae3, // Gujarati Vowel Sign Voca..Gujarati Vowel Sign Voca
			0x00b01...0x00b03, // Oriya Sign Candrabindu  ..Oriya Sign Visarga
			0x00b3c...0x00b3c, // Oriya Sign Nukta
			0x00b3e...0x00b44, // Oriya Vowel Sign Aa     ..Oriya Vowel Sign Vocalic
			0x00b47...0x00b48, // Oriya Vowel Sign E      ..Oriya Vowel Sign Ai
			0x00b4b...0x00b4d, // Oriya Vowel Sign O      ..Oriya Sign Virama
			0x00b56...0x00b57, // Oriya Ai Length Mark    ..Oriya Au Length Mark
			0x00b62...0x00b63, // Oriya Vowel Sign Vocalic..Oriya Vowel Sign Vocalic
			0x00b82...0x00b82, // Tamil Sign Anusvara
			0x00bbe...0x00bc2, // Tamil Vowel Sign Aa     ..Tamil Vowel Sign Uu
			0x00bc6...0x00bc8, // Tamil Vowel Sign E      ..Tamil Vowel Sign Ai
			0x00bca...0x00bcd, // Tamil Vowel Sign O      ..Tamil Sign Virama
			0x00bd7...0x00bd7, // Tamil Au Length Mark
			0x00c00...0x00c03, // Telugu Sign Combining Ca..Telugu Sign Visarga
			0x00c3e...0x00c44, // Telugu Vowel Sign Aa    ..Telugu Vowel Sign Vocali
			0x00c46...0x00c48, // Telugu Vowel Sign E     ..Telugu Vowel Sign Ai
			0x00c4a...0x00c4d, // Telugu Vowel Sign O     ..Telugu Sign Virama
			0x00c55...0x00c56, // Telugu Length Mark      ..Telugu Ai Length Mark
			0x00c62...0x00c63, // Telugu Vowel Sign Vocali..Telugu Vowel Sign Vocali
			0x00c81...0x00c83, // Kannada Sign Candrabindu..Kannada Sign Visarga
			0x00cbc...0x00cbc, // Kannada Sign Nukta
			0x00cbe...0x00cc4, // Kannada Vowel Sign Aa   ..Kannada Vowel Sign Vocal
			0x00cc6...0x00cc8, // Kannada Vowel Sign E    ..Kannada Vowel Sign Ai
			0x00cca...0x00ccd, // Kannada Vowel Sign O    ..Kannada Sign Virama
			0x00cd5...0x00cd6, // Kannada Length Mark     ..Kannada Ai Length Mark
			0x00ce2...0x00ce3, // Kannada Vowel Sign Vocal..Kannada Vowel Sign Vocal
			0x00d01...0x00d03, // Malayalam Sign Candrabin..Malayalam Sign Visarga
			0x00d3e...0x00d44, // Malayalam Vowel Sign Aa ..Malayalam Vowel Sign Voc
			0x00d46...0x00d48, // Malayalam Vowel Sign E  ..Malayalam Vowel Sign Ai
			0x00d4a...0x00d4d, // Malayalam Vowel Sign O  ..Malayalam Sign Virama
			0x00d57...0x00d57, // Malayalam Au Length Mark
			0x00d62...0x00d63, // Malayalam Vowel Sign Voc..Malayalam Vowel Sign Voc
			0x00d82...0x00d83, // Sinhala Sign Anusvaraya ..Sinhala Sign Visargaya
			0x00dca...0x00dca, // Sinhala Sign Al-lakuna
			0x00dcf...0x00dd4, // Sinhala Vowel Sign Aela-..Sinhala Vowel Sign Ketti
			0x00dd6...0x00dd6, // Sinhala Vowel Sign Diga Paa-pilla
			0x00dd8...0x00ddf, // Sinhala Vowel Sign Gaett..Sinhala Vowel Sign Gayan
			0x00df2...0x00df3, // Sinhala Vowel Sign Diga ..Sinhala Vowel Sign Diga
			0x00e31...0x00e31, // Thai Character Mai Han-akat
			0x00e34...0x00e3a, // Thai Character Sara I   ..Thai Character Phinthu
			0x00e47...0x00e4e, // Thai Character Maitaikhu..Thai Character Yamakkan
			0x00eb1...0x00eb1, // Lao Vowel Sign Mai Kan
			0x00eb4...0x00eb9, // Lao Vowel Sign I        ..Lao Vowel Sign Uu
			0x00ebb...0x00ebc, // Lao Vowel Sign Mai Kon  ..Lao Semivowel Sign Lo
			0x00ec8...0x00ecd, // Lao Tone Mai Ek         ..Lao Niggahita
			0x00f18...0x00f19, // Tibetan Astrological Sig..Tibetan Astrological Sig
			0x00f35...0x00f35, // Tibetan Mark Ngas Bzung Nyi Zla
			0x00f37...0x00f37, // Tibetan Mark Ngas Bzung Sgor Rtags
			0x00f39...0x00f39, // Tibetan Mark Tsa -phru
			0x00f3e...0x00f3f, // Tibetan Sign Yar Tshes  ..Tibetan Sign Mar Tshes
			0x00f71...0x00f84, // Tibetan Vowel Sign Aa   ..Tibetan Mark Halanta
			0x00f86...0x00f87, // Tibetan Sign Lci Rtags  ..Tibetan Sign Yang Rtags
			0x00f8d...0x00f97, // Tibetan Subjoined Sign L..Tibetan Subjoined Letter
			0x00f99...0x00fbc, // Tibetan Subjoined Letter..Tibetan Subjoined Letter
			0x00fc6...0x00fc6, // Tibetan Symbol Padma Gdan
			0x0102b...0x0103e, // Myanmar Vowel Sign Tall ..Myanmar Consonant Sign M
			0x01056...0x01059, // Myanmar Vowel Sign Vocal..Myanmar Vowel Sign Vocal
			0x0105e...0x01060, // Myanmar Consonant Sign M..Myanmar Consonant Sign M
			0x01062...0x01064, // Myanmar Vowel Sign Sgaw ..Myanmar Tone Mark Sgaw K
			0x01067...0x0106d, // Myanmar Vowel Sign Weste..Myanmar Sign Western Pwo
			0x01071...0x01074, // Myanmar Vowel Sign Geba ..Myanmar Vowel Sign Kayah
			0x01082...0x0108d, // Myanmar Consonant Sign S..Myanmar Sign Shan Counci
			0x0108f...0x0108f, // Myanmar Sign Rumai Palaung Tone-5
			0x0109a...0x0109d, // Myanmar Sign Khamti Tone..Myanmar Vowel Sign Aiton
			0x01160...0x011ff, // Hangul Jungseong Filler ..Hangul Jongseong Ssangni
			0x0135d...0x0135f, // Ethiopic Combining Gemin..Ethiopic Combining Gemin
			0x01712...0x01714, // Tagalog Vowel Sign I    ..Tagalog Sign Virama
			0x01732...0x01734, // Hanunoo Vowel Sign I    ..Hanunoo Sign Pamudpod
			0x01752...0x01753, // Buhid Vowel Sign I      ..Buhid Vowel Sign U
			0x01772...0x01773, // Tagbanwa Vowel Sign I   ..Tagbanwa Vowel Sign U
			0x017b4...0x017d3, // Khmer Vowel Inherent Aq ..Khmer Sign Bathamasat
			0x017dd...0x017dd, // Khmer Sign Atthacan
			0x0180b...0x0180e, // Mongolian Free Variation..Mongolian Vowel Separato
			0x018a9...0x018a9, // Mongolian Letter Ali Gali Dagalga
			0x01920...0x0192b, // Limbu Vowel Sign A      ..Limbu Subjoined Letter W
			0x01930...0x0193b, // Limbu Small Letter Ka   ..Limbu Sign Sa-i
			0x019b0...0x019c0, // New Tai Lue Vowel Sign V..New Tai Lue Vowel Sign I
			0x019c8...0x019c9, // New Tai Lue Tone Mark-1 ..New Tai Lue Tone Mark-2
			0x01a17...0x01a1b, // Buginese Vowel Sign I   ..Buginese Vowel Sign Ae
			0x01a55...0x01a5e, // Tai Tham Consonant Sign ..Tai Tham Consonant Sign
			0x01a60...0x01a7c, // Tai Tham Sign Sakot     ..Tai Tham Sign Khuen-lue
			0x01a7f...0x01a7f, // Tai Tham Combining Cryptogrammic Dot
			0x01ab0...0x01abe, // Combining Doubled Circum..Combining Parentheses Ov
			0x01b00...0x01b04, // Balinese Sign Ulu Ricem ..Balinese Sign Bisah
			0x01b34...0x01b44, // Balinese Sign Rerekan   ..Balinese Adeg Adeg
			0x01b6b...0x01b73, // Balinese Musical Symbol ..Balinese Musical Symbol
			0x01b80...0x01b82, // Sundanese Sign Panyecek ..Sundanese Sign Pangwisad
			0x01ba1...0x01bad, // Sundanese Consonant Sign..Sundanese Consonant Sign
			0x01be6...0x01bf3, // Batak Sign Tompi        ..Batak Panongonan
			0x01c24...0x01c37, // Lepcha Subjoined Letter ..Lepcha Sign Nukta
			0x01cd0...0x01cd2, // Vedic Tone Karshana     ..Vedic Tone Prenkha
			0x01cd4...0x01ce8, // Vedic Sign Yajurvedic Mi..Vedic Sign Visarga Anuda
			0x01ced...0x01ced, // Vedic Sign Tiryak
			0x01cf2...0x01cf4, // Vedic Sign Ardhavisarga ..Vedic Tone Candra Above
			0x01cf8...0x01cf9, // Vedic Tone Ring Above   ..Vedic Tone Double Ring A
			0x01dc0...0x01df5, // Combining Dotted Grave A..Combining Up Tack Above
			0x01dfc...0x01dff, // Combining Double Inverte..Combining Right Arrowhea
			0x0200b...0x0200f, // Zero Width Space        ..Right-to-left Mark
			0x02028...0x0202e, // Line Separator          ..Right-to-left Override
			0x02060...0x02064, // Word Joiner             ..Invisible Plus
			0x02066...0x0206f, // Left-to-right Isolate   ..Nominal Digit Shapes
			0x020d0...0x020f0, // Combining Left Harpoon A..Combining Asterisk Above
			0x02cef...0x02cf1, // Coptic Combining Ni Abov..Coptic Combining Spiritu
			0x02d7f...0x02d7f, // Tifinagh Consonant Joiner
			0x02de0...0x02dff, // Combining Cyrillic Lette..Combining Cyrillic Lette
			0x0302a...0x0302f, // Ideographic Level Tone M..Hangul Double Dot Tone M
			0x03099...0x0309a, // Combining Katakana-hirag..Combining Katakana-hirag
			0x0a66f...0x0a672, // Combining Cyrillic Vzmet..Combining Cyrillic Thous
			0x0a674...0x0a67d, // Combining Cyrillic Lette..Combining Cyrillic Payer
			0x0a69f...0x0a69f, // Combining Cyrillic Letter Iotified E
			0x0a6f0...0x0a6f1, // Bamum Combining Mark Koq..Bamum Combining Mark Tuk
			0x0a802...0x0a802, // Syloti Nagri Sign Dvisvara
			0x0a806...0x0a806, // Syloti Nagri Sign Hasanta
			0x0a80b...0x0a80b, // Syloti Nagri Sign Anusvara
			0x0a823...0x0a827, // Syloti Nagri Vowel Sign ..Syloti Nagri Vowel Sign
			0x0a880...0x0a881, // Saurashtra Sign Anusvara..Saurashtra Sign Visarga
			0x0a8b4...0x0a8c4, // Saurashtra Consonant Sig..Saurashtra Sign Virama
			0x0a8e0...0x0a8f1, // Combining Devanagari Dig..Combining Devanagari Sig
			0x0a926...0x0a92d, // Kayah Li Vowel Ue       ..Kayah Li Tone Calya Plop
			0x0a947...0x0a953, // Rejang Vowel Sign I     ..Rejang Virama
			0x0a980...0x0a983, // Javanese Sign Panyangga ..Javanese Sign Wignyan
			0x0a9b3...0x0a9c0, // Javanese Sign Cecak Telu..Javanese Pangkon
			0x0a9e5...0x0a9e5, // Myanmar Sign Shan Saw
			0x0aa29...0x0aa36, // Cham Vowel Sign Aa      ..Cham Consonant Sign Wa
			0x0aa43...0x0aa43, // Cham Consonant Sign Final Ng
			0x0aa4c...0x0aa4d, // Cham Consonant Sign Fina..Cham Consonant Sign Fina
			0x0aa7b...0x0aa7d, // Myanmar Sign Pao Karen T..Myanmar Sign Tai Laing T
			0x0aab0...0x0aab0, // Tai Viet Mai Kang
			0x0aab2...0x0aab4, // Tai Viet Vowel I        ..Tai Viet Vowel U
			0x0aab7...0x0aab8, // Tai Viet Mai Khit       ..Tai Viet Vowel Ia
			0x0aabe...0x0aabf, // Tai Viet Vowel Am       ..Tai Viet Tone Mai Ek
			0x0aac1...0x0aac1, // Tai Viet Tone Mai Tho
			0x0aaeb...0x0aaef, // Meetei Mayek Vowel Sign ..Meetei Mayek Vowel Sign
			0x0aaf5...0x0aaf6, // Meetei Mayek Vowel Sign ..Meetei Mayek Virama
			0x0abe3...0x0abea, // Meetei Mayek Vowel Sign ..Meetei Mayek Vowel Sign
			0x0abec...0x0abed, // Meetei Mayek Lum Iyek   ..Meetei Mayek Apun Iyek
			0x0d7b0...0x0d7ff, // Hangul Jungseong O-yeo  ..(nil)
			0x0fb1e...0x0fb1e, // Hebrew Point Judeo-spanish Varika
			0x0fe00...0x0fe0f, // Variation Selector-1    ..Variation Selector-16
			0x0fe20...0x0fe2d, // Combining Ligature Left ..Combining Conjoining Mac
			0x0feff...0x0feff, // Zero Width No-break Space
			0x0fff9...0x0fffb, // Interlinear Annotation A..Interlinear Annotation T
			0x101fd...0x101fd, // Phaistos Disc Sign Combining Oblique Stroke
			0x102e0...0x102e0, // Coptic Epact Thousands Mark
			0x10376...0x1037a, // Combining Old Permic Let..Combining Old Permic Let
			0x10a01...0x10a03, // Kharoshthi Vowel Sign I ..Kharoshthi Vowel Sign Vo
			0x10a05...0x10a06, // Kharoshthi Vowel Sign E ..Kharoshthi Vowel Sign O
			0x10a0c...0x10a0f, // Kharoshthi Vowel Length ..Kharoshthi Sign Visarga
			0x10a38...0x10a3a, // Kharoshthi Sign Bar Abov..Kharoshthi Sign Dot Belo
			0x10a3f...0x10a3f, // Kharoshthi Virama
			0x10ae5...0x10ae6, // Manichaean Abbreviation ..Manichaean Abbreviation
			0x11000...0x11002, // Brahmi Sign Candrabindu ..Brahmi Sign Visarga
			0x11038...0x11046, // Brahmi Vowel Sign Aa    ..Brahmi Virama
			0x1107f...0x11082, // Brahmi Number Joiner    ..Kaithi Sign Visarga
			0x110b0...0x110ba, // Kaithi Vowel Sign Aa    ..Kaithi Sign Nukta
			0x110bd...0x110bd, // Kaithi Number Sign
			0x11100...0x11102, // Chakma Sign Candrabindu ..Chakma Sign Visarga
			0x11127...0x11134, // Chakma Vowel Sign A     ..Chakma Maayyaa
			0x11173...0x11173, // Mahajani Sign Nukta
			0x11180...0x11182, // Sharada Sign Candrabindu..Sharada Sign Visarga
			0x111b3...0x111c0, // Sharada Vowel Sign Aa   ..Sharada Sign Virama
			0x1122c...0x11237, // Khojki Vowel Sign Aa    ..Khojki Sign Shadda
			0x112df...0x112ea, // Khudawadi Sign Anusvara ..Khudawadi Sign Virama
			0x11301...0x11303, // Grantha Sign Candrabindu..Grantha Sign Visarga
			0x1133c...0x1133c, // Grantha Sign Nukta
			0x1133e...0x11344, // Grantha Vowel Sign Aa   ..Grantha Vowel Sign Vocal
			0x11347...0x11348, // Grantha Vowel Sign Ee   ..Grantha Vowel Sign Ai
			0x1134b...0x1134d, // Grantha Vowel Sign Oo   ..Grantha Sign Virama
			0x11357...0x11357, // Grantha Au Length Mark
			0x11362...0x11363, // Grantha Vowel Sign Vocal..Grantha Vowel Sign Vocal
			0x11366...0x1136c, // Combining Grantha Digit ..Combining Grantha Digit
			0x11370...0x11374, // Combining Grantha Letter..Combining Grantha Letter
			0x114b0...0x114c3, // Tirhuta Vowel Sign Aa   ..Tirhuta Sign Nukta
			0x115af...0x115b5, // Siddham Vowel Sign Aa   ..Siddham Vowel Sign Vocal
			0x115b8...0x115c0, // Siddham Vowel Sign E    ..Siddham Sign Nukta
			0x11630...0x11640, // Modi Vowel Sign Aa      ..Modi Sign Ardhacandra
			0x116ab...0x116b7, // Takri Sign Anusvara     ..Takri Sign Nukta
			0x16af0...0x16af4, // Bassa Vah Combining High..Bassa Vah Combining High
			0x16b30...0x16b36, // Pahawh Hmong Mark Cim Tu..Pahawh Hmong Mark Cim Ta
			0x16f51...0x16f7e, // Miao Sign Aspiration    ..Miao Vowel Sign Ng
			0x16f8f...0x16f92, // Miao Tone Right         ..Miao Tone Below
			0x1bc9d...0x1bc9e, // Duployan Thick Letter Se..Duployan Double Mark
			0x1bca0...0x1bca3, // Shorthand Format Letter ..Shorthand Format Up Step
			0x1d165...0x1d169, // Musical Symbol Combining..Musical Symbol Combining
			0x1d16d...0x1d182, // Musical Symbol Combining..Musical Symbol Combining
			0x1d185...0x1d18b, // Musical Symbol Combining..Musical Symbol Combining
			0x1d1aa...0x1d1ad, // Musical Symbol Combining..Musical Symbol Combining
			0x1d242...0x1d244, // Combining Greek Musical ..Combining Greek Musical
			0x1e8d0...0x1e8d6, // Mende Kikakui Combining ..Mende Kikakui Combining
			0xe0001...0xe0001, // Language Tag
			0xe0020...0xe007f, // Tag Space               ..Cancel Tag
			0xe0100...0xe01ef, // Variation Selector-17   ..Variation Selector-256
			=> true,
			else => false,
		},
		.@"8.0.0" => switch (codepoint) {
			// Source: DerivedGeneralCategory-8.0.0.txt
			// Date: 2015-02-13, 13:47:11 GMT [MD]
			0x00000...0x00000, // (nil)
			0x000ad...0x000ad, // Soft Hyphen
			0x00300...0x0036f, // Combining Grave Accent  ..Combining Latin Small Le
			0x00483...0x00489, // Combining Cyrillic Titlo..Combining Cyrillic Milli
			0x00591...0x005bd, // Hebrew Accent Etnahta   ..Hebrew Point Meteg
			0x005bf...0x005bf, // Hebrew Point Rafe
			0x005c1...0x005c2, // Hebrew Point Shin Dot   ..Hebrew Point Sin Dot
			0x005c4...0x005c5, // Hebrew Mark Upper Dot   ..Hebrew Mark Lower Dot
			0x005c7...0x005c7, // Hebrew Point Qamats Qatan
			0x00600...0x00605, // Arabic Number Sign      ..Arabic Number Mark Above
			0x00610...0x0061a, // Arabic Sign Sallallahou ..Arabic Small Kasra
			0x0061c...0x0061c, // Arabic Letter Mark
			0x0064b...0x0065f, // Arabic Fathatan         ..Arabic Wavy Hamza Below
			0x00670...0x00670, // Arabic Letter Superscript Alef
			0x006d6...0x006dd, // Arabic Small High Ligatu..Arabic End Of Ayah
			0x006df...0x006e4, // Arabic Small High Rounde..Arabic Small High Madda
			0x006e7...0x006e8, // Arabic Small High Yeh   ..Arabic Small High Noon
			0x006ea...0x006ed, // Arabic Empty Centre Low ..Arabic Small Low Meem
			0x0070f...0x0070f, // Syriac Abbreviation Mark
			0x00711...0x00711, // Syriac Letter Superscript Alaph
			0x00730...0x0074a, // Syriac Pthaha Above     ..Syriac Barrekh
			0x007a6...0x007b0, // Thaana Abafili          ..Thaana Sukun
			0x007eb...0x007f3, // Nko Combining Short High..Nko Combining Double Dot
			0x00816...0x00819, // Samaritan Mark In       ..Samaritan Mark Dagesh
			0x0081b...0x00823, // Samaritan Mark Epentheti..Samaritan Vowel Sign A
			0x00825...0x00827, // Samaritan Vowel Sign Sho..Samaritan Vowel Sign U
			0x00829...0x0082d, // Samaritan Vowel Sign Lon..Samaritan Mark Nequdaa
			0x00859...0x0085b, // Mandaic Affrication Mark..Mandaic Gemination Mark
			0x008e3...0x00903, // Arabic Turned Damma Belo..Devanagari Sign Visarga
			0x0093a...0x0093c, // Devanagari Vowel Sign Oe..Devanagari Sign Nukta
			0x0093e...0x0094f, // Devanagari Vowel Sign Aa..Devanagari Vowel Sign Aw
			0x00951...0x00957, // Devanagari Stress Sign U..Devanagari Vowel Sign Uu
			0x00962...0x00963, // Devanagari Vowel Sign Vo..Devanagari Vowel Sign Vo
			0x00981...0x00983, // Bengali Sign Candrabindu..Bengali Sign Visarga
			0x009bc...0x009bc, // Bengali Sign Nukta
			0x009be...0x009c4, // Bengali Vowel Sign Aa   ..Bengali Vowel Sign Vocal
			0x009c7...0x009c8, // Bengali Vowel Sign E    ..Bengali Vowel Sign Ai
			0x009cb...0x009cd, // Bengali Vowel Sign O    ..Bengali Sign Virama
			0x009d7...0x009d7, // Bengali Au Length Mark
			0x009e2...0x009e3, // Bengali Vowel Sign Vocal..Bengali Vowel Sign Vocal
			0x00a01...0x00a03, // Gurmukhi Sign Adak Bindi..Gurmukhi Sign Visarga
			0x00a3c...0x00a3c, // Gurmukhi Sign Nukta
			0x00a3e...0x00a42, // Gurmukhi Vowel Sign Aa  ..Gurmukhi Vowel Sign Uu
			0x00a47...0x00a48, // Gurmukhi Vowel Sign Ee  ..Gurmukhi Vowel Sign Ai
			0x00a4b...0x00a4d, // Gurmukhi Vowel Sign Oo  ..Gurmukhi Sign Virama
			0x00a51...0x00a51, // Gurmukhi Sign Udaat
			0x00a70...0x00a71, // Gurmukhi Tippi          ..Gurmukhi Addak
			0x00a75...0x00a75, // Gurmukhi Sign Yakash
			0x00a81...0x00a83, // Gujarati Sign Candrabind..Gujarati Sign Visarga
			0x00abc...0x00abc, // Gujarati Sign Nukta
			0x00abe...0x00ac5, // Gujarati Vowel Sign Aa  ..Gujarati Vowel Sign Cand
			0x00ac7...0x00ac9, // Gujarati Vowel Sign E   ..Gujarati Vowel Sign Cand
			0x00acb...0x00acd, // Gujarati Vowel Sign O   ..Gujarati Sign Virama
			0x00ae2...0x00ae3, // Gujarati Vowel Sign Voca..Gujarati Vowel Sign Voca
			0x00b01...0x00b03, // Oriya Sign Candrabindu  ..Oriya Sign Visarga
			0x00b3c...0x00b3c, // Oriya Sign Nukta
			0x00b3e...0x00b44, // Oriya Vowel Sign Aa     ..Oriya Vowel Sign Vocalic
			0x00b47...0x00b48, // Oriya Vowel Sign E      ..Oriya Vowel Sign Ai
			0x00b4b...0x00b4d, // Oriya Vowel Sign O      ..Oriya Sign Virama
			0x00b56...0x00b57, // Oriya Ai Length Mark    ..Oriya Au Length Mark
			0x00b62...0x00b63, // Oriya Vowel Sign Vocalic..Oriya Vowel Sign Vocalic
			0x00b82...0x00b82, // Tamil Sign Anusvara
			0x00bbe...0x00bc2, // Tamil Vowel Sign Aa     ..Tamil Vowel Sign Uu
			0x00bc6...0x00bc8, // Tamil Vowel Sign E      ..Tamil Vowel Sign Ai
			0x00bca...0x00bcd, // Tamil Vowel Sign O      ..Tamil Sign Virama
			0x00bd7...0x00bd7, // Tamil Au Length Mark
			0x00c00...0x00c03, // Telugu Sign Combining Ca..Telugu Sign Visarga
			0x00c3e...0x00c44, // Telugu Vowel Sign Aa    ..Telugu Vowel Sign Vocali
			0x00c46...0x00c48, // Telugu Vowel Sign E     ..Telugu Vowel Sign Ai
			0x00c4a...0x00c4d, // Telugu Vowel Sign O     ..Telugu Sign Virama
			0x00c55...0x00c56, // Telugu Length Mark      ..Telugu Ai Length Mark
			0x00c62...0x00c63, // Telugu Vowel Sign Vocali..Telugu Vowel Sign Vocali
			0x00c81...0x00c83, // Kannada Sign Candrabindu..Kannada Sign Visarga
			0x00cbc...0x00cbc, // Kannada Sign Nukta
			0x00cbe...0x00cc4, // Kannada Vowel Sign Aa   ..Kannada Vowel Sign Vocal
			0x00cc6...0x00cc8, // Kannada Vowel Sign E    ..Kannada Vowel Sign Ai
			0x00cca...0x00ccd, // Kannada Vowel Sign O    ..Kannada Sign Virama
			0x00cd5...0x00cd6, // Kannada Length Mark     ..Kannada Ai Length Mark
			0x00ce2...0x00ce3, // Kannada Vowel Sign Vocal..Kannada Vowel Sign Vocal
			0x00d01...0x00d03, // Malayalam Sign Candrabin..Malayalam Sign Visarga
			0x00d3e...0x00d44, // Malayalam Vowel Sign Aa ..Malayalam Vowel Sign Voc
			0x00d46...0x00d48, // Malayalam Vowel Sign E  ..Malayalam Vowel Sign Ai
			0x00d4a...0x00d4d, // Malayalam Vowel Sign O  ..Malayalam Sign Virama
			0x00d57...0x00d57, // Malayalam Au Length Mark
			0x00d62...0x00d63, // Malayalam Vowel Sign Voc..Malayalam Vowel Sign Voc
			0x00d82...0x00d83, // Sinhala Sign Anusvaraya ..Sinhala Sign Visargaya
			0x00dca...0x00dca, // Sinhala Sign Al-lakuna
			0x00dcf...0x00dd4, // Sinhala Vowel Sign Aela-..Sinhala Vowel Sign Ketti
			0x00dd6...0x00dd6, // Sinhala Vowel Sign Diga Paa-pilla
			0x00dd8...0x00ddf, // Sinhala Vowel Sign Gaett..Sinhala Vowel Sign Gayan
			0x00df2...0x00df3, // Sinhala Vowel Sign Diga ..Sinhala Vowel Sign Diga
			0x00e31...0x00e31, // Thai Character Mai Han-akat
			0x00e34...0x00e3a, // Thai Character Sara I   ..Thai Character Phinthu
			0x00e47...0x00e4e, // Thai Character Maitaikhu..Thai Character Yamakkan
			0x00eb1...0x00eb1, // Lao Vowel Sign Mai Kan
			0x00eb4...0x00eb9, // Lao Vowel Sign I        ..Lao Vowel Sign Uu
			0x00ebb...0x00ebc, // Lao Vowel Sign Mai Kon  ..Lao Semivowel Sign Lo
			0x00ec8...0x00ecd, // Lao Tone Mai Ek         ..Lao Niggahita
			0x00f18...0x00f19, // Tibetan Astrological Sig..Tibetan Astrological Sig
			0x00f35...0x00f35, // Tibetan Mark Ngas Bzung Nyi Zla
			0x00f37...0x00f37, // Tibetan Mark Ngas Bzung Sgor Rtags
			0x00f39...0x00f39, // Tibetan Mark Tsa -phru
			0x00f3e...0x00f3f, // Tibetan Sign Yar Tshes  ..Tibetan Sign Mar Tshes
			0x00f71...0x00f84, // Tibetan Vowel Sign Aa   ..Tibetan Mark Halanta
			0x00f86...0x00f87, // Tibetan Sign Lci Rtags  ..Tibetan Sign Yang Rtags
			0x00f8d...0x00f97, // Tibetan Subjoined Sign L..Tibetan Subjoined Letter
			0x00f99...0x00fbc, // Tibetan Subjoined Letter..Tibetan Subjoined Letter
			0x00fc6...0x00fc6, // Tibetan Symbol Padma Gdan
			0x0102b...0x0103e, // Myanmar Vowel Sign Tall ..Myanmar Consonant Sign M
			0x01056...0x01059, // Myanmar Vowel Sign Vocal..Myanmar Vowel Sign Vocal
			0x0105e...0x01060, // Myanmar Consonant Sign M..Myanmar Consonant Sign M
			0x01062...0x01064, // Myanmar Vowel Sign Sgaw ..Myanmar Tone Mark Sgaw K
			0x01067...0x0106d, // Myanmar Vowel Sign Weste..Myanmar Sign Western Pwo
			0x01071...0x01074, // Myanmar Vowel Sign Geba ..Myanmar Vowel Sign Kayah
			0x01082...0x0108d, // Myanmar Consonant Sign S..Myanmar Sign Shan Counci
			0x0108f...0x0108f, // Myanmar Sign Rumai Palaung Tone-5
			0x0109a...0x0109d, // Myanmar Sign Khamti Tone..Myanmar Vowel Sign Aiton
			0x01160...0x011ff, // Hangul Jungseong Filler ..Hangul Jongseong Ssangni
			0x0135d...0x0135f, // Ethiopic Combining Gemin..Ethiopic Combining Gemin
			0x01712...0x01714, // Tagalog Vowel Sign I    ..Tagalog Sign Virama
			0x01732...0x01734, // Hanunoo Vowel Sign I    ..Hanunoo Sign Pamudpod
			0x01752...0x01753, // Buhid Vowel Sign I      ..Buhid Vowel Sign U
			0x01772...0x01773, // Tagbanwa Vowel Sign I   ..Tagbanwa Vowel Sign U
			0x017b4...0x017d3, // Khmer Vowel Inherent Aq ..Khmer Sign Bathamasat
			0x017dd...0x017dd, // Khmer Sign Atthacan
			0x0180b...0x0180e, // Mongolian Free Variation..Mongolian Vowel Separato
			0x018a9...0x018a9, // Mongolian Letter Ali Gali Dagalga
			0x01920...0x0192b, // Limbu Vowel Sign A      ..Limbu Subjoined Letter W
			0x01930...0x0193b, // Limbu Small Letter Ka   ..Limbu Sign Sa-i
			0x01a17...0x01a1b, // Buginese Vowel Sign I   ..Buginese Vowel Sign Ae
			0x01a55...0x01a5e, // Tai Tham Consonant Sign ..Tai Tham Consonant Sign
			0x01a60...0x01a7c, // Tai Tham Sign Sakot     ..Tai Tham Sign Khuen-lue
			0x01a7f...0x01a7f, // Tai Tham Combining Cryptogrammic Dot
			0x01ab0...0x01abe, // Combining Doubled Circum..Combining Parentheses Ov
			0x01b00...0x01b04, // Balinese Sign Ulu Ricem ..Balinese Sign Bisah
			0x01b34...0x01b44, // Balinese Sign Rerekan   ..Balinese Adeg Adeg
			0x01b6b...0x01b73, // Balinese Musical Symbol ..Balinese Musical Symbol
			0x01b80...0x01b82, // Sundanese Sign Panyecek ..Sundanese Sign Pangwisad
			0x01ba1...0x01bad, // Sundanese Consonant Sign..Sundanese Consonant Sign
			0x01be6...0x01bf3, // Batak Sign Tompi        ..Batak Panongonan
			0x01c24...0x01c37, // Lepcha Subjoined Letter ..Lepcha Sign Nukta
			0x01cd0...0x01cd2, // Vedic Tone Karshana     ..Vedic Tone Prenkha
			0x01cd4...0x01ce8, // Vedic Sign Yajurvedic Mi..Vedic Sign Visarga Anuda
			0x01ced...0x01ced, // Vedic Sign Tiryak
			0x01cf2...0x01cf4, // Vedic Sign Ardhavisarga ..Vedic Tone Candra Above
			0x01cf8...0x01cf9, // Vedic Tone Ring Above   ..Vedic Tone Double Ring A
			0x01dc0...0x01df5, // Combining Dotted Grave A..Combining Up Tack Above
			0x01dfc...0x01dff, // Combining Double Inverte..Combining Right Arrowhea
			0x0200b...0x0200f, // Zero Width Space        ..Right-to-left Mark
			0x02028...0x0202e, // Line Separator          ..Right-to-left Override
			0x02060...0x02064, // Word Joiner             ..Invisible Plus
			0x02066...0x0206f, // Left-to-right Isolate   ..Nominal Digit Shapes
			0x020d0...0x020f0, // Combining Left Harpoon A..Combining Asterisk Above
			0x02cef...0x02cf1, // Coptic Combining Ni Abov..Coptic Combining Spiritu
			0x02d7f...0x02d7f, // Tifinagh Consonant Joiner
			0x02de0...0x02dff, // Combining Cyrillic Lette..Combining Cyrillic Lette
			0x0302a...0x0302f, // Ideographic Level Tone M..Hangul Double Dot Tone M
			0x03099...0x0309a, // Combining Katakana-hirag..Combining Katakana-hirag
			0x0a66f...0x0a672, // Combining Cyrillic Vzmet..Combining Cyrillic Thous
			0x0a674...0x0a67d, // Combining Cyrillic Lette..Combining Cyrillic Payer
			0x0a69e...0x0a69f, // Combining Cyrillic Lette..Combining Cyrillic Lette
			0x0a6f0...0x0a6f1, // Bamum Combining Mark Koq..Bamum Combining Mark Tuk
			0x0a802...0x0a802, // Syloti Nagri Sign Dvisvara
			0x0a806...0x0a806, // Syloti Nagri Sign Hasanta
			0x0a80b...0x0a80b, // Syloti Nagri Sign Anusvara
			0x0a823...0x0a827, // Syloti Nagri Vowel Sign ..Syloti Nagri Vowel Sign
			0x0a880...0x0a881, // Saurashtra Sign Anusvara..Saurashtra Sign Visarga
			0x0a8b4...0x0a8c4, // Saurashtra Consonant Sig..Saurashtra Sign Virama
			0x0a8e0...0x0a8f1, // Combining Devanagari Dig..Combining Devanagari Sig
			0x0a926...0x0a92d, // Kayah Li Vowel Ue       ..Kayah Li Tone Calya Plop
			0x0a947...0x0a953, // Rejang Vowel Sign I     ..Rejang Virama
			0x0a980...0x0a983, // Javanese Sign Panyangga ..Javanese Sign Wignyan
			0x0a9b3...0x0a9c0, // Javanese Sign Cecak Telu..Javanese Pangkon
			0x0a9e5...0x0a9e5, // Myanmar Sign Shan Saw
			0x0aa29...0x0aa36, // Cham Vowel Sign Aa      ..Cham Consonant Sign Wa
			0x0aa43...0x0aa43, // Cham Consonant Sign Final Ng
			0x0aa4c...0x0aa4d, // Cham Consonant Sign Fina..Cham Consonant Sign Fina
			0x0aa7b...0x0aa7d, // Myanmar Sign Pao Karen T..Myanmar Sign Tai Laing T
			0x0aab0...0x0aab0, // Tai Viet Mai Kang
			0x0aab2...0x0aab4, // Tai Viet Vowel I        ..Tai Viet Vowel U
			0x0aab7...0x0aab8, // Tai Viet Mai Khit       ..Tai Viet Vowel Ia
			0x0aabe...0x0aabf, // Tai Viet Vowel Am       ..Tai Viet Tone Mai Ek
			0x0aac1...0x0aac1, // Tai Viet Tone Mai Tho
			0x0aaeb...0x0aaef, // Meetei Mayek Vowel Sign ..Meetei Mayek Vowel Sign
			0x0aaf5...0x0aaf6, // Meetei Mayek Vowel Sign ..Meetei Mayek Virama
			0x0abe3...0x0abea, // Meetei Mayek Vowel Sign ..Meetei Mayek Vowel Sign
			0x0abec...0x0abed, // Meetei Mayek Lum Iyek   ..Meetei Mayek Apun Iyek
			0x0d7b0...0x0d7ff, // Hangul Jungseong O-yeo  ..(nil)
			0x0fb1e...0x0fb1e, // Hebrew Point Judeo-spanish Varika
			0x0fe00...0x0fe0f, // Variation Selector-1    ..Variation Selector-16
			0x0fe20...0x0fe2f, // Combining Ligature Left ..Combining Cyrillic Titlo
			0x0feff...0x0feff, // Zero Width No-break Space
			0x0fff9...0x0fffb, // Interlinear Annotation A..Interlinear Annotation T
			0x101fd...0x101fd, // Phaistos Disc Sign Combining Oblique Stroke
			0x102e0...0x102e0, // Coptic Epact Thousands Mark
			0x10376...0x1037a, // Combining Old Permic Let..Combining Old Permic Let
			0x10a01...0x10a03, // Kharoshthi Vowel Sign I ..Kharoshthi Vowel Sign Vo
			0x10a05...0x10a06, // Kharoshthi Vowel Sign E ..Kharoshthi Vowel Sign O
			0x10a0c...0x10a0f, // Kharoshthi Vowel Length ..Kharoshthi Sign Visarga
			0x10a38...0x10a3a, // Kharoshthi Sign Bar Abov..Kharoshthi Sign Dot Belo
			0x10a3f...0x10a3f, // Kharoshthi Virama
			0x10ae5...0x10ae6, // Manichaean Abbreviation ..Manichaean Abbreviation
			0x11000...0x11002, // Brahmi Sign Candrabindu ..Brahmi Sign Visarga
			0x11038...0x11046, // Brahmi Vowel Sign Aa    ..Brahmi Virama
			0x1107f...0x11082, // Brahmi Number Joiner    ..Kaithi Sign Visarga
			0x110b0...0x110ba, // Kaithi Vowel Sign Aa    ..Kaithi Sign Nukta
			0x110bd...0x110bd, // Kaithi Number Sign
			0x11100...0x11102, // Chakma Sign Candrabindu ..Chakma Sign Visarga
			0x11127...0x11134, // Chakma Vowel Sign A     ..Chakma Maayyaa
			0x11173...0x11173, // Mahajani Sign Nukta
			0x11180...0x11182, // Sharada Sign Candrabindu..Sharada Sign Visarga
			0x111b3...0x111c0, // Sharada Vowel Sign Aa   ..Sharada Sign Virama
			0x111ca...0x111cc, // Sharada Sign Nukta      ..Sharada Extra Short Vowe
			0x1122c...0x11237, // Khojki Vowel Sign Aa    ..Khojki Sign Shadda
			0x112df...0x112ea, // Khudawadi Sign Anusvara ..Khudawadi Sign Virama
			0x11300...0x11303, // Grantha Sign Combining A..Grantha Sign Visarga
			0x1133c...0x1133c, // Grantha Sign Nukta
			0x1133e...0x11344, // Grantha Vowel Sign Aa   ..Grantha Vowel Sign Vocal
			0x11347...0x11348, // Grantha Vowel Sign Ee   ..Grantha Vowel Sign Ai
			0x1134b...0x1134d, // Grantha Vowel Sign Oo   ..Grantha Sign Virama
			0x11357...0x11357, // Grantha Au Length Mark
			0x11362...0x11363, // Grantha Vowel Sign Vocal..Grantha Vowel Sign Vocal
			0x11366...0x1136c, // Combining Grantha Digit ..Combining Grantha Digit
			0x11370...0x11374, // Combining Grantha Letter..Combining Grantha Letter
			0x114b0...0x114c3, // Tirhuta Vowel Sign Aa   ..Tirhuta Sign Nukta
			0x115af...0x115b5, // Siddham Vowel Sign Aa   ..Siddham Vowel Sign Vocal
			0x115b8...0x115c0, // Siddham Vowel Sign E    ..Siddham Sign Nukta
			0x115dc...0x115dd, // Siddham Vowel Sign Alter..Siddham Vowel Sign Alter
			0x11630...0x11640, // Modi Vowel Sign Aa      ..Modi Sign Ardhacandra
			0x116ab...0x116b7, // Takri Sign Anusvara     ..Takri Sign Nukta
			0x1171d...0x1172b, // Ahom Consonant Sign Medi..Ahom Sign Killer
			0x16af0...0x16af4, // Bassa Vah Combining High..Bassa Vah Combining High
			0x16b30...0x16b36, // Pahawh Hmong Mark Cim Tu..Pahawh Hmong Mark Cim Ta
			0x16f51...0x16f7e, // Miao Sign Aspiration    ..Miao Vowel Sign Ng
			0x16f8f...0x16f92, // Miao Tone Right         ..Miao Tone Below
			0x1bc9d...0x1bc9e, // Duployan Thick Letter Se..Duployan Double Mark
			0x1bca0...0x1bca3, // Shorthand Format Letter ..Shorthand Format Up Step
			0x1d165...0x1d169, // Musical Symbol Combining..Musical Symbol Combining
			0x1d16d...0x1d182, // Musical Symbol Combining..Musical Symbol Combining
			0x1d185...0x1d18b, // Musical Symbol Combining..Musical Symbol Combining
			0x1d1aa...0x1d1ad, // Musical Symbol Combining..Musical Symbol Combining
			0x1d242...0x1d244, // Combining Greek Musical ..Combining Greek Musical
			0x1da00...0x1da36, // Signwriting Head Rim    ..Signwriting Air Sucking
			0x1da3b...0x1da6c, // Signwriting Mouth Closed..Signwriting Excitement
			0x1da75...0x1da75, // Signwriting Upper Body Tilting From Hip Joints
			0x1da84...0x1da84, // Signwriting Location Head Neck
			0x1da9b...0x1da9f, // Signwriting Fill Modifie..Signwriting Fill Modifie
			0x1daa1...0x1daaf, // Signwriting Rotation Mod..Signwriting Rotation Mod
			0x1e8d0...0x1e8d6, // Mende Kikakui Combining ..Mende Kikakui Combining
			0x1f3fb...0x1f3ff, // Emoji Modifier Fitzpatri..Emoji Modifier Fitzpatri
			0xe0001...0xe0001, // Language Tag
			0xe0020...0xe007f, // Tag Space               ..Cancel Tag
			0xe0100...0xe01ef, // Variation Selector-17   ..Variation Selector-256
			=> true,
			else => false,
		},
		.@"9.0.0" => switch (codepoint) {
			// Source: DerivedGeneralCategory-9.0.0.txt
			// Date: 2016-06-01, 10:34:26 GMT
			0x00000...0x00000, // (nil)
			0x000ad...0x000ad, // Soft Hyphen
			0x00300...0x0036f, // Combining Grave Accent  ..Combining Latin Small Le
			0x00483...0x00489, // Combining Cyrillic Titlo..Combining Cyrillic Milli
			0x00591...0x005bd, // Hebrew Accent Etnahta   ..Hebrew Point Meteg
			0x005bf...0x005bf, // Hebrew Point Rafe
			0x005c1...0x005c2, // Hebrew Point Shin Dot   ..Hebrew Point Sin Dot
			0x005c4...0x005c5, // Hebrew Mark Upper Dot   ..Hebrew Mark Lower Dot
			0x005c7...0x005c7, // Hebrew Point Qamats Qatan
			0x00600...0x00605, // Arabic Number Sign      ..Arabic Number Mark Above
			0x00610...0x0061a, // Arabic Sign Sallallahou ..Arabic Small Kasra
			0x0061c...0x0061c, // Arabic Letter Mark
			0x0064b...0x0065f, // Arabic Fathatan         ..Arabic Wavy Hamza Below
			0x00670...0x00670, // Arabic Letter Superscript Alef
			0x006d6...0x006dd, // Arabic Small High Ligatu..Arabic End Of Ayah
			0x006df...0x006e4, // Arabic Small High Rounde..Arabic Small High Madda
			0x006e7...0x006e8, // Arabic Small High Yeh   ..Arabic Small High Noon
			0x006ea...0x006ed, // Arabic Empty Centre Low ..Arabic Small Low Meem
			0x0070f...0x0070f, // Syriac Abbreviation Mark
			0x00711...0x00711, // Syriac Letter Superscript Alaph
			0x00730...0x0074a, // Syriac Pthaha Above     ..Syriac Barrekh
			0x007a6...0x007b0, // Thaana Abafili          ..Thaana Sukun
			0x007eb...0x007f3, // Nko Combining Short High..Nko Combining Double Dot
			0x00816...0x00819, // Samaritan Mark In       ..Samaritan Mark Dagesh
			0x0081b...0x00823, // Samaritan Mark Epentheti..Samaritan Vowel Sign A
			0x00825...0x00827, // Samaritan Vowel Sign Sho..Samaritan Vowel Sign U
			0x00829...0x0082d, // Samaritan Vowel Sign Lon..Samaritan Mark Nequdaa
			0x00859...0x0085b, // Mandaic Affrication Mark..Mandaic Gemination Mark
			0x008d4...0x00903, // Arabic Small High Word A..Devanagari Sign Visarga
			0x0093a...0x0093c, // Devanagari Vowel Sign Oe..Devanagari Sign Nukta
			0x0093e...0x0094f, // Devanagari Vowel Sign Aa..Devanagari Vowel Sign Aw
			0x00951...0x00957, // Devanagari Stress Sign U..Devanagari Vowel Sign Uu
			0x00962...0x00963, // Devanagari Vowel Sign Vo..Devanagari Vowel Sign Vo
			0x00981...0x00983, // Bengali Sign Candrabindu..Bengali Sign Visarga
			0x009bc...0x009bc, // Bengali Sign Nukta
			0x009be...0x009c4, // Bengali Vowel Sign Aa   ..Bengali Vowel Sign Vocal
			0x009c7...0x009c8, // Bengali Vowel Sign E    ..Bengali Vowel Sign Ai
			0x009cb...0x009cd, // Bengali Vowel Sign O    ..Bengali Sign Virama
			0x009d7...0x009d7, // Bengali Au Length Mark
			0x009e2...0x009e3, // Bengali Vowel Sign Vocal..Bengali Vowel Sign Vocal
			0x00a01...0x00a03, // Gurmukhi Sign Adak Bindi..Gurmukhi Sign Visarga
			0x00a3c...0x00a3c, // Gurmukhi Sign Nukta
			0x00a3e...0x00a42, // Gurmukhi Vowel Sign Aa  ..Gurmukhi Vowel Sign Uu
			0x00a47...0x00a48, // Gurmukhi Vowel Sign Ee  ..Gurmukhi Vowel Sign Ai
			0x00a4b...0x00a4d, // Gurmukhi Vowel Sign Oo  ..Gurmukhi Sign Virama
			0x00a51...0x00a51, // Gurmukhi Sign Udaat
			0x00a70...0x00a71, // Gurmukhi Tippi          ..Gurmukhi Addak
			0x00a75...0x00a75, // Gurmukhi Sign Yakash
			0x00a81...0x00a83, // Gujarati Sign Candrabind..Gujarati Sign Visarga
			0x00abc...0x00abc, // Gujarati Sign Nukta
			0x00abe...0x00ac5, // Gujarati Vowel Sign Aa  ..Gujarati Vowel Sign Cand
			0x00ac7...0x00ac9, // Gujarati Vowel Sign E   ..Gujarati Vowel Sign Cand
			0x00acb...0x00acd, // Gujarati Vowel Sign O   ..Gujarati Sign Virama
			0x00ae2...0x00ae3, // Gujarati Vowel Sign Voca..Gujarati Vowel Sign Voca
			0x00b01...0x00b03, // Oriya Sign Candrabindu  ..Oriya Sign Visarga
			0x00b3c...0x00b3c, // Oriya Sign Nukta
			0x00b3e...0x00b44, // Oriya Vowel Sign Aa     ..Oriya Vowel Sign Vocalic
			0x00b47...0x00b48, // Oriya Vowel Sign E      ..Oriya Vowel Sign Ai
			0x00b4b...0x00b4d, // Oriya Vowel Sign O      ..Oriya Sign Virama
			0x00b56...0x00b57, // Oriya Ai Length Mark    ..Oriya Au Length Mark
			0x00b62...0x00b63, // Oriya Vowel Sign Vocalic..Oriya Vowel Sign Vocalic
			0x00b82...0x00b82, // Tamil Sign Anusvara
			0x00bbe...0x00bc2, // Tamil Vowel Sign Aa     ..Tamil Vowel Sign Uu
			0x00bc6...0x00bc8, // Tamil Vowel Sign E      ..Tamil Vowel Sign Ai
			0x00bca...0x00bcd, // Tamil Vowel Sign O      ..Tamil Sign Virama
			0x00bd7...0x00bd7, // Tamil Au Length Mark
			0x00c00...0x00c03, // Telugu Sign Combining Ca..Telugu Sign Visarga
			0x00c3e...0x00c44, // Telugu Vowel Sign Aa    ..Telugu Vowel Sign Vocali
			0x00c46...0x00c48, // Telugu Vowel Sign E     ..Telugu Vowel Sign Ai
			0x00c4a...0x00c4d, // Telugu Vowel Sign O     ..Telugu Sign Virama
			0x00c55...0x00c56, // Telugu Length Mark      ..Telugu Ai Length Mark
			0x00c62...0x00c63, // Telugu Vowel Sign Vocali..Telugu Vowel Sign Vocali
			0x00c81...0x00c83, // Kannada Sign Candrabindu..Kannada Sign Visarga
			0x00cbc...0x00cbc, // Kannada Sign Nukta
			0x00cbe...0x00cc4, // Kannada Vowel Sign Aa   ..Kannada Vowel Sign Vocal
			0x00cc6...0x00cc8, // Kannada Vowel Sign E    ..Kannada Vowel Sign Ai
			0x00cca...0x00ccd, // Kannada Vowel Sign O    ..Kannada Sign Virama
			0x00cd5...0x00cd6, // Kannada Length Mark     ..Kannada Ai Length Mark
			0x00ce2...0x00ce3, // Kannada Vowel Sign Vocal..Kannada Vowel Sign Vocal
			0x00d01...0x00d03, // Malayalam Sign Candrabin..Malayalam Sign Visarga
			0x00d3e...0x00d44, // Malayalam Vowel Sign Aa ..Malayalam Vowel Sign Voc
			0x00d46...0x00d48, // Malayalam Vowel Sign E  ..Malayalam Vowel Sign Ai
			0x00d4a...0x00d4d, // Malayalam Vowel Sign O  ..Malayalam Sign Virama
			0x00d57...0x00d57, // Malayalam Au Length Mark
			0x00d62...0x00d63, // Malayalam Vowel Sign Voc..Malayalam Vowel Sign Voc
			0x00d82...0x00d83, // Sinhala Sign Anusvaraya ..Sinhala Sign Visargaya
			0x00dca...0x00dca, // Sinhala Sign Al-lakuna
			0x00dcf...0x00dd4, // Sinhala Vowel Sign Aela-..Sinhala Vowel Sign Ketti
			0x00dd6...0x00dd6, // Sinhala Vowel Sign Diga Paa-pilla
			0x00dd8...0x00ddf, // Sinhala Vowel Sign Gaett..Sinhala Vowel Sign Gayan
			0x00df2...0x00df3, // Sinhala Vowel Sign Diga ..Sinhala Vowel Sign Diga
			0x00e31...0x00e31, // Thai Character Mai Han-akat
			0x00e34...0x00e3a, // Thai Character Sara I   ..Thai Character Phinthu
			0x00e47...0x00e4e, // Thai Character Maitaikhu..Thai Character Yamakkan
			0x00eb1...0x00eb1, // Lao Vowel Sign Mai Kan
			0x00eb4...0x00eb9, // Lao Vowel Sign I        ..Lao Vowel Sign Uu
			0x00ebb...0x00ebc, // Lao Vowel Sign Mai Kon  ..Lao Semivowel Sign Lo
			0x00ec8...0x00ecd, // Lao Tone Mai Ek         ..Lao Niggahita
			0x00f18...0x00f19, // Tibetan Astrological Sig..Tibetan Astrological Sig
			0x00f35...0x00f35, // Tibetan Mark Ngas Bzung Nyi Zla
			0x00f37...0x00f37, // Tibetan Mark Ngas Bzung Sgor Rtags
			0x00f39...0x00f39, // Tibetan Mark Tsa -phru
			0x00f3e...0x00f3f, // Tibetan Sign Yar Tshes  ..Tibetan Sign Mar Tshes
			0x00f71...0x00f84, // Tibetan Vowel Sign Aa   ..Tibetan Mark Halanta
			0x00f86...0x00f87, // Tibetan Sign Lci Rtags  ..Tibetan Sign Yang Rtags
			0x00f8d...0x00f97, // Tibetan Subjoined Sign L..Tibetan Subjoined Letter
			0x00f99...0x00fbc, // Tibetan Subjoined Letter..Tibetan Subjoined Letter
			0x00fc6...0x00fc6, // Tibetan Symbol Padma Gdan
			0x0102b...0x0103e, // Myanmar Vowel Sign Tall ..Myanmar Consonant Sign M
			0x01056...0x01059, // Myanmar Vowel Sign Vocal..Myanmar Vowel Sign Vocal
			0x0105e...0x01060, // Myanmar Consonant Sign M..Myanmar Consonant Sign M
			0x01062...0x01064, // Myanmar Vowel Sign Sgaw ..Myanmar Tone Mark Sgaw K
			0x01067...0x0106d, // Myanmar Vowel Sign Weste..Myanmar Sign Western Pwo
			0x01071...0x01074, // Myanmar Vowel Sign Geba ..Myanmar Vowel Sign Kayah
			0x01082...0x0108d, // Myanmar Consonant Sign S..Myanmar Sign Shan Counci
			0x0108f...0x0108f, // Myanmar Sign Rumai Palaung Tone-5
			0x0109a...0x0109d, // Myanmar Sign Khamti Tone..Myanmar Vowel Sign Aiton
			0x01160...0x011ff, // Hangul Jungseong Filler ..Hangul Jongseong Ssangni
			0x0135d...0x0135f, // Ethiopic Combining Gemin..Ethiopic Combining Gemin
			0x01712...0x01714, // Tagalog Vowel Sign I    ..Tagalog Sign Virama
			0x01732...0x01734, // Hanunoo Vowel Sign I    ..Hanunoo Sign Pamudpod
			0x01752...0x01753, // Buhid Vowel Sign I      ..Buhid Vowel Sign U
			0x01772...0x01773, // Tagbanwa Vowel Sign I   ..Tagbanwa Vowel Sign U
			0x017b4...0x017d3, // Khmer Vowel Inherent Aq ..Khmer Sign Bathamasat
			0x017dd...0x017dd, // Khmer Sign Atthacan
			0x0180b...0x0180e, // Mongolian Free Variation..Mongolian Vowel Separato
			0x01885...0x01886, // Mongolian Letter Ali Gal..Mongolian Letter Ali Gal
			0x018a9...0x018a9, // Mongolian Letter Ali Gali Dagalga
			0x01920...0x0192b, // Limbu Vowel Sign A      ..Limbu Subjoined Letter W
			0x01930...0x0193b, // Limbu Small Letter Ka   ..Limbu Sign Sa-i
			0x01a17...0x01a1b, // Buginese Vowel Sign I   ..Buginese Vowel Sign Ae
			0x01a55...0x01a5e, // Tai Tham Consonant Sign ..Tai Tham Consonant Sign
			0x01a60...0x01a7c, // Tai Tham Sign Sakot     ..Tai Tham Sign Khuen-lue
			0x01a7f...0x01a7f, // Tai Tham Combining Cryptogrammic Dot
			0x01ab0...0x01abe, // Combining Doubled Circum..Combining Parentheses Ov
			0x01b00...0x01b04, // Balinese Sign Ulu Ricem ..Balinese Sign Bisah
			0x01b34...0x01b44, // Balinese Sign Rerekan   ..Balinese Adeg Adeg
			0x01b6b...0x01b73, // Balinese Musical Symbol ..Balinese Musical Symbol
			0x01b80...0x01b82, // Sundanese Sign Panyecek ..Sundanese Sign Pangwisad
			0x01ba1...0x01bad, // Sundanese Consonant Sign..Sundanese Consonant Sign
			0x01be6...0x01bf3, // Batak Sign Tompi        ..Batak Panongonan
			0x01c24...0x01c37, // Lepcha Subjoined Letter ..Lepcha Sign Nukta
			0x01cd0...0x01cd2, // Vedic Tone Karshana     ..Vedic Tone Prenkha
			0x01cd4...0x01ce8, // Vedic Sign Yajurvedic Mi..Vedic Sign Visarga Anuda
			0x01ced...0x01ced, // Vedic Sign Tiryak
			0x01cf2...0x01cf4, // Vedic Sign Ardhavisarga ..Vedic Tone Candra Above
			0x01cf8...0x01cf9, // Vedic Tone Ring Above   ..Vedic Tone Double Ring A
			0x01dc0...0x01df5, // Combining Dotted Grave A..Combining Up Tack Above
			0x01dfb...0x01dff, // Combining Deletion Mark ..Combining Right Arrowhea
			0x0200b...0x0200f, // Zero Width Space        ..Right-to-left Mark
			0x02028...0x0202e, // Line Separator          ..Right-to-left Override
			0x02060...0x02064, // Word Joiner             ..Invisible Plus
			0x02066...0x0206f, // Left-to-right Isolate   ..Nominal Digit Shapes
			0x020d0...0x020f0, // Combining Left Harpoon A..Combining Asterisk Above
			0x02cef...0x02cf1, // Coptic Combining Ni Abov..Coptic Combining Spiritu
			0x02d7f...0x02d7f, // Tifinagh Consonant Joiner
			0x02de0...0x02dff, // Combining Cyrillic Lette..Combining Cyrillic Lette
			0x0302a...0x0302f, // Ideographic Level Tone M..Hangul Double Dot Tone M
			0x03099...0x0309a, // Combining Katakana-hirag..Combining Katakana-hirag
			0x0a66f...0x0a672, // Combining Cyrillic Vzmet..Combining Cyrillic Thous
			0x0a674...0x0a67d, // Combining Cyrillic Lette..Combining Cyrillic Payer
			0x0a69e...0x0a69f, // Combining Cyrillic Lette..Combining Cyrillic Lette
			0x0a6f0...0x0a6f1, // Bamum Combining Mark Koq..Bamum Combining Mark Tuk
			0x0a802...0x0a802, // Syloti Nagri Sign Dvisvara
			0x0a806...0x0a806, // Syloti Nagri Sign Hasanta
			0x0a80b...0x0a80b, // Syloti Nagri Sign Anusvara
			0x0a823...0x0a827, // Syloti Nagri Vowel Sign ..Syloti Nagri Vowel Sign
			0x0a880...0x0a881, // Saurashtra Sign Anusvara..Saurashtra Sign Visarga
			0x0a8b4...0x0a8c5, // Saurashtra Consonant Sig..Saurashtra Sign Candrabi
			0x0a8e0...0x0a8f1, // Combining Devanagari Dig..Combining Devanagari Sig
			0x0a926...0x0a92d, // Kayah Li Vowel Ue       ..Kayah Li Tone Calya Plop
			0x0a947...0x0a953, // Rejang Vowel Sign I     ..Rejang Virama
			0x0a980...0x0a983, // Javanese Sign Panyangga ..Javanese Sign Wignyan
			0x0a9b3...0x0a9c0, // Javanese Sign Cecak Telu..Javanese Pangkon
			0x0a9e5...0x0a9e5, // Myanmar Sign Shan Saw
			0x0aa29...0x0aa36, // Cham Vowel Sign Aa      ..Cham Consonant Sign Wa
			0x0aa43...0x0aa43, // Cham Consonant Sign Final Ng
			0x0aa4c...0x0aa4d, // Cham Consonant Sign Fina..Cham Consonant Sign Fina
			0x0aa7b...0x0aa7d, // Myanmar Sign Pao Karen T..Myanmar Sign Tai Laing T
			0x0aab0...0x0aab0, // Tai Viet Mai Kang
			0x0aab2...0x0aab4, // Tai Viet Vowel I        ..Tai Viet Vowel U
			0x0aab7...0x0aab8, // Tai Viet Mai Khit       ..Tai Viet Vowel Ia
			0x0aabe...0x0aabf, // Tai Viet Vowel Am       ..Tai Viet Tone Mai Ek
			0x0aac1...0x0aac1, // Tai Viet Tone Mai Tho
			0x0aaeb...0x0aaef, // Meetei Mayek Vowel Sign ..Meetei Mayek Vowel Sign
			0x0aaf5...0x0aaf6, // Meetei Mayek Vowel Sign ..Meetei Mayek Virama
			0x0abe3...0x0abea, // Meetei Mayek Vowel Sign ..Meetei Mayek Vowel Sign
			0x0abec...0x0abed, // Meetei Mayek Lum Iyek   ..Meetei Mayek Apun Iyek
			0x0d7b0...0x0d7ff, // Hangul Jungseong O-yeo  ..(nil)
			0x0fb1e...0x0fb1e, // Hebrew Point Judeo-spanish Varika
			0x0fe00...0x0fe0f, // Variation Selector-1    ..Variation Selector-16
			0x0fe20...0x0fe2f, // Combining Ligature Left ..Combining Cyrillic Titlo
			0x0feff...0x0feff, // Zero Width No-break Space
			0x0fff9...0x0fffb, // Interlinear Annotation A..Interlinear Annotation T
			0x101fd...0x101fd, // Phaistos Disc Sign Combining Oblique Stroke
			0x102e0...0x102e0, // Coptic Epact Thousands Mark
			0x10376...0x1037a, // Combining Old Permic Let..Combining Old Permic Let
			0x10a01...0x10a03, // Kharoshthi Vowel Sign I ..Kharoshthi Vowel Sign Vo
			0x10a05...0x10a06, // Kharoshthi Vowel Sign E ..Kharoshthi Vowel Sign O
			0x10a0c...0x10a0f, // Kharoshthi Vowel Length ..Kharoshthi Sign Visarga
			0x10a38...0x10a3a, // Kharoshthi Sign Bar Abov..Kharoshthi Sign Dot Belo
			0x10a3f...0x10a3f, // Kharoshthi Virama
			0x10ae5...0x10ae6, // Manichaean Abbreviation ..Manichaean Abbreviation
			0x11000...0x11002, // Brahmi Sign Candrabindu ..Brahmi Sign Visarga
			0x11038...0x11046, // Brahmi Vowel Sign Aa    ..Brahmi Virama
			0x1107f...0x11082, // Brahmi Number Joiner    ..Kaithi Sign Visarga
			0x110b0...0x110ba, // Kaithi Vowel Sign Aa    ..Kaithi Sign Nukta
			0x110bd...0x110bd, // Kaithi Number Sign
			0x11100...0x11102, // Chakma Sign Candrabindu ..Chakma Sign Visarga
			0x11127...0x11134, // Chakma Vowel Sign A     ..Chakma Maayyaa
			0x11173...0x11173, // Mahajani Sign Nukta
			0x11180...0x11182, // Sharada Sign Candrabindu..Sharada Sign Visarga
			0x111b3...0x111c0, // Sharada Vowel Sign Aa   ..Sharada Sign Virama
			0x111ca...0x111cc, // Sharada Sign Nukta      ..Sharada Extra Short Vowe
			0x1122c...0x11237, // Khojki Vowel Sign Aa    ..Khojki Sign Shadda
			0x1123e...0x1123e, // Khojki Sign Sukun
			0x112df...0x112ea, // Khudawadi Sign Anusvara ..Khudawadi Sign Virama
			0x11300...0x11303, // Grantha Sign Combining A..Grantha Sign Visarga
			0x1133c...0x1133c, // Grantha Sign Nukta
			0x1133e...0x11344, // Grantha Vowel Sign Aa   ..Grantha Vowel Sign Vocal
			0x11347...0x11348, // Grantha Vowel Sign Ee   ..Grantha Vowel Sign Ai
			0x1134b...0x1134d, // Grantha Vowel Sign Oo   ..Grantha Sign Virama
			0x11357...0x11357, // Grantha Au Length Mark
			0x11362...0x11363, // Grantha Vowel Sign Vocal..Grantha Vowel Sign Vocal
			0x11366...0x1136c, // Combining Grantha Digit ..Combining Grantha Digit
			0x11370...0x11374, // Combining Grantha Letter..Combining Grantha Letter
			0x11435...0x11446, // Newa Vowel Sign Aa      ..Newa Sign Nukta
			0x114b0...0x114c3, // Tirhuta Vowel Sign Aa   ..Tirhuta Sign Nukta
			0x115af...0x115b5, // Siddham Vowel Sign Aa   ..Siddham Vowel Sign Vocal
			0x115b8...0x115c0, // Siddham Vowel Sign E    ..Siddham Sign Nukta
			0x115dc...0x115dd, // Siddham Vowel Sign Alter..Siddham Vowel Sign Alter
			0x11630...0x11640, // Modi Vowel Sign Aa      ..Modi Sign Ardhacandra
			0x116ab...0x116b7, // Takri Sign Anusvara     ..Takri Sign Nukta
			0x1171d...0x1172b, // Ahom Consonant Sign Medi..Ahom Sign Killer
			0x11c2f...0x11c36, // Bhaiksuki Vowel Sign Aa ..Bhaiksuki Vowel Sign Voc
			0x11c38...0x11c3f, // Bhaiksuki Vowel Sign E  ..Bhaiksuki Sign Virama
			0x11c92...0x11ca7, // Marchen Subjoined Letter..Marchen Subjoined Letter
			0x11ca9...0x11cb6, // Marchen Subjoined Letter..Marchen Sign Candrabindu
			0x16af0...0x16af4, // Bassa Vah Combining High..Bassa Vah Combining High
			0x16b30...0x16b36, // Pahawh Hmong Mark Cim Tu..Pahawh Hmong Mark Cim Ta
			0x16f51...0x16f7e, // Miao Sign Aspiration    ..Miao Vowel Sign Ng
			0x16f8f...0x16f92, // Miao Tone Right         ..Miao Tone Below
			0x1bc9d...0x1bc9e, // Duployan Thick Letter Se..Duployan Double Mark
			0x1bca0...0x1bca3, // Shorthand Format Letter ..Shorthand Format Up Step
			0x1d165...0x1d169, // Musical Symbol Combining..Musical Symbol Combining
			0x1d16d...0x1d182, // Musical Symbol Combining..Musical Symbol Combining
			0x1d185...0x1d18b, // Musical Symbol Combining..Musical Symbol Combining
			0x1d1aa...0x1d1ad, // Musical Symbol Combining..Musical Symbol Combining
			0x1d242...0x1d244, // Combining Greek Musical ..Combining Greek Musical
			0x1da00...0x1da36, // Signwriting Head Rim    ..Signwriting Air Sucking
			0x1da3b...0x1da6c, // Signwriting Mouth Closed..Signwriting Excitement
			0x1da75...0x1da75, // Signwriting Upper Body Tilting From Hip Joints
			0x1da84...0x1da84, // Signwriting Location Head Neck
			0x1da9b...0x1da9f, // Signwriting Fill Modifie..Signwriting Fill Modifie
			0x1daa1...0x1daaf, // Signwriting Rotation Mod..Signwriting Rotation Mod
			0x1e000...0x1e006, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e008...0x1e018, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e01b...0x1e021, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e023...0x1e024, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e026...0x1e02a, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e8d0...0x1e8d6, // Mende Kikakui Combining ..Mende Kikakui Combining
			0x1e944...0x1e94a, // Adlam Alif Lengthener   ..Adlam Nukta
			0x1f3fb...0x1f3ff, // Emoji Modifier Fitzpatri..Emoji Modifier Fitzpatri
			0xe0001...0xe0001, // Language Tag
			0xe0020...0xe007f, // Tag Space               ..Cancel Tag
			0xe0100...0xe01ef, // Variation Selector-17   ..Variation Selector-256
			=> true,
			else => false,
		},
		.@"10.0.0" => switch (codepoint) {
			// Source: DerivedGeneralCategory-10.0.0.txt
			// Date: 2017-03-08, 08:41:49 GMT
			0x00000...0x00000, // (nil)
			0x000ad...0x000ad, // Soft Hyphen
			0x00300...0x0036f, // Combining Grave Accent  ..Combining Latin Small Le
			0x00483...0x00489, // Combining Cyrillic Titlo..Combining Cyrillic Milli
			0x00591...0x005bd, // Hebrew Accent Etnahta   ..Hebrew Point Meteg
			0x005bf...0x005bf, // Hebrew Point Rafe
			0x005c1...0x005c2, // Hebrew Point Shin Dot   ..Hebrew Point Sin Dot
			0x005c4...0x005c5, // Hebrew Mark Upper Dot   ..Hebrew Mark Lower Dot
			0x005c7...0x005c7, // Hebrew Point Qamats Qatan
			0x00600...0x00605, // Arabic Number Sign      ..Arabic Number Mark Above
			0x00610...0x0061a, // Arabic Sign Sallallahou ..Arabic Small Kasra
			0x0061c...0x0061c, // Arabic Letter Mark
			0x0064b...0x0065f, // Arabic Fathatan         ..Arabic Wavy Hamza Below
			0x00670...0x00670, // Arabic Letter Superscript Alef
			0x006d6...0x006dd, // Arabic Small High Ligatu..Arabic End Of Ayah
			0x006df...0x006e4, // Arabic Small High Rounde..Arabic Small High Madda
			0x006e7...0x006e8, // Arabic Small High Yeh   ..Arabic Small High Noon
			0x006ea...0x006ed, // Arabic Empty Centre Low ..Arabic Small Low Meem
			0x0070f...0x0070f, // Syriac Abbreviation Mark
			0x00711...0x00711, // Syriac Letter Superscript Alaph
			0x00730...0x0074a, // Syriac Pthaha Above     ..Syriac Barrekh
			0x007a6...0x007b0, // Thaana Abafili          ..Thaana Sukun
			0x007eb...0x007f3, // Nko Combining Short High..Nko Combining Double Dot
			0x00816...0x00819, // Samaritan Mark In       ..Samaritan Mark Dagesh
			0x0081b...0x00823, // Samaritan Mark Epentheti..Samaritan Vowel Sign A
			0x00825...0x00827, // Samaritan Vowel Sign Sho..Samaritan Vowel Sign U
			0x00829...0x0082d, // Samaritan Vowel Sign Lon..Samaritan Mark Nequdaa
			0x00859...0x0085b, // Mandaic Affrication Mark..Mandaic Gemination Mark
			0x008d4...0x00903, // Arabic Small High Word A..Devanagari Sign Visarga
			0x0093a...0x0093c, // Devanagari Vowel Sign Oe..Devanagari Sign Nukta
			0x0093e...0x0094f, // Devanagari Vowel Sign Aa..Devanagari Vowel Sign Aw
			0x00951...0x00957, // Devanagari Stress Sign U..Devanagari Vowel Sign Uu
			0x00962...0x00963, // Devanagari Vowel Sign Vo..Devanagari Vowel Sign Vo
			0x00981...0x00983, // Bengali Sign Candrabindu..Bengali Sign Visarga
			0x009bc...0x009bc, // Bengali Sign Nukta
			0x009be...0x009c4, // Bengali Vowel Sign Aa   ..Bengali Vowel Sign Vocal
			0x009c7...0x009c8, // Bengali Vowel Sign E    ..Bengali Vowel Sign Ai
			0x009cb...0x009cd, // Bengali Vowel Sign O    ..Bengali Sign Virama
			0x009d7...0x009d7, // Bengali Au Length Mark
			0x009e2...0x009e3, // Bengali Vowel Sign Vocal..Bengali Vowel Sign Vocal
			0x00a01...0x00a03, // Gurmukhi Sign Adak Bindi..Gurmukhi Sign Visarga
			0x00a3c...0x00a3c, // Gurmukhi Sign Nukta
			0x00a3e...0x00a42, // Gurmukhi Vowel Sign Aa  ..Gurmukhi Vowel Sign Uu
			0x00a47...0x00a48, // Gurmukhi Vowel Sign Ee  ..Gurmukhi Vowel Sign Ai
			0x00a4b...0x00a4d, // Gurmukhi Vowel Sign Oo  ..Gurmukhi Sign Virama
			0x00a51...0x00a51, // Gurmukhi Sign Udaat
			0x00a70...0x00a71, // Gurmukhi Tippi          ..Gurmukhi Addak
			0x00a75...0x00a75, // Gurmukhi Sign Yakash
			0x00a81...0x00a83, // Gujarati Sign Candrabind..Gujarati Sign Visarga
			0x00abc...0x00abc, // Gujarati Sign Nukta
			0x00abe...0x00ac5, // Gujarati Vowel Sign Aa  ..Gujarati Vowel Sign Cand
			0x00ac7...0x00ac9, // Gujarati Vowel Sign E   ..Gujarati Vowel Sign Cand
			0x00acb...0x00acd, // Gujarati Vowel Sign O   ..Gujarati Sign Virama
			0x00ae2...0x00ae3, // Gujarati Vowel Sign Voca..Gujarati Vowel Sign Voca
			0x00afa...0x00aff, // Gujarati Sign Sukun     ..Gujarati Sign Two-circle
			0x00b01...0x00b03, // Oriya Sign Candrabindu  ..Oriya Sign Visarga
			0x00b3c...0x00b3c, // Oriya Sign Nukta
			0x00b3e...0x00b44, // Oriya Vowel Sign Aa     ..Oriya Vowel Sign Vocalic
			0x00b47...0x00b48, // Oriya Vowel Sign E      ..Oriya Vowel Sign Ai
			0x00b4b...0x00b4d, // Oriya Vowel Sign O      ..Oriya Sign Virama
			0x00b56...0x00b57, // Oriya Ai Length Mark    ..Oriya Au Length Mark
			0x00b62...0x00b63, // Oriya Vowel Sign Vocalic..Oriya Vowel Sign Vocalic
			0x00b82...0x00b82, // Tamil Sign Anusvara
			0x00bbe...0x00bc2, // Tamil Vowel Sign Aa     ..Tamil Vowel Sign Uu
			0x00bc6...0x00bc8, // Tamil Vowel Sign E      ..Tamil Vowel Sign Ai
			0x00bca...0x00bcd, // Tamil Vowel Sign O      ..Tamil Sign Virama
			0x00bd7...0x00bd7, // Tamil Au Length Mark
			0x00c00...0x00c03, // Telugu Sign Combining Ca..Telugu Sign Visarga
			0x00c3e...0x00c44, // Telugu Vowel Sign Aa    ..Telugu Vowel Sign Vocali
			0x00c46...0x00c48, // Telugu Vowel Sign E     ..Telugu Vowel Sign Ai
			0x00c4a...0x00c4d, // Telugu Vowel Sign O     ..Telugu Sign Virama
			0x00c55...0x00c56, // Telugu Length Mark      ..Telugu Ai Length Mark
			0x00c62...0x00c63, // Telugu Vowel Sign Vocali..Telugu Vowel Sign Vocali
			0x00c81...0x00c83, // Kannada Sign Candrabindu..Kannada Sign Visarga
			0x00cbc...0x00cbc, // Kannada Sign Nukta
			0x00cbe...0x00cc4, // Kannada Vowel Sign Aa   ..Kannada Vowel Sign Vocal
			0x00cc6...0x00cc8, // Kannada Vowel Sign E    ..Kannada Vowel Sign Ai
			0x00cca...0x00ccd, // Kannada Vowel Sign O    ..Kannada Sign Virama
			0x00cd5...0x00cd6, // Kannada Length Mark     ..Kannada Ai Length Mark
			0x00ce2...0x00ce3, // Kannada Vowel Sign Vocal..Kannada Vowel Sign Vocal
			0x00d00...0x00d03, // Malayalam Sign Combining..Malayalam Sign Visarga
			0x00d3b...0x00d3c, // Malayalam Sign Vertical ..Malayalam Sign Circular
			0x00d3e...0x00d44, // Malayalam Vowel Sign Aa ..Malayalam Vowel Sign Voc
			0x00d46...0x00d48, // Malayalam Vowel Sign E  ..Malayalam Vowel Sign Ai
			0x00d4a...0x00d4d, // Malayalam Vowel Sign O  ..Malayalam Sign Virama
			0x00d57...0x00d57, // Malayalam Au Length Mark
			0x00d62...0x00d63, // Malayalam Vowel Sign Voc..Malayalam Vowel Sign Voc
			0x00d82...0x00d83, // Sinhala Sign Anusvaraya ..Sinhala Sign Visargaya
			0x00dca...0x00dca, // Sinhala Sign Al-lakuna
			0x00dcf...0x00dd4, // Sinhala Vowel Sign Aela-..Sinhala Vowel Sign Ketti
			0x00dd6...0x00dd6, // Sinhala Vowel Sign Diga Paa-pilla
			0x00dd8...0x00ddf, // Sinhala Vowel Sign Gaett..Sinhala Vowel Sign Gayan
			0x00df2...0x00df3, // Sinhala Vowel Sign Diga ..Sinhala Vowel Sign Diga
			0x00e31...0x00e31, // Thai Character Mai Han-akat
			0x00e34...0x00e3a, // Thai Character Sara I   ..Thai Character Phinthu
			0x00e47...0x00e4e, // Thai Character Maitaikhu..Thai Character Yamakkan
			0x00eb1...0x00eb1, // Lao Vowel Sign Mai Kan
			0x00eb4...0x00eb9, // Lao Vowel Sign I        ..Lao Vowel Sign Uu
			0x00ebb...0x00ebc, // Lao Vowel Sign Mai Kon  ..Lao Semivowel Sign Lo
			0x00ec8...0x00ecd, // Lao Tone Mai Ek         ..Lao Niggahita
			0x00f18...0x00f19, // Tibetan Astrological Sig..Tibetan Astrological Sig
			0x00f35...0x00f35, // Tibetan Mark Ngas Bzung Nyi Zla
			0x00f37...0x00f37, // Tibetan Mark Ngas Bzung Sgor Rtags
			0x00f39...0x00f39, // Tibetan Mark Tsa -phru
			0x00f3e...0x00f3f, // Tibetan Sign Yar Tshes  ..Tibetan Sign Mar Tshes
			0x00f71...0x00f84, // Tibetan Vowel Sign Aa   ..Tibetan Mark Halanta
			0x00f86...0x00f87, // Tibetan Sign Lci Rtags  ..Tibetan Sign Yang Rtags
			0x00f8d...0x00f97, // Tibetan Subjoined Sign L..Tibetan Subjoined Letter
			0x00f99...0x00fbc, // Tibetan Subjoined Letter..Tibetan Subjoined Letter
			0x00fc6...0x00fc6, // Tibetan Symbol Padma Gdan
			0x0102b...0x0103e, // Myanmar Vowel Sign Tall ..Myanmar Consonant Sign M
			0x01056...0x01059, // Myanmar Vowel Sign Vocal..Myanmar Vowel Sign Vocal
			0x0105e...0x01060, // Myanmar Consonant Sign M..Myanmar Consonant Sign M
			0x01062...0x01064, // Myanmar Vowel Sign Sgaw ..Myanmar Tone Mark Sgaw K
			0x01067...0x0106d, // Myanmar Vowel Sign Weste..Myanmar Sign Western Pwo
			0x01071...0x01074, // Myanmar Vowel Sign Geba ..Myanmar Vowel Sign Kayah
			0x01082...0x0108d, // Myanmar Consonant Sign S..Myanmar Sign Shan Counci
			0x0108f...0x0108f, // Myanmar Sign Rumai Palaung Tone-5
			0x0109a...0x0109d, // Myanmar Sign Khamti Tone..Myanmar Vowel Sign Aiton
			0x01160...0x011ff, // Hangul Jungseong Filler ..Hangul Jongseong Ssangni
			0x0135d...0x0135f, // Ethiopic Combining Gemin..Ethiopic Combining Gemin
			0x01712...0x01714, // Tagalog Vowel Sign I    ..Tagalog Sign Virama
			0x01732...0x01734, // Hanunoo Vowel Sign I    ..Hanunoo Sign Pamudpod
			0x01752...0x01753, // Buhid Vowel Sign I      ..Buhid Vowel Sign U
			0x01772...0x01773, // Tagbanwa Vowel Sign I   ..Tagbanwa Vowel Sign U
			0x017b4...0x017d3, // Khmer Vowel Inherent Aq ..Khmer Sign Bathamasat
			0x017dd...0x017dd, // Khmer Sign Atthacan
			0x0180b...0x0180e, // Mongolian Free Variation..Mongolian Vowel Separato
			0x01885...0x01886, // Mongolian Letter Ali Gal..Mongolian Letter Ali Gal
			0x018a9...0x018a9, // Mongolian Letter Ali Gali Dagalga
			0x01920...0x0192b, // Limbu Vowel Sign A      ..Limbu Subjoined Letter W
			0x01930...0x0193b, // Limbu Small Letter Ka   ..Limbu Sign Sa-i
			0x01a17...0x01a1b, // Buginese Vowel Sign I   ..Buginese Vowel Sign Ae
			0x01a55...0x01a5e, // Tai Tham Consonant Sign ..Tai Tham Consonant Sign
			0x01a60...0x01a7c, // Tai Tham Sign Sakot     ..Tai Tham Sign Khuen-lue
			0x01a7f...0x01a7f, // Tai Tham Combining Cryptogrammic Dot
			0x01ab0...0x01abe, // Combining Doubled Circum..Combining Parentheses Ov
			0x01b00...0x01b04, // Balinese Sign Ulu Ricem ..Balinese Sign Bisah
			0x01b34...0x01b44, // Balinese Sign Rerekan   ..Balinese Adeg Adeg
			0x01b6b...0x01b73, // Balinese Musical Symbol ..Balinese Musical Symbol
			0x01b80...0x01b82, // Sundanese Sign Panyecek ..Sundanese Sign Pangwisad
			0x01ba1...0x01bad, // Sundanese Consonant Sign..Sundanese Consonant Sign
			0x01be6...0x01bf3, // Batak Sign Tompi        ..Batak Panongonan
			0x01c24...0x01c37, // Lepcha Subjoined Letter ..Lepcha Sign Nukta
			0x01cd0...0x01cd2, // Vedic Tone Karshana     ..Vedic Tone Prenkha
			0x01cd4...0x01ce8, // Vedic Sign Yajurvedic Mi..Vedic Sign Visarga Anuda
			0x01ced...0x01ced, // Vedic Sign Tiryak
			0x01cf2...0x01cf4, // Vedic Sign Ardhavisarga ..Vedic Tone Candra Above
			0x01cf7...0x01cf9, // Vedic Sign Atikrama     ..Vedic Tone Double Ring A
			0x01dc0...0x01df9, // Combining Dotted Grave A..Combining Wide Inverted
			0x01dfb...0x01dff, // Combining Deletion Mark ..Combining Right Arrowhea
			0x0200b...0x0200f, // Zero Width Space        ..Right-to-left Mark
			0x02028...0x0202e, // Line Separator          ..Right-to-left Override
			0x02060...0x02064, // Word Joiner             ..Invisible Plus
			0x02066...0x0206f, // Left-to-right Isolate   ..Nominal Digit Shapes
			0x020d0...0x020f0, // Combining Left Harpoon A..Combining Asterisk Above
			0x02cef...0x02cf1, // Coptic Combining Ni Abov..Coptic Combining Spiritu
			0x02d7f...0x02d7f, // Tifinagh Consonant Joiner
			0x02de0...0x02dff, // Combining Cyrillic Lette..Combining Cyrillic Lette
			0x0302a...0x0302f, // Ideographic Level Tone M..Hangul Double Dot Tone M
			0x03099...0x0309a, // Combining Katakana-hirag..Combining Katakana-hirag
			0x0a66f...0x0a672, // Combining Cyrillic Vzmet..Combining Cyrillic Thous
			0x0a674...0x0a67d, // Combining Cyrillic Lette..Combining Cyrillic Payer
			0x0a69e...0x0a69f, // Combining Cyrillic Lette..Combining Cyrillic Lette
			0x0a6f0...0x0a6f1, // Bamum Combining Mark Koq..Bamum Combining Mark Tuk
			0x0a802...0x0a802, // Syloti Nagri Sign Dvisvara
			0x0a806...0x0a806, // Syloti Nagri Sign Hasanta
			0x0a80b...0x0a80b, // Syloti Nagri Sign Anusvara
			0x0a823...0x0a827, // Syloti Nagri Vowel Sign ..Syloti Nagri Vowel Sign
			0x0a880...0x0a881, // Saurashtra Sign Anusvara..Saurashtra Sign Visarga
			0x0a8b4...0x0a8c5, // Saurashtra Consonant Sig..Saurashtra Sign Candrabi
			0x0a8e0...0x0a8f1, // Combining Devanagari Dig..Combining Devanagari Sig
			0x0a926...0x0a92d, // Kayah Li Vowel Ue       ..Kayah Li Tone Calya Plop
			0x0a947...0x0a953, // Rejang Vowel Sign I     ..Rejang Virama
			0x0a980...0x0a983, // Javanese Sign Panyangga ..Javanese Sign Wignyan
			0x0a9b3...0x0a9c0, // Javanese Sign Cecak Telu..Javanese Pangkon
			0x0a9e5...0x0a9e5, // Myanmar Sign Shan Saw
			0x0aa29...0x0aa36, // Cham Vowel Sign Aa      ..Cham Consonant Sign Wa
			0x0aa43...0x0aa43, // Cham Consonant Sign Final Ng
			0x0aa4c...0x0aa4d, // Cham Consonant Sign Fina..Cham Consonant Sign Fina
			0x0aa7b...0x0aa7d, // Myanmar Sign Pao Karen T..Myanmar Sign Tai Laing T
			0x0aab0...0x0aab0, // Tai Viet Mai Kang
			0x0aab2...0x0aab4, // Tai Viet Vowel I        ..Tai Viet Vowel U
			0x0aab7...0x0aab8, // Tai Viet Mai Khit       ..Tai Viet Vowel Ia
			0x0aabe...0x0aabf, // Tai Viet Vowel Am       ..Tai Viet Tone Mai Ek
			0x0aac1...0x0aac1, // Tai Viet Tone Mai Tho
			0x0aaeb...0x0aaef, // Meetei Mayek Vowel Sign ..Meetei Mayek Vowel Sign
			0x0aaf5...0x0aaf6, // Meetei Mayek Vowel Sign ..Meetei Mayek Virama
			0x0abe3...0x0abea, // Meetei Mayek Vowel Sign ..Meetei Mayek Vowel Sign
			0x0abec...0x0abed, // Meetei Mayek Lum Iyek   ..Meetei Mayek Apun Iyek
			0x0d7b0...0x0d7ff, // Hangul Jungseong O-yeo  ..(nil)
			0x0fb1e...0x0fb1e, // Hebrew Point Judeo-spanish Varika
			0x0fe00...0x0fe0f, // Variation Selector-1    ..Variation Selector-16
			0x0fe20...0x0fe2f, // Combining Ligature Left ..Combining Cyrillic Titlo
			0x0feff...0x0feff, // Zero Width No-break Space
			0x0fff9...0x0fffb, // Interlinear Annotation A..Interlinear Annotation T
			0x101fd...0x101fd, // Phaistos Disc Sign Combining Oblique Stroke
			0x102e0...0x102e0, // Coptic Epact Thousands Mark
			0x10376...0x1037a, // Combining Old Permic Let..Combining Old Permic Let
			0x10a01...0x10a03, // Kharoshthi Vowel Sign I ..Kharoshthi Vowel Sign Vo
			0x10a05...0x10a06, // Kharoshthi Vowel Sign E ..Kharoshthi Vowel Sign O
			0x10a0c...0x10a0f, // Kharoshthi Vowel Length ..Kharoshthi Sign Visarga
			0x10a38...0x10a3a, // Kharoshthi Sign Bar Abov..Kharoshthi Sign Dot Belo
			0x10a3f...0x10a3f, // Kharoshthi Virama
			0x10ae5...0x10ae6, // Manichaean Abbreviation ..Manichaean Abbreviation
			0x11000...0x11002, // Brahmi Sign Candrabindu ..Brahmi Sign Visarga
			0x11038...0x11046, // Brahmi Vowel Sign Aa    ..Brahmi Virama
			0x1107f...0x11082, // Brahmi Number Joiner    ..Kaithi Sign Visarga
			0x110b0...0x110ba, // Kaithi Vowel Sign Aa    ..Kaithi Sign Nukta
			0x110bd...0x110bd, // Kaithi Number Sign
			0x11100...0x11102, // Chakma Sign Candrabindu ..Chakma Sign Visarga
			0x11127...0x11134, // Chakma Vowel Sign A     ..Chakma Maayyaa
			0x11173...0x11173, // Mahajani Sign Nukta
			0x11180...0x11182, // Sharada Sign Candrabindu..Sharada Sign Visarga
			0x111b3...0x111c0, // Sharada Vowel Sign Aa   ..Sharada Sign Virama
			0x111ca...0x111cc, // Sharada Sign Nukta      ..Sharada Extra Short Vowe
			0x1122c...0x11237, // Khojki Vowel Sign Aa    ..Khojki Sign Shadda
			0x1123e...0x1123e, // Khojki Sign Sukun
			0x112df...0x112ea, // Khudawadi Sign Anusvara ..Khudawadi Sign Virama
			0x11300...0x11303, // Grantha Sign Combining A..Grantha Sign Visarga
			0x1133c...0x1133c, // Grantha Sign Nukta
			0x1133e...0x11344, // Grantha Vowel Sign Aa   ..Grantha Vowel Sign Vocal
			0x11347...0x11348, // Grantha Vowel Sign Ee   ..Grantha Vowel Sign Ai
			0x1134b...0x1134d, // Grantha Vowel Sign Oo   ..Grantha Sign Virama
			0x11357...0x11357, // Grantha Au Length Mark
			0x11362...0x11363, // Grantha Vowel Sign Vocal..Grantha Vowel Sign Vocal
			0x11366...0x1136c, // Combining Grantha Digit ..Combining Grantha Digit
			0x11370...0x11374, // Combining Grantha Letter..Combining Grantha Letter
			0x11435...0x11446, // Newa Vowel Sign Aa      ..Newa Sign Nukta
			0x114b0...0x114c3, // Tirhuta Vowel Sign Aa   ..Tirhuta Sign Nukta
			0x115af...0x115b5, // Siddham Vowel Sign Aa   ..Siddham Vowel Sign Vocal
			0x115b8...0x115c0, // Siddham Vowel Sign E    ..Siddham Sign Nukta
			0x115dc...0x115dd, // Siddham Vowel Sign Alter..Siddham Vowel Sign Alter
			0x11630...0x11640, // Modi Vowel Sign Aa      ..Modi Sign Ardhacandra
			0x116ab...0x116b7, // Takri Sign Anusvara     ..Takri Sign Nukta
			0x1171d...0x1172b, // Ahom Consonant Sign Medi..Ahom Sign Killer
			0x11a01...0x11a0a, // Zanabazar Square Vowel S..Zanabazar Square Vowel L
			0x11a33...0x11a39, // Zanabazar Square Final C..Zanabazar Square Sign Vi
			0x11a3b...0x11a3e, // Zanabazar Square Cluster..Zanabazar Square Cluster
			0x11a47...0x11a47, // Zanabazar Square Subjoiner
			0x11a51...0x11a5b, // Soyombo Vowel Sign I    ..Soyombo Vowel Length Mar
			0x11a8a...0x11a99, // Soyombo Final Consonant ..Soyombo Subjoiner
			0x11c2f...0x11c36, // Bhaiksuki Vowel Sign Aa ..Bhaiksuki Vowel Sign Voc
			0x11c38...0x11c3f, // Bhaiksuki Vowel Sign E  ..Bhaiksuki Sign Virama
			0x11c92...0x11ca7, // Marchen Subjoined Letter..Marchen Subjoined Letter
			0x11ca9...0x11cb6, // Marchen Subjoined Letter..Marchen Sign Candrabindu
			0x11d31...0x11d36, // Masaram Gondi Vowel Sign..Masaram Gondi Vowel Sign
			0x11d3a...0x11d3a, // Masaram Gondi Vowel Sign E
			0x11d3c...0x11d3d, // Masaram Gondi Vowel Sign..Masaram Gondi Vowel Sign
			0x11d3f...0x11d45, // Masaram Gondi Vowel Sign..Masaram Gondi Virama
			0x11d47...0x11d47, // Masaram Gondi Ra-kara
			0x16af0...0x16af4, // Bassa Vah Combining High..Bassa Vah Combining High
			0x16b30...0x16b36, // Pahawh Hmong Mark Cim Tu..Pahawh Hmong Mark Cim Ta
			0x16f51...0x16f7e, // Miao Sign Aspiration    ..Miao Vowel Sign Ng
			0x16f8f...0x16f92, // Miao Tone Right         ..Miao Tone Below
			0x1bc9d...0x1bc9e, // Duployan Thick Letter Se..Duployan Double Mark
			0x1bca0...0x1bca3, // Shorthand Format Letter ..Shorthand Format Up Step
			0x1d165...0x1d169, // Musical Symbol Combining..Musical Symbol Combining
			0x1d16d...0x1d182, // Musical Symbol Combining..Musical Symbol Combining
			0x1d185...0x1d18b, // Musical Symbol Combining..Musical Symbol Combining
			0x1d1aa...0x1d1ad, // Musical Symbol Combining..Musical Symbol Combining
			0x1d242...0x1d244, // Combining Greek Musical ..Combining Greek Musical
			0x1da00...0x1da36, // Signwriting Head Rim    ..Signwriting Air Sucking
			0x1da3b...0x1da6c, // Signwriting Mouth Closed..Signwriting Excitement
			0x1da75...0x1da75, // Signwriting Upper Body Tilting From Hip Joints
			0x1da84...0x1da84, // Signwriting Location Head Neck
			0x1da9b...0x1da9f, // Signwriting Fill Modifie..Signwriting Fill Modifie
			0x1daa1...0x1daaf, // Signwriting Rotation Mod..Signwriting Rotation Mod
			0x1e000...0x1e006, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e008...0x1e018, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e01b...0x1e021, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e023...0x1e024, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e026...0x1e02a, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e8d0...0x1e8d6, // Mende Kikakui Combining ..Mende Kikakui Combining
			0x1e944...0x1e94a, // Adlam Alif Lengthener   ..Adlam Nukta
			0x1f3fb...0x1f3ff, // Emoji Modifier Fitzpatri..Emoji Modifier Fitzpatri
			0xe0001...0xe0001, // Language Tag
			0xe0020...0xe007f, // Tag Space               ..Cancel Tag
			0xe0100...0xe01ef, // Variation Selector-17   ..Variation Selector-256
			=> true,
			else => false,
		},
		.@"11.0.0" => switch (codepoint) {
			// Source: DerivedGeneralCategory-11.0.0.txt
			// Date: 2018-02-21, 05:34:04 GMT
			0x00000...0x00000, // (nil)
			0x000ad...0x000ad, // Soft Hyphen
			0x00300...0x0036f, // Combining Grave Accent  ..Combining Latin Small Le
			0x00483...0x00489, // Combining Cyrillic Titlo..Combining Cyrillic Milli
			0x00591...0x005bd, // Hebrew Accent Etnahta   ..Hebrew Point Meteg
			0x005bf...0x005bf, // Hebrew Point Rafe
			0x005c1...0x005c2, // Hebrew Point Shin Dot   ..Hebrew Point Sin Dot
			0x005c4...0x005c5, // Hebrew Mark Upper Dot   ..Hebrew Mark Lower Dot
			0x005c7...0x005c7, // Hebrew Point Qamats Qatan
			0x00600...0x00605, // Arabic Number Sign      ..Arabic Number Mark Above
			0x00610...0x0061a, // Arabic Sign Sallallahou ..Arabic Small Kasra
			0x0061c...0x0061c, // Arabic Letter Mark
			0x0064b...0x0065f, // Arabic Fathatan         ..Arabic Wavy Hamza Below
			0x00670...0x00670, // Arabic Letter Superscript Alef
			0x006d6...0x006dd, // Arabic Small High Ligatu..Arabic End Of Ayah
			0x006df...0x006e4, // Arabic Small High Rounde..Arabic Small High Madda
			0x006e7...0x006e8, // Arabic Small High Yeh   ..Arabic Small High Noon
			0x006ea...0x006ed, // Arabic Empty Centre Low ..Arabic Small Low Meem
			0x0070f...0x0070f, // Syriac Abbreviation Mark
			0x00711...0x00711, // Syriac Letter Superscript Alaph
			0x00730...0x0074a, // Syriac Pthaha Above     ..Syriac Barrekh
			0x007a6...0x007b0, // Thaana Abafili          ..Thaana Sukun
			0x007eb...0x007f3, // Nko Combining Short High..Nko Combining Double Dot
			0x007fd...0x007fd, // Nko Dantayalan
			0x00816...0x00819, // Samaritan Mark In       ..Samaritan Mark Dagesh
			0x0081b...0x00823, // Samaritan Mark Epentheti..Samaritan Vowel Sign A
			0x00825...0x00827, // Samaritan Vowel Sign Sho..Samaritan Vowel Sign U
			0x00829...0x0082d, // Samaritan Vowel Sign Lon..Samaritan Mark Nequdaa
			0x00859...0x0085b, // Mandaic Affrication Mark..Mandaic Gemination Mark
			0x008d3...0x00903, // Arabic Small Low Waw    ..Devanagari Sign Visarga
			0x0093a...0x0093c, // Devanagari Vowel Sign Oe..Devanagari Sign Nukta
			0x0093e...0x0094f, // Devanagari Vowel Sign Aa..Devanagari Vowel Sign Aw
			0x00951...0x00957, // Devanagari Stress Sign U..Devanagari Vowel Sign Uu
			0x00962...0x00963, // Devanagari Vowel Sign Vo..Devanagari Vowel Sign Vo
			0x00981...0x00983, // Bengali Sign Candrabindu..Bengali Sign Visarga
			0x009bc...0x009bc, // Bengali Sign Nukta
			0x009be...0x009c4, // Bengali Vowel Sign Aa   ..Bengali Vowel Sign Vocal
			0x009c7...0x009c8, // Bengali Vowel Sign E    ..Bengali Vowel Sign Ai
			0x009cb...0x009cd, // Bengali Vowel Sign O    ..Bengali Sign Virama
			0x009d7...0x009d7, // Bengali Au Length Mark
			0x009e2...0x009e3, // Bengali Vowel Sign Vocal..Bengali Vowel Sign Vocal
			0x009fe...0x009fe, // Bengali Sandhi Mark
			0x00a01...0x00a03, // Gurmukhi Sign Adak Bindi..Gurmukhi Sign Visarga
			0x00a3c...0x00a3c, // Gurmukhi Sign Nukta
			0x00a3e...0x00a42, // Gurmukhi Vowel Sign Aa  ..Gurmukhi Vowel Sign Uu
			0x00a47...0x00a48, // Gurmukhi Vowel Sign Ee  ..Gurmukhi Vowel Sign Ai
			0x00a4b...0x00a4d, // Gurmukhi Vowel Sign Oo  ..Gurmukhi Sign Virama
			0x00a51...0x00a51, // Gurmukhi Sign Udaat
			0x00a70...0x00a71, // Gurmukhi Tippi          ..Gurmukhi Addak
			0x00a75...0x00a75, // Gurmukhi Sign Yakash
			0x00a81...0x00a83, // Gujarati Sign Candrabind..Gujarati Sign Visarga
			0x00abc...0x00abc, // Gujarati Sign Nukta
			0x00abe...0x00ac5, // Gujarati Vowel Sign Aa  ..Gujarati Vowel Sign Cand
			0x00ac7...0x00ac9, // Gujarati Vowel Sign E   ..Gujarati Vowel Sign Cand
			0x00acb...0x00acd, // Gujarati Vowel Sign O   ..Gujarati Sign Virama
			0x00ae2...0x00ae3, // Gujarati Vowel Sign Voca..Gujarati Vowel Sign Voca
			0x00afa...0x00aff, // Gujarati Sign Sukun     ..Gujarati Sign Two-circle
			0x00b01...0x00b03, // Oriya Sign Candrabindu  ..Oriya Sign Visarga
			0x00b3c...0x00b3c, // Oriya Sign Nukta
			0x00b3e...0x00b44, // Oriya Vowel Sign Aa     ..Oriya Vowel Sign Vocalic
			0x00b47...0x00b48, // Oriya Vowel Sign E      ..Oriya Vowel Sign Ai
			0x00b4b...0x00b4d, // Oriya Vowel Sign O      ..Oriya Sign Virama
			0x00b56...0x00b57, // Oriya Ai Length Mark    ..Oriya Au Length Mark
			0x00b62...0x00b63, // Oriya Vowel Sign Vocalic..Oriya Vowel Sign Vocalic
			0x00b82...0x00b82, // Tamil Sign Anusvara
			0x00bbe...0x00bc2, // Tamil Vowel Sign Aa     ..Tamil Vowel Sign Uu
			0x00bc6...0x00bc8, // Tamil Vowel Sign E      ..Tamil Vowel Sign Ai
			0x00bca...0x00bcd, // Tamil Vowel Sign O      ..Tamil Sign Virama
			0x00bd7...0x00bd7, // Tamil Au Length Mark
			0x00c00...0x00c04, // Telugu Sign Combining Ca..Telugu Sign Combining An
			0x00c3e...0x00c44, // Telugu Vowel Sign Aa    ..Telugu Vowel Sign Vocali
			0x00c46...0x00c48, // Telugu Vowel Sign E     ..Telugu Vowel Sign Ai
			0x00c4a...0x00c4d, // Telugu Vowel Sign O     ..Telugu Sign Virama
			0x00c55...0x00c56, // Telugu Length Mark      ..Telugu Ai Length Mark
			0x00c62...0x00c63, // Telugu Vowel Sign Vocali..Telugu Vowel Sign Vocali
			0x00c81...0x00c83, // Kannada Sign Candrabindu..Kannada Sign Visarga
			0x00cbc...0x00cbc, // Kannada Sign Nukta
			0x00cbe...0x00cc4, // Kannada Vowel Sign Aa   ..Kannada Vowel Sign Vocal
			0x00cc6...0x00cc8, // Kannada Vowel Sign E    ..Kannada Vowel Sign Ai
			0x00cca...0x00ccd, // Kannada Vowel Sign O    ..Kannada Sign Virama
			0x00cd5...0x00cd6, // Kannada Length Mark     ..Kannada Ai Length Mark
			0x00ce2...0x00ce3, // Kannada Vowel Sign Vocal..Kannada Vowel Sign Vocal
			0x00d00...0x00d03, // Malayalam Sign Combining..Malayalam Sign Visarga
			0x00d3b...0x00d3c, // Malayalam Sign Vertical ..Malayalam Sign Circular
			0x00d3e...0x00d44, // Malayalam Vowel Sign Aa ..Malayalam Vowel Sign Voc
			0x00d46...0x00d48, // Malayalam Vowel Sign E  ..Malayalam Vowel Sign Ai
			0x00d4a...0x00d4d, // Malayalam Vowel Sign O  ..Malayalam Sign Virama
			0x00d57...0x00d57, // Malayalam Au Length Mark
			0x00d62...0x00d63, // Malayalam Vowel Sign Voc..Malayalam Vowel Sign Voc
			0x00d82...0x00d83, // Sinhala Sign Anusvaraya ..Sinhala Sign Visargaya
			0x00dca...0x00dca, // Sinhala Sign Al-lakuna
			0x00dcf...0x00dd4, // Sinhala Vowel Sign Aela-..Sinhala Vowel Sign Ketti
			0x00dd6...0x00dd6, // Sinhala Vowel Sign Diga Paa-pilla
			0x00dd8...0x00ddf, // Sinhala Vowel Sign Gaett..Sinhala Vowel Sign Gayan
			0x00df2...0x00df3, // Sinhala Vowel Sign Diga ..Sinhala Vowel Sign Diga
			0x00e31...0x00e31, // Thai Character Mai Han-akat
			0x00e34...0x00e3a, // Thai Character Sara I   ..Thai Character Phinthu
			0x00e47...0x00e4e, // Thai Character Maitaikhu..Thai Character Yamakkan
			0x00eb1...0x00eb1, // Lao Vowel Sign Mai Kan
			0x00eb4...0x00eb9, // Lao Vowel Sign I        ..Lao Vowel Sign Uu
			0x00ebb...0x00ebc, // Lao Vowel Sign Mai Kon  ..Lao Semivowel Sign Lo
			0x00ec8...0x00ecd, // Lao Tone Mai Ek         ..Lao Niggahita
			0x00f18...0x00f19, // Tibetan Astrological Sig..Tibetan Astrological Sig
			0x00f35...0x00f35, // Tibetan Mark Ngas Bzung Nyi Zla
			0x00f37...0x00f37, // Tibetan Mark Ngas Bzung Sgor Rtags
			0x00f39...0x00f39, // Tibetan Mark Tsa -phru
			0x00f3e...0x00f3f, // Tibetan Sign Yar Tshes  ..Tibetan Sign Mar Tshes
			0x00f71...0x00f84, // Tibetan Vowel Sign Aa   ..Tibetan Mark Halanta
			0x00f86...0x00f87, // Tibetan Sign Lci Rtags  ..Tibetan Sign Yang Rtags
			0x00f8d...0x00f97, // Tibetan Subjoined Sign L..Tibetan Subjoined Letter
			0x00f99...0x00fbc, // Tibetan Subjoined Letter..Tibetan Subjoined Letter
			0x00fc6...0x00fc6, // Tibetan Symbol Padma Gdan
			0x0102b...0x0103e, // Myanmar Vowel Sign Tall ..Myanmar Consonant Sign M
			0x01056...0x01059, // Myanmar Vowel Sign Vocal..Myanmar Vowel Sign Vocal
			0x0105e...0x01060, // Myanmar Consonant Sign M..Myanmar Consonant Sign M
			0x01062...0x01064, // Myanmar Vowel Sign Sgaw ..Myanmar Tone Mark Sgaw K
			0x01067...0x0106d, // Myanmar Vowel Sign Weste..Myanmar Sign Western Pwo
			0x01071...0x01074, // Myanmar Vowel Sign Geba ..Myanmar Vowel Sign Kayah
			0x01082...0x0108d, // Myanmar Consonant Sign S..Myanmar Sign Shan Counci
			0x0108f...0x0108f, // Myanmar Sign Rumai Palaung Tone-5
			0x0109a...0x0109d, // Myanmar Sign Khamti Tone..Myanmar Vowel Sign Aiton
			0x01160...0x011ff, // Hangul Jungseong Filler ..Hangul Jongseong Ssangni
			0x0135d...0x0135f, // Ethiopic Combining Gemin..Ethiopic Combining Gemin
			0x01712...0x01714, // Tagalog Vowel Sign I    ..Tagalog Sign Virama
			0x01732...0x01734, // Hanunoo Vowel Sign I    ..Hanunoo Sign Pamudpod
			0x01752...0x01753, // Buhid Vowel Sign I      ..Buhid Vowel Sign U
			0x01772...0x01773, // Tagbanwa Vowel Sign I   ..Tagbanwa Vowel Sign U
			0x017b4...0x017d3, // Khmer Vowel Inherent Aq ..Khmer Sign Bathamasat
			0x017dd...0x017dd, // Khmer Sign Atthacan
			0x0180b...0x0180e, // Mongolian Free Variation..Mongolian Vowel Separato
			0x01885...0x01886, // Mongolian Letter Ali Gal..Mongolian Letter Ali Gal
			0x018a9...0x018a9, // Mongolian Letter Ali Gali Dagalga
			0x01920...0x0192b, // Limbu Vowel Sign A      ..Limbu Subjoined Letter W
			0x01930...0x0193b, // Limbu Small Letter Ka   ..Limbu Sign Sa-i
			0x01a17...0x01a1b, // Buginese Vowel Sign I   ..Buginese Vowel Sign Ae
			0x01a55...0x01a5e, // Tai Tham Consonant Sign ..Tai Tham Consonant Sign
			0x01a60...0x01a7c, // Tai Tham Sign Sakot     ..Tai Tham Sign Khuen-lue
			0x01a7f...0x01a7f, // Tai Tham Combining Cryptogrammic Dot
			0x01ab0...0x01abe, // Combining Doubled Circum..Combining Parentheses Ov
			0x01b00...0x01b04, // Balinese Sign Ulu Ricem ..Balinese Sign Bisah
			0x01b34...0x01b44, // Balinese Sign Rerekan   ..Balinese Adeg Adeg
			0x01b6b...0x01b73, // Balinese Musical Symbol ..Balinese Musical Symbol
			0x01b80...0x01b82, // Sundanese Sign Panyecek ..Sundanese Sign Pangwisad
			0x01ba1...0x01bad, // Sundanese Consonant Sign..Sundanese Consonant Sign
			0x01be6...0x01bf3, // Batak Sign Tompi        ..Batak Panongonan
			0x01c24...0x01c37, // Lepcha Subjoined Letter ..Lepcha Sign Nukta
			0x01cd0...0x01cd2, // Vedic Tone Karshana     ..Vedic Tone Prenkha
			0x01cd4...0x01ce8, // Vedic Sign Yajurvedic Mi..Vedic Sign Visarga Anuda
			0x01ced...0x01ced, // Vedic Sign Tiryak
			0x01cf2...0x01cf4, // Vedic Sign Ardhavisarga ..Vedic Tone Candra Above
			0x01cf7...0x01cf9, // Vedic Sign Atikrama     ..Vedic Tone Double Ring A
			0x01dc0...0x01df9, // Combining Dotted Grave A..Combining Wide Inverted
			0x01dfb...0x01dff, // Combining Deletion Mark ..Combining Right Arrowhea
			0x0200b...0x0200f, // Zero Width Space        ..Right-to-left Mark
			0x02028...0x0202e, // Line Separator          ..Right-to-left Override
			0x02060...0x02064, // Word Joiner             ..Invisible Plus
			0x02066...0x0206f, // Left-to-right Isolate   ..Nominal Digit Shapes
			0x020d0...0x020f0, // Combining Left Harpoon A..Combining Asterisk Above
			0x02cef...0x02cf1, // Coptic Combining Ni Abov..Coptic Combining Spiritu
			0x02d7f...0x02d7f, // Tifinagh Consonant Joiner
			0x02de0...0x02dff, // Combining Cyrillic Lette..Combining Cyrillic Lette
			0x0302a...0x0302f, // Ideographic Level Tone M..Hangul Double Dot Tone M
			0x03099...0x0309a, // Combining Katakana-hirag..Combining Katakana-hirag
			0x0a66f...0x0a672, // Combining Cyrillic Vzmet..Combining Cyrillic Thous
			0x0a674...0x0a67d, // Combining Cyrillic Lette..Combining Cyrillic Payer
			0x0a69e...0x0a69f, // Combining Cyrillic Lette..Combining Cyrillic Lette
			0x0a6f0...0x0a6f1, // Bamum Combining Mark Koq..Bamum Combining Mark Tuk
			0x0a802...0x0a802, // Syloti Nagri Sign Dvisvara
			0x0a806...0x0a806, // Syloti Nagri Sign Hasanta
			0x0a80b...0x0a80b, // Syloti Nagri Sign Anusvara
			0x0a823...0x0a827, // Syloti Nagri Vowel Sign ..Syloti Nagri Vowel Sign
			0x0a880...0x0a881, // Saurashtra Sign Anusvara..Saurashtra Sign Visarga
			0x0a8b4...0x0a8c5, // Saurashtra Consonant Sig..Saurashtra Sign Candrabi
			0x0a8e0...0x0a8f1, // Combining Devanagari Dig..Combining Devanagari Sig
			0x0a8ff...0x0a8ff, // Devanagari Vowel Sign Ay
			0x0a926...0x0a92d, // Kayah Li Vowel Ue       ..Kayah Li Tone Calya Plop
			0x0a947...0x0a953, // Rejang Vowel Sign I     ..Rejang Virama
			0x0a980...0x0a983, // Javanese Sign Panyangga ..Javanese Sign Wignyan
			0x0a9b3...0x0a9c0, // Javanese Sign Cecak Telu..Javanese Pangkon
			0x0a9e5...0x0a9e5, // Myanmar Sign Shan Saw
			0x0aa29...0x0aa36, // Cham Vowel Sign Aa      ..Cham Consonant Sign Wa
			0x0aa43...0x0aa43, // Cham Consonant Sign Final Ng
			0x0aa4c...0x0aa4d, // Cham Consonant Sign Fina..Cham Consonant Sign Fina
			0x0aa7b...0x0aa7d, // Myanmar Sign Pao Karen T..Myanmar Sign Tai Laing T
			0x0aab0...0x0aab0, // Tai Viet Mai Kang
			0x0aab2...0x0aab4, // Tai Viet Vowel I        ..Tai Viet Vowel U
			0x0aab7...0x0aab8, // Tai Viet Mai Khit       ..Tai Viet Vowel Ia
			0x0aabe...0x0aabf, // Tai Viet Vowel Am       ..Tai Viet Tone Mai Ek
			0x0aac1...0x0aac1, // Tai Viet Tone Mai Tho
			0x0aaeb...0x0aaef, // Meetei Mayek Vowel Sign ..Meetei Mayek Vowel Sign
			0x0aaf5...0x0aaf6, // Meetei Mayek Vowel Sign ..Meetei Mayek Virama
			0x0abe3...0x0abea, // Meetei Mayek Vowel Sign ..Meetei Mayek Vowel Sign
			0x0abec...0x0abed, // Meetei Mayek Lum Iyek   ..Meetei Mayek Apun Iyek
			0x0d7b0...0x0d7ff, // Hangul Jungseong O-yeo  ..(nil)
			0x0fb1e...0x0fb1e, // Hebrew Point Judeo-spanish Varika
			0x0fe00...0x0fe0f, // Variation Selector-1    ..Variation Selector-16
			0x0fe20...0x0fe2f, // Combining Ligature Left ..Combining Cyrillic Titlo
			0x0feff...0x0feff, // Zero Width No-break Space
			0x0fff9...0x0fffb, // Interlinear Annotation A..Interlinear Annotation T
			0x101fd...0x101fd, // Phaistos Disc Sign Combining Oblique Stroke
			0x102e0...0x102e0, // Coptic Epact Thousands Mark
			0x10376...0x1037a, // Combining Old Permic Let..Combining Old Permic Let
			0x10a01...0x10a03, // Kharoshthi Vowel Sign I ..Kharoshthi Vowel Sign Vo
			0x10a05...0x10a06, // Kharoshthi Vowel Sign E ..Kharoshthi Vowel Sign O
			0x10a0c...0x10a0f, // Kharoshthi Vowel Length ..Kharoshthi Sign Visarga
			0x10a38...0x10a3a, // Kharoshthi Sign Bar Abov..Kharoshthi Sign Dot Belo
			0x10a3f...0x10a3f, // Kharoshthi Virama
			0x10ae5...0x10ae6, // Manichaean Abbreviation ..Manichaean Abbreviation
			0x10d24...0x10d27, // Hanifi Rohingya Sign Har..Hanifi Rohingya Sign Tas
			0x10f46...0x10f50, // Sogdian Combining Dot Be..Sogdian Combining Stroke
			0x11000...0x11002, // Brahmi Sign Candrabindu ..Brahmi Sign Visarga
			0x11038...0x11046, // Brahmi Vowel Sign Aa    ..Brahmi Virama
			0x1107f...0x11082, // Brahmi Number Joiner    ..Kaithi Sign Visarga
			0x110b0...0x110ba, // Kaithi Vowel Sign Aa    ..Kaithi Sign Nukta
			0x110bd...0x110bd, // Kaithi Number Sign
			0x110cd...0x110cd, // Kaithi Number Sign Above
			0x11100...0x11102, // Chakma Sign Candrabindu ..Chakma Sign Visarga
			0x11127...0x11134, // Chakma Vowel Sign A     ..Chakma Maayyaa
			0x11145...0x11146, // Chakma Vowel Sign Aa    ..Chakma Vowel Sign Ei
			0x11173...0x11173, // Mahajani Sign Nukta
			0x11180...0x11182, // Sharada Sign Candrabindu..Sharada Sign Visarga
			0x111b3...0x111c0, // Sharada Vowel Sign Aa   ..Sharada Sign Virama
			0x111c9...0x111cc, // Sharada Sandhi Mark     ..Sharada Extra Short Vowe
			0x1122c...0x11237, // Khojki Vowel Sign Aa    ..Khojki Sign Shadda
			0x1123e...0x1123e, // Khojki Sign Sukun
			0x112df...0x112ea, // Khudawadi Sign Anusvara ..Khudawadi Sign Virama
			0x11300...0x11303, // Grantha Sign Combining A..Grantha Sign Visarga
			0x1133b...0x1133c, // Combining Bindu Below   ..Grantha Sign Nukta
			0x1133e...0x11344, // Grantha Vowel Sign Aa   ..Grantha Vowel Sign Vocal
			0x11347...0x11348, // Grantha Vowel Sign Ee   ..Grantha Vowel Sign Ai
			0x1134b...0x1134d, // Grantha Vowel Sign Oo   ..Grantha Sign Virama
			0x11357...0x11357, // Grantha Au Length Mark
			0x11362...0x11363, // Grantha Vowel Sign Vocal..Grantha Vowel Sign Vocal
			0x11366...0x1136c, // Combining Grantha Digit ..Combining Grantha Digit
			0x11370...0x11374, // Combining Grantha Letter..Combining Grantha Letter
			0x11435...0x11446, // Newa Vowel Sign Aa      ..Newa Sign Nukta
			0x1145e...0x1145e, // Newa Sandhi Mark
			0x114b0...0x114c3, // Tirhuta Vowel Sign Aa   ..Tirhuta Sign Nukta
			0x115af...0x115b5, // Siddham Vowel Sign Aa   ..Siddham Vowel Sign Vocal
			0x115b8...0x115c0, // Siddham Vowel Sign E    ..Siddham Sign Nukta
			0x115dc...0x115dd, // Siddham Vowel Sign Alter..Siddham Vowel Sign Alter
			0x11630...0x11640, // Modi Vowel Sign Aa      ..Modi Sign Ardhacandra
			0x116ab...0x116b7, // Takri Sign Anusvara     ..Takri Sign Nukta
			0x1171d...0x1172b, // Ahom Consonant Sign Medi..Ahom Sign Killer
			0x1182c...0x1183a, // Dogra Vowel Sign Aa     ..Dogra Sign Nukta
			0x11a01...0x11a0a, // Zanabazar Square Vowel S..Zanabazar Square Vowel L
			0x11a33...0x11a39, // Zanabazar Square Final C..Zanabazar Square Sign Vi
			0x11a3b...0x11a3e, // Zanabazar Square Cluster..Zanabazar Square Cluster
			0x11a47...0x11a47, // Zanabazar Square Subjoiner
			0x11a51...0x11a5b, // Soyombo Vowel Sign I    ..Soyombo Vowel Length Mar
			0x11a8a...0x11a99, // Soyombo Final Consonant ..Soyombo Subjoiner
			0x11c2f...0x11c36, // Bhaiksuki Vowel Sign Aa ..Bhaiksuki Vowel Sign Voc
			0x11c38...0x11c3f, // Bhaiksuki Vowel Sign E  ..Bhaiksuki Sign Virama
			0x11c92...0x11ca7, // Marchen Subjoined Letter..Marchen Subjoined Letter
			0x11ca9...0x11cb6, // Marchen Subjoined Letter..Marchen Sign Candrabindu
			0x11d31...0x11d36, // Masaram Gondi Vowel Sign..Masaram Gondi Vowel Sign
			0x11d3a...0x11d3a, // Masaram Gondi Vowel Sign E
			0x11d3c...0x11d3d, // Masaram Gondi Vowel Sign..Masaram Gondi Vowel Sign
			0x11d3f...0x11d45, // Masaram Gondi Vowel Sign..Masaram Gondi Virama
			0x11d47...0x11d47, // Masaram Gondi Ra-kara
			0x11d8a...0x11d8e, // Gunjala Gondi Vowel Sign..Gunjala Gondi Vowel Sign
			0x11d90...0x11d91, // Gunjala Gondi Vowel Sign..Gunjala Gondi Vowel Sign
			0x11d93...0x11d97, // Gunjala Gondi Vowel Sign..Gunjala Gondi Virama
			0x11ef3...0x11ef6, // Makasar Vowel Sign I    ..Makasar Vowel Sign O
			0x16af0...0x16af4, // Bassa Vah Combining High..Bassa Vah Combining High
			0x16b30...0x16b36, // Pahawh Hmong Mark Cim Tu..Pahawh Hmong Mark Cim Ta
			0x16f51...0x16f7e, // Miao Sign Aspiration    ..Miao Vowel Sign Ng
			0x16f8f...0x16f92, // Miao Tone Right         ..Miao Tone Below
			0x1bc9d...0x1bc9e, // Duployan Thick Letter Se..Duployan Double Mark
			0x1bca0...0x1bca3, // Shorthand Format Letter ..Shorthand Format Up Step
			0x1d165...0x1d169, // Musical Symbol Combining..Musical Symbol Combining
			0x1d16d...0x1d182, // Musical Symbol Combining..Musical Symbol Combining
			0x1d185...0x1d18b, // Musical Symbol Combining..Musical Symbol Combining
			0x1d1aa...0x1d1ad, // Musical Symbol Combining..Musical Symbol Combining
			0x1d242...0x1d244, // Combining Greek Musical ..Combining Greek Musical
			0x1da00...0x1da36, // Signwriting Head Rim    ..Signwriting Air Sucking
			0x1da3b...0x1da6c, // Signwriting Mouth Closed..Signwriting Excitement
			0x1da75...0x1da75, // Signwriting Upper Body Tilting From Hip Joints
			0x1da84...0x1da84, // Signwriting Location Head Neck
			0x1da9b...0x1da9f, // Signwriting Fill Modifie..Signwriting Fill Modifie
			0x1daa1...0x1daaf, // Signwriting Rotation Mod..Signwriting Rotation Mod
			0x1e000...0x1e006, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e008...0x1e018, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e01b...0x1e021, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e023...0x1e024, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e026...0x1e02a, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e8d0...0x1e8d6, // Mende Kikakui Combining ..Mende Kikakui Combining
			0x1e944...0x1e94a, // Adlam Alif Lengthener   ..Adlam Nukta
			0x1f3fb...0x1f3ff, // Emoji Modifier Fitzpatri..Emoji Modifier Fitzpatri
			0xe0001...0xe0001, // Language Tag
			0xe0020...0xe007f, // Tag Space               ..Cancel Tag
			0xe0100...0xe01ef, // Variation Selector-17   ..Variation Selector-256
			=> true,
			else => false,
		},
		.@"12.0.0" => switch (codepoint) {
			// Source: DerivedGeneralCategory-12.0.0.txt
			// Date: 2019-01-22, 08:18:28 GMT
			0x00000...0x00000, // (nil)
			0x000ad...0x000ad, // Soft Hyphen
			0x00300...0x0036f, // Combining Grave Accent  ..Combining Latin Small Le
			0x00483...0x00489, // Combining Cyrillic Titlo..Combining Cyrillic Milli
			0x00591...0x005bd, // Hebrew Accent Etnahta   ..Hebrew Point Meteg
			0x005bf...0x005bf, // Hebrew Point Rafe
			0x005c1...0x005c2, // Hebrew Point Shin Dot   ..Hebrew Point Sin Dot
			0x005c4...0x005c5, // Hebrew Mark Upper Dot   ..Hebrew Mark Lower Dot
			0x005c7...0x005c7, // Hebrew Point Qamats Qatan
			0x00600...0x00605, // Arabic Number Sign      ..Arabic Number Mark Above
			0x00610...0x0061a, // Arabic Sign Sallallahou ..Arabic Small Kasra
			0x0061c...0x0061c, // Arabic Letter Mark
			0x0064b...0x0065f, // Arabic Fathatan         ..Arabic Wavy Hamza Below
			0x00670...0x00670, // Arabic Letter Superscript Alef
			0x006d6...0x006dd, // Arabic Small High Ligatu..Arabic End Of Ayah
			0x006df...0x006e4, // Arabic Small High Rounde..Arabic Small High Madda
			0x006e7...0x006e8, // Arabic Small High Yeh   ..Arabic Small High Noon
			0x006ea...0x006ed, // Arabic Empty Centre Low ..Arabic Small Low Meem
			0x0070f...0x0070f, // Syriac Abbreviation Mark
			0x00711...0x00711, // Syriac Letter Superscript Alaph
			0x00730...0x0074a, // Syriac Pthaha Above     ..Syriac Barrekh
			0x007a6...0x007b0, // Thaana Abafili          ..Thaana Sukun
			0x007eb...0x007f3, // Nko Combining Short High..Nko Combining Double Dot
			0x007fd...0x007fd, // Nko Dantayalan
			0x00816...0x00819, // Samaritan Mark In       ..Samaritan Mark Dagesh
			0x0081b...0x00823, // Samaritan Mark Epentheti..Samaritan Vowel Sign A
			0x00825...0x00827, // Samaritan Vowel Sign Sho..Samaritan Vowel Sign U
			0x00829...0x0082d, // Samaritan Vowel Sign Lon..Samaritan Mark Nequdaa
			0x00859...0x0085b, // Mandaic Affrication Mark..Mandaic Gemination Mark
			0x008d3...0x00903, // Arabic Small Low Waw    ..Devanagari Sign Visarga
			0x0093a...0x0093c, // Devanagari Vowel Sign Oe..Devanagari Sign Nukta
			0x0093e...0x0094f, // Devanagari Vowel Sign Aa..Devanagari Vowel Sign Aw
			0x00951...0x00957, // Devanagari Stress Sign U..Devanagari Vowel Sign Uu
			0x00962...0x00963, // Devanagari Vowel Sign Vo..Devanagari Vowel Sign Vo
			0x00981...0x00983, // Bengali Sign Candrabindu..Bengali Sign Visarga
			0x009bc...0x009bc, // Bengali Sign Nukta
			0x009be...0x009c4, // Bengali Vowel Sign Aa   ..Bengali Vowel Sign Vocal
			0x009c7...0x009c8, // Bengali Vowel Sign E    ..Bengali Vowel Sign Ai
			0x009cb...0x009cd, // Bengali Vowel Sign O    ..Bengali Sign Virama
			0x009d7...0x009d7, // Bengali Au Length Mark
			0x009e2...0x009e3, // Bengali Vowel Sign Vocal..Bengali Vowel Sign Vocal
			0x009fe...0x009fe, // Bengali Sandhi Mark
			0x00a01...0x00a03, // Gurmukhi Sign Adak Bindi..Gurmukhi Sign Visarga
			0x00a3c...0x00a3c, // Gurmukhi Sign Nukta
			0x00a3e...0x00a42, // Gurmukhi Vowel Sign Aa  ..Gurmukhi Vowel Sign Uu
			0x00a47...0x00a48, // Gurmukhi Vowel Sign Ee  ..Gurmukhi Vowel Sign Ai
			0x00a4b...0x00a4d, // Gurmukhi Vowel Sign Oo  ..Gurmukhi Sign Virama
			0x00a51...0x00a51, // Gurmukhi Sign Udaat
			0x00a70...0x00a71, // Gurmukhi Tippi          ..Gurmukhi Addak
			0x00a75...0x00a75, // Gurmukhi Sign Yakash
			0x00a81...0x00a83, // Gujarati Sign Candrabind..Gujarati Sign Visarga
			0x00abc...0x00abc, // Gujarati Sign Nukta
			0x00abe...0x00ac5, // Gujarati Vowel Sign Aa  ..Gujarati Vowel Sign Cand
			0x00ac7...0x00ac9, // Gujarati Vowel Sign E   ..Gujarati Vowel Sign Cand
			0x00acb...0x00acd, // Gujarati Vowel Sign O   ..Gujarati Sign Virama
			0x00ae2...0x00ae3, // Gujarati Vowel Sign Voca..Gujarati Vowel Sign Voca
			0x00afa...0x00aff, // Gujarati Sign Sukun     ..Gujarati Sign Two-circle
			0x00b01...0x00b03, // Oriya Sign Candrabindu  ..Oriya Sign Visarga
			0x00b3c...0x00b3c, // Oriya Sign Nukta
			0x00b3e...0x00b44, // Oriya Vowel Sign Aa     ..Oriya Vowel Sign Vocalic
			0x00b47...0x00b48, // Oriya Vowel Sign E      ..Oriya Vowel Sign Ai
			0x00b4b...0x00b4d, // Oriya Vowel Sign O      ..Oriya Sign Virama
			0x00b56...0x00b57, // Oriya Ai Length Mark    ..Oriya Au Length Mark
			0x00b62...0x00b63, // Oriya Vowel Sign Vocalic..Oriya Vowel Sign Vocalic
			0x00b82...0x00b82, // Tamil Sign Anusvara
			0x00bbe...0x00bc2, // Tamil Vowel Sign Aa     ..Tamil Vowel Sign Uu
			0x00bc6...0x00bc8, // Tamil Vowel Sign E      ..Tamil Vowel Sign Ai
			0x00bca...0x00bcd, // Tamil Vowel Sign O      ..Tamil Sign Virama
			0x00bd7...0x00bd7, // Tamil Au Length Mark
			0x00c00...0x00c04, // Telugu Sign Combining Ca..Telugu Sign Combining An
			0x00c3e...0x00c44, // Telugu Vowel Sign Aa    ..Telugu Vowel Sign Vocali
			0x00c46...0x00c48, // Telugu Vowel Sign E     ..Telugu Vowel Sign Ai
			0x00c4a...0x00c4d, // Telugu Vowel Sign O     ..Telugu Sign Virama
			0x00c55...0x00c56, // Telugu Length Mark      ..Telugu Ai Length Mark
			0x00c62...0x00c63, // Telugu Vowel Sign Vocali..Telugu Vowel Sign Vocali
			0x00c81...0x00c83, // Kannada Sign Candrabindu..Kannada Sign Visarga
			0x00cbc...0x00cbc, // Kannada Sign Nukta
			0x00cbe...0x00cc4, // Kannada Vowel Sign Aa   ..Kannada Vowel Sign Vocal
			0x00cc6...0x00cc8, // Kannada Vowel Sign E    ..Kannada Vowel Sign Ai
			0x00cca...0x00ccd, // Kannada Vowel Sign O    ..Kannada Sign Virama
			0x00cd5...0x00cd6, // Kannada Length Mark     ..Kannada Ai Length Mark
			0x00ce2...0x00ce3, // Kannada Vowel Sign Vocal..Kannada Vowel Sign Vocal
			0x00d00...0x00d03, // Malayalam Sign Combining..Malayalam Sign Visarga
			0x00d3b...0x00d3c, // Malayalam Sign Vertical ..Malayalam Sign Circular
			0x00d3e...0x00d44, // Malayalam Vowel Sign Aa ..Malayalam Vowel Sign Voc
			0x00d46...0x00d48, // Malayalam Vowel Sign E  ..Malayalam Vowel Sign Ai
			0x00d4a...0x00d4d, // Malayalam Vowel Sign O  ..Malayalam Sign Virama
			0x00d57...0x00d57, // Malayalam Au Length Mark
			0x00d62...0x00d63, // Malayalam Vowel Sign Voc..Malayalam Vowel Sign Voc
			0x00d82...0x00d83, // Sinhala Sign Anusvaraya ..Sinhala Sign Visargaya
			0x00dca...0x00dca, // Sinhala Sign Al-lakuna
			0x00dcf...0x00dd4, // Sinhala Vowel Sign Aela-..Sinhala Vowel Sign Ketti
			0x00dd6...0x00dd6, // Sinhala Vowel Sign Diga Paa-pilla
			0x00dd8...0x00ddf, // Sinhala Vowel Sign Gaett..Sinhala Vowel Sign Gayan
			0x00df2...0x00df3, // Sinhala Vowel Sign Diga ..Sinhala Vowel Sign Diga
			0x00e31...0x00e31, // Thai Character Mai Han-akat
			0x00e34...0x00e3a, // Thai Character Sara I   ..Thai Character Phinthu
			0x00e47...0x00e4e, // Thai Character Maitaikhu..Thai Character Yamakkan
			0x00eb1...0x00eb1, // Lao Vowel Sign Mai Kan
			0x00eb4...0x00ebc, // Lao Vowel Sign I        ..Lao Semivowel Sign Lo
			0x00ec8...0x00ecd, // Lao Tone Mai Ek         ..Lao Niggahita
			0x00f18...0x00f19, // Tibetan Astrological Sig..Tibetan Astrological Sig
			0x00f35...0x00f35, // Tibetan Mark Ngas Bzung Nyi Zla
			0x00f37...0x00f37, // Tibetan Mark Ngas Bzung Sgor Rtags
			0x00f39...0x00f39, // Tibetan Mark Tsa -phru
			0x00f3e...0x00f3f, // Tibetan Sign Yar Tshes  ..Tibetan Sign Mar Tshes
			0x00f71...0x00f84, // Tibetan Vowel Sign Aa   ..Tibetan Mark Halanta
			0x00f86...0x00f87, // Tibetan Sign Lci Rtags  ..Tibetan Sign Yang Rtags
			0x00f8d...0x00f97, // Tibetan Subjoined Sign L..Tibetan Subjoined Letter
			0x00f99...0x00fbc, // Tibetan Subjoined Letter..Tibetan Subjoined Letter
			0x00fc6...0x00fc6, // Tibetan Symbol Padma Gdan
			0x0102b...0x0103e, // Myanmar Vowel Sign Tall ..Myanmar Consonant Sign M
			0x01056...0x01059, // Myanmar Vowel Sign Vocal..Myanmar Vowel Sign Vocal
			0x0105e...0x01060, // Myanmar Consonant Sign M..Myanmar Consonant Sign M
			0x01062...0x01064, // Myanmar Vowel Sign Sgaw ..Myanmar Tone Mark Sgaw K
			0x01067...0x0106d, // Myanmar Vowel Sign Weste..Myanmar Sign Western Pwo
			0x01071...0x01074, // Myanmar Vowel Sign Geba ..Myanmar Vowel Sign Kayah
			0x01082...0x0108d, // Myanmar Consonant Sign S..Myanmar Sign Shan Counci
			0x0108f...0x0108f, // Myanmar Sign Rumai Palaung Tone-5
			0x0109a...0x0109d, // Myanmar Sign Khamti Tone..Myanmar Vowel Sign Aiton
			0x01160...0x011ff, // Hangul Jungseong Filler ..Hangul Jongseong Ssangni
			0x0135d...0x0135f, // Ethiopic Combining Gemin..Ethiopic Combining Gemin
			0x01712...0x01714, // Tagalog Vowel Sign I    ..Tagalog Sign Virama
			0x01732...0x01734, // Hanunoo Vowel Sign I    ..Hanunoo Sign Pamudpod
			0x01752...0x01753, // Buhid Vowel Sign I      ..Buhid Vowel Sign U
			0x01772...0x01773, // Tagbanwa Vowel Sign I   ..Tagbanwa Vowel Sign U
			0x017b4...0x017d3, // Khmer Vowel Inherent Aq ..Khmer Sign Bathamasat
			0x017dd...0x017dd, // Khmer Sign Atthacan
			0x0180b...0x0180e, // Mongolian Free Variation..Mongolian Vowel Separato
			0x01885...0x01886, // Mongolian Letter Ali Gal..Mongolian Letter Ali Gal
			0x018a9...0x018a9, // Mongolian Letter Ali Gali Dagalga
			0x01920...0x0192b, // Limbu Vowel Sign A      ..Limbu Subjoined Letter W
			0x01930...0x0193b, // Limbu Small Letter Ka   ..Limbu Sign Sa-i
			0x01a17...0x01a1b, // Buginese Vowel Sign I   ..Buginese Vowel Sign Ae
			0x01a55...0x01a5e, // Tai Tham Consonant Sign ..Tai Tham Consonant Sign
			0x01a60...0x01a7c, // Tai Tham Sign Sakot     ..Tai Tham Sign Khuen-lue
			0x01a7f...0x01a7f, // Tai Tham Combining Cryptogrammic Dot
			0x01ab0...0x01abe, // Combining Doubled Circum..Combining Parentheses Ov
			0x01b00...0x01b04, // Balinese Sign Ulu Ricem ..Balinese Sign Bisah
			0x01b34...0x01b44, // Balinese Sign Rerekan   ..Balinese Adeg Adeg
			0x01b6b...0x01b73, // Balinese Musical Symbol ..Balinese Musical Symbol
			0x01b80...0x01b82, // Sundanese Sign Panyecek ..Sundanese Sign Pangwisad
			0x01ba1...0x01bad, // Sundanese Consonant Sign..Sundanese Consonant Sign
			0x01be6...0x01bf3, // Batak Sign Tompi        ..Batak Panongonan
			0x01c24...0x01c37, // Lepcha Subjoined Letter ..Lepcha Sign Nukta
			0x01cd0...0x01cd2, // Vedic Tone Karshana     ..Vedic Tone Prenkha
			0x01cd4...0x01ce8, // Vedic Sign Yajurvedic Mi..Vedic Sign Visarga Anuda
			0x01ced...0x01ced, // Vedic Sign Tiryak
			0x01cf4...0x01cf4, // Vedic Tone Candra Above
			0x01cf7...0x01cf9, // Vedic Sign Atikrama     ..Vedic Tone Double Ring A
			0x01dc0...0x01df9, // Combining Dotted Grave A..Combining Wide Inverted
			0x01dfb...0x01dff, // Combining Deletion Mark ..Combining Right Arrowhea
			0x0200b...0x0200f, // Zero Width Space        ..Right-to-left Mark
			0x02028...0x0202e, // Line Separator          ..Right-to-left Override
			0x02060...0x02064, // Word Joiner             ..Invisible Plus
			0x02066...0x0206f, // Left-to-right Isolate   ..Nominal Digit Shapes
			0x020d0...0x020f0, // Combining Left Harpoon A..Combining Asterisk Above
			0x02cef...0x02cf1, // Coptic Combining Ni Abov..Coptic Combining Spiritu
			0x02d7f...0x02d7f, // Tifinagh Consonant Joiner
			0x02de0...0x02dff, // Combining Cyrillic Lette..Combining Cyrillic Lette
			0x0302a...0x0302f, // Ideographic Level Tone M..Hangul Double Dot Tone M
			0x03099...0x0309a, // Combining Katakana-hirag..Combining Katakana-hirag
			0x0a66f...0x0a672, // Combining Cyrillic Vzmet..Combining Cyrillic Thous
			0x0a674...0x0a67d, // Combining Cyrillic Lette..Combining Cyrillic Payer
			0x0a69e...0x0a69f, // Combining Cyrillic Lette..Combining Cyrillic Lette
			0x0a6f0...0x0a6f1, // Bamum Combining Mark Koq..Bamum Combining Mark Tuk
			0x0a802...0x0a802, // Syloti Nagri Sign Dvisvara
			0x0a806...0x0a806, // Syloti Nagri Sign Hasanta
			0x0a80b...0x0a80b, // Syloti Nagri Sign Anusvara
			0x0a823...0x0a827, // Syloti Nagri Vowel Sign ..Syloti Nagri Vowel Sign
			0x0a880...0x0a881, // Saurashtra Sign Anusvara..Saurashtra Sign Visarga
			0x0a8b4...0x0a8c5, // Saurashtra Consonant Sig..Saurashtra Sign Candrabi
			0x0a8e0...0x0a8f1, // Combining Devanagari Dig..Combining Devanagari Sig
			0x0a8ff...0x0a8ff, // Devanagari Vowel Sign Ay
			0x0a926...0x0a92d, // Kayah Li Vowel Ue       ..Kayah Li Tone Calya Plop
			0x0a947...0x0a953, // Rejang Vowel Sign I     ..Rejang Virama
			0x0a980...0x0a983, // Javanese Sign Panyangga ..Javanese Sign Wignyan
			0x0a9b3...0x0a9c0, // Javanese Sign Cecak Telu..Javanese Pangkon
			0x0a9e5...0x0a9e5, // Myanmar Sign Shan Saw
			0x0aa29...0x0aa36, // Cham Vowel Sign Aa      ..Cham Consonant Sign Wa
			0x0aa43...0x0aa43, // Cham Consonant Sign Final Ng
			0x0aa4c...0x0aa4d, // Cham Consonant Sign Fina..Cham Consonant Sign Fina
			0x0aa7b...0x0aa7d, // Myanmar Sign Pao Karen T..Myanmar Sign Tai Laing T
			0x0aab0...0x0aab0, // Tai Viet Mai Kang
			0x0aab2...0x0aab4, // Tai Viet Vowel I        ..Tai Viet Vowel U
			0x0aab7...0x0aab8, // Tai Viet Mai Khit       ..Tai Viet Vowel Ia
			0x0aabe...0x0aabf, // Tai Viet Vowel Am       ..Tai Viet Tone Mai Ek
			0x0aac1...0x0aac1, // Tai Viet Tone Mai Tho
			0x0aaeb...0x0aaef, // Meetei Mayek Vowel Sign ..Meetei Mayek Vowel Sign
			0x0aaf5...0x0aaf6, // Meetei Mayek Vowel Sign ..Meetei Mayek Virama
			0x0abe3...0x0abea, // Meetei Mayek Vowel Sign ..Meetei Mayek Vowel Sign
			0x0abec...0x0abed, // Meetei Mayek Lum Iyek   ..Meetei Mayek Apun Iyek
			0x0d7b0...0x0d7ff, // Hangul Jungseong O-yeo  ..(nil)
			0x0fb1e...0x0fb1e, // Hebrew Point Judeo-spanish Varika
			0x0fe00...0x0fe0f, // Variation Selector-1    ..Variation Selector-16
			0x0fe20...0x0fe2f, // Combining Ligature Left ..Combining Cyrillic Titlo
			0x0feff...0x0feff, // Zero Width No-break Space
			0x0fff9...0x0fffb, // Interlinear Annotation A..Interlinear Annotation T
			0x101fd...0x101fd, // Phaistos Disc Sign Combining Oblique Stroke
			0x102e0...0x102e0, // Coptic Epact Thousands Mark
			0x10376...0x1037a, // Combining Old Permic Let..Combining Old Permic Let
			0x10a01...0x10a03, // Kharoshthi Vowel Sign I ..Kharoshthi Vowel Sign Vo
			0x10a05...0x10a06, // Kharoshthi Vowel Sign E ..Kharoshthi Vowel Sign O
			0x10a0c...0x10a0f, // Kharoshthi Vowel Length ..Kharoshthi Sign Visarga
			0x10a38...0x10a3a, // Kharoshthi Sign Bar Abov..Kharoshthi Sign Dot Belo
			0x10a3f...0x10a3f, // Kharoshthi Virama
			0x10ae5...0x10ae6, // Manichaean Abbreviation ..Manichaean Abbreviation
			0x10d24...0x10d27, // Hanifi Rohingya Sign Har..Hanifi Rohingya Sign Tas
			0x10f46...0x10f50, // Sogdian Combining Dot Be..Sogdian Combining Stroke
			0x11000...0x11002, // Brahmi Sign Candrabindu ..Brahmi Sign Visarga
			0x11038...0x11046, // Brahmi Vowel Sign Aa    ..Brahmi Virama
			0x1107f...0x11082, // Brahmi Number Joiner    ..Kaithi Sign Visarga
			0x110b0...0x110ba, // Kaithi Vowel Sign Aa    ..Kaithi Sign Nukta
			0x110bd...0x110bd, // Kaithi Number Sign
			0x110cd...0x110cd, // Kaithi Number Sign Above
			0x11100...0x11102, // Chakma Sign Candrabindu ..Chakma Sign Visarga
			0x11127...0x11134, // Chakma Vowel Sign A     ..Chakma Maayyaa
			0x11145...0x11146, // Chakma Vowel Sign Aa    ..Chakma Vowel Sign Ei
			0x11173...0x11173, // Mahajani Sign Nukta
			0x11180...0x11182, // Sharada Sign Candrabindu..Sharada Sign Visarga
			0x111b3...0x111c0, // Sharada Vowel Sign Aa   ..Sharada Sign Virama
			0x111c9...0x111cc, // Sharada Sandhi Mark     ..Sharada Extra Short Vowe
			0x1122c...0x11237, // Khojki Vowel Sign Aa    ..Khojki Sign Shadda
			0x1123e...0x1123e, // Khojki Sign Sukun
			0x112df...0x112ea, // Khudawadi Sign Anusvara ..Khudawadi Sign Virama
			0x11300...0x11303, // Grantha Sign Combining A..Grantha Sign Visarga
			0x1133b...0x1133c, // Combining Bindu Below   ..Grantha Sign Nukta
			0x1133e...0x11344, // Grantha Vowel Sign Aa   ..Grantha Vowel Sign Vocal
			0x11347...0x11348, // Grantha Vowel Sign Ee   ..Grantha Vowel Sign Ai
			0x1134b...0x1134d, // Grantha Vowel Sign Oo   ..Grantha Sign Virama
			0x11357...0x11357, // Grantha Au Length Mark
			0x11362...0x11363, // Grantha Vowel Sign Vocal..Grantha Vowel Sign Vocal
			0x11366...0x1136c, // Combining Grantha Digit ..Combining Grantha Digit
			0x11370...0x11374, // Combining Grantha Letter..Combining Grantha Letter
			0x11435...0x11446, // Newa Vowel Sign Aa      ..Newa Sign Nukta
			0x1145e...0x1145e, // Newa Sandhi Mark
			0x114b0...0x114c3, // Tirhuta Vowel Sign Aa   ..Tirhuta Sign Nukta
			0x115af...0x115b5, // Siddham Vowel Sign Aa   ..Siddham Vowel Sign Vocal
			0x115b8...0x115c0, // Siddham Vowel Sign E    ..Siddham Sign Nukta
			0x115dc...0x115dd, // Siddham Vowel Sign Alter..Siddham Vowel Sign Alter
			0x11630...0x11640, // Modi Vowel Sign Aa      ..Modi Sign Ardhacandra
			0x116ab...0x116b7, // Takri Sign Anusvara     ..Takri Sign Nukta
			0x1171d...0x1172b, // Ahom Consonant Sign Medi..Ahom Sign Killer
			0x1182c...0x1183a, // Dogra Vowel Sign Aa     ..Dogra Sign Nukta
			0x119d1...0x119d7, // Nandinagari Vowel Sign A..Nandinagari Vowel Sign V
			0x119da...0x119e0, // Nandinagari Vowel Sign E..Nandinagari Sign Virama
			0x119e4...0x119e4, // Nandinagari Vowel Sign Prishthamatra E
			0x11a01...0x11a0a, // Zanabazar Square Vowel S..Zanabazar Square Vowel L
			0x11a33...0x11a39, // Zanabazar Square Final C..Zanabazar Square Sign Vi
			0x11a3b...0x11a3e, // Zanabazar Square Cluster..Zanabazar Square Cluster
			0x11a47...0x11a47, // Zanabazar Square Subjoiner
			0x11a51...0x11a5b, // Soyombo Vowel Sign I    ..Soyombo Vowel Length Mar
			0x11a8a...0x11a99, // Soyombo Final Consonant ..Soyombo Subjoiner
			0x11c2f...0x11c36, // Bhaiksuki Vowel Sign Aa ..Bhaiksuki Vowel Sign Voc
			0x11c38...0x11c3f, // Bhaiksuki Vowel Sign E  ..Bhaiksuki Sign Virama
			0x11c92...0x11ca7, // Marchen Subjoined Letter..Marchen Subjoined Letter
			0x11ca9...0x11cb6, // Marchen Subjoined Letter..Marchen Sign Candrabindu
			0x11d31...0x11d36, // Masaram Gondi Vowel Sign..Masaram Gondi Vowel Sign
			0x11d3a...0x11d3a, // Masaram Gondi Vowel Sign E
			0x11d3c...0x11d3d, // Masaram Gondi Vowel Sign..Masaram Gondi Vowel Sign
			0x11d3f...0x11d45, // Masaram Gondi Vowel Sign..Masaram Gondi Virama
			0x11d47...0x11d47, // Masaram Gondi Ra-kara
			0x11d8a...0x11d8e, // Gunjala Gondi Vowel Sign..Gunjala Gondi Vowel Sign
			0x11d90...0x11d91, // Gunjala Gondi Vowel Sign..Gunjala Gondi Vowel Sign
			0x11d93...0x11d97, // Gunjala Gondi Vowel Sign..Gunjala Gondi Virama
			0x11ef3...0x11ef6, // Makasar Vowel Sign I    ..Makasar Vowel Sign O
			0x13430...0x13438, // Egyptian Hieroglyph Vert..Egyptian Hieroglyph End
			0x16af0...0x16af4, // Bassa Vah Combining High..Bassa Vah Combining High
			0x16b30...0x16b36, // Pahawh Hmong Mark Cim Tu..Pahawh Hmong Mark Cim Ta
			0x16f4f...0x16f4f, // Miao Sign Consonant Modifier Bar
			0x16f51...0x16f87, // Miao Sign Aspiration    ..Miao Vowel Sign Ui
			0x16f8f...0x16f92, // Miao Tone Right         ..Miao Tone Below
			0x1bc9d...0x1bc9e, // Duployan Thick Letter Se..Duployan Double Mark
			0x1bca0...0x1bca3, // Shorthand Format Letter ..Shorthand Format Up Step
			0x1d165...0x1d169, // Musical Symbol Combining..Musical Symbol Combining
			0x1d16d...0x1d182, // Musical Symbol Combining..Musical Symbol Combining
			0x1d185...0x1d18b, // Musical Symbol Combining..Musical Symbol Combining
			0x1d1aa...0x1d1ad, // Musical Symbol Combining..Musical Symbol Combining
			0x1d242...0x1d244, // Combining Greek Musical ..Combining Greek Musical
			0x1da00...0x1da36, // Signwriting Head Rim    ..Signwriting Air Sucking
			0x1da3b...0x1da6c, // Signwriting Mouth Closed..Signwriting Excitement
			0x1da75...0x1da75, // Signwriting Upper Body Tilting From Hip Joints
			0x1da84...0x1da84, // Signwriting Location Head Neck
			0x1da9b...0x1da9f, // Signwriting Fill Modifie..Signwriting Fill Modifie
			0x1daa1...0x1daaf, // Signwriting Rotation Mod..Signwriting Rotation Mod
			0x1e000...0x1e006, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e008...0x1e018, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e01b...0x1e021, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e023...0x1e024, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e026...0x1e02a, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e130...0x1e136, // Nyiakeng Puachue Hmong T..Nyiakeng Puachue Hmong T
			0x1e2ec...0x1e2ef, // Wancho Tone Tup         ..Wancho Tone Koini
			0x1e8d0...0x1e8d6, // Mende Kikakui Combining ..Mende Kikakui Combining
			0x1e944...0x1e94a, // Adlam Alif Lengthener   ..Adlam Nukta
			0x1f3fb...0x1f3ff, // Emoji Modifier Fitzpatri..Emoji Modifier Fitzpatri
			0xe0001...0xe0001, // Language Tag
			0xe0020...0xe007f, // Tag Space               ..Cancel Tag
			0xe0100...0xe01ef, // Variation Selector-17   ..Variation Selector-256
			=> true,
			else => false,
		},
		.@"12.1.0" => switch (codepoint) {
			// Source: DerivedGeneralCategory-12.1.0.txt
			// Date: 2019-03-10, 10:53:08 GMT
			0x00000...0x00000, // (nil)
			0x000ad...0x000ad, // Soft Hyphen
			0x00300...0x0036f, // Combining Grave Accent  ..Combining Latin Small Le
			0x00483...0x00489, // Combining Cyrillic Titlo..Combining Cyrillic Milli
			0x00591...0x005bd, // Hebrew Accent Etnahta   ..Hebrew Point Meteg
			0x005bf...0x005bf, // Hebrew Point Rafe
			0x005c1...0x005c2, // Hebrew Point Shin Dot   ..Hebrew Point Sin Dot
			0x005c4...0x005c5, // Hebrew Mark Upper Dot   ..Hebrew Mark Lower Dot
			0x005c7...0x005c7, // Hebrew Point Qamats Qatan
			0x00600...0x00605, // Arabic Number Sign      ..Arabic Number Mark Above
			0x00610...0x0061a, // Arabic Sign Sallallahou ..Arabic Small Kasra
			0x0061c...0x0061c, // Arabic Letter Mark
			0x0064b...0x0065f, // Arabic Fathatan         ..Arabic Wavy Hamza Below
			0x00670...0x00670, // Arabic Letter Superscript Alef
			0x006d6...0x006dd, // Arabic Small High Ligatu..Arabic End Of Ayah
			0x006df...0x006e4, // Arabic Small High Rounde..Arabic Small High Madda
			0x006e7...0x006e8, // Arabic Small High Yeh   ..Arabic Small High Noon
			0x006ea...0x006ed, // Arabic Empty Centre Low ..Arabic Small Low Meem
			0x0070f...0x0070f, // Syriac Abbreviation Mark
			0x00711...0x00711, // Syriac Letter Superscript Alaph
			0x00730...0x0074a, // Syriac Pthaha Above     ..Syriac Barrekh
			0x007a6...0x007b0, // Thaana Abafili          ..Thaana Sukun
			0x007eb...0x007f3, // Nko Combining Short High..Nko Combining Double Dot
			0x007fd...0x007fd, // Nko Dantayalan
			0x00816...0x00819, // Samaritan Mark In       ..Samaritan Mark Dagesh
			0x0081b...0x00823, // Samaritan Mark Epentheti..Samaritan Vowel Sign A
			0x00825...0x00827, // Samaritan Vowel Sign Sho..Samaritan Vowel Sign U
			0x00829...0x0082d, // Samaritan Vowel Sign Lon..Samaritan Mark Nequdaa
			0x00859...0x0085b, // Mandaic Affrication Mark..Mandaic Gemination Mark
			0x008d3...0x00903, // Arabic Small Low Waw    ..Devanagari Sign Visarga
			0x0093a...0x0093c, // Devanagari Vowel Sign Oe..Devanagari Sign Nukta
			0x0093e...0x0094f, // Devanagari Vowel Sign Aa..Devanagari Vowel Sign Aw
			0x00951...0x00957, // Devanagari Stress Sign U..Devanagari Vowel Sign Uu
			0x00962...0x00963, // Devanagari Vowel Sign Vo..Devanagari Vowel Sign Vo
			0x00981...0x00983, // Bengali Sign Candrabindu..Bengali Sign Visarga
			0x009bc...0x009bc, // Bengali Sign Nukta
			0x009be...0x009c4, // Bengali Vowel Sign Aa   ..Bengali Vowel Sign Vocal
			0x009c7...0x009c8, // Bengali Vowel Sign E    ..Bengali Vowel Sign Ai
			0x009cb...0x009cd, // Bengali Vowel Sign O    ..Bengali Sign Virama
			0x009d7...0x009d7, // Bengali Au Length Mark
			0x009e2...0x009e3, // Bengali Vowel Sign Vocal..Bengali Vowel Sign Vocal
			0x009fe...0x009fe, // Bengali Sandhi Mark
			0x00a01...0x00a03, // Gurmukhi Sign Adak Bindi..Gurmukhi Sign Visarga
			0x00a3c...0x00a3c, // Gurmukhi Sign Nukta
			0x00a3e...0x00a42, // Gurmukhi Vowel Sign Aa  ..Gurmukhi Vowel Sign Uu
			0x00a47...0x00a48, // Gurmukhi Vowel Sign Ee  ..Gurmukhi Vowel Sign Ai
			0x00a4b...0x00a4d, // Gurmukhi Vowel Sign Oo  ..Gurmukhi Sign Virama
			0x00a51...0x00a51, // Gurmukhi Sign Udaat
			0x00a70...0x00a71, // Gurmukhi Tippi          ..Gurmukhi Addak
			0x00a75...0x00a75, // Gurmukhi Sign Yakash
			0x00a81...0x00a83, // Gujarati Sign Candrabind..Gujarati Sign Visarga
			0x00abc...0x00abc, // Gujarati Sign Nukta
			0x00abe...0x00ac5, // Gujarati Vowel Sign Aa  ..Gujarati Vowel Sign Cand
			0x00ac7...0x00ac9, // Gujarati Vowel Sign E   ..Gujarati Vowel Sign Cand
			0x00acb...0x00acd, // Gujarati Vowel Sign O   ..Gujarati Sign Virama
			0x00ae2...0x00ae3, // Gujarati Vowel Sign Voca..Gujarati Vowel Sign Voca
			0x00afa...0x00aff, // Gujarati Sign Sukun     ..Gujarati Sign Two-circle
			0x00b01...0x00b03, // Oriya Sign Candrabindu  ..Oriya Sign Visarga
			0x00b3c...0x00b3c, // Oriya Sign Nukta
			0x00b3e...0x00b44, // Oriya Vowel Sign Aa     ..Oriya Vowel Sign Vocalic
			0x00b47...0x00b48, // Oriya Vowel Sign E      ..Oriya Vowel Sign Ai
			0x00b4b...0x00b4d, // Oriya Vowel Sign O      ..Oriya Sign Virama
			0x00b56...0x00b57, // Oriya Ai Length Mark    ..Oriya Au Length Mark
			0x00b62...0x00b63, // Oriya Vowel Sign Vocalic..Oriya Vowel Sign Vocalic
			0x00b82...0x00b82, // Tamil Sign Anusvara
			0x00bbe...0x00bc2, // Tamil Vowel Sign Aa     ..Tamil Vowel Sign Uu
			0x00bc6...0x00bc8, // Tamil Vowel Sign E      ..Tamil Vowel Sign Ai
			0x00bca...0x00bcd, // Tamil Vowel Sign O      ..Tamil Sign Virama
			0x00bd7...0x00bd7, // Tamil Au Length Mark
			0x00c00...0x00c04, // Telugu Sign Combining Ca..Telugu Sign Combining An
			0x00c3e...0x00c44, // Telugu Vowel Sign Aa    ..Telugu Vowel Sign Vocali
			0x00c46...0x00c48, // Telugu Vowel Sign E     ..Telugu Vowel Sign Ai
			0x00c4a...0x00c4d, // Telugu Vowel Sign O     ..Telugu Sign Virama
			0x00c55...0x00c56, // Telugu Length Mark      ..Telugu Ai Length Mark
			0x00c62...0x00c63, // Telugu Vowel Sign Vocali..Telugu Vowel Sign Vocali
			0x00c81...0x00c83, // Kannada Sign Candrabindu..Kannada Sign Visarga
			0x00cbc...0x00cbc, // Kannada Sign Nukta
			0x00cbe...0x00cc4, // Kannada Vowel Sign Aa   ..Kannada Vowel Sign Vocal
			0x00cc6...0x00cc8, // Kannada Vowel Sign E    ..Kannada Vowel Sign Ai
			0x00cca...0x00ccd, // Kannada Vowel Sign O    ..Kannada Sign Virama
			0x00cd5...0x00cd6, // Kannada Length Mark     ..Kannada Ai Length Mark
			0x00ce2...0x00ce3, // Kannada Vowel Sign Vocal..Kannada Vowel Sign Vocal
			0x00d00...0x00d03, // Malayalam Sign Combining..Malayalam Sign Visarga
			0x00d3b...0x00d3c, // Malayalam Sign Vertical ..Malayalam Sign Circular
			0x00d3e...0x00d44, // Malayalam Vowel Sign Aa ..Malayalam Vowel Sign Voc
			0x00d46...0x00d48, // Malayalam Vowel Sign E  ..Malayalam Vowel Sign Ai
			0x00d4a...0x00d4d, // Malayalam Vowel Sign O  ..Malayalam Sign Virama
			0x00d57...0x00d57, // Malayalam Au Length Mark
			0x00d62...0x00d63, // Malayalam Vowel Sign Voc..Malayalam Vowel Sign Voc
			0x00d82...0x00d83, // Sinhala Sign Anusvaraya ..Sinhala Sign Visargaya
			0x00dca...0x00dca, // Sinhala Sign Al-lakuna
			0x00dcf...0x00dd4, // Sinhala Vowel Sign Aela-..Sinhala Vowel Sign Ketti
			0x00dd6...0x00dd6, // Sinhala Vowel Sign Diga Paa-pilla
			0x00dd8...0x00ddf, // Sinhala Vowel Sign Gaett..Sinhala Vowel Sign Gayan
			0x00df2...0x00df3, // Sinhala Vowel Sign Diga ..Sinhala Vowel Sign Diga
			0x00e31...0x00e31, // Thai Character Mai Han-akat
			0x00e34...0x00e3a, // Thai Character Sara I   ..Thai Character Phinthu
			0x00e47...0x00e4e, // Thai Character Maitaikhu..Thai Character Yamakkan
			0x00eb1...0x00eb1, // Lao Vowel Sign Mai Kan
			0x00eb4...0x00ebc, // Lao Vowel Sign I        ..Lao Semivowel Sign Lo
			0x00ec8...0x00ecd, // Lao Tone Mai Ek         ..Lao Niggahita
			0x00f18...0x00f19, // Tibetan Astrological Sig..Tibetan Astrological Sig
			0x00f35...0x00f35, // Tibetan Mark Ngas Bzung Nyi Zla
			0x00f37...0x00f37, // Tibetan Mark Ngas Bzung Sgor Rtags
			0x00f39...0x00f39, // Tibetan Mark Tsa -phru
			0x00f3e...0x00f3f, // Tibetan Sign Yar Tshes  ..Tibetan Sign Mar Tshes
			0x00f71...0x00f84, // Tibetan Vowel Sign Aa   ..Tibetan Mark Halanta
			0x00f86...0x00f87, // Tibetan Sign Lci Rtags  ..Tibetan Sign Yang Rtags
			0x00f8d...0x00f97, // Tibetan Subjoined Sign L..Tibetan Subjoined Letter
			0x00f99...0x00fbc, // Tibetan Subjoined Letter..Tibetan Subjoined Letter
			0x00fc6...0x00fc6, // Tibetan Symbol Padma Gdan
			0x0102b...0x0103e, // Myanmar Vowel Sign Tall ..Myanmar Consonant Sign M
			0x01056...0x01059, // Myanmar Vowel Sign Vocal..Myanmar Vowel Sign Vocal
			0x0105e...0x01060, // Myanmar Consonant Sign M..Myanmar Consonant Sign M
			0x01062...0x01064, // Myanmar Vowel Sign Sgaw ..Myanmar Tone Mark Sgaw K
			0x01067...0x0106d, // Myanmar Vowel Sign Weste..Myanmar Sign Western Pwo
			0x01071...0x01074, // Myanmar Vowel Sign Geba ..Myanmar Vowel Sign Kayah
			0x01082...0x0108d, // Myanmar Consonant Sign S..Myanmar Sign Shan Counci
			0x0108f...0x0108f, // Myanmar Sign Rumai Palaung Tone-5
			0x0109a...0x0109d, // Myanmar Sign Khamti Tone..Myanmar Vowel Sign Aiton
			0x01160...0x011ff, // Hangul Jungseong Filler ..Hangul Jongseong Ssangni
			0x0135d...0x0135f, // Ethiopic Combining Gemin..Ethiopic Combining Gemin
			0x01712...0x01714, // Tagalog Vowel Sign I    ..Tagalog Sign Virama
			0x01732...0x01734, // Hanunoo Vowel Sign I    ..Hanunoo Sign Pamudpod
			0x01752...0x01753, // Buhid Vowel Sign I      ..Buhid Vowel Sign U
			0x01772...0x01773, // Tagbanwa Vowel Sign I   ..Tagbanwa Vowel Sign U
			0x017b4...0x017d3, // Khmer Vowel Inherent Aq ..Khmer Sign Bathamasat
			0x017dd...0x017dd, // Khmer Sign Atthacan
			0x0180b...0x0180e, // Mongolian Free Variation..Mongolian Vowel Separato
			0x01885...0x01886, // Mongolian Letter Ali Gal..Mongolian Letter Ali Gal
			0x018a9...0x018a9, // Mongolian Letter Ali Gali Dagalga
			0x01920...0x0192b, // Limbu Vowel Sign A      ..Limbu Subjoined Letter W
			0x01930...0x0193b, // Limbu Small Letter Ka   ..Limbu Sign Sa-i
			0x01a17...0x01a1b, // Buginese Vowel Sign I   ..Buginese Vowel Sign Ae
			0x01a55...0x01a5e, // Tai Tham Consonant Sign ..Tai Tham Consonant Sign
			0x01a60...0x01a7c, // Tai Tham Sign Sakot     ..Tai Tham Sign Khuen-lue
			0x01a7f...0x01a7f, // Tai Tham Combining Cryptogrammic Dot
			0x01ab0...0x01abe, // Combining Doubled Circum..Combining Parentheses Ov
			0x01b00...0x01b04, // Balinese Sign Ulu Ricem ..Balinese Sign Bisah
			0x01b34...0x01b44, // Balinese Sign Rerekan   ..Balinese Adeg Adeg
			0x01b6b...0x01b73, // Balinese Musical Symbol ..Balinese Musical Symbol
			0x01b80...0x01b82, // Sundanese Sign Panyecek ..Sundanese Sign Pangwisad
			0x01ba1...0x01bad, // Sundanese Consonant Sign..Sundanese Consonant Sign
			0x01be6...0x01bf3, // Batak Sign Tompi        ..Batak Panongonan
			0x01c24...0x01c37, // Lepcha Subjoined Letter ..Lepcha Sign Nukta
			0x01cd0...0x01cd2, // Vedic Tone Karshana     ..Vedic Tone Prenkha
			0x01cd4...0x01ce8, // Vedic Sign Yajurvedic Mi..Vedic Sign Visarga Anuda
			0x01ced...0x01ced, // Vedic Sign Tiryak
			0x01cf4...0x01cf4, // Vedic Tone Candra Above
			0x01cf7...0x01cf9, // Vedic Sign Atikrama     ..Vedic Tone Double Ring A
			0x01dc0...0x01df9, // Combining Dotted Grave A..Combining Wide Inverted
			0x01dfb...0x01dff, // Combining Deletion Mark ..Combining Right Arrowhea
			0x0200b...0x0200f, // Zero Width Space        ..Right-to-left Mark
			0x02028...0x0202e, // Line Separator          ..Right-to-left Override
			0x02060...0x02064, // Word Joiner             ..Invisible Plus
			0x02066...0x0206f, // Left-to-right Isolate   ..Nominal Digit Shapes
			0x020d0...0x020f0, // Combining Left Harpoon A..Combining Asterisk Above
			0x02cef...0x02cf1, // Coptic Combining Ni Abov..Coptic Combining Spiritu
			0x02d7f...0x02d7f, // Tifinagh Consonant Joiner
			0x02de0...0x02dff, // Combining Cyrillic Lette..Combining Cyrillic Lette
			0x0302a...0x0302f, // Ideographic Level Tone M..Hangul Double Dot Tone M
			0x03099...0x0309a, // Combining Katakana-hirag..Combining Katakana-hirag
			0x0a66f...0x0a672, // Combining Cyrillic Vzmet..Combining Cyrillic Thous
			0x0a674...0x0a67d, // Combining Cyrillic Lette..Combining Cyrillic Payer
			0x0a69e...0x0a69f, // Combining Cyrillic Lette..Combining Cyrillic Lette
			0x0a6f0...0x0a6f1, // Bamum Combining Mark Koq..Bamum Combining Mark Tuk
			0x0a802...0x0a802, // Syloti Nagri Sign Dvisvara
			0x0a806...0x0a806, // Syloti Nagri Sign Hasanta
			0x0a80b...0x0a80b, // Syloti Nagri Sign Anusvara
			0x0a823...0x0a827, // Syloti Nagri Vowel Sign ..Syloti Nagri Vowel Sign
			0x0a880...0x0a881, // Saurashtra Sign Anusvara..Saurashtra Sign Visarga
			0x0a8b4...0x0a8c5, // Saurashtra Consonant Sig..Saurashtra Sign Candrabi
			0x0a8e0...0x0a8f1, // Combining Devanagari Dig..Combining Devanagari Sig
			0x0a8ff...0x0a8ff, // Devanagari Vowel Sign Ay
			0x0a926...0x0a92d, // Kayah Li Vowel Ue       ..Kayah Li Tone Calya Plop
			0x0a947...0x0a953, // Rejang Vowel Sign I     ..Rejang Virama
			0x0a980...0x0a983, // Javanese Sign Panyangga ..Javanese Sign Wignyan
			0x0a9b3...0x0a9c0, // Javanese Sign Cecak Telu..Javanese Pangkon
			0x0a9e5...0x0a9e5, // Myanmar Sign Shan Saw
			0x0aa29...0x0aa36, // Cham Vowel Sign Aa      ..Cham Consonant Sign Wa
			0x0aa43...0x0aa43, // Cham Consonant Sign Final Ng
			0x0aa4c...0x0aa4d, // Cham Consonant Sign Fina..Cham Consonant Sign Fina
			0x0aa7b...0x0aa7d, // Myanmar Sign Pao Karen T..Myanmar Sign Tai Laing T
			0x0aab0...0x0aab0, // Tai Viet Mai Kang
			0x0aab2...0x0aab4, // Tai Viet Vowel I        ..Tai Viet Vowel U
			0x0aab7...0x0aab8, // Tai Viet Mai Khit       ..Tai Viet Vowel Ia
			0x0aabe...0x0aabf, // Tai Viet Vowel Am       ..Tai Viet Tone Mai Ek
			0x0aac1...0x0aac1, // Tai Viet Tone Mai Tho
			0x0aaeb...0x0aaef, // Meetei Mayek Vowel Sign ..Meetei Mayek Vowel Sign
			0x0aaf5...0x0aaf6, // Meetei Mayek Vowel Sign ..Meetei Mayek Virama
			0x0abe3...0x0abea, // Meetei Mayek Vowel Sign ..Meetei Mayek Vowel Sign
			0x0abec...0x0abed, // Meetei Mayek Lum Iyek   ..Meetei Mayek Apun Iyek
			0x0d7b0...0x0d7ff, // Hangul Jungseong O-yeo  ..(nil)
			0x0fb1e...0x0fb1e, // Hebrew Point Judeo-spanish Varika
			0x0fe00...0x0fe0f, // Variation Selector-1    ..Variation Selector-16
			0x0fe20...0x0fe2f, // Combining Ligature Left ..Combining Cyrillic Titlo
			0x0feff...0x0feff, // Zero Width No-break Space
			0x0fff9...0x0fffb, // Interlinear Annotation A..Interlinear Annotation T
			0x101fd...0x101fd, // Phaistos Disc Sign Combining Oblique Stroke
			0x102e0...0x102e0, // Coptic Epact Thousands Mark
			0x10376...0x1037a, // Combining Old Permic Let..Combining Old Permic Let
			0x10a01...0x10a03, // Kharoshthi Vowel Sign I ..Kharoshthi Vowel Sign Vo
			0x10a05...0x10a06, // Kharoshthi Vowel Sign E ..Kharoshthi Vowel Sign O
			0x10a0c...0x10a0f, // Kharoshthi Vowel Length ..Kharoshthi Sign Visarga
			0x10a38...0x10a3a, // Kharoshthi Sign Bar Abov..Kharoshthi Sign Dot Belo
			0x10a3f...0x10a3f, // Kharoshthi Virama
			0x10ae5...0x10ae6, // Manichaean Abbreviation ..Manichaean Abbreviation
			0x10d24...0x10d27, // Hanifi Rohingya Sign Har..Hanifi Rohingya Sign Tas
			0x10f46...0x10f50, // Sogdian Combining Dot Be..Sogdian Combining Stroke
			0x11000...0x11002, // Brahmi Sign Candrabindu ..Brahmi Sign Visarga
			0x11038...0x11046, // Brahmi Vowel Sign Aa    ..Brahmi Virama
			0x1107f...0x11082, // Brahmi Number Joiner    ..Kaithi Sign Visarga
			0x110b0...0x110ba, // Kaithi Vowel Sign Aa    ..Kaithi Sign Nukta
			0x110bd...0x110bd, // Kaithi Number Sign
			0x110cd...0x110cd, // Kaithi Number Sign Above
			0x11100...0x11102, // Chakma Sign Candrabindu ..Chakma Sign Visarga
			0x11127...0x11134, // Chakma Vowel Sign A     ..Chakma Maayyaa
			0x11145...0x11146, // Chakma Vowel Sign Aa    ..Chakma Vowel Sign Ei
			0x11173...0x11173, // Mahajani Sign Nukta
			0x11180...0x11182, // Sharada Sign Candrabindu..Sharada Sign Visarga
			0x111b3...0x111c0, // Sharada Vowel Sign Aa   ..Sharada Sign Virama
			0x111c9...0x111cc, // Sharada Sandhi Mark     ..Sharada Extra Short Vowe
			0x1122c...0x11237, // Khojki Vowel Sign Aa    ..Khojki Sign Shadda
			0x1123e...0x1123e, // Khojki Sign Sukun
			0x112df...0x112ea, // Khudawadi Sign Anusvara ..Khudawadi Sign Virama
			0x11300...0x11303, // Grantha Sign Combining A..Grantha Sign Visarga
			0x1133b...0x1133c, // Combining Bindu Below   ..Grantha Sign Nukta
			0x1133e...0x11344, // Grantha Vowel Sign Aa   ..Grantha Vowel Sign Vocal
			0x11347...0x11348, // Grantha Vowel Sign Ee   ..Grantha Vowel Sign Ai
			0x1134b...0x1134d, // Grantha Vowel Sign Oo   ..Grantha Sign Virama
			0x11357...0x11357, // Grantha Au Length Mark
			0x11362...0x11363, // Grantha Vowel Sign Vocal..Grantha Vowel Sign Vocal
			0x11366...0x1136c, // Combining Grantha Digit ..Combining Grantha Digit
			0x11370...0x11374, // Combining Grantha Letter..Combining Grantha Letter
			0x11435...0x11446, // Newa Vowel Sign Aa      ..Newa Sign Nukta
			0x1145e...0x1145e, // Newa Sandhi Mark
			0x114b0...0x114c3, // Tirhuta Vowel Sign Aa   ..Tirhuta Sign Nukta
			0x115af...0x115b5, // Siddham Vowel Sign Aa   ..Siddham Vowel Sign Vocal
			0x115b8...0x115c0, // Siddham Vowel Sign E    ..Siddham Sign Nukta
			0x115dc...0x115dd, // Siddham Vowel Sign Alter..Siddham Vowel Sign Alter
			0x11630...0x11640, // Modi Vowel Sign Aa      ..Modi Sign Ardhacandra
			0x116ab...0x116b7, // Takri Sign Anusvara     ..Takri Sign Nukta
			0x1171d...0x1172b, // Ahom Consonant Sign Medi..Ahom Sign Killer
			0x1182c...0x1183a, // Dogra Vowel Sign Aa     ..Dogra Sign Nukta
			0x119d1...0x119d7, // Nandinagari Vowel Sign A..Nandinagari Vowel Sign V
			0x119da...0x119e0, // Nandinagari Vowel Sign E..Nandinagari Sign Virama
			0x119e4...0x119e4, // Nandinagari Vowel Sign Prishthamatra E
			0x11a01...0x11a0a, // Zanabazar Square Vowel S..Zanabazar Square Vowel L
			0x11a33...0x11a39, // Zanabazar Square Final C..Zanabazar Square Sign Vi
			0x11a3b...0x11a3e, // Zanabazar Square Cluster..Zanabazar Square Cluster
			0x11a47...0x11a47, // Zanabazar Square Subjoiner
			0x11a51...0x11a5b, // Soyombo Vowel Sign I    ..Soyombo Vowel Length Mar
			0x11a8a...0x11a99, // Soyombo Final Consonant ..Soyombo Subjoiner
			0x11c2f...0x11c36, // Bhaiksuki Vowel Sign Aa ..Bhaiksuki Vowel Sign Voc
			0x11c38...0x11c3f, // Bhaiksuki Vowel Sign E  ..Bhaiksuki Sign Virama
			0x11c92...0x11ca7, // Marchen Subjoined Letter..Marchen Subjoined Letter
			0x11ca9...0x11cb6, // Marchen Subjoined Letter..Marchen Sign Candrabindu
			0x11d31...0x11d36, // Masaram Gondi Vowel Sign..Masaram Gondi Vowel Sign
			0x11d3a...0x11d3a, // Masaram Gondi Vowel Sign E
			0x11d3c...0x11d3d, // Masaram Gondi Vowel Sign..Masaram Gondi Vowel Sign
			0x11d3f...0x11d45, // Masaram Gondi Vowel Sign..Masaram Gondi Virama
			0x11d47...0x11d47, // Masaram Gondi Ra-kara
			0x11d8a...0x11d8e, // Gunjala Gondi Vowel Sign..Gunjala Gondi Vowel Sign
			0x11d90...0x11d91, // Gunjala Gondi Vowel Sign..Gunjala Gondi Vowel Sign
			0x11d93...0x11d97, // Gunjala Gondi Vowel Sign..Gunjala Gondi Virama
			0x11ef3...0x11ef6, // Makasar Vowel Sign I    ..Makasar Vowel Sign O
			0x13430...0x13438, // Egyptian Hieroglyph Vert..Egyptian Hieroglyph End
			0x16af0...0x16af4, // Bassa Vah Combining High..Bassa Vah Combining High
			0x16b30...0x16b36, // Pahawh Hmong Mark Cim Tu..Pahawh Hmong Mark Cim Ta
			0x16f4f...0x16f4f, // Miao Sign Consonant Modifier Bar
			0x16f51...0x16f87, // Miao Sign Aspiration    ..Miao Vowel Sign Ui
			0x16f8f...0x16f92, // Miao Tone Right         ..Miao Tone Below
			0x1bc9d...0x1bc9e, // Duployan Thick Letter Se..Duployan Double Mark
			0x1bca0...0x1bca3, // Shorthand Format Letter ..Shorthand Format Up Step
			0x1d165...0x1d169, // Musical Symbol Combining..Musical Symbol Combining
			0x1d16d...0x1d182, // Musical Symbol Combining..Musical Symbol Combining
			0x1d185...0x1d18b, // Musical Symbol Combining..Musical Symbol Combining
			0x1d1aa...0x1d1ad, // Musical Symbol Combining..Musical Symbol Combining
			0x1d242...0x1d244, // Combining Greek Musical ..Combining Greek Musical
			0x1da00...0x1da36, // Signwriting Head Rim    ..Signwriting Air Sucking
			0x1da3b...0x1da6c, // Signwriting Mouth Closed..Signwriting Excitement
			0x1da75...0x1da75, // Signwriting Upper Body Tilting From Hip Joints
			0x1da84...0x1da84, // Signwriting Location Head Neck
			0x1da9b...0x1da9f, // Signwriting Fill Modifie..Signwriting Fill Modifie
			0x1daa1...0x1daaf, // Signwriting Rotation Mod..Signwriting Rotation Mod
			0x1e000...0x1e006, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e008...0x1e018, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e01b...0x1e021, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e023...0x1e024, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e026...0x1e02a, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e130...0x1e136, // Nyiakeng Puachue Hmong T..Nyiakeng Puachue Hmong T
			0x1e2ec...0x1e2ef, // Wancho Tone Tup         ..Wancho Tone Koini
			0x1e8d0...0x1e8d6, // Mende Kikakui Combining ..Mende Kikakui Combining
			0x1e944...0x1e94a, // Adlam Alif Lengthener   ..Adlam Nukta
			0x1f3fb...0x1f3ff, // Emoji Modifier Fitzpatri..Emoji Modifier Fitzpatri
			0xe0001...0xe0001, // Language Tag
			0xe0020...0xe007f, // Tag Space               ..Cancel Tag
			0xe0100...0xe01ef, // Variation Selector-17   ..Variation Selector-256
			=> true,
			else => false,
		},
		.@"13.0.0" => switch (codepoint) {
			// Source: DerivedGeneralCategory-13.0.0.txt
			// Date: 2019-10-21, 14:30:32 GMT
			0x00000...0x00000, // (nil)
			0x000ad...0x000ad, // Soft Hyphen
			0x00300...0x0036f, // Combining Grave Accent  ..Combining Latin Small Le
			0x00483...0x00489, // Combining Cyrillic Titlo..Combining Cyrillic Milli
			0x00591...0x005bd, // Hebrew Accent Etnahta   ..Hebrew Point Meteg
			0x005bf...0x005bf, // Hebrew Point Rafe
			0x005c1...0x005c2, // Hebrew Point Shin Dot   ..Hebrew Point Sin Dot
			0x005c4...0x005c5, // Hebrew Mark Upper Dot   ..Hebrew Mark Lower Dot
			0x005c7...0x005c7, // Hebrew Point Qamats Qatan
			0x00600...0x00605, // Arabic Number Sign      ..Arabic Number Mark Above
			0x00610...0x0061a, // Arabic Sign Sallallahou ..Arabic Small Kasra
			0x0061c...0x0061c, // Arabic Letter Mark
			0x0064b...0x0065f, // Arabic Fathatan         ..Arabic Wavy Hamza Below
			0x00670...0x00670, // Arabic Letter Superscript Alef
			0x006d6...0x006dd, // Arabic Small High Ligatu..Arabic End Of Ayah
			0x006df...0x006e4, // Arabic Small High Rounde..Arabic Small High Madda
			0x006e7...0x006e8, // Arabic Small High Yeh   ..Arabic Small High Noon
			0x006ea...0x006ed, // Arabic Empty Centre Low ..Arabic Small Low Meem
			0x0070f...0x0070f, // Syriac Abbreviation Mark
			0x00711...0x00711, // Syriac Letter Superscript Alaph
			0x00730...0x0074a, // Syriac Pthaha Above     ..Syriac Barrekh
			0x007a6...0x007b0, // Thaana Abafili          ..Thaana Sukun
			0x007eb...0x007f3, // Nko Combining Short High..Nko Combining Double Dot
			0x007fd...0x007fd, // Nko Dantayalan
			0x00816...0x00819, // Samaritan Mark In       ..Samaritan Mark Dagesh
			0x0081b...0x00823, // Samaritan Mark Epentheti..Samaritan Vowel Sign A
			0x00825...0x00827, // Samaritan Vowel Sign Sho..Samaritan Vowel Sign U
			0x00829...0x0082d, // Samaritan Vowel Sign Lon..Samaritan Mark Nequdaa
			0x00859...0x0085b, // Mandaic Affrication Mark..Mandaic Gemination Mark
			0x008d3...0x00903, // Arabic Small Low Waw    ..Devanagari Sign Visarga
			0x0093a...0x0093c, // Devanagari Vowel Sign Oe..Devanagari Sign Nukta
			0x0093e...0x0094f, // Devanagari Vowel Sign Aa..Devanagari Vowel Sign Aw
			0x00951...0x00957, // Devanagari Stress Sign U..Devanagari Vowel Sign Uu
			0x00962...0x00963, // Devanagari Vowel Sign Vo..Devanagari Vowel Sign Vo
			0x00981...0x00983, // Bengali Sign Candrabindu..Bengali Sign Visarga
			0x009bc...0x009bc, // Bengali Sign Nukta
			0x009be...0x009c4, // Bengali Vowel Sign Aa   ..Bengali Vowel Sign Vocal
			0x009c7...0x009c8, // Bengali Vowel Sign E    ..Bengali Vowel Sign Ai
			0x009cb...0x009cd, // Bengali Vowel Sign O    ..Bengali Sign Virama
			0x009d7...0x009d7, // Bengali Au Length Mark
			0x009e2...0x009e3, // Bengali Vowel Sign Vocal..Bengali Vowel Sign Vocal
			0x009fe...0x009fe, // Bengali Sandhi Mark
			0x00a01...0x00a03, // Gurmukhi Sign Adak Bindi..Gurmukhi Sign Visarga
			0x00a3c...0x00a3c, // Gurmukhi Sign Nukta
			0x00a3e...0x00a42, // Gurmukhi Vowel Sign Aa  ..Gurmukhi Vowel Sign Uu
			0x00a47...0x00a48, // Gurmukhi Vowel Sign Ee  ..Gurmukhi Vowel Sign Ai
			0x00a4b...0x00a4d, // Gurmukhi Vowel Sign Oo  ..Gurmukhi Sign Virama
			0x00a51...0x00a51, // Gurmukhi Sign Udaat
			0x00a70...0x00a71, // Gurmukhi Tippi          ..Gurmukhi Addak
			0x00a75...0x00a75, // Gurmukhi Sign Yakash
			0x00a81...0x00a83, // Gujarati Sign Candrabind..Gujarati Sign Visarga
			0x00abc...0x00abc, // Gujarati Sign Nukta
			0x00abe...0x00ac5, // Gujarati Vowel Sign Aa  ..Gujarati Vowel Sign Cand
			0x00ac7...0x00ac9, // Gujarati Vowel Sign E   ..Gujarati Vowel Sign Cand
			0x00acb...0x00acd, // Gujarati Vowel Sign O   ..Gujarati Sign Virama
			0x00ae2...0x00ae3, // Gujarati Vowel Sign Voca..Gujarati Vowel Sign Voca
			0x00afa...0x00aff, // Gujarati Sign Sukun     ..Gujarati Sign Two-circle
			0x00b01...0x00b03, // Oriya Sign Candrabindu  ..Oriya Sign Visarga
			0x00b3c...0x00b3c, // Oriya Sign Nukta
			0x00b3e...0x00b44, // Oriya Vowel Sign Aa     ..Oriya Vowel Sign Vocalic
			0x00b47...0x00b48, // Oriya Vowel Sign E      ..Oriya Vowel Sign Ai
			0x00b4b...0x00b4d, // Oriya Vowel Sign O      ..Oriya Sign Virama
			0x00b55...0x00b57, // Oriya Sign Overline     ..Oriya Au Length Mark
			0x00b62...0x00b63, // Oriya Vowel Sign Vocalic..Oriya Vowel Sign Vocalic
			0x00b82...0x00b82, // Tamil Sign Anusvara
			0x00bbe...0x00bc2, // Tamil Vowel Sign Aa     ..Tamil Vowel Sign Uu
			0x00bc6...0x00bc8, // Tamil Vowel Sign E      ..Tamil Vowel Sign Ai
			0x00bca...0x00bcd, // Tamil Vowel Sign O      ..Tamil Sign Virama
			0x00bd7...0x00bd7, // Tamil Au Length Mark
			0x00c00...0x00c04, // Telugu Sign Combining Ca..Telugu Sign Combining An
			0x00c3e...0x00c44, // Telugu Vowel Sign Aa    ..Telugu Vowel Sign Vocali
			0x00c46...0x00c48, // Telugu Vowel Sign E     ..Telugu Vowel Sign Ai
			0x00c4a...0x00c4d, // Telugu Vowel Sign O     ..Telugu Sign Virama
			0x00c55...0x00c56, // Telugu Length Mark      ..Telugu Ai Length Mark
			0x00c62...0x00c63, // Telugu Vowel Sign Vocali..Telugu Vowel Sign Vocali
			0x00c81...0x00c83, // Kannada Sign Candrabindu..Kannada Sign Visarga
			0x00cbc...0x00cbc, // Kannada Sign Nukta
			0x00cbe...0x00cc4, // Kannada Vowel Sign Aa   ..Kannada Vowel Sign Vocal
			0x00cc6...0x00cc8, // Kannada Vowel Sign E    ..Kannada Vowel Sign Ai
			0x00cca...0x00ccd, // Kannada Vowel Sign O    ..Kannada Sign Virama
			0x00cd5...0x00cd6, // Kannada Length Mark     ..Kannada Ai Length Mark
			0x00ce2...0x00ce3, // Kannada Vowel Sign Vocal..Kannada Vowel Sign Vocal
			0x00d00...0x00d03, // Malayalam Sign Combining..Malayalam Sign Visarga
			0x00d3b...0x00d3c, // Malayalam Sign Vertical ..Malayalam Sign Circular
			0x00d3e...0x00d44, // Malayalam Vowel Sign Aa ..Malayalam Vowel Sign Voc
			0x00d46...0x00d48, // Malayalam Vowel Sign E  ..Malayalam Vowel Sign Ai
			0x00d4a...0x00d4d, // Malayalam Vowel Sign O  ..Malayalam Sign Virama
			0x00d57...0x00d57, // Malayalam Au Length Mark
			0x00d62...0x00d63, // Malayalam Vowel Sign Voc..Malayalam Vowel Sign Voc
			0x00d81...0x00d83, // Sinhala Sign Candrabindu..Sinhala Sign Visargaya
			0x00dca...0x00dca, // Sinhala Sign Al-lakuna
			0x00dcf...0x00dd4, // Sinhala Vowel Sign Aela-..Sinhala Vowel Sign Ketti
			0x00dd6...0x00dd6, // Sinhala Vowel Sign Diga Paa-pilla
			0x00dd8...0x00ddf, // Sinhala Vowel Sign Gaett..Sinhala Vowel Sign Gayan
			0x00df2...0x00df3, // Sinhala Vowel Sign Diga ..Sinhala Vowel Sign Diga
			0x00e31...0x00e31, // Thai Character Mai Han-akat
			0x00e34...0x00e3a, // Thai Character Sara I   ..Thai Character Phinthu
			0x00e47...0x00e4e, // Thai Character Maitaikhu..Thai Character Yamakkan
			0x00eb1...0x00eb1, // Lao Vowel Sign Mai Kan
			0x00eb4...0x00ebc, // Lao Vowel Sign I        ..Lao Semivowel Sign Lo
			0x00ec8...0x00ecd, // Lao Tone Mai Ek         ..Lao Niggahita
			0x00f18...0x00f19, // Tibetan Astrological Sig..Tibetan Astrological Sig
			0x00f35...0x00f35, // Tibetan Mark Ngas Bzung Nyi Zla
			0x00f37...0x00f37, // Tibetan Mark Ngas Bzung Sgor Rtags
			0x00f39...0x00f39, // Tibetan Mark Tsa -phru
			0x00f3e...0x00f3f, // Tibetan Sign Yar Tshes  ..Tibetan Sign Mar Tshes
			0x00f71...0x00f84, // Tibetan Vowel Sign Aa   ..Tibetan Mark Halanta
			0x00f86...0x00f87, // Tibetan Sign Lci Rtags  ..Tibetan Sign Yang Rtags
			0x00f8d...0x00f97, // Tibetan Subjoined Sign L..Tibetan Subjoined Letter
			0x00f99...0x00fbc, // Tibetan Subjoined Letter..Tibetan Subjoined Letter
			0x00fc6...0x00fc6, // Tibetan Symbol Padma Gdan
			0x0102b...0x0103e, // Myanmar Vowel Sign Tall ..Myanmar Consonant Sign M
			0x01056...0x01059, // Myanmar Vowel Sign Vocal..Myanmar Vowel Sign Vocal
			0x0105e...0x01060, // Myanmar Consonant Sign M..Myanmar Consonant Sign M
			0x01062...0x01064, // Myanmar Vowel Sign Sgaw ..Myanmar Tone Mark Sgaw K
			0x01067...0x0106d, // Myanmar Vowel Sign Weste..Myanmar Sign Western Pwo
			0x01071...0x01074, // Myanmar Vowel Sign Geba ..Myanmar Vowel Sign Kayah
			0x01082...0x0108d, // Myanmar Consonant Sign S..Myanmar Sign Shan Counci
			0x0108f...0x0108f, // Myanmar Sign Rumai Palaung Tone-5
			0x0109a...0x0109d, // Myanmar Sign Khamti Tone..Myanmar Vowel Sign Aiton
			0x01160...0x011ff, // Hangul Jungseong Filler ..Hangul Jongseong Ssangni
			0x0135d...0x0135f, // Ethiopic Combining Gemin..Ethiopic Combining Gemin
			0x01712...0x01714, // Tagalog Vowel Sign I    ..Tagalog Sign Virama
			0x01732...0x01734, // Hanunoo Vowel Sign I    ..Hanunoo Sign Pamudpod
			0x01752...0x01753, // Buhid Vowel Sign I      ..Buhid Vowel Sign U
			0x01772...0x01773, // Tagbanwa Vowel Sign I   ..Tagbanwa Vowel Sign U
			0x017b4...0x017d3, // Khmer Vowel Inherent Aq ..Khmer Sign Bathamasat
			0x017dd...0x017dd, // Khmer Sign Atthacan
			0x0180b...0x0180e, // Mongolian Free Variation..Mongolian Vowel Separato
			0x01885...0x01886, // Mongolian Letter Ali Gal..Mongolian Letter Ali Gal
			0x018a9...0x018a9, // Mongolian Letter Ali Gali Dagalga
			0x01920...0x0192b, // Limbu Vowel Sign A      ..Limbu Subjoined Letter W
			0x01930...0x0193b, // Limbu Small Letter Ka   ..Limbu Sign Sa-i
			0x01a17...0x01a1b, // Buginese Vowel Sign I   ..Buginese Vowel Sign Ae
			0x01a55...0x01a5e, // Tai Tham Consonant Sign ..Tai Tham Consonant Sign
			0x01a60...0x01a7c, // Tai Tham Sign Sakot     ..Tai Tham Sign Khuen-lue
			0x01a7f...0x01a7f, // Tai Tham Combining Cryptogrammic Dot
			0x01ab0...0x01ac0, // Combining Doubled Circum..Combining Latin Small Le
			0x01b00...0x01b04, // Balinese Sign Ulu Ricem ..Balinese Sign Bisah
			0x01b34...0x01b44, // Balinese Sign Rerekan   ..Balinese Adeg Adeg
			0x01b6b...0x01b73, // Balinese Musical Symbol ..Balinese Musical Symbol
			0x01b80...0x01b82, // Sundanese Sign Panyecek ..Sundanese Sign Pangwisad
			0x01ba1...0x01bad, // Sundanese Consonant Sign..Sundanese Consonant Sign
			0x01be6...0x01bf3, // Batak Sign Tompi        ..Batak Panongonan
			0x01c24...0x01c37, // Lepcha Subjoined Letter ..Lepcha Sign Nukta
			0x01cd0...0x01cd2, // Vedic Tone Karshana     ..Vedic Tone Prenkha
			0x01cd4...0x01ce8, // Vedic Sign Yajurvedic Mi..Vedic Sign Visarga Anuda
			0x01ced...0x01ced, // Vedic Sign Tiryak
			0x01cf4...0x01cf4, // Vedic Tone Candra Above
			0x01cf7...0x01cf9, // Vedic Sign Atikrama     ..Vedic Tone Double Ring A
			0x01dc0...0x01df9, // Combining Dotted Grave A..Combining Wide Inverted
			0x01dfb...0x01dff, // Combining Deletion Mark ..Combining Right Arrowhea
			0x0200b...0x0200f, // Zero Width Space        ..Right-to-left Mark
			0x02028...0x0202e, // Line Separator          ..Right-to-left Override
			0x02060...0x02064, // Word Joiner             ..Invisible Plus
			0x02066...0x0206f, // Left-to-right Isolate   ..Nominal Digit Shapes
			0x020d0...0x020f0, // Combining Left Harpoon A..Combining Asterisk Above
			0x02cef...0x02cf1, // Coptic Combining Ni Abov..Coptic Combining Spiritu
			0x02d7f...0x02d7f, // Tifinagh Consonant Joiner
			0x02de0...0x02dff, // Combining Cyrillic Lette..Combining Cyrillic Lette
			0x0302a...0x0302f, // Ideographic Level Tone M..Hangul Double Dot Tone M
			0x03099...0x0309a, // Combining Katakana-hirag..Combining Katakana-hirag
			0x0a66f...0x0a672, // Combining Cyrillic Vzmet..Combining Cyrillic Thous
			0x0a674...0x0a67d, // Combining Cyrillic Lette..Combining Cyrillic Payer
			0x0a69e...0x0a69f, // Combining Cyrillic Lette..Combining Cyrillic Lette
			0x0a6f0...0x0a6f1, // Bamum Combining Mark Koq..Bamum Combining Mark Tuk
			0x0a802...0x0a802, // Syloti Nagri Sign Dvisvara
			0x0a806...0x0a806, // Syloti Nagri Sign Hasanta
			0x0a80b...0x0a80b, // Syloti Nagri Sign Anusvara
			0x0a823...0x0a827, // Syloti Nagri Vowel Sign ..Syloti Nagri Vowel Sign
			0x0a82c...0x0a82c, // Syloti Nagri Sign Alternate Hasanta
			0x0a880...0x0a881, // Saurashtra Sign Anusvara..Saurashtra Sign Visarga
			0x0a8b4...0x0a8c5, // Saurashtra Consonant Sig..Saurashtra Sign Candrabi
			0x0a8e0...0x0a8f1, // Combining Devanagari Dig..Combining Devanagari Sig
			0x0a8ff...0x0a8ff, // Devanagari Vowel Sign Ay
			0x0a926...0x0a92d, // Kayah Li Vowel Ue       ..Kayah Li Tone Calya Plop
			0x0a947...0x0a953, // Rejang Vowel Sign I     ..Rejang Virama
			0x0a980...0x0a983, // Javanese Sign Panyangga ..Javanese Sign Wignyan
			0x0a9b3...0x0a9c0, // Javanese Sign Cecak Telu..Javanese Pangkon
			0x0a9e5...0x0a9e5, // Myanmar Sign Shan Saw
			0x0aa29...0x0aa36, // Cham Vowel Sign Aa      ..Cham Consonant Sign Wa
			0x0aa43...0x0aa43, // Cham Consonant Sign Final Ng
			0x0aa4c...0x0aa4d, // Cham Consonant Sign Fina..Cham Consonant Sign Fina
			0x0aa7b...0x0aa7d, // Myanmar Sign Pao Karen T..Myanmar Sign Tai Laing T
			0x0aab0...0x0aab0, // Tai Viet Mai Kang
			0x0aab2...0x0aab4, // Tai Viet Vowel I        ..Tai Viet Vowel U
			0x0aab7...0x0aab8, // Tai Viet Mai Khit       ..Tai Viet Vowel Ia
			0x0aabe...0x0aabf, // Tai Viet Vowel Am       ..Tai Viet Tone Mai Ek
			0x0aac1...0x0aac1, // Tai Viet Tone Mai Tho
			0x0aaeb...0x0aaef, // Meetei Mayek Vowel Sign ..Meetei Mayek Vowel Sign
			0x0aaf5...0x0aaf6, // Meetei Mayek Vowel Sign ..Meetei Mayek Virama
			0x0abe3...0x0abea, // Meetei Mayek Vowel Sign ..Meetei Mayek Vowel Sign
			0x0abec...0x0abed, // Meetei Mayek Lum Iyek   ..Meetei Mayek Apun Iyek
			0x0d7b0...0x0d7ff, // Hangul Jungseong O-yeo  ..(nil)
			0x0fb1e...0x0fb1e, // Hebrew Point Judeo-spanish Varika
			0x0fe00...0x0fe0f, // Variation Selector-1    ..Variation Selector-16
			0x0fe20...0x0fe2f, // Combining Ligature Left ..Combining Cyrillic Titlo
			0x0feff...0x0feff, // Zero Width No-break Space
			0x0fff9...0x0fffb, // Interlinear Annotation A..Interlinear Annotation T
			0x101fd...0x101fd, // Phaistos Disc Sign Combining Oblique Stroke
			0x102e0...0x102e0, // Coptic Epact Thousands Mark
			0x10376...0x1037a, // Combining Old Permic Let..Combining Old Permic Let
			0x10a01...0x10a03, // Kharoshthi Vowel Sign I ..Kharoshthi Vowel Sign Vo
			0x10a05...0x10a06, // Kharoshthi Vowel Sign E ..Kharoshthi Vowel Sign O
			0x10a0c...0x10a0f, // Kharoshthi Vowel Length ..Kharoshthi Sign Visarga
			0x10a38...0x10a3a, // Kharoshthi Sign Bar Abov..Kharoshthi Sign Dot Belo
			0x10a3f...0x10a3f, // Kharoshthi Virama
			0x10ae5...0x10ae6, // Manichaean Abbreviation ..Manichaean Abbreviation
			0x10d24...0x10d27, // Hanifi Rohingya Sign Har..Hanifi Rohingya Sign Tas
			0x10eab...0x10eac, // Yezidi Combining Hamza M..Yezidi Combining Madda M
			0x10f46...0x10f50, // Sogdian Combining Dot Be..Sogdian Combining Stroke
			0x11000...0x11002, // Brahmi Sign Candrabindu ..Brahmi Sign Visarga
			0x11038...0x11046, // Brahmi Vowel Sign Aa    ..Brahmi Virama
			0x1107f...0x11082, // Brahmi Number Joiner    ..Kaithi Sign Visarga
			0x110b0...0x110ba, // Kaithi Vowel Sign Aa    ..Kaithi Sign Nukta
			0x110bd...0x110bd, // Kaithi Number Sign
			0x110cd...0x110cd, // Kaithi Number Sign Above
			0x11100...0x11102, // Chakma Sign Candrabindu ..Chakma Sign Visarga
			0x11127...0x11134, // Chakma Vowel Sign A     ..Chakma Maayyaa
			0x11145...0x11146, // Chakma Vowel Sign Aa    ..Chakma Vowel Sign Ei
			0x11173...0x11173, // Mahajani Sign Nukta
			0x11180...0x11182, // Sharada Sign Candrabindu..Sharada Sign Visarga
			0x111b3...0x111c0, // Sharada Vowel Sign Aa   ..Sharada Sign Virama
			0x111c9...0x111cc, // Sharada Sandhi Mark     ..Sharada Extra Short Vowe
			0x111ce...0x111cf, // Sharada Vowel Sign Prish..Sharada Sign Inverted Ca
			0x1122c...0x11237, // Khojki Vowel Sign Aa    ..Khojki Sign Shadda
			0x1123e...0x1123e, // Khojki Sign Sukun
			0x112df...0x112ea, // Khudawadi Sign Anusvara ..Khudawadi Sign Virama
			0x11300...0x11303, // Grantha Sign Combining A..Grantha Sign Visarga
			0x1133b...0x1133c, // Combining Bindu Below   ..Grantha Sign Nukta
			0x1133e...0x11344, // Grantha Vowel Sign Aa   ..Grantha Vowel Sign Vocal
			0x11347...0x11348, // Grantha Vowel Sign Ee   ..Grantha Vowel Sign Ai
			0x1134b...0x1134d, // Grantha Vowel Sign Oo   ..Grantha Sign Virama
			0x11357...0x11357, // Grantha Au Length Mark
			0x11362...0x11363, // Grantha Vowel Sign Vocal..Grantha Vowel Sign Vocal
			0x11366...0x1136c, // Combining Grantha Digit ..Combining Grantha Digit
			0x11370...0x11374, // Combining Grantha Letter..Combining Grantha Letter
			0x11435...0x11446, // Newa Vowel Sign Aa      ..Newa Sign Nukta
			0x1145e...0x1145e, // Newa Sandhi Mark
			0x114b0...0x114c3, // Tirhuta Vowel Sign Aa   ..Tirhuta Sign Nukta
			0x115af...0x115b5, // Siddham Vowel Sign Aa   ..Siddham Vowel Sign Vocal
			0x115b8...0x115c0, // Siddham Vowel Sign E    ..Siddham Sign Nukta
			0x115dc...0x115dd, // Siddham Vowel Sign Alter..Siddham Vowel Sign Alter
			0x11630...0x11640, // Modi Vowel Sign Aa      ..Modi Sign Ardhacandra
			0x116ab...0x116b7, // Takri Sign Anusvara     ..Takri Sign Nukta
			0x1171d...0x1172b, // Ahom Consonant Sign Medi..Ahom Sign Killer
			0x1182c...0x1183a, // Dogra Vowel Sign Aa     ..Dogra Sign Nukta
			0x11930...0x11935, // Dives Akuru Vowel Sign A..Dives Akuru Vowel Sign E
			0x11937...0x11938, // Dives Akuru Vowel Sign A..Dives Akuru Vowel Sign O
			0x1193b...0x1193e, // Dives Akuru Sign Anusvar..Dives Akuru Virama
			0x11940...0x11940, // Dives Akuru Medial Ya
			0x11942...0x11943, // Dives Akuru Medial Ra   ..Dives Akuru Sign Nukta
			0x119d1...0x119d7, // Nandinagari Vowel Sign A..Nandinagari Vowel Sign V
			0x119da...0x119e0, // Nandinagari Vowel Sign E..Nandinagari Sign Virama
			0x119e4...0x119e4, // Nandinagari Vowel Sign Prishthamatra E
			0x11a01...0x11a0a, // Zanabazar Square Vowel S..Zanabazar Square Vowel L
			0x11a33...0x11a39, // Zanabazar Square Final C..Zanabazar Square Sign Vi
			0x11a3b...0x11a3e, // Zanabazar Square Cluster..Zanabazar Square Cluster
			0x11a47...0x11a47, // Zanabazar Square Subjoiner
			0x11a51...0x11a5b, // Soyombo Vowel Sign I    ..Soyombo Vowel Length Mar
			0x11a8a...0x11a99, // Soyombo Final Consonant ..Soyombo Subjoiner
			0x11c2f...0x11c36, // Bhaiksuki Vowel Sign Aa ..Bhaiksuki Vowel Sign Voc
			0x11c38...0x11c3f, // Bhaiksuki Vowel Sign E  ..Bhaiksuki Sign Virama
			0x11c92...0x11ca7, // Marchen Subjoined Letter..Marchen Subjoined Letter
			0x11ca9...0x11cb6, // Marchen Subjoined Letter..Marchen Sign Candrabindu
			0x11d31...0x11d36, // Masaram Gondi Vowel Sign..Masaram Gondi Vowel Sign
			0x11d3a...0x11d3a, // Masaram Gondi Vowel Sign E
			0x11d3c...0x11d3d, // Masaram Gondi Vowel Sign..Masaram Gondi Vowel Sign
			0x11d3f...0x11d45, // Masaram Gondi Vowel Sign..Masaram Gondi Virama
			0x11d47...0x11d47, // Masaram Gondi Ra-kara
			0x11d8a...0x11d8e, // Gunjala Gondi Vowel Sign..Gunjala Gondi Vowel Sign
			0x11d90...0x11d91, // Gunjala Gondi Vowel Sign..Gunjala Gondi Vowel Sign
			0x11d93...0x11d97, // Gunjala Gondi Vowel Sign..Gunjala Gondi Virama
			0x11ef3...0x11ef6, // Makasar Vowel Sign I    ..Makasar Vowel Sign O
			0x13430...0x13438, // Egyptian Hieroglyph Vert..Egyptian Hieroglyph End
			0x16af0...0x16af4, // Bassa Vah Combining High..Bassa Vah Combining High
			0x16b30...0x16b36, // Pahawh Hmong Mark Cim Tu..Pahawh Hmong Mark Cim Ta
			0x16f4f...0x16f4f, // Miao Sign Consonant Modifier Bar
			0x16f51...0x16f87, // Miao Sign Aspiration    ..Miao Vowel Sign Ui
			0x16f8f...0x16f92, // Miao Tone Right         ..Miao Tone Below
			0x16fe4...0x16fe4, // Khitan Small Script Filler
			0x16ff0...0x16ff1, // Vietnamese Alternate Rea..Vietnamese Alternate Rea
			0x1bc9d...0x1bc9e, // Duployan Thick Letter Se..Duployan Double Mark
			0x1bca0...0x1bca3, // Shorthand Format Letter ..Shorthand Format Up Step
			0x1d165...0x1d169, // Musical Symbol Combining..Musical Symbol Combining
			0x1d16d...0x1d182, // Musical Symbol Combining..Musical Symbol Combining
			0x1d185...0x1d18b, // Musical Symbol Combining..Musical Symbol Combining
			0x1d1aa...0x1d1ad, // Musical Symbol Combining..Musical Symbol Combining
			0x1d242...0x1d244, // Combining Greek Musical ..Combining Greek Musical
			0x1da00...0x1da36, // Signwriting Head Rim    ..Signwriting Air Sucking
			0x1da3b...0x1da6c, // Signwriting Mouth Closed..Signwriting Excitement
			0x1da75...0x1da75, // Signwriting Upper Body Tilting From Hip Joints
			0x1da84...0x1da84, // Signwriting Location Head Neck
			0x1da9b...0x1da9f, // Signwriting Fill Modifie..Signwriting Fill Modifie
			0x1daa1...0x1daaf, // Signwriting Rotation Mod..Signwriting Rotation Mod
			0x1e000...0x1e006, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e008...0x1e018, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e01b...0x1e021, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e023...0x1e024, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e026...0x1e02a, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e130...0x1e136, // Nyiakeng Puachue Hmong T..Nyiakeng Puachue Hmong T
			0x1e2ec...0x1e2ef, // Wancho Tone Tup         ..Wancho Tone Koini
			0x1e8d0...0x1e8d6, // Mende Kikakui Combining ..Mende Kikakui Combining
			0x1e944...0x1e94a, // Adlam Alif Lengthener   ..Adlam Nukta
			0x1f3fb...0x1f3ff, // Emoji Modifier Fitzpatri..Emoji Modifier Fitzpatri
			0xe0001...0xe0001, // Language Tag
			0xe0020...0xe007f, // Tag Space               ..Cancel Tag
			0xe0100...0xe01ef, // Variation Selector-17   ..Variation Selector-256
			=> true,
			else => false,
		},
		.@"14.0.0" => switch (codepoint) {
			// Source: DerivedGeneralCategory-14.0.0.txt
			// Date: 2021-07-10, 00:35:08 GMT
			0x00000...0x00000, // (nil)
			0x000ad...0x000ad, // Soft Hyphen
			0x00300...0x0036f, // Combining Grave Accent  ..Combining Latin Small Le
			0x00483...0x00489, // Combining Cyrillic Titlo..Combining Cyrillic Milli
			0x00591...0x005bd, // Hebrew Accent Etnahta   ..Hebrew Point Meteg
			0x005bf...0x005bf, // Hebrew Point Rafe
			0x005c1...0x005c2, // Hebrew Point Shin Dot   ..Hebrew Point Sin Dot
			0x005c4...0x005c5, // Hebrew Mark Upper Dot   ..Hebrew Mark Lower Dot
			0x005c7...0x005c7, // Hebrew Point Qamats Qatan
			0x00600...0x00605, // Arabic Number Sign      ..Arabic Number Mark Above
			0x00610...0x0061a, // Arabic Sign Sallallahou ..Arabic Small Kasra
			0x0061c...0x0061c, // Arabic Letter Mark
			0x0064b...0x0065f, // Arabic Fathatan         ..Arabic Wavy Hamza Below
			0x00670...0x00670, // Arabic Letter Superscript Alef
			0x006d6...0x006dd, // Arabic Small High Ligatu..Arabic End Of Ayah
			0x006df...0x006e4, // Arabic Small High Rounde..Arabic Small High Madda
			0x006e7...0x006e8, // Arabic Small High Yeh   ..Arabic Small High Noon
			0x006ea...0x006ed, // Arabic Empty Centre Low ..Arabic Small Low Meem
			0x0070f...0x0070f, // Syriac Abbreviation Mark
			0x00711...0x00711, // Syriac Letter Superscript Alaph
			0x00730...0x0074a, // Syriac Pthaha Above     ..Syriac Barrekh
			0x007a6...0x007b0, // Thaana Abafili          ..Thaana Sukun
			0x007eb...0x007f3, // Nko Combining Short High..Nko Combining Double Dot
			0x007fd...0x007fd, // Nko Dantayalan
			0x00816...0x00819, // Samaritan Mark In       ..Samaritan Mark Dagesh
			0x0081b...0x00823, // Samaritan Mark Epentheti..Samaritan Vowel Sign A
			0x00825...0x00827, // Samaritan Vowel Sign Sho..Samaritan Vowel Sign U
			0x00829...0x0082d, // Samaritan Vowel Sign Lon..Samaritan Mark Nequdaa
			0x00859...0x0085b, // Mandaic Affrication Mark..Mandaic Gemination Mark
			0x00890...0x00891, // Arabic Pound Mark Above ..Arabic Piastre Mark Abov
			0x00898...0x0089f, // Arabic Small High Word A..Arabic Half Madda Over M
			0x008ca...0x00903, // Arabic Small High Farsi ..Devanagari Sign Visarga
			0x0093a...0x0093c, // Devanagari Vowel Sign Oe..Devanagari Sign Nukta
			0x0093e...0x0094f, // Devanagari Vowel Sign Aa..Devanagari Vowel Sign Aw
			0x00951...0x00957, // Devanagari Stress Sign U..Devanagari Vowel Sign Uu
			0x00962...0x00963, // Devanagari Vowel Sign Vo..Devanagari Vowel Sign Vo
			0x00981...0x00983, // Bengali Sign Candrabindu..Bengali Sign Visarga
			0x009bc...0x009bc, // Bengali Sign Nukta
			0x009be...0x009c4, // Bengali Vowel Sign Aa   ..Bengali Vowel Sign Vocal
			0x009c7...0x009c8, // Bengali Vowel Sign E    ..Bengali Vowel Sign Ai
			0x009cb...0x009cd, // Bengali Vowel Sign O    ..Bengali Sign Virama
			0x009d7...0x009d7, // Bengali Au Length Mark
			0x009e2...0x009e3, // Bengali Vowel Sign Vocal..Bengali Vowel Sign Vocal
			0x009fe...0x009fe, // Bengali Sandhi Mark
			0x00a01...0x00a03, // Gurmukhi Sign Adak Bindi..Gurmukhi Sign Visarga
			0x00a3c...0x00a3c, // Gurmukhi Sign Nukta
			0x00a3e...0x00a42, // Gurmukhi Vowel Sign Aa  ..Gurmukhi Vowel Sign Uu
			0x00a47...0x00a48, // Gurmukhi Vowel Sign Ee  ..Gurmukhi Vowel Sign Ai
			0x00a4b...0x00a4d, // Gurmukhi Vowel Sign Oo  ..Gurmukhi Sign Virama
			0x00a51...0x00a51, // Gurmukhi Sign Udaat
			0x00a70...0x00a71, // Gurmukhi Tippi          ..Gurmukhi Addak
			0x00a75...0x00a75, // Gurmukhi Sign Yakash
			0x00a81...0x00a83, // Gujarati Sign Candrabind..Gujarati Sign Visarga
			0x00abc...0x00abc, // Gujarati Sign Nukta
			0x00abe...0x00ac5, // Gujarati Vowel Sign Aa  ..Gujarati Vowel Sign Cand
			0x00ac7...0x00ac9, // Gujarati Vowel Sign E   ..Gujarati Vowel Sign Cand
			0x00acb...0x00acd, // Gujarati Vowel Sign O   ..Gujarati Sign Virama
			0x00ae2...0x00ae3, // Gujarati Vowel Sign Voca..Gujarati Vowel Sign Voca
			0x00afa...0x00aff, // Gujarati Sign Sukun     ..Gujarati Sign Two-circle
			0x00b01...0x00b03, // Oriya Sign Candrabindu  ..Oriya Sign Visarga
			0x00b3c...0x00b3c, // Oriya Sign Nukta
			0x00b3e...0x00b44, // Oriya Vowel Sign Aa     ..Oriya Vowel Sign Vocalic
			0x00b47...0x00b48, // Oriya Vowel Sign E      ..Oriya Vowel Sign Ai
			0x00b4b...0x00b4d, // Oriya Vowel Sign O      ..Oriya Sign Virama
			0x00b55...0x00b57, // Oriya Sign Overline     ..Oriya Au Length Mark
			0x00b62...0x00b63, // Oriya Vowel Sign Vocalic..Oriya Vowel Sign Vocalic
			0x00b82...0x00b82, // Tamil Sign Anusvara
			0x00bbe...0x00bc2, // Tamil Vowel Sign Aa     ..Tamil Vowel Sign Uu
			0x00bc6...0x00bc8, // Tamil Vowel Sign E      ..Tamil Vowel Sign Ai
			0x00bca...0x00bcd, // Tamil Vowel Sign O      ..Tamil Sign Virama
			0x00bd7...0x00bd7, // Tamil Au Length Mark
			0x00c00...0x00c04, // Telugu Sign Combining Ca..Telugu Sign Combining An
			0x00c3c...0x00c3c, // Telugu Sign Nukta
			0x00c3e...0x00c44, // Telugu Vowel Sign Aa    ..Telugu Vowel Sign Vocali
			0x00c46...0x00c48, // Telugu Vowel Sign E     ..Telugu Vowel Sign Ai
			0x00c4a...0x00c4d, // Telugu Vowel Sign O     ..Telugu Sign Virama
			0x00c55...0x00c56, // Telugu Length Mark      ..Telugu Ai Length Mark
			0x00c62...0x00c63, // Telugu Vowel Sign Vocali..Telugu Vowel Sign Vocali
			0x00c81...0x00c83, // Kannada Sign Candrabindu..Kannada Sign Visarga
			0x00cbc...0x00cbc, // Kannada Sign Nukta
			0x00cbe...0x00cc4, // Kannada Vowel Sign Aa   ..Kannada Vowel Sign Vocal
			0x00cc6...0x00cc8, // Kannada Vowel Sign E    ..Kannada Vowel Sign Ai
			0x00cca...0x00ccd, // Kannada Vowel Sign O    ..Kannada Sign Virama
			0x00cd5...0x00cd6, // Kannada Length Mark     ..Kannada Ai Length Mark
			0x00ce2...0x00ce3, // Kannada Vowel Sign Vocal..Kannada Vowel Sign Vocal
			0x00d00...0x00d03, // Malayalam Sign Combining..Malayalam Sign Visarga
			0x00d3b...0x00d3c, // Malayalam Sign Vertical ..Malayalam Sign Circular
			0x00d3e...0x00d44, // Malayalam Vowel Sign Aa ..Malayalam Vowel Sign Voc
			0x00d46...0x00d48, // Malayalam Vowel Sign E  ..Malayalam Vowel Sign Ai
			0x00d4a...0x00d4d, // Malayalam Vowel Sign O  ..Malayalam Sign Virama
			0x00d57...0x00d57, // Malayalam Au Length Mark
			0x00d62...0x00d63, // Malayalam Vowel Sign Voc..Malayalam Vowel Sign Voc
			0x00d81...0x00d83, // Sinhala Sign Candrabindu..Sinhala Sign Visargaya
			0x00dca...0x00dca, // Sinhala Sign Al-lakuna
			0x00dcf...0x00dd4, // Sinhala Vowel Sign Aela-..Sinhala Vowel Sign Ketti
			0x00dd6...0x00dd6, // Sinhala Vowel Sign Diga Paa-pilla
			0x00dd8...0x00ddf, // Sinhala Vowel Sign Gaett..Sinhala Vowel Sign Gayan
			0x00df2...0x00df3, // Sinhala Vowel Sign Diga ..Sinhala Vowel Sign Diga
			0x00e31...0x00e31, // Thai Character Mai Han-akat
			0x00e34...0x00e3a, // Thai Character Sara I   ..Thai Character Phinthu
			0x00e47...0x00e4e, // Thai Character Maitaikhu..Thai Character Yamakkan
			0x00eb1...0x00eb1, // Lao Vowel Sign Mai Kan
			0x00eb4...0x00ebc, // Lao Vowel Sign I        ..Lao Semivowel Sign Lo
			0x00ec8...0x00ecd, // Lao Tone Mai Ek         ..Lao Niggahita
			0x00f18...0x00f19, // Tibetan Astrological Sig..Tibetan Astrological Sig
			0x00f35...0x00f35, // Tibetan Mark Ngas Bzung Nyi Zla
			0x00f37...0x00f37, // Tibetan Mark Ngas Bzung Sgor Rtags
			0x00f39...0x00f39, // Tibetan Mark Tsa -phru
			0x00f3e...0x00f3f, // Tibetan Sign Yar Tshes  ..Tibetan Sign Mar Tshes
			0x00f71...0x00f84, // Tibetan Vowel Sign Aa   ..Tibetan Mark Halanta
			0x00f86...0x00f87, // Tibetan Sign Lci Rtags  ..Tibetan Sign Yang Rtags
			0x00f8d...0x00f97, // Tibetan Subjoined Sign L..Tibetan Subjoined Letter
			0x00f99...0x00fbc, // Tibetan Subjoined Letter..Tibetan Subjoined Letter
			0x00fc6...0x00fc6, // Tibetan Symbol Padma Gdan
			0x0102b...0x0103e, // Myanmar Vowel Sign Tall ..Myanmar Consonant Sign M
			0x01056...0x01059, // Myanmar Vowel Sign Vocal..Myanmar Vowel Sign Vocal
			0x0105e...0x01060, // Myanmar Consonant Sign M..Myanmar Consonant Sign M
			0x01062...0x01064, // Myanmar Vowel Sign Sgaw ..Myanmar Tone Mark Sgaw K
			0x01067...0x0106d, // Myanmar Vowel Sign Weste..Myanmar Sign Western Pwo
			0x01071...0x01074, // Myanmar Vowel Sign Geba ..Myanmar Vowel Sign Kayah
			0x01082...0x0108d, // Myanmar Consonant Sign S..Myanmar Sign Shan Counci
			0x0108f...0x0108f, // Myanmar Sign Rumai Palaung Tone-5
			0x0109a...0x0109d, // Myanmar Sign Khamti Tone..Myanmar Vowel Sign Aiton
			0x01160...0x011ff, // Hangul Jungseong Filler ..Hangul Jongseong Ssangni
			0x0135d...0x0135f, // Ethiopic Combining Gemin..Ethiopic Combining Gemin
			0x01712...0x01715, // Tagalog Vowel Sign I    ..Tagalog Sign Pamudpod
			0x01732...0x01734, // Hanunoo Vowel Sign I    ..Hanunoo Sign Pamudpod
			0x01752...0x01753, // Buhid Vowel Sign I      ..Buhid Vowel Sign U
			0x01772...0x01773, // Tagbanwa Vowel Sign I   ..Tagbanwa Vowel Sign U
			0x017b4...0x017d3, // Khmer Vowel Inherent Aq ..Khmer Sign Bathamasat
			0x017dd...0x017dd, // Khmer Sign Atthacan
			0x0180b...0x0180f, // Mongolian Free Variation..Mongolian Free Variation
			0x01885...0x01886, // Mongolian Letter Ali Gal..Mongolian Letter Ali Gal
			0x018a9...0x018a9, // Mongolian Letter Ali Gali Dagalga
			0x01920...0x0192b, // Limbu Vowel Sign A      ..Limbu Subjoined Letter W
			0x01930...0x0193b, // Limbu Small Letter Ka   ..Limbu Sign Sa-i
			0x01a17...0x01a1b, // Buginese Vowel Sign I   ..Buginese Vowel Sign Ae
			0x01a55...0x01a5e, // Tai Tham Consonant Sign ..Tai Tham Consonant Sign
			0x01a60...0x01a7c, // Tai Tham Sign Sakot     ..Tai Tham Sign Khuen-lue
			0x01a7f...0x01a7f, // Tai Tham Combining Cryptogrammic Dot
			0x01ab0...0x01ace, // Combining Doubled Circum..Combining Latin Small Le
			0x01b00...0x01b04, // Balinese Sign Ulu Ricem ..Balinese Sign Bisah
			0x01b34...0x01b44, // Balinese Sign Rerekan   ..Balinese Adeg Adeg
			0x01b6b...0x01b73, // Balinese Musical Symbol ..Balinese Musical Symbol
			0x01b80...0x01b82, // Sundanese Sign Panyecek ..Sundanese Sign Pangwisad
			0x01ba1...0x01bad, // Sundanese Consonant Sign..Sundanese Consonant Sign
			0x01be6...0x01bf3, // Batak Sign Tompi        ..Batak Panongonan
			0x01c24...0x01c37, // Lepcha Subjoined Letter ..Lepcha Sign Nukta
			0x01cd0...0x01cd2, // Vedic Tone Karshana     ..Vedic Tone Prenkha
			0x01cd4...0x01ce8, // Vedic Sign Yajurvedic Mi..Vedic Sign Visarga Anuda
			0x01ced...0x01ced, // Vedic Sign Tiryak
			0x01cf4...0x01cf4, // Vedic Tone Candra Above
			0x01cf7...0x01cf9, // Vedic Sign Atikrama     ..Vedic Tone Double Ring A
			0x01dc0...0x01dff, // Combining Dotted Grave A..Combining Right Arrowhea
			0x0200b...0x0200f, // Zero Width Space        ..Right-to-left Mark
			0x02028...0x0202e, // Line Separator          ..Right-to-left Override
			0x02060...0x02064, // Word Joiner             ..Invisible Plus
			0x02066...0x0206f, // Left-to-right Isolate   ..Nominal Digit Shapes
			0x020d0...0x020f0, // Combining Left Harpoon A..Combining Asterisk Above
			0x02cef...0x02cf1, // Coptic Combining Ni Abov..Coptic Combining Spiritu
			0x02d7f...0x02d7f, // Tifinagh Consonant Joiner
			0x02de0...0x02dff, // Combining Cyrillic Lette..Combining Cyrillic Lette
			0x0302a...0x0302f, // Ideographic Level Tone M..Hangul Double Dot Tone M
			0x03099...0x0309a, // Combining Katakana-hirag..Combining Katakana-hirag
			0x0a66f...0x0a672, // Combining Cyrillic Vzmet..Combining Cyrillic Thous
			0x0a674...0x0a67d, // Combining Cyrillic Lette..Combining Cyrillic Payer
			0x0a69e...0x0a69f, // Combining Cyrillic Lette..Combining Cyrillic Lette
			0x0a6f0...0x0a6f1, // Bamum Combining Mark Koq..Bamum Combining Mark Tuk
			0x0a802...0x0a802, // Syloti Nagri Sign Dvisvara
			0x0a806...0x0a806, // Syloti Nagri Sign Hasanta
			0x0a80b...0x0a80b, // Syloti Nagri Sign Anusvara
			0x0a823...0x0a827, // Syloti Nagri Vowel Sign ..Syloti Nagri Vowel Sign
			0x0a82c...0x0a82c, // Syloti Nagri Sign Alternate Hasanta
			0x0a880...0x0a881, // Saurashtra Sign Anusvara..Saurashtra Sign Visarga
			0x0a8b4...0x0a8c5, // Saurashtra Consonant Sig..Saurashtra Sign Candrabi
			0x0a8e0...0x0a8f1, // Combining Devanagari Dig..Combining Devanagari Sig
			0x0a8ff...0x0a8ff, // Devanagari Vowel Sign Ay
			0x0a926...0x0a92d, // Kayah Li Vowel Ue       ..Kayah Li Tone Calya Plop
			0x0a947...0x0a953, // Rejang Vowel Sign I     ..Rejang Virama
			0x0a980...0x0a983, // Javanese Sign Panyangga ..Javanese Sign Wignyan
			0x0a9b3...0x0a9c0, // Javanese Sign Cecak Telu..Javanese Pangkon
			0x0a9e5...0x0a9e5, // Myanmar Sign Shan Saw
			0x0aa29...0x0aa36, // Cham Vowel Sign Aa      ..Cham Consonant Sign Wa
			0x0aa43...0x0aa43, // Cham Consonant Sign Final Ng
			0x0aa4c...0x0aa4d, // Cham Consonant Sign Fina..Cham Consonant Sign Fina
			0x0aa7b...0x0aa7d, // Myanmar Sign Pao Karen T..Myanmar Sign Tai Laing T
			0x0aab0...0x0aab0, // Tai Viet Mai Kang
			0x0aab2...0x0aab4, // Tai Viet Vowel I        ..Tai Viet Vowel U
			0x0aab7...0x0aab8, // Tai Viet Mai Khit       ..Tai Viet Vowel Ia
			0x0aabe...0x0aabf, // Tai Viet Vowel Am       ..Tai Viet Tone Mai Ek
			0x0aac1...0x0aac1, // Tai Viet Tone Mai Tho
			0x0aaeb...0x0aaef, // Meetei Mayek Vowel Sign ..Meetei Mayek Vowel Sign
			0x0aaf5...0x0aaf6, // Meetei Mayek Vowel Sign ..Meetei Mayek Virama
			0x0abe3...0x0abea, // Meetei Mayek Vowel Sign ..Meetei Mayek Vowel Sign
			0x0abec...0x0abed, // Meetei Mayek Lum Iyek   ..Meetei Mayek Apun Iyek
			0x0d7b0...0x0d7ff, // Hangul Jungseong O-yeo  ..(nil)
			0x0fb1e...0x0fb1e, // Hebrew Point Judeo-spanish Varika
			0x0fe00...0x0fe0f, // Variation Selector-1    ..Variation Selector-16
			0x0fe20...0x0fe2f, // Combining Ligature Left ..Combining Cyrillic Titlo
			0x0feff...0x0feff, // Zero Width No-break Space
			0x0fff9...0x0fffb, // Interlinear Annotation A..Interlinear Annotation T
			0x101fd...0x101fd, // Phaistos Disc Sign Combining Oblique Stroke
			0x102e0...0x102e0, // Coptic Epact Thousands Mark
			0x10376...0x1037a, // Combining Old Permic Let..Combining Old Permic Let
			0x10a01...0x10a03, // Kharoshthi Vowel Sign I ..Kharoshthi Vowel Sign Vo
			0x10a05...0x10a06, // Kharoshthi Vowel Sign E ..Kharoshthi Vowel Sign O
			0x10a0c...0x10a0f, // Kharoshthi Vowel Length ..Kharoshthi Sign Visarga
			0x10a38...0x10a3a, // Kharoshthi Sign Bar Abov..Kharoshthi Sign Dot Belo
			0x10a3f...0x10a3f, // Kharoshthi Virama
			0x10ae5...0x10ae6, // Manichaean Abbreviation ..Manichaean Abbreviation
			0x10d24...0x10d27, // Hanifi Rohingya Sign Har..Hanifi Rohingya Sign Tas
			0x10eab...0x10eac, // Yezidi Combining Hamza M..Yezidi Combining Madda M
			0x10f46...0x10f50, // Sogdian Combining Dot Be..Sogdian Combining Stroke
			0x10f82...0x10f85, // Old Uyghur Combining Dot..Old Uyghur Combining Two
			0x11000...0x11002, // Brahmi Sign Candrabindu ..Brahmi Sign Visarga
			0x11038...0x11046, // Brahmi Vowel Sign Aa    ..Brahmi Virama
			0x11070...0x11070, // Brahmi Sign Old Tamil Virama
			0x11073...0x11074, // Brahmi Vowel Sign Old Ta..Brahmi Vowel Sign Old Ta
			0x1107f...0x11082, // Brahmi Number Joiner    ..Kaithi Sign Visarga
			0x110b0...0x110ba, // Kaithi Vowel Sign Aa    ..Kaithi Sign Nukta
			0x110bd...0x110bd, // Kaithi Number Sign
			0x110c2...0x110c2, // Kaithi Vowel Sign Vocalic R
			0x110cd...0x110cd, // Kaithi Number Sign Above
			0x11100...0x11102, // Chakma Sign Candrabindu ..Chakma Sign Visarga
			0x11127...0x11134, // Chakma Vowel Sign A     ..Chakma Maayyaa
			0x11145...0x11146, // Chakma Vowel Sign Aa    ..Chakma Vowel Sign Ei
			0x11173...0x11173, // Mahajani Sign Nukta
			0x11180...0x11182, // Sharada Sign Candrabindu..Sharada Sign Visarga
			0x111b3...0x111c0, // Sharada Vowel Sign Aa   ..Sharada Sign Virama
			0x111c9...0x111cc, // Sharada Sandhi Mark     ..Sharada Extra Short Vowe
			0x111ce...0x111cf, // Sharada Vowel Sign Prish..Sharada Sign Inverted Ca
			0x1122c...0x11237, // Khojki Vowel Sign Aa    ..Khojki Sign Shadda
			0x1123e...0x1123e, // Khojki Sign Sukun
			0x112df...0x112ea, // Khudawadi Sign Anusvara ..Khudawadi Sign Virama
			0x11300...0x11303, // Grantha Sign Combining A..Grantha Sign Visarga
			0x1133b...0x1133c, // Combining Bindu Below   ..Grantha Sign Nukta
			0x1133e...0x11344, // Grantha Vowel Sign Aa   ..Grantha Vowel Sign Vocal
			0x11347...0x11348, // Grantha Vowel Sign Ee   ..Grantha Vowel Sign Ai
			0x1134b...0x1134d, // Grantha Vowel Sign Oo   ..Grantha Sign Virama
			0x11357...0x11357, // Grantha Au Length Mark
			0x11362...0x11363, // Grantha Vowel Sign Vocal..Grantha Vowel Sign Vocal
			0x11366...0x1136c, // Combining Grantha Digit ..Combining Grantha Digit
			0x11370...0x11374, // Combining Grantha Letter..Combining Grantha Letter
			0x11435...0x11446, // Newa Vowel Sign Aa      ..Newa Sign Nukta
			0x1145e...0x1145e, // Newa Sandhi Mark
			0x114b0...0x114c3, // Tirhuta Vowel Sign Aa   ..Tirhuta Sign Nukta
			0x115af...0x115b5, // Siddham Vowel Sign Aa   ..Siddham Vowel Sign Vocal
			0x115b8...0x115c0, // Siddham Vowel Sign E    ..Siddham Sign Nukta
			0x115dc...0x115dd, // Siddham Vowel Sign Alter..Siddham Vowel Sign Alter
			0x11630...0x11640, // Modi Vowel Sign Aa      ..Modi Sign Ardhacandra
			0x116ab...0x116b7, // Takri Sign Anusvara     ..Takri Sign Nukta
			0x1171d...0x1172b, // Ahom Consonant Sign Medi..Ahom Sign Killer
			0x1182c...0x1183a, // Dogra Vowel Sign Aa     ..Dogra Sign Nukta
			0x11930...0x11935, // Dives Akuru Vowel Sign A..Dives Akuru Vowel Sign E
			0x11937...0x11938, // Dives Akuru Vowel Sign A..Dives Akuru Vowel Sign O
			0x1193b...0x1193e, // Dives Akuru Sign Anusvar..Dives Akuru Virama
			0x11940...0x11940, // Dives Akuru Medial Ya
			0x11942...0x11943, // Dives Akuru Medial Ra   ..Dives Akuru Sign Nukta
			0x119d1...0x119d7, // Nandinagari Vowel Sign A..Nandinagari Vowel Sign V
			0x119da...0x119e0, // Nandinagari Vowel Sign E..Nandinagari Sign Virama
			0x119e4...0x119e4, // Nandinagari Vowel Sign Prishthamatra E
			0x11a01...0x11a0a, // Zanabazar Square Vowel S..Zanabazar Square Vowel L
			0x11a33...0x11a39, // Zanabazar Square Final C..Zanabazar Square Sign Vi
			0x11a3b...0x11a3e, // Zanabazar Square Cluster..Zanabazar Square Cluster
			0x11a47...0x11a47, // Zanabazar Square Subjoiner
			0x11a51...0x11a5b, // Soyombo Vowel Sign I    ..Soyombo Vowel Length Mar
			0x11a8a...0x11a99, // Soyombo Final Consonant ..Soyombo Subjoiner
			0x11c2f...0x11c36, // Bhaiksuki Vowel Sign Aa ..Bhaiksuki Vowel Sign Voc
			0x11c38...0x11c3f, // Bhaiksuki Vowel Sign E  ..Bhaiksuki Sign Virama
			0x11c92...0x11ca7, // Marchen Subjoined Letter..Marchen Subjoined Letter
			0x11ca9...0x11cb6, // Marchen Subjoined Letter..Marchen Sign Candrabindu
			0x11d31...0x11d36, // Masaram Gondi Vowel Sign..Masaram Gondi Vowel Sign
			0x11d3a...0x11d3a, // Masaram Gondi Vowel Sign E
			0x11d3c...0x11d3d, // Masaram Gondi Vowel Sign..Masaram Gondi Vowel Sign
			0x11d3f...0x11d45, // Masaram Gondi Vowel Sign..Masaram Gondi Virama
			0x11d47...0x11d47, // Masaram Gondi Ra-kara
			0x11d8a...0x11d8e, // Gunjala Gondi Vowel Sign..Gunjala Gondi Vowel Sign
			0x11d90...0x11d91, // Gunjala Gondi Vowel Sign..Gunjala Gondi Vowel Sign
			0x11d93...0x11d97, // Gunjala Gondi Vowel Sign..Gunjala Gondi Virama
			0x11ef3...0x11ef6, // Makasar Vowel Sign I    ..Makasar Vowel Sign O
			0x13430...0x13438, // Egyptian Hieroglyph Vert..Egyptian Hieroglyph End
			0x16af0...0x16af4, // Bassa Vah Combining High..Bassa Vah Combining High
			0x16b30...0x16b36, // Pahawh Hmong Mark Cim Tu..Pahawh Hmong Mark Cim Ta
			0x16f4f...0x16f4f, // Miao Sign Consonant Modifier Bar
			0x16f51...0x16f87, // Miao Sign Aspiration    ..Miao Vowel Sign Ui
			0x16f8f...0x16f92, // Miao Tone Right         ..Miao Tone Below
			0x16fe4...0x16fe4, // Khitan Small Script Filler
			0x16ff0...0x16ff1, // Vietnamese Alternate Rea..Vietnamese Alternate Rea
			0x1bc9d...0x1bc9e, // Duployan Thick Letter Se..Duployan Double Mark
			0x1bca0...0x1bca3, // Shorthand Format Letter ..Shorthand Format Up Step
			0x1cf00...0x1cf2d, // Znamenny Combining Mark ..Znamenny Combining Mark
			0x1cf30...0x1cf46, // Znamenny Combining Tonal..Znamenny Priznak Modifie
			0x1d165...0x1d169, // Musical Symbol Combining..Musical Symbol Combining
			0x1d16d...0x1d182, // Musical Symbol Combining..Musical Symbol Combining
			0x1d185...0x1d18b, // Musical Symbol Combining..Musical Symbol Combining
			0x1d1aa...0x1d1ad, // Musical Symbol Combining..Musical Symbol Combining
			0x1d242...0x1d244, // Combining Greek Musical ..Combining Greek Musical
			0x1da00...0x1da36, // Signwriting Head Rim    ..Signwriting Air Sucking
			0x1da3b...0x1da6c, // Signwriting Mouth Closed..Signwriting Excitement
			0x1da75...0x1da75, // Signwriting Upper Body Tilting From Hip Joints
			0x1da84...0x1da84, // Signwriting Location Head Neck
			0x1da9b...0x1da9f, // Signwriting Fill Modifie..Signwriting Fill Modifie
			0x1daa1...0x1daaf, // Signwriting Rotation Mod..Signwriting Rotation Mod
			0x1e000...0x1e006, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e008...0x1e018, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e01b...0x1e021, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e023...0x1e024, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e026...0x1e02a, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e130...0x1e136, // Nyiakeng Puachue Hmong T..Nyiakeng Puachue Hmong T
			0x1e2ae...0x1e2ae, // Toto Sign Rising Tone
			0x1e2ec...0x1e2ef, // Wancho Tone Tup         ..Wancho Tone Koini
			0x1e8d0...0x1e8d6, // Mende Kikakui Combining ..Mende Kikakui Combining
			0x1e944...0x1e94a, // Adlam Alif Lengthener   ..Adlam Nukta
			0x1f3fb...0x1f3ff, // Emoji Modifier Fitzpatri..Emoji Modifier Fitzpatri
			0xe0001...0xe0001, // Language Tag
			0xe0020...0xe007f, // Tag Space               ..Cancel Tag
			0xe0100...0xe01ef, // Variation Selector-17   ..Variation Selector-256
			=> true,
			else => false,
		},
		.@"15.0.0" => switch (codepoint) {
			// Source: DerivedGeneralCategory-15.0.0.txt
			// Date: 2022-04-26, 23:14:35 GMT
			0x00000...0x00000, // (nil)
			0x000ad...0x000ad, // Soft Hyphen
			0x00300...0x0036f, // Combining Grave Accent  ..Combining Latin Small Le
			0x00483...0x00489, // Combining Cyrillic Titlo..Combining Cyrillic Milli
			0x00591...0x005bd, // Hebrew Accent Etnahta   ..Hebrew Point Meteg
			0x005bf...0x005bf, // Hebrew Point Rafe
			0x005c1...0x005c2, // Hebrew Point Shin Dot   ..Hebrew Point Sin Dot
			0x005c4...0x005c5, // Hebrew Mark Upper Dot   ..Hebrew Mark Lower Dot
			0x005c7...0x005c7, // Hebrew Point Qamats Qatan
			0x00600...0x00605, // Arabic Number Sign      ..Arabic Number Mark Above
			0x00610...0x0061a, // Arabic Sign Sallallahou ..Arabic Small Kasra
			0x0061c...0x0061c, // Arabic Letter Mark
			0x0064b...0x0065f, // Arabic Fathatan         ..Arabic Wavy Hamza Below
			0x00670...0x00670, // Arabic Letter Superscript Alef
			0x006d6...0x006dd, // Arabic Small High Ligatu..Arabic End Of Ayah
			0x006df...0x006e4, // Arabic Small High Rounde..Arabic Small High Madda
			0x006e7...0x006e8, // Arabic Small High Yeh   ..Arabic Small High Noon
			0x006ea...0x006ed, // Arabic Empty Centre Low ..Arabic Small Low Meem
			0x0070f...0x0070f, // Syriac Abbreviation Mark
			0x00711...0x00711, // Syriac Letter Superscript Alaph
			0x00730...0x0074a, // Syriac Pthaha Above     ..Syriac Barrekh
			0x007a6...0x007b0, // Thaana Abafili          ..Thaana Sukun
			0x007eb...0x007f3, // Nko Combining Short High..Nko Combining Double Dot
			0x007fd...0x007fd, // Nko Dantayalan
			0x00816...0x00819, // Samaritan Mark In       ..Samaritan Mark Dagesh
			0x0081b...0x00823, // Samaritan Mark Epentheti..Samaritan Vowel Sign A
			0x00825...0x00827, // Samaritan Vowel Sign Sho..Samaritan Vowel Sign U
			0x00829...0x0082d, // Samaritan Vowel Sign Lon..Samaritan Mark Nequdaa
			0x00859...0x0085b, // Mandaic Affrication Mark..Mandaic Gemination Mark
			0x00890...0x00891, // Arabic Pound Mark Above ..Arabic Piastre Mark Abov
			0x00898...0x0089f, // Arabic Small High Word A..Arabic Half Madda Over M
			0x008ca...0x00903, // Arabic Small High Farsi ..Devanagari Sign Visarga
			0x0093a...0x0093c, // Devanagari Vowel Sign Oe..Devanagari Sign Nukta
			0x0093e...0x0094f, // Devanagari Vowel Sign Aa..Devanagari Vowel Sign Aw
			0x00951...0x00957, // Devanagari Stress Sign U..Devanagari Vowel Sign Uu
			0x00962...0x00963, // Devanagari Vowel Sign Vo..Devanagari Vowel Sign Vo
			0x00981...0x00983, // Bengali Sign Candrabindu..Bengali Sign Visarga
			0x009bc...0x009bc, // Bengali Sign Nukta
			0x009be...0x009c4, // Bengali Vowel Sign Aa   ..Bengali Vowel Sign Vocal
			0x009c7...0x009c8, // Bengali Vowel Sign E    ..Bengali Vowel Sign Ai
			0x009cb...0x009cd, // Bengali Vowel Sign O    ..Bengali Sign Virama
			0x009d7...0x009d7, // Bengali Au Length Mark
			0x009e2...0x009e3, // Bengali Vowel Sign Vocal..Bengali Vowel Sign Vocal
			0x009fe...0x009fe, // Bengali Sandhi Mark
			0x00a01...0x00a03, // Gurmukhi Sign Adak Bindi..Gurmukhi Sign Visarga
			0x00a3c...0x00a3c, // Gurmukhi Sign Nukta
			0x00a3e...0x00a42, // Gurmukhi Vowel Sign Aa  ..Gurmukhi Vowel Sign Uu
			0x00a47...0x00a48, // Gurmukhi Vowel Sign Ee  ..Gurmukhi Vowel Sign Ai
			0x00a4b...0x00a4d, // Gurmukhi Vowel Sign Oo  ..Gurmukhi Sign Virama
			0x00a51...0x00a51, // Gurmukhi Sign Udaat
			0x00a70...0x00a71, // Gurmukhi Tippi          ..Gurmukhi Addak
			0x00a75...0x00a75, // Gurmukhi Sign Yakash
			0x00a81...0x00a83, // Gujarati Sign Candrabind..Gujarati Sign Visarga
			0x00abc...0x00abc, // Gujarati Sign Nukta
			0x00abe...0x00ac5, // Gujarati Vowel Sign Aa  ..Gujarati Vowel Sign Cand
			0x00ac7...0x00ac9, // Gujarati Vowel Sign E   ..Gujarati Vowel Sign Cand
			0x00acb...0x00acd, // Gujarati Vowel Sign O   ..Gujarati Sign Virama
			0x00ae2...0x00ae3, // Gujarati Vowel Sign Voca..Gujarati Vowel Sign Voca
			0x00afa...0x00aff, // Gujarati Sign Sukun     ..Gujarati Sign Two-circle
			0x00b01...0x00b03, // Oriya Sign Candrabindu  ..Oriya Sign Visarga
			0x00b3c...0x00b3c, // Oriya Sign Nukta
			0x00b3e...0x00b44, // Oriya Vowel Sign Aa     ..Oriya Vowel Sign Vocalic
			0x00b47...0x00b48, // Oriya Vowel Sign E      ..Oriya Vowel Sign Ai
			0x00b4b...0x00b4d, // Oriya Vowel Sign O      ..Oriya Sign Virama
			0x00b55...0x00b57, // Oriya Sign Overline     ..Oriya Au Length Mark
			0x00b62...0x00b63, // Oriya Vowel Sign Vocalic..Oriya Vowel Sign Vocalic
			0x00b82...0x00b82, // Tamil Sign Anusvara
			0x00bbe...0x00bc2, // Tamil Vowel Sign Aa     ..Tamil Vowel Sign Uu
			0x00bc6...0x00bc8, // Tamil Vowel Sign E      ..Tamil Vowel Sign Ai
			0x00bca...0x00bcd, // Tamil Vowel Sign O      ..Tamil Sign Virama
			0x00bd7...0x00bd7, // Tamil Au Length Mark
			0x00c00...0x00c04, // Telugu Sign Combining Ca..Telugu Sign Combining An
			0x00c3c...0x00c3c, // Telugu Sign Nukta
			0x00c3e...0x00c44, // Telugu Vowel Sign Aa    ..Telugu Vowel Sign Vocali
			0x00c46...0x00c48, // Telugu Vowel Sign E     ..Telugu Vowel Sign Ai
			0x00c4a...0x00c4d, // Telugu Vowel Sign O     ..Telugu Sign Virama
			0x00c55...0x00c56, // Telugu Length Mark      ..Telugu Ai Length Mark
			0x00c62...0x00c63, // Telugu Vowel Sign Vocali..Telugu Vowel Sign Vocali
			0x00c81...0x00c83, // Kannada Sign Candrabindu..Kannada Sign Visarga
			0x00cbc...0x00cbc, // Kannada Sign Nukta
			0x00cbe...0x00cc4, // Kannada Vowel Sign Aa   ..Kannada Vowel Sign Vocal
			0x00cc6...0x00cc8, // Kannada Vowel Sign E    ..Kannada Vowel Sign Ai
			0x00cca...0x00ccd, // Kannada Vowel Sign O    ..Kannada Sign Virama
			0x00cd5...0x00cd6, // Kannada Length Mark     ..Kannada Ai Length Mark
			0x00ce2...0x00ce3, // Kannada Vowel Sign Vocal..Kannada Vowel Sign Vocal
			0x00cf3...0x00cf3, // Kannada Sign Combining Anusvara Above Right
			0x00d00...0x00d03, // Malayalam Sign Combining..Malayalam Sign Visarga
			0x00d3b...0x00d3c, // Malayalam Sign Vertical ..Malayalam Sign Circular
			0x00d3e...0x00d44, // Malayalam Vowel Sign Aa ..Malayalam Vowel Sign Voc
			0x00d46...0x00d48, // Malayalam Vowel Sign E  ..Malayalam Vowel Sign Ai
			0x00d4a...0x00d4d, // Malayalam Vowel Sign O  ..Malayalam Sign Virama
			0x00d57...0x00d57, // Malayalam Au Length Mark
			0x00d62...0x00d63, // Malayalam Vowel Sign Voc..Malayalam Vowel Sign Voc
			0x00d81...0x00d83, // Sinhala Sign Candrabindu..Sinhala Sign Visargaya
			0x00dca...0x00dca, // Sinhala Sign Al-lakuna
			0x00dcf...0x00dd4, // Sinhala Vowel Sign Aela-..Sinhala Vowel Sign Ketti
			0x00dd6...0x00dd6, // Sinhala Vowel Sign Diga Paa-pilla
			0x00dd8...0x00ddf, // Sinhala Vowel Sign Gaett..Sinhala Vowel Sign Gayan
			0x00df2...0x00df3, // Sinhala Vowel Sign Diga ..Sinhala Vowel Sign Diga
			0x00e31...0x00e31, // Thai Character Mai Han-akat
			0x00e34...0x00e3a, // Thai Character Sara I   ..Thai Character Phinthu
			0x00e47...0x00e4e, // Thai Character Maitaikhu..Thai Character Yamakkan
			0x00eb1...0x00eb1, // Lao Vowel Sign Mai Kan
			0x00eb4...0x00ebc, // Lao Vowel Sign I        ..Lao Semivowel Sign Lo
			0x00ec8...0x00ece, // Lao Tone Mai Ek         ..Lao Yamakkan
			0x00f18...0x00f19, // Tibetan Astrological Sig..Tibetan Astrological Sig
			0x00f35...0x00f35, // Tibetan Mark Ngas Bzung Nyi Zla
			0x00f37...0x00f37, // Tibetan Mark Ngas Bzung Sgor Rtags
			0x00f39...0x00f39, // Tibetan Mark Tsa -phru
			0x00f3e...0x00f3f, // Tibetan Sign Yar Tshes  ..Tibetan Sign Mar Tshes
			0x00f71...0x00f84, // Tibetan Vowel Sign Aa   ..Tibetan Mark Halanta
			0x00f86...0x00f87, // Tibetan Sign Lci Rtags  ..Tibetan Sign Yang Rtags
			0x00f8d...0x00f97, // Tibetan Subjoined Sign L..Tibetan Subjoined Letter
			0x00f99...0x00fbc, // Tibetan Subjoined Letter..Tibetan Subjoined Letter
			0x00fc6...0x00fc6, // Tibetan Symbol Padma Gdan
			0x0102b...0x0103e, // Myanmar Vowel Sign Tall ..Myanmar Consonant Sign M
			0x01056...0x01059, // Myanmar Vowel Sign Vocal..Myanmar Vowel Sign Vocal
			0x0105e...0x01060, // Myanmar Consonant Sign M..Myanmar Consonant Sign M
			0x01062...0x01064, // Myanmar Vowel Sign Sgaw ..Myanmar Tone Mark Sgaw K
			0x01067...0x0106d, // Myanmar Vowel Sign Weste..Myanmar Sign Western Pwo
			0x01071...0x01074, // Myanmar Vowel Sign Geba ..Myanmar Vowel Sign Kayah
			0x01082...0x0108d, // Myanmar Consonant Sign S..Myanmar Sign Shan Counci
			0x0108f...0x0108f, // Myanmar Sign Rumai Palaung Tone-5
			0x0109a...0x0109d, // Myanmar Sign Khamti Tone..Myanmar Vowel Sign Aiton
			0x01160...0x011ff, // Hangul Jungseong Filler ..Hangul Jongseong Ssangni
			0x0135d...0x0135f, // Ethiopic Combining Gemin..Ethiopic Combining Gemin
			0x01712...0x01715, // Tagalog Vowel Sign I    ..Tagalog Sign Pamudpod
			0x01732...0x01734, // Hanunoo Vowel Sign I    ..Hanunoo Sign Pamudpod
			0x01752...0x01753, // Buhid Vowel Sign I      ..Buhid Vowel Sign U
			0x01772...0x01773, // Tagbanwa Vowel Sign I   ..Tagbanwa Vowel Sign U
			0x017b4...0x017d3, // Khmer Vowel Inherent Aq ..Khmer Sign Bathamasat
			0x017dd...0x017dd, // Khmer Sign Atthacan
			0x0180b...0x0180f, // Mongolian Free Variation..Mongolian Free Variation
			0x01885...0x01886, // Mongolian Letter Ali Gal..Mongolian Letter Ali Gal
			0x018a9...0x018a9, // Mongolian Letter Ali Gali Dagalga
			0x01920...0x0192b, // Limbu Vowel Sign A      ..Limbu Subjoined Letter W
			0x01930...0x0193b, // Limbu Small Letter Ka   ..Limbu Sign Sa-i
			0x01a17...0x01a1b, // Buginese Vowel Sign I   ..Buginese Vowel Sign Ae
			0x01a55...0x01a5e, // Tai Tham Consonant Sign ..Tai Tham Consonant Sign
			0x01a60...0x01a7c, // Tai Tham Sign Sakot     ..Tai Tham Sign Khuen-lue
			0x01a7f...0x01a7f, // Tai Tham Combining Cryptogrammic Dot
			0x01ab0...0x01ace, // Combining Doubled Circum..Combining Latin Small Le
			0x01b00...0x01b04, // Balinese Sign Ulu Ricem ..Balinese Sign Bisah
			0x01b34...0x01b44, // Balinese Sign Rerekan   ..Balinese Adeg Adeg
			0x01b6b...0x01b73, // Balinese Musical Symbol ..Balinese Musical Symbol
			0x01b80...0x01b82, // Sundanese Sign Panyecek ..Sundanese Sign Pangwisad
			0x01ba1...0x01bad, // Sundanese Consonant Sign..Sundanese Consonant Sign
			0x01be6...0x01bf3, // Batak Sign Tompi        ..Batak Panongonan
			0x01c24...0x01c37, // Lepcha Subjoined Letter ..Lepcha Sign Nukta
			0x01cd0...0x01cd2, // Vedic Tone Karshana     ..Vedic Tone Prenkha
			0x01cd4...0x01ce8, // Vedic Sign Yajurvedic Mi..Vedic Sign Visarga Anuda
			0x01ced...0x01ced, // Vedic Sign Tiryak
			0x01cf4...0x01cf4, // Vedic Tone Candra Above
			0x01cf7...0x01cf9, // Vedic Sign Atikrama     ..Vedic Tone Double Ring A
			0x01dc0...0x01dff, // Combining Dotted Grave A..Combining Right Arrowhea
			0x0200b...0x0200f, // Zero Width Space        ..Right-to-left Mark
			0x02028...0x0202e, // Line Separator          ..Right-to-left Override
			0x02060...0x02064, // Word Joiner             ..Invisible Plus
			0x02066...0x0206f, // Left-to-right Isolate   ..Nominal Digit Shapes
			0x020d0...0x020f0, // Combining Left Harpoon A..Combining Asterisk Above
			0x02cef...0x02cf1, // Coptic Combining Ni Abov..Coptic Combining Spiritu
			0x02d7f...0x02d7f, // Tifinagh Consonant Joiner
			0x02de0...0x02dff, // Combining Cyrillic Lette..Combining Cyrillic Lette
			0x0302a...0x0302f, // Ideographic Level Tone M..Hangul Double Dot Tone M
			0x03099...0x0309a, // Combining Katakana-hirag..Combining Katakana-hirag
			0x0a66f...0x0a672, // Combining Cyrillic Vzmet..Combining Cyrillic Thous
			0x0a674...0x0a67d, // Combining Cyrillic Lette..Combining Cyrillic Payer
			0x0a69e...0x0a69f, // Combining Cyrillic Lette..Combining Cyrillic Lette
			0x0a6f0...0x0a6f1, // Bamum Combining Mark Koq..Bamum Combining Mark Tuk
			0x0a802...0x0a802, // Syloti Nagri Sign Dvisvara
			0x0a806...0x0a806, // Syloti Nagri Sign Hasanta
			0x0a80b...0x0a80b, // Syloti Nagri Sign Anusvara
			0x0a823...0x0a827, // Syloti Nagri Vowel Sign ..Syloti Nagri Vowel Sign
			0x0a82c...0x0a82c, // Syloti Nagri Sign Alternate Hasanta
			0x0a880...0x0a881, // Saurashtra Sign Anusvara..Saurashtra Sign Visarga
			0x0a8b4...0x0a8c5, // Saurashtra Consonant Sig..Saurashtra Sign Candrabi
			0x0a8e0...0x0a8f1, // Combining Devanagari Dig..Combining Devanagari Sig
			0x0a8ff...0x0a8ff, // Devanagari Vowel Sign Ay
			0x0a926...0x0a92d, // Kayah Li Vowel Ue       ..Kayah Li Tone Calya Plop
			0x0a947...0x0a953, // Rejang Vowel Sign I     ..Rejang Virama
			0x0a980...0x0a983, // Javanese Sign Panyangga ..Javanese Sign Wignyan
			0x0a9b3...0x0a9c0, // Javanese Sign Cecak Telu..Javanese Pangkon
			0x0a9e5...0x0a9e5, // Myanmar Sign Shan Saw
			0x0aa29...0x0aa36, // Cham Vowel Sign Aa      ..Cham Consonant Sign Wa
			0x0aa43...0x0aa43, // Cham Consonant Sign Final Ng
			0x0aa4c...0x0aa4d, // Cham Consonant Sign Fina..Cham Consonant Sign Fina
			0x0aa7b...0x0aa7d, // Myanmar Sign Pao Karen T..Myanmar Sign Tai Laing T
			0x0aab0...0x0aab0, // Tai Viet Mai Kang
			0x0aab2...0x0aab4, // Tai Viet Vowel I        ..Tai Viet Vowel U
			0x0aab7...0x0aab8, // Tai Viet Mai Khit       ..Tai Viet Vowel Ia
			0x0aabe...0x0aabf, // Tai Viet Vowel Am       ..Tai Viet Tone Mai Ek
			0x0aac1...0x0aac1, // Tai Viet Tone Mai Tho
			0x0aaeb...0x0aaef, // Meetei Mayek Vowel Sign ..Meetei Mayek Vowel Sign
			0x0aaf5...0x0aaf6, // Meetei Mayek Vowel Sign ..Meetei Mayek Virama
			0x0abe3...0x0abea, // Meetei Mayek Vowel Sign ..Meetei Mayek Vowel Sign
			0x0abec...0x0abed, // Meetei Mayek Lum Iyek   ..Meetei Mayek Apun Iyek
			0x0d7b0...0x0d7ff, // Hangul Jungseong O-yeo  ..(nil)
			0x0fb1e...0x0fb1e, // Hebrew Point Judeo-spanish Varika
			0x0fe00...0x0fe0f, // Variation Selector-1    ..Variation Selector-16
			0x0fe20...0x0fe2f, // Combining Ligature Left ..Combining Cyrillic Titlo
			0x0feff...0x0feff, // Zero Width No-break Space
			0x0fff9...0x0fffb, // Interlinear Annotation A..Interlinear Annotation T
			0x101fd...0x101fd, // Phaistos Disc Sign Combining Oblique Stroke
			0x102e0...0x102e0, // Coptic Epact Thousands Mark
			0x10376...0x1037a, // Combining Old Permic Let..Combining Old Permic Let
			0x10a01...0x10a03, // Kharoshthi Vowel Sign I ..Kharoshthi Vowel Sign Vo
			0x10a05...0x10a06, // Kharoshthi Vowel Sign E ..Kharoshthi Vowel Sign O
			0x10a0c...0x10a0f, // Kharoshthi Vowel Length ..Kharoshthi Sign Visarga
			0x10a38...0x10a3a, // Kharoshthi Sign Bar Abov..Kharoshthi Sign Dot Belo
			0x10a3f...0x10a3f, // Kharoshthi Virama
			0x10ae5...0x10ae6, // Manichaean Abbreviation ..Manichaean Abbreviation
			0x10d24...0x10d27, // Hanifi Rohingya Sign Har..Hanifi Rohingya Sign Tas
			0x10eab...0x10eac, // Yezidi Combining Hamza M..Yezidi Combining Madda M
			0x10efd...0x10eff, // Arabic Small Low Word Sa..Arabic Small Low Word Ma
			0x10f46...0x10f50, // Sogdian Combining Dot Be..Sogdian Combining Stroke
			0x10f82...0x10f85, // Old Uyghur Combining Dot..Old Uyghur Combining Two
			0x11000...0x11002, // Brahmi Sign Candrabindu ..Brahmi Sign Visarga
			0x11038...0x11046, // Brahmi Vowel Sign Aa    ..Brahmi Virama
			0x11070...0x11070, // Brahmi Sign Old Tamil Virama
			0x11073...0x11074, // Brahmi Vowel Sign Old Ta..Brahmi Vowel Sign Old Ta
			0x1107f...0x11082, // Brahmi Number Joiner    ..Kaithi Sign Visarga
			0x110b0...0x110ba, // Kaithi Vowel Sign Aa    ..Kaithi Sign Nukta
			0x110bd...0x110bd, // Kaithi Number Sign
			0x110c2...0x110c2, // Kaithi Vowel Sign Vocalic R
			0x110cd...0x110cd, // Kaithi Number Sign Above
			0x11100...0x11102, // Chakma Sign Candrabindu ..Chakma Sign Visarga
			0x11127...0x11134, // Chakma Vowel Sign A     ..Chakma Maayyaa
			0x11145...0x11146, // Chakma Vowel Sign Aa    ..Chakma Vowel Sign Ei
			0x11173...0x11173, // Mahajani Sign Nukta
			0x11180...0x11182, // Sharada Sign Candrabindu..Sharada Sign Visarga
			0x111b3...0x111c0, // Sharada Vowel Sign Aa   ..Sharada Sign Virama
			0x111c9...0x111cc, // Sharada Sandhi Mark     ..Sharada Extra Short Vowe
			0x111ce...0x111cf, // Sharada Vowel Sign Prish..Sharada Sign Inverted Ca
			0x1122c...0x11237, // Khojki Vowel Sign Aa    ..Khojki Sign Shadda
			0x1123e...0x1123e, // Khojki Sign Sukun
			0x11241...0x11241, // Khojki Vowel Sign Vocalic R
			0x112df...0x112ea, // Khudawadi Sign Anusvara ..Khudawadi Sign Virama
			0x11300...0x11303, // Grantha Sign Combining A..Grantha Sign Visarga
			0x1133b...0x1133c, // Combining Bindu Below   ..Grantha Sign Nukta
			0x1133e...0x11344, // Grantha Vowel Sign Aa   ..Grantha Vowel Sign Vocal
			0x11347...0x11348, // Grantha Vowel Sign Ee   ..Grantha Vowel Sign Ai
			0x1134b...0x1134d, // Grantha Vowel Sign Oo   ..Grantha Sign Virama
			0x11357...0x11357, // Grantha Au Length Mark
			0x11362...0x11363, // Grantha Vowel Sign Vocal..Grantha Vowel Sign Vocal
			0x11366...0x1136c, // Combining Grantha Digit ..Combining Grantha Digit
			0x11370...0x11374, // Combining Grantha Letter..Combining Grantha Letter
			0x11435...0x11446, // Newa Vowel Sign Aa      ..Newa Sign Nukta
			0x1145e...0x1145e, // Newa Sandhi Mark
			0x114b0...0x114c3, // Tirhuta Vowel Sign Aa   ..Tirhuta Sign Nukta
			0x115af...0x115b5, // Siddham Vowel Sign Aa   ..Siddham Vowel Sign Vocal
			0x115b8...0x115c0, // Siddham Vowel Sign E    ..Siddham Sign Nukta
			0x115dc...0x115dd, // Siddham Vowel Sign Alter..Siddham Vowel Sign Alter
			0x11630...0x11640, // Modi Vowel Sign Aa      ..Modi Sign Ardhacandra
			0x116ab...0x116b7, // Takri Sign Anusvara     ..Takri Sign Nukta
			0x1171d...0x1172b, // Ahom Consonant Sign Medi..Ahom Sign Killer
			0x1182c...0x1183a, // Dogra Vowel Sign Aa     ..Dogra Sign Nukta
			0x11930...0x11935, // Dives Akuru Vowel Sign A..Dives Akuru Vowel Sign E
			0x11937...0x11938, // Dives Akuru Vowel Sign A..Dives Akuru Vowel Sign O
			0x1193b...0x1193e, // Dives Akuru Sign Anusvar..Dives Akuru Virama
			0x11940...0x11940, // Dives Akuru Medial Ya
			0x11942...0x11943, // Dives Akuru Medial Ra   ..Dives Akuru Sign Nukta
			0x119d1...0x119d7, // Nandinagari Vowel Sign A..Nandinagari Vowel Sign V
			0x119da...0x119e0, // Nandinagari Vowel Sign E..Nandinagari Sign Virama
			0x119e4...0x119e4, // Nandinagari Vowel Sign Prishthamatra E
			0x11a01...0x11a0a, // Zanabazar Square Vowel S..Zanabazar Square Vowel L
			0x11a33...0x11a39, // Zanabazar Square Final C..Zanabazar Square Sign Vi
			0x11a3b...0x11a3e, // Zanabazar Square Cluster..Zanabazar Square Cluster
			0x11a47...0x11a47, // Zanabazar Square Subjoiner
			0x11a51...0x11a5b, // Soyombo Vowel Sign I    ..Soyombo Vowel Length Mar
			0x11a8a...0x11a99, // Soyombo Final Consonant ..Soyombo Subjoiner
			0x11c2f...0x11c36, // Bhaiksuki Vowel Sign Aa ..Bhaiksuki Vowel Sign Voc
			0x11c38...0x11c3f, // Bhaiksuki Vowel Sign E  ..Bhaiksuki Sign Virama
			0x11c92...0x11ca7, // Marchen Subjoined Letter..Marchen Subjoined Letter
			0x11ca9...0x11cb6, // Marchen Subjoined Letter..Marchen Sign Candrabindu
			0x11d31...0x11d36, // Masaram Gondi Vowel Sign..Masaram Gondi Vowel Sign
			0x11d3a...0x11d3a, // Masaram Gondi Vowel Sign E
			0x11d3c...0x11d3d, // Masaram Gondi Vowel Sign..Masaram Gondi Vowel Sign
			0x11d3f...0x11d45, // Masaram Gondi Vowel Sign..Masaram Gondi Virama
			0x11d47...0x11d47, // Masaram Gondi Ra-kara
			0x11d8a...0x11d8e, // Gunjala Gondi Vowel Sign..Gunjala Gondi Vowel Sign
			0x11d90...0x11d91, // Gunjala Gondi Vowel Sign..Gunjala Gondi Vowel Sign
			0x11d93...0x11d97, // Gunjala Gondi Vowel Sign..Gunjala Gondi Virama
			0x11ef3...0x11ef6, // Makasar Vowel Sign I    ..Makasar Vowel Sign O
			0x11f00...0x11f01, // Kawi Sign Candrabindu   ..Kawi Sign Anusvara
			0x11f03...0x11f03, // Kawi Sign Visarga
			0x11f34...0x11f3a, // Kawi Vowel Sign Aa      ..Kawi Vowel Sign Vocalic
			0x11f3e...0x11f42, // Kawi Vowel Sign E       ..Kawi Conjoiner
			0x13430...0x13440, // Egyptian Hieroglyph Vert..Egyptian Hieroglyph Mirr
			0x13447...0x13455, // Egyptian Hieroglyph Modi..Egyptian Hieroglyph Modi
			0x16af0...0x16af4, // Bassa Vah Combining High..Bassa Vah Combining High
			0x16b30...0x16b36, // Pahawh Hmong Mark Cim Tu..Pahawh Hmong Mark Cim Ta
			0x16f4f...0x16f4f, // Miao Sign Consonant Modifier Bar
			0x16f51...0x16f87, // Miao Sign Aspiration    ..Miao Vowel Sign Ui
			0x16f8f...0x16f92, // Miao Tone Right         ..Miao Tone Below
			0x16fe4...0x16fe4, // Khitan Small Script Filler
			0x16ff0...0x16ff1, // Vietnamese Alternate Rea..Vietnamese Alternate Rea
			0x1bc9d...0x1bc9e, // Duployan Thick Letter Se..Duployan Double Mark
			0x1bca0...0x1bca3, // Shorthand Format Letter ..Shorthand Format Up Step
			0x1cf00...0x1cf2d, // Znamenny Combining Mark ..Znamenny Combining Mark
			0x1cf30...0x1cf46, // Znamenny Combining Tonal..Znamenny Priznak Modifie
			0x1d165...0x1d169, // Musical Symbol Combining..Musical Symbol Combining
			0x1d16d...0x1d182, // Musical Symbol Combining..Musical Symbol Combining
			0x1d185...0x1d18b, // Musical Symbol Combining..Musical Symbol Combining
			0x1d1aa...0x1d1ad, // Musical Symbol Combining..Musical Symbol Combining
			0x1d242...0x1d244, // Combining Greek Musical ..Combining Greek Musical
			0x1da00...0x1da36, // Signwriting Head Rim    ..Signwriting Air Sucking
			0x1da3b...0x1da6c, // Signwriting Mouth Closed..Signwriting Excitement
			0x1da75...0x1da75, // Signwriting Upper Body Tilting From Hip Joints
			0x1da84...0x1da84, // Signwriting Location Head Neck
			0x1da9b...0x1da9f, // Signwriting Fill Modifie..Signwriting Fill Modifie
			0x1daa1...0x1daaf, // Signwriting Rotation Mod..Signwriting Rotation Mod
			0x1e000...0x1e006, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e008...0x1e018, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e01b...0x1e021, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e023...0x1e024, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e026...0x1e02a, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e08f...0x1e08f, // Combining Cyrillic Small Letter Byelorussian-ukr
			0x1e130...0x1e136, // Nyiakeng Puachue Hmong T..Nyiakeng Puachue Hmong T
			0x1e2ae...0x1e2ae, // Toto Sign Rising Tone
			0x1e2ec...0x1e2ef, // Wancho Tone Tup         ..Wancho Tone Koini
			0x1e4ec...0x1e4ef, // Nag Mundari Sign Muhor  ..Nag Mundari Sign Sutuh
			0x1e8d0...0x1e8d6, // Mende Kikakui Combining ..Mende Kikakui Combining
			0x1e944...0x1e94a, // Adlam Alif Lengthener   ..Adlam Nukta
			0x1f3fb...0x1f3ff, // Emoji Modifier Fitzpatri..Emoji Modifier Fitzpatri
			0xe0001...0xe0001, // Language Tag
			0xe0020...0xe007f, // Tag Space               ..Cancel Tag
			0xe0100...0xe01ef, // Variation Selector-17   ..Variation Selector-256
			=> true,
			else => false,
		},
		.@"15.1.0" => switch (codepoint) {
			// Source: DerivedGeneralCategory-15.1.0.txt
			// Date: 2023-07-28, 23:34:02 GMT
			0x00000...0x00000, // (nil)
			0x000ad...0x000ad, // Soft Hyphen
			0x00300...0x0036f, // Combining Grave Accent  ..Combining Latin Small Le
			0x00483...0x00489, // Combining Cyrillic Titlo..Combining Cyrillic Milli
			0x00591...0x005bd, // Hebrew Accent Etnahta   ..Hebrew Point Meteg
			0x005bf...0x005bf, // Hebrew Point Rafe
			0x005c1...0x005c2, // Hebrew Point Shin Dot   ..Hebrew Point Sin Dot
			0x005c4...0x005c5, // Hebrew Mark Upper Dot   ..Hebrew Mark Lower Dot
			0x005c7...0x005c7, // Hebrew Point Qamats Qatan
			0x00600...0x00605, // Arabic Number Sign      ..Arabic Number Mark Above
			0x00610...0x0061a, // Arabic Sign Sallallahou ..Arabic Small Kasra
			0x0061c...0x0061c, // Arabic Letter Mark
			0x0064b...0x0065f, // Arabic Fathatan         ..Arabic Wavy Hamza Below
			0x00670...0x00670, // Arabic Letter Superscript Alef
			0x006d6...0x006dd, // Arabic Small High Ligatu..Arabic End Of Ayah
			0x006df...0x006e4, // Arabic Small High Rounde..Arabic Small High Madda
			0x006e7...0x006e8, // Arabic Small High Yeh   ..Arabic Small High Noon
			0x006ea...0x006ed, // Arabic Empty Centre Low ..Arabic Small Low Meem
			0x0070f...0x0070f, // Syriac Abbreviation Mark
			0x00711...0x00711, // Syriac Letter Superscript Alaph
			0x00730...0x0074a, // Syriac Pthaha Above     ..Syriac Barrekh
			0x007a6...0x007b0, // Thaana Abafili          ..Thaana Sukun
			0x007eb...0x007f3, // Nko Combining Short High..Nko Combining Double Dot
			0x007fd...0x007fd, // Nko Dantayalan
			0x00816...0x00819, // Samaritan Mark In       ..Samaritan Mark Dagesh
			0x0081b...0x00823, // Samaritan Mark Epentheti..Samaritan Vowel Sign A
			0x00825...0x00827, // Samaritan Vowel Sign Sho..Samaritan Vowel Sign U
			0x00829...0x0082d, // Samaritan Vowel Sign Lon..Samaritan Mark Nequdaa
			0x00859...0x0085b, // Mandaic Affrication Mark..Mandaic Gemination Mark
			0x00890...0x00891, // Arabic Pound Mark Above ..Arabic Piastre Mark Abov
			0x00898...0x0089f, // Arabic Small High Word A..Arabic Half Madda Over M
			0x008ca...0x00903, // Arabic Small High Farsi ..Devanagari Sign Visarga
			0x0093a...0x0093c, // Devanagari Vowel Sign Oe..Devanagari Sign Nukta
			0x0093e...0x0094f, // Devanagari Vowel Sign Aa..Devanagari Vowel Sign Aw
			0x00951...0x00957, // Devanagari Stress Sign U..Devanagari Vowel Sign Uu
			0x00962...0x00963, // Devanagari Vowel Sign Vo..Devanagari Vowel Sign Vo
			0x00981...0x00983, // Bengali Sign Candrabindu..Bengali Sign Visarga
			0x009bc...0x009bc, // Bengali Sign Nukta
			0x009be...0x009c4, // Bengali Vowel Sign Aa   ..Bengali Vowel Sign Vocal
			0x009c7...0x009c8, // Bengali Vowel Sign E    ..Bengali Vowel Sign Ai
			0x009cb...0x009cd, // Bengali Vowel Sign O    ..Bengali Sign Virama
			0x009d7...0x009d7, // Bengali Au Length Mark
			0x009e2...0x009e3, // Bengali Vowel Sign Vocal..Bengali Vowel Sign Vocal
			0x009fe...0x009fe, // Bengali Sandhi Mark
			0x00a01...0x00a03, // Gurmukhi Sign Adak Bindi..Gurmukhi Sign Visarga
			0x00a3c...0x00a3c, // Gurmukhi Sign Nukta
			0x00a3e...0x00a42, // Gurmukhi Vowel Sign Aa  ..Gurmukhi Vowel Sign Uu
			0x00a47...0x00a48, // Gurmukhi Vowel Sign Ee  ..Gurmukhi Vowel Sign Ai
			0x00a4b...0x00a4d, // Gurmukhi Vowel Sign Oo  ..Gurmukhi Sign Virama
			0x00a51...0x00a51, // Gurmukhi Sign Udaat
			0x00a70...0x00a71, // Gurmukhi Tippi          ..Gurmukhi Addak
			0x00a75...0x00a75, // Gurmukhi Sign Yakash
			0x00a81...0x00a83, // Gujarati Sign Candrabind..Gujarati Sign Visarga
			0x00abc...0x00abc, // Gujarati Sign Nukta
			0x00abe...0x00ac5, // Gujarati Vowel Sign Aa  ..Gujarati Vowel Sign Cand
			0x00ac7...0x00ac9, // Gujarati Vowel Sign E   ..Gujarati Vowel Sign Cand
			0x00acb...0x00acd, // Gujarati Vowel Sign O   ..Gujarati Sign Virama
			0x00ae2...0x00ae3, // Gujarati Vowel Sign Voca..Gujarati Vowel Sign Voca
			0x00afa...0x00aff, // Gujarati Sign Sukun     ..Gujarati Sign Two-circle
			0x00b01...0x00b03, // Oriya Sign Candrabindu  ..Oriya Sign Visarga
			0x00b3c...0x00b3c, // Oriya Sign Nukta
			0x00b3e...0x00b44, // Oriya Vowel Sign Aa     ..Oriya Vowel Sign Vocalic
			0x00b47...0x00b48, // Oriya Vowel Sign E      ..Oriya Vowel Sign Ai
			0x00b4b...0x00b4d, // Oriya Vowel Sign O      ..Oriya Sign Virama
			0x00b55...0x00b57, // Oriya Sign Overline     ..Oriya Au Length Mark
			0x00b62...0x00b63, // Oriya Vowel Sign Vocalic..Oriya Vowel Sign Vocalic
			0x00b82...0x00b82, // Tamil Sign Anusvara
			0x00bbe...0x00bc2, // Tamil Vowel Sign Aa     ..Tamil Vowel Sign Uu
			0x00bc6...0x00bc8, // Tamil Vowel Sign E      ..Tamil Vowel Sign Ai
			0x00bca...0x00bcd, // Tamil Vowel Sign O      ..Tamil Sign Virama
			0x00bd7...0x00bd7, // Tamil Au Length Mark
			0x00c00...0x00c04, // Telugu Sign Combining Ca..Telugu Sign Combining An
			0x00c3c...0x00c3c, // Telugu Sign Nukta
			0x00c3e...0x00c44, // Telugu Vowel Sign Aa    ..Telugu Vowel Sign Vocali
			0x00c46...0x00c48, // Telugu Vowel Sign E     ..Telugu Vowel Sign Ai
			0x00c4a...0x00c4d, // Telugu Vowel Sign O     ..Telugu Sign Virama
			0x00c55...0x00c56, // Telugu Length Mark      ..Telugu Ai Length Mark
			0x00c62...0x00c63, // Telugu Vowel Sign Vocali..Telugu Vowel Sign Vocali
			0x00c81...0x00c83, // Kannada Sign Candrabindu..Kannada Sign Visarga
			0x00cbc...0x00cbc, // Kannada Sign Nukta
			0x00cbe...0x00cc4, // Kannada Vowel Sign Aa   ..Kannada Vowel Sign Vocal
			0x00cc6...0x00cc8, // Kannada Vowel Sign E    ..Kannada Vowel Sign Ai
			0x00cca...0x00ccd, // Kannada Vowel Sign O    ..Kannada Sign Virama
			0x00cd5...0x00cd6, // Kannada Length Mark     ..Kannada Ai Length Mark
			0x00ce2...0x00ce3, // Kannada Vowel Sign Vocal..Kannada Vowel Sign Vocal
			0x00cf3...0x00cf3, // Kannada Sign Combining Anusvara Above Right
			0x00d00...0x00d03, // Malayalam Sign Combining..Malayalam Sign Visarga
			0x00d3b...0x00d3c, // Malayalam Sign Vertical ..Malayalam Sign Circular
			0x00d3e...0x00d44, // Malayalam Vowel Sign Aa ..Malayalam Vowel Sign Voc
			0x00d46...0x00d48, // Malayalam Vowel Sign E  ..Malayalam Vowel Sign Ai
			0x00d4a...0x00d4d, // Malayalam Vowel Sign O  ..Malayalam Sign Virama
			0x00d57...0x00d57, // Malayalam Au Length Mark
			0x00d62...0x00d63, // Malayalam Vowel Sign Voc..Malayalam Vowel Sign Voc
			0x00d81...0x00d83, // Sinhala Sign Candrabindu..Sinhala Sign Visargaya
			0x00dca...0x00dca, // Sinhala Sign Al-lakuna
			0x00dcf...0x00dd4, // Sinhala Vowel Sign Aela-..Sinhala Vowel Sign Ketti
			0x00dd6...0x00dd6, // Sinhala Vowel Sign Diga Paa-pilla
			0x00dd8...0x00ddf, // Sinhala Vowel Sign Gaett..Sinhala Vowel Sign Gayan
			0x00df2...0x00df3, // Sinhala Vowel Sign Diga ..Sinhala Vowel Sign Diga
			0x00e31...0x00e31, // Thai Character Mai Han-akat
			0x00e34...0x00e3a, // Thai Character Sara I   ..Thai Character Phinthu
			0x00e47...0x00e4e, // Thai Character Maitaikhu..Thai Character Yamakkan
			0x00eb1...0x00eb1, // Lao Vowel Sign Mai Kan
			0x00eb4...0x00ebc, // Lao Vowel Sign I        ..Lao Semivowel Sign Lo
			0x00ec8...0x00ece, // Lao Tone Mai Ek         ..Lao Yamakkan
			0x00f18...0x00f19, // Tibetan Astrological Sig..Tibetan Astrological Sig
			0x00f35...0x00f35, // Tibetan Mark Ngas Bzung Nyi Zla
			0x00f37...0x00f37, // Tibetan Mark Ngas Bzung Sgor Rtags
			0x00f39...0x00f39, // Tibetan Mark Tsa -phru
			0x00f3e...0x00f3f, // Tibetan Sign Yar Tshes  ..Tibetan Sign Mar Tshes
			0x00f71...0x00f84, // Tibetan Vowel Sign Aa   ..Tibetan Mark Halanta
			0x00f86...0x00f87, // Tibetan Sign Lci Rtags  ..Tibetan Sign Yang Rtags
			0x00f8d...0x00f97, // Tibetan Subjoined Sign L..Tibetan Subjoined Letter
			0x00f99...0x00fbc, // Tibetan Subjoined Letter..Tibetan Subjoined Letter
			0x00fc6...0x00fc6, // Tibetan Symbol Padma Gdan
			0x0102b...0x0103e, // Myanmar Vowel Sign Tall ..Myanmar Consonant Sign M
			0x01056...0x01059, // Myanmar Vowel Sign Vocal..Myanmar Vowel Sign Vocal
			0x0105e...0x01060, // Myanmar Consonant Sign M..Myanmar Consonant Sign M
			0x01062...0x01064, // Myanmar Vowel Sign Sgaw ..Myanmar Tone Mark Sgaw K
			0x01067...0x0106d, // Myanmar Vowel Sign Weste..Myanmar Sign Western Pwo
			0x01071...0x01074, // Myanmar Vowel Sign Geba ..Myanmar Vowel Sign Kayah
			0x01082...0x0108d, // Myanmar Consonant Sign S..Myanmar Sign Shan Counci
			0x0108f...0x0108f, // Myanmar Sign Rumai Palaung Tone-5
			0x0109a...0x0109d, // Myanmar Sign Khamti Tone..Myanmar Vowel Sign Aiton
			0x01160...0x011ff, // Hangul Jungseong Filler ..Hangul Jongseong Ssangni
			0x0135d...0x0135f, // Ethiopic Combining Gemin..Ethiopic Combining Gemin
			0x01712...0x01715, // Tagalog Vowel Sign I    ..Tagalog Sign Pamudpod
			0x01732...0x01734, // Hanunoo Vowel Sign I    ..Hanunoo Sign Pamudpod
			0x01752...0x01753, // Buhid Vowel Sign I      ..Buhid Vowel Sign U
			0x01772...0x01773, // Tagbanwa Vowel Sign I   ..Tagbanwa Vowel Sign U
			0x017b4...0x017d3, // Khmer Vowel Inherent Aq ..Khmer Sign Bathamasat
			0x017dd...0x017dd, // Khmer Sign Atthacan
			0x0180b...0x0180f, // Mongolian Free Variation..Mongolian Free Variation
			0x01885...0x01886, // Mongolian Letter Ali Gal..Mongolian Letter Ali Gal
			0x018a9...0x018a9, // Mongolian Letter Ali Gali Dagalga
			0x01920...0x0192b, // Limbu Vowel Sign A      ..Limbu Subjoined Letter W
			0x01930...0x0193b, // Limbu Small Letter Ka   ..Limbu Sign Sa-i
			0x01a17...0x01a1b, // Buginese Vowel Sign I   ..Buginese Vowel Sign Ae
			0x01a55...0x01a5e, // Tai Tham Consonant Sign ..Tai Tham Consonant Sign
			0x01a60...0x01a7c, // Tai Tham Sign Sakot     ..Tai Tham Sign Khuen-lue
			0x01a7f...0x01a7f, // Tai Tham Combining Cryptogrammic Dot
			0x01ab0...0x01ace, // Combining Doubled Circum..Combining Latin Small Le
			0x01b00...0x01b04, // Balinese Sign Ulu Ricem ..Balinese Sign Bisah
			0x01b34...0x01b44, // Balinese Sign Rerekan   ..Balinese Adeg Adeg
			0x01b6b...0x01b73, // Balinese Musical Symbol ..Balinese Musical Symbol
			0x01b80...0x01b82, // Sundanese Sign Panyecek ..Sundanese Sign Pangwisad
			0x01ba1...0x01bad, // Sundanese Consonant Sign..Sundanese Consonant Sign
			0x01be6...0x01bf3, // Batak Sign Tompi        ..Batak Panongonan
			0x01c24...0x01c37, // Lepcha Subjoined Letter ..Lepcha Sign Nukta
			0x01cd0...0x01cd2, // Vedic Tone Karshana     ..Vedic Tone Prenkha
			0x01cd4...0x01ce8, // Vedic Sign Yajurvedic Mi..Vedic Sign Visarga Anuda
			0x01ced...0x01ced, // Vedic Sign Tiryak
			0x01cf4...0x01cf4, // Vedic Tone Candra Above
			0x01cf7...0x01cf9, // Vedic Sign Atikrama     ..Vedic Tone Double Ring A
			0x01dc0...0x01dff, // Combining Dotted Grave A..Combining Right Arrowhea
			0x0200b...0x0200f, // Zero Width Space        ..Right-to-left Mark
			0x02028...0x0202e, // Line Separator          ..Right-to-left Override
			0x02060...0x02064, // Word Joiner             ..Invisible Plus
			0x02066...0x0206f, // Left-to-right Isolate   ..Nominal Digit Shapes
			0x020d0...0x020f0, // Combining Left Harpoon A..Combining Asterisk Above
			0x02cef...0x02cf1, // Coptic Combining Ni Abov..Coptic Combining Spiritu
			0x02d7f...0x02d7f, // Tifinagh Consonant Joiner
			0x02de0...0x02dff, // Combining Cyrillic Lette..Combining Cyrillic Lette
			0x0302a...0x0302f, // Ideographic Level Tone M..Hangul Double Dot Tone M
			0x03099...0x0309a, // Combining Katakana-hirag..Combining Katakana-hirag
			0x0a66f...0x0a672, // Combining Cyrillic Vzmet..Combining Cyrillic Thous
			0x0a674...0x0a67d, // Combining Cyrillic Lette..Combining Cyrillic Payer
			0x0a69e...0x0a69f, // Combining Cyrillic Lette..Combining Cyrillic Lette
			0x0a6f0...0x0a6f1, // Bamum Combining Mark Koq..Bamum Combining Mark Tuk
			0x0a802...0x0a802, // Syloti Nagri Sign Dvisvara
			0x0a806...0x0a806, // Syloti Nagri Sign Hasanta
			0x0a80b...0x0a80b, // Syloti Nagri Sign Anusvara
			0x0a823...0x0a827, // Syloti Nagri Vowel Sign ..Syloti Nagri Vowel Sign
			0x0a82c...0x0a82c, // Syloti Nagri Sign Alternate Hasanta
			0x0a880...0x0a881, // Saurashtra Sign Anusvara..Saurashtra Sign Visarga
			0x0a8b4...0x0a8c5, // Saurashtra Consonant Sig..Saurashtra Sign Candrabi
			0x0a8e0...0x0a8f1, // Combining Devanagari Dig..Combining Devanagari Sig
			0x0a8ff...0x0a8ff, // Devanagari Vowel Sign Ay
			0x0a926...0x0a92d, // Kayah Li Vowel Ue       ..Kayah Li Tone Calya Plop
			0x0a947...0x0a953, // Rejang Vowel Sign I     ..Rejang Virama
			0x0a980...0x0a983, // Javanese Sign Panyangga ..Javanese Sign Wignyan
			0x0a9b3...0x0a9c0, // Javanese Sign Cecak Telu..Javanese Pangkon
			0x0a9e5...0x0a9e5, // Myanmar Sign Shan Saw
			0x0aa29...0x0aa36, // Cham Vowel Sign Aa      ..Cham Consonant Sign Wa
			0x0aa43...0x0aa43, // Cham Consonant Sign Final Ng
			0x0aa4c...0x0aa4d, // Cham Consonant Sign Fina..Cham Consonant Sign Fina
			0x0aa7b...0x0aa7d, // Myanmar Sign Pao Karen T..Myanmar Sign Tai Laing T
			0x0aab0...0x0aab0, // Tai Viet Mai Kang
			0x0aab2...0x0aab4, // Tai Viet Vowel I        ..Tai Viet Vowel U
			0x0aab7...0x0aab8, // Tai Viet Mai Khit       ..Tai Viet Vowel Ia
			0x0aabe...0x0aabf, // Tai Viet Vowel Am       ..Tai Viet Tone Mai Ek
			0x0aac1...0x0aac1, // Tai Viet Tone Mai Tho
			0x0aaeb...0x0aaef, // Meetei Mayek Vowel Sign ..Meetei Mayek Vowel Sign
			0x0aaf5...0x0aaf6, // Meetei Mayek Vowel Sign ..Meetei Mayek Virama
			0x0abe3...0x0abea, // Meetei Mayek Vowel Sign ..Meetei Mayek Vowel Sign
			0x0abec...0x0abed, // Meetei Mayek Lum Iyek   ..Meetei Mayek Apun Iyek
			0x0d7b0...0x0d7ff, // Hangul Jungseong O-yeo  ..(nil)
			0x0fb1e...0x0fb1e, // Hebrew Point Judeo-spanish Varika
			0x0fe00...0x0fe0f, // Variation Selector-1    ..Variation Selector-16
			0x0fe20...0x0fe2f, // Combining Ligature Left ..Combining Cyrillic Titlo
			0x0feff...0x0feff, // Zero Width No-break Space
			0x0fff9...0x0fffb, // Interlinear Annotation A..Interlinear Annotation T
			0x101fd...0x101fd, // Phaistos Disc Sign Combining Oblique Stroke
			0x102e0...0x102e0, // Coptic Epact Thousands Mark
			0x10376...0x1037a, // Combining Old Permic Let..Combining Old Permic Let
			0x10a01...0x10a03, // Kharoshthi Vowel Sign I ..Kharoshthi Vowel Sign Vo
			0x10a05...0x10a06, // Kharoshthi Vowel Sign E ..Kharoshthi Vowel Sign O
			0x10a0c...0x10a0f, // Kharoshthi Vowel Length ..Kharoshthi Sign Visarga
			0x10a38...0x10a3a, // Kharoshthi Sign Bar Abov..Kharoshthi Sign Dot Belo
			0x10a3f...0x10a3f, // Kharoshthi Virama
			0x10ae5...0x10ae6, // Manichaean Abbreviation ..Manichaean Abbreviation
			0x10d24...0x10d27, // Hanifi Rohingya Sign Har..Hanifi Rohingya Sign Tas
			0x10eab...0x10eac, // Yezidi Combining Hamza M..Yezidi Combining Madda M
			0x10efd...0x10eff, // Arabic Small Low Word Sa..Arabic Small Low Word Ma
			0x10f46...0x10f50, // Sogdian Combining Dot Be..Sogdian Combining Stroke
			0x10f82...0x10f85, // Old Uyghur Combining Dot..Old Uyghur Combining Two
			0x11000...0x11002, // Brahmi Sign Candrabindu ..Brahmi Sign Visarga
			0x11038...0x11046, // Brahmi Vowel Sign Aa    ..Brahmi Virama
			0x11070...0x11070, // Brahmi Sign Old Tamil Virama
			0x11073...0x11074, // Brahmi Vowel Sign Old Ta..Brahmi Vowel Sign Old Ta
			0x1107f...0x11082, // Brahmi Number Joiner    ..Kaithi Sign Visarga
			0x110b0...0x110ba, // Kaithi Vowel Sign Aa    ..Kaithi Sign Nukta
			0x110bd...0x110bd, // Kaithi Number Sign
			0x110c2...0x110c2, // Kaithi Vowel Sign Vocalic R
			0x110cd...0x110cd, // Kaithi Number Sign Above
			0x11100...0x11102, // Chakma Sign Candrabindu ..Chakma Sign Visarga
			0x11127...0x11134, // Chakma Vowel Sign A     ..Chakma Maayyaa
			0x11145...0x11146, // Chakma Vowel Sign Aa    ..Chakma Vowel Sign Ei
			0x11173...0x11173, // Mahajani Sign Nukta
			0x11180...0x11182, // Sharada Sign Candrabindu..Sharada Sign Visarga
			0x111b3...0x111c0, // Sharada Vowel Sign Aa   ..Sharada Sign Virama
			0x111c9...0x111cc, // Sharada Sandhi Mark     ..Sharada Extra Short Vowe
			0x111ce...0x111cf, // Sharada Vowel Sign Prish..Sharada Sign Inverted Ca
			0x1122c...0x11237, // Khojki Vowel Sign Aa    ..Khojki Sign Shadda
			0x1123e...0x1123e, // Khojki Sign Sukun
			0x11241...0x11241, // Khojki Vowel Sign Vocalic R
			0x112df...0x112ea, // Khudawadi Sign Anusvara ..Khudawadi Sign Virama
			0x11300...0x11303, // Grantha Sign Combining A..Grantha Sign Visarga
			0x1133b...0x1133c, // Combining Bindu Below   ..Grantha Sign Nukta
			0x1133e...0x11344, // Grantha Vowel Sign Aa   ..Grantha Vowel Sign Vocal
			0x11347...0x11348, // Grantha Vowel Sign Ee   ..Grantha Vowel Sign Ai
			0x1134b...0x1134d, // Grantha Vowel Sign Oo   ..Grantha Sign Virama
			0x11357...0x11357, // Grantha Au Length Mark
			0x11362...0x11363, // Grantha Vowel Sign Vocal..Grantha Vowel Sign Vocal
			0x11366...0x1136c, // Combining Grantha Digit ..Combining Grantha Digit
			0x11370...0x11374, // Combining Grantha Letter..Combining Grantha Letter
			0x11435...0x11446, // Newa Vowel Sign Aa      ..Newa Sign Nukta
			0x1145e...0x1145e, // Newa Sandhi Mark
			0x114b0...0x114c3, // Tirhuta Vowel Sign Aa   ..Tirhuta Sign Nukta
			0x115af...0x115b5, // Siddham Vowel Sign Aa   ..Siddham Vowel Sign Vocal
			0x115b8...0x115c0, // Siddham Vowel Sign E    ..Siddham Sign Nukta
			0x115dc...0x115dd, // Siddham Vowel Sign Alter..Siddham Vowel Sign Alter
			0x11630...0x11640, // Modi Vowel Sign Aa      ..Modi Sign Ardhacandra
			0x116ab...0x116b7, // Takri Sign Anusvara     ..Takri Sign Nukta
			0x1171d...0x1172b, // Ahom Consonant Sign Medi..Ahom Sign Killer
			0x1182c...0x1183a, // Dogra Vowel Sign Aa     ..Dogra Sign Nukta
			0x11930...0x11935, // Dives Akuru Vowel Sign A..Dives Akuru Vowel Sign E
			0x11937...0x11938, // Dives Akuru Vowel Sign A..Dives Akuru Vowel Sign O
			0x1193b...0x1193e, // Dives Akuru Sign Anusvar..Dives Akuru Virama
			0x11940...0x11940, // Dives Akuru Medial Ya
			0x11942...0x11943, // Dives Akuru Medial Ra   ..Dives Akuru Sign Nukta
			0x119d1...0x119d7, // Nandinagari Vowel Sign A..Nandinagari Vowel Sign V
			0x119da...0x119e0, // Nandinagari Vowel Sign E..Nandinagari Sign Virama
			0x119e4...0x119e4, // Nandinagari Vowel Sign Prishthamatra E
			0x11a01...0x11a0a, // Zanabazar Square Vowel S..Zanabazar Square Vowel L
			0x11a33...0x11a39, // Zanabazar Square Final C..Zanabazar Square Sign Vi
			0x11a3b...0x11a3e, // Zanabazar Square Cluster..Zanabazar Square Cluster
			0x11a47...0x11a47, // Zanabazar Square Subjoiner
			0x11a51...0x11a5b, // Soyombo Vowel Sign I    ..Soyombo Vowel Length Mar
			0x11a8a...0x11a99, // Soyombo Final Consonant ..Soyombo Subjoiner
			0x11c2f...0x11c36, // Bhaiksuki Vowel Sign Aa ..Bhaiksuki Vowel Sign Voc
			0x11c38...0x11c3f, // Bhaiksuki Vowel Sign E  ..Bhaiksuki Sign Virama
			0x11c92...0x11ca7, // Marchen Subjoined Letter..Marchen Subjoined Letter
			0x11ca9...0x11cb6, // Marchen Subjoined Letter..Marchen Sign Candrabindu
			0x11d31...0x11d36, // Masaram Gondi Vowel Sign..Masaram Gondi Vowel Sign
			0x11d3a...0x11d3a, // Masaram Gondi Vowel Sign E
			0x11d3c...0x11d3d, // Masaram Gondi Vowel Sign..Masaram Gondi Vowel Sign
			0x11d3f...0x11d45, // Masaram Gondi Vowel Sign..Masaram Gondi Virama
			0x11d47...0x11d47, // Masaram Gondi Ra-kara
			0x11d8a...0x11d8e, // Gunjala Gondi Vowel Sign..Gunjala Gondi Vowel Sign
			0x11d90...0x11d91, // Gunjala Gondi Vowel Sign..Gunjala Gondi Vowel Sign
			0x11d93...0x11d97, // Gunjala Gondi Vowel Sign..Gunjala Gondi Virama
			0x11ef3...0x11ef6, // Makasar Vowel Sign I    ..Makasar Vowel Sign O
			0x11f00...0x11f01, // Kawi Sign Candrabindu   ..Kawi Sign Anusvara
			0x11f03...0x11f03, // Kawi Sign Visarga
			0x11f34...0x11f3a, // Kawi Vowel Sign Aa      ..Kawi Vowel Sign Vocalic
			0x11f3e...0x11f42, // Kawi Vowel Sign E       ..Kawi Conjoiner
			0x13430...0x13440, // Egyptian Hieroglyph Vert..Egyptian Hieroglyph Mirr
			0x13447...0x13455, // Egyptian Hieroglyph Modi..Egyptian Hieroglyph Modi
			0x16af0...0x16af4, // Bassa Vah Combining High..Bassa Vah Combining High
			0x16b30...0x16b36, // Pahawh Hmong Mark Cim Tu..Pahawh Hmong Mark Cim Ta
			0x16f4f...0x16f4f, // Miao Sign Consonant Modifier Bar
			0x16f51...0x16f87, // Miao Sign Aspiration    ..Miao Vowel Sign Ui
			0x16f8f...0x16f92, // Miao Tone Right         ..Miao Tone Below
			0x16fe4...0x16fe4, // Khitan Small Script Filler
			0x16ff0...0x16ff1, // Vietnamese Alternate Rea..Vietnamese Alternate Rea
			0x1bc9d...0x1bc9e, // Duployan Thick Letter Se..Duployan Double Mark
			0x1bca0...0x1bca3, // Shorthand Format Letter ..Shorthand Format Up Step
			0x1cf00...0x1cf2d, // Znamenny Combining Mark ..Znamenny Combining Mark
			0x1cf30...0x1cf46, // Znamenny Combining Tonal..Znamenny Priznak Modifie
			0x1d165...0x1d169, // Musical Symbol Combining..Musical Symbol Combining
			0x1d16d...0x1d182, // Musical Symbol Combining..Musical Symbol Combining
			0x1d185...0x1d18b, // Musical Symbol Combining..Musical Symbol Combining
			0x1d1aa...0x1d1ad, // Musical Symbol Combining..Musical Symbol Combining
			0x1d242...0x1d244, // Combining Greek Musical ..Combining Greek Musical
			0x1da00...0x1da36, // Signwriting Head Rim    ..Signwriting Air Sucking
			0x1da3b...0x1da6c, // Signwriting Mouth Closed..Signwriting Excitement
			0x1da75...0x1da75, // Signwriting Upper Body Tilting From Hip Joints
			0x1da84...0x1da84, // Signwriting Location Head Neck
			0x1da9b...0x1da9f, // Signwriting Fill Modifie..Signwriting Fill Modifie
			0x1daa1...0x1daaf, // Signwriting Rotation Mod..Signwriting Rotation Mod
			0x1e000...0x1e006, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e008...0x1e018, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e01b...0x1e021, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e023...0x1e024, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e026...0x1e02a, // Combining Glagolitic Let..Combining Glagolitic Let
			0x1e08f...0x1e08f, // Combining Cyrillic Small Letter Byelorussian-ukr
			0x1e130...0x1e136, // Nyiakeng Puachue Hmong T..Nyiakeng Puachue Hmong T
			0x1e2ae...0x1e2ae, // Toto Sign Rising Tone
			0x1e2ec...0x1e2ef, // Wancho Tone Tup         ..Wancho Tone Koini
			0x1e4ec...0x1e4ef, // Nag Mundari Sign Muhor  ..Nag Mundari Sign Sutuh
			0x1e8d0...0x1e8d6, // Mende Kikakui Combining ..Mende Kikakui Combining
			0x1e944...0x1e94a, // Adlam Alif Lengthener   ..Adlam Nukta
			0x1f3fb...0x1f3ff, // Emoji Modifier Fitzpatri..Emoji Modifier Fitzpatri
			0xe0001...0xe0001, // Language Tag
			0xe0020...0xe007f, // Tag Space               ..Cancel Tag
			0xe0100...0xe01ef, // Variation Selector-17   ..Variation Selector-256
			=> true,
			else => false,
		},
	};
}
