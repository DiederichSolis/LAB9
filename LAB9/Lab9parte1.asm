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
	msg3 db "Ingrese el monoto facturado",0AH,0

.code
    includelib libucrt.lib
    includelib legacy_stdio_definitions.lib
    includelib libcmt.lib
    includelib libvcruntime.lib

    extrn printf:near
    extrn scanf:near
    extrn exit:near

public main
main proc
	
	mov ebx, offset arr
	mov esi, sizeof	arr

ingreso:
	push offset msg3	
	call printf			
	
	lea eax, [ebx]		; DIRECCIONAM. INDIRECTO: Cargar el valor del i-esimo elem de array a eax 
	push eax			; Pasar valor a pila p/imprimir
	push offset fmt		; Pasar formato 
	call scanf
	
	add ebx, 4			; Decrementar "contador"
	sub esi, 4			; Moverse al sig. elem. del array
	cmp esi,0	 
	jne ingreso


label1:
	mov eax, ebx		; DIRECCIONAM. INDIRECTO: Cargar el valor del i-esimo elem de array a eax 
	push eax			; Pasar valor a pila p/imprimir
	push offset fmt		; Pasar formato 
	call printf

	sub ebx, 4			; Decrementar "contador"
	add esi, 4			; Moverse al sig. elem. del array
	cmp ebx,0			; Aún hay elementos en el array?
	jne label1			; Sí, entonces repetir proceso desde label1

	push offset msg2	; Guarda en pila el valor de dirección inicial de msg2
	call printf			; Llamado a printf

	push 0
    call exit           ; salir del programa

main endp
end