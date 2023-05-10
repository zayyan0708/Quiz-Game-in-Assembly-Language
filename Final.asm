TITLE My First Program (Test.asm)    
INCLUDE Irvine32.inc
.data
buffer BYTE 40 DUP(?),0dh,0ah
bufSize DWORD ($-buffer)
errMsg BYTE "Cannot open file",0dh,0ah,0
filename     BYTE "output.txt",0
fileHandle   HANDLE ?			; handle to output file
bytesWritten DWORD ?    			; number of bytes written   ;File VAriables
quesL1 DWORD 10 DUP(?)
quesL2 DWORD 10 DUP(?)
quesL3 DWORD 10 DUP(?)			;QUESTION ADDRESSES
player BYTE "Enter Player Name: ",0
spaces1 BYTE "                  ",0
main_menu BYTE "1. Main program",10,"2. Exit Program",10,"Enter your choice: ",0
arr1 BYTE 1,4,2,2,3,3,1,2,4,3
arr2 BYTE 2,4,3,1,2,2,1,1,1,4
arr3 BYTE 3,4,3,2,4,1,1,1,2,3		;ANSWERS
name1 BYTE 10 DUP(?)
scoreL1 BYTE ?  
scoreL2 BYTE ?  
scoreL3 BYTE ?						;SCORE OF EACH LEVEL 
msg1 BYTE "YOUR LEVEL 1 SCORE: ",0
msg3 BYTE "YOUR LEVEL 2 SCORE: ",0
msg4 BYTE "YOUR LEVEL 3 SCORE: ",0
string1 BYTE "Excellent IQ LEVEL",0
string2 BYTE "FAIR IQ LEVEL ",0
string3 BYTE "POOR IQ LEVEL",0				;IQ STAGING
string4 BYTE 'C','O','N','G','R','A','T','U','L','A','T','I','O','N',' ','L','E','V','E','L',' ','P','A','S','S','E','D',0	;REWARD
string5 BYTE "QUIZ/INTELLIGENCE GAME",0
string6 BYTE "PROJECT BY",0dh,10,"                  Muhammad Zayyan 19K-0182 C",0dh,10,"                  Muhammad Zahid 19K-0334 C",13,10,"                  Ahmed Saeed 19K-0159 C",13,0
string7 BYTE "PRESS ANY KEY TO CONTINUE!!!",0
QuizScore BYTE "YOUR QUIZ SCORE: ",0
finalmsg BYTE "YOUR IQ LEVEL: ",0
Opt BYTE "WHAT DO YOU WANT ? ",0ah,"1:PLAY A QUIZ GAME ",0ah,"2: CALCULATE YOUR IQ ",0ah,"Enter choice: ",0
life BYTE 5		;LIFE FOR PLAYER ONLY IN OPT QUIZ
TotalScore WORD ?
count DWORD 27
QLEVEL3 PROTO, ques3:PTR DWORD, lev3q:PTR BYTE,scor3:BYTE
QLEVEL2 PROTO, ques:PTR DWORD, lev2q:PTR BYTE,scor2:BYTE
QLEVEL1 PROTO, quesA:PTR DWORD, lev1q:PTR BYTE,scor:BYTE		;QUIZ FUNCTIONS
LEVEL1 PROTO, quesA:PTR DWORD, lev1q:PTR BYTE,scor:BYTE
LEVEL2 PROTO, ques:PTR DWORD, lev2q:PTR BYTE,scor2:BYTE
LEVEL3 PROTO, ques3:PTR DWORD, lev3q:PTR BYTE,scor3:BYTE		;IQ FUNCTIONS
;//////ZAYYAN LEVEL 3 QUESTIONS
Level3Q BYTE "Q1).What number is one quarter of one tenth of one fifth of 200? ",0ah,"1) 25",0ah,"2) 20",0ah,"3) 1",0ah,"4) 5",0  
	q1C=($-Level3Q)
		BYTE "Q2).Compare and contrast or classification problems are commonly used to measure intelligence. Which of the five is least like the other four?",0ah,"1) Eel",0ah,"2) Shark",0ah,"3)Dolphin ",0ah,"4)Turtle",0
    q2C=($-Level3Q-q1C)
		BYTE "Q3).The mystery number is between 60 and 150, a multiple of 7, and the sum of its digits is 10. What is the mystery number?",0ah,"1) 63",0ah,"2) 84 ",0ah,"3) 91 ",0ah,"4)82 ",0 ;5    13
    q3C=($-Level3Q-q1C-q2C)
		BYTE "Q4).Two rabbits, butt to butt, start hopping in opposite directions for 2 meters, hop left 3 meters, and then left another 2 meters. What is the distance between them?",0ah,"1) 12 meters",0ah,"2) 6 meters",0ah,"3) 2 meters",0ah,"4) 8 meters",0 ;5
    q4C=($-Level3Q-q1C-q2C-q3C)
		BYTE "Q5).144, 233, 377, 610,?, 1597, 2584. What is the missing number?",0ah,"1) 1110",0ah,"2) 1287",0ah,"3) 961",0ah,"4) 987",0 ;132
	q5C=($-Level3Q-q1C-q2C-q3C-q4C)
		BYTE "Q6).The pinata participant notices she is facing west before blindfolded. She is spun 180 degrees to the left, then 720 degrees to the right.",0ah," In what direction is she now facing?",0ah,"1) East",0ah,"2) North",0ah,"3) South",0ah,"4) West",0
    q6C=($-Level3Q-q1C-q2C-q3C-q4C-q5C)
        BYTE "Q7).2, 10, 12, 60, 62, 310� What is next?",0ah,"1) 312",0ah,"2) 1550",0ah,"3) 360",0ah,"4) 4650",0
    q7C=($-Level3Q-q1C-q2C-q3C-q4C-q5C-q6C)
        BYTE "Q8).What is the largest planet in the solar system?",0ah,"1) Jupiter",0ah,"2) MARS",0ah,"3) Saturn",0ah,"4) Neptune",0
    q8C=($-Level3Q-q1C-q2C-q3C-q4C-q5C-q6C-q7C)
        BYTE "Q9).Which country is reputed to have the world's oldest flag design?",0ah,"1) Sweden",0ah,"2) Denmark",0ah,"3) Germany",0ah,"4) England",0
    q9C=($-Level3Q-q1C-q2C-q3C-q4C-q5C-q6C-q7C-q8C)
        BYTE "Q10).What is the most common blood type in humans?",0ah,"1) B Positive",0ah,"2) Type A",0ah,"3) Type O",0ah,"4) B negative",0
    q10C=($-Level3Q-q1C-q2C-q3C-q4C-q5C-q6C-q7C-q8C-q9C)


