module convolution_alu #(
    parameter WIDTH = 16
)(
    input  logic              clk,
    input  logic              rst_n,
    input  signed [WIDTH-1:0] op_a,
    input  signed [WIDTH-1:0] op_b,
    input  signed [2*WIDTH-1:0] op_c,
    input  logic [1:0]        opcode,
    input  logic              scan_en,
    output logic signed [2*WIDTH-1:0] alu_out,
    output logic                      err_detect
);
    // הלוגיקה נשארת זהה
    logic signed [2*WIDTH-1:0] next_res;

    always_comb begin
        err_detect = 1'b0;
        case (opcode)
            2'b00: next_res = op_a + op_b + op_c; 
            2'b01: next_res = (op_a * op_b) + op_c;
            default: begin
                next_res = '0;
                err_detect = 1'b1;
            end
        endcase
    end

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) alu_out <= '0;
        else if (!scan_en) alu_out <= next_res;
    end
endmodule