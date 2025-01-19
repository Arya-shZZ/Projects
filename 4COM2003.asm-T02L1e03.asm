asect  0x00

# =================================
# INSERT YOUR CODE BELOW
# Executable instructions only
# No dc or ds pseudo-instructions
# Do not include a halt instruction: that has been done already (below)
# ---------------------------------------------------------------------
ldi r0, a
ld r0, r0   #r0 = a 

ldi r1, b
ld r1, r1  #r1 = b

ldi r2, c
ld r2, r2  #r2 = 2

if 
   cmp r0, r1
is gt 
#is pl
     move r0, r3
else
    move r1, r3
fi

ldi r0, ans
if 
  cmp r2, r3
is gt  #(c>max (a,b))?
     st r0, r2  #ans = c
else
    st r0, r3  #ans = max (a,b)
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
# (different bit-strings placed at addresses a, b and c)
# ---------------------------------------------------------------------

INPUTS>
a:    dc -18   # replace these three numbers
b:    dc 9     # by your choice of integers
c:    dc 5     #  for testing purposes
ENDINPUTS>

ans:  ds 1     # one byte reserved for the result
end


