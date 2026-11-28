
    ORG $078000

; Uncompressed sprite graphics for Dedede used in Spring Breeze 4 and Gourmet Race
GFX_DededeSprite:
    incbin "Graphics/Dedede.bin"

; What is this for???
    db $06,$00,$04,$01,$05,$01,$00    ;$078800 |

AS_InitTitleScreen:
    %AS_JSR(AS_07895F)
    %AS_PresetCall($06, $00)            ; Set main screen layers to `arg` (hardware register TM)
        db $13
    %AS_SetPose_imm8(0, 0)
    %AS_JMP(AS_DelayTitleScreenSkip)

AS_078812:
    %AS_JSR(AS_07895F)
    %AS_ASMCall(CODE_078FA9, $00)
        dw $0000
        dw CODE_8789F5
    %AS_ASMCall(CODE_078FA9, $00)
        dw $0000
        dw CODE_878BBA
    %AS_Wait($20)
    %AS_PresetCall($06, $00)
        db $13
    %AS_ASMCall(CODE_078FA9, $00)
        dw $0000
        dw CODE_878CE5
    %AS_ASMCall(CODE_078FA9, $00)
        dw $0002
        dw CODE_878CE5
    %AS_Wait($10)
    %AS_SetPose_imm8($00, $00)
    %AS_ASMCall(CODE_078FA9, $00)
        dw $0004
        dw CODE_878CE5
    %AS_ASMCall(CODE_FL_00A3F1, $00)
        dw $001F
        dw $0002

AS_DelayTitleScreenSkip:                ; Add a delay before you can press a button to bring up file select
    %AS_Wait($3C)
    %AS_MOV_var_imm16($00, $0078)

AS_078854:
    %AS_BinOp_var($00, !ADD, $FFFF)
    %AS_MOV_reg_var($00)
    %AS_JNE(AS_InitializeFileSelect)
    %AS_ASMCall(CODE_078E3F, $00)       ; inc $7396 : inc $7392

AS_InitializeFileSelect:
    %AS_ASMCall(CODE_FL_00A32B, $00)
        db $00
    %AS_MOV_reg_imm16($0000)
    %AS_ASMCall(CODE_FL_00A26B, $01)    ; Check if buttons started being pressed this frame on controller REG
        dw $D0C0
    %AS_JEQ(AS_078854)
    %AS_SetPose_imm8($FF, $00)
    %AS_PresetCall($0A, $00)            ; ASMCALL $009FEA: Copy `arg3` bytes from `arg1` into [$0500+(`arg2` * 2)]
        dl $EB9125
        db $80
        dw $0100
    %AS_ASMCall(CODE_078FA9, $00)
        dw $0000
        dw CODE_8789C5
    %AS_ASMCall(CODE_078FA9, $00)
        dw $0001
        dw CODE_8789C5
    %AS_ASMCall(CODE_078FA9, $00)
        dw $0002
        dw CODE_8789C5
    %AS_ASMCall(CODE_078E59, $00)
    %AS_OnTickCallback(CODE_079103)     ; Responsible for scrolling the file UI element in
    %AS_UNK30($00, $F800)
    %AS_Wait($1D)
    %AS_UNK30($00, $0000)
    %AS_StopMovement()
    %AS_PresetCall($03, $00)            ; ASMCALL $009C94: Set background mode
        db $09
    %AS_ASMCall(ReadPlayMusic, $00)     ; Music to be played on File Select (in this case it is nothing)
        db $00
    %AS_ASMCall(ReadPlaySFX, $01)       ; SFX to play when the files stop moving
        db $07
    %AS_SpriteMap($CC96AF)
    %AS_OnTickCallback(CODE_879123)
    %AS_ASMCall(CODE_078E67, $01)
    %AS_SetPose_imm8($07, $00)
    %AS_ASMCall(CODE_078F6A, $01)
    %AS_PresetCall($06, $00)            ; ASMCALL $009CCE: Set main screen layers to `arg` (hardware register TM)
        db $17

AS_FileSelectMainLoop:
    %AS_ASMCall(FileSelectMainLoop, $01)
    %AS_MultiJMP(AS_FileSelectMainLoop,
        AS_FileDeletePrompt,
        AS_FileSelected)

AS_FileDeletePrompt:
    %AS_ASMCall(CODE_878F03, $00)
    %AS_JEQ(AS_FileSelectMainLoop)
    %AS_ASMCall(ReadPlaySFX, $00)
        db $46
    %AS_OnTickCallback(CODE_FL_008F63)
    %AS_SetPose_imm8($FF, $00)
    %AS_ASMCall(CODE_878F80, $00)
    %AS_ASMCall(CODE_878F38, $00)

AS_DeletePrompt_1:
    %AS_Wait($01)
    %AS_ASMCall(CODE_878F4D, $00)
    %AS_MultiJMP(AS_DeletePrompt_1,
    AS_ReturnToMainLoop,
    AS_DeleteYes_1)

AS_DeleteYes_1:
    %AS_ASMCall(CODE_878F3D, $00)

AS_DeletePrompt_2:
    %AS_Wait($01)
    %AS_ASMCall(CODE_878F4D, $00)
    %AS_MultiJMP(AS_DeletePrompt_2,
    AS_ReturnToMainLoop,
    AS_DeleteYes_2)

AS_DeleteYes_2:
    %AS_ASMCall(CODE_878F42, $00)

AS_DeletePrompt_3:
    %AS_Wait($01)
    %AS_ASMCall(CODE_878F4D, $00)
    %AS_MultiJMP(AS_DeletePrompt_3,
    AS_ReturnToMainLoop,
    AS_ExecuteFileDeletion)

AS_ExecuteFileDeletion:
    %AS_ASMCall(ReadPlayMusic, $00)
        db $0C
    %AS_ASMCall(CODE_878F21, $00)
    %AS_ASMCall(ReadPlayMusic, $00)
        db $00

AS_ReturnToMainLoop:
    %AS_ASMCall(CODE_078F6A, $01)
    %AS_OnTickCallback(CODE_879123)
    %AS_SetPose_imm8($07, $00)
    %AS_ASMCall(CODE_878F9F, $00)
    %AS_JMP(AS_FileSelectMainLoop)

AS_FileSelected:
    %AS_Wait($1E)
    %AS_Loop_imm8($10)
        %AS_ASMCall(FadeOut_Step, $00)
        %AS_ASMCall(CODE_FL_00CE78, $01)
        db -16
    %AS_EndLoop()
    %AS_MOV_var_imm16($00, $0000)
    %AS_SetPose_imm8(-1, 0)
    %AS_ASMCall(UpdateVramSprSize, $00)
    %AS_MOV_abs_imm16(ReloadRoom, $0001)
    %AS_Halt()

AS_07895F:
    %AS_ASMCall(CODE_FL_00D883, $00)
    %AS_SetTickLoop($A6F1)
    %AS_OnDraw($AB7E)
    %AS_SpriteMap($CC96CD)
    %AS_SetPose_imm8(-1, $00)
    %AS_PresetCall($03, $00)            ; ASMCALL $009C94: Set background mode
        db $02 
    %AS_PresetCall($06, $00)            ; ASMCALL $009CCE: Set main screen layers to `arg` (hardware register TM)
        db $10
    %AS_PresetCall($04, $00)            ; ASMCALL $009C9A: Configure layer `arg1` (tilemap size=`arg2`, tilemap VRAM address=`arg3`, tileset VRAM address=`arg4`)
        db $00
        db $02
        dw $0000
        dw $4000
    %AS_PresetCall($04, $00)
        db $01
        db $00
        dw $2000
        dw $4800
    %AS_PresetCall($04, $00)
        db $02
        db $00
        dw $5000
        dw $5800
    %AS_PresetCall($05, $00)            ; ASMCALL $009CBB: Set sprite sizes and VRAM address
        db $00
        dw $6000
        db $00
    %AS_PresetCall($02, $00)            ; ASMCALL $009C6C: Load VRAM data from list of (transfermode, size, src, dst)
        dl DATA16_078DF6
    %AS_PresetCall($0A, $00)            ; ASMCALL $009FEA: Copy `arg3` bytes from `arg1` into [$0500+(`arg2` * 2)]
        dl $EB9325
        db $00
        dw $0100
    %AS_PresetCall($0A, $00)
        dl $EFDE18
        db $91
        dw $001E
    %AS_PresetCall($0A, $00)
        dl $EE9080
        db $A0
        dw $0080
    %AS_StopMovement()
    %AS_UNK2B($00, $00E8)
    %AS_SetPositionX($007C)
    %AS_SetPositionY($0056)
    %AS_ASMCall(CODE_078E46, $00)       ; Set $7F8800 to zero
    %AS_ASMCall(CODE_FL_009FC7, $00)    ; Set screen brightness
        db $0F
    %AS_RTS()

CODE_8789C5:
    LDA.W #$A6EC                  ;$0789C5 |
    STA.W Obj_TickLoopCallback,Y  ;$0789C8 |
    LDA.W #$AB90                  ;$0789CB |
    STA.W Obj_DrawCallback,Y      ;$0789CE |
    %LoadLongToAX($CC96AF)
    JSL.L CODE_FL_00E1CC          ;$0789D7 |
    LDA.W #$FFFF                  ;$0789DB |
    STA.W Obj_Pose,Y              ;$0789DE |
    %LoadLongToAX(CODE_07917D)
    JSL.L CODE_FL_00E1B7          ;$0789E7 |
    JSL.L CODE_FL_078FE2          ;$0789EB |

CODE_8789EF:
    JSL.L CODE_FL_00E091          ;$0789EF |
    BRA CODE_8789EF               ;$0789F3 |
CODE_8789F5:
    JSL.L CODE_FL_00E0AF          ;$0789F5 |
    LDX.W #$0000                  ;$0789F9 |
    LDA.W #CODE_078A77            ;$0789FC |
    JSL.L CODE_FL_078FB2          ;$0789FF |
    JSL.L CODE_FL_00E097          ;$078A03 |
    LDX.W #$0002                  ;$078A07 |
    LDA.W #CODE_078A77            ;$078A0A |
    JSL.L CODE_FL_078FB2          ;$078A0D |
    JSL.L CODE_FL_00E097          ;$078A11 |
    LDX.W #$0004                  ;$078A15 |
    LDA.W #CODE_078A77            ;$078A18 |
    JSL.L CODE_FL_078FB2          ;$078A1B |
    JSL.L CODE_FL_00E097          ;$078A1F |
    LDX.W #$0006                  ;$078A23 |
    LDA.W #CODE_078A77            ;$078A26 |
    JSL.L CODE_FL_078FB2          ;$078A29 |
    JSL.L CODE_FL_00E097          ;$078A2D |
    LDX.W #$0008                  ;$078A31 |
    LDA.W #CODE_078A77            ;$078A34 |
    JSL.L CODE_FL_078FB2          ;$078A37 |
    JSL.L CODE_FL_00E097          ;$078A3B |
    LDX.W #$000A                  ;$078A3F |
    LDA.W #CODE_078A77            ;$078A42 |
    JSL.L CODE_FL_078FB2          ;$078A45 |
    JSL.L CODE_FL_00E097          ;$078A49 |
    LDX.W #$000C                  ;$078A4D |
    LDA.W #CODE_078A77            ;$078A50 |
    JSL.L CODE_FL_078FB2          ;$078A53 |
    JSL.L CODE_FL_00E097          ;$078A57 |
    LDX.W #$000E                  ;$078A5B |
    LDA.W #CODE_078A77            ;$078A5E |
    JSL.L CODE_FL_078FB2          ;$078A61 |
    JSL.L CODE_FL_00E097          ;$078A65 |
    LDX.W #$0010                  ;$078A69 |
    LDA.W #CODE_078A77            ;$078A6C |
    JSL.L CODE_FL_078FB2          ;$078A6F |
    JML.L DestroyUsedObject       ;$078A73 |

CODE_078A77:
    LDA.W #$A6F1                  ;$078A77 |
    STA.W Obj_TickLoopCallback,Y  ;$078A7A |
    LDA.W #$AB72                  ;$078A7D |
    STA.W Obj_DrawCallback,Y      ;$078A80 |
    %LoadLongToAX($C59AEA)
    JSL.L CODE_FL_00E1CC          ;$078A89 |
    LDX.W Obj_VAR0,Y              ;$078A8D |
    LDA.L DATA16_078B1F,X         ;$078A90 |
    STA.W Obj_XPosition,Y         ;$078A94 |
    LDA.W #$00B8                  ;$078A97 |
    STA.W Obj_YPosition,Y         ;$078A9A |
    LDA.L DATA16_078B31,X         ;$078A9D |
    STA.W $6B6E,Y                 ;$078AA1 |
    LDA.W #$FA00                  ;$078AA4 |
    STA.W $6BE8,Y                 ;$078AA7 |
    LDA.W #$0206                  ;$078AAA |
    JSL.L CODE_FL_00E169          ;$078AAD |
    TYX                           ;$078AB1 |
    INC.W Obj_Pose,X              ;$078AB2 |
    JSL.L CODE_FL_00E097          ;$078AB5 |
    TYX                           ;$078AB9 |
    INC.W Obj_Pose,X              ;$078ABA |
    JSL.L CODE_FL_00E097          ;$078ABD |
    TYX                           ;$078AC1 |
    INC.W Obj_Pose,X              ;$078AC2 |
    JSL.L CODE_FL_00E097          ;$078AC5 |
    LDX.W #$0000                  ;$078AC9 |
    LDA.W #CODE_078B43            ;$078ACC |
    JSL.L CODE_FL_078FB2          ;$078ACF |
    LDX.W #$0002                  ;$078AD3 |
    LDA.W #CODE_078B43            ;$078AD6 |
    JSL.L CODE_FL_078FB2          ;$078AD9 |
    LDX.W #$0004                  ;$078ADD |
    LDA.W #CODE_078B43            ;$078AE0 |
    JSL.L CODE_FL_078FB2          ;$078AE3 |
    LDX.W #$0006                  ;$078AE7 |
    LDA.W #CODE_078B43            ;$078AEA |
    JSL.L CODE_FL_078FB2          ;$078AED |
    LDA.W #$0002                  ;$078AF1 |
    TSB.W MainScreenDesignation   ;$078AF4 |
    JSL.L CODE_FL_00E465          ;$078AF7 |
    LDA.W #$0118                  ;$078AFB |
    JSL.L CODE_FL_00E169          ;$078AFE |
    LDA.W #$0002                  ;$078B02 |
    TRB.W MainScreenDesignation   ;$078B05 |
    JSL.L CODE_FL_00E091          ;$078B08 |
    LDA.W #$010C                  ;$078B0C |
    JSL.L CODE_FL_00E169          ;$078B0F |
    TYX                           ;$078B13 |
    INC.W Obj_Pose,X              ;$078B14 |
    JSL.L CODE_FL_00E091          ;$078B17 |
    JML.L DestroyUsedObject       ;$078B1B |

DATA16_078B1F:
    dw $010A,$00E7,$00C2,$009E    ;$078B1F |
    dw $007A,$0055,$0034,$0013    ;$078B27 |
    dw $FFF4                      ;$078B2F |

DATA16_078B31:
    dw $F800,$FA00,$FC00,$FE00    ;$078B31 |
    dw $0000,$0200,$0400,$0600    ;$078B39 |
    dw $0800                      ;$078B41 |

CODE_078B43:
    LDA.W #CODE_FL_00A6FB                  ;$078B43 |
    STA.W Obj_TickLoopCallback,Y  ;$078B46 |
    LDA.W #$AB72                  ;$078B49 |
    STA.W Obj_DrawCallback,Y      ;$078B4C |
    %LoadLongToAX($C59AEA)
    JSL.L CODE_FL_00E1CC          ;$078B55 |
    LDX.W Obj_VAR0,Y              ;$078B59 |
    LDA.L DATA16_078B9A,X         ;$078B5C |
    STA.W $6B6E,Y                 ;$078B60 |
    LDA.L DATA16_078BA2,X         ;$078B63 |
    STA.W $6BE8,Y                 ;$078B67 |
    LDA.L DATA16_078BAA,X         ;$078B6A |
    STA.W $6C62,Y                 ;$078B6E |
    LDA.L DATA16_078BB2,X         ;$078B71 |
    STA.W $6CDC,Y                 ;$078B75 |
    LDA.W #$0203                  ;$078B78 |
    JSL.L CODE_FL_00E169          ;$078B7B |
    TYX                           ;$078B7F |
    INC.W Obj_Pose,X              ;$078B80 |
    JSL.L CODE_FL_00E097          ;$078B83 |
    TYX                           ;$078B87 |
    INC.W Obj_Pose,X              ;$078B88 |
    JSL.L CODE_FL_00E097          ;$078B8B |
    LDA.W #$0300                  ;$078B8F |
    JSL.L CODE_FL_00E169          ;$078B92 |
    JML.L DestroyUsedObject       ;$078B96 |

DATA16_078B9A:
    dw $0400,$0400,$FC00,$FC00    ;$078B9A |

DATA16_078BA2:
    dw $0400,$FC00,$0400,$FC00    ;$078BA2 |

DATA16_078BAA:
    dw $FF80,$FF80,$0080,$0080    ;$078BAA |

DATA16_078BB2:
    dw $FF80,$0080,$FF80,$0080    ;$078BB2 |

CODE_878BBA:
    LDA.W #$0000                  ;$078BBA |
CODE_878BBD:
    STA.W Obj_VAR0,Y              ;$078BBD |
    TAX                           ;$078BC0 |
    LDA.L DATA16_078C3D,X         ;$078BC1 |
    PHA                           ;$078BC5 |
    LDA.L DATA16_078C03,X         ;$078BC6 |
    AND.W #$00FF                  ;$078BCA |
    PLX                           ;$078BCD |
    JSL.L CODE_FL_00E2E4          ;$078BCE |
    LDX.W Obj_VAR0,Y              ;$078BD2 |
    LDA.L DATA16_078C03,X         ;$078BD5 |
    BMI CODE_878BE7               ;$078BD9 |
    LDX.W #$0000                  ;$078BDB |
    LDA.W #CODE_078C77            ;$078BDE |
    JSL.L CODE_FL_078FB2          ;$078BE1 |
    BRA CODE_878BF1               ;$078BE5 |

CODE_878BE7:
    LDX.W #$0000                  ;$078BE7 |
    LDA.W #CODE_078CBD            ;$078BEA |
    JSL.L CODE_FL_078FB2          ;$078BED |

CODE_878BF1:
    JSL.L CODE_FL_00E091          ;$078BF1 |
    LDA.W Obj_VAR0,Y              ;$078BF5 |
    INC A                         ;$078BF8 |
    INC A                         ;$078BF9 |
    CMP.W #$003A                  ;$078BFA |
    BCC CODE_878BBD               ;$078BFD |
    JML.L DestroyUsedObject       ;$078BFF |

DATA16_078C03:
    dw $0020,$0040,$0038,$0030    ;$078C03 |
    dw $0048,$0060,$0050,$005C    ;$078C0B |
    dw $0050,$0068,$0080,$0078    ;$078C13 |
    dw $007C,$0070,$0088,$00A0    ;$078C1B |
    dw $0078,$00C0,$00A8,$0090    ;$078C23 |
    dw $00B0,$00B8,$80C0,$00C4    ;$078C2B |
    dw $80CE,$00D0,$00C8,$00C0    ;$078C33 |
    dw $00DC                      ;$078C3B |

DATA16_078C3D:
    dw $0030,$0050,$0020,$0040    ;$078C3D |
    dw $0038,$0048,$0020,$0040    ;$078C45 |
    dw $001C,$0038,$0028,$001C    ;$078C4D |
    dw $0034,$0010,$0038,$0020    ;$078C55 |
    dw $002C,$0030,$0040,$0048    ;$078C5D |
    dw $0020,$0030,$002C,$0038    ;$078C65 |
    dw $0034,$0060,$0048,$0050    ;$078C6D |
    dw $0054                      ;$078C75 |

CODE_078C77:
    LDA.W #$A6F1                  ;$078C77 |
    STA.W Obj_TickLoopCallback,Y  ;$078C7A |
    LDA.W #$AB72                  ;$078C7D |
    STA.W Obj_DrawCallback,Y      ;$078C80 |
    LDA.W #$9AEA                  ;$078C83 |
    LDX.W #$00C5                  ;$078C86 |
    JSL.L CODE_FL_00E1CC          ;$078C89 |
    LDA.W #$0210                  ;$078C8D |
    JSL.L CODE_FL_00E169          ;$078C90 |
    TYX                           ;$078C94 |
    INC.W Obj_Pose,X              ;$078C95 |
    JSL.L CODE_FL_00E097          ;$078C98 |
    LDA.W #$FA00                  ;$078C9C |
    STA.W $6B6E,Y                 ;$078C9F |
    LDA.W #$0122                  ;$078CA2 |
    JSL.L CODE_FL_00E169          ;$078CA5 |
    TYX                           ;$078CA9 |
    INC.W Obj_Pose,X              ;$078CAA |
    JSL.L CODE_FL_00E091          ;$078CAD |
    TYX                           ;$078CB1 |
    INC.W Obj_Pose,X              ;$078CB2 |
    JSL.L CODE_FL_00E091          ;$078CB5 |
    JML.L DestroyUsedObject       ;$078CB9 |

CODE_078CBD:
    LDA.W #$A6F1                  ;$078CBD |
    STA.W Obj_TickLoopCallback,Y  ;$078CC0 |
    LDA.W #$AB72                  ;$078CC3 |
    STA.W Obj_DrawCallback,Y      ;$078CC6 |
    %LoadLongToAX($C59AEA)
    JSL.L CODE_FL_00E1CC          ;$078CCF |
    LDA.W #$0300                  ;$078CD3 |
    JSL.L CODE_FL_00E169          ;$078CD6 |
    LDA.W #$0303                  ;$078CDA |
    JSL.L CODE_FL_00E169          ;$078CDD |
    JML.L DestroyUsedObject       ;$078CE1 |

CODE_878CE5:
    LDX.W Obj_VAR0,Y              ;$078CE5 |
    LDA.L DATA16_078D49,X         ;$078CE8 |
    STA.W Obj_XPosition,Y         ;$078CEC |
    LDA.W #$0066                  ;$078CEF |
    STA.W Obj_YPosition,Y         ;$078CF2 |
    LDX.W #$0000                  ;$078CF5 |
    LDA.W #CODE_078D4F            ;$078CF8 |
    JSL.L CODE_FL_078FB2          ;$078CFB |
    LDX.W #$0002                  ;$078CFF |
    LDA.W #CODE_078D4F            ;$078D02 |
    JSL.L CODE_FL_078FB2          ;$078D05 |
    LDX.W #$0004                  ;$078D09 |
    LDA.W #CODE_078D4F            ;$078D0C |
    JSL.L CODE_FL_078FB2          ;$078D0F |
    LDX.W #$0006                  ;$078D13 |
    LDA.W #CODE_078D4F            ;$078D16 |
    JSL.L CODE_FL_078FB2          ;$078D19 |
    LDX.W #$0008                  ;$078D1D |
    LDA.W #CODE_078D4F            ;$078D20 |
    JSL.L CODE_FL_078FB2          ;$078D23 |
    LDX.W #$000A                  ;$078D27 |
    LDA.W #CODE_078D4F            ;$078D2A |
    JSL.L CODE_FL_078FB2          ;$078D2D |
    LDX.W #$000C                  ;$078D31 |
    LDA.W #CODE_078D4F            ;$078D34 |
    JSL.L CODE_FL_078FB2          ;$078D37 |
    LDX.W #$000E                  ;$078D3B |
    LDA.W #CODE_078D4F            ;$078D3E |
    JSL.L CODE_FL_078FB2          ;$078D41 |
    JML.L DestroyUsedObject       ;$078D45 |

DATA16_078D49:
    dw $00AA,$0056,$0080          ;$078D49 |

CODE_078D4F:
    LDA.W #CODE_FL_00A6FB                  ;$078D4F |
    STA.W Obj_TickLoopCallback,Y  ;$078D52 |
    LDA.W #$AB72                  ;$078D55 |
    STA.W Obj_DrawCallback,Y      ;$078D58 |
    LDA.W #$9AEA                  ;$078D5B |
    LDX.W #$00C5                  ;$078D5E |
    JSL.L CODE_FL_00E1CC          ;$078D61 |
    LDX.W Obj_VAR0,Y              ;$078D65 |
    LDA.L DATA16_078DB6,X         ;$078D68 |
    STA.W $6B6E,Y                 ;$078D6C |
    LDA.L DATA16_078DC6,X         ;$078D6F |
    STA.W $6BE8,Y                 ;$078D73 |
    LDA.L DATA16_078DD6,X         ;$078D76 |
    STA.W $6C62,Y                 ;$078D7A |
    LDA.L DATA16_078DE6,X         ;$078D7D |
    STA.W $6CDC,Y                 ;$078D81 |
    LDA.W #$0002                  ;$078D84 |
    STA.W Obj_VAR8,Y              ;$078D87 |

CODE_JP_078D8A:
    LDA.W #$0206                  ;$078D8A |
    JSL.L CODE_FL_00E169          ;$078D8D |
    TYX                           ;$078D91 |
    INC.W Obj_Pose,X              ;$078D92 |
    JSL.L CODE_FL_00E097          ;$078D95 |
    TYX                           ;$078D99 |
    INC.W Obj_Pose,X              ;$078D9A |
    JSL.L CODE_FL_00E097          ;$078D9D |
    TYX                           ;$078DA1 |
    INC.W Obj_Pose,X              ;$078DA2 |
    JSL.L CODE_FL_00E097          ;$078DA5 |
    TYX                           ;$078DA9 |
    DEC.W Obj_VAR8,X              ;$078DAA |
    BEQ CODE_878DB2               ;$078DAD |
    JMP.W CODE_JP_078D8A          ;$078DAF |

CODE_878DB2:
    JML.L DestroyUsedObject       ;$078DB2 |


; VRAM data list? (transfermode, size, src, dst)
DATA16_078DB6:
    dw $0900,$0900,$F700,$F700    ;$078DB6 |
    dw $0C00,$F400,$0000,$0000    ;$078DBE |
DATA16_078DC6:
    dw $0900,$F700,$0900,$F700    ;$078DC6 |
    dw $0000,$0000,$0C00,$F400    ;$078DCE |
DATA16_078DD6:
    dw $FF70,$FF70,$0090,$0090    ;$078DD6 |
    dw $FF40,$00C0,$0000,$0000    ;$078DDE |
DATA16_078DE6:
    dw $FF70,$0090,$FF70,$0090    ;$078DE6 |
    dw $0000,$0000,$FF40,$00C0    ;$078DEE |
DATA16_078DF6:
    dw $4083,$9C16,$CC1E,$0000    ;$078DF6 |
    dw $A089,$1603,$EB12,$4000    ;$078DFE |
    dw $A08F,$0F03,$EC35,$4000    ;$078E06 |
    dw $C006,$FE08,$00FF,$43A0    ;$078E0E |
    dw $A083,$FE37,$0794,$2000    ;$078E16 |
    dw $0089,$F904,$EB0E,$4800    ;$078E1E |
    dw $008F,$5604,$EA5E,$4800    ;$078E26 |
    dw $8006,$FE00,$00FF,$5800    ;$078E2E |
    dw $C083,$C420,$CED0,$6000    ;$078E36 |
    db $FF                        ;$078E3E |

CODE_078E3F:
    INC.W ReloadMapOnUnpause      ;$078E3F |
    INC.W ReloadRoom              ;$078E42 |
    RTL                           ;$078E45 |

CODE_078E46:
    %LoadLongToAX(.onCPU)
    JSL.L SA1_ExecuteSNES         ;$078E4C |
    RTL                           ;$078E50 |
  .onCPU:
    LDA.W #$0000                  ;$078E51 |
    STA.L $7F8800                 ;$078E54 |
    RTL                           ;$078E58 |

CODE_078E59:
    LDX.W #$003E                  ;$078E59 |

CODE_878E5C:
    STZ.W $7B80,X                 ;$078E5C |
    STZ.W $7BC0,X                 ;$078E5F |
    DEX                           ;$078E62 |
    DEX                           ;$078E63 |
    BPL CODE_878E5C               ;$078E64 |
    RTL                           ;$078E66 |

CODE_078E67:
    LDA.W SaveFile_Number         ;$078E67 |
    AND.W #$00FF                  ;$078E6A |
    CMP.W #$0003                  ;$078E6D |
    BCC CODE_878E75               ;$078E70 |
    LDA.W #$0000                  ;$078E72 |

CODE_878E75:
    STA.W Obj_VAR0,Y              ;$078E75 |
    LDA.W #$FFFF                  ;$078E78 |
    STA.W Obj_Pose,Y              ;$078E7B |
    RTL                           ;$078E7E |

FileSelectMainLoop:
    LDA.W P1_Frame                ;$078E7F |
    BIT.W #$0220                  ;$078E82 |
    BEQ CODE_878E9C               ;$078E85 |
    DEC.W Obj_VAR0,X              ;$078E87 |
    BMI CODE_878E97               ;$078E8A |
    LDA.W #$0046                  ;$078E8C |
    JSL.L PlaySFX                 ;$078E8F |
    LDX.B $39                     ;$078E93 |
    BRA CODE_878EBE               ;$078E95 |

CODE_878E97:
    STZ.W Obj_VAR0,X              ;$078E97 |
    BRA CODE_878EBE               ;$078E9A |

CODE_878E9C:
    BIT.W #$0110                  ;$078E9C |
    BEQ CODE_878EBE               ;$078E9F |
    LDA.W Obj_VAR0,X              ;$078EA1 |
    INC A                         ;$078EA4 |
    CMP.W #$0003                  ;$078EA5 |
    BCC CODE_878EB2               ;$078EA8 |
    LDA.W #$0002                  ;$078EAA |
    STA.W Obj_VAR0,X              ;$078EAD |
    BRA CODE_878EBE               ;$078EB0 |

CODE_878EB2:
    STA.W Obj_VAR0,X              ;$078EB2 |
    LDA.W #$0046                  ;$078EB5 |
    JSL.L PlaySFX                 ;$078EB8 |
    LDX.B $39                     ;$078EBC |

CODE_878EBE:
    LDA.W P1_Frame                ;$078EBE |
    BIT.W #$5080                  ;$078EC1 |
    BNE CODE_878ED3               ;$078EC4 |
    LDX.W #$0000                  ;$078EC6 |
    BIT.W #$2000                  ;$078EC9 |
    BEQ CODE_878ED1               ;$078ECC |
    LDX.W #$0001                  ;$078ECE |

CODE_878ED1:
    TXA                           ;$078ED1 |
    RTL                           ;$078ED2 |

CODE_878ED3:
    LDA.W Obj_VAR0,Y              ;$078ED3 |
    ASL A                         ;$078ED6 |
    TAX                           ;$078ED7 |
    LDA.L DATA16_0791ED,X         ;$078ED8 |
    STA.W SaveFile_Offset         ;$078EDC |
    LDA.W #$0000                  ;$078EDF |
    JSL.L CODE_FL_00EC42          ;$078EE2 |
    LDA.W #$0032                  ;$078EE6 | ; Sound to play when selecting a file
    JSL.L PlaySFX                 ;$078EE9 |
    LDY.B $39                     ;$078EED |
    LDA.W Obj_VAR0,Y              ;$078EEF |
    SEP #$20                      ;$078EF2 |
    STA.W SaveFile_Number         ;$078EF4 |
    REP #$20                      ;$078EF7 |
    LDA.W $7A93                   ;$078EF9 |
    STA.W $7A8F                   ;$078EFC |
    LDA.W #$0002                  ;$078EFF |
    RTL                           ;$078F02 |

CODE_878F03:
    LDA.W Obj_VAR0,Y              ;$078F03 |
    ASL A                         ;$078F06 |
    TAX                           ;$078F07 |
    LDA.L DATA16_0791ED,X         ;$078F08 |
    TAX                           ;$078F0C |
    LDA.W $7F04,X                 ;$078F0D |
    SEC                           ;$078F10 |
    SBC.W #$04EF                  ;$078F11 |
    BNE CODE_878F20               ;$078F14 |
    LDA.W SaveFile_Subgame,X      ;$078F16 |
    AND.W #$00FF                  ;$078F19 |
    SEC                           ;$078F1C |
    SBC.W #$00FF                  ;$078F1D |
CODE_878F20:
    RTL                           ;$078F20 |

CODE_878F21:
    LDA.W Obj_VAR0,Y              ;$078F21 |
    JSL.L EraseFile               ;$078F24 |
    LDA.W #$0000                  ;$078F28 |
    JSL.L CODE_FL_078FEF          ;$078F2B |
    LDY.B $39                     ;$078F2F |
    LDA.W #$00B4                  ;$078F31 |
    STA.W Obj_ScriptSleepTimer,Y  ;$078F34 |
    RTL                           ;$078F37 |

CODE_878F38:
    LDX.W #$0694                  ;$078F38 |
    BRA CODE_878F45               ;$078F3B |
CODE_878F3D:
    LDX.W #$0696                  ;$078F3D |
    BRA CODE_878F45               ;$078F40 |

CODE_878F42:
    LDX.W #$0698                  ;$078F42 |
CODE_878F45:
    LDA.W #$001A                  ;$078F45 |
    JSL.L CODE_FL_01DE76          ;$078F48 |
    RTL                           ;$078F4C |

CODE_878F4D:
    LDX.W #$0000                  ;$078F4D |
    LDA.W P1_Frame                ;$078F50 |
    BIT.W #$8080                  ;$078F53 |
    BEQ CODE_878F68               ;$078F56 |
    INX                           ;$078F58 |
    BIT.W #$8000                  ;$078F59 |
    BNE CODE_878F5F               ;$078F5C |
    INX                           ;$078F5E |

CODE_878F5F:
    PHX                           ;$078F5F |
    LDA.W #$0046                  ;$078F60 |
    JSL.L PlaySFX                 ;$078F63 |
    PLX                           ;$078F67 |

CODE_878F68:
    TXA                           ;$078F68 |
    RTL                           ;$078F69 |

CODE_078F6A:
    %LoadLongToAX(DATA8_078F75)
    JSL.L LoadDMATable            ;$078F70 |
    RTL                           ;$078F74 |

DATA8_078F75:
    db $06 : dw $0800 : dl DATA8_078F7E : dw $5800
    db $FF
DATA8_078F7E:
    dw $0000                      ;$078F7E |

CODE_878F80:
    LDA.W #$000F                  ;$078F80 |
    LDX.W #$000F                  ;$078F83 |
    LDY.W #$000F                  ;$078F86 |
    JSL.L CODE_FL_059D24          ;$078F89 |
    SEP #$20                      ;$078F8D |
    LDA.B #$02                    ;$078F8F |
    STA.W ColorAddition_Settings  ;$078F91 |
    LDA.B #$B3                    ;$078F94 |
    STA.W CGADSUB_Settings        ;$078F96 |
    STZ.W SubScreenDesignation    ;$078F99 |
    REP #$20                      ;$078F9C |
    RTL                           ;$078F9E |

CODE_878F9F:
    SEP #$20                      ;$078F9F |
    LDA.B #$00                    ;$078FA1 |
    STA.W CGADSUB_Settings        ;$078FA3 |
    REP #$20                      ;$078FA6 |
    RTL                           ;$078FA8 |

CODE_078FA9:
    JSL.L AS_ReadWord_L           ;$078FA9 |
    TAX                           ;$078FAD |
    JSL.L AS_ReadWord_L           ;$078FAE |

CODE_FL_078FB2:
    PHA                           ;$078FB2 |
    STX.W ObjVar0_Temp            ;$078FB3 |
    STZ.W ObjSlotMinimum          ;$078FB6 |
    LDA.W #$007A                  ;$078FB9 |
    STA.W ObjSlotMaximum          ;$078FBC |
    LDA.W #$0000                  ;$078FBF |
    JSL.L CreateNewObject         ;$078FC2 |
    TAX                           ;$078FC6 |
    PLA                           ;$078FC7 |
    BCS CODE_878FE1               ;$078FC8 |
    LDY.B $39                     ;$078FCA |
    STA.W Obj_ScriptProgramCounter,X;$078FCC |
    LDA.W #$4007                  ;$078FCF |
    STA.W Obj_ScriptProgramBank,X ;$078FD2 |
    LDA.W Obj_XPosition,Y         ;$078FD5 |
    STA.W Obj_XPosition,X         ;$078FD8 |
    LDA.W Obj_YPosition,Y         ;$078FDB |
    STA.W Obj_YPosition,X         ;$078FDE |

CODE_878FE1:
    RTL                           ;$078FE1 |

CODE_FL_078FE2:
    LDA.W Obj_VAR0,Y              ;$078FE2 |
    ASL A                         ;$078FE5 |
    TAX                           ;$078FE6 |
    LDA.L DATA16_0791ED,X         ;$078FE7 |
    JSL.L CODE_FL_00EF94          ;$078FEB |

CODE_FL_078FEF:
    STA.B IdentifySNES            ;$078FEF |
    LDY.W #$0000                  ;$078FF1 |
    LDA.B IdentifySNES            ;$078FF4 |
    CMP.W #$0064                  ;$078FF6 |
    BCC CODE_878FFF               ;$078FF9 |
    SBC.W #$0064                  ;$078FFB |
    INY                           ;$078FFE |

CODE_878FFF:
    STY.B DSP_SRCN                ;$078FFF |
    LDY.W #$0000                  ;$079001 |

CODE_079004:
    CMP.W #$000A                  ;$079004 |
    BCC CODE_87900F               ;$079007 |
    SBC.W #$000A                  ;$079009 |
    INY                           ;$07900C |
    BRA CODE_079004               ;$07900D |

CODE_87900F:
    STA.B IdentifySNES            ;$07900F |
    TYA                           ;$079011 |
    BNE CODE_87901B               ;$079012 |
    LDA.B DSP_SRCN                ;$079014 |
    BNE CODE_87901B               ;$079016 |
    LDY.W #$000A                  ;$079018 |

CODE_87901B:
    STY.B DSP_P                   ;$07901B |
    LDA.W #$0009                  ;$07901D |
    STA.B $31                     ;$079020 |
    LDA.W #$0006                  ;$079022 |
    STA.B $32                     ;$079025 |
    LDA.W DecompressedDataDest    ;$079027 |
    STA.B $34                     ;$07902A |
    STA.B SNES_WaitForCommand_waitForMessage    ;$07902C |
    CLC                           ;$07902E |
    ADC.W #$000C                  ;$07902F |
    STA.W DecompressedDataDest    ;$079032 |
    LDA.W #$007E                  ;$079035 |
    STA.B P1_ResetRepeat          ;$079038 |
    STA.B $16                     ;$07903A |
    LDY.B $39                     ;$07903C |
    LDA.W Obj_VAR0,Y              ;$07903E |
    ASL A                         ;$079041 |
    TAX                           ;$079042 |
    LDA.L DATA8_0790D1,X          ;$079043 |
    STA.B CameraX_TileMirror      ;$079047 |
    %LoadLongToAX(CODE_879053)
    JML.L SA1_ExecuteSNES         ;$07904F |
