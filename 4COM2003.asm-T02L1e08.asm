asect  0x00

# =================================
# INSERT YOUR CODE BELOW
# Executable instructions only
# No dc or ds pseudo-instructions
# Do not include a halt instruction: that has been done already (below)
# ---------------------------------------------------------------------
ldi r0, x
ld r0,r0
ldi r1, y
ld r1,r1
ldi r2, z
ld r2, r2
shla r0
ldi r3, x
ld r3,r3
add r3,r0
neg r0
shla r12

if 
cmp r1, r0
is lt
ldi r0,x
ld r0, r0
ldi r2, y
ld r2, r2
add r2, r0
ldi r3 ,ans
st r3,r0
else
ldi r0, y
ld r0,r0
ldi r2,z
ld r2, r2
sub r0, r2
ldi r3, ans
st r3,r2
fi 




# =================================
# LEAVE THIS PART OF THE FILE ALONE
# Do not change the next two instructions: they must be the last two
# instructions executed by your program.
    ldi r0, ans  # Loads the address of your result into r0 for the robot
    halt         # Brings execution to a halt

# =================================
# DATA GOES BELOW
# We have set this up for you, but you will need to test your program by
# compiling and running it several times with different input data values
# (different bit-strings placed at addresses x and y)
# ---------------------------------------------------------------------

INPUTS>
x:    dc -6    # replace these numbers by your choice
y:    dc 5     # of integers for testing purposes
z:    dc 3
ENDINPUTS>

ans:  ds 1     # one byte reserved for the result
end


