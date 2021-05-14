TITLE Project (Coal Project.asm)
INCLUDE Irvine32.inc
.data
projectname byte "PLAGIRISM CHECK BY FREQUENCY",0
groupname byte "GROUP 14 : ",0
name1 byte "''Usama''  [19k-1459]",0
name2 byte "''Sameer'' [19k-1526]",0
name3 byte "''Ali''    [19k-1404]",0
sum_of_the_find_tripltes1 dword ?
plag byte "Plagarism Found (1,2) is: ",0
plag1 byte "Plagarism Found (1,3) is: ",0
plag_percent byte "%",0 
arr byte 200 dup(?)
spaces dword 0
count dword 0
characters dword 0
store byte 50 dup(?)
temp byte 50 dup(?)
temp1 dword ?
file1 byte "FILE1.txt",0
filehandle1 Dword ?
file2 byte "FILE2.txt",0
file3 byte "FILE3.txt",0
filehandle3 dword ?
filehandle2 Dword ?
msg1 byte "---------------------------------------- File 1-----------------------------------------------",0
msg2 byte "---------------------------------------- File 2-----------------------------------------------",0
msg33 byte "How many words you want to search:",0
msg3 byte "---------------------------------------- File 3-----------------------------------------------",0
msg444 byte"----------------------------------------Palgarism Percentage in Files-----------------------------------------------",0
string1 byte 5000 Dup(?)
string2 byte 5000 Dup(?)
string3 byte 5000 Dup(?)
len1 dword ?
len2 dword ? 
len3 dword ? 
lenw dword ?
Word_find1 dword 0
Word_find2 dword 0
No_of_triplets dword 0
sum_of_the_find_tripltes dword 0
col byte ?
row byte ?

.code
main PROC
	call Start
	call readchar
	call clrscr
	mov edx,0
	call Input_from_File_One
	call Input_from_File_TWO
	call Input_from_File_THREE
	mov eax,2000
	call delay
	 call readchar
	 call clrscr
	 mov eax,2
	 call SetTextColor
	 mov edx,offset msg444
	 call writestring
	 call Find_the_no_of_Triplets_in_File_One
	 call Find_the_Triplets_in_File_One
exit
main ENDP
Start PROC
    mov dh,12
	mov dl,53
	call gotoxy

	mov eax,14
	call SetTextColor
	mov ecx,LENGTHOF projectname
	mov esi,offset projectname
	p:
	
	mov al,[esi]
	call writechar
	mov eax,30
	call delay
	add esi,1
	Loop p

	mov dh,14
	mov dl,56
	call gotoxy
	
	mov ecx,LENGTHOF groupname
	mov esi,offset groupname
	
	p1:
	mov al,[esi]
	call writechar
	mov eax,30
	call delay
	add esi,1

	Loop p1	
	
	mov dh,16
	mov dl,56
	call gotoxy
	
	mov ecx,LENGTHOF name1
	mov esi,offset name1
	
	p2:
	
	mov al,[esi]
	call writechar
	mov eax,30
	call delay
	add esi,1

	loop p2
	
	mov dh,17
	mov dl,56
	call gotoxy

	mov ecx,LENGTHOF name2
	mov esi,offset name2
	
	p3:
	
	mov al,[esi]
	call writechar
	mov eax,30
	call delay
	add esi,1

	loop p3
	
	mov dh,18
	mov dl,56
	call gotoxy

	mov ecx,LENGTHOF name3
	mov esi,offset name3
	
	p4:
	
	mov al,[esi]
	call writechar
	mov eax,30
	call delay
	add esi,1

	loop p4
	
	mov dh,4
	mov dl,30
	call gotoxy
	mov edx,0
	mov eax,0
	mov row,75
	mov col,25

	mov al,'*'
	movzx ecx,row
	L1:
		call WriteChar
		mov edx,20
		call delay

	LOOP L1

	mov dh,4
	mov dl,105
	
	movzx ecx,col
	L2:
	    mov al,'*'
		call gotoxy
		call WriteChar
		mov eax,30
		call delay
		inc dh
	LOOP L2
	mov dh,28
	mov dl,105
	add row,1

	movzx ecx,row
	L3:
	    mov al,'*'
		call gotoxy
		call WriteChar
		mov eax,30
		call delay
		dec dl
	LOOP L3

	mov dh,4
	mov dl,30

	movzx ecx,col
	L4:
	    mov al,'*'
		call gotoxy
		call WriteChar
		mov eax,30
		call delay
		inc dh
	LOOP L4
	
ret
start ENDP
Input_from_File_One PROC
	enter 0,0
	mov edx,offset msg1
	call writestring
	call crlf
	mov edx,offset file1
	 call openinputfile
	 mov filehandle1,eax
	 mov eax,filehandle1
	 mov edx,offset string1
	 mov ecx,sizeof string1
	 call readfromfile
	 mov edx,offset string1
	 call writestring
	 mov len1,eax
	 mov string1[eax],' '
	 call crlf
	 leave
	 ret
Input_from_File_one ENDP

Input_from_File_TWO PROC
enter 0,0
 mov edx,offset msg2
	call writestring
	call crlf
	mov edx,offset file2
	 call openinputfile
	 mov filehandle2,eax
	 mov eax,filehandle2
	 mov edx,offset string2
	 mov ecx,sizeof string2
	 call readfromfile
	 mov edx,offset string2
	 call writestring
	 mov len2,eax
	 mov string2[eax],' '
	 call crlf
	 leave
	 ret
Input_from_File_TWO ENDP

