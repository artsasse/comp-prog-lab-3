# Terceiro Lab - Buffer Overflow
Trabalho de Computadores e Programação - MAB 353 UFRJ.
* **Arthur Sasse - DRE 117206692**
* **Gabriel Bitencourt DRE 117047844**

## Primeiro desafio
Usando o binário [buf1](./buf1) você deverá se aproveitar do mau uso da função `gets()` para trocar a mensagem de boas vindas exibida na tela por "Tchau, mundo cruel".

### Responda:
1. Qual o tamanho do buffer que lê o nome do usuário?
   
    **RESPOSTA:** O buffer tem tamanho de 100 bytes. Podemos verificar isso porque a funcao gets recebe o endereço -138(%ebp) como argumento, mas a partir do endereço -38(%ebp) estão guardados os bytes da string "Seja bem vindo!". Logo, 138 - 38 = 100.

2. Qual o tamanho do buffer de "Seja bem vindo!"?
   
   **RESPOSTA:** A string "Seja bem vindo!", contando o char NUL que indica final de string, ocupa 16 bytes de -38(%ebp) até -22(%ebp). No entanto, os bytes de -22(%ebp) até -8(%ebp) sao preenchidos com o valor zero. Portanto, podemos assumir que esse buffer possui 38 - 8 = 30 bytes.
   
3. Por que o primeiro print só para depois de "Tchau, mundo cruel"?
   
   **RESPOSTA:** Porque a funçao gets so para de ler a string depois de encontrar o char NUL, independentemente do tamanho definido para o buffer. E é so depois de "Tchau, mundo cruel" que o programa encontra esse char. 

### Observações:
Para facilitar a geraçao da string que causaria um buffer overflow, usamos um pequeno script em python (`desafio1.py`). Basicamente ele gera uma string cujos primeiros 100 bytes sao chars 'a' para ocupar todo espaço destinado ao buffer original do gets. Esses 100 'a's sao seguidos dos chars 'Tchau, mundo cruel' que sobrescrevem a mensagem "Seja bem vindo!". Em vez de 'a' também poderiamos usar um char como '\1', que representa um caracter especial do ASCII que nao é printado no terminal.

## Segundo desafio
Nesse desafio, encontrado em [buf2](./buf2), um pouco mais complexo, você deverá se aproveitar novamente do mau uso da função `gets()` para executar uma função que nunca é chamada no programa. Ou seja, apesar da função `codigo_morto` nunca ser chamada, você se aproveitará do buffer overflow para fazê-la ser executada.

### Responda:
1. Qual endereço do código morto? 
   
   **RESPOSTA:** O codigo morto (0x08049196) se encontra 43 bytes antes do codigo de main (0x080491c1).

2. Qual o tamanho do buffer de leitura?
   
   **RESPOSTA:** O buffer de leitura ocupa o espaço de -72(%ebp) até -8(%ebp). Logo seu tamanho é 72 - 8 = 64 bytes.

3. Para onde aponta o ebp? E o `eip` de retorno da função que chama `main`?

   **RESPOSTA:** %ebp aponta para o Old Frame Pointer, para o endereço da base da pilha anterior à chamada de main. No nosso caso esse endereço corresponde à 0xffffd5c8 e o valor guardado nesse endereço é 0. 
   E após o término de main, o %eip passa a apontar para o endereço da instrução do sistema operacional que vem logo em seguida da chamada de main. No nosso caso esse endereço é 0xffffd65c.

4. Quantos bytes deve-se escrever até conseguir sobrescrever `eip`?

   **RESPOSTA:** Devemos escrever pelo menos 68 bytes para conseguir sobrescrever o %eip. Isso acontece porque antes de retornar, o programa determina para onde o topo da pilha deve apontar a partir de uma operação com %ecx. Logo, basta alterar %ecx para alterar %eip. Para fazer isso, primeiro escrevemos 64 bytes, para ocupar o buffer de gets e depois escrevemos mais 4 bytes, sobrescrevendo o conteúdo que será restaurado para %ecx antes do fim do programa.

5. Qual valor deverá receber ser colocado para que eip aponte agora para `codigo_morto`?

   **RESPOSTA:** Quando o programa funciona normalmente, o conteudo restaurado para %ecx é um endereço 4 bytes acima do RIP SO. Entao devemos fazer com que %ecx fique com um endereço 4 bytes acima da funcao codigo_morto. Ou seja, 0x08049196 + 4 = 0x0804919A no nosso caso.

6. Por que o programa não termina normalmente após ser explorado?

   **RESPOSTA:** Porque o controle nunca retorna para o sistema operacional.

Dica importante: para conseguir inserir o endereço no binário, você deve inserí-lo em forma de *shellcode*. Pra isso, você pode usar um script em Python, do tipo:
```python
import struct
print(struct.pack("I", 0x08040000))
```

Rode esse programa conectando a saída padrão dele à entrada padrão do binário:
```bash
python exploit.py | ./buf2
```

Claro, um `exploit.py` só com o conteúdo acima não irá funcionar, pois você ainda precisará adicionar os bytes pra escrever o buffer inteiro e chegar até onde o `EIP` da função que chama a `main` está localizado.

## Terceiro desafio
Nesse último desafio, [buf3](./buf3), mais uma vez temos um programa utilizando `gets()` indevidamente, mas, diferentemente do desafio anterior, você não terá nenhuma função para executar. Dessa vez, você deverá inserir *shellcode* na pilha e fazer seu programa executá-lo. Assim, se bem sucedido, você deverá conseguir acesso a uma shell.

Novamente, destaque tudo que for importante durante a resolução do desafio no relatório.

O shellcode a ser inserido para executar uma shell pode ser encontrado [aqui](http://shell-storm.org/shellcode/).
