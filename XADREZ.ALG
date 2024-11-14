Algoritmo "xadrez"
//
// Descrição   : Programa de xadrez
// Autor(a)    : Daniel Centeno
// Data atual  : 11/13/2024

//variaveis globais
var
   resposta: caracter

   //
procedimento imprimir_boas_vindas
inicio
   escreval("---Bem-vindo!---")
   escreval("")
   escreval("comandos:")
   escreval("(A)juda (Esc) para sair")
   escreval("")

fimprocedimento

//
procedimento imprimir_ajuda
inicio
   limpatela
   escreval("este programa usa a notação algébrica")
   escreval("exemplo:")
   escreval("     e4. e5. ...")
   escreval("     ou")
   escreval("     e2e4. e7e5")
   escreval("")
   escreval("Casos especiais:")
   escreval("     '0-0' '0-0-0' - roque")
   escreval(" - ENTER - para começar")
fimprocedimento

//programa principal
inicio
   imprimir_boas_vindas

   leia(resposta)
   limpatela

   escolha resposta
   caso "A"
      imprimir_ajuda
   fimescolha

   limpatela
   
   //loop principal

Fimalgoritmo