`timescale 1ns / 1ps

module regfile(
    input wire clk, reset,
    input wire regwrite,         //if we want to write_data to reg, this is 1, and rd tells us which reg to write to
    input wire [4:0] rs,              //rs, source reg
    input wire [4:0] rt,              //rt, target reg
    input wire [4:0] rd,              //rd, destination reg
    input wire [31:0] writedata,
    output reg [31:0] A_readdat1,    //value from source reg
    output reg [31:0] B_readdat2     //value from target reg
);

    //COMPLETE
    //Create an internal regfile called REG that's 32 bit wide regs with 32 addr
    // internal register file: 32 registers, each 32 bits wide
    reg [31:0] REG [0:31];
    integer i;
    
    initial begin
        for (i = 0; i < 32; i = i + 1)
            begin
                REG[i] = 32'b0;
            end
        //$readmemh({"/regData.mem"}, REG);
        REG[0] = 'h002300AA;    //$zero
        REG[1] = 'h10654321;    //$v0
        REG[2] = 'h00100022;    //$v1
        REG[3] = 'h8C123456;
        REG[4] = 'h8F123456;
        REG[5] = 'hAD654321;
        REG[6] = 'h00000066;
        REG[7] = 'h13012345;
        REG[8] = 'hAC654321;
        REG[9] = 'h12012345;
        
        
        A_readdat1 = 32'b0;
        B_readdat2 = 32'b0;
    end
    
    always @(posedge clk) begin
        if (reset) begin
            A_readdat1 <= 32'b0;
            B_readdat2 <= 32'b0;
        end
        else begin
            if (regwrite) begin
                REG[rd] <= writedata;
            end

            A_readdat1 <= REG[rs];
            B_readdat2 <= REG[rt];
        end
    end
        
endmodule
