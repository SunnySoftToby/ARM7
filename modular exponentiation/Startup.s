        GLOBAL	Reset_Handler
		AREA 	Reset, CODE, READONLY
        ENTRY
		
Reset_Handler	
; test data: 487^1000 mod 489 = 373 (0x175)
		LDR r4, =487	;r4 = 487 = A
		LDR r5, =1000	;r5 = 1000 = B
		LDR r6, =489 	;r6 = 489 = C
		
step1
		MOV r7, #1		;r7 = 1 = S invitial value
		
step2
		MOV r1, #32	; at most 32 iteration
loop
		CMP r1 , #0
		BEQ stop
		
		
		MOV r2, r7		; temp s
		MUL r7, r2 ,r7 ; S <- S * S mod C 
mod1
		CMP r7, r6
		BLT ifpart
		SUB r7, r6
		B mod1
ifpart
		ANDS r2, r5 , #0x80000000 ; check the most left bit of b
		SUB r1 , r1 ,#1
		LSL r5 , r5 ,1;
		BEQ loop
		
		MUL r7, r4 , r7 ; S <- A * S mod C if the most left bit of b is 1
mod2
		CMP r7,r6;
		BLT loop
		SUB r7,r7,r6
		B mod2
		
		
stop    B       stop                  ; branch, stop program
        END