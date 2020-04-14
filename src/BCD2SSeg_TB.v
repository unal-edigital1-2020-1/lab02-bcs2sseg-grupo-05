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
