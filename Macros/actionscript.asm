; Compiler macros for KSS ActionScript commands
; For the complete list of ActionScript commands, see here: https://github.com/CataLatas/hal-actionscript-extractor/blob/main/KSS/DOCUMENTATION.txt

macro AS_End()
    db $00
endmacro

macro AS_Halt()
    db $01
endmacro

macro AS_Wait(imm8)    ; wait time is in frames (e.g. 3 = 3 frames)
    db $02, <imm8>
endmacro

macro AS_OnTickCallback(long)
    db $03
    dl <long>
endmacro

macro AS_EndTick()
    db $04
endmacro

macro AS_Loop_imm8(imm8)
    db $05, <imm8>
endmacro

macro AS_Loop_reg()
    db $06
endmacro

macro AS_EndLoop()
    db $07
endmacro

macro AS_JSL(long_addr)
    db $08
    dl <long_addr>
endmacro

macro AS_RTL()
    db $09
endmacro

macro AS_JSR(abs_addr)
    db $0A
    dw <abs_addr>
endmacro

macro AS_MultiJSR(...)
    db $0B
    db sizeof(...)

    !i #= 0
    while !i < sizeof(...)
        dw <...[!i]>
        !i #= !i+1
    endwhile
endmacro

macro AS_RTS()
    db $0C
endmacro

macro AS_JML(long)
    db $0D
    dl <long>
endmacro

macro AS_JMP(abs)
    db $0E
    dw <abs>
endmacro

macro AS_MultiJMP(...)
    db $0F
    db sizeof(...)

    !i #= 0
    while !i < sizeof(...)
        dw <...[!i]>
        !i #= !i+1
    endwhile
endmacro

macro AS_JEQ(abs)
    db $10
    dw <abs>
endmacro

macro AS_JNE(abs)
    db $11
    dw <abs>
endmacro

macro AS_BEQ(abs)
    db $12
    dw <abs>
endmacro

macro AS_BNE(abs)
    db $13
    dw <abs>
endmacro

macro AS_SpriteMap(long)
    db $14
    dl <long>
endmacro

macro AS_OnDraw(abs)
    db $15
    dw <abs>
endmacro

macro AS_SetTickLoop(abs)
    db $16
    dw <abs>
endmacro

; Probably should combine all MOV routines into its own routine at some point, for the sake of convenience. Doing this for now because it seems very complex.
macro AS_MOV_reg_imm16(imm16)
    db $17
    dw <imm16>
endmacro

macro AS_MOV_reg_abs(abs)
    db $18
    dw <abs>
endmacro

macro AS_MOV_var_imm16(var, imm16)
    db $19
    db <var>
    dw <imm16>
endmacro

macro AS_MOV_abs_imm8(abs, imm8)
    db $1A
    dw <abs>
    db <imm8>
endmacro

macro AS_MOV_abs_imm16(abs, imm16)
    db $1B
    dw <abs>, <imm16>
endmacro

!AND = 0
!OR = 1
!ADD = 2
!EOR = 3

; Same case with BINOP, would be nice to combine all of these macros
macro AS_BinOp_var(var, op, imm16)
    db $1C, <var>, <op>
    dw <imm16>
endmacro

macro AS_BinOp_abs_imm8(abs, op, imm8)
    db $1D
    dw <abs>
    db <op>, <imm8>
endmacro

macro AS_BinOp_abs_imm16(abs, op, imm16)
    db $1E
    dw <abs>
    db <op>
    dw <imm16>
endmacro

macro AS_BinOp_reg(op, imm16)
    db $1F, <op>
    dw <imm16>
endmacro

macro AS_MOV_var_reg(var)
    db $20, <var>
endmacro

macro AS_MOV_reg_var(var)
    db $21, <var>
endmacro

macro AS_Wait_var(var)
    db $22, <var>
endmacro

macro AS_SetPose_var(var)
    db $23, <var>
endmacro

macro AS_StopMovement()
    db $24
endmacro

macro AS_StopAcceleration()
    db $25
endmacro

macro AS_SetPositionX(imm16)
    db $26
    dw <imm16>
endmacro

macro AS_SetPositionY(imm16)
    db $27
    dw <imm16>
endmacro

macro AS_AddPositionX(imm16)
    db $28
    dw <imm16>
endmacro 

macro AS_AddPositionY(imm16)
    db $29
    dw <imm16>
endmacro 

macro AS_UNK2A(imm8, imm16)
    db $2A, <imm8>
    dw <imm16>
endmacro

macro AS_UNK2B(imm8, imm16)
    db $2B, <imm8>
    dw <imm16>
endmacro

macro AS_UNK2C(imm8, imm16)
    db $2C, <imm8>
    dw <imm16>
endmacro

macro AS_UNK2D(imm8, imm16)
    db $2D, <imm8>
    dw <imm16>
endmacro

macro AS_UNK2E(imm8)
    db $2D, <imm8>
endmacro

macro AS_UNK2F(imm8, imm16)
    db $2F, <imm8>
    dw <imm16>
endmacro

macro AS_UNK30(imm8, imm16)
    db $30, <imm8>
    dw <imm16>
endmacro

macro AS_UNK31(imm8, imm16)
    db $31, <imm8>
    dw <imm16>
endmacro

macro AS_UNK32(imm8, imm16)
    db $32, <imm8>
    dw <imm16>
endmacro

macro AS_SetZLayer(imm16)
    db $33
    dw <imm16>
endmacro

macro AS_UNK34(imm8)
    db $34, <imm8>
endmacro

macro AS_SetPose_imm16(imm16)
    db $35
    dw <imm16>
endmacro

; Used with byte range $36-$3F. Causes game crash.
macro AS_UNDEFINED(hex)
    db <hex>
endmacro 


macro AS_SetPose_imm8(imm8, wait)
    db $40|(<wait>&$0F), <imm8>
endmacro

macro AS_AddPose(imm8, wait)
    db $50|(<wait>&$0F), <imm8>
endmacro

macro AS_IncPose(wait)
    db $60|(<wait>&$0F)
endmacro

macro AS_DecPose(wait)
    db $70|(<wait>&$0F)
endmacro

macro AS_SetSpeedX(value, wait)
    db $80|(<wait>&$0F)
    dw <value>
endmacro

macro AS_SetSpeedY(value, wait)
    db $90|(<wait>&$0F)
    dw <value>
endmacro

macro AS_SetAccelerationX(value, wait)
    db $A0|(<wait>&$0F)
    dw <value>
endmacro

macro AS_SetAccelerationY(value, wait)
    db $B0|(<wait>&$0F)
    dw <value>
endmacro

macro AS_ASMCall(long, wait)
    db $C0|(<wait>&$0F)
    dl <long>
endmacro

macro AS_PresetCall(imm8, wait)
    db $D0|(<wait>&$0F), <imm8>
endmacro

macro AS_PlaySFX(imm8, wait)
    db $E0|(<wait>&$0F), <imm8>
endmacro

macro AS_PlayMusic(imm8, wait)
    db $F0|(<wait>&$0F), <imm8>
endmacro