;///////ZAHID LEVEL 2 QUESTIONS
Level2Q BYTE "Q1).What will be the next number in series 39,42,48,? ",0ah,"1) 59" ,0ah,"2) 60",0ah,"3) 82",0ah,"4) 23",0  
	q1A=($-Level2Q)
		BYTE "Q2).What number comletes best analogy: 8:4 as 10:",0ah,"1) 30",0ah,"2) 2",0ah,"3) 24",0ah,"4) 5",0
    q2A=($-Level2Q-q1A)
		BYTE "Q3).A bat and a ball together cost $1.10. The bat costs $1 more than the ball. How much does the ball cost?",0ah,"1) 3 cents",0ah,"2) 4 cents ",0ah,"3) 5 cents ",0ah,"4) 6 cents",0 ;5    13
    q3A=($-Level2Q-q1A-q2A)
		 BYTE "Q4).If it takes 5 machines 5 minutes to make 5 widgets, how long would it take 100 machines to make 100 widgets?",0ah,"1) 5 minutes",0ah,"2) 10 minutes",0ah,"3) 20 minutes",0ah,"4) 30 minutes",0 ;5
    q4A=($-Level2Q-q1A-q2A-q3A)
		 BYTE "Q5).At a conference, 12 members shook hands with each other before & after the meeting. How many total number of hand shakes occurred?",0ah,"1) 130",0ah,"2) 132",0ah,"3) 142",0ah,"4) 144",0 ;132
	q5A=($-Level2Q-q1A-q2A-q3A-q4A)
		BYTE "Q6).Forest is to tree as tree is to ?",0ah,"1) Plant",0ah,"2) Leaf",0ah,"3) Branch",0ah,"4) Mangrove",0
	q6A=($-Level2Q-q1A-q2A-q3A-q4A-q5A)
		BYTE "Q7).The day after the day after tomorrow is four days before Monday. What day is it today?",0ah,"1) Monday",0ah,"2) Tuesday",0ah,"3) Wednesday",0ah,"4) Saturday",0
	q7A=($-Level2Q-q1A-q2A-q3A-q4A-q5A-q6A)
		BYTE "Q8).Complete this series of numbers: 9 = 4, 21 = 9, 22 = 9, 24 = 10, 8 = 5, 7 = 5, 99 = 10, 100 = 7, 17 =?",0ah,"1) 9",0ah,"2) 8",0ah,"3) 7",0ah,"4) 6",0
	q8A=($-Level2Q-q1A-q2A-q3A-q4A-q5A-q6A-q7A)
		BYTE "Q9).What is the maximum number of times a single page of a newspaper can be folded in half by hand?",0ah,"1) 1",0ah,"2) 3",0ah,"3) 4",0ah,"4) 6",0
	q9A=($-Level2Q-q1A-q2A-q3A-q4A-q5A-q6A-q7A-q8A)
		BYTE "Q10).If you divide 30 by half and add ten, what do you get?",0ah,"1) 5",0ah,"2) 35",0ah,"3) 65",0ah,"4) 70",0
     q10A=($-Level2Q-q1A-q2A-q3A-q4A-q5A-q6A-q7A-q8A-q9A)

	 ;//////AHMED LEVEL 1 QUESTIONS
