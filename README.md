# NASM ports of exercises from Programming from the Ground Up

**MOVED!** Hello, I am moving my repos to http://ratfactor.com/repos/
and setting them to read-only ("archived") on GitHub. Thank you, _-Dave_

The 2003 book _Programming from the Ground Up_ is an excellent primer
for 32-bit (i386) architecture assembly (and fundamental programming in
general). I've got a paper copy, but you can also read it for free
at archive.org:

https://archive.org/details/programming-from-the-ground-up

This repo contains my NASM translations of the programs. The `go.sh`
shell script assembles, links, and runs them (leave off the extension):

    # Exit
    #
    $ ./go.sh ch03.1_exit
    Exited with code: 0

    # Find largest value in array of doubles
    #
    $ ./go.sh ch03.2_maximum
    Exited with code: 222

    # Call a function to compute exponent
    #
    $ ./go.sh ch04.1_power_function
    Exited with code: 33

    # Call recursive function to compute factorial
    #
    $ ./go.sh ch04.2_factorial
    Exited with code: 24

Personal note: I like this book a lot, but I do not endorse the author
or his views outside of this one single subject.
