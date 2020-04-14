module bcd2sseg (V_SW, G_HEX0);
// Archivo de prueba usado para LabsLand dado a que usan una FPGA diferente
	//su sistema exige ciertos cambios como la definicion de las entradas y salidas
   input wire [3:0] V_SW;
   output wire [6:0] G_HEX0;

    reg [6:0] SSeg;
    wire [3:0]  BCD;
    // asigna el nombre de las entradas y salidas al nmbre correspondiente de los cables en el archivo de la FPGA.
    assign BCD =V_SW;
    assign G_HEX0 = SSeg;


always @ ( * ) begin
  case (BCD)
// se cambiaron(se invirtieron) los numeros binaros con respecto al primer archivo
// dado que el 7Seg en este es anodo común se mostraban los numeros y las letras al reves.
    	4'b0000: SSeg = 7'b1000000; // "0"  
	4'b0001: SSeg = 7'b1111001; // "1" 
	4'b0010: SSeg = 7'b0100100; // "2" 
	4'b0011: SSeg = 7'b0110000; // "3" 
	4'b0100: SSeg = 7'b0011001; // "4" 
	4'b0101: SSeg = 7'b0010010; // "5" 
	4'b0110: SSeg = 7'b0000010; // "6" 
	4'b0111: SSeg = 7'b1111000; // "7" 
	4'b1000: SSeg = 7'b0000000; // "8"  
	4'b1001: SSeg = 7'b0011000; // "9" 
   4'ha: SSeg = 7'b0001000;  
   4'hb: SSeg = 7'b0000011;
   4'hc: SSeg = 7'b0100111;
   4'hd: SSeg = 7'b0100001;
   4'he: SSeg = 7'b0000100;
   4'hf: SSeg = 7'b0001110;
    default:
    SSeg = 0;
  endcase
end

endmodule
