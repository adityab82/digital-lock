module lab3(input [9:0] SW, input [3:0] KEY,
            output [6:0] HEX0, output [6:0] HEX1, output [6:0] HEX2,
            output [6:0] HEX3, output [6:0] HEX4, output [6:0] HEX5,
            output [9:0] LEDR);
    wire clk = ~KEY[0]; // this is your clock
    wire rst_n = KEY[3]; // this is your reset; your reset should be synchronous and active-low
    reg [6:0] hex0;
    reg [6:0] hex1;
    reg [6:0] hex2;
    reg [6:0] hex3; 
    reg [6:0] hex4; 
    reg [6:0] hex5; 

    assign HEX0 = hex0;
    assign HEX1 = hex1;
    assign HEX2 = hex2;
    assign HEX3 = hex3;
    assign HEX4 = hex4;
    assign HEX5 = hex5;

    // YOUR SOLUTION HERE
    enum reg [3:0] {
        initial_state = 4'b0000,
	    correct_1 = 4'b0001,
        correct_2 = 4'b0010,
        correct_3 = 4'b0011,
        correct_4 = 4'b0100,
        correct_5 = 4'b0101,
        open = 4'b0110,
        wrong_1 = 4'b0111,
        wrong_2 = 4'b1000,
        wrong_3 = 4'b1001,
        wrong_4 = 4'b1010,
        wrong_5 = 4'b1011,
        closed = 4'b1100} state;
        //open_print = 4'b1101,
        //closed_print = 4'b1110

    always_ff @(posedge clk) begin
        if (~rst_n) begin
            state <= initial_state;

        end else begin
            case (state)
                initial_state: if (SW == 10'b0000000010) begin
                    state <= correct_1; 
                end else begin
                    state <= wrong_1;
                end

                correct_1: if (SW == 10'b0000001000) begin
                    state <= correct_2; 
                end else begin
                    state <= wrong_2;
                end

                correct_2: if (SW == 10'b0000000101) begin 
                    state <= correct_3;
                end else begin
                    state <= wrong_3;
                end

                correct_3: if (SW == 10'b0000000101) begin
                    state <= correct_4;
                end else begin
                    state <= wrong_4;
                end

                correct_4: if (SW == 10'b0000001001) begin
                    state <= correct_5;
                end else begin
                    state <= wrong_5;
                end

                correct_5: if (SW == 10'b0000000001) begin
                    state <= open; 
                end else begin
                    state <= closed;
                end

                wrong_1: state <= wrong_2;
                wrong_2: state <= wrong_3;
                wrong_3: state <= wrong_4;
                wrong_4: state <= wrong_5;
                wrong_5: state <= closed;
                open: state <= open;
                closed: state <= closed;
                default: state <= initial_state;
            endcase
        end
    end

    always_comb begin 

        
            if(state == open) {hex5,hex4,hex3,hex2,hex1,hex0} = 42'b111111111111111000000000110000001101001000;
            
            else if(state == closed) {hex5,hex4,hex3,hex2,hex1,hex0} = 42'b100011010001111000000001001000001100100001;

            else begin


            case (SW)
                10'b0000000000: {hex5,hex4,hex3,hex2,hex1,hex0} = 42'b111111111111111111111111111111111111000000;

                10'b0000000001: {hex5,hex4,hex3,hex2,hex1,hex0} = 42'b111111111111111111111111111111111111111001;

                10'b0000000010: {hex5,hex4,hex3,hex2,hex1,hex0} = 42'b111111111111111111111111111111111110100100;

                10'b0000000011: {hex5,hex4,hex3,hex2,hex1,hex0} = 42'b111111111111111111111111111111111110110000;

                10'b0000000100: {hex5,hex4,hex3,hex2,hex1,hex0} = 42'b111111111111111111111111111111111110011001;

                10'b0000000101: {hex5,hex4,hex3,hex2,hex1,hex0} = 42'b111111111111111111111111111111111110010010;

                10'b0000000110: {hex5,hex4,hex3,hex2,hex1,hex0} = 42'b111111111111111111111111111111111110000010;

                10'b0000000111: {hex5,hex4,hex3,hex2,hex1,hex0} = 42'b111111111111111111111111111111111111111000;

                10'b0000001000: {hex5,hex4,hex3,hex2,hex1,hex0} = 42'b111111111111111111111111111111111110000000;

                10'b0000001001: {hex5,hex4,hex3,hex2,hex1,hex0} = 42'b111111111111111111111111111111111110011000;

                //to display error
                10'b0000001010: {hex5,hex4,hex3,hex2,hex1,hex0} = 42'b111111100001100101111010111101000110101111;

                10'b0000001011: {hex5,hex4,hex3,hex2,hex1,hex0} = 42'b111111100001100101111010111101000110101111;

                10'b0000001100: {hex5,hex4,hex3,hex2,hex1,hex0} = 42'b111111100001100101111010111101000110101111;

                10'b0000001101: {hex5,hex4,hex3,hex2,hex1,hex0} = 42'b111111100001100101111010111101000110101111;

                10'b0000001110: {hex5,hex4,hex3,hex2,hex1,hex0} = 42'b111111100001100101111010111101000110101111;

                10'b0000001111: {hex5,hex4,hex3,hex2,hex1,hex0} = 42'b111111100001100101111010111101000110101111;

                default: {hex5,hex4,hex3,hex2,hex1,hex0} = 42'b111111100001100101111010111101000110101111;

            endcase
            
            end
        end

endmodule: lab3

