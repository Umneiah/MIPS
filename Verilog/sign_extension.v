module sign_extention(immediate_in,immediate_out);
input [15:0] immediate_in;
output reg [31:0]immediate_out;
always @ (immediate_in)
begin
#10 immediate_out[31:0] = {{16{immediate_in[15]}} , immediate_in[15:0]};
end
endmodule 

