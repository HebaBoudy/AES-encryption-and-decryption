module ShiftRows
(
 input  [0:127] state,
 output wire [0:127] newstate
);

assign newstate[0:7] = state [0:7];
assign newstate[32:39] = state [32:39];
assign newstate[64:71] = state [64:71];
assign newstate[96:103] = state [96:103];

assign newstate[8:15] = state [40:47];
assign newstate[40:47] = state [72:79];
assign newstate[72:79] = state [104:111];
assign newstate[104:111] = state [8:15];

assign newstate[16:23] = state [80:87];
assign newstate[48:55] = state [112:119];
assign newstate[80:87] = state [16:23];
assign newstate[112:119] = state [48:55];

assign newstate[24:31] = state [120:127];
assign newstate[56:63] = state [24:31];
assign newstate[88:95] = state [56:63];
assign newstate[120:127] = state [88:95];




endmodule 