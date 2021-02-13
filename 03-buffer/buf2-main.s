0x080491c1 <+0>:	lea    0x4(%esp),%ecx   # copia "alpha" (RIP SO + 4) para %ecx
0x080491c5 <+4>:	and    $0xfffffff0,%esp # alinha o topo da pilha em 16 bytes
0x080491c8 <+7>:	pushl  -0x4(%ecx)       # salva RIP SO de novo, depois do espaço de alinhamento
0x080491cb <+10>:	push   %ebp             # salva OFP na pilha
0x080491cc <+11>:	mov    %esp,%ebp        # marco de ativacao da pilha de main
0x080491ce <+13>:	push   %ebx             # salva valor original de %ebx
0x080491cf <+14>:	push   %ecx             # salva "alpha"
0x080491d0 <+15>:	sub    $0x40,%esp       # abre 64 bytes na pilha
0x080491d3 <+18>:	call   0x80490d0 <__x86.get_pc_thunk.bx>    # carrega o endereço da proxima instrucao em %ebx. Ou seja 0x080491d8
0x080491d8 <+23>:	add    $0x2e28,%ebx     # %ebx = 0x080491d8 + 0x2e28 = 0x804C000
0x080491de <+29>:	sub    $0xc,%esp        # abre +12 bytes na pilha
0x080491e1 <+32>:	lea    -0x48(%ebp),%eax # carrega em %eax o endereço -0x48(%ebp) = -72(%ebp) (endereço do buffer de gets)
0x080491e4 <+35>:	push   %eax             # salva o endereço -0x48(%ebp) na pilha, para servir de argumento de gets
0x080491e5 <+36>:	call   0x8049050 <gets@plt> # chama gets com o buffer em -0x48(%ebp) como argumento
0x080491ea <+41>:	add    $0x10,%esp       # recolhe 16 bytes da pilha
0x080491ed <+44>:	sub    $0x8,%esp        # abre +8 bytes na pilha
0x080491f0 <+47>:	lea    -0x48(%ebp),%eax # carrega em %eax o endereço -0x48(%ebp) = -72(%ebp) (endereço do buffer de gets)
0x080491f3 <+50>:	push   %eax             # salva o endereço -0x48(%ebp) na pilha, para servir de argumento de printf
0x080491f4 <+51>:	lea    -0x1fe9(%ebx),%eax   # carrega em %eax o endereço 0x56559000 - 0x1fe9 = 0x56557017 (esse é o endereço da string "buf: ") (?)
0x080491fa <+57>:	push   %eax             # salva 0x56557017 na pilha, para servir de argumento de printf
0x080491fb <+58>:	call   0x8049040 <printf@plt>   # chama printf com o endereço 0x56557017 e o buffer em -0x48(%ebp) como argumentos
0x08049200 <+63>:	add    $0x10,%esp       # recolhe 16 bytes da pilha
0x08049203 <+66>:	mov    $0x0,%eax        # zera o valor em %eax
0x08049208 <+71>:	lea    -0x8(%ebp),%esp  # move o topo da pilha para -0x8(%ebp)
0x0804920b <+74>:	pop    %ecx             # restaura valor original
0x0804920c <+75>:	pop    %ebx             # restaura valor original
0x0804920d <+76>:	pop    %ebp             # restaura valor original
0x0804920e <+77>:	lea    -0x4(%ecx),%esp  # move o topo da pilha para o 1° RIP SO
0x08049211 <+80>:	ret                     # retorna controle para o SO com %eax = 0