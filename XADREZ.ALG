Algoritmo "xadrez"
//
// Descrição   : Programa de xadrez
// Autor(a)    : Daniel Centeno
// Data atual  : 11/13/2024

//variaveis globais
var
   resposta: caracter
   matriz_tabuleiro: vetor[1..8, 1..8] de inteiro
   index,index_hor,index_ver,horizontal,coluna : inteiro
   lista_pecas : vetor[0..12] de inteiro
   rodando : logico

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

//
procedimento mostrar_tabuleiro
inicio
para index_hor de 1 ate 8 passo 1 faca
     para index_ver de 1 ate 8 passo 1 faca
          //metodo pra converter a peça de numero pra algo legivel
          //escreva(matriz_tabuleiro[index_hor, index_ver])
          escreva(index_hor,",",index_ver,"")
     fimpara
     escreval("") // vai para a linha de baixo
fimpara
fimprocedimento

//
procedimento definir_posicao_inicial
inicio

para index_ver de 1 ate 8 passo 1 faca
     para index_hor de 1 ate 8 passo 1 faca
          escolha index_hor // para cada horizontal de cada vez
                  caso 1
                       escolha index_ver //checa cada vertical
                               caso 1
                                    matriz_tabuleiro[index_hor, index_ver] := 4
                               caso 2
                                    matriz_tabuleiro[index_hor, index_ver] := 2
                               caso 3
                                    matriz_tabuleiro[index_hor, index_ver] := 3
                               caso 4
                                    matriz_tabuleiro[index_hor, index_ver] := 5
                               caso 5
                                    matriz_tabuleiro[index_hor, index_ver] := 6
                               caso 6
                                    matriz_tabuleiro[index_hor, index_ver] := 3
                               caso 7
                                    matriz_tabuleiro[index_hor, index_ver] := 2
                               caso 8
                                    matriz_tabuleiro[index_hor, index_ver] := 4
                       fimescolha
                  caso 2
                       matriz_tabuleiro[index_hor, index_ver] := 1
                  caso 7
                       matriz_tabuleiro[index_hor, index_ver] := 7
                  caso 8
                       escolha index_ver
                               caso 1
                                    matriz_tabuleiro[index_hor, index_ver] := 10
                               caso 2
                                    matriz_tabuleiro[index_hor, index_ver] := 8
                               caso 3
                                    matriz_tabuleiro[index_hor, index_ver] := 9
                               caso 4
                                    matriz_tabuleiro[index_hor, index_ver] := 11
                               caso 5
                                    matriz_tabuleiro[index_hor, index_ver] := 12
                               caso 6
                                    matriz_tabuleiro[index_hor, index_ver] := 9
                               caso 7
                                    matriz_tabuleiro[index_hor, index_ver] := 8
                               caso 8
                                    matriz_tabuleiro[index_hor, index_ver] := 10
                       fimescolha

          fimescolha
     fimpara
fimpara
fimprocedimento

///// ----------- verificação de movimentos das peças -----
//
procedimento verificar_torre(hor,ver : inteiro)
inicio
     //verificação para baixo
     escreval("")

        para index_hor de hor+1 ate 8 passo 1 faca
           //o "+1" é para descontar a casa atual e até 7, pq é o num max de casas
           // possíveis de serem andadas

           // verifica se a casa está vazia
           se matriz_tabuleiro[index_hor,ver] <> 0 entao
              // se a casa não estiver vazia, não prossegue a verificação
              interrompa
           fimse


           escreval("index_hor: ",index_hor)
           escreval("hor: ",hor)
        fimpara
     
     //verificação para cima
     escreval("")
        para index_hor de hor-1 ate 1 passo -1 faca
           //o "+1" é para descontar a casa atual e até 7, pq é o num max de casas
           // possíveis de serem andadas

           se matriz_tabuleiro[index_hor,ver] <> 0 entao
             // se a casa não estiver vazia, não prossegue a verificação
             interrompa
           fimse

           escreval("index_hor: ",index_hor)
           escreval("hor: ",hor)
        fimpara
     
     //verificação para direita
     escreval("")
        para index_ver de ver+1 ate 8 passo 1 faca
           se matriz_tabuleiro[hor,index_ver] <> 0 entao
              // se a casa não estiver vazia, não prossegue a verificação
              interrompa
           fimse

           escreval("index_ver: ",index_ver)
           escreval("ver: ", ver)
        fimpara

     //verificação para esquerda
     escreval("")
        para index_ver de ver-1 ate 1 passo -1 faca
           se matriz_tabuleiro[hor,index_ver] <> 0 entao
              // se a casa não estiver vazia, não prossegue a verificação
              interrompa
           fimse

           escreval("index_ver: ",index_ver)
           escreval("ver: ", ver)
        fimpara
fimprocedimento

//
procedimento verificar_bispo(hor,ver : inteiro)
inicio
index_hor := hor
    //verificação inferior-direita
     escreval("")
        para index_ver de ver+1 ate 8 passo 1 faca
           index_hor := index_hor+1
           se matriz_tabuleiro[index_hor,index_ver] <> 0 entao
              // se a casa não estiver vazia, não prossegue a verificação
              interrompa
           fimse
           escreval("index_ver: ",index_ver)
           escreval("index_hor: ",index_hor)
           escreval(" ")
        fimpara

index_hor := hor
     //verificação superior-direita
     escreval("")
        para index_ver de ver+1 ate 8 passo 1 faca
           index_hor := index_hor-1
           se matriz_tabuleiro[index_hor,index_ver] <> 0 entao
              // se a casa não estiver vazia, não prossegue a verificação
              interrompa
           fimse
           escreval("index_ver: ",index_ver)
           escreval("index_hor: ",index_hor)
           escreval(" ")
        fimpara
fimprocedimento

index_ver := ver
    //verificação inferior-direita
     escreval("")
        para index_ver de ver+1 ate 8 passo 1 faca
           index_hor := index_hor+1
           se matriz_tabuleiro[index_hor,index_ver] <> 0 entao
              // se a casa não estiver vazia, não prossegue a verificação
              interrompa
           fimse
           escreval("index_ver: ",index_ver)
           escreval("index_hor: ",index_hor)
           escreval(" ")
        fimpara

index_ver := ver
     //verificação superior-direita
     escreval("")
        para index_ver de ver+1 ate 8 passo 1 faca
           index_hor := index_hor-1
           se matriz_tabuleiro[index_hor,index_ver] <> 0 entao
              // se a casa não estiver vazia, não prossegue a verificação
              interrompa
           fimse
           escreval("index_ver: ",index_ver)
           escreval("index_hor: ",index_hor)
           escreval(" ")
        fimpara
fimprocedimento

//programa principal
inicio
   definir_posicao_inicial
   //mostrar_tabuleiro
   //imprimir_boas_vindas

   //leia(resposta)
   //limpatela

   se (resposta = "A") ou (resposta = "a") entao
      imprimir_ajuda
   fimse

   rodando := verdadeiro
   enquanto rodando faca
            //escreval("sdas")
            //verificar_torre(5,1)
            rodando := falso
            verificar_bispo(4,4)
   fimenquanto

   //limpatela

   //loop principal

Fimalgoritmo