//Uso das portas lógicas para realizar um conta_votos
//Fiz a tabela verdade para cada uma das saídas e tracei as expressões lógicas dos resultados
// Disciplina de Lógica Digital
//Aluna: Amanda Sousa Gonçalves
//OBS.: Para uso dos módulos, há um "link" para o arquivo (com os módulos) na pasta. 
`timescale 1 ns / 10 ps

module conta_votos (
    input  logic [2:0] V,  // entrada com 3 bits
    output logic [3:0] R   // saída com 4 bits
);


    // Aqui, teremos os bits intermediários utilizados
    	wire vnot0;
	wire vnot1;
	wire vnot2;
	wire a;
	wire b;
	wire c;
	wire d;
	wire e;
	wire f;

  // Instanciação dos módulos de negação que serão utilizados:
	INVX1HVT inv1 (.A(V[2]), .Y(vnot2));
	INVX1HVT inv2 (.A(V[1]), .Y(vnot1));
	INVX1HVT inv3 (.A(V[0]), .Y(vnot0));
  //Instanciação das portas AND e OR (para a saída de R[2]);
	AND3XLHVT anda (.A(vnot2), .B(V[1]), .C(V[0]), .Y(a));
	AND3XLHVT andb (.A(V[2]), .B(vnot1), .C(V[0]), .Y(b));
	AND3XLHVT andc (.A(V[2]), .B(V[1]), .C(vnot0), .Y(c));
	OR3X1HVT orr2 (.A(a), .B(b), .C(c), .Y(R[2]));
 //Instanciação das portas AND e OR (para a saída de R[1]);
	AND3XLHVT andd (.A(vnot2), .B(vnot1), .C(V[0]), .Y(d));
	AND3XLHVT ande (.A(vnot2), .B(V[1]), .C(vnot0), .Y(e));
	AND3XLHVT andf (.A(V[2]), .B(vnot1), .C(vnot0), .Y(f));
	OR3X1HVT orr3 (.A(d), .B(e), .C(f), .Y(R[1]));
//Instanciação das portas AND e NAND (para as saídas R[3] e R[0].
	AND3XLHVT andr3 (.A(V[2]), .B(V[1]), .C(V[0]), .Y(R[3]));
	NOR3XLHVT norr0 (.A(V[2]), .B(V[1]), .C(V[0]), .Y(R[0]));
endmodule