CODE_879053:
    LDY.W #$0006                  ;$079053 |
    LDA.B DSP_SRCN                ;$079056 |
    BNE CODE_879061               ;$079058 |
    LDA.W #$1B1B                  ;$07905A |
    STA.B [SNES_WaitForCommand_waitForMessage];$07905D |
    BRA CODE_879069               ;$07905F |

CODE_879061:
    LDA.W #$A7A6                  ;$079061 |
    STA.B [SNES_WaitForCommand_waitForMessage];$079064 |
    LDA.W #$AFAE                  ;$079066 |

CODE_879069:
    STA.B [SNES_WaitForCommand_waitForMessage],Y    ;$079069 |
    INC.B SNES_WaitForCommand_waitForMessage        ;$07906B |
    INC.B SNES_WaitForCommand_waitForMessage        ;$07906D |
    SEP #$20                                        ;$07906F |
    LDX.B DSP_P                                     ;$079071 |
    LDA.L DATA8_0790D7,X                            ;$079073 |
    STA.B [SNES_WaitForCommand_waitForMessage]      ;$079077 |
    LDA.L DATA8_0790E2,X                            ;$079079 |
    STA.B [SNES_WaitForCommand_waitForMessage],Y    ;$07907D |
    REP #$20                                        ;$07907F |
    INC.B SNES_WaitForCommand_waitForMessage        ;$079081 |
    SEP #$20                                        ;$079083 |
    LDA.L DATA8_0790ED,X                            ;$079085 |
    STA.B [SNES_WaitForCommand_waitForMessage]      ;$079089 |
    LDA.L DATA8_0790F8,X                            ;$07908B |
    STA.B [SNES_WaitForCommand_waitForMessage],Y    ;$07908F |
    REP #$20                                        ;$079091 |
    INC.B SNES_WaitForCommand_waitForMessage        ;$079093 |
    SEP #$20                                        ;$079095 |
    LDX.B IdentifySNES                              ;$079097 |
    LDA.L DATA8_0790D7,X                            ;$079099 |
    STA.B [SNES_WaitForCommand_waitForMessage]      ;$07909D |
    LDA.L DATA8_0790E2,X                            ;$07909F |
    STA.B [SNES_WaitForCommand_waitForMessage],Y    ;$0790A3 |
    REP #$20                                        ;$0790A5 |
    INC.B SNES_WaitForCommand_waitForMessage        ;$0790A7 |
    SEP #$20                                        ;$0790A9 |
    LDA.L DATA8_0790ED,X                            ;$0790AB |
    STA.B [SNES_WaitForCommand_waitForMessage]      ;$0790AF |
    LDA.L DATA8_0790F8,X                            ;$0790B1 |
    STA.B [SNES_WaitForCommand_waitForMessage],Y    ;$0790B5 |
    REP #$20                                        ;$0790B7 |
    JSL.L WriteToDMABuffer                          ;$0790B9 |
    LDA.B $34                                       ;$0790BD |
    CLC                                             ;$0790BF |
    ADC.W #$0006                                    ;$0790C0 |
    STA.B $34                                       ;$0790C3 |
    LDA.B CameraX_TileMirror                        ;$0790C5 |
    CLC                                             ;$0790C7 |
    ADC.W #$0020                                    ;$0790C8 |
    STA.B CameraX_TileMirror                        ;$0790CB |
    JML.L WriteToDMABuffer                          ;$0790CD |

DATA8_0790D1:
    db $22,$42,$2C,$42,$36,$42    ;$0790D1 |

DATA8_0790D7:
    db $82,$84,$86,$88,$8A,$8C,$8E,$A0;$0790D7 |
    db $A2,$A4,$1B                ;$0790DF |

DATA8_0790E2:
    db $92,$94,$96,$98,$9A,$9C,$9E,$A8;$0790E2 |
    db $AA,$AC,$1B                ;$0790EA |

DATA8_0790ED:
    db $83,$85,$87,$89,$8B,$8D,$8F,$A1;$0790ED |
    db $A3,$A5,$1B                ;$0790F5 |

DATA8_0790F8:
    db $93,$95,$97,$99,$9B,$9D,$9F,$A9;$0790F8 |
    db $AB,$AD,$1B                ;$079100 |

CODE_079103:
    JSL.L CODE_FL_00A8D2          ;$079103 |
    LDA.W #$2200                  ;$079107 |
    SEC                           ;$07910A |
    SBC.W CameraY_TileMirror      ;$07910B |
    LDX.W #$0012                  ;$07910E |
  .loop:
    STA.W $7BD4,X                 ;$079111 |
    DEX                           ;$079114 |
    DEX                           ;$079115 |
    BPL .loop                     ;$079118 |
    %LoadLongToAX(DATA16_079174)
    JSL.L LoadDMATable            ;$07911E |
    RTL                           ;$079122 |

CODE_879123:
    TXY                           ;$079123 |
    LDA.W Obj_VAR0,X              ;$079124 |
    ASL A                         ;$079127 |
    TAX                           ;$079128 |
    LDA.L DATA16_079162,X         ;$079129 |
    STA.W Obj_XPosition,Y         ;$07912D |
    LDA.W #$0070                  ;$079130 |
    STA.W Obj_YPosition,Y         ;$079133 |
    LDA.W $778C                   ;$079136 |
    INC A                         ;$079139 |
    INC A                         ;$07913A |
    CMP.W #$0006                  ;$07913B |
    BCC CODE_879143               ;$07913E |
    LDA.W #$0000                  ;$079140 |

CODE_879143:
    STA.W $778C                   ;$079143 |
    %LoadLongToAX(CODE_879150)
    JML.L SA1_ExecuteSNES         ;$07914C |
CODE_879150:
    LDX.W $778C                   ;$079150 |
    LDA.L DATA16_079168,X         ;$079153 |
    STA.W $0608                   ;$079157 |
    LDA.L DATA16_07916E,X         ;$07915A |
    STA.W $060E                   ;$07915E |
    RTL                           ;$079161 |

DATA16_079162:
    dw $0030,$0080,$00D0          ;$079162 |

DATA16_079168:
    dw $031F,$7F80,$7C16          ;$079168 |

DATA16_07916E:
    dw $0000,$7FFF,$7C1F          ;$07916E |

DATA16_079174:
    dw $8003,$8000,$007B,$5800    ;$079174 |
    db $FF                        ;$07917C |

CODE_07917D:
    LDA.W Obj_VAR0,Y              ;$07917D |
    ASL A                         ;$079180 |
    TAX                           ;$079181 |
    LDA.L DATA16_0791ED,X         ;$079182 |
    STA.B IdentifySNES            ;$079186 |
    LDA.L DATA16_0791E7,X         ;$079188 |
    STA.W Obj_XPositionMirror,Y   ;$07918C |
    LDA.W CameraY_TileMirror      ;$07918F |
    CPX.W #$0002                  ;$079192 |
    BEQ CODE_87919B               ;$079195 |
    EOR.W #$FFFF                  ;$079197 |
    INC A                         ;$07919A |

CODE_87919B:
    STA.W Obj_YPositionMirror,Y   ;$07919B |
    LDA.W Obj_VAR0,Y              ;$07919E |
    ASL A                         ;$0791A1 |
    TAX                           ;$0791A2 |
    LDA.L DATA16_0791ED,X         ;$0791A3 |
    TAX                           ;$0791A7 |
    LDA.W SaveFile_Subgame,X      ;$0791A8 |
    AND.W #$00FF                  ;$0791AB |
    CMP.W #$0007                  ;$0791AE |
    BCS CODE_8791C0               ;$0791B1 |
    CLC                           ;$0791B3 |
    ADC.W #$0000                  ;$0791B4 |
    LDX.W #$0030                  ;$0791B7 |
    LDY.W #$00BB                  ;$0791BA |
    JSR.W CODE_FN_07920F          ;$0791BD |

CODE_8791C0:
    LDX.W #$000C                  ;$0791C0 |

CODE_8791C3:
    LDY.B IdentifySNES            ;$0791C3 |
    LDA.W SaveFile_GamesFinished,Y;$0791C5 |
    BIT.W All_Bits16_BE,X         ;$0791C8 |
    BEQ CODE_8791E2               ;$0791CB |
    PHX                           ;$0791CD |
    LDA.L DATA16_0791F3,X         ;$0791CE |
    PHA                           ;$0791D2 |
    LDA.L DATA16_079201,X         ;$0791D3 |
    TAY                           ;$0791D7 |
    TXA                           ;$0791D8 |
    LSR A                         ;$0791D9 |
    ADC.W #$0008                  ;$0791DA |
    PLX                           ;$0791DD |
    JSR.W CODE_FN_07920F          ;$0791DE |
    PLX                           ;$0791E1 |

CODE_8791E2:
    DEX                           ;$0791E2 |
    DEX                           ;$0791E3 |
    BPL CODE_8791C3               ;$0791E4 |
    RTL                           ;$0791E6 |

DATA16_0791E7:
    dw $0000,$0050,$00A0          ;$0791E7 |

DATA16_0791ED:
    dw $0000,$004F,$009E          ;$0791ED |

DATA16_0791F3:
    dw $001C,$0030,$0044,$001C    ;$0791F3 |
    dw $0030,$0044,$002E          ;$0791FB |

DATA16_079201:
    dw $0056,$0050,$0056,$006E    ;$079201 |
    dw $0068,$006E,$007C          ;$079209 |

CODE_FN_07920F:
    ASL A                         ;$07920F |
    PHA                           ;$079210 |
    TXA                           ;$079211 |
    LDX.B $39                     ;$079212 |
    CLC                           ;$079214 |
    ADC.W Obj_XPositionMirror,X   ;$079215 |
    STA.W $302F                   ;$079218 |
    TYA                           ;$07921B |
    CLC                           ;$07921C |
    ADC.W Obj_YPositionMirror,X   ;$07921D |
    STA.W $3031                   ;$079220 |
    LDA.W Obj_SpriteMapAddr,X     ;$079223 |
    STA.B SNES_WaitForCommand_waitForMessage;$079226 |
    LDA.W Obj_SpriteMapBank,X     ;$079228 |
    STA.B $16                     ;$07922B |
    PLY                           ;$07922D |
    LDA.B [SNES_WaitForCommand_waitForMessage],Y;$07922E |
    TAY                           ;$079230 |
    LDA.B $16                     ;$079231 |
    JSL.L CODE_FL_00AC57          ;$079233 |
    RTS                           ;$079237 |

    ; Unused?? Unsure. Data consists of (what appears to be) a set of two bytes followed by a long, but honestly unsure how this data should be read.
    ; It was never hit during extensive playtime.
    db $01,$FD,$00,$06,$3A,$01,$ED,$00;$079238 |
    db $04,$3A,$00,$ED,$F8,$10,$3A,$00;$079240 |
    db $05,$F8,$13,$3A,$00,$05,$F0,$03;$079248 |
    db $3A,$03,$F5,$F0,$01,$3A,$00,$04;$079250 |
    db $09,$27,$3A,$00,$FC,$09,$26,$3A;$079258 |
    db $00,$F4,$09,$25,$3A,$00,$0C,$01;$079260 |
    db $1F,$3A,$00,$04,$01,$1E,$3A,$00;$079268 |
    db $FC,$01,$1D,$3A,$00,$F4,$01,$1C;$079270 |
    db $3A,$00,$EC,$01,$1B,$3A,$00,$0C;$079278 |
    db $F9,$34,$3A,$00,$0C,$F1,$24,$3A;$079280 |
    db $01,$FC,$F1,$22,$3A,$03,$EC,$F1;$079288 |
    db $20,$3A,$00,$EA,$03,$4C,$32,$01;$079290 |
    db $0A,$E3,$8C,$32,$00,$FA,$0C,$3C;$079298 |
    db $3C,$00,$F6,$04,$2C,$3C,$00,$0E;$0792A0 |
    db $04,$37,$3C,$00,$06,$04,$36,$3C;$0792A8 |
    db $00,$FE,$04,$35,$3C,$01,$06,$F4;$0792B0 |
    db $2A,$3C,$01,$F6,$F4,$28,$3C,$00;$0792B8 |
    db $F1,$07,$AF,$32,$01,$F1,$EA,$8A;$0792C0 |
    db $32,$03,$EA,$F8,$8E,$32,$00,$EA;$0792C8 |
    db $FA,$6C,$34,$00,$E2,$FA,$6B,$34;$0792D0 |
    db $00,$E2,$02,$7B,$34,$01,$EA,$02;$0792D8 |
    db $69,$34,$01,$F2,$F2,$67,$34,$00;$0792E0 |
    db $0C,$09,$AB,$38,$00,$04,$09,$AA;$0792E8 |
    db $38,$00,$FC,$09,$A9,$38,$00,$14;$0792F0 |
    db $01,$A8,$38,$00,$14,$F9,$A7,$38;$0792F8 |
    db $00,$06,$E9,$A2,$38,$00,$0C,$F1;$079300 |
    db $A6,$38,$00,$04,$F1,$A5,$38,$00;$079308 |
    db $FC,$F1,$A4,$38,$00,$F4,$F1,$A3;$079310 |
    db $38,$01,$04,$F9,$82,$38,$01,$F4;$079318 |
    db $F9,$80,$38,$00,$FE,$E9,$0F,$38;$079320 |
    db $02,$F6,$E9,$0E,$38,$00,$05,$12;$079328 |
    db $54,$36,$00,$F5,$12,$54,$36,$00;$079330 |
    db $FD,$F2,$AE,$32,$00,$F5,$F2,$AD;$079338 |
    db $32,$01,$F5,$E2,$88,$32,$00,$EF;$079340 |
    db $0A,$46,$36,$00,$0F,$0A,$55,$36;$079348 |
    db $00,$07,$0A,$45,$36,$00,$FF,$0A;$079350 |
    db $44,$36,$00,$F7,$0A,$43,$36,$00;$079358 |
    db $0F,$02,$53,$36,$00,$07,$02,$52;$079360 |
    db $36,$00,$07,$FA,$42,$36,$03,$F7;$079368 |
    db $FA,$40,$36,$00,$00,$14,$5B,$3A;$079370 |
    db $00,$FB,$0C,$4B,$3A,$00,$F3,$0C;$079378 |
    db $4A,$3A,$00,$03,$0C,$5A,$3A,$00;$079380 |
    db $03,$04,$59,$3A,$00,$03,$FC,$49;$079388 |
    db $3A,$01,$F3,$FC,$47,$3A,$00,$0F;$079390 |
    db $F4,$00,$30,$00,$07,$F4,$76,$30;$079398 |
    db $00,$FF,$F4,$75,$30,$00,$F7,$F4;$0793A0 |
    db $66,$30,$00,$EF,$F4,$65,$30,$00;$0793A8 |
    db $0F,$EC,$74,$30,$00,$0F,$E4,$64;$0793B0 |
    db $30,$01,$FF,$E4,$62,$30,$03,$EF;$0793B8 |
    db $E4,$60,$30,$00,$0D,$F5,$BC,$3E;$0793C0 |
    db $00,$05,$F5,$BB,$3E,$00,$FD,$F5;$0793C8 |
    db $BA,$3E,$00,$F5,$F5,$B9,$3E,$00;$0793D0 |
    db $ED,$F5,$B8,$3E,$01,$05,$E5,$2D;$0793D8 |
    db $3E,$00,$FD,$ED,$5F,$3E,$00,$FD;$0793E0 |
    db $E5,$4F,$3E,$01,$ED,$E5,$4D,$3E;$0793E8 |
    db $00,$F1,$07,$0D,$7E,$00,$F1,$FF;$0793F0 |
    db $1A,$7E,$00,$F1,$F7,$0A,$7E,$00;$0793F8 |
    db $08,$07,$0D,$3E,$00,$00,$07,$0C;$079400 |
    db $3E,$00,$F8,$07,$0B,$3E,$00,$08;$079408 |
    db $FF,$1A,$3E,$00,$08,$F7,$0A,$3E;$079410 |
    db $03,$F8,$F7,$08,$3E,$00,$22,$50;$079418 |
    db $AC,$70,$00,$D6,$50,$AC,$30,$01;$079420 |
    db $F8,$5E,$6E,$B0,$01,$08,$5E,$6E;$079428 |
    db $B0,$01,$E8,$5E,$6E,$B0,$01,$F8;$079430 |
    db $9A,$6E,$30,$01,$08,$9A,$6E,$30;$079438 |
    db $01,$E8,$9A,$6E,$30,$01,$1D,$C0;$079440 |
    db $86,$30,$01,$1D,$D0,$86,$30,$01;$079448 |
    db $1D,$E0,$86,$30,$01,$1D,$F0,$86;$079450 |
    db $30,$01,$1D,$00,$86,$30,$01,$1D;$079458 |
    db $10,$86,$30,$01,$1D,$20,$86,$30;$079460 |
    db $01,$1D,$30,$86,$30,$01,$1D,$40;$079468 |
    db $86,$30,$01,$1D,$B0,$86,$30,$01;$079470 |
    db $D4,$C0,$86,$30,$01,$D4,$D0,$86;$079478 |
    db $30,$01,$D4,$E0,$86,$30,$01,$D4;$079480 |
    db $F0,$86,$30,$01,$D4,$00,$86,$30;$079488 |
    db $01,$D4,$10,$86,$30,$01,$D4,$20;$079490 |
    db $86,$30,$01,$D4,$30,$86,$30,$01;$079498 |
    db $D4,$40,$86,$30,$01,$D4,$B0,$86;$0794A0 |
    db $30,$01,$D8,$A0,$84,$F0,$01,$D8;$0794A8 |
    db $58,$84,$70,$01,$18,$A0,$84,$B0;$0794B0 |
    db $03,$18,$58,$84,$30,$00,$FC,$00;$0794B8 |
    db $3F,$34,$02,$FC,$F8,$2F,$34,$00;$0794C0 |
    db $FC,$00,$7D,$34,$02,$FC,$F8,$6D;$0794C8 |
    db $34,$00,$FC,$00,$B2,$34,$02,$FC;$0794D0 |
    db $F8,$5C,$34,$00,$FC,$00,$B4,$34;$0794D8 |
    db $02,$FC,$F8,$B3,$34,$00,$FC,$00;$0794E0 |
    db $B6,$34,$02,$FC,$F8,$B5,$34,$00;$0794E8 |
    db $FC,$00,$7C,$34,$02,$FC,$F8,$B7;$0794F0 |
    db $34,$03,$FA,$F8,$A0,$34    ;$0794F8 |

GFX_MainTitleScreenBackgroundCompressed:
    incbin "Graphics/MainTitleBackground (0794FE).bin"

