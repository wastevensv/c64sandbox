    * = $1000
;    sei
;    ldx #$00
;    stx $d021
;    stx $d020
    jsr $e544
    lda #$41
    jsr $e716
    rts
