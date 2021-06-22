.intel_syntax noprefix
.text
.global character_histogram
character_histogram:
	push ebp
	mov ebp, esp
	push ebx

	mov eax, [ebp + 12] #2. arg, int_tomb
	mov ecx, 0 #int i = 0

	loop1:
	cmp ecx, 26 #ecx == 26, azaz addig megy, amig kisebb, mint 26
	je foresz #goto foresz

	#feltoltjuk a tombot 0-kal, hogy ne lehessen semmilyen hiba
	mov dword ptr [eax + ecx*4], 0 #eax[i], eax a tomb, ecx az i valtozo
	inc ecx
	jmp loop1

	#------------------------EDDIG MINDEN JO-------------------------------
	#JO A NULLAZAS, JO A KULSO CIKLUS, JO A VEGE IS
	#NEM JO: A BELSO CIKLUS
	
	foresz:
	mov ecx, 0
	mov ecx, [ebp + 8] #betoltjuk az ecx-be a szot      |       Itt muszaj ecx-et hasznalni
	mov ebx, 0 #int i = 0


	loop2:
	mov edx, 0 #belso ciklus indexe, int j = 0 
	#mov cx, [esi + ebx*1]
	cmp byte ptr [ecx + ebx], 0 #jelenlegi betu == 0(\0)?
	je vege #ha igen ugrunk
	
	#----------------BELSO_CIKLUS------------------------

	#VALAHOL VEGTELEN A CIKLUS
	#TODO
	loop3:
	#Ez egy belso ciklus.
	cmp edx, 26
	je loop2

	add edx, 97 # j = j + 97
	cmp byte ptr [ecx + ebx], dl #j == szo[i]    - >   itt ket memoriacimet akartam osszehasonlitani, ami nem palya
	jne ciklust_novel

	sub edx, 97 # j = j - 97
	inc dword ptr [eax + 4*edx] #histogram[j] #jo
	inc ebx #kulso index++			   #jo
	jmp loop2				   #jo



	ciklust_novel:
	sub edx, 97 # j = j - 97
	inc edx #belso index++
	jmp loop3


	#----------------------------------------------------


	
	vege:
	#fgv epilogus
	mov ebx, 0
	mov eax, 0
	pop ebx
	
	mov esp, ebp
	pop ebp
	ret
