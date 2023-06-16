module InvShiftRows
(
 input  [0:127] state,
 output wire [0:127] original
);

assign original[0:7] = state [0:7];
assign original[32:39] = state [32:39];
assign original[64:71] = state [64:71];
assign original[96:103] = state [96:103];

assign original[8:15] = state [104:111];
assign original[40:47] = state [8:15];
assign original[72:79] = state [40:47];
assign original[104:111] = state [72:79];

assign original[16:23] = state [80:87];
assign original[48:55] = state [112:119];
assign original[80:87] = state [16:23];
assign original[112:119] = state [48:55];

assign original[24:31] = state [56:63];
assign original[56:63] = state [88:95];
assign original[88:95] = state [120:127];
assign original[120:127] = state [24:31];




endmodule 