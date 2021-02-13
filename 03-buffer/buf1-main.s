   0x565561bd <+0>:  lea    0x4(%esp),%ecx   # copia "alpha" (RIP SO + 4) para %ecx
   0x565561c1 <+4>:	and    $0xfffffff0,%esp # alinha o topo da pilha em 16 bytes
   0x565561c4 <+7>:	pushl  -0x4(%ecx)   # salva RIP SO de novo, depois do espaço de alinhamento
   0x565561c7 <+10>:	push   %ebp    # salva OFP na pilha
   0x565561c8 <+11>:	mov    %esp,%ebp    # marco de ativacao da pilha de main
   0x565561ca <+13>:	push   %ebx     # salva valor original de %ebx
   0x565561cb <+14>:	push   %ecx     # salva "alpha"
=> 0x565561cc <+15>:	sub    $0x90,%esp   # abre 144 bytes na pilha
   0x565561d2 <+21>:	call   0x565560c0 <__x86.get_pc_thunk.bx>   # carrega o endereço da proxima instrucao em %ebx. Ou seja 0x565561d7
   0x565561d7 <+26>:	add    $0x2e29,%ebx     # %ebx = 0x565561d7 + 0x2e29 = 0x56559000
   0x565561dd <+32>:	movl   $0x616a6553,-0x26(%ebp)   # -0x26 = -38 em decimal
   0x565561e4 <+39>:	movl   $0x6d656220,-0x22(%ebp)   # -0x22 = -34 em decimal
   0x565561eb <+46>:	movl   $0x6e697620,-0x1e(%ebp)   # -0x1e = -30 em decimal
   0x565561f2 <+53>:	movl   $0x216f64,-0x1a(%ebp)  # -0x1a = -26 em decimal
   0x565561f9 <+60>:	movl   $0x0,-0x16(%ebp)       # -0x16 = -22 em decimal
   0x56556200 <+67>:	movl   $0x0,-0x12(%ebp)       # -0x12 = -18 em decimal
   0x56556207 <+74>:	movl   $0x0,-0xe(%ebp)        # -0xe = -14 em decimal
   0x5655620e <+81>:	movw   $0x0,-0xa(%ebp)        # move 2 bytes com valor zero para -10(%ebp)
   0x56556214 <+87>:	sub    $0xc,%esp              # abre +12 bytes na pilha
   0x56556217 <+90>:	lea    -0x1ff8(%ebx),%eax     # carrega em %eax o endereço 0x56559000 - 0x1ff8 = 0x56557008 (esse é o endereço da string "Entre com seu nome")
   0x5655621d <+96>:	push   %eax                   # salva 0x56557008 na pilha, para servir de argumento de puts
   0x5655621e <+97>:	call   0x56556060 <puts@plt>  # chama puts com a string em 0x56557008 como argumento
   0x56556223 <+102>:	add    $0x10,%esp          # recolhe 16 bytes da pilha
   0x56556226 <+105>:	sub    $0xc,%esp           # abre +12 bytes na pilha
   0x56556229 <+108>:	lea    -0x8a(%ebp),%eax    # carrega em %eax o endereço -0x8a(%ebp) = -138(%ebp) (endereço do buffer de gets)
   0x5655622f <+114>:	push   %eax                # salva o endereço -0x8a(%ebp) na pilha, para servir de argumento de gets
   0x56556230 <+115>:	call   0x56556050 <gets@plt>  # chama gets com o buffer em -0x8a(%ebp) como argumento
   0x56556235 <+120>:	add    $0x10,%esp          # recolhe 16 bytes da pilha
   0x56556238 <+123>:	sub    $0x8,%esp           # abre +8 bytes na pilha
   0x5655623b <+126>:	lea    -0x8a(%ebp),%eax    # carrega em %eax o endereço -0x8a(%ebp) (endereço do buffer de gets)
   0x56556241 <+132>:	push   %eax                # salva o endereço -0x8a(%ebp) na pilha, para servir de argumento de printf
   
   0x56556242 <+133>:	lea    -0x1fe3(%ebx),%eax  # carrega em %eax o endereço 0x56559000 - 0x1fe3 = 0x5655701D (esse é o endereço da string padrao do printf?)
   0x56556248 <+139>:	push   %eax                # salva 0x5655701D na pilha, para servir de argumento de printf?
   0x56556249 <+140>:	call   0x56556040 <printf@plt> # chama printf com a string em 0x5655701D e o buffer em 0x56558F76 como argumentos
   0x5655624e <+145>:	add    $0x10,%esp          # recolhe 16 bytes da pilha
   0x56556251 <+148>:	sub    $0xc,%esp           # abre +12 bytes na pilha
   0x56556254 <+151>:	lea    -0x26(%ebp),%eax    # carrega em %eax o endereço -0x26(%ebp) (é o ponteiro para a string "Seja bem vindo!")
   0x56556257 <+154>:	push   %eax                # salva o endereço -0x26(%ebp) na pilha, para servir de argumento de puts
   0x56556258 <+155>:	call   0x56556060 <puts@plt>  # chama puts com a string em -0x26(%ebp) como argumento
   0x5655625d <+160>:	add    $0x10,%esp          # recolhe 16 bytes da pilha
   0x56556260 <+163>:	mov    $0x0,%eax           # zera o valor em %eax
   0x56556265 <+168>:	lea    -0x8(%ebp),%esp     # move o topo da pilha para -0x8(%ebp)
   0x56556268 <+171>:	pop    %ecx                # restaura valor original
   0x56556269 <+172>:	pop    %ebx                # restaura valor original
   0x5655626a <+173>:	pop    %ebp                # restaura valor original
   0x5655626b <+174>:	lea    -0x4(%ecx),%esp     # move o topo da pilha para o 1° RIP SO
   0x5655626e <+177>:	ret                        # retorna controle para o SO com %eax = 0
