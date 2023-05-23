;Universidad del Valle de Guatemala
;Diederich Solis 22952
;Andy Fuentes 22944
;
;Descripcion: programa con informacion de 12 facturas de una empresa
;donde por cada mes se le calcula el IVA
;
;Laboratorio 9 
;
;Catedratico: Roger Fuentes
;Fecha de entrega: 24/05/2023


.386
.model flat, stdcall, c
.stack 4096

ExitProcess proto,dwExitCode:dword

.data
	arr dword 0,0,0,0,0,0,0,0,0,0,0,0
	fmt db "%d", 0
	msg1 db "El array contiene los siguientes elementos:",0AH, 0
	msg2 db "Fin del array",0AH, 0
	msg3 db "Ingrese el monto facturado: ",0AH,0

.code
    includelib libucrt.lib
    includelib legacy_stdio_definitions.lib
    includelib libcmt.lib
    includelib libvcruntime.lib

    extrn printf:near
    extrn scanf:near
    extrn exit:near

