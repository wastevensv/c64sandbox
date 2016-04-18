    * = $1000
    ldx #$01
    stx $d020
    ldx #$00
    stx $d021

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

fill_start
    ldx #25        ; X Pos Starts @ 25
    ldy #40        ; Y Pos Starts @ 40
    lda fill_char
    jmp up_loop

clear_start
    ldx #25        ; X Pos Starts @ 25
    ldy #40        ; Y Pos Starts @ 40
    lda clear_char
    jmp up_loop
    
up_loop
    clc
    jsr $fff0       ; Move cursor (using PLOT)
    jsr $ffd2       ; Print character (using CHROUT)
    dex             ; Decrement position in line.
    bne up_loop
    
    dey             ; Decrement line number.
    bne up_loop
    cmp clear_char  ; If clearing...
    bne clear_start ; Start clearing
    jmp fill_start  ; Else, start filling.

end jmp end         ; End and stall

fill_char
    .byte "b"

clear_char
    .byte " "
