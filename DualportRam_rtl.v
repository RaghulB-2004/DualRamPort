module DualportRam_rtl(clk,wr_enb_portA,wr_enb_portB,addr_portA,addr_portB,data_in_portA,data_in_portB,data_out_portA,data_out_portB);
input clk;
input [3:0] addr_portA;
input [3:0] addr_portB;
input [7:0] wr_enb_portA;
input [7:0] wr_enb_portB;
input [7:0] data_in_portA;
input [7:0] data_in_portB;
output reg [7:0] data_out_portA;
output  reg [7:0] data_out_portB;
reg[7:0]mem[15:0]; 
initial
begin
data_out_portA=0;
data_out_portB=0;

end
always@(posedge clk)begin
if ( wr_enb_portA) begin
mem[addr_portA] <= data_in_portA; 
end
else begin 
data_out_portA <= mem[addr_portA]; 
end 
end 
always@(posedge clk)begin
if (wr_enb_portB) begin
mem[addr_portB] <= data_in_portB; 
end
else begin 
data_out_portB <= mem[addr_portB];  
end
 end 
endmodule
