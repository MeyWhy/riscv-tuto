# Risc-v Fun learning
---
## Basic notes 
Risc v is free & open source archi   
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
## Notes from hello world lab   
we use pseudoinstructions since the assembler translates them to basic real instru: like addi for li   
 
/*here since we will kinda call the write syscall we need to store the values of each param*/   
// load in a0 the value 1 for stdout    
// load absolute addr in a1 the buffer (which is the variable that stores our data)   
// load imm the size of the variable     
//set syscall of write (num= 64) + ecall   
section data to add content to be printed     
  

---
## Notes from read write lab   
	/* afficher le mot vide */   
write (64) accepts 3 params: write(size_t count;
                     int fd, const void buf[count], size_t count);   
the first one in a0 (with val 1 for stdout), second in a1 (either a data symbol or an immediate value), third is the size in a2, then the syscall with 64 in a7 and finally ecall to trigger it.    

/* read input from keyboard*/   
read (63) also accepts 3 params:  read(size_t count;
                    int fd, void buf[count], size_t count);   
first one (file descriptor in a0 being 0 for stdin from keyboard), second is input in a1 (to store the input); third is size again in a2 then in a7 put 63 then ecall.    

/*afficher la nouvelle variable */    
write again same thing but load address of input in a1 

then exit program successfully with 93 syscall with value of 2

use riscv64-linux-gnu-objdump -d hello to check address produced. in my code since my program is global (with .global keyword) i use a variable called gp (for global pointer) but never really init it. So after the linking/assembling i get the addresses for s and input as something like "gp + (-2028) = 0xfffff814) meaning it injected garbage and that way the address are invalid. So to solve this we can either prevent the assembler/linker from generating gp-relative accesses, or init the gp before using any data symbol: i chose to prevent the use of it by deactivating linker relaxation using the directive: .option norelax at the begining of my program    
