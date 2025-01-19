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
ld r2,r2 

inc r0
inc r0
inc r0
inc r0
inc r0

inc r2
inc r2
inc r2
inc r2
inc r2
inc r2
inc r2

if
cmp r0, r1
is ge 
ldi r1, x
ld r1,r1
shla r1
ldi r2,x
ld r2,r2 
add r2, r1
ldi r3, ans
st r3,r1
else
shla r1
sub r2,r1
ldi r3, ans
st r3, r1
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
# (different bit-strings placed at addresses x, y and z)
# ---------------------------------------------------------------------

INPUTS>
x:    dc -6    # replace these three numbers
y:    dc 5     # by your choice of integers
z:    dc 3     #  for testing purposes
ENDINPUTS>

ans:  ds 1     # one byte reserved for the result
end


