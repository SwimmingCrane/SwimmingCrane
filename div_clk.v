`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/08/25 17:12:47
// Design Name: 
// Module Name: div_clk
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module div_clk(
input wire clk,
input wire [25:0] count_control,
output reg div_clk
    );
    
    reg [31:0] count;
    reg temp_clk;
    
    initial begin
    count=0;
    temp_clk=0;
    end
    
    always @ (posedge clk)
    begin
    if(count==count_control)
      begin
        temp_clk<=~temp_clk;
        count<=0;
      end
    else
      count<=count+1;
      div_clk<=temp_clk;
    end
    
endmodule