;///LEVEL 1 QUESTIONS - AHMED SAEED   
Level1Q BYTE "Q1).How many sides are there in a hexagon?",0ah,"1) 6"	,0ah,"2) 2",0ah,"3) 3",0ah,"4) 5",0   
	 q1=($-Level1Q)											
	   BYTE "Q2).Area of a square with L=4 and B=3",0ah,"1) 7",0ah,"2) 14",0ah,"3) 16",0ah,"4) 12",0		
     q2=($-Level1Q-q1)
	   BYTE "Q3).Name of current president of America",0ah,"1)BArrayAak Obama",0ah,"2)Joe Bidden ",0ah,"3)Trump ",0ah,"4)Henry Clinton",0 ;5    13
     q3=($-Level1Q-q1-q2)
	   BYTE "Q4).If speed of car is 10km/h, how far will it reach in 3 hours?",0ah,"1) 25km",0ah,"2) 30km",0ah,"3) 13km",0ah,"4) 50km",0 ;5
     q4=($-Level1Q-q1-q2-q3)
	   BYTE "Q5).How many continents are there on Earth",0ah,"1) 20",0ah,"2) 15",0ah,"3) 7",0ah,"4) 50",0 ;132
	 q5=($-Level1Q-q1-q2-q3-q4)
	   BYTE "Q6).Who was the first man on moon?",0ah,"1)Lance Armstrong",0ah,"2)George Washington",0ah,"3)Neil Armstrong",0ah,"4)Newton",0
	 q6=($-Level1Q-q1-q2-q3-q4-q5)
	   BYTE "Q7).How many months in a year have 28 days",0ah,"1) 1 ",0ah,"2) 3",0ah,"3) 4",0ah,"4) 1,once in every 4 years",0
	 q7=($-Level1Q-q1-q2-q3-q4-q5-q6)
		BYTE "Q8).Which one of the following produces honey? ",0ah,"1) Wasp",0ah,"2) Bee",0ah,"3) Hornet",0ah,"4) Flying ant",0
	 q8=($-Level1Q-q1-q2-q3-q4-q5-q6-q7)
		BYTE "Q9).If the time is 9pm, and duration of flight is 6 hours, what will be the time at arrival? ",0ah,"1) 2pm",0ah,"2) 6pm",0ah,"3) 9am",0ah,"4) 3am",0
	 q9=($-Level1Q-q1-q2-q3-q4-q5-q6-q7-q8)
		BYTE "Q10).What is the value of 20mod2?",0ah,"1) 10",0ah,"2) 5",0ah,"3) 0",0ah,"4) 1",0
     q10=($-Level1Q-q1-q2-q3-q4-q5-q6-q7-q8-q9)