; Also unsure what this data could be. Are these all pointers? Some of this was also never hit after extensive playtime.
    db $F8,$7C,$BF,$7F,$FF,$7F,$BB,$7E;$07BE3D |
    db $DB,$7E,$DB,$7E,$DB,$7E,$DB,$7E;$07BE45 |
    db $DB,$7E,$DB,$7E,$DB,$7E,$DB,$7E;$07BE4D |
    db $DB,$7E,$DB,$7E,$DB,$7E,$DB,$7E;$07BE55 |
    db $F8,$7C,$BF,$7F,$FF,$7F,$BB,$7E;$07BE5D |
    db $FC,$7E,$FC,$7E,$FC,$7E,$FC,$7E;$07BE65 |
    db $FC,$7E,$FC,$7E,$FC,$7E,$FC,$7E;$07BE6D |
    db $FC,$7E,$FC,$7E,$FC,$7E,$FC,$7E;$07BE75 |
    db $F8,$7C,$BF,$7F,$FF,$7F,$BB,$7E;$07BE7D |
    db $1C,$7F,$1C,$7F,$1C,$7F,$1C,$7F;$07BE85 |
    db $1C,$7F,$1C,$7F,$1C,$7F,$1C,$7F;$07BE8D |
    db $1C,$7F,$1C,$7F,$1C,$7F,$1C,$7F;$07BE95 |
    db $F8,$7C,$BF,$7F,$FF,$7F,$BB,$7E;$07BE9D |
    db $3D,$7F,$3D,$7F,$3D,$7F,$3D,$7F;$07BEA5 |
    db $3D,$7F,$3D,$7F,$3D,$7F,$3D,$7F;$07BEAD |
    db $3D,$7F,$3D,$7F,$3D,$7F,$3D,$7F;$07BEB5 |
    db $F8,$7C,$BF,$7F,$FF,$7F,$BB,$7E;$07BEBD |
    db $5D,$7F,$5D,$7F,$5D,$7F,$5D,$7F;$07BEC5 |
    db $5D,$7F,$5D,$7F,$5D,$7F,$5D,$7F;$07BECD |
    db $5D,$7F,$5D,$7F,$5D,$7F,$5D,$7F;$07BED5 |
    db $F8,$7C,$BF,$7F,$FF,$7F,$BB,$7E;$07BEDD |
    db $7D,$7F,$7D,$7F,$7D,$7F,$7D,$7F;$07BEE5 |
    db $7D,$7F,$7D,$7F,$7D,$7F,$7D,$7F;$07BEED |
    db $7D,$7F,$7D,$7F,$7D,$7F,$7D,$7F;$07BEF5 |
    db $F8,$7C,$BF,$7F,$FF,$7F,$BB,$7E;$07BEFD |
    db $9E,$7F,$9E,$7F,$9E,$7F,$9E,$7F;$07BF05 |
    db $9E,$7F,$9E,$7F,$9E,$7F,$9E,$7F;$07BF0D |
    db $9E,$7F,$9E,$7F,$9E,$7F,$9E,$7F;$07BF15 |
    db $F8,$7C,$BF,$7F,$FF,$7F,$BB,$7E;$07BF1D |
    db $BE,$7F,$BE,$7F,$BE,$7F,$BE,$7F;$07BF25 |
    db $BE,$7F,$BE,$7F,$BE,$7F,$BE,$7F;$07BF2D |
    db $BE,$7F,$BE,$7F,$BE,$7F,$BE,$7F;$07BF35 |
    db $F8,$7C,$BF,$7F,$FF,$7F,$BB,$7E;$07BF3D |
    db $DF,$7F,$DF,$7F,$DF,$7F,$DF,$7F;$07BF45 |
    db $DF,$7F,$DF,$7F,$DF,$7F,$DF,$7F;$07BF4D |
    db $DF,$7F,$DF,$7F,$DF,$7F,$DF,$7F;$07BF55 |
    db $F8,$7C,$BF,$7F,$FF,$7F,$BB,$7E;$07BF5D |
    db $FF,$7F,$FF,$7F,$FF,$7F,$FF,$7F;$07BF65 |
    db $FF,$7F,$FF,$7F,$FF,$7F,$FF,$7F;$07BF6D |
    db $FF,$7F,$FF,$7F,$FF,$7F,$FF,$7F;$07BF75 |
    db $F8,$7C,$BF,$7F,$FF,$7F,$BB,$7E;$07BF7D |
    db $DE,$7B,$DF,$7B,$DF,$7B,$FF,$7F;$07BF85 |
    db $DF,$7B,$DE,$7B,$FF,$7B,$FF,$7F;$07BF8D |
    db $FF,$7B,$FF,$7F,$DE,$7B,$FF,$7B;$07BF95 |
    db $F8,$7C,$BF,$7F,$FF,$7F,$BB,$7E;$07BF9D |
    db $BD,$77,$DF,$77,$DE,$77,$FF,$7F;$07BFA5 |
    db $BF,$77,$BD,$77,$DF,$7B,$DE,$7B;$07BFAD |
    db $DE,$7B,$FF,$7B,$DE,$77,$DF,$77;$07BFB5 |
    db $F8,$7C,$BF,$7F,$FF,$7F,$BB,$7E;$07BFBD |
    db $9C,$73,$BF,$73,$BE,$73,$FF,$7F;$07BFC5 |
    db $BE,$73,$9D,$73,$DF,$77,$DE,$7B;$07BFCD |
    db $DE,$77,$FF,$7B,$BD,$77,$DF,$73;$07BFD5 |
    db $F8,$7C,$BF,$7F,$FF,$7F,$BB,$7E;$07BFDD |
    db $7B,$6F,$9E,$6F,$9D,$6F,$FF,$7F;$07BFE5 |
    db $9E,$6F,$9C,$73,$DF,$73,$DE,$7B;$07BFED |
    db $BD,$77,$DF,$7B,$9C,$73,$BF,$6F;$07BFF5 |
    db $F8,$7C,$BF,$7F,$FF,$7F,$BB,$7E;$07BFFD |
    db $5A,$6B,$9E,$6B,$7D,$6B,$FF,$7F;$07C005 |
    db $7E,$6B,$7B,$6F,$BF,$73,$DE,$77;$07C00D |
    db $BD,$73,$DF,$77,$7C,$6F,$BF,$6B;$07C015 |
    db $F8,$7C,$BF,$7F,$FF,$7F,$BB,$7E;$07C01D |
    db $39,$67,$7E,$67,$7C,$67,$FF,$7F;$07C025 |
    db $5E,$67,$5A,$6B,$BF,$6F,$BD,$77;$07C02D |
    db $9C,$73,$DF,$77,$7B,$6B,$9F,$67;$07C035 |
    db $F8,$7C,$BF,$7F,$FF,$7F,$BB,$7E;$07C03D |
    db $18,$63,$5E,$63,$5C,$63,$FF,$7F;$07C045 |
    db $5D,$63,$3A,$67,$BF,$6B,$BD,$77;$07C04D |
    db $9C,$6F,$DF,$77,$5A,$67,$9F,$63;$07C055 |
    db $F8,$7C,$BF,$7F,$FF,$7F,$BB,$7E;$07C05D |
    db $F7,$5E,$5E,$5F,$3B,$63,$FF,$7F;$07C065 |
    db $3D,$5F,$19,$63,$9F,$6B,$BD,$73;$07C06D |
    db $7B,$6F,$DF,$73,$3A,$67,$9E,$5F;$07C075 |
    db $F8,$7C,$BF,$7F,$FF,$7F,$BB,$7E;$07C07D |
    db $D6,$5A,$3E,$5B,$1B,$5F,$FF,$7F;$07C085 |
    db $1D,$5B,$F8,$5E,$9F,$67,$9D,$73;$07C08D |
    db $7B,$6B,$DF,$73,$19,$63,$7E,$5B;$07C095 |
    db $F8,$7C,$BF,$7F,$FF,$7F,$BB,$7E;$07C09D |
    db $B5,$56,$1E,$57,$1A,$5B,$FF,$7F;$07C0A5 |
    db $FD,$56,$F7,$5A,$9F,$67,$9C,$73;$07C0AD |
    db $5A,$6B,$DF,$73,$19,$5F,$7E,$57;$07C0B5 |
    db $F8,$7C,$BF,$7F,$FF,$7F,$BB,$7E;$07C0BD |
    db $94,$52,$1E,$53,$FA,$56,$FF,$7F;$07C0C5 |
    db $DD,$52,$D6,$56,$7F,$63,$9C,$6F;$07C0CD |
    db $5A,$67,$DF,$6F,$F8,$5A,$5E,$53;$07C0D5 |
    db $F8,$7C,$BF,$7F,$FF,$7F,$BB,$7E;$07C0DD |
    db $73,$4E,$FD,$4E,$D9,$52,$FF,$7F;$07C0E5 |
    db $DC,$4E,$B6,$56,$7F,$5F,$9C,$6F;$07C0ED |
    db $39,$67,$BF,$6F,$D7,$56,$5E,$4F;$07C0F5 |
    db $F8,$7C,$BF,$7F,$FF,$7F,$BB,$7E;$07C0FD |
    db $52,$4A,$DD,$4A,$B9,$4E,$FF,$7F;$07C105 |
    db $BC,$4A,$95,$52,$7F,$5F,$7C,$6F;$07C10D |
    db $39,$63,$BF,$6F,$B7,$56,$5E,$4B;$07C115 |
    db $F8,$7C,$BF,$7F,$FF,$7F,$BB,$7E;$07C11D |
    db $31,$46,$DD,$46,$B8,$4A,$FF,$7F;$07C125 |
    db $9C,$46,$74,$4E,$5F,$5B,$7B,$6B;$07C12D |
    db $18,$63,$BF,$6B,$B6,$52,$3E,$47;$07C135 |
    db $F8,$7C,$BF,$7F,$FF,$7F,$BB,$7E;$07C13D |
    db $10,$42,$BD,$42,$98,$46,$FF,$7F;$07C145 |
    db $7C,$42,$53,$4A,$5F,$57,$7B,$6B;$07C14D |
    db $18,$5F,$BF,$6B,$95,$4E,$3E,$43;$07C155 |
    db $F8,$7C,$BF,$7F,$FF,$7F,$BB,$7E;$07C15D |
    db $10,$3E,$9D,$42,$77,$42,$FF,$7F;$07C165 |
    db $7B,$3E,$53,$46,$5E,$57,$5B,$6B;$07C16D |
    db $F7,$5E,$BE,$6B,$75,$4A,$1E,$3F;$07C175 |
    db $F8,$7C,$BF,$7F,$FF,$7F,$BB,$7E;$07C17D |
    db $EF,$39,$7D,$3E,$57,$3E,$FF,$7F;$07C185 |
    db $5B,$3A,$32,$42,$5E,$53,$5B,$6B;$07C18D |
    db $F7,$5A,$BE,$6B,$54,$46,$1E,$3B;$07C195 |
    db $F8,$7C,$BF,$7F,$FF,$7F,$BB,$7E;$07C19D |
    db $CE,$35,$7D,$3A,$56,$3A,$FF,$7F;$07C1A5 |
    db $3B,$36,$11,$3E,$3E,$4F,$5A,$67;$07C1AD |
    db $D6,$5A,$BE,$67,$53,$42,$FE,$36;$07C1B5 |
    db $F8,$7C,$BF,$7F,$FF,$7F,$BB,$7E;$07C1BD |
    db $AD,$31,$5D,$36,$36,$36,$FF,$7F;$07C1C5 |
    db $1B,$32,$F0,$39,$3E,$4F,$3A,$67;$07C1CD |
    db $D6,$56,$BE,$67,$33,$42,$FE,$32;$07C1D5 |
    db $F8,$7C,$BF,$7F,$FF,$7F,$BB,$7E;$07C1DD |
    db $8C,$2D,$3C,$32,$15,$32,$FF,$7F;$07C1E5 |
    db $1A,$2E,$D0,$39,$3E,$4B,$3A,$67;$07C1ED |
    db $B5,$56,$9E,$67,$12,$3E,$FE,$2E;$07C1F5 |
    db $F8,$7C,$BF,$7F,$FF,$7F,$BB,$7E;$07C1FD |
    db $6B,$29,$3C,$2E,$F5,$2D,$FF,$7F;$07C205 |
    db $FA,$29,$AF,$35,$1E,$47,$3A,$63;$07C20D |
    db $B5,$52,$9E,$63,$F1,$39,$DE,$2A;$07C215 |
    db $F8,$7C,$BF,$7F,$FF,$7F,$BB,$7E;$07C21D |
    db $4A,$25,$1C,$2A,$F4,$29,$FF,$7F;$07C225 |
    db $DA,$25,$AE,$31,$1E,$47,$39,$63;$07C22D |
    db $94,$52,$9E,$63,$F1,$35,$DE,$26;$07C235 |
    db $F8,$7C,$BF,$7F,$FF,$7F,$BB,$7E;$07C23D |
    db $29,$21,$FC,$25,$D4,$25,$FF,$7F;$07C245 |
    db $BA,$21,$8D,$2D,$1E,$43,$19,$63;$07C24D |
    db $94,$4E,$9E,$63,$D0,$31,$BE,$22;$07C255 |
    db $F8,$7C,$BF,$7F,$FF,$7F,$BB,$7E;$07C25D |
    db $08,$1D,$FC,$21,$B3,$25,$FF,$7F;$07C265 |
    db $9A,$1D,$6C,$29,$FE,$42,$19,$5F;$07C26D |
    db $73,$4E,$9E,$5F,$B0,$31,$BD,$1E;$07C275 |
    db $F8,$7C,$BF,$7F,$FF,$7F,$BB,$7E;$07C27D |
    db $E7,$18,$DC,$1D,$93,$21,$FF,$7F;$07C285 |
    db $99,$19,$4C,$25,$FE,$3E,$19,$5F;$07C28D |
    db $73,$4A,$9E,$5F,$8F,$2D,$BD,$1A;$07C295 |
    db $F8,$7C,$BF,$7F,$FF,$7F,$BB,$7E;$07C29D |
    db $C6,$14,$BC,$19,$92,$1D,$FF,$7F;$07C2A5 |
    db $79,$15,$2B,$21,$FE,$3A,$F8,$5E;$07C2AD |
    db $52,$4A,$9E,$5F,$8E,$29,$9D,$16;$07C2B5 |
    db $F8,$7C,$BF,$7F,$FF,$7F,$BB,$7E;$07C2BD |
    db $A5,$10,$BC,$15,$72,$19,$FF,$7F;$07C2C5 |
    db $59,$11,$0A,$1D,$DE,$3A,$F8,$5A;$07C2CD |
    db $52,$46,$9E,$5B,$6E,$25,$9D,$12;$07C2D5 |
    db $F8,$7C,$BF,$7F,$FF,$7F,$BB,$7E;$07C2DD |
    db $84,$0C,$9B,$11,$51,$15,$FF,$7F;$07C2E5 |
    db $39,$0D,$09,$1D,$DE,$36,$F8,$5A;$07C2ED |
    db $31,$46,$7E,$5B,$4D,$21,$7D,$0E;$07C2F5 |
    db $F8,$7C,$BF,$7F,$FF,$7F,$BB,$7E;$07C2FD |
    db $63,$08,$7B,$0D,$31,$11,$FF,$7F;$07C305 |
    db $38,$09,$E9,$18,$DE,$32,$F8,$5A;$07C30D |
    db $31,$42,$7E,$5B,$2C,$21,$7D,$0A;$07C315 |
    db $F8,$7C,$BF,$7F,$FF,$7F,$BB,$7E;$07C31D |
    db $42,$04,$7B,$09,$30,$0D,$FF,$7F;$07C325 |
    db $18,$05,$C8,$14,$BE,$32,$D7,$56;$07C32D |
    db $10,$42,$7E,$57,$2C,$1D,$5D,$06;$07C335 |
    db $F8,$7C,$BF,$7F,$FF,$7F,$BB,$7E;$07C33D |
    db $21,$00,$5B,$05,$10,$09,$FF,$7F;$07C345 |
    db $F8,$00,$A7,$10,$BE,$2E,$D7,$56;$07C34D |
    db $10,$3E,$7E,$57,$0B,$19,$5D,$02;$07C355 |
    db $58,$7E,$00,$0C,$44,$14,$86,$20;$07C35D |
    db $C7,$2C,$E9,$34,$4B,$45,$AD,$59;$07C365 |
    db $40,$51,$00,$10,$00,$14,$00,$18;$07C36D |
    db $00,$1C,$00,$20,$00,$28,$00,$30;$07C375 |
    db $D8,$18,$8B,$3D,$AC,$55,$B2,$59;$07C37D |
    db $B3,$75,$F6,$61,$CF,$5A,$95,$66;$07C385 |
    db $D6,$72,$9B,$76,$34,$67,$55,$73;$07C38D |
    db $FF,$7E,$B6,$77,$BA,$7B,$DE,$7F;$07C395 |
    db $12,$4B,$00,$00,$22,$0C,$A6,$1C;$07C39D |
    db $0D,$39,$CC,$35,$71,$51,$B6,$61;$07C3A5 |
    db $74,$3E,$D1,$5E,$59,$66,$3A,$76;$07C3AD |
    db $9D,$7A,$FF,$7E,$B8,$7B,$9E,$7F;$07C3B5 |
    db $0F,$3C,$60,$6F,$60,$6F,$60,$6F;$07C3BD |
    db $A7,$18,$0A,$21,$ED,$1C,$10,$21;$07C3C5 |
    db $4D,$29,$34,$1D,$16,$1D,$36,$21;$07C3CD |
    db $38,$21,$39,$25,$5A,$25,$5B,$29;$07C3D5 |
    db $0E,$38,$E1,$62,$E1,$62,$E1,$62;$07C3DD |
    db $A7,$18,$E9,$1C,$CC,$1C,$EE,$1C;$07C3E5 |
    db $0B,$25,$11,$1D,$F3,$1C,$13,$1D;$07C3ED |
    db $15,$1D,$16,$21,$16,$21,$18,$25;$07C3F5 |
    db $0C,$34,$61,$52,$61,$52,$61,$52;$07C3FD |
    db $86,$14,$C8,$18,$AA,$18,$CC,$18;$07C405 |
    db $EA,$20,$CF,$18,$D0,$18,$D0,$18;$07C40D |
    db $D2,$18,$D2,$1C,$F3,$1C,$F4,$20;$07C415 |
    db $0B,$34,$01,$46,$01,$46,$01,$46;$07C41D |
    db $65,$14,$A7,$18,$89,$14,$AA,$18;$07C425 |
    db $C8,$1C,$AC,$14,$AE,$14,$AE,$18;$07C42D |
    db $AF,$18,$AF,$18,$D0,$18,$D1,$1C;$07C435 |
    db $0A,$30,$81,$35,$81,$35,$81,$35;$07C43D |
    db $44,$10,$65,$14,$67,$10,$68,$14;$07C445 |
    db $87,$14,$8A,$10,$6B,$10,$8B,$14;$07C44D |
    db $8B,$14,$8C,$14,$8C,$14,$8D,$14;$07C455 |
    db $09,$2C,$02,$25,$02,$25,$02,$25;$07C45D |
    db $44,$0C,$44,$10,$45,$10,$46,$10;$07C465 |
    db $65,$10,$67,$10,$48,$10,$68,$10;$07C46D |
    db $68,$10,$69,$10,$69,$10,$69,$10;$07C475 |
    db $07,$28,$82,$18,$82,$18,$82,$18;$07C47D |
    db $23,$0C,$23,$0C,$24,$0C,$24,$0C;$07C485 |
    db $24,$0C,$25,$0C,$25,$0C,$25,$0C;$07C48D |
    db $25,$0C,$25,$0C,$25,$0C,$26,$0C;$07C495 |
    db $06,$24,$02,$08,$02,$08,$02,$08;$07C49D |
    db $02,$08,$02,$08,$02,$08,$02,$08;$07C4A5 |
    db $02,$08,$02,$08,$02,$08,$02,$08;$07C4AD |
    db $02,$08,$02,$08,$02,$08,$02,$08;$07C4B5 |
    db $0E,$38,$E1,$62,$E1,$62,$E1,$62;$07C4BD |
    db $A7,$18,$E9,$1C,$CC,$1C,$EE,$1C;$07C4C5 |
    db $0B,$25,$11,$1D,$F3,$1C,$13,$1D;$07C4CD |
    db $15,$1D,$16,$21,$16,$21,$18,$25;$07C4D5 |
    db $A8,$08,$65,$10,$A6,$14,$A7,$18;$07C4DD |
    db $C8,$1C,$E9,$1C,$EC,$14,$0A,$21;$07C4E5 |
    db $0B,$25,$67,$2D,$10,$11,$4D,$29;$07C4ED |
    db $16,$21,$70,$29,$D2,$35,$16,$3A;$07C4F5 |
    db $08,$14,$43,$08,$44,$0C,$64,$10;$07C4FD |
    db $85,$10,$A6,$14,$89,$10,$A7,$18;$07C505 |
    db $A7,$1C,$C9,$1C,$CA,$10,$0E,$15;$07C50D |
    db $10,$11,$13,$1D,$73,$1D,$D7,$29;$07C515 |
    db $A6,$20,$46,$0C,$A6,$10,$4D,$0C;$07C51D |
    db $50,$0C,$C8,$1C,$EB,$14,$ED,$14;$07C525 |
    db $D1,$14,$0D,$1D,$10,$11,$50,$1D;$07C52D |
    db $73,$25,$B6,$21,$F8,$29,$38,$2E;$07C535 |
    db $46,$08,$43,$08,$45,$08,$47,$08;$07C53D |
    db $48,$08,$84,$10,$4A,$0C,$A6,$14;$07C545 |
    db $4D,$0C,$A7,$18,$E4,$1C,$C8,$1C;$07C54D |
    db $E9,$1C,$0B,$25,$6E,$29,$B1,$31;$07C555 |
    db $C5,$14,$43,$0C,$85,$10,$A6,$14;$07C55D |
    db $A7,$18,$C8,$1C,$E9,$1C,$0A,$21;$07C565 |
    db $0B,$25,$2D,$29,$6E,$29,$6F,$2D;$07C56D |
    db $B1,$31,$D3,$35,$16,$3A,$38,$42;$07C575 |
    db $45,$20,$43,$0C,$85,$10,$A7,$18;$07C57D |
    db $8B,$0C,$A9,$14,$C8,$1C,$AB,$18;$07C585 |
    db $CC,$1C,$AE,$18,$0A,$25,$D0,$18;$07C58D |
    db $F3,$1C,$F4,$1C,$14,$1D,$56,$11;$07C595 |
    db $0B,$34,$01,$46,$01,$46,$01,$46;$07C59D |
    db $65,$14,$A7,$18,$89,$14,$AA,$18;$07C5A5 |
    db $C8,$1C,$AC,$14,$AE,$14,$AE,$18;$07C5AD |
    db $AF,$18,$AF,$18,$D0,$18,$D1,$1C;$07C5B5 |
    db $30,$0D,$44,$0C,$65,$10,$86,$14;$07C5BD |
    db $86,$14,$A7,$18,$A9,$10,$A7,$18;$07C5C5 |
    db $C8,$1C,$06,$21,$CC,$10,$E9,$1C;$07C5CD |
    db $AF,$18,$0C,$21,$2D,$25,$6F,$29;$07C5D5 |
    db $10,$24,$23,$08,$44,$0C,$44,$0C;$07C5DD |
    db $64,$10,$65,$10,$67,$0C,$85,$14;$07C5E5 |
    db $86,$14,$87,$14,$88,$10,$AA,$10;$07C5ED |
    db $CC,$10,$AE,$14,$0E,$19,$50,$1D;$07C5F5 |
    db $2C,$41,$45,$0C,$65,$10,$29,$0C;$07C5FD |
    db $2C,$0C,$86,$14,$A8,$10,$AA,$10;$07C605 |
    db $8C,$10,$C9,$18,$CB,$10,$EC,$18;$07C60D |
    db $0D,$1D,$2F,$19,$51,$1D,$91,$21;$07C615 |
    db $6C,$0C,$23,$08,$24,$08,$26,$08;$07C61D |
    db $26,$08,$64,$10,$28,$0C,$65,$10;$07C625 |
    db $2A,$0C,$85,$14,$A4,$18,$86,$14;$07C62D |
    db $A7,$18,$C8,$1C,$EA,$20,$2C,$25;$07C635 |
    db $89,$25,$43,$0C,$64,$10,$65,$10;$07C63D |
    db $85,$14,$86,$14,$A7,$18,$A7,$18;$07C645 |
    db $C8,$1C,$C9,$1C,$EA,$20,$0B,$21;$07C64D |
    db $2C,$25,$4E,$29,$6F,$29,$91,$2D;$07C655 |
    db $69,$40,$43,$0C,$64,$10,$85,$14;$07C65D |
    db $68,$0C,$67,$10,$86,$14,$88,$14;$07C665 |
    db $89,$14,$8A,$14,$C8,$1C,$8C,$14;$07C66D |
    db $AD,$14,$AE,$14,$AE,$18,$F0,$10;$07C675 |
    db $09,$2C,$02,$25,$02,$25,$02,$25;$07C67D |
    db $44,$0C,$44,$10,$45,$10,$46,$10;$07C685 |
    db $65,$10,$67,$10,$48,$10,$68,$10;$07C68D |
    db $68,$10,$69,$10,$69,$10,$69,$10;$07C695 |
    db $D7,$15,$23,$0C,$43,$0C,$44,$0C;$07C69D |
    db $44,$10,$44,$10,$45,$0C,$65,$10;$07C6A5 |
    db $65,$10,$84,$14,$67,$0C,$66,$14;$07C6AD |
    db $69,$10,$87,$14,$A7,$18,$A9,$18;$07C6B5 |
    db $17,$38,$22,$08,$23,$08,$23,$0C;$07C6BD |
    db $23,$0C,$43,$0C,$24,$0C,$44,$0C;$07C6C5 |
    db $44,$10,$44,$10,$45,$0C,$66,$0C;$07C6CD |
    db $67,$0C,$68,$10,$88,$10,$A9,$14;$07C6D5 |
    db $D2,$5D,$23,$08,$43,$0C,$26,$08;$07C6DD |
    db $27,$08,$44,$10,$45,$0C,$46,$0C;$07C6E5 |
    db $47,$0C,$66,$10,$67,$0C,$67,$10;$07C6ED |
    db $88,$10,$89,$10,$A9,$14,$C9,$14;$07C6F5 |
    db $B2,$14,$22,$08,$23,$08,$24,$08;$07C6FD |
    db $24,$08,$23,$0C,$25,$08,$43,$0C;$07C705 |
    db $26,$08,$44,$0C,$43,$10,$44,$10;$07C70D |
    db $44,$10,$65,$10,$86,$14,$87,$14;$07C715 |
    db $4E,$3A,$22,$08,$23,$0C,$43,$0C;$07C71D |
    db $44,$0C,$44,$10,$44,$10,$65,$10;$07C725 |
    db $65,$10,$66,$14,$86,$14,$86,$14;$07C72D |
    db $87,$14,$A8,$18,$A9,$18,$C9,$1C;$07C735 |
    db $AE,$5C,$22,$08,$23,$0C,$44,$0C;$07C73D |
    db $25,$08,$44,$0C,$44,$10,$45,$0C;$07C745 |
    db $45,$10,$46,$0C,$65,$10,$47,$0C;$07C74D |
    db $48,$10,$48,$10,$68,$10,$69,$0C;$07C755 |
    db $06,$24,$02,$08,$02,$08,$02,$08;$07C75D |
    db $02,$08,$02,$08,$02,$08,$02,$08;$07C765 |
    db $02,$08,$02,$08,$02,$08,$02,$08;$07C76D |
    db $02,$08,$02,$08,$02,$08,$02,$08;$07C775 |
    db $5F,$1A,$02,$08,$02,$08,$02,$08;$07C77D |
    db $02,$08,$02,$08,$02,$08,$02,$08;$07C785 |
    db $02,$08,$02,$08,$02,$08,$02,$08;$07C78D |
    db $02,$08,$02,$08,$02,$08,$02,$08;$07C795 |
    db $1F,$48,$02,$08,$02,$08,$02,$08;$07C79D |
    db $02,$08,$02,$08,$02,$08,$02,$08;$07C7A5 |
    db $02,$08,$02,$08,$02,$08,$02,$08;$07C7AD |
    db $02,$08,$02,$08,$02,$08,$02,$08;$07C7B5 |
    db $58,$7E,$02,$08,$02,$08,$02,$08;$07C7BD |
    db $02,$08,$02,$08,$02,$08,$02,$08;$07C7C5 |
    db $02,$08,$02,$08,$02,$08,$02,$08;$07C7CD |
    db $02,$08,$02,$08,$02,$08,$02,$08;$07C7D5 |
    db $D8,$18,$02,$08,$02,$08,$02,$08;$07C7DD |
    db $02,$08,$02,$08,$02,$08,$02,$08;$07C7E5 |
    db $02,$08,$02,$08,$02,$08,$02,$08;$07C7ED |
    db $02,$08,$02,$08,$02,$08,$02,$08;$07C7F5 |
    db $12,$4B,$02,$08,$02,$08,$02,$08;$07C7FD |
    db $02,$08,$02,$08,$02,$08,$02,$08;$07C805 |
    db $02,$08,$02,$08,$02,$08,$02,$08;$07C80D |
    db $02,$08,$02,$08,$02,$08,$02,$08;$07C815 |
    db $D2,$7C,$02,$08,$02,$08,$02,$08;$07C81D |
    db $02,$08,$02,$08,$02,$08,$02,$08;$07C825 |
    db $02,$08,$02,$08,$02,$08,$02,$08;$07C82D |
    db $02,$08,$02,$08,$02,$08,$02,$08;$07C835 |
    db $00,$00,$3F,$5B,$9D,$29,$9E,$29;$07C83D |
    db $BE,$29,$DF,$2D,$7F,$63,$DF,$31;$07C845 |
    db $DF,$31,$7C,$25,$DF,$35,$EC,$4F;$07C84D |
    db $00,$12,$06,$33,$7D,$25,$BE,$29;$07C855 |
    db $00,$00,$DF,$4E,$9C,$25,$BD,$29;$07C85D |
    db $DE,$2D,$FE,$2D,$7F,$5F,$3F,$36;$07C865 |
    db $3F,$3A,$59,$21,$3F,$3E,$EC,$4F;$07C86D |
    db $00,$12,$06,$33,$7B,$25,$BD,$29;$07C875 |
    db $00,$00,$9F,$42,$7A,$25,$BB,$29;$07C87D |
    db $FD,$2D,$3E,$32,$7F,$5B,$7F,$3E;$07C885 |
    db $7F,$42,$16,$1D,$7F,$4A,$EC,$4F;$07C88D |
    db $00,$12,$06,$33,$59,$21,$DC,$29;$07C895 |
    db $00,$00,$5F,$36,$79,$21,$BA,$29;$07C89D |
    db $1C,$2E,$5E,$36,$9F,$5B,$BF,$42;$07C8A5 |
    db $BF,$4A,$F3,$18,$DF,$56,$EC,$4F;$07C8AD |
    db $00,$12,$06,$33,$57,$1D,$DB,$2D;$07C8B5 |
    db $00,$00,$FF,$25,$77,$21,$B9,$25;$07C8BD |
    db $1B,$2E,$9D,$36,$9F,$57,$FF,$4A;$07C8C5 |
    db $FF,$4E,$CF,$14,$1F,$5F,$EC,$4F;$07C8CD |
    db $00,$12,$06,$33,$35,$19,$F9,$2D;$07C8D5 |
    db $00,$00,$BF,$19,$75,$1D,$D8,$25;$07C8DD |
    db $3B,$32,$BD,$3A,$9F,$53,$5F,$4F;$07C8E5 |
    db $5F,$57,$AC,$10,$5F,$6B,$EC,$4F;$07C8ED |
    db $00,$12,$06,$33,$13,$19,$F8,$2D;$07C8F5 |
    db $00,$00,$5F,$0D,$54,$1D,$D6,$25;$07C8FD |
    db $5A,$32,$FC,$3A,$9F,$4F,$9F,$57;$07C905 |
    db $9F,$5F,$69,$0C,$BF,$73,$EC,$4F;$07C90D |
    db $00,$12,$06,$33,$11,$15,$17,$2E;$07C915 |
    db $00,$00,$1F,$01,$52,$19,$D5,$25;$07C91D |
    db $79,$32,$1C,$3F,$9F,$4B,$DF,$5B;$07C925 |
    db $DF,$67,$46,$08,$FF,$7F,$EC,$4F;$07C92D |
    db $00,$12,$06,$33,$EF,$10,$16,$2E;$07C935 |
    db $00,$00,$1E,$01,$52,$19,$D5,$25;$07C93D |
    db $79,$32,$1C,$3F,$9F,$4B,$DF,$5B;$07C945 |
    db $DF,$67,$46,$08,$FF,$7F,$EC,$4F;$07C94D |
    db $00,$12,$06,$33,$EF,$10,$16,$2E;$07C955 |
    db $00,$00,$1E,$01,$52,$19,$D5,$25;$07C95D |
    db $79,$32,$1C,$3F,$9F,$4B,$DF,$5B;$07C965 |
    db $DF,$67,$46,$08,$FF,$7F,$EC,$4F;$07C96D |
    db $00,$12,$06,$33,$EF,$10,$16,$2E;$07C975 |
    db $00,$00,$1D,$01,$52,$19,$D5,$25;$07C97D |
    db $79,$32,$1C,$3F,$9F,$4B,$DF,$5B;$07C985 |
    db $DF,$67,$46,$08,$FF,$7F,$EC,$4F;$07C98D |
    db $00,$12,$06,$33,$EF,$10,$16,$2E;$07C995 |
    db $00,$00,$1C,$05,$52,$19,$D5,$25;$07C99D |
    db $79,$32,$1C,$3F,$9F,$4B,$DF,$5B;$07C9A5 |
    db $DF,$67,$46,$08,$FF,$7F,$EC,$4F;$07C9AD |
    db $00,$12,$06,$33,$EF,$10,$16,$2E;$07C9B5 |
    db $00,$00,$1C,$05,$52,$19,$D5,$25;$07C9BD |
    db $79,$32,$1C,$3F,$9F,$4B,$DF,$5B;$07C9C5 |
    db $DF,$67,$46,$08,$FF,$7F,$EC,$4F;$07C9CD |
    db $00,$12,$06,$33,$EF,$10,$16,$2E;$07C9D5 |
    db $00,$00,$1B,$05,$52,$19,$D5,$25;$07C9DD |
    db $79,$32,$1C,$3F,$9F,$4B,$DF,$5B;$07C9E5 |
    db $DF,$67,$46,$08,$FF,$7F,$EC,$4F;$07C9ED |
    db $00,$12,$06,$33,$EF,$10,$16,$2E;$07C9F5 |
    db $00,$00,$1A,$05,$52,$19,$D5,$25;$07C9FD |
    db $79,$32,$1C,$3F,$9F,$4B,$DF,$5B;$07CA05 |
    db $DF,$67,$46,$08,$FF,$7F,$EC,$4F;$07CA0D |
    db $00,$12,$06,$33,$EF,$10,$16,$2E;$07CA15 |
    db $00,$00,$FA,$04,$52,$19,$D5,$25;$07CA1D |
    db $79,$32,$1C,$3F,$9F,$4B,$DF,$5B;$07CA25 |
    db $DF,$67,$46,$08,$FF,$7F,$EC,$4F;$07CA2D |
    db $00,$12,$06,$33,$EF,$10,$16,$2E;$07CA35 |
    db $00,$00,$F9,$04,$52,$19,$D5,$25;$07CA3D |
    db $79,$32,$1C,$3F,$9F,$4B,$DF,$5B;$07CA45 |
    db $DF,$67,$46,$08,$FF,$7F,$EC,$4F;$07CA4D |
    db $00,$12,$06,$33,$EF,$10,$16,$2E;$07CA55 |
    db $00,$00,$F8,$04,$52,$19,$D5,$25;$07CA5D |
    db $79,$32,$1C,$3F,$9F,$4B,$DF,$5B;$07CA65 |
    db $DF,$67,$46,$08,$FF,$7F,$EC,$4F;$07CA6D |
    db $00,$12,$06,$33,$EF,$10,$16,$2E;$07CA75 |
    db $00,$00,$F8,$04,$52,$19,$D5,$25;$07CA7D |
    db $79,$32,$1C,$3F,$9F,$4B,$DF,$5B;$07CA85 |
    db $DF,$67,$46,$08,$FF,$7F,$EC,$4F;$07CA8D |
    db $00,$12,$06,$33,$EF,$10,$16,$2E;$07CA95 |
    db $00,$00,$F7,$08,$52,$19,$D5,$25;$07CA9D |
    db $79,$32,$1C,$3F,$9F,$4B,$DF,$5B;$07CAA5 |
    db $DF,$67,$46,$08,$FF,$7F,$EC,$4F;$07CAAD |
    db $00,$12,$06,$33,$EF,$10,$16,$2E;$07CAB5 |
    db $00,$00,$F6,$08,$52,$19,$D5,$25;$07CABD |
    db $79,$32,$1C,$3F,$9F,$4B,$DF,$5B;$07CAC5 |
    db $DF,$67,$46,$08,$FF,$7F,$EC,$4F;$07CACD |
    db $00,$12,$06,$33,$EF,$10,$16,$2E;$07CAD5 |
    db $00,$00,$F6,$08,$52,$19,$D5,$25;$07CADD |
    db $79,$32,$1C,$3F,$9F,$4B,$DF,$5B;$07CAE5 |
    db $DF,$67,$46,$08,$FF,$7F,$EC,$4F;$07CAED |
    db $00,$12,$06,$33,$EF,$10,$16,$2E;$07CAF5 |
    db $00,$00,$F5,$08,$52,$19,$D5,$25;$07CAFD |
    db $79,$32,$1C,$3F,$9F,$4B,$DF,$5B;$07CB05 |
    db $DF,$67,$46,$08,$FF,$7F,$EC,$4F;$07CB0D |
    db $00,$12,$06,$33,$EF,$10,$16,$2E;$07CB15 |
    db $00,$00,$F4,$08,$52,$19,$D5,$25;$07CB1D |
    db $79,$32,$1C,$3F,$9F,$4B,$DF,$5B;$07CB25 |
    db $DF,$67,$46,$08,$FF,$7F,$EC,$4F;$07CB2D |
    db $00,$12,$06,$33,$EF,$10,$16,$2E;$07CB35 |
    db $00,$00,$F3,$08,$52,$19,$D5,$25;$07CB3D |
    db $79,$32,$1C,$3F,$9F,$4B,$DF,$5B;$07CB45 |
    db $DF,$67,$46,$08,$FF,$7F,$EC,$4F;$07CB4D |
    db $00,$12,$06,$33,$EF,$10,$16,$2E;$07CB55 |
    db $00,$00,$F3,$08,$52,$19,$D5,$25;$07CB5D |
    db $79,$32,$1C,$3F,$9F,$4B,$DF,$5B;$07CB65 |
    db $DF,$67,$46,$08,$FF,$7F,$EC,$4F;$07CB6D |
    db $00,$12,$06,$33,$EF,$10,$16,$2E;$07CB75 |
    db $00,$00,$F2,$08,$52,$19,$D5,$25;$07CB7D |
    db $79,$32,$1C,$3F,$9F,$4B,$DF,$5B;$07CB85 |
    db $DF,$67,$46,$08,$FF,$7F,$EC,$4F;$07CB8D |
    db $00,$12,$06,$33,$EF,$10,$16,$2E;$07CB95 |
    db $00,$00,$F1,$0C,$52,$19,$D5,$25;$07CB9D |
    db $79,$32,$1C,$3F,$9F,$4B,$DF,$5B;$07CBA5 |
    db $DF,$67,$46,$08,$FF,$7F,$EC,$4F;$07CBAD |
    db $00,$12,$06,$33,$EF,$10,$16,$2E;$07CBB5 |
    db $00,$00,$F1,$0C,$52,$19,$D5,$25;$07CBBD |
    db $79,$32,$1C,$3F,$9F,$4B,$DF,$5B;$07CBC5 |
    db $DF,$67,$46,$08,$FF,$7F,$EC,$4F;$07CBCD |
    db $00,$12,$06,$33,$EF,$10,$16,$2E;$07CBD5 |
    db $00,$00,$F0,$0C,$52,$19,$D5,$25;$07CBDD |
    db $79,$32,$1C,$3F,$9F,$4B,$DF,$5B;$07CBE5 |
    db $DF,$67,$46,$08,$FF,$7F,$EC,$4F;$07CBED |
    db $00,$12,$06,$33,$EF,$10,$16,$2E;$07CBF5 |
    db $00,$00,$EF,$0C,$52,$19,$D5,$25;$07CBFD |
    db $79,$32,$1C,$3F,$9F,$4B,$DF,$5B;$07CC05 |
    db $DF,$67,$46,$08,$FF,$7F,$EC,$4F;$07CC0D |
    db $00,$12,$06,$33,$EF,$10,$16,$2E;$07CC15 |
    db $00,$00,$CF,$0C,$52,$19,$D5,$25;$07CC1D |
    db $79,$32,$1C,$3F,$9F,$4B,$DF,$5B;$07CC25 |
    db $DF,$67,$46,$08,$FF,$7F,$EC,$4F;$07CC2D |
    db $00,$12,$06,$33,$EF,$10,$16,$2E;$07CC35 |
    db $00,$00,$CE,$0C,$52,$19,$D5,$25;$07CC3D |
    db $79,$32,$1C,$3F,$9F,$4B,$DF,$5B;$07CC45 |
    db $DF,$67,$46,$08,$FF,$7F,$EC,$4F;$07CC4D |
    db $00,$12,$06,$33,$EF,$10,$16,$2E;$07CC55 |
    db $00,$00,$CD,$0C,$52,$19,$D5,$25;$07CC5D |
    db $79,$32,$1C,$3F,$9F,$4B,$DF,$5B;$07CC65 |
    db $DF,$67,$46,$08,$FF,$7F,$EC,$4F;$07CC6D |
    db $00,$12,$06,$33,$EF,$10,$16,$2E;$07CC75 |
    db $00,$00,$CD,$0C,$52,$19,$D5,$25;$07CC7D |
    db $79,$32,$1C,$3F,$9F,$4B,$DF,$5B;$07CC85 |
    db $DF,$67,$46,$08,$FF,$7F,$EC,$4F;$07CC8D |
    db $00,$12,$06,$33,$EF,$10,$16,$2E;$07CC95 |
    db $00,$00,$CC,$10,$52,$19,$D5,$25;$07CC9D |
    db $79,$32,$1C,$3F,$9F,$4B,$DF,$5B;$07CCA5 |
    db $DF,$67,$46,$08,$FF,$7F,$EC,$4F;$07CCAD |
    db $00,$12,$06,$33,$EF,$10,$16,$2E;$07CCB5 |
    db $00,$00,$CB,$10,$52,$19,$D5,$25;$07CCBD |
    db $79,$32,$1C,$3F,$9F,$4B,$DF,$5B;$07CCC5 |
    db $DF,$67,$46,$08,$FF,$7F,$EC,$4F;$07CCCD |
    db $00,$12,$06,$33,$EF,$10,$16,$2E;$07CCD5 |
    db $00,$00,$CB,$10,$52,$19,$D5,$25;$07CCDD |
    db $79,$32,$1C,$3F,$9F,$4B,$DF,$5B;$07CCE5 |
    db $DF,$67,$46,$08,$FF,$7F,$EC,$4F;$07CCED |
    db $00,$12,$06,$33,$EF,$10,$16,$2E;$07CCF5 |
    db $00,$00,$CA,$10,$52,$19,$D5,$25;$07CCFD |
    db $79,$32,$1C,$3F,$9F,$4B,$DF,$5B;$07CD05 |
    db $DF,$67,$46,$08,$FF,$7F,$EC,$4F;$07CD0D |
    db $00,$12,$06,$33,$EF,$10,$16,$2E;$07CD15 |
    db $00,$00,$00,$00,$00,$00,$00,$00;$07CD1D |
    db $00,$00,$00,$00,$00,$00,$00,$04;$07CD25 |
    db $21,$04,$21,$04,$00,$00,$00,$00;$07CD2D |
    db $21,$04,$20,$04,$20,$04,$00,$04;$07CD35 |
    db $21,$04,$21,$04,$21,$04,$21,$04;$07CD3D |
    db $00,$00,$00,$00,$21,$04,$20,$04;$07CD45 |
    db $21,$04,$20,$04,$21,$04,$21,$08;$07CD4D |
    db $42,$08,$42,$08,$00,$00,$00,$00;$07CD55 |
    db $21,$04,$20,$08,$21,$08,$20,$04;$07CD5D |
    db $41,$08,$41,$08,$42,$08,$42,$08;$07CD65 |
    db $00,$00,$00,$00,$21,$04,$20,$08;$07CD6D |
    db $41,$08,$20,$08,$42,$08,$42,$0C;$07CD75 |
    db $63,$0C,$63,$0C,$00,$00,$21,$04;$07CD7D |
    db $42,$08,$41,$0C,$41,$0C,$20,$08;$07CD85 |
    db $62,$0C,$62,$0C,$63,$0C,$63,$0C;$07CD8D |
    db $00,$00,$21,$04,$42,$08,$41,$0C;$07CD95 |
    db $41,$0C,$20,$08,$62,$0C,$62,$10;$07CD9D |
    db $84,$10,$84,$10,$00,$00,$21,$04;$07CDA5 |
    db $42,$08,$41,$0C,$61,$0C,$20,$0C;$07CDAD |
    db $63,$0C,$63,$10,$84,$10,$84,$10;$07CDB5 |
    db $00,$00,$21,$04,$42,$08,$41,$10;$07CDBD |
    db $62,$10,$40,$0C,$83,$10,$83,$14;$07CDC5 |
    db $A5,$14,$A5,$14,$00,$00,$21,$04;$07CDCD |
    db $63,$0C,$61,$10,$62,$10,$40,$0C;$07CDD5 |
    db $83,$10,$83,$14,$A5,$14,$A5,$14;$07CDDD |
    db $00,$00,$21,$04,$63,$0C,$61,$14;$07CDE5 |
    db $82,$14,$40,$10,$A4,$14,$A4,$18;$07CDED |
    db $C6,$18,$C6,$18,$00,$00,$21,$04;$07CDF5 |
    db $63,$0C,$61,$14,$82,$14,$40,$10;$07CDFD |
    db $A4,$14,$A4,$18,$C6,$18,$C6,$18;$07CE05 |
    db $00,$00,$21,$04,$63,$0C,$61,$14;$07CE0D |
    db $82,$14,$40,$10,$A4,$14,$C4,$1C;$07CE15 |
    db $E7,$1C,$E7,$1C,$00,$00,$21,$04;$07CE1D |
    db $63,$10,$81,$18,$A3,$18,$60,$14;$07CE25 |
    db $C5,$18,$C5,$1C,$E7,$1C,$E7,$1C;$07CE2D |
    db $00,$00,$21,$04,$63,$10,$81,$18;$07CE35 |
    db $A3,$18,$60,$14,$C5,$18,$E5,$20;$07CE3D |
    db $08,$21,$08,$21,$00,$00,$21,$04;$07CE45 |
    db $84,$10,$81,$18,$A3,$1C,$60,$18;$07CE4D |
    db $C5,$1C,$E5,$20,$08,$21,$08,$21;$07CE55 |
    db $00,$00,$21,$04,$84,$10,$81,$1C;$07CE5D |
    db $C3,$1C,$60,$18,$E6,$1C,$06,$25;$07CE65 |
    db $29,$25,$29,$25,$00,$00,$21,$04;$07CE6D |
    db $84,$14,$A1,$1C,$C4,$20,$80,$1C;$07CE75 |
    db $E6,$20,$06,$25,$49,$29,$4A,$29;$07CE7D |
    db $00,$00,$42,$08,$84,$14,$A1,$1C;$07CE85 |
    db $C4,$20,$80,$1C,$E6,$20,$26,$29;$07CE8D |
    db $4A,$29,$4A,$29,$00,$00,$42,$08;$07CE95 |
    db $84,$14,$A1,$20,$E4,$20,$80,$1C;$07CE9D |
    db $07,$21,$27,$29,$6A,$2D,$6B,$2D;$07CEA5 |
    db $00,$00,$42,$08,$A5,$14,$A1,$20;$07CEAD |
    db $E4,$24,$80,$20,$07,$25,$47,$2D;$07CEB5 |
    db $6B,$2D,$6B,$2D,$00,$00,$42,$08;$07CEBD |
    db $A5,$18,$C1,$20,$E5,$24,$A0,$20;$07CEC5 |
    db $07,$25,$47,$2D,$8B,$31,$8C,$31;$07CECD |
    db $00,$00,$42,$08,$A5,$18,$C1,$24;$07CED5 |
    db $05,$29,$A0,$24,$28,$29,$68,$31;$07CEDD |
    db $8C,$31,$8C,$31,$00,$00,$42,$08;$07CEE5 |
    db $A5,$18,$C1,$24,$05,$29,$A0,$24;$07CEED |
    db $28,$29,$68,$31,$AC,$35,$AD,$35;$07CEF5 |
    db $00,$00,$42,$08,$A5,$18,$C1,$24;$07CEFD |
    db $05,$29,$A0,$24,$28,$29,$68,$35;$07CF05 |
    db $CD,$39,$CE,$39,$00,$00,$42,$08;$07CF0D |
    db $C6,$1C,$E1,$28,$25,$2D,$A0,$28;$07CF15 |
    db $49,$2D,$89,$35,$CD,$39,$CE,$39;$07CF1D |
    db $00,$00,$42,$08,$C6,$1C,$E1,$28;$07CF25 |
    db $26,$2D,$C0,$28,$49,$2D,$89,$39;$07CF2D |
    db $EE,$3D,$EF,$3D,$00,$00,$42,$08;$07CF35 |
    db $C6,$1C,$E1,$2C,$26,$31,$C0,$28;$07CF3D |
    db $69,$31,$A9,$39,$EE,$3D,$EF,$3D;$07CF45 |
    db $00,$00,$42,$08,$C6,$1C,$E1,$2C;$07CF4D |
    db $46,$31,$C0,$2C,$6A,$31,$AA,$3D;$07CF55 |
    db $0F,$42,$10,$42,$00,$00,$63,$0C;$07CF5D |
    db $E7,$20,$01,$2D,$46,$31,$C0,$2C;$07CF65 |
    db $6A,$31,$AA,$3D,$10,$42,$10,$42;$07CF6D |
    db $00,$00,$63,$0C,$E7,$20,$02,$31;$07CF75 |
    db $46,$35,$C0,$2C,$8A,$35,$CA,$41;$07CF7D |
    db $30,$46,$31,$46,$00,$00,$63,$0C;$07CF85 |
    db $E7,$20,$02,$31,$66,$35,$C0,$30;$07CF8D |
    db $8B,$35,$CB,$41,$31,$46,$31,$46;$07CF95 |
    db $00,$00,$63,$0C,$E7,$20,$02,$35;$07CF9D |
    db $67,$39,$E0,$30,$AB,$39,$EB,$45;$07CFA5 |
    db $51,$4A,$52,$4A,$00,$00,$63,$0C;$07CFAD |
    db $08,$25,$22,$35,$67,$39,$E0,$30;$07CFB5 |
    db $AB,$39,$EB,$45,$52,$4A,$52,$4A;$07CFBD |
    db $00,$00,$63,$0C,$08,$25,$22,$39;$07CFC5 |
    db $87,$3D,$E0,$34,$CC,$3D,$0C,$4A;$07CFCD |
    db $72,$4E,$73,$4E,$00,$00,$63,$0C;$07CFD5 |
    db $08,$25,$22,$39,$87,$3D,$E0,$34;$07CFDD |
    db $CC,$3D,$0C,$4A,$73,$4E,$73,$4E;$07CFE5 |
    db $00,$00,$63,$0C,$08,$25,$22,$39;$07CFED |
    db $87,$41,$E0,$34,$CC,$3D,$0C,$4E;$07CFF5 |
    db $94,$52,$94,$52,$00,$00,$63,$0C;$07CFFD |
    db $29,$29,$42,$3D,$A7,$41,$00,$39;$07D005 |
    db $ED,$41,$2D,$4E,$94,$52,$94,$52;$07D00D |
    db $00,$00,$63,$0C,$29,$29,$42,$3D;$07D015 |
    db $A8,$45,$00,$39,$ED,$41,$2D,$52;$07D01D |
    db $B5,$56,$B5,$56,$00,$00,$63,$0C;$07D025 |
    db $29,$29,$42,$41,$C8,$45,$00,$39;$07D02D |
    db $ED,$45,$4E,$52,$B5,$56,$B5,$56;$07D035 |
    db $00,$00,$63,$0C,$29,$29,$42,$41;$07D03D |
    db $C8,$49,$00,$3D,$0E,$46,$4E,$56;$07D045 |
    db $D6,$5A,$D6,$5A,$00,$00,$84,$10;$07D04D |
    db $4A,$2D,$62,$45,$C8,$49,$20,$3D;$07D055 |
    db $0E,$4A,$6E,$56,$D6,$5A,$D6,$5A;$07D05D |
    db $00,$00,$84,$10,$4A,$2D,$62,$45;$07D065 |
    db $E8,$4D,$20,$3D,$0E,$4A,$6F,$5A;$07D06D |
    db $F7,$5E,$F7,$5E,$00,$00,$84,$10;$07D075 |
    db $4A,$2D,$62,$45,$E8,$4D,$20,$41;$07D07D |
    db $2F,$4A,$6F,$5A,$17,$63,$18,$63;$07D085 |
    db $00,$00,$84,$10,$4A,$2D,$62,$49;$07D08D |
    db $09,$52,$20,$41,$2F,$4E,$90,$5E;$07D095 |
    db $18,$63,$18,$63,$00,$00,$84,$10;$07D09D |
    db $6B,$31,$82,$49,$09,$52,$40,$41;$07D0A5 |
    db $2F,$4E,$90,$5E,$38,$67,$39,$67;$07D0AD |
    db $00,$00,$84,$10,$6B,$31,$82,$4D;$07D0B5 |
    db $29,$56,$40,$45,$50,$52,$B1,$62;$07D0BD |
    db $39,$67,$39,$67,$00,$00,$84,$10;$07D0C5 |
    db $6B,$31,$82,$4D,$29,$56,$40,$45;$07D0CD |
    db $50,$52,$B1,$62,$59,$6B,$5A,$6B;$07D0D5 |
    db $00,$00,$84,$10,$6B,$31,$82,$4D;$07D0DD |
    db $29,$56,$40,$45,$50,$52,$B1,$62;$07D0E5 |
    db $59,$6B,$5A,$6B,$00,$00,$84,$10;$07D0ED |
    db $6B,$31,$A2,$51,$49,$5A,$40,$49;$07D0F5 |
    db $71,$56,$D2,$66,$7A,$6F,$7B,$6F;$07D0FD |
    db $00,$00,$84,$10,$6B,$31,$A2,$51;$07D105 |
    db $49,$5A,$40,$49,$71,$56,$D2,$66;$07D10D |
    db $7A,$6F,$7B,$6F,$00,$00,$84,$10;$07D115 |
    db $8C,$35,$A2,$51,$4A,$5A,$60,$49;$07D11D |
    db $71,$56,$F2,$6A,$9B,$73,$9C,$73;$07D125 |
    db $00,$00,$84,$10,$8C,$35,$A2,$55;$07D12D |
    db $4A,$5E,$60,$4D,$91,$5A,$F2,$6A;$07D135 |
    db $9B,$73,$9C,$73,$00,$00,$84,$10;$07D13D |
    db $8C,$35,$C3,$55,$6A,$5E,$60,$4D;$07D145 |
    db $92,$5A,$13,$6F,$BC,$77,$BD,$77;$07D14D |
    db $00,$00,$A5,$14,$8C,$35,$C3,$55;$07D155 |
    db $6A,$5E,$60,$4D,$92,$5A,$13,$6F;$07D15D |
    db $BC,$77,$BD,$77,$00,$00,$A5,$14;$07D165 |
    db $8C,$35,$C3,$59,$6A,$62,$60,$51;$07D16D |
    db $B2,$5E,$13,$6F,$BC,$77,$BD,$77;$07D175 |
    db $00,$00,$A5,$14,$8C,$35,$C3,$59;$07D17D |
    db $6A,$62,$60,$51,$B2,$5E,$33,$73;$07D185 |
    db $DD,$7B,$DE,$7B,$00,$00,$A5,$14;$07D18D |
    db $AD,$39,$E3,$59,$8B,$62,$80,$51;$07D195 |
    db $B3,$5E,$34,$73,$DD,$7B,$DE,$7B;$07D19D |
    db $00,$00,$A5,$14,$AD,$39,$E3,$5D;$07D1A5 |
    db $8B,$66,$80,$55,$D3,$62,$54,$77;$07D1AD |
    db $FE,$7F,$FF,$7F,$00,$00,$A5,$14;$07D1B5 |
    db $AD,$39,$E3,$5D,$8B,$66,$80,$55;$07D1BD |
    db $D3,$62,$54,$77,$FE,$7F,$FF,$7F;$07D1C5 |
    db $D3,$46,$FF,$7F,$00,$48,$04,$4C;$07D1CD |
    db $08,$54,$1A,$14,$08,$7F,$00,$7E;$07D1D5 |
    db $E0,$27,$FF,$13,$E0,$7F,$66,$7F;$07D1DD |
    db $CD,$7E,$33,$7E,$9A,$7D,$DD,$78;$07D1E5 |
    db $94,$3E,$FF,$7F,$00,$44,$04,$48;$07D1ED |
    db $08,$54,$1A,$14,$08,$7F,$00,$7E;$07D1F5 |
    db $E0,$27,$FF,$13,$E0,$7F,$46,$7F;$07D1FD |
    db $AD,$7E,$12,$7E,$99,$7D,$DB,$70;$07D205 |
    db $34,$3A,$FF,$7F,$00,$44,$04,$48;$07D20D |
    db $08,$54,$1A,$14,$E7,$7A,$E0,$79;$07D215 |
    db $C0,$23,$DE,$13,$C0,$7B,$45,$7B;$07D21D |
    db $AC,$7A,$12,$7A,$79,$79,$B9,$6C;$07D225 |
    db $F5,$31,$FF,$7F,$00,$40,$04,$44;$07D22D |
    db $08,$54,$1A,$14,$E7,$7A,$E0,$79;$07D235 |
    db $C0,$23,$DE,$13,$C0,$7B,$45,$7B;$07D23D |
    db $AC,$7A,$12,$7A,$79,$79,$B7,$68;$07D245 |
    db $B6,$2D,$FF,$7F,$00,$40,$04,$44;$07D24D |
    db $08,$54,$1A,$14,$E7,$7A,$E0,$79;$07D255 |
    db $C0,$23,$DE,$13,$C0,$7B,$25,$7B;$07D25D |
    db $8C,$7A,$F1,$79,$78,$79,$95,$60;$07D265 |
    db $77,$25,$FF,$7F,$00,$3C,$04,$40;$07D26D |
    db $08,$54,$1A,$14,$E7,$7A,$E0,$79;$07D275 |
    db $C0,$23,$DE,$13,$C0,$7B,$25,$7B;$07D27D |
    db $8C,$7A,$F1,$79,$78,$79,$73,$5C;$07D285 |
    db $17,$21,$FF,$7F,$00,$3C,$04,$40;$07D28D |
    db $08,$54,$1A,$14,$C6,$76,$C0,$75;$07D295 |
    db $A0,$1F,$BD,$13,$A0,$77,$04,$77;$07D29D |
    db $6B,$76,$D0,$75,$57,$75,$71,$54;$07D2A5 |
    db $D8,$18,$FF,$7F,$00,$38,$04,$3C;$07D2AD |
    db $08,$54,$1A,$14,$C6,$76,$C0,$75;$07D2B5 |
    db $A0,$1F,$BD,$13,$A0,$77,$04,$77;$07D2BD |
    db $6B,$76,$D0,$75,$57,$75,$4F,$50;$07D2C5 |
    db $18,$25,$FF,$7F,$00,$38,$04,$3C;$07D2CD |
    db $08,$54,$1A,$14,$C6,$76,$C0,$75;$07D2D5 |
    db $A0,$1F,$BD,$13,$A0,$77,$04,$77;$07D2DD |
    db $6B,$76,$D0,$75,$57,$75,$4F,$50;$07D2E5 |
    db $38,$31,$FF,$7F,$00,$34,$04,$38;$07D2ED |
    db $08,$54,$1A,$14,$C6,$76,$C0,$75;$07D2F5 |
    db $A0,$1F,$BD,$13,$A0,$77,$04,$77;$07D2FD |
    db $6B,$76,$D0,$75,$57,$71,$4F,$50;$07D305 |
    db $78,$3D,$FF,$7F,$00,$34,$04,$38;$07D30D |
    db $08,$54,$1A,$14,$A5,$72,$A0,$71;$07D315 |
    db $80,$1B,$9C,$13,$80,$73,$E3,$72;$07D31D |
    db $4A,$72,$AF,$71,$36,$71,$2E,$4C;$07D325 |
    db $98,$4D,$FF,$7F,$00,$34,$04,$38;$07D32D |
    db $08,$54,$1A,$14,$A5,$72,$A0,$71;$07D335 |
    db $80,$1B,$9C,$13,$80,$73,$E3,$72;$07D33D |
    db $4A,$72,$AF,$71,$36,$71,$2E,$4C;$07D345 |
    db $D8,$59,$FF,$7F,$00,$30,$04,$34;$07D34D |
    db $08,$54,$1A,$14,$A5,$72,$A0,$71;$07D355 |
    db $80,$1B,$9C,$13,$80,$73,$E3,$72;$07D35D |
    db $4A,$72,$AF,$71,$36,$6D,$2E,$4C;$07D365 |
    db $F8,$65,$FF,$7F,$00,$30,$04,$34;$07D36D |
    db $08,$54,$1A,$14,$A5,$72,$A0,$71;$07D375 |
    db $80,$1B,$9C,$13,$80,$73,$E3,$72;$07D37D |
    db $4A,$72,$AF,$71,$36,$6D,$2E,$4C;$07D385 |
    db $38,$72,$FF,$7F,$00,$2C,$04,$30;$07D38D |
    db $08,$54,$1A,$14,$84,$6E,$80,$6D;$07D395 |
    db $60,$17,$7B,$13,$60,$6F,$C2,$6E;$07D39D |
    db $29,$6E,$8E,$6D,$15,$69,$0D,$48;$07D3A5 |
    db $58,$7E,$FF,$7F,$00,$2C,$04,$30;$07D3AD |
    db $08,$54,$1A,$14,$84,$6E,$80,$6D;$07D3B5 |
    db $60,$17,$7B,$13,$60,$6F,$C2,$6E;$07D3BD |
    db $29,$6E,$8E,$6D,$15,$69,$0D,$48;$07D3C5 |
    db $19,$76,$FF,$7F,$00,$2C,$04,$30;$07D3CD |
    db $08,$54,$1A,$14,$84,$6E,$80,$6D;$07D3D5 |
    db $60,$17,$7B,$13,$60,$6F,$C2,$6E;$07D3DD |
    db $29,$6E,$8E,$6D,$15,$69,$0D,$48;$07D3E5 |
    db $DA,$71,$FF,$7F,$00,$28,$04,$2C;$07D3ED |
    db $08,$54,$1A,$14,$84,$6E,$80,$69;$07D3F5 |
    db $60,$17,$7B,$13,$60,$6F,$C2,$6E;$07D3FD |
    db $29,$6E,$8E,$6D,$15,$69,$0D,$44;$07D405 |
    db $7B,$69,$FF,$7F,$00,$28,$04,$2C;$07D40D |
    db $08,$54,$1A,$14,$63,$6A,$60,$69;$07D415 |
    db $40,$13,$5A,$0F,$40,$6B,$A1,$6A;$07D41D |
    db $08,$6A,$6D,$69,$F4,$64,$0C,$44;$07D425 |
    db $3C,$65,$FF,$7F,$00,$28,$04,$2C;$07D42D |
    db $08,$54,$1A,$14,$63,$6A,$60,$69;$07D435 |
    db $40,$13,$5A,$0F,$40,$6B,$A1,$6A;$07D43D |
    db $08,$6A,$6D,$69,$F4,$64,$0C,$44;$07D445 |
    db $FC,$5C,$FF,$7F,$00,$24,$04,$28;$07D44D |
    db $08,$54,$1A,$14,$63,$6A,$60,$65;$07D455 |
    db $40,$13,$5A,$0F,$40,$6B,$A1,$6A;$07D45D |
    db $08,$6A,$6D,$69,$F4,$64,$0C,$40;$07D465 |
    db $BD,$54,$FF,$7F,$00,$24,$04,$28;$07D46D |
    db $08,$54,$1A,$14,$63,$6A,$60,$65;$07D475 |
    db $40,$13,$5A,$0F,$40,$6B,$A1,$6A;$07D47D |
    db $08,$6A,$6D,$69,$F4,$64,$0C,$40;$07D485 |
    db $5E,$50,$FF,$7F,$00,$20,$04,$24;$07D48D |
    db $08,$54,$1A,$14,$42,$66,$40,$61;$07D495 |
    db $20,$0F,$39,$0B,$20,$67,$80,$66;$07D49D |
    db $E7,$65,$4C,$65,$D3,$60,$0B,$3C;$07D4A5 |
    db $1F,$48,$FF,$7F,$00,$20,$04,$24;$07D4AD |
    db $08,$54,$1A,$14,$42,$66,$40,$61;$07D4B5 |
    db $20,$0F,$39,$0B,$20,$67,$80,$66;$07D4BD |
    db $E7,$65,$4C,$65,$D3,$60,$0B,$3C;$07D4C5 |
    db $5F,$44,$FF,$7F,$00,$20,$04,$24;$07D4CD |
    db $08,$54,$1A,$14,$42,$66,$40,$61;$07D4D5 |
    db $20,$0F,$39,$0B,$20,$67,$80,$66;$07D4DD |
    db $E7,$65,$4C,$65,$D3,$60,$0B,$3C;$07D4E5 |
    db $BF,$3C,$FF,$7F,$00,$1C,$04,$20;$07D4ED |
    db $08,$54,$1A,$14,$42,$66,$40,$5D;$07D4F5 |
    db $20,$0F,$19,$0B,$20,$67,$80,$66;$07D4FD |
    db $E7,$65,$4C,$65,$D3,$60,$0B,$3C;$07D505 |
    db $FF,$38,$FF,$7F,$00,$1C,$04,$20;$07D50D |
    db $08,$54,$1A,$14,$21,$62,$20,$5D;$07D515 |
    db $00,$0B,$18,$07,$00,$63,$60,$62;$07D51D |
    db $C6,$61,$2B,$61,$B2,$5C,$0A,$38;$07D525 |
    db $3F,$31,$FF,$7F,$00,$18,$04,$20;$07D52D |
    db $08,$54,$1A,$14,$21,$62,$20,$5D;$07D535 |
    db $00,$0B,$F8,$06,$00,$63,$60,$62;$07D53D |
    db $C6,$61,$2B,$61,$B2,$5C,$0A,$38;$07D545 |
    db $7F,$2D,$FF,$7F,$00,$18,$04,$1C;$07D54D |
    db $08,$54,$1A,$14,$21,$62,$20,$59;$07D555 |
    db $00,$0B,$F8,$06,$00,$63,$60,$62;$07D55D |
    db $C6,$61,$2B,$61,$B2,$5C,$0A,$38;$07D565 |
    db $DF,$25,$FF,$7F,$00,$14,$04,$1C;$07D56D |
    db $08,$54,$1A,$14,$21,$62,$20,$59;$07D575 |
    db $00,$0B,$D8,$06,$00,$63,$60,$62;$07D57D |
    db $C6,$61,$2B,$61,$B2,$5C,$0A,$38;$07D585 |
    db $1F,$22,$FF,$7F,$00,$14,$04,$18;$07D58D |
    db $08,$54,$1A,$14,$00,$5E,$00,$55;$07D595 |
    db $E0,$06,$D7,$02,$E0,$5E,$40,$5E;$07D59D |
    db $A5,$5D,$0A,$5D,$91,$58,$09,$34;$07D5A5 |
