module wrapper_192_tb();
reg clk;
reg	reset;
reg	enable;
wire checkOut;
wrapper_192 R(.clk(clk),.checkOut(checkOut));


always begin 
#5
clk=~clk;
end

initial begin
clk=0;
reset = 0;
enable = 0;

enable = 1;
#1000000
if(checkOut==1)
$display("Success , Correct Encryption and Dectyption");
else
$display("Failed , InCorrect Encryption and Dectyption");
//#(100000*10) $finish;


end
endmodule