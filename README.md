risc v is free & open source archi
it is risc based (like arm)
supports 32, 64 and 128 bit archis.
This work is for 64-bit archi
 
// global makes the var visible globally
ABI : a0-1 for x10-11 : application binary interface to use

a7 stores syscalls, 93 being the value of exit call

to assemble (create hello.o file): riscv65-unknown-elf-as -o hello.o hello.s (not specific vendor + elf is main exe binary for linux apps: exe and linkable format+ as: assemble + -o: object binary output+ hello.o : name of bin file )

riscv64-linux-gnu-as 

to create the executable: 
riscv64-unknown-elf-ld -o hello hello.o

riscv64-linux-gnu-ld 

./hello
qemu-riscv64

echo $?  //print output of the precedent application
--- 
we use pseudoinstructions since the assembler translates them to basic real instru: like addi for li

/*here since we will kinda call the write syscall we need to store the values of each param*/
// load in a0 the value 1 for stdout
// load absolute addr in a1 the buffer (which is the variable that stores our data)
// load imm the size of the variable 
//set syscall of write (num= 64) + ecall
section data to add content to be printed