DATA8_07D5AD:
    db $5F,$1A,$FF,$7F,$00,$10,$04,$18;$07D5AD |
    db $08,$54,$1A,$14,$00,$5E,$00,$55;$07D5B5 |
    db $E0,$06,$B7,$02,$E0,$5E,$40,$5E;$07D5BD |
    db $A5,$5D,$0A,$5D,$91,$58,$09,$34;$07D5C5 |

    JSL.L UpdateVramSprSize       ;$07D5CD |
    LDA.W #$0000                  ;$07D5D1 |
    LDX.W #$6000                  ;$07D5D4 |
    JSL.L UpdateVramSpriteTileSize;$07D5D7 |
    LDA.W #$0001                  ;$07D5DB |
    JSL.L UpdateSNESMode          ;$07D5DE |
    LDX.W #$0000                  ;$07D5E2 |
    LDY.W #$3C00                  ;$07D5E5 |
    LDA.W Current_SubGame         ;$07D5E8 |
    CMP.W #$00!SUBGAME_GCO        ;$07D5EB |
    BNE CODE_87D5F8               ;$07D5EE |
    LDX.W #$0000                  ;$07D5F0 |
    LDY.W #$4000                  ;$07D5F3 |
    BRA CODE_87D603               ;$07D5F6 |

CODE_87D5F8:
    CMP.W #$00!SUBGAME_MWW        ;$07D5F8 |
    BNE CODE_87D603               ;$07D5FB |
    LDX.W #$0000                  ;$07D5FD |
    LDY.W #$4800                  ;$07D600 |

CODE_87D603:
    PHX                           ;$07D603 |
    LDX.W Current_SubGame_x2      ;$07D604 |
    LDA.L DATA16_07D6EE,X         ;$07D607 |
    PLX                           ;$07D60B |
    JSL.L ConfigureLayer1         ;$07D60C |
    LDX.W Current_SubGame_x2      ;$07D610 |
    LDA.L DATA16_07D726,X         ;$07D613 |
    TAY                           ;$07D617 |
    LDA.L DATA16_07D718,X         ;$07D618 |
    PHA                           ;$07D61C |
    LDA.L DATA16_07D6FC,X         ;$07D61D |
    PLX                           ;$07D621 |
    JSL.L ConfigureLayer2         ;$07D622 |
    LDX.W Current_SubGame_x2      ;$07D626 |
    LDA.L DATA16_07D70A,X         ;$07D629 |
    BMI CODE_87D63F               ;$07D62D |
    PHA                           ;$07D62F |
    LDA.L DATA16_07D742,X         ;$07D630 |
    TAY                           ;$07D634 |
    LDA.L DATA16_07D734,X         ;$07D635 |
    TAX                           ;$07D639 |
    PLA                           ;$07D63A |
    JSL.L ConfigureLayer3         ;$07D63B |

CODE_87D63F:
    LDX.W Current_SubGame_x2      ;$07D63F |
    LDA.L DATA16_07D6E0,X         ;$07D642 |
    STA.W MainScreenDesignation   ;$07D646 |
    SEP #$20                      ;$07D649 |
    LDA.B #$20                    ;$07D64B |
    STA.W Background_Color        ;$07D64D |
    LDA.B #$40                    ;$07D650 |
    STA.W $3079                   ;$07D652 |
    LDA.B #$80                    ;$07D655 |
    STA.W $307A                   ;$07D657 |
    REP #$20                      ;$07D65A |
    LDX.W Current_SubGame_x2      ;$07D65C |
    LDA.L PTR16_07DC01,X          ;$07D65F |
    LDX.W #$0007                  ;$07D663 |
    JSL.L LoadDMATable            ;$07D666 |
    LDX.W Current_SubGame_x2      ;$07D66A |
    LDA.L PTR16_07DC0F,X          ;$07D66D |
    LDX.W #$0007                  ;$07D671 |
    JSL.L CODE_FL_D3E412          ;$07D674 |
    %LoadLongToAX(DATA8_07DDDE)
    JSL.L CODE_FL_D3E412          ;$07D67E |
    LDY.B $39                     ;$07D682 |
    TYX                           ;$07D684 |
    STZ.W Obj_VAR0,X              ;$07D685 |
    STZ.W Obj_VAR1,X              ;$07D688 |
    STZ.W Obj_VAR3,X              ;$07D68B |
    INC.W Obj_VAR3,X              ;$07D68E |
    LDA.W #$0004                  ;$07D691 |
    JSR.W CODE_FN_07E74C          ;$07D694 |
    LDA.W $7A89                   ;$07D697 |
    BNE CODE_87D6A5               ;$07D69A |
    LDA.W #$0000                  ;$07D69C |
    JSL.L PlayMusic          ;$07D69F |
    LDY.B $39                     ;$07D6A3 |

CODE_87D6A5:
    LDA.W Current_SubGame         ;$07D6A5 |
    CMP.W #$00!SUBGAME_GCO        ;$07D6A8 |
    BEQ CODE_87D6B5               ;$07D6AB |
    CMP.W #$00!SUBGAME_MWW        ;$07D6AD |
    BEQ CODE_87D6B5               ;$07D6B0 |
    STZ.W $7A89                   ;$07D6B2 |

CODE_87D6B5:
    %LoadLongToAX(CODE_87DE42)
    JSL.L CODE_FL_00E1B7          ;$07D6BB |
    STZ.W $7B27                   ;$07D6BF |
    STZ.W $7A31                   ;$07D6C2 |
    LDA.W Current_SubGame         ;$07D6C5 |
    CMP.W #$00!SUBGAME_SOUNDTEST  ;$07D6C8 |

CODE_87D6CB:
    BCS CODE_87D6CB               ;$07D6CB |
    ASL A                         ;$07D6CD |
    TAX                           ;$07D6CE |
    JMP.W (PTR16_07D6D2,X)        ;$07D6CF |
PTR16_07D6D2:
    dw CODE_07D750                ;$07D6D2 |
    dw CODE_07D7F5                ;$07D6D4 |
    dw CODE_07D88B                ;$07D6D6 |
    dw CODE_JP_07D94D             ;$07D6D8 |
    dw CODE_07DA04                ;$07D6DA |
    dw CODE_JP_07DAE7             ;$07D6DC |
    dw CODE_07DBD3                ;$07D6DE |

DATA16_07D6E0:
    dw $0015,$0015,$0013,$0013    ;$07D6E0 |
    dw $0013,$0013,$0011          ;$07D6E8 |

DATA16_07D6EE:
    dw $0000,$0002,$0000,$0000    ;$07D6EE |
    dw $0000,$0002,$0000          ;$07D6F6 |

DATA16_07D6FC:
    dw $0000,$0000,$0000,$0002    ;$07D6FC |
    dw $0000,$0002,$0000          ;$07D704 |

DATA16_07D70A:
    dw $0000,$0003,$0000,$FFFF    ;$07D70A |
    dw $FFFF,$0000,$FFFF          ;$07D712 |

DATA16_07D718:
    dw $2000,$2000,$2000,$0000    ;$07D718 |
    dw $2000,$0000,$2000          ;$07D720 |

DATA16_07D726:
    dw $4800,$4800,$4800,$4800    ;$07D726 |
    dw $4000,$5800,$4800          ;$07D72E |

DATA16_07D734:
    dw $3000,$3000,$3000,$3000    ;$07D734 |
    dw $3000,$3000,$3000          ;$07D73C |

DATA16_07D742:
    dw $5000,$5000,$5000,$5000    ;$07D742 |
    dw $5000,$4000,$5000          ;$07D74A |

CODE_07D750:
    JSL.L CODE_FL_07E217          ;$07D750 |
    LDX.W #$0003                  ;$07D754 |
    LDA.W $7AE7                   ;$07D757 |
    AND.W #$000F                  ;$07D75A |
    CMP.W #$000F                  ;$07D75D |
    BEQ CODE_87D774               ;$07D760 |
    CMP.W #$0007                  ;$07D762 |
    BEQ CODE_87D774               ;$07D765 |
    DEX                           ;$07D767 |
    CMP.W #$0003                  ;$07D768 |
    BEQ CODE_87D774               ;$07D76B |
    DEX                           ;$07D76D |
    CMP.W #$0001                  ;$07D76E |
    BEQ CODE_87D774               ;$07D771 |
    DEX                           ;$07D773 |

CODE_87D774:
    STX.W $7B23                   ;$07D774 |
    LDA.W TitleDemo_Flag          ;$07D777 |
    AND.W #$00FF                  ;$07D77A |
    BNE CODE_87D7C2               ;$07D77D |
    STZ.W $7B25                   ;$07D77F |
    LDA.W #DMA_07D7E3             ;$07D782 |
    LDX.W $7B23                   ;$07D785 |
    BEQ CODE_07D790               ;$07D788 |
    LDA.W #DMA_07D7EC             ;$07D78A |
    INC.W $7B25                   ;$07D78D |

CODE_07D790:
    LDX.W #$0007                  ;$07D790 |
    JSL.L LoadDMATable            ;$07D793 |
    LDA.W SB_GCO_Boss_Status      ;$07D797 |
    AND.W #$0001                  ;$07D79A |
    BEQ CODE_07D7A2               ;$07D79D |
    STZ.W $7B25                   ;$07D79F |

CODE_07D7A2:
    LDA.W #$0000                  ;$07D7A2 |
    JSR.W CODE_FN_07E74C          ;$07D7A5 |
    LDA.W $7B23                   ;$07D7A8 |
    STA.W Obj_VAR1,X              ;$07D7AB |
    BEQ CODE_87D7C2               ;$07D7AE |
    LDA.W #$0002                  ;$07D7B0 |
    JSR.W CODE_FN_07E74C          ;$07D7B3 |
    LDA.W #$0000                  ;$07D7B6 |
    STA.W Obj_VAR1,X              ;$07D7B9 |
    LDA.W $7B23                   ;$07D7BC |
    STA.W Obj_VAR2,X              ;$07D7BF |

CODE_87D7C2:
    LDA.W #$0010                  ;$07D7C2 |
    STA.W Obj_VAR8,Y              ;$07D7C5 |

CODE_JP_07D7C8:
    JSL.L FadeIn_Step             ;$07D7C8 |
    JSL.L CODE_FL_00E091          ;$07D7CC |
    TYX                           ;$07D7D0 |
    DEC.W Obj_VAR8,X              ;$07D7D1 |
    BEQ CODE_87D7D9               ;$07D7D4 |
    JMP.W CODE_JP_07D7C8          ;$07D7D6 |

CODE_87D7D9:
    TYX                           ;$07D7D9 |
    STZ.W Obj_VAR3,X              ;$07D7DA |

CODE_87D7DD:
    JSL.L CODE_FL_00E091          ;$07D7DD |
    BRA CODE_87D7DD               ;$07D7E1 |

DMA_07D7E3:
    db $83 : dw $00C0 : dl $EFCDA9 : dw $3E20
    db $FF
DMA_07D7EC:
    db $83 : dw $0180 : dl $EEF500 : dw $3E00
    db $FF

CODE_07D7F5:
    JSL.L CODE_FL_07E217          ;$07D7F5 |
    LDA.W TitleDemo_Flag          ;$07D7F9 |
    AND.W #$00FF                  ;$07D7FC |
    BNE CODE_87D837               ;$07D7FF |
    STZ.W $7B25                   ;$07D801 |
    LDX.W #DMA_87D879             ;$07D804 |
    LDA.W $7A63                   ;$07D807 |
    AND.W #$00FF                  ;$07D80A |
    BEQ CODE_87D815               ;$07D80D |
    LDX.W #DMA_87D882             ;$07D80F |
    INC.W $7B25                   ;$07D812 |

CODE_87D815:
    TXA                           ;$07D815 |
    LDX.W #$0007                  ;$07D816 |
    JSL.L LoadDMATable            ;$07D819 |
    LDA.W SB_GCO_Boss_Status      ;$07D81D |
    AND.W #$0002                  ;$07D820 |
    BEQ CODE_87D828               ;$07D823 |
    STZ.W $7B25                   ;$07D825 |

CODE_87D828:
    LDA.W #$0000                  ;$07D828 |
    JSR.W CODE_FN_07E74C          ;$07D82B |
    LDA.W $7A63                   ;$07D82E |
    AND.W #$00FF                  ;$07D831 |
    STA.W Obj_VAR1,X              ;$07D834 |

CODE_87D837:
    LDA.W #$0005                  ;$07D837 |
    JSR.W CODE_FN_07E74C          ;$07D83A |
    LDY.B $39                     ;$07D83D |
    %LoadLongToAX(CODE_87DE42)
    JSL.L CODE_FL_00E1B7          ;$07D845 |
    LDA.W #$0000                  ;$07D849 |
    STA.W $73AE                   ;$07D84C |
    LDA.W #$0010                  ;$07D84F |
    STA.W Obj_VAR8,Y              ;$07D852 |

CODE_JP_07D855:
    JSL.L FadeIn_Step             ;$07D855 |
    JSL.L CODE_FL_00E091          ;$07D859 |
    TYX                           ;$07D85D |
    DEC.W Obj_VAR8,X              ;$07D85E |
    BEQ CODE_87D866               ;$07D861 |
    JMP.W CODE_JP_07D855          ;$07D863 |

CODE_87D866:
    TYX                           ;$07D866 |
    STZ.W Obj_VAR3,X              ;$07D867 |
    LDA.W #$001A                  ;$07D86A |
    JSL.L PlayMusic               ;$07D86D |
    LDY.B $39                     ;$07D871 |

CODE_87D873:
    JSL.L CODE_FL_00E091          ;$07D873 |
    BRA CODE_87D873               ;$07D877 |

DMA_87D879:
    db $83 : dw $00C0 : dl $EFDCCD : dw $3E80
    db $FF
DMA_87D882:
    db $83 : dw $00C0 : dl $EFCD03 : dw $3E80
    db $FF

CODE_07D88B:
    JSL.L CODE_FL_07E217          ;$07D88B |
    LDA.W TitleDemo_Flag          ;$07D88F |
    AND.W #$00FF                  ;$07D892 |
    BEQ CODE_07D8A5               ;$07D895 |
    %LoadLongToAX(DMA_07D92A)
    JSL.L LoadDMATable            ;$07D89D |
    LDY.B $39                     ;$07D8A1 |
    BRA CODE_07D8F9               ;$07D8A3 |

CODE_07D8A5:
    %LoadLongToAX(CODE_07D91A)
    JSL.L SA1_ExecuteSNES         ;$07D8AB |
    LDA.W #$0000                  ;$07D8AF |
    JSR.W CODE_FN_07E74C          ;$07D8B2 |
    LDY.B $39                     ;$07D8B5 |
    LDA.W #$0013                  ;$07D8B7 |
    STA.B IdentifySNES            ;$07D8BA |
    LDA.W #$0013                  ;$07D8BC |
    STA.B DSP_P                   ;$07D8BF |
    LDA.W #$7AF3                  ;$07D8C1 |
    LDX.W #$0000                  ;$07D8C4 |
    JSL.L CODE_FL_07E6F8          ;$07D8C7 |
    LDY.B $39                     ;$07D8CB |
    LDA.W #$0013                  ;$07D8CD |
    STA.B IdentifySNES            ;$07D8D0 |
    LDA.W #$0014                  ;$07D8D2 |
    STA.B DSP_P                   ;$07D8D5 |
    LDA.W #$7AF7                  ;$07D8D7 |
    LDX.W #$0000                  ;$07D8DA |
    JSL.L CODE_FL_07E6F8          ;$07D8DD |
    LDY.B $39                     ;$07D8E1 |
    LDA.W #$0013                  ;$07D8E3 |
    STA.B IdentifySNES            ;$07D8E6 |
    LDA.W #$0015                  ;$07D8E8 |
    STA.B DSP_P                   ;$07D8EB |
    LDA.W #$7AFB                  ;$07D8ED |
    LDX.W #$0000                  ;$07D8F0 |
    JSL.L CODE_FL_07E6F8          ;$07D8F3 |
    LDY.B $39                     ;$07D8F7 |

CODE_07D8F9:
    LDA.W #$0010                  ;$07D8F9 |
    STA.W Obj_VAR8,Y              ;$07D8FC |

CODE_JP_07D8FF:
    JSL.L FadeIn_Step             ;$07D8FF |
    JSL.L CODE_FL_00E091          ;$07D903 |
    TYX                           ;$07D907 |
    DEC.W Obj_VAR8,X              ;$07D908 |
    BEQ CODE_07D910               ;$07D90B |
    JMP.W CODE_JP_07D8FF          ;$07D90D |

CODE_07D910:
    TYX                           ;$07D910 |
    STZ.W Obj_VAR3,X              ;$07D911 |

CODE_07D914:
    JSL.L CODE_FL_00E091          ;$07D914 |
    BRA CODE_07D914               ;$07D918 |
CODE_07D91A:
    LDA.W $00E7                   ;$07D91A |
    STA.W $7B25                   ;$07D91D |
    RTL                           ;$07D920 |

DMA_07D921:
    db $03 : dw $0014 : dl $7E2452 : dw $3E28
    db $FF
DMA_07D92A:
    db $06 : dw $0028 : dl DATA16_07D949 : dw $3E28
    db $06 : dw $0028 : dl DATA16_07D949 : dw $3E68
    db $06 : dw $0028 : dl DATA16_07D949 : dw $3E88
    db $06 : dw $0028 : dl DATA16_07D949 : dw $3EA8
    db $FF

DATA16_07D949:
    dw $2000                       ;$07D949 |

CODE_JP_07D94D:
    JSL.L CODE_FL_009BEF          ;$07D94D |
    JSL.L CODE_FL_07E217          ;$07D951 |
    LDA.W $7A8B                   ;$07D955 |
    BEQ CODE_07D966               ;$07D958 |
    STZ.W $7A8B                   ;$07D95A |
    LDA.W #$002B                  ;$07D95D |
    JSL.L PlayMusic               ;$07D960 |
    LDY.B $39                     ;$07D964 |

CODE_07D966:
    LDA.W #$000A                  ;$07D966 |
    LDX.W #$0003                  ;$07D969 |
    LDY.W #$0000                  ;$07D96C |
    JSL.L CODE_FL_01A841          ;$07D96F |
    LDA.W $7A89                   ;$07D973 |
    BEQ CODE_07D97E               ;$07D976 |
    STZ.W $7A89                   ;$07D978 |
    JMP.W CODE_JP_07E766          ;$07D97B |


CODE_07D97E:
    LDA.W #$0100                  ;$07D97E |
    STA.W $303F                   ;$07D981 |
    LDA.W #$DE0E                  ;$07D984 |
    LDX.W #$0007                  ;$07D987 |
    JSL.L CODE_FL_D3E412          ;$07D98A |
    LDY.B $39                     ;$07D98E |
    JSL.L CODE_FL_00E1BF          ;$07D990 |
    LDA.W #$0010                  ;$07D994 |
    STA.W Obj_VAR8,Y              ;$07D997 |

CODE_JP_07D99A:
    JSL.L FadeIn_Step             ;$07D99A |
    JSL.L CODE_FL_00E091          ;$07D99E |
    TYX                           ;$07D9A2 |
    DEC.W Obj_VAR8,X              ;$07D9A3 |
    BEQ CODE_JP_07D9AB            ;$07D9A6 |
    JMP.W CODE_JP_07D99A          ;$07D9A8 |

CODE_JP_07D9AB:
    %LoadLongToAX(CODE_87DE42)
    JSL.L CODE_FL_00E1B7          ;$07D9B1 |
    LDA.W TitleDemo_Flag          ;$07D9B5 |
    AND.W #$00FF                  ;$07D9B8 |
    BNE CODE_07D9E8               ;$07D9BB |
    STZ.W $7B25                   ;$07D9BD |
    LDA.W #DMA_07D9F2             ;$07D9C0 |
    LDX.W $7B0D                   ;$07D9C3 |
    BEQ CODE_07D9CE               ;$07D9C6 |
    LDA.W #DMA_07D9FB             ;$07D9C8 |
    INC.W $7B25                   ;$07D9CB |

CODE_07D9CE:
    LDX.W #$0007                  ;$07D9CE |
    JSL.L LoadDMATable            ;$07D9D1 |
    LDY.B $39                     ;$07D9D5 |
    LDA.W #$0000                  ;$07D9D7 |
    JSR.W CODE_FN_07E74C          ;$07D9DA |
    STZ.W Obj_VAR1,X              ;$07D9DD |
    LDA.W $7B0D                   ;$07D9E0 |
    BEQ CODE_07D9E8               ;$07D9E3 |
    INC.W Obj_VAR1,X              ;$07D9E5 |

CODE_07D9E8:
    TYX                           ;$07D9E8 |
    STZ.W Obj_VAR3,X              ;$07D9E9 |

CODE_07D9EC:
    JSL.L CODE_FL_00E091          ;$07D9EC |
    BRA CODE_07D9EC               ;$07D9F0 |

DMA_07D9F2:
    db $83 : dw $0080 : dl $EFCF5E : dw $4220
    db $FF
DMA_07D9FB:
    db $83 : dw $0100 : dl $EF995E : dw $4200
    db $FF

CODE_07DA04:
    JSL.L CODE_FL_07E217          ;$07DA04 |
    LDA.W #$0000                  ;$07DA08 |
    JSL.L PlayMusic               ;$07DA0B |
    LDY.B $39                     ;$07DA0F |
    LDA.W #$0000                  ;$07DA11 |
    JSL.L PlaySFX                 ;$07DA14 |
    LDY.B $39                     ;$07DA18 |
    LDA.W #$0005                  ;$07DA1A |
    JSL.L CODE_FL_00D2FD          ;$07DA1D |
    LDA.W #$0039                  ;$07DA21 |
    JSL.L PlayMusic               ;$07DA24 |
    LDY.B $39                     ;$07DA28 |
    LDA.W TitleDemo_Flag          ;$07DA2A |
    AND.W #$00FF                  ;$07DA2D |
    BNE CODE_07DA6B               ;$07DA30 |
    LDA.W $7A69                   ;$07DA32 |
    CMP.W #$0008                  ;$07DA35 |
    BNE CODE_07DA42               ;$07DA38 |
    LDA.W #$0004                  ;$07DA3A |
    STA.W $7A69                   ;$07DA3D |
    BRA CODE_07DA50               ;$07DA40 |


CODE_07DA42:
    LDA.W $7A69                   ;$07DA42 |
    CMP.W #$0007                  ;$07DA45 |
    BCC CODE_07DA50               ;$07DA48 |
    LDA.W #$0006                  ;$07DA4A |
    STA.W $7A69                   ;$07DA4D |

CODE_07DA50:
    STZ.W $7B25                   ;$07DA50 |
    LDY.W #DMA_07DAD5             ;$07DA53 |
    LDA.W $7A69                   ;$07DA56 |
    BEQ CODE_07DA61               ;$07DA59 |
    LDY.W #DMA_07DADE             ;$07DA5B |
    INC.W $7B25                   ;$07DA5E |

CODE_07DA61:
    LDX.W #$0007                  ;$07DA61 |
    TYA                           ;$07DA64 |
    JSL.L LoadDMATable            ;$07DA65 |
    LDY.B $39                     ;$07DA69 |

CODE_07DA6B:
    LDA.W #$0020                  ;$07DA6B |
    STA.W $303F                   ;$07DA6E |
    LDA.W #$0000                  ;$07DA71 |
    LDX.W #$0000                  ;$07DA74 |
    LDY.W #$00E0                  ;$07DA77 |
    JSL.L CODE_FL_00A240          ;$07DA7A |
    LDY.B $39                     ;$07DA7E |
    LDA.W #$0005                  ;$07DA80 |
    JSR.W CODE_FN_07E74C          ;$07DA83 |
    LDA.W TitleDemo_Flag          ;$07DA86 |
    AND.W #$00FF                  ;$07DA89 |
    BNE CODE_07DAB4               ;$07DA8C |
    LDA.W #$0000                  ;$07DA8E |
    JSR.W CODE_FN_07E74C          ;$07DA91 |
    LDA.W $7A69                   ;$07DA94 |
    STA.W Obj_VAR1,X              ;$07DA97 |
    BEQ CODE_07DAAE               ;$07DA9A |
    LDA.W #$0003                  ;$07DA9C |
    JSR.W CODE_FN_07E74C          ;$07DA9F |
    LDA.W #$0001                  ;$07DAA2 |
    STA.W Obj_VAR1,X              ;$07DAA5 |
    LDA.W $7B27                   ;$07DAA8 |
    STA.W Obj_VAR2,X              ;$07DAAB |

CODE_07DAAE:
    LDA.W #$0001                  ;$07DAAE |
    STA.W $73AE                   ;$07DAB1 |

CODE_07DAB4:
    LDA.W #$0010                  ;$07DAB4 |
    STA.W Obj_VAR8,Y              ;$07DAB7 |

CODE_JP_07DABA:
    JSL.L FadeIn_Step             ;$07DABA |
    JSL.L CODE_FL_00E091          ;$07DABE |
    TYX                           ;$07DAC2 |
    DEC.W Obj_VAR8,X              ;$07DAC3 |
    BEQ CODE_07DACB               ;$07DAC6 |
    JMP.W CODE_JP_07DABA          ;$07DAC8 |

CODE_07DACB:
    TYX                           ;$07DACB |
    STZ.W Obj_VAR3,X              ;$07DACC |

CODE_07DACF:
    JSL.L CODE_FL_00E091          ;$07DACF |
    BRA CODE_07DACF               ;$07DAD3 |

DMA_07DAD5:
    db $83 : dw $0080 : dl $EFCF2F : dw $3E60
    db $FF
DMA_07DADE:
    db $83 : dw $0100 : dl $EDF068 : dw $3E40
    db $FF

CODE_JP_07DAE7:
    JSL.L CODE_FL_009BEF          ;$07DAE7 |
    JSL.L CODE_FL_07E217          ;$07DAEB |
    LDA.W #$0002                  ;$07DAEF |
    STA.W $73AE                   ;$07DAF2 |
    LDA.W #$000A                  ;$07DAF5 |
    LDX.W #$0005                  ;$07DAF8 |
    LDY.W #$0001                  ;$07DAFB |
    JSL.L CODE_FL_01A841          ;$07DAFE |
    LDA.W $7A89                   ;$07DB02 |
    BEQ CODE_07DB0D               ;$07DB05 |
    STZ.W $7A89                   ;$07DB07 |
    JMP.W CODE_JP_07EA97          ;$07DB0A |

CODE_07DB0D:
    %LoadLongToAX(DMA_07DD7C)
    JSL.L LoadDMATable            ;$07DB13 |
    %LoadLongToAX(DATA8_07DE2B)
    JSL.L CODE_FL_D3E412          ;$07DB1D |
    %LoadLongToAX(DATA8_07D5AD)
    LDY.W #$5010                  ;$07DB27 |
    JSL.L WritePal                ;$07DB2A |
    LDY.B $39                     ;$07DB2E |
    LDA.W TitleDemo_Flag          ;$07DB30 |
    AND.W #$00FF                  ;$07DB33 |
    BNE CODE_07DB3C               ;$07DB36 |
    JSL.L CODE_FL_07DB8D          ;$07DB38 |

CODE_07DB3C:
    LDA.W #$0010                  ;$07DB3C |
    STA.W Obj_VAR8,Y              ;$07DB3F |

CODE_JP_07DB42:
    JSL.L FadeIn_Step             ;$07DB42 |
    JSL.L CODE_FL_00E091          ;$07DB46 |
    TYX                           ;$07DB4A |
    DEC.W Obj_VAR8,X              ;$07DB4B |
    BEQ CODE_JP_07DB53            ;$07DB4E |
    JMP.W CODE_JP_07DB42          ;$07DB50 |

CODE_JP_07DB53:
    LDA.W #$DE3E                  ;$07DB53 |
    LDX.W #$0007                  ;$07DB56 |
    JSL.L CODE_FL_00E1B7          ;$07DB59 |
    LDA.W #$DB71                  ;$07DB5D |
    LDX.W #$0007                  ;$07DB60 |
    JSL.L CODE_FL_00E705          ;$07DB63 |
    TYX                           ;$07DB67 |
    STZ.W Obj_VAR3,X              ;$07DB68 |

