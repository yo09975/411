# translate the following c code to mips
# for (i=0;i!=j;i+=2)
# b[i]=a[i]-a[i+1]
# where registers are as follows
# i -> r5
# j -> r6
# a -> r1
# b -> r2
# c -> r3
# free -> r10, r11, r12
.globl main
main:
.text
li $5, 0 # i=0
li $6, 4 # j=4 (from sample problem -- two iterations)

la $1, arrA
la $2, arrB

loop:
beq $5, $6, end # if i == j goto end

# Loop Body
# b[i]=a[i]-a[i+1]
sll $12, $5, 2
add $10, $1, $12 # a[i]
lw $10, 0($10)

addi $12, $5, 1
sll $12, $12, 2
add $11, $1, $12 # a[i+1]
lw $11, 0($11)

sub $10, $10, $11 # a[i]-a[i+1]

sll $12, $5, 2
add $12, $2, $12 # b[i]
sw $10, 0($12) # b[i]=a[i]-a[i+1]



addi $5, $5, 2  # i+=2
j loop
end:
li $v0, 10
syscall # exit

.data
arrA:
    .word 100
    .word 10
    .word 10
    .word 1
arrB:
    .word 0

