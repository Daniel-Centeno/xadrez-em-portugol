Algoritmo "xadrez"
//
// Descri��o   : Programa de xadrez
// Autor(a)    : Daniel Centeno
// Data atual  : 11/13/2024

//variaveis globais
var
fds : caracter
   resposta: caracter
   matriz_tabuleiro: vetor[1..8, 1..8] de inteiro
   index,index_hor,index_ver,horizontal,coluna : inteiro
   lista_pecas : vetor[0..12] de inteiro
   rodando : logico
   vez_brancas : logico
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
   escreval("este programa usa a nota��o alg�brica")
   escreval("exemplo:")
   escreval("     e4. e5. ...")
   escreval("     ou")
   escreval("     e2e4. e7e5")
   escreval("")
   escreval("Casos especiais:")
   escreval("     '0-0' '0-0-0' - roque")
   escreval(" - ENTER - para come�ar")
fimprocedimento

//
procedimento mostrar_tabuleiro
inicio
para index_hor de 1 ate 8 passo 1 faca
     para index_ver de 1 ate 8 passo 1 faca
          //metodo pra converter a pe�a de numero pra algo legivel
          escolha matriz_tabuleiro[index_hor, index_ver]
                  caso 0
                       escreva(" �")
                  caso 1
                       escreva(" p")
                  caso 2
                       escreva(" c")
                  caso 3
                       escreva(" b")
                  caso 4
                       escreva(" t")
                  caso 5
                       escreva(" d")
                  caso 6
                       escreva(" r")
                  caso 7
                       escreva(" P")
                  caso 8
                       escreva(" C")
                  caso 9
                       escreva(" B")
                  caso 10
                       escreva(" T")
                  caso 11
                       escreva(" D")
                  caso 12
                       escreva(" R")
                  caso 13
                       escreva(" r")
          fimescolha

          //escreva(matriz_tabuleiro[index_hor, index_ver])

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

//
procedimento vertical_para_numero(letra: caractere)
var
   codigo : inteiro
inicio
      // tira o codigo ascii da letra
      codigo := asc(letra)

      escolha codigo
           caso 97
                //letra a -> 1
           caso 98
                //letra a -> 2
           caso 99
                //letra a -> 3
           caso 100
                //letra a -> 4
           caso 101
                //letra a -> 5
           caso 102
                //letra a -> 6
           caso 103
                //letra a -> 7
           caso 104
                //letra a -> 8
      fimescolha
fimprocedimento

//
procedimento computar_lance(casa_inic, casa_fin : caracter)
var
   col, hor : caracter
inicio
   col <- copia(casa_inic,1,1)
   vertical_para_numero(col)

fimprocedimento

// -------------- verifica�ao de xeques / amea�as ------
funcao verificar_ameaca(casa : caracter) : logico
       verificar_torre(casa)
       //outras pe�as
       retorne
fimfuncao

///// ----------- verifica��o de movimentos das pe�as -----
//
procedimento verificar_torre(hor,ver : inteiro)
inicio
     //verifica��o para baixo
     escreval("")

        para index_hor de hor+1 ate 8 passo 1 faca
           //o "+1" � para descontar a casa atual e at� 7, pq � o num max de casas
           // poss�veis de serem andadas

           // verifica se a casa est� vazia
           se matriz_tabuleiro[index_hor,ver] <> 0 entao
              // se a casa n�o estiver vazia, n�o prossegue a verifica��o
              interrompa
           fimse


           escreval("index_hor: ",index_hor)
           escreval("hor: ",hor)
        fimpara
     
     //verifica��o para cima
     escreval("")
        para index_hor de hor-1 ate 1 passo -1 faca
           //o "+1" � para descontar a casa atual e at� 7, pq � o num max de casas
           // poss�veis de serem andadas

           se matriz_tabuleiro[index_hor,ver] <> 0 entao
             // se a casa n�o estiver vazia, n�o prossegue a verifica��o
             interrompa
           fimse

           escreval("index_hor: ",index_hor)
           escreval("hor: ",hor)
        fimpara
     
     //verifica��o para direita
     escreval("")
        para index_ver de ver+1 ate 8 passo 1 faca
           se matriz_tabuleiro[hor,index_ver] <> 0 entao
              // se a casa n�o estiver vazia, n�o prossegue a verifica��o
              interrompa
           fimse

           escreval("index_ver: ",index_ver)
           escreval("ver: ", ver)
        fimpara

     //verifica��o para esquerda
     escreval("")
        para index_ver de ver-1 ate 1 passo -1 faca
           se matriz_tabuleiro[hor,index_ver] <> 0 entao
              // se a casa n�o estiver vazia, n�o prossegue a verifica��o
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
    //verifica��o inferior-direita
     escreval("")
        para index_ver de ver+1 ate 8 passo 1 faca
           index_hor := index_hor+1
           se ((index_hor < 1) ou (index_hor > 8)) entao
              interrompa
           fimse
           se (matriz_tabuleiro[index_hor,index_ver] <> 0) entao
              interrompa
           fimse
           escreval("index_ver: ",index_ver)
           escreval("index_hor: ",index_hor)
           escreval(" ")
        fimpara