.code
main PROC
mov eax,black+(gray*16)
call settextcolor
;///////FILING - APPEND MODE////////////////
;;START OF PROGRAM
mov edx,offset player
call writestring
mov edx,offset buffer
mov ecx,sizeof buffer
call readstring
INVOKE CreateFile,
ADDR filename, GENERIC_WRITE, DO_NOT_SHARE, NULL,
OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0
mov fileHandle,eax			; save file handle
.IF eax == INVALID_HANDLE_VALUE
mov  edx,OFFSET errMsg		; Display error message
call WriteString							
.ENDIF
; Move the file pointer to the end of the file
INVOKE SetFilePointer,
fileHandle,0,0,FILE_END
; Append text to the file
INVOKE WriteFile,
fileHandle, ADDR buffer, bufSize,
ADDR bytesWritten, 0
INVOKE CloseHandle, fileHandle	;FILING
call spaces
mov edx,offset string5
call writestring
call crlf
call spaces
mov edx,offset string6
call writestring
call crlf
call spaces
mov edx,offset string7
call writestring
call crlf
call readchar
call clrscr								;MAIN MENU
mov eax,0
mov esi,0
mov quesL1[esi],q1
mov quesL1[esi+4],q2
mov quesL1[esi+8],q3
mov quesL1[esi+12],q4
mov quesL1[esi+16],q5
mov quesL1[esi+20],q6
mov quesL1[esi+24],q7
mov quesL1[esi+28],q8
mov quesL1[esi+32],q9
mov quesL1[esi+36],q10	
mov esi,0
mov quesL2[esi],q1A
mov quesL2[esi+4],q2A
mov quesL2[esi+8],q3A
mov quesL2[esi+12],q4A
mov quesL2[esi+16],q5A
mov quesL2[esi+20],q6A
mov quesL2[esi+24],q7A
mov quesL2[esi+28],q8A
mov quesL2[esi+32],q9A
mov quesL2[esi+36],q10A
mov esi,0
mov quesL3[esi],q1C
mov quesL3[esi+4],q2C
mov quesL3[esi+8],q3C
mov quesL3[esi+12],q4C
mov quesL3[esi+16],q5C
mov quesL3[esi+20],q6C
mov quesL3[esi+24],q7C
mov quesL3[esi+28],q8C
mov quesL3[esi+32],q9C
mov quesL3[esi+36],q10C						;ADDRESSES STORED

call clrscr
mov edx,offset Opt
call WriteString
Call ReadDec							
cmp eax,1
je Quiz   ;///PLAYERS JUMPS TO QUIZ IF CHOICE==1





;///CALLING IQ LEVEL FUNCTIONS////////
INVOKE LEVEL1,ADDR quesL1,ADDR Level1Q,scoreL1
mov ax,1000
call Delay 
call clrscr
INVOKE LEVEL2,ADDR quesL2,ADDR Level2Q,scoreL2
mov ax,1000
call Delay
call clrscr
INVOKE LEVEL3,ADDR quesL3,ADDR Level3Q,scoreL3
call clrscr


