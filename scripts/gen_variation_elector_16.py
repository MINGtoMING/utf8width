import re

if __name__ == '__main__':
    path = '/path/to/utf8width/utf8width/table_vs16.py'
    lines = open(path, 'r', encoding='utf-8').readlines()
    with open("../src/VariationSelector16.zig", 'w') as f:
        f.write(
            """const std = @import("std");  
const UnicodeVersion = @import("version.zig").UnicodeVersion;

const VariationSelector16 = @This();

version: UnicodeVersion,

pub fn init(version: UnicodeVersion) VariationSelector16 {
    return .{ .version = version };
}

pub fn contains(self: VariationSelector16, codepoint: u21) bool {
    return switch (self.version) {
"""
        )

        catch_version = False
        for line in lines:
            if not catch_version:
                pattern = r'\b\d+\.\d+\.\d+\b'
                matches = re.search(pattern, line)
                if matches and "(" in line:
                    version = matches.group(0)
                    f.write('\t\t.@"{}" => switch (codepoint) {{\n'.format(version))
                    catch_version = True
                    continue

            if catch_version:
                comment_pattern = r'#\s*(.*?)\n'
                comment_matches = re.search(comment_pattern, line)
                try:
                    comment = f'//{comment_matches.group(0).replace('#', '')}'
                except:
                    comment = ''

                hex_pattern = r'0x[0-9a-fA-F]+'
                hex_matches = re.findall(hex_pattern, line)

                if comment_matches and not hex_matches:

                    if re.match(r'^\s*#\s*$', line):
                        continue

                    f.write('\t\t\t{}'.format(comment))

                if hex_matches:
                    f.write('\t\t\t{}...{}, {}'.format(hex_matches[0], hex_matches[1], comment))

            if line.strip('\n').strip(' ') == '),':
                f.write('\t\t\t=> true,\n')
                f.write('\t\t\telse => false,\n')
                f.write('\t\t},\n')
                catch_version = False

        f.write(
"""\t};
}
""")
