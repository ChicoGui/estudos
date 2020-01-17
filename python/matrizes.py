
# função para criar matriz
def cria_matriz(qtdLInha, qtdColuna):
	matriz = []
	for l in range(qtdLInha):
		matriz.append([])
		for c in range(qtdColuna):
			termo = float(input("Digite um valor real: "))
			matriz[l].append(termo)
	return matriz

# função para somar linha e coluna
def soma(matriz, qtdLInha, qtdColuna):
	somaLinha = []
	somaColuna = []
	for i in range(qtdLInha):
		soma = 0
		for j in range(qtdColuna):
			soma = soma + matriz[i][j]
		somaLinha.append(soma)

	for a in range(qtdColuna):
		soma = 0
		for b in range(len(matriz)):
			soma = soma + matriz[b][a]
		somaColuna.append(soma)	
		
	return somaLinha, somaColuna

#função pra gerar a matriz transposta
def transposta(matriz, qtdLInha, qtdColuna):
	matriz_transposta = []
	
	for c in range(len(matriz[0])):
		linha=[]

		for d in range(qtdLInha):
			linha.append(matriz[d][c])

		matriz_transposta.append(linha)
	
	return matriz_transposta

#função para imprimir a matriz
def imprimeMatriz(matriz, qtdLInha, qtdColuna):
	for i in range(qtdLInha):
		for j in range(qtdColuna):
			print("%.2f\t" % (matriz[i][j]),end='')
		print()
		
#função para determinar se a matriz é quadrada ou não 
def matriz_quadrada(matriz, qtdLInha, qtdColuna):
	quadrada = False
	if qtdLInha == qtdColuna:
		quadrada = True
	return quadrada

#função para determinar se a matriz é identidade ou não
def matriz_identidade(matriz, qtdLInha, qtdColuna):
	identidade = True
	if matriz_quadrada(matriz, qtdLInha, qtdColuna):
		for i in range(qtdLInha):			
			for j in range(qtdLInha):
				if (i == j and matriz[i][j] != 1):
					identidade = False
				elif (i != j and matriz[i][j] != 0):
					identidade = False
	else:
		identidade = False	

	return identidade

#função para a soma da diagonal principal 
def soma_diagonal_principal(matriz, qtdLInha, qtdColuna):
	if matriz_quadrada(matriz, qtdLInha, qtdColuna):
		soma = 0
		for x in range(qtdLInha):
			for y in range(qtdColuna):
				if x == y:
					soma = soma + matriz[x][y]
		return soma
	else:
		return 0

#função para a soma da diagonal secundaria		
def soma_diagonal_secundaria(matriz, qtdLInha, qtdColuna):
	if matriz_quadrada(matriz, qtdLInha, qtdColuna):
		soma = 0
		for w in range(qtdLInha):
			for z in range(qtdColuna):
				if w + z == qtdLInha - 1:
					soma = soma + matriz[w][z]
		return soma
	else:
		return 0

#função para a soma da matriz triangular inferior
def soma_matriz_triangular_inferior(matriz, qtdLInha, qtdColuna):
	if matriz_quadrada(matriz, qtdLInha, qtdColuna):
		soma = 0
		for f in range(qtdLInha):
			for g in range(qtdColuna):
				if f > g:
					soma = soma + matriz[f][g]
		return soma
	else:
		return 0
		
def main():	
	linha = int(input("digite a quantidade de linhas: ")) 
	coluna = int(input("digite a quantidade de colunas: ")) 

	novaMatriz = cria_matriz(linha, coluna) 
	
	somaLinha, somaColuna = soma(novaMatriz, linha, coluna)

	
	novaMatriz_transposta = transposta(novaMatriz, linha, coluna)
	print("\n------------- MATRIZ -------------")	
	imprimeMatriz(novaMatriz, linha, coluna)


	print("\n------------- SOMA LINHA -------------")
	print(somaLinha) 
	
	print("\n------------- SOMA COLUNA -------------")
	print(somaColuna)
	
	print("\n------------- MATRIZ TRANSPOSTA -------------")
	imprimeMatriz(novaMatriz_transposta, linha, coluna)
	print("-------------")
	matriz_quadrada(novaMatriz, linha, coluna) 
	if matriz_quadrada(novaMatriz, linha, coluna): 
		print("A matriz é quadrada")
	else:
		print("Não é uma matriz quadrada")
	print("\n------------- ")
	matriz_identidade(novaMatriz, linha, coluna)
	if matriz_identidade(novaMatriz, linha, coluna): 
		print("É uma matriz identidade") 
	else:
		print("Não é uma matriz identidade")
		
	soma_diagonal_1 = soma_diagonal_principal(novaMatriz, linha, coluna) 
	print("\n------------- SOMA MATRIZ DIAGONAL PRINCIPAL -------------")
	print (soma_diagonal_1) 

	
	soma_diagonal_2 = soma_diagonal_secundaria(novaMatriz, linha, coluna) 	
	print("\n------------- SOMA MATRIZ DIAGONAL SECUNDARIA -------------")
	print (soma_diagonal_2)
	
	soma_matriz_triangular = soma_matriz_triangular_inferior(novaMatriz, linha, coluna) 
	print("\n------------- SOMA MATRIZ TRIANGULAR INFERIOR -------------")
	print (soma_matriz_triangular)




if __name__ == '__main__':
    main()

