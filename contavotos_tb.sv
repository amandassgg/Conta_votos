//Uso das portas lógicas para realizar um conta_votos
// Disciplina de Lógica Digital
//Aluna: Amanda Sousa Gonçalves
//OBS.: Para uso dos módulos, há um "link" para o arquivo (com os módulos) na pasta. 
`timescale  1 ns / 10 ps
module tb;
 
  logic [3:0] R;  
  logic [2:0] V;        
  
  // Instanciando 
  conta_votos AMANDA (
    .R(R),
    .V(V)
  );

//estímulos
initial
begin
  V[2] = 1'b0;
  V[1] = 1'b0;
  V[0] = 1'b0;

  #5
  V[2] = 1'b0;
  V[1] = 1'b0;
  V[0] = 1'b1;    

  #5
  V[2] = 1'b0;
  V[1] = 1'b1;
  V[0] = 1'b0;
  
  #5
  V[2] = 1'b0;
  V[1] = 1'b1;
  V[0] = 1'b1;

  #5
  V[2] = 1'b1;
  V[1] = 1'b0;
  V[0] = 1'b0;

  #5
  V[2] = 1'b1;
  V[1] = 1'b0;
  V[0] = 1'b1;
  
  #5
  V[2] = 1'b1;
  V[1] = 1'b1;
  V[0] = 1'b0;

  #5
  V[2] = 1'b1;
  V[1] = 1'b1;
  V[0] = 1'b1;

  #5
  V[2] = 1'b0;
  V[1] = 1'b0;
  V[0] = 1'b0;

end


initial
begin
  $display("                Tempo         Entrada       Saídas");
  $display("                         	  V            R");
  $display("                .....      ...............   .....");
  $monitor($time,"             %b         %b", V, R);
end

endmodule