CODE_07DB6B:
    JSL.L CODE_FL_00E091          ;$07DB6B |
    BRA CODE_07DB6B               ;$07DB6F |

CODE_07DB71:
    LDA.W $304B                   ;$07DB71 |
    CLC                           ;$07DB74 |
    ADC.W #$4000                  ;$07DB75 |
    STA.W $304B                   ;$07DB78 |
    LDA.W $303F                   ;$07DB7B |
    ADC.W #$0000                  ;$07DB7E |
    STA.W $303F                   ;$07DB81 |
    LDA.W #$0001                  ;$07DB84 |
    JSL.L CODE_FL_00E737          ;$07DB87 |
    BRA CODE_07DB71               ;$07DB8B |

CODE_FL_07DB8D:
    STZ.W $7B25                   ;$07DB8D |
    LDA.W #DMA_07DBC1             ;$07DB90 |
    LDX.W $7A6B                   ;$07DB93 |
    BEQ CODE_07DB9E               ;$07DB96 |
    LDA.W #DMA_07DBCA             ;$07DB98 |
    INC.W $7B25                   ;$07DB9B |

CODE_07DB9E:
    LDX.W #$0007                  ;$07DB9E |
    JSL.L LoadDMATable            ;$07DBA1 |
    LDA.W SB_GCO_Boss_Status      ;$07DBA5 |
    AND.W #$0020                  ;$07DBA8 |
    BEQ CODE_07DBB0               ;$07DBAB |
    STZ.W $7B25                   ;$07DBAD |

CODE_07DBB0:
    LDY.B $39                     ;$07DBB0 |
    LDA.W #$0000                  ;$07DBB2 |
    JSR.W CODE_FN_07E74C          ;$07DBB5 |
    LDA.W $7A6B                   ;$07DBB8 |
    STA.W Obj_VAR1,X              ;$07DBBB |
    LDY.B $39                     ;$07DBBE |
    RTL                           ;$07DBC0 |

DMA_07DBC1:
    db $83 : dw $00C0 : dl $EFCBD2 : dw $4A20
    db $FF
DMA_07DBCA:
    db $83 : dw $0180 : dl $EEFB9E : dw $4A20
    db $FF

CODE_07DBD3:
    JSL.L CODE_FL_07E217          ;$07DBD3 |
    LDA.W #$0030                  ;$07DBD7 |
    JSL.L PlayMusic          ;$07DBDA |
    LDY.B $39                     ;$07DBDE |
    LDA.W #$0010                  ;$07DBE0 |
    STA.W Obj_VAR8,Y              ;$07DBE3 |

CODE_JP_07DBE6:
    JSL.L FadeIn_Step             ;$07DBE6 |
    JSL.L CODE_FL_00E091          ;$07DBEA |
    TYX                           ;$07DBEE |
    DEC.W Obj_VAR8,X              ;$07DBEF |
    BEQ CODE_07DBF7               ;$07DBF2 |
    JMP.W CODE_JP_07DBE6          ;$07DBF4 |

CODE_07DBF7:
    TYX                           ;$07DBF7 |
    STZ.W Obj_VAR3,X              ;$07DBF8 |

CODE_07DBFB:
    JSL.L CODE_FL_00E091          ;$07DBFB |
    BRA CODE_07DBFB               ;$07DBFF |

PTR16_07DC01:
    db $1F,$DC,$60,$DC,$B1,$DC,$F2,$DC;$07DC01 |
    db $3B,$DD,$7C,$DD,$B5,$DD    ;$07DC09 |

PTR16_07DC0F:
    dw DATA8_07DDE5               ;$07DC0F |
    dw DATA8_07DDF1               ;$07DC11 |
    dw DATA8_07DDFD               ;$07DC13 |
    dw DATA8_07DE0E               ;$07DC15 |
    dw DATA8_07DE1F               ;$07DC17 |
    dw DATA8_07DE2B               ;$07DC19 |
    dw DATA8_07DE32               ;$07DC1B |

DATA16_07DC1D:
    dw $0000                      ;$07DC1D |

DMA_07DC1F:
    db $83 : dw $0160 : dl $EBC16C : dw $6000
    db $83 : dw $0140 : dl $EC21A6 : dw $6100
    db $83 : dw $1D00 : dl $E17A0E : dw $0000
    db $83 : dw $0020 : dl $EEFFEE : dw $3000
    db $89 : dw $0400 : dl $EEF679 : dw $5000
    db $0F : dw $0400 : dl $7E2400 : dw $5000
    db $89 : dw $0400 : dl $EC2909 : dw $3C00
    db $0F : dw $0400 : dl $7E2400 : dw $3C00
    db $FF

DMA_07DC60:
    db $83 : dw $0160 : dl $EBC16C : dw $6000
    db $83 : dw $0140 : dl $EC21A6 : dw $6100
    db $06 : dw $1000 : dl $07DC1D : dw $3C00
    db $06 : dw $2000 : dl $07DC1D : dw $5000
    db $89 : dw $0400 : dl $EA2F6C : dw $5000
    db $0F : dw $0400 : dl $7E2400 : dw $5000
    db $89 : dw $0400 : dl $ECA54C : dw $3C00
    db $0F : dw $0400 : dl $7E2400 : dw $3C00
    db $83 : dw $0840 : dl $E8400C : dw $3000
    db $83 : dw $1EE0 : dl $DF8B6F : dw $0000
    db $FF

DMA_07DCB1:
    db $83 : dw $0160 : dl $EBC16C : dw $6000
    db $83 : dw $0140 : dl $EC21A6 : dw $6100
    db $89 : dw $0400 : dl $EA415A : dw $4800
    db $0F : dw $0400 : dl $7E2400 : dw $4800
    db $89 : dw $0400 : dl $EABF02 : dw $3C00
    db $0F : dw $0400 : dl $7E2400 : dw $3C00
    db $83 : dw $1140 : dl $E715B6 : dw $2000
    db $83 : dw $2460 : dl $DD0000 : dw $0000
    db $FF

DMA_07DCF2:
    db $83 : dw $1E40 : dl $E00000 : dw $6200
    db $83 : dw $25A0 : dl $DC1C9D : dw $0000
    db $06 : dw $0800 : dl DATA16_07DC1D : dw $4000
    db $89 : dw $0400 : dl $EAFC4C : dw $4000
    db $0F : dw $0400 : dl $7E2400 : dw $4000
    db $89 : dw $0400 : dl $E7BD67 : dw $4800
    db $0F : dw $0400 : dl $7E2800 : dw $4800
    db $09 : dw $0400 : dl $7E2400 : dw $4C00
    db $0F : dw $0400 : dl $7E2C00 : dw $4C00
    db $FF

DMA_07DD3B:
    db $83 : dw $0500 : dl $E9F932 : dw $6000
    db $83 : dw $0100 : dl $EDE402 : dw $6300
    db $83 : dw $3640 : dl $DA71B0 : dw $0000
    db $83 : dw $2400 : dl $DC7035 : dw $2000
    db $89 : dw $0400 : dl $EA685B : dw $3C00
    db $0F : dw $0400 : dl $7E2400 : dw $3C00
    db $89 : dw $0400 : dl $E9A695 : dw $4000
    db $0F : dw $0400 : dl $7E2400 : dw $4000
    db $FF 

DMA_07DD7C:
    db $89 : dw $0400 : dl $EBC619 : dw $4800
    db $0F : dw $0400 : dl $7E2400 : dw $4800
    db $89 : dw $0400 : dl $E8BC69 : dw $5800
    db $0F : dw $0400 : dl $7E2400 : dw $5800
    db $89 : dw $0400 : dl $E923C0 : dw $5C00
    db $0F : dw $0400 : dl $7E2400 : dw $5C00
    db $83 : dw $2560 : dl $DBD183 : dw $1000
    db $FF

DMA_07DDB5:
    db $83 : dw $0500 : dl $E9F932 : dw $6000
    db $83 : dw $0100 : dl $EDE402 : dw $6300
    db $89 : dw $0400 : dl $EA9257 : dw $3C00
    db $0F : dw $0400 : dl $7E2400 : dw $3C00
    db $83 : dw $2040 : dl $DCA60A : dw $0000
    db $FF

DATA8_07DDDE:
    db $18,$DE,$EF,$0F,$91,$FF,$FF;$07DDDE |

DATA8_07DDE5:
    db $A0,$55,$ED,$50,$00,$2D,$D6,$EF;$07DDE5 |
    db $10,$80,$FF,$FF            ;$07DDED |

DATA8_07DDF1:
    db $7D,$BE,$07,$10,$00,$6D,$D7,$EF;$07DDF1 |
    db $10,$80,$FF,$FF            ;$07DDF9 |

DATA8_07DDFD:
    db $6D,$D8,$EF,$10,$80,$52,$B9,$EF;$07DDFD |
    db $20,$00,$4D,$D8,$EF,$10,$30,$FF;$07DE05 |
    db $FF                        ;$07DE0D |

DATA8_07DE0E:
    db $25,$9C,$EB,$80,$80,$52,$BA,$EF;$07DE0E |
    db $20,$00,$5D,$C3,$07,$30,$50,$FF;$07DE16 |
    db $FF                        ;$07DE1E |

DATA8_07DE1F:
    db $AD,$DA,$EF,$10,$80,$8D,$DA
    db $EF,$10,$70,$FF,$FF

DATA8_07DE2B:
    db $AD,$DB,$EF,$10,$00,$FF,$FF;$07DE2B |

DATA8_07DE32:
    db $2D,$D2,$EF,$10,$80,$A0,$47,$EF;$07DE32 |
    db $30,$10,$FF,$FF            ;$07DE3A |

    JSL.L CODE_FL_00E70E          ;$07DE3E |

CODE_87DE42:
    LDA.W TitleDemo_Flag          ;$07DE42 |
    AND.W #$00FF                  ;$07DE45 |
    BEQ CODE_87DE4D               ;$07DE48 |
    JMP.W CODE_87DEC5             ;$07DE4A |

CODE_87DE4D:
    LDA.W Obj_VAR3,Y              ;$07DE4D |
    BEQ CODE_87DE6D               ;$07DE50 |
    LDA.W Current_SubGame         ;$07DE52 |
    CMP.W #$00!SUBGAME_GCO        ;$07DE55 |
    BNE CODE_87DE6C               ;$07DE58 |
    LDA.W P1_Frame                ;$07DE5A |
    AND.W #$C0C0                  ;$07DE5D |
    BEQ CODE_87DE6C               ;$07DE60 |
    LDA.W #$D9E8                  ;$07DE62 |
    STA.W Obj_ScriptProgramCounter,Y;$07DE65 |
    TYX                           ;$07DE68 |
    STZ.W Obj_ScriptSleepTimer,X  ;$07DE69 |

CODE_87DE6C:
    RTL                           ;$07DE6C |

CODE_87DE6D:
    LDA.W Obj_VAR1,Y              ;$07DE6D |
    BEQ CODE_87DE7A               ;$07DE70 |
    TYX                           ;$07DE72 |
    DEC.W Obj_VAR1,X              ;$07DE73 |
    JML.L FadeOut_Step            ;$07DE76 |

CODE_87DE7A:
    LDA.W Obj_VAR0,Y              ;$07DE7A |
    BMI CODE_87DEE0               ;$07DE7D |
    BNE CODE_87DEE7               ;$07DE7F |
    TYX                           ;$07DE81 |
    INC.W Obj_VAR0,X              ;$07DE82 |
    LDA.W P1_Frame                ;$07DE85 |
    BIT.W #$5080                  ;$07DE88 |
    BNE CODE_87DE97               ;$07DE8B |
    DEC.W Obj_VAR0,X              ;$07DE8D |
    BIT.W #$A000                  ;$07DE90 |
    BNE CODE_87DEA9               ;$07DE93 |
    BRA CODE_87DEB6               ;$07DE95 |

CODE_87DE97:
    LDX.W Current_SubGame         ;$07DE97 |
    LDA.L DATA8_07DED9,X          ;$07DE9A |
    AND.W #$00FF                  ;$07DE9E |
    JSL.L PlaySFX                 ;$07DEA1 |
    LDY.B $39                     ;$07DEA5 |
    BRA CODE_87DEAC               ;$07DEA7 |

CODE_87DEA9:
    DEC.W Obj_VAR0,X              ;$07DEA9 |

CODE_87DEAC:
    LDA.W #$000F                  ;$07DEAC |
    STA.W Obj_VAR1,Y              ;$07DEAF |
    INC.W $7A31                   ;$07DEB2 |
    RTL                           ;$07DEB5 |

CODE_87DEB6:
    LDA.W P1_Frame                ;$07DEB6 |
    AND.W #$0F00                  ;$07DEB9 |
    BEQ CODE_87DEC5               ;$07DEBC |
    LDA.W #$0168                  ;$07DEBE |
    STA.W $7B29                   ;$07DEC1 |
    RTL                           ;$07DEC4 |

CODE_87DEC5:
    DEC.W $7B29                   ;$07DEC5 |
    BNE CODE_87DED8               ;$07DEC8 |
    LDA.W Current_SubGame         ;$07DECA |
    CMP.W #$00!SUBGAME_ARENA      ;$07DECD |
    BEQ CODE_87DED8               ;$07DED0 |
    LDA.W #$FFFF                  ;$07DED2 |
    STA.W ReloadRoom              ;$07DED5 |

CODE_87DED8:
    RTL                           ;$07DED8 |

DATA8_07DED9:
    db $32              ; 00 - Spring Breeze
    db $32              ; 01 - Dyna Blade
    db $32              ; 02 - Gourmet Race
    db $32              ; 03 - Great Cave Offensive
    db $6D              ; 04 - Revenge of Meta Knight
    db $32              ; 05 - Milky Way Wishes
    db $46              ; 06 - The Arena

CODE_87DEE0:
    STZ.W ReloadMapOnUnpause      ;$07DEE0 |
    INC.W ReloadRoom              ;$07DEE3 |
    RTL                           ;$07DEE6 |

CODE_87DEE7:
    LDA.W Current_SubGame         ;$07DEE7 |
    CMP.W #$00!SUBGAME_SOUNDTEST  ;$07DEEA |

CODE_87DEED:
    BCS CODE_87DEED               ;$07DEED |
    ASL A                         ;$07DEEF |
    TAX                           ;$07DEF0 |
    JMP.W (PTR16_07DEF4,X)        ;$07DEF1 |
PTR16_07DEF4:
    dw CODE_07DF02                ;$07DEF4 |
    dw CODE_07DF24                ;$07DEF6 |
    dw CODE_07DF58                ;$07DEF8 |
    dw CODE_07DF7E                ;$07DEFA |
    dw CODE_07DFD3                ;$07DEFC |
    dw CODE_07DFF5                ;$07DEFE |
    dw CODE_07E038                ;$07DF00 |

CODE_07DF02:
    STZ.W Current_Level           ;$07DF02 |
    STZ.W Current_Room            ;$07DF05 |
    LDA.W $7B25                   ;$07DF08 |
    BEQ CODE_07DF1B               ;$07DF0B |
    LDA.W $7B23                   ;$07DF0D |
    BEQ CODE_07DF1B               ;$07DF10 |
    LDA.W $7B27                   ;$07DF12 |
    STA.W Current_Level           ;$07DF15 |
    JMP.W CODE_JP_07E04D          ;$07DF18 |


CODE_07DF1B:
    LDA.W #$000F                  ;$07DF1B |
    TRB.W $7AE7                   ;$07DF1E |
    JMP.W CODE_JP_07E04D          ;$07DF21 |

CODE_07DF24:
    STZ.W Current_Level           ;$07DF24 |
    STZ.W Current_Room            ;$07DF27 |
    LDA.W $7B25                   ;$07DF2A |
    BEQ CODE_87DF37               ;$07DF2D |
    LDA.W $7A63                   ;$07DF2F |
    AND.W #$00FF                  ;$07DF32 |
    BNE CODE_07DF55               ;$07DF35 |

CODE_87DF37:
    SEP #$20                      ;$07DF37 |
    LDA.B #$00                    ;$07DF39 |
    STA.W $7A63                   ;$07DF3B |
    STA.W $7A64                   ;$07DF3E |
    STA.W $7A65                   ;$07DF41 |
    STA.W $7A66                   ;$07DF44 |
    STA.W $7A67                   ;$07DF47 |
    STA.W $7A68                   ;$07DF4A |
    REP #$20                      ;$07DF4D |
    LDA.W #$0010                  ;$07DF4F |
    TRB.W $7AE7                   ;$07DF52 |

CODE_07DF55:
    JMP.W CODE_JP_07E040          ;$07DF55 |

CODE_07DF58:
    INC.W $7B2D                   ;$07DF58 |
    STZ.W Current_Room            ;$07DF5B |
    LDA.W $7B25                   ;$07DF5E |
    BEQ CODE_07DF67               ;$07DF61 |
    STZ.W $7B2D                   ;$07DF63 |
    DEC A                         ;$07DF66 |

CODE_07DF67:
    STA.W Current_Level           ;$07DF67 |
    %LoadLongToAX(CODE_07DF77)
    JSL.L SA1_ExecuteSNES         ;$07DF70 |
    JMP.W CODE_JP_07E040          ;$07DF74 |
CODE_07DF77:
    LDA.W $7B25                   ;$07DF77 |
    STA.W $00E7                   ;$07DF7A |
    RTL                           ;$07DF7D |

CODE_07DF7E:
    STZ.W $7B49                   ;$07DF7E |
    STZ.W $7B4B                   ;$07DF81 |
    STZ.W Current_Room            ;$07DF84 |
    LDA.W $7B25                   ;$07DF87 |
    BNE CODE_07DFBD               ;$07DF8A |
    LDA.W #$0001                  ;$07DF8C |
    STA.W $7719                   ;$07DF8F |
    STZ.W Current_Level           ;$07DF92 |
    STZ.W $7B05                   ;$07DF95 |
    STZ.W $7B07                   ;$07DF98 |
    STZ.W $7B09                   ;$07DF9B |
    STZ.W $7B0B                   ;$07DF9E |
    STZ.W $7B0F                   ;$07DFA1 |
    STZ.W $7B11                   ;$07DFA4 |
    LDA.W #$01E0                  ;$07DFA7 |
    TRB.W $7AE7                   ;$07DFAA |
    SEP #$20                      ;$07DFAD |
    STZ.W $7B13                   ;$07DFAF |
    STZ.W $7B14                   ;$07DFB2 |
    REP #$20                      ;$07DFB5 |
    STZ.W $771B                   ;$07DFB7 |
    JMP.W CODE_JP_07E040          ;$07DFBA |

CODE_07DFBD:
    STZ.W $7719                   ;$07DFBD |
    LDA.W $7B0D                   ;$07DFC0 |
    BPL CODE_07DFCB               ;$07DFC3 |
    INC.W $7719                   ;$07DFC5 |
    LDA.W #$0000                  ;$07DFC8 |

CODE_07DFCB:
    STA.W Current_Room            ;$07DFCB |
    STZ.W Current_Level           ;$07DFCE |
    BRA CODE_JP_07E04D            ;$07DFD1 |

CODE_07DFD3:
    STZ.W Current_Room            ;$07DFD3 |
    LDA.W $7B27                   ;$07DFD6 |
    LDX.W $7B25                   ;$07DFD9 |
    BNE CODE_07DFF0               ;$07DFDC |
    STZ.W $7A69                   ;$07DFDE |
    STZ.W $7B19                   ;$07DFE1 |
    STZ.W MWW_Abilities_Saved     ;$07DFE4 |
    LDA.W #$01FE                  ;$07DFE7 |
    TRB.W $7AE8                   ;$07DFEA |
    LDA.W #$0000                  ;$07DFED |

CODE_07DFF0:
    STA.W Current_Level           ;$07DFF0 |
    BRA CODE_JP_07E040            ;$07DFF3 |

CODE_07DFF5:
    STZ.W $7B49                   ;$07DFF5 |
    STZ.W $7B4B                   ;$07DFF8 |
    STZ.W Current_Room            ;$07DFFB |
    STZ.W Current_Level           ;$07DFFE |
    LDA.W $7B25                   ;$07E001 |
    BEQ CODE_07E00B               ;$07E004 |
    LDA.W $7A6B                   ;$07E006 |
    BNE CODE_JP_07E040            ;$07E009 |

CODE_07E00B:
    LDA.W #$0080                  ;$07E00B |
    STA.W $7A6F                   ;$07E00E |
    STA.W $7A71                   ;$07E011 |
    STZ.W $7A6B                   ;$07E014 |
    LDA.W #$0009                  ;$07E017 |
    STA.W MWW_Current_Planet      ;$07E01A |
    SEP #$20                      ;$07E01D |
    STZ.W $7B1D                   ;$07E01F |
    STZ.W MWW_Ability_Quantity    ;$07E022 |
    STZ.W $7B1F                   ;$07E025 |
    STZ.W $7B20                   ;$07E028 |
    REP #$20                      ;$07E02B |
    LDA.W #$0000                  ;$07E02D |
    LDA.W #$FE00                  ;$07E030 |
    TRB.W $7AE8                   ;$07E033 |
    BRA CODE_JP_07E040            ;$07E036 |

CODE_07E038:
    STZ.W Current_Level           ;$07E038 |
    STZ.W Current_Room            ;$07E03B |
    BRA CODE_JP_07E040            ;$07E03E |

CODE_JP_07E040:
    LDX.W Current_SubGame         ;$07E040 |
    LDA.L DATA8_07E060,X          ;$07E043 |
    AND.W #$00FF                  ;$07E047 |
    STA.W $73AE                   ;$07E04A |

CODE_JP_07E04D:
    JSL.L CODE_FL_00EF86          ;$07E04D |
    %LoadLongToAX(CODE_JP_07E05C)
    JSL.L SA1_ExecuteSNES         ;$07E057 |
    RTL                           ;$07E05B |
CODE_JP_07E05C:
    INC.W ReloadRoom              ;$07E05C |
    RTL                           ;$07E05F |

DATA8_07E060:
    db $00,$00,$00,$00,$01,$02,$00,$00;$07E060 |
    db $00                        ;$07E068 |
    LDA.W #$9549                  ;$07E069 |
    LDX.W #$00CC                  ;$07E06C |
    JSL.L CODE_FL_00E1CC          ;$07E06F |
    LDA.W #$A89D                  ;$07E073 |
    STA.W Obj_TickLoopCallback,Y   ;$07E076 |
    LDA.W Obj_VAR0,Y              ;$07E079 |
    CMP.W #$0009                  ;$07E07C |

CODE_87E07F:
    BCS CODE_87E07F               ;$07E07F |
    ASL A                         ;$07E081 |
    TAX                           ;$07E082 |
    JMP.W (PTR16_07E086,X)        ;$07E083 |
PTR16_07E086:
    dw CODE_07E098                ;$07E086 |
    dw CODE_07E65D                ;$07E088 |
    dw CODE_07E2D9                ;$07E08A |
    dw CODE_07E2B1                ;$07E08C |
    dw CODE_07E383                ;$07E08E |
    dw CODE_07E407                ;$07E090 |
    dw CODE_07E63A                ;$07E092 |
    dw CODE_07E857                ;$07E094 |
    dw CODE_07ECBA                ;$07E096 |

CODE_07E098:
    JSR.W CODE_FN_07E235          ;$07E098 |
    LDY.B $39                     ;$07E09B |
    LDA.W Current_SubGame         ;$07E09D |
    CMP.W #$00!SUBGAME_SOUNDTEST  ;$07E0A0 |

CODE_87E0A3:
    BCS CODE_87E0A3               ;$07E0A3 |
    ASL A                         ;$07E0A5 |
    TAX                           ;$07E0A6 |
    JMP.W (PTR16_07E0AA,X)        ;$07E0A7 |
PTR16_07E0AA:
    dw CODE_07E0B8                ;$07E0AA |
    dw CODE_07E0E3                ;$07E0AC |
    dw CODE_07E0F9                ;$07E0AE |
    dw CODE_07E11E                ;$07E0B0 |
    dw CODE_07E13E                ;$07E0B2 |
    dw CODE_07E154                ;$07E0B4 |
    dw CODE_07E186                ;$07E0B6 |

CODE_07E0B8:
    LDA.W #$E18C                  ;$07E0B8 |
    LDX.W #$0007                  ;$07E0BB |
    JSL.L CODE_FL_00E1B7          ;$07E0BE |

CODE_07E0C2:
    LDA.W #$0A00                  ;$07E0C2 |
    JSL.L CODE_FL_00E169          ;$07E0C5 |
    TYX                           ;$07E0C9 |
    INC.W Obj_Pose,X              ;$07E0CA |
    JSL.L CODE_FL_00E0C7          ;$07E0CD |
    TYX                           ;$07E0D1 |
    INC.W Obj_Pose,X              ;$07E0D2 |
    JSL.L CODE_FL_00E0C7          ;$07E0D5 |
    TYX                           ;$07E0D9 |
    DEC.W Obj_Pose,X              ;$07E0DA |
    JSL.L CODE_FL_00E0C7          ;$07E0DD |
    BRA CODE_07E0C2               ;$07E0E1 |

CODE_07E0E3:
    LDA.W #$E1B9                  ;$07E0E3 |
    LDX.W #$0007                  ;$07E0E6 |
    JSL.L CODE_FL_00E1B7          ;$07E0E9 |
    LDA.W #$0006                  ;$07E0ED |
    STA.W Obj_Pose,Y              ;$07E0F0 |

CODE_87E0F3:
    JSL.L CODE_FL_00E091          ;$07E0F3 |
    BRA CODE_87E0F3               ;$07E0F7 |

CODE_07E0F9:
    LDA.W #$0F1E                  ;$07E0F9 |
    STA.W Obj_VAR4,Y              ;$07E0FC |
    LDA.W #$FFFF                  ;$07E0FF |
    STA.W Obj_VAR1,Y              ;$07E102 |
    JSR.W CODE_FN_07E235          ;$07E105 |
    LDA.W #$E1E6                  ;$07E108 |
    LDX.W #$0007                  ;$07E10B |
    JSL.L CODE_FL_00E1B7          ;$07E10E |
    LDA.W #$0008                  ;$07E112 |
    STA.W Obj_Pose,Y              ;$07E115 |

CODE_07E118:
    JSL.L CODE_FL_00E091          ;$07E118 |
    BRA CODE_07E118               ;$07E11C |

CODE_07E11E:
    LDA.W #$93A1                  ;$07E11E |
    LDX.W #$00CC                  ;$07E121 |
    JSL.L CODE_FL_00E1CC          ;$07E124 |
    LDA.W #$E18C                  ;$07E128 |
    LDX.W #$0007                  ;$07E12B |
    JSL.L CODE_FL_00E1B7          ;$07E12E |
    LDA.W #$0010                  ;$07E132 |
    STA.W Obj_Pose,Y              ;$07E135 |

CODE_07E138:
    JSL.L CODE_FL_00E091          ;$07E138 |
    BRA CODE_07E138               ;$07E13C |

CODE_07E13E:
    LDA.W #$E18C                  ;$07E13E |
    LDX.W #$0007                  ;$07E141 |
    JSL.L CODE_FL_00E1B7          ;$07E144 |
    LDA.W #$000A                  ;$07E148 |
    STA.W Obj_Pose,Y              ;$07E14B |

CODE_07E14E:
    JSL.L CODE_FL_00E091          ;$07E14E |
    BRA CODE_07E14E               ;$07E152 |

CODE_07E154:
    LDA.W #$9AEA                  ;$07E154 |
    LDX.W #$00C5                  ;$07E157 |
    JSL.L CODE_FL_00E1CC          ;$07E15A |
    LDA.W #$E18C                  ;$07E15E |
    LDX.W #$0007                  ;$07E161 |
    JSL.L CODE_FL_00E1B7          ;$07E164 |

CODE_07E168:
    LDA.W #$0A02                  ;$07E168 |
    JSL.L CODE_FL_00E169          ;$07E16B |
    LDA.W #$0A04                  ;$07E16F |
    JSL.L CODE_FL_00E169          ;$07E172 |
    LDA.W #$0A03                  ;$07E176 |
    JSL.L CODE_FL_00E169          ;$07E179 |
    LDA.W #$0A05                  ;$07E17D |
    JSL.L CODE_FL_00E169          ;$07E180 |
    BRA CODE_07E168               ;$07E184 |

CODE_07E186:
    JSL.L CODE_FL_00E091          ;$07E186 |
    BRA CODE_07E186               ;$07E18A |

    LDA.W Obj_VAR0                ;$07E18C |
    BNE CODE_07E1B8               ;$07E18F |
    LDA.W Obj_VAR1,Y              ;$07E191 |
    BEQ CODE_07E1B8               ;$07E194 |
    LDA.W P1_Repeat               ;$07E196 |
    AND.W #$0C00                  ;$07E199 |
    BEQ CODE_07E1B8               ;$07E19C |
    STZ.W $7B25                   ;$07E19E |
    AND.W #$0800                  ;$07E1A1 |
    BEQ CODE_07E1AC               ;$07E1A4 |
    LDA.W #$0001                  ;$07E1A6 |
    STA.W $7B25                   ;$07E1A9 |

CODE_07E1AC:
    LDA.W #$0046                  ;$07E1AC |
    JSL.L PlaySFX                 ;$07E1AF |
    LDY.B $39                     ;$07E1B3 |
    JSR.W CODE_FN_07E235          ;$07E1B5 |

CODE_07E1B8:
    RTL                           ;$07E1B8 |
    LDA.W Obj_VAR0                ;$07E1B9 |
    BNE CODE_87E1E5               ;$07E1BC |
    LDA.W Obj_VAR1,Y              ;$07E1BE |
    BEQ CODE_87E1E5               ;$07E1C1 |
    LDA.W P1_Repeat               ;$07E1C3 |
    AND.W #$0300                  ;$07E1C6 |
    BEQ CODE_87E1E5               ;$07E1C9 |
    STZ.W $7B25                   ;$07E1CB |
    AND.W #$0100                  ;$07E1CE |
    BEQ CODE_07E1D9               ;$07E1D1 |
    LDA.W #$0001                  ;$07E1D3 |
    STA.W $7B25                   ;$07E1D6 |

CODE_07E1D9:
    LDA.W #$0046                  ;$07E1D9 |
    JSL.L PlaySFX                 ;$07E1DC |
    LDY.B $39                     ;$07E1E0 |
    JSR.W CODE_FN_07E235          ;$07E1E2 |

CODE_87E1E5:
    RTL                           ;$07E1E5 |
    LDA.W P1_Repeat               ;$07E1E6 |
    AND.W #$0C00                  ;$07E1E9 |
    BEQ CODE_07E216               ;$07E1EC |
    AND.W #$0800                  ;$07E1EE |
    BEQ CODE_07E1FE               ;$07E1F1 |
    LDA.W $7B25                   ;$07E1F3 |
    DEC A                         ;$07E1F6 |
    BMI CODE_07E216               ;$07E1F7 |
    STA.W $7B25                   ;$07E1F9 |
    BRA CODE_07E20A               ;$07E1FC |

CODE_07E1FE:
    LDA.W $7B25                   ;$07E1FE |
    INC A                         ;$07E201 |
    CMP.W #$0004                  ;$07E202 |
    BEQ CODE_07E216               ;$07E205 |
    STA.W $7B25                   ;$07E207 |

CODE_07E20A:
    LDA.W #$0046                  ;$07E20A |
    JSL.L PlaySFX                 ;$07E20D |
    LDY.B $39                     ;$07E211 |
    JSR.W CODE_FN_07E235          ;$07E213 |

CODE_07E216:
    RTL                           ;$07E216 |

CODE_FL_07E217:
    LDA.W TitleDemo_Flag          ;$07E217 |
    AND.W #$00FF                  ;$07E21A |
    BEQ CODE_87E224               ;$07E21D |
    LDA.W #$00B4                  ;$07E21F |
    BRA CODE_87E231               ;$07E222 |

CODE_87E224:
    LDA.W $7A8D                   ;$07E224 |
    BNE CODE_87E22E               ;$07E227 |
    LDA.W #$0168                  ;$07E229 |
    BRA CODE_87E231               ;$07E22C |

CODE_87E22E:
    LDA.W #$0258                  ;$07E22E |

CODE_87E231:
    STA.W $7B29                   ;$07E231 |
    RTL                           ;$07E234 |

CODE_FN_07E235:
    LDX.W Current_SubGame_x2      ;$07E235 |
    LDA.L PTR16_07E272,X          ;$07E238 |
    STA.B SNES_WaitForCommand_waitForMessage;$07E23C |
    LDA.W #$0007                  ;$07E23E |
    STA.B $16                     ;$07E241 |
    LDX.B $39                     ;$07E243 |
    LDA.W Obj_VAR1,X              ;$07E245 |
    BNE CODE_87E257               ;$07E248 |
    LDX.W Current_SubGame         ;$07E24A |
    LDA.L DATA16_07E280,X         ;$07E24D |
    AND.W #$00FF                  ;$07E251 |
    TAY                           ;$07E254 |
    BRA CODE_07E25C               ;$07E255 |

CODE_87E257:
    LDA.W $7B25                   ;$07E257 |
    ASL A                         ;$07E25A |
    TAY                           ;$07E25B |

CODE_07E25C:
    LDX.B $39                     ;$07E25C |
    LDA.B [SNES_WaitForCommand_waitForMessage],Y;$07E25E |
    INY                           ;$07E260 |
    AND.W #$00FF                  ;$07E261 |
    STA.W Obj_XPosition,X         ;$07E264 |
    LDA.B [SNES_WaitForCommand_waitForMessage],Y;$07E267 |
    AND.W #$00FF                  ;$07E269 |
    STA.W Obj_YPosition,X         ;$07E26C |
    LDY.B $39                     ;$07E26F |
    RTS                           ;$07E271 |
PTR16_07E272:
    dw $E287                      ;$07E272 |
    dw $E28D               ;$07E274 |
    dw $E293               ;$07E276 |
    dw $E29B               ;$07E278 |
    dw $E2A1               ;$07E27A |
    dw $E2A7               ;$07E27C |
    dw $E2AD               ;$07E27E |

DATA16_07E280:
    dw $0404,$0400,$0404,$4000    ;$07E280 |
    dw $40A0,$4E88,$2A90,$DEAC    ;$07E288 |
    dw $52AC,$38AC,$388C,$389C    ;$07E290 |
    dw $38A4,$54AC,$549A,$548A    ;$07E298 |
    dw $4092,$40A8,$4098,$58A0    ;$07E2A0 |
    dw $58A9,$5891,$3B91,$3BA0    ;$07E2A8 |
    db $88                        ;$07E2B0 |

CODE_07E2B1:
    LDA.W $7A69                   ;$07E2B1 |
    ASL A                         ;$07E2B4 |
    TAX                           ;$07E2B5 |
    LDA.L DATA16_07E2C7,X         ;$07E2B6 |
    STA.W $7B27                   ;$07E2BA |
    JSL.L CODE_FL_07E6A3          ;$07E2BD |

CODE_07E2C1:
    JSL.L CODE_FL_00E091          ;$07E2C1 |
    BRA CODE_07E2C1               ;$07E2C5 |

DATA16_07E2C7:
    dw $0000,$0001,$0002,$0003    ;$07E2C7 |
    dw $0004,$0005,$0006,$0007    ;$07E2CF |
    dw $0004                      ;$07E2D7 |

CODE_07E2D9:
    LDA.W Obj_VAR1,Y              ;$07E2D9 |
    ASL A                         ;$07E2DC |
    TAX                           ;$07E2DD |
    LDA.L PTR16_07E37F,X          ;$07E2DE |
    TAX                           ;$07E2E2 |
    AND.W #$00FF                  ;$07E2E3 |
    STA.W Obj_XPosition,Y         ;$07E2E6 |
    TXA                           ;$07E2E9 |
    XBA                           ;$07E2EA |
    AND.W #$00FF                  ;$07E2EB |
    STA.W Obj_YPosition,Y         ;$07E2EE |
    LDA.W Obj_VAR2,Y              ;$07E2F1 |
    STA.W $7B27                   ;$07E2F4 |
    JSL.L CODE_FL_07E6A3          ;$07E2F7 |
    LDA.W #$0001                  ;$07E2FB |
    JSR.W CODE_FN_07E74C          ;$07E2FE |
    LDA.B $39                     ;$07E301 |
    STA.W Obj_VAR1,X              ;$07E303 |
    TAY                           ;$07E306 |
    LDA.W Obj_VAR2,Y              ;$07E307 |
    STA.W Obj_VAR2,X              ;$07E30A |
    LDA.W #$E31D                  ;$07E30D |
    LDX.W #$0007                  ;$07E310 |
    JSL.L CODE_FL_00E1B7          ;$07E313 |

CODE_07E317:
    JSL.L CODE_FL_00E091          ;$07E317 |
    BRA CODE_07E317               ;$07E31B |
    LDA.W Obj_VAR0                ;$07E31D |
    BNE CODE_07E37E               ;$07E320 |
    LDA.W $7B25                   ;$07E322 |
    BEQ CODE_07E37E               ;$07E325 |
    LDA.W P1_Repeat               ;$07E327 |
    AND.W #$0330                  ;$07E32A |
    BNE CODE_07E337               ;$07E32D |
    LDA.W #$061E                  ;$07E32F |
    STA.W Obj_VAR4,Y              ;$07E332 |
    BRA CODE_07E37E               ;$07E335 |

CODE_07E337:
    TYX                           ;$07E337 |
    LDA.W Obj_VAR4,Y              ;$07E338 |
    AND.W #$00FF                  ;$07E33B |
    BEQ CODE_07E34A               ;$07E33E |
    DEC.W Obj_VAR4,X              ;$07E340 |
    CMP.W #$001E                  ;$07E343 |
    BEQ CODE_07E35E               ;$07E346 |
    BRA CODE_07E37E               ;$07E348 |


CODE_07E34A:
    LDA.W Obj_VAR4,Y              ;$07E34A |
    XBA                           ;$07E34D |
    AND.W #$00FF                  ;$07E34E |
    BEQ CODE_07E358               ;$07E351 |
    DEC.W $6F3F,X                 ;$07E353 |
    BRA CODE_07E37E               ;$07E356 |


CODE_07E358:
    LDA.W #$0600                  ;$07E358 |
    STA.W Obj_VAR4,Y              ;$07E35B |

CODE_07E35E:
    LDA.W P1_Repeat               ;$07E35E |
    AND.W #$0110                  ;$07E361 |
    BNE CODE_07E36E               ;$07E364 |
    LDA.W $7B27                   ;$07E366 |
    BEQ CODE_07E37E               ;$07E369 |
    DEC A                         ;$07E36B |
    BRA CODE_07E377               ;$07E36C |

