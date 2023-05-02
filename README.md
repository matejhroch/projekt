

### Team members

* Member 1 - Matej Hroch (responsible for test benches, simulations )
* Member 2 - Viliam Krištof (responsible for morse alphabet, documentation)
* Member 3 - Juraj Goryl (responsible for binary to morse and vice versa part, documentation)

## Theoretical description and explanation

We've been faced with a problem - Morse code coder and decoder using FPGA chip platform.
Our final "product" should be able to send and also recieve the morse code with a various aproaches which hopefully in the end will make our own "morse coder" unique among our groups. 
Together as a team we came up with a solution to this technical problem and in the end made it functional.
Morse code device should be able to send morse code as a signal, so this part of problem could be tested but also to recieve a signal which should be displayed using LED or 7-segment display. There are obviously many ways to atain this result, however there's at least one thing that all of us ought to have in common. Time variables for a "dot" and "dash" have to be easily adjustable in order to change them according to a recieved signal from another device.  


## Hardware description of demo application

In the picture you can see all the cells on FPGA chip we've used in this project  

![Screenshot (1)](https://user-images.githubusercontent.com/124798762/235774405-093d6ae6-4713-46e6-9974-36cd792a4ca0.png)

Also in a more detail
![Screenshot (2)](https://user-images.githubusercontent.com/124798762/235774604-36cc2124-cded-4431-89c3-0c98ca15e3f9.png)


## Software description

Put flowchats/state diagrams of your algorithm(s) and direct links to source/testbench files in `src` and `sim` folders. 

### Component(s) simulation

Write descriptive text and simulation screenshots of your components.

## Instructions

In a nutshell our solution is pretty straight forward.
Firstly, morse coder - part that enables sending morse code (signal) either to a LED or to a pin which other devices are able to recieve.
Although, typical telegraph works via direct transmitting signal of "beaps" we decided to use ASCII table. So for instance letter "A" is number 65 in ASCII. By toggling the 7 switches at the bottom of our FPGA board we're able to change the value from 1000001 all the way to 1011010 (65 to 90 in decimal numbers). Switch number 15 changes the function of our device, in this case upper position means "sending". 
Write an instruction manual for your application, including photos or a link to a video.

## References

1. Put here the literature references you used.
2. ...
