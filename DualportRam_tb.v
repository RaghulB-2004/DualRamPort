module DualportRam_tb;
reg clk;
  reg [3:0] addr_portA;
  reg [3:0] addr_portB;
  reg [7:0] wr_enb_portA;
  reg [7:0] wr_enb_portB;
  reg [7:0] data_in_portA;
  reg [7:0] data_in_portB;
  wire [7:0] data_out_portA;
  wire [7:0] data_out_portB;

  
  DualportRam_rtl dut (
    .clk(clk),
    .wr_enb_portA(wr_enb_portA),
    .wr_enb_portB(wr_enb_portB),
    .addr_portA(addr_portA),
    .addr_portB(addr_portB),
    .data_in_portA(data_in_portA),
    .data_in_portB(data_in_portB),
    .data_out_portA(data_out_portA),
    .data_out_portB(data_out_portB)
  );

  
  initial begin
    clk = 0;
    forever #5 clk = ~clk; 
  end

  initial begin
   
    addr_portA = 0;
    addr_portB = 0;
    wr_enb_portA = 0;
    wr_enb_portB = 0;
    data_in_portA = 0;
    data_in_portB = 0;
    
    addr_portA = 4'h4;
    #5;
    data_in_portA = 8'hCC;
    #5;
    wr_enb_portA = 1;
    #5;
    addr_portB = 4'h5;
    #5;
    data_in_portB = 8'hDD;
    #5;
    wr_enb_portB = 1;
    #5;
    wr_enb_portA = 0;
    #5;
    wr_enb_portB = 0;
    #5;
   
    addr_portA = 4'h2;
    #5;
    data_in_portA = 8'hAA;
    #5;
    wr_enb_portA = 1;
    #5;
    addr_portB = 4'h3;
    #5;
    data_in_portB = 8'hEE;
    #5;
    wr_enb_portB = 1;
    #5;
    wr_enb_portA = 0;
    #5;
    wr_enb_portB = 0;
    #5;
    addr_portA = 4'h6;
    #5;
    addr_portA = 4'hFF;
    #5;
    $stop;
  end
endmodule
