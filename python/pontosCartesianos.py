
def main():
	xa = 0.0; ya = 0.0; xb = 0.0; yb = 0.0; distancia = 0.0
	
	xa = float(input("Digite o x do ponto a: "))
	ya = float(input("Digite o y do ponto a: "))
	xb = float(input("Digite o x do ponto b: "))
	yb = float(input("Digite o y do ponto b: "))
	
	while xa != 0 or xb != 0 or ya != 0 or yb != 0:
		
		distancia = ((xb-xa)**2 + (yb - ya)**2)**0.5	
	
		print("xa = %.2f xb = %.2f ya = %.2f yb = %.2f distancia = %.2f" % (xa, ya, xb, yb, distancia))
		
		xa = float(input("Digite o x do ponto a: "))
		ya = float(input("Digite o y do ponto a: "))
		xb = float(input("Digite o x do ponto b: "))
		yb = float(input("Digite o y do ponto b: "))
	
	
	
	
	

if __name__ == '__main__':
    main()
