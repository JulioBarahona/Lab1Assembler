	/* ***************************************************************** 
   main random.s
   archivo main para el laboratorio
   JORGE AZMITIA 15202
   JULIO BARAHONA 141206
   
   ***************************************************************** */

/**
@no se si este codigo esta bien comentado   
.data
.align 2

datoIng:		.word	0 @Dato ingresado por el usuario
formatos:		.asciz	"%d"
stringIngreso:	.asciz	"Ingrese la semilla para generar los numeros:"
bienvenida:		.asciz	"Bienvenid@! Este programa calcula numeros pseudo aleatorios tomando una base ingresada por el usuario"
error:			.asciz	"Error, el dato ingresado debe ser un numero (decimal). Intente nuevamente."
semilla: .word 0

@ este va a ser el vector grande vector: space 4194304 
@este es el de prueba

/**
Tamano de vector = 40
**/
vector: .space 40

.text
.align 2
****/

.global main
.func main

main:
	
	@Bienvenida al programa
	ldr r0, =bienvenida
	bl puts


	@Ingreso de datos del usuario
	ingresoDatos:
		ldr r0,=stringIngreso
		bl puts
		ldr r0,=formatos
		ldr semilla
		bl scanf


	cmp r0,#0
	bne calculo
	bl getchar	@sirve para que el programa lea <enter> para continuar
	ldr r0,=error
	bl puts
	b ingresoDatos
	
@---------------------------------- ENTRA A SUBRUTINA lsfr------------------------------------------------
	calculo:
	ldr r0,=vector
	mov r1,#4194304
	mov r2,=semilla
	mov r2,[r2]
	bl lsfr
@---------------------------------- ENTRA A SUBRUTINA min------------------------------------------------
    ldr r0,=vector
	mov r1,#4194304
	bl min

@---------------------------------- ENTRA A SUBRUTINA max------------------------------------------------
	ldr r0,=vector
	mov r1,#4194304
	bl max

@---------------------------------- ENTRA A SUBRUTINA avg------------------------------------------------
	ldr r0,=vector
	mov r1,#4194304
	bl avg

@---------------------------------- ENTRA A SUBRUTINA norm------------------------------------------------
	ldr r0,=vector
	mov r1,#4194304
	bl avg
@----------------------------------Entra A SUBRUTINA printvec------------------------------------------------
	ldr r0,=vector
	mov r1,#4194304
	bl printvec


	MOV R7, #1				@ Exit Syscall
	SWI 0