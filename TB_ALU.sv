`timescale 1ns/1ps

module tb_alu;
    logic clk = 0;
    logic rst_n;
    logic signed [15:0] a, b;
    logic signed [31:0] c, out;
    logic [1:0] opcode;
    logic scan_en = 0;

    // יצירת שעון: מחזור של 10ns
    always #5 clk = ~clk;

    convolution_alu #(16) dut (
        .clk(clk), .rst_n(rst_n),
        .op_a(a), .op_b(b), .op_c(c),
        .opcode(opcode), .scan_en(scan_en),
        .alu_out(out), .err_detect()
    );

    initial begin
        $dumpfile("alu_waves.vcd");
        $dumpvars(0, tb_alu);
        
        // Reset System
        rst_n = 0; a = 0; b = 0; c = 0; opcode = 2'b01; // MAC state
        #15 rst_n = 1;

        //First step
        @(posedge clk);
        a = 16'd3; b = 16'd2; c = 32'd0; 
        
        // Second step
        @(posedge clk);
        a = 16'd4; b = 16'd5; c = out; // כאן קורה הקסם: לוקחים את התוצאה הקודמת
        
        // Third step
        @(posedge clk);
        a = 16'd10; b = 16'd1; c = out; 

        #20;
        $display("Final Convolution Result: %d", out);
        $finish;
    end
endmodule