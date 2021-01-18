MYCODE SEGMENT 'CODE'
    ASSUME CS:MYCODE, DS:MYCODE

;let db 'А'

START:
; Загрузка сегментного регистра данных DS
     PUSH CS
     POP  DS
;вот введите с клавы букву
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
;ожидание ввода символа
	call getch

	CALL CLSCR
; Вывод одного символа на экран
     MOV AH, 02
     MOV DL, 'A'
     INT 21H

CLRF DB 0dh,0ah,'$'

;процедура - перевод строки
NEWl proc
	MOV DX, OFFSET CLRF
	MOV AH, 09H
	INT 021H
	RET
NEWl endp 

;процедура - очистка экрана
CLSCR proc
	MOV AX, 3
	INT 10H
	RET
CLSCR endp

;процедура - ввод символа
GETCH proc   
	mov ah, 01h
	int 021H
	ret
GETCH endp

;процедура - вывод символа
PUTCH proc
	mov ah, 02h
	int 021h
	ret
PUTCH endp

; Ожидание завершения программы
    MOV AH, 01H
    INT 021H
; Выход из программы
     MOV AL, 0
     MOV AH, 4CH
     INT 21H
MYCODE ENDS

END START