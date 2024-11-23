import re

if __name__ == '__main__':
    path = '/path/to/utf8width/utf8width/unicode_versions.py'
    lines = open(path, 'r', encoding='utf-8').readlines()

    versions = []
    for line in lines:
        pattern = r'\b\d+\.\d+\.\d+\b'
        matches = re.search(pattern, line)
        if matches:
            versions.append(matches.group(0))
    with open("../src/version.zig", 'w') as f:
        f.write("pub const UnicodeVersion = enum {\n")
        for v in versions:
            f.write(f'\t@"{v}",\n')
        f.write("};\n")