index_hor := hor
     //verifica��o superior-direita
     escreval("")
        para index_ver de ver+1 ate 8 passo 1 faca
           index_hor := index_hor-1
           se (index_hor < 1) ou (index_hor > 8) entao
              interrompa
           fimse
           se (matriz_tabuleiro[index_hor,index_ver] <> 0) entao
              // se a casa n�o estiver vazia, n�o prossegue a verifica��o
                 interrompa
           fimse
           escreval("index_ver: ",index_ver)
           escreval("index_hor: ",index_hor)
           escreval(matriz_tabuleiro[index_hor,index_ver])
           escreval(" ")
        fimpara
        
index_ver := ver
    //verifica��o inferior-esquerda
     escreval("")
        para index_hor de hor+1 ate 8 passo 1 faca

           index_ver := index_ver-1
           se (index_ver < 1) ou (index_ver > 8) entao
              interrompa
           fimse
           se (matriz_tabuleiro[index_hor,index_ver] <> 0) entao
              // se a casa n�o estiver vazia, n�o prossegue a verifica��o
                 interrompa
           fimse

           escreval("index_ver: ",index_ver)
           escreval("index_hor: ",index_hor)
           escreval(" ")
        fimpara

index_ver := ver
     //verifica��o superior-esquerda
     escreval("")
        para index_hor de hor-1 ate 1 passo -1 faca
           index_ver := index_ver-1
           se (index_ver < 1) ou (index_ver > 8) entao
              interrompa
           fimse
           se (matriz_tabuleiro[index_hor,index_ver] <> 0) entao
              // se a casa n�o estiver vazia, n�o prossegue a verifica��o
                 interrompa
           fimse
           escreval("index_ver: ",index_ver)
           escreval("index_hor: ",index_hor)
           escreval(" ")
        fimpara
fimprocedimento