mov ax,0
mov al,scoreL1
push ax
mov al,scoreL2
push ax
mov al,scoreL3
push ax
call Percentage   ;//PERCENTAGE FUNCTION TO CALCULATE PERCENTAGE OF IQ
mov ax,TotalScore
push eax
call standing
jmp exi



Quiz:				;QUIZ FUNCTIONS CALLED
INVOKE QLEVEL1,ADDR quesL1,ADDR Level1Q,scoreL1
mov ax,1000
call Delay
call clrscr
mov al,life
cmp al,0
je I1
call Crlf
call reward
call crlf
mov ax,2000
call Delay 
call clrscr

INVOKE QLEVEL2,ADDR quesL2,ADDR Level2Q,scoreL2
mov ax,1000
call Delay
call clrscr
mov al,life
cmp al,0
je I2
;call Crlf
call reward
;call crlf
mov ax,2000
call Delay
call clrscr 

INVOKE QLEVEL3,ADDR quesL3,ADDR Level3Q,scoreL3
mov ax,1000
call Delay
call clrscr
mov al,life
cmp al,0
je I3
;call Crlf
call reward
call crlf
mov ax,2000
call Delay 
call clrscr
mov eax,0
mov al,scoreL1
add al,scoreL2
add al,scoreL3
call Crlf
mov edx,offset QuizScore
call WriteString
call WriteDec
call Crlf
jmp exi
I1:
call clrscr
mov eax,0
mov al,scoreL1
call crlf
mov edx,offset QuizScore
call WriteString
call WriteDec
call Crlf
jmp exi

I2:
mov eax,0
mov al,scoreL1
add al,scoreL2
call Crlf
mov edx,offset QuizScore
call WriteString
call WriteDec
call Crlf
jmp exi
I3:
mov eax,0
mov al,scoreL1
add al,scoreL2
add al,scoreL3
call Crlf
mov edx,offset QuizScore
call WriteString
call WriteDec
call Crlf
exi:
exit
main ENDP

;///MAIN END



;//FUNCTIONS DEFINED

reward Proc		;//REWARD WILL BE DISPLAYED AFTER PLAYER CROSSES LEVEL
pushad
mov dl,60
mov dh,20
call gotoxy
mov ebx,0
mov esi,0
L5:
cmp ebx,count
jz Rw
mov al,string4[esi]
call WriteChar
mov eax,150
call Delay
inc esi
dec count
jmp L5
Rw:

mov eax,27
mov count,eax
mov eax,0
popad
ret
reward ENDP





Percentage Proc
push ebp
mov ebp,esp
mov eax,0
mov ax,[ebp+8]		;RESTORING SCORES FROM STACK
add ax,[ebp+10]
add ax,[ebp+12]
mov bx,100
mul bx
mov bx,60
div bx
mov TotalScore,ax
mov edx,offset finalmsg
call WriteString
mov ax,TotalScore
call writedec
mov al,'%'
call WriteChar
call Crlf
pop ebp
ret 
Percentage ENDP





LEVEL3 PROC, ques3:PTR DWORD, lev3q:PTR BYTE,scor3:BYTE
pushad
mov edi,ques3
mov ebp,lev3q
mov esi,offset arr3
mov ebx,0
mov ecx,10
L3:
mov edx,ebp
call writestring
call crlf
add ebp,[edi]
add edi,4
call readdec
cmp al,[esi]
JNE E1
add bl,3
E1:
inc esi
loop L3
call crlf
mov edx,offset msg4
call writestring
mov al,bl
call writedec
mov scoreL3,bl
mov scor3,0
popad
ret
LEVEL3 ENDP




