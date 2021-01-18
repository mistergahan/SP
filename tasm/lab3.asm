MYCODE segment 'CODE'
    assume cs:MYCODE, ds:MYCODE
	
	symbolA db '�'
	symbolB db '�'
	symbol� db '�'
	contStr db '��� ��室� �� �ணࠬ�� ������ "q"$'

start:
	; ����㧪� ᥣ���⭮�� ॣ���� ������ DS
     push CS
     pop  DS
	
main:
	; �������⥫쭮� �ॡ������: ���⪠ �࠭�
	call clrscr;
	
	; �뢮� �㪢� �
MOV CX, 3
	mov dl, symbolA
clown:
	call putch
	call clrf
ADD al, 1
LOOP clown
	
	; ����� �� �த������� �ணࠬ��
	mov dx, offset contStr
	call putst
	call clrf
	call getch
	cmp al, 'q'
    je exit 
    jmp main 

exit:
	; �������⥫쭮� �ॡ������: ���⪠ �࠭�
	call clrscr;
	
	; ��室 �� �ணࠬ��
	mov al, 0
	mov ah, 4ch
	int 021h
	
	; ��楤�� - �뢮� ��ப� �� �࠭�
	putst proc
		mov ah, 09h
		int 021h
		ret
	putst endp
	
	; ��楤�� - �뢮� ᨬ����
	putch proc
		mov ah, 02h
		int 021h
		ret
	putch endp

	; ��楤�� - ��ॢ�� ��ப�
	clrf proc
		mov dl, 10
		call putch
		mov dl, 13
		call putch
		ret
	clrf endp 

	; ��楤�� - ���� ᨬ����
	getch proc   
		mov ah, 01h
		int 021h
        ret
	getch endp

	; ��楤�� - ���⪠ �࠭�
	clrscr proc   
		mov ah, 00h 
		mov al, 02
		int 10h
		ret
	clrscr endp
	
; ����� ᥣ����
MYCODE ends
end start
	