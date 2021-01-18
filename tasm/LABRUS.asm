;Карпов, ЛР3
prog segment
assume CS:prog, DS:data

begin:
	call clscr
;загрузка регистра сегмента данных
	mov ax, data
	mov DS, ax
	
;вот введите с клавы букву
CALL GETCH
MOV CX, 3
call clscr
clown:
	MOV DL, AL
	CALL PUTCH
	ADD AL, 1
	LOOP clown
;ожидание ввода символа
	call getch

	call clscr		        
;выход из программы
	mov al, 0
	mov ah, 4ch
	int 021h
			
;процедура - вывод символа
PUTCH proc
	mov ah, 02h
	int 021h
	ret
PUTCH endp

CLRF DB 0dh,0ah,'$'

;процедура - перевод строки
NEWl proc
	MOV DX, OFFSET CLRF
	MOV AH, 09H
	INT 021H
	RET
NEWl endp 

;процедура - ввод символа
GETCH proc   
	mov ah, 01h
	int 021h
	ret
GETCH endp

;процедура - очистка экрана
CLSCR PROC
	MOV AX, 3
	INT 10H
	RET
CLSCR ENDP
prog ends

data segment
let1 db 'А'

data ends

end begin
	