LEVEL2 PROC, ques:PTR DWORD, lev2q:PTR BYTE,scor2:BYTE
pushad
mov edi,ques
mov ebp,lev2q
mov esi,offset arr2
mov ebx,0
mov ecx,10
L2:
mov edx,ebp
call writestring
call crlf
add ebp,[edi]
add edi,4
call readdec
cmp al,[esi]
JNE E1
add bl,2
E1:
inc esi
loop L2
call crlf
mov edx,offset msg3
call writestring
mov al,bl
call writedec
mov scoreL2,bl
mov scor2,0
popad
ret
LEVEL2 ENDP



LEVEL1 PROC, quesA:PTR DWORD, lev1q:PTR BYTE,scor:BYTE
pushad
mov edi,quesA
mov ebp,lev1q
mov esi,offset arr1
mov ebx,0
mov ecx,10
L7:
mov edx,ebp
call writestring
call crlf
add ebp,[edi]
add edi,4
call readdec
cmp al,[esi]
JNE K1
inc bl
K1:
inc esi
loop L7
call crlf
mov edx,offset msg1
call writestring
mov al,bl
call WriteDec
mov scoreL1,bl
mov scor,0
popad
ret
LEVEL1 ENDP




;//////LEVEL 3 QUESTIONS
QLEVEL3 PROC, ques3:PTR DWORD, lev3q:PTR BYTE,scor3:BYTE
pushad
mov edi,ques3
mov ebp,lev3q
mov esi,offset arr3
mov ebx,0
mov ecx,10
L3:
mov edx,ebp
call writestring
call crlf
add ebp,[edi]
add edi,4
call readdec
cmp al,[esi]
JNE E1
add bl,3
jmp E2
E1:
dec life
mov al,life
cmp al,0
je S 
E2:
inc esi
loop L3
S:
call crlf
mov edx,offset msg4
call writestring
mov al,bl
call writedec
mov scoreL3,bl
mov scor3,0
popad
ret
QLEVEL3 ENDP

;/////LEVEL 2 QUESTIONS
QLEVEL2 PROC, ques:PTR DWORD, lev2q:PTR BYTE,scor2:BYTE
pushad
mov edi,ques
mov ebp,lev2q
mov esi,offset arr2
mov ebx,0
mov ecx,10
L2:
mov edx,ebp
call writestring
call crlf
add ebp,[edi]
add edi,4
call readdec
cmp al,[esi]
JNE E1
add bl,2
jmp E2
E1:
dec life
mov al,life
cmp al,0
je S2
E2:
inc esi
loop L2
S2:
call crlf
mov edx,offset msg3
call writestring
mov al,bl
call writedec
mov scoreL2,bl
mov scor2,0
popad
ret
QLEVEL2 ENDP


;//////LEVEL 1 QUESTIONS
QLEVEL1 PROC, quesA:PTR DWORD, lev1q:PTR BYTE,scor:BYTE
pushad
mov edi,quesA
mov ebp,lev1q
mov esi,offset arr1
mov ebx,0
mov ecx,10
L7:
	mov edx,ebp
	call writestring
	call crlf
	add ebp,[edi]
	add edi,4
call readdec
cmp al,[esi]
JNE K1
inc bl
jmp K2
K1:
dec life
mov al,life
cmp al,0
je S3
K2:
inc esi
loop L7
S3:
call crlf
mov edx,offset msg1
call writestring
mov al,bl
call WriteDec
mov scoreL1,bl
mov scor,0
popad
ret
QLEVEL1 ENDP

;//////IQ STANDING
standing PROC
push ebp
mov ebp,esp
mov eax,[ebp+8]
mov TotalScore,ax
cmp TotalScore,100
JE EQUAL
cmp TotalScore,60
JGE GREATER
mov edx,offset string3
call crlf
call writestring
call crlf
exit
EQUAL:
mov edx,offset string1
call crlf
call writestring
call crlf
exit
GREATER:
mov edx, offset string2
call crlf
call writestring
call crlf
pop ebp
ret
standing endp

spaces PROC
call crlf
call crlf
call crlf
mov edx,offset spaces1
call writestring
ret
spaces endp

END main
