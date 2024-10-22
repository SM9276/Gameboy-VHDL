This document is going to be a record of my progress in this project.

The first thing I wanted to implement is the ALU. I found a great resource on GameBoy Architecture.
https://gbdev.io/pandocs/
https://rgbds.gbdev.io/docs/v0.8.0/gbz80.7#SUB_A,r8
Using the pandocs, I was able to make a list of the core instructions the ALU would need to complete. 
I have been creating every instruction either through dataflow or structural.
Ended up getting rid of ADC and SBC since they were both redundant.
The first roadblock was creating the flags in the ALU. I was unsure if I should have the flags computed in the ALU itself or
Instead of having it be calculated at the component level, I recently decided on having the flags in the ALU.
Man these flags were giving me a big problem, I really wanted to create this ALU from pure combunational logic, and i finally achieved it
