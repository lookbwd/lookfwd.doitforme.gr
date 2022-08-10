      .386
      .model flat, stdcall
      option casemap :none   ; case sensitive

; #########################################################################

      include \masm32\include\user32.inc
      include \masm32\include\kernel32.inc

      includelib \masm32\lib\user32.lib
      includelib \masm32\lib\kernel32.lib


; here begins Data

.Data                                        
text     db "Hello World this is DKL",13,10 ; first row of the text(with word-wrap)
         db "Take your best shot",0
caption  db "First steps in assembly",0 ;Captionstring, 0-terminated
caption2 db "Message from DKL:",0 ;Captionstring, 0-terminated
abort    db "I knew you couldn't handle such a program!",0 ;Captionstring, 0-terminated
ignore   db "I don't like people ignoring me!",0 ;Captionstring, 0-terminated
Num      db 0,0


; and here we start with our code

.Code                                  
Main:
        mov Num,53
        .WHILE Num==53
        INVOKE MessageBox,0,addr text,addr caption,12h
        add al,49
        mov Num,al
        .ENDW
        .IF al==52
        INVOKE MessageBox,0,addr abort,addr caption2,40h
        .ELSEIF al==54
        INVOKE MessageBox,0,addr ignore,addr caption2,40h
        .ENDIF

        CALL    ExitProcess     ;End (exit) program
End Main                        ;End of code, Main is the entrypoint
