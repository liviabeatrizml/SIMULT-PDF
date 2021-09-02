Algoritmo "Sistema_de_Multas_de_Transito"
// Disciplina : Laboratório de Algoritmos
// Professor  : Dyego Magno
// Descricão  : Sistema de Multas de Trânsito - Pau dos Ferros
// Autores    : Leonardo Inácio Guilherme Dantas e Livia Beatriz Maia de Lima
// Turma      : 01
// Datas programando : 15/08/2021 | 20/08/2021 | 25/08/2021 | 26/08/2021

Var
comands, numCarteira, pontCarteira, id : inteiro
quantsTents, quantMultas, quantsMultLv, quantsMultMd, quantsMultGv, quantsMultGvs : inteiro
login, senha, nome, modelo, placa, grau, prosseguir, apresentar : caractere
valorMulta, valorTTMults, valorLeve, valorMedia, valorGrave, valorGravissima : real
encerrar, sequencia, escolhido : logico

funcao telainicial(): caractere
inicio
      escreval("       ####    ##   ###     ###   ##    ##   ##    ########  ")
      escreval("      ##  ##        ####   ####   ##    ##   ##       ##     ")
      escreval("      ##       ##   ## ## ## ##   ##    ##   ##       ##     ")
      escreval("       ####    ##   ##  ###  ##   ##    ##   ##       ##     ")
      escreval("         ###   ##   ##   #   ##   ##    ##   ##       ##     ")
      escreval("      ##  ##   ##   ##       ##   ##    ##   ##       ##     ")
      escreval("       ####    ##   ##       ##    ######    ######   ##     ")
      escreval("")
fimfuncao

funcao headerfrase(): caractere
inicio
      escreval("              SISTEMA DE MULTAS DE PAU DOS FERROS             ")
      escreval("      Campanha de arrecadacão de dinheiro para área da saúde  ")
      escreval("             em prol do enfrentamento da Covid-19             ")
fimfuncao

Inicio

repita
      escreval("")
      apresentar := telainicial
      escreval(apresentar)
      apresentar := headerfrase
      escreval(apresentar)

      se (quantsTents = 2) entao
         escreval(" * Você tem apenas mais UMA TENTATIVA!")
      fimse

      //Login com validacão de senha
      escreva(" -> Login: ")
      leia(login)
      escreva(" -> Senha: ")
      leia(senha)

      se (senha <> "******") entao
         quantsTents := quantsTents + 1
      
         escreval(" USUÁRIO E/OU SENHA INVÁLIDOS")
         escreval("")

         timer(100)

         se (quantsTents <> 3) entao
            escreval("Tente novamente em instantes...")
         fimse

         timer(1100)
         timer(0)

         limpatela
      fimse

ate (senha = "******") ou (quantsTents = 3)

se (quantsTents = 3) e (senha <> "******") entao
   encerrar := verdadeiro
senao
   timer(100)
     escreval("Entrando...")
   timer(700)
   timer(0)

   id := RandI(99)
fimse

