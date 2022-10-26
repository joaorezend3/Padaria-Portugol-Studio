programa
{
	inclua biblioteca Arquivos --> a
	cadeia usuario="ninguém"
	
	inteiro ano_atual, mes_atual, dia_atual, troco_inicial=0
	
	inteiro id_produto[50]
	inteiro cod_prod[50]
	cadeia nome_produto[50]
	real preco_produto[50],qtd_produto[50]
	inteiro prox_prod=0, id_prod=0

	cadeia nome_cliente[50], rua_cliente[50], bairro_cliente[50], email_cliente[50]
	inteiro tel_cliente[50], id_cliente[50], nun_cliente[50], pos_cliente[50], indice=0
	
	funcao inicio()
	{
		escreva("Bem vindo ao sistema, mas não se venda ao sistema.\n\n")
		escreva("Vamos configurar o sistema?\n")
		escreva("Quem esta operando o sistema?\n")
		leia(usuario)
		//configurar_sistema()
		menu_sistema()
		inteiro endereco = a.abrir_arquivo("relatorio.txt", a.MODO_ESCRITA)
		//a.escrever_linha("Portugol Studio 1.1", endereco)
		//a.fechar_arquivo(endereco)
		
	}
	/* 
	 *  nosso sistema terá 9 funções
	 *  configurar o sistema
	 *  (data_atual, usuario, valor_produto, quantidade_produto, 
	 *  nome_produto, nome_cliente, tel_cliente,
	 *  recebido_cliente, opcao_pagamento)
	 *  
	 *  
	 */
	 funcao vazio configurar_sistema()
	 {
	 	inteiro confirma_data
		escreva("\nEsta é a função de configurar o sistema\n")
		escreva("Seja bem vindo, ",usuario, "!")
	 	escreva("\nQue ano estamos?\n")
	 	leia(ano_atual)
	 	escreva("Em que mês estamos?\n")
	 	leia(mes_atual)
	 	
	 	escreva("Em que dia estamos?\n")
	 	leia(dia_atual)
	 	escreva("Você configurou a data como:\t")
	 	escreva(dia_atual,"/",mes_atual,"/",ano_atual)
	 	escreva("\nA informação é correta?\t digite:\n1-Sim\t2-Não\n")
	 	leia(confirma_data)
	 	se(confirma_data==1)
		{
			menu_sistema()	
		}
	 	senao
	 	{
	 		escreva("Então vamos configurar novamente...")
	 		configurar_sistema()
	 	}
	 }

	 funcao vazio menu_sistema()
	 {
	 	inteiro opcao
	 	escreva("\nEscolha uma das opções a seguir:\n")
	 	escreva("1)Abrir o caixa\n2)Cadastrar produto\n3)Cadastrar cliente\n")
	 	escreva("4)Fazer uma venda\n5)Receber venda\n6)Sair do sistema\n")
	 	leia(opcao)
	 	escolha(opcao)
	 	{
	 		caso 1 : abrir_caixa()
	 		pare
	 		caso 2 : cadastrar_produto()
	 		pare
	 		caso 3 : cadastrar_cliente()
	 		pare
	 		caso 4 : cadastrar_venda()
	 		pare
	 		caso 5 : receber_venda()
	 		pare
	 		caso contrario :
	 			escreva("número inválido")
	 		pare
	 	}
	 }
	 funcao vazio abrir_caixa()
	 {
	 	inteiro confirma=0
	 	escreva("Vamos abrir o caixa\n")
	 	escreva("Digite a quantia em dinheiro:\n")
	 	leia(troco_inicial)
	 	escreva("Você abriu o caixa com R$", troco_inicial)
	 	escreva("\nConfirma?\n1Sim\t2)Não\n")
		leia(confirma)
		se(confirma==1)
		{
			escreva("\nCaixa aberto com sucesso!")
			menu_sistema()	
		}
	 	senao
	 	{
	 		abrir_caixa()
	 	}
	 	imprime_pontos()
	 }
	 funcao vazio cadastrar_produto()
	 {
	 	escreva("Olá, ",usuario)
	 	escreva("!\nCadastre o produto: \n")
	 	id_produto[prox_prod]=prox_prod
	 	cod_prod[prox_prod]=prox_prod
	 	nome_produto[prox_prod]=digita_cadeia("o nome: ")
	 	preco_produto[prox_prod]=digitar_real("o preço: ")
	 	qtd_produto[prox_prod]=digitar_real("a quantidade de produtos: ")
	 	escreva(cod_prod[prox_prod])
	 	prox_prod++
	 	imprime_pontos()
	 	menu_sistema()	
	 }
	 funcao vazio cadastrar_cliente()
	 {
	 	escreva("Cadastro de cliente: \n")
	 	pos_cliente[indice]=indice
	 	id_cliente[indice]=indice+1
	 	nome_cliente[indice]=digita_cadeia("o nome do cliente: ")
	 	rua_cliente[indice]=digita_cadeia("a rua: ")
		bairro_cliente[indice]=digita_cadeia("o bairro: ")
	 	nun_cliente[indice]=digita_inteiro("o número da casa: ")
	 	email_cliente[indice]=digita_cadeia("o email do cliente: ")
		tel_cliente[indice]=digita_inteiro("o telefone do cliente: ")
		escreva("\nCliente ", id_cliente[indice])
		escreva(" cadastrado com sucesso!")
	 	indice++
	 	imprime_pontos()
	 	menu_sistema()	
	 }
	 funcao vazio cadastrar_venda()
	 {
	 	inteiro codigo, qtd, opcao, i=0, venda[100]
	 	cadeia produtos[30]
	 	real valor_total, preco[30]
	 	
	 	escreva("Para cadastrar nova venda aperte 1, para sair aperte 2")
	 	leia(indice)
	 	enquanto(indice != 2)
	 	{
			escreva("Digite o código do produto:\n")
	 		leia(codigo)
	 		codigo=codigo-1
			se (codigo == cod_prod[codigo])
			{	
				escreva("\nProduto:\t",nome_produto[codigo])	
				escreva("\nQuantidade:\t")
				leia(qtd)
				valor_total= preco_produto[codigo]*qtd
				
				escreva("1-Continuar\t2-Finalizar\n")
				leia(opcao)
				escolha(opcao)
				{
					caso 1:
					escreva("Digite o código do produto:\n")
		 			leia(codigo)
		 			codigo=codigo-1
		 			escreva("\nProduto:\t",nome_produto[codigo])	
					escreva("\nQuantidade:\t")
					leia(qtd)
					valor_total= preco_produto[codigo]*qtd
					produtos[i]=nome_produto[codigo]
					preco[i]=preco_produto[codigo]*qtd
					i++
					pare
					caso 2:
					venda[indice]=indice
					escreva("-----Venda N° ",venda[indice],"-----\n\n")
					para (i=0; i<30 ;i++)
					{
						escreva(produtos[i],"\t",preco[i],"\n")
					}
					escreva("\nValor total:\t",valor_total)
					pare
					caso contrario:
					escreva("número inválido!\n")
					pare
				}
			}
			
				
		}
	 	
	 	/*
	 	 preciso saber o código do produto
	 	 preciso saber o codigo do cliente
		quantidade
		valor_compra = quantidade * vlr_unitario
		vetor chamado venda id_venda , cod_prod_venda, cod_do_cliente, vlr_venda, data_venda
	 	 */
	 	menu_sistema()
	 }
	 funcao vazio receber_venda()
	 {
	 	menu_sistema()
	 }
	 funcao vazio recibo_venda(cadeia nom_cliente, real vlr_compra, cadeia item_comprado)
	 {
	 	
	 }
	 funcao cadeia digita_cadeia(cadeia nome)
	 {
	 	cadeia nome_dig
	 	escreva("\nDigite ", nome)
	 	leia(nome_dig)
	 	retorne nome_dig
	 }
	 funcao real digitar_real(cadeia enviado)
	 {
	 	real valor
	 	escreva("\nDigite ", enviado)	
	 	leia(valor)
	 	retorne valor
	 }
	 funcao inteiro digita_inteiro(cadeia numero)
	 {
	 	inteiro nun_dig
	 	escreva("\nDigite ", numero)
	 	leia(nun_dig)
	 	retorne nun_dig
	 }
	 funcao vazio imprime_pontos()
	{
		inteiro contador=0
		para ( contador=0;contador<75;contador++)
		{
		escreva("-.")
		}
	}
	 
	 
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 71; 
 * @DOBRAMENTO-CODIGO = [29, 38, 72, 123];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */