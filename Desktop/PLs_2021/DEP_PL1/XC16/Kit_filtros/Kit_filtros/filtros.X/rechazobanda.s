;.....
;    File   rechazobanda.s 
;.....

    .equ rechazobandaNumTaps, 111

;.....
; Allocate and initialize filter taps

		.section .rechazobandaconst, "x"
		.align 256
rechazobandaTaps:
.hword 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0001 
.hword 0x0001, 0x0001, 0x0000, 0xfffe, 0xfffb, 0xfff6, 0xfff0, 0xffe8, 0xffe1 
.hword 0xffda, 0xffd6, 0xffd6, 0xffdb, 0xffe6, 0xfff6, 0x0009, 0x001d, 0x002e 
.hword 0x0037, 0x0035, 0x0026, 0x000b, 0xffe6, 0xffbf, 0xffa0, 0xff96, 0xffae 
.hword 0xfff3, 0x006c, 0x011a, 0x01f5, 0x02ec, 0x03e6, 0x04c4, 0x0563, 0x05a3 
.hword 0x0569, 0x04a4, 0x0354, 0x0185, 0xff57, 0xfcf5, 0xfa95, 0xf86f, 0xf6b9 
.hword 0xf59f, 0x7a13, 0xf59f, 0xf6b9, 0xf86f, 0xfa95, 0xfcf5, 0xff57, 0x0185 
.hword 0x0354, 0x04a4, 0x0569, 0x05a3, 0x0563, 0x04c4, 0x03e6, 0x02ec, 0x01f5 
.hword 0x011a, 0x006c, 0xfff3, 0xffae, 0xff96, 0xffa0, 0xffbf, 0xffe6, 0x000b 
.hword 0x0026, 0x0035, 0x0037, 0x002e, 0x001d, 0x0009, 0xfff6, 0xffe6, 0xffdb 
.hword 0xffd6, 0xffd6, 0xffda, 0xffe1, 0xffe8, 0xfff0, 0xfff6, 0xfffb, 0xfffe 
.hword 0x0000, 0x0001, 0x0001, 0x0001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000 
.hword 0x0000, 0x0000, 0x0000 

;.....
; Allocate delay line in (uninitialized) Y data space

		.section .ybss,  "b"
		.align 256

rechazobandaDelay:
		.space rechazobandaNumTaps*2

; .....
; Allocate and intialize filter structure

		.section .data
		.global _rechazobandaFilter

_rechazobandaFilter:
.hword rechazobandaNumTaps
.hword psvoffset(rechazobandaTaps)
.hword psvoffset(rechazobandaTaps)+rechazobandaNumTaps*2-1
.hword psvpage(rechazobandaTaps)
.hword rechazobandaDelay
.hword rechazobandaDelay+rechazobandaNumTaps*2-1
.hword rechazobandaDelay

; ....................................
; ....................................