enquanto (encerrar = falso) faca
    limpatela
    apresentar := headerfrase
    escreval(apresentar)

    //Menu Principal
    escreval("  +-----------------------------------------------------------+")
    escreval("  | Bem vindo ao SIMULT - Sistemas de Multa de Pau dos Ferros |")
    escreval("  | Escolha o serviço que deseja realizar:                    |")
    escreval("  +-----------------------------------------------------------+")
    escreval("  |  [1] Inserir multas                                       |")
    escreval("  |  [2] Gerar relatório                                      |")
    escreval("  |  [3] Sair                                                 |")
    escreval("  +-----------------------------------------------------------+")

    escreva("Opcão desejada: ")
    leia(comands)

    se (comands < 1) ou (comands > 3) entao
       repita
           escreva("Digite uma opcão VÁLIDA: ")
           leia(comands)
       ate (comands >= 1) e (comands <= 3)
    fimse

    se (comands = 1) entao
       limpatela
       apresentar := headerfrase
       escreval(apresentar)

       //Dados do infrator
       escreval("Qual o nome completo do infrator? ")
       escreva("- ")
       leia(nome)

       se (nome = "") entao
          repita
               escreval("Digite um NOME VÁLIDO... ")
               escreva("- ")
               leia(nome)
          ate (nome <> "")
       fimse

       nome := Maiusc(nome)

       escreval("Qual o número da carteira do infrator (XXXXXX)? ")
       escreva("- ")
       leia(numCarteira)
       
       //Validação do formato da carteira
       se ((compr(Numpcarac(numCarteira))) <> 6) entao
          repita
               escreval("Digite o número da carteira corretamente (formato XXXXXX)")
               escreva("- ")
               leia(numCarteira)
          ate ((compr(Numpcarac(numCarteira))) = 6 )
       fimse

       limpatela
       apresentar := headerfrase
       escreval(apresentar)

       //Dados do veículo
       escreval("Qual a placa do veículo (XXXxxxx)? ")
       escreva("- ")
       leia(placa)

       //Validação do formato da placa
       se ((compr(Numpcarac(placa))) <> 7) entao
          repita
               escreval("Digite a placa corretamente (formato XXXxxxx)")
               escreva("- ")
               leia(placa)
          ate ((compr(Numpcarac(placa))) = 7 )
       fimse

       placa := Maiusc(placa)

       escreval("Qual o modelo do veículo? ")
       escreva("- ")
       leia(modelo)

       modelo := Maiusc(modelo)

       limpatela
       apresentar := headerfrase
       escreval(apresentar)

       //Menu multas
       escreval("              +--------------------------------+")
       escreval("              |      GRAVIDADE DE MULTAS       |")
       escreval("              +--------------------------------+")
       escreval("              |  LEVE               R$ 88,38   |")
       escreval("              |  MEDIA              R$ 130,16  |")
       escreval("              |  GRAVE              R$ 195,23  |")
       escreval("              |  GRAVISSIMA         R$ 293,47  |")
       escreval("              +--------------------------------+")

       //Para não gerar conflito nas definições do escolha
       grau := ""
       escolhido := falso

       repita
            escreval("")
            escreval("Qual o tipo da multa do infrator? ")
            escreva("-> ")
            leia(grau)
            
            grau := Maiusc(grau)

            //Validação do tipo de multa com as devidas operações
            escolha grau
                 caso "LEVE"
                     pontCarteira := 3
                     valorMulta := 88.38
                     valorLeve := valorLeve + valorMulta
                     quantsMultLv := quantsMultLv + 1
                     escolhido := verdadeiro
                 caso "MEDIA"
                     pontCarteira := 4
                     valorMulta := 130.16
                     valorMedia := valorMedia + valorMulta
                     quantsMultMd := quantsMultMd + 1
                     escolhido := verdadeiro
                 caso "GRAVE"
                     pontCarteira := 5
                     valorMulta := 195.23
                     valorGrave := valorGrave + valorMulta
                     quantsMultGv := quantsMultGv + 1
                     escolhido := verdadeiro
                 caso "GRAVISSIMA"
                     pontCarteira := 7
                     valorMulta := 293.47
                     valorGravissima := valorGravissima + valorMulta
                     quantsMultGvs := quantsMultGvs + 1
                     escolhido := verdadeiro
                 outrocaso
                     escreval("TIPO INVÁLIDO!!!")
            fimescolha

            quantMultas := quantsMultLv + quantsMultMd + quantsMultGv + quantsMultGvs
            valorTTMults := valorTTMults + valorMulta

            se (escolhido = verdadeiro) entao
               interrompa
            fimse
       ate falso

       limpatela
       apresentar := headerfrase
       escreval(apresentar)

       //Relat�rio do infrator
       escreval("     + - - - - - - - - - - - - - - - - - - - - - - - - - - +")
       escreval("     |               NOTIFICAÇÃO DE AUTUAÇÃO               |")
       escreval("     |        POR INFRAÇÃO À LEGISLAÇÃO DE TRÂNSITO        |")
       escreval("     + - - - - - - - - - - - - - - - - - - - - - - - - - - +")
       escreval("      Nome: ", nome, " |  CNH:", numCarteira                 )
       escreval("      Modelo do veiculo: ", modelo, "     |  Placa: ", placa )
       escreval("      Tipo da multa: ", grau," | Pontos:", pontCarteira," |  Valor: ", valorMulta:2:2)
       escreval("     ________________________________________________________")
       escreval("               * Notificação cadastrada por usuário de id", id,"*")
       escreval("")

       escreval("Aperte ENTER para da sequência:")
       leia(sequencia)

    senao
       se (comands = 2) entao
          limpatela
          apresentar := headerfrase
          escreval(apresentar)

          //Relatório Geral
          escreval("  + - - - - - - - - - - - - - - - - - - - - - - - - - - - - +")
          escreval("  |                   RELATÓRIO SIMULT-PDF                  |")
          escreval("  + - - - - - - - - - - - - - - - - - - - - - - - - - - - - +")
          escreval("   - Foi aplicado", quantsMultLv, " multa(s) LEVE, arrecadando: R$ ", valorLeve:2:2)
          escreval("   - Foi aplicado", quantsMultMd, " multa(s) MEDIA, arrecadando: R$ ", valorMedia:2:2)
          escreval("   - Foi aplicado", quantsMultGv, " multa(s) GRAVE, arrecadando: R$ ", valorGrave:2:2)
          escreval("   - Foi aplicado", quantsMultGvs, " multa(s) GRAVISSIMA, arrecadando: R$ ", valorGravissima:2:2)
          escreval("")
          escreval("        TOTAL DE MULTAS", quantMultas, "  |  TOTAL ARRECADADO: R$ ", valorTTMults:2:2)
          escreval("   __________________________________________________________")
          escreval("                     * Relatório gerado às 16:23 01/09/2021 *")
          escreval("")
          escreval("")

          escreval("- Digite 1 para CONTINUAR e 2 para FINALIZAR.")
          escreva("Opção desejada: ")
          leia(prosseguir)

          se (prosseguir = "2") entao
             encerrar := verdadeiro

             timer(0)
                 escreval("FINALIZANDO PROCEDIMENTO...")
             timer(500)
                 limpatela
             timer(0)
          fimse
       senao
          se (comands = 3) entao
             timer(0)
                 escreval("FINALIZANDO PROCEDIMENTO...")
             timer(500)
                 limpatela
             timer(0)

             encerrar := verdadeiro
          fimse
       fimse
    fimse
fimenquanto

limpatela
apresentar := headerfrase
escreval(apresentar)
apresentar := telainicial
escreval(apresentar)

se (quantsTents <> 3) entao
   escreval(" ** PROCEDIMENTO FINALIZADO **")
senao
   escreval(" ** ACESSO NEGADO **")
fimse

Fimalgoritmo