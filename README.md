# ALU_VHDL
Aim of this lab is to implement and design an arithmetic logic unit using VHDL and Basys 3. An ALU unit is basically a unit that generates some functions with given numbers according to a select signal.
	Aim of this lab is to implement and design an arithmetic logic unit using VHDL and Basys 3. An ALU unit is basically a unit that generates some functions with given numbers according to a select signal. For example, it sums the given numbers when the select signal is “000” or subtracts them if the select signal is “001” or operates logic shift or bit wise logical operations. In this lab an ALU generating 8 functions is implemented. It functions addition when select signal is “000”; subtraction when select signal is “001”; increment, adds 1 to num1, when select signal is “010”; bit wise AND when select signal is “011”; one’s complement when select signal is “100”; bit wise XOR when select signal is “101”; left logic shift when select signal is “110”; left rotation shift when select signal is “111”. A multiplexer used for selecting the output of the signal also a overflow detection output is implemented.
