module tb_lab3();

reg [9:0] SW;
reg [3:0] KEY;
wire [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
wire [9:0] LEDR;

lab3 dut(.SW, .KEY, .HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5, .LEDR);

task reset; KEY = 4'b0001; #20; KEY= 4'b0000; #20; KEY = 4'b0001; #20; KEY = 4'b1001; endtask 

initial begin
    //test1 - wrong input 2
    //switch input 0001
    reset;
    SW = 10'b0000000001; 
    KEY = 4'b1000;
    #10
    KEY = 4'b1001;               
    #10
    //wrong_1

    SW = 10'b0000000001;
    KEY = 4'b1000;
    #10
    KEY = 4'b1001;             
    #10
    //wrong_2

    SW = 10'b0000000001;
    KEY = 4'b1000;
    #10
    KEY = 4'b1001;            
    #10
    //wrong_3

    SW = 10'b0000000001;
    KEY = 4'b1000;
    #10
    KEY = 4'b1001;            
    #10
    //wrong_4

    SW = 10'b0000000001;
    KEY = 4'b1000;
    #10
    KEY = 4'b1001;            
    #10
    //wrong_5

    SW = 10'b0000000001;
    KEY = 4'b1000;
    #10
    KEY = 4'b1001;            
    #10
    //closed

    assert(HEX5 === 7'b1000110 && HEX4 === 7'b1000111 && HEX3 ===7'b1000000 && HEX2 ===7'b0010010 && HEX1 === 7'b0000110 && HEX0 === 7'b0100001) $display ("Test 1 PASSED, printed closed after 1st input wrong"); 
    else $display("Test 1 FAILED");

//////////////////////////////////////////////////////////////////////////////////////////////
    //test2 - wrong input 2
    reset;
    SW = 10'b0000000010;
    KEY = 4'b1000;
    #10
    KEY = 4'b1001;            
    #10 
    //goes to correct_1

    SW = 10'b0000000001;
    KEY = 4'b1000;
    #10
    KEY = 4'b1001;            
    #10
    //wrong_2

    SW = 10'b0000000001;
    KEY = 4'b1000;
    #10
    KEY = 4'b1001;            
    #10
    //wrong_3

    SW = 10'b0000000001;
    KEY = 4'b1000;
    #10
    KEY = 4'b1001;            
    #10
    //wrong_4

    SW = 10'b0000000001;
    KEY = 4'b1000;
    #10
    KEY = 4'b1001;            
    #10
    //wrong_5

    SW = 10'b0000000001;
    KEY = 4'b1000;
    #10
    KEY = 4'b1001;            
    #10
    //closed

    assert(HEX5 === 7'b1000110 && HEX4 === 7'b1000111 && HEX3 ===7'b1000000 && HEX2 ===7'b0010010 && HEX1 === 7'b0000110 && HEX0 === 7'b0100001) $display ("Test 2 PASSED, printed closed after 2nd input wrong"); 
    else $display("Test 2 FAILED");


//////////////////////////////////////////////////////////////////////////////////////////////
    //test3 - wrong input 3
    reset;
    SW = 10'b0000000010;  //2
    KEY = 4'b1000;
    #10
    KEY = 4'b1001;            
    #10 
    //goes to correct_1

    SW = 10'b0000001000;  //8
    KEY = 4'b1000;
    #10
    KEY = 4'b1001;            
    #10
    //correct_2

    SW = 10'b0000000001;
    KEY = 4'b1000;
    #10
    KEY = 4'b1001;            
    #10
    //wrong_3

    SW = 10'b0000000001;
    KEY = 4'b1000;
    #10
    KEY = 4'b1001;            
    #10
    //wrong_4

    SW = 10'b0000000001;
    KEY = 4'b1000;
    #10
    KEY = 4'b1001;            
    #10
    //wrong_5

    SW = 10'b0000000001;
    KEY = 4'b1000;
    #10
    KEY = 4'b1001;            
    #10
    //closed

    assert(HEX5 === 7'b1000110 && HEX4 === 7'b1000111 && HEX3 ===7'b1000000 && HEX2 ===7'b0010010 && HEX1 === 7'b0000110 && HEX0 === 7'b0100001) $display ("Test 3 PASSED, printed closed after 3rd input wrong"); 
    else $display("Test 3 FAILED");


//////////////////////////////////////////////////////////////////////////////////////////////
    //test4 - wrong input 4
    reset;
    SW = 10'b0000000010;  //2
    KEY = 4'b1000;
    #10
    KEY = 4'b1001;            
    #10 
    //goes to correct_1

    SW = 10'b0000001000;  //8
    KEY = 4'b1000;
    #10
    KEY = 4'b1001;            
    #10
    //correct_2

    SW = 10'b0000000101;  //5
    KEY = 4'b1000;
    #10
    KEY = 4'b1001;            
    #10
    //correct_3

    SW = 10'b0000000001;
    KEY = 4'b1000;
    #10
    KEY = 4'b1001;            
    #10
    //wrong_4

    SW = 10'b0000000001;
    KEY = 4'b1000;
    #10
    KEY = 4'b1001;            
    #10
    //wrong_5

    SW = 10'b0000000001;
    KEY = 4'b1000;
    #10
    KEY = 4'b1001;            
    #10
    //closed

    assert(HEX5 === 7'b1000110 && HEX4 === 7'b1000111 && HEX3 ===7'b1000000 && HEX2 ===7'b0010010 && HEX1 === 7'b0000110 && HEX0 === 7'b0100001) $display ("Test 4 PASSED, printed closed after 4th input wrong"); 
    else $display("Test 4 FAILED");


//////////////////////////////////////////////////////////////////////////////////////////////
    //test5 - wrong input 5
    reset;
    SW = 10'b0000000010;  //2
    KEY = 4'b1000;
    #10
    KEY = 4'b1001;            
    #10 
    //goes to correct_1

    SW = 10'b0000001000;  //8
    KEY = 4'b1000;
    #10
    KEY = 4'b1001;            
    #10
    //correct_2

    SW = 10'b0000000101;  //5
    KEY = 4'b1000;
    #10
    KEY = 4'b1001;            
    #10
    //correct_3

    SW = 10'b0000000101;  //5
    KEY = 4'b1000;
    #10
    KEY = 4'b1001;            
    #10
    //correct_4

    SW = 10'b0000000001;
    KEY = 4'b1000;
    #10
    KEY = 4'b1001;            
    #10
    //wrong_5

    SW = 10'b0000000001;
    KEY = 4'b1000;
    #10
    KEY = 4'b1001;            
    #10
    //closed

    assert(HEX5 === 7'b1000110 && HEX4 === 7'b1000111 && HEX3 ===7'b1000000 && HEX2 ===7'b0010010 && HEX1 === 7'b0000110 && HEX0 === 7'b0100001) $display ("Test 5 PASSED, printed closed after 5th input wrong"); 
    else $display("Test 5 FAILED");



//////////////////////////////////////////////////////////////////////////////////////////////
    //test6 - last input wrong
    reset;
    SW = 10'b0000000010;  //2
    KEY = 4'b1000;
    #10
    KEY = 4'b1001;            
    #10 
    //goes to correct_1

    SW = 10'b0000001000;  //8
    KEY = 4'b1000;
    #10
    KEY = 4'b1001;            
    #10
    //correct_2

    SW = 10'b0000000101;  //5
    KEY = 4'b1000;
    #10
    KEY = 4'b1001;            
    #10
    //correct_3

    SW = 10'b0000000101;  //5
    KEY = 4'b1000;
    #10
    KEY = 4'b1001;            
    #10
    //correct_4

    SW = 10'b0000001001;  //9
    KEY = 4'b1000;
    #10
    KEY = 4'b1001;            
    #10
    //correct_5

    SW = 10'b0000000000;
    KEY = 4'b1000;
    #10
    KEY = 4'b1001;            
    #10
    //closed

    assert(HEX5 === 7'b1000110 && HEX4 === 7'b1000111 && HEX3 ===7'b1000000 && HEX2 ===7'b0010010 && HEX1 === 7'b0000110 && HEX0 === 7'b0100001) $display ("Test 6 PASSED, printed closed after 6th input wrong"); 
    else $display("Test 6 FAILED");


//////////////////////////////////////////////////////////////////////////////////////////////
    //test7 - all correct inputs
    reset;
    SW = 10'b0000000010;  //2
    KEY = 4'b1000;
    #10
    KEY = 4'b1001;            
    #10 
    //goes to correct_1

    SW = 10'b0000001000;  //8
    KEY = 4'b1000;
    #10
    KEY = 4'b1001;            
    #10
    //correct_2

    SW = 10'b0000000101;  //5
    KEY = 4'b1000;
    #10
    KEY = 4'b1001;            
    #10
    //correct_3

    SW = 10'b0000000101;  //5
    KEY = 4'b1000;
    #10
    KEY = 4'b1001;            
    #10
    //correct_4

    SW = 10'b0000001001;  //9
    KEY = 4'b1000;
    #10
    KEY = 4'b1001;            
    #10
    //correct_5

    SW = 10'b0000000001;  //1
    KEY = 4'b1000;
    #10
    KEY = 4'b1001;            
    #10
    //open

    assert(HEX5 === 7'b1111111 && HEX4 === 7'b1111111 && HEX3 ===7'b1000000 && HEX2 ===7'b0001100 && HEX1 === 7'b0000110 && HEX0 === 7'b1001000) $display ("Test 7 PASSED, printed open"); 
    else $display("Test 7 FAILED");


////////////////////////////////////////////////////////////////////////////


    //test8 - print error
    reset;
    SW = 10'b0000001010;
    KEY = 4'b1000;
    #10
    KEY = 4'b1001;         
    #10      

    assert(HEX5 === 7'b1111111 && HEX4 === 7'b0000110 && HEX3 ===7'b0101111 && HEX2 ===7'b0101111 && HEX1 === 7'b0100011 && HEX0 === 7'b0101111) $display ("Test 8 PASSED, printed error"); 
    else $display("Test 8 FAILED, error not displaying");
    

end

endmodule: tb_lab3

