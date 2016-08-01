	/* ***************************************************************** 
   main random.s
   
   ***************************************************************** */

/**
@no se si este codigo esta bien comentado   
.data
.align 2

datoPromedio:	.word	0 @Almacena el promedio de los dos numeros
formatop:		.asciz	"El promedio de los numeros es: %d  \n"
datoIng:		.word	0 @Dato ingresado por el usuario
dato2:			.word	5

formatos:		.asciz	"%d"
stringIngreso:	.asciz	"Ingrese la semilla para generar los numeros:"
bienvenida:		.asciz	"Bienvenid@! Este programa calcula numeros pseudo aleatorios tomando una base ingresada por el usuario"
error:			.asciz	"Error, el dato ingresado es incorrecto. Intente nuevamente."
semilla: .word 0
@ este va a ser el vector grande vector: space 4194304 
@este es el de prueba
vector: .space 40
.text
.align 2
****/

/**

MOVS   r0,r0,lsl #1
EORCC  r0,r0,#1<<31-14
EORMI  r0,r0,#1<<31-14

@ posible forma del lsfr 
**/
.global main
.func main

main:
	stmfd sp!,{lr}
	
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



	
	
	
	@Calculo y despliegue del promedio
@---------------------------------- ENTRA A SUBRUTINA------------------------------------------------
	calculo:

ldr r0,=vector
mov r1,#4194304
mov r2,=semilla
mov r2,[r2]
bl lsfr



	
		
	MOV R7, #1				@ Exit Syscall
	SWI 0