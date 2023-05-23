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
	arrMes BYTE 'Enero',0,'Febrero',0,'Marzo',0,'Abril',0,'Mayo',0,'Junio',0,'Julio',0,'Agosto',0,'Septiembre',0,'Octubre',0,'Noviembre',0,'Diciembre',0

