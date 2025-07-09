// Code your testbench here
// or browse Examples
module tb_sync_ram;
  reg clk;
  reg we;
  reg [2:0] addr;
  reg [7:0] din;
  wire [7:0] dout;
  
  sync_ram uut ( 
    .clk(clk),
    .we(we),
    .addr(addr),
    .din(din),
    .dout(dout)
  );
  always #5 clk = ~clk;
    initial begin
      $monitor("Time = %0t | WE = %b | Addr = %d | DIN = %h | DOUT = %h", $time, we, addr, din, dout);
      $dumpfile("sync_ram.vcd");
      $dumpvars;
      clk = 0;
      we = 1;
      addr = 3'b000; din = 8'hAA; #10;
      addr = 3'b001; din = 8'h55; #10;
      addr = 3'b010; din = 8'hF0; #10;
      we = 0;
      addr = 3'b000; #10;
      addr = 3'b001; #10;
      addr = 3'b010; #10;
      $finish;
    end 
endmodule