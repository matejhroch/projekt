

### Team members

* Member 1 - Matej Hroch (responsible for test benches, simulations )
* Member 2 - Viliam Krištof (responsible for morse alphabet, documentation, video)
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

Schematic of our implementation

<img width="517" alt="Screenshot (31)" src="https://user-images.githubusercontent.com/124798762/235775822-d7ec7cfe-daca-4946-b79b-e365da8ceac3.png">

All the project files as well as sources, testbenches are included in a separate folder called "projekt_DE1"


### Component(s) simulation
Simulation of a binary to morse part with letters A and B in the picture

![tb_bin_to_morse_AaB](https://user-images.githubusercontent.com/124798762/235776142-4440c6c6-61b9-435a-b82e-79c5797c02d8.png)

 Simulation of morse to binary part with letters N and P in the picture
 
![tb_morse_to_bin_NaP](https://user-images.githubusercontent.com/124798762/235776329-928c101e-49c7-4fc7-974d-406f540fc2c5.png)

Simulation of a translator from a recieved morse signal to binary (letters A and B in this case)

![tb_translator_AaB](https://user-images.githubusercontent.com/124798762/235776646-5b271446-c8ee-4c42-b4ed-aa3a0d1e4a25.png)


## Instructions

In a nutshell our solution is pretty straight forward.

Firstly, morse coder - part that enables sending morse code (signal) either to a LED or to a pin which other devices are able to recieve.
Although, typical telegraph works via direct transmitting signal of "beaps" we decided to use ASCII table. So for instance letter "A" is number 65 in ASCII. By toggling the 7 switches at the bottom of our FPGA board we're able to change the value from 1000001 all the way to 1011010 (65 to 90 in decimal numbers). Switch number 15 changes the function of our device, in this case upper position means "sending". By switching the switch 14 in a upper position we send the signal to a pin as well as to RGB LED which blinks according to a morse aplhabet.

Secondly, morse decoder - part that enables to recieve and also interpret incoming signal, in this case, from Arduino. By pressing any given letter on a keyboard via putty the Arduino recieves a command to send a signal. Our board recieves (obviously with switch number 15 in a "recieving position") the signal which is translated into binary (corresponding again to the ASCII table) and diplayed on little green LEDs above the switches. We've also implemented the reset button - BTNC that resets the counter and puts zero(s) on both binary and morse outputs.
The whole process of sending as well as recieving we've captured on a video that pretty much explains everything along with its functionality.

https://www.youtube.com/watch?v=Mk9ulXtQHwA

## References

1. https://en.wikipedia.org/wiki/Morse_code - Morse code alphabet
2. https://www.rapidtables.com/convert/number/binary-to-decimal.html - convertion between decimal-binary and vice versa
3. Some parts of our code was recycled from the labs of DE1 we've had this semester
4. https://vhdlguide.readthedocs.io/en/latest/ - VHDL guidelines

