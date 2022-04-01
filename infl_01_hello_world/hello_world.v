`timescale 1ns/1ps  //time unit / time precision
module hello_world;
initial begin
	$display(“\nHello World!\n”);
	$finish;
end
endmodule
