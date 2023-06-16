module wrapper_tb();
reg clk;
reg	reset;
reg	enable;
wire checkOut;
wrapper R(.clk(clk),.checkOut(checkOut));


always begin 
#5
clk=~clk;
end

initial begin
clk=0;
reset = 0;
enable = 0;///

enable = 1;
#100000
if(checkOut==1)
$display("Success , Correct Encryption and Dectyption");
else
$display("Failed , InCorrect Encryption and Dectyption");
#(1000*10) $finish;


end
endmodule