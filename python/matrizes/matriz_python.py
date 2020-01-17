
def cria_matriz(qtdLInha, qtdColuna):
	matriz = []
	for l in range(qtdLInha):
		matriz.append([])
		for c in range(qtdColuna):
			termo = float(input("Digite um valor real: "))
			matriz[l].append(termo)
	return matriz

def soma(matriz):
	somaLinha = []
	somaColuna = []
	for i in range(len(matriz)):
		soma = 0
		for j in range(len(matriz[i])):
			soma = soma + matriz[i][j]
		somaLinha.append(soma)

	for a in range(len(matriz[0])):
		soma = 0
		for b in range(len(matriz)):
			soma = soma + matriz[b][a]
		somaColuna.append(soma)	
		
	return somaLinha, somaColuna

def transposta(matriz):
	matriz_transposta = []
	
	for c in range(len(matriz[0])):
		linha=[]

		for d in range(len(matriz)):
			linha.append(matriz[d][c])

		matriz_transposta.append(linha)
	
	return matriz_transposta

def imprimeMatriz(matriz):
	for i in range(len(matriz)):
		print(matriz[i])

def matriz_quadrada(matriz):
	quadrada = False
	if len(matriz) == len(matriz[0]):
		quadrada = True
	return quadrada

def matriz_identidade(matriz):
	identidade = True
	if matriz_quadrada(matriz):
		for i in range(len(matriz)):			
			for j in range(len(matriz)):
				if (i == j and matriz[i][j] != 1):
					identidade = False
				elif (i != j and matriz[i][j] != 0):
					identidade = False
	else:
		identidade = False	

	return identidade



def main():
	linha = int(input("digite a quantidade de linhas: "))
	coluna = int(input("digite a quantidade de colunas: "))

	novaMatriz = cria_matriz(linha, coluna)
	print(novaMatriz)
	print("-------------")
	somaLinha, somaColuna = soma(novaMatriz)
	print(somaLinha)
	print(somaColuna)
	novaMatriz_transposta = transposta(novaMatriz)
	print(novaMatriz_transposta)
	print("-------------")
	imprimeMatriz(novaMatriz)
	print("-------------")
	matriz_quadrada(novaMatriz)
	if matriz_quadrada(novaMatriz):
		print("A matriz é quadrada")
	else:
		print("Não é uma matriz quadrada")
	print("-------------")
	matriz_identidade(novaMatriz)
	if matriz_identidade(novaMatriz):
		print("é uma matriz identidade")
	else:
		print("não é uma matriz identidade")



if __name__ == '__main__':
    main()

