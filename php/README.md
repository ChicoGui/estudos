# PHP
## anotações, referências

Linguagem de proramação para criar sites/aplicações web dinâmicas.

* variáveis:
  
  Utiliza-se o sinal de cifrão para criar uma variável que pode armazenar textos e números. PHP é case sensitive, então A é diferente de a.
  - Não inicie o nome de uma variável com números;
  - Não utilize espaços em brancos;
  - Não utilize caracteres especiais, somente underline;
  - Crie variáveis com nomes que ajudarão a identificar melhor a mesma;
  - Evite utilizar letras maiúsculas.
  
* tipos de variáveis:
  - Booleanos: simples, pois só pode expressar apenas dois valores: TRUE (1) ou FALSE (0, null ou uma string vazia);
  - Integer: número inteiro negativo ou positivo;
  - Float ou double: números reais representados com um ponto para separar casas decimais;
  - Strings: palavra ou frase entre aspas simples ou duplas, assim como também pode ser binário, como o conteúdo de um arquivo MP3 ou JPG. 

* conversão de tipos:
 '''
	 <?php
	  $var = 100;
	  $type_casting = (bool) $var; // torna – se booleano
	  $type_casting = (int) $var; // torna – se inteiro
	  $type_casting = (float) $var; // torna – se float
	  $type_casting = (string) $var; // torna – se string
	  $type_casting = (array) $var; // torna – se array
	  echo $type_casting = (bool)$var; // 1
	?>
 '''

* constantes:

  O valor de uma constante jamais poderá ser alterado enquanto estiver sendo executada e para defini-la utilizamos a função define() ou const.
  
* arrays:
 
  Um array que mantém uma série de elementos que podem ter diferentes tipos.

* classe: 

  modelo para representar algo no mundo real.
  
* encapsulamento: 

  o objeto é capaz de carregar consigo não só dados, mas também funcionalidades.
  
* operadores:
  - $a == $b - igual;
  - $a === $b - idêntico e mesmo tipo;
  - $a != $b ou $a <> $b - diferente;
  - $a !== $b - não idêntico;
  - $a < $b - menor;
  - $a > $b - maior;
  - $a <= $b - menor ou igual;
  - $a >= $b - maior ou igual;