Input_from_File_THREE PROC
enter 0,0
mov edx,offset msg3
	call writestring
	call crlf
	mov edx,offset file3
	 call openinputfile
	 mov filehandle3,eax
	 mov eax,filehandle3
	 mov edx,offset string3
	 mov ecx,sizeof string3
	 call readfromfile
	 mov edx,offset string3
	 call writestring
	 mov len3,eax
	 mov string3[eax],' '
	 call crlf
	 leave
	 ret
Input_from_File_THREE ENDP



Find_the_no_of_Triplets_in_File_One PROC
enter 0,0
mov esi,offset string1
mov ecx,len1
l1:
mov bl,[esi]
cmp bl,' '
je space
jmp l99
space:
add No_of_triplets,1
jmp l99
l99:
add esi,1
loop l1
sub No_of_triplets,1
leave
ret
Find_the_no_of_Triplets_in_File_One ENDP

Find_the_Triplets_in_File_One PROC
enter 0,0
mov esi,offset string1
mov edi,offset store
mov ecx,No_of_triplets
l1:
	mov spaces,0
	mov characters,0
	_while:
	mov al,[esi]
	cmp al, ' '
	je l2
	add characters,1
	mov [edi],al
	jmp L10
	l2:
	add spaces,1
	cmp spaces,1
	je l3
	cmp spaces,3
	je l4
	add characters, 1
	mov [edi], al
	jmp L10
	l3:
	mov [edi],al
	add characters,1
	mov ebx,esi ; Saving OFFSET of esi means next for word
	add ebx,1
	jmp L10
	l4:
	jmp _end_while
	L10:
	add esi,1
	add edi,1
	jmp _while
	_end_while:
	jmp  l30
	l20:
	loop l1
	jecxz Lgo
	l30:
	pushad
	call Comparision_of_File_One_Triplets_With_File_Two
	popad
	pushad
	call Comparision_of_File_One_Triplets_With_File_Three
	popad
	mov temp1,ecx
	mov ecx,50
	mov esi,offset temp
	mov edi,offset store
	rep movsb
	mov edi,offset store
	mov esi,ebx
	mov ecx,temp1
	jmp l20
Lgo:
 call crlf
 mov edx,offset plag
 call writestring
 mov edx,0
 mov eax,sum_of_the_find_tripltes
 mov ecx,100
 mul ecx
 mov edx,0
 mov ebx,No_of_triplets
 div ebx
 call writedec
 mov edx,offset plag_percent
 call writestring
 call crlf
 call crlf
 mov edx,0
 mov ebx,0
 mov edx,offset plag1
 call writestring
 mov edx,0
 mov eax,sum_of_the_find_tripltes1
 mov ecx,100
 mul ecx
 mov edx,0
 mov ebx,No_of_triplets
 div ebx
 call writedec
 mov edx,offset plag_percent
 call writestring
 call crlf
 leave
 ret
Find_the_Triplets_in_File_One ENDP

Comparision_of_File_One_Triplets_With_File_Two PROC
	enter 0,0
	mov Word_find2,0
	mov ecx,len2
	mov count,0
	mov esi,0
	mov edi,0
	L1:
		mov al,string2[esi] 
		mov bl,store[edi]
		cmp al,bl
		je char_find
		jne clear
	looping_L1:
		inc esi
		inc edi
		loop L1
	jmp Quit
	clear:
		mov edi,-1
		mov count,0
		move_to_next_word1:
		cmp esi,len2
		jae Quit
		add esi,1
		cmp string2[esi],' '
		je looping_L1
		jmp move_to_next_word1
	char_find:
		add count,1
		mov edx,characters; characters is length of triplate 
		cmp count,edx
		je check
		jmp looping_L1
	check:
		add esi,1
		cmp string2[esi],' '
		je Word_find
	move_to_next_word:
		mov edi,-1
		mov count,0
		cmp esi,len2
		jae Quit
		add esi,1
		cmp string2[esi],' '
		je looping_L1
		jmp move_to_next_word
	Word_find:
		mov Word_find2,1
		mov edi,-1
		mov count,0
		jmp looping_L1
	Quit:
		mov ebx,Word_find2
		add sum_of_the_find_tripltes,ebx
		leave 
		ret
Comparision_of_File_One_Triplets_With_File_Two ENDP

Comparision_of_File_One_Triplets_With_File_Three PROC
	enter 0,0
	mov Word_find2,0
	mov ecx,len3
	mov count,0
	mov esi,0
	mov edi,0
	L1:
		mov al,string3[esi]
		mov bl,store[edi]
		cmp al,bl
		je char_find
		jne clear
	looping_L1:
		inc esi
		inc edi
		loop L1
	jmp Quit
	clear:
		mov edi,-1
		mov count,0
		move_to_next_word1:
		cmp esi,len3
		jae Quit
		add esi,1
		cmp string3[esi],' '
		je looping_L1
		jmp move_to_next_word1
	char_find:
		add count,1
		mov edx,characters
		cmp count,edx
		je check
		jmp looping_L1
	check:
		add esi,1
		cmp string3[esi],' '
		je Word_find
	move_to_next_word:
		mov edi,-1
		mov count,0
		cmp esi,len3
		jae Quit
		add esi,1
		cmp string2[esi],' '
		je looping_L1
		jmp move_to_next_word
	Word_find:
		mov Word_find2,1
		mov edi,-1
		mov count,0
		jmp looping_L1
	Quit:
		mov ebx,Word_find2
		add sum_of_the_find_tripltes1,ebx
		leave 
		ret
Comparision_of_File_One_Triplets_With_File_Three ENDP


END main
