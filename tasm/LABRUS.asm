;������, ��3
prog segment
assume CS:prog, DS:data

begin:
	call clscr
;�������� �������� �������� ������
	mov ax, data
	mov DS, ax
	
;��� ������� � ����� �����
CALL GETCH
MOV CX, 3
call clscr
clown:
	MOV DL, AL
	CALL PUTCH
	ADD AL, 1
	LOOP clown
;�������� ����� �������
	call getch

	call clscr		        
;����� �� ���������
	mov al, 0
	mov ah, 4ch
	int 021h
			
;��������� - ����� �������
PUTCH proc
	mov ah, 02h
	int 021h
	ret
PUTCH endp

CLRF DB 0dh,0ah,'$'

;��������� - ������� ������
NEWl proc
	MOV DX, OFFSET CLRF
	MOV AH, 09H
	INT 021H
	RET
NEWl endp 

;��������� - ���� �������
GETCH proc   
	mov ah, 01h
	int 021h
	ret
GETCH endp

;��������� - ������� ������
CLSCR PROC
	MOV AX, 3
	INT 10H
	RET
CLSCR ENDP
prog ends

data segment
let1 db '�'

data ends

end begin
	
