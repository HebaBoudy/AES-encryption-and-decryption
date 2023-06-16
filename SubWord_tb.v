module SubWord_tb();
reg [31:0]In ;
wire [31:0]Out ;

SubWord s (.DataIn(In),.DataOut(Out));
initial 
begin
$monitor(" %h	\t%h",In,Out);
#10;
In='h00112233;//
#10;
In='hA9642310;
#10;
end
endmodule