CODE_07E36E:
    LDA.W $7B27                   ;$07E36E |
    CMP.W Obj_VAR2,Y              ;$07E371 |
    BEQ CODE_07E37E               ;$07E374 |
    INC A                         ;$07E376 |

CODE_07E377:
    STA.W $7B27                   ;$07E377 |
    JSL.L CODE_FL_07E6A3          ;$07E37A |

CODE_07E37E:
    RTL                           ;$07E37E |

PTR16_07E37F:
    dw $91CA                      ;$07E37F |
    dw $9DCD                      ;$07E381 |

CODE_07E383:
    LDA.W #$FFFF                  ;$07E383 |
    LDX.W #$00FF                  ;$07E386 |
    JSL.L CODE_FL_00E1CC          ;$07E389 |
    LDA.W #$FFFF                  ;$07E38D |
    STA.W Obj_Pose,Y              ;$07E390 |
    LDA.W #$A8BA                  ;$07E393 |
    STA.W Obj_TickLoopCallback,Y  ;$07E396 |
    LDA.W Current_SubGame         ;$07E399 |
    CMP.W #$00!SUBGAME_SOUNDTEST  ;$07E39C |

CODE_87E39F:
    BCS CODE_87E39F               ;$07E39F |
    ASL A                         ;$07E3A1 |
    TAX                           ;$07E3A2 |
    JMP.W (PTR16_07E3A6,X)        ;$07E3A3 |
PTR16_07E3A6:
    dw CODE_07E3B4                ;$07E3A6 |
    dw CODE_07E3C3                ;$07E3A8 |
    dw CODE_07E3F1                ;$07E3AA |
    dw CODE_07E403                ;$07E3AC |
    dw CODE_07E403                ;$07E3AE |
    dw CODE_07E403                ;$07E3B0 |
    dw CODE_07E403                ;$07E3B2 |

CODE_07E3B4:
    LDA.W #$4000                  ;$07E3B4 |
    STA.W $734E                   ;$07E3B7 |
    STA.W $7356                   ;$07E3BA |

CODE_87E3BD:
    JSL.L CODE_FL_00E091          ;$07E3BD |
    BRA CODE_87E3BD               ;$07E3C1 |

CODE_07E3C3:
    LDA.W #$0100                  ;$07E3C3 |
    STA.W $303B                   ;$07E3C6 |
    STA.W $3041                   ;$07E3C9 |
    STA.W CameraY_TileMirror                   ;$07E3CC |
    LDA.W #$0010                  ;$07E3CF |
    STA.W $733E                   ;$07E3D2 |
    LDA.W #$FFF0                  ;$07E3D5 |
    STA.W $7346                   ;$07E3D8 |
    JSL.L CODE_FL_00E0EB          ;$07E3DB |
    TYX                           ;$07E3DF |
    STZ.W $733E                   ;$07E3E0 |
    STZ.W $7346                   ;$07E3E3 |
    JSL.L CODE_FL_00E0BB          ;$07E3E6 |
    STZ.W CameraY_TileMirror                   ;$07E3EA |
    JML.L DestroyUsedObject       ;$07E3ED |

CODE_07E3F1:
    LDA.W #$FFFF                  ;$07E3F1 |
    STA.W $7344                   ;$07E3F4 |
    LDA.W #$C000                  ;$07E3F7 |
    STA.W $7354                   ;$07E3FA |

CODE_07E3FD:
    JSL.L CODE_FL_00E091          ;$07E3FD |
    BRA CODE_07E3FD               ;$07E401 |

CODE_07E403:
    JML.L DestroyUsedObject       ;$07E403 |

CODE_07E407:
    LDA.W Current_SubGame         ;$07E407 |
    CMP.W #$00!SUBGAME_SOUNDTEST  ;$07E40A |

CODE_87E40D:
    BCS CODE_87E40D               ;$07E40D |
    ASL A                         ;$07E40F |
    TAX                           ;$07E410 |
    JMP.W (PTR16_07E414,X)        ;$07E411 |
PTR16_07E414:
    dw $0000                      ;$07E414 |	why do these point to 0000??
    dw CODE_07E422                ;$07E416 |
    dw $0000                      ;$07E418 |
    dw $0000                      ;$07E41A |
    dw CODE_JP_07E49B             ;$07E41C |
    dw $0000                      ;$07E41E |
    dw CODE_07E52E                ;$07E420 |

CODE_07E422:
    TYX                           ;$07E422 |
    STZ.W Obj_VAR0,X              ;$07E423 |

CODE_87E426:
    JSL.L CODE_FL_07E46F          ;$07E426 |
    JSL.L CODE_FL_00E097          ;$07E42A |
    LDA.W Obj_VAR0,Y              ;$07E42E |
    CLC                           ;$07E431 |
    ADC.W #$0002                  ;$07E432 |
    STA.W Obj_VAR0,Y              ;$07E435 |
    CMP.W #$0012                  ;$07E438 |
    BCC CODE_87E426               ;$07E43B |
    JSL.L CODE_FL_00E0BB          ;$07E43D |
    TYX                           ;$07E441 |
    STZ.W Obj_VAR0,X              ;$07E442 |

CODE_87E445:
    LDA.W Obj_VAR0,Y              ;$07E445 |
    CLC                           ;$07E448 |
    ADC.W #$BF7D                  ;$07E449 |
    LDX.W #$0007                  ;$07E44C |
    LDY.W #$0010                  ;$07E44F |
    JSL.L WritePal                ;$07E452 |
    LDY.B $39                     ;$07E456 |
    JSL.L CODE_FL_00E091          ;$07E458 |
    LDA.W Obj_VAR0,Y              ;$07E45C |
    CLC                           ;$07E45F |
    ADC.W #$0020                  ;$07E460 |
    STA.W Obj_VAR0,Y              ;$07E463 |
    CMP.W #$03E0                  ;$07E466 |
    BCC CODE_87E445               ;$07E469 |
    JML.L DestroyUsedObject       ;$07E46B |

CODE_FL_07E46F:
    LDX.W Obj_VAR0,Y              ;$07E46F |
    LDA.L DATA16_07E483,X         ;$07E472 |
    STA.B $49                     ;$07E476 |
    %LoadLongToAX(CODE_FL_07E495)
    JSL.L SA1_ExecuteSNES         ;$07E47E |
    RTL                           ;$07E482 |

DATA16_07E483:
    dw $7FFF,$0000,$7CF8,$7FFF    ;$07E483 |
    dw $0000,$7CF8,$7FFF,$0000    ;$07E48B |
    dw $7CF8                      ;$07E493 |

CODE_FL_07E495:
    LDA.B $49                     ;$07E495 |
    STA.W Standard_Palette        ;$07E497 |
    RTL                           ;$07E49A |

CODE_JP_07E49B:
    JSL.L CODE_FL_00E0EB          ;$07E49B |
    LDA.W #$E4A8                  ;$07E49F |
    STA.W Obj_VAR6,Y              ;$07E4A2 |
    JMP.W CODE_JP_07E4D8          ;$07E4A5 |
    JSL.L CODE_FL_00E0C7          ;$07E4A8 |
    LDA.W #$E4B5                  ;$07E4AC |
    STA.W Obj_VAR6,Y              ;$07E4AF |
    JMP.W CODE_JP_07E4D8          ;$07E4B2 |
    LDA.W #$00A0                  ;$07E4B5 |
    JSL.L CODE_FL_00E17F          ;$07E4B8 |
    LDA.W #$E4C5                  ;$07E4BC |
    STA.W Obj_VAR6,Y              ;$07E4BF |
    JMP.W CODE_JP_07E4D8          ;$07E4C2 |

    LDA.W #$0056                  ;$07E4C5 |
    JSL.L CODE_FL_00E17F          ;$07E4C8 |
    LDA.W #$E4D5                  ;$07E4CC |
    STA.W Obj_VAR6,Y              ;$07E4CF |
    JMP.W CODE_JP_07E4D8          ;$07E4D2 |

    JMP.W CODE_JP_07E49B          ;$07E4D5 |


CODE_JP_07E4D8:
    LDA.W #$C4BD                  ;$07E4D8 |
    LDX.W #$0007                  ;$07E4DB |
    LDY.W #$0070                  ;$07E4DE |
    JSL.L WritePal                ;$07E4E1 |
    LDY.B $39                     ;$07E4E5 |
    JSL.L CODE_FL_00E0A3          ;$07E4E7 |
    LDA.W #$C59D                  ;$07E4EB |
    LDX.W #$0007                  ;$07E4EE |
    LDY.W #$0070                  ;$07E4F1 |
    JSL.L WritePal                ;$07E4F4 |
    LDY.B $39                     ;$07E4F8 |
    JSL.L CODE_FL_00E0A3          ;$07E4FA |
    LDA.W #$C67D                  ;$07E4FE |
    LDX.W #$0007                  ;$07E501 |
    LDY.W #$0070                  ;$07E504 |
    JSL.L WritePal                ;$07E507 |
    LDY.B $39                     ;$07E50B |
    JSL.L CODE_FL_00E0A3          ;$07E50D |
    LDA.W #$C75D                  ;$07E511 |
    LDX.W #$0007                  ;$07E514 |
    LDY.W #$0070                  ;$07E517 |
    JSL.L WritePal                ;$07E51A |
    LDY.B $39                     ;$07E51E |
    JSL.L CODE_FL_00E0A3          ;$07E520 |
    LDA.W Obj_VAR6,Y              ;$07E524 |
    STA.B IdentifySNES            ;$07E527 |
    JMP.W ($3700)                 ;$07E529 |
    dw $0000                      ;$07E52C |

CODE_07E52E:
    JSL.L CODE_FL_00E10F          ;$07E52E |
    LDX.W #$0007                  ;$07E532 |
    LDA.W #$C83D                  ;$07E535 |
    LDY.W #$0010                  ;$07E538 |
    JSL.L WritePal                ;$07E53B |
    LDY.B $39                     ;$07E53F |
    JSL.L CODE_FL_00E091          ;$07E541 |
    LDX.W #$0007                  ;$07E545 |
    LDA.W #$C85D                  ;$07E548 |
    LDY.W #$0010                  ;$07E54B |
    JSL.L WritePal                ;$07E54E |
    LDY.B $39                     ;$07E552 |
    JSL.L CODE_FL_00E091          ;$07E554 |
    LDX.W #$0007                  ;$07E558 |
    LDA.W #$C87D                  ;$07E55B |
    LDY.W #$0010                  ;$07E55E |
    JSL.L WritePal                ;$07E561 |
    LDY.B $39                     ;$07E565 |
    JSL.L CODE_FL_00E091          ;$07E567 |
    LDX.W #$0007                  ;$07E56B |
    LDA.W #$C89D                  ;$07E56E |
    LDY.W #$0010                  ;$07E571 |
    JSL.L WritePal                ;$07E574 |
    LDY.B $39                     ;$07E578 |
    JSL.L CODE_FL_00E091          ;$07E57A |
    LDX.W #$0007                  ;$07E57E |
    LDA.W #$C8BD                  ;$07E581 |
    LDY.W #$0010                  ;$07E584 |
    JSL.L WritePal                ;$07E587 |
    LDY.B $39                     ;$07E58B |
    JSL.L CODE_FL_00E091          ;$07E58D |
    LDX.W #$0007                  ;$07E591 |
    LDA.W #$C8DD                  ;$07E594 |
    LDY.W #$0010                  ;$07E597 |
    JSL.L WritePal                ;$07E59A |
    LDY.B $39                     ;$07E59E |
    JSL.L CODE_FL_00E091          ;$07E5A0 |
    LDX.W #$0007                  ;$07E5A4 |
    LDA.W #$C8FD                  ;$07E5A7 |
    LDY.W #$0010                  ;$07E5AA |
    JSL.L WritePal                ;$07E5AD |
    LDY.B $39                     ;$07E5B1 |
    JSL.L CODE_FL_00E091          ;$07E5B3 |
    LDX.W #$0007                  ;$07E5B7 |
    LDA.W #$C91D                  ;$07E5BA |
    LDY.W #$0010                  ;$07E5BD |
    JSL.L WritePal                ;$07E5C0 |
    LDY.B $39                     ;$07E5C4 |
    JSL.L CODE_FL_00E091          ;$07E5C6 |
    LDA.W #$0000                  ;$07E5CA |
    STA.W Obj_VAR0,Y              ;$07E5CD |

CODE_07E5D0:
    LDA.W Obj_VAR0,Y              ;$07E5D0 |
    CLC                           ;$07E5D3 |
    ADC.W #$C93D                  ;$07E5D4 |
    LDX.W #$0007                  ;$07E5D7 |
    LDY.W #$2010                  ;$07E5DA |
    JSL.L WritePal                ;$07E5DD |
    LDY.B $39                     ;$07E5E1 |
    JSL.L CODE_FL_00E091          ;$07E5E3 |
    LDA.W Obj_VAR0,Y              ;$07E5E7 |
    CLC                           ;$07E5EA |
    ADC.W #$0020                  ;$07E5EB |
    STA.W Obj_VAR0,Y              ;$07E5EE |
    CMP.W #$03E0                  ;$07E5F1 |
    BCC CODE_07E5D0               ;$07E5F4 |
    JML.L DestroyUsedObject       ;$07E5F6 |


CODE_JP_07E5FA:
    TYX                           ;$07E5FA |
    STZ.W Obj_VAR0,X              ;$07E5FB |

CODE_07E5FE:
    LDA.W Obj_VAR0,Y              ;$07E5FE |
    CLC                           ;$07E601 |
    ADC.W Obj_VAR1,Y              ;$07E602 |
    PHA                           ;$07E605 |
    LDX.W Obj_VAR2,Y              ;$07E606 |
    LDA.W Obj_VAR4,Y              ;$07E609 |
    TAY                           ;$07E60C |
    PLA                           ;$07E60D |
    JSL.L WritePal                ;$07E60E |
    LDY.B $39                     ;$07E612 |
    LDA.W Obj_VAR5,Y              ;$07E614 |
    AND.W #$00FF                  ;$07E617 |
    JSL.L CODE_FL_00E17F          ;$07E61A |
    LDA.W Obj_VAR5,Y              ;$07E61E |
    XBA                           ;$07E621 |
    AND.W #$00FF                  ;$07E622 |
    ASL A                         ;$07E625 |
    CLC                           ;$07E626 |
    ADC.W Obj_VAR0,Y              ;$07E627 |
    STA.W Obj_VAR0,Y              ;$07E62A |
    CMP.W Obj_VAR3,Y              ;$07E62D |
    BCC CODE_07E5FE               ;$07E630 |
    LDA.W Obj_VAR6,Y              ;$07E632 |
    STA.B IdentifySNES            ;$07E635 |
    JMP.W ($3700)                 ;$07E637 |


CODE_07E63A:
    LDA.W #$9549                  ;$07E63A |
    LDX.W #$00CC                  ;$07E63D |
    JSL.L CODE_FL_00E1CC          ;$07E640 |
    LDA.W #$0080                  ;$07E644 |
    JSL.L CODE_FL_00E28E          ;$07E647 |
    LDA.W #$0040                  ;$07E64B |
    JSL.L CODE_FL_00E298          ;$07E64E |
    LDA.W #$160E                  ;$07E652 |
    JSL.L CODE_FL_00E169          ;$07E655 |
    JML.L DestroyUsedObject       ;$07E659 |


CODE_07E65D:
    LDA.W #$00CC                  ;$07E65D |
    JSL.L CODE_FL_00E28E          ;$07E660 |
    LDA.W #$008C                  ;$07E664 |
    JSL.L CODE_FL_00E298          ;$07E667 |

CODE_07E66B:
    LDA.W $7B25                   ;$07E66B |
    BEQ CODE_07E69A               ;$07E66E |
    LDA.W Obj_VAR2,Y              ;$07E670 |
    BEQ CODE_07E69A               ;$07E673 |
    LDA.W $7B27                   ;$07E675 |
    BEQ CODE_07E688               ;$07E678 |
    CMP.W Obj_VAR2,Y              ;$07E67A |
    BEQ CODE_07E691               ;$07E67D |
    LDA.W #$0105                  ;$07E67F |
    JSL.L CODE_FL_00E169          ;$07E682 |
    BRA CODE_07E66B               ;$07E686 |


CODE_07E688:
    LDA.W #$0104                  ;$07E688 |
    JSL.L CODE_FL_00E169          ;$07E68B |
    BRA CODE_07E66B               ;$07E68F |

CODE_07E691:
    LDA.W #$0103                  ;$07E691 |
    JSL.L CODE_FL_00E169          ;$07E694 |
    BRA CODE_07E66B               ;$07E698 |

CODE_07E69A:
    LDA.W #$01FF                  ;$07E69A |
    JSL.L CODE_FL_00E169          ;$07E69D |
    BRA CODE_07E66B               ;$07E6A1 |

CODE_FL_07E6A3:
    LDA.W $7B27                   ;$07E6A3 |
    ASL A                         ;$07E6A6 |
    STA.B IdentifySNES            ;$07E6A7 |
    LDA.W Current_SubGame         ;$07E6A9 |
    CMP.W #$00!SUBGAME_SOUNDTEST  ;$07E6AC |

CODE_07E6AF:
    BCS CODE_07E6AF               ;$07E6AF |
    ASL A                         ;$07E6B1 |
    TAX                           ;$07E6B2 |
    JMP.W (PTR16_07E6B6,X)        ;$07E6B3 |
PTR16_07E6B6:
    dw CODE_07E6C4                ;$07E6B6 |
    dw $0000                      ;$07E6B8 |
    dw $0000                      ;$07E6BA |
    dw $0000                      ;$07E6BC |
    dw CODE_07E6DE                ;$07E6BE |
    dw $0000                      ;$07E6C0 |
    dw $0000                      ;$07E6C2 |

CODE_07E6C4:
    LDX.B IdentifySNES            ;$07E6C4 |
    PHX                           ;$07E6C6 |
    LDA.L DATA8_EFE92C,X          ;$07E6C7 |
    LDX.W #$3E39                  ;$07E6CB |
    JSL.L WriteTile               ;$07E6CE |
    PLX                           ;$07E6D2 |
    LDA.L DATA8_EFE934,X          ;$07E6D3 |
    LDX.W #$3E59                  ;$07E6D7 |
    JML.L WriteTile               ;$07E6DA |

CODE_07E6DE:
    LDX.B IdentifySNES            ;$07E6DE |
    PHX                           ;$07E6E0 |
    LDA.L UNREACH_EFE6A6,X        ;$07E6E1 |
    LDX.W #$3E5C                  ;$07E6E5 |
    JSL.L WriteTile               ;$07E6E8 |
    PLX                           ;$07E6EC |
    LDA.L UNREACH_EFE6B8,X        ;$07E6ED |
    LDX.W #$3E7C                  ;$07E6F1 |
    JML.L WriteTile               ;$07E6F4 |

CODE_FL_07E6F8:
    STA.B SNES_WaitForCommand_waitForMessage;$07E6F8 |
    STX.B $16                     ;$07E6FA |
    LDA.B IdentifySNES            ;$07E6FC |
    CLC                           ;$07E6FE |
    ADC.W #$0007                  ;$07E6FF |
    STA.B IdentifySNES            ;$07E702 |
    LDY.W #$0000                  ;$07E704 |

CODE_07E707:
    LDA.B [SNES_WaitForCommand_waitForMessage],Y;$07E707 |
    AND.W #$00FF                  ;$07E709 |
    PHY                           ;$07E70C |
    LDX.W #$000A                  ;$07E70D |
    JSL.L CODE_FL_00A5F7          ;$07E710 |
    LDA.W $32E6                   ;$07E714 |
    JSL.L CODE_FL_07E730          ;$07E717 |
    DEC.B IdentifySNES            ;$07E71B |
    LDA.W $32E4                   ;$07E71D |
    JSL.L CODE_FL_07E730          ;$07E720 |
    DEC.B IdentifySNES            ;$07E724 |
    DEC.B IdentifySNES            ;$07E726 |
    PLY                           ;$07E728 |
    INY                           ;$07E729 |
    CPY.W #$0003                  ;$07E72A |
    BNE CODE_07E707               ;$07E72D |
    RTL                           ;$07E72F |

CODE_FL_07E730:
    ASL A                         ;$07E730 |
    TAX                           ;$07E731 |
    LDA.L DATA8_EFE61A,X          ;$07E732 |
    STA.B DSP_SRCN                ;$07E736 |
    LDA.B DSP_P                   ;$07E738 |
    XBA                           ;$07E73A |
    LSR A                         ;$07E73B |
    LSR A                         ;$07E73C |
    LSR A                         ;$07E73D |
    CLC                           ;$07E73E |
    ADC.B IdentifySNES            ;$07E73F |
    CLC                           ;$07E741 |
    ADC.W #$3C00                  ;$07E742 |
    TAX                           ;$07E745 |
    LDA.B DSP_SRCN                ;$07E746 |
    JML.L WriteTile               ;$07E748 |

CODE_FN_07E74C:
    LDX.W #$0018                  ;$07E74C |
    STX.W ObjSlotMinimum          ;$07E74F |
    LDX.W #$0040                  ;$07E752 |
    STX.W ObjSlotMaximum          ;$07E755 |
    PHA                           ;$07E758 |
    LDA.W #$0014                  ;$07E759 |
    JSL.L CreateNewObject         ;$07E75C |
    TAX                           ;$07E760 |
    PLA                           ;$07E761 |
    STA.W Obj_VAR0,X              ;$07E762 |
    RTS                           ;$07E765 |

CODE_JP_07E766:
    LDA.W #$0000                  ;$07E766 |
    JSL.L CODE_FL_07E81C          ;$07E769 |
    LDA.W #$0002                  ;$07E76D |
    JSL.L CODE_FL_07E81C          ;$07E770 |
    LDA.W #$0003                  ;$07E774 |
    JSL.L CODE_FL_07E81C          ;$07E777 |
    LDA.W #$0001                  ;$07E77B |
    JSL.L CODE_FL_07E81C          ;$07E77E |
    %LoadLongToAX(DATA8_07DE0E)
    JSL.L CODE_FL_D3E412          ;$07E788 |
    %LoadLongToAX(DMA_07DCF2)
    JSL.L LoadDMATable            ;$07E792 |
    LDY.B $39                     ;$07E796 |
    STZ.W $7B2B                   ;$07E798 |
    JSL.L CODE_FL_00E091          ;$07E79B |
    %LoadLongToAX(CODE_07E809)
    JSL.L CODE_FL_00E1B7          ;$07E7A5 |
    LDA.W #$0010                  ;$07E7A9 |
    STA.W Obj_VAR8,Y              ;$07E7AC |

CODE_JP_07E7AF:
    JSL.L FadeIn_Step             ;$07E7AF |
    JSL.L CODE_FL_00E091          ;$07E7B3 |
    TYX                           ;$07E7B7 |
    DEC.W Obj_VAR8,X              ;$07E7B8 |
    BEQ CODE_07E7C0               ;$07E7BB |
    JMP.W CODE_JP_07E7AF          ;$07E7BD |


CODE_07E7C0:
    JSL.L CODE_FL_00E091          ;$07E7C0 |
    LDA.W $7B2B                   ;$07E7C4 |
    BEQ CODE_07E7C0               ;$07E7C7 |
    JMP.W CODE_JP_07D9AB          ;$07E7C9 |

    JSL.L CODE_FL_00E1BF          ;$07E7CC |
    LDA.W #$0010                  ;$07E7D0 |
    STA.W Obj_VAR8,Y              ;$07E7D3 |

CODE_JP_07E7D6:
    JSL.L FadeOut_Step            ;$07E7D6 |
    JSL.L CODE_FL_00E091          ;$07E7DA |
    TYX                           ;$07E7DE |
    DEC.W Obj_VAR8,X              ;$07E7DF |
    BEQ CODE_07E7E7               ;$07E7E2 |
    JMP.W CODE_JP_07E7D6          ;$07E7E4 |


CODE_07E7E7:
    JSL.L UpdateVramSprSize       ;$07E7E7 |
    SEP #$20                      ;$07E7EB |
    LDA.B #$13                    ;$07E7ED |
    STA.W MainScreenDesignation   ;$07E7EF |
    STZ.W SubScreenDesignation    ;$07E7F2 |
    STZ.W ColorAddition_Settings  ;$07E7F5 |
    STZ.W CGADSUB_Settings        ;$07E7F8 |
    REP #$20                      ;$07E7FB |
    STZ.W CameraY_TileMirror      ;$07E7FD |
    LDA.W #$0100                  ;$07E800 |
    STA.W $303F                   ;$07E803 |
    JMP.W CODE_JP_07D94D          ;$07E806 |

CODE_07E809:
    LDA.W P1_Frame                ;$07E809 |
    AND.W #$D0C0                  ;$07E80C |
    BEQ CODE_07E81B               ;$07E80F |
    LDA.W #$E7CC                  ;$07E811 |
    STA.W Obj_ScriptProgramCounter,Y;$07E814 |
    TYX                           ;$07E817 |
    STZ.W Obj_ScriptSleepTimer,X  ;$07E818 |

CODE_07E81B:
    RTL                           ;$07E81B |


CODE_FL_07E81C:
    STA.W ObjVar1_Temp            ;$07E81C |
    LDA.W #$0006                  ;$07E81F |
    STA.W ObjSlotMinimum          ;$07E822 |
    LDA.W #$0040                  ;$07E825 |
    STA.W ObjSlotMaximum          ;$07E828 |
    BRA CODE_07E83C               ;$07E82B |

    STA.W ObjVar1_Temp            ;$07E82D |
    LDA.W #$0002                  ;$07E830 |
    STA.W ObjSlotMinimum          ;$07E833 |
    LDA.W #$0004                  ;$07E836 |
    STA.W ObjSlotMaximum          ;$07E839 |

CODE_07E83C:
    STY.W ObjVar2_Temp            ;$07E83C |
    STX.W ObjVar3_Temp            ;$07E83F |
    LDA.W #$0007                  ;$07E842 |
    STA.W ObjVar0_Temp            ;$07E845 |
    LDA.W Obj_YPositionMirror,Y   ;$07E848 |
    PHA                           ;$07E84B |
    LDX.W Obj_XPositionMirror,Y   ;$07E84C |
    PLY                           ;$07E84F |
    LDA.W #$0014                  ;$07E850 |
    JML.L CreateNewObject         ;$07E853 |


CODE_07E857:
    LDA.W #CODE_FL_00AB78         ;$07E857 |
    STA.W Obj_DrawCallback,Y      ;$07E85A |
    LDA.W #CODE_FL_00A6FB         ;$07E85D |
    STA.W Obj_TickLoopCallback,Y  ;$07E860 |
    LDA.W #$93A1                  ;$07E863 |
    LDX.W #$00CC                  ;$07E866 |
    JSL.L CODE_FL_00E1CC          ;$07E869 |
    LDA.W #$0020                  ;$07E86D |
    STA.W $64B6,Y                 ;$07E870 |
    LDA.W Obj_VAR1,Y              ;$07E873 |
    AND.W #$00FF                  ;$07E876 |
    CMP.W #$0004                  ;$07E879 |

CODE_07E87C:
    BCS CODE_07E87C               ;$07E87C |
    ASL A                         ;$07E87E |
    TAX                           ;$07E87F |
    JMP.W (CODE_07E883,X)         ;$07E880 |


CODE_07E883:
    PHB                           ;$07E883 |
    INX                           ;$07E884 |
    REP #$E8                      ;$07E885 |
    ORA.L DATA8_EA15E9            ;$07E887 |
    LDA.W #$AB72                  ;$07E88B |
    STA.W Obj_DrawCallback,Y      ;$07E88E |
    LDA.W #$0080                  ;$07E891 |
    JSL.L CODE_FL_00E28E          ;$07E894 |
    LDA.W #$00C2                  ;$07E898 |
    JSL.L CODE_FL_00E298          ;$07E89B |
    LDA.W #$0012                  ;$07E89F |
    STA.W Obj_Pose,Y              ;$07E8A2 |
    LDA.W #$00BF                  ;$07E8A5 |
    JSL.L CODE_FL_00E17F          ;$07E8A8 |
    LDA.W #$FE80                  ;$07E8AC |
    LDX.W #$0040                  ;$07E8AF |
    JSL.L CODE_FL_00E55E          ;$07E8B2 |
    LDA.W #$0000                  ;$07E8B6 |
    STA.W $6BE8,Y                 ;$07E8B9 |

CODE_07E8BC:
    JSL.L CODE_FL_00E091          ;$07E8BC |	Softlock?
    BRA CODE_07E8BC               ;$07E8C0 |

    LDA.W #$AB90                  ;$07E8C2 |
    STA.W Obj_DrawCallback,Y      ;$07E8C5 |
    LDA.W #$A8BA                  ;$07E8C8 |
    STA.W Obj_TickLoopCallback,Y  ;$07E8CB |
    LDA.W #$FFFF                  ;$07E8CE |
    LDX.W #$00FF                  ;$07E8D1 |
    JSL.L CODE_FL_00E1CC          ;$07E8D4 |
    LDA.W #$FFFF                  ;$07E8D8 |
    STA.W Obj_Pose,Y              ;$07E8DB |
    STZ.W $303F                   ;$07E8DE |
    LDA.W #$0001                  ;$07E8E1 |
    STA.W $7344                   ;$07E8E4 |
    STZ.W $7354                   ;$07E8E7 |
    LDA.W #$0080                  ;$07E8EA |
    JSL.L CODE_FL_00E17F          ;$07E8ED |
    LDA.W #$0080                  ;$07E8F1 |
    JSL.L CODE_FL_00E17F          ;$07E8F4 |
    STZ.W $7344                   ;$07E8F8 |
    STZ.W $7354                   ;$07E8FB |
    LDA.W #$0078                  ;$07E8FE |
    JSL.L CODE_FL_00E17F          ;$07E901 |
    LDA.W #$FFFF                  ;$07E905 |
    STA.W $7B2B                   ;$07E908 |
    JML.L DestroyUsedObject       ;$07E90B |

    LDA.W #$AB90                  ;$07E90F |
    STA.W Obj_DrawCallback,Y      ;$07E912 |
    LDA.W #$A6EC                  ;$07E915 |
    STA.W Obj_TickLoopCallback,Y   ;$07E918 |
    LDA.W #$FFFF                  ;$07E91B |
    LDX.W #$00FF                  ;$07E91E |
    JSL.L CODE_FL_00E1CC          ;$07E921 |
    LDA.W #$FFFF                  ;$07E925 |
    STA.W Obj_Pose,Y              ;$07E928 |
    %LoadLongToAX(Pal_07E9F5)
    LDY.W #$010B                  ;$07E931 |
    JSL.L WritePal                ;$07E934 |
    %LoadLongToAX(Pal_07E9F5)
    LDY.W #$0C04                  ;$07E93E |
    JSL.L WritePal                ;$07E941 |
    LDY.B $39                     ;$07E945 |
    SEP #$20                      ;$07E947 |
    LDA.B #$12                    ;$07E949 |
    STA.W MainScreenDesignation   ;$07E94B |
    LDA.B #$01                    ;$07E94E |
    STA.W SubScreenDesignation    ;$07E950 |
    LDA.B #$02                    ;$07E953 |
    STA.W ColorAddition_Settings  ;$07E955 |
    LDA.B #$12                    ;$07E958 |
    STA.W CGADSUB_Settings        ;$07E95A |
    REP #$20                      ;$07E95D |
    LDA.W #$0040                  ;$07E95F |
    JSL.L CODE_FL_00E17F          ;$07E962 |
    LDA.W #$D2C4                  ;$07E966 |
    STA.W Obj_VAR1,Y              ;$07E969 |
    LDA.W #$00C9                  ;$07E96C |
    STA.W Obj_VAR2,Y              ;$07E96F |
    LDA.W #$0320                  ;$07E972 |
    STA.W Obj_VAR3,Y              ;$07E975 |
    LDA.W #$010B                  ;$07E978 |
    STA.W Obj_VAR4,Y              ;$07E97B |
    LDA.W #$0C03                  ;$07E97E |
    STA.W Obj_VAR5,Y              ;$07E981 |
    LDA.W #$E98D                  ;$07E984 |
    STA.W Obj_VAR6,Y              ;$07E987 |
    JMP.W CODE_JP_07E5FA          ;$07E98A |

    LDA.W #$D684                  ;$07E98D |
    STA.W Obj_VAR1,Y              ;$07E990 |
    LDA.W #$00C9                  ;$07E993 |
    STA.W Obj_VAR2,Y              ;$07E996 |
    LDA.W #$0190                  ;$07E999 |
    STA.W Obj_VAR3,Y              ;$07E99C |
    LDA.W #$010B                  ;$07E99F |
    STA.W Obj_VAR4,Y              ;$07E9A2 |
    LDA.W #$0C03                  ;$07E9A5 |
    STA.W Obj_VAR5,Y              ;$07E9A8 |
    LDA.W #$E9B4                  ;$07E9AB |
    STA.W Obj_VAR6,Y              ;$07E9AE |
    JMP.W CODE_JP_07E5FA          ;$07E9B1 |

    JSL.L CODE_FL_00E0EB          ;$07E9B4 |
    LDA.W #$DE04                  ;$07E9B8 |
    STA.W Obj_VAR1,Y              ;$07E9BB |
    LDA.W #$00C9                  ;$07E9BE |
    STA.W Obj_VAR2,Y              ;$07E9C1 |
    LDA.W #$012C                  ;$07E9C4 |
    STA.W Obj_VAR3,Y              ;$07E9C7 |
    LDA.W #$0C04                  ;$07E9CA |
    STA.W Obj_VAR4,Y              ;$07E9CD |
    LDA.W #$0503                  ;$07E9D0 |
    STA.W Obj_VAR5,Y              ;$07E9D3 |
    LDA.W #$E9DF                  ;$07E9D6 |
    STA.W Obj_VAR6,Y              ;$07E9D9 |
    JMP.W CODE_JP_07E5FA          ;$07E9DC |

    SEP #$20                      ;$07E9DF |
    LDA.B #$13                    ;$07E9E1 |
    STA.W MainScreenDesignation   ;$07E9E3 |
    STZ.W SubScreenDesignation    ;$07E9E6 |
    STZ.W ColorAddition_Settings  ;$07E9E9 |
    STZ.W CGADSUB_Settings        ;$07E9EC |
    REP #$20                      ;$07E9EF |
    JML.L DestroyUsedObject       ;$07E9F1 |

Pal_07E9F5:
    db $00,$00,$00,$00,$00,$00,$00,$00;$07E9F5 |
    db $00,$00,$00,$00,$00,$00,$00,$00;$07E9FD |
    db $00,$00,$00,$00,$00,$00,$00,$00;$07EA05 |
    db $00,$00,$00,$00,$00,$00,$00,$00;$07EA0D |

    LDA.W #CODE_FL_00AB90         ;$07EA15 |
    STA.W Obj_DrawCallback,Y      ;$07EA18 |
    LDA.W #$A6EC                  ;$07EA1B |
    STA.W Obj_TickLoopCallback,Y  ;$07EA1E |
    LDA.W #$FFFF                  ;$07EA21 |
    LDX.W #$00FF                  ;$07EA24 |
    JSL.L CODE_FL_00E1CC          ;$07EA27 |
    LDA.W #$FFFF                  ;$07EA2B |
    STA.W Obj_Pose,Y              ;$07EA2E |
    %LoadLongToAX(Pal_07E9F5)
    LDY.W #$1010                  ;$07EA37 |
    JSL.L WritePal                ;$07EA3A |
    LDA.W #$0040                  ;$07EA3E |
    JSL.L CODE_FL_00E17F          ;$07EA41 |
    LDA.W #$D864                  ;$07EA45 |
    STA.W Obj_VAR1,Y              ;$07EA48 |
    LDA.W #$00C9                  ;$07EA4B |
    STA.W Obj_VAR2,Y              ;$07EA4E |
    LDA.W #$0320                  ;$07EA51 |
    STA.W Obj_VAR3,Y              ;$07EA54 |
    LDA.W #$110B                  ;$07EA57 |
    STA.W Obj_VAR4,Y              ;$07EA5A |
    LDA.W #$0C03                  ;$07EA5D |
    STA.W Obj_VAR5,Y              ;$07EA60 |
    LDA.W #CODE_07EA6C            ;$07EA63 |
    STA.W Obj_VAR6,Y              ;$07EA66 |
    JMP.W CODE_JP_07E5FA          ;$07EA69 |

CODE_07EA6C:
    LDA.W #$DC24                  ;$07EA6C |
    STA.W Obj_VAR1,Y              ;$07EA6F |
    LDA.W #$00C9                  ;$07EA72 |
    STA.W Obj_VAR2,Y              ;$07EA75 |
    LDA.W #$0190                  ;$07EA78 |
    STA.W Obj_VAR3,Y              ;$07EA7B |
    LDA.W #$110B                  ;$07EA7E |
    STA.W Obj_VAR4,Y              ;$07EA81 |
    LDA.W #$0C03                  ;$07EA84 |
    STA.W Obj_VAR5,Y              ;$07EA87 |
    LDA.W #CODE_07EA93            ;$07EA8A |
    STA.W Obj_VAR6,Y              ;$07EA8D |
    JMP.W CODE_JP_07E5FA          ;$07EA90 |

CODE_07EA93:
    JML.L DestroyUsedObject       ;$07EA93 |


