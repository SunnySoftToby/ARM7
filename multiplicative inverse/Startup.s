        GLOBAL	Reset_Handler
		AREA 	Reset, CODE, READONLY
        ENTRY
		
Reset_Handler	
step1				; ans of (17^-1) mod 3120 should be 0xAC1(2753) 
		MOV r4 , #17; r4 = T = 17 = B
		MOV r5 , #3120 ; r5 = N = 3120 = A
		MOV r3, r5 ; store N for return value
		MOV r6, #1 ; r6 = X = 1 initial value
		MOV r7 ,#0 ; r7 = X' = 0 initial value
		
		
step2
		MOV r1 , #0 ; quotient 
mod1	
		CMP r5 ,r4
		BLT step3
		ADD r1 , r1 ,#1 ; r1 will have the quotient value
		SUB r5 , r5 ,r4  ; r5 will have the remainer resule
		B mod1;
step3
		CMP r5, #0
		BNE step4	; if R(r5) !=0 then goto step 4
		CMP r6 , #0
		BGE stop	; if X >=0 then just return X (r6)
		ADD r6 , r6 , r3 ; if X < 0 then return value X + N
		B stop
			
step4
		MOV r9 , r5 ; temp value for A
		MOV r5, r4  ;  A <- B
		MOV r4, r9   ;  B <- R
		MOV r9 , r7; temp value for X'
		MOV r7, r6 ;	x' <- x
		MUL r6, r1,r6 ; calculate Q*X
		SUB r6, r9, r6; X = X' - Q * X note: here X' is the one before updated; 
		B step2 ; go back to step2
		
		
stop    B       stop                  
        END