/* ***************************************************************** 
   subrutinas
   Subrutina que calcula el promedio de dos numeros
   
   Uso de registros:
   r0: envio de parametros para subrutinas promedio, printf, scanf, puts
   r1: envio de parametros para subrutinas promedio, printf, scanf
   ***************************************************************** */
.text
.align 2

@Subrutina que calcula el promedio de dos numeros y devuelve el promedio 
@Parametros de entrada:
@r0: numero 1
@r1: numero 2

@Parametros de salida
@r0: promedio

.global promedio

promedio:
	push {lr}
	add r0,r0,r1
	lsr r0,#1	@division entre 2
	pop {pc}
 
@Comienzo subrutina lsfr
lsfr:
push {lr}
	
@r0 tiene la direccion del vector
@r1 tiene el tamaño del vector 
@r2 tiene la semilla 

ciclo:


and r4,r2,#1
lsr r2,r2 #1






bne




	pop {pc}
@Comienzo subrutina min
min:
push {lr}
	
	pop {pc}
@Comienzo subrutina max
max:
push {lr}
	
	pop {pc}
@Comienzo subrutina avg
avg:
push {lr}
	
	pop {pc}
@Comienzo subrutina norm
norm:
push {lr}
	
	pop {pc}

@Comienzo subrutina printVec
printVec:
push {lr}
	
	pop {pc}
