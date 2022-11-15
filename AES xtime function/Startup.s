        GLOBAL	Reset_Handler
		AREA 	Reset, CODE, READONLY
Reset_Handler
		ENTRY
		; test data is xtime(D4) = B3  (ans store in r1)
		MOV r0 , #0xD4 		; r0 = 0xD4 = input
		
		LSL r0 , r0 , #1	; shift b left one bit
		MOV r1, r0 ;		
		AND r1 , r1, #0xFF	;clear the 8th bit
		ANDS r2, r0, #0x100 ; check 8th bit is 1 or not
		BEQ Done			; if 8th bit is zero then done
		EOR r1, r1 , #0x1B	; else to XOR with 1B
		
		
Done    B Done;
		
		END