//-
procedimento verificar_dama(hor, ver: inteiro)
inicio
   // Verificar torre (movimento horizontal e vertical, at� 7 casas)

   // Verifica��o para baixo
   para index_hor de hor + 1 ate hor + 7 faca
      se (index_hor >= 1) e (index_hor <= 8) entao
         se matriz_tabuleiro[index_hor, ver] = 0 entao
            escreval("Movimento poss�vel para baixo: ", index_hor, ",", ver)
         senao
            interrompa // Parar ao encontrar uma casa ocupada
         fimse
      fimse
   fimpara

   // Verifica��o para cima
   para index_hor de hor - 1 ate hor - 7 passo -1 faca
      se (index_hor >= 1) e (index_hor <= 8) entao
         se matriz_tabuleiro[index_hor, ver] = 0 entao
            escreval("Movimento poss�vel para cima: ", index_hor, ",", ver)
         senao
            interrompa
         fimse
      fimse
   fimpara

   // Verifica��o para direita
   para index_ver de ver + 1 ate ver + 7 faca
      se (index_ver >= 1) e (index_ver <= 8) entao
         se matriz_tabuleiro[hor, index_ver] = 0 entao
            escreval("Movimento poss�vel para direita: ", hor, ",", index_ver)
         senao
            interrompa
         fimse
      fimse
   fimpara

   // Verifica��o para esquerda
   para index_ver de ver - 1 ate ver - 7 passo -1 faca
      se (index_ver >= 1) e (index_ver <= 8) entao
         se matriz_tabuleiro[hor, index_ver] = 0 entao
            escreval("Movimento poss�vel para esquerda: ", hor, ",", index_ver)
         senao
            interrompa
         fimse
      fimse
   fimpara

   // Verificar bispo (movimento diagonal, at� 7 casas)

   // Inferior-direita
   para index_hor de hor + 1 ate hor + 7 faca
      index_ver := ver + (index_hor - hor)
      se (index_hor >= 1) e (index_hor <= 8) e (index_ver >= 1) e (index_ver <= 8) entao
         se matriz_tabuleiro[index_hor, index_ver] = 0 entao
            escreval("Movimento poss�vel para inferior-direita: ", index_hor, ",", index_ver)
         senao
            interrompa
         fimse
      fimse
   fimpara

   // Superior-direita
   para index_hor de hor - 1 ate hor - 7 passo -1 faca
      index_ver := ver + (hor - index_hor)
      se (index_hor >= 1) e (index_hor <= 8) e (index_ver >= 1) e (index_ver <= 8) entao
         se matriz_tabuleiro[index_hor, index_ver] = 0 entao
            escreval("Movimento poss�vel para superior-direita: ", index_hor, ",", index_ver)
         senao
            interrompa
         fimse
      fimse
   fimpara

   // Inferior-esquerda
   para index_hor de hor + 1 ate hor + 7 faca
      index_ver := ver - (index_hor - hor)
      se (index_hor >= 1) e (index_hor <= 8) e (index_ver >= 1) e (index_ver <= 8) entao
         se matriz_tabuleiro[index_hor, index_ver] = 0 entao
            escreval("Movimento poss�vel para inferior-esquerda: ", index_hor, ",", index_ver)
         senao
            interrompa
         fimse
      fimse
   fimpara

   // Superior-esquerda
   para index_hor de hor - 1 ate hor - 7 passo -1 faca
      index_ver := ver - (hor - index_hor)
      se (index_hor >= 1) e (index_hor <= 8) e (index_ver >= 1) e (index_ver <= 8) entao
         se matriz_tabuleiro[index_hor, index_ver] = 0 entao
            escreval("Movimento poss�vel para superior-esquerda: ", index_hor, ",", index_ver)
         senao
            interrompa
         fimse
      fimse
   fimpara
fimprocedimento


