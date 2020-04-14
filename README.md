# lab01- BCD2SSEG
laboratorio 01 simulación

En esta plantilla debe adicionar la documentación del laboratorio

* Johan Lenoardo Castellanos Ruiz
* Nombres y Apellidos Estudiante 2
* Nombres y Apellidos Estudiante 3

## BCD to 7Seg
Un decodificador de BCD a 7Seg es un elemento electronico el cual tiene la capacidad de transformar una entrada de cuaro cables en una salida de 7 (u 8 cables dependiendo si se quiere usar el punto decimal) los cuales encienden unos leds de tal forma que en el display se muestra un núnmero.
![7Seg](https://github.com/unal-edigital1-2020-1/lab02-bcs2sseg-grupo-05/blob/master/files/7Seg.jpg)
Para diseñar un decodificador BCD a 7Seg se obtubieron los siguientes archivos:

### Archivo de BCD a 7Seg 
``` verilog
//Archio de decodificador BCD a 7 Segnmentos
module BCDtoSSeg (BCD, SSeg, an);

	input [3:0] BCD;//Entradas de Cuatro Bits (BCD)
	output reg [0:6] SSeg;//Segistro de salida de 7 Bits (Para encender los leds 7 segmentos).
	output [3:0] an;//Salida de 4 bits

assign an=4'b1110;


always @ ( * ) begin
  case (BCD)	
	  //Valor en bits(correspondientes al número) representacion del 7seg.
	  4'b0000: SSeg = 7'b0000001; // "0"  
	  4'b0001: SSeg = 7'b1001111; // "1" 
	  4'b0010: SSeg = 7'b0010010; // "2" 
	  4'b0011: SSeg = 7'b0000110; // "3" 
	  4'b0100: SSeg = 7'b1001100; // "4" 
	  4'b0101: SSeg = 7'b0100100; // "5" 
	  4'b0110: SSeg = 7'b0100000; // "6" 
	  4'b0111: SSeg = 7'b0001111; // "7" 
	  4'b1000: SSeg = 7'b0000000; // "8" 
	  4'b1001: SSeg = 7'b0000100; // "9" 
	  //representacion de una letra en sistema binario de los valores del 10-16.
	  4'ha: SSeg = 7'b0001000;    // "A"
   	  4'hb: SSeg = 7'b1100000;    // "B"
	  4'hc: SSeg = 7'b0110001;    // "C"
	  4'hd: SSeg = 7'b1000010;    // "D"
	  4'he: SSeg = 7'b0110000;    // "E"
	  4'hf: SSeg = 7'b0111000;    // "F"
    default:
    SSeg = 0;
  endcase
end

endmodule
```
### Archivo de pruebas TestBench
Este es el archivo de pruebas el cual se define a si mismo como el archivo de pruebas para el decodificador.
``` verilog
`timescale 1ns / 1ps
//archivo de prueba para el decodificador BCD a 7 segentos

module BCDtoSSeg_TB;

	// Inputs define cables de entrada 4 Bits.
	reg [3:0] BCD;

	// Outputs define las salidas 7 Bits.
	wire [6:0] SSeg;

	// Instantiate the Unit Under Test (UUT) (se llama a si mismo como el archivo de prueba para el archivo del decodificador.
	BCDtoSSeg uut (
		.BCD(BCD), 
		.SSeg(SSeg)
	);

	initial begin
	//pruebas:
		BCD = 0; #10;
		BCD = 1; #10;
		BCD = 2; #10;
		BCD = 3; #10;
		BCD = 4; #10;
		BCD = 5; #10;
		BCD = 6; #10;
		BCD = 7; #10;
		BCD = 8; #10;
		BCD = 9; #10;

	end

   initial begin: TEST_CASE
     $dumpfile("BCDtoSSeg_TB.vcd");
     #(200) $finish;
   end

endmodule
```
### Archivo LabsLand
Dada la situación actual en el país (Aislamiento por emergencia sanitaria COVID-19) el profesor tomo la determinación de usar una plataforma para el uso remoto de FPGAs LabsLand :https://labsland.com/es.
En esta plataforma tenemos la posibilidad de usar FPGAs de manera remota las cuales se encuentran en diferentes lugares del mundo la unica diferencia es que las FPGAs en la plataforma son FPGAs de intel con sus diferencias marcadas con respecto a las trabajadas que son de la empresa XILINX.
Una de estas es que los 7Segs presentes en estas son de anodo común por lo que fue necesario modificar el codigo para el correcto funcionamiento de estas. pero en su estructura basica el codigo es el mismo.
``` verilog
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
```
