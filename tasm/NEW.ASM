MYCODE SEGMENT 'CODE'
    ASSUME CS:MYCODE, DS:MYCODE

;let db '�'

START:
; ����㧪� ᥣ���⭮�� ॣ���� ������ DS
     PUSH CS
     POP  DS
;��� ������ � ����� �㪢�
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
;�������� ����� ᨬ����
	call getch

	CALL CLSCR
; �뢮� ������ ᨬ���� �� ��࠭
     MOV AH, 02
     MOV DL, 'A'
     INT 21H

CLRF DB 0dh,0ah,'$'

;��楤�� - ��ॢ�� ��ப�
NEWl proc
	MOV DX, OFFSET CLRF
	MOV AH, 09H
	INT 021H
	RET
NEWl endp 

;��楤�� - ���⪠ ��࠭�
CLSCR proc
	MOV AX, 3
	INT 10H
	RET
CLSCR endp

;��楤�� - ���� ᨬ����
GETCH proc   
	mov ah, 01h
	int 021H
	ret
GETCH endp

;��楤�� - �뢮� ᨬ����
PUTCH proc
	mov ah, 02h
	int 021h
	ret
PUTCH endp

; �������� �����襭�� �ணࠬ��
    MOV AH, 01H
    INT 021H
; ��室 �� �ணࠬ��
     MOV AL, 0
     MOV AH, 4CH
     INT 21H
MYCODE ENDS

END START