//-
procedimento verificar_rei(hor, ver: inteiro)
inicio
   // Inicializar vari�veis
   index_hor := hor
   index_ver := ver

   // Verificar torre (movimento horizontal e vertical, 1 casa)

   // Verifica��o para baixo
   se (index_hor + 1 >= 1) e (index_hor + 1 <= 8) entao
      se matriz_tabuleiro[index_hor + 1, ver] = 0 entao
         escreval("Movimento poss�vel para baixo: ", index_hor + 1, ",", ver)
      fimse
   fimse

   // Verifica��o para cima
   se (index_hor - 1 >= 1) e (index_hor - 1 <= 8) entao
      se matriz_tabuleiro[index_hor - 1, ver] = 0 entao
         escreval("Movimento poss�vel para cima: ", index_hor - 1, ",", ver)
      fimse
   fimse

   // Verifica��o para direita
   se (index_ver + 1 >= 1) e (index_ver + 1 <= 8) entao
      se matriz_tabuleiro[hor, index_ver + 1] = 0 entao
         escreval("Movimento poss�vel para direita: ", hor, ",", index_ver + 1)
      fimse
   fimse

   // Verifica��o para esquerda
   se (index_ver - 1 >= 1) e (index_ver - 1 <= 8) entao
      se matriz_tabuleiro[hor, index_ver - 1] = 0 entao
         escreval("Movimento poss�vel para esquerda: ", hor, ",", index_ver - 1)
      fimse
   fimse

   // Verificar bispo (movimento diagonal, 1 casa)

   // Inferior-direita
   se (index_hor + 1 >= 1) e (index_hor + 1 <= 8) e (index_ver + 1 >= 1) e (index_ver + 1 <= 8) entao
      se matriz_tabuleiro[index_hor + 1, index_ver + 1] = 0 entao
         escreval("Movimento poss�vel para inferior-direita: ", index_hor + 1, ",", index_ver + 1)
      fimse
   fimse

   // Superior-direita
   se (index_hor - 1 >= 1) e (index_hor - 1 <= 8) e (index_ver + 1 >= 1) e (index_ver + 1 <= 8) entao
      se matriz_tabuleiro[index_hor - 1, index_ver + 1] = 0 entao
         escreval("Movimento poss�vel para superior-direita: ", index_hor - 1, ",", index_ver + 1)
      fimse
   fimse

   // Inferior-esquerda
   se (index_hor + 1 >= 1) e (index_hor + 1 <= 8) e (index_ver - 1 >= 1) e (index_ver - 1 <= 8) entao
      se matriz_tabuleiro[index_hor + 1, index_ver - 1] = 0 entao
         escreval("Movimento poss�vel para inferior-esquerda: ", index_hor + 1, ",", index_ver - 1)
      fimse
   fimse

   // Superior-esquerda
   se (index_hor - 1 >= 1) e (index_hor - 1 <= 8) e (index_ver - 1 >= 1) e (index_ver - 1 <= 8) entao
      se matriz_tabuleiro[index_hor - 1, index_ver - 1] = 0 entao
         escreval("Movimento poss�vel para superior-esquerda: ", index_hor - 1, ",", index_ver - 1)
      fimse
   fimse
fimprocedimento

//
procedimento verificar_peoes_brancas(hor,ver : inteiro)
// Inferior-direita
   se (index_hor + 1 >= 1) e (index_hor + 1 <= 8) e (index_ver + 1 >= 1) e (index_ver + 1 <= 8) entao
      se matriz_tabuleiro[index_hor + 1, index_ver + 1] = 0 entao
         escreval("Movimento poss�vel para inferior-direita: ", index_hor + 1, ",", index_ver + 1)
      fimse
   fimse
// Inferior-esquerda
   se (index_hor + 1 >= 1) e (index_hor + 1 <= 8) e (index_ver - 1 >= 1) e (index_ver - 1 <= 8) entao
      se matriz_tabuleiro[index_hor + 1, index_ver - 1] = 0 entao
         escreval("Movimento poss�vel para inferior-esquerda: ", index_hor + 1, ",", index_ver - 1)
      fimse
   fimse
fimprocedimento

//
procedimento verificar_peoes_pretas(hor,ver : inteiro)
 // Superior-direita
   se (index_hor - 1 >= 1) e (index_hor - 1 <= 8) e (index_ver + 1 >= 1) e (index_ver + 1 <= 8) entao
      se matriz_tabuleiro[index_hor - 1, index_ver + 1] = 0 entao
         escreval("Movimento poss�vel para superior-direita: ", index_hor - 1, ",", index_ver + 1)
      fimse
   fimse
   // Superior-esquerda
   se (index_hor - 1 >= 1) e (index_hor - 1 <= 8) e (index_ver - 1 >= 1) e (index_ver - 1 <= 8) entao
      se matriz_tabuleiro[index_hor - 1, index_ver - 1] = 0 entao
         escreval("Movimento poss�vel para superior-esquerda: ", index_hor - 1, ",", index_ver - 1)
      fimse
   fimse

fimprocedimento


