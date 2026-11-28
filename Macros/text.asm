; Kirby Super Star vwf text macros

; When printing variable width text data, the game listens for specific bytes and initiates specific commands when read

macro TEXT_End()
    db $00
endmacro

macro TEXT_Clear()      ; Clears all text on screen. Usually used right before printing a new text block.
    db $01
endmacro

macro TEXT_NewLine()
    db $02
endmacro 

macro TEXT_PositionOffset(x, y)
    db $03, <x>, <y>
endmacro

macro TEXT_UNK04(x)     ; seems to be unused?
    db $04, <x>
endmacro

macro TEXT_SetCharWidth(pixels)
    db $05, <pixels>
endmacro

macro TEXT_Speed(line, char)    ; sets number of frames for each new line and each new character to populate
    db $06, <line>, <char>
endmacro

macro TEXT_TextProgButtons(word)    ; sets which buttons on the controller allow for text progression
    db $07 : dw <word>
endmacro

; ----bbff - ff = foreground color, bb = background color
; 00 - invisible
; 01 - use primary color
; 10 - black
; 11 - use secondary color
macro TEXT_SetVisibility(color)
    db $08, <color>
endmacro

macro TEXT_UNK09(x)     ; seems to be unused?
    db $09, <x>
endmacro

macro TEXT_UNK0A()     ; seems to be unused?
    db $0A 
endmacro

macro TEXT_UNK0B()     ; seems to be unused?
    db $0B 
endmacro 

macro TEXT_HaltUntilPress(word)     ; Do not continue running through text data until the specified button is pressed.
    db $0C : dw <word>
endmacro

macro TEXT_Wait(x)      ; Wait the specified number of frames
    db $0D, <x>
endmacro

macro TEXT_RunMacro(long)   ; runs another text macro
    db $0E : dl <long>
endmacro

macro TEXT_ReadValue(long)  ; Read a byte value and print its integer value
    db $0F : dl <long>
endmacro

macro TEXT_WriteDataB(long, byte)       ; Write a value at the specified address (byte)
    db $10 : dl <long> : db <byte>
endmacro

macro TEXT_WriteDataW(long, word)       ; Write a value at the specified address (word)
    db $11 : dl <long> : dw <word>
endmacro

macro TEXT_CursorEnable()
    db $12
endmacro

macro TEXT_CursorDisable()
    db $13
endmacro

macro TEXT_SecondaryColorEnable()
    db $14
endmacro

macro TEXT_SecondaryColorDisable()
    db $15
endmacro

; could probably combine these two macros
; WriteChar1 and WriteChar2 are mostly used for writing kanji in the JP ROM
macro TEXT_WriteChar1(x)     ; writes character 1xx
    db $18, <x>
endmacro

macro TEXT_WriteChar2(x)     ; writes character 2xx
    db $19, <x>
endmacro

macro TEXT_SkipByte()        ; unsure
    db $1B
endmacro

macro TEXT_ScrollSFX(x)     ; SFX to be played on each text character appearance
    db $1D, <x>
endmacro

macro TEXT_PlayMusic(x)     ; Starts playing music
    db $1E, <x>
endmacro

macro TEXT_PlaySFX(x)       ; Plays a SFX
    db $1F, <x>
endmacro

; $16, $17, $1A, and $1C may be unused
macro TEXT_UNUSED(byte)
    db <byte>
endmacro