CODE_JP_07EA97:
    %LoadLongToAX(DATA_07EBE4)
    JSL.L CODE_FL_D3E412          ;$07EA9D |
    %LoadLongToAX(DMA_07EBEB)
    JSL.L LoadDMATable            ;$07EAA7 |
    LDY.B $39                     ;$07EAAB |
    JSL.L CODE_FL_07EC1C          ;$07EAAD |
    %LoadLongToAX(CODE_07EBE0)
    JSL.L SA1_ExecuteSNES         ;$07EAB7 |
    SEP #$20                      ;$07EABB |
    LDA.B #$12                    ;$07EABD |
    STA.W MainScreenDesignation   ;$07EABF |
    LDA.B #$01                    ;$07EAC2 |
    STA.W SubScreenDesignation    ;$07EAC4 |
    LDA.B #$02                    ;$07EAC7 |
    STA.W ColorAddition_Settings  ;$07EAC9 |
    LDA.B #$43                    ;$07EACC |
    STA.W CGADSUB_Settings        ;$07EACE |
    REP #$20                      ;$07EAD1 |
    LDA.W #$0000                  ;$07EAD3 |
    JSL.L CODE_FL_07EC90          ;$07EAD6 |
    LDA.W #$0005                  ;$07EADA |
    JSL.L CODE_FL_07EC7F          ;$07EADD |
    LDA.W #$0012                  ;$07EAE1 |
    JSL.L CODE_FL_07EC7F          ;$07EAE4 |
    LDA.W #$0001                  ;$07EAE8 |
    JSL.L CODE_FL_07EC7F          ;$07EAEB |
    LDA.W #$0004                  ;$07EAEF |
    JSL.L CODE_FL_07EC7F          ;$07EAF2 |
    LDA.W #$0002                  ;$07EAF6 |
    LDX.W #$0000                  ;$07EAF9 |
    JSL.L CODE_FL_07EC7F          ;$07EAFC |
    LDA.W #$0002                  ;$07EB00 |
    LDX.W #$0002                  ;$07EB03 |
    JSL.L CODE_FL_07EC7F          ;$07EB06 |
    LDA.W #$0003                  ;$07EB0A |
    LDX.W #$0000                  ;$07EB0D |
    JSL.L CODE_FL_07EC7F          ;$07EB10 |
    LDA.W #$0003                  ;$07EB14 |
    LDX.W #$0002                  ;$07EB17 |
    JSL.L CODE_FL_07EC7F          ;$07EB1A |
    LDA.W #$0003                  ;$07EB1E |
    LDX.W #$0004                  ;$07EB21 |
    JSL.L CODE_FL_07EC7F          ;$07EB24 |
    LDA.W #$000C                  ;$07EB28 |
    JSL.L CODE_FL_07EC7F          ;$07EB2B |
    LDA.W #$000D                  ;$07EB2F |
    LDX.W #$0000                  ;$07EB32 |
    JSL.L CODE_FL_07EC7F          ;$07EB35 |
    LDA.W #$000D                  ;$07EB39 |
    LDX.W #$0002                  ;$07EB3C |
    JSL.L CODE_FL_07EC7F          ;$07EB3F |
    LDA.W #$000E                  ;$07EB43 |
    JSL.L CODE_FL_07EC7F          ;$07EB46 |
    LDA.W #$000F                  ;$07EB4A |
    JSL.L CODE_FL_07EC7F          ;$07EB4D |
    LDA.W #$0010                  ;$07EB51 |
    JSL.L CODE_FL_07EC7F          ;$07EB54 |
    LDA.W #$0011                  ;$07EB58 |
    JSL.L CODE_FL_07EC7F          ;$07EB5B |
    STZ.W $7B2B                   ;$07EB5F |
    %LoadLongToAX(CODE_07EBCD)
    JSL.L CODE_FL_00E1B7          ;$07EB68 |
    LDA.W #$0010                  ;$07EB6C |
    STA.W Obj_VAR8,Y              ;$07EB6F |

CODE_JP_07EB72:
    JSL.L FadeIn_Step             ;$07EB72 |
    JSL.L CODE_FL_00E091          ;$07EB76 |
    TYX                           ;$07EB7A |
    DEC.W Obj_VAR8,X              ;$07EB7B |
    BEQ CODE_07EB83               ;$07EB7E |
    JMP.W CODE_JP_07EB72          ;$07EB80 |

CODE_07EB83:
    JSL.L CODE_FL_00E091          ;$07EB83 |
    LDA.W $7B2B                   ;$07EB87 |
    BEQ CODE_07EB83               ;$07EB8A |
    JSL.L CODE_FL_07DB8D          ;$07EB8C |
    JMP.W CODE_JP_07DB53          ;$07EB90 |
    JSL.L CODE_FL_00E1BF          ;$07EB93 |
    LDA.W #$0010                  ;$07EB97 |
    STA.W Obj_VAR8,Y              ;$07EB9A |

CODE_JP_07EB9D:
    JSL.L FadeOut_Step            ;$07EB9D |
    JSL.L CODE_FL_00E091          ;$07EBA1 |
    TYX                           ;$07EBA5 |
    DEC.W Obj_VAR8,X              ;$07EBA6 |
    BEQ CODE_07EBAE               ;$07EBA9 |
    JMP.W CODE_JP_07EB9D          ;$07EBAB |

CODE_07EBAE:
    JSL.L UpdateVramSprSize       ;$07EBAE |
    SEP #$20                      ;$07EBB2 |
    LDA.B #$13                    ;$07EBB4 |
    STA.W MainScreenDesignation   ;$07EBB6 |
    STZ.W SubScreenDesignation    ;$07EBB9 |
    STZ.W ColorAddition_Settings  ;$07EBBC |
    STZ.W CGADSUB_Settings        ;$07EBBF |
    REP #$20                      ;$07EBC2 |
    STZ.W CameraY_TileMirror      ;$07EBC4 |
    STZ.W $303F                   ;$07EBC7 |
    JMP.W CODE_JP_07DAE7          ;$07EBCA |

CODE_07EBCD:
    LDA.W P1_Frame                ;$07EBCD |
    AND.W #$D0C0                  ;$07EBD0 |
    BEQ CODE_07EBDF               ;$07EBD3 |
    LDA.W #$EB93                  ;$07EBD5 |
    STA.W Obj_ScriptProgramCounter,Y;$07EBD8 |
    TYX                           ;$07EBDB |
    STZ.W Obj_ScriptSleepTimer,X  ;$07EBDC |

CODE_07EBDF:
    RTL                           ;$07EBDF |
CODE_07EBE0:
    STZ.W Standard_Palette        ;$07EBE0 |
    RTL                           ;$07EBE3 |

DATA_07EBE4:
    dl $EB2125
    dw $8080
    db $FF,$FF

DMA_07EBEB:
    db $83 : dw $1A80 : dl $E04215 : dw $6600
    db $89 : dw $0800 : dl $EA2DBB : dw $4800
    db $0F : dw $0800 : dl $7E2800 : dw $4800
    db $89 : dw $0800 : dl $E80410 : dw $5800
    db $0F : dw $0800 : dl $7E2800 : dw $5800
    db $83 : dw $2560 : dl $DBD183 : dw $1000
    db $FF

CODE_FL_07EC1C:
    %LoadLongToAX($EFE712, 2)
    LDY.W #$2000                  ;$07EC22 |
    JSL.L CODE_FL_07EC6D          ;$07EC25 |
    %LoadLongToAX($E8BC69, 2)
    LDY.W #$2800                  ;$07EC2F |
    JSL.L CODE_FL_07EC6D          ;$07EC32 |
    %LoadLongToAX($E87FD6, 2)
    LDY.W #$3000                  ;$07EC3C |
    JSL.L CODE_FL_07EC6D          ;$07EC3F |
    %LoadLongToAX($EBC619, 2)
    LDY.W #$3800                  ;$07EC49 |
    JSL.L CODE_FL_07EC6D          ;$07EC4C |
    %LoadLongToAX($E923C0, 2)
    LDY.W #$4000                  ;$07EC56 |
    JSL.L CODE_FL_07EC6D          ;$07EC59 |
    %LoadLongToAX($E8BC69, 2)
    LDY.W #$4800                  ;$07EC63 |
    JSL.L CODE_FL_07EC6D          ;$07EC66 |
    LDY.B $39                     ;$07EC6A |
    RTL                           ;$07EC6C |

CODE_FL_07EC6D:
    PHB                           ;$07EC6D |
    PHA                           ;$07EC6E |
    LDA.W #$007E                  ;$07EC6F |
    SEP #$20                      ;$07EC72 |
    PHA                           ;$07EC74 |
    PLB                           ;$07EC75 |
    REP #$20                      ;$07EC76 |
    PLA                           ;$07EC78 |
    JSL.L DecompressData          ;$07EC79 |
    PLB                           ;$07EC7D |
    RTL                           ;$07EC7E |

CODE_FL_07EC7F:
    STA.W ObjVar1_Temp            ;$07EC7F |
    LDA.W #$0006                  ;$07EC82 |
    STA.W ObjSlotMinimum          ;$07EC85 |
    LDA.W #$0040                  ;$07EC88 |
    STA.W ObjSlotMaximum          ;$07EC8B |
    BRA CODE_07EC9F               ;$07EC8E |

CODE_FL_07EC90:
    STA.W ObjVar1_Temp            ;$07EC90 |
    LDA.W #$0002                  ;$07EC93 |
    STA.W ObjSlotMinimum          ;$07EC96 |
    LDA.W #$0004                  ;$07EC99 |
    STA.W ObjSlotMaximum          ;$07EC9C |

CODE_07EC9F:
    STY.W ObjVar2_Temp            ;$07EC9F |
    STX.W ObjVar3_Temp            ;$07ECA2 |
    LDA.W #$0008                  ;$07ECA5 |
    STA.W ObjVar0_Temp            ;$07ECA8 |
    LDA.W Obj_YPositionMirror,Y   ;$07ECAB |
    PHA                           ;$07ECAE |
    LDX.W Obj_XPositionMirror,Y   ;$07ECAF |
    PLY                           ;$07ECB2 |
    LDA.W #$0014                  ;$07ECB3 |
    JML.L CreateNewObject         ;$07ECB6 |

CODE_07ECBA:
    LDA.W #CODE_FL_00AB78         ;$07ECBA |
    STA.W Obj_DrawCallback,Y      ;$07ECBD |
    LDA.W #CODE_FL_00A6FB         ;$07ECC0 |
    STA.W Obj_TickLoopCallback,Y  ;$07ECC3 |
    LDA.W #$9457                  ;$07ECC6 |
    LDX.W #$00CC                  ;$07ECC9 |
    JSL.L CODE_FL_00E1CC          ;$07ECCC |
    LDA.W #$0020                  ;$07ECD0 |
    STA.W $64B6,Y                 ;$07ECD3 |
    LDA.W Obj_VAR1,Y              ;$07ECD6 |
    AND.W #$00FF                  ;$07ECD9 |
    CMP.W #$0013                  ;$07ECDC |

CODE_07ECDF:
    BCS CODE_07ECDF               ;$07ECDF |
    ASL A                         ;$07ECE1 |
    TAX                           ;$07ECE2 |
    JMP.W (PTR16_07ECE6,X)        ;$07ECE3 |
PTR16_07ECE6:
    dw CODE_07EED4                ;$07ECE6 |
    dw CODE_07ED0C                ;$07ECE8 |
    dw CODE_07ED4E                ;$07ECEA |
    dw CODE_07ED9E                ;$07ECEC |
    dw CODE_07EE36                ;$07ECEE |
    dw CODE_07F379                ;$07ECF0 |
    dw CODE_07F3AB                ;$07ECF2 |
    dw CODE_07F0F7                ;$07ECF4 |
    dw CODE_07F207                ;$07ECF6 |
    dw CODE_07F24F                ;$07ECF8 |
    dw CODE_07F276                ;$07ECFA |
    dw CODE_07F2EB                ;$07ECFC |
    dw CODE_07F5F0                ;$07ECFE |
    dw CODE_07F67B                ;$07ED00 |
    dw CODE_07F713                ;$07ED02 |
    dw CODE_07F74C                ;$07ED04 |
    dw CODE_07F6C7                ;$07ED06 |
    dw CODE_07F823                ;$07ED08 |
    dw CODE_07F89A                ;$07ED0A |

CODE_07ED0C:
    LDA.W #$0080                  ;$07ED0C |
    JSL.L CODE_FL_00E28E          ;$07ED0F |
    LDA.W #$0B20                  ;$07ED13 |
    JSL.L CODE_FL_00E298          ;$07ED16 |

CODE_JP_07ED1A:
    LDA.W #$6313                  ;$07ED1A |
    JSL.L CODE_FL_00E169          ;$07ED1D |
    LDA.W #$0114                  ;$07ED21 |
    JSL.L CODE_FL_00E169          ;$07ED24 |
    LDA.W #$0115                  ;$07ED28 |
    JSL.L CODE_FL_00E169          ;$07ED2B |
    LDA.W #$0116                  ;$07ED2F |
    JSL.L CODE_FL_00E169          ;$07ED32 |
    LDA.W #$0117                  ;$07ED36 |
    JSL.L CODE_FL_00E169          ;$07ED39 |
    LDA.W #$0218                  ;$07ED3D |
    JSL.L CODE_FL_00E169          ;$07ED40 |
    LDA.W #$0119                  ;$07ED44 |
    JSL.L CODE_FL_00E169          ;$07ED47 |
    JMP.W CODE_JP_07ED1A          ;$07ED4B |

CODE_07ED4E:
    LDX.W Obj_VAR3,Y              ;$07ED4E |
    LDA.L DATA16_07ED66,X         ;$07ED51 |
    STA.W Obj_XPosition,Y         ;$07ED55 |
    LDA.L DATA16_07ED6A,X         ;$07ED58 |
    STA.W Obj_YPosition,Y         ;$07ED5C |
    JMP.W (PTR16_07ED62,X)        ;$07ED5F |
PTR16_07ED62:
    dw CODE_JP_07ED7C             ;$07ED62 |
    dw CODE_JP_07ED8D             ;$07ED64 |

DATA16_07ED66:
    dw $0081,$0080                ;$07ED66 |

DATA16_07ED6A:
    dw $0B4D,$0B30,$81A9,$2200    ;$07ED6A |
    dw $E28E,$A900,$0B45,$9822    ;$07ED72 |
    dw $00E2                      ;$07ED7A |

CODE_JP_07ED7C:
    LDA.W #$010F                  ;$07ED7C |
    JSL.L CODE_FL_00E169          ;$07ED7F |
    LDA.W #$0110                  ;$07ED83 |
    JSL.L CODE_FL_00E169          ;$07ED86 |
    JMP.W CODE_JP_07ED7C          ;$07ED8A |

CODE_JP_07ED8D:
    LDA.W #$0111                  ;$07ED8D |
    JSL.L CODE_FL_00E169          ;$07ED90 |
    LDA.W #$0112                  ;$07ED94 |
    JSL.L CODE_FL_00E169          ;$07ED97 |
    JMP.W CODE_JP_07ED8D          ;$07ED9B |

CODE_07ED9E:
    LDX.W Obj_VAR3,Y              ;$07ED9E |
    LDA.L PTR16_07EDB8,X          ;$07EDA1 |
    STA.W Obj_XPosition,Y         ;$07EDA5 |
    LDA.L PTR16_07EDBE,X          ;$07EDA8 |
    STA.W Obj_YPosition,Y         ;$07EDAC |
    JMP.W (PTR16_07EDB2,X)        ;$07EDAF |
PTR16_07EDB2:
    dw CODE_JP_07EDC4             ;$07EDB2 |
    dw CODE_JP_07EDDC             ;$07EDB4 |
    dw CODE_JP_07EDFB             ;$07EDB6 |
PTR16_07EDB8:
    dw $0080                      ;$07EDB8 |
    dw $0080                      ;$07EDBA |
    dw $0080                      ;$07EDBC |
PTR16_07EDBE:
    dw $0B6F                      ;$07EDBE |
    dw $0B3B                      ;$07EDC0 |
    dw $0B7C                      ;$07EDC2 |

CODE_JP_07EDC4:
    LDA.W #$0C04                  ;$07EDC4 |
    JSL.L CODE_FL_00E169          ;$07EDC7 |
    LDA.W #$0C05                  ;$07EDCB |
    JSL.L CODE_FL_00E169          ;$07EDCE |
    LDA.W #$0C06                  ;$07EDD2 |
    JSL.L CODE_FL_00E169          ;$07EDD5 |
    JMP.W CODE_JP_07EDC4          ;$07EDD9 |

CODE_JP_07EDDC:
    LDA.W #$0C00                  ;$07EDDC |
    JSL.L CODE_FL_00E169          ;$07EDDF |
    LDA.W #$0C01                  ;$07EDE3 |
    JSL.L CODE_FL_00E169          ;$07EDE6 |
    LDA.W #$0C02                  ;$07EDEA |
    JSL.L CODE_FL_00E169          ;$07EDED |
    LDA.W #$0203                  ;$07EDF1 |
    JSL.L CODE_FL_00E169          ;$07EDF4 |
    JMP.W CODE_JP_07EDDC          ;$07EDF8 |

CODE_JP_07EDFB:
    LDA.W #$0C07                  ;$07EDFB |
    JSL.L CODE_FL_00E169          ;$07EDFE |
    LDA.W #$0C08                  ;$07EE02 |
    JSL.L CODE_FL_00E169          ;$07EE05 |
    LDA.W #$0C09                  ;$07EE09 |
    JSL.L CODE_FL_00E169          ;$07EE0C |
    LDA.W #$0C0A                  ;$07EE10 |
    JSL.L CODE_FL_00E169          ;$07EE13 |
    LDA.W #$0C0B                  ;$07EE17 |
    JSL.L CODE_FL_00E169          ;$07EE1A |
    LDA.W #$0C0C                  ;$07EE1E |
    JSL.L CODE_FL_00E169          ;$07EE21 |
    LDA.W #$0C0D                  ;$07EE25 |
    JSL.L CODE_FL_00E169          ;$07EE28 |
    LDA.W #$0C0E                  ;$07EE2C |
    JSL.L CODE_FL_00E169          ;$07EE2F |
    JMP.W CODE_JP_07EDFB          ;$07EE33 |

CODE_07EE36:
    LDA.W #$9AEA                  ;$07EE36 |
    LDX.W #$00C5                  ;$07EE39 |
    JSL.L CODE_FL_00E1CC          ;$07EE3C |
    LDA.W #$0022                  ;$07EE40 |
    STA.W $64B6,Y                 ;$07EE43 |
    LDA.W #$0080                  ;$07EE46 |
    JSL.L CODE_FL_00E28E          ;$07EE49 |
    LDA.W #$0B20                  ;$07EE4D |
    JSL.L CODE_FL_00E298          ;$07EE50 |
    LDA.W #$0060                  ;$07EE54 |
    STA.W $6BE8,Y                 ;$07EE57 |
    LDA.W #$3CFF                  ;$07EE5A |
    JSL.L CODE_FL_00E169          ;$07EE5D |
    LDA.W #$3C00                  ;$07EE61 |
    JSL.L CODE_FL_00E169          ;$07EE64 |
    LDA.W #$0003                  ;$07EE68 |
    STA.W Obj_VAR8,Y              ;$07EE6B |

CODE_JP_07EE6E:
    LDA.W #$0802                  ;$07EE6E |
    JSL.L CODE_FL_00E169          ;$07EE71 |
    LDA.W #$0804                  ;$07EE75 |
    JSL.L CODE_FL_00E169          ;$07EE78 |
    LDA.W #$0803                  ;$07EE7C |
    JSL.L CODE_FL_00E169          ;$07EE7F |
    LDA.W #$0805                  ;$07EE83 |
    JSL.L CODE_FL_00E169          ;$07EE86 |
    TYX                           ;$07EE8A |
    DEC.W Obj_VAR8,X              ;$07EE8B |
    BEQ CODE_07EE93               ;$07EE8E |
    JMP.W CODE_JP_07EE6E          ;$07EE90 |

CODE_07EE93:
    JSL.L CODE_FL_00E465          ;$07EE93 |
    LDA.W #$0003                  ;$07EE97 |
    STA.W Obj_VAR8,Y              ;$07EE9A |

CODE_JP_07EE9D:
    LDA.W #$0806                  ;$07EE9D |
    JSL.L CODE_FL_00E169          ;$07EEA0 |
    LDA.W #$0808                  ;$07EEA4 |
    JSL.L CODE_FL_00E169          ;$07EEA7 |
    LDA.W #$0807                  ;$07EEAB |
    JSL.L CODE_FL_00E169          ;$07EEAE |
    LDA.W #$0809                  ;$07EEB2 |
    JSL.L CODE_FL_00E169          ;$07EEB5 |
    TYX                           ;$07EEB9 |
    DEC.W Obj_VAR8,X              ;$07EEBA |
    BEQ CODE_07EEC2               ;$07EEBD |
    JMP.W CODE_JP_07EE9D          ;$07EEBF |

CODE_07EEC2:
    LDA.W #$0806                  ;$07EEC2 |
    JSL.L CODE_FL_00E169          ;$07EEC5 |
    LDA.W #$0808                  ;$07EEC9 |
    JSL.L CODE_FL_00E169          ;$07EECC |
    JML.L DestroyUsedObject       ;$07EED0 |

CODE_07EED4:
    LDA.W #$AB72                  ;$07EED4 |
    STA.W Obj_DrawCallback,Y      ;$07EED7 |
    LDA.W #$0030                  ;$07EEDA |
    STA.W $64B6,Y                 ;$07EEDD |
    LDA.W #$00A0                  ;$07EEE0 |
    JSL.L CODE_FL_00E28E          ;$07EEE3 |
    LDA.W #$0090                  ;$07EEE7 |
    JSL.L CODE_FL_00E298          ;$07EEEA |
    LDA.W #$FF1A                  ;$07EEEE |
    JSL.L CODE_FL_00E169          ;$07EEF1 |
    LDA.W #$AFF5                  ;$07EEF5 |
    STA.W Obj_DrawCallback,Y      ;$07EEF8 |
    LDA.W #$96FC                  ;$07EEFB |
    LDX.W #$00C7                  ;$07EEFE |
    JSL.L CODE_FL_00E1CC          ;$07EF01 |
    LDA.W #$001D                  ;$07EF05 |
    LDX.W #$0004                  ;$07EF08 |
    JSL.L CODE_FL_00E193          ;$07EF0B |
    LDA.W #$FF80                  ;$07EF0F |
    STA.W $6B6E,Y                 ;$07EF12 |
    LDA.W #$FB00                  ;$07EF15 |
    LDX.W #$0024                  ;$07EF18 |
    LDY.W #$0041                  ;$07EF1B |
    JSL.L CODE_FL_00E634          ;$07EF1E |
    LDA.W #$0051                  ;$07EF22 |
    JSL.L PlaySFX                 ;$07EF25 |
    LDY.B $39                     ;$07EF29 |
    LDA.W #$0007                  ;$07EF2B |
    LDX.W #$0000                  ;$07EF2E |
    JSL.L CODE_FL_07EC7F          ;$07EF31 |
    LDA.W #$0007                  ;$07EF35 |
    LDX.W #$0002                  ;$07EF38 |
    JSL.L CODE_FL_07EC7F          ;$07EF3B |
    LDA.W #$0007                  ;$07EF3F |
    LDX.W #$0004                  ;$07EF42 |
    JSL.L CODE_FL_07EC7F          ;$07EF45 |
    LDA.W #$0007                  ;$07EF49 |
    LDX.W #$0006                  ;$07EF4C |
    JSL.L CODE_FL_07EC7F          ;$07EF4F |
    LDA.W #$FE00                  ;$07EF53 |
    LDX.W #$0080                  ;$07EF56 |
    JSL.L CODE_FL_00E640          ;$07EF59 |
    LDA.W #$0200                  ;$07EF5D |
    LDX.W #$FF80                  ;$07EF60 |
    JSL.L CODE_FL_00E648          ;$07EF63 |
    LDA.W #$0132                  ;$07EF67 |
    LDX.W #$0008                  ;$07EF6A |
    JSL.L CODE_FL_00E193          ;$07EF6D |
    LDA.W #$0100                  ;$07EF71 |
    LDX.W #$0006                  ;$07EF74 |
    JSL.L CODE_FL_00E55E          ;$07EF77 |
    JSL.L CODE_FL_00E465          ;$07EF7B |
    LDA.W #$04C0                  ;$07EF7F |
    STA.W $6B6E,Y                 ;$07EF82 |
    LDA.W #$FF80                  ;$07EF85 |
    LDX.W #$FFF0                  ;$07EF88 |
    LDY.W #$002A                  ;$07EF8B |
    JSL.L CODE_FL_00E634          ;$07EF8E |
    JSL.L CODE_FL_00E465          ;$07EF92 |
    JSL.L CODE_FL_00E13F          ;$07EF96 |
    LDA.W #$AB72                  ;$07EF9A |
    STA.W Obj_DrawCallback,Y      ;$07EF9D |
    LDA.W #$9AEA                  ;$07EFA0 |
    LDX.W #$00C5                  ;$07EFA3 |
    JSL.L CODE_FL_00E1CC          ;$07EFA6 |
    LDA.W #$00FF                  ;$07EFAA |
    JSL.L CODE_FL_00E28E          ;$07EFAD |
    LDA.W #$0028                  ;$07EFB1 |
    JSL.L CODE_FL_00E298          ;$07EFB4 |
    LDA.W #$FA00                  ;$07EFB8 |
    LDX.W #$0000                  ;$07EFBB |
    JSL.L CODE_FL_00E640          ;$07EFBE |
    LDA.W #$FEA0                  ;$07EFC2 |
    LDX.W #$000C                  ;$07EFC5 |
    JSL.L CODE_FL_00E648          ;$07EFC8 |
    LDA.W #$5600                  ;$07EFCC |
    JSL.L CODE_FL_00E169          ;$07EFCF |
    LDA.W #$AFF5                  ;$07EFD3 |
    STA.W Obj_DrawCallback,Y      ;$07EFD6 |
    LDA.W #$96FC                  ;$07EFD9 |
    LDX.W #$00C7                  ;$07EFDC |
    JSL.L CODE_FL_00E1CC          ;$07EFDF |
    LDA.W #$0000                  ;$07EFE3 |
    JSL.L CODE_FL_00E28E          ;$07EFE6 |
    LDA.W #$0068                  ;$07EFEA |
    JSL.L CODE_FL_00E298          ;$07EFED |
    LDA.W #$0600                  ;$07EFF1 |
    LDX.W #$FFD0                  ;$07EFF4 |
    JSL.L CODE_FL_00E640          ;$07EFF7 |
    LDA.W #$0300                  ;$07EFFB |
    LDX.W #$FFD0                  ;$07EFFE |
    JSL.L CODE_FL_00E648          ;$07F001 |
    LDA.W #$0132                  ;$07F005 |
    LDX.W #$001E                  ;$07F008 |
    JSL.L CODE_FL_00E193          ;$07F00B |
    JSL.L CODE_FL_00E465          ;$07F00F |
    LDA.W #$000A                  ;$07F013 |
    JSL.L CODE_FL_07EC7F          ;$07F016 |
    LDA.W #$0008                  ;$07F01A |
    STA.W Obj_VAR8,Y              ;$07F01D |

CODE_JP_07F020:
    LDA.W #$0200                  ;$07F020 |
    LDX.W #$0002                  ;$07F023 |
    JSL.L CODE_FL_00E55E          ;$07F026 |
    LDA.W #$FE00                  ;$07F02A |
    LDX.W #$0002                  ;$07F02D |
    JSL.L CODE_FL_00E55E          ;$07F030 |
    TYX                           ;$07F034 |
    DEC.W Obj_VAR8,X              ;$07F035 |
    BEQ CODE_07F03D               ;$07F038 |
    JMP.W CODE_JP_07F020          ;$07F03A |

CODE_07F03D:
    LDA.W #$000A                  ;$07F03D |
    JSL.L CODE_FL_07EC7F          ;$07F040 |
    LDA.W #$0800                  ;$07F044 |
    LDX.W #$FF80                  ;$07F047 |
    JSL.L CODE_FL_00E640          ;$07F04A |
    LDA.W #$0040                  ;$07F04E |
    LDX.W #$0020                  ;$07F051 |
    JSL.L CODE_FL_00E55E          ;$07F054 |
    LDA.W #$FC00                  ;$07F058 |
    LDX.W #$0040                  ;$07F05B |
    LDY.W #$001A                  ;$07F05E |
    JSL.L CODE_FL_00E628          ;$07F061 |
    LDA.W #$0600                  ;$07F065 |
    LDX.W #$FFA0                  ;$07F068 |
    LDY.W #$0010                  ;$07F06B |
    JSL.L CODE_FL_00E628          ;$07F06E |
    LDA.W #$FF00                  ;$07F072 |
    LDX.W #$0014                  ;$07F075 |
    JSL.L CODE_FL_00E55E          ;$07F078 |
    LDA.W #$FE00                  ;$07F07C |
    LDX.W #$0020                  ;$07F07F |
    LDY.W #$000A                  ;$07F082 |
    JSL.L CODE_FL_00E628          ;$07F085 |
    LDA.W #$0070                  ;$07F089 |
    LDX.W #$0010                  ;$07F08C |
    JSL.L CODE_FL_00E5F3          ;$07F08F |
    LDA.W #$0000                  ;$07F093 |
    LDX.W #$0800                  ;$07F096 |
    JSL.L CODE_FL_00E539          ;$07F099 |
    LDA.W #$0080                  ;$07F09D |
    LDX.W #$FF80                  ;$07F0A0 |
    LDY.W #$0010                  ;$07F0A3 |
    JSL.L CODE_FL_00E617          ;$07F0A6 |
    LDA.W #$FF80                  ;$07F0AA |
    LDX.W #$0010                  ;$07F0AD |
    JSL.L CODE_FL_00E5EC          ;$07F0B0 |
    LDA.W #$FF80                  ;$07F0B4 |
    LDX.W #$0080                  ;$07F0B7 |
    LDY.W #$0010                  ;$07F0BA |
    JSL.L CODE_FL_00E617          ;$07F0BD |
    LDA.W #$0080                  ;$07F0C1 |
    LDX.W #$0010                  ;$07F0C4 |
    JSL.L CODE_FL_00E5EC          ;$07F0C7 |
    LDA.W #$0008                  ;$07F0CB |
    JSL.L CODE_FL_07EC7F          ;$07F0CE |
    LDA.W #$0800                  ;$07F0D2 |
    LDX.W #$FF80                  ;$07F0D5 |
    LDY.W #$0010                  ;$07F0D8 |
    JSL.L CODE_FL_00E634          ;$07F0DB |
    LDA.W #$FFC0                  ;$07F0DF |
    LDX.W #$0010                  ;$07F0E2 |
    JSL.L CODE_FL_00E5EC          ;$07F0E5 |
    LDA.W #$0000                  ;$07F0E9 |
    LDX.W #$0020                  ;$07F0EC |
    JSL.L CODE_FL_00E5EC          ;$07F0EF |
    JML.L DestroyUsedObject       ;$07F0F3 |

CODE_07F0F7:
    LDA.W #$AB72                  ;$07F0F7 |
    STA.W Obj_DrawCallback,Y      ;$07F0FA |
    LDA.W #$9AEA                  ;$07F0FD |
    LDX.W #$00C5                  ;$07F100 |
    JSL.L CODE_FL_00E1CC          ;$07F103 |
    LDA.W #$0021                  ;$07F107 |
    STA.W $64B6,Y                 ;$07F10A |
    LDX.W Obj_VAR3,Y              ;$07F10D |
    JMP.W (PTR16_07F113,X)        ;$07F110 |
PTR16_07F113:
    dw CODE_07F11B                ;$07F113 |
    dw CODE_07F156                ;$07F115 |
    dw CODE_07F191                ;$07F117 |
    dw CODE_07F1CC                ;$07F119 |

CODE_07F11B:
    LDA.W #$FC00                  ;$07F11B |
    LDX.W #$0040                  ;$07F11E |
    JSL.L CODE_FL_00E640          ;$07F121 |
    LDA.W #$FE00                  ;$07F125 |
    LDX.W #$0020                  ;$07F128 |
    JSL.L CODE_FL_00E648          ;$07F12B |
    LDA.W #$0402                  ;$07F12F |
    JSL.L CODE_FL_00E169          ;$07F132 |
    LDA.W #$0404                  ;$07F136 |
    JSL.L CODE_FL_00E169          ;$07F139 |
    LDA.W #$0401                  ;$07F13D |
    JSL.L CODE_FL_00E169          ;$07F140 |
    LDA.W #$0405                  ;$07F144 |
    JSL.L CODE_FL_00E169          ;$07F147 |
    LDA.W #$0400                  ;$07F14B |
    JSL.L CODE_FL_00E169          ;$07F14E |
    JML.L DestroyUsedObject       ;$07F152 |

CODE_07F156:
    LDA.W #$FE00                  ;$07F156 |
    LDX.W #$0020                  ;$07F159 |
    JSL.L CODE_FL_00E640          ;$07F15C |
    LDA.W #$FC00                  ;$07F160 |
    LDX.W #$0040                  ;$07F163 |
    JSL.L CODE_FL_00E648          ;$07F166 |
    LDA.W #$0402                  ;$07F16A |
    JSL.L CODE_FL_00E169          ;$07F16D |
    LDA.W #$0404                  ;$07F171 |
    JSL.L CODE_FL_00E169          ;$07F174 |
    LDA.W #$0401                  ;$07F178 |
    JSL.L CODE_FL_00E169          ;$07F17B |
    LDA.W #$0405                  ;$07F17F |
    JSL.L CODE_FL_00E169          ;$07F182 |
    LDA.W #$0400                  ;$07F186 |
    JSL.L CODE_FL_00E169          ;$07F189 |
    JML.L DestroyUsedObject       ;$07F18D |

CODE_07F191:
    LDA.W #$0200                  ;$07F191 |
    LDX.W #$FFE0                  ;$07F194 |
    JSL.L CODE_FL_00E640          ;$07F197 |
    LDA.W #$FC00                  ;$07F19B |
    LDX.W #$0040                  ;$07F19E |
    JSL.L CODE_FL_00E648          ;$07F1A1 |
    LDA.W #$0402                  ;$07F1A5 |
    JSL.L CODE_FL_00E169          ;$07F1A8 |
    LDA.W #$0404                  ;$07F1AC |
    JSL.L CODE_FL_00E169          ;$07F1AF |
    LDA.W #$0401                  ;$07F1B3 |
    JSL.L CODE_FL_00E169          ;$07F1B6 |
    LDA.W #$0405                  ;$07F1BA |
    JSL.L CODE_FL_00E169          ;$07F1BD |
    LDA.W #$0400                  ;$07F1C1 |
    JSL.L CODE_FL_00E169          ;$07F1C4 |
    JML.L DestroyUsedObject       ;$07F1C8 |

CODE_07F1CC:
    LDA.W #$0400                  ;$07F1CC |
    LDX.W #$FFC0                  ;$07F1CF |
    JSL.L CODE_FL_00E640          ;$07F1D2 |
    LDA.W #$FE00                  ;$07F1D6 |
    LDX.W #$0020                  ;$07F1D9 |
    JSL.L CODE_FL_00E648          ;$07F1DC |
    LDA.W #$0402                  ;$07F1E0 |
    JSL.L CODE_FL_00E169          ;$07F1E3 |
    LDA.W #$0404                  ;$07F1E7 |
    JSL.L CODE_FL_00E169          ;$07F1EA |
    LDA.W #$0401                  ;$07F1EE |
    JSL.L CODE_FL_00E169          ;$07F1F1 |
    LDA.W #$0405                  ;$07F1F5 |
    JSL.L CODE_FL_00E169          ;$07F1F8 |
    LDA.W #$0400                  ;$07F1FC |
    JSL.L CODE_FL_00E169          ;$07F1FF |
    JML.L DestroyUsedObject       ;$07F203 |

CODE_07F207:
    LDA.W #$A72A                  ;$07F207 |
    STA.W Obj_TickLoopCallback,Y   ;$07F20A |
    LDA.W #$AB90                  ;$07F20D |
    STA.W Obj_DrawCallback,Y      ;$07F210 |
    LDA.W #$FFFF                  ;$07F213 |
    LDX.W #$00FF                  ;$07F216 |
    JSL.L CODE_FL_00E1CC          ;$07F219 |
    LDA.W #$FFFF                  ;$07F21D |
    STA.W Obj_Pose,Y              ;$07F220 |
    LDA.W #$0000                  ;$07F223 |
    JSL.L CODE_FL_00E28E          ;$07F226 |
    LDA.W #$0000                  ;$07F22A |
    JSL.L CODE_FL_00E298          ;$07F22D |
    LDA.W #$0018                  ;$07F231 |
    STA.W Obj_VAR8,Y              ;$07F234 |

CODE_JP_07F237:
    LDA.W #$0009                  ;$07F237 |
    JSL.L CODE_FL_07EC7F          ;$07F23A |
    JSL.L CODE_FL_00E097          ;$07F23E |
    TYX                           ;$07F242 |
    DEC.W Obj_VAR8,X              ;$07F243 |
    BEQ CODE_07F24B               ;$07F246 |
    JMP.W CODE_JP_07F237          ;$07F248 |

CODE_07F24B:
    JML.L DestroyUsedObject       ;$07F24B |

CODE_07F24F:
    LDA.W #$AB72                  ;$07F24F |
    STA.W Obj_DrawCallback,Y      ;$07F252 |
    LDA.W #$0003                  ;$07F255 |
    STA.W Obj_VAR8,Y              ;$07F258 |

CODE_JP_07F25B:
    LDA.W #$015D                  ;$07F25B |
    JSL.L CODE_FL_00E169          ;$07F25E |
    LDA.W #$01FF                  ;$07F262 |
    JSL.L CODE_FL_00E169          ;$07F265 |
    TYX                           ;$07F269 |
    DEC.W Obj_VAR8,X              ;$07F26A |
    BEQ CODE_07F272               ;$07F26D |
    JMP.W CODE_JP_07F25B          ;$07F26F |

CODE_07F272:
    JML.L DestroyUsedObject       ;$07F272 |

CODE_07F276:
    LDA.W #$A72A                  ;$07F276 |
    STA.W Obj_TickLoopCallback,Y   ;$07F279 |
    LDA.W #$AB72                  ;$07F27C |
    STA.W Obj_DrawCallback,Y      ;$07F27F |
    LDA.W #$FFFF                  ;$07F282 |
    LDX.W #$00FF                  ;$07F285 |
    JSL.L CODE_FL_00E1CC          ;$07F288 |
    LDA.W #$FFFF                  ;$07F28C |
    STA.W Obj_Pose,Y              ;$07F28F |
    LDA.W #$0000                  ;$07F292 |
    JSL.L CODE_FL_00E28E          ;$07F295 |
    LDA.W #$0000                  ;$07F299 |
    JSL.L CODE_FL_00E298          ;$07F29C |
    LDA.W #$0004                  ;$07F2A0 |
    STA.W Obj_VAR8,Y              ;$07F2A3 |

CODE_JP_07F2A6:
    JSL.L CODE_FL_00E0A3          ;$07F2A6 |
    LDA.W #$000B                  ;$07F2AA |
    LDX.W #$0000                  ;$07F2AD |
    JSL.L CODE_FL_07EC7F          ;$07F2B0 |
    JSL.L CODE_FL_00E0A3          ;$07F2B4 |
    LDA.W #$000B                  ;$07F2B8 |
    LDX.W #$0002                  ;$07F2BB |
    JSL.L CODE_FL_07EC7F          ;$07F2BE |
    JSL.L CODE_FL_00E0A3          ;$07F2C2 |
    LDA.W #$000B                  ;$07F2C6 |
    LDX.W #$0004                  ;$07F2C9 |
    JSL.L CODE_FL_07EC7F          ;$07F2CC |
    JSL.L CODE_FL_00E0A3          ;$07F2D0 |
    LDA.W #$000B                  ;$07F2D4 |
    LDX.W #$0006                  ;$07F2D7 |
    JSL.L CODE_FL_07EC7F          ;$07F2DA |
    TYX                           ;$07F2DE |
    DEC.W Obj_VAR8,X              ;$07F2DF |
    BEQ CODE_07F2E7               ;$07F2E2 |
    JMP.W CODE_JP_07F2A6          ;$07F2E4 |

CODE_07F2E7:
    JML.L DestroyUsedObject       ;$07F2E7 |

CODE_07F2EB:
    LDA.W #$AB72                  ;$07F2EB |
    STA.W Obj_DrawCallback,Y      ;$07F2EE |
    LDA.W #$9AEA                  ;$07F2F1 |
    LDX.W #$00C5                  ;$07F2F4 |
    JSL.L CODE_FL_00E1CC          ;$07F2F7 |
    LDX.W Obj_VAR3,Y              ;$07F2FB |
    JMP.W (PTR16_07F301,X)        ;$07F2FE |
PTR16_07F301:
    dw CODE_07F309                ;$07F301 |
    dw CODE_07F325                ;$07F303 |
    dw CODE_07F341                ;$07F305 |
    dw CODE_07F35D                ;$07F307 |

CODE_07F309:
    LDA.W #$FE00                  ;$07F309 |
    LDX.W #$0A00                  ;$07F30C |
    JSL.L CODE_FL_00E539          ;$07F30F |
    LDA.W #$0E02                  ;$07F313 |
    JSL.L CODE_FL_00E169          ;$07F316 |
    LDA.W #$0200                  ;$07F31A |
    JSL.L CODE_FL_00E169          ;$07F31D |
    JML.L DestroyUsedObject       ;$07F321 |

CODE_07F325:
    LDA.W #$FF00                  ;$07F325 |
    LDX.W #$0C00                  ;$07F328 |
    JSL.L CODE_FL_00E539          ;$07F32B |
    LDA.W #$0E02                  ;$07F32F |
    JSL.L CODE_FL_00E169          ;$07F332 |
    LDA.W #$0200                  ;$07F336 |
    JSL.L CODE_FL_00E169          ;$07F339 |
    JML.L DestroyUsedObject       ;$07F33D |

CODE_07F341:
    LDA.W #$0100                  ;$07F341 |
    LDX.W #$0C00                  ;$07F344 |
    JSL.L CODE_FL_00E539          ;$07F347 |
    LDA.W #$0E02                  ;$07F34B |
    JSL.L CODE_FL_00E169          ;$07F34E |
    LDA.W #$0200                  ;$07F352 |
    JSL.L CODE_FL_00E169          ;$07F355 |
    JML.L DestroyUsedObject       ;$07F359 |

CODE_07F35D:
    LDA.W #$0200                  ;$07F35D |
    LDX.W #$0A00                  ;$07F360 |
    JSL.L CODE_FL_00E539          ;$07F363 |
    LDA.W #$0E02                  ;$07F367 |
    JSL.L CODE_FL_00E169          ;$07F36A |
    LDA.W #$0200                  ;$07F36E |
    JSL.L CODE_FL_00E169          ;$07F371 |
    JML.L DestroyUsedObject       ;$07F375 |

CODE_07F379:
    LDA.W #$FFFF                  ;$07F379 |
    LDX.W #$00FF                  ;$07F37C |
    JSL.L CODE_FL_00E1CC          ;$07F37F |
    LDA.W #$FFFF                  ;$07F383 |
    STA.W Obj_Pose,Y              ;$07F386 |
    TYX                           ;$07F389 |
    STZ.W Obj_VAR0,X              ;$07F38A |

CODE_07F38D:
    LDA.W #$0006                  ;$07F38D |
    LDX.W Obj_VAR0,Y              ;$07F390 |
    JSL.L CODE_FL_07EC7F          ;$07F393 |
    JSL.L CODE_FL_00E0C7          ;$07F397 |
    LDA.W Obj_VAR0,Y              ;$07F39B |
    INC A                         ;$07F39E |
    STA.W Obj_VAR0,Y              ;$07F39F |
    CMP.W #$0012                  ;$07F3A2 |
    BCC CODE_07F38D               ;$07F3A5 |
    JML.L DestroyUsedObject       ;$07F3A7 |

CODE_07F3AB:
    LDA.W #$9AEA                  ;$07F3AB |
    LDX.W #$00C5                  ;$07F3AE |
    JSL.L CODE_FL_00E1CC          ;$07F3B1 |
    LDA.W #$0080                  ;$07F3B5 |
    JSL.L CODE_FL_00E28E          ;$07F3B8 |
    LDA.W #$0B1E                  ;$07F3BC |
    JSL.L CODE_FL_00E298          ;$07F3BF |
    LDA.W #$0000                  ;$07F3C3 |
    STA.W Obj_Pose,Y              ;$07F3C6 |
    LDA.W Obj_VAR3,Y              ;$07F3C9 |
    AND.W #$0001                  ;$07F3CC |
    BEQ CODE_07F3D9               ;$07F3CF |
    LDA.W #$C000                  ;$07F3D1 |
    STA.W Obj_VAR1,Y              ;$07F3D4 |
    BRA CODE_07F3DF               ;$07F3D7 |

CODE_07F3D9:
    LDA.W #$4000                  ;$07F3D9 |
    STA.W Obj_VAR1,Y              ;$07F3DC |

CODE_07F3DF:
    LDA.W Obj_VAR3,Y              ;$07F3DF |
    AND.W #$FFFE                  ;$07F3E2 |
    TAX                           ;$07F3E5 |
    JMP.W (PTR16_07F3E9,X)        ;$07F3E6 |
PTR16_07F3E9:
    dw CODE_07F3FB                ;$07F3E9 |
    dw CODE_07F439                ;$07F3EB |
    dw CODE_07F46F                ;$07F3ED |
    dw CODE_07F4A2                ;$07F3EF |
    dw CODE_07F4E0                ;$07F3F1 |
    dw CODE_07F516                ;$07F3F3 |
    dw CODE_07F549                ;$07F3F5 |
    dw CODE_07F587                ;$07F3F7 |
    dw CODE_07F5BD                ;$07F3F9 |

CODE_07F3FB:
    LDA.W #$0200                  ;$07F3FB |
    LDX.W #$FFF0                  ;$07F3FE |
    JSL.L CODE_FL_00E650          ;$07F401 |
    LDA.W #$0080                  ;$07F405 |
    LDX.W #$0010                  ;$07F408 |
    JSL.L CODE_FL_00E55E          ;$07F40B |
    LDA.W #$0100                  ;$07F40F |
    LDX.W #$0000                  ;$07F412 |
    JSL.L CODE_FL_00E650          ;$07F415 |
    JSL.L CODE_FL_00E0BB          ;$07F419 |
    LDA.W #$FF00                  ;$07F41D |
    LDX.W #$0008                  ;$07F420 |
    JSL.L CODE_FL_00E541          ;$07F423 |
    LDA.W #$FE00                  ;$07F427 |
    LDX.W #$0010                  ;$07F42A |
    JSL.L CODE_FL_00E650          ;$07F42D |
    JSL.L CODE_FL_00E0EB          ;$07F431 |
    JML.L DestroyUsedObject       ;$07F435 |

CODE_07F439:
    LDA.W #$0200                  ;$07F439 |
    JSL.L CODE_FL_00E4F2          ;$07F43C |
    LDA.W #$FF00                  ;$07F440 |
    LDX.W #$0010                  ;$07F443 |
    LDY.W #$0010                  ;$07F446 |
    JSL.L CODE_FL_00E634          ;$07F449 |
    LDA.W #$0100                  ;$07F44D |
    LDX.W #$0008                  ;$07F450 |
    JSL.L CODE_FL_00E541          ;$07F453 |
    LDA.W #$FF00                  ;$07F457 |
    LDX.W #$0008                  ;$07F45A |
    JSL.L CODE_FL_00E541          ;$07F45D |
    LDA.W #$FE00                  ;$07F461 |
    LDX.W #$0010                  ;$07F464 |
    JSL.L CODE_FL_00E541          ;$07F467 |
    JML.L DestroyUsedObject       ;$07F46B |

CODE_07F46F:
    LDA.W #$0200                  ;$07F46F |
    LDX.W #$FFE0                  ;$07F472 |
    JSL.L CODE_FL_00E650          ;$07F475 |
    LDA.W #$FD00                  ;$07F479 |
    LDX.W #$0030                  ;$07F47C |
    LDY.W #$0004                  ;$07F47F |
    JSL.L CODE_FL_00E634          ;$07F482 |
    LDA.W #$0100                  ;$07F486 |
    LDX.W #$0000                  ;$07F489 |
    JSL.L CODE_FL_00E650          ;$07F48C |
    JSL.L CODE_FL_00E0EB          ;$07F490 |
    LDA.W #$FF00                  ;$07F494 |
    LDX.W #$0012                  ;$07F497 |
    JSL.L CODE_FL_00E541          ;$07F49A |
    JML.L DestroyUsedObject       ;$07F49E |

CODE_07F4A2:
    LDA.W #$0200                  ;$07F4A2 |
    LDX.W #$FFF0                  ;$07F4A5 |
    JSL.L CODE_FL_00E650          ;$07F4A8 |
    LDA.W #$00F8                  ;$07F4AC |
    LDX.W #$0010                  ;$07F4AF |
    JSL.L CODE_FL_00E55E          ;$07F4B2 |
    LDA.W #$0100                  ;$07F4B6 |
    LDX.W #$0000                  ;$07F4B9 |
    JSL.L CODE_FL_00E650          ;$07F4BC |
    JSL.L CODE_FL_00E0BB          ;$07F4C0 |
    LDA.W #$FF00                  ;$07F4C4 |
    LDX.W #$0008                  ;$07F4C7 |
    JSL.L CODE_FL_00E541          ;$07F4CA |
    LDA.W #$FE00                  ;$07F4CE |
    LDX.W #$0010                  ;$07F4D1 |
    JSL.L CODE_FL_00E650          ;$07F4D4 |
    JSL.L CODE_FL_00E0EB          ;$07F4D8 |
    JML.L DestroyUsedObject       ;$07F4DC |

CODE_07F4E0:
    LDA.W #$0200                  ;$07F4E0 |
    JSL.L CODE_FL_00E4F2          ;$07F4E3 |
    LDA.W #$FF00                  ;$07F4E7 |
    LDX.W #$0014                  ;$07F4EA |
    LDY.W #$0010                  ;$07F4ED |
    JSL.L CODE_FL_00E634          ;$07F4F0 |
    LDA.W #$0100                  ;$07F4F4 |
    LDX.W #$0008                  ;$07F4F7 |
    JSL.L CODE_FL_00E541          ;$07F4FA |
    LDA.W #$FF00                  ;$07F4FE |
    LDX.W #$0008                  ;$07F501 |
    JSL.L CODE_FL_00E541          ;$07F504 |
    LDA.W #$FE00                  ;$07F508 |
    LDX.W #$0010                  ;$07F50B |
    JSL.L CODE_FL_00E541          ;$07F50E |
    JML.L DestroyUsedObject       ;$07F512 |

CODE_07F516:
    LDA.W #$0200                  ;$07F516 |
    LDX.W #$FFE0                  ;$07F519 |
    JSL.L CODE_FL_00E650          ;$07F51C |
    LDA.W #$FD00                  ;$07F520 |
    LDX.W #$0036                  ;$07F523 |
    LDY.W #$0004                  ;$07F526 |
    JSL.L CODE_FL_00E634          ;$07F529 |
    LDA.W #$0100                  ;$07F52D |
    LDX.W #$0000                  ;$07F530 |
    JSL.L CODE_FL_00E650          ;$07F533 |
    JSL.L CODE_FL_00E0EB          ;$07F537 |
    LDA.W #$FF00                  ;$07F53B |
    LDX.W #$0012                  ;$07F53E |
    JSL.L CODE_FL_00E541          ;$07F541 |
    JML.L DestroyUsedObject       ;$07F545 |

CODE_07F549:
    LDA.W #$0200                  ;$07F549 |
    LDX.W #$FFF0                  ;$07F54C |
    JSL.L CODE_FL_00E650          ;$07F54F |
    LDA.W #$0198                  ;$07F553 |
    LDX.W #$0010                  ;$07F556 |
    JSL.L CODE_FL_00E55E          ;$07F559 |
    LDA.W #$0100                  ;$07F55D |
    LDX.W #$0000                  ;$07F560 |
    JSL.L CODE_FL_00E650          ;$07F563 |
    JSL.L CODE_FL_00E0BB          ;$07F567 |
    LDA.W #$FF00                  ;$07F56B |
    LDX.W #$0008                  ;$07F56E |
    JSL.L CODE_FL_00E541          ;$07F571 |
    LDA.W #$FE00                  ;$07F575 |
    LDX.W #$0010                  ;$07F578 |
    JSL.L CODE_FL_00E650          ;$07F57B |
    JSL.L CODE_FL_00E0EB          ;$07F57F |
    JML.L DestroyUsedObject       ;$07F583 |

CODE_07F587:
    LDA.W #$0200                  ;$07F587 |
    JSL.L CODE_FL_00E4F2          ;$07F58A |
    LDA.W #$FF00                  ;$07F58E |
    LDX.W #$001C                  ;$07F591 |
    LDY.W #$0010                  ;$07F594 |
    JSL.L CODE_FL_00E634          ;$07F597 |
    LDA.W #$0100                  ;$07F59B |
    LDX.W #$0008                  ;$07F59E |
    JSL.L CODE_FL_00E541          ;$07F5A1 |
    LDA.W #$FF00                  ;$07F5A5 |
    LDX.W #$0008                  ;$07F5A8 |
    JSL.L CODE_FL_00E541          ;$07F5AB |
    LDA.W #$FE00                  ;$07F5AF |
    LDX.W #$0010                  ;$07F5B2 |
    JSL.L CODE_FL_00E541          ;$07F5B5 |
    JML.L DestroyUsedObject       ;$07F5B9 |

CODE_07F5BD:
    LDA.W #$0200                  ;$07F5BD |
    LDX.W #$FFE0                  ;$07F5C0 |
    JSL.L CODE_FL_00E650          ;$07F5C3 |
    LDA.W #$FD00                  ;$07F5C7 |
    LDX.W #$0040                  ;$07F5CA |
    LDY.W #$0004                  ;$07F5CD |
    JSL.L CODE_FL_00E634          ;$07F5D0 |
    LDA.W #$0100                  ;$07F5D4 |
    LDX.W #$0000                  ;$07F5D7 |
    JSL.L CODE_FL_00E650          ;$07F5DA |
    JSL.L CODE_FL_00E0EB          ;$07F5DE |
    LDA.W #$FF00                  ;$07F5E2 |
    LDX.W #$0012                  ;$07F5E5 |
    JSL.L CODE_FL_00E541          ;$07F5E8 |
    JML.L DestroyUsedObject       ;$07F5EC |

CODE_07F5F0:
    LDA.W #$AB90                  ;$07F5F0 |
    STA.W Obj_DrawCallback,Y      ;$07F5F3 |
    LDA.W #$A6EC                  ;$07F5F6 |
    STA.W Obj_TickLoopCallback,Y   ;$07F5F9 |
    LDA.W #$FFFF                  ;$07F5FC |
    LDX.W #$00FF                  ;$07F5FF |
    JSL.L CODE_FL_00E1CC          ;$07F602 |
    LDA.W #$FFFF                  ;$07F606 |
    STA.W Obj_Pose,Y              ;$07F609 |
    LDA.W #$00FF                  ;$07F60C |
    JSL.L CODE_FL_00E17F          ;$07F60F |
    LDA.W #$00FF                  ;$07F613 |
    JSL.L CODE_FL_00E17F          ;$07F616 |
    LDA.W #$003C                  ;$07F61A |
    JSL.L CODE_FL_00E17F          ;$07F61D |
    LDA.W #$003C                  ;$07F621 |
    JSL.L CODE_FL_00E17F          ;$07F624 |
    LDA.W #$008C                  ;$07F628 |
    JSL.L CODE_FL_00E17F          ;$07F62B |
    TYX                           ;$07F62F |
    STZ.W Obj_VAR0,X              ;$07F630 |
    LDA.W #$0005                  ;$07F633 |
    STA.W Obj_VAR8,Y              ;$07F636 |

CODE_JP_07F639:
    LDA.W #$000C                  ;$07F639 |
    STA.W Obj_VAR9,Y              ;$07F63C |

CODE_JP_07F63F:
    JSL.L CODE_FL_07F65D          ;$07F63F |
    JSL.L CODE_FL_00E091          ;$07F643 |
    TYX                           ;$07F647 |
    DEC.W Obj_VAR9,X              ;$07F648 |
    BEQ CODE_07F650               ;$07F64B |
    JMP.W CODE_JP_07F63F          ;$07F64D |

CODE_07F650:
    TYX                           ;$07F650 |
    DEC.W Obj_VAR8,X              ;$07F651 |
    BEQ CODE_07F659               ;$07F654 |
    JMP.W CODE_JP_07F639          ;$07F656 |

CODE_07F659:
    JML.L DestroyUsedObject       ;$07F659 |

CODE_FL_07F65D:
    LDA.W Obj_VAR0,Y              ;$07F65D |
    CLC                           ;$07F660 |
    ADC.W #$CD1D                  ;$07F661 |
    LDX.W #$0007                  ;$07F664 |
    LDY.W #$060A                  ;$07F667 |
    JSL.L WritePal                ;$07F66A |
    LDY.B $39                     ;$07F66E |
    LDA.W Obj_VAR0,Y              ;$07F670 |
    CLC                           ;$07F673 |
    ADC.W #$0014                  ;$07F674 |
    STA.W Obj_VAR0,Y              ;$07F677 |
    RTL                           ;$07F67A |

CODE_07F67B:
    LDA.W #$AB90                  ;$07F67B |
    STA.W Obj_DrawCallback,Y      ;$07F67E |
    LDA.W #$A6EC                  ;$07F681 |
    STA.W Obj_TickLoopCallback,Y   ;$07F684 |
    LDA.W #$FFFF                  ;$07F687 |
    LDX.W #$00FF                  ;$07F68A |
    JSL.L CODE_FL_00E1CC          ;$07F68D |
    LDA.W #$FFFF                  ;$07F691 |
    STA.W Obj_Pose,Y              ;$07F694 |

CODE_07F697:
    TYX                           ;$07F697 |
    STZ.W Obj_VAR0,X              ;$07F698 |
    LDA.W #$0007                  ;$07F69B |
    STA.W Obj_VAR8,Y              ;$07F69E |

CODE_JP_07F6A1:
    LDA.W #$0011                  ;$07F6A1 |
    STA.W Obj_VAR9,Y              ;$07F6A4 |

CODE_JP_07F6A7:
    JSL.L CODE_FL_CBE5AA          ;$07F6A7 |
    JSL.L CODE_FL_00E091          ;$07F6AB |
    TYX                           ;$07F6AF |
    DEC.W Obj_VAR9,X              ;$07F6B0 |
    BEQ CODE_07F6B8               ;$07F6B3 |
    JMP.W CODE_JP_07F6A7          ;$07F6B5 |

CODE_07F6B8:
    JSL.L CODE_FL_00E0B5          ;$07F6B8 |
    TYX                           ;$07F6BC |
    DEC.W Obj_VAR8,X              ;$07F6BD |
    BEQ CODE_07F6C5               ;$07F6C0 |
    JMP.W CODE_JP_07F6A1          ;$07F6C2 |

CODE_07F6C5:
    BRA CODE_07F697               ;$07F6C5 |

CODE_07F6C7:
    LDA.W #$AB90                  ;$07F6C7 |
    STA.W Obj_DrawCallback,Y      ;$07F6CA |
    LDA.W #$A6EC                  ;$07F6CD |
    STA.W Obj_TickLoopCallback,Y   ;$07F6D0 |
    LDA.W #$FFFF                  ;$07F6D3 |
    LDX.W #$00FF                  ;$07F6D6 |
    JSL.L CODE_FL_00E1CC          ;$07F6D9 |
    LDA.W #$FFFF                  ;$07F6DD |
    STA.W Obj_Pose,Y              ;$07F6E0 |

CODE_07F6E3:
    TYX                           ;$07F6E3 |
    STZ.W Obj_VAR0,X              ;$07F6E4 |
    LDA.W #$0004                  ;$07F6E7 |
    STA.W Obj_VAR8,Y              ;$07F6EA |

CODE_JP_07F6ED:
    LDA.W #$0002                  ;$07F6ED |
    STA.W Obj_VAR9,Y              ;$07F6F0 |

CODE_JP_07F6F3:
    JSL.L CODE_FL_CBE5F5          ;$07F6F3 |
    JSL.L CODE_FL_00E091          ;$07F6F7 |
    TYX                           ;$07F6FB |
    DEC.W Obj_VAR9,X              ;$07F6FC |
    BEQ CODE_07F704               ;$07F6FF |
    JMP.W CODE_JP_07F6F3          ;$07F701 |

CODE_07F704:
    JSL.L CODE_FL_00E097          ;$07F704 |
    TYX                           ;$07F708 |
    DEC.W Obj_VAR8,X              ;$07F709 |
    BEQ CODE_07F711               ;$07F70C |
    JMP.W CODE_JP_07F6ED          ;$07F70E |

CODE_07F711:
    BRA CODE_07F6E3               ;$07F711 |

CODE_07F713:
    LDA.W #$AB90                  ;$07F713 |
    STA.W Obj_DrawCallback,Y      ;$07F716 |
    LDA.W #$A6EC                  ;$07F719 |
    STA.W Obj_TickLoopCallback,Y   ;$07F71C |
    LDA.W #$FFFF                  ;$07F71F |
    LDX.W #$00FF                  ;$07F722 |
    JSL.L CODE_FL_00E1CC          ;$07F725 |
    LDA.W #$FFFF                  ;$07F729 |
    STA.W Obj_Pose,Y              ;$07F72C |

CODE_07F72F:
    TYX                           ;$07F72F |
    STZ.W Obj_VAR0,X              ;$07F730 |
    LDA.W #$0007                  ;$07F733 |
    STA.W Obj_VAR8,Y              ;$07F736 |

CODE_JP_07F739:
    JSL.L CODE_FL_CBE627          ;$07F739 |
    JSL.L CODE_FL_00E0BB          ;$07F73D |
    TYX                           ;$07F741 |
    DEC.W Obj_VAR8,X              ;$07F742 |
    BEQ CODE_07F74A               ;$07F745 |
    JMP.W CODE_JP_07F739          ;$07F747 |

CODE_07F74A:
    BRA CODE_07F72F               ;$07F74A |

CODE_07F74C:
    LDA.W #$AB90                  ;$07F74C |
    STA.W Obj_DrawCallback,Y      ;$07F74F |
    LDA.W #$A6EC                  ;$07F752 |
    STA.W Obj_TickLoopCallback,Y   ;$07F755 |
    LDA.W #$FFFF                  ;$07F758 |
    LDX.W #$00FF                  ;$07F75B |
    JSL.L CODE_FL_00E1CC          ;$07F75E |
    LDA.W #$FFFF                  ;$07F762 |
    STA.W Obj_Pose,Y              ;$07F765 |

CODE_JP_07F768:
    TYX                           ;$07F768 |
    STZ.W Obj_VAR0,X              ;$07F769 |
    LDA.W #$0003                  ;$07F76C |
    STA.W Obj_VAR8,Y              ;$07F76F |

CODE_JP_07F772:
    LDA.W #$0008                  ;$07F772 |
    STA.W Obj_VAR9,Y              ;$07F775 |

CODE_JP_07F778:
    JSL.L CODE_FL_CBE6B5          ;$07F778 |
    JSL.L CODE_FL_00E091          ;$07F77C |
    TYX                           ;$07F780 |
    DEC.W Obj_VAR9,X              ;$07F781 |
    BEQ CODE_07F789               ;$07F784 |
    JMP.W CODE_JP_07F778          ;$07F786 |

CODE_07F789:
    JSL.L CODE_FL_00E097          ;$07F789 |
    TYX                           ;$07F78D |
    DEC.W Obj_VAR8,X              ;$07F78E |
    BEQ CODE_07F796               ;$07F791 |
    JMP.W CODE_JP_07F772          ;$07F793 |

CODE_07F796:
    LDA.W #$0008                  ;$07F796 |
    STA.W Obj_VAR8,Y              ;$07F799 |

CODE_JP_07F79C:
    JSL.L CODE_FL_CBE6B5          ;$07F79C |
    JSL.L CODE_FL_00E091          ;$07F7A0 |
    TYX                           ;$07F7A4 |
    DEC.W Obj_VAR8,X              ;$07F7A5 |
    BEQ CODE_07F7AD               ;$07F7A8 |
    JMP.W CODE_JP_07F79C          ;$07F7AA |

CODE_07F7AD:
    JSL.L CODE_FL_00E0D3          ;$07F7AD |
    LDA.W #$0004                  ;$07F7B1 |
    STA.W Obj_VAR8,Y              ;$07F7B4 |

CODE_JP_07F7B7:
    LDA.W #$0008                  ;$07F7B7 |
    STA.W Obj_VAR9,Y              ;$07F7BA |

CODE_JP_07F7BD:
    JSL.L CODE_FL_CBE6B5          ;$07F7BD |
    JSL.L CODE_FL_00E091          ;$07F7C1 |
    TYX                           ;$07F7C5 |
    DEC.W Obj_VAR9,X              ;$07F7C6 |
    BEQ CODE_07F7CE               ;$07F7C9 |
    JMP.W CODE_JP_07F7BD          ;$07F7CB |

CODE_07F7CE:
    JSL.L CODE_FL_00E097          ;$07F7CE |
    TYX                           ;$07F7D2 |
    DEC.W Obj_VAR8,X              ;$07F7D3 |
    BEQ CODE_07F7DB               ;$07F7D6 |
    JMP.W CODE_JP_07F7B7          ;$07F7D8 |

CODE_07F7DB:
    LDA.W #$0008                  ;$07F7DB |
    STA.W Obj_VAR8,Y              ;$07F7DE |

CODE_JP_07F7E1:
    JSL.L CODE_FL_CBE6B5          ;$07F7E1 |
    JSL.L CODE_FL_00E091          ;$07F7E5 |
    TYX                           ;$07F7E9 |
    DEC.W Obj_VAR8,X              ;$07F7EA |
    BEQ CODE_07F7F2               ;$07F7ED |
    JMP.W CODE_JP_07F7E1          ;$07F7EF |

CODE_07F7F2:
    JSL.L CODE_FL_00E10F          ;$07F7F2 |
    LDA.W #$0002                  ;$07F7F6 |
    STA.W Obj_VAR8,Y              ;$07F7F9 |

CODE_JP_07F7FC:
    LDA.W #$0008                  ;$07F7FC |
    STA.W Obj_VAR9,Y              ;$07F7FF |

CODE_JP_07F802:
    JSL.L CODE_FL_CBE6B5          ;$07F802 |
    JSL.L CODE_FL_00E091          ;$07F806 |
    TYX                           ;$07F80A |
    DEC.W Obj_VAR9,X              ;$07F80B |
    BEQ CODE_07F813               ;$07F80E |
    JMP.W CODE_JP_07F802          ;$07F810 |

CODE_07F813:
    JSL.L CODE_FL_00E097          ;$07F813 |
    TYX                           ;$07F817 |
    DEC.W Obj_VAR8,X              ;$07F818 |
    BEQ CODE_07F820               ;$07F81B |
    JMP.W CODE_JP_07F7FC          ;$07F81D |

CODE_07F820:
    JMP.W CODE_JP_07F768          ;$07F820 |

CODE_07F823:
    LDA.W #$AB90                  ;$07F823 |
    STA.W Obj_DrawCallback,Y      ;$07F826 |
    LDA.W #$A6EC                  ;$07F829 |
    STA.W Obj_TickLoopCallback,Y  ;$07F82C |
    LDA.W #$FFFF                  ;$07F82F |
    LDX.W #$00FF                  ;$07F832 |
    JSL.L CODE_FL_00E1CC          ;$07F835 |
    LDA.W #$FFFF                  ;$07F839 |
    STA.W Obj_Pose,Y              ;$07F83C |
    LDA.W #$00FF                  ;$07F83F |
    JSL.L CODE_FL_00E17F          ;$07F842 |
    LDA.W #$00FF                  ;$07F846 |
    JSL.L CODE_FL_00E17F          ;$07F849 |
    LDA.W #$003C                  ;$07F84D |
    JSL.L CODE_FL_00E17F          ;$07F850 |
    LDA.W #$00C8                  ;$07F854 |
    JSL.L CODE_FL_00E17F          ;$07F857 |
    TYX                           ;$07F85B |
    STZ.W Obj_VAR0,X              ;$07F85C |
    LDA.W #$001F                  ;$07F85F |
    STA.W Obj_VAR8,Y              ;$07F862 |

CODE_JP_07F865:
    JSL.L CODE_FL_07F87C          ;$07F865 |
    JSL.L CODE_FL_00E091          ;$07F869 |
    TYX                           ;$07F86D |
    DEC.W Obj_VAR8,X              ;$07F86E |
    BEQ CODE_07F876               ;$07F871 |
    JMP.W CODE_JP_07F865          ;$07F873 |

CODE_07F876:
    JSL.L CODE_FL_00E091          ;$07F876 |
    BRA CODE_07F876               ;$07F87A |

CODE_FL_07F87C:
    LDA.W Obj_VAR0,Y              ;$07F87C |
    CLC                           ;$07F87F |
    ADC.W #$D1CD                  ;$07F880 |
    LDX.W #$0007                  ;$07F883 |
    LDY.W #$5010                  ;$07F886 |
    JSL.L WritePal                ;$07F889 |
    LDY.B $39                     ;$07F88D |
    LDA.W Obj_VAR0,Y              ;$07F88F |
    CLC                           ;$07F892 |
    ADC.W #$0020                  ;$07F893 |
    STA.W Obj_VAR0,Y              ;$07F896 |
    RTL                           ;$07F899 |

CODE_07F89A:
    LDA.W #$A6EC                  ;$07F89A |
    STA.W Obj_TickLoopCallback,Y   ;$07F89D |
    LDA.W #$FFFF                  ;$07F8A0 |
    LDX.W #$00FF                  ;$07F8A3 |
    JSL.L CODE_FL_00E1CC          ;$07F8A6 |
    LDA.W #$FFFF                  ;$07F8AA |
    STA.W Obj_Pose,Y              ;$07F8AD |
    LDA.W #$F991                  ;$07F8B0 |
    LDX.W #$0007                  ;$07F8B3 |
    JSL.L CODE_FL_00E1B7          ;$07F8B6 |
    TYX                           ;$07F8BA |
    STZ.W Obj_VAR0,X              ;$07F8BB |
    LDA.W #$0AF8                  ;$07F8BE |
    STA.W CameraY_TileMirror                   ;$07F8C1 |
    STA.W $303F                   ;$07F8C4 |
    LDX.W #$05EA                  ;$07F8C7 |
    LDA.W #$000E                  ;$07F8CA |
    JSL.L CODE_FL_01DE76          ;$07F8CD |
    LDY.B $39                     ;$07F8D1 |
    LDA.W #$00C8                  ;$07F8D3 |
    JSL.L CODE_FL_00E17F          ;$07F8D6 |
    LDX.W #$05EC                  ;$07F8DA |
    LDA.W #$000E                  ;$07F8DD |
    JSL.L CODE_FL_01DE76          ;$07F8E0 |
    LDY.B $39                     ;$07F8E4 |
    LDA.W #$00C8                  ;$07F8E6 |
    JSL.L CODE_FL_00E17F          ;$07F8E9 |
    SEP #$20                      ;$07F8ED |
    LDA.W MainScreenDesignation   ;$07F8EF |
    AND.B #$13                    ;$07F8F2 |
    STA.W MainScreenDesignation   ;$07F8F4 |
    REP #$20                      ;$07F8F7 |
    JSL.L CODE_FL_07EC1C          ;$07F8F9 |
    LDA.W #$006E                  ;$07F8FD |
    JSL.L CODE_FL_00E17F          ;$07F900 |
    LDA.W #$0080                  ;$07F904 |
    STA.W Obj_VAR8,Y              ;$07F907 |

CODE_JP_07F90A:
    LDA.W #$D800                  ;$07F90A |
    CLC                           ;$07F90D |
    ADC.W $7354                   ;$07F90E |
    STA.W $7354                   ;$07F911 |
    STA.W $7352                   ;$07F914 |
    LDA.W $7344                   ;$07F917 |
    ADC.W #$FFFF                  ;$07F91A |
    STA.W $7344                   ;$07F91D |
    STA.W $7342                   ;$07F920 |
    JSL.L CODE_FL_00E091          ;$07F923 |
    TYX                           ;$07F927 |
    DEC.W Obj_VAR8,X              ;$07F928 |
    BEQ CODE_07F930               ;$07F92B |
    JMP.W CODE_JP_07F90A          ;$07F92D |

CODE_07F930:
    STZ.W CameraY_TileMirror      ;$07F930 |
    STZ.W $7342                   ;$07F933 |
    STZ.W $7352                   ;$07F936 |
    %LoadLongToAX(DMA_07FA7F)
    JSL.L LoadDMATable            ;$07F93F |
    %LoadLongToAX(Pal_07F9DB)
    LDY.W #$0010                  ;$07F949 |
    JSL.L WritePal                ;$07F94C |
    LDY.B $39                     ;$07F950 |
    SEP #$20                      ;$07F952 |
    LDA.B #$12                    ;$07F954 |
    STA.W CGADSUB_Settings        ;$07F956 |
    REP #$20                      ;$07F959 |
    LDA.W #$0080                  ;$07F95B |
    STA.W Obj_VAR8,Y              ;$07F95E |

CODE_JP_07F961:
    LDA.W #$2800                  ;$07F961 |
    CLC                           ;$07F964 |
    ADC.W $7354                   ;$07F965 |
    STA.W $7354                   ;$07F968 |
    LDA.W $7344                   ;$07F96B |
    ADC.W #$0000                  ;$07F96E |
    STA.W $7344                   ;$07F971 |
    JSL.L CODE_FL_00E091          ;$07F974 |
    TYX                           ;$07F978 |
    DEC.W Obj_VAR8,X              ;$07F979 |
    BEQ CODE_07F981               ;$07F97C |
    JMP.W CODE_JP_07F961          ;$07F97E |

CODE_07F981:
    STZ.W $7344                   ;$07F981 |
    STZ.W $7354                   ;$07F984 |
    LDA.W #$FFFF                  ;$07F987 |
    STA.W $7B2B                   ;$07F98A |
    JML.L DestroyUsedObject       ;$07F98D |
    LDX.W #$0000                  ;$07F991 |
    JSL.L CODE_FL_00A8D2          ;$07F994 |
    LDX.W #$0002                  ;$07F998 |
    JSL.L CODE_FL_00A8D2          ;$07F99B |
    LDX.W Obj_VAR0,Y              ;$07F99F |
    LDA.L DATA16_07F9C7,X         ;$07F9A2 |
    BEQ CODE_07F9C6               ;$07F9A6 |
    STA.B IdentifySNES            ;$07F9A8 |
    LDA.W $303F                   ;$07F9AA |
    CMP.B IdentifySNES            ;$07F9AD |
    BCS CODE_07F9C6               ;$07F9AF |
    LDA.W Obj_VAR0,Y              ;$07F9B1 |
    CLC                           ;$07F9B4 |
    ADC.W #$0004                  ;$07F9B5 |
    STA.W Obj_VAR0,Y              ;$07F9B8 |
    LDA.L PTR16_07F9C9,X          ;$07F9BB |
    LDX.W #$0007                  ;$07F9BF |
    JML.L LoadDMATable            ;$07F9C2 |

CODE_07F9C6:
    RTL                           ;$07F9C6 |

DATA16_07F9C7:
    dw $09F8                      ;$07F9C7 |
PTR16_07F9C9:
    dw DMA_07FA1C                  ;$07F9C9 |
    dw $08F8                      ;$07F9CB |
    dw DMA_07F9FB                 ;$07F9CD |
    dw $07F8                      ;$07F9CF |
    dw DMA_07FA5E                 ;$07F9D1 |
    dw $06F8                      ;$07F9D3 |
    dw DMA_07FA3D                 ;$07F9D5 |
    dw $0000,$0000

Pal_07F9DB:
    dw $0000,$0000                ;$07F9D7 |
    dw $0000,$0000,$0000,$0000    ;$07F9DF |
    dw $0000,$0000,$0000,$0000    ;$07F9E7 |
    dw $0000,$0000,$0000,$0000    ;$07F9EF |
    dw $0000,$0000                ;$07F9F7 |

DMA_07F9FB:
    db $09 : dw $0400 : dl $7E2000 : dw $4800
    db $0F : dw $0400 : dl $7E2400 : dw $4800
    db $09 : dw $0400 : dl $7E2800 : dw $5800
    db $0F : dw $0400 : dl $7E2C00 : dw $5800
    db $FF

DMA_07FA1C:
    db $09 : dw $0400 : dl $7E2000 : dw $4C00
    db $0F : dw $0400 : dl $7E2400 : dw $4C00
    db $09 : dw $0400 : dl $7E3000 : dw $5C00
    db $0F : dw $0400 : dl $7E3400 : dw $5C00
    db $FF

DMA_07FA3D:
    db $09 : dw $0400 : dl $7E2000 : dw $4800
    db $0F : dw $0400 : dl $7E2400 : dw $4800
    db $09 : dw $0400 : dl $7E4000 : dw $5800
    db $0F : dw $0400 : dl $7E4400 : dw $5800
    db $FF

DMA_07FA5E:
    db $09 : dw $0400 : dl $7E2000 : dw $4C00
    db $0F : dw $0400 : dl $7E2400 : dw $4C00
    db $09 : dw $0400 : dl $7E4800 : dw $5C00
    db $0F : dw $0400 : dl $7E4C00 : dw $5C00
    db $FF

DMA_07FA7F:
    db $09 : dw $0400 : dl $7E3800 : dw $4800
    db $0F : dw $0400 : dl $7E3C00 : dw $4800
    db $FF


Empty_07FA8F:				  ;$07FA8F | Unused.
	padbyte $FF : pad $07FFFF