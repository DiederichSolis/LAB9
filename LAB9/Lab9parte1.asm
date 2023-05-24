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


.386 ; 
.model flat, stdcall, c ; 
.stack 4096 ; 

ExitProcess proto,dwExitCode:dword ;

.data 

;Arreglos
	arrvalue dword 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	arrIva dword 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	arrMes BYTE 'Ene23',0,'Feb23',0,'Mar23',0,'Abr23',0,'May23',0,'Jun23',0,'Jul23',0,'Ago23',0,'Sep23',0,'Oct23',0,'Nov23',0,'Dic23',0

;Formatos
	dato1 db "%d", 0
	fmt db "%d ", 0AH,0
	fmtPrueba BYTE "| %s | %d  | %d  |   %d   |", 0Ah, 0
;Mensajes
	msgTrue BYTE 'Cambiar de regimen a IVA general', 0Ah, 0
	msgFalse BYTE 'Sigue siendo pequenio contribuyente', 0Ah, 0
	msg_in byte "Ingresar monto facturado: ",0Ah, 0
	msg_inNIT byte "Ingresar el NIT con el que facturara: ", 0
	msgE db " ", 0ah, 0
	msg2 db "|  MES  |    NIT   |  IVA  | FACTURADO | ",0AH, 0
	msgx BYTE 'Monto facturado del mes: ', 0Ah,0
