    * = $1000
    ldx #$00
    stx $d021
    stx $d020

clear
    lda #$20
    sta $0400,x
    sta $0500,x
    sta $0600,x
    sta $06e8,x
    lda #$00
    sta $d800,x  
    sta $d900,x
    sta $da00,x
    sta $dae8,x
    inx
    bne clear

print_text
    ldx #$00            ; Reset x register.

print_text_loop
    lda line,x          ; Load x-th character in string at line.
    beq end             ; Break if null-terminator detected.
    jsr $ffd2           ; Print character
    inx                 ; Increment position in string.
    jmp print_text_loop ; Repeat.

end jmp end             ; End and stall

line
    .text "test", 0
