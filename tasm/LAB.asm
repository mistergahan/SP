MYCODE SEGMENT 'CODE'
    ASSUME CS:MYCODE, DS:MYCODE

;let db '�'

START:
; �������� ����������� �������� ������ DS
     PUSH CS
     POP  DS
;��� ������� � ����� �����
CALL GETCH
PUSH AX
MOV CX, 3
;CALL CLSCR
clown:
	POP AX
	PUSH AX
	MOV DL, AL
	CALL PUTCH
	CALL NEWl
	POP AX
	ADD AL, 1
	PUSH AX
	LOOP clown
;�������� ����� �������
	call getch

	CALL CLSCR
; ����� ������ ������� �� �����
     MOV AH, 02
     MOV DL, 'A'
     INT 21H

CLRF DB 0dh,0ah,'$'

;��������� - ������� ������
NEWl proc
	MOV DX, OFFSET CLRF
	MOV AH, 09H
	INT 021H
	RET
NEWl endp 

;��������� - ������� ������
CLSCR proc
	MOV AX, 3
	INT 10H
	RET
CLSCR endp

;��������� - ���� �������
GETCH proc   
	mov ah, 01h
	int 021H
	ret
GETCH endp

;��������� - ����� �������
PUTCH proc
	mov ah, 02h
	int 021h
	ret
PUTCH endp

; �������� ���������� ���������
    MOV AH, 01H
    INT 021H
; ����� �� ���������
     MOV AL, 0
     MOV AH, 4CH
     INT 21H
MYCODE ENDS

END START