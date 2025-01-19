asect  0x00

# =================================
# INSERT YOUR CODE BELOW
# Executable instructions only
# No dc or ds pseudo-instructions
# Do not include a halt instruction: that has been done already (below)
# ---------------------------------------------------------------------
ldi r0, a
ld r0, r1
ldi r0, b
ld r0, r2
ldi r0, c
ld r0, r3
ldi r0, a
ld r0,r0
add r2, r0
add r3,r1
add r3,r2

if 
cmp r0,r1
is le, and
cmp r1,r2
is le
ldi r3,0
add r2,r3
ldi r0, sum
st r0, r3
halt
fi

if
	cmp r0,r1
	is ge, and
		cmp r0,r2
	is le
		ldi r3, 0
		add r2,r3
		ldi r0, sum
		st r0,r3
		halt
	else
		cmp r0,r1
	is ge, and
		cmp r0,r2
	is ge
		ldi r3,0
		add r0,r3
		ldi r0, sum
		st r0,r3
		halt
	fi
	
	ldi r0, sum
	st r0,r3

# =================================
# LEAVE THIS PART OF THE FILE ALONE
# Do not change the next two instructions: they must be the last two
# instructions executed by your program.
    ldi r0, sum  # Loads the address of your result into r0 for the robot
    halt         # Brings execution to a halt

# =================================
# DATA GOES BELOW
# We have set this up for you, but you will need to test your program by
# compiling and running it several times with different input data values
# (different integers placed at addresses a, b and c)
# ---------------------------------------------------------------------

INPUTS>
a:    dc -1    # replace these five numbers
b:    dc 1     # by your choice of integers
c:    dc 5     # for testing purposes
ENDINPUTS>

sum:  ds 1     # one byte reserved for the result
end


