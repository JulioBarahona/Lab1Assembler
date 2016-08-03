/* ***************************************************************** 
   subrutinas
   Subrutina que calcula los random, el maximo, el minimo, normaliza el vector, y lo imprime
   
  
   ***************************************************************** */


.global lsfr
.global min
.global max
.global avg
 
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
	@en r0 viene la direccion del vector que se usara para recorrerlo
	@en r1 se guarda el valor actual del vector
	@en r2 es el minimo temporal
	@en s2 el temporal
	@en r3 va el contador para ver todas las posiciones del vector
	@en r4 esta el tamaño del vector, que se pasa de r1
	mov r2,#0
	mov r3,#0
	mov r4,r1
	vmov s2,#0
	
	ciclominimo:
	vldr s0,[r0],#1 @va pasando en todas las posiciones del vector
	vcmp.F32 s0,s2  @lo mismo que abajo solo que para registros S
	vmrs APSR_nzcv, FPSCR @banderas
	@cmp r2,r1      @compara el valor actual del vector con el temporal, que inicia siendo 0 
	vmovlt s2,s0
	vmov s0,#0     @limpia el actual 
	@movgt r2,r1    @si el temporal es mayor que el actual del vector, pasa el del vector al temporal minimo 
	add r3,r3,#1   @aumenta el contador
	cmp r3,r4 @recorre las 2^20 posiciones del vector 
	blt ciclominimo
	
	@retorna en r0 el valor minimo de el vector 
	
	@convertimos el s2 a un D para luego convertirlo en un r (esto me da duda, pero lo tomo de las presentaciones que nos han dado )
	vcvt.F64.F32 d9,s2
	vcvt.S32.d64 r2,d9	
	mov r0,r2 
	pop {pc}
	
	
@Comienzo subrutina max
max:
push {lr}
	@en r0 viene la direccion del vector que se usara para recorrerlo
	@en r1 se guarda el valor actual del vector
	@en r2 es el minimo temporal
	@en s2 el temporal
	@en r3 va el contador para ver todas las posiciones del vector
	@en r4 esta el tamaño del vector, que se pasa de r1
	mov r2,#0
	mov r3,#0
	mov r4,r1
	vmov s2,#0
	
	ciclomax:
	vldr s0,[r0],#1 @va pasando en todas las posiciones del vector
	vcmp.F32 s0,s2  @lo mismo que abajo solo que para registros S
	vmrs APSR_nzcv, FPSCR @banderas
	@cmp r2,r1      @compara el valor actual del vector con el temporal, que inicia siendo 0 
	vmovgt s2,s0
	vmov s0,#0     @limpia el actual 
	@movgt r2,r1    @si el temporal es menor que el actual del vector, pasa el del vector al temporal maximo 
	add r3,r3,#1   @aumenta el contador
	cmp r3,r4 @recorre las 2^20 posiciones del vector 
	blt ciclomax
	
	@retorna en r0 el valor minimo de el vector 
	
	@convertimos el s2 a un D para luego convertirlo en un r (esto me da duda, pero lo tomo de las presentaciones que nos han dado )
	vcvt.F64.F32 d9,s2
	vcvt.S32.d64 r2,d9	
	mov r0,r2 
	pop {pc}
	
	
	@Comienzo subrutina avg
avg:
push {lr}
	@en r0 viene la direccion del vector que se usara para recorrerlo
	@en r1 se guarda el valor actual del vector
	@en r2 es la suma temporal
	@en s2 el suma temporal
	@en r3 va el contador para ver todas las posiciones del vector
	@en r4 esta el tamaño del vector, que se pasa de r1
	mov r2,#0
	mov r3,#0
	mov r4,r1
	vmov s2,#0
	
	ciclosuma:
	vldr s0,[r0],#1 @va pasando en todas las posiciones del vector
	vadd.F32 s0,s0,s2 
	add r3,r3,#1   @aumenta el contador
	cmp r3,r4 @recorre las 2^20 posiciones del vector 
	blt ciclosuma
	@retorna en r0 el valor minimo de el vector 
	@convertimos el s2 a un D para luego convertirlo en un r (esto me da duda, pero lo tomo de las presentaciones que nos han dado )
	vcvt.F64.F32 d9,s2
	vcvt.S32.d64 r2,d9	
	mov r0,r2 
	pop {pc}
@Comienzo subrutina norm

norm:
push {lr}
	
	pop {pc}

@Comienzo subrutina printVec
printVec:
push {lr}
	
	pop {pc}