//
procedimento verificar_cavalo(hor,ver : inteiro)
var
inicio
      index_hor := hor+2
      index_ver := ver+1
           se (index_ver > 0) e (index_ver < 9) entao
              se (index_hor > 0) e (index_hor < 9) entao
                 //se (matriz_tabuleiro[index_hor,index_ver] = 0) entao
                 // se a casa n�o estiver vazia, n�o prossegue a verifica��o
                    escreval("casa valida(h,v): ", index_hor, index_ver)
                    //computa o lance
                 //fimse
              fimse
           fimse
      index_hor := hor+1
      index_ver := ver+2
           se (index_ver > 0) e (index_ver < 9) entao
              se (index_hor > 0) e (index_hor < 9) entao
                 //se (matriz_tabuleiro[index_hor,index_ver] = 0) entao
                 // se a casa n�o estiver vazia, n�o prossegue a verifica��o
                    escreval("casa valida(h,v): ", index_hor, index_ver)
                    //computa o lance
                 //fimse
              fimse
           fimse
      index_hor := hor+2
      index_ver := ver-1
           se (index_ver > 0) e (index_ver < 9) entao
              se (index_hor > 0) e (index_hor < 9) entao
                 //se (matriz_tabuleiro[index_hor,index_ver] = 0) entao
                 // se a casa n�o estiver vazia, n�o prossegue a verifica��o
                    escreval("casa valida(h,v): ", index_hor, index_ver)
                    //computa o lance
                 //fimse
              fimse
           fimse
      index_hor := hor+1
      index_ver := ver-2
           se (index_ver > 0) e (index_ver < 9) entao
              se (index_hor > 0) e (index_hor < 9) entao
                 //se (matriz_tabuleiro[index_hor,index_ver] = 0) entao
                 // se a casa n�o estiver vazia, n�o prossegue a verifica��o
                    escreval("casa valida(h,v): ", index_hor, index_ver)
                    //computa o lance
                 //fimse
              fimse
           fimse
      index_hor := hor-2
      index_ver := ver-1
           se (index_ver > 0) e (index_ver < 9) entao
              se (index_hor > 0) e (index_hor < 9) entao
                 //se (matriz_tabuleiro[index_hor,index_ver] = 0) entao
                 // se a casa n�o estiver vazia, n�o prossegue a verifica��o
                    escreval("casa valida(h,v): ", index_hor, index_ver)
                    //computa o lance
                 //fimse
              fimse
           fimse
      index_hor := hor-1
      index_ver := ver-2
           se (index_ver > 0) e (index_ver < 9) entao
              se (index_hor > 0) e (index_hor < 9) entao
                 //se (matriz_tabuleiro[index_hor,index_ver] = 0) entao
                 // se a casa n�o estiver vazia, n�o prossegue a verifica��o
                    escreval("casa valida(h,v): ", index_hor, index_ver)
                    //computa o lance
                 //fimse
              fimse
           fimse
      index_hor := hor-1
      index_ver := ver+2
           se (index_ver > 0) e (index_ver < 9) entao
              se (index_hor > 0) e (index_hor < 9) entao
                 //se (matriz_tabuleiro[index_hor,index_ver] = 0) entao
                 // se a casa n�o estiver vazia, n�o prossegue a verifica��o
                    escreval("casa valida(h,v): ", index_hor, index_ver)
                    //computa o lance
                 //fimse
              fimse
           fimse
      index_hor := hor-2
      index_ver := ver+1
           se (index_ver > 0) e (index_ver < 9) entao
              se (index_hor > 0) e (index_hor < 9) entao
                 //se (matriz_tabuleiro[index_hor,index_ver] = 0) entao
                  //se a casa n�o estiver vazia, n�o prossegue a verifica��o
                    escreval("casa valida(h,v): ", index_hor, index_ver)
                    //computa o lance
                 //fimse
              fimse
           fimse


fimprocedimento

//programa principal
inicio
   definir_posicao_inicial

   imprimir_boas_vindas
   leia(resposta)
   
   computar_lance(resposta,resposta)
   escreval(fds)
   mostrar_tabuleiro

   //vertical_para_numero(resposta)

   //limpatela


   //se (resposta = "A") ou (resposta = "a") entao
   //   imprimir_ajuda
   //fimse

   rodando := verdadeiro
   enquanto rodando faca
            rodando := falso

   fimenquanto

   //limpatela

   //loop principal

Fimalgoritmo