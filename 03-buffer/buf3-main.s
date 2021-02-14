0x08049176 <+0>:	lea    0x4(%esp),%ecx   # copia "alpha" (RIP SO + 4) para %ecx
0x0804917a <+4>:	and    $0xfffffff0,%esp # alinha o topo da pilha em 16 bytes
0x0804917d <+7>:	pushl  -0x4(%ecx)       # salva RIP SO de novo, depois do espaço de alinhamento
0x08049180 <+10>:	push   %ebp             # salva OFP na pilha
0x08049181 <+11>:	mov    %esp,%ebp        # marco de ativacao da pilha de main
0x08049183 <+13>:	push   %ebx             # salva valor original de %ebx
0x08049184 <+14>:	push   %ecx             # salva "alpha"
0x08049185 <+15>:	sub    $0x20,%esp       # abre 32 bytes na pilha
0x08049188 <+18>:	call   0x80491b2 <__x86.get_pc_thunk.ax>  # carrega o endereço da proxima instrucao em %eax. Ou seja 0x0804918d
0x0804918d <+23>:	add    $0x2e73,%eax     # %eax = 0x0804918d + 0x2e73 = 0x804C000
0x08049192 <+28>:	sub    $0xc,%esp        # abre +12 bytes na pilha
0x08049195 <+31>:	lea    -0x28(%ebp),%edx # carrega em %edx o endereço -0x28(%ebp) = -40(%ebp) (endereço do buffer de gets)
0x08049198 <+34>:	push   %edx             # salva o endereço -0x28(%ebp) na pilha, para servir de argumento de gets
0x08049199 <+35>:	mov    %eax,%ebx        # %ebx = %eax = 0x804C000
0x0804919b <+37>:	call   0x8049040 <gets@plt> # chama gets com o buffer em -0x28(%ebp) como argumento
0x080491a0 <+42>:	add    $0x10,%esp       # recolhe 16 bytes da pilha
0x080491a3 <+45>:	mov    $0x0,%eax        # zera o valor em %eax
0x080491a8 <+50>:	lea    -0x8(%ebp),%esp  # move o topo da pilha para -0x8(%ebp)
0x080491ab <+53>:	pop    %ecx             # restaura valor original
0x080491ac <+54>:	pop    %ebx             # restaura valor original
0x080491ad <+55>:	pop    %ebp             # restaura valor original
0x080491ae <+56>:	lea    -0x4(%ecx),%esp  # move o topo da pilha para o 1° RIP SO
0x080491b1 <+59>:	ret                     # retorna controle para o SO com %eax = 0