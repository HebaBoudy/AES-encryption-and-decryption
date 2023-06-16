module InverseMixColumns(stateIn,stateOut);
input [127:0] stateIn;
output[127:0] stateOut;

function [7:0] nMultiplyBy2(input [7:0] original,input integer n); //multiplying by 02 n-times
	integer i;
	begin
		for(i=0;i<n;i=i+1) begin
			if(original[7]==1)
			original = ((original<<1)^8'h1b);
		else
			original=(original<<1);
	end
	nMultiplyBy2=original;
end
endfunction

function [7:0] multiplyBy0e;//2*3 ^ 2*2 ^ 2*1 = 8+4+2 = 14 = e
	input [7:0] original;
	begin
		multiplyBy0e = nMultiplyBy2(original,3) ^ nMultiplyBy2(original,2) ^ nMultiplyBy2(original,1);
	end
endfunction 


function [7:0] multiplyBy0d;//2*3 ^ 2*2 ^ 1 = 8+4+1 = 13 = d
	input [7:0] original;
	begin
		multiplyBy0d = nMultiplyBy2(original,3) ^ nMultiplyBy2(original,2) ^ original;
	end
endfunction 


function [7:0] multiplyBy0b;//2*3 ^ 2*1 ^ 1 = 8+2+1 = 11 = b
	input [7:0] original;
	begin
		multiplyBy0b = nMultiplyBy2(original,3) ^ nMultiplyBy2(original,1) ^ original;
	end
endfunction 


function [7:0] multiplyBy09;//2*3 ^ 1 = 8+1 = 9
	input [7:0] original;
	begin
		multiplyBy09 = nMultiplyBy2(original,3) ^ original;
	end
endfunction 


//i=0
	assign stateOut[31:24]= multiplyBy0e(stateIn[31:24]) ^ multiplyBy0b(stateIn[23:16]) ^ multiplyBy0d(stateIn[15:8]) ^ multiplyBy09(stateIn[7:0]);
	assign stateOut[23:16]= multiplyBy09(stateIn[31:24]) ^ multiplyBy0e(stateIn[23:16]) ^ multiplyBy0b(stateIn[15:8]) ^ multiplyBy0d(stateIn[7:0]);
	assign stateOut[15:8]= multiplyBy0d(stateIn[31:24]) ^ multiplyBy09(stateIn[23:16]) ^ multiplyBy0e(stateIn[15:8]) ^ multiplyBy0b(stateIn[7:0]);
	assign stateOut[7:0]= multiplyBy0b(stateIn[31:24]) ^ multiplyBy0d(stateIn[23:16]) ^ multiplyBy09(stateIn[15:8]) ^ multiplyBy0e(stateIn[7:0]);


//i=1
	assign stateOut[63:56]= multiplyBy0e(stateIn[63:56]) ^ multiplyBy0b(stateIn[55:48]) ^ multiplyBy0d(stateIn[47:40]) ^ multiplyBy09(stateIn[39:32]);
	assign stateOut[55:48]= multiplyBy09(stateIn[63:56]) ^ multiplyBy0e(stateIn[55:48]) ^ multiplyBy0b(stateIn[47:40]) ^ multiplyBy0d(stateIn[39:32]);
	assign stateOut[47:40]= multiplyBy0d(stateIn[63:56]) ^ multiplyBy09(stateIn[55:48]) ^ multiplyBy0e(stateIn[47:40]) ^ multiplyBy0b(stateIn[39:32]);
	assign stateOut[39:32]= multiplyBy0b(stateIn[63:56]) ^ multiplyBy0d(stateIn[55:48]) ^ multiplyBy09(stateIn[47:40]) ^ multiplyBy0e(stateIn[39:32]);

//i=2
	assign stateOut[95:88]= multiplyBy0e(stateIn[95:88]) ^ multiplyBy0b(stateIn[87:80]) ^ multiplyBy0d(stateIn[79:72]) ^ multiplyBy09(stateIn[71:64]);
	assign stateOut[87:80]= multiplyBy09(stateIn[95:88]) ^ multiplyBy0e(stateIn[87:80]) ^ multiplyBy0b(stateIn[79:72]) ^ multiplyBy0d(stateIn[71:64]);
	assign stateOut[79:72]= multiplyBy0d(stateIn[95:88]) ^ multiplyBy09(stateIn[87:80]) ^ multiplyBy0e(stateIn[79:72]) ^ multiplyBy0b(stateIn[71:64]);
	assign stateOut[71:64]= multiplyBy0b(stateIn[95:88]) ^ multiplyBy0d(stateIn[87:80]) ^ multiplyBy09(stateIn[79:72]) ^ multiplyBy0e(stateIn[71:64]);

//i=3
	assign stateOut[127:120]= multiplyBy0e(stateIn[127:120]) ^ multiplyBy0b(stateIn[119:112]) ^ multiplyBy0d(stateIn[111:104]) ^ multiplyBy09(stateIn[103:96]);
	assign stateOut[119:112]= multiplyBy09(stateIn[127:120]) ^ multiplyBy0e(stateIn[119:112]) ^ multiplyBy0b(stateIn[111:104]) ^ multiplyBy0d(stateIn[103:96]);
	assign stateOut[111:104]= multiplyBy0d(stateIn[127:120]) ^ multiplyBy09(stateIn[119:112]) ^ multiplyBy0e(stateIn[111:104]) ^ multiplyBy0b(stateIn[103:96]);
	assign stateOut[103:96]= multiplyBy0b(stateIn[127:120]) ^ multiplyBy0d(stateIn[119:112]) ^ multiplyBy09(stateIn[111:104]) ^ multiplyBy0e(stateIn[103:96]);


	

endmodule 