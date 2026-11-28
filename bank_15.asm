ORG $CA8000

    BEQ CODE_15800C               ;$CA8000 |
    STZ.W $7A73                   ;$CA8002 |
    JSL.L CODE_FL_CA81D7          ;$CA8005 |
    JMP.W CODE_JP_158158          ;$CA8009 |

CODE_15800C:
    LDA.W P1_Hold                 ;$CA800C |
    AND.W #$0200                  ;$CA800F |
    BEQ CODE_158023               ;$CA8012 |
    LDA.W #$7E52                  ;$CA8014 |
    LDY.W #$00CA                  ;$CA8017 |
    LDX.B $39                     ;$CA801A |
    JSL.L CODE_FL_008F64          ;$CA801C |
    JMP.W CODE_JP_158158          ;$CA8020 |

CODE_158023:
    LDA.W P1_Hold                 ;$CA8023 |
    AND.W #$0100                  ;$CA8026 |
    BEQ CODE_158049               ;$CA8029 |
    LDA.W $7A65                   ;$CA802B |
    AND.W #$00FF                  ;$CA802E |
    STA.B $28                     ;$CA8031 |
    LDA.W $7A63                   ;$CA8033 |
    AND.W #$00FF                  ;$CA8036 |
    CMP.B $28                     ;$CA8039 |
    BMI CODE_158049               ;$CA803B |
    LDA.W #$7E72                  ;$CA803D |
    LDY.W #$00CA                  ;$CA8040 |
    LDX.B $39                     ;$CA8043 |
    JSL.L CODE_FL_008F64          ;$CA8045 |

CODE_158049:
    JMP.W CODE_JP_158158          ;$CA8049 |
    LDA.W P1_Hold                 ;$CA804C |
    AND.W #$C0C0                  ;$CA804F |
    BEQ CODE_15805E               ;$CA8052 |
    STZ.W $7A73                   ;$CA8054 |
    JSL.L CODE_FL_CA81D7          ;$CA8057 |
    JMP.W CODE_JP_158158          ;$CA805B |

CODE_15805E:
    LDA.W P1_Hold                 ;$CA805E |
    AND.W #$0400                  ;$CA8061 |
    BEQ CODE_158075               ;$CA8064 |
    LDA.W #$7E9E                  ;$CA8066 |
    LDY.W #$00CA                  ;$CA8069 |
    LDX.B $39                     ;$CA806C |
    JSL.L CODE_FL_008F64          ;$CA806E |
    JMP.W CODE_JP_158158          ;$CA8072 |

CODE_158075:
    LDA.W P1_Hold                 ;$CA8075 |
    AND.W #$0100                  ;$CA8078 |
    BEQ CODE_15809E               ;$CA807B |
    LDA.W $7A65                   ;$CA807D |
    AND.W #$00FF                  ;$CA8080 |
    STA.B $28                     ;$CA8083 |
    LDA.W $7A63                   ;$CA8085 |
    AND.W #$00FF                  ;$CA8088 |
    CMP.B $28                     ;$CA808B |
    BMI CODE_15809E               ;$CA808D |
    LDA.W #$7ECA                  ;$CA808F |
    LDY.W #$00CA                  ;$CA8092 |
    LDX.B $39                     ;$CA8095 |
    JSL.L CODE_FL_008F64          ;$CA8097 |
    JMP.W CODE_JP_158158          ;$CA809B |

CODE_15809E:
    LDA.W P1_Hold                 ;$CA809E |
    AND.W #$0800                  ;$CA80A1 |
    BEQ CODE_1580C5               ;$CA80A4 |
    LDA.W $7A64                   ;$CA80A6 |
    AND.W #$00FF                  ;$CA80A9 |
    ASL A                         ;$CA80AC |
    TAX                           ;$CA80AD |
    JMP.W (PTR16_1580B1,X)        ;$CA80AE |
PTR16_1580B1:
    dw CODE_1580C5                ;$CA80B1 |
    dw CODE_1580C5                ;$CA80B3 |
    dw CODE_1580B9                ;$CA80B5 |
    dw CODE_1580B9                ;$CA80B7 |

CODE_1580B9:
    LDA.W #$7EEA                  ;$CA80B9 |
    LDY.W #$00CA                  ;$CA80BC |
    LDX.B $39                     ;$CA80BF |
    JSL.L CODE_FL_008F64          ;$CA80C1 |

CODE_1580C5:
    JMP.W CODE_JP_158158          ;$CA80C5 |
    LDA.W P1_Hold                 ;$CA80C8 |
    AND.W #$C0C0                  ;$CA80CB |
    BEQ CODE_1580DA               ;$CA80CE |
    STZ.W $7A73                   ;$CA80D0 |
    JSL.L CODE_FL_CA81D7          ;$CA80D3 |
    JMP.W CODE_JP_158158          ;$CA80D7 |

CODE_1580DA:
    LDA.W P1_Hold                 ;$CA80DA |
    AND.W #$0400                  ;$CA80DD |
    BEQ CODE_1580EE               ;$CA80E0 |
    LDA.W #$7F2A                  ;$CA80E2 |
    LDY.W #$00CA                  ;$CA80E5 |
    LDX.B $39                     ;$CA80E8 |
    JSL.L CODE_FL_008F64          ;$CA80EA |

CODE_1580EE:
    JMP.W CODE_JP_158158          ;$CA80EE |
    LDA.W P1_Hold                 ;$CA80F1 |
    AND.W #$C0C0                  ;$CA80F4 |
    BEQ CODE_158103               ;$CA80F7 |
    STZ.W $7A73                   ;$CA80F9 |
    JSL.L CODE_FL_CA81D7          ;$CA80FC |
    JMP.W CODE_JP_158158          ;$CA8100 |

CODE_158103:
    LDA.W P1_Hold                 ;$CA8103 |
    AND.W #$0400                  ;$CA8106 |
    BEQ CODE_158117               ;$CA8109 |
    LDA.W #$7E2C                  ;$CA810B |
    LDY.W #$00CA                  ;$CA810E |
    LDX.B $39                     ;$CA8111 |
    JSL.L CODE_FL_008F64          ;$CA8113 |

CODE_158117:
    JMP.W CODE_JP_158158          ;$CA8117 |
    LDA.W P1_Hold                 ;$CA811A |
    AND.W #$C0C0                  ;$CA811D |
    BEQ CODE_15812C               ;$CA8120 |
    STZ.W $7A73                   ;$CA8122 |
    JSL.L CODE_FL_CA81D7          ;$CA8125 |
    JMP.W CODE_JP_158158          ;$CA8129 |

CODE_15812C:
    LDA.W P1_Hold                 ;$CA812C |
    AND.W #$0100                  ;$CA812F |
    BEQ CODE_158140               ;$CA8132 |
    LDA.W #$7F0A                  ;$CA8134 |
    LDY.W #$00CA                  ;$CA8137 |
    LDX.B $39                     ;$CA813A |
    JSL.L CODE_FL_008F64          ;$CA813C |

CODE_158140:
    JMP.W CODE_JP_158158          ;$CA8140 |
    JMP.W CODE_JP_158158          ;$CA8143 |
    JMP.W CODE_JP_158158          ;$CA8146 |
    LDA.W #$7D58                  ;$CA8149 |
    LDY.W #$00CA                  ;$CA814C |
    LDX.B $39                     ;$CA814F |
    JSL.L CODE_FL_008F64          ;$CA8151 |
    JMP.W CODE_JP_158158          ;$CA8155 |

CODE_JP_158158:
    LDY.B $39                     ;$CA8158 |
    LDA.W Obj_VAR4,Y              ;$CA815A |
    INC A                         ;$CA815D |
    AND.W #$003F                  ;$CA815E |
    STA.W Obj_VAR4,Y              ;$CA8161 |
    LSR A                         ;$CA8164 |
    LSR A                         ;$CA8165 |
    LSR A                         ;$CA8166 |
    LSR A                         ;$CA8167 |
    ASL A                         ;$CA8168 |
    TAX                           ;$CA8169 |
    LDA.L DATA16_CA8172,X         ;$CA816A |
    STA.W Obj_Pose,Y              ;$CA816E |
    RTL                           ;$CA8171 |

DATA16_CA8172:
    dw $0000,$0001,$0002,$0001    ;$CA8172 |

    LDA.W $7A67                   ;$CA817A |
    AND.W #$00FF                  ;$CA817D |
    BNE CODE_1581AD               ;$CA8180 |
    LDA.W #$0000                  ;$CA8182 |
    STA.W ObjVar0_Temp            ;$CA8185 |
    LDA.W #$000A                  ;$CA8188 |
    STA.W ObjVar1_Temp            ;$CA818B |
    TYA                           ;$CA818E |
    STA.W ObjVar2_Temp            ;$CA818F |
    STZ.W ObjVar3_Temp            ;$CA8192 |
    STZ.W ObjVar4_Temp            ;$CA8195 |
    LDA.W #$0018                  ;$CA8198 |
    STA.W ObjSlotMinimum          ;$CA819B |
    LDA.W #$0040                  ;$CA819E |
    STA.W ObjSlotMaximum          ;$CA81A1 |
    LDA.W #$0010                  ;$CA81A4 |
    JSL.L CreateNewObject         ;$CA81A7 |
    LDY.B $39                     ;$CA81AB |

CODE_1581AD:
    RTL                           ;$CA81AD |
    LDA.W $7A63                   ;$CA81AE |
    AND.W #$00FF                  ;$CA81B1 |
    STA.B $28                     ;$CA81B4 |
    LDX.W #$0001                  ;$CA81B6 |
    LDA.W $7A68                   ;$CA81B9 |
    AND.W #$00FF                  ;$CA81BC |
    CMP.B $28                     ;$CA81BF |
    BPL CODE_9581D3               ;$CA81C1 |
    CMP.W #$0004                  ;$CA81C3 |
    BEQ CODE_9581D3               ;$CA81C6 |
    SEP #$20                      ;$CA81C8 |
    LDA.W $7A63                   ;$CA81CA |
    STA.W $7A68                   ;$CA81CD |
    REP #$20                      ;$CA81D0 |
    DEX                           ;$CA81D2 |

CODE_9581D3:
    STX.W $7A79                   ;$CA81D3 |
    RTL                           ;$CA81D6 |
    LDA.W #$7D94                  ;$CA81D7 |
    LDY.W #$00CA                  ;$CA81DA |
    LDX.B $39                     ;$CA81DD |
    JSL.L CODE_FL_008F64          ;$CA81DF |
    RTL                           ;$CA81E3 |
    LDA.W #$0000                  ;$CA81E4 |
    SEP #$20                      ;$CA81E7 |
    LDA.B #$01                    ;$CA81E9 |
    STA.W $7A65                   ;$CA81EB |
    REP #$20                      ;$CA81EE |
    RTL                           ;$CA81F0 |
    LDA.W #$0000                  ;$CA81F1 |
    SEP #$20                      ;$CA81F4 |
    LDA.B #$02                    ;$CA81F6 |
    STA.W $7A65                   ;$CA81F8 |
    REP #$20                      ;$CA81FB |
    RTL                           ;$CA81FD |
    LDA.W #$0000                  ;$CA81FE |
    SEP #$20                      ;$CA8201 |
    LDA.B #$03                    ;$CA8203 |
    STA.W $7A65                   ;$CA8205 |
    REP #$20                      ;$CA8208 |
    RTL                           ;$CA820A |
    LDA.W #$0000                  ;$CA820B |
    SEP #$20                      ;$CA820E |
    LDA.B #$04                    ;$CA8210 |
    STA.W $7A65                   ;$CA8212 |
    REP #$20                      ;$CA8215 |
    RTL                           ;$CA8217 |
    LDA.W #$0000                  ;$CA8218 |
    SEP #$20                      ;$CA821B |
    LDA.B #$05                    ;$CA821D |
    STA.W $7A65                   ;$CA821F |
    REP #$20                      ;$CA8222 |
    RTL                           ;$CA8224 |
    LDA.W #$0000                  ;$CA8225 |
    SEP #$20                      ;$CA8228 |
    LDA.B #$06                    ;$CA822A |
    STA.W $7A65                   ;$CA822C |
    REP #$20                      ;$CA822F |
    RTL                           ;$CA8231 |
    LDA.W #$0000                  ;$CA8232 |
    SEP #$20                      ;$CA8235 |
    LDA.B #$07                    ;$CA8237 |
    STA.W $7A65                   ;$CA8239 |
    REP #$20                      ;$CA823C |
    RTL                           ;$CA823E |
    LDY.B $39                     ;$CA823F |
    LDA.W $7A65                   ;$CA8241 |
    AND.W #$00FF                  ;$CA8244 |
    BNE CODE_958256               ;$CA8247 |
    LDA.W $7A63                   ;$CA8249 |
    AND.W #$00FF                  ;$CA824C |
    SEP #$20                      ;$CA824F |
    STA.W $7A65                   ;$CA8251 |
    REP #$20                      ;$CA8254 |

CODE_958256:
    ASL A                         ;$CA8256 |
    TAX                           ;$CA8257 |
    LDA.L DATA16_CA8267,X         ;$CA8258 |
    STA.W Obj_XPosition,Y         ;$CA825C |
    LDA.L DATA16_CA8277,X         ;$CA825F |
    STA.W Obj_YPosition,Y         ;$CA8263 |
    RTL                           ;$CA8266 |

DATA16_CA8267:
    dw $0034,$0034,$007A,$0099    ;$CA8267 |
    dw $00A8,$00CF,$0042,$0090    ;$CA826F |

DATA16_CA8277:
    dw $00A2,$00A2,$0084,$00AB    ;$CA8277 |
    dw $005E,$004A,$0056,$0042    ;$CA827F |

AS_CA8287:
    db $33,$5B,$00,$14            ;$CA8287 |	ActionScript
    dl PTR16_CDE526               ;$CA828B |
    db $26,$E0,$00,$27,$3E,$00,$24;$CA828E |

AS_CA8295:
    db $80,$40,$00,$4A,$06,$80,$C0,$FF;$CA8295 |
    db $90,$40,$00,$4A,$04,$80,$80,$FF;$CA829D |
    db $4A,$06,$80,$00,$FF,$90,$20,$00;$CA82A5 |
    db $4A,$05,$4A,$06,$90,$E0,$FF,$4A;$CA82AD |
    db $04,$4A,$06,$80,$80,$FF,$90,$C0;$CA82B5 |
    db $FF,$4A,$05,$80,$C0,$FF,$4A,$09;$CA82BD |
    db $80,$40,$00,$90,$C0,$FF,$4A,$07;$CA82C5 |
    db $80,$80,$00,$4A,$09,$80,$00,$01;$CA82CD |
    db $90,$E0,$FF,$4A,$08,$4A,$09,$90;$CA82D5 |
    db $20,$00,$4A,$07,$4A,$09,$80,$80;$CA82DD |
    db $00,$90,$40,$00,$4A,$08,$0E;$CA82E5 |
    dw AS_CA8295                  ;$CA82EC |

AS_CA82EE:
    db $33,$5C,$00,$14            ;$CA82EE |
    dl PTR16_CDE526               ;$CA82F2 |
    db $26,$C8,$00,$27,$2B,$00,$24;$CA82F5 |

AS_CA82FC:
    db $40,$FF,$02,$50,$40,$12,$02,$50;$CA82FC |
    db $0E                        ;$CA8304 |
    dw AS_CA82FC                  ;$CA8305 |

AS_CA8307:
    db $C0                        ;$CA8307 |
    dl MoveCurrentScriptToSCPU    ;$CA8308 |
    db $02,$01,$C0                ;$CA830B |
    dl CODE_CA5FE6                ;$CA830E |
    db $33,$5D,$00,$14            ;$CA8311 |
    dl PTR16_CDE526               ;$CA8315 |
    db $26                        ;$CA8318 |
    dw $0080                      ;$CA8319 |
    db $27                        ;$CA831B |
    dw $0080                      ;$CA831C |
    db $03                        ;$CA831E |
    dl CODE_CA8446                ;$CA831F |
    db $24,$18,$77,$7A,$0F,$03    ;$CA8322 |
    dw AS_CA832E                  ;$CA8328 |
    dw AS_CA83A7                  ;$CA832A |
    dw AS_CA83A7                  ;$CA832C |

AS_CA832E:
    db $18,$79,$7A,$0F,$02        ;$CA832E |
    dw AS_CA8337                  ;$CA8333 |
    dw AS_CA83A7                  ;$CA8335 |

AS_CA8337:
    db $C0                        ;$CA8337 |
    dl CODE_FL_00A40B                ;$CA8338 |
    dw $7A63                      ;$CA833B |
    db $0F,$06                    ;$CA833D |
    dw AS_CA83BB                  ;$CA833F |
    dw AS_CA834B                  ;$CA8341 |
    dw AS_CA8362                  ;$CA8343 |
    dw AS_CA8379                  ;$CA8345 |
    dw AS_CA8390                  ;$CA8347 |
    dw AS_CA83DA                  ;$CA8349 |

AS_CA834B:
    db $C0                        ;$CA834B |
    dl CODE_FL_009B65                ;$CA834C |
    db $18,$40                    ;$CA834F |
    dw $0010,$0034,$00A2,$0000    ;$CA8351 |
    dw $0006                      ;$CA8359 |
    db $C0                        ;$CA835B |
    dl CODE_CA8431                ;$CA835C |
    db $40,$0B,$01                ;$CA835F |

AS_CA8362:
    db $C0                        ;$CA8362 |
    dl CODE_FL_009B65                ;$CA8363 |
    db $18,$40                    ;$CA8366 |
    dw $0010,$0034,$00A2,$0000    ;$CA8368 |
    dw $0007                      ;$CA8370 |
    db $C0                        ;$CA8372 |
    dl CODE_CA841D                ;$CA8373 |
    db $40,$0C,$01                ;$CA8376 |

AS_CA8379:
    db $C0                        ;$CA8379 |
    dl CODE_FL_009B65                ;$CA837A |
    db $18,$40                    ;$CA837D |
    dw $0010,$0034,$00A2,$0000    ;$CA837F |
    dw $0008                      ;$CA8387 |
    db $C0                        ;$CA8389 |
    dl CODE_CA8409                ;$CA838A |
    db $40,$0D,$01                ;$CA838D |

AS_CA8390:
    db $C0                        ;$CA8390 |
    dl CODE_FL_009B65                ;$CA8391 |
    db $18,$40                    ;$CA8394 |
    dw $0010,$0034,$00A2,$0000    ;$CA8396 |
    dw $0009                      ;$CA839E |
    db $C0                        ;$CA83A0 |
    dl CODE_CA83F5                ;$CA83A1 |
    db $40,$0E,$01                ;$CA83A4 |

AS_CA83A7:
    db $C0                        ;$CA83A7 |
    dl CODE_FL_00A40B                ;$CA83A8 |
    dw $7A63                      ;$CA83AB |
    db $0F,$06                    ;$CA83AD |
    dw AS_CA83BB                  ;$CA83AF |
    dw AS_CA83BE                  ;$CA83B1 |
    dw AS_CA83C5                  ;$CA83B3 |
    dw AS_CA83CC                  ;$CA83B5 |
    dw AS_CA83D3                  ;$CA83B7 |
    dw AS_CA83DA                  ;$CA83B9 |

AS_CA83BB:
    db $40,$0A,$01                ;$CA83BB |

AS_CA83BE:
    db $C0                        ;$CA83BE |
    dl CODE_CA8431                ;$CA83BF |
    db $40,$0B,$01                ;$CA83C2 |

AS_CA83C5:
    db $C0                        ;$CA83C5 |
    dl CODE_CA841D                ;$CA83C6 |
    db $40,$0C,$01                ;$CA83C9 |

AS_CA83CC:
    db $C0                        ;$CA83CC |
    dl CODE_CA8409                ;$CA83CD |
    db $40,$0D,$01                ;$CA83D0 |

AS_CA83D3:
    db $C0                        ;$CA83D3 |
    dl CODE_CA83F5                ;$CA83D4 |
    db $40,$0E,$01                ;$CA83D7 |

AS_CA83DA:
    db $C0                        ;$CA83DA |
    dl CODE_CA83E1                ;$CA83DB |
    db $40,$0E,$01                ;$CA83DE |

CODE_CA83E1:
    LDX.W #$00B3                  ;$CA83E1 |
    JSL.L CODE_FL_009AEB          ;$CA83E4 |
    TAX                           ;$CA83E8 |
    LDA.W #$00CF                  ;$CA83E9 |
    STA.W Obj_VAR1,X              ;$CA83EC |
    LDA.W #$004B                  ;$CA83EF |
    STA.W Obj_VAR2,X              ;$CA83F2 |

CODE_CA83F5:
    LDX.W #$00B3                  ;$CA83F5 |
    JSL.L CODE_FL_009AEB          ;$CA83F8 |
    TAX                           ;$CA83FC |
    LDA.W #$00A8                  ;$CA83FD |
    STA.W Obj_VAR1,X              ;$CA8400 |
    LDA.W #$0060                  ;$CA8403 |
    STA.W Obj_VAR2,X              ;$CA8406 |

CODE_CA8409:
    LDX.W #$00B3                  ;$CA8409 |
    JSL.L CODE_FL_009AEB          ;$CA840C |
    TAX                           ;$CA8410 |
    LDA.W #$0099                  ;$CA8411 |
    STA.W Obj_VAR1,X              ;$CA8414 |
    LDA.W #$00AD                  ;$CA8417 |
    STA.W Obj_VAR2,X              ;$CA841A |

CODE_CA841D:
    LDX.W #$00B3                  ;$CA841D |
    JSL.L CODE_FL_009AEB          ;$CA8420 |
    TAX                           ;$CA8424 |
    LDA.W #$007A                  ;$CA8425 |
    STA.W Obj_VAR1,X              ;$CA8428 |
    LDA.W #$0088                  ;$CA842B |
    STA.W Obj_VAR2,X              ;$CA842E |

CODE_CA8431:
    LDX.W #$00B3                  ;$CA8431 |
    JSL.L CODE_FL_009AEB          ;$CA8434 |
    TAX                           ;$CA8438 |
    LDA.W #$0034                  ;$CA8439 |
    STA.W Obj_VAR1,X              ;$CA843C |
    LDA.W #$00A4                  ;$CA843F |
    STA.W Obj_VAR2,X              ;$CA8442 |
    RTL                           ;$CA8445 |

CODE_CA8446:
    LDX.B $39                     ;$CA8446 |
    LDA.W Obj_VAR4,X              ;$CA8448 |
    CMP.W #$0002                  ;$CA844B |
    BMI CODE_958479               ;$CA844E |
    STZ.W Obj_VAR4,X              ;$CA8450 |
    LDA.W Obj_VAR0,X              ;$CA8453 |
    CLC                           ;$CA8456 |
    ADC.W #$5FF9                  ;$CA8457 |
    LDX.W #$00CA                  ;$CA845A |
    LDY.W #$A010                  ;$CA845D |
    JSL.L WritePal                ;$CA8460 |
    LDY.B $39                     ;$CA8464 |
    LDA.W Obj_VAR0,Y              ;$CA8466 |
    CLC                           ;$CA8469 |
    ADC.W #$0020                  ;$CA846A |
    CMP.W #$0200                  ;$CA846D |
    BMI CODE_958475               ;$CA8470 |
    LDA.W #$0000                  ;$CA8472 |

CODE_958475:
    STA.W Obj_VAR0,Y              ;$CA8475 |
    RTL                           ;$CA8478 |

CODE_958479:
    INC.W Obj_VAR4,X              ;$CA8479 |
    RTL                           ;$CA847C |

AS_CA847D:
    db $C0                        ;$CA847D |	ActionScript
    dl MoveCurrentScriptToSCPU    ;$CA847E |
    db $26                        ;$CA8481 |
    dw $0080                      ;$CA8482 |
    db $27                        ;$CA8484 |
    dw $0080                      ;$CA8485 |
    db $33                        ;$CA8487 |
    dw $005E                      ;$CA8488 |
    db $14                        ;$CA848A |
    dl PTR16_CDE526               ;$CA848B |
    db $24,$03                    ;$CA848E |
    dl CODE_CA84AF                ;$CA8490 |
    db $C0                        ;$CA8493 |
    dl CODE_FL_00A40B                ;$CA8494 |
    dw $7A64                      ;$CA8497 |
    db $0F,$04                    ;$CA8499 |
    dw AS_CA84A3                  ;$CA849B |
    dw AS_CA84A6                  ;$CA849D |
    dw AS_CA84A9                  ;$CA849F |
    dw AS_CA84AC                  ;$CA84A1 |

AS_CA84A3:
    db $40,$FF,$01                ;$CA84A3 |

AS_CA84A6:
    db $40,$0F,$01                ;$CA84A6 |

AS_CA84A9:
    db $40,$10,$01                ;$CA84A9 |

AS_CA84AC:
    db $40,$11,$01                ;$CA84AC |

CODE_CA84AF:
    LDX.B $39                     ;$CA84AF |
    LDA.W Obj_VAR4,X              ;$CA84B1 |
    CMP.W #$0002                  ;$CA84B4 |
    BMI CODE_9584E2               ;$CA84B7 |
    STZ.W Obj_VAR4,X              ;$CA84B9 |
    LDA.W Obj_VAR0,X              ;$CA84BC |
    CLC                           ;$CA84BF |
    ADC.W #$6279                  ;$CA84C0 |
    LDX.W #$00CA                  ;$CA84C3 |
    LDY.W #$B010                  ;$CA84C6 |
    JSL.L WritePal                ;$CA84C9 |
    LDY.B $39                     ;$CA84CD |
    LDA.W Obj_VAR0,Y              ;$CA84CF |
    CLC                           ;$CA84D2 |
    ADC.W #$0020                  ;$CA84D3 |
    CMP.W #$0200                  ;$CA84D6 |
    BMI CODE_9584DE               ;$CA84D9 |
    LDA.W #$0000                  ;$CA84DB |

CODE_9584DE:
    STA.W Obj_VAR0,Y              ;$CA84DE |
    RTL                           ;$CA84E1 |

CODE_9584E2:
    INC.W Obj_VAR4,X              ;$CA84E2 |
    RTL                           ;$CA84E5 |
    db $C0,$6C,$92,$00,$26,$80,$00,$27;$CA84E6 |
    db $80,$00,$33,$5E,$00,$14,$26,$E5;$CA84EE |
    db $CD,$24,$18,$77,$7A,$0F,$03,$03;$CA84F6 |
    db $85,$06,$85,$1A,$85,$40,$FF,$01;$CA84FE |
    db $C0,$32,$85,$CA,$05,$1E,$41,$0F;$CA8506 |
    db $41,$FF,$07,$40,$0F,$02,$1E,$C0;$CA850E |
    db $2E,$85,$CA,$01,$C0,$32,$85,$CA;$CA8516 |
    db $05,$1E,$41,$10,$41,$FF,$07,$40;$CA851E |
    db $10,$02,$1E,$C0,$2E,$85,$CA,$01;$CA8526 |
    STZ.W $7A73                   ;$CA852E |
    RTL                           ;$CA8531 |
    LDA.W $7A64                   ;$CA8532 |
    AND.W #$00FF                  ;$CA8535 |
    STA.B $28                     ;$CA8538 |
    LDA.W $7A77                   ;$CA853A |
    ORA.B $28                     ;$CA853D |
    SEP #$20                      ;$CA853F |
    STA.W $7A64                   ;$CA8541 |
    REP #$20                      ;$CA8544 |
    STZ.W $7A77                   ;$CA8546 |
    RTL                           ;$CA8549 |
    db $C0,$6C,$92,$00,$02,$01,$33,$5E;$CA854A |
    db $00,$14,$26,$E5,$CD,$26,$80,$00;$CA8552 |
    db $27,$80,$00,$C0,$6D,$85,$CA,$05;$CA855A |
    db $1E,$41,$0B,$41,$FF,$07,$C0,$77;$CA8562 |
    db $85,$CA,$00                ;$CA856A |
    LDX.W Obj_VAR2,Y              ;$CA856D |
    LDA.W #$000A                  ;$CA8570 |
    STA.W Obj_Pose,X              ;$CA8573 |
    RTL                           ;$CA8576 |
    LDX.W Obj_VAR2,Y              ;$CA8577 |
    LDA.W #$000B                  ;$CA857A |
    STA.W Obj_Pose,X              ;$CA857D |
    RTL                           ;$CA8580 |
    db $33,$5E,$00,$14,$26,$E5,$CD,$26;$CA8581 |
    db $80,$00,$27,$80,$00,$C0,$9E,$85;$CA8589 |
    db $CA,$05,$1E,$41,$13,$41,$FF,$07;$CA8591 |
    db $C0,$A8,$85,$CA,$00        ;$CA8599 |
    LDX.W Obj_VAR2,Y              ;$CA859E |
    LDA.W #$000B                  ;$CA85A1 |
    STA.W Obj_Pose,X              ;$CA85A4 |
    RTL                           ;$CA85A7 |
    LDX.W Obj_VAR2,Y              ;$CA85A8 |
    LDA.W #$000C                  ;$CA85AB |
    STA.W Obj_Pose,X              ;$CA85AE |
    RTL                           ;$CA85B1 |
    db $33,$5E,$00,$14,$26,$E5,$CD,$26;$CA85B2 |
    db $80,$00,$27,$80,$00,$C0,$CF,$85;$CA85BA |
    db $CA,$05,$1E,$41,$14,$41,$FF,$07;$CA85C2 |
    db $C0,$D9,$85,$CA,$00        ;$CA85CA |
    LDX.W Obj_VAR2,Y              ;$CA85CF |
    LDA.W #$000C                  ;$CA85D2 |
    STA.W Obj_Pose,X              ;$CA85D5 |
    RTL                           ;$CA85D8 |
    LDX.W Obj_VAR2,Y              ;$CA85D9 |
    LDA.W #$000D                  ;$CA85DC |
    STA.W Obj_Pose,X              ;$CA85DF |
    RTL                           ;$CA85E2 |
    db $33,$5E,$00,$14,$26,$E5,$CD,$26;$CA85E3 |
    db $80,$00,$27,$80,$00,$C0,$00,$86;$CA85EB |
    db $CA,$05,$1E,$41,$15,$41,$FF,$07;$CA85F3 |
    db $C0,$0A,$86,$CA,$00        ;$CA85FB |
    LDX.W Obj_VAR2,Y              ;$CA8600 |
    LDA.W #$000D                  ;$CA8603 |
    STA.W Obj_Pose,X              ;$CA8606 |
    RTL                           ;$CA8609 |
    LDX.W Obj_VAR2,Y              ;$CA860A |
    LDA.W #$000E                  ;$CA860D |
    STA.W Obj_Pose,X              ;$CA8610 |
    RTL                           ;$CA8613 |
    db $C0,$6C,$92,$00,$02,$01,$33,$60;$CA8614 |
    db $00,$14,$26,$E5,$CD,$24,$40,$03;$CA861C |
    db $C0,$46,$8A,$CA,$18,$77,$7A,$0F;$CA8624 |
    db $03,$38,$86,$33,$86,$33,$86,$03;$CA862C |
    db $92,$8A,$CA,$01,$24,$C0,$CD,$89;$CA8634 |
    db $CA,$C0,$0B,$A4,$00,$66,$7A,$0F;$CA863C |
    db $08,$55,$86,$55,$86,$5A,$86,$5F;$CA8644 |
    db $86,$64,$86,$69,$86,$6E,$86,$73;$CA864C |
    db $86,$03,$E6,$87,$CA,$01,$03,$FF;$CA8654 |
    db $87,$CA,$01,$03,$5B,$88,$CA,$01;$CA865C |
    db $03,$A5,$88,$CA,$01,$03,$13,$89;$CA8664 |
    db $CA,$01,$03,$2C,$89,$CA,$01,$03;$CA866C |
    db $45,$89,$CA,$01,$24,$03,$BB,$89;$CA8674 |
    db $CA,$01,$24,$03,$5E,$89,$CA,$80;$CA867C |
    db $80,$00,$02,$5E,$24,$90,$80,$FF;$CA8684 |
    db $02,$38,$24,$80,$80,$00,$02,$2E;$CA868C |
    db $24,$C0,$F8,$89,$CA,$03,$BE,$89;$CA8694 |
    db $CA,$01,$24,$03,$5E,$89,$CA,$80;$CA869C |
    db $80,$FF,$02,$2E,$24,$90,$80,$00;$CA86A4 |
    db $02,$38,$24,$80,$80,$FF,$02,$5E;$CA86AC |
    db $24,$C0,$EB,$89,$CA,$03,$BE,$89;$CA86B4 |
    db $CA,$01,$24,$03,$5E,$89,$CA,$90;$CA86BC |
    db $80,$00,$02,$4A,$24,$80,$80,$00;$CA86C4 |
    db $02,$3E,$24,$C0,$05,$8A,$CA,$03;$CA86CC |
    db $BE,$89,$CA,$01,$24,$03,$5E,$89;$CA86D4 |
    db $CA,$90,$80,$FF,$02,$3A,$24,$80;$CA86DC |
    db $80,$FF,$02,$6E,$24,$90,$80,$FF;$CA86E4 |
    db $02,$28,$24,$C0,$2C,$8A,$CA,$03;$CA86EC |
    db $BE,$89,$CA,$01,$24,$03,$5E,$89;$CA86F4 |
    db $CA,$90,$80,$00,$02,$28,$24,$80;$CA86FC |
    db $80,$00,$02,$6E,$24,$90,$80,$00;$CA8704 |
    db $02,$3A,$24,$C0,$F8,$89,$CA,$03;$CA870C |
    db $BE,$89,$CA,$01,$24,$03,$5E,$89;$CA8714 |
    db $CA,$80,$80,$FF,$02,$3E,$24,$90;$CA871C |
    db $80,$FF,$02,$4A,$24,$C0,$F8,$89;$CA8724 |
    db $CA,$03,$BE,$89,$CA,$01,$24,$03;$CA872C |
    db $5E,$89,$CA,$80,$80,$00,$02,$4E;$CA8734 |
    db $24,$90,$80,$FF,$02,$70,$24,$80;$CA873C |
    db $80,$FF,$02,$30,$24,$90,$80,$FF;$CA8744 |
    db $02,$2A,$24,$C0,$12,$8A,$CA,$03;$CA874C |
    db $BE,$89,$CA,$01,$24,$03,$5E,$89;$CA8754 |
    db $CA,$90,$80,$00,$02,$2A,$24,$80;$CA875C |
    db $80,$00,$02,$30,$24,$90,$80,$00;$CA8764 |
    db $02,$70,$24,$80,$80,$FF,$02,$4E;$CA876C |
    db $24,$C0,$05,$8A,$CA,$03,$BE,$89;$CA8774 |
    db $CA,$01,$24,$03,$5E,$89,$CA,$80;$CA877C |
    db $80,$00,$02,$4E,$24,$90,$80,$FF;$CA8784 |
    db $02,$28,$24,$C0,$1F,$8A,$CA,$03;$CA878C |
    db $BE,$89,$CA,$01,$24,$03,$5E,$89;$CA8794 |
    db $CA,$90,$80,$FF,$02,$3C,$24,$80;$CA879C |
    db $80,$FF,$02,$2E,$24,$C0,$39,$8A;$CA87A4 |
    db $CA,$03,$BE,$89,$CA,$01,$24,$03;$CA87AC |
    db $5E,$89,$CA,$80,$80,$00,$02,$2E;$CA87B4 |
    db $24,$90,$80,$00,$02,$3C,$24,$C0;$CA87BC |
    db $12,$8A,$CA,$03,$BE,$89,$CA,$01;$CA87C4 |
    db $24,$03,$5E,$89,$CA,$90,$80,$00;$CA87CC |
    db $02,$28,$24,$80,$80,$FF,$02,$4E;$CA87D4 |
    db $24,$C0,$12,$8A,$CA,$03,$BE,$89;$CA87DC |
    db $CA,$01                    ;$CA87E4 |
    LDX.B $39                     ;$CA87E6 |
    DEC.W Obj_VAR1,X              ;$CA87E8 |
    BEQ CODE_1587F0               ;$CA87EB |
    JMP.W CODE_JP_15895E          ;$CA87ED |

CODE_1587F0:
    LDA.W #$867E                  ;$CA87F0 |
    LDY.W #$00CA                  ;$CA87F3 |
    LDX.B $39                     ;$CA87F6 |
    JSL.L CODE_FL_008F64          ;$CA87F8 |
    JMP.W CODE_JP_15895E          ;$CA87FC |
    LDX.B $39                     ;$CA87FF |
    DEC.W Obj_VAR1,X              ;$CA8801 |
    BEQ CODE_158809               ;$CA8804 |
    JMP.W CODE_JP_15895E          ;$CA8806 |

CODE_158809:
    LDA.W #$0003                  ;$CA8809 |
    JSL.L CallRNG_ModA            ;$CA880C |
    ASL A                         ;$CA8810 |
    TAX                           ;$CA8811 |
    JMP.W (PTR16_158815,X)        ;$CA8812 |
PTR16_158815:
    dw CODE_15881B                ;$CA8815 |
    dw CODE_15882A                ;$CA8817 |
    dw CODE_158839                ;$CA8819 |

CODE_15881B:
    LDA.W #$869E                  ;$CA881B |
    LDY.W #$00CA                  ;$CA881E |
    LDX.B $39                     ;$CA8821 |
    JSL.L CODE_FL_008F64          ;$CA8823 |
    JMP.W CODE_JP_15895E          ;$CA8827 |

CODE_15882A:
    LDA.W #$86BE                  ;$CA882A |
    LDY.W #$00CA                  ;$CA882D |
    LDX.B $39                     ;$CA8830 |
    JSL.L CODE_FL_008F64          ;$CA8832 |
    JMP.W CODE_JP_15895E          ;$CA8836 |


CODE_158839:
    LDA.W $7A64                   ;$CA8839 |
    AND.W #$00FF                  ;$CA883C |
    ASL A                         ;$CA883F |
    TAX                           ;$CA8840 |
    JMP.W (PTR16_158844,X)        ;$CA8841 |

PTR16_158844:
    dw CODE_158809
PTR16_158847:
    dw CODE_15884C
    dw CODE_158809
    dw CODE_15884C

CODE_15884C:
    LDA.W #$86D8                  ;$CA884C |
    LDY.W #$00CA                  ;$CA884F |
    LDX.B $39                     ;$CA8852 |
    JSL.L CODE_FL_008F64          ;$CA8854 |
    JMP.W CODE_JP_15895E          ;$CA8858 |
    LDX.B $39                     ;$CA885B |
    DEC.W Obj_VAR1,X              ;$CA885D |
    BEQ CODE_158865               ;$CA8860 |
    JMP.W CODE_JP_15895E          ;$CA8862 |


CODE_158865:
    LDA.W #$0002                  ;$CA8865 |
    JSL.L CallRNG_ModA          ;$CA8868 |
    ASL A                         ;$CA886C |
    TAX                           ;$CA886D |
    JMP.W (CODE_158871,X)         ;$CA886E |


CODE_158871:
    ADC.B $88,X                   ;$CA8871 |
    STY.B $88                     ;$CA8873 |
    LDA.W #$8718                  ;$CA8875 |
    LDY.W #$00CA                  ;$CA8878 |
    LDX.B $39                     ;$CA887B |
    JSL.L CODE_FL_008F64          ;$CA887D |
    JMP.W CODE_JP_15895E          ;$CA8881 |

    LDA.W $7A66                   ;$CA8884 |
    AND.W #$00FF                  ;$CA8887 |
    STA.B $28                     ;$CA888A |
    LDA.W $7A63                   ;$CA888C |
    AND.W #$00FF                  ;$CA888F |
    CMP.B $28                     ;$CA8892 |
    BMI CODE_158865               ;$CA8894 |
    LDA.W #$8732                  ;$CA8896 |
    LDY.W #$00CA                  ;$CA8899 |
    LDX.B $39                     ;$CA889C |
    JSL.L CODE_FL_008F64          ;$CA889E |
    JMP.W CODE_JP_15895E          ;$CA88A2 |

    LDX.B $39                     ;$CA88A5 |
    DEC.W Obj_VAR1,X              ;$CA88A7 |
    BEQ CODE_1588AF               ;$CA88AA |
    JMP.W CODE_JP_15895E          ;$CA88AC |


CODE_1588AF:
    LDA.W #$0003                  ;$CA88AF |
    JSL.L CallRNG_ModA          ;$CA88B2 |
    ASL A                         ;$CA88B6 |
    TAX                           ;$CA88B7 |
    JMP.W (CODE_1588BB,X)         ;$CA88B8 |


CODE_1588BB:
    CMP.B ($88,X)                 ;$CA88BB |
    BNE PTR16_158847+1            ;$CA88BD | Code jumps to... a pointer table??? Is this an error or intentional?
    SBC.B ($88),Y                 ;$CA88BF |
    LDA.W #$8758                  ;$CA88C1 |
    LDY.W #$00CA                  ;$CA88C4 |
    LDX.B $39                     ;$CA88C7 |
    JSL.L CODE_FL_008F64          ;$CA88C9 |
    JMP.W CODE_JP_15895E          ;$CA88CD |

    LDA.W $7A66                   ;$CA88D0 |
    AND.W #$00FF                  ;$CA88D3 |
    STA.B $28                     ;$CA88D6 |
    LDA.W $7A63                   ;$CA88D8 |
    AND.W #$00FF                  ;$CA88DB |
    CMP.B $28                     ;$CA88DE |
    BMI CODE_1588AF               ;$CA88E0 |
    LDA.W #$877E                  ;$CA88E2 |
    LDY.W #$00CA                  ;$CA88E5 |
    LDX.B $39                     ;$CA88E8 |
    JSL.L CODE_FL_008F64          ;$CA88EA |
    JMP.W CODE_JP_15895E          ;$CA88EE |

    LDA.W $7A64                   ;$CA88F1 |
    AND.W #$00FF                  ;$CA88F4 |
    ASL A                         ;$CA88F7 |
    TAX                           ;$CA88F8 |
    JMP.W (CODE_1588FC,X)         ;$CA88F9 |


CODE_1588FC:
    LDA.L DATA8_88AF88            ;$CA88FC |
    TSB.B $89                     ;$CA8900 |
    TSB.B $89                     ;$CA8902 |
    LDA.W #$8798                  ;$CA8904 |
    LDY.W #$00CA                  ;$CA8907 |
    LDX.B $39                     ;$CA890A |
    JSL.L CODE_FL_008F64          ;$CA890C |
    JMP.W CODE_JP_15895E          ;$CA8910 |

    LDX.B $39                     ;$CA8913 |
    DEC.W Obj_VAR1,X              ;$CA8915 |
    BEQ CODE_15891D               ;$CA8918 |
    JMP.W CODE_JP_15895E          ;$CA891A |


CODE_15891D:
    LDA.W #$87CC                  ;$CA891D |
    LDY.W #$00CA                  ;$CA8920 |
    LDX.B $39                     ;$CA8923 |
    JSL.L CODE_FL_008F64          ;$CA8925 |
    JMP.W CODE_JP_15895E          ;$CA8929 |

    LDX.B $39                     ;$CA892C |
    DEC.W Obj_VAR1,X              ;$CA892E |
    BEQ CODE_158936               ;$CA8931 |
    JMP.W CODE_JP_15895E          ;$CA8933 |

CODE_158936:
    LDA.W #$86F8                  ;$CA8936 |
    LDY.W #$00CA                  ;$CA8939 |
    LDX.B $39                     ;$CA893C |
    JSL.L CODE_FL_008F64          ;$CA893E |
    JMP.W CODE_JP_15895E          ;$CA8942 |
    LDX.B $39                     ;$CA8945 |
    DEC.W Obj_VAR1,X              ;$CA8947 |
    BEQ CODE_15894F               ;$CA894A |
    JMP.W CODE_JP_15895E          ;$CA894C |


CODE_15894F:
    LDA.W #$87B2                  ;$CA894F |
    LDY.W #$00CA                  ;$CA8952 |
    LDX.B $39                     ;$CA8955 |
    JSL.L CODE_FL_008F64          ;$CA8957 |
    JMP.W CODE_JP_15895E          ;$CA895B |


CODE_JP_15895E:
    LDX.B $39                     ;$CA895E |
    LDY.W Obj_VAR2,X              ;$CA8960 |
    LDA.W Obj_XPositionMirror,Y   ;$CA8963 |
    CLC                           ;$CA8966 |
    ADC.W #$0008                  ;$CA8967 |
    CMP.W Obj_XPositionMirror,X   ;$CA896A |
    BMI CODE_1589B8               ;$CA896D |
    LDA.W Obj_XPositionMirror,Y   ;$CA896F |
    CLC                           ;$CA8972 |
    ADC.W #$FFF8                  ;$CA8973 |
    CMP.W Obj_XPositionMirror,X   ;$CA8976 |
    BPL CODE_1589B8               ;$CA8979 |
    LDA.W Obj_YPositionMirror,Y   ;$CA897B |
    CLC                           ;$CA897E |
    ADC.W #$000C                  ;$CA897F |
    CMP.W Obj_YPositionMirror,X   ;$CA8982 |
    BMI CODE_1589B8               ;$CA8985 |
    LDA.W Obj_YPositionMirror,Y   ;$CA8987 |
    CLC                           ;$CA898A |
    ADC.W #$FFFC                  ;$CA898B |
    CMP.W Obj_YPositionMirror,X   ;$CA898E |
    BPL CODE_1589B8               ;$CA8991 |
    LDA.W #$8678                  ;$CA8993 |
    LDY.W #$00CA                  ;$CA8996 |
    JSL.L CODE_FL_008F64          ;$CA8999 |
    LDA.W #$7D94                  ;$CA899D |
    PHA                           ;$CA89A0 |
    LDY.W #$00CA                  ;$CA89A1 |
    LDX.B $39                     ;$CA89A4 |
    LDA.W Obj_VAR2,X              ;$CA89A6 |
    TAX                           ;$CA89A9 |
    PLA                           ;$CA89AA |
    JSL.L CODE_FL_008F64          ;$CA89AB |
    LDA.W #$FFFF                  ;$CA89AF |
    STA.W ReloadRoom              ;$CA89B2 |
    STZ.W $7A73                   ;$CA89B5 |

CODE_1589B8:
    JMP.W CODE_JP_158A92          ;$CA89B8 |
    JMP.W CODE_JP_158A92          ;$CA89BB |
    LDA.W #$8638                  ;$CA89BE |
    LDY.W #$00CA                  ;$CA89C1 |
    LDX.B $39                     ;$CA89C4 |
    JSL.L CODE_FL_008F64          ;$CA89C6 |
    JMP.W CODE_JP_158A92          ;$CA89CA |
    LDA.W #$0080                  ;$CA89CD |
    JSL.L CallRNG_ModA          ;$CA89D0 |
    CLC                           ;$CA89D4 |
    ADC.W #$001E                  ;$CA89D5 |
    LDX.B $39                     ;$CA89D8 |
    STA.W Obj_VAR1,X              ;$CA89DA |
    RTL                           ;$CA89DD |
    LDA.W #$8678                  ;$CA89DE |
    LDY.W #$00CA                  ;$CA89E1 |
    LDX.B $39                     ;$CA89E4 |
    JSL.L CODE_FL_008F64          ;$CA89E6 |
    RTL                           ;$CA89EA |

    LDA.W #$0000                  ;$CA89EB |
    SEP #$20                      ;$CA89EE |
    LDA.B #$01                    ;$CA89F0 |
    STA.W $7A66                   ;$CA89F2 |
    REP #$20                      ;$CA89F5 |
    RTL                           ;$CA89F7 |
    LDA.W #$0000                  ;$CA89F8 |
    SEP #$20                      ;$CA89FB |
    LDA.B #$02                    ;$CA89FD |
    STA.W $7A66                   ;$CA89FF |
    REP #$20                      ;$CA8A02 |
    RTL                           ;$CA8A04 |
    LDA.W #$0000                  ;$CA8A05 |
    SEP #$20                      ;$CA8A08 |
    LDA.B #$03                    ;$CA8A0A |
    STA.W $7A66                   ;$CA8A0C |
    REP #$20                      ;$CA8A0F |
    RTL                           ;$CA8A11 |

    LDA.W #$0000                  ;$CA8A12 |
    SEP #$20                      ;$CA8A15 |
    LDA.B #$04                    ;$CA8A17 |
    STA.W $7A66                   ;$CA8A19 |
    REP #$20                      ;$CA8A1C |
    RTL                           ;$CA8A1E |

    LDA.W #$0000                  ;$CA8A1F |
    SEP #$20                      ;$CA8A22 |
    LDA.B #$05                    ;$CA8A24 |
    STA.W $7A66                   ;$CA8A26 |
    REP #$20                      ;$CA8A29 |
    RTL                           ;$CA8A2B |

    LDA.W #$0000                  ;$CA8A2C |
    SEP #$20                      ;$CA8A2F |
    LDA.B #$06                    ;$CA8A31 |
    STA.W $7A66                   ;$CA8A33 |
    REP #$20                      ;$CA8A36 |
    RTL                           ;$CA8A38 |
    LDA.W #$0000                  ;$CA8A39 |
    SEP #$20                      ;$CA8A3C |
    LDA.B #$07                    ;$CA8A3E |
    STA.W $7A66                   ;$CA8A40 |
    REP #$20                      ;$CA8A43 |
    RTL                           ;$CA8A45 |

    LDY.B $39                     ;$CA8A46 |
    LDA.W $7A65                   ;$CA8A48 |
    AND.W #$00FF                  ;$CA8A4B |
    STA.B $28                     ;$CA8A4E |
    LDA.W $7A66                   ;$CA8A50 |
    AND.W #$00FF                  ;$CA8A53 |
    CMP.B $28                     ;$CA8A56 |
    BNE CODE_158A61               ;$CA8A58 |
    SEC                           ;$CA8A5A |
    SBC.W #$0001                  ;$CA8A5B |
    STA.W $7A66                   ;$CA8A5E |

CODE_158A61:
    ASL A                         ;$CA8A61 |
    TAX                           ;$CA8A62 |
    LDA.L DATA16_CA8A72,X         ;$CA8A63 |
    STA.W Obj_XPosition,Y         ;$CA8A67 |
    LDA.L DATA16_CA8A82,X         ;$CA8A6A |
    STA.W Obj_YPosition,Y         ;$CA8A6E |
    RTL                           ;$CA8A71 |

DATA16_CA8A72:
    dw $0034,$0034,$007A,$0099    ;$CA8A72 |
    dw $00A8,$00CF,$0042,$0090    ;$CA8A7A |

DATA16_CA8A82:
    dw $00AB,$00AB,$008D,$00B4    ;$CA8A82 |
    dw $0067,$0053,$005F,$004B    ;$CA8A8A |

CODE_JP_158A92:
    LDX.B $39                     ;$CA8A92 |
    LDA.W Obj_VAR4,X              ;$CA8A94 |
    CMP.W #$0002                  ;$CA8A97 |
    BMI CODE_158AC5               ;$CA8A9A |
    STZ.W Obj_VAR4,X              ;$CA8A9C |
    LDA.W Obj_VAR0,X              ;$CA8A9F |
    CLC                           ;$CA8AA2 |
    ADC.W #$64F9                  ;$CA8AA3 |
    LDX.W #$00CA                  ;$CA8AA6 |
    LDY.W #$C010                  ;$CA8AA9 |
    JSL.L WritePal                ;$CA8AAC |
    LDY.B $39                     ;$CA8AB0 |
    LDA.W Obj_VAR0,Y              ;$CA8AB2 |
    CLC                           ;$CA8AB5 |
    ADC.W #$0020                  ;$CA8AB6 |
    CMP.W #$0200                  ;$CA8AB9 |
    BMI CODE_158AC1               ;$CA8ABC |
    LDA.W #$0000                  ;$CA8ABE |

CODE_158AC1:
    STA.W Obj_VAR0,Y              ;$CA8AC1 |
    RTL                           ;$CA8AC4 |

CODE_158AC5:
    INC.W Obj_VAR4,X              ;$CA8AC5 |
    RTL                           ;$CA8AC8 |
    db $83,$00,$14,$30,$2E,$E1,$00,$76;$CA8AC9 |
    db $83,$A0,$07,$7C,$98,$E7,$00,$60;$CA8AD1 |
    db $83,$80,$3C,$00,$00,$D9,$00,$00;$CA8AD9 |
    db $83,$10,$01,$A1,$1C,$EC,$00,$40;$CA8AE1 |
    db $89,$00,$04,$69,$4F,$E8,$00,$48;$CA8AE9 |
    db $0F,$00,$04,$00,$24,$7E,$00,$48;$CA8AF1 |
    db $89,$00,$04,$7F,$CC,$EB,$00,$58;$CA8AF9 |
    db $0F,$00,$04,$00,$24,$7E,$00,$58;$CA8B01 |
    db $FF,$C0,$6C,$92,$00,$02,$01,$C0;$CA8B09 |
    db $E6,$5F,$CA,$C0,$7D,$8C,$CA,$C0;$CA8B11 |
    db $D5,$A2,$00,$3E,$6F,$01,$00,$11;$CA8B19 |
    db $33,$8C,$24,$16,$FB,$A6,$15,$78;$CA8B21 |
    db $AB,$14,$52,$E5,$CD,$33,$61,$00;$CA8B29 |
    db $40,$FF,$C0,$E6,$5F,$CA,$C0,$BE;$CA8B31 |
    db $84,$00,$F0,$38,$0A,$CE,$5F,$1B;$CA8B39 |
    db $73,$7A,$FF,$FF,$C0,$94,$9C,$00;$CA8B41 |
    db $09,$C0,$BB,$9C,$00,$00,$00,$60;$CA8B49 |
    db $00,$C0,$9A,$9C,$00,$00,$00,$00;$CA8B51 |
    db $00,$00,$48,$C0,$CE,$9C,$00,$11;$CA8B59 |
    db $C0,$85,$9F,$00,$00,$C0,$65,$9B;$CA8B61 |
    db $00,$04,$30,$10,$00,$00,$00,$00;$CA8B69 |
    db $00,$01,$00,$00,$00,$C0,$90,$8C;$CA8B71 |
    db $CA,$C0,$D5,$A2,$00,$3E,$6F,$01;$CA8B79 |
    db $00,$11,$C9,$8B,$C0,$E6,$5F,$CA;$CA8B81 |
    db $03,$39,$8C,$CA,$C0,$EA,$9F,$00;$CA8B89 |
    db $99,$DC,$E9,$00,$00,$02,$C0,$6C;$CA8B91 |
    db $9C,$00,$95,$9C,$CA,$05,$10,$C1;$CA8B99 |
    db $CD,$9F,$00,$07,$C1,$C9,$A2,$00;$CA8BA1 |
    db $73,$7A,$00,$00,$11,$A5,$8B,$05;$CA8BA9 |
    db $10,$C1,$DD,$9F,$00,$07,$C0,$BE;$CA8BB1 |
    db $84,$00,$C0,$EF,$9B,$00,$C0,$A1;$CA8BB9 |
    db $8C,$CA,$1B,$92,$73,$01,$00,$01;$CA8BC1 |
    db $16,$BA,$A8,$C0,$EA,$9F,$00,$99;$CA8BC9 |
    db $AE,$E9,$00,$00,$02,$C0,$70,$8C;$CA8BD1 |
    db $CA,$C0,$6C,$9C,$00,$BE,$9C,$CA;$CA8BD9 |
    db $C0,$8F,$A2,$00,$F5,$97,$DB,$00;$CA8BE1 |
    db $20,$7E,$C0,$9A,$9C,$00,$00,$00;$CA8BE9 |
    db $00,$00,$00,$40,$C0,$9A,$9C,$00;$CA8BF1 |
    db $01,$03,$00,$00,$00,$50,$C0,$CE;$CA8BF9 |
    db $9C,$00,$13,$02,$03,$2F,$01,$C0;$CA8C01 |
    db $FF,$30,$01,$40,$00,$05,$10,$C1;$CA8C09 |
    db $CD,$9F,$00,$07,$C1,$C9,$A2,$00;$CA8C11 |
    db $73,$7A,$00,$00,$11,$15,$8C,$05;$CA8C19 |
    db $10,$C1,$DD,$9F,$00,$07,$C0,$BE;$CA8C21 |
    db $84,$00,$C0,$EF,$9B,$00,$C0,$A1;$CA8C29 |
    db $8C,$CA,$1B,$92,$73,$01,$00,$01;$CA8C31 |
    LDX.B $39                     ;$CA8C39 |
    LDA.W Obj_VAR4,X              ;$CA8C3B |
    CMP.W #$0002                  ;$CA8C3E |
    BPL CODE_158C47               ;$CA8C41 |
    INC.W Obj_VAR4,X              ;$CA8C43 |
    RTL                           ;$CA8C46 |

CODE_158C47:
    STZ.W Obj_VAR4,X              ;$CA8C47 |
    LDA.W Obj_VAR0,X              ;$CA8C4A |
    CLC                           ;$CA8C4D |
    ADC.W #$6779                  ;$CA8C4E |
    LDX.W #$00CA                  ;$CA8C51 |
    LDY.W #$7010                  ;$CA8C54 |
    JSL.L WritePal                ;$CA8C57 |
    LDY.B $39                     ;$CA8C5B |
    LDA.W Obj_VAR0,Y              ;$CA8C5D |
    CLC                           ;$CA8C60 |
    ADC.W #$0020                  ;$CA8C61 |
    CMP.W #$0400                  ;$CA8C64 |
    BMI CODE_158C6C               ;$CA8C67 |
    LDA.W #$0000                  ;$CA8C69 |

CODE_158C6C:
    STA.W Obj_VAR0,Y              ;$CA8C6C |
    RTL                           ;$CA8C6F |
    LDA.W #$000A                  ;$CA8C70 |
    LDX.W #$000D                  ;$CA8C73 |
    LDY.W #$0000                  ;$CA8C76 |
    JML.L CODE_FL_01A841          ;$CA8C79 |
    LDY.B $39                     ;$CA8C7D |
    LDA.W Current_Level           ;$CA8C7F |
    BNE CODE_158C89               ;$CA8C82 |
    LDA.W Current_Room            ;$CA8C84 |
    BEQ CODE_158C8F               ;$CA8C87 |

CODE_158C89:
    LDA.W #$0001                  ;$CA8C89 |
    STA.W Obj_VAR4,Y              ;$CA8C8C |

CODE_158C8F:
    RTL                           ;$CA8C8F |
    LDY.B $39                     ;$CA8C90 |
    LDA.W Current_Level           ;$CA8C92 |
    CMP.W #$0003                  ;$CA8C95 |
    BPL CODE_158CA0               ;$CA8C98 |
    LDA.W #$0001                  ;$CA8C9A |
    STA.W Obj_VAR4,Y              ;$CA8C9D |

CODE_158CA0:
    RTL                           ;$CA8CA0 |
    LDA.W $7A69                   ;$CA8CA1 |
    STA.W Current_Level           ;$CA8CA4 |
    STZ.W Current_Room            ;$CA8CA7 |
    RTL                           ;$CA8CAA |
    db $C0,$6C,$92,$00,$02,$01,$24,$C0;$CA8CAB |
    db $E6,$5F,$CA,$16,$FB,$A6,$15,$78;$CA8CB3 |
    db $AB,$33,$61,$00,$14,$52,$E5,$CD;$CA8CBB |
    db $C0,$65,$9B,$00,$04,$30,$10,$00;$CA8CC3 |
    db $00,$00,$00,$00,$01,$00,$01,$00;$CA8CCB |
    db $18,$EE,$32,$0F,$09,$EA,$8C,$58;$CA8CD3 |
    db $8D,$0D,$8E,$9C,$8E,$F2,$8E,$8A;$CA8CDB |
    db $8F,$37,$90,$8F,$90,$34,$8F,$26;$CA8CE3 |
    db $40,$00,$27,$A8,$00,$41,$08,$41;$CA8CEB |
    db $0D,$41,$09,$41,$0A,$80,$00,$FC;$CA8CF3 |
    db $05,$03,$41,$00,$41,$01,$41,$03;$CA8CFB |
    db $41,$02,$07,$C0,$65,$9B,$00,$04;$CA8D03 |
    db $30,$10,$00,$00,$00,$00,$00,$01;$CA8D0B |
    db $00,$02,$00,$C0,$65,$9B,$00,$04;$CA8D13 |
    db $30,$10,$00,$00,$00,$00,$00,$01;$CA8D1B |
    db $00,$04,$00,$24,$42,$02,$80,$40;$CA8D23 |
    db $02,$90,$B0,$FB,$B0,$24,$00,$05;$CA8D2B |
    db $08,$42,$00,$42,$01,$42,$03,$42;$CA8D33 |
    db $02,$07,$C0,$90,$90,$CA,$24,$44;$CA8D3B |
    db $11,$44,$12,$4A,$13,$44,$12,$44;$CA8D43 |
    db $11,$40,$FF,$02,$1E,$1B,$73,$7A;$CA8D4B |
    db $00,$00,$0E,$8F,$90,$26,$C8,$00;$CA8D53 |
    db $27,$B4,$00,$40,$01,$C0,$65,$9B;$CA8D5B |
    db $00,$04,$30,$10,$00,$00,$00,$00;$CA8D63 |
    db $00,$01,$00,$04,$00,$80,$00,$01;$CA8D6B |
    db $90,$00,$FC,$A0,$F0,$FF,$B0,$10;$CA8D73 |
    db $00,$02,$38,$A0,$10,$00,$B0,$18;$CA8D7B |
    db $00,$40,$00,$02,$18,$A0,$20,$00;$CA8D83 |
    db $B0,$00,$00,$02,$18,$24,$02,$02;$CA8D8B |
    db $C0,$65,$9B,$00,$04,$30,$10,$00;$CA8D93 |
    db $00,$00,$00,$00,$01,$00,$02,$00;$CA8D9B |
    db $80,$00,$FC,$92,$00,$FE,$42,$01;$CA8DA3 |
    db $42,$03,$42,$02,$49,$15,$C0,$65;$CA8DAB |
    db $9B,$00,$04,$30,$10,$00,$00,$00;$CA8DB3 |
    db $00,$00,$01,$00,$04,$00,$C0,$65;$CA8DBB |
    db $9B,$00,$04,$30,$10,$00,$00,$00;$CA8DC3 |
    db $00,$00,$01,$00,$03,$00,$80,$F0;$CA8DCB |
    db $00,$90,$00,$FC,$B0,$30,$00,$05;$CA8DD3 |
    db $0C,$42,$15,$42,$16,$07,$C0,$65;$CA8DDB |
    db $9B,$00,$04,$30,$10,$00,$00,$00;$CA8DE3 |
    db $00,$00,$01,$00,$04,$00,$C0,$65;$CA8DEB |
    db $9B,$00,$04,$30,$10,$00,$00,$00;$CA8DF3 |
    db $00,$00,$01,$00,$02,$00,$40,$FF;$CA8DFB |
    db $02,$30,$1B,$73,$7A,$00,$00,$0E;$CA8E03 |
    db $8F,$90,$26,$30,$00,$27,$30,$00;$CA8E0B |
    db $40,$17,$80,$00,$FD,$90,$C0,$00;$CA8E13 |
    db $A0,$20,$00,$02,$18,$B0,$FA,$FF;$CA8E1B |
    db $02,$28,$C0,$65,$9B,$00,$04,$30;$CA8E23 |
    db $10,$00,$00,$00,$00,$00,$01,$00;$CA8E2B |
    db $0C,$00,$A0,$DE,$FF,$40,$18,$02;$CA8E33 |
    db $2C,$C0,$65,$9B,$00,$04,$30,$10;$CA8E3B |
    db $00,$00,$00,$00,$00,$01,$00,$0C;$CA8E43 |
    db $00,$A0,$06,$00,$B0,$0C,$00,$02;$CA8E4B |
    db $1E,$80,$C0,$FF,$90,$40,$00,$A0;$CA8E53 |
    db $00,$00,$B0,$00,$00,$40,$19,$05;$CA8E5B |
    db $02,$02,$1E,$C0,$65,$9B,$00,$04;$CA8E63 |
    db $30,$10,$00,$00,$00,$00,$00,$01;$CA8E6B |
    db $00,$0C,$00,$07,$80,$E0,$FF,$90;$CA8E73 |
    db $20,$00,$40,$1A,$05,$03,$02,$14;$CA8E7B |
    db $C0,$65,$9B,$00,$04,$30,$10,$00;$CA8E83 |
    db $00,$00,$00,$00,$01,$00,$0C,$00;$CA8E8B |
    db $07,$1B,$73,$7A,$00,$00,$0E,$8F;$CA8E93 |
    db $90,$26,$56,$00,$27,$74,$00,$40;$CA8E9B |
    db $00,$C0,$65,$9B,$00,$04,$30,$10;$CA8EA3 |
    db $00,$00,$00,$00,$00,$01,$00,$02;$CA8EAB |
    db $00,$C0,$65,$9B,$00,$04,$30,$10;$CA8EB3 |
    db $00,$00,$00,$00,$00,$01,$00,$0D;$CA8EBB |
    db $00,$80,$00,$FE,$90,$00,$FC,$A0;$CA8EC3 |
    db $10,$00,$B0,$20,$00,$02,$22,$C0;$CA8ECB |
    db $6C,$9C,$00,$F7,$9C,$CA,$24,$02;$CA8ED3 |
    db $14,$80,$00,$01,$90,$00,$FD,$B0;$CA8EDB |
    db $20,$00,$02,$3C,$24,$02,$1E,$1B;$CA8EE3 |
    db $73,$7A,$00,$00,$0E,$8F,$90,$C0;$CA8EEB |
    db $6C,$9C,$00,$F7,$9C,$CA,$26,$90;$CA8EF3 |
    db $00,$27,$7C,$00,$40,$00,$C0,$65;$CA8EFB |
    db $9B,$00,$04,$30,$10,$00,$00,$00;$CA8F03 |
    db $00,$00,$01,$00,$02,$00,$C0,$65;$CA8F0B |
    db $9B,$00,$04,$30,$10,$00,$00,$00;$CA8F13 |
    db $00,$00,$01,$00,$15,$00,$02,$1E;$CA8F1B |
    db $C0,$6C,$9C,$00,$00,$9D,$CA,$02;$CA8F23 |
    db $8C,$1B,$73,$7A,$00,$00,$0E,$8F;$CA8F2B |
    db $90,$C0,$6C,$9C,$00,$F7,$9C,$CA;$CA8F33 |
    db $C0,$6C,$9C,$00,$00,$9D,$CA,$26;$CA8F3B |
    db $60,$00,$27,$5C,$00,$40,$00,$C0;$CA8F43 |
    db $65,$9B,$00,$04,$30,$10,$00,$00;$CA8F4B |
    db $00,$00,$00,$01,$00,$02,$00,$C0;$CA8F53 |
    db $65,$9B,$00,$04,$30,$10,$00,$00;$CA8F5B |
    db $00,$00,$00,$01,$00,$0F,$00,$80;$CA8F63 |
    db $F0,$FF,$90,$00,$F8,$B5,$40,$01;$CA8F6B |
    db $C0,$6C,$9C,$00,$2B,$9D,$CA,$B0;$CA8F73 |
    db $06,$00,$02,$A0,$24,$02,$1E,$1B;$CA8F7B |
    db $73,$7A,$00,$00,$0E,$8F,$90,$C0;$CA8F83 |
    db $6C,$9C,$00,$F7,$9C,$CA,$C0,$6C;$CA8F8B |
    db $9C,$00,$00,$9D,$CA,$C0,$6C,$9C;$CA8F93 |
    db $00,$2B,$9D,$CA,$26,$74,$00,$27;$CA8F9B |
    db $90,$00,$40,$23,$C0,$65,$9B,$00;$CA8FA3 |
    db $04,$30,$10,$00,$00,$00,$00,$00;$CA8FAB |
    db $01,$00,$02,$00,$C0,$65,$9B,$00;$CA8FB3 |
    db $04,$30,$10,$00,$00,$00,$00,$00;$CA8FBB |
    db $01,$00,$10,$00,$80,$C0,$FF,$90;$CA8FC3 |
    db $00,$04,$B0,$E0,$FF,$02,$18,$C0;$CA8FCB |
    db $6C,$9C,$00,$09,$9D,$CA,$B0,$F4;$CA8FD3 |
    db $FF,$40,$00,$02,$18,$A0,$E0,$FF;$CA8FDB |
    db $B0,$F0,$FF,$02,$18,$A0,$20,$00;$CA8FE3 |
    db $B0,$F4,$FF,$02,$18,$40,$23,$B0;$CA8FEB |
    db $10,$00,$02,$2C,$40,$24,$A0,$DC;$CA8FF3 |
    db $FF,$02,$18,$A0,$D0,$FF,$B0,$00;$CA8FFB |
    db $00,$02,$18,$40,$01,$80,$00,$FA;$CA9003 |
    db $90,$00,$03,$A0,$30,$00,$B0,$E8;$CA900B |
    db $FF,$02,$20,$40,$00,$90,$00,$04;$CA9013 |
    db $A0,$04,$00,$B0,$E0,$FF,$02,$10;$CA901B |
    db $40,$23,$A0,$00,$00,$02,$38,$24;$CA9023 |
    db $40,$FF,$02,$14,$1B,$73,$7A,$00;$CA902B |
    db $00,$0E,$8F,$90,$C0,$6C,$9C,$00;$CA9033 |
    db $F7,$9C,$CA,$C0,$6C,$9C,$00,$00;$CA903B |
    db $9D,$CA,$C0,$6C,$9C,$00,$2B,$9D;$CA9043 |
    db $CA,$C0,$6C,$9C,$00,$09,$9D,$CA;$CA904B |
    db $26,$79,$00,$27,$48,$00,$40,$00;$CA9053 |
    db $C0,$65,$9B,$00,$04,$30,$10,$00;$CA905B |
    db $00,$00,$00,$00,$01,$00,$02,$00;$CA9063 |
    db $C0,$65,$9B,$00,$04,$30,$10,$00;$CA906B |
    db $00,$00,$00,$00,$01,$00,$13,$00;$CA9073 |
    db $02,$14,$C0,$6C,$9C,$00,$12,$9D;$CA907B |
    db $CA,$02,$B4,$24,$1B,$73,$7A,$00;$CA9083 |
    db $00,$0E,$8F,$90,$01        ;$CA908B |
    LDA.W #$0497                  ;$CA9090 |
    STA.W $0632                   ;$CA9093 |
    LDA.W #$053C                  ;$CA9096 |
    STA.W $0634                   ;$CA9099 |
    LDA.W #$5F3E                  ;$CA909C |
    STA.W $063C                   ;$CA909F |
    RTL                           ;$CA90A2 |
    dw $0038,$0038,$0038,$00A0    ;$CA90A3 |
    dw $00AC,$00B8,$00C8,$00C8    ;$CA90AB |
    dw $0060,$0060,$0060,$0060    ;$CA90B3 |
    dw $0038,$0060,$0038,$0032    ;$CA90BB |
    dw $0040,$0050,$0069,$0060    ;$CA90C3 |
    dw $0056,$0056,$0078,$0090    ;$CA90CB |
    dw $0048,$0030,$0040,$0058    ;$CA90D3 |
    dw $0060,$0072,$0072,$0079    ;$CA90DB |
    dw $0079,$0079,$0088,$0098    ;$CA90E3 |
    dw $00A0,$0080,$0078,$0060    ;$CA90EB |
    dw $0060,$009A,$009A,$009A    ;$CA90F3 |
    dw $00B8,$00BA,$00BA,$00B4    ;$CA90FB |
    dw $00B4,$0060,$0060,$0060    ;$CA9103 |
    dw $0060,$0048,$0060,$0048    ;$CA910B |
    dw $0087,$0094,$0090,$0080    ;$CA9113 |
    dw $0080,$0074,$0074,$006A    ;$CA911B |
    dw $007C,$0058,$0058,$00A8    ;$CA9123 |
    dw $0094,$0094,$0094,$0094    ;$CA912B |
    dw $0078,$0058,$0048,$0050    ;$CA9133 |
    dw $0054,$0088,$0078,$0074    ;$CA913B |
    dw $005C,$005C                ;$CA9143 |
    db $C0,$6C,$92,$00,$02,$01,$24,$C0;$CA9147 |
    db $E6,$5F,$CA,$16,$FB,$A6,$15,$78;$CA914F |
    db $AB,$33,$60,$00,$14,$52,$E5,$CD;$CA9157 |
    db $18,$EE,$32,$0F,$09,$76,$91,$97;$CA915F |
    db $91,$E5,$91,$44,$92,$44,$92,$44;$CA9167 |
    db $92,$44,$92,$44,$92,$44,$92,$26;$CA916F |
    db $50,$00,$27,$A8,$00,$40,$05,$C0;$CA9177 |
    db $65,$9B,$00,$04,$30,$10,$00,$00;$CA917F |
    db $00,$00,$00,$01,$00,$05,$00,$80;$CA9187 |
    db $10,$00,$90,$FC,$FF,$41,$05,$01;$CA918F |
    db $03,$29,$93,$CA,$26,$98,$00,$27;$CA9197 |
    db $8C,$00,$40,$06,$80,$08,$00,$90;$CA919F |
    db $F0,$FF,$40,$06,$02,$5E,$C0,$65;$CA91A7 |
    db $9B,$00,$04,$30,$10,$00,$F8,$FF;$CA91AF |
    db $F8,$FF,$01,$00,$05,$00,$C0,$65;$CA91B7 |
    db $9B,$00,$04,$30,$10,$00,$F8,$FF;$CA91BF |
    db $F8,$FF,$01,$00,$07,$00,$02,$0C;$CA91C7 |
    db $05,$10,$02,$02,$C0,$65,$9B,$00;$CA91CF |
    db $04,$30,$10,$00,$00,$00,$00,$00;$CA91D7 |
    db $01,$00,$06,$00,$07,$01,$03,$29;$CA91DF |
    db $93,$CA,$26,$A0,$00,$27,$40,$00;$CA91E7 |
    db $40,$07,$90,$F8,$FF,$40,$07,$02;$CA91EF |
    db $1D,$C0,$65,$9B,$00,$04,$30,$10;$CA91F7 |
    db $00,$00,$00,$00,$00,$01,$00,$08;$CA91FF |
    db $00,$02,$1C,$C0,$65,$9B,$00,$04;$CA9207 |
    db $30,$10,$00,$00,$00,$00,$00,$01;$CA920F |
    db $00,$09,$00,$02,$29,$C0,$65,$9B;$CA9217 |
    db $00,$04,$30,$10,$00,$00,$00,$00;$CA921F |
    db $00,$01,$00,$0A,$00,$02,$1E,$05;$CA9227 |
    db $07,$02,$19,$C0,$65,$9B,$00,$04;$CA922F |
    db $30,$10,$00,$00,$00,$00,$00,$01;$CA9237 |
    db $00,$0B,$00,$07,$01,$C0,$4B,$92;$CA923F |
    db $CA,$41,$04,$01            ;$CA9247 |
    LDY.B $39                     ;$CA924B |
    LDA.W Current_Level           ;$CA924D |
    ASL A                         ;$CA9250 |
    TAX                           ;$CA9251 |
    LDA.L DATA16_CA9261,X         ;$CA9252 |
    STA.W Obj_XPosition,Y         ;$CA9256 |
    LDA.L DATA16_CA9273,X         ;$CA9259 |
    STA.W Obj_YPosition,Y         ;$CA925D |
    RTL                           ;$CA9260 |

DATA16_CA9261:
    dw $0000,$0000,$0000,$0056    ;$CA9261 |
    dw $00A0,$0074,$0079,$0079    ;$CA9269 |
    dw $0060                      ;$CA9271 |

DATA16_CA9273:
    dw $0000,$0000,$0000          ;$CA9273 |
    dw $0072,$0082,$0094,$0048    ;$CA9279 |
    dw $0048,$005C,$0044,$0044    ;$CA9281 |
    dw $0044,$0060,$0088,$0094    ;$CA9289 |
    dw $0096,$0096,$00A0,$00A0    ;$CA9291 |
    dw $00A0,$00A0,$00A0,$00A0    ;$CA9299 |
    dw $00A0,$0056,$0056,$0056    ;$CA92A1 |
    dw $0056,$0056,$0056,$0056    ;$CA92A9 |
    dw $00A0,$00A0,$0074,$0074    ;$CA92B1 |
    dw $0074,$0074,$0074,$0074    ;$CA92B9 |
    dw $0074,$0079,$0079,$0079    ;$CA92C1 |
    dw $0079,$0079,$0060,$0060    ;$CA92C9 |
    dw $0060,$0060,$0060,$00A8    ;$CA92D1 |
    dw $00A8,$00A8,$00A6,$0098    ;$CA92D9 |
    dw $0090,$008A,$008A,$005A    ;$CA92E1 |
    dw $005A,$005A,$005A,$0048    ;$CA92E9 |
    dw $005A,$0048,$0072,$0072    ;$CA92F1 |
    dw $0072,$0072,$0072,$0072    ;$CA92F9 |
    dw $0072,$0082,$0082,$0094    ;$CA9301 |
    dw $0094,$0094,$0094,$0094    ;$CA9309 |
    dw $0094,$0094,$0048,$0048    ;$CA9311 |
    dw $0048,$0048,$0048,$005C    ;$CA9319 |
    dw $005C,$005C,$005C,$005C    ;$CA9321 |

    LDX.B $39                     ;$CA9329 |
    LDA.W Obj_VAR0,X              ;$CA932B |
    CLC                           ;$CA932E |
    ADC.W #$6B79                  ;$CA932F |
    LDX.W #$00CA                  ;$CA9332 |
    LDY.W #$8010                  ;$CA9335 |
    JSL.L WritePal                ;$CA9338 |
    LDY.B $39                     ;$CA933C |
    LDA.W Obj_VAR0,Y              ;$CA933E |
    CLC                           ;$CA9341 |
    ADC.W #$0020                  ;$CA9342 |
    CMP.W #$00A0                  ;$CA9345 |
    BMI CODE_15934D               ;$CA9348 |
    LDA.W #$0000                  ;$CA934A |

CODE_15934D:
    STA.W Obj_VAR0,Y              ;$CA934D |
    RTL                           ;$CA9350 |
    db $2E,$00,$C0,$E6,$5F,$CA,$16,$BA;$CA9351 |
    db $A8,$2A,$00,$00,$00,$2B,$00,$00;$CA9359 |
    db $00,$40,$FF,$05,$04,$30,$00,$00;$CA9361 |
    db $FE,$02,$01,$30,$00,$00,$02,$02;$CA9369 |
    db $02,$30,$00,$00,$FE,$02,$01,$07;$CA9371 |
    db $2E,$00,$00,$2E,$00,$C0,$E6,$5F;$CA9379 |
    db $CA,$16,$BA,$A8,$2A,$00,$00,$00;$CA9381 |
    db $2B,$00,$00,$00,$40,$FF,$05,$02;$CA9389 |
    db $30,$00,$00,$FF,$02,$01,$30,$00;$CA9391 |
    db $00,$01,$02,$02,$30,$00,$00,$FF;$CA9399 |
    db $02,$01,$07,$2E,$00,$00,$24,$C0;$CA93A1 |
    db $E6,$5F,$CA,$16,$FB,$A6,$15,$78;$CA93A9 |
    db $AB,$33,$61,$00,$14,$52,$E5,$CD;$CA93B1 |
    db $90,$00,$FF,$44,$0E,$44,$0F,$44;$CA93B9 |
    db $10,$00,$24,$C0,$E6,$5F,$CA,$16;$CA93C1 |
    db $FB,$A6,$15,$78,$AB,$33,$61,$00;$CA93C9 |
    db $14,$52,$E5,$CD,$80,$00,$FF,$90;$CA93D1 |
    db $00,$FF,$42,$08,$42,$0D,$42,$09;$CA93D9 |
    db $42,$0A,$42,$0B,$42,$0C,$00,$24;$CA93E1 |
    db $C0,$E6,$5F,$CA,$16,$FB,$A6,$15;$CA93E9 |
    db $78,$AB,$33,$61,$00,$14,$52,$E5;$CA93F1 |
    db $CD,$C0,$11,$94,$CA,$80,$00,$FF;$CA93F9 |
    db $90,$00,$FF,$42,$08,$42,$0D,$42;$CA9401 |
    db $09,$42,$0A,$42,$0B,$42,$0C,$00;$CA9409 |
    LDA.W #$0010                  ;$CA9411 |
    JSL.L CallRNG_ModA          ;$CA9414 |
    LDY.B $39                     ;$CA9418 |
    CLC                           ;$CA941A |
    ADC.W #$0070                  ;$CA941B |
    STA.W Obj_XPosition,Y         ;$CA941E |
    LDA.W #$0010                  ;$CA9421 |
    JSL.L CallRNG_ModA          ;$CA9424 |
    LDY.B $39                     ;$CA9428 |
    CLC                           ;$CA942A |
    ADC.W #$0068                  ;$CA942B |
    STA.W Obj_YPosition,Y         ;$CA942E |
    RTL                           ;$CA9431 |
    db $24,$C0,$E6,$5F,$CA,$16,$FB,$A6;$CA9432 |
    db $15,$78,$AB,$33,$61,$00,$14,$52;$CA943A |
    db $E5,$CD,$80,$00,$FE,$90,$00,$FF;$CA9442 |
    db $4C,$14,$00,$24,$C0,$E6,$5F,$CA;$CA944A |
    db $16,$FB,$A6,$15,$78,$AB,$33,$61;$CA9452 |
    db $00,$14,$52,$E5,$CD,$41,$08,$80;$CA945A |
    db $00,$FC,$90,$00,$01,$4A,$14,$80;$CA9462 |
    db $00,$FF,$90,$00,$FF,$42,$08,$42;$CA946A |
    db $0D,$42,$09,$42,$0A,$42,$0B,$42;$CA9472 |
    db $0C,$00,$24,$C0,$E6,$5F,$CA,$16;$CA947A |
    db $FB,$A6,$15,$78,$AB,$33,$61,$00;$CA9482 |
    db $14,$52,$E5,$CD,$41,$08,$80,$00;$CA948A |
    db $FE,$90,$00,$02,$48,$14,$00,$24;$CA9492 |
    db $C0,$E6,$5F,$CA,$16,$FB,$A6,$15;$CA949A |
    db $78,$AB,$33,$61,$00,$14,$52,$E5;$CA94A2 |
    db $CD,$41,$08,$80,$00,$04,$90,$80;$CA94AA |
    db $FE,$4A,$14,$00,$24,$C0,$E6,$5F;$CA94B2 |
    db $CA,$16,$FB,$A6,$15,$78,$AB,$33;$CA94BA |
    db $61,$00,$14,$52,$E5,$CD,$41,$08;$CA94C2 |
    db $00,$24,$C0,$E6,$5F,$CA,$16,$FB;$CA94CA |
    db $A6,$15,$78,$AB,$33,$61,$00,$14;$CA94D2 |
    db $52,$E5,$CD,$C0,$65,$9B,$00,$04;$CA94DA |
    db $30,$10,$00,$00,$00,$00,$00,$01;$CA94E2 |
    db $00,$03,$00,$80,$00,$FF,$90,$00;$CA94EA |
    db $FF,$42,$08,$42,$0D,$42,$09,$42;$CA94F2 |
    db $0A,$42,$0B,$42,$0C,$00,$A9,$10;$CA94FA |
    db $00,$22,$C4,$8A,$00,$A4,$39,$99;$CA9502 |
    db $86,$69,$A9,$10,$00,$22,$C4,$8A;$CA950A |
    db $00,$99,$00,$6A,$6B,$24,$C0,$E6;$CA9512 |
    db $5F,$CA,$16,$FB,$A6,$15,$78,$AB;$CA951A |
    db $33,$61,$00,$14,$52,$E5,$CD,$40;$CA9522 |
    db $FF,$05,$02,$26,$46,$00,$27,$84;$CA952A |
    db $00,$C0,$65,$9B,$00,$04,$30,$10;$CA9532 |
    db $00,$00,$00,$00,$00,$01,$00,$0E;$CA953A |
    db $00,$02,$04,$26,$40,$00,$27,$88;$CA9542 |
    db $00,$C0,$65,$9B,$00,$04,$30,$10;$CA954A |
    db $00,$00,$00,$00,$00,$01,$00,$0E;$CA9552 |
    db $00,$02,$04,$26,$38,$00,$27,$90;$CA955A |
    db $00,$C0,$65,$9B,$00,$04,$30,$10;$CA9562 |
    db $00,$00,$00,$00,$00,$01,$00,$0E;$CA956A |
    db $00,$02,$04,$26,$3C,$00,$27,$7C;$CA9572 |
    db $00,$C0,$65,$9B,$00,$04,$30,$10;$CA957A |
    db $00,$00,$00,$00,$00,$01,$00,$0E;$CA9582 |
    db $00,$02,$04,$26,$30,$00,$27,$94;$CA958A |
    db $00,$C0,$65,$9B,$00,$04,$30,$10;$CA9592 |
    db $00,$00,$00,$00,$00,$01,$00,$0E;$CA959A |
    db $00,$02,$04,$26,$2A,$00,$27,$80;$CA95A2 |
    db $00,$C0,$65,$9B,$00,$04,$30,$10;$CA95AA |
    db $00,$00,$00,$00,$00,$01,$00,$0E;$CA95B2 |
    db $00,$02,$04,$26,$28,$00,$27,$94;$CA95BA |
    db $00,$C0,$65,$9B,$00,$04,$30,$10;$CA95C2 |
    db $00,$00,$00,$00,$00,$01,$00,$0E;$CA95CA |
    db $00,$02,$04,$26,$24,$00,$27,$7C;$CA95D2 |
    db $00,$C0,$65,$9B,$00,$04,$30,$10;$CA95DA |
    db $00,$00,$00,$00,$00,$01,$00,$0E;$CA95E2 |
    db $00,$02,$04,$26,$18,$00,$27,$90;$CA95EA |
    db $00,$C0,$65,$9B,$00,$04,$30,$10;$CA95F2 |
    db $00,$00,$00,$00,$00,$01,$00,$0E;$CA95FA |
    db $00,$02,$04,$26,$20,$00,$27,$98;$CA9602 |
    db $00,$C0,$65,$9B,$00,$04,$30,$10;$CA960A |
    db $00,$00,$00,$00,$00,$01,$00,$0E;$CA9612 |
    db $00,$02,$04,$26,$44,$00,$27,$98;$CA961A |
    db $00,$C0,$65,$9B,$00,$04,$30,$10;$CA9622 |
    db $00,$00,$00,$00,$00,$01,$00,$0E;$CA962A |
    db $00,$02,$04,$07,$00,$24,$C0,$E6;$CA9632 |
    db $5F,$CA,$16,$FB,$A6,$15,$78,$AB;$CA963A |
    db $33,$61,$00,$14,$52,$E5,$CD,$80;$CA9642 |
    db $00,$01,$90,$80,$FF,$A0,$04,$00;$CA964A |
    db $B0,$FE,$FF,$43,$08,$43,$0D,$4A;$CA9652 |
    db $09,$4A,$0A,$4A,$0B,$4A,$0C,$00;$CA965A |
    db $24,$C0,$E6,$5F,$CA,$16,$FB,$A6;$CA9662 |
    db $15,$78,$AB,$33,$61,$00,$14,$52;$CA966A |
    db $E5,$CD,$40,$FF,$05,$02,$26,$44;$CA9672 |
    db $00,$27,$68,$00,$C0,$65,$9B,$00;$CA967A |
    db $04,$30,$10,$00,$00,$00,$00,$00;$CA9682 |
    db $01,$00,$0E,$00,$02,$03,$26,$48;$CA968A |
    db $00,$27,$58,$00,$C0,$65,$9B,$00;$CA9692 |
    db $04,$30,$10,$00,$00,$00,$00,$00;$CA969A |
    db $01,$00,$0E,$00,$02,$03,$26,$40;$CA96A2 |
    db $00,$27,$53,$00,$C0,$65,$9B,$00;$CA96AA |
    db $04,$30,$10,$00,$00,$00,$00,$00;$CA96B2 |
    db $01,$00,$0E,$00,$02,$03,$26,$50;$CA96BA |
    db $00,$27,$4E,$00,$C0,$65,$9B,$00;$CA96C2 |
    db $04,$30,$10,$00,$00,$00,$00,$00;$CA96CA |
    db $01,$00,$0E,$00,$02,$03,$26,$38;$CA96D2 |
    db $00,$27,$48,$00,$C0,$65,$9B,$00;$CA96DA |
    db $04,$30,$10,$00,$00,$00,$00,$00;$CA96E2 |
    db $01,$00,$0E,$00,$02,$03,$26,$48;$CA96EA |
    db $00,$27,$40,$00,$C0,$65,$9B,$00;$CA96F2 |
    db $04,$30,$10,$00,$00,$00,$00,$00;$CA96FA |
    db $01,$00,$0E,$00,$02,$03,$26,$4C;$CA9702 |
    db $00,$27,$34,$00,$C0,$65,$9B,$00;$CA970A |
    db $04,$30,$10,$00,$00,$00,$00,$00;$CA9712 |
    db $01,$00,$0E,$00,$02,$03,$26,$44;$CA971A |
    db $00,$27,$2C,$00,$C0,$65,$9B,$00;$CA9722 |
    db $04,$30,$10,$00,$00,$00,$00,$00;$CA972A |
    db $01,$00,$0E,$00,$02,$03,$26,$4C;$CA9732 |
    db $00,$27,$20,$00,$C0,$65,$9B,$00;$CA973A |
    db $04,$30,$10,$00,$00,$00,$00,$00;$CA9742 |
    db $01,$00,$0E,$00,$02,$03,$07,$00;$CA974A |
    db $24,$C0,$E6,$5F,$CA,$16,$FB,$A6;$CA9752 |
    db $15,$78,$AB,$33,$61,$00,$14,$52;$CA975A |
    db $E5,$CD,$40,$FF,$26,$74,$00,$27;$CA9762 |
    db $9C,$00,$05,$04,$C0,$65,$9B,$00;$CA976A |
    db $04,$30,$10,$00,$00,$00,$00,$00;$CA9772 |
    db $01,$00,$11,$00,$02,$04,$07,$05;$CA977A |
    db $08,$C0,$65,$9B,$00,$04,$30,$10;$CA9782 |
    db $00,$00,$00,$00,$00,$01,$00,$03;$CA978A |
    db $00,$26,$78,$00,$27,$AC,$00,$C0;$CA9792 |
    db $65,$9B,$00,$04,$30,$10,$00,$00;$CA979A |
    db $00,$00,$00,$01,$00,$0E,$00,$02;$CA97A2 |
    db $03,$26,$74,$00,$27,$B0,$00,$C0;$CA97AA |
    db $65,$9B,$00,$04,$30,$10,$00,$00;$CA97B2 |
    db $00,$00,$00,$01,$00,$12,$00,$02;$CA97BA |
    db $03,$26,$80,$00,$27,$94,$00,$C0;$CA97C2 |
    db $65,$9B,$00,$04,$30,$10,$00,$00;$CA97CA |
    db $00,$00,$00,$01,$00,$11,$00,$C0;$CA97D2 |
    db $65,$9B,$00,$04,$30,$10,$00,$00;$CA97DA |
    db $00,$00,$00,$01,$00,$03,$00,$26;$CA97E2 |
    db $70,$00,$27,$AC,$00,$C0,$65,$9B;$CA97EA |
    db $00,$04,$30,$10,$00,$00,$00,$00;$CA97F2 |
    db $00,$01,$00,$12,$00,$02,$03,$26;$CA97FA |
    db $68,$00,$27,$A0,$00,$C0,$65,$9B;$CA9802 |
    db $00,$04,$30,$10,$00,$00,$00,$00;$CA980A |
    db $00,$01,$00,$12,$00,$02,$03,$26;$CA9812 |
    db $72,$00,$27,$98,$00,$C0,$65,$9B;$CA981A |
    db $00,$04,$30,$10,$00,$00,$00,$00;$CA9822 |
    db $00,$01,$00,$0E,$00,$02,$03,$C0;$CA982A |
    db $65,$9B,$00,$04,$30,$10,$00,$00;$CA9832 |
    db $00,$00,$00,$01,$00,$03,$00,$26;$CA983A |
    db $74,$00,$27,$AC,$00,$C0,$65,$9B;$CA9842 |
    db $00,$04,$30,$10,$00,$00,$00,$00;$CA984A |
    db $00,$01,$00,$12,$00,$02,$03,$26;$CA9852 |
    db $78,$00,$27,$90,$00,$C0,$65,$9B;$CA985A |
    db $00,$04,$30,$10,$00,$00,$00,$00;$CA9862 |
    db $00,$01,$00,$11,$00,$C0,$65,$9B;$CA986A |
    db $00,$04,$30,$10,$00,$00,$00,$00;$CA9872 |
    db $00,$01,$00,$12,$00,$02,$03,$26;$CA987A |
    db $78,$00,$27,$B0,$00,$C0,$65,$9B;$CA9882 |
    db $00,$04,$30,$10,$00,$00,$00,$00;$CA988A |
    db $00,$01,$00,$12,$00,$02,$03,$26;$CA9892 |
    db $82,$00,$27,$AC,$00,$C0,$65,$9B;$CA989A |
    db $00,$04,$30,$10,$00,$00,$00,$00;$CA98A2 |
    db $00,$01,$00,$0E,$00,$02,$03,$26;$CA98AA |
    db $6C,$00,$27,$AC,$00,$C0,$65,$9B;$CA98B2 |
    db $00,$04,$30,$10,$00,$00,$00,$00;$CA98BA |
    db $00,$01,$00,$12,$00,$02,$03,$07;$CA98C2 |
    db $00,$24,$C0,$E6,$5F,$CA,$16,$FB;$CA98CA |
    db $A6,$15,$78,$AB,$33,$61,$00,$14;$CA98D2 |
    db $52,$E5,$CD,$80,$00,$01,$90,$00;$CA98DA |
    db $03,$A0,$04,$00,$B0,$E8,$FF,$43;$CA98E2 |
    db $1D,$43,$1E,$4A,$1F,$B0,$FC,$FF;$CA98EA |
    db $4A,$20,$4A,$21,$4A,$22,$00,$24;$CA98F2 |
    db $C0,$E6,$5F,$CA,$16,$FB,$A6,$15;$CA98FA |
    db $78,$AB,$33,$61,$00,$14,$52,$E5;$CA9902 |
    db $CD,$80,$00,$01,$90,$00,$01,$A0;$CA990A |
    db $04,$00,$B0,$E8,$FF,$43,$1D,$43;$CA9912 |
    db $1E,$4A,$1F,$B0,$FC,$FF,$4A,$20;$CA991A |
    db $4A,$21,$4A,$22,$00,$24,$C0,$E6;$CA9922 |
    db $5F,$CA,$16,$FB,$A6,$15,$78,$AB;$CA992A |
    db $33,$61,$00,$14,$52,$E5,$CD,$40;$CA9932 |
    db $FF,$05,$03,$26,$77,$00,$27,$48;$CA993A |
    db $00,$C0,$65,$9B,$00,$04,$30,$10;$CA9942 |
    db $00,$00,$00,$00,$00,$01,$00,$0E;$CA994A |
    db $00,$02,$06,$26,$7B,$00,$27,$4C;$CA9952 |
    db $00,$C0,$65,$9B,$00,$04,$30,$10;$CA995A |
    db $00,$00,$00,$00,$00,$01,$00,$0E;$CA9962 |
    db $00,$02,$06,$26,$77,$00,$27,$50;$CA996A |
    db $00,$C0,$65,$9B,$00,$04,$30,$10;$CA9972 |
    db $00,$00,$00,$00,$00,$01,$00,$0E;$CA997A |
    db $00,$07,$02,$1E,$C0,$65,$9B,$00;$CA9982 |
    db $04,$30,$10,$00,$00,$00,$00,$00;$CA998A |
    db $01,$00,$14,$00,$00,$24,$C0,$E6;$CA9992 |
    db $5F,$CA,$16,$FB,$A6,$15,$78,$AB;$CA999A |
    db $33,$61,$00,$14,$52,$E5,$CD,$40;$CA99A2 |
    db $FF,$05,$02,$C0,$65,$9B,$00,$04;$CA99AA |
    db $30,$10,$00,$00,$00,$00,$00,$01;$CA99B2 |
    db $00,$03,$00,$26,$30,$00,$27,$90;$CA99BA |
    db $00,$C0,$65,$9B,$00,$04,$30,$10;$CA99C2 |
    db $00,$00,$00,$00,$00,$01,$00,$0E;$CA99CA |
    db $00,$02,$03,$26,$B0,$00,$27,$6D;$CA99D2 |
    db $00,$C0,$65,$9B,$00,$04,$30,$10;$CA99DA |
    db $00,$00,$00,$00,$00,$01,$00,$0E;$CA99E2 |
    db $00,$02,$03,$26,$70,$00,$27,$50;$CA99EA |
    db $00,$C0,$65,$9B,$00,$04,$30,$10;$CA99F2 |
    db $00,$00,$00,$00,$00,$01,$00,$0E;$CA99FA |
    db $00,$02,$03,$26,$A8,$00,$27,$A8;$CA9A02 |
    db $00,$C0,$65,$9B,$00,$04,$30,$10;$CA9A0A |
    db $00,$00,$00,$00,$00,$01,$00,$0E;$CA9A12 |
    db $00,$02,$03,$C0,$65,$9B,$00,$04;$CA9A1A |
    db $30,$10,$00,$00,$00,$00,$00,$01;$CA9A22 |
    db $00,$03,$00,$26,$58,$00,$27,$98;$CA9A2A |
    db $00,$C0,$65,$9B,$00,$04,$30,$10;$CA9A32 |
    db $00,$00,$00,$00,$00,$01,$00,$0E;$CA9A3A |
    db $00,$02,$03,$26,$80,$00,$27,$60;$CA9A42 |
    db $00,$C0,$65,$9B,$00,$04,$30,$10;$CA9A4A |
    db $00,$00,$00,$00,$00,$01,$00,$0E;$CA9A52 |
    db $00,$02,$03,$26,$58,$00,$27,$40;$CA9A5A |
    db $00,$C0,$65,$9B,$00,$04,$30,$10;$CA9A62 |
    db $00,$00,$00,$00,$00,$01,$00,$0E;$CA9A6A |
    db $00,$02,$03,$26,$88,$00,$27,$8D;$CA9A72 |
    db $00,$C0,$65,$9B,$00,$04,$30,$10;$CA9A7A |
    db $00,$00,$00,$00,$00,$01,$00,$0E;$CA9A82 |
    db $00,$02,$03,$C0,$65,$9B,$00,$04;$CA9A8A |
    db $30,$10,$00,$00,$00,$00,$00,$01;$CA9A92 |
    db $00,$03,$00,$26,$3C,$00,$27,$A8;$CA9A9A |
    db $00,$C0,$65,$9B,$00,$04,$30,$10;$CA9AA2 |
    db $00,$00,$00,$00,$00,$01,$00,$0E;$CA9AAA |
    db $00,$02,$03,$26,$60,$00,$27,$68;$CA9AB2 |
    db $00,$C0,$65,$9B,$00,$04,$30,$10;$CA9ABA |
    db $00,$00,$00,$00,$00,$01,$00,$0E;$CA9AC2 |
    db $00,$02,$03,$26,$64,$00,$27,$80;$CA9ACA |
    db $00,$C0,$65,$9B,$00,$04,$30,$10;$CA9AD2 |
    db $00,$00,$00,$00,$00,$01,$00,$0E;$CA9ADA |
    db $00,$02,$03,$26,$A0,$00,$27,$78;$CA9AE2 |
    db $00,$C0,$65,$9B,$00,$04,$30,$10;$CA9AEA |
    db $00,$00,$00,$00,$00,$01,$00,$0E;$CA9AF2 |
    db $00,$02,$03,$C0,$65,$9B,$00,$04;$CA9AFA |
    db $30,$10,$00,$00,$00,$00,$00,$01;$CA9B02 |
    db $00,$03,$00,$26,$20,$00,$27,$A8;$CA9B0A |
    db $00,$C0,$65,$9B,$00,$04,$30,$10;$CA9B12 |
    db $00,$00,$00,$00,$00,$01,$00,$0E;$CA9B1A |
    db $00,$02,$03,$26,$60,$00,$27,$6D;$CA9B22 |
    db $00,$C0,$65,$9B,$00,$04,$30,$10;$CA9B2A |
    db $00,$00,$00,$00,$00,$01,$00,$0E;$CA9B32 |
    db $00,$02,$03,$26,$A0,$00,$27,$40;$CA9B3A |
    db $00,$C0,$65,$9B,$00,$04,$30,$10;$CA9B42 |
    db $00,$00,$00,$00,$00,$01,$00,$0E;$CA9B4A |
    db $00,$02,$03,$26,$88,$00,$27,$8D;$CA9B52 |
    db $00,$C0,$65,$9B,$00,$04,$30,$10;$CA9B5A |
    db $00,$00,$00,$00,$00,$01,$00,$0E;$CA9B62 |
    db $00,$02,$03,$07,$00,$C0,$6C,$92;$CA9B6A |
    db $00,$02,$01,$24,$C0,$E6,$5F,$CA;$CA9B72 |
    db $16,$FB,$A6,$15,$78,$AB,$33,$61;$CA9B7A |
    db $00,$14,$52,$E5,$CD,$40,$FF,$05;$CA9B82 |
    db $02,$26,$88,$00,$27,$9D,$00,$C0;$CA9B8A |
    db $65,$9B,$00,$04,$30,$10,$00,$00;$CA9B92 |
    db $00,$00,$00,$01,$00,$0E,$00,$02;$CA9B9A |
    db $03,$26,$A0,$00,$27,$A0,$00,$C0;$CA9BA2 |
    db $65,$9B,$00,$04,$30,$10,$00,$00;$CA9BAA |
    db $00,$00,$00,$01,$00,$0E,$00,$02;$CA9BB2 |
    db $03,$26,$98,$00,$27,$BC,$00,$C0;$CA9BBA |
    db $65,$9B,$00,$04,$30,$10,$00,$00;$CA9BC2 |
    db $00,$00,$00,$01,$00,$0E,$00,$02;$CA9BCA |
    db $03,$26,$B8,$00,$27,$84,$00,$C0;$CA9BD2 |
    db $65,$9B,$00,$04,$30,$10,$00,$00;$CA9BDA |
    db $00,$00,$00,$01,$00,$0E,$00,$02;$CA9BE2 |
    db $03,$26,$A8,$00,$27,$90,$00,$C0;$CA9BEA |
    db $65,$9B,$00,$04,$30,$10,$00,$00;$CA9BF2 |
    db $00,$00,$00,$01,$00,$0E,$00,$02;$CA9BFA |
    db $03,$26,$A8,$00,$27,$80,$00,$C0;$CA9C02 |
    db $65,$9B,$00,$04,$30,$10,$00,$00;$CA9C0A |
    db $00,$00,$00,$01,$00,$0E,$00,$02;$CA9C12 |
    db $03,$26,$90,$00,$27,$B8,$00,$C0;$CA9C1A |
    db $65,$9B,$00,$04,$30,$10,$00,$00;$CA9C22 |
    db $00,$00,$00,$01,$00,$0E,$00,$02;$CA9C2A |
    db $03,$26,$A0,$00,$27,$80,$00,$C0;$CA9C32 |
    db $65,$9B,$00,$04,$30,$10,$00,$00;$CA9C3A |
    db $00,$00,$00,$01,$00,$0E,$00,$02;$CA9C42 |
    db $03,$26,$C8,$00,$27,$78,$00,$C0;$CA9C4A |
    db $65,$9B,$00,$04,$30,$10,$00,$00;$CA9C52 |
    db $00,$00,$00,$01,$00,$0E,$00,$02;$CA9C5A |
    db $03,$26,$B0,$00,$27,$C0,$00,$C0;$CA9C62 |
    db $65,$9B,$00,$04,$30,$10,$00,$00;$CA9C6A |
    db $00,$00,$00,$01,$00,$0E,$00,$02;$CA9C72 |
    db $03,$26,$DC,$00,$27,$88,$00,$C0;$CA9C7A |
    db $65,$9B,$00,$04,$30,$10,$00,$00;$CA9C82 |
    db $00,$00,$00,$01,$00,$0E,$00,$02;$CA9C8A |
    db $03,$07,$00,$83,$00,$14,$30,$2E;$CA9C92 |
    db $E1,$00,$76,$83,$60,$16,$B3,$52;$CA9C9A |
    db $E2,$00,$60,$83,$40,$33,$71,$26;$CA9CA2 |
    db $DA,$00,$00,$89,$00,$04,$41,$6F;$CA9CAA |
    db $E8,$00,$48,$0F,$00,$04,$00,$24;$CA9CB2 |
    db $7E,$00,$48,$FF,$83,$00,$14,$30;$CA9CBA |
    db $2E,$E1,$00,$76,$83,$60,$16,$B3;$CA9CC2 |
    db $52,$E2,$00,$60,$83,$00,$24,$35;$CA9CCA |
    db $70,$DC,$00,$00,$89,$00,$04,$95;$CA9CD2 |
    db $A6,$E9,$00,$40,$0F,$00,$04,$00;$CA9CDA |
    db $24,$7E,$00,$40,$89,$00,$10,$5C;$CA9CE2 |
    db $86,$E8,$00,$50,$0F,$00,$10,$00;$CA9CEA |
    db $30,$7E,$00,$50,$FF,$03,$A0,$06;$CA9CF2 |
    db $C0,$2F,$7E,$E0,$07,$FF,$03,$00;$CA9CFA |
    db $09,$00,$3B,$7E,$80,$0D,$FF,$03;$CA9D02 |
    db $A0,$04,$60,$36,$7E,$30,$0B,$FF;$CA9D0A |
    db $03,$00,$09,$C0,$26,$7E,$60,$03;$CA9D12 |
    db $89,$00,$04,$95,$A6,$E9,$00,$48;$CA9D1A |
    db $0F,$00,$04,$00,$24,$7E,$00,$48;$CA9D22 |
    db $FF,$03,$02,$00,$FD,$FF,$E2,$8B;$CA9D2A |
    db $49,$03,$02,$00,$FD,$FF,$E1,$CA;$CA9D32 |
    db $49,$03,$C0,$06,$00,$20,$7E,$00;$CA9D3A |
    db $00,$FF,$C0,$BE,$84,$00,$16,$F1;$CA9D42 |
    db $A6,$04,$14,$FF,$FF,$FF,$40,$FF;$CA9D4A |
    db $C0,$94,$9C,$00,$09,$C0,$BB,$9C;$CA9D52 |
    db $00,$00,$00,$60,$00,$C0,$9A,$9C;$CA9D5A |
    db $00,$00,$01,$00,$00,$00,$48,$C0;$CA9D62 |
    db $9A,$9C,$00,$01,$00,$00,$00,$00;$CA9D6A |
    db $50,$C0,$CE,$9C,$00,$13,$C0,$A0;$CA9D72 |
    db $9E,$CA,$C0,$85,$9F,$00,$00,$C0;$CA9D7A |
    db $EA,$9F,$00,$99,$BE,$E9,$00,$00;$CA9D82 |
    db $02,$C0,$6C,$9C,$00,$D9,$AB,$CA;$CA9D8A |
    db $F0,$1D,$0A,$CE,$5F,$C0,$BC,$9B;$CA9D92 |
    db $00,$00,$00,$00,$00,$02,$10,$00;$CA9D9A |
    db $80,$00,$80,$00,$02,$00,$00,$00;$CA9DA2 |
    db $C0,$BC,$9B,$00,$02,$00,$00,$00;$CA9DAA |
    db $04,$10,$00,$00,$00,$00,$00,$02;$CA9DB2 |
    db $00,$00,$00,$C0,$BC,$9B,$00,$03;$CA9DBA |
    db $00,$00,$00,$06,$10,$00,$00,$00;$CA9DC2 |
    db $00,$00,$02,$00,$00,$00,$C0,$BC;$CA9DCA |
    db $9B,$00,$04,$00,$00,$00,$08,$10;$CA9DD2 |
    db $00,$00,$00,$00,$00,$02,$00,$00;$CA9DDA |
    db $00,$C0,$BC,$9B,$00,$05,$00,$00;$CA9DE2 |
    db $00,$0A,$10,$00,$30,$00,$D0,$00;$CA9DEA |
    db $02,$00,$00,$00,$C0,$BC,$9B,$00;$CA9DF2 |
    db $06,$00,$00,$00,$0C,$10,$00,$00;$CA9DFA |
    db $00,$00,$00,$02,$00,$00,$00,$C0;$CA9E02 |
    db $6A,$9E,$CA,$C0,$D5,$A2,$00,$3E;$CA9E0A |
    db $6F,$01,$00,$11,$2B,$9E,$C0,$BC;$CA9E12 |
    db $9B,$00,$07,$00,$00,$00,$0E,$10;$CA9E1A |
    db $00,$00,$00,$00,$00,$02,$00,$00;$CA9E22 |
    db $00,$1B,$73,$7A,$FF,$FF,$05,$10;$CA9E2A |
    db $C2,$CD,$9F,$00,$07,$C1,$C9,$A2;$CA9E32 |
    db $00,$73,$7A,$00,$00,$11,$37,$9E;$CA9E3A |
    db $05,$10,$C2,$DD,$9F,$00,$07,$C0;$CA9E42 |
    db $EF,$9B,$00,$C0,$BE,$84,$00,$C0;$CA9E4A |
    db $D5,$A2,$00,$B8,$6F,$01,$00,$11;$CA9E52 |
    db $60,$9E,$0D,$60,$C0,$CA,$C0,$93;$CA9E5A |
    db $9E,$CA,$1B,$92,$73,$01,$00,$01;$CA9E62 |
    LDY.B $39                     ;$CA9E6A |
    LDA.W $7A6B                   ;$CA9E6C |
    AND.W #$007F                  ;$CA9E6F |
    CMP.W #$007F                  ;$CA9E72 |
    BNE CODE_159E7D               ;$CA9E75 |
    LDA.W #$0001                  ;$CA9E77 |
    STA.W Obj_VAR4,Y              ;$CA9E7A |

CODE_159E7D:
    RTL                           ;$CA9E7D |
    LDA.W #$0001                  ;$CA9E7E |
    STA.W Shooting_State        ;$CA9E81 |
    LDA.W $7AC1                   ;$CA9E84 |
    BNE CODE_159E92               ;$CA9E87 |
    LDA.W #$FFFF                  ;$CA9E89 |
    STA.W $7495                   ;$CA9E8C |
    STA.W Helper_Ability          ;$CA9E8F |

CODE_159E92:
    RTL                           ;$CA9E92 |
    LDA.W #$0005                  ;$CA9E93 |
    LDX.W MWW_Current_Planet      ;$CA9E96 |
    LDY.W #$0000                  ;$CA9E99 |
    JML.L CODE_FL_00DA97          ;$CA9E9C |
    LDA.W #$000A                  ;$CA9EA0 |
    LDX.W #$0000                  ;$CA9EA3 |
    LDY.W #$0000                  ;$CA9EA6 |
    JML.L CODE_FL_01A841          ;$CA9EA9 |
    db $24,$16,$FB,$A6,$15,$78,$AB,$C0;$CA9EAD |
    db $B1,$A1,$CA,$14,$9C,$E5,$CD,$33;$CA9EB5 |
    db $60,$00,$03,$C9,$9E,$CA,$40,$00;$CA9EBD |
    db $01,$04,$24,$01            ;$CA9EC5 |
    LDX.B $39                     ;$CA9EC9 |
    JSL.L CODE_FL_CAA0AA          ;$CA9ECB |
    JSL.L CODE_FL_CAA0DD          ;$CA9ECF |
    LDA.W P1_Hold                 ;$CA9ED3 |
    XBA                           ;$CA9ED6 |
    AND.W #$000F                  ;$CA9ED7 |
    CMP.W #$000B                  ;$CA9EDA |

CODE_159EDD:
    BCS CODE_159EDD               ;$CA9EDD |
    ASL A                         ;$CA9EDF |
    TAX                           ;$CA9EE0 |
    JMP.W (PTR16_159EE4,X)        ;$CA9EE1 |
PTR16_159EE4:
    dw CODE_159EFA                ;$CA9EE4 |
    dw CODE_159F0B                ;$CA9EE6 |
    dw CODE_159F34                ;$CA9EE8 |
    dw CODE_159EFA                ;$CA9EEA |
    dw CODE_159F5D                ;$CA9EEC |
    dw CODE_159F86                ;$CA9EEE |
    dw CODE_159FBE                ;$CA9EF0 |
    dw CODE_159EFA                ;$CA9EF2 |
    dw CODE_159FF9                ;$CA9EF4 |
    dw CODE_15A022                ;$CA9EF6 |
    dw CODE_15A05D                ;$CA9EF8 |

CODE_159EFA:
    LDX.B $39                     ;$CA9EFA |
    JSL.L CODE_FL_CAA161          ;$CA9EFC |
    JSL.L CODE_FL_CAA185          ;$CA9F00 |
    JSL.L CODE_FL_CAA126          ;$CA9F04 |
    JMP.W CODE_JP_15A095          ;$CA9F08 |

CODE_159F0B:
    LDX.B $39                     ;$CA9F0B |
    LDA.W #$4000                  ;$CA9F0D |
    STA.W Obj_VAR1,X              ;$CA9F10 |
    LDA.W #$0008                  ;$CA9F13 |
    STA.W $6C62,X                 ;$CA9F16 |
    LDA.W $6B6E,X                 ;$CA9F19 |
    BMI CODE_159F29               ;$CA9F1C |
    CMP.W #$0100                  ;$CA9F1E |
    BMI CODE_159F29               ;$CA9F21 |
    LDA.W #$0100                  ;$CA9F23 |
    STA.W $6B6E,X                 ;$CA9F26 |

CODE_159F29:
    JSL.L CODE_FL_CAA185          ;$CA9F29 |
    JSL.L CODE_FL_CAA126          ;$CA9F2D |
    JMP.W CODE_JP_15A095          ;$CA9F31 |

CODE_159F34:
    LDX.B $39                     ;$CA9F34 |
    LDA.W #$C000                  ;$CA9F36 |
    STA.W Obj_VAR1,X              ;$CA9F39 |
    LDA.W #$FFF8                  ;$CA9F3C |
    STA.W $6C62,X                 ;$CA9F3F |
    LDA.W $6B6E,X                 ;$CA9F42 |
    BPL CODE_159F52               ;$CA9F45 |
    CMP.W #$FF00                  ;$CA9F47 |
    BPL CODE_159F52               ;$CA9F4A |
    LDA.W #$FF00                  ;$CA9F4C |
    STA.W $6B6E,X                 ;$CA9F4F |

CODE_159F52:
    JSL.L CODE_FL_CAA185          ;$CA9F52 |
    JSL.L CODE_FL_CAA126          ;$CA9F56 |
    JMP.W CODE_JP_15A095          ;$CA9F5A |

CODE_159F5D:
    LDX.B $39                     ;$CA9F5D |
    LDA.W #$8000                  ;$CA9F5F |
    STA.W Obj_VAR1,X              ;$CA9F62 |
    LDA.W #$0008                  ;$CA9F65 |
    STA.W $6CDC,X                 ;$CA9F68 |
    LDA.W $6BE8,X                 ;$CA9F6B |
    BMI CODE_159F7B               ;$CA9F6E |
    CMP.W #$0100                  ;$CA9F70 |
    BMI CODE_159F7B               ;$CA9F73 |
    LDA.W #$0100                  ;$CA9F75 |
    STA.W $6BE8,X                 ;$CA9F78 |

CODE_159F7B:
    JSL.L CODE_FL_CAA161          ;$CA9F7B |
    JSL.L CODE_FL_CAA126          ;$CA9F7F |
    JMP.W CODE_JP_15A095          ;$CA9F83 |

CODE_159F86:
    LDX.B $39                     ;$CA9F86 |
    LDA.W #$6000                  ;$CA9F88 |
    STA.W Obj_VAR1,X              ;$CA9F8B |
    LDA.W #$0008                  ;$CA9F8E |
    STA.W $6C62,X                 ;$CA9F91 |
    STA.W $6CDC,X                 ;$CA9F94 |
    LDA.W $6B6E,X                 ;$CA9F97 |
    BMI CODE_159FA7               ;$CA9F9A |
    CMP.W #$00B0                  ;$CA9F9C |
    BMI CODE_159FA7               ;$CA9F9F |
    LDA.W #$00B0                  ;$CA9FA1 |
    STA.W $6B6E,X                 ;$CA9FA4 |

CODE_159FA7:
    LDA.W $6BE8,X                 ;$CA9FA7 |
    BMI CODE_159FB7               ;$CA9FAA |
    CMP.W #$00B0                  ;$CA9FAC |
    BMI CODE_159FB7               ;$CA9FAF |
    LDA.W #$00B0                  ;$CA9FB1 |
    STA.W $6BE8,X                 ;$CA9FB4 |

CODE_159FB7:
    JSL.L CODE_FL_CAA126          ;$CA9FB7 |
    JMP.W CODE_JP_15A095          ;$CA9FBB |

CODE_159FBE:
    LDX.B $39                     ;$CA9FBE |
    LDA.W #$A000                  ;$CA9FC0 |
    STA.W Obj_VAR1,X              ;$CA9FC3 |
    LDA.W #$FFF8                  ;$CA9FC6 |
    STA.W $6C62,X                 ;$CA9FC9 |
    LDA.W #$0008                  ;$CA9FCC |
    STA.W $6CDC,X                 ;$CA9FCF |
    LDA.W $6B6E,X                 ;$CA9FD2 |
    BPL CODE_159FE2               ;$CA9FD5 |
    CMP.W #$FF50                  ;$CA9FD7 |
    BPL CODE_159FE2               ;$CA9FDA |
    LDA.W #$FF50                  ;$CA9FDC |
    STA.W $6B6E,X                 ;$CA9FDF |

CODE_159FE2:
    LDA.W $6BE8,X                 ;$CA9FE2 |
    BMI CODE_159FF2               ;$CA9FE5 |
    CMP.W #$00B0                  ;$CA9FE7 |
    BMI CODE_159FF2               ;$CA9FEA |
    LDA.W #$00B0                  ;$CA9FEC |
    STA.W $6BE8,X                 ;$CA9FEF |

CODE_159FF2:
    JSL.L CODE_FL_CAA126          ;$CA9FF2 |
    JMP.W CODE_JP_15A095          ;$CA9FF6 |

CODE_159FF9:
    LDX.B $39                     ;$CA9FF9 |
    LDA.W #$0000                  ;$CA9FFB |
    STA.W Obj_VAR1,X              ;$CA9FFE |
    LDA.W #$FFF8                  ;$CAA001 |
    STA.W $6CDC,X                 ;$CAA004 |
    LDA.W $6BE8,X                 ;$CAA007 |
    BPL CODE_15A017               ;$CAA00A |
    CMP.W #$FF00                  ;$CAA00C |
    BPL CODE_15A017               ;$CAA00F |
    LDA.W #$FF00                  ;$CAA011 |
    STA.W $6BE8,X                 ;$CAA014 |

CODE_15A017:
    JSL.L CODE_FL_CAA161          ;$CAA017 |
    JSL.L CODE_FL_CAA126          ;$CAA01B |
    JMP.W CODE_JP_15A095          ;$CAA01F |

CODE_15A022:
    LDX.B $39                     ;$CAA022 |
    LDA.W #$2000                  ;$CAA024 |
    STA.W Obj_VAR1,X              ;$CAA027 |
    LDA.W #$0008                  ;$CAA02A |
    STA.W $6C62,X                 ;$CAA02D |
    LDA.W #$FFF8                  ;$CAA030 |
    STA.W $6CDC,X                 ;$CAA033 |
    LDA.W $6B6E,X                 ;$CAA036 |
    BMI CODE_15A046               ;$CAA039 |
    CMP.W #$00B0                  ;$CAA03B |
    BMI CODE_15A046               ;$CAA03E |
    LDA.W #$00B0                  ;$CAA040 |
    STA.W $6B6E,X                 ;$CAA043 |

CODE_15A046:
    LDA.W $6BE8,X                 ;$CAA046 |
    BPL CODE_15A056               ;$CAA049 |
    CMP.W #$FF50                  ;$CAA04B |
    BPL CODE_15A056               ;$CAA04E |
    LDA.W #$FF50                  ;$CAA050 |
    STA.W $6BE8,X                 ;$CAA053 |

CODE_15A056:
    JSL.L CODE_FL_CAA126          ;$CAA056 |
    JMP.W CODE_JP_15A095          ;$CAA05A |

CODE_15A05D:
    LDX.B $39                     ;$CAA05D |
    LDA.W #$E000                  ;$CAA05F |
    STA.W Obj_VAR1,X              ;$CAA062 |
    LDA.W #$FFF8                  ;$CAA065 |
    STA.W $6C62,X                 ;$CAA068 |
    STA.W $6CDC,X                 ;$CAA06B |
    LDA.W $6B6E,X                 ;$CAA06E |
    BPL CODE_15A07E               ;$CAA071 |
    CMP.W #$FF50                  ;$CAA073 |
    BPL CODE_15A07E               ;$CAA076 |
    LDA.W #$FF50                  ;$CAA078 |
    STA.W $6B6E,X                 ;$CAA07B |

CODE_15A07E:
    LDA.W $6BE8,X                 ;$CAA07E |
    BPL CODE_15A08E               ;$CAA081 |
    CMP.W #$FF50                  ;$CAA083 |
    BPL CODE_15A08E               ;$CAA086 |
    LDA.W #$FF50                  ;$CAA088 |
    STA.W $6BE8,X                 ;$CAA08B |

CODE_15A08E:
    JSL.L CODE_FL_CAA126          ;$CAA08E |
    JMP.W CODE_JP_15A095          ;$CAA092 |

CODE_JP_15A095:
    LDX.B $39                     ;$CAA095 |
    LDA.W Obj_VAR4,X              ;$CAA097 |
    INC A                         ;$CAA09A |
    AND.W #$0007                  ;$CAA09B |
    BNE CODE_15A0A4               ;$CAA09E |
    JSL.L CODE_FL_CAA1C7          ;$CAA0A0 |

CODE_15A0A4:
    LDX.B $39                     ;$CAA0A4 |
    STA.W Obj_VAR4,X              ;$CAA0A6 |
    RTL                           ;$CAA0A9 |
    LDA.W Obj_XPosition,X         ;$CAA0AA |
    SEC                           ;$CAA0AD |
    SBC.W #$0080                  ;$CAA0AE |
    BPL CODE_15A0B8               ;$CAA0B1 |
    LDA.W #$0000                  ;$CAA0B3 |
    BRA CODE_15A0C0               ;$CAA0B6 |

CODE_15A0B8:
    CMP.W #$0080                  ;$CAA0B8 |
    BMI CODE_15A0C0               ;$CAA0BB |
    LDA.W #$0080                  ;$CAA0BD |

CODE_15A0C0:
    STA.W $735E                   ;$CAA0C0 |
    LDA.W Obj_YPosition,X         ;$CAA0C3 |
    SEC                           ;$CAA0C6 |
    SBC.W #$0070                  ;$CAA0C7 |
    BPL CODE_15A0D1               ;$CAA0CA |
    LDA.W #$0000                  ;$CAA0CC |
    BRA CODE_15A0D9               ;$CAA0CF |

CODE_15A0D1:
    CMP.W #$0080                  ;$CAA0D1 |
    BMI CODE_15A0D9               ;$CAA0D4 |
    LDA.W #$0080                  ;$CAA0D6 |

CODE_15A0D9:
    STA.W $7360                   ;$CAA0D9 |
    RTL                           ;$CAA0DC |
    LDA.W Obj_XPosition,X         ;$CAA0DD |
    CMP.W #$0170                  ;$CAA0E0 |
    BMI CODE_15A0F0               ;$CAA0E3 |
    STZ.W $6B6E,X                 ;$CAA0E5 |
    STZ.W $6C62,X                 ;$CAA0E8 |
    LDA.W #$0170                  ;$CAA0EB |
    BRA CODE_15A0FE               ;$CAA0EE |


CODE_15A0F0:
    CMP.W #$0010                  ;$CAA0F0 |
    BPL CODE_15A0FE               ;$CAA0F3 |
    STZ.W $6B6E,X                 ;$CAA0F5 |
    STZ.W $6C62,X                 ;$CAA0F8 |
    LDA.W #$0010                  ;$CAA0FB |

CODE_15A0FE:
    STA.W Obj_XPosition,X         ;$CAA0FE |
    LDA.W Obj_YPosition,X         ;$CAA101 |
    CMP.W #$0150                  ;$CAA104 |
    BMI CODE_15A114               ;$CAA107 |
    STZ.W $6BE8,X                 ;$CAA109 |
    STZ.W $6CDC,X                 ;$CAA10C |
    LDA.W #$0150                  ;$CAA10F |
    BRA CODE_15A122               ;$CAA112 |


CODE_15A114:
    CMP.W #$0010                  ;$CAA114 |
    BPL CODE_15A122               ;$CAA117 |
    STZ.W $6BE8,X                 ;$CAA119 |
    STZ.W $6CDC,X                 ;$CAA11C |
    LDA.W #$0010                  ;$CAA11F |

CODE_15A122:
    STA.W Obj_YPosition,X         ;$CAA122 |
    RTL                           ;$CAA125 |
    LDA.W Obj_XPosition,X         ;$CAA126 |
    SEC                           ;$CAA129 |
    SBC.W #$0080                  ;$CAA12A |
    BPL CODE_15A134               ;$CAA12D |
    LDA.W #$0000                  ;$CAA12F |
    BRA CODE_15A13C               ;$CAA132 |

CODE_15A134:
    CMP.W #$0080                  ;$CAA134 |
    BMI CODE_15A13C               ;$CAA137 |
    LDA.W #$0080                  ;$CAA139 |

CODE_15A13C:
    EOR.W #$FFFF                  ;$CAA13C |
    INC A                         ;$CAA13F |
    STA.W $305B                   ;$CAA140 |
    LDA.W Obj_YPosition,X         ;$CAA143 |
    SEC                           ;$CAA146 |
    SBC.W #$0070                  ;$CAA147 |
    BPL CODE_15A151               ;$CAA14A |
    LDA.W #$0000                  ;$CAA14C |
    BRA CODE_15A159               ;$CAA14F |

CODE_15A151:
    CMP.W #$0080                  ;$CAA151 |
    BMI CODE_15A159               ;$CAA154 |
    LDA.W #$0080                  ;$CAA156 |

CODE_15A159:
    EOR.W #$FFFF                  ;$CAA159 |
    INC A                         ;$CAA15C |
    STA.W $305D                   ;$CAA15D |
    RTL                           ;$CAA160 |
    LDA.W $6B6E,X                 ;$CAA161 |
    BEQ CODE_15A17D               ;$CAA164 |
    BMI CODE_15A172               ;$CAA166 |
    LDA.W Obj_VAR1,X              ;$CAA168 |
    BMI CODE_15A17E               ;$CAA16B |
    LDA.W #$FFFA                  ;$CAA16D |
    BRA CODE_15A17A               ;$CAA170 |

CODE_15A172:
    LDA.W Obj_VAR1,X              ;$CAA172 |
    BPL CODE_15A17E               ;$CAA175 |
    LDA.W #$0006                  ;$CAA177 |

CODE_15A17A:
    STA.W $6C62,X                 ;$CAA17A |

CODE_15A17D:
    RTL                           ;$CAA17D |

CODE_15A17E:
    STZ.W $6B6E,X                 ;$CAA17E |
    STZ.W $6C62,X                 ;$CAA181 |
    RTL                           ;$CAA184 |
    LDA.W $6BE8,X                 ;$CAA185 |
    BEQ CODE_15A1A9               ;$CAA188 |
    BMI CODE_15A19A               ;$CAA18A |
    LDA.W Obj_VAR1,X              ;$CAA18C |
    CLC                           ;$CAA18F |
    ADC.W #$8000                  ;$CAA190 |
    BMI CODE_15A1AA               ;$CAA193 |
    LDA.W #$FFFA                  ;$CAA195 |
    BRA CODE_15A1A6               ;$CAA198 |

CODE_15A19A:
    LDA.W Obj_VAR1,X              ;$CAA19A |
    CLC                           ;$CAA19D |
    ADC.W #$8000                  ;$CAA19E |
    BPL CODE_15A1AA               ;$CAA1A1 |
    LDA.W #$0006                  ;$CAA1A3 |

CODE_15A1A6:
    STA.W $6CDC,X                 ;$CAA1A6 |

CODE_15A1A9:
    RTL                           ;$CAA1A9 |

CODE_15A1AA:
    STZ.W $6BE8,X                 ;$CAA1AA |
    STZ.W $6CDC,X                 ;$CAA1AD |
    RTL                           ;$CAA1B0 |
    LDY.B $39                     ;$CAA1B1 |
    LDA.W MWW_Current_Planet      ;$CAA1B3 |
    ASL A                         ;$CAA1B6 |
    TAX                           ;$CAA1B7 |
    LDA.L DATA8_CAA73C,X          ;$CAA1B8 |
    STA.W Obj_XPosition,Y         ;$CAA1BC |
    LDA.L DATA8_CAA750,X          ;$CAA1BF |
    STA.W Obj_YPosition,Y         ;$CAA1C3 |
    RTL                           ;$CAA1C6 |
    PHY                           ;$CAA1C7 |
    PHX                           ;$CAA1C8 |
    PHA                           ;$CAA1C9 |
    LDY.B $39                     ;$CAA1CA |
    LDA.W Obj_XPosition,Y         ;$CAA1CC |
    STA.B IdentifySNES            ;$CAA1CF |
    LDA.W Obj_YPosition,Y         ;$CAA1D1 |
    STA.B DSP_P                   ;$CAA1D4 |
    LDA.W #$001C                  ;$CAA1D6 |
    STA.W ObjSlotMinimum          ;$CAA1D9 |
    LDA.W #$0026                  ;$CAA1DC |
    STA.W ObjSlotMaximum          ;$CAA1DF |
    LDA.W #$0002                  ;$CAA1E2 |
    STA.W ObjVar0_Temp            ;$CAA1E5 |
    STZ.W ObjVar1_Temp            ;$CAA1E8 |
    STZ.W ObjVar2_Temp            ;$CAA1EB |
    LDA.W #$0001                  ;$CAA1EE |
    STA.W ObjVar3_Temp            ;$CAA1F1 |
    STZ.W ObjVar4_Temp            ;$CAA1F4 |
    LDY.B DSP_P                   ;$CAA1F7 |
    LDX.B IdentifySNES            ;$CAA1F9 |
    LDA.W #$0010                  ;$CAA1FB |
    JSL.L CreateNewObject         ;$CAA1FE |
    PLA                           ;$CAA202 |
    PLX                           ;$CAA203 |
    PLY                           ;$CAA204 |
    RTL                           ;$CAA205 |
    db $16,$F1,$A6,$14,$9C,$E5,$CD,$33;$CAA206 |
    db $5F,$00,$48,$01,$33,$5E,$00,$48;$CAA20E |
    db $02,$33,$5D,$00,$48,$03,$33,$5C;$CAA216 |
    db $00,$48,$04,$00,$14,$9C,$E5,$CD;$CAA21E |
    db $C0,$E6,$5F,$CA,$03,$5A,$A3,$CA;$CAA226 |
    db $33,$58,$00,$26,$40,$00,$27,$A0;$CAA22E |
    db $00,$05,$03,$16,$FB,$A6,$80,$00;$CAA236 |
    db $00,$90,$C0,$FD,$A0,$18,$00,$B0;$CAA23E |
    db $18,$00,$40,$07,$02,$18,$A0,$E8;$CAA246 |
    db $FF,$02,$18,$B0,$E8,$FF,$02,$18;$CAA24E |
    db $A0,$18,$00,$02,$18,$07,$80,$00;$CAA256 |
    db $00,$90,$00,$00,$A0,$00,$00,$B0;$CAA25E |
    db $00,$00,$02,$20,$05,$03,$80,$00;$CAA266 |
    db $00,$90,$00,$F8,$A0,$00,$01,$B0;$CAA26E |
    db $00,$01,$02,$08,$A0,$00,$FF,$02;$CAA276 |
    db $08,$B0,$00,$FF,$02,$08,$A0,$00;$CAA27E |
    db $01,$02,$08,$07,$80,$00,$FD,$90;$CAA286 |
    db $00,$FF,$A0,$18,$00,$B0,$08,$00;$CAA28E |
    db $02,$20,$80,$00,$00,$90,$00,$00;$CAA296 |
    db $A0,$00,$00,$B0,$00,$00,$02,$10;$CAA29E |
    db $80,$00,$07,$90,$00,$02,$02,$08;$CAA2A6 |
    db $0A,$39,$A3,$80,$00,$FA,$90,$00;$CAA2AE |
    db $F8,$02,$08,$80,$00,$04,$90,$00;$CAA2B6 |
    db $02,$02,$08,$0A,$39,$A3,$80,$00;$CAA2BE |
    db $03,$90,$00,$0C,$02,$08,$80,$00;$CAA2C6 |
    db $FC,$90,$00,$FE,$02,$08,$0A,$39;$CAA2CE |
    db $A3,$80,$00,$FF,$90,$00,$FC,$A0;$CAA2D6 |
    db $08,$00,$B0,$20,$00,$02,$20,$80;$CAA2DE |
    db $00,$04,$90,$00,$05,$02,$08,$80;$CAA2E6 |
    db $00,$FA,$90,$00,$06,$A0,$60,$00;$CAA2EE |
    db $B0,$A0,$FF,$02,$18,$80,$00,$04;$CAA2F6 |
    db $90,$00,$FA,$A0,$00,$00,$B0,$00;$CAA2FE |
    db $00,$02,$08,$80,$00,$FC,$90,$00;$CAA306 |
    db $FA,$A0,$40,$00,$B0,$60,$00,$02;$CAA30E |
    db $18,$80,$20,$02,$90,$C0,$04,$A0;$CAA316 |
    db $00,$00,$B0,$00,$00,$02,$08,$0A;$CAA31E |
    db $39,$A3,$80,$E0,$FF,$90,$A0,$FF;$CAA326 |
    db $A0,$00,$00,$B0,$00,$00,$02,$0C;$CAA32E |
    db $0E,$31,$A2,$05,$06,$16,$FB,$A6;$CAA336 |
    db $80,$00,$00,$90,$00,$FE,$A0,$00;$CAA33E |
    db $00,$B0,$00,$00,$40,$07,$02,$01;$CAA346 |
    db $90,$00,$02,$02,$02,$90,$00,$FE;$CAA34E |
    db $02,$01,$07,$0C            ;$CAA356 |
    LDX.B $39                     ;$CAA35A |
    LDA.W Obj_VAR3,X              ;$CAA35C |
    CMP.W #$0002                  ;$CAA35F |
    BMI CODE_15A38D               ;$CAA362 |
    STZ.W Obj_VAR3,X              ;$CAA364 |
    LDA.W Obj_VAR1,X              ;$CAA367 |
    CLC                           ;$CAA36A |
    ADC.W #$71F9                  ;$CAA36B |
    LDX.W #$00CA                  ;$CAA36E |
    LDY.W #$E010                  ;$CAA371 |
    JSL.L WritePal                ;$CAA374 |
    LDY.B $39                     ;$CAA378 |
    LDA.W Obj_VAR1,Y              ;$CAA37A |
    CLC                           ;$CAA37D |
    ADC.W #$0020                  ;$CAA37E |
    CMP.W #$06C0                  ;$CAA381 |
    BMI CODE_15A389               ;$CAA384 |
    LDA.W #$0000                  ;$CAA386 |

CODE_15A389:
    STA.W Obj_VAR1,Y              ;$CAA389 |
    RTL                           ;$CAA38C |

CODE_15A38D:
    INC.W Obj_VAR3,X              ;$CAA38D |
    RTL                           ;$CAA390 |
    db $14,$9C,$E5,$CD,$C0,$E6,$5F,$CA;$CAA391 |
    db $03,$CF,$A4,$CA,$33,$58,$00,$26;$CAA399 |
    db $58,$00,$27,$A0,$00,$05,$03,$16;$CAA3A1 |
    db $FB,$A6,$80,$00,$00,$90,$40,$02;$CAA3A9 |
    db $A0,$E8,$FF,$B0,$E8,$FF,$40,$08;$CAA3B1 |
    db $02,$18,$A0,$18,$00,$02,$18,$B0;$CAA3B9 |
    db $18,$00,$02,$18,$A0,$E8,$FF,$02;$CAA3C1 |
    db $18,$07,$80,$00,$00,$90,$00,$00;$CAA3C9 |
    db $A0,$00,$00,$B0,$00,$00,$02,$20;$CAA3D1 |
    db $05,$03,$80,$00,$00,$90,$00,$08;$CAA3D9 |
    db $A0,$00,$FF,$B0,$00,$FF,$02,$08;$CAA3E1 |
    db $A0,$00,$01,$02,$08,$B0,$00,$01;$CAA3E9 |
    db $02,$08,$A0,$00,$FF,$02,$08,$07;$CAA3F1 |
    db $80,$00,$03,$90,$00,$01,$A0,$E8;$CAA3F9 |
    db $FF,$B0,$F8,$FF,$02,$20,$80,$00;$CAA401 |
    db $00,$90,$00,$00,$A0,$00,$00,$B0;$CAA409 |
    db $00,$00,$02,$10,$80,$00,$F9,$90;$CAA411 |
    db $00,$FE,$A0,$00,$00,$B0,$00,$00;$CAA419 |
    db $02,$08,$0A,$AE,$A4,$80,$00,$02;$CAA421 |
    db $90,$00,$F8,$02,$08,$80,$00,$FC;$CAA429 |
    db $90,$00,$02,$02,$08,$0A,$AE,$A4;$CAA431 |
    db $80,$00,$F9,$90,$00,$0C,$02,$08;$CAA439 |
    db $80,$00,$04,$90,$00,$FE,$02,$08;$CAA441 |
    db $0A,$AE,$A4,$80,$00,$04,$90,$00;$CAA449 |
    db $01,$A0,$E0,$FF,$B0,$F8,$FF,$02;$CAA451 |
    db $20,$80,$00,$FC,$90,$00,$FB,$02;$CAA459 |
    db $08,$80,$00,$06,$90,$00,$FA,$A0;$CAA461 |
    db $A0,$FF,$B0,$60,$00,$02,$18,$80;$CAA469 |
    db $00,$FC,$90,$00,$06,$A0,$00,$00;$CAA471 |
    db $B0,$00,$00,$02,$08,$80,$00,$04;$CAA479 |
    db $90,$00,$06,$A0,$C0,$FF,$B0,$A0;$CAA481 |
    db $FF,$02,$18,$80,$E0,$FE,$90,$A0;$CAA489 |
    db $FA,$A0,$00,$00,$B0,$00,$00,$02;$CAA491 |
    db $08,$0A,$AE,$A4,$80,$C0,$00,$90;$CAA499 |
    db $40,$FF,$A0,$00,$00,$B0,$00,$00;$CAA4A1 |
    db $02,$0C,$0E,$A0,$A3,$05,$06,$16;$CAA4A9 |
    db $FB,$A6,$80,$00,$00,$90,$00,$02;$CAA4B1 |
    db $A0,$00,$00,$B0,$00,$00,$40,$08;$CAA4B9 |
    db $02,$01,$90,$00,$FE,$02,$02,$90;$CAA4C1 |
    db $00,$02,$02,$01,$07,$0C    ;$CAA4C9 |
    LDX.B $39                     ;$CAA4CF |
    LDA.W Obj_VAR3,X              ;$CAA4D1 |
    CMP.W #$0002                  ;$CAA4D4 |
    BMI CODE_15A502               ;$CAA4D7 |
    STZ.W Obj_VAR3,X              ;$CAA4D9 |
    LDA.W Obj_VAR1,X              ;$CAA4DC |
    CLC                           ;$CAA4DF |
    ADC.W #$6C19                  ;$CAA4E0 |
    LDX.W #$00CA                  ;$CAA4E3 |
    LDY.W #$C010                  ;$CAA4E6 |
    JSL.L WritePal                ;$CAA4E9 |
    LDY.B $39                     ;$CAA4ED |
    LDA.W Obj_VAR1,Y              ;$CAA4EF |
    CLC                           ;$CAA4F2 |
    ADC.W #$0020                  ;$CAA4F3 |
    CMP.W #$0200                  ;$CAA4F6 |
    BMI CODE_15A4FE               ;$CAA4F9 |
    LDA.W #$0000                  ;$CAA4FB |

CODE_15A4FE:
    STA.W Obj_VAR1,Y              ;$CAA4FE |
    RTL                           ;$CAA501 |

CODE_15A502:
    INC.W Obj_VAR3,X              ;$CAA502 |
    RTL                           ;$CAA505 |
    db $C0,$E6,$5F,$CA,$03,$26,$A5,$CA;$CAA506 |
    db $26,$18,$01,$27,$10,$01,$14,$9C;$CAA50E |
    db $E5,$CD,$33,$58,$00,$46,$0A,$46;$CAA516 |
    db $0B,$46,$0C,$46,$0D,$0E,$1B,$A5;$CAA51E |
    LDX.B $39                     ;$CAA526 |
    LDA.W Obj_VAR3,X              ;$CAA528 |
    CMP.W #$0003                  ;$CAA52B |
    BMI CODE_15A55C               ;$CAA52E |
    STZ.W Obj_VAR3,X              ;$CAA530 |
    LDA.W Obj_VAR1,X              ;$CAA533 |
    CLC                           ;$CAA536 |
    ADC.W #$7979                  ;$CAA537 |
    LDX.W #$00CA                  ;$CAA53A |
    LDY.W #$8010                  ;$CAA53D |
    JSL.L WritePal                ;$CAA540 |
    LDY.B $39                     ;$CAA544 |
    LDA.W Obj_VAR1,Y              ;$CAA546 |
    CLC                           ;$CAA549 |
    ADC.W #$0020                  ;$CAA54A |
    CMP.W #$0180                  ;$CAA54D |
    BMI CODE_15A555               ;$CAA550 |
    LDA.W #$0000                  ;$CAA552 |

CODE_15A555:
    STA.W Obj_VAR1,Y              ;$CAA555 |
    LDA.W #$0001                  ;$CAA558 |
    RTL                           ;$CAA55B |

CODE_15A55C:
    INC.W Obj_VAR3,X              ;$CAA55C |
    LDA.W #$0001                  ;$CAA55F |
    RTL                           ;$CAA562 |
    db $C0,$E6,$5F,$CA,$03,$7B,$A5,$CA;$CAA563 |
    db $26,$50,$01,$27,$A8,$00,$14,$9C;$CAA56B |
    db $E5,$CD,$33,$58,$00,$40,$06,$01;$CAA573 |
    LDX.B $39                     ;$CAA57B |
    LDA.W Obj_VAR3,X              ;$CAA57D |
    CMP.W #$0003                  ;$CAA580 |
    BMI CODE_15A5B1               ;$CAA583 |
    STZ.W Obj_VAR3,X              ;$CAA585 |
    LDA.W Obj_VAR1,X              ;$CAA588 |
    CLC                           ;$CAA58B |
    ADC.W #$7019                  ;$CAA58C |
    LDX.W #$00CA                  ;$CAA58F |
    LDY.W #$B010                  ;$CAA592 |
    JSL.L WritePal                ;$CAA595 |
    LDY.B $39                     ;$CAA599 |
    LDA.W Obj_VAR1,Y              ;$CAA59B |
    CLC                           ;$CAA59E |
    ADC.W #$0020                  ;$CAA59F |
    CMP.W #$0140                  ;$CAA5A2 |
    BMI CODE_15A5AA               ;$CAA5A5 |
    LDA.W #$0000                  ;$CAA5A7 |

CODE_15A5AA:
    STA.W Obj_VAR1,Y              ;$CAA5AA |
    LDA.W #$0005                  ;$CAA5AD |
    RTL                           ;$CAA5B0 |

CODE_15A5B1:
    INC.W Obj_VAR3,X              ;$CAA5B1 |
    LDA.W #$0005                  ;$CAA5B4 |
    RTL                           ;$CAA5B7 |
    db $C0,$E6,$5F,$CA,$03,$D8,$A5,$CA;$CAA5B8 |
    db $26,$88,$00,$27,$B0,$00,$14,$9C;$CAA5C0 |
    db $E5,$CD,$33,$58,$00,$40,$09,$C0;$CAA5C8 |
    db $E5,$A5,$CA,$02,$06,$0E,$CF,$A5;$CAA5D0 |
    LDA.W P1_Frame                ;$CAA5D8 |
    AND.W #$C0C0                  ;$CAA5DB |
    BEQ CODE_15A5E4               ;$CAA5DE |
    JSL.L CODE_FL_CAA692          ;$CAA5E0 |

CODE_15A5E4:
    RTL                           ;$CAA5E4 |
    LDA.W $7A6B                   ;$CAA5E5 |
    AND.W #$0001                  ;$CAA5E8 |
    BEQ CODE_15A5FA               ;$CAA5EB |
    LDA.W #$0000                  ;$CAA5ED |
    STA.W ObjVar0_Temp            ;$CAA5F0 |
    LDX.W #$00B5                  ;$CAA5F3 |
    JSL.L CODE_FL_009AEB          ;$CAA5F6 |

CODE_15A5FA:
    LDA.W $7A6B                   ;$CAA5FA |
    AND.W #$0002                  ;$CAA5FD |
    BEQ CODE_15A60F               ;$CAA600 |
    LDA.W #$0001                  ;$CAA602 |
    STA.W ObjVar0_Temp            ;$CAA605 |
    LDX.W #$00B5                  ;$CAA608 |
    JSL.L CODE_FL_009AEB          ;$CAA60B |

CODE_15A60F:
    LDA.W $7A6B                   ;$CAA60F |
    AND.W #$0004                  ;$CAA612 |
    BEQ CODE_15A624               ;$CAA615 |
    LDA.W #$0002                  ;$CAA617 |
    STA.W ObjVar0_Temp            ;$CAA61A |
    LDX.W #$00B5                  ;$CAA61D |
    JSL.L CODE_FL_009AEB          ;$CAA620 |

CODE_15A624:
    LDA.W $7A6B                   ;$CAA624 |
    AND.W #$0008                  ;$CAA627 |
    BEQ CODE_15A639               ;$CAA62A |
    LDA.W #$0003                  ;$CAA62C |
    STA.W ObjVar0_Temp            ;$CAA62F |
    LDX.W #$00B5                  ;$CAA632 |
    JSL.L CODE_FL_009AEB          ;$CAA635 |

CODE_15A639:
    LDA.W $7A6B                   ;$CAA639 |
    AND.W #$0010                  ;$CAA63C |
    BEQ CODE_15A64E               ;$CAA63F |
    LDA.W #$0004                  ;$CAA641 |
    STA.W ObjVar0_Temp            ;$CAA644 |
    LDX.W #$00B5                  ;$CAA647 |
    JSL.L CODE_FL_009AEB          ;$CAA64A |

CODE_15A64E:
    LDA.W $7A6B                   ;$CAA64E |
    AND.W #$0020                  ;$CAA651 |
    BEQ CODE_15A663               ;$CAA654 |
    LDA.W #$0005                  ;$CAA656 |
    STA.W ObjVar0_Temp            ;$CAA659 |
    LDX.W #$00B5                  ;$CAA65C |
    JSL.L CODE_FL_009AEB          ;$CAA65F |

CODE_15A663:
    LDA.W $7A6B                   ;$CAA663 |
    AND.W #$007F                  ;$CAA666 |
    SEC                           ;$CAA669 |
    SBC.W #$007F                  ;$CAA66A |
    BNE CODE_15A67C               ;$CAA66D |
    LDA.W #$0007                  ;$CAA66F |
    STA.W ObjVar0_Temp            ;$CAA672 |
    LDX.W #$00B5                  ;$CAA675 |
    JSL.L CODE_FL_009AEB          ;$CAA678 |

CODE_15A67C:
    LDA.W $7A6B                   ;$CAA67C |
    AND.W #$0040                  ;$CAA67F |
    BEQ CODE_15A691               ;$CAA682 |
    LDA.W #$0006                  ;$CAA684 |
    STA.W ObjVar0_Temp            ;$CAA687 |
    LDX.W #$00B5                  ;$CAA68A |
    JSL.L CODE_FL_009AEB          ;$CAA68D |

CODE_15A691:
    RTL                           ;$CAA691 |
    LDX.B $39                     ;$CAA692 |
    STZ.W Obj_VAR0,X              ;$CAA694 |
    LDY.W #$0002                  ;$CAA697 |
    LDA.W Obj_XPosition,Y         ;$CAA69A |
    STA.W Obj_VAR1,X              ;$CAA69D |
    LDA.W Obj_YPosition,Y         ;$CAA6A0 |
    STA.W Obj_VAR2,X              ;$CAA6A3 |

CODE_JP_15A6A6:
    LDY.B $39                     ;$CAA6A6 |
    LDA.W Obj_VAR0,Y              ;$CAA6A8 |
    CMP.W #$0008                  ;$CAA6AB |
    BNE CODE_15A6BE               ;$CAA6AE |
    LDA.W $7A6B                   ;$CAA6B0 |
    AND.W #$007F                  ;$CAA6B3 |
    CMP.W #$007F                  ;$CAA6B6 |
    BNE CODE_15A72C               ;$CAA6B9 |
    LDA.W Obj_VAR0,Y              ;$CAA6BB |

CODE_15A6BE:
    ASL A                         ;$CAA6BE |
    TAX                           ;$CAA6BF |
    LDA.L DATA8_CAA73C,X          ;$CAA6C0 |
    CLC                           ;$CAA6C4 |
    ADC.W #$0010                  ;$CAA6C5 |
    SEC                           ;$CAA6C8 |
    SBC.W Obj_VAR1,Y              ;$CAA6C9 |
    BMI CODE_15A72C               ;$CAA6CC |
    SEC                           ;$CAA6CE |
    SBC.W #$0010                  ;$CAA6CF |
    SEC                           ;$CAA6D2 |
    SBC.W #$0010                  ;$CAA6D3 |
    BPL CODE_15A72C               ;$CAA6D6 |
    LDA.W Obj_VAR0,Y              ;$CAA6D8 |
    ASL A                         ;$CAA6DB |
    TAX                           ;$CAA6DC |
    LDA.L DATA8_CAA750,X          ;$CAA6DD |
    CLC                           ;$CAA6E1 |
    ADC.W #$0010                  ;$CAA6E2 |
    SEC                           ;$CAA6E5 |
    SBC.W Obj_VAR2,Y              ;$CAA6E6 |
    BMI CODE_15A72C               ;$CAA6E9 |
    SEC                           ;$CAA6EB |
    SBC.W #$0010                  ;$CAA6EC |
    SEC                           ;$CAA6EF |
    SBC.W #$0010                  ;$CAA6F0 |
    BPL CODE_15A72C               ;$CAA6F3 |
    LDA.W Obj_VAR0,Y              ;$CAA6F5 |
    CMP.W #$0008                  ;$CAA6F8 |
    BNE CODE_15A70C               ;$CAA6FB |
    LDX.W #$0000                  ;$CAA6FD |
    LDA.W #$0001                  ;$CAA700 |
    STA.W Obj_VAR5,X              ;$CAA703 |
    LDA.W #$0004                  ;$CAA706 |
    STA.W MWW_Current_Planet      ;$CAA709 |

CODE_15A70C:
    STA.W MWW_Current_Planet      ;$CAA70C |
    STZ.W $7A73                   ;$CAA70F |
    LDX.W #$0002                  ;$CAA712 |
    STZ.W $6B6E,X                 ;$CAA715 |
    STZ.W $6BE8,X                 ;$CAA718 |
    STZ.W $6C62,X                 ;$CAA71B |
    STZ.W $6CDC,X                 ;$CAA71E |
    LDA.W #$9EC6                  ;$CAA721 |
    LDY.W #$00CA                  ;$CAA724 |
    JSL.L CODE_FL_008F64          ;$CAA727 |
    RTL                           ;$CAA72B |

CODE_15A72C:
    TYX                           ;$CAA72C |
    INC.W Obj_VAR0,X              ;$CAA72D |
    LDA.W Obj_VAR0,X              ;$CAA730 |
    CMP.W #$0009                  ;$CAA733 |
    BPL CODE_15A73B               ;$CAA736 |
    JMP.W CODE_JP_15A6A6          ;$CAA738 |

CODE_15A73B:
    RTL                           ;$CAA73B |
    db $28,$00,$18,$01,$C8,$00,$F0,$00;$CAA73C |
    db $88,$00,$50,$01,$E8,$00,$C8,$00;$CAA744 |
    db $50,$01,$48,$00,$48,$00,$10,$01;$CAA74C |
    db $00,$01,$B0,$00,$68,$00,$A8,$00;$CAA754 |
    db $40,$00,$C8,$00,$34,$00,$A8,$00;$CAA75C |
    db $C0,$E6,$5F,$CA,$26,$50,$01,$27;$CAA764 |
    db $34,$00,$14,$9C,$E5,$CD,$33,$58;$CAA76C |
    db $00,$40,$05,$01,$C0,$BE,$84,$00;$CAA774 |
    db $16,$F1,$A6,$04,$14,$FF,$FF,$FF;$CAA77C |
    db $40,$FF,$C0,$94,$9C,$00,$09,$C0;$CAA784 |
    db $BB,$9C,$00,$00,$00,$60,$00,$C0;$CAA78C |
    db $9A,$9C,$00,$00,$01,$00,$00,$00;$CAA794 |
    db $48,$C0,$9A,$9C,$00,$01,$00,$00;$CAA79C |
    db $00,$00,$50,$C0,$CE,$9C,$00,$13;$CAA7A4 |
    db $C0,$85,$9F,$00,$00,$C0,$EA,$9F;$CAA7AC |
    db $00,$99,$BE,$E9,$00,$00,$02,$C0;$CAA7B4 |
    db $6C,$9C,$00,$D9,$AB,$CA,$F0,$1D;$CAA7BC |
    db $0A,$CE,$5F,$C0,$BC,$9B,$00,$00;$CAA7C4 |
    db $00,$00,$00,$02,$10,$00,$80,$00;$CAA7CC |
    db $80,$00,$02,$00,$00,$00,$C0,$BC;$CAA7D4 |
    db $9B,$00,$08,$00,$00,$00,$04,$10;$CAA7DC |
    db $00,$00,$00,$00,$00,$02,$00,$00;$CAA7E4 |
    db $00,$C0,$BC,$9B,$00,$09,$00,$00;$CAA7EC |
    db $00,$06,$10,$00,$00,$00,$00,$00;$CAA7F4 |
    db $02,$00,$00,$00,$C0,$BC,$9B,$00;$CAA7FC |
    db $04,$00,$00,$00,$08,$10,$00,$00;$CAA804 |
    db $00,$00,$00,$02,$00,$00,$00,$C0;$CAA80C |
    db $BC,$9B,$00,$05,$00,$00,$00,$0A;$CAA814 |
    db $10,$00,$30,$00,$D0,$00,$02,$00;$CAA81C |
    db $00,$00,$C0,$BC,$9B,$00,$0A,$00;$CAA824 |
    db $00,$00,$0C,$10,$00,$00,$00,$00;$CAA82C |
    db $00,$02,$00,$00,$00,$C0,$BC,$9B;$CAA834 |
    db $00,$0B,$00,$00,$00,$0E,$10,$00;$CAA83C |
    db $00,$00,$00,$00,$02,$00,$00,$00;$CAA844 |
    db $1B,$73,$7A,$FF,$FF,$05,$10,$C2;$CAA84C |
    db $CD,$9F,$00,$07,$C1,$C9,$A2,$00;$CAA854 |
    db $73,$7A,$00,$00,$11,$58,$A8,$05;$CAA85C |
    db $10,$C2,$DD,$9F,$00,$07,$C0,$6C;$CAA864 |
    db $92,$00,$02,$01,$C0,$EF,$9B,$00;$CAA86C |
    db $C0,$BE,$84,$00,$C0,$93,$9E,$CA;$CAA874 |
    db $C0,$7E,$9E,$CA,$1B,$92,$73,$01;$CAA87C |
    db $00,$C0,$8A,$A8,$CA,$01    ;$CAA884 |
    LDA.W #$0005                  ;$CAA88A |
    LDX.W #$0008                  ;$CAA88D |
    LDY.W #$0000                  ;$CAA890 |
    JSL.L CODE_FL_00DA97          ;$CAA893 |
    LDA.W #$0001                  ;$CAA897 |
    STA.W $3332                   ;$CAA89A |
    RTL                           ;$CAA89D |
    db $14,$9C,$E5,$CD,$C0,$E6,$5F,$CA;$CAA89E |
    db $03,$5A,$A3,$CA,$33,$5F,$00,$26;$CAA8A6 |
    db $42,$00,$27,$98,$00,$05,$10,$16;$CAA8AE |
    db $FB,$A6,$90,$00,$FF,$40,$07,$02;$CAA8B6 |
    db $01,$90,$00,$01,$02,$02,$90,$00;$CAA8BE |
    db $FF,$02,$01,$07,$80,$00,$FC,$90;$CAA8C6 |
    db $00,$FC,$A0,$40,$00,$B0,$40,$00;$CAA8CE |
    db $02,$10,$80,$00,$00,$90,$00,$00;$CAA8D6 |
    db $A0,$00,$00,$B0,$00,$00,$02,$10;$CAA8DE |
    db $05,$02,$90,$00,$FF,$02,$01,$90;$CAA8E6 |
    db $00,$01,$02,$02,$90,$00,$FF,$02;$CAA8EE |
    db $01,$07,$80,$00,$FC,$90,$00,$00;$CAA8F6 |
    db $A0,$40,$00,$B0,$00,$00,$02,$28;$CAA8FE |
    db $05,$07,$80,$00,$02,$A0,$00,$00;$CAA906 |
    db $02,$02,$80,$00,$FF,$02,$02,$07;$CAA90E |
    db $05,$14,$80,$00,$00,$90,$00,$FF;$CAA916 |
    db $02,$02,$90,$00,$01,$02,$02,$07;$CAA91E |
    db $05,$18,$80,$00,$01,$90,$00,$FF;$CAA926 |
    db $02,$02,$80,$80,$FE,$90,$80,$01;$CAA92E |
    db $02,$02,$07,$05,$30,$80,$80,$FF;$CAA936 |
    db $90,$80,$00,$02,$02,$80,$C0,$00;$CAA93E |
    db $90,$40,$FF,$02,$02,$07,$0E,$16;$CAA946 |
    db $A9,$14,$9C,$E5,$CD,$C0,$E6,$5F;$CAA94E |
    db $CA,$03,$CF,$A4,$CA,$33,$5F,$00;$CAA956 |
    db $26,$50,$00,$27,$A4,$00,$05,$10;$CAA95E |
    db $16,$FB,$A6,$90,$00,$FF,$40,$08;$CAA966 |
    db $02,$01,$90,$00,$01,$02,$02,$90;$CAA96E |
    db $00,$FF,$02,$01,$07,$80,$00,$04;$CAA976 |
    db $90,$00,$04,$A0,$C0,$FF,$B0,$C0;$CAA97E |
    db $FF,$02,$10,$80,$00,$00,$90,$00;$CAA986 |
    db $00,$A0,$00,$00,$B0,$00,$00,$02;$CAA98E |
    db $10,$05,$02,$90,$00,$FF,$02,$01;$CAA996 |
    db $90,$00,$01,$02,$02,$90,$00,$FF;$CAA99E |
    db $02,$01,$07,$80,$00,$00,$90,$00;$CAA9A6 |
    db $04,$A0,$00,$00,$B0,$C0,$FF,$02;$CAA9AE |
    db $28,$05,$07,$90,$00,$FE,$B0,$00;$CAA9B6 |
    db $00,$02,$02,$90,$00,$01,$02,$02;$CAA9BE |
    db $07,$05,$14,$80,$00,$00,$90,$00;$CAA9C6 |
    db $FF,$02,$02,$90,$00,$01,$02,$02;$CAA9CE |
    db $07,$05,$18,$80,$00,$01,$90,$00;$CAA9D6 |
    db $FF,$02,$02,$80,$80,$FE,$90,$80;$CAA9DE |
    db $01,$02,$02,$07,$05,$30,$80,$80;$CAA9E6 |
    db $FF,$90,$80,$00,$02,$02,$80,$C0;$CAA9EE |
    db $00,$90,$40,$FF,$02,$02,$07,$0E;$CAA9F6 |
    db $C7,$A9,$C0,$E6,$5F,$CA,$26,$88;$CAA9FE |
    db $00,$27,$B0,$00,$14,$9C,$E5,$CD;$CAAA06 |
    db $33,$58,$00,$40,$09,$01,$C0,$1D;$CAAA0E |
    db $AA,$CA,$02,$06,$0E,$CF,$A5,$A9;$CAAA16 |
    db $00,$00,$8D,$00,$60,$A2,$B5,$00;$CAAA1E |
    db $22,$EB,$9A,$00,$A9,$01,$00,$8D;$CAAA26 |
    db $00,$60,$A2,$B5,$00,$22,$EB,$9A;$CAAA2E |
    db $00,$A9,$02,$00,$8D,$00,$60,$A2;$CAAA36 |
    db $B5,$00,$22,$EB,$9A,$00,$A9,$03;$CAAA3E |
    db $00,$8D,$00,$60,$A2,$B5,$00,$22;$CAAA46 |
    db $EB,$9A,$00,$A9,$04,$00,$8D,$00;$CAAA4E |
    db $60,$A2,$B5,$00,$22,$EB,$9A,$00;$CAAA56 |
    db $A9,$05,$00,$8D,$00,$60,$A2,$B5;$CAAA5E |
    db $00,$22,$EB,$9A,$00,$A9,$07,$00;$CAAA66 |
    db $8D,$00,$60,$A2,$B5,$00,$22,$EB;$CAAA6E |
    db $9A,$00,$6B,$14,$9C,$E5,$CD,$C0;$CAAA76 |
    db $E6,$5F,$CA,$03,$49,$AB,$CA,$33;$CAAA7E |
    db $5E,$00,$26,$F4,$00,$27,$14,$00;$CAAA86 |
    db $05,$30,$C0,$BC,$9B,$00,$0C,$00;$CAAA8E |
    db $00,$00,$10,$10,$00,$00,$00,$00;$CAAA96 |
    db $00,$02,$00,$00,$00,$16,$FB,$A6;$CAAA9E |
    db $80,$00,$FF,$90,$C0,$00,$40,$05;$CAAAA6 |
    db $02,$03,$07,$05,$06,$C0,$BC,$9B;$CAAAAE |
    db $00,$0C,$00,$00,$00,$12,$10,$00;$CAAAB6 |
    db $00,$00,$00,$00,$02,$00,$00,$00;$CAAABE |
    db $80,$00,$01,$90,$00,$FE,$02,$02;$CAAAC6 |
    db $80,$00,$00,$90,$00,$01,$02,$02;$CAAACE |
    db $07,$05,$14,$C0,$BC,$9B,$00,$0C;$CAAAD6 |
    db $00,$00,$00,$14,$10,$00,$00,$00;$CAAADE |
    db $00,$00,$02,$00,$00,$00,$80,$00;$CAAAE6 |
    db $00,$90,$00,$FF,$02,$02,$90,$00;$CAAAEE |
    db $01,$02,$02,$07,$05,$18,$C0,$BC;$CAAAF6 |
    db $9B,$00,$0C,$00,$00,$00,$16,$10;$CAAAFE |
    db $00,$00,$00,$00,$00,$02,$00,$00;$CAAB06 |
    db $00,$80,$00,$01,$90,$00,$FF,$02;$CAAB0E |
    db $02,$80,$80,$FE,$90,$80,$01,$02;$CAAB16 |
    db $02,$07,$05,$30,$C0,$BC,$9B,$00;$CAAB1E |
    db $0C,$00,$00,$00,$18,$10,$00,$00;$CAAB26 |
    db $00,$00,$00,$02,$00,$00,$00,$80;$CAAB2E |
    db $80,$FF,$90,$80,$00,$02,$02,$80;$CAAB36 |
    db $C0,$00,$90,$40,$FF,$02,$02,$07;$CAAB3E |
    db $0E,$D7,$AA                ;$CAAB46 |
    LDA.W P1_Frame                ;$CAAB49 |
    AND.W #$C0C0                  ;$CAAB4C |
    BEQ CODE_15AB81               ;$CAAB4F |
    LDY.W #$0002                  ;$CAAB51 |
    LDX.B $39                     ;$CAAB54 |
    LDA.W #$1010                  ;$CAAB56 |
    JSL.L CODE_FL_CAAB82          ;$CAAB59 |
    CMP.W #$0000                  ;$CAAB5D |
    BNE CODE_15AB81               ;$CAAB60 |
    LDX.W #$0002                  ;$CAAB62 |
    STZ.W $7A73                   ;$CAAB65 |
    STZ.W $6B6E,X                 ;$CAAB68 |
    STZ.W $6BE8,X                 ;$CAAB6B |
    STZ.W $6C62,X                 ;$CAAB6E |
    STZ.W $6CDC,X                 ;$CAAB71 |
    LDA.W #$9EC6                  ;$CAAB74 |
    LDY.W #$00CA                  ;$CAAB77 |
    LDX.W #$0002                  ;$CAAB7A |
    JSL.L CODE_FL_008F64          ;$CAAB7D |

CODE_15AB81:
    RTL                           ;$CAAB81 |
    PHX                           ;$CAAB82 |
    PHY                           ;$CAAB83 |
    PHA                           ;$CAAB84 |
    AND.W #$00FF                  ;$CAAB85 |
    STA.B IdentifySNES            ;$CAAB88 |
    PLA                           ;$CAAB8A |
    XBA                           ;$CAAB8B |
    AND.W #$00FF                  ;$CAAB8C |
    STA.B DSP_P                   ;$CAAB8F |
    LDA.W Obj_XPositionMirror,X   ;$CAAB91 |
    SEC                           ;$CAAB94 |
    SBC.W Obj_XPositionMirror,Y   ;$CAAB95 |
    BPL CODE_15AB9E               ;$CAAB98 |
    EOR.W #$FFFF                  ;$CAAB9A |
    INC A                         ;$CAAB9D |

CODE_15AB9E:
    CMP.B IdentifySNES            ;$CAAB9E |
    BCS CODE_15ABB8               ;$CAABA0 |
    LDA.W Obj_YPositionMirror,X   ;$CAABA2 |
    SEC                           ;$CAABA5 |
    SBC.W Obj_YPositionMirror,Y   ;$CAABA6 |
    BPL CODE_15ABAF               ;$CAABA9 |
    EOR.W #$FFFF                  ;$CAABAB |
    INC A                         ;$CAABAE |

CODE_15ABAF:
    CMP.B DSP_P                   ;$CAABAF |
    BCS CODE_15ABB8               ;$CAABB1 |
    LDA.W #$0000                  ;$CAABB3 |
    BRA CODE_15ABBB               ;$CAABB6 |

CODE_15ABB8:
    LDA.W #$FFFF                  ;$CAABB8 |

CODE_15ABBB:
    PLY                           ;$CAABBB |
    PLX                           ;$CAABBC |
    RTL                           ;$CAABBD |
    db $16,$FB,$A6,$C0,$E6,$5F,$CA,$14;$CAABBE |
    db $9C,$E5,$CD,$33,$59,$00,$80,$00;$CAABC6 |
    db $04,$90,$80,$FC,$44,$0E,$44,$0E;$CAABCE |
    db $44,$0E,$00,$83,$00,$14,$30,$2E;$CAABD6 |
    db $E1,$00,$76,$83,$80,$1A,$C6,$51;$CAABDE |
    db $DF,$00,$60,$83,$00,$09,$B8,$29;$CAABE6 |
    db $E6,$00,$00,$89,$00,$08,$81,$EB;$CAABEE |
    db $ED,$00,$48,$0F,$00,$08,$00,$28;$CAABF6 |
    db $7E,$00,$48,$89,$00,$04,$19,$E6;$CAABFE |
    db $E6,$00,$50,$0F,$00,$04,$00,$24;$CAAC06 |
    db $7E,$00,$50,$FF,$C0,$BE,$84,$00;$CAAC0E |
    db $C0,$EF,$9B,$00,$C0,$94,$9C,$00;$CAAC16 |
    db $09,$C0,$BB,$9C,$00,$00,$00,$60;$CAAC1E |
    db $00,$C0,$9A,$9C,$00,$00,$01,$00;$CAAC26 |
    db $00,$00,$40,$C0,$9A,$9C,$00,$01;$CAAC2E |
    db $00,$00,$00,$00,$5C,$C0,$9A,$9C;$CAAC36 |
    db $00,$02,$01,$00,$50,$00,$48,$C0;$CAAC3E |
    db $CE,$9C,$00,$16,$C0,$85,$9F,$00;$CAAC46 |
    db $00,$C0,$EA,$9F,$00,$CD,$D8,$EF;$CAAC4E |
    db $00,$20,$00,$C0,$EA,$9F,$00,$F5;$CAAC56 |
    db $F4,$EB,$10,$E0,$00,$C0,$EA,$9F;$CAAC5E |
    db $00,$18,$DE,$EF,$91,$1E,$00,$C0;$CAAC66 |
    db $EA,$9F,$00,$6A,$3D,$EC,$A0,$C0;$CAAC6E |
    db $00,$C0,$6C,$9C,$00,$C7,$BD,$CA;$CAAC76 |
    db $C0,$8F,$A2,$00,$B5,$7B,$E7,$00;$CAAC7E |
    db $70,$7E,$C0,$8F,$A2,$00,$B6,$4E;$CAAC86 |
    db $E7,$00,$60,$7E,$C0,$C0,$AE,$CA;$CAAC8E |
    db $C0,$6E,$B8,$CA,$C0,$AA,$B8,$CA;$CAAC96 |
    db $C0,$4D,$AF,$CA,$C0,$6C,$9C,$00;$CAAC9E |
    db $E0,$BD,$CA,$F0,$16,$C0,$F3,$D2;$CAACA6 |
    db $00,$0C,$C0,$64,$CE,$00,$FF,$C0;$CAACAE |
    db $10,$9D,$00,$00,$00,$00,$00,$2E;$CAACB6 |
    db $00,$2E,$01,$2F,$02,$80,$FF,$30;$CAACBE |
    db $02,$80,$FF,$1B,$89,$7A,$00,$00;$CAACC6 |
    db $1B,$8D,$7A,$00,$00,$1B,$9D,$7A;$CAACCE |
    db $00,$00,$15,$90,$AB,$16,$BA,$A8;$CAACD6 |
    db $14,$FF,$FF,$FF,$40,$FF,$C0,$15;$CAACDE |
    db $AE,$CA,$05,$10,$C1,$CD,$9F,$00;$CAACE6 |
    db $07,$21,$01,$10,$F7,$AC,$0A,$73;$CAACEE |
    db $AF,$C0,$69,$AE,$CA,$C0,$55,$AE;$CAACF6 |
    db $CA,$2F,$02,$80,$FF,$30,$02,$80;$CAACFE |
    db $FF,$1B,$83,$7A,$FF,$FF,$C1,$C9;$CAAD06 |
    db $A2,$00,$83,$7A,$00,$00,$11,$0C;$CAAD0E |
    db $AD,$C0,$F6,$AE,$CA,$0F,$05,$67;$CAAD16 |
    db $AD,$27,$AD,$39,$AD,$50,$AD,$07;$CAAD1E |
    db $AD,$05,$10,$C1,$DD,$9F,$00,$07;$CAAD26 |
    db $1B,$EA,$32,$07,$00,$1B,$92,$73;$CAAD2E |
    db $FF,$FF,$01,$05,$10,$C1,$DD,$9F;$CAAD36 |
    db $00,$07,$1B,$AA,$73,$00,$00,$1B;$CAAD3E |
    db $EA,$32,$08,$00,$1B,$92,$73,$FF;$CAAD46 |
    db $FF,$01,$05,$10,$C1,$DD,$9F,$00;$CAAD4E |
    db $07,$1B,$AA,$73,$01,$00,$1B,$EA;$CAAD56 |
    db $32,$08,$00,$1B,$92,$73,$FF,$FF;$CAAD5E |
    db $01,$C0,$69,$AE,$CA,$19,$00,$00;$CAAD66 |
    db $00,$05,$0F,$C0,$DF,$AE,$CA,$C1;$CAAD6E |
    db $48,$AF,$CA,$07,$2E,$00,$2E,$02;$CAAD76 |
    db $2A,$00,$F8,$00,$2B,$00,$00,$00;$CAAD7E |
    db $2A,$02,$F8,$00,$2B,$02,$00,$00;$CAAD86 |
    db $02,$01,$C0,$4D,$B0,$CA,$02,$01;$CAAD8E |
    db $C0,$6C,$9C,$00,$57,$AF,$CA,$02;$CAAD96 |
    db $01,$C0,$CE,$9C,$00,$17,$2F,$00;$CAAD9E |
    db $00,$F0,$2F,$02,$00,$F0,$05,$20;$CAADA6 |
    db $31,$00,$80,$00,$31,$02,$80,$00;$CAADAE |
    db $02,$01,$07,$2F,$00,$00,$00,$2F;$CAADB6 |
    db $02,$00,$00,$C1,$AA,$AE,$CA,$0F;$CAADBE |
    db $03,$C1,$AD,$09,$AE,$CD,$AD,$05;$CAADC6 |
    db $20,$31,$00,$80,$00,$31,$02,$80;$CAADCE |
    db $00,$02,$01,$07,$2F,$00,$00,$00;$CAADD6 |
    db $2F,$02,$00,$00,$C0,$9D,$AE,$CA;$CAADDE |
    db $C0,$6C,$9C,$00,$E0,$BD,$CA,$19;$CAADE6 |
    db $00,$0F,$00,$05,$0F,$C0,$DF,$AE;$CAADEE |
    db $CA,$C1,$43,$AF,$CA,$07,$C0,$EA;$CAADF6 |
    db $9F,$00,$CD,$D8,$EF,$00,$20,$00;$CAADFE |
    db $0E,$F7,$AC,$05,$10,$C1,$DD,$9F;$CAAE06 |
    db $00,$07,$C0,$83,$AE,$CA,$01;$CAAE0E |
    LDA.W $7A85                   ;$CAAE15 |
    CMP.W #$0001                  ;$CAAE18 |
    BCS CODE_95AE2A               ;$CAAE1B |
    LDY.W #$0006                  ;$CAAE1D |
    LDA.W #$0005                  ;$CAAE20 |
    LDX.W #$0000                  ;$CAAE23 |
    JSL.L CODE_FL_CABD7D          ;$CAAE26 |

CODE_95AE2A:
    LDA.W $7A85                   ;$CAAE2A |
    CMP.W #$0002                  ;$CAAE2D |
    BCS CODE_95AE3F               ;$CAAE30 |
    LDY.W #$0008                  ;$CAAE32 |
    LDA.W #$0005                  ;$CAAE35 |
    LDX.W #$0002                  ;$CAAE38 |
    JSL.L CODE_FL_CABD7D          ;$CAAE3B |

CODE_95AE3F:
    LDA.W $7A85                   ;$CAAE3F |
    CMP.W #$0003                  ;$CAAE42 |
    BCS CODE_95AE54               ;$CAAE45 |
    LDY.W #$000A                  ;$CAAE47 |
    LDA.W #$0005                  ;$CAAE4A |
    LDX.W #$0004                  ;$CAAE4D |
    JSL.L CODE_FL_CABD7D          ;$CAAE50 |

CODE_95AE54:
    RTL                           ;$CAAE54 |
    LDY.W #$000E                  ;$CAAE55 |
    LDA.W #$0000                  ;$CAAE58 |
    JSL.L CODE_FL_CABD7D          ;$CAAE5B |
    LDY.W #$000C                  ;$CAAE5F |
    LDA.W #$0004                  ;$CAAE62 |
    JML.L CODE_FL_CABD7D          ;$CAAE65 |
    LDA.W #$0030                  ;$CAAE69 |
    STA.B DSP_P                   ;$CAAE6C |
    LDX.W #$000E                  ;$CAAE6E |

CODE_95AE71:
    LDA.W $623C,X                 ;$CAAE71 |
    BMI CODE_95AE7C               ;$CAAE74 |
    PHX                           ;$CAAE76 |
    JSL.L DestroyObject_L         ;$CAAE77 |
    PLX                           ;$CAAE7B |

CODE_95AE7C:
    INX                           ;$CAAE7C |
    INX                           ;$CAAE7D |
    CMP.B DSP_P                   ;$CAAE7E |
    BCC CODE_95AE71               ;$CAAE80 |
    RTL                           ;$CAAE82 |
    LDA.W #$FFFF                  ;$CAAE83 |
    STA.W $7A8B                   ;$CAAE86 |
    LDA.W $7A91                   ;$CAAE89 |
    STA.W Current_SubGame         ;$CAAE8C |
    ASL A                         ;$CAAE8F |
    STA.W Current_SubGame_x2      ;$CAAE90 |
    LDA.W $7A91                   ;$CAAE93 |
    STA.W Current_SubGame         ;$CAAE96 |
    INC.W ReloadRoom              ;$CAAE99 |
    RTL                           ;$CAAE9C |
    SEP #$20                      ;$CAAE9D |
    LDA.W MainScreenDesignation   ;$CAAE9F |
    AND.B #$FE                    ;$CAAEA2 |
    STA.W MainScreenDesignation   ;$CAAEA4 |
    REP #$20                      ;$CAAEA7 |
    RTL                           ;$CAAEA9 |
    LDX.W #$0000                  ;$CAAEAA |
    LDA.W P1_Frame                ;$CAAEAD |
    BIT.W #$A040                  ;$CAAEB0 |
    BNE CODE_95AEBC               ;$CAAEB3 |
    BIT.W #$5080                  ;$CAAEB5 |
    BNE CODE_95AEBD               ;$CAAEB8 |
    BRA CODE_95AEBE               ;$CAAEBA |

CODE_95AEBC:
    INX                           ;$CAAEBC |

CODE_95AEBD:
    INX                           ;$CAAEBD |

CODE_95AEBE:
    TXA                           ;$CAAEBE |
    RTL                           ;$CAAEBF |
    TYX                           ;$CAAEC0 |
    STZ.W Obj_VAR1,X              ;$CAAEC1 |
    LDA.W $7A93                   ;$CAAEC4 |
    CMP.W $7A8F                   ;$CAAEC7 |
    BEQ CODE_95AEDE               ;$CAAECA |
    LDA.W #$FFFF                  ;$CAAECC |
    STA.W Obj_VAR1,Y              ;$CAAECF |
    LDA.W $7A93                   ;$CAAED2 |
    LDX.W $7A8F                   ;$CAAED5 |
    STX.W $7A93                   ;$CAAED8 |
    STA.W $7A8F                   ;$CAAEDB |

CODE_95AEDE:
    RTL                           ;$CAAEDE |
    LDA.W Obj_VAR0,Y              ;$CAAEDF |
    ASL A                         ;$CAAEE2 |
    ASL A                         ;$CAAEE3 |
    ASL A                         ;$CAAEE4 |
    CLC                           ;$CAAEE5 |
    ADC.W #$BF36                  ;$CAAEE6 |
    LDX.W #$00CA                  ;$CAAEE9 |
    LDY.W #$0404                  ;$CAAEEC |
    JSL.L WritePal                ;$CAAEEF |
    LDY.B $39                     ;$CAAEF3 |
    RTL                           ;$CAAEF5 |
    LDA.W $7A91                   ;$CAAEF6 |
    CMP.W #$000A                  ;$CAAEF9 |
    BEQ CODE_95AF21               ;$CAAEFC |
    CMP.W #$0007                  ;$CAAEFE |
    BEQ CODE_95AF12               ;$CAAF01 |
    CMP.W #$0008                  ;$CAAF03 |
    BEQ CODE_95AF17               ;$CAAF06 |
    CMP.W #$0009                  ;$CAAF08 |
    BEQ CODE_95AF1C               ;$CAAF0B |
    LDA.W #$0000                  ;$CAAF0D |
    BRA CODE_95AF42               ;$CAAF10 |

CODE_95AF12:
    LDA.W #$0001                  ;$CAAF12 |
    BRA CODE_95AF42               ;$CAAF15 |

CODE_95AF17:
    LDA.W #$0002                  ;$CAAF17 |
    BRA CODE_95AF42               ;$CAAF1A |

CODE_95AF1C:
    LDA.W #$0003                  ;$CAAF1C |
    BRA CODE_95AF42               ;$CAAF1F |

CODE_95AF21:
    LDA.W CurrentStereoMono       ;$CAAF21 |
    AND.W #$00FF                  ;$CAAF24 |
    BEQ CODE_15AF2E               ;$CAAF27 |
    LDA.W #$0000                  ;$CAAF29 |
    BRA CODE_15AF31               ;$CAAF2C |

CODE_15AF2E:
    LDA.W #$0001                  ;$CAAF2E |

CODE_15AF31:
    JSL.L CODE_FL_00CE43          ;$CAAF31 |
    LDA.W #$000A                  ;$CAAF35 |
    JSR.W CODE_FN_15B92A          ;$CAAF38 |
    JSL.L CODE_FL_CAB90B          ;$CAAF3B |
    LDA.W #$0004                  ;$CAAF3F |

CODE_95AF42:
    RTL                           ;$CAAF42 |
    TYX                           ;$CAAF43 |
    DEC.W Obj_VAR0,X              ;$CAAF44 |
    RTL                           ;$CAAF47 |
    TYX                           ;$CAAF48 |
    INC.W Obj_VAR0,X              ;$CAAF49 |
    RTL                           ;$CAAF4C |
    LDA.W #$AF60                  ;$CAAF4D |
    LDX.W #$00CA                  ;$CAAF50 |
    JML.L LoadDMATable            ;$CAAF53 |
    db $83,$30,$0B,$43,$5A,$E8,$00,$50;$CAAF57 |
    db $FF,$06,$00,$10,$71,$AF,$CA,$00;$CAAF5F |
    db $40,$06,$00,$10,$71,$AF,$CA,$00;$CAAF67 |
    db $48,$FF,$00,$00,$19,$04,$04,$00;$CAAF6F |
    db $C0,$3C,$B0,$CA,$C0,$AE,$AF,$CA;$CAAF77 |
    db $10,$8A,$AF,$02,$3C,$C0,$23,$B0;$CAAF7F |
    db $CA,$02,$50,$C0,$9A,$AF,$CA,$10;$CAAF87 |
    db $7B,$AF,$C0,$46,$B0,$CA,$C0,$6E;$CAAF8F |
    db $B8,$CA,$0C                ;$CAAF97 |
    LDA.W Obj_VAR4,Y              ;$CAAF9A |
    INC A                         ;$CAAF9D |
    STA.W Obj_VAR4,Y              ;$CAAF9E |
    CMP.W #$0008                  ;$CAAFA1 |
    BEQ CODE_15AFAA               ;$CAAFA4 |
    LDA.W #$0000                  ;$CAAFA6 |
    RTL                           ;$CAAFA9 |

CODE_15AFAA:
    LDA.W #$FFFF                  ;$CAAFAA |
    RTL                           ;$CAAFAD |
    LDA.W Obj_VAR4,Y              ;$CAAFAE |
    ASL A                         ;$CAAFB1 |
    TAX                           ;$CAAFB2 |
    LDA.L DATA16_CAB013,X         ;$CAAFB3 |
    AND.W Obj_VAR3,Y              ;$CAAFB7 |
    BNE CODE_15AFC0               ;$CAAFBA |
    LDA.W #$0000                  ;$CAAFBC |
    RTL                           ;$CAAFBF |

CODE_15AFC0:
    JMP.W (PTR16_15AFC3,X)        ;$CAAFC0 |
PTR16_15AFC3:
    dw CODE_15AFD3                ;$CAAFC3 |
    dw CODE_15AFD3                ;$CAAFC5 |
    dw CODE_15AFD3                ;$CAAFC7 |
    dw CODE_15AFD3                ;$CAAFC9 |
    dw CODE_15AFD7                ;$CAAFCB |
    dw CODE_15AFE1                ;$CAAFCD |
    dw CODE_15AFEE                ;$CAAFCF |
    dw CODE_15AFF8                ;$CAAFD1 |

CODE_15AFD3:
    LDA.W #$0000                  ;$CAAFD3 |
    RTL                           ;$CAAFD6 |

CODE_15AFD7:
    LDA.W $7A8F                   ;$CAAFD7 |
    AND.W #$0002                  ;$CAAFDA |
    BEQ CODE_15AFD3               ;$CAAFDD |
    BRA CODE_15B002               ;$CAAFDF |

CODE_15AFE1:
    LDA.W $7A8F                   ;$CAAFE1 |
    AND.W #$0018                  ;$CAAFE4 |
    CMP.W #$0018                  ;$CAAFE7 |
    BEQ CODE_15B002               ;$CAAFEA |
    BRA CODE_15AFD3               ;$CAAFEC |

CODE_15AFEE:
    LDA.W $7A8F                   ;$CAAFEE |
    AND.W #$0020                  ;$CAAFF1 |
    BEQ CODE_15AFD3               ;$CAAFF4 |
    BRA CODE_15B002               ;$CAAFF6 |

CODE_15AFF8:
    LDA.W $7A8F                   ;$CAAFF8 |
    AND.W #$0040                  ;$CAAFFB |
    BEQ CODE_15AFD3               ;$CAAFFE |
    BRA CODE_15B002               ;$CAB000 |

CODE_15B002:
    LDX.W Obj_VAR4,Y              ;$CAB002 |
    STX.W $7A91                   ;$CAB005 |
    LDA.W #$0003                  ;$CAB008 |
    JSL.L CODE_FL_CABD8B          ;$CAB00B |
    LDA.W #$FFFF                  ;$CAB00F |
    RTL                           ;$CAB012 |

DATA16_CAB013:
    dw $0000,$0000,$0000,$0002    ;$CAB013 |
    dw $0002,$0018,$0020,$0040    ;$CAB01B |

    LDX.W Obj_VAR4,Y              ;$CAB023 |
    LDA.L DATA8_CAB034,X          ;$CAB026 |
    AND.W #$00FF                  ;$CAB02A |
    JSR.W CODE_FN_15B92A          ;$CAB02D |
    JML.L CODE_FL_CAB90B          ;$CAB030 |

DATA8_CAB034:
    db $00,$01,$02,$03,$04,$05,$06,$07;$CAB034 |

    LDA.W $7A93                   ;$CAB03C |
    EOR.W $7A8F                   ;$CAB03F |
    STA.W Obj_VAR3,Y              ;$CAB042 |
    RTL                           ;$CAB045 |
    LDA.W $7A8F                   ;$CAB046 |
    STA.W $7A93                   ;$CAB049 |
    RTL                           ;$CAB04C |
    LDA.W $7A91                   ;$CAB04D |
    ASL A                         ;$CAB050 |
    TAX                           ;$CAB051 |
    LDA.L DATA8_CAB2C6,X          ;$CAB052 |
    LDX.W #$00CA                  ;$CAB056 |
    JSL.L LoadDMATable            ;$CAB059 |
    LDA.W $7A91                   ;$CAB05D |
    CMP.W #$0007                  ;$CAB060 |

CODE_95B063:
    BCS CODE_95B063               ;$CAB063 |
    ASL A                         ;$CAB065 |
    TAX                           ;$CAB066 |
    JMP.W (DATA8_15B06A,X)        ;$CAB067 |

DATA8_15B06A:
    db $78,$B0,$A2,$B0,$D1,$B0,$8D,$B1;$CAB06A |
    db $17,$B2,$59,$B2,$AF,$B2    ;$CAB072 |
    LDA.W $7A93                   ;$CAB078 |
    AND.W #$0001                  ;$CAB07B |
    BEQ CODE_95B08A               ;$CAB07E |
    LDX.W $7A91                   ;$CAB080 |
    LDA.W #$0001                  ;$CAB083 |
    JSL.L CODE_FL_CABD8B          ;$CAB086 |

CODE_95B08A:
    LDA.W $7AEB                   ;$CAB08A |
    LDY.W $7AED                   ;$CAB08D |
    JSL.L CODE_FL_CFB2E2          ;$CAB090 |
    LDX.W #$0010                  ;$CAB094 |
    LDA.W #$0007                  ;$CAB097 |
    JSL.L CODE_FL_CAB3FB          ;$CAB09A |
    JML.L CODE_JL_CAB35F          ;$CAB09E |
    LDA.W $7A93                   ;$CAB0A2 |
    AND.W #$0002                  ;$CAB0A5 |
    BEQ CODE_95B0B4               ;$CAB0A8 |
    LDX.W $7A91                   ;$CAB0AA |
    LDA.W #$0001                  ;$CAB0AD |
    JSL.L CODE_FL_CABD8B          ;$CAB0B0 |

CODE_95B0B4:
    LDA.W $7AEF                   ;$CAB0B4 |
    LDY.W $7AF1                   ;$CAB0B7 |
    JSL.L CODE_FL_CFB2E2          ;$CAB0BA |
    LDX.W #$000F                  ;$CAB0BE |
    LDA.W #$0008                  ;$CAB0C1 |
    JSL.L CODE_FL_CAB3FB          ;$CAB0C4 |
    LDA.W #$0003                  ;$CAB0C8 |
    STA.B IdentifySNES            ;$CAB0CB |
    JML.L CODE_JL_CAB35F          ;$CAB0CD |
    LDA.W $7A93                   ;$CAB0D1 |
    AND.W #$0004                  ;$CAB0D4 |
    BEQ CODE_15B0E3               ;$CAB0D7 |
    LDX.W $7A91                   ;$CAB0D9 |
    LDA.W #$0001                  ;$CAB0DC |
    JSL.L CODE_FL_CABD8B          ;$CAB0DF |

CODE_15B0E3:
    LDA.W $7B03                   ;$CAB0E3 |
    LDX.W #$000A                  ;$CAB0E6 |
    JSL.L CODE_FL_00A5F7          ;$CAB0E9 |
    LDA.W $32E6                   ;$CAB0ED |
    STA.W ObjVar4_Temp            ;$CAB0F0 |
    LDX.W #$A0C0                  ;$CAB0F3 |
    LDA.W #$0002                  ;$CAB0F6 |
    JSL.L CODE_FL_CABD8B          ;$CAB0F9 |
    LDA.W $32E4                   ;$CAB0FD |
    BEQ CODE_15B12B               ;$CAB100 |
    LDX.W #$000A                  ;$CAB102 |
    JSL.L CODE_FL_00A5F7          ;$CAB105 |
    LDA.W $32E6                   ;$CAB109 |
    STA.W ObjVar4_Temp            ;$CAB10C |
    LDX.W #$90C0                  ;$CAB10F |
    LDA.W #$0002                  ;$CAB112 |
    JSL.L CODE_FL_CABD8B          ;$CAB115 |
    LDA.W $32E4                   ;$CAB119 |
    BEQ CODE_15B12B               ;$CAB11C |
    STA.W ObjVar4_Temp            ;$CAB11E |
    LDX.W #$80C0                  ;$CAB121 |
    LDA.W #$0002                  ;$CAB124 |
    JSL.L CODE_FL_CABD8B          ;$CAB127 |

CODE_15B12B:
    LDA.W $7B00                   ;$CAB12B |
    AND.W #$00FF                  ;$CAB12E |
    LDX.W #$000A                  ;$CAB131 |
    JSL.L CODE_FL_00A5F7          ;$CAB134 |
    LDA.W $32E6                   ;$CAB138 |
    STA.W ObjVar4_Temp            ;$CAB13B |
    LDX.W #$30C0                  ;$CAB13E |
    LDA.W #$0002                  ;$CAB141 |
    JSL.L CODE_FL_CABD8B          ;$CAB144 |
    LDA.W $32E4                   ;$CAB148 |
    BEQ CODE_15B15A               ;$CAB14B |
    STA.W ObjVar4_Temp            ;$CAB14D |
    LDX.W #$20C0                  ;$CAB150 |
    LDA.W #$0002                  ;$CAB153 |
    JSL.L CODE_FL_CABD8B          ;$CAB156 |

CODE_15B15A:
    LDA.W $7B01                   ;$CAB15A |
    AND.W #$00FF                  ;$CAB15D |
    LDX.W #$000A                  ;$CAB160 |
    JSL.L CODE_FL_00A5F7          ;$CAB163 |
    LDA.W $32E6                   ;$CAB167 |
    STA.W ObjVar4_Temp            ;$CAB16A |
    LDX.W #$60C0                  ;$CAB16D |
    LDA.W #$0002                  ;$CAB170 |
    JSL.L CODE_FL_CABD8B          ;$CAB173 |
    LDA.W $32E4                   ;$CAB177 |
    BEQ CODE_15B189               ;$CAB17A |
    STA.W ObjVar4_Temp            ;$CAB17C |
    LDX.W #$50C0                  ;$CAB17F |
    LDA.W #$0002                  ;$CAB182 |
    JSL.L CODE_FL_CABD8B          ;$CAB185 |

CODE_15B189:
    JML.L CODE_JL_CAB35F          ;$CAB189 |

    LDA.W $7A93                   ;$CAB18D |
    AND.W #$0008                  ;$CAB190 |
    BEQ CODE_15B19F               ;$CAB193 |
    LDX.W $7A91                   ;$CAB195 |
    LDA.W #$0001                  ;$CAB198 |
    JSL.L CODE_FL_CABD8B          ;$CAB19B |

CODE_15B19F:
    LDA.W $7B13                   ;$CAB19F |
    AND.W #$00FF                  ;$CAB1A2 |
    LDX.W #$000A                  ;$CAB1A5 |
    JSL.L CODE_FL_00A5F7          ;$CAB1A8 |
    LDA.W $32E6                   ;$CAB1AC |
    STA.W ObjVar4_Temp            ;$CAB1AF |
    LDX.W #$45C0                  ;$CAB1B2 |
    LDA.W #$0002                  ;$CAB1B5 |
    JSL.L CODE_FL_CABD8B          ;$CAB1B8 |
    LDA.W $32E4                   ;$CAB1BC |
    BEQ CODE_15B1CE               ;$CAB1BF |
    STA.W ObjVar4_Temp            ;$CAB1C1 |
    LDX.W #$38C0                  ;$CAB1C4 |
    LDA.W #$0002                  ;$CAB1C7 |
    JSL.L CODE_FL_CABD8B          ;$CAB1CA |

CODE_15B1CE:
    LDA.W $7B0F                   ;$CAB1CE |
    LDY.W $7B11                   ;$CAB1D1 |
    JSL.L CODE_FL_CFB2E2          ;$CAB1D4 |
    LDX.W #$0000                  ;$CAB1D8 |

CODE_15B1DB:
    LDA.W $3700,X                 ;$CAB1DB |
    BNE CODE_15B1E7               ;$CAB1DE |
    INX                           ;$CAB1E0 |
    INX                           ;$CAB1E1 |
    CPX.W #$000C                  ;$CAB1E2 |
    BNE CODE_15B1DB               ;$CAB1E5 |

CODE_15B1E7:
    TXA                           ;$CAB1E7 |
    LSR A                         ;$CAB1E8 |

CODE_15B1E9:
    PHA                           ;$CAB1E9 |
    ASL A                         ;$CAB1EA |
    TAX                           ;$CAB1EB |
    LDA.W $3700,X                 ;$CAB1EC |
    STA.W ObjVar4_Temp            ;$CAB1EF |
    LDA.L DATA8_CAB209,X          ;$CAB1F2 |
    TAX                           ;$CAB1F6 |
    LDA.W #$0002                  ;$CAB1F7 |
    JSL.L CODE_FL_CABD8B          ;$CAB1FA |
    PLA                           ;$CAB1FE |
    INC A                         ;$CAB1FF |
    CMP.W #$0007                  ;$CAB200 |
    BNE CODE_15B1E9               ;$CAB203 |
    JML.L CODE_JL_CAB35F          ;$CAB205 |
    db $C0,$58,$C0,$64,$C0,$70,$C0,$7C;$CAB209 |
    db $C0,$88,$C0,$94,$C0,$A0    ;$CAB211 |
    LDA.W $7A93                   ;$CAB217 |
    AND.W #$0010                  ;$CAB21A |
    BEQ CODE_15B229               ;$CAB21D |
    LDX.W $7A91                   ;$CAB21F |
    LDA.W #$0001                  ;$CAB222 |
    JSL.L CODE_FL_CABD8B          ;$CAB225 |

CODE_15B229:
    LDA.W $7B15                   ;$CAB229 |
    STA.W $32E4                   ;$CAB22C |
    LDA.W $7B17                   ;$CAB22F |
    STA.W $32E6                   ;$CAB232 |
    LDA.W #$0003                  ;$CAB235 |
    JSL.L CODE_FL_06F87B          ;$CAB238 |
    LDA.W #$0003                  ;$CAB23C |
    LDA.W $32E4                   ;$CAB23F |
    LDY.W $32E6                   ;$CAB242 |
    JSL.L CODE_FL_CFB2E2          ;$CAB245 |
    LDX.W #$0012                  ;$CAB249 |
    LDA.W #$0008                  ;$CAB24C |
    JSL.L CODE_FL_CAB4D1          ;$CAB24F |
    LDY.B $39                     ;$CAB253 |
    JML.L CODE_JL_CAB35F          ;$CAB255 |
    LDA.W $7A93                   ;$CAB259 |
    AND.W #$0020                  ;$CAB25C |
    BEQ CODE_95B26B               ;$CAB25F |
    LDX.W $7A91                   ;$CAB261 |
    LDA.W #$0001                  ;$CAB264 |
    JSL.L CODE_FL_CABD8B          ;$CAB267 |

CODE_95B26B:
    LDA.W #$0002                  ;$CAB26B |
    STA.B IdentifySNES            ;$CAB26E |
    LDA.W $7B20                   ;$CAB270 |
    AND.W #$00FF                  ;$CAB273 |
    LDX.W #$0012                  ;$CAB276 |
    LDY.W #$000A                  ;$CAB279 |
    JSL.L CODE_FL_CAB587          ;$CAB27C |
    LDA.W #$0003                  ;$CAB280 |
    STA.B IdentifySNES            ;$CAB283 |
    LDX.W SaveFile_Offset         ;$CAB285 |
    JSL.L CODE_FL_00F0FC          ;$CAB288 |
    ASL A                         ;$CAB28C |
    ASL A                         ;$CAB28D |
    LDX.W #$0013                  ;$CAB28E |
    LDY.W #$0007                  ;$CAB291 |
    JSL.L CODE_FL_CAB587          ;$CAB294 |
    LDA.W #$0001                  ;$CAB298 |
    STA.B IdentifySNES            ;$CAB29B |
    JSL.L CODE_FL_CAB34B          ;$CAB29D |
    LDX.W #$000F                  ;$CAB2A1 |
    LDY.W #$0007                  ;$CAB2A4 |
    JSL.L CODE_FL_CAB587          ;$CAB2A7 |
    JML.L CODE_JL_CAB35F          ;$CAB2AB |
    LDA.W $7A93                   ;$CAB2AF |
    AND.W #$0040                  ;$CAB2B2 |
    BEQ CODE_15B2C2               ;$CAB2B5 |
    LDX.W $7A91                   ;$CAB2B7 |
    INX                           ;$CAB2BA |
    LDA.W #$0001                  ;$CAB2BB |
    JSL.L CODE_FL_CABD8B          ;$CAB2BE |

CODE_15B2C2:
    JML.L CODE_JL_CAB35F          ;$CAB2C2 |
    db $D4,$B2,$E5,$B2,$F6,$B2,$07,$B3;$CAB2C6 |
    db $18,$B3,$29,$B3,$3A,$B3,$89,$00;$CAB2CE |
    db $04,$9A,$B6,$EA,$00,$40,$0F,$00;$CAB2D6 |
    db $04,$00,$24,$7E,$00,$40,$FF,$89;$CAB2DE |
    db $00,$04,$66,$5B,$EA,$00,$40,$0F;$CAB2E6 |
    db $00,$04,$00,$24,$7E,$00,$40,$FF;$CAB2EE |
    db $89,$00,$04,$9C,$8A,$EA,$00,$40;$CAB2F6 |
    db $0F,$00,$04,$00,$24,$7E,$00,$40;$CAB2FE |
    db $FF,$89,$00,$04,$82,$82,$EA,$00;$CAB306 |
    db $40,$0F,$00,$04,$00,$24,$7E,$00;$CAB30E |
    db $40,$FF,$89,$00,$04,$F4,$66,$EA;$CAB316 |
    db $00,$40,$0F,$00,$04,$00,$24,$7E;$CAB31E |
    db $00,$40,$FF,$89,$00,$04,$07,$2C;$CAB326 |
    db $EA,$00,$40,$0F,$00,$04,$00,$24;$CAB32E |
    db $7E,$00,$40,$FF,$89,$00,$04,$38;$CAB336 |
    db $8D,$EA,$00,$40,$0F,$00,$04,$00;$CAB33E |
    db $24,$7E,$00,$40,$FF        ;$CAB346 |
    LDA.W $7A6B                   ;$CAB34B |
    AND.W #$007F                  ;$CAB34E |
    LDX.W #$0000                  ;$CAB351 |

CODE_95B354:
    LSR A                         ;$CAB354 |
    BCC CODE_95B358               ;$CAB355 |
    INX                           ;$CAB357 |

CODE_95B358:
    CMP.W #$0000                  ;$CAB358 |
    BNE CODE_95B354               ;$CAB35B |
    TXA                           ;$CAB35D |
    RTL                           ;$CAB35E |
    LDA.W #$3000                  ;$CAB35F |
    STA.B IdentifySNES            ;$CAB362 |
    LDA.W #$007E                  ;$CAB364 |
    STA.B DSP_P                   ;$CAB367 |
    LDA.W $7A91                   ;$CAB369 |
    ASL A                         ;$CAB36C |
    ASL A                         ;$CAB36D |
    TAX                           ;$CAB36E |
    LDA.L DATA8_CAB3CA,X          ;$CAB36F |
    PHA                           ;$CAB373 |
    LDA.L DATA8_CAB3CC,X          ;$CAB374 |
    PLX                           ;$CAB378 |
    JSL.L CODE_FL_CFA8B8          ;$CAB379 |
    LDA.W $7A91                   ;$CAB37D |
    PHA                           ;$CAB380 |
    ASL A                         ;$CAB381 |
    TAX                           ;$CAB382 |
    LDA.L DATA8_CAB3ED,X          ;$CAB383 |
    STA.B DSP_SRCN                ;$CAB387 |
    LDA.W #$3000                  ;$CAB389 |
    STA.B $06                     ;$CAB38C |
    PLX                           ;$CAB38E |
    LDA.L DATA8_CAB3E6,X          ;$CAB38F |
    AND.W #$00FF                  ;$CAB393 |

CODE_95B396:
    PHA                           ;$CAB396 |
    LDA.W #$0003                  ;$CAB397 |
    STA.B $31                     ;$CAB39A |
    LDA.W #$002C                  ;$CAB39C |
    STA.B $32                     ;$CAB39F |
    LDA.B $06                     ;$CAB3A1 |
    STA.B $34                     ;$CAB3A3 |
    SEP #$20                      ;$CAB3A5 |
    LDA.B #$7E                    ;$CAB3A7 |
    STA.B P1_ResetRepeat          ;$CAB3A9 |
    REP #$20                      ;$CAB3AB |
    LDA.B DSP_SRCN                ;$CAB3AD |
    STA.B CameraX_TileMirror                     ;$CAB3AF |
    JSL.L WriteToDMABuffer     ;$CAB3B1 |
    LDA.B DSP_SRCN                ;$CAB3B5 |
    CLC                           ;$CAB3B7 |
    ADC.W #$0020                  ;$CAB3B8 |
    STA.B DSP_SRCN                ;$CAB3BB |
    LDA.B $06                     ;$CAB3BD |
    CLC                           ;$CAB3BF |
    ADC.W #$002C                  ;$CAB3C0 |
    STA.B $06                     ;$CAB3C3 |
    PLA                           ;$CAB3C5 |
    DEC A                         ;$CAB3C6 |
    BNE CODE_95B396               ;$CAB3C7 |
    RTL                           ;$CAB3C9 |
    db $05,$D5,$EA,$00,$22,$14,$EB,$00;$CAB3CA |
    db $C6,$C9,$EB,$00,$4C,$23,$EC,$00;$CAB3D2 |
    db $BF,$0F,$EC,$00,$54,$A0,$EC,$00;$CAB3DA |
    db $8A,$BF,$EB,$00,$10,$0E,$0D,$0B;$CAB3E2 |
    db $0D,$0D,$0D,$42,$49,$82,$49,$22;$CAB3EA |
    db $49,$62,$49,$62,$49,$82,$49,$82;$CAB3F2 |
    db $49                        ;$CAB3FA |
    STX.B RAM_CommandWaitLoop     ;$CAB3FB |
    ASL A                         ;$CAB3FD |
    ASL A                         ;$CAB3FE |
    ASL A                         ;$CAB3FF |
    ASL A                         ;$CAB400 |
    ASL A                         ;$CAB401 |
    CLC                           ;$CAB402 |
    ADC.B RAM_CommandWaitLoop     ;$CAB403 |
    CLC                           ;$CAB405 |
    ADC.W #$4000                  ;$CAB406 |
    STA.B RAM_CommandWaitLoop     ;$CAB409 |
    LDY.W #$0000                  ;$CAB40B |
    LDA.B DSP_P                   ;$CAB40E |
    BNE CODE_95B41D               ;$CAB410 |
    CPY.W #$0000                  ;$CAB412 |
    BNE CODE_95B41D               ;$CAB415 |
    LDA.L DATA8_E2FFFB            ;$CAB417 |
    BRA CODE_95B426               ;$CAB41B |

CODE_95B41D:
    LDY.W #$FFFF                  ;$CAB41D |
    ASL A                         ;$CAB420 |
    TAX                           ;$CAB421 |
    LDA.L DATA8_EFE604,X          ;$CAB422 |

CODE_95B426:
    LDX.B RAM_CommandWaitLoop     ;$CAB426 |
    JSL.L WriteTile               ;$CAB428 |
    INC.B RAM_CommandWaitLoop     ;$CAB42C |
    LDA.B DSP_SRCN                ;$CAB42E |
    BNE CODE_95B43D               ;$CAB430 |
    CPY.W #$0000                  ;$CAB432 |
    BNE CODE_95B43D               ;$CAB435 |
    LDA.L DATA8_E2FFFB            ;$CAB437 |
    BRA CODE_95B446               ;$CAB43B |

CODE_95B43D:
    LDY.W #$FFFF                  ;$CAB43D |
    ASL A                         ;$CAB440 |
    TAX                           ;$CAB441 |
    LDA.L DATA8_EFE604,X          ;$CAB442 |

CODE_95B446:
    LDX.B RAM_CommandWaitLoop     ;$CAB446 |
    JSL.L WriteTile               ;$CAB448 |
    INC.B RAM_CommandWaitLoop     ;$CAB44C |
    LDA.B $06                     ;$CAB44E |
    BNE CODE_95B45D               ;$CAB450 |
    CPY.W #$0000                  ;$CAB452 |
    BNE CODE_95B45D               ;$CAB455 |
    LDA.L DATA8_E2FFFB            ;$CAB457 |
    BRA CODE_95B466               ;$CAB45B |

CODE_95B45D:
    LDY.W #$FFFF                  ;$CAB45D |
    ASL A                         ;$CAB460 |
    TAX                           ;$CAB461 |
    LDA.L DATA8_EFE604,X          ;$CAB462 |

CODE_95B466:
    LDX.B RAM_CommandWaitLoop     ;$CAB466 |
    JSL.L WriteTile               ;$CAB468 |
    INC.B RAM_CommandWaitLoop     ;$CAB46C |
    LDA.B DSP_ENVX                ;$CAB46E |
    BNE CODE_95B47D               ;$CAB470 |
    CPY.W #$0000                  ;$CAB472 |
    BNE CODE_95B47D               ;$CAB475 |
    LDA.L DATA8_E2FFFB            ;$CAB477 |
    BRA CODE_95B486               ;$CAB47B |

CODE_95B47D:
    LDY.W #$FFFF                  ;$CAB47D |
    ASL A                         ;$CAB480 |
    TAX                           ;$CAB481 |
    LDA.L DATA8_EFE604,X          ;$CAB482 |

CODE_95B486:
    LDX.B RAM_CommandWaitLoop     ;$CAB486 |
    JSL.L WriteTile               ;$CAB488 |
    INC.B RAM_CommandWaitLoop     ;$CAB48C |
    LDA.B $0A                     ;$CAB48E |
    BNE CODE_95B49D               ;$CAB490 |
    CPY.W #$0000                  ;$CAB492 |
    BNE CODE_95B49D               ;$CAB495 |
    LDA.L DATA8_E2FFFB            ;$CAB497 |
    BRA CODE_95B4A6               ;$CAB49B |

CODE_95B49D:
    LDY.W #$FFFF                  ;$CAB49D |
    ASL A                         ;$CAB4A0 |
    TAX                           ;$CAB4A1 |
    LDA.L DATA8_EFE604,X          ;$CAB4A2 |

CODE_95B4A6:
    LDX.B RAM_CommandWaitLoop     ;$CAB4A6 |
    JSL.L WriteTile               ;$CAB4A8 |
    INC.B RAM_CommandWaitLoop     ;$CAB4AC |
    LDA.B DSP_MVOLL               ;$CAB4AE |
    BNE CODE_95B4BD               ;$CAB4B0 |
    CPY.W #$0000                  ;$CAB4B2 |
    BNE CODE_95B4BD               ;$CAB4B5 |
    LDA.L DATA8_E2FFFB            ;$CAB4B7 |
    BRA CODE_95B4C6               ;$CAB4BB |

CODE_95B4BD:
    LDY.W #$FFFF                  ;$CAB4BD |
    ASL A                         ;$CAB4C0 |
    TAX                           ;$CAB4C1 |
    LDA.L DATA8_EFE604,X          ;$CAB4C2 |

CODE_95B4C6:
    LDX.B RAM_CommandWaitLoop     ;$CAB4C6 |
    JSL.L WriteTile               ;$CAB4C8 |
    INC.B RAM_CommandWaitLoop     ;$CAB4CC |
    LDY.B $39                     ;$CAB4CE |
    RTL                           ;$CAB4D0 |
    STX.B RAM_CommandWaitLoop     ;$CAB4D1 |
    ASL A                         ;$CAB4D3 |
    ASL A                         ;$CAB4D4 |
    ASL A                         ;$CAB4D5 |
    ASL A                         ;$CAB4D6 |
    ASL A                         ;$CAB4D7 |
    CLC                           ;$CAB4D8 |
    ADC.B RAM_CommandWaitLoop     ;$CAB4D9 |
    CLC                           ;$CAB4DB |
    ADC.W #$4000                  ;$CAB4DC |
    STA.B RAM_CommandWaitLoop     ;$CAB4DF |
    LDY.W #$0000                  ;$CAB4E1 |
    LDA.B DSP_SRCN                ;$CAB4E4 |
    BNE CODE_15B4F3               ;$CAB4E6 |
    CPY.W #$0000                  ;$CAB4E8 |
    BNE CODE_15B4F3               ;$CAB4EB |
    LDA.L DATA8_E2FFFB            ;$CAB4ED |
    BRA CODE_15B4FC               ;$CAB4F1 |


CODE_15B4F3:
    LDY.W #$FFFF                  ;$CAB4F3 |
    ASL A                         ;$CAB4F6 |
    TAX                           ;$CAB4F7 |
    LDA.L DATA8_EFE604,X          ;$CAB4F8 |

CODE_15B4FC:
    LDX.B RAM_CommandWaitLoop     ;$CAB4FC |
    JSL.L WriteTile               ;$CAB4FE |
    INC.B RAM_CommandWaitLoop     ;$CAB502 |
    LDA.B $06                     ;$CAB504 |
    BNE CODE_15B513               ;$CAB506 |
    CPY.W #$0000                  ;$CAB508 |
    BNE CODE_15B513               ;$CAB50B |
    LDA.L DATA8_E2FFFB            ;$CAB50D |
    BRA CODE_15B51C               ;$CAB511 |


CODE_15B513:
    LDY.W #$FFFF                  ;$CAB513 |
    ASL A                         ;$CAB516 |
    TAX                           ;$CAB517 |
    LDA.L DATA8_EFE604,X          ;$CAB518 |

CODE_15B51C:
    LDX.B RAM_CommandWaitLoop     ;$CAB51C |
    JSL.L WriteTile               ;$CAB51E |
    INC.B RAM_CommandWaitLoop     ;$CAB522 |
    LDA.B DSP_ENVX                ;$CAB524 |
    BNE CODE_15B533               ;$CAB526 |
    CPY.W #$0000                  ;$CAB528 |
    BNE CODE_15B533               ;$CAB52B |
    LDA.L DATA8_E2FFFB            ;$CAB52D |
    BRA CODE_15B53C               ;$CAB531 |


CODE_15B533:
    LDY.W #$FFFF                  ;$CAB533 |
    ASL A                         ;$CAB536 |
    TAX                           ;$CAB537 |
    LDA.L DATA8_EFE604,X          ;$CAB538 |

CODE_15B53C:
    LDX.B RAM_CommandWaitLoop     ;$CAB53C |
    JSL.L WriteTile               ;$CAB53E |
    INC.B RAM_CommandWaitLoop     ;$CAB542 |
    LDA.B $0A                     ;$CAB544 |
    BNE CODE_15B553               ;$CAB546 |
    CPY.W #$0000                  ;$CAB548 |
    BNE CODE_15B553               ;$CAB54B |
    LDA.L DATA8_E2FFFB            ;$CAB54D |
    BRA CODE_15B55C               ;$CAB551 |


CODE_15B553:
    LDY.W #$FFFF                  ;$CAB553 |
    ASL A                         ;$CAB556 |
    TAX                           ;$CAB557 |
    LDA.L DATA8_EFE604,X          ;$CAB558 |

CODE_15B55C:
    LDX.B RAM_CommandWaitLoop     ;$CAB55C |
    JSL.L WriteTile               ;$CAB55E |
    INC.B RAM_CommandWaitLoop     ;$CAB562 |
    LDA.B DSP_MVOLL               ;$CAB564 |
    BNE CODE_15B573               ;$CAB566 |
    CPY.W #$0000                  ;$CAB568 |
    BNE CODE_15B573               ;$CAB56B |
    LDA.L DATA8_E2FFFB            ;$CAB56D |
    BRA CODE_15B57C               ;$CAB571 |


CODE_15B573:
    LDY.W #$FFFF                  ;$CAB573 |
    ASL A                         ;$CAB576 |
    TAX                           ;$CAB577 |
    LDA.L DATA8_EFE604,X          ;$CAB578 |

CODE_15B57C:
    LDX.B RAM_CommandWaitLoop     ;$CAB57C |
    JSL.L WriteTile               ;$CAB57E |
    INC.B RAM_CommandWaitLoop     ;$CAB582 |
    LDY.B $39                     ;$CAB584 |
    RTL                           ;$CAB586 |
    STA.B DSP_P                   ;$CAB587 |
    STX.B DSP_SRCN                ;$CAB589 |
    TYA                           ;$CAB58B |
    ASL A                         ;$CAB58C |
    ASL A                         ;$CAB58D |
    ASL A                         ;$CAB58E |
    ASL A                         ;$CAB58F |
    ASL A                         ;$CAB590 |
    CLC                           ;$CAB591 |
    ADC.B DSP_SRCN                ;$CAB592 |
    CLC                           ;$CAB594 |
    ADC.W #$4000                  ;$CAB595 |
    DEC.B IdentifySNES            ;$CAB598 |
    CLC                           ;$CAB59A |
    ADC.B IdentifySNES            ;$CAB59B |
    STA.B DSP_SRCN                ;$CAB59D |
    LDA.B DSP_P                   ;$CAB59F |

CODE_95B5A1:
    LDX.W #$000A                  ;$CAB5A1 |
    JSL.L CODE_FL_00A5F7          ;$CAB5A4 |
    LDA.W $32E6                   ;$CAB5A8 |
    ASL A                         ;$CAB5AB |
    TAX                           ;$CAB5AC |
    LDA.L DATA8_EFE604,X          ;$CAB5AD |
    LDX.B DSP_SRCN                ;$CAB5B1 |
    JSL.L WriteTile               ;$CAB5B3 |
    LDA.W $32E4                   ;$CAB5B7 |
    DEC.B DSP_SRCN                ;$CAB5BA |
    DEC.B IdentifySNES            ;$CAB5BC |
    BPL CODE_95B5A1               ;$CAB5BE |
    LDY.B $39                     ;$CAB5C0 |
    RTL                           ;$CAB5C2 |
    db $14,$C0,$E5,$CD,$33,$40,$00,$C0;$CAB5C3 |
    db $CF,$B5,$CA,$01            ;$CAB5CB |
    LDA.W #$0017                  ;$CAB5CF |
    CLC                           ;$CAB5D2 |
    ADC.W Obj_VAR4,Y              ;$CAB5D3 |
    STA.W Obj_Pose,Y              ;$CAB5D6 |
    LDA.W Obj_VAR3,Y              ;$CAB5D9 |
    XBA                           ;$CAB5DC |
    AND.W #$00FF                  ;$CAB5DD |
    STA.W Obj_XPosition,Y         ;$CAB5E0 |
    STA.W Obj_XPositionMirror,Y   ;$CAB5E3 |
    LDA.W Obj_VAR3,Y              ;$CAB5E6 |
    AND.W #$00FF                  ;$CAB5E9 |
    STA.W Obj_YPosition,Y         ;$CAB5EC |
    STA.W Obj_YPositionMirror,Y   ;$CAB5EF |
    RTL                           ;$CAB5F2 |
    db $15,$72,$AB,$14,$C0,$E5,$CD,$33;$CAB5F3 |
    db $40,$00,$03,$06,$B6,$CA,$19,$00;$CAB5FB |
    db $00,$00,$01                ;$CAB603 |
    LDA.W $7A83                   ;$CAB606 |
    BEQ CODE_95B62F               ;$CAB609 |
    JSR.W CODE_FN_15B66A          ;$CAB60B |
    JSR.W CODE_FN_15B630          ;$CAB60E |
    JSR.W CODE_FN_15B63C          ;$CAB611 |
    JSR.W CODE_FN_15B65B          ;$CAB614 |
    LDA.W $7A91                   ;$CAB617 |
    CMP.W $7A87                   ;$CAB61A |
    BEQ CODE_95B62F               ;$CAB61D |
    STA.W $7A87                   ;$CAB61F |
    JSL.L CODE_FL_CAB8A2          ;$CAB622 |
    LDA.W #$008F                  ;$CAB626 |
    JSL.L PlaySFX                 ;$CAB629 |
    LDY.B $39                     ;$CAB62D |

CODE_95B62F:
    RTL                           ;$CAB62F |

CODE_FN_15B630:
    LDA.W P1_Frame                ;$CAB630 |
    AND.W #$5080                  ;$CAB633 |
    BEQ CODE_95B63B               ;$CAB636 |
    STZ.W $7A83                   ;$CAB638 |

CODE_95B63B:
    RTS                           ;$CAB63B |

CODE_FN_15B63C:
    LDY.B $39                     ;$CAB63C |
    LDA.W $7A91                   ;$CAB63E |
    ASL A                         ;$CAB641 |
    ASL A                         ;$CAB642 |
    TAX                           ;$CAB643 |
    LDA.L CorkboardCursorCoordinates_LUT,X ;$CAB644 |
    STA.W Obj_XPosition,Y         ;$CAB648 |
    STA.W Obj_XPositionMirror,Y   ;$CAB64B |
    INX                           ;$CAB64E |
    INX                           ;$CAB64F |
    LDA.L CorkboardCursorCoordinates_LUT,X ;$CAB650 |
    STA.W Obj_YPosition,Y         ;$CAB654 |
    STA.W Obj_YPositionMirror,Y   ;$CAB657 |
    RTS                           ;$CAB65A |

CODE_FN_15B65B:
    LDY.B $39                     ;$CAB65B |
    LDA.W $7A91                   ;$CAB65D |
    ASL A                         ;$CAB660 |
    TAX                           ;$CAB661 |
    LDA.L CorkboardCursorObjSlot_LUT,X     ;$CAB662 |
    STA.W Obj_Pose,Y              ;$CAB666 |
    RTS                           ;$CAB669 |

CODE_FN_15B66A:
    LDA.W P1_Repeat               ;$CAB66A |
    XBA                           ;$CAB66D |
    AND.W #$000F                  ;$CAB66E |
    BEQ CODE_95B6A8               ;$CAB671 |
    TAX                           ;$CAB673 |
    LDA.L CorkboardCursorButtonMap_LUT,X   ;$CAB674 |
    AND.W #$00FF                  ;$CAB678 |
    CMP.W #$00FF                  ;$CAB67B |
    BEQ CODE_95B6A8               ;$CAB67E |
    STA.B IdentifySNES            ;$CAB680 |
    LDA.W $7A91                   ;$CAB682 |
    ASL A                         ;$CAB685 |
    ASL A                         ;$CAB686 |
    CLC                           ;$CAB687 |
    ADC.B IdentifySNES            ;$CAB688 |
    TAY                           ;$CAB68A |
    LDA.W $7A85                   ;$CAB68B |
    ASL A                         ;$CAB68E |
    TAX                           ;$CAB68F |
    LDA.L DATA8_CABE22,X          ;$CAB690 |
    STA.B SNES_WaitForCommand_waitForMessage;$CAB694 |
    LDA.W #$00CA                  ;$CAB696 |
    STA.B $16                     ;$CAB699 |
    LDA.B [SNES_WaitForCommand_waitForMessage],Y;$CAB69B |
    AND.W #$00FF                  ;$CAB69D |
    CMP.W #$00FF                  ;$CAB6A0 |
    BEQ CODE_95B6A8               ;$CAB6A3 |
    STA.W $7A91                   ;$CAB6A5 |

CODE_95B6A8:
    RTS                           ;$CAB6A8 |

CorkboardCursorButtonMap_LUT:
    db $FF,$01,$03,$FF            ;	This table provides what buttons move the corkboard in which directions
    db $02,$FF,$FF,$FF
    db $00,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF

    dw $0001,$0002,$0004,$0008    ;$CAB6B9 |
    dw $0010,$0020,$0040,$0080    ;$CAB6C1 |
    dw $0100,$0200,$0400,$0800    ;$CAB6C9 |

CorkboardCursorCoordinates_LUT:
    dw !SpringBreeze_X_Location*8, !SpringBreeze_Y_Location*8
    dw !DynaBlade_X_Location*8, !DynaBlade_Y_Location*8
    dw !Gourmet_X_Location*8, !Gourmet_Y_Location*8
    dw !GCO_X_Location*8, !GCO_Y_Location*8
    dw !RoMK_X_Location*8, !RoMK_Y_Location*8
    dw !MWW_X_Location*8, !MWW_Y_Location*8
    dw !Arena_X_Location*8, !Arena_Y_Location*8
    dw $0070, $00A0
    dw $0098, $0098
    dw $0088, $0088
    dw $0048, $00A0

CorkboardCursorObjSlot_LUT:
    dw $0003              ;	Spring Breeze
    dw $0005
    dw $0004
    dw $0006
    dw $0007
    dw $0008
    dw $0009
    dw $000A
    dw $000C
    dw $000C
    dw $000B

DATA16_CAB713:
    dw $0000
    dw $000D
    dw $000E
    dw $000F
    dw $0010
    dw $0011
    dw $0012
    dw $0013
    dw $C014

    db $E5,$CD,$33,$41,$00,$C0,$53,$B7;$CAB725 |
    db $CA,$40,$FF,$02,$3C,$05,$28,$C1;$CAB72D |
    db $46,$B7,$CA,$41,$FF,$07,$C1,$46;$CAB735 |
    db $B7,$CA,$C0,$68,$B7,$CA,$41,$FF;$CAB73D |
    db $00                        ;$CAB745 |

    LDA.W Obj_VAR3,Y              ;$CAB746 |
    ASL A                         ;$CAB749 |
    TAX                           ;$CAB74A |
    LDA.L DATA16_CAB713,X         ;$CAB74B |
    STA.W Obj_Pose,Y              ;$CAB74F |
    RTL                           ;$CAB752 |
    LDA.W Obj_VAR3,Y              ;$CAB753 |
    ASL A                         ;$CAB756 |
    ASL A                         ;$CAB757 |
    TAX                           ;$CAB758 |
    LDA.L CorkboardCursorCoordinates_LUT,X    ;$CAB759 |
    STA.W Obj_XPosition,Y         ;$CAB75D |
    LDA.L CorkboardCursorCoordinates_LUT+2,X  ;$CAB760 |
    STA.W Obj_YPosition,Y         ;$CAB764 |
    RTL                           ;$CAB767 |
    LDA.W Obj_VAR3,Y              ;$CAB768 |
    ASL A                         ;$CAB76B |
    TAX                           ;$CAB76C |
    LDA.L DATA8_CAB779,X          ;$CAB76D |
    BMI CODE_15B778               ;$CAB771 |
    TAX                           ;$CAB773 |
    JML.L DestroyObject_L         ;$CAB774 |

CODE_15B778:
    RTL                           ;$CAB778 |

DATA8_CAB779:
    db $FF,$FF,$FF,$FF,$FF,$FF,$06,$00;$CAB779 |
    db $08,$00,$0A,$00,$FF,$FF,$15,$72;$CAB781 |
    db $AB,$14,$C0,$E5,$CD,$33,$40,$00;$CAB789 |
    db $C0,$96,$B7,$CA,$01        ;$CAB791 |

    LDX.W Obj_VAR3,Y              ;$CAB796 |
    LDA.L DATA16_CAB7AF,X         ;$CAB799 |
    STA.W Obj_XPosition,Y         ;$CAB79D |
    LDA.L DATA16_CAB7B5,X         ;$CAB7A0 |
    STA.W Obj_YPosition,Y         ;$CAB7A4 |
    LDA.L DATA16_CAB7BB,X         ;$CAB7A7 |
    STA.W Obj_Pose,Y              ;$CAB7AB |
    RTL                           ;$CAB7AE |

DATA16_CAB7AF:
    dw $0068,$00B8,$00D0

DATA16_CAB7B5:
    dw $0050
    dw $004D
    dw $0020

DATA16_CAB7BB:
    dw $0000,$0001                ;$CAB7B7 |
    dw $0002,$C014

DATA16_CAB7C3:
    dw $CDE5,$4033                ;$CAB7BF |
    dw $C000                      ;$CAB7C7 |
    dw $B7CD                      ;$CAB7C9 | ; Pointer to below?
    dw $01CA                      ;$CAB7CB |

CODE_15B7CD:
    LDA.W Obj_VAR3,Y              ;$CAB7CD |
    CMP.W #$0002                  ;$CAB7D0 |
    BNE CODE_95B7FC               ;$CAB7D3 |
    SEP #$20                      ;$CAB7D5 |
    LDA.W $7B00                   ;$CAB7D7 |
    CLC                           ;$CAB7DA |
    ADC.W $7B01                   ;$CAB7DB |
    REP #$20                      ;$CAB7DE |
    AND.W #$00FF                  ;$CAB7E0 |
    BEQ CODE_15B7F7               ;$CAB7E3 |
    LDA.W $7B02                   ;$CAB7E5 |
    AND.W #$00FF                  ;$CAB7E8 |
    BEQ CODE_15B7F2               ;$CAB7EB |
    LDA.W #$0016                  ;$CAB7ED |
    BRA CODE_15B7FF               ;$CAB7F0 |

CODE_15B7F2:
    LDA.W #$0015                  ;$CAB7F2 |
    BRA CODE_15B7FF               ;$CAB7F5 |


CODE_15B7F7:
    LDA.W #$FFFF                  ;$CAB7F7 |
    BRA CODE_15B7FF               ;$CAB7FA |


CODE_95B7FC:
    LDA.W #$0026                  ;$CAB7FC |

CODE_15B7FF:
    STA.W Obj_Pose,Y              ;$CAB7FF |
    LDA.W Obj_VAR3,Y              ;$CAB802 |
    ASL A                         ;$CAB805 |
    TAX                           ;$CAB806 |
    LDA.L DATA16_CAB816,X         ;$CAB807 |
    STA.W Obj_XPosition,Y         ;$CAB80B |
    LDA.L DATA16_CAB826,X         ;$CAB80E |
    STA.W Obj_YPosition,Y         ;$CAB812 |
    RTL                           ;$CAB815 |

DATA16_CAB816:
    dw $0060,$005A,$0071,$0060    ;$CAB816 |
    dw $0068,$005A,$0094,$0036    ;$CAB81E |

DATA16_CAB826:
    dw $001A,$001A,$001A,$001A    ;$CAB826 |
    dw $001A,$001A,$002A,$002A    ;$CAB82E |

    dw $EC16,$14A6,$FFFF,$40FF    ;$CAB836 |
    dw $19FF,$0000,$C100,$B84A    ;$CAB83E |
    dw $0ECA,$B843                ;$CAB846 |

    LDA.W Obj_VAR0,Y              ;$CAB84A |
    ASL A                         ;$CAB84D |
    CLC                           ;$CAB84E |
    ADC.W #$BFB6                  ;$CAB84F |
    LDX.W #$00CA                  ;$CAB852 |
    LDY.W #$A102                  ;$CAB855 |
    JSL.L WritePal                ;$CAB858 |
    LDY.B $39                     ;$CAB85C |
    LDA.W Obj_VAR0,Y              ;$CAB85E |
    INC A                         ;$CAB861 |
    CMP.W #$0005                  ;$CAB862 |
    BCC CODE_95B86A               ;$CAB865 |
    LDA.W #$0000                  ;$CAB867 |

CODE_95B86A:
    STA.W Obj_VAR0,Y              ;$CAB86A |
    RTL                           ;$CAB86D |

GetUnlockedSubgameCount:
    LDA.W $7A91                   ;$CAB86E |
    STA.W $7A87                   ;$CAB871 |
    STZ.B IdentifySNES            ;$CAB874 |
    INC.B IdentifySNES            ;$CAB876 |
    LDA.W $7A93                   ;$CAB878 |
    BIT.W #$0002                  ;$CAB87B |
    BEQ CODE_95B882               ;$CAB87E |
    INC.B IdentifySNES            ;$CAB880 |

CODE_95B882:
    BIT.W #$0008                  ;$CAB882 |
    BEQ CODE_95B88E               ;$CAB885 |
    BIT.W #$0010                  ;$CAB887 |
    BEQ CODE_95B88E               ;$CAB88A |
    INC.B IdentifySNES            ;$CAB88C |

CODE_95B88E:
    BIT.W #$0020                  ;$CAB88E |
    BEQ CODE_95B895               ;$CAB891 |
    INC.B IdentifySNES            ;$CAB893 |

CODE_95B895:
    BIT.W #$0040                  ;$CAB895 |
    BEQ CODE_95B89C               ;$CAB898 |
    INC.B IdentifySNES            ;$CAB89A |

CODE_95B89C:
    LDA.B IdentifySNES            ;$CAB89C |
    STA.W $7A85                   ;$CAB89E |
    RTL                           ;$CAB8A1 |
    JSR.W CODE_FN_15B92A          ;$CAB8A2 |
    JSL.L CODE_FL_CAB90B          ;$CAB8A5 |
    RTL                           ;$CAB8A9 |
    LDA.W $7A85                   ;$CAB8AA |
    CMP.W #$0006                  ;$CAB8AD |

CODE_95B8B0:
    BCS CODE_95B8B0               ;$CAB8B0 |
    ASL A                         ;$CAB8B2 |
    TAX                           ;$CAB8B3 |
    JMP.W (PTR16_15B8B7,X)        ;$CAB8B4 |
PTR16_15B8B7:
    dw CODE_15B8E1                ;$CAB8B7 |
    dw CODE_15B8DB                ;$CAB8B9 |
    dw CODE_15B8D5                ;$CAB8BB |
    dw CODE_15B8CF                ;$CAB8BD |
    dw CODE_15B8C9                ;$CAB8BF |
    dw CODE_15B8C3                ;$CAB8C1 |

CODE_15B8C3:
    LDA.W #$0007                  ;$CAB8C3 |
    JSR.W CODE_FN_15B92A          ;$CAB8C6 |

CODE_15B8C9:
    LDA.W #$0006                  ;$CAB8C9 |
    JSR.W CODE_FN_15B92A          ;$CAB8CC |

CODE_15B8CF:
    LDA.W #$0005                  ;$CAB8CF |
    JSR.W CODE_FN_15B92A          ;$CAB8D2 |

CODE_15B8D5:
    LDA.W #$0004                  ;$CAB8D5 |
    JSR.W CODE_FN_15B92A          ;$CAB8D8 |

CODE_15B8DB:
    LDA.W #$0003                  ;$CAB8DB |
    JSR.W CODE_FN_15B92A          ;$CAB8DE |

CODE_15B8E1:
    LDA.W #$0002                  ;$CAB8E1 |
    JSR.W CODE_FN_15B92A          ;$CAB8E4 |
    LDA.W #$0001                  ;$CAB8E7 |
    JSR.W CODE_FN_15B92A          ;$CAB8EA |
    LDA.W #$0000                  ;$CAB8ED |
    JSR.W CODE_FN_15B92A          ;$CAB8F0 |
    LDA.W #$0008                  ;$CAB8F3 |
    JSR.W CODE_FN_15B92A          ;$CAB8F6 |
    LDA.W #$0009                  ;$CAB8F9 |
    JSR.W CODE_FN_15B92A          ;$CAB8FC |
    LDA.W #$000A                  ;$CAB8FF |
    JSR.W CODE_FN_15B92A          ;$CAB902 |
    LDA.W $7A91                   ;$CAB905 |
    JSR.W CODE_FN_15B92A          ;$CAB908 |
    SEP #$20                      ;$CAB90B |
    LDA.B #$03                    ;$CAB90D |
    STA.B $31                     ;$CAB90F |
    LDA.B #$7E                    ;$CAB911 |
    STA.B P1_ResetRepeat          ;$CAB913 |
    REP #$20                      ;$CAB915 |
    LDA.W #$0800                  ;$CAB917 |
    STA.B $32                     ;$CAB91A |
    LDA.W #$7000                  ;$CAB91C |
    STA.B $34                     ;$CAB91F |
    LDA.W #$5C00                  ;$CAB921 |
    STA.B CameraX_TileMirror                     ;$CAB924 |
    JML.L WriteToDMABuffer     ;$CAB926 |

CODE_FN_15B92A:
    ASL A                         ;$CAB92A |
    STA.B $4B                     ;$CAB92B |
    LDA.W #$B938                  ;$CAB92D |
    LDX.W #$00CA                  ;$CAB930 |
    JSL.L SA1_ExecuteSNES         ;$CAB933 |
    RTS                           ;$CAB937 |
    LDX.B $4B                     ;$CAB938 |
    JMP.W (PTR16_15B93D,X)        ;$CAB93A |

PTR16_15B93D:
    dw WriteToCorkboardGFX_SpringBreeze ;$CAB93D |
    dw WriteToCorkboardGFX_DynaBlade    ;$CAB93F |
    dw WriteToCorkboardGFX_Gourmet      ;$CAB941 |
    dw WriteToCorkboardGFX_GreatCave    ;$CAB943 |
    dw WriteToCorkboardGFX_MetaKnight   ;$CAB945 |
    dw WriteToCorkboardGFX_MilkyWay     ;$CAB947 |
    dw WriteToCorkboardGFX_Arena        ;$CAB949 |
    dw WriteToCorkboardGFX_SoundTest    ;$CAB94B |
    dw WriteToCorkboardGFX_Samurai      ;$CAB94D |
    dw WriteToCorkboardGFX_Megaton      ;$CAB94F |
    dw WriteToCorkboardGFX_StereoMono   ;$CAB951 |

; Routines to write each corkboard panel's graphics to a temp location in WRAM
; This temp location is then mirrored to VRAM

WriteToCorkboardGFX_SpringBreeze:
    %WriteCorkboardPanelGFX($6000, !SpringBreeze_X_Location, !SpringBreeze_Y_Location, !SpringBreeze_Height, !SpringBreeze_Width)
    RTL                           ;$CAB9C3 |

WriteToCorkboardGFX_DynaBlade:
    %WriteCorkboardPanelGFX($6090, !DynaBlade_X_Location, !DynaBlade_Y_Location, !DynaBlade_Height, !DynaBlade_Width)
    RTL                           ;$CABA50 |

WriteToCorkboardGFX_Gourmet:
    %WriteCorkboardPanelGFX($6140, !Gourmet_X_Location, !Gourmet_Y_Location, !Gourmet_Height, !Gourmet_Width)
    RTL                           ;$CABAB3 |

WriteToCorkboardGFX_GreatCave:
    %WriteCorkboardPanelGFX($6200, !GCO_X_Location, !GCO_Y_Location, !GCO_Height, !GCO_Width)
    RTL                           ;$CABB32 |

WriteToCorkboardGFX_MetaKnight:
    %WriteCorkboardPanelGFX($62C0, !RoMK_X_Location, !RoMK_Y_Location, !RoMK_Height, !RoMK_Width)
    RTL                           ;$CABBB1 |

WriteToCorkboardGFX_MilkyWay:
    %WriteCorkboardPanelGFX($6380, !MWW_X_Location, !MWW_Y_Location, !MWW_Height, !MWW_Width)
    RTL                           ;$CABC3E |

WriteToCorkboardGFX_Arena:
    %WriteCorkboardPanelGFX($6440, !Arena_X_Location, !Arena_Y_Location, !Arena_Height, !Arena_Width)
    RTL                           ;$CABCA1 |

WriteToCorkboardGFX_SoundTest:
    %WriteCorkboardPanelGFX($64C0, !SoundTest_X_Location, !SoundTest_Y_Location, !SoundTest_Height, !SoundTest_Width)
    RTL                           ;$CABCDA |

WriteToCorkboardGFX_Samurai:
    LDA.W #$CE9F                  ;$CABCDB |
    STA.B SNES_WaitForCommand_waitForMessage;$CABCDE |
    LDA.W #$00EF                  ;$CABCE0 |
    STA.B $16                     ;$CABCE3 |
    LDA.W #$0604                  ;$CABCE5 |
    LDX.W #$0013                  ;$CABCE8 |
    LDY.W #$0013                  ;$CABCEB |
    JML.L CODE_JL_CABD34          ;$CABCEE |

WriteToCorkboardGFX_Megaton:
    LDA.W #$CE3F                  ;$CABCF2 |
    STA.B SNES_WaitForCommand_waitForMessage;$CABCF5 |
    LDA.W #$00EF                  ;$CABCF7 |
    STA.B $16                     ;$CABCFA |
    LDA.W #$0604                  ;$CABCFC |
    LDX.W #$0011                  ;$CABCFF |
    LDY.W #$0011                  ;$CABD02 |
    JML.L CODE_JL_CABD34          ;$CABD05 |

WriteToCorkboardGFX_StereoMono:
    LDA.W CurrentStereoMono       ;$CABD09 |
    AND.W #$00FF                  ;$CABD0C |
    BNE CODE_95BD1D               ;$CABD0F |
    LDA.W #$E5D4                  ;$CABD11 |
    STA.B SNES_WaitForCommand_waitForMessage;$CABD14 |
    LDA.W #$00EF                  ;$CABD16 |
    STA.B $16                     ;$CABD19 |
    BRA CODE_95BD27               ;$CABD1B |

CODE_95BD1D:
    LDA.W #$E5EC                  ;$CABD1D |
    STA.B SNES_WaitForCommand_waitForMessage;$CABD20 |
    LDA.W #$00EF                  ;$CABD22 |
    STA.B $16                     ;$CABD25 |

CODE_95BD27:
    LDA.W #$0303                  ;$CABD27 |
    LDX.W #$0009                  ;$CABD2A |
    LDY.W #$0014                  ;$CABD2D |
    JML.L CODE_JL_CABD34          ;$CABD30 |
    PHA                           ;$CABD34 |
    AND.W #$00FF                  ;$CABD35 |
    STA.B $06                     ;$CABD38 |
    PLA                           ;$CABD3A |
    XBA                           ;$CABD3B |
    AND.W #$00FF                  ;$CABD3C |
    STA.B DSP_SRCN                ;$CABD3F |
    DEC A                         ;$CABD41 |
    ASL A                         ;$CABD42 |
    STA.B DSP_ENVX                ;$CABD43 |
    TYA                           ;$CABD45 |
    ASL A                         ;$CABD46 |
    ASL A                         ;$CABD47 |
    ASL A                         ;$CABD48 |
    ASL A                         ;$CABD49 |
    ASL A                         ;$CABD4A |
    ASL A                         ;$CABD4B |
    STA.B IdentifySNES            ;$CABD4C |
    TXA                           ;$CABD4E |
    ASL A                         ;$CABD4F |
    CLC                           ;$CABD50 |
    ADC.B IdentifySNES            ;$CABD51 |
    CLC                           ;$CABD53 |
    ADC.W #$7000                  ;$CABD54 |
    STA.B $18                     ;$CABD57 |
    LDA.W #$007E                  ;$CABD59 |
    STA.B $1A                     ;$CABD5C |

CODE_95BD5E:
    LDY.B DSP_ENVX                ;$CABD5E |

CODE_95BD60:
    LDA.B [SNES_WaitForCommand_waitForMessage],Y;$CABD60 |
    STA.B [$18],Y                 ;$CABD62 |
    DEY                           ;$CABD64 |
    DEY                           ;$CABD65 |
    BPL CODE_95BD60               ;$CABD66 |
    LDA.B DSP_SRCN                ;$CABD68 |
    ASL A                         ;$CABD6A |
    CLC                           ;$CABD6B |
    ADC.B SNES_WaitForCommand_waitForMessage;$CABD6C |
    STA.B SNES_WaitForCommand_waitForMessage;$CABD6E |
    LDA.B $18                     ;$CABD70 |
    CLC                           ;$CABD72 |
    ADC.W #$0040                  ;$CABD73 |
    STA.B $18                     ;$CABD76 |
    DEC.B $06                     ;$CABD78 |
    BNE CODE_95BD5E               ;$CABD7A |
    RTL                           ;$CABD7C |
    STA.W ObjVar0_Temp            ;$CABD7D |
    STY.W ObjSlotMinimum          ;$CABD80 |
    TYA                           ;$CABD83 |
    INC A                         ;$CABD84 |
    INC A                         ;$CABD85 |
    STA.W ObjSlotMaximum          ;$CABD86 |
    BRA CODE_95BD9A               ;$CABD89 |
    STA.W ObjVar0_Temp            ;$CABD8B |
    LDA.W #$0010                  ;$CABD8E |
    STA.W ObjSlotMinimum          ;$CABD91 |
    LDA.W #$0030                  ;$CABD94 |
    STA.W ObjSlotMaximum          ;$CABD97 |

CODE_95BD9A:
    LDY.B $39                     ;$CABD9A |
    STZ.W ObjVar1_Temp            ;$CABD9C |
    STY.W ObjVar2_Temp            ;$CABD9F |
    STX.W ObjVar3_Temp            ;$CABDA2 |
    LDA.W Obj_XPositionMirror,Y   ;$CABDA5 |
    TAX                           ;$CABDA8 |
    LDA.W Obj_YPositionMirror,Y   ;$CABDA9 |
    TAY                           ;$CABDAC |
    LDA.W #$0011                  ;$CABDAD |
    JSL.L CreateNewObject         ;$CABDB0 |
    LDY.B $39                     ;$CABDB4 |
    RTL                           ;$CABDB6 |

    db $21,$00,$0F,$06,$F3,$B5,$C1,$B7;$CABDB7 |
    db $C3,$B5,$23,$B7,$36,$B8,$87,$B7;$CABDBF |
    db $83,$00,$14,$30,$2E,$E1,$00,$76;$CABDC7 |
    db $83,$E0,$6E,$6E,$5E,$D6,$00,$00;$CABDCF |
    db $83,$00,$18,$E8,$A6,$E1,$00,$60;$CABDD7 |
    db $FF,$83,$00,$08,$00,$99,$EF,$00;$CABDDF |
    db $48,$03,$00,$08,$00,$20,$7E,$00;$CABDE7 |
    db $4C,$83,$60,$00,$CF,$D0,$EF,$00;$CABDEF |
    db $50,$FF,$83,$00,$20,$4F,$78,$DF;$CABDF7 |
    db $00,$00,$83,$00,$24,$4A,$44,$DE;$CABDFF |
    db $00,$20,$83,$80,$1D,$3A,$21,$E0;$CABE07 |
    db $00,$10,$83,$80,$09,$A6,$49,$E7;$CABE0F |
    db $00,$1B,$83,$00,$18,$E8,$A6,$E1;$CABE17 |
    db $00,$60,$FF

DATA8_CABE22:
    db $2E,$BE,$5A,$BE,$86            ;$CABE1F |
    db $BE,$B2
    db $BE,$DE,$BE,$0A,$BF,$FF        ;$CABE27 |
    db $02,$01,$FF,$00,$09,$0A,$FF,$FF;$CABE2F |
    db $FF,$09,$00,$FF,$FF,$FF,$FF,$FF;$CABE37 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CABE3F |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$09;$CABE47 |
    db $FF,$FF,$09,$02,$08,$08,$0A,$01;$CABE4F |
    db $09,$FF,$01,$FF,$02,$01,$FF,$00;$CABE57 |
    db $03,$0A,$FF,$FF,$FF,$03,$00,$02;$CABE5F |
    db $09,$0A,$01,$FF,$FF,$FF,$FF,$FF;$CABE67 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CABE6F |
    db $FF,$FF,$FF,$09,$FF,$FF,$09,$03;$CABE77 |
    db $08,$08,$0A,$03,$09,$FF,$01,$FF;$CABE7F |
    db $02,$01,$FF,$00,$03,$0A,$FF,$FF;$CABE87 |
    db $04,$03,$00,$02,$04,$0A,$01,$02;$CABE8F |
    db $FF,$09,$03,$FF,$FF,$FF,$FF,$FF;$CABE97 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$09;$CABE9F |
    db $FF,$FF,$09,$04,$08,$08,$0A,$03;$CABEA7 |
    db $09,$FF,$01,$FF,$02,$01,$FF,$00;$CABEAF |
    db $03,$0A,$FF,$FF,$05,$03,$00,$02;$CABEB7 |
    db $04,$0A,$01,$05,$FF,$09,$03,$FF;$CABEBF |
    db $FF,$04,$02,$FF,$FF,$FF,$FF,$FF;$CABEC7 |
    db $FF,$FF,$FF,$09,$FF,$FF,$09,$04;$CABECF |
    db $08,$08,$0A,$03,$09,$FF,$01,$FF;$CABED7 |
    db $02,$01,$FF,$00,$03,$0A,$FF,$FF;$CABEDF |
    db $05,$03,$00,$02,$04,$0A,$01,$05;$CABEE7 |
    db $06,$09,$03,$FF,$FF,$04,$02,$05;$CABEEF |
    db $FF,$FF,$08,$FF,$FF,$FF,$FF,$09;$CABEF7 |
    db $06,$FF,$09,$04,$08,$08,$0A,$03;$CABEFF |
    db $09,$FF,$01                ;$CABF07 |

CorkboardSelectionDirections_LUT: ; Declare what subgame will be selected when pressing up/down/left/right while having a specific subgame selected.
    ;  U   R   D   L
    db $FF,$02,$01,$FF
    db $00,$03,$0A,$FF
    db $FF,$05,$03,$00
    db $02,$04,$0A,$01
    db $05,$06,$09,$03
    db $FF,$FF,$04,$02
    db $05,$FF,$FF,$08
    db $04,$09,$FF,$0A
    db $09,$06,$FF,$09
    db $04,$08,$08,$07
    db $03,$07,$FF,$01

CorkboardBG_FadeRedBlue:
    db $BE,$6A,$13,$20,$7B,$23,$B7,$21;$CABF36 |	Palette that is written to background when transitioning from red to blue on subgame selection.
    db $BE,$6A,$12,$24,$39,$27,$96,$25;$CABF3E |
    db $BE,$6A,$10,$2C,$18,$2F,$74,$2D;$CABF46 |
    db $BE,$6A,$0F,$30,$D6,$32,$73,$31;$CABF4E |
    db $BE,$6A,$0E,$38,$94,$3A,$51,$39;$CABF56 |
    db $BE,$6A,$0D,$3C,$52,$3E,$30,$3D;$CABF5E |
    db $BE,$6A,$0B,$44,$10,$46,$0E,$45;$CABF66 |
    db $BE,$6A,$0A,$4C,$EF,$4D,$ED,$4C;$CABF6E |
    db $BE,$6A,$09,$50,$AD,$51,$CB,$50;$CABF76 |
    db $BE,$6A,$08,$58,$6B,$59,$A9,$58;$CABF7E |
    db $BE,$6A,$06,$5C,$29,$5D,$88,$5C;$CABF86 |
    db $BE,$6A,$05,$64,$E7,$64,$86,$64;$CABF8E |
    db $BE,$6A,$04,$68,$A5,$68,$65,$68;$CABF96 |
    db $BE,$6A,$03,$70,$84,$70,$43,$70;$CABF9E |
    db $BE,$6A,$01,$74,$42,$74,$22,$74;$CABFA6 |
    db $BE,$6A,$00,$7C,$00,$7C,$00,$7C;$CABFAE |

CorkboardCursorPalette:
    dw $7C00                      ;$CABFB6 |	Palette that the corkboard cursor cycles through every frame
    dw $001F                      ;$CABFB8 |	Red
    dw $0000                      ;$CABFBA |	Black
    dw $7FFF                      ;$CABFBC |	White
    dw $03E0                      ;$CABFBE |	Green
    dw $45A8                      ;$CABFC0 |	Gray... but this frame is never seen?

    db $00,$00,$08,$21,$0F,$00,$00,$3C;$CABFC2 |
    db $EF,$3D,$87,$15,$44,$11,$C4,$04;$CABFCA |
    db $84,$04,$2C,$15,$0B,$0D,$E9,$08;$CABFD2 |
    db $A7,$04,$EF,$3D,$CE,$35,$A8,$45;$CABFDA |
    db $06,$00,$08,$00,$AB,$00,$00,$00;$CABFE2 |
    db $C6,$18,$4A,$29,$00,$00,$A3,$10;$CABFEA |
    db $E5,$14,$06,$1D,$28,$21,$4A,$25;$CABFF2 |
    db $8B,$2D,$AD,$31,$CE,$35,$A8,$45;$CABFFA |
    db $00,$00,$C6,$18,$EF,$3D,$ED,$14;$CAC002 |
    db $0E,$19,$2F,$1D,$4F,$21,$6F,$25;$CAC00A |
    db $8F,$2D,$EF,$3D,$EF,$3D,$EF,$3D;$CAC012 |
    db $EF,$3D,$EF,$3D,$EF,$3D,$A8,$45;$CAC01A |
    db $00,$00,$00,$00,$00,$00,$00,$00;$CAC022 |
    db $00,$00,$00,$00,$00,$00,$00,$00;$CAC02A |
    db $00,$00,$00,$00,$00,$00,$00,$00;$CAC032 |
    db $00,$00,$00,$00,$00,$00,$A8,$45;$CAC03A |
    db $00,$00,$85,$11,$C6,$18,$8F,$31;$CAC042 |
    db $05,$00,$0A,$00,$40,$18,$C0,$30;$CAC04A |
    db $40,$3D,$C7,$3D,$EF,$01,$00,$01;$CAC052 |
    db $0F,$00,$29,$25,$CE,$39,$C0,$39;$CAC05A |
    db $CD,$CA,$C0,$6C,$92,$00,$02,$01;$CAC062 |
    db $0A,$5B,$C3,$C0,$F8,$07,$C9,$C0;$CAC06A |
    db $F3,$D2,$00,$1E,$F0,$2F,$E0,$00;$CAC072 |
    db $C0,$EA,$9F,$00,$80,$D1,$EE,$80;$CAC07A |
    db $80,$00,$C0,$EA,$9F,$00,$8D,$DC;$CAC082 |
    db $EF,$F0,$20,$00,$C0,$EA,$9F,$00;$CAC08A |
    db $B9,$C6,$E9,$30,$20,$00,$C0,$6C;$CAC092 |
    db $9C,$00,$79,$CD,$CA,$C0,$65,$9B;$CAC09A |
    db $00,$18,$40,$19,$00,$00,$00,$00;$CAC0A2 |
    db $00,$00,$00,$00,$00,$0A,$68,$CD;$CAC0AA |
    db $03,$46,$C3,$CA,$05,$10,$C1,$CD;$CAC0B2 |
    db $9F,$00,$07,$19,$09,$00,$00,$C0;$CAC0BA |
    db $65,$9B,$00,$18,$40,$19,$00,$00;$CAC0C2 |
    db $00,$00,$00,$12,$00,$00,$00,$C0;$CAC0CA |
    db $65,$9B,$00,$18,$40,$19,$00,$00;$CAC0D2 |
    db $00,$00,$00,$04,$00,$00,$00,$21;$CAC0DA |
    db $09,$11,$EB,$C0,$02,$01,$0E,$E1;$CAC0E2 |
    db $C0,$05,$10,$C1,$DD,$9F,$00,$07;$CAC0EA |
    db $C0,$2C,$CD,$CA,$00,$00,$19,$00;$CAC0F2 |
    db $C0,$EF,$9B,$00,$0A,$5B,$C3,$C0;$CAC0FA |
    db $F8,$07,$C9,$C0,$EA,$9F,$00,$AA;$CAC102 |
    db $69,$EC,$80,$C0,$00,$C0,$EA,$9F;$CAC10A |
    db $00,$8D,$DC,$EF,$F0,$20,$00,$C0;$CAC112 |
    db $9D,$CE,$CA,$C0,$6C,$9C,$00,$DA;$CAC11A |
    db $CD,$CA,$C0,$EA,$9F,$00,$4A,$6A;$CAC122 |
    db $EC,$D0,$20,$00,$2A,$01,$40,$00;$CAC12A |
    db $2B,$01,$00,$00,$C0,$65,$9B,$00;$CAC132 |
    db $18,$40,$19,$00,$00,$00,$00,$00;$CAC13A |
    db $02,$00,$00,$00,$C0,$65,$9B,$00;$CAC142 |
    db $18,$40,$19,$00,$00,$00,$00,$00;$CAC14A |
    db $17,$00,$00,$00,$C0,$65,$9B,$00;$CAC152 |
    db $18,$40,$19,$00,$00,$00,$00,$00;$CAC15A |
    db $00,$00,$00,$00,$0A,$68,$CD,$03;$CAC162 |
    db $46,$C3,$CA,$05,$10,$C1,$CD,$9F;$CAC16A |
    db $00,$07,$19,$09,$00,$00,$C0,$65;$CAC172 |
    db $9B,$00,$18,$40,$19,$00,$00,$00;$CAC17A |
    db $00,$00,$13,$00,$00,$00,$C0,$65;$CAC182 |
    db $9B,$00,$18,$40,$19,$00,$00,$00;$CAC18A |
    db $00,$00,$15,$00,$00,$00,$C0,$65;$CAC192 |
    db $9B,$00,$18,$40,$19,$00,$00,$00;$CAC19A |
    db $00,$00,$19,$00,$00,$00,$21,$09;$CAC1A2 |
    db $11,$B2,$C1,$02,$01,$0E,$A8,$C1;$CAC1AA |
    db $C0,$EA,$9F,$00,$AD,$DC,$EF,$80;$CAC1B2 |
    db $20,$00,$19,$09,$00,$00,$C0,$65;$CAC1BA |
    db $9B,$00,$18,$40,$19,$00,$00,$00;$CAC1C2 |
    db $00,$00,$08,$00,$00,$00,$C0,$65;$CAC1CA |
    db $9B,$00,$18,$40,$19,$00,$00,$00;$CAC1D2 |
    db $00,$00,$23,$00,$00,$00,$21,$09;$CAC1DA |
    db $11,$EA,$C1,$02,$01,$0E,$E0,$C1;$CAC1E2 |
    db $2E,$01,$19,$09,$00,$00,$02,$01;$CAC1EA |
    db $C0,$65,$9B,$00,$18,$40,$19,$00;$CAC1F2 |
    db $00,$00,$00,$00,$1A,$00,$00,$00;$CAC1FA |
    db $C0,$65,$9B,$00,$18,$40,$19,$00;$CAC202 |
    db $00,$00,$00,$00,$1C,$00,$00,$00;$CAC20A |
    db $C0,$65,$9B,$00,$18,$40,$19,$00;$CAC212 |
    db $00,$00,$00,$00,$1D,$00,$00,$00;$CAC21A |
    db $C0,$65,$9B,$00,$18,$40,$19,$00;$CAC222 |
    db $00,$00,$00,$00,$1E,$00,$00,$00;$CAC22A |
    db $C0,$65,$9B,$00,$18,$40,$19,$00;$CAC232 |
    db $00,$00,$00,$00,$1F,$00,$00,$00;$CAC23A |
    db $C0,$65,$9B,$00,$18,$40,$19,$00;$CAC242 |
    db $00,$00,$00,$00,$20,$00,$00,$00;$CAC24A |
    db $C0,$65,$9B,$00,$18,$40,$19,$00;$CAC252 |
    db $00,$00,$00,$00,$21,$00,$00,$00;$CAC25A |
    db $C0,$65,$9B,$00,$18,$40,$19,$00;$CAC262 |
    db $00,$00,$00,$00,$06,$00,$00,$00;$CAC26A |
    db $21,$09,$11,$7C,$C2,$02,$01,$0E;$CAC272 |
    db $72,$C2,$05,$10,$C1,$DD,$9F,$00;$CAC27A |
    db $07,$C0,$2C,$CD,$CA,$00,$00,$19;$CAC282 |
    db $00,$C0,$EF,$9B,$00,$0A,$5B,$C3;$CAC28A |
    db $C0,$F8,$07,$C9,$2A,$00,$00,$00;$CAC292 |
    db $2B,$00,$38,$00,$2A,$01,$00,$00;$CAC29A |
    db $2B,$01,$40,$00,$C0,$EA,$9F,$00;$CAC2A2 |
    db $AA,$69,$EC,$80,$C0,$00,$C0,$EA;$CAC2AA |
    db $9F,$00,$99,$BE,$E9,$00,$A0,$00;$CAC2B2 |
    db $C0,$6C,$9C,$00,$2B,$CE,$CA,$C0;$CAC2BA |
    db $65,$9B,$00,$18,$40,$19,$00,$00;$CAC2C2 |
    db $00,$00,$00,$00,$00,$00,$00,$0A;$CAC2CA |
    db $68,$CD,$03,$46,$C3,$CA,$05,$10;$CAC2D2 |
    db $C1,$CD,$9F,$00,$07,$19,$09,$00;$CAC2DA |
    db $00,$C0,$65,$9B,$00,$18,$40,$19;$CAC2E2 |
    db $00,$00,$00,$00,$00,$07,$00,$00;$CAC2EA |
    db $00,$C0,$65,$9B,$00,$18,$40,$19;$CAC2F2 |
    db $00,$00,$00,$00,$00,$03,$00,$00;$CAC2FA |
    db $00,$C0,$65,$9B,$00,$18,$40,$19;$CAC302 |
    db $00,$00,$00,$00,$00,$16,$00,$00;$CAC30A |
    db $00,$C0,$65,$9B,$00,$18,$40,$19;$CAC312 |
    db $00,$00,$00,$00,$00,$18,$00,$00;$CAC31A |
    db $00,$21,$09,$11,$2D,$C3,$02,$01;$CAC322 |
    db $0E,$23,$C3,$05,$10,$C0,$DD,$9F;$CAC32A |
    db $00,$C0,$78,$CE,$00,$F0,$02,$01;$CAC332 |
    db $07,$F0,$00,$E0,$00,$C0,$BE,$84;$CAC33A |
    db $00,$0E,$F5,$CC            ;$CAC342 |
    LDA.W P1_Hold                 ;$CAC346 |
    BIT.W #$1000                  ;$CAC349 |
    BEQ CODE_15C35A               ;$CAC34C |
    LDA.W #$C32D                  ;$CAC34E |
    LDY.W #$00CA                  ;$CAC351 |
    LDX.B $39                     ;$CAC354 |
    JSL.L CODE_FL_008F64          ;$CAC356 |

CODE_15C35A:
    RTL                           ;$CAC35A |

    db $1B,$30,$33,$00,$00,$C0,$EF,$9B;$CAC35B |
    db $00,$C0,$BE,$84,$00,$C0,$10,$9D;$CAC363 |
    db $00,$00,$00,$00,$00,$1B,$5B,$30;$CAC36B |
    db $00,$00,$1B,$5D,$30,$00,$00,$C0;$CAC373 |
    db $94,$9C,$00,$09,$C0,$CE,$9C,$00;$CAC37B |
    db $17,$C0,$9A,$9C,$00,$00,$02,$00;$CAC383 |
    db $00,$00,$48,$C0,$9A,$9C,$00,$01;$CAC38B |
    db $00,$00,$00,$00,$54,$C0,$9A,$9C;$CAC393 |
    db $00,$02,$00,$00,$40,$00,$50,$C0;$CAC39B |
    db $BB,$9C,$00,$00,$00,$60,$00,$C0;$CAC3A3 |
    db $85,$9F,$00,$17,$0C,$C0,$6C,$92;$CAC3AB |
    db $00,$02,$01,$15,$72,$AB,$16,$FB;$CAC3B3 |
    db $A6,$14,$C7,$88,$CC,$33,$40,$00;$CAC3BB |
    db $24,$21,$00,$0F,$26,$14,$C4,$20;$CAC3C3 |
    db $C4,$5E,$C4,$70,$C4,$7E,$C4,$A3;$CAC3CB |
    db $C4,$DC,$C4,$9A,$C5,$73,$C9,$CF;$CAC3D3 |
    db $C5,$FA,$C5,$43,$C6,$59,$C6,$6F;$CAC3DB |
    db $C6,$85,$C6,$9B,$C6,$B1,$C6,$C7;$CAC3E3 |
    db $C6,$46,$C7,$C7,$C7,$FE,$C7,$2A;$CAC3EB |
    db $C8,$CF,$C8,$59,$C9,$8A,$C9,$A4;$CAC3F3 |
    db $C9,$C8,$C9,$C8,$C9,$0A,$CA,$32;$CAC3FB |
    db $CA,$5A,$CA,$82,$CA,$AA,$CA,$D2;$CAC403 |
    db $CA,$FA,$CA,$FA,$CA,$0B,$CB,$A2;$CAC40B |
    db $C8,$33,$F0,$00,$26,$D7,$00,$27;$CAC413 |
    db $C0,$00,$40,$16,$01,$26,$00,$01;$CAC41B |
    db $27,$80,$00,$40,$FF,$02,$4B,$02;$CAC423 |
    db $F0,$80,$00,$FA,$40,$0D,$02,$15;$CAC42B |
    db $24,$26,$80,$00,$27,$80,$00,$02;$CAC433 |
    db $04,$40,$0E,$C0,$2C,$CD,$CA,$F4;$CAC43B |
    db $05,$19,$00,$0A,$5C,$CD,$02,$01;$CAC443 |
    db $C0,$2C,$CD,$CA,$F6,$05,$19,$00;$CAC44B |
    db $0A,$5C,$CD,$02,$01,$1B,$A0,$71;$CAC453 |
    db $01,$00,$01,$26,$40,$00,$27,$50;$CAC45B |
    db $00,$80,$D8,$FF,$40,$18,$02,$80;$CAC463 |
    db $02,$FF,$02,$FF,$00,$26,$00,$01;$CAC46B |
    db $27,$40,$00,$80,$E0,$FF,$40,$18;$CAC473 |
    db $02,$C8,$01,$26,$80,$00,$27,$A0;$CAC47B |
    db $00,$40,$0C,$90,$80,$FF,$02,$72;$CAC483 |
    db $4C,$14,$24,$02,$14,$C0,$65,$9B;$CAC48B |
    db $00,$18,$40,$19,$00,$00,$00,$00;$CAC493 |
    db $00,$11,$00,$00,$00,$02,$04,$00;$CAC49B |
    db $26,$80,$00,$27,$2C,$FF,$40,$00;$CAC4A3 |
    db $02,$28,$90,$00,$10,$02,$11,$BA;$CAC4AB |
    db $00,$FE,$B0,$1E,$00,$02,$1E,$24;$CAC4B3 |
    db $02,$14,$60,$02,$1C,$60,$C0,$2C;$CAC4BB |
    db $CD,$CA,$F0,$05,$19,$00,$0A,$5C;$CAC4C3 |
    db $CD,$02,$01,$C0,$2C,$CD,$CA,$F2;$CAC4CB |
    db $05,$19,$00,$0A,$5C,$CD,$02,$01;$CAC4D3 |
    db $01,$26,$80,$00,$27,$4B,$00,$02;$CAC4DB |
    db $50,$19,$06,$00,$00,$03,$5A,$C5;$CAC4E3 |
    db $CA,$E0,$40,$14,$EA,$9A,$C5,$42;$CAC4EB |
    db $18,$42,$19,$42,$1A,$C0,$F1,$A3;$CAC4F3 |
    db $00,$E0,$00,$00,$00,$C0,$F1,$A3;$CAC4FB |
    db $00,$E0,$00,$01,$00,$C0,$F1,$A3;$CAC503 |
    db $00,$E0,$00,$02,$00,$C0,$F1,$A3;$CAC50B |
    db $00,$E0,$00,$03,$00,$C0,$F1,$A3;$CAC513 |
    db $00,$E0,$00,$04,$00,$C0,$F1,$A3;$CAC51B |
    db $00,$E0,$00,$05,$00,$C0,$F1,$A3;$CAC523 |
    db $00,$E0,$00,$06,$00,$C0,$F1,$A3;$CAC52B |
    db $00,$E0,$00,$07,$00,$14,$C7,$88;$CAC533 |
    db $CC,$33,$41,$00,$40,$1B,$02,$14;$CAC53B |
    db $80,$60,$02,$A0,$EE,$FF,$02,$1C;$CAC543 |
    db $A8,$F6,$FF,$A0,$A0,$FF,$02,$3C;$CAC54B |
    db $24,$1B,$A0,$71,$01,$00,$01;$CAC553 |

    LDA.W Obj_VAR6,Y              ;$CAC55A |
    LDX.W #$000A                  ;$CAC55D |
    JSL.L CODE_FL_00A628          ;$CAC560 |
    LDY.B $39                     ;$CAC564 |
    LDA.W $32E6                   ;$CAC566 |
    BNE CODE_15C583               ;$CAC569 |
    LDA.W $32E4                   ;$CAC56B |
    CMP.W #$0005                  ;$CAC56E |
    BCS CODE_15C589               ;$CAC571 |
    ASL A                         ;$CAC573 |
    TAX                           ;$CAC574 |
    LDA.L DATA8_CAC590,X          ;$CAC575 |
    LDX.W #$00ED                  ;$CAC579 |
    LDY.W #$8010                  ;$CAC57C |
    JSL.L WritePal                ;$CAC57F |

CODE_15C583:
    LDX.B $39                     ;$CAC583 |
    INC.W Obj_VAR6,X              ;$CAC585 |
    RTL                           ;$CAC588 |

CODE_15C589:
    LDY.B $39                     ;$CAC589 |
    JSL.L CODE_FL_00E1BF          ;$CAC58B |
    RTL                           ;$CAC58F |

    db $60,$B6,$40,$B6,$20,$B6,$00,$B6;$CAC590 |
    db $E0,$B5,$26,$D8,$00,$27,$10,$00;$CAC598 |
    db $02,$AA,$E0,$E4,$02,$1E,$80,$80;$CAC5A0 |
    db $FF,$A0,$E0,$FF,$90,$00,$06,$33;$CAC5A8 |
    db $60,$00,$40,$1B,$02,$1A,$24,$8A;$CAC5B0 |
    db $00,$FC,$80,$1C,$00,$90,$C0,$FF;$CAC5B8 |
    db $33,$20,$00,$40,$1C,$02,$C8,$02;$CAC5C0 |
    db $98,$1B,$A0,$71,$01,$00,$00,$26;$CAC5C8 |
    db $80,$00,$27,$20,$00,$40,$0F,$02;$CAC5D0 |
    db $1E,$16,$EC,$A6,$03,$3B,$C6,$CA;$CAC5D8 |
    db $19,$01,$00,$C0,$19,$03,$00,$FF;$CAC5E0 |
    db $19,$04,$00,$02,$19,$05,$00,$00;$CAC5E8 |
    db $02,$80,$02,$80,$24,$16,$FB,$A6;$CAC5F0 |
    db $04,$01,$33,$40,$00,$40,$14,$02;$CAC5F8 |
    db $0A,$0A,$10,$C6,$02,$AA,$19,$01;$CAC600 |
    db $B6,$6D,$0A,$2E,$C6,$02,$14,$00;$CAC608 |
    db $16,$EC,$A6,$03,$3B,$C6,$CA,$26;$CAC610 |
    db $80,$00,$27,$60,$00,$19,$01,$00;$CAC618 |
    db $C0,$19,$03,$E7,$02,$19,$04,$00;$CAC620 |
    db $02,$19,$05,$00,$00,$0C,$19,$03;$CAC628 |
    db $00,$00,$19,$04,$00,$00,$19,$05;$CAC630 |
    db $C0,$00,$0C                ;$CAC638 |

CODE_JP_15C63B:
    JSL.L CODE_FL_CACD09          ;$CAC63B |
    JML.L CODE_FL_00A6F7          ;$CAC63F |

    db $33,$3F,$00,$40,$10,$02,$0A,$0A;$CAC643 |
    db $10,$C6,$02,$9E,$19,$01,$24,$49;$CAC64B |
    db $0A,$2E,$C6,$02,$14,$00,$33,$3E;$CAC653 |
    db $00,$40,$11,$02,$0A,$0A,$10,$C6;$CAC65B |
    db $02,$91,$19,$01,$92,$24,$0A,$2E;$CAC663 |
    db $C6,$02,$14,$00,$33,$3D,$00,$40;$CAC66B |
    db $12,$02,$0A,$0A,$10,$C6,$02,$84;$CAC673 |
    db $19,$01,$FE,$FF,$0A,$2E,$C6,$02;$CAC67B |
    db $14,$00,$33,$3C,$00,$40,$13,$02;$CAC683 |
    db $0A,$0A,$10,$C6,$02,$77,$19,$01;$CAC68B |
    db $6C,$DB,$0A,$2E,$C6,$02,$14,$00;$CAC693 |
    db $33,$3B,$00,$40,$0F,$02,$0A,$0A;$CAC69B |
    db $10,$C6,$02,$6A,$19,$01,$DA,$B6;$CAC6A3 |
    db $0A,$2E,$C6,$02,$14,$00,$33,$3A;$CAC6AB |
    db $00,$40,$15,$02,$0A,$0A,$10,$C6;$CAC6B3 |
    db $02,$5E,$19,$01,$48,$92,$0A,$2E;$CAC6BB |
    db $C6,$02,$14,$00,$E0,$15,$C0,$65;$CAC6C3 |
    db $9B,$00,$18,$40,$19,$00,$00,$00;$CAC6CB |
    db $00,$00,$0A,$00,$00,$00,$02,$0C;$CAC6D3 |
    db $C0,$65,$9B,$00,$18,$40,$19,$00;$CAC6DB |
    db $00,$00,$00,$00,$0B,$00,$00,$00;$CAC6E3 |
    db $02,$0D,$C0,$65,$9B,$00,$18,$40;$CAC6EB |
    db $19,$00,$00,$00,$00,$00,$0C,$00;$CAC6F3 |
    db $00,$00,$02,$0D,$C0,$65,$9B,$00;$CAC6FB |
    db $18,$40,$19,$00,$00,$00,$00,$00;$CAC703 |
    db $0D,$00,$00,$00,$02,$0D,$C0,$65;$CAC70B |
    db $9B,$00,$18,$40,$19,$00,$00,$00;$CAC713 |
    db $00,$00,$0E,$00,$00,$00,$02,$0D;$CAC71B |
    db $C0,$65,$9B,$00,$18,$40,$19,$00;$CAC723 |
    db $00,$00,$00,$00,$0F,$00,$00,$00;$CAC72B |
    db $02,$0C,$C0,$65,$9B,$00,$18,$40;$CAC733 |
    db $19,$00,$00,$00,$00,$00,$10,$00;$CAC73B |
    db $00,$00,$00,$33,$60,$00,$26,$80;$CAC743 |
    db $00,$27,$9E,$00,$40,$FF,$02,$2E;$CAC74B |
    db $90,$C0,$00,$B0,$F4,$FF,$02,$42;$CAC753 |
    db $40,$03,$B0,$10,$00,$02,$34,$24;$CAC75B |
    db $02,$AC,$C0,$65,$9B,$00,$18,$40;$CAC763 |
    db $19,$00,$00,$00,$00,$00,$14,$00;$CAC76B |
    db $00,$00,$C0,$65,$9B,$00,$18,$40;$CAC773 |
    db $19,$00,$00,$00,$00,$00,$05,$00;$CAC77B |
    db $00,$00,$90,$60,$00,$B0,$06,$00;$CAC783 |
    db $02,$38,$24,$40,$0B,$02,$28,$02;$CAC78B |
    db $F0,$C0,$65,$9B,$00,$18,$40,$19;$CAC793 |
    db $00,$00,$00,$00,$00,$01,$00,$00;$CAC79B |
    db $00,$02,$5F,$02,$F0,$E0,$11,$80;$CAC7A3 |
    db $00,$FE,$90,$00,$FE,$B0,$08,$00;$CAC7AB |
    db $05,$02,$44,$03,$44,$05,$44,$09;$CAC7B3 |
    db $44,$07,$44,$04,$44,$08,$44,$0A;$CAC7BB |
    db $44,$06,$07,$00,$02,$78,$19,$09;$CAC7C3 |
    db $00,$00,$03,$D2,$C7,$CA,$01;$CAC7CB |

    LDA.W Obj_VAR9,Y              ;$CAC7D2 |
    TAX                           ;$CAC7D5 |
    AND.W #$001F                  ;$CAC7D6 |
    BNE CODE_15C7F1               ;$CAC7D9 |
    TXA                           ;$CAC7DB |
    AND.W #$03E0                  ;$CAC7DC |
    CMP.W #$0200                  ;$CAC7DF |
    BCS CODE_15C7FA               ;$CAC7E2 |
    ADC.W #$CF18                  ;$CAC7E4 |
    LDX.W #$00CA                  ;$CAC7E7 |
    LDY.W #$A010                  ;$CAC7EA |
    JSL.L WritePal                ;$CAC7ED |

CODE_15C7F1:
    LDX.B $39                     ;$CAC7F1 |
    INC.W Obj_VAR9,X              ;$CAC7F3 |
    INC.W Obj_VAR9,X              ;$CAC7F6 |
    RTL                           ;$CAC7F9 |

CODE_15C7FA:
    JML.L DestroyUsedObject       ;$CAC7FA |

    db $16,$EC,$A6,$03,$23,$C8,$CA,$2E;$CAC7FE |
    db $00,$24,$2A,$00,$00,$00,$2B,$00;$CAC806 |
    db $00,$00,$02,$28,$90,$00,$10,$02;$CAC80E |
    db $11,$BA,$00,$FE,$B0,$1E,$00,$02;$CAC816 |
    db $1E,$2E,$00,$24,$00        ;$CAC81E |

    LDX.W #$0000                  ;$CAC823 |
    JML.L CODE_FL_00A91D          ;$CAC826 |

    db $26,$00,$01,$27,$40,$00,$80,$A0;$CAC82A |
    db $FF,$90,$F0,$FF,$40,$19,$C0,$2C;$CAC832 |
    db $CD,$CA,$F8,$05,$19,$00,$02,$C8;$CAC83A |
    db $02,$64,$80,$B0,$FF,$02,$28,$80;$CAC842 |
    db $D0,$FF,$90,$00,$00,$02,$14,$E0;$CAC84A |
    db $05,$44,$1A,$44,$19,$44,$1A,$14;$CAC852 |
    db $83,$0A,$CE,$42,$19,$42,$18,$42;$CAC85A |
    db $17,$42,$16,$42,$1A,$42,$0B,$42;$CAC862 |
    db $0A,$42,$09,$42,$00,$42,$01,$42;$CAC86A |
    db $02,$42,$03,$42,$04,$42,$05,$42;$CAC872 |
    db $06,$42,$07,$C0,$65,$9B,$00,$18;$CAC87A |
    db $40,$19,$00,$00,$00,$00,$00,$25;$CAC882 |
    db $00,$00,$00,$19,$09,$00,$00,$05;$CAC88A |
    db $80,$44,$34,$44,$35,$C0,$9D,$C8;$CAC892 |
    db $CA,$07,$00                ;$CAC89A |

    TYX                           ;$CAC89D |
    INC.W Obj_VAR9,X              ;$CAC89E |
    RTL                           ;$CAC8A1 |

    db $03,$BD,$C8,$CA,$14,$83,$0A,$CE;$CAC8A2 |
    db $33,$20,$00,$1B,$B4,$77,$FF,$FF;$CAC8AA |
    db $41,$36,$61,$41,$58,$61,$61,$61;$CAC8B2 |
    db $0E,$B2,$C8                ;$CAC8BA |

    JSL.L CODE_FL_D034E4          ;$CAC8BD |
    LDA.W $623C,X                 ;$CAC8C1 |
    BPL CODE_15C8CB               ;$CAC8C4 |
    TYX                           ;$CAC8C6 |
    JML.L DestroyObject_L         ;$CAC8C7 |

CODE_15C8CB:
    JML.L CODE_JL_D5EE87          ;$CAC8CB |

    db $16,$EC,$A6,$03,$3B,$C9,$CA,$19;$CAC8CF |
    db $08,$00,$00,$26,$4A,$00,$27,$6A;$CAC8D7 |
    db $00,$19,$03,$00,$00,$19,$05,$C0;$CAC8DF |
    db $FF,$19,$04,$00,$04,$19,$01,$00;$CAC8E7 |
    db $00,$02,$1F,$19,$04,$00,$04,$19;$CAC8EF |
    db $01,$00,$20,$02,$1F,$19,$04,$00;$CAC8F7 |
    db $04,$19,$01,$00,$40,$02,$1F,$19;$CAC8FF |
    db $04,$00,$04,$19,$01,$00,$60,$02;$CAC907 |
    db $1F,$19,$04,$00,$04,$19,$01,$00;$CAC90F |
    db $80,$02,$1F,$19,$04,$00,$04,$19;$CAC917 |
    db $01,$00,$A0,$02,$1F,$19,$04,$00;$CAC91F |
    db $04,$19,$01,$00,$C0,$02,$1F,$19;$CAC927 |
    db $04,$00,$04,$19,$01,$00,$E0,$02;$CAC92F |
    db $1F,$0E,$E8,$C8            ;$CAC937 |

    TYX                           ;$CAC93B |
    INC.W Obj_VAR8,X              ;$CAC93C |
    LDA.W Obj_VAR8,Y              ;$CAC93F |
    AND.W #$000C                  ;$CAC942 |
    LSR A                         ;$CAC945 |
    TAX                           ;$CAC946 |
    LDA.L DATA8_CAC951,X          ;$CAC947 |
    STA.W Obj_Pose,Y              ;$CAC94B |
    JMP.W CODE_JP_15C63B          ;$CAC94E |

    db $1E,$00,$1F,$00,$21,$00,$20,$00;$CAC951 |
    db $16,$EC,$A6,$03,$6C,$C9,$CA,$2A;$CAC959 |
    db $01,$80,$00,$2B,$01,$00,$00,$80;$CAC961 |
    db $C0,$FF,$01                ;$CAC969 |

    LDX.W #$0002                  ;$CAC96C |
    JML.L CODE_FL_00A91D          ;$CAC96F |

    db $16,$EC,$A6,$03,$6C,$C9,$CA,$80;$CAC973 |
    db $80,$FF,$02,$97,$02,$7A,$80,$C0;$CAC97B |
    db $FF,$02,$6C,$A0,$10,$00,$01,$16;$CAC983 |
    db $EC,$A6,$03,$3B,$C6,$CA,$26,$4A;$CAC98B |
    db $00,$27,$6A,$00,$40,$1D,$19,$03;$CAC993 |
    db $00,$00,$19,$05,$C0,$FF,$0E,$10;$CAC99B |
    db $C9,$26,$00,$00,$27,$60,$00,$80;$CAC9A3 |
    db $30,$00,$90,$0A,$00,$40,$17,$02;$CAC9AB |
    db $FA,$02,$FA,$02,$FA,$90,$00,$00;$CAC9B3 |
    db $02,$FA,$02,$8C,$24,$1B,$A0,$71;$CAC9BB |
    db $01,$00,$02,$03,$00,$E0,$15,$16;$CAC9C3 |
    db $EC,$A6,$03,$3B,$C6,$CA,$26,$D5;$CAC9CB |
    db $00,$27,$6C,$00,$19,$01,$FE,$7F;$CAC9D3 |
    db $19,$03,$00,$00,$19,$04,$00,$04;$CAC9DB |
    db $19,$05,$00,$00,$02,$0A,$19,$01;$CAC9E3 |
    db $FE,$FF,$40,$10,$02,$14,$19,$03;$CAC9EB |
    db $00,$FE,$02,$10,$19,$03,$00,$FD;$CAC9F3 |
    db $02,$0A,$19,$03,$00,$FC,$02,$10;$CAC9FB |
    db $19,$03,$00,$FB,$02,$0A,$00,$16;$CACA03 |
    db $EC,$A6,$03,$3B,$C6,$CA,$26,$27;$CACA0B |
    db $00,$27,$53,$00,$19,$01,$B6,$ED;$CACA13 |
    db $19,$03,$00,$00,$19,$04,$00,$04;$CACA1B |
    db $19,$05,$00,$00,$02,$0A,$19,$01;$CACA23 |
    db $B6,$6D,$40,$13,$0E,$EF,$C9,$16;$CACA2B |
    db $EC,$A6,$03,$3B,$C6,$CA,$26,$CE;$CACA33 |
    db $00,$27,$1E,$00,$19,$01,$6C,$5B;$CACA3B |
    db $19,$03,$00,$00,$19,$04,$00,$04;$CACA43 |
    db $19,$05,$00,$00,$02,$0A,$19,$01;$CACA4B |
    db $6C,$DB,$40,$12,$0E,$EF,$C9,$16;$CACA53 |
    db $EC,$A6,$03,$3B,$C6,$CA,$26,$8F;$CACA5B |
    db $00,$27,$F0,$FF,$19,$01,$DA,$36;$CACA63 |
    db $19,$03,$00,$00,$19,$04,$00,$04;$CACA6B |
    db $19,$05,$00,$00,$02,$0A,$19,$01;$CACA73 |
    db $DA,$B6,$40,$11,$0E,$EF,$C9,$16;$CACA7B |
    db $EC,$A6,$03,$3B,$C6,$CA,$26,$4B;$CACA83 |
    db $00,$27,$93,$00,$19,$01,$24,$C9;$CACA8B |
    db $19,$03,$00,$00,$19,$04,$00,$04;$CACA93 |
    db $19,$05,$00,$00,$02,$0A,$19,$01;$CACA9B |
    db $24,$49,$40,$14,$0E,$EF,$C9,$16;$CACAA3 |
    db $EC,$A6,$03,$3B,$C6,$CA,$26,$97;$CACAAB |
    db $00,$27,$A0,$00,$19,$01,$92,$A4;$CACAB3 |
    db $19,$03,$00,$00,$19,$04,$00,$04;$CACABB |
    db $19,$05,$00,$00,$02,$0A,$19,$01;$CACAC3 |
    db $92,$24,$40,$15,$0E,$EF,$C9,$16;$CACACB |
    db $EC,$A6,$03,$3B,$C6,$CA,$26,$44;$CACAD3 |
    db $00,$27,$07,$00,$19,$01,$48,$92;$CACADB |
    db $19,$03,$00,$00,$19,$04,$00,$FC;$CACAE3 |
    db $19,$05,$00,$00,$02,$0A,$19,$04;$CACAEB |
    db $00,$04,$40,$0F,$0E,$EF,$C9,$C0;$CACAF3 |
    db $65,$9B,$00,$02,$04,$19,$00,$D4;$CACAFB |
    db $00,$7D,$00,$24,$00,$00,$00,$00;$CACB03 |
    db $03,$60,$CC,$CA,$15,$04,$B0,$14;$CACB0B |
    db $FC,$96,$C7,$26,$D4,$00,$27,$7D;$CACB13 |
    db $00,$80,$B0,$FF,$90,$D0,$FF,$19;$CACB1B |
    db $08,$00,$00,$19,$09,$00,$00,$19;$CACB23 |
    db $09,$10,$00,$02,$01,$19,$09,$1C;$CACB2B |
    db $00,$02,$01,$19,$09,$12,$00,$02;$CACB33 |
    db $01,$19,$09,$20,$00,$02,$01,$19;$CACB3B |
    db $09,$13,$00,$E0,$39,$02,$14,$19;$CACB43 |
    db $09,$3E,$00,$02,$02,$19,$09,$11;$CACB4B |
    db $00,$02,$02,$19,$09,$00,$00,$02;$CACB53 |
    db $02,$19,$09,$1F,$00,$02,$02,$19;$CACB5B |
    db $09,$18,$00,$02,$02,$19,$09,$03;$CACB63 |
    db $00,$E0,$39,$02,$1E,$19,$09,$35;$CACB6B |
    db $00,$02,$02,$19,$09,$1E,$00,$02;$CACB73 |
    db $02,$19,$09,$0A,$00,$02,$02,$19;$CACB7B |
    db $09,$09,$00,$E0,$39,$02,$14,$19;$CACB83 |
    db $09,$18,$00,$02,$02,$19,$09,$10;$CACB8B |
    db $00,$02,$02,$19,$09,$00,$00,$02;$CACB93 |
    db $02,$19,$09,$30,$00,$02,$02,$19;$CACB9B |
    db $09,$05,$00,$02,$01,$19,$09,$12;$CACBA3 |
    db $00,$02,$01,$19,$09,$23,$00,$02;$CACBAB |
    db $01,$19,$09,$37,$00,$02,$02,$19;$CACBB3 |
    db $09,$34,$00,$02,$02,$19,$09,$2C;$CACBBB |
    db $00,$E0,$39,$02,$14,$19,$09,$0F;$CACBC3 |
    db $00,$02,$02,$19,$09,$31,$00,$02;$CACBCB |
    db $02,$19,$09,$3E,$00,$02,$02,$19;$CACBD3 |
    db $09,$1B,$00,$E0,$39,$02,$14,$19;$CACBDB |
    db $09,$2C,$00,$02,$08,$19,$09,$32;$CACBE3 |
    db $00,$02,$08,$19,$09,$38,$00,$02;$CACBEB |
    db $01,$19,$09,$33,$00,$02,$01,$19;$CACBF3 |
    db $09,$3A,$00,$02,$01,$19,$09,$06;$CACBFB |
    db $00,$02,$01,$19,$09,$3C,$00,$02;$CACC03 |
    db $01,$19,$09,$01,$00,$02,$01,$19;$CACC0B |
    db $09,$20,$00,$02,$08,$19,$09,$0A;$CACC13 |
    db $00,$02,$08,$19,$09,$1C,$00,$02;$CACC1B |
    db $08,$19,$09,$1E,$00,$02,$08,$19;$CACC23 |
    db $09,$21,$00,$02,$01,$19,$09,$15;$CACC2B |
    db $00,$02,$01,$19,$09,$30,$00,$02;$CACC33 |
    db $01,$19,$09,$14,$00,$E0,$39,$02;$CACC3B |
    db $38,$24,$02,$1A,$C1,$6C,$9C,$00;$CACC43 |
    db $8C,$CE,$CA,$C1,$EA,$9F,$00,$E0;$CACC4B |
    db $D1,$EE,$B0,$20,$00,$1B,$A0,$71;$CACC53 |
    db $01,$00,$02,$50,$00        ;$CACC5B |

    LDA.W Obj_VAR9,Y              ;$CACC60 |
    CMP.W Obj_VAR8,Y              ;$CACC63 |
    BEQ CODE_15CC74               ;$CACC66 |
    STA.W Obj_VAR8,Y              ;$CACC68 |
    ASL A                         ;$CACC6B |
    TAX                           ;$CACC6C |
    LDA.L DATA8_CACC75,X          ;$CACC6D |
    STA.W Obj_Pose,Y              ;$CACC71 |

CODE_15CC74:
    RTL                           ;$CACC74 |

    db $1C,$00,$1E,$00,$72,$00,$73,$00;$CACC75 |
    db $7C,$00,$7D,$00,$00,$00,$01,$00;$CACC7D |
    db $76,$00,$77,$00,$80,$00,$81,$00;$CACC85 |
    db $74,$00,$75,$00,$7E,$00,$7F,$00;$CACC8D |
    db $60,$00,$61,$00,$64,$00,$65,$00;$CACC95 |
    db $78,$00,$79,$00,$82,$00,$83,$00;$CACC9D |
    db $7A,$00,$7B,$00,$84,$00,$85,$00;$CACCA5 |
    db $68,$00,$69,$00,$4E,$00,$D4,$00;$CACCAD |
    db $D5,$00,$34,$00,$36,$00,$38,$00;$CACCB5 |
    db $39,$00,$3A,$00,$3B,$00,$3C,$00;$CACCBD |
    db $3D,$00,$06,$00,$07,$00,$54,$00;$CACCC5 |
    db $6E,$00,$6F,$00,$70,$00,$71,$00;$CACCCD |
    db $5A,$00,$5B,$00,$6C,$00,$6D,$00;$CACCD5 |
    db $08,$00,$09,$00,$5C,$00,$5E,$00;$CACCDD |
    db $AC,$00,$AD,$00,$AE,$00,$AF,$00;$CACCE5 |
    db $C4,$00,$C5,$00,$C8,$00,$C6,$00;$CACCED |
    db $C0,$2C,$CD,$CA,$00,$00,$19,$00;$CACCF5 |
    db $C0,$EF,$9B,$00,$C0,$4F,$CD,$CA;$CACCFD |
    db $0D,$78,$A7,$CA            ;$CACD05 |

    LDA.W Obj_VAR5,Y              ;$CACD09 |
    CLC                           ;$CACD0C |
    ADC.W Obj_VAR4,Y              ;$CACD0D |
    STA.W Obj_VAR4,Y              ;$CACD10 |
    LDA.W Obj_VAR3,Y              ;$CACD13 |
    CLC                           ;$CACD16 |
    ADC.W Obj_VAR1,Y              ;$CACD17 |
    STA.W Obj_VAR1,Y              ;$CACD1A |
    LDX.W Obj_VAR4,Y              ;$CACD1D |
    JSL.L CODE_FL_059CC6          ;$CACD20 |
    STA.W $6B6E,Y                 ;$CACD24 |
    TXA                           ;$CACD27 |
    STA.W $6BE8,Y                 ;$CACD28 |
    RTL                           ;$CACD2B |
    JSL.L AS_ReadWord_L           ;$CACD2C |
    TAX                           ;$CACD30 |
    JSL.L AS_ReadWord_L           ;$CACD31 |
    JML.L CODE_FL_01DE7A          ;$CACD35 |
    LDA.W Kirby_Ability           ;$CACD39 |
    STA.W Obj_VAR7,Y              ;$CACD3C |
    LDA.W $750B                   ;$CACD3F |
    STA.W Obj_VAR8,Y              ;$CACD42 |
    LDA.W #$0000                  ;$CACD45 |
    STA.W Kirby_Ability           ;$CACD48 |
    STZ.W $750B                   ;$CACD4B |
    RTL                           ;$CACD4E |
    LDA.W Obj_VAR7,Y              ;$CACD4F |
    STA.W Kirby_Ability           ;$CACD52 |
    LDA.W Obj_VAR8,Y              ;$CACD55 |
    STA.W $750B                   ;$CACD58 |
    RTL                           ;$CACD5B |

    db $18,$C6,$33,$11,$67,$CD,$02,$01;$CACD5C |
    db $0E,$5C,$CD,$0C,$C0,$EA,$9F,$00;$CACD64 |
    db $73,$CD,$CA,$00,$06,$00,$0C,$00;$CACD6C |
    db $00,$FF,$7F,$00,$00,$83,$00,$04;$CACD74 |
    db $75,$3E,$DF,$00,$66,$83,$00,$04;$CACD7C |
    db $C4,$C4,$E8,$00,$68,$83,$00,$04;$CACD84 |
    db $6A,$9C,$E8,$00,$6A,$83,$00,$08;$CACD8C |
    db $48,$59,$E6,$00,$7C,$83,$80,$1D;$CACD94 |
    db $20,$DD,$DE,$00,$00,$89,$00,$08;$CACD9C |
    db $63,$F8,$EE,$00,$48,$0F,$00,$08;$CACDA4 |
    db $00,$28,$7E,$00,$48,$89,$00,$04;$CACDAC |
    db $D0,$71,$E7,$00,$54,$0F,$00,$04;$CACDB4 |
    db $00,$24,$7E,$00,$54,$83,$40,$00;$CACDBC |
    db $07,$E7,$EF,$00,$40,$89,$00,$04;$CACDC4 |
    db $7A,$A0,$E9,$00,$50,$0F,$00,$04;$CACDCC |
    db $00,$24,$7E,$00,$50,$FF,$83,$00;$CACDD4 |
    db $08,$85,$EF,$E5,$00,$62,$83,$00;$CACDDC |
    db $08,$48,$59,$E6,$00,$7C,$83,$80;$CACDE4 |
    db $1D,$20,$DD,$DE,$00,$00,$89,$00;$CACDEC |
    db $08,$63,$F8,$EE,$00,$48,$0F,$00;$CACDF4 |
    db $08,$00,$28,$7E,$00,$48,$89,$00;$CACDFC |
    db $04,$D0,$71,$E7,$00,$54,$0F,$00;$CACE04 |
    db $04,$00,$24,$7E,$00,$54,$83,$40;$CACE0C |
    db $00,$07,$E7,$EF,$00,$40,$89,$00;$CACE14 |
    db $04,$7A,$A0,$E9,$00,$50,$0F,$00;$CACE1C |
    db $04,$00,$24,$7E,$00,$50,$FF,$83;$CACE24 |
    db $00,$09,$B8,$29,$E6,$00,$00,$89;$CACE2C |
    db $00,$08,$81,$EB,$ED,$00,$48,$0F;$CACE34 |
    db $00,$08,$00,$28,$7E,$00,$48,$83;$CACE3C |
    db $00,$04,$6A,$9C,$E8,$00,$6A,$83;$CACE44 |
    db $00,$08,$85,$EF,$E5,$00,$62,$83;$CACE4C |
    db $00,$04,$D1,$6B,$E8,$00,$66,$83;$CACE54 |
    db $00,$08,$48,$59,$E6,$00,$7C,$89;$CACE5C |
    db $00,$04,$D0,$71,$E7,$00,$54,$0F;$CACE64 |
    db $00,$04,$00,$24,$7E,$00,$54,$83;$CACE6C |
    db $40,$00,$07,$E7,$EF,$00,$40,$89;$CACE74 |
    db $00,$04,$7A,$A0,$E9,$00,$50,$0F;$CACE7C |
    db $00,$04,$00,$24,$7E,$00,$50,$FF;$CACE84 |
    db $83,$00,$04,$D1,$6B,$E8,$00,$66;$CACE8C |
    db $83,$00,$04,$6A,$9C,$E8,$00,$6A;$CACE94 |
    db $FF                        ;$CACE9C |

    LDA.W #$CEA8                  ;$CACE9D |
    LDX.W #$00CA                  ;$CACEA0 |
    JSL.L SA1_ExecuteSNES         ;$CACEA3 |
    RTL                           ;$CACEA7 |
    PEA.W $007E                   ;$CACEA8 |
    PLB                           ;$CACEAB |
    LDA.W #$00CB                  ;$CACEAC |
    LDX.W #$7944                  ;$CACEAF |
    LDY.W #$2E00                  ;$CACEB2 |
    JSL.L DecompressData          ;$CACEB5 |
    PLB                           ;$CACEB9 |
    LDA.W #$CEED                  ;$CACEBA |
    LDX.W #$00CA                  ;$CACEBD |
    JSL.L LoadDMATable            ;$CACEC0 |
    LDA.W #$CEF6                  ;$CACEC4 |
    LDX.W #$00CA                  ;$CACEC7 |
    JSL.L LoadDMATable            ;$CACECA |
    LDA.W #$CEFF                  ;$CACECE |
    LDX.W #$00CA                  ;$CACED1 |
    JSL.L LoadDMATable            ;$CACED4 |
    LDA.W #$CF08                  ;$CACED8 |
    LDX.W #$00CA                  ;$CACEDB |
    JSL.L LoadDMATable            ;$CACEDE |
    LDA.W #$CF11                  ;$CACEE2 |
    LDX.W #$00CA                  ;$CACEE5 |
    JSL.L CODE_FL_D3E412          ;$CACEE8 |
    RTL                           ;$CACEEC |

    db $03,$00,$08,$00,$2E,$7E,$00,$66;$CACEED |
    db $FF,$03,$00,$08,$00,$36,$7E,$00;$CACEF5 |
    db $6A,$FF,$03,$00,$08,$00,$3E,$7E;$CACEFD |
    db $00,$6E,$FF,$03,$00,$08,$00,$46;$CACF05 |
    db $7E,$00,$72,$FF,$8B,$FC,$D5,$50;$CACF0D |
    db $B0,$FF,$FF,$26,$1A,$BD,$77,$F7;$CACF15 |
    db $66,$31,$4E,$CE,$41,$6B,$35,$BD;$CACF1D |
    db $53,$BD,$3B,$BD,$03,$BA,$12,$D4;$CACF25 |
    db $11,$52,$11,$EF,$11,$8D,$72,$BD;$CACF2D |
    db $2D,$08,$21,$05,$16,$7B,$6F,$D6;$CACF35 |
    db $62,$10,$4A,$AD,$3D,$6B,$31,$7B;$CACF3D |
    db $4B,$7B,$37,$7B,$03,$79,$12,$B2;$CACF45 |
    db $11,$51,$11,$CE,$11,$4C,$6A,$9B;$CACF4D |
    db $2D,$08,$21,$E5,$15,$39,$67,$94;$CACF55 |
    db $5A,$EF,$41,$8C,$39,$4A,$2D,$39;$CACF5D |
    db $47,$39,$33,$39,$03,$57,$0E,$91;$CACF65 |
    db $0D,$2F,$0D,$AD,$0D,$2B,$62,$79;$CACF6D |
    db $29,$E7,$1C,$C5,$15,$F7,$5E,$73;$CACF75 |
    db $52,$CE,$3D,$6B,$35,$29,$2D,$F7;$CACF7D |
    db $42,$F7,$2E,$F7,$02,$35,$0E,$70;$CACF85 |
    db $0D,$0E,$0D,$8C,$0D,$0B,$5E,$77;$CACF8D |
    db $25,$E7,$1C,$84,$11,$B5,$56,$31;$CACF95 |
    db $4E,$8C,$39,$4A,$31,$08,$29,$B5;$CACF9D |
    db $3A,$B5,$2A,$B5,$02,$F3,$0D,$4E;$CACFA5 |
    db $0D,$0D,$0D,$6B,$0D,$CA,$55,$55;$CACFAD |
    db $21,$C6,$18,$64,$11,$73,$4E,$10;$CACFB5 |
    db $46,$6B,$35,$29,$2D,$08,$25,$73;$CACFBD |
    db $36,$73,$26,$73,$02,$D2,$0D,$2D;$CACFC5 |
    db $0D,$EC,$0C,$4A,$0D,$A9,$4D,$33;$CACFCD |
    db $21,$C6,$18,$43,$0D,$31,$46,$CE;$CACFD5 |
    db $3D,$4A,$2D,$08,$29,$E7,$20,$31;$CACFDD |
    db $32,$31,$22,$31,$02,$90,$09,$0C;$CACFE5 |
    db $09,$CB,$08,$29,$09,$88,$45,$11;$CACFED |
    db $1D,$A5,$14,$23,$0D,$10,$42,$AD;$CACFF5 |
    db $39,$29,$29,$08,$25,$C6,$1C,$10;$CACFFD |
    db $2E,$10,$22,$10,$02,$6E,$09,$0B;$CAD005 |
    db $09,$CA,$08,$08,$09,$67,$3D,$F0;$CAD00D |
    db $18,$A5,$14,$03,$0D,$CE,$39,$6B;$CAD015 |
    db $31,$08,$25,$E7,$1C,$A5,$18,$CE;$CAD01D |
    db $25,$CE,$1D,$CE,$01,$4C,$09,$E9;$CAD025 |
    db $08,$A8,$08,$E7,$08,$26,$35,$CE;$CAD02D |
    db $14,$84,$10,$E2,$08,$8C,$31,$29;$CAD035 |
    db $29,$E7,$20,$C6,$18,$A5,$14,$8C;$CAD03D |
    db $21,$8C,$19,$8C,$01,$0B,$09,$C8;$CAD045 |
    db $08,$87,$08,$C6,$08,$05,$2D,$AC;$CAD04D |
    db $14,$63,$0C,$C2,$08,$4A,$29,$08;$CAD055 |
    db $21,$C6,$18,$A5,$14,$84,$10,$4A;$CAD05D |
    db $1D,$4A,$15,$4A,$01,$E9,$04,$A7;$CAD065 |
    db $04,$66,$04,$A5,$04,$E4,$24,$8A;$CAD06D |
    db $10,$63,$0C,$A2,$08,$08,$21,$C6;$CAD075 |
    db $1C,$A5,$14,$84,$10,$63,$10,$08;$CAD07D |
    db $15,$08,$11,$08,$01,$C7,$04,$85;$CAD085 |
    db $04,$65,$04,$84,$04,$A4,$20,$88;$CAD08D |
    db $0C,$42,$08,$61,$04,$C6,$18,$A5;$CAD095 |
    db $14,$63,$10,$63,$0C,$42,$0C,$C6;$CAD09D |
    db $10,$C6,$0C,$C6,$00,$85,$04,$64;$CAD0A5 |
    db $04,$44,$04,$63,$04,$83,$18,$66;$CAD0AD |
    db $08,$42,$08,$41,$04,$84,$10,$63;$CAD0B5 |
    db $0C,$42,$0C,$42,$08,$42,$08,$84;$CAD0BD |
    db $0C,$84,$08,$84,$00,$64,$04,$43;$CAD0C5 |
    db $04,$22,$04,$42,$04,$62,$10,$44;$CAD0CD |
    db $08,$21,$04,$20,$00,$42,$08,$42;$CAD0D5 |
    db $08,$21,$04,$21,$04,$21,$04,$42;$CAD0DD |
    db $04,$42,$04,$42,$00,$22,$00,$21;$CAD0E5 |
    db $00,$21,$00,$21,$00,$21,$08,$22;$CAD0ED |
    db $04,$21,$04,$00,$00,$00,$00,$00;$CAD0F5 |
    db $00,$00,$00,$00,$00,$00,$00,$00;$CAD0FD |
    db $00,$00,$00,$00,$00,$00,$00,$00;$CAD105 |
    db $00,$00,$00,$00,$00,$00,$00,$00;$CAD10D |
    db $00,$00,$00                ;$CAD115 |

    LDA.W #$0032                  ;$CAD118 |
    STA.W $7493                   ;$CAD11B |
    LDA.W #$0032                  ;$CAD11E |
    STA.W $7495                   ;$CAD121 |
    INC.W $7ADF                   ;$CAD124 |
    STZ.W $7366                   ;$CAD127 |
    STZ.W Shooting_State        ;$CAD12A |
    LDY.B $39                     ;$CAD12D |
    LDA.W #$0000                  ;$CAD12F |
    JSL.L PlayMusic               ;$CAD132 |
    LDY.B $39                     ;$CAD136 |
    LDA.W #$0000                  ;$CAD138 |
    JSL.L PlaySFX                 ;$CAD13B |
    LDY.B $39                     ;$CAD13F |
    LDA.W #$DA4D                  ;$CAD141 |
    LDX.W #$00EF                  ;$CAD144 |
    LDY.W #$C010                  ;$CAD147 |
    JSL.L WritePal                ;$CAD14A |
    LDA.W #$9F92                  ;$CAD14E |
    LDX.W #$00EF                  ;$CAD151 |
    LDY.W #$E020                  ;$CAD154 |
    JSL.L WritePal                ;$CAD157 |
    LDA.W #$C6B9                  ;$CAD15B |
    LDX.W #$00E9                  ;$CAD15E |
    LDY.W #$3010                  ;$CAD161 |
    JSL.L WritePal                ;$CAD164 |
    LDA.W #$0002                  ;$CAD168 |
    LDX.W #$0000                  ;$CAD16B |
    LDY.W #$0000                  ;$CAD16E |
    JSL.L CODE_FL_CAD629          ;$CAD171 |
    LDY.B $39                     ;$CAD175 |
    JML.L DestroyUsedObject       ;$CAD177 |

    db $15,$72,$AB,$16,$FB,$A6,$14,$DA;$CAD17B |
    db $8C,$CC,$33,$40,$00,$24,$21,$00;$CAD183 |
    db $0F,$0D,$A7,$D1,$34,$D3,$8E,$D3;$CAD18B |
    db $4D,$D4,$86,$D4,$9C,$D4,$B2,$D4;$CAD193 |
    db $C8,$D4,$DE,$D4,$F4,$D4,$0A,$D5;$CAD19B |
    db $2E,$D4,$23,$D5,$C0,$1D,$D6,$03;$CAD1A3 |
    db $C0,$2A,$D3,$CA,$1B,$75,$76,$00;$CAD1AB |
    db $00,$15,$72,$AB,$16,$FB,$A6,$14;$CAD1B3 |
    db $DA,$8C,$CC,$33,$40,$00,$03,$10;$CAD1BB |
    db $8E,$02,$26,$A0,$00,$27,$38,$00;$CAD1C3 |
    db $24,$40,$FF,$02,$10,$02,$96,$40;$CAD1CB |
    db $04,$80,$B0,$00,$90,$50,$FF,$02;$CAD1D3 |
    db $23,$02,$6D,$C0,$1B,$D6,$CA,$15;$CAD1DB |
    db $04,$B0,$14,$FC,$96,$C7,$02,$50;$CAD1E3 |
    db $26,$A8,$00,$27,$F0,$FF,$E0,$52;$CAD1EB |
    db $33,$80,$00,$C0,$6A,$D6,$CA,$C0;$CAD1F3 |
    db $65,$9B,$00,$18,$40,$1A,$00,$00;$CAD1FB |
    db $00,$00,$00,$0C,$00,$00,$00,$80;$CAD203 |
    db $80,$FD,$A0,$14,$00,$90,$00,$06;$CAD20B |
    db $B0,$E8,$FF,$02,$20,$1B,$42,$73;$CAD213 |
    db $00,$03,$1B,$52,$73,$00,$00,$C0;$CAD21B |
    db $65,$9B,$00,$18,$40,$1A,$00,$00;$CAD223 |
    db $00,$00,$00,$0B,$00,$00,$00,$80;$CAD22B |
    db $00,$00,$A8,$00,$00,$80,$E0,$FF;$CAD233 |
    db $90,$C0,$FE,$B0,$0A,$00,$02,$20;$CAD23B |
    db $98,$00,$00,$B8,$F6,$FF,$1B,$42;$CAD243 |
    db $73,$00,$00,$B0,$F1,$FF,$02,$10;$CAD24B |
    db $05,$02,$80,$E0,$FF,$90,$C0,$FE;$CAD253 |
    db $B0,$0A,$00,$02,$20,$98,$00,$00;$CAD25B |
    db $B8,$F6,$FF,$1B,$42,$73,$00,$00;$CAD263 |
    db $B0,$F1,$FF,$02,$10,$07,$C0,$EA;$CAD26B |
    db $9F,$00,$A0,$87,$ED,$00,$A0,$00;$CAD273 |
    db $80,$E0,$FF,$90,$C0,$FE,$B0,$0A;$CAD27B |
    db $00,$02,$20,$1B,$42,$73,$B8,$02;$CAD283 |
    db $80,$80,$FF,$A0,$02,$00,$90,$00;$CAD28B |
    db $02,$B0,$00,$00,$02,$32,$1B,$42;$CAD293 |
    db $73,$00,$00,$1B,$3D,$30,$00,$00;$CAD29B |
    db $F0,$2D,$E0,$40,$C0,$77,$D6,$CA;$CAD2A3 |
    db $C0,$F1,$A3,$00,$B8,$00,$00,$00;$CAD2AB |
    db $C0,$F1,$A3,$00,$B8,$00,$01,$00;$CAD2B3 |
    db $C0,$F1,$A3,$00,$B8,$00,$02,$00;$CAD2BB |
    db $C0,$F1,$A3,$00,$B8,$00,$03,$00;$CAD2C3 |
    db $80,$80,$FF,$A0,$00,$00,$90,$00;$CAD2CB |
    db $FD,$B0,$20,$00,$40,$1C,$02,$14;$CAD2D3 |
    db $44,$6E,$44,$70,$44,$6C,$40,$1E;$CAD2DB |
    db $02,$10,$24,$48,$4E,$C0,$E3,$9A;$CAD2E3 |
    db $05,$03,$87,$FB,$D0,$C0,$FF,$D2;$CAD2EB |
    db $CA,$1B,$DF,$7A,$00,$00,$1B,$AA;$CAD2F3 |
    db $77,$01,$00,$01            ;$CAD2FB |
    LDX.W #$0002                  ;$CAD2FF |
    LDA.W #$80AE                  ;$CAD302 |
    STA.W Obj_VAR3,X              ;$CAD305 |
    LDA.W #$9819                  ;$CAD308 |
    STA.W Obj_TickCallbackAddr,X  ;$CAD30B |
    LDA.W #$00D0                  ;$CAD30E |
    STA.W Obj_TickCallbackBank,X  ;$CAD311 |
    LDX.W #$0004                  ;$CAD314 |
    LDA.W #$0000                  ;$CAD317 |
    STA.W Obj_VAR3,X              ;$CAD31A |
    LDA.W #$98A5                  ;$CAD31D |
    STA.W Obj_TickCallbackAddr,X  ;$CAD320 |
    LDA.W #$00D0                  ;$CAD323 |
    STA.W Obj_TickCallbackBank,X  ;$CAD326 |
    RTL                           ;$CAD329 |
    LDY.W #$0002                  ;$CAD32A |
    LDX.W #$001A                  ;$CAD32D |
    JML.L CODE_FL_05AC9C          ;$CAD330 |
    db $C0,$1D,$D6,$03,$C0,$84,$D3,$CA;$CAD334 |
    db $03,$76,$D3,$CA,$16,$EC,$A6,$33;$CAD33C |
    db $40,$00,$02,$FA,$03,$41,$D5,$CA;$CAD344 |

    db $02,$C8,$02,$FE,$16,$FB,$A6,$03;$CAD34C |
    db $AF,$83,$04,$80,$00,$FF,$A0,$00;$CAD354 |
    db $00,$90,$00,$FD,$B0,$20,$00,$05;$CAD35C |
    db $02,$46,$40,$46,$42,$46,$44,$46;$CAD364 |
    db $46,$07,$24,$48,$36,$03,$EE,$FB;$CAD36C |
    db $D0,$01,$A9,$FF,$FF,$8D,$3A,$64;$CAD374 |
    db $22,$08,$D6,$CA,$5C,$AF,$83,$04;$CAD37C |
    db $A0,$04,$00,$A9,$DB,$AD,$5C,$D0;$CAD384 |
    db $AB,$05,$15,$72,$AB,$26,$80,$00;$CAD38C |
    db $27,$60,$00,$33,$20,$00,$40,$00;$CAD394 |
    db $02,$3C,$E0,$05,$C0,$65,$9B,$00;$CAD39C |
    db $18,$40,$1A,$00,$00,$00,$00,$00;$CAD3A4 |
    db $03,$00,$00,$00,$C0,$65,$9B,$00;$CAD3AC |
    db $18,$40,$1A,$00,$00,$00,$00,$00;$CAD3B4 |
    db $04,$00,$00,$00,$C0,$65,$9B,$00;$CAD3BC |
    db $18,$40,$1A,$00,$00,$00,$00,$00;$CAD3C4 |
    db $05,$00,$00,$00,$C0,$65,$9B,$00;$CAD3CC |
    db $18,$40,$1A,$00,$00,$00,$00,$00;$CAD3D4 |
    db $06,$00,$00,$00,$C0,$65,$9B,$00;$CAD3DC |
    db $18,$40,$1A,$00,$00,$00,$00,$00;$CAD3E4 |
    db $07,$00,$00,$00,$C0,$65,$9B,$00;$CAD3EC |
    db $18,$40,$1A,$00,$00,$00,$00,$00;$CAD3F4 |
    db $08,$00,$00,$00,$C0,$65,$9B,$00;$CAD3FC |
    db $18,$40,$1A,$00,$00,$00,$00,$00;$CAD404 |
    db $09,$00,$00,$00,$C0,$65,$9B,$00;$CAD40C |
    db $18,$40,$1A,$00,$00,$00,$00,$00;$CAD414 |
    db $0A,$00,$00,$00,$02,$01,$40,$03;$CAD41C |
    db $02,$FA,$02,$70,$90,$00,$FD,$02;$CAD424 |
    db $20,$00,$16,$EC,$A6,$03,$46,$D4;$CAD42C |
    db $CA,$B0,$E0,$FF,$02,$64,$B0,$00;$CAD434 |
    db $00,$02,$72,$B0,$20,$00,$02,$64;$CAD43C |
    db $24,$00                    ;$CAD444 |
    LDX.W #$0002                  ;$CAD446 |
    JML.L CODE_FL_00A91D          ;$CAD449 |
    db $26,$90,$00,$27,$3A,$00,$19,$01;$CAD44D |
    db $00,$00,$0A,$63,$D4,$05,$0A,$44;$CAD455 |
    db $05,$0A,$7A,$D4,$07,$00,$16,$EC;$CAD45D |
    db $A6,$03,$3B,$C6,$CA,$33,$60,$00;$CAD465 |
    db $19,$03,$00,$00,$19,$04,$C0,$00;$CAD46D |
    db $19,$05,$FE,$FF,$0C,$64,$64,$64;$CAD475 |
    db $19,$05,$00,$00,$64,$64,$64,$64;$CAD47D |
    db $0C,$26,$81,$00,$27,$40,$00,$19;$CAD485 |
    db $01,$00,$C0,$0A,$63,$D4,$05,$0A;$CAD48D |
    db $44,$0D,$0A,$7A,$D4,$07,$00,$26;$CAD495 |
    db $A0,$00,$27,$47,$00,$19,$01,$00;$CAD49D |
    db $20,$0A,$63,$D4,$05,$0A,$44,$15;$CAD4A5 |
    db $0A,$7A,$D4,$07,$00,$26,$9F,$00;$CAD4AD |
    db $27,$52,$00,$19,$01,$00,$40,$0A;$CAD4B5 |
    db $63,$D4,$05,$0A,$44,$1D,$0A,$7A;$CAD4BD |
    db $D4,$07,$00,$26,$94,$00,$27,$4E;$CAD4C5 |
    db $00,$19,$01,$00,$80,$0A,$63,$D4;$CAD4CD |
    db $05,$0A,$44,$25,$0A,$7A,$D4,$07;$CAD4D5 |
    db $00,$26,$8E,$00,$27,$4E,$00,$19;$CAD4DD |
    db $01,$00,$E0,$0A,$63,$D4,$05,$0A;$CAD4E5 |
    db $44,$2D,$0A,$7A,$D4,$07,$00,$26;$CAD4ED |
    db $84,$00,$27,$50,$00,$19,$01,$00;$CAD4F5 |
    db $A0,$0A,$63,$D4,$05,$0A,$44,$35;$CAD4FD |
    db $0A,$7A,$D4,$07,$00,$33,$22,$00;$CAD505 |
    db $26,$94,$00,$27,$44,$00,$19,$01;$CAD50D |
    db $00,$60,$0A,$63,$D4,$05,$0A,$44;$CAD515 |
    db $3D,$0A,$7A,$D4,$07,$00,$03,$3D;$CAD51D |
    db $D5,$CA,$05,$06,$C0,$55,$A5,$00;$CAD525 |
    db $06,$40,$0D,$00,$00,$00,$00,$00;$CAD52D |
    db $58,$00,$00,$00,$02,$30,$07,$00;$CAD535 |
    JML.L CODE_FL_D034E4          ;$CAD53D |
    LDA.W $6240                   ;$CAD541 |
    BMI CODE_15D587               ;$CAD544 |
    LDA.W Helper_Ability          ;$CAD546 |
    ASL A                         ;$CAD549 |
    TAX                           ;$CAD54A |
    LDA.L DATA16_CAD5B8,X         ;$CAD54B |
    CLC                           ;$CAD54F |
    ADC.W $64B8                   ;$CAD550 |
    STA.W $64BA                   ;$CAD553 |
    LDA.W Helper_Ability          ;$CAD556 |
    CMP.W #$000C                  ;$CAD559 |
    BEQ CODE_15D566               ;$CAD55C |
    ASL A                         ;$CAD55E |
    TAX                           ;$CAD55F |
    LDA.L DATA16_CAD588,X         ;$CAD560 |
    BRA CODE_15D572               ;$CAD564 |


CODE_15D566:
    LDA.W $3094                   ;$CAD566 |
    AND.W #$000C                  ;$CAD569 |
    LSR A                         ;$CAD56C |
    TAX                           ;$CAD56D |
    LDA.L DATA16_CAD5B0,X         ;$CAD56E |

CODE_15D572:
    STA.W $643A                   ;$CAD572 |
    JSL.L CODE_FL_CAD608          ;$CAD575 |
    LDA.L DATA16_CAD5E0,X         ;$CAD579 |
    CLC                           ;$CAD57D |
    ADC.W $6910                   ;$CAD57E |
    STA.W $6910                   ;$CAD581 |
    STA.W $6A04                   ;$CAD584 |

CODE_15D587:
    RTL                           ;$CAD587 |

DATA16_CAD588:
    dw $0000,$0072,$0072,$008E    ;$CAD588 |
    dw $0072,$0072,$0072,$0072    ;$CAD590 |
    dw $0076,$0072,$0076,$0072    ;$CAD598 |
    dw $0078,$0076,$0072,$0072    ;$CAD5A0 |
    dw $0078,$0076,$0070,$0072    ;$CAD5A8 |

DATA16_CAD5B0:
    dw $0078,$007A,$007C,$007E    ;$CAD5B0 |

DATA16_CAD5B8:
    dw $0000,$FFFE,$FFFE,$FFFE    ;$CAD5B8 |
    dw $0002,$FFFE,$0002,$FFFE    ;$CAD5C0 |
    dw $0002,$FFFE,$FFFE,$0002    ;$CAD5C8 |
    dw $FFFE,$FFFE,$FFFE,$FFFE    ;$CAD5D0 |
    dw $FFFE,$0002,$0002,$FFFE    ;$CAD5D8 |

DATA16_CAD5E0:
    dw $0000,$0000,$0000,$0000    ;$CAD5E0 |
    dw $0000,$0000,$0000,$0000    ;$CAD5E8 |
    dw $0000,$0005,$0000,$0000    ;$CAD5F0 |
    dw $0000,$0000,$0004,$0000    ;$CAD5F8 |
    dw $0000,$0000,$0000,$0000    ;$CAD600 |

CODE_FL_CAD608:
    LDA.W $6894                   ;$CAD608 |
    STA.W $6896                   ;$CAD60B |
    STA.W $698A                   ;$CAD60E |
    LDA.W $690E                   ;$CAD611 |
    STA.W $6910                   ;$CAD614 |
    STA.W $6A04                   ;$CAD617 |
    RTL                           ;$CAD61A |

    LDA.W #$0132                  ;$CAD61B |
    LDX.W $6240                   ;$CAD61E |
    BMI CODE_15D625               ;$CAD621 |
    INC A                         ;$CAD623 |
    INC A                         ;$CAD624 |

CODE_15D625:
    STA.W $6438                   ;$CAD625 |
    RTL                           ;$CAD628 |
    PHY                           ;$CAD629 |
    LDY.B $39                     ;$CAD62A |
    STA.W ObjVar0_Temp            ;$CAD62C |
    LDA.W Obj_VAR1,Y              ;$CAD62F |
    STA.W ObjVar1_Temp            ;$CAD632 |
    STY.W ObjVar2_Temp            ;$CAD635 |
    STZ.W ObjVar3_Temp            ;$CAD638 |
    STZ.W ObjVar4_Temp            ;$CAD63B |
    LDA.W #$0018                  ;$CAD63E |
    STA.W ObjSlotMinimum          ;$CAD641 |
    LDA.W #$0040                  ;$CAD644 |
    STA.W ObjSlotMaximum          ;$CAD647 |
    TXA                           ;$CAD64A |
    CLC                           ;$CAD64B |
    ADC.W Obj_XPositionMirror,Y   ;$CAD64C |
    TAX                           ;$CAD64F |
    PLA                           ;$CAD650 |
    CLC                           ;$CAD651 |
    ADC.W Obj_YPositionMirror,Y   ;$CAD652 |
    TAY                           ;$CAD655 |
    LDA.W #$001A                  ;$CAD656 |
    AND.W #$7FFF                  ;$CAD659 |
    JML.L CreateNewObject         ;$CAD65C |

    db $A2                        ;$CAD660 |
    ORA.B (IdentifySNES,X)        ;$CAD661 |
    LDA.W #$8479                  ;$CAD663 |
    JML.L LoadDMATable            ;$CAD666 |

    LDA.W $64BA                   ;$CAD66A |
    STA.W Obj_VAR1,Y              ;$CAD66D |
    LDA.W #$0080                  ;$CAD670 |
    STA.W $64BA                   ;$CAD673 |
    RTL                           ;$CAD676 |
    LDA.W Obj_VAR1,Y              ;$CAD677 |
    STA.W $64BA                   ;$CAD67A |
    RTL                           ;$CAD67D |
    LDA.W #$D696                  ;$CAD67E |
    LDX.W #$00CA                  ;$CAD681 |
    JSL.L LoadDMATable            ;$CAD684 |
    LDA.W #$87A0                  ;$CAD688 |
    LDX.W #$00ED                  ;$CAD68B |
    LDY.W #$0050                  ;$CAD68E |
    JSL.L WritePal                ;$CAD691 |
    RTL                           ;$CAD695 |
    db $83,$00,$04,$75,$3E,$DF,$00,$66;$CAD696 |
    db $83,$80,$10,$4D,$DF,$E2,$00,$68;$CAD69E |
    db $83,$80,$1D,$20,$DD,$DE,$00,$00;$CAD6A6 |
    db $83,$80,$1D,$27,$D4,$E3,$00,$10;$CAD6AE |
    db $89,$00,$08,$63,$F8,$EE,$00,$48;$CAD6B6 |
    db $0F,$00,$08,$00,$28,$7E,$00,$48;$CAD6BE |
    db $89,$00,$04,$D0,$71,$E7,$00,$50;$CAD6C6 |
    db $0F,$00,$04,$00,$24,$7E,$00,$50;$CAD6CE |
    db $83,$C0,$02,$24,$6B,$EA,$60,$49;$CAD6D6 |
    db $FF,$C0,$EF,$D9,$CA,$C0,$71,$D9;$CAD6DE |
    db $CA,$1B,$26,$60,$59,$A9,$C0,$BE;$CAD6E6 |
    db $84,$00,$16,$FB,$A6,$15,$72,$AB;$CAD6EE |
    db $04,$14,$67,$95,$CC,$33,$60,$00;$CAD6F6 |
    db $40,$FF,$C0,$94,$9C,$00,$09,$C0;$CAD6FE |
    db $BB,$9C,$00,$00,$00,$60,$00,$C0;$CAD706 |
    db $EA,$9F,$00,$F7,$ED,$E9,$00,$00;$CAD70E |
    db $02,$C0,$9A,$9C,$00,$00,$02,$00;$CAD716 |
    db $00,$00,$48,$C0,$CE,$9C,$00,$11;$CAD71E |
    db $C0,$85,$9F,$00,$00,$C0,$6C,$9C;$CAD726 |
    db $00,$82,$DC,$CA,$24,$C0,$10,$9D;$CAD72E |
    db $00,$00,$00,$00,$00,$1B,$92,$68;$CAD736 |
    db $00,$00,$1B,$0C,$69,$00,$00,$05;$CAD73E |
    db $10,$C1,$CD,$9F,$00,$07,$F0,$0E;$CAD746 |
    db $03,$0A,$DA,$CA,$02,$F0,$F0,$00;$CAD74E |
    db $C0,$94,$D9,$CA,$C0,$6C,$9C,$00;$CAD756 |
    db $AB,$DC,$CA,$C0,$BC,$9B,$00,$00;$CAD75E |
    db $00,$00,$00,$02,$0F,$00,$00,$00;$CAD766 |
    db $00,$00,$0C,$00,$00,$00,$26,$2E;$CAD76E |
    db $00,$27,$3B,$00,$40,$00,$03,$48;$CAD776 |
    db $DA,$CA,$01,$E0,$46,$04,$90,$80;$CAD77E |
    db $FB,$B0,$48,$00,$02,$10,$24,$03;$CAD786 |
    db $48,$DA,$CA,$01,$E0,$46,$04,$90;$CAD78E |
    db $80,$04,$B0,$B8,$FF,$02,$10,$24;$CAD796 |
    db $03,$1F,$DA,$CA,$01,$E0,$32,$04;$CAD79E |
    db $4A,$01,$40,$00,$80,$E0,$FC,$90;$CAD7A6 |
    db $E0,$FD,$A0,$30,$00,$B0,$50,$00;$CAD7AE |
    db $02,$18,$BC,$BC,$FF,$40,$19,$AC;$CAD7B6 |
    db $D4,$FF,$A0,$00,$00,$B0,$00,$00;$CAD7BE |
    db $02,$18,$80,$00,$00,$90,$80,$FF;$CAD7C6 |
    db $02,$3C,$C0,$BC,$9B,$00,$00,$00;$CAD7CE |
    db $00,$00,$04,$0F,$00,$00,$00,$00;$CAD7D6 |
    db $00,$0C,$00,$03,$00,$03,$71,$DA;$CAD7DE |
    db $CA,$24,$26,$80,$00,$27,$80,$00;$CAD7E6 |
    db $40,$18,$B0,$05,$00,$02,$40,$B0;$CAD7EE |
    db $F4,$FF,$02,$40,$B0,$10,$00,$02;$CAD7F6 |
    db $14,$03,$7F,$DA,$CA,$C0,$AE,$D9;$CAD7FE |
    db $CA,$24,$02,$14,$40,$19,$90,$00;$CAD806 |
    db $04,$A0,$A0,$FF,$B0,$C0,$FF,$02;$CAD80E |
    db $10,$A0,$60,$00,$02,$10,$40,$02;$CAD816 |
    db $B0,$40,$00,$02,$10,$24,$02,$1A;$CAD81E |
    db $40,$13,$90,$00,$02,$B8,$20,$00;$CAD826 |
    db $40,$14,$90,$00,$FE,$B8,$E0,$FF;$CAD82E |
    db $24,$40,$15,$02,$14,$80,$60,$00;$CAD836 |
    db $90,$40,$00,$02,$40,$40,$16,$90;$CAD83E |
    db $00,$00,$02,$14,$4A,$17,$C0,$BC;$CAD846 |
    db $9B,$00,$00,$00,$00,$00,$06,$0F;$CAD84E |
    db $00,$00,$00,$00,$00,$0C,$00,$01;$CAD856 |
    db $00,$40,$02,$90,$00,$FF,$02,$28;$CAD85E |
    db $40,$11,$90,$00,$01,$A0,$F8,$FF;$CAD866 |
    db $B0,$F8,$FF,$01,$E0,$32,$C0,$D4;$CAD86E |
    db $D9,$CA,$03,$A7,$DA,$CA,$4A,$01;$CAD876 |
    db $40,$00,$80,$E0,$FC,$90,$E0,$FD;$CAD87E |
    db $A0,$30,$00,$B0,$50,$00,$02,$18;$CAD886 |
    db $BC,$A0,$FF,$AC,$D0,$FF,$40,$11;$CAD88E |
    db $80,$40,$03,$90,$00,$FF,$A0,$E0;$CAD896 |
    db $FF,$B0,$0C,$00,$02,$18,$24,$94;$CAD89E |
    db $80,$00,$C0,$BC,$D9,$CA,$40,$03;$CAD8A6 |
    db $90,$00,$FC,$B0,$40,$00,$02,$10;$CAD8AE |
    db $80,$00,$FD,$90,$00,$03,$A0,$20;$CAD8B6 |
    db $00,$B0,$F0,$FF,$02,$18,$40,$09;$CAD8BE |
    db $80,$00,$00,$90,$00,$FE,$A0,$00;$CAD8C6 |
    db $00,$B2,$30,$00,$42,$08,$42,$07;$CAD8CE |
    db $40,$04,$90,$00,$FE,$02,$10,$E0;$CAD8D6 |
    db $0B,$C0,$BC,$9B,$00,$00,$00,$00;$CAD8DE |
    db $00,$08,$0F,$00,$00,$00,$00,$00;$CAD8E6 |
    db $0C,$00,$02,$00,$C0,$BC,$9B,$00;$CAD8EE |
    db $00,$00,$00,$00,$04,$0F,$00,$00;$CAD8F6 |
    db $00,$00,$00,$0C,$00,$04,$00,$40;$CAD8FE |
    db $06,$80,$00,$FA,$90,$00,$06,$A0;$CAD906 |
    db $00,$00,$B4,$00,$00,$80,$00,$06;$CAD90E |
    db $92,$00,$FA,$24,$02,$1E,$40,$11;$CAD916 |
    db $80,$00,$05,$AA,$A0,$FF,$40,$00;$CAD91E |
    db $A0,$00,$00,$05,$02,$82,$00,$02;$CAD926 |
    db $82,$00,$FE,$07,$24,$02,$1E,$05;$CAD92E |
    db $04,$40,$07,$90,$00,$02,$B6,$D0;$CAD936 |
    db $FF,$43,$08,$43,$09,$40,$0A,$90;$CAD93E |
    db $00,$FE,$B6,$30,$00,$43,$09,$43;$CAD946 |
    db $08,$07,$24,$05,$10,$C1,$DD,$9F;$CAD94E |
    db $00,$07,$C0,$A6,$DB,$CA,$C0,$EF;$CAD956 |
    db $9B,$00,$F0,$00,$1B,$26,$60,$6A;$CAD95E |
    db $A9,$C0,$7D,$D9,$CA,$1B,$92,$73;$CAD966 |
    db $01,$00,$01                ;$CAD96E |
    LDA.W Shooting_State        ;$CAD971 |
    BEQ CODE_15D97C               ;$CAD974 |
    STA.W Obj_VAR2,Y              ;$CAD976 |
    STZ.W Shooting_State        ;$CAD979 |

CODE_15D97C:
    RTL                           ;$CAD97C |
    LDA.W Obj_VAR2,Y              ;$CAD97D |
    BEQ CODE_15D993               ;$CAD980 |
    STA.W Shooting_State        ;$CAD982 |
    LDA.W $7AC1                   ;$CAD985 |
    BNE CODE_15D993               ;$CAD988 |
    LDA.W #$FFFF                  ;$CAD98A |
    STA.W $7495                   ;$CAD98D |
    STA.W Helper_Ability          ;$CAD990 |

CODE_15D993:
    RTL                           ;$CAD993 |
    LDA.W #$0001                  ;$CAD994 |
    LDX.W Current_SubGame         ;$CAD997 |
    CPX.W #$0000                  ;$CAD99A |
    BEQ CODE_15D9AA               ;$CAD99D |
    LDA.W #$0040                  ;$CAD99F |
    CPX.W #$0005                  ;$CAD9A2 |
    BEQ CODE_15D9AA               ;$CAD9A5 |
    LDA.W #$003B                  ;$CAD9A7 |

CODE_15D9AA:
    JML.L PlayMusic          ;$CAD9AA |
    LDA.W #$DAFD                  ;$CAD9AE |
    LDY.W #$00CA                  ;$CAD9B1 |
    LDX.W #$0002                  ;$CAD9B4 |
    JSL.L CODE_FL_008F64          ;$CAD9B7 |
    RTL                           ;$CAD9BB |
    LDA.W #$DB15                  ;$CAD9BC |
    LDY.W #$00CA                  ;$CAD9BF |
    LDX.W #$0002                  ;$CAD9C2 |
    JSL.L CODE_FL_008F64          ;$CAD9C5 |
    RTL                           ;$CAD9C9 |
    LDY.W #$0002                  ;$CAD9CA |
    JSL.L CODE_FL_00E2F8          ;$CAD9CD |
    LDY.B $39                     ;$CAD9D1 |
    RTL                           ;$CAD9D3 |

    LDA.W $738E                   ;$CAD9D4 |
    DEC A                         ;$CAD9D7 |
    STA.W $738E                   ;$CAD9D8 |
    LDA.W #$0001                  ;$CAD9DB |
    STA.W ReloadMapOnUnpause      ;$CAD9DE |
    LDA.W #$0003                  ;$CAD9E1 |
    STA.W Lives                   ;$CAD9E4 |
    INC.W $75EF                   ;$CAD9E7 |
    JSL.L CODE_FL_0599E9          ;$CAD9EA |
    RTL                           ;$CAD9EE |
    LDX.B $39                     ;$CAD9EF |
    STZ.W Obj_VAR0,X              ;$CAD9F1 |
    STZ.W Obj_VAR1,X              ;$CAD9F4 |
    STZ.W Obj_VAR2,X              ;$CAD9F7 |
    STZ.W Obj_VAR3,X              ;$CAD9FA |
    STZ.W Obj_VAR4,X              ;$CAD9FD |
    STZ.W Obj_VAR5,X              ;$CADA00 |
    STZ.W Obj_VAR6,X              ;$CADA03 |
    STZ.W Obj_VAR7,X              ;$CADA06 |
    RTL                           ;$CADA09 |
    LDA.W P1_Frame                ;$CADA0A |
    AND.W #$C0C0                  ;$CADA0D |
    BEQ CODE_15DA1E               ;$CADA10 |
    LDA.W #$D754                  ;$CADA12 |
    LDY.W #$00CA                  ;$CADA15 |
    LDX.B $39                     ;$CADA18 |
    JSL.L CODE_FL_008F64          ;$CADA1A |

CODE_15DA1E:
    RTL                           ;$CADA1E |
    LDA.W P1_Frame                ;$CADA1F |
    AND.W #$C0C0                  ;$CADA22 |
    BEQ CODE_15DA33               ;$CADA25 |
    LDA.W #$D7A3                  ;$CADA27 |
    LDY.W #$00CA                  ;$CADA2A |
    LDX.B $39                     ;$CADA2D |
    JSL.L CODE_FL_008F64          ;$CADA2F |

CODE_15DA33:
    LDA.W P1_Frame                ;$CADA33 |
    AND.W #$0800                  ;$CADA36 |
    BEQ CODE_15DA47               ;$CADA39 |
    LDA.W #$D781                  ;$CADA3B |
    LDY.W #$00CA                  ;$CADA3E |
    LDX.B $39                     ;$CADA41 |
    JSL.L CODE_FL_008F64          ;$CADA43 |

CODE_15DA47:
    RTL                           ;$CADA47 |
    LDA.W P1_Frame                ;$CADA48 |
    AND.W #$C0C0                  ;$CADA4B |
    BEQ CODE_15DA5C               ;$CADA4E |
    LDA.W #$D872                  ;$CADA50 |
    LDY.W #$00CA                  ;$CADA53 |
    LDX.B $39                     ;$CADA56 |
    JSL.L CODE_FL_008F64          ;$CADA58 |

CODE_15DA5C:
    LDA.W P1_Frame                ;$CADA5C |
    AND.W #$0400                  ;$CADA5F |
    BEQ CODE_15DA70               ;$CADA62 |
    LDA.W #$D792                  ;$CADA64 |
    LDY.W #$00CA                  ;$CADA67 |
    LDX.B $39                     ;$CADA6A |
    JSL.L CODE_FL_008F64          ;$CADA6C |

CODE_15DA70:
    RTL                           ;$CADA70 |
    LDY.B $39                     ;$CADA71 |
    LDX.W #$0002                  ;$CADA73 |
    LDA.W Obj_YPosition,Y         ;$CADA76 |
    STA.W Obj_YPosition,X         ;$CADA79 |
    STA.W Obj_YPositionMirror,X   ;$CADA7C |
    LDA.W P1_Frame                ;$CADA7F |
    AND.W #$C0C0                  ;$CADA82 |
    BEQ CODE_15DAA6               ;$CADA85 |
    LDA.W $738E                   ;$CADA87 |
    DEC A                         ;$CADA8A |
    STA.W $738E                   ;$CADA8B |
    LDA.W #$0000                  ;$CADA8E |
    STA.W ReloadMapOnUnpause      ;$CADA91 |
    LDA.W #$0003                  ;$CADA94 |
    STA.W Lives                   ;$CADA97 |
    LDA.W #$D950                  ;$CADA9A |
    LDY.W #$00CA                  ;$CADA9D |
    LDX.B $39                     ;$CADAA0 |
    JSL.L CODE_FL_008F64          ;$CADAA2 |

CODE_15DAA6:
    RTL                           ;$CADAA6 |
    LDA.W P1_Frame                ;$CADAA7 |
    AND.W #$C0C0                  ;$CADAAA |
    BEQ CODE_15DABB               ;$CADAAD |
    LDA.W #$D950                  ;$CADAAF |
    LDY.W #$00CA                  ;$CADAB2 |
    LDX.B $39                     ;$CADAB5 |
    JSL.L CODE_FL_008F64          ;$CADAB7 |

CODE_15DABB:
    RTL                           ;$CADABB |
    db $C0,$6C,$92,$00,$24,$C0,$EF,$D9;$CADABC |
    db $CA,$C0,$8C,$DB,$CA,$16,$FB,$A6;$CADAC4 |
    db $15,$04,$B0,$26,$80,$00,$27,$80;$CADACC |
    db $00,$14,$FC,$96,$C7,$33,$5F,$00;$CADAD4 |
    db $35,$7D,$01,$02,$0C,$35,$7F,$01;$CADADC |
    db $02,$0C,$35,$81,$01,$02,$0C,$35;$CADAE4 |
    db $83,$01,$02,$0C,$35,$81,$01,$02;$CADAEC |
    db $0C,$35,$7F,$01,$02,$0C,$0E,$DC;$CADAF4 |
    db $DA,$15,$72,$AB,$14,$67,$95,$CC;$CADAFC |
    db $26,$80,$00,$27,$80,$00,$40,$1A;$CADB04 |
    db $02,$3C,$40,$1B,$02,$3C,$0E,$0A;$CADB0C |
    db $DB,$04,$15,$F5,$AF,$35,$83,$01;$CADB14 |
    db $02,$0C,$35,$85,$01,$02,$0C,$35;$CADB1C |
    db $87,$01,$02,$0C,$35,$89,$01,$02;$CADB24 |
    db $0C,$35,$87,$01,$02,$0C,$15,$72;$CADB2C |
    db $AB,$26,$80,$00,$27,$80,$00,$14;$CADB34 |
    db $67,$95,$CC,$40,$0B,$82,$00,$FE;$CADB3C |
    db $82,$00,$02,$80,$00,$01,$90,$00;$CADB44 |
    db $FC,$B0,$50,$00,$02,$18,$15,$F5;$CADB4C |
    db $AF,$14,$FC,$96,$C7,$35,$7F,$01;$CADB54 |
    db $80,$80,$00,$90,$00,$FE,$B0,$40;$CADB5C |
    db $00,$02,$10,$24,$05,$02,$35,$81;$CADB64 |
    db $01,$02,$03,$35,$7F,$01,$02,$03;$CADB6C |
    db $07,$35,$81,$01,$02,$10,$80,$80;$CADB74 |
    db $02,$43,$0C,$42,$0E,$42,$10,$43;$CADB7C |
    db $12,$42,$10,$42,$0E,$0E,$7D,$DB;$CADB84 |
    LDY.W #$0002                  ;$CADB8C |
    LDA.W #$0015                  ;$CADB8F |
    JSL.L CODE_FL_029C71          ;$CADB92 |
    LDX.B $39                     ;$CADB96 |
    LDA.W #$EEF7                  ;$CADB98 |
    LDX.W #$00E9                  ;$CADB9B |
    LDY.W #$8010                  ;$CADB9E |
    JSL.L WritePal                ;$CADBA1 |
    RTL                           ;$CADBA5 |
    LDY.W #$0002                  ;$CADBA6 |
    LDA.W #$0000                  ;$CADBA9 |
    JSL.L CODE_FL_029C71          ;$CADBAC |
    RTL                           ;$CADBB0 |
    db $24,$C0,$EF,$D9,$CA,$16,$FB,$A6;$CADBB1 |
    db $15,$72,$AB,$26,$76,$00,$27,$8A;$CADBB9 |
    db $00,$14,$67,$95,$CC,$33,$60,$00;$CADBC1 |
    db $40,$1C,$01,$24,$C0,$EF,$D9,$CA;$CADBC9 |
    db $16,$FB,$A6,$15,$72,$AB,$26,$50;$CADBD1 |
    db $00,$27,$70,$00,$14,$67,$95,$CC;$CADBD9 |
    db $33,$60,$00,$05,$02,$42,$0C,$42;$CADBE1 |
    db $0D,$42,$0E,$42,$0F,$42,$10,$07;$CADBE9 |
    db $00,$24,$C0,$EF,$D9,$CA,$03,$21;$CADBF1 |
    db $DC,$CA,$15,$72,$AB,$16,$FB,$A6;$CADBF9 |
    db $26,$00,$00,$27,$00,$00,$40,$FF;$CADC01 |
    db $C0,$8F,$A2,$00,$93,$86,$EA,$00;$CADC09 |
    db $20,$7E,$B0,$E0,$FF,$02,$40,$90;$CADC11 |
    db $00,$F8,$B0,$20,$00,$02,$40,$00;$CADC19 |
    LDY.B $39                     ;$CADC21 |
    LDA.W Obj_YPosition,Y         ;$CADC23 |
    STA.W CameraY_TileMirror                   ;$CADC26 |
    LDA.W Obj_VAR3,Y              ;$CADC29 |
    BNE CODE_15DC48               ;$CADC2C |
    LDA.W CameraY_TileMirror                   ;$CADC2E |
    CMP.W #$FF00                  ;$CADC31 |
    BPL CODE_15DC48               ;$CADC34 |
    LDA.W #$DCCC                  ;$CADC36 |
    LDX.W #$00CA                  ;$CADC39 |
    JSL.L LoadDMATable            ;$CADC3C |
    LDY.B $39                     ;$CADC40 |
    LDA.W #$FFFF                  ;$CADC42 |
    STA.W Obj_VAR3,Y              ;$CADC45 |

CODE_15DC48:
    RTL                           ;$CADC48 |
    db $2E,$00,$C0,$EF,$D9,$CA,$16,$BA;$CADC49 |
    db $A8,$2A,$00,$00,$00,$2B,$00,$00;$CADC51 |
    db $00,$40,$FF,$05,$03,$30,$00,$00;$CADC59 |
    db $FE,$02,$01,$30,$00,$00,$02,$02;$CADC61 |
    db $02,$30,$00,$00,$FE,$02,$01,$07;$CADC69 |
    db $00,$21,$01,$0F,$05,$BC,$DA,$B1;$CADC71 |
    db $DB,$CC,$DB,$F2,$DB,$49,$DC,$00;$CADC79 |
    db $00,$83,$C0,$3A,$82,$B7,$DA,$00;$CADC81 |
    db $00,$83,$80,$1E,$F2,$2D,$DE,$00;$CADC89 |
    db $66,$83,$00,$14,$30,$2E,$E1,$00;$CADC91 |
    db $76,$89,$00,$04,$FC,$8F,$E8,$00;$CADC99 |
    db $48,$0F,$00,$04,$00,$24,$7E,$00;$CADCA1 |
    db $48,$FF,$89,$00,$04,$54,$10,$E7;$CADCA9 |
    db $00,$4C,$0F,$00,$04,$00,$28,$7E;$CADCB1 |
    db $00,$4C,$09,$00,$04,$00,$24,$7E;$CADCB9 |
    db $00,$48,$0F,$00,$04,$00,$2C,$7E;$CADCC1 |
    db $00,$48,$FF,$09,$00,$04,$00,$20;$CADCC9 |
    db $7E,$00,$48,$0F,$00,$04,$00,$24;$CADCD1 |
    db $7E,$00,$48,$FF,$80,$00,$68,$00;$CADCD9 |
    db $3C,$00,$3C,$00,$83,$00,$57,$00;$CADCE1 |
    db $00,$00,$00,$00,$00,$00,$48,$00;$CADCE9 |

    JSL.L CODE_FL_00D883          ;$CADCF1 |
    LDA.W #$A8FC                  ;$CADCF5 |
    STA.W Obj_TickLoopCallback,Y   ;$CADCF8 |
    LDA.W #$AB90                  ;$CADCFB |
    STA.W Obj_DrawCallback,Y      ;$CADCFE |
    JSL.L CODE_FL_00E1BF          ;$CADD01 |
    JSL.L CODE_FL_00E465          ;$CADD05 |
    LDA.W #$0080                  ;$CADD09 |
    LDX.W #$0080                  ;$CADD0C |
    JSR.W CODE_FN_15F398          ;$CADD0F |
    LDA.W #$B800                  ;$CADD12 |
    STA.W $307D                   ;$CADD15 |
    LDA.W #$0000                  ;$CADD18 |
    STA.W $778E                   ;$CADD1B |
    LDA.W #$0100                  ;$CADD1E |
    LDX.W #$0100                  ;$CADD21 |
    JSR.W CODE_FN_15F39F          ;$CADD24 |
    LDA.W #$0000                  ;$CADD27 |
    LDX.W #$0000                  ;$CADD2A |
    JSR.W CODE_FN_15F3A6          ;$CADD2D |
    LDA.W #$0011                  ;$CADD30 |
    STA.W MainScreenDesignation   ;$CADD33 |
    LDA.W #$0000                  ;$CADD36 |
    LDX.W #$0000                  ;$CADD39 |
    LDY.W #$0000                  ;$CADD3C |
    JSL.L ConfigureLayer1         ;$CADD3F |
    LDA.W #$0000                  ;$CADD43 |
    LDX.W #$4000                  ;$CADD46 |
    LDY.W #$4800                  ;$CADD49 |
    JSL.L ConfigureLayer2         ;$CADD4C |
    LDA.W #$0000                  ;$CADD50 |
    LDX.W #$6000                  ;$CADD53 |
    JSL.L UpdateVramSpriteTileSize;$CADD56 |
    LDA.W #$0007                  ;$CADD5A |
    JSL.L UpdateSNESMode          ;$CADD5D |
    LDA.W #$00C0                  ;$CADD61 |
    STA.W Mode7_Settings          ;$CADD64 |
    PEA.W $007E                   ;$CADD67 |
    PLB                           ;$CADD6A |
    LDA.W #$00EF                  ;$CADD6B |
    LDX.W #$CD73                  ;$CADD6E |
    LDY.W #$2000                  ;$CADD71 |
    JSL.L DecompressData          ;$CADD74 |
    PLB                           ;$CADD78 |
    LDX.W #$00CA                  ;$CADD79 |
    LDA.W #$E5CC                  ;$CADD7C |
    JSL.L LoadDMATable            ;$CADD7F |
    LDX.W #$0001                  ;$CADD83 |
    LDA.W #$8479                  ;$CADD86 |
    JSL.L LoadDMATable            ;$CADD89 |
    LDA.W #$F3D5                  ;$CADD8D |
    LDX.W #$00CA                  ;$CADD90 |
    JSL.L SA1_ExecuteSNES         ;$CADD93 |
    LDA.L DATA8_EB1825            ;$CADD97 |
    STA.W $778C                   ;$CADD9B |
    LDA.W #$1827                  ;$CADD9E |
    LDX.W #$00EB                  ;$CADDA1 |
    LDY.W #$017F                  ;$CADDA4 |
    JSL.L WritePal                ;$CADDA7 |
    LDA.W #$DE72                  ;$CADDAB |
    LDX.W #$00EF                  ;$CADDAE |
    LDY.W #$810F                  ;$CADDB1 |
    JSL.L WritePal                ;$CADDB4 |
    LDA.W #$DE18                  ;$CADDB8 |
    LDX.W #$00EF                  ;$CADDBB |
    LDY.W #$910F                  ;$CADDBE |
    JSL.L WritePal                ;$CADDC1 |
    LDA.W #$E67E                  ;$CADDC5 |
    LDX.W #$00EF                  ;$CADDC8 |
    LDY.W #$A10A                  ;$CADDCB |
    JSL.L WritePal                ;$CADDCE |
    LDA.W #$0000                  ;$CADDD2 |
    JSL.L CODE_FL_0085C7          ;$CADDD5 |
    STZ.W $7796                   ;$CADDD9 |
    LDA.W #$F586                  ;$CADDDC |
    STA.W $3097                   ;$CADDDF |
    LDA.W #$80CA                  ;$CADDE2 |
    STA.W $3099                   ;$CADDE5 |
    LDA.W #$F5D0                  ;$CADDE8 |
    LDX.W #$00CA                  ;$CADDEB |
    JSL.L SA1_ExecuteSNES         ;$CADDEE |
    LDY.B $39                     ;$CADDF2 |
    LDA.W #$E4A3                  ;$CADDF4 |
    LDX.W #$00CA                  ;$CADDF7 |
    JSL.L CODE_FL_00E1B7          ;$CADDFA |
    LDA.W #$0078                  ;$CADDFE |
    LDX.W #$0090                  ;$CADE01 |
    JSR.W CODE_FN_15F398          ;$CADE04 |
    LDA.W #$0010                  ;$CADE07 |
    LDX.W #$FFF0                  ;$CADE0A |
    JSR.W CODE_FN_15F3A6          ;$CADE0D |
    JSL.L CODE_FL_00E0A3          ;$CADE10 |
    LDA.W #$0000                  ;$CADE14 |
    LDX.W #$0000                  ;$CADE17 |
    JSR.W CODE_FN_15F3A6          ;$CADE1A |
    JSL.L CODE_FL_00E097          ;$CADE1D |
    LDA.W #$FFE0                  ;$CADE21 |
    LDX.W #$0020                  ;$CADE24 |
    JSR.W CODE_FN_15F3A6          ;$CADE27 |
    JSL.L CODE_FL_00E0A3          ;$CADE2A |
    LDA.W #$0000                  ;$CADE2E |
    LDX.W #$0000                  ;$CADE31 |
    JSR.W CODE_FN_15F3A6          ;$CADE34 |
    JSL.L CODE_FL_00E097          ;$CADE37 |
    LDA.W #$0010                  ;$CADE3B |
    LDX.W #$FFF0                  ;$CADE3E |
    JSR.W CODE_FN_15F3A6          ;$CADE41 |
    JSL.L CODE_FL_00E0A3          ;$CADE44 |
    LDA.W #$0000                  ;$CADE48 |
    LDX.W #$0000                  ;$CADE4B |
    JSR.W CODE_FN_15F3A6          ;$CADE4E |
    LDA.W #$0078                  ;$CADE51 |
    LDX.W #$0080                  ;$CADE54 |
    JSR.W CODE_FN_15F398          ;$CADE57 |
    LDA.W #$0030                  ;$CADE5A |
    JSL.L CODE_FL_00E17F          ;$CADE5D |
    STZ.W $7794                   ;$CADE61 |
    LDX.W #$0000                  ;$CADE64 |
    LDY.W #$0000                  ;$CADE67 |
    LDA.W #$0000                  ;$CADE6A |
    JSR.W CODE_FN_15F3AD          ;$CADE6D |
    LDA.W #$0200                  ;$CADE70 |
    LDX.W #$FD00                  ;$CADE73 |
    JSL.L CODE_FL_00E539          ;$CADE76 |
    LDA.W #$FFB0                  ;$CADE7A |
    LDX.W #$0060                  ;$CADE7D |
    JSL.L CODE_FL_00E5CE          ;$CADE80 |
    LDA.W #$0040                  ;$CADE84 |
    STA.W $778E                   ;$CADE87 |
    LDA.W #$FFFA                  ;$CADE8A |
    LDX.W #$FFFA                  ;$CADE8D |
    JSR.W CODE_FN_15F3A6          ;$CADE90 |
    LDA.W #$0010                  ;$CADE93 |
    STA.W Obj_VAR8,Y              ;$CADE96 |

CODE_JP_15DE99:
    LDA.W #$F3D9                  ;$CADE99 |
    LDX.W #$00CA                  ;$CADE9C |
    JSL.L SA1_ExecuteSNES         ;$CADE9F |
    JSL.L CODE_FL_00E091          ;$CADEA3 |
    TYX                           ;$CADEA7 |
    DEC.W Obj_VAR8,X              ;$CADEA8 |
    BEQ CODE_95DEB0               ;$CADEAB |
    JMP.W CODE_JP_15DE99          ;$CADEAD |

CODE_95DEB0:
    LDA.W #$FF00                  ;$CADEB0 |
    LDX.W #$0180                  ;$CADEB3 |
    JSL.L CODE_FL_00E5CE          ;$CADEB6 |
    LDX.W #$0100                  ;$CADEBA |
    LDY.W #$0050                  ;$CADEBD |
    LDA.W #$0006                  ;$CADEC0 |
    JSR.W CODE_FN_15F3AD          ;$CADEC3 |
    LDX.W #$0100                  ;$CADEC6 |
    LDY.W #$0030                  ;$CADEC9 |
    LDA.W #$0008                  ;$CADECC |
    JSR.W CODE_FN_15F3AD          ;$CADECF |
    LDX.W #$0100                  ;$CADED2 |
    LDY.W #$0040                  ;$CADED5 |
    LDA.W #$000A                  ;$CADED8 |
    JSR.W CODE_FN_15F3AD          ;$CADEDB |
    LDA.W #$FFF9                  ;$CADEDE |
    LDX.W #$FFF9                  ;$CADEE1 |
    JSR.W CODE_FN_15F3A6          ;$CADEE4 |
    LDA.W #$0008                  ;$CADEE7 |
    STA.W Obj_VAR8,Y              ;$CADEEA |

CODE_JP_15DEED:
    LDA.W #$F3D9                  ;$CADEED |
    LDX.W #$00CA                  ;$CADEF0 |
    JSL.L SA1_ExecuteSNES         ;$CADEF3 |
    JSL.L CODE_FL_00E091          ;$CADEF7 |
    TYX                           ;$CADEFB |
    DEC.W Obj_VAR8,X              ;$CADEFC |
    BEQ CODE_95DF04               ;$CADEFF |
    JMP.W CODE_JP_15DEED          ;$CADF01 |

CODE_95DF04:
    LDA.W #$FD00                  ;$CADF04 |
    LDX.W #$0400                  ;$CADF07 |
    JSL.L CODE_FL_00E5CE          ;$CADF0A |
    LDA.W #$0007                  ;$CADF0E |
    STA.W Obj_VAR8,Y              ;$CADF11 |

CODE_JP_15DF14:
    LDA.W #$F3D9                  ;$CADF14 |
    LDX.W #$00CA                  ;$CADF17 |
    JSL.L SA1_ExecuteSNES         ;$CADF1A |
    JSL.L CODE_FL_00E091          ;$CADF1E |
    TYX                           ;$CADF22 |
    DEC.W Obj_VAR8,X              ;$CADF23 |
    BEQ CODE_95DF2B               ;$CADF26 |
    JMP.W CODE_JP_15DF14          ;$CADF28 |

CODE_95DF2B:
    LDA.W #$0000                  ;$CADF2B |
    STA.W $778E                   ;$CADF2E |
    LDA.W #$0000                  ;$CADF31 |
    LDX.W #$0000                  ;$CADF34 |
    JSR.W CODE_FN_15F3A6          ;$CADF37 |
    JSL.L CODE_FL_00E465          ;$CADF3A |
    LDX.W #$00CA                  ;$CADF3E |
    LDA.W #$E68D                  ;$CADF41 |
    JSL.L LoadDMATable            ;$CADF44 |
    LDY.B $39                     ;$CADF48 |
    LDA.W #$0120                  ;$CADF4A |
    LDX.W #$0160                  ;$CADF4D |
    JSR.W CODE_FN_15F35A          ;$CADF50 |
    LDA.W #$0200                  ;$CADF53 |
    LDX.W #$0188                  ;$CADF56 |
    JSR.W CODE_FN_15F398          ;$CADF59 |
    LDA.W #$3000                  ;$CADF5C |
    STA.W $307D                   ;$CADF5F |
    LDA.W #$0A00                  ;$CADF62 |
    LDX.W #$0A00                  ;$CADF65 |
    JSR.W CODE_FN_15F39F          ;$CADF68 |
    LDA.W #$F700                  ;$CADF6B |
    LDX.W #$0700                  ;$CADF6E |
    JSL.L CODE_FL_00E539          ;$CADF71 |
    LDA.W #$0060                  ;$CADF75 |
    LDX.W #$FFCE                  ;$CADF78 |
    JSL.L CODE_FL_00E5CE          ;$CADF7B |
    LDA.W #$FFD8                  ;$CADF7F |
    LDX.W #$FFD8                  ;$CADF82 |
    JSR.W CODE_FN_15F3A6          ;$CADF85 |
    LDA.W #$FF00                  ;$CADF88 |
    STA.W $778E                   ;$CADF8B |
    JSL.L CODE_FL_00E14B          ;$CADF8E |
    LDA.W #$FFDC                  ;$CADF92 |
    LDX.W #$FFDC                  ;$CADF95 |
    JSR.W CODE_FN_15F3A6          ;$CADF98 |
    LDA.W #$FD00                  ;$CADF9B |
    STA.W $778E                   ;$CADF9E |
    LDA.W #$0000                  ;$CADFA1 |
    LDX.W #$FFA0                  ;$CADFA4 |
    JSL.L CODE_FL_00E5CE          ;$CADFA7 |
    JSL.L CODE_FL_00E0D3          ;$CADFAB |
    LDA.W #$FFF0                  ;$CADFAF |
    LDX.W #$FFF0                  ;$CADFB2 |
    JSR.W CODE_FN_15F3A6          ;$CADFB5 |
    LDA.W #$FB00                  ;$CADFB8 |
    STA.W $778E                   ;$CADFBB |
    LDA.W #$FFE0                  ;$CADFBE |
    LDX.W #$0000                  ;$CADFC1 |
    JSL.L CODE_FL_00E5CE          ;$CADFC4 |
    JSL.L CODE_FL_00E0EB          ;$CADFC8 |
    LDA.W #$FFEE                  ;$CADFCC |
    LDX.W #$FFEE                  ;$CADFCF |
    JSR.W CODE_FN_15F3A6          ;$CADFD2 |
    LDA.W #$F780                  ;$CADFD5 |
    STA.W $778E                   ;$CADFD8 |
    LDA.W #$FFC0                  ;$CADFDB |
    LDX.W #$0080                  ;$CADFDE |
    JSL.L CODE_FL_00E5CE          ;$CADFE1 |
    JSL.L CODE_FL_00E0F7          ;$CADFE5 |
    LDA.W #$FFF4                  ;$CADFE9 |
    LDX.W #$FFF4                  ;$CADFEC |
    JSR.W CODE_FN_15F3A6          ;$CADFEF |
    LDA.W #$FE00                  ;$CADFF2 |
    STA.W $778E                   ;$CADFF5 |
    LDA.W #$FF60                  ;$CADFF8 |
    LDX.W #$FFC0                  ;$CADFFB |
    JSL.L CODE_FL_00E5CE          ;$CADFFE |
    JSL.L CODE_FL_00E0BB          ;$CAE002 |
    JSL.L CODE_FL_00E465          ;$CAE006 |
    LDA.W #$0000                  ;$CAE00A |
    STA.W $778E                   ;$CAE00D |
    LDA.W #$FFF0                  ;$CAE010 |
    LDX.W #$0010                  ;$CAE013 |
    JSR.W CODE_FN_15F3A6          ;$CAE016 |
    JSL.L CODE_FL_00E0A3          ;$CAE019 |
    LDA.W #$0000                  ;$CAE01D |
    LDX.W #$0000                  ;$CAE020 |
    JSR.W CODE_FN_15F3A6          ;$CAE023 |
    JSL.L CODE_FL_00E097          ;$CAE026 |
    LDA.W #$0020                  ;$CAE02A |
    LDX.W #$FFE0                  ;$CAE02D |
    JSR.W CODE_FN_15F3A6          ;$CAE030 |
    JSL.L CODE_FL_00E0A3          ;$CAE033 |
    LDA.W #$0000                  ;$CAE037 |
    LDX.W #$0000                  ;$CAE03A |
    JSR.W CODE_FN_15F3A6          ;$CAE03D |
    JSL.L CODE_FL_00E097          ;$CAE040 |
    LDA.W #$FFF0                  ;$CAE044 |
    LDX.W #$0010                  ;$CAE047 |
    JSR.W CODE_FN_15F3A6          ;$CAE04A |
    JSL.L CODE_FL_00E0A3          ;$CAE04D |
    LDA.W #$0000                  ;$CAE051 |
    LDX.W #$0000                  ;$CAE054 |
    JSR.W CODE_FN_15F3A6          ;$CAE057 |
    LDA.W #$0002                  ;$CAE05A |
    STA.W Obj_VAR8,Y              ;$CAE05D |

CODE_JP_15E060:
    LDA.W #$0000                  ;$CAE060 |
    LDX.W #$0300                  ;$CAE063 |
    JSL.L CODE_FL_00E539          ;$CAE066 |
    JSL.L CODE_FL_00E097          ;$CAE06A |
    LDA.W #$0000                  ;$CAE06E |
    LDX.W #$FD00                  ;$CAE071 |
    JSL.L CODE_FL_00E539          ;$CAE074 |
    JSL.L CODE_FL_00E097          ;$CAE078 |
    TYX                           ;$CAE07C |
    DEC.W Obj_VAR8,X              ;$CAE07D |
    BEQ CODE_95E085               ;$CAE080 |
    JMP.W CODE_JP_15E060          ;$CAE082 |

CODE_95E085:
    LDX.W #$0068                  ;$CAE085 |
    LDY.W #$00A8                  ;$CAE088 |
    LDA.W #$000E                  ;$CAE08B |
    JSR.W CODE_FN_15F3AD          ;$CAE08E |
    LDX.W #$0050                  ;$CAE091 |
    LDY.W #$0090                  ;$CAE094 |
    LDA.W #$0010                  ;$CAE097 |
    JSR.W CODE_FN_15F3AD          ;$CAE09A |
    LDX.W #$00A0                  ;$CAE09D |
    LDY.W #$0080                  ;$CAE0A0 |
    LDA.W #$0012                  ;$CAE0A3 |
    JSR.W CODE_FN_15F3AD          ;$CAE0A6 |
    LDX.W #$00B0                  ;$CAE0A9 |
    LDY.W #$008C                  ;$CAE0AC |
    LDA.W #$0014                  ;$CAE0AF |
    JSR.W CODE_FN_15F3AD          ;$CAE0B2 |
    JSL.L CODE_FL_00E465          ;$CAE0B5 |
    JSL.L CODE_FL_00E0A3          ;$CAE0B9 |
    LDA.W #$FFF8                  ;$CAE0BD |
    LDX.W #$FFF8                  ;$CAE0C0 |
    JSR.W CODE_FN_15F3A6          ;$CAE0C3 |
    LDA.W #$FF00                  ;$CAE0C6 |
    STA.W $778E                   ;$CAE0C9 |
    LDA.W #$FE00                  ;$CAE0CC |
    LDX.W #$FE00                  ;$CAE0CF |
    JSL.L CODE_FL_00E5CE          ;$CAE0D2 |
    JSL.L CODE_FL_00E0D3          ;$CAE0D6 |
    LDA.W #$0000                  ;$CAE0DA |
    LDX.W #$0000                  ;$CAE0DD |
    JSR.W CODE_FN_15F3A6          ;$CAE0E0 |
    LDA.W #$0000                  ;$CAE0E3 |
    STA.W $778E                   ;$CAE0E6 |
    JSL.L CODE_FL_00E0A3          ;$CAE0E9 |
    JSL.L CODE_FL_00E465          ;$CAE0ED |
    JSL.L CODE_FL_00E0EB          ;$CAE0F1 |
    JSL.L UpdateVramSprSize       ;$CAE0F5 |
    JSL.L CODE_FL_009BEF          ;$CAE0F9 |
    LDA.W #$F4C2                  ;$CAE0FD |
    LDX.W #$00CA                  ;$CAE100 |
    JSL.L SA1_ExecuteSNES         ;$CAE103 |
    LDX.W #$00CA                  ;$CAE107 |
    LDA.W #$E6E6                  ;$CAE10A |
    JSL.L LoadDMATable            ;$CAE10D |
    LDA.W #$1925                  ;$CAE111 |
    LDX.W #$00EB                  ;$CAE114 |
    LDY.W #$0080                  ;$CAE117 |
    JSL.L WritePal                ;$CAE11A |
    LDA.W #$E39A                  ;$CAE11E |
    LDX.W #$00EF                  ;$CAE121 |
    LDY.W #$810F                  ;$CAE124 |
    JSL.L WritePal                ;$CAE127 |
    LDA.W #$9CA8                  ;$CAE12B |
    LDX.W #$00EC                  ;$CAE12E |
    LDY.W #$A15F                  ;$CAE131 |
    JSL.L WritePal                ;$CAE134 |
    STZ.W Mode7_Settings          ;$CAE138 |
    LDA.W #$0100                  ;$CAE13B |
    STZ.W $3039                   ;$CAE13E |
    STA.W $303F                   ;$CAE141 |
    STZ.W $7344                   ;$CAE144 |
    STZ.W $7354                   ;$CAE147 |
    LDY.B $39                     ;$CAE14A |
    LDA.W #$0000                  ;$CAE14C |
    STA.W $307D                   ;$CAE14F |
    LDA.W #$0000                  ;$CAE152 |
    STA.W $778E                   ;$CAE155 |
    LDA.W #$0200                  ;$CAE158 |
    LDX.W #$0200                  ;$CAE15B |
    JSR.W CODE_FN_15F39F          ;$CAE15E |
    LDA.W #$FFFC                  ;$CAE161 |
    LDX.W #$FFFC                  ;$CAE164 |
    JSR.W CODE_FN_15F3A6          ;$CAE167 |
    LDA.W #$0800                  ;$CAE16A |
    LDX.W #$F800                  ;$CAE16D |
    JSL.L CODE_FL_00E539          ;$CAE170 |
    LDA.W #$E497                  ;$CAE174 |
    LDX.W #$00CA                  ;$CAE177 |
    JSL.L CODE_FL_00E1B7          ;$CAE17A |
    LDA.W #$0000                  ;$CAE17E |
    JSL.L CODE_FL_0085C7          ;$CAE181 |
    LDA.W #$0010                  ;$CAE185 |
    STA.W Obj_VAR8,Y              ;$CAE188 |

CODE_JP_15E18B:
    LDA.W Screen_Brightness_Mirror_PrevFrame;$CAE18B |
    INC A                         ;$CAE18E |
    JSL.L CODE_FL_0085C7          ;$CAE18F |
    JSL.L CODE_FL_00E091          ;$CAE193 |
    TYX                           ;$CAE197 |
    DEC.W Obj_VAR8,X              ;$CAE198 |
    BEQ CODE_95E1A0               ;$CAE19B |
    JMP.W CODE_JP_15E18B          ;$CAE19D |

CODE_95E1A0:
    LDX.W #$0100                  ;$CAE1A0 |
    LDY.W #$FFD0                  ;$CAE1A3 |
    LDA.W #$0016                  ;$CAE1A6 |
    JSR.W CODE_FN_15F3AD          ;$CAE1A9 |
    LDA.W #$0030                  ;$CAE1AC |
    JSL.L CODE_FL_00E17F          ;$CAE1AF |
    LDA.W #$0000                  ;$CAE1B3 |
    LDX.W #$0000                  ;$CAE1B6 |
    JSR.W CODE_FN_15F3A6          ;$CAE1B9 |
    LDA.W #$0060                  ;$CAE1BC |
    JSL.L CODE_FL_00E17F          ;$CAE1BF |
    LDA.W #$0100                  ;$CAE1C3 |
    STA.W $7790                   ;$CAE1C6 |
    STZ.W $7792                   ;$CAE1C9 |
    STZ.W $7794                   ;$CAE1CC |
    LDA.W #$FFFC                  ;$CAE1CF |
    STA.W $7796                   ;$CAE1D2 |
    LDA.W #$0600                  ;$CAE1D5 |
    STA.W $7798                   ;$CAE1D8 |
    LDA.W #$F5E0                  ;$CAE1DB |
    LDX.W #$00CA                  ;$CAE1DE |
    JSL.L SA1_ExecuteSNES         ;$CAE1E1 |
    LDA.W #$E4C3                  ;$CAE1E5 |
    LDX.W #$00CA                  ;$CAE1E8 |
    JSL.L CODE_FL_00E1B7          ;$CAE1EB |
    LDX.W #$0000                  ;$CAE1EF |
    LDY.W #$0000                  ;$CAE1F2 |
    LDA.W #$001A                  ;$CAE1F5 |
    JSR.W CODE_FN_15F3AD          ;$CAE1F8 |
    LDA.W #$0280                  ;$CAE1FB |
    STA.W $778E                   ;$CAE1FE |
    LDA.W #$0028                  ;$CAE201 |
    JSL.L CODE_FL_00E17F          ;$CAE204 |
    LDA.W #$DDDC                  ;$CAE208 |
    LDX.W #$00EF                  ;$CAE20B |
    LDY.W #$810F                  ;$CAE20E |
    JSL.L WritePal                ;$CAE211 |
    LDA.W #$DF20                  ;$CAE215 |
    LDX.W #$00ED                  ;$CAE218 |
    LDY.W #$B14F                  ;$CAE21B |
    JSL.L WritePal                ;$CAE21E |
    LDX.W #$0000                  ;$CAE222 |
    LDY.W #$0080                  ;$CAE225 |
    LDA.W #$0018                  ;$CAE228 |
    JSR.W CODE_FN_15F3AD          ;$CAE22B |
    LDA.W #$FFC0                  ;$CAE22E |
    STA.W $778E                   ;$CAE231 |
    LDA.W #$0480                  ;$CAE234 |
    LDX.W #$FB80                  ;$CAE237 |
    JSL.L CODE_FL_00E539          ;$CAE23A |
    LDA.W #$0008                  ;$CAE23E |
    LDX.W #$0000                  ;$CAE241 |
    JSL.L CODE_FL_00E5CE          ;$CAE244 |
    LDA.W #$0001                  ;$CAE248 |
    STA.W $7796                   ;$CAE24B |
    LDA.W #$0140                  ;$CAE24E |
    STA.W $7798                   ;$CAE251 |
    LDA.W #$0064                  ;$CAE254 |
    JSL.L CODE_FL_00E17F          ;$CAE257 |
    LDA.W #$0005                  ;$CAE25B |
    STA.W $7796                   ;$CAE25E |
    LDA.W #$001C                  ;$CAE261 |
    STA.W Obj_VAR8,Y              ;$CAE264 |

CODE_JP_15E267:
    LDA.W $7798                   ;$CAE267 |
    CLC                           ;$CAE26A |
    ADC.W #$01E0                  ;$CAE26B |
    STA.W $7798                   ;$CAE26E |
    JSL.L CODE_FL_00E091          ;$CAE271 |
    TYX                           ;$CAE275 |
    DEC.W Obj_VAR8,X              ;$CAE276 |
    BEQ CODE_95E27E               ;$CAE279 |
    JMP.W CODE_JP_15E267          ;$CAE27B |

CODE_95E27E:
    JSL.L CODE_FL_00E465          ;$CAE27E |
    JSL.L UpdateVramSprSize       ;$CAE282 |
    JSL.L CODE_FL_009BEF          ;$CAE286 |
    LDA.W #$E4A3                  ;$CAE28A |
    LDX.W #$00CA                  ;$CAE28D |
    JSL.L CODE_FL_00E1B7          ;$CAE290 |
    LDA.W #$F572                  ;$CAE294 |
    LDX.W #$00CA                  ;$CAE297 |
    JSL.L SA1_ExecuteSNES         ;$CAE29A |
    LDX.W #$00CA                  ;$CAE29E |
    LDA.W #$E70F                  ;$CAE2A1 |
    JSL.L LoadDMATable            ;$CAE2A4 |
    LDA.W #$1A25                  ;$CAE2A8 |
    LDX.W #$00EB                  ;$CAE2AB |
    LDY.W #$0080                  ;$CAE2AE |
    JSL.L WritePal                ;$CAE2B1 |
    LDA.W #$DE72                  ;$CAE2B5 |
    LDX.W #$00EF                  ;$CAE2B8 |
    LDY.W #$810F                  ;$CAE2BB |
    JSL.L WritePal                ;$CAE2BE |
    LDX.W #$0210                  ;$CAE2C2 |
    LDY.W #$01F8                  ;$CAE2C5 |
    LDA.W #$0038                  ;$CAE2C8 |
    JSR.W CODE_FN_15F3AD          ;$CAE2CB |
    LDX.W #$0000                  ;$CAE2CE |
    LDY.W #$0000                  ;$CAE2D1 |
    LDA.W #$003A                  ;$CAE2D4 |
    JSR.W CODE_FN_15F3AD          ;$CAE2D7 |
    LDX.W #$0068                  ;$CAE2DA |
    LDY.W #$00A8                  ;$CAE2DD |
    LDA.W #$0040                  ;$CAE2E0 |
    JSR.W CODE_FN_15F3AD          ;$CAE2E3 |
    LDX.W #$0050                  ;$CAE2E6 |
    LDY.W #$0090                  ;$CAE2E9 |
    LDA.W #$0042                  ;$CAE2EC |
    JSR.W CODE_FN_15F3AD          ;$CAE2EF |
    LDX.W #$00A0                  ;$CAE2F2 |
    LDY.W #$0080                  ;$CAE2F5 |
    LDA.W #$0044                  ;$CAE2F8 |
    JSR.W CODE_FN_15F3AD          ;$CAE2FB |
    LDX.W #$00B0                  ;$CAE2FE |
    LDY.W #$008C                  ;$CAE301 |
    LDA.W #$0046                  ;$CAE304 |
    JSR.W CODE_FN_15F3AD          ;$CAE307 |
    LDA.W #$0000                  ;$CAE30A |
    JSL.L CODE_FL_0085C7          ;$CAE30D |
    LDY.B $39                     ;$CAE311 |
    LDA.W #$0002                  ;$CAE313 |
    STA.W Obj_VAR8,Y              ;$CAE316 |

CODE_JP_15E319:
    LDA.W #$0180                  ;$CAE319 |
    LDX.W #$0160                  ;$CAE31C |
    JSR.W CODE_FN_15F35A          ;$CAE31F |
    LDA.W #$01FC                  ;$CAE322 |
    LDX.W #$01EC                  ;$CAE325 |
    JSR.W CODE_FN_15F398          ;$CAE328 |
    LDA.W #$E400                  ;$CAE32B |
    STA.W $307D                   ;$CAE32E |
    LDA.W #$00E0                  ;$CAE331 |
    STA.W $778E                   ;$CAE334 |
    LDA.W #$0006                  ;$CAE337 |
    LDX.W #$0006                  ;$CAE33A |
    JSR.W CODE_FN_15F39F          ;$CAE33D |
    LDA.W #$0006                  ;$CAE340 |
    LDX.W #$0006                  ;$CAE343 |
    JSR.W CODE_FN_15F3A6          ;$CAE346 |
    LDA.W #$F600                  ;$CAE349 |
    LDX.W #$FB00                  ;$CAE34C |
    JSL.L CODE_FL_00E539          ;$CAE34F |
    LDA.W #$0060                  ;$CAE353 |
    LDX.W #$0024                  ;$CAE356 |
    JSL.L CODE_FL_00E5CE          ;$CAE359 |
    LDA.W #$0004                  ;$CAE35D |
    STA.W Obj_VAR9,Y              ;$CAE360 |

CODE_JP_15E363:
    LDA.W Screen_Brightness_Mirror_PrevFrame;$CAE363 |
    INC A                         ;$CAE366 |
    JSL.L CODE_FL_0085C7          ;$CAE367 |
    JSL.L CODE_FL_00E091          ;$CAE36B |
    TYX                           ;$CAE36F |
    DEC.W Obj_VAR9,X              ;$CAE370 |
    BEQ CODE_95E378               ;$CAE373 |
    JMP.W CODE_JP_15E363          ;$CAE375 |

CODE_95E378:
    TYX                           ;$CAE378 |
    DEC.W Obj_VAR8,X              ;$CAE379 |
    BEQ CODE_95E381               ;$CAE37C |
    JMP.W CODE_JP_15E319          ;$CAE37E |

CODE_95E381:
    LDA.W #$0008                  ;$CAE381 |
    STA.W Obj_VAR8,Y              ;$CAE384 |

CODE_JP_15E387:
    LDA.W Screen_Brightness_Mirror_PrevFrame;$CAE387 |
    INC A                         ;$CAE38A |
    JSL.L CODE_FL_0085C7          ;$CAE38B |
    JSL.L CODE_FL_00E091          ;$CAE38F |
    TYX                           ;$CAE393 |
    DEC.W Obj_VAR8,X              ;$CAE394 |
    BEQ CODE_95E39C               ;$CAE397 |
    JMP.W CODE_JP_15E387          ;$CAE399 |

CODE_95E39C:
    LDA.W #$0024                  ;$CAE39C |
    JSL.L CODE_FL_00E17F          ;$CAE39F |
    LDA.W #$FF88                  ;$CAE3A3 |
    LDX.W #$FFD0                  ;$CAE3A6 |
    JSL.L CODE_FL_00E5CE          ;$CAE3A9 |
    LDA.W #$FFA0                  ;$CAE3AD |
    STA.W $778E                   ;$CAE3B0 |
    LDA.W #$0008                  ;$CAE3B3 |
    LDX.W #$0008                  ;$CAE3B6 |
    JSR.W CODE_FN_15F3A6          ;$CAE3B9 |
    JSL.L CODE_FL_00E0EB          ;$CAE3BC |
    LDA.W #$FF80                  ;$CAE3C0 |
    LDX.W #$0000                  ;$CAE3C3 |
    JSL.L CODE_FL_00E5CE          ;$CAE3C6 |
    LDA.W #$0000                  ;$CAE3CA |
    STA.W $778E                   ;$CAE3CD |
    LDA.W #$FFC0                  ;$CAE3D0 |
    LDX.W #$0040                  ;$CAE3D3 |
    JSR.W CODE_FN_15F3A6          ;$CAE3D6 |
    JSL.L CODE_FL_00E0A3          ;$CAE3D9 |
    LDA.W #$0080                  ;$CAE3DD |
    LDX.W #$FF80                  ;$CAE3E0 |
    JSR.W CODE_FN_15F3A6          ;$CAE3E3 |
    JSL.L CODE_FL_00E0A3          ;$CAE3E6 |
    LDA.W #$0000                  ;$CAE3EA |
    LDX.W #$0000                  ;$CAE3ED |
    JSR.W CODE_FN_15F3A6          ;$CAE3F0 |
    JSL.L CODE_FL_00E097          ;$CAE3F3 |
    LDA.W #$F700                  ;$CAE3F7 |
    LDX.W #$FF00                  ;$CAE3FA |
    JSL.L CODE_FL_00E640          ;$CAE3FD |
    LDA.W #$FFC0                  ;$CAE401 |
    LDX.W #$0040                  ;$CAE404 |
    JSR.W CODE_FN_15F3A6          ;$CAE407 |
    JSL.L CODE_FL_00E0A3          ;$CAE40A |
    LDA.W #$F700                  ;$CAE40E |
    STA.W $6B6E,Y                 ;$CAE411 |
    TYX                           ;$CAE414 |
    STZ.W $6CDC,X                 ;$CAE415 |
    LDA.W #$0080                  ;$CAE418 |
    STA.W $778E                   ;$CAE41B |
    LDA.W #$0020                  ;$CAE41E |
    LDX.W #$0020                  ;$CAE421 |
    JSR.W CODE_FN_15F3A6          ;$CAE424 |
    JSL.L CODE_FL_00E0C1          ;$CAE427 |
    LDA.W #$0010                  ;$CAE42B |
    STA.W MainScreenDesignation   ;$CAE42E |
    LDA.W #$60E0                  ;$CAE431 |
    STA.W $778C                   ;$CAE434 |
    STZ.W $778E                   ;$CAE437 |
    LDA.W #$000E                  ;$CAE43A |
    STA.W Obj_VAR8,Y              ;$CAE43D |

CODE_JP_15E440:
    LDA.W #$F42C                  ;$CAE440 |
    LDX.W #$00CA                  ;$CAE443 |
    JSL.L SA1_ExecuteSNES         ;$CAE446 |
    JSL.L CODE_FL_00E091          ;$CAE44A |
    TYX                           ;$CAE44E |
    DEC.W Obj_VAR8,X              ;$CAE44F |
    BEQ CODE_95E457               ;$CAE452 |
    JMP.W CODE_JP_15E440          ;$CAE454 |

CODE_95E457:
    JSL.L CODE_FL_009BEF          ;$CAE457 |
    LDA.W #$00F0                  ;$CAE45B |
    TRB.W HDMA_Enable             ;$CAE45E |
    LDA.W #$0000                  ;$CAE461 |
    JSL.L CODE_FL_0085C7          ;$CAE464 |
    JSL.L UpdateVramSprSize       ;$CAE468 |
    LDA.W #$8812                  ;$CAE46C |
    LDX.W #$0007                  ;$CAE46F |
    JSL.L CODE_FL_00A49D          ;$CAE472 |
    RTL                           ;$CAE476 |
    JSL.L CODE_FL_009BEF          ;$CAE477 |
    LDA.W #$00F0                  ;$CAE47B |
    TRB.W HDMA_Enable             ;$CAE47E |
    LDA.W #$0000                  ;$CAE481 |
    JSL.L CODE_FL_0085C7          ;$CAE484 |
    JSL.L UpdateVramSprSize       ;$CAE488 |
    LDA.W #$8807                  ;$CAE48C |
    LDX.W #$0007                  ;$CAE48F |
    JSL.L CODE_FL_00A49D          ;$CAE492 |
    RTL                           ;$CAE496 |
    LDA.W CameraX_TileMirror                   ;$CAE497 |
    STA.W Mode7_CenterX           ;$CAE49A |
    LDA.W CameraY_TileMirror                   ;$CAE49D |
    STA.W Mode7_CenterY           ;$CAE4A0 |
    JSR.W CODE_FN_15E5B3          ;$CAE4A3 |
    LDA.W $307F                   ;$CAE4A6 |
    CLC                           ;$CAE4A9 |
    ADC.W $7790                   ;$CAE4AA |
    STA.W $307F                   ;$CAE4AD |
    TAX                           ;$CAE4B0 |
    LDA.W $3081                   ;$CAE4B1 |
    CLC                           ;$CAE4B4 |
    ADC.W $7792                   ;$CAE4B5 |
    STA.W $3081                   ;$CAE4B8 |
    TAY                           ;$CAE4BB |
    LDA.W $307D                   ;$CAE4BC |
    JML.L CODE_FL_00A66C          ;$CAE4BF |
    JSR.W CODE_FN_15E5B3          ;$CAE4C3 |
    LDA.W CameraX_TileMirror                   ;$CAE4C6 |
    CLC                           ;$CAE4C9 |
    ADC.W #$0080                  ;$CAE4CA |
    STA.W Mode7_CenterX           ;$CAE4CD |
    LDA.W CameraY_TileMirror                   ;$CAE4D0 |
    CLC                           ;$CAE4D3 |
    ADC.W #$00E0                  ;$CAE4D4 |
    STA.W Mode7_CenterY           ;$CAE4D7 |
    STZ.B SNES_WaitForCommand_waitForMessage;$CAE4DA |
    STZ.B $16                     ;$CAE4DC |
    LDA.W $7790                   ;$CAE4DE |
    CLC                           ;$CAE4E1 |
    ADC.W $7796                   ;$CAE4E2 |
    STA.W $7790                   ;$CAE4E5 |
    LDA.W $7792                   ;$CAE4E8 |
    CLC                           ;$CAE4EB |
    ADC.W $7798                   ;$CAE4EC |
    STA.W $7792                   ;$CAE4EF |
    BCC CODE_95E4F7               ;$CAE4F2 |
    INC.W $7794                   ;$CAE4F4 |

CODE_95E4F7:
    LDA.W #$FFFC                  ;$CAE4F7 |
    STA.B DSP_P                   ;$CAE4FA |
    JSR.W CODE_FN_15E529          ;$CAE4FC |
    LDA.W #$E57D                  ;$CAE4FF |
    LDX.W #$00CA                  ;$CAE502 |
    JSL.L SA1_ExecuteSNES         ;$CAE505 |
    LDA.W #$0100                  ;$CAE509 |
    SEC                           ;$CAE50C |
    SBC.W $303F                   ;$CAE50D |
    BCC CODE_95E51B               ;$CAE510 |
    ASL A                         ;$CAE512 |
    ASL A                         ;$CAE513 |
    CMP.W #$01B0                  ;$CAE514 |
    BCS CODE_95E51B               ;$CAE517 |
    STA.B DSP_P                   ;$CAE519 |

CODE_95E51B:
    JSR.W CODE_FN_15E529          ;$CAE51B |
    LDA.W #$E598                  ;$CAE51E |
    LDX.W #$00CA                  ;$CAE521 |
    JSL.L SA1_ExecuteSNES         ;$CAE524 |
    RTL                           ;$CAE528 |

CODE_FN_15E529:
    LDX.W #$01BC                  ;$CAE529 |

CODE_95E52C:
    STX.B IdentifySNES            ;$CAE52C |
    STZ.W $2250                   ;$CAE52E |
    LDA.B SNES_WaitForCommand_waitForMessage;$CAE531 |
    CLC                           ;$CAE533 |
    ADC.W $7792                   ;$CAE534 |
    STA.B SNES_WaitForCommand_waitForMessage;$CAE537 |
    LDA.B $16                     ;$CAE539 |
    ADC.W $7794                   ;$CAE53B |
    STA.B $16                     ;$CAE53E |
    ASL A                         ;$CAE540 |
    TAX                           ;$CAE541 |
    LDA.L DATA8_CAF654,X          ;$CAE542 |
    STA.W $2251                   ;$CAE546 |
    LDA.W $7790                   ;$CAE549 |
    STA.W $2253                   ;$CAE54C |
    LDA.W $307D                   ;$CAE54F |
    LDX.W $2307                   ;$CAE552 |
    TXY                           ;$CAE555 |
    JSL.L CODE_FL_00A66C          ;$CAE556 |
    LDX.B IdentifySNES            ;$CAE55A |
    LDA.W Mode7_MatrixA           ;$CAE55C |
    STA.W $7B80,X                 ;$CAE55F |
    LDA.W Mode7_MatrixB           ;$CAE562 |
    STA.W $7B82,X                 ;$CAE565 |
    LDA.W Mode7_MatrixC           ;$CAE568 |
    STA.W $7D40,X                 ;$CAE56B |
    LDA.W Mode7_MatrixD           ;$CAE56E |
    STA.W $7D42,X                 ;$CAE571 |
    DEX                           ;$CAE574 |
    DEX                           ;$CAE575 |
    DEX                           ;$CAE576 |
    DEX                           ;$CAE577 |
    CPX.B DSP_P                   ;$CAE578 |
    BNE CODE_95E52C               ;$CAE57A |
    RTS                           ;$CAE57C |
    PHB                           ;$CAE57D |
    LDX.W #$7B80                  ;$CAE57E |
    LDY.W #$7330                  ;$CAE581 |
    LDA.W #$01BF                  ;$CAE584 |
    MVN $7F,$00                   ;$CAE587 |
    LDX.W #$7D40                  ;$CAE58A |
    LDY.W #$76B0                  ;$CAE58D |
    LDA.W #$01BF                  ;$CAE590 |
    MVN $7F,$00                   ;$CAE593 |
    PLB                           ;$CAE596 |
    RTL                           ;$CAE597 |
    PHB                           ;$CAE598 |
    LDX.W #$7B80                  ;$CAE599 |
    LDY.W #$7170                  ;$CAE59C |
    LDA.W #$01BF                  ;$CAE59F |
    MVN $7F,$00                   ;$CAE5A2 |
    LDX.W #$7D40                  ;$CAE5A5 |
    LDY.W #$74F0                  ;$CAE5A8 |
    LDA.W #$01BF                  ;$CAE5AB |
    MVN $7F,$00                   ;$CAE5AE |
    PLB                           ;$CAE5B1 |
    RTL                           ;$CAE5B2 |

CODE_FN_15E5B3:
    LDA.W P1_Frame                ;$CAE5B3 |
    AND.W #$D0C0                  ;$CAE5B6 |
    BEQ CODE_95E5C1               ;$CAE5B9 |
    LDA.W #$E477                  ;$CAE5BB |
    STA.W Obj_TickCallbackAddr,Y  ;$CAE5BE |

CODE_95E5C1:
    LDA.W $307D                   ;$CAE5C1 |
    CLC                           ;$CAE5C4 |
    ADC.W $778E                   ;$CAE5C5 |
    STA.W $307D                   ;$CAE5C8 |
    RTS                           ;$CAE5CB |
    db $0C,$00,$40,$FE,$FF,$00,$00,$00;$CAE5CC |
    db $09,$0C,$00,$00,$20,$7E,$0A,$04;$CAE5D4 |
    db $09,$0E,$00,$0C,$20,$7E,$89,$04;$CAE5DC |
    db $09,$0E,$00,$1A,$20,$7E,$09,$05;$CAE5E4 |
    db $09,$0C,$00,$28,$20,$7E,$8A,$05;$CAE5EC |
    db $09,$06,$00,$34,$20,$7E,$0D,$07;$CAE5F4 |
    db $09,$06,$00,$3A,$20,$7E,$8D,$07;$CAE5FC |
    db $09,$06,$00,$40,$20,$7E,$0D,$08;$CAE604 |
    db $09,$06,$00,$46,$20,$7E,$8D,$08;$CAE60C |
    db $09,$06,$00,$4C,$20,$7E,$0D,$09;$CAE614 |
    db $09,$06,$00,$52,$20,$7E,$8D,$09;$CAE61C |
    db $09,$06,$00,$58,$20,$7E,$0D,$0A;$CAE624 |
    db $09,$06,$00,$5E,$20,$7E,$BD,$16;$CAE62C |
    db $09,$07,$00,$64,$20,$7E,$3D,$17;$CAE634 |
    db $09,$0C,$00,$6B,$20,$7E,$BA,$17;$CAE63C |
    db $09,$0C,$00,$77,$20,$7E,$3A,$18;$CAE644 |
    db $09,$0C,$00,$83,$20,$7E,$BA,$18;$CAE64C |
    db $09,$0A,$00,$8F,$20,$7E,$3B,$19;$CAE654 |
    db $09,$0A,$00,$99,$20,$7E,$BB,$19;$CAE65C |
    db $09,$0C,$00,$A3,$20,$7E,$3A,$1A;$CAE664 |
    db $09,$0C,$00,$AF,$20,$7E,$BA,$1A;$CAE66C |
    db $09,$0C,$00,$BB,$20,$7E,$3A,$1B;$CAE674 |
    db $83,$20,$11,$CB,$DE,$E3,$00,$60;$CAE67C |
    db $8F,$40,$31,$00,$00,$DF,$00,$00;$CAE684 |
    db $FF,$0C,$0D,$00,$FE,$FF,$00,$09;$CAE68C |
    db $04,$0C,$0D,$00,$FE,$FF,$00,$89;$CAE694 |
    db $04,$0C,$0D,$00,$FE,$FF,$00,$09;$CAE69C |
    db $05,$0C,$0D,$00,$FE,$FF,$00,$89;$CAE6A4 |
    db $05,$0C,$06,$00,$FE,$FF,$00,$0C;$CAE6AC |
    db $07,$0C,$06,$00,$FE,$FF,$00,$8C;$CAE6B4 |
    db $07,$0C,$06,$00,$FE,$FF,$00,$0C;$CAE6BC |
    db $08,$0C,$06,$00,$FE,$FF,$00,$8C;$CAE6C4 |
    db $08,$0C,$06,$00,$FE,$FF,$00,$0C;$CAE6CC |
    db $09,$0C,$06,$00,$FE,$FF,$00,$8C;$CAE6D4 |
    db $09,$0C,$06,$00,$FE,$FF,$00,$0C;$CAE6DC |
    db $0A,$FF,$09,$00,$40,$00,$20,$7E;$CAE6E4 |
    db $00,$00,$89,$00,$04,$B1,$A6,$EC;$CAE6EC |
    db $00,$48,$8F,$00,$04,$4D,$D5,$EF;$CAE6F4 |
    db $00,$48,$83,$60,$0B,$FB,$14,$E6;$CAE6FC |
    db $00,$40,$0F,$00,$10,$B2,$92,$E0;$CAE704 |
    db $00,$00,$FF,$0C,$00,$40,$FE,$FF;$CAE70C |
    db $00,$00,$00,$09,$05,$00,$00,$20;$CAE714 |
    db $7E,$3F,$1E,$09,$07,$00,$05,$20;$CAE71C |
    db $7E,$BE,$1E,$09,$07,$00,$0C,$20;$CAE724 |
    db $7E,$3E,$1F,$09,$08,$00,$13,$20;$CAE72C |
    db $7E,$BD,$1F,$09,$08,$00,$1B,$20;$CAE734 |
    db $7E,$3D,$20,$09,$07,$00,$23,$20;$CAE73C |
    db $7E,$BD,$20,$8F,$C0,$0A,$07,$07;$CAE744 |
    db $E6,$00,$00,$FF            ;$CAE74C |
    LDA.W #$CFFF                  ;$CAE750 |
    STA.W $3033                   ;$CAE753 |
    STZ.W $3035                   ;$CAE756 |
    LDA.W #$ABA3                  ;$CAE759 |
    STA.W Obj_DrawCallback,Y      ;$CAE75C |
    JSL.L CODE_FL_00E302          ;$CAE75F |
    LDA.W #$0040                  ;$CAE763 |
    STA.W $64B6,Y                 ;$CAE766 |
    LDA.W #$9693                  ;$CAE769 |
    LDX.W #$00CC                  ;$CAE76C |
    JSL.L CODE_FL_00E1CC          ;$CAE76F |
    LDX.W Obj_VAR0,Y              ;$CAE773 |
    JMP.W (DATA8_15E779,X)        ;$CAE776 |

DATA8_15E779:
    db $C7,$E7,$1D,$E8,$43,$E8,$9D,$E8;$CAE779 |
    db $B3,$E8,$CD,$E8,$4F,$E9,$79,$E9;$CAE781 |
    db $8F,$E9,$A5,$E9,$BB,$E9,$1F,$EA;$CAE789 |
    db $49,$EB,$07,$EC,$73,$ED,$C2,$ED;$CAE791 |
    db $95,$EE,$DC,$EE,$27,$EF,$33,$EF;$CAE799 |
    db $3F,$EF,$8B,$EF,$BA,$EF,$F5,$EF;$CAE7A1 |
    db $41,$F0,$97,$F0,$ED,$F0,$1C,$F1;$CAE7A9 |
    db $57,$F1,$D0,$F1,$33,$F2,$49,$F2;$CAE7B1 |
    db $5F,$F2,$75,$F2,$8B,$F2,$A1,$F2;$CAE7B9 |
    db $03,$F3,$0F,$F3,$1B,$F3    ;$CAE7C1 |
    LDX.W #$00F0                  ;$CAE7C7 |
    LDY.W #$FF90                  ;$CAE7CA |
    LDA.W #$0002                  ;$CAE7CD |
    JSR.W CODE_FN_15F3AD          ;$CAE7D0 |
    LDX.W #$00C0                  ;$CAE7D3 |
    LDY.W #$0020                  ;$CAE7D6 |
    LDA.W #$0002                  ;$CAE7D9 |
    JSR.W CODE_FN_15F3AD          ;$CAE7DC |
    LDX.W #$0040                  ;$CAE7DF |
    LDY.W #$FFA0                  ;$CAE7E2 |
    LDA.W #$0002                  ;$CAE7E5 |
    JSR.W CODE_FN_15F3AD          ;$CAE7E8 |
    LDX.W #$FFC0                  ;$CAE7EB |
    LDY.W #$FFD0                  ;$CAE7EE |
    LDA.W #$0004                  ;$CAE7F1 |
    JSR.W CODE_FN_15F3AD          ;$CAE7F4 |
    LDX.W #$0000                  ;$CAE7F7 |
    LDY.W #$0040                  ;$CAE7FA |
    LDA.W #$0004                  ;$CAE7FD |
    JSR.W CODE_FN_15F3AD          ;$CAE800 |
    LDA.W #$FD80                  ;$CAE803 |
    LDX.W #$0700                  ;$CAE806 |
    JSL.L CODE_FL_00E539          ;$CAE809 |
    LDA.W #$000E                  ;$CAE80D |
    LDX.W #$FFE4                  ;$CAE810 |
    JSL.L CODE_FL_00E5CE          ;$CAE813 |

CODE_95E817:
    JSL.L CODE_FL_00E091          ;$CAE817 |
    BRA CODE_95E817               ;$CAE81B |
    JSL.L CODE_FL_00E307          ;$CAE81D |
    LDA.W #$0041                  ;$CAE821 |
    STA.W $64B6,Y                 ;$CAE824 |
    LDA.W #$E869                  ;$CAE827 |
    LDX.W #$00CA                  ;$CAE82A |
    JSL.L CODE_FL_00E1B7          ;$CAE82D |
    LDA.W #$000C                  ;$CAE831 |
    STA.W Obj_Pose,Y              ;$CAE834 |
    LDA.W #$FFF0                  ;$CAE837 |
    STA.W $6B6E,Y                 ;$CAE83A |

CODE_95E83D:
    JSL.L CODE_FL_00E091          ;$CAE83D |
    BRA CODE_95E83D               ;$CAE841 |
    JSL.L CODE_FL_00E307          ;$CAE843 |
    LDA.W #$0041                  ;$CAE847 |
    STA.W $64B6,Y                 ;$CAE84A |
    LDA.W #$E869                  ;$CAE84D |
    LDX.W #$00CA                  ;$CAE850 |
    JSL.L CODE_FL_00E1B7          ;$CAE853 |
    LDA.W #$000D                  ;$CAE857 |
    STA.W Obj_Pose,Y              ;$CAE85A |
    LDA.W #$FFF8                  ;$CAE85D |
    STA.W $6B6E,Y                 ;$CAE860 |

CODE_95E863:
    JSL.L CODE_FL_00E091          ;$CAE863 |
    BRA CODE_95E863               ;$CAE867 |
    LDX.W Obj_VAR2,Y              ;$CAE869 |
    LDA.W $6B6E,X                 ;$CAE86C |
    BMI CODE_95E884               ;$CAE86F |
    LDA.W Obj_XPositionMirror,Y   ;$CAE871 |
    BMI CODE_95E884               ;$CAE874 |
    CMP.W #$0118                  ;$CAE876 |
    BCC CODE_95E884               ;$CAE879 |
    LDA.W Obj_XPosition,Y         ;$CAE87B |
    SBC.W #$0150                  ;$CAE87E |
    STA.W Obj_XPosition,Y         ;$CAE881 |

CODE_95E884:
    LDA.W $6BE8,X                 ;$CAE884 |
    BPL CODE_95E89C               ;$CAE887 |
    LDA.W Obj_YPositionMirror,Y   ;$CAE889 |
    BPL CODE_95E89C               ;$CAE88C |
    CMP.W #$FFF0                  ;$CAE88E |
    BCS CODE_95E89C               ;$CAE891 |
    LDA.W Obj_YPosition,Y         ;$CAE893 |
    ADC.W #$0110                  ;$CAE896 |
    STA.W Obj_YPosition,Y         ;$CAE899 |

CODE_95E89C:
    RTL                           ;$CAE89C |
    LDA.W #$FB00                  ;$CAE89D |
    LDX.W #$0180                  ;$CAE8A0 |
    JSL.L CODE_FL_00E539          ;$CAE8A3 |
    LDA.W #$0000                  ;$CAE8A7 |
    LDX.W #$0018                  ;$CAE8AA |
    JSL.L CODE_FL_00E5CE          ;$CAE8AD |
    BRA CODE_95E8E5               ;$CAE8B1 |
    JSL.L CODE_FL_00E0EB          ;$CAE8B3 |
    LDA.W #$FB00                  ;$CAE8B7 |
    LDX.W #$0080                  ;$CAE8BA |
    JSL.L CODE_FL_00E539          ;$CAE8BD |
    LDA.W #$FFF8                  ;$CAE8C1 |
    LDX.W #$0010                  ;$CAE8C4 |
    JSL.L CODE_FL_00E5CE          ;$CAE8C7 |
    BRA CODE_95E8E5               ;$CAE8CB |
    JSL.L CODE_FL_00E14B          ;$CAE8CD |
    LDA.W #$FC00                  ;$CAE8D1 |
    LDX.W #$0300                  ;$CAE8D4 |
    JSL.L CODE_FL_00E539          ;$CAE8D7 |
    LDA.W #$FFFC                  ;$CAE8DB |
    LDX.W #$0010                  ;$CAE8DE |
    JSL.L CODE_FL_00E5CE          ;$CAE8E1 |

CODE_95E8E5:
    LDA.W #$9AEA                  ;$CAE8E5 |
    LDX.W #$00C5                  ;$CAE8E8 |
    JSL.L CODE_FL_00E1CC          ;$CAE8EB |
    LDA.W #$0006                  ;$CAE8EF |
    STA.W Obj_VAR8,Y              ;$CAE8F2 |

CODE_JP_15E8F5:
    LDX.W #$0000                  ;$CAE8F5 |
    LDY.W #$0000                  ;$CAE8F8 |
    LDA.W #$000C                  ;$CAE8FB |
    JSR.W CODE_FN_15F3AD          ;$CAE8FE |
    LDA.W #$0402                  ;$CAE901 |
    JSL.L CODE_FL_00E169          ;$CAE904 |
    LDX.W #$0000                  ;$CAE908 |
    LDY.W #$0000                  ;$CAE90B |
    LDA.W #$000C                  ;$CAE90E |
    JSR.W CODE_FN_15F3AD          ;$CAE911 |
    LDA.W #$0004                  ;$CAE914 |
    JSL.L CODE_FL_00E269          ;$CAE917 |
    LDX.W #$0000                  ;$CAE91B |
    LDY.W #$0000                  ;$CAE91E |
    LDA.W #$000C                  ;$CAE921 |
    JSR.W CODE_FN_15F3AD          ;$CAE924 |
    TYX                           ;$CAE927 |
    DEC.W Obj_Pose,X              ;$CAE928 |
    JSL.L CODE_FL_00E0A3          ;$CAE92B |
    LDX.W #$0000                  ;$CAE92F |
    LDY.W #$0000                  ;$CAE932 |
    LDA.W #$000C                  ;$CAE935 |
    JSR.W CODE_FN_15F3AD          ;$CAE938 |
    LDA.W #$0004                  ;$CAE93B |
    JSL.L CODE_FL_00E269          ;$CAE93E |
    TYX                           ;$CAE942 |
    DEC.W Obj_VAR8,X              ;$CAE943 |
    BEQ CODE_95E94B               ;$CAE946 |
    JMP.W CODE_JP_15E8F5          ;$CAE948 |

CODE_95E94B:
    JML.L DestroyUsedObject       ;$CAE94B |
    JSL.L CODE_FL_05E5D2          ;$CAE94F |
    LDA.W #$9AEA                  ;$CAE953 |
    LDX.W #$00C5                  ;$CAE956 |
    JSL.L CODE_FL_00E1CC          ;$CAE959 |
    LDA.W #$0200                  ;$CAE95D |
    LDX.W #$FE00                  ;$CAE960 |
    JSL.L CODE_FL_00E539          ;$CAE963 |
    LDA.W #$0302                  ;$CAE967 |
    JSL.L CODE_FL_00E169          ;$CAE96A |
    LDA.W #$0001                  ;$CAE96E |
    JSL.L CODE_FL_00E273          ;$CAE971 |
    JML.L DestroyUsedObject       ;$CAE975 |
    LDA.W #$F800                  ;$CAE979 |
    LDX.W #$0300                  ;$CAE97C |
    JSL.L CODE_FL_00E539          ;$CAE97F |
    LDA.W #$0060                  ;$CAE983 |
    LDX.W #$FFE8                  ;$CAE986 |
    JSL.L CODE_FL_00E5CE          ;$CAE989 |
    BRA CODE_95E9CF               ;$CAE98D |
    LDA.W #$FB00                  ;$CAE98F |
    LDX.W #$FB00                  ;$CAE992 |
    JSL.L CODE_FL_00E539          ;$CAE995 |
    LDA.W #$0040                  ;$CAE999 |
    LDX.W #$0048                  ;$CAE99C |
    JSL.L CODE_FL_00E5CE          ;$CAE99F |
    BRA CODE_95E9CF               ;$CAE9A3 |
    LDA.W #$FF00                  ;$CAE9A5 |
    LDX.W #$F800                  ;$CAE9A8 |
    JSL.L CODE_FL_00E539          ;$CAE9AB |
    LDA.W #$0010                  ;$CAE9AF |
    LDX.W #$0060                  ;$CAE9B2 |
    JSL.L CODE_FL_00E5CE          ;$CAE9B5 |
    BRA CODE_95E9CF               ;$CAE9B9 |
    LDA.W #$0500                  ;$CAE9BB |
    LDX.W #$FF00                  ;$CAE9BE |
    JSL.L CODE_FL_00E539          ;$CAE9C1 |
    LDA.W #$FFC8                  ;$CAE9C5 |
    LDX.W #$0008                  ;$CAE9C8 |
    JSL.L CODE_FL_00E5CE          ;$CAE9CB |

CODE_95E9CF:
    LDA.W #$0042                  ;$CAE9CF |
    STA.W $64B6,Y                 ;$CAE9D2 |
    LDA.W #$9AEA                  ;$CAE9D5 |
    LDX.W #$00C5                  ;$CAE9D8 |
    JSL.L CODE_FL_00E1CC          ;$CAE9DB |
    LDA.W #$0003                  ;$CAE9DF |
    STA.W Obj_VAR8,Y              ;$CAE9E2 |

CODE_JP_15E9E5:
    LDA.W #$0206                  ;$CAE9E5 |
    JSL.L CODE_FL_00E169          ;$CAE9E8 |
    TYX                           ;$CAE9EC |
    INC.W Obj_Pose,X              ;$CAE9ED |
    JSL.L CODE_FL_00E097          ;$CAE9F0 |
    TYX                           ;$CAE9F4 |
    INC.W Obj_Pose,X              ;$CAE9F5 |
    JSL.L CODE_FL_00E097          ;$CAE9F8 |
    TYX                           ;$CAE9FC |
    INC.W Obj_Pose,X              ;$CAE9FD |
    JSL.L CODE_FL_00E097          ;$CAEA00 |
    TYX                           ;$CAEA04 |
    DEC.W Obj_VAR8,X              ;$CAEA05 |
    BEQ CODE_95EA0D               ;$CAEA08 |
    JMP.W CODE_JP_15E9E5          ;$CAEA0A |

CODE_95EA0D:
    LDA.W #$0403                  ;$CAEA0D |
    JSL.L CODE_FL_00E169          ;$CAEA10 |
    LDA.W #$0400                  ;$CAEA14 |
    JSL.L CODE_FL_00E169          ;$CAEA17 |
    JML.L DestroyUsedObject       ;$CAEA1B |
    LDX.W #$0000                  ;$CAEA1F |
    LDY.W #$0080                  ;$CAEA22 |
    LDA.W #$001C                  ;$CAEA25 |
    JSR.W CODE_FN_15F3AD          ;$CAEA28 |
    LDX.W #$0000                  ;$CAEA2B |
    LDY.W #$0000                  ;$CAEA2E |
    LDA.W #$0022                  ;$CAEA31 |
    JSR.W CODE_FN_15F3AD          ;$CAEA34 |
    LDA.W #$AB72                  ;$CAEA37 |
    STA.W Obj_DrawCallback,Y      ;$CAEA3A |
    LDA.W #$FE80                  ;$CAEA3D |
    LDX.W #$0C00                  ;$CAEA40 |
    JSL.L CODE_FL_00E539          ;$CAEA43 |
    LDA.W #$FFA0                  ;$CAEA47 |
    LDX.W #$FF80                  ;$CAEA4A |
    JSL.L CODE_FL_00E5CE          ;$CAEA4D |
    LDA.W #$1000                  ;$CAEA51 |
    JSL.L CODE_FL_00E169          ;$CAEA54 |
    LDA.W #$0070                  ;$CAEA58 |
    LDX.W #$FF90                  ;$CAEA5B |
    LDY.W #$0010                  ;$CAEA5E |
    JSL.L CODE_FL_00E617          ;$CAEA61 |
    LDA.W #$0020                  ;$CAEA65 |
    LDX.W #$FFF0                  ;$CAEA68 |
    LDY.W #$000A                  ;$CAEA6B |
    JSL.L CODE_FL_00E617          ;$CAEA6E |
    LDX.W #$0000                  ;$CAEA72 |
    LDY.W #$0000                  ;$CAEA75 |
    LDA.W #$002A                  ;$CAEA78 |
    JSR.W CODE_FN_15F3AD          ;$CAEA7B |
    LDX.W #$0000                  ;$CAEA7E |
    LDY.W #$0000                  ;$CAEA81 |
    LDA.W #$002C                  ;$CAEA84 |
    JSR.W CODE_FN_15F3AD          ;$CAEA87 |
    LDA.W #$FA00                  ;$CAEA8A |
    LDX.W #$0600                  ;$CAEA8D |
    JSL.L CODE_FL_00E539          ;$CAEA90 |
    LDA.W #$0040                  ;$CAEA94 |
    LDX.W #$0020                  ;$CAEA97 |
    LDY.W #$0008                  ;$CAEA9A |
    JSL.L CODE_FL_00E617          ;$CAEA9D |
    LDX.W #$0000                  ;$CAEAA1 |
    LDY.W #$0000                  ;$CAEAA4 |
    LDA.W #$0022                  ;$CAEAA7 |
    JSR.W CODE_FN_15F3AD          ;$CAEAAA |
    LDA.W #$00A0                  ;$CAEAAD |
    LDX.W #$FFA0                  ;$CAEAB0 |
    LDY.W #$0014                  ;$CAEAB3 |
    JSL.L CODE_FL_00E617          ;$CAEAB6 |
    LDX.W #$0000                  ;$CAEABA |
    LDY.W #$0000                  ;$CAEABD |
    LDA.W #$002C                  ;$CAEAC0 |
    JSR.W CODE_FN_15F3AD          ;$CAEAC3 |
    LDA.W #$FFA0                  ;$CAEAC6 |
    LDX.W #$FFA0                  ;$CAEAC9 |
    LDY.W #$0010                  ;$CAEACC |
    JSL.L CODE_FL_00E617          ;$CAEACF |
    LDA.W #$FFA0                  ;$CAEAD3 |
    LDX.W #$0040                  ;$CAEAD6 |
    LDY.W #$000A                  ;$CAEAD9 |
    JSL.L CODE_FL_00E617          ;$CAEADC |
    LDA.W #$0000                  ;$CAEAE0 |
    LDX.W #$0060                  ;$CAEAE3 |
    LDY.W #$0004                  ;$CAEAE6 |
    JSL.L CODE_FL_00E617          ;$CAEAE9 |
    LDX.W #$0000                  ;$CAEAED |
    LDY.W #$0000                  ;$CAEAF0 |
    LDA.W #$002A                  ;$CAEAF3 |
    JSR.W CODE_FN_15F3AD          ;$CAEAF6 |
    LDX.W #$0000                  ;$CAEAF9 |
    LDY.W #$0000                  ;$CAEAFC |
    LDA.W #$0022                  ;$CAEAFF |
    JSR.W CODE_FN_15F3AD          ;$CAEB02 |
    LDA.W #$FC00                  ;$CAEB05 |
    LDX.W #$0600                  ;$CAEB08 |
    JSL.L CODE_FL_00E539          ;$CAEB0B |
    LDA.W #$FFE0                  ;$CAEB0F |
    LDX.W #$FFE0                  ;$CAEB12 |
    LDY.W #$0010                  ;$CAEB15 |
    JSL.L CODE_FL_00E617          ;$CAEB18 |
    LDA.W #$0000                  ;$CAEB1C |
    LDX.W #$FF90                  ;$CAEB1F |
    JSL.L CODE_FL_00E5CE          ;$CAEB22 |
    LDA.W #$0005                  ;$CAEB26 |
    STA.W Obj_VAR8,Y              ;$CAEB29 |

CODE_JP_15EB2C:
    LDX.W #$0000                  ;$CAEB2C |
    LDY.W #$0000                  ;$CAEB2F |
    LDA.W #$002C                  ;$CAEB32 |
    JSR.W CODE_FN_15F3AD          ;$CAEB35 |
    JSL.L CODE_FL_00E0AF          ;$CAEB38 |
    TYX                           ;$CAEB3C |
    DEC.W Obj_VAR8,X              ;$CAEB3D |
    BEQ CODE_95EB45               ;$CAEB40 |
    JMP.W CODE_JP_15EB2C          ;$CAEB42 |

CODE_95EB45:
    JML.L DestroyUsedObject       ;$CAEB45 |
    LDA.W #$AB72                  ;$CAEB49 |
    STA.W Obj_DrawCallback,Y      ;$CAEB4C |
    LDA.W #$0600                  ;$CAEB4F |
    LDX.W #$0000                  ;$CAEB52 |
    JSL.L CODE_FL_00E539          ;$CAEB55 |
    LDA.W #$00B0                  ;$CAEB59 |
    LDX.W #$FFC0                  ;$CAEB5C |
    JSL.L CODE_FL_00E5CE          ;$CAEB5F |
    LDA.W #$0001                  ;$CAEB63 |
    STA.W Obj_Pose,Y              ;$CAEB66 |
    LDA.W #$0006                  ;$CAEB69 |
    STA.W Obj_VAR8,Y              ;$CAEB6C |

CODE_JP_15EB6F:
    LDX.W #$0000                  ;$CAEB6F |
    LDY.W #$0000                  ;$CAEB72 |
    LDA.W #$0030                  ;$CAEB75 |
    JSR.W CODE_FN_15F3AD          ;$CAEB78 |
    JSL.L CODE_FL_00E0A3          ;$CAEB7B |
    TYX                           ;$CAEB7F |
    DEC.W Obj_VAR8,X              ;$CAEB80 |
    BEQ CODE_95EB88               ;$CAEB83 |
    JMP.W CODE_JP_15EB6F          ;$CAEB85 |

CODE_95EB88:
    LDA.W #$0014                  ;$CAEB88 |
    JSL.L CODE_FL_00E473          ;$CAEB8B |
    LDA.W #$00D0                  ;$CAEB8F |
    LDX.W #$FFE0                  ;$CAEB92 |
    JSL.L CODE_FL_00E2E4          ;$CAEB95 |
    LDA.W #$FE00                  ;$CAEB99 |
    LDX.W #$0980                  ;$CAEB9C |
    JSL.L CODE_FL_00E539          ;$CAEB9F |
    LDA.W #$0000                  ;$CAEBA3 |
    LDX.W #$FFC0                  ;$CAEBA6 |
    JSL.L CODE_FL_00E5CE          ;$CAEBA9 |
    LDX.W #$00C8                  ;$CAEBAD |
    LDY.W #$00F0                  ;$CAEBB0 |
    LDA.W #$002E                  ;$CAEBB3 |
    JSR.W CODE_FN_15F3AD          ;$CAEBB6 |
    LDA.W #$0007                  ;$CAEBB9 |
    STA.W Obj_VAR8,Y              ;$CAEBBC |

CODE_JP_15EBBF:
    LDX.W #$0000                  ;$CAEBBF |
    LDY.W #$0000                  ;$CAEBC2 |
    LDA.W #$0032                  ;$CAEBC5 |
    JSR.W CODE_FN_15F3AD          ;$CAEBC8 |
    JSL.L CODE_FL_00E0AF          ;$CAEBCB |
    TYX                           ;$CAEBCF |
    DEC.W Obj_VAR8,X              ;$CAEBD0 |
    BEQ CODE_95EBD8               ;$CAEBD3 |
    JMP.W CODE_JP_15EBBF          ;$CAEBD5 |

CODE_95EBD8:
    LDX.W #$0000                  ;$CAEBD8 |
    LDY.W #$0000                  ;$CAEBDB |
    LDA.W #$0034                  ;$CAEBDE |
    JSR.W CODE_FN_15F3AD          ;$CAEBE1 |
    LDA.W #$0007                  ;$CAEBE4 |
    STA.W Obj_VAR8,Y              ;$CAEBE7 |

CODE_JP_15EBEA:
    LDX.W #$0000                  ;$CAEBEA |
    LDY.W #$0000                  ;$CAEBED |
    LDA.W #$0036                  ;$CAEBF0 |
    JSR.W CODE_FN_15F3AD          ;$CAEBF3 |
    JSL.L CODE_FL_00E0AF          ;$CAEBF6 |
    TYX                           ;$CAEBFA |
    DEC.W Obj_VAR8,X              ;$CAEBFB |
    BEQ CODE_95EC03               ;$CAEBFE |
    JMP.W CODE_JP_15EBEA          ;$CAEC00 |

CODE_95EC03:
    JML.L DestroyUsedObject       ;$CAEC03 |

    TYX                           ;$CAEC07 |
    STZ.W Obj_VAR0,X              ;$CAEC08 |
    STZ.W Obj_VAR1,X              ;$CAEC0B |
    LDA.W #$EC73                  ;$CAEC0E |
    LDX.W #$00CA                  ;$CAEC11 |
    JSL.L CODE_FL_00E1B7          ;$CAEC14 |
    LDA.W #$0028                  ;$CAEC18 |
    JSL.L CODE_FL_00E17F          ;$CAEC1B |
    LDY.W #$0002                  ;$CAEC1F |
    LDA.W #$0800                  ;$CAEC22 |
    LDX.W #$FF80                  ;$CAEC25 |
    JSR.W CODE_FN_15F361          ;$CAEC28 |
    LDA.W #$FFE0                  ;$CAEC2B |
    STA.W Obj_VAR0,Y              ;$CAEC2E |
    LDA.W #$FFFD                  ;$CAEC31 |
    STA.W Obj_VAR1,Y              ;$CAEC34 |
    LDA.W #$0032                  ;$CAEC37 |
    JSL.L CODE_FL_00E17F          ;$CAEC3A |
    LDA.W #$FFF0                  ;$CAEC3E |
    STA.W Obj_VAR0,Y              ;$CAEC41 |
    LDA.W #$0000                  ;$CAEC44 |
    STA.W Obj_VAR1,Y              ;$CAEC47 |
    LDA.W #$0032                  ;$CAEC4A |
    JSL.L CODE_FL_00E17F          ;$CAEC4D |
    LDA.W #$FFE0                  ;$CAEC51 |
    STA.W Obj_VAR0,Y              ;$CAEC54 |
    LDA.W #$FFD0                  ;$CAEC57 |
    STA.W Obj_VAR1,Y              ;$CAEC5A |
    JSL.L CODE_FL_00E103          ;$CAEC5D |
    LDA.W #$0008                  ;$CAEC61 |
    STA.W Obj_VAR0,Y              ;$CAEC64 |
    LDA.W #$FFD0                  ;$CAEC67 |
    STA.W Obj_VAR1,Y              ;$CAEC6A |

CODE_95EC6D:
    JSL.L CODE_FL_00E091          ;$CAEC6D |
    BRA CODE_95EC6D               ;$CAEC71 |
    LDA.W Obj_VAR0,Y              ;$CAEC73 |
    JSL.L CODE_FL_03AC43          ;$CAEC76 |
    PHA                           ;$CAEC7A |
    TXA                           ;$CAEC7B |
    CLC                           ;$CAEC7C |
    ADC.W $734C                   ;$CAEC7D |
    STA.W $734C                   ;$CAEC80 |
    PLA                           ;$CAEC83 |
    ADC.W $733C                   ;$CAEC84 |
    STA.W $733C                   ;$CAEC87 |
    LDA.W $3045                   ;$CAEC8A |
    CLC                           ;$CAEC8D |
    ADC.W $734C                   ;$CAEC8E |
    STA.W $3045                   ;$CAEC91 |
    LDA.W $3039                   ;$CAEC94 |
    ADC.W $733C                   ;$CAEC97 |
    STA.W $3039                   ;$CAEC9A |
    LDA.W Obj_VAR1,Y              ;$CAEC9D |
    JSL.L CODE_FL_03AC43          ;$CAECA0 |
    PHA                           ;$CAECA4 |
    TXA                           ;$CAECA5 |
    CLC                           ;$CAECA6 |
    ADC.W $7354                   ;$CAECA7 |
    STA.W $7354                   ;$CAECAA |
    PLA                           ;$CAECAD |
    ADC.W $7344                   ;$CAECAE |
    STA.W $7344                   ;$CAECB1 |
    LDA.W $304B                   ;$CAECB4 |
    CLC                           ;$CAECB7 |
    ADC.W $7354                   ;$CAECB8 |
    STA.W $304B                   ;$CAECBB |
    LDA.W $303F                   ;$CAECBE |
    ADC.W $7344                   ;$CAECC1 |
    STA.W $303F                   ;$CAECC4 |
    LDA.W #$ECD1                  ;$CAECC7 |
    LDX.W #$00CA                  ;$CAECCA |
    JML.L SA1_ExecuteSNES         ;$CAECCD |

CODE_JP_15ECD1:
    LDX.W #$0000                  ;$CAECD1 |
    LDA.W #$00FF                  ;$CAECD4 |
    SEC                           ;$CAECD7 |
    SBC.W $303F                   ;$CAECD8 |
    BCS CODE_95ECE1               ;$CAECDB |
    STZ.B IdentifySNES            ;$CAECDD |
    BRA CODE_95ED21               ;$CAECDF |

CODE_95ECE1:
    STA.B IdentifySNES            ;$CAECE1 |
    CMP.W #$0080                  ;$CAECE3 |
    BCC CODE_95ED09               ;$CAECE6 |
    LDA.W #$007F                  ;$CAECE8 |
    STA.L $7F7870,X               ;$CAECEB |
    STA.L $7F7A70,X               ;$CAECEF |
    LDA.W #$0001                  ;$CAECF3 |
    STA.L $7F7871,X               ;$CAECF6 |
    LDA.W #$0012                  ;$CAECFA |
    STA.L $7F7A71,X               ;$CAECFD |
    INX                           ;$CAED01 |
    INX                           ;$CAED02 |
    LDA.B IdentifySNES            ;$CAED03 |
    SEC                           ;$CAED05 |
    SBC.W #$007F                  ;$CAED06 |

CODE_95ED09:
    STA.L $7F7870,X               ;$CAED09 |
    STA.L $7F7A70,X               ;$CAED0D |
    LDA.W #$0001                  ;$CAED11 |
    STA.L $7F7871,X               ;$CAED14 |
    LDA.W #$0012                  ;$CAED18 |
    STA.L $7F7A71,X               ;$CAED1B |
    INX                           ;$CAED1F |
    INX                           ;$CAED20 |

CODE_95ED21:
    LDA.W #$00E0                  ;$CAED21 |
    SEC                           ;$CAED24 |
    SBC.B IdentifySNES            ;$CAED25 |
    BCC CODE_95ED67               ;$CAED27 |
    STA.B IdentifySNES            ;$CAED29 |
    CMP.W #$0080                  ;$CAED2B |
    BCC CODE_95ED51               ;$CAED2E |
    LDA.W #$007F                  ;$CAED30 |
    STA.L $7F7870,X               ;$CAED33 |
    STA.L $7F7A70,X               ;$CAED37 |
    LDA.W #$0007                  ;$CAED3B |
    STA.L $7F7871,X               ;$CAED3E |
    LDA.W #$0011                  ;$CAED42 |
    STA.L $7F7A71,X               ;$CAED45 |
    INX                           ;$CAED49 |
    INX                           ;$CAED4A |
    LDA.B IdentifySNES            ;$CAED4B |
    SEC                           ;$CAED4D |
    SBC.W #$007F                  ;$CAED4E |

CODE_95ED51:
    STA.L $7F7870,X               ;$CAED51 |
    STA.L $7F7A70,X               ;$CAED55 |
    LDA.W #$0007                  ;$CAED59 |
    STA.L $7F7871,X               ;$CAED5C |
    LDA.W #$0011                  ;$CAED60 |
    STA.L $7F7A71,X               ;$CAED63 |

CODE_95ED67:
    LDA.W #$0000                  ;$CAED67 |
    STA.L $7F7872,X               ;$CAED6A |
    STA.L $7F7A72,X               ;$CAED6E |
    RTL                           ;$CAED72 |
    JSL.L CODE_FL_00E31E          ;$CAED73 |
    LDX.W #$0000                  ;$CAED77 |
    LDY.W #$0000                  ;$CAED7A |
    LDA.W #$001E                  ;$CAED7D |
    JSR.W CODE_FN_15F3AD          ;$CAED80 |
    LDA.W #$0000                  ;$CAED83 |
    LDX.W #$0000                  ;$CAED86 |
    JSL.L CODE_FL_00E5CE          ;$CAED89 |
    LDA.W #$0000                  ;$CAED8D |
    LDX.W #$FD00                  ;$CAED90 |
    LDY.W #$0020                  ;$CAED93 |
    JSL.L CODE_FL_00E582          ;$CAED96 |
    LDA.W #$0000                  ;$CAED9A |
    LDX.W #$0026                  ;$CAED9D |
    JSL.L CODE_FL_00E55E          ;$CAEDA0 |
    LDA.W #$0280                  ;$CAEDA4 |
    LDX.W #$001E                  ;$CAEDA7 |
    JSL.L CODE_FL_00E55E          ;$CAEDAA |
    LDA.W #$0080                  ;$CAEDAE |
    STA.W $6CDC,Y                 ;$CAEDB1 |
    LDA.W #$F700                  ;$CAEDB4 |
    LDX.W #$0030                  ;$CAEDB7 |
    JSL.L CODE_FL_00E55E          ;$CAEDBA |
    JML.L DestroyUsedObject       ;$CAEDBE |
    JSL.L CODE_FL_00E307          ;$CAEDC2 |
    LDA.W #$AB72                  ;$CAEDC6 |
    STA.W Obj_DrawCallback,Y      ;$CAEDC9 |
    LDA.W #$003D                  ;$CAEDCC |
    STA.W $64B6,Y                 ;$CAEDCF |
    LDA.W #$0005                  ;$CAEDD2 |
    STA.W Obj_VAR8,Y              ;$CAEDD5 |

CODE_95EDD8:
    LDA.W #$EDE1                  ;$CAEDD8 |
    STA.W Obj_VAR6,Y              ;$CAEDDB |
    JMP.W CODE_JP_15EE3F          ;$CAEDDE |
    TYX                           ;$CAEDE1 |
    DEC.W Obj_VAR8,X              ;$CAEDE2 |
    BNE CODE_95EDD8               ;$CAEDE5 |
    LDA.W #$0007                  ;$CAEDE7 |
    STA.W Obj_VAR8,Y              ;$CAEDEA |

CODE_95EDED:
    LDA.W #$EDF6                  ;$CAEDED |
    STA.W Obj_VAR6,Y              ;$CAEDF0 |
    JMP.W CODE_JP_15EE5C          ;$CAEDF3 |
    TYX                           ;$CAEDF6 |
    DEC.W Obj_VAR8,X              ;$CAEDF7 |
    BNE CODE_95EDED               ;$CAEDFA |
    LDA.W #$0007                  ;$CAEDFC |
    STA.W Obj_VAR8,Y              ;$CAEDFF |

CODE_95EE02:
    LDA.W #$EE0B                  ;$CAEE02 |
    STA.W Obj_VAR6,Y              ;$CAEE05 |
    JMP.W CODE_JP_15EE3F          ;$CAEE08 |
    TYX                           ;$CAEE0B |
    DEC.W Obj_VAR8,X              ;$CAEE0C |
    BNE CODE_95EE02               ;$CAEE0F |
    LDA.W #$0003                  ;$CAEE11 |
    STA.W Obj_VAR8,Y              ;$CAEE14 |

CODE_95EE17:
    LDA.W #$EE20                  ;$CAEE17 |
    STA.W Obj_VAR6,Y              ;$CAEE1A |
    JMP.W CODE_JP_15EE5C          ;$CAEE1D |
    TYX                           ;$CAEE20 |
    DEC.W Obj_VAR8,X              ;$CAEE21 |
    BNE CODE_95EE17               ;$CAEE24 |
    LDA.W #$0004                  ;$CAEE26 |
    STA.W Obj_VAR8,Y              ;$CAEE29 |

CODE_95EE2C:
    LDA.W #$EE35                  ;$CAEE2C |
    STA.W Obj_VAR6,Y              ;$CAEE2F |
    JMP.W CODE_JP_15EE3F          ;$CAEE32 |
    TYX                           ;$CAEE35 |
    DEC.W Obj_VAR8,X              ;$CAEE36 |
    BNE CODE_95EE2C               ;$CAEE39 |
    JML.L DestroyUsedObject       ;$CAEE3B |

CODE_JP_15EE3F:
    LDA.W #$0202                  ;$CAEE3F |
    JSL.L CODE_FL_00E169          ;$CAEE42 |
    LDA.W #$0002                  ;$CAEE46 |
    JSL.L CODE_FL_00E269          ;$CAEE49 |
    LDA.W #$0002                  ;$CAEE4D |
    JSL.L CODE_FL_00E269          ;$CAEE50 |
    LDA.W Obj_VAR6,Y              ;$CAEE54 |
    STA.B IdentifySNES            ;$CAEE57 |
    JMP.W ($3700)                 ;$CAEE59 |

CODE_JP_15EE5C:
    LDX.W #$0000                  ;$CAEE5C |
    LDY.W #$0000                  ;$CAEE5F |
    LDA.W #$0020                  ;$CAEE62 |
    JSR.W CODE_FN_15F3AD          ;$CAEE65 |
    LDA.W #$0202                  ;$CAEE68 |
    JSL.L CODE_FL_00E169          ;$CAEE6B |
    LDA.W #$0001                  ;$CAEE6F |
    JSL.L CODE_FL_00E269          ;$CAEE72 |
    LDX.W #$0000                  ;$CAEE76 |
    LDY.W #$0000                  ;$CAEE79 |
    LDA.W #$0020                  ;$CAEE7C |
    JSR.W CODE_FN_15F3AD          ;$CAEE7F |
    JSL.L CODE_FL_00E091          ;$CAEE82 |
    LDA.W #$0002                  ;$CAEE86 |
    JSL.L CODE_FL_00E269          ;$CAEE89 |
    LDA.W Obj_VAR6,Y              ;$CAEE8D |
    STA.B IdentifySNES            ;$CAEE90 |
    JMP.W ($3700)                 ;$CAEE92 |
    JSL.L CODE_FL_05E5D2          ;$CAEE95 |
    LDA.W #$AB72                  ;$CAEE99 |
    STA.W Obj_DrawCallback,Y      ;$CAEE9C |
    LDA.W #$003C                  ;$CAEE9F |
    STA.W $64B6,Y                 ;$CAEEA2 |
    LDA.W #$0190                  ;$CAEEA5 |
    LDX.W #$FC00                  ;$CAEEA8 |
    JSL.L CODE_FL_00E539          ;$CAEEAB |
    LDA.W #$0000                  ;$CAEEAF |
    LDX.W #$0020                  ;$CAEEB2 |
    JSL.L CODE_FL_00E5CE          ;$CAEEB5 |
    LDA.W #$0408                  ;$CAEEB9 |
    JSL.L CODE_FL_00E169          ;$CAEEBC |
    TYX                           ;$CAEEC0 |
    INC.W Obj_Pose,X              ;$CAEEC1 |
    JSL.L CODE_FL_00E0A3          ;$CAEEC4 |
    TYX                           ;$CAEEC8 |
    INC.W Obj_Pose,X              ;$CAEEC9 |
    JSL.L CODE_FL_00E0A3          ;$CAEECC |
    TYX                           ;$CAEED0 |
    INC.W Obj_Pose,X              ;$CAEED1 |
    JSL.L CODE_FL_00E0A3          ;$CAEED4 |
    JML.L DestroyUsedObject       ;$CAEED8 |
    JSL.L CODE_FL_00E307          ;$CAEEDC |
    LDA.W #$0003                  ;$CAEEE0 |
    STA.W Obj_VAR8,Y              ;$CAEEE3 |

CODE_JP_15EEE6:
    LDX.W #$0000                  ;$CAEEE6 |
    LDY.W #$0000                  ;$CAEEE9 |
    LDA.W #$0024                  ;$CAEEEC |
    JSR.W CODE_FN_15F3AD          ;$CAEEEF |
    JSL.L CODE_FL_00E0A3          ;$CAEEF2 |
    LDX.W #$0000                  ;$CAEEF6 |
    LDY.W #$0000                  ;$CAEEF9 |
    LDA.W #$0026                  ;$CAEEFC |
    JSR.W CODE_FN_15F3AD          ;$CAEEFF |
    JSL.L CODE_FL_00E0A3          ;$CAEF02 |
    LDX.W #$0000                  ;$CAEF06 |
    LDY.W #$0000                  ;$CAEF09 |
    LDA.W #$0028                  ;$CAEF0C |
    JSR.W CODE_FN_15F3AD          ;$CAEF0F |
    JSL.L CODE_FL_00E0A3          ;$CAEF12 |
    TYX                           ;$CAEF16 |
    DEC.W Obj_VAR8,X              ;$CAEF17 |
    BEQ CODE_95EF1F               ;$CAEF1A |
    JMP.W CODE_JP_15EEE6          ;$CAEF1C |

CODE_95EF1F:
    JSL.L CODE_FL_00E11B          ;$CAEF1F |
    JML.L DestroyUsedObject       ;$CAEF23 |
    LDA.W #$0500                  ;$CAEF27 |
    LDX.W #$F900                  ;$CAEF2A |
    JSL.L CODE_FL_00E539          ;$CAEF2D |
    BRA CODE_95EF49               ;$CAEF31 |
    LDA.W #$0600                  ;$CAEF33 |
    LDX.W #$FA00                  ;$CAEF36 |
    JSL.L CODE_FL_00E539          ;$CAEF39 |
    BRA CODE_95EF49               ;$CAEF3D |
    LDA.W #$0700                  ;$CAEF3F |
    LDX.W #$FB00                  ;$CAEF42 |
    JSL.L CODE_FL_00E539          ;$CAEF45 |

CODE_95EF49:
    JSL.L CODE_FL_05E5D2          ;$CAEF49 |
    LDA.W #$AB72                  ;$CAEF4D |
    STA.W Obj_DrawCallback,Y      ;$CAEF50 |
    LDA.W #$9AEA                  ;$CAEF53 |
    LDX.W #$00C5                  ;$CAEF56 |
    JSL.L CODE_FL_00E1CC          ;$CAEF59 |
    LDA.W #$003F                  ;$CAEF5D |
    STA.W $64B6,Y                 ;$CAEF60 |
    LDA.W #$0302                  ;$CAEF63 |
    JSL.L CODE_FL_00E169          ;$CAEF66 |
    LDA.W #$0003                  ;$CAEF6A |
    JSL.L CODE_FL_00E269          ;$CAEF6D |
    TYX                           ;$CAEF71 |
    DEC.W Obj_Pose,X              ;$CAEF72 |
    JSL.L CODE_FL_00E09D          ;$CAEF75 |
    LDA.W #$0003                  ;$CAEF79 |
    JSL.L CODE_FL_00E269          ;$CAEF7C |
    LDA.W #$0400                  ;$CAEF80 |
    JSL.L CODE_FL_00E169          ;$CAEF83 |
    JML.L DestroyUsedObject       ;$CAEF87 |
    JSL.L CODE_FL_05E5D2          ;$CAEF8B |
    LDA.W #$AB72                  ;$CAEF8F |
    STA.W Obj_DrawCallback,Y      ;$CAEF92 |
    LDA.W #$003E                  ;$CAEF95 |
    STA.W $64B6,Y                 ;$CAEF98 |
    LDA.W #$9AEA                  ;$CAEF9B |
    LDX.W #$00C5                  ;$CAEF9E |
    JSL.L CODE_FL_00E1CC          ;$CAEFA1 |
    LDA.W #$0800                  ;$CAEFA5 |
    LDX.W #$F800                  ;$CAEFA8 |
    JSL.L CODE_FL_00E539          ;$CAEFAB |
    LDA.W #$0419                  ;$CAEFAF |
    JSL.L CODE_FL_00E169          ;$CAEFB2 |
    JML.L DestroyUsedObject       ;$CAEFB6 |
    LDA.W #$003F                  ;$CAEFBA |
    STA.W $64B6,Y                 ;$CAEFBD |
    JSL.L CODE_FL_05E5D2          ;$CAEFC0 |
    LDA.W #$AB72                  ;$CAEFC4 |
    STA.W Obj_DrawCallback,Y      ;$CAEFC7 |
    LDA.W #$0100                  ;$CAEFCA |
    LDX.W #$FF00                  ;$CAEFCD |
    JSL.L CODE_FL_00E539          ;$CAEFD0 |
    LDA.W #$0004                  ;$CAEFD4 |
    STA.W Obj_VAR8,Y              ;$CAEFD7 |

CODE_JP_15EFDA:
    LDA.W #$01FF                  ;$CAEFDA |
    JSL.L CODE_FL_00E169          ;$CAEFDD |
    LDA.W #$0100                  ;$CAEFE1 |
    JSL.L CODE_FL_00E169          ;$CAEFE4 |
    TYX                           ;$CAEFE8 |
    DEC.W Obj_VAR8,X              ;$CAEFE9 |
    BEQ CODE_95EFF1               ;$CAEFEC |
    JMP.W CODE_JP_15EFDA          ;$CAEFEE |

CODE_95EFF1:
    JML.L DestroyUsedObject       ;$CAEFF1 |
    JSL.L CODE_FL_00E0BB          ;$CAEFF5 |
    LDA.W #$003D                  ;$CAEFF9 |
    STA.W $64B6,Y                 ;$CAEFFC |
    LDA.W #$AB72                  ;$CAEFFF |
    STA.W Obj_DrawCallback,Y      ;$CAF002 |
    LDA.W #$FE00                  ;$CAF005 |
    LDX.W #$FC00                  ;$CAF008 |
    JSL.L CODE_FL_00E539          ;$CAF00B |
    LDA.W #$0000                  ;$CAF00F |
    LDX.W #$0030                  ;$CAF012 |
    JSL.L CODE_FL_00E5CE          ;$CAF015 |
    LDA.W #$000A                  ;$CAF019 |
    STA.W Obj_VAR8,Y              ;$CAF01C |

CODE_JP_15F01F:
    LDA.W #$0203                  ;$CAF01F |
    JSL.L CODE_FL_00E169          ;$CAF022 |
    LDA.W #$0002                  ;$CAF026 |
    JSL.L CODE_FL_00E269          ;$CAF029 |
    LDA.W #$0002                  ;$CAF02D |
    JSL.L CODE_FL_00E269          ;$CAF030 |
    TYX                           ;$CAF034 |
    DEC.W Obj_VAR8,X              ;$CAF035 |
    BEQ CODE_95F03D               ;$CAF038 |
    JMP.W CODE_JP_15F01F          ;$CAF03A |

CODE_95F03D:
    JML.L DestroyUsedObject       ;$CAF03D |
    JSL.L CODE_FL_05E5D2          ;$CAF041 |
    LDA.W #$AB72                  ;$CAF045 |
    STA.W Obj_DrawCallback,Y      ;$CAF048 |
    LDA.W #$9AEA                  ;$CAF04B |
    LDX.W #$00C5                  ;$CAF04E |
    JSL.L CODE_FL_00E1CC          ;$CAF051 |
    LDA.W #$0043                  ;$CAF055 |
    STA.W $64B6,Y                 ;$CAF058 |
    LDA.W #$0800                  ;$CAF05B |
    LDX.W #$0200                  ;$CAF05E |
    JSL.L CODE_FL_00E539          ;$CAF061 |
    LDA.W #$FF40                  ;$CAF065 |
    LDX.W #$FFF0                  ;$CAF068 |
    JSL.L CODE_FL_00E5CE          ;$CAF06B |
    LDA.W #$0302                  ;$CAF06F |
    JSL.L CODE_FL_00E169          ;$CAF072 |
    LDA.W #$0003                  ;$CAF076 |
    JSL.L CODE_FL_00E269          ;$CAF079 |
    TYX                           ;$CAF07D |
    DEC.W Obj_Pose,X              ;$CAF07E |
    JSL.L CODE_FL_00E09D          ;$CAF081 |
    LDA.W #$0003                  ;$CAF085 |
    JSL.L CODE_FL_00E269          ;$CAF088 |
    LDA.W #$0400                  ;$CAF08C |
    JSL.L CODE_FL_00E169          ;$CAF08F |
    JML.L DestroyUsedObject       ;$CAF093 |
    JSL.L CODE_FL_05E5D2          ;$CAF097 |
    LDA.W #$AB72                  ;$CAF09B |
    STA.W Obj_DrawCallback,Y      ;$CAF09E |
    LDA.W #$9AEA                  ;$CAF0A1 |
    LDX.W #$00C5                  ;$CAF0A4 |
    JSL.L CODE_FL_00E1CC          ;$CAF0A7 |
    LDA.W #$0043                  ;$CAF0AB |
    STA.W $64B6,Y                 ;$CAF0AE |
    LDA.W #$0000                  ;$CAF0B1 |
    LDX.W #$0400                  ;$CAF0B4 |
    JSL.L CODE_FL_00E539          ;$CAF0B7 |
    LDA.W #$0080                  ;$CAF0BB |
    LDX.W #$FF40                  ;$CAF0BE |
    JSL.L CODE_FL_00E5CE          ;$CAF0C1 |
    LDA.W #$0302                  ;$CAF0C5 |
    JSL.L CODE_FL_00E169          ;$CAF0C8 |
    LDA.W #$0004                  ;$CAF0CC |
    JSL.L CODE_FL_00E269          ;$CAF0CF |
    TYX                           ;$CAF0D3 |
    DEC.W Obj_Pose,X              ;$CAF0D4 |
    JSL.L CODE_FL_00E0A3          ;$CAF0D7 |
    LDA.W #$0004                  ;$CAF0DB |
    JSL.L CODE_FL_00E269          ;$CAF0DE |
    LDA.W #$0400                  ;$CAF0E2 |
    JSL.L CODE_FL_00E169          ;$CAF0E5 |
    JML.L DestroyUsedObject       ;$CAF0E9 |
    JSL.L CODE_FL_05E5D2          ;$CAF0ED |
    LDA.W #$AB72                  ;$CAF0F1 |
    STA.W Obj_DrawCallback,Y      ;$CAF0F4 |
    LDA.W #$0042                  ;$CAF0F7 |
    STA.W $64B6,Y                 ;$CAF0FA |
    LDA.W #$9AEA                  ;$CAF0FD |
    LDX.W #$00C5                  ;$CAF100 |
    JSL.L CODE_FL_00E1CC          ;$CAF103 |
    LDA.W #$0A00                  ;$CAF107 |
    LDX.W #$0100                  ;$CAF10A |
    JSL.L CODE_FL_00E539          ;$CAF10D |
    LDA.W #$0419                  ;$CAF111 |
    JSL.L CODE_FL_00E169          ;$CAF114 |
    JML.L DestroyUsedObject       ;$CAF118 |
    JSL.L CODE_FL_05E5D2          ;$CAF11C |
    LDA.W #$AB72                  ;$CAF120 |
    STA.W Obj_DrawCallback,Y      ;$CAF123 |
    LDA.W #$0041                  ;$CAF126 |
    STA.W $64B6,Y                 ;$CAF129 |
    LDA.W #$0100                  ;$CAF12C |
    LDX.W #$0100                  ;$CAF12F |
    JSL.L CODE_FL_00E539          ;$CAF132 |
    LDA.W #$0003                  ;$CAF136 |
    STA.W Obj_VAR8,Y              ;$CAF139 |

CODE_JP_15F13C:
    LDA.W #$01FF                  ;$CAF13C |
    JSL.L CODE_FL_00E169          ;$CAF13F |
    LDA.W #$0101                  ;$CAF143 |
    JSL.L CODE_FL_00E169          ;$CAF146 |
    TYX                           ;$CAF14A |
    DEC.W Obj_VAR8,X              ;$CAF14B |
    BEQ CODE_95F153               ;$CAF14E |
    JMP.W CODE_JP_15F13C          ;$CAF150 |

CODE_95F153:
    JML.L DestroyUsedObject       ;$CAF153 |
    JSL.L CODE_FL_00E2F8          ;$CAF157 |
    LDA.W #$F1BB                  ;$CAF15B |
    LDX.W #$00CA                  ;$CAF15E |
    JSL.L CODE_FL_00E1B7          ;$CAF161 |
    LDA.W #$004A                  ;$CAF165 |
    JSL.L CODE_FL_00E17F          ;$CAF168 |
    LDX.W #$0000                  ;$CAF16C |
    LDY.W #$0000                  ;$CAF16F |
    LDA.W #$0034                  ;$CAF172 |
    JSR.W CODE_FN_15F3AD          ;$CAF175 |
    LDA.W #$0002                  ;$CAF178 |
    STA.W Obj_VAR8,Y              ;$CAF17B |

CODE_JP_15F17E:
    LDX.W #$0000                  ;$CAF17E |
    LDY.W #$0000                  ;$CAF181 |
    LDA.W #$0048                  ;$CAF184 |
    JSR.W CODE_FN_15F3AD          ;$CAF187 |
    JSL.L CODE_FL_00E09D          ;$CAF18A |
    LDX.W #$0000                  ;$CAF18E |
    LDY.W #$0000                  ;$CAF191 |
    LDA.W #$004A                  ;$CAF194 |
    JSR.W CODE_FN_15F3AD          ;$CAF197 |
    JSL.L CODE_FL_00E09D          ;$CAF19A |
    LDX.W #$0000                  ;$CAF19E |
    LDY.W #$0000                  ;$CAF1A1 |
    LDA.W #$004C                  ;$CAF1A4 |
    JSR.W CODE_FN_15F3AD          ;$CAF1A7 |
    JSL.L CODE_FL_00E09D          ;$CAF1AA |
    TYX                           ;$CAF1AE |
    DEC.W Obj_VAR8,X              ;$CAF1AF |
    BEQ CODE_95F1B7               ;$CAF1B2 |
    JMP.W CODE_JP_15F17E          ;$CAF1B4 |

CODE_95F1B7:
    JML.L DestroyUsedObject       ;$CAF1B7 |
    LDA.W Obj_XPosition,Y         ;$CAF1BB |
    SEC                           ;$CAF1BE |
    SBC.W CameraX_TileMirror                   ;$CAF1BF |
    STA.W Obj_XPositionMirror,Y   ;$CAF1C2 |
    LDA.W Obj_YPosition,Y         ;$CAF1C5 |
    SEC                           ;$CAF1C8 |
    SBC.W CameraY_TileMirror                   ;$CAF1C9 |
    STA.W Obj_YPositionMirror,Y   ;$CAF1CC |
    RTL                           ;$CAF1CF |
    LDX.W #$01C0                  ;$CAF1D0 |
    LDY.W #$0070                  ;$CAF1D3 |
    LDA.W #$003C                  ;$CAF1D6 |
    JSR.W CODE_FN_15F3AD          ;$CAF1D9 |
    LDX.W #$01F0                  ;$CAF1DC |
    LDY.W #$00B0                  ;$CAF1DF |
    LDA.W #$003E                  ;$CAF1E2 |
    JSR.W CODE_FN_15F3AD          ;$CAF1E5 |
    LDX.W #$00A0                  ;$CAF1E8 |
    LDY.W #$00F0                  ;$CAF1EB |
    LDA.W #$003C                  ;$CAF1EE |
    JSR.W CODE_FN_15F3AD          ;$CAF1F1 |
    LDX.W #$0100                  ;$CAF1F4 |
    LDY.W #$0070                  ;$CAF1F7 |
    LDA.W #$003E                  ;$CAF1FA |
    JSR.W CODE_FN_15F3AD          ;$CAF1FD |
    LDX.W #$0180                  ;$CAF200 |
    LDY.W #$00D0                  ;$CAF203 |
    LDA.W #$003C                  ;$CAF206 |
    JSR.W CODE_FN_15F3AD          ;$CAF209 |
    LDA.W #$F000                  ;$CAF20C |
    LDX.W #$FA00                  ;$CAF20F |
    JSL.L CODE_FL_00E539          ;$CAF212 |
    LDA.W #$0058                  ;$CAF216 |
    LDX.W #$0030                  ;$CAF219 |
    LDY.W #$0032                  ;$CAF21C |
    JSL.L CODE_FL_00E617          ;$CAF21F |
    LDA.W #$0058                  ;$CAF223 |
    LDX.W #$FFD0                  ;$CAF226 |
    JSL.L CODE_FL_00E5CE          ;$CAF229 |

CODE_95F22D:
    JSL.L CODE_FL_00E091          ;$CAF22D |
    BRA CODE_95F22D               ;$CAF231 |
    JSL.L CODE_FL_00E307          ;$CAF233 |
    LDA.W #$003E                  ;$CAF237 |
    STA.W $64B6,Y                 ;$CAF23A |
    LDA.W #$000C                  ;$CAF23D |
    STA.W Obj_Pose,Y              ;$CAF240 |

CODE_95F243:
    JSL.L CODE_FL_00E091          ;$CAF243 |
    BRA CODE_95F243               ;$CAF247 |
    JSL.L CODE_FL_00E307          ;$CAF249 |
    LDA.W #$003E                  ;$CAF24D |
    STA.W $64B6,Y                 ;$CAF250 |
    LDA.W #$000D                  ;$CAF253 |
    STA.W Obj_Pose,Y              ;$CAF256 |

CODE_95F259:
    JSL.L CODE_FL_00E091          ;$CAF259 |
    BRA CODE_95F259               ;$CAF25D |
    LDA.W #$F800                  ;$CAF25F |
    LDX.W #$0300                  ;$CAF262 |
    JSL.L CODE_FL_00E539          ;$CAF265 |
    LDA.W #$0060                  ;$CAF269 |
    LDX.W #$FFE8                  ;$CAF26C |
    JSL.L CODE_FL_00E5CE          ;$CAF26F |
    BRA CODE_95F2B5               ;$CAF273 |
    LDA.W #$FB00                  ;$CAF275 |
    LDX.W #$FB00                  ;$CAF278 |
    JSL.L CODE_FL_00E539          ;$CAF27B |
    LDA.W #$0040                  ;$CAF27F |
    LDX.W #$0048                  ;$CAF282 |
    JSL.L CODE_FL_00E5CE          ;$CAF285 |
    BRA CODE_95F2B5               ;$CAF289 |
    LDA.W #$FF00                  ;$CAF28B |
    LDX.W #$F800                  ;$CAF28E |
    JSL.L CODE_FL_00E539          ;$CAF291 |
    LDA.W #$0010                  ;$CAF295 |
    LDX.W #$0060                  ;$CAF298 |
    JSL.L CODE_FL_00E5CE          ;$CAF29B |
    BRA CODE_95F2B5               ;$CAF29F |
    LDA.W #$0500                  ;$CAF2A1 |
    LDX.W #$FF00                  ;$CAF2A4 |
    JSL.L CODE_FL_00E539          ;$CAF2A7 |
    LDA.W #$FFC8                  ;$CAF2AB |
    LDX.W #$0008                  ;$CAF2AE |
    JSL.L CODE_FL_00E5CE          ;$CAF2B1 |

CODE_95F2B5:
    LDA.W #$9AEA                  ;$CAF2B5 |
    LDX.W #$00C5                  ;$CAF2B8 |
    JSL.L CODE_FL_00E1CC          ;$CAF2BB |
    LDA.W #$003F                  ;$CAF2BF |
    STA.W $64B6,Y                 ;$CAF2C2 |
    LDA.W #$0003                  ;$CAF2C5 |
    STA.W Obj_VAR8,Y              ;$CAF2C8 |

CODE_JP_15F2CB:
    LDA.W #$0206                  ;$CAF2CB |
    JSL.L CODE_FL_00E169          ;$CAF2CE |
    LDA.W #$0002                  ;$CAF2D2 |
    JSL.L CODE_FL_00E269          ;$CAF2D5 |
    TYX                           ;$CAF2D9 |
    DEC.W Obj_Pose,X              ;$CAF2DA |
    JSL.L CODE_FL_00E097          ;$CAF2DD |
    LDA.W #$0002                  ;$CAF2E1 |
    JSL.L CODE_FL_00E269          ;$CAF2E4 |
    TYX                           ;$CAF2E8 |
    DEC.W Obj_VAR8,X              ;$CAF2E9 |
    BEQ CODE_95F2F1               ;$CAF2EC |
    JMP.W CODE_JP_15F2CB          ;$CAF2EE |

CODE_95F2F1:
    LDA.W #$0402                  ;$CAF2F1 |
    JSL.L CODE_FL_00E169          ;$CAF2F4 |
    LDA.W #$0004                  ;$CAF2F8 |
    JSL.L CODE_FL_00E273          ;$CAF2FB |
    JML.L DestroyUsedObject       ;$CAF2FF |
    LDA.W #$0600                  ;$CAF303 |
    LDX.W #$FF80                  ;$CAF306 |
    JSL.L CODE_FL_00E539          ;$CAF309 |
    BRA CODE_95F325               ;$CAF30D |
    LDA.W #$0600                  ;$CAF30F |
    LDX.W #$0080                  ;$CAF312 |
    JSL.L CODE_FL_00E539          ;$CAF315 |
    BRA CODE_95F325               ;$CAF319 |
    LDA.W #$0500                  ;$CAF31B |
    LDX.W #$0180                  ;$CAF31E |
    JSL.L CODE_FL_00E539          ;$CAF321 |

CODE_95F325:
    LDA.W #$9AEA                  ;$CAF325 |
    LDX.W #$00C5                  ;$CAF328 |
    JSL.L CODE_FL_00E1CC          ;$CAF32B |
    LDA.W #$003F                  ;$CAF32F |
    STA.W $64B6,Y                 ;$CAF332 |
    JSL.L CODE_FL_05E5D2          ;$CAF335 |
    LDA.W #$0302                  ;$CAF339 |
    JSL.L CODE_FL_00E169          ;$CAF33C |
    LDA.W #$0003                  ;$CAF340 |
    JSL.L CODE_FL_00E269          ;$CAF343 |
    TYX                           ;$CAF347 |
    DEC.W Obj_Pose,X              ;$CAF348 |
    JSL.L CODE_FL_00E09D          ;$CAF34B |
    LDA.W #$0300                  ;$CAF34F |
    JSL.L CODE_FL_00E169          ;$CAF352 |
    JML.L DestroyUsedObject       ;$CAF356 |

CODE_FN_15F35A:
    STA.W CameraX_TileMirror                   ;$CAF35A |
    STX.W CameraY_TileMirror                   ;$CAF35D |
    RTS                           ;$CAF360 |

CODE_FN_15F361:
    PHX                           ;$CAF361 |
    JSL.L CODE_FL_03AC43          ;$CAF362 |
    STA.W $733A,Y                 ;$CAF366 |
    TXA                           ;$CAF369 |
    STA.W $734A,Y                 ;$CAF36A |
    PLA                           ;$CAF36D |
    JSL.L CODE_FL_03AC43          ;$CAF36E |
    STA.W $7342,Y                 ;$CAF372 |
    TXA                           ;$CAF375 |
    STA.W $7352,Y                 ;$CAF376 |
    LDY.B $39                     ;$CAF379 |
    RTS                           ;$CAF37B |
    JSL.L CODE_FL_03AC43          ;$CAF37C |
    STA.W $733A,Y                 ;$CAF380 |
    TXA                           ;$CAF383 |
    STA.W $734A,Y                 ;$CAF384 |
    LDY.B $39                     ;$CAF387 |
    RTS                           ;$CAF389 |

    JSL.L CODE_FL_03AC43          ;$CAF38A |
    STA.W $7342,Y                 ;$CAF38E |
    TXA                           ;$CAF391 |
    STA.W $7352,Y                 ;$CAF392 |
    LDY.B $39                     ;$CAF395 |
    RTS                           ;$CAF397 |


CODE_FN_15F398:
    STA.W Mode7_CenterX           ;$CAF398 |
    STX.W Mode7_CenterY           ;$CAF39B |
    RTS                           ;$CAF39E |

CODE_FN_15F39F:
    STA.W $307F                   ;$CAF39F |
    STX.W $3081                   ;$CAF3A2 |
    RTS                           ;$CAF3A5 |

CODE_FN_15F3A6:
    STA.W $7790                   ;$CAF3A6 |
    STX.W $7792                   ;$CAF3A9 |
    RTS                           ;$CAF3AC |

CODE_FN_15F3AD:
    STA.W ObjVar0_Temp            ;$CAF3AD |
    LDA.B $39                     ;$CAF3B0 |
    STA.W ObjVar2_Temp            ;$CAF3B2 |
    STZ.W ObjSlotMinimum          ;$CAF3B5 |
    LDA.W #$007A                  ;$CAF3B8 |
    STA.W ObjSlotMaximum          ;$CAF3BB |
    LDA.W #$0000                  ;$CAF3BE |
    JSL.L CreateNewObject         ;$CAF3C1 |
    BCS CODE_95F3D2               ;$CAF3C5 |
    TAX                           ;$CAF3C7 |
    LDA.W #$E750                  ;$CAF3C8 |
    LDY.W #$40CA                  ;$CAF3CB |
    JSL.L CODE_FL_008F64          ;$CAF3CE |

CODE_95F3D2:
    LDY.B $39                     ;$CAF3D2 |
    RTS                           ;$CAF3D4 |
    STZ.W Standard_Palette        ;$CAF3D5 |
    RTL                           ;$CAF3D8 |
    STZ.B IdentifySNES            ;$CAF3D9 |
    LDA.W $778C                   ;$CAF3DB |
    STA.B DSP_P                   ;$CAF3DE |
    LDA.W $7794                   ;$CAF3E0 |
    CLC                           ;$CAF3E3 |
    ADC.W #$0008                  ;$CAF3E4 |
    STA.W $7794                   ;$CAF3E7 |
    STA.B DSP_SRCN                ;$CAF3EA |
    JSL.L CODE_FL_CAF449          ;$CAF3EC |
    LDA.B IdentifySNES            ;$CAF3F0 |
    STA.W Standard_Palette        ;$CAF3F2 |
    LDY.W #$0012                  ;$CAF3F5 |

CODE_95F3F8:
    TYX                           ;$CAF3F8 |
    LDA.L DATA8_EFE67E,X          ;$CAF3F9 |
    STA.B IdentifySNES            ;$CAF3FD |
    JSL.L CODE_FL_CAF449          ;$CAF3FF |
    LDA.B IdentifySNES            ;$CAF403 |
    STA.W $0642,Y                 ;$CAF405 |
    DEY                           ;$CAF408 |
    DEY                           ;$CAF409 |
    BPL CODE_95F3F8               ;$CAF40A |
    LDY.W #$001C                  ;$CAF40C |

CODE_95F40F:
    LDA.W Standard_Palette        ;$CAF40F |
    STA.B IdentifySNES            ;$CAF412 |
    TYX                           ;$CAF414 |
    LDA.L DATA8_EFDE72,X          ;$CAF415 |
    STA.B DSP_P                   ;$CAF419 |
    JSL.L CODE_FL_CAF449          ;$CAF41B |
    LDA.B IdentifySNES            ;$CAF41F |
    STA.W $0602,Y                 ;$CAF421 |
    DEY                           ;$CAF424 |
    DEY                           ;$CAF425 |
    BPL CODE_95F40F               ;$CAF426 |
    JML.L WaitForSnesNMI          ;$CAF428 |
    LDA.W $778C                   ;$CAF42C |
    STA.B IdentifySNES            ;$CAF42F |
    STZ.B DSP_P                   ;$CAF431 |
    LDA.W $778E                   ;$CAF433 |
    CLC                           ;$CAF436 |
    ADC.W #$0010                  ;$CAF437 |
    STA.W $778E                   ;$CAF43A |
    STA.B DSP_SRCN                ;$CAF43D |
    JSL.L CODE_FL_CAF449          ;$CAF43F |
    LDA.B IdentifySNES            ;$CAF443 |
    STA.W Standard_Palette        ;$CAF445 |
    RTL                           ;$CAF448 |
    BIT.W IdentifySNES            ;$CAF449 |
    BMI CODE_95F458               ;$CAF44C |
    LDA.W #$F458                  ;$CAF44E |
    LDX.W #$00CA                  ;$CAF451 |
    JML.L SNES_ExecuteSA1         ;$CAF454 |


CODE_95F458:
    STZ.W $2250                   ;$CAF458 |
    LDA.W #$0100                  ;$CAF45B |
    SEC                           ;$CAF45E |
    SBC.B DSP_SRCN                ;$CAF45F |
    STA.W $2251                   ;$CAF461 |
    LDA.B IdentifySNES            ;$CAF464 |
    AND.W #$7C00                  ;$CAF466 |
    STA.W $2253                   ;$CAF469 |
    LDA.B IdentifySNES            ;$CAF46C |
    LDY.W $2307                   ;$CAF46E |
    PHY                           ;$CAF471 |
    AND.W #$03E0                  ;$CAF472 |
    STA.W $2253                   ;$CAF475 |
    LDA.B IdentifySNES            ;$CAF478 |
    LDY.W $2307                   ;$CAF47A |
    PHY                           ;$CAF47D |
    AND.W #$001F                  ;$CAF47E |
    STA.W $2253                   ;$CAF481 |
    CLC                           ;$CAF484 |
    LDY.W $2307                   ;$CAF485 |
    LDA.B DSP_SRCN                ;$CAF488 |
    STA.W $2251                   ;$CAF48A |
    LDA.B DSP_P                   ;$CAF48D |
    AND.W #$001F                  ;$CAF48F |
    STA.W $2253                   ;$CAF492 |
    TYA                           ;$CAF495 |
    ADC.W $2307                   ;$CAF496 |
    STA.B IdentifySNES            ;$CAF499 |
    LDA.B DSP_P                   ;$CAF49B |
    AND.W #$03E0                  ;$CAF49D |
    STA.W $2253                   ;$CAF4A0 |
    PLA                           ;$CAF4A3 |
    ADC.W $2307                   ;$CAF4A4 |
    AND.W #$03E0                  ;$CAF4A7 |
    ORA.B IdentifySNES            ;$CAF4AA |
    STA.B IdentifySNES            ;$CAF4AC |
    LDA.B DSP_P                   ;$CAF4AE |
    AND.W #$7C00                  ;$CAF4B0 |
    STA.W $2253                   ;$CAF4B3 |
    PLA                           ;$CAF4B6 |
    ADC.W $2307                   ;$CAF4B7 |
    AND.W #$7C00                  ;$CAF4BA |
    ORA.B IdentifySNES            ;$CAF4BD |
    STA.B IdentifySNES            ;$CAF4BF |
    RTL                           ;$CAF4C1 |
    PEA.W $007E                   ;$CAF4C2 |
    PLB                           ;$CAF4C5 |
    LDA.W #$00EF                  ;$CAF4C6 |
    LDX.W #$E6CA                  ;$CAF4C9 |
    LDY.W #$2000                  ;$CAF4CC |
    JSL.L DecompressData          ;$CAF4CF |
    LDY.W #$0006                  ;$CAF4D3 |

CODE_95F4D6:
    LDA.W $2008,Y                 ;$CAF4D6 |
    STA.W $2080,Y                 ;$CAF4D9 |
    LDA.W $2010,Y                 ;$CAF4DC |
    STA.W HW_INIDISP,Y            ;$CAF4DF |
    LDA.W $2018,Y                 ;$CAF4E2 |
    STA.W HW_WMDATA,Y             ;$CAF4E5 |
    LDA.W $2020,Y                 ;$CAF4E8 |
    STA.W $2200,Y                 ;$CAF4EB |
    LDA.W $2028,Y                 ;$CAF4EE |
    STA.W $2280,Y                 ;$CAF4F1 |
    LDA.W $2030,Y                 ;$CAF4F4 |
    STA.W $2300,Y                 ;$CAF4F7 |
    LDA.W $2038,Y                 ;$CAF4FA |
    STA.W $2380,Y                 ;$CAF4FD |
    DEY                           ;$CAF500 |
    DEY                           ;$CAF501 |
    BPL CODE_95F4D6               ;$CAF502 |
    LDX.W #$2000                  ;$CAF504 |
    LDY.W #$2008                  ;$CAF507 |
    LDA.W #$0077                  ;$CAF50A |
    MVN $7E,$7E                   ;$CAF50D |
    LDX.W #$2080                  ;$CAF510 |
    LDY.W #$2088                  ;$CAF513 |
    LDA.W #$0077                  ;$CAF516 |
    MVN $7E,$7E                   ;$CAF519 |
    LDX.W #$2100                  ;$CAF51C |
    LDY.W #$2108                  ;$CAF51F |
    LDA.W #$0077                  ;$CAF522 |
    MVN $7E,$7E                   ;$CAF525 |
    LDX.W #$2180                  ;$CAF528 |
    LDY.W #$2188                  ;$CAF52B |
    LDA.W #$0077                  ;$CAF52E |
    MVN $7E,$7E                   ;$CAF531 |
    LDX.W #$2200                  ;$CAF534 |
    LDY.W #$2208                  ;$CAF537 |
    LDA.W #$0077                  ;$CAF53A |
    MVN $7E,$7E                   ;$CAF53D |
    LDX.W #$2280                  ;$CAF540 |
    LDY.W #$2288                  ;$CAF543 |
    LDA.W #$0077                  ;$CAF546 |
    MVN $7E,$7E                   ;$CAF549 |
    LDX.W #$2300                  ;$CAF54C |
    LDY.W #$2308                  ;$CAF54F |
    LDA.W #$0077                  ;$CAF552 |
    MVN $7E,$7E                   ;$CAF555 |
    LDX.W #$2380                  ;$CAF558 |
    LDY.W #$2388                  ;$CAF55B |
    LDA.W #$0077                  ;$CAF55E |
    MVN $7E,$7E                   ;$CAF561 |
    LDX.W #$2000                  ;$CAF564 |
    LDY.W #$2400                  ;$CAF567 |
    LDA.W #$3F7F                  ;$CAF56A |
    MVN $7E,$7E                   ;$CAF56D |
    PLB                           ;$CAF570 |
    RTL                           ;$CAF571 |
    SEP #$30                      ;$CAF572 |
    LDA.B #$F0                    ;$CAF574 |
    TRB.W HDMA_Enable             ;$CAF576 |
    LDX.B #$2A                    ;$CAF579 |

CODE_95F57B:
    TXA                           ;$CAF57B |
    STA.L $7E1FFF,X               ;$CAF57C |
    DEX                           ;$CAF580 |
    BNE CODE_95F57B               ;$CAF581 |
    REP #$30                      ;$CAF583 |
    RTL                           ;$CAF585 |
    SEP #$20                      ;$CAF586 |
    LDA.W Screen_Brightness_Mirror_PrevFrame;$CAF588 |
    CMP.B #$0F                    ;$CAF58B |
    BCS CODE_95F596               ;$CAF58D |
    INC A                         ;$CAF58F |
    STA.W Screen_Brightness_Mirror_PrevFrame;$CAF590 |
    STA.W Screen_Brightness       ;$CAF593 |

CODE_95F596:
    REP #$20                      ;$CAF596 |
    LDA.W #$3700                  ;$CAF598 |
    TCD                           ;$CAF59B |
    LDA.W $7796                   ;$CAF59C |
    CMP.W #$0014                  ;$CAF59F |
    BCC CODE_95F5AB               ;$CAF5A2 |
    STZ.W $3099                   ;$CAF5A4 |
    JML.L CODE_FL_00842C          ;$CAF5A7 |

CODE_95F5AB:
    CMP.W #$0010                  ;$CAF5AB |
    BCS CODE_95F5B5               ;$CAF5AE |
    LDA.W #$0400                  ;$CAF5B0 |
    BRA CODE_95F5B8               ;$CAF5B3 |

CODE_95F5B5:
    LDA.W #$0200                  ;$CAF5B5 |

CODE_95F5B8:
    CLC                           ;$CAF5B8 |
    ADC.W $307D                   ;$CAF5B9 |
    STA.W $307D                   ;$CAF5BC |
    LDX.W $307F                   ;$CAF5BF |
    LDY.W $3081                   ;$CAF5C2 |
    JSL.L CODE_FL_00A66C          ;$CAF5C5 |
    INC.W $7796                   ;$CAF5C9 |
    JML.L CODE_FL_00842C          ;$CAF5CC |
    STZ.W CurrentLoadedMusic      ;$CAF5D0 |
    LDA.W #$0015                  ;$CAF5D3 |
    JSL.L PlayMusic               ;$CAF5D6 |

CODE_95F5DA:
    LDA.W $3099                   ;$CAF5DA |
    BNE CODE_95F5DA               ;$CAF5DD |
    RTL                           ;$CAF5DF |
    SEP #$20                      ;$CAF5E0 |
    LDA.B #$43                    ;$CAF5E2 |
    STA.W $4360                   ;$CAF5E4 |
    STA.W $4370                   ;$CAF5E7 |
    LDA.B #$1B                    ;$CAF5EA |
    STA.W $4361                   ;$CAF5EC |
    LDA.B #$1D                    ;$CAF5EF |
    STA.W $4371                   ;$CAF5F1 |
    LDY.W #$F646                  ;$CAF5F4 |
    STY.W $4362                   ;$CAF5F7 |
    LDY.W #$F64D                  ;$CAF5FA |
    STY.W $4372                   ;$CAF5FD |
    LDA.B #$CA                    ;$CAF600 |
    STA.W $4364                   ;$CAF602 |
    STA.W $4374                   ;$CAF605 |
    LDA.B #$7F                    ;$CAF608 |
    STA.W $4367                   ;$CAF60A |
    STA.W $4377                   ;$CAF60D |
    STZ.W $4350                   ;$CAF610 |
    LDA.B #$2C                    ;$CAF613 |
    STA.W $4351                   ;$CAF615 |
    LDY.W #$7A70                  ;$CAF618 |
    STY.W $4352                   ;$CAF61B |
    LDA.B #$7F                    ;$CAF61E |
    STA.W $4354                   ;$CAF620 |
    STA.W $4357                   ;$CAF623 |
    STZ.W $4340                   ;$CAF626 |
    LDA.B #$05                    ;$CAF629 |
    STA.W $4341                   ;$CAF62B |
    LDY.W #$7870                  ;$CAF62E |
    STY.W $4342                   ;$CAF631 |
    LDA.B #$7F                    ;$CAF634 |
    STA.W $4344                   ;$CAF636 |
    STA.W $4347                   ;$CAF639 |
    LDA.B #$F0                    ;$CAF63C |
    TSB.W HDMA_Enable             ;$CAF63E |
    REP #$20                      ;$CAF641 |
    JMP.W CODE_JP_15ECD1          ;$CAF643 |
    db $F0,$70,$71,$F0,$30,$73,$00,$F0;$CAF646 |
    db $F0,$74,$F0,$B0,$76,$00,$00,$01;$CAF64E |
    db $01,$01,$02,$01,$03,$01,$04,$01;$CAF656 |
    db $05,$01,$06,$01,$07,$01,$08,$01;$CAF65E |
    db $09,$01,$0A,$01,$0B,$01,$0C,$01;$CAF666 |
    db $0D,$01,$0E,$01,$0F,$01,$11,$01;$CAF66E |
    db $12,$01,$13,$01,$14,$01,$15,$01;$CAF676 |
    db $16,$01,$18,$01,$19,$01,$1A,$01;$CAF67E |
    db $1B,$01,$1C,$01,$1E,$01,$1F,$01;$CAF686 |
    db $20,$01,$21,$01,$23,$01,$24,$01;$CAF68E |
    db $25,$01,$27,$01,$28,$01,$29,$01;$CAF696 |
    db $2B,$01,$2C,$01,$2E,$01,$2F,$01;$CAF69E |
    db $30,$01,$32,$01,$33,$01,$35,$01;$CAF6A6 |
    db $36,$01,$38,$01,$39,$01,$3B,$01;$CAF6AE |
    db $3C,$01,$3E,$01,$3F,$01,$41,$01;$CAF6B6 |
    db $42,$01,$44,$01,$46,$01,$47,$01;$CAF6BE |
    db $49,$01,$4A,$01,$4C,$01,$4E,$01;$CAF6C6 |
    db $50,$01,$51,$01,$53,$01,$55,$01;$CAF6CE |
    db $57,$01,$58,$01,$5A,$01,$5C,$01;$CAF6D6 |
    db $5E,$01,$60,$01,$62,$01,$64,$01;$CAF6DE |
    db $66,$01,$68,$01,$6A,$01,$6C,$01;$CAF6E6 |
    db $6E,$01,$70,$01,$72,$01,$74,$01;$CAF6EE |
    db $76,$01,$78,$01,$7A,$01,$7D,$01;$CAF6F6 |
    db $7F,$01,$81,$01,$83,$01,$86,$01;$CAF6FE |
    db $88,$01,$8A,$01,$8D,$01,$8F,$01;$CAF706 |
    db $92,$01,$94,$01,$97,$01,$99,$01;$CAF70E |
    db $9C,$01,$9E,$01,$A1,$01,$A4,$01;$CAF716 |
    db $A6,$01,$A9,$01,$AC,$01,$AF,$01;$CAF71E |
    db $B2,$01,$B4,$01,$B7,$01,$BA,$01;$CAF726 |
    db $BD,$01,$C0,$01,$C3,$01,$C7,$01;$CAF72E |
    db $CA,$01,$CD,$01,$D0,$01,$D4,$01;$CAF736 |
    db $D7,$01,$DA,$01,$DE,$01,$E1,$01;$CAF73E |
    db $E5,$01,$E9,$01,$EC,$01,$F0,$01;$CAF746 |
    db $F4,$01,$F8,$01,$FC,$01,$00,$02;$CAF74E |
    db $04,$02,$08,$02,$0C,$02,$10,$02;$CAF756 |
    db $14,$02,$19,$02,$1D,$02,$22,$02;$CAF75E |
    db $26,$02,$2B,$02,$30,$02,$34,$02;$CAF766 |
    db $39,$02,$3E,$02,$43,$02,$49,$02;$CAF76E |
    db $4E,$02,$53,$02,$59,$02,$5E,$02;$CAF776 |
    db $64,$02,$6A,$02,$70,$02,$76,$02;$CAF77E |
    db $7C,$02,$82,$02,$88,$02,$8F,$02;$CAF786 |
    db $95,$02,$9C,$02,$A3,$02,$AA,$02;$CAF78E |
    db $B1,$02,$B9,$02,$C0,$02,$C8,$02;$CAF796 |
    db $D0,$02,$D8,$02,$E0,$02,$E8,$02;$CAF79E |
    db $F1,$02,$FA,$02,$03,$03,$0C,$03;$CAF7A6 |
    db $15,$03,$1F,$03,$29,$03,$33,$03;$CAF7AE |
    db $3D,$03,$48,$03,$53,$03,$5E,$03;$CAF7B6 |
    db $69,$03,$75,$03,$81,$03,$8E,$03;$CAF7BE |
    db $9B,$03,$A8,$03,$B5,$03,$C3,$03;$CAF7C6 |
    db $D2,$03,$E0,$03,$F0,$03,$00,$04;$CAF7CE |
    db $10,$04,$21,$04,$32,$04,$44,$04;$CAF7D6 |
    db $56,$04,$69,$04,$7D,$04,$92,$04;$CAF7DE |
    db $A7,$04,$BD,$04,$D4,$04,$EC,$04;$CAF7E6 |
    db $05,$05,$1E,$05,$39,$05,$55,$05;$CAF7EE |
    db $72,$05,$90,$05,$B0,$05,$D1,$05;$CAF7F6 |
    db $F4,$05,$18,$06,$3E,$06,$66,$06;$CAF7FE |
    db $90,$06,$BC,$06,$EB,$06,$1C,$07;$CAF806 |
    db $50,$07,$87,$07,$C1,$07    ;$CAF80E |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF814 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF81C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF824 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF82C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF834 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF83C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF844 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF84C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF854 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF85C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF864 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF86C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF874 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF87C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF884 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF88C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF894 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF89C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF8A4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF8AC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF8B4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF8BC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF8C4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF8CC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF8D4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF8DC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF8E4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF8EC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF8F4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF8FC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF904 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF90C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF914 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF91C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF924 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF92C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF934 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF93C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF944 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF94C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF954 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF95C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF964 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF96C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF974 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF97C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF984 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF98C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF994 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF99C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF9A4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF9AC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF9B4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF9BC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF9C4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF9CC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF9D4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF9DC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF9E4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF9EC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF9F4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAF9FC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFA04 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFA0C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFA14 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFA1C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFA24 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFA2C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFA34 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFA3C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFA44 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFA4C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFA54 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFA5C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFA64 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFA6C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFA74 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFA7C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFA84 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFA8C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFA94 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFA9C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFAA4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFAAC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFAB4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFABC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFAC4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFACC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFAD4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFADC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFAE4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFAEC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFAF4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFAFC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFB04 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFB0C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFB14 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFB1C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFB24 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFB2C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFB34 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFB3C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFB44 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFB4C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFB54 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFB5C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFB64 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFB6C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFB74 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFB7C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFB84 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFB8C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFB94 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFB9C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFBA4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFBAC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFBB4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFBBC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFBC4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFBCC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFBD4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFBDC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFBE4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFBEC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFBF4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFBFC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFC04 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFC0C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFC14 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFC1C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFC24 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFC2C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFC34 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFC3C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFC44 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFC4C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFC54 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFC5C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFC64 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFC6C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFC74 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFC7C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFC84 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFC8C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFC94 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFC9C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFCA4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFCAC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFCB4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFCBC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFCC4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFCCC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFCD4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFCDC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFCE4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFCEC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFCF4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFCFC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFD04 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFD0C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFD14 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFD1C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFD24 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFD2C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFD34 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFD3C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFD44 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFD4C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFD54 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFD5C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFD64 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFD6C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFD74 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFD7C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFD84 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFD8C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFD94 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFD9C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFDA4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFDAC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFDB4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFDBC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFDC4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFDCC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFDD4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFDDC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFDE4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFDEC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFDF4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFDFC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFE04 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFE0C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFE14 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFE1C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFE24 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFE2C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFE34 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFE3C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFE44 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFE4C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFE54 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFE5C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFE64 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFE6C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFE74 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFE7C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFE84 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFE8C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFE94 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFE9C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFEA4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFEAC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFEB4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFEBC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFEC4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFECC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFED4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFEDC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFEE4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFEEC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFEF4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFEFC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFF04 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFF0C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFF14 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFF1C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFF24 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFF2C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFF34 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFF3C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFF44 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFF4C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFF54 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFF5C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFF64 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFF6C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFF74 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFF7C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFF84 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFF8C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFF94 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFF9C |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFFA4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFFAC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFFB4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFFBC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFFC4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFFCC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFFD4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFFDC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFFE4 |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFFEC |
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF;$CAFFF4 |
    db $FF,$FF,$FF,$FF            ;$CAFFFC |
