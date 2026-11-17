ORG $018000


RoomLoad_Start:
	JSR.W CODE_FN_01813A          ;$018000	|
	JSR.W CODE_FN_018C74          ;$018003	|
	%LoadLongToAX(CODE_818E52)
	JSL.L SA1_ExecuteSNES         ;$01800C	|
	JSR.W CODE_FN_018307          ;$018010	|
	%LoadLongToAX(InitializeRoomProperties)
	JSL.L SA1_ExecuteSNES         ;$018019	|
	JSL.L CODE_FL_03A2D4          ;$01801D	|
	BCS CODE_818027               ;$018021	|
	JSL.L CODE_FL_00CEAB          ;$018023	|

CODE_818027:
	JSL.L CODE_FL_D01566          ;$018027	|
	LDA.W $3330                   ;$01802B	|
	PHA                           ;$01802E	|
	JSL.L CODE_FL_01A660          ;$01802F	|
	PLA                           ;$018033	|
	STA.W $3330                   ;$018034	|
	JSR.W CODE_FN_01816A          ;$018037	|
	JSR.W CODE_FN_01810D          ;$01803A	|
	JSR.W CODE_FN_01A2CA          ;$01803D	|
	LDA.W $334A                   ;$018040	|
	STA.W $3350                   ;$018043	|
	LDA.W $334C                   ;$018046	|
	STA.W $3354                   ;$018049	|
	LDA.W #$8000                  ;$01804C	|
	STA.W $3352                   ;$01804F	|
	STA.W $3356                   ;$018052	|
	JSR.W CODE_81A4E9             ;$018055	|
	JSR.W CODE_FN_01925E          ;$018058	|
	JSR.W CODE_FN_018E99          ;$01805B	|
	JSR.W CODE_FN_018BD7          ;$01805E	|
	%LoadLongToAX(InitializeStatusBar)
	JML.L SA1_ExecuteSNES         ;$018067	|
InitializeRoomProperties:
	JSR.W LoadRoomBackground      ;$01806B	|
	JSR.W LoadRoomConsumables     ;$01806E	|
	JSR.W LoadRoomTileset         ;$018071	|
	JSR.W CODE_FN_018698          ;$018074	|
	RTL                           ;$018077	|
InitializeStatusBar:
	JSR.W SetupStatusBar          ;$018078	|
	JSR.W HandleStatusBar         ;$01807B	|
	JSR.W CODE_FN_01A743          ;$01807E	|
	JSR.W CODE_FN_01859A          ;$018081	|
	JML.L CODE_JL_D0234E          ;$018084	|

CODE_FL_018088:
	JSL.L UpdateVramSprSize       ;$018088	|
	JSR.W CODE_FN_018C74          ;$01808C	|
	%LoadLongToAX(CODE_818E52)
	JSL.L SA1_ExecuteSNES         ;$018095	|
	JSR.W CODE_FN_018307          ;$018099	|
	%LoadLongToAX(InitializeRoomProperties)
	JSL.L SA1_ExecuteSNES         ;$0180A2	|
	JSL.L CODE_FL_D01566          ;$0180A6	|
	LDA.W $3330                   ;$0180AA	|
	PHA                           ;$0180AD	|
	JSL.L CODE_FL_01A660          ;$0180AE	|
	PLA                           ;$0180B2	|
	STA.W $3330                   ;$0180B3	|
	JSR.W CODE_FN_01A2CA          ;$0180B6	|
	LDA.W $334A                   ;$0180B9	|
	STA.W $3350                   ;$0180BC	|
	LDA.W $334C                   ;$0180BF	|
	STA.W $3354                   ;$0180C2	|
	LDA.W #$8000                  ;$0180C5	|
	STA.W $3352                   ;$0180C8	|
	STA.W $3356                   ;$0180CB	|
	JSR.W CODE_81A4E9             ;$0180CE	|
	JSR.W CODE_FN_01925E          ;$0180D1	|
	JSR.W CODE_FN_018E99          ;$0180D4	|
	JSR.W CODE_FN_018BD7          ;$0180D7	|
	RTL                           ;$0180DA	|

CODE_FL_0180DB:
	STA.B $18                     ;$0180DB	|
	ASL A                         ;$0180DD	|
	CLC                           ;$0180DE	|
	ADC.B $18                     ;$0180DF	|
	CLC                           ;$0180E1	|
	ADC.L DATA8_FF0002            ;$0180E2	|
	STA.B $18                     ;$0180E6	|
	LDA.W #$00FF                  ;$0180E8	|
	STA.B $1A                     ;$0180EB	|
	LDA.B [$18]                   ;$0180ED	|
	TAX                           ;$0180EF	|
	INC.B $18                     ;$0180F0	|
	INC.B $18                     ;$0180F2	|
	LDA.B [$18]                   ;$0180F4	|
	STA.B $1A                     ;$0180F6	|
	STX.B $18                     ;$0180F8	|
	RTL                           ;$0180FA	|
	LDY.W #$0000                  ;$0180FB	|

CODE_FL_0180FE:
	LDA.W #$0000                  ;$0180FE	|

CODE_FL_018101:
	CLC                           ;$018101	|
	ADC.W $32F6                   ;$018102	|
	STA.B $14                     ;$018105	|
	LDA.W $32F8                   ;$018107	|
	STA.B $16                     ;$01810A	|
	RTL                           ;$01810C	|

CODE_FN_01810D:
	LDA.W #$0016                  ;$01810D	|
	JSL.L CODE_FL_018101          ;$018110	|
	LDA.B [$14]                   ;$018114	|
	AND.W #$00FF                  ;$018116	|
	BEQ CODE_818139               ;$018119	|
	STA.W $331A                   ;$01811B	|
	LDA.W Current_Room            ;$01811E	|
	STA.W $3312                   ;$018121	|
	LDA.W $332A                   ;$018124	|
	STA.W $3318                   ;$018127	|
	DEC A                         ;$01812A	|
	ASL A                         ;$01812B	|
	TAX                           ;$01812C	|
	LDA.W $330A,X                 ;$01812D	|
	STA.W $3314                   ;$018130	|
	LDA.W $330E,X                 ;$018133	|
	STA.W $3316                   ;$018136	|

CODE_818139:
	RTS                           ;$018139	|

CODE_FN_01813A:
	LDA.W $331A                   ;$01813A	|
	BNE CODE_818169               ;$01813D	|
	INC.W $331A                   ;$01813F	|
	LDA.W $3312                   ;$018142	|
	STA.W Current_Room            ;$018145	|
	LDA.W $3318                   ;$018148	|
	STA.W $332A                   ;$01814B	|
	DEC A                         ;$01814E	|
	ASL A                         ;$01814F	|
	TAX                           ;$018150	|
	LDA.W $3314                   ;$018151	|
	STA.W $330A,X                 ;$018154	|
	LDA.W $3316                   ;$018157	|
	STA.W $330E,X                 ;$01815A	|
	LDA.W $32EA                   ;$01815D	|
	CMP.W #$0004                  ;$018160	|
	BNE CODE_818169               ;$018163	|
	JSL.L SetRoMKTimer            ;$018165	|

CODE_818169:
	RTS                           ;$018169	|

CODE_FN_01816A:
	LDA.W #$0002                  ;$01816A	|
	STA.W $6010                   ;$01816D	|
	LDA.W #$0004                  ;$018170	|
	STA.W $6012                   ;$018173	|
	STZ.W $6000                   ;$018176	|
	STZ.W $6002                   ;$018179	|
	STZ.W $6004                   ;$01817C	|
	STZ.W $6006                   ;$01817F	|
	STZ.W $6008                   ;$018182	|
	LDA.W $3322                   ;$018185	|
	AND.W #$8000                  ;$018188	|
	BEQ CODE_81818F               ;$01818B	|
	LDA.B $5B                     ;$01818D	|

CODE_81818F:
	STA.B $00                     ;$01818F	|
	%LoadLongToAX(CODE_81819C)
	JSL.L SA1_ExecuteSNES         ;$018197	|
	RTS                           ;$01819B	|

CODE_81819C:
	JSL.L CODE_FL_0180FE          ;$01819C	|
	LDY.W #$0036                  ;$0181A0	|
	LDA.B [$14],Y                 ;$0181A3	|
	STA.W $330A                   ;$0181A5	|
	LDY.W #$0038                  ;$0181A8	|
	LDA.B [$14],Y                 ;$0181AB	|
	STA.W $330E                   ;$0181AD	|
	LDA.W $332A                   ;$0181B0	|
	STA.W $332C                   ;$0181B3	|
	CMP.W #$0003                  ;$0181B6	|

CODE_8181B9:
    BCS CODE_8181B9               ;$0181B9 |
    ASL A                         ;$0181BB |
    TAX                           ;$0181BC |
    JMP.W (PTR16_0181C0,X)        ;$0181BD |
PTR16_0181C0:
    dw CODE_0181C6                ;$0181C0 |
    dw CODE_JP_018263             ;$0181C2 |
    dw CODE_018268                ;$0181C4 |

CODE_0181C6:
    INC.W $332A                   ;$0181C6 |
    LDY.W #$000B                  ;$0181C9 |
    LDA.B [$14],Y                 ;$0181CC |
    BNE CODE_8181D3               ;$0181CE |
    JMP.W CODE_JP_018263          ;$0181D0 |

CODE_8181D3:
	AND.W #$FF00                  ;$0181D3	|
	XBA                           ;$0181D6	|
	CMP.W #$0076                  ;$0181D7	|
	BNE CODE_0181DF               ;$0181DA	|
	JMP.W CODE_JP_018215          ;$0181DC	|

CODE_0181DF:
	JSL.L CODE_FL_0180FE          ;$0181DF	|
	LDY.W #$000B                  ;$0181E3	|
	LDA.B [$14],Y                 ;$0181E6	|
	STA.W $6000                   ;$0181E8	|
	LDA.W #$0018                  ;$0181EB	|
	STA.W $6010                   ;$0181EE	|
	LDA.W #$0040                  ;$0181F1	|
	STA.W $6012                   ;$0181F4	|
	LDY.W #$000D                  ;$0181F7	|
	LDA.B [$14],Y                 ;$0181FA	|
	JSR.W CODE_FN_018284          ;$0181FC	|
	LDA.B [$14],Y                 ;$0181FF	|
	CLC                           ;$018201	|
	ADC.B $00                     ;$018202	|
	TAX                           ;$018204	|
	LDY.W #$000F                  ;$018205	|
	LDA.B [$14],Y                 ;$018208	|
	TAY                           ;$01820A	|
	JSR.W CODE_FN_01829A          ;$01820B	|
	LDA.W #$0009                  ;$01820E	|
	JML.L CreateNewObject        ;$018211	|

CODE_JP_018215:
	LDA.W #$0001                  ;$018215	|
	STA.W $73A8                   ;$018218	|
	LDA.W #$0004                  ;$01821B	|
	STA.W $3330                   ;$01821E	|
	LDA.W #$A94F                  ;$018221	|
	STA.W $6026                   ;$018224	|
	JSL.L CODE_FL_0180FE          ;$018227	|
	LDY.W #$000B                  ;$01822B	|
	LDA.B [$14],Y                 ;$01822E	|
	STA.W $6000                   ;$018230	|
	LDY.W #$000D                  ;$018233	|
	LDA.B [$14],Y                 ;$018236	|
	CLC                           ;$018238	|
	ADC.B $00                     ;$018239	|
	STA.W CameraX_TileMirror                   ;$01823B	|
	LDY.W #$000F                  ;$01823E	|
	LDA.B [$14],Y                 ;$018241	|
	STA.W CameraY_TileMirror                   ;$018243	|
	LDA.W #$0018                  ;$018246	|
	STA.W $6010                   ;$018249	|
	LDA.W #$0040                  ;$01824C	|
	STA.W $6012                   ;$01824F	|
	LDA.W #$0076                  ;$018252	|
	XBA                           ;$018255	|
	ORA.W $6000                   ;$018256	|
	STA.W $6000                   ;$018259	|
	LDA.W #$0009                  ;$01825C	|
	JML.L CreateNewObject        ;$01825F	|

CODE_JP_018263:
    LDX.W #$0000                  ;$018263 |
    BRA CODE_81826B               ;$018266 |

CODE_018268:
    LDX.W #$0002                  ;$018268 |

CODE_81826B:
	LDA.W $330A,X                 ;$01826B	|
	JSR.W CODE_FN_018284          ;$01826E	|
	LDA.W $330E,X                 ;$018271	|
	JSR.W CODE_FN_01829A          ;$018274	|
	LDA.W #$0001                  ;$018277	|
	LDX.W $3382                   ;$01827A	|
	LDY.W $3386                   ;$01827D	|
	JML.L CreateNewObject        ;$018280	|

CODE_FN_018284:
	CLC                           ;$018284	|
	ADC.B $00                     ;$018285	|
	STA.W $3382                   ;$018287	|
	SEC                           ;$01828A	|
	SBC.W #$0080                  ;$01828B	|
	BPL CODE_818293               ;$01828E	|
	LDA.W #$0008                  ;$018290	|

CODE_818293:
	STA.W $3342                   ;$018293	|
	STA.W $3344                   ;$018296	|
	RTS                           ;$018299	|

CODE_FN_01829A:
	STA.W $3386                   ;$01829A	|
	SEC                           ;$01829D	|
	SBC.W #$0058                  ;$01829E	|
	BPL CODE_8182A6               ;$0182A1	|
	LDA.W #$0008                  ;$0182A3	|

CODE_8182A6:
	STA.W $3346                   ;$0182A6	|
	STA.W $3348                   ;$0182A9	|
	RTS                           ;$0182AC	|
	LDA.W #$0002                  ;$0182AD	|
	STA.W $6010                   ;$0182B0	|
	LDA.W #$0004                  ;$0182B3	|
	STA.W $6012                   ;$0182B6	|
	STZ.W $6002                   ;$0182B9	|
	STZ.W $6004                   ;$0182BC	|
	STZ.W $6006                   ;$0182BF	|
	STZ.W $6008                   ;$0182C2	|
	%LoadLongToAX(CODE_81819C)
	JML.L SA1_ExecuteSNES         ;$0182CB	|
	JSL.L AS_ReadWord_L           ;$0182CF	|
	STA.W $6000                   ;$0182D3	|
	LDA.W #$0004                  ;$0182D6	|
	STA.W $6010                   ;$0182D9	|
	LDA.W #$0006                  ;$0182DC	|
	STA.W $6012                   ;$0182DF	|
	STZ.W $6002                   ;$0182E2	|
	STZ.W $6004                   ;$0182E5	|
	STZ.W $6006                   ;$0182E8	|
	STZ.W $6008                   ;$0182EB	|
	LDA.W #$0002                  ;$0182EE	|
	LDX.W #$FFF0                  ;$0182F1	|
	LDY.W #$0082                  ;$0182F4	|
	JSL.L CreateNewObject         ;$0182F7	|
	TAX                           ;$0182FB	|
	LDA.W #$0020                  ;$0182FC	|
	STA.W HelperHP                ;$0182FF	|
	RTL                           ;$018302	|

CODE_FL_018303:
	JSR.W CODE_FN_018307          ;$018303	|
	RTL                           ;$018306	|

CODE_FN_018307:
	LDA.W #$DE18                  ;$018307	|
	LDX.W #$00EF                  ;$01830A	|
	LDY.W #$910F                  ;$01830D	|
	JSL.L WritePal          ;$018310	|
	LDA.W $332E                   ;$018314	|
	AND.W #$0001                  ;$018317	|
	BEQ CODE_81835A               ;$01831A	|
	LDA.W #$0019                  ;$01831C	|
	JSL.L CODE_FL_018101          ;$01831F	|
	LDA.B [$14]                   ;$018323	|
	AND.W #$00FF                  ;$018325	|
	BEQ CODE_81835A               ;$018328	|
	JSL.L CODE_FL_0180DB          ;$01832A	|
	LDA.B [$18]                   ;$01832E	|
	TAY                           ;$018330	|
	LDA.B $18                     ;$018331	|
	INC A                         ;$018333	|
	INC A                         ;$018334	|
	LDX.B $1A                     ;$018335	|
	JSL.L WritePal          ;$018337	|
	LDA.W #$001A                  ;$01833B	|
	JSL.L CODE_FL_018101          ;$01833E	|
	LDA.B [$14]                   ;$018342	|
	AND.W #$00FF                  ;$018344	|
	BEQ CODE_81835A               ;$018347	|
	JSL.L CODE_FL_0180DB          ;$018349	|
	LDA.B [$18]                   ;$01834D	|
	TAY                           ;$01834F	|
	LDA.B $18                     ;$018350	|
	INC A                         ;$018352	|
	INC A                         ;$018353	|
	LDX.B $1A                     ;$018354	|
	JSL.L WritePal_Alt0            ;$018356	|

CODE_81835A:
	LDA.W $332E                   ;$01835A	|
	AND.W #$0002                  ;$01835D	|
	BEQ CODE_8183A0               ;$018360	|
	LDA.W #$001E                  ;$018362	|
	JSL.L CODE_FL_018101          ;$018365	|
	LDA.B [$14]                   ;$018369	|
	AND.W #$00FF                  ;$01836B	|
	BEQ CODE_8183A0               ;$01836E	|
	JSL.L CODE_FL_0180DB          ;$018370	|
	LDA.B [$18]                   ;$018374	|
	TAY                           ;$018376	|
	LDA.B $18                     ;$018377	|
	INC A                         ;$018379	|
	INC A                         ;$01837A	|
	LDX.B $1A                     ;$01837B	|
	JSL.L WritePal          ;$01837D	|
	LDA.W #$001F                  ;$018381	|
	JSL.L CODE_FL_018101          ;$018384	|
	LDA.B [$14]                   ;$018388	|
	AND.W #$00FF                  ;$01838A	|
	BEQ CODE_8183A0               ;$01838D	|
	JSL.L CODE_FL_0180DB          ;$01838F	|
	LDA.B [$18]                   ;$018393	|
	TAY                           ;$018395	|
	LDA.B $18                     ;$018396	|
	INC A                         ;$018398	|
	INC A                         ;$018399	|
	LDX.B $1A                     ;$01839A	|
	JSL.L WritePal_Alt0            ;$01839C	|

CODE_8183A0:
	LDA.W #$83BC                  ;$0183A0	|
	LDX.W #$0001                  ;$0183A3	|
	LDY.W #$0003                  ;$0183A6	|
	JSL.L WritePal          	  ;$0183A9	|
	LDA.W #$0007                  ;$0183AD	|
	LDX.W $331C                   ;$0183B0	|
	BEQ CODE_8183B8               ;$0183B3	|
	LDA.W #$0000                  ;$0183B5	|

CODE_8183B8:
	STA.W $32DC                   ;$0183B8	|
	RTS                           ;$0183BB	|
	dw $0000,$7FFF,$0000          ;$0183BC  |

LoadRoomBackground_NoDMA_L:
	JSR.W LoadRoomBackground_NoDMA;$0183C2	|
	RTL                           ;$0183C5	|

LoadRoomBackground_L:
	JSR.W LoadRoomBackground          ;$0183C6	|
	RTL                           ;$0183C9	|

LoadRoomBackground:
	LDX.W #$0001                  ;$0183CA	|
	LDA.W #$8479                  ;$0183CD	|
	JSL.L LoadDMATable          ;$0183D0	|

LoadRoomBackground_NoDMA:
	LDA.W $332E                   ;$0183D4	|
	AND.W #$0001                  ;$0183D7	|
	BEQ CODE_81840B               ;$0183DA	|
	LDA.W #$0018                  ;$0183DC	|
	JSL.L CODE_FL_018101          ;$0183DF	|
	LDA.B [$14]                   ;$0183E3	|
	AND.W #$00FF                  ;$0183E5	|
	BEQ CODE_81840B               ;$0183E8	|
	JSL.L CODE_FL_0180DB          ;$0183EA	|
	PEA.W $007E                   ;$0183EE	|
	PLB                           ;$0183F1	|
	LDY.W #$2000                  ;$0183F2	|
	JSL.L DecompressData          ;$0183F5	|
	PLB                           ;$0183F9	|
	LDA.W $3320                   ;$0183FA	|
	ASL A                         ;$0183FD	|
	ASL A                         ;$0183FE	|
	TAX                           ;$0183FF	|
	LDA.L PTR16_018482,X         ;$018400	|
	LDX.W #$0001                  ;$018404	|
	JSL.L LoadDMATable            ;$018407	|

CODE_81840B:
	LDA.W $332E                   ;$01840B	|
	AND.W #$0002                  ;$01840E	|
	BEQ CODE_818478               ;$018411	|
	LDA.W #$001D                  ;$018413	|
	JSL.L CODE_FL_018101          ;$018416	|
	LDA.B [$14]                   ;$01841A	|
	AND.W #$00FF                  ;$01841C	|
	BEQ CODE_818478               ;$01841F	|
	JSL.L CODE_FL_0180DB          ;$018421	|
	PEA.W $007E                   ;$018425	|
	PLB                           ;$018428	|
	LDY.W #$2000                  ;$018429	|
	JSL.L DecompressData          ;$01842C	|
	PLB                           ;$018430	|
	LDA.W $3320                   ;$018431	|
	ASL A                         ;$018434	|
	ASL A                         ;$018435	|
	INC A                         ;$018436	|
	INC A                         ;$018437	|
	TAX                           ;$018438	|
	LDA.L PTR16_018482,X          ;$018439	|
	LDX.W #$0001                  ;$01843D	|
	JSL.L LoadDMATable            ;$018440	|
	LDA.W #$0020                  ;$018444	|
	JSL.L CODE_FL_018101          ;$018447	|
	LDA.B [$14]                   ;$01844B	|
	AND.W #$00FF                  ;$01844D	|
	BEQ CODE_818478               ;$018450	|
	JSL.L CODE_FL_0180DB          ;$018452	|
	LDA.B [$18]                   ;$018456	|
	STA.W $333A                   ;$018458	|
	INC.B $18                     ;$01845B	|
	INC.B $18                     ;$01845D	|
	LDA.B [$18]                   ;$01845F	|
	STA.W $333C                   ;$018461	|
	INC.B $18                     ;$018464	|
	INC.B $18                     ;$018466	|
	LDA.B $1A                     ;$018468	|
	LDX.B $18                     ;$01846A	|
	LDY.W #$8000                  ;$01846C	|
	PEA.W $007E                   ;$01846F	|
	PLB                           ;$018472	|
	JSL.L DecompressData          ;$018473	|
	PLB                           ;$018477	|

CODE_818478:
	RTS

; Giant list of DMA tables
DATA8_018479:
    db $83                        ;$018479 |
    dw $1400                      ;$01847A |
    dl DATA8_E12E30               ;$01847C |
    dw $7600                      ;$01847F |
    db $FF                        ;$018481 |

PTR16_018482:
    dw DATA8_018492               ;$018482 |
    dw DATA8_0184B6               ;$018484 |
    dw DATA8_01849B               ;$018486 |
    dw DATA8_0184BF               ;$018488 |
    dw DATA8_0184A4               ;$01848A |
    dw DATA8_0184C8               ;$01848C |
    dw DATA8_0184AD               ;$01848E |
    dw DATA8_0184D1               ;$018490 |

DATA8_018492:
    db $03                        ;$018492 |
    dw $5000                      ;$018493 |
    dl $7E2000                    ;$018495 |
    dw $0000                      ;$018498 |
    db $FF                        ;$01849A |

DATA8_01849B:
    db $03                        ;$01849B |
    dw $5800                      ;$01849C |
    dl $7E2000                    ;$01849E |
    dw $0000                      ;$0184A1 |
    db $FF                        ;$0184A3 |

DATA8_0184A4:
    db $03                        ;$0184A4 |
    dw $6000                      ;$0184A5 |
    dl $7E2000                    ;$0184A7 |
    dw $0000                      ;$0184AA |
    db $FF                        ;$0184AC |

DATA8_0184AD:
    db $03                        ;$0184AD |
    dw $8000                      ;$0184AE |
    dl $7E2000                    ;$0184B0 |
    dw $0000                      ;$0184B3 |
    db $FF                        ;$0184B5 |

DATA8_0184B6:
    db $03                        ;$0184B6 |
    dw $3000                      ;$0184B7 |
    dl $7E2000                    ;$0184B9 |
    dw $2800                      ;$0184BC |
    db $FF                        ;$0184BE |

DATA8_0184BF:
    db $03                        ;$0184BF |
    dw $2800                      ;$0184C0 |
    dl $7E2800                    ;$0184C2 |
    dw $2C00                      ;$0184C5 |
    db $FF                        ;$0184C7 |

DATA8_0184C8:
    db $03                        ;$0184C8 |
    dw $2000                      ;$0184C9 |
    dl $7E3000                    ;$0184CB |
    dw $3000                      ;$0184CE |
    db $FF                        ;$0184D0 |

DATA8_0184D1:
    db $03                        ;$0184D1 |
    dw $8000                      ;$0184D2 |
    dl $7E2000                    ;$0184D4 |
    dw $0000                      ;$0184D7 |
    db $FF           			  ;$0184D9 |

LoadRoomConsumables_L:
	JSR LoadRoomConsumables	  ;$0184DA	|
	RTL							  ;$0184DD	|

LoadRoomConsumables:
	PEA.W $007E                   ;$0184DE	|
	PLB                           ;$0184E1	|
	LDA.W #$00DB                  ;$0184E2	|
	LDX.W #$EE40                  ;$0184E5	|
	LDY.W #$2000                  ;$0184E8	|
	JSL.L DecompressData          ;$0184EB	|
	PLB                           ;$0184EF	|
	LDA.W $32EA                   ;$0184F0	|
	CMP.W #$0003                  ;$0184F3	|
	BEQ CODE_81850E               ;$0184F6	|
	LDA.W $73B0                   ;$0184F8	|
	CMP.W #$0003                  ;$0184FB	|
	BEQ CODE_81850E               ;$0184FE	|
	LDX.W #$0000                  ;$018500	|
	JSR.W CODE_FN_018571          ;$018503	|
	STA.B $00                     ;$018506	|
	LDX.W #$7EA0                  ;$018508	|
	JSR.W CODE_FN_018531          ;$01850B	|

CODE_81850E:
	LDX.W #$0002                  ;$01850E	|
	JSR.W CODE_FN_018571          ;$018511	|
	CMP.B $00                     ;$018514	|
	BEQ CODE_81850E               ;$018516	|
	STA.B $04                     ;$018518	|
	LDX.W #$7EC0                  ;$01851A	|
	JSR.W CODE_FN_018531          ;$01851D	|

CODE_818520:
	LDX.W #$0004                  ;$018520	|
	JSR.W CODE_FN_018571          ;$018523	|
	CMP.B $00                     ;$018526	|
	BEQ CODE_818520               ;$018528	|
	CMP.B $04                     ;$01852A	|
	BEQ CODE_818520               ;$01852C	|
	LDX.W #$7EE0                  ;$01852E	|

CODE_FN_018531:
	PHA                           ;$018531	|
	AND.W #$00F8                  ;$018532	|
	XBA                           ;$018535	|
	LSR A                         ;$018536	|
	STA.B $34                     ;$018537	|
	PLA                           ;$018539	|
	AND.W #$0007                  ;$01853A	|
	XBA                           ;$01853D	|
	LSR A                         ;$01853E	|
	LSR A                         ;$01853F	|
	ORA.B $34                     ;$018540	|
	ORA.W #$2000                  ;$018542	|
	STA.B $34                     ;$018545	|
	LDA.W #$0003                  ;$018547	|
	STA.B $31                     ;$01854A	|
	LDA.W #$0040                  ;$01854C	|
	STA.B $32                     ;$01854F	|
	LDA.W #$007E                  ;$018551	|
	STA.B $36                     ;$018554	|
	STX.B CameraX_TileMirror                     ;$018556	|
	JSL.L WriteToDMABuffer     ;$018558	|
	LDA.B $34                     ;$01855C	|
	CLC                           ;$01855E	|
	ADC.W #$0200                  ;$01855F	|
	STA.B $34                     ;$018562	|
	LDA.B CameraX_TileMirror                     ;$018564	|
	CLC                           ;$018566	|
	ADC.W #$0100                  ;$018567	|
	STA.B CameraX_TileMirror                     ;$01856A	|
	JSL.L WriteToDMABuffer     ;$01856C	|
	RTS                           ;$018570	|

CODE_FN_018571:
    JMP.W (PTR16_018574,X)        ;$018571 |
PTR16_018574:
    dw CODE_01857A                ;$018574 |
    dw CODE_018581                ;$018576 |
    dw CODE_01858B                ;$018578 |

CODE_01857A:
    LDA.W Current_Room                   ;$01857A |
    AND.W #$000F                  ;$01857D |
    RTS                           ;$018580 |

CODE_018581:
    LDA.W Current_Room                   ;$018581 |
    AND.W #$000F                  ;$018584 |
    ORA.W #$0010                  ;$018587 |
    RTS                           ;$01858A |

CODE_01858B:
    LDA.W Current_Room                   ;$01858B |
    AND.W #$000F                  ;$01858E |
    LSR A                         ;$018591 |
    ORA.W #$0020                  ;$018592 |
    RTS                           ;$018595 |

CODE_FL_018596:
    JSR.W CODE_FN_01859A          ;$018596 |
    RTL                  ;$018599	|

CODE_FN_01859A:
	LDA.W $32EA                   ;$01859A	|
	CMP.W #$0002                  ;$01859D	|
	BEQ CODE_8185B3               ;$0185A0	|
	CMP.W #$0003                  ;$0185A2	|
	BNE CODE_8185AA               ;$0185A5	|
	JMP.W CODE_JP_018654          ;$0185A7	|

CODE_8185AA:
	CMP.W #$0004                  ;$0185AA	|
	BNE CODE_8185B2               ;$0185AD	|
	JMP.W CODE_JP_01865F          ;$0185AF	|

CODE_8185B2:
	RTS                           ;$0185B2	|

CODE_8185B3:
	LDA.W #$A392                  ;$0185B3	|
	LDX.W #$00EF                  ;$0185B6	|
	LDY.W #$C020                  ;$0185B9	|
	JSL.L WritePal          ;$0185BC	|
	PEA.W $007E                   ;$0185C0	|
	PLB                           ;$0185C3	|
	LDA.W #$00E4                  ;$0185C4	|
	LDX.W #$926A                  ;$0185C7	|
	LDY.W #$2000                  ;$0185CA	|
	JSL.L DecompressData          ;$0185CD	|
	PLB                           ;$0185D1	|
	LDA.W #$8610                  ;$0185D2	|
	LDX.W #$0001                  ;$0185D5	|
	JSL.L LoadDMATable          ;$0185D8	|
	PEA.W $007E                   ;$0185DC	|
	PLB                           ;$0185DF	|
	LDA.W #$00DB                  ;$0185E0	|
	LDX.W #$EE40                  ;$0185E3	|
	LDY.W #$2000                  ;$0185E6	|
	JSL.L DecompressData          ;$0185E9	|
	PLB                           ;$0185ED	|
	LDA.W #$8621                  ;$0185EE	|
	LDX.W $32EE                   ;$0185F1	|
	BEQ CODE_0185FF               ;$0185F4	|
	LDA.W #$8632                  ;$0185F6	|
	DEX                           ;$0185F9	|
	BEQ CODE_0185FF               ;$0185FA	|
	LDA.W #$8643                  ;$0185FC	|

CODE_0185FF:
	LDX.W #$0001                  ;$0185FF	|
	JSL.L LoadDMATable          ;$018602	|
	SEP #$20                      ;$018606	|
	LDA.B #$17                    ;$018608	|
	STA.W $3072                   ;$01860A	|
	REP #$20                      ;$01860D	|
	RTS                           ;$01860F	|

    dw $0003,$0004,$7E20,$7400    ;$018610 |
    dw $C003,$0008,$7E24,$6A00    ;$018618 |
    dw $03FF,$0400,$2000,$007E    ;$018620 |
    dw $0370,$0400,$2800,$007E    ;$018628 |
    dw $FF72,$0003,$0004,$7E24    ;$018630 |
    dw $7000,$0003,$0004,$7E2C    ;$018638 |
    dw $7200,$03FF,$0400,$3000    ;$018640 |
    dw $007E,$0370,$0400,$2800    ;$018648 |
    dw $007E,$FF72                ;$018650 |

CODE_JP_018654:
	LDA.W #$470F                  ;$018654	|
	LDX.W #$00CF                  ;$018657	|
	JSL.L LoadDMATable          ;$01865A	|
	RTS                           ;$01865E	|

CODE_JP_01865F:
	LDA.W $32EE                   ;$01865F	|
	CMP.W #$0007                  ;$018662	|
	BNE CODE_018673               ;$018665	|
	LDA.W Current_Room                   ;$018667	|
	CMP.W #$0001                  ;$01866A	|
	BNE CODE_018673               ;$01866D	|
	JSL.L CODE_FL_D5999E          ;$01866F	|

CODE_018673:
	RTS                           ;$018673	|

LoadRoomTileset_L:
	JSR.W LoadRoomTileset        ;$018674	|
	RTL                           ;$018677	|

LoadRoomTileset:
	LDA.W #$001B                  ;$018678	|
	JSL.L CODE_FL_018101          ;$01867B	|
	LDA.B [$14]                   ;$01867F	|
	BEQ CODE_818693               ;$018681	|
	JSL.L CODE_FL_0180DB          ;$018683	|
	PEA.W $007F                   ;$018687	|
	PLB                           ;$01868A	|
	LDY.W #$3000                  ;$01868B	|
	JSL.L DecompressData          ;$01868E	|
	PLB                           ;$018692	|

CODE_818693:
	RTS                           ;$018693	|
	JSR.W CODE_FN_018698          ;$018694	|
	RTL                           ;$018697	|

CODE_FN_018698:
	LDA.W $3308                   ;$018698	|
	STA.B $5D                     ;$01869B	|
	STA.B $16                     ;$01869D	|
	LDA.W $3306                   ;$01869F	|
	STA.B $14                     ;$0186A2	|
	INC A                         ;$0186A4	|
	INC A                         ;$0186A5	|
	STA.B $5E                     ;$0186A6	|
	LDA.B [$14]                   ;$0186A8	|
	CLC                           ;$0186AA	|
	ADC.B $14                     ;$0186AB	|
	STA.B $14                     ;$0186AD	|
	INC A                         ;$0186AF	|
	INC A                         ;$0186B0	|
	STA.B $60                     ;$0186B1	|
	LDA.B [$14]                   ;$0186B3	|
	CLC                           ;$0186B5	|
	ADC.B $14                     ;$0186B6	|
	STA.B $14                     ;$0186B8	|
	INC A                         ;$0186BA	|
	INC A                         ;$0186BB	|
	STA.B $62                     ;$0186BC	|
	LDA.B [$14]                   ;$0186BE	|
	CLC                           ;$0186C0	|
	ADC.B $14                     ;$0186C1	|
	STA.B $14                     ;$0186C3	|
	INC.B $14                     ;$0186C5	|
	INC.B $14                     ;$0186C7	|
	LDA.B [$14]                   ;$0186C9	|
	STA.B $51                     ;$0186CB	|
	INC.B $14                     ;$0186CD	|
	INC.B $14                     ;$0186CF	|
	LDA.B [$14]                   ;$0186D1	|
	STA.B $57                     ;$0186D3	|
	INC.B $14                     ;$0186D5	|
	INC.B $14                     ;$0186D7	|
	LDA.W #$8B30                  ;$0186D9	|
	LDX.W #$0001                  ;$0186DC	|
	JSL.L SNES_ExecuteSA1          ;$0186DF	|
	PHB                           ;$0186E3	|
	PEA.W $7F7E                   ;$0186E4	|
	PLB                           ;$0186E7	|
	LDA.B $16                     ;$0186E8	|
	LDX.B $14                     ;$0186EA	|
	LDY.W #$2000                  ;$0186EC	|
	JSL.L DecompressData          ;$0186EF	|
	PLB                           ;$0186F3	|
	LDA.W #$2000                  ;$0186F4	|
	STA.B $14                     ;$0186F7	|
	LDA.W #$007E                  ;$0186F9	|
	STA.B $16                     ;$0186FC	|
	LDA.B $4F                     ;$0186FE	|
	LSR A                         ;$018700	|
	TAY                           ;$018701	|
	LDX.W #$0000                  ;$018702	|

CODE_818705:
	SEP #$20                      ;$018705	|
	LDA.B [$14],Y                 ;$018707	|
	XBA                           ;$018709	|
	LDA.B [$14]                   ;$01870A	|
	REP #$20                      ;$01870C	|
	STA.W $0000,X                 ;$01870E	|
	INC.B $14                     ;$018711	|
	INX                           ;$018713	|
	INX                           ;$018714	|
	CPX.B $4F                     ;$018715	|
	BCC CODE_818705               ;$018717	|
	TYA                           ;$018719	|
	CLC                           ;$01871A	|
	ADC.B $14                     ;$01871B	|
	STA.B $14                     ;$01871D	|
	LDX.W #$0FFE                  ;$01871F	|

CODE_818722:
	STZ.W $2000,X                 ;$018722	|
	DEX                           ;$018725	|
	DEX                           ;$018726	|
	BPL CODE_818722               ;$018727	|
	PLB                           ;$018729	|
	STZ.B $02                     ;$01872A	|
	STZ.B $04                     ;$01872C	|
	STZ.B $06                     ;$01872E	|
	STZ.B $08                     ;$018730	|
	STZ.B $0A                     ;$018732	|
	STZ.B $0C                     ;$018734	|
	STZ.B $0E                     ;$018736	|
	LDY.W #$0000                  ;$018738	|

CODE_81873B:
	STY.B $00                     ;$01873B	|
	LDA.B [$14],Y                 ;$01873D	|
	CMP.W #$FFFF                  ;$01873F	|
	BNE CODE_818747               ;$018742	|
	JMP.W CODE_JP_018A96          ;$018744	|

CODE_818747:
	CMP.W #$F000                  ;$018747	|
	BCC CODE_818768               ;$01874A	|
	STA.B $28                     ;$01874C	|
	SBC.W #$F000                  ;$01874E	|
	XBA                           ;$018751	|
	AND.W #$00FF                  ;$018752	|
	ASL A                         ;$018755	|
	TAX                           ;$018756	|
	JMP.W (CODE_01875A,X)         ;$018757	|

CODE_01875A:
	LDX.B $87,Y                   ;$01875A	|
    dw CODE_0187DF                ;$01875C |
    dw CODE_018876                ;$01875E |
    dw CODE_0188A5                ;$018760 |
    dw CODE_0188DA                ;$018762 |
    dw CODE_0189F3                ;$018764 |
    dw CODE_018A6D                ;$018766 |

CODE_818768:
	CMP.W #$0100                  ;$018768	|
	BCC CODE_8187AE               ;$01876B	|
	LDX.B $02                     ;$01876D	|
	STA.W $09A8,X                 ;$01876F	|
	XBA                           ;$018772	|
	AND.W #$00FF                  ;$018773	|
	CMP.W #$009B                  ;$018776	|
	BNE CODE_818798               ;$018779	|
	PHX                           ;$01877B	|
	PHY                           ;$01877C	|
	LDA.B $14                     ;$01877D	|
	PHA                           ;$01877F	|
	LDA.B $16                     ;$018780	|
	PHA                           ;$018782	|
	LDA.W $09A8,X                 ;$018783	|
	AND.W #$00FF                  ;$018786	|
	LDX.W #$774F                  ;$018789	|
	JSL.L CODE_FL_00EA62          ;$01878C	|
	PLA                           ;$018790	|
	STA.B $16                     ;$018791	|
	PLA                           ;$018793	|
	STA.B $14                     ;$018794	|
	PLY                           ;$018796	|
	PLX                           ;$018797	|

CODE_818798:
	INY                           ;$018798	|
	INY                           ;$018799	|
	LDA.B [$14],Y                 ;$01879A	|
	STA.W $0BA8,X                 ;$01879C	|
	INY                           ;$01879F	|
	INY                           ;$0187A0	|
	LDA.B [$14],Y                 ;$0187A1	|
	STA.W $0DA8,X                 ;$0187A3	|
	INY                           ;$0187A6	|
	INY                           ;$0187A7	|
	INX                           ;$0187A8	|
	INX                           ;$0187A9	|
	STX.B $02                     ;$0187AA	|
	BRA CODE_81873B               ;$0187AC	|

CODE_8187AE:
	TYA                           ;$0187AE	|
	CLC                           ;$0187AF	|
	ADC.W #$0006                  ;$0187B0	|
	TAY                           ;$0187B3	|
	BRA CODE_81873B               ;$0187B4	|
	LDX.B $04                     ;$0187B6	|
	CPX.W #$0020                  ;$0187B8	|
	BCC CODE_0187C0               ;$0187BB	|
	JMP.W CODE_8187AE             ;$0187BD	|

CODE_0187C0:
    LDA.B $28                     ;$0187C0 |
    AND.W #$00FF                  ;$0187C2 |
    STA.W $103C,X                 ;$0187C5 |
    INY                           ;$0187C8 |
    INY                           ;$0187C9 |
    LDA.B [$14],Y                 ;$0187CA |
    STA.W $105C,X                 ;$0187CC |
    INY                           ;$0187CF |
    INY                           ;$0187D0 |
    LDA.B [$14],Y                 ;$0187D1 |
    STA.W $107C,X                 ;$0187D3 |
    INY                           ;$0187D6 |
    INY                           ;$0187D7 |
    INX                           ;$0187D8 |
    INX                           ;$0187D9 |
    STX.B $04                     ;$0187DA |
    JMP.W CODE_81873B             ;$0187DC |

CODE_0187DF:
    LDX.B $06                     ;$0187DF |
    CPX.W #$000C                  ;$0187E1 |
    BCC CODE_0187E9               ;$0187E4 |
    JMP.W CODE_8187AE             ;$0187E6 |

CODE_0187E9:
	INY                           ;$0187E9	|
	INY                           ;$0187EA	|
	LDA.B [$14],Y                 ;$0187EB	|
	STA.W $73C5,X                 ;$0187ED	|
	INY                           ;$0187F0	|
	INY                           ;$0187F1	|
	LDA.B [$14],Y                 ;$0187F2	|
	STA.W $73D1,X                 ;$0187F4	|
	INY                           ;$0187F7	|
	INY                           ;$0187F8	|
	STY.B $00                     ;$0187F9	|
	LDY.W $73D1,X                 ;$0187FB	|
	LDA.W $73C5,X                 ;$0187FE	|
	TAX                           ;$018801	|
	JSL.L CODE_FL_01CE46          ;$018802	|
	LDY.W #$0000                  ;$018806	|

CODE_018809:
	LDA.B [$64]                   ;$018809	|
	AND.W #$03FF                  ;$01880B	|
	TAX                           ;$01880E	|
	LDA.L $7F62A0,X               ;$01880F	|
	AND.W #$007F                  ;$018813	|
	CMP.W #$0050                  ;$018816	|
	BCS CODE_01882C               ;$018819	|
	TYA                           ;$01881B	|
	ADC.W #$0018                  ;$01881C	|
	TAY                           ;$01881F	|
	LDA.B $64                     ;$018820	|
	ADC.B $53                     ;$018822	|
	CMP.B $4F                     ;$018824	|
	BCS CODE_01882C               ;$018826	|
	STA.B $64                     ;$018828	|
	BRA CODE_018809               ;$01882A	|

CODE_01882C:
	LDX.B $06                     ;$01882C	|
	TYA                           ;$01882E	|
	STA.W $73B9,X                 ;$01882F	|
	LDA.B $28                     ;$018832	|
	AND.W #$00FF                  ;$018834	|
	STA.W $73E9,X                 ;$018837	|
	LDX.W #$0000                  ;$01883A	|
	SEC                           ;$01883D	|

CODE_01883E:
	SBC.W #$0010                  ;$01883E	|
	BCC CODE_018846               ;$018841	|
	INX                           ;$018843	|
	BRA CODE_01883E               ;$018844	|

CODE_018846:
	ADC.W #$0010                  ;$018846	|
	ASL A                         ;$018849	|
	TAY                           ;$01884A	|
	LDA.W $774F,X                 ;$01884B	|
	LDX.B $06                     ;$01884E	|
	AND.W All_Bits16_BE,Y         ;$018850	|
	BEQ CODE_01885D               ;$018853	|
	LDA.W #$0005                  ;$018855	|
	STA.W $73DD,X                 ;$018858	|
	BRA CODE_018863               ;$01885B	|

CODE_01885D:
	LDA.W $73B9,X                 ;$01885D	|
	STA.W $73DD,X                 ;$018860	|

CODE_018863:
    LDA.W $73D1,X                 ;$018863 |
    SEC                           ;$018866 |
    SBC.W #$0018                  ;$018867 |
    STA.W $73D1,X                 ;$01886A |
    INX                           ;$01886D |
    INX                           ;$01886E |
    STX.B $06                     ;$01886F |
    LDY.B $00                     ;$018871 |
    JMP.W CODE_81873B             ;$018873 |

CODE_018876:
    LDX.B $08                     ;$018876 |
    CPX.W #$0020                  ;$018878 |
    BCC CODE_018880               ;$01887B |
    JMP.W CODE_8187AE             ;$01887D |

CODE_018880:
	LDA.B [$14],Y                 ;$018880	|
	AND.W #$00FF                  ;$018882	|
	BNE CODE_01888A               ;$018885	|
	LDA.W #$0401                  ;$018887	|

CODE_01888A:
    DEC A                         ;$01888A |
    STA.W $109C,X                 ;$01888B |
    INY                           ;$01888E |
    INY                           ;$01888F |
    LDA.B [$14],Y                 ;$018890 |
    STA.W $10BC,X                 ;$018892 |
    INY                           ;$018895 |
    INY                           ;$018896 |
    LDA.B [$14],Y                 ;$018897 |
    STA.W $10DC,X                 ;$018899 |
    INY                           ;$01889C |
    INY                           ;$01889D |
    INX                           ;$01889E |
    INX                           ;$01889F |
    STX.B $08                     ;$0188A0 |
    JMP.W CODE_81873B             ;$0188A2 |

CODE_0188A5:
    LDX.B $0A                     ;$0188A5 |
    CPX.W #$0008                  ;$0188A7 |
    BCC CODE_0188AF               ;$0188AA |
    JMP.W CODE_8187AE             ;$0188AC |

CODE_0188AF:
    LDA.B [$14],Y                 ;$0188AF |
    AND.W #$00FF                  ;$0188B1 |
    STA.W $1120,X                 ;$0188B4 |
    INY                           ;$0188B7 |
    INY                           ;$0188B8 |
    LDA.B [$14],Y                 ;$0188B9 |
    STA.W $1128,X                 ;$0188BB |
    INY                           ;$0188BE |
    INY                           ;$0188BF |
    LDA.B [$14],Y                 ;$0188C0 |
    STA.W $1130,X                 ;$0188C2 |
    INY                           ;$0188C5 |
    INY                           ;$0188C6 |
    LDA.W #$FFFF                  ;$0188C7 |
    STA.W $1140,X                 ;$0188CA |
    STA.W $1148,X                 ;$0188CD |
    STZ.W $1138,X                 ;$0188D0 |
    INX                           ;$0188D3 |
    INX                           ;$0188D4 |
    STX.B $0A                     ;$0188D5 |
    JMP.W CODE_81873B             ;$0188D7 |

CODE_0188DA:
    LDX.B $0C                     ;$0188DA |
    CPX.W #$0020                  ;$0188DC |
    BCC CODE_0188E4               ;$0188DF |
    JMP.W CODE_8187AE             ;$0188E1 |


CODE_0188E4:
	STZ.W $1210,X                 ;$0188E4	|
	STZ.W $1230,X                 ;$0188E7	|
	LDA.B [$14],Y                 ;$0188EA	|
	AND.W #$00FF                  ;$0188EC	|
	XBA                           ;$0188EF	|
	ASL A                         ;$0188F0	|
	BCC CODE_0188F6               ;$0188F1	|
	ORA.W #$0080                  ;$0188F3	|

CODE_0188F6:
	XBA                           ;$0188F6	|
	LSR A                         ;$0188F7	|
	STA.W $1150,X                 ;$0188F8	|
	INY                           ;$0188FB	|
	INY                           ;$0188FC	|
	LDA.B [$14],Y                 ;$0188FD	|
	STA.W $1190,X                 ;$0188FF	|
	STA.W $11F0,X                 ;$018902	|
	STZ.W $1170,X                 ;$018905	|
	INY                           ;$018908	|
	INY                           ;$018909	|
	LDA.B [$14],Y                 ;$01890A	|
	SEC                           ;$01890C	|
	SBC.W #$0004                  ;$01890D	|
	STA.W $11D0,X                 ;$018910	|
	STZ.W $11B0,X                 ;$018913	|
	INY                           ;$018916	|
	INY                           ;$018917	|
	STY.B $00                     ;$018918	|
	LDA.W $1150,X                 ;$01891A	|
	AND.W #$007F                  ;$01891D	|
	CMP.W #$0004                  ;$018920	|
	BCS CODE_018972               ;$018923	|
	PHX                           ;$018925	|
	LDA.W $1190,X                 ;$018926	|
	LDY.W $11D0,X                 ;$018929	|
	TAX                           ;$01892C	|
	JSL.L CODE_FL_01CE20          ;$01892D	|
	PLX                           ;$018931	|
	AND.W #$007F                  ;$018932	|
	SEC                           ;$018935	|
	SBC.W #$0010                  ;$018936	|
	CMP.W #$0014                  ;$018939	|
	BCC CODE_01894C               ;$01893C	|
	LDA.W $1150,X                 ;$01893E	|
	AND.W #$0080                  ;$018941	|
	ORA.W #$000C                  ;$018944	|
	STA.W $1150,X                 ;$018947	|
	BRA CODE_018972               ;$01894A	|

CODE_01894C:
	TXY                           ;$01894C	|
	ASL A                         ;$01894D	|
	TAX                           ;$01894E	|
	LDA.W $1190,Y                 ;$01894F	|
	CLC                           ;$018952	|
	ADC.L DATA16_01897B,X          ;$018953	|
	STA.W $1190,Y                 ;$018957	|
	LDA.W $11D0,Y                 ;$01895A	|
	CLC                           ;$01895D	|
	ADC.L DATA16_0189A3,X          ;$01895E	|
	STA.W $11D0,Y                 ;$018962	|
	LDA.L DATA16_0189CB,X          ;$018965	|
	STA.W $1210,Y                 ;$018969	|
	LDA.B $64                     ;$01896C	|
	STA.W $1230,Y                 ;$01896E	|
	TYX                           ;$018971	|

CODE_018972:
	INX                           ;$018972	|
	INX                           ;$018973	|
	STX.B $0C                     ;$018974	|
	LDY.B $00                     ;$018976	|
	JMP.W CODE_81873B             ;$018978	|

DATA16_01897B:
    dw $0000,$0000,$0000,$0000    ;$01897B |
    dw $0004,$FFFC,$0004,$FFFC    ;$018983 |
    dw $0004,$FFFC,$0004,$FFFC    ;$01898B |
    dw $0000,$0000,$0000,$0000    ;$018993 |
    dw $0000,$0000,$0000,$0000    ;$01899B |

DATA16_0189A3:
    dw $0000,$0000,$0000,$0000    ;$0189A3 |
    dw $0004,$0004,$FFFC,$FFFC    ;$0189AB |
    dw $0000,$0000,$0000,$0000    ;$0189B3 |
    dw $0004,$FFFC,$FFFC,$0004    ;$0189BB |
    dw $0000,$0000,$0000,$0000    ;$0189C3 |

DATA16_0189CB:
    dw $0000,$4000,$2000,$6000    ;$0189CB |
    dw $2000,$6000,$6000,$2000    ;$0189D3 |
    dw $1000,$1000,$7000,$7000    ;$0189DB |
    dw $3000,$3000,$5000,$5000    ;$0189E3 |
    dw $0000,$0000,$8000,$8000    ;$0189EB |

CODE_0189F3:
	LDX.B $0C                     ;$0189F3	|
	CPX.W #$0020                  ;$0189F5	|
	BCC CODE_0189FD               ;$0189F8	|
	JMP.W CODE_8187AE             ;$0189FA	|

CODE_0189FD:
	LDA.B [$14],Y                 ;$0189FD	|
	XBA                           ;$0189FF	|
	ASL A                         ;$018A00	|
	LDA.W #$8000                  ;$018A01	|
	ROR A                         ;$018A04	|
	LSR A                         ;$018A05	|
	STA.W $1150,X                 ;$018A06	|
	INY                           ;$018A09	|
	INY                           ;$018A0A	|
	LDA.B [$14],Y                 ;$018A0B	|
	SEC                           ;$018A0D	|
	SBC.W #$000C                  ;$018A0E	|
	STA.W $1190,X                 ;$018A11	|
	STA.W $11F0,X                 ;$018A14	|
	STZ.W $1170,X                 ;$018A17	|
	INY                           ;$018A1A	|
	INY                           ;$018A1B	|
	LDA.B [$14],Y                 ;$018A1C	|
	SEC                           ;$018A1E	|
	SBC.W #$000C                  ;$018A1F	|
	STA.W $11D0,X                 ;$018A22	|
	STZ.W $11B0,X                 ;$018A25	|
	INY                           ;$018A28	|
	INY                           ;$018A29	|
	STY.B $00                     ;$018A2A	|
	PHX                           ;$018A2C	|
	LDA.W $11D0,X                 ;$018A2D	|
	SEC                           ;$018A30	|
	SBC.W #$0018                  ;$018A31	|
	TAY                           ;$018A34	|
	LDA.W $1190,X                 ;$018A35	|
	TAX                           ;$018A38	|
	JSL.L CODE_FL_01CE46          ;$018A39	|
	LDY.W #$0000                  ;$018A3D	|

CODE_018A40:
	LDA.B [$64]                   ;$018A40	|
	AND.W #$03FF                  ;$018A42	|
	TAX                           ;$018A45	|
	LDA.L $7F62A0,X               ;$018A46	|
	AND.W #$007F                  ;$018A4A	|
	CMP.W #$0030                  ;$018A4D	|
	BCS CODE_018A5C               ;$018A50	|
	INY                           ;$018A52	|
	LDA.B $64                     ;$018A53	|
	SEC                           ;$018A55	|
	SBC.B $53                     ;$018A56	|
	STA.B $64                     ;$018A58	|
	BCS CODE_018A40               ;$018A5A	|

CODE_018A5C:
    PLX                           ;$018A5C |
    TYA                           ;$018A5D |
    STA.W $1210,X                 ;$018A5E |
    STZ.W $1230,X                 ;$018A61 |
    INX                           ;$018A64 |
    INX                           ;$018A65 |
    STX.B $0C                     ;$018A66 |
    LDY.B $00                     ;$018A68 |
    JMP.W CODE_81873B             ;$018A6A |

CODE_018A6D:
    LDX.B $0E                     ;$018A6D |
    CPX.W #$0008                  ;$018A6F |
    BCC CODE_018A77               ;$018A72 |
    JMP.W CODE_8187AE             ;$018A74 |

CODE_018A77:
	LDA.B [$14],Y                 ;$018A77	|
	AND.W #$0003                  ;$018A79	|
	STA.W $1250,X                 ;$018A7C	|
	INY                           ;$018A7F	|
	INY                           ;$018A80	|
	LDA.B [$14],Y                 ;$018A81	|
	STA.W $1258,X                 ;$018A83	|
	INY                           ;$018A86	|
	INY                           ;$018A87	|
	LDA.B [$14],Y                 ;$018A88	|
	STA.W $1260,X                 ;$018A8A	|
	INY                           ;$018A8D	|
	INY                           ;$018A8E	|
	INX                           ;$018A8F	|
	INX                           ;$018A90	|
	STX.B $0E                     ;$018A91	|
	JMP.W CODE_81873B             ;$018A93	|

CODE_JP_018A96:
	LDX.B $02                     ;$018A96	|
	STA.W $09A8,X                 ;$018A98	|
	LDX.B $04                     ;$018A9B	|
	CPX.W #$0020                  ;$018A9D	|
	BCS CODE_818AA5               ;$018AA0	|
	STA.W $103C,X                 ;$018AA2	|

CODE_818AA5:
	LDX.B $06                     ;$018AA5	|
	CPX.W #$000C                  ;$018AA7	|
	BCS CODE_818AAF               ;$018AAA	|
	STA.W $73B9,X                 ;$018AAC	|

CODE_818AAF:
	LDX.B $08                     ;$018AAF	|
	CPX.W #$0020                  ;$018AB1	|
	BCS CODE_818AB9               ;$018AB4	|
	STA.W $109C,X                 ;$018AB6	|

CODE_818AB9:
	LDX.B $0A                     ;$018AB9	|
	CPX.W #$0008                  ;$018ABB	|
	BCS CODE_818AC3               ;$018ABE	|
	STA.W $1120,X                 ;$018AC0	|

CODE_818AC3:
	LDX.B $0C                     ;$018AC3	|
	CPX.W #$0020                  ;$018AC5	|
	BCS CODE_818ACD               ;$018AC8	|
	STA.W $1150,X                 ;$018ACA	|

CODE_818ACD:
	LDX.B $0E                     ;$018ACD	|
	CPX.W $0008                   ;$018ACF	|
	BCS CODE_818AD7               ;$018AD2	|
	STA.W $1250,X                 ;$018AD4	|

CODE_818AD7:
	LDA.W $375E                   ;$018AD7	|
	STA.B $14                     ;$018ADA	|
	LDA.W $375D                   ;$018ADC	|
	STA.B $16                     ;$018ADF	|
	LDA.B [$14]                   ;$018AE1	|
	BNE CODE_818B1D               ;$018AE3	|
	LDY.W #$0002                  ;$018AE5	|
	LDA.B [$14],Y                 ;$018AE8	|
	ASL A                         ;$018AEA	|
	ADC.W #$3000                  ;$018AEB	|
	STA.B $00                     ;$018AEE	|
	LDY.W #$0004                  ;$018AF0	|
	LDA.B [$14],Y                 ;$018AF3	|
	ASL A                         ;$018AF5	|
	ADC.W #$3000                  ;$018AF6	|
	STA.B $02                     ;$018AF9	|
	PEA.W $007F                   ;$018AFB	|
	PLB                           ;$018AFE	|
	LDX.W #$0010                  ;$018AFF	|

CODE_018B02:
	LDA.L DATA16_018B1E,X          ;$018B02	|
	TAY                           ;$018B06	|
	LDA.B ($00),Y                 ;$018B07	|
	STA.W $359C,Y                 ;$018B09	|
	LDA.B ($02),Y                 ;$018B0C	|
	STA.W $359E,Y                 ;$018B0E	|
	DEX                           ;$018B11	|
	DEX                           ;$018B12	|
	BPL CODE_018B02               ;$018B13	|
	PLB                           ;$018B15	|
	LDA.W #$2770                  ;$018B16	|
	STA.L $7F656E                 ;$018B19	|

CODE_818B1D:
	RTS                           ;$018B1D	|

DATA16_018B1E:
    dw $0000,$05A0,$0B40,$10E0    ;$018B1E  |
    dw $1680,$1C20,$21C0,$2760    ;$018B26  |
    dw $2D00                      ;$018B2E  |

CODE_818B30:
	STZ.W $2250                   ;$018B30	|
	LDA.B $51                     ;$018B33	|
	ASL A                         ;$018B35	|
	STA.B $53                     ;$018B36	|
	STA.W $2251                   ;$018B38	|
	LDA.B $57                     ;$018B3B	|
	STA.W $2253                   ;$018B3D	|
	LDY.W $333A                   ;$018B40	|
	LDA.W $2306                   ;$018B43	|
	STA.B $4F                     ;$018B46	|
	STY.W $2251                   ;$018B48	|
	LDA.W $333C                   ;$018B4B	|
	STA.W $2253                   ;$018B4E	|
	LDY.W #$0018                  ;$018B51	|
	LDA.W $2306                   ;$018B54	|
	ASL A                         ;$018B57	|
	STA.W $3338                   ;$018B58	|
	LDA.W #$0014                  ;$018B5B	|
	STA.W Room_Bound_Offset_X                   ;$018B5E	|
	LDA.W #$0014                  ;$018B61	|
	STA.W Room_Bound_Offset_Y                   ;$018B64	|
	LDA.B $51                     ;$018B67	|
	STY.W $2251                   ;$018B69	|
	STA.W $2253                   ;$018B6C	|
	SEC                           ;$018B6F	|
	LDA.W $2306                   ;$018B70	|
	STA.B $55                     ;$018B73	|
	SBC.W #$0108                  ;$018B75	|
	BMI CODE_818B7F               ;$018B78	|
	CMP.W #$0008                  ;$018B7A	|
	BCS CODE_818B82               ;$018B7D	|

CODE_818B7F:
	LDA.W #$0008                  ;$018B7F	|

CODE_818B82:
	STA.W $336A                   ;$018B82	|
	CLC                           ;$018B85	|
	ADC.W #$00F4                  ;$018B86	|
	STA.W Room_Size_X                   ;$018B89	|
	LDA.B $57                     ;$018B8C	|
	STA.W $2253                   ;$018B8E	|
	SEC                           ;$018B91	|
	LDA.W $2306                   ;$018B92	|
	STA.B $59                     ;$018B95	|
	SBC.W #$00B8                  ;$018B97	|
	BMI CODE_818BA1               ;$018B9A	|
	CMP.W #$0008                  ;$018B9C	|
	BCS CODE_818BA4               ;$018B9F	|

CODE_818BA1:
	LDA.W #$0008                  ;$018BA1	|

CODE_818BA4:
	STA.W $3368                   ;$018BA4	|
	CLC                           ;$018BA7	|
	ADC.W #$00B0                  ;$018BA8	|
	STA.W Room_Size_Y                   ;$018BAB	|
	LDA.W #$0001                  ;$018BAE	|
	STA.W $2250                   ;$018BB1	|
	LDA.W #$4000                  ;$018BB4	|
	STA.W $2251                   ;$018BB7	|
	LDX.B $55                     ;$018BBA	|
	STX.W $2253                   ;$018BBC	|
	SEC                           ;$018BBF	|
	SBC.W $2308                   ;$018BC0	|
	STA.B $5B                     ;$018BC3	|
	LDA.W $3322                   ;$018BC5	|
	AND.W #$8000                  ;$018BC8	|
	BEQ CODE_818BD6               ;$018BCB	|
	LDA.W #$7F00                  ;$018BCD	|
	STA.W $336A                   ;$018BD0	|
	STA.W Room_Size_X                   ;$018BD3	|

CODE_818BD6:
	RTL                           ;$018BD6	|

CODE_FN_018BD7:
	LDA.W $332E                   ;$018BD7	|
	AND.W #$0001                  ;$018BDA	|
	BEQ CODE_818BE2               ;$018BDD	|
	JSR.W CODE_FN_018BEE          ;$018BDF	|

CODE_818BE2:
	LDA.W $332E                   ;$018BE2	|
	AND.W #$0002                  ;$018BE5	|
	BEQ CODE_818BED               ;$018BE8	|
	JSR.W CODE_FN_018C4E          ;$018BEA	|

CODE_818BED:
	RTS                           ;$018BED	|

CODE_FN_018BEE:
	LDA.W $337A                   ;$018BEE	|
	STA.B $00                     ;$018BF1	|
	LDA.W $3376                   ;$018BF3	|
	STA.B $02                     ;$018BF6	|
	LDA.W $3378                   ;$018BF8	|
	STA.B $04                     ;$018BFB	|
	LDA.W $337E                   ;$018BFD	|
	SEC                           ;$018C00	|
	SBC.W #$0006                  ;$018C01	|
	STA.W $337E                   ;$018C04	|
	LDX.W #$001E                  ;$018C07	|

CODE_818C0A:
	PHX                           ;$018C0A	|
	LDA.W $3374                   ;$018C0B	|
	SEC                           ;$018C0E	|
	SBC.W #$0002                  ;$018C0F	|
	BPL CODE_818C17               ;$018C12	|
	CLC                           ;$018C14	|
	ADC.B $53                     ;$018C15	|

CODE_818C17:
	STA.B $06                     ;$018C17	|
	JSL.L CODE_FL_018F40          ;$018C19	|
	LDA.B $04                     ;$018C1D	|
	CLC                           ;$018C1F	|
	ADC.W #$10E0                  ;$018C20	|
	CMP.W #$32A0                  ;$018C23	|
	BCC CODE_818C2D               ;$018C26	|
	SBC.W #$32A0                  ;$018C28	|
	INC.B $02                     ;$018C2B	|

CODE_818C2D:
	STA.B $04                     ;$018C2D	|
	LDA.B $00                     ;$018C2F	|
	CLC                           ;$018C31	|
	ADC.W #$0020                  ;$018C32	|
	CMP.W #$4C00                  ;$018C35	|
	BCC CODE_818C3D               ;$018C38	|
	SBC.W #$0400                  ;$018C3A	|

CODE_818C3D:
	STA.B $00                     ;$018C3D	|
	PLX                           ;$018C3F	|
	DEX                           ;$018C40	|
	BPL CODE_818C0A               ;$018C41	|
	LDA.W $337E                   ;$018C43	|
	CLC                           ;$018C46	|
	ADC.W #$0006                  ;$018C47	|
	STA.W $337E                   ;$018C4A	|
	RTS                           ;$018C4D	|

CODE_FN_018C4E:
	LDA.W $333A                   ;$018C4E	|
	BEQ CODE_818C73               ;$018C51	|
	LDA.W $333C                   ;$018C53	|
	BEQ CODE_818C73               ;$018C56	|
	LDX.W #$0020                  ;$018C58	|
	LDA.W $303F                   ;$018C5B	|
	SEC                           ;$018C5E	|
	SBC.W #$0030                  ;$018C5F	|

CODE_818C62:
	PHX                           ;$018C62	|
	PHA                           ;$018C63	|
	LDY.W $3039                   ;$018C64	|
	JSR.W CODE_FN_019888          ;$018C67	|
	PLA                           ;$018C6A	|
	CLC                           ;$018C6B	|
	ADC.W #$0008                  ;$018C6C	|
	PLX                           ;$018C6F	|
	DEX                           ;$018C70	|
	BNE CODE_818C62               ;$018C71	|

CODE_818C73:
	RTS                           ;$018C73	|

CODE_FN_018C74:
	STZ.W $3332                   ;$018C74	|
	STZ.W $3334                   ;$018C77	|
	STZ.W $3336                   ;$018C7A	|
	STZ.W $7A0F                   ;$018C7D	|
	STZ.W $3338                   ;$018C80	|
	STZ.W $333A                   ;$018C83	|
	STZ.W $333C                   ;$018C86	|
	STZ.W $32E2                   ;$018C89	|
	LDA.W #CameraX_TileMirror                  ;$018C8C	|
	STA.W $735A                   ;$018C8F	|
	LDA.W #CameraY_TileMirror                  ;$018C92	|
	STA.W $735C                   ;$018C95	|
	LDA.W #$FF00                  ;$018C98	|
	STA.W $7384                   ;$018C9B	|
	LDA.W #$FFFF                  ;$018C9E	|
	STA.W $7386                   ;$018CA1	|
	STZ.W $7388                   ;$018CA4	|
	STZ.W $738C                   ;$018CA7	|
	STA.W $7A23                   ;$018CAA	|
	LDA.W #$AA26                  ;$018CAD	|
	STA.W $6024                   ;$018CB0	|
	LDA.W $32EA                   ;$018CB3	|
	ASL A                         ;$018CB6	|
	STA.W $32EC                   ;$018CB7	|
	LDA.W $32EE                   ;$018CBA	|
	ASL A                         ;$018CBD	|
	STA.W $32F0                   ;$018CBE	|
	LDA.W Current_Room            ;$018CC1	|
	ASL A                         ;$018CC4	|
	ASL A                         ;$018CC5	|
	STA.W $32F4                   ;$018CC6	|
	STZ.B $14                     ;$018CC9	|
	LDA.W #$00FF                  ;$018CCB	|
	STA.B $16                     ;$018CCE	|
	LDA.W #$000C                  ;$018CD0	|
	CLC                           ;$018CD3	|
	ADC.W $32EC                   ;$018CD4	|
	TAY                           ;$018CD7	|
	LDA.B [$14],Y                 ;$018CD8	|
	CLC                           ;$018CDA	|
	ADC.W $32F0                   ;$018CDB	|
	TAY                           ;$018CDE	|
	LDA.B [$14],Y                 ;$018CDF	|
	CLC                           ;$018CE1	|
	ADC.W $32F4                   ;$018CE2	|
	TAY                           ;$018CE5	|
	LDA.B [$14],Y                 ;$018CE6	|
	STA.W $32F6                   ;$018CE8	|
	STA.B $18                     ;$018CEB	|
	INY                           ;$018CED	|
	INY                           ;$018CEE	|
	LDA.B [$14],Y                 ;$018CEF	|
	STA.W $32F8                   ;$018CF1	|
	STA.W $32FC                   ;$018CF4	|
	STA.W $3300                   ;$018CF7	|
	STA.W $3304                   ;$018CFA	|
	STA.W $3308                   ;$018CFD	|
	STA.B $1A                     ;$018D00	|
	LDA.B $18                     ;$018D02	|
	CLC                           ;$018D04	|
	ADC.W #$003A                  ;$018D05	|
	INC A                         ;$018D08	|
	INC A                         ;$018D09	|
	STA.W $32FA                   ;$018D0A	|
	LDA.W #$003A                  ;$018D0D	|
	TAY                           ;$018D10	|
	CLC                           ;$018D11	|
	ADC.B [$18],Y                 ;$018D12	|
	TAY                           ;$018D14	|
	CLC                           ;$018D15	|
	ADC.B $18                     ;$018D16	|
	STA.W $32FE                   ;$018D18	|
	INC.W $32FE                   ;$018D1B	|
	INC.W $32FE                   ;$018D1E	|
	TYA                           ;$018D21	|
	CLC                           ;$018D22	|
	ADC.B [$18],Y                 ;$018D23	|
	TAY                           ;$018D25	|
	CLC                           ;$018D26	|
	ADC.B $18                     ;$018D27	|
	STA.W $3302                   ;$018D29	|
	INC.W $3302                   ;$018D2C	|
	INC.W $3302                   ;$018D2F	|
	CLC                           ;$018D32	|
	ADC.B [$18],Y                 ;$018D33	|
	STA.W $3306                   ;$018D35	|
	LDY.W #$0005                  ;$018D38	|
	LDA.B [$18],Y                 ;$018D3B	|
	AND.W #$00FF                  ;$018D3D	|
	STA.W $3320                   ;$018D40	|
	LDY.W #$0006                  ;$018D43	|
	LDA.B [$18],Y                 ;$018D46	|
	AND.W #$00FF                  ;$018D48	|
	STA.W $3322                   ;$018D4B	|
	LDY.W #$0007                  ;$018D4E	|
	LDA.B [$18],Y                 ;$018D51	|
	AND.W #$007F                  ;$018D53	|
	STA.W $3330                   ;$018D56	|
	LDA.B [$18],Y                 ;$018D59	|
	AND.W #$0080                  ;$018D5B	|
	XBA                           ;$018D5E	|
	ORA.W $3322                   ;$018D5F	|
	STA.W $3322                   ;$018D62	|
	LDY.W #$0008                  ;$018D65	|
	LDA.B [$18],Y                 ;$018D68	|
	AND.W #$00FF                  ;$018D6A	|
	STA.W $331C                   ;$018D6D	|
	LDY.W #$0009                  ;$018D70	|
	LDA.B [$18],Y                 ;$018D73	|
	JSL.L CODE_FL_D3E27A          ;$018D75	|
	STA.W $3326                   ;$018D79	|
	LDY.W #$000A                  ;$018D7C	|
	LDA.B [$18],Y                 ;$018D7F	|
	JSL.L CODE_FL_D3E27A          ;$018D81	|
	STA.W $3328                   ;$018D85	|
	LDY.W #$0011                  ;$018D88	|
	LDA.B [$18],Y                 ;$018D8B	|
	STA.W $334A                   ;$018D8D	|
	LDY.W #$0013                  ;$018D90	|
	LDA.B [$18],Y                 ;$018D93	|
	STA.W $334C                   ;$018D95	|
	LDA.W #$FFFF                  ;$018D98	|
	STA.W $3324                   ;$018D9B	|
	LDY.W #$0015                  ;$018D9E	|
	LDA.B [$18],Y                 ;$018DA1	|
	AND.W #$00FF                  ;$018DA3	|
	CMP.W #$00FF                  ;$018DA6	|
	BEQ CODE_818DBE               ;$018DA9	|
	AND.W #$00F0                  ;$018DAB	|
	ASL A                         ;$018DAE	|
	ASL A                         ;$018DAF	|
	ASL A                         ;$018DB0	|
	ASL A                         ;$018DB1	|
	STA.B $00                     ;$018DB2	|
	LDA.B [$18],Y                 ;$018DB4	|
	AND.W #$000F                  ;$018DB6	|
	ORA.B $00                     ;$018DB9	|
	STA.W $3324                   ;$018DBB	|

CODE_818DBE:
	LDY.W #$0004                  ;$018DBE	|
	LDA.B [$18],Y                 ;$018DC1	|
	AND.W #$00FF                  ;$018DC3	|
	STA.W $331E                   ;$018DC6	|
	ASL A                         ;$018DC9	|
	TAX                           ;$018DCA	|
	LDA.L DATA8_01A98D,X          ;$018DCB	|
	SEP #$20                      ;$018DCF	|
	STA.W $3061                   ;$018DD1	|
	XBA                           ;$018DD4	|
	STA.W $3072                   ;$018DD5	|
	STZ.W $3092                   ;$018DD8	|
	STZ.W $3062                   ;$018DDB	|
	REP #$20                      ;$018DDE	|
	AND.W #$0007                  ;$018DE0	|
	STA.W $332E                   ;$018DE3	|
	LDA.W $332E                   ;$018DE6	|
	AND.W #$0001                  ;$018DE9	|
	BEQ CODE_818DFB               ;$018DEC	|
	LDA.W #$0001                  ;$018DEE	|
	LDX.W #$0000                  ;$018DF1	|
	LDY.W #$4800                  ;$018DF4	|
	JSL.L ConfigureLayer1         ;$018DF7	|

CODE_818DFB:
	LDA.W $332E                   ;$018DFB	|
	AND.W #$0001                  ;$018DFE	|
	BEQ CODE_818E10               ;$018E01	|
	LDA.W #$0000                  ;$018E03	|
	LDX.W #$0000                  ;$018E06	|
	LDY.W #$5400                  ;$018E09	|
	JSL.L ConfigureLayer2         ;$018E0C	|

CODE_818E10:
	LDA.W $332E                   ;$018E10	|
	AND.W #$0001                  ;$018E13	|
	BEQ CODE_818E25               ;$018E16	|
	LDA.W #$0000                  ;$018E18	|
	LDX.W #$4000                  ;$018E1B	|
	LDY.W #$5000                  ;$018E1E	|
	JSL.L ConfigureLayer3         ;$018E21	|

CODE_818E25:
	LDA.W #$0000                  ;$018E25	|
	LDX.W #$6000                  ;$018E28	|
	JSL.L UpdateVramSpriteTileSize;$018E2B	|
	LDA.W #$0000                  ;$018E2F	|
	JSL.L UpdateVramSpritePageSize;$018E32	|
	LDA.W #$CCCC                  ;$018E36	|
	STA.W $3069                   ;$018E39	|
	SEP #$20                      ;$018E3C	|
	LDA.B #$0C                    ;$018E3E	|
	STA.W $306B                   ;$018E40	|
	REP #$20                      ;$018E43	|
	LDA.W #$FB04                  ;$018E45	|
	STA.W $306E                   ;$018E48	|
	LDA.W #$001F                  ;$018E4B	|
	STA.W $3074                   ;$018E4E	|
	RTS                           ;$018E51	|
CODE_818E52:
	LDA.W #$FFFF                  ;$018E52	|
	STA.W $09A8                   ;$018E55	|
	STA.W $103C                   ;$018E58	|
	STA.W $73B9                   ;$018E5B	|
	STA.W $109C                   ;$018E5E	|
	STA.W $1120                   ;$018E61	|
	STA.W $1150                   ;$018E64	|
	STA.W $1250                   ;$018E67	|
	STZ.W $0FDA                   ;$018E6A	|
	STZ.W $334E                   ;$018E6D	|
	STZ.W $006B                   ;$018E70	|
	LDX.W #$01FE                  ;$018E73	|

CODE_818E76:
	STA.L $7EB000,X               ;$018E76	|
	DEX                           ;$018E7A	|
	DEX                           ;$018E7B	|
	BPL CODE_818E76               ;$018E7C	|
	LDX.W #$001E                  ;$018E7E	|

CODE_818E81:
	STZ.W $0FDC,X                 ;$018E81	|
	STA.W $101C,X                 ;$018E84	|
	DEX                           ;$018E87	|
	DEX                           ;$018E88	|
	BPL CODE_818E81               ;$018E89	|
	LDA.W #$0001                  ;$018E8B	|
	STA.W $111E                   ;$018E8E	|
	STZ.W $111C                   ;$018E91	|
	JSL.L CODE_FL_01A0F6          ;$018E94	|
	RTL                           ;$018E98	|

CODE_FN_018E99:
	LDA.W #$0001                  ;$018E99	|
	STA.W $2250                   ;$018E9C	|
	LDA.W CameraY_TileMirror                   ;$018E9F	|
	LSR A                         ;$018EA2	|
	LSR A                         ;$018EA3	|
	LSR A                         ;$018EA4	|
	STA.W $2251                   ;$018EA5	|
	LDY.W #$0003                  ;$018EA8	|
	STY.W $2253                   ;$018EAB	|
	ASL A                         ;$018EAE	|
	AND.W #$003E                  ;$018EAF	|
	STA.W $3380                   ;$018EB2	|
	LDA.W CameraY_TileMirror                   ;$018EB5	|
	STA.W $335C                   ;$018EB8	|
	ASL A                         ;$018EBB	|
	ASL A                         ;$018EBC	|
	AND.W #$03E0                  ;$018EBD	|
	ORA.W #$4800                  ;$018EC0	|
	STA.W $337A                   ;$018EC3	|
	LDA.W $2308                   ;$018EC6	|
	ASL A                         ;$018EC9	|
	ADC.W $2308                   ;$018ECA	|
	TAX                           ;$018ECD	|
	LDA.W $2306                   ;$018ECE	|
	STA.W $2251                   ;$018ED1	|
	LDA.B $57                     ;$018ED4	|
	STA.W $2253                   ;$018ED6	|
	LDA.W CameraX_TileMirror                   ;$018ED9	|
	CLC                           ;$018EDC	|
	ADC.W #$0010                  ;$018EDD	|
	STA.W $3358                   ;$018EE0	|
	LDA.W $2308                   ;$018EE3	|
	STA.W $3376                   ;$018EE6	|
	LDA.W CameraX_TileMirror                   ;$018EE9	|
	LSR A                         ;$018EEC	|
	LSR A                         ;$018EED	|
	LSR A                         ;$018EEE	|
	STA.W $2251                   ;$018EEF	|
	STY.W $2253                   ;$018EF2	|
	STA.W $337C                   ;$018EF5	|
	ASL A                         ;$018EF8	|
	STA.W $337E                   ;$018EF9	|
	TXA                           ;$018EFC	|
	ADC.W $2308                   ;$018EFD	|
	ASL A                         ;$018F00	|
	TAX                           ;$018F01	|
	LDA.L DATA16_018F2E,X         ;$018F02	|
	STA.W $3378                   ;$018F06	|
	LDA.W $2306                   ;$018F09	|
	ASL A                         ;$018F0C	|
	STA.W $2251                   ;$018F0D	|
	LDA.B $53                     ;$018F10	|
	STA.W $2253                   ;$018F12	|
	LDA.W $3039                   ;$018F15	|
	AND.W #$FFF8                  ;$018F18	|
	STA.W $335A                   ;$018F1B	|
	LDA.W $303F                   ;$018F1E	|
	AND.W #$FFF8                  ;$018F21	|
	STA.W $335E                   ;$018F24	|
	LDA.W $2308                   ;$018F27	|
	STA.W $3374                   ;$018F2A	|
	RTS                           ;$018F2D	|

DATA16_018F2E:
    dw $0000,$05A0,$0B40,$10E0    ;$018F2E |
    dw $1680,$1C20,$21C0,$2760    ;$018F36 |
    dw $2D00                      ;$018F3E |

CODE_FL_018F40:
	BIT.W $0000                   ;$018F40	|
	BPL CODE_818F67               ;$018F43	|
	JSL.L CODE_FL_018FF7          ;$018F45	|
	LDA.W $337E                   ;$018F49	|
	AND.W #$007E                  ;$018F4C	|
	STA.B $32                     ;$018F4F	|
	LDA.W $3012                   ;$018F51	|
	STA.B $34                     ;$018F54	|
	CLC                           ;$018F56	|
	ADC.W #$0080                  ;$018F57	|
	STA.W $3012                   ;$018F5A	|
	LDA.W #$8F89                  ;$018F5D	|
	LDX.W #$0001                  ;$018F60	|
	JML.L SA1_ExecuteSNES              ;$018F63	|

CODE_818F67:
	LDA.W #$8FF7                  ;$018F67	|
	LDX.W #$0001                  ;$018F6A	|
	JSL.L SNES_ExecuteSA1_skipPrep          ;$018F6D	|
	LDA.W $337E                   ;$018F71	|
	AND.W #$007E                  ;$018F74	|
	STA.B $32                     ;$018F77	|
	LDA.W $3012                   ;$018F79	|
	STA.B $34                     ;$018F7C	|
	CLC                           ;$018F7E	|
	ADC.W #$0080                  ;$018F7F	|
	STA.W $3012                   ;$018F82	|
	JSL.L $000026                 ;$018F85	|
	PEA.W $007F                   ;$018F89	|
	PLB                           ;$018F8C	|

CODE_818F8D:
	LDA.B CameraX_TileMirror                     ;$018F8D	|
	CLC                           ;$018F8F	|
	ADC.B $06                     ;$018F90	|
	CMP.W #$2000                  ;$018F92	|
	BCS CODE_818FA9               ;$018F95	|
	TAX                           ;$018F97	|
	LDA.W $0000,X                 ;$018F98	|
	AND.W #$03FF                  ;$018F9B	|
	ASL A                         ;$018F9E	|
	ADC.W #$3000                  ;$018F9F	|
	TAY                           ;$018FA2	|
	LDA.B ($2E),Y                 ;$018FA3	|
	LDY.B $32                     ;$018FA5	|
	STA.B [$34],Y                 ;$018FA7	|

CODE_818FA9:
	LDA.B $2E                     ;$018FA9	|
	CLC                           ;$018FAB	|
	ADC.W #$05A0                  ;$018FAC	|
	STA.B $2E                     ;$018FAF	|
	CMP.B $30                     ;$018FB1	|
	BCC CODE_818FC6               ;$018FB3	|
	SBC.W #$10E0                  ;$018FB5	|
	STA.B $2E                     ;$018FB8	|
	LDA.B $06                     ;$018FBA	|
	INC A                         ;$018FBC	|
	INC A                         ;$018FBD	|
	CMP.B $53                     ;$018FBE	|
	BCC CODE_818FC4               ;$018FC0	|
	SBC.B $53                     ;$018FC2	|

CODE_818FC4:
	STA.B $06                     ;$018FC4	|

CODE_818FC6:
	LDA.B $32                     ;$018FC6	|
	INC A                         ;$018FC8	|
	INC A                         ;$018FC9	|
	AND.W #$007F                  ;$018FCA	|
	STA.B $32                     ;$018FCD	|
	DEC.B $28                     ;$018FCF	|
	BNE CODE_818F8D               ;$018FD1	|
	PLB                           ;$018FD3	|
	LDA.W #$0003                  ;$018FD4	|
	STA.B $31                     ;$018FD7	|
	LDA.W #$0040                  ;$018FD9	|
	STA.B $32                     ;$018FDC	|
	LDA.B $00                     ;$018FDE	|
	STA.B CameraX_TileMirror                     ;$018FE0	|
	JSL.L WriteToDMABuffer     ;$018FE2	|
	LDA.B $34                     ;$018FE6	|
	CLC                           ;$018FE8	|
	ADC.W #$0040                  ;$018FE9	|
	STA.B $34                     ;$018FEC	|
	LDA.W #$0400                  ;$018FEE	|
	TSB.B CameraX_TileMirror                     ;$018FF1	|
	JML.L WriteToDMABuffer     ;$018FF3	|

CODE_FL_018FF7:
	LDA.B $04                     ;$018FF7	|
	STA.B $2E                     ;$018FF9	|
	CMP.W #$10E0                  ;$018FFB	|
	BCS CODE_819005               ;$018FFE	|
	LDA.W #$10E0                  ;$019000	|
	BRA CODE_819012               ;$019003	|

CODE_819005:
	CMP.W #$21C0                  ;$019005	|
	BCS CODE_81900F               ;$019008	|
	LDA.W #$21C0                  ;$01900A	|
	BRA CODE_819012               ;$01900D	|

CODE_81900F:
	LDA.W #$32A0                  ;$01900F	|

CODE_819012:
	STA.B $30                     ;$019012	|
	LDA.W #$007E                  ;$019014	|
	STA.B $36                     ;$019017	|
	STZ.W $2250                   ;$019019	|
	LDA.B $53                     ;$01901C	|
	STA.W $2251                   ;$01901E	|
	LDA.B $02                     ;$019021	|
	STA.W $2253                   ;$019023	|
	LDA.W #$0028                  ;$019026	|
	STA.B $28                     ;$019029	|
	LDA.W $2306                   ;$01902B	|
	STA.B CameraX_TileMirror                     ;$01902E	|
	RTL                           ;$019030	|

CODE_FL_019031:
	LDA.B $04                     ;$019031	|
	STA.B $2E                     ;$019033	|
	LDA.W $3376                   ;$019035	|
	STA.B $30                     ;$019038	|
	LDA.W $3380                   ;$01903A	|
	AND.W #$003E                  ;$01903D	|
	STA.B $32                     ;$019040	|
	LDA.W $3012                   ;$019042	|
	STA.B $34                     ;$019045	|
	CLC                           ;$019047	|
	ADC.W #$0040                  ;$019048	|
	STA.W $3012                   ;$01904B	|
	LDA.W #$007E                  ;$01904E	|
	STA.B $36                     ;$019051	|
	BIT.W $0000                   ;$019053	|
	BPL CODE_819062               ;$019056	|
	LDA.W #$9062                  ;$019058	|
	LDX.W #$0001                  ;$01905B	|
	JML.L SA1_ExecuteSNES         ;$01905E	|

CODE_819062:
	PEA.W $007F                   ;$019062	|
	PLB                           ;$019065	|
	LDX.W #$0020                  ;$019066	|

CODE_819069:
	SEP #$20                      ;$019069	|
	LDA.B $30                     ;$01906B	|
	STA.L $004202                 ;$01906D	|
	LDA.B $54                     ;$019071	|
	STA.L $004203                 ;$019073	|
	LDA.B $53                     ;$019077	|
	XBA                           ;$019079	|
	LDA.L $004216                 ;$01907A	|
	XBA                           ;$01907E	|
	STA.L $004203                 ;$01907F	|
	REP #$20                      ;$019083	|
	AND.W #$FF00                  ;$019085	|
	CLC                           ;$019088	|
	ADC.L $004216                 ;$019089	|
	ADC.B $02                     ;$01908D	|
	CMP.W #$2000                  ;$01908F	|
	BCS CODE_8190A6               ;$019092	|
	TAY                           ;$019094	|
	LDA.W $0000,Y                 ;$019095	|
	AND.W #$03FF                  ;$019098	|
	ASL A                         ;$01909B	|
	ADC.W #$3000                  ;$01909C	|
	TAY                           ;$01909F	|
	LDA.B ($2E),Y                 ;$0190A0	|
	LDY.B $32                     ;$0190A2	|
	STA.B [$34],Y                 ;$0190A4	|

CODE_8190A6:
	LDA.B $2E                     ;$0190A6	|
	CLC                           ;$0190A8	|
	ADC.W #$10E0                  ;$0190A9	|
	CMP.W #$32A0                  ;$0190AC	|
	BCC CODE_8190B6               ;$0190AF	|
	SBC.W #$32A0                  ;$0190B1	|
	INC.B $30                     ;$0190B4	|

CODE_8190B6:
	STA.B $2E                     ;$0190B6	|
	LDA.B $32                     ;$0190B8	|
	INC A                         ;$0190BA	|
	INC A                         ;$0190BB	|
	AND.W #$003F                  ;$0190BC	|
	STA.B $32                     ;$0190BF	|
	DEX                           ;$0190C1	|
	BNE CODE_819069               ;$0190C2	|
	PLB                           ;$0190C4	|
	LDA.W #$001E                  ;$0190C5	|
	STA.B $31                     ;$0190C8	|
	LDA.W #$0040                  ;$0190CA	|
	STA.B $32                     ;$0190CD	|
	LDA.B $00                     ;$0190CF	|
	STA.B CameraX_TileMirror                     ;$0190D1	|
	JML.L WriteToDMABuffer        ;$0190D3	|
	STZ.B $00                     ;$0190D7	|
	INC.B $00                     ;$0190D9	|
	LDA.W LoadSpecialWarpDest     ;$0190DB	|
	CMP.W #$0000                  ;$0190DE	|
	BNE CODE_819145               ;$0190E1	|
	STZ.B $14                     ;$0190E3	|
	LDA.W #$00FF                  ;$0190E5	|
	STA.B $16                     ;$0190E8	|
	LDA.W #$000C                  ;$0190EA	|
	CLC                           ;$0190ED	|
	ADC.W $32EA                   ;$0190EE	|
	ADC.W $32EA                   ;$0190F1	|
	TAY                           ;$0190F4	|
	LDA.B [$14],Y                 ;$0190F5	|
	CLC                           ;$0190F7	|
	ADC.W $32EE                   ;$0190F8	|
	ADC.W $32EE                   ;$0190FB	|
	TAY                           ;$0190FE	|
	LDA.B [$14],Y                 ;$0190FF	|
	CLC                           ;$019101	|
	ADC.W Current_Room            ;$019102	|
	ADC.W Current_Room            ;$019105	|
	ADC.W Current_Room            ;$019108	|
	ADC.W Current_Room            ;$01910B	|
	TAY                           ;$01910E	|
	LDA.B [$14],Y                 ;$01910F	|
	STA.B $18                     ;$019111	|
	INY                           ;$019113	|
	LDA.B [$14],Y                 ;$019114	|
	STA.B $19                     ;$019116	|
	LDY.W #$0002                  ;$019118	|
	STZ.B $00                     ;$01911B	|
	LDA.B [$18],Y                 ;$01911D	|
	AND.W #$FF00                  ;$01911F	|
	BEQ CODE_819131               ;$019122	|
	XBA                           ;$019124	|
	STA.B $02                     ;$019125	|
	LDA.W $00AE                   ;$019127	|
	AND.W #$00FF                  ;$01912A	|
	CMP.B $02                     ;$01912D	|
	BNE CODE_819143               ;$01912F	|

CODE_819131:
	LDA.B [$18],Y                 ;$019131	|
	AND.W #$0080                  ;$019133	|
	BNE CODE_819143               ;$019136	|
	SEP #$20                      ;$019138	|
	LDA.B [$18],Y                 ;$01913A	|
	CMP.W $00AA                   ;$01913C	|
	REP #$20                      ;$01913F	|
	BEQ CODE_819145               ;$019141	|

CODE_819143:
	INC.B $00                     ;$019143	|

CODE_819145:
	RTL                           ;$019145	|

CODE_FL_019146:
	LDY.W ReloadRoom            ;$019146	|
	BNE CODE_8191AF               ;$019149	|
	LDY.W $3334                   ;$01914B	|
	BEQ CODE_8191AF               ;$01914E	|
	DEY                           ;$019150	|
	TYA                           ;$019151	|
	AND.W #$7FFF                  ;$019152	|
	LSR A                         ;$019155	|
	SEP #$20                      ;$019156	|
	STA.W $30A1                   ;$019158	|
	STA.W Screen_Brightness      ;$01915B	|
	REP #$20                      ;$01915E	|
	TYA                           ;$019160	|
	BMI CODE_819193               ;$019161	|
	PHA                           ;$019163	|
	PHY                           ;$019164	|
	LDA.W #$90D7                  ;$019165	|
	LDX.W #$0001                  ;$019168	|
	JSL.L SA1_ExecuteSNES         ;$01916B	|
	JSL.L CODE_FL_03A2D4          ;$01916F	|
	BCC CODE_819177               ;$019173	|
	STZ.B $00                     ;$019175	|

CODE_819177:
	PLY                           ;$019177	|
	PLA                           ;$019178	|
	LDX.B $00                     ;$019179	|
	BEQ CODE_819193               ;$01917B	|
	ASL A                         ;$01917D	|
	ASL A                         ;$01917E	|
	ASL A                         ;$01917F	|
	JSL.L CODE_FL_00CE67          ;$019180	|
	LDA.W $33CC                   ;$019184	|
	AND.W #$00FF                  ;$019187	|
	BNE CODE_819193               ;$01918A	|
	LDA.W #$0000                  ;$01918C	|
	JSL.L PlaySFX          		  ;$01918F	|

CODE_819193:
	STY.W $3334                   ;$019193	|
	TYA                           ;$019196	|
	AND.W #$7FFF                  ;$019197	|
	BNE CODE_8191AE               ;$01919A	|
	STZ.W $3330                   ;$01919C	|
	STZ.W $3332                   ;$01919F	|
	STZ.W $3334                   ;$0191A2	|
	STZ.W $73A4                   ;$0191A5	|
	JSR.W CODE_FN_01A5B9          ;$0191A8	|
	INC.W ReloadRoom                   ;$0191AB	|

CODE_8191AE:
	RTL                           ;$0191AE	|

CODE_8191AF:
	LDA.W $3332                   ;$0191AF	|
	BEQ CODE_8191BD               ;$0191B2	|
	LDA.W #$000F                  ;$0191B4	|
	STA.W $3334                   ;$0191B7	|
	INC.W $73A4                   ;$0191BA	|

CODE_8191BD:
	RTL                           ;$0191BD	|

CODE_FL_0191BE:
	LDX.W #$0004                  ;$0191BE	|
	BRA CODE_0191C6               ;$0191C1	|

CODE_FL_0191C3:
	LDX.W #$0002                  ;$0191C3	|

CODE_0191C6:
	LDA.W $32FA                   ;$0191C6	|
	STA.B $14                     ;$0191C9	|
	LDA.W $32FC                   ;$0191CB	|
	STA.B $16                     ;$0191CE	|
	LDA.W #$0001                  ;$0191D0	|
	STA.W $2250                   ;$0191D3	|
	LDA.W $6892,X                 ;$0191D6	|
	STA.W $2251                   ;$0191D9	|
	LDA.B $55                     ;$0191DC	|
	STA.W $2253                   ;$0191DE	|

CODE_JP_0191E1:
	LDY.W #$0006                  ;$0191E1	|
	LDA.B [$14],Y                 ;$0191E4	|
	STA.W Kirby_X_Respawn        ;$0191E6	|
	LDY.W #$0008                  ;$0191E9	|
	LDA.B [$14],Y                 ;$0191EC	|
	STA.W Kirby_Y_Respawn        ;$0191EE	|
	LDA.B [$14]                   ;$0191F1	|
	BMI CODE_819254               ;$0191F3	|
	LDY.W #$0002                  ;$0191F5	|
	LDA.B [$14],Y                 ;$0191F8	|
	CMP.W $2308                   ;$0191FA	|
	BEQ CODE_819201               ;$0191FD	|
	BCS CODE_819223               ;$0191FF	|

CODE_819201:
	CLC                           ;$019201	|
	ADC.W #$0018                  ;$019202	|
	CMP.W $2308                   ;$019205	|
	BCC CODE_819223               ;$019208	|
	LDY.W #$0004                  ;$01920A	|
	LDA.B [$14],Y                 ;$01920D	|
	DEC A                         ;$01920F	|
	DEC A                         ;$019210	|
	CMP.W $690C,X                 ;$019211	|
	BEQ CODE_819218               ;$019214	|
	BCS CODE_819223               ;$019216	|

CODE_819218:
	LDA.B [$14],Y                 ;$019218	|
	CLC                           ;$01921A	|
	ADC.W #$0018                  ;$01921B	|
	CMP.W $690C,X                 ;$01921E	|
	BCS CODE_81922E               ;$019221	|

CODE_819223:
	LDA.B $14                     ;$019223	|
	CLC                           ;$019225	|
	ADC.W #$000A                  ;$019226	|
	STA.B $14                     ;$019229	|
	JMP.W CODE_JP_0191E1          ;$01922B	|

CODE_81922E:
	LDA.W #$0002                  ;$01922E	|
	STA.W $332A                   ;$019231	|
	LDX.W #$0000                  ;$019234	|
	LDA.B [$14]                   ;$019237	|
	CMP.W #$7FFF                  ;$019239	|
	BEQ CODE_81924B               ;$01923C	|
	BIT.W #$4000                  ;$01923E	|
	BEQ CODE_81924E               ;$019241	|
	STZ.W $332A                   ;$019243	|
	AND.W #$3FFF                  ;$019246	|
	BRA CODE_81924E               ;$019249	|

CODE_81924B:
	LDX.W #$0003                  ;$01924B	|

CODE_81924E:
	STX.W LoadSpecialWarpDest     ;$01924E	|
	STA.W Current_Room           ;$019251	|

CODE_819254:
	LDA.W #$000F                  ;$019254	|
	STA.W $3334                   ;$019257	|
	INC.W $73A4                   ;$01925A	|
	RTL                           ;$01925D	|

CODE_FN_01925E:
	LDX.W #$0026                  ;$01925E	|

CODE_819261:
	STZ.W $794E,X                 ;$019261	|
	DEX                           ;$019264	|
	DEX                           ;$019265	|
	BPL CODE_819261               ;$019266	|
	LDA.W CameraX_TileMirror                   ;$019268	|
	SEC                           ;$01926B	|
	SBC.W #$0020                  ;$01926C	|
	TAX                           ;$01926F	|
	JSR.W CODE_FN_01936F          ;$019270	|
	STX.B $00                     ;$019273	|
	STA.B $08                     ;$019275	|
	LDA.W CameraX_TileMirror                   ;$019277	|
	CLC                           ;$01927A	|
	ADC.W #$0120                  ;$01927B	|
	TAX                           ;$01927E	|
	JSR.W CODE_FN_01936F          ;$01927F	|
	STX.B $02                     ;$019282	|
	LDA.W CameraY_TileMirror                   ;$019284	|
	SEC                           ;$019287	|
	SBC.W #$0020                  ;$019288	|
	TAX                           ;$01928B	|
	JSR.W CODE_FN_0193D9          ;$01928C	|
	STX.B $04                     ;$01928F	|
	LDA.W CameraY_TileMirror                   ;$019291	|
	CLC                           ;$019294	|
	ADC.W #$00C8                  ;$019295	|
	TAX                           ;$019298	|
	JSR.W CODE_FN_0193D9          ;$019299	|
	STX.B $06                     ;$01929C	|
	LDA.W #$93F4                  ;$01929E	|
	LDX.W #$0001                  ;$0192A1	|
	JSL.L SA1_ExecuteSNES              ;$0192A4	|
	JSL.L CODE_FL_D02337          ;$0192A8	|
	STZ.W $7A14                   ;$0192AC	|
	LDA.W CameraX_TileMirror                   ;$0192AF	|
	STA.W $333E                   ;$0192B2	|
	LDA.W CameraY_TileMirror                   ;$0192B5	|
	STA.W $3340                   ;$0192B8	|
	RTS                           ;$0192BB	|

CODE_FN_0192BC:
	LDA.W $3330                   ;$0192BC	|
	BEQ CODE_8192C6               ;$0192BF	|
	CMP.W #$0005                  ;$0192C1	|
	BCC CODE_8192C7               ;$0192C4	|

CODE_8192C6:
	RTS                           ;$0192C6	|

CODE_8192C7:
	LDA.W CameraX_TileMirror                   ;$0192C7	|
	SEC                           ;$0192CA	|
	SBC.W $333E                   ;$0192CB	|
	BPL CODE_8192E7               ;$0192CE	|
	CMP.W #$FFF6                  ;$0192D0	|
	BCS CODE_8192FE               ;$0192D3	|
	LDA.W CameraX_TileMirror                   ;$0192D5	|
	SEC                           ;$0192D8	|
	SBC.W #$0020                  ;$0192D9	|
	TAY                           ;$0192DC	|
	LDA.W $333E                   ;$0192DD	|
	SEC                           ;$0192E0	|
	SBC.W #$0020                  ;$0192E1	|
	JMP.W CODE_JP_019336          ;$0192E4	|

CODE_8192E7:
	CMP.W #$000A                  ;$0192E7	|
	BCC CODE_8192FE               ;$0192EA	|
	LDA.W $333E                   ;$0192EC	|
	CLC                           ;$0192EF	|
	ADC.W #$0120                  ;$0192F0	|
	TAY                           ;$0192F3	|
	LDA.W CameraX_TileMirror                   ;$0192F4	|
	CLC                           ;$0192F7	|
	ADC.W #$0120                  ;$0192F8	|
	JMP.W CODE_JP_019336          ;$0192FB	|

CODE_8192FE:
	LDA.W CameraY_TileMirror                   ;$0192FE	|
	SEC                           ;$019301	|
	SBC.W $3340                   ;$019302	|
	BPL CODE_81931E               ;$019305	|
	CMP.W #$FFF6                  ;$019307	|
	BCS CODE_819335               ;$01930A	|
	LDA.W CameraY_TileMirror                   ;$01930C	|
	SEC                           ;$01930F	|
	SBC.W #$0020                  ;$019310	|
	TAY                           ;$019313	|
	LDA.W $3340                   ;$019314	|
	SEC                           ;$019317	|
	SBC.W #$0018                  ;$019318	|
	JMP.W CODE_JP_0193A0          ;$01931B	|

CODE_81931E:
	CMP.W #$000A                  ;$01931E	|
	BCC CODE_819335               ;$019321	|
	LDA.W $3340                   ;$019323	|
	CLC                           ;$019326	|
	ADC.W #$00C0                  ;$019327	|
	TAY                           ;$01932A	|
	LDA.W CameraY_TileMirror                   ;$01932B	|
	CLC                           ;$01932E	|
	ADC.W #$00C8                  ;$01932F	|
	JMP.W CODE_JP_0193A0          ;$019332	|

CODE_819335:
	RTS                           ;$019335	|

CODE_JP_019336:
	TAX                           ;$019336	|
	JSR.W CODE_FN_01936F          ;$019337	|
	STX.B $02                     ;$01933A	|
	TYX                           ;$01933C	|
	JSR.W CODE_FN_01936F          ;$01933D	|
	STX.B $00                     ;$019340	|
	STA.B $08                     ;$019342	|
	LDA.W $3340                   ;$019344	|
	SEC                           ;$019347	|
	SBC.W #$0020                  ;$019348	|
	TAX                           ;$01934B	|
	JSR.W CODE_FN_0193D9          ;$01934C	|
	STX.B $04                     ;$01934F	|
	LDA.W $3340                   ;$019351	|
	CLC                           ;$019354	|
	ADC.W #$00C8                  ;$019355	|
	TAX                           ;$019358	|
	JSR.W CODE_FN_0193D9          ;$019359	|
	STX.B $06                     ;$01935C	|
	LDA.W #$93F4                  ;$01935E	|
	LDX.W #$0001                  ;$019361	|
	JSL.L SA1_ExecuteSNES              ;$019364	|
	LDA.W CameraX_TileMirror                   ;$019368	|
	STA.W $333E                   ;$01936B	|
	RTS                           ;$01936E	|

CODE_FN_01936F:
	BMI CODE_819376               ;$01936F	|
	CPX.W #$0014                  ;$019371	|
	BCS CODE_81937B               ;$019374	|

CODE_819376:
	LDX.W #$0014                  ;$019376	|
	BRA CODE_819389               ;$019379	|

CODE_81937B:
	LDA.W $336A                   ;$01937B	|
	CLC                           ;$01937E	|
	ADC.W #$00F4                  ;$01937F	|
	STA.B $28                     ;$019382	|
	CPX.B $28                     ;$019384	|
	BCC CODE_819389               ;$019386	|
	TAX                           ;$019388	|

CODE_819389:
	LDA.W #$0001                  ;$019389	|
	STA.W $2250                   ;$01938C	|
	STX.W $2251                   ;$01938F	|
	LDA.B $55                     ;$019392	|
	STA.W $2253                   ;$019394	|
	TXA                           ;$019397	|
	SEC                           ;$019398	|
	SBC.W $2308                   ;$019399	|
	LDX.W $2308                   ;$01939C	|
	RTS                           ;$01939F	|

CODE_JP_0193A0:
	TAX                           ;$0193A0	|
	JSR.W CODE_FN_0193D9          ;$0193A1	|
	STX.B $06                     ;$0193A4	|
	TYX                           ;$0193A6	|
	JSR.W CODE_FN_0193D9          ;$0193A7	|
	STX.B $04                     ;$0193AA	|
	LDA.W $333E                   ;$0193AC	|
	SEC                           ;$0193AF	|
	SBC.W #$0020                  ;$0193B0	|
	TAX                           ;$0193B3	|
	JSR.W CODE_FN_01936F          ;$0193B4	|
	STX.B $00                     ;$0193B7	|
	STA.B $08                     ;$0193B9	|
	LDA.W $333E                   ;$0193BB	|
	CLC                           ;$0193BE	|
	ADC.W #$0120                  ;$0193BF	|
	TAX                           ;$0193C2	|
	JSR.W CODE_FN_01936F          ;$0193C3	|
	STX.B $02                     ;$0193C6	|
	LDA.W #$93F4                  ;$0193C8	|
	LDX.W #$0001                  ;$0193CB	|
	JSL.L SA1_ExecuteSNES              ;$0193CE	|
	LDA.W CameraY_TileMirror                   ;$0193D2	|
	STA.W $3340                   ;$0193D5	|
	RTS                           ;$0193D8	|

CODE_FN_0193D9:
	BMI CODE_8193E0               ;$0193D9	|
	CPX.W #$0014                  ;$0193DB	|
	BCS CODE_8193E5               ;$0193DE	|

CODE_8193E0:
	LDX.W #$0014                  ;$0193E0	|
	BRA CODE_8193F3               ;$0193E3	|

CODE_8193E5:
	LDA.W $3368                   ;$0193E5	|
	CLC                           ;$0193E8	|
	ADC.W #$00B0                  ;$0193E9	|
	STA.B $28                     ;$0193EC	|
	CPX.B $28                     ;$0193EE	|
	BCC CODE_8193F3               ;$0193F0	|
	TAX                           ;$0193F2	|

CODE_8193F3:
	RTS                           ;$0193F3	|
	LDX.W #$0000                  ;$0193F4	|

CODE_8193F7:
	LDA.W $09A8,X                 ;$0193F7	|
	INC A                         ;$0193FA	|
	BNE CODE_8193FE               ;$0193FB	|
	RTL                           ;$0193FD	|

CODE_8193FE:
	LDA.W CameraLock                   ;$0193FE	|
	BEQ CODE_819404               ;$019401	|
	RTL                           ;$019403	|

CODE_819404:
	LDA.B $00                     ;$019404	|
	CMP.B $02                     ;$019406	|
	BEQ CODE_81942F               ;$019408	|
	BCS CODE_819419               ;$01940A	|
	LDA.W $0BA8,X                 ;$01940C	|
	CMP.B $00                     ;$01940F	|
	BCC CODE_81942F               ;$019411	|
	CMP.B $02                     ;$019413	|
	BCS CODE_81942F               ;$019415	|
	BRA CODE_819424               ;$019417	|

CODE_819419:
	LDA.W $0BA8,X                 ;$019419	|
	CMP.B $00                     ;$01941C	|
	BCC CODE_819424               ;$01941E	|
	CMP.B $02                     ;$019420	|
	BCC CODE_81942F               ;$019422	|

CODE_819424:
	LDA.W $0DA8,X                 ;$019424	|
	CMP.B $04                     ;$019427	|
	BCC CODE_81942F               ;$019429	|
	CMP.B $06                     ;$01942B	|
	BCC CODE_819433               ;$01942D	|

CODE_81942F:
	INX                           ;$01942F	|
	INX                           ;$019430	|
	BRA CODE_8193F7               ;$019431	|

CODE_819433:
	TXA                           ;$019433	|
	INC A                         ;$019434	|
	LDY.W #$0000                  ;$019435	|

CODE_819438:
	CMP.W $794E,Y                 ;$019438	|
	BEQ CODE_81942F               ;$01943B	|
	INY                           ;$01943D	|
	INY                           ;$01943E	|
	CPY.W #$0028                  ;$01943F	|
	BCC CODE_819438               ;$019442	|
	PHX                           ;$019444	|
	LDA.W #$0018                  ;$019445	|
	STA.W $6010                   ;$019448	|
	LDA.W #$0040                  ;$01944B	|
	STA.W $6012                   ;$01944E	|
	LDA.W $09A8,X                 ;$019451	|
	STA.W $6000                   ;$019454	|
	STZ.W $6002                   ;$019457	|
	STZ.W $6004                   ;$01945A	|
	STZ.W $6006                   ;$01945D	|
	XBA                           ;$019460	|
	AND.W #$00FF                  ;$019461	|
	CMP.W #$0065                  ;$019464	|
	BNE CODE_819475               ;$019467	|
	LDA.W #$0016                  ;$019469	|
	STA.W $6010                   ;$01946C	|
	LDA.W #$0018                  ;$01946F	|
	STA.W $6012                   ;$019472	|

CODE_819475:
	LDA.W $0DA8,X                 ;$019475	|
	TAY                           ;$019478	|
	LDA.W $0BA8,X                 ;$019479	|
	CLC                           ;$01947C	|
	ADC.B $08                     ;$01947D	|
	TAX                           ;$01947F	|
	LDA.W #$0009                  ;$019480	|
	JSL.L CreateNewObject        ;$019483	|
	PLX                           ;$019487	|
	TAY                           ;$019488	|
	BMI CODE_81942F               ;$019489	|
	LDA.W $09A8,X                 ;$01948B	|
	XBA                           ;$01948E	|
	AND.W #$00FF                  ;$01948F	|
	CMP.W #$00FF                  ;$019492	|
	BCS CODE_81949C               ;$019495	|
	TXA                           ;$019497	|
	INC A                         ;$019498	|
	STA.W $7936,Y                 ;$019499	|

CODE_81949C:
	LDA.W #$0000                  ;$01949C	|
	JMP.W CODE_81942F             ;$01949F	|

CODE_FN_0194A2:
	STA.B $00                     ;$0194A2	|
	LDX.W #$0078                  ;$0194A4	|

CODE_0194A7:
	LDA.W $623C,X                 ;$0194A7	|
	BMI CODE_0194CA               ;$0194AA	|
	LDA.W $6986,X                 ;$0194AC	|
	BMI CODE_0194BB               ;$0194AF	|
	CMP.B $55                     ;$0194B1	|
	BCC CODE_0194BB               ;$0194B3	|
	CLC                           ;$0194B5	|
	ADC.B $00                     ;$0194B6	|
	STA.W $6986,X                 ;$0194B8	|

CODE_0194BB:
	LDA.W $6892,X                 ;$0194BB	|
	BMI CODE_0194CA               ;$0194BE	|
	CMP.B $55                     ;$0194C0	|
	BCC CODE_0194CA               ;$0194C2	|
	CLC                           ;$0194C4	|
	ADC.B $00                     ;$0194C5	|
	STA.W $6892,X                 ;$0194C7	|

CODE_0194CA:
	DEX                           ;$0194CA	|
	DEX                           ;$0194CB	|
	BPL CODE_0194A7               ;$0194CC	|
	LDA.W CameraX_TileMirror                   ;$0194CE	|
	CLC                           ;$0194D1	|
	ADC.B $00                     ;$0194D2	|
	STA.W CameraX_TileMirror                   ;$0194D4	|
	LDA.W $3358                   ;$0194D7	|
	CLC                           ;$0194DA	|
	ADC.B $00                     ;$0194DB	|
	STA.W $3358                   ;$0194DD	|
	LDA.W $334A                   ;$0194E0	|
	CLC                           ;$0194E3	|
	ADC.B $00                     ;$0194E4	|
	STA.W $334A                   ;$0194E6	|
	LDA.W $3350                   ;$0194E9	|
	CLC                           ;$0194EC	|
	ADC.B $00                     ;$0194ED	|
	STA.W $3350                   ;$0194EF	|
	LDA.W Room_Bound_Offset_X                   ;$0194F2	|
	CMP.B $55                     ;$0194F5	|
	BCC CODE_019508               ;$0194F7	|
	CLC                           ;$0194F9	|
	ADC.B $00                     ;$0194FA	|
	STA.W Room_Bound_Offset_X                   ;$0194FC	|
	LDA.W Room_Size_X                   ;$0194FF	|
	CLC                           ;$019502	|
	ADC.B $00                     ;$019503	|
	STA.W Room_Size_X                   ;$019505	|

CODE_019508:
	LDA.W $3370                   ;$019508	|
	CMP.B $55                     ;$01950B	|
	BCC CODE_01951E               ;$01950D	|
	CLC                           ;$01950F	|
	ADC.B $00                     ;$019510	|
	STA.W $3370                   ;$019512	|
	LDA.W $3372                   ;$019515	|
	CLC                           ;$019518	|
	ADC.B $00                     ;$019519	|
	STA.W $3372                   ;$01951B	|

CODE_01951E:
	LDA.W $3342                   ;$01951E	|
	CLC                           ;$019521	|
	ADC.B $00                     ;$019522	|
	STA.W $3342                   ;$019524	|
	LDA.W $3382                   ;$019527	|
	CLC                           ;$01952A	|
	ADC.B $00                     ;$01952B	|
	STA.W $3382                   ;$01952D	|
	LDA.W $6240                   ;$019530	|
	BMI CODE_019547               ;$019533	|
	LDA.W $3344                   ;$019535	|
	CLC                           ;$019538	|
	ADC.B $00                     ;$019539	|
	STA.W $3344                   ;$01953B	|
	LDA.W $3384                   ;$01953E	|
	CLC                           ;$019541	|
	ADC.B $00                     ;$019542	|
	STA.W $3384                   ;$019544	|

CODE_019547:
    LDA.W $332E                   ;$019547 |
    AND.W #$0002                  ;$01954A |
    BEQ CODE_01956C               ;$01954D |
    LDA.W $3322                   ;$01954F |
    LDY.W $3350                   ;$019552 |
    JSR.W CODE_FN_01A55F          ;$019555 |
    BCS CODE_01956C               ;$019558 |
    ADC.W $3326                   ;$01955A |
    TAX                           ;$01955D |
    SEC                           ;$01955E |
    SBC.W $3039                   ;$01955F |
    CLC                           ;$019562 |
    ADC.W $335A                   ;$019563 |
    STA.W $335A                   ;$019566 |
    STX.W $3039                   ;$019569 |

CODE_01956C:
    RTS                           ;$01956C |

CODE_FN_01956D:
	LDA.W $3322                   ;$01956D	|
	BPL CODE_819595               ;$019570	|
	LDA.B $55                     ;$019572	|
	ASL A                         ;$019574	|
	CMP.W CameraX_TileMirror                   ;$019575	|
	BCC CODE_019581               ;$019578	|
	LDA.B $5B                     ;$01957A	|
	JSR.W CODE_FN_0194A2          ;$01957C	|
	BRA CODE_819595               ;$01957F	|

CODE_019581:
	LDA.W #$8000                  ;$019581	|
	SEC                           ;$019584	|
	SBC.B $55                     ;$019585	|
	CMP.W CameraX_TileMirror                   ;$019587	|
	BCS CODE_819595               ;$01958A	|
	LDA.B $5B                     ;$01958C	|
	EOR.W #$FFFF                  ;$01958E	|
	INC A                         ;$019591	|
	JSR.W CODE_FN_0194A2          ;$019592	|

CODE_819595:
	LDA.W $3330                   ;$019595	|
	CMP.W #$0005                  ;$019598	|
	BCS CODE_8195F9               ;$01959B	|
	STZ.B $00                     ;$01959D	|
	LDA.W $332E                   ;$01959F	|
	AND.W #$0002                  ;$0195A2	|
	BEQ CODE_8195B9               ;$0195A5	|
	JSR.W CODE_81983A             ;$0195A7	|
	LDA.W $303F                   ;$0195AA	|
	SEC                           ;$0195AD	|
	SBC.W $335E                   ;$0195AE	|
	BCS CODE_8195B7               ;$0195B1	|
	EOR.W #$FFFF                  ;$0195B3	|
	INC A                         ;$0195B6	|

CODE_8195B7:
	STA.B $00                     ;$0195B7	|

CODE_8195B9:
	LDA.W $332E                   ;$0195B9	|
	AND.W #$0001                  ;$0195BC	|
	BNE CODE_8195C8               ;$0195BF	|

CODE_8195C1:
	LDA.B $00                     ;$0195C1	|
	BEQ CODE_8195F9               ;$0195C3	|
	JMP.W CODE_8197EE             ;$0195C5	|

CODE_8195C8:
	LDA.W CameraX_TileMirror                   ;$0195C8	|
	SEC                           ;$0195CB	|
	SBC.W $3358                   ;$0195CC	|
	BCS CODE_8195D5               ;$0195CF	|
	EOR.W #$FFFF                  ;$0195D1	|
	INC A                         ;$0195D4	|

CODE_8195D5:
	STA.B $02                     ;$0195D5	|
	LDA.W CameraY_TileMirror                   ;$0195D7	|
	SEC                           ;$0195DA	|
	SBC.W $335C                   ;$0195DB	|
	BCS CODE_8195E6               ;$0195DE	|
	EOR.W #$FFFF                  ;$0195E0	|
	ADC.W #$0008                  ;$0195E3	|

CODE_8195E6:
	CMP.B $02                     ;$0195E6	|
	BCC CODE_8195F1               ;$0195E8	|
	CMP.B $00                     ;$0195EA	|
	BCC CODE_8195C1               ;$0195EC	|
	JMP.W CODE_JP_019709          ;$0195EE	|

CODE_8195F1:
	LDA.B $02                     ;$0195F1	|
	CMP.B $00                     ;$0195F3	|
	BCC CODE_8195C1               ;$0195F5	|
	BRA CODE_8195FA               ;$0195F7	|

CODE_8195F9:
	RTS                           ;$0195F9	|

CODE_8195FA:
	LDA.W CameraX_TileMirror                   ;$0195FA	|
	SEC                           ;$0195FD	|
	SBC.W $3358                   ;$0195FE	|
	BPL CODE_819606               ;$019601	|
	JMP.W CODE_JP_019693          ;$019603	|

CODE_819606:
	CMP.W #$0008                  ;$019606	|
	BCS CODE_81960C               ;$019609	|

CODE_81960B:
	RTS                           ;$01960B	|

CODE_81960C:
	LDA.W $3012                   ;$01960C	|
	CMP.W #$7FBF                  ;$01960F	|
	BCS CODE_81960B               ;$019612	|
	LDA.W $3019                   ;$019614	|
	CLC                           ;$019617	|
	ADC.W #$00A6                  ;$019618	|
	CMP.W $301B                   ;$01961B	|
	BCS CODE_81960B               ;$01961E	|
	LDA.W $3358                   ;$019620	|
	ADC.W #$0008                  ;$019623	|
	STA.W $3358                   ;$019626	|
	LDA.W $337E                   ;$019629	|
	INC A                         ;$01962C	|
	INC A                         ;$01962D	|
	AND.W #$007F                  ;$01962E	|
	STA.W $337E                   ;$019631	|
	INC.W $337C                   ;$019634	|
	LDA.W $337C                   ;$019637	|
	CLC                           ;$01963A	|
	ADC.W #$0024                  ;$01963B	|
	AND.W #$003F                  ;$01963E	|
	BIT.W #$0020                  ;$019641	|
	BEQ CODE_819649               ;$019644	|
	EOR.W #$0420                  ;$019646	|

CODE_819649:
	ORA.W #$4800                  ;$019649	|
	STA.B $00                     ;$01964C	|
	LDA.W $3378                   ;$01964E	|
	CLC                           ;$019651	|
	ADC.W #$05A0                  ;$019652	|
	CMP.W #$10E0                  ;$019655	|
	BEQ CODE_819664               ;$019658	|
	CMP.W #$21C0                  ;$01965A	|
	BEQ CODE_819664               ;$01965D	|
	CMP.W #$32A0                  ;$01965F	|
	BNE CODE_819678               ;$019662	|

CODE_819664:
	SEC                           ;$019664	|
	SBC.W #$10E0                  ;$019665	|
	TAX                           ;$019668	|
	LDA.W $3374                   ;$019669	|
	INC A                         ;$01966C	|
	INC A                         ;$01966D	|
	CMP.B $53                     ;$01966E	|
	BCC CODE_819674               ;$019670	|
	SBC.B $53                     ;$019672	|

CODE_819674:
	STA.W $3374                   ;$019674	|
	TXA                           ;$019677	|

CODE_819678:
	STA.W $3378                   ;$019678	|
	STA.B $04                     ;$01967B	|
	LDA.W $3374                   ;$01967D	|
	CLC                           ;$019680	|
	ADC.W #$0018                  ;$019681	|
	CMP.B $53                     ;$019684	|
	BCC CODE_81968A               ;$019686	|
	SBC.B $53                     ;$019688	|

CODE_81968A:
	STA.B $02                     ;$01968A	|
	JSL.L CODE_FL_019031          ;$01968C	|
	JMP.W CODE_8195FA             ;$019690	|

CODE_JP_019693:
	LDA.W $3012                   ;$019693	|
	CMP.W #$7FBF                  ;$019696	|
	BCS CODE_8196A7               ;$019699	|
	LDA.W $3019                   ;$01969B	|
	CLC                           ;$01969E	|
	ADC.W #$00A6                  ;$01969F	|
	CMP.W $301B                   ;$0196A2	|
	BCC CODE_8196A8               ;$0196A5	|

CODE_8196A7:
	RTS                           ;$0196A7	|

CODE_8196A8:
	LDA.W $3358                   ;$0196A8	|
	SBC.W #$0007                  ;$0196AB	|
	STA.W $3358                   ;$0196AE	|
	LDA.W $337E                   ;$0196B1	|
	DEC A                         ;$0196B4	|
	DEC A                         ;$0196B5	|
	AND.W #$007F                  ;$0196B6	|
	STA.W $337E                   ;$0196B9	|
	DEC.W $337C                   ;$0196BC	|
	LDA.W $337C                   ;$0196BF	|
	AND.W #$003F                  ;$0196C2	|
	BIT.W #$0020                  ;$0196C5	|
	BEQ CODE_8196CD               ;$0196C8	|
	EOR.W #$0420                  ;$0196CA	|

CODE_8196CD:
	ORA.W #$4800                  ;$0196CD	|
	STA.B $00                     ;$0196D0	|
	LDA.W $3378                   ;$0196D2	|
	SEC                           ;$0196D5	|
	SBC.W #$05A0                  ;$0196D6	|
	BMI CODE_8196E5               ;$0196D9	|
	CMP.W #$0B40                  ;$0196DB	|
	BEQ CODE_8196E5               ;$0196DE	|
	CMP.W #$1C20                  ;$0196E0	|
	BNE CODE_8196F8               ;$0196E3	|

CODE_8196E5:
	CLC                           ;$0196E5	|
	ADC.W #$10E0                  ;$0196E6	|
	TAX                           ;$0196E9	|
	LDA.W $3374                   ;$0196EA	|
	DEC A                         ;$0196ED	|
	DEC A                         ;$0196EE	|
	BPL CODE_8196F4               ;$0196EF	|
	CLC                           ;$0196F1	|
	ADC.B $53                     ;$0196F2	|

CODE_8196F4:
	STA.W $3374                   ;$0196F4	|
	TXA                           ;$0196F7	|

CODE_8196F8:
	STA.W $3378                   ;$0196F8	|
	STA.B $04                     ;$0196FB	|
	LDA.W $3374                   ;$0196FD	|
	STA.B $02                     ;$019700	|
	JSL.L CODE_FL_019031          ;$019702	|
	JMP.W CODE_8195FA             ;$019706	|

CODE_JP_019709:
	LDA.W CameraY_TileMirror                   ;$019709	|
	SEC                           ;$01970C	|
	SBC.W $335C                   ;$01970D	|
	BMI CODE_81978C               ;$019710	|
	CMP.W #$0008                  ;$019712	|
	BCS CODE_819718               ;$019715	|

CODE_819717:
	RTS                           ;$019717	|

CODE_819718:
	LDA.W $3012                   ;$019718	|
	CMP.W #$7F7F                  ;$01971B	|
	BCS CODE_819717               ;$01971E	|
	LDA.W $3019                   ;$019720	|
	CLC                           ;$019723	|
	ADC.W #$014C                  ;$019724	|
	CMP.W $301B                   ;$019727	|
	BCS CODE_819717               ;$01972A	|
	LDA.W $335C                   ;$01972C	|
	ADC.W #$0008                  ;$01972F	|
	STA.W $335C                   ;$019732	|
	LDA.W $3380                   ;$019735	|
	INC A                         ;$019738	|
	INC A                         ;$019739	|
	AND.W #$003F                  ;$01973A	|
	STA.W $3380                   ;$01973D	|
	LDA.W $337A                   ;$019740	|
	CLC                           ;$019743	|
	ADC.W #$0020                  ;$019744	|
	CMP.W #$4C00                  ;$019747	|
	BCC CODE_81974F               ;$01974A	|
	SBC.W #$0400                  ;$01974C	|

CODE_81974F:
	STA.W $337A                   ;$01974F	|
	SEC                           ;$019752	|
	SBC.W #$0100                  ;$019753	|
	CMP.W #$4800                  ;$019756	|
	BCS CODE_81975E               ;$019759	|
	ADC.W #$0400                  ;$01975B	|

CODE_81975E:
	STA.B $00                     ;$01975E	|
	LDA.W $3378                   ;$019760	|
	CLC                           ;$019763	|
	ADC.W #$10E0                  ;$019764	|
	CMP.W #$32A0                  ;$019767	|
	BCC CODE_819772               ;$01976A	|
	SBC.W #$32A0                  ;$01976C	|
	INC.W $3376                   ;$01976F	|

CODE_819772:
	STA.W $3378                   ;$019772	|
	STA.B $04                     ;$019775	|
	LDA.W $3376                   ;$019777	|
	CLC                           ;$01977A	|
	ADC.W #$0008                  ;$01977B	|
	STA.B $02                     ;$01977E	|
	LDY.W $3374                   ;$019780	|
	STY.B $06                     ;$019783	|
	JSL.L CODE_FL_018F40          ;$019785	|
	JMP.W CODE_JP_019709          ;$019789	|

CODE_81978C:
	LDA.W $3012                   ;$01978C	|
	CMP.W #$7F7F                  ;$01978F	|
	BCC CODE_819795               ;$019792	|

CODE_819794:
	RTS                           ;$019794	|

CODE_819795:
	LDA.W $3019                   ;$019795	|
	CLC                           ;$019798	|
	ADC.W #$014C                  ;$019799	|
	CMP.W $301B                   ;$01979C	|
	BCS CODE_819794               ;$01979F	|
	LDA.W $335C                   ;$0197A1	|
	SBC.W #$0007                  ;$0197A4	|
	STA.W $335C                   ;$0197A7	|
	LDA.W $3380                   ;$0197AA	|
	DEC A                         ;$0197AD	|
	DEC A                         ;$0197AE	|
	AND.W #$003F                  ;$0197AF	|
	STA.W $3380                   ;$0197B2	|
	LDA.W $337A                   ;$0197B5	|
	SEC                           ;$0197B8	|
	SBC.W #$0020                  ;$0197B9	|
	CMP.W #$4800                  ;$0197BC	|
	BCS CODE_8197C4               ;$0197BF	|
	ADC.W #$0400                  ;$0197C1	|

CODE_8197C4:
	STA.W $337A                   ;$0197C4	|
	STA.B $00                     ;$0197C7	|
	LDA.W $3378                   ;$0197C9	|
	SEC                           ;$0197CC	|
	SBC.W #$10E0                  ;$0197CD	|
	BCS CODE_8197D8               ;$0197D0	|
	ADC.W #$32A0                  ;$0197D2	|
	DEC.W $3376                   ;$0197D5	|

CODE_8197D8:
	STA.W $3378                   ;$0197D8	|
	STA.B $04                     ;$0197DB	|
	LDA.W $3376                   ;$0197DD	|
	LDY.W $3374                   ;$0197E0	|
	STA.B $02                     ;$0197E3	|
	STY.B $06                     ;$0197E5	|
	JSL.L CODE_FL_018F40          ;$0197E7	|
	JMP.W CODE_JP_019709          ;$0197EB	|

CODE_8197EE:
	LDA.W $3012                   ;$0197EE	|
	CMP.W #$7FBF                  ;$0197F1	|
	BCS CODE_81980D               ;$0197F4	|
	LDA.W $3019                   ;$0197F6	|
	CLC                           ;$0197F9	|
	ADC.W #$00A6                  ;$0197FA	|
	CMP.W $301B                   ;$0197FD	|
	BCS CODE_81980D               ;$019800	|
	LDA.W $303F                   ;$019802	|
	AND.W #$FFF8                  ;$019805	|
	CMP.W $335E                   ;$019808	|
	BNE CODE_81980E               ;$01980B	|

CODE_81980D:
	RTS                           ;$01980D	|

CODE_81980E:
	BMI CODE_819825               ;$01980E	|
	LDA.W $335E                   ;$019810	|
	CLC                           ;$019813	|
	ADC.W #$0008                  ;$019814	|
	STA.W $335E                   ;$019817	|
	ADC.W #$00C8                  ;$01981A	|
	LDY.W $335A                   ;$01981D	|
	JSR.W CODE_FN_019888          ;$019820	|
	BRA CODE_8197EE               ;$019823	|

CODE_819825:
	LDA.W $335E                   ;$019825	|
	SEC                           ;$019828	|
	SBC.W #$0008                  ;$019829	|
	STA.W $335E                   ;$01982C	|
	SBC.W #$0030                  ;$01982F	|
	LDY.W $335A                   ;$019832	|
	JSR.W CODE_FN_019888          ;$019835	|
	BRA CODE_8197EE               ;$019838	|

CODE_81983A:
	LDA.W $3012                   ;$01983A	|
	CMP.W #$7FBF                  ;$01983D	|
	BCS CODE_819864               ;$019840	|
	LDA.W $3019                   ;$019842	|
	CLC                           ;$019845	|
	ADC.W #$00A6                  ;$019846	|
	CMP.W $301B                   ;$019849	|
	BCS CODE_819864               ;$01984C	|
	LDA.W $335E                   ;$01984E	|
	SEC                           ;$019851	|
	SBC.W #$0030                  ;$019852	|
	TAY                           ;$019855	|
	LDA.W $3039                   ;$019856	|
	ADC.W #$0004                  ;$019859	|
	AND.W #$FFF8                  ;$01985C	|
	CMP.W $335A                   ;$01985F	|
	BNE CODE_819865               ;$019862	|

CODE_819864:
	RTS                           ;$019864	|

CODE_819865:
	BMI CODE_819879               ;$019865	|
	LDA.W $335A                   ;$019867	|
	CLC                           ;$01986A	|
	ADC.W #$0008                  ;$01986B	|
	STA.W $335A                   ;$01986E	|
	ADC.W #$00F8                  ;$019871	|
	JSR.W CODE_FN_019941          ;$019874	|
	BRA CODE_81983A               ;$019877	|

CODE_819879:
	LDA.W $335A                   ;$019879	|
	SEC                           ;$01987C	|
	SBC.W #$0008                  ;$01987D	|
	STA.W $335A                   ;$019880	|
	JSR.W CODE_FN_019941          ;$019883	|
	BRA CODE_81983A               ;$019886	|

CODE_FN_019888:
	TAX                           ;$019888	|
	LDA.W #$0003                  ;$019889	|
	STA.B $31                     ;$01988C	|
	LDA.W #$0040                  ;$01988E	|
	STA.B $32                     ;$019891	|
	LDA.W $3012                   ;$019893	|
	STA.B $34                     ;$019896	|
	CLC                           ;$019898	|
	ADC.W #$0040                  ;$019899	|
	STA.W $3012                   ;$01989C	|
	LDA.W #$007E                  ;$01989F	|
	STA.B $36                     ;$0198A2	|
	TXA                           ;$0198A4	|
	AND.W #$00F8                  ;$0198A5	|
	ASL A                         ;$0198A8	|
	ASL A                         ;$0198A9	|
	ORA.W #$5400                  ;$0198AA	|
	STA.B CameraX_TileMirror                     ;$0198AD	|
	LDA.W #$0001                  ;$0198AF	|
	STA.W $2250                   ;$0198B2	|
	TXA                           ;$0198B5	|
	BPL CODE_8198C4               ;$0198B6	|

CODE_8198B8:
	STA.B $02                     ;$0198B8	|
	LDA.W $333C                   ;$0198BA	|
	ASL A                         ;$0198BD	|
	ASL A                         ;$0198BE	|
	ASL A                         ;$0198BF	|
	ADC.B $02                     ;$0198C0	|
	BMI CODE_8198B8               ;$0198C2	|

CODE_8198C4:
	LSR A                         ;$0198C4	|
	LSR A                         ;$0198C5	|
	LSR A                         ;$0198C6	|
	STA.W $2251                   ;$0198C7	|
	LDA.W $333C                   ;$0198CA	|
	STA.W $2253                   ;$0198CD	|
	TYA                           ;$0198D0	|
	LSR A                         ;$0198D1	|
	LSR A                         ;$0198D2	|
	LSR A                         ;$0198D3	|
	LDX.W $2308                   ;$0198D4	|
	STA.W $2251                   ;$0198D7	|
	AND.W #$001F                  ;$0198DA	|
	ASL A                         ;$0198DD	|
	STA.B $02                     ;$0198DE	|
	LDA.W $333A                   ;$0198E0	|
	STA.W $2253                   ;$0198E3	|
	ASL A                         ;$0198E6	|
	TAY                           ;$0198E7	|
	LDA.W $2308                   ;$0198E8	|
	ASL A                         ;$0198EB	|
	STA.B $04                     ;$0198EC	|
	STZ.W $2250                   ;$0198EE	|
	LDA.W $333A                   ;$0198F1	|
	ASL A                         ;$0198F4	|
	STA.W $2251                   ;$0198F5	|
	STX.W $2253                   ;$0198F8	|
	LDA.B $04                     ;$0198FB	|
	ADC.W $2306                   ;$0198FD	|
	STA.B $00                     ;$019900	|
	TYA                           ;$019902	|
	STA.B $08                     ;$019903	|
	ADC.W $2306                   ;$019905	|
	STA.B $04                     ;$019908	|
	LDA.W #$0020                  ;$01990A	|
	STA.B $06                     ;$01990D	|
	LDA.W #$991A                  ;$01990F	|
	LDX.W #$0001                  ;$019912	|
	JSL.L SA1_ExecuteSNES         ;$019915	|
	RTS                           ;$019919	|
	PEA.W $007E                   ;$01991A	|
	PLB                           ;$01991D	|
	LDX.B $00                     ;$01991E	|
	LDY.B $02                     ;$019920	|

CODE_819922:
	LDA.W RomStart,X           	  ;$019922	|
	STA.B [$34],Y                 ;$019925	|
	INX                           ;$019927	|
	INX                           ;$019928	|
	CPX.B $04                     ;$019929	|
	BCC CODE_819931               ;$01992B	|
	TXA                           ;$01992D	|
	SBC.B $08                     ;$01992E	|
	TAX                           ;$019930	|

CODE_819931:
	TYA                           ;$019931	|
	INC A                         ;$019932	|
	INC A                         ;$019933	|
	AND.W #$003E                  ;$019934	|
	TAY                           ;$019937	|
	DEC.B $06                     ;$019938	|
	BNE CODE_819922               ;$01993A	|
	PLB                           ;$01993C	|
	JML.L WriteToDMABuffer     ;$01993D	|

CODE_FN_019941:
	TAX                           ;$019941	|
	LDA.W #$001E                  ;$019942	|
	STA.B $31                     ;$019945	|
	LDA.W #$0040                  ;$019947	|
	STA.B $32                     ;$01994A	|
	LDA.W $3012                   ;$01994C	|
	STA.B $34                     ;$01994F	|
	CLC                           ;$019951	|
	ADC.W #$0040                  ;$019952	|
	STA.W $3012                   ;$019955	|
	LDA.W #$007E                  ;$019958	|
	STA.B $36                     ;$01995B	|
	LDA.W #$0001                  ;$01995D	|
	STA.W $2250                   ;$019960	|
	TXA                           ;$019963	|
	LSR A                         ;$019964	|
	LSR A                         ;$019965	|
	LSR A                         ;$019966	|
	STA.W $2251                   ;$019967	|
	LDX.W $333A                   ;$01996A	|
	STX.W $2253                   ;$01996D	|
	AND.W #$001F                  ;$019970	|
	ORA.W #$5400                  ;$019973	|
	STA.B CameraX_TileMirror                     ;$019976	|
	LDA.W $2308                   ;$019978	|
	ASL A                         ;$01997B	|
	STA.B $00                     ;$01997C	|
	TYA                           ;$01997E	|
	BPL CODE_81998B               ;$01997F	|
	STA.B $02                     ;$019981	|
	LDA.W $333C                   ;$019983	|
	ASL A                         ;$019986	|
	ASL A                         ;$019987	|
	ASL A                         ;$019988	|
	ADC.B $02                     ;$019989	|

CODE_81998B:
	LSR A                         ;$01998B	|
	LSR A                         ;$01998C	|
	LSR A                         ;$01998D	|
	STA.W $2251                   ;$01998E	|
	LDA.W $333C                   ;$019991	|
	STA.W $2253                   ;$019994	|
	TYA                           ;$019997	|
	LSR A                         ;$019998	|
	LSR A                         ;$019999	|
	AND.W #$003E                  ;$01999A	|
	STA.B $02                     ;$01999D	|
	LDA.W $2308                   ;$01999F	|
	STZ.W $2250                   ;$0199A2	|
	STA.W $2251                   ;$0199A5	|
	LDA.W $333A                   ;$0199A8	|
	ASL A                         ;$0199AB	|
	STA.W $2253                   ;$0199AC	|
	STA.B $04                     ;$0199AF	|
	LDA.W $2306                   ;$0199B1	|
	ADC.B $00                     ;$0199B4	|
	STA.B $00                     ;$0199B6	|
	LDA.W $3338                   ;$0199B8	|
	STA.B $06                     ;$0199BB	|
	LDA.W #$0020                  ;$0199BD	|
	STA.B $08                     ;$0199C0	|
	LDA.W #$99CD                  ;$0199C2	|
	LDX.W #$0001                  ;$0199C5	|
	JSL.L SA1_ExecuteSNES         ;$0199C8	|
	RTS                           ;$0199CC	|
	LDA.W #$0000                  ;$0199CD	|
	LDY.W #$003E                  ;$0199D0	|

CODE_8199D3:
	STA.B [$34],Y                 ;$0199D3	|
	DEY                           ;$0199D5	|
	DEY                           ;$0199D6	|
	BPL CODE_8199D3               ;$0199D7	|
	PEA.W $007E                   ;$0199D9	|
	PLB                           ;$0199DC	|
	LDX.B $00                     ;$0199DD	|
	LDY.B $02                     ;$0199DF	|

CODE_8199E1:
	LDA.W RomStart,X           ;$0199E1	|
	STA.B [$34],Y                 ;$0199E4	|
	TXA                           ;$0199E6	|
	CLC                           ;$0199E7	|
	ADC.B $04                     ;$0199E8	|
	CMP.B $06                     ;$0199EA	|
	BCC CODE_8199F0               ;$0199EC	|
	SBC.B $06                     ;$0199EE	|

CODE_8199F0:
	TAX                           ;$0199F0	|
	TYA                           ;$0199F1	|
	INC A                         ;$0199F2	|
	INC A                         ;$0199F3	|
	AND.W #$003E                  ;$0199F4	|
	TAY                           ;$0199F7	|
	DEC.B $08                     ;$0199F8	|
	BNE CODE_8199E1               ;$0199FA	|
	PLB                           ;$0199FC	|
	JML.L WriteToDMABuffer     	  ;$0199FD	|

CODE_FN_019A01:
	LDX.W #$001E                  ;$019A01	|

CODE_819A04:
	LDA.W $0FDC,X                 ;$019A04	|
	BNE CODE_819A0E               ;$019A07	|

CODE_JP_019A09:
	DEX                           ;$019A09	|
	DEX                           ;$019A0A	|
	BPL CODE_819A04               ;$019A0B	|
	RTS                           ;$019A0D	|

CODE_819A0E:
    STX.B $2A                     ;$019A0E |
    ASL A                         ;$019A10 |
    TAX                           ;$019A11 |
    JMP.W (PTR16_019A15,X)        ;$019A12 |
PTR16_019A15:
    dw CODE_819A77                ;$019A15 |
    dw CODE_819A36                ;$019A17 |
    dw CODE_019A21                ;$019A19 |
    dw CODE_019A7C                ;$019A1B |
    dw CODE_019AE5                ;$019A1D |
    dw CODE_819A36                ;$019A1F |

CODE_019A21:
    LDX.B $2A                     ;$019A21 |
	LDA.W $101C,X                 ;$019A23	|
	STA.B $64                     ;$019A26	|
	LDA.W $0FFC,X                 ;$019A28	|
	INC A                         ;$019A2B	|
	CMP.W #$000F                  ;$019A2C	|
	BCS CODE_819A36               ;$019A2F	|
	STA.W $0FFC,X                 ;$019A31	|
	BRA CODE_819A77               ;$019A34	|

CODE_819A36:
	JSR.W CODE_FN_019E13          ;$019A36	|
	BCS CODE_819A77               ;$019A39	|
	LDX.B $2A                     ;$019A3B	|
	LDA.W $101C,X                 ;$019A3D	|
	STA.B $64                     ;$019A40	|
	JSR.W CODE_FN_019E2B          ;$019A42	|
	BCC CODE_819A77               ;$019A45	|

CODE_819A47:
	LDX.B $2A                     ;$019A47	|
	LDA.W $0FDC,X                 ;$019A49	|
	CMP.W #$0005                  ;$019A4C	|
	BEQ CODE_819A67               ;$019A4F	|
	LDA.W $101C,X                 ;$019A51	|
	STA.B $49                     ;$019A54	|
	LDA.W #$9B69                  ;$019A56	|
	LDX.W #$0001                  ;$019A59	|
	JSL.L SNES_ExecuteSA1         ;$019A5C	|
	LDA.W #$0003                  ;$019A60	|
	JSL.L PlaySFX          ;$019A63	|

CODE_819A67:
	LDX.B $2A                     ;$019A67	|
	STZ.W $0FDC,X                 ;$019A69	|
	LDA.W $101C,X                 ;$019A6C	|
	STA.B $49                     ;$019A6F	|
	LDA.W #$FFFF                  ;$019A71	|
	STA.W $101C,X                 ;$019A74	|

CODE_819A77:
    LDX.B $2A                     ;$019A77 |
    JMP.W CODE_JP_019A09          ;$019A79 |

CODE_019A7C:
    LDX.B $2A                     ;$019A7C |
    LDA.W $0FFC,X                 ;$019A7E |
    BEQ CODE_819A89               ;$019A81 |
    DEC.W $0FFC,X                 ;$019A83 |
    JMP.W CODE_819A77             ;$019A86 |

CODE_819A89:
	JSR.W CODE_FN_019E13          ;$019A89	|
	BCS CODE_819A77               ;$019A8C	|
	LDA.W $101C,X                 ;$019A8E	|
	STA.B $64                     ;$019A91	|
	JSR.W CODE_FN_019E2B          ;$019A93	|
	BCC CODE_819A77               ;$019A96	|
	LDX.B $2A                     ;$019A98	|
	LDA.W $101C,X                 ;$019A9A	|
	STA.B $28                     ;$019A9D	|
	SEC                           ;$019A9F	|
	SBC.B $53                     ;$019AA0	|
	JSR.W CODE_FN_019ABD          ;$019AA2	|
	LDA.B $28                     ;$019AA5	|
	CLC                           ;$019AA7	|
	ADC.B $53                     ;$019AA8	|
	JSR.W CODE_FN_019ABD          ;$019AAA	|
	LDA.B $28                     ;$019AAD	|
	DEC A                         ;$019AAF	|
	DEC A                         ;$019AB0	|
	JSR.W CODE_FN_019ABD          ;$019AB1	|
	LDA.B $28                     ;$019AB4	|
	INC A                         ;$019AB6	|
	INC A                         ;$019AB7	|
	JSR.W CODE_FN_019ABD          ;$019AB8	|
	BRA CODE_819A47               ;$019ABB	|

CODE_FN_019ABD:
	BMI CODE_819AE4               ;$019ABD	|
	CMP.B $4F                     ;$019ABF	|
	BCS CODE_819AE4               ;$019AC1	|
	JSR.W CODE_FN_019B54          ;$019AC3	|
	CMP.W #$0028                  ;$019AC6	|
	BEQ CODE_819AD5               ;$019AC9	|
	CMP.W #$0074                  ;$019ACB	|
	BEQ CODE_819AD5               ;$019ACE	|
	CMP.W #$0076                  ;$019AD0	|
	BNE CODE_819AE4               ;$019AD3	|

CODE_819AD5:
	LDY.W #$0003                  ;$019AD5	|
	JSL.L CODE_FL_019DC0          ;$019AD8	|
	BCC CODE_819AE4               ;$019ADC	|
	LDA.W #$0005                  ;$019ADE	|
	STA.W $0FFC,X                 ;$019AE1	|

CODE_819AE4:
    RTS                           ;$019AE4 |

CODE_019AE5:
    LDX.B $2A                     ;$019AE5 |
    LDA.W $0FFC,X                 ;$019AE7 |
    BEQ CODE_019AF2               ;$019AEA |
    DEC.W $0FFC,X                 ;$019AEC |

CODE_019AEF:
	JMP.W CODE_819A77             ;$019AEF	|

CODE_019AF2:
	JSR.W CODE_FN_019E13          ;$019AF2	|
	BCS CODE_019AEF               ;$019AF5	|
	LDA.W $101C,X                 ;$019AF7	|
	STA.B $64                     ;$019AFA	|
	JSR.W CODE_FN_019E2B          ;$019AFC	|
	BCC CODE_019AEF               ;$019AFF	|
	LDX.B $2A                     ;$019B01	|
	LDA.W $101C,X                 ;$019B03	|
	STA.B $28                     ;$019B06	|
	SEC                           ;$019B08	|
	SBC.B $53                     ;$019B09	|
	JSR.W CODE_FN_019B27          ;$019B0B	|
	LDA.B $28                     ;$019B0E	|
	CLC                           ;$019B10	|
	ADC.B $53                     ;$019B11	|
	JSR.W CODE_FN_019B27          ;$019B13	|
	LDA.B $28                     ;$019B16	|
	DEC A                         ;$019B18	|
	DEC A                         ;$019B19	|
	JSR.W CODE_FN_019B27          ;$019B1A	|
	LDA.B $28                     ;$019B1D	|
	INC A                         ;$019B1F	|
	INC A                         ;$019B20	|
	JSR.W CODE_FN_019B27          ;$019B21	|
	JMP.W CODE_819A47             ;$019B24	|

CODE_FN_019B27:
	BMI CODE_019B53               ;$019B27	|
	CMP.B $4F                     ;$019B29	|
	BCS CODE_019B53               ;$019B2B	|
	JSR.W CODE_FN_019B54          ;$019B2D	|
	CMP.W #$0028                  ;$019B30	|
	BEQ CODE_019B44               ;$019B33	|
	CMP.W #$0029                  ;$019B35	|
	BEQ CODE_019B44               ;$019B38	|
	CMP.W #$0074                  ;$019B3A	|
	BCC CODE_019B53               ;$019B3D	|
	CMP.W #$0078                  ;$019B3F	|
	BCS CODE_019B53               ;$019B42	|

CODE_019B44:
	LDY.W #$0004                  ;$019B44	|
	JSL.L CODE_FL_019DC0          ;$019B47	|
	BCC CODE_019B53               ;$019B4B	|
	LDA.W #$0005                  ;$019B4D	|
	STA.W $0FFC,X                 ;$019B50	|

CODE_019B53:
	RTS                           ;$019B53	|

CODE_FN_019B54:
	STA.B $64                     ;$019B54	|
	LDA.W #$007F                  ;$019B56	|
	STA.B $66                     ;$019B59	|
	LDA.B [$64]                   ;$019B5B	|
	AND.W #$03FF                  ;$019B5D	|
	TAX                           ;$019B60	|
	LDA.L $7F62A0,X               ;$019B61	|
	AND.W #$007F                  ;$019B65	|
	RTS                           ;$019B68	|
	LDA.W #$0001                  ;$019B69	|
	STA.W $2250                   ;$019B6C	|
	LDA.B $49                     ;$019B6F	|
	STA.W $2251                   ;$019B71	|
	LDA.B $53                     ;$019B74	|
	STA.W $2253                   ;$019B76	|
	LDX.W #$0088                  ;$019B79	|
	LDA.W $2308                   ;$019B7C	|
	ASL A                         ;$019B7F	|
	ADC.W $2308                   ;$019B80	|
	ASL A                         ;$019B83	|
	ASL A                         ;$019B84	|
	ADC.W #$000C                  ;$019B85	|
	STA.W $600C                   ;$019B88	|
	LDA.W $2306                   ;$019B8B	|
	ASL A                         ;$019B8E	|
	ADC.W $2306                   ;$019B8F	|
	ASL A                         ;$019B92	|
	ASL A                         ;$019B93	|
	ASL A                         ;$019B94	|
	ADC.W #$000C                  ;$019B95	|
	STA.W $600E                   ;$019B98	|
	JML.L CODE_FL_009AEB          ;$019B9B	|

CODE_FL_019B9F:
	LDX.W #$0000                  ;$019B9F	|
	LDA.W $36FC                   ;$019BA2	|
	BMI CODE_819BEF               ;$019BA5	|

CODE_819BA7:
	PHX                           ;$019BA7	|
	LDA.W Obj_YPosition+2                   ;$019BA8	|
	CLC                           ;$019BAB	|
	ADC.L DATA16_019C56,X          ;$019BAC	|
	TAY                           ;$019BB0	|
	LDA.W Obj_XPosition+2                   ;$019BB1	|
	CLC                           ;$019BB4	|
	ADC.L DATA16_019C48,X          ;$019BB5	|
	TAX                           ;$019BB9	|
	JSL.L CODE_FL_01CE20          ;$019BBA	|
	CMP.W #$0070                  ;$019BBE	|
	BEQ CODE_819BCD               ;$019BC1	|
	PLX                           ;$019BC3	|
	INX                           ;$019BC4	|
	INX                           ;$019BC5	|
	CPX.W #$000E                  ;$019BC6	|
	BCC CODE_819BA7               ;$019BC9	|
	BRA CODE_819C13               ;$019BCB	|

CODE_819BCD:
	%LoadLongToAX(CODE_FN_019E21)
	JSL.L SA1_ExecuteSNES         ;$019BD3	|
	PLX                           ;$019BD7	|
	LDA.B $49                     ;$019BD8	|
	BEQ CODE_819C13               ;$019BDA	|
	LDA.W Obj_YPosition+2         ;$019BDC	|
	CLC                           ;$019BDF	|
	ADC.L DATA16_019C56,X         ;$019BE0	|
	TAY                           ;$019BE4	|
	LDA.W Obj_XPosition+2         ;$019BE5	|
	CLC                           ;$019BE8	|
	ADC.L DATA16_019C48,X         ;$019BE9	|
	BRA CODE_819C35               ;$019BED	|

CODE_819BEF:
	PHX                           ;$019BEF	|
	LDA.W Obj_YPosition+2         ;$019BF0	|
	CLC                           ;$019BF3	|
	ADC.L DATA16_019C56,X         ;$019BF4	|
	TAY                           ;$019BF8	|
	LDA.W Obj_XPosition+2         ;$019BF9	|
	SEC                           ;$019BFC	|
	SBC.L DATA16_019C48,X         ;$019BFD	|
	TAX                           ;$019C01	|
	JSL.L CODE_FL_01CE20          ;$019C02	|
	CMP.W #$0070                  ;$019C06	|
	BEQ CODE_819C15               ;$019C09	|
	PLX                           ;$019C0B	|
	INX                           ;$019C0C	|
	INX                           ;$019C0D	|
	CPX.W #$000E                  ;$019C0E	|
	BCC CODE_819BEF               ;$019C11	|

CODE_819C13:
	CLC                           ;$019C13	|
	RTL                           ;$019C14	|

CODE_819C15:
	%LoadLongToAX(CODE_FN_019E21)
	JSL.L SA1_ExecuteSNES         ;$019C1B	|
	PLX                           ;$019C1F	|
	LDA.B $49                     ;$019C20	|
	BEQ CODE_819C13               ;$019C22	|
	LDA.W Obj_YPosition+2         ;$019C24	|
	CLC                           ;$019C27	|
	ADC.L DATA16_019C56,X         ;$019C28	|
	TAY                           ;$019C2C	|
	LDA.W Obj_XPosition+2         ;$019C2D	|
	SEC                           ;$019C30	|
	SBC.L DATA16_019C48,X         ;$019C31	|

CODE_819C35:
	TAX                           ;$019C35	|
	JSL.L CODE_FL_039814          ;$019C36	|
	BCS CODE_819C3E               ;$019C3A	|
	SEC                           ;$019C3C	|
	RTL                           ;$019C3D	|

CODE_819C3E:
	LDX.B $39                     ;$019C3E	|
	INC.W $7465,X                 ;$019C40	|
	INC.W $7459,X                 ;$019C43	|
	CLC                           ;$019C46	|
	RTL                           ;$019C47	|

DATA16_019C48:
    dw $0004,$001C,$0004,$0004    ;$019C48 |
    dw $0034,$001C,$001C          ;$019C50 |

DATA16_019C56:
    dw $0000,$0000,$FFE8,$0018    ;$019C56 |
    dw $0000,$FFE8,$0018          ;$019C5E |

CODE_FL_019C64:
	STA.B $49                     ;$019C64	|
	STX.B $4B                     ;$019C66	|
	STY.B $4D                     ;$019C68	|
	TXA                           ;$019C6A	|
	SEC                           ;$019C6B	|
	SBC.B $2A                     ;$019C6C	|
	BCS CODE_019C73               ;$019C6E	|
	LDA.W #$0000                  ;$019C70	|

CODE_019C73:
	STA.B $2E                     ;$019C73	|
	TXA                           ;$019C75	|
	CLC                           ;$019C76	|
	ADC.B $2A                     ;$019C77	|
	STA.B $30                     ;$019C79	|
	TYA                           ;$019C7B	|
	SEC                           ;$019C7C	|
	SBC.B $2C                     ;$019C7D	|
	BCS CODE_019C84               ;$019C7F	|
	LDA.W #$0000                  ;$019C81	|

CODE_019C84:
	STA.B $32                     ;$019C84	|
	TYA                           ;$019C86	|
	CLC                           ;$019C87	|
	ADC.B $2C                     ;$019C88	|
	STA.B $34                     ;$019C8A	|
	LDA.W #$9CDB                  ;$019C8C	|
	LDX.W #$0001                  ;$019C8F	|
	JSL.L SA1_ExecuteSNES         ;$019C92	|
	LDY.B $39                     ;$019C96	|
	LDA.B $00                     ;$019C98	|
	CMP.W #$0001                  ;$019C9A	|
	RTL                           ;$019C9D	|

CODE_FL_019C9E:
	STA.B $49                     ;$019C9E	|
	STX.B $4B                     ;$019CA0	|
	STY.B $4D                     ;$019CA2	|
	TXA                           ;$019CA4	|
	SEC                           ;$019CA5	|
	SBC.B $2A                     ;$019CA6	|
	BCS CODE_819CAD               ;$019CA8	|
	LDA.W #$0000                  ;$019CAA	|

CODE_819CAD:
	STA.B $2E                     ;$019CAD	|
	TXA                           ;$019CAF	|
	CLC                           ;$019CB0	|
	ADC.B $2A                     ;$019CB1	|
	STA.B $30                     ;$019CB3	|
	TYA                           ;$019CB5	|
	SEC                           ;$019CB6	|
	SBC.B $2C                     ;$019CB7	|
	BCS CODE_819CBE               ;$019CB9	|
	LDA.W #$0000                  ;$019CBB	|

CODE_819CBE:
	STA.B $32                     ;$019CBE	|
	TYA                           ;$019CC0	|
	CLC                           ;$019CC1	|
	ADC.B $2C                     ;$019CC2	|
	STA.B $34                     ;$019CC4	|
	LDA.W #$9CD8                  ;$019CC6	|
	LDX.W #$0001                  ;$019CC9	|
	JSL.L SA1_ExecuteSNES              ;$019CCC	|
	LDY.B $39                     ;$019CD0	|
	LDA.B $00                     ;$019CD2	|
	CMP.W #$0001                  ;$019CD4	|
	RTL                           ;$019CD7	|
	JSR.W CODE_FN_01BB69          ;$019CD8	|
	LDA.B $49                     ;$019CDB	|
	LDX.B $4B                     ;$019CDD	|
	LDY.B $4D                     ;$019CDF	|
	STZ.B $00                     ;$019CE1	|
	AND.W #$00FF                  ;$019CE3	|
	STA.B $02                     ;$019CE6	|
	TXA                           ;$019CE8	|
	STA.B $04                     ;$019CE9	|
	SEC                           ;$019CEB	|
	SBC.B $2A                     ;$019CEC	|
	STA.B $06                     ;$019CEE	|
	TXA                           ;$019CF0	|
	CLC                           ;$019CF1	|
	ADC.B $2A                     ;$019CF2	|
	STA.B $08                     ;$019CF4	|
	TYA                           ;$019CF6	|
	STA.B $0A                     ;$019CF7	|
	SEC                           ;$019CF9	|
	SBC.B $2C                     ;$019CFA	|
	STA.B $0C                     ;$019CFC	|
	TYA                           ;$019CFE	|
	CLC                           ;$019CFF	|
	ADC.B $2C                     ;$019D00	|
	STA.B $0E                     ;$019D02	|
	LDX.B $04                     ;$019D04	|
	LDY.B $0A                     ;$019D06	|
	JSR.W CODE_FN_019D6E          ;$019D08	|
	LDX.B $04                     ;$019D0B	|
	LDY.B $0C                     ;$019D0D	|
	JSR.W CODE_FN_019D6E          ;$019D0F	|
	LDX.B $04                     ;$019D12	|
	LDY.B $0E                     ;$019D14	|
	JSR.W CODE_FN_019D6E          ;$019D16	|
	LDX.B $06                     ;$019D19	|
	LDY.B $0A                     ;$019D1B	|
	JSR.W CODE_FN_019D6E          ;$019D1D	|
	LDX.B $06                     ;$019D20	|
	LDY.B $0C                     ;$019D22	|
	JSR.W CODE_FN_019D6E          ;$019D24	|
	LDX.B $06                     ;$019D27	|
	LDY.B $0E                     ;$019D29	|
	JSR.W CODE_FN_019D6E          ;$019D2B	|
	LDX.B $08                     ;$019D2E	|
	LDY.B $0A                     ;$019D30	|
	JSR.W CODE_FN_019D6E          ;$019D32	|
	LDX.B $08                     ;$019D35	|
	LDY.B $0C                     ;$019D37	|
	JSR.W CODE_FN_019D6E          ;$019D39	|
	LDX.B $08                     ;$019D3C	|
	LDY.B $0E                     ;$019D3E	|
	JSR.W CODE_FN_019D6E          ;$019D40	|
	RTL                           ;$019D43	|

CODE_FL_019D44:
	STZ.B $00                     ;$019D44	|
	STA.B $02                     ;$019D46	|
	STX.B $4B                     ;$019D48	|
	STY.B $4D                     ;$019D4A	|
	LDA.W #$9D66                  ;$019D4C	|
	LDX.W #$0001                  ;$019D4F	|
	JSL.L SA1_ExecuteSNES              ;$019D52	|
	LDA.B $00                     ;$019D56	|
	BEQ CODE_019D62               ;$019D58	|
	LDY.B $39                     ;$019D5A	|
	LDA.B $00                     ;$019D5C	|
	CMP.W #$0001                  ;$019D5E	|
	RTL                           ;$019D61	|

CODE_019D62:
	LDY.B $39                     ;$019D62	|
	CLC                           ;$019D64	|
	RTL                           ;$019D65	|
	LDX.B $4B                     ;$019D66	|
	LDY.B $4D                     ;$019D68	|
	JSR.W CODE_FN_019D6E          ;$019D6A	|
	RTL                           ;$019D6D	|

CODE_FN_019D6E:
	JSL.L CODE_FL_01CE20          ;$019D6E	|
	AND.W #$007F                  ;$019D72	|
	CMP.W #$0028                  ;$019D75	|
	BCC CODE_819D82               ;$019D78	|
	CMP.W #$002A                  ;$019D7A	|
	BCS CODE_819D82               ;$019D7D	|

CODE_019D7F:
	ADC.W #$0058                  ;$019D7F	|

CODE_819D82:
	TAX                           ;$019D82	|
	LDA.B $02                     ;$019D83	|
	CMP.W #$0006                  ;$019D85	|
	BCS CODE_819DA3               ;$019D88	|
	CPX.W #$0070                  ;$019D8A	|
	BCC CODE_819DBD               ;$019D8D	|
	LDA.L CODE_019D7F,X           ;$019D8F	|
	AND.W #$000F                  ;$019D93	|
	CMP.B $02                     ;$019D96	|
	BCS CODE_819DBD               ;$019D98	|
	LDA.L LOOSE_OP_019D91,X       ;$019D9A	|
	AND.W #$000F                  ;$019D9E	|
	BRA CODE_819DB4               ;$019DA1	|

CODE_819DA3:
	CPX.W #$0070                  ;$019DA3	|
	BCC CODE_819DB1               ;$019DA6	|
	LDA.L LOOSE_OP_019D91,X       ;$019DA8	|
	AND.W #$000F                  ;$019DAC	|
	BRA CODE_819DB4               ;$019DAF	|

CODE_819DB1:
	LDA.W #$0001                  ;$019DB1	|

CODE_819DB4:
	TAY                           ;$019DB4	|
	JSL.L CODE_FL_019DC0          ;$019DB5	|
	BCC CODE_819DBD               ;$019DB9	|
	INC.B $00                     ;$019DBB	|

CODE_819DBD:
	RTS                           ;$019DBD	|
	LDY.B $4D                     ;$019DBE	|

CODE_FL_019DC0:
	LDX.W #$001E                  ;$019DC0	|

CODE_819DC3:
	LDA.W $0FDC,X                 ;$019DC3	|
	BEQ CODE_819DCF               ;$019DC6	|
	LDA.B $64                     ;$019DC8	|
	CMP.W $101C,X                 ;$019DCA	|
	BEQ CODE_819DDF               ;$019DCD	|

CODE_819DCF:
	DEX                           ;$019DCF	|
	DEX                           ;$019DD0	|
	BPL CODE_819DC3               ;$019DD1	|
	LDX.W #$001E                  ;$019DD3	|

CODE_819DD6:
	LDA.W $0FDC,X                 ;$019DD6	|
	BEQ CODE_819DE1               ;$019DD9	|
	DEX                           ;$019DDB	|
	DEX                           ;$019DDC	|
	BPL CODE_819DD6               ;$019DDD	|

CODE_819DDF:
	CLC                           ;$019DDF	|
	RTL                           ;$019DE0	|

CODE_819DE1:
	STA.W $0FFC,X                 ;$019DE1	|
	LDA.B $64                     ;$019DE4	|
	STA.W $101C,X                 ;$019DE6	|
	TYA                           ;$019DE9	|
	STA.W $0FDC,X                 ;$019DEA	|
	SEC                           ;$019DED	|
    RTL                           ;$019DEE |

    dw $0000,$0201,$0000,$0504    ;$019DEF |
    dw $0909,$0909,$0909,$0909    ;$019DF7 |
    dw $0504,$0101,$0101,$0403    ;$019DFF |
    dw $0403,$0102,$0101,$0101    ;$019E07 |
    dw $0101,$0403                ;$019E0F |

CODE_FN_019E13:
	LDA.W $3017                   ;$019E13	|
	SEC                           ;$019E16	|
	SBC.W $3015                   ;$019E17	|
	AND.W #$03FF                  ;$019E1A	|
	CMP.W #$0370                  ;$019E1D	|
	RTS                           ;$019E20	|

CODE_FN_019E21:
	JSR.W CODE_FN_019E2B          ;$019E21	|
	ROL A                         ;$019E24	|
	AND.W #$0001                  ;$019E25	|
	STA.B $49                     ;$019E28	|
	RTL                           ;$019E2A	|

CODE_FN_019E2B:
	LDA.W #$007F                  ;$019E2B	|
	STA.B $66                     ;$019E2E	|
	LDA.B [$64]                   ;$019E30	|
	AND.W #$03FF                  ;$019E32	|
	CMP.W #$02CE                  ;$019E35	|
	BEQ CODE_819E3D               ;$019E38	|
	JMP.W CODE_JP_019EE8          ;$019E3A	|

CODE_819E3D:
	LDY.B $53                     ;$019E3D	|
	LDA.B [$64],Y                 ;$019E3F	|
	AND.W #$03FF                  ;$019E41	|
	CMP.W #$02CE                  ;$019E44	|
	BNE CODE_019E51               ;$019E47	|
	LDA.W #$02CF                  ;$019E49	|
	JSR.W CODE_FN_019FE9          ;$019E4C	|
	BRA CODE_019EAB               ;$019E4F	|

CODE_019E51:
	TAX                           ;$019E51	|
	LDA.L $7F62A0,X               ;$019E52	|
	AND.W #$007F                  ;$019E56	|
	CMP.W #$0028                  ;$019E59	|
	BEQ CODE_019E68               ;$019E5C	|
	CMP.W #$0029                  ;$019E5E	|
	BEQ CODE_019E68               ;$019E61	|
	CMP.W #$0070                  ;$019E63	|
	BCC CODE_019E95               ;$019E66	|

CODE_019E68:
	LDA.B $5E                     ;$019E68	|
	STA.B $14                     ;$019E6A	|
	LDA.B $5D                     ;$019E6C	|
	STA.B $16                     ;$019E6E	|
	LDA.B $64                     ;$019E70	|
	CLC                           ;$019E72	|
	ADC.B $53                     ;$019E73	|
	STA.B $00                     ;$019E75	|
	LDY.W #$0000                  ;$019E77	|

CODE_019E7A:
	LDA.B [$14],Y                 ;$019E7A	|
	BMI CODE_019E95               ;$019E7C	|
	CMP.B $00                     ;$019E7E	|
	BEQ CODE_019E8A               ;$019E80	|
	TYA                           ;$019E82	|
	CLC                           ;$019E83	|
	ADC.W #$0006                  ;$019E84	|
	TAY                           ;$019E87	|
	BRA CODE_019E7A               ;$019E88	|

CODE_019E8A:
	INY                           ;$019E8A	|
	INY                           ;$019E8B	|
	INY                           ;$019E8C	|
	INY                           ;$019E8D	|
	LDA.B [$14],Y                 ;$019E8E	|
	JSR.W CODE_FN_019FE9          ;$019E90	|
	BRA CODE_019EAB               ;$019E93	|

CODE_019E95:
	LDX.W #$01FE                  ;$019E95	|
	LDA.B $64                     ;$019E98	|

CODE_019E9A:
	CMP.L $7EB000,X               ;$019E9A	|
	BEQ CODE_019EA4               ;$019E9E	|
	DEX                           ;$019EA0	|
	DEX                           ;$019EA1	|
	BPL CODE_019E9A               ;$019EA2	|

CODE_019EA4:
	LDA.L $7EB200,X               ;$019EA4	|
	JSR.W CODE_FN_019FE9          ;$019EA8	|

CODE_019EAB:
	LDA.B $64                     ;$019EAB	|
	SEC                           ;$019EAD	|
	SBC.B $53                     ;$019EAE	|
	BCC CODE_019EDC               ;$019EB0	|
	STA.B $64                     ;$019EB2	|
	LDA.B [$64]                   ;$019EB4	|
	AND.W #$03FF                  ;$019EB6	|
	TAX                           ;$019EB9	|
	LDA.L $7F62A0,X               ;$019EBA	|
	AND.W #$007F                  ;$019EBE	|
	CMP.W #$0030                  ;$019EC1	|
	BCS CODE_019EDC               ;$019EC4	|
	LDX.W #$01FE                  ;$019EC6	|
	LDA.B $64                     ;$019EC9	|

CODE_019ECB:
	CMP.L $7EB000,X               ;$019ECB	|
	BEQ CODE_019ED5               ;$019ECF	|
	DEX                           ;$019ED1	|
	DEX                           ;$019ED2	|
	BPL CODE_019ECB               ;$019ED3	|

CODE_019ED5:
	LDA.L $7EB200,X               ;$019ED5	|
	JSR.W CODE_FN_019FE9          ;$019ED9	|

CODE_019EDC:
	LDA.W #$000C                  ;$019EDC	|
	LDX.W #$001F                  ;$019EDF	|
	JSL.L CODE_FL_009AEB          ;$019EE2	|
	SEC                           ;$019EE6	|
	RTS                           ;$019EE7	|

CODE_JP_019EE8:
	LDA.B [$64]                   ;$019EE8	|
	AND.W #$03FF                  ;$019EEA	|
	LDA.B $64                     ;$019EED	|
	JSR.W CODE_FN_019FA5          ;$019EEF	|
	BCS CODE_819EF5               ;$019EF2	|
	RTS                           ;$019EF4	|

CODE_819EF5:
	LDA.B [$14],Y                 ;$019EF5	|
	STA.B [$64]                   ;$019EF7	|
	AND.W #$03FF                  ;$019EF9	|
	TAX                           ;$019EFC	|
	LDA.L $7F62A0,X               ;$019EFD	|
	AND.W #$007F                  ;$019F01	|
	STA.B $04                     ;$019F04	|
	CMP.W #$0028                  ;$019F06	|
	BEQ CODE_819F45               ;$019F09	|
	CMP.W #$0029                  ;$019F0B	|
	BEQ CODE_819F45               ;$019F0E	|
	CMP.W #$0070                  ;$019F10	|
	BCS CODE_819F45               ;$019F13	|
	LDY.B $53                     ;$019F15	|
	LDA.B [$64],Y                 ;$019F17	|
	AND.W #$03FF                  ;$019F19	|
	TAX                           ;$019F1C	|
	LDA.L $7F62A0,X               ;$019F1D	|
	AND.W #$007F                  ;$019F21	|
	CMP.W #$0028                  ;$019F24	|
	BEQ CODE_819F33               ;$019F27	|
	CMP.W #$0029                  ;$019F29	|
	BEQ CODE_819F33               ;$019F2C	|
	CMP.W #$0070                  ;$019F2E	|
	BCC CODE_819F45               ;$019F31	|

CODE_819F33:
	LDA.B $64                     ;$019F33	|
	CLC                           ;$019F35	|
	ADC.B $53                     ;$019F36	|
	JSR.W CODE_FN_019FA5          ;$019F38	|
	BCC CODE_819F4D               ;$019F3B	|
	INY                           ;$019F3D	|
	INY                           ;$019F3E	|
	LDA.B [$14],Y                 ;$019F3F	|
	STA.B [$64]                   ;$019F41	|
	BRA CODE_819F4A               ;$019F43	|

CODE_819F45:
	LDA.B [$68]                   ;$019F45	|
	INC A                         ;$019F47	|
	STA.B [$68]                   ;$019F48	|

CODE_819F4A:
	JSR.W CODE_FN_019FEB          ;$019F4A	|

CODE_819F4D:
	LDA.B $64                     ;$019F4D	|
	SEC                           ;$019F4F	|
	SBC.B $53                     ;$019F50	|
	BCC CODE_819F99               ;$019F52	|
	STA.B $64                     ;$019F54	|
	LDA.B [$64]                   ;$019F56	|
	AND.W #$03FF                  ;$019F58	|
	TAX                           ;$019F5B	|
	LDA.L $7F62A0,X               ;$019F5C	|
	AND.W #$007F                  ;$019F60	|
	CMP.W #$0027                  ;$019F63	|
	BNE CODE_819F99               ;$019F66	|
	LDA.B $04                     ;$019F68	|
	CMP.W #$0028                  ;$019F6A	|
	BEQ CODE_819F86               ;$019F6D	|
	CMP.W #$0029                  ;$019F6F	|
	BEQ CODE_819F86               ;$019F72	|
	CMP.W #$0070                  ;$019F74	|
	BCS CODE_819F86               ;$019F77	|
	LDA.B $64                     ;$019F79	|
	JSR.W CODE_FN_019FA5          ;$019F7B	|
	BCC CODE_819F99               ;$019F7E	|
	LDA.B [$14],Y                 ;$019F80	|
	STA.B [$64]                   ;$019F82	|
	BRA CODE_819F96               ;$019F84	|

CODE_819F86:
	LDA.B $64                     ;$019F86	|
	CLC                           ;$019F88	|
	ADC.B $53                     ;$019F89	|
	JSR.W CODE_FN_019FA5          ;$019F8B	|
	BCC CODE_819F99               ;$019F8E	|
	INY                           ;$019F90	|
	INY                           ;$019F91	|
	LDA.B [$14],Y                 ;$019F92	|
	STA.B [$64]                   ;$019F94	|

CODE_819F96:
	JSR.W CODE_FN_019FEB          ;$019F96	|

CODE_819F99:
	LDA.W #$000C                  ;$019F99	|
	LDX.W #$001F                  ;$019F9C	|
	JSL.L CODE_FL_009AEB          ;$019F9F	|
	SEC                           ;$019FA3	|
	RTS                           ;$019FA4	|

CODE_FN_019FA5:
	STA.B $18                     ;$019FA5	|
	LSR A                         ;$019FA7	|
	ORA.W #$2000                  ;$019FA8	|
	STA.B $68                     ;$019FAB	|
	LDA.W #$007F                  ;$019FAD	|
	STA.B $1A                     ;$019FB0	|
	STA.B $6A                     ;$019FB2	|
	LDA.B $5D                     ;$019FB4	|
	STA.B $16                     ;$019FB6	|
	LDA.B [$68]                   ;$019FB8	|
	AND.W #$00FF                  ;$019FBA	|
	BNE CODE_819FC3               ;$019FBD	|
	LDA.B $5E                     ;$019FBF	|
	BRA CODE_819FCF               ;$019FC1	|

CODE_819FC3:
	DEC A                         ;$019FC3	|
	BNE CODE_019FCA               ;$019FC4	|
	LDA.B $60                     ;$019FC6	|
	BRA CODE_819FCF               ;$019FC8	|

CODE_019FCA:
	DEC A                         ;$019FCA	|
	BNE CODE_819FE7               ;$019FCB	|
	LDA.B $62                     ;$019FCD	|

CODE_819FCF:
	STA.B $14                     ;$019FCF	|
	LDY.W #$0000                  ;$019FD1	|

CODE_819FD4:
	LDA.B [$14],Y                 ;$019FD4	|
	BMI CODE_819FE7               ;$019FD6	|
	CMP.B $18                     ;$019FD8	|
	BEQ CODE_819FE4               ;$019FDA	|
	TYA                           ;$019FDC	|
	CLC                           ;$019FDD	|
	ADC.W #$0006                  ;$019FDE	|
	TAY                           ;$019FE1	|
	BRA CODE_819FD4               ;$019FE2	|

CODE_819FE4:
	INY                           ;$019FE4	|
	INY                           ;$019FE5	|
	RTS                           ;$019FE6	|

CODE_819FE7:
	CLC                           ;$019FE7	|
	RTS                           ;$019FE8	|

CODE_FN_019FE9:
	STA.B [$64]                   ;$019FE9	|

CODE_FN_019FEB:
	LDA.W #$A07F                  ;$019FEB	|
	LDX.W #$0001                  ;$019FEE	|
	JSL.L SNES_ExecuteSA1         ;$019FF1	|
	LDA.B $00                     ;$019FF5	|
	BEQ CODE_81A048               ;$019FF7	|
	LDX.W #$0010                  ;$019FF9	|

CODE_819FFC:
	STX.B $00                     ;$019FFC	|
	LDA.B [$64]                   ;$019FFE	|
	AND.W #$03FF                  ;$01A000	|
	ASL A                         ;$01A003	|
	ADC.L DATA16_01A049,X          ;$01A004	|
	TAX                           ;$01A008	|
	LDA.L $7F3000,X               ;$01A009	|
	PHA                           ;$01A00D	|
	LDX.B $00                     ;$01A00E	|
	LDA.B $6C                     ;$01A010	|
	AND.W #$001F                  ;$01A012	|
	CLC                           ;$01A015	|
	ADC.L DATA16_01A05B,X          ;$01A016	|
	CMP.W #$0020                  ;$01A01A	|
	BCC CODE_81A022               ;$01A01D	|
	EOR.W #$0420                  ;$01A01F	|

CODE_81A022:
	STA.B $02                     ;$01A022	|
	LDA.B $6C                     ;$01A024	|
	AND.W #$FC00                  ;$01A026	|
	EOR.B $02                     ;$01A029	|
	STA.B $02                     ;$01A02B	|
	LDA.B $6C                     ;$01A02D	|
	AND.W #$03E0                  ;$01A02F	|
	CLC                           ;$01A032	|
	ADC.L DATA16_01A06D,X          ;$01A033	|
	AND.W #$03E0                  ;$01A037	|
	ORA.B $02                     ;$01A03A	|
	TAX                           ;$01A03C	|
	PLA                           ;$01A03D	|
	JSL.L WriteTile               ;$01A03E	|
	LDX.B $00                     ;$01A042	|
	DEX                           ;$01A044	|
	DEX                           ;$01A045	|
	BPL CODE_819FFC               ;$01A046	|

CODE_81A048:
	RTS                           ;$01A048	|

DATA16_01A049:
    dw $0000,$05A0,$0B40,$10E0    ;$01A049 |
    dw $1680,$1C20,$21C0,$2760    ;$01A051 |
    dw $2D00                      ;$01A059 |

DATA16_01A05B:
    dw $0000,$0001,$0002,$0000    ;$01A05B |
    dw $0001,$0002,$0000,$0001    ;$01A063 |
    dw $0002                      ;$01A06B |

DATA16_01A06D:
    dw $0000,$0000,$0000,$0020    ;$01A06D |
    dw $0020,$0020,$0040,$0040    ;$01A075 |
    dw $0040                      ;$01A07D |

	LDA.W #$0001                  ;$01A07F	|
	STA.W $2250                   ;$01A082	|
	LDA.B $64                     ;$01A085	|
	STA.W $2251                   ;$01A087	|
	LDX.B $53                     ;$01A08A	|
	STX.W $2253                   ;$01A08C	|
	LSR A                         ;$01A08F	|
	ORA.W #$2000                  ;$01A090	|
	STA.B $68                     ;$01A093	|
	LDA.W $2308                   ;$01A095	|
	LSR A                         ;$01A098	|
	CLC                           ;$01A099	|
	ADC.W $2308                   ;$01A09A	|
	AND.W #$003F                  ;$01A09D	|
	BIT.W #$0020                  ;$01A0A0	|
	BEQ CODE_81A0A8               ;$01A0A3	|
	EOR.W #$0420                  ;$01A0A5	|

CODE_81A0A8:
	ADC.W #$4800                  ;$01A0A8	|
	STA.B $6C                     ;$01A0AB	|
	LDA.W $2306                   ;$01A0AD	|
	ASL A                         ;$01A0B0	|
	ADC.W $2306                   ;$01A0B1	|
	ASL A                         ;$01A0B4	|
	ASL A                         ;$01A0B5	|
	ASL A                         ;$01A0B6	|
	TAX                           ;$01A0B7	|
	ASL A                         ;$01A0B8	|
	ASL A                         ;$01A0B9	|
	AND.W #$03E0                  ;$01A0BA	|
	ORA.B $6C                     ;$01A0BD	|
	STA.B $6C                     ;$01A0BF	|
	LDA.W $3322                   ;$01A0C1	|
	BMI CODE_81A0ED               ;$01A0C4	|
	LDA.W $2308                   ;$01A0C6	|
	ASL A                         ;$01A0C9	|
	ASL A                         ;$01A0CA	|
	STA.B $00                     ;$01A0CB	|
	ASL A                         ;$01A0CD	|
	ADC.B $00                     ;$01A0CE	|
	SEC                           ;$01A0D0	|
	SBC.W $3358                   ;$01A0D1	|
	CMP.W #$FFD0                  ;$01A0D4	|
	BCS CODE_81A0DE               ;$01A0D7	|
	CMP.W #$0120                  ;$01A0D9	|
	BCS CODE_81A0F3               ;$01A0DC	|

CODE_81A0DE:
	TXA                           ;$01A0DE	|
	SEC                           ;$01A0DF	|
	SBC.W $335C                   ;$01A0E0	|
	CMP.W #$FFE0                  ;$01A0E3	|
	BCS CODE_81A0ED               ;$01A0E6	|
	CMP.W #$00E0                  ;$01A0E8	|
	BCS CODE_81A0F3               ;$01A0EB	|

CODE_81A0ED:
	LDA.W #$0001                  ;$01A0ED	|
	STA.B $00                     ;$01A0F0	|
	RTL                           ;$01A0F2	|

CODE_81A0F3:
	STZ.B $00                     ;$01A0F3	|
	RTL                           ;$01A0F5	|

CODE_FL_01A0F6:
	LDA.W #$A101                  ;$01A0F6	|
	LDX.W #$0001                  ;$01A0F9	|
	JSL.L SA1_ExecuteSNES              ;$01A0FC	|
	RTL                           ;$01A100	|
	LDA.W $32F6                   ;$01A101	|
	STA.B $18                     ;$01A104	|
	LDA.W $32F8                   ;$01A106	|
	STA.B $1A                     ;$01A109	|
	LDA.W #$B400                  ;$01A10B	|
	STA.W $0FD8                   ;$01A10E	|
	LDA.W #$00FF                  ;$01A111	|
	STA.B $16                     ;$01A114	|
	LDX.W #$0000                  ;$01A116	|
	LDY.W #$0021                  ;$01A119	|

CODE_81A11C:
	LDA.W #$FFFF                  ;$01A11C	|
	STA.W $0FB8,X                 ;$01A11F	|
	STA.W $0FA8,X                 ;$01A122	|
	STA.W $0FC8,X                 ;$01A125	|
	LDA.B [$18],Y                 ;$01A128	|
	AND.W #$00FF                  ;$01A12A	|
	BEQ CODE_81A14C               ;$01A12D	|
	STA.B $14                     ;$01A12F	|
	ASL A                         ;$01A131	|
	CLC                           ;$01A132	|
	ADC.B $14                     ;$01A133	|
	ADC.L DATA8_FF0004            ;$01A135	|
	STA.B $14                     ;$01A139	|
	LDA.B [$14]                   ;$01A13B	|
	STA.W $0FA8,X                 ;$01A13D	|
	INC.B $14                     ;$01A140	|
	INC.B $14                     ;$01A142	|
	LDA.B [$14]                   ;$01A144	|
	AND.W #$00FF                  ;$01A146	|
	STA.W $0FB8,X                 ;$01A149	|

CODE_81A14C:
	INX                           ;$01A14C	|
	INX                           ;$01A14D	|
	INY                           ;$01A14E	|
	CPY.W #$0029                  ;$01A14F	|
	BCC CODE_81A11C               ;$01A152	|
	LDX.W #$0000                  ;$01A154	|

CODE_81A157:
	PHX                           ;$01A157	|
	LDA.W $0FA8,X                 ;$01A158	|
	STA.B $14                     ;$01A15B	|
	LDA.W $0FB8,X                 ;$01A15D	|
	BMI CODE_81A173               ;$01A160	|
	STA.B $16                     ;$01A162	|
	LDA.B [$14]                   ;$01A164	|
	AND.W #$00FF                  ;$01A166	|
	BEQ CODE_81A170               ;$01A169	|
	JSR.W CODE_FN_01A17C          ;$01A16B	|
	BRA CODE_81A173               ;$01A16E	|

CODE_81A170:
	INC.W $0FA8,X                 ;$01A170	|

CODE_81A173:
	PLX                           ;$01A173	|
	INX                           ;$01A174	|
	INX                           ;$01A175	|
	CPX.W #$0010                  ;$01A176	|
	BCC CODE_81A157               ;$01A179	|
	RTL                           ;$01A17B	|

CODE_FN_01A17C:
	PHX                           ;$01A17C	|
	LDA.W $0FA8,X                 ;$01A17D	|
	INC A                         ;$01A180	|
	PHA                           ;$01A181	|
	LDA.W $0FB8,X                 ;$01A182	|
	PLX                           ;$01A185	|
	LDY.W $0FD8                   ;$01A186	|
	PEA.W $007E                   ;$01A189	|
	PLB                           ;$01A18C	|
	JSL.L DecompressData          ;$01A18D	|
	PLB                           ;$01A191	|
	PLX                           ;$01A192	|
	LDA.W $0FD8                   ;$01A193	|
	PHA                           ;$01A196	|
	STA.W $0FA8,X                 ;$01A197	|
	LDA.W #$007E                  ;$01A19A	|
	STA.W $0FB8,X                 ;$01A19D	|

CODE_81A1A0:
	LDX.W $0FD8                   ;$01A1A0	|
	LDA.L $7E0000,X               ;$01A1A3	|
	BMI CODE_81A1CA               ;$01A1A7	|
	CLC                           ;$01A1A9	|
	ADC.W $0FD8                   ;$01A1AA	|
	STA.W $0FD8                   ;$01A1AD	|
	TXA                           ;$01A1B0	|
	CLC                           ;$01A1B1	|
	ADC.W #$0007                  ;$01A1B2	|
	TAX                           ;$01A1B5	|
	CLC                           ;$01A1B6	|
	ADC.W #$0006                  ;$01A1B7	|
	STA.L $7E0000,X               ;$01A1BA	|
	SEP #$20                      ;$01A1BE	|
	LDA.B #$7E                    ;$01A1C0	|
	STA.L $7E0002,X               ;$01A1C2	|
	REP #$20                      ;$01A1C6	|
	BRA CODE_81A1A0               ;$01A1C8	|

CODE_81A1CA:
	PLA                           ;$01A1CA	|
	STA.L $7E0002,X               ;$01A1CB	|
	LDA.W #$007E                  ;$01A1CF	|
	STA.L $7E0004,X               ;$01A1D2	|
	LDA.W $0FD8                   ;$01A1D6	|
	CLC                           ;$01A1D9	|
	ADC.W #$0006                  ;$01A1DA	|
	STA.W $0FD8                   ;$01A1DD	|
	RTS                           ;$01A1E0	|

CODE_FL_01A1E1:
	LDA.W #$A1EC                  ;$01A1E1	|
	LDX.W #$0001                  ;$01A1E4	|
	JSL.L SA1_ExecuteSNES              ;$01A1E7	|
	RTL                           ;$01A1EB	|
	LDX.W #$0000                  ;$01A1EC	|

CODE_81A1EF:
	LDA.W $0FB8,X                 ;$01A1EF	|
	BMI CODE_81A200               ;$01A1F2	|
	STA.B $16                     ;$01A1F4	|
	DEC.W $0FC8,X                 ;$01A1F6	|
	BPL CODE_81A200               ;$01A1F9	|
	JSR.W CODE_FN_01A208          ;$01A1FB	|
	BRA CODE_81A1EF               ;$01A1FE	|

CODE_81A200:
	INX                           ;$01A200	|
	INX                           ;$01A201	|
	CPX.W #$0010                  ;$01A202	|
	BCC CODE_81A1EF               ;$01A205	|
	RTL                           ;$01A207	|

CODE_FN_01A208:
	LDA.W $0FA8,X                 ;$01A208	|
	STA.B $14                     ;$01A20B	|
	LDA.B [$14]                   ;$01A20D	|
	CLC                           ;$01A20F	|
	ADC.B $14                     ;$01A210	|
	STA.B $14                     ;$01A212	|
	LDA.B [$14]                   ;$01A214	|
	CMP.W #$FFFF                  ;$01A216	|
	BNE CODE_81A223               ;$01A219	|
	INC.B $14                     ;$01A21B	|
	INC.B $14                     ;$01A21D	|
	LDA.B [$14]                   ;$01A21F	|
	STA.B $14                     ;$01A221	|

CODE_81A223:
	PHX                           ;$01A223	|
	LDA.B $14                     ;$01A224	|
	STA.W $0FA8,X                 ;$01A226	|
	INC.B $14                     ;$01A229	|
	INC.B $14                     ;$01A22B	|
	LDA.B [$14]                   ;$01A22D	|
	AND.W #$FF00                  ;$01A22F	|
	XBA                           ;$01A232	|
	STA.W $0FC8,X                 ;$01A233	|
	LDA.B [$14]                   ;$01A236	|
	INC.B $14                     ;$01A238	|
	INC.B $14                     ;$01A23A	|
	AND.W #$00FF                  ;$01A23C	|
	BNE CODE_81A24B               ;$01A23F	|
	LDA.B $14                     ;$01A241	|
	LDX.B $16                     ;$01A243	|
	JSL.L LoadDMATable          ;$01A245	|
	BRA CODE_81A258               ;$01A249	|

CODE_81A24B:
	LDA.B [$14]                   ;$01A24B	|
	TAY                           ;$01A24D	|
	LDA.B $14                     ;$01A24E	|
	INC A                         ;$01A250	|
	INC A                         ;$01A251	|
	LDX.B $16                     ;$01A252	|
	JSL.L WritePal          ;$01A254	|

CODE_81A258:
	PLX                           ;$01A258	|
	RTS                           ;$01A259	|

CODE_FL_01A25A:
	LDA.W #$A265                  ;$01A25A	|
	LDX.W #$0001                  ;$01A25D	|
	JSL.L SA1_ExecuteSNES              ;$01A260	|
	RTL                           ;$01A264	|
	LDX.W #$0000                  ;$01A265	|

CODE_81A268:
	LDA.W $0FB8,X                 ;$01A268	|
	BMI CODE_81A275               ;$01A26B	|
	STA.B $16                     ;$01A26D	|
	JSR.W CODE_FN_01A208          ;$01A26F	|
	DEC.W $0FC8,X                 ;$01A272	|

CODE_81A275:
	INX                           ;$01A275	|
	INX                           ;$01A276	|
	CPX.W #$0010                  ;$01A277	|
	BCC CODE_81A268               ;$01A27A	|
	RTL                           ;$01A27C	|

CODE_FL_01A27D:
	BIT.W $0000                   ;$01A27D	|
	BPL CODE_81A287               ;$01A280	|
	LDA.W $3330                   ;$01A282	|
	BNE CODE_81A288               ;$01A285	|

CODE_81A287:
	RTL                           ;$01A287	|

CODE_81A288:
	LDA.W $7A97                   ;$01A288	|
	BNE CODE_81A298               ;$01A28B	|
	LDA.W CameraLock                   ;$01A28D	|
	BNE CODE_81A298               ;$01A290	|
	JSR.W CODE_FN_01A2FD          ;$01A292	|
	JSR.W CODE_FN_01A42F          ;$01A295	|

CODE_81A298:
	JSR.W CODE_FN_01956D          ;$01A298	|
	JSR.W CODE_FN_0192BC          ;$01A29B	|
	JSL.L CODE_FL_019146          ;$01A29E	|
	JSL.L CODE_FL_D00623          ;$01A2A2	|
	JSR.W CODE_FN_01C217          ;$01A2A6	|
	LDA.W #$A2B3                  ;$01A2A9	|
	LDX.W #$0001                  ;$01A2AC	|
	JML.L SA1_ExecuteSNES              ;$01A2AF	|
	JSL.L CODE_FL_01A1E1          ;$01A2B3	|
	JSR.W CODE_FN_019A01          ;$01A2B7	|
	JSR.W HandleStatusBar          ;$01A2BA	|
	JSL.L CODE_FL_D00771          ;$01A2BD	|
	LDA.W $7B33                   ;$01A2C1	|
	BNE CODE_81A2C9               ;$01A2C4	|
	JSR.W CODE_FN_01A3C0          ;$01A2C6	|

CODE_81A2C9:
	RTL                           ;$01A2C9	|

CODE_FN_01A2CA:
	LDA.W $334A                   ;$01A2CA	|
	PHA                           ;$01A2CD	|
	LDA.W $334C                   ;$01A2CE	|
	PHA                           ;$01A2D1	|
	JSR.W CODE_FN_01A2FD          ;$01A2D2	|
	PLA                           ;$01A2D5	|
	CMP.W #$FFFF                  ;$01A2D6	|
	BEQ CODE_81A2DE               ;$01A2D9	|
	STA.W $334C                   ;$01A2DB	|

CODE_81A2DE:
	PLA                           ;$01A2DE	|
	CMP.W #$FFFF                  ;$01A2DF	|
	BEQ CODE_81A2E7               ;$01A2E2	|
	STA.W $334A                   ;$01A2E4	|

CODE_81A2E7:
	LDA.W $334A                   ;$01A2E7	|
	STA.W $3350                   ;$01A2EA	|
	LDA.W $334C                   ;$01A2ED	|
	STA.W $3354                   ;$01A2F0	|
	LDA.W #$8000                  ;$01A2F3	|
	STA.W $3352                   ;$01A2F6	|
	STA.W $3356                   ;$01A2F9	|
	RTS                           ;$01A2FC	|

CODE_FN_01A2FD:
	LDA.W $3330                   ;$01A2FD	|
	CMP.W #$0001                  ;$01A300	|
	BEQ CODE_81A30B               ;$01A303	|
	CMP.W #$0005                  ;$01A305	|
	BEQ CODE_81A30B               ;$01A308	|
	RTS                           ;$01A30A	|

CODE_81A30B:
	LDA.W $6240                   ;$01A30B	| ; Camera movement code 1P
	BPL CODE_81A345               ;$01A30E	|
	LDA.W $3342                   ;$01A310	|
	BMI CODE_81A31A               ;$01A313	|
	CMP.W $3370                   ;$01A315	|
	BCS CODE_81A31D               ;$01A318	|

CODE_81A31A:
	LDA.W $3370                   ;$01A31A	|

CODE_81A31D:
	CMP.W $3372                   ;$01A31D	|
	BCC CODE_81A325               ;$01A320	|
	LDA.W $3372                   ;$01A322	|

CODE_81A325:
	STA.W $334A                   ;$01A325	|
	LDA.W $3346                   ;$01A328	|
	CLC                           ;$01A32B	|
	ADC.W $334E                   ;$01A32C	|
	BMI CODE_81A336               ;$01A32F	|
	CMP.W $336C                   ;$01A331	|
	BCS CODE_81A339               ;$01A334	|

CODE_81A336:
	LDA.W $336C                   ;$01A336	|

CODE_81A339:
	CMP.W $336E                   ;$01A339	|
	BCC CODE_81A341               ;$01A33C	|
	LDA.W $336E                   ;$01A33E	|

CODE_81A341:
	STA.W $334C                   ;$01A341	|
	RTS                           ;$01A344	|

CODE_81A345:
	LDA.W $3344                   ;$01A345	| Camera movement code 2P?
	SEC                           ;$01A348	|
	SBC.W $3342                   ;$01A349	|
	BMI CODE_01A35A               ;$01A34C	|
	CMP.W #$00C0                  ;$01A34E	|
	BCC CODE_01A356               ;$01A351	|
	LDA.W #$00C0                  ;$01A353	|

CODE_01A356:
	LSR A                         ;$01A356	|
	LSR A                         ;$01A357	|
	BRA CODE_01A367               ;$01A358	|

CODE_01A35A:
	CMP.W #$FF40                  ;$01A35A	|
	BCS CODE_01A362               ;$01A35D	|
	LDA.W #$FF40                  ;$01A35F	|

CODE_01A362:
	LSR A                         ;$01A362	|
	LSR A                         ;$01A363	|
	ORA.W #$C000                  ;$01A364	|

CODE_01A367:
	ADC.W $3342                   ;$01A367	|
	BMI CODE_01A371               ;$01A36A	|
	CMP.W $3370                   ;$01A36C	|
	BCS CODE_01A374               ;$01A36F	|

CODE_01A371:
	LDA.W $3370                   ;$01A371	|

CODE_01A374:
	CMP.W $3372                   ;$01A374	|
	BCC CODE_01A37C               ;$01A377	|
	LDA.W $3372                   ;$01A379	|

CODE_01A37C:
	STA.W $334A                   ;$01A37C	|
	LDA.W $3348                   ;$01A37F	|
	SEC                           ;$01A382	|
	SBC.W $3346                   ;$01A383	|
	BMI CODE_01A394               ;$01A386	|
	CMP.W #$0080                  ;$01A388	|
	BCC CODE_01A390               ;$01A38B	|
	LDA.W #$0080                  ;$01A38D	|

CODE_01A390:
	LSR A                         ;$01A390	|
	LSR A                         ;$01A391	|
	BRA CODE_01A3A1               ;$01A392	|

CODE_01A394:
	CMP.W #$FF80                  ;$01A394	|
	BCS CODE_01A39C               ;$01A397	|
	LDA.W #$FF80                  ;$01A399	|

CODE_01A39C:
	LSR A                         ;$01A39C	|
	LSR A                         ;$01A39D	|
	ORA.W #$C000                  ;$01A39E	|

CODE_01A3A1:
	ADC.W $3346                   ;$01A3A1	|
	CLC                           ;$01A3A4	|
	ADC.W $334E                   ;$01A3A5	|
	BMI CODE_01A3AF               ;$01A3A8	|
	CMP.W $336C                   ;$01A3AA	|
	BCS CODE_01A3B2               ;$01A3AD	|

CODE_01A3AF:
	LDA.W $336C                   ;$01A3AF	|

CODE_01A3B2:
	CMP.W $336E                   ;$01A3B2	|
	BCC CODE_01A3BA               ;$01A3B5	|
	LDA.W $336E                   ;$01A3B7	|

CODE_01A3BA:
	STA.W $334C                   ;$01A3BA	|
	REP #$10                      ;$01A3BD	|
	RTS                           ;$01A3BF	|

CODE_FN_01A3C0:
	LDA.W $36C4                   ;$01A3C0	|
	ORA.W $36C6                   ;$01A3C3	|
	BIT.W #$0400                  ;$01A3C6	|
	BNE CODE_81A3EB               ;$01A3C9	|
	BIT.W #$0800                  ;$01A3CB	|
	BEQ CODE_81A404               ;$01A3CE	|
	LDA.W $0FDA                   ;$01A3D0	|
	BEQ CODE_81A3D7               ;$01A3D3	|
	BPL CODE_81A404               ;$01A3D5	|

CODE_81A3D7:
	DEC A                         ;$01A3D7	|
	CMP.W #$FFC4                  ;$01A3D8	|
	BCS CODE_81A407               ;$01A3DB	|
	LDA.W $334E                   ;$01A3DD	|
	DEC A                         ;$01A3E0	|
	CMP.W #$FFD0                  ;$01A3E1	|
	BCS CODE_81A42B               ;$01A3E4	|
	LDA.W #$FFD0                  ;$01A3E6	|
	BRA CODE_81A42B               ;$01A3E9	|

CODE_81A3EB:
	LDA.W $0FDA                   ;$01A3EB	|
	BMI CODE_81A404               ;$01A3EE	|
	INC A                         ;$01A3F0	|
	CMP.W #$003C                  ;$01A3F1	|
	BCC CODE_81A407               ;$01A3F4	|
	LDA.W $334E                   ;$01A3F6	|
	INC A                         ;$01A3F9	|
	CMP.W #$0040                  ;$01A3FA	|
	BCC CODE_81A42B               ;$01A3FD	|
	LDA.W #$0040                  ;$01A3FF	|
	BRA CODE_81A42B               ;$01A402	|

CODE_81A404:
	LDA.W #$0000                  ;$01A404	|

CODE_81A407:
	STA.W $0FDA                   ;$01A407	|
	LDA.W $334E                   ;$01A40A	|
	BEQ CODE_81A42B               ;$01A40D	|
	BMI CODE_01A41F               ;$01A40F	|
	LDA.W $334E                   ;$01A411	|
	SEC                           ;$01A414	|
	SBC.W #$0004                  ;$01A415	|
	BPL CODE_81A42B               ;$01A418	|
	LDA.W #$0000                  ;$01A41A	|
	BRA CODE_81A42B               ;$01A41D	|

CODE_01A41F:
	LDA.W $334E                   ;$01A41F	|
	CLC                           ;$01A422	|
	ADC.W #$0004                  ;$01A423	|
	BMI CODE_81A42B               ;$01A426	|
	LDA.W #$0000                  ;$01A428	|

CODE_81A42B:
	STA.W $334E                   ;$01A42B	|
	RTS                           ;$01A42E	|

CODE_FN_01A42F:
	LDA.W $3330                   ;$01A42F	|
	BEQ CODE_81A43E               ;$01A432	|
	CMP.W #$0003                  ;$01A434	|
	BCC CODE_81A441               ;$01A437	|
	CMP.W #$0005                  ;$01A439	|
	BEQ CODE_81A441               ;$01A43C	|

CODE_81A43E:
	JMP.W CODE_81A4E9             ;$01A43E	|

CODE_81A441:
	STZ.B $00                     ;$01A441	|
	LDA.W $3350                   ;$01A443	|
	SEC                           ;$01A446	|
	SBC.W $334A                   ;$01A447	|
	BMI CODE_81A46F               ;$01A44A	|
	CMP.W #$0020                  ;$01A44C	|
	BCC CODE_81A454               ;$01A44F	|
	LDA.W #$0020                  ;$01A451	|

CODE_81A454:
	LSR A                         ;$01A454	|
	ROR.B $00                     ;$01A455	|
	LSR A                         ;$01A457	|
	ROR.B $00                     ;$01A458	|
	STA.B $02                     ;$01A45A	|
	LDA.W $3352                   ;$01A45C	|
	SEC                           ;$01A45F	|
	SBC.B $00                     ;$01A460	|
	STA.W $3352                   ;$01A462	|
	LDA.W $3350                   ;$01A465	|
	SBC.B $02                     ;$01A468	|
	STA.W $3350                   ;$01A46A	|
	BRA CODE_81A494               ;$01A46D	|

CODE_81A46F:
	CMP.W #$FFE0                  ;$01A46F	|
	BCS CODE_81A477               ;$01A472	|
	LDA.W #$FFE0                  ;$01A474	|

CODE_81A477:
	EOR.W #$FFFF                  ;$01A477	|
	INC A                         ;$01A47A	|
	LSR A                         ;$01A47B	|
	ROR.B $00                     ;$01A47C	|
	LSR A                         ;$01A47E	|
	ROR.B $00                     ;$01A47F	|
	STA.B $02                     ;$01A481	|
	LDA.W $3352                   ;$01A483	|
	CLC                           ;$01A486	|
	ADC.B $00                     ;$01A487	|
	STA.W $3352                   ;$01A489	|
	LDA.W $3350                   ;$01A48C	|
	ADC.B $02                     ;$01A48F	|
	STA.W $3350                   ;$01A491	|

CODE_81A494:
	STZ.B $00                     ;$01A494	|
	LDA.W $3354                   ;$01A496	|
	SEC                           ;$01A499	|
	SBC.W $334C                   ;$01A49A	|
	BMI CODE_81A4C2               ;$01A49D	|
	CMP.W #$0020                  ;$01A49F	|
	BCC CODE_81A4A7               ;$01A4A2	|
	LDA.W #$0020                  ;$01A4A4	|

CODE_81A4A7:
	LSR A                         ;$01A4A7	|
	ROR.B $00                     ;$01A4A8	|
	LSR A                         ;$01A4AA	|
	ROR.B $00                     ;$01A4AB	|
	STA.B $02                     ;$01A4AD	|
	LDA.W $3356                   ;$01A4AF	|
	SEC                           ;$01A4B2	|
	SBC.B $00                     ;$01A4B3	|
	STA.W $3356                   ;$01A4B5	|
	LDA.W $3354                   ;$01A4B8	|
	SBC.B $02                     ;$01A4BB	|
	STA.W $3354                   ;$01A4BD	|
	BRA CODE_81A4E9               ;$01A4C0	|

CODE_81A4C2:
	CMP.W #$FFE0                  ;$01A4C2	|
	BCS CODE_81A4CA               ;$01A4C5	|
	LDA.W #$FFE0                  ;$01A4C7	|

CODE_81A4CA:
	EOR.W #$FFFF                  ;$01A4CA	|
	INC A                         ;$01A4CD	|
	LSR A                         ;$01A4CE	|
	ROR.B $00                     ;$01A4CF	|
	LSR A                         ;$01A4D1	|
	ROR.B $00                     ;$01A4D2	|
	STA.B $02                     ;$01A4D4	|
	LDA.W $3356                   ;$01A4D6	|
	CLC                           ;$01A4D9	|
	ADC.B $00                     ;$01A4DA	|
	STA.W $3356                   ;$01A4DC	|
	LDA.W $3354                   ;$01A4DF	|
	ADC.B $02                     ;$01A4E2	|
	STA.W $3354                   ;$01A4E4	|
	BRA CODE_81A4E9               ;$01A4E7	|

CODE_81A4E9:
	LDA.W $3330                   ;$01A4E9	|
	BEQ CODE_81A4FF               ;$01A4EC	|
	CMP.W #$0003                  ;$01A4EE	|
	BCC CODE_81A51C               ;$01A4F1	|
	BEQ CODE_81A500               ;$01A4F3	|
	CMP.W #$0004                  ;$01A4F5	|
	BEQ CODE_01A50E               ;$01A4F8	|
	CMP.W #$0005                  ;$01A4FA	|
	BEQ CODE_81A51C               ;$01A4FD	|

CODE_81A4FF:
	RTS                           ;$01A4FF	|

CODE_81A500:
	LDA.W $334A                   ;$01A500	|
	STA.W $3350                   ;$01A503	|
	LDA.W $334C                   ;$01A506	|
	STA.W $3354                   ;$01A509	|
	BRA CODE_81A51C               ;$01A50C	|

CODE_01A50E:
	LDA.W CameraX_TileMirror      ;$01A50E	|
	STA.W $3350                   ;$01A511	|
	LDA.W CameraY_TileMirror      ;$01A514	|
	STA.W $3354                   ;$01A517	|
	BRA CODE_81A530               ;$01A51A	|

CODE_81A51C:
	LDA.W $332E                   ;$01A51C	|
	AND.W #$0001                  ;$01A51F	|
	BEQ CODE_81A530               ;$01A522	|
	LDA.W $3350                   ;$01A524	|
	STA.W CameraX_TileMirror      ;$01A527	|
	LDA.W $3354                   ;$01A52A	|
	STA.W CameraY_TileMirror      ;$01A52D	|

CODE_81A530:
	LDA.W $332E                   ;$01A530	|
	AND.W #$0002                  ;$01A533	|
	BEQ CODE_81A55E               ;$01A536	|
	LDA.W $3322                   ;$01A538	|
	LDY.W $3350                   ;$01A53B	|
	JSR.W CODE_FN_01A55F          ;$01A53E	|
	BCS CODE_81A549               ;$01A541	|
	ADC.W $3326                   ;$01A543	|
	STA.W $3039                   ;$01A546	|

CODE_81A549:
	LDA.W $3322                   ;$01A549	|
	LSR A                         ;$01A54C	|
	LSR A                         ;$01A54D	|
	LSR A                         ;$01A54E	|
	LSR A                         ;$01A54F	|
	LDY.W $3354                   ;$01A550	|
	JSR.W CODE_FN_01A55F          ;$01A553	|
	BCS CODE_81A55E               ;$01A556	|
	ADC.W $3328                   ;$01A558	|
	STA.W $303F                   ;$01A55B	|

CODE_81A55E:
	RTS                           ;$01A55E	|

CODE_FN_01A55F:
	AND.W #$000F                  ;$01A55F	|
	ASL A                         ;$01A562	|
	TAX                           ;$01A563	|
	TYA                           ;$01A564	|
    JMP.W (PTR16_01A568,X)        ;$01A565 |
PTR16_01A568:
    dw CODE_01A58A                ;$01A568 |
    dw CODE_01A58F                ;$01A56A |
    dw CODE_01A594                ;$01A56C |
    dw CODE_01A598                ;$01A56E |
    dw CODE_01A59B                ;$01A570 |
    dw CODE_01A5A4                ;$01A572 |
    dw CODE_01A5A6                ;$01A574 |
    dw CODE_01A5AE                ;$01A576 |
    dw CODE_01A5B1                ;$01A578 |
    dw CODE_01A588                ;$01A57A |
    dw CODE_01A58A                ;$01A57C |
    dw CODE_01A58A                ;$01A57E |
    dw CODE_01A58A                ;$01A580 |
    dw CODE_01A58A                ;$01A582 |
    dw CODE_01A58A                ;$01A584 |
    dw CODE_01A58A                ;$01A586 |

CODE_01A588:
    SEC                           ;$01A588 |
    RTS                           ;$01A589 |

CODE_01A58A:
    LDA.W #$0008                  ;$01A58A |
    CLC                           ;$01A58D |
    RTS                           ;$01A58E |

CODE_01A58F:
    LSR A                         ;$01A58F |
    LSR A                         ;$01A590 |
    LSR A                         ;$01A591 |
    CLC                           ;$01A592 |
    RTS                           ;$01A593 |

CODE_01A594:
    LSR A                         ;$01A594 |
    LSR A                         ;$01A595 |
    CLC                           ;$01A596 |
    RTS                           ;$01A597 |

CODE_01A598:
    LSR A                         ;$01A598 |
    CLC                           ;$01A599 |
    RTS                           ;$01A59A |

CODE_01A59B:
    LSR A                         ;$01A59B |
    STA.B $00                     ;$01A59C |
    LSR A                         ;$01A59E |
    CLC                           ;$01A59F |
    ADC.B $00                     ;$01A5A0 |
    CLC                           ;$01A5A2 |
    RTS                           ;$01A5A3 |

CODE_01A5A4:
    CLC                           ;$01A5A4 |
    RTS                           ;$01A5A5 |

CODE_01A5A6:
    STA.B $00                     ;$01A5A6 |
    LSR A                         ;$01A5A8 |
    CLC                           ;$01A5A9 |
    ADC.B $00                     ;$01A5AA |
    CLC                           ;$01A5AC |
    RTS                           ;$01A5AD |

CODE_01A5AE:
    ASL A                         ;$01A5AE |
    CLC                           ;$01A5AF |
    RTS                           ;$01A5B0 |

CODE_01A5B1:
    STA.B $00                     ;$01A5B1 |
    ASL A                         ;$01A5B3 |
    CLC                           ;$01A5B4 |
    ADC.B $00                     ;$01A5B5 |
    CLC                           ;$01A5B7 |
    RTS                           ;$01A5B8 |

CODE_FN_01A5B9:
	LDX.W #$002E                  ;$01A5B9	|

CODE_81A5BC:
	JSL.L DestroyObject_L         ;$01A5BC	|
	DEX                           ;$01A5C0	|
	DEX                           ;$01A5C1	|
	BPL CODE_81A5BC               ;$01A5C2	|
	RTS                           ;$01A5C4	|

CODE_FL_01A5C5:
	PHY                           ;$01A5C5	|
	JSL.L CODE_FL_01A600          ;$01A5C6	|
	PLY                           ;$01A5CA	|
	LDA.W $3370                   ;$01A5CB	|
	SEC                           ;$01A5CE	|
	SBC.W $78E6,Y                 ;$01A5CF	|
	BMI CODE_81A5D9               ;$01A5D2	|
	CMP.W #$0008                  ;$01A5D4	|
	BCS CODE_81A5DC               ;$01A5D7	|

CODE_81A5D9:
	LDA.W #$0008                  ;$01A5D9	|

CODE_81A5DC:
	STA.W $3370                   ;$01A5DC	|
	CLC                           ;$01A5DF	|
	ADC.W #$000C                  ;$01A5E0	|
	STA.W Room_Bound_Offset_X                   ;$01A5E3	|
	LDA.W $3372                   ;$01A5E6	|
	CLC                           ;$01A5E9	|
	ADC.W $790E,Y                 ;$01A5EA	|
	CMP.W $336A                   ;$01A5ED	|
	BCC CODE_81A5F5               ;$01A5F0	|
	LDA.W $336A                   ;$01A5F2	|

CODE_81A5F5:
	STA.W $3372                   ;$01A5F5	|
	CLC                           ;$01A5F8	|
	ADC.W #$00F4                  ;$01A5F9	|
	STA.W Room_Size_X                   ;$01A5FC	|
	RTL                           ;$01A5FF	|

CODE_FL_01A600:
	JSL.L CODE_FL_01A630          ;$01A600	|

CODE_FL_01A604:
	LDA.W $334A                   ;$01A604	|
	BMI CODE_81A60E               ;$01A607	|
	CMP.W #$0008                  ;$01A609	|
	BCS CODE_81A611               ;$01A60C	|

CODE_81A60E:
	LDA.W #$0008                  ;$01A60E	|

CODE_81A611:
	CMP.W $336A                   ;$01A611	|
	BCC CODE_81A619               ;$01A614	|
	LDA.W $336A                   ;$01A616	|

CODE_81A619:
	STA.W $334A                   ;$01A619	|
	STA.W $3370                   ;$01A61C	|
	STA.W $3372                   ;$01A61F	|
	CLC                           ;$01A622	|
	ADC.W #$000C                  ;$01A623	|
	STA.W Room_Bound_Offset_X                   ;$01A626	|
	ADC.W #$00E8                  ;$01A629	|
	STA.W Room_Size_X                   ;$01A62C	|
	RTL                           ;$01A62F	|

CODE_FL_01A630:
	LDA.W $334C                   ;$01A630	|
	BMI CODE_81A63A               ;$01A633	|
	CMP.W #$0008                  ;$01A635	|
	BCS CODE_81A63D               ;$01A638	|

CODE_81A63A:
	LDA.W #$0008                  ;$01A63A	|

CODE_81A63D:
	CMP.W $3368                   ;$01A63D	|
	BCC CODE_81A645               ;$01A640	|
	LDA.W $3368                   ;$01A642	|

CODE_81A645:
	STA.W $334C                   ;$01A645	|
	STA.W $336C                   ;$01A648	|
	STA.W $336E                   ;$01A64B	|
	CLC                           ;$01A64E	|
	ADC.W #$000C                  ;$01A64F	|
	STA.W Room_Bound_Offset_Y                   ;$01A652	|
	LDA.W $336E                   ;$01A655	|
	CLC                           ;$01A658	|
	ADC.W #$00B0                  ;$01A659	|
	STA.W Room_Size_Y                   ;$01A65C	|
	RTL                           ;$01A65F	|

CODE_FL_01A660:
	JSR.W CODE_FN_01A66F          ;$01A660	|
	LDA.W $73A8                   ;$01A663	|
	BNE CODE_81A66E               ;$01A666	|
	LDA.W #$0001                  ;$01A668	|
	STA.W $3330                   ;$01A66B	|

CODE_81A66E:
	RTL                           ;$01A66E	|

CODE_FN_01A66F:
	LDA.W #$0008                  ;$01A66F	|
	STA.W $3370                   ;$01A672	|
	LDA.W #$0008                  ;$01A675	|
	STA.W $336C                   ;$01A678	|
	LDA.W $3368                   ;$01A67B	|
	STA.W $336E                   ;$01A67E	|
	CLC                           ;$01A681	|
	ADC.W #$00B0                  ;$01A682	|
	STA.W Room_Size_Y                   ;$01A685	|
	LDA.W $336A                   ;$01A688	|
	STA.W $3372                   ;$01A68B	|
	ADC.W #$00F4                  ;$01A68E	|
	STA.W Room_Size_X                   ;$01A691	|
	LDA.W #$0014                  ;$01A694	|
	STA.W Room_Bound_Offset_X                   ;$01A697	|
	LDA.W #$0014                  ;$01A69A	|
	STA.W Room_Bound_Offset_Y                   ;$01A69D	|
	RTS                           ;$01A6A0	|

CODE_FL_01A6A1:
	STX.B $2A                     ;$01A6A1	|
	STY.B $2C                     ;$01A6A3	|
	CMP.W #$0004                  ;$01A6A5	|

CODE_01A6A8:
	BCS CODE_01A6A8               ;$01A6A8	|
	ASL A                         ;$01A6AA	|
	TAX                           ;$01A6AB	|
	JMP.W (CODE_01A6AF,X)         ;$01A6AC	|

CODE_01A6AF:
	DEC.W CODE_00B7A6             ;$01A6AF	|
	LDX.B $E3                     ;$01A6B2	|
	LDX.B $FA                     ;$01A6B4	|
	LDX.B $A5                     ;$01A6B6	|
	BIT.W $0530                   ;$01A6B8	|
	CMP.W #$0008                  ;$01A6BB	|
	BCS CODE_01A6C3               ;$01A6BE	|
	LDA.W #$0008                  ;$01A6C0	|

CODE_01A6C3:
	STA.W $336C                   ;$01A6C3	|
	CLC                           ;$01A6C6	|
	ADC.W #$000C                  ;$01A6C7	|
	STA.W Room_Bound_Offset_Y                   ;$01A6CA	|
	RTL                           ;$01A6CD	|
	LDA.B $2C                     ;$01A6CE	|
	CMP.W $3368                   ;$01A6D0	|
	BCC CODE_01A6D8               ;$01A6D3	|
	LDA.W $3368                   ;$01A6D5	|

CODE_01A6D8:
	STA.W $336E                   ;$01A6D8	|
	CLC                           ;$01A6DB	|
	ADC.W #$00BC                  ;$01A6DC	|
	STA.W Room_Size_Y                   ;$01A6DF	|
	RTL                           ;$01A6E2	|
	LDA.B $2A                     ;$01A6E3	|
	BMI CODE_01A6EC               ;$01A6E5	|
	CMP.W #$0008                  ;$01A6E7	|
	BCS CODE_01A6EF               ;$01A6EA	|

CODE_01A6EC:
	LDA.W #$0008                  ;$01A6EC	|

CODE_01A6EF:
	STA.W $3370                   ;$01A6EF	|
	CLC                           ;$01A6F2	|
	ADC.W #$000C                  ;$01A6F3	|
	STA.W Room_Bound_Offset_X                   ;$01A6F6	|
	RTL                           ;$01A6F9	|
	LDA.B $2A                     ;$01A6FA	|
	CMP.W $336A                   ;$01A6FC	|
	BCC CODE_01A704               ;$01A6FF	|
	LDA.W $336A                   ;$01A701	|

CODE_01A704:
	STA.W $3372                   ;$01A704	|
	CLC                           ;$01A707	|
	ADC.W #$00F4                  ;$01A708	|
	STA.W Room_Size_X                   ;$01A70B	|
	RTL                           ;$01A70E	|

CODE_FL_01A70F:
	LDA.W #$0008                  ;$01A70F	|
	STA.W $3370                   ;$01A712	|
	LDA.W $336A                   ;$01A715	|
	STA.W $3372                   ;$01A718	|
	CLC                           ;$01A71B	|
	ADC.W #$00F4                  ;$01A71C	|
	STA.W Room_Size_X                   ;$01A71F	|
	LDA.W #$0014                  ;$01A722	|
	STA.W Room_Bound_Offset_X                   ;$01A725	|
	RTL                           ;$01A728	|

CODE_FL_01A729:
	LDA.W #$0008                  ;$01A729	|
	STA.W $336C                   ;$01A72C	|
	LDA.W $3368                   ;$01A72F	|
	STA.W $336E                   ;$01A732	|
	CLC                           ;$01A735	|
	ADC.W #$00B0                  ;$01A736	|
	STA.W Room_Size_Y                   ;$01A739	|
	LDA.W #$0014                  ;$01A73C	|
	STA.W Room_Bound_Offset_Y                   ;$01A73F	|
	RTL                           ;$01A742	|

CODE_FN_01A743:
	LDX.W #$0008                  ;$01A743	|
	LDA.W #$0100                  ;$01A746	|
	JSR.W CODE_FN_01A752          ;$01A749	|
	LDX.W #$0160                  ;$01A74C	|
	LDA.W #$0200                  ;$01A74F	|

CODE_FN_01A752:
	STA.B $28                     ;$01A752	|

CODE_81A754:
	LDA.W $0500,X                 ;$01A754	|
	STA.B $00                     ;$01A757	|
	LDA.W $0700,X                 ;$01A759	|
	STA.B $02                     ;$01A75C	|
	PHX                           ;$01A75E	|
	LDA.W #$A795                  ;$01A75F	|
	LDX.W #$0001                  ;$01A762	|
	JSL.L SNES_ExecuteSA1               ;$01A765	|
	PLX                           ;$01A769	|
	LDA.B $04                     ;$01A76A	|
	STA.L $7F7870,X               ;$01A76C	|
	LDA.B $06                     ;$01A770	|
	STA.L $7F7A70,X               ;$01A772	|
	LDA.B $08                     ;$01A776	|
	STA.L $7F7C70,X               ;$01A778	|
	LDA.B $0A                     ;$01A77C	|
	STA.L $7F7E70,X               ;$01A77E	|
	LDA.B $0C                     ;$01A782	|
	STA.L $7F8070,X               ;$01A784	|
	LDA.B $0E                     ;$01A788	|
	STA.L $7F8270,X               ;$01A78A	|
	INX                           ;$01A78E	|
	INX                           ;$01A78F	|
	CPX.B $28                     ;$01A790	|
	BCC CODE_81A754               ;$01A792	|
	RTS                           ;$01A794	|
	STZ.W $2250                   ;$01A795	|
	LDX.W #$000A                  ;$01A798	|

CODE_81A79B:
	LDA.L DATA16_01A808,X          ;$01A79B	|
	STA.W $2251                   ;$01A79F	|
	LDA.B $00                     ;$01A7A2	|
	AND.W #$7C00                  ;$01A7A4	|
	STA.W $2253                   ;$01A7A7	|
	LDA.B $00                     ;$01A7AA	|
	LDY.W $2307                   ;$01A7AC	|
	PHY                           ;$01A7AF	|
	AND.W #$03E0                  ;$01A7B0	|
	STA.W $2253                   ;$01A7B3	|
	LDA.B $00                     ;$01A7B6	|
	LDY.W $2307                   ;$01A7B8	|
	PHY                           ;$01A7BB	|
	AND.W #$001F                  ;$01A7BC	|
	STA.W $2253                   ;$01A7BF	|
	LDA.L DATA16_01A818,X          ;$01A7C2	|
	LDY.W $2307                   ;$01A7C6	|
	STA.W $2251                   ;$01A7C9	|
	LDA.B $02                     ;$01A7CC	|
	AND.W #$001F                  ;$01A7CE	|
	STA.W $2253                   ;$01A7D1	|
	TYA                           ;$01A7D4	|
	CLC                           ;$01A7D5	|
	ADC.W $2307                   ;$01A7D6	|
	STA.B $04,X                   ;$01A7D9	|
	LDA.B $02                     ;$01A7DB	|
	AND.W #$03E0                  ;$01A7DD	|
	STA.W $2253                   ;$01A7E0	|
	PLA                           ;$01A7E3	|
	ADC.W $2307                   ;$01A7E4	|
	AND.W #$03E0                  ;$01A7E7	|
	ORA.B $04,X                   ;$01A7EA	|
	STA.B $04,X                   ;$01A7EC	|
	LDA.B $02                     ;$01A7EE	|
	AND.W #$7C00                  ;$01A7F0	|
	STA.W $2253                   ;$01A7F3	|
	PLA                           ;$01A7F6	|
	ADC.W $2307                   ;$01A7F7	|
	AND.W #$7C00                  ;$01A7FA	|
	ORA.B $04,X                   ;$01A7FD	|
	STA.B $04,X                   ;$01A7FF	|
	DEX                           ;$01A801	|
	DEX                           ;$01A802	|
	BPL CODE_81A79B               ;$01A803	|
	RTL                           ;$01A805	|

	dw $0000                      ;$01A806	|

DATA16_01A808:
    dw $0024,$0049,$006E,$0092    ;$01A808 |
    dw $00B7,$00DC,$0100,$0100    ;$01A810 |

DATA16_01A818:
    dw $00DC,$00B7,$0092,$006E    ;$01A818 |
    dw $0049,$0024,$0000          ;$01A820 |

DATA16_01A826:
	ORA.W #$8000				  ;$01A826 |
    BRA CODE_FL_01A841            ;$01A829 |
    STA.B $49                     ;$01A82B |
    AND.W #$000F                  ;$01A82D |
    TAY                           ;$01A830 |
    LDA.B $49                     ;$01A831 |
    AND.W #$00F0                  ;$01A833 |
    LSR A                         ;$01A836 |
    LSR A                         ;$01A837 |
    LSR A                         ;$01A838 |
    LSR A                         ;$01A839 |
    TAX                           ;$01A83A |
    LDA.B $49                     ;$01A83B |
    AND.W #$FF00                  ;$01A83D |
    XBA                           ;$01A840 |

CODE_FL_01A841:
	STA.B $49                     ;$01A841	|
	STX.B $4B                     ;$01A843	|
	STY.B $4D                     ;$01A845	|
	STZ.B $14                     ;$01A847	|
	LDA.W #$00FF                  ;$01A849	|
	STA.B $16                     ;$01A84C	|
	LDA.W #$A858                  ;$01A84E	|
	LDX.W #$0001                  ;$01A851	|
	JML.L SA1_ExecuteSNES         ;$01A854	|
	LDA.B $49                     ;$01A858	|
	PHA                           ;$01A85A	|
	AND.W #$8000                  ;$01A85B	|
	STA.W $3322                   ;$01A85E	|
	PLA                           ;$01A861	|
	AND.W #$7FFF                  ;$01A862	|
	ASL A                         ;$01A865	|
	CLC                           ;$01A866	|
	ADC.W #$000C                  ;$01A867	|
	TAY                           ;$01A86A	|
	LDA.B $4B                     ;$01A86B	|
	ASL A                         ;$01A86D	|
	CLC                           ;$01A86E	|
	ADC.B [$14],Y                 ;$01A86F	|
	TAY                           ;$01A871	|
	LDA.B $4D                     ;$01A872	|
	ASL A                         ;$01A874	|
	ASL A                         ;$01A875	|
	CLC                           ;$01A876	|
	ADC.B [$14],Y                 ;$01A877	|
	TAY                           ;$01A879	|
	LDA.B [$14],Y                 ;$01A87A	|
	STA.W $32F6                   ;$01A87C	|
	STA.B $18                     ;$01A87F	|
	INY                           ;$01A881	|
	INY                           ;$01A882	|
	LDA.B [$14],Y                 ;$01A883	|
	STA.W $32F8                   ;$01A885	|
	STA.B $1A                     ;$01A888	|
	LDY.W #$0005                  ;$01A88A	|
	LDA.B [$18],Y                 ;$01A88D	|
	AND.W #$00FF                  ;$01A88F	|
	STA.W $3320                   ;$01A892	|
	LDY.W #$0004                  ;$01A895	|
	LDA.B [$18],Y                 ;$01A898	|
	AND.W #$00FF                  ;$01A89A	|
	STA.W $331E                   ;$01A89D	|
	ASL A                         ;$01A8A0	|
	TAX                           ;$01A8A1	|
	LDA.L DATA8_01A98E,X          ;$01A8A2	|
	AND.W #$0007                  ;$01A8A6	|
	STA.W $332E                   ;$01A8A9	|
	LDA.W $332E                   ;$01A8AC	|
	AND.W #$0001                  ;$01A8AF	|
	BEQ CODE_81A8E8               ;$01A8B2	|
	LDA.W #$0018                  ;$01A8B4	|
	JSL.L CODE_FL_018101          ;$01A8B7	|
	LDA.B [$14]                   ;$01A8BB	|
	AND.W #$00FF                  ;$01A8BD	|
	BEQ CODE_81A8E8               ;$01A8C0	|
	JSL.L CODE_FL_0180DB          ;$01A8C2	|
	PEA.W $007E                   ;$01A8C6	|
	PLB                           ;$01A8C9	|
	LDY.W #$2000                  ;$01A8CA	|
	JSL.L DecompressData          ;$01A8CD	|
	PLB                           ;$01A8D1	|
	LDA.W $3322                   ;$01A8D2	|
	BNE CODE_81A8E8               ;$01A8D5	|
	LDA.W $3320                   ;$01A8D7	|
	ASL A                         ;$01A8DA	|
	ASL A                         ;$01A8DB	|
	TAX                           ;$01A8DC	|
	LDA.L PTR16_018482,X          ;$01A8DD	|
	LDX.W #$0001                  ;$01A8E1	|
	JSL.L LoadDMATable          ;$01A8E4	|

CODE_81A8E8:
	LDA.W $332E                   ;$01A8E8	|
	AND.W #$0002                  ;$01A8EB	|
	BEQ CODE_81A938               ;$01A8EE	|
	LDA.W #$001D                  ;$01A8F0	|
	JSL.L CODE_FL_018101          ;$01A8F3	|
	LDA.B [$14]                   ;$01A8F7	|
	AND.W #$00FF                  ;$01A8F9	|
	BEQ CODE_81A938               ;$01A8FC	|
	LDX.W $3322                   ;$01A8FE	|
	BEQ CODE_81A915               ;$01A901	|
	JSL.L CODE_FL_0180DB          ;$01A903	|
	PEA.W $007E                   ;$01A907	|
	PLB                           ;$01A90A	|
	LDY.W #$7000                  ;$01A90B	|
	JSL.L DecompressData          ;$01A90E	|
	PLB                           ;$01A912	|
	BRA CODE_81A938               ;$01A913	|

CODE_81A915:
	JSL.L CODE_FL_0180DB          ;$01A915	|
	PEA.W $007E                   ;$01A919	|
	PLB                           ;$01A91C	|
	LDY.W #$2000                  ;$01A91D	|
	JSL.L DecompressData          ;$01A920	|
	PLB                           ;$01A924	|
	LDA.W $3320                   ;$01A925	|
	ASL A                         ;$01A928	|
	ASL A                         ;$01A929	|
	INC A                         ;$01A92A	|
	INC A                         ;$01A92B	|
	TAX                           ;$01A92C	|
	LDA.L PTR16_018482,X          ;$01A92D	|
	LDX.W #$0001                  ;$01A931	|
	JSL.L LoadDMATable          ;$01A934	|

CODE_81A938:
	LDA.W $3322                   ;$01A938	|
	BEQ CODE_81A93E               ;$01A93B	|
	RTL                           ;$01A93D	|

CODE_81A93E:
	LDA.W $332E                   ;$01A93E	|
	AND.W #$0001                  ;$01A941	|
	BEQ CODE_81A965               ;$01A944	|
	LDA.W #$0019                  ;$01A946	|
	JSL.L CODE_FL_018101          ;$01A949	|
	LDA.B [$14]                   ;$01A94D	|
	AND.W #$00FF                  ;$01A94F	|
	BEQ CODE_81A965               ;$01A952	|
	JSL.L CODE_FL_0180DB          ;$01A954	|
	LDA.B [$18]                   ;$01A958	|
	TAY                           ;$01A95A	|
	LDA.B $18                     ;$01A95B	|
	INC A                         ;$01A95D	|
	INC A                         ;$01A95E	|
	LDX.B $1A                     ;$01A95F	|
	JSL.L WritePal          ;$01A961	|

CODE_81A965:
	LDA.W $332E                   ;$01A965	|
	AND.W #$0002                  ;$01A968	|
	BEQ CODE_81A98C               ;$01A96B	|
	LDA.W #$001E                  ;$01A96D	|
	JSL.L CODE_FL_018101          ;$01A970	|
	LDA.B [$14]                   ;$01A974	|
	AND.W #$00FF                  ;$01A976	|
	BEQ CODE_81A98C               ;$01A979	|
	JSL.L CODE_FL_0180DB          ;$01A97B	|
	LDA.B [$18]                   ;$01A97F	|
	TAY                           ;$01A981	|
	LDA.B $18                     ;$01A982	|
	INC A                         ;$01A984	|
	INC A                         ;$01A985	|
	LDX.B $1A                     ;$01A986	|
	JSL.L WritePal          ;$01A988	|

CODE_81A98C:
	RTL                           ;$01A98C	|

DATA8_01A98D:
	db $09                        ;$01A98D	|

DATA8_01A98E:
	db $11,$09,$13,$09,$17,$09,$12;$01A98E	|

CODE_FL_01A995:
	BIT.W $0000                   ;$01A995	|
	BPL CODE_81A99F               ;$01A998	|
	LDA.W $3330                   ;$01A99A	|
	BNE CODE_81A9A0               ;$01A99D	|

CODE_81A99F:
	RTL                           ;$01A99F	|

CODE_81A9A0:
	LDA.W $770F                   ;$01A9A0	|
	BNE CODE_81A9A6               ;$01A9A3	|
	RTL                           ;$01A9A5	|

CODE_81A9A6:
	LDY.W #$0000                  ;$01A9A6	|

CODE_01A9A9:
	STY.B $4D                     ;$01A9A9	|
	LDA.W #$B9C0                  ;$01A9AB	|
	LDX.W #$0001                  ;$01A9AE	|
	JSL.L SA1_ExecuteSNES              ;$01A9B1	|
	LDX.B $00                     ;$01A9B5	|
	BMI CODE_81A9E8               ;$01A9B7	|
	BEQ CODE_01A9BE               ;$01A9B9	|
	LDX.W #$0002                  ;$01A9BB	|

CODE_01A9BE:
	LDA.B $02                     ;$01A9BE	|
	SEC                           ;$01A9C0	|
	SBC.W $735E                   ;$01A9C1	|
	STA.W $302F                   ;$01A9C4	|
	LDA.B $04                     ;$01A9C7	|
	SEC                           ;$01A9C9	|
	SBC.W #$0006                  ;$01A9CA	|
	SBC.W $7360                   ;$01A9CD	|
	STA.W $3031                   ;$01A9D0	|
	LDA.L DATA8_01C13B,X          ;$01A9D3	|
	TAY                           ;$01A9D7	|
	LDA.W #$0001                  ;$01A9D8	|
	JSL.L CODE_FL_00AD79          ;$01A9DB	|
	LDY.B $4D                     ;$01A9DF	|
	INY                           ;$01A9E1	|
	INY                           ;$01A9E2	|
	CPY.W #$0020                  ;$01A9E3	|
	BCC CODE_01A9A9               ;$01A9E6	|

CODE_81A9E8:
	LDY.W #$0000                  ;$01A9E8	|

CODE_JP_01A9EB:
	STY.B $4D                     ;$01A9EB	|
	LDA.W $73B9,Y                 ;$01A9ED	|
	BPL CODE_81A9F5               ;$01A9F0	|
	JMP.W CODE_JP_01AA9B          ;$01A9F2	|

CODE_81A9F5:
	LDA.W CameraLock                   ;$01A9F5	|
	BNE CODE_01AA36               ;$01A9F8	|
	LDA.W $73E9,Y                 ;$01A9FA	|
	LDX.W #$0000                  ;$01A9FD	|
	SEC                           ;$01AA00	|

CODE_01AA01:
	SBC.W #$0010                  ;$01AA01	|
	BCC CODE_01AA09               ;$01AA04	|
	INX                           ;$01AA06	|
	BRA CODE_01AA01               ;$01AA07	|

CODE_01AA09:
	ADC.W #$0010                  ;$01AA09	|
	ASL A                         ;$01AA0C	|
	TAY                           ;$01AA0D	|
	LDA.W $774F,X                 ;$01AA0E	|
	AND.W All_Bits16_BE,Y         ;$01AA11	|
	STA.B $00                     ;$01AA14	|
	BNE CODE_01AA28               ;$01AA16	|
	LDY.B $4D                     ;$01AA18	|
	LDA.W $73DD,Y                 ;$01AA1A	|
	CMP.W $73B9,Y                 ;$01AA1D	|
	BCS CODE_01AA36               ;$01AA20	|
	INC A                         ;$01AA22	|
	STA.W $73DD,Y                 ;$01AA23	|
	BRA CODE_01AA36               ;$01AA26	|

CODE_01AA28:
	LDY.B $4D                     ;$01AA28	|
	LDA.W $73DD,Y                 ;$01AA2A	|
	CMP.W #$0006                  ;$01AA2D	|
	BCC CODE_01AA36               ;$01AA30	|
	DEC A                         ;$01AA32	|
	STA.W $73DD,Y                 ;$01AA33	|

CODE_01AA36:
	LDY.B $4D                     ;$01AA36	|
	LDA.W $73C5,Y                 ;$01AA38	|
	SEC                           ;$01AA3B	|
	SBC.W $735E                   ;$01AA3C	|
	STA.W $302F                   ;$01AA3F	|
	LDA.W $73D1,Y                 ;$01AA42	|
	SEC                           ;$01AA45	|
	SBC.W $7360                   ;$01AA46	|
	STA.B $04                     ;$01AA49	|
	LDA.W $73DD,Y                 ;$01AA4B	|
	STA.B $02                     ;$01AA4E	|
	LDA.B $02                     ;$01AA50	|

CODE_01AA52:
	STA.B $02                     ;$01AA52	|
	CLC                           ;$01AA54	|
	ADC.B $04                     ;$01AA55	|
	STA.W $3031                   ;$01AA57	|
	LDA.B $02                     ;$01AA5A	|
	CMP.W #$0018                  ;$01AA5C	|
	BCC CODE_01AA64               ;$01AA5F	|
	LDA.W #$0017                  ;$01AA61	|

CODE_01AA64:
	LSR A                         ;$01AA64	|
	LSR A                         ;$01AA65	|
	AND.W #$0006                  ;$01AA66	|
	TAX                           ;$01AA69	|
	LDA.L DATA8_01C13F,X          ;$01AA6A	|
	TAY                           ;$01AA6E	|
	LDA.W #$0001                  ;$01AA6F	|
	JSL.L CODE_FL_00AD79          ;$01AA72	|
	LDA.B $02                     ;$01AA76	|
	SEC                           ;$01AA78	|
	SBC.W #$0018                  ;$01AA79	|
	BEQ CODE_01AA80               ;$01AA7C	|
	BCS CODE_01AA52               ;$01AA7E	|

CODE_01AA80:
	LDA.B $04                     ;$01AA80	|
	STA.W $3031                   ;$01AA82	|
	LDY.W #$DB29                  ;$01AA85	|
	LDA.W #$0001                  ;$01AA88	|
	JSL.L CODE_FL_00AD79          ;$01AA8B	|
	LDY.B $4D                     ;$01AA8F	|
	INY                           ;$01AA91	|
	INY                           ;$01AA92	|
	CPY.W #$000C                  ;$01AA93	|
	BCS CODE_JP_01AA9B            ;$01AA96	|
	JMP.W CODE_JP_01A9EB          ;$01AA98	|

CODE_JP_01AA9B:
	LDA.W #$BA14                  ;$01AA9B	|
	LDX.W #$0001                  ;$01AA9E	|
	JSL.L SA1_ExecuteSNES         ;$01AAA1	|
	LDY.B $00                     ;$01AAA5	|
	BMI CODE_81AAED               ;$01AAA7	|
	STZ.B $08                     ;$01AAA9	|
	LDX.B $06                     ;$01AAAB	|
	LDA.L DATA8_01C154,X          ;$01AAAD	|
	AND.W #$00FF                  ;$01AAB1	|
	TAX                           ;$01AAB4	|
	LDA.L DATA8_01C145,X          ;$01AAB5	|
	STA.B $06                     ;$01AAB9	|
	STZ.B $4D                     ;$01AABB	|
	TYX                           ;$01AABD	|
	BRA CODE_01AAF0               ;$01AABE	|

CODE_01AAC0:
	STY.B $4D                     ;$01AAC0	|
	LDA.W #$BA45                  ;$01AAC2	|
	LDX.W #$0001                  ;$01AAC5	|
	JSL.L SA1_ExecuteSNES         ;$01AAC8	|
	LDX.B $00                     ;$01AACC	|
	BMI CODE_01AADB               ;$01AACE	|
	BRA CODE_01AAF0               ;$01AAD0	|

CODE_JP_01AAD2:
	LDY.B $4D                     ;$01AAD2	|
	INY                           ;$01AAD4	|
	INY                           ;$01AAD5	|
	CPY.W #$0020                  ;$01AAD6	|
	BCC CODE_01AAC0               ;$01AAD9	|

CODE_01AADB:
	LDA.W $331C                   ;$01AADB	|
	BEQ CODE_81AAED               ;$01AADE	|
	LDA.B $08                     ;$01AAE0	|
	CMP.W #$0007                  ;$01AAE2	|
	BCC CODE_01AAEA               ;$01AAE5	|
	LDA.W #$0007                  ;$01AAE7	|

CODE_01AAEA:
	STA.W $32DC                   ;$01AAEA	|

CODE_81AAED:
	JMP.W CODE_JP_01AB6D          ;$01AAED	|

CODE_01AAF0:
	LDY.B $06                     ;$01AAF0	|
	CPX.W #$0100                  ;$01AAF2	|
	BCS CODE_01AAFA               ;$01AAF5	|
	LDY.W #$DC69                  ;$01AAF7	|

CODE_01AAFA:
	LDA.B $02                     ;$01AAFA	|
	SEC                           ;$01AAFC	|
	SBC.W $735E                   ;$01AAFD	|
	STA.W $302F                   ;$01AB00	|
	LDA.B $04                     ;$01AB03	|
	SEC                           ;$01AB05	|
	SBC.W $7360                   ;$01AB06	|
	STA.W $3031                   ;$01AB09	|
	LDA.W #$0001                  ;$01AB0C	|
	JSL.L CODE_FL_00AD79          ;$01AB0F	|
	LDA.B $00                     ;$01AB13	|
	XBA                           ;$01AB15	|
	AND.W #$00FF                  ;$01AB16	|
	BEQ CODE_01AB52               ;$01AB19	|
	STA.B $00                     ;$01AB1B	|
	INC.W $3031                   ;$01AB1D	|
	LDX.W #$0006                  ;$01AB20	|

CODE_01AB23:
	LDA.W $302F                   ;$01AB23	|
	CMP.L DATA16_01AB55,X          ;$01AB26	|
	BCS CODE_01AB32               ;$01AB2A	|
	CMP.L DATA16_01AB5D,X          ;$01AB2C	|
	BCS CODE_01AB41               ;$01AB30	|

CODE_01AB32:
	LDA.W $3031                   ;$01AB32	|
	CMP.L DATA16_01AB55,X          ;$01AB35	|
	BCS CODE_01AB4B               ;$01AB39	|
	CMP.L DATA16_01AB65,X          ;$01AB3B	|
	BCC CODE_01AB4B               ;$01AB3F	|

CODE_01AB41:
	DEC.B $00                     ;$01AB41	|
	BEQ CODE_01AB52               ;$01AB43	|
	DEX                           ;$01AB45	|
	DEX                           ;$01AB46	|
	BPL CODE_01AB23               ;$01AB47	|
	BRA CODE_01AB52               ;$01AB49	|

CODE_01AB4B:
	LDA.B $00                     ;$01AB4B	|
	CLC                           ;$01AB4D	|
	ADC.B $08                     ;$01AB4E	|
	STA.B $08                     ;$01AB50	|

CODE_01AB52:
	JMP.W CODE_JP_01AAD2          ;$01AB52	|

DATA16_01AB55:
    dw $FFA8,$FFC0,$FFD8,$FFF0    ;$01AB55 |

DATA16_01AB5D:
    dw $0158,$0140,$0128,$0110    ;$01AB5D |

DATA16_01AB65:
    dw $0108,$00F0,$00D8,$00C0    ;$01AB65 |

CODE_JP_01AB6D:
	LDA.W CameraLock                   ;$01AB6D	|
	BEQ CODE_81AB75               ;$01AB70	|
	JMP.W CODE_81AC01             ;$01AB72	|

CODE_81AB75:
	LDY.W #$0000                  ;$01AB75	|

CODE_JP_01AB78:
	STY.B $4D                     ;$01AB78	|
	LDA.W #$BA7E                  ;$01AB7A	|
	LDX.W #$0001                  ;$01AB7D	|
	JSL.L SA1_ExecuteSNES              ;$01AB80	|
	LDA.B $00                     ;$01AB84	|
	BMI CODE_81AC01               ;$01AB86	|
	BNE CODE_01ABF5               ;$01AB88	|
	LDA.W CameraX_TileMirror                   ;$01AB8A	|
	SBC.W #$0080                  ;$01AB8D	|
	BCC CODE_01AB96               ;$01AB90	|
	CMP.B $04                     ;$01AB92	|
	BCS CODE_01ABF5               ;$01AB94	|

CODE_01AB96:
	LDA.W CameraX_TileMirror                   ;$01AB96	|
	ADC.W #$0180                  ;$01AB99	|
	CMP.B $04                     ;$01AB9C	|
	BCC CODE_01ABF5               ;$01AB9E	|
	LDA.W CameraY_TileMirror                   ;$01ABA0	|
	SBC.W #$0080                  ;$01ABA3	|
	BCC CODE_01ABAC               ;$01ABA6	|
	CMP.B $06                     ;$01ABA8	|
	BCS CODE_01ABF5               ;$01ABAA	|

CODE_01ABAC:
	LDA.W CameraY_TileMirror                   ;$01ABAC	|
	ADC.W #$0128                  ;$01ABAF	|
	CMP.B $06                     ;$01ABB2	|
	BCC CODE_01ABF5               ;$01ABB4	|
	LDA.W #$0018                  ;$01ABB6	|
	STA.W $6010                   ;$01ABB9	|
	LDA.W #$0040                  ;$01ABBC	|
	STA.W $6012                   ;$01ABBF	|
	LDA.W #$3E00                  ;$01ABC2	|
	STA.W $6000                   ;$01ABC5	|
	STZ.W $2250                   ;$01ABC8	|
	LDA.B $02                     ;$01ABCB	|
	STA.W $2251                   ;$01ABCD	|
	LDA.W #$0018                  ;$01ABD0	|
	STA.W $2253                   ;$01ABD3	|
	LDA.B $04                     ;$01ABD6	|
	CLC                           ;$01ABD8	|
	ADC.W $2306                   ;$01ABD9	|
	TAX                           ;$01ABDC	|
	STX.B $04                     ;$01ABDD	|
	LDY.B $06                     ;$01ABDF	|
	JSL.L CODE_FL_01CE20          ;$01ABE1	|
	CMP.W #$0030                  ;$01ABE5	|
	BCS CODE_01ABF5               ;$01ABE8	|
	LDX.B $04                     ;$01ABEA	|
	LDY.B $06                     ;$01ABEC	|
	LDA.W #$0009                  ;$01ABEE	|
	JSL.L CreateNewObject        ;$01ABF1	|

CODE_01ABF5:
	LDY.B $4D                     ;$01ABF5	|
	INY                           ;$01ABF7	|
	INY                           ;$01ABF8	|
	CPY.W #$0008                  ;$01ABF9	|
	BCS CODE_81AC01               ;$01ABFC	|
	JMP.W CODE_JP_01AB78          ;$01ABFE	|

CODE_81AC01:
	LDY.W #$0000                  ;$01AC01	|

CODE_01AC04:
	STY.B $4D                     ;$01AC04	|
	LDA.W #$BADE                  ;$01AC06	|
	LDX.W #$0001                  ;$01AC09	|
	JSL.L SA1_ExecuteSNES              ;$01AC0C	|
	LDA.B $00                     ;$01AC10	|
	CMP.W #$000D                  ;$01AC12	|
	BEQ CODE_81AC55               ;$01AC15	|
	TAY                           ;$01AC17	|
	BMI CODE_81AC68               ;$01AC18	|
	AND.W #$3FFF                  ;$01AC1A	|
	CMP.W #$2001                  ;$01AC1D	|
	BCS CODE_01AC5F               ;$01AC20	|
	LDY.W #$DA93                  ;$01AC22	|
	BVC CODE_01AC2A               ;$01AC25	|
	LDY.W #$DAB1                  ;$01AC27	|

CODE_01AC2A:
	LDA.B $16                     ;$01AC2A	|
	SEC                           ;$01AC2C	|
	SBC.W $735E                   ;$01AC2D	|
	STA.W $302F                   ;$01AC30	|
	STA.B $0C                     ;$01AC33	|
	LDA.B $1A                     ;$01AC35	|
	SEC                           ;$01AC37	|
	SBC.W $7360                   ;$01AC38	|
	STA.W $3031                   ;$01AC3B	|
	CLC                           ;$01AC3E	|
	ADC.W #$000B                  ;$01AC3F	|
	STA.B $0E                     ;$01AC42	|
	LDA.W #$0001                  ;$01AC44	|
	JSL.L CODE_FL_00AD79          ;$01AC47	|
	LDA.B $00                     ;$01AC4B	|
	AND.W #$2000                  ;$01AC4D	|
	BEQ CODE_01AC6B               ;$01AC50	|
	JMP.W CODE_JP_01ACBD          ;$01AC52	|

CODE_81AC55:
	LDA.W #$BB09                  ;$01AC55	|
	LDX.W #$0001                  ;$01AC58	|
	JSL.L SA1_ExecuteSNES              ;$01AC5B	|

CODE_01AC5F:
	LDY.B $4D                     ;$01AC5F	|
	INY                           ;$01AC61	|
	INY                           ;$01AC62	|
	CPY.W #$0020                  ;$01AC63	|
	BCC CODE_01AC04               ;$01AC66	|

CODE_81AC68:
	JMP.W CODE_JP_01B619          ;$01AC68	|

CODE_01AC6B:
	LDA.W CameraLock                   ;$01AC6B	|
	BNE CODE_81AC55               ;$01AC6E	|
	LDA.B $00                     ;$01AC70	|
	AND.W #$1FFF                  ;$01AC72	|
	CMP.W #$0100                  ;$01AC75	|
	BCS CODE_01AC84               ;$01AC78	|
	CMP.W #$000E                  ;$01AC7A	|
	BCS CODE_01AC5F               ;$01AC7D	|
	ASL A                         ;$01AC7F	|
	TAX                           ;$01AC80	|
    JMP.W (PTR16_01AC91,X)        ;$01AC81 |

CODE_01AC84:
    SBC.W #$0100                  ;$01AC84 |
    CMP.W #$0008                  ;$01AC87 |
    BCS CODE_01AC5F               ;$01AC8A |
    ASL A                         ;$01AC8C |
    TAX                           ;$01AC8D |
    JMP.W (PTR16_01ACAD,X)        ;$01AC8E |

PTR16_01AC91:
    dw CODE_01ACF5                ;$01AC91 |
    dw CODE_01ACF5                ;$01AC93 |
    dw CODE_01ACF5                ;$01AC95 |
    dw CODE_01ACF5                ;$01AC97 |
    dw CODE_01ACF2                ;$01AC99 |
    dw CODE_01ACF2                ;$01AC9B |
    dw CODE_01ACF2                ;$01AC9D |
    dw CODE_01ACF2                ;$01AC9F |
    dw CODE_01ACF2                ;$01ACA1 |
    dw CODE_01ACF2                ;$01ACA3 |
    dw CODE_01ACF2                ;$01ACA5 |
    dw CODE_01ACF2                ;$01ACA7 |
    dw CODE_01ACF2                ;$01ACA9 |
    dw CODE_01ACF2                ;$01ACAB |

PTR16_01ACAD:
    dw CODE_01B432                ;$01ACAD |
    dw CODE_01B476                ;$01ACAF |
    dw CODE_01B488                ;$01ACB1 |
    dw CODE_01B4E5                ;$01ACB3 |
    dw CODE_01B502                ;$01ACB5 |
    dw CODE_01B524                ;$01ACB7 |
    dw CODE_01B541                ;$01ACB9 |
    dw CODE_01B560                ;$01ACBB |


CODE_JP_01ACBD:
	LDX.B $08                     ;$01ACBD	|
	BNE CODE_01ACCE               ;$01ACBF	|
	LDA.B $00                     ;$01ACC1	|
	AND.W #$4000                  ;$01ACC3	|
	ORA.W #$0100                  ;$01ACC6	|
	STA.B $00                     ;$01ACC9	|
	JMP.W CODE_81AC55             ;$01ACCB	|

CODE_01ACCE:
	INC.B $0E                     ;$01ACCE	|

CODE_01ACD0:
    PHX                           ;$01ACD0 |
    LDA.B $0C                     ;$01ACD1 |
    STA.W $302F                   ;$01ACD3 |
    LDA.B $0E                     ;$01ACD6 |
    SEC                           ;$01ACD8 |
    SBC.W #$0018                  ;$01ACD9 |
    STA.B $0E                     ;$01ACDC |
    STA.W $3031                   ;$01ACDE |
    LDY.W #$DA89                  ;$01ACE1 |
    LDA.W #$0001                  ;$01ACE4 |
    JSL.L CODE_FL_00AD79          ;$01ACE7 |
    PLX                           ;$01ACEB |
    DEX                           ;$01ACEC |
    BNE CODE_01ACD0               ;$01ACED |
    JMP.W CODE_81AC55             ;$01ACEF |

CODE_01ACF2:
    JMP.W CODE_81AC55             ;$01ACF2 |

CODE_01ACF5:
    LDA.L DATA16_01AE7F,X         ;$01ACF5 |
    TAX                           ;$01ACF9 |
    LDA.B $08                     ;$01ACFA |
    JSL.L CODE_FL_059CC6          ;$01ACFC |
    AND.W #$00FF                  ;$01AD00 |
    XBA                           ;$01AD03 |
    CLC                           ;$01AD04 |
    ADC.B $14                     ;$01AD05 |
    STA.B $14                     ;$01AD07 |
    LDA.B $04                     ;$01AD09 |
    AND.W #$FF00                  ;$01AD0B |
    BPL CODE_01AD13               ;$01AD0E |
    ORA.W #$00FF                  ;$01AD10 |

CODE_01AD13:
	XBA                           ;$01AD13	|
	ADC.B $16                     ;$01AD14	|
	STA.B $16                     ;$01AD16	|
	TXA                           ;$01AD18	|
	AND.W #$00FF                  ;$01AD19	|
	XBA                           ;$01AD1C	|
	CLC                           ;$01AD1D	|
	ADC.B $18                     ;$01AD1E	|
	STA.B $18                     ;$01AD20	|
	TXA                           ;$01AD22	|
	AND.W #$FF00                  ;$01AD23	|
	BPL CODE_01AD2B               ;$01AD26	|
	ORA.W #$00FF                  ;$01AD28	|

CODE_01AD2B:
	XBA                           ;$01AD2B	|
	ADC.B $1A                     ;$01AD2C	|
	STA.B $1A                     ;$01AD2E	|
	TAY                           ;$01AD30	|
	LDX.B $16                     ;$01AD31	|
	JSL.L CODE_FL_01CE20          ;$01AD33	|
	LDA.B $64                     ;$01AD37	|
	CMP.B $0A                     ;$01AD39	|
	BEQ CODE_01AD95               ;$01AD3B	|
	LDA.W #$AF77                  ;$01AD3D	|
	LDX.W #$0001                  ;$01AD40	|
	JSL.L SA1_ExecuteSNES         ;$01AD43	|
	LDA.W #$0001                  ;$01AD47	|
	STA.W $2250                   ;$01AD4A	|
	LDA.B $64                     ;$01AD4D	|
	SEC                           ;$01AD4F	|
	SBC.W #$0000                  ;$01AD50	|
	STA.W $2251                   ;$01AD53	|
	LDA.B $53                     ;$01AD56	|
	STA.W $2253                   ;$01AD58	|
	CLC                           ;$01AD5B	|
	LDY.W $2306                   ;$01AD5C	|
	LDX.W $2308                   ;$01AD5F	|
	STZ.W $2250                   ;$01AD62	|
	LDA.W #$000C                  ;$01AD65	|
	STA.W $2251                   ;$01AD68	|
	STX.W $2253                   ;$01AD6B	|
	LDX.B $0C                     ;$01AD6E	|
	LDA.L DATA16_01AE87,X          ;$01AD70	|
	ADC.W $2306                   ;$01AD74	|
	STA.B $16                     ;$01AD77	|
	STZ.B $14                     ;$01AD79	|
	LDA.W #$0018                  ;$01AD7B	|
	STA.W $2251                   ;$01AD7E	|
	STY.W $2253                   ;$01AD81	|
	LDA.L DATA16_01AED7,X          ;$01AD84	|
	ADC.W $2306                   ;$01AD88	|
	STA.B $1A                     ;$01AD8B	|
	STZ.B $18                     ;$01AD8D	|
	LDA.L DATA16_01AF27,X          ;$01AD8F	|
	BRA CODE_JP_01ADB2            ;$01AD93	|

CODE_01AD95:
	LDA.B $72                     ;$01AD95	|
	AND.W #$007F                  ;$01AD97	|
	SEC                           ;$01AD9A	|
	SBC.W #$0020                  ;$01AD9B	|
	CMP.W #$0004                  ;$01AD9E	|
	BCS CODE_JP_01ADB4            ;$01ADA1	|
	ASL A                         ;$01ADA3	|
	TAX                           ;$01ADA4	|
	LDA.B $08                     ;$01ADA5	|
	JMP.W (CODE_01ADAA,X)         ;$01ADA7	|

CODE_01ADAA:
	TYX                           ;$01ADAA	|
	LDA.W CODE_00ADEB             ;$01ADAB	|
	INC A                         ;$01ADAE	|
	LDX.W CODE_00AE4B             ;$01ADAF	|

CODE_JP_01ADB2:
	STA.B $08                     ;$01ADB2	|

CODE_JP_01ADB4:
	LDA.B $64                     ;$01ADB4	|
	STA.B $0A                     ;$01ADB6	|
	JMP.W CODE_81AC55             ;$01ADB8	|
	BEQ CODE_01ADD9               ;$01ADBB	|
	CMP.W #$4000                  ;$01ADBD	|
	BEQ CODE_JP_01ADB4            ;$01ADC0	|
	CMP.W #$8000                  ;$01ADC2	|
	BEQ CODE_JP_01ADB4            ;$01ADC5	|
	LDA.W #$000B                  ;$01ADC7	|
	SEC                           ;$01ADCA	|
	SBC.B $74                     ;$01ADCB	|
	BCC CODE_JP_01ADB4            ;$01ADCD	|
	CLC                           ;$01ADCF	|
	ADC.B $16                     ;$01ADD0	|
	STA.B $16                     ;$01ADD2	|
	LDA.W #$8000                  ;$01ADD4	|
	BRA CODE_JP_01ADB2            ;$01ADD7	|

CODE_01ADD9:
	LDA.W #$000C                  ;$01ADD9	|
	SEC                           ;$01ADDC	|
	SBC.B $76                     ;$01ADDD	|
	BCC CODE_JP_01ADB4            ;$01ADDF	|
	CLC                           ;$01ADE1	|
	ADC.B $1A                     ;$01ADE2	|
	STA.B $1A                     ;$01ADE4	|
	LDA.W #$4000                  ;$01ADE6	|
	BRA CODE_JP_01ADB2            ;$01ADE9	|
	BEQ CODE_01AE08               ;$01ADEB	|
	CMP.W #$8000                  ;$01ADED	|
	BEQ CODE_JP_01ADB4            ;$01ADF0	|
	CMP.W #$C000                  ;$01ADF2	|
	BEQ CODE_JP_01ADB4            ;$01ADF5	|
	LDA.W #$000B                  ;$01ADF7	|
	SEC                           ;$01ADFA	|
	SBC.B $74                     ;$01ADFB	|
	BCS CODE_JP_01ADB4            ;$01ADFD	|
	ADC.B $16                     ;$01ADFF	|
	STA.B $16                     ;$01AE01	|
	LDA.W #$8000                  ;$01AE03	|
	BRA CODE_JP_01ADB2            ;$01AE06	|

CODE_01AE08:
	LDA.W #$000C                  ;$01AE08	|
	SEC                           ;$01AE0B	|
	SBC.B $76                     ;$01AE0C	|
	BCC CODE_JP_01ADB4            ;$01AE0E	|
	CLC                           ;$01AE10	|
	ADC.B $1A                     ;$01AE11	|
	STA.B $1A                     ;$01AE13	|
	LDA.W #$C000                  ;$01AE15	|
	BRA CODE_JP_01ADB2            ;$01AE18	|
	BEQ CODE_JP_01ADB4            ;$01AE1A	|
	CMP.W #$4000                  ;$01AE1C	|
	BEQ CODE_JP_01ADB4            ;$01AE1F	|
	CMP.W #$8000                  ;$01AE21	|
	BEQ CODE_01AE39               ;$01AE24	|
	LDA.W #$000B                  ;$01AE26	|
	SEC                           ;$01AE29	|
	SBC.B $74                     ;$01AE2A	|
	BCC CODE_01AE57               ;$01AE2C	|
	CLC                           ;$01AE2E	|
	ADC.B $16                     ;$01AE2F	|
	STA.B $16                     ;$01AE31	|
	LDA.W #$0000                  ;$01AE33	|
	JMP.W CODE_JP_01ADB2          ;$01AE36	|

CODE_01AE39:
	LDA.W #$000B                  ;$01AE39	|
	SEC                           ;$01AE3C	|
	SBC.B $76                     ;$01AE3D	|
	BCS CODE_01AE57               ;$01AE3F	|
	ADC.B $1E                     ;$01AE41	|
	STA.B $1E                     ;$01AE43	|
	LDA.W #$4000                  ;$01AE45	|
	JMP.W CODE_JP_01ADB2          ;$01AE48	|
	BEQ CODE_01AE57               ;$01AE4B	|
	CMP.W #$4000                  ;$01AE4D	|
	BEQ CODE_01AE5A               ;$01AE50	|
	CMP.W #$8000                  ;$01AE52	|
	BEQ CODE_01AE6C               ;$01AE55	|

CODE_01AE57:
	JMP.W CODE_JP_01ADB4          ;$01AE57	|

CODE_01AE5A:
	LDA.W #$000B                  ;$01AE5A	|
	SEC                           ;$01AE5D	|
	SBC.B $74                     ;$01AE5E	|
	BCS CODE_01AE57               ;$01AE60	|
	ADC.B $16                     ;$01AE62	|
	STA.B $16                     ;$01AE64	|
	LDA.W #$0000                  ;$01AE66	|
	JMP.W CODE_JP_01ADB2          ;$01AE69	|

CODE_01AE6C:
	LDA.W #$000B                  ;$01AE6C	|
	SEC                           ;$01AE6F	|
	SBC.B $76                     ;$01AE70	|
	BCS CODE_01AE57               ;$01AE72	|
	INC A                         ;$01AE74	|
	ADC.B $1E                     ;$01AE75	|
	STA.B $1E                     ;$01AE77	|
	LDA.W #$C000                  ;$01AE79	|
	JMP.W CODE_JP_01ADB2          ;$01AE7C	|

DATA16_01AE7F:
    dw $0080,$0100,$0200,$0300    ;$01AE7F |

DATA16_01AE87:
    dw $000B,$000B,$0000,$0017    ;$01AE87 |
    dw $0000,$0017,$0000,$0017    ;$01AE8F |
    dw $000C,$0017,$0000,$000B    ;$01AE97 |
    dw $000C,$0017,$0000,$000B    ;$01AE9F |
    dw $0017,$000C,$000B,$0000    ;$01AEA7 |
    dw $000C,$0017,$0000,$000B    ;$01AEAF |
    dw $0000,$0017,$0000,$0017    ;$01AEB7 |
    dw $0000,$0017,$0000,$0017    ;$01AEBF |
    dw $000B,$0017,$0000,$000B    ;$01AEC7 |
    dw $000B,$0017,$0000,$000B    ;$01AECF |

DATA16_01AED7:
    dw $0000,$0017,$000B,$000B    ;$01AED7 |
    dw $0017,$0000,$0000,$0017    ;$01AEDF |
    dw $0017,$000C,$000C,$0017    ;$01AEE7 |
    dw $0000,$000B,$000B,$0000    ;$01AEEF |
    dw $0000,$0017,$0000,$0017    ;$01AEF7 |
    dw $0000,$0017,$0000,$0017    ;$01AEFF |
    dw $0017,$000C,$000B,$0000    ;$01AF07 |
    dw $0000,$000B,$000C,$0017    ;$01AF0F |
    dw $0017,$000B,$000B,$0017    ;$01AF17 |
    dw $0000,$000B,$000B,$0000    ;$01AF1F |

DATA16_01AF27:
    dw $8000,$0000,$4000,$C000    ;$01AF27 |
    dw $2000,$A000,$6000,$E000    ;$01AF2F |
    dw $2000,$A000,$6000,$E000    ;$01AF37 |
    dw $6000,$E000,$2000,$A000    ;$01AF3F |
    dw $9000,$1000,$9000,$1000    ;$01AF47 |
    dw $7000,$F000,$7000,$F000    ;$01AF4F |
    dw $3000,$B000,$3000,$B000    ;$01AF57 |
    dw $5000,$D000,$5000,$D000    ;$01AF5F |
    dw $0000,$C000,$4000,$0000    ;$01AF67 |
    dw $8000,$C000,$4000,$8000    ;$01AF6F |

	LDA.B $66                     ;$01AF77	|
	STA.B $0C                     ;$01AF79	|
	LDA.B [$0A]                   ;$01AF7B	|
	AND.W #$03FF                  ;$01AF7D	|
	TAX                           ;$01AF80	|
	LDA.L $7F62A0,X               ;$01AF81	|
	AND.W #$007F                  ;$01AF85	|
	CMP.W #$0021                  ;$01AF88	|
	BEQ PTR16_01AF98              ;$01AF8B	|
	CMP.W #$0022                  ;$01AF8D	|
	BEQ PTR16_01AF98              ;$01AF90	|
	BIT.B $08                     ;$01AF92	|
	BMI CODE_01AF9C               ;$01AF94	|
	BRA CODE_01AFA0               ;$01AF96	|

PTR16_01AF98:
    dw $0824                      ;$01AF98 |
    dw $0450                      ;$01AF9A |

CODE_01AF9C:
	CLC                           ;$01AF9C	|
	ADC.W #$0014                  ;$01AF9D	|

CODE_01AFA0:
	SEC                           ;$01AFA0	|
	SBC.W #$0010                  ;$01AFA1	|
	ASL A                         ;$01AFA4	|
	TAX                           ;$01AFA5	|
	LDA.L DATA16_01AFFF,X          ;$01AFA6	|
	STA.B $0C                     ;$01AFAA	|
    JMP.W (PTR16_01AFAF,X)        ;$01AFAC |
PTR16_01AFAF:
    dw CODE_01B04F                ;$01AFAF |
    dw CODE_01B08F                ;$01AFB1 |
    dw CODE_01B14D                ;$01AFB3 |
    dw CODE_01B200                ;$01AFB5 |
    dw CODE_01B08F                ;$01AFB7 |
    dw CODE_01B0CE                ;$01AFB9 |
    dw CODE_01B08F                ;$01AFBB |
    dw CODE_01B04F                ;$01AFBD |
    dw CODE_01B14D                ;$01AFBF |
    dw CODE_01B04F                ;$01AFC1 |
    dw CODE_01B200                ;$01AFC3 |
    dw CODE_01B0CE                ;$01AFC5 |
    dw CODE_01B08F                ;$01AFC7 |
    dw CODE_01B14D                ;$01AFC9 |
    dw CODE_01B08F                ;$01AFCB |
    dw CODE_01B200                ;$01AFCD |
    dw CODE_01B08F                ;$01AFCF |
    dw CODE_01B0CE                ;$01AFD1 |
    dw CODE_01B04F                ;$01AFD3 |
    dw CODE_01B04F                ;$01AFD5 |
    dw CODE_01B0CE                ;$01AFD7 |
    dw CODE_01B10E                ;$01AFD9 |
    dw CODE_01B2B3                ;$01AFDB |
    dw CODE_01B366                ;$01AFDD |
    dw CODE_01B0CE                ;$01AFDF |
    dw CODE_01B10E                ;$01AFE1 |
    dw CODE_01B04F                ;$01AFE3 |
    dw CODE_01B10E                ;$01AFE5 |
    dw CODE_01B0CE                ;$01AFE7 |
    dw CODE_01B2B3                ;$01AFE9 |
    dw CODE_01B04F                ;$01AFEB |
    dw CODE_01B366                ;$01AFED |
    dw CODE_01B2B3                ;$01AFEF |
    dw CODE_01B10E                ;$01AFF1 |
    dw CODE_01B366                ;$01AFF3 |
    dw CODE_01B10E                ;$01AFF5 |
    dw CODE_01B0CE                ;$01AFF7 |
    dw CODE_01B10E                ;$01AFF9 |
    dw CODE_01B08F                ;$01AFFB |
    dw CODE_01B10E                ;$01AFFD |

DATA16_01AFFF:
    dw $0000,$0006,$000A,$000E    ;$01AFFF |
    dw $0012,$0016,$001A,$001E    ;$01B007 |
    dw $0020,$0024,$002A,$002E    ;$01B00F |
    dw $0032,$0036,$003A,$003E    ;$01B017 |
    dw $0042,$0046,$0048,$004E    ;$01B01F |
    dw $0002,$0004,$0008,$000C    ;$01B027 |
    dw $0010,$0014,$0018,$001C    ;$01B02F |
    dw $0022,$0026,$0028,$002C    ;$01B037 |
    dw $0030,$0034,$0038,$003C    ;$01B03F |
    dw $0040,$0044,$004A,$004C    ;$01B047 |

CODE_01B04F:
	LDA.B $0A                     ;$01B04F	|
	SEC                           ;$01B051	|
	SBC.B $53                     ;$01B052	|
	JSR.W CODE_FN_01B419          ;$01B054	|
	BCS CODE_01B062               ;$01B057	|
	LDA.L DATA16_01B067,X          ;$01B059	|
	BMI CODE_01B062               ;$01B05D	|
	STA.B $0C                     ;$01B05F	|
	RTL                           ;$01B061	|

CODE_01B062:
	LDA.B $0A                     ;$01B062	|
	STA.B $64                     ;$01B064	|
	RTL                           ;$01B066	|

DATA16_01B067:
    dw $0002,$FFFF,$FFFF,$FFFF    ;$01B067 |
    dw $0010,$0016,$FFFF,$FFFF    ;$01B06F |
    dw $0022,$FFFF,$FFFF,$002E    ;$01B077 |
    dw $FFFF,$FFFF,$FFFF,$FFFF    ;$01B07F |
    dw $0040,$0046,$FFFF,$FFFF    ;$01B087 |

CODE_01B08F:
	LDA.B $0A                     ;$01B08F	|
	INC A                         ;$01B091	|
	INC A                         ;$01B092	|
	JSR.W CODE_FN_01B419          ;$01B093	|
	BCS CODE_01B0A1               ;$01B096	|
	LDA.L DATA16_01B0A6,X          ;$01B098	|
	BMI CODE_01B0A1               ;$01B09C	|
	STA.B $0C                     ;$01B09E	|
	RTL                           ;$01B0A0	|

CODE_01B0A1:
	LDA.B $0A                     ;$01B0A1	|
	STA.B $64                     ;$01B0A3	|
	RTL                           ;$01B0A5	|

DATA16_01B0A6:
    dw $FFFF,$0004,$FFFF,$FFFF    ;$01B0A6 |
    dw $FFFF,$0014,$FFFF,$001C    ;$01B0AE |
    dw $FFFF,$FFFF,$FFFF,$FFFF    ;$01B0B6 |
    dw $FFFF,$0034,$FFFF,$003C    ;$01B0BE |
    dw $FFFF,$0044,$FFFF,$004C    ;$01B0C6 |

CODE_01B0CE:
	LDA.B $0A                     ;$01B0CE	|
	CLC                           ;$01B0D0	|
	ADC.B $53                     ;$01B0D1	|
	JSR.W CODE_FN_01B419          ;$01B0D3	|
	BCS CODE_01B0E1               ;$01B0D6	|
	LDA.L DATA16_01B0E6,X         ;$01B0D8 |
	BMI CODE_01B0E1               ;$01B0DC	|
	STA.B $0C                     ;$01B0DE	|
	RTL                           ;$01B0E0	|

CODE_01B0E1:
	LDA.B $0A                     ;$01B0E1	|
	STA.B $64                     ;$01B0E3	|
	RTL                           ;$01B0E5	|

DATA16_01B0E6:
    dw $0000,$FFFF,$FFFF,$FFFF    ;$01B0E6 |
    dw $FFFF,$FFFF,$0018,$001E    ;$01B0EE |
    dw $FFFF,$0024,$0028,$FFFF    ;$01B0F6 |
    dw $FFFF,$FFFF,$FFFF,$FFFF    ;$01B0FE |
    dw $FFFF,$FFFF,$0048,$004E    ;$01B106 |

CODE_01B10E:
	LDA.B $0A                     ;$01B10E	|
	DEC A                         ;$01B110	|
	DEC A                         ;$01B111	|
	JSR.W CODE_FN_01B419          ;$01B112	|
	BCS CODE_01B120               ;$01B115	|
	LDA.L DATA16_01B125,X         ;$01B117	|
	BMI CODE_01B120               ;$01B11B	|
	STA.B $0C                     ;$01B11D	|
	RTL                           ;$01B11F	|

CODE_01B120:
	LDA.B $0A                     ;$01B120	|
	STA.B $64                     ;$01B122	|
	RTL                           ;$01B124	|

DATA16_01B125:
    dw $FFFF,$0006,$FFFF,$FFFF    ;$01B125 |
    dw $0012,$FFFF,$001A,$FFFF    ;$01B12D |
    dw $FFFF,$FFFF,$FFFF,$FFFF    ;$01B135 |
    dw $0032,$FFFF,$003A,$FFFF    ;$01B13D |
    dw $0042,$FFFF,$004A,$FFFF    ;$01B145 |

CODE_01B14D:
    LDA.B $0A                     ;$01B14D |
    SEC                           ;$01B14F |
    SBC.B $53                     ;$01B150 |
    ADC.W #$0001                  ;$01B152 |
    JSR.W CODE_FN_01B419          ;$01B155 |
    BCS CODE_01B160               ;$01B158 |
    LDA.L DATA16_01B188,X         ;$01B15A |
    BPL CODE_01B180               ;$01B15E |

CODE_01B160:
    LDA.B $64                     ;$01B160 |
    SBC.W #$0002                  ;$01B162 |
    JSR.W CODE_FN_01B419          ;$01B165 |
    BCS CODE_01B170               ;$01B168 |
    LDA.L DATA16_01B1B0,X         ;$01B16A |
    BPL CODE_01B180               ;$01B16E |

CODE_01B170:
    LDA.B $0A                     ;$01B170 |
    ADC.W #$0001                  ;$01B172 |
    JSR.W CODE_FN_01B419          ;$01B175 |
    BCS CODE_01B183               ;$01B178 |
    LDA.L DATA16_01B1D8,X         ;$01B17A |
    BMI CODE_01B183               ;$01B17E |

CODE_01B180:
    STA.B $0C                     ;$01B180 |
    RTL                           ;$01B182 |


CODE_01B183:
    LDA.B $0A                     ;$01B183 |
    STA.B $64                     ;$01B185 |
    RTL                           ;$01B187 |


DATA16_01B188:
    dw $FFFF,$FFFF,$0008,$FFFF    ;$01B188 |
    dw $FFFF,$FFFF,$FFFF,$FFFF    ;$01B190 |
    dw $FFFF,$0026,$FFFF,$FFFF    ;$01B198 |
    dw $0030,$FFFF,$FFFF,$FFFF    ;$01B1A0 |
    dw $FFFF,$FFFF,$FFFF,$FFFF    ;$01B1A8 |

DATA16_01B1B0:
    dw $FFFF,$FFFF,$FFFF,$000E    ;$01B1B0 |
    dw $FFFF,$FFFF,$FFFF,$FFFF    ;$01B1B8 |
    dw $FFFF,$FFFF,$002A,$FFFF    ;$01B1C0 |
    dw $FFFF,$FFFF,$FFFF,$003E    ;$01B1C8 |
    dw $FFFF,$FFFF,$FFFF,$FFFF    ;$01B1D0 |

DATA16_01B1D8:
    dw $FFFF,$FFFF,$FFFF,$000C    ;$01B1D8 |
    dw $FFFF,$FFFF,$FFFF,$FFFF    ;$01B1E0 |
    dw $FFFF,$FFFF,$FFFF,$002C    ;$01B1E8 |
    dw $FFFF,$FFFF,$0038,$FFFF    ;$01B1F0 |
    dw $FFFF,$FFFF,$FFFF,$FFFF    ;$01B1F8 |

CODE_01B200:
    LDA.B $0A                     ;$01B200 |
    CLC                           ;$01B202 |
    ADC.B $53                     ;$01B203 |
    ADC.W #$0002                  ;$01B205 |
    JSR.W CODE_FN_01B419          ;$01B208 |
    BCS CODE_01B213               ;$01B20B |
    LDA.L DATA16_01B23B,X         ;$01B20D |
    BPL CODE_01B233               ;$01B211 |

CODE_01B213:
    LDA.B $64                     ;$01B213 |
    SBC.W #$0002                  ;$01B215 |
    JSR.W CODE_FN_01B419          ;$01B218 |
    BCS CODE_01B223               ;$01B21B |
    LDA.L DATA16_01B263,X         ;$01B21D |
    BPL CODE_01B233               ;$01B221 |

CODE_01B223:
    LDA.B $0A                     ;$01B223 |
    ADC.W #$0001                  ;$01B225 |
    JSR.W CODE_FN_01B419          ;$01B228 |
    BCS CODE_01B236               ;$01B22B |
    LDA.L DATA16_01B28B,X         ;$01B22D |
    BMI CODE_01B236               ;$01B231 |

CODE_01B233:
    STA.B $0C                     ;$01B233 |
    RTL                           ;$01B235 |


CODE_01B236:
    LDA.B $0A                     ;$01B236 |
    STA.B $64                     ;$01B238 |
    RTL                           ;$01B23A |

DATA16_01B23B:
    dw $FFFF,$FFFF,$FFFF,$000C    ;$01B23B |
    dw $FFFF,$FFFF,$FFFF,$FFFF    ;$01B243 |
    dw $FFFF,$FFFF,$FFFF,$002C    ;$01B24B |
    dw $FFFF,$FFFF,$0038,$FFFF    ;$01B253 |
    dw $FFFF,$FFFF,$FFFF,$FFFF    ;$01B25B |

DATA16_01B263:
    dw $FFFF,$FFFF,$000A,$FFFF    ;$01B263 |
    dw $FFFF,$FFFF,$FFFF,$FFFF    ;$01B26B |
    dw $0020,$FFFF,$FFFF,$FFFF    ;$01B273 |
    dw $FFFF,$0036,$FFFF,$FFFF    ;$01B27B |
    dw $FFFF,$FFFF,$FFFF,$FFFF    ;$01B283 |

DATA16_01B28B:
    dw $FFFF,$FFFF,$0008,$FFFF    ;$01B28B |
    dw $FFFF,$FFFF,$FFFF,$FFFF    ;$01B293 |
    dw $FFFF,$0026,$FFFF,$FFFF    ;$01B29B |
    dw $0030,$FFFF,$FFFF,$FFFF    ;$01B2A3 |
    dw $FFFF,$FFFF,$FFFF,$FFFF    ;$01B2AB |

CODE_01B2B3:
    LDA.B $0A                     ;$01B2B3 |
    CLC                           ;$01B2B5 |
    ADC.B $53                     ;$01B2B6 |
    SBC.W #$0001                  ;$01B2B8 |
    JSR.W CODE_FN_01B419          ;$01B2BB |
    BCS CODE_01B2C6               ;$01B2BE |
    LDA.L DATA16_01B2EE,X         ;$01B2C0 |
    BPL CODE_01B2E6               ;$01B2C4 |

CODE_01B2C6:
    LDA.B $64                     ;$01B2C6 |
    ADC.W #$0001                  ;$01B2C8 |
    JSR.W CODE_FN_01B419          ;$01B2CB |
    BCS CODE_01B2D6               ;$01B2CE |
    LDA.L DATA16_01B316,X         ;$01B2D0 |
    BPL CODE_01B2E6               ;$01B2D4 |

CODE_01B2D6:
    LDA.B $0A                     ;$01B2D6 |
    SBC.W #$0002                  ;$01B2D8 |
    JSR.W CODE_FN_01B419          ;$01B2DB |
    BCS CODE_01B2E9               ;$01B2DE |
    LDA.L DATA16_01B33E,X         ;$01B2E0 |
    BMI CODE_01B2E9               ;$01B2E4 |

CODE_01B2E6:
    STA.B $0C                     ;$01B2E6 |
    RTL                           ;$01B2E8 |

CODE_01B2E9:
    LDA.B $0A                     ;$01B2E9 |
    STA.B $64                     ;$01B2EB |
    RTL                           ;$01B2ED |

DATA16_01B2EE:
    dw $FFFF,$FFFF,$000A,$FFFF    ;$01B2EE |
    dw $FFFF,$FFFF,$FFFF,$FFFF    ;$01B2F6 |
    dw $0020,$FFFF,$FFFF,$FFFF    ;$01B2FE |
    dw $FFFF,$0036,$FFFF,$FFFF    ;$01B306 |
    dw $FFFF,$FFFF,$FFFF,$FFFF    ;$01B30E |

DATA16_01B316:
    dw $FFFF,$FFFF,$FFFF,$000C    ;$01B316 |
    dw $FFFF,$FFFF,$FFFF,$FFFF    ;$01B31E |
    dw $FFFF,$FFFF,$FFFF,$002C    ;$01B326 |
    dw $FFFF,$FFFF,$0038,$FFFF    ;$01B32E |
    dw $FFFF,$FFFF,$FFFF,$FFFF    ;$01B336 |

DATA16_01B33E:
    dw $FFFF,$FFFF,$FFFF,$000E    ;$01B33E |
    dw $FFFF,$FFFF,$FFFF,$FFFF    ;$01B346 |
    dw $FFFF,$FFFF,$002A,$FFFF    ;$01B34E |
    dw $FFFF,$FFFF,$FFFF,$003E    ;$01B356 |
    dw $FFFF,$FFFF,$FFFF,$FFFF    ;$01B35E |

CODE_01B366:
    LDA.B $0A                     ;$01B366 |
    SEC                           ;$01B368 |
    SBC.B $53                     ;$01B369 |
    SBC.W #$0002                  ;$01B36B |
    JSR.W CODE_FN_01B419          ;$01B36E |
    BCS CODE_01B379               ;$01B371 |
    LDA.L DATA16_01B3A1,X         ;$01B373 |
    BPL CODE_01B399               ;$01B377 |

CODE_01B379:
    LDA.B $64                     ;$01B379 |
    ADC.W #$0001                  ;$01B37B |
    JSR.W CODE_FN_01B419          ;$01B37E |
    BCS CODE_01B389               ;$01B381 |
    LDA.L DATA16_01B3C9,X         ;$01B383 |
    BPL CODE_01B399               ;$01B387 |

CODE_01B389:
    LDA.B $0A                     ;$01B389 |
    SBC.W #$0002                  ;$01B38B |
    JSR.W CODE_FN_01B419          ;$01B38E |
    BCS CODE_01B39C               ;$01B391 |
    LDA.L DATA16_01B3F1,X         ;$01B393 |
    BMI CODE_01B39C               ;$01B397 |

CODE_01B399:
    STA.B $0C                     ;$01B399 |
    RTL                           ;$01B39B |


CODE_01B39C:
    LDA.B $0A                     ;$01B39C |
    STA.B $64                     ;$01B39E |
    RTL                           ;$01B3A0 |

DATA16_01B3A1:
    dw $FFFF,$FFFF,$FFFF,$000E    ;$01B3A1 |
    dw $FFFF,$FFFF,$FFFF,$FFFF    ;$01B3A9 |
    dw $FFFF,$FFFF,$002A,$FFFF    ;$01B3B1 |
    dw $FFFF,$FFFF,$FFFF,$003E    ;$01B3B9 |
    dw $FFFF,$FFFF,$FFFF,$FFFF    ;$01B3C1 |

DATA16_01B3C9:
    dw $FFFF,$FFFF,$0008,$FFFF    ;$01B3C9 |
    dw $FFFF,$FFFF,$FFFF,$FFFF    ;$01B3D1 |
    dw $FFFF,$0026,$FFFF,$FFFF    ;$01B3D9 |
    dw $0030,$FFFF,$FFFF,$FFFF    ;$01B3E1 |
    dw $FFFF,$FFFF,$FFFF,$FFFF    ;$01B3E9 |

DATA16_01B3F1:
    dw $FFFF,$FFFF,$000A,$FFFF    ;$01B3F1 |
    dw $FFFF,$FFFF,$FFFF,$FFFF    ;$01B3F9 |
    dw $0020,$FFFF,$FFFF,$FFFF    ;$01B401 |
    dw $FFFF,$0036,$FFFF,$FFFF    ;$01B409 |
    dw $FFFF,$FFFF,$FFFF,$FFFF    ;$01B411 |

CODE_FN_01B419:
    STA.B $64                     ;$01B419 |
    LDA.B [$64]                   ;$01B41B |
    AND.W #$03FF                  ;$01B41D |
    TAX                           ;$01B420 |
    LDA.L $7F62A0,X               ;$01B421 |
    AND.W #$007F                  ;$01B425 |
    SEC                           ;$01B428 |
    SBC.W #$0010                  ;$01B429 |
    ASL A                         ;$01B42C |
    TAX                           ;$01B42D |
    CPX.W #$0028                  ;$01B42E |
    RTS                           ;$01B431 |

CODE_01B432:
    JSR.W CODE_FN_01B49A          ;$01B432 |
    BCC CODE_01B452               ;$01B435 |
    LDA.B $00                     ;$01B437 |
    AND.W #$4000                  ;$01B439 |
    ORA.W #$0101                  ;$01B43C |
    STA.B $00                     ;$01B43F |
    LDA.W #$FE00                  ;$01B441 |
    STA.B $08                     ;$01B444 |
    LDA.W #$0600                  ;$01B446 |
    JSR.W CODE_FN_01B455          ;$01B449 |
    LDA.W #$FA00                  ;$01B44C |
    JSR.W CODE_FN_01B455          ;$01B44F |


CODE_01B452:
	JMP.W CODE_81AC55             ;$01B452	|

CODE_FN_01B455:
	STA.W $6006                   ;$01B455	|
	STZ.W $6008                   ;$01B458	|
	LDA.W #$0008                  ;$01B45B	|
	LDX.W #$0042                  ;$01B45E	|
	JSL.L CODE_FL_009AEB          ;$01B461	|
	TAX                           ;$01B465	|
	BMI CODE_01B475               ;$01B466	|
	STA.W $6E4A,X                 ;$01B468	|
	LDA.B $16                     ;$01B46B	|
	STA.W $6892,X                 ;$01B46D	|
	LDA.B $1A                     ;$01B470	|
	STA.W $690C,X                 ;$01B472	|

CODE_01B475:
    RTS                           ;$01B475 |

CODE_01B476:
    JSR.W CODE_FN_01B49A          ;$01B476 |
    BCC CODE_01B485               ;$01B479 |
    LDA.B $00                     ;$01B47B |
    AND.W #$4000                  ;$01B47D |
    ORA.W #$0102                  ;$01B480 |
    STA.B $00                     ;$01B483 |

CODE_01B485:
    JMP.W CODE_81AC55             ;$01B485 |

CODE_01B488:
    JSR.W CODE_FN_01B49A          ;$01B488 |
    BCS CODE_01B497               ;$01B48B |
    LDA.B $00                     ;$01B48D |
    AND.W #$4000                  ;$01B48F |
    ORA.W #$0100                  ;$01B492 |
    STA.B $00                     ;$01B495 |

CODE_01B497:
	JMP.W CODE_81AC55             ;$01B497	|

CODE_FN_01B49A:
	LDA.B $08                     ;$01B49A	|
	CLC                           ;$01B49C	|
	ADC.W #$0020                  ;$01B49D	|
	BMI CODE_01B4AA               ;$01B4A0	|
	CMP.W #$0300                  ;$01B4A2	|
	BCC CODE_01B4AA               ;$01B4A5	|
	LDA.W #$0300                  ;$01B4A7	|

CODE_01B4AA:
	STA.B $08                     ;$01B4AA	|
	XBA                           ;$01B4AC	|
	AND.W #$FF00                  ;$01B4AD	|
	CLC                           ;$01B4B0	|
	ADC.B $18                     ;$01B4B1	|
	STA.B $18                     ;$01B4B3	|
	LDA.B $08                     ;$01B4B5	|
	AND.W #$FF00                  ;$01B4B7	|
	BPL CODE_01B4BF               ;$01B4BA	|
	ORA.W #$00FF                  ;$01B4BC	|

CODE_01B4BF:
	XBA                           ;$01B4BF	|
	ADC.B $1A                     ;$01B4C0	|
	STA.B $1A                     ;$01B4C2	|
	LDA.B $1A                     ;$01B4C4	|
	CLC                           ;$01B4C6	|
	ADC.W #$000C                  ;$01B4C7	|
	TAY                           ;$01B4CA	|
	LDX.B $16                     ;$01B4CB	|
	JSL.L CODE_FL_01CE20          ;$01B4CD	|
	AND.W #$007F                  ;$01B4D1	|
	CMP.W #$0030                  ;$01B4D4	|
	BCC CODE_01B4E4               ;$01B4D7	|
	LDA.B $1A                     ;$01B4D9	|
	SEC                           ;$01B4DB	|
	SBC.W $3776                   ;$01B4DC	|
	STA.B $1A                     ;$01B4DF	|
	STZ.B $08                     ;$01B4E1	|
	SEC                           ;$01B4E3	|

CODE_01B4E4:
    RTS                           ;$01B4E4 |

CODE_01B4E5:
    JSR.W CODE_FN_01B5FE          ;$01B4E5 |	This code is read as data?
    LDA.B $0A                     ;$01B4E8 |
    SEC                           ;$01B4EA |
    SBC.W #$0100                  ;$01B4EB |
    STA.B $0A                     ;$01B4EE |
    CMP.W #$FE00                  ;$01B4F0 |
    BNE CODE_01B4FF               ;$01B4F3 |
    LDA.B $00                     ;$01B4F5 |
    AND.W #$4000                  ;$01B4F7 |
    ORA.W #$0104                  ;$01B4FA |
    STA.B $00                     ;$01B4FD |


CODE_01B4FF:
    JMP.W CODE_81AC55             ;$01B4FF |


CODE_01B502:
    JSR.W CODE_FN_01B5FE          ;$01B502 |
    LDA.B $0A                     ;$01B505 |
    CLC                           ;$01B507 |
    ADC.W #$0100                  ;$01B508 |
    STA.B $0A                     ;$01B50B |
    CMP.W #$0200                  ;$01B50D |
    BNE CODE_01B521               ;$01B510 |
    LDA.W #$0100                  ;$01B512 |
    STA.B $0A                     ;$01B515 |
    LDA.B $00                     ;$01B517 |
    AND.W #$4000                  ;$01B519 |
    ORA.W #$0105                  ;$01B51C |
    STA.B $00                     ;$01B51F |

CODE_01B521:
    JMP.W CODE_81AC55             ;$01B521 |


CODE_01B524:
    JSR.W CODE_FN_01B5FE          ;$01B524 |
    LDA.B $0A                     ;$01B527 |
    SEC                           ;$01B529 |
    SBC.W #$0080                  ;$01B52A |
    STA.B $0A                     ;$01B52D |
    CMP.W #$FF00                  ;$01B52F |
    BNE CODE_01B53E               ;$01B532 |
    LDA.B $00                     ;$01B534 |
    AND.W #$4000                  ;$01B536 |
    ORA.W #$0106                  ;$01B539 |
    STA.B $00                     ;$01B53C |

CODE_01B53E:
    JMP.W CODE_81AC55             ;$01B53E |


CODE_01B541:
    JSR.W CODE_FN_01B5FE          ;$01B541 |
    LDA.B $0A                     ;$01B544 |
    CLC                           ;$01B546 |
    ADC.W #$0080                  ;$01B547 |
    STA.B $0A                     ;$01B54A |
    CMP.W #$0100                  ;$01B54C |
    BNE CODE_01B55D               ;$01B54F |
    STZ.B $0A                     ;$01B551 |
    LDA.B $00                     ;$01B553 |
    AND.W #$4000                  ;$01B555 |
    ORA.W #$0107                  ;$01B558 |
    STA.B $00                     ;$01B55B |

CODE_01B55D:
    JMP.W CODE_81AC55             ;$01B55D |


CODE_01B560:
    LDX.B $08                     ;$01B560 |
    LDA.B $0A                     ;$01B562 |
    CLC                           ;$01B564 |
    ADC.L DATA16_01B5CE,X         ;$01B565 |
    CMP.L DATA16_01B5DE,X         ;$01B569 |
    BCC CODE_01B573               ;$01B56D |
    LDA.L DATA16_01B5DE,X         ;$01B56F |

CODE_01B573:
    STA.B $0A                     ;$01B573 |
    LDA.L DATA16_01B5EE,X         ;$01B575 |
    LDX.B $0A                     ;$01B579 |
    JSL.L CODE_FL_059CC6          ;$01B57B |
    LDA.B $04                     ;$01B57F |
    XBA                           ;$01B581 |
    AND.W #$FF00                  ;$01B582 |
    CLC                           ;$01B585 |
    ADC.B $14                     ;$01B586 |
    STA.B $14                     ;$01B588 |
    LDA.B $04                     ;$01B58A |
    AND.W #$FF00                  ;$01B58C |
    BPL CODE_01B594               ;$01B58F |
    ORA.W #$00FF                  ;$01B591 |

CODE_01B594:
    XBA                           ;$01B594 |
    ADC.B $16                     ;$01B595 |
    STA.B $16                     ;$01B597 |
    LDA.B $06                     ;$01B599 |
    XBA                           ;$01B59B |
    AND.W #$FF00                  ;$01B59C |
    CLC                           ;$01B59F |
    ADC.B $18                     ;$01B5A0 |
    STA.B $18                     ;$01B5A2 |
    LDA.B $06                     ;$01B5A4 |
    AND.W #$FF00                  ;$01B5A6 |
    BPL CODE_01B5AE               ;$01B5A9 |
    ORA.W #$00FF                  ;$01B5AB |

CODE_01B5AE:
    XBA                           ;$01B5AE |
    ADC.B $1A                     ;$01B5AF |
    STA.B $1A                     ;$01B5B1 |
    LDA.B $16                     ;$01B5B3 |
    CMP.W Room_Size_X                   ;$01B5B5 |
    BCS CODE_01B5C1               ;$01B5B8 |
    LDA.B $1A                     ;$01B5BA |
    CMP.W Room_Size_Y                   ;$01B5BC |
    BCC CODE_01B5CB               ;$01B5BF |

CODE_01B5C1:
    LDA.B $00                     ;$01B5C1 |
    AND.W #$4000                  ;$01B5C3 |
    ORA.W #$2001                  ;$01B5C6 |
    STA.B $00                     ;$01B5C9 |

CODE_01B5CB:
    JMP.W CODE_81AC55             ;$01B5CB |


DATA16_01B5CE:
    dw $0010,$0010,$0010,$0010    ;$01B5CE |
    dw $0020,$0020,$0020,$0020    ;$01B5D6 |

DATA16_01B5DE:
    dw $0200,$0200,$0200,$0200    ;$01B5DE |
    dw $0400,$0400,$0400,$0400    ;$01B5E6 |

DATA16_01B5EE:
    dw $0000,$4000,$8000,$C000    ;$01B5EE |
    dw $0000,$4000,$8000,$C000    ;$01B5F6 |

CODE_FN_01B5FE:
    LDA.B $0A                     ;$01B5FE |
    XBA                           ;$01B600 |
    AND.W #$FF00                  ;$01B601 |
    CLC                           ;$01B604 |
    ADC.B $18                     ;$01B605 |
    STA.B $18                     ;$01B607 |
    LDA.B $0A                     ;$01B609 |
    AND.W #$FF00                  ;$01B60B |
    BPL CODE_01B613               ;$01B60E |
    ORA.W #$00FF                  ;$01B610 |

CODE_01B613:
    XBA                           ;$01B613 |
    ADC.B $1A                     ;$01B614 |
    STA.B $1A                     ;$01B616 |
    RTS                           ;$01B618 |


CODE_JP_01B619:
	LDY.W #$0000                  ;$01B619	|

CODE_01B61C:
	STY.B $4D                     ;$01B61C	|
	LDA.W #$BB2F                  ;$01B61E	|
	LDX.W #$0001                  ;$01B621	|
	JSL.L SA1_ExecuteSNES              ;$01B624	|
	LDA.B $00                     ;$01B628	|
	BMI CODE_81B682               ;$01B62A	|
	LDA.B $00                     ;$01B62C	|
	AND.W #$0003                  ;$01B62E	|
	ASL A                         ;$01B631	|
	TAX                           ;$01B632	|
	LDA.L CODE_01B989,X           ;$01B633	|
	TAY                           ;$01B637	|
	LDA.B $02                     ;$01B638	|
	SEC                           ;$01B63A	|
	SBC.W $735E                   ;$01B63B	|
	STA.W $302F                   ;$01B63E	|
	LDA.B $04                     ;$01B641	|
	SEC                           ;$01B643	|
	SBC.W #$0004                  ;$01B644	|
	SBC.W $7360                   ;$01B647	|
	STA.W $3031                   ;$01B64A	|
	LDA.W #$0001                  ;$01B64D	|
	JSL.L CODE_FL_00AD79          ;$01B650	|
	LDA.W CameraLock                   ;$01B654	|
	BNE CODE_JP_01B66F            ;$01B657	|
	LDA.B $00                     ;$01B659	|
	AND.W #$FFFC                  ;$01B65B	|
	LSR A                         ;$01B65E	|
	TAX                           ;$01B65F	|
    JMP.W (PTR16_01B663,X)        ;$01B660 |
PTR16_01B663:
    dw CODE_01B685                ;$01B663 |
    dw CODE_01B78A                ;$01B665 |
    dw CODE_01B7C2                ;$01B667 |
    dw CODE_01B840                ;$01B669 |
    dw CODE_01B878                ;$01B66B |
    dw CODE_01B900                ;$01B66D |

CODE_JP_01B66F:
	LDA.W #$BB4D                  ;$01B66F	|
	LDX.W #$0001                  ;$01B672	|
	JSL.L SA1_ExecuteSNES              ;$01B675	|
	LDY.B $4D                     ;$01B679	|
	INY                           ;$01B67B	|
	INY                           ;$01B67C	|
	CPY.W #$0008                  ;$01B67D	|
	BCC CODE_01B61C               ;$01B680	|

CODE_81B682:
    JMP.W CODE_JP_01B9BF          ;$01B682 |

CODE_01B685:
    STZ.B $06                     ;$01B685 |
    LDA.W $690E                   ;$01B687 |
    CLC                           ;$01B68A |
    ADC.W #$001D                  ;$01B68B |
    SBC.B $04                     ;$01B68E |
    BMI CODE_01B6B5               ;$01B690 |
    CMP.W #$0030                  ;$01B692 |
    BCS CODE_01B6CC               ;$01B695 |
    LDA.W $6894                   ;$01B697 |
    ADC.W #$001D                  ;$01B69A |
    SBC.B $02                     ;$01B69D |
    BMI CODE_01B6E4               ;$01B69F |
    CMP.W #$0038                  ;$01B6A1 |
    BCS CODE_01B6E4               ;$01B6A4 |
    LDA.W $36C4                   ;$01B6A6 |
    BIT.W #$0400                  ;$01B6A9 |
    BNE CODE_01B6DC               ;$01B6AC |
    BIT.W #$0800                  ;$01B6AE |
    BNE CODE_01B6C5               ;$01B6B1 |
    BRA CODE_01B6E4               ;$01B6B3 |

CODE_01B6B5:
	LDA.W $6894                   ;$01B6B5	|
	CLC                           ;$01B6B8	|
	ADC.W #$0035                  ;$01B6B9	|
	SBC.B $02                     ;$01B6BC	|
	BMI CODE_01B6E4               ;$01B6BE	|
	CMP.W #$0068                  ;$01B6C0	|
	BCS CODE_01B6E4               ;$01B6C3	|

CODE_01B6C5:
	JSR.W CODE_FN_01B742          ;$01B6C5	|
	BCC CODE_01B6E4               ;$01B6C8	|
	BRA CODE_01B6E1               ;$01B6CA	|

CODE_01B6CC:
	LDA.W $6894                   ;$01B6CC	|
	CLC                           ;$01B6CF	|
	ADC.W #$0035                  ;$01B6D0	|
	SBC.B $02                     ;$01B6D3	|
	BMI CODE_01B6E4               ;$01B6D5	|
	CMP.W #$0068                  ;$01B6D7	|
	BCS CODE_01B6E4               ;$01B6DA	|

CODE_01B6DC:
	JSR.W CODE_FN_01B765          ;$01B6DC	|
	BCC CODE_01B6E4               ;$01B6DF	|

CODE_01B6E1:
	JMP.W CODE_JP_01B66F          ;$01B6E1	|

CODE_01B6E4:
	LDA.W $6240                   ;$01B6E4	|
	BMI CODE_01B73F               ;$01B6E7	|
	LDA.W $6910                   ;$01B6E9	|
	CLC                           ;$01B6EC	|
	ADC.W #$001D                  ;$01B6ED	|
	SBC.B $04                     ;$01B6F0	|
	BMI CODE_01B717               ;$01B6F2	|
	CMP.W #$0030                  ;$01B6F4	|
	BCS CODE_01B72C               ;$01B6F7	|
	LDA.W $6896                   ;$01B6F9	|
	ADC.W #$001D                  ;$01B6FC	|
	SBC.B $02                     ;$01B6FF	|
	BMI CODE_01B73F               ;$01B701	|
	CMP.W #$0038                  ;$01B703	|
	BCS CODE_01B73F               ;$01B706	|
	LDA.W $36C6                   ;$01B708	|
	BIT.W #$0400                  ;$01B70B	|
	BNE CODE_01B73C               ;$01B70E	|
	BIT.W #$0800                  ;$01B710	|
	BNE CODE_01B727               ;$01B713	|
	BRA CODE_01B73F               ;$01B715	|

CODE_01B717:
	LDA.W $6896                   ;$01B717	|
	CLC                           ;$01B71A	|
	ADC.W #$0035                  ;$01B71B	|
	SBC.B $02                     ;$01B71E	|
	BMI CODE_01B73F               ;$01B720	|
	CMP.W #$0068                  ;$01B722	|
	BCS CODE_01B73F               ;$01B725	|

CODE_01B727:
	JSR.W CODE_FN_01B742          ;$01B727	|
	BRA CODE_01B73F               ;$01B72A	|

CODE_01B72C:
	LDA.W $6896                   ;$01B72C	|
	CLC                           ;$01B72F	|
	ADC.W #$0035                  ;$01B730	|
	SBC.B $02                     ;$01B733	|
	BMI CODE_01B73F               ;$01B735	|
	CMP.W #$0068                  ;$01B737	|
	BCS CODE_01B73F               ;$01B73A	|

CODE_01B73C:
	JSR.W CODE_FN_01B765          ;$01B73C	|

CODE_01B73F:
	JMP.W CODE_JP_01B66F          ;$01B73F	|

CODE_FN_01B742:
	LDX.B $02                     ;$01B742	|
	LDA.B $04                     ;$01B744	|
	SEC                           ;$01B746	|
	SBC.W #$0024                  ;$01B747	|
	TAY                           ;$01B74A	|
	JSL.L CODE_FL_01C62C          ;$01B74B	|
	TYX                           ;$01B74F	|
	BEQ CODE_01B757               ;$01B750	|
	TAX                           ;$01B752	|
	BMI CODE_01B757               ;$01B753	|
	CLC                           ;$01B755	|
	RTS                           ;$01B756	|

CODE_01B757:
	LDA.B $00                     ;$01B757	|
	AND.W #$0003                  ;$01B759	|
	ORA.W #$0004                  ;$01B75C	|
	STA.B $00                     ;$01B75F	|
	STZ.B $06                     ;$01B761	|
	SEC                           ;$01B763	|
	RTS                           ;$01B764	|

CODE_FN_01B765:
	LDX.B $02                     ;$01B765	|
	LDA.B $04                     ;$01B767	|
	CLC                           ;$01B769	|
	ADC.W #$0018                  ;$01B76A	|
	TAY                           ;$01B76D	|
	JSL.L CODE_FL_01C362          ;$01B76E	|
	TYX                           ;$01B772	|
	BEQ CODE_01B77C               ;$01B773	|
	CMP.W #$000C                  ;$01B775	|
	BCS CODE_01B77C               ;$01B778	|
	CLC                           ;$01B77A	|
	RTS                           ;$01B77B	|

CODE_01B77C:
    LDA.B $00                     ;$01B77C |
    AND.W #$0003                  ;$01B77E |
    ORA.W #$000C                  ;$01B781 |
    STA.B $00                     ;$01B784 |
    STZ.B $06                     ;$01B786 |
    SEC                           ;$01B788 |
    RTS                           ;$01B789 |

CODE_01B78A:
    LDX.B $06                     ;$01B78A |
    LDA.B $04                     ;$01B78C |
    SEC                           ;$01B78E |
    SBC.L DATA16_01B991,X         ;$01B78F |
    STA.B $04                     ;$01B793 |
    INX                           ;$01B795 |
    INX                           ;$01B796 |
    STX.B $06                     ;$01B797 |
    CPX.W #$0010                  ;$01B799 |
    BCC CODE_01B7AB               ;$01B79C |
    LDA.B $00                     ;$01B79E |
    AND.W #$0003                  ;$01B7A0 |
    ORA.W #$0008                  ;$01B7A3 |
    STA.B $00                     ;$01B7A6 |
    LDX.W #$0000                  ;$01B7A8 |

CODE_01B7AB:
	CPX.W #$0002                  ;$01B7AB	|
	BEQ CODE_01B7B8               ;$01B7AE	|
	CPX.W #$0008                  ;$01B7B0	|
	BEQ CODE_01B7B8               ;$01B7B3	|
	JMP.W CODE_JP_01B66F          ;$01B7B5	|

CODE_01B7B8:
    LDA.W #$000D                  ;$01B7B8 |
    JSL.L PlaySFX          ;$01B7BB |
    JMP.W CODE_JP_01B66F          ;$01B7BF |

CODE_01B7C2:
    LDA.B $06                     ;$01B7C2 |
    INC A                         ;$01B7C4 |
    INC A                         ;$01B7C5 |
    STA.B $06                     ;$01B7C6 |
    CMP.W #$0078                  ;$01B7C8 |
    BCC CODE_01B7D0               ;$01B7CB |
    JSR.W CODE_FN_01B93C          ;$01B7CD |

CODE_01B7D0:
	LDA.B $04                     ;$01B7D0	|
	SEC                           ;$01B7D2	|
	SBC.W #$0003                  ;$01B7D3	|
	STA.B $04                     ;$01B7D6	|
	LDX.B $02                     ;$01B7D8	|
	SEC                           ;$01B7DA	|
	SBC.W #$0024                  ;$01B7DB	|
	TAY                           ;$01B7DE	|
	JSL.L CODE_FL_01C62C          ;$01B7DF	|
	TYX                           ;$01B7E3	|
	BEQ CODE_01B7EC               ;$01B7E4	|
	TAX                           ;$01B7E6	|
	BMI CODE_01B7EC               ;$01B7E7	|
	JMP.W CODE_JP_01B8EC          ;$01B7E9	|

CODE_01B7EC:
	STZ.B $08                     ;$01B7EC	|
	CMP.W #$FFE8                  ;$01B7EE	|
	BCC CODE_01B7F8               ;$01B7F1	|
	LDA.W #$8000                  ;$01B7F3	|
	STA.B $08                     ;$01B7F6	|

CODE_01B7F8:
	LDA.W $36C4                   ;$01B7F8	|
	ORA.W $36C6                   ;$01B7FB	|
	BIT.W #$0800                  ;$01B7FE	|
	BNE CODE_01B83D               ;$01B801	|
	LDA.B $02                     ;$01B803	|
	CLC                           ;$01B805	|
	ADC.W #$0030                  ;$01B806	|
	TAX                           ;$01B809	|
	LDA.B $04                     ;$01B80A	|
	CLC                           ;$01B80C	|
	ADC.W #$0018                  ;$01B80D	|
	TAY                           ;$01B810	|
	JSL.L CODE_FL_01C362          ;$01B811	|
	TYX                           ;$01B815	|
	BEQ CODE_01B820               ;$01B816	|
	CMP.W #$0006                  ;$01B818	|
	BCS CODE_01B820               ;$01B81B	|
	JMP.W CODE_JP_01B8EC          ;$01B81D	|

CODE_01B820:
	LDA.B $02                     ;$01B820	|
	SEC                           ;$01B822	|
	SBC.W #$0030                  ;$01B823	|
	TAX                           ;$01B826	|
	LDA.B $04                     ;$01B827	|
	CLC                           ;$01B829	|
	ADC.W #$0018                  ;$01B82A	|
	TAY                           ;$01B82D	|
	JSL.L CODE_FL_01C362          ;$01B82E	|
	TYX                           ;$01B832	|
	BEQ CODE_01B83D               ;$01B833	|
	CMP.W #$0006                  ;$01B835	|
	BCS CODE_01B83D               ;$01B838	|
	JMP.W CODE_JP_01B8EC          ;$01B83A	|

CODE_01B83D:
    JMP.W CODE_JP_01B66F          ;$01B83D |

CODE_01B840:
    LDX.B $06                     ;$01B840 |
    LDA.B $04                     ;$01B842 |
    CLC                           ;$01B844 |
    ADC.L DATA16_01B991,X         ;$01B845 |
    STA.B $04                     ;$01B849 |
    INX                           ;$01B84B |
    INX                           ;$01B84C |
    CPX.W #$0010                  ;$01B84D |
    BCC CODE_01B85F               ;$01B850 |
    LDA.B $00                     ;$01B852 |
    AND.W #$0003                  ;$01B854 |
    ORA.W #$0010                  ;$01B857 |
    STA.B $00                     ;$01B85A |
    LDX.W #$0000                  ;$01B85C |

CODE_01B85F:
	STX.B $06                     ;$01B85F	|
	CPX.W #$0002                  ;$01B861	|
	BEQ CODE_01B86E               ;$01B864	|
	CPX.W #$0008                  ;$01B866	|
	BEQ CODE_01B86E               ;$01B869	|
	JMP.W CODE_JP_01B66F          ;$01B86B	|

CODE_01B86E:
    LDA.W #$000D                  ;$01B86E |
    JSL.L PlaySFX          ;$01B871 |
    JMP.W CODE_JP_01B66F          ;$01B875 |

CODE_01B878:
    LDA.B $06                     ;$01B878 |
    INC A                         ;$01B87A |
    INC A                         ;$01B87B |
    STA.B $06                     ;$01B87C |
    CMP.W #$0078                  ;$01B87E |
    BCC CODE_01B886               ;$01B881 |
    JSR.W CODE_FN_01B93C          ;$01B883 |

CODE_01B886:
	LDA.B $04                     ;$01B886	|
	CLC                           ;$01B888	|
	ADC.W #$0003                  ;$01B889	|
	STA.B $04                     ;$01B88C	|
	LDX.B $02                     ;$01B88E	|
	LDA.B $04                     ;$01B890	|
	CLC                           ;$01B892	|
	ADC.W #$001C                  ;$01B893	|
	TAY                           ;$01B896	|
	JSL.L CODE_FL_01C362          ;$01B897	|
	TYX                           ;$01B89B	|
	BEQ CODE_01B8AA               ;$01B89C	|
	TAX                           ;$01B89E	|
	BMI CODE_JP_01B8EC            ;$01B89F	|
	STZ.B $08                     ;$01B8A1	|
	CMP.W #$0018                  ;$01B8A3	|
	BCS CODE_01B8AA               ;$01B8A6	|
	INC.B $08                     ;$01B8A8	|

CODE_01B8AA:
	LDA.W $36C4                   ;$01B8AA	|
	ORA.W $36C6                   ;$01B8AD	|
	BIT.W #$0400                  ;$01B8B0	|
	BNE CODE_01B8E9               ;$01B8B3	|
	LDA.B $02                     ;$01B8B5	|
	CLC                           ;$01B8B7	|
	ADC.W #$0030                  ;$01B8B8	|
	TAX                           ;$01B8BB	|
	LDA.B $04                     ;$01B8BC	|
	CLC                           ;$01B8BE	|
	ADC.W #$0018                  ;$01B8BF	|
	TAY                           ;$01B8C2	|
	JSL.L CODE_FL_01C362          ;$01B8C3	|
	TYX                           ;$01B8C7	|
	BEQ CODE_01B8CF               ;$01B8C8	|
	CMP.W #$FFFA                  ;$01B8CA	|
	BCS CODE_JP_01B8EC            ;$01B8CD	|

CODE_01B8CF:
	LDA.B $02                     ;$01B8CF	|
	SEC                           ;$01B8D1	|
	SBC.W #$0030                  ;$01B8D2	|
	TAX                           ;$01B8D5	|
	LDA.B $04                     ;$01B8D6	|
	CLC                           ;$01B8D8	|
	ADC.W #$0018                  ;$01B8D9	|
	TAY                           ;$01B8DC	|
	JSL.L CODE_FL_01C362          ;$01B8DD	|
	TYX                           ;$01B8E1	|
	BEQ CODE_01B8E9               ;$01B8E2	|
	CMP.W #$FFFA                  ;$01B8E4	|
	BCS CODE_JP_01B8EC            ;$01B8E7	|

CODE_01B8E9:
	JMP.W CODE_JP_01B66F          ;$01B8E9	|

CODE_JP_01B8EC:
    CLC                           ;$01B8EC |
    ADC.B $04                     ;$01B8ED |
    STA.B $04                     ;$01B8EF |
    STZ.B $06                     ;$01B8F1 |
    LDA.B $00                     ;$01B8F3 |
    AND.W #$0003                  ;$01B8F5 |
    ORA.W #$0014                  ;$01B8F8 |
    STA.B $00                     ;$01B8FB |
    JMP.W CODE_JP_01B66F          ;$01B8FD |

CODE_01B900:
    LDX.B $06                     ;$01B900 |
    LDA.B $02                     ;$01B902 |
    CLC                           ;$01B904 |
    ADC.L DATA16_01B9AF,X         ;$01B905 |
    STA.B $02                     ;$01B909 |
    INX                           ;$01B90B |
    INX                           ;$01B90C |
    CPX.W #$0010                  ;$01B90D |
    BCC CODE_01B919               ;$01B910 |
    LDA.B $00                     ;$01B912 |
    AND.W #$0003                  ;$01B914 |
    STA.B $00                     ;$01B917 |

CODE_01B919:
	STX.B $06                     ;$01B919	|
	CPX.W #$0002                  ;$01B91B	|
	BEQ CODE_01B928               ;$01B91E	|
	CPX.W #$0004                  ;$01B920	|
	BEQ CODE_01B932               ;$01B923	|
	JMP.W CODE_JP_01B66F          ;$01B925	|

CODE_01B928:
	LDA.W #$000D                  ;$01B928	|
	JSL.L PlaySFX          ;$01B92B	|
	JMP.W CODE_JP_01B66F          ;$01B92F	|

CODE_01B932:
	LDA.W #$0007                  ;$01B932	|
	JSL.L PlaySFX          ;$01B935	|
	JMP.W CODE_JP_01B66F          ;$01B939	|

CODE_FN_01B93C:
	STZ.B $06                     ;$01B93C	|
	LDA.W $690E                   ;$01B93E	|
	CLC                           ;$01B941	|
	ADC.W #$001D                  ;$01B942	|
	SBC.B $04                     ;$01B945	|
	BMI CODE_01B94F               ;$01B947	|
	CMP.W #$0030                  ;$01B949	|
	BCS CODE_01B96C               ;$01B94C	|

CODE_01B94E:
	RTS                           ;$01B94E	|

CODE_01B94F:
	LDA.B $00                     ;$01B94F	|
	AND.W #$FFFC                  ;$01B951	|
	CMP.W #$0008                  ;$01B954	|
	BEQ CODE_01B94E               ;$01B957	|
	LDA.W $6894                   ;$01B959	|
	CLC                           ;$01B95C	|
	ADC.W #$0035                  ;$01B95D	|
	SBC.B $02                     ;$01B960	|
	BMI CODE_01B94E               ;$01B962	|
	CMP.W #$0068                  ;$01B964	|
	BCS CODE_01B94E               ;$01B967	|
	JMP.W CODE_FN_01B742          ;$01B969	|

CODE_01B96C:
	LDA.B $00                     ;$01B96C	|
	AND.W #$FFFC                  ;$01B96E	|
	CMP.W #$0010                  ;$01B971	|
	BEQ CODE_01B94E               ;$01B974	|
	LDA.W $6894                   ;$01B976	|
	CLC                           ;$01B979	|
	ADC.W #$0035                  ;$01B97A	|
	SBC.B $02                     ;$01B97D	|
	BMI CODE_01B94E               ;$01B97F	|
	CMP.W #$0068                  ;$01B981	|
	BCS CODE_01B94E               ;$01B984	|
	JMP.W CODE_FN_01B765          ;$01B986	|

CODE_01B989:
	STY.W LOOSE_OP_00F0DC         ;$01B989	|
	JML.W [Reset_SNES_Debug_skipBG1Read] ;$01B98C	|
	dw $DDE5                      ;$01B98F |

DATA16_01B991:
    dw $0001,$0001,$0000,$0001    ;$01B991 |
    dw $0001,$0002,$0001,$0001    ;$01B999 |
    dw $0002,$0003,$0002,$0002    ;$01B9A1 |
    dw $0003,$0002,$0003          ;$01B9A9 |

DATA16_01B9AF:
    dw $FFFF,$0001,$0001,$FFFF    ;$01B9AF |
    dw $FFFF,$0001,$0001,$FFFF    ;$01B9B7 |

CODE_JP_01B9BF:
	RTL                           ;$01B9BF	|
	LDY.B $4D                     ;$01B9C0	|
	LDA.W $103C,Y                 ;$01B9C2	|
	CMP.W #$FFFF                  ;$01B9C5	|
	BEQ CODE_81BA11               ;$01B9C8	|
	AND.W #$0F00                  ;$01B9CA	|
	STA.B $00                     ;$01B9CD	|
	LDX.W $105C,Y                 ;$01B9CF	|
	STX.B $02                     ;$01B9D2	|
	LDA.W $107C,Y                 ;$01B9D4	|
	STA.B $04                     ;$01B9D7	|
	CLC                           ;$01B9D9	|
	ADC.W #$0018                  ;$01B9DA	|
	TAY                           ;$01B9DD	|
	LDA.B $00                     ;$01B9DE	|
	BEQ CODE_01BA10               ;$01B9E0	|
	JSL.L CODE_FL_01CE20          ;$01B9E2	|
	CMP.W #$0000                  ;$01B9E6	|
	BNE CODE_01BA10               ;$01B9E9	|
	LDY.B $4D                     ;$01B9EB	|

CODE_01B9ED:
	CPY.W #$0020                  ;$01B9ED	|
	BCS CODE_01BA0A               ;$01B9F0	|
	LDA.W $105E,Y                 ;$01B9F2	|
	STA.W $105C,Y                 ;$01B9F5	|
	LDA.W $107E,Y                 ;$01B9F8	|
	STA.W $107C,Y                 ;$01B9FB	|
	LDA.W $103E,Y                 ;$01B9FE	|
	STA.W $103C,Y                 ;$01BA01	|
	BMI CODE_01BA10               ;$01BA04	|
	INY                           ;$01BA06	|
	INY                           ;$01BA07	|
	BRA CODE_01B9ED               ;$01BA08	|

CODE_01BA0A:
	LDA.W #$FFFF                  ;$01BA0A	|
	STA.W $103C,Y                 ;$01BA0D	|

CODE_01BA10:
	RTL                           ;$01BA10	|

CODE_81BA11:
	STA.B $00                     ;$01BA11	|
	RTL                           ;$01BA13	|
	LDA.W $109C                   ;$01BA14	|
	STA.B $00                     ;$01BA17	|
	BMI CODE_81BA7D               ;$01BA19	|
	LDX.W $111C                   ;$01BA1B	|
	DEC.W $111E                   ;$01BA1E	|
	BNE CODE_01BA3E               ;$01BA21	|
	INX                           ;$01BA23	|
	INX                           ;$01BA24	|
	LDA.L DATA8_01C153,X          ;$01BA25	|
	AND.W #$00FF                  ;$01BA29	|
	BNE CODE_01BA38               ;$01BA2C	|
	LDX.W #$0000                  ;$01BA2E	|
	LDA.L DATA8_01C153            ;$01BA31	|
	AND.W #$00FF                  ;$01BA35	|

CODE_01BA38:
	STA.W $111E                   ;$01BA38	|
	STX.W $111C                   ;$01BA3B	|

CODE_01BA3E:
	STX.B $06                     ;$01BA3E	|
	LDX.W #$0000                  ;$01BA40	|
	BRA CODE_01BA4E               ;$01BA43	|
	LDX.B $4D                     ;$01BA45	|
	LDA.W $109C,X                 ;$01BA47	|
	STA.B $00                     ;$01BA4A	|
	BMI CODE_81BA7D               ;$01BA4C	|

CODE_01BA4E:
	LDA.W $10BC,X                 ;$01BA4E	|
	STA.B $02                     ;$01BA51	|
	LDA.W $10DC,X                 ;$01BA53	|
	STA.B $04                     ;$01BA56	|
	LDA.B $00                     ;$01BA58	|
	BIT.W #$FF00                  ;$01BA5A	|
	BEQ CODE_81BA7D               ;$01BA5D	|
	BIT.W #$00FF                  ;$01BA5F	|
	BEQ CODE_81BA7D               ;$01BA62	|
	LDY.W $10FC,X                 ;$01BA64	|
	DEY                           ;$01BA67	|
	BPL CODE_01BA79               ;$01BA68	|
	SEC                           ;$01BA6A	|
	SBC.W #$0100                  ;$01BA6B	|
	STA.W $109C,X                 ;$01BA6E	|
	AND.W #$FF00                  ;$01BA71	|
	BEQ CODE_01BA79               ;$01BA74	|
	LDY.W #$0005                  ;$01BA76	|

CODE_01BA79:
	TYA                           ;$01BA79	|
	STA.W $10FC,X                 ;$01BA7A	|

CODE_81BA7D:
	RTL                           ;$01BA7D	|
	LDY.B $4D                     ;$01BA7E	|
	LDA.W $1120,Y                 ;$01BA80	|
	BMI CODE_81BAC3               ;$01BA83	|
	ASL A                         ;$01BA85	|
	TAX                           ;$01BA86	|
	LDA.W $1138,Y                 ;$01BA87	|
	INC A                         ;$01BA8A	|
	CMP.L DATA16_01BAC6,X          ;$01BA8B	|
	BCC CODE_01BAC0               ;$01BA8F	|
	LDA.L DATA16_01BAD2,X          ;$01BA91	|
	STA.B $02                     ;$01BA95	|

CODE_01BA97:
	LDA.B $02                     ;$01BA97	|
	JSL.L CallRNG_ModA            ;$01BA99	|
	CMP.W $1140,Y                 ;$01BA9D	|
	BEQ CODE_01BA97               ;$01BAA0	|
	CMP.W $1148,Y                 ;$01BAA2	|
	BEQ CODE_01BA97               ;$01BAA5	|
	LDX.W $1140,Y                 ;$01BAA7	|
	STA.W $1140,Y                 ;$01BAAA	|
	STA.B $02                     ;$01BAAD	|
	TXA                           ;$01BAAF	|
	STA.W $1148,Y                 ;$01BAB0	|
	LDA.W $1128,Y                 ;$01BAB3	|
	STA.B $04                     ;$01BAB6	|
	LDA.W $1130,Y                 ;$01BAB8	|
	STA.B $06                     ;$01BABB	|
	LDA.W #$0000                  ;$01BABD	|

CODE_01BAC0:
	STA.W $1138,Y                 ;$01BAC0	|

CODE_81BAC3:
	STA.B $00                     ;$01BAC3	|
	RTL                           ;$01BAC5	|

DATA16_01BAC6:
    dw $003C,$0028,$0014,$003C    ;$01BAC6 |
    dw $0028,$0014                ;$01BACE |

DATA16_01BAD2:
    dw $0004,$0004,$0004,$0007    ;$01BAD2 |
    dw $0007,$0007                ;$01BADA |

	LDY.B $4D                     ;$01BADE	|
	LDA.W $1150,Y                 ;$01BAE0	|
	STA.B $00                     ;$01BAE3	|
	BMI CODE_81BB08               ;$01BAE5	|
	LDA.W $1210,Y                 ;$01BAE7	|
	STA.B $08                     ;$01BAEA	|
	LDA.W $1230,Y                 ;$01BAEC	|
	STA.B $0A                     ;$01BAEF	|
	LDA.W $1170,Y                 ;$01BAF1	|
	STA.B $14                     ;$01BAF4	|
	LDA.W $1190,Y                 ;$01BAF6	|
	STA.W $11F0,Y                 ;$01BAF9	|
	STA.B $16                     ;$01BAFC	|
	LDA.W $11B0,Y                 ;$01BAFE	|
	STA.B $18                     ;$01BB01	|
	LDA.W $11D0,Y                 ;$01BB03	|
	STA.B $1A                     ;$01BB06	|

CODE_81BB08:
	RTL                           ;$01BB08	|
	LDY.B $4D                     ;$01BB09	|
	LDA.B $00                     ;$01BB0B	|
	STA.W $1150,Y                 ;$01BB0D	|
	LDA.B $08                     ;$01BB10	|
	STA.W $1210,Y                 ;$01BB12	|
	LDA.B $0A                     ;$01BB15	|
	STA.W $1230,Y                 ;$01BB17	|
	LDA.B $14                     ;$01BB1A	|
	STA.W $1170,Y                 ;$01BB1C	|
	LDA.B $16                     ;$01BB1F	|
	STA.W $1190,Y                 ;$01BB21	|
	LDA.B $18                     ;$01BB24	|
	STA.W $11B0,Y                 ;$01BB26	|
	LDA.B $1A                     ;$01BB29	|
	STA.W $11D0,Y                 ;$01BB2B	|
	RTL                           ;$01BB2E	|
	LDY.B $4D                     ;$01BB2F	|
	LDA.W $1250,Y                 ;$01BB31	|
	STA.B $00                     ;$01BB34	|
	BMI CODE_81BB4C               ;$01BB36	|
	LDA.W $1258,Y                 ;$01BB38	|
	STA.B $02                     ;$01BB3B	|
	LDA.W $1260,Y                 ;$01BB3D	|
	STA.B $04                     ;$01BB40	|
	LDA.W $1268,Y                 ;$01BB42	|
	STA.B $06                     ;$01BB45	|
	LDA.W $1270,Y                 ;$01BB47	|
	STA.B $08                     ;$01BB4A	|

CODE_81BB4C:
	RTL                           ;$01BB4C	|
	LDY.B $4D                     ;$01BB4D	|
	LDA.B $00                     ;$01BB4F	|
	STA.W $1250,Y                 ;$01BB51	|
	LDA.B $02                     ;$01BB54	|
	STA.W $1258,Y                 ;$01BB56	|
	LDA.B $04                     ;$01BB59	|
	STA.W $1260,Y                 ;$01BB5B	|
	LDA.B $06                     ;$01BB5E	|
	STA.W $1268,Y                 ;$01BB60	|
	LDA.B $08                     ;$01BB63	|
	STA.W $1270,Y                 ;$01BB65	|
	RTL                           ;$01BB68	|

CODE_FN_01BB69:
	LDA.B $49                     ;$01BB69	|
	AND.W #$00FF                  ;$01BB6B	|
	CMP.W #$0002                  ;$01BB6E	|
	BCC CODE_81BBD3               ;$01BB71	|
	LDY.W #$0000                  ;$01BB73	|

CODE_01BB76:
	LDA.W $103C,Y                 ;$01BB76	|
	BMI CODE_81BBD3               ;$01BB79	|
	AND.W #$0F00                  ;$01BB7B	|
	BNE CODE_01BBCC               ;$01BB7E	|
	LDA.W $105C,Y                 ;$01BB80	|
	CLC                           ;$01BB83	|
	ADC.W #$000C                  ;$01BB84	|
	CMP.B $2E                     ;$01BB87	|
	BCC CODE_01BBCC               ;$01BB89	|
	LDA.W $105C,Y                 ;$01BB8B	|
	SBC.W #$000C                  ;$01BB8E	|
	CMP.B $30                     ;$01BB91	|
	BCS CODE_01BBCC               ;$01BB93	|
	LDA.W $107C,Y                 ;$01BB95	|
	ADC.W #$000C                  ;$01BB98	|
	CMP.B $32                     ;$01BB9B	|
	BCC CODE_01BBCC               ;$01BB9D	|
	LDA.W $107C,Y                 ;$01BB9F	|
	SBC.W #$000C                  ;$01BBA2	|
	CMP.B $34                     ;$01BBA5	|
	BCS CODE_01BBCC               ;$01BBA7	|
	PHY                           ;$01BBA9	|
	LDA.W $103C,Y                 ;$01BBAA	|
	ORA.W #$0100                  ;$01BBAD	|
	STA.W $103C,Y                 ;$01BBB0	|
	AND.W #$00FF                  ;$01BBB3	|
	TAX                           ;$01BBB6	|
	LDA.W #$0000                  ;$01BBB7	|
	JSL.L CODE_FL_CF2E10          ;$01BBBA	|
	JSR.W CODE_FN_01C1E0          ;$01BBBE	|
	LDA.W #$0004                  ;$01BBC1	|
	LDX.W #$001F                  ;$01BBC4	|
	JSL.L CODE_FL_009AEB          ;$01BBC7	|
	PLY                           ;$01BBCB	|

CODE_01BBCC:
	INY                           ;$01BBCC	|
	INY                           ;$01BBCD	|
	CPY.W #$0020                  ;$01BBCE	|
	BCC CODE_01BB76               ;$01BBD1	|

CODE_81BBD3:
	LDY.W #$0000                  ;$01BBD3	|

CODE_01BBD6:
	LDA.W $109C,Y                 ;$01BBD6	|
	BMI CODE_81BC42               ;$01BBD9	|
	LDA.W $10BC,Y                 ;$01BBDB	|
	CLC                           ;$01BBDE	|
	ADC.W #$0004                  ;$01BBDF	|
	CMP.B $2E                     ;$01BBE2	|
	BCC CODE_01BC3B               ;$01BBE4	|
	LDA.W $10BC,Y                 ;$01BBE6	|
	SBC.W #$0004                  ;$01BBE9	|
	CMP.B $30                     ;$01BBEC	|
	BCS CODE_01BC3B               ;$01BBEE	|
	LDA.W $10DC,Y                 ;$01BBF0	|
	ADC.W #$0004                  ;$01BBF3	|
	CMP.B $32                     ;$01BBF6	|
	BCC CODE_01BC3B               ;$01BBF8	|
	LDA.W $10DC,Y                 ;$01BBFA	|
	SBC.W #$0004                  ;$01BBFD	|
	CMP.B $34                     ;$01BC00	|
	BCS CODE_01BC3B               ;$01BC02	|
	LDA.B $49                     ;$01BC04	|
	AND.W #$FF00                  ;$01BC06	|
	CMP.W #$0200                  ;$01BC09	|
	BEQ CODE_01BC32               ;$01BC0C	|
	CMP.W #$0800                  ;$01BC0E	|
	BEQ CODE_01BC32               ;$01BC11	|
	CMP.W #$0100                  ;$01BC13	|
	BNE CODE_01BC3B               ;$01BC16	|
	LDA.W $109C,Y                 ;$01BC18	|
	AND.W #$00FF                  ;$01BC1B	|
	ORA.W #$0400                  ;$01BC1E	|
	STA.W $109C,Y                 ;$01BC21	|
	AND.W #$00FF                  ;$01BC24	|
	ASL A                         ;$01BC27	|
	TAX                           ;$01BC28	|
	LDA.L DATA16_01BC92,X         ;$01BC29	|
	STA.W $10FC,Y                 ;$01BC2D	|
	BRA CODE_01BC3B               ;$01BC30	|

CODE_01BC32:
	LDA.W $109C,Y                 ;$01BC32	|
	AND.W #$00FF                  ;$01BC35	|
	STA.W $109C,Y                 ;$01BC38	|

CODE_01BC3B:
	INY                           ;$01BC3B	|
	INY                           ;$01BC3C	|
	CPY.W #$0020                  ;$01BC3D	|
	BCC CODE_01BBD6               ;$01BC40	|

CODE_81BC42:
	LDX.W #$0000                  ;$01BC42	|

CODE_01BC45:
	LDA.W $1150,X                 ;$01BC45	|
	BMI CODE_81BC91               ;$01BC48	|
	AND.W #$2000                  ;$01BC4A	|
	BEQ CODE_01BC8A               ;$01BC4D	|
	LDA.W $1210,X                 ;$01BC4F	|
	BEQ CODE_01BC8A               ;$01BC52	|
	ORA.W #$1800                  ;$01BC54	|
	STA.W HW_WRMPYA                   ;$01BC57	|
	LDA.W $1190,X                 ;$01BC5A	|
	CLC                           ;$01BC5D	|
	ADC.W #$0004                  ;$01BC5E	|
	CMP.B $2E                     ;$01BC61	|
	BCC CODE_01BC8A               ;$01BC63	|
	LDA.W $1190,X                 ;$01BC65	|
	SBC.W #$0004                  ;$01BC68	|
	CMP.B $30                     ;$01BC6B	|
	BCS CODE_01BC8A               ;$01BC6D	|
	LDA.W $11D0,X                 ;$01BC6F	|
	CMP.B $32                     ;$01BC72	|
	BCC CODE_01BC8A               ;$01BC74	|
	SBC.W HW_RDMPY                   ;$01BC76	|
	CMP.B $34                     ;$01BC79	|
	BCS CODE_01BC8A               ;$01BC7B	|
	LDA.B $49                     ;$01BC7D	|
	AND.W #$FF00                  ;$01BC7F	|
	CMP.W #$0800                  ;$01BC82	|
	BNE CODE_01BC8A               ;$01BC85	|
	STZ.W $1210,X                 ;$01BC87	|

CODE_01BC8A:
	INX                           ;$01BC8A	|
	INX                           ;$01BC8B	|
	CPX.W #$0020                  ;$01BC8C	|
	BCC CODE_01BC45               ;$01BC8F	|

CODE_81BC91:
	RTS                           ;$01BC91	|

DATA16_01BC92:
	dw $0000,$012C,$0258          ;$01BC92 |

	LDX.B $02                     ;$01BC98	|
	LDY.W #$0000                  ;$01BC9A	|

CODE_01BC9D:
	LDA.W $1150,Y                 ;$01BC9D	|
	BMI CODE_81BCC8               ;$01BCA0	|
	AND.W #$3FFF                  ;$01BCA2	|
	CMP.W #$2000                  ;$01BCA5	|
	BNE CODE_01BCC1               ;$01BCA8	|
	JSR.W CODE_FN_01BD54          ;$01BCAA	|
	BCC CODE_01BCC1               ;$01BCAD	|
	LDA.W $11D0,Y                 ;$01BCAF	|
	ADC.B $0E                     ;$01BCB2	|
	ADC.W #$0008                  ;$01BCB4	|
	SBC.W $6A00,X                 ;$01BCB7	|
	BEQ CODE_01BCC9               ;$01BCBA	|
	CMP.W #$000C                  ;$01BCBC	|
	BCC CODE_01BCC9               ;$01BCBF	|

CODE_01BCC1:
	INY                           ;$01BCC1	|
	INY                           ;$01BCC2	|
	CPY.W #$0020                  ;$01BCC3	|
	BCC CODE_01BC9D               ;$01BCC6	|

CODE_81BCC8:
	RTL                           ;$01BCC8	|

CODE_01BCC9:
	CLC                           ;$01BCC9	|
	ADC.W $6A00,X                 ;$01BCCA	|
	STA.W $6A00,X                 ;$01BCCD	|
	STZ.W $6BE8,X                 ;$01BCD0	|
	LDA.W #$8000                  ;$01BCD3	|
	STA.B $0C                     ;$01BCD6	|
	RTL                           ;$01BCD8	|
	LDX.B $02                     ;$01BCD9	|
	LDY.W #$0000                  ;$01BCDB	|

CODE_81BCDE:
	LDA.W $1150,Y                 ;$01BCDE	|
	BMI CODE_81BD10               ;$01BCE1	|
	AND.W #$3FFF                  ;$01BCE3	|
	CMP.W #$2001                  ;$01BCE6	|
	BCS CODE_81BD09               ;$01BCE9	|
	JSR.W CODE_FN_01BD54          ;$01BCEB	|
	BCC CODE_81BD09               ;$01BCEE	|
	LDA.W $11D0,Y                 ;$01BCF0	|
	SBC.B $0E                     ;$01BCF3	|
	SBC.W $6A00,X                 ;$01BCF5	|
	BEQ CODE_01BD11               ;$01BCF8	|
	CMP.W #$FFF4                  ;$01BCFA	|
	BCS CODE_01BD11               ;$01BCFD	|
	BIT.W $33B2                   ;$01BCFF	|
	BMI CODE_81BD09               ;$01BD02	|
	CMP.W #$000C                  ;$01BD04	|
	BCC CODE_01BD11               ;$01BD07	|

CODE_81BD09:
	INY                           ;$01BD09	|
	INY                           ;$01BD0A	|
	CPY.W #$0020                  ;$01BD0B	|
	BCC CODE_81BCDE               ;$01BD0E	|

CODE_81BD10:
	RTL                           ;$01BD10	|

CODE_01BD11:
	CLC                           ;$01BD11	|
	ADC.W $6A00,X                 ;$01BD12	|
	STA.W $6A00,X                 ;$01BD15	|
	STZ.W $6BE8,X                 ;$01BD18	|
	LDA.W #$0001                  ;$01BD1B	|
	STA.B $0C                     ;$01BD1E	|
	LDA.W $1190,Y                 ;$01BD20	|
	SEC                           ;$01BD23	|
	SBC.W $11F0,Y                 ;$01BD24	|
	CLC                           ;$01BD27	|
	ADC.W $6986,X                 ;$01BD28	|
	STA.W $6986,X                 ;$01BD2B	|
	LDA.W $1150,Y                 ;$01BD2E	|
	AND.W #$3FFF                  ;$01BD31	|
	SEC                           ;$01BD34	|
	SBC.W #$0004                  ;$01BD35	|
	CMP.W #$0008                  ;$01BD38	|
	BCS CODE_01BD53               ;$01BD3B	|
	ASL A                         ;$01BD3D	|
	STA.W $1210,Y                 ;$01BD3E	|
	LDA.W #$0200                  ;$01BD41	|
	STA.W $1230,Y                 ;$01BD44	|
	LDA.W $1150,Y                 ;$01BD47	|
	AND.W #$4000                  ;$01BD4A	|
	ORA.W #$0103                  ;$01BD4D	|
	STA.W $1150,Y                 ;$01BD50	|

CODE_01BD53:
	RTL                           ;$01BD53	|

CODE_FN_01BD54:
	LDA.W $1150,Y                 ;$01BD54	|
	CMP.W #$000D                  ;$01BD57	|
	BEQ CODE_81BD8D               ;$01BD5A	|
	AND.W #$4000                  ;$01BD5C	|
	BNE CODE_81BD77               ;$01BD5F	|
	LDA.W $1190,Y                 ;$01BD61	|
	SEC                           ;$01BD64	|
	SBC.W #$0018                  ;$01BD65	|
	CMP.W $6986,X                 ;$01BD68	|
	BCS CODE_81BDA3               ;$01BD6B	|
	LDA.W $1190,Y                 ;$01BD6D	|
	ADC.W #$0018                  ;$01BD70	|
	CMP.W $6986,X                 ;$01BD73	|
	RTS                           ;$01BD76	|

CODE_81BD77:
	LDA.W $1190,Y                 ;$01BD77	|
	SEC                           ;$01BD7A	|
	SBC.W #$0020                  ;$01BD7B	|
	CMP.W $6986,X                 ;$01BD7E	|
	BCS CODE_81BDA3               ;$01BD81	|
	LDA.W $1190,Y                 ;$01BD83	|
	ADC.W #$0020                  ;$01BD86	|
	CMP.W $6986,X                 ;$01BD89	|
	RTS                           ;$01BD8C	|

CODE_81BD8D:
	LDA.W $1190,Y                 ;$01BD8D	|
	SEC                           ;$01BD90	|
	SBC.W #$000C                  ;$01BD91	|
	CMP.W $6986,X                 ;$01BD94	|
	BCS CODE_81BDA3               ;$01BD97	|
	LDA.W $1190,Y                 ;$01BD99	|
	ADC.W #$000C                  ;$01BD9C	|
	CMP.W $6986,X                 ;$01BD9F	|
	RTS                           ;$01BDA2	|

CODE_81BDA3:
	CLC                           ;$01BDA3	|
	RTS                           ;$01BDA4	|
	LDX.B $00                     ;$01BDA5	|
	LDA.L DATA16_01DA07,X         ;$01BDA7	|
	STA.B $0E                     ;$01BDAB	|
	STZ.B $0C                     ;$01BDAD	|
	LDX.B $02                     ;$01BDAF	|
	LDY.W #$0000                  ;$01BDB1	|

CODE_81BDB4:
	LDA.W $1250,Y                 ;$01BDB4	|
	BMI CODE_81BDD7               ;$01BDB7	|
	LDA.W $1258,Y                 ;$01BDB9	|
	SEC                           ;$01BDBC	|
	SBC.W #$0020                  ;$01BDBD	|
	CMP.W $6986,X                 ;$01BDC0	|
	BCS CODE_81BDD0               ;$01BDC3	|
	LDA.W $1258,Y                 ;$01BDC5	|
	ADC.W #$0020                  ;$01BDC8	|
	CMP.W $6986,X                 ;$01BDCB	|
	BCS CODE_01BDD8               ;$01BDCE	|

CODE_81BDD0:
	INY                           ;$01BDD0	|
	INY                           ;$01BDD1	|
	CPY.W #$0008                  ;$01BDD2	|
	BCC CODE_81BDB4               ;$01BDD5	|

CODE_81BDD7:
	RTL                           ;$01BDD7	|

CODE_01BDD8:
	LDA.W $1260,Y                 ;$01BDD8	|
	SBC.B $0E                     ;$01BDDB	|
	ADC.W #$0016                  ;$01BDDD	|
	SBC.W $6A00,X                 ;$01BDE0	|
	BEQ CODE_01BE44               ;$01BDE3	|
	CMP.W #$FFF4                  ;$01BDE5	|
	BCS CODE_01BE44               ;$01BDE8	|
	BIT.W $33B2                   ;$01BDEA	|
	BMI CODE_01BDF4               ;$01BDED	|
	CMP.W #$000C                  ;$01BDEF	|
	BCC CODE_01BE44               ;$01BDF2	|

CODE_01BDF4:
	LDA.W $1270,Y                 ;$01BDF4	|
	BMI CODE_01BE15               ;$01BDF7	|
	LDA.W $1260,Y                 ;$01BDF9	|
	SBC.B $0E                     ;$01BDFC	|
	ADC.W #$FFDC                  ;$01BDFE	|
	SBC.W $6A00,X                 ;$01BE01	|
	BEQ CODE_01BE44               ;$01BE04	|
	CMP.W #$FFF4                  ;$01BE06	|
	BCS CODE_01BE44               ;$01BE09	|
	BIT.W $33B2                   ;$01BE0B	|
	BMI CODE_01BE15               ;$01BE0E	|
	CMP.W #$000C                  ;$01BE10	|
	BCC CODE_01BE44               ;$01BE13	|

CODE_01BE15:
	LDA.W $1270,Y                 ;$01BE15	|
	AND.W #$0001                  ;$01BE18	|
	BNE CODE_01BE2F               ;$01BE1B	|
	LDA.W $1260,Y                 ;$01BE1D	|
	ADC.B $0E                     ;$01BE20	|
	ADC.W #$001A                  ;$01BE22	|
	SBC.W $6A00,X                 ;$01BE25	|
	BEQ CODE_01BE2F               ;$01BE28	|
	CMP.W #$000C                  ;$01BE2A	|
	BCC CODE_01BE49               ;$01BE2D	|

CODE_01BE2F:
	LDA.W $1260,Y                 ;$01BE2F	|
	ADC.B $0E                     ;$01BE32	|
	ADC.W #$FFE5                  ;$01BE34	|
	SBC.W $6A00,X                 ;$01BE37	|
	BEQ CODE_01BE41               ;$01BE3A	|
	CMP.W #$000C                  ;$01BE3C	|
	BCC CODE_01BE49               ;$01BE3F	|

CODE_01BE41:
	JMP.W CODE_81BDD0             ;$01BE41	|

CODE_01BE44:
	LDY.W #$0001                  ;$01BE44	|
	BRA CODE_01BE4C               ;$01BE47	|

CODE_01BE49:
	LDY.W #$8000                  ;$01BE49	|

CODE_01BE4C:
	CLC                           ;$01BE4C	|
	ADC.W $6A00,X                 ;$01BE4D	|
	STA.W $6A00,X                 ;$01BE50	|
	STZ.W $6BE8,X                 ;$01BE53	|
	STY.B $0C                     ;$01BE56	|
	RTL                           ;$01BE58	|
	LDA.W #$0001                  ;$01BE59	|
	JSL.L CODE_FL_D03D02          ;$01BE5C	|
	LDA.W #$9EE4                  ;$01BE60	|
	LDX.W #$00C5                  ;$01BE63	|
	JSL.L CODE_FL_00E1CC          ;$01BE66	|
	LDA.W #$0070                  ;$01BE6A	|
	STA.W $64B6,Y                 ;$01BE6D	|
	LDA.W #$AB78                  ;$01BE70	|
	STA.W $6630,Y                 ;$01BE73	|
	LDA.W #$A708                  ;$01BE76	|
	STA.W $66AA,Y                 ;$01BE79	|
	LDA.W #$0012                  ;$01BE7C	|
	STA.W $6436,Y                 ;$01BE7F	|
	LDA.W #$BEFE                  ;$01BE82	|
	LDX.W #$0001                  ;$01BE85	|
	JSL.L CODE_FL_00E1B7          ;$01BE88	|
	LDA.W #$0030                  ;$01BE8C	|
	LDX.W #$0020                  ;$01BE8F	|
	JSL.L CODE_FL_00E5F3          ;$01BE92	|
	TYX                           ;$01BE96	|
	STZ.W $6CDC,X                 ;$01BE97	|

CODE_01BE9A:
    JSL.L CODE_FL_00E091          ;$01BE9A |
    BRA CODE_01BE9A               ;$01BE9E |
    LDA.W #$BFE8                  ;$01BEA0 |
    LDX.W #$0001                  ;$01BEA3 |
    JSL.L CODE_FL_00E1B7          ;$01BEA6 |
    TYX                           ;$01BEAA |
    STZ.W $6CDC,X                 ;$01BEAB |
    LDA.W #$0080                  ;$01BEAE |
    LDX.W #$003C                  ;$01BEB1 |
    JSL.L CODE_FL_00E55E          ;$01BEB4 |
    JSL.L CODE_FL_00E47A          ;$01BEB8 |
    LDX.W #$0034                  ;$01BEBC |
    JSL.L CODE_FL_009AEB          ;$01BEBF |
    LDY.B $39                     ;$01BEC3 |
    JSL.L CODE_FL_00E0A3          ;$01BEC5 |
    LDX.W #$0034                  ;$01BEC9 |
    JSL.L CODE_FL_009AEB          ;$01BECC |

CODE_01BED0:
    LDA.W #$0000                  ;$01BED0 |
    JSL.L CODE_FL_CF7BCD          ;$01BED3 |
    JML.L DestroyUsedObject          ;$01BED7 |
    JSL.L CODE_FL_00E1BF          ;$01BEDB |
    JSL.L CODE_FL_00E465          ;$01BEDF |
    LDA.W #$0413                  ;$01BEE3 |
    JSL.L CODE_FL_00E169          ;$01BEE6 |
    TYX                           ;$01BEEA |
    INC.W $6436,X                 ;$01BEEB |
    JSL.L CODE_FL_00E0A3          ;$01BEEE |
    TYX                           ;$01BEF2 |
    INC.W $6436,X                 ;$01BEF3 |
    JSL.L CODE_FL_00E0A3          ;$01BEF6 |
    JML.L DestroyUsedObject          ;$01BEFA |
    LDX.W $6986,Y                 ;$01BEFE |
    LDA.W $6A00,Y                 ;$01BF01 |
    CMP.W #Room_Size_Y                  ;$01BF04 |
    BCC CODE_01BF0E               ;$01BF07 |
    TYX                           ;$01BF09 |
    JML.L DestroyObject_L         ;$01BF0A |


CODE_01BF0E:
	ADC.W #$0008                  ;$01BF0E	|
	TAY                           ;$01BF11	|
	JSL.L CODE_FL_01CE20          ;$01BF12	|
	LDX.B $39                     ;$01BF16	|
	CMP.W #$0024                  ;$01BF18	|
	BCC CODE_01BF22               ;$01BF1B	|
	CMP.W #$0027                  ;$01BF1D	|
	BCC CODE_01BF51               ;$01BF20	|

CODE_01BF22:
	BIT.W #$0080                  ;$01BF22	|
	BEQ CODE_01BF2D               ;$01BF25	|
	LDA.W #$BEA0                  ;$01BF27	|
	JMP.W CODE_JP_01C013          ;$01BF2A	|

CODE_01BF2D:
	AND.W #$007F                  ;$01BF2D	|
	CMP.W #$0030                  ;$01BF30	|
	BCC CODE_01BF6A               ;$01BF33	|
	STA.B $00                     ;$01BF35	|
	JSL.L CODE_FL_01C02A          ;$01BF37	|
	LDA.B $00                     ;$01BF3B	|
	CMP.W #$004C                  ;$01BF3D	|
	BEQ CODE_01BF51               ;$01BF40	|
	CMP.W #$004D                  ;$01BF42	|
	BEQ CODE_01BF51               ;$01BF45	|
	CMP.W #$0051                  ;$01BF47	|
	BCC CODE_01BF5E               ;$01BF4A	|
	CMP.W #$0055                  ;$01BF4C	|
	BCS CODE_01BF5E               ;$01BF4F	|

CODE_01BF51:
	LDA.W #$5323                  ;$01BF51	|
	LDX.W #$00D0                  ;$01BF54	|
	JSL.L CODE_FL_00E80F          ;$01BF57	|
	JMP.W CODE_JP_01C01B          ;$01BF5B	|

CODE_01BF5E:
	JSL.L CODE_FL_01C058          ;$01BF5E	|
	LDX.B $39                     ;$01BF62	|
	LDA.W #$BEDB                  ;$01BF64	|
	JMP.W CODE_JP_01C013          ;$01BF67	|

CODE_01BF6A:
    LDA.W #$C132                  ;$01BF6A |
    LDX.W #$0001                  ;$01BF6D |
    LDY.B $39                     ;$01BF70 |
    JSL.L CODE_FL_D020EE          ;$01BF72 |
    dw CODE_01BF85                ;$01BF76 |
    dw CODE_01BF85                ;$01BF78 |
    dw CODE_01BFBF                ;$01BF7A |
    dw CODE_01BFBF                ;$01BF7C |
    dw CODE_01BF85                ;$01BF7E |
    dw CODE_01BFCD                ;$01BF80 |
    dw CODE_01BED0                ;$01BF82 |
    db $01                        ;$01BF84 |	???

CODE_01BF85:
    LDX.W #$0018                  ;$01BF85 |
    LDY.B $39                     ;$01BF88 |

CODE_01BF8A:
	CPX.B $39                     ;$01BF8A	|
	BEQ CODE_01BFB5               ;$01BF8C	|
	LDA.W $623C,X                 ;$01BF8E	|
	CMP.W #$0009                  ;$01BF91	|
	BNE CODE_01BFB5               ;$01BF94	|
	LDA.W $6986,Y                 ;$01BF96	|
	CLC                           ;$01BF99	|
	ADC.W #$000C                  ;$01BF9A	|
	SBC.W $6892,X                 ;$01BF9D	|
	CMP.W #$0018                  ;$01BFA0	|
	BCS CODE_01BFB5               ;$01BFA3	|
	LDA.W $6A00,Y                 ;$01BFA5	|
	ADC.W #$000C                  ;$01BFA8	|
	SBC.W $690C,X                 ;$01BFAB	|
	CMP.W #$0018                  ;$01BFAE	|
	BCS CODE_01BFB5               ;$01BFB1	|
	BRA CODE_01BFBF               ;$01BFB3	|

CODE_01BFB5:
	INX                           ;$01BFB5	|
	INX                           ;$01BFB6	|
	CPX.W #$0040                  ;$01BFB7	|
	BCC CODE_01BF8A               ;$01BFBA	|
	JMP.W CODE_JP_01C01B          ;$01BFBC	|

CODE_01BFBF:
    LDA.W #$5323                  ;$01BFBF |
    LDX.W #$00D0                  ;$01BFC2 |
    JSL.L CODE_FL_00E80F          ;$01BFC5 |
    JSL.L CODE_FL_D021C5          ;$01BFC9 |

CODE_01BFCD:
    LDA.W #$BED0                  ;$01BFCD |
    LDX.W #$0001                  ;$01BFD0 |
    JSL.L CODE_FL_D02227          ;$01BFD3 |
    LDA.W #$8F63                  ;$01BFD7 |
    LDX.W #$0000                  ;$01BFDA |
    JSL.L CODE_FL_00E74F          ;$01BFDD |
    JSL.L CODE_FL_D023E8          ;$01BFE1 |
    JMP.W CODE_JP_01C01B          ;$01BFE5 |
    LDX.W $6986,Y                 ;$01BFE8 |
    LDA.W $6A00,Y                 ;$01BFEB |
    CMP.W #Room_Size_Y                  ;$01BFEE |
    BCC CODE_01BFF8               ;$01BFF1 |
    TYX                           ;$01BFF3 |
    JML.L DestroyObject_L         ;$01BFF4 |

CODE_01BFF8:
	ADC.W #$0008                  ;$01BFF8	|
	TAY                           ;$01BFFB	|
	JSL.L CODE_FL_01C362          ;$01BFFC	|
	CPY.W #$0000                  ;$01C000	|
	BEQ CODE_JP_01C01B            ;$01C003	|
	TAY                           ;$01C005	|
	BPL CODE_JP_01C01B            ;$01C006	|
	LDY.B $39                     ;$01C008	|
	CLC                           ;$01C00A	|
	ADC.W $6A00,Y                 ;$01C00B	|
	STA.W $6A00,Y                 ;$01C00E	|
	BRA CODE_JP_01C01B            ;$01C011	|

CODE_JP_01C013:
	LDX.B $39                     ;$01C013	|
	STA.W $679E,X                 ;$01C015	|
	STZ.W $6724,X                 ;$01C018	|

CODE_JP_01C01B:
	LDY.B $39                     ;$01C01B	|
	LDA.W $6986,Y                 ;$01C01D	|
	STA.W $6892,Y                 ;$01C020	|
	LDA.W $6A00,Y                 ;$01C023	|
	STA.W $690C,Y                 ;$01C026	|
	RTL                           ;$01C029	|

CODE_FL_01C02A:
	BIT.W $0000                   ;$01C02A	|
	BMI CODE_01C039               ;$01C02D	|
	LDA.W #$C039                  ;$01C02F	|
	LDX.W #$0001                  ;$01C032	|
	JML.L SNES_ExecuteSA1         ;$01C035	|

CODE_01C039:
	LDY.B $39                     ;$01C039	|
	LDA.W #$0001                  ;$01C03B	|
	STA.W $2250                   ;$01C03E	|
	LDA.W $6A00,Y                 ;$01C041	|
	STA.W $2251                   ;$01C044	|
	LDX.W #$0018                  ;$01C047	|
	STX.W $2253                   ;$01C04A	|
	SEC                           ;$01C04D	|
	SBC.W $2308                   ;$01C04E	|
	ADC.W #$0008                  ;$01C051	|
	STA.W $6A00,Y                 ;$01C054	|
	RTL                           ;$01C057	|

CODE_FL_01C058:
	STZ.B $28                     ;$01C058	|
	LDY.B $39                     ;$01C05A	|
	LDA.W $3358                   ;$01C05C	|
	SBC.W #$0024                  ;$01C05F	|
	BCC CODE_01C06B               ;$01C062	|
	CMP.W $6986,Y                 ;$01C064	|
	BCC CODE_01C06B               ;$01C067	|
	INC.B $28                     ;$01C069	|

CODE_01C06B:
	LDA.W $3358                   ;$01C06B	|
	ADC.W #$012C                  ;$01C06E	|
	CMP.W $6986,Y                 ;$01C071	|
	BCS CODE_01C078               ;$01C074	|
	INC.B $28                     ;$01C076	|

CODE_01C078:
	LDA.W $335C                   ;$01C078	|
	SBC.W #$0024                  ;$01C07B	|
	BCC CODE_01C087               ;$01C07E	|
	CMP.W $6A00,Y                 ;$01C080	|
	BCC CODE_01C087               ;$01C083	|
	INC.B $28                     ;$01C085	|

CODE_01C087:
	LDA.W $335C                   ;$01C087	|
	ADC.W #$00E4                  ;$01C08A	|
	CMP.W $6A00,Y                 ;$01C08D	|
	BCS CODE_01C094               ;$01C090	|
	INC.B $28                     ;$01C092	|

CODE_01C094:
	LDX.W $6986,Y                 ;$01C094	|
	LDA.W $6A00,Y                 ;$01C097	|
	TAY                           ;$01C09A	|
	JSL.L CODE_FL_01CE46          ;$01C09B	|
	LDA.W #$C0A9                  ;$01C09F	|
	LDX.W #$0001                  ;$01C0A2	|
	JML.L SA1_ExecuteSNES         ;$01C0A5	|
	LDY.B $53                     ;$01C0A9	|
	LDA.B [$64],Y                 ;$01C0AB	|
	AND.W #$03FF                  ;$01C0AD	|
	CMP.W #$02CE                  ;$01C0B0	|
	BEQ CODE_01C0E8               ;$01C0B3	|
	TAX                           ;$01C0B5	|
	LDA.L $7F62A0,X               ;$01C0B6	|
	AND.W #$007F                  ;$01C0BA	|
	CMP.W #$0070                  ;$01C0BD	|
	BCC CODE_01C0E3               ;$01C0C0	|
	LDA.B $5E                     ;$01C0C2	|
	STA.B $14                     ;$01C0C4	|
	LDA.B $5D                     ;$01C0C6	|
	STA.B $16                     ;$01C0C8	|
	LDY.W #$0000                  ;$01C0CA	|

CODE_01C0CD:
	LDA.B [$14],Y                 ;$01C0CD	|
	BMI CODE_01C114               ;$01C0CF	|
	CMP.B $64                     ;$01C0D1	|
	BEQ CODE_01C0DD               ;$01C0D3	|
	TYA                           ;$01C0D5	|
	CLC                           ;$01C0D6	|
	ADC.W #$0006                  ;$01C0D7	|
	TAY                           ;$01C0DA	|
	BRA CODE_01C0CD               ;$01C0DB	|

CODE_01C0DD:
	INY                           ;$01C0DD	|
	INY                           ;$01C0DE	|
	LDA.B [$14],Y                 ;$01C0DF	|
	STA.B [$64]                   ;$01C0E1	|

CODE_01C0E3:
	JSR.W CODE_FN_01C115          ;$01C0E3	|
	BCC CODE_01C114               ;$01C0E6	|

CODE_01C0E8:
	LDA.W #$02CE                  ;$01C0E8	|
	JSR.W CODE_FN_019FE9          ;$01C0EB	|
	LDA.B $64                     ;$01C0EE	|
	SEC                           ;$01C0F0	|
	SBC.B $53                     ;$01C0F1	|
	BCC CODE_01C114               ;$01C0F3	|
	STA.B $64                     ;$01C0F5	|
	LDA.B [$64]                   ;$01C0F7	|
	AND.W #$03FF                  ;$01C0F9	|
	TAX                           ;$01C0FC	|
	LDA.L $7F62A0,X               ;$01C0FD	|
	AND.W #$00FF                  ;$01C101	|
	CMP.W #$0030                  ;$01C104	|
	BCS CODE_01C114               ;$01C107	|
	JSR.W CODE_FN_01C115          ;$01C109	|
	BCC CODE_01C114               ;$01C10C	|
	LDA.W #$02CF                  ;$01C10E	|
	JSR.W CODE_FN_019FE9          ;$01C111	|

CODE_01C114:
	RTL                           ;$01C114	|

CODE_FN_01C115:
	LDX.W #$01FE                  ;$01C115	|

CODE_01C118:
	LDA.L $7EB000,X               ;$01C118	|
	BMI CODE_01C124               ;$01C11C	|
	DEX                           ;$01C11E	|
	DEX                           ;$01C11F	|
	BPL CODE_01C118               ;$01C120	|
	CLC                           ;$01C122	|
	RTS                           ;$01C123	|

CODE_01C124:
	LDA.B [$64]                   ;$01C124	|
	STA.L $7EB200,X               ;$01C126	|
	LDA.B $64                     ;$01C12A	|
	STA.L $7EB000,X               ;$01C12C	|
	SEC                           ;$01C130	|
	RTS                           ;$01C131	|
	db $0E,$0C,$0C,$00,$40,$00,$02,$00;$01C132	|
	db $00                        ;$01C13A	|

DATA8_01C13B:
	db $4C,$DB,$38,$DB            ;$01C13B	|

DATA8_01C13F:
	db $1A,$DB,$FC,$DA,$DE,$DA    ;$01C13F	|

DATA8_01C145:
	db $79,$DB,$AB,$DB,$DD,$DB,$00,$DC;$01C145	|
	db $23,$DC,$46,$DC,$69,$DC    ;$01C14D	|

DATA8_01C153:
	db $04                        ;$01C153	|

DATA8_01C154:
	db $00,$04,$02,$04,$04,$01,$0C,$04;$01C154	|
	db $06,$04,$08,$04,$0A,$02,$0C,$04;$01C15C	|
	db $00,$04,$02,$04,$04,$01,$0C,$04;$01C164	|
	db $06,$04,$08,$04,$0A,$02,$0C,$04;$01C16C	|
	db $00,$04,$02,$04,$04,$01,$0C,$04;$01C174	|
	db $06,$04,$08,$04,$0A,$02,$0C,$04;$01C17C	|
	db $00,$04,$02,$04,$04,$01,$0C,$04;$01C184	|
	db $06,$04,$08,$04,$0A,$02,$0C,$04;$01C18C	|
	db $00,$04,$02,$04,$04,$01,$0C,$04;$01C194	|
	db $06,$04,$08,$04,$0A,$02,$0C,$02;$01C19C	|
	db $0C,$02,$0A,$02,$06,$02,$02,$02;$01C1A4	|
	db $04,$02,$08,$02,$0C,$02,$0A,$02;$01C1AC	|
	db $06,$02,$02,$02,$04,$02,$08,$02;$01C1B4	|
	db $0C,$02,$0A,$02,$06,$02,$02,$02;$01C1BC	|
	db $04,$02,$08,$02,$0C,$02,$0A,$02;$01C1C4	|
	db $06,$02,$02,$02,$04,$02,$08,$02;$01C1CC	|
	db $0C,$02,$0A,$02,$06,$02,$02,$02;$01C1D4	|
	db $04,$02,$08,$00            ;$01C1DC	|

CODE_FN_01C1E0:
	STA.W $79FE                   ;$01C1E0	|
	STA.B $14                     ;$01C1E3	|
	STX.W $7A00                   ;$01C1E5	|
	STX.B $16                     ;$01C1E8	|
	LDY.W #$0001                  ;$01C1EA	|
	LDA.B [$14],Y                 ;$01C1ED	|
	INY                           ;$01C1EF	|
	AND.W #$00FF                  ;$01C1F0	|
	TAX                           ;$01C1F3	|

CODE_01C1F4:
	PHX                           ;$01C1F4	|
	LDA.W $79FE                   ;$01C1F5	|
	STA.B $14                     ;$01C1F8	|
	LDA.W $7A00                   ;$01C1FA	|
	STA.B $16                     ;$01C1FD	|
	LDA.B [$14],Y                 ;$01C1FF	|
	INY                           ;$01C201	|
	INY                           ;$01C202	|
	TAX                           ;$01C203	|
	LDA.B [$14],Y                 ;$01C204	|
	INY                           ;$01C206	|
	INY                           ;$01C207	|
	PHY                           ;$01C208	|
	TAY                           ;$01C209	|
	LDA.W #$0005                  ;$01C20A	|
	JSL.L CODE_FL_019D44          ;$01C20D	|
	PLY                           ;$01C211	|
	PLX                           ;$01C212	|
	DEX                           ;$01C213	|
	BNE CODE_01C1F4               ;$01C214	|
	RTS                           ;$01C216	|

CODE_FN_01C217:
	LDA.W CameraLock                   ;$01C217	|
	BNE CODE_81C239               ;$01C21A	|
	LDA.W $3324                   ;$01C21C	|
	BMI CODE_81C239               ;$01C21F	|
	XBA                           ;$01C221	|
	AND.W #$00FF                  ;$01C222	|
	ASL A                         ;$01C225	|
	TAX                           ;$01C226	|
	LDA.L DATA16_01C23A,X          ;$01C227	|
	JSL.L CallRNG_ModA          ;$01C22B	|
	TAX                           ;$01C22F	|
	BNE CODE_81C239               ;$01C230	|
	LDX.W #$0089                  ;$01C232	|
	JSL.L CODE_FL_009AEB          ;$01C235	|

CODE_81C239:
	RTS                           ;$01C239	|

DATA16_01C23A:
    dw $0010,$0008,$0004          ;$01C23A |

CODE_FL_01C240:
	STY.B $76                     ;$01C240	|
	ADC.B $76                     ;$01C242	|
	SBC.W CameraY_TileMirror                   ;$01C244	|
	STA.B $76                     ;$01C247	|
	LDA.W #$0100                  ;$01C249	|
	SBC.B $76                     ;$01C24C	|
	STA.B $49                     ;$01C24E	|
	JSL.L CODE_FL_01CE46          ;$01C250	|
	BIT.W $0000                   ;$01C254	|
	BPL CODE_01C268               ;$01C257	|
	LDA.W #$C268                  ;$01C259	|
	LDX.W #$0001                  ;$01C25C	|
	JSL.L SA1_ExecuteSNES         ;$01C25F	|
	LDY.B $4D                     ;$01C263	|
	LDA.B $49                     ;$01C265	|
	RTL                           ;$01C267	|

CODE_01C268:
	STZ.B $4D                     ;$01C268	|

CODE_01C26A:
    LDA.B [$64]                   ;$01C26A |
    AND.W #$03FF                  ;$01C26C |
    TAX                           ;$01C26F |
    LDA.L $7F62A0,X               ;$01C270 |
    AND.W #$007F                  ;$01C274 |
    ASL A                         ;$01C277 |
    TAX                           ;$01C278 |
    LDA.L TileCollisionProperties_LUT,X         ;$01C279 |
    AND.W #$001F                  ;$01C27D |
    TAX                           ;$01C280 |
    JMP.W (PTR16_01C284,X)        ;$01C281 |
PTR16_01C284:
    dw CODE_01C2A4                ;$01C284 |
    dw CODE_01C2C7                ;$01C286 |
    dw CODE_01C2D3                ;$01C288 |
    dw CODE_01C2E2                ;$01C28A |
    dw CODE_01C2F2                ;$01C28C |
    dw CODE_01C2ED                ;$01C28E |
    dw CODE_01C302                ;$01C290 |
    dw CODE_01C306                ;$01C292 |
    dw CODE_01C320                ;$01C294 |
    dw CODE_01C31B                ;$01C296 |
    dw CODE_01C316                ;$01C298 |
    dw CODE_01C337                ;$01C29A |
    dw CODE_01C33C                ;$01C29C |
    dw CODE_01C341                ;$01C29E |
    dw CODE_01C2BD                ;$01C2A0 |
    dw CODE_01C2C2                ;$01C2A2 |

CODE_01C2A4:
    LDA.B $64                     ;$01C2A4 |
    CLC                           ;$01C2A6 |
    ADC.B $53                     ;$01C2A7 |
    STA.B $64                     ;$01C2A9 |
    LDA.B $4D                     ;$01C2AB |
    CLC                           ;$01C2AD |
    ADC.W #$0018                  ;$01C2AE |
    STA.B $4D                     ;$01C2B1 |
    CMP.B $49                     ;$01C2B3 |
    BCC CODE_01C26A               ;$01C2B5 |
    LDY.W #$0000                  ;$01C2B7 |
    STY.B $4D                     ;$01C2BA |
    RTL                           ;$01C2BC |

CODE_01C2BD:
    LDA.W #$0010                  ;$01C2BD |
    BRA CODE_01C2CA               ;$01C2C0 |

CODE_01C2C2:
    LDA.W #$0008                  ;$01C2C2 |
    BRA CODE_01C2CA               ;$01C2C5 |

CODE_01C2C7:
    LDA.W #$0000                  ;$01C2C7 |

CODE_01C2CA:
    SEC                           ;$01C2CA |
    SBC.B $76                     ;$01C2CB |
    LDY.W #$0001                  ;$01C2CD |
    JMP.W CODE_JP_01C355          ;$01C2D0 |

CODE_01C2D3:
    LDA.W #$0018                  ;$01C2D3 |
    SEC                           ;$01C2D6 |
    SBC.B $74                     ;$01C2D7 |
    SEC                           ;$01C2D9 |
    SBC.B $76                     ;$01C2DA |
    LDY.W #$0006                  ;$01C2DC |
    JMP.W CODE_JP_01C355          ;$01C2DF |

CODE_01C2E2:
    LDA.B $74                     ;$01C2E2 |
    SEC                           ;$01C2E4 |
    SBC.B $76                     ;$01C2E5 |
    LDY.W #$0009                  ;$01C2E7 |
    JMP.W CODE_JP_01C355          ;$01C2EA |

CODE_01C2ED:
    LDA.W #$0018                  ;$01C2ED |
    BRA CODE_01C2F5               ;$01C2F0 |

CODE_01C2F2:
    LDA.W #$0030                  ;$01C2F2 |

CODE_01C2F5:
    SEC                           ;$01C2F5 |
    SBC.B $74                     ;$01C2F6 |
    LSR A                         ;$01C2F8 |
    SEC                           ;$01C2F9 |
    SBC.B $76                     ;$01C2FA |
    LDY.W #$0005                  ;$01C2FC |
    JMP.W CODE_JP_01C355          ;$01C2FF |

CODE_01C302:
    LDA.B $74                     ;$01C302 |
    BRA CODE_01C30C               ;$01C304 |

CODE_01C306:
    LDA.B $74                     ;$01C306 |
    CLC                           ;$01C308 |
    ADC.W #$0018                  ;$01C309 |

CODE_01C30C:
    LSR A                         ;$01C30C |
    SEC                           ;$01C30D |
    SBC.B $76                     ;$01C30E |
    LDY.W #$0008                  ;$01C310 |
    JMP.W CODE_JP_01C355          ;$01C313 |

CODE_01C316:
    LDA.W #$0018                  ;$01C316 |
    BRA CODE_01C323               ;$01C319 |

CODE_01C31B:
    LDA.W #$0030                  ;$01C31B |
    BRA CODE_01C323               ;$01C31E |

CODE_01C320:
    LDA.W #$0048                  ;$01C320 |

CODE_01C323:
    SEC                           ;$01C323 |
    SBC.B $74                     ;$01C324 |
    TAX                           ;$01C326 |
    LDA.L DATA24_01CF2D,X         ;$01C327 |
    AND.W #$00FF                  ;$01C32B |
    SEC                           ;$01C32E |
    SBC.B $76                     ;$01C32F |
    LDY.W #$0004                  ;$01C331 |
    JMP.W CODE_JP_01C355          ;$01C334 |

CODE_01C337:
    LDA.W #$0000                  ;$01C337 |
    BRA CODE_01C344               ;$01C33A |

CODE_01C33C:
    LDA.W #$0018                  ;$01C33C |
    BRA CODE_01C344               ;$01C33F |

CODE_01C341:
    LDA.W #$0030                  ;$01C341 |

CODE_01C344:
    CLC                           ;$01C344 |
    ADC.B $74                     ;$01C345 |
    TAX                           ;$01C347 |
    LDA.L DATA24_01CF2D,X         ;$01C348 |
    AND.W #$00FF                  ;$01C34C |
    SEC                           ;$01C34F |
    SBC.B $76                     ;$01C350 |
    LDY.W #$0007                  ;$01C352 |

CODE_JP_01C355:
    CLC                           ;$01C355 |
    ADC.B $4D                     ;$01C356 |
    BPL CODE_01C35D               ;$01C358 |
    LDY.W #$0000                  ;$01C35A |

CODE_01C35D:
    STY.B $4D                     ;$01C35D |
    STA.B $49                     ;$01C35F |
    RTL                           ;$01C361 |

CODE_FL_01C362:
    STZ.W $33B0                   ;$01C362 |

CODE_FL_01C365:
    JSL.L CODE_FL_01CCCD          ;$01C365 |
    LDA.B $6E                     ;$01C369 |
    AND.W #$007F                  ;$01C36B |
    ASL A                         ;$01C36E |
    TAX                           ;$01C36F |
    LDA.L TileDamageProperties_LUT,X         ;$01C370 |
    STA.B $6E                     ;$01C374 |
    LDA.L TileCollisionProperties_LUT,X         ;$01C376 |
    BIT.W #$0020                  ;$01C37A |
    BEQ CODE_81C387               ;$01C37D |
    LDY.W $33B0                   ;$01C37F |
    BEQ CODE_81C387               ;$01C382 |
    JMP.W CODE_JP_01C447          ;$01C384 |

CODE_81C387:
    AND.W #$001F                  ;$01C387 |
    TAX                           ;$01C38A |
    JMP.W (PTR16_01C38E,X)        ;$01C38B |
PTR16_01C38E:
    dw CODE_01C444                ;$01C38E |
    dw CODE_01C535                ;$01C390 |
    dw CODE_01C3BF                ;$01C392 |
    dw CODE_01C3CE                ;$01C394 |
    dw CODE_01C3DE                ;$01C396 |
    dw CODE_01C3D9                ;$01C398 |
    dw CODE_01C3EE                ;$01C39A |
    dw CODE_01C3F2                ;$01C39C |
    dw CODE_01C40C                ;$01C39E |
    dw CODE_01C407                ;$01C3A0 |
    dw CODE_01C402                ;$01C3A2 |
    dw CODE_01C423                ;$01C3A4 |
    dw CODE_01C428                ;$01C3A6 |
    dw CODE_01C42D                ;$01C3A8 |
    dw CODE_01C3AE                ;$01C3AA |
    dw CODE_01C3B3                ;$01C3AC |

CODE_01C3AE:
    LDA.W #$0010                  ;$01C3AE |
    BRA CODE_01C3B6               ;$01C3B1 |

CODE_01C3B3:
    LDA.W #$0008                  ;$01C3B3 |

CODE_01C3B6:
    SEC                           ;$01C3B6 |
    SBC.B $76                     ;$01C3B7 |
    LDY.W #$0001                  ;$01C3B9 |
    JMP.W CODE_JP_01CDF0          ;$01C3BC |

CODE_01C3BF:
    LDA.W #$0018                  ;$01C3BF |
    SEC                           ;$01C3C2 |
    SBC.B $74                     ;$01C3C3 |
    SEC                           ;$01C3C5 |
    SBC.B $76                     ;$01C3C6 |
    LDY.W #$0006                  ;$01C3C8 |
    JMP.W CODE_JP_01CDF0          ;$01C3CB |

CODE_01C3CE:
    LDA.B $74                     ;$01C3CE |
    SEC                           ;$01C3D0 |
    SBC.B $76                     ;$01C3D1 |
    LDY.W #$0009                  ;$01C3D3 |
    JMP.W CODE_JP_01CDF0          ;$01C3D6 |

CODE_01C3D9:
    LDA.W #$0018                  ;$01C3D9 |
    BRA CODE_81C3E1               ;$01C3DC |

CODE_01C3DE:
    LDA.W #$0030                  ;$01C3DE |

CODE_81C3E1:
    SEC                           ;$01C3E1 |
    SBC.B $74                     ;$01C3E2 |
    LSR A                         ;$01C3E4 |
    SEC                           ;$01C3E5 |
    SBC.B $76                     ;$01C3E6 |
    LDY.W #$0005                  ;$01C3E8 |
    JMP.W CODE_JP_01CDF0          ;$01C3EB |

CODE_01C3EE:
    LDA.B $74                     ;$01C3EE |
    BRA CODE_81C3F8               ;$01C3F0 |

CODE_01C3F2:
    LDA.B $74                     ;$01C3F2 |
    CLC                           ;$01C3F4 |
    ADC.W #$0018                  ;$01C3F5 |

CODE_81C3F8:
    LSR A                         ;$01C3F8 |
    SEC                           ;$01C3F9 |
    SBC.B $76                     ;$01C3FA |
    LDY.W #$0008                  ;$01C3FC |
    JMP.W CODE_JP_01CDF0          ;$01C3FF |

CODE_01C402:
    LDA.W #$0018                  ;$01C402 |
    BRA CODE_81C40F               ;$01C405 |

CODE_01C407:
    LDA.W #$0030                  ;$01C407 |
    BRA CODE_81C40F               ;$01C40A |

CODE_01C40C:
    LDA.W #$0048                  ;$01C40C |

CODE_81C40F:
    SEC                           ;$01C40F |
    SBC.B $74                     ;$01C410 |
    TAX                           ;$01C412 |
    LDA.L DATA24_01CF2D,X         ;$01C413 |
    AND.W #$00FF                  ;$01C417 |
    SEC                           ;$01C41A |
    SBC.B $76                     ;$01C41B |
    LDY.W #$0004                  ;$01C41D |
    JMP.W CODE_JP_01CDF0          ;$01C420 |

CODE_01C423:
    LDA.W #$0000                  ;$01C423 |
    BRA CODE_81C430               ;$01C426 |

CODE_01C428:
    LDA.W #$0018                  ;$01C428 |
    BRA CODE_81C430               ;$01C42B |

CODE_01C42D:
    LDA.W #$0030                  ;$01C42D |

CODE_81C430:
    CLC                           ;$01C430 |
    ADC.B $74                     ;$01C431 |
    TAX                           ;$01C433 |
    LDA.L DATA24_01CF2D,X         ;$01C434 |
    AND.W #$00FF                  ;$01C438 |
    SEC                           ;$01C43B |
    SBC.B $76                     ;$01C43C |
    LDY.W #$0007                  ;$01C43E |
    JMP.W CODE_JP_01CDF0          ;$01C441 |

CODE_01C444:
    STZ.W $33B0                   ;$01C444 |

CODE_JP_01C447:
    LDA.B $70                     ;$01C447 |
    AND.W #$007F                  ;$01C449 |
    ASL A                         ;$01C44C |
    TAX                           ;$01C44D |
    LDA.L TileCollisionProperties_LUT,X         ;$01C44E |
    BIT.W #$0020                  ;$01C452 |
    BEQ CODE_81C45F               ;$01C455 |
    LDY.W $33B0                   ;$01C457 |
    BEQ CODE_81C45F               ;$01C45A |
    JMP.W CODE_JP_01CDED          ;$01C45C |

CODE_81C45F:
    AND.W #$001F                  ;$01C45F |
    TAX                           ;$01C462 |
    JMP.W (PTR16_01C466,X)        ;$01C463 |
PTR16_01C466:
    dw CODE_JP_01CDED             ;$01C466 |
    dw CODE_01C490                ;$01C468 |
    dw CODE_01C49C                ;$01C46A |
    dw CODE_01C4AB                ;$01C46C |
    dw CODE_01C4BF                ;$01C46E |
    dw CODE_01C4BA                ;$01C470 |
    dw CODE_01C4D3                ;$01C472 |
    dw CODE_01C4D7                ;$01C474 |
    dw CODE_01C4F5                ;$01C476 |
    dw CODE_01C4F0                ;$01C478 |
    dw CODE_01C4EB                ;$01C47A |
    dw CODE_01C510                ;$01C47C |
    dw CODE_01C515                ;$01C47E |
    dw CODE_01C51A                ;$01C480 |
    dw CODE_01C486                ;$01C482 |
    dw CODE_01C48B                ;$01C484 |

CODE_01C486:
    LDA.W #$0032                  ;$01C486 |
    BRA CODE_01C493               ;$01C489 |

CODE_01C48B:
    LDA.W #$0020                  ;$01C48B |
    BRA CODE_01C493               ;$01C48E |

CODE_01C490:
    LDA.W #$0018                  ;$01C490 |

CODE_01C493:
    SEC                           ;$01C493 |
    SBC.B $76                     ;$01C494 |
    LDY.W #$0001                  ;$01C496 |
    JMP.W CODE_JP_01CDF0          ;$01C499 |

CODE_01C49C:
    LDA.W #$0030                  ;$01C49C |
    SEC                           ;$01C49F |
    SBC.B $74                     ;$01C4A0 |
    SEC                           ;$01C4A2 |
    SBC.B $76                     ;$01C4A3 |
    LDY.W #$0006                  ;$01C4A5 |
    JMP.W CODE_JP_01CDF0          ;$01C4A8 |

CODE_01C4AB:
    LDA.B $74                     ;$01C4AB |
    SEC                           ;$01C4AD |
    SBC.B $76                     ;$01C4AE |
    CLC                           ;$01C4B0 |
    ADC.W #$0018                  ;$01C4B1 |
    LDY.W #$0009                  ;$01C4B4 |
    JMP.W CODE_JP_01CDF0          ;$01C4B7 |

CODE_01C4BA:
    LDA.W #$0018                  ;$01C4BA |
    BRA CODE_81C4C2               ;$01C4BD |

CODE_01C4BF:
    LDA.W #$0030                  ;$01C4BF |

CODE_81C4C2:
    SEC                           ;$01C4C2 |
    SBC.B $74                     ;$01C4C3 |
    LSR A                         ;$01C4C5 |
    SEC                           ;$01C4C6 |
    SBC.B $76                     ;$01C4C7 |
    CLC                           ;$01C4C9 |
    ADC.W #$0018                  ;$01C4CA |
    LDY.W #$0005                  ;$01C4CD |
    JMP.W CODE_JP_01CDF0          ;$01C4D0 |

CODE_01C4D3:
    LDA.B $74                     ;$01C4D3 |
    BRA CODE_81C4DD               ;$01C4D5 |

CODE_01C4D7:
    LDA.B $74                     ;$01C4D7 |
    CLC                           ;$01C4D9 |
    ADC.W #$0018                  ;$01C4DA |

CODE_81C4DD:
    LSR A                         ;$01C4DD |
    SEC                           ;$01C4DE |
    SBC.B $76                     ;$01C4DF |
    CLC                           ;$01C4E1 |
    ADC.W #$0018                  ;$01C4E2 |
    LDY.W #$0008                  ;$01C4E5 |
    JMP.W CODE_JP_01CDF0          ;$01C4E8 |

CODE_01C4EB:
    LDA.W #$0018                  ;$01C4EB |
    BRA CODE_81C4F8               ;$01C4EE |

CODE_01C4F0:
    LDA.W #$0030                  ;$01C4F0 |
    BRA CODE_81C4F8               ;$01C4F3 |

CODE_01C4F5:
    LDA.W #$0048                  ;$01C4F5 |

CODE_81C4F8:
    SEC                           ;$01C4F8 |
    SBC.B $74                     ;$01C4F9 |
    TAX                           ;$01C4FB |
    LDA.L DATA24_01CF2D,X         ;$01C4FC |
    AND.W #$00FF                  ;$01C500 |
    SEC                           ;$01C503 |
    SBC.B $76                     ;$01C504 |
    CLC                           ;$01C506 |
    ADC.W #$0018                  ;$01C507 |
    LDY.W #$0004                  ;$01C50A |
    JMP.W CODE_JP_01CDF0          ;$01C50D |

CODE_01C510:
    LDA.W #$0000                  ;$01C510 |
    BRA CODE_81C51D               ;$01C513 |

CODE_01C515:
    LDA.W #$0018                  ;$01C515 |
    BRA CODE_81C51D               ;$01C518 |

CODE_01C51A:
    LDA.W #$0030                  ;$01C51A |

CODE_81C51D:
    CLC                           ;$01C51D |
    ADC.B $74                     ;$01C51E |
    TAX                           ;$01C520 |
    LDA.L DATA24_01CF2D,X         ;$01C521 |
    AND.W #$00FF                  ;$01C525 |
    SEC                           ;$01C528 |
    SBC.B $76                     ;$01C529 |
    CLC                           ;$01C52B |
    ADC.W #$0018                  ;$01C52C |
    LDY.W #$0007                  ;$01C52F |
    JMP.W CODE_JP_01CDF0          ;$01C532 |

CODE_01C535:
    LDA.B $6C                     ;$01C535 |
    AND.W #$007F                  ;$01C537 |
    ASL A                         ;$01C53A |
    TAX                           ;$01C53B |
    LDA.L TileCollisionProperties_LUT,X         ;$01C53C |
    BIT.W #$0020                  ;$01C540 |
    BEQ CODE_81C54A               ;$01C543 |
    LDY.W $33B0                   ;$01C545 |
    BNE CODE_81C587               ;$01C548 |

CODE_81C54A:
    AND.W #$001F                  ;$01C54A |
    TAX                           ;$01C54D |
    JMP.W (PTR16_01C551,X)        ;$01C54E |
PTR16_01C551:
    dw CODE_81C587                ;$01C551 |
    dw CODE_01C57B                ;$01C553 |
    dw CODE_01C593                ;$01C555 |
    dw CODE_01C5A2                ;$01C557 |
    dw CODE_01C5B6                ;$01C559 |
    dw CODE_01C5B1                ;$01C55B |
    dw CODE_01C5CA                ;$01C55D |
    dw CODE_01C5CE                ;$01C55F |
    dw CODE_01C5EC                ;$01C561 |
    dw CODE_01C5E7                ;$01C563 |
    dw CODE_01C5E2                ;$01C565 |
    dw CODE_01C607                ;$01C567 |
    dw CODE_01C60C                ;$01C569 |
    dw CODE_01C611                ;$01C56B |
    dw CODE_01C571                ;$01C56D |
    dw CODE_01C576                ;$01C56F |

CODE_01C571:
    LDA.W #$FFF8                  ;$01C571 |
    BRA CODE_01C57E               ;$01C574 |

CODE_01C576:
    LDA.W #$FFF0                  ;$01C576 |
    BRA CODE_01C57E               ;$01C579 |

CODE_01C57B:
    LDA.W #$FFE8                  ;$01C57B |

CODE_01C57E:
    SEC                           ;$01C57E |
    SBC.B $76                     ;$01C57F |
    LDY.W #$0001                  ;$01C581 |
    JMP.W CODE_JP_01CDF0          ;$01C584 |

CODE_81C587:
    LDA.B $76                     ;$01C587 |
    EOR.W #$FFFF                  ;$01C589 |
    INC A                         ;$01C58C |
    LDY.W #$0001                  ;$01C58D |
    JMP.W CODE_JP_01CDF0          ;$01C590 |

CODE_01C593:
    LDA.W #$0000                  ;$01C593 |
    SEC                           ;$01C596 |
    SBC.B $74                     ;$01C597 |
    SEC                           ;$01C599 |
    SBC.B $76                     ;$01C59A |
    LDY.W #$0006                  ;$01C59C |
    JMP.W CODE_JP_01CDF0          ;$01C59F |

CODE_01C5A2:
    LDA.B $74                     ;$01C5A2 |
    SEC                           ;$01C5A4 |
    SBC.B $76                     ;$01C5A5 |
    SEC                           ;$01C5A7 |
    SBC.W #$0018                  ;$01C5A8 |
    LDY.W #$0009                  ;$01C5AB |
    JMP.W CODE_JP_01CDF0          ;$01C5AE |

CODE_01C5B1:
    LDA.W #$0018                  ;$01C5B1 |
    BRA CODE_01C5B9               ;$01C5B4 |

CODE_01C5B6:
    LDA.W #$0030                  ;$01C5B6 |

CODE_01C5B9:
    SEC                           ;$01C5B9 |
    SBC.B $74                     ;$01C5BA |
    LSR A                         ;$01C5BC |
    SEC                           ;$01C5BD |
    SBC.B $76                     ;$01C5BE |
    SEC                           ;$01C5C0 |
    SBC.W #$0018                  ;$01C5C1 |
    LDY.W #$0005                  ;$01C5C4 |
    JMP.W CODE_JP_01CDF0          ;$01C5C7 |

CODE_01C5CA:
    LDA.B $74                     ;$01C5CA |
    BRA CODE_01C5D4               ;$01C5CC |

CODE_01C5CE:
    LDA.B $74                     ;$01C5CE |
    CLC                           ;$01C5D0 |
    ADC.W #$0018                  ;$01C5D1 |

CODE_01C5D4:
    LSR A                         ;$01C5D4 |
    SEC                           ;$01C5D5 |
    SBC.B $76                     ;$01C5D6 |
    SEC                           ;$01C5D8 |
    SBC.W #$0018                  ;$01C5D9 |
    LDY.W #$0008                  ;$01C5DC |
    JMP.W CODE_JP_01CDF0          ;$01C5DF |

CODE_01C5E2:
    LDA.W #$0018                  ;$01C5E2 |
    BRA CODE_01C5EF               ;$01C5E5 |

CODE_01C5E7:
    LDA.W #$0030                  ;$01C5E7 |
    BRA CODE_01C5EF               ;$01C5EA |

CODE_01C5EC:
    LDA.W #$0048                  ;$01C5EC |

CODE_01C5EF:
    SEC                           ;$01C5EF |
    SBC.B $74                     ;$01C5F0 |
    TAX                           ;$01C5F2 |
    LDA.L DATA24_01CF2D,X         ;$01C5F3 |
    AND.W #$00FF                  ;$01C5F7 |
    SEC                           ;$01C5FA |
    SBC.B $76                     ;$01C5FB |
    SEC                           ;$01C5FD |
    SBC.W #$0018                  ;$01C5FE |
    LDY.W #$0004                  ;$01C601 |
    JMP.W CODE_JP_01CDF0          ;$01C604 |

CODE_01C607:
    LDA.W #$0000                  ;$01C607 |
    BRA CODE_01C614               ;$01C60A |

CODE_01C60C:
    LDA.W #$0018                  ;$01C60C |
    BRA CODE_01C614               ;$01C60F |

CODE_01C611:
    LDA.W #$0030                  ;$01C611 |

CODE_01C614:
    CLC                           ;$01C614 |
    ADC.B $74                     ;$01C615 |
    TAX                           ;$01C617 |
    LDA.L DATA24_01CF2D,X         ;$01C618 |
    AND.W #$00FF                  ;$01C61C |
    SEC                           ;$01C61F |
    SBC.B $76                     ;$01C620 |
    SEC                           ;$01C622 |
    SBC.W #$0018                  ;$01C623 |
    LDY.W #$0007                  ;$01C626 |
    JMP.W CODE_JP_01CDF0          ;$01C629 |

CODE_FL_01C62C:
    JSL.L CODE_FL_01CCCD          ;$01C62C |
    LDA.B $6E                     ;$01C630 |
    AND.W #$007F                  ;$01C632 |
    ASL A                         ;$01C635 |
    TAX                           ;$01C636 |
    LDA.L TileDamageProperties_LUT,X         ;$01C637 |
    STA.B $6E                     ;$01C63B |
    LDA.L TileCollisionProperties_LUT,X         ;$01C63D |
    BIT.W #$0020                  ;$01C641 |
    BNE CODE_81C680               ;$01C644 |
    AND.W #$001F                  ;$01C646 |
    TAX                           ;$01C649 |
    JMP.W (PTR16_01C64D,X)        ;$01C64A |
PTR16_01C64D:
    dw CODE_81C680                ;$01C64D |
    dw CODE_JP_01C6D4             ;$01C64F |
    dw CODE_01C66D                ;$01C651 |
    dw CODE_01C66D                ;$01C653 |
    dw CODE_01C66D                ;$01C655 |
    dw CODE_01C66D                ;$01C657 |
    dw CODE_01C66D                ;$01C659 |
    dw CODE_01C66D                ;$01C65B |
    dw CODE_01C66D                ;$01C65D |
    dw CODE_01C66D                ;$01C65F |
    dw CODE_01C66D                ;$01C661 |
    dw CODE_01C66D                ;$01C663 |
    dw CODE_01C66D                ;$01C665 |
    dw CODE_01C66D                ;$01C667 |
    dw CODE_JP_01C6D4             ;$01C669 |
    dw CODE_JP_01C6D4             ;$01C66B |

CODE_01C66D:
    LDA.B $70                     ;$01C66D |
    AND.W #$007F                  ;$01C66F |
    ASL A                         ;$01C672 |
    TAX                           ;$01C673 |
    LDA.L TileCollisionProperties_LUT,X         ;$01C674 |
    AND.W #$001F                  ;$01C678 |
    BNE CODE_81C680               ;$01C67B |
    JMP.W CODE_JP_01C6D4          ;$01C67D |

CODE_81C680:
    LDA.B $6C                     ;$01C680 |
    AND.W #$007F                  ;$01C682 |
    ASL A                         ;$01C685 |
    TAX                           ;$01C686 |
    LDA.L TileDamageProperties_LUT,X         ;$01C687 |
    STA.B $6C                     ;$01C68B |
    LDA.L TileCollisionProperties_LUT,X         ;$01C68D |
    BIT.W #$0020                  ;$01C691 |
    BEQ CODE_81C699               ;$01C694 |
    JMP.W CODE_JP_01CDED          ;$01C696 |

CODE_81C699:
    AND.W #$001F                  ;$01C699 |
    TAX                           ;$01C69C |
    JMP.W (PTR16_01C6A0,X)        ;$01C69D |
PTR16_01C6A0:
    dw CODE_JP_01CDED             ;$01C6A0 |
    dw CODE_01C6C0                ;$01C6A2 |
    dw CODE_01C6C0                ;$01C6A4 |
    dw CODE_01C6C0                ;$01C6A6 |
    dw CODE_01C6C0                ;$01C6A8 |
    dw CODE_01C6C0                ;$01C6AA |
    dw CODE_01C6C0                ;$01C6AC |
    dw CODE_01C6C0                ;$01C6AE |
    dw CODE_01C6C0                ;$01C6B0 |
    dw CODE_01C6C0                ;$01C6B2 |
    dw CODE_01C6C0                ;$01C6B4 |
    dw CODE_01C6C0                ;$01C6B6 |
    dw CODE_01C6C0                ;$01C6B8 |
    dw CODE_01C6C0                ;$01C6BA |
    dw CODE_01C6C0                ;$01C6BC |
    dw CODE_01C6C0                ;$01C6BE |

CODE_01C6C0:
    LDA.B $6E                     ;$01C6C0 |
    BNE CODE_81C6C8               ;$01C6C2 |
    LDA.B $6C                     ;$01C6C4 |
    STA.B $6E                     ;$01C6C6 |

CODE_81C6C8:
    LDA.B $76                     ;$01C6C8 |
    EOR.W #$FFFF                  ;$01C6CA |
    INC A                         ;$01C6CD |
    LDY.W #$0001                  ;$01C6CE |
    JMP.W CODE_JP_01CDF0          ;$01C6D1 |

CODE_JP_01C6D4:
    LDA.B $70                     ;$01C6D4 |
    AND.W #$007F                  ;$01C6D6 |
    ASL A                         ;$01C6D9 |
    TAX                           ;$01C6DA |
    LDA.L TileCollisionProperties_LUT,X         ;$01C6DB |
    BIT.W #$0020                  ;$01C6DF |
    BNE CODE_81C717               ;$01C6E2 |
    AND.W #$001F                  ;$01C6E4 |
    TAX                           ;$01C6E7 |
    JMP.W (PTR16_01C6EB,X)        ;$01C6E8 |
PTR16_01C6EB:
    dw CODE_81C717                ;$01C6EB |
    dw CODE_01C70B                ;$01C6ED |
    dw CODE_01C70B                ;$01C6EF |
    dw CODE_01C70B                ;$01C6F1 |
    dw CODE_01C70B                ;$01C6F3 |
    dw CODE_01C70B                ;$01C6F5 |
    dw CODE_01C70B                ;$01C6F7 |
    dw CODE_01C70B                ;$01C6F9 |
    dw CODE_01C70B                ;$01C6FB |
    dw CODE_01C70B                ;$01C6FD |
    dw CODE_01C70B                ;$01C6FF |
    dw CODE_01C70B                ;$01C701 |
    dw CODE_01C70B                ;$01C703 |
    dw CODE_01C70B                ;$01C705 |
    dw CODE_01C70B                ;$01C707 |
    dw CODE_01C70B                ;$01C709 |

CODE_01C70B:
    LDA.W #$0030                  ;$01C70B |
    SEC                           ;$01C70E |
    SBC.B $76                     ;$01C70F |
    LDY.W #$0001                  ;$01C711 |
    JMP.W CODE_JP_01CDF0          ;$01C714 |

CODE_81C717:
    LDA.W #$0018                  ;$01C717 |
    SEC                           ;$01C71A |
    SBC.B $76                     ;$01C71B |
    LDY.W #$0001                  ;$01C71D |
    JMP.W CODE_JP_01CDF0          ;$01C720 |

CODE_FL_01C723:
    JSL.L CODE_FL_01CD34          ;$01C723 |
    LDA.B $6E                     ;$01C727 |
    AND.W #$007F                  ;$01C729 |
    ASL A                         ;$01C72C |
    TAX                           ;$01C72D |
    LDA.L TileDamageProperties_LUT,X         ;$01C72E |
    STA.B $6E                     ;$01C732 |
    LDA.L TileCollisionProperties_LUT,X         ;$01C734 |
    BIT.W #$0020                  ;$01C738 |
    BEQ CODE_81C740               ;$01C73B |
    JMP.W CODE_81C828             ;$01C73D |

CODE_81C740:
    AND.W #$001F                  ;$01C740 |
    TAX                           ;$01C743 |
    JMP.W (PTR16_01C747,X)        ;$01C744 |
PTR16_01C747:
    dw CODE_81C828                ;$01C747 |
    dw CODE_JP_01C94F             ;$01C749 |
    dw CODE_01C767                ;$01C74B |
    dw CODE_JP_01C94F             ;$01C74D |
    dw CODE_01C776                ;$01C74F |
    dw CODE_01C78F                ;$01C751 |
    dw CODE_JP_01C94F             ;$01C753 |
    dw CODE_01C80A                ;$01C755 |
    dw CODE_01C7A8                ;$01C757 |
    dw CODE_01C7C5                ;$01C759 |
    dw CODE_01C7EA                ;$01C75B |
    dw CODE_JP_01C94F             ;$01C75D |
    dw CODE_01C81E                ;$01C75F |
    dw CODE_01C814                ;$01C761 |
    dw CODE_01C814                ;$01C763 |
    dw CODE_01C81E                ;$01C765 |

CODE_01C767:
    LDA.W #$0017                  ;$01C767 |
    SEC                           ;$01C76A |
    SBC.B $76                     ;$01C76B |
    SEC                           ;$01C76D |
    SBC.B $74                     ;$01C76E |
    LDY.W #$0006                  ;$01C770 |
    JMP.W CODE_JP_01CDF0          ;$01C773 |

CODE_01C776:
    LDA.B $76                     ;$01C776 |
    CMP.W #$000C                  ;$01C778 |
    BCS CODE_81C780               ;$01C77B |
    JMP.W CODE_81C828             ;$01C77D |

CODE_81C780:
    LDA.W #$0017                  ;$01C780 |
    SBC.B $76                     ;$01C783 |
    ASL A                         ;$01C785 |
    SEC                           ;$01C786 |
    SBC.B $74                     ;$01C787 |
    LDY.W #$0005                  ;$01C789 |
    JMP.W CODE_JP_01CDF0          ;$01C78C |

CODE_01C78F:
    LDA.B $76                     ;$01C78F |
    CMP.W #$000C                  ;$01C791 |
    BCC CODE_81C799               ;$01C794 |
    JMP.W CODE_JP_01C94F          ;$01C796 |

CODE_81C799:
    LDA.W #$000C                  ;$01C799 |
    SBC.B $76                     ;$01C79C |
    ASL A                         ;$01C79E |
    SEC                           ;$01C79F |
    SBC.B $74                     ;$01C7A0 |
    LDY.W #$0005                  ;$01C7A2 |
    JMP.W CODE_JP_01CDF0          ;$01C7A5 |

CODE_01C7A8:
    LDA.B $76                     ;$01C7A8 |
    CMP.W #$0010                  ;$01C7AA |
    BCC CODE_81C828               ;$01C7AD |
    LDA.W #$0017                  ;$01C7AF |
    SBC.B $76                     ;$01C7B2 |
    TAX                           ;$01C7B4 |
    LDA.L DATA8_01CF7E,X          ;$01C7B5 |
    AND.W #$00FF                  ;$01C7B9 |
    SEC                           ;$01C7BC |
    SBC.B $74                     ;$01C7BD |
    LDY.W #$0005                  ;$01C7BF |
    JMP.W CODE_JP_01CDF0          ;$01C7C2 |

CODE_01C7C5:
    LDA.B $76                     ;$01C7C5 |
    CMP.W #$0008                  ;$01C7C7 |
    BCC CODE_81C828               ;$01C7CA |
    CMP.W #$0010                  ;$01C7CC |
    BCC CODE_81C7D4               ;$01C7CF |
    JMP.W CODE_JP_01C94F          ;$01C7D1 |

CODE_81C7D4:
    LDA.W #$0010                  ;$01C7D4 |
    SBC.B $76                     ;$01C7D7 |
    TAX                           ;$01C7D9 |
    LDA.L DATA8_01CF7E,X          ;$01C7DA |
    AND.W #$00FF                  ;$01C7DE |
    SEC                           ;$01C7E1 |
    SBC.B $74                     ;$01C7E2 |
    LDY.W #$0005                  ;$01C7E4 |
    JMP.W CODE_JP_01CDF0          ;$01C7E7 |

CODE_01C7EA:
    LDA.B $76                     ;$01C7EA |
    CMP.W #$0008                  ;$01C7EC |
    BCC CODE_81C7F4               ;$01C7EF |
    JMP.W CODE_JP_01C94F          ;$01C7F1 |

CODE_81C7F4:
    LDA.W #$0008                  ;$01C7F4 |
    SBC.B $76                     ;$01C7F7 |
    TAX                           ;$01C7F9 |
    LDA.L DATA8_01CF7E,X          ;$01C7FA |
    AND.W #$00FF                  ;$01C7FE |
    SEC                           ;$01C801 |
    SBC.B $74                     ;$01C802 |
    LDY.W #$0005                  ;$01C804 |
    JMP.W CODE_JP_01CDF0          ;$01C807 |

CODE_01C80A:
    LDA.B $76                     ;$01C80A |
    CMP.W #$000C                  ;$01C80C |
    BCC CODE_81C828               ;$01C80F |
    JMP.W CODE_JP_01C94F          ;$01C811 |

CODE_01C814:
    LDA.B $76                     ;$01C814 |
    CMP.W #$0010                  ;$01C816 |
    BCC CODE_81C828               ;$01C819 |
    JMP.W CODE_JP_01C94F          ;$01C81B |

CODE_01C81E:
    LDA.B $76                     ;$01C81E |
    CMP.W #$0008                  ;$01C820 |
    BCC CODE_81C828               ;$01C823 |
    JMP.W CODE_JP_01C94F          ;$01C825 |

CODE_81C828:
    LDA.B $70                     ;$01C828 |
    AND.W #$007F                  ;$01C82A |
    ASL A                         ;$01C82D |
    TAX                           ;$01C82E |
    LDA.L TileDamageProperties_LUT,X         ;$01C82F |
    STA.B $70                     ;$01C833 |
    LDA.L TileCollisionProperties_LUT,X         ;$01C835 |
    BIT.W #$0020                  ;$01C839 |
    BNE CODE_81C880               ;$01C83C |
    AND.W #$001F                  ;$01C83E |
    TAX                           ;$01C841 |
    JMP.W (PTR16_01C845,X)        ;$01C842 |
PTR16_01C845:
    dw CODE_81C880                ;$01C845 |
    dw CODE_81C883                ;$01C847 |
    dw CODE_01C897                ;$01C849 |
    dw CODE_81C883                ;$01C84B |
    dw CODE_01C8AA                ;$01C84D |
    dw CODE_01C8C4                ;$01C84F |
    dw CODE_81C883                ;$01C851 |
    dw CODE_01C865                ;$01C853 |
    dw CODE_01C8DE                ;$01C855 |
    dw CODE_01C8FF                ;$01C857 |
    dw CODE_01C928                ;$01C859 |
    dw CODE_81C883                ;$01C85B |
    dw CODE_01C879                ;$01C85D |
    dw CODE_01C86F                ;$01C85F |
    dw CODE_01C86F                ;$01C861 |
    dw CODE_01C879                ;$01C863 |

CODE_01C865:
    LDA.B $76                     ;$01C865 |
    CMP.W #$000C                  ;$01C867 |
    BCC CODE_81C880               ;$01C86A |
    JMP.W CODE_81C883             ;$01C86C |

CODE_01C86F:
    LDA.B $76                     ;$01C86F |
    CMP.W #$0010                  ;$01C871 |
    BCC CODE_81C880               ;$01C874 |
    JMP.W CODE_81C883             ;$01C876 |

CODE_01C879:
    LDA.B $76                     ;$01C879 |
    CMP.W #$0008                  ;$01C87B |
    BCS CODE_81C883               ;$01C87E |

CODE_81C880:
    JMP.W CODE_JP_01CDED          ;$01C880 |

CODE_81C883:
    LDA.B $6E                     ;$01C883 |
    BNE CODE_81C88B               ;$01C885 |
    LDA.B $70                     ;$01C887 |
    STA.B $6E                     ;$01C889 |

CODE_81C88B:
    LDA.W #$0017                  ;$01C88B |
    SEC                           ;$01C88E |
    SBC.B $74                     ;$01C88F |
    LDY.W #$0001                  ;$01C891 |
    JMP.W CODE_JP_01CDF0          ;$01C894 |

CODE_01C897:
    LDA.W #$0017                  ;$01C897 |
    SEC                           ;$01C89A |
    SBC.B $76                     ;$01C89B |
    SEC                           ;$01C89D |
    SBC.B $74                     ;$01C89E |
    CLC                           ;$01C8A0 |
    ADC.W #$0018                  ;$01C8A1 |
    LDY.W #$0006                  ;$01C8A4 |
    JMP.W CODE_JP_01CDF0          ;$01C8A7 |

CODE_01C8AA:
    LDA.B $76                     ;$01C8AA |
    CMP.W #$000C                  ;$01C8AC |
    BCC CODE_81C880               ;$01C8AF |
    LDA.W #$0017                  ;$01C8B1 |
    SBC.B $76                     ;$01C8B4 |
    ASL A                         ;$01C8B6 |
    SEC                           ;$01C8B7 |
    SBC.B $74                     ;$01C8B8 |
    CLC                           ;$01C8BA |
    ADC.W #$0018                  ;$01C8BB |
    LDY.W #$0005                  ;$01C8BE |
    JMP.W CODE_JP_01CDF0          ;$01C8C1 |

CODE_01C8C4:
    LDA.B $76                     ;$01C8C4 |
    CMP.W #$000C                  ;$01C8C6 |
    BCS CODE_81C883               ;$01C8C9 |
    LDA.W #$000C                  ;$01C8CB |
    SBC.B $76                     ;$01C8CE |
    ASL A                         ;$01C8D0 |
    SEC                           ;$01C8D1 |
    SBC.B $74                     ;$01C8D2 |
    CLC                           ;$01C8D4 |
    ADC.W #$0018                  ;$01C8D5 |
    LDY.W #$0005                  ;$01C8D8 |
    JMP.W CODE_JP_01CDF0          ;$01C8DB |

CODE_01C8DE:
    LDA.B $76                     ;$01C8DE |
    CMP.W #$0010                  ;$01C8E0 |
    BCC CODE_81C880               ;$01C8E3 |
    LDA.W #$0017                  ;$01C8E5 |
    SBC.B $76                     ;$01C8E8 |
    TAX                           ;$01C8EA |
    LDA.L DATA8_01CF7E,X          ;$01C8EB |
    AND.W #$00FF                  ;$01C8EF |
    SEC                           ;$01C8F2 |
    SBC.B $74                     ;$01C8F3 |
    CLC                           ;$01C8F5 |
    ADC.W #$0018                  ;$01C8F6 |
    LDY.W #$0005                  ;$01C8F9 |
    JMP.W CODE_JP_01CDF0          ;$01C8FC |

CODE_01C8FF:
    LDA.B $76                     ;$01C8FF |
    CMP.W #$0008                  ;$01C901 |
    BCC CODE_81C94C               ;$01C904 |
    CMP.W #$0010                  ;$01C906 |
    BCC CODE_81C90E               ;$01C909 |
    JMP.W CODE_81C883             ;$01C90B |

CODE_81C90E:
    LDA.W #$0010                  ;$01C90E |
    SBC.B $76                     ;$01C911 |
    TAX                           ;$01C913 |
    LDA.L DATA8_01CF7E,X          ;$01C914 |
    AND.W #$00FF                  ;$01C918 |
    SEC                           ;$01C91B |
    SBC.B $74                     ;$01C91C |
    CLC                           ;$01C91E |
    ADC.W #$0018                  ;$01C91F |
    LDY.W #$0005                  ;$01C922 |
    JMP.W CODE_JP_01CDF0          ;$01C925 |

CODE_01C928:
    LDA.B $76                     ;$01C928 |
    CMP.W #$0008                  ;$01C92A |
    BCC CODE_81C932               ;$01C92D |
    JMP.W CODE_81C883             ;$01C92F |

CODE_81C932:
    LDA.W #$0008                  ;$01C932 |
    SBC.B $76                     ;$01C935 |
    TAX                           ;$01C937 |
    LDA.L DATA8_01CF7E,X          ;$01C938 |
    AND.W #$00FF                  ;$01C93C |
    SEC                           ;$01C93F |
    SBC.B $74                     ;$01C940 |
    CLC                           ;$01C942 |
    ADC.W #$0018                  ;$01C943 |
    LDY.W #$0005                  ;$01C946 |
    JMP.W CODE_JP_01CDF0          ;$01C949 |

CODE_81C94C:
    JMP.W CODE_JP_01CDED          ;$01C94C |

CODE_JP_01C94F:
    LDA.B $6C                     ;$01C94F |
    AND.W #$007F                  ;$01C951 |
    ASL A                         ;$01C954 |
    TAX                           ;$01C955 |
    LDA.L TileCollisionProperties_LUT,X         ;$01C956 |
    BIT.W #$0020                  ;$01C95A |
    BNE CODE_81C9A1               ;$01C95D |
    AND.W #$001F                  ;$01C95F |
    TAX                           ;$01C962 |
    JMP.W (PTR16_01C966,X)        ;$01C963 |
PTR16_01C966:
    dw CODE_81C9A1                ;$01C966 |
    dw CODE_81C9AD                ;$01C968 |
    dw CODE_01C9B9                ;$01C96A |
    dw CODE_81C9AD                ;$01C96C |
    dw CODE_01C9CC                ;$01C96E |
    dw CODE_01C9E6                ;$01C970 |
    dw CODE_81C9AD                ;$01C972 |
    dw CODE_01C986                ;$01C974 |
    dw CODE_01CA00                ;$01C976 |
    dw CODE_01CA21                ;$01C978 |
    dw CODE_01CA4D                ;$01C97A |
    dw CODE_81C9AD                ;$01C97C |
    dw CODE_01C99A                ;$01C97E |
    dw CODE_01C990                ;$01C980 |
    dw CODE_01C990                ;$01C982 |
    dw CODE_01C99A                ;$01C984 |

CODE_01C986:
    LDA.B $76                     ;$01C986 |
    CMP.W #$000C                  ;$01C988 |
    BCC CODE_81C9A1               ;$01C98B |
    JMP.W CODE_81C9AD             ;$01C98D |

CODE_01C990:
    LDA.B $76                     ;$01C990 |
    CMP.W #$0010                  ;$01C992 |
    BCC CODE_81C9A1               ;$01C995 |
    JMP.W CODE_81C9AD             ;$01C997 |

CODE_01C99A:
    LDA.B $76                     ;$01C99A |
    CMP.W #$0008                  ;$01C99C |
    BCS CODE_81C9AD               ;$01C99F |

CODE_81C9A1:
    LDY.W #$0001                  ;$01C9A1 |
    LDA.B $74                     ;$01C9A4 |
    EOR.W #$FFFF                  ;$01C9A6 |
    INC A                         ;$01C9A9 |
    JMP.W CODE_JP_01CDF0          ;$01C9AA |

CODE_81C9AD:
    LDY.W #$0001                  ;$01C9AD |
    LDA.W #$002F                  ;$01C9B0 |
    SEC                           ;$01C9B3 |
    SBC.B $74                     ;$01C9B4 |
    JMP.W CODE_JP_01CDF0          ;$01C9B6 |

CODE_01C9B9:
    LDA.W #$0017                  ;$01C9B9 |
    SEC                           ;$01C9BC |
    SBC.B $76                     ;$01C9BD |
    SEC                           ;$01C9BF |
    SBC.B $74                     ;$01C9C0 |
    SEC                           ;$01C9C2 |
    SBC.W #$0018                  ;$01C9C3 |
    LDY.W #$0006                  ;$01C9C6 |
    JMP.W CODE_JP_01CDF0          ;$01C9C9 |

CODE_01C9CC:
    LDA.B $76                     ;$01C9CC |
    CMP.W #$000C                  ;$01C9CE |
    BCC CODE_81C9A1               ;$01C9D1 |
    LDA.W #$0017                  ;$01C9D3 |
    SBC.B $76                     ;$01C9D6 |
    ASL A                         ;$01C9D8 |
    SEC                           ;$01C9D9 |
    SBC.B $74                     ;$01C9DA |
    SEC                           ;$01C9DC |
    SBC.W #$0018                  ;$01C9DD |
    LDY.W #$0005                  ;$01C9E0 |
    JMP.W CODE_JP_01CDF0          ;$01C9E3 |

CODE_01C9E6:
    LDA.B $76                     ;$01C9E6 |
    CMP.W #$000C                  ;$01C9E8 |
    BCS CODE_81C9AD               ;$01C9EB |
    LDA.W #$000C                  ;$01C9ED |
    SBC.B $76                     ;$01C9F0 |
    ASL A                         ;$01C9F2 |
    SEC                           ;$01C9F3 |
    SBC.B $74                     ;$01C9F4 |
    SEC                           ;$01C9F6 |
    SBC.W #$0018                  ;$01C9F7 |
    LDY.W #$0005                  ;$01C9FA |
    JMP.W CODE_JP_01CDF0          ;$01C9FD |

CODE_01CA00:
    LDA.B $76                     ;$01CA00 |
    CMP.W #$0010                  ;$01CA02 |
    BCC CODE_81C9A1               ;$01CA05 |
    LDA.W #$0017                  ;$01CA07 |
    SBC.B $76                     ;$01CA0A |
    TAX                           ;$01CA0C |
    LDA.L DATA8_01CF7E,X          ;$01CA0D |
    AND.W #$00FF                  ;$01CA11 |
    SEC                           ;$01CA14 |
    SBC.B $74                     ;$01CA15 |
    SEC                           ;$01CA17 |
    SBC.W #$0018                  ;$01CA18 |
    LDY.W #$0005                  ;$01CA1B |
    JMP.W CODE_JP_01CDF0          ;$01CA1E |

CODE_01CA21:
    LDA.B $76                     ;$01CA21 |
    CMP.W #$0008                  ;$01CA23 |
    BCC CODE_81CA30               ;$01CA26 |
    CMP.W #$0010                  ;$01CA28 |
    BCC CODE_81CA33               ;$01CA2B |
    JMP.W CODE_81C9AD             ;$01CA2D |

CODE_81CA30:
    JMP.W CODE_81C9A1             ;$01CA30 |

CODE_81CA33:
    LDA.W #$0010                  ;$01CA33 |
    SBC.B $76                     ;$01CA36 |
    TAX                           ;$01CA38 |
    LDA.L DATA8_01CF7E,X          ;$01CA39 |
    AND.W #$00FF                  ;$01CA3D |
    SEC                           ;$01CA40 |
    SBC.B $74                     ;$01CA41 |
    SEC                           ;$01CA43 |
    SBC.W #$0018                  ;$01CA44 |
    LDY.W #$0005                  ;$01CA47 |
    JMP.W CODE_JP_01CDF0          ;$01CA4A |

CODE_01CA4D:
    LDA.B $76                     ;$01CA4D |
    CMP.W #$0008                  ;$01CA4F |
    BCC CODE_81CA57               ;$01CA52 |
    JMP.W CODE_81C9AD             ;$01CA54 |

CODE_81CA57:
    LDA.W #$0008                  ;$01CA57 |
    SBC.B $76                     ;$01CA5A |
    TAX                           ;$01CA5C |
    LDA.L DATA8_01CF7E,X          ;$01CA5D |
    AND.W #$00FF                  ;$01CA61 |
    SEC                           ;$01CA64 |
    SBC.B $74                     ;$01CA65 |
    SEC                           ;$01CA67 |
    SBC.W #$0018                  ;$01CA68 |
    LDY.W #$0005                  ;$01CA6B |
    JMP.W CODE_JP_01CDF0          ;$01CA6E |

CODE_FL_01CA71:
    JSL.L CODE_FL_01CD34          ;$01CA71 |
    LDA.B $6E                     ;$01CA75 |
    AND.W #$007F                  ;$01CA77 |
    ASL A                         ;$01CA7A |
    TAX                           ;$01CA7B |
    LDA.L TileDamageProperties_LUT,X         ;$01CA7C |
    STA.B $6E                     ;$01CA80 |
    LDA.L TileCollisionProperties_LUT,X         ;$01CA82 |
    BIT.W #$0020                  ;$01CA86 |
    BEQ CODE_81CA8E               ;$01CA89 |
    JMP.W CODE_81CB33             ;$01CA8B |

CODE_81CA8E:
    AND.W #$001F                  ;$01CA8E |
    TAX                           ;$01CA91 |
    JMP.W (PTR16_01CA95,X)        ;$01CA92 |
PTR16_01CA95:
    dw CODE_81CB33                ;$01CA95 |
    dw CODE_JP_01CC03             ;$01CA97 |
    dw CODE_JP_01CC03             ;$01CA99 |
    dw CODE_01CAB5                ;$01CA9B |
    dw CODE_01CB15                ;$01CA9D |
    dw CODE_JP_01CC03             ;$01CA9F |
    dw CODE_01CAC0                ;$01CAA1 |
    dw CODE_01CACA                ;$01CAA3 |
    dw CODE_01CB1F                ;$01CAA5 |
    dw CODE_01CB29                ;$01CAA7 |
    dw CODE_JP_01CC03             ;$01CAA9 |
    dw CODE_01CAE1                ;$01CAAB |
    dw CODE_01CAEB                ;$01CAAD |
    dw CODE_01CAFC                ;$01CAAF |
    dw CODE_01CB1F                ;$01CAB1 |
    dw CODE_01CB29                ;$01CAB3 |

CODE_01CAB5:
    LDA.B $76                     ;$01CAB5 |
    SEC                           ;$01CAB7 |
    SBC.B $74                     ;$01CAB8 |
    LDY.W #$0009                  ;$01CABA |
    JMP.W CODE_JP_01CDF0          ;$01CABD |

CODE_01CAC0:
    LDA.B $76                     ;$01CAC0 |
    CMP.W #$000C                  ;$01CAC2 |
    BCC CODE_01CAD7               ;$01CAC5 |
    JMP.W CODE_JP_01CC03          ;$01CAC7 |

CODE_01CACA:
    LDA.B $76                     ;$01CACA |
    CMP.W #$000C                  ;$01CACC |
    BCS CODE_01CAD4               ;$01CACF |
    JMP.W CODE_81CB33             ;$01CAD1 |

CODE_01CAD4:
    SBC.W #$000B                  ;$01CAD4 |

CODE_01CAD7:
    ASL A                         ;$01CAD7 |
    SEC                           ;$01CAD8 |
    SBC.B $74                     ;$01CAD9 |
    LDY.W #$0008                  ;$01CADB |
    JMP.W CODE_JP_01CDF0          ;$01CADE |

CODE_01CAE1:
    LDX.B $76                     ;$01CAE1 |
    CPX.W #$0008                  ;$01CAE3 |
    BCC CODE_81CB05               ;$01CAE6 |
    JMP.W CODE_JP_01CC03          ;$01CAE8 |

CODE_01CAEB:
    LDA.B $76                     ;$01CAEB |
    CMP.W #$0010                  ;$01CAED |
    BCC CODE_81CAF5               ;$01CAF0 |
    JMP.W CODE_JP_01CC03          ;$01CAF2 |

CODE_81CAF5:
    SBC.W #$0007                  ;$01CAF5 |
    BCC CODE_81CB33               ;$01CAF8 |
    BRA CODE_81CB04               ;$01CAFA |

CODE_01CAFC:
    LDA.B $76                     ;$01CAFC |
    SEC                           ;$01CAFE |
    SBC.W #$0010                  ;$01CAFF |
    BCC CODE_81CB33               ;$01CB02 |

CODE_81CB04:
    TAX                           ;$01CB04 |

CODE_81CB05:
    LDA.L DATA8_01CF7E,X          ;$01CB05 |
    AND.W #$00FF                  ;$01CB09 |
    SEC                           ;$01CB0C |
    SBC.B $74                     ;$01CB0D |
    LDY.W #$0007                  ;$01CB0F |
    JMP.W CODE_JP_01CDF0          ;$01CB12 |

CODE_01CB15:
    LDA.B $76                     ;$01CB15 |
    CMP.W #$000C                  ;$01CB17 |
    BCC CODE_81CB33               ;$01CB1A |
    JMP.W CODE_JP_01CC03          ;$01CB1C |

CODE_01CB1F:
    LDA.B $76                     ;$01CB1F |
    CMP.W #$0010                  ;$01CB21 |
    BCC CODE_81CB33               ;$01CB24 |
    JMP.W CODE_JP_01CC03          ;$01CB26 |

CODE_01CB29:
    LDA.B $76                     ;$01CB29 |
    CMP.W #$0008                  ;$01CB2B |
    BCC CODE_81CB33               ;$01CB2E |
    JMP.W CODE_JP_01CC03          ;$01CB30 |

CODE_81CB33:
    LDA.B $6C                     ;$01CB33 |
    AND.W #$007F                  ;$01CB35 |
    ASL A                         ;$01CB38 |
    TAX                           ;$01CB39 |
    LDA.L TileDamageProperties_LUT,X         ;$01CB3A |
    STA.B $6C                     ;$01CB3E |
    LDA.L TileCollisionProperties_LUT,X         ;$01CB40 |
    BIT.W #$0020                  ;$01CB44 |
    BNE CODE_81CB89               ;$01CB47 |
    AND.W #$001F                  ;$01CB49 |
    TAX                           ;$01CB4C |
    JMP.W (PTR16_01CB50,X)        ;$01CB4D |
PTR16_01CB50:
    dw CODE_81CB89                ;$01CB50 |
    dw CODE_81CB8C                ;$01CB52 |
    dw CODE_81CB89                ;$01CB54 |
    dw CODE_01CBA0                ;$01CB56 |
    dw CODE_01CB70                ;$01CB58 |
    dw CODE_81CB8C                ;$01CB5A |
    dw CODE_01CBAF                ;$01CB5C |
    dw CODE_01CBB8                ;$01CB5E |
    dw CODE_01CB79                ;$01CB60 |
    dw CODE_01CB82                ;$01CB62 |
    dw CODE_81CB8C                ;$01CB64 |
    dw CODE_01CBD0                ;$01CB66 |
    dw CODE_01CBD9                ;$01CB68 |
    dw CODE_01CBE7                ;$01CB6A |
    dw CODE_01CB79                ;$01CB6C |
    dw CODE_01CB82                ;$01CB6E |

CODE_01CB70:
    LDA.B $76                     ;$01CB70 |
    CMP.W #$000C                  ;$01CB72 |
    BCC CODE_81CB89               ;$01CB75 |
    BRA CODE_81CB8C               ;$01CB77 |

CODE_01CB79:
    LDA.B $76                     ;$01CB79 |
    CMP.W #$0010                  ;$01CB7B |
    BCC CODE_81CB89               ;$01CB7E |
    BRA CODE_81CB8C               ;$01CB80 |

CODE_01CB82:
    LDA.B $76                     ;$01CB82 |
    CMP.W #$0008                  ;$01CB84 |
    BCS CODE_81CB8C               ;$01CB87 |

CODE_81CB89:
    JMP.W CODE_JP_01CDED          ;$01CB89 |

CODE_81CB8C:
    LDA.B $6E                     ;$01CB8C |
    BEQ CODE_81CB94               ;$01CB8E |
    LDA.B $6C                     ;$01CB90 |
    STA.B $6E                     ;$01CB92 |

CODE_81CB94:
    LDA.B $74                     ;$01CB94 |
    EOR.W #$FFFF                  ;$01CB96 |
    INC A                         ;$01CB99 |
    LDY.W #$0001                  ;$01CB9A |
    JMP.W CODE_JP_01CDF0          ;$01CB9D |

CODE_01CBA0:
    LDA.B $76                     ;$01CBA0 |
    SEC                           ;$01CBA2 |
    SBC.B $74                     ;$01CBA3 |
    SEC                           ;$01CBA5 |
    SBC.W #$0018                  ;$01CBA6 |
    LDY.W #$0009                  ;$01CBA9 |
    JMP.W CODE_JP_01CDF0          ;$01CBAC |

CODE_01CBAF:
    LDA.B $76                     ;$01CBAF |
    CMP.W #$000C                  ;$01CBB1 |
    BCS CODE_81CB8C               ;$01CBB4 |
    BRA CODE_01CBC2               ;$01CBB6 |

CODE_01CBB8:
    LDA.B $76                     ;$01CBB8 |
    CMP.W #$000C                  ;$01CBBA |
    BCC CODE_81CB89               ;$01CBBD |
    SBC.W #$000B                  ;$01CBBF |

CODE_01CBC2:
    ASL A                         ;$01CBC2 |
    SEC                           ;$01CBC3 |
    SBC.B $74                     ;$01CBC4 |
    SEC                           ;$01CBC6 |
    SBC.W #$0018                  ;$01CBC7 |
    LDY.W #$0008                  ;$01CBCA |
    JMP.W CODE_JP_01CDF0          ;$01CBCD |

CODE_01CBD0:
    LDX.B $76                     ;$01CBD0 |
    CPX.W #$0008                  ;$01CBD2 |
    BCS CODE_81CB8C               ;$01CBD5 |
    BRA CODE_81CBF0               ;$01CBD7 |

CODE_01CBD9:
    LDA.B $76                     ;$01CBD9 |
    CMP.W #$0010                  ;$01CBDB |
    BCS CODE_81CB8C               ;$01CBDE |
    SBC.W #$0007                  ;$01CBE0 |
    BCC CODE_81CB89               ;$01CBE3 |
    BRA CODE_81CBEF               ;$01CBE5 |

CODE_01CBE7:
    LDA.B $76                     ;$01CBE7 |
    SEC                           ;$01CBE9 |
    SBC.W #$0010                  ;$01CBEA |
    BCC CODE_81CB89               ;$01CBED |

CODE_81CBEF:
    TAX                           ;$01CBEF |

CODE_81CBF0:
    LDA.L DATA8_01CF7E,X          ;$01CBF0 |
    AND.W #$00FF                  ;$01CBF4 |
    SBC.B $74                     ;$01CBF7 |
    SEC                           ;$01CBF9 |
    SBC.W #$0018                  ;$01CBFA |
    LDY.W #$0007                  ;$01CBFD |
    JMP.W CODE_JP_01CDF0          ;$01CC00 |

CODE_JP_01CC03:
    LDA.B $70                     ;$01CC03 |
    AND.W #$007F                  ;$01CC05 |
    ASL A                         ;$01CC08 |
    TAX                           ;$01CC09 |
    LDA.L TileCollisionProperties_LUT,X         ;$01CC0A |
    BIT.W #$0020                  ;$01CC0E |
    BNE CODE_81CC53               ;$01CC11 |
    AND.W #$001F                  ;$01CC13 |
    TAX                           ;$01CC16 |
    JMP.W (PTR16_01CC1A,X)        ;$01CC17 |
PTR16_01CC1A:
    dw CODE_81CC53                ;$01CC1A |
    dw CODE_81CC5F                ;$01CC1C |
    dw CODE_81CC5F                ;$01CC1E |
    dw CODE_01CC6B                ;$01CC20 |
    dw CODE_01CC3A                ;$01CC22 |
    dw CODE_81CC5F                ;$01CC24 |
    dw CODE_01CC79                ;$01CC26 |
    dw CODE_01CC82                ;$01CC28 |
    dw CODE_01CC43                ;$01CC2A |
    dw CODE_01CC4C                ;$01CC2C |
    dw CODE_81CC5F                ;$01CC2E |
    dw CODE_01CC9A                ;$01CC30 |
    dw CODE_01CCA3                ;$01CC32 |
    dw CODE_01CCB1                ;$01CC34 |
    dw CODE_01CC43                ;$01CC36 |
    dw CODE_01CC4C                ;$01CC38 |

CODE_01CC3A:
    LDA.B $76                     ;$01CC3A |
    CMP.W #$000C                  ;$01CC3C |
    BCC CODE_81CC53               ;$01CC3F |
    BRA CODE_81CC5F               ;$01CC41 |

CODE_01CC43:
    LDA.B $76                     ;$01CC43 |
    CMP.W #$0010                  ;$01CC45 |
    BCC CODE_81CC53               ;$01CC48 |
    BRA CODE_81CC5F               ;$01CC4A |

CODE_01CC4C:
    LDA.B $76                     ;$01CC4C |
    CMP.W #$0008                  ;$01CC4E |
    BCS CODE_81CC5F               ;$01CC51 |

CODE_81CC53:
    LDY.W #$0001                  ;$01CC53 |
    LDA.W #$0018                  ;$01CC56 |
    SEC                           ;$01CC59 |
    SBC.B $74                     ;$01CC5A |
    JMP.W CODE_JP_01CDF0          ;$01CC5C |

CODE_81CC5F:
    LDY.W #$0001                  ;$01CC5F |
    LDA.W #$0030                  ;$01CC62 |
    SEC                           ;$01CC65 |
    SBC.B $74                     ;$01CC66 |
    JMP.W CODE_JP_01CDF0          ;$01CC68 |

CODE_01CC6B:
    LDA.B $76                     ;$01CC6B |
    CLC                           ;$01CC6D |
    ADC.W #$0019                  ;$01CC6E |
    SBC.B $74                     ;$01CC71 |
    LDY.W #$0009                  ;$01CC73 |
    JMP.W CODE_JP_01CDF0          ;$01CC76 |

CODE_01CC79:
    LDA.B $76                     ;$01CC79 |
    CMP.W #$000C                  ;$01CC7B |
    BCS CODE_81CC5F               ;$01CC7E |
    BRA CODE_01CC8C               ;$01CC80 |

CODE_01CC82:
    LDA.B $76                     ;$01CC82 |
    CMP.W #$000C                  ;$01CC84 |
    BCC CODE_81CC53               ;$01CC87 |
    SBC.W #$000B                  ;$01CC89 |

CODE_01CC8C:
    ASL A                         ;$01CC8C |
    SEC                           ;$01CC8D |
    SBC.B $74                     ;$01CC8E |
    CLC                           ;$01CC90 |
    ADC.W #$0018                  ;$01CC91 |
    LDY.W #$0008                  ;$01CC94 |
    JMP.W CODE_JP_01CDF0          ;$01CC97 |

CODE_01CC9A:
    LDX.B $76                     ;$01CC9A |
    CPX.W #$0008                  ;$01CC9C |
    BCS CODE_81CC5F               ;$01CC9F |
    BRA CODE_01CCBA               ;$01CCA1 |

CODE_01CCA3:
    LDA.B $76                     ;$01CCA3 |
    CMP.W #$0010                  ;$01CCA5 |
    BCS CODE_81CC5F               ;$01CCA8 |
    SBC.W #$0007                  ;$01CCAA |
    BCC CODE_81CC53               ;$01CCAD |
    BRA CODE_81CCB9               ;$01CCAF |

CODE_01CCB1:
    LDA.B $76                     ;$01CCB1 |
    SEC                           ;$01CCB3 |
    SBC.W #$0010                  ;$01CCB4 |
    BCC CODE_81CC53               ;$01CCB7 |

CODE_81CCB9:
    TAX                           ;$01CCB9 |

CODE_01CCBA:
    LDA.L DATA8_01CF7E,X          ;$01CCBA |
    AND.W #$00FF                  ;$01CCBE |
    SBC.B $74                     ;$01CCC1 |
    CLC                           ;$01CCC3 |
    ADC.W #$0018                  ;$01CCC4 |
    LDY.W #$0007                  ;$01CCC7 |
    JMP.W CODE_JP_01CDF0          ;$01CCCA |

CODE_FL_01CCCD:
    JSL.L CODE_FL_01CE46          ;$01CCCD |
    BIT.W $0000                   ;$01CCD1 |
    BPL CODE_81CCE0               ;$01CCD4 |
    LDA.W #$CCE0                  ;$01CCD6 |
    LDX.W #$0001                  ;$01CCD9 |
    JML.L SA1_ExecuteSNES         ;$01CCDC |

CODE_81CCE0:
    LDA.B [$64]                   ;$01CCE0 |
    AND.W #$03FF                  ;$01CCE2 |
    TAX                           ;$01CCE5 |
    LDA.L $7F62A0,X               ;$01CCE6 |
    AND.W #$00FF                  ;$01CCEA |
    STA.B $6E                     ;$01CCED |
    LDY.B $64                     ;$01CCEF |
    LDA.B $66                     ;$01CCF1 |
    STA.B $6A                     ;$01CCF3 |
    BMI CODE_81CD01               ;$01CCF5 |
    AND.W #$0100                  ;$01CCF7 |
    BNE CODE_81CD01               ;$01CCFA |
    TYA                           ;$01CCFC |
    SEC                           ;$01CCFD |
    SBC.B $53                     ;$01CCFE |
    TAY                           ;$01CD00 |

CODE_81CD01:
    STY.B $68                     ;$01CD01 |
    LDA.B [$68]                   ;$01CD03 |
    AND.W #$03FF                  ;$01CD05 |
    TAX                           ;$01CD08 |
    LDA.L $7F62A0,X               ;$01CD09 |
    AND.W #$00FF                  ;$01CD0D |
    STA.B $6C                     ;$01CD10 |
    LDY.B $64                     ;$01CD12 |
    LDA.B $66                     ;$01CD14 |
    BMI CODE_81CD22               ;$01CD16 |
    AND.W #$0200                  ;$01CD18 |
    BNE CODE_81CD22               ;$01CD1B |
    TYA                           ;$01CD1D |
    CLC                           ;$01CD1E |
    ADC.B $53                     ;$01CD1F |
    TAY                           ;$01CD21 |

CODE_81CD22:
    STY.B $68                     ;$01CD22 |
    LDA.B [$68]                   ;$01CD24 |
    AND.W #$03FF                  ;$01CD26 |
    TAX                           ;$01CD29 |
    LDA.L $7F62A0,X               ;$01CD2A |
    AND.W #$00FF                  ;$01CD2E |
    STA.B $70                     ;$01CD31 |
    RTL                           ;$01CD33 |

CODE_FL_01CD34:
    STX.B $74                     ;$01CD34 |
    STY.B $76                     ;$01CD36 |
    LDY.W #$0000                  ;$01CD38 |

CODE_01CD3B:
    LDA.W $73B9,Y                 ;$01CD3B |
    BMI CODE_81CD84               ;$01CD3E |
    LDA.W $73D1,Y                 ;$01CD40 |
    CLC                           ;$01CD43 |
    ADC.W #$000C                  ;$01CD44 |
    CMP.B $76                     ;$01CD47 |
    BCS CODE_01CD7D               ;$01CD49 |
    ADC.W $73DD,Y                 ;$01CD4B |
    CMP.B $76                     ;$01CD4E |
    BCC CODE_01CD7D               ;$01CD50 |
    LDA.W $73C5,Y                 ;$01CD52 |
    SEC                           ;$01CD55 |
    SBC.W #$000C                  ;$01CD56 |
    SBC.B $74                     ;$01CD59 |
    BCS CODE_01CD7D               ;$01CD5B |
    CMP.W #$FFE8                  ;$01CD5D |
    BCC CODE_01CD7D               ;$01CD60 |
    LDA.W #$0050                  ;$01CD62 |
    STA.B $6E                     ;$01CD65 |
    STZ.B $6C                     ;$01CD67 |
    STZ.B $70                     ;$01CD69 |
    BIT.W $0000                   ;$01CD6B |
    BPL CODE_01CD73               ;$01CD6E |
    JMP.W CODE_81CE59             ;$01CD70 |

CODE_01CD73:
    LDA.W #$CE59                  ;$01CD73 |
    LDX.W #$0001                  ;$01CD76 |
    JML.L SNES_ExecuteSA1         ;$01CD79 |

CODE_01CD7D:
    INY                           ;$01CD7D |
    INY                           ;$01CD7E |
    CPY.W #$000C                  ;$01CD7F |
    BCC CODE_01CD3B               ;$01CD82 |

CODE_81CD84:
    BIT.W $0000                   ;$01CD84 |
    BMI CODE_81CD95               ;$01CD87 |
    LDA.W #$CE59                  ;$01CD89 |
    LDX.W #$0001                  ;$01CD8C |
    JSL.L SNES_ExecuteSA1         ;$01CD8F |
    BRA CODE_01CDA3               ;$01CD93 |

CODE_81CD95:
    JSL.L CODE_81CE59             ;$01CD95 |
    LDA.W #$CDA3                  ;$01CD99 |
    LDX.W #$0001                  ;$01CD9C |
    JML.L SA1_ExecuteSNES         ;$01CD9F |

CODE_01CDA3:
    LDA.B [$64]                   ;$01CDA3 |
    AND.W #$03FF                  ;$01CDA5 |
    TAX                           ;$01CDA8 |
    LDA.L $7F62A0,X               ;$01CDA9 |
    AND.W #$00FF                  ;$01CDAD |
    STA.B $6E                     ;$01CDB0 |
    LDX.B $64                     ;$01CDB2 |
    LDA.B $66                     ;$01CDB4 |
    STA.B $6A                     ;$01CDB6 |
    AND.W #$0400                  ;$01CDB8 |
    BNE CODE_81CDBF               ;$01CDBB |
    DEX                           ;$01CDBD |
    DEX                           ;$01CDBE |

CODE_81CDBF:
    STX.B $68                     ;$01CDBF |
    LDA.B [$68]                   ;$01CDC1 |
    AND.W #$03FF                  ;$01CDC3 |
    TAX                           ;$01CDC6 |
    LDA.L $7F62A0,X               ;$01CDC7 |
    AND.W #$00FF                  ;$01CDCB |
    STA.B $6C                     ;$01CDCE |
    LDX.B $64                     ;$01CDD0 |
    LDA.B $66                     ;$01CDD2 |
    AND.W #$0800                  ;$01CDD4 |
    BNE CODE_81CDDB               ;$01CDD7 |
    INX                           ;$01CDD9 |
    INX                           ;$01CDDA |

CODE_81CDDB:
    STX.B $68                     ;$01CDDB |
    LDA.B [$68]                   ;$01CDDD |
    AND.W #$03FF                  ;$01CDDF |
    TAX                           ;$01CDE2 |
    LDA.L $7F62A0,X               ;$01CDE3 |
    AND.W #$00FF                  ;$01CDE7 |
    STA.B $70                     ;$01CDEA |
    RTL                           ;$01CDEC |

CODE_JP_01CDED:
    LDY.W #$0000                  ;$01CDED |

CODE_JP_01CDF0:
    LDX.B $6E                     ;$01CDF0 |
    RTL                           ;$01CDF2 |

CODE_FL_01CDF3:
    PHX                           ;$01CDF3 |
    PHY                           ;$01CDF4 |
    JSL.L CODE_FL_01CE20          ;$01CDF5 |
    CMP.W #$0070                  ;$01CDF9 |
    BNE CODE_01CE1C               ;$01CDFC |
	%LoadLongToAX(CODE_FN_019E21)
    JSL.L SA1_ExecuteSNES         ;$01CE04 |
    PLY                           ;$01CE08 |
    SEC                           ;$01CE09 |
    SBC.B $76                     ;$01CE0A |
    CLC                           ;$01CE0C |
    ADC.W #$000B                  ;$01CE0D |
    TAY                           ;$01CE10 |
    PLX                           ;$01CE11 |
    SEC                           ;$01CE12 |
    SBC.B $74                     ;$01CE13 |
    CLC                           ;$01CE15 |
    ADC.W #$000B                  ;$01CE16 |
    TAX                           ;$01CE19 |
    SEC                           ;$01CE1A |
    RTL                           ;$01CE1B |

CODE_01CE1C:
    PLY                           ;$01CE1C |
    PLX                           ;$01CE1D |
    CLC                           ;$01CE1E |
    RTL                           ;$01CE1F |

CODE_FL_01CE20:
    JSL.L CODE_FL_01CE46          ;$01CE20 |
    BIT.W $0000                   ;$01CE24 |
    BPL CODE_81CE36               ;$01CE27 |
    LDA.W #$CE36                  ;$01CE29 |
    LDX.W #$0001                  ;$01CE2C |
    JSL.L SA1_ExecuteSNES         ;$01CE2F |
    LDA.B $72                     ;$01CE33 |
    RTL                           ;$01CE35 |

CODE_81CE36:
    LDA.B [$64]                   ;$01CE36 |
    AND.W #$03FF                  ;$01CE38 |
    TAX                           ;$01CE3B |
    LDA.L $7F62A0,X               ;$01CE3C |
    AND.W #$00FF                  ;$01CE40 |
    STA.B $72                     ;$01CE43 |
    RTL                           ;$01CE45 |

CODE_FL_01CE46:
    STX.B $74                     ;$01CE46 |
    STY.B $76                     ;$01CE48 |
    BIT.W $0000                   ;$01CE4A |
    BMI CODE_81CE59               ;$01CE4D |
    LDA.W #$CE59                  ;$01CE4F |
    LDX.W #$0001                  ;$01CE52 |
    JML.L SNES_ExecuteSA1         ;$01CE55 |

CODE_81CE59:
    LDX.W #$0018                  ;$01CE59 |
    LDA.W #$007F                  ;$01CE5C |
    STA.B $66                     ;$01CE5F |
    STA.B $6A                     ;$01CE61 |
    LDY.W #$0000                  ;$01CE63 |
    LDA.B $76                     ;$01CE66 |
    BPL CODE_81CE71               ;$01CE68 |
    STZ.B $76                     ;$01CE6A |
    LDY.W #$8100                  ;$01CE6C |
    BRA CODE_81CE98               ;$01CE6F |

CODE_81CE71:
    CMP.W #$0018                  ;$01CE71 |
    BCS CODE_81CE7B               ;$01CE74 |
    LDY.W #$0100                  ;$01CE76 |
    BRA CODE_81CE98               ;$01CE79 |

CODE_81CE7B:
    LDA.W $3368                   ;$01CE7B |
    CLC                           ;$01CE7E |
    ADC.W #$00B1                  ;$01CE7F |
    SBC.B $76                     ;$01CE82 |
    BCS CODE_81CE90               ;$01CE84 |
    ADC.B $76                     ;$01CE86 |
    DEC A                         ;$01CE88 |
    STA.B $76                     ;$01CE89 |
    LDY.W #$8200                  ;$01CE8B |
    BRA CODE_81CE98               ;$01CE8E |

CODE_81CE90:
    CMP.W #$0018                  ;$01CE90 |
    BCS CODE_81CE98               ;$01CE93 |
    LDY.W #$0200                  ;$01CE95 |

CODE_81CE98:
    TYA                           ;$01CE98 |
    TSB.B $66                     ;$01CE99 |
    LDA.W #$0001                  ;$01CE9B |
    STA.W $2250                   ;$01CE9E |
    LDA.B $76                     ;$01CEA1 |
    STA.W $2251                   ;$01CEA3 |
    STX.W $2253                   ;$01CEA6 |
    LDY.B $57                     ;$01CEA9 |
    LDA.W $2308                   ;$01CEAB |
    STA.B $76                     ;$01CEAE |
    LDA.W $2306                   ;$01CEB0 |
    STA.W $2251                   ;$01CEB3 |
    STY.W $2253                   ;$01CEB6 |
    LDY.B $53                     ;$01CEB9 |
    LDA.W $2308                   ;$01CEBB |
    STZ.W $2250                   ;$01CEBE |
    STA.W $2251                   ;$01CEC1 |
    STY.W $2253                   ;$01CEC4 |
    LDY.W #$0000                  ;$01CEC7 |
    LDA.W $2306                   ;$01CECA |
    STA.B $64                     ;$01CECD |
    LDA.B $74                     ;$01CECF |
    BPL CODE_81CEDA               ;$01CED1 |
    STZ.B $74                     ;$01CED3 |
    LDY.W #$8400                  ;$01CED5 |
    BRA CODE_81CF02               ;$01CED8 |

CODE_81CEDA:
    CMP.W #$0018                  ;$01CEDA |
    BCS CODE_81CEE4               ;$01CEDD |
    LDY.W #$0400                  ;$01CEDF |
    BRA CODE_81CF02               ;$01CEE2 |

CODE_81CEE4:
    LDA.W $336A                   ;$01CEE4 |
    CLC                           ;$01CEE7 |
    ADC.W #$0100                  ;$01CEE8 |
    SEC                           ;$01CEEB |
    SBC.B $74                     ;$01CEEC |
    BCS CODE_81CEFA               ;$01CEEE |
    ADC.B $74                     ;$01CEF0 |
    DEC A                         ;$01CEF2 |
    STA.B $74                     ;$01CEF3 |
    LDY.W #$8800                  ;$01CEF5 |
    BRA CODE_81CF02               ;$01CEF8 |

CODE_81CEFA:
    CMP.W #$0018                  ;$01CEFA |
    BCS CODE_81CF02               ;$01CEFD |
    LDY.W #$0800                  ;$01CEFF |

CODE_81CF02:
    TYA                           ;$01CF02 |
    TSB.B $66                     ;$01CF03 |
    LDA.W #$0001                  ;$01CF05 |
    STA.W $2250                   ;$01CF08 |
    LDA.B $74                     ;$01CF0B |
    STA.W $2251                   ;$01CF0D |
    STX.W $2253                   ;$01CF10 |
    LDY.B $51                     ;$01CF13 |
    LDA.W $2308                   ;$01CF15 |
    STA.B $74                     ;$01CF18 |
    LDA.W $2306                   ;$01CF1A |
    STA.W $2251                   ;$01CF1D |
    STY.W $2253                   ;$01CF20 |
    NOP                           ;$01CF23 |
    LDA.W $2308                   ;$01CF24 |
    ASL A                         ;$01CF27 |
    ADC.B $64                     ;$01CF28 |
    STA.B $64                     ;$01CF2A |
    RTL                           ;$01CF2C |

DATA24_01CF2D:
    dl $000000,$010101,$020202    ;$01CF2D |
    dl $030303,$040404,$050505    ;$01CF36 |
    dl $060606,$070707,$080808    ;$01CF3F |
    dl $090909,$0A0A0A,$0B0B0B    ;$01CF48 |
    dl $0C0C0C,$0D0D0D,$0E0E0E    ;$01CF51 |
    dl $0F0F0F,$101010,$111111    ;$01CF5A |
    dl $121212,$131313,$141414    ;$01CF63 |
    dl $151515,$161616,$171717    ;$01CF6C |
    dl $181818,$191919,$1A1A1A    ;$01CF75 |

DATA8_01CF7E:
    db $00,$03,$06,$09,$0C,$0F,$12,$15;$01CF7E |

TileCollisionProperties_LUT:
    dw $0000,$0000,$0000,$0000    ;$01CF86 |
    dw $0000,$0000,$0000,$0000    ;$01CF8E |
    dw $0000,$0000,$0000,$0000    ;$01CF96 |
    dw $0000,$0000,$0000,$0000    ;$01CF9E |
    dw $0000,$0000,$0000,$0000    ;$01CFA6 |
    dw $0000,$0000,$0000,$0000    ;$01CFAE |
    dw $0000,$0000,$0000,$0000    ;$01CFB6 |
    dw $0000,$0000,$0000,$0000    ;$01CFBE |
    dw $0000,$0000,$0000,$0000    ;$01CFC6 |
    dw $0000,$0000,$0000,$0000    ;$01CFCE |
    dw $0000,$0000,$0000,$0000    ;$01CFD6 |
    dw $0000,$0000,$0000,$0000    ;$01CFDE |
    dw $0024,$0026,$0028,$002A    ;$01CFE6 |
    dw $002C,$002E,$0030,$0032    ;$01CFEE |
    dw $0034,$0036,$0038,$003A    ;$01CFF6 |
    dw $0000,$0000,$0022,$0022    ;$01CFFE |
    dw $0004,$0006,$0008,$000A    ;$01D006 |
    dw $000C,$000E,$0010,$0012    ;$01D00E |
    dw $0014,$0016,$0018,$001A    ;$01D016 |
    dw $0004,$0006,$001C,$001E    ;$01D01E |
    dw $0002,$0002,$0002,$0002    ;$01D026 |
    dw $0002,$0000,$0000,$0000    ;$01D02E |
    dw $0000,$0000,$0002,$0002    ;$01D036 |
    dw $0002,$0002,$0002,$0002    ;$01D03E |
    dw $0000,$0000,$0000,$0000    ;$01D046 |
    dw $0000,$0000,$0000,$0000    ;$01D04E |
    dw $0000,$0000,$0000,$0000    ;$01D056 |
    dw $0000,$0000,$0000,$0000    ;$01D05E |
    dw $0002,$0002,$0002,$0002    ;$01D066 |
    dw $0002,$0002,$0002,$0002    ;$01D06E |
    dw $0002,$0002,$0000,$0000    ;$01D076 |
    dw $0000,$0000,$0000,$0000    ;$01D07E |

TileDamageProperties_LUT:
    dw $0000,$0000,$0000,$0000    ;$01D086 |
    dw $0000,$0000,$0000,$0000    ;$01D08E |
    dw $0000,$0000,$0000,$0000    ;$01D096 |
    dw $0000,$0000,$000F,$0001    ;$01D09E |
    dw $0000,$0000,$0000,$0000    ;$01D0A6 |
    dw $0000,$0000,$0000,$0000    ;$01D0AE |
    dw $0000,$0000,$0000,$0000    ;$01D0B6 |
    dw $0000,$0000,$0000,$0000    ;$01D0BE |
    dw $0000,$0000,$0000,$0000    ;$01D0C6 |
    dw $0002,$0003,$0004,$0000    ;$01D0CE |
    dw $000C,$000D,$0000,$0000    ;$01D0D6 |
    dw $0000,$0000,$0000,$0000    ;$01D0DE |
    dw $0000,$0000,$0000,$0000    ;$01D0E6 |
    dw $0000,$0000,$0000,$0000    ;$01D0EE |
    dw $0000,$0000,$0000,$0000    ;$01D0F6 |
    dw $0000,$0000,$0000,$0000    ;$01D0FE |
    dw $0000,$0000,$0000,$0000    ;$01D106 |
    dw $0000,$0000,$0000,$0000    ;$01D10E |
    dw $0000,$0000,$0000,$0000    ;$01D116 |
    dw $0002,$0002,$0000,$0000    ;$01D11E |
    dw $0000,$0002,$0003,$0000    ;$01D126 |
    dw $0004,$0000,$0000,$0000    ;$01D12E |
    dw $0000,$0000,$0000,$0000    ;$01D136 |
    dw $0000,$0000,$0000,$0000    ;$01D13E |
    dw $0000,$0000,$0000,$0000    ;$01D146 |
    dw $0000,$0000,$0000,$0000    ;$01D14E |
    dw $0000,$0000,$0000,$0000    ;$01D156 |
    dw $0000,$0000,$0000,$0000    ;$01D15E |
    dw $0005,$0007,$0008,$0009    ;$01D166 |
    dw $000A,$000B,$000C,$000D    ;$01D16E |
    dw $000E,$0006,$0000,$0000    ;$01D176 |
    dw $0000,$0000,$0000,$0000    ;$01D17E |

    LDY.W #$0004                  ;$01D186 |
    BRA CODE_01D18E               ;$01D189 |
    LDY.W #$0002                  ;$01D18B |

CODE_01D18E:
    STA.B $00                     ;$01D18E |
    STZ.B $02                     ;$01D190 |
    LDX.W $6986,Y                 ;$01D192 |
    LDA.W $6A00,Y                 ;$01D195 |
    TAY                           ;$01D198 |
    JSL.L CODE_FL_01CE46          ;$01D199 |
    LDA.W #$D1AD                  ;$01D19D |
    LDX.W #$0001                  ;$01D1A0 |
    JSL.L SA1_ExecuteSNES         ;$01D1A3 |
    LDA.B $02                     ;$01D1A7 |
    ADC.W #$FFFF                  ;$01D1A9 |
    RTL                           ;$01D1AC |


CODE_01D1AD:
    LDA.B [$64]                   ;$01D1AD |
    AND.W #$03FF                  ;$01D1AF |
    TAX                           ;$01D1B2 |
    LDA.L $7F62A0,X               ;$01D1B3 |
    AND.W #$007F                  ;$01D1B7 |
    CMP.W #$0030                  ;$01D1BA |
    BCC CODE_01D1C1               ;$01D1BD |
    INC.B $02                     ;$01D1BF |

CODE_01D1C1:
    LDA.B $00                     ;$01D1C1 |
    BMI CODE_01D1D3               ;$01D1C3 |
    SEC                           ;$01D1C5 |
    SBC.W #$0018                  ;$01D1C6 |
    BMI CODE_01D1E1               ;$01D1C9 |
    STA.B $00                     ;$01D1CB |
    DEC.B $64                     ;$01D1CD |
    DEC.B $64                     ;$01D1CF |
    BRA CODE_01D1AD               ;$01D1D1 |


CODE_01D1D3:
    CLC                           ;$01D1D3 |
    ADC.W #$0018                  ;$01D1D4 |
    BPL CODE_01D1E1               ;$01D1D7 |
    STA.B $00                     ;$01D1D9 |
    INC.B $64                     ;$01D1DB |
    INC.B $64                     ;$01D1DD |
    BRA CODE_01D1AD               ;$01D1DF |


CODE_01D1E1:
    RTL                           ;$01D1E1 |


CODE_FL_01D1E2:
    LDY.W #$0004                  ;$01D1E2 |
    BRA CODE_01D1EA               ;$01D1E5 |

CODE_FL_01D1E7:
    LDY.W #$0002                  ;$01D1E7 |

CODE_01D1EA:
    STY.B $0A                     ;$01D1EA |
    LDA.W #$0000                  ;$01D1EC |
    JMP.W CODE_JP_01D20E          ;$01D1EF |

CODE_FL_01D1F2:
    LDY.W #$0004                  ;$01D1F2 |
    BRA CODE_01D1FA               ;$01D1F5 |

CODE_FL_01D1F7:
    LDY.W #$0002                  ;$01D1F7 |

CODE_01D1FA:
    STZ.B $0A                     ;$01D1FA |
    LDA.W #$0000                  ;$01D1FC |
    BRA CODE_JP_01D20E            ;$01D1FF |

CODE_FL_01D201:
    LDY.W #$0004                  ;$01D201 |
    BRA CODE_01D209               ;$01D204 |

CODE_FL_01D206:
    LDY.W #$0002                  ;$01D206 |

CODE_01D209:
    STY.B $0A                     ;$01D209 |
    LDA.W #$FFFF                  ;$01D20B |

CODE_JP_01D20E:
    JSR.W CODE_FN_01D643          ;$01D20E |
    BIT.W $0000                   ;$01D211 |
    BMI CODE_81D23C               ;$01D214 |
    LDA.W #$D22D                  ;$01D216 |
    LDX.W #$0001                  ;$01D219 |
    JSL.L SNES_ExecuteSA1         ;$01D21C |
    PHP                           ;$01D220 |
    SEP #$20                      ;$01D221 |
    PLA                           ;$01D223 |
    AND.B #$7C                    ;$01D224 |
    ORA.B $48                     ;$01D226 |
    PHA                           ;$01D228 |
    REP #$20                      ;$01D229 |
    PLP                           ;$01D22B |
    RTL                           ;$01D22C |
    JSL.L CODE_81D23C             ;$01D22D |
    PHP                           ;$01D231 |
    SEP #$20                      ;$01D232 |
    PLA                           ;$01D234 |
    AND.B #$83                    ;$01D235 |
    STA.B $48                     ;$01D237 |
    REP #$20                      ;$01D239 |
    RTL                           ;$01D23B |

CODE_81D23C:
    LDA.W $33C4                   ;$01D23C |
    BEQ CODE_81D24D               ;$01D23F |
    LDA.W #$0001                  ;$01D241 |
    STA.B $04                     ;$01D244 |
    STA.B $06                     ;$01D246 |
    STZ.B $0C                     ;$01D248 |
    JMP.W CODE_81D46C             ;$01D24A |

CODE_81D24D:
    STZ.B $04                     ;$01D24D |
    LDA.B $00                     ;$01D24F |
    CMP.W #$0002                  ;$01D251 |
    BNE CODE_81D272               ;$01D254 |
    LDA.W $338E                   ;$01D256 |
    BEQ CODE_81D272               ;$01D259 |
    LDA.W $338A                   ;$01D25B |
    BNE CODE_81D272               ;$01D25E |
    LDA.W $338E                   ;$01D260 |
    STA.W $338A                   ;$01D263 |
    LDA.W $3394                   ;$01D266 |
    STA.W $3390                   ;$01D269 |
    LDA.W $339A                   ;$01D26C |
    STA.W $3396                   ;$01D26F |

CODE_81D272:
    LDY.W $339C                   ;$01D272 |
    BEQ CODE_81D295               ;$01D275 |
    LDA.W $339E                   ;$01D277 |
    BEQ CODE_81D295               ;$01D27A |
    LDX.W $33A8                   ;$01D27C |
    CPX.W $33AA                   ;$01D27F |
    BCC CODE_81D28C               ;$01D282 |
    LDX.W $33A4                   ;$01D284 |
    LDA.W $33A0                   ;$01D287 |
    BRA CODE_81D298               ;$01D28A |

CODE_81D28C:
    TAY                           ;$01D28C |
    LDX.W $33A6                   ;$01D28D |
    LDA.W $33A2                   ;$01D290 |
    BRA CODE_81D298               ;$01D293 |

CODE_81D295:
    JMP.W CODE_JP_01D300          ;$01D295 |

CODE_81D298:
    STX.W $33BE                   ;$01D298 |
    STX.W $33C2                   ;$01D29B |
    PHA                           ;$01D29E |
    TYA                           ;$01D29F |
    SEC                           ;$01D2A0 |
    SBC.W #$0003                  ;$01D2A1 |
    BPL CODE_81D2A9               ;$01D2A4 |
    LDA.W #$0000                  ;$01D2A6 |

CODE_81D2A9:
    STA.W $33B2                   ;$01D2A9 |
    LDX.B $02                     ;$01D2AC |
    PLA                           ;$01D2AE |
    BMI CODE_81D2B5               ;$01D2AF |
    LDY.B $0C                     ;$01D2B1 |
    BNE CODE_81D2BC               ;$01D2B3 |

CODE_81D2B5:
    CLC                           ;$01D2B5 |
    ADC.W $6A00,X                 ;$01D2B6 |
    STA.W $6A00,X                 ;$01D2B9 |

CODE_81D2BC:
    LDA.W #$8000                  ;$01D2BC |
    STA.W $6AF4,X                 ;$01D2BF |
    AND.W $76C3,X                 ;$01D2C2 |
    INC A                         ;$01D2C5 |
    STA.B $04                     ;$01D2C6 |
    BPL CODE_81D2DA               ;$01D2C8 |
    STZ.W $338A                   ;$01D2CA |
    LDA.W $338C                   ;$01D2CD |
    BEQ CODE_81D2F7               ;$01D2D0 |
    STZ.W $338C                   ;$01D2D2 |
    LDA.W $3392                   ;$01D2D5 |
    BRA CODE_01D2E8               ;$01D2D8 |

CODE_81D2DA:
    STZ.W $338C                   ;$01D2DA |
    LDA.W $338A                   ;$01D2DD |
    BEQ CODE_81D2F7               ;$01D2E0 |
    STZ.W $338A                   ;$01D2E2 |
    LDA.W $3390                   ;$01D2E5 |

CODE_01D2E8:
    CLC                           ;$01D2E8 |
    ADC.W $6986,X                 ;$01D2E9 |
    STA.W $6986,X                 ;$01D2EC |
    LDA.W #$8000                  ;$01D2EF |
    STA.W $6A7A,X                 ;$01D2F2 |
    INC.B $06                     ;$01D2F5 |

CODE_81D2F7:
    STZ.W $6BE8,X                 ;$01D2F7 |
    STZ.W $339C                   ;$01D2FA |
    STZ.W $339E                   ;$01D2FD |

CODE_JP_01D300:
    LDA.W $338A                   ;$01D300 |
    BEQ CODE_81D340               ;$01D303 |
    LDA.W $338C                   ;$01D305 |
    BEQ CODE_81D340               ;$01D308 |
    LDX.B $02                     ;$01D30A |
    INC.B $06                     ;$01D30C |
    LDA.W $3390                   ;$01D30E |
    BNE CODE_81D316               ;$01D311 |
    LDA.W $3392                   ;$01D313 |

CODE_81D316:
    BMI CODE_81D31D               ;$01D316 |
    STZ.W $339C                   ;$01D318 |
    BRA CODE_81D320               ;$01D31B |

CODE_81D31D:
    STZ.W $339E                   ;$01D31D |

CODE_81D320:
    CLC                           ;$01D320 |
    ADC.W $6986,X                 ;$01D321 |
    STA.W $6986,X                 ;$01D324 |
    LDA.W #$8000                  ;$01D327 |
    STA.W $6A7A,X                 ;$01D32A |
    STZ.W $338A                   ;$01D32D |
    STZ.W $338C                   ;$01D330 |
    LDA.W $3396                   ;$01D333 |
    BNE CODE_81D33D               ;$01D336 |
    LDA.W $3398                   ;$01D338 |
    BEQ CODE_81D340               ;$01D33B |

CODE_81D33D:
    STA.W $33C0                   ;$01D33D |

CODE_81D340:
    LDX.B $02                     ;$01D340 |
    LDA.W $6986,X                 ;$01D342 |
    CMP.W $3380,X                 ;$01D345 |
    BNE CODE_81D362               ;$01D348 |
    LDY.W $339C                   ;$01D34A |
    BEQ CODE_81D354               ;$01D34D |
    LDY.W #$0000                  ;$01D34F |
    BRA CODE_81D35C               ;$01D352 |

CODE_81D354:
    LDY.W $339E                   ;$01D354 |
    BEQ CODE_81D35F               ;$01D357 |
    LDY.W #$0002                  ;$01D359 |

CODE_81D35C:
    JSR.W CODE_FN_01D5DB          ;$01D35C |

CODE_81D35F:
    JMP.W CODE_81D46C             ;$01D35F |

CODE_81D362:
    BCC CODE_81D367               ;$01D362 |
    JMP.W CODE_JP_01D3EB          ;$01D364 |

CODE_81D367:
    LDA.W $339E                   ;$01D367 |
    BEQ CODE_81D375               ;$01D36A |
    LDY.W #$0002                  ;$01D36C |
    JSR.W CODE_FN_01D5DB          ;$01D36F |
    STZ.W $339E                   ;$01D372 |

CODE_81D375:
    LDA.W $76C3,X                 ;$01D375 |
    BPL CODE_81D39E               ;$01D378 |
    LDA.W $338A                   ;$01D37A |
    LDY.W $338C                   ;$01D37D |
    STA.W $338C                   ;$01D380 |
    STY.W $338A                   ;$01D383 |
    LDA.W $3390                   ;$01D386 |
    LDY.W $3392                   ;$01D389 |
    STA.W $3392                   ;$01D38C |
    STY.W $3390                   ;$01D38F |
    LDA.W $3396                   ;$01D392 |
    LDY.W $3398                   ;$01D395 |
    STA.W $3398                   ;$01D398 |
    STY.W $3396                   ;$01D39B |

CODE_81D39E:
    LDA.W $338A                   ;$01D39E |
    BEQ CODE_81D3AB               ;$01D3A1 |
    LDY.W #$0000                  ;$01D3A3 |
    JSR.W CODE_FN_01D617          ;$01D3A6 |
    BRA CODE_81D3E8               ;$01D3A9 |

CODE_81D3AB:
    LDA.W $339C                   ;$01D3AB |
    BNE CODE_81D3BD               ;$01D3AE |
    LDA.W $338C                   ;$01D3B0 |
    BEQ CODE_81D3E8               ;$01D3B3 |
    LDY.W #$0002                  ;$01D3B5 |
    JSR.W CODE_FN_01D617          ;$01D3B8 |
    BRA CODE_81D3E8               ;$01D3BB |

CODE_81D3BD:
    LDA.W $338C                   ;$01D3BD |
    BNE CODE_81D3CA               ;$01D3C0 |
    LDY.W #$0000                  ;$01D3C2 |
    JSR.W CODE_FN_01D5DB          ;$01D3C5 |
    BRA CODE_81D3E8               ;$01D3C8 |

CODE_81D3CA:
    LDA.W $33A0                   ;$01D3CA |
    BPL CODE_81D3D3               ;$01D3CD |
    EOR.W #$FFFF                  ;$01D3CF |
    INC A                         ;$01D3D2 |

CODE_81D3D3:
    CMP.W $3392                   ;$01D3D3 |
    BEQ CODE_81D3DA               ;$01D3D6 |
    BCS CODE_81D3E2               ;$01D3D8 |

CODE_81D3DA:
    LDY.W #$0000                  ;$01D3DA |
    JSR.W CODE_FN_01D5DB          ;$01D3DD |
    BRA CODE_81D3E8               ;$01D3E0 |

CODE_81D3E2:
    LDY.W #$0002                  ;$01D3E2 |
    JSR.W CODE_FN_01D617          ;$01D3E5 |

CODE_81D3E8:
    JMP.W CODE_81D46C             ;$01D3E8 |

CODE_JP_01D3EB:
    LDA.W $339C                   ;$01D3EB |
    BEQ CODE_81D3F9               ;$01D3EE |
    LDY.W #$0000                  ;$01D3F0 |
    JSR.W CODE_FN_01D5DB          ;$01D3F3 |
    STZ.W $339C                   ;$01D3F6 |

CODE_81D3F9:
    LDA.W $76C3,X                 ;$01D3F9 |
    BPL CODE_81D422               ;$01D3FC |
    LDA.W $338A                   ;$01D3FE |
    LDY.W $338C                   ;$01D401 |
    STA.W $338C                   ;$01D404 |
    STY.W $338A                   ;$01D407 |
    LDA.W $3390                   ;$01D40A |
    LDY.W $3392                   ;$01D40D |
    STA.W $3392                   ;$01D410 |
    STY.W $3390                   ;$01D413 |
    LDA.W $3396                   ;$01D416 |
    LDY.W $3398                   ;$01D419 |
    STA.W $3398                   ;$01D41C |
    STY.W $3396                   ;$01D41F |

CODE_81D422:
    LDA.W $338A                   ;$01D422 |
    BEQ CODE_81D42F               ;$01D425 |
    LDY.W #$0000                  ;$01D427 |
    JSR.W CODE_FN_01D617          ;$01D42A |
    BRA CODE_81D46C               ;$01D42D |

CODE_81D42F:
    LDA.W $339E                   ;$01D42F |
    BNE CODE_81D441               ;$01D432 |
    LDA.W $338C                   ;$01D434 |
    BEQ CODE_81D46C               ;$01D437 |
    LDY.W #$0002                  ;$01D439 |
    JSR.W CODE_FN_01D617          ;$01D43C |
    BRA CODE_81D46C               ;$01D43F |

CODE_81D441:
    LDA.W $338C                   ;$01D441 |
    BNE CODE_81D44E               ;$01D444 |
    LDY.W #$0002                  ;$01D446 |
    JSR.W CODE_FN_01D5DB          ;$01D449 |
    BRA CODE_81D46C               ;$01D44C |

CODE_81D44E:
    LDA.W $33A2                   ;$01D44E |
    BMI CODE_81D457               ;$01D451 |
    EOR.W #$FFFF                  ;$01D453 |
    INC A                         ;$01D456 |

CODE_81D457:
    CMP.W $3392                   ;$01D457 |
    BEQ CODE_81D45E               ;$01D45A |
    BCC CODE_81D466               ;$01D45C |

CODE_81D45E:
    LDY.W #$0002                  ;$01D45E |
    JSR.W CODE_FN_01D5DB          ;$01D461 |
    BRA CODE_81D46C               ;$01D464 |

CODE_81D466:
    LDY.W #$0002                  ;$01D466 |
    JSR.W CODE_FN_01D617          ;$01D469 |

CODE_81D46C:
    LDA.B $04                     ;$01D46C |
    BNE CODE_81D4AB               ;$01D46E |
    INC A                         ;$01D470 |
    STA.W $33B0                   ;$01D471 |
    LDX.B $00                     ;$01D474 |
    LDY.B $02                     ;$01D476 |
    LDA.L DATA16_01DA07,X         ;$01D478 |
    LDX.W $6986,Y                 ;$01D47C |
    CLC                           ;$01D47F |
    ADC.W $6A00,Y                 ;$01D480 |
    TAY                           ;$01D483 |
    JSL.L CODE_FL_01C365          ;$01D484 |
    TYX                           ;$01D488 |
    BEQ CODE_81D4AB               ;$01D489 |
    TAX                           ;$01D48B |
    BEQ CODE_81D493               ;$01D48C |
    CMP.W #$FFF0                  ;$01D48E |
    BCC CODE_81D4AB               ;$01D491 |

CODE_81D493:
    LDX.B $02                     ;$01D493 |
    CLC                           ;$01D495 |
    ADC.W $6A00,X                 ;$01D496 |
    STA.W $6A00,X                 ;$01D499 |
    TYA                           ;$01D49C |
    SEC                           ;$01D49D |
    SBC.W #$0003                  ;$01D49E |
    BPL CODE_01D4A6               ;$01D4A1 |
    LDA.W #$0000                  ;$01D4A3 |

CODE_01D4A6:
    STA.W $33B2                   ;$01D4A6 |
    INC.B $04                     ;$01D4A9 |

CODE_81D4AB:
    LDX.B $02                     ;$01D4AB |
    LDA.B $0A                     ;$01D4AD |
    BNE CODE_81D4C8               ;$01D4AF |
    LDA.B $04                     ;$01D4B1 |
    BMI CODE_81D4C8               ;$01D4B3 |
    BEQ CODE_01D4BA               ;$01D4B5 |
    DEC A                         ;$01D4B7 |
    BEQ CODE_81D4C8               ;$01D4B8 |

CODE_01D4BA:
    LDA.W $3380,X                 ;$01D4BA |
    STA.W $6986,X                 ;$01D4BD |
    LDA.W $3384,X                 ;$01D4C0 |
    STA.W $6A00,X                 ;$01D4C3 |
    INC.B $04                     ;$01D4C6 |

CODE_81D4C8:
    LDA.W $6A00,X                 ;$01D4C8 |
    STA.W $3384,X                 ;$01D4CB |
    TAY                           ;$01D4CE |
    LDA.W $6986,X                 ;$01D4CF |
    STA.W $3380,X                 ;$01D4D2 |
    TAX                           ;$01D4D5 |
    JSL.L CODE_FL_01CE20          ;$01D4D6 |
    TAY                           ;$01D4DA |
    AND.W #$0080                  ;$01D4DB |
    STA.W $33B4                   ;$01D4DE |
    LDA.W $33BE                   ;$01D4E1 |
    BNE CODE_81D500               ;$01D4E4 |
    TYA                           ;$01D4E6 |
    AND.W #$007F                  ;$01D4E7 |
    ASL A                         ;$01D4EA |
    TAX                           ;$01D4EB |
    LDA.L TileDamageProperties_LUT,X         ;$01D4EC |
    CMP.W #$0002                  ;$01D4F0 |
    BCC CODE_81D500               ;$01D4F3 |
    CMP.W #$0005                  ;$01D4F5 |
    BCS CODE_81D500               ;$01D4F8 |
    STA.W $33BE                   ;$01D4FA |
    STA.W $33C2                   ;$01D4FD |

CODE_81D500:
    STZ.W $33BA                   ;$01D500 |
    STZ.W $33BC                   ;$01D503 |
    STZ.W $33B6                   ;$01D506 |
    STZ.W $33B8                   ;$01D509 |
    TYA                           ;$01D50C |
    AND.W #$0080                  ;$01D50D |
    BNE CODE_81D52A               ;$01D510 |
    LDA.W $3324                   ;$01D512 |
    BMI CODE_81D52A               ;$01D515 |
    AND.W #$000F                  ;$01D517 |
    STA.B $00                     ;$01D51A |
    LDA.W $3324                   ;$01D51C |
    XBA                           ;$01D51F |
    AND.W #$000F                  ;$01D520 |
    ASL A                         ;$01D523 |
    ASL A                         ;$01D524 |
    SEC                           ;$01D525 |
    ADC.B $00                     ;$01D526 |
    BRA CODE_01D533               ;$01D528 |

CODE_81D52A:
    TYA                           ;$01D52A |
    AND.W #$007F                  ;$01D52B |
    CMP.W #$000D                  ;$01D52E |
    BCS CODE_81D547               ;$01D531 |

CODE_01D533:
    ASL A                         ;$01D533 |
    TAX                           ;$01D534 |
    LDA.L DATA16_01D59F,X         ;$01D535 |
    STA.W $33B6                   ;$01D539 |
    LDA.L DATA16_01D5B9,X         ;$01D53C |
    STA.W $33B8                   ;$01D540 |
    TYA                           ;$01D543 |
    AND.W #$007F                  ;$01D544 |

CODE_81D547:
    CMP.W #$000F                  ;$01D547 |
    BEQ CODE_81D559               ;$01D54A |
    CMP.W #$000E                  ;$01D54C |
    BEQ CODE_81D556               ;$01D54F |
    CMP.W #$003E                  ;$01D551 |
    BNE CODE_81D565               ;$01D554 |

CODE_81D556:
    INC.W $33BA                   ;$01D556 |

CODE_81D559:
    INC.W $33BA                   ;$01D559 |
    LDA.B $74                     ;$01D55C |
    SEC                           ;$01D55E |
    SBC.W #$000C                  ;$01D55F |
    STA.W $33BC                   ;$01D562 |

CODE_81D565:
    LDA.B $04                     ;$01D565 |
    BMI CODE_81D590               ;$01D567 |
    BEQ CODE_81D590               ;$01D569 |
    LDY.B $02                     ;$01D56B |
    LDX.W $6986,Y                 ;$01D56D |
    LDA.W $6A00,Y                 ;$01D570 |
    CLC                           ;$01D573 |
    ADC.W #$0018                  ;$01D574 |
    TAY                           ;$01D577 |
    JSL.L CODE_FL_01CE20          ;$01D578 |
    CMP.W #$0078                  ;$01D57C |
    BNE CODE_81D590               ;$01D57F |
    LDY.W #$0002                  ;$01D581 |
    STY.B $4D                     ;$01D584 |
    LDA.W #$9DBE                  ;$01D586 |
    LDX.W #$0001                  ;$01D589 |
    JSL.L SA1_ExecuteSNES         ;$01D58C |

CODE_81D590:
    LDA.B $04                     ;$01D590 |
    ORA.B $0C                     ;$01D592 |
    TAY                           ;$01D594 |
    LDA.B $06                     ;$01D595 |
    BNE CODE_81D59C               ;$01D597 |
    CLC                           ;$01D599 |
    TYA                           ;$01D59A |
    RTL                           ;$01D59B |

CODE_81D59C:
    SEC                           ;$01D59C |
    TYA                           ;$01D59D |
    RTL                           ;$01D59E |

DATA16_01D59F:
    dw $0000,$0001,$0001,$0001    ;$01D59F |
    dw $0001,$0002,$0002,$0002    ;$01D5A7 |
    dw $0002,$0003,$0003,$0003    ;$01D5AF |
    dw $0003                      ;$01D5B7 |

DATA16_01D5B9:
    dw $0000,$0000,$4000,$8000    ;$01D5B9 |
    dw $C000,$0000,$4000,$8000    ;$01D5C1 |
    dw $C000,$0000,$4000,$8000    ;$01D5C9 |
    dw $C000,$0000,$4000,$8000    ;$01D5D1 |
    dw $C000                      ;$01D5D9 |

CODE_FN_01D5DB:
    LDA.W $33BE                   ;$01D5DB |
    BNE CODE_81D5E6               ;$01D5DE |
    LDA.W $33A4,Y                 ;$01D5E0 |
    STA.W $33BE                   ;$01D5E3 |

CODE_81D5E6:
    STZ.W $6BE8,X                 ;$01D5E6 |
    LDA.W $6A00,X                 ;$01D5E9 |
    CLC                           ;$01D5EC |
    ADC.W $33A0,Y                 ;$01D5ED |
    STA.W $6A00,X                 ;$01D5F0 |
    LDA.W #$8000                  ;$01D5F3 |
    STA.W $6AF4,X                 ;$01D5F6 |
    AND.W $76C3,X                 ;$01D5F9 |
    INC A                         ;$01D5FC |
    STA.B $04                     ;$01D5FD |
    BPL CODE_81D607               ;$01D5FF |
    LDA.W $33BE                   ;$01D601 |
    STA.W $33C2                   ;$01D604 |

CODE_81D607:
    LDA.W $339C,Y                 ;$01D607 |
    SEC                           ;$01D60A |
    SBC.W #$0003                  ;$01D60B |
    BPL CODE_81D613               ;$01D60E |
    LDA.W #$0000                  ;$01D610 |

CODE_81D613:
    STA.W $33B2                   ;$01D613 |
    RTS                           ;$01D616 |

CODE_FN_01D617:
    LDA.W $3390,Y                 ;$01D617 |
    CMP.W #$FFF0                  ;$01D61A |
    BCS CODE_81D625               ;$01D61D |
    CMP.W #$0010                  ;$01D61F |
    BCC CODE_81D625               ;$01D622 |
    RTS                           ;$01D624 |

CODE_81D625:
    LDA.W $33C0                   ;$01D625 |
    BNE CODE_81D630               ;$01D628 |
    LDA.W $3396,Y                 ;$01D62A |
    STA.W $33C0                   ;$01D62D |

CODE_81D630:
    LDA.W $3390,Y                 ;$01D630 |
    CLC                           ;$01D633 |
    ADC.W $6986,X                 ;$01D634 |
    STA.W $6986,X                 ;$01D637 |
    LDA.W #$8000                  ;$01D63A |
    STA.W $6A7A,X                 ;$01D63D |
    INC.B $06                     ;$01D640 |
    RTS                           ;$01D642 |

CODE_FN_01D643:
    STA.W $33B2                   ;$01D643 |
    STX.B $00                     ;$01D646 |
    STZ.B $04                     ;$01D648 |
    STY.B $02                     ;$01D64A |
    STZ.B $06                     ;$01D64C |
    STZ.B $0C                     ;$01D64E |
    STZ.W $33BE                   ;$01D650 |
    STZ.W $33C2                   ;$01D653 |
    STZ.W $33C0                   ;$01D656 |
    STZ.W $33A4                   ;$01D659 |
    STZ.W $33A6                   ;$01D65C |
    STZ.W $3394                   ;$01D65F |
    STZ.W $338E                   ;$01D662 |
    STZ.W $33C4                   ;$01D665 |
    LDA.W $36E2,Y                 ;$01D668 |
    BEQ CODE_81D683               ;$01D66B |
    LDA.W $33AA,Y                 ;$01D66D |
    BNE CODE_81D677               ;$01D670 |
    LDA.W $33B2                   ;$01D672 |
    BNE CODE_81D680               ;$01D675 |

CODE_81D677:
    INC A                         ;$01D677 |
    STA.W $33AA,Y                 ;$01D678 |
    CMP.W #$0004                  ;$01D67B |
    BCS CODE_81D683               ;$01D67E |

CODE_81D680:
    LDA.W #$0000                  ;$01D680 |

CODE_81D683:
    STA.W $33B0                   ;$01D683 |
    STA.B $08                     ;$01D686 |
    LDA.B $00                     ;$01D688 |
    CMP.W #$0002                  ;$01D68A |
    BNE CODE_81D6DE               ;$01D68D |
    LDX.W $6986,Y                 ;$01D68F |
    LDA.W $6A00,Y                 ;$01D692 |
    INC A                         ;$01D695 |
    INC A                         ;$01D696 |
    SBC.L DATA16_01DA09           ;$01D697 |
    TAY                           ;$01D69B |
    JSL.L CODE_FL_01C62C          ;$01D69C |
    CPY.W #$0000                  ;$01D6A0 |
    BEQ CODE_81D6DE               ;$01D6A3 |
    TAY                           ;$01D6A5 |
    BMI CODE_81D6DE               ;$01D6A6 |
    LDY.B $02                     ;$01D6A8 |
    LDX.W $6986,Y                 ;$01D6AA |
    LDA.W $6A00,Y                 ;$01D6AD |
    INC A                         ;$01D6B0 |
    INC A                         ;$01D6B1 |
    CLC                           ;$01D6B2 |
    ADC.L DATA16_01DA09           ;$01D6B3 |
    TAY                           ;$01D6B7 |
    JSL.L CODE_FL_01C365          ;$01D6B8 |
    CPY.W #$0000                  ;$01D6BC |
    BEQ CODE_81D6DE               ;$01D6BF |
    TAY                           ;$01D6C1 |
    BEQ CODE_01D6C6               ;$01D6C2 |
    BPL CODE_81D6DE               ;$01D6C4 |

CODE_01D6C6:
    STX.W $33BE                   ;$01D6C6 |
    STX.W $33C2                   ;$01D6C9 |
    LDY.B $02                     ;$01D6CC |
    CLC                           ;$01D6CE |
    ADC.W $6A00,Y                 ;$01D6CF |
    STA.W $6A00,Y                 ;$01D6D2 |
    STA.W $3384,Y                 ;$01D6D5 |
    INC.W $33C4                   ;$01D6D8 |
    JMP.W CODE_81D9F1             ;$01D6DB |

CODE_81D6DE:
    LDA.W #$BDA5                  ;$01D6DE |
    LDX.W #$0001                  ;$01D6E1 |
    JSL.L SA1_ExecuteSNES         ;$01D6E4 |
    LDY.B $02                     ;$01D6E8 |
    LDA.W $76C3,Y                 ;$01D6EA |
    BMI CODE_81D6F2               ;$01D6ED |
    JMP.W CODE_JP_01D789          ;$01D6EF |

CODE_81D6F2:
    LDA.W #$BC98                  ;$01D6F2 |
    LDX.W #$0001                  ;$01D6F5 |
    JSL.L SA1_ExecuteSNES         ;$01D6F8 |
    LDX.B $00                     ;$01D6FC |
    LDY.B $02                     ;$01D6FE |
    STZ.W $33B0                   ;$01D700 |
    LDA.W $6A00,Y                 ;$01D703 |
    INC A                         ;$01D706 |
    INC A                         ;$01D707 |
    SEC                           ;$01D708 |
    SBC.L DATA16_01DA07,X         ;$01D709 |
    BPL CODE_81D712               ;$01D70D |
    LDA.W #$0000                  ;$01D70F |

CODE_81D712:
    PHA                           ;$01D712 |
    LDA.W $6986,Y                 ;$01D713 |
    SEC                           ;$01D716 |
    SBC.L DATA16_01DA0D,X         ;$01D717 |
    INC A                         ;$01D71B |
    TAX                           ;$01D71C |
    PLY                           ;$01D71D |
    JSL.L CODE_FL_01C62C          ;$01D71E |
    STX.W $33A4                   ;$01D722 |
    STY.W $339C                   ;$01D725 |
    STA.W $33A0                   ;$01D728 |
    TAY                           ;$01D72B |
    BMI CODE_81D733               ;$01D72C |
    CMP.W #$0010                  ;$01D72E |
    BCC CODE_81D73B               ;$01D731 |

CODE_81D733:
    LDA.W #$0000                  ;$01D733 |
    STA.W $339C                   ;$01D736 |
    BRA CODE_81D741               ;$01D739 |

CODE_81D73B:
    LDA.W #$0018                  ;$01D73B |
    SEC                           ;$01D73E |
    SBC.B $74                     ;$01D73F |

CODE_81D741:
    STA.W $33A8                   ;$01D741 |
    LDX.B $00                     ;$01D744 |
    LDY.B $02                     ;$01D746 |
    LDA.W $6A00,Y                 ;$01D748 |
    INC A                         ;$01D74B |
    INC A                         ;$01D74C |
    SEC                           ;$01D74D |
    SBC.L DATA16_01DA07,X         ;$01D74E |
    BPL CODE_81D757               ;$01D752 |
    LDA.W #$0000                  ;$01D754 |

CODE_81D757:
    PHA                           ;$01D757 |
    LDA.W $6986,Y                 ;$01D758 |
    CLC                           ;$01D75B |
    ADC.L DATA16_01DA0D,X         ;$01D75C |
    DEC A                         ;$01D760 |
    TAX                           ;$01D761 |
    PLY                           ;$01D762 |
    JSL.L CODE_FL_01C62C          ;$01D763 |
    STX.W $33A6                   ;$01D767 |
    STY.W $339E                   ;$01D76A |
    STA.W $33A2                   ;$01D76D |
    TAY                           ;$01D770 |
    BMI CODE_81D778               ;$01D771 |
    CMP.W #$0010                  ;$01D773 |
    BCC CODE_81D780               ;$01D776 |

CODE_81D778:
    LDA.W #$0000                  ;$01D778 |
    STA.W $339E                   ;$01D77B |
    BRA CODE_81D783               ;$01D77E |

CODE_81D780:
    LDA.B $74                     ;$01D780 |
    INC A                         ;$01D782 |

CODE_81D783:
    STA.W $33AA                   ;$01D783 |
    JMP.W CODE_JP_01D861          ;$01D786 |

CODE_JP_01D789:
    LDA.W #$BCD9                  ;$01D789 |
    LDX.W #$0001                  ;$01D78C |
    JSL.L SA1_ExecuteSNES         ;$01D78F |
    LDA.B $00                     ;$01D793 |
    TAX                           ;$01D795 |
    ASL A                         ;$01D796 |
    ASL A                         ;$01D797 |
    STA.B $04                     ;$01D798 |
    LDA.B $08                     ;$01D79A |
    STA.W $33B0                   ;$01D79C |
    PHA                           ;$01D79F |
    LDY.B $02                     ;$01D7A0 |
    LDA.W $6A00,Y                 ;$01D7A2 |
    INC A                         ;$01D7A5 |
    INC A                         ;$01D7A6 |
    CLC                           ;$01D7A7 |
    ADC.L DATA16_01DA07,X         ;$01D7A8 |
    PHA                           ;$01D7AC |
    LDA.W $6986,Y                 ;$01D7AD |
    SEC                           ;$01D7B0 |
    SBC.L DATA16_01DA0D,X         ;$01D7B1 |
    INC A                         ;$01D7B5 |
    TAX                           ;$01D7B6 |
    PLY                           ;$01D7B7 |
    JSL.L CODE_FL_01C365          ;$01D7B8 |
    STX.W $33A4                   ;$01D7BC |
    STY.W $339C                   ;$01D7BF |
    STA.W $33A0                   ;$01D7C2 |
    TYA                           ;$01D7C5 |
    SEC                           ;$01D7C6 |
    SBC.W #$0004                  ;$01D7C7 |
    BCC CODE_81D7DA               ;$01D7CA |
    ORA.B $04                     ;$01D7CC |
    ASL A                         ;$01D7CE |
    TAX                           ;$01D7CF |
    LDA.W $33A0                   ;$01D7D0 |
    ADC.L DATA16_01DA13,X         ;$01D7D3 |
    STA.W $33A0                   ;$01D7D7 |

CODE_81D7DA:
    LDA.W #$0018                  ;$01D7DA |
    SEC                           ;$01D7DD |
    SBC.B $74                     ;$01D7DE |
    STA.W $33A8                   ;$01D7E0 |
    LDA.W $33A0                   ;$01D7E3 |
    BEQ CODE_81D7FA               ;$01D7E6 |
    CMP.W #$FFF0                  ;$01D7E8 |
    BCS CODE_81D7FA               ;$01D7EB |
    BIT.W $33B2                   ;$01D7ED |
    BMI CODE_81D7F7               ;$01D7F0 |
    CMP.W #$0010                  ;$01D7F2 |
    BCC CODE_81D7FA               ;$01D7F5 |

CODE_81D7F7:
    STZ.W $339C                   ;$01D7F7 |

CODE_81D7FA:
    LDA.W $33B0                   ;$01D7FA |
    STA.B $08                     ;$01D7FD |
    PLA                           ;$01D7FF |
    STA.W $33B0                   ;$01D800 |
    LDX.B $00                     ;$01D803 |
    LDY.B $02                     ;$01D805 |
    LDA.W $6A00,Y                 ;$01D807 |
    INC A                         ;$01D80A |
    INC A                         ;$01D80B |
    CLC                           ;$01D80C |
    ADC.L DATA16_01DA07,X         ;$01D80D |
    PHA                           ;$01D811 |
    LDA.W $6986,Y                 ;$01D812 |
    CLC                           ;$01D815 |
    ADC.L DATA16_01DA0D,X         ;$01D816 |
    DEC A                         ;$01D81A |
    TAX                           ;$01D81B |
    PLY                           ;$01D81C |
    JSL.L CODE_FL_01C365          ;$01D81D |
    STX.W $33A6                   ;$01D821 |
    STY.W $339E                   ;$01D824 |
    STA.W $33A2                   ;$01D827 |
    TYA                           ;$01D82A |
    SEC                           ;$01D82B |
    SBC.W #$0004                  ;$01D82C |
    BCC CODE_81D83F               ;$01D82F |
    ORA.B $04                     ;$01D831 |
    ASL A                         ;$01D833 |
    TAX                           ;$01D834 |
    LDA.W $33A2                   ;$01D835 |
    ADC.L DATA16_01DA43,X         ;$01D838 |
    STA.W $33A2                   ;$01D83C |

CODE_81D83F:
    LDA.B $74                     ;$01D83F |
    INC A                         ;$01D841 |
    STA.W $33AA                   ;$01D842 |
    LDA.W $33A2                   ;$01D845 |
    BEQ CODE_81D85C               ;$01D848 |
    CMP.W #$FFF0                  ;$01D84A |
    BCS CODE_81D85C               ;$01D84D |
    BIT.W $33B2                   ;$01D84F |
    BMI CODE_81D859               ;$01D852 |
    CMP.W #$0010                  ;$01D854 |
    BCC CODE_81D85C               ;$01D857 |

CODE_81D859:
    STZ.W $339E                   ;$01D859 |

CODE_81D85C:
    LDA.B $08                     ;$01D85C |
    TSB.W $33B0                   ;$01D85E |

CODE_JP_01D861:
    STZ.W $33B2                   ;$01D861 |
    LDX.B $00                     ;$01D864 |
    LDY.B $02                     ;$01D866 |
    LDA.W $6986,Y                 ;$01D868 |
    CMP.W $3380,Y                 ;$01D86B |
    BNE CODE_81D879               ;$01D86E |
    STZ.W $338A                   ;$01D870 |
    STZ.W $338C                   ;$01D873 |
    JMP.W CODE_81D9F1             ;$01D876 |

CODE_81D879:
    BPL CODE_81D87E               ;$01D879 |
    JMP.W CODE_JP_01D93C          ;$01D87B |

CODE_81D87E:
    LDA.W $6A00,Y                 ;$01D87E |
    CLC                           ;$01D881 |
    ADC.W #$0003                  ;$01D882 |
    SEC                           ;$01D885 |
    SBC.L DATA16_01DA07,X         ;$01D886 |
    BPL CODE_81D88F               ;$01D88A |
    LDA.W #$0000                  ;$01D88C |

CODE_81D88F:
    PHA                           ;$01D88F |
    LDA.W $6986,Y                 ;$01D890 |
    CLC                           ;$01D893 |
    ADC.L DATA16_01DA0D,X         ;$01D894 |
    TAX                           ;$01D898 |
    PLY                           ;$01D899 |
    JSL.L CODE_FL_01C723          ;$01D89A |
    STX.W $3396                   ;$01D89E |
    CPY.W #$0001                  ;$01D8A1 |
    BEQ CODE_81D8AB               ;$01D8A4 |
    CPY.W #$000A                  ;$01D8A6 |
    BCC CODE_81D8B3               ;$01D8A9 |

CODE_81D8AB:
    TAX                           ;$01D8AB |
    BEQ CODE_81D8B6               ;$01D8AC |
    CMP.W #$FFF0                  ;$01D8AE |
    BCS CODE_81D8B6               ;$01D8B1 |

CODE_81D8B3:
    LDY.W #$0000                  ;$01D8B3 |

CODE_81D8B6:
    STA.W $3390                   ;$01D8B6 |
    STY.W $338A                   ;$01D8B9 |
    LDX.B $00                     ;$01D8BC |
    LDY.B $02                     ;$01D8BE |
    LDA.W $6A00,Y                 ;$01D8C0 |
    DEC A                         ;$01D8C3 |
    CLC                           ;$01D8C4 |
    ADC.L DATA16_01DA07,X         ;$01D8C5 |
    BPL CODE_81D8CE               ;$01D8C9 |
    LDA.W #$0000                  ;$01D8CB |

CODE_81D8CE:
    PHA                           ;$01D8CE |
    LDA.W $6986,Y                 ;$01D8CF |
    CLC                           ;$01D8D2 |
    ADC.L DATA16_01DA0D,X         ;$01D8D3 |
    TAX                           ;$01D8D7 |
    PLY                           ;$01D8D8 |
    JSL.L CODE_FL_01C723          ;$01D8D9 |
    STX.W $3398                   ;$01D8DD |
    CPY.W #$0001                  ;$01D8E0 |
    BEQ CODE_81D8EA               ;$01D8E3 |
    CPY.W #$000A                  ;$01D8E5 |
    BCC CODE_81D8F2               ;$01D8E8 |

CODE_81D8EA:
    TAX                           ;$01D8EA |
    BEQ CODE_81D8F5               ;$01D8EB |
    CMP.W #$FFF0                  ;$01D8ED |
    BCS CODE_81D8F5               ;$01D8F0 |

CODE_81D8F2:
    LDY.W #$0000                  ;$01D8F2 |

CODE_81D8F5:
    STA.W $3392                   ;$01D8F5 |
    STY.W $338C                   ;$01D8F8 |
    LDX.B $00                     ;$01D8FB |
    CPX.W #$0002                  ;$01D8FD |
    BNE CODE_81D939               ;$01D900 |
    LDY.B $02                     ;$01D902 |
    LDA.W $6A00,Y                 ;$01D904 |
    BPL CODE_01D90C               ;$01D907 |
    LDA.W #$0000                  ;$01D909 |

CODE_01D90C:
    PHA                           ;$01D90C |
    LDA.W $6986,Y                 ;$01D90D |
    CLC                           ;$01D910 |
    ADC.L DATA16_01DA0D,X         ;$01D911 |
    TAX                           ;$01D915 |
    PLY                           ;$01D916 |
    JSL.L CODE_FL_01C723          ;$01D917 |
    STX.W $339A                   ;$01D91B |
    CPY.W #$0001                  ;$01D91E |
    BEQ CODE_01D928               ;$01D921 |
    CPY.W #$000A                  ;$01D923 |
    BCC CODE_01D930               ;$01D926 |

CODE_01D928:
    TAX                           ;$01D928 |
    BEQ CODE_01D933               ;$01D929 |
    CMP.W #$FFF0                  ;$01D92B |
    BCS CODE_01D933               ;$01D92E |

CODE_01D930:
    LDY.W #$0000                  ;$01D930 |

CODE_01D933:
    STA.W $3394                   ;$01D933 |
    STY.W $338E                   ;$01D936 |

CODE_81D939:
    JMP.W CODE_81D9F1             ;$01D939 |

CODE_JP_01D93C:
    LDA.W $6A00,Y                 ;$01D93C |
    CLC                           ;$01D93F |
    ADC.W #$0003                  ;$01D940 |
    SEC                           ;$01D943 |
    SBC.L DATA16_01DA07,X         ;$01D944 |
    BPL CODE_81D94D               ;$01D948 |
    LDA.W #$0000                  ;$01D94A |

CODE_81D94D:
    PHA                           ;$01D94D |
    LDA.W $6986,Y                 ;$01D94E |
    SEC                           ;$01D951 |
    SBC.L DATA16_01DA0D,X         ;$01D952 |
    INC A                         ;$01D956 |
    TAX                           ;$01D957 |
    PLY                           ;$01D958 |
    JSL.L CODE_FL_01CA71          ;$01D959 |
    STX.W $3396                   ;$01D95D |
    CPY.W #$0001                  ;$01D960 |
    BEQ CODE_81D96A               ;$01D963 |
    CPY.W #$000A                  ;$01D965 |
    BCC CODE_81D96F               ;$01D968 |

CODE_81D96A:
    CMP.W #$0010                  ;$01D96A |
    BCC CODE_81D972               ;$01D96D |

CODE_81D96F:
    LDY.W #$0000                  ;$01D96F |

CODE_81D972:
    STA.W $3390                   ;$01D972 |
    STY.W $338A                   ;$01D975 |
    LDX.B $00                     ;$01D978 |
    LDY.B $02                     ;$01D97A |
    LDA.W $6A00,Y                 ;$01D97C |
    DEC A                         ;$01D97F |
    CLC                           ;$01D980 |
    ADC.L DATA16_01DA07,X         ;$01D981 |
    BPL CODE_81D98A               ;$01D985 |
    LDA.W #$0000                  ;$01D987 |

CODE_81D98A:
    PHA                           ;$01D98A |
    LDA.W $6986,Y                 ;$01D98B |
    SEC                           ;$01D98E |
    SBC.L DATA16_01DA0D,X         ;$01D98F |
    INC A                         ;$01D993 |
    TAX                           ;$01D994 |
    PLY                           ;$01D995 |
    JSL.L CODE_FL_01CA71          ;$01D996 |
    STX.W $3398                   ;$01D99A |
    CPY.W #$0001                  ;$01D99D |
    BEQ CODE_81D9A7               ;$01D9A0 |
    CPY.W #$000A                  ;$01D9A2 |
    BCC CODE_81D9AC               ;$01D9A5 |

CODE_81D9A7:
    CMP.W #$0010                  ;$01D9A7 |
    BCC CODE_81D9AF               ;$01D9AA |

CODE_81D9AC:
    LDY.W #$0000                  ;$01D9AC |

CODE_81D9AF:
    STA.W $3392                   ;$01D9AF |
    STY.W $338C                   ;$01D9B2 |
    LDX.B $00                     ;$01D9B5 |
    CPX.W #$0002                  ;$01D9B7 |
    BNE CODE_81D9F1               ;$01D9BA |
    LDY.B $02                     ;$01D9BC |
    LDA.W $6A00,Y                 ;$01D9BE |
    BPL CODE_01D9C6               ;$01D9C1 |
    LDA.W #$0000                  ;$01D9C3 |

CODE_01D9C6:
    PHA                           ;$01D9C6 |
    LDA.W $6986,Y                 ;$01D9C7 |
    SEC                           ;$01D9CA |
    SBC.L DATA16_01DA0D,X         ;$01D9CB |
    INC A                         ;$01D9CF |
    TAX                           ;$01D9D0 |
    PLY                           ;$01D9D1 |
    JSL.L CODE_FL_01CA71          ;$01D9D2 |
    STX.W $339A                   ;$01D9D6 |
    CPY.W #$0001                  ;$01D9D9 |
    BEQ CODE_01D9E3               ;$01D9DC |
    CPY.W #$000A                  ;$01D9DE |
    BCC CODE_01D9E8               ;$01D9E1 |

CODE_01D9E3:
    CMP.W #$0010                  ;$01D9E3 |
    BCC CODE_01D9EB               ;$01D9E6 |

CODE_01D9E8:
    LDY.W #$0000                  ;$01D9E8 |

CODE_01D9EB:
    STA.W $3394                   ;$01D9EB |
    STY.W $338E                   ;$01D9EE |

CODE_81D9F1:
    LDY.B $02                     ;$01D9F1 |
    LDA.W $33AA,Y                 ;$01D9F3 |
    CMP.W #$0004                  ;$01D9F6 |
    BCC CODE_81DA06               ;$01D9F9 |
    LDA.W $33B0                   ;$01D9FB |
    BNE CODE_81DA06               ;$01D9FE |
    STA.W $36E2,Y                 ;$01DA00 |
    STA.W $33AA,Y                 ;$01DA03 |

CODE_81DA06:
    RTS                           ;$01DA06 |

DATA16_01DA07:
    dw $000C                      ;$01DA07 |

DATA16_01DA09:
    dw $0010,$0003                ;$01DA09 |

DATA16_01DA0D:
    dw $0008,$000C,$0006          ;$01DA0D |

DATA16_01DA13:
    dw $FFFD,$FFFC,$FFF8,$0002    ;$01DA13 |
    dw $0003,$0007,$0000,$0000    ;$01DA1B |
    dw $FFFC,$FFFA,$FFF4,$0003    ;$01DA23 |
    dw $0005,$000B,$0000,$0000    ;$01DA2B |
    dw $FFFE,$FFFD,$FFFA,$0002    ;$01DA33 |
    dw $0002,$0005,$0000,$0000    ;$01DA3B |

DATA16_01DA43:
    dw $0002,$0003,$0007,$FFFD    ;$01DA43 |
    dw $FFFC,$FFF8,$0000,$0000    ;$01DA4B |
    dw $0003,$0005,$000B,$FFFC    ;$01DA53 |
    dw $FFFA,$FFF4,$0000,$0000    ;$01DA5B |
    dw $0002,$0002,$0005,$FFFD    ;$01DA63 |
    dw $FFFE,$FFFA,$0000,$0000    ;$01DA6B |

CODE_FL_01DA73:
    LDY.B $39                     ;$01DA73 |
    LDX.W $6986,Y                 ;$01DA75 |
    LDA.W $6A00,Y                 ;$01DA78 |
    TAY                           ;$01DA7B |

CODE_FL_01DA7C:
    JSL.L CODE_FL_01CE20          ;$01DA7C |
    LDY.B $39                     ;$01DA80 |
    AND.W #$0080                  ;$01DA82 |
    STA.W $33B4                   ;$01DA85 |
    RTL                           ;$01DA88 |
    db $00,$FA,$F4,$A8,$36,$03,$FA,$FC;$01DA89 |
    db $A8,$36,$00,$00,$06,$B2,$76,$00;$01DA91 |
    db $00,$FE,$A2,$76,$01,$08,$FE,$A0;$01DA99 |
    db $76,$00,$F8,$06,$B2,$36,$00,$F8;$01DAA1 |
    db $FE,$A2,$36,$03,$E8,$FE,$A0,$36;$01DAA9 |
    db $00,$0C,$05,$BB,$02,$00,$0C,$FD;$01DAB1 |
    db $AB,$02,$00,$EC,$05,$BB,$02,$00;$01DAB9 |
    db $EC,$FD,$AB,$02,$00,$04,$05,$BC;$01DAC1 |
    db $72,$00,$04,$FD,$AC,$72,$01,$14;$01DAC9 |
    db $FD,$AA,$72,$01,$DC,$FD,$AA,$32;$01DAD1 |
    db $03,$F4,$FD,$AC,$32,$00,$04,$04;$01DAD9 |
    db $8E,$38,$00,$FC,$04,$8D,$38,$00;$01DAE1 |
    db $F4,$04,$8C,$38,$00,$04,$FC,$9B;$01DAE9 |
    db $38,$00,$04,$F4,$8B,$38,$03,$F4;$01DAF1 |
    db $F4,$89,$38,$00,$FC,$FC,$9A,$38;$01DAF9 |
    db $00,$F4,$FC,$99,$38,$00,$04,$04;$01DB01 |
    db $8E,$38,$00,$FC,$04,$8D,$38,$00;$01DB09 |
    db $F4,$04,$8C,$38,$02,$04,$FC,$9B;$01DB11 |
    db $38,$00,$04,$04,$8E,$38,$00,$FC;$01DB19 |
    db $04,$8D,$38,$02,$F4,$04,$8C,$38;$01DB21 |
    db $00,$04,$04,$8E,$08,$00,$FC,$04;$01DB29 |
    db $8D,$08,$02,$F4,$04,$8C,$08,$00;$01DB31 |
    db $00,$08,$31,$73,$00,$08,$08,$30;$01DB39 |
    db $73,$00,$F8,$08,$31,$33,$02,$F0;$01DB41 |
    db $08,$30,$33,$00,$04,$08,$34,$73;$01DB49 |
    db $00,$04,$00,$33,$73,$00,$04,$F8;$01DB51 |
    db $32,$73,$00,$FC,$08,$37,$33,$00;$01DB59 |
    db $FC,$00,$36,$33,$00,$FC,$F8,$35;$01DB61 |
    db $33,$00,$F4,$08,$34,$33,$00,$F4;$01DB69 |
    db $00,$33,$33,$02,$F4,$F8,$32,$33;$01DB71 |
    db $00,$00,$EB,$3E,$33,$00,$F8,$EB;$01DB79 |
    db $3D,$33,$00,$00,$E3,$3C,$33,$00;$01DB81 |
    db $F8,$E3,$3B,$33,$00,$00,$02,$3A;$01DB89 |
    db $73,$00,$00,$FA,$39,$73,$00,$00;$01DB91 |
    db $F2,$38,$73,$00,$F8,$02,$3A,$33;$01DB99 |
    db $00,$F8,$FA,$39,$33,$02,$F8,$F2;$01DBA1 |
    db $38,$33,$00,$F8,$EB,$3E,$73,$00;$01DBA9 |
    db $00,$EB,$3D,$73,$00,$F8,$E3,$3C;$01DBB1 |
    db $73,$00,$00,$E3,$3B,$73,$00,$F8;$01DBB9 |
    db $02,$3A,$33,$00,$F8,$FA,$39,$33;$01DBC1 |
    db $00,$F8,$F2,$38,$33,$00,$00,$02;$01DBC9 |
    db $3A,$73,$00,$00,$FA,$39,$73,$02;$01DBD1 |
    db $00,$F2,$38,$73,$01,$F8,$E3,$4C;$01DBD9 |
    db $33,$00,$00,$02,$3A,$73,$00,$00;$01DBE1 |
    db $FA,$39,$73,$00,$00,$F2,$38,$73;$01DBE9 |
    db $00,$F8,$02,$3A,$33,$00,$F8,$FA;$01DBF1 |
    db $39,$33,$02,$F8,$F2,$38,$33,$01;$01DBF9 |
    db $F8,$E3,$4C,$73,$00,$F8,$02,$3A;$01DC01 |
    db $33,$00,$F8,$FA,$39,$33,$00,$F8;$01DC09 |
    db $F2,$38,$33,$00,$00,$02,$3A,$73;$01DC11 |
    db $00,$00,$FA,$39,$73,$02,$00,$F2;$01DC19 |
    db $38,$73,$01,$F8,$E3,$4E,$33,$00;$01DC21 |
    db $00,$02,$3A,$73,$00,$00,$FA,$39;$01DC29 |
    db $73,$00,$00,$F2,$38,$73,$00,$F8;$01DC31 |
    db $02,$3A,$33,$00,$F8,$FA,$39,$33;$01DC39 |
    db $02,$F8,$F2,$38,$33,$01,$F8,$E3;$01DC41 |
    db $4E,$73,$00,$F8,$02,$3A,$33,$00;$01DC49 |
    db $F8,$FA,$39,$33,$00,$F8,$F2,$38;$01DC51 |
    db $33,$00,$00,$02,$3A,$73,$00,$00;$01DC59 |
    db $FA,$39,$73,$02,$00,$F2,$38,$73;$01DC61 |
    db $00,$FB,$EA,$3F,$33,$00,$00,$02;$01DC69 |
    db $3A,$73,$00,$00,$FA,$39,$73,$00;$01DC71 |
    db $00,$F2,$38,$73,$00,$F8,$02,$3A;$01DC79 |
    db $33,$00,$F8,$FA,$39,$33,$02,$F8;$01DC81 |
    db $F2,$38,$33,$00,$18,$00,$53,$3F;$01DC89 |
    db $00,$10,$00,$52,$3F,$00,$18,$F8;$01DC91 |
    db $51,$3F,$00,$10,$F8,$50,$3F,$01;$01DC99 |
    db $00,$10,$3E,$7F,$01,$00,$00,$3C;$01DCA1 |
    db $7F,$01,$00,$F0,$3A,$7F,$01,$00;$01DCA9 |
    db $E0,$38,$7F,$01,$10,$10,$36,$7F;$01DCB1 |
    db $01,$10,$00,$34,$7F,$01,$10,$F0;$01DCB9 |
    db $32,$7F,$01,$10,$E0,$30,$7F,$01;$01DCC1 |
    db $F0,$10,$3E,$3F,$01,$F0,$00,$3C;$01DCC9 |
    db $3F,$01,$F0,$F0,$3A,$3F,$01,$F0;$01DCD1 |
    db $E0,$38,$3F,$01,$E0,$10,$36,$3F;$01DCD9 |
    db $01,$E0,$00,$34,$3F,$01,$E0,$F0;$01DCE1 |
    db $32,$3F,$03,$E0,$E0,$30,$3F,$00;$01DCE9 |
    db $E0,$00,$53,$7F,$00,$E8,$00,$52;$01DCF1 |
    db $7F,$00,$E0,$F8,$51,$7F,$00,$E8;$01DCF9 |
    db $F8,$50,$7F,$01,$F0,$10,$3E,$3F;$01DD01 |
    db $01,$F0,$00,$3C,$3F,$01,$F0,$F0;$01DD09 |
    db $3A,$3F,$01,$F0,$E0,$38,$3F,$01;$01DD11 |
    db $E0,$10,$36,$3F,$01,$E0,$00,$34;$01DD19 |
    db $3F,$01,$E0,$F0,$32,$3F,$01,$E0;$01DD21 |
    db $E0,$30,$3F,$01,$00,$10,$3E,$7F;$01DD29 |
    db $01,$00,$00,$3C,$7F,$01,$00,$F0;$01DD31 |
    db $3A,$7F,$01,$00,$E0,$38,$7F,$01;$01DD39 |
    db $10,$10,$36,$7F,$01,$10,$00,$34;$01DD41 |
    db $7F,$01,$10,$F0,$32,$7F,$03,$10;$01DD49 |
    db $E0,$30,$7F,$00,$00,$F0,$5B,$7F;$01DD51 |
    db $00,$18,$10,$36,$7F,$00,$10,$18;$01DD59 |
    db $47,$7F,$00,$18,$18,$46,$7F,$00;$01DD61 |
    db $00,$18,$51,$7F,$00,$08,$18,$50;$01DD69 |
    db $7F,$00,$18,$08,$44,$7F,$00,$18;$01DD71 |
    db $00,$34,$7F,$00,$10,$00,$4B,$3F;$01DD79 |
    db $00,$10,$10,$5A,$3F,$00,$08,$10;$01DD81 |
    db $59,$3F,$00,$00,$10,$58,$3F,$00;$01DD89 |
    db $10,$08,$57,$3F,$00,$08,$08,$56;$01DD91 |
    db $3F,$00,$00,$08,$55,$3F,$01,$00;$01DD99 |
    db $F8,$3A,$7F,$01,$00,$E0,$38,$7F;$01DDA1 |
    db $01,$10,$F0,$32,$7F,$01,$10,$E0;$01DDA9 |
    db $30,$7F,$00,$F8,$F0,$5B,$3F,$00;$01DDB1 |
    db $F8,$18,$51,$3F,$00,$F0,$18,$50;$01DDB9 |
    db $3F,$01,$F0,$08,$3C,$3F,$01,$F0;$01DDC1 |
    db $F8,$3A,$3F,$01,$F0,$E0,$38,$3F;$01DDC9 |
    db $01,$E0,$10,$36,$3F,$01,$E0,$00;$01DDD1 |
    db $34,$3F,$01,$E0,$F0,$32,$3F,$03;$01DDD9 |
    db $E0,$E0,$30,$3F,$00,$F8,$F0,$5B;$01DDE1 |
    db $3F,$00,$E0,$10,$36,$3F,$00,$E8;$01DDE9 |
    db $18,$47,$3F,$00,$E0,$18,$46,$3F;$01DDF1 |
    db $00,$F8,$18,$51,$3F,$00,$F0,$18;$01DDF9 |
    db $50,$3F,$00,$E0,$08,$44,$3F,$00;$01DE01 |
    db $E0,$00,$34,$3F,$00,$E8,$00,$4B;$01DE09 |
    db $7F,$00,$E8,$10,$5A,$7F,$00,$F0;$01DE11 |
    db $10,$59,$7F,$00,$F8,$10,$58,$7F;$01DE19 |
    db $00,$E8,$08,$57,$7F,$00,$F0,$08;$01DE21 |
    db $56,$7F,$00,$F8,$08,$55,$7F,$01;$01DE29 |
    db $F0,$F8,$3A,$3F,$01,$F0,$E0,$38;$01DE31 |
    db $3F,$01,$E0,$F0,$32,$3F,$01,$E0;$01DE39 |
    db $E0,$30,$3F,$00,$00,$F0,$5B,$7F;$01DE41 |
    db $00,$00,$18,$51,$7F,$00,$08,$18;$01DE49 |
    db $50,$7F,$01,$00,$08,$3C,$7F,$01;$01DE51 |
    db $00,$F8,$3A,$7F,$01,$00,$E0,$38;$01DE59 |
    db $7F,$01,$10,$10,$36,$7F,$01,$10;$01DE61 |
    db $00,$34,$7F,$01,$10,$F0,$32,$7F;$01DE69 |
    db $03,$10,$E0,$30,$7F        ;$01DE71 |


CODE_FL_01DE76:					;-----------| Routine to prepare a VWF upload. A = index to placement info ($CB0000), X = index to text data ($CB0F18)
	STZ $4B						;$01DE76	|] Set the BG3 tilemap to be cleared out.
	BRA CODE_FL_01DE7F			;$01DE78	|

CODE_FL_01DE7A:					;```````````| Entry point to the above, which does not clear out the BG3 tilemap.
	LDY #$0001					;$01DE7A	|\ Set the BG3 tilemap to not be cleared out.
	STY $4B						;$01DE7D	|/
CODE_FL_01DE7F:					;			|
	STA $49						;$01DE7F	|
	LDA.l TextDataPointers,X			;$01DE81	|\ 
	STA $45						;$01DE85	|| Get pointer to data in the text data in bank 0x16.
	LDA #$00CB					;$01DE87	||
	STA $47						;$01DE8A	|/
	LDA #$FFFF					;$01DE8C	|
	STA $7A23					;$01DE8F	|
	STZ $303B					;$01DE92	|
	STZ $3041					;$01DE95	|
	BIT $0000					;$01DE98	|\ 
	BPL CODE_FL_01DEA7			;$01DE9B	||
	LDA #$DEA7					;$01DE9D	|| Make sure the below executes on the SNES.
	LDX #$0001					;$01DEA0	||
	JML SA1_ExecuteSNES			;$01DEA3	|/

CODE_FL_01DEA7:					;```````````| Should now be running on the SNES.
	LDA $45						;$01DEA7	|\ 
	STA $0091					;$01DEA9	|| $91 = pointer to VWF data.
	LDA $47						;$01DEAC	||
	STA $0093					;$01DEAE	|/
	LDA $49						;$01DEB1	|\ $8F  = index to some info about where to place the tilemap.
	STA $008F					;$01DEB3	|/
	ASL A						;$01DEB6	|
	ASL A						;$01DEB7	|
	ASL A						;$01DEB8	|
	TAX							;$01DEB9	|
	LDA.l DATA_CB0000, X			;$01DEBA	|\ $4F = base BG3 GFX VRAM address to use
	STA $004F					;$01DEBD	|/
	LDA.l DATA_CB0000+2, X		;$01DEC1	|\ $4B = base BG3 tilemap VRAM address to use
	STA $004B					;$01DEC5	|/
	LDA.l DATA_CB0000+5,X		;$01DEC8	|\ 
	AND #$00FF					;$01DECC	||
	ORA #$2000					;$01DECF	||
	STA HW_WRMPYA					;$01DED2	||
	LDA.l DATA_CB0000+4, X		;$01DED5	|| $4D = VRAM address to start writing the tilemap at
	AND #$00FF					;$01DED9	||
	ADC HW_RDMPY					;$01DEDC	||
	ADC $004B					;$01DEDF	||
	STA $004D					;$01DEE2	|/
	LDA.l DATA_CB0000+6,X		;$01DEE5	|\ 
	STA HW_WRMPYA					;$01DEE9	||
	AND #$00FF					;$01DEEC	||
	STA $0051					;$01DEEF	||
	LDA.l DATA_CB0000+7,              X		;$01DEF2	|| $51 = width of text
	AND   #$00FF					;$01DEF6	|| $53 = height of text
	STA   $0053					;$01DEF9	|| $55  = total number of 8x8 tiles in text
	LDA HW_RDMPY					;$01DEFC	||
	INC A						;$01DEFF	||
	INC A						;$01DF00	||
	STA $0055					;$01DF01	|/
	LDA #$0000					;$01DF04	|\ 
	LDX $004F					;$01DF07	|| Set VRAM address for the BG3 tilemap/GFX as specified.
 	LDY $004B					;$01DF0A	||
	JSL ConfigureLayer3			;$01DF0D	|/
	LDA #$0006					;$01DF11	|\ 
	STA $31						;$01DF14	||
	LDA #$0010					;$01DF16	||
	STA $32						;$01DF19	|| Set up a 16-byte fixed-transfer DMA from
	LDA #$DF94					;$01DF1B	||  $01DF94 (00) to the start of the BG3 GFX file.
	STA $34						;$01DF1E	|| Basically, this writes a blank tile.
	LDA #$0001					;$01DF20	||
	STA $36						;$01DF23	||
	LDA $004F					;$01DF25	||
	STA.B CameraX_TileMirror	;$01DF28	||
	JSL WriteToDMABuffer		;$01DF2A	|/
	LDA $4B						;$01DF2E	|\ Branch if the tilemap is not supposed to be cleared.
	BNE CODE_FL_01DF53			;$01DF30	|/
	LDA #$000C					;$01DF32	|\ 
	STA $31						;$01DF35	||
	LDA #$0400					;$01DF37	||
	STA $32						;$01DF3A	|| Set up two 0x400 fixed-transfer DMAs from
	LDA $004B					;$01DF3C	||  $01DF94 (00,20) to the BG3 tilemap.
	STA.B CameraX_TileMirror						;$01DF3F	|| The first transfer does the low bytes (00 - tile number),
	JSL WriteToDMABuffer		;$01DF41	||  while the second does the high bytes (20 - yxppccct).
	SEP #$20					;$01DF45	||
	LDA #$12					;$01DF47	|| In other words, this clears out the tilemap.
	STA $31						;$01DF49	||
	REP #$20					;$01DF4B	||
	INC $34						;$01DF4D	||
	JSL WriteToDMABuffer		;$01DF4F	|/
CODE_FL_01DF53:					;			|
	STZ $0057					;$01DF53	|
	STZ $0059					;$01DF56	|
	STZ $005B					;$01DF59	|
	STZ $005D					;$01DF5C	|
	STZ $005F					;$01DF5F	|
	STZ $0061					;$01DF62	|
	STZ $0083					;$01DF65	|
	STZ $0069					;$01DF68	|
	STZ $006B					;$01DF6B	|
	LDA #$0001					;$01DF6E	|\ Set secondary color to be included.
	STA $006D					;$01DF71	|/
	LDA #$0000					;$01DF74	|
	STA $0067					;$01DF77	|
	LDA #$0006					;$01DF7A	|\ Set character width to 6 pixels.
	STA $0063					;$01DF7D	|/
	SEP #$20					;$01DF80	|
	LDA #$06					;$01DF82	|
	STA $0065					;$01DF84	|
	LDA #$80					;$01DF87	|
	STA $0066					;$01DF89	|
	REP #$20					;$01DF8C	|
	STZ $33C6					;$01DF8E	|
	JMP VWF_TextLoopEntry			;$01DF91	|
	
DATA_01DF94:					;$01DF94	| Used for a fixed-transfer DMA to a specified VRAM location.
	db $00,$20



CODE_FL_01DF96: 				;-----------|
	LDA.l TextDataPointers,X	;$01DF96	|\ 
	STA $45						;$01DF9A	|| Get pointer to the text string being read.
	LDA #$00CB					;$01DF9C	||
	STA $47						;$01DF9F	|/
	STZ $33C6					;$01DFA1	|
	BIT $0000					;$01DFA4	|\ 
	BPL CODE_FL_01DFB3			;$01DFA7	||
	LDA #$DFB3					;$01DFA9	|| Run the below on the SNES.
	LDX #$0001					;$01DFAC	||
	JML SA1_ExecuteSNES			;$01DFAF	|/

CODE_FL_01DFB3:					;```````````| On the SNES now.
	STZ $0083					;$01DFB3	|
	STZ $0061					;$01DFB6	|
	JMP VWF_TextLoopEntry		;$01DFB9	|


Consume_5_Params: 				;-----------| Alt entry to the below: increments text pointer by 5 before moving on. (command takes 5 parameters)
	INC $45						;$01DFBC	|
Consume_4_Params:				;```````````| ...by 4.	(command takes 4 parameters)
	INC $45						;$01DFBE	|
Consume_3_Params:				;```````````| ...by 3.	(command takes 3 parameters)
	INC $45						;$01DFC0	|
Consume_2_Params:				;```````````| ...by 2.	(command takes 2 parameters)
	INC $45						;$01DFC2	|
Consume_1_Param:				;```````````| ...by 1.	(command takes 1 parameter)
	INC $45						;$01DFC4	|
VWF_TextLoopEntry: 				;-----------| Main entry to the VWF text loop. Reads and prepares text to be written to the screen.
	LDA $33C6					;$01DFC6	|
	BNE CODE_FL_01DFEA			;$01DFC9	|
	LDA $30A3					;$01DFCB	|
	AND #$0004					;$01DFCE	|
	TSB $7A28					;$01DFD1	|
	LDA $0061					;$01DFD4	|
	BEQ CODE_FL_01DFED			;$01DFD7	|
	DEC $0061					;$01DFD9	|
	LDA $32C4					;$01DFDC	|
	ORA $32C6					;$01DFDF	|
	AND $005F					;$01DFE2	|
	BEQ CODE_FL_01DFEA			;$01DFE5	|
	STZ $0061					;$01DFE7	|
CODE_FL_01DFEA: 				;			|
	JMP CODE_FL_01E6F6			;$01DFEA	|

CODE_FL_01DFED: 
	LDA [$45]					;$01DFED	|\ Get current byte and increment text pointer.
	INC $45						;$01DFEF	|/
	AND #$00FF					;$01DFF1	|\ 
	CMP #$0020					;$01DFF4	|| Branch if this is a normal character and not a command.
	BCS CODE_FL_01E03E			;$01DFF7	|/
	ASL A						;$01DFF9	|
	TAX							;$01DFFA	|
	JMP (Pointers01DFFE,X)		;$01DFFB	|

Pointers01DFFE:					;$01DFFE	| Pointers to routines for special text commands.
	dw CODE_FL_01E362				; 00 - End of text
	dw CODE_FL_01E386				; 01 - Wait $XX frames
	dw CODE_FL_01E47E				; 02 - New line
	dw CODE_FL_01E4B1				; 03 - 
	dw CODE_FL_01E6C8				; 04 - 
	dw CODE_FL_01E4F1				; 05 - Set character width
	dw CODE_FL_01E504				; 06 - 
	dw CODE_FL_01E519				; 07 - 
	dw CODE_FL_01E521				; 08 - Change text foreground/background color
	dw CODE_FL_01E52D				; 09 - 
	dw CODE_FL_01E543				; 0A - 
	dw CODE_FL_01E54C				; 0B - 
	dw CODE_FL_01E555				; 0C - 
	dw CODE_FL_01E56F				; 0D - 
	dw CODE_FL_01E588				; 0E - Jump to text macro
	dw CODE_FL_01E5AE				; 0F - 
	dw CODE_FL_01E67D				; 10 - Write 8-bit value to RAM address
	dw CODE_FL_01E694				; 11 - Write 16-bit value to RAM address
	dw CODE_FL_01E6A7				; 12 - Enable text cursor
	dw CODE_FL_01E6B0				; 13 - Disable text cursor
	dw CODE_FL_01E6B9				; 14 - Enable secondary color
	dw CODE_FL_01E6C2				; 15 - Disable secondary color
	dw VWF_TextLoopEntry				; 16 - Unused?
	dw VWF_TextLoopEntry				; 17 - Unused?
	dw CODE_FL_01E067				; 18 - Write character 1xx
	dw CODE_FL_01E05B				; 19 - Write character 2xx
	dw VWF_TextLoopEntry				; 1A - Unused?
	dw CODE_FL_01E35F				; 1B - Skip next byte?
	dw VWF_TextLoopEntry				; 1C - Unused?
	dw CODE_FL_01E6D3				; 1D - 
	dw CODE_FL_01E6DE				; 1E - 
	dw CODE_FL_01E6EA				; 1F - 



CODE_FL_01E03E:					;-----------| Not a special command; write either a space or normal character.
	CMP #$0020					;$01E03E	|\ Branch if reading a non-space character (0x20).
	BNE CODE_FL_01E071			;$01E041	|/
	LDA $0063					;$01E043	|\\ ???
	BPL CODE_FL_01E04B			;$01E046	||/
	LDA #$0006					;$01E048	||] Standard space width (6 pixels).
CODE_FL_01E04B:					;			|| Increment text position by the specified space width.
	CLC							;$01E04B	||
	ADC $0057					;$01E04C	||
	STA $0057					;$01E04F	|/
	LDA $005D					;$01E052	|\ ?
	STA $0061					;$01E055	|/
	JMP VWF_TextLoopEntry			;$01E058	|



CODE_FL_01E05B:					;-----------| Text command 19 - Write tile directly, with a high byte of 0x02.
	LDA [$45]					;$01E05B	|\ 
	AND #$00FF					;$01E05D	|| Set high byte of next tile to 0x02.
	ORA #$0200					;$01E060	||
	INC $45						;$01E063	|/
	BRA CODE_FL_01E071			;$01E065	| Prepare that tile for VRAM.

CODE_FL_01E067:					;-----------| Text command 18 - Write tile directly, with a high byte of 0x01.
	LDA [$45]					;$01E05B	|\ 
	AND #$00FF					;$01E05D	|| Set high byte of the next tile to 0x01.
	ORA #$0100					;$01E060	||
	INC $45						;$01E063	|/

CODE_FL_01E071:					;-----------| Text value of 0x21-0xFF: Prepare for writing tile directly into VRAM. TODO: later...
	SEC							;$01E071	|\ 
	SBC #$0021					;$01E072	|| $0C = char number
	STA $0C						;$01E075	|/
	LDX $0057					;$01E077	|
	CPX #$0100					;$01E07A	|
	BCC CODE_FL_01E082			;$01E07D	|
	JMP CODE_FL_01E310			;$01E07F	|

CODE_FL_01E082: 
	CMP #$000A					;$01E082	|
	BCS CODE_FL_01E090			;$01E085	|
	ASL A						;$01E087	|
	ASL A						;$01E088	|
	ASL A						;$01E089	|
	ASL A						;$01E08A	|
	ADC #$00F8					;$01E08B	|
	BRA CODE_FL_01E098			;$01E08E	|

CODE_FL_01E090: 
	ASL A						;$01E090	|
	ASL A						;$01E091	|
	ASL A						;$01E092	|
	ASL A						;$01E093	|
	ASL A						;$01E094	|
	ADC #$0058					;$01E095	|
CODE_FL_01E098:					;			|
	STA $14						;$01E098	|
	LDA #$00CB					;$01E09A	|
	STA $16						;$01E09D	|
	SEP #$20					;$01E09F	|
	LDX #$0000					;$01E0A1	|
CODE_FL_01E0A4:					;			|
	LDA $0D						;$01E0A4	|
	BNE CODE_FL_01E0E0			;$01E0A6	|
	LDA $0C						;$01E0A8	|
	CMP #$0A					;$01E0AA	|
	BCS CODE_FL_01E0E0			;$01E0AC	|
	LDA [$14]					;$01E0AE	|
	STA $00						;$01E0B0	|
	STZ $01						;$01E0B2	|
	STZ $02						;$01E0B4	|
	LDY #$0008					;$01E0B6	|
	LDA [$14],Y					;$01E0B9	|
	STA $03						;$01E0BB	|
	STZ $04						;$01E0BD	|
	STZ $05						;$01E0BF	|
	LDA $0066					;$01E0C1	|
	BMI CODE_FL_01E11E			;$01E0C4	|
	CPX $0066					;$01E0C6	|
	BNE CODE_FL_01E0D1			;$01E0C9	|
	LDA #$FF					;$01E0CB	|
	STA $00						;$01E0CD	|
	BRA CODE_FL_01E11E			;$01E0CF	|

CODE_FL_01E0D1: 
	TXA							;$01E0D1	|
	CLC							;$01E0D2	|
	ADC #$10					;$01E0D3	|
	CMP $0066					;$01E0D5	|
	BNE CODE_FL_01E11E			;$01E0D8	|
	LDA #$FF					;$01E0DA	|
	STA $03						;$01E0DC	|
	BRA CODE_FL_01E11E			;$01E0DE	|

CODE_FL_01E0E0: 
	LDA [$14]					;$01E0E0	|
	STA $00						;$01E0E2	|
	LDY #$0010					;$01E0E4	|
	LDA [$14],Y					;$01E0E7	|
	STA $01						;$01E0E9	|
	STZ $02						;$01E0EB	|
	LDY #$0008					;$01E0ED	|
	LDA [$14],Y					;$01E0F0	|
	STA $03						;$01E0F2	|
	LDY #$0018					;$01E0F4	|
	LDA [$14],Y					;$01E0F7	|
	STA $04						;$01E0F9	|
	STZ $05						;$01E0FB	|
	LDA $0066					;$01E0FD	|
	BMI CODE_FL_01E11E			;$01E100	|
	CPX $0066					;$01E102	|
	BNE CODE_FL_01E10F			;$01E105	|
	LDA #$FF					;$01E107	|
	STA $00						;$01E109	|
	STA $01						;$01E10B	|
	BRA CODE_FL_01E11E			;$01E10D	|

CODE_FL_01E10F: 
	TXA							;$01E10F	|
	CLC							;$01E110	|
	ADC #$10					;$01E111	|
	CMP $0066					;$01E113	|
	BNE CODE_FL_01E11E			;$01E116	|
	LDA #$FF					;$01E118	|
	STA $03						;$01E11A	|
	STA $04						;$01E11C	|
CODE_FL_01E11E:					;			|
	LDA $0057					;$01E11E	|
	AND #$07					;$01E121	|
	BEQ CODE_FL_01E134			;$01E123	|
CODE_FL_01E125:					;			|
	LSR $00						;$01E125	|
	ROR $01						;$01E127	|
	ROR $02						;$01E129	|
	LSR $03						;$01E12B	|
	ROR $04						;$01E12D	|
	ROR $05						;$01E12F	|
	DEC A						;$01E131	|
	BNE CODE_FL_01E125			;$01E132	|
CODE_FL_01E134:					;			|
	LDA $0063					;$01E134	|
	BPL CODE_FL_01E159			;$01E137	|
	TXY							;$01E139	|
	LDX $0C						;$01E13A	|
	CPX #$0060					;$01E13C	|
	BCS CODE_FL_01E158			;$01E13F	|
	LDA.l DATA_01E8C1,X			;$01E141	|
	AND #$FF					;$01E145	|
	BEQ CODE_FL_01E158			;$01E147	|
CODE_FL_01E149:					;			|
	ASL $02						;$01E149	|
	ROL $01						;$01E14B	|
	ROL $00						;$01E14D	|
	ASL $05						;$01E14F	|
	ROL $04						;$01E151	|
	ROL $03						;$01E153	|
	DEC A						;$01E155	|
	BNE CODE_FL_01E149			;$01E156	|
CODE_FL_01E158:					;			|
	TYX							;$01E158	|
CODE_FL_01E159:					;			|
	LDA $006D					;$01E159	|
	BEQ CODE_FL_01E17E			;$01E15C	|
	LDA $00						;$01E15E	|
	LSR A						;$01E160	|
	STA $06						;$01E161	|
	LDA $01						;$01E163	|
	ROR A						;$01E165	|
	STA $07						;$01E166	|
	LDA $02						;$01E168	|
	ROR A						;$01E16A	|
	STA $08						;$01E16B	|
	LDA $03						;$01E16D	|
	LSR A						;$01E16F	|
	STA $09						;$01E170	|
	LDA $04						;$01E172	|
	ROR A						;$01E174	|
	STA $0A						;$01E175	|
	LDA $05						;$01E177	|
	ROR A						;$01E179	|
	STA $0B						;$01E17A	|
	BRA CODE_FL_01E18A			;$01E17C	|

CODE_FL_01E17E: 
	STZ $06						;$01E17E	|
	STZ $07						;$01E180	|
	STZ $08						;$01E182	|
	STZ $09						;$01E184	|
	STZ $0A						;$01E186	|
	STZ $0B						;$01E188	|
CODE_FL_01E18A:					;			|
	LDA $00						;$01E18A	|
	ORA $06						;$01E18C	|
	EOR #$FF					;$01E18E	|
	STA $12D8,X					;$01E190	|
	STA $12D9,X					;$01E193	|
	LDA $01						;$01E196	|
	ORA $07						;$01E198	|
	EOR #$FF					;$01E19A	|
	STA $12E8,X					;$01E19C	|
	STA $12E9,X					;$01E19F	|
	LDA $02						;$01E1A2	|
	ORA $08						;$01E1A4	|
	EOR #$FF					;$01E1A6	|
	STA $12F8,X					;$01E1A8	|
	STA $12F9,X					;$01E1AB	|
	LDA $03						;$01E1AE	|
	ORA $09						;$01E1B0	|
	EOR #$FF					;$01E1B2	|
	STA $1308,X					;$01E1B4	|
	STA $1309,X					;$01E1B7	|
	LDA $04						;$01E1BA	|
	ORA $0A						;$01E1BC	|
	EOR #$FF					;$01E1BE	|
	STA $1318,X					;$01E1C0	|
	STA $1319,X					;$01E1C3	|
	LDA $05						;$01E1C6	|
	ORA $0B						;$01E1C8	|
	EOR #$FF					;$01E1CA	|
	STA $1328,X					;$01E1CC	|
	STA $1329,X					;$01E1CF	|
	LDA $00						;$01E1D2	|
	EOR #$FF					;$01E1D4	|
	AND $06						;$01E1D6	|
	STA $1278,X					;$01E1D8	|
	STA $1279,X					;$01E1DB	|
	LDA $01						;$01E1DE	|
	EOR #$FF					;$01E1E0	|
	AND $07						;$01E1E2	|
	STA $1288,X					;$01E1E4	|
	STA $1289,X					;$01E1E7	|
	LDA $02						;$01E1EA	|
	EOR #$FF					;$01E1EC	|
	AND $08						;$01E1EE	|
	STA $1298,X					;$01E1F0	|
	STA $1299,X					;$01E1F3	|
	LDA $03						;$01E1F6	|
	EOR #$FF					;$01E1F8	|
	AND $09						;$01E1FA	|
	STA $12A8,X					;$01E1FC	|
	STA $12A9,X					;$01E1FF	|
	LDA $04						;$01E202	|
	EOR #$FF					;$01E204	|
	AND $0A						;$01E206	|
	STA $12B8,X					;$01E208	|
	STA $12B9,X					;$01E20B	|
	LDA $05						;$01E20E	|
	EOR #$FF					;$01E210	|
	AND $0B						;$01E212	|
	STA $12C8,X					;$01E214	|
	STA $12C9,X					;$01E217	|
	LDA $0065					;$01E21A	|
	AND #$01					;$01E21D	|
	BEQ CODE_FL_01E251			;$01E21F	|
	LDA $1278,X					;$01E221	|
	ORA $00						;$01E224	|
	STA $1278,X					;$01E226	|
	LDA $1288,X					;$01E229	|
	ORA $01						;$01E22C	|
	STA $1288,X					;$01E22E	|
	LDA $1298,X					;$01E231	|
	ORA $02						;$01E234	|
	STA $1298,X					;$01E236	|
	LDA $12A8,X					;$01E239	|
	ORA $03						;$01E23C	|
	STA $12A8,X					;$01E23E	|
	LDA $12B8,X					;$01E241	|
	ORA $04						;$01E244	|
	STA $12B8,X					;$01E246	|
	LDA $12C8,X					;$01E249	|
	ORA $05						;$01E24C	|
	STA $12C8,X					;$01E24E	|
CODE_FL_01E251:					;			|
	LDA $0065					;$01E251	|
	AND #$02					;$01E254	|
	BEQ CODE_FL_01E288			;$01E256	|
	LDA $1279,X					;$01E258	|
	ORA $00						;$01E25B	|
	STA $1279,X					;$01E25D	|
	LDA $1289,X					;$01E260	|
	ORA $01						;$01E263	|
	STA $1289,X					;$01E265	|
	LDA $1299,X					;$01E268	|
	ORA $02						;$01E26B	|
	STA $1299,X					;$01E26D	|
	LDA $12A9,X					;$01E270	|
	ORA $03						;$01E273	|
	STA $12A9,X					;$01E275	|
	LDA $12B9,X					;$01E278	|
	ORA $04						;$01E27B	|
	STA $12B9,X					;$01E27D	|
	LDA $12C9,X					;$01E280	|
	ORA $05						;$01E283	|
	STA $12C9,X					;$01E285	|
CODE_FL_01E288:					;			|
	INC $14						;$01E288	|
	INX							;$01E28A	|
	INX							;$01E28B	|
	CPX #$0010					;$01E28C	|
	BCS CODE_FL_01E294			;$01E28F	|
	JMP CODE_FL_01E0A4			;$01E291	|

CODE_FL_01E294: 
	REP #$20					;$01E294	|
	LDA $0057					;$01E296	|
	AND #$7FF8					;$01E299	|
	ASL A						;$01E29C	|
	ADC #$6570					;$01E29D	|
	STA $14						;$01E2A0	|
	ADC #$0200					;$01E2A2	|
	STA $18						;$01E2A5	|
	LDA #$007F					;$01E2A7	|
	STA $16						;$01E2AA	|
	STA $1A						;$01E2AC	|
	LDX #$0000					;$01E2AE	|
CODE_FL_01E2B1:					;			|
	LDA [$14]					;$01E2B1	|
	AND $12D8,X					;$01E2B3	|
	ORA $1278,X					;$01E2B6	|
	STA [$14]					;$01E2B9	|
	LDY #$0010					;$01E2BB	|
	LDA [$14],Y					;$01E2BE	|
	AND $12E8,X					;$01E2C0	|
	ORA $1288,X					;$01E2C3	|
	STA [$14],Y					;$01E2C6	|
	LDY #$0020					;$01E2C8	|
	LDA [$14],Y					;$01E2CB	|
	AND $12F8,X					;$01E2CD	|
	ORA $1298,X					;$01E2D0	|
	STA [$14],Y					;$01E2D3	|
	LDA [$18]					;$01E2D5	|
	AND $1308,X					;$01E2D7	|
	ORA $12A8,X					;$01E2DA	|
	STA [$18]					;$01E2DD	|
	LDY #$0010					;$01E2DF	|
	LDA [$18],Y					;$01E2E2	|
	AND $1318,X					;$01E2E4	|
	ORA $12B8,X					;$01E2E7	|
	STA [$18],Y					;$01E2EA	|
	LDY #$0020					;$01E2EC	|
	LDA [$18],Y					;$01E2EF	|
	AND $1328,X					;$01E2F1	|
	ORA $12C8,X					;$01E2F4	|
	STA [$18],Y					;$01E2F7	|
	LDA $14						;$01E2F9	|
	CLC							;$01E2FB	|
	ADC #$0002					;$01E2FC	|
	STA $14						;$01E2FF	|
	ADC #$0200					;$01E301	|
	STA $18						;$01E304	|
	INX							;$01E306	|
	INX							;$01E307	|
	CPX #$0010					;$01E308	|
	BCC CODE_FL_01E2B1			;$01E30B	|
	STX $006F					;$01E30D	|
CODE_FL_01E310:					;			|
	LDX $0C						;$01E310	|
	LDA $0063					;$01E312	|
	BPL CODE_FL_01E32A			;$01E315	|
	CPX #$0060					;$01E317	|
	BCS CODE_FL_01E325			;$01E31A	|
	LDA.l DATA_01E861,X			;$01E31C	|
	AND #$00FF					;$01E320	|
	BRA CODE_FL_01E336			;$01E323	|

CODE_FL_01E325: 
	LDA #$0006					;$01E325	|
	BRA CODE_FL_01E336			;$01E328	|

CODE_FL_01E32A: 
	CPX #$000A					;$01E32A	|
	BCS CODE_FL_01E336			;$01E32D	|
	LSR A						;$01E32F	|
	STA $00						;$01E330	|
	LSR A						;$01E332	|
	CLC							;$01E333	|
	ADC $00						;$01E334	|
CODE_FL_01E336: 				;			|
	CLC							;$01E336	|
	ADC $0057					;$01E337	|
	STA $0057					;$01E33A	|
	LDA $0067					;$01E33D	|
	BEQ CODE_FL_01E34E			;$01E340	|
	EOR #$8000					;$01E342	|
	STA $0067					;$01E345	|
	BPL CODE_FL_01E34E			;$01E348	|
	JSL PlaySFX			;$01E34A	|
CODE_FL_01E34E: 				;			|
	LDA $005D					;$01E34E	|
	STA $0061					;$01E351	|
	BEQ CODE_FL_01E35C			;$01E354	|
	JSR CODE_FL_01E795			;$01E356	|
	JSR CODE_FL_01E756			;$01E359	|
CODE_FL_01E35C: 				;			|
	JMP VWF_TextLoopEntry			;$01E35C	|



CODE_FL_01E35F:					;-----------| Text command 1B - Increment text pointer by 1?
	JMP Consume_1_Param			;$01E35F	| Increment text pointer by 1 and return back to the VWF loop?



CODE_FL_01E362:					;-----------| Text command 00 - End of text
	LDX $0083					;$01E362	|\ If not in a subtext, branch to end the message completely.
	BEQ .endOfText				;$01E365	|/
	DEX							;$01E367	|\ 
	DEX							;$01E368	||
	DEX							;$01E369	||
	STX $0083					;$01E36A	||
	LDA $0085,X					;$01E36D	|| Return to the parent text.
	STA $45						;$01E370	||
	LDA $0087,X					;$01E372	||
	STA $47						;$01E375	||
	JMP VWF_TextLoopEntry			;$01E377	|/

  .endOfText:					;```````````| Actual end of message.
	JSR CODE_FL_01E795			;$01E37A	| ?????
	JSR CODE_FL_01E756			;$01E37D	|
	INC $33C6					;$01E380	|
	JMP CODE_FL_01E6F6			;$01E383	|



CODE_FL_01E386: 				;-----------| Text command 01 - Wait $XX frames
	LDA $0069					;$01E386	|
	STA $0057					;$01E389	|
	STZ $0059					;$01E38C	|
	LDA #$0003					;$01E38F	|
	STA $0073					;$01E392	|
	STA $0075					;$01E395	|
	STA $0071					;$01E398	|
	LDA #$2001					;$01E39B	|
	STA $7F6970					;$01E39E	|
	LDX #$6970					;$01E3A2	|
	LDY #$6972					;$01E3A5	|
	LDA #$07FD					;$01E3A8	|
	PHB							;$01E3AB	|
	MVN $7F,$7F					;$01E3AC	|
	PLB							;$01E3AF	|
	LDA #$000C					;$01E3B0	|
	STA $31						;$01E3B3	|
	LDA #$0008					;$01E3B5	|
	STA $32						;$01E3B8	|
	LDA $0065					;$01E3BA	|
	AND #$000C					;$01E3BD	|
	LSR A						;$01E3C0	|
	ADC #$00E0					;$01E3C1	|
	STA $34						;$01E3C4	|
	LDA #$00CB					;$01E3C6	|
	STA $36						;$01E3C9	|
	LDA $004F					;$01E3CB	|
	ADC #$0008					;$01E3CE	|
	STA.B CameraX_TileMirror						;$01E3D1	|
	JSL WriteToDMABuffer		;$01E3D3	|
	SEP #$20					;$01E3D7	|
	LDA #$12					;$01E3D9	|
	STA $31						;$01E3DB	|
	REP #$20					;$01E3DD	|
	INC $34						;$01E3DF	|
	JSL WriteToDMABuffer		;$01E3E1	|
	LDA $3012					;$01E3E5	|
	STA $14						;$01E3E8	|
	INC A						;$01E3EA	|
	STA $18						;$01E3EB	|
	LDA #$007E					;$01E3ED	|
	STA $16						;$01E3F0	|
	STA $1A						;$01E3F2	|
	SEP #$20					;$01E3F4	|
	LDX #$0007					;$01E3F6	|
	LDY #$000E					;$01E3F9	|
CODE_FL_01E3FC:					;			|
	LDA $0065					;$01E3FC	|
	AND #$04					;$01E3FF	|
	BEQ CODE_FL_01E407			;$01E401	|
	LDA $CB00F0,X				;$01E403	|
CODE_FL_01E407:					;			|
	STA [$14],Y					;$01E407	|
	LDA $0065					;$01E409	|
	AND #$08					;$01E40C	|
	BEQ CODE_FL_01E414			;$01E40E	|
	LDA $CB00F0,X				;$01E410	|
CODE_FL_01E414:					;			|
	STA [$18],Y					;$01E414	|
	LDA $0065					;$01E416	|
	AND #$01					;$01E419	|
	BEQ CODE_FL_01E425			;$01E41B	|
	LDA [$14],Y					;$01E41D	|
	ORA $CB00E8,X				;$01E41F	|
	STA [$14],Y					;$01E423	|
CODE_FL_01E425:					;			|
	LDA $0065					;$01E425	|
	AND #$02					;$01E428	|
	BEQ CODE_FL_01E434			;$01E42A	|
	LDA [$18],Y					;$01E42C	|
	ORA $CB00E8,X				;$01E42E	|
	STA [$18],Y					;$01E432	|
CODE_FL_01E434:					;			|
	DEY							;$01E434	|
	DEY							;$01E435	|
	DEX							;$01E436	|
	BPL CODE_FL_01E3FC			;$01E437	|
	REP #$20					;$01E439	|
	LDA #$0003					;$01E43B	|
	STA $31						;$01E43E	|
	LDA #$0010					;$01E440	|
	STA $32						;$01E443	|
	LDA $3012					;$01E445	|
	STA $34						;$01E448	|
	CLC							;$01E44A	|
	ADC #$0010					;$01E44B	|
	STA $3012					;$01E44E	|
	LDA #$007E					;$01E451	|
	STA $36						;$01E454	|
	LDA $004F					;$01E456	|
	CLC							;$01E459	|
	ADC #$0010					;$01E45A	|
	STA.B CameraX_TileMirror						;$01E45D	|
	JSL WriteToDMABuffer		;$01E45F	|
	JSR CODE_FL_01E756			;$01E463	|
	JSR CODE_FL_01E737			;$01E466	|
	STZ $006F					;$01E469	|
	INC $0061					;$01E46C	|
	LDA #$0004					;$01E46F	|
	TSB $3072					;$01E472	|
	LDA #$8000					;$01E475	|
	TRB $0067					;$01E478	|
	JMP VWF_TextLoopEntry			;$01E47B	|



CODE_FL_01E47E: 					;-----------| Text command 02 - New line
	JSR CODE_FL_01E795			;$01E47E	|
	LDA $005B					;$01E481	|
	BEQ CODE_FL_01E489			;$01E484	|
	JSR CODE_FL_01E756			;$01E486	|
CODE_FL_01E489: 					;			|
	JSR CODE_FL_01E737			;$01E489	|
	LDA $0075					;$01E48C	|
	CLC							;$01E48F	|
	ADC $0051					;$01E490	|
	ADC $0051					;$01E493	|
	STA $0075					;$01E496	|
	LDA $0059					;$01E499	|
	ADC #$0010					;$01E49C	|
	STA $0059					;$01E49F	|
	LDA $0069					;$01E4A2	|
	STA $0057					;$01E4A5	|
	LDA $005B					;$01E4A8	|
	STA $0061					;$01E4AB	|
	JMP VWF_TextLoopEntry			;$01E4AE	|



CODE_FL_01E4B1: 					;-----------| Text command 03 - ???
	JSR CODE_FL_01E795			;$01E4B1	|
	LDA $005B					;$01E4B4	|
	BEQ CODE_FL_01E4BC			;$01E4B7	|
	JSR CODE_FL_01E756			;$01E4B9	|
CODE_FL_01E4BC: 					;			|
	JSR CODE_FL_01E737			;$01E4BC	|
	LDA [$45]					;$01E4BF	|
	AND #$00FF					;$01E4C1	|
	STA $0057					;$01E4C4	|
	INC $45						;$01E4C7	|
	LDA [$45]					;$01E4C9	|
	AND #$00F8					;$01E4CB	|
	STA $0059					;$01E4CE	|
	LSR A						;$01E4D1	|
	LSR A						;$01E4D2	|
	LSR A						;$01E4D3	|
	XBA							;$01E4D4	|
	ORA $0051					;$01E4D5	|
	STA HW_WRMPYA					;$01E4D8	|
	LDA $0073					;$01E4DB	|
	ADC HW_RDMPY					;$01E4DE	|
	CMP $0055					;$01E4E1	|
	BCC CODE_FL_01E4EB			;$01E4E4	|
	SBC $0055					;$01E4E6	|
	INC A						;$01E4E9	|
	INC A						;$01E4EA	|
CODE_FL_01E4EB:					;			|
	STA $0075					;$01E4EB	|
	JMP Consume_1_Param			;$01E4EE	|



CODE_FL_01E4F1:					;-----------| Text command 05 - Set character width. If argument is FF, uses a dynamic width?
	LDA [$45]					;$01E4F1	|
	AND #$00FF					;$01E4F3	|
	CMP #$00FF					;$01E4F6	|
	BNE CODE_FL_01E4FE			;$01E4F9	|
	LDA #$FFFF					;$01E4FB	|
CODE_FL_01E4FE:					;			|
	STA $0063					;$01E4FE	|
	JMP Consume_1_Param			;$01E501	|



CODE_FL_01E504:					;-----------| Text command 06 - ???
	LDA [$45]					;$01E504	|
	AND #$00FF					;$01E506	|
	STA $005B					;$01E509	|
	INC $45						;$01E50C	|
	LDA [$45]					;$01E50E	|
	AND #$00FF					;$01E510	|
	STA $005D					;$01E513	|
	JMP Consume_1_Param			;$01E516	|



CODE_FL_01E519:					;-----------| Text command 07 - ???
	LDA [$45]					;$01E519	|
	STA $005F					;$01E51B	|
	JMP Consume_2_Params			;$01E51E	|



CODE_FL_01E521:					;-----------| Text command 08 - Change text foreground/background color.
	SEP #$20					;$01E521	|
	LDA [$45]					;$01E523	|\ Write the next byte directly to the text FG/BG color.
	STA $0065					;$01E525	|/
	REP #$20					;$01E528	|
	JMP Consume_1_Param			;$01E529	|



CODE_FL_01E52D:					;-----------| Text command 09 - ???
	SEP #$20					;$01E52D	|
	LDA [$45]					;$01E52F	|
	ASL A						;$01E531	|
	STA $00						;$01E532	|
	LDA $0066					;$01E534	|
	AND #$80					;$01E537	|
	ORA $00						;$01E539	|
	STA $0066					;$01E53B	|
	REP #$20					;$01E53E	|
	JMP Consume_1_Param			;$01E540	|



CODE_FL_01E543:					;-----------| Text command 0A - ???
	LDA #$0080					;$01E543	|
	TRB $0066					;$01E546	|
	JMP VWF_TextLoopEntry			;$01E549	|

CODE_FL_01E54C:					;-----------| Text command 0B - ???
	LDA #$0080					;$01E54C	|
	TSB $0066					;$01E54F	|
	JMP VWF_TextLoopEntry			;$01E552	|



CODE_FL_01E555:					;-----------| Text command 0C - ???
	JSR CODE_FL_01E795			;$01E555	|
	JSR CODE_FL_01E756			;$01E558	|
	LDA [$45]					;$01E55B	|
	BIT $32C4					;$01E55D	|
	BNE CODE_FL_01E56C			;$01E560	|
	BIT $32C6					;$01E562	|
	BNE CODE_FL_01E56C			;$01E565	|
	DEC $45						;$01E567	|
	JMP CODE_FL_01E6F6			;$01E569	|

CODE_FL_01E56C: 
	JMP Consume_2_Params			;$01E56C	|



CODE_FL_01E56F:					;-----------| Text command 0D - ???
	JSR CODE_FL_01E795			;$01E56F	|
	JSR CODE_FL_01E756			;$01E572	|
	LDA [$45]					;$01E575	|
	AND #$00FF					;$01E577	|
	STA $0061					;$01E57A	|
	INC $45						;$01E57D	|
	LDA #$8000					;$01E57F	|
	TRB $0067					;$01E582	|
	JMP CODE_FL_01E6F6			;$01E585	|



CODE_FL_01E588:					;-----------| Text command 0E - Use data from pointer $ZZYYXX
	LDX $0083					;$01E588	|\ 
	LDA $45						;$01E58B	||
	CLC							;$01E58D	||
	ADC #$0003					;$01E58E	|| Write return address into the 24-bit pointer stack.
	STA $0085,X					;$01E591	||
	LDA $47						;$01E594	||
	STA $0087,X					;$01E596	|/
	INX							;$01E599	|\ 
	INX							;$01E59A	|| Increase index for next pointer.
	INX							;$01E59B	||
	STX $0083					;$01E59C	|/
	LDY #$0002					;$01E59F	|
	LDA [$45],Y					;$01E5A2	|\ 
	TAY							;$01E5A4	||
	LDA [$45]					;$01E5A5	|| Fetch next three bytes as the return address.
	STA $45						;$01E5A7	||
	STY $47						;$01E5A9	|/
	JMP VWF_TextLoopEntry			;$01E5AB	|



CODE_FL_01E5AE:					;-----------| Text command 0F - ???
	LDA [$45]					;$01E5AE	|
	STA $14						;$01E5B0	|
	LDY #$0002					;$01E5B2	|
	LDA [$45],Y					;$01E5B5	|
	STA $16						;$01E5B7	|
	LDA [$14]					;$01E5B9	|
	STA $00						;$01E5BB	|
	LDA [$14],Y					;$01E5BD	|
	STA $02						;$01E5BF	|
	LDX $0083					;$01E5C1	|
	LDA $45						;$01E5C4	|
	CLC							;$01E5C6	|
	ADC #$0003					;$01E5C7	|
	STA $0085,X					;$01E5CA	|
	LDA $47						;$01E5CD	|
	STA $0087,X					;$01E5CF	|
	INX							;$01E5D2	|
	INX							;$01E5D3	|
	INX							;$01E5D4	|
	STX $0083					;$01E5D5	|
	SEP #$10					;$01E5D8	|
	LDA #$0077					;$01E5DA	|
	STA $45						;$01E5DD	|
	STA $14						;$01E5DF	|
	LDA #$0000					;$01E5E1	|
	STA $47						;$01E5E4	|
	STA $16						;$01E5E6	|
	LDX #$10					;$01E5E8	|
CODE_FL_01E5EA:					;			|
	LDY #$FF					;$01E5EA	|
CODE_FL_01E5EC:					;			|
	INY							;$01E5EC	|
	LDA $00						;$01E5ED	|
	SEC							;$01E5EF	|
	SBC.l DATA_01E659,X			;$01E5F0	|
	STA $00						;$01E5F4	|
	LDA $02						;$01E5F6	|
	SBC.l DATA_01E66B,X			;$01E5F8	|
	STA $02						;$01E5FC	|
	BCS CODE_FL_01E5EC			;$01E5FE	|
	LDA $00						;$01E600	|
	ADC.l DATA_01E659,X			;$01E602	|
	STA $00						;$01E606	|
	LDA $02						;$01E608	|
	ADC.l DATA_01E66B,X			;$01E60A	|
	STA $02						;$01E60E	|
	TYA							;$01E610	|
	BNE CODE_FL_01E640			;$01E611	|
	DEX							;$01E613	|
	DEX							;$01E614	|
	BPL CODE_FL_01E5EA			;$01E615	|
	BRA CODE_FL_01E64C			;$01E617	|

CODE_FL_01E619: 
	LDY #$FF					;$01E619	|
CODE_FL_01E61B:					;			|
	INY							;$01E61B	|
	LDA $00						;$01E61C	|
	SEC							;$01E61E	|
	SBC.l DATA_01E659,X			;$01E61F	|
	STA $00						;$01E623	|
	LDA $02						;$01E625	|
	SBC.l DATA_01E66B,X			;$01E627	|
	STA $02						;$01E62B	|
	BCS CODE_FL_01E61B			;$01E62D	|
	LDA $00						;$01E62F	|
	ADC.l DATA_01E659,X			;$01E631	|
	STA $00						;$01E635	|
	LDA $02						;$01E637	|
	ADC.l DATA_01E66B,X			;$01E639	|
	STA $02						;$01E63D	|
	TYA							;$01E63F	|
CODE_FL_01E640:					;			|
	CLC							;$01E640	|
	ADC #$0021					;$01E641	|
	STA [$14]					;$01E644	|
	INC $14						;$01E646	|
	DEX							;$01E648	|
	DEX							;$01E649	|
	BPL CODE_FL_01E619			;$01E64A	|
CODE_FL_01E64C:					;			|
	REP #$10					;$01E64C	|
	LDA $00						;$01E64E	|
	CLC							;$01E650	|
	ADC #$0021					;$01E651	|
	STA [$14]					;$01E654	|
	JMP VWF_TextLoopEntry			;$01E656	|

DATA_01E659:					;$01E659	| ???
	dw $000A,$0064,$03E8,$2710
	dw $86A0,$4240,$9680,$E100
	dw $CA00

DATA_01E66B:					;$01E66B	| ???
	dw $0000,$0000,$0000,$0000
	dw $0001,$000F,$0098,$05F5
	dw $3B9A



CODE_FL_01E67D:					;-----------| Text command 10 - Write 8-bit value to RAM address.
	LDA [$45]					;$01E67D	|\ 
	STA $14						;$01E67F	||
	LDY #$0002					;$01E681	|| Write the first 3 bytes to $14 as a 24-bit pointer.
	LDA [$45],Y					;$01E684	||
	STA $16						;$01E686	|/
	INY							;$01E688	|\ 
	SEP #$20					;$01E689	||
	LDA [$45],Y					;$01E68B	|| Write the next 1 byte to that pointer.
	STA [$14]					;$01E68D	||
	REP #$20					;$01E68F	|/
	JMP Consume_4_Params			;$01E691	| Increment text pointer by 4.



CODE_FL_01E694:					;-----------| Text command 11 - Write 16-bit value to RAM address.
	LDA [$45]					;$01E694	|\ 
	STA $14						;$01E696	||
	LDY #$0002					;$01E698	|| Write the first 3 bytes to $14 as a 24-bit pointer.
	LDA [$45],Y					;$01E69B	||
	STA $16						;$01E69D	|/
	INY							;$01E69F	|\ 
	LDA [$45],Y					;$01E6A0	|| Write the next 2 bytes to that pointer.
	STA [$14]					;$01E6A2	|/
	JMP Consume_5_Params			;$01E6A4	| Increment text pointer by 5.



CODE_FL_01E6A7:					;-----------| Text command 12 - Enable text cursor
	LDA #$0001					;$01E6A7	|
	TSB $006B					;$01E6AA	|
	JMP VWF_TextLoopEntry			;$01E6AD	|

CODE_FL_01E6B0:					;-----------| Text command 13 - Disable text cursor
	LDA #$0001					;$01E6B0	|
	TRB $006B					;$01E6B3	|
	JMP VWF_TextLoopEntry			;$01E6B6	|



CODE_FL_01E6B9:					;-----------| Text command 14 - Enable secondary color
	LDA #$0001					;$01E6B9	|
	STA $006D					;$01E6BC	|
	JMP VWF_TextLoopEntry			;$01E6BF	|

CODE_FL_01E6C2:					;-----------| Text command 15 - Disable secondary color
	STZ $006D					;$01E6C2	|
	JMP VWF_TextLoopEntry			;$01E6C5	|



CODE_FL_01E6C8:					;-----------| Text command 04 - ???
	LDA [$45]					;$01E6C8	|
	AND #$00FF					;$01E6CA	|
	STA $0069					;$01E6CD	|
	JMP Consume_1_Param			;$01E6D0	|

CODE_FL_01E6D3:					;-----------| Text command 1D - ???
	LDA [$45]					;$01E6D3	|
	AND #$00FF					;$01E6D5	|
	STA $0067					;$01E6D8	|
	JMP Consume_1_Param			;$01E6DB	|

CODE_FL_01E6DE:					;-----------| Text command 1E - Play song?
	LDA [$45]					;$01E6DE	|
	AND #$00FF					;$01E6E0	|
	JSL PlayMusic			;$01E6E3	|
	JMP Consume_1_Param			;$01E6E7	|

CODE_FL_01E6EA:					;-----------| Text command 1F - Play song?
	LDA [$45]					;$01E6EA	|
	AND #$00FF					;$01E6EC	|
	JSL PlaySFX			;$01E6EF	|
	JMP Consume_1_Param			;$01E6F3	|



CODE_FL_01E6F6: 				;-----------| Text subroutine to ???
	LDA $006B					;$01E6F6	|
	BEQ CODE_FL_01E736			;$01E6F9	|
	LDA $0053					;$01E6FB	|
	DEC A						;$01E6FE	|
	ASL A						;$01E6FF	|
	ASL A						;$01E700	|
	ASL A						;$01E701	|
	ASL A						;$01E702	|
	ASL A						;$01E703	|
	ADC $004D					;$01E704	|
	ADC $0051					;$01E707	|
	DEC A						;$01E70A	|
	TAX							;$01E70B	|
	LDA $006B					;$01E70C	|
	AND #$0001					;$01E70F	|
	BEQ CODE_FL_01E727			;$01E712	|
	LDA #$8000					;$01E714	|
	TSB $006B					;$01E717	|
	LDA $3094					;$01E71A	|
	AND #$0008					;$01E71D	|
	BEQ CODE_FL_01E72F			;$01E720	|
	LDA #$2002					;$01E722	|
	BRA CODE_FL_01E732			;$01E725	|

CODE_FL_01E727: 
	LDA $006B					;$01E727	|
	BPL CODE_FL_01E736			;$01E72A	|
	TRB $006B					;$01E72C	|
CODE_FL_01E72F: 				;			|
	LDA #$2001					;$01E72F	|
CODE_FL_01E732: 				;			|
	JSL WriteTile				;$01E732	|
CODE_FL_01E736: 				;			|
	RTL							;$01E736	|





CODE_FL_01E737: 				;-----------| Text subroutine to initialize the VWF text buffer with its background color.
	LDA $0065					;$01E737	|\ 
	AND #$000C					;$01E73A	|| Get the ID for the background color.
	LSR A						;$01E73D	||
	TAX							;$01E73E	|/
	LDA DATA_CB00E0,X			;$01E73F	|\ 
	STA $7F6570					;$01E743	||
	LDA #$03FD					;$01E747	|| Fill the entirety of $7F6570 through $7F696F with the color.
	LDX #$6570					;$01E74A	||
	LDY #$6572					;$01E74D	||
	PHB							;$01E750	||
	MVN $7F,$7F					;$01E751	|/
	PLB							;$01E754	|
	RTS							;$01E755	|



CODE_FL_01E756: 				;-----------| Text subroutine to ???
	LDA $0071					;$01E756	|
	BEQ CODE_FL_01E794			;$01E759	|
	LDA $0053					;$01E75B	|\ Get number of DMAs to perform.
	STA $2E						;$01E75E	|/
	LDA #$0003					;$01E760	|\ 
	STA $31						;$01E763	||
	LDA $0051					;$01E765	||
	ASL A						;$01E768	||
	STA $32						;$01E769	|| Initialize a 2-byte DMA from $7F6970.
	LDA #$6970					;$01E76B	||  Size comes from $0051.
	STA $34						;$01E76E	||  Destiantion comes from $004D.
	LDA #$007F					;$01E770	||
	STA $36						;$01E773	||
	LDA $004D					;$01E775	||
	STA.B CameraX_TileMirror						;$01E778	|/
CODE_FL_01E77A: 				;			|
	JSL WriteToDMABuffer		;$01E77A	|\ 
	LDA $34						;$01E77E	||
	CLC							;$01E780	||
	ADC #$0040					;$01E781	||
	STA $34						;$01E784	|| Perform each DMA, incrementing the source by 0x40 each time and destination by 0x20.
	LDA.B CameraX_TileMirror						;$01E786	||
	ADC #$0020					;$01E788	||
	STA.B CameraX_TileMirror						;$01E78B	||
	DEC $2E						;$01E78D	||
	BNE CODE_FL_01E77A			;$01E78F	|/
	STZ $0071					;$01E791	|
CODE_FL_01E794: 				;			|
	RTS							;$01E794	|



CODE_FL_01E795: 				;-----------| Text subroutine to ???
	LDA $006F					;$01E795	|
	BNE CODE_FL_01E79B			;$01E798	|
	RTS							;$01E79A	|

CODE_FL_01E79B: 
	LDA #$0003					;$01E79B	|\ 
	STA $31						;$01E79E	||
	LDA $3012					;$01E7A0	||
	STA $34						;$01E7A3	||
	LDA #$007E					;$01E7A5	||
	STA $36						;$01E7A8	||
	LDA $0051					;$01E7AA	|| Initialize part of a 2-byte DMA request to transfer data from the decompressed data region starting at $7E2000.
	ASL A						;$01E7AD	||  Size comes from $0051 divided by 0x10.
	ASL A						;$01E7AE	||  Destination is set further down.
	ASL A						;$01E7AF	||
	ASL A						;$01E7B0	||
	STA $00						;$01E7B1	||
	ASL A						;$01E7B3	||
	STA $32						;$01E7B4	|/
	ADC $3012					;$01E7B6	|\ Update the decompressed data pointer.
	STA $3012					;$01E7B9	|/
	LDA $00						;$01E7BC	|\ 
	LDX #$6570					;$01E7BE	||
	LDY $34						;$01E7C1	|| Transfer the data from $7F6570 to the decompressed data region.
	PHB							;$01E7C3	||
	MVN $7E,$7F					;$01E7C4	|/
	PLB							;$01E7C7	|
	LDA $34						;$01E7C8	|\ 
	CLC							;$01E7CA	||
	ADC $00						;$01E7CB	||
	TAY							;$01E7CD	|| Transfer more data from $7F6770 to the decompressed data region, immediately following the first block.
	LDA $00						;$01E7CE	||
	LDX #$6770					;$01E7D0	||
	PHB							;$01E7D3	||
	MVN $7E,$7F					;$01E7D4	|/
	PLB							;$01E7D7	|
	LDA $0075					;$01E7D8	|\ 
	ASL A						;$01E7DB	||
	ASL A						;$01E7DC	|| Set the DMA destionation based on $0075 * 8 + $004F.
	ASL A						;$01E7DD	||
	ADC $004F					;$01E7DE	||
	STA.B CameraX_TileMirror						;$01E7E1	|/
	JSL WriteToDMABuffer		;$01E7E3	|] Execute the DMA.
	LDA $0059					;$01E7E7	|\ 
	AND #$3FF8					;$01E7EA	||
	ASL A						;$01E7ED	||
	ASL A						;$01E7EE	||
	ASL A						;$01E7EF	|| $14    = 24-bit pointer to something at $7F6970 indexed by $0059
	ADC #$6970					;$01E7F0	||
	STA $14						;$01E7F3	||
	LDA #$007F					;$01E7F5	||
	STA $16						;$01E7F8	|/
	LDA $0051					;$01E7FA	|\ 
	ASL A						;$01E7FD	||
	STA $00						;$01E7FE	||
	LDY #$0000					;$01E800	||
	LDA $0075					;$01E803	||
	ORA #$2000					;$01E806	||
CODE_FL_01E809:					;			||
	STA [$14],Y					;$01E809	||
	INC A						;$01E80B	||
	INY							;$01E80C	||
	INY							;$01E80D	||
	CPY $00						;$01E80E	||
	BCC CODE_FL_01E809			;$01E810	|/
	TAY							;$01E812	|\ 
	LDA $14						;$01E813	||
	CLC							;$01E815	||
	ADC #$0040					;$01E816	||
	STA $14						;$01E819	||
	TYA							;$01E81B	||
	LDY #$0000					;$01E81C	||
CODE_FL_01E81F:					;			||
	STA [$14],Y					;$01E81F	||
	INC A						;$01E821	||
	INY							;$01E822	||
	INY							;$01E823	||
	CPY $00						;$01E824	||
	BCC CODE_FL_01E81F			;$01E826	|/
	STZ $006F					;$01E828	|
	INC $0071					;$01E82B	|
	RTS							;$01E82E	|



CODE_FL_01E82F:					;-----------|
	LDA $0053					;$01E82F	|
	STA $2E						;$01E832	|
	LDA #$000C					;$01E834	|\ 
	STA $31						;$01E837	||
	LDA $0051					;$01E839	||
	STA $32						;$01E83C	|| Set up a 1-byte fixed (HW_VMDATA) DMA
	LDA #$E860					;$01E83E	||  from $01E860 to the destination in $4D
	STA $34						;$01E841	||  with a size from $51.
	LDA #$0001					;$01E843	||
	STA $36						;$01E846	||
	LDA $004D					;$01E848	||
	STA.B CameraX_TileMirror						;$01E84B	|/
CODE_FL_01E84D:					;			|
	JSL WriteToDMABuffer		;$01E84D	|\ 
	LDA.B CameraX_TileMirror						;$01E851	||
	ADC #$0020					;$01E853	||
	STA.B CameraX_TileMirror						;$01E856	||
	DEC $2E						;$01E858	||
	BNE CODE_FL_01E84D			;$01E85A	|/
	STZ $006B					;$01E85C	|
	RTL							;$01E85F	|

DATA_01E860:					;$01E860	| Used for a 1-byte fixed transfer at $01E834.
	db $00



DATA_01E861:					;$01E861	|
	db $08,$08,$08,$08,$08,$08,$08,$08
	db $08,$08,$03,$03,$03,$03,$03,$08
	db $08,$02,$03,$09,$05,$05,$05,$03
	db $0A,$0C,$04,$04,$06,$06,$08,$0B
	db $03,$0A,$0C,$0C,$0C,$0C,$0C,$0A
	db $0B,$06,$06,$09,$0B,$0A,$0A,$0A
	db $0A,$0A,$0A,$0A,$03,$09,$0A,$0A
	db $0B,$0A,$0A,$0A,$0C,$0A,$0A,$0B
	db $0A,$0B,$0D,$0B,$0B,$0B,$09,$09
	db $08,$09,$09,$07,$09,$08,$03,$05
	db $08,$03,$0B,$08,$09,$09,$09,$07
	db $08,$07,$08,$09,$0B,$09,$09,$08

DATA_01E8C1:					;$01E8C1	|
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$02,$02,$02,$02,$02,$02
	db $02,$05,$02,$00,$05,$02,$01,$01
	db $00,$01,$06,$02,$03,$03,$02,$00
	db $04,$00,$00,$00,$00,$00,$00,$01
	db $00,$01,$02,$01,$00,$00,$00,$00
	db $00,$00,$00,$00,$04,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$04,$00
	db $00,$04,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00





;  ///////////////////////////////////////////////////////////////////////////////////
;  /////   Rest of this bank handles the status bar.   ///////////////////////////////
;  ///////////////////////////////////////////////////////////////////////////////////

SetupStatusBar_L: 				;-----------| Routine to run setup for the status bar.
	JSR SetupStatusBar			;$01E921	|
	RTL							;$01E924	|

SetupStatusBar: 
	LDA $0500					;$01E925	|\ Copy the back area color? Although $1517 is unused...? Maybe.
	STA $1517					;$01E928	|/
	LDA #$0200					;$01E92B	|\ Set main/sub screen designation for the status bar.
	STA $7A27					;$01E92E	|/
	LDA $32EA					;$01E931	|\ 
	ASL A						;$01E934	||
	ADC $32EA					;$01E935	||
	TAX							;$01E938	||
	STX $2A						;$01E939	|| Get the base palette for the current subgame's status bar.
	LDA.l DATA_01FD86+2,X		;$01E93B	||  Transfers 48 colors from the pointer to $30-$7F.
	TAY							;$01E93F	||
	LDA.l DATA_01FD86,X			;$01E940	||
	TYX							;$01E944	||
	LDY #$3040					;$01E945	||
	JSL WriteStatusPal			;$01E948	|/
	PEA $007E					;$01E94C	|
	PLB							;$01E94F	|
	LDX $2A						;$01E950	|\ 
	CPX #$0006					;$01E952	||
	BNE CODE_FL_01E965			;$01E955	||
	LDA $007B2D					;$01E957	||
	BNE CODE_FL_01E965			;$01E95B	||
	LDA #$00E7					;$01E95D	|| Get the status bar GFX for the current subgame
	LDX #$A1F2					;$01E960	||  from the pointer table at $01FDA7,
	BRA CODE_FL_01E970			;$01E963	|| unless in the solo mode of Gourmet Race,
CODE_FL_01E965: 				;			||  in which case just use $E7A1F2.
	LDA.l DATA_01FDA7+2,X		;$01E965	||
	TAY							;$01E969	|| Decompress that data to $7E2000.
	LDA.l DATA_01FDA7,X			;$01E96A	||
	TAX							;$01E96E	||
	TYA							;$01E96F	|| 
CODE_FL_01E970: 				;			||
	LDY #$2000					;$01E970	||
	JSL DecompressData			;$01E973	|/
	PLB							;$01E977	|
	LDA #$FF54					;$01E978	|\ Load the DMA table at $01FF54.
	LDX #$0001					;$01E97B	|| Uploads the data decompressed above, and clears out 0x280 bytes just before it.
	JSL LoadDMATable			;$01E97E	|/
	LDA.W #IRQ_StatusBar		;$01E982	|\ 
	STA IRQ_Routine_Pointer		;$01E985	||
	SEP #$30					;$01E988	|| Set the IRQ routine to $01EA1F.
	LDA.B #IRQ_StatusBar>>16	;$01E98A	||
	STA IRQ_Routine_Pointer+2	;$01E98C	|/
	LDA #$01					;$01E98F	|\ Enable HDMA on channel 1.
	TSB $3092					;$01E991	|/
	LDX #$A8					;$01E994	|\\ Scanline to fire IRQ at.
	STX HW_VTIME				;$01E996	|/
	LDA #$20					;$01E999	|\ Enable IRQ.
	TSB $3091					;$01E99B	|/
	REP #$30					;$01E99E	|
	STZ BossHP					;$01E9A0	|
	STZ $7A2D					;$01E9A3	|
	STZ $7A2F					;$01E9A6	|
	STZ $7A29					;$01E9A9	|
	STZ $7A2B					;$01E9AC	|
	STZ $7A25					;$01E9AF	|
	STZ $00B1					;$01E9B2	|
	STZ $7A1F					;$01E9B5	|
	STZ $00BF					;$01E9B8	|
	LDA #$FFFF					;$01E9BB	|
	STA $00B3					;$01E9BE	|
	STA HUD_BossHP				;$01E9C1	|
	STA $00B5					;$01E9C4	|
	STA $00B7					;$01E9C7	|
	STA $00B9					;$01E9CA	|
	STA $00BB					;$01E9CD	|
	STA $00BD					;$01E9D0	|
	STZ $00C1					;$01E9D3	|
	STZ $00CF					;$01E9D6	|
	STZ $00D1					;$01E9D9	|
	STZ $00D3					;$01E9DC	|
	STZ $00D5					;$01E9DF	|
	STZ $00D7					;$01E9E2	|
	STZ $00D9					;$01E9E5	|
	STZ $00DB					;$01E9E8	|
	STZ $00DD					;$01E9EB	|
	STZ $00DF					;$01E9EE	|
	STZ $00E1					;$01E9F1	|
	STZ $00E3					;$01E9F4	|
	STZ $00E5					;$01E9F7	|
	LDA $157B					;$01E9FA	|
	STA $00C3					;$01E9FD	|
	LDA $157D					;$01EA00	|
	STA $00C9					;$01EA03	|
	LDA $159B					;$01EA06	|
	STA $00C5					;$01EA09	|
	LDA $159D					;$01EA0C	|
	STA $00CB					;$01EA0F	|
	LDA $15BB					;$01EA12	|
	STA $00C7					;$01EA15	|
	LDA $15BD					;$01EA18	|
	STA $00CD					;$01EA1B	|
	RTS							;$01EA1E	|


IRQ_StatusBar: 					;-----------| IRQ routine for the in-game HUD.
	SEP #$20					;$01EA1F	|
	PHA							;$01EA21	|
	PHX							;$01EA22	|
	LDX #$151F					;$01EA23	|\ 
	STX $4322					;$01EA26	|| Run a DMA on channel 2 for 0xFC bytes (0x7E colors) from $151F.
	LDX #$00FC					;$01EA29	||  (channel 2 is fixed for writes to CGRAM starting at color $04)
	STX $4325					;$01EA2C	|| Actually, it should probably only be 0xF8 bytes; the remaining two end up on $80/$81...
	LDA #$04					;$01EA2F	||
	STA HW_MDMAEN				;$01EA31	|/
	LDA $7A28					;$01EA34	|\ Set main screen designation.
	STA HW_TM					;$01EA37	|/
	LDA #$50					;$01EA3A	|\ Set BG2 GFX address to $5000.
	STA HW_BG12NBA				;$01EA3C	|/
	LDA #$58					;$01EA3F	|\ Set BG2 tilemap address to $5800 and size to 256x256.
	STA HW_BG2SC				;$01EA41	|/
	STZ HW_BG2HOFS				;$01EA44	|\ Clear horizontal scroll.
	STZ HW_BG2HOFS				;$01EA47	|/
	LDA #$56					;$01EA4A	|\ 
	STA HW_BG2VOFS				;$01EA4C	|| Set vertical scroll.
	STZ HW_BG2VOFS				;$01EA4F	|/
	STZ HW_MOSAIC				;$01EA52	|\ Disable mosaic and color math effects.
	STZ HW_CGADSUB				;$01EA55	|/
	STZ HW_TS					;$01EA58	|\ Turn off subscreen.
	STZ HW_TMW					;$01EA5B	|/
	LDA #$09					;$01EA5E	|\ Set as mode 1 with BG3 priority.
	STA HW_BGMODE				;$01EA60	|/
	PLX							;$01EA63	|
	PLA							;$01EA64	|
	JML IRQ_SNES_noIRQ			;$01EA65	| Return IRQ.


HandleStatusBar_L: 				;-----------| Status bar handler routine.
	JSR HandleStatusBar			;$01EA69	|
	RTL							;$01EA6C	|

HandleStatusBar: 
	LDA HUD_BossHP				;$01EA6D	|\ 
	BPL CODE_FL_01EA75			;$01EA70	|| If a boss isn't active
	STZ $7A1F					;$01EA72	|/
CODE_FL_01EA75: 				;			|
	LDA $32EA					;$01EA75	|\ 
	ASL A						;$01EA78	|| Jump to the appropriate game routine.
	TAX							;$01EA79	||
	JMP (CODE_FL_01EA7D,X)		;$01EA7A	|/


CODE_FL_01EA7D: 				;$01EA7D	| Subgame status bar routine pointers.
	dw StatusBar_SpringBreeze	; 0 - Spring Breeze
	dw StatusBar_DynaBlade		; 1 - Dyna Blade
	dw StatusBar_GourmetRace	; 2 - Gourmet Race
	dw StatusBar_GreatCave		; 3 - The Great Cave Offensive
	dw StatusBar_MetaKnight		; 4 - Revenge of Meta-Knight
	dw StatusBar_MilkyWay		; 5 - Milky Way Wishes
	dw StatusBar_MiscGame		; 6 - The Arena
	dw StatusBar_MiscGame		; 7 - Sound Test
	dw StatusBar_MiscGame		; 8 - Guide / Minigame
	dw StatusBar_MiscGame		; 9 - Unused
	dw StatusBar_MiscGame		; A - Unused


StatusBar_SpringBreeze: 		;-----------| Status bar routine for Spring Breeze.
	JSR CODE_FL_01F81F			;$01EA93	|
	JMP (CODE_FL_01EA99,X)		;$01EA96	|

CODE_FL_01EA99: 				;$01EA99	| Pointers to status bar routines for Spring Breeze.
	dw CODE_FL_01EAA1			; 0 - No partner, no boss
	dw CODE_FL_01EB29			; 1 - Has partner, no boss
	dw CODE_FL_01EAE5			; 2 - No partner, has boss
	dw CODE_FL_01EB84			; 3 - Has partner, has boss



CODE_FL_01EAA1: 				;-----------| Spring Breeze status bar routine 0 - No partner, no boss
	CPX $00B3					;$01EAA1	|\ Skip if the status bar has already been initialized.
	BEQ CODE_FL_01EAC2			;$01EAA4	|/
	STX $00B3					;$01EAA6	|
	LDA #$EBDF					;$01EAA9	|\ Load the DMA table at $01EBDF.
	LDX #$0001					;$01EAAC	|| Presumably, this loads the basic tilemap.
	JSL LoadDMATable			;$01EAAF	|/
	LDA #$00EB					;$01EAB3	|\ 
	LDX #$110D					;$01EAB6	|| Load the base tilemap from $EB110D.
	JSR LoadStatusBarBase		;$01EAB9	|/
	LDA #$8000					;$01EABC	|
	TSB $00B5					;$01EABF	|
CODE_FL_01EAC2: 				;			|
	LDX #$166E					;$01EAC2	|\ Write the score.
	JSR CODE_FL_01F947			;$01EAC5	|/
	LDX #$16AF					;$01EAC8	|\ Write the life count.
	JSR CODE_FL_01F8B7			;$01EACB	|/
	JSR CODE_FL_01FBD0			;$01EACE	|
	BCC CODE_FL_01EADF			;$01EAD1	|
	LDX #$165E					;$01EAD3	|\ 
	JSR WriteHPBar				;$01EAD6	|| Update Kirby's HP bar.
	LDX #$167E					;$01EAD9	||
	JSR WriteHPBar				;$01EADC	|/
CODE_FL_01EADF: 				;			|
	JSR CODE_FN_01FA25			;$01EADF	|
	JMP CODE_JP_01F706			;$01EAE2	|



CODE_FL_01EAE5: 				;-----------| Spring Breeze status bar routine 2 - No partner, has boss
	CPX $00B3					;$01EAE5	|\ Skip if the status bar has already been initialized.
	BEQ CODE_FL_01EB06			;$01EAE8	|/
	STX $00B3					;$01EAEA	|
	LDA #$EBE8					;$01EAED	|\ 
	LDX #$0001					;$01EAF0	|| Load the DMA table at $01EBE8.
	JSL LoadDMATable			;$01EAF3	|/
	LDA #$00EB					;$01EAF7	|\ 
	LDX #$110D					;$01EAFA	|| Load the base tilemap from $EB110D.
	JSR LoadStatusBarBase		;$01EAFD	|/
	LDA #$8000					;$01EB00	|
	TSB $7A1F					;$01EB03	|
CODE_FL_01EB06: 				;			|
	LDX #$166E					;$01EB06	|\ Write the boss's HP bar.
	JSR CODE_FL_01F87B			;$01EB09	|/
	LDX #$16B0					;$01EB0C	|\ Write the life count.
	JSR CODE_FL_01F8B7			;$01EB0F	|/
	JSR CODE_FL_01FBD0			;$01EB12	|
	BCC CODE_01EB23				;$01EB15	|
	LDX #$165E					;$01EB17	|\ 
	JSR WriteHPBar				;$01EB1A	|| Update Kirby's HP bar.
	LDX #$167E					;$01EB1D	||
	JSR WriteHPBar				;$01EB20	|/

CODE_01EB23:
	JSR.W CODE_FN_01FA25          ;$01EB23	|
	JMP.W CODE_JP_01F706          ;$01EB26	|

CODE_FL_01EB29: 				;-----------| Spring Breeze status bar routine 1 - Has partner, no boss
	CPX $00B3					;$01EB29	|\ Skip if the status bar has already been initialized.
	BEQ CODE_FL_01EB4D			;$01EB2C	|/
	STX $00B3					;$01EB2E	|
	LDA #$EBDF					;$01EB31	|\ 
	LDX #$0001					;$01EB34	|| Load the DMA table at $01EBDF.
	JSL LoadDMATable			;$01EB37	|/
	LDA #$00EB					;$01EB3B	|\ 
	LDX #$BBBD					;$01EB3E	|| Load the base tilemap from $EBBBBD.
	JSR LoadStatusBarBase		;$01EB41	|/
	STA $00BD					;$01EB44	|
	LDA #$8000					;$01EB47	|
	TSB $00B5					;$01EB4A	|
CODE_FL_01EB4D: 				;			|
	LDX #$16C9					;$01EB4D	|\ Write the score.
	JSR CODE_FL_01F947			;$01EB50	|/
	LDX #$16C0					;$01EB53	|\ Write the life count.
	JSR CODE_FL_01F8B7			;$01EB56	|/
	JSR CODE_FL_01FBD0			;$01EB59	|
	BCC CODE_FL_01EB6A			;$01EB5C	|
	LDX #$165E					;$01EB5E	|\ 
	JSR WriteHPBar				;$01EB61	|| Update Kirby's HP bar.
	LDX #$167E					;$01EB64	||
	JSR WriteHPBar				;$01EB67	|/
CODE_FL_01EB6A: 				;			|
	JSR CODE_FL_01FC62			;$01EB6A	|
	BCC CODE_FL_01EB7B			;$01EB6D	|
	LDX #$1669					;$01EB6F	|\ 
	JSR WriteHPBar2				;$01EB72	|| Update the partner's HP bar.
	LDX #$1689					;$01EB75	||
	JSR WriteHPBar2				;$01EB78	|/
CODE_FL_01EB7B: 				;			|
	JSR CODE_FN_01FA25			;$01EB7B	|
	JSR CODE_FL_01FAF3			;$01EB7E	|
	JMP CODE_JP_01F706			;$01EB81	|



CODE_FL_01EB84: 				;-----------| Spring Breeze status bar routine 3 - Has partner, has boss
	CPX $00B3					;$01EB84	|\ Skip if the status bar has already been initialized.
	BEQ CODE_FL_01EBA8			;$01EB87	|/
	STX $00B3					;$01EB89	|
	LDA #$EBE8					;$01EB8C	|\ 
	LDX #$0001					;$01EB8F	|| Load the DMA table at $01EBE8.
	JSL LoadDMATable			;$01EB92	|/
	LDA #$00EB					;$01EB96	|\ 
	LDX #$BBBD					;$01EB99	|| Load the base tilemap from $EBBBBD.
	JSR LoadStatusBarBase		;$01EB9C	|/
	STA $00BD					;$01EB9F	|
	LDA #$8000					;$01EBA2	|
	TSB $7A1F					;$01EBA5	|
CODE_FL_01EBA8: 				;			|
	LDX #$16C9					;$01EBA8	|\ Write the boss's HP bar.
	JSR CODE_FL_01F87B			;$01EBAB	|/
	LDX #$16C0					;$01EBAE	|\ Write the life count.
	JSR CODE_FL_01F8B7			;$01EBB1	|/
	JSR CODE_FL_01FBD0			;$01EBB4	|
	BCC CODE_FL_01EBC5			;$01EBB7	|
	LDX #$165E					;$01EBB9	|\ 
	JSR WriteHPBar				;$01EBBC	|| Update Kirby's HP bar.
	LDX #$167E					;$01EBBF	||
	JSR WriteHPBar				;$01EBC2	|/
CODE_FL_01EBC5: 				;			|
	JSR CODE_FL_01FC62			;$01EBC5	|
	BCC CODE_FL_01EBD6			;$01EBC8	|
	LDX #$1669					;$01EBCA	|\ 
	JSR WriteHPBar2				;$01EBCD	|| Update the partner's HP bar.
	LDX #$1689					;$01EBD0	||
	JSR WriteHPBar2				;$01EBD3	|/
CODE_FL_01EBD6: 				;			|
	JSR CODE_FN_01FA25			;$01EBD6	|
	JSR CODE_FL_01FAF3			;$01EBD9	|
	JMP CODE_JP_01F706			;$01EBDC	|


CODE_FL_01EBDF: 				;$01EBDF	| DMA table used by the above routines.
	db $03 : dw $00A0 : dl $ED6540 : dw $5E40		; 2-byte DMA; 0xA0 bytes from $ED6540 to $5E40.
	db $FF

CODE_FL_01EBE8: 				;$01EBE8	| DMA table used by the above routines.
	db $03 : dw $00A0 : dl $ED64A0 : dw $5E40		; 2-byte DMA; 0xA0 bytes from $ED65A0 to $5E40.
	db $FF


StatusBar_DynaBlade: 			;-----------| Status bar routine for Dyna Blade.
	JSR CODE_FL_01F81F			;$01EBF1	|\ Jump to the appropriate status bar routine.
	JMP (CODE_FL_01EBF7,X)		;$01EBF4	|/

CODE_FL_01EBF7: 				;$01EBF7	| Pointers to status bar routines for Dyna Blade.
	dw CODE_FL_01EBFF			; 0 - No partner, no boss
	dw CODE_FL_01EC8F			; 1 - Has partner, no boss
	dw CODE_FL_01EC47			; 2 - No partner, has boss
	dw CODE_FL_01ECE8			; 3 - Has partner, has boss


CODE_FL_01EBFF: 				;-----------| Dyna Blade status bar routine 0 - No partner, no boss
	CPX $00B3					;$01EBFF	|\ Skip if the status bar has already been initialized.
	BEQ CODE_FL_01EC2A			;$01EC02	|/
	STX $00B3					;$01EC04	|
	LDX #$0001					;$01EC07	|\ 
	LDA #$ED41					;$01EC0A	|| Load the DMA table at $01ED41.
	JSL LoadDMATable			;$01EC0D	|/
	LDX #$0001					;$01EC11	|\ 
	LDA #$ED5C					;$01EC14	|| Load the DMA table at $01ED5C.
	JSL LoadDMATable			;$01EC17	|/
	LDA #$00EB					;$01EC1B	|\ 
	LDX #$CAAF					;$01EC1E	|| Load the base tilemap from $EBCAAF.
	JSR LoadStatusBarBase		;$01EC21	|/
	LDA #$8000					;$01EC24	|
	TSB $00B5					;$01EC27	|
CODE_FL_01EC2A: 				;			|
	LDX #$166B					;$01EC2A	|\ Write the score.
	JSR CODE_FL_01F947			;$01EC2D	|/
	LDX #$16AB					;$01EC30	|\ Write the life count.
	JSR CODE_FL_01F8B7			;$01EC33	|/
	JSR CODE_FL_01FBD0			;$01EC36	|
	BCC CODE_FL_01EC41			;$01EC39	|
	LDX #$165E					;$01EC3B	|\ Update Kirby's HP bar.
	JSR WriteHPBar				;$01EC3E	|/
CODE_FL_01EC41: 				;			|
	JSR CODE_FN_01FA25			;$01EC41	|
	JMP CODE_JP_01F706			;$01EC44	|



CODE_FL_01EC47: 				;-----------| Dyna Blade status bar routine 2 - No partner, has boss
	CPX $00B3					;$01EC47	|\ Skip if the status bar has already been initialized.
	BEQ CODE_FL_01EC72			;$01EC4A	|/
	STX $00B3					;$01EC4C	|
	LDX #$0001					;$01EC4F	|\ 
	LDA #$ED41					;$01EC52	|| Load the DMA table at $01ED41.
	JSL LoadDMATable			;$01EC55	|/
	LDX #$0001					;$01EC59	|\ 
	LDA #$ED53					;$01EC5C	|| Load the DMA table at $01ED53.
	JSL LoadDMATable			;$01EC5F	|/
	LDA #$00EB					;$01EC63	|\ 
	LDX #$CAAF					;$01EC66	|| Load the base tilemap from $EBCAAF.
	JSR LoadStatusBarBase		;$01EC69	|/
	LDA #$8000					;$01EC6C	|
	TSB $7A1F					;$01EC6F	|
CODE_FL_01EC72: 				;			|
	LDX #$166B					;$01EC72	|\ Write the boss's HP bar.
	JSR CODE_FL_01F87B			;$01EC75	|/
	LDX #$16AB					;$01EC78	|\ Write the life count.
	JSR CODE_FL_01F8B7			;$01EC7B	|/
	JSR CODE_FL_01FBD0			;$01EC7E	|
	BCC CODE_FL_01EC89			;$01EC81	|
	LDX #$165E					;$01EC83	|\ Update Kirby's HP bar.
	JSR WriteHPBar				;$01EC86	|/
CODE_FL_01EC89: 				;			|
	JSR CODE_FN_01FA25			;$01EC89	|
	JMP CODE_JP_01F706			;$01EC8C	|



CODE_FL_01EC8F: 				;-----------| Dyna Blade status bar routine 1 - Has partner, no boss
	CPX $00B3					;$01EC8F	|\ Skip if the status bar has already been initialized.
	BEQ CODE_FL_01ECBD			;$01EC92	|/
	STX $00B3					;$01EC94	|
	LDX #$0001					;$01EC97	|\ 
	LDA #$ED4A					;$01EC9A	|| Load the DMA table at $01ED4A.
	JSL LoadDMATable			;$01EC9D	|/
	LDX #$0001					;$01ECA1	|\ 
	LDA #$ED5C					;$01ECA4	|| Load the DMA table at $01ED5C.
	JSL LoadDMATable			;$01ECA7	|/
	LDA #$00EB					;$01ECAB	|\ 
	LDX #$09B5					;$01ECAE	|| Load the base tilemap from $EB09B5.
	JSR LoadStatusBarBase		;$01ECB1	|/
	STA $00BD					;$01ECB4	|
	LDA #$8000					;$01ECB7	|
	TSB $00B5					;$01ECBA	|
CODE_FL_01ECBD: 				;			|
	LDX #$16AF					;$01ECBD	|\ Write the score.
	JSR CODE_FL_01F947			;$01ECC0	|/
	LDX #$16A1					;$01ECC3	|\ Write the life count.
	JSR CODE_FL_01F8B7			;$01ECC6	|/
	JSR CODE_FL_01FBD0			;$01ECC9	|
	BCC CODE_FL_01ECD4			;$01ECCC	|
	LDX #$165E					;$01ECCE	|\ Update Kirby's HP bar.
	JSR WriteHPBar				;$01ECD1	|/
CODE_FL_01ECD4: 				;			|
	JSR CODE_FL_01FC62			;$01ECD4	|
	BCC CODE_FL_01ECDF			;$01ECD7	|
	LDX #$166E					;$01ECD9	|\ Update the partner's HP bar.
	JSR WriteHPBar				;$01ECDC	|/
CODE_FL_01ECDF: 				;			|
	JSR CODE_FN_01FA25			;$01ECDF	|
	JSR CODE_FL_01FAF3			;$01ECE2	|
	JMP CODE_JP_01F706			;$01ECE5	|



CODE_FL_01ECE8: 				;-----------| Dyna Blade status bar routine 3 - Has partner, has boss
	CPX $00B3					;$01ECE8	|\ Skip if the status bar has already been initialized.
	BEQ CODE_FL_01ED16			;$01ECEB	|/
	STX $00B3					;$01ECED	|
	LDX #$0001					;$01ECF0	|\ 
	LDA #$ED4A					;$01ECF3	|| Load the DMA table at $01ED4A.
	JSL LoadDMATable			;$01ECF6	|/
	LDX #$0001					;$01ECFA	|\ 
	LDA #$ED53					;$01ECFD	|| Load the DMA table at $01ED53.
	JSL LoadDMATable			;$01ED00	|/
	LDA #$00EB					;$01ED04	|\ 
	LDX #$09B5					;$01ED07	|| Load the base tilemap from $EB09B5.
	JSR LoadStatusBarBase		;$01ED0A	|/
	STA $00BD					;$01ED0D	|
	LDA #$8000					;$01ED10	|
	TSB $7A1F					;$01ED13	|
CODE_FL_01ED16: 				;			|
	LDX #$16AF					;$01ED16	|\ Write the boss's HP bar.
	JSR CODE_FL_01F87B			;$01ED19	|/
	LDX #$16A1					;$01ED1C	|\ Write the life count.
	JSR CODE_FL_01F8B7			;$01ED1F	|/
	JSR CODE_FL_01FBD0			;$01ED22	|
	BCC CODE_FL_01ED2D			;$01ED25	|
	LDX #$165E					;$01ED27	|\ Update Kirby's HP bar.
	JSR WriteHPBar				;$01ED2A	|/
CODE_FL_01ED2D: 				;			|
	JSR CODE_FL_01FC62			;$01ED2D	|
	BCC CODE_FL_01ED38			;$01ED30	|
	LDX #$166E					;$01ED32	|\ Update the partner's HP bar.
	JSR WriteHPBar				;$01ED35	|/
CODE_FL_01ED38: 				;			|
	JSR CODE_FN_01FA25			;$01ED38	|
	JSR CODE_FL_01FAF3			;$01ED3B	|
	JMP CODE_JP_01F706			;$01ED3E	|


CODE_FL_01ED41:					;$01ED41	| DMA table used by the above routines.
	db $03 : dw $0080 : dl $EC48EA : dw $5E30		; 2-byte DMA; 0x80 bytes from $EC48EA to $5E30.
	db $FF

CODE_FL_01ED4A:					;$01ED4A	| DMA table used by the above routines.
	db $03 : dw $0080 : dl $EC482A : dw $5E30		; 2-byte DMA; 0x80 bytes from $EC482A to $5E30.
	db $FF

CODE_FL_01ED53:					;$01ED53	| DMA table used by the above routines.
	db $03 : dw $0040 : dl $EC47EA : dw $5E10		; 2-byte DMA; 0x40 bytes from $EC47EA to $5E10.
	db $FF

CODE_FL_01ED5C:					;$01ED5C	| DMA table used by the above routines.
	db $03 : dw $0040 : dl $EC48AA : dw $5E10		; 2-byte DMA; 0x40 bytes from $EC48AA to $5E10.
	db $FF


CODE_FL_01ED65:
	JSR CODE_FL_01EE61			;$01ED65	|
	RTL							;$01ED68	|


StatusBar_GourmetRace: 			;-----------| Status bar routine for Gourmet Race.
	LDA $00B3					;$01ED69	|
	LDY $7B2D					;$01ED6C	|
	BNE CODE_FL_01ED74			;$01ED6F	|
	JMP CODE_FL_01EEAF			;$01ED71	|

CODE_FL_01ED74: 
	LDY $6240					;$01ED74	|
	BPL CODE_FL_01EDBD			;$01ED77	|
	CMP #$0000					;$01ED79	|
	BEQ CODE_FL_01ED9A			;$01ED7C	|
	LDA #$00EA					;$01ED7E	|\ 
	LDX #$ECA5					;$01ED81	|| Load the base tilemap from $EAECA5.
	JSR LoadStatusBarBase		;$01ED84	|/
	LDA #$DD82					;$01ED87	|\ 
	LDX #$00EF					;$01ED8A	|| Transfer 15 colors from $EFDD82 to $41-$4F.
	LDY #$410F					;$01ED8D	||
	JSL WriteStatusPal			;$01ED90	|/
	LDA #$FFFF					;$01ED94	|
	STA $00C1					;$01ED97	|
CODE_FL_01ED9A: 				;			|
	LDA $7A25					;$01ED9A	|
	CMP $00C1					;$01ED9D	|
	BEQ CODE_FL_01EDB2			;$01EDA0	|
	STA $00C1					;$01EDA2	|
	ASL A						;$01EDA5	|
	TAX							;$01EDA6	|
	LDA.l DATA_01EFE7,X			;$01EDA7	|\ 
	LDX #$0001					;$01EDAB	|| Load a specified DMA table.
	JSL LoadDMATable			;$01EDAE	|/
CODE_FL_01EDB2: 				;			|
	LDA #$0000					;$01EDB2	|
	LDY #$16C5					;$01EDB5	|
	LDX #$58AE					;$01EDB8	|
	BRA CODE_FL_01EDD4			;$01EDBB	|

CODE_FL_01EDBD: 
	CMP #$0001					;$01EDBD	|
	BEQ CODE_FL_01EDCE			;$01EDC0	|
	LDA #$00EA					;$01EDC2	|\ 
	LDX #$FB31					;$01EDC5	|| Load the base tilemap from $EAFB31.
	JSR LoadStatusBarBase		;$01EDC8	|/
	LDA #$0001					;$01EDCB	|
CODE_FL_01EDCE: 				;			|
	LDY #$16CA					;$01EDCE	|
	LDX #$58B3					;$01EDD1	|
CODE_FL_01EDD4: 				;			|
	STA $00B3					;$01EDD4	|
	JSR CODE_FL_01EE5C			;$01EDD7	|
	LDA #$0009					;$01EDDA	|
	STA $31						;$01EDDD	|
	LDA #$0008					;$01EDDF	|
	STA $32						;$01EDE2	|
	STY $34						;$01EDE4	|
	LDA #$0000					;$01EDE6	|
	STA $36						;$01EDE9	|
	STX.B CameraX_TileMirror	;$01EDEB	|
	SEP #$30					;$01EDED	|
	LDA #$F2					;$01EDEF	|
	LDY #$02					;$01EDF1	|
	STA [$34],Y					;$01EDF3	|
	LDY #$05					;$01EDF5	|
	STA [$34],Y					;$01EDF7	|
	LDA $7A2F					;$01EDF9	|
	LDY #$00					;$01EDFC	|
	JSR CODE_FL_01EF80			;$01EDFE	|
	LDA $7A2E					;$01EE01	|
	LDY #$03					;$01EE04	|
	JSR CODE_FL_01EF80			;$01EE06	|
	LDA $7A2D					;$01EE09	|
	LDY #$06					;$01EE0C	|
	JSR CODE_FL_01EF80			;$01EE0E	|
	REP #$30					;$01EE11	|
	JSL WriteToDMABuffer		;$01EE13	|
	LDA $7A29					;$01EE17	|
	CMP #$0063					;$01EE1A	|
	BCC CODE_FL_01EE25			;$01EE1D	|
	LDA #$0063					;$01EE1F	|
	STA $7A29					;$01EE22	|
CODE_FL_01EE25: 				;			|
	CMP $00BB					;$01EE25	|
	BEQ CODE_FL_01EE35			;$01EE28	|
	LDX #$5D00					;$01EE2A	|
	JSR CODE_FL_01EF93			;$01EE2D	|
	BCC CODE_FL_01EE35			;$01EE30	|
	STA $00BB					;$01EE32	|
CODE_FL_01EE35: 				;			|
	LDA $7A2B					;$01EE35	|
	CMP #$0063					;$01EE38	|
	BCC CODE_FL_01EE43			;$01EE3B	|
	LDA #$0063					;$01EE3D	|
	STA $7A29					;$01EE40	|
CODE_FL_01EE43: 				;			|
	CMP $00BD					;$01EE43	|
	BEQ CODE_FL_01EE53			;$01EE46	|
	LDX #$5D80					;$01EE48	|
	JSR CODE_FL_01EF93			;$01EE4B	|
	BCC CODE_FL_01EE53			;$01EE4E	|
	STA $00BD					;$01EE50	|
CODE_FL_01EE53: 				;			|
	JSR CODE_FN_01FA25			;$01EE53	|
	JSR CODE_FL_01FAF3			;$01EE56	|
	JMP CODE_JP_01F706			;$01EE59	|



CODE_FL_01EE5C: 				;-----------| Status bar subroutine.
	LDA BossHP					;$01EE5C	|
	BEQ CODE_FL_01EEAE			;$01EE5F	|
CODE_FL_01EE61:
	SEP #$20					;$01EE61	|
	LDA $7A30					;$01EE63	|
	INC A						;$01EE66	|
	CMP #$03					;$01EE67	|
	BCC CODE_FL_01EE6D			;$01EE69	|
	LDA #$00					;$01EE6B	|
CODE_FL_01EE6D: 				;			|
	STA $7A30					;$01EE6D	|
	CMP #$00					;$01EE70	|
	BEQ CODE_FL_01EE76			;$01EE72	|
	LDA #$01					;$01EE74	|
CODE_FL_01EE76: 				;			|
	SEC							;$01EE76	|
	ADC $7A2D					;$01EE77	|
	CMP #$64					;$01EE7A	|
	BCC CODE_FL_01EE92			;$01EE7C	|
	SBC #$64					;$01EE7E	|
	PHA							;$01EE80	|
	LDA $7A2E					;$01EE81	|
	INC A						;$01EE84	|
	CMP #$3C					;$01EE85	|
	BCC CODE_FL_01EE8E			;$01EE87	|
	INC $7A2F					;$01EE89	|
	LDA #$00					;$01EE8C	|
CODE_FL_01EE8E: 				;			|
	STA $7A2E					;$01EE8E	|
	PLA							;$01EE91	|
CODE_FL_01EE92: 				;			|
	STA $7A2D					;$01EE92	|
	LDA $7A2F					;$01EE95	|
	CMP #$64					;$01EE98	|
	BCC CODE_FL_01EEAC			;$01EE9A	|
	LDA #$63					;$01EE9C	|
	STA $7A2D					;$01EE9E	|
	STA $7A2F					;$01EEA1	|
	LDA #$3B					;$01EEA4	|
	STA $7A2E					;$01EEA6	|
	STZ BossHP					;$01EEA9	|
CODE_FL_01EEAC: 				;			|
	REP #$20					;$01EEAC	|
CODE_FL_01EEAE: 				;			|
	RTS							;$01EEAE	|


CODE_FL_01EEAF: 				;-----------| Gourmet Race solo race (shows timer instead of scores).
	CMP #$0002					;$01EEAF	|
	BEQ CODE_FL_01EEC6			;$01EEB2	|
	LDA #$00EC					;$01EEB4	|\ 
	LDX #$31E6					;$01EEB7	|| Load the base tilemap from $EC31E6.
	JSR LoadStatusBarBase		;$01EEBA	|/
	LDA #$0002					;$01EEBD	|
	STA $00B3					;$01EEC0	|
	JSR CODE_FL_01EF32			;$01EEC3	|
CODE_FL_01EEC6: 				;			|
	JSR CODE_FL_01EE5C			;$01EEC6	|
	JSR CODE_FL_01EED2			;$01EEC9	| Upload the timer's tiles.
	JSR CODE_FN_01FA25			;$01EECC	|
	JMP CODE_JP_01F706			;$01EECF	|


CODE_FL_01EED2:					;-----------| Gourmet Race subroutine to upload the timer's tiles in solo mode.
	LDX #$0000					;$01EED2	|
	LDA $7A2F					;$01EED5	|\ Upload the minutes...
	JSR CODE_FL_01EEE4			;$01EED8	|/
	LDA $7A2E					;$01EEDB	|\ And the seconds...
	JSR CODE_FL_01EEE4			;$01EEDE	|/
	LDA $7A2D					;$01EEE1	| And finally the milliseconds.
CODE_FL_01EEE4: 				;			|
	SEP #$30					;$01EEE4	|\ 
	LDY #$FF					;$01EEE6	||
CODE_FL_01EEE8: 				;			||
	INY							;$01EEE8	|| Hex->Dec conversion.
	SEC							;$01EEE9	|| Tens digit stored in Y, ones in A.
	SBC #$0A					;$01EEEA	||
	BCS CODE_FL_01EEE8			;$01EEEC	||
	ADC #$0A					;$01EEEE	||
	REP #$30					;$01EEF0	||
	AND #$00FF					;$01EEF2	|/
	PHA							;$01EEF5	|
	TYA							;$01EEF6	|\ Draw tens digit...
	JSR CODE_FL_01EEFB			;$01EEF7	|/
	PLA							;$01EEFA	| Then ones.
CODE_FL_01EEFB: 				;			|
	ASL A						;$01EEFB	|\ 
	ASL A						;$01EEFC	||
	ASL A						;$01EEFD	|| Set up a 0x80 2-byte DMA.
	ASL A						;$01EEFE	|| The source is $E762D2 + A * 0x80.
	ASL A						;$01EEFF	|| The destination VRAM address is based on the current value in X;
	ASL A						;$01EF00	||  see below table.
	ASL A						;$01EF01	||
	CLC							;$01EF02	|| This is to handle the upload of the numbers for the timer;
	ADC #$62D2					;$01EF03	||  A contains the number to write.
	STA $34						;$01EF06	||
	LDA #$00E7					;$01EF08	||
	STA $36						;$01EF0B	||
	LDA #$0003					;$01EF0D	||
	STA $31						;$01EF10	||
	LDA #$0080					;$01EF12	||
	STA $32						;$01EF15	||
	LDA.l DATA_01EF26,X			;$01EF17	||
	STA.B CameraX_TileMirror	;$01EF1B	||
	PHX							;$01EF1D	||
	JSL WriteToDMABuffer		;$01EF1E	|/
	PLX							;$01EF22	|
	INX							;$01EF23	|
	INX							;$01EF24	|
	RTS							;$01EF25	|
	
DATA_01EF26:					;$01EF26	| VRAM destinations for the timer in Gourmet Race solo mode.
	dw $5D00					; Tens digit of minutes
	dw $5D40					; Ones digit of minutes
	dw $5D80					; Tens digit of seconds
	dw $5DC0					; Ones digit of seconds
	dw $5F40					; Tens digit of milliseconds
	dw $5F80					; Ones digit of milliseconds



CODE_FL_01EF32:					;-----------| Gourmet Race subroutine.
	LDA #$0009					;$01EF32	|\ 
	STA $31						;$01EF35	||
	LDA #$0008					;$01EF37	||
	STA $32						;$01EF3A	|| Write a normal 1-byte HW_VMDATA DMA
	LDA #$16C4					;$01EF3C	||  for 8 bytes from $0016C4
	STA $34						;$01EF3F	||  to VRAM address $58AD.
	LDA #$0000					;$01EF41	||
	STA $36						;$01EF44	||
	LDA #$58AD					;$01EF46	||
	STA.B CameraX_TileMirror	;$01EF49	|/
	SEP #$30					;$01EF4B	|
	LDA #$F2					;$01EF4D	|
	LDY #$02					;$01EF4F	|
	STA [$34],Y					;$01EF51	|
	LDY #$05					;$01EF53	|
	STA [$34],Y					;$01EF55	|
	LDA $32EE					;$01EF57	|
	ASL A						;$01EF5A	|
	ASL A						;$01EF5B	|
	TAX							;$01EF5C	|
	LDA $7AF3,X					;$01EF5D	|
	PHA							;$01EF60	|
	LDA $7AF4,X					;$01EF61	|
	PHA							;$01EF64	|
	LDA $7AF5,X					;$01EF65	|
	LDY #$00					;$01EF68	|
	JSR CODE_FL_01EF80			;$01EF6A	|
	PLA							;$01EF6D	|
	LDY #$03					;$01EF6E	|
	JSR CODE_FL_01EF80			;$01EF70	|
	PLA							;$01EF73	|
	LDY #$06					;$01EF74	|
	JSR CODE_FL_01EF80			;$01EF76	|
	REP #$30					;$01EF79	|
	JSL WriteToDMABuffer		;$01EF7B	|
	RTS							;$01EF7F	|


CODE_FL_01EF80: 
	LDX #$B5					;$01EF80	|
	SEC							;$01EF82	|
CODE_FL_01EF83:					;			|
	INX							;$01EF83	|
	SBC #$0A					;$01EF84	|
	BCS CODE_FL_01EF83			;$01EF86	|
	PHA							;$01EF88	|
	TXA							;$01EF89	|
	STA [$34],Y					;$01EF8A	|
	INY							;$01EF8C	|
	PLA							;$01EF8D	|
	ADC #$C0					;$01EF8E	|
	STA [$34],Y					;$01EF90	|
	RTS							;$01EF92	|


CODE_FL_01EF93: 
	TAY							;$01EF93	|
	LDA $3019					;$01EF94	|
	CLC							;$01EF97	|
	ADC #$014C					;$01EF98	|
	CMP $301B					;$01EF9B	|
	BCC CODE_FL_01EFA2			;$01EF9E	|
	CLC							;$01EFA0	|
	RTS							;$01EFA1	|

CODE_FL_01EFA2: 
	TYA							;$01EFA2	|
	PHA							;$01EFA3	|
	LDY #$FFFF					;$01EFA4	|
	SEC							;$01EFA7	|
CODE_FL_01EFA8:					;			|
	INY							;$01EFA8	|
	SBC #$000A					;$01EFA9	|
	BCS CODE_FL_01EFA8			;$01EFAC	|
	ADC #$000A					;$01EFAE	|
	STA $2E						;$01EFB1	|
	TYA							;$01EFB3	|
	XBA							;$01EFB4	|
	LSR A						;$01EFB5	|
	ADC #$62D2					;$01EFB6	|
	STA $34						;$01EFB9	|
	LDA #$0003					;$01EFBB	|
	STA $31						;$01EFBE	|
	LDA #$0080					;$01EFC0	|
	STA $32						;$01EFC3	|
	LDA #$00E7					;$01EFC5	|
	STA $36						;$01EFC8	|
	STX.B CameraX_TileMirror	;$01EFCA	|
	JSL WriteToDMABuffer		;$01EFCC	|
	LDA $2E						;$01EFD0	|
	XBA							;$01EFD2	|
	LSR A						;$01EFD3	|
	ADC #$62D2					;$01EFD4	|
	STA $34						;$01EFD7	|
	LDA.B CameraX_TileMirror	;$01EFD9	|
	ADC #$0040					;$01EFDB	|
	STA.B CameraX_TileMirror	;$01EFDE	|
	JSL WriteToDMABuffer		;$01EFE0	|
	PLA							;$01EFE4	|
	SEC							;$01EFE5	|
	RTS							;$01EFE6	|


DATA_01EFE7:					;$01EFE7	| Pointers to some DMA tables in bank $01 for Gourmet Race.
	dw DATA_01EFED
	dw DATA_01EFF6
	dw DATA_01EFFF

DATA_01EFED:					;$01EFED	| DMA table used by the above routines.
	db $83 : dw $0280 : dl $CDDDEE : dw $5A20		; 2-byte DMA to decompress and transfer 0x280 bytes from $CDDDEE to $5A20.
	db $FF

DATA_01EFF6:					;$01EFED	| DMA table used by the above routines.
	db $83 : dw $0280 : dl $CDE051 : dw $5A20		; 2-byte DMA to decompress and transfer 0x280 bytes from $CDE051 to $5A20.
	db $FF

DATA_01EFFF:					;$01EFED	| DMA table used by the above routines.
	db $83 : dw $0280 : dl $CDE2C5 : dw $5A20		; 2-byte DMA to decompress and transfer 0x280 bytes from $CDE2C5 to $5A20.
	db $FF





StatusBar_GreatCave: 			;-----------| Status bar routine for The Great Cave Offensive.
	LDA $7B0F					;$01F008	|
	STA $7372					;$01F00B	|
	LDA $7B11					;$01F00E	|
	STA $7374					;$01F011	|
	LDA #$0000					;$01F014	|\ 
	LDY $6240					;$01F017	||
	BMI CODE_FL_01F01F			;$01F01A	||
	ORA #$0004					;$01F01C	|| Get the layout to use.
CODE_FL_01F01F:					;			|| Start with X = 0;
	LDY HUD_BossHP				;$01F01F	||  If a partner is active, add 4.
	BMI CODE_FL_01F027			;$01F022	||  If a boss is active, add 2.
	ORA #$0002					;$01F024	||
CODE_FL_01F027: 				;			||
	TAX							;$01F027	|/
	JMP (CODE_FL_01F02B,X)		;$01F028	|

CODE_FL_01F02B: 				;$01F02B	| Pointers to status bar routines for The Great Cave Offensive.
	dw CODE_FL_01F033			; 0 - No partner, no boss
	dw CODE_FL_01F06B			; 1 - No partner, has boss
	dw CODE_FL_01F0AE			; 2 - Has partner, no boss
	dw CODE_FL_01F0FA			; 3 - Has partner, has boss



CODE_FL_01F033: 				;-----------| The Great Cave Offensive status bar routine 0 - No partner, no boss.
	CPX $00B3					;$01F033	|\ Skip if the status bar has already been initialized.
	BEQ CODE_FL_01F04E			;$01F036	|/
	STX $00B3					;$01F038	|
	LDA #$F14B					;$01F03B	|\ 
	LDX #$0001					;$01F03E	|| Load the DMA table at $01F14B.
	JSL LoadDMATable			;$01F041	|/
	LDA #$00EA					;$01F045	|\ 
	LDX #$658C					;$01F048	|| Load the base tilemap from $EA658C.
	JSR LoadStatusBarBase		;$01F04B	|/
CODE_FL_01F04E: 				;			|
	LDX #$165A					;$01F04E	|\ Write the score/money.
	JSR CODE_FL_01F8EE			;$01F051	|/
	LDX #$16BD					;$01F054	|\ Write the life count.
	JSR CODE_FL_01F8B7			;$01F057	|/
	JSR CODE_FL_01FBD0			;$01F05A	|
	BCC CODE_FL_01F065			;$01F05D	|
	LDX #$1669					;$01F05F	|\ Update Kirby's HP bar.
	JSR WriteHPBar				;$01F062	|/
CODE_FL_01F065: 				;			|
	JSR CODE_FN_01FA25			;$01F065	|
	JMP CODE_JP_01F706			;$01F068	|



CODE_FL_01F06B: 				;-----------| The Great Cave Offensive status bar routine 1 - No partner, has boss.
	CPX $00B3					;$01F06B	|\ Skip if the status bar has already been initialized.
	BEQ CODE_FL_01F08C			;$01F06E	|/
	STX $00B3					;$01F070	|
	LDA #$F154					;$01F073	|\ 
	LDX #$0001					;$01F076	|| Load the DMA table at $01F154.
	JSL LoadDMATable			;$01F079	|/
	LDA #$00EA					;$01F07D	|\ 
	LDX #$69C0					;$01F080	|| Load the base tilemap from $EA69C0.
	JSR LoadStatusBarBase		;$01F083	|/
	LDA #$8000					;$01F086	|
	TSB $7A1F					;$01F089	|
CODE_FL_01F08C: 				;			|
	JSR CODE_FL_01FCD5			;$01F08C	|
	BCC CODE_FL_01F097			;$01F08F	|
	LDX #$165B					;$01F091	|\ Update the boss's HP bar.
	JSR WriteHPBar				;$01F094	|/
CODE_FL_01F097: 				;			|
	LDX #$16BD					;$01F097	|\ Write the life count.
	JSR CODE_FL_01F8B7			;$01F09A	|/
	JSR CODE_FL_01FBD0			;$01F09D	|
	BCC CODE_FL_01F0A8			;$01F0A0	|
	LDX #$1669					;$01F0A2	|\ Update Kirby's HP bar.
	JSR WriteHPBar				;$01F0A5	|/
CODE_FL_01F0A8: 				;			|
	JSR CODE_FN_01FA25			;$01F0A8	|
	JMP CODE_JP_01F706			;$01F0AB	|



CODE_FL_01F0AE: 				;-----------| The Great Cave Offensive status bar routine 2 - No partner, has boss.
	CPX $00B3					;$01F0AE	|\ Skip if the status bar has already been initialized.
	BEQ CODE_FL_01F0CF			;$01F0B1	|/
	STX $00B3					;$01F0B3	|
	LDA #$F14B					;$01F0B6	|\ 
	LDX #$0001					;$01F0B9	|| Load the DMA table at $01F14B.
	JSL LoadDMATable			;$01F0BC	|/
	LDA #$00EA					;$01F0C0	|\ 
	LDX #$939B					;$01F0C3	|| Load the base tilemap from $EA939B.
	JSR LoadStatusBarBase		;$01F0C6	|/
	LDA #$8000					;$01F0C9	|
	TSB $7A1F					;$01F0CC	|
CODE_FL_01F0CF: 				;			|
	LDX #$165A					;$01F0CF	|\ Write the score/money.
	JSR CODE_FL_01F8EE			;$01F0D2	|/
	LDX #$16BD					;$01F0D5	|\ Write the life count.
	JSR CODE_FL_01F8B7			;$01F0D8	|/
	JSR CODE_FL_01FBD0			;$01F0DB	|
	BCC CODE_FL_01F0E6			;$01F0DE	|
	LDX #$1669					;$01F0E0	|\ Update Kirby's HP bar.
	JSR WriteHPBar				;$01F0E3	|/
CODE_FL_01F0E6: 				;			|
	JSR CODE_FL_01FC62			;$01F0E6	|
	BCC CODE_FL_01F0F1			;$01F0E9	|
	LDX #$16AA					;$01F0EB	|\ Update the partner's HP bar.
	JSR WriteHPBar2				;$01F0EE	|/
CODE_FL_01F0F1: 				;			|
	JSR CODE_FN_01FA25			;$01F0F1	|
	JSR CODE_FL_01FAF3			;$01F0F4	|
	JMP CODE_JP_01F706			;$01F0F7	|



CODE_FL_01F0FA: 				;-----------| The Great Cave Offensive status bar routine 3 - Has partner, has boss.
	CPX $00B3					;$01F0FA	|\ Skip if the status bar has already been initialized.
	BEQ CODE_FL_01F11B			;$01F0FD	|/
	STX $00B3					;$01F0FF	|
	LDA #$F154					;$01F102	|\ 
	LDX #$0001					;$01F105	|| Load the DMA table at $01F154.
	JSL LoadDMATable			;$01F108	|/
	LDA #$00EA					;$01F10C	|\ 
	LDX #$94DF					;$01F10F	|| Load the base tilemap from $EA64DF.
	JSR LoadStatusBarBase		;$01F112	|/
	LDA #$8000					;$01F115	|
	TSB $7A1F					;$01F118	|
CODE_FL_01F11B: 				;			|
	JSR CODE_FL_01FCD5			;$01F11B	|
	BCC CODE_FL_01F126			;$01F11E	|
	LDX #$165B					;$01F120	|\ Update the boss's HP bar.
	JSR WriteHPBar				;$01F123	|/
CODE_FL_01F126: 				;			|
	LDX #$16BD					;$01F126	|\ Write the life count.
	JSR CODE_FL_01F8B7			;$01F129	|/
	JSR CODE_FL_01FBD0			;$01F12C	|
	BCC CODE_FL_01F137			;$01F12F	|
	LDX #$1669					;$01F131	|\ Update Kirby's HP bar.
	JSR WriteHPBar				;$01F134	|/
CODE_FL_01F137: 				;			|
	JSR CODE_FL_01FC62			;$01F137	|
	BCC CODE_FL_01F142			;$01F13A	|
	LDX #$16AA					;$01F13C	|\ Update partner's HP bar.
	JSR WriteHPBar2				;$01F13F	|/
CODE_FL_01F142: 				;			|
	JSR CODE_FN_01FA25			;$01F142	|
	JSR CODE_FL_01FAF3			;$01F145	|
	JMP CODE_JP_01F706			;$01F148	|

DATA_01F14B:					;$01F14B	| DMA table used by the above routines.
	db $03 : dw $0040 : dl $EFB792 : dw $5F30
	db $FF

DATA_01F154:					;$01F154	| DMA table used by the above routines.
	db $03 : dw $0040 : dl $EFB752 : dw $5F30
	db $FF





StatusBar_MetaKnight:					;-----------| Status bar routine for Revenge of Meta-Knight.
	LDA #$0000					;$01F15D	|\ 
	LDY $6240					;$01F160	||
	BMI CODE_FL_01F168			;$01F163	||
	ORA #$0004					;$01F165	|| Get the layout to use.
CODE_FL_01F168:					;			|| Start with X = 0;
	LDY HUD_BossHP					;$01F168	||  If a partner is active, add 4.
	BMI CODE_FL_01F170			;$01F16B	||  If a boss is active, add 2.
	ORA #$0002					;$01F16D	||
CODE_FL_01F170:					;			||
	TAX							;$01F170	|/
	LDA $7A23					;$01F171	|\ 
	AND #$00FF					;$01F174	||
	CMP #$00FF					;$01F177	|| Alternatively, if a textbox is active, use X = 8.
	BEQ CODE_FL_01F17F			;$01F17A	||
	LDX #$0008					;$01F17C	|/
CODE_FL_01F17F:					;			|
	JMP (CODE_FL_01F182,X)		;$01F17F	|


CODE_FL_01F182:					;$01F182	| Pointers to status bar routines for Revenge of Meta-Knight.
	dw CODE_FL_01F18C			; 0 - No partner, no boss
	dw CODE_FL_01F1AF			; 1 - No partner, has boss
	dw CODE_FL_01F1D6			; 2 - Has partner, no boss
	dw CODE_FL_01F206			; 3 - Has partner, has boss
	dw CODE_FL_01F27A			; 4 - Textbox

CODE_FL_01F18C:					;-----------| Revenge of Meta-Knight status bar routine 0 - No partner, no boss
	CPX $00B3					;$01F18C	|\ Skip if the status bar has already been initialized.
	BEQ CODE_FL_01F1A6			;$01F18F	|/
	STX $00B3					;$01F191	|
	LDA #$0004					;$01F194	|
	TRB $3072					;$01F197	|
	TRB $7A28					;$01F19A	|
	LDX #$056D					;$01F19D	|\ 
	LDA #$00EB					;$01F1A0	|| Load the base tilemap from $EB056D.
	JSR LoadStatusBarBase		;$01F1A3	|/
CODE_FL_01F1A6:					;			|
	LDX #$16A8					;$01F1A6	|\ Write the score.
	JSR CODE_FL_01F947			;$01F1A9	|/
	JMP $F239					;$01F1AC	|



CODE_FL_01F1AF:					;-----------| Revenge of Meta-Knight status bar routine 1 - No partner, has boss
	CPX $00B3					;$01F1AF	|\ Skip if the status bar has already been initialized.
	BEQ CODE_FL_01F1C9			;$01F1B2	|/
	STX $00B3					;$01F1B4	|
	LDA #$0004					;$01F1B7	|
	TRB $3072					;$01F1BA	|
	TRB $7A28					;$01F1BD	|
	LDX #$FA16					;$01F1C0	|\ 
	LDA #$00EA					;$01F1C3	|| Load the base tilemap from $EAFA16.
	JSR LoadStatusBarBase		;$01F1C6	|/
CODE_FL_01F1C9:					;			|
	JSR CODE_FL_01FCD5			;$01F1C9	|
	BCC CODE_FL_01F1D4			;$01F1CC	|
	LDX #$16C4					;$01F1CE	|\ Update the boss's HP bar.
	JSR WriteHPBar				;$01F1D1	|/
CODE_FL_01F1D4:					;			|
	BRA CODE_FL_01F239			;$01F1D4	|



CODE_FL_01F1D6:					;-----------| Revenge of Meta-Knight status bar routine 2 - Has partner, no boss
	CPX $00B3					;$01F1D6	|\ Skip if the status bar has already been initialized.
	BEQ CODE_FL_01F1F3			;$01F1D9	|/
	STX $00B3					;$01F1DB	|
	LDA #$0004					;$01F1DE	|
	TRB $3072					;$01F1E1	|
	TRB $7A28					;$01F1E4	|
	LDX #$0CE2					;$01F1E7	|\ 
	LDA #$00EB					;$01F1EA	|| Load the base tilemap from $EB0CE2.
	JSR LoadStatusBarBase		;$01F1ED	|/
	STA $00BD					;$01F1F0	|
CODE_FL_01F1F3:					;			|
	LDX #$16A8					;$01F1F3	|\ Write the score.
	JSR CODE_FL_01F947			;$01F1F6	|/
	JSR CODE_FL_01FC62			;$01F1F9	|
	BCC CODE_FL_01F204			;$01F1FC	|
	LDX #$166A					;$01F1FE	|\ Update the partner's HP bar.
	JSR WriteHPBar2				;$01F201	|/
CODE_FL_01F204:					;			|
	BRA CODE_FL_01F239			;$01F204	|



CODE_FL_01F206:					;-----------| Revenge of Meta-Knight status bar routine 3 - Has partner, has boss
	CPX $00B3					;$01F206	|\ Skip if the status bar has already been initialized.
	BEQ CODE_FL_01F223			;$01F209	|/
	STX $00B3					;$01F20B	|
	LDA #$0004					;$01F20E	|
	TRB $3072					;$01F211	|
	TRB $7A28					;$01F214	|
	LDX #$FE81					;$01F217	|\ 
	LDA #$00EA					;$01F21A	|| Load the base tilemap from $EAFE81.
	JSR LoadStatusBarBase		;$01F21D	|/
	STA $00BD					;$01F220	|
CODE_FL_01F223:					;			|
	JSR CODE_FL_01FCD5			;$01F223	|
	BCC CODE_FL_01F22E			;$01F226	|
	LDX #$16C4					;$01F228	|\ Update the boss's HP bar.
	JSR WriteHPBar				;$01F22B	|/
CODE_FL_01F22E:					;			|
	JSR CODE_FL_01FC62			;$01F22E	|
	BCC CODE_FL_01F239			;$01F231	|
	LDX #$166A					;$01F233	|\ Update the partner's HP bar.
	JSR WriteHPBar2				;$01F236	|/
CODE_FL_01F239:					;			|
	JSR CODE_FL_01FBD0			;$01F239	|
	BCC CODE_FL_01F244			;$01F23C	|
	LDX #$165D					;$01F23E	|\ Update Kirby's HP bar.
	JSR WriteHPBar				;$01F241	|/
CODE_FL_01F244:					;			|
	LDX #$16A0					;$01F244	|\ Write the life count.
	JSR CODE_FL_01F8B7			;$01F247	|/
	JSR CODE_FL_01F3D3			;$01F24A	|
	LDA $7A2D					;$01F24D	|
	INC A						;$01F250	|
	CMP #$0003					;$01F251	|
	BCS CODE_FL_01F261			;$01F254	|
	STA $7A2D					;$01F256	|
	LDA #$E4E4					;$01F259	|\ From $EFE4E4...
	LDX #$00EF					;$01F25C	|/
	BRA CODE_FL_01F26A			;$01F25F	|

CODE_FL_01F261: 
	STZ $7A2D					;$01F261	|
	LDA #$E502					;$01F264	|\ From $EFE502...
	LDX #$00EF					;$01F267	|/
CODE_FL_01F26A:					;			|
	LDY #$610F					;$01F26A	|\ ...transfer 15 colors to $61-$6F.
	JSL WriteStatusPal			;$01F26D	|/
	JSR CODE_FN_01FA25			;$01F271	|
	JSR CODE_FL_01FAF3			;$01F274	|
	JMP CODE_JP_01F706			;$01F277	|



CODE_FL_01F27A:					;-----------| Revenge of Meta-Knight status bar routine 4 - Textbox
	CPX $00B3					;$01F27A	|\ Skip if the status bar has already been initialized.
	BEQ CODE_FL_01F2C1			;$01F27D	|/
	STX $00B3					;$01F27F	|
	INC $00BF					;$01F282	|
	LDA #$FFDE					;$01F285	|\ 
	LDX #$0001					;$01F288	|| Load the DMA table at $01FFDE.
	JSL LoadDMATable			;$01F28B	|/
	LDA #$E520					;$01F28F	|\ 
	LDX #$00EF					;$01F292	|| Transfer 15 colors from $EFE520 to $61-$6F.
	LDY #$610F					;$01F295	||
	JSL WriteStatusPal			;$01F298	|/
	LDA #$0010					;$01F29C	|\ 
	STA $157B					;$01F29F	|| Set color 0x32 (Kirby's HP bar) to #$0010 (a dark red).
	LDA #$40E0					;$01F2A2	|| Set color 0x52 (boss HP bar) to #$40E0 (a dark blue).
	STA $15BB					;$01F2A5	|/
	LDA HUD_BossHP				;$01F2A8	|\ 
	BPL CODE_FL_01F2B8			;$01F2AB	||
	LDX #$056D					;$01F2AD	||
	LDA #$00EB					;$01F2B0	|| Load the base tilemap from either
	JSR LoadStatusBarBase		;$01F2B3	||  $EB056D (if no boss is active)
	BRA CODE_FL_01F2C1			;$01F2B6	||  or $EAFA16 (if a boss is active).
CODE_FL_01F2B8:					;			||
	LDX #$FA16					;$01F2B8	||
	LDA #$00EA					;$01F2BB	||
	JSR LoadStatusBarBase		;$01F2BE	|/
CODE_FL_01F2C1:					;			|
	LDX #$16A0					;$01F2C1	|\ Write the life count.
	JSR CODE_FL_01F8B7			;$01F2C4	|/
	JSR CODE_FL_01F3D3			;$01F2C7	|
	JSR CODE_FL_01FBD0			;$01F2CA	|
	BCC CODE_FL_01F2D5			;$01F2CD	|
	LDX #$165D					;$01F2CF	|\ Update Kirby's HP bar.
	JSR WriteHPBar				;$01F2D2	|/
CODE_FL_01F2D5:					;			|
	LDA HUD_BossHP				;$01F2D5	|\ Branch if a boss is active.
	BPL CODE_FL_01F2E2			;$01F2D8	|/
	LDX #$16A8					;$01F2DA	|\ Write the score.
	JSR CODE_FL_01F947			;$01F2DD	|/
	BRA CODE_FL_01F2ED			;$01F2E0	|

CODE_FL_01F2E2: 
	JSR CODE_FL_01FCD5			;$01F2E2	|
	BCC CODE_FL_01F2ED			;$01F2E5	|
	LDX #$16C4					;$01F2E7	|\ Update the boss's HP bar.
	JSR WriteHPBar				;$01F2EA	|/
CODE_FL_01F2ED:					;			|
	SEP #$30					;$01F2ED	|
	LDA #$FF					;$01F2EF	|
	STA $7385					;$01F2F1	|
	STA $7387					;$01F2F4	|
	STA $7389					;$01F2F7	|
	LDA $7A23					;$01F2FA	|\ 
	CMP $7A24					;$01F2FD	|| Branch down if the textbox's character image has already been updated.
	BEQ CODE_FL_01F371			;$01F300	||
	STA $7A24					;$01F302	|/
	CMP #$10					;$01F305	|\ If the image is set to 0x10 or more, don't draw any iamge.
	BCS CODE_FL_01F365			;$01F307	|/
	REP #$30					;$01F309	|
	AND #$00FF					;$01F30B	|\ 
	STA $00						;$01F30E	||
	ASL A						;$01F310	|| Multiply character image ID by 3, to get an index to the pointer tables.
	ADC $00						;$01F311	||
	STA $00						;$01F313	|/
	TAX							;$01F315	|
	LDA.l DATA_01FF66+2,X		;$01F316	|\ 
	TAY							;$01F31A	||
	LDA.l DATA_01FF66,X			;$01F31B	|| Transfer 15 colors from the pointer to $11-$1F for the character image.
	TYX							;$01F31F	||
	LDY #$110F					;$01F320	||
	JSL WriteStatusPal			;$01F323	|/
	LDA $3012					;$01F327	|\ 
	STA $34						;$01F32A	||
	CLC							;$01F32C	|| Decompress and set up a DMA for the character image to be displayed.
	ADC #$0280					;$01F32D	||
	STA $3012					;$01F330	||
	LDX $00						;$01F333	||
	LDA.l DATA_01FF96+2,X		;$01F335	||
	TAY							;$01F339	||
	LDA.l DATA_01FF96,X			;$01F33A	||
	TAX							;$01F33E	||
	TYA							;$01F33F	||
	LDY $34						;$01F340	||
	PEA $007E					;$01F342	||
	PLB							;$01F345	||
	JSL DecompressData			;$01F346	||
	PLB							;$01F34A	||
	LDA #$0003					;$01F34B	||
	STA $31						;$01F34E	||
	LDA #$0280					;$01F350	||\ Upload 0x280 bytes...
	STA $32						;$01F353	||/
	LDA #$007E					;$01F355	||
	STA $36						;$01F358	||
	LDA #$58E0					;$01F35A	||\ ...to $58E0.
	STA.B CameraX_TileMirror						;$01F35D	||/
	JSL WriteToDMABuffer		;$01F35F	|/
	BRA CODE_FL_01F371			;$01F363	|

CODE_FL_01F365:					;```````````| No character image to be displayed.
	REP #$30					;$01F365	|
	LDX #$001C					;$01F367	|\ 
  .colorLoop:					;			||
	STZ $1539,X					;$01F36A	|| Black out the colors for the character image.
	DEX							;$01F36D	||
	DEX							;$01F36E	||
	BPL .colorLoop				;$01F36F	|/
CODE_FL_01F371:					;```````````| Done with the character image.
	REP #$30					;$01F371	|
	JMP CODE_FL_01F7AE			;$01F373	|


CODE_FL_01F376:					;-----------| Unused routine?
	CMP #$0020					;$01F376	|
	BCC CODE_FL_01F37E			;$01F379	|
	LDA #$0000					;$01F37B	|
CODE_FL_01F37E:					;			|
	STA $00BF					;$01F37E	|
	LSR A						;$01F381	|
	LSR A						;$01F382	|
	AND #$FFFE					;$01F383	|
	STA $00						;$01F386	|
	LSR A						;$01F388	|
	ADC $00						;$01F389	|
	TAX							;$01F38B	|
	LDA.l DATA_01FFC6,X			;$01F38C	|
	STA $14						;$01F390	|
	CLC							;$01F392	|
	ADC #$0014					;$01F393	|
	STA $18						;$01F396	|
	LDA.l DATA_01FFC6+2,X		;$01F398	|
	STA $16						;$01F39C	|
	STA $1A						;$01F39E	|
	SEP #$30					;$01F3A0	|
	LDY #$00					;$01F3A2	|
	TYX							;$01F3A4	|
CODE_FL_01F3A5:					;			|
	LDA [$14],Y					;$01F3A5	|
	CLC							;$01F3A7	|
	ADC #$80					;$01F3A8	|
	STA $1638,X					;$01F3AA	|
	LDA [$18],Y					;$01F3AD	|
	STA $1718,X					;$01F3AF	|
	INX							;$01F3B2	|
	CPX #$04					;$01F3B3	|
	BEQ CODE_FL_01F3C3			;$01F3B5	|
	CPX #$24					;$01F3B7	|
	BEQ CODE_FL_01F3C3			;$01F3B9	|
	CPX #$44					;$01F3BB	|
	BEQ CODE_FL_01F3C3			;$01F3BD	|
	CPX #$64					;$01F3BF	|
	BNE CODE_FL_01F3C8			;$01F3C1	|
CODE_FL_01F3C3:					;			|
	TXA							;$01F3C3	|
	CLC							;$01F3C4	|
	ADC #$1C					;$01F3C5	|
	TAX							;$01F3C7	|
CODE_FL_01F3C8:					;			|
	INY							;$01F3C8	|
	CPY #$14					;$01F3C9	|
	BCC CODE_FL_01F3A5			;$01F3CB	|
	REP #$30					;$01F3CD	|
	INC $00B1					;$01F3CF	|
	RTS							;$01F3D2	|


CODE_FL_01F3D3:					;-----------| Status bar subroutine for Revenge of Meta-Knight.
	SEP #$10					;$01F3D3	|
	LDA RoMK_Timer				;$01F3D5	|
	STA HW_WRDIV				;$01F3D8	|
	LDX #$03					;$01F3DB	|
	STX HW_WRDIVB				;$01F3DD	|
	PHA							;$01F3E0	|
	PLA							;$01F3E1	|
	LDX #$FF					;$01F3E2	|
	SEC							;$01F3E4	|
	LDA HW_RDDIV				;$01F3E5	|
CODE_FL_01F3E8:					;			|
	INX							;$01F3E8	|
	SBC #$03E8					;$01F3E9	|
	BCS CODE_FL_01F3E8			;$01F3EC	|
	STX $00						;$01F3EE	|
	ADC #$03E8					;$01F3F0	|
	LDX #$FF					;$01F3F3	|
CODE_FL_01F3F5:					;			|
	INX							;$01F3F5	|
	SBC #$0064					;$01F3F6	|
	BCS CODE_FL_01F3F5			;$01F3F9	|
	STX $01						;$01F3FB	|
	ADC #$0064					;$01F3FD	|
	LDX #$FF					;$01F400	|
CODE_FL_01F402:					;			|
	INX							;$01F402	|
	SBC #$000A					;$01F403	|
	BCS CODE_FL_01F402			;$01F406	|
	STX $02						;$01F408	|
	ADC #$000A					;$01F40A	|
	SEP #$20					;$01F40D	|
	STA $03						;$01F40F	|
	LDX #$00					;$01F411	|
	LDA #$FF					;$01F413	|
CODE_FL_01F415:					;			|
	LDY $00,X					;$01F415	|
	BNE CODE_FL_01F422			;$01F417	|
	STA $001665,X				;$01F419	|
	INX							;$01F41D	|
	CPX #$03					;$01F41E	|
	BCC CODE_FL_01F415			;$01F420	|
CODE_FL_01F422:					;			|
	LDA $00,X					;$01F422	|
	CLC							;$01F424	|
	ADC #$B6					;$01F425	|
	STA $001665,X				;$01F427	|
	INX							;$01F42B	|
	CPX #$04					;$01F42C	|
	BCC CODE_FL_01F422			;$01F42E	|
	REP #$30					;$01F430	|
	INC $00B1					;$01F432	|
	RTS							;$01F435	|





StatusBar_MilkyWay:					;-----------| Status bar routine for Milky Way Wishes.
	LDA #$0000					;$01F436	|\ 
	LDY $6240					;$01F439	||
	BMI CODE_FL_01F441			;$01F43C	||
	ORA #$0004					;$01F43E	|| Get the layout to use.
CODE_FL_01F441:					;			|| Start with A = 0;
	LDY HUD_BossHP				;$01F441	||  If a partner is active, add 4.
	BMI CODE_FL_01F449			;$01F444	||  If a boss is active, add 2.
	ORA #$0002					;$01F446	||
CODE_FL_01F449:					;			||
	TAX							;$01F449	|/
	JMP (CODE_FL_01F44D,X)		;$01F44A	|

CODE_FL_01F44D:					;$01F44D	| Pointers to status bar routines for Milky Way Wishes.
	dw CODE_FL_01F455			; 0 - No partner, no boss
	dw CODE_FL_01F489			; 1 - No partner, has boss
	dw CODE_FL_01F4C9			; 2 - Has partner, no boss
	dw CODE_FL_01F50E			; 3 - Has partner, has boss



CODE_FL_01F455:					;-----------| Milky Way Wishes status bar routine 0 - No partner, no boss.
	CPX $00B3					;$01F455	|\ Skip if the status bar has already been initialized.
	BEQ CODE_FL_01F46C			;$01F458	|/
	STX $00B3					;$01F45A	|
	LDX #$8FCB					;$01F45D	|\ 
	LDA #$00EA					;$01F460	|| Load the base tilemap from $EA8FCB.
	JSR LoadStatusBarBase		;$01F463	|/
	JSR CODE_FL_01F55F			;$01F466	| Load the graphics for the planet name.
	INC $00B1					;$01F469	|
CODE_FL_01F46C:					;			|
	LDX #$169A					;$01F46C	|\ Write the score.
	JSR CODE_FL_01F947			;$01F46F	|/
	LDX #$16AB					;$01F472	|\ Write the life count.
	JSR CODE_FL_01F8B7			;$01F475	|/
	JSR CODE_FL_01FBD0			;$01F478	|
	BCC CODE_FL_01F483			;$01F47B	|
	LDX #$165B					;$01F47D	|\ Update Kirby's HP bar.
	JSR WriteHPBar2				;$01F480	|/
CODE_FL_01F483:					;			|
	JSR CODE_FN_01FA25			;$01F483	|
	JMP CODE_JP_01F706			;$01F486	|



CODE_FL_01F489:					;-----------| Milky Way Wishes status bar routine 1 - No partner, has boss.
	CPX $00B3					;$01F489	|\ Skip if the status bar has already been initialized.
	BEQ CODE_FL_01F4A7			;$01F48C	|/
	STX $00B3					;$01F48E	|
	LDX #$8BEB					;$01F491	|\ 
	LDA #$00EA					;$01F494	|| Load the base tilemap from $EA8BEB.
	JSR LoadStatusBarBase		;$01F497	|/
	LDX #$0001					;$01F49A	|\ Load the DMA table at $01F5C0.
	LDA #$F5C0					;$01F49D	|| This data overwrites the planet name.
	JSL LoadDMATable			;$01F4A0	|/
	INC $00B1					;$01F4A4	|
CODE_FL_01F4A7:					;			|
	LDX #$169C					;$01F4A7	|\ Write the life count.
	JSR CODE_FL_01F8B7			;$01F4AA	|/
	JSR CODE_FL_01FCD5			;$01F4AD	|
	BCC CODE_FL_01F4B8			;$01F4B0	|
	LDX #$168D					;$01F4B2	|\ Update the boss's HP bar.
	JSR WriteHPBar2				;$01F4B5	|/
CODE_FL_01F4B8:					;			|
	JSR CODE_FL_01FBD0			;$01F4B8	|
	BCC CODE_FL_01F4C3			;$01F4BB	|
	LDX #$165B					;$01F4BD	|\ Update Kirby's HP bar.
	JSR WriteHPBar2				;$01F4C0	|/
CODE_FL_01F4C3:					;			|
	JSR CODE_FN_01FA25			;$01F4C3	|
	JMP CODE_JP_01F706			;$01F4C6	|



CODE_FL_01F4C9:					;-----------| Milky Way Wishes status bar routine 2 - Has partner, no boss.
	CPX $00B3					;$01F4C9	|\ Skip if the status bar has already been initialized.
	BEQ CODE_FL_01F4E3			;$01F4CC	|/
	STX $00B3					;$01F4CE	|
	LDA #$00EA					;$01F4D1	|\ 
	LDX #$BCA1					;$01F4D4	|| Load the base tilemap from $EABCA1.
	JSR LoadStatusBarBase		;$01F4D7	|/
	STA $00BD					;$01F4DA	|
	JSR CODE_FL_01F55F			;$01F4DD	| Load the graphics for the planet name.
	INC $00B1					;$01F4E0	|
CODE_FL_01F4E3:					;			|
	LDX #$169A					;$01F4E3	|\ Write the score.
	JSR CODE_FL_01F947			;$01F4E6	|/
	LDX #$167C					;$01F4E9	|\ Write the life count.
	JSR CODE_FL_01F8B7			;$01F4EC	|/
	JSR CODE_FL_01FBD0			;$01F4EF	|
	BCC CODE_FL_01F4FA			;$01F4F2	|
	LDX #$165B					;$01F4F4	|\ Update Kirby's HP bar.
	JSR WriteHPBar2				;$01F4F7	|/
CODE_FL_01F4FA:					;			|
	JSR CODE_FL_01FC62			;$01F4FA	|
	BCC CODE_FL_01F505			;$01F4FD	|
	LDX #$166D					;$01F4FF	|\ Update the partner's HP bar.
	JSR WriteHPBar				;$01F502	|/
CODE_FL_01F505:					;			|
	JSR CODE_FN_01FA25			;$01F505	|
	JSR CODE_FL_01FAF3			;$01F508	|
	JMP CODE_JP_01F706			;$01F50B	|



CODE_FL_01F50E:					;-----------| Milky Way Wishes status bar routine 3 - Has partner, has boss.
	CPX $00B3					;$01F50E	|\ Skip if the status bar has already been initialized.
	BEQ CODE_FL_01F52F			;$01F511	|/
	STX $00B3					;$01F513	|
	LDA #$00EA					;$01F516	|\ 
	LDX #$B421					;$01F519	|| Load the base tilemap from $EAB421.
	JSR LoadStatusBarBase		;$01F51C	|/
	STA $00BD					;$01F51F	|
	LDX #$0001					;$01F522	|\ Load the DMA table at $01F5C0.
	LDA #$F5C0					;$01F525	|| This data overwrites the planet name.
	JSL LoadDMATable			;$01F528	|/
	INC $00B1					;$01F52C	|
CODE_FL_01F52F:					;			|
	LDX #$16CF					;$01F52F	|\ Write the life count.
	JSR CODE_FL_01F8B7			;$01F532	|/
	JSR CODE_FL_01FCD5			;$01F535	|
	BCC CODE_FL_01F540			;$01F538	|
	LDX #$168D					;$01F53A	|\ Update the boss's HP bar.
	JSR WriteHPBar2				;$01F53D	|/
CODE_FL_01F540:					;			|
	JSR CODE_FL_01FBD0			;$01F540	|
	BCC CODE_FL_01F54B			;$01F543	|
	LDX #$1659					;$01F545	|\ Update Kirby's HP bar.
	JSR WriteHPBar2				;$01F548	|/
CODE_FL_01F54B:					;			|
	JSR CODE_FL_01FC62			;$01F54B	|
	BCC CODE_FL_01F556			;$01F54E	|
	LDX #$1699					;$01F550	|\ Update the partner's HP bar.
	JSR WriteHPBar2				;$01F553	|/
CODE_FL_01F556:					;			|
	JSR CODE_FN_01FA25			;$01F556	|
	JSR CODE_FL_01FAF3			;$01F559	|
	JMP CODE_JP_01F706			;$01F55C	|



CODE_FL_01F55F:					;-----------| Subroutine to get the planet name for the status bar in Milky Way Wishes.
	LDA $32EE					;$01F55F	|\ 
	ASL A						;$01F562	||
	ADC $32EE					;$01F563	||
	TAX							;$01F566	|| Get pointer to the logo.
	LDA.l DATA_01F5A2,X			;$01F567	||
	TAY							;$01F56B	||
	LDA.l DATA_01F5A2+2,X		;$01F56C	||
	TYX							;$01F570	|/
	LDY $3012					;$01F571	|\ 
	PEA $007E					;$01F574	||
	PLB							;$01F577	|| Decompress the data.
	JSL DecompressData			;$01F578	||
	PLB							;$01F57C	|/
	LDA #$0003					;$01F57D	|\ 
	STA $31						;$01F580	||
	LDA #$0180					;$01F582	||
	STA $32						;$01F585	||
	LDA $3012					;$01F587	|| Set up a 2-byte DMA for 0x180 bytes
	STA $34						;$01F58A	||  from the decompressed buffer to $5C20.
	CLC							;$01F58C	||
	ADC #$0180					;$01F58D	||
	STA $3012					;$01F590	||
	LDA #$007E					;$01F593	||
	STA $36						;$01F596	||
	LDA #$5C20					;$01F598	||
	STA.B CameraX_TileMirror	;$01F59B	||
	JSL WriteToDMABuffer		;$01F59D	|/
	RTS							;$01F5A1	|

DATA_01F5A2:					;$01F5A2	| Pointers to images for each of the planet names in Milky Way Wishes.
	dl $EAC162					; 0 - Floria
	dl $EAC291					; 1 - Hotbeat
	dl $EA87EC					; 2 - Skyhigh
	dl $EAB55E					; 3 - Cavios
	dl $EA8539					; 4 - Aqualiss
	dl $E9FEAB					; 5 - Mecheye
	dl $EAF484					; 6 - Halfmoon
	dl $ECA811					; 7 - [?]
	dl $EAF6C0					; 8 - Nova
	dl $ECA811					; 9 - [?] (unused duplicate?)

DATA_01F5C0:					;$01F5C0	| DMA table used to hide the planet name in Milky Way Wishes, for when a boss is active.
	db $83 : dw $0080 : dl $EEF6F5 : dw $5C20		; 2-byte DMA to decompress and transfer 0x80 bytes from $EEF6F5 to $5C20.
	db $FF



StatusBar_MiscGame:					;-----------| Status bar routine for The Arena, Sound Test, Guide / Minigame, and the two unused games.
	LDA #$0000					;$01F5C9	|\ 
	LDY $6240					;$01F5CC	||
	BMI CODE_FL_01F5D4			;$01F5CF	|| Get the layout to use.
	ORA #$0004					;$01F5D1	|| Start with A = 0;
CODE_FL_01F5D4:					;			||  If a partner is active, add 4.
	LDY HUD_BossHP				;$01F5D4	||  If a boss is active, add 2.
	BMI CODE_FL_01F5DC			;$01F5D7	||
	ORA #$0002					;$01F5D9	|/
CODE_FL_01F5DC:					;			|
	CMP $00B3					;$01F5DC	|\ Skip if the status bar has already been initialized.
	BEQ CODE_FL_01F643			;$01F5DF	|/
	STA $00B3					;$01F5E1	|
	LSR A						;$01F5E4	|
	ADC $00B3					;$01F5E5	|
	TAX							;$01F5E8	|
	LDA.l DATA_01F6C7,X			;$01F5E9	|\ 
	TAY							;$01F5ED	||
	LDA.l DATA_01F6C7+2,X		;$01F5EE	|| Load the base tilemap.
	TYX							;$01F5F2	||
	JSR LoadStatusBarBase		;$01F5F3	|/
	LDA $7A21					;$01F5F6	|
	CMP #$0010					;$01F5F9	|
	BCC CODE_FL_01F604			;$01F5FC	|
	LDA #$0010					;$01F5FE	|
	STA $7A21					;$01F601	|
CODE_FL_01F604:					;			|
	ASL A						;$01F604	|
	ADC $7A21					;$01F605	|
	TAX							;$01F608	|
	LDA.l DATA_01F6D3,X			;$01F609	|
	TAY							;$01F60D	|
	LDA.l DATA_01F6D3+2,X		;$01F60E	|
	TYX							;$01F612	|
	LDY $3012					;$01F613	|
	PEA $007E					;$01F616	|
	PLB							;$01F619	|
	JSL DecompressData			;$01F61A	|
	PLB							;$01F61E	|
	LDA #$0003					;$01F61F	|
	STA $31						;$01F622	|
	LDA #$0120					;$01F624	|
	STA $32						;$01F627	|
	LDA $3012					;$01F629	|
	STA $34						;$01F62C	|
	CLC							;$01F62E	|
	ADC #$0120					;$01F62F	|
	STA $3012					;$01F632	|
	LDA #$007E					;$01F635	|
	STA $36						;$01F638	|
	LDA #$5B60					;$01F63A	|
	STA.B CameraX_TileMirror						;$01F63D	|
	JSL WriteToDMABuffer		;$01F63F	|
CODE_FL_01F643:					;			|
	LDX $00B3					;$01F643	|
	JMP (CODE_FL_01F649,X)		;$01F646	|

CODE_FL_01F649:					;$01F649	| Pointers to status bar routines for The Arena/etc.
	dw CODE_FL_01F651				; 0 - No partner, no boss
	dw CODE_FL_01F662				; 1 - No partner, has boss
	dw CODE_FL_01F67E				; 2 - Has partner, no boss
	dw CODE_FL_01F69D				; 3 - Has partner, has boss



CODE_FL_01F651:					;-----------| The Arena/etc. status bar routine 0.
	JSR CODE_FL_01FBD0			;$01F651	|
	BCC CODE_FL_01F65C			;$01F654	|
	LDX #$169D					;$01F656	|
	JSR WriteHPBar				;$01F659	|
CODE_FL_01F65C:					;			|
	JSR CODE_FN_01FA25			;$01F65C	|
	JMP CODE_JP_01F706			;$01F65F	|



CODE_FL_01F662:					;-----------| The Arena/etc. status bar routine 1.
	JSR CODE_FL_01FCD5			;$01F662	|
	BCC CODE_FL_01F66D			;$01F665	|
	LDX #$16AA					;$01F667	|
	JSR WriteHPBar2				;$01F66A	|
CODE_FL_01F66D:					;			|
	JSR CODE_FL_01FBD0			;$01F66D	|
	BCC CODE_FL_01F678			;$01F670	|
	LDX #$169D					;$01F672	|
	JSR WriteHPBar				;$01F675	|
CODE_FL_01F678:					;			|
	JSR CODE_FN_01FA25			;$01F678	|
	JMP CODE_JP_01F706			;$01F67B	|



CODE_FL_01F67E:					;-----------| The Arena/etc. status bar routine 2.
	JSR CODE_FL_01FBD0			;$01F67E	|
	BCC CODE_FL_01F689			;$01F681	|
	LDX #$1680					;$01F683	|
	JSR WriteHPBar				;$01F686	|
CODE_FL_01F689:					;			|
	JSR CODE_FL_01FC62			;$01F689	|
	BCC CODE_FL_01F694			;$01F68C	|
	LDX #$16C1					;$01F68E	|
	JSR WriteHPBar				;$01F691	|
CODE_FL_01F694:					;			|
	JSR CODE_FN_01FA25			;$01F694	|
	JSR CODE_FL_01FAF3			;$01F697	|
	JMP CODE_JP_01F706			;$01F69A	|




CODE_FL_01F69D:					;-----------| The Arena/etc. status bar routine 3.
	JSR CODE_FL_01FCD5			;$01F69D	|
	BCC CODE_FL_01F6A8			;$01F6A0	|
	LDX #$168D					;$01F6A2	|
	JSR WriteHPBar2				;$01F6A5	|
CODE_FL_01F6A8:					;			|
	JSR CODE_FL_01FBD0			;$01F6A8	|
	BCC CODE_FL_01F6B3			;$01F6AB	|
	LDX #$1680					;$01F6AD	|
	JSR WriteHPBar				;$01F6B0	|
CODE_FL_01F6B3:					;			|
	JSR CODE_FL_01FC62			;$01F6B3	|
	BCC CODE_FL_01F6BE			;$01F6B6	|
	LDX #$16C1					;$01F6B8	|
	JSR WriteHPBar				;$01F6BB	|
CODE_FL_01F6BE:					;			|
	JSR CODE_FN_01FA25			;$01F6BE	|
	JSR CODE_FL_01FAF3			;$01F6C1	|
	JMP CODE_JP_01F706			;$01F6C4	|



DATA_01F6C7:					;$01F6C7	| Pointers to the base tilemaps for The Arena.
	dl $EBC34C					; 0 - No partner, no boss
	dl $EC1D7B					; 1 - No partner, has boss
	dl $EAC61B					; 2 - Has partner, no boss
	dl $EB08A5					; 3 - Has partner, has boss

DATA_01F6D3:					;$01F6D3	|
	dl $EBC25C
	dl $EC3445
	dl $ECA10E
	dl $EBD64F
	dl $EDE9CE
	dl $EBD811
	dl $EC311A
	dl $EC2AA9
	dl $EBAD23
	dl $EC1E53
	dl $EBC43C
	dl $EC1259
	dl $EC1F2A
	dl $EBC8DC
	dl $EEFC0E
	dl $EC0EE0
	dl $EDE65B





CODE_JP_01F706: 
	LDA $32EA					;$01F706	|
	CMP #$0002					;$01F709	|
	BNE CODE_FL_01F711			;$01F70C	|
	JMP CODE_FL_01F7AE			;$01F70E	|

CODE_FL_01F711: 
	LDY #$0004					;$01F711	|
CODE_FL_01F714:					;			|
	TYX							;$01F714	|
	LDA.l DATA_01F7DE,X			;$01F715	|
	STA $14						;$01F719	|
	INC A						;$01F71B	|
	INC A						;$01F71C	|
	STA $18						;$01F71D	|
	LDA $00C3,Y					;$01F71F	|
	STA ($14)					;$01F722	|
	LDA $00C9,Y					;$01F724	|
	STA ($18)					;$01F727	|
	LDX $00CF,Y					;$01F729	|
	BEQ CODE_FL_01F745			;$01F72C	|
	CPX #$0001					;$01F72E	|
	BNE CODE_FL_01F738			;$01F731	|
	LDA #$7FFF					;$01F733	|
	STA ($14)					;$01F736	|
CODE_FL_01F738:					;			|
	CPX #$0003					;$01F738	|
	BCC CODE_FL_01F78D			;$01F73B	|
	LDA #$0000					;$01F73D	|
	STA $00CF,Y					;$01F740	|
	BRA CODE_FL_01F78D			;$01F743	|
CODE_FL_01F745:					;			|
	LDX $00D5,Y					;$01F745	|
	BEQ CODE_FL_01F763			;$01F748	|
	CPX #$0004					;$01F74A	|
	BCS CODE_FL_01F78D			;$01F74D	|
	TXA							;$01F74F	|
	AND #$0001					;$01F750	|
	BEQ CODE_FL_01F78D			;$01F753	|
	LDA #$7FFF					;$01F755	|
	STA ($14)					;$01F758	|
	CPX #$0001					;$01F75A	|
	BNE CODE_FL_01F78D			;$01F75D	|
	STA ($18)					;$01F75F	|
	BRA CODE_FL_01F78D			;$01F761	|
CODE_FL_01F763:					;			|
	LDA $00DB,Y					;$01F763	|
	BEQ CODE_FL_01F77B			;$01F766	|
	CMP #$0010					;$01F768	|
	BCS CODE_FL_01F78D			;$01F76B	|
	AND #$0001					;$01F76D	|
	BEQ CODE_FL_01F78D			;$01F770	|
	LDA #$7FFF					;$01F772	|
	STA ($14)					;$01F775	|
	STA ($18)					;$01F777	|
	BRA CODE_FL_01F78D			;$01F779	|

CODE_FL_01F77B: 
	LDA $00E1,Y					;$01F77B	|
	BEQ CODE_FL_01F78D			;$01F77E	|
	LDA $3094					;$01F780	|
	AND #$0003					;$01F783	|
	BNE CODE_FL_01F78D			;$01F786	|
	LDA #$7FFF					;$01F788	|
	STA ($14)					;$01F78B	|
CODE_FL_01F78D:					;			|
	CPY #$0002					;$01F78D	|
	BNE CODE_FL_01F7A7			;$01F790	|
	LDA $75CF					;$01F792	|
	CMP #$0001					;$01F795	|
	BNE CODE_FL_01F7A7			;$01F798	|
	LDA $3094					;$01F79A	|
	AND #$0003					;$01F79D	|
	BNE CODE_FL_01F7A7			;$01F7A0	|
	LDA #$7FFF					;$01F7A2	|
	STA ($18)					;$01F7A5	|
CODE_FL_01F7A7: 				;			|
	DEY							;$01F7A7	|
	DEY							;$01F7A8	|
	BMI CODE_FL_01F7AE			;$01F7A9	|
	JMP CODE_FL_01F714			;$01F7AB	|


CODE_FL_01F7AE: 
	LDA $00B1					;$01F7AE	|\ Skip if the status bar doesn't need to be updated?
	BEQ CODE_FL_01F7CC			;$01F7B1	|/
	LDA $3019					;$01F7B3	|\ 
	CLC							;$01F7B6	||
	ADC #$0226					;$01F7B7	|| Add to the NMI load, and if about to go over the limit, skip the data entirely.
	CMP $301B					;$01F7BA	||
	BCS CODE_FL_01F7CC			;$01F7BD	|/
	STZ $00B1					;$01F7BF	|
	LDX #$0001					;$01F7C2	|\ Load the DMA table at $01F7CD.
	LDA #$F7CD					;$01F7C5	|| This table uploads the status bar tilemap.
	JSL LoadDMATable			;$01F7C8	|/
CODE_FL_01F7CC: 				;			|
	RTS							;$01F7CC	|


DATA_01F7CD:					;$01F7CD	| DMA table used to upload the status bar tilemap.
	db $09 : dw $00E0 : dl $001617 : dw $5800		; Lower DMA for 0xE0 bytes from $1617 to $5800.
	db $0F : dw $00E0 : dl $0016F7 : dw $5800		; Upper DMA for 0xE0 bytes from $16F7 to $5800.
	db $FF


DATA_01F7DE:					;$01F7DE	|
	dw $157B,$159B,$15BB





LoadStatusBarBase: 				;-----------| Subroutine to upload a base status bar tilemap. Pass source address in $-AXX.
	LDY #$1617					;$01F7E4	|\ 
	PEA $007E					;$01F7E7	|| Decompress the data from the source to $1617.
	PLB							;$01F7EA	||
	JSL DecompressData			;$01F7EB	|/
	SEP #$20					;$01F7EF	|
	LDX #$00DF					;$01F7F1	|\ 
CODE_FL_01F7F4: 				;			||
	LDA $1617,X					;$01F7F4	||
	CLC							;$01F7F7	|| Add 0x80 to all the tiles for some reason...?
	ADC #$80					;$01F7F8	||
	STA $1617,X					;$01F7FA	||
	DEX							;$01F7FD	||
	BPL CODE_FL_01F7F4			;$01F7FE	|/
	REP #$20					;$01F800	|
	PLB							;$01F802	|
	LDA #$8000					;$01F803	|
	TSB $00BB					;$01F806	|
	TSB $00BD					;$01F809	|
	TSB $7A1F					;$01F80C	|
	LDA #$FFFF					;$01F80F	|
	STA $00B5					;$01F812	|
	STA $00B7					;$01F815	|
	STA $00B9					;$01F818	|
	INC $00B1					;$01F81B	|
	RTS							;$01F81E	|



CODE_FL_01F81F: 				;-----------| Subroutine used by Spring Breeze/Dyna Blade to get which status bar routine to run.
	LDA #$0000					;$01F81F	|  Returns X = (2*hasPartner) + (4*inBossBattle)
	LDY $6240					;$01F822	|\ 
	BMI CODE_FL_01F82A			;$01F825	|| If the player has a partner, add 2.
	ORA #$0002					;$01F827	|/
CODE_FL_01F82A: 				;			|
	LDY HUD_BossHP					;$01F82A	|\ 
	BMI CODE_FL_01F832			;$01F82D	|| If a boss is active, add 4.
	ORA #$0004					;$01F82F	|/
CODE_FL_01F832: 				;			|
	TAX							;$01F832	|
	RTS							;$01F833	|



WriteHPBar:						;-----------| Subroutine to write HP bars for Kirby/partners/bosses. X = address to write to.
	PEA $007E					;$01F834	|  $00 - Values representing how "full" each tile is. 0   = empty, 8 = full.
	PLB							;$01F837	|  The routine after this is identical, except this routine handles 8-bit overflow on the destination.
	STX $14						;$01F838	|
	SEP #$30					;$01F83A	|
	LDY #$06					;$01F83C	|\ 
  .loop: 						;			||
	LDX $00,Y					;$01F83E	||
	LDA.l HPTileNumbers,X		;$01F840	||
	STA ($14)					;$01F844	||
	INC $14						;$01F846	|| Copy 7 tile numbers to the destination address.
	BNE .noOverflow				;$01F848	||
	INC $15						;$01F84A	||
  .noOverflow:					;			||
	DEY							;$01F84C	||
	BPL .loop					;$01F84D	|/
	REP #$30					;$01F84F	|
	PLB							;$01F851	|
	INC $00B1					;$01F852	|
	RTS							;$01F855	|



WriteHPBar2:					;-----------| Subroutine to write HP bars for Kirby/partners/bosses. X = address to write to.
	PEA $007E					;$01F856	|  $00 - Values representing how "full" each tile is. 0  = empty, 8 = full.
	PLB							;$01F859	|  Identical to the above routine, except it doesn't handle 8-bit overflow on $14.
	STX $14						;$01F85A	|
	SEP #$30					;$01F85C	|
	LDY #$06					;$01F85E	|\ 
  .loop: 						;			||
	LDX $00,Y					;$01F860	||
	LDA.l HPTileNumbers,X		;$01F862	|| Copy 7 tile numbers to the destination address.
	STA ($14),Y					;$01F866	||
	DEY							;$01F868	||
	BPL .loop					;$01F869	|/
	REP #$30					;$01F86B	|
	PLB							;$01F86D	|
	INC $00B1					;$01F86E	|
	RTS							;$01F871	|


HPTileNumbers:					;$01F872	| Tile numbers for the player/partner's HP.
	db $E0,$D7,$D6,$D5,$D4,$D3,$D2,$D1,$D0



CODE_FL_01F87B:					;-----------| Subroutine for Spring Breeze/Dyna Blade to write boss health bars. X = address to write to.
	JSR CODE_FL_01FCD5			;$01F87B	|
	BCC CODE_FL_01F898			;$01F87E	|
	SEP #$20					;$01F880	|
	LDY #$0006					;$01F882	|\ 
	LDX #$0000					;$01F885	||
CODE_FL_01F888:					;			||
	LDA $00,X					;$01F888	||
	CLC							;$01F88A	|| Copy 7 tile numbers to the destination address.
	ADC #$C7					;$01F88B	|| Each tile is 0xC7 + (fill amount)
	STA ($14),Y					;$01F88D	||
	INX							;$01F88F	||
	DEY							;$01F890	||
	BPL CODE_FL_01F888			;$01F891	|/
	REP #$20					;$01F893	|
	INC $00B1					;$01F895	|
CODE_FL_01F898:					;			|
	RTS							;$01F898	|



CODE_FL_01F899:					;-----------| Unused status bar subroutine?
	JSR CODE_FL_01FCD5			;$01F899	|
	BCC CODE_FL_01F8B6			;$01F89C	|
	SEP #$20					;$01F89E	|
	LDY #$0006					;$01F8A0	|
	LDX #$0000					;$01F8A3	|
CODE_FL_01F8A6:					;			|
	LDA $3700,Y					;$01F8A6	|
	CLC							;$01F8A9	|
	ADC #$C7					;$01F8AA	|
	STA ($14),Y					;$01F8AC	|
	DEY							;$01F8AE	|
	BPL CODE_FL_01F8A6			;$01F8AF	|
	REP #$20					;$01F8B1	|
	INC $00B1					;$01F8B3	|
CODE_FL_01F8B6:					;			|
	RTS							;$01F8B6	|



CODE_FL_01F8B7:					;-----------| Subroutine to write the player's life count into the status bar. X = address to write to4.
	LDA Lives					;$01F8B7	|
	CMP #$0064					;$01F8BA	|
	BCC CODE_FL_01F8C5			;$01F8BD	|
	LDA #$0063					;$01F8BF	|
	STA Lives					;$01F8C2	|
CODE_FL_01F8C5:					;			|
	CMP $00B9					;$01F8C5	|
	BEQ CODE_FL_01F8ED			;$01F8C8	|
	STA $00B9					;$01F8CA	|
	LDY #$FFFF					;$01F8CD	|
	SEC							;$01F8D0	|
CODE_FL_01F8D1:					;			|
	INY							;$01F8D1	|
	SBC #$000A					;$01F8D2	|
	BCS CODE_FL_01F8D1			;$01F8D5	|
	ADC #$00C0					;$01F8D7	|
	SEP #$20					;$01F8DA	|
	STA $7E0001,X				;$01F8DC	|
	TYA							;$01F8E0	|
	CLC							;$01F8E1	|
	ADC #$B6					;$01F8E2	|
	STA $7E0000,X				;$01F8E4	|
	REP #$20					;$01F8E8	|
	INC $00B1					;$01F8EA	|
CODE_FL_01F8ED:					;			|
	RTS							;$01F8ED	|



CODE_FL_01F8EE:					;-----------| Subroutine to write the score for the Great Cave Offensive. X = address to write to.
	LDA $7372					;$01F8EE	|
	LDY $7374					;$01F8F1	|
	CMP $00B5					;$01F8F4	|
	BNE CODE_FL_01F8FF			;$01F8F7	|
	CPY $00B7					;$01F8F9	|
	BNE CODE_FL_01F8FF			;$01F8FC	|
	RTS							;$01F8FE	|

CODE_FL_01F8FF: 
	CPY #$0098					;$01F8FF	|
	BCC CODE_FL_01F917			;$01F902	|
	BNE CODE_FL_01F90B			;$01F904	|
	CMP #$967F					;$01F906	|
	BCC CODE_FL_01F917			;$01F909	|
CODE_FL_01F90B:					;			|
	LDA #$967F					;$01F90B	|
	STA $7372					;$01F90E	|
	LDY #$0098					;$01F911	|
	STY $7374					;$01F914	|
CODE_FL_01F917:					;			|
	STA $00B5					;$01F917	|
	STA $00						;$01F91A	|
	STY $00B7					;$01F91C	|
	STX $14						;$01F91F	|
	LDX #$FFFF					;$01F921	|
CODE_FL_01F924:					;			|
	INX							;$01F924	|
	LDA $00						;$01F925	|
	SEC							;$01F927	|
	SBC #$4240					;$01F928	|
	STA $00						;$01F92B	|
	TYA							;$01F92D	|
	SBC #$000F					;$01F92E	|
	TAY							;$01F931	|
	BPL CODE_FL_01F924			;$01F932	|
	STX $06						;$01F934	|
	LDA $00						;$01F936	|
	CLC							;$01F938	|
	ADC #$4240					;$01F939	|
	STA $00						;$01F93C	|
	TYA							;$01F93E	|
	ADC #$000F					;$01F93F	|
	TAY							;$01F942	|
	LDA $00						;$01F943	|
	BRA CODE_FL_01F978			;$01F945	|


CODE_FL_01F947:					;```````````| Alternative entry to the above routine, for writing the score.
	LDA $7372					;$01F947	|
	LDY $7374					;$01F94A	|
	CMP $00B5					;$01F94D	|
	BNE CODE_FL_01F958			;$01F950	|
	CPY $00B7					;$01F952	|
	BNE CODE_FL_01F958			;$01F955	|
	RTS							;$01F957	|

CODE_FL_01F958: 
	CPY #$000F					;$01F958	|
	BCC CODE_FL_01F970			;$01F95B	|
	BNE CODE_FL_01F964			;$01F95D	|
	CMP #$4240					;$01F95F	|
	BCC CODE_FL_01F970			;$01F962	|
CODE_FL_01F964:					;			|
	LDA #$423F					;$01F964	|
	STA $7372					;$01F967	|
	LDY #$000F					;$01F96A	|
	STY $7374					;$01F96D	|
CODE_FL_01F970:					;			|
	STA $00B5					;$01F970	|
	STY $00B7					;$01F973	|
	STX $14						;$01F976	|
CODE_FL_01F978:					;```````````| Routine actually continues.
	LDX #$FFFF					;$01F978	|
CODE_FL_01F97B:					;			|
	INX							;$01F97B	|
	SEC							;$01F97C	|
	SBC #$86A0					;$01F97D	|
	BCS CODE_FL_01F983			;$01F980	|
	DEY							;$01F982	|
CODE_FL_01F983:					;			|
	DEY							;$01F983	|
	BPL CODE_FL_01F97B			;$01F984	|
	STX $00						;$01F986	|
	CLC							;$01F988	|
	ADC #$86A0					;$01F989	|
	BCC CODE_FL_01F98F			;$01F98C	|
	INY							;$01F98E	|
CODE_FL_01F98F:					;			|
	INY							;$01F98F	|
	LDX #$FFFF					;$01F990	|
CODE_FL_01F993:					;			|
	INX							;$01F993	|
	SEC							;$01F994	|
	SBC #$2710					;$01F995	|
	BCS CODE_FL_01F993			;$01F998	|
	DEY							;$01F99A	|
	BPL CODE_FL_01F993			;$01F99B	|
	STX $01						;$01F99D	|
	ADC #$2710					;$01F99F	|
	LDX #$FFFF					;$01F9A2	|
	SEC							;$01F9A5	|
CODE_FL_01F9A6:					;			|
	INX							;$01F9A6	|
	SBC #$03E8					;$01F9A7	|
	BCS CODE_FL_01F9A6			;$01F9AA	|
	STX $02						;$01F9AC	|
	ADC #$03E8					;$01F9AE	|
	LDX #$FFFF					;$01F9B1	|
	SEC							;$01F9B4	|
CODE_FL_01F9B5:					;			|
	INX							;$01F9B5	|
	SBC #$0064					;$01F9B6	|
	BCS CODE_FL_01F9B5			;$01F9B9	|
	STX $03						;$01F9BB	|
	ADC #$0064					;$01F9BD	|
	LDX #$FFFF					;$01F9C0	|
	SEC							;$01F9C3	|
CODE_FL_01F9C4:					;			|
	INX							;$01F9C4	|
	SBC #$000A					;$01F9C5	|
	BCS CODE_FL_01F9C4			;$01F9C8	|
	STX $04						;$01F9CA	|
	ADC #$000A					;$01F9CC	|
	SEP #$20					;$01F9CF	|
	STA $05						;$01F9D1	|
	LDX #$00FF					;$01F9D3	|
	LDA $32EA					;$01F9D6	|
	CMP #$03					;$01F9D9	|
	BNE CODE_FL_01F9F2			;$01F9DB	|
	LDA $06						;$01F9DD	|
	BNE CODE_FL_01F9E4			;$01F9DF	|
	TXA							;$01F9E1	|
	BRA CODE_FL_01F9EA			;$01F9E2	|

CODE_FL_01F9E4: 
	LDX #$0000					;$01F9E4	|
	CLC							;$01F9E7	|
	ADC #$B6					;$01F9E8	|
CODE_FL_01F9EA:					;			|
	STA ($14)					;$01F9EA	|
	INC $14						;$01F9EC	|
	BNE CODE_FL_01F9F2			;$01F9EE	|
	INC $15						;$01F9F0	|
CODE_FL_01F9F2:					;			|
	LDY #$0000					;$01F9F2	|
CODE_FL_01F9F5:					;			|
	LDA $3700,Y					;$01F9F5	|
	BNE CODE_FL_01F9FD			;$01F9F8	|
	TXA							;$01F9FA	|
	BNE CODE_FL_01FA03			;$01F9FB	|
CODE_FL_01F9FD:					;			|
	LDX #$0000					;$01F9FD	|
	CLC							;$01FA00	|
	ADC #$B6					;$01FA01	|
CODE_FL_01FA03:					;			|
	STA ($14),Y					;$01FA03	|
	INY							;$01FA05	|
	CPY #$0005					;$01FA06	|
	BCC CODE_FL_01F9F5			;$01FA09	|
	LDA $3700,Y					;$01FA0B	|
	CLC							;$01FA0E	|
	ADC #$B6					;$01FA0F	|
	STA ($14),Y					;$01FA11	|
	INY							;$01FA13	|
	LDA $32EA					;$01FA14	|
	CMP #$03					;$01FA17	|
	BEQ CODE_FL_01FA1F			;$01FA19	|
	LDA #$B6					;$01FA1B	|
	STA ($14),Y					;$01FA1D	|
CODE_FL_01FA1F:					;			|
	REP #$20					;$01FA1F	|
	INC $00B1					;$01FA21	|
	RTS							;$01FA24	|



CODE_FN_01FA25:					;-----------| Subroutine to handle Kirby's powerup icon.
	LDX $7388					;$01FA25	|\ Branch if no icon override in place.
	BEQ CODE_FL_01FA6B			;$01FA28	|/
	LDA $738A					;$01FA2A	|\ 
	BEQ CODE_FL_01FA39			;$01FA2D	|| Branch if the override timer is already 0 or hasn't run out yet.
	DEC $738A					;$01FA2F	||
	BNE CODE_FL_01FA39			;$01FA32	|/
	STZ $7388					;$01FA34	| Timer ran out, so clear the override...
	BRA CODE_FL_01FA6B			;$01FA37	| ...and branch down to draw the normal icon.

CODE_FL_01FA39:					;```````````| Powerup icon is being overridden.
	SEP #$10					;$01FA39	|
	CPX $7389					;$01FA3B	|\ 
	BEQ CODE_FL_01FA68			;$01FA3E	|| Return if the image hasn't changed.
	STX $7389					;$01FA40	|/
	TXA							;$01FA43	|\ If the new image is 0, branch to the normal icon routine?
	BEQ CODE_FL_01FA6B			;$01FA44	|/  This shouldn't happen though, so essentially unused.
	AND #$00FF					;$01FA46	|\ 
	CMP #$000E					;$01FA49	|| If the image is set to 0x0E+, branch to switch it to 0x1C (a white box) instead.
	BCS CODE_FL_01FA59			;$01FA4C	|/
	CLC							;$01FA4E	|\ Increment index for the icon.
	ADC #$0020					;$01FA4F	|/
	BRA CODE_FL_01FA81			;$01FA52	| Done, now go upload the icon.


CODE_FL_01FA54:					;```````````| Powerup image is 00 and not being overwritten; turn it white instead. 
	SEP #$20					;$01FA54	|
	STA $7385					;$01FA56	|
CODE_FL_01FA59:					;			|
	REP #$30					;$01FA59	|
	LDX #$001C					;$01FA5B	|\ 
	LDA #$7FFF					;$01FA5E	||
CODE_FL_01FA61:					;			||
	STA $1539,X					;$01FA61	|| Change colors $11-$1F to white.
	DEX							;$01FA64	||
	DEX							;$01FA65	||
	BPL CODE_FL_01FA61			;$01FA66	|/
CODE_FL_01FA68:					;			|
	REP #$30					;$01FA68	|
	RTS							;$01FA6A	|

CODE_FL_01FA6B:					;```````````| Powerup icon is not being overridden; draw the normal one.
	LDA $7384					;$01FA6B	|\ 
	XBA							;$01FA6E	|| Return if the powerup icon hasn't changed.
	CMP $7384					;$01FA6F	||
	BEQ CODE_FL_01FA68			;$01FA72	|/
	XBA							;$01FA74	|\ 
	AND #$00FF					;$01FA75	|| If the new image is 0, white out the powerup's colors instead and return.
	BEQ CODE_FL_01FA54			;$01FA78	|/
	CMP #$0021					;$01FA7A	|\ If the image is > = 0x21, return.
	BCS CODE_FL_01FA68			;$01FA7D	|/
	SEP #$10					;$01FA7F	|
CODE_FL_01FA81:					;```````````| All icons join back up to actually draw it. A = index to use.
	TAX							;$01FA81	|
	LDA $3012					;$01FA82	|\ 
	CMP #$7D7F					;$01FA85	||
	BCS CODE_FL_01FA68			;$01FA88	|| If the decompression buffer is full,
	LDA $3019					;$01FA8A	||  or too much data is being uploaded,
	CLC							;$01FA8D	||  wait until the next frame to update.
	ADC #$02E6					;$01FA8E	||
	CMP $301B					;$01FA91	||
	BCS CODE_FL_01FA68			;$01FA94	|/
	STX $7385					;$01FA96	|
	REP #$10					;$01FA99	|
	TXA							;$01FA9B	|\ 
	DEC A						;$01FA9C	||
	STA $00						;$01FA9D	|| Multiply image ID by 3 to get pointer index.
	ASL A						;$01FA9F	||
	ADC $00						;$01FAA0	||
	STA $00						;$01FAA2	|/
	TAX							;$01FAA4	|
	LDA.l DATA_01FDC8+2,X		;$01FAA5	|\ 
	TAY							;$01FAA9	||
	LDA.l DATA_01FDC8,X			;$01FAAA	|| Transfer 15 bytes from the pointer to $11-$1F.
	TYX							;$01FAAE	|| Gets the palette for the image.
	LDY #$110F					;$01FAAF	||
	JSL WriteStatusPal			;$01FAB2	|/
	LDA $3012					;$01FAB6	|\ 
	STA $34						;$01FAB9	||
	CLC							;$01FABB	|| Decompress the data in the pointer and set up a DMA to it.
	ADC #$0280					;$01FABC	||
	STA $3012					;$01FABF	||
	LDX $00						;$01FAC2	||
	LDA.l DATA_01FE4F+2,X		;$01FAC4	||
	TAY							;$01FAC8	||
	LDA.l DATA_01FE4F,X			;$01FAC9	||
	TAX							;$01FACD	||
	TYA							;$01FACE	||
	LDY $34						;$01FACF	||
	PEA $007E					;$01FAD1	||
	PLB							;$01FAD4	||
	JSL DecompressData			;$01FAD5	||
	PLB							;$01FAD9	||
	LDA #$0003					;$01FADA	||
	STA $31						;$01FADD	||
	LDA #$0280					;$01FADF	||\ Size is 0x280 bytes.
	STA $32						;$01FAE2	||/
	LDA #$007E					;$01FAE4	||
	STA $36						;$01FAE7	||
	LDA #$58E0					;$01FAE9	||\ Destination is $58E0.
	STA.B CameraX_TileMirror						;$01FAEC	||/
	JSL WriteToDMABuffer		;$01FAEE	|/
	RTS							;$01FAF2	|



CODE_FL_01FAF3:					;-----------| Subroutine to handle the partner's icon.
	LDY $6240					;$01FAF3	|\ Return if no partner is active?
	BMI CODE_FL_01FB33			;$01FAF6	|/
	LDA $738C					;$01FAF8	|\ Return if the partner has been stolen by T.A.C. and already had its image switched.
	BMI CODE_FL_01FB33			;$01FAFB	|/
	AND #$00FF					;$01FAFD	|\ 
	BEQ CODE_FL_01FB10			;$01FB00	||
	SEP #$20					;$01FB02	||
	LDA #$FF					;$01FB04	|| If the partner has been stolen by T.A.C, use image 0x15.
	STA $738D					;$01FB06	||
	LDA #$15					;$01FB09	||| Image for when the partner is stolen by T.A.C.
	STA $7386					;$01FB0B	||
	REP #$20					;$01FB0E	|/
CODE_FL_01FB10:					;			|
	LDA $7386					;$01FB10	|\ 
	XBA							;$01FB13	|| Return if the partner icon hasn't changed.
	CMP $7386					;$01FB14	||
	BEQ CODE_FL_01FB33			;$01FB17	|/
	XBA							;$01FB19	|\ 
	AND #$00FF					;$01FB1A	|| If non-zero, branch to draw the image. Else, continue below to turn the image white.
	BNE CODE_FL_01FB34			;$01FB1D	|/
	SEP #$20					;$01FB1F	|
	STA $7385					;$01FB21	|
	REP #$20					;$01FB24	|
	LDX #$001C					;$01FB26	|\ 
	LDA #$7FFF					;$01FB29	||
CODE_FL_01FB2C:					;			||
	STA $1559,X					;$01FB2C	|| Change colors $21-$2F to white.
	DEX							;$01FB2F	||
	DEX							;$01FB30	||
	BPL CODE_FL_01FB2C			;$01FB31	|/
CODE_FL_01FB33:					;			|
	RTS							;$01FB33	|

CODE_FL_01FB34:					;```````````| Partner image is not white.
	LDA $3012					;$01FB34	|\ 
	CMP #$7D7F					;$01FB37	||
	BCS CODE_FL_01FB33			;$01FB3A	|| If the decompression buffer is full,
	LDA $3019					;$01FB3C	||  or too much data is being uploaded,
	CLC							;$01FB3F	||  wait until the next frame to update.
	ADC #$02E6					;$01FB40	||
	CMP $301B					;$01FB43	||
	BCS CODE_FL_01FB33			;$01FB46	|/
	LDA $7386					;$01FB48	|\ 
	AND #$00FF					;$01FB4B	|| Also return if the icon ID is > = 0x16.
	CMP #$0016					;$01FB4E	||
	BCS CODE_FL_01FB33			;$01FB51	|/
	SEP #$20					;$01FB53	|
	STA $7387					;$01FB55	|
	REP #$20					;$01FB58	|
	DEC A						;$01FB5A	|\ 
	STA $00						;$01FB5B	||
	ASL A						;$01FB5D	|| Multiply image ID by 3 to get pointer index.
	ADC $00						;$01FB5E	||
	STA $00						;$01FB60	|/
	TAX							;$01FB62	|
	LDA.l DATA_01FED6+2,X		;$01FB63	|\ 
	TAY							;$01FB67	||
	LDA.l DATA_01FED6,X			;$01FB68	|| Transfer 15 colors from the pointer to $21-$2F.
	TYX							;$01FB6C	||
	LDY #HW_BG2HOFS					;$01FB6D	||
	JSL WriteStatusPal			;$01FB70	|/
	LDA $3012					;$01FB74	|\ 
	STA $34						;$01FB77	||
	CLC							;$01FB79	|| Decompress the data in the pointer and set up a DMA to it.
	ADC #$0280					;$01FB7A	||
	STA $3012					;$01FB7D	||
	LDX $00						;$01FB80	||
	LDA.l DATA_01FF15+2,X		;$01FB82	||
	TAY							;$01FB86	||
	LDA.l DATA_01FF15,X			;$01FB87	||
	TAX							;$01FB8B	||
	TYA							;$01FB8C	||
	LDY $34						;$01FB8D	||
	PEA $007E					;$01FB8F	||
	PLB							;$01FB92	||
	JSL DecompressData			;$01FB93	||
	PLB							;$01FB97	||
	LDA #$0003					;$01FB98	||
	STA $31						;$01FB9B	||
	LDA #$0280					;$01FB9D	||
	STA $32						;$01FBA0	||
	LDA #$007E					;$01FBA2	||
	STA $36						;$01FBA5	||
	LDA #$5A20					;$01FBA7	||
	STA.B CameraX_TileMirror						;$01FBAA	||
	JSL WriteToDMABuffer		;$01FBAC	|/
	RTS							;$01FBB0	|



WriteStatusPal:					;-----------| Subroutine to write N colors to the status bar palette starting at a specified color.
	STA $14						;$01FBB1	|  A    = Lower 16 bits of source, X = Upper 8 bits of source
	STX $16						;$01FBB3	|  Y    = Starting color (high byte) and number of colors (low byte)
	TYA							;$01FBB5	|\  
	AND #$FF00					;$01FBB6	||
	XBA							;$01FBB9	|| Get address to start writing at.
	ASL A						;$01FBBA	||
	ADC #$1517					;$01FBBB	||
	STA $18						;$01FBBE	|/
	TYA							;$01FBC0	|\ 
	DEC A						;$01FBC1	||
	ASL A						;$01FBC2	|| Get number of colors.
	AND #$00FF					;$01FBC3	||
	TAY							;$01FBC6	|/
  .loop:					;			|
	LDA [$14],Y					;$01FBC7	|\ 
	STA ($18),Y					;$01FBC9	||
	DEY							;$01FBCB	|| Copy all the colors.
	DEY							;$01FBCC	||
	BPL .loop					;$01FBCD	|/
	RTL							;$01FBCF	|



CODE_FL_01FBD0:					;-----------| Subroutine which most likely checks whether to update Kirby's HP bar.
	STX $14						;$01FBD0	|
	LDA KirbyHP					;$01FBD2	|
	BPL CODE_FL_01FBDA			;$01FBD5	|
	LDA #$0000					;$01FBD7	|
CODE_FL_01FBDA:					;			|
	TAX							;$01FBDA	|
	BNE CODE_FL_01FBE2			;$01FBDB	|
	INC $00DB					;$01FBDD	|
	BRA CODE_FL_01FBE5			;$01FBE0	|

CODE_FL_01FBE2: 
	STZ $00DB					;$01FBE2	|
CODE_FL_01FBE5:					;			|
	CMP $7380					;$01FBE5	|
	BCC CODE_FL_01FBED			;$01FBE8	|
	LDA $7380					;$01FBEA	|
CODE_FL_01FBED:					;			|
	STA $49						;$01FBED	|
	LDA $7380					;$01FBEF	|
	STA $4B						;$01FBF2	|
	LDA #$FD52					;$01FBF4	|\ 
	LDX #$0001					;$01FBF7	|| Wait for the SA-1 chip to execute $01FD52.
	JSL SNES_ExecuteSA1			;$01FBFA	|/
	LDA $00BB					;$01FBFE	|
	CMP #$FFFF					;$01FC01	|
	BNE CODE_FL_01FC0A			;$01FC04	|
	LDA $49						;$01FC06	|
	BRA CODE_FL_01FC32			;$01FC08	|

CODE_FL_01FC0A: 
	CMP $49						;$01FC0A	|
	BNE CODE_FL_01FC16			;$01FC0C	|
	STZ $00CF					;$01FC0E	|
	STZ $00D5					;$01FC11	|
	CLC							;$01FC14	|
	RTS							;$01FC15	|

CODE_FL_01FC16: 
	AND #$7FFF					;$01FC16	|
	CMP $49						;$01FC19	|
	BEQ CODE_FL_01FC32			;$01FC1B	|
	BCS CODE_FL_01FC2B			;$01FC1D	|
	JSR CODE_FL_01FC43			;$01FC1F	|
	INC $00CF					;$01FC22	|
	STZ $00D5					;$01FC25	|
	INC A						;$01FC28	|
	BRA CODE_FL_01FC32			;$01FC29	|

CODE_FL_01FC2B: 
	STZ $00CF					;$01FC2B	|
	INC $00D5					;$01FC2E	|
	DEC A						;$01FC31	|
CODE_FL_01FC32:					;			|
	STA $00BB					;$01FC32	|
	STZ $00E1					;$01FC35	|
	CMP #$000E					;$01FC38	|
	BCS CODE_FL_01FC40			;$01FC3B	|
	INC $00E1					;$01FC3D	|
CODE_FL_01FC40:					;			|
	JMP $FD35					;$01FC40	|


CODE_FL_01FC43:					;```````````| Subroutine used by the above.
	PHA							;$01FC43	|
	LDA Screen_Brightness					;$01FC44	|
	AND #$0080					;$01FC47	|
	BNE CODE_FL_01FC60			;$01FC4A	|
	LDA $7A97					;$01FC4C	|
	BNE CODE_FL_01FC60			;$01FC4F	|
	LDA $3094					;$01FC51	|
	AND #$0003					;$01FC54	|
	BNE CODE_FL_01FC60			;$01FC57	|
	LDA #$0046					;$01FC59	|
	JSL PlaySFX			;$01FC5C	|
CODE_FL_01FC60: 				;			|
	PLA							;$01FC60	|
	RTS							;$01FC61	|



CODE_FL_01FC62:					;-----------| Subroutine which most likely checks whether to update the partner's HP bar.
	STX $14						;$01FC62	|
	LDA HelperHP					;$01FC64	|
	BPL CODE_FL_01FC6C			;$01FC67	|
	LDA #$0000					;$01FC69	|
CODE_FL_01FC6C:					;			|
	TAX							;$01FC6C	|
	BNE CODE_FL_01FC74			;$01FC6D	|
	INC $00DD					;$01FC6F	|
	BRA CODE_FL_01FC77			;$01FC72	|

CODE_FL_01FC74: 
	STZ $00DD					;$01FC74	|
CODE_FL_01FC77:					;			|
	CMP $7382					;$01FC77	|
	BCC CODE_FL_01FC7F			;$01FC7A	|
	LDA $7382					;$01FC7C	|
CODE_FL_01FC7F:					;			|
	STA $49						;$01FC7F	|
	LDA $7382					;$01FC81	|
	STA $4B						;$01FC84	|
	LDA #$FD52					;$01FC86	|\ 
	LDX #$0001					;$01FC89	|| Wait for the SA-1 chip to execute $01FD52.
	JSL SNES_ExecuteSA1			;$01FC8C	|/
	LDA $00BD					;$01FC90	|
	CMP #$FFFF					;$01FC93	|
	BNE CODE_FL_01FC9C			;$01FC96	|
	LDA $49						;$01FC98	|
	BRA CODE_FL_01FCC4			;$01FC9A	|

CODE_FL_01FC9C: 
	CMP $49						;$01FC9C	|
	BNE CODE_FL_01FCA8			;$01FC9E	|
	STZ $00D1					;$01FCA0	|
	STZ $00D7					;$01FCA3	|
	CLC							;$01FCA6	|
	RTS							;$01FCA7	|

CODE_FL_01FCA8: 
	AND #$7FFF					;$01FCA8	|
	CMP $49						;$01FCAB	|
	BEQ CODE_FL_01FCC4			;$01FCAD	|
	BCS CODE_FL_01FCBD			;$01FCAF	|
	JSR CODE_FL_01FC43			;$01FCB1	|
	INC $00D1					;$01FCB4	|
	STZ $00D7					;$01FCB7	|
	INC A						;$01FCBA	|
	BRA CODE_FL_01FCC4			;$01FCBB	|

CODE_FL_01FCBD: 
	STZ $00D1					;$01FCBD	|
	INC $00D7					;$01FCC0	|
	DEC A						;$01FCC3	|
CODE_FL_01FCC4: 				;			|
	STA $00BD					;$01FCC4	|
	STZ $00E3					;$01FCC7	|
	CMP #$000E					;$01FCCA	|
	BCS CODE_FL_01FCD2			;$01FCCD	|
	INC $00E3					;$01FCCF	|
CODE_FL_01FCD2: 				;			|
	JMP CODE_FL_01FD35			;$01FCD2	|



CODE_FL_01FCD5:					;-----------| Subroutine which most likely checks whether to update the boss's HP bar.
	LDA HUD_BossHP				;$01FCD5	|\ Branch if a boss is actually active.
	BPL CODE_FL_01FCE2			;$01FCD8	|/
CODE_FL_01FCDA: 				;			|
	STZ $00D3					;$01FCDA	|
	STZ $00D9					;$01FCDD	|
	CLC							;$01FCE0	|
	RTS							;$01FCE1	|

CODE_FL_01FCE2: 
	BNE CODE_FL_01FCE9			;$01FCE2	|
	INC $00DF					;$01FCE4	|
	BRA CODE_FL_01FCEC			;$01FCE7	|

CODE_FL_01FCE9: 
	STZ $00DF					;$01FCE9	|
CODE_FL_01FCEC: 				;			|
	STX $14						;$01FCEC	|
	CMP HUD_BossMaxHP			;$01FCEE	|
	BCC CODE_FL_01FCF6			;$01FCF1	|
	LDA HUD_BossMaxHP			;$01FCF3	|
CODE_FL_01FCF6: 				;			|
	STA $49						;$01FCF6	|
	LDA HUD_BossMaxHP			;$01FCF8	|
	STA $4B						;$01FCFB	|
	LDA #$FD52					;$01FCFD	|\ 
	LDX #$0001					;$01FD00	|| Wait for the SA-1 chip to execute $01FD52.
	JSL SNES_ExecuteSA1			;$01FD03	|/
	LDA $7A1F					;$01FD07	|
	BPL CODE_FL_01FD11			;$01FD0A	|
	AND #$7FFF					;$01FD0C	|
	BRA CODE_FL_01FD27			;$01FD0F	|

CODE_FL_01FD11: 
	CMP $49						;$01FD11	|
	BEQ CODE_FL_01FCDA			;$01FD13	|
	BCS CODE_FL_01FD20			;$01FD15	|
	INC $00D3					;$01FD17	|
	STZ $00D9					;$01FD1A	|
	INC A						;$01FD1D	|
	BRA CODE_FL_01FD27			;$01FD1E	|

CODE_FL_01FD20: 
	STZ $00D3					;$01FD20	|
	INC $00D9					;$01FD23	|
	DEC A						;$01FD26	|
CODE_FL_01FD27:					;			|
	STA $7A1F					;$01FD27	|
	STZ $00E5					;$01FD2A	|
	CMP #$000E					;$01FD2D	|
	BCS CODE_FL_01FD35			;$01FD30	|
	INC $00E5					;$01FD32	|
CODE_FL_01FD35:					;			|
	LDX #$0006					;$01FD35	|
	SEP #$20					;$01FD38	|
CODE_FL_01FD3A:					;			|
	TAY							;$01FD3A	|
	CMP #$08					;$01FD3B	|
	BCC CODE_FL_01FD41			;$01FD3D	|
	LDA #$08					;$01FD3F	|
CODE_FL_01FD41:					;			|
	STA $00,X					;$01FD41	|
	TYA							;$01FD43	|
	SEC							;$01FD44	|
	SBC #$08					;$01FD45	|
	BCS CODE_FL_01FD4B			;$01FD47	|
	LDA #$00					;$01FD49	|
CODE_FL_01FD4B:					;			|
	DEX							;$01FD4B	|
	BPL CODE_FL_01FD3A			;$01FD4C	|
	REP #$20					;$01FD4E	|
	SEC							;$01FD50	|
	RTS							;$01FD51	|



CODE_FL_01FD52:					;-----------| SA-1 subroutine called in a couple of the above routines.
	LDY $4B						;$01FD52	|
	CPY $49						;$01FD54	|
	BNE CODE_FL_01FD5E			;$01FD56	|
	LDA #$0038					;$01FD58	|
	STA $49						;$01FD5B	|
	RTL							;$01FD5D	|

CODE_FL_01FD5E: 
	LDA #$0001					;$01FD5E	|
	STA $2250					;$01FD61	|
	LDA #$7000					;$01FD64	|
	STA $2251					;$01FD67	|
	STY $2253					;$01FD6A	|
	LDY $49						;$01FD6D	|
	LDA $2306					;$01FD6F	|
	STZ $2250					;$01FD72	|
	STY $2251					;$01FD75	|
	STA $2253					;$01FD78	|
	NOP							;$01FD7B	|
	LDA $2307					;$01FD7C	|
	LSR A						;$01FD7F	|
	ADC #$0000					;$01FD80	|
	STA $49						;$01FD83	|
	RTL							;$01FD85	|


DATA_01FD86:					;$01FD86	| Pointers to the base palette for each subgame's status bar.
	dl $EF26A0					; 0 - Spring Breeze
	dl $EF2700					; 1 - Dyna Blade
	dl $EFD8ED					; 2 - Gourmet Race
	dl $EEA300					; 3 - The Great Cave Offensive
	dl $EEA380					; 4 - Revenge of Meta-Knight
	dl $EEA400					; 5 - Milky Way Wishes
	dl $EF2880					; 6 - The Arena
	dl $EF2880					; 7 - Sound Test
	dl $EF2880					; 8 - Guide / Minigame
	dl $EF2880					; 9 - Unused
	dl $EF2880					; A - Unused

DATA_01FDA7:					;$01FDA7	| Pointers to the base graphics for each subgame's status bar.
	dl $E7DBCB					; 0 - Spring Breeze
	dl $E7A69C					; 1 - Dyna Blade
	dl $E7F4B8					; 2 - Gourmet Race (note: may pull from $E7A1F2 instead)
	dl $E59E58					; 3 - The Great Cave Offensive
	dl $E7F8D2					; 4 - Revenge of Meta-Knight
	dl $E776CB					; 5 - Milky Way Wishes
	dl $E67A83					; 6 - The Arena
	dl $E67A83					; 7 - Sound Test
	dl $E67A83					; 8 - Guide / Minigame
	dl $E67A83					; 9 - Unused
	dl $E67A83					; A - Unused



DATA_01FDC8:					;$01FDC8	| Pointers to palettes for Kirby's powerup icon.
	dl $EFDE90					; 01 - Yoyo
	dl $EFDEAE					; 02 - Bomb
	dl $EFDECC					; 03 - Ice
	dl $EFDEEA					; 04 - Sword
	dl $EFDF08					; 05 - Fire
	dl $EFDF26					; 06 - Wing
	dl $EFDF44					; 07 - Cutter
	dl $EFDF62					; 08 - Beam
	dl $EFDF80					; 09 - Fighter
	dl $EFDF9E					; 0A - Mirror
	dl $EFDFBC					; 0B - Wheel
	dl $EFDFDA					; 0C - Ninja
	dl $EFE016					; 0D - Stone
	dl $EFE034					; 0E - Hammer
	dl $EFE052					; 0F - Jet
	dl $EFE070					; 10 - Parasol
	dl $EFE08E					; 11 - Plasma
	dl $EFE232					; 12 - Copy
	dl $EFE250					; 13 - Suplex
	dl $EFE35E					; 14 - Kirby (star ship)
	dl $EFE26E					; 15 - Kirby (normal)
	dl $EFE28C					; 16 - Crash
	dl $EFE2AA					; 17 - Sleep
	dl $EFE2C8					; 18 - Cook
	dl $EFE2E6					; 19 - Paint
	dl $EFE304					; 1A - Mike 1
	dl $EFE322					; 1B - Mike 2
	dl $EFE340					; 1C - Mike 3
	dl $EFE0E8					; 1D - Super (unused)
	dl $EFE17E					; 1E - Ouch (unused)
	dl $EFE0CA					; 1F - Mix (unused)
	dl $EFE160					; 20 - Wheelie Rider (unused)
	dl $EFE0AC					; 21 - クリア (clear in japanese, unused)
	dl $EFE0CA					; 22 - Mix
	dl $EFE0E8					; 23 - Super
	dl $EFE106					; 24 - Cannon
	dl $EFE124					; 25 - Trolley
	dl $EFE142					; 26 - ゴール (goal in Japanese, unused)
	dl $EFE160					; 27 - Wheelie Rider
	dl $EFE17E					; 28 - Ouch!
	dl $EFE19C					; 29 - I'm HIT.
	dl $EFE1BA					; 2A - Let's go
	dl $EFE1D8					; 2B - 怒 (anger in Japanese, unused)
	dl $EFE1F6					; 2C - No good!
	dl $EFE214					; 2D - Warp star

DATA_01FE4F:					;$01FE4F	| Pointers to graphics for Kirby's powerup icon.
	dl $EA03A1					; 01 - Yoyo
	dl $E96553					; 02 - Bomb
	dl $E953C8					; 03 - Ice
	dl $E9DE99					; 04 - Sword
	dl $E9920D					; 05 - Fire
	dl $E960F7					; 06 - Wing
	dl $E94D0A					; 07 - Cutter
	dl $E93AEB					; 08 - Beam
	dl $E94885					; 09 - Fighter
	dl $E95A67					; 0A - Mirror
	dl $E98131					; 0B - Wheel
	dl $E941BC					; 0C - Ninja
	dl $E97688					; 0D - Stone
	dl $E92D18					; 0E - Hammer
	dl $E97CEF					; 0F - Jet
	dl $E9A283					; 10 - Parasol
	dl $E96DF7					; 11 - Plasma
	dl $E94AC8					; 12 - Copy
	dl $E98352					; 13 - Suplex
	dl $E909B1					; 14 - Kirby (star ship)
	dl $E98DDF					; 15 - Kirby (normal)
	dl $E91F0F					; 16 - Crash
	dl $E9340A					; 17 - Sleep
	dl $E95834					; 18 - Cook
	dl $E95EC8					; 19 - Paint
	dl $E96325					; 1A - Mike 1
	dl $E92AC3					; 1B - Mike 2
	dl $E97F10					; 1C - Mike 3
	dl $E99632					; 1D - Super (unused)
	dl $E9B299					; 1E - Ouch (unused)
	dl $E90C17					; 1F - Mix (unused)
	dl $E910E1					; 20 - Wheelie Rider (unused)
	dl $E8EB66					; 21 - クリア (clear in japanese, unused)
	dl $E90C17					; 22 - Mix
	dl $E99632					; 23 - Super
	dl $E9878E					; 24 - Cannon
	dl $E95600					; 25 - Trolley
	dl $E96BD0					; 26 - ゴール (goal in Japanese, unused)
	dl $E910E1					; 27 - Wheelie Rider
	dl $E9B299					; 28 - Ouch!
	dl $EA289A					; 29 - I'm HIT.
	dl $E9E667					; 2A - Let's go
	dl $E92617					; 2B - 怒 (anger in Japanese, unused)
	dl $E8DEED					; 2C - No good!
	dl $E9FB06					; 2D - Warp star



DATA_01FED6:					;$01FED6	| Pointers to palettes for the partner's icon.
	dl $EFE3D6					; 01 - Gim
	dl $EFE3F4					; 02 - Poppy Bros.Jr.
	dl $EFE412					; 03 - Chilly
	dl $EFE430					; 04 - Blade Knight
	dl $EFE44E					; 05 - Burnin' Leo
	dl $EFE46C					; 06 - Birdon
	dl $EFE48A					; 07 - Sir Kibble
	dl $EFE4A8					; 08 - Waddle Doo
	dl $EFE4C6					; 09 - Knuckle Joe
	dl $EFE53E					; 0A - Simirror
	dl $EFE55C					; 0B - Wheelie
	dl $EFE57A					; 0C - Biospark
	dl $EFE598					; 0D - Rocky
	dl $EFE5B6					; 0E - Bonkers
	dl $EFDCEC					; 0F - Capsule-J
	dl $EFDD0A					; 10 - Parasol W.Dee
	dl $EFDD28					; 11 - Plasma Wisp
	dl $EFDD46					; 12 - T.A.C.
	dl $EFDD64					; 13 - Bugzzy
	dl $EFDDBE					; 14 - Helper
	dl $EFDDA0					; 15 - Help! (if T.A.C. steals the partner)

DATA_01FF15:					;$01FF15	| Pointers to graphics for the partner's icon.
	dl $E969A8					; 01 - Gim
	dl $E8F539					; 02 - Poppy Bros.Jr.
	dl $E90E7D					; 03 - Chilly
	dl $E917FE					; 04 - Blade Knight
	dl $E8FA1B					; 05 - Burnin' Leo
	dl $E93D34					; 06 - Birdon
	dl $E938A2					; 07 - Sir Kibble
	dl $E9677F					; 08 - Waddle Doo
	dl $E8E3EB					; 09 - Knuckle Joe
	dl $E9518C					; 0A - Simirror
	dl $E9E28D					; 0B - Wheelie
	dl $E93F78					; 0C - Biospark
	dl $E99A54					; 0D - Rocky
	dl $E8FC8A					; 0E - Bonkers
	dl $E98571					; 0F - Capsule-J
	dl $E95C99					; 10 - Parasol W.Dee
	dl $E989AA					; 11 - Plasma Wisp
	dl $E9701C					; 12 - T.A.C.
	dl $E98BC6					; 13 - Bugzzy
	dl $E97464					; 14 - Helper
	dl $E97240					; 15 - Help! (if T.A.C. steals the partner)



DATA_01FF54: 				;$01FF54	| DMA table.
	db $03 : dw $0940 : dl $7E2000 : dw $5B60		; 2-byte DMA; 0x940 bytes from $7E2000 to $5B60.
	db $06 : dw $0500 : dl $01FF65 : dw $58E0		; 2-byte fixed DMA; 0x500 bytes from $01FF65 ($FF) to $58E0.
	db $FF

DATA_01FF65: 					;$01FF65	| Fixed-transfer DMA source used by the above table.
	db $FF



DATA_01FF66: 					;$01FF66	| Pointers to character palettes for the textboxes in Revenge of Meta-Knight.
	dl $EFDE36					; 00 - Waddle Dee - Normal
	dl $EFDE36					; 01 - Waddle Dee - Shocked
	dl $EFDE54					; 02 - Axe Knight - Normal
	dl $EFDE54					; 03 - Axe Knight - Shocked
	dl $EFDE54					; 04 - Axe Knight - Crying
	dl $EFE37C					; 05 - Mace Knight - Normal 
	dl $EFE37C					; 06 - Mace Knight - Shocked
	dl $EFE37C					; 07 - Mace Knight - Crying
	dl $EFE3B8					; 08 - Meta-Knight - Normal
	dl $EFE3B8					; 09 - Meta-Knight - Angry
	dl $EFDDFA					; 0A - Captain Vul - Normal
	dl $EFDDFA					; 0B - Captain Vul - Happy
	dl $EFDDFA					; 0C - Captain Vul - Crying
	dl $EFDDFA					; 0D - Captain Vul - Shocked
	dl $EFDDFA					; 0E - Captain Vul - Sad
	dl $EFDDFA					; 0F - Captain Vul - Angry

DATA_01FF96: 					;$01FF96	| Pointers to character images for the textboxes in Revenge of Meta-Knight.
	dl $E943FF					; 00 - Waddle Dee - Normal
	dl $EA0000					; 01 - Waddle Dee - Shocked
	dl $E5FD9D					; 02 - Axe Knight - Normal
	dl $E90746					; 03 - Axe Knight - Shocked
	dl $EA8125					; 04 - Axe Knight - Crying
	dl $EA0AD5					; 05 - Mace Knight - Normal 
	dl $E978AB					; 06 - Mace Knight - Shocked
	dl $E9286E					; 07 - Mace Knight - Crying
	dl $E931BE					; 08 - Meta-Knight - Normal
	dl $E91341					; 09 - Meta-Knight - Angry
	dl $E8F2C7					; 0A - Captain Vul - Normal
	dl $E91A5A					; 0B - Captain Vul - Happy
	dl $E90000					; 0C - Captain Vul - Crying
	dl $E92168					; 0D - Captain Vul - Shocked
	dl $E8F7AA					; 0E - Captain Vul - Sad
	dl $E9026E					; 0F - Captain Vul - Angry



DATA_01FFC6:					;$01FFC6	| Pointers to ???
	dl $EFD147					; 00
	dl $EFD16F					; 01
	dl $EFD197					; 02
	dl $EFD1BF					; 03
	dl $DDFFD8					; 04
	dl $EFD057					; 05
	dl $EFD07F					; 06
	dl $EFD0A7					; 07



DATA_01FFDE:					;$01FFDE	| DMA table.
	db $83 : dw $0240 : dl $CDDCAB : dw $5A20		; Decompress and DMA 0x240 bytes from $CDDCAB to $5A20.
	db $FF



Empty01FFE7:
	padbyte $FF : pad $01FFFF