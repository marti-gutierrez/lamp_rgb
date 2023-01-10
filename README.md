# Lamp RGB with **ATTiny2313** in *ASM*

We'll create a matrix of leds (red,green and blue) that will be manipulated with *PWM* to obtain different colors, we'll connect by means of the bluetooth **module hc-05** to vary the pwm, all this by means of the uC **ATtiny2313** in *asm*.

## Table of Contents

- Demo
- Features
- Installation Step
- [The process](#the-process)
    - [Built with](#built-with)
    - [Structure](#structure)
- Useful resources
- License
- Author

## The process

### Built with

- Microchip Studio (asm)
- 1 Attiny2313
- 1 Module HC-05
- 6 ultra-bright 10mm LEDs for each color: red, green and blue

### structure

- [x] init and create project 9/jan/2023
- [x] create README structure to document project 9/jan/2023
- [ ] draw schematic of the system
- [ ] test UART communication with **HC-05 module**