`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/28 20:49:46
// Design Name: 
// Module Name: SwitchLed
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


module SwitchLed(
    input clk,
//    input rst,
    input [1:0] sw,
    output reg led
    );
    
    wire div_clk;//ÉÁË¸Ê±ÖÓ
    reg [1:0] cur_st;
    reg [1:0] nxt_st;
    parameter [1:0] S0=2'b00;
    parameter [1:0] S1=2'b01;
    parameter [1:0] S2=2'b10;
    parameter [1:0] S3=2'b11;
    
    div_clk div1(
    .clk(clk),
    .count_control(25_000_000),
    .div_clk(div_clk)
    );
    
    //Âß¼­×´Ì¬×ª»»
    always @ (posedge clk) begin
        cur_st<=nxt_st;
    end
    //ÏÂÒ»×´Ì¬
    always @(*) begin
         case(sw)
            S0:  nxt_st=S0; 
            S1:  nxt_st=S1; 
            S2:  nxt_st=S2; 
            S3:  nxt_st=S3; 
            default: nxt_st=S0;
        endcase
    end
    //Êä³ö
    always @(posedge clk) begin
        case(cur_st)
            S0:  led<=0;
            S1:  led<=1;
            S2:  led<=1;
            S3:  led<=div_clk;
            default: led<=0;
        endcase
    end
endmodule
