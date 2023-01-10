;
; lampNight.asm
;
; Created: 30 dic. 2022 18:56:35
; Author : marti
; Description: El siguiente programa controla una lampara rgb
; con ayuda de comunicaci�n UART.

.include "tn2313def.inc"
//<-- define ---->
.def buffer_data = r17
.cseg
.org 0x0000 rjmp reset
.org 0x0007 rjmp uart_rx_complete

reset:
	ldi   r16,low(RAMEND)
	out   SPL,r16
	;uart_init
	ldi   r16,0<<U2X        ;Disable: Double speed uart.
	out   UCSRA,r16
	ldi   r16,1<<RXEN|1<<TXEN|0<<UCSZ2
	out   UCSRB,r16
	ldi   r16,0<<UMSEL|0<<UPM1|0<<UPM0|0<<USBS|1<<UCSZ1|1<<UCSZ0|0<<UCPOL
	out   UCSRC,r16
	ldi   r16,25
	out   UBRRL,r16
	ldi   r16,0
	out   UBRRH,r16
	; Programa principal
	ldi   buffer_data,'H'
	rcall uart_send
	ldi   buffer_data,'o'
	rcall uart_send
	ldi   buffer_data,'l'
	rcall uart_send
	ldi   buffer_data,'a'
	rcall uart_send
	ldi   buffer_data,'\n'
	rcall uart_send
	ldi   buffer_data,'\r'
	rcall uart_send
wait:
	rjmp  wait

uart_send:
	sbis UCSRA,UDRE
	rjmp uart_send
	out  UDR,buffer_data
	ret
uart_receive:
	sbis UCSRA,RXC
	rjmp uart_receive
	in   buffer_data,UDR
	ret
uart_rx_complete:
	reti


