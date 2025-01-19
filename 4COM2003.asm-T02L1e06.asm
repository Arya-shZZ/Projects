asect  0x00

# =================================
# INSERT YOUR CODE BELOW
# Executable instructions only
# No dc or ds pseudo-instructions
# Do not include a halt instruction: that has been done already (below)
# ---------------------------------------------------------------------
ldi r0,a 
ld r0, r1
ldi r2, 1

if 
tst r1
is eq
ldi r0, x
ld r0, r3
neg r3
fi

if 
cmp r1, r2
is eq
ldi r0, x
ld r0, r3
ldi r0, y
ld r0, r0
add r0, r3
fi

if
cmp r1, r2
is gt
ldi r0, z
ld r0 , r3
ldi r0, y
ld r0, r0
sub r0, r3 
fi

ldi r0, ans
st r0, r3
 



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
# (different bit-strings placed at addresses a, x, y and z)
# ---------------------------------------------------------------------

INPUTS>
a:    dc -18   # replace these three numbers
x:    dc 5     # by your choice of integers
y:    dc 3     #  for testing purposes
z:    dc 7
ENDINPUTS>

ans:  ds 1     # one byte reserved for the result
end


