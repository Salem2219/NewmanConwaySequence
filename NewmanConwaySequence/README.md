# Newman-Conway Sequence

Newman-Conway Sequence is the one which generates the following integer sequence.
1 1 2 2 3 4 4 4 5 6 7 7…

In mathematical terms, the sequence P(n) of Newman-Conway numbers is defined by recurrence relation

P(n) = P(P(n - 1)) + P(n - P(n - 1)) 
with seed values P(1) = 1 and P(2) = 1
# FSMD
Basic Finite State Machine with Datapath (FSMD) example to calculate the n-th number in Newman-Conway Sequence up to the 14th index.

## Install

These examples use [ModelSim&reg; and Quartus&reg; Prime from Intel FPGA](http://fpgasoftware.intel.com/?edition=lite), [GIT](https://git-scm.com/download/win), [Visual Studio Code](https://code.visualstudio.com/download), make sure they are installed locally on your computer before proceeding.

## Usage

1. Grab a copy of this repository to your computer's local folder (i.e. C:\projects):

    ```sh
    $ cd projects
    $ git clone https://github.com/Salem22/NewmanConwaySequence.git
    ```
2. Use Visual Studio Code (VSC) to edit and view the design files:

    ```sh
    $ cd NewmanConwaySequence
    $ code .
    ```
    Click on the toplevel.vhd file in the left pane to view its contents.
    
3. From the VSC View menu, choose Terminal, in the VCS Terminal, create a "work" library:

    ```sh
    $ vlib work
    ```
    
4. Compile all the design units:

    ```sh
    $ vcom *.vhd
    ```
    
5. Simulate your design. For example, if n = 10, then y = 6:

    ```sh
    $ vsim work.tb
    ```
