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


;Variables	
	

	divisor dword 20
	suma dword 0
	Total dword 0
	NIT dword 0
	IVA dword 0


.code ; Sección de código

.code ; 
;Librerias

    includelib libucrt.lib ; 
    includelib legacy_stdio_definitions.lib ; 
    includelib libcmt.lib ; 
    includelib libvcruntime.lib ; 

	extrn printf:near
	extrn scanf:near
	extrn exit:near


public main 
main proc 

	mov ebx, offset arrvalue
	mov esi, sizeof arrvalue

	push offset msg_inNIT					; Coloca la direc. de la cadena de caracteres en la pila
	call printf								; Imprimir mensaje para ingreso de dato

	add esp, 4								; Limpia la pila
	lea eax, [ebp-4]						; Obtiene la dirección de la variable local
	push eax								; Pone la dirección en la pila
	push offset dato1						; Pone la dirección de la cadena de formato en la pila
	call scanf								; Llama a la función scanf para leer el número ingresado
	add esp, 8								; Limpia la pila
	mov eax, [ebp-4]						; Mueve el número ingresado a eax
	mov NIT, eax
	push eax								; Pone el número en la pila

	push offset msgE					; Coloca la direc. de la cadena de caracteres en la pila
	call printf								; Imprimir mensaje para ingreso de dato
	add esp, 8								; Limpia la pila

	push offset msg_in						; Coloca la direc. de la cadena de caracteres en la pila
	call printf								; Imprimir mensaje para ingreso de dato
	
	label1: 

	push offset msgx		 ; Coloca la direc. de la cadena de caracteres en la pila
	call printf	

	lea eax, [ebx]							; Obtiene la dirección de la variable local
	push eax								; Pone la dirección en la pila
	push offset fmt							; Pone la dirección de la cadena de formato en la pila
	add Total, eax
	call scanf								; Llama a la función scanf para leer el número ingresado

	add ebx, 4 
	sub esi, 4
	cmp esi, 0
	JNE label1

	push offset msgE
	call printf 

	.IF Total > 150000
		push offset msgTrue
		call printf

	.ELSE 
		push offset msgFalse
		call printf

	.ENDIF

	push offset msgE
	call printf  
	
mov esi, offset arrvalue
mov ebx, sizeof arrvalue

mov edi, offset arrMes

