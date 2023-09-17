module RISC_V_tb2 ();
	
	reg clk, rst_n;

	integer error_cases, correct_cases, Tests;

	RISC_V DUT(
            .clk(clk),
			.rst(rst_n)
			);

    
    parameter CLK_PERIOD = 10;

    always #(CLK_PERIOD/2) clk = ~clk;


    initial begin

        clk = 0;

        $readmemh("riscvtest2.txt", inst_mem);

    	error_cases   = 0;
    	correct_cases = 0;
    	Tests    = 0;

		reset_check();


	
    	check_regfile (2,  5,  1);
    	check_regfile (3, 12,  2);
    	check_regfile (7,  3,  3);
    	check_regfile (4,  7,  4);
    	check_regfile (5,  4,  5);
    	check_regfile (5,  11, 6);

    	check_PC ('h1C,7);

    	check_regfile (4,  0,  8);

    	check_PC ('h28,9);

    	check_regfile (4,  1,  10);
    	check_regfile (7,  12, 12);
    	check_regfile (7,  7,  13);

    	check_DMEM (24,  7,  14);

    	check_regfile (2,  7,  15);
    	check_regfile (9,  18, 16);

    	check_PC ('h48, 17);

    	check_regfile (2,  25, 19);

    	check_DMEM (25, 25, 20);
    	
    	check_regfile (20 , 32'h12345000, 21);

    	check_JALR (21, 32'h00000058, 32'h00000008, 22);

    	$display("%t: errorCases = %0d \t correctCases = %0d \t testCases = %0d", $time, error_cases, correct_cases, Tests);

    	$stop;
    end


   task reset_check (); 
    	rst_n = 1'b0;
    	#(CLK_PERIOD);
        if(DUT.Data_Path.PC.current_inst != 0) begin
			error_cases++;
    		$display("%t: error in reset. PC_value is %0h bt it should be 00000000", $time, DUT.Data_Path.PC.current_inst);
    	end
    	else begin
    		correct_cases++;
    	end
        Tests++;

    	rst_n = 1'b1;
   endtask


	task check_PC (input [31:0] expected_PC, input [4:0] line);
		#(CLK_PERIOD);
		if(DUT.Data_Path.PC.current_inst != expected_PC) begin
			error_cases++;
    		$display("%t: error in line %0d. PC_value is %0h bt it should be %0h", $time, line, DUT.Data_Path.PC.current_inst, expected_PC);
    	end
    	else begin
    		correct_cases++;
    	end
        Tests++;

	endtask 



	task check_regfile (input [4:0] index, input [31:0] expected_value, input [4:0] line);
		#(CLK_PERIOD);
		if(DUT.Data_Path.RegisterFile.Register_file[index] != expected_value) begin
			error_cases++;
    		$display("%t: error in line %0d. regFile [%0d] = %0d while it should be = %0d", $time, line, index, DUT.Data_Path.RegisterFile.Register_file[index], expected_value);
    	end
    	else begin
    		correct_cases++;
    	end
        Tests++;

	endtask

	task check_JALR (input [4:0] index, input [31:0] expected_value, input [31:0] expected_PC, input [4:0] line);
		#(CLK_PERIOD);
		if(DUT.Data_Path.RegisterFile.Register_file[index] == expected_value && DUT.Data_Path.PC.current_inst == expected_PC) begin
			correct_cases++;
		end
    	else begin
    		error_cases++;
			if(DUT.Data_Path.RegisterFile.Register_file[index] != expected_value)
				$display("%t: error in line %0d. regFile[%0d] is %0d while it should be %0d", $time, line, index, DUT.Data_Path.RegisterFile.Register_file[index] , expected_value);
			if(DUT.Data_Path.PC.current_inst != expected_PC)    	
				$display("%t: error in line %0d. PC_value is %0h while it should be = %0h", $time, line, DUT.Data_Path.PC.current_inst, expected_PC);
    	end
    	Tests++;

	endtask



	task check_DMEM (input [9:0] index, input [31:0] expected_value, input [4:0] line);
		#(CLK_PERIOD);
		if(DUT.Data_Memory.data_mem[index] != expected_value) begin
			error_cases++;
    		$display("%t: error in line %0d. DMEM[%0d] is %0d while it should be = %0d", $time, line, index, DUT.Data_Memory.data_mem[index], expected_value);
    	end
    	else begin
    		correct_cases++;
    	end
        Tests++;
	endtask
endmodule 