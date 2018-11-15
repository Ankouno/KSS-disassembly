Unused008000:				; $008000	| ...Unused?
	db $EA,$EA,$EA,$EA

Reset_SNES:					;-----------| SNES RESET vector; game boots to here.
	SEI						;$008004	| Disable IRQ.
	CLC						;$008005	|\ Disable emulation mode.
	XCE						;$008006	|/
	SEP #$20				;$008007	|
	REP #$10				;$008009	|
	LDX #$1FFF				;$00800B	|\ Fix stack at $7E1FFF.
	TXS						;$00800E	|/
	PHK						;$00800F	|
	PLB						;$008010	|
	STZ $4200				;$008011	| Disable IRQ, NMI and joypad reading.
	
	PEA $2100				;$008014	|\ Change DP to $21xx.
	PLD						;$008017	|/
	LDA #$8F				;$008018	|\ Enable force blank.
	STA $00					;$00801A	|/
	LDA #$63				;$00801C	|\ Set OAM chracter sizes to be either 16x16 or 32x32.
	STA $01					;$00801E	|/  Set sprite GFX to start at VRAM address $6000.
	STZ $02					;$008020	|\ Clear initial OAM address.
	STZ $03					;$008022	|/
	LDA #$04				;$008024	|\ Start game in mode 4 (8bpp BG1, 2bpp BG2, offset-per-tile).
	STA $05					;$008026	|/
	STZ $06					;$008028	| No mosaic effect.
	STZ $0D					;$00802A	|\ 
	STZ $0D					;$00802C	|| Clear initial layer X/Y positions.
	STZ $0E					;$00802E	||
	STZ $0E					;$008030	||
	STZ $0F					;$008032	||
	STZ $0F					;$008034	||
	STZ $10					;$008036	||
	STZ $10					;$008038	||
	STZ $11					;$00803A	||
	STZ $11					;$00803C	||
	STZ $12					;$00803E	||
	STZ $12					;$008040	||
	STZ $13					;$008042	||
	STZ $13					;$008044	||
	STZ $14					;$008046	||
	STZ $14					;$008048	|/
	LDA #$80				;$00804A	|\ Set VRAM control to word increment.
	STA $15					;$00804C	|/
	STZ $16					;$00804E	|\ Clear initial VRAM address.
	STZ $17					;$008050	|/
	STZ $1A					;$008052	|\ 
	STZ $1B					;$008054	||
	LDA #$01				;$008056	|| Initialize Mode 7 registers.
	STA $1B					;$008058	|| Everything is set to 0,
	STZ $1C					;$00805A	||  except matrix parameter A (set to 0100 for the standard scaling).
	STZ $1C					;$00805C	||
	STZ $1D					;$00805E	||
	STZ $1D					;$008060	||
	STZ $1E					;$008062	||
	STA $1E					;$008064	||
	STZ $1F					;$008066	||
	STZ $1F					;$008068	||
	STZ $20					;$00806A	||
	STZ $20					;$00806C	|/
	STZ $21					;$00806E	| Clear base CGRAM address.
	STZ $23					;$008070	|\ 
	STZ $24					;$008072	||
	STZ $25					;$008074	||
	STZ $26					;$008076	|| Initialize windowing settings.
	STZ $27					;$008078	||
	STZ $28					;$00807A	||
	STZ $29					;$00807C	||
	STZ $2A					;$00807E	||
	STZ $2B					;$008080	||
	STZ $2E					;$008082	||
	STZ $2F					;$008084	|/
	LDA #$30				;$008086	|\ 
	STA $30					;$008088	|| Initialize color math settings to always clip colors.
	STZ $31					;$00808A	|/
	LDA #$E0				;$00808C	|\ Initialized fixed color to black.
	STA $32					;$00808E	|/
	STZ $33					;$008090	| Disable all special screen modes.
	PEA $4200				;$008092	|\ Change DP to $42xx.
	PLD						;$008095	|/
	LDA #$FF				;$008096	|\ Initialize programmable I/O port to #$FF.
	STA $01					;$008098	|/
	STZ $02					;$00809A	|\ 
	STZ $03					;$00809C	||
	STZ $04					;$00809E	|| Initialize multiplicand/dividend ports.
	STZ $05					;$0080A0	||
	STZ $06					;$0080A2	||
	STZ $07					;$0080A4	||
	STZ $08					;$0080A6	|/
	STZ $09					;$0080A8	|\ Initialize IRQ scanline.
	STZ $0A					;$0080AA	|/
	STZ $0B					;$0080AC	|\ Disable DMA/HDMAs.
	STZ $0C					;$0080AE	|/
	STZ $0D					;$0080B0	| Disable fastrom.
	
	PEA $3700				;$0080B2	|\ Change DP to $37xx.
	PLD						;$0080B5	|/
	LDA #$20				;$0080B6	|\ Reset the SA-1.
	STA $2200				;$0080B8	|/
	STZ $2201				;$0080BB	|\ 
	LDA #$A0				;$0080BE	|| Disable IRQ and character conversion DMA (S-CPU).
	STA $2202				;$0080C0	|/
	STZ $2220				;$0080C3	|\ 
	LDA #$01				;$0080C6	||
	STA $2221				;$0080C8	|| Initialize Super MMC banks to not modify address accesses (S-CPU).
	LDA #$02				;$0080CB	||
	STA $2222				;$0080CD	||
	LDA #$03				;$0080D0	||
	STA $2223				;$0080D2	|/
	STZ $2224				;$0080D5	| Map $6000-$7FFF to $400000-$401FFF (S-CPU).
	LDA #$05				;$0080D8	|\ Protect $400000-$401FFF (i.e. the stack) from writes (S-CPU).
	STA $2228				;$0080DA	|/
	LDA #$80				;$0080DD	|\ Disable BW-RAM write protection (S-CPU).
	STA $2226				;$0080DF	|/
	LDA #$FF				;$0080E2	|\ Enable I-RAM write (S-CPU).
	STA $2229				;$0080E4	|/
	STZ $3000				;$0080E7	|\ Clear initial SA-1 wait values.
	STZ $3001				;$0080EA	|/
	LDX #$8BF4				;$0080ED	|\\ SA-1 RESET vector ($008BF4).
	STX $2203				;$0080F0	|/
	STZ $2200				;$0080F3	| Enable SA-1.
	
	LDX #$0000				;$0080F6	|\ 
	STX $2181				;$0080F9	||
	STZ $2183				;$0080FC	|| Use a DMA to clear out $7E0000-$7E2000.
	LDA #$08				;$0080FF	|| Specifically, it uses the value at $00FFFE.
	STA $4310				;$008101	||
	LDX #$FFFE				;$008104	||
	STX $4312				;$008107	||
	STZ $4314				;$00810A	||
	LDA #$80				;$00810D	||
	STA $4311				;$00810F	||
	LDX #$2000				;$008112	||
	STX $4315				;$008115	||
	LDA #$02				;$008118	||
	STA $420B				;$00811A	|/
	LDX #$000E				;$00811D	|\ 
	STX $2181				;$008120	||
	STZ $2183				;$008123	|| Transfer 24 bytes from $00818C to $0E-$25.
	STZ $4310				;$008126	||  This sets up a loop to wait for requests from the SA-1.
	LDX #$818C				;$008129	||  When the message is received, it jumps to the pointer in $300C.
	STX $4312				;$00812C	||
	STZ $4314				;$00812F	||
	LDA #$80				;$008132	||
	STA $4311				;$008134	||
	LDX #$0017				;$008137	||
	STX $4315				;$00813A	||
	LDA #$02				;$00813D	||
	STA $420B				;$00813F	|/
	LDX #$0026				;$008142	|\ 
	STX $2181				;$008145	||
	LDX #$81A3				;$008148	|| Transfer 14 bytes from $0081A3 to $26-$34.
	STX $4312				;$00814B	||  This sets up a loop to wait for a response form the SA-1.
	LDX #$000E				;$00814E	||  When a response is received, it returns to the routine that called it.
	STX $4315				;$008151	||
	LDA #$02				;$008154	||
	STA $420B				;$008156	|/
	LDA #$7E				;$008159	|
	STA $3014				;$00815B	|
	LDA #$80				;$00815E	|
	STA $305F				;$008160	|
	STA $30A2				;$008163	|
	LDA #$FF				;$008166	|
	STA $3093				;$008168	|
	REP #$20				;$00816B	|
  .waitForSA1				;			|
	LDA $3000				;$00816D	|\ Wait for the SA-1 chip to boot up.
	BPL .waitForSA1			;$008170	|/
	JSL label_00D559		;$008172	| Start the SPC700 chip.
	SEP #$20				;$008176	|
	LDA $3091				;$008178	|
	ORA #$81				;$00817B	|
	STA $3091				;$00817D	|
	STA $4200				;$008180	|
	REP #$20				;$008183	|
	CLI						;$008185	|
	DEC $300A				;$008186	|] Signal the SA-1 chip to resume.
	JMP $000E				;$008189	| Wait for a command from the SA-1 chip (see the below routine).



base $000E
SNES_WaitForCommand:		;-----------| Wait routine for commands from the SA-1 chip. Written into RAM at $7E000E.
	STZ $300E				;$00818C	|\ 
	LDA #$000F				;$008189	||
  .waitForMessage:			;			||
	BIT $2300				;$008192	|| Wait for a request from the SA-1 chip.
	BEQ .waitForMessage		;$008195	||
	BIT $300E				;$008197	||
	BPL .waitForMessage		;$00819A	|/
	PHK						;$00819C	|\ 
	PEA $000D				;$00819D	|| Jump to the routine specified by $300C.
	JMP [$300C]				;$0081A0	|/

base $0026
SNES_WaitForResponse:		;-----------| Wait routine for a response from the SA-1 chip. Written into RAM at $7E0026.
	LDA #$000F				;$0081A3	|\ 
  .waitForMessage			;			||
	BIT $2300				;$0081A6	|| Wait for a response from the SA-1 chip.
	BEQ .waitForMessage		;$0081A9	||  Then return to the routine that called it.
	BIT $300A				;$0081AB	||
	BMI .waitForMessage		;$0081AE	|/
	RTL						;$0081B0	|
base off





NMI_SNES:					;-----------| SNES NMI routine.
	REP #$30				;$0081B1	|
	PHA						;$0081B3	|
	PHX						;$0081B4	|
	PHY						;$0081B5	|
	PHD						;$0081B6	|
	LDA #$3000				;$0081B7	|\ Set DP to $30xx.
	TCD						;$0081BA	|/
	PHB						;$0081BB	|
	PHK						;$0081BC	|
	PLB						;$0081BD	|
	SEP #$20				;$0081BE	|
	LDA $4210				;$0081C0	| Read to clear the NMI flag.
	LDA $5F					;$0081C3	|\ 
	STA $A2					;$0081C5	|| Store brightness.
	STA $2100				;$0081C7	||  If in force blank, skip updating most SNES registers.
	BPL .notForceBlank		;$0081CA	|/
	STZ $420C				;$0081CC	| Disable all HDMA.
	LDA #$81				;$0081CF	|\ Enable NMI/joypad read, but disable IRQ.
	STA $4200				;$0081D1	|/
	REP #$20				;$0081D4	|
	STZ $15					;$0081D6	|\ 
	STZ $17					;$0081D8	|| Clear the VRAM DMA queue/buffer sizes.
	STZ $1F					;$0081DA	|/
	JMP .ForceBlank			;$0081DC	|

  .notForceBlank			;```````````| Not in force blank.
	REP #$20				;$0081DF	|
	JSR ExecVramBuffer		;$0081E1	| Execute pending DMAs to VRAM from the circular buffer ($0100).
	LDA $9F					;$0081E4	|\\ Skip sprite DMAs if $9F is zero?
	BEQ .noSpriteDMA		;$0081E6	||/
	JSR ExecVramQueue		;$0081E8	||] Execute pending DMAs to VRAM from the queue ($0900).
	STZ $2102				;$0081EB	||\ 
	SEP #$20				;$0081EE	|||
	STZ $4300				;$0081F0	|||
	STZ $4304				;$0081F3	|||
	LDA #$04				;$0081F6	||| Execute DMA to upload OAM.
	STA $4301				;$0081F8	|||  (0x220 bytes from $30A4 -> $2104)
	LDX #$0220				;$0081FB	|||
	STX $4305				;$0081FE	|||
	LDX #$30A4				;$008201	|||
	STX $4302				;$008204	|||
	LDA #$01				;$008207	|||
	STA $420B				;$008209	|//
  .noSpriteDMA:				;			|
	SEP #$20				;$00820C	|
	STZ $2121				;$00820E	|\ 
	STZ $4300				;$008211	|| Set up the base for a DMA to CGRAM ($2122).
	LDA #$22				;$008214	||
	STA $4301				;$008216	|/
	LDA $32DC				;$008219	|\ Branch if set to upload a special palette.
	BPL .altPalette			;$00821C	|/
	LDX $9F					;$00821E	|\ Skip the CGRAM DMA completely if $9F is zero?
	BEQ .noCgramDMA			;$008220	|/
	LDX #$0500				;$008222	|\ 
	STX $4302				;$008225	||
	STZ $4304				;$008228	|| Execute a 0x200 byte DMA from $0500 to CGRAM.
	LDY #$0200				;$00822B	||
	STY $4305				;$00822E	||
	LDA #$01				;$008231	||
	STA $420B				;$008233	|/
  .noCgramDMA:				;			|
	JMP .doneCGRAM			;$008236	|
	
  .altPalette:				;```````````| Using one of the alternative palettes.
	ASL A					;$008239	|\ 
	ADC $32DC				;$00823A	|| Multiply index by 3.
	TAX						;$00823D	|/
	LDY #$0500				;$00823E	|\\ 
	STY $4302				;$008241	|||
	STZ $4304				;$008244	|||
	LDY #$0008				;$008247	||| Execute a 0x8 byte DMA from $0500 to colors $00-$03.
	STY $4305				;$00824A	|||
	LDA #$01				;$00824D	|||
	STA $420B				;$00824F	||/
	LDY FG_Pals,X			;$008252	||\ 
	STY $4302				;$008255	|||
	LDA FG_Pals+2,X			;$008258	|||
	STA $4304				;$00825B	||| Execute a 0xF8 byte DMA from the specified palette to colors $04-$7F.
	LDY #$00F8				;$00825E	|||
	STY $4305				;$008261	|||
	LDA #$01				;$008264	|||
	STA $420B				;$008266	|//
	LDY #$0600				;$008269	|\\ 
	STY $4302				;$00826C	|||
	STZ $4304				;$00826F	||| Execute a 0x60 byte DMA from $0600 to colors $80-$AF.
	LDY #$0060				;$008272	|||
	STY $4305				;$008275	|||
	STA $420B				;$008278	||/
	LDY Sprite_Pals,X		;$00827B	||\ 
	STY $4302				;$00827E	|||
	LDA Sprite_Pals+2,X		;$008281	|||
	STA $4304				;$008284	||| Execute a 0xA0 byte DMA from the specified palette to colors $B0-$FF.
	LDY #$00A0				;$008287	|||
	STY $4305				;$00828A	|||
	LDA #$01				;$00828D	|||
	STA $420B				;$00828F	|//
  .doneCGRAM:				;			|
	REP #$20				;$008292	|
	STZ $9F					;$008294	|
	LDY $32E2				;$008296	|
	BEQ .label_0082A3		;$008299	|
	STY $4372				;$00829B	|
	LDA #$0080				;$00829E	|
	TSB $92					;$0082A1	|
  .label_0082A3:			;			|
	SEP #$20				;$0082A3	|
	LDA $92					;$0082A5	|\ 
	AND $93					;$0082A7	|| Turn off any HDMAs that have ended.
	TAX						;$0082A9	||
	LSR A					;$0082AA	||
	BCC .noBrightnessDMA	;$0082AB	||
	LDA #$40				;$0082AD	||\ 
	STA $4300				;$0082AF	|||
	LDA #$00				;$0082B2	||| If there's an HDMA active on channel 0,
	STA $4301				;$0082B4	|||  set it to an indirect HDMA on channel 0
	LDY #$841C				;$0082B7	|||  to $2100 (screen brightness) from $00841C.
	STY $4302				;$0082BA	|||
	LDA #$00				;$0082BD	|||
	STA $4304				;$0082BF	|||
	STA $4307				;$0082C2	||/
  .noBrightnessDMA:			;			||
	TXA						;$0082C5	||
	STA $420C				;$0082C6	|/
	REP #$20				;$0082C9	|
	LDA $5F					;$0082CB	|\ Screen brightness
	STA $2100				;$0082CD	|/  Sprite tile sizes, sprite GFX VRAM location
	LDA $61					;$0082D0	|\ BG mode and character size
	STA $2105				;$0082D2	|/  Mosaic size
	LDA $63					;$0082D5	|\\ BG1 tilemap VRAM address and size
	STA $2107				;$0082D7	||/ BG2 tilemap VRAM address and size
	LDA $65					;$0082DA	||\ BG3 tilemap VRAM address and size
	STA $2109				;$0082DC	|// BG4 tilemap VRAM address and size
	LDA $67					;$0082DF	|\ BG1/2 GFX VRAM address
	STA $210B				;$0082E1	|/  BG3/4 GFX VRAM address
	LDA $69					;$0082E4	|\ BG1/2 mask settings
	STA $2123				;$0082E6	|/  BG3/4 mask settings
	LDA $6C					;$0082E9	|\ Window 1 left position
	STA $2126				;$0082EB	||  Window 1 right position
	LDA $6E					;$0082EE	|| Window 2 left position
	STA $2128				;$0082F0	|/  Window 2 right position
	LDA $70					;$0082F3	|\ Window mask logic (BGs)
	STA $212A				;$0082F5	|/  Window mask logic (objects/color)
	LDA $72					;$0082F8	|\ Main screen designation
	STA $212C				;$0082FA	|/  Sub screen designation
	LDA $74					;$0082FD	|\ Window designation for main screen
	STA $212E				;$0082FF	|/  Window designation for sub screen
	LDA $76					;$008302	|\ Color addition select
	STA $2130				;$008304	|/  Color math designation
	SEP #$20				;$008307	|
	LDA $72					;$008309	|\ Mirror the main screen designation.
	STA $A3					;$00830B	|/
	LDA $78					;$00830D	|\ 
	STA $2132				;$00830F	||
	LDA $79					;$008312	|| Fixed background color
	STA $2132				;$008314	||
	LDA $7A					;$008317	||
	STA $2132				;$008319	|/
	LDA $91					;$00831C	|\ Interrupt enable 
	STA $4200				;$00831E	|/
	LDA $6B					;$008321	|\ Obj/color mask settings
	STA $2125				;$008323	|/
	LDA $7B					;$008326	|\ Mode 7 settings
	STA $211A				;$008328	|/
	LDA $8B					;$00832B	|\ 
	STA $211F				;$00832D	|| Mode 7 center X
	LDA $8C					;$008330	||
	STA $211F				;$008332	|/
	LDA $8D					;$008335	|\ 
	STA $2120				;$008337	|| Mode 7 center Y
	LDA $8E					;$00833A	||
	STA $2120				;$00833C	|/
	LDA $83					;$00833F	|\ 
	STA $211B				;$008341	|| Mode 7 matrix A
	LDA $84					;$008344	||
	STA $211B				;$008346	|/
	LDA $85					;$008349	|\ 
	STA $211C				;$00834B	|| Mode 7 matrix B
	LDA $86					;$00834E	||
	STA $211C				;$008350	|/
	LDA $87					;$008353	|\ 
	STA $211D				;$008355	|| Mode 7 matrix C
	LDA $88					;$008358	||
	STA $211D				;$00835A	|/
	LDA $89					;$00835D	|\ 
	STA $211E				;$00835F	|| Mode 7 matrix D
	LDA $8A					;$008362	||
	STA $211E				;$008364	|/
	LDX $32DE				;$008367	|\ 
	BMI .noHDMA				;$00836A	||
	LDA.w DATA_0083E6,X		;$00836C	||
	STA $4372				;$00836F	|| If set to do so,
	LDA.w DATA_0083E6+2,X	;$008372	||  change the HDMA channel 7 source address to a specified value.
	STA $4373				;$008375	||  (only indices 0 or 1 seem to be valid?)
	LDA.w DATA_0083E6+4,X	;$008378	||
	STA $4374				;$00837B	||
	STA $4377				;$00837E	|/
  .noHDMA					;			|
	SEP #$20				;$008381	|
	LDA $4F					;$008383	|\ 
	STA $210D				;$008385	|| Layer 1 X position
	LDA $50					;$008388	||
	STA $210D				;$00838A	|/
	LDA $55					;$00838D	|\ 
	STA $210E				;$00838F	|| Layer 1 Y position
	LDA $56					;$008382	||
	STA $210E				;$008384	|/
	LDA $51					;$008387	|\ 
	STA $210F				;$008399	|| Layer 2 X position
	LDA $52					;$00839C	||
	STA $210F				;$00839E	|/
	LDA $57					;$0083A1	|\ 
	STA $2110				;$0083A3	|| Layer 2 Y position
	LDA $58					;$0083A6	||
	STA $2110				;$0083A8	|/
	LDA $53					;$0083AB	|\ 
	STA $2111				;$0083AD	|| Layer 3 X position
	LDA $54					;$0083B0	||
	STA $2111				;$0083B2	|/
	LDA $59					;$0083B5	|\ 
	STA $2112				;$0083B7	|| Layer 3 Y position
	LDA $5A					;$0083BA	||
	STA $2112				;$0083BC	|/
	REP #$20				;$0083BF	|
  .ForceBlank:				;```````````| If in force blank, that joins back here.
	SEP #$10				;$0083C1	|
	LDX #$FF				;$0083C3	|
	DEC $33D1				;$0083C5	|\ 
	BNE .noUnderflowA		;$0083C8	|| Handle timer 1.
	STX $33CE				;$0083CA	|/
  .noUnderflowA:			;			|
	DEC $33D3				;$0083CD	|\ 
	BNE .noUnderflowB		;$0083D0	|| Handle timer 2.
	STX $33CF				;$0083D2	|/
  .noUnderflowB:			;			|
	DEC $33D5				;$0083D5	|\ 
	BNE .noUnderflowC		;$0083D8	|| Handle timer 3.
	STX $33D0				;$0083DA	|/
  .noUnderflowC:			;			|
	REP #$10				;$0083DD	|
	LDA $99					;$0083DF	| 
	BPL label_00842C		;$0083E1	|
	JMP [$3097]				;$0083E3	|
	
DATA_0083E6:				;$0083E6	| Table containing two interleaved HDMA source addresses. Needs to be researched more.
	db $70,$F0,$71,$74,$7F,$7F			;  These equate to $7F7170 and $7F74F0 correspondingly.


FG_Pals:					;$0083EC	| Pointer table to various palettes in RAM for FG/BG layers. Each are 0xF8 bytes long.
	dl $000708				; 0 - 
	dl $7F7878				; 1 - 
	dl $7F7A78				; 2 - 
	dl $7F7C78				; 3 - 
	dl $7F7E78				; 4 - 
	dl $7F8078				; 5 - 
	dl $7F8278				; 6 - 
	dl $000508				; 7 - Standard

Sprite_Pals:				;$008404	| Pointer table to various palettes in RAM for sprites. Each are 0xA0 bytes long.
	dl $000860				; 0 - 
	dl $7F79D0				; 1 - 
	dl $7F7BD0				; 2 - 
	dl $7F7DD0				; 3 - 
	dl $7F7FD0				; 4 - 
	dl $7F81D0				; 5 - 
	dl $7F83D0				; 6 - 
	dl $000660				; 7 - Standard

Brightness_HDMA:			;$00841C	| Indirect HDMA table used on screen brightness.
	db $60 : dw $30A2					; Specifically, this is used for the "fade to black" effect at the bottom of the level.
	db $3B : dw $30A2
	db $8C : dw $003E
	db $03 : dw $8B89
	db $02 : dw $30A2
	db $00


label_00842C:				;-----------| NMI, continued?
	PHK						;$00842C	|
	PLB						;$00842D	|
	REP #$30				;$00842E	|
	LDA #$3000				;$008430	|\ Set DP to $30xx.
	TCD						;$008433	|/
	LDA $92					;$008434	|\ 
	AND $93					;$008436	|| Skip down if HDMA channel 0 is disabled.
	LSR A					;$008438	||  (i.e. no brightness fade)
	BCC label_008486		;$008439	|/
	LDA $3368				;$00843B	|\ 
	SBC $3354				;$00843E	|| An absurdly complicated routine to set up $3E (the brightness fade table).
	CLC						;$008441	||  To be analyzed more throughly... some other time.
	ADC $5D					;$008442	||
	BPL label_008449		;$008444	||
	LDA #$0000				;$008446	||
label_008449:				;			||
	CMP #$000C				;$008449	||
	BCC label_008451		;$00844C	||
	LDA #$0080				;$00844E	||
label_008451:				;			||
	SEP #$20				;$008451	||
	STA $004A				;$008453	||
	ORA $A2					;$008456	||
	BMI label_00847B		;$008458	||
	LDX #$000B				;$00845A	||
label_00845D:				;			||
	TXA						;$00845D	||
	EOR #$FF				;$00845E	||
	CLC						;$008460	||
	ADC $A2					;$008461	||
	CLC						;$008463	||
	ADC $004A				;$008464	||
	BPL label_00846D		;$008467	||
	LDA #$00				;$008469	||
	BRA label_008473		;$00846B	||
label_00846D:				;			||
	CMP $A2					;$00846D	||
	BCC label_008473		;$00846F	||
	LDA $A2					;$008471	||
label_008473:				;			||
	STA $003E,X				;$008473	||
	DEX						;$008476	||
	BPL label_00845D		;$008477	||
	BRA label_008486		;$008479	||
label_00847B:				;			||
	LDX #$000B				;$00847B	||
	LDA $A2					;$00847E	||
label_008480:				;			||
	STA $003E,X				;$008480	||
	DEX						;$008483	||
	BPL label_008480		;$008484	|/
label_008486:				;			|
	SEP #$20				;$008486	|
	STZ $4320				;$008488	|\ 
	LDA #$22				;$00848B	|| Set up an DMA on channel 2 (but don't enable it).
	STA $4321				;$00848D	||  This points to CGRAM ($2122) starting at color $04, with data in bank 0.
	STZ $4324				;$008490	|| The DMA is intended to be activated by IRQ, for the status bar palette.
	LDA #$04				;$008493	||
	STA $2121				;$008495	|/
	REP #$30				;$008498	|
	INC $10					;$00849A	| NMI is done, so signal the SA-1.
	PLB						;$00849C	|
	PLD						;$00849D	|
	PLY						;$00849E	|
	PLX						;$00849F	|
	PLA						;$0084A0	|
	RTI						;$0084A1	|
	




IRQ_SNES:					;-----------| SNES IRQ routine.
	PHB						;$0084A2	|
	PHD						;$0084A3	|
	PHK						;$0084A4	|
	PLB						;$0084A5	|
	SEP #$20				;$0084A6	|
	BIT $30A2				;$0084A8	|\ Return if in force blank.
	BMI .noIRQ				;$0084AB	|/
	BIT $4211				;$0084AD	|\ Return if this is not an SNES IRQ.
	BPL .noIRQ				;$0084B0	|/
	REP #$30				;$0084B2	|
	PEA $3700				;$0084B4	|\ Set DP to $37xx.
	PLD						;$0084B7	|/
	JMP [$309B]				;$0084B8	| Jump to the current IRQ routine.

  .noIRQ:					;```````````| IRQ jump point when no routine is meant to run.
	PLD						;$0084BB	|
	PLB						;$0084BC	|
	RTI						;$0084BD	|





UpdateSprSize:				;-----------| Routine to update sprite tile sizes and GFX base.
	SEP #$20				;$0084BE	|
	LDA $30A1				;$0084C0	|\ 
	ORA #$80				;$0084C3	|| Activate force blank if not already enabled.
	STA $305F				;$0084C5	|/
	REP #$20				;$0084C8	|
	JSL WaitForSnesNMI		;$0084CA	| Wait for the SNES to execute NMI.
	LDA.w #.RunOnSNES		;$0084CE	|\ 
	LDX.w #.RunOnSNES>>16	;$0084D1	|| Execute the below routine on the SNES.
	JML SA1_ExecuteSNES		;$0084D4	|/

  .RunOnSNES:				;```````````| Routine to update the sprite size/GFX base on the SNES side ($2101).
	SEP #$10				;$0084D8	|  For some reason, done through a DMA instead of just storing directly.
	LDX #$08				;$0084DA	|\ 
	STX $4300				;$0084DC	||
	LDA #$0001				;$0084DF	||
	STA $4305				;$0084E2	||
	LDA #$3060				;$0084E5	|| 
	STA $4302				;$0084E8	|| DMA a single byte from $3060 to $2101.
	LDX #$00				;$0084EB	||
	STX $4304				;$0084ED	||
	LDX #$01				;$0084F0	||
	STX $4301				;$0084F2	||
	LDX #$01				;$0084F5	||
	STX $420B				;$0084F7	|/
	REP #$10				;$0084FA	|
	RTL						;$0084FC	|



UpdtLyrsCtrlBrght:			;-----------| Routine which updates controllers, layer positions, and screen brightness.
	SEP #$20				;$0084FD	|
	LDA $30A1				;$0084FF	|
	STA $305F				;$008502	|
	REP #$20				;$008505	|
	JMP UpdtLyrsCtrl		;$008507	|



UpdateSNESMode:				;-----------| Routine to switch the SNES mode (and Layer 3 priority) to the specified value in A.
	SEP #$20				;$00850A	|
	XBA						;$00850C	|
	LDA #$0F				;$00850D	|\ Clear out the bits currently.
	TRB $3061				;$00850F	|/
	XBA						;$008512	|\ Set the bits from A.
	TSB $3061				;$008513	|/
	REP #$20				;$008516	|
	RTL						;$008518	|



label_008519:				;-----------| Routine to change the sprite tile sizes and GFX location in VRAM.
	SEP #$20				;$008519	|  Usage: A = tile size value, X = 16-bit VRAM address (the actual one, not as stored in $2101).
	ASL A					;$00851B	|\ 
	ASL A					;$00851C	||
	ASL A					;$00851D	|| Shift A up to the size bits and store them.
	ASL A					;$00851E	||
	ASL A					;$00851F	||
	STA $3060				;$008520	|/
	REP #$20				;$008523	|
	TXA						;$008525	|\ 
	SEP #$20				;$008526	||
	XBA						;$008528	||
	LSR A					;$008529	||
	LSR A					;$00852A	|| Shift X down 13 bits and add to the store.
	LSR A					;$00852B	||
	LSR A					;$00852C	||
	LSR A					;$00852D	||
	ORA $3060				;$00852E	|/
	STA $3060				;$008531	|\ Update both the mirror and actual register.
	STA $2101				;$008534	|/
	REP #$20				;$008537	|
	RTL						;$008539	|

label_00853A:				;-----------| Routine to change the distance between sprite GFX pages 0 and 1 (nn bits of $2101) to the value in A.
	SEP #$20				;$00853A	|
	AND #$03				;$00853C	|\ 
	ASL A					;$00853E	|| Shift A up to the nn bits.
	ASL A					;$00853F	||
	ASL A					;$008540	|/
	PHA						;$008541	|
	LDA #$18				;$008542	|\ Mask out the old bits.
	TRB $3060				;$008544	|/
	PLA						;$008547	|
	ORA $3060				;$008548	|\ 
	STA $3060				;$00854B	|| Update with the new bits.
	STA $2101				;$00854E	|/
	REP #$20				;$008551	|
	RTL						;$008553	|



SetupLayer1VRAM:			;-----------| Routine to update the Layer 1 VRAM locations based on the values in A/X/Y.
	SEP #$20				;$008554	|  A = tilemap size (------yx), X = GFX base, Y = tilemap base.
	AND #$03				;$008556	|\ Set size of tilemap.
	STA $3063				;$008558	|/  32x32, 64x32, 32x64, 64x64.
	LDA #$0F				;$00855B	|\ Mask out the old GFX file address.
	TRB $3067				;$00855D	|/
	REP #$20				;$008560	|
	TXA						;$008562	|\ 
	SEP #$20				;$008563	||
	XBA						;$008565	||
	LSR A					;$008566	|| Write the GFX file address from X.
	LSR A					;$008567	||
	LSR A					;$008568	||
	LSR A					;$008569	||
	TSB $3067				;$00856A	|/
	REP #$20				;$00856D	|
	TYA						;$00856F	|\ 
	SEP #$20				;$008570	||
	XBA						;$008572	|| Write the tilemap address from Y.
	AND #$FC				;$008573	||
	TSB $3063				;$008575	|/
	REP #$20				;$008578	|
	RTL						;$00857A	|


SetupLayer2VRAM:			;-----------| Routine to update the Layer 2 VRAM locations based on the values in A/X/Y.
	SEP #$20				;$00857B	|  A = tilemap size (------yx), X = GFX base, Y = tilemap base.
	AND #$03				;$00857D	|\ Set size of tilemap.
	STA $3064				;$00857F	|/
	LDA #$F0				;$008582	|\ Mask out the old GFX file address.
	TRB $3067				;$008584	|/
	REP #$20				;$008587	|
	TXA						;$008589	|\ 
	SEP #$20				;$00858A	||
	XBA						;$00858C	|| Write the GFX file address from X.
	AND #$F0				;$00858D	||
	TSB $3067				;$00858F	|/
	REP #$20				;$008592	|
	TYA						;$008594	|\ 
	SEP #$20				;$008595	||
	XBA						;$008597	|| Write the tilemap address from Y.
	AND #$FC				;$008598	||
	TSB $3064				;$00859A	|/
	REP #$20				;$00859D	|
	RTL						;$00859F	|


SetupLayer3VRAM:			;-----------| Routine to update the Layer 3 VRAM locations based on the values in A/X/Y.
	SEP #$20				;$0085A0	|  A = tilemap size (------yx), X = GFX base, Y = tilemap base.
	AND #$03				;$0085A2	|\ Set size of tilemap.
	STA $3065				;$0085A4	|/  32x32, 64x32, 32x64, 64x64.
	LDA #$0F				;$0085A7	|\ Mask out the old GFX file address.
	TRB $3068				;$0085A9	|/
	REP #$20				;$0085AC	|
	TXA						;$0085AE	|\ 
	SEP #$20				;$0085AF	||
	XBA						;$0085B1	||
	LSR A					;$0085B2	|| Write the GFX file address from X.
	LSR A					;$0085B3	||
	LSR A					;$0085B4	||
	LSR A					;$0085B5	||
	TSB $3068				;$0085B6	|/
	REP #$20				;$0085B9	|
	TYA						;$0085BB	|\ 
	SEP #$20				;$0085BC	||
	XBA						;$0085BE	|| Write the tilemap address from Y.
	AND #$FC				;$0085BF	||
	TSB $3065				;$0085C1	|/
	REP #$20				;$0085C4	|
	RTL						;$0085C6	|



label_0085C7:				;-----------|
	SEP #$20				;$0085C7	|
	BIT #$80				;$0085C9	|
	BEQ label_0085D1		;$0085CB	|
	LDA #$00				;$0085CD	|
	BRA label_0085D7		;$0085CF	|
label_0085D1:				;			|
	CMP #$0F				;$0085D1	|
	BCC label_0085D7		;$0085D3	|
	LDA #$0F				;$0085D5	|
label_0085D7:				;			|
	STA $30A1				;$0085D7	|
	BIT $305F				;$0085DA	|
	STA $305F				;$0085DD	|
	BMI label_0085E5		;$0085E0	|
	REP #$20				;$0085E2	|
	RTL						;$0085E4	|
label_0085E5:				;			|
	REP #$20				;$0085E5	|
	JMP UpdtLyrsCtrl		;$0085E7	|





ExecVramBuffer:				;-----------| Routine to execute buffered DMAs from $0100 to VRAM. (DP = $30xx)
	LDX $15					;$0085EA	|\ 
	CPX $17					;$0085EC	|| Return if the buffer is empty.
	BEQ .return				;$0085EE	|/
	LDA #$0100				;$0085F0	|\ Set DP to $01xx.
	TCD						;$0085F3	|/
  .loop:					;			|
	LDA $00,X				;$0085F4	|\ If the first two bytes are zero, then we're writing a single entry in VRAM.
	BNE .vramDMA			;$0085F6	|/  Else, we should branch to perform a DMA.
	LDA $02,X				;$0085F8	|\ 
	STA $2116				;$0085FA	|| Write a single entry into VRAM.
	LDA $04,X				;$0085FD	||
	STA $2118				;$0085FF	|/
	TXA						;$008602	|\ 
	CLC						;$008603	||
	ADC #$0008				;$008604	|| Increment index by 8.
	AND #$03FF				;$008607	|| If not at the end of the buffer yet, loop to continue. 
	TAX						;$00860A	||
	CPX $3017				;$00860B	||
	BNE .loop				;$00860E	|/
	BRA .done				;$008610	|

  .vramDMA:					;```````````| Using a DMA to write/read entries from VRAM.
	AND #$00FF				;$008612	|
	TAY						;$008615	|
	LDA VramDMAOpts-3,Y		;$008616	|\ Set transfer settings.
	STA $4300				;$008619	|/
	LDA $03,X				;$00861C	|\ 
	STA $4302				;$00861E	|| Set source address (or destination when reading).
	LDA $05,X				;$008621	||
	STA $4304				;$008623	|/
	LDA $01,X				;$008626	|\ Set size.
	STA $4305				;$008628	|/
	LDA $06,X				;$00862B	|\ Set destination VRAM address (or source when reading).
	STA $2116				;$00862D	|/
	SEP #$20				;$008630	|
	LDA VramDMAOpts-1,Y		;$008632	|\ Set write control settings.
	STA $2115				;$008635	|/
	LDA #$01				;$008638	|\ Enable DMA.
	STA $420B				;$00863A	|/
	REP #$20				;$00863D	|
	TXA						;$00863F	|\ 
	CLC						;$008640	||
	ADC #$0008				;$008641	|| Increment index by 8.
	AND #$03FF				;$008644	|| If not at the end of the buffer yet, loop to continue. 
	TAX						;$008647	||
	CPX $3017				;$008648	||
	BNE .loop				;$00864B	|/
  .done						;			|
	LDA #$3000				;$00864D	|\ Set DP back to $30xx.
	TCD						;$008650	|/
	STX $15					;$008651	| Update start position for the buffer.
  .return					;			|
	LDA $1D					;$008653	|\ Transfer the $0900 queue's NMI count to the global one.
	STA $19					;$008655	|/
	RTS						;$008657	|



ExecVramQueue:				;-----------| Routine to execute queued DMAs from $0900 to VRAM. (DP = $30xx)
	LDA $1F					;$008658	|\ Return if no DMAs are queued.
	BEQ .noDMA				;$00865A	|/
	LDX #$0000				;$00865C	|
  .loop:					;			|
	LDA VramDMAOpts			;$00865F	|\ Assume a normal 16-bit write to VRAM.
	STA $4300				;$008662	|/
	LDA $0903,X				;$008665	|\ 
	STA $4302				;$008668	|| Set source address.
	LDA $0905,X				;$00866B	||
	STA $4304				;$00866E	|/
	LDA $0901,X				;$008671	|\ Set size.
	STA $4305				;$008674	|/
	LDA $0906,X				;$008677	|\ Set destination VRAM address.
	STA $2116				;$00867A	|/
	SEP #$20				;$00867D	|
	LDA VramDMAOpts+2		;$00867F	|\ Assume a 16-bit horizontal write.
	STA $2115				;$008682	|/
	LDA #$01				;$008685	|\ Enable DMA.
	STA $420B				;$008687	|/
	REP #$20				;$00868A	|
	TXA						;$00868C	|\ 
	CLC						;$00868D	||
	ADC #$0008				;$00868E	|| Loop if not at the end of the queue yet.
	TAX						;$008691	||
	CPX $1F					;$008692	||
	BNE .loop				;$008694	|/
	STZ $1F					;$008696	| Clear queue for next frame.
  .noDMA:					;			|
	STZ $1D					;$008698	|\ Clear the NMI counters.
	STZ $19					;$00869A	|/
	RTS						;$00869C	|


VramDMAOpts:				;$00869D	| Table of DMA settings for writing/reading VRAM, ordered $43x0, $43x1, $2115.
	db $01,$18,$80			; 03 - Write-H - 2-byte normal
	db $09,$18,$80			; 06 - Write-H - 2-byte fixed
	db $00,$18,$00			; 09 - Write-H - 1-byte normal, $2118 only
	db $08,$18,$00			; 0C - Write-H - 1-byte fixed,  $2118 only
	db $00,$19,$80			; 0F - Write-H - 1-byte normal, $2119 only
	db $08,$19,$80			; 12 - Write-H - 1-byte fixed,  $2119 only
	db $81,$39,$80			; 15 -  Read-H - 2 bytes
	db $80,$39,$00			; 18 -  Read-H - 1 byte, $2139 only
	db $80,$3A,$80			; 1B -  Read-H - 1 byte, $213A only
	db $01,$18,$81			; 1E - Write-V - 2-byte normal
	db $09,$18,$81			; 21 - Write-V - 2-byte fixed
	db $00,$18,$01			; 24 - Write-V - 1-byte normal, $2118 only
	db $08,$18,$01			; 27 - Write-V - 1-byte fixed,  $2118 only
	db $00,$19,$81			; 2A - Write-V - 1-byte normal, $2119 only
	db $08,$19,$81			; 2D - Write-V - 1-byte fixed,  $2119 only
	db $81,$39,$81			; 30 -  Read-V - 2 bytes
	db $80,$39,$01			; 33 -  Read-V - 1 byte, $2139 only
	db $80,$3A,$81			; 36 -  Read-V - 1 byte, $213A only
	db $01,$18,$84			; 39 - Write-H - 2bpp remap - 2-byte normal
	db $01,$18,$88			; 3C - Write-H - 4bpp remap - 2-byte normal
	db $01,$18,$8C			; 3F - Write-H - 8bpp remap - 2-byte normal



label_0086DC:				;$0086DC	| Unused?
	db $00,$22,$80,$80,$3B,$80,$00,$18,$03



LoadDMATable:				;-----------| Routine to write DMA data from a table in A/X to $0100 (A = lower 16-bits, X = bank).
	STA $2E					;$0086E5	|  If the first byte of the DMA data is negative, then its source data is decompressed first.
	STX $30					;$0086E7	|  The first byte being FF marks the end of the table.
	LDY #$0000				;$0086E9	|
  .loop:					;			|
	SEP #$20				;$0086EC	|	
	LDA [$2E],Y				;$0086EE	|\ 
	STA $31					;$0086F0	||
	INY						;$0086F2	||
	CMP #$FF				;$0086F3	||\ Return if at the end of the data.
	BEQ .return				;$0086F5	||/
	LDA [$2E],Y				;$0086F7	|| 
	STA $32					;$0086F9	||
	INY						;$0086FB	||
	REP #$20				;$0086FC	||
	LDA [$2E],Y				;$0086FE	|| Write 8 bytes into $31-$38.
	STA $33					;$008700	||
	INY						;$008702	||
	INY						;$008703	||
	LDA [$2E],Y				;$008704	||
	STA $35					;$008706	||
	INY						;$008708	||
	INY						;$008709	||
	LDA [$2E],Y				;$00870A	||
	STA $37					;$00870C	||
	INY						;$00870E	||
	INY						;$00870F	|/
	PHY						;$008710	|
	LDA $31					;$008711	|\ 
	BIT #$0080				;$008713	|| If byte 0 bit 7 is set, clear it and...
	BEQ .noDecompress		;$008716	||
	AND #$FF7F				;$008718	||
	STA $31					;$00871B	||
	BIT $0000				;$00871D	||\ 
	BMI .onSNES				;$008720	|||
	JSL .DepressData		;$008722	|||
	BRA .doneCall			;$008726	||| ...decompress the data given first.
  .onSNES:					;			|||
	LDA.w #.DepressData		;$008728	|||
	LDX.w #.DepressData>>16	;$00872B	|||
	JSL SA1_ExecuteSNES		;$00872E	||/
  .doneCall:				;			||
	SEP #$20				;$008732	||
	LDA #$7E				;$008734	||\ Then change the bank byte to 0x7E, to point to the decompressed data.
	STA $36					;$008736	|//
  .noDecompress:			;			|
	REP #$20				;$008738	|
	JSL WriteToDMABuffer	;$00873A	| Write the data to the VRAM DMA buffer.
	PLY						;$00873E	|\ Continue looping for all remaining bytes.
	BRA .loop				;$00873F	|/
  .return:					;			|
	REP #$20				;$008741	|
	RTL						;$008743	|

  .DepressData:				;```````````| Called on the SNES for decompressing data.
	LDA $36					;$008744	|\ Get source address from the DMA command.
	LDX $34					;$008746	|/
	LDY $3012				;$008748	|\ 
	STY $34					;$00874B	|| Get address to write decompressed data at.
	PEA $007E				;$00874D	||
	PLB						;$008750	|/
	JSL DepressData			;$008751	| Decompress the data.
	PLB						;$008755	|
	STY $3012				;$008756	| Update decompressed data buffer index.
	RTL						;$008759	|



WriteToDMABuffer:			;-----------| Routine to add $31-$38 into the circular VRAM DMA buffer ($0100).
	BIT $30A1				;$00875A	|\ Branch if in force blank, to execute it directly.
	BMI .inForceBlank		;$00875D	|/
	LDA $3017				;$00875F	|\ 
	SEC						;$008762	||
	SBC $3015				;$008763	||
	AND #$03FF				;$008766	|| If the VRAM buffer is full, wait for NMI to empty it.
	CMP #$03F8				;$008769	||
	BCC .bufferNotFull		;$00876C	||
	JSL WaitForSnesNMI		;$00876E	|/
  .bufferNotFull:			;			|
	LDA $3019				;$008772	|\ 
	CLC						;$008775	||
	ADC $32					;$008776	||
	ADC #$0066				;$008778	||
	CMP $301B				;$00877B	||
	BCC .label_00878D		;$00877E	|| Add to the NMI load, and if past the limit, wait for NMI to empty it.
	JSL WaitForSnesNMI		;$008780	|| Then reset the load to the amount queued for $0900.
	LDA $32					;$008784	||
	CLC						;$008786	||
	ADC $301D				;$008787	||
	ADC #$0066				;$00878A	||
  .label_00878D:			;			||
	STA $3019				;$00878D	|/
	BIT $0000				;$008790	|\ 
	BPL .onSNES				;$008793	||
	LDA.w #.writeDMA		;$008795	||
	LDX.w #.writeDMA>>16	;$008798	|| Transfer the bytes into the circular VRAM DMA buffer at $0100.
	JSL SA1_ExecuteSNES		;$00879B	||
	BRA .doneCall			;$00879F	||
  .onSNES:					;			||
	JSL .writeDMA			;$0087A1	|/
  .doneCall:				;			|
	LDA $3017				;$0087A5	|\ 
	CLC						;$0087A8	||
	ADC #$0008				;$0087A9	|| Update the buffer index.
	AND #$03FF				;$0087AC	||
	STA $3017				;$0087AF	|/
	RTL						;$0087B2	|

  .writeDMA:				;```````````| Executed on the SNES to write an entry to $0100.
	LDX $3017				;$0087B3	|\ 
	LDA $31					;$0087B6	||
	STA $0100,X				;$0087B8	||
	LDA $33					;$0087BB	||
	STA $0102,X				;$0087BD	|| Write bytes directly to the VRAM DMA circular buffer.
	LDA $35					;$0087C0	||
	STA $0104,X				;$0087C2	||
	LDA $37					;$0087C5	||
	STA $0106,X				;$0087C7	|/
	RTL						;$0087CA	|


  .inForceBlank:			;```````````| In force blank, so a DMA can just be directly executed.
	BIT $0000				;$0087CB	|\ 
	BPL .execDMA			;$0087CE	||
	LDA.w #.execDMA			;$0087D0	|| Run the below on the SNES.
	LDX.w #.execDMA>>16		;$0087D3	||
	JML SA1_ExecuteSNES		;$0087D6	|/

  .execDMA
	SEP #$10				;$0087DA	|
	LDX $31					;$0087DC	|\ 
	LDA.w VramDMAOpts-3,X	;$0087DE	||
	STA $4310				;$0087E1	|| Write the DMA control settings.
	LDY.w VramDMAOpts-1,X	;$0087E4	||
	STY $2115				;$0087E7	|/
	LDA $34					;$0087EA	|\ 
	STA $4312				;$0087EC	|| Write the source.
	LDX $36					;$0087EF	||
	STX $4314				;$0087F1	|/
	LDA $32					;$0087F4	|\ Write the length.
	STA $4315				;$0087F6	|/
	LDA $37					;$0087F9	|\ Write the destination VRAM address.
	STA $2116				;$0087FB	|/
	LDX #$02				;$0087FE	|\ Enable DMA.
	STX $420B				;$008800	|/
	LDA #$2000				;$008803	|\ Clear the decompressed data buffer, since its data was just uploaded.
	STA $3012				;$008806	|/
	REP #$10				;$008809	|
	RTL						;$00880B	|




WriteTile:					;-----------| Subroutine to write a single tile into the DMA buffer at $0100 (A = tile, X = destination).
	BIT $30A1				;$00880C	|\ Branch if in force blank, to upload the tile directly.
	BMI .inForceBlank		;$00880F	|/
	STX $4B					;$008811	|
	STA $49					;$008813	|
	LDA $3017				;$008815	|\ 
	SEC						;$008818	||
	SBC $3015				;$008819	||
	AND #$03FF				;$00881C	|| If the VRAM buffer is full, wait for NMI to empty it.
	CMP #$03F8				;$00881F	||
	BCC .bufferNotFull		;$008822	||
	JSL WaitForSnesNMI		;$008824	|/
  .bufferNotFull:			;			|
	LDA $3019				;$008828	|\ 
	CLC						;$00882B	||
	ADC #$002F				;$00882C	||
	CMP $301B				;$00882F	||
	BCC .notAtLimit			;$008832	|| Add to the NMI load, and if past the limit, wait for NMI to empty it.
	JSL WaitForSnesNMI		;$008834	|| Then reset the load to the amount queued for $0900.
	LDA $301D				;$008838	||
	CLC						;$00883B	||
	ADC #$002F				;$00883C	||
  .notAtLimit:				;			||
	STA $3019				;$00883F	|/
	BIT $0000				;$008842	|\ 
	BPL ..alreadyOnSNES		;$008845	||
	LDA.w #.writeTile		;$008847	||
	LDX.w #.writeTile>>16	;$00884A	|| Execute $008865 on the SNES.
	JSL SA1_ExecuteSNES		;$00884D	||
	BRA .doneWrite			;$008851	||
  ..alreadyOnSNES:			;			||
	JSL .writeTile			;$008853	|/
  .doneWrite:				;			|
	LDA $3017				;$008857	|\ 
	CLC						;$00885A	||
	ADC #$0008				;$00885B	|| Increment the VRAM DMA index.
	AND #$03FF				;$00885E	||
	STA $3017				;$008861	|/
	RTL						;$008864	|

  .writeTile:				;```````````| Run on SNES to write an entry to the VRAM DMA queue.
	LDX $3017				;$008865	|
	STZ $0100,X				;$008868	|\ 
	LDA $4B					;$00886B	||
	STA $0102,X				;$00886D	|| Write the tile and destination.
	LDA $49					;$008870	||
	STA $0104,X				;$008872	|/
	RTL						;$008875	|

  .inForceBlank:			;```````````| In force blank, so we can just write the tile directly.
	BIT $0000				;$008876	|\ 
	BPL ..alreadyOnSNES		;$008879	||
	STX $4B					;$00887B	||
	STA $49					;$00887D	||
	LDA.w #..nowOnSNES		;$00887F	|| Make sure we're on the SNES.
	LDX.w #..nowOnSNES>>16	;$008882	||
	JML SA1_ExecuteSNES		;$008885	||
  ..nowOnSNES:				;			||
	LDX $4B					;$008889	||
	LDA $49					;$00888B	|/
  ..alreadyOnSNES:			;			|
	STX $2116				;$00888D	|\ Write the data directly to VRAM.
	STA $2118				;$008890	|/
	RTL						;$008893	|



DepressOnSNES:				;-----------| Alternative entry to the below routine when you know for sure you're on the SNES.
	PHB						;$008894	|
	PHD						;$008895	|
	SEP #$20				;$008896	|
	BRA DepressData_Start	;$008898	|

DepressData:				;-----------| Routine to decompress data, using exhal decompression.
	PHB						;$00889A	|  In: $-AXX = source, $-(DB)YY = destination
	SEP #$20				;$00889B	| Out: $-AXX = byte after src, $-(db)YY = byte after destination
	STA $49					;$00889D	|\ 
	LDA $000000				;$00889F	||
	BPL .alreadyOnSNES		;$0088A3	||
	STX $4B					;$0088A5	||
	STY $4D					;$0088A7	||
	PHB						;$0088A9	||
	PLA						;$0088AA	||
	STA $48					;$0088AB	||
	PHK						;$0088AD	||
	PLB						;$0088AE	||
	REP #$20				;$0088AF	||
	LDA #$88C3				;$0088B1	||
	LDX #$0000				;$0088B4	|| All of this is just to make sure the routine executes on the SNES.
	JSL SA1_ExecuteSNES		;$0088B7	||
	PLB						;$0088BB	||
	LDA $49					;$0088BC	||
	LDY $4D					;$0088BE	||
	LDX $4B					;$0088C0	||
	RTL						;$0088C2	||
  .nowOnSNES:				;           ||
	PHB						;$0088C3	||
	SEP #$20				;$0088C4	||
	LDA $48					;$0088C6	||
	PHA						;$0088C8	||
	LDX $4B					;$0088C9	||
	LDY $4D					;$0088CB	||
	PLB						;$0088CD	|/
  .alreadyOnSNES:			;```````````| Now on SNES, guaranteed. A/X/Y same as before.
	LDA $49					;$0088CE	|
	PHD						;$0088D0	|
	PEA $0000				;$0088D1	|\ Set DP = $00xx.
	PLD						;$0088D4	|/
  .Start:					;```````````| Actual routine starts here.
	STX $02					;$0088D5	|\ $02 = 24-bit data source
	STA $04					;$0088D7	|| $07 = destination
	STY $07					;$0088D9	|/
	TYX						;$0088DB	|
	LDY #$0000				;$0088DC	|
  .NextCommand:				;			|
	LDA [$02],Y				;$0088DF	|\ 
	CMP #$FF				;$0088E1	|| Branch if not at the end of the data.
	BNE .ParseCommand		;$0088E3	|/
	REP #$20				;$0088E5	|
	TYA						;$0088E7	|\ 
	SEC						;$0088E8	|| Update the pointer in $02 with where the data ended at.
	ADC $02					;$0088E9	||
	STA $02					;$0088EB	|/
	TXY						;$0088ED	|\ 
	TAX						;$0088EE	|| Return with:
	LDA $04					;$0088EF	||   A - Bank byte of data?
	PLD						;$0088F1	||   X - Pointer to the byte after the compressed data. Also stored in $4B and $02.
	PLB						;$0088F2	||   Y - Number of decompressed bytes written. Also stored in $4D.
	STY $4D					;$0088F3	||
	STX $4B					;$0088F5	|/
	RTL						;$0088F7	|

  .ParseCommand:			;```````````| Not at the end of the data.
	AND #$E0				;$0088F8	| Get command value.
	CMP #$E0				;$0088FA	|\ Branch if not command 110, which is used to get a 10-bit length rather than 5-bit.
	BNE .OneByteCommand		;$0088FC	|/  i.e. of the form [110cccll llllllll]
	LDA [$02],Y				;$0088FE	|\ 
	ASL A					;$008900	||
	ASL A					;$008901	|| Get next 3 bits, and use that as the command instead.
	ASL A					;$008902	||
	AND #$E0				;$008903	||
	PHA						;$008905	|/
	LDA [$02],Y				;$008906	|\ 
	INY						;$008908	||
	AND #$03				;$008909	||
	STA $06					;$00890B	||
	LDA [$02],Y				;$00890D	|| $05 = 16-bit length + 1.
	INY						;$00890F	||
	STA $05					;$008910	||
	REP #$20				;$008912	||
	INC $05					;$008914	|/
	SEP #$20				;$008916	|
	BRA .CommandReceived	;$008918	|
  .OneByteCommand:			;```````````| Not command 110. Treat just the next 5 bits as length: [ccclllll]
	PHA						;$00891A	|
	LDA [$02],Y				;$00891B	|\ 
	INY						;$00891D	||
	AND #$1F				;$00891E	|| $05 = 16-bit length + 1.
	INC A					;$008920	||
	STA $05					;$008921	||
	STZ $06					;$008923	|/
  .CommandReceived:			;			|
	PLA						;$008925	|
	BPL .DirectCommands		;$008926	|\ Jump down for commands 100-111.
	JMP .BackrefCommands	;$008928	|/

  .DirectCommands:			;```````````| Command in the range of 000-011.
	CMP #$20				;$00892B	|\ Branch for 001.
	BEQ .Command001			;$00892B	|/
	CMP #$40				;$00892B	|\ Branch for 010.
	BEQ .Command010			;$00892B	|/
	CMP #$60				;$00892B	|\ Branch for 011.
	BEQ .Command011			;$00892B	|/

  .Command000:				;```````````| Command 000: direct data for L+1 bytes.
	LDA [$02],Y				;$008937	|\ 
	INY						;$008939	||
	STA $0000,X				;$00893A	||
	INX						;$00893D	|| Write each byte directly to the output.
	REP #$20				;$00893E	||
	DEC $05					;$008940	||
	SEP #$20				;$008942	||
	BNE .Command000			;$008944	|/
	JMP .NextCommand		;$008946	|

  .Command001:				;```````````| Command 001: repeat next byte L+1 times.
	LDA [$02],Y				;$008949	|
	INY						;$00894B	|
	PHY						;$00894C	|
	LDY $05					;$00894D	|\ 
  ..loop:					;			||
	STA $0000,X				;$00894F	|| Repeat a single byte to the output.
	INX						;$008952	||
	DEY						;$008953	||
	BNE ..loop				;$008954	|/
	PLY						;$008956	|
	JMP .NextCommand		;$008957	|

  .Command010:				;```````````| Command 010: repeat next two bytes L+1 times.
	REP #$20				;$00895A	|
	LDA [$02],Y				;$00895C	|
	INY						;$00895E	|
	INY						;$00895F	|
	PHY						;$008960	|
	LDY $05					;$008961	|\ 
  ..loop:					;			||
	STA $0000,X				;$008963	||
	INX						;$008966	|| Repeat two bytes to the output.
	INX						;$008967	||
	DEY						;$008968	||
	BNE ..loop				;$008969	|/
	PLY						;$00896B	|
	SEP #$20				;$00896C	|
	JMP .NextCommand		;$00896E	|

  .Command011:				;```````````| Command 011: increasing sequence starting from the next byte for L+1 bytes.
	LDA [$02],Y				;$008971	|
	INY						;$008973	|
	PHY						;$008974	|
	LDY $05					;$008975	|\ 
  ..loop:					;			||
	STA $0000,X				;$008977	|| Write the next byte to the output,
	INX						;$00897A	||  then increase by 1 with each additional byte written.
	INC A					;$00897B	||
	DEY						;$00897C	||
	BNE ..loop				;$00897D	|/
	PLY						;$00897F	|
	JMP .NextCommand		;$008980	|

  .BackrefCommands:			;```````````| Command in the range 100-111 (which use a backreference to decompressed data).
	STA $09					;$008983	|
	REP #$20				;$008985	|\ 
	LDA [$02],Y				;$008987	||
	XBA						;$008989	|| Take next two bytes as a 16-bit offset (big endian) to the destination.
	CLC						;$00898A	||  This new location will be where the data is read from for this command.
	ADC $07					;$00898B	||
	INY						;$00898D	|| For obvious reasons, this is only intended to offset into already-decompressed data.
	INY						;$00898E	||
	PHY						;$00898F	||
	TAY						;$008990	|/
	SEP #$20				;$008991	|
	LDA $09					;$008993	|
	CMP #$80				;$008995	|\ Branch for 100.
	BEQ .Command100			;$008997	|/
	CMP #$A0				;$008999	|\ Branch for 101.
	BEQ .Command101			;$00899B	|/
	CMP #$C0				;$00899D	|\ Branch for 110.
	BEQ .Command110			;$00899F	|/
  .Command100:				;```````````| Command 100 or 111: direct copy from the backref for L+1 bytes.
	LDA $0000,Y				;$0089A1	|\ 
	STA $0000,X				;$0089A4	||
	INY						;$0089A7	||
	INX						;$0089A8	|| Copy data directly from the source to the output.
	REP #$20				;$0089A9	||
	DEC $05					;$0089AB	||
	SEP #$20				;$0089AD	||
	BNE .Command100			;$0089AF	|/
	PLY						;$0089B1	|
	JMP .NextCommand		;$0089B2	|

  .Command101:				;```````````| Command 101: copy bytes with their bits reversed from the backref for L+1 bytes.
	LDA $0000,Y				;$0089B5	|\ 
	STA $09					;$0089B8	||
	ASL $09					;$0089BA	||
	ROR A					;$0089BC	||
	ASL $09					;$0089BD	||
	ROR A					;$0089BF	||
	ASL $09					;$0089C0	||
	ROR A					;$0089C2	||
	ASL $09					;$0089C3	|| Reverse the bits from the source and write to the output.
	ROR A					;$0089C5	||
	ASL $09					;$0089C6	||
	ROR A					;$0089C8	||
	ASL $09					;$0089C9	||
	ROR A					;$0089CB	||
	ASL $09					;$0089CC	||
	ROR A					;$0089CE	||
	ASL $09					;$0089CF	||
	ROR A					;$0089D1	||
	STA $0000,X				;$0089D2	|/
	INY						;$0089D5	|
	INX						;$0089D6	|
	REP #$20				;$0089D7	|\ 
	DEC $05					;$0089D9	|| Loop for all bytes.
	SEP #$20				;$0089DB	||
	BNE .Command101			;$0089DD	|/
	PLY						;$0089DF	|
	JMP .NextCommand		;$0089E0	|

  .Command110:				;```````````| Command 110: copy bytes in reverse order from the backref for L+1 bytes (note: offset must be to the end).
	LDA $0000,Y				;$0089E3	|\ 
	STA $0000,X				;$0089E6	||
	DEY						;$0089E9	||
	INX						;$0089EA	|| Copy data from the source to the output,
	REP #$20				;$0089EB	||  while decrementing the source index instead of incrementing.
	DEC $05					;$0089ED	||
	SEP #$20				;$0089EF	||
	BNE .Command110			;$0089F1	|/
	PLY						;$0089F3	|
	JMP .NextCommand		;$0089F4	|





WaitForSnesNMI:				;-----------| SA-1: Wait for the SNES to execute NMI.
	PHP						;$0089F7	|
	SEP #$20				;$0089F8	|
	PHA						;$0089FA	|
	STZ $3010				;$0089FB	|\ 
  .wait:					;			|| Wait for NMI to execute.
	LDA $3010				;$0089FE	||
	BEQ .wait				;$008A01	|/
	PLA						;$008A03	|
	PLP						;$008A04	|
	RTL						;$008A05	|





UpdtLyrsCtrl:				;-----------| Routine to update layer positions and fetch controller inputs.
	PHP						;$008A06	|
	REP #$30				;$008A07	|
	PHA						;$008A09	|
	PHX						;$008A0A	|
	PHY						;$008A0B	|
	PHD						;$008A0C	|
	LDA #$3000				;$008A0D	|\ Set DP to $30xx.
	TCD						;$008A10	|/
	LDA $37					;$008A11	|
	SEC						;$008A13	|
	SBC $5B					;$008A14	|
	STA $4F					;$008A16	|
	LDA $39					;$008A18	|
	SEC						;$008A1A	|
	SBC $5B					;$008A1B	|
	STA $51					;$008A1D	|
	LDA $3B					;$008A1F	|
	STA $53					;$008A21	|
	LDA $3D					;$008A23	|
	SEC						;$008A25	|
	SBC $5D					;$008A26	|
	STA $55					;$008A28	|
	LDA $3F					;$008A2A	|
	SEC						;$008A2C	|
	SBC $5D					;$008A2D	|
	STA $57					;$008A2F	|
	LDA $41					;$008A31	|
	STA $59					;$008A33	|
	INC $94					;$008A35	|
	INC $9F					;$008A37	|
	STZ $10					;$008A39	|
	PLD						;$008A3B	|
	BIT $0000				;$008A3C	|
	BPL .alreadyOnSNES		;$008A3F	|
	LDA.w #.OnSNES			;$008A41	|\ 
	LDX.w #.OnSNES>>16		;$008A44	||
	JSL SA1_ExecuteSNES		;$008A47	|| Make sure the routine runs on the SNES.
	BRA .done				;$008A4B	||
  .alreadyOnSNES:			;			||
	JSL .OnSNES				;$008A4D	|/
  .done:					;			|
	PLY						;$008A51	|
	PLX						;$008A52	|
	PLA						;$008A53	|
	PLP						;$008A54	|
	RTL						;$008A55	|

  .OnSNES:					;```````````| SNES-side routine to update controller inputs.
	LDA $3010				;$008A56	|\ Wait for NMI to fire.
	BEQ .OnSNES				;$008A59	|/
	LDA #$0001				;$008A5B	|\ 
  .waitForJoypad:			;			|| Wait for auto-joypad read to finish.
	BIT $4212				;$008A5E	||
	BNE .waitForJoypad		;$008A61	|/
	LDX #$0002				;$008A63	|\ 
  .controllerLoop:			;			|| Get controller inputs.
	LDA $32C4,X				;$008A66	||\ 
	EOR #$FFF0				;$008A69	||| Get newly-pressed buttons.
	AND $4218,X				;$008A6C	|||
	STA $32D4,X				;$008A6F	||/
	TAY						;$008A72	||
	LDA $4218,X				;$008A73	||\ 
	CMP $32C4,X				;$008A76	||| Get held buttons.
	STA $32C4,X				;$008A79	||/
	BEQ .sameInput			;$008A7C	||\ 
	LDY #$0014				;$008A7E	||| Handle timer for controller having the same input as before.
	BRA .timerReset			;$008A81	||| If this frame's input is different from the previous, set the held timer to 0x14.
  .sameInput:				;			|||   Else, decrement the held timer. When it hits 0, reset it to 0x6.
	DEC $0036,X				;$008A83	||| If the timer was reset, $32CC will be set to the input.
	BEQ .timerZeroed		;$008A86	|||  If the timer decremented, $32CC will be clear.
	STZ $32CC,X				;$008A88	|||
	BRA .noTimerReset		;$008A8B	|||
  .timerZeroed:				;			|||
	LDY #$0006				;$008A8D	|||
  .timerReset:				;			|||
	STA $32CC,X				;$008A90	|||
	TYA						;$008A93	|||
	STA $0036,X				;$008A94	||/
  .noTimerReset:			;			||
	DEX						;$008A97	||
	DEX						;$008A98	||
	BPL .controllerLoop		;$008A99	|/
	LDX #$0002				;$008A9B	|\ 
  .fixLoop:					;			||
	LDA $32C4,X				;$008A9E	||
	JSL FixDpadInput		;$008AA1	||
	STA $32C4,X				;$008AA5	||
	LDA $32D4,X				;$008AA8	|| Fix directional input conflicts, i.e. no U+D / L+R.
	JSL FixDpadInput		;$008AAB	||  If either combination is pressed, directional input is dropped.
	STA $32D4,X				;$008AAF	||
	LDA $32CC,X				;$008AB2	||
	JSL FixDpadInput		;$008AB5	||
	STA $32CC,X				;$008AB9	||
	DEX						;$008ABC	||
	DEX						;$008ABD	||
	BPL .fixLoop			;$008ABE	|/
	RTL						;$008AC0	|





CallRNG:					;-----------| RNG routine. Returns result in both A and $49.
	LDA #$0000				;$008AC1	|
  .ModA:					;```````````| Alternative entry which returns the result modulo A.
	STA $49					;$008AC4	|
	BIT $0000				;$008AC6	|\ 
	BMI .onSA1				;$008AC9	||
	LDA.w #.onSA1			;$008ACB	||
	LDX.w #.onSA1>>16		;$008ACE	|| Make sure the below runs on the SA-1.
	JSL SNES_ExecuteSA1		;$008AD1	||
	LDA $49					;$008AD5	||
	RTL						;$008AD7	|/
  .onSA1:					;			|
	SEP #$20				;$008AD8	|
	LDA $43					;$008ADA	|\ 
	LDX #$000B				;$008ADC	||
  .loop:					;			||
	ASL $43					;$008ADF	||
	ROL $44					;$008AE1	||
	ROL A					;$008AE3	||
	ROL A					;$008AE4	||
	EOR $43					;$008AE5	||
	ROL A					;$008AE7	|| Get the next RNG value.
	EOR $43					;$008AE8	||
	LSR A					;$008AEA	||
	LSR A					;$008AEB	||
	EOR #$FF				;$008AEC	||
	AND #$01				;$008AEE	||
	ORA $43					;$008AF0	||
	STA $43					;$008AF2	||
	DEX						;$008AF4	||
	BNE .loop				;$008AF5	|/
	REP #$20				;$008AF7	|\ 
	AND #$00FF				;$008AF9	||
	LDX $49					;$008AFC	||
	BEQ .noModulo			;$008AFE	|| If the routine was called with A != 0,
	STZ $2250				;$008B00	||  multiply the output by that value,
	STA $2251				;$008B03	||  and return the high byte of the result.
	STX $2253				;$008B06	||
	LDA #$00FF				;$008B09	||
	AND $2307				;$008B0C	||
  .noModulo:				;			||
	STA $49					;$008B0F	|/
	RTL						;$008B11	|





DATA_008B12:				;$008B12	| 
	dw $FFFE,$FFFD,$FFFB,$FFF7
	dw $FFEF,$FFDF,$FFBF,$FF7F
	dw $FEFF,$FDFF,$FBFF,$F7FF
	dw $EFFF,$DFFF,$BFFF,$7FFF
	dw $FDFE,$F7FB,$DFEF,$7FBF
	dw $7FFF,$BFFF,$DFFF,$EFFF
	dw $F7FF,$FBFF,$FDFF,$FEFF
	dw $FF7F,$FFBF,$FFDF,$FFEF
	dw $FFF7,$FFFB,$FFFD,$FFFE
	dw $BF7F,$EFDF,$FBF7,$FEFD



DATA_008B62:				;$008B62	| 16-bit AND table.
	dw $0001,$0002,$0004,$0008
	dw $0010,$0020,$0040,$0080
	dw $0100,$0200,$0400,$0800
	dw $1000,$2000,$4000,$8000

DATA_008B82:				;$008B82	| 8-bit AND table.
	db $01,$02,$04,$08,$10,$20,$40,$80	; The #$80 at $8B89 here is also used to force blank for 3 scanlines between the level and HUD.

DATA_008B8A:				;$008B8A	| 16-bit AND table, reversed.
	dw $8000,$4000,$2000,$1000
	dw $0800,$0400,$0200,$0100
	dw $0080,$0040,$0020,$0010
	dw $0008,$0004,$0002,$0001

DATA_008BAA:				;$008BAA	| 8-bit AND table, reversed.
	db $80,$40,$20,$10,$08,$04,$02,$01





WritePal:					;-----------| Routine to write to the palette ($0500). Use _Alt0 to write to alt palette 0 ($0700) instead.
	STA $14					;$008BB2	|  A = Lower 16 bits of source, X = upper 8 bits of source 
	STX $16					;$008BB4	|  Y = Starting color (high byte) and number of colors (low byte)
	TYA						;$008BB6	|\ 
	AND #$FF00				;$008BB7	||
	XBA						;$008BBA	|| Get index to color within $0500.
	ASL A					;$008BBB	||
	ADC #$0500				;$008BBC	|/
	BRA .StorePointer		;$008BBF	|
	
  .Alt0:					;```````````| Alternative entry point to the above that modified the alternative palette 0 ($0700).
	STA $14					;$008BC1	|  Same arguments passed in A/X/Y.
	STX $16					;$008BC3	|
	TYA						;$008BC5	|\ 
	AND #$FF00				;$008BC6	||
	XBA						;$008BC9	|| Get pointer to color within $0700.
	ASL A					;$008BCA	||
	ADC #$0700				;$008BCB	|/
  .StorePointer:			;			|
	STA $18					;$008BCE	|
	TYA						;$008BD0	|\ 
	AND #$00FF				;$008BD1	||
	DEC A					;$008BD4	|| Get number of colors to write.
	ASL A					;$008BD5	||
	STA $49					;$008BD6	|/
	BIT $0000				;$008BD8	|\ 
	BPL .onSNES				;$008BDB	||
	LDA.w #.onSNES			;$008BDD	|| Run the below on the SNES.
	LDX.w #.onSNES>>16		;$008BE0	||
	JML SA1_ExecuteSNES		;$008BE3	|/

  .onSNES:
	LDY $49					;$008BE7	|\ Hardlock the game if more than 256 colors are somehow being written.
  - BMI -					;$008BE9	|/
  .loop:					;			|
	LDA [$14],Y				;$008BEB	|\ 
	STA ($18),Y				;$008BED	||
	DEY						;$008BEF	|| Transfer the palette data.
	DEY						;$008BF0	||
	BPL .loop				;$008BF1	|/
	RTL						;$008BF3	|
	




Reset_SA1:					;-----------| SA-1 RESET vector; chip boots to here. An alternative exists at $00DE26.
	SEI						;$008BF4	| Disable IRQ.
	CLC						;$008BF5	|\ Disable emulation mode.
	XCE						;$008BF6	|/
	SEP #$20				;$008BF7	|
	STZ $2230				;$008BF9	|\ Disable SA-1 DMA.
	STZ $2209				;$008BFC	|/
	LDA #$FF				;$008BFF	|\ 
	STA $222A				;$008C01	||
	STZ $2225				;$008C04	|| Enable I-RAM and BW-RAM write.
	LDA #$80				;$008C07	||
	STA $2227				;$008C09	|/
	STA $220A				;$008C0C	| Switch IRQ control to SA-1.
	STZ $3000				;$008C0F	|\ 
	STZ $6000				;$008C12	||
	REP #$30				;$008C15	||
	LDX #$3000				;$008C17	||
	LDY #$3001				;$008C1A	||
	LDA #$07FE				;$008C1D	|| Clear $3000-$37FF and $6000-$6EFF.
	MVN $0000				;$008C20	||
	LDX #$6000				;$008C23	||
	LDY #$6001				;$008C26	||
	LDA #$1EFE				;$008C29	||
	MVN $0000				;$008C2C	|/
	LDX #$37FF				;$008C2F	|\ Fix stack at $37FF.
	TXS						;$008C32	|/
	LDA #$3700				;$008C33	|\ Change DP to $37xx.
	TCD						;$008C36	|/
	LDA #$7777				;$008C37	|
	STA $3743				;$008C3A	|
	LDA #$2000				;$008C3D	|\ Initialize the decompressed data buffer at $7E2000.
	STA $3012				;$008C40	|/
	LDA #$11C8				;$008C43	|\\ Maximum NMI load.
	STA $301B				;$008C46	|/
	LDA #$FFFF				;$008C49	|\ Set the standard palette as the default.
	STA $32DC				;$008C4C	|/
	STA $32DE				;$008C4F	|
	STA $3000				;$008C52	|] SA-1 identification value.
	STA $33C8				;$008C55	|
  .waitForSNES:				;			|
	LDA $300A				;$008C58	|\ Wait for the SNES to finish uploading to the SPC. 
	BPL .waitForSNES		;$008C5B	|/
	STZ $300A				;$008C5D	|
	JML label_00BC29		;$008C60	|





SNES_ExecuteSA1:			;-----------| Subroutine to pass the SA-1 chip a routine to execute.
	BIT $300A				;$008C64	|\ 
	BPL .sa1Ready			;$008C67	||
	PHA						;$008C69	|| Let the SA-1 finish if it's already doing something.
	JSL $000026				;$008C6A	||
	PLA						;$008C6E	|/
  .sa1Ready:				;			|
	STA $3008				;$008C6F	|\ 
	TXA						;$008C72	|| Store pointer to the routine and set flag to execute.
	ORA #$8000				;$008C73	||
	STA $300A				;$008C76	|/
	JMP $0026				;$008C79	| Wait for SA-1 to finish executing the routine.
	BIT $300A				;$008C7C	|\ 
	BPL .sa1Done			;$008C7F	||
	PHA						;$008C81	|| Wait for the SA-1 to finish... again?
	JSL $000026				;$008C82	||
	PLA						;$008C86	|/
  .sa1Done:					;			|
	STA $3008				;$008C87	|\ 
	TXA						;$008C8A	|| Have the SA1... execute it again?...
	ORA #$8000				;$008C8B	||
	STA $300A				;$008C8E	|/
	RTL						;$008C91	|





SA1_ExecuteSNES:			;-----------| Routine used to pass control of a routine to the SNES. Pass routine in A/X; A = lower 16 bits, X = bank.
	BIT $0000				;$008C92	|\ Branch if called by specifically the SA-1 chip and not the SNES.
	BMI .sa1_WaitForSNES	;$008C95	|/
	STA $000A				;$008C97	|\ 
	STX $000C				;$008C9A	|| Called by the SNES; just jump directly to the given routine.
	JMP [$000A]				;$008C9D	|/

  .sa1_WaitForSNES:
	BIT $300E				;$008CA0	|\ Wait for the SNES to finish any routines it's currently processing.
	BMI .sa1_WaitForSNES	;$008CA3	|/
	STA $300C				;$008CA5	|\ 
	TXA						;$008CA8	|| Store pointer and set execution flag.
	ORA #$8000				;$008CA9	||
	STA $300E				;$008CAC	|/
  .resumeWait:				;			|
	STZ $300A				;$008CAF	|\ 
	LDA #$0001				;$008CB2	|| Send okay signal to the SNES and wait for it to finish executing the routine.
	STA $2209				;$008CB5	||
  .waitForSNES:				;			||
	BIT $300A				;$008CB8	||\ If the SNES passes a command back to the SA-1, execute the given routine before returning to the loop.
	BMI .executeSA1			;$008CBB	||/
	BIT $300E				;$008CBD	||\ Wait for SNES to finish executing the routine.
	BMI .waitForSNES		;$008CC0	|//
	STZ $2209				;$008CC2	|
	RTL						;$008CC5	|

  .executeSA1:				;```````````| SNES passed a command back to the SA-1.
	STZ $2209				;$008CC6	|
	PHK						;$008CC9	|\ 
	PEA .resumeWait-1		;$008CCA	|| Jump to the given routine; when done, return back to the execution loop.
	JMP [$3008]				;$008CCD	|/





WriteToDMAQueue:			;-----------| Subroutine to write $31-$38 into the VRAM DMA queue at $0900.
	BIT $30A1				;$008CD0	|\ If in force blank... return?
	BMI .inForceBlank		;$008CD3	|/
	LDA $301D				;$008CD5	|\ 
	CLC						;$008CD8	||
	ADC $32					;$008CD9	|| Add to the NMI load for the $0900 buffer.
	ADC #$0066				;$008CDB	||
	STA $301D				;$008CDE	|/
	LDA $3019				;$008CE1	|\ 
	CLC						;$008CE4	||
	ADC $32					;$008CE5	||
	ADC #$0066				;$008CE7	||
	CMP $301B				;$008CEA	||
	BCC .notAtLimit			;$008CED	|| Add to the NMI load, and if past the limit, wait for NMI to empty it.
	JSL WaitForSnesNMI		;$008CEF	|| Then reset the load to the amount still queued for $0900.
	LDA $32					;$008CF3	||
	CLC						;$008CF5	||
	ADC $301D				;$008CF6	||
	ADC #$0066				;$008CF9	||
  .notAtLimit:				;			||
	STA $3019				;$008CFC	|/
	BIT $0000				;$008CFF	|
	BPL .alreadyOnSNES		;$008D02	|
	LDA.w #.writeDMA		;$008D04	|
	LDX.w #.writeDMA>>16	;$008D07	|
	JSL SA1_ExecuteSNES		;$008D0A	|
	BRA .doneWrite			;$008D0E	|
  .alreadyOnSNES:			;			|
	JSL .writeDMA			;$008D10	|
  .doneWrite:				;			|
	LDA $301F				;$008D14	|\ 
	CLC						;$008D17	|| Increment the VRAM DMA index.
	ADC #$0008				;$008D18	||
	STA $301F				;$008D1B	|/
  .inForceBlank:			;			|
	RTL						;$008D1E	|

  .writeDMA:				;```````````| Now on SNES, write to the queue.
	LDX $301F				;$008D1F	|
	LDA $31					;$008D22	|\ 
	STA $0900,X				;$008D24	||
	LDA $33					;$008D27	||
	STA $0902,X				;$008D29	|| Write the data to the queue.
	LDA $35					;$008D2C	||
	STA $0904,X				;$008D2E	||
	LDA $37					;$008D31	||
	STA $0906,X				;$008D33	|/
	RTL						;$008D36	|




	
FixDpadInput:				;-----------| Directional input conflict handler. Prevents U+D/L+R inputs.
	PHX						;$008D37	|
	PHY						;$008D38	|
	PHA						;$008D39	|
	AND #$F0FF				;$008D3A	|\ Get non-directional inputs.
	STA $00					;$008D3D	|/
	PLA						;$008D3F	|
	AND #$0F00				;$008D40	|\ 
	XBA						;$008D43	||
	ASL A					;$008D44	|| Get adjusted directional input value, then return that with the non-directional inputs.
	TAX						;$008D45	||
	LDA.l DATA_008D4F,X		;$008D46	||
	ORA $00					;$008D4A	|/
	PLY						;$008D4C	|
	PLX						;$008D4D	|
	RTL						;$008D4E	|
	
DATA_008D4F:				;$008D4F	| Directional input conflict handlers. Indexed by directional inputs (UDLR), times 2.
	dw $0000,$0100,$0200,$0000			; The returned value is the directional input that will actually be read.
	dw $0400,$0500,$0600,$0000
	dw $0800,$0900,$0A00,$0000
	dw $0000,$0000,$0000,$0000





DATA_008D6F:				;$008D6F	|
	dw $6D56				; 00 - 
	dw $6DD0				; 02 - 
	dw $6E4A				; 04 - 
	dw $6EC4				; 06 - 
	dw $6F3E				; 08 - 
	dw $6FB8				; 0A - 
	dw $7032				; 0C - 
	dw $70AC				; 0E - 
	dw $7126				; 10 - 
	dw $71A0				; 12 - 
	dw $623C				; 14 - ?



label_008D85:				;-----------|
	LDA #$A985				;$008D85	|
	STA $6020				;$008D88	|
	LDA #$A9C5				;$008D8B	|
	STA $6022				;$008D8E	|
	LDA #$AA26				;$008D91	|
	STA $6024				;$008D94	|
	LDA #$A96A				;$008D97	|
	STA $6026				;$008D9A	|
	LDA #$3037				;$008D9D	|
	STA $735A				;$008DA0	|
	LDA #$303D				;$008DA3	|
	STA $735C				;$008DA6	|
	LDX #$007A				;$008DA9	|
	STX $6138				;$008DAC	|
	LDA #$007C				;$008DAF	|
	STA $60B6				;$008DB2	|
	STA $613A				;$008DB5	|
	LDY #$007E				;$008DB8	|
	STY $60B8				;$008DBB	|
	STX $6014				;$008DBE	|
	STY $6016				;$008DC1	|
	STZ $6236				;$008DC4	|
	LDA #$000E				;$008DC7	|
	STA $6238				;$008DCA	|
	STA $623A				;$008DCD	|
	LDA #$E000				;$008DD0	|
	STA $6336				;$008DD3	|
	STA $6338				;$008DD6	|
	STA $633A				;$008DD9	|
	LDA #$FFFF				;$008DDC	|
	STA $60BC,X				;$008DDF	|
	STA $603C,Y				;$008DE2	|
	STA $601A				;$008DE5	|
	STA $601C				;$008DE8	|
	STA $62B6				;$008DEB	|
	STA $62B8				;$008DEE	|
	STA $62BA				;$008DF1	|
	STA $64B0				;$008DF4	|
	STA $64B2				;$008DF7	|
	STA $64B4				;$008DFA	|
	STA $33C6				;$008DFD	|
	LDX #$007A				;$008E00	|
	STX $602C				;$008E03	|
	LDA #$007C				;$008E06	|
	STA $603A				;$008E09	|
	LDA #$FFFF				;$008E0C	|
	STA $602E				;$008E0F	|
	STA $6030				;$008E12	|
	STA $6032				;$008E15	|
	STA $6034				;$008E18	|
	STA $6036				;$008E1B	|
	STA $6038				;$008E1E	|
	LDX #$0078				;$008E21	|
label_008E24:				;			|
	STA $623C,X				;$008E24	|
	STA $603C,X				;$008E27	|
	STA $60BC,X				;$008E2A	|
	STA $613C,X				;$008E2D	|
	STA $62BC,X				;$008E30	|
	STZ $61BC,X				;$008E33	|
	DEX						;$008E36	|
	DEX						;$008E37	|
	BPL label_008E24		;$008E38	|
	LDX #$0006				;$008E3A	|
label_008E3D:				;			|
	STZ $3043,X				;$008E3D	|
	STZ $3037,X				;$008E40	|
	STZ $734A,X				;$008E43	|
	STZ $733A,X				;$008E46	|
	STZ $3049,X				;$008E49	|
	STZ $303D,X				;$008E4C	|
	STZ $7352,X				;$008E4F	|
	STZ $7342,X				;$008E52	|
	DEX						;$008E55	|
	DEX						;$008E56	|
	BPL label_008E3D		;$008E57	|
	STZ $305B				;$008E59	|
	STZ $305D				;$008E5C	|
	STZ $7368				;$008E5F	|
	JSR label_00A985		;$008E62	|
	JSR label_00A9C5		;$008E65	|
	SEP #$20				;$008E68	|
	LDA #$30				;$008E6A	|
	STA $3076				;$008E6C	|
	REP #$20				;$008E6F	|
	RTL						;$008E71	|



label_008E72:				;-----------|
	PHA						;$008E72	|
	STZ $6000				;$008E73	|
	STZ $6002				;$008E76	|
	STZ $6004				;$008E79	|
	STZ $6006				;$008E7C	|
	STZ $6008				;$008E7F	|
	STZ $6010				;$008E82	|
	LDA #$007A				;$008E85	|
	STA $6012				;$008E88	|
	PLA						;$008E8B	|
label_008E8C:				;			|
	STA $600A				;$008E8C	|
	STX $600C				;$008E8F	|
	STY $600E				;$008E92	|
	JSR label_009130		;$008E95	|
	BCC label_008E9E		;$008E98	|
	LDA #$FFFF				;$008E9A	|
	RTL						;$008E9D	|

label_008E9E:
	LDA #$AB78				;$008E9E	|
	STA $6630,X				;$008EA1	|
	LDA #$A6FB				;$008EA4	|
	STA $66AA,X				;$008EA7	|
	LDA $6000				;$008EAA	|
	STA $6D56,X				;$008EAD	|
	LDA $6002				;$008EB0	|
	STA $6DD0,X				;$008EB3	|
	LDA $6004				;$008EB6	|
	STA $6E4A,X				;$008EB9	|
	LDA $6006				;$008EBC	|
	STA $6EC4,X				;$008EBF	|
	LDA $6008				;$008EC2	|
	STA $6F3E,X				;$008EC5	|
	STZ $6FB8,X				;$008EC8	|
	STZ $7032,X				;$008ECB	|
	STZ $70AC,X				;$008ECE	|
	STZ $7126,X				;$008ED1	|
	STZ $71A0,X				;$008ED4	|
	STZ $64B6,X				;$008ED7	|
	STZ $65B0,X				;$008EDA	|
	LDA #$8000				;$008EDD	|
	STA $6A7A,X				;$008EE0	|
	STA $6AF4,X				;$008EE3	|
	LDA $600C				;$008EE6	|
	STA $6986,X				;$008EE9	|
	STA $6892,X				;$008EEC	|
	LDA $600E				;$008EEF	|
	STA $6A00,X				;$008EF2	|
	STA $690C,X				;$008EF5	|
	LDA $600A				;$008EF8	|
	STA $623C,X				;$008EFB	|
	STZ $6436,X				;$008EFE	|
	DEC $6436,X				;$008F01	|
	STZ $6B6E,X				;$008F04	|
	STZ $6C62,X				;$008F07	|
	STZ $6BE8,X				;$008F0A	|
	STZ $6CDC,X				;$008F0D	|
	STZ $62BC,X				;$008F10	|
	PHX						;$008F13	|
	ASL A					;$008F14	|
	ASL A					;$008F15	|
	TXY						;$008F16	|
	TAX						;$008F17	|
	LDA.l DATA_00B895+2,X	;$008F18	|
	TAY						;$008F1C	|
	LDA.l DATA_00B895,X		;$008F1D	|
	PLX						;$008F21	|
	JSL label_008F35		;$008F22	|
	TYA						;$008F26	|
	STA $61BC,X				;$008F27	|
	JSR label_009180		;$008F2A	|
	JSR label_0091AC		;$008F2D	|
	LDY $39					;$008F30	|
	TXA						;$008F32	|
	CLC						;$008F33	|
	RTL						;$008F34	|

label_008F35:
	STZ $6724,X				;$008F35	|
	STA $679E,X				;$008F38	|
	TYA						;$008F3B	|
	STA $6818,X				;$008F3C	|
	TYA						;$008F3F	|
	LDY $61BC,X				;$008F40	|
	XBA						;$008F43	|
	AND #$001F				;$008F44	|
	BEQ label_008F4C		;$008F47	|
	TAY						;$008F49	|
	DEY						;$008F4A	|
	DEY						;$008F4B	|
label_008F4C:				;			|
	CPX #$0030				;$008F4C	|
	BCS label_008F57		;$008F4F	|
	TXA						;$008F51	|
	ASL A					;$008F52	|
	ASL A					;$008F53	|
	STA $721A,X				;$008F54	|
label_008F57:				;			|
	LDA $62BC,X				;$008F57	|
	AND #$8000				;$008F5A	|
	STA $62BC,X				;$008F5D	|
	JSR label_00925F		;$008F60	|
	RTL						;$008F63	|

label_008F64:				;-----------|
	PHA						;$008F64	|
	PHX						;$008F65	|
	PHY						;$008F66	|
	TYA						;$008F67	|
	XBA						;$008F68	|
	AND #$001F				;$008F69	|
	BEQ label_008F75		;$008F6C	|
	DEC A					;$008F6E	|
	DEC A					;$008F6F	|
	CMP $61BC,X				;$008F70	|
	BNE label_008F7E		;$008F73	|
label_008F75:				;			|
	PLY						;$008F75	|
	PLX						;$008F76	|
	PLA						;$008F77	|
	JSL label_008F35		;$008F78	|
	TXA						;$008F7C	|
	RTL						;$008F7D	|

label_008F7E:
	JSR label_0091E3		;$008F7E	|
	PLY						;$008F81	|
	PLX						;$008F82	|
	PLA						;$008F83	|
	JSL label_008F35		;$008F84	|
	LDA $62BC,X				;$008F88	|
	BMI label_008F91		;$008F8B	|
	CPX $39					;$008F8D	|
	BNE label_008F9A		;$008F8F	|
label_008F91:				;			|
	TYA						;$008F91	|
	STA $61BC,X				;$008F92	|
	JSR label_009180		;$008F95	|
	TXA						;$008F98	|
	RTL						;$008F99	|

label_008F9A:
	PHX						;$008F9A	|
	LDA $61BC,X				;$008F9B	|
	LDX #$0000				;$008F9E	|
	CPY $601E				;$008FA1	|
	BEQ label_008FA8		;$008FA4	|
	BCS label_008FAB		;$008FA6	|
label_008FA8:				;			|
	LDX #$0004				;$008FA8	|
label_008FAB:				;			|
	CMP $601E				;$008FAB	|
	BEQ label_008FB2		;$008FAE	|
	BCS label_008FB4		;$008FB0	|
label_008FB2:				;			|
	INX						;$008FB2	|
	INX						;$008FB3	|
label_008FB4:				;			|
	JMP (label_008FB7,X)	;$008FB4	|

label_008FB7:				;$008FB7	|
	dw label_008FBF			; 00 - 
	dw label_008FC9			; 02 - 
	dw label_008FDF			; 04 - 
	dw label_008FBF			; 06 - 

label_008FBF:
	PLX						;$008FBF	|
	TYA						;$008FC0	|
	STA $61BC,X				;$008FC1	|
	JSR label_009180		;$008FC4	|
	TXA						;$008FC7	|
	RTL						;$008FC8	|

label_008FC9:
	PLX						;$008FC9	|
	TYA						;$008FCA	|
	STA $61BC,X				;$008FCB	|
	JSR label_009180		;$008FCE	|
	JSR label_0091C2		;$008FD1	|
	LDA $623C,X				;$008FD4	|
	AND #$BFFF				;$008FD7	|
	STA $623C,X				;$008FDA	|
	TXA						;$008FDD	|
	RTL						;$008FDE	|

label_008FDF:
	PLX						;$008FDF	|
	TYA						;$008FE0	|
	STA $61BC,X				;$008FE1	|
	JSR label_009180		;$008FE4	|
	LDA $623C,X				;$008FE7	|
	ORA #$4000				;$008FEA	|
	STA $623C,X				;$008FED	|
	TXA						;$008FF0	|
	RTL						;$008FF1	|




	
label_008FF2:
	LDA #$2000				;$008FF2	|
	STA $3012				;$008FF5	|
	PEA label_008FFE-1		;$008FF8	|
	JMP ($6020)				;$008FFB	|
label_008FFE:				;			|
	LDA #$C000				;$008FFE	|
	STA $6336				;$009001	|
	STA $6338				;$009004	|
	STA $633A				;$009007	|
	LDX $6014				;$00900A	|
label_00900D:				;			|
	STX $39					;$00900D	|
label_00900F:				;			|
	CPX #$0080				;$00900F	|
	BCS label_00900F		;$009012	|
	STX $736E				;$009014	|
	LDA $603C,X				;$009017	|
	STA $6018				;$00901A	|
	LDA $61BC,X				;$00901D	|
	STA $601E				;$009020	|
	JSR label_009091		;$009023	|
	LDX $601A				;$009026	|
	BMI label_00904F		;$009029	|
	LDA $6018				;$00902B	|
	PHA						;$00902E	|
label_00902F:				;			|
	STX $39					;$00902F	|
	LDA $613C,X				;$009031	|
	STA $6018				;$009034	|
	LDA #$FFFF				;$009037	|
	STA $613C,X				;$00903A	|
	JSR label_009091		;$00903D	|
	LDX $6018				;$009040	|
	BPL label_00902F		;$009043	|
	STX $601A				;$009045	|
	STX $601C				;$009048	|
	PLX						;$00904B	|
	STX $6018				;$00904C	|
label_00904F:				;			|
	LDX $6018				;$00904F	|
	BPL label_00900D		;$009052	|
	STX $39					;$009054	|
	LDA $32E2				;$009056	|
	BEQ label_00905F		;$009059	|
	JSL $05EBC9				;$00905B	|
label_00905F:				;			|
	JSL $01A27D				;$00905F	|
	PEA.w label_009069-1	;$009063	|
	JMP ($6026)				;$009066	|
label_009069:				;			|
	JSL $01A995				;$009069	|
	PEA.w label_009073-1	;$00906D	|
	JMP ($6024)				;$009070	|
label_009073:				;			|
	LDA #$FFFF				;$009073	|
	STA $39					;$009076	|
	PEA.w label_00907E-1	;$009078	|
	JMP ($6022)				;$00907B	|
label_00907E:				;			|
	LDY $6014				;$00907E	|
label_009081:				;			|
	TYX						;$009081	|
	LDA $62BC,X				;$009082	|
	AND #$7FFF				;$009085	|
	STA $62BC,X				;$009088	|
	LDY $603C,X				;$00908B	|
	BPL label_009081		;$00908E	|
	RTL						;$009090	|

label_009091:
	LDA #$2000				;$009091	|
	BIT $62BC,X				;$009094	|
	BPL label_00909C		;$009097	|
	JMP label_00911B		;$009099	|
label_00909C:				;			|
	BVS label_009110		;$00909C	|
	BNE label_0090E7		;$00909E	|
	BIT $6818,X				;$0090A0	|
	BMI label_0090E2		;$0090A3	|
	BVS label_0090BB		;$0090A5	|
	BEQ label_0090B5		;$0090A7	|
	LDA #$928F				;$0090A9	|
	LDX #$0000				;$0090AC	|
	JSL SA1_ExecuteSNES		;$0090AF	|
	BRA label_0090E2		;$0090B3	|

label_0090B5:
	JSL label_00928F		;$0090B5	|
	BRA label_0090E2		;$0090B9	|

label_0090BB:
	DEC $6724,X				;$0090BB	|
	BPL label_0090E2		;$0090BE	|
	LDA $679E,X				;$0090C0	|
	STA $6028				;$0090C3	|
	LDA $6818,X				;$0090C6	|
	STA $602A				;$0090C9	|
	AND #$2000				;$0090CC	|
	BEQ label_0090DD		;$0090CF	|
	LDA #$9126				;$0090D1	|
	LDX #$0000				;$0090D4	|
	JSL SA1_ExecuteSNES		;$0090D7	|
	BRA label_0090E2		;$0090DB	|

label_0090DD:
	TXY						;$0090DD	|
	JSL label_009258		;$0090DE	|
label_0090E2:				;			|
	LDX $39					;$0090E2	|
	JSR ($66AA,X)			;$0090E4	|
label_0090E7:				;			|
	LDX $39					;$0090E7	|
	LDA $63B6,X				;$0090E9	|
	BMI label_009110		;$0090EC	|
	STA $602A				;$0090EE	|
	LDA $633C,X				;$0090F1	|
	STA $6028				;$0090F4	|
	LDA $6818,X				;$0090F7	|
	AND #$2000				;$0090FA	|
	BEQ label_00910B		;$0090FD	|
	LDA #$9126				;$0090FF	|
	LDX #$0000				;$009102	|
	JSL SA1_ExecuteSNES		;$009105	|
	BRA label_009110		;$009109	|

label_00910B:
	TXY						;$00910B	|
	JSL label_009258		;$00910C	|
label_009110:				;			|
	LDX $39					;$009110	|
	LDA $62BC,X				;$009112	|
	ORA #$8000				;$009115	|
	STA $62BC,X				;$009118	|
label_00911B:				;			|
	LDX $39					;$00911B	|
label_00911D:				;			|
	CPX #$0080				;$00911D	|
	BCS label_00911D		;$009120	|
	STX $7370				;$009122	|
	RTS						;$009125	|
	LDX $39					;$009126	|
	TXY						;$009128	|
	JMP [$6028]				;$009129	|
	JSR label_009130		;$00912C	|
	RTL						;$00912F	|





label_009130:
	LDX $6010				;$009130	|
label_009133:				;			|
	LDA $623C,X				;$009133	|
	BMI label_009140		;$009136	|
	INX						;$009138	|
	INX						;$009139	|
	CPX $6012				;$00913A	|
	BCC label_009133		;$00913D	|
	RTS						;$00913F	|

label_009140:
	CLC						;$009140	|
	RTS						;$009141	|

label_009142:
	JSR label_009146		;$009142	|
	RTL						;$009145	|

label_009146:
	CPX #$007A				;$009146	|
	BCS label_00917B		;$009149	|
	PHA						;$00914B	|
	PHY						;$00914C	|
	LDA $623C,X				;$00914D	|
	BMI label_009179		;$009150	|
	CPX #$0006				;$009152	|
	BCC label_009167		;$009155	|
	CPX #$0040				;$009157	|
	BCS label_009167		;$00915A	|
	CPX #$0018				;$00915C	|
	BCC label_009164		;$00915F	|
	STZ $7936,X				;$009161	|
label_009164:				;			|
	STZ $3517,X				;$009164	|
label_009167:				;			|
	JSR label_0091E3		;$009167	|
	LDA #$FFFF				;$00916A	|
	STA $623C,X				;$00916D	|
	STA $62BC,X				;$009170	|
	STA $603C,X				;$009173	|
	STA $60BC,X				;$009176	|
label_009179:				;			|
	PLY						;$009179	|
	PLA						;$00917A	|
label_00917B:				;			|
	RTS						;$00917B	|





label_00917C:
	JSR label_009180		;$00917C	|
	RTL						;$00917F	|

label_009180:
	LDA $602C,Y				;$009180	|
	BPL label_009192		;$009183	|
	TXA						;$009185	|
	STA $602C,Y				;$009186	|
label_009189:				;			|
	LDA $602A,Y				;$009189	|
	BPL label_009198		;$00918C	|
	DEY						;$00918E	|
	DEY						;$00918F	|
	BNE label_009189		;$009190	|
label_009192:				;			|
	PHA						;$009192	|
	TXA						;$009193	|
	STA $602C,Y				;$009194	|
	PLA						;$009197	|
label_009198:				;			|
	TAY						;$009198	|
	STA $60BC,X				;$009199	|
	LDA $603C,Y				;$00919C	|
	STA $603C,X				;$00919F	|
	PHA						;$0091A2	|
	TXA						;$0091A3	|
	STA $603C,Y				;$0091A4	|
	PLY						;$0091A7	|
	STA $60BC,Y				;$0091A8	|
	RTS						;$0091AB	|





label_0091AC:
	LDY $39					;$0091AC	|
	BMI label_0091DE		;$0091AE	|
	LDA $61BC,X				;$0091B0	|
	CMP $601E				;$0091B3	|
	BCC label_0091C2		;$0091B6	|
	TYA						;$0091B8	|
	CMP $60BC,X				;$0091B9	|
	BNE label_0091C1		;$0091BC	|
	STX $6018				;$0091BE	|
label_0091C1:				;			|
	RTS						;$0091C1	|

label_0091C2:
	LDA $613C,X				;$0091C2	|
	BPL label_0091DE		;$0091C5	|
	LDY $601C				;$0091C7	|
	BPL label_0091D1		;$0091CA	|
	STX $601A				;$0091CC	|
	BRA label_0091D5		;$0091CF	|

label_0091D1:
	TXA						;$0091D1	|
	STA $613C,Y				;$0091D2	|
label_0091D5:				;			|
	LDA #$FFFF				;$0091D5	|
	STA $613C,X				;$0091D8	|
	STX $601C				;$0091DB	|
label_0091DE:				;			|
	RTS						;$0091DE	|





label_0091DF:
	JSR label_0091E3		;$0091DF	|
	RTL						;$0091E2	|

label_0091E3:
	PHX						;$0091E3	|
	PHX						;$0091E4	|
	LDY $60BC,X				;$0091E5	|
	LDA $603C,X				;$0091E8	|
	TAX						;$0091EB	|
	STA $603C,Y				;$0091EC	|
	TYA						;$0091EF	|
	STA $60BC,X				;$0091F0	|
	PLX						;$0091F3	|
	LDY $61BC,X				;$0091F4	|
	TXA						;$0091F7	|
	CMP $602C,Y				;$0091F8	|
	BNE label_00920E		;$0091FB	|
	TYA						;$0091FD	|
	LDY $60BC,X				;$0091FE	|
	CMP $61BC,Y				;$009201	|
	BEQ label_009209		;$009204	|
	LDY #$FFFF				;$009206	|
label_009209:				;			|
	TAX						;$009209	|
	TYA						;$00920A	|
	STA $602C,X				;$00920B	|
label_00920E:				;			|
	PLX						;$00920E	|
	CPX $6018				;$00920F	|
	BNE label_00921A		;$009212	|
	LDA $603C,X				;$009214	|
	STA $6018				;$009217	|
label_00921A:				;			|
	RTS						;$00921A	|





label_00921B:
	DEC A					;$00921B	|
	DEC A					;$00921C	|
	CMP $61BC,X				;$00921D	|
	CLC						;$009220	|
	BEQ label_009239		;$009221	|
	PHA						;$009223	|
	CPX $39					;$009224	|
	BNE label_009231		;$009226	|
	LDA $623C,X				;$009228	|
	ORA #$4000				;$00922B	|
	STA $623C,X				;$00922E	|
label_009231:				;			|
	JSR label_0091E3		;$009231	|
	PLY						;$009234	|
	JSR label_009180		;$009235	|
	SEC						;$009238	|
label_009239:				;			|
	RTL						;$009239	|





label_00923A:
	INC $3D					;$00923A	|
	LDA [$3D]				;$00923C	|
	AND #$00FF				;$00923E	|
	RTS						;$009241	|

label_009242:
	INC $3D					;$009242	|
	LDA [$3D]				;$009244	|
	AND #$00FF				;$009246	|
	RTL						;$009249	|

label_00924A:
	INC $3D					;$00924A	|
	LDA [$3D]				;$00924C	|
	INC $3D					;$00924E	|
	RTS						;$009250	|

label_009251:
	INC $3D					;$009251	|
	LDA [$3D]				;$009253	|
	INC $3D					;$009255	|
	RTL						;$009257	|



label_009258:
	JMP [$6028]				;$009258	| - Seems to be used to jump to one of the entry points at $00DE6B.

label_00925B:
	JSR label_00925F		;$00925B	|
	RTL						;$00925E	|



label_00925F:
	LDA #$8F63				;$00925F	|
	STA $633C,X				;$009262	|
	LDA #$0000				;$009265	|
	STA $63B6,X				;$009268	|
	RTS						;$00926B	|

label_00926C:
	PHA						;$00926C	|
	PHX						;$00926D	|
	LDX $39					;$00926E	|
	LDA #$2000				;$009270	|
	TSB $3F					;$009273	|
	ORA $6818,X				;$009275	|
	STA $6818,X				;$009278	|
	PLX						;$00927B	|
	PLA						;$00927C	|
	RTL						;$00927D	|

label_00927E:
	PHA						;$00927E	|
	PHX						;$00927F	|
	LDX $39					;$009280	|
	LDA $3F					;$009282	|
	AND #$DFFF				;$009284	|
	STA $3F					;$009287	|
	STA $6818,X				;$009289	|
	PLX						;$00928C	|
	PLA						;$00928D	|
	RTL						;$00928E	|





label_00928F:
	LDY $39					;$00928F	|
	LDA $679E,Y				;$009291	|
	STA $3D					;$009294	|
	LDA $6818,Y				;$009296	|
	STA $3F					;$009299	|
	LDA $721A,Y				;$00929B	|
	STA $3B					;$00929E	|
	LDA $6724,Y				;$0092A0	|
	BNE label_0092AF		;$0092A3	|
label_0092A5:				;			|
	JSR label_0092C3		;$0092A5	|
	LDY $39					;$0092A8	|
	LDA $6724,Y				;$0092AA	|
	BEQ label_0092A5		;$0092AD	|
label_0092AF:
	DEC A					;$0092AF	|
	STA $6724,Y				;$0092B0	|
	LDA $3D					;$0092B3	|
	STA $679E,Y				;$0092B5	|
	LDA $3F					;$0092B8	|
	STA $6818,Y				;$0092BA	|
	LDA $3B					;$0092BD	|
	STA $721A,Y				;$0092BF	|
	RTL						;$0092C2	|



label_0092C3:
	LDA [$3D]				;$0092C3	|
	AND #$00FF				;$0092C5	|
	CMP #$0040				;$0092C8	|
	BCS label_0092D2		;$0092CB	|
	ASL A					;$0092CD	|
	TAX						;$0092CE	|
	JMP (label_0092E4,X)	;$0092CF	|

label_0092D2:
	TAX						;$0092D2	|
	AND #$000F				;$0092D3	|
	STA $6724,Y				;$0092D6	|
	TXA						;$0092D9	|
	AND #$00F0				;$0092DA	|
	LSR A					;$0092DD	|
	LSR A					;$0092DE	|
	LSR A					;$0092DF	|
	TAX						;$0092E0	|
	JMP (label_009348,X)	;$0092E1	|

label_0092E4:				;$0092E4	| Pointers to various routines? Similar to the table at $0093E1.
	dw label_009453			; 00
	dw label_009463			; 01
	dw label_00946D			; 02
	dw label_00947A			; 03
	dw label_009491			; 04
	dw label_009497			; 05
	dw label_0094B3			; 06
	dw label_0094B8			; 07
	dw label_0094F2			; 08
	dw label_009519			; 09
	dw label_00952F			; 0A
	dw label_009544			; 0B
	dw label_009570			; 0C
	dw label_00957C			; 0D
	dw label_00958F			; 0E
	dw label_009597			; 0F
	dw label_0095A9			; 10
	dw label_0095B5			; 11
	dw label_0094D1			; 12
	dw label_0094EB			; 13
	dw label_0095C1			; 14
	dw label_0095D7			; 15
	dw label_0095E3			; 16
	dw label_0095EF			; 17
	dw label_0095FB			; 18
	dw label_00960B			; 19
	dw label_00962A			; 1A
	dw label_00963F			; 1B
	dw label_00969A			; 1C
	dw label_00967B			; 1D
	dw label_0096B3			; 1E
	dw label_0096AC			; 1F
	dw label_0096EC			; 20
	dw label_009703			; 21
	dw label_00971A			; 22
	dw label_009731			; 23
	dw label_0099D7			; 24
	dw label_0099E7			; 25
	dw label_009748			; 26
	dw label_00975A			; 27
	dw label_00976C			; 28
	dw label_00977C			; 29
	dw label_00978C			; 2A
	dw label_0097A4			; 2B
	dw label_0097BC			; 2C
	dw label_0097D5			; 2D
	dw label_0097EE			; 2E
	dw label_009806			; 2F
	dw label_00982D			; 30
	dw label_009854			; 31
label_009348:				;````
	dw label_009882			; 32 / 0x
	dw label_0099A0			; 33 / 1x
	dw label_0099AC			; 34 / 2x
	dw label_0098C5			; 35 / 3x
	dw label_0098B0			; 36 / 4x
	dw label_00993C			; 37 / 5x
	dw label_009955			; 38 / 6x
	dw label_00995C			; 39 / 7x
	dw label_0099F1			; 3A / 8x
	dw label_0099FD			; 3B / 9x
	dw label_009A09			; 3C / Ax
	dw label_009A15			; 3D / Bx
	dw label_009963			; 3E / Cx
	dw label_009983			; 3F / Dx



label_009364:
	TYX						;$009364	|
	STA $99C9,Y				;$009365	|
	STZ $41					;$009368	|
	LDA $41					;$00936A	|
	JSL label_009392		;$00936C	|
	LDA $41					;$009370	|
	CMP #$0002				;$009372	|
	CLC						;$009375	|
	BNE label_009379		;$009376	|
	SEC						;$009378	|
label_009379:				;			|
	RTL						;$009379	|



label_00937A:
	STA $679E,Y				;$00937A	|
	TXA						;$00937D	|
	SEP #$20				;$00937E	|
	STA $6818,Y				;$009380	|
	REP #$20				;$009383	|
	TYA						;$009385	|
	ASL A					;$009386	|
	ASL A					;$009387	|
	STA $721A,Y				;$009388	|
	LDA #$0000				;$00938B	|
	STA $6724,Y				;$00938E	|
	RTL						;$009391	|



label_009392:
	LDY $39					;$009392	|
	LDA $679E,Y				;$009394	|
	STA $3D					;$009397	|
	LDA $6818,Y				;$009399	|
	STA $3F					;$00939C	|
	LDA $721A,Y				;$00939E	|
	STA $3B					;$0093A1	|
	LDA $6724,Y				;$0093A3	|
	BNE label_0093B2		;$0093A6	|
label_0093A8:				;			|
	JSR label_0093C6		;$0093A8	|
	LDY $39					;$0093AB	|
	LDA $6724,Y				;$0093AD	|
	BEQ label_0093A8		;$0093B0	|
label_0093B2:				;			|
	DEC A					;$0093B2	|
	STA $6724,Y				;$0093B3	|
	LDA $3D					;$0093B6	|
	STA $679E,Y				;$0093B8	|
label_0093B9:				;			|
	LDA $3F					;$0093BB	|
	STA $6818,Y				;$0093BD	|
	LDA $3B					;$0093C0	|
	STA $721A,Y				;$0093C2	|
	RTL						;$0093C5	|


label_0093C6:
	LDA [$3D]				;$0093C6	|
	AND #$00FF				;$0093C8	|
	LSR A					;$0093CB	|
	BCC label_0093DA		;$0093CC	|
	PHA						;$0093CE	|
	INC $3D					;$0093CF	|
	LDA [$3D]				;$0093D1	|
	AND #$00FF				;$0093D3	|
	STA $6724,Y				;$0093D6	|
	PLA						;$0093D9	|
label_0093DA:				;			|
	ASL A					;$0093DA	|
	STA $41					;$0093DB	|
	TAX						;$0093DD	|
	JMP (label_0093E1,X)	;$0093DE	|

label_0093E1:				;$0093E1	| Pointers to various routines? Similar to the table at $0092E4.
	dw label_009453			; 00
	dw label_009463			; 01
	dw label_00946D			; 02
	dw label_009497			; 03
	dw label_0094B3			; 04
	dw label_0094B8			; 05
	dw label_009544			; 06
	dw label_009570			; 07
	dw label_00958F			; 08
	dw label_009597			; 09
	dw label_0095A9			; 0A
	dw label_0095B5			; 0B
	dw label_0095C1			; 0C
	dw label_0095D7			; 0D
	dw label_0095E3			; 0E
	dw label_0095EF			; 0F
	dw label_0095FB			; 10
	dw label_00960B			; 11
	dw label_00962A			; 12
	dw label_00963F			; 13
	dw label_009652			; 14
	dw label_009668			; 15
	dw label_0096EC			; 16
	dw label_009703			; 17
	dw label_0099A0			; 18
	dw label_0099AC			; 19
	dw label_0099D7			; 1A
	dw label_0099F1			; 1B
	dw label_0099FD			; 1C
	dw label_009A09			; 1D
	dw label_009A15			; 1E
	dw label_0098B0			; 1F
	dw label_00993C			; 20
	dw label_009955			; 21
	dw label_00995C			; 22
	dw label_0098C5			; 23
	dw label_0098D1			; 24
	dw label_009902			; 25
	dw label_009936			; 26
	dw label_009963			; 27
	dw label_009983			; 28
	dw label_0099BB			; 29
	dw label_0099C9			; 2A
	dw label_009A21			; 2B
	dw label_009A31			; 2C
	dw label_009A3D			; 2D
	dw label_009A49			; 2E
	dw label_009A55			; 2F
	dw label_009A61			; 30
	dw label_009A71			; 31
	dw label_009A7D			; 32
	dw label_009A89			; 33
	dw label_009A95			; 34
	dw label_009AA1			; 35
	dw label_009AAD			; 36
	dw label_009AB9			; 37
	dw label_009AC5			; 38



label_009453:				;-----------|
	TYX						;$009453	|
	INC $6724,X				;$009454	|
	LDA #$A6EC				;$009457	|
	STA $66AA,X				;$00945A	|
	JSR label_00925F		;$00945D	|
	JMP label_009146		;$009460	|

label_009463:				;-----------|
	TYX						;$009463	|
	INC $6724,X				;$009464	|
	LDA #$8000				;$009467	|
	TSB $3F					;$00946A	|
	RTS						;$00946C	|

label_00946D:				;-----------|
	INC $3D					;$00946D	|
	LDA [$3D]				;$00946F	|
	AND #$00FF				;$009471	|
	STA $6724,Y				;$009474	|
	INC $3D					;$009477	|
	RTS						;$009479	|

label_00947A:				;-----------|
	INC $3D					;$00947A	|
	LDA [$3D]				;$00947C	|
	STA $633C,Y				;$00947E	|
	INC $3D					;$009481	|
	INC $3D					;$009483	|
	SEP #$20				;$009485	|
	LDA [$3D]				;$009487	|
	STA $63B6,Y				;$009489	|
	REP #$20				;$00948C	|
	INC $3D					;$00948E	|
	RTS						;$009490	|

label_009491:				;-----------|
	TYX						;$009491	|
	INC $3D					;$009492	|
	JMP label_00925F		;$009494	|

label_009497:				;-----------|
	INC $3D					;$009497	|
	LDA [$3D]				;$009499	|
label_00949B:				;			|
	PHA						;$00949B	|
	LDX $3B					;$00949C	|
	INC $3D					;$00949E	|
	LDA $3D					;$0094A0	|
	STA $727A,X				;$0094A2	|
	INX						;$0094A5	|
	INX						;$0094A6	|
	PLA						;$0094A7	|
	SEP #$20				;$0094A8	|
	STA $727A,X				;$0094AA	|
	REP #$20				;$0094AD	|
	INX						;$0094AF	|
	STX $3B					;$0094B0	|
	RTS						;$0094B2	|

label_0094B3:				;-----------|
	LDA $724A,Y				;$0094B3	|
	BRA label_00949B		;$0094B6	|


label_0094B8:				;-----------|
	LDX $3B					;$0094B8	|
	SEP #$20				;$0094BA	|
	DEC $7279,X				;$0094BC	|
	REP #$20				;$0094BF	|
	BEQ label_0094C9		;$0094C1	|
	LDA $7277,X				;$0094C3	|
	STA $3D					;$0094C6	|
	RTS						;$0094C8	|

label_0094C9:				;-----------|
	DEX						;$0094C9	|
	DEX						;$0094CA	|
	DEX						;$0094CB	|
	STX $3B					;$0094CC	|
	INC $3D					;$0094CE	|
	RTS						;$0094D0	|

label_0094D1:				;-----------|
	LDA $724A,Y				;$0094D1	|
	BNE label_0094E4		;$0094D4	|
label_0094D6:				;			|
	INC $3D					;$0094D6	|
	LDA [$3D]				;$0094D8	|
	STA $3D					;$0094DA	|
	LDX $3B					;$0094DC	|
	DEX						;$0094DE	|
	DEX						;$0094DF	|
	DEX						;$0094E0	|
	STX $3B					;$0094E1	|
	RTS						;$0094E3	|

label_0094E4:				;-----------|
	INC $3D					;$0094E4	|
	INC $3D					;$0094E6	|
	INC $3D					;$0094E8	|
	RTS						;$0094EA	|

label_0094EB:				;-----------|
	LDA $724A,Y				;$0094EB	|
	BEQ label_0094E4		;$0094EE	|
	BNE label_0094D6		;$0094F0	|
label_0094F2:				;-----------|
	LDX $3B					;$0094F2	|
	INC $3D					;$0094F4	|
	LDA [$3D]				;$0094F6	|
	TAY						;$0094F8	|
	INC $3D					;$0094F9	|
	INC $3D					;$0094FB	|
	SEP #$20				;$0094FD	|
	LDA $3F					;$0094FF	|
	STA $727C,X				;$009501	|
	LDA [$3D]				;$009504	|
	STA $3F					;$009506	|
	REP #$20				;$009508	|
	LDA $3D					;$00950A	|
	INC A					;$00950C	|
	STA $727A,X				;$00950D	|
	STY $373D				;$009510	|
	INX						;$009513	|
	INX						;$009514	|
	INX						;$009515	|
	STX $3B					;$009516	|
	RTS						;$009518	|

label_009519:				;-----------|
	LDX $3B					;$009519	|
	DEX						;$00951B	|
	SEP #$20				;$00951C	|
	LDA $727A,X				;$00951E	|
	STA $3F					;$009521	|
	REP #$20				;$009523	|
	DEX						;$009525	|
	DEX						;$009526	|
	LDA $727A,X				;$009527	|
	STA $3D					;$00952A	|
	STX $3B					;$00952C	|
	RTS						;$00952E	|

label_00952F:				;-----------|
	LDX $3B					;$00952F	|
	INC $3D					;$009531	|
	LDA [$3D]				;$009533	|
	TAY						;$009535	|
	LDA $3D					;$009536	|
	INC A					;$009538	|
	INC A					;$009539	|
	STA $727A,X				;$00953A	|
	STY $3D					;$00953D	|
	INX						;$00953F	|
	INX						;$009540	|
	STX $3B					;$009541	|
	RTS						;$009543	|

label_009544:				;-----------|
	INC $3D					;$009544	|
	LDA [$3D]				;$009546	|
	INC $3D					;$009548	|
	AND #$00FF				;$00954A	|
	CMP $724A,Y				;$00954D	|
	BCC label_00956A		;$009550	|
	BEQ label_00956A		;$009552	|
	LDX $3B					;$009554	|
	ASL A					;$009556	|
	ADC $3D					;$009557	|
	STA $727A,X				;$009559	|
	INX						;$00955C	|
	INX						;$00955D	|
	STX $3B					;$00955E	|
label_009560:				;			|
	LDA $724A,Y				;$009560	|
	ASL A					;$009563	|
	TAY						;$009564	|
	LDA [$3D],Y				;$009565	|
	STA $3D					;$009567	|
	RTS						;$009569	|

label_00956A:				;-----------|
	ASL A					;$00956A	|
	ADC $3D					;$00956B	|
	STA $3D					;$00956D	|
	RTS						;$00956F	|

label_009570:				;-----------|
	LDX $3B					;$009570	|
	DEX						;$009572	|
	DEX						;$009573	|
	LDA $727A,X				;$009574	|
	STA $3D					;$009577	|
	STX $3B					;$009579	|
	RTS						;$00957B	|

label_00957C:				;-----------|
	LDY #$0001				;$00957C	|
	LDA [$3D],Y				;$00957F	|
	TAX						;$009581	|
	SEP #$20				;$009582	|
	INY						;$009584	|
	INY						;$009585	|
	LDA [$3D],Y				;$009586	|
	STA $3F					;$009588	|
	REP #$20				;$00958A	|
	STX $3D					;$00958C	|
	RTS						;$00958E	|

label_00958F:				;-----------|
	LDY #$0001				;$00958F	|
	LDA [$3D],Y				;$009592	|
	STA $3D					;$009594	|
	RTS						;$009596	|

label_009597:				;-----------|
	INC $3D					;$009597	|
	LDA [$3D]				;$009599	|
	INC $3D					;$00959B	|
	AND #$00FF				;$00959D	|
	CMP $724A,Y				;$0095A0	|
	BCC label_00956A		;$0095A3	|
	BNE label_009560		;$0095A5	|
	BRA label_00956A		;$0095A7	|

label_0095A9:				;-----------|
	LDA $724A,Y				;$0095A9	|
	BEQ label_00958F		;$0095AC	|
	INC $3D					;$0095AE	|
	INC $3D					;$0095B0	|
	INC $3D					;$0095B2	|
	RTS						;$0095B4	|

label_0095B5:				;-----------|
	LDA $724A,Y				;$0095B5	|
	BNE label_00958F		;$0095B8	|
	INC $3D					;$0095BA	|
	INC $3D					;$0095BC	|
	INC $3D					;$0095BE	|
	RTS						;$0095C0	|

label_0095C1:				;-----------|
	INC $3D					;$0095C1	|
	LDA [$3D]				;$0095C3	|
	STA $6536,Y				;$0095C5	|
	INC $3D					;$0095C8	|
	INC $3D					;$0095CA	|
	LDA [$3D]				;$0095CC	|
	AND #$00FF				;$0095CE	|
	STA $65B0,Y				;$0095D1	|
	INC $3D					;$0095D4	|
	RTS						;$0095D6	|

label_0095D7:				;-----------|
	INC $3D					;$0095D7	|
	LDA [$3D]				;$0095D9	|
	STA $6630,Y				;$0095DB	|
	INC $3D					;$0095DE	|
	INC $3D					;$0095E0	|
	RTS						;$0095E2	|

label_0095E3:				;-----------|
	INC $3D					;$0095E3	|
	LDA [$3D]				;$0095E5	|
	STA $66AA,Y				;$0095E7	|
	INC $3D					;$0095EA	|
	INC $3D					;$0095EC	|
	RTS						;$0095EE	|

label_0095EF:				;-----------|
	INC $3D					;$0095EF	|
	LDA [$3D]				;$0095F1	|
	STA $724A,Y				;$0095F3	|
	INC $3D					;$0095F6	|
	INC $3D					;$0095F8	|
	RTS						;$0095FA	|

label_0095FB:				;-----------|
	INC $3D					;$0095FB	|
	LDA [$3D]				;$0095FD	|
	STA $14					;$0095FF	|
	LDA ($14)				;$009601	|
	STA $724A,Y				;$009603	|
	INC $3D					;$009606	|
	INC $3D					;$009608	|
	RTS						;$00960A	|

label_00960B:				;-----------|
	INC $3D					;$00960B	|
	LDA [$3D]				;$00960D	|
	AND #$00FF				;$00960F	|
	ASL A					;$009612	|
	TAX						;$009613	|
	LDA.l DATA_008D6F,X		;$009614	|
	STA $14					;$009618	|
	LDA #$0000				;$00961A	|
	STA $16					;$00961D	|
	INC $3D					;$00961F	|
	LDA [$3D]				;$009621	|
	STA [$14],Y				;$009623	|
	INC $3D					;$009625	|
	INC $3D					;$009627	|
	RTS						;$009629	|

label_00962A:				;-----------|
	INC $3D					;$00962A	|
	LDA [$3D]				;$00962C	|
	STA $14					;$00962E	|
	INC $3D					;$009630	|
	INC $3D					;$009632	|
	SEP #$20				;$009634	|
	LDA [$3D]				;$009636	|
	STA ($14)				;$009638	|
	REP #$20				;$00963A	|
	INC $3D					;$00963C	|
	RTS						;$00963E	|

label_00963F:				;-----------|
	INC $3D					;$00963F	|
	LDA [$3D]				;$009641	|
	STA $14					;$009643	|
	INC $3D					;$009645	|
	INC $3D					;$009647	|
	LDA [$3D]				;$009649	|
	STA ($14)				;$00964B	|
	INC $3D					;$00964D	|
	INC $3D					;$00964F	|
	RTS						;$009651	|

label_009652:				;-----------|
	INC $3D					;$009652	|
	LDA [$3D]				;$009654	|
	CLC						;$009656	|
	ADC $39					;$009657	|
	STA $14					;$009659	|
	INC $3D					;$00965B	|
	INC $3D					;$00965D	|
	LDA [$3D]				;$00965F	|
	STA ($14)				;$009661	|
	INC $3D					;$009663	|
	INC $3D					;$009665	|
	RTS						;$009667	|

label_009668:				;-----------|
	INC $3D					;$009668	|
	LDA [$3D]				;$00966A	|
	CLC						;$00966C	|
	ADC $39					;$00966D	|
	STA $14					;$00966F	|
	LDA ($14)				;$009671	|
	STA $724A,Y				;$009673	|
	INC $3D					;$009676	|
	INC $3D					;$009678	|
	RTS						;$00967A	|

label_00967B:				;-----------|
	INC $3D					;$00967B	|
	LDA [$3D]				;$00967D	|
	STA $14					;$00967F	|
	INC $3D					;$009681	|
	INC $3D					;$009683	|
	LDA [$3D]				;$009685	|
	AND #$00FF				;$009687	|
	ASL A					;$00968A	|
	TAX						;$00968B	|
	INC $3D					;$00968C	|
	LDA [$3D]				;$00968E	|
	INC $3D					;$009690	|
	SEP #$20				;$009692	|
	JSR (label_0096CF,X)	;$009694	|

label_009697:				;-----------|
	REP #$20				;$009697	|
	RTS						;$009699	|

label_00969A:				;-----------|
	INC $3D					;$00969A	|
	LDA [$3D]				;$00969C	|
	AND #$00FF				;$00969E	|
	ASL A					;$0096A1	|
	TAX						;$0096A2	|
	LDA.l DATA_008D6F,X		;$0096A3	|
	CLC						;$0096A7	|
	ADC $39					;$0096A8	|
	BRA label_0096B9		;$0096AA	|

label_0096AC:				;-----------|
	TYA						;$0096AC	|
	CLC						;$0096AD	|
	ADC #$724A				;$0096AE	|
	BRA label_0096B9		;$0096B1	|

label_0096B3:				;-----------|
	INC $3D					;$0096B3	|
	LDA [$3D]				;$0096B5	|
	INC $3D					;$0096B7	|
label_0096B9:				;			|
	INC $3D					;$0096B9	|
	STA $14					;$0096BB	|
	LDA [$3D]				;$0096BD	|
	AND #$00FF				;$0096BF	|
	ASL A					;$0096C2	|
	TAX						;$0096C3	|
	INC $3D					;$0096C4	|
	LDA [$3D]				;$0096C6	|
	INC $3D					;$0096C8	|
	INC $3D					;$0096CA	|
	JMP (label_0096CF,X)	;$0096CC	|

label_0096CF:
	dw label_0096D7
	dw label_0096DC
	dw label_0096E1
	dw label_0096E7

label_0096D7:				;```````````|
	AND ($14)				;$0096D7	|
	STA ($14)				;$0096D9	|
	RTS						;$0096DB	|

label_0096DC:				;```````````|
	ORA ($14)				;$0096DC	|
	STA ($14)				;$0096DE	|
	RTS						;$0096E0	|

label_0096E1:				;```````````|
	CLC						;$0096E1	|
	ADC ($14)				;$0096E2	|
	STA ($14)				;$0096E4	|
	RTS						;$0096E6	|

label_0096E7:				;```````````|
	EOR ($14)				;$0096E7	|
	STA ($14)				;$0096E9	|
	RTS						;$0096EB	|


label_0096EC:
	INC $3D					;$0096EC	|
	LDA [$3D]				;$0096EE	|
	AND #$00FF				;$0096F0	|
	ASL A					;$0096F3	|
	TAX						;$0096F4	|
	LDA.l DATA_008D6F,X		;$0096F5	|
	STA $14					;$0096F9	|
	LDA $724A,Y				;$0096FB	|
	STA ($14),Y				;$0096FE	|
	INC $3D					;$009700	|
	RTS						;$009702	|

label_009703:				;-----------|
	INC $3D					;$009703	|
	LDA [$3D]				;$009705	|
	AND #$00FF				;$009707	|
	ASL A					;$00970A	|
	TAX						;$00970B	|
	LDA.l DATA_008D6F,X		;$00970C	|
	STA $14					;$009710	|
	LDA ($14),Y				;$009712	|
	STA $724A,Y				;$009714	|
	INC $3D					;$009717	|
	RTS						;$009719	|

label_00971A:				;-----------|
	INC $3D					;$00971A	|
	LDA [$3D]				;$00971C	|
	AND #$00FF				;$00971E	|
	ASL A					;$009721	|
	TAX						;$009722	|
	LDA.l DATA_008D6F,X		;$009723	|
	STA $14					;$009727	|
	LDA ($14),Y				;$009729	|
	STA $6724,Y				;$00972B	|
	INC $3D					;$00972E	|
	RTS						;$009730	|

label_009731:				;-----------|
	INC $3D					;$009731	|
	LDA [$3D]				;$009733	|
	AND #$00FF				;$009735	|
	ASL A					;$009738	|
	TAX						;$009739	|
	LDA.l DATA_008D6F,X		;$00973A	|
	STA $14					;$00973E	|
	LDA ($14),Y				;$009740	|
	STA $6436,Y				;$009742	|
	INC $3D					;$009745	|
	RTS						;$009747	|

label_009748:				;-----------|
	INC $3D					;$009748	|
	LDA [$3D]				;$00974A	|
	STA $6986,Y				;$00974C	|
	LDA #$8000				;$00974F	|
	STA $6A7A,Y				;$009752	|
	INC $3D					;$009755	|
	INC $3D					;$009757	|
	RTS						;$009759	|

label_00975A:				;-----------|
	INC $3D					;$00975A	|
	LDA [$3D]				;$00975C	|
	STA $6A00,Y				;$00975E	|
	LDA #$8000				;$009761	|
	STA $6AF4,Y				;$009764	|
	INC $3D					;$009767	|
	INC $3D					;$009769	|
	RTS						;$00976B	|

label_00976C:				;-----------|
	INC $3D					;$00976C	|
	LDA [$3D]				;$00976E	|
	CLC						;$009770	|
	ADC $6986,Y				;$009771	|
	STA $6986,Y				;$009774	|
	INC $3D					;$009777	|
	INC $3D					;$009779	|
	RTS						;$00977B	|

label_00977C:				;-----------|
	INC $3D					;$00977C	|
	LDA [$3D]				;$00977E	|
	CLC						;$009780	|
	ADC $6A00,Y				;$009781	|
	STA $6A00,Y				;$009784	|
	INC $3D					;$009787	|
	INC $3D					;$009789	|
	RTS						;$00978B	|

label_00978C:				;-----------|
	INC $3D					;$00978C	|
	LDA [$3D]				;$00978E	|
	AND #$00FF				;$009790	|
	ASL A					;$009793	|
	TAX						;$009794	|
	INC $3D					;$009795	|
	LDA [$3D]				;$009797	|
	STA $3037,X				;$009799	|
	STZ $3043,X				;$00979C	|
	INC $3D					;$00979F	|
	INC $3D					;$0097A1	|
	RTS						;$0097A3	|

label_0097A4:				;-----------|
	INC $3D					;$0097A4	|
	LDA [$3D]				;$0097A6	|
	AND #$00FF				;$0097A8	|
	ASL A					;$0097AB	|
	TAX						;$0097AC	|
	INC $3D					;$0097AD	|
	LDA [$3D]				;$0097AF	|
	STA $303D,X				;$0097B1	|
	STZ $3049,X				;$0097B4	|
	INC $3D					;$0097B7	|
	INC $3D					;$0097B9	|
	RTS						;$0097BB	|

label_0097BC:				;-----------|
	INC $3D					;$0097BC	|
	LDA [$3D]				;$0097BE	|
	AND #$00FF				;$0097C0	|
	ASL A					;$0097C3	|
	TAX						;$0097C4	|
	INC $3D					;$0097C5	|
	LDA [$3D]				;$0097C7	|
	CLC						;$0097C9	|
	ADC $3037,X				;$0097CA	|
	STA $3037,X				;$0097CD	|
	INC $3D					;$0097D0	|
	INC $3D					;$0097D2	|
	RTS						;$0097D4	|

label_0097D5:				;-----------|
	INC $3D					;$0097D5	|
	LDA [$3D]				;$0097D7	|
	AND #$00FF				;$0097D9	|
	ASL A					;$0097DC	|
	TAX						;$0097DD	|
	INC $3D					;$0097DE	|
	LDA [$3D]				;$0097E0	|
	CLC						;$0097E2	|
	ADC $303D,X				;$0097E3	|
	STA $303D,X				;$0097E6	|
	INC $3D					;$0097E9	|
	INC $3D					;$0097EB	|
	RTS						;$0097ED	|

label_0097EE:				;-----------|
	INC $3D					;$0097EE	|
	LDA [$3D]				;$0097F0	|
	AND #$00FF				;$0097F2	|
	ASL A					;$0097F5	|
	TAX						;$0097F6	|
	STZ $734A,X				;$0097F7	|
	STZ $733A,X				;$0097FA	|
	STZ $7352,X				;$0097FD	|
	STZ $7342,X				;$009800	|
	INC $3D					;$009803	|
	RTS						;$009805	|

label_009806:				;-----------|
	INC $3D					;$009806	|
	LDA [$3D]				;$009808	|
	AND #$00FF				;$00980A	|
	ASL A					;$00980D	|
	TAX						;$00980E	|
	INC $3D					;$00980F	|
	LDA [$3D]				;$009811	|
	PHA						;$009813	|
	AND #$00FF				;$009814	|
	XBA						;$009817	|
	STA $734A,X				;$009818	|
	PLA						;$00981B	|
	AND #$FF00				;$00981C	|
	BPL label_009824		;$00981F	|
	ORA #$00FF				;$009821	|
label_009824:				;			|
	XBA						;$009824	|
	STA $733A,X				;$009825	|
	INC $3D					;$009828	|
	INC $3D					;$00982A	|
	RTS						;$00982C	|

label_00982D:				;-----------|
	INC $3D					;$00982D	|
	LDA [$3D]				;$00982F	|
	AND #$00FF				;$009831	|
	ASL A					;$009834	|
	TAX						;$009835	|
	INC $3D					;$009836	|
	LDA [$3D]				;$009838	|
	PHA						;$00983A	|
	AND #$00FF				;$00983B	|
	XBA						;$00983E	|
	STA $7352,X				;$00983F	|
	PLA						;$009842	|
	AND #$FF00				;$009843	|
	BPL label_00984B		;$009846	|
	ORA #$00FF				;$009848	|
label_00984B:				;			|
	XBA						;$00984B	|
	STA $7342,X				;$00984C	|
	INC $3D					;$00984F	|
	INC $3D					;$009851	|
	RTS						;$009853	|

label_009854:				;-----------|
	INC $3D					;$009854	|
	LDA [$3D]				;$009856	|
	AND #$00FF				;$009858	|
	ASL A					;$00985B	|
	TAX						;$00985C	|
	INC $3D					;$00985D	|
	LDA [$3D]				;$00985F	|
	PHA						;$009861	|
	AND #$00FF				;$009862	|
	XBA						;$009865	|
	CLC						;$009866	|
	ADC $734A,X				;$009867	|
	STA $734A,X				;$00986A	|
	PLA						;$00986D	|
	AND #$FF00				;$00986E	|
	BPL label_009876		;$009871	|
	ORA #$00FF				;$009873	|
label_009876:				;			|
	XBA						;$009876	|
	ADC $733A,X				;$009877	|
	STA $733A,X				;$00987A	|
	INC $3D					;$00987D	|
	INC $3D					;$00987F	|
	RTS						;$009881	|

label_009882:				;-----------|
	INC $3D					;$009882	|
	LDA [$3D]				;$009884	|
	AND #$00FF				;$009886	|
	ASL A					;$009889	|
	TAX						;$00988A	|
	INC $3D					;$00988B	|
	LDA [$3D]				;$00988D	|
	PHA						;$00988F	|
	AND #$00FF				;$009890	|
	XBA						;$009893	|
	CLC						;$009894	|
	ADC $7352,X				;$009895	|
	STA $7352,X				;$009898	|
	PLA						;$00989B	|
	AND #$FF00				;$00989C	|
	BPL label_0098A4		;$00989F	|
	ORA #$00FF				;$0098A1	|
label_0098A4:				;			|
	XBA						;$0098A4	|
	ADC $7342,X				;$0098A5	|
	STA $7342,X				;$0098A8	|
	INC $3D					;$0098AB	|
	INC $3D					;$0098AD	|
	RTS						;$0098AF	|

label_0098B0:				;-----------|
	INC $3D					;$0098B0	|
	LDA [$3D]				;$0098B2	|
	AND #$00FF				;$0098B4	|
	CMP #$00FF				;$0098B7	|
	BNE label_0098BF		;$0098BA	|
	LDA #$FFFF				;$0098BC	|
label_0098BF:				;			|
	STA $6436,Y				;$0098BF	|
	INC $3D					;$0098C2	|
	RTS						;$0098C4	|

label_0098C5:				;-----------|
	INC $3D					;$0098C5	|
	LDA [$3D]				;$0098C7	|
	STA $6436,Y				;$0098C9	|
	INC $3D					;$0098CC	|
	INC $3D					;$0098CE	|
	RTS						;$0098D0	|

label_0098D1:				;-----------|
	INC $3D					;$0098D1	|
	LDA [$3D]				;$0098D3	|
	STA $6436,Y				;$0098D5	|
	INC $3D					;$0098D8	|
	INC $3D					;$0098DA	|
	LDA $7435,Y				;$0098DC	|
	BEQ label_0098F4		;$0098DF	|
	LDA $36F2,Y				;$0098E1	|
	BEQ label_0098F4		;$0098E4	|
	LDA $6436,Y				;$0098E6	|
	CMP #$0022				;$0098E9	|
	BCC label_0098F4		;$0098EC	|
	LDA #$0036				;$0098EE	|
	STA $6436,Y				;$0098F1	|
label_0098F4:				;			|
	LDA [$3D]				;$0098F4	|
	LDX #$0000				;$0098F6	|
	JSL $03D6B9				;$0098F9	|
	INC $3D					;$0098FD	|
	INC $3D					;$0098FF	|
	RTS						;$009901	|

label_009902:
	INC $3D					;$009902	|
	LDA [$3D]				;$009904	|
	STA $00					;$009906	|
	INC $3D					;$009908	|
	INC $3D					;$00990A	|
	LDA [$3D]				;$00990C	|
	STA $02					;$00990E	|
	LDA $760F,Y				;$009910	|
	TAY						;$009913	|
	LDA [$00],Y				;$009914	|
	LDY $39					;$009916	|
	STA $6436,Y				;$009918	|
	INC $3D					;$00991B	|
	LDA $7435,Y				;$00991D	|
	BEQ label_009935		;$009920	|
	LDA $36F2,Y				;$009922	|
	BEQ label_009935		;$009925	|
	LDA $6436,Y				;$009927	|
	CMP #$0022				;$00992A	|
	BCC label_009935		;$00992D	|
	LDA #$0036				;$00992F	|
	STA $6436,Y				;$009932	|
label_009935:				;			|
	RTS						;$009935	|

label_009936:				;-----------|
	JSR label_009902		;$009936	|
	JMP label_0098F4		;$009939	|

label_00993C:				;-----------|
	INC $3D					;$00993C	|
	LDA [$3D]				;$00993E	|
	AND #$00FF				;$009940	|
	CMP #$0080				;$009943	|
	BCC label_00994C		;$009946	|
	ORA #$FF00				;$009948	|
	CLC						;$00994B	|
label_00994C:				;			|
	ADC $6436,Y				;$00994C	|
	STA $6436,Y				;$00994F	|
	INC $3D					;$009952	|
	RTS						;$009954	|

label_009955:				;-----------|
	TYX						;$009955	|
	INC $6436,X				;$009956	|
	INC $3D					;$009959	|
	RTS						;$00995B	|

label_00995C:				;-----------|
	TYX						;$00995C	|
	DEC $6436,X				;$00995D	|
	INC $3D					;$009960	|
	RTS						;$009962	|

label_009963:				;-----------|
	INC $3D					;$009963	|
	LDA [$3D]				;$009965	|
	STA $6028				;$009967	|
	INC $3D					;$00996A	|
	INC $3D					;$00996C	|
	LDA [$3D]				;$00996E	|
	STA $602A				;$009970	|
label_009973:				;			|
	TYX						;$009973	|
	LDA $724A,Y				;$009974	|
	JSL label_009258		;$009977	|
	LDY $39					;$00997B	|
	STA $724A,Y				;$00997D	|
	INC $3D					;$009980	|
	RTS						;$009982	|

label_009983:				;-----------|
	INC $3D					;$009983	|
	LDA [$3D]				;$009985	|
	AND #$00FF				;$009987	|
	STA $28					;$00998A	|
	ASL A					;$00998C	|
	ADC $28					;$00998D	|
	TAX						;$00998F	|
	LDA.l DATA_00B84D,X		;$009990	|
	STA $6028				;$009994	|
	LDA.l DATA_00B84D+2,X	;$009997	|
	STA $602A				;$00999B	|
	BRA label_009973		;$00999E	|

label_0099A0:				;-----------|
	INC $3D					;$0099A0	|
	LDA [$3D]				;$0099A2	|
	STA $64B6,Y				;$0099A4	|
	INC $3D					;$0099A7	|
	INC $3D					;$0099A9	|
	RTS						;$0099AB	|

label_0099AC:				;-----------|
	INC $3D					;$0099AC	|
	LDA [$3D]				;$0099AE	|
	AND #$00FF				;$0099B0	|
	TYX						;$0099B3	|
	JSL label_00921B		;$0099B4	|
	INC $3D					;$0099B8	|
	RTS						;$0099BA	|

label_0099BB:				;-----------|
	INC $3D					;$0099BB	|
	LDA [$3D]				;$0099BD	|
	AND #$00FF				;$0099BF	|
	JSL label_00D12D		;$0099C2	|
	INC $3D					;$0099C6	|
	RTS						;$0099C8	|

label_0099C9:				;-----------|
	INC $3D					;$0099C9	|
	LDA [$3D]				;$0099CB	|
	AND #$00FF				;$0099CD	|
	JSL label_00D003		;$0099D0	|
	INC $3D					;$0099D4	|
	RTS						;$0099D6	|

label_0099D7:				;-----------|
	TYX						;$0099D7	|
	STZ $6B6E,X				;$0099D8	|
	STZ $6BE8,X				;$0099DB	|
	STZ $6C62,X				;$0099DE	|
	STZ $6CDC,X				;$0099E1	|
	INC $3D					;$0099E4	|
	RTS						;$0099E6	|

label_0099E7:				;-----------|
	TYX						;$0099E7	|
	STZ $6C62,X				;$0099E8	|
	STZ $6CDC,X				;$0099EB	|
	INC $3D					;$0099EE	|
	RTS						;$0099F0	|

label_0099F1:				;-----------|
	INC $3D					;$0099F1	|
	LDA [$3D]				;$0099F3	|
	STA $6B6E,Y				;$0099F5	|
	INC $3D					;$0099F8	|
	INC $3D					;$0099FA	|
	RTS						;$0099FC	|

label_0099FD:				;-----------|
	INC $3D					;$0099FD	|
	LDA [$3D]				;$0099FF	|
	STA $6BE8,Y				;$009A01	|
	INC $3D					;$009A04	|
	INC $3D					;$009A06	|
	RTS						;$009A08	|

label_009A09:				;-----------|
	INC $3D					;$009A09	|
	LDA [$3D]				;$009A0B	|
	STA $6C62,Y				;$009A0D	|
	INC $3D					;$009A10	|
	INC $3D					;$009A12	|
	RTS						;$009A14	|

label_009A15:				;-----------|
	INC $3D					;$009A15	|
	LDA [$3D]				;$009A17	|
	STA $6CDC,Y				;$009A19	|
	INC $3D					;$009A1C	|
	INC $3D					;$009A1E	|
	RTS						;$009A20	|

label_009A21:				;-----------|
	TYX						;$009A21	|
	STZ $7663,X				;$009A22	|
	STZ $7667,X				;$009A25	|
	STZ $765B,X				;$009A28	|
	STZ $765F,X				;$009A2B	|
	INC $3D					;$009A2E	|
	RTS						;$009A30	|

label_009A31:				;-----------|
	INC $3D					;$009A31	|
	LDA [$3D]				;$009A33	|
	STA $765B,Y				;$009A35	|
	INC $3D					;$009A38	|
	INC $3D					;$009A3A	|
	RTS						;$009A3C	|

label_009A3D:				;-----------|
	INC $3D					;$009A3D	|
	LDA [$3D]				;$009A3F	|
	STA $765F,Y				;$009A41	|
	INC $3D					;$009A44	|
	INC $3D					;$009A46	|
	RTS						;$009A48	|

label_009A49:				;-----------|
	INC $3D					;$009A49	|
	LDA [$3D]				;$009A4B	|
	STA $7663,Y				;$009A4D	|
	INC $3D					;$009A50	|
	INC $3D					;$009A52	|
	RTS						;$009A54	|

label_009A55:				;-----------|
	INC $3D					;$009A55	|
	LDA [$3D]				;$009A57	|
	STA $7667,Y				;$009A59	|
	INC $3D					;$009A5C	|
	INC $3D					;$009A5E	|
	RTS						;$009A60	|

label_009A61:				;-----------|
	TYX						;$009A61	|
	STZ $769B,X				;$009A62	|
	STZ $769F,X				;$009A65	|
	STZ $7693,X				;$009A68	|
	STZ $7697,X				;$009A6B	|
	INC $3D					;$009A6E	|
	RTS						;$009A70	|

label_009A71:				;-----------|
	INC $3D					;$009A71	|
	LDA [$3D]				;$009A73	|
	STA $7693,Y				;$009A75	|
	INC $3D					;$009A78	|
	INC $3D					;$009A7A	|
	RTS						;$009A7C	|

label_009A7D:				;-----------|
	INC $3D					;$009A7D	|
	LDA [$3D]				;$009A7F	|
	STA $7697,Y				;$009A81	|
	INC $3D					;$009A84	|
	INC $3D					;$009A86	|
	RTS						;$009A88	|

label_009A89:				;-----------|
	INC $3D					;$009A89	|
	LDA [$3D]				;$009A8B	|
	STA $769B,Y				;$009A8D	|
	INC $3D					;$009A90	|
	INC $3D					;$009A92	|
	RTS						;$009A94	|

label_009A95:				;-----------|
	INC $3D					;$009A95	|
	LDA [$3D]				;$009A97	|
	STA $769F,Y				;$009A99	|
	INC $3D					;$009A9C	|
	INC $3D					;$009A9E	|
	RTS						;$009AA0	|

label_009AA1:				;-----------|
	INC $3D					;$009AA1	|
	LDA #$0000				;$009AA3	|
	STA $76A3,Y				;$009AA6	|
	STA $76A7,Y				;$009AA9	|
	RTS						;$009AAC	|

label_009AAD:				;-----------|
	INC $3D					;$009AAD	|
	LDA #$0000				;$009AAF	|
	STA $76AB,Y				;$009AB2	|
	STA $76AF,Y				;$009AB5	|
	RTS						;$009AB8	|

label_009AB9:				;-----------|
	INC $3D					;$009AB9	|
	LDA [$3D]				;$009ABB	|
	STA $747D,Y				;$009ABD	|
	INC $3D					;$009AC0	|
	INC $3D					;$009AC2	|
	RTS						;$009AC4	|

label_009AC5:				;-----------|
	INC $3D					;$009AC5	|
	LDA [$3D]				;$009AC7	|
	CLC						;$009AC9	|
	ADC $6BE8,Y				;$009ACA	|
	STA $6BE8,Y				;$009ACD	|
	INC $3D					;$009AD0	|
	INC $3D					;$009AD2	|
	RTS						;$009AD4	|



label_009AD5:				;-----------|
	JSL label_009251		;$009AD5	|
	PHA						;$009AD9	|
	JSL label_009251		;$009ADA	|
	TAX						;$009ADE	|
	PLA						;$009ADF	|
	JMP label_009AEB		;$009AE0	|

label_009AE3:				;-----------|
	PHA						;$009AE3	|
	PHX						;$009AE4	|
	JSL $05813A				;$009AE5	|
	PLX						;$009AE9	|
	PLA						;$009AEA	|
label_009AEB:				;			|
	STA $6000				;$009AEB	|
	LDY $39					;$009AEE	|
	STY $6004				;$009AF0	|
	STX $600A				;$009AF3	|
	LDA #$0040				;$009AF6	|
	STA $6010				;$009AF9	|
	LDA #$007A				;$009AFC	|
	STA $6012				;$009AFF	|
	JSR label_009130		;$009B02	|
	BCC label_009B1D		;$009B05	|
	LDX #$007C				;$009B07	|
label_009B0A:				;			|
	LDY $603C,X				;$009B0A	|
	BMI label_009B20		;$009B0D	|
	TYX						;$009B0F	|
	CPX #$0040				;$009B10	|
	BCC label_009B0A		;$009B13	|
	CPX #$007A				;$009B15	|
	BCS label_009B0A		;$009B18	|
	JSR label_0091E3		;$009B1A	|
label_009B1D:				;			|
	JMP label_008E9E		;$009B1D	|

label_009B20:
	LDY $39					;$009B20	|
	TYA						;$009B22	|
	SEC						;$009B23	|
	RTL						;$009B24	|


label_009B25:				;-----------|
	STZ $6010				;$009B25	|
	LDA #$0030				;$009B28	|
	STA $6012				;$009B2B	|
label_009B2E:				;			|
	STZ $6006				;$009B2E	|
	STZ $6008				;$009B31	|
label_009B34:				;			|
	LDX $39					;$009B34	|
	JSR label_00924A		;$009B36	|
	PHA						;$009B39	|
	JSR label_00924A		;$009B3A	|
	CLC						;$009B3D	|
	ADC $6892,X				;$009B3E	|
	PHA						;$009B41	|
	JSR label_00924A		;$009B42	|
	CLC						;$009B45	|
	ADC $690C,X				;$009B46	|
	TAY						;$009B49	|
	JSR label_00924A		;$009B4A	|
	STA $6000				;$009B4D	|
	JSR label_00924A		;$009B50	|
	CLC						;$009B53	|
	ADC $6DD0,X				;$009B54	|
	STA $6002				;$009B57	|
	STX $6004				;$009B5A	|
	PLX						;$009B5D	|
	PLA						;$009B5E	|
	AND #$7FFF				;$009B5F	|
	JMP label_008E8C		;$009B62	|

label_009B65:				;-----------|
	JSR label_00923A		;$009B65	|
	STA $6010				;$009B68	|
	JSR label_00923A		;$009B6B	|
	STA $6012				;$009B6E	|
	BRA label_009B2E		;$009B71	|

label_009B73:				;-----------|
	JSR label_00923A		;$009B73	|
	STA $6010				;$009B76	|
	INC A					;$009B79	|
	INC A					;$009B7A	|
	STA $6012				;$009B7B	|
	BRA label_009B2E		;$009B7E	|

label_009B80:				;-----------|
	JSR label_00923A		;$009B80	|
	STA $6010				;$009B83	|
	TAX						;$009B86	|
	INC A					;$009B87	|
	INC A					;$009B88	|
	STA $6012				;$009B89	|
	JSR label_009146		;$009B8C	|
	BRA label_009B2E		;$009B8F	|

label_009B91:				;-----------|
	STZ $6010				;$009B91	|
	LDA #$0030				;$009B94	|
	STA $6012				;$009B97	|
	STZ $6002				;$009B9A	|
	STZ $6004				;$009B9D	|
	LDX $39					;$009BA0	|
	JSR label_00924A		;$009BA2	|
	TAY						;$009BA5	|
	JSR label_00924A		;$009BA6	|
	STA $6000				;$009BA9	|
	STX $6004				;$009BAC	|
	STZ $6006				;$009BAF	|
	STZ $6008				;$009BB2	|
	TYA						;$009BB5	|
	AND #$7FFF				;$009BB6	|
	JMP label_008E8C		;$009BB9	|

label_009BBC:				;-----------|
	JSR label_00924A		;$009BBC	|
	STA $6006				;$009BBF	|
	JSR label_00924A		;$009BC2	|
	STA $6008				;$009BC5	|
	JSR label_00923A		;$009BC8	|
	STA $6010				;$009BCB	|
	INC A					;$009BCE	|
	INC A					;$009BCF	|
	STA $6012				;$009BD0	|
	JMP label_009B34		;$009BD3	|

label_009BD6:				;-----------|
	JSR label_00923A		;$009BD6	|
	ASL A					;$009BD9	|
	TAX						;$009BDA	|
	LDA.w DATA_008D6F,X		;$009BDB	|
	STA $14					;$009BDE	|
	LDY $39					;$009BE0	|
	LDA ($14),Y				;$009BE2	|
	TAX						;$009BE4	|
	JMP label_009142		;$009BE5	|

label_009BE8:				;-----------|
	JSR label_00923A		;$009BE8	|
	TAX						;$009BEB	|
	JMP label_009142		;$009BEC	|

label_009BEF:				;-----------|
	LDX $6014				;$009BEF	|
label_009BF2:				;			|
	LDA $603C,X				;$009BF2	|
	PHA						;$009BF5	|
	CPX $39					;$009BF6	|
	BEQ label_009BFD		;$009BF8	|
	JSR label_009146		;$009BFA	|
label_009BFD:				;			|
	PLX						;$009BFD	|
	BPL label_009BF2		;$009BFE	|
	RTL						;$009C00	|

label_009C01:				;-----------|
	JSR label_00924A		;$009C01	|
	PHA						;$009C04	|
	JSR label_00924A		;$009C05	|
	TAX						;$009C08	|
	PLA						;$009C09	|
	STA $00					;$009C0A	|
	STX $02					;$009C0C	|
	TAX						;$009C0E	|
label_009C0F:				;			|
	LDA $623C,X				;$009C0F	|
	BMI label_009C19		;$009C12	|
	PHX						;$009C14	|
	JSR label_009146		;$009C15	|
	PLX						;$009C18	|
label_009C19:				;			|
	INX						;$009C19	|
	INX						;$009C1A	|
	CMP $02					;$009C1B	|
	BCC label_009C0F		;$009C1D	|
	RTL						;$009C1F	|

label_009C20:				;-----------|
	JSR label_00924A		;$009C20	|
	LDX $6014				;$009C23	|
label_009C26:				;			|
	LDY $603C,X				;$009C26	|
	PHY						;$009C29	|
	CMP $623C,X				;$009C2A	|
	BNE label_009C38		;$009C2D	|
	CPX $39					;$009C2F	|
	BEQ label_009C38		;$009C31	|
	PHA						;$009C33	|
	JSR label_009146		;$009C34	|
	PLA						;$009C37	|
label_009C38:				;			|
	PLX						;$009C38	|
	BPL label_009C26		;$009C39	|
	RTL						;$009C3B	|

label_009C3C:				;-----------|
	STA $00					;$009C3C	|
	LDX $6014				;$009C3E	|
label_009C41:				;			|
	LDY $603C,X				;$009C41	|
	PHY						;$009C44	|
	CPX $39					;$009C45	|
	BEQ label_009C56		;$009C47	|
	LDA $623C,X				;$009C49	|
	AND #$3FFF				;$009C4C	|
	CMP $00					;$009C4F	|
	BNE label_009C56		;$009C51	|
	JSR label_009146		;$009C53	|
label_009C56:				;			|
	PLX						;$009C56	|
	BPL label_009C41		;$009C57	|
	LDY $39					;$009C59	|
	RTL						;$009C5B	|

label_009C5C:				;-----------|
	JSR label_00923A		;$009C5C	|
	TAX						;$009C5F	|
	JSR label_00924A		;$009C60	|
	PHA						;$009C63	|
	JSR label_00923A		;$009C64	|
	TAY						;$009C67	|
	PLA						;$009C68	|
	JMP label_008F64		;$009C69	|

label_009C6C:				;-----------|
	JSR label_00924A		;$009C6C	|
	TAY						;$009C6F	|
	JSR label_00923A		;$009C70	|
	TAX						;$009C73	|
	TYA						;$009C74	|
	JMP LoadDMATable		;$009C75	|

label_009C78:				;-----------|
	JSR label_00923A		;$009C78	|
	STA $31					;$009C7B	|
	JSR label_00924A		;$009C7D	|
	STA $32					;$009C80	|
	JSR label_00924A		;$009C82	|
	STA $34					;$009C85	|
	JSR label_00923A		;$009C87	|
	STA $36					;$009C8A	|
	JSR label_00924A		;$009C8C	|
	STA $37					;$009C8F	|
	JMP WriteToDMABuffer	;$009C91	|

label_009C94:				;-----------|
	JSR label_00923A		;$009C94	|
	JMP UpdateSNESMode		;$009C97	|

label_009C9A:				;-----------|
	JSR label_00923A		;$009C9A	|
	ASL A					;$009C9D	|
	TAX						;$009C9E	|
	LDA.w DATA_009CB5,X		;$009C9F	|
	STA $6028				;$009CA2	|
	JSR label_00923A		;$009CA5	|
	PHA						;$009CA8	|
	JSR label_00924A		;$009CA9	|
	TAX						;$009CAC	|
	JSR label_00924A		;$009CAD	|
	TAY						;$009CB0	|
	PLA						;$009CB1	|
	JMP ($6028)				;$009CB2	|

DATA_009CB5:
	dw SetupLayer1VRAM
	dw SetupLayer2VRAM
	dw SetupLayer3VRAM


label_009CBB:				;-----------|
	JSR label_00923A		;$009CBB	|
	TAY						;$009CBE	|
	JSR label_00924A		;$009CBF	|
	TAX						;$009CC2	|
	TYA						;$009CC3	|
	JSL label_008519		;$009CC4	|
	JSR label_00923A		;$009CC8	|
	JMP label_00853A		;$009CCB	|

label_009CCE:				;-----------|
	JSR label_00923A		;$009CCE	|
	SEP #$20				;$009CD1	|
	STA $3072				;$009CD3	|
	REP #$20				;$009CD6	|
	RTL						;$009CD8	|

label_009CD9:				;-----------|
	JSR label_00923A		;$009CD9	|
	SEP #$20				;$009CDC	|
	TSB $3072				;$009CDE	|
	REP #$20				;$009CE1	|
	RTL						;$009CE3	|

label_009CE4:				;-----------|
	JSR label_00923A		;$009CE4	|
	SEP #$20				;$009CE7	|
	TRB $3072				;$009CE9	|
	REP #$20				;$009CEC	|
	RTL						;$009CEE	|

label_009CEF:				;-----------|
	JSR label_00923A		;$009CEF	|
	SEP #$20				;$009CF2	|
	STA $3073				;$009CF4	|
	REP #$20				;$009CF7	|
	RTL						;$009CF9	|

label_009CFA:				;-----------|
	JSR label_00923A		;$009CFA	|
	SEP #$20				;$009CFD	|
	TSB $3073				;$009CFF	|
	REP #$20				;$009D02	|
	RTL						;$009D04	|

label_009D05:				;-----------|
	JSR label_00923A		;$009D05	|
	SEP #$20				;$009D08	|
	TRB $3073				;$009D0A	|
	REP #$20				;$009D0D	|
	RTL						;$009D0F	|

label_009D10:				;-----------|
	LDY #$0000				;$009D10	|
label_009D13:				;			|
	JSR label_00923A		;$009D13	|
	ASL A					;$009D16	|
	TAX						;$009D17	|
	LDA.w DATA_009D2C,X		;$009D18	|
	STA $3037,Y				;$009D1B	|
	LDA.w DATA_009D34,X		;$009D1E	|
	STA $303D,Y				;$009D21	|
	INY						;$009D24	|
	INY						;$009D25	|
	CPY #$0008				;$009D26	|
	BCC label_009D13		;$009D29	|
	RTL						;$009D2B	|

DATA_009D2C:
	dw $0000,$0100,$0000,$0100
DATA_009D34:
	dw $0000,$0000,$0100,$0100


label_009D3C:				;-----------|
	JSR label_00924A		;$009D3C	|
	STA $308B				;$009D3F	|
	JSR label_00924A		;$009D42	|
	STA $308D				;$009D45	|
	RTL						;$009D48	|

label_009D49:				;-----------|
	JSR label_00924A		;$009D49	|
	STA $307D				;$009D4C	|
label_009D4F:				;			|
	LDA $307D				;$009D4F	|
	LDX $307F				;$009D52	|
	LDY $3081				;$009D55	|
	JMP label_00A668		;$009D58	|

label_009D5B:				;-----------|
	JSR label_00924A		;$009D5B	|
	CLC						;$009D5E	|
	ADC $307D				;$009D5F	|
	STA $307D				;$009D62	|
	JMP label_009D4F		;$009D65	|

label_009D68:				;-----------|
	JSR label_00924A		;$009D68	|
	STA $307F				;$009D6B	|
	JSR label_00924A		;$009D6E	|
	STA $3081				;$009D71	|
	JMP label_009D4F		;$009D74	|

label_009D77:				;-----------|
	JSR label_00924A		;$009D77	|
	CLC						;$009D7A	|
	ADC $307F				;$009D7B	|
	STA $307F				;$009D7E	|
	JSR label_00924A		;$009D81	|
	CLC						;$009D84	|
	ADC $3081				;$009D85	|
	STA $3081				;$009D88	|
	JMP label_009D4F		;$009D8B	|

label_009D8E:				;-----------|
	JSR label_00923A		;$009D8E	|
	SEP #$20				;$009D91	|
	TSB $3062				;$009D93	|
	REP #$20				;$009D96	|
	RTL						;$009D98	|

label_009D99:				;-----------|
	JSR label_00923A		;$009D99	|
	SEP #$20				;$009D9C	|
	TRB $3062				;$009D9E	|
	REP #$20				;$009DA1	|
	RTL						;$009DA3	|

label_009DA4:				;-----------|
	JSR label_00923A		;$009DA4	|
	SEP #$20				;$009DA7	|
	ASL A					;$009DA9	|
	ASL A					;$009DAA	|
	ASL A					;$009DAB	|
	ASL A					;$009DAC	|
	STA $28					;$009DAD	|
	LDA $3062				;$009DAF	|
	AND #$0F				;$009DB2	|
	ORA $28					;$009DB4	|
	STA $3062				;$009DB6	|
	REP #$20				;$009DB9	|
	RTL						;$009DBB	|

label_009DBC:				;-----------|
	SEP #$20				;$009DBC	|
	LDA $3062				;$009DBE	|
	CMP #$F0				;$009DC1	|
	BCS label_009DCA		;$009DC3	|
	ADC #$10				;$009DC5	|
	STA $3062				;$009DC7	|
label_009DCA:				;			|
	REP #$20				;$009DCA	|
	RTL						;$009DCC	|

label_009DCD:				;-----------|
	SEP #$20				;$009DCD	|
	LDA $3062				;$009DCF	|
	CMP #$10				;$009DD2	|
	BCC label_009DDB		;$009DD4	|
	SBC #$10				;$009DD6	|
	STA $3062				;$009DD8	|
label_009DDB:				;			|
	REP #$20				;$009DDB	|
	RTL						;$009DDD	|


label_009DDE:				;-----------|
	JSR label_00923A		;$009DDE	|
	PHA						;$009DE1	|
	ASL A					;$009DE2	|
	ASL A					;$009DE3	|
	ASL A					;$009DE4	|
	ASL A					;$009DE5	|
	TAX						;$009DE6	|
	JSR label_00923A		;$009DE7	|
	PHA						;$009DEA	|
	JSR label_00923A		;$009DEB	|
	PHA						;$009DEE	|
	JSR label_00924A		;$009DEF	|
	PHA						;$009DF2	|
	JSR label_00923A		;$009DF3	|
label_009DF6:				;			|
	SEP #$20				;$009DF6	|
	STA $4304,X				;$009DF8	|
	STA $4307,X				;$009DFB	|
	PLA						;$009DFE	|
	STA $4302,X				;$009DFF	|
	PLA						;$009E02	|
	STA $4303,X				;$009E03	|
	PLA						;$009E06	|
	STA $4301,X				;$009E07	|
	PLA						;$009E0A	|
	PLA						;$009E0B	|
	STA $4300,X				;$009E0C	|
	PLA						;$009E0F	|
	PLX						;$009E10	|
	LDA.w DATA_008B82,X		;$009E11	|
	TSB $3092				;$009E14	|
	REP #$20				;$009E17	|
	RTL						;$009E19	|

label_009E1A:				;-----------|
	LDA #$0001				;$009E1A	|
	STA $7F7170				;$009E1D	|
	STA $7F74F0				;$009E21	|
	LDA #$00FF				;$009E25	|
	STA $7F7171				;$009E28	|
	STA $7F74F1				;$009E2C	|
	LDA #$0000				;$009E30	|
	STA $7F7173				;$009E33	|
	STA $7F74F3				;$009E37	|
	LDA [$14]				;$009E3B	|
	AND #$00FF				;$009E3D	|
	PHA						;$009E40	|
	ASL A					;$009E41	|
	ASL A					;$009E42	|
	ASL A					;$009E43	|
	ASL A					;$009E44	|
	TAX						;$009E45	|
	INC $14					;$009E46	|
	LDA [$14]				;$009E48	|
	PHA						;$009E4A	|
	INC $14					;$009E4B	|
	LDA [$14]				;$009E4D	|
	PHA						;$009E4F	|
	INC $14					;$009E50	|
	LDA [$14]				;$009E52	|
	PHA						;$009E54	|
	INC $14					;$009E55	|
	INC $14					;$009E57	|
	LDA [$14]				;$009E59	|
	JMP label_009DF6		;$009E5B	|


label_009E5E:				;-----------|
	JSR label_00923A		;$009E5E	|
	TAX						;$009E61	|
label_009E62:				;			|
	LDA.w DATA_008B82,X		;$009E62	|
	AND #$00FF				;$009E65	|
	TRB $3092				;$009E68	|
	RTL						;$009E6B	|

label_009E6C:				;-----------|
	JSR label_00923A		;$009E6C	|
	AND #$00FF				;$009E6F	|
	TSB $3093				;$009E72	|
	RTL						;$009E75	|

label_009E76:				;-----------|
	JSR label_00923A		;$009E76	|
	AND #$00FF				;$009E79	|
	TRB $3093				;$009E7C	|
	RTL						;$009E7F	|


label_009E80:				;-----------|
	JSR label_009E8D		;$009E80	|
	SEP #$20				;$009E83	|
	LDA #$F2				;$009E85	|
	TRB $3076				;$009E87	|
	REP #$20				;$009E8A	|
	RTL						;$009E8C	|

label_009E8D:				;```````````|
	JSR label_00923A		;$009E8D	|
	STA $28					;$009E90	|
	JSR label_00923A		;$009E92	|
	XBA						;$009E95	|
	LSR A					;$009E96	|
	LSR A					;$009E97	|
	TSB $28					;$009E98	|
	SEP #$20				;$009E9A	|
	LDA $3077				;$009E9C	|
	AND #$3F				;$009E9F	|
	ORA $28					;$009EA1	|
	STA $3077				;$009EA3	|
	REP #$20				;$009EA6	|
	RTS						;$009EA8	|

label_009EA9:				;-----------|
	JSR label_00923A		;$009EA9	|
	SEP #$20				;$009EAC	|
	TRB $3077				;$009EAE	|
	REP #$20				;$009EB1	|
	RTL						;$009EB3	|

label_009EB4:				;-----------|
	SEP #$20				;$009EB4	|
	LDY #$0001				;$009EB6	|
	LDA [$3D],Y				;$009EB9	|
	ORA #$20				;$009EBB	|
	STA $3078				;$009EBD	|
	INY						;$009EC0	|
	LDA [$3D],Y				;$009EC1	|
	ORA #$40				;$009EC3	|
	STA $3079				;$009EC5	|
	INY						;$009EC8	|
	LDA [$3D],Y				;$009EC9	|
	ORA #$80				;$009ECB	|
	STA $307A				;$009ECD	|
	REP #$20				;$009ED0	|
	TYA						;$009ED2	|
	CLC						;$009ED3	|
	ADC $3D					;$009ED4	|
	STA $3D					;$009ED6	|
	RTL						;$009ED8	|


label_009ED9:				;-----------|
	SEP #$20				;$009ED9	|
	LDY #$0001				;$009EDB	|
	CLC						;$009EDE	|
	LDA $3078				;$009EDF	|
	AND #$1F				;$009EE2	|
	ADC [$3D],Y				;$009EE4	|
	BPL label_009EEC		;$009EE6	|
	LDA #$00				;$009EE8	|
	BRA label_009EF2		;$009EEA	|

label_009EEC:
	CMP #$20				;$009EEC	|
	BCC label_009EF2		;$009EEE	|
	LDA #$1F				;$009EF0	|
label_009EF2:				;			|
	ORA #$20				;$009EF2	|
	STA $3078				;$009EF4	|
	INY						;$009EF7	|
	CLC						;$009EF8	|
	LDA $3079				;$009EF9	|
	AND #$1F				;$009EFC	|
	ADC [$3D],Y				;$009EFE	|
	BPL label_009F06		;$009F00	|
	LDA #$00				;$009F02	|
	BRA label_009F0C		;$009F04	|

label_009F06:
	CMP #$20				;$009F06	|
	BCC label_009F0C		;$009F08	|
	LDA #$1F				;$009F0A	|
label_009F0C:				;			|
	ORA #$40				;$009F0C	|
	STA $3079				;$009F0E	|
	INY						;$009F11	|
	CLC						;$009F12	|
	LDA $307A				;$009F13	|
	AND #$1F				;$009F16	|
	ADC [$3D],Y				;$009F18	|
	BPL label_009F20		;$009F1A	|
	LDA #$00				;$009F1C	|
	BRA label_009F26		;$009F1E	|

label_009F20:
	CMP #$20				;$009F20	|
	BCC label_009F26		;$009F22	|
	LDA #$1F				;$009F24	|
label_009F26:				;			|
	ORA #$80				;$009F26	|
	STA $307A				;$009F28	|
	REP #$20				;$009F2B	|
	TYA						;$009F2D	|
	CLC						;$009F2E	|
	ADC $3D					;$009F2F	|
	STA $3D					;$009F31	|
	RTL						;$009F33	|


label_009F34:				;-----------|
	INC $3D					;$009F34	|
	LDA [$3D]				;$009F36	|
	AND #$0001				;$009F38	|
	ASL A					;$009F3B	|
	TAX						;$009F3C	|
	INC $3D					;$009F3D	|
	LDA [$3D]				;$009F3F	|
	STA $306C,X				;$009F41	|
	INC $3D					;$009F44	|
	RTL						;$009F46	|

label_009F47:				;-----------|
	LDY #$0001				;$009F47	|
	LDA [$3D],Y				;$009F4A	|
	AND #$0001				;$009F4C	|
	ASL A					;$009F4F	|
	TAX						;$009F50	|
	SEP #$20				;$009F51	|
	INY						;$009F53	|
	LDA [$3D],Y				;$009F54	|
	ADC $306C,X				;$009F56	|
	STA $306C,X				;$009F59	|
	INY						;$009F5C	|
	LDA [$3D],Y				;$009F5D	|
	CLC						;$009F5F	|
	ADC $306D,X				;$009F60	|
	STA $306D,X				;$009F63	|
	REP #$20				;$009F66	|
	TYA						;$009F68	|
	CLC						;$009F69	|
	ADC $3D					;$009F6A	|
	STA $3D					;$009F6C	|
	RTL						;$009F6E	|

label_009F6F:				;-----------|
	LDY #$0001				;$009F6F	|
	LDA [$3D],Y				;$009F72	|
	STA $3069				;$009F74	|
	INY						;$009F77	|
	LDA [$3D],Y				;$009F78	|
	STA $306A				;$009F7A	|
	INY						;$009F7D	|
	TYA						;$009F7E	|
	CLC						;$009F7F	|
	ADC $3D					;$009F80	|
	STA $3D					;$009F82	|
	RTL						;$009F84	|

label_009F85:				;-----------|
	JSR label_00923A		;$009F85	|
	SEP #$20				;$009F88	|
	STA $3074				;$009F8A	|
	REP #$20				;$009F8D	|
	RTL						;$009F8F	|

label_009F90:				;-----------|
	JSR label_00923A		;$009F90	|
	SEP #$20				;$009F93	|
	TSB $3074				;$009F95	|
	REP #$20				;$009F98	|
	RTL						;$009F9A	|

label_009F9B:				;-----------|
	JSR label_00923A		;$009F9B	|
	SEP #$20				;$009F9E	|
	TRB $3074				;$009FA0	|
	REP #$20				;$009FA3	|
	RTL						;$009FA5	|

label_009FA6:				;-----------|
	JSR label_00923A		;$009FA6	|
	SEP #$20				;$009FA9	|
	STA $3075				;$009FAB	|
	REP #$20				;$009FAE	|
	RTL						;$009FB0	|

label_009FB1:				;-----------|
	JSR label_00923A		;$009FB1	|
	SEP #$20				;$009FB4	|
	TSB $3075				;$009FB6	|
	REP #$20				;$009FB9	|
	RTL						;$009FBB	|

label_009FBC:				;-----------|
	JSR label_00923A		;$009FBC	|
	SEP #$20				;$009FBF	|
	TRB $3075				;$009FC1	|
	REP #$20				;$009FC4	|
	RTL						;$009FC6	|

label_009FC7:				;-----------|
	JSR label_00923A		;$009FC7	|
	JMP label_0085C7		;$009FCA	|

label_009FCD:				;-----------|
	LDA $30A1				;$009FCD	|
	AND #$00FF				;$009FD0	|
	CMP #$000F				;$009FD3	|
	BCS label_009FDC		;$009FD6	|
	INC A					;$009FD8	|
	JMP label_0085C7		;$009FD9	|
label_009FDC:				;			|
	RTL						;$009FDC	|

label_009FDD:				;-----------|
	LDA $30A1				;$009FDD	|
	AND #$00FF				;$009FE0	|
	BEQ label_009FE9		;$009FE3	|
	DEC A					;$009FE5	|
	JMP label_0085C7		;$009FE6	|
label_009FE9:				;			|
	RTL						;$009FE9	|


label_009FEA:				;-----------|
	JSR label_00924A		;$009FEA	|
	STA $14					;$009FED	|
	JSR label_00923A		;$009FEF	|
	STA $16					;$009FF2	|
	JSR label_00923A		;$009FF4	|
	ASL A					;$009FF7	|
	ADC #$0500				;$009FF8	|
	BRA label_00A00E		;$009FFB	|

label_009FFD:				;-----------|
	JSR label_00924A		;$009FFD	|
	STA $14					;$00A000	|
	JSR label_00923A		;$00A002	|
	STA $16					;$00A005	|
	JSR label_00923A		;$00A007	|
	ASL A					;$00A00A	|
	ADC #$0700				;$00A00B	|
label_00A00E:				;			|
	STA $18					;$00A00E	|
	JSR label_00924A		;$00A010	|
	DEC A					;$00A013	|
	DEC A					;$00A014	|
	STA $49					;$00A015	|
	BIT $0000				;$00A017	|
	BPL label_00A026		;$00A01A	|
	LDA #$A026				;$00A01C	|\ 
	LDX #$0000				;$00A01F	|| Execute the below on the SNES.
	JML SA1_ExecuteSNES		;$00A022	|/

label_00A026:				;```````````| On the SNES.
	LDY $49					;$00A026	|
label_00A028:				;			|
	LDA [$14],Y				;$00A028	|
	STA ($18),Y				;$00A02A	|
	DEY						;$00A02C	|
	DEY						;$00A02D	|
	BPL label_00A028		;$00A02E	|
	RTL						;$00A030	|


label_00A031:				;-----------|
	STA $00					;$00A031	|
	JSR label_00924A		;$00A033	|
	STA $14					;$00A036	|
	JSR label_00923A		;$00A038	|
	STA $16					;$00A03B	|
	JSR label_00923A		;$00A03D	|
	ASL A					;$00A040	|
	ADC #$0500				;$00A041	|
	STA $18					;$00A044	|
	JSR label_00924A		;$00A046	|
	TAY						;$00A049	|
	DEY						;$00A04A	|
	DEY						;$00A04B	|
	STY $4D					;$00A04C	|
	LDA #$A058				;$00A04E	|\ 
	LDX #$0000				;$00A051	|| Execute the below on the SNES.
	JML SA1_ExecuteSNES		;$00A054	|/

label_00A058:				;```````````|
	LDY $4D					;$00A058	|
label_00A05A:				;			|
	LDA [$14],Y				;$00A05A	|
	JSR label_00A088		;$00A05C	|
	STA $02					;$00A05F	|
	LDA [$14],Y				;$00A061	|
	LSR A					;$00A063	|
	LSR A					;$00A064	|
	LSR A					;$00A065	|
	LSR A					;$00A066	|
	LSR A					;$00A067	|
	JSR label_00A088		;$00A068	|
	ASL A					;$00A06B	|
	ASL A					;$00A06C	|
	ASL A					;$00A06D	|
	ASL A					;$00A06E	|
	ASL A					;$00A06F	|
	STA $04					;$00A070	|
	LDA [$14],Y				;$00A072	|
	XBA						;$00A074	|
	LSR A					;$00A075	|
	LSR A					;$00A076	|
	JSR label_00A088		;$00A077	|
	ASL A					;$00A07A	|
	ASL A					;$00A07B	|
	XBA						;$00A07C	|
	ORA $04					;$00A07D	|
	ORA $02					;$00A07F	|
	STA ($18),Y				;$00A081	|
	DEY						;$00A083	|
	DEY						;$00A084	|
	BPL label_00A05A		;$00A085	|
	RTL						;$00A087	|


label_00A088:				;-----------|
	AND #$001F				;$00A088	|
	CLC						;$00A08B	|
	ADC $00					;$00A08C	|
	BPL label_00A094		;$00A08E	|
	LDA #$0000				;$00A090	|
	RTS						;$00A093	|

label_00A094:
	CMP #$0020				;$00A094	|
	BCC label_00A09C		;$00A097	|
	LDA #$001F				;$00A099	|
label_00A09C:				;			|
	RTS						;$00A09C	|


label_00A09D:				;-----------|
	JSR label_00923A		;$00A09D	|
	PHA						;$00A0A0	|
	JSR label_00924A		;$00A0A1	|
	TAY						;$00A0A4	|
	PLA						;$00A0A5	|
	ASL A					;$00A0A6	|
	ADC #$0500				;$00A0A7	|
	STA $18					;$00A0AA	|
	DEY						;$00A0AC	|
	DEY						;$00A0AD	|
	STY $4D					;$00A0AE	|
	LDA #$A0BA				;$00A0B0	|\ 
	LDX #$0000				;$00A0B3	|| Execute the below on the SNES.
	JML SA1_ExecuteSNES		;$00A0B6	|/
label_00A0BA:				;			|
	LDY $4D					;$00A0BA	|
	CLC						;$00A0BC	|
label_00A0BD:				;			|
	LDA ($18),Y				;$00A0BD	|
	AND #$001F				;$00A0BF	|
	CMP #$001F				;$00A0C2	|
	BEQ label_00A0C8		;$00A0C5	|
	INC A					;$00A0C7	|
label_00A0C8:				;			|
	STA $02					;$00A0C8	|
	LDA ($18),Y				;$00A0CA	|
	AND #$03E0				;$00A0CC	|
	CMP #$03E0				;$00A0CF	|
	BEQ label_00A0D7		;$00A0D2	|
	ADC #$0020				;$00A0D4	|
label_00A0D7:				;			|
	STA $04					;$00A0D7	|
	LDA ($18),Y				;$00A0D9	|
	AND #$7C00				;$00A0DB	|
	CMP #$7C00				;$00A0DE	|
	BEQ label_00A0E6		;$00A0E1	|
	ADC #$0400				;$00A0E3	|
label_00A0E6:				;			|
	ORA $04					;$00A0E6	|
	ORA $02					;$00A0E8	|
	STA ($18),Y				;$00A0EA	|
	DEY						;$00A0EC	|
	DEY						;$00A0ED	|
	BPL label_00A0BD		;$00A0EE	|
	RTL						;$00A0F0	|


label_00A0F1:				;-----------|
	JSR label_00923A		;$00A0F1	|
	PHA						;$00A0F4	|
	JSR label_00924A		;$00A0F5	|
	TAY						;$00A0F8	|
	PLA						;$00A0F9	|
	ASL A					;$00A0FA	|
	ADC #$0500				;$00A0FB	|
	STA $18					;$00A0FE	|
	DEY						;$00A100	|
	DEY						;$00A101	|
	STY $4D					;$00A102	|
	LDA #$A10E				;$00A104	|\ 
	LDX #$0000				;$00A107	|| Execute the below on the SNES.
	JML SA1_ExecuteSNES		;$00A10A	|/
label_00A10E:				;			|
	LDY $4D					;$00A10E	|
	SEC						;$00A110	|
label_00A111:				;			|
	LDA ($18),Y				;$00A111	|
	AND #$001F				;$00A113	|
	BEQ label_00A119		;$00A116	|
	DEC A					;$00A118	|
label_00A119:				;			|
	STA $02					;$00A119	|
	LDA ($18),Y				;$00A11B	|
	AND #$03E0				;$00A11D	|
	BEQ label_00A125		;$00A120	|
	SBC #$0020				;$00A122	|
label_00A125:				;			|
	STA $04					;$00A125	|
	LDA ($18),Y				;$00A127	|
	AND #$7C00				;$00A129	|
	BEQ label_00A131		;$00A12C	|
	SBC #$0400				;$00A12E	|
label_00A131:				;			|
	ORA $04					;$00A131	|
	ORA $02					;$00A133	|
	STA ($18),Y				;$00A135	|
	DEY						;$00A137	|
	DEY						;$00A138	|
	BPL label_00A111		;$00A139	|
	RTL						;$00A13B	|

label_00A13C:				;-----------|
	JSR label_00923A		;$00A13C	|
	PHA						;$00A13F	|
	JSR label_00924A		;$00A140	|
	PHA						;$00A143	|
	JSR label_00923A		;$00A144	|
	STA $0A					;$00A147	|
	JSR label_00923A		;$00A149	|
	STA $0C					;$00A14C	|
	JSR label_00923A		;$00A14E	|
	STA $0E					;$00A151	|
	PLY						;$00A153	|
	PLA						;$00A154	|
	PHA						;$00A155	|
	LDA $0C					;$00A156	|
	ASL A					;$00A158	|
	ASL A					;$00A159	|
	ASL A					;$00A15A	|
	ASL A					;$00A15B	|
	ASL A					;$00A15C	|
	STA $0C					;$00A15D	|
	LDA $0E					;$00A15F	|
	XBA						;$00A161	|
	ASL A					;$00A162	|
	ASL A					;$00A163	|
	STA $0E					;$00A164	|
	PLA						;$00A166	|
	ASL A					;$00A167	|
	ADC #$0500				;$00A168	|
	STA $18					;$00A16B	|
	DEY						;$00A16D	|
	DEY						;$00A16E	|
	STY $4D					;$00A16F	|
	LDA #$A17B				;$00A171	|\ 
	LDX #$0000				;$00A174	|| Execute the below on the SNES.
	JML SA1_ExecuteSNES		;$00A177	|/
label_00A17B:				;			|
	LDY $4D					;$00A17B	|
	CLC						;$00A17D	|
label_00A17E:				;			|
	LDA ($18),Y				;$00A17E	|
	AND #$001F				;$00A180	|
	CMP #$001F				;$00A183	|
	BEQ label_00A18B		;$00A186	|
	CLC						;$00A188	|
	ADC $0A					;$00A189	|
label_00A18B:				;			|
	STA $02					;$00A18B	|
	LDA ($18),Y				;$00A18D	|
	AND #$03E0				;$00A18F	|
	CMP #$03E0				;$00A192	|
	BEQ label_00A19A		;$00A195	|
	CLC						;$00A197	|
	ADC $0C					;$00A198	|
label_00A19A:				;			|
	STA $04					;$00A19A	|
	LDA ($18),Y				;$00A19C	|
	AND #$7C00				;$00A19E	|
	CMP #$7C00				;$00A1A1	|
	BEQ label_00A1A9		;$00A1A4	|
	CLC						;$00A1A6	|
	ADC $0E					;$00A1A7	|
label_00A1A9:				;			|
	ORA $04					;$00A1A9	|
	ORA $02					;$00A1AB	|
	STA ($18),Y				;$00A1AD	|
	DEY						;$00A1AF	|
	DEY						;$00A1B0	|
	BPL label_00A17E		;$00A1B1	|
	RTL						;$00A1B3	|

label_00A1B4:				;-----------|
	JSR label_00923A		;$00A1B4	|
	PHA						;$00A1B7	|
	JSR label_00924A		;$00A1B8	|
	PHA						;$00A1BB	|
	JSR label_00923A		;$00A1BC	|
	STA $0A					;$00A1BF	|
	JSR label_00923A		;$00A1C1	|
	STA $0C					;$00A1C4	|
	JSR label_00923A		;$00A1C6	|
	STA $0E					;$00A1C9	|
	PLY						;$00A1CB	|
	PLA						;$00A1CC	|
	PHA						;$00A1CD	|
	LDA $0C					;$00A1CE	|
	ASL A					;$00A1D0	|
	ASL A					;$00A1D1	|
	ASL A					;$00A1D2	|
	ASL A					;$00A1D3	|
	ASL A					;$00A1D4	|
	STA $0C					;$00A1D5	|
	LDA $0E					;$00A1D7	|
	XBA						;$00A1D9	|
	ASL A					;$00A1DA	|
	ASL A					;$00A1DB	|
	STA $0E					;$00A1DC	|
	PLA						;$00A1DE	|
	ASL A					;$00A1DF	|
	ADC #$0500				;$00A1E0	|
	STA $18					;$00A1E3	|
	DEY						;$00A1E5	|
	DEY						;$00A1E6	|
	STY $4D					;$00A1E7	|
	LDA #$A1F3				;$00A1E9	|\ 
	LDX #$0000				;$00A1EC	|| Execute the below on the SNES.
	JML SA1_ExecuteSNES		;$00A1EF	|/
label_00A1F3:				;			|
	LDY $4D					;$00A1F3	|
	SEC						;$00A1F5	|
label_00A1F6:				;			|
	LDA ($18),Y				;$00A1F6	|
	AND #$001F				;$00A1F8	|
	BEQ label_00A205		;$00A1FB	|
	SEC						;$00A1FD	|
	SBC $0A					;$00A1FE	|
	BPL label_00A205		;$00A200	|
	LDA #$0000				;$00A202	|
label_00A205:				;			|
	STA $02					;$00A205	|
	LDA ($18),Y				;$00A207	|
	AND #$03E0				;$00A209	|
	BEQ label_00A216		;$00A20C	|
	SEC						;$00A20E	|
	SBC $0C					;$00A20F	|
	BPL label_00A216		;$00A211	|
	LDA #$0000				;$00A213	|
label_00A216:				;			|
	STA $04					;$00A216	|
	LDA ($18),Y				;$00A218	|
	AND #$7C00				;$00A21A	|
	BEQ label_00A227		;$00A21D	|
	SEC						;$00A21F	|
	SBC $0E					;$00A220	|
	BPL label_00A227		;$00A222	|
	LDA #$0000				;$00A224	|
label_00A227:				;			|
	ORA $04					;$00A227	|
	ORA $02					;$00A229	|
	STA ($18),Y				;$00A22B	|
	DEY						;$00A22D	|
	DEY						;$00A22E	|
	BPL label_00A1F6		;$00A22F	|
	RTL						;$00A231	|

label_00A232:				;-----------|
	JSR label_00924A		;$00A232	|
	PHA						;$00A235	|
	JSR label_00923A		;$00A236	|
	ASL A					;$00A239	|
	TAX						;$00A23A	|
	JSR label_00924A		;$00A23B	|
	TAY						;$00A23E	|
	PLA						;$00A23F	|
label_00A240:				;			|
	STA $49					;$00A240	|
	STX $4B					;$00A242	|
	STY $4D					;$00A244	|
	LDA #$A250				;$00A246	|\ 
	LDX #$0000				;$00A249	|| Execute the below on the SNES.
	JML SA1_ExecuteSNES		;$00A24C	|/
label_00A250:				;			|
	LDA $49					;$00A250	|
	LDX $4B					;$00A252	|
	LDY $4D					;$00A254	|
	STA $0500,X				;$00A256	|
	TXA						;$00A259	|
	CLC						;$00A25A	|
	ADC #$0500				;$00A25B	|
	TAX						;$00A25E	|
	DEY						;$00A25F	|
	DEY						;$00A260	|
	TYA						;$00A261	|
	TXY						;$00A262	|
	INY						;$00A263	|
	INY						;$00A264	|
	PHB						;$00A265	|
	MVN $0000				;$00A266	|
	PLB						;$00A269	|
	RTL						;$00A26A	|

label_00A26B:				;-----------|
	LDX $39					;$00A26B	|
	LDA $724A,X				;$00A26D	|
	ASL A					;$00A270	|
	TAX						;$00A271	|
	JSR label_00924A		;$00A272	|
	STA $28					;$00A275	|
	LDA $32D4,X				;$00A277	|
	AND $28					;$00A27A	|
	RTL						;$00A27C	|

label_00A27D:				;-----------|
	LDX $39					;$00A27D	|
	LDA $724A,X				;$00A27F	|
	ASL A					;$00A282	|
	TAX						;$00A283	|
	JSR label_00924A		;$00A284	|
	STA $28					;$00A287	|
	LDA $32C4,X				;$00A289	|
	AND $28					;$00A28C	|
	RTL						;$00A28E	|

label_00A28F:				;-----------|
	PHB						;$00A28F	|
	JSR label_00924A		;$00A290	|
	TAX						;$00A293	|
	JSR label_00923A		;$00A294	|
	PHA						;$00A297	|
	JSR label_00924A		;$00A298	|
	TAY						;$00A29B	|
	JSR label_00923A		;$00A29C	|
	SEP #$20				;$00A29F	|
	PHA						;$00A2A1	|
	PLB						;$00A2A2	|
	REP #$20				;$00A2A3	|
	PLA						;$00A2A5	|
	JSL DepressData			;$00A2A6	|
	PLB						;$00A2AA	|
	RTL						;$00A2AB	|

label_00A2AC:				;-----------|
	JSR label_00924A		;$00A2AC	|
	STA $28					;$00A2AF	|
	JSR label_00924A		;$00A2B1	|
	CMP ($28)				;$00A2B4	|
	BEQ label_00A2C8		;$00A2B6	|
	LDA $3D					;$00A2B8	|
	SEC						;$00A2BA	|
	SBC #$0006				;$00A2BB	|
	STA $3D					;$00A2BE	|
	LDX $39					;$00A2C0	|
	LDA #$0001				;$00A2C2	|
	STA $6724,X				;$00A2C5	|
label_00A2C8:				;			|
	RTL						;$00A2C8	|

label_00A2C9:				;-----------|
	JSR label_00924A		;$00A2C9	|
	STA $28					;$00A2CC	|
	JSR label_00924A		;$00A2CE	|
	SEC						;$00A2D1	|
	SBC ($28)				;$00A2D2	|
	RTL						;$00A2D4	|

label_00A2D5:				;-----------|
	JSR label_00924A		;$00A2D5	|
	STA $28					;$00A2D8	|
	JSR label_00924A		;$00A2DA	|
	LDY $39					;$00A2DD	|
	SEC						;$00A2DF	|
	SBC ($28),Y				;$00A2E0	|
	RTL						;$00A2E2	|

label_00A2E3:				;-----------|
	JSR label_00924A		;$00A2E3	|
	STA $28					;$00A2E6	|
	JSR label_00924A		;$00A2E8	|
	LDY $39					;$00A2EB	|
	SEC						;$00A2ED	|
	SBC ($28),Y				;$00A2EE	|
	RTL						;$00A2F0	|

label_00A2F1:				;-----------|
	JSR label_00924A		;$00A2F1	|
	STA $28					;$00A2F4	|
	JSR label_00923A		;$00A2F6	|
	ASL A					;$00A2F9	|
	TAX						;$00A2FA	|
	LDA ($28)				;$00A2FB	|
	AND.l DATA_008B62,X		;$00A2FD	|
	RTL						;$00A301	|

label_00A302:				;-----------|
	JSR label_00924A		;$00A302	|
	TAX						;$00A305	|
	LDY #$0000				;$00A306	|
	LDA $0000,X				;$00A309	|
	BPL label_00A30F		;$00A30C	|
	INY						;$00A30E	|
label_00A30F:				;			|
	TYA						;$00A30F	|
	RTL						;$00A310	|

label_00A311:				;-----------|
	JSR label_00924A		;$00A311	|
	STA $28					;$00A314	|
	JSR label_00924A		;$00A316	|
	LDY $39					;$00A319	|
	STA ($28),Y				;$00A31B	|
	RTL						;$00A31D	|

label_00A31E:				;-----------|
	JSR label_00924A		;$00A31E	|
	STA $28					;$00A321	|
	JSR label_00924A		;$00A323	|
	LDY $39					;$00A326	|
	STA ($28),Y				;$00A328	|
	RTL						;$00A32A	|

label_00A32B:				;-----------|
	JSR label_00923A		;$00A32B	|
	JMP CallRNG_ModA		;$00A32E	|

label_00A331:				;-----------|
	INC $7368				;$00A331	|
	LDA $6014				;$00A334	|
label_00A337:				;			|
	TAX						;$00A337	|
	CPX $39					;$00A338	|
	BEQ label_00A345		;$00A33A	|
	LDA $62BC,X				;$00A33C	|
	ORA #$4000				;$00A33F	|
	STA $62BC,X				;$00A342	|
label_00A345:				;			|
	LDA $603C,X				;$00A345	|
	BPL label_00A337		;$00A348	|
	SEC						;$00A34A	|
	RTL						;$00A34B	|

label_00A34C:				;-----------|
	LDA $6014				;$00A34C	|
label_00A34F:				;			|
	TAX						;$00A34F	|
	CPX $39					;$00A350	|
	BEQ label_00A35D		;$00A352	|
	LDA $62BC,X				;$00A354	|
	AND #$BFFF				;$00A357	|
	STA $62BC,X				;$00A35A	|
label_00A35D:				;			|
	LDA $603C,X				;$00A35D	|
	BPL label_00A34F		;$00A360	|
	LDY $39					;$00A362	|
	STZ $7368				;$00A364	|
	SEC						;$00A367	|
	RTL						;$00A368	|

label_00A369:				;-----------|
	LDA $62BC,X				;$00A369	|
	ORA #$4000				;$00A36C	|
	STA $62BC,X				;$00A36F	|
	RTL						;$00A372	|

label_00A373:				;-----------|
	LDA $62BC,X				;$00A373	|
	AND #$BFFF				;$00A376	|
	STA $62BC,X				;$00A379	|
	RTL						;$00A37C	|

label_00A37D:				;-----------|
	LDA $6014				;$00A37D	|
label_00A380:				;			|
	TAX						;$00A380	|
	CPX $39					;$00A381	|
	BEQ label_00A38E		;$00A383	|
	LDA $65B0,X				;$00A385	|
	AND #$7FFF				;$00A388	|
	STA $65B0,X				;$00A38B	|
label_00A38E:				;			|
	LDA $603C,X				;$00A38E	|
	BPL label_00A380		;$00A391	|
	SEC						;$00A393	|
	LDA #$0001				;$00A394	|
	STA $770F				;$00A397	|
	RTL						;$00A39A	|

label_00A39B:				;-----------|
	LDA $6014				;$00A39B	|
label_00A39E:				;			|
	TAX						;$00A39E	|
	CPX $39					;$00A39F	|
	BEQ label_00A3AC		;$00A3A1	|
	LDA $65B0,X				;$00A3A3	|
	ORA #$8000				;$00A3A6	|
	STA $65B0,X				;$00A3A9	|
label_00A3AC:				;			|
	LDA $603C,X				;$00A3AC	|
	BPL label_00A39E		;$00A3AF	|
	SEC						;$00A3B1	|
	STZ $770F				;$00A3B2	|
	RTL						;$00A3B5	|

label_00A3B6:				;-----------|
	STA $00					;$00A3B6	|
label_00A3B8:				;			|
	LDA $623C,X				;$00A3B8	|
	BMI label_00A3C6		;$00A3BB	|
	LDA $65B0,X				;$00A3BD	|
	ORA #$8000				;$00A3C0	|
	STA $65B0,X				;$00A3C3	|
label_00A3C6:				;			|
	INX						;$00A3C6	|
	INX						;$00A3C7	|
	CPX $00					;$00A3C8	|
	BCC label_00A3B8		;$00A3CA	|
	RTL						;$00A3CC	|

label_00A3CD:				;-----------|
	LDX $39					;$00A3CD	|
label_00A3CF:				;			|
	LDA $65B0,X				;$00A3CF	|
	AND #$7FFF				;$00A3D2	|
	STA $65B0,X				;$00A3D5	|
	RTL						;$00A3D8	|

label_00A3D9:				;-----------|
	LDX $39					;$00A3D9	|
label_00A3DB:				;			|
	LDA $65B0,X				;$00A3DB	|
	ORA #$8000				;$00A3DE	|
	STA $65B0,X				;$00A3E1	|
	RTL						;$00A3E4	|

label_00A3E5:				;-----------|
	JSR label_00923A		;$00A3E5	|
	TAX						;$00A3E8	|
	BRA label_00A3CF		;$00A3E9	|
	JSR label_00923A		;$00A3EB	|
	TAX						;$00A3EE	|
	BRA label_00A3DB		;$00A3EF	|

label_00A3F1:
	JSR label_00924A		;$00A3F1	|
	TAX						;$00A3F4	|
	JSR label_00924A		;$00A3F5	|
	JSL label_009AEB		;$00A3F8	|
	RTL						;$00A3FC	|

label_00A3FD:				;-----------|
	LDA $6DD0,Y				;$00A3FD	|
	STA $6002				;$00A400	|
	STZ $6006				;$00A403	|
	STZ $6008				;$00A406	|
	BRA label_00A3F1		;$00A409	|

label_00A40B:				;-----------|
	JSR label_00924A		;$00A40B	|
	STA $14					;$00A40E	|
	LDA ($14)				;$00A410	|
	AND #$00FF				;$00A412	|
	STA $724A,Y				;$00A415	|
	RTL						;$00A418	|

label_00A419:				;-----------|
	JSR label_00923A		;$00A419	|
	TAY						;$00A41C	|
	LDX $39					;$00A41D	|
	LDA $6892,Y				;$00A41F	|
	STA $6892,X				;$00A422	|
	STA $6986,X				;$00A425	|
	LDA $690C,Y				;$00A428	|
	STA $690C,X				;$00A42B	|
	STA $6A00,X				;$00A42E	|
	RTL						;$00A431	|

label_00A432:				;-----------|
	JSR label_00924A		;$00A432	|
	STA $3097				;$00A435	|
	JSR label_00923A		;$00A438	|
	ORA #$8000				;$00A43B	|
	STA $3099				;$00A43E	|
	RTL						;$00A441	|

label_00A442:				;-----------|
	STZ $3099				;$00A442	|
	RTL						;$00A445	|

label_00A446:				;-----------|
	LDX $39					;$00A446	|
	STZ $6C62,X				;$00A448	|
	STZ $6CDC,X				;$00A44B	|
	RTL						;$00A44E	|

label_00A44F:				;-----------|
	LDY $39					;$00A44F	|
	JSL label_009251		;$00A451	|
	STA $6C62,Y				;$00A455	|
	JSL label_009251		;$00A458	|
	STA $6CDC,Y				;$00A45C	|
	RTL						;$00A45F	|

label_00A460:				;-----------|
	LDX $39					;$00A460	|
	JSR label_00924A		;$00A462	|
	STA $6B6E,X				;$00A465	|
	JSR label_00924A		;$00A468	|
	STA $6BE8,X				;$00A46B	|
	JSR label_00924A		;$00A46E	|
	STA $6C62,X				;$00A471	|
	JSR label_00924A		;$00A474	|
	STA $6CDC,X				;$00A477	|
	RTL						;$00A47A	|

label_00A47B:				;-----------|
	LDX $39					;$00A47B	|
	JSR label_00924A		;$00A47D	|
	STA $28					;$00A480	|
	JSR label_00923A		;$00A482	|
	ORA #$4000				;$00A485	|
	STA $2C					;$00A488	|
	LDA $3F					;$00A48A	|
	AND #$3F00				;$00A48C	|
	ORA $2C					;$00A48F	|
	STA $3F					;$00A491	|
	LDA $28					;$00A493	|
	DEC A					;$00A495	|
	STA $3D					;$00A496	|
	TYX						;$00A498	|
	JML label_00925B		;$00A499	|

label_00A49D:				;-----------|
	STA $679E,Y				;$00A49D	|
	STX $28					;$00A4A0	|
	LDA $6818,Y				;$00A4A2	|
	AND #$3F00				;$00A4A5	|
	ORA #$0000				;$00A4A8	|
	ORA $28					;$00A4AB	|
	STA $6818,Y				;$00A4AD	|
	TYX						;$00A4B0	|
	STZ $6724,X				;$00A4B1	|
	JML label_00925B		;$00A4B4	|

label_00A4B8:				;-----------|
	JSR label_00924A		;$00A4B8	|
	STA $00					;$00A4BB	|
	JSR label_00924A		;$00A4BD	|
	PHA						;$00A4C0	|
	JSL CallRNG				;$00A4C1	|
	TAX						;$00A4C5	|
	JSR label_00924A		;$00A4C6	|
	JSL label_00A593		;$00A4C9	|
	LDX $32E5				;$00A4CD	|
	PLA						;$00A4D0	|
	JSL label_00A593		;$00A4D1	|
	LDA $32E4				;$00A4D5	|
	AND #$00FF				;$00A4D8	|
	CLC						;$00A4DB	|
	ADC $00					;$00A4DC	|
	LDX $39					;$00A4DE	|
	STA $6986,X				;$00A4E0	|
	RTL						;$00A4E3	|

label_00A4E4:				;-----------|
	JSR label_00924A		;$00A4E4	|
	STA $00					;$00A4E7	|
	JSR label_00924A		;$00A4E9	|
	PHA						;$00A4EC	|
	JSL CallRNG				;$00A4ED	|
	TAX						;$00A4F1	|
	JSR label_00924A		;$00A4F2	|
	JSL label_00A593		;$00A4F5	|
	LDX $32E5				;$00A4F9	|
	PLA						;$00A4FC	|
	JSL label_00A593		;$00A4FD	|
	LDA $32E4				;$00A501	|
	AND #$00FF				;$00A504	|
	CLC						;$00A507	|
	ADC $00					;$00A508	|
	LDX $39					;$00A50A	|
	STA $6A00,X				;$00A50C	|
	RTL						;$00A50F	|

label_00A510:				;-----------|
	JSR label_00923A		;$00A510	|
	STA $6D56,Y				;$00A513	|
	TAX						;$00A516	|
	JSR label_00924A		;$00A517	|
	STA $3037,X				;$00A51A	|
	JSR label_00924A		;$00A51D	|
	STA $303D,X				;$00A520	|
	RTL						;$00A523	|

label_00A524:				;-----------|
	JSR label_00923A		;$00A524	|
	STA $6D56,Y				;$00A527	|
	JSR label_00924A		;$00A52A	|
	JSL $03AC43				;$00A52D	|
	PHA						;$00A531	|
	LDA $6D56,Y				;$00A532	|
	TAY						;$00A535	|
	PLA						;$00A536	|
	STA $733A,Y				;$00A537	|
	TXA						;$00A53A	|
	STA $734A,Y				;$00A53B	|
	LDY $39					;$00A53E	|
	JSR label_00924A		;$00A540	|
	JSL $03AC43				;$00A543	|
	PHA						;$00A547	|
	LDA $6D56,Y				;$00A548	|
	TAY						;$00A54B	|
	PLA						;$00A54C	|
	STA $7342,Y				;$00A54D	|
	TXA						;$00A550	|
	STA $7352,Y				;$00A551	|
	RTL						;$00A554	|

label_00A555:				;-----------|
	JSR label_00923A		;$00A555	|
	STA $6010				;$00A558	|
	JSR label_00923A		;$00A55B	|
	STA $6012				;$00A55E	|
	JML label_009B2E		;$00A561	|


label_00A565:				;-----------|
	BIT $0000				;$00A565	|
	BMI label_00A57C		;$00A568	|
	STA $49					;$00A56A	|
	STX $4B					;$00A56C	|
	LDA #$A578				;$00A56E	|\ 
	LDX #$0000				;$00A571	|| Execute the below on the SA-1.
	JML SNES_ExecuteSA1		;$00A574	|/
label_00A578:				;			|
	LDA $49					;$00A578	|
	LDX $4B					;$00A57A	|
label_00A57C:				;			|
	STZ $2250				;$00A57C	|
	STA $2251				;$00A57F	|
	STX $2253				;$00A582	|
	NOP						;$00A585	|
	LDA $2306				;$00A586	|
	STA $32E4				;$00A589	|
	LDA $2308				;$00A58C	|
	STA $32E6				;$00A58F	|
	RTL						;$00A592	|


label_00A593:				;-----------|
	BIT $0000				;$00A593	|
	BMI label_00A5AA		;$00A596	|
	STA $49					;$00A598	|
	STX $4B					;$00A59A	|
	LDA #$A5A6				;$00A59C	|\ 
	LDX #$0000				;$00A59F	|| Execute the below on the SA-1.
	JML SNES_ExecuteSA1		;$00A5A2	|/
label_00A5A6:				;			|
	LDA $49					;$00A5A6	|
	LDX $4B					;$00A5A8	|
label_00A5AA:				;			|
	STZ $2250				;$00A5AA	|
	STA $64					;$00A5AD	|
	LSR A					;$00A5AF	|
	STA $2251				;$00A5B0	|
	ROR $68					;$00A5B3	|
	TXA						;$00A5B5	|
	STA $66					;$00A5B6	|
	LSR A					;$00A5B8	|
	STA $2253				;$00A5B9	|
	ROR $68					;$00A5BC	|
	LDA $2306				;$00A5BE	|
	ASL A					;$00A5C1	|
	STA $32E4				;$00A5C2	|
	LDA $2308				;$00A5C5	|
	ROL A					;$00A5C8	|
	ASL $32E4				;$00A5C9	|
	ROL A					;$00A5CC	|
	STA $32E6				;$00A5CD	|
	BIT $68					;$00A5D0	|
	BPL label_00A5E4		;$00A5D2	|
	LDA $64					;$00A5D4	|
	BVC label_00A5D9		;$00A5D6	|
	DEC A					;$00A5D8	|
label_00A5D9:				;			|
	ADC $32E4				;$00A5D9	|
	STA $32E4				;$00A5DC	|
	BCC label_00A5E4		;$00A5DF	|
	INC $32E6				;$00A5E1	|
label_00A5E4:				;			|
	BIT $68					;$00A5E4	|
	BVC label_00A5F6		;$00A5E6	|
	LDA $66					;$00A5E8	|
	CLC						;$00A5EA	|
	ADC $32E4				;$00A5EB	|
	STA $32E4				;$00A5EE	|
	BCC label_00A5F6		;$00A5F1	|
	INC $32E6				;$00A5F3	|
label_00A5F6:				;			|
	RTL						;$00A5F6	|


label_00A5F7:				;-----------|
	BIT $0000				;$00A5F7	|
	BMI label_00A60E		;$00A5FA	|
	STA $49					;$00A5FC	|
	STX $4B					;$00A5FE	|\ 
	LDA #$A60A				;$00A600	|| Execute the below on the SA-1.
	LDX #$0000				;$00A603	|/
	JML SNES_ExecuteSA1		;$00A606	|
label_00A60A:				;			|
	LDA $49					;$00A60A	|
	LDX $4B					;$00A60C	|
label_00A60E:				;			|
	LDY #$0001				;$00A60E	|
	STY $2250				;$00A611	|
	STA $2251				;$00A614	|
	STX $2253				;$00A617	|
	NOP						;$00A61A	|
	LDA $2306				;$00A61B	|
	STA $32E4				;$00A61E	|
	LDA $2308				;$00A621	|
	STA $32E6				;$00A624	|
	RTL						;$00A627	|


label_00A628:				;-----------|
	BIT $0000				;$00A628	|
	BMI label_00A63F		;$00A62B	|
	STA $49					;$00A62D	|
	STX $4B					;$00A62F	|
	LDA #$A63B				;$00A631	|\ 
	LDX #$0000				;$00A634	|| Execute the below on the SA-1.
	JML SNES_ExecuteSA1		;$00A637	|/
label_00A63B:				;			|
	LDA $49					;$00A63B	|
	LDX $4B					;$00A63D	|
label_00A63F:				;			|
	LDY #$0001				;$00A63F	|
	STY $2250				;$00A642	|
	LSR A					;$00A645	|
	STA $2251				;$00A646	|
	STX $2253				;$00A649	|
	STX $64					;$00A64C	|
	PHP						;$00A64E	|
	LDA $2306				;$00A64F	|
	ASL A					;$00A652	|
	STA $32E4				;$00A653	|
	PLP						;$00A656	|
	LDA $2308				;$00A657	|
	ROL A					;$00A65A	|
	CMP $64					;$00A65B	|
	BCC label_00A664		;$00A65D	|
	SBC $64					;$00A65F	|
	INC $32E4				;$00A661	|
label_00A664:				;			|
	STA $32E6				;$00A664	|
	RTL						;$00A667	|


label_00A668:				;-----------|
	EOR #$FFFF				;$00A668	|
	INC A					;$00A66B	|
	STA $49					;$00A66C	|
	STX $4B					;$00A66E	|
	STY $4D					;$00A670	|
	BIT $0000				;$00A672	|
	BMI label_00A681		;$00A675	|
	LDA #$A681				;$00A677	|\ 
	LDX #$0000				;$00A67A	|| Execute the below on the SA-1.
	JML SNES_ExecuteSA1		;$00A67D	|/
label_00A681:				;			|
	STZ $2250				;$00A681	|
	LDA $4D					;$00A684	|
	STA $2251				;$00A686	|
	LDA $49					;$00A689	|
	CLC						;$00A68B	|
	ADC #$4000				;$00A68C	|
	JSR label_00A6C9		;$00A68F	|
	STA $2253				;$00A692	|
	TAY						;$00A695	|
	LDA $2307				;$00A696	|
	STA $3083				;$00A699	|
	LDA $49					;$00A69C	|
	JSR label_00A6C9		;$00A69E	|
	STA $2253				;$00A6A1	|
	EOR #$FFFF				;$00A6A4	|
	INC A					;$00A6A7	|
	TAX						;$00A6A8	|
	LDA $2307				;$00A6A9	|
	STA $3085				;$00A6AC	|
	LDA $4B					;$00A6AF	|
	STA $2251				;$00A6B1	|
	STX $2253				;$00A6B4	|
	NOP						;$00A6B7	|
	LDA $2307				;$00A6B8	|
	STA $3087				;$00A6BB	|
	STY $2253				;$00A6BE	|
	NOP						;$00A6C1	|
	LDA $2307				;$00A6C2	|
	STA $3089				;$00A6C5	|
	RTL						;$00A6C8	|


label_00A6C9:				;-----------|
	PHA						;$00A6C9	|
	XBA						;$00A6CA	|
	AND #$007F				;$00A6CB	|
	CMP #$0040				;$00A6CE	|
	BNE label_00A6D8		;$00A6D1	|
	LDA #$0100				;$00A6D3	|
	BRA label_00A6E0		;$00A6D6	|
label_00A6D8:				;			|
	TAX						;$00A6D8	|
	LDA $05EE8B,X			;$00A6D9	|
	AND #$00FF				;$00A6DD	|
label_00A6E0:				;			|
	PLX						;$00A6E0	|
	BPL label_00A6E7		;$00A6E1	|
	EOR #$FFFF				;$00A6E3	|
	INC A					;$00A6E6	|
label_00A6E7:				;			|
	RTS						;$00A6E7	|


label_00A6E8:				;-----------| Subroutine to waste time.
	JSR label_00A6EC		;$00A6E8	|
	RTL						;$00A6EB	|
label_00A6EC:				;			|
	RTS						;$00A6EC	|


label_00A6ED:				;-----------|
	JSR label_00A6F1		;$00A6ED	|
	RTL						;$00A6F0	|
label_00A6F1:				;			|
	JSR label_00A7B8		;$00A6F1	|
	JMP label_00A89D		;$00A6F4	|

label_00A6F7:				;-----------|
	JSR label_00A6FB		;$00A6F7	|
	RTL						;$00A6FA	|
label_00A6FB:				;			|
	JSR label_00A81B		;$00A6FB	|
	JSR label_00A7B8		;$00A6FE	|
	JMP label_00A89D		;$00A701	|

label_00A704:				;-----------|
	JSR label_00A708		;$00A704	|
	RTL						;$00A707	|
label_00A708:				;			|
	JSR label_00A81B		;$00A708	|
	JSR label_00A7B8		;$00A70B	|
	RTS						;$00A70E	|

label_00A70F:				;-----------|
	JSR label_00A713		;$00A70F	|
	RTL						;$00A712	|
label_00A713:				;			|
	JSR label_00A7B8		;$00A713	|
	JMP label_00A87F		;$00A716	|

label_00A719:				;-----------|
	JSR label_00A71D		;$00A719	|
	RTL						;$00A71C	|
label_00A71D:				;			|
	JSR label_00A81B		;$00A71D	|
	JSR label_00A832		;$00A720	|
	JMP label_00A89D		;$00A723	|

label_00A726:				;-----------|
	JSR label_00A72A		;$00A726	|
	RTL						;$00A729	|
label_00A72A:				;			|
	JSR label_00A81B		;$00A72A	|
	JSR label_00A7B8		;$00A72D	|
	JMP label_00A87F		;$00A730	|


label_00A733:				;-----------|
	JSR label_00A737		;$00A733	|
	RTL						;$00A736	|
label_00A737:				;			|
	JSR label_00A81B		;$00A737	|
	JSR label_00A832		;$00A73A	|
	JMP label_00A87F		;$00A73D	|

label_00A740:				;-----------|
	JSR label_00A744		;$00A740	|
	RTL						;$00A743	|
label_00A744:				;			|
	JSR label_00A81B		;$00A744	|
	JSR label_00A7B8		;$00A747	|
	LDY $39					;$00A74A	|
	LDX $6E4A,Y				;$00A74C	|
	LDA $6B6E,X				;$00A74F	|
	JSR label_00A802		;$00A752	|
	STA $6892,Y				;$00A755	|
	LDA $6A00,Y				;$00A758	|
	STA $690C,Y				;$00A75B	|
	RTS						;$00A75E	|

label_00A75F:				;-----------|
	JSR label_00A763		;$00A75F	|
	RTL						;$00A762	|
label_00A763:				;			|
	JSR label_00A81B		;$00A763	|
	JSR label_00A7B8		;$00A766	|
	LDY $39					;$00A769	|
	LDX $6E4A,Y				;$00A76B	|
	LDA $6B6E,X				;$00A76E	|
	JSR label_00A802		;$00A771	|
	STA $6892,Y				;$00A774	|
	LDX $6E4A,Y				;$00A777	|
	LDA $6BE8,X				;$00A77A	|
	JSR label_00A7ED		;$00A77D	|
	STA $690C,Y				;$00A780	|
	RTS						;$00A783	|


label_00A784:				;-----------|
	JSR label_00A788		;$00A784	|
	RTL						;$00A787	|
label_00A788:				;			|
	JSR label_00A81B		;$00A788	|
	LDA $6DD0,Y				;$00A78B	|
	BMI label_00A796		;$00A78E	|
	JSR label_00A7B8		;$00A790	|
	JMP label_00A89D		;$00A793	|
label_00A796:				;			|
	JSR label_00A7C9		;$00A796	|
	JMP label_00A89D		;$00A799	|


label_00A79C:				;-----------|
	JSR label_00A7A0		;$00A79C	|
	RTL						;$00A79F	|
label_00A7A0:				;			|
	JSR label_00A81B		;$00A7A0	|
	LDA $6DD0,Y				;$00A7A3	|
	BMI label_00A7AE		;$00A7A6	|
	JSR label_00A7B8		;$00A7A8	|
	JMP label_00A87F		;$00A7AB	|
label_00A7AE:				;			|
	JSR label_00A7C9		;$00A7AE	|
	JMP label_00A87F		;$00A7B1	|

label_00A7B4:				;-----------|
	JSR label_00A7B8		;$00A7B4	|
	RTL						;$00A7B7	|
label_00A7B8:				;			|
	LDY $39					;$00A7B8	|
	LDA $6B6E,Y				;$00A7BA	|
	JSR label_00A802		;$00A7BD	|
	LDA $6BE8,Y				;$00A7C0	|
	BRA label_00A7ED		;$00A7C3	|

label_00A7C5:				;-----------|
	JSR label_00A7C9		;$00A7C5	|
	RTL						;$00A7C8	|
label_00A7C9:				;			|
	LDY $39					;$00A7C9	|
	LDA $6B6E,Y				;$00A7CB	|
	EOR #$FFFF				;$00A7CE	|
	INC A					;$00A7D1	|
	JSR label_00A802		;$00A7D2	|
	LDA $6BE8,Y				;$00A7D5	|
	BRA label_00A7ED		;$00A7D8	|

label_00A7DA:				;-----------|
	LDY $39					;$00A7DA	|
	LDA $6B6E,Y				;$00A7DC	|
	EOR #$FFFF				;$00A7DF	|
	INC A					;$00A7E2	|
	JSR label_00A802		;$00A7E3	|
	LDA $6BE8,Y				;$00A7E6	|
	EOR #$FFFF				;$00A7E9	|
	INC A					;$00A7EC	|
label_00A7ED:				;			|
	JSL $03AC43				;$00A7ED	|
	PHA						;$00A7F1	|
	TXA						;$00A7F2	|
	CLC						;$00A7F3	|
	ADC $6AF4,Y				;$00A7F4	|
	STA $6AF4,Y				;$00A7F7	|
	PLA						;$00A7FA	|
	ADC $6A00,Y				;$00A7FB	|
	STA $6A00,Y				;$00A7FE	|
	RTS						;$00A801	|

label_00A802:				;```````````|
	JSL $03AC43				;$00A802	|
	PHA						;$00A806	|
	TXA						;$00A807	|
	CLC						;$00A808	|
	ADC $6A7A,Y				;$00A809	|
	STA $6A7A,Y				;$00A80C	|
	PLA						;$00A80F	|
	ADC $6986,Y				;$00A810	|
	STA $6986,Y				;$00A813	|
	RTS						;$00A816	|
	JSR label_00A81B		;$00A817	|
	RTL						;$00A81A	|

label_00A81B:				;```````````|
	LDY $39					;$00A81B	|
	LDA $6C62,Y				;$00A81D	|
	CLC						;$00A820	|
	ADC $6B6E,Y				;$00A821	|
	STA $6B6E,Y				;$00A824	|
	LDA $6CDC,Y				;$00A827	|
	CLC						;$00A82A	|
	ADC $6BE8,Y				;$00A82B	|
	STA $6BE8,Y				;$00A82E	|
	RTS						;$00A831	|


label_00A832:				;-----------|
	LDA $6B6E,Y				;$00A832	|
	LDX $6BE8,Y				;$00A835	|
	JSL $059CC6				;$00A838	|
	LDA $04					;$00A83C	|
	AND #$FF00				;$00A83E	|
	BPL label_00A846		;$00A841	|
	ORA #$00FF				;$00A843	|
label_00A846:				;			|
	XBA						;$00A846	|
	TAX						;$00A847	|
	LDA $03					;$00A848	|
	AND #$FF00				;$00A84A	|
	CLC						;$00A84D	|
	ADC $6A7A,Y				;$00A84E	|
	STA $6A7A,Y				;$00A851	|
	TXA						;$00A854	|
	ADC $6986,Y				;$00A855	|
	STA $6986,Y				;$00A858	|
	LDA $06					;$00A85B	|
	AND #$FF00				;$00A85D	|
	BPL label_00A865		;$00A860	|
	ORA #$00FF				;$00A862	|
label_00A865:				;			|
	XBA						;$00A865	|
	TAX						;$00A866	|
	LDA $05					;$00A867	|
	AND #$FF00				;$00A869	|
	CLC						;$00A86C	|
	ADC $6AF4,Y				;$00A86D	|
	STA $6AF4,Y				;$00A870	|
	TXA						;$00A873	|
	ADC $6A00,Y				;$00A874	|
	STA $6A00,Y				;$00A877	|
	RTS						;$00A87A	|

label_00A87B:				;-----------|
	JSR label_00A87F		;$00A87B	|
	RTL						;$00A87E	|
label_00A87F:				;			|
	LDY $39					;$00A87F	|
	LDX $6E4A,Y				;$00A881	|
	LDA $6986,Y				;$00A884	|
	CLC						;$00A887	|
	ADC $6892,X				;$00A888	|
	STA $6892,Y				;$00A88B	|
	LDA $6A00,Y				;$00A88E	|
	CLC						;$00A891	|
	ADC $690C,X				;$00A892	|
	STA $690C,Y				;$00A895	|
	RTS						;$00A898	|

label_00A899:				;-----------|
	JSR label_00A89D		;$00A899	|
	RTL						;$00A89C	|
label_00A89D:				;			|
	LDY $39					;$00A89D	|
	LDA $6986,Y				;$00A89F	|
	STA $6892,Y				;$00A8A2	|
	LDA $6A00,Y				;$00A8A5	|
	STA $690C,Y				;$00A8A8	|
	RTS						;$00A8AB	|

label_00A8AC:				;-----------|
	LDY $39					;$00A8AC	|
	LDX $6D56,Y				;$00A8AE	|
	JSL label_00A8D2		;$00A8B1	|
	RTS						;$00A8B5	|

label_00A8B6:				;-----------|
	JSR label_00A8BA		;$00A8B6	|
	RTL						;$00A8B9	|
label_00A8BA:				;			|
	LDX #$0004				;$00A8BA	|
label_00A8BD:				;			|
	JSL label_00A8D2		;$00A8BD	|
	DEX						;$00A8C1	|
	DEX						;$00A8C2	|
	BPL label_00A8BD		;$00A8C3	|
	RTS						;$00A8C5	|

label_00A8C6:				;-----------|
	JSR label_00A8CA		;$00A8C6	|
	RTL						;$00A8C9	|
label_00A8CA:				;			|
	LDX #$0004				;$00A8CA	|
	JSL label_00A8D2		;$00A8CD	|
	RTS						;$00A8D1	|

label_00A8D2:				;```````````|
	LDA $3043,X				;$00A8D2	|
	CLC						;$00A8D5	|
	ADC $734A,X				;$00A8D6	|
	STA $3043,X				;$00A8D9	|
	LDA $3037,X				;$00A8DC	|
	ADC $733A,X				;$00A8DF	|
	STA $3037,X				;$00A8E2	|
	LDA $3049,X				;$00A8E5	|
	ADC $7352,X				;$00A8E8	|
	STA $3049,X				;$00A8EB	|
	LDA $303D,X				;$00A8EE	|
	ADC $7342,X				;$00A8F1	|
	STA $303D,X				;$00A8F4	|
	RTL						;$00A8F7	|

label_00A8F8:				;-----------|
	JSR label_00A8FC		;$00A8F8	|
	RTL						;$00A8FB	|
label_00A8FC:				;			|
	LDY $39					;$00A8FC	|
	LDA $3037				;$00A8FE	|
	STA $6986,Y				;$00A901	|
	LDA $303D				;$00A904	|
	STA $6A00,Y				;$00A907	|
	JSR label_00A81B		;$00A90A	|
	JSR label_00A7DA		;$00A90D	|
	LDA $6986,Y				;$00A910	|
	STA $3037				;$00A913	|
	LDA $6A00,Y				;$00A916	|
	STA $303D				;$00A919	|
	RTS						;$00A91C	|

label_00A91D:				;-----------|
	JSR label_00A921		;$00A91D	|
	RTL						;$00A920	|
label_00A921:				;			|
	PHX						;$00A921	|
	LDY $39					;$00A922	|
	LDA $3037,X				;$00A924	|
	STA $6986,Y				;$00A927	|
	LDA $303D,X				;$00A92A	|
	STA $6A00,Y				;$00A92D	|
	JSR label_00A81B		;$00A930	|
	JSR label_00A7DA		;$00A933	|
	PLX						;$00A936	|
	LDA $6986,Y				;$00A937	|
	STA $3037,X				;$00A93A	|
	LDA $6A00,Y				;$00A93D	|
	STA $303D,X				;$00A940	|
	RTS						;$00A943	|

label_00A944:				;-----------|
	PEA .ret-1				;$00A944	|
	JMP ($6026)				;$00A947	|
  .ret						;			|
	RTL						;$00A94A	|

label_00A94B:				;-----------|
	JSR label_00A96A		;$00A94B	|
	RTL						;$00A94E	|

label_00A94F:				;-----------|
	JSR label_00A96A		;$00A94F	|
	STZ $7362				;$00A952	|
	STZ $7364				;$00A955	|
	RTS						;$00A958	|

label_00A959:				;-----------|
	STZ $735E				;$00A959	|
	STZ $7362				;$00A95C	|
	STZ $7360				;$00A95F	|
	STZ $7364				;$00A962	|
	RTS						;$00A965	|

label_00A966:				;-----------|
	JSR label_00A96A		;$00A966	|
	RTL						;$00A969	|
label_00A96A:				;			|
	LDA $735A				;$00A96A	|
	STA $14					;$00A96D	|
	LDA $735C				;$00A96F	|
	STA $18					;$00A972	|
	LDA ($14)				;$00A974	|
	STA $735E				;$00A976	|
	STA $7362				;$00A979	|
	LDA ($18)				;$00A97C	|
	STA $7360				;$00A97E	|
	STA $7364				;$00A981	|
	RTS						;$00A984	|

label_00A985:				;-----------|
	LDA #$30A4				;$00A985	|
	STA $3021				;$00A988	|
	LDA #$32A1				;$00A98B	|
	STA $3028				;$00A98E	|
	LDA #$32A4				;$00A991	|
	STA $3023				;$00A994	|
	LDA #$32C3				;$00A997	|
	STA $302A				;$00A99A	|
	LDA #$0100				;$00A99D	|
	STA $3026				;$00A9A0	|
	LDA #$8000				;$00A9A3	|
	STA $302D				;$00A9A6	|
	STZ $32A4				;$00A9A9	|
	LDA #$001D				;$00A9AC	|
	LDX #$32A4				;$00A9AF	|
	LDY #$32A6				;$00A9B2	|
	MVN $0000				;$00A9B5	|
	SEP #$20				;$00A9B8	|
	LDA #$00				;$00A9BA	|
	STA $3025				;$00A9BC	|
	STA $302C				;$00A9BF	|
	REP #$20				;$00A9C2	|
	RTS						;$00A9C4	|

label_00A9C5:				;-----------|
	PHD						;$00A9C5	|
	LDA #$3000				;$00A9C6	|
	TCD						;$00A9C9	|
	SEP #$20				;$00A9CA	|
	LDX $21					;$00A9CC	|
	CPX $28					;$00A9CE	|
	BCS label_00A9E0		;$00A9D0	|
	LDA #$E0				;$00A9D2	|
label_00A9D4:				;			|
	STA $000001,X			;$00A9D4	|
	INX						;$00A9D8	|
	INX						;$00A9D9	|
	INX						;$00A9DA	|
	INX						;$00A9DB	|
	CPX $28					;$00A9DC	|
	BCC label_00A9D4		;$00A9DE	|
label_00A9E0:				;			|
	LDA [$23]				;$00A9E0	|
	ORA $26					;$00A9E2	|
	STA [$23]				;$00A9E4	|
	LDA $2D					;$00A9E6	|
	AND #$AA				;$00A9E8	|
	LSR A					;$00A9EA	|
	STA $02					;$00A9EB	|
	LDA $2D					;$00A9ED	|
	AND #$55				;$00A9EF	|
	ASL A					;$00A9F1	|
	ORA $02					;$00A9F2	|
	ORA [$2A]				;$00A9F4	|
	STA [$2A]				;$00A9F6	|
	REP #$20				;$00A9F8	|
	PLD						;$00A9FA	|
	RTS						;$00A9FB	|

label_00A9FC:				;-----------|
	LDX #$0000				;$00A9FC	|
label_00A9FF:				;			|
	LDA $623C,X				;$00A9FF	|
	BMI label_00AA1E		;$00AA02	|
	LDY $65B0,X				;$00AA04	|
	BMI label_00AA1E		;$00AA07	|
	LDA $6436,X				;$00AA09	|
	BMI label_00AA1E		;$00AA0C	|
	ASL A					;$00AA0E	|
	ADC $6536,X				;$00AA0F	|
	STA $14					;$00AA12	|
	STY $16					;$00AA14	|
	LDA [$14]				;$00AA16	|
	TAY						;$00AA18	|
	LDA $16					;$00AA19	|
	JSR ($6630,X)			;$00AA1B	|
label_00AA1E:				;			|
	INX						;$00AA1E	|
	INX						;$00AA1F	|
	CPX #$007A				;$00AA20	|
	BCC label_00A9FF		;$00AA23	|
	RTS						;$00AA25	|

label_00AA26:
	LDY #$FFFF				;$00AA26	|
	LDX #$0000				;$00AA29	|
	TXA						;$00AA2C	|
label_00AA2D:				;			|
	BIT $623C,x				;$00AA2D	|
	BMI label_00AA60		;$00AA30	|
	BIT $65B0,x				;$00AA32	|
	BMI label_00AA60		;$00AA35	|
	BVS label_00AA60		;$00AA37	|
	BIT $6436,x				;$00AA39	|
	BMI label_00AA60		;$00AA3C	|
	CMP $64B6,x				;$00AA3E	|
	BCC label_00AA5C		;$00AA41	|
	BEQ label_00AA47		;$00AA43	|
	BRA label_00AA60		;$00AA45	|

label_00AA47:
	STA $28					;$00AA47	|
	STY $2C					;$00AA49	|
	TYA						;$00AA4B	|
	BMI label_00AA5C		;$00AA4C	|
	LDA $690C,Y				;$00AA4E	|
	CMP $690C,X				;$00AA51	|
	BCC label_00AA5C		;$00AA54	|
	LDA $28					;$00AA56	|
	LDY $2C					;$00AA58	|
	BRA label_00AA60		;$00AA5A	|

label_00AA5C:
	LDA $64B6,X				;$00AA5C	|
	TXY						;$00AA5F	|
label_00AA60:				;			|
	INX						;$00AA60	|
	INX						;$00AA61	|
	CPX #$007A				;$00AA62	|
	BCC label_00AA2D		;$00AA65	|
	TYX						;$00AA67	|
	BMI label_00AA8F		;$00AA68	|
	LDA $6436,X				;$00AA6A	|
	ASL A					;$00AA6D	|
	ADC $6536,X				;$00AA6E	|
	STA $14					;$00AA71	|
	LDA $65B0,X				;$00AA73	|
	STA $16					;$00AA76	|
	ORA #$4000				;$00AA78	|
	STA $65B0,X				;$00AA7B	|
	STX $39					;$00AA7E	|
	LDA $65B0,X				;$00AA80	|
	BMI label_00AA26		;$00AA83	|
	LDA [$14]				;$00AA85	|
	TAY						;$00AA87	|
	LDA $16					;$00AA88	|
	JSR ($6630,X)			;$00AA8A	|
	BRA label_00AA26		;$00AA8D	|

label_00AA8F:
	LDX #$0000				;$00AA8F	|
label_00AA92:				;			|
	LDA $65B0,X				;$00AA92	|
	AND #$BFFF				;$00AA95	|
	STA $65B0,X				;$00AA98	|
	INX						;$00AA9B	|
	INX						;$00AA9C	|
	CPX #$007A				;$00AA9D	|
	BCC label_00AA92		;$00AAA0	|
	RTS						;$00AAA2	|

label_00AAA3:				;-----------|
	JSR label_00AAA7		;$00AAA3	|
	RTL						;$00AAA6	|
label_00AAA7:				;			|
	PHA						;$00AAA7	|
	LDA $6892,X				;$00AAA8	|
	STA $302F				;$00AAAB	|
	LDA $690C,X				;$00AAAE	|
	STA $3031				;$00AAB1	|
	PLA						;$00AAB4	|
	RTS						;$00AAB5	|

label_00AAB6:				;-----------|
	JSR label_00AABA		;$00AAB6	|
	RTL						;$00AAB9	|
label_00AABA:				;			|
	PHA						;$00AABA	|
	LDA $6892,X				;$00AABB	|
	SEC						;$00AABE	|
	SBC $735E				;$00AABF	|
	STA $302F				;$00AAC2	|
	LDA $690C,X				;$00AAC5	|
	SEC						;$00AAC8	|
	SBC $7360				;$00AAC9	|
	STA $3031				;$00AACC	|
	PLA						;$00AACF	|
	RTS						;$00AAD0	|

label_00AAD1:				;-----------|
	JSR label_00AAD5		;$00AAD1	|
	RTL						;$00AAD4	|
label_00AAD5:				;			|
	PHA						;$00AAD5	|
	LDA $6892,X				;$00AAD6	|
	SEC						;$00AAD9	|
	SBC $3039				;$00AADA	|
	STA $302F				;$00AADD	|
	LDA $690C,X				;$00AAE0	|
	SEC						;$00AAE3	|
	SBC $303F				;$00AAE4	|
	STA $3031				;$00AAE7	|
	PLA						;$00AAEA	|
	RTS						;$00AAEB	|

label_00AAEC:				;-----------|
	JSR label_00AAF0		;$00AAEC	|
	RTL						;$00AAEF	|
label_00AAF0:				;			|
	PHA						;$00AAF0	|
	LDA $6892,X				;$00AAF1	|
	SEC						;$00AAF4	|
	SBC $735E				;$00AAF5	|
	STA $302F				;$00AAF8	|
	CMP #$FFC0				;$00AAFB	|
	BCS label_00AB05		;$00AAFE	|
	CMP #$0140				;$00AB00	|
	BCS label_00AB1B		;$00AB03	|
label_00AB05:				;			|
	LDA $690C,X				;$00AB05	|
	SEC						;$00AB08	|
	SBC $7360				;$00AB09	|
	STA $3031				;$00AB0C	|
	CMP #$FFC0				;$00AB0F	|
	BCS label_00AB19		;$00AB12	|
	CMP #$0120				;$00AB14	|
	BCS label_00AB1B		;$00AB17	|
label_00AB19:				;			|
	PLA						;$00AB19	|
	RTS						;$00AB1A	|

label_00AB1B:
	LDA $7A02				;$00AB1B	|
	BNE label_00AB2D		;$00AB1E	|
	JSL label_009142		;$00AB20	|
	LDA $65B0,X				;$00AB24	|
	ORA #$8000				;$00AB27	|
	STA $65B0,X				;$00AB2A	|
label_00AB2D:				;			|
	PLA						;$00AB2D	|
	RTS						;$00AB2E	|

label_00AB2F:				;-----------|
	JSR label_00AB33		;$00AB2F	|
	RTL						;$00AB32	|
label_00AB33:				;			|
	PHA						;$00AB33	|
	LDA $6892,X				;$00AB34	|
	STA $302F				;$00AB37	|
	BPL label_00AB43		;$00AB3A	|
	CMP #$FFC0				;$00AB3C	|
	BCS label_00AB48		;$00AB3F	|
	BRA label_00AB5E		;$00AB41	|

label_00AB43:
	CMP #$0140				;$00AB43	|
	BCS label_00AB5E		;$00AB46	|
label_00AB48:				;			|
	LDA $690C,X				;$00AB48	|
	STA $3031				;$00AB4B	|
	BPL label_00AB57		;$00AB4E	|
	CMP #$FFC0				;$00AB50	|
	BCS label_00AB5C		;$00AB53	|
	BRA label_00AB5E		;$00AB55	|

label_00AB57:
	CMP #$0120				;$00AB57	|
	BCS label_00AB5E		;$00AB5A	|
label_00AB5C:				;			|
	PLA						;$00AB5C	|
	RTS						;$00AB5D	|

label_00AB5E:
	LDA $7A02				;$00AB5E	|
	BNE label_00AB70		;$00AB61	|
	JSL label_009142		;$00AB63	|
	LDA $65B0,X				;$00AB67	|
	ORA #$8000				;$00AB6A	|
	STA $65B0,X				;$00AB6D	|
label_00AB70:				;			|
	PLA						;$00AB70	|
	RTS						;$00AB71	|

label_00AB72:				;-----------|
	JSR label_00AAA7		;$00AB72	|
	JMP label_00AC5B		;$00AB75	|
label_00AB78:				;```````````|
	JSR label_00AABA		;$00AB78	|
	JMP label_00AC5B		;$00AB7B	|
label_00AB7E:				;```````````|
	JSR label_00AAD5		;$00AB7E	|
	JMP label_00AC5B		;$00AB81	|
label_00AB84:				;```````````|
	JSR label_00AAF0		;$00AB84	|
	JMP label_00AC5B		;$00AB87	|
label_00AB8A:				;```````````|
	JSR label_00AB33		;$00AB8A	|
	JMP label_00AC5B		;$00AB8D	|
label_00AB90:				;```````````|
	RTS						;$00AB90	|
label_00AB91:				;```````````|
	JSR label_00AAA7		;$00AB91	|
	JMP label_00AD7D		;$00AB94	|
label_00AB97:				;```````````|
	JSR label_00AABA		;$00AB97	|
	JMP label_00AD7D		;$00AB9A	|
label_00AB9D:				;```````````|
	JSR label_00AAF0		;$00AB9D	|
	JMP label_00AD7D		;$00ABA0	|
label_00ABA3:				;```````````|
	JSR label_00AAA7		;$00ABA3	|
	JMP label_00AC6D		;$00ABA6	|
label_00ABA9:				;```````````|
	JSR label_00AABA		;$00ABA9	|
	JMP label_00AC6D		;$00ABAC	|
label_00ABAF:				;```````````|
	JSR label_00AAF0		;$00ABAF	|
	JMP label_00AC6D		;$00ABB2	|
label_00ABB5:				;```````````|
	JSR label_00AAA7		;$00ABB5	|
	JMP label_00AD8F		;$00ABB8	|
label_00ABBB:				;```````````|
	JSR label_00AABA		;$00ABBB	|
	JMP label_00AD8F		;$00ABBE	|
label_00ABC1:				;```````````|
	JSR label_00AAF0		;$00ABC1	|
	JMP label_00AD8F		;$00ABC4	|
label_00ABC7:				;```````````|
	JSR label_00AAA7		;$00ABC7	|
	JMP label_00AC80		;$00ABCA	|
label_00ABCD:				;```````````|
	JSR label_00AABA		;$00ABCD	|
	JMP label_00AC80		;$00ABD0	|
label_00ABD3:				;```````````|
	JSR label_00AAF0		;$00ABD3	|
	JMP label_00AC80		;$00ABD6	|
label_00ABD9:				;```````````|
	JSR label_00AAA7		;$00ABD9	|
	JMP label_00AC89		;$00ABDC	|
label_00ABDF:				;```````````|
	JSR label_00AABA		;$00ABDF	|
	JMP label_00AC89		;$00ABE2	|
label_00ABE5:				;```````````|
	JSR label_00AAF0		;$00ABE5	|
	JMP label_00AC89		;$00ABE8	|
label_00ABEB:				;```````````|
	JSR label_00AAA7		;$00ABEB	|
	JMP label_00AC92		;$00ABEE	|
label_00ABF1:				;```````````|
	JSR label_00AABA		;$00ABF1	|
	JMP label_00AC92		;$00ABF4	|
label_00ABF7:				;```````````|
	JSR label_00AAF0		;$00ABF7	|
	JMP label_00AC92		;$00ABFA	|
label_00ABFD:				;```````````|
	JSR label_00AAA7		;$00ABFD	|
	JMP label_00AC9B		;$00AC00	|
label_00AC03:				;```````````|
	JSR label_00AABA		;$00AC03	|
	JMP label_00AC9B		;$00AC06	|
label_00AC09:				;```````````|
	JSR label_00AAF0		;$00AC09	|
	JMP label_00AC9B		;$00AC0C	|
label_00AC0F:				;```````````|
	JSR label_00AAA7		;$00AC0F	|
	JMP label_00ACA4		;$00AC12	|
label_00AC15:				;```````````|
	JSR label_00AABA		;$00AC15	|
	JMP label_00ACA4		;$00AC18	|
label_00AC1B:				;```````````|
	JSR label_00AAF0		;$00AC1B	|
	JMP label_00ACA4		;$00AC1E	|
label_00AC21:				;```````````|
	JSR label_00AAA7		;$00AC21	|
	JMP label_00ACAD		;$00AC24	|
label_00AC27:				;```````````|
	JSR label_00AABA		;$00AC27	|
	JMP label_00ACAD		;$00AC2A	|
label_00AC2D:				;```````````|
	JSR label_00AAF0		;$00AC2D	|
	JMP label_00ACAD		;$00AC30	|
label_00AC33:				;```````````|
	JSR label_00AAA7		;$00AC33	|
	JMP label_00ACB6		;$00AC36	|
label_00AC39:				;```````````|
	JSR label_00AABA		;$00AC39	|
	JMP label_00ACB6		;$00AC3C	|
label_00AC3F:				;```````````|
	JSR label_00AAF0		;$00AC3F	|
	JMP label_00ACB6		;$00AC42	|
label_00AC45:				;```````````|
	JSR label_00AAA7		;$00AC45	|
	JMP label_00ACBF		;$00AC48	|
label_00AC4B:				;```````````|
	JSR label_00AABA		;$00AC4B	|
	JMP label_00ACBF		;$00AC4E	|
label_00AC51:				;```````````|
	JSR label_00AAF0		;$00AC51	|
	JMP label_00ACBF		;$00AC54	|

label_00AC57:				;-----------|
	JSR label_00AC5B		;$00AC57	|
	RTL						;$00AC5A	|
label_00AC5B:				;			|
	PHD						;$00AC5B	|
	PEA $3000				;$00AC5C	|\ Change the DB to $30xx.
	PLD						;$00AC5F	|/
	LDX #$FFFF				;$00AC60	|
	STX $02					;$00AC63	|
	STZ $04					;$00AC65	|
	BRA label_00ACCE		;$00AC67	|

label_00AC69:				;-----------|
	JSR label_00AC6D		;$00AC69	|
	RTL						;$00AC6C	|
label_00AC6D:				;			|
	PHD						;$00AC6D	|
	PEA $3000				;$00AC6E	|
	PLD						;$00AC71	|
	LDX $33					;$00AC72	|
	STX $02					;$00AC74	|
	LDX $35					;$00AC76	|
	STX $04					;$00AC78	|
	BRA label_00ACCE		;$00AC7A	|

label_00AC7C:				;-----------|
	JSR label_00AC80		;$00AC7C	|
	RTL						;$00AC7F	|
label_00AC80:				;			|
	LDX #$0000				;$00AC80	|
	BRA label_00ACC2		;$00AC83	|

label_00AC85:				;-----------|
	JSR label_00AC89		;$00AC85	|
	RTL						;$00AC88	|
label_00AC89:				;			|
	LDX #$0200				;$00AC89	|
	BRA label_00ACC2		;$00AC8C	|

label_00AC8E:				;-----------|
	JSR label_00AC92		;$00AC8E	|
	RTL						;$00AC91	|
label_00AC92:				;			|
	LDX #$0400				;$00AC92	|
	BRA label_00ACC2		;$00AC95	|

label_00AC97:				;-----------|
	JSR label_00AC9B		;$00AC97	|
	RTL						;$00AC9A	|
label_00AC9B:				;			|
	LDX #$0600				;$00AC9B	|
	BRA label_00ACC2		;$00AC9E	|

label_00ACA0:				;-----------|
	JSR label_00ACA4		;$00ACA0	|
	RTL						;$00ACA3	|
label_00ACA4:				;			|
	LDX #$0800				;$00ACA4	|
	BRA label_00ACC2		;$00ACA7	|

label_00ACA9:				;-----------|
	JSR label_00ACAD		;$00ACA9	|
	RTL						;$00ACAC	|
label_00ACAD:				;			|
	LDX #$0A00				;$00ACAD	|
	BRA label_00ACC2		;$00ACB0	|

label_00ACB2:				;-----------|
	JSR label_00ACB6		;$00ACB2	|
	RTL						;$00ACB5	|
label_00ACB6:				;			|
	LDX #$0C00				;$00ACB6	|
	BRA label_00ACC2		;$00ACB9	|

label_00ACBB:				;-----------|
	JSR label_00ACBF		;$00ACBB	|
	RTL						;$00ACBE	|
label_00ACBF:				;			|
	LDX #$0E00				;$00ACBF	|
label_00ACC2:				;			|
	PHD						;$00ACC2	|
	PEA $3000				;$00ACC3	|
	PLD						;$00ACC6	|
	STX $04					;$00ACC7	|
	LDX #$F1FF				;$00ACC9	|
	STX $02					;$00ACCC	|
label_00ACCE:				;			|
	LDX $21					;$00ACCE	|
	CPX $28					;$00ACD0	|
	BCC label_00ACD6		;$00ACD2	|
	PLD						;$00ACD4	|
	RTS						;$00ACD5	|

label_00ACD6:
	SEP #$20				;$00ACD6	|
	PHB						;$00ACD8	|
	PHA						;$00ACD9	|
	REP #$20				;$00ACDA	|
	LDA $31					;$00ACDC	|
	ADC $305D				;$00ACDE	|
	DEC A					;$00ACE1	|
	STA $31					;$00ACE2	|
	LDA $2F					;$00ACE4	|
	CLC						;$00ACE6	|
	ADC $305B				;$00ACE7	|
	STA $2F					;$00ACEA	|
	SEP #$20				;$00ACEC	|
	PLB						;$00ACEE	|
label_00ACEF:				;			|
	CLC						;$00ACEF	|
	LDA $0002,Y				;$00ACF0	|
	BPL label_00ACFC		;$00ACF3	|
	ADC $31					;$00ACF5	|
	XBA						;$00ACF7	|
	LDA #$FF				;$00ACF8	|
	BRA label_00AD01		;$00ACFA	|

label_00ACFC:
	ADC $31					;$00ACFC	|
	XBA						;$00ACFE	|
	LDA #$00				;$00ACFF	|
label_00AD01:				;			|
	ADC $32					;$00AD01	|
	XBA						;$00AD03	|
	STA $000001,X			;$00AD04	|
	CMP #$E0				;$00AD08	|
	XBA						;$00AD0A	|
	ADC #$00				;$00AD0B	|
	BNE label_00AD63		;$00AD0D	|
	CLC						;$00AD0F	|
	LDA $0001,Y				;$00AD10	|
	BPL label_00AD1F		;$00AD13	|
	ADC $2F					;$00AD15	|
	STA $000000,X			;$00AD17	|
	LDA #$FF				;$00AD1B	|
	BRA label_00AD27		;$00AD1D	|

label_00AD1F:
	ADC $2F					;$00AD1F	|
	STA $000000,X			;$00AD21	|
	LDA #$00				;$00AD25	|
label_00AD27:				;			|
	ADC $30					;$00AD27	|
	BEQ label_00AD32		;$00AD29	|
	INC A					;$00AD2B	|
	BNE label_00AD63		;$00AD2C	|
	LDA $27					;$00AD2E	|
	TSB $26					;$00AD30	|
label_00AD32:				;			|
	ASL $27					;$00AD32	|
	REP #$20				;$00AD34	|
	LDA $0003,Y				;$00AD36	|
	AND $02					;$00AD39	|
	ORA $04					;$00AD3B	|
	STA $000002,X			;$00AD3D	|
	SEP #$20				;$00AD41	|
	LDA $0000,Y				;$00AD43	|
	LSR A					;$00AD46	|
	BCC label_00AD4D		;$00AD47	|
	LDA $27					;$00AD49	|
	TSB $26					;$00AD4B	|
label_00AD4D:				;			|
	INX						;$00AD4D	|
	INX						;$00AD4E	|
	INX						;$00AD4F	|
	INX						;$00AD50	|
	CPX $28					;$00AD51	|
	BCS label_00AD72		;$00AD53	|
	ASL $27					;$00AD55	|
	BCC label_00AD63		;$00AD57	|
	ROL $27					;$00AD59	|
	LDA $26					;$00AD5B	|
	STA [$23]				;$00AD5D	|
	STZ $26					;$00AD5F	|
	INC $23					;$00AD61	|
label_00AD63:				;			|
	LDA $0000,Y				;$00AD63	|
	AND #$02				;$00AD66	|
	BNE label_00AD72		;$00AD68	|
	INY						;$00AD6A	|
	INY						;$00AD6B	|
	INY						;$00AD6C	|
	INY						;$00AD6D	|
	INY						;$00AD6E	|
	JMP label_00ACEF		;$00AD6F	|

label_00AD72:
	STX $21					;$00AD72	|
	PLB						;$00AD74	|
	PLD						;$00AD75	|
	REP #$20				;$00AD76	|
	RTS						;$00AD78	|

label_00AD79:				;-----------|
	JSR label_00AD7D		;$00AD79	|
	RTL						;$00AD7C	|
label_00AD7D:				;			|
	PHD						;$00AD7D	|
	PEA $3000				;$00AD7E	|
	PLD						;$00AD81	|
	LDX #$FFFF				;$00AD82	|
	STX $02					;$00AD85	|
	STZ $04					;$00AD87	|
	BRA label_00AD9C		;$00AD89	|

label_00AD8B:				;-----------|
	JSR label_00AD8F		;$00AD8B	|
	RTL						;$00AD8E	|
label_00AD8F:				;			|
	PHD						;$00AD8F	|
	PEA $3000				;$00AD90	|
	PLD						;$00AD93	|
	LDX $33					;$00AD94	|
	STX $02					;$00AD96	|
	LDX $35					;$00AD98	|
	STX $04					;$00AD9A	|
label_00AD9C:				;			|
	LDX $28					;$00AD9C	|
	CPX $21					;$00AD9E	|
	BCS label_00ADA4		;$00ADA0	|
	PLD						;$00ADA2	|
	RTS						;$00ADA3	|

label_00ADA4:
	SEP #$20				;$00ADA4	|
	PHB						;$00ADA6	|
	PHA						;$00ADA7	|
	REP #$20				;$00ADA8	|
	LDA $31					;$00ADAA	|
	CLC						;$00ADAC	|
	ADC $305D				;$00ADAD	|
	DEC A					;$00ADB0	|
	STA $31					;$00ADB1	|
	LDA $2F					;$00ADB3	|
	CLC						;$00ADB5	|
	ADC $305B				;$00ADB6	|
	STA $2F					;$00ADB9	|
	SEP #$20				;$00ADBB	|
	PLB						;$00ADBD	|
label_00ADBE:				;			|
	CLC						;$00ADBE	|
	LDA $0002,Y				;$00ADBF	|
	BPL label_00ADCB		;$00ADC2	|
	ADC $31					;$00ADC4	|
	XBA						;$00ADC6	|
	LDA #$FF				;$00ADC7	|
	BRA label_00ADD0		;$00ADC9	|

label_00ADCB:
	ADC $31					;$00ADCB	|
	XBA						;$00ADCD	|
	LDA #$00				;$00ADCE	|
label_00ADD0:				;			|
	ADC $32					;$00ADD0	|
	XBA						;$00ADD2	|
	STA $000000,X			;$00ADD3	|
	CMP #$E0				;$00ADD7	|
	XBA						;$00ADD9	|
	ADC #$00				;$00ADDA	|
	BNE label_00AE40		;$00ADDC	|
	DEX						;$00ADDE	|
	CLC						;$00ADDF	|
	LDA $0001,Y				;$00ADE0	|
	BPL label_00ADEF		;$00ADE3	|
	ADC $2F					;$00ADE5	|
	STA $000000,X			;$00ADE7	|
	LDA #$FF				;$00ADEB	|
	BRA label_00ADF7		;$00ADED	|

label_00ADEF:
	ADC $2F					;$00ADEF	|
	STA $000000,X			;$00ADF1	|
	LDA #$00				;$00ADF5	|
label_00ADF7:				;			|
	INX						;$00ADF7	|
	ADC $30					;$00ADF8	|
	BEQ label_00AE03		;$00ADFA	|
	INC A					;$00ADFC	|
	BNE label_00AE40		;$00ADFD	|
	LDA $2E					;$00ADFF	|
	TSB $2D					;$00AE01	|
label_00AE03:				;			|
	LSR $2E					;$00AE03	|
	REP #$20				;$00AE05	|
	LDA $0003,Y				;$00AE07	|
	AND $02					;$00AE0A	|
	ORA $04					;$00AE0C	|
	STA $000001,X			;$00AE0E	|
	SEP #$20				;$00AE12	|
	LDA $0000,Y				;$00AE14	|
	LSR A					;$00AE17	|
	BCC label_00AE1E		;$00AE18	|
	LDA $2E					;$00AE1A	|
	TSB $2D					;$00AE1C	|
label_00AE1E:				;			|
	DEX						;$00AE1E	|
	DEX						;$00AE1F	|
	DEX						;$00AE20	|
	DEX						;$00AE21	|
	CPX $21					;$00AE22	|
	BCC label_00AE4F		;$00AE24	|
	LSR $2E					;$00AE26	|
	BCC label_00AE40		;$00AE28	|
	ROR $2E					;$00AE2A	|
	LDA $2D					;$00AE2C	|
	AND #$AA				;$00AE2E	|
	LSR A					;$00AE30	|
	STA $06					;$00AE31	|
	LDA $2D					;$00AE33	|
	AND #$55				;$00AE35	|
	ASL A					;$00AE37	|
	ORA $06					;$00AE38	|
	STA [$2A]				;$00AE3A	|
	STZ $2D					;$00AE3C	|
	DEC $2A					;$00AE3E	|
label_00AE40:				;			|
	LDA $0000,Y				;$00AE40	|
	AND #$02				;$00AE43	|
	BNE label_00AE4F		;$00AE45	|
	INY						;$00AE47	|
	INY						;$00AE48	|
	INY						;$00AE49	|
	INY						;$00AE4A	|
	INY						;$00AE4B	|
	JMP label_00ADBE		;$00AE4C	|

label_00AE4F:
	STX $28					;$00AE4F	|
	PLB						;$00AE51	|
	PLD						;$00AE52	|
	REP #$20				;$00AE53	|
	RTS						;$00AE55	|

label_00AE56:				;-----------|
	JSR label_00AE5A		;$00AE56	|
	RTL						;$00AE59	|
label_00AE5A:				;			|
	PHD						;$00AE5A	|
	PEA $3000				;$00AE5B	|
	PLD						;$00AE5E	|
	LDX $21					;$00AE5F	|
	CPX $28					;$00AE61	|
	BCC label_00AE67		;$00AE63	|
	PLD						;$00AE65	|
	RTS						;$00AE66	|

label_00AE67:
	SEP #$20				;$00AE67	|
	PHB						;$00AE69	|
	PHA						;$00AE6A	|
	REP #$20				;$00AE6B	|
	LDA $31					;$00AE6D	|
	ADC $305D				;$00AE6F	|
	DEC A					;$00AE72	|
	STA $31					;$00AE73	|
	LDA $2F					;$00AE75	|
	CLC						;$00AE77	|
	ADC $305B				;$00AE78	|
	STA $2F					;$00AE7B	|
	SEP #$20				;$00AE7D	|
	PLB						;$00AE7F	|
label_00AE80:				;			|
	CLC						;$00AE80	|
	LDA $0002,Y				;$00AE81	|
	BPL label_00AE8D		;$00AE84	|
	ADC $31					;$00AE86	|
	XBA						;$00AE88	|
	LDA #$FF				;$00AE89	|
	BRA label_00AE92		;$00AE8B	|

label_00AE8D:
	ADC $31					;$00AE8D	|
	XBA						;$00AE8F	|
	LDA #$00				;$00AE90	|
label_00AE92:				;			|
	ADC $32					;$00AE92	|
	XBA						;$00AE94	|
	STA $000001,X			;$00AE95	|
	CMP #$E0				;$00AE99	|
	XBA						;$00AE9B	|
	ADC #$00				;$00AE9C	|
	BNE label_00AEF4		;$00AE9E	|
	LDA $0001,Y				;$00AEA0	|
	BPL label_00AEB0		;$00AEA3	|
	CLC						;$00AEA5	|
	ADC $2F					;$00AEA6	|
	STA $000000,X			;$00AEA8	|
	LDA #$FF				;$00AEAC	|
	BRA label_00AEB9		;$00AEAE	|

label_00AEB0:
	CLC						;$00AEB0	|
	ADC $2F					;$00AEB1	|
	STA $000000,X			;$00AEB3	|
	LDA #$00				;$00AEB7	|
label_00AEB9:				;			|
	ADC $30					;$00AEB9	|
	BEQ label_00AEC4		;$00AEBB	|
	INC A					;$00AEBD	|
	BNE label_00AEF4		;$00AEBE	|
	LDA $27					;$00AEC0	|
	TSB $26					;$00AEC2	|
label_00AEC4:				;			|
	ASL $27					;$00AEC4	|
	REP #$20				;$00AEC6	|
	LDA $0003,Y				;$00AEC8	|
	CLC						;$00AECB	|
	ADC $33					;$00AECC	|
	STA $000002,X			;$00AECE	|
	SEP #$20				;$00AED2	|
	LDA $0000,Y				;$00AED4	|
	LSR A					;$00AED7	|
	BCC label_00AEDE		;$00AED8	|
	LDA $27					;$00AEDA	|
	TSB $26					;$00AEDC	|
label_00AEDE:				;			|
	INX						;$00AEDE	|
	INX						;$00AEDF	|
	INX						;$00AEE0	|
	INX						;$00AEE1	|
	CPX $28					;$00AEE2	|
	BCS label_00AF03		;$00AEE4	|
	ASL $27					;$00AEE6	|
	BCC label_00AEF4		;$00AEE8	|
	ROL $27					;$00AEEA	|
	LDA $26					;$00AEEC	|
	STA [$23]				;$00AEEE	|
	STZ $26					;$00AEF0	|
	INC $23					;$00AEF2	|
label_00AEF4:				;			|
	LDA $0000,Y				;$00AEF4	|
	AND #$02				;$00AEF7	|
	BNE label_00AF03		;$00AEF9	|
	INY						;$00AEFB	|
	INY						;$00AEFC	|
	INY						;$00AEFD	|
	INY						;$00AEFE	|
	INY						;$00AEFF	|
	JMP label_00AE80		;$00AF00	|

label_00AF03:
	STX $21					;$00AF03	|
	PLB						;$00AF05	|
	PLD						;$00AF06	|
	REP #$20				;$00AF07	|
	RTS						;$00AF09	|

label_00AF0A:				;-----------|
	JSR label_00AF0E		;$00AF0A	|
	RTL						;$00AF0D	|
label_00AF0E:				;			|
	PHD						;$00AF0E	|
	PEA $3000				;$00AF0F	|
	PLD						;$00AF12	|
	LDX $21					;$00AF13	|
	CPX $28					;$00AF15	|
	BCC label_00AF1B		;$00AF17	|
	PLD						;$00AF19	|
	RTS						;$00AF1A	|

label_00AF1B:
	SEP #$20				;$00AF1B	|
	PHB						;$00AF1D	|
	PHA						;$00AF1E	|
	REP #$20				;$00AF1F	|
	LDA $31					;$00AF21	|
	ADC $305D				;$00AF23	|
	DEC A					;$00AF26	|
	STA $31					;$00AF27	|
	LDA $2F					;$00AF29	|
	CLC						;$00AF2B	|
	ADC $305B				;$00AF2C	|
	STA $2F					;$00AF2F	|
	SEP #$20				;$00AF31	|
	PLB						;$00AF33	|
label_00AF34:				;			|
	CLC						;$00AF34	|
	LDA $0002,Y				;$00AF35	|
	BPL label_00AF41		;$00AF38	|
	ADC $31					;$00AF3A	|
	XBA						;$00AF3C	|
	LDA #$FF				;$00AF3D	|
	BRA label_00AF46		;$00AF3F	|

label_00AF41:
	ADC $31					;$00AF41	|
	XBA						;$00AF43	|
	LDA #$00				;$00AF44	|
label_00AF46:				;			|
	ADC $32					;$00AF46	|
	XBA						;$00AF48	|
	STA $000001,X			;$00AF49	|
	CMP #$E0				;$00AF4D	|
	XBA						;$00AF4F	|
	ADC #$00				;$00AF50	|
	BNE label_00AFAA		;$00AF52	|
	LDA $0001,Y				;$00AF54	|
	BPL label_00AF64		;$00AF57	|
	CLC						;$00AF59	|
	ADC $2F					;$00AF5A	|
	STA $000000,X			;$00AF5C	|
	LDA #$FF				;$00AF60	|
	BRA label_00AF6D		;$00AF62	|

label_00AF64:
	CLC						;$00AF64	|
	ADC $2F					;$00AF65	|
	STA $000000,X			;$00AF67	|
	LDA #$00				;$00AF6B	|
label_00AF6D:				;			|
	ADC $30					;$00AF6D	|
	BEQ label_00AF78		;$00AF6F	|
	INC A					;$00AF71	|
	BNE label_00AFAA		;$00AF72	|
	LDA $27					;$00AF74	|
	TSB $26					;$00AF76	|
label_00AF78:				;			|
	ASL $27					;$00AF78	|
	REP #$20				;$00AF7A	|
	LDA $0003,Y				;$00AF7C	|
	AND $33					;$00AF7F	|
	CLC						;$00AF81	|
	ADC $35					;$00AF82	|
	STA $000002,X			;$00AF84	|
	SEP #$20				;$00AF88	|
	LDA $0000,Y				;$00AF8A	|
	LSR A					;$00AF8D	|
	BCC label_00AF94		;$00AF8E	|
	LDA $27					;$00AF90	|
	TSB $26					;$00AF92	|
label_00AF94:				;			|
	INX						;$00AF94	|
	INX						;$00AF95	|
	INX						;$00AF96	|
	INX						;$00AF97	|
	CPX $28					;$00AF98	|
	BCS label_00AFB9		;$00AF9A	|
	ASL $27					;$00AF9C	|
	BCC label_00AFAA		;$00AF9E	|
	ROL $27					;$00AFA0	|
	LDA $26					;$00AFA2	|
	STA [$23]				;$00AFA4	|
	STZ $26					;$00AFA6	|
	INC $23					;$00AFA8	|
label_00AFAA:				;			|
	LDA $0000,Y				;$00AFAA	|
	AND #$02				;$00AFAD	|
	BNE label_00AFB9		;$00AFAF	|
	INY						;$00AFB1	|
	INY						;$00AFB2	|
	INY						;$00AFB3	|
	INY						;$00AFB4	|
	INY						;$00AFB5	|
	JMP label_00AF34		;$00AFB6	|

label_00AFB9:
	STX $21					;$00AFB9	|
	PLB						;$00AFBB	|
	PLD						;$00AFBC	|
	REP #$20				;$00AFBD	|
	RTS						;$00AFBF	|

label_00AFC0:				;-----------|
	JSR label_00AFC4		;$00AFC0	|
	RTL						;$00AFC3	|
label_00AFC4:				;			|
	JSR label_00AAA7		;$00AFC4	|
label_00AFC7:				;			|
	LDA #$96FC				;$00AFC7	|
	STA $14					;$00AFCA	|
	LDA #$00C7				;$00AFCC	|
	STA $16					;$00AFCF	|
	LDA $6436,X				;$00AFD1	|
	ASL A					;$00AFD4	|
	TAY						;$00AFD5	|
	LDA [$14],Y				;$00AFD6	|
	TAY						;$00AFD8	|
	LDA #$00C5				;$00AFD9	|
	JMP label_00AC5B		;$00AFDC	|

label_00AFDF:				;-----------|
	JSR label_00AFE3		;$00AFDF	|
	RTL						;$00AFE2	|
label_00AFE3:				;			|
	JSR label_00AABA		;$00AFE3	|
	LDX #$0002				;$00AFE6	|
	JSR label_00AFC7		;$00AFE9	|
	JSL $059A3E				;$00AFEC	|
	RTS						;$00AFF0	|

label_00AFF1:				;-----------|
	JSR label_00AFF5		;$00AFF1	|
	RTL						;$00AFF4	|
label_00AFF5:				;			|
	LDX #$0002				;$00AFF5	|
	JSR label_00AFC4		;$00AFF8	|
	JSL $059A3E				;$00AFFB	|
	RTS						;$00AFFF	|

label_00B000:				;-----------|
	JSR label_00B004		;$00B000	|
	RTL						;$00B003	|
label_00B004:				;			|
	LDA $740B				;$00B004	|
	BEQ label_00B00C		;$00B007	|
	JMP label_00B0FA		;$00B009	|

label_00B00C:
	LDY $39					;$00B00C	|
	LDA $6436,Y				;$00B00E	|
	LDX $36FA,Y				;$00B011	|
	BPL label_00B019		;$00B014	|
	EOR #$0001				;$00B016	|
label_00B019:				;			|
	ASL A					;$00B019	|
	PHA						;$00B01A	|
	LDX $749D,Y				;$00B01B	|
	BEQ label_00B029		;$00B01E	|
	ASL A					;$00B020	|
	TAY						;$00B021	|
	LDA [$8A],Y				;$00B022	|
	BMI label_00B02D		;$00B024	|
	JSR label_00B040		;$00B026	|
label_00B029:				;			|
	PLX						;$00B029	|
	JMP label_00B0A2		;$00B02A	|

label_00B02D:
	CMP #$FFFF				;$00B02D	|
	BEQ label_00B029		;$00B030	|
	PLX						;$00B032	|
	PHA						;$00B033	|
	PHY						;$00B034	|
	JSR label_00B0A2		;$00B035	|
	PLY						;$00B038	|
	PLA						;$00B039	|
	AND #$7FFF				;$00B03A	|
	JMP label_00B040		;$00B03D	|

label_00B040:
	TAX						;$00B040	|
	LSR A					;$00B041	|
	AND #$FFFE				;$00B042	|
	PHA						;$00B045	|
	PHX						;$00B046	|
	INY						;$00B047	|
	INY						;$00B048	|
	LDA [$8A],Y				;$00B049	|
	PHA						;$00B04B	|
	LDX $39					;$00B04C	|
	AND #$00FF				;$00B04E	|
	CMP #$0080				;$00B051	|
	BCC label_00B059		;$00B054	|
	ORA #$FF00				;$00B056	|
label_00B059:				;			|
	CLC						;$00B059	|
	ADC $6892,X				;$00B05A	|
	CLC						;$00B05D	|
	ADC $76A7,X				;$00B05E	|
	SEC						;$00B061	|
	SBC $7362				;$00B062	|
	STA $302F				;$00B065	|
	PLA						;$00B068	|
	AND #$FF00				;$00B069	|
	BPL label_00B071		;$00B06C	|
	ORA #$00FF				;$00B06E	|
label_00B071:				;			|
	XBA						;$00B071	|
	CLC						;$00B072	|
	ADC $690C,X				;$00B073	|
	CLC						;$00B076	|
	ADC $76AF,X				;$00B077	|
	CLC						;$00B07A	|
	ADC $7673,X				;$00B07B	|
	SEC						;$00B07E	|
	SBC $7364				;$00B07F	|
	STA $3031				;$00B082	|
	PLY						;$00B085	|
	LDA [$84],Y				;$00B086	|
	TAY						;$00B088	|
	LDA #$00C8				;$00B089	|
	JSR label_00AC5B		;$00B08C	|
	PLY						;$00B08F	|
	JSL $059ADC				;$00B090	|
	RTS						;$00B094	|

;;;
label_00B095:				;-----------|
	JSR label_00B099		;$00B095	|
	RTL						;$00B098	|
label_00B099:				;			|
	JSR label_00AABA		;$00B099	|
	LDA #$00C8				;$00B09C	|
	JMP label_00AC5B		;$00B09F	|

label_00B0A2:				;-----------|
	TXY						;$00B0A2	|
	LDX $39					;$00B0A3	|
	LDA $6892,X				;$00B0A5	|
	CLC						;$00B0A8	|
	ADC $76A7,X				;$00B0A9	|
	SEC						;$00B0AC	|
	SBC $7362				;$00B0AD	|
	STA $302F				;$00B0B0	|
	LDA $690C,X				;$00B0B3	|
	CLC						;$00B0B6	|
	ADC $76AF,X				;$00B0B7	|
	CLC						;$00B0BA	|
	ADC $7673,X				;$00B0BB	|
	SEC						;$00B0BE	|
	SBC $7364				;$00B0BF	|
	STA $3031				;$00B0C2	|
	LDA $749D,X				;$00B0C5	|
	CMP #$0012				;$00B0C8	|
	BEQ label_00B0DD		;$00B0CB	|
	CMP #$0013				;$00B0CD	|
	BEQ label_00B0DD		;$00B0D0	|
	CPY #$029C				;$00B0D2	|
	BCC label_00B0E2		;$00B0D5	|
	TYA						;$00B0D7	|
	SEC						;$00B0D8	|
	SBC #$029C				;$00B0D9	|
	TAY						;$00B0DC	|
label_00B0DD:				;			|
	LDA [$78],Y				;$00B0DD	|
	TAY						;$00B0DF	|
	BRA label_00B0EF		;$00B0E0	|

label_00B0E2:
	LDA #$96FC				;$00B0E2	|
	STA $14					;$00B0E5	|
	LDA #$00C7				;$00B0E7	|
	STA $16					;$00B0EA	|
	LDA [$14],Y				;$00B0EC	|
	TAY						;$00B0EE	|
label_00B0EF:				;			|
	LDA #$00C5				;$00B0EF	|
	JSR label_00AC5B		;$00B0F2	|
	JSL $059A51				;$00B0F5	|
	RTS						;$00B0F9	|

label_00B0FA:				;-----------|
	LDA $6438				;$00B0FA	|
	ASL A					;$00B0FD	|
	PHA						;$00B0FE	|
	LDY $749F				;$00B0FF	|
	BEQ label_00B10C		;$00B102	|
	LDA $763F				;$00B104	|
	BNE label_00B110		;$00B107	|
	JSR label_00B117		;$00B109	|
label_00B10C:				;			|
	PLX						;$00B10C	|
	JMP label_00B14E		;$00B10D	|

label_00B110:
	PLX						;$00B110	|
	JSR label_00B14E		;$00B111	|
	JMP label_00B117		;$00B114	|

label_00B117:
	LDA $7639				;$00B117	|
	CLC						;$00B11A	|
	ADC $6894				;$00B11B	|
	SEC						;$00B11E	|
	SBC $7362				;$00B11F	|
	STA $302F				;$00B122	|
	LDA $763B				;$00B125	|
	CLC						;$00B128	|
	ADC $690E				;$00B129	|
	SEC						;$00B12C	|
	SBC $7364				;$00B12D	|
	STA $3031				;$00B130	|
	LDY $763D				;$00B133	|
	BMI label_00B14D		;$00B136	|
	LDA [$84],Y				;$00B138	|
	TAY						;$00B13A	|
	LDA #$00C8				;$00B13B	|
	JSR label_00AC5B		;$00B13E	|
	LDA $763D				;$00B141	|
	LSR A					;$00B144	|
	AND #$FFFE				;$00B145	|
	TAY						;$00B148	|
	JSL $059ADC				;$00B149	|
label_00B14D:				;			|
	RTS						;$00B14D	|

label_00B14E:
	TXY						;$00B14E	|
	LDX $39					;$00B14F	|
	LDA $6892,X				;$00B151	|
	SEC						;$00B154	|
	SBC $7362				;$00B155	|
	STA $302F				;$00B158	|
	LDA $690C,X				;$00B15B	|
	SEC						;$00B15E	|
	SBC $7364				;$00B15F	|
	STA $3031				;$00B162	|
	LDA $749D,X				;$00B165	|
	CMP #$0012				;$00B168	|
	BEQ label_00B17D		;$00B16B	|
	CMP #$0013				;$00B16D	|
	BEQ label_00B17D		;$00B170	|
	CPY #$029C				;$00B172	|
	BCC label_00B182		;$00B175	|
	TYA						;$00B177	|
	SEC						;$00B178	|
	SBC #$029C				;$00B179	|
	TAY						;$00B17C	|
label_00B17D:				;			|
	LDA [$78],Y				;$00B17D	|
	TAY						;$00B17F	|
	BRA label_00B18F		;$00B180	|

label_00B182:
	LDA #$96FC				;$00B182	|
	STA $14					;$00B185	|
	LDA #$00C7				;$00B187	|
	STA $16					;$00B18A	|
	LDA [$14],Y				;$00B18C	|
	TAY						;$00B18E	|
label_00B18F:				;			|
	LDA #$00C5				;$00B18F	|
	JSR label_00AC5B		;$00B192	|
	JSL $059A51				;$00B195	|
	RTS						;$00B199	|

label_00B19A:				;-----------|
	JSR label_00B19E		;$00B19A	|
	RTL						;$00B19D	|
label_00B19E:				;			|
	JSR label_00B1D7		;$00B19E	|
	LDX $39					;$00B1A1	|
	LDA $749D,X				;$00B1A3	|
	BMI label_00B1D6		;$00B1A6	|
	LDA $6892,X				;$00B1A8	|
	CLC						;$00B1AB	|
	ADC $76A7,X				;$00B1AC	|
	SEC						;$00B1AF	|
	SBC $7362				;$00B1B0	|
	STA $302F				;$00B1B3	|
	LDA $690C,X				;$00B1B6	|
	CLC						;$00B1B9	|
	ADC $76AF,X				;$00B1BA	|
	CLC						;$00B1BD	|
	ADC $7673,X				;$00B1BE	|
	SEC						;$00B1C1	|
	SBC $7364				;$00B1C2	|
	STA $3031				;$00B1C5	|
	LDA $6436,X				;$00B1C8	|
	JSR label_00B23C		;$00B1CB	|
	JSL $059B06				;$00B1CE	|
	JSL $059AF8				;$00B1D2	|
label_00B1D6:				;			|
	RTS						;$00B1D6	|

label_00B1D7:
	LDA $757F				;$00B1D7	|
	BEQ label_00B23B		;$00B1DA	|
	DEC $757F				;$00B1DC	|
	LDA $7581				;$00B1DF	|
	DEC A					;$00B1E2	|
	BPL label_00B1E8		;$00B1E3	|
	LDA #$000A				;$00B1E5	|
label_00B1E8:				;			|
	STA $7581				;$00B1E8	|
	CMP #$0007				;$00B1EB	|
	BCS label_00B23B		;$00B1EE	|
	LDY $39					;$00B1F0	|
	LDA $749D,Y				;$00B1F2	|
	BMI label_00B23B		;$00B1F5	|
	ASL A					;$00B1F7	|
	TAX						;$00B1F8	|
	LDA $6892,Y				;$00B1F9	|
	CLC						;$00B1FC	|
	ADC $76A7,Y				;$00B1FD	|
	SEC						;$00B200	|
	SBC $7362				;$00B201	|
	STA $302F				;$00B204	|
	LDA $690C,Y				;$00B207	|
	CLC						;$00B20A	|
	ADC $76AF,Y				;$00B20B	|
	CLC						;$00B20E	|
	ADC $7673,Y				;$00B20F	|
	CLC						;$00B212	|
	ADC $C4E335,X			;$00B213	|
	SEC						;$00B217	|
	SBC $7364				;$00B218	|
	STA $3031				;$00B21B	|
	LDY #$A2EC				;$00B21E	|
	LDA $7A97				;$00B221	|
	BEQ label_00B22D		;$00B224	|
	BPL label_00B235		;$00B226	|
	LDY #$A2D8				;$00B228	|
	BRA label_00B235		;$00B22B	|

label_00B22D:
	LDA $7AC1				;$00B22D	|
	BEQ label_00B235		;$00B230	|
	LDY #$A2D8				;$00B232	|
label_00B235:				;			|
	LDA #$00C5				;$00B235	|
	JSR label_00AC5B		;$00B238	|
label_00B23B:				;			|
	RTS						;$00B23B	|

label_00B23C:
	LDY $36FA,X				;$00B23C	|
	BPL label_00B244		;$00B23F	|
	EOR #$0001				;$00B241	|
label_00B244:				;			|
	STA $00					;$00B244	|
	ASL A					;$00B246	|
	TAY						;$00B247	|
	LDA $6536,X				;$00B248	|
	STA $14					;$00B24B	|
	LDA $65B0,X				;$00B24D	|
	STA $16					;$00B250	|
	LDA [$14],Y				;$00B252	|
	PHA						;$00B254	|
	LDA #$00C5				;$00B255	|
	CPY #$0044				;$00B258	|
	BCC label_00B26B		;$00B25B	|
	LDA $749D,X				;$00B25D	|
	CMP #$0011				;$00B260	|
	LDA #$00C6				;$00B263	|
	BCC label_00B26B		;$00B266	|
	LDA #$00C7				;$00B268	|
label_00B26B:				;			|
	PHA						;$00B26B	|
	LDA $00					;$00B26C	|
	SEC						;$00B26E	|
	SBC $755D,X				;$00B26F	|
	BCS label_00B28C		;$00B272	|
	LDA $00					;$00B274	|
	CMP #$001C				;$00B276	|
	BCS label_00B2AA		;$00B279	|
	LDA #$F1FF				;$00B27B	|
	STA $3033				;$00B27E	|
	LDA #$0420				;$00B281	|
	STA $3035				;$00B284	|
	PLA						;$00B287	|
	PLY						;$00B288	|
	JMP label_00AC6D		;$00B289	|

label_00B28C:
	ASL A					;$00B28C	|
	TAY						;$00B28D	|
	LDA #$0020				;$00B28E	|
	STA $3033				;$00B291	|
	LDA $749D,X				;$00B294	|
	CMP #$0013				;$00B297	|
	BEQ label_00B2AF		;$00B29A	|
	LDA [$87],Y				;$00B29C	|
	BEQ label_00B2AA		;$00B29E	|
	TAY						;$00B2A0	|
	LDA #$00C8				;$00B2A1	|
	JSR label_00AE5A		;$00B2A4	|
	INC $3031				;$00B2A7	|
label_00B2AA:				;			|
	PLA						;$00B2AA	|
	PLY						;$00B2AB	|
	JMP label_00AC5B		;$00B2AC	|

label_00B2AF:
	LDA $302F				;$00B2AF	|
	PHA						;$00B2B2	|
	LDA $3031				;$00B2B3	|
	PHA						;$00B2B6	|
	LDA $00					;$00B2B7	|
	ASL A					;$00B2B9	|
	ASL A					;$00B2BA	|
	TAX						;$00B2BB	|
	LDA $C4D8E0,X			;$00B2BC	|
	AND #$00FF				;$00B2C0	|
	CMP #$0080				;$00B2C3	|
	BCC label_00B2CB		;$00B2C6	|
	ORA #$FF00				;$00B2C8	|
label_00B2CB:				;			|
	CLC						;$00B2CB	|
	ADC $302F				;$00B2CC	|
	STA $302F				;$00B2CF	|
	LDA $C4D8E1,X			;$00B2D2	|
	AND #$00FF				;$00B2D6	|
	CMP #$0080				;$00B2D9	|
	BCC label_00B2E1		;$00B2DC	|
	ORA #$FF00				;$00B2DE	|
label_00B2E1:				;			|
	CLC						;$00B2E1	|
	ADC $3031				;$00B2E2	|
	STA $3031				;$00B2E5	|
	LDA $C4D8DE,X			;$00B2E8	|
	BMI label_00B2FD		;$00B2EC	|
	AND #$7FFF				;$00B2EE	|
	TAX						;$00B2F1	|
	LDA $C5F938,X			;$00B2F2	|
	TAY						;$00B2F6	|
	LDA #$00C8				;$00B2F7	|
	JSR label_00AE5A		;$00B2FA	|
label_00B2FD:				;			|
	PLA						;$00B2FD	|
	STA $3031				;$00B2FE	|
	PLA						;$00B301	|
	STA $302F				;$00B302	|
	PLA						;$00B305	|
	PLY						;$00B306	|
	JMP label_00AC5B		;$00B307	|

label_00B30A:				;-----------|
	JSR label_00B30E		;$00B30A	|
	RTL						;$00B30D	|
label_00B30E:				;			|
	PHA						;$00B30E	|
	PHY						;$00B30F	|
	LDA #$FFFF				;$00B310	|
	STA $3033				;$00B313	|
	LDA #$0008				;$00B316	|
	STA $3035				;$00B319	|
	PLY						;$00B31C	|
	PLA						;$00B31D	|
	JMP label_00AC6D		;$00B31E	|

label_00B321:				;-----------|
	JSR label_00B325		;$00B321	|
	RTL						;$00B324	|
label_00B325:				;			|
	LDX $39					;$00B325	|
	JSR label_00AAA7		;$00B327	|
	LDA #$FFFF				;$00B32A	|
	STA $3033				;$00B32D	|
	STZ $3035				;$00B330	|
	LDA $6436,X				;$00B333	|
	LDY $6DD0,X				;$00B336	|
	BPL label_00B33E		;$00B339	|
	EOR #$0001				;$00B33B	|
label_00B33E:				;			|
	ASL A					;$00B33E	|
	TAY						;$00B33F	|
	LDA $6536,X				;$00B340	|
	STA $14					;$00B343	|
	LDA $65B0,X				;$00B345	|
	STA $16					;$00B348	|
	LDA [$14],Y				;$00B34A	|
	TAY						;$00B34C	|
	LDA $16					;$00B34D	|
	JMP label_00AF0E		;$00B34F	|

label_00B352:				;-----------|
	JSR label_00B356		;$00B352	|
	RTL						;$00B355	|
label_00B356:				;			|
	LDX $39					;$00B356	|
	JSR label_00AAA7		;$00B358	|
	LDA #$F1FF				;$00B35B	|
	STA $3033				;$00B35E	|
	LDA #$0A60				;$00B361	|
	STA $3035				;$00B364	|
	LDA $6436,X				;$00B367	|
	LDY $6DD0,X				;$00B36A	|
	BPL label_00B372		;$00B36D	|
	EOR #$0001				;$00B36F	|
label_00B372:				;			|
	ASL A					;$00B372	|
	TAY						;$00B373	|
	LDA $6536,X				;$00B374	|
	STA $14					;$00B377	|
	LDA $65B0,X				;$00B379	|
	STA $16					;$00B37C	|
	LDA [$14],Y				;$00B37E	|
	TAY						;$00B380	|
	LDA $16					;$00B381	|
	JMP label_00AF0E		;$00B383	|

label_00B386:				;-----------|
	JSR label_00B38A		;$00B386	|
	RTL						;$00B389	|
label_00B38A:				;			|
	LDX $39					;$00B38A	|
	JSR label_00AAA7		;$00B38C	|
	PHA						;$00B38F	|
	PHY						;$00B390	|
	LDA #$F1FF				;$00B391	|
	STA $3033				;$00B394	|
	LDA #$0E00				;$00B397	|
	STA $3035				;$00B39A	|
	PLY						;$00B39D	|
	PLA						;$00B39E	|
	JMP label_00AC6D		;$00B39F	|

label_00B3A2:				;-----------|
	JSR label_00B3A6		;$00B3A2	|
	RTL						;$00B3A5	|
label_00B3A6:				;			|
	LDA $6892,X				;$00B3A6	|
	SEC						;$00B3A9	|
	SBC $735E				;$00B3AA	|
	STA $302F				;$00B3AD	|
	LDA $690C,X				;$00B3B0	|
	SEC						;$00B3B3	|
	SBC $7360				;$00B3B4	|
	STA $3031				;$00B3B7	|
	LDA $6436,X				;$00B3BA	|
	BMI label_00B3E4		;$00B3BD	|
	ASL A					;$00B3BF	|
	TAY						;$00B3C0	|
	CPY #$029C				;$00B3C1	|
	BCC label_00B3D1		;$00B3C4	|
	TYA						;$00B3C6	|
	SEC						;$00B3C7	|
	SBC #$029C				;$00B3C8	|
	TAY						;$00B3CB	|
	LDA [$78],Y				;$00B3CC	|
	TAY						;$00B3CE	|
	BRA label_00B3DE		;$00B3CF	|

label_00B3D1:
	LDA #$96FC				;$00B3D1	|
	STA $14					;$00B3D4	|
	LDA #$00C7				;$00B3D6	|
	STA $16					;$00B3D9	|
	LDA [$14],Y				;$00B3DB	|
	TAY						;$00B3DD	|
label_00B3DE:				;			|
	LDA #$00C5				;$00B3DE	|
	JSR label_00AC5B		;$00B3E1	|
label_00B3E4:				;			|
	RTS						;$00B3E4	|

label_00B3E5:				;-----------|
	JSR label_00B3E9		;$00B3E5	|
	RTL						;$00B3E8	|
label_00B3E9:				;			|
	LDY $39					;$00B3E9	|
	LDA $6436,Y				;$00B3EB	|
	BMI label_00B3FD		;$00B3EE	|
	LDX $6E4A,Y				;$00B3F0	|
	LDA $65B0,X				;$00B3F3	|
	BMI label_00B3FD		;$00B3F6	|
	LDA $6436,X				;$00B3F8	|
	BPL label_00B3FE		;$00B3FB	|
label_00B3FD:				;			|
	RTS						;$00B3FD	|

label_00B3FE:
	LDY $36FA,X				;$00B3FE	|
	BPL label_00B406		;$00B401	|
	EOR #$0001				;$00B403	|
label_00B406:				;			|
	ASL A					;$00B406	|
	PHA						;$00B407	|
	LDY $749D,X				;$00B408	|
	BEQ label_00B429		;$00B40B	|
	ASL A					;$00B40D	|
	TAY						;$00B40E	|
	LDA [$8A],Y				;$00B40F	|
	BPL label_00B426		;$00B411	|
	CMP #$FFFF				;$00B413	|
	BEQ label_00B429		;$00B416	|
	PLX						;$00B418	|
	PHA						;$00B419	|
	PHY						;$00B41A	|
	JSR label_00B48B		;$00B41B	|
	PLY						;$00B41E	|
	PLA						;$00B41F	|
	AND #$7FFF				;$00B420	|
	JMP label_00B44E		;$00B423	|

label_00B426:
	JSR label_00B44E		;$00B426	|
label_00B429:				;			|
	PLX						;$00B429	|
	JMP label_00B48B		;$00B42A	|

label_00B42D:				;-----------|
	JSR label_00B431		;$00B42D	|
	RTL						;$00B430	|
label_00B431:				;			|
	LDY $39					;$00B431	|
	LDA $6436,Y				;$00B433	|
	BMI label_00B440		;$00B436	|
	LDX $6E4A,Y				;$00B438	|
	LDA $6436,X				;$00B43B	|
	BPL label_00B441		;$00B43E	|
label_00B440:				;			|
	RTS						;$00B440	|

label_00B441:
	LDY $36FA,X				;$00B441	|
	BPL label_00B449		;$00B444	|
	EOR #$0001				;$00B446	|
label_00B449:				;			|
	ASL A					;$00B449	|
	TAX						;$00B44A	|
	JMP label_00B48B		;$00B44B	|

label_00B44E:
	PHA						;$00B44E	|
	LDX $39					;$00B44F	|
	INY						;$00B451	|
	INY						;$00B452	|
	LDA [$8A],Y				;$00B453	|
	PHA						;$00B455	|
	AND #$00FF				;$00B456	|
	CMP #$0080				;$00B459	|
	BCC label_00B461		;$00B45C	|
	ORA #$FF00				;$00B45E	|
label_00B461:				;			|
	CLC						;$00B461	|
	ADC $6892,X				;$00B462	|
	SEC						;$00B465	|
	SBC $7362				;$00B466	|
	STA $302F				;$00B469	|
	PLA						;$00B46C	|
	AND #$FF00				;$00B46D	|
	BPL label_00B475		;$00B470	|
	ORA #$00FF				;$00B472	|
label_00B475:				;			|
	XBA						;$00B475	|
	CLC						;$00B476	|
	ADC $690C,X				;$00B477	|
	SEC						;$00B47A	|
	SBC $7364				;$00B47B	|
	STA $3031				;$00B47E	|
	PLY						;$00B481	|
	LDA [$84],Y				;$00B482	|
	TAY						;$00B484	|
	LDA #$00C8				;$00B485	|
	JMP label_00AC5B		;$00B488	|

label_00B48B:
	TXY						;$00B48B	|
	LDX $39					;$00B48C	|
	LDA $6892,X				;$00B48E	|
	SEC						;$00B491	|
	SBC $7362				;$00B492	|
	STA $302F				;$00B495	|
	LDA $690C,X				;$00B498	|
	SEC						;$00B49B	|
	SBC $7364				;$00B49C	|
	STA $3031				;$00B49F	|
	CPY #$029C				;$00B4A2	|
	BCC label_00B4B2		;$00B4A5	|
	TYA						;$00B4A7	|
	SEC						;$00B4A8	|
	SBC #$029C				;$00B4A9	|
	TAY						;$00B4AC	|
	LDA [$78],Y				;$00B4AD	|
	TAY						;$00B4AF	|
	BRA label_00B4BF		;$00B4B0	|

label_00B4B2:
	LDA #$96FC				;$00B4B2	|
	STA $14					;$00B4B5	|
	LDA #$00C7				;$00B4B7	|
	STA $16					;$00B4BA	|
	LDA [$14],Y				;$00B4BC	|
	TAY						;$00B4BE	|
label_00B4BF:				;			|
	LDA #$00C5				;$00B4BF	|
	JSR label_00AC5B		;$00B4C2	|
	RTS						;$00B4C5	|

label_00B4C6:				;-----------|
	JSR label_00B4CA		;$00B4C6	|
	RTL						;$00B4C9	|
label_00B4CA:				;			|
	LDY $39					;$00B4CA	|
	LDA $6436,Y				;$00B4CC	|
	BMI label_00B4FD		;$00B4CF	|
	LDX $6E4A,Y				;$00B4D1	|
	LDA $65B0,X				;$00B4D4	|
	BMI label_00B4FD		;$00B4D7	|
	LDA $6436,X				;$00B4D9	|
	BMI label_00B4FD		;$00B4DC	|
	LDA $6892,Y				;$00B4DE	|
	SEC						;$00B4E1	|
	SBC $7362				;$00B4E2	|
	STA $302F				;$00B4E5	|
	LDA $690C,Y				;$00B4E8	|
	SEC						;$00B4EB	|
	SBC $7364				;$00B4EC	|
	STA $3031				;$00B4EF	|
	LDX $6E4A,Y				;$00B4F2	|
	LDA $6436,X				;$00B4F5	|
	BMI label_00B4FD		;$00B4F8	|
	JMP label_00B23C		;$00B4FA	|
label_00B4FD:				;			|
	RTS						;$00B4FD	|

label_00B4FE:				;-----------|
	JSR label_00B502		;$00B4FE	|
	RTL						;$00B501	|
label_00B502:				;			|
	LDY $39					;$00B502	|
	LDA $6436,Y				;$00B504	|
	BMI label_00B526		;$00B507	|
	LDA $6892,Y				;$00B509	|
	SEC						;$00B50C	|
	SBC $7362				;$00B50D	|
	STA $302F				;$00B510	|
	LDA $690C,Y				;$00B513	|
	SEC						;$00B516	|
	SBC $7364				;$00B517	|
	STA $3031				;$00B51A	|
	LDX $6E4A,Y				;$00B51D	|
	LDA $6436,Y				;$00B520	|
	JMP label_00B23C		;$00B523	|
label_00B526:				;			|
	RTS						;$00B526	|

label_00B527:				;-----------|
	JSR label_00B52B		;$00B527	|
	RTL						;$00B52A	|
label_00B52B:				;			|
	LDY $39					;$00B52B	|
	LDA $6436,Y				;$00B52D	|
	BPL label_00B533		;$00B530	|
	RTS						;$00B532	|

label_00B533:
	LDX $6DD0,Y				;$00B533	|
	BPL label_00B53B		;$00B536	|
	EOR #$0001				;$00B538	|
label_00B53B:				;			|
	ASL A					;$00B53B	|
	PHA						;$00B53C	|
	LDX $6E4A,Y				;$00B53D	|
	LDY $749D,X				;$00B540	|
	BEQ label_00B561		;$00B543	|
	ASL A					;$00B545	|
	TAY						;$00B546	|
	LDA [$8A],Y				;$00B547	|
	BPL label_00B55E		;$00B549	|
	CMP #$FFFF				;$00B54B	|
	BEQ label_00B561		;$00B54E	|
	PLX						;$00B550	|
	PHA						;$00B551	|
	PHY						;$00B552	|
	JSR label_00B48B		;$00B553	|
	PLY						;$00B556	|
	PLA						;$00B557	|
	AND #$7FFF				;$00B558	|
	JMP label_00B44E		;$00B55B	|

label_00B55E:
	JSR label_00B44E		;$00B55E	|
label_00B561:				;			|
	PLX						;$00B561	|
	JMP label_00B48B		;$00B562	|

label_00B565:				;-----------|
	JSR label_00B569		;$00B565	|
	RTL						;$00B568	|
label_00B569:				;			|
	LDX $39					;$00B569	|
	JSR label_00AABA		;$00B56B	|
	LDA $6436,X				;$00B56E	|
	LDY $6DD0,X				;$00B571	|
	BPL label_00B579		;$00B574	|
	EOR #$0001				;$00B576	|
label_00B579:				;			|
	ASL A					;$00B579	|
	TAY						;$00B57A	|
	LDA $6536,X				;$00B57B	|
	STA $14					;$00B57E	|
	LDA $65B0,X				;$00B580	|
	STA $16					;$00B583	|
	LDA [$14],Y				;$00B585	|
	TAY						;$00B587	|
	LDA $16					;$00B588	|
	JMP label_00AC5B		;$00B58A	|

label_00B58D:				;-----------|
	JSR label_00B591		;$00B58D	|
	RTL						;$00B590	|
label_00B591:				;			|
	LDX $39					;$00B591	|
	JSR label_00AABA		;$00B593	|
	LDA $6436,X				;$00B596	|
	LDY $6DD0,X				;$00B599	|
	BPL label_00B5A1		;$00B59C	|
	EOR #$0001				;$00B59E	|
label_00B5A1:				;			|
	ASL A					;$00B5A1	|
	TAY						;$00B5A2	|
	LDA $6536,X				;$00B5A3	|
	STA $14					;$00B5A6	|
	LDA $65B0,X				;$00B5A8	|
	STA $16					;$00B5AB	|
	LDA [$14],Y				;$00B5AD	|
	TAY						;$00B5AF	|
	LDA $16					;$00B5B0	|
	JMP label_00B30E		;$00B5B2	|

label_00B5B5:				;-----------|
	JSR label_00B5B9		;$00B5B5	|
	RTL						;$00B5B8	|
label_00B5B9:				;			|
	LDX $39					;$00B5B9	|
	JSR label_00AABA		;$00B5BB	|
	LDA $6436,X				;$00B5BE	|
	ASL A					;$00B5C1	|
	TAY						;$00B5C2	|
	LDA $6536,X				;$00B5C3	|
	STA $14					;$00B5C6	|
	LDA $65B0,X				;$00B5C8	|
	STA $16					;$00B5CB	|
	LDA [$14],Y				;$00B5CD	|
	TAY						;$00B5CF	|
	LDA $16					;$00B5D0	|
	JMP label_00B30E		;$00B5D2	|

label_00B5D5:				;-----------|
	JSR label_00B5D9		;$00B5D5	|
	RTL						;$00B5D8	|
label_00B5D9:				;			|
	LDX $39					;$00B5D9	|
	JSR label_00AABA		;$00B5DB	|
	LDA $6436,X				;$00B5DE	|
	ASL A					;$00B5E1	|
	TAY						;$00B5E2	|
	LDA $6536,X				;$00B5E3	|
	STA $14					;$00B5E6	|
	LDA $65B0,X				;$00B5E8	|
	STA $16					;$00B5EB	|
	LDA [$14],Y				;$00B5ED	|
	TAY						;$00B5EF	|
	LDA $16					;$00B5F0	|
	JMP label_00AC5B		;$00B5F2	|

label_00B5F5:
	JSR label_00B5F9		;$00B5F5	|
	RTL						;$00B5F8	|
label_00B5F9:				;			|
	LDX $39					;$00B5F9	|
	LDA $6436,X				;$00B5FB	|
	LDY $6DD0,X				;$00B5FE	|
	BPL label_00B606		;$00B601	|
	EOR #$0001				;$00B603	|
label_00B606:				;			|
	ASL A					;$00B606	|
	TAY						;$00B607	|
	LDA $6536,X				;$00B608	|
	STA $14					;$00B60B	|
	LDA $65B0,X				;$00B60D	|
	STA $16					;$00B610	|
	LDA [$14],Y				;$00B612	|
	TAY						;$00B614	|
	LDA #$00C8				;$00B615	|
	JMP label_00AC5B		;$00B618	|

label_00B61B:				;-----------|
	JSR label_00B61F		;$00B61B	|
	RTL						;$00B61E	|
label_00B61F:				;			|
	JSR label_00B71E		;$00B61F	|
	JSR label_00AC5B		;$00B622	|
	BRA label_00B631		;$00B625	|

label_00B627:				;-----------|
	JSR label_00B62B		;$00B627	|
	RTL						;$00B62A	|
label_00B62B:				;			|
	JSR label_00B707		;$00B62B	|
	JSR label_00AC5B		;$00B62E	|
label_00B631:				;			|
	LDA $302F				;$00B631	|
	CMP #$FFD0				;$00B634	|
	BCS label_00B63E		;$00B637	|
	CMP #$0130				;$00B639	|
	BCS label_00B64B		;$00B63C	|
label_00B63E:				;			|
	LDA $3031				;$00B63E	|
	CMP #$FFE0				;$00B641	|
	BCS label_00B65C		;$00B644	|
	CMP #$0100				;$00B646	|
	BCC label_00B65C		;$00B649	|
label_00B64B:				;			|
	LDX $39					;$00B64B	|
	JSL label_009142		;$00B64D	|
	LDX $39					;$00B651	|
	LDA $65B0,X				;$00B653	|
	ORA #$8000				;$00B656	|
	STA $65B0,X				;$00B659	|
label_00B65C:				;			|
	RTS						;$00B65C	|

label_00B65D:				;-----------|
	JSR label_00B661		;$00B65D	|
	RTL						;$00B660	|
label_00B661:				;			|
	JSR label_00B71E		;$00B661	|
	JMP label_00AC5B		;$00B664	|

label_00B667:				;-----------|
	JSR label_00B66B		;$00B667	|
	RTL						;$00B66A	|
label_00B66B:				;			|
	JSR label_00B707		;$00B66B	|
	JMP label_00AC5B		;$00B66E	|

label_00B61:				;-----------|
	JSR label_00B675		;$00B671	|
	RTL						;$00B674	|
label_00B675:				;			|
	JSR label_00B71E		;$00B675	|
	JSR label_00B30E		;$00B678	|
	BRA label_00B687		;$00B67B	|

label_00B7D:				;-----------|
	JSR label_00B681		;$00B67D	|
	RTL						;$00B680	|
label_00B681:				;			|
	JSR label_00B707		;$00B681	|
	JSR label_00B30E		;$00B684	|
label_00B687:				;			|
	LDA $302F				;$00B687	|
	CMP #$FFD0				;$00B68A	|
	BCS label_00B694		;$00B68D	|
	CMP #$0130				;$00B68F	|
	BCS label_00B6A1		;$00B692	|
label_00B694:				;			|
	LDA $3031				;$00B694	|
	CMP #$FFE0				;$00B697	|
	BCS label_00B65C		;$00B69A	|
	CMP #$0100				;$00B69C	|
	BCC label_00B6B2		;$00B69F	|
label_00B6A1:				;			|
	LDX $39					;$00B6A1	|
	JSL label_009142		;$00B6A3	|
	LDX $39					;$00B6A7	|
	LDA $65B0,X				;$00B6A9	|
	ORA #$8000				;$00B6AC	|
	STA $65B0,X				;$00B6AF	|
label_00B6B2:				;			|
	RTS						;$00B6B2	|

label_00B6B3:				;-----------|
	JSR label_00B6B7		;$00B6B3	|
	RTL						;$00B6B6	|
label_00B6B7:				;			|
	JSR label_00B71E		;$00B6B7	|
	JMP label_00B30E		;$00B6BA	|

label_00B6BD:				;-----------|
	JSR label_00B6C1		;$00B6BD	|
	RTL						;$00B6C0	|
label_00B6C1:				;			|
	JSR label_00B707		;$00B6C1	|
	JMP label_00B30E		;$00B6C4	|

label_00B6C7:				;-----------|
	JSR label_00B6CB		;$00B6C7	|
	RTL						;$00B6CA	|
label_00B6CB:				;			|
	LDY $39					;$00B6CB	|
	JSR label_00AABA		;$00B6CD	|
	JSL label_00B5F5		;$00B6D0	|
	LDA $302F				;$00B6D4	|
	CMP #$FFD0				;$00B6D7	|
	BCS label_00B6E1		;$00B6DA	|
	CMP #$0130				;$00B6DC	|
	BCS label_00B6EE		;$00B6DF	|
label_00B6E1:				;			|
	LDA $3031				;$00B6E1	|
	CMP #$FFE0				;$00B6E4	|
	BCS label_00B702		;$00B6E7	|
	CMP #$0100				;$00B6E9	|
	BCC label_00B702		;$00B6EC	|
label_00B6EE:				;			|
	LDX $39					;$00B6EE	|
	JSL label_009142		;$00B6F0	|
	LDX $39					;$00B6F4	|
	LDA $65B0,X				;$00B6F6	|
	ORA #$8000				;$00B6F9	|
	STA $65B0,X				;$00B6FC	|
	INC $751B				;$00B6FF	|
label_00B702:				;			|
	RTS						;$00B702	|

label_00B703:				;-----------|
	JSR label_00B707		;$00B703	|
	RTL						;$00B706	|
label_00B707:				;			|
	LDX $39					;$00B707	|
	JSR label_00AABA		;$00B709	|
	LDA $6436,X				;$00B70C	|
	LDY $6DD0,X				;$00B70F	|
	BPL label_00B717		;$00B712	|
	EOR #$0001				;$00B714	|
label_00B717:				;			|
	JMP label_00B726		;$00B717	|

label_00B71A:				;-----------|
	JSR label_00B71E		;$00B71A	|
	RTL						;$00B71D	|
label_00B71E:				;			|
	LDX $39					;$00B71E	|
	JSR label_00AABA		;$00B720	|
	LDA $6436,X				;$00B723	|
label_00B726:				;			|
	ASL A					;$00B726	|
	TAY						;$00B727	|
	LDA $6536,X				;$00B728	|
	STA $14					;$00B72B	|
	LDA $65B0,X				;$00B72D	|
	STA $16					;$00B730	|
	LDA [$14],Y				;$00B732	|
	TAY						;$00B734	|
	LDA $16					;$00B735	|
	RTS						;$00B737	|
	LDY #$000E				;$00B738	|
label_00B73B:				;			|
	LDA $3407,Y				;$00B73B	|
	BMI label_00B7A2		;$00B73E	|
	PHY						;$00B740	|
	LDX $3447,Y				;$00B741	|
	LDA $3437,Y				;$00B744	|
	JSR label_00B7A7		;$00B747	|
	LDA #$0000				;$00B74A	|
	LDY #$B7CE				;$00B74D	|
	JSR label_00AC5B		;$00B750	|
	PLY						;$00B753	|
	PHY						;$00B754	|
	LDX $3447,Y				;$00B755	|
	LDA $3437,Y				;$00B758	|
	EOR #$FFFF				;$00B75B	|
	INC A					;$00B75E	|
	JSR label_00B7A7		;$00B75F	|
	LDA #$0000				;$00B762	|
	LDY #$B7C9				;$00B765	|
	JSR label_00AC5B		;$00B768	|
	PLY						;$00B76B	|
	PHY						;$00B76C	|
	LDA $3447,Y				;$00B76D	|
	EOR #$FFFF				;$00B770	|
	INC A					;$00B773	|
	TAX						;$00B774	|
	LDA $3437,Y				;$00B775	|
	JSR label_00B7A7		;$00B778	|
	LDA #$0000				;$00B77B	|
	LDY #$B7C4				;$00B77E	|
	JSR label_00AC5B		;$00B781	|
	PLY						;$00B784	|
	PHY						;$00B785	|
	LDA $3447,Y				;$00B786	|
	EOR #$FFFF				;$00B789	|
	INC A					;$00B78C	|
	TAX						;$00B78D	|
	LDA $3437,Y				;$00B78E	|
	EOR #$FFFF				;$00B791	|
	INC A					;$00B794	|
	JSR label_00B7A7		;$00B795	|
	LDA #$0000				;$00B798	|
	LDY #$B7BF				;$00B79B	|
	JSR label_00AC5B		;$00B79E	|
	PLY						;$00B7A1	|
label_00B7A2:				;			|
	DEY						;$00B7A2	|
	DEY						;$00B7A3	|
	BPL label_00B73B		;$00B7A4	|
	RTS						;$00B7A6	|

label_00B7A7:
	CLC						;$00B7A7	|
	ADC $3417,Y				;$00B7A8	|
	SEC						;$00B7AB	|
	SBC $735E				;$00B7AC	|
	STA $302F				;$00B7AF	|
	TXA						;$00B7B2	|
	CLC						;$00B7B3	|
	ADC $3427,Y				;$00B7B4	|
	SEC						;$00B7B7	|
	SBC $7360				;$00B7B8	|
	STA $3031				;$00B7BB	|
	RTS						;$00B7BE	|

DATA_00B7BF:				;$00B7BF	|
	db $02,$FF,$FF,$9A,$33
DATA_00B7C4:				;$00B7C4	|
	db $02,$F9,$FF,$9A,$73
DATA_00B7C9:				;$00B7C9	|
	db $02,$FF,$F9,$9A,$B3
DATA_00B7CE:				;$00B7CE	|
	db $02,$F9,$F9,$9A,$F3


label_00B7D3:				;-----------|
	LDY $39					;$00B7D3	|
	LDX $37B2,Y				;$00B7D5	|
	LDA $37AE,Y				;$00B7D8	|
	JSR label_00B835		;$00B7DB	|
	LDA #$0000				;$00B7DE	|
	LDY #$B7CE				;$00B7E1	|
	JSR label_00AC5B		;$00B7E4	|
	LDY $39					;$00B7E7	|
	LDX $37B2,Y				;$00B7E9	|
	LDA $37AE,Y				;$00B7EC	|
	EOR #$FFFF				;$00B7EF	|
	INC A					;$00B7F2	|
	JSR label_00B835		;$00B7F3	|
	LDA #$0000				;$00B7F6	|
	LDY #$B7C9				;$00B7F9	|
	JSR label_00AC5B		;$00B7FC	|
	LDY $39					;$00B7FF	|
	LDA $37B2,Y				;$00B801	|
	EOR #$FFFF				;$00B804	|
	INC A					;$00B807	|
	TAX						;$00B808	|
	LDA $37AE,Y				;$00B809	|
	JSR label_00B835		;$00B80C	|
	LDA #$0000				;$00B80F	|
	LDY #$B7C4				;$00B812	|
	JSR label_00AC5B		;$00B815	|
	LDY $39					;$00B818	|
	LDA $37B2,Y				;$00B81A	|
	EOR #$FFFF				;$00B81D	|
	INC A					;$00B820	|
	TAX						;$00B821	|
	LDA $37AE,Y				;$00B822	|
	EOR #$FFFF				;$00B825	|
	INC A					;$00B828	|
	JSR label_00B835		;$00B829	|
	LDA #$0000				;$00B82C	|
	LDY #$B7BF				;$00B82F	|
	JMP label_00AC5B		;$00B832	|

label_00B835:				;```````````|
	CLC						;$00B835	|
	ADC $37A6,Y				;$00B836	|
	SEC						;$00B839	|
	SBC $735E				;$00B83A	|
	STA $302F				;$00B83D	|
	TXA						;$00B840	|
	CLC						;$00B841	|
	ADC $37AA,Y				;$00B842	|
	SEC						;$00B845	|
	SBC $7360				;$00B846	|
	STA $3031				;$00B849	|
	RTS						;$00B84C	|

DATA_00B84D:
	dl label_00D000
	dl label_00D12A
	dl label_009C6C
	dl label_009C94
	dl label_009C9A
	dl label_009CBB
	dl label_009CCE
	dl label_009CEF
	dl label_009F85
	dl label_009FA6
	dl label_009FEA
	dl label_009B25
	dl label_009B65
	dl label_009B73
	dl label_009BE8
	dl label_009C5C
	dl label_009DDE
	dl label_009E5E
	dl label_009E6C
	dl label_009E76
	dl label_009EB4
	dl label_009ED9
	dl label_00A2AC
	dl label_00A2C9

DATA_00B895:
	dw $BD82,$0200			; 00
	dw $8000,$0402			; 01
	dw $80FD,$0604			; 02
	dw $8000,$0604			; 03
	dw $80E6,$0604			; 04
	dw $807E,$0806			; 05
	dw $806B,$4803			; 06
	dw $B4D9,$4C06			; 07
	dw $246A,$6AD0			; 08
	dw $0000,$4CD0			; 09
	dw $035F,$4ED0			; 0A
	dw $03D5,$4ED0			; 0B
	dw $78BA,$4ECF			; 0C
	dw $C5C1,$0ECF			; 0D
	dw $FB24,$2ECB			; 0E
	dw $0094,$2EC9			; 0F
	dw $5F54,$0ECA			; 10
	dw $BDB7,$0ECA			; 11
	dw $F1DD,$0EC9			; 12
	dw $EDC0,$0ED1			; 13
	dw $E069,$4E07			; 14
	dw $AA2F,$0ED1			; 15
	dw $B9A2,$4ED1			; 16
	dw $9629,$0ECF			; 17
	dw $DF50,$0ED1			; 18
	dw $C3B0,$0ECA			; 19
	dw $D17B,$0ECA			; 1A
	dw $AA2A,$0ECF			; 1B
	dw $E93D,$6ECE			; 1C
	dw $E74D,$4205			; 1D
	dw $A04E,$4202			; 1E
	dw $B379,$4E05			; 1F
	dw $B4EF,$4E05			; 20
	dw $B57A,$4E05			; 21
	dw $B5EE,$4E05			; 22
	dw $B61C,$4E05			; 23
	dw $B62B,$5005			; 24
	dw $B675,$5005			; 25
	dw $B6B8,$5005			; 26
	dw $B73B,$5005			; 27
	dw $B76E,$5005			; 28
	dw $B7B5,$5005			; 29
	dw $B838,$5005			; 2A
	dw $B8A6,$5005			; 2B
	dw $BA43,$5005			; 2C
	dw $BA5E,$5005			; 2D
	dw $BAFA,$5005			; 2E
	dw $BB2E,$5005			; 2F
	dw $BB5B,$5005			; 30
	dw $BC1A,$5005			; 31
	dw $BC4C,$5005			; 32
	dw $BCC1,$5005			; 33
	dw $BCFB,$5005			; 34
	dw $BDCA,$5005			; 35
	dw $BE61,$5005			; 36
	dw $BEA5,$5005			; 37
	dw $BF1A,$5005			; 38
	dw $BF5F,$5005			; 39
	dw $BFD5,$5005			; 3A
	dw $C067,$5005			; 3B
	dw $C0AF,$5005			; 3C
	dw $C0DA,$5005			; 3D
	dw $C11D,$5005			; 3E
	dw $C395,$5005			; 3F
	dw $C3F5,$5005			; 40
	dw $C45F,$5005			; 41
	dw $C4DC,$5005			; 42
	dw $7B89,$50CF			; 43
	dw $CCD9,$5005			; 44
	dw $CD4D,$4E05			; 45
	dw $CDA3,$4E05			; 46
	dw $CDEF,$4E05			; 47
	dw $D5F7,$5005			; 48
	dw $D624,$5005			; 49
	dw $D698,$5005			; 4A
	dw $D754,$5005			; 4B
	dw $D7DF,$5005			; 4C
	dw $D886,$5005			; 4D
	dw $D8C1,$5005			; 4E
	dw $D8E7,$4E05			; 4F
	dw $DB26,$5005			; 50
	dw $DB5F,$5005			; 51
	dw $DBA3,$5005			; 52
	dw $DC49,$5005			; 53
	dw $DCC8,$5005			; 54
	dw $DDE0,$5005			; 55
	dw $DEB0,$5005			; 56
	dw $DF85,$5005			; 57
	dw $E002,$5005			; 58
	dw $E05B,$5005			; 59
	dw $E08F,$5005			; 5A
	dw $E0B5,$5005			; 5B
	dw $E401,$5005			; 5C
	dw $E4BA,$5005			; 5D
	dw $0000,$50D1			; 5E
	dw $0063,$50D1			; 5F
	dw $E57D,$5005			; 60
	dw $E129,$5005			; 61
	dw $E0EC,$5005			; 62
	dw $E166,$5005			; 63
	dw $E178,$5005			; 64
	dw $E1B2,$5005			; 65
	dw $E233,$5005			; 66
	dw $E2B7,$5005			; 67
	dw $E335,$5005			; 68
	dw $E36F,$5005			; 69
	dw $E3B9,$5005			; 6A
	dw $0E45,$50D1			; 6B
	dw $2297,$50D1			; 6C
	dw $B1C5,$4605			; 6D
	dw $B2D6,$4605			; 6E
	dw $C731,$5005			; 6F
	dw $B183,$5005			; 70
	dw $DE52,$5005			; 71
	dw $C528,$5005			; 72
	dw $BBBE,$5005			; 73
	dw $C683,$5005			; 74
	dw $C78D,$5005			; 75
	dw $C853,$5005			; 76
	dw $C8B1,$4605			; 77
	dw $C95E,$4605			; 78
	dw $D258,$4E05			; 79
	dw $D36B,$4E05			; 7A
	dw $D431,$4E05			; 7B
	dw $AF60,$5005			; 7C
	dw $8289,$5006			; 7D
	dw $AE67,$5005			; 7E
	dw $AF08,$5005			; 7F
	dw $B05B,$5005			; 80
	dw $B154,$5005			; 81
	dw $0E71,$50D1			; 82
	dw $0EC4,$50D1			; 83
	dw $0EFF,$50D1			; 84
	dw $0FA4,$50D1			; 85
	dw $1121,$50D1			; 86
	dw $1983,$50D1			; 87
	dw $1DC3,$50D1			; 88
	dw $27B1,$50D1			; 89
	dw $00BC,$50D1			; 8A
	dw $0653,$50D1			; 8B
	dw $0146,$50D1			; 8C
	dw $01A2,$50D1			; 8D
	dw $01FE,$50D1			; 8E
	dw $025A,$50D1			; 8F
	dw $02B6,$50D1			; 90
	dw $0312,$50D1			; 91
	dw $036E,$50D1			; 92
	dw $03E8,$50D1			; 93
	dw $046D,$50D1			; 94
	dw $06F2,$50D1			; 95
	dw $0733,$50D1			; 96
	dw $077F,$50D1			; 97
	dw $069E,$50D1			; 98
	dw $0821,$50D1			; 99
	dw $085F,$50D1			; 9A
	dw $08FE,$50D1			; 9B
	dw $0927,$50D1			; 9C
	dw $0950,$50D1			; 9D
	dw $04E1,$50D1			; 9E
	dw $053E,$50D1			; 9F
	dw $097B,$50D1			; A0
	dw $09C9,$50D1			; A1
	dw $0A0F,$50D1			; A2
	dw $0AC0,$50D1			; A3
	dw $05C3,$50D1			; A4
	dw $0D38,$50D1			; A5
	dw $1DF3,$50D1			; A6
	dw $1E52,$50D1			; A7
	dw $1A18,$50D1			; A8
	dw $1A60,$50D1			; A9
	dw $1F70,$50D1			; AA
	dw $0D78,$50D1			; AB
	dw $1340,$50D1			; AC
	dw $13D0,$50D1			; AD
	dw $1686,$50D1			; AE
	dw $1798,$50D1			; AF
	dw $0A53,$50D1			; B0
	dw $0A62,$50D1			; B1
	dw $0A99,$50D1			; B2
	dw $1A8D,$50D1			; B3
	dw $1AD2,$50D1			; B4
	dw $1BB1,$50D1			; B5
	dw $1EA3,$50D1			; B6
	dw $1F4D,$50D1			; B7
	dw $0B05,$50D1			; B8
	dw $0C15,$50D1			; B9
	dw $0BB5,$50D1			; BA
	dw $0CB3,$50D1			; BB
	dw $0D01,$50D1			; BC
	dw $6D5A,$50D4			; BD
	dw $6DDA,$50D4			; BE
	dw $05F5,$50D1			; BF
	dw $6BE4,$4ED4			; C0
	dw $1E07,$50D5			; C1
	dw $B3E7,$50D4			; C2
	dw $B1D6,$4ED4			; C3
	dw $F1B7,$50D5			; C4
	dw $3BC4,$4ED4			; C5
	dw $11FA,$50D4			; C6
	dw $22DD,$50D1			; C7
	dw $2346,$50D1			; C8
	dw $2377,$50D1			; C9
	dw $23B1,$50D1			; CA
	dw $B4B1,$50D5			; CB
	dw $B4FB,$50D5			; CC
	dw $1D35,$50D5			; CD
	dw $1D7A,$50D5			; CE
	dw $26AA,$50D5			; CF
	dw $DA4C,$5005			; D0
	dw $23EC,$50D1			; D1
	dw $2434,$50D1			; D2
	dw $24B8,$50D1			; D3
	dw $2510,$50D1			; D4
	dw $2558,$50D1			; D5
	dw $255C,$50D1			; D6
	dw $9C8F,$50D5			; D7
	dw $25AB,$50D1			; D8
	dw $263E,$50D1			; D9
	dw $266F,$50D1			; DA
	dw $2714,$50D1			; DB
	dw $2761,$50D1			; DC
	dw $1FBB,$50D1			; DD
	dw $209F,$50D1			; DE
	dw $212B,$50D1			; DF
	dw $2866,$50D1			; E0
	dw $CCC6,$6ED0			; E1
	dw $29A2,$50D1			; E2
	dw $2A3B,$50D1			; E3
	dw $2B85,$50D1			; E4





label_00BC29:				;-----------| SA-1: continue point after SNES finishes loading the SPC engine.
	JSL UpdateSprSize		;$00BC29	| Update $2101 (sprite tile sizes/gfx base).
	JSL label_00D828		;$00BC2D	|
	JSL UpdtLyrsCtrl		;$00BC31	| Update controller data and layer positions.
	JSL CheckEmptySaves		;$00BC35	| Check for unitialized save files, and mark them as invalid.
	JSL ValidateSaves		;$00BC39	| Validate save files, and reinitialize invalid ones.
	LDA $7F01				;$00BC3D	|
	AND #$00FF				;$00BC40	|
	JSL label_00CE43		;$00BC43	|
	LDA.w #ChkStartErrs		;$00BC47	|\ 
	LDX.w #ChkStartErrs>>16	;$00BC4A	|| Execute $00CCB1 on the SNES.
	JSL SA1_ExecuteSNES		;$00BC4D	|/
	LDA #$0000				;$00BC51	|
	STA $7390				;$00BC54	|
	STZ $7396				;$00BC57	|
	INC $7396				;$00BC5A	|
	STZ $7398				;$00BC5D	|
label_00BC60:				;-----------| Routine to handle switching game modes. Cutscenes/previews enter at the point below.
	JSL label_00D87F		;$00BC60	|
	BRA label_00BC69		;$00BC64	|
label_00BC66:				;```````````| Entry point for opening cutscenes/subgame previews.
	INC $7398				;$00BC66	|
label_00BC69:				;			|
	STZ $33C6				;$00BC69	|
	INC $33C6				;$00BC6C	|
	STZ $3330				;$00BC6F	|
	LDA $7390				;$00BC72	|\ 
	CMP #$0011				;$00BC75	||\ If attempting to switch to game mode 11+, hardlock the game here.
  - BCS -					;$00BC78	||/
	STA $6028				;$00BC7A	||\ 
	ASL A					;$00BC7D	||| Multiply game mode by 3.
	CLC						;$00BC7E	|||
	ADC $6028				;$00BC7F	||/
	TAX						;$00BC82	||
	LDA.l DATA_00BC9D,X		;$00BC83	||
	STA $6028				;$00BC87	|| Get pointer to routine to run.
	LDA.l DATA_00BC9D+2,X	;$00BC8A	||
	STA $602A				;$00BC8E	|/
	JSL label_00BC98		;$00BC91	| Start the game mode.
	JMP label_00BCCE		;$00BC95	|

label_00BC98:				;-----------| Used to JSL to the selected game mode from the below table.
	JMP [$6028]				;$00BC98	|

DATA_00BC9D:				;$00BC9B	| Pointers to various game modes for the SA-1 chip.
	dl label_00BDE3			; 00 - Main opening cutscene/title
	dl label_00BE74			; 01 - Game select menu
	dl label_00C653			; 02 - "Is this your first time?"
	dl label_00C1D8			; 03 - Normal level (including Nova battle)
	dl label_00C5E5			; 04 - Game Over
	dl label_00BEC9			; 05 - Subgame title screen
	dl label_00BFC8			; 06 - Overworld map (Dynablade, Metaknight, Milky Way)
	dl label_00CBA4			; 07 - Subgame opening cutscene
	dl label_00BEA2			; 08 - Subgame credits / Gourmet Race score tally
	dl label_00C5FD			; 09 - Dynablade cannon game, Milky Way level end room
	dl label_00C746			; 0A - Sound test
	dl label_00C760			; 0B - Minigame (Megaton, Samurai)
	dl label_00C77A			; 0C - The Arena
	dl label_00C0BA			; 0D - Dynablade trial room
	dl label_00C108			; 0E - Dynablade overworld enemy battle
	dl label_00C7F0			; 0F - Main title screen subgame preview
	dl label_00CB5C			; 10 - Main title screen minigame preview

label_00BCCE:				;-----------| 
	JSL UpdateSprSize		;$00BCCE	|
	LDA $7398				;$00BCD2	|
	BNE label_00BCDA		;$00BCD5	|
	JMP label_00BC60		;$00BCD7	|
label_00BCDA:				;			|
	DEC $7398				;$00BCDA	|
	RTL						;$00BCDD	|


label_00BCDE:				;-----------| 
	JSL UpdtLyrsCtrl		;$00BCDE	|
	JSL $05971F				;$00BCE2	|
	JSR label_00BD3B		;$00BCE6	|
	JSL $03ECEB				;$00BCE9	|
	JSL $048184				;$00BCED	|
	JSR label_00BD60		;$00BCF1	|
	JSL label_008FF2		;$00BCF4	|
	LDA #$DFC6				;$00BCF8	|\ 
	LDX #$0001				;$00BCFB	|| Execute $01DFC6 on the SNES.
	JSL SA1_ExecuteSNES		;$00BCFE	|/
	RTL						;$00BD02	|


label_00BD03:
	JSL UpdtLyrsCtrl		;$00BD03	|
	JSR label_00BD3B		;$00BD07	|
	JSR label_00BD60		;$00BD0A	|
	RTL						;$00BD0D	|

label_00BD0E:
	JSL UpdtLyrsCtrl		;$00BD0E	|
	JSL $05971F				;$00BD12	|
	JSR label_00BD3B		;$00BD16	|
	JSL $03ECEB				;$00BD19	|
	LDA $32EA				;$00BD1D	|
	CMP #$0001				;$00BD20	|
	BEQ label_00BD29		;$00BD23	|
	JSL $048184				;$00BD25	|
label_00BD29:				;			|
	JSR label_00BD60		;$00BD29	|
	JSL label_008FF2		;$00BD2C	|
	LDA #$DFC6				;$00BD30	|\ 
	LDX #$0001				;$00BD33	|| Execute $01DFC6 on the SNES.
	JSL SA1_ExecuteSNES		;$00BD36	|/
	RTL						;$00BD3A	|

label_00BD3B:
	LDA $32C4				;$00BD3B	|
	CMP #$3030				;$00BD3E	|
	BEQ label_00BD44		;$00BD41	|
	RTS						;$00BD43	|

label_00BD44:
	LDA #$0000				;$00BD44	|
	JSL label_00D12D		;$00BD47	|
	LDA #$0000				;$00BD4B	|
	JSL label_00D003		;$00BD4E	|
	JSL UpdtLyrsCtrl		;$00BD52	|
	LDA #$8004				;$00BD56	|\ 
	LDX #$0000				;$00BD59	|| Execute $008004 on the SNES.
	JML SA1_ExecuteSNES		;$00BD5C	|/

label_00BD60:
	LDA #$FFFF				;$00BD60	|
	STA $3509				;$00BD63	|
	STA $350B				;$00BD66	|
	STA $35CB				;$00BD69	|
	STA $35CD				;$00BD6C	|
	RTS						;$00BD6F	|

label_00BD70:				;-----------|
	PHA						;$00BD70	|
	LDA #$0000				;$00BD71	|
	JSL label_008E72		;$00BD74	|
	CMP #$FFFF				;$00BD78	|
label_00BD7B:				;			|
	BEQ label_00BD7B		;$00BD7B	|
	PLA						;$00BD7D	|
	STA $6D56				;$00BD7E	|
	RTL						;$00BD81	|

label_00BD82:
	db $21,$00,$0F,$0D,$A0,$BD,$A7,$BD
	db $C7,$BD,$CB,$BD,$AB,$BD,$B3,$BD
	db $B7,$BD,$BE,$BD,$CF,$BD,$D3,$BD
	db $D7,$BD,$DB,$BD,$DF,$BD,$C1,$7B
	db $A4,$00,$F1,$DC,$CA,$0D,$07,$88
	db $07,$19,$00,$00,$00,$0D,$9A,$A3
	db $D1,$0D,$12,$AC,$CA,$C1,$7B,$A4
	db $00,$CD,$D5,$07,$18,$8E,$73,$20
	db $00,$0D,$DF,$D6,$CA,$0D,$BC,$94
	db $CB,$0D,$47,$5F,$CA,$0D,$1B,$D2
	db $CB,$0D,$00,$00,$C9,$0D,$18,$00
	db $C9,$0D,$35,$92,$CF,$0D,$83,$DB
	db $D1



label_00BDE3:				;-----------| Game Mode 0 - Main opening cutscene/title
	JSL UpdateSprSize		;$00BDE3	|
	SEP #$20				;$00BDE7	|
	LDA #$FF				;$00BDE9	|
	STA $3093				;$00BDEB	|
	REP #$20				;$00BDEE	|
	LDA #$0000				;$00BDF0	|
	JSL label_00D003		;$00BDF3	|
	LDA #$0000				;$00BDF7	|
	JSL label_00BD70		;$00BDFA	|
	BRA label_00BE12		;$00BDFE	|

label_00BE00:
	JSL UpdateSprSize		;$00BE00	|
	LDA #$0000				;$00BE04	|
	JSL label_00D003		;$00BE07	|
	LDA #$0001				;$00BE0B	|
	JSL label_00BD70		;$00BE0E	|
label_00BE12:				;			|
	STZ $7396				;$00BE12	|
	STZ $7392				;$00BE15	|
label_00BE18:				;			|
	JSL label_00BCDE		;$00BE18	|
	LDA $7392				;$00BE1C	|
	BEQ label_00BE18		;$00BE1F	|
	LDA $7396				;$00BE21	|
	BEQ label_00BE4D		;$00BE24	|
	JSL label_00CC67		;$00BE26	|
	INC $739A				;$00BE2A	|
	JSL label_00D87F		;$00BE2D	|
	LDA #$000F				;$00BE31	|
	STA $7390				;$00BE34	|
	STZ $7396				;$00BE37	|
	JSL label_00BC66		;$00BE3A	|
	JSL label_00D87F		;$00BE3E	|
	STZ $739A				;$00BE42	|
	LDA $7396				;$00BE45	|
	BNE label_00BE00		;$00BE48	|
	JMP label_00BDE3		;$00BE4A	|

label_00BE4D:
	LDA #$0001				;$00BE4D	|
	STA $7390				;$00BE50	|
	LDA $7F00				;$00BE53	|
	AND #$00FF				;$00BE56	|
	TAX						;$00BE59	|
	LDA.l SaveIndices,X		;$00BE5A	|
	AND #$00FF				;$00BE5E	|
	TAX						;$00BE61	|
	LDA $7F06,X				;$00BE62	|
	AND #$00FF				;$00BE65	|
	CMP #$00FF				;$00BE68	|
	BNE label_00BE70		;$00BE6B	|
	LDA #$0000				;$00BE6D	|
label_00BE70:				;			|
	STA $7A91				;$00BE70	|
	RTL						;$00BE73	|



label_00BE74:				;-----------| Game Mode 01 - Game select menu
	JSL label_00D8DE		;$00BE74	|
	LDA #$0005				;$00BE78	|
	JSL label_00BD70		;$00BE7B	|
	STZ $7392				;$00BE7F	|
label_00BE82:				;			|
	JSL label_00BCDE		;$00BE82	|
	LDA $7392				;$00BE86	|
	BEQ label_00BE82		;$00BE89	|
	LDX $32EA				;$00BE8B	|
	LDA.l DATA_00BE99,X		;$00BE8E	|
	AND #$00FF				;$00BE92	|
	STA $7390				;$00BE95	|
	RTL						;$00BE98	|

DATA_00BE99:
	db $05,$05,$05
	db $05,$05,$05
	db $05,$0A,$0B


label_00BEA2:				;-----------| Game Mode 08 - Subgame credits / Gourmet Race score tally
	LDA #$000A				;$00BEA2	|
	JSL label_00BD70		;$00BEA5	|
	STZ $7392				;$00BEA9	|
label_00BEAC:				;			|
	JSL label_00BCDE		;$00BEAC	|
	LDA $7392				;$00BEB0	|
	BEQ label_00BEAC		;$00BEB3	|
	LDX $32EA				;$00BEB5	|
	LDA.l DATA_00BEC3,X		;$00BEB8	|
	AND #$00FF				;$00BEBC	|
	STA $7390				;$00BEBF	|
	RTL						;$00BEC2	|

DATA_00BEC3:
	db $01,$01,$05
	db $01,$01,$01



label_00BEC9:				;-----------| Game Mode 05 - Subgame title screen
	JSL label_00D8EB		;$00BEC9	|
	LDA #$0006				;$00BECD	|
	JSL label_00BD70		;$00BED0	|
	STZ $7396				;$00BED4	|
	INC $7396				;$00BED7	|
label_00BEDA:				;			|
	STZ $7392				;$00BEDA	|
label_00BEDD:				;			|
	JSL label_00BCDE		;$00BEDD	|
	LDA #$BFC3				;$00BEE1	|\ 
	LDX #$0000				;$00BEE4	|| Execute $00BFC3 on the SNES.
	JSL SA1_ExecuteSNES		;$00BEE7	|/
	LDA $739A				;$00BEEB	|
	BEQ label_00BEFC		;$00BEEE	|
	LDA $32C4				;$00BEF0	|
	AND #$FFF0				;$00BEF3	|
	BEQ label_00BEFC		;$00BEF6	|
	INC $7396				;$00BEF8	|
	RTL						;$00BEFB	|

label_00BEFC:
	LDA $7392				;$00BEFC	|
	BMI label_00BF18		;$00BEFF	|
	BNE label_00BF45		;$00BF01	|
	LDA $7A31				;$00BF03	|
	BNE label_00BEDD		;$00BF06	|
	LDA $32D4				;$00BF08	|
	AND #$0040				;$00BF0B	|
	BEQ label_00BEDD		;$00BF0E	|
	LDA $32EA				;$00BF10	|
	CMP #$0006				;$00BF13	|
	BEQ label_00BEDA		;$00BF16	|
label_00BF18:				;			|
	LDA $32EA				;$00BF18	|
	CMP #$0003				;$00BF1B	|
	BEQ label_00BF26		;$00BF1E	|
	JSL label_00CC7B		;$00BF20	|
	BRA label_00BF2A		;$00BF24	|

label_00BF26:
	JSL label_00CC67		;$00BF26	|
label_00BF2A:				;			|
	JSL label_00D87F		;$00BF2A	|
	LDA #$0007				;$00BF2E	|
	STA $7390				;$00BF31	|
	JSL label_00BC66		;$00BF34	|
	JSL label_00D87F		;$00BF38	|
	LDA $739A				;$00BF3C	|
	BNE label_00BF44		;$00BF3F	|
	JMP label_00BEC9		;$00BF41	|
label_00BF44:				;			|
	RTL						;$00BF44	|

label_00BF45:
	LDA $7396				;$00BF45	|
	BNE label_00BF54		;$00BF48	|
	INC $7396				;$00BF4A	|
	LDA #$0001				;$00BF4D	|
	STA $7390				;$00BF50	|
	RTL						;$00BF53	|

label_00BF54:
	LDX $32EA				;$00BF54	|
	CPX #$0002				;$00BF57	|
	BNE label_00BF63		;$00BF5A	|
	LDA $7B2D				;$00BF5C	|
	BEQ label_00BF71		;$00BF5F	|
	BRA label_00BF6B		;$00BF61	|

label_00BF63:
	LDA $32EE				;$00BF63	|
	ORA $32F2				;$00BF66	|
	BNE label_00BF71		;$00BF69	|
label_00BF6B:				;			|
	LDA.l DATA_00BFB5,X		;$00BF6B	|
	BRA label_00BF75		;$00BF6F	|

label_00BF71:
	LDA.l DATA_00BFBC,X		;$00BF71	|
label_00BF75:
	AND #$00FF				;$00BF75	|
	STA $7390				;$00BF78	|
	JSL $03A04A				;$00BF7B	|
	LDA $32EA				;$00BF7F	|
	CMP #$0004				;$00BF82	|
	BNE label_00BFAD		;$00BF85	|
	LDA #$001E				;$00BF87	|
label_00BF8A:				;			|
	PHA						;$00BF8A	|
	JSL label_00BCDE		;$00BF8B	|
	PLA						;$00BF8F	|
	DEC A					;$00BF90	|
	BNE label_00BF8A		;$00BF91	|
	LDA $32EE				;$00BF93	|
	CMP #$0007				;$00BF96	|
	BNE label_00BFAD		;$00BF99	|
	LDA #$000D				;$00BF9B	|
	STA $74A1				;$00BF9E	|
	LDA #$0000				;$00BFA1	|
	STA $7495				;$00BFA4	|
	LDA #$0001				;$00BFA7	|
	STA $737E				;$00BFAA	|
label_00BFAD:				;			|
	LDA #$0000				;$00BFAD	|
	JSL label_00D12D		;$00BFB0	|
	RTL						;$00BFB4	|

DATA_00BFB5:
	db $02,$02,$02,$02,$06,$02,$0C
DATA_00BFBC:
	db $03,$06,$03,$03,$03,$06,$01

label_00BFC3:				;```````````| SNES-side subroutine used above to waste some cycles.
	NOP						;$00BFC3	|
	NOP						;$00BFC4	|
	NOP						;$00BFC5	|
	NOP						;$00BFC6	|
	RTL						;$00BFC7	|



label_00BFC8:				;-----------| Game Mode 06 - Overworld map (Dynablade, Metaknight, Milky Way)
	LDA #$0003				;$00BFC8	|
	JSL label_00BD70		;$00BFCB	|
	STZ $7392				;$00BFCF	|

label_00BFD2:
	JSL label_00BCDE		;$00BFD2	|
	LDA $7392				;$00BFD6	|
	BEQ label_00BFD2		;$00BFD9	|
	LDA $32EA				;$00BFDB	|\ 
	CMP #$0009				;$00BFDE	|| Hardlock the game if outside the defined range? Although the range is actually up to 6, not 8.
  - BCS -					;$00BFE1	|/
	ASL A					;$00BFE3	|
	TAX						;$00BFE4	|
	JMP (label_00BFE8,X)	;$00BFE5	|

label_00BFE8:
	dw label_00BFF6			; 00
	dw label_00BFFD			; 01
	dw label_00BFF6			; 02
	dw label_00BFF6			; 03
	dw label_00C0AC			; 04
	dw label_00C0B3			; 05
	dw label_00BFF6			; 06

label_00BFF6:
	LDA #$0003				;$00BFF6	|
	STA $7390				;$00BFF9	|
	RTL						;$00BFFC	|

label_00BFFD:
	LDA $7392				;$00BFFD	|
	BMI label_00C05E		;$00C000	|
	LDA $32EE				;$00C002	|
	CMP #$0005				;$00C005	|
	BCS label_00C011		;$00C008	|
	LDA #$0003				;$00C00A	|
	STA $7390				;$00C00D	|
	RTL						;$00C010	|

label_00C011:
	LDA $7A63				;$00C011	|
	AND #$00FF				;$00C014	|
	STA $73B2				;$00C017	|
	LDA #$000D				;$00C01A	|
	STA $7390				;$00C01D	|
	JSL label_00D87F		;$00C020	|
	JSL label_00BC66		;$00C024	|
	LDA $7394				;$00C028	|
	CMP #$0002				;$00C02B	|
	BNE label_00C04D		;$00C02E	|
	LDA #$0004				;$00C030	|
	STA $7390				;$00C033	|
	JSL label_00D87F		;$00C036	|
	JSL label_00BC66		;$00C03A	|
	LDA $7396				;$00C03E	|
	BNE label_00C04D		;$00C041	|
	LDA #$0001				;$00C043	|
	STA $7390				;$00C046	|
	INC $7396				;$00C049	|
	RTL						;$00C04C	|

label_00C04D:
	JSL label_00D87F		;$00C04D	|
	SEP #$20				;$00C051	|
	LDA $73B2				;$00C053	|
	STA $7A63				;$00C056	|
	REP #$20				;$00C059	|
	JMP label_00BFC8		;$00C05B	|

label_00C05E:
	JSL label_00CC7B		;$00C05E	|
	LDA #$000E				;$00C062	|
	STA $7390				;$00C065	|
	JSL label_00D87F		;$00C068	|
	JSL label_00BC66		;$00C06C	|
	LDA $7394				;$00C070	|
	CMP #$0002				;$00C073	|
	BNE label_00C095		;$00C076	|
	LDA #$0004				;$00C078	|
	STA $7390				;$00C07B	|
	JSL label_00D87F		;$00C07E	|
	JSL label_00BC66		;$00C082	|
	LDA $7396				;$00C086	|
	BNE label_00C095		;$00C089	|
	LDA #$0001				;$00C08B	|
	STA $7390				;$00C08E	|
	INC $7396				;$00C091	|
	RTL						;$00C094	|

label_00C095:
	JSL label_00D87F		;$00C095	|
	LDX #$0001				;$00C099	|\ 
	LDA #$8479				;$00C09C	|| Load the DMA table at $018479.
	JSL LoadDMATable		;$00C09F	|/
	LDA #$0001				;$00C0A3	|
	STA $32EA				;$00C0A6	|
	JMP label_00BFC8		;$00C0A9	|

label_00C0AC:
	LDA #$0003				;$00C0AC	|
	STA $7390				;$00C0AF	|
	RTL						;$00C0B2	|

label_00C0B3:
	LDA #$0003				;$00C0B3	|
	STA $7390				;$00C0B6	|
	RTL						;$00C0B9	|



label_00C0BA:				;-----------| Game Mode 0D - Dynablade trial room
	JSL label_00D93B		;$00C0BA	|
	JSL UpdateSprSize		;$00C0BE	|
	JSL label_00D9C4		;$00C0C2	|
	JSL $018000				;$00C0C6	|
	JSL $D4FB90				;$00C0CA	|
	LDA #$0001				;$00C0CE	|
	STA $73A6				;$00C0D1	|
	STA $7392				;$00C0D4	|
	JSL label_00BCDE		;$00C0D7	|
	JSL label_00BCDE		;$00C0DB	|
	JSL label_00BCDE		;$00C0DF	|
	STZ $73A6				;$00C0E3	|
	STZ $7394				;$00C0E6	|
	JSL label_00CBF4		;$00C0E9	|
	STZ $7392				;$00C0ED	|
label_00C0F0:				;			|
	JSL label_00BCDE		;$00C0F0	|
	JSL label_00CBCC		;$00C0F4	|
	BEQ label_00C0FE		;$00C0F8	|
	JSL $CF98A9				;$00C0FA	|
label_00C0FE:				;			|
	LDA $7392				;$00C0FE	|
	BEQ label_00C0F0		;$00C101	|
	JSL label_00CC7B		;$00C103	|
	RTL						;$00C107	|




label_00C108:				;-----------| Game Mode 0E - Dynablade overworld enemy battle
	LDA #$0009				;$00C108	|
	LDX #$0001				;$00C10B	|
	LDY #$0000				;$00C10E	|
	JSL label_00DA97		;$00C111	|
	JSL label_00D93B		;$00C115	|
	JSL label_00A94B		;$00C119	|
	JSL label_00D9C4		;$00C11D	|
	JSL $018000				;$00C121	|
	LDA #$C1CA				;$00C125	|\ 
	LDX #$0000				;$00C128	|| Execute $00C1CA on the SNES.
	JSL SA1_ExecuteSNES		;$00C12B	|/
	JSL $D4FB90				;$00C12F	|
	LDA #$FFFF				;$00C133	|
	STA $7A75				;$00C136	|
	LDA #$0001				;$00C139	|
	STA $73A6				;$00C13C	|
	JSL label_00BCDE		;$00C13F	|
	JSL label_00BCDE		;$00C143	|
	JSL label_00BCDE		;$00C147	|
	JSL label_00CBF4		;$00C14B	|
	STZ $73A6				;$00C14F	|
	STZ $7392				;$00C152	|
	STZ $7394				;$00C155	|
	SEP #$20				;$00C158	|
	STZ $7A67				;$00C15A	|
	REP #$20				;$00C15D	|
label_00C15F:				;			|
	JSL label_00BCDE		;$00C15F	|
	LDX $7A75				;$00C163	|
	BMI label_00C15F		;$00C166	|
	LDA $623C,X				;$00C168	|
	BMI label_00C1AC		;$00C16B	|
	LDA $737C				;$00C16D	|
	BMI label_00C199		;$00C170	|
	BEQ label_00C199		;$00C172	|
	LDA $30A1				;$00C174	|
	AND #$000F				;$00C177	|
	CMP #$000F				;$00C17A	|
	BNE label_00C15F		;$00C17D	|
	JSL label_00CBCC		;$00C17F	|
	BEQ label_00C15F		;$00C183	|
	LDA $7B35				;$00C185	|
	ORA $7368				;$00C188	|
	BNE label_00C15F		;$00C18B	|
	INC $7B33				;$00C18D	|
	JSL $CF98A9				;$00C190	|
	STZ $7B33				;$00C194	|
	BRA label_00C15F		;$00C197	|

label_00C199:
	JSL label_00BCDE		;$00C199	|
	LDA $7392				;$00C19D	|
	BEQ label_00C199		;$00C1A0	|
	SEP #$20				;$00C1A2	|
	LDA #$01				;$00C1A4	|
	STA $7A65				;$00C1A6	|
	REP #$20				;$00C1A9	|
	RTL						;$00C1AB	|

label_00C1AC:
	INC $7A67				;$00C1AC	|
	LDA #$0009				;$00C1AF	|
	JSL label_00EAB0		;$00C1B2	|
	LDA #$00F0				;$00C1B6	|
label_00C1B9:				;			|
	PHA						;$00C1B9	|
	JSL label_00BCDE		;$00C1BA	|
	PLA						;$00C1BE	|
	DEC A					;$00C1BF	|
	BNE label_00C1B9		;$00C1C0	|
	STZ $7392				;$00C1C2	|
	JSL label_00CC7B		;$00C1C5	|
	RTL						;$00C1C9	|

label_00C1CA:
	LDA #$0001				;$00C1CA	|
	STA $32EA				;$00C1CD	|
	JSL $01E921				;$00C1D0	|
	JML $01EA69				;$00C1D4	|



label_00C1D8:				;-----------| Game Mode 03 - Normal level (including Nova battle)
	JSL label_00D93B		;$00C1D8	|
label_00C1DC:				;			|
	JSL UpdateSprSize		;$00C1DC	|
	JSL label_00D9C4		;$00C1E0	|
	JSL $018000				;$00C1E4	|
	JSL $D4FB90				;$00C1E8	|
	LDA #$0001				;$00C1EC	|
	STA $73A6				;$00C1EF	|
	STA $7392				;$00C1F2	|
	JSL label_00BCDE		;$00C1F5	|
	JSL label_00BCDE		;$00C1F9	|
	JSL label_00BCDE		;$00C1FD	|
	STZ $73A6				;$00C201	|
	STZ $7394				;$00C204	|
	JSL label_00CBF4		;$00C207	|
	STZ $7392				;$00C20B	|
	LDA $32EA				;$00C20E	|
	CMP #$0004				;$00C211	|
	BNE label_00C219		;$00C214	|
	STZ $73A4				;$00C216	|
label_00C219:				;			|
	JSL label_00BCDE		;$00C219	|
	LDA $30A1				;$00C21D	|
	AND #$00FF				;$00C220	|
	CMP #$000F				;$00C223	|
	BNE label_00C26B		;$00C226	|
	JSL label_00CBCC		;$00C228	|
	BEQ label_00C26B		;$00C22C	|
	LDA $7B35				;$00C22E	|
	ORA $7368				;$00C231	|
	BNE label_00C26B		;$00C234	|
	LDA $7A19				;$00C236	|
	PHA						;$00C239	|
	STZ $7A19				;$00C23A	|
	JSL $CF98A9				;$00C23D	|
	PLA						;$00C241	|
	STA $7A19				;$00C242	|
	LDA $7396				;$00C245	|
	BNE label_00C26B		;$00C248	|
	INC $7396				;$00C24A	|
	LDA $32EA				;$00C24D	|
	CMP #$0002				;$00C250	|
	BEQ label_00C264		;$00C253	|
	CMP #$0004				;$00C255	|
	BNE label_00C25D		;$00C258	|
	STZ $32F4				;$00C25A	|
label_00C25D:				;			|
	LDA #$0006				;$00C25D	|
	STA $7390				;$00C260	|
	RTL						;$00C263	|

label_00C264:
	LDA #$0005				;$00C264	|
	STA $7390				;$00C267	|
	RTL						;$00C26A	|

label_00C26B:
	LDA $73A4				;$00C26B	|
	ORA $7368				;$00C26E	|
	BNE label_00C293		;$00C271	|
	LDA $73A0				;$00C273	|
	BEQ label_00C293		;$00C276	|
	CMP #$00B4				;$00C278	|
	BCS label_00C288		;$00C27B	|
	DEC $73A2				;$00C27D	|
	BNE label_00C293		;$00C280	|
	LDA #$0014				;$00C282	|
	STA $73A2				;$00C285	|
label_00C288:				;			|
	DEC $73A0				;$00C288	|
	JSL $CF63B6				;$00C28B	|
	JSL $CF63F8				;$00C28F	|
label_00C293:				;			|
	LDA $7392				;$00C293	|
	BNE label_00C29B		;$00C296	|
	JMP label_00C219		;$00C298	|

label_00C29B:
	LDA $7394				;$00C29B	|\ 
	CMP #$0005				;$00C29E	||\ Hardlock the game if outside the defined range. 
  - BCS -					;$00C2A1	||/
	ASL A					;$00C2A3	||
	TAX						;$00C2A4	||
	JMP (label_00C2A8,X)	;$00C2A5	|/

label_00C2A8:
	dw label_00C2B2			; 00
	dw label_00C518			; 01
	dw label_00C4ED			; 02
	dw label_00C3A8			; 03
	dw label_00C49A			; 04

label_00C2B2:				;-----------| Normal level, submode 0
	JSL label_00D87F		;$00C2B2	|
	LDA $32EA				;$00C2B6	|
	CMP #$0004				;$00C2B9	|
	BEQ label_00C2C1		;$00C2BC	|
	JMP label_00C365		;$00C2BE	|

label_00C2C1:
	LDA $32EE				;$00C2C1	|
	CMP #$0006				;$00C2C4	|
	BEQ label_00C2CC		;$00C2C7	|
	JMP label_00C365		;$00C2C9	|

label_00C2CC:
	LDA $32F2				;$00C2CC	|
	CMP #$0003				;$00C2CF	|
	BEQ label_00C2D7		;$00C2D2	|
	JMP label_00C365		;$00C2D4	|

label_00C2D7:
	LDA $7B33				;$00C2D7	|
	BEQ label_00C2DF		;$00C2DA	|
	JMP label_00C365		;$00C2DC	|

label_00C2DF:
	LDA #$0000				;$00C2DF	|
	LDX #$0000				;$00C2E2	|
	LDY #$0200				;$00C2E5	|
	JSL label_00A240		;$00C2E8	|
	LDA #$C385				;$00C2EC	|\ 
	LDX #$0000				;$00C2EF	|| Load the DMA table at $00C385.
	JSL LoadDMATable		;$00C2F2	|/
	JSL $D4FB90				;$00C2F6	|
	LDA #$E921				;$00C2FA	|\ 
	LDX #$0001				;$00C2FD	|| Execute $01E921 on the SNES.
	JSL SA1_ExecuteSNES		;$00C300	|/
	LDA #$EA69				;$00C304	|\ 
	LDX #$0001				;$00C307	|| Execute $01EA69 on the SNES.
	JSL SA1_ExecuteSNES		;$00C30A	|/
	LDA #$0001				;$00C30E	|
	STA $33C6				;$00C311	|
	LDA #$0600				;$00C314	|
	STA $7A27				;$00C317	|
	LDX #$03A6				;$00C31A	|
	LDA #$0013				;$00C31D	|
	JSL $01DE76				;$00C320	|
	JSL label_00C36C		;$00C324	|
	JSL label_00C36C		;$00C328	|
	LDA #$000F				;$00C32C	|
	JSL label_0085C7		;$00C32F	|
label_00C333:
	JSL UpdtLyrsCtrl		;$00C333	|
	LDA #$DFC6				;$00C337	|\ 
	LDX #$0001				;$00C33A	|| Execute $01DFC6 on the SNES.
	JSL SA1_ExecuteSNES		;$00C33D	|/
	LDA $33C6				;$00C341	|
	BNE label_00C352		;$00C344	|
	LDA #$EA69				;$00C346	|\ 
	LDX #$0001				;$00C349	|| Execute $01EA69 on the SNES.
	JSL SA1_ExecuteSNES		;$00C34C	|/
	BRA label_00C333		;$00C350	|

label_00C352:
	JSL $D4FB83				;$00C352	|
	LDA #$0000				;$00C356	|
	JSL label_0085C7		;$00C359	|
	JSL UpdateSprSize		;$00C35D	|
	JSL label_00D87F		;$00C361	|
label_00C365:				;			|
	JSL $D4FB90				;$00C365	|
	JMP label_00C1DC		;$00C369	|

label_00C36C:
	JSL UpdtLyrsCtrl		;$00C36C	|
	LDA #$DFC6				;$00C370	|\ 
	LDX #$0001				;$00C373	|| Execute $01DFC6 on the SNES.
	JSL SA1_ExecuteSNES		;$00C376	|/
	LDA #$EA69				;$00C37A	|\ 
	LDX #$0001				;$00C37D	|| Execute $01EA69 on the SNES.
	JSL SA1_ExecuteSNES		;$00C380	|/
	RTL						;$00C384	|

DATA_00C385:				;$00C385	| DMA table used above, presumably to clear VRAM data.
	db $06 : dw $0020 : dl $00C3A6 : dw $0000
	db $06 : dw $1000 : dl $00C3A6 : dw $4800
	db $06 : dw $0800 : dl $00C3A6 : dw $5400
	db $06 : dw $0800 : dl $00C3A6 : dw $5000
	db $FF

DATA_00C3A6:				;$00C3A6	| Empty word, used above to clear data.
	dw $0000


label_00C3A8:				;-----------| Normal level, submode 3
	JSL $059A1A				;$00C3A8	|
	JSL $059A20				;$00C3AC	|
	LDA $32EA				;$00C3B0	|\ 
	CMP #$0009				;$00C3B3	||\ Hardlock the game if outside the defined range.
  -	BCS -					;$00C3B6	||/
	ASL A					;$00C3B8	||
	TAX						;$00C3B9	||
	JMP (label_00C3BD,X)	;$00C3BA	|/

label_00C3BD:
	dw label_00C3DD			; 00
	dw label_00C3E4			; 01
	dw label_00C424			; 02
	dw label_00C49A			; 03
	dw label_00C433			; 04
	dw label_00C469			; 05
	dw label_00C3CF			; 06
	dw label_00C3D6			; 07
	dw label_00C3D6			; 08

label_00C3CF:				;-----------| Normal level, submode 3, routine 6
	LDA #$0001				;$00C3CF	|
	STA $7390				;$00C3D2	|
	RTL						;$00C3D5	|

label_00C3D6:				;-----------| Normal level, submode 3, routine 7/8
	LDA #$0000				;$00C3D6	|
	STA $7390				;$00C3D9	|
	RTL						;$00C3DC	|

label_00C3DD:				;-----------| Normal level, submode 3, routine 0
	JSL label_00F13D		;$00C3DD	|
	JMP label_00C1D8		;$00C3E1	|

label_00C3E4:				;-----------| Normal level, submode 3, routine 1
	LDA $7A63				;$00C3E4	|
	AND #$00FF				;$00C3E7	|
	CMP #$0006				;$00C3EA	|
	BCS label_00C412		;$00C3ED	|
	LDA $7A63				;$00C3EF	|
	AND #$00FF				;$00C3F2	|
	STA $00					;$00C3F5	|
	LDA $7A65				;$00C3F7	|
	AND #$00FF				;$00C3FA	|
	STA $02					;$00C3FD	|
	LDX $00					;$00C3FF	|
	BEQ label_00C404		;$00C401	|
	DEC A					;$00C403	|
label_00C404:				;			|
	CMP $00					;$00C404	|
	BNE label_00C412		;$00C406	|
	INC $7A63				;$00C408	|
	LDA #$0009				;$00C40B	|
	JSL label_00EAB0		;$00C40E	|
label_00C412:				;			|
	JSL label_00F161		;$00C412	|
	LDA #$0001				;$00C416	|
	JSL label_00EAB0		;$00C419	|
	LDA #$0009				;$00C41D	|
	STA $7390				;$00C420	|
	RTL						;$00C423	|

label_00C424:				;-----------| Normal level, submode 3, routine 2
	LDA $7B2D				;$00C424	|
	BEQ label_00C42C		;$00C427	|
	JMP label_00C1D8		;$00C429	|
label_00C42C:				;			|
	LDA #$0005				;$00C42C	|
	STA $7390				;$00C42F	|
	RTL						;$00C432	|

label_00C433:				;-----------| Normal level, submode 3, routine 4
	LDA $32EE				;$00C433	|
	INC A					;$00C436	|
	CMP #$0005				;$00C437	|
	BNE label_00C441		;$00C43A	|
	LDA #$0008				;$00C43C	|
	BRA label_00C449		;$00C43F	|

label_00C441:
	CMP #$0009				;$00C441	|
	BNE label_00C449		;$00C444	|
	LDA #$0005				;$00C446	|
label_00C449:				;			|
	STA $7A69				;$00C449	|
	LDA #$0009				;$00C44C	|
	JSL label_00EAB0		;$00C44F	|
	LDA $32EE				;$00C453	|
	CMP #$0006				;$00C456	|
	BCS label_00C462		;$00C459	|
	LDA #$0006				;$00C45B	|
	JSL label_00EAB0		;$00C45E	|
label_00C462:				;			|
	LDA #$0006				;$00C462	|
	STA $7390				;$00C465	|
	RTL						;$00C468	|

label_00C469:				;-----------| Normal level, submode 3, routine 5
	LDA $7A6D				;$00C469	|
	LDX #$7A6B				;$00C46C	|
	JSL label_00EA1E		;$00C46F	|
	LDA #$0008				;$00C473	|
	JSL label_00EAB0		;$00C476	|
	LDA #$0009				;$00C47A	|
	JSL label_00EAB0		;$00C47D	|
	LDA #$0009				;$00C481	|
	LDX $32EE				;$00C484	|
	CPX #$0007				;$00C487	|
	BNE label_00C496		;$00C48A	|
	LDA #$0001				;$00C48C	|
	JSL label_00EAB0		;$00C48F	|
	LDA #$0006				;$00C493	|
label_00C496:				;			|
	STA $7390				;$00C496	|
	RTL						;$00C499	|


label_00C49A:				;-----------| Normal level, submode 4
	LDA $32EA				;$00C49A	|
	CMP #$0003				;$00C49D	|
	BEQ label_00C4C6		;$00C4A0	|
	CMP #$0004				;$00C4A2	|
	BNE label_00C4E6		;$00C4A5	|
	LDA $7B19				;$00C4A7	|
	LDX $7B1B				;$00C4AA	|
	CPX $7B17				;$00C4AD	|
	BNE label_00C4B5		;$00C4B0	|
	CMP $7B15				;$00C4B2	|
label_00C4B5:				;			|
	BCS label_00C4E6		;$00C4B5	|
	STA $7B15				;$00C4B7	|
	STX $7B17				;$00C4BA	|
	LDA #$0007				;$00C4BD	|
	JSL label_00EAB0		;$00C4C0	|
	BRA label_00C4E6		;$00C4C4	|

label_00C4C6:
	LDA #$FFFF				;$00C4C6	|
	STA $32F2				;$00C4C9	|
	STA $7B0D				;$00C4CC	|
	SEP #$20				;$00C4CF	|
	LDA #$01				;$00C4D1	|
	STA $7B14				;$00C4D3	|
	REP #$20				;$00C4D6	|
	LDA #$0005				;$00C4D8	|
	JSL label_00EAB0		;$00C4DB	|
	LDA #$0001				;$00C4DF	|
	JSL label_00EAB0		;$00C4E2	|
label_00C4E6:				;			|
	LDA #$0008				;$00C4E6	|
	STA $7390				;$00C4E9	|
	RTL						;$00C4EC	|


label_00C4ED:				;-----------| Normal level, submode 2
	JSL label_00D87F		;$00C4ED	|
	LDA #$0004				;$00C4F1	|
	STA $7390				;$00C4F4	|
	JSL label_00BC66		;$00C4F7	|
	LDA $7396				;$00C4FB	|
	BEQ label_00C507		;$00C4FE	|
	JSL label_00D87F		;$00C500	|
	JMP label_00C1DC		;$00C504	|

label_00C507:
	LDA #$0000				;$00C507	|
	JSL label_00EC42		;$00C50A	|
	LDA #$0001				;$00C50E	|
	STA $7390				;$00C511	|
	INC $7396				;$00C514	|
	RTL						;$00C517	|


label_00C518:				;-----------| Normal level, submode 1
	JSL label_00D883		;$00C518	|
	LDA #$0018				;$00C51C	|
	STA $6010				;$00C51F	|
	LDA #$0040				;$00C522	|
	STA $6012				;$00C525	|
	LDA #$0003				;$00C528	|
	STA $6000				;$00C52B	|
	TAX						;$00C52E	|
	TAY						;$00C52F	|
	LDA #$0000				;$00C530	|
	JSL label_008E8C		;$00C533	|
	LDA #$0000				;$00C537	|
	STA $73AE				;$00C53A	|
	LDA $32F2				;$00C53D	|
	STA $73B4				;$00C540	|
	SEP #$20				;$00C543	|
	LDA $3078				;$00C545	|
	STA $73B6				;$00C548	|
	LDA $3079				;$00C54B	|
	STA $73B7				;$00C54E	|
	LDA $307A				;$00C551	|
	STA $73B8				;$00C554	|
	LDA #$E0				;$00C557	|
	STA $002132				;$00C559	|
	LDA #$20				;$00C55D	|
	STA $3078				;$00C55F	|
	ASL A					;$00C562	|
	STA $3079				;$00C563	|
	ASL A					;$00C566	|
	STA $307A				;$00C567	|
	REP #$20				;$00C56A	|
	STZ $7392				;$00C56C	|
label_00C56F:				;			|
	JSL label_00BCDE		;$00C56F	|
	LDA $7392				;$00C573	|
	BEQ label_00C56F		;$00C576	|
	LDX #$0016				;$00C578	|
label_00C57B:				;			|
	INX						;$00C57B	|
	INX						;$00C57C	|
	CPX #$007A				;$00C57D	|
	BEQ label_00C59C		;$00C580	|
	LDA $623C,X				;$00C582	|
	CMP #$0000				;$00C585	|
	BEQ label_00C594		;$00C588	|
	CMP #$0010				;$00C58A	|
	BEQ label_00C594		;$00C58D	|
	CMP #$00B3				;$00C58F	|
	BNE label_00C57B		;$00C592	|
label_00C594:				;			|
	PHX						;$00C594	|
	JSL label_009142		;$00C595	|
	PLX						;$00C599	|
	BRA label_00C57B		;$00C59A	|

label_00C59C:
	JSL label_00D883		;$00C59C	|
	LDA $73B4				;$00C5A0	|
	STA $32F2				;$00C5A3	|
	ASL A					;$00C5A6	|
	ASL A					;$00C5A7	|
	STA $32F4				;$00C5A8	|
	JSL $018088				;$00C5AB	|
	LDA #$8078				;$00C5AF	|\ 
	LDX #$0001				;$00C5B2	|| Execute $018078 on the SNES.
	JSL SA1_ExecuteSNES		;$00C5B5	|/
	SEP #$20				;$00C5B9	|
	LDA $73B6				;$00C5BB	|
	STA $3078				;$00C5BE	|
	LDA $73B7				;$00C5C1	|
	STA $3079				;$00C5C4	|
	LDA $73B8				;$00C5C7	|
	STA $307A				;$00C5CA	|
	ORA $3079				;$00C5CD	|
	ORA $3078				;$00C5D0	|
	STA $002132				;$00C5D3	|
	REP #$20				;$00C5D7	|
	LDA #$0000				;$00C5D9	|
	STA $7394				;$00C5DC	|
	STZ $7392				;$00C5DF	|
	JMP label_00C219		;$00C5E2	|



label_00C5E5:				;-----------| Game Mode 04 - Game Over
	LDA #$0007				;$00C5E5	|
	JSL label_00BD70		;$00C5E8	|
	STZ $7392				;$00C5EC	|
label_00C5EF:				;			|
	JSL label_00BCDE		;$00C5EF	|
	LDA $7392				;$00C5F3	|
	BEQ label_00C5EF		;$00C5F6	|
	JSL label_00CC67		;$00C5F8	|
	RTL						;$00C5FC	|



label_00C5FD:				;-----------| Game Mode 09 - Dynablade cannon game, Milky Way level end room
	JSL $03A27E				;$00C5FD	|
	LDA #$0008				;$00C601	|
	JSL label_00BD70		;$00C604	|
	JSL label_00D93B		;$00C608	|
	JSL label_00D9C4		;$00C60C	|
	INC $7B57				;$00C610	|
	LDA $32EA				;$00C613	|
	STA $73B0				;$00C616	|
	LDA $32EE				;$00C619	|
	STA $73B2				;$00C61C	|
	STZ $7392				;$00C61F	|
	LDA #$FFFF				;$00C622	|
	STA $7B33				;$00C625	|
label_00C628:				;			|
	JSL label_00BD0E		;$00C628	|
	LDA $32EA				;$00C62C	|
	CMP #$0001				;$00C62F	|
	BEQ label_00C63E		;$00C632	|
	JSL label_00CBCC		;$00C634	|
	BEQ label_00C63E		;$00C638	|
	JSL $CF98A9				;$00C63A	|
label_00C63E:				;			|
	LDA $7392				;$00C63E	|
	BEQ label_00C628		;$00C641	|
	STZ $7B57				;$00C643	|
	LDA $73B0				;$00C646	|
	STA $32EA				;$00C649	|
	LDA #$0006				;$00C64C	|
	STA $7390				;$00C64F	|
	RTL						;$00C652	|




label_00C653:				;-----------| Game Mode 02 - "Is this your first time?"
	LDA #$0001				;$00C653	|
	STA $770B				;$00C656	|
	STA $7ADF				;$00C659	|
	STA $73A6				;$00C65C	|
	LDA $7B25				;$00C65F	|
	BEQ label_00C672		;$00C662	|
	LDX $32EA				;$00C664	|
	LDA.l DATA_00C73F,X		;$00C667	|
	AND #$00FF				;$00C66B	|
	STA $7390				;$00C66E	|
	RTL						;$00C671	|

label_00C672:
	LDA #$0001				;$00C672	|
	STA $7396				;$00C675	|
	STZ $7A95				;$00C678	|
	LDA $32EE				;$00C67B	|
	STA $73B2				;$00C67E	|
	LDA $32F2				;$00C681	|
	STA $73B4				;$00C684	|
	LDX $32EA				;$00C687	|
	STX $73B0				;$00C68A	|
	LDA #$0008				;$00C68D	|
	LDY #$0000				;$00C690	|
	JSL label_00DA97		;$00C693	|
	JSL $CA0000				;$00C697	|
	JSL label_00D93B		;$00C69B	|
	JSL label_00D9C4		;$00C69F	|
	STZ $7394				;$00C6A3	|
	JSL label_00DB92		;$00C6A6	|
	JSL label_00DBB0		;$00C6AA	|
label_00C6AE:				;			|
	LDA #$0004				;$00C6AE	|
	JSL label_00BD70		;$00C6B1	|
	INC $7A97				;$00C6B5	|
	SEP #$20				;$00C6B8	|
	LDA $32EE				;$00C6BA	|
	STA $7A96				;$00C6BD	|
	REP #$20				;$00C6C0	|
	LDA $7A95				;$00C6C2	|
	AND #$7FFF				;$00C6C5	|
	STA $7A95				;$00C6C8	|
	STZ $7392				;$00C6CB	|
	LDA #$0001				;$00C6CE	|
	STA $770B				;$00C6D1	|
	STZ $7B33				;$00C6D4	|
	STZ $770D				;$00C6D7	|
	STZ $7A9B				;$00C6DA	|
label_00C6DD:				;			|
	JSL label_00BCDE		;$00C6DD	|
	LDA $7A9B				;$00C6E1	|
	AND #$00FF				;$00C6E4	|
	BEQ label_00C6F6		;$00C6E7	|
	JSL $CF98A9				;$00C6E9	|
	LDA $7A9B				;$00C6ED	|
	AND #$FF00				;$00C6F0	|
	STA $7A9B				;$00C6F3	|
label_00C6F6:				;			|
	LDA $7392				;$00C6F6	|
	BEQ label_00C6DD		;$00C6F9	|
	LDA $7A95				;$00C6FB	|
	BPL label_00C6AE		;$00C6FE	|
	STZ $7A97				;$00C700	|
	STZ $7A95				;$00C703	|
	JSL label_00DB92		;$00C706	|
	JSL label_00DBB0		;$00C70A	|
	LDX $73B0				;$00C70E	|
	LDA.l DATA_00C73F,X		;$00C711	|
	AND #$00FF				;$00C715	|
	LDX $7396				;$00C718	|
	BNE label_00C723		;$00C71B	|
	LDA #$0005				;$00C71D	|
	INC $7396				;$00C720	|
label_00C723:				;			|
	STA $7390				;$00C723	|
	STZ $7A99				;$00C726	|
	LDA #$0001				;$00C729	|
	STA $7ADF				;$00C72C	|
	STA $73A6				;$00C72F	|
	LDA $73B0				;$00C732	|
	LDX $73B2				;$00C735	|
	LDY $73B4				;$00C738	|
	JML label_00DA97		;$00C73B	|

DATA_00C73F:
	db $03,$06,$03,$03,$03,$06,$01


label_00C746:				;-----------| Game Mode 0A - Sound test
	LDA #$000B				;$00C746	|
	JSL label_00BD70		;$00C749	|
	STZ $7392				;$00C74D	|
label_00C750:				;			|
	JSL label_00BCDE		;$00C750	|
	LDA $7392				;$00C754	|
	BEQ label_00C750		;$00C757	|
	LDA #$0001				;$00C759	|
	STA $7390				;$00C75C	|
	RTL						;$00C75F	|




label_00C760:				;-----------| Game Mode 0B - Minigame (Megaton, Samurai)
	LDA #$0002				;$00C760	|
	JSL label_00BD70		;$00C763	|
	STZ $7392				;$00C767	|
label_00C76A:				;			|
	JSL label_00BCDE		;$00C76A	|
	LDA $7392				;$00C76E	|
	BEQ label_00C76A		;$00C771	|
	LDA #$0001				;$00C773	|
	STA $7390				;$00C776	|
	RTL						;$00C779	|




label_00C77A:				;-----------| Game Mode 0C - The Arena
	LDA #$0001				;$00C77A	|
	STA $73A6				;$00C77D	|
	STZ $7AA5				;$00C780	|
	STZ $32EE				;$00C783	|
	STZ $32F2				;$00C786	|
	JSL label_00D93B		;$00C789	|
label_00C78D:				;			|
	JSL label_00D87F		;$00C78D	|
	LDA #$000C				;$00C791	|
	JSL label_00BD70		;$00C794	|
	JSL label_00D9C4		;$00C798	|
	STZ $7392				;$00C79C	|
label_00C79F:				;			|
	JSL label_00BCDE		;$00C79F	|
	JSL label_00CBCC		;$00C7A3	|
	BEQ label_00C7D3		;$00C7A7	|
	LDA $7B35				;$00C7A9	|
	ORA $7368				;$00C7AC	|
	BNE label_00C7D3		;$00C7AF	|
	LDA $32EA				;$00C7B1	|
	CMP #$0006				;$00C7B4	|
	BNE label_00C7C9		;$00C7B7	|
	LDA $32EE				;$00C7B9	|
	CMP #$0000				;$00C7BC	|
	BNE label_00C7C9		;$00C7BF	|
	LDA $32F2				;$00C7C1	|
	CMP #$0002				;$00C7C4	|
	BEQ label_00C7D3		;$00C7C7	|
label_00C7C9:				;			|
	LDA #$0001				;$00C7C9	|
	STA $770D				;$00C7CC	|
	JSL $CF98A9				;$00C7CF	|
label_00C7D3:				;			|
	LDA $7392				;$00C7D3	|
	BEQ label_00C79F		;$00C7D6	|
	LDA $7A9D				;$00C7D8	|
	BPL label_00C78D		;$00C7DB	|
	STZ $7A9D				;$00C7DD	|
	STZ $7B33				;$00C7E0	|
	LDA #$0001				;$00C7E3	|
	STA $73A6				;$00C7E6	|
	LDA #$0001				;$00C7E9	|
	STA $7390				;$00C7EC	|
	RTL						;$00C7EF	|



label_00C7F0:				;-----------| Game Mode 0F - Main title screen subgame preview
	JSL UpdateSprSize		;$00C7F0	|
	JSL label_00DB67		;$00C7F4	|
	SEP #$20				;$00C7F8	|
	STZ $3092				;$00C7FA	|
	STZ $3062				;$00C7FD	|
	REP #$20				;$00C800	|
	JSL label_00D87F		;$00C802	|
	JSR label_00C9C1		;$00C806	|
	LDA.l DATA_00C9D1+1,X	;$00C809	|
	AND #$00FF				;$00C80D	|
	STA $32EA				;$00C810	|
	ASL A					;$00C813	|
	STA $32EC				;$00C814	|
	LDA.l DATA_00C9D1+2,X	;$00C817	|
	AND #$00FF				;$00C81B	|
	STA $32EE				;$00C81E	|
	ASL A					;$00C821	|
	STA $32F0				;$00C822	|
	LDA.l DATA_00C9D1+3,X	;$00C825	|
	AND #$00FF				;$00C829	|
	LDY $32EA				;$00C82C	|
	CPY #$0002				;$00C82F	|
	BNE label_00C839		;$00C832	|
	STA $7B2D				;$00C834	|
	BRA label_00C841		;$00C837	|

label_00C839:
	STA $32F2				;$00C839	|
	ASL A					;$00C83C	|
	ASL A					;$00C83D	|
	STA $32F4				;$00C83E	|
label_00C841:				;			|
	LDA.l DATA_00C9D1,X		;$00C841	|\ 
	AND #$00FF				;$00C845	||
	CMP #$0003				;$00C848	||\ Hardlock the game if outside the defined range.
  - BCS -					;$00C84B	||/
	ASL A					;$00C84D	||
	TAX						;$00C84E	||
	JMP (label_00C852,X)	;$00C84F	|/

label_00C852:
	dw label_00C858			; 00
	dw label_00C86B			; 01
	dw label_00C963			; 02

label_00C858:				;-----------| Title screen subroutine 0
	LDA #$0005				;$00C858	|
	STA $7390				;$00C85B	|
	STA $7A8B				;$00C85E	|
	STZ $7A89				;$00C861	|
	JSL label_00BC66		;$00C864	|
	JMP label_00C973		;$00C868	|

label_00C86B:				;-----------| Title screen subroutine 1
	LDA #$CAFD				;$00C86B	|\ 
	LDX #$0000				;$00C86E	|| Execute $00CAFD on the SNES.
	JSL SA1_ExecuteSNES		;$00C871	|/
	JSR label_00C9C1		;$00C875	|
	LDA.l DATA_00C9D1+5,X	;$00C878	|
	AND #$00FF				;$00C87C	|
	STA $750B				;$00C87F	|
	LDA.l DATA_00C9D1+6,X	;$00C882	|
	AND #$00FF				;$00C886	|
	STA $750D				;$00C889	|
	JSL label_00D93B		;$00C88C	|
	JSL label_00D9C4		;$00C890	|
	LDA #$00FF				;$00C894	|
	JSL label_00CE67		;$00C897	|
	JSR label_00C9C1		;$00C89B	|
	LDA.l DATA_00C9D1+7,X	;$00C89E	|
	BMI label_00C8B4		;$00C8A2	|
	STA $330C				;$00C8A4	|
	LDA.l DATA_00C9D1+9,X	;$00C8A7	|
	STA $3310				;$00C8AB	|
	LDA #$0002				;$00C8AE	|
	STA $332A				;$00C8B1	|
label_00C8B4:				;			|
	LDA #$0001				;$00C8B4	|
	STA $331A				;$00C8B7	|
	JSL $018000				;$00C8BA	|
	JSL $D4FB90				;$00C8BE	|
	LDA #$0001				;$00C8C2	|
	STA $73A6				;$00C8C5	|
	STA $7392				;$00C8C8	|
	JSL label_00BCDE		;$00C8CB	|
	JSL label_00BCDE		;$00C8CF	|
	JSL label_00BCDE		;$00C8D3	|
	STZ $73A6				;$00C8D7	|
	STZ $7394				;$00C8DA	|
	JSL label_00CBF4		;$00C8DD	|
	STZ $7392				;$00C8E1	|
	STZ $7396				;$00C8E4	|
	STZ $7390				;$00C8E7	|
	JSR label_00C9C1		;$00C8EA	|
	LDA.l DATA_00C9D1+4,X	;$00C8ED	|
	AND #$00FF				;$00C8F1	|
	CMP #$00FF				;$00C8F4	|
	BNE label_00C8FE		;$00C8F7	|
	LDA #$FFFF				;$00C8F9	|
	BRA label_00C908		;$00C8FC	|

label_00C8FE:
	LDX #$003C				;$00C8FE	|
	JSL label_00A565		;$00C901	|
	LDA $32E4				;$00C905	|
label_00C908:				;			|
	PHA						;$00C908	|
	JSL UpdtLyrsCtrl		;$00C909	|
	LDA $32C4				;$00C90D	|
	AND #$FFF0				;$00C910	|
	BNE label_00C95C		;$00C913	|
	LDA #$CB1B				;$00C915	|\ 
	LDX #$0000				;$00C918	|| Execute $00CB1B on the SNES.
	JSL SA1_ExecuteSNES		;$00C91B	|/
	STZ $32C6				;$00C91F	|
	STZ $32D6				;$00C922	|
	JSL $05971F				;$00C925	|
	JSR label_00BD3B		;$00C929	|
	JSL $03ECEB				;$00C92C	|
	JSL $048184				;$00C930	|
	JSR label_00BD60		;$00C934	|
	JSL label_008FF2		;$00C937	|
	LDA #$DFC6				;$00C93B	|\ 
	LDX #$0001				;$00C93E	|| Execute $01DFC6 on the SNES.
	JSL SA1_ExecuteSNES		;$00C941	|/
	PLA						;$00C945	|
	BPL label_00C94F		;$00C946	|
	LDA $7392				;$00C948	|
	BEQ label_00C908		;$00C94B	|
	BRA label_00C952		;$00C94D	|

label_00C94F:
	DEC A					;$00C94F	|
	BNE label_00C908		;$00C950	|
label_00C952:				;			|
	JSL label_00CC7B		;$00C952	|
	STZ $7396				;$00C956	|
	JMP label_00C973		;$00C959	|

label_00C95C:
	PLA						;$00C95C	|
	INC $7396				;$00C95D	|
	JMP label_00C973		;$00C960	|


label_00C963:				;-----------| Title screen subroutine 2
	LDA $32EA				;$00C963	|
	STA $73AA				;$00C966	|
	LDA #$0010				;$00C969	|
	STA $7390				;$00C96C	|
	JSL label_00BC66		;$00C96F	|
label_00C973:				;			|
	JSR label_00C9C1		;$00C973	|
	LDA.l DATA_00C9D1+11,X	;$00C976	|\ 
	AND #$00FF				;$00C97A	||
	CMP #$0004				;$00C97D	||\ Hardlock if outside the defined range. 
  - BCS -					;$00C980	||/
	ASL A					;$00C982	||
	TAX						;$00C983	||
	JMP (label_00C987,X)	;$00C984	|/

label_00C987:
	dw label_00C9AB
	dw label_00C9BD
	dw label_00C98F
	dw label_00C9B6

label_00C98F:				;-----------| Title screen subroutine 2-2
	SEP #$20				;$00C98F	|
	DEC $739D				;$00C991	|
	REP #$20				;$00C994	|
	LDA $739D				;$00C996	|
	AND #$00FF				;$00C999	|
	BEQ $1F					;$00C99C	|
	LDA $739C				;$00C99E	|
	AND #$FF00				;$00C9A1	|
	STA $739C				;$00C9A4	|
	STZ $739E				;$00C9A7	|
	RTL						;$00C9AA	|

label_00C9AB:				;-----------| Title screen subroutine 2-0
	INC $739C				;$00C9AB	|
	LDA $7396				;$00C9AE	|
	BNE label_00C9C0		;$00C9B1	|
	JMP label_00C7F0		;$00C9B3	|

label_00C9B6:				;-----------| Title screen subroutine 2-3
	LDA #$0200				;$00C9B6	|
	STA $739C				;$00C9B9	|
	RTL						;$00C9BC	|

label_00C9BD:				;-----------| Title screen subroutine 2-1
	INC $739C				;$00C9BD	|
label_00C9C0:
	RTL						;$00C9C0	|


label_00C9C1:				;-----------| Title screen subroutine to get an index to the below table.
	LDA $739C				;$00C9C1	|\ 
	AND #$00FF				;$00C9C4	||
	ASL A					;$00C9C7	||
	ASL A					;$00C9C8	|| Multiply by 12, and return in X.
	STA $28					;$00C9C9	||
	ASL A					;$00C9CB	||
	CLC						;$00C9CC	||
	ADC $28					;$00C9CD	||
	TAX						;$00C9CF	|/
	RTS						;$00C9D0	|

DATA_00C9D1:				;$00C9D1	| Table used for the title screen. 12 bytes per row.
	db $00,$00,$00,$00,$FF,$00,$00,$FF,$FF,$FF,$FF,$00
	db $01,$00,$00,$01,$0C,$00,$00,$2B,$00,$2A,$00,$00
	db $01,$00,$00,$05,$0A,$08,$0B,$3C,$00,$54,$00,$00
	db $01,$00,$02,$06,$0C,$07,$05,$84,$00,$34,$02,$01
	db $00,$01,$00,$00,$FF,$00,$00,$FF,$FF,$FF,$FF,$00
	db $01,$01,$03,$06,$0C,$04,$12,$3C,$00,$84,$00,$00
	db $01,$01,$06,$00,$0E,$00,$01,$3C,$00,$6C,$00,$00
	db $01,$01,$04,$02,$0C,$03,$09,$00,$00,$00,$00,$01
	db $02,$01,$00,$00,$FF,$00,$00,$FF,$FF,$FF,$FF,$00
	db $00,$02,$00,$00,$FF,$00,$00,$FF,$FF,$FF,$FF,$00
	db $01,$02,$01,$01,$0A,$00,$00,$54,$00,$84,$00,$00
	db $01,$02,$02,$00,$10,$00,$00,$CC,$03,$E4,$00,$01
	db $00,$03,$00,$00,$FF,$00,$00,$FF,$FF,$FF,$FF,$00
	db $01,$03,$00,$02,$0C,$13,$00,$24,$00,$9C,$00,$00
	db $01,$03,$00,$3A,$0C,$17,$00,$DC,$02,$B4,$00,$00
	db $01,$03,$00,$37,$0A,$0A,$0C,$3C,$00,$9C,$00,$01
	db $02,$00,$00,$00,$FF,$00,$00,$FF,$FF,$FF,$FF,$00
	db $00,$04,$00,$00,$FF,$00,$00,$FF,$FF,$FF,$FF,$00
	db $01,$04,$00,$02,$FF,$0F,$02,$7C,$02,$6C,$00,$00
	db $01,$04,$04,$00,$0C,$01,$0D,$30,$00,$18,$00,$00
	db $01,$04,$03,$01,$0C,$11,$04,$3C,$00,$3C,$00,$02
	db $00,$05,$00,$00,$FF,$00,$00,$FF,$FF,$FF,$FF,$00
	db $01,$05,$06,$00,$07,$00,$10,$FF,$FF,$FF,$FF,$00
	db $01,$05,$06,$07,$0A,$09,$03,$3C,$00,$9C,$00,$00
	db $01,$05,$08,$00,$0A,$FF,$00,$22,$00,$98,$00,$03


label_00CAFD:				;-----------| Routine executed on the SNES.
	STZ $1873				;$00CAFD	|
	LDA #$FFFF				;$00CB00	|
	STA $1871				;$00CB03	|
	STZ $43					;$00CB06	|
	STZ $3094				;$00CB08	|
	LDA $739C				;$00CB0B	|
	AND #$00FF				;$00CB0E	|
	ASL A					;$00CB11	|
	TAX						;$00CB12	|
	LDA $D3F422,X			;$00CB13	|
	STA $739E				;$00CB17	|
	RTL						;$00CB1A	|

label_00CB1B:				;-----------| Routine executed on the SNES.
	LDA $1873				;$00CB1B	|
	BEQ label_00CB25		;$00CB1E	|
	DEC $1873				;$00CB20	|
	BNE label_00CB52		;$00CB23	|
label_00CB25:				;			|
	LDX $739E				;$00CB25	|
	LDA $D3F454,X			;$00CB28	|
	AND #$00FF				;$00CB2C	|
	STA $1873				;$00CB2F	|
	INX						;$00CB32	|
	LDA $D3F454,X			;$00CB33	|
	STA $32C4				;$00CB37	|
	INX						;$00CB3A	|
	INX						;$00CB3B	|
	STX $739E				;$00CB3C	|
	LDA $1871				;$00CB3F	|
	EOR #$FFF0				;$00CB42	|
	AND $32C4				;$00CB45	|
	STA $32D4				;$00CB48	|
	LDA $32C4				;$00CB4B	|
	STA $1871				;$00CB4E	|
	RTL						;$00CB51	|

label_00CB52:
	LDA $1871				;$00CB52	|
	STA $32C4				;$00CB55	|
	STZ $32D4				;$00CB58	|
	RTL						;$00CB5B	|



label_00CB5C:				;-----------| Game Mode 10 - Main title screen minigame preview
	LDA #$0002				;$00CB5C	|
	JSL label_00BD70		;$00CB5F	|
	LDA #$CAFD				;$00CB63	|
	LDX #$0000				;$00CB66	|
	JSL SA1_ExecuteSNES		;$00CB69	|
	STZ $7392				;$00CB6D	|
	STZ $7396				;$00CB70	|
label_00CB73:				;			|
	JSL UpdtLyrsCtrl		;$00CB73	|
	LDA $32C4				;$00CB77	|
	AND #$FFF0				;$00CB7A	|
	BNE label_00CBA0		;$00CB7D	|
	LDA #$CB1B				;$00CB7F	|\ 
	LDX #$0000				;$00CB82	|| Execute $00CB1B on the SNES.
	JSL SA1_ExecuteSNES		;$00CB85	|/
	JSR label_00BD3B		;$00CB89	|
	JSL label_008FF2		;$00CB8C	|
	LDA #$DFC6				;$00CB90	|\ 
	LDX #$0001				;$00CB93	|| Execute $00DFC6 on the SNES.
	JSL SA1_ExecuteSNES		;$00CB96	|/
	LDA $7392				;$00CB9A	|
	BEQ label_00CB73		;$00CB9D	|
	RTL						;$00CB9F	|

label_00CBA0:
	INC $7396				;$00CBA0	|
	RTL						;$00CBA3	|



label_00CBA4:				;-----------| Game Mode 07 - Subgame opening cutscene
	LDA #$0009				;$00CBA4	|
	JSL label_00BD70		;$00CBA7	|
	STZ $7392				;$00CBAB	|
	STZ $7396				;$00CBAE	|
label_00CBB1:				;			|
	JSL label_00BCDE		;$00CBB1	|
	LDA $739A				;$00CBB5	|
	BEQ label_00CBC6		;$00CBB8	|
	LDA $32C4				;$00CBBA	|
	AND #$FFF0				;$00CBBD	|
	BEQ label_00CBC6		;$00CBC0	|
	INC $7396				;$00CBC2	|
	RTL						;$00CBC5	|

label_00CBC6:
	LDA $7392				;$00CBC6	|
	BEQ label_00CBB1		;$00CBC9	|
	RTL						;$00CBCB	|



label_00CBCC:				;-----------|
	LDA $32EA				;$00CBCC	|
	CMP #$0003				;$00CBCF	|
	BEQ label_00CBD6		;$00CBD2	|
	BRA label_00CBDB		;$00CBD4	|

label_00CBD6:
	LDA #$1040				;$00CBD6	|
	BRA label_00CBDE		;$00CBD9	|

label_00CBDB:
	LDA #$1000				;$00CBDB	|
label_00CBDE:				;			|
	STA $00					;$00CBDE	|
	LDA $6240				;$00CBE0	|
	BPL label_00CBEB		;$00CBE3	|
	LDA $32D4				;$00CBE5	|
	AND $00					;$00CBE8	|
	RTL						;$00CBEA	|

label_00CBEB:
	LDA $32D4				;$00CBEB	|
	ORA $32D6				;$00CBEE	|
	AND $00					;$00CBF1	|
	RTL						;$00CBF3	|


label_00CBF4:				;-----------|
	LDA #$0010				;$00CBF4	|
label_00CBF7:				;			|
	PHA						;$00CBF7	|
	JSL label_009FCD		;$00CBF8	|
	JSL UpdtLyrsCtrl		;$00CBFC	|
	LDA $739A				;$00CC00	|
	BEQ label_00CC11		;$00CC03	|
	STZ $32C4				;$00CC05	|
	STZ $32D4				;$00CC08	|
	STZ $32C6				;$00CC0B	|
	STZ $32D6				;$00CC0E	|
label_00CC11:				;			|
	JSL $05971F				;$00CC11	|
	JSR label_00BD3B		;$00CC15	|
	JSL $03ECEB				;$00CC18	|
	JSL $048184				;$00CC1C	|
	JSR label_00BD60		;$00CC20	|
	JSL label_008FF2		;$00CC23	|
	LDA #$DFC6				;$00CC27	|\ 
	LDX #$0001				;$00CC2A	|| Execute $01DFC6 on the SNES.
	JSL SA1_ExecuteSNES		;$00CC2D	|/
	PLA						;$00CC31	|
	DEC A					;$00CC32	|
	BNE label_00CBF7		;$00CC33	|
	RTL						;$00CC35	|


label_00CC36:				;-----------|
	JSL label_00D003		;$00CC36	|
	LDA #$0000				;$00CC3A	|
	JSL label_00CE67		;$00CC3D	|
	LDA #$0010				;$00CC41	|
label_00CC44:				;			|
	PHA						;$00CC44	|
	LDA $33CC				;$00CC45	|
	AND #$00FF				;$00CC48	|
	CLC						;$00CC4B	|
	ADC #$000F				;$00CC4C	|
	JSL label_00CE67		;$00CC4F	|
	JSL label_009FCD		;$00CC53	|
	JSL label_00BCDE		;$00CC57	|
	PLA						;$00CC5B	|
	DEC A					;$00CC5C	|
	BNE label_00CC44		;$00CC5D	|
	LDA #$00FF				;$00CC5F	|
	JSL label_00CE67		;$00CC62	|
	RTL						;$00CC66	|


label_00CC67:				;-----------|
	LDA #$0010				;$00CC67	|
label_00CC6A:				;			|
	PHA						;$00CC6A	|
	JSL label_009FDD		;$00CC6B	|
	JSL label_00BCDE		;$00CC6F	|
	PLA						;$00CC73	|
	DEC A					;$00CC74	|
	BNE label_00CC6A		;$00CC75	|
	JML UpdateSprSize		;$00CC77	|


label_00CC7B:				;-----------|
	LDA #$0010				;$00CC7B	|
label_00CC7E:				;			|
	PHA						;$00CC7E	|
	LDA $33CC				;$00CC7F	|
	BEQ label_00CC8F		;$00CC82	|
	AND #$00FF				;$00CC84	|
	SEC						;$00CC87	|
	SBC #$000F				;$00CC88	|
	JSL label_00CE67		;$00CC8B	|
label_00CC8F:				;			|
	JSL label_009FDD		;$00CC8F	|
	JSL label_00BCDE		;$00CC93	|
	PLA						;$00CC97	|
	DEC A					;$00CC98	|
	BNE label_00CC7E		;$00CC99	|
	LDA #$0000				;$00CC9B	|
	JSL label_00D003		;$00CC9E	|
	JSL UpdtLyrsCtrl		;$00CCA2	|
	LDA #$00FF				;$00CCA6	|
	JSL label_00CE67		;$00CCA9	|
	JML UpdateSprSize		;$00CCAD	|





ChkStartErrs:				;-----------| Routine to check for controller/system errors on startup, and display a message if so.
	STZ $3010				;$00CCB1	|\ 
  .waitForNMI:				;			|| Wait for NMI to fire.
	LDA $3010				;$00CCB4	||
	BEQ .waitForNMI			;$00CCB7	|/
	LDA #$0073				;$00CCB9	|\ 
  .wasteTime:				;			|| Waste some extra time (waiting for autojoypad read?).
	DEC A					;$00CCBC	||
	BNE .wasteTime			;$00CCBD	|/
	LDA $32C4				;$00CCBF	|\ 
	AND #$000F				;$00CCC2	|| If either controller has invalid inputs
	BNE .invalidContr		;$00CCC5	||  (the four unused bits on a normal controller),
	LDA $32C6				;$00CCC7	||  branch to show error.
	AND #$000F				;$00CCCA	||
	BNE .invalidContr		;$00CCCD	|| Also show the error if a multitap is detected.
	JSR CheckForMultitap	;$00CCCF	||
	AND #$00C0				;$00CCD2	||
	BNE .invalidContr		;$00CCD5	|/
	LDA $213F				;$00CCD7	|\ 
	AND #$0010				;$00CCDA	|| If the PAL switch is set, branch to show error.
	BNE .invalidConsole		;$00CCDD	|/
	RTL						;$00CCDF	|

  .invalidContr:			;```````````| Error screen: non-standard controller is plugged in.
	LDX #$06A0				;$00CCE0	|
	BRA .prepMsg			;$00CCE3	|
  .invalidConsole:			;```````````| Error screen: trying to play PAL game on NTSC console.
	LDX #$06A2				;$00CCE5	|
  .prepMsg:					;			|
	PHX						;$00CCE8	|
	JSL UpdateSprSize		;$00CCE9	| Update sprite tile sizes.
	LDA #$0000				;$00CCED	|\ 
	LDX #$0000				;$00CCF0	|| Layer 2 tilemap at VRAM address $3C00,
	LDY #$3C00				;$00CCF3	||  and GFX files at $0000.
	JSL SetupLayer2VRAM		;$00CCF6	|/
	LDA #$0000				;$00CCFA	|\ 
	LDX #$4000				;$00CCFD	|| Layer 3 tilemap at VRAM address $5000,
	LDY #$5000				;$00CD00	||  and GFX files at $4000.
	JSL SetupLayer3VRAM		;$00CD03	|/
	LDA #$0009				;$00CD07	|\ Mode 1 with Layer 3 priority.
	JSL UpdateSNESMode		;$00CD0A	|/
	LDX.w #.ErrorDMAs>>16	;$00CD0E	|\ 
	LDA.w #.ErrorDMAs		;$00CD11	|| Load the DMA table at $00CD70.
	JSL LoadDMATable		;$00CD14	|/
	LDA #$B360				;$00CD18	|\ 
	LDX #$00ED				;$00CD1B	|| Write a palette data from $EDB360
	LDY #$3050				;$00CD1E	||  to colors $30-$7F in the standard palette.
	JSL WritePal			;$00CD21	|/
	JSL label_00DB54		;$00CD25	|
	LDA #$000F				;$00CD29	|\ Set at maximum brightness.
	STA $30A1				;$00CD2C	|/
	STZ $39					;$00CD2F	|
	STZ $3B					;$00CD31	|
	STZ $3F					;$00CD33	|
	STZ $41					;$00CD35	|
	JSL UpdtLyrsCtrlBrght	;$00CD37	| Transfer screen brightness and fetch controller inputs.
	PLX						;$00CD3B	|
	LDA #$0014				;$00CD3C	|
	JSL $01DE76				;$00CD3F	|
	SEP #$20				;$00CD43	|
	LDA #$06				;$00CD45	|\ Main screen: layers 2/3
	STA $3072				;$00CD47	|/
	LDA #$00				;$00CD4A	|\ 
	STA $3076				;$00CD4C	||
	LDA #$82				;$00CD4F	||
	STA $3077				;$00CD51	||
	LDA #$30				;$00CD54	|| Enable color math on layer 2, subtracting #101010 from it.
	STA $3078				;$00CD56	||
	LDA #$50				;$00CD59	||
	STA $3079				;$00CD5B	||
	LDA #$90				;$00CD5E	||
	STA $307A				;$00CD60	|/
	REP #$20				;$00CD63	|
  .loop:					;			|
	JSL UpdtLyrsCtrl		;$00CD65	| Update controller inputs and layer positions.
	JSL $01DFC6				;$00CD69	|
	JMP .loop				;$00CD6D	|
	
  .ErrorDMAs:				;$00CD70	| Table of DMA data for the startup warning screen, specifically for graphics.
	db $83 : dw $0800 : dl $E73F79 : dw $0100	; 2-byte DMA to decompress 0x800 bytes from $E73F79 to $0100
	db $89 : dw $0400 : dl $EF9BF6 : dw $3C00	;  Lower DMA to decompress 0x400 bytes from $EF9BF6 to $3C00
	db $0F : dw $0400 : dl $7E2400 : dw $3C00	;  Upper DMA to write 0x400 bytes from $7E2400 to $3C00 (duplicates the data from $E73F79)
	db $FF





CheckForMultitap:			;-----------| Routine to check if a multitap is plugged in.
	PHP						;$00CD89	|  If so, returns the port plugged into in $08/A: [12------]
	SEP #$30				;$00CD8A	|
	STZ $08					;$00CD8C	|
  .waitForJoy:				;			|
	LDA $4212				;$00CD8E	|\ 
	AND #$01				;$00CD91	|| Wait for auto-joypad read.
	BNE .waitForJoy			;$00CD93	|/
	STZ $4016				;$00CD95	|\ 
	LDA #$01				;$00CD98	|| Latch the controller data.
	STA $4016				;$00CD9A	|/
	LDX #$08				;$00CD9D	|\ 
  .readLoop1:				;			||
	LDA $4016				;$00CD9F	||
	LSR A					;$00CDA2	||
	LSR A					;$00CDA3	|| Get the lower byte of the signature for port 1/2.
	ROL $00					;$00CDA4	|| If the multitap is plugged in, this will be 0xFF.
	LDA $4017				;$00CDA6	||
	LSR A					;$00CDA9	||
	LSR A					;$00CDAA	||
	ROL $02					;$00CDAB	||
	DEX						;$00CDAD	||
	BNE .readLoop1			;$00CDAE	|/
	STZ $4016				;$00CDB0	|
	LDX #$08				;$00CDB3	|\ 
  .readLoop2:				;			||
	LDA $4016				;$00CDB5	||
	LSR A					;$00CDB8	||
	LSR A					;$00CDB9	|| Get the upper byte of the signature for port 1/2.
	ROL $04					;$00CDBA	|| If the multitap is plugged in, this will NOT be 0xFF.
	LDA $4017				;$00CDBC	||
	LSR A					;$00CDBF	||
	LSR A					;$00CDC0	||
	ROL $06					;$00CDC1	||
	DEX						;$00CDC3	||
	BNE .readLoop2			;$00CDC4	|/
	LDA $00					;$00CDC6	|\ 
	CMP #$FF				;$00CDC8	||
	BNE .port1okay			;$00CDCA	||
	LDA $04					;$00CDCC	|| Check that the port 1 signature does not match a multitap.
	CMP #$FF				;$00CDCE	|| Else, set bit 7 of $08.
	BEQ .port1okay			;$00CDD0	||
	LDA #$80				;$00CDD2	||
	STA $08					;$00CDD4	|/
  .port1okay:				;			|
	LDA $02					;$00CDD6	|\ 
	CMP #$FF				;$00CDD8	||
	BNE .port2okay			;$00CDDA	||
	LDA $06					;$00CDDC	|| Check that the port 2 signature does not match a multitap.
	CMP #$FF				;$00CDDE	|| Else, set bit 6 of $08.
	BEQ .port2okay			;$00CDE0	||
	LDA #$40				;$00CDE2	||
	ORA $08					;$00CDE4	||
	STA $08					;$00CDE6	|/
  .port2okay:				;			|
	LDA $08					;$00CDE8	|
	PLP						;$00CDEA	|
	RTS						;$00CDEB	|

  .MetaText:				;$00CDEC	| Text to indentify the end of the multitap identification code.
	db "MODIFIED FROM SHVC MULTI5 CONNECT CHECK Ver1.00"
	db "END OF MULTI5 CONNECT CHECK"





label_00CE36:				;-----------| 
	LDA #$0000				;$00CE36	|
	BRA label_00CE43		;$00CE39	|
label_00CE3B:				;```````````|
	LDA #$0001				;$00CE3B	|
	BRA label_00CE43		;$00CE3E	|
label_00CE40:				;```````````|
	JSR label_00923A		;$00CE40	|
label_00CE43:				;			|
	SEP #$20				;$00CE43	|
	AND #$01				;$00CE45	|
	STA $33CD				;$00CE47	|
	STA $7F01				;$00CE4A	|
	REP #$20				;$00CE4D	|
	LDA #$CE59				;$00CE4F	|
	LDX #$0000				;$00CE52	|
	JML SA1_ExecuteSNES		;$00CE55	|
	SEP #$20				;$00CE59	|
	LDA $33CD				;$00CE5B	|
	STA $2143				;$00CE5E	|
	REP #$20				;$00CE61	|
	RTL						;$00CE63	|

label_00CE64:				;-----------|
	JSR label_00923A		;$00CE64	|
label_00CE67:				;			|
	SEP #$20				;$00CE67	|
	STA $33CC				;$00CE69	|
	REP #$20				;$00CE6C	|
	LDA #$CEA0				;$00CE6E	|
	LDX #$0000				;$00CE71	|
	JML SA1_ExecuteSNES		;$00CE74	|
	JSR label_00923A		;$00CE78	|
	SEP #$30				;$00CE7B	|
	CLC						;$00CE7D	|
	TAX						;$00CE7E	|
	BMI label_00CE8A		;$00CE7F	|
	ADC $33CC				;$00CE81	|
	BCC label_00CE91		;$00CE84	|
	LDA #$FF				;$00CE86	|
	BRA label_00CE91		;$00CE88	|

label_00CE8A:
	ADC $33CC				;$00CE8A	|
	BCS label_00CE91		;$00CE8D	|
	LDA #$00				;$00CE8F	|
label_00CE91:				;			|
	STA $33CC				;$00CE91	|
	REP #$30				;$00CE94	|
	LDA #$CEA0				;$00CE96	|\ 
	LDX #$0000				;$00CE99	|| Make sure we run the below on the SNES.
	JML SA1_ExecuteSNES		;$00CE9C	|/
label_00CEA0:				;			|
	SEP #$20				;$00CEA0	|
	LDA $33CC				;$00CEA2	|
	STA $2142				;$00CEA5	|
	REP #$20				;$00CEA8	|
	RTL						;$00CEAA	|



label_00CEAB:
	LDA #$CEB6				;$00CEAB	|\ 
	LDX #$0000				;$00CEAE	|| Make sure the below runs on the SNES.
	JSL SA1_ExecuteSNES		;$00CEB1	||
	RTL						;$00CEB5	|/
label_00CEB6:				;			|
	LDA $00AE				;$00CEB6	|
	AND #$00FF				;$00CEB9	|
	STA $00					;$00CEBC	|
	LDA #$0003				;$00CEBE	|
	JSL $018101				;$00CEC1	|
	LDA [$14]				;$00CEC5	|
	AND #$00FF				;$00CEC7	|
	BEQ label_00CEDA		;$00CECA	|
	CMP $00					;$00CECC	|
	BEQ label_00CEDA		;$00CECE	|
	LDA #$CF3F				;$00CED0	|
	LDX #$0000				;$00CED3	|
	JSL SA1_ExecuteSNES		;$00CED6	|
label_00CEDA:				;			|
	LDA #$0002				;$00CEDA	|
	JSL $018101				;$00CEDD	|
	SEP #$20				;$00CEE1	|
	LDA [$14]				;$00CEE3	|
	AND #$7F				;$00CEE5	|
	STA $33CA				;$00CEE7	|
	CMP $00AA				;$00CEEA	|
	REP #$20				;$00CEED	|
	LDA #$CF9C				;$00CEEF	|\ 
	LDX #$0000				;$00CEF2	|| Run $00CF9C on the SNES.
	JSL SA1_ExecuteSNES		;$00CEF5	|/
	LDA $00AE				;$00CEF9	|
	AND #$00FF				;$00CEFC	|
	STA $00					;$00CEFF	|
	LDA #$0003				;$00CF01	|
	JSL $018101				;$00CF04	|
	LDA [$14]				;$00CF08	|
	AND #$00FF				;$00CF0A	|
	BEQ label_00CF17		;$00CF0D	|
	CMP $00					;$00CF0F	|
	BEQ label_00CF17		;$00CF11	|
	JSL label_00D2FD		;$00CF13	|
label_00CF17:				;			|
	LDA #$0002				;$00CF17	|
	JSL $018101				;$00CF1A	|
	LDA [$14]				;$00CF1E	|
	AND #$0080				;$00CF20	|
	BEQ label_00CF34		;$00CF23	|
	SEP #$20				;$00CF25	|
label_00CF27:				;			|
	LDA #$72				;$00CF27	|
	STA $2140				;$00CF29	|
	CMP $2140				;$00CF2C	|
	BNE label_00CF27		;$00CF2F	|
	REP #$20				;$00CF31	|
	RTL						;$00CF33	|

label_00CF34:
	LDA #$CF4E				;$00CF34	|\ 
	LDX #$0000				;$00CF37	|| Run $00CF4E on the SNES.
	JSL SA1_ExecuteSNES		;$00CF3A	|/
	RTL						;$00CF3E	|

label_00CF3F:
	SEP #$30				;$00CF3F	|
label_00CF41:				;			|
	LDY #$72				;$00CF41	|
	STY $2140				;$00CF43	|
	CPY $2140				;$00CF46	|
	BNE label_00CF41		;$00CF49	|
	REP #$30				;$00CF4B	|
	RTL						;$00CF4D	|

label_00CF4E:
	SEP #$30				;$00CF4E	|
	LDA #$FF				;$00CF50	|
	STA $33CC				;$00CF52	|
	STA $2142				;$00CF55	|
	LDA $33CD				;$00CF58	|
	STA $2143				;$00CF5B	|
label_00CF5E:				;			|
	LDA #$73				;$00CF5E	|
	STA $2140				;$00CF60	|
	CMP $2140				;$00CF63	|
	BNE label_00CF5E		;$00CF66	|
	REP #$30				;$00CF68	|
	RTL						;$00CF6A	|





label_00CF6B:
	LDA #$CF3F				;$00CF6B	|\ 
	LDX #$0000				;$00CF6E	|| Run $00CF3F on the SNES.
	JSL SA1_ExecuteSNES		;$00CF71	|/
	LDA #$0002				;$00CF75	|
	JSL $018101				;$00CF78	|
	SEP #$20				;$00CF7C	|
	LDA [$14]				;$00CF7E	|
	AND #$7F				;$00CF80	|
	STA $33CA				;$00CF82	|
	REP #$20				;$00CF85	|
	LDA #$CF9C				;$00CF87	|\ 
	LDX #$0000				;$00CF8A	|| Run $00CF9C on the SNES.
	JSL SA1_ExecuteSNES		;$00CF8D	|/
	LDA #$CF4E				;$00CF91	|\ 
	LDX #$0000				;$00CF94	|| Run $00CF4E on the SNES.
	JSL SA1_ExecuteSNES		;$00CF97	|/
	RTL						;$00CF9B	|

label_00CF9C:
	SEP #$30				;$00CF9C	|
	LDA $33CA				;$00CF9E	|
	BNE label_00CFB6		;$00CFA1	|
	STZ $2141				;$00CFA3	|
	STZ $2142				;$00CFA6	|
label_00CFA9:				;			|
	LDA #$72				;$00CFA9	|
	STA $2140				;$00CFAB	|
	CMP $2140				;$00CFAE	|
	BNE label_00CFA9		;$00CFB1	|
	REP #$30				;$00CFB3	|
	RTL						;$00CFB5	|

label_00CFB6:
	CMP $00AA				;$00CFB6	|
	BEQ label_00CFD6		;$00CFB9	|
	STA $00AA				;$00CFBB	|
label_00CFBE:				;			|
	LDY #$72				;$00CFBE	|
	STY $2140				;$00CFC0	|
	CPY $2140				;$00CFC3	|
	BNE label_00CFBE		;$00CFC6	|
	REP #$30				;$00CFC8	|
	AND #$00FF				;$00CFCA	|
	CLC						;$00CFCD	|
	ADC #$000A				;$00CFCE	|
	JSR label_00D09D		;$00CFD1	|
	SEP #$30				;$00CFD4	|
label_00CFD6:				;			|
	LDX $00AA				;$00CFD6	|
	DEX						;$00CFD9	|
	LDA.w DATA_00D7E7,X		;$00CFDA	|
	BEQ label_00CFF3		;$00CFDD	|
	CMP $00AB				;$00CFDF	|
	BEQ label_00CFF3		;$00CFE2	|
	STA $00AB				;$00CFE4	|
	REP #$30				;$00CFE7	|
	AND #$00FF				;$00CFE9	|
	CLC						;$00CFEC	|
	ADC #$0001				;$00CFED	|
	JSR label_00D09D		;$00CFF0	|
label_00CFF3:				;			|
	REP #$30				;$00CFF3	|
	RTL						;$00CFF5	|



label_00CFF6:				;-----------|
	PHY						;$00CFF6	|
	LDA #$0000				;$00CFF7	|
	JSL label_00D003		;$00CFFA	|
	PLY						;$00CFFE	|
	RTL						;$00CFFF	|

label_00D000:				;-----------| Alt entry to the below?
	JSR label_00923A		;$00D000	|
label_00D003:				;-----------| Routine to load music?
	SEP #$20				;$00D003	|
	CMP #$42				;$00D005	|\ 
	BCS .invalid			;$00D007	|| Return if the passed value is invalid (>= 0x42)
	STA $33CA				;$00D009	|/
	REP #$20				;$00D00C	|\ 
	LDA.w #.onSNES			;$00D00E	|| Make sure this routine runs on the SNES.
	LDX.w #.onSNES>>16		;$00D011	||
	JML SA1_ExecuteSNES		;$00D014	|/
  .invalid:					;			|
	REP #$20				;$00D018	|
	RTL						;$00D01A	|
  .onSNES:					;```````````| On the SNES now.
	SEP #$30				;$00D01B	|
	STZ $2141				;$00D01D	|
	STZ $33CB				;$00D020	|
	LDA #$FF				;$00D023	|
	STA $33CE				;$00D025	|
	STA $33CF				;$00D028	|
	STA $33D0				;$00D02B	|
	LDA $33CA				;$00D02E	|\ Branch if a song is being requested.
	BNE label_00D043		;$00D031	|/
	STZ $2142				;$00D033	|
label_00D036:				;			|
	LDA #$72				;$00D036	|
	STA $2140				;$00D038	|
	CMP $2140				;$00D03B	|
	BNE label_00D036		;$00D03E	|
	REP #$30				;$00D040	|
	RTL						;$00D042	|

label_00D043:				;```````````| Song is being requested.
	CMP $00AA				;$00D043	|\ 
	BEQ .noNewSong			;$00D046	|| Don't reupload the song if it's not a new one.
	STA $00AA				;$00D048	|/
  .waitForSPC:				;			|
	LDY #$72				;$00D04B	|\ 
	STY $2140				;$00D04D	|| Wait for the SPC to finish whatever it's doing.
	CPY $2140				;$00D050	||
	BNE .waitForSPC			;$00D053	|/
	REP #$30				;$00D055	|\ 
	AND #$00FF				;$00D057	||
	CLC						;$00D05A	|| Upload the song.
	ADC #$000A				;$00D05B	||
	JSR label_00D09D		;$00D05E	||
	SEP #$30				;$00D061	|/
  .noNewSong:				;			|
	LDX $00AA				;$00D063	|\ 
	DEX						;$00D066	||
	LDA.w DATA_00D7E7,X		;$00D067	||
	BEQ .noNewSamples		;$00D06A	||
	CMP $00AB				;$00D06C	||
	BEQ .noNewSamples		;$00D06F	|| If the sample bank needs to be changed, upload it.
	STA $00AB				;$00D071	||
	REP #$30				;$00D074	||
	AND #$00FF				;$00D076	||
	CLC						;$00D079	||
	ADC #$0001				;$00D07A	||
	JSR label_00D09D		;$00D07D	||
	SEP #$30				;$00D080	|/
  .noNewSamples:			;			|
	LDA #$FF				;$00D082	|
	STA $33CC				;$00D084	|
	STA $2142				;$00D087	|
	LDA $33CD				;$00D08A	|
	STA $2143				;$00D08D	|
  .waitForFinish:			;			|
	LDA #$73				;$00D090	|\ 
	STA $2140				;$00D092	|| Wait for the SPC to finish loading.
	CMP $2140				;$00D095	||
	BNE .waitForFinish		;$00D098	|/
	REP #$30				;$00D09A	|
	RTL						;$00D09C	|


label_00D09D:				;-----------| Subroutine to get a song/sample bank's data and upload it.
	CMP #$004C				;$00D09D	|\ 
	BCC label_00D0A3		;$00D0A0	|| Return if an invalid value is passed.
	RTS						;$00D0A2	|/
label_00D0A3:				;			|
	PHD						;$00D0A3	|
	PEA $0000				;$00D0A4	|\ Change DB to $00.
	PLD						;$00D0A7	|/
	TAY						;$00D0A8	|\ 
	STA $9D					;$00D0A9	||
	ASL A					;$00D0AB	|| Multiply pointer by 3.
	ADC $9D					;$00D0AC	||
	TAX						;$00D0AE	|/
	JSR SyncSPC				;$00D0AF	|
	LDA.w DATA_00D703,X		;$00D0B2	|\ 
	STA $95					;$00D0B5	||
	STA $99					;$00D0B7	|| Store the pointer to the song/sample bank in $95 and $99.
	LDA.w DATA_00D703+2,X	;$00D0B9	||
	AND #$00FF				;$00D0BC	||
	STA $97					;$00D0BF	||
	STA $9B					;$00D0C1	|/
	CPY #$000B				;$00D0C3	|\ Branch if a sample bank is being uploaded.
	BCC label_00D0FA		;$00D0C6	|/
	CPY #$004B				;$00D0C8	|\ Branch if son 4B (#65) is being uploaded?
	BCS label_00D0EC		;$00D0CB	|/
	LDA $00AF				;$00D0CD	|
	BEQ label_00D0FA		;$00D0D0	|
	LDA.w DATA_00D703+3		;$00D0D2	|
	STA $95					;$00D0D5	|
	LDA.w DATA_00D703+5		;$00D0D7	|
	STA $97					;$00D0DA	|
	JSR label_00D104		;$00D0DC	|
	LDA $99					;$00D0DF	|
	STA $95					;$00D0E1	|
	LDA $9B					;$00D0E3	|
	STA $97					;$00D0E5	|
	STZ $00AF				;$00D0E7	|
	BRA label_00D0FA		;$00D0EA	|
label_00D0EC:				;```````````| Song 4B (#65) is being uploaded.
	STA $00AF				;$00D0EC	|
	STZ $00AC				;$00D0EF	|
	SEP #$20				;$00D0F2	|
	STZ $33CB				;$00D0F4	|
	STZ $00AE				;$00D0F7	|
label_00D0FA:				;```````````| Time to upload the actaul song.
	REP #$20				;$00D0FA	|
	JSR label_00D104		;$00D0FC	|
	JSR label_00D604		;$00D0FF	|
	PLD						;$00D102	|
	RTS						;$00D103	|


label_00D104:				;-----------| 
	SEP #$10				;$00D104	|
	LDX $A7					;$00D106	|
label_00D108:				;			|
	LDA [$95]				;$00D108	|
	BEQ label_00D125		;$00D10A	|
	JSR label_00D54A		;$00D10C	|
	INC $95					;$00D10F	|
	STA $A7					;$00D111	|
	LDA [$95]				;$00D113	|
	JSR label_00D54A		;$00D115	|
	INC $95					;$00D118	|
label_00D11A:				;			|
	LDA [$95]				;$00D11A	|
	JSR label_00D54A		;$00D11C	|
	DEC $A7					;$00D11F	|
	BNE label_00D11A		;$00D121	|
	BRA label_00D108		;$00D123	|

label_00D125:
	STX $A7					;$00D125	|
	REP #$10				;$00D127	|
	RTS						;$00D129	|



label_00D12A:
	JSR label_00923A		;$00D12A	|



label_00D12D:				;-----------|
	SEP #$30				;$00D12D	|
	CMP #$F9				;$00D12F	|
	BCS label_00D150		;$00D131	|
	TAX						;$00D133	|
	BNE label_00D153		;$00D134	|
	STZ $33CB				;$00D136	|
	LDA #$FF				;$00D139	|
	STA $33CE				;$00D13B	|
	STA $33CF				;$00D13E	|
	STA $33D0				;$00D141	|
	REP #$30				;$00D144	|
	LDA #$D1C0				;$00D146	|\ 
	LDX #$0000				;$00D149	|| Execute $00D1C0 on the SNES.
	JML SA1_ExecuteSNES		;$00D14C	|/

label_00D150:
	REP #$30				;$00D150	|
	RTL						;$00D152	|

label_00D153:
	LDA $EBB6EC,X			;$00D153	|
	TAY						;$00D157	|
	LDA $EBB5F4,X			;$00D158	|
	BIT #$01				;$00D15C	|
	BEQ label_00D167		;$00D15E	|
	CPY $33CE				;$00D160	|
	BEQ label_00D167		;$00D163	|
	BCS label_00D150		;$00D165	|
label_00D167:				;			|
	BIT #$02				;$00D167	|
	BEQ label_00D172		;$00D169	|
	CPY $33CF				;$00D16B	|
	BEQ label_00D172		;$00D16E	|
	BCS label_00D150		;$00D170	|
label_00D172:				;			|
	BIT #$04				;$00D172	|
	BEQ label_00D17D		;$00D174	|
	CPY $33D0				;$00D176	|
	BEQ label_00D17D		;$00D179	|
	BCS label_00D150		;$00D17B	|
label_00D17D:				;			|
	STX $33CB				;$00D17D	|
	STA $49					;$00D180	|
	LDA $EBB7E4,X			;$00D182	|
	REP #$20				;$00D186	|
	AND #$00FF				;$00D188	|
	BIT #$0080				;$00D18B	|
	BEQ label_00D195		;$00D18E	|
	AND #$007F				;$00D190	|
	ASL A					;$00D193	|
	ASL A					;$00D194	|
label_00D195:				;			|
	INC A					;$00D195	|
	LSR $49					;$00D196	|
	BCC label_00D1A0		;$00D198	|
	STY $33CE				;$00D19A	|
	STA $33D1				;$00D19D	|
label_00D1A0:				;			|
	LSR $49					;$00D1A0	|
	BCC label_00D1AA		;$00D1A2	|
	STY $33CF				;$00D1A4	|
	STA $33D3				;$00D1A7	|
label_00D1AA:				;			|
	LSR $49					;$00D1AA	|
	BCC label_00D1B4		;$00D1AC	|
	STY $33D0				;$00D1AE	|
	STA $33D5				;$00D1B1	|
label_00D1B4:				;			|
	REP #$10				;$00D1B4	|
	LDA #$D1C0				;$00D1B6	|\ 
	LDX #$0000				;$00D1B9	|| Execute the below routine on the SNES.
	JML SA1_ExecuteSNES		;$00D1BC	|/


label_00D1C0:				;-----------|
	SEP #$30				;$00D1C0	|
	LDA $33CB				;$00D1C2	|
	BNE label_00D1E5		;$00D1C5	|
	LDA $2140				;$00D1C7	|
	AND #$7F				;$00D1CA	|
	CMP #$72				;$00D1CC	|
	BCS label_00D1DA		;$00D1CE	|
label_00D1D0:				;			|
	LDA #$72				;$00D1D0	|
	STA $2140				;$00D1D2	|
	CMP $2140				;$00D1D5	|
	BNE label_00D1D0		;$00D1D8	|
label_00D1DA:				;			|
	STZ $2141				;$00D1DA	|
	LDA $2141				;$00D1DD	|
	BNE label_00D1DA		;$00D1E0	|
	REP #$30				;$00D1E2	|
	RTL						;$00D1E4	|

label_00D1E5:
	REP #$30				;$00D1E5	|
	PHD						;$00D1E7	|
	LDA #$0000				;$00D1E8	|\ Change the DP to $00xx.
	TCD						;$00D1EB	|/
	LDA $00AF				;$00D1EC	|
	BEQ label_00D23B		;$00D1EF	|
	JSR SyncSPC				;$00D1F1	|
	LDA.w DATA_00D703+3		;$00D1F4	|
	STA $95					;$00D1F7	|
	LDA.w DATA_00D703+5		;$00D1F9	|
	STA $97					;$00D1FC	|
	JSR label_00D104		;$00D1FE	|
	LDA.w DATA_00D703+33	;$00D201	|
	STA $95					;$00D204	|
	LDA.w DATA_00D703+35	;$00D206	|
	STA $97					;$00D209	|
	JSR label_00D104		;$00D20B	|
	JSR label_00D604		;$00D20E	|
	SEP #$20				;$00D211	|
	STZ $2142				;$00D213	|
	LDA #$73				;$00D216	|
	STA $2140				;$00D218	|
label_00D21B:				;			|
	CMP $2140				;$00D21B	|
	BNE label_00D21B		;$00D21E	|
	DEC A					;$00D220	|
	STA $2140				;$00D221	|
label_00D224:				;			|
	CMP $2140				;$00D224	|
	BNE label_00D224		;$00D227	|
	STZ $00AF				;$00D229	|
	STZ $00AA				;$00D22C	|
	STZ $00AB				;$00D22F	|
	STZ $00AC				;$00D232	|
	STZ $00AD				;$00D235	|
	STZ $00AE				;$00D238	|
label_00D23B:				;			|
	REP #$30				;$00D23B	|
	LDA $33CB				;$00D23D	|
	AND #$00FF				;$00D240	|
	CLC						;$00D243	|
	ADC #$001E				;$00D244	|
	CMP #$0072				;$00D247	|
	BCC label_00D2C0		;$00D24A	|
	SBC #$0072				;$00D24C	|
	SEP #$30				;$00D24F	|
	STA $9D					;$00D251	|
	TAX						;$00D253	|
	LDA $ECB21C,X			;$00D254	|
	TAX						;$00D258	|
	LDA $EFD20A,X			;$00D259	|
	BNE label_00D285		;$00D25D	|
	LDY #$00				;$00D25F	|
	CPX $00AC				;$00D261	|
	BEQ label_00D277		;$00D264	|
	INY						;$00D266	|
	CPX $00AD				;$00D267	|
	BEQ label_00D277		;$00D26A	|
	LDX $9D					;$00D26C	|
	LDA $ECB21C,X			;$00D26E	|
	JSR label_00D34D		;$00D272	|
	LDY $9F					;$00D275	|
label_00D277:				;			|
	LDX $9D					;$00D277	|
	LDA $ECB177,X			;$00D279	|
	TYX						;$00D27D	|
	BEQ label_00D2C0		;$00D27E	|
	CLC						;$00D280	|
	ADC #$0A				;$00D281	|
	BRA label_00D2C0		;$00D283	|

label_00D285:
	CMP #$01				;$00D285	|
	BEQ label_00D290		;$00D287	|
	CMP #$02				;$00D289	|
	BEQ label_00D2A8		;$00D28B	|
	STZ $00AD				;$00D28D	|
label_00D290:				;			|
	CPX $00AC				;$00D290	|
	BEQ label_00D2A0		;$00D293	|
	LDY #$00				;$00D295	|
	LDX $9D					;$00D297	|
	LDA $ECB21C,X			;$00D299	|
	JSR label_00D34D		;$00D29D	|
label_00D2A0:				;			|
	LDX $9D					;$00D2A0	|
	LDA $ECB177,X			;$00D2A2	|
	BRA label_00D2C0		;$00D2A6	|

label_00D2A8:
	CPX $00AE				;$00D2A8	|
	BEQ label_00D2B7		;$00D2AB	|
	TAY						;$00D2AD	|
	LDX $9D					;$00D2AE	|
	LDA $ECB21C,X			;$00D2B0	|
	JSR label_00D34D		;$00D2B4	|
label_00D2B7:				;			|
	LDX $9D					;$00D2B7	|
	LDA $ECB177,X			;$00D2B9	|
	CLC						;$00D2BD	|
	ADC #$14				;$00D2BE	|
label_00D2C0:				;			|
	SEP #$30				;$00D2C0	|
	CMP #$72				;$00D2C2	|
	BCS label_00D2E3		;$00D2C4	|
	TAX						;$00D2C6	|
	LDA $3096				;$00D2C7	|
	LDY $3094				;$00D2CA	|
	CPY $00A9				;$00D2CD	|
	BEQ label_00D2D7		;$00D2D0	|
	STY $00A9				;$00D2D2	|
	EOR #$80				;$00D2D5	|
label_00D2D7:				;			|
	AND #$80				;$00D2D7	|
	STA $3096				;$00D2D9	|
	TXA						;$00D2DC	|
	ORA $3096				;$00D2DD	|
	STA $2141				;$00D2E0	|
label_00D2E3:				;			|
	LDA $33CC				;$00D2E3	|
	STA $2142				;$00D2E6	|
	LDA $33CD				;$00D2E9	|
	STA $2143				;$00D2EC	|
	REP #$30				;$00D2EF	|
	PLD						;$00D2F1	|
	RTL						;$00D2F2	|





label_00D2F3:
	LDA #$0000				;$00D2F3	|
	JSL label_00D12D		;$00D2F6	|
	JSR label_00923A		;$00D2FA	|
label_00D2FD:				;			|
	STA $49					;$00D2FD	|
	LDA #$D309				;$00D2FF	|
	LDX #$0000				;$00D302	|
	JML SA1_ExecuteSNES		;$00D305	|
	SEP #$30				;$00D309	|
	LDX $49					;$00D30B	|
	LDA $EFD20A,X			;$00D30D	|
	CMP #$01				;$00D311	|
	BNE label_00D317		;$00D313	|
	LDA #$00				;$00D315	|

label_00D317:
	TAY						;$00D317	|
	TXA						;$00D318	|
	PHD						;$00D319	|
	PEA $0000				;$00D31A	|
	PLD						;$00D31D	|
	JSR label_00D34D		;$00D31E	|
	PLD						;$00D321	|
	REP #$30				;$00D322	|
	RTL						;$00D324	|
	JSR label_00923A		;$00D325	|
	STA $49					;$00D328	|
	LDA #$D334				;$00D32A	|
	LDX #$0000				;$00D32D	|
	JML SA1_ExecuteSNES		;$00D330	|
	SEP #$30				;$00D334	|
	LDX $49					;$00D336	|
	LDA $EFD20A,X			;$00D338	|
	BNE label_00D34A		;$00D33C	|
	TXA						;$00D33E	|
	LDY #$01				;$00D33F	|
	PHD						;$00D341	|
	PEA $0000				;$00D342	|
	PLD						;$00D345	|
	JSR label_00D34D		;$00D346	|
	PLD						;$00D349	|

label_00D34A:
	REP #$30				;$00D34A	|
	RTL						;$00D34C	|



label_00D34D:				;-----------| Subroutine used by the above?
	STY $9F					;$00D34D	|
	CPY #$03				;$00D34F	|
	BNE label_00D355		;$00D351	|
	LDY #$00				;$00D353	|
label_00D355:				;			|
	CMP $00AC,Y				;$00D355	|
	BNE label_00D35B		;$00D358	|
	RTS						;$00D35A	|

label_00D35B:
	STA $00AC,Y				;$00D35B	|
	ASL A					;$00D35E	|
	ADC $00AC,Y				;$00D35F	|
	TAX						;$00D362	|
	REP #$30				;$00D363	|
	LDA.w DATA_00D69D-3,X	;$00D365	|
	STA $95					;$00D368	|
	LDA.w DATA_00D69D-1,X	;$00D36A	|
	STA $97					;$00D36D	|
	JSR SyncSPC				;$00D36F	|
	SEP #$10				;$00D372	|
	LDX $A7					;$00D374	|
	LDA [$95]				;$00D376	|
	AND #$00FF				;$00D378	|
	BNE label_00D382		;$00D37B	|
	INC $95					;$00D37D	|
	JMP label_00D454		;$00D37F	|

label_00D382:
	STA $A1					;$00D382	|
	STA $A3					;$00D384	|
	ASL A					;$00D386	|
	ADC $A1					;$00D387	|
	ASL A					;$00D389	|
	JSR label_00D54A		;$00D38A	|
	LDA $9F					;$00D38D	|
	BEQ label_00D3B5		;$00D38F	|
	CMP #$0001				;$00D391	|
	BEQ label_00D3A8		;$00D394	|
	CMP #$0003				;$00D396	|
	BEQ label_00D3B5		;$00D399	|
	LDA #$06E6				;$00D39B	|
	JSR label_00D54A		;$00D39E	|
	DEC $95					;$00D3A1	|
	LDA #$0051				;$00D3A3	|
	BRA label_00D3C0		;$00D3A6	|

label_00D3A8:
	LDA #$06CE				;$00D3A8	|
	JSR label_00D54A		;$00D3AB	|
	DEC $95					;$00D3AE	|
	LDA #$004D				;$00D3B0	|
	BRA label_00D3C0		;$00D3B3	|

label_00D3B5:
	LDA #$06B6				;$00D3B5	|
	JSR label_00D54A		;$00D3B8	|
	DEC $95					;$00D3BB	|
	LDA #$0049				;$00D3BD	|
label_00D3C0:				;			|
	PHA						;$00D3C0	|
	JSR label_00D54A		;$00D3C1	|
	DEC $95					;$00D3C4	|
	LDA [$95]				;$00D3C6	|
	JSR label_00D54A		;$00D3C8	|
	LDA [$95]				;$00D3CB	|
	JSR label_00D54A		;$00D3CD	|
	LDA [$95]				;$00D3D0	|
	JSR label_00D54A		;$00D3D2	|
	LDA [$95]				;$00D3D5	|
	JSR label_00D54A		;$00D3D7	|
	LDA [$95]				;$00D3DA	|
	JSR label_00D54A		;$00D3DC	|
	PLA						;$00D3DF	|
	INC A					;$00D3E0	|
	DEC $A3					;$00D3E1	|
	BNE label_00D3C0		;$00D3E3	|
	LDA $A1					;$00D3E5	|
	ASL A					;$00D3E7	|
	ASL A					;$00D3E8	|
	JSR label_00D54A		;$00D3E9	|
	DEC $95					;$00D3EC	|
	LDA $9F					;$00D3EE	|
	BEQ label_00D416		;$00D3F0	|
	CMP #$0001				;$00D3F2	|
	BEQ label_00D409		;$00D3F5	|
	CMP #$0003				;$00D3F7	|
	BEQ label_00D416		;$00D3FA	|
	LDA #$0444				;$00D3FC	|
	JSR label_00D54A		;$00D3FF	|
	DEC $95					;$00D402	|
	LDA #$F900				;$00D404	|
	BRA label_00D421		;$00D407	|

label_00D409:
	LDA #$0434				;$00D409	|
	JSR label_00D54A		;$00D40C	|
	DEC $95					;$00D40F	|
	LDA #$EAE0				;$00D411	|
	BRA label_00D421		;$00D414	|

label_00D416:
	LDA #$0424				;$00D416	|
	JSR label_00D54A		;$00D419	|
	DEC $95					;$00D41C	|
	LDA #$DCC0				;$00D41E	|
label_00D421:				;			|
	STA $A3					;$00D421	|
label_00D423:				;			|
	LDA [$95]				;$00D423	|
	CLC						;$00D425	|
	ADC $A3					;$00D426	|
	JSR label_00D54A		;$00D428	|
	XBA						;$00D42B	|
	JSR label_00D54A		;$00D42C	|
	LDA [$95]				;$00D42F	|
	CLC						;$00D431	|
	ADC $A3					;$00D432	|
	JSR label_00D54A		;$00D434	|
	XBA						;$00D437	|
	JSR label_00D54A		;$00D438	|
	DEC $A1					;$00D43B	|
	BNE label_00D423		;$00D43D	|
	LDA [$95]				;$00D43F	|
	STA $A1					;$00D441	|
	JSR label_00D54A		;$00D443	|
	LDA $A3					;$00D446	|
	JSR label_00D54A		;$00D448	|
label_00D44B:				;			|
	LDA [$95]				;$00D44B	|
	JSR label_00D54A		;$00D44D	|
	DEC $A1					;$00D450	|
	BNE label_00D44B		;$00D452	|
label_00D454:				;			|
	LDA [$95]				;$00D454	|
	AND #$00FF				;$00D456	|
	STA $A1					;$00D459	|
	LDA $9F					;$00D45B	|
	BNE label_00D46B		;$00D45D	|
	LDA #$000A				;$00D45F	|
	STA $A5					;$00D462	|
	LDY #$00				;$00D464	|
	LDA #$6000				;$00D466	|
	BRA label_00D497		;$00D469	|

label_00D46B:
	CMP #$0001				;$00D46B	|
	BNE label_00D47C		;$00D46E	|
	LDA #$000A				;$00D470	|
	STA $A5					;$00D473	|
	LDY #$14				;$00D475	|
	LDA #$6200				;$00D477	|
	BRA label_00D497		;$00D47A	|

label_00D47C:
	CMP #$0002				;$00D47C	|
	BNE label_00D48D		;$00D47F	|
	LDA #$000A				;$00D481	|
	STA $A5					;$00D484	|
	LDY #$28				;$00D486	|
	LDA #$6400				;$00D488	|
	BRA label_00D497		;$00D48B	|
label_00D48D:				;			|
	LDA #$0014				;$00D48D	|
	STA $A5					;$00D490	|
	LDY #$00				;$00D492	|
	LDA #$6000				;$00D494	|
label_00D497:				;			|
	STA $A3					;$00D497	|
	LDA $A5					;$00D499	|
	ASL A					;$00D49B	|
	JSR label_00D54A		;$00D49C	|
	TYA						;$00D49F	|
	CLC						;$00D4A0	|
	ADC [$95]				;$00D4A1	|
	JSR label_00D54A		;$00D4A3	|
	INC $95					;$00D4A6	|
	LDY $A1					;$00D4A8	|
label_00D4AA:				;			|
	LDA [$95]				;$00D4AA	|
	CLC						;$00D4AC	|
	ADC $A3					;$00D4AD	|
	JSR label_00D54A		;$00D4AF	|
	XBA						;$00D4B2	|
	JSR label_00D54A		;$00D4B3	|
	DEY						;$00D4B6	|
	BNE label_00D4AA		;$00D4B7	|
	LDA $A5					;$00D4B9	|
	SEC						;$00D4BB	|
	SBC $A1					;$00D4BC	|
	BEQ label_00D4D2		;$00D4BE	|
	BCC label_00D4D2		;$00D4C0	|
	TAY						;$00D4C2	|
	LDA $DE9CD9				;$00D4C3	|
label_00D4C7:				;			|
	JSR label_00D54C		;$00D4C7	|
	XBA						;$00D4CA	|
	JSR label_00D54C		;$00D4CB	|
	XBA						;$00D4CE	|
	DEY						;$00D4CF	|
	BNE label_00D4C7		;$00D4D0	|
label_00D4D2:				;			|
	LDA [$95]				;$00D4D2	|
	STA $A1					;$00D4D4	|
	JSR label_00D54A		;$00D4D6	|
	LDA $A3					;$00D4D9	|
	JSR label_00D54A		;$00D4DB	|
label_00D4DE:				;			|
	LDA [$95]				;$00D4DE	|
	INC $95					;$00D4E0	|
	TAY						;$00D4E2	|
	BMI label_00D4F1		;$00D4E3	|
label_00D4E5:				;			|
	LDA [$95]				;$00D4E5	|
	JSR label_00D54A		;$00D4E7	|
	DEC $A1					;$00D4EA	|
	DEY						;$00D4EC	|
	BNE label_00D4E5		;$00D4ED	|
	BRA label_00D52B		;$00D4EF	|

label_00D4F1:
	AND #$0001				;$00D4F1	|
	BNE label_00D508		;$00D4F4	|
	LDA [$95]				;$00D4F6	|
	CLC						;$00D4F8	|
	ADC $A3					;$00D4F9	|
	JSR label_00D54A		;$00D4FB	|
	XBA						;$00D4FE	|
	JSR label_00D54A		;$00D4FF	|
	DEC $A1					;$00D502	|
	DEC $A1					;$00D504	|
	BRA label_00D52B		;$00D506	|

label_00D508:
	LDA $9F					;$00D508	|
	BEQ label_00D520		;$00D50A	|
	CMP #$0001				;$00D50C	|
	BEQ label_00D51B		;$00D50F	|
	CMP #$0003				;$00D511	|
	BEQ label_00D520		;$00D514	|
	LDA #$0051				;$00D516	|
	BRA label_00D523		;$00D519	|

label_00D51B:
	LDA #$004D				;$00D51B	|
	BRA label_00D523		;$00D51E	|

label_00D520:
	LDA #$0049				;$00D520	|
label_00D523:				;			|
	CLC						;$00D523	|
	ADC [$95]				;$00D524	|
	JSR label_00D54A		;$00D526	|
	DEC $A1					;$00D529	|
label_00D52B:				;			|
	LDA $A1					;$00D52B	|
	BNE label_00D4DE		;$00D52D	|
	STX $A7					;$00D52F	|
	REP #$10				;$00D531	|
	JSR label_00D604		;$00D533	|
	SEP #$30				;$00D536	|
	LDA #$FD				;$00D538	|
	STA $2140				;$00D53A	|
	LDA $33CC				;$00D53D	|
	STA $2142				;$00D540	|
	LDA $33CD				;$00D543	|
	STA $2143				;$00D546	|
	RTS						;$00D549	|



label_00D54A:				;-----------| Subroutine used by the above to wait for the SPC?
	INC $95					;$00D54A	|
label_00D54C:				;			|
	CPX $2140				;$00D54C	|
	BNE label_00D54C		;$00D54F	|
	STA $2142				;$00D551	|
	STX $2140				;$00D554	|
	INX						;$00D557	|
	RTS						;$00D558	|





label_00D559:				;-----------| Routine to handle starting up the SPC700 chip.
	PHD						;$00D559	|
	LDA #$0000				;$00D55A	|\ Change DP to $00xx.
	TCD						;$00D55D	|/
	LDA $2140				;$00D55E	|\ 
	CMP #$BBAA				;$00D561	|| If the SPC chip is waiting for the engine, upload it.
	BNE .engineUploaded		;$00D564	||
	JSR UploadSPCEngine		;$00D566	|/
  .engineUploaded:			;			|
	JSR SyncSPC				;$00D569	| Wait for the SPC chip to sync timings.
	LDA.w DATA_00D703		;$00D56C	|
	STA $95					;$00D56F	|
	LDA.w DATA_00D703+2		;$00D571	|
	STA $97					;$00D574	|
	JSR label_00D104		;$00D576	|
	LDA.w DATA_00D703+3		;$00D579	|
	STA $95					;$00D57C	|
	LDA.w DATA_00D703+5		;$00D57E	|
	STA $97					;$00D581	|
	JSR label_00D104		;$00D583	|
	STZ $00AF				;$00D586	|
	JSR label_00D604		;$00D589	|
	PLD						;$00D58C	|
	STZ $33CC				;$00D58D	|
	STZ $33CA				;$00D590	|
	STZ $00AA				;$00D593	|
	STZ $00AC				;$00D596	|
	SEP #$20				;$00D599	|
	STZ $00AE				;$00D59B	|
	STZ $3096				;$00D59E	|
	LDA #$01				;$00D5A1	|
	STA $33CD				;$00D5A3	|
	LDA #$FF				;$00D5A6	|
	STA $33CE				;$00D5A8	|
	STA $33CF				;$00D5AB	|
	STA $33D0				;$00D5AE	|
label_00D5B1:				;			|
	LDA #$72				;$00D5B1	|
	STA $2140				;$00D5B3	|
	CMP $2140				;$00D5B6	|
	BNE label_00D5B1		;$00D5B9	|
	STZ $2142				;$00D5BB	|
	STZ $2141				;$00D5BE	|
label_00D5C1:				;			|
	LDA $2141				;$00D5C1	|
	BNE label_00D5C1		;$00D5C4	|
	REP #$20				;$00D5C6	|
	RTL						;$00D5C8	|


SyncSPC:					;-----------| Routine to stall until the SPC timer loops, for syncing timings?
	LDA #$FFFF				;$00D5C9	|
	STA $33C8				;$00D5CC	|
	SEP #$20				;$00D5CF	|
	BIT $00B0				;$00D5D1	|\ 
	BMI .waitForCounterInc	;$00D5D4	||
	LDA $2140				;$00D5D6	||
	BEQ .waitForCounterInc	;$00D5D9	||
  .waitForClear:			;			|| Make sure the chip isn't currently sending data?
	STZ $2141				;$00D5DB	||
	STZ $2142				;$00D5DE	||
	LDA $2141				;$00D5E1	||
	ORA $2142				;$00D5E4	||
	BNE .waitForClear		;$00D5E7	|/
  .waitForCounterInc:		;			|
	STZ $2142				;$00D5E9	|\ 
	LDA #$78				;$00D5EC	||
	STA $2143				;$00D5EE	||
	LDA #$FF				;$00D5F1	|| Repeatedly send [$FF,$FE,$00,$78] to the SPC
	STA $2140				;$00D5F3	||  until a timer overflow occurs.
	DEC A					;$00D5F6	||
	STA $2141				;$00D5F7	||
	CMP $2140				;$00D5FA	||
	BNE .waitForCounterInc	;$00D5FD	|/
	STA $A7					;$00D5FF	|
	REP #$20				;$00D601	|
	RTS						;$00D603	|


label_00D604:				;-----------|
	SEP #$10				;$00D604	|
	LDX $A7					;$00D606	|
label_00D608:				;			|
	CPX $2140				;$00D608	|
	BNE label_00D608		;$00D60B	|
	STZ $2142				;$00D60D	|
	STX $2140				;$00D610	|
	CPX #$FE				;$00D613	|
	BNE label_00D620		;$00D615	|
	INX						;$00D617	|
label_00D618:				;			|
	CPX $2140				;$00D618	|
	BNE label_00D618		;$00D61B	|
	STX $2140				;$00D61D	|
label_00D620:				;			|
	LDX #$FE				;$00D620	|
label_00D622:				;			|
	CPX $2140				;$00D622	|
	BNE label_00D622		;$00D625	|
	STX $2140				;$00D627	|
label_00D62A:				;			|
	CPX $2140				;$00D62A	|
	BEQ label_00D62A		;$00D62D	|
	REP #$10				;$00D62F	|
	STZ $33C8				;$00D631	|
	RTS						;$00D634	|


UploadSPCEngine:			;-----------| Subroutine to upload the SPC engine.
	LDY #$0000				;$00D635	|
	LDA #$0A3E				;$00D638	|\ 
	STA $95					;$00D63B	|| $95 = $E40A3E ($888A3E)
	LDA #$00E4				;$00D63D	||
	STA $97					;$00D640	|/
	SEP #$20				;$00D642	|
	LDA #$CC				;$00D644	|\ Start transfer.
	BRA SendSPCBlock		;$00D646	|/

TransferBytes:				;~~~~~~~~~~~| Part of the SPC upload routine to handle a single block. Entry point at $00D66E.
	LDA [$95],Y				;$00D648	|\ 
	INY						;$00D64A	|| Load first byte to upload.
	XBA						;$00D64B	||
	LDA #$00				;$00D64C	|// Validation byte for SPC.
	BRA .sendData			;$00D64E	|

  .nextByte:				;```````````| Inner loop to load bytes for each block.
	XBA						;$00D650	|\\ 
	LDA [$95],Y				;$00D651	||| Load next byte.
	INY						;$00D653	|||
	XBA						;$00D654	||/
  .waitForFinish:			;			||
	CMP $2140				;$00D655	||\ Wait for the SPC to respond from the previous byte.
	BNE .waitForFinish		;$00D658	||/
	INC A					;$00D65A	|| Increment validation byte.
  .sendData:				;```````````||``] Entry point for the inner byte loop.
	REP #$20				;$00D65B	||\ 
	STA $2140				;$00D65D	||| Send byte, plus the validation byte.
	SEP #$20				;$00D660	||/
	DEX						;$00D662	||
	BNE .nextByte			;$00D663	|/
  .WaitForResponse:			;			|
	CMP $2140				;$00D665	|\ Wait for the SPC to respond from the last byte of the block.
	BNE .WaitForResponse	;$00D668	|/
  .AddThree					;			|
	ADC #$03				;$00D66A	|\ Add 3; if A becomes 0, add 3 once more so it's still positive.
	BEQ .AddThree			;$00D66C	|/

SendSPCBlock:				;```````````| Entry point for the SPC data upload loop.
	PHA						;$00D66E	|
	REP #$20				;$00D66F	|
	LDA [$95],Y				;$00D671	|\ 
	INY						;$00D673	|| Get data length.
	INY						;$00D674	||
	TAX						;$00D675	|/
	LDA [$95],Y				;$00D676	|\ 
	INY						;$00D678	|| Send the ARAM address to write to.
	INY						;$00D679	||
	STA $2142				;$00D67A	|/
	SEP #$20				;$00D67D	|
	CPX #$0001				;$00D67F	|\ 
	LDA #$00				;$00D682	|| If at the end of the data (length is 0000), send #$00.
	ROL A					;$00D684	||  Else, send #$01.
	STA $2141				;$00D685	|/
	ADC #$7F				;$00D688	|] Set overflow flag if there are still bytes left to write. 
	PLA						;$00D68A	|\ 
	STA $2140				;$00D68B	|| Send a byte to indicate the write is done,
  .waitForLoad:				;			||  then wait for the response back from the SPC chip.
	CMP $2140				;$00D68E	||
	BNE .waitForLoad		;$00D691	|/
	BVS TransferBytes		;$00D693	|] If the overflow flag was set earlier, jump back to upload additional blocks.
	REP #$20				;$00D695	|\ 
  .waitForFinish:			;			|| Wait for the SPC I/O port to be cleared.
	LDA $2140				;$00D697	||
	BNE .waitForFinish		;$00D69A	|/
	RTS						;$00D69C	|



DATA_00D69D:				;$00D69D	| 
	dl $E5087F
	dl $EC9E23
	dl $E16AFE
	dl $E4E194
	dl $E1D2F9
	dl $EC337B
	dl $EABA3C
	dl $E346AC
	dl $E94F4B
	dl $E13D82
	dl $E26001
	dl $DB5C4B
	dl $EAB7D2
	dl $EBCB97
	dl $E39EA8
	dl $E1E1A0
	dl $E5CB74
	dl $EA0571
	dl $E2872D
	dl $E7CF12
	dl $E3890E
	dl $EAB908
	dl $E0F1F4
	dl $EA62B6
	dl $E5A5F0
	dl $E7DFFB
	dl $E9EA36
	dl $E91CB5
	dl $E4C791
	dl $E57F9B
	dl $E37322
	dl $EA7FC7
	dl $E5701D
	dl $EA0C98

DATA_00D703:				;$00D703	| Pointers to song data?
	dl $D60000				; 00 - ???
	dl $DE9CD5				; 01 - ???
  .sampleBanks
	dl $ECA27B				; 02 - \ 
	dl $DEC7E4				; 03 - |
	dl $DDC599				; 04 - |
	dl $DE16FC				; 05 - | Seem to change the sample bank for the song.
	dl $DE86D9				; 06 - |
	dl $E0C28B				; 07 - |
	dl $E510C2				; 08 - |
	dl $E22A32				; 09 - |
	dl $DFB175				; 0A - /
  .songData
	dl $EC14EE				; 0B - Song 9
	dl $E1F01B				; 0C - Song 16
	dl $E1981D				; 0D - Song 42
	dl $E83C18				; 0E - Song 21
	dl $E393DD				; 0F - Song 8
	dl $E51904				; 10 - Song 38
	dl $E11ED7				; 11 - Song 11
	dl $E1C44F				; 12 - Song 19
	dl $E6FC75				; 13 - Song 10
	dl $E3FE0C				; 14 - Song 20
	dl $E4B608				; 15 - Song 18
	dl $EAC873				; 16 - Song 58
	dl $E73A57				; 17 - Song 17
	dl $EA5CDE				; 18 - Song 59
	dl $E6C382				; 19 - Song 5
	dl $E46CCF				; 1A - Song 6
	dl $E622D5				; 1B - Song 7
	dl $E445FF				; 1C - Song 12
	dl $E86155				; 1D - Song 22
	dl $E97ACD				; 1E - Song 57
	dl $E49B7A				; 1F - Song 1
	dl $E86859				; 20 - Song 2
	dl $E5392C				; 21 - Song 3
	dl $E4D04A				; 22 - Song 22
	dl $E7809E				; 23 - Song 15
	dl $E33B52				; 24 - Song 14
	dl $EA32B6				; 25 - Song 13
	dl $EB0344				; 26 - Song 48
	dl $E2AD67				; 27 - Song 50
	dl $E1FE51				; 28 - Song 51
	dl $E7E854				; 29 - Song 31
	dl $EA42F9				; 2A - Song 29
	dl $EEF770				; 2B - Song 30
	dl $EBAE20				; 2C - Song 32
	dl $E2380E				; 2D - Song 27
	dl $E20000				; 2E - Song 28
	dl $E875FB				; 2F - Song 25
	dl $E2F78F				; 30 - Song 26
	dl $E7B463				; 31 - Song 4
	dl $E26D33				; 32 - Song 37
	dl $E0D267				; 33 - Song 34
	dl $E8DC63				; 34 - Song 35
	dl $E27A3D				; 35 - Song 33
	dl $E68DA9				; 36 - Song 36
	dl $DFE7FC				; 37 - Song 54
	dl $E79D38				; 38 - Song 55
	dl $EA3113				; 39 - Song 52
	dl $E699F0				; 3A - Song 63
	dl $D6F1CE				; 3B - Song 64
	dl $E20E2E				; 3C - Song 43
	dl $E0E243				; 3D - Song 41
	dl $E4633A				; 3E - Song 45
	dl $E60000				; 3F - Song 46
	dl $E8D4AE				; 40 - Song 39
	dl $EA2A53				; 41 - Song 23
	dl $E7C1E8				; 42 - Song 44
	dl $EBD2C4				; 43 - Song 40
	dl $E2C67D				; 44 - Song 53
	dl $E6A00B				; 45 - Song 60
	dl $E35D17				; 46 - Song 49
	dl $E40000				; 47 - Song 61
	dl $E8AB42				; 48 - Song 62
	dl $E14CBC				; 49 - Song 47
	dl $EA47CE				; 4A - Song 56
	dl $DC38F1				; 4B - Song 65

DATA_00D7E7:				;$00D7E7	| Sample banks for the above songs?
	db $00,$00,$00,$00,$00,$01,$00,$00	; If zero, does not change the sample bank.
	db $00,$00,$00,$00,$00,$00,$00,$00	; If non-zero, add 1 to get the sample bank.
	db $00,$00,$00,$00,$02,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$03,$03
	db $03,$03,$03,$03,$03,$03,$00,$03
	db $03,$03,$03,$03,$03,$03,$00,$03
	db $03,$04,$04,$04,$04,$04,$00,$04
	db $00,$05,$06,$06,$07,$08,$09,$06
	db $02
	




label_00D828:				;-----------|
	STZ $73AA				;$00D828	|
	STZ $739A				;$00D82B	|
	STZ $73AE				;$00D82E	|
	STZ $73AC				;$00D831	|
	STZ $7A95				;$00D834	|
	LDA #$FF00				;$00D837	|
	STA $7384				;$00D83A	|
	LDA #$FFFF				;$00D83D	|
	STA $7386				;$00D840	|
	STZ $737C				;$00D843	|
	STZ $737E				;$00D846	|
	STZ $740B				;$00D849	|
	STZ $7A91				;$00D84C	|
	STZ $7A97				;$00D84F	|
	STZ $7A93				;$00D852	|
	STZ $7A8F				;$00D855	|
	STZ $739E				;$00D858	|
	SEP #$20				;$00D85B	|
	LDA #$02				;$00D85D	|
	STA $739D				;$00D85F	|
	STZ $739C				;$00D862	|
	STZ $7A66				;$00D865	|
	STZ $7A67				;$00D868	|
	STZ $7A68				;$00D86B	|
	REP #$20				;$00D86E	|
	LDA.w #.RunOnSNES		;$00D870	|\ 
	LDX.w #.RunOnSNES>>16	;$00D873	|| Execute the below routine on the SNES.
	JSL SA1_ExecuteSNES		;$00D876	|/
	RTL						;$00D87A	|

  .RunOnSNES:				;```````````|
	STZ $00E7				;$00D87B	|
	RTL						;$00D87E	|





label_00D87F:
	JSL label_008D85		;$00D87F	|
label_00D883:				;			|
	SEP #$20				;$00D883	|
	LDA $3091				;$00D885	|
	AND #$CF				;$00D888	|
	STA $3091				;$00D88A	|
	STZ $3092				;$00D88D	|
	STZ $309A				;$00D890	|
	STZ $3062				;$00D893	|
	STZ $3069				;$00D896	|
	STZ $306A				;$00D899	|
	STZ $306B				;$00D89C	|
	STZ $3074				;$00D89F	|
	STZ $3075				;$00D8A2	|
	STZ $3076				;$00D8A5	|
	STZ $3077				;$00D8A8	|
	REP #$20				;$00D8AB	|
	SEI						;$00D8AD	|
	LDA #$84BB				;$00D8AE	|
	STA $309B				;$00D8B1	|
	LDA #$0000				;$00D8B4	|
	STA $309D				;$00D8B7	|
	CLI						;$00D8BA	|
	STZ $3330				;$00D8BB	|
	STZ $32E2				;$00D8BE	|
	STZ $006B				;$00D8C1	|
	LDA #$FFFF				;$00D8C4	|
	STA $33C6				;$00D8C7	|
	STA $32DC				;$00D8CA	|
	STA $32DE				;$00D8CD	|
	LDX #$0004				;$00D8D0	|
label_00D8D3:				;			|
	STZ $3037,X				;$00D8D3	|
	STZ $303D,X				;$00D8D6	|
	DEX						;$00D8D9	|
	DEX						;$00D8DA	|
	BPL label_00D8D3		;$00D8DB	|
	RTL						;$00D8DD	|

label_00D8DE:
	LDA #$0003				;$00D8DE	|
	STA $737A				;$00D8E1	|
	LDA #$0003				;$00D8E4	|
	STA $738E				;$00D8E7	|
	RTL						;$00D8EA	|

label_00D8EB:
	STZ $771D				;$00D8EB	|
	STZ $7711				;$00D8EE	|
	STZ $7712				;$00D8F1	|
	STZ $7719				;$00D8F4	|
	STZ $771B				;$00D8F7	|
	STZ $7B2D				;$00D8FA	|
	STZ $771B				;$00D8FD	|
	STZ $7B49				;$00D900	|
	STZ $75EF				;$00D903	|
	STZ $73B0				;$00D906	|
	STZ $73B2				;$00D909	|
	STZ $73B4				;$00D90C	|
	JSL label_00DB54		;$00D90F	|
	JSL $03A04A				;$00D913	|
	STZ $7372				;$00D917	|
	STZ $7374				;$00D91A	|
	STZ $7376				;$00D91D	|
	STZ $7378				;$00D920	|
	LDA #$D92E				;$00D923	|
	LDX #$0000				;$00D926	|
	JSL SA1_ExecuteSNES		;$00D929	|
	RTL						;$00D92D	|

label_00D92E:
	STZ $14C7				;$00D92E	|
	STZ $14C9				;$00D931	|
	STZ $14CB				;$00D934	|
	STZ $14CD				;$00D937	|
	RTL						;$00D93A	|

label_00D93B:
	LDA #$0001				;$00D93B	|
	STA $331A				;$00D93E	|
	STZ $774F				;$00D941	|
	STZ $7751				;$00D944	|
	STZ $7753				;$00D947	|
	STZ $7755				;$00D94A	|
	STZ $7757				;$00D94D	|
	STZ $7759				;$00D950	|
	STZ $775B				;$00D953	|
	STZ $775D				;$00D956	|
	LDX #$000A				;$00D959	|
label_00D95C:				;			|
	STZ $73F5,X				;$00D95C	|
	DEX						;$00D95F	|
	DEX						;$00D960	|
	BPL label_00D95C		;$00D961	|
	STZ $7737				;$00D963	|
	STZ $7739				;$00D966	|
	STZ $773B				;$00D969	|
	STZ $773D				;$00D96C	|
	STZ $773F				;$00D96F	|
	STZ $7741				;$00D972	|
	STZ $7742				;$00D975	|
	STZ $7715				;$00D978	|
	STZ $7717				;$00D97B	|
	LDA #$0001				;$00D97E	|
	STA $770B				;$00D981	|
	STZ $7744				;$00D984	|
	LDA $32EA				;$00D987	|
	CMP #$0004				;$00D98A	|
	BNE label_00D993		;$00D98D	|
	JSL label_00DAA3		;$00D98F	|
label_00D993:				;			|
	JSL label_00CFF6		;$00D993	|
	JSL $03A123				;$00D997	|
	LDA #$D9A6				;$00D99B	|
	LDX #$0000				;$00D99E	|
	JSL SA1_ExecuteSNES		;$00D9A1	|
	RTL						;$00D9A5	|

label_00D9A6:
	STZ $14CF				;$00D9A6	|
	STZ $14D1				;$00D9A9	|
	STZ $14D3				;$00D9AC	|
	STZ $14D5				;$00D9AF	|
	STZ $332A				;$00D9B2	|
	LDX #$003E				;$00D9B5	|
	LDA #$0000				;$00D9B8	|
label_00D9BB:				;			|
	STA $001338,X			;$00D9BB	|
	DEX						;$00D9BF	|
	DEX						;$00D9C0	|
	BPL label_00D9BB		;$00D9C1	|
	RTL						;$00D9C3	|

label_00D9C4:
	STZ $7A02				;$00D9C4	|
	STZ $7709				;$00D9C7	|
	STZ $7B33				;$00D9CA	|
	STZ $7B35				;$00D9CD	|
	STZ $73A8				;$00D9D0	|
	LDA #$0001				;$00D9D3	|
	STA $770F				;$00D9D6	|
	STA $73A4				;$00D9D9	|
	LDA #$FFFF				;$00D9DC	|
	STA $77BC				;$00D9DF	|
	STA $7AD7				;$00D9E2	|
	STA $7AD9				;$00D9E5	|
	STA $7ADB				;$00D9E8	|
	STA $7ADD				;$00D9EB	|
	LDA #$FFFF				;$00D9EE	|
	STA $7A09				;$00D9F1	|
	STA $7A0B				;$00D9F4	|
	STA $7A0D				;$00D9F7	|
	STZ $7746				;$00D9FA	|
	STZ $7748				;$00D9FD	|
	STZ $774A				;$00DA00	|
	STZ $774C				;$00DA03	|
	STZ $775F				;$00DA06	|
	STZ $7761				;$00DA09	|
	STZ $7763				;$00DA0C	|
	STZ $7765				;$00DA0F	|
	STZ $770D				;$00DA12	|
	STZ $7ADF				;$00DA15	|
	LDA #$0200				;$00DA18	|
	STA $7A27				;$00DA1B	|
	LDX #$000A				;$00DA1E	|
	LDA #$FFFF				;$00DA21	|
label_00DA24:				;			|
	STA $73E9,X				;$00DA24	|
	DEX						;$00DA27	|
	DEX						;$00DA28	|
	BPL label_00DA24		;$00DA29	|
	SEP #$20				;$00DA2B	|
	LDA #$05				;$00DA2D	|
	STA $7A04				;$00DA2F	|
	LDA #$00				;$00DA32	|
	STA $774E				;$00DA34	|
	STA $7B22				;$00DA37	|
	STA $7A17				;$00DA3A	|
	STA $7A18				;$00DA3D	|
	STA $7A11				;$00DA40	|
	STA $7A12				;$00DA43	|
	STA $7A13				;$00DA46	|
	REP #$20				;$00DA49	|
	LDA #$0014				;$00DA4B	|
	STA $73A2				;$00DA4E	|
	JSL $03A1AA				;$00DA51	|
	LDA #$FFFF				;$00DA55	|
	STA $7409				;$00DA58	|
	LDA #$DA66				;$00DA5B	|
	LDX #$0000				;$00DA5E	|
	JSL SA1_ExecuteSNES		;$00DA61	|
	RTL						;$00DA65	|

label_00DA66:
	LDA #$FFFF				;$00DA66	|
	STA $14B8				;$00DA69	|
	STA $14BA				;$00DA6C	|
	STA $14BC				;$00DA6F	|
	STA $14BE				;$00DA72	|
	STA $14C0				;$00DA75	|
	STZ $14D7				;$00DA78	|
	STZ $14D9				;$00DA7B	|
	STZ $14DB				;$00DA7E	|
	STZ $14DD				;$00DA81	|
	LDA #$0201				;$00DA84	|
	STA $14C2				;$00DA87	|
	LDA #$0403				;$00DA8A	|
	STA $14C4				;$00DA8D	|
	LDA #$0504				;$00DA90	|
	STA $14C5				;$00DA93	|
	RTL						;$00DA96	|

label_00DA97:
	STA $32EA				;$00DA97	|
	STX $32EE				;$00DA9A	|
	STY $32F2				;$00DA9D	|
	LDY $39					;$00DAA0	|
	RTL						;$00DAA2	|

label_00DAA3:
	LDA #$DAFE				;$00DAA3	|\ 
	LDX $32EE				;$00DAA6	||
	CPX #$0000				;$00DAA9	|| Get base index into the table at $00DAFE?...
	BEQ label_00DAE9		;$00DAAC	||
	LDA #$DB04				;$00DAAE	||
	CPX #$0001				;$00DAB1	||
	BEQ label_00DAE9		;$00DAB4	||
	LDA #$DB0E				;$00DAB6	||
	CPX #$0002				;$00DAB9	||
	BEQ label_00DAE9		;$00DABC	||
	LDA #$DB1E				;$00DABE	||
	CPX #$0003				;$00DAC1	||
	BEQ label_00DAE9		;$00DAC4	||
	LDA #$DB2C				;$00DAC6	||
	CPX #$0004				;$00DAC9	||
	BEQ label_00DAE9		;$00DACC	||
	LDA #$DB30				;$00DACE	||
	CPX #$0005				;$00DAD1	||
	BEQ label_00DAE9		;$00DAD4	||
	LDA #$DB3E				;$00DAD6	||
	CPX #$0006				;$00DAD9	||
	BEQ label_00DAE9		;$00DADC	||
	LDA #$DB46				;$00DADE	||
	CPX #$0007				;$00DAE1	||
	BEQ label_00DAE9		;$00DAE4	||
	LDA #$DB4A				;$00DAE6	||
label_00DAE9:				;			||
	STA $14					;$00DAE9	|/
	LDA #$0000				;$00DAEB	|
	STA $16					;$00DAEE	|
	LDA $32F2				;$00DAF0	|
	ASL A					;$00DAF3	|
	TAY						;$00DAF4	|
	LDA [$14],Y				;$00DAF5	|
	CMP #$FFFF				;$00DAF7	|
	STA $73A0				;$00DAFA	|
	RTL						;$00DAFD	|

label_00DAFE:
	dw $2328
	dw $1770
	dw $0BB8
  .DB04
	dw $3A98
	dw $2EE0
	dw $2328
	dw $1770
	dw $FFFF
  .DB0E:
	dw $4C2C
	dw $4650
	dw $FFFF
	dw $FFFF
	dw $2C88
	dw $2580
	dw $FFFF
	dw $1770
  .DB1E:
	dw $4650
	dw $3A98
	dw $2EE0
	dw $2328
	dw $FFFF
	dw $1770
	dw $FFFF
  .DB2C:
	dw $5208
	dw $49D4
  .DB30:
	dw $5208
	dw $FFFF
	dw $4650
	dw $3A98
	dw $FFFF
	dw $1770
	dw $FFFF
  .DB3E:
	dw $2328
	dw $FFFF
	dw $1194
	dw $FFFF
  .DB46:
	dw $0096
	dw $FFFF
  .DB4A:
	dw $3A98
	dw $2DB4
	dw $1770
	dw $1770
	dw $FFFF



label_00DB54:
	STZ $771F				;$00DB54	|
	STZ $7721				;$00DB57	|
	STZ $7723				;$00DB5A	|
	STZ $7725				;$00DB5D	|
	RTL						;$00DB60	|



label_00DB61:
	JSL $059D24				;$00DB61	|
	LDY $39					;$00DB65	|
label_00DB67:				;			|
	SEP #$20				;$00DB67	|
	LDA #$43				;$00DB69	|
	STA $3077				;$00DB6B	|
	LDA #$10				;$00DB6E	|
	STA $3076				;$00DB70	|
	LDA #$00				;$00DB73	|
	STA $3070				;$00DB75	|
	STA $3071				;$00DB78	|
	LDA $306B				;$00DB7B	|
	ORA #$20				;$00DB7E	|
	STA $306B				;$00DB80	|
	LDA #$00				;$00DB83	|
	STA $3075				;$00DB85	|
	REP #$20				;$00DB88	|
	RTL						;$00DB8A	|

label_00DB8B:
	JSL $05A271				;$00DB8B	|
	LDY $39					;$00DB8F	|
	RTL						;$00DB91	|

label_00DB92:
	LDX #$0007				;$00DB92	|
	JSL label_009E62		;$00DB95	|
	SEP #$20				;$00DB99	|
	LDA #$DF				;$00DB9B	|
	AND $306B				;$00DB9D	|
	STA $306B				;$00DBA0	|
	LDA #$00				;$00DBA3	|
	STA $3076				;$00DBA5	|
	LDA #$00				;$00DBA8	|
	STA $3077				;$00DBAA	|
	REP #$20				;$00DBAD	|
	RTL						;$00DBAF	|

label_00DBB0:
	LDA #$0080				;$00DBB0	|
	TSB $3093				;$00DBB3	|
	RTL						;$00DBB6	|

label_00DBB7:
	LDA #$0080				;$00DBB7	|
	TRB $3093				;$00DBBA	|
	RTL						;$00DBBD	|





Reset_SNES_Debug:			;-----------| Alternative SNES reset vector, used for the debug VRAM viewer.
	SEI						;$00DBBE	|
	CLC						;$00DBBF	|
	XCE						;$00DBC0	|
	SEP #$20				;$00DBC1	|
	REP #$10				;$00DBC3	|
	LDX #$1FFF				;$00DBC5	|\ Fix stack at $1FFF.
	TXS						;$00DBC8	|/
	PHK						;$00DBC9	|
	PLB						;$00DBCA	|
	PEA $3700				;$00DBCB	|\ Change the DP to $37xx.
	PLD						;$00DBCE	|/
	LDA #$8F				;$00DBCF	|\ Enable force blank.
	STA $2100				;$00DBD1	|/
	STZ $4200				;$00DBD4	| Disable interrupts.
	STZ $420B				;$00DBD7	| Disable DMAs.
	STZ $420C				;$00DBDA	| Disable HDMAs.
	STZ $420D				;$00DBDD	| Disable fastrom.
	LDA #$20				;$00DBE0	|\ Reset the SA-1.
	STA $2200				;$00DBE2	|/
	STZ $2201				;$00DBE5	|\ 
	LDA #$A0				;$00DBE8	|| Disable IRQ and character conversion DMA (S-CPU).
	STA $2202				;$00DBEA	|/
	STZ $2220				;$00DBED	|\ 
	LDA #$01				;$00DBF0	|| Initialize Super MMC banks to not modify address accesses (S-CPU).
	STA $2221				;$00DBF2	|/
	STZ $2224				;$00DBF5	| Map $6000-$7FFF to $400000-$401FFF (S-CPU).
	LDA #$05				;$00DBF8	|\ Protect $400000-$401FFF from writes (S-CPU).
	STA $2228				;$00DBFA	|/
	LDA #$80				;$00DBFD	|\ Disable BW-RAM write protection (S-CPU).
	STA $2226				;$00DBFF	|/
	LDA #$FF				;$00DC02	|\ Enable I-RAM write (S-CPU).
	STA $2229				;$00DC04	|/
	STZ $3000				;$00DC07	|
	LDX.w #Reset_SA1_Debug	;$00DC0A	|\ Set the SA-1 debug RESET vector ($00DE26).
	STX $2203				;$00DC0D	|/
	STZ $2200				;$00DC10	| Enable SA-1.
  .waitForSA1:				;			|
	LDA $3000				;$00DC13	|\ Wait for the SA-1 chip to boot up.
	BEQ .waitForSA1			;$00DC16	|/
	LDA #$7E				;$00DC18	|
	STA $3014				;$00DC1A	|
	LDA #$80				;$00DC1D	|\ Enable force blank (again?).
	STA $305F				;$00DC1F	|/
	LDA #$FF				;$00DC22	|\ Unmask all HDMA channels.
	STA $3093				;$00DC24	|/
	REP #$20				;$00DC27	|
	STZ $3099				;$00DC29	|
	LDA #$2000				;$00DC2C	|\ Initialize the decompression buffer to $2000.
	STA $3012				;$00DC2F	|/
	LDA #$11C8				;$00DC32	|\ Initialize the NMI load to 0x11C8.
	STA $301B				;$00DC35	|/
	SEP #$20				;$00DC38	|
	LDA $3091				;$00DC3A	|\ 
	ORA #$81				;$00DC3D	|| Enable NMI and auto-joypad read.
	STA $3091				;$00DC3F	||
	STA $4200				;$00DC42	|/
	REP #$20				;$00DC45	|
	LDA #$3600				;$00DC47	|\ Change the DP to $36xx.
	TCD						;$00DC4A	|/
	STZ $20					;$00DC4B	| Clear initial VRAM page.
	STZ $28					;$00DC4D	|
	JSR .setupTilemap		;$00DC4F	| Set up the Layer 1/3 tilemap into VRAM.
  .reloadDisplay:			;			|
	JSL UpdateSprSize		;$00DC52	| Wait for NMI.
	SEP #$20				;$00DC56	|
	LDA #$0F				;$00DC58	|\ Set maximum screen brightness.
	STA $30A1				;$00DC5A	|/
	STZ $3092				;$00DC5D	| Disable all HDMA channels.
	REP #$20				;$00DC60	|
	STZ $3037				;$00DC62	|
	STZ $303D				;$00DC65	|
	STZ $303B				;$00DC68	|
	STZ $3041				;$00DC6B	|
	LDA $20					;$00DC6E	|\ 
	AND #$0003				;$00DC70	|| Make sure the VRAM page number remains 0-3.
	STA $20					;$00DC73	|/ 
	CMP #$0004				;$00DC75	|\ Hardlock the game if somehow >= 4.
  - BCS -					;$00DC78	|/
	ASL A					;$00DC7A	|
	TAX						;$00DC7B	|
	LDA.w #.returnSetup-1	;$00DC7C	|\ 
	PHA						;$00DC7F	|| Prepare the VRAM page, then return at $00DC8A.
	JMP (.pageSetup,X)		;$00DC80	|/

  .pageSetup:				;$00DC83	| Pointers to routines for setting the active VRAM page for viewing.
	dw .Debug_VramL1		; 0 - Layer 1
	dw .Debug_VramL2		; 1 - Layer 2
	dw .Debug_VramL3		; 2 - Layer 3
	dw .Debug_VramSpr		; 3 - Sprites

  .returnSetup:				;```````````| Return point after executing the above routine.
	JSL UpdtLyrsCtrlBrght	;$00DC8B	| Update controllers, layers positions, and brightness.
  .updatePosition:			;			|
	JSL UpdtLyrsCtrl		;$00DC8F	| Update controllers and layers positions.
	LDA $32D4				;$00DC93	|\ 
	TAY						;$00DC96	||
	AND #$0080				;$00DC97	|| If A is pressed, increment VRAM page and start over.
	BEQ .notA				;$00DC9A	||
	INC $20					;$00DC9C	||
	JMP .reloadDisplay		;$00DC9E	|/

  .notA:
	TYA						;$00DCA1	|\ 
	AND #$8000				;$00DCA2	||
	BEQ .notB				;$00DCA5	|| If B is pressed, decrement VRAM page and start over.
	DEC $20					;$00DCA7	||
	JMP .reloadDisplay		;$00DCA9	|/

  .notB:
	TYA						;$00DCAC	|
	AND #$0050				;$00DCAD	|\ 
	BEQ .notXR				;$00DCB0	|| If X/R is pressed, cycle the palette up one row.
	JMP .cyclePalUp			;$00DCB2	|/

  .notXR:
	TYA						;$00DCB5	|
	AND #$4020				;$00DCB6	|\ 
	BEQ .notYL				;$00DCB9	|| If Y/L is pressed, cycle the palette down one row.
	JMP .cyclePalDown		;$00DCBB	|/

  .notYL:
	LDA $32C4				;$00DCBE	|\ 
	TAY						;$00DCC1	||
	AND #$0800				;$00DCC2	||
	BEQ .notUp				;$00DCC5	|| If up is held, move the page down.
	LDA $303D				;$00DCC7	||
	CLC						;$00DCCA	||
	ADC #$0004				;$00DCCB	||
	STA $303D				;$00DCCE	||
	STA $3041				;$00DCD1	|/
  .notUp:					;			|
	TYA						;$00DCD4	|\ 
	AND #$0400				;$00DCD5	||
	BEQ .notDown			;$00DCD8	||
	LDA $303D				;$00DCDA	|| If down is held, mvoe the page up.
	SEC						;$00DCDD	||
	SBC #$0004				;$00DCDE	||
	STA $303D				;$00DCE1	||
	STA $3041				;$00DCE4	|/
  .notDown:					;			|
	JMP .updatePosition		;$00DCE7	|



  .cyclePalDown:			;```````````| Cycle the palette down one row.
	DEC $28					;$00DCEA	|
	LDY #$01E0				;$00DCEC	|\ Copy row F into $00-$1F.
	JSR .CopyPalTo00		;$00DCEF	|/
	PHB						;$00DCF2	|
	LDA #$01DF				;$00DCF3	|\ 
	LDX #$06DF				;$00DCF6	|| Copy 0x1E0 bytes from $0500 into $0520.
	LDY #$06FF				;$00DCF9	||  Effectively, shift the entire palette down one row.
	MVP $0000				;$00DCFC	|/
	PLB						;$00DCFF	|
	LDY #$0000				;$00DD00	|\ Copy the colors from $00-$1F into row 0.
	BRA .writePalFrom00		;$00DD03	|/


  .cyclePalUp:				;```````````| Cycle the palette up one row.
	INC $28					;$00DD05	|
	LDY #$0000				;$00DD07	|\ Copy row 0 into $00-$1F.
	JSR .CopyPalTo00		;$00DD0A	|/
	PHB						;$00DD0D	|
	LDA #$01DF				;$00DD0E	|\ 
	LDX #$0520				;$00DD11	|| Copy 0x1E0 bytes from $0520 into $0500.
	LDY #$0500				;$00DD14	||  Effectively, shift the entire palette up one row.
	MVN $0000				;$00DD17	|/
	PLB						;$00DD1A	|
	LDY #$01E0				;$00DD1B	|\ 
  .writePalFrom00:			;			||
	LDX #$0000				;$00DD1E	||
  -	LDA $00,X				;$00DD21	||
	STA $0500,Y				;$00DD23	|| Copy the colors from $00-$1F into row F.
	INY						;$00DD26	||  
	INY						;$00DD27	||
	INX						;$00DD28	||
	INX						;$00DD29	||
	CPX #$0020				;$00DD2A	||
	BNE -					;$00DD2D	|/
	LDA $28					;$00DD2F	|
	AND #$000F				;$00DD31	|
	STA $28					;$00DD34	|
	JMP .updatePosition		;$00DD36	|


  .CopyPalTo00:				;-----------| Subroutine to copy a palette row into $00-$1F. Y = starting index.
	LDX #$0000				;$00DD39	|\ 
  -	LDA $0500,Y				;$00DD3C	||
	STA $00,X				;$00DD3F	||
	INY						;$00DD41	|| Copy the colors from the palette row
	INY						;$00DD42	||  and write them into $00-$1F.
	INX						;$00DD43	||
	INX						;$00DD44	||
	CPX #$0020				;$00DD45	||
	BNE -					;$00DD48	|/
	RTS						;$00DD4A	|


  .Debug_VramL1:			;-----------| Debug VRAM viewer, page 1 - Layer 1
	LDA #$0002				;$00DD4B	|\ 
	LDX #$0000				;$00DD4E	|| Layer 1 tilemap at VRAM address $5400,
	LDY #$5400				;$00DD51	||  and GFX files at $0000. Size is 512x256.
	JSL SetupLayer1VRAM		;$00DD54	|/
	LDA #$0001				;$00DD58	|\ Designate Layer 1 to the main screen.
	STA $003072				;$00DD5B	|/
	RTS						;$00DD5F	|

  .Debug_VramL2:			;-----------| Debug VRAM viewer, page 2 - Layer 2
	LDA #$0002				;$00DD60	|\ 
	LDX #$2000				;$00DD63	|| Layer 1 tilemap at VRAM address $5400,
	LDY #$5400				;$00DD66	||  and GFX files at $2000. Size is 512x256.
	JSL SetupLayer1VRAM		;$00DD69	|/
	LDA #$0001				;$00DD6D	|\ Designate Layer 1 to the main screen.
	STA $003072				;$00DD70	|/
	RTS						;$00DD74	|

  .Debug_VramL3:			;-----------| Debug VRAM viewer, page 3 - Layer 3
	LDA #$0002				;$00DD75	|\ 
	LDX #$4000				;$00DD78	|| Layer 3 tilemap at VRAM address $5400,
	LDY #$5400				;$00DD7B	||  and GFX files at $4000. Size is 512x256.
	JSL SetupLayer3VRAM		;$00DD7E	|/
	LDA #$0004				;$00DD82	|\ Designate Layer 3 to the main screen.
	STA $003072				;$00DD85	|/
	RTS						;$00DD89	|

  .Debug_VramSpr:			;-----------| Debug VRAM viewer, page 4 - Sprites
	LDA #$0002				;$00DD8A	|\ 
	LDX #$6000				;$00DD8D	|| Layer 1 tilemap at VRAM address $5400,
	LDY #$5400				;$00DD90	||  and GFX files at $6000. Size is 512x256.
	JSL SetupLayer1VRAM		;$00DD93	|/
	LDA #$0001				;$00DD97	|\ Designate Layer 1 to the main screen.
	STA $003072				;$00DD9A	|/
	RTS						;$00DD9E	|



  .setupTilemap:
	JSL UpdateSprSize		;$00DD9F	| Wait for NMI.
	LDA #$0001				;$00DDA3	|\ Switch to SNES mode 1 (no layer 3 priority).
	JSL UpdateSNESMode		;$00DDA6	|/
	JSR .Debug_VramL1		;$00DDAA	|\ 
	JSR .Debug_VramL2		;$00DDAD	|| Useless?...
	JSR .Debug_VramL3		;$00DDB0	|/
	LDA #$DE12				;$00DDB3	|\ Load the DMA table at $00DE12.
	LDX #$0000				;$00DDB6	|| This clears out the Layer 1 tilemap in VRAM.
	JSL LoadDMATable		;$00DDB9	|/
	PHB						;$00DDBD	|
	PEA $7F7F				;$00DDBE	|\ 
	PLB						;$00DDC1	||
	PLB						;$00DDC2	||
	STZ $0000				;$00DDC3	|| Clear out the tilemap in $7F0000-$7F0FFF.
	LDA #$0FFF				;$00DDC6	||
	LDX #$0000				;$00DDC9	||
	LDY #$0001				;$00DDCC	||
	MVN $7F7F				;$00DDCF	|/
	LDX #$0190				;$00DDD2	|\ Loop to write the tilemap into $7F0000. 
	LDA #$0000				;$00DDD5	||  A = tile number, Y = YXPCCCTT, X = VRAM address.
	LDY #$0002				;$00DDD8	||\ Number of pages...
	STY $26					;$00DDDB	||/
  .tilePageLoop:			;			||
	LDY #$0010				;$00DDDD	||\ ...Number of rows per page...
	STY $24					;$00DDE0	||/
  .tileRowLoop:				;			||
	LDY #$0010				;$00DDE2	||] ...Number of tiles per row.
  .tileTileLoop:			;			||
	STA $0000,X				;$00DDE5	||
	INC A					;$00DDE8	||
	INX						;$00DDE9	||\ 
	INX						;$00DDEA	||| Loop for each tile in the row.
	DEY						;$00DDEB	|||
	BNE .tileTileLoop		;$00DDEC	||/
	PHA						;$00DDEE	||
	TXA						;$00DDEF	||\ 
	CLC						;$00DDF0	||| Advance to next row.
	ADC #$0020				;$00DDF1	|||
	TAX						;$00DDF4	||/
	PLA						;$00DDF5	||
	DEC $24					;$00DDF6	||\ Loop for each row in the page.
	BNE .tileRowLoop		;$00DDF8	||/
	PHA						;$00DDFA	||
	TXA						;$00DDFB	||\ 
	CLC						;$00DDFC	||| Advance to next page.
	ADC #$0080				;$00DDFD	|||
	TAX						;$00DE00	||/
	PLA						;$00DE01	||
	DEC $26					;$00DE02	||\ Loop for each page.
	BNE .tilePageLoop		;$00DE04	|//
	PLB						;$00DE06	|
	LDA #$DE1D				;$00DE07	|\ Load the DMA table at $00DE1D.
	LDX #$0000				;$00DE0A	|| This table writes $7F0000 into the the VRAM tilemap.
	JSL LoadDMATable		;$00DE0D	|/
	RTS						;$00DE11	|


DATA_00DE12:				;$00DE12	| DMA table for the debug VRAM viewer, to clear the Layer 1/3 tilemap.
	db $06 : dw $1000 : dl .zero : dw $5400		; Clear 0x1000 bytes at $5400.
	db $FF

  .zero:					;$00DE1B	| Data used for the above fixed transfer.
	dw $0000

DATA_00DE1D:				;$00DE1D	| DMA table for teh debug VRAM viewer, to upload the Layer 1/3 tilemap.
	db $03 : dw $1000 : dl $7F0000 : dw $5400	; Transfer 0x1000 bytes from $7F0000 to $5400.
	db $FF



Reset_SA1_Debug:			;-----------| Alternative SA-1 reset vector, used for the debug VRAM viewer.
	SEI						;$00DE26	|
	CLC						;$00DE27	|
	XCE						;$00DE28	|
	SEP #$20				;$00DE29	|
	STZ $2230				;$00DE2B	|\ Disable SA-1 DMA.
	STZ $2209				;$00DE2E	|/
	LDA #$FF				;$00DE31	|\ 
	STA $222A				;$00DE33	||
	STZ $2225				;$00DE36	|| Enable I-RAM and BW-RAM write.
	LDA #$80				;$00DE39	||
	STA $2227				;$00DE3B	|/
	STA $220A				;$00DE3E	| Switch IRQ control to SA-1.
	LDX #$37FF				;$00DE41	|\ Fix stack at $37FF.
	TXS						;$00DE44	|/
	LDA #$00				;$00DE45	|\ Change DP to $00xx.
	TCD						;$00DE47	|/
	REP #$20				;$00DE48	|
	LDA #$FFFF				;$00DE4A	|\ Set the standard palette as the default.
	STA $32DC				;$00DE4D	|/
	STA $3000				;$00DE50	|] SA-1 identification value.
  .retFromCmd				;```````````| Return point after the SA-1 has executed a command.
	STZ $300A				;$00DE53	|
	LDA #$0001				;$00DE56	|\ 
	STA $2209				;$00DE59	||
  .waitForSNES:				;			|| Tell the SNES to resume, and wait for commands.
	BIT $300A				;$00DE5C	||
	BPL .waitForSNES		;$00DE5F	|/
	STZ $2209				;$00DE61	|
	PHK						;$00DE64	|
	PEA .retFromCmd-1		;$00DE65	|\ Execute the command, then return back to the loop.
	JMP [$3008]				;$00DE68	|/





label_00DE6B:				;-----------| Subroutine to do... Something. Has a whole LOT of alternative entry points.
	LDX $39					;$00DE6B	|
	INC $6436,X				;$00DE6D	|
	JMP label_00E181		;$00DE70	|
label_00DE73:				;```````````|
	LDX $39					;$00DE73	|
	INC $6436,X				;$00DE75	|
	LDA #$0001				;$00DE78	|
	JMP label_00E181		;$00DE7B	|
label_00DE7E:				;```````````|
	LDX $39					;$00DE7E	|
	INC $6436,X				;$00DE80	|
	LDA #$0002				;$00DE83	|
	JMP label_00E181		;$00DE86	|
label_00DE89:				;```````````|
	LDX $39					;$00DE89	|
	INC $6436,X				;$00DE8B	|
	LDA #$0003				;$00DE8E	|
	JMP label_00E181		;$00DE91	|
label_00DE94:				;```````````|
	LDX $39					;$00DE94	|
	INC $6436,X				;$00DE96	|
	LDA #$0004				;$00DE99	|
	JMP label_00E181		;$00DE9C	|
label_00DE9F:				;```````````|
	LDX $39					;$00DE9F	|
	INC $6436,X				;$00DEA1	|
	LDA #$0005				;$00DEA4	|
	JMP label_00E181		;$00DEA7	|
label_00DEAA:				;```````````|
	LDX $39					;$00DEAA	|
	INC $6436,X				;$00DEAC	|
	LDA #$0006				;$00DEAF	|
	JMP label_00E181		;$00DEB2	|
label_00DEB5:				;```````````|
	LDX $39					;$00DEB5	|
	INC $6436,X				;$00DEB7	|
	LDA #$0007				;$00DEBA	|
	JMP label_00E181		;$00DEBD	|
label_00DEC0:				;```````````|
	LDX $39					;$00DEC0	|
	INC $6436,X				;$00DEC2	|
	LDA #$0008				;$00DEC5	|
	JMP label_00E181		;$00DEC8	|
label_00DECB:				;```````````|
	LDX $39					;$00DECB	|
	INC $6436,X				;$00DECD	|
	LDA #$0009				;$00DED0	|
	JMP label_00E181		;$00DED3	|
label_00DED6:				;```````````|
	LDX $39					;$00DED6	|
	INC $6436,X				;$00DED8	|
	LDA #$000A				;$00DEDB	|
	JMP label_00E181		;$00DEDE	|
label_00DEE1:				;```````````|
	LDX $39					;$00DEE1	|
	INC $6436,X				;$00DEE3	|
	LDA #$000B				;$00DEE6	|
	JMP label_00E181		;$00DEE9	|
label_00DEEC:				;```````````|
	LDX $39					;$00DEEC	|
	INC $6436,X				;$00DEEE	|
	LDA #$000C				;$00DEF1	|
	JMP label_00E181		;$00DEF4	|
label_00DEF7:				;```````````|
	LDX $39					;$00DEF7	|
	INC $6436,X				;$00DEF9	|
	LDA #$000D				;$00DEFC	|
	JMP label_00E181		;$00DEFF	|
label_00DF02:				;```````````|
	LDX $39					;$00DF02	|
	INC $6436,X				;$00DF04	|
	LDA #$000E				;$00DF07	|
	JMP label_00E181		;$00DF0A	|
label_00DF0D:				;```````````|
	LDX $39					;$00DF0D	|
	INC $6436,X				;$00DF0F	|
	LDA #$000F				;$00DF12	|
	JMP label_00E181		;$00DF15	|
label_00DF18:				;```````````|
	LDX $39					;$00DF18	|
	INC $6436,X				;$00DF1A	|
	LDA #$0010				;$00DF1D	|
	JMP label_00E181		;$00DF20	|
label_00DF23:				;```````````|
	LDX $39					;$00DF23	|
	DEC $6436,X				;$00DF25	|
	JMP label_00E181		;$00DF28	|
label_00DF2B:				;```````````|
	LDX $39					;$00DF2B	|
	DEC $6436,X				;$00DF2D	|
	LDA #$0001				;$00DF30	|
	JMP label_00E181		;$00DF33	|
label_00DF36:				;```````````|
	LDX $39					;$00DF36	|
	DEC $6436,X				;$00DF38	|
	LDA #$0002				;$00DF3B	|
	JMP label_00E181		;$00DF3E	|
label_00DF41:				;```````````|
	LDX $39					;$00DF41	|
	DEC $6436,X				;$00DF43	|
	LDA #$0003				;$00DF46	|
	JMP label_00E181		;$00DF49	|
label_00DF4C:				;```````````|
	LDX $39					;$00DF4C	|
	DEC $6436,X				;$00DF4E	|
	LDA #$0004				;$00DF51	|
	JMP label_00E181		;$00DF54	|
label_00DF57:				;```````````|
	LDX $39					;$00DF57	|
	DEC $6436,X				;$00DF59	|
	LDA #$0005				;$00DF5C	|
	JMP label_00E181		;$00DF5F	|
label_00DF62:				;```````````|
	LDX $39					;$00DF62	|
	DEC $6436,X				;$00DF64	|
	LDA #$0006				;$00DF67	|
	JMP label_00E181		;$00DF6A	|
label_00DF6D:				;```````````|
	LDX $39					;$00DF6D	|
	DEC $6436,X				;$00DF6F	|
	LDA #$0007				;$00DF72	|
	JMP label_00E181		;$00DF75	|
label_00DF78:				;```````````|
	LDX $39					;$00DF78	|
	DEC $6436,X				;$00DF7A	|
	LDA #$0008				;$00DF7D	|
	JMP label_00E181		;$00DF80	|
label_00DF83:				;```````````|
	LDX $39					;$00DF83	|
	DEC $6436,X				;$00DF85	|
	LDA #$0009				;$00DF88	|
	JMP label_00E181		;$00DF8B	|
label_00DF8E:				;```````````|
	LDX $39					;$00DF8E	|
	DEC $6436,X				;$00DF90	|
	LDA #$000A				;$00DF93	|
	JMP label_00E181		;$00DF96	|
label_00DF99:				;```````````|
	LDX $39					;$00DF99	|
	DEC $6436,X				;$00DF9B	|
	LDA #$000B				;$00DF9E	|
	JMP label_00E181		;$00DFA1	|
label_00DFA4:				;```````````|
	LDX $39					;$00DFA4	|
	DEC $6436,X				;$00DFA6	|
	LDA #$000C				;$00DFA9	|
	JMP label_00E181		;$00DFAC	|
label_00DFAF:				;```````````|
	LDX $39					;$00DFAF	|
	DEC $6436,X				;$00DFB1	|
	LDA #$000D				;$00DFB4	|
	JMP label_00E181		;$00DFB7	
label_00DFBA:				;```````````|
	LDX $39					;$00DFBA	|
	DEC $6436,X				;$00DFBC	|
	LDA #$000E				;$00DFBF	|
	JMP label_00E181		;$00DFC2	|
label_00DFC5:				;```````````|
	LDX $39					;$00DFC5	|
	DEC $6436,X				;$00DFC7	|
	LDA #$000F				;$00DFCA	|
	JMP label_00E181		;$00DFCD	|
label_00DFD0:				;```````````|
	LDX $39					;$00DFD0	|
	DEC $6436,X				;$00DFD2	|
	LDA #$0010				;$00DFD5	|
	JMP label_00E181		;$00DFD8	|
label_00DFDB:				;```````````|
	LDX $39					;$00DFDB	|
	STA $6436,X				;$00DFDD	|
	LDA #$0001				;$00DFE0	|
	JMP label_00E181		;$00DFE3	|
label_00DFE6:				;```````````|
	LDX $39					;$00DFE6	|
	STA $6436,X				;$00DFE8	|
	LDA #$0002				;$00DFEB	|
	JMP label_00E181		;$00DFEE	|
label_00DFF1:				;```````````|
	LDX $39					;$00DFF1	|
	STA $6436,X				;$00DFF3	|
	LDA #$0003				;$00DFF6	|
	JMP label_00E181		;$00DFF9	|
label_00DFFC:				;```````````|
	LDX $39					;$00DFFC	|
	STA $6436,X				;$00DFFE	|
	LDA #$0004				;$00E001	|
	JMP label_00E181		;$00E004	|
label_00E007:				;```````````|
	LDX $39					;$00E007	|
	STA $6436,X				;$00E009	|
	LDA #$0005				;$00E00C	|
	JMP label_00E181		;$00E00F	|
label_00E012:				;```````````|
	LDX $39					;$00E012	|
	STA $6436,X				;$00E014	|
	LDA #$0006				;$00E017	|
	JMP label_00E181		;$00E01A	|
label_00E01D:				;```````````|
	LDX $39					;$00E01D	|
	STA $6436,X				;$00E01F	|
	LDA #$0007				;$00E022	|
	JMP label_00E181		;$00E025	|
label_00E028:				;```````````|
	LDX $39					;$00E028	|
	STA $6436,X				;$00E02A	|
	LDA #$0008				;$00E02D	|
	JMP label_00E181		;$00E030	|
label_00E033:				;```````````|
	LDX $39					;$00E033	|
	STA $6436,X				;$00E035	|
	LDA #$0009				;$00E038	|
	JMP label_00E181		;$00E03B	|
label_00E03E:				;```````````|
	LDX $39					;$00E03E	|
	STA $6436,X				;$00E040	|
	LDA #$000A				;$00E043	|
	JMP label_00E181		;$00E046	|
label_00E049:				;```````````|
	LDX $39					;$00E049	|
	STA $6436,X				;$00E04B	|
	LDA #$000B				;$00E04E	|
	JMP label_00E181		;$00E051	|
label_00E054:				;```````````|
	LDX $39					;$00E054	|
	STA $6436,X				;$00E056	|
	LDA #$000C				;$00E059	|
	JMP label_00E181		;$00E05C	|
label_00E05F:				;```````````|
	LDX $39					;$00E05F	|
	STA $6436,X				;$00E061	|
	LDA #$000D				;$00E064	|
	JMP label_00E181		;$00E067	|
label_00E06A:				;```````````|
	LDX $39					;$00E06A	|
	STA $6436,X				;$00E06C	|
	LDA #$000E				;$00E06F	|
	JMP label_00E181		;$00E072	|
label_00E075:				;```````````|
	LDX $39					;$00E075	|
	STA $6436,X				;$00E077	|
	LDA #$000F				;$00E07A	|
	JMP label_00E181		;$00E07D	|
label_00E080:				;```````````|
	LDX $39					;$00E080	|
	STA $6436,X				;$00E082	|
	LDA #$0010				;$00E085	|
	JMP label_00E181		;$00E088	|
label_00E08B:				;```````````|
	LDA #$0000				;$00E08B	|
	JMP label_00E17F		;$00E08E	|
label_00E091:				;```````````|
	LDA #$0001				;$00E091	|
	JMP label_00E17F		;$00E094	|
label_00E097:				;```````````|
	LDA #$0002				;$00E097	|
	JMP label_00E17F		;$00E09A	|
label_00E09D:				;```````````|
	LDA #$0003				;$00E09D	|
	JMP label_00E17F		;$00E0A0	|
label_00E0A3:				;```````````|
	LDA #$0004				;$00E0A3	|
	JMP label_00E17F		;$00E0A6	|
label_00E0A9:				;```````````|
	LDA #$0005				;$00E0A9	|
	JMP label_00E17F		;$00E0AC	|
label_00E0AF:				;```````````|
	LDA #$0006				;$00E0AF	|
	JMP label_00E17F		;$00E0B2	|
label_00E0B5:				;```````````|
	LDA #$0007				;$00E0B5	|
	JMP label_00E17F		;$00E0B8	|
label_00E0BB:				;```````````|
	LDA #$0008				;$00E0BB	|
	JMP label_00E17F		;$00E0BE	|
label_00E0C1:				;```````````|
	LDA #$0009				;$00E0C1	|
	JMP label_00E17F		;$00E0C4	|
label_00E0C7:				;```````````|
	LDA #$000A				;$00E0C7	|
	JMP label_00E17F		;$00E0CA	|
label_00E0CD:				;```````````|
	LDA #$000B				;$00E0CD	|
	JMP label_00E17F		;$00E0D0	|
label_00E0D3:				;```````````|
	LDA #$000C				;$00E0D3	|
	JMP label_00E17F		;$00E0D6	|
label_00E0D9:				;```````````|
	LDA #$000D				;$00E0D9	|
	JMP label_00E17F		;$00E0DC	|
label_00E0DF:				;```````````|
	LDA #$000E				;$00E0DF	|
	JMP label_00E17F		;$00E0E2	|
label_00E0E5:				;```````````|
	LDA #$000F				;$00E0E5	|
	JMP label_00E17F		;$00E0E8	|
label_00E0EB:				;```````````|
	LDA #$0010				;$00E0EB	|
	JMP label_00E17F		;$00E0EE	|
label_00E0F1:				;```````````|
	LDA #$0011				;$00E0F1	|
	JMP label_00E17F		;$00E0F4	|
label_00E0F7:				;```````````|
	LDA #$0012				;$00E0F7	|
	JMP label_00E17F		;$00E0FA	|
label_00E0FD:				;```````````|
	LDA #$0013				;$00E0FD	|
	JMP label_00E17F		;$00E100	|
label_00E103:				;```````````|
	LDA #$0014				;$00E103	|
	JMP label_00E17F		;$00E106	|
label_00E109:				;```````````|
	LDA #$0015				;$00E109	|
	JMP label_00E17F		;$00E10C	|
label_00E10F:				;```````````|
	LDA #$0016				;$00E10F	|
	JMP label_00E17F		;$00E112	|
label_00E115:				;```````````|
	LDA #$0017				;$00E115	|
	JMP label_00E17F		;$00E118	|
label_00E11B:				;```````````|
	LDA #$0018				;$00E11B	|
	JMP label_00E17F		;$00E11E	|
label_00E121:				;```````````|
	LDA #$0019				;$00E121	|
	JMP label_00E17F		;$00E124	|
label_00E127:				;```````````|
	LDA #$001A				;$00E127	|
	JMP label_00E17F		;$00E12A	|
label_00E12D:				;```````````|
	LDA #$001B				;$00E12D	|
	JMP label_00E17F		;$00E130	|
label_00E133:				;```````````|
	LDA #$001C				;$00E133	|
	JMP label_00E17F		;$00E136	|
label_00E139:				;```````````|
	LDA #$001D				;$00E139	|
	JMP label_00E17F		;$00E13C	
label_00E13F:				;```````````|
	LDA #$001E				;$00E13F	|
	JMP label_00E17F		;$00E142	|
label_00E145:				;```````````|
	LDA #$001F				;$00E145	|
	JMP label_00E17F		;$00E148	|
label_00E14B:				;```````````|
	LDA #$0020				;$00E14B	|
	JMP label_00E17F		;$00E14E	|
label_00E151:				;```````````|
	LDA #$0028				;$00E151	|
	JMP label_00E17F		;$00E154	|
label_00E157:				;```````````|
	LDA #$0030				;$00E157	|
	JMP label_00E17F		;$00E15A	|
label_00E15D:				;```````````|
	LDA #$003C				;$00E15D	|
	JMP label_00E17F		;$00E160	|
label_00E163:				;```````````|
	LDA #$0040				;$00E163	|
	JMP label_00E17F		;$00E166	|
label_00E169:				;```````````|
	LDX $39					;$00E169	|
	TAY						;$00E16B	|
	AND #$00FF				;$00E16C	|
	CMP #$00FF				;$00E16F	|
	BNE label_00E177		;$00E172	|
	LDA #$FFFF				;$00E174	|
label_00E177:				;			|
	STA $6436,X				;$00E177	|
	TYA						;$00E17A	|
	AND #$FF00				;$00E17B	|
	XBA						;$00E17E	|
label_00E17F:				;			|
	LDX $39					;$00E17F	|
label_00E181:				;			|
	DEC A					;$00E181	|
	STA $6724,X				;$00E182	|
	PLA						;$00E185	|
	INC A					;$00E186	|
	STA $679E,X				;$00E187	|
	SEP #$20				;$00E18A	|
	PLA						;$00E18C	|
	STA $6818,X				;$00E18D	|
	REP #$20				;$00E190	|
	RTL						;$00E192	|


label_00E193:
	STA $6436,Y				;$00E193	|
	TXA						;$00E196	|
	TYX						;$00E197	|
	JMP label_00E181		;$00E198	|


label_00E19B:
	INC $3D					;$00E19B	|
	CMP [$3D]				;$00E19D	|\ Hardlock the game if byte 2 >= byte 1?
  - BCS -					;$00E19F	|/
	INC $3D					;$00E1A1	|
	INC $3D					;$00E1A3	|
	STA $28					;$00E1A5	|
	ASL A					;$00E1A7	|
	ADC $28					;$00E1A8	|
	TAY						;$00E1AA	|
	LDA [$3D],Y				;$00E1AB	|
	DEC A					;$00E1AD	|
	TAX						;$00E1AE	|
	INY						;$00E1AF	|
	LDA [$3D],Y				;$00E1B0	|
	STA $3E					;$00E1B2	|
	STX $3D					;$00E1B4	|
	RTL						;$00E1B6	|

label_00E1B7:
	STA $633C,Y				;$00E1B7	|
	TXA						;$00E1BA	|
	STA $63B6,Y				;$00E1BB	|
	RTL						;$00E1BE	|

label_00E1BF:
	LDA #$8F63				;$00E1BF	|
	STA $633C,Y				;$00E1C2	|
	LDA #$0000				;$00E1C5	|
	STA $63B6,Y				;$00E1C8	|
	RTL						;$00E1CB	|

label_00E1CC:
	STA $6536,Y				;$00E1CC	|
	TXA						;$00E1CF	|
	AND #$00FF				;$00E1D0	|
	STA $65B0,Y				;$00E1D3	|
	RTL						;$00E1D6	|

label_00E1D7:
	LDX $778C				;$00E1D7	|
	BEQ label_00E1DD		;$00E1DA	|
	INC A					;$00E1DC	|
label_00E1DD:				;			|
	STA $6436,Y				;$00E1DD	|
	RTL						;$00E1E0	|

label_00E1E1:
	CMP #$0000				;$00E1E1	|
	BNE label_00E1EF		;$00E1E4	|
	TXA						;$00E1E6	|
	XBA						;$00E1E7	|
	AND #$00FF				;$00E1E8	|
	STA $6436,Y				;$00E1EB	|
	RTL						;$00E1EE	|
label_00E1EF:				;			|
	TXA						;$00E1EF	|
	AND #$00FF				;$00E1F0	|
	STA $6436,Y				;$00E1F3	|
	RTL						;$00E1F6	|

label_00E1F7:
	LDX $6DD0,Y				;$00E1F7	|
	BPL label_00E1FD		;$00E1FA	|
	INC A					;$00E1FC	|
label_00E1FD:				;			|
	STA $6436,Y				;$00E1FD	|
	RTL						;$00E200	|

label_00E201:
	LDX $6DD0,Y				;$00E201	|
	BMI $F7					;$00E204	|
	INC A					;$00E206	|
	STA $6436,Y				;$00E207	|
	RTL						;$00E20A	|

label_00E20B:
	LDX $6DD0,Y				;$00E20B	|
	BMI label_00E211		;$00E20E	|
	INC A					;$00E210	|
label_00E211:				;			|
	STA $6436,Y				;$00E211	|
	RTL						;$00E214	|

label_00E215:
	PHA						;$00E215	|
	AND #$00FF				;$00E216	|
	LDX $778C				;$00E219	|
	BEQ label_00E21F		;$00E21C	|
	INC A					;$00E21E	|
label_00E21F:				;			|
	STA $6436,Y				;$00E21F	|
	PLA						;$00E222	|
	AND #$FF00				;$00E223	|
	XBA						;$00E226	|
	JMP label_00E17F		;$00E227	|

label_00E22A:
	PHA						;$00E22A	|
	AND #$00FF				;$00E22B	|
	LDX $6DD0,Y				;$00E22E	|
	BPL label_00E234		;$00E231	|
	INC A					;$00E233	|
label_00E234:				;			|
	STA $6436,Y				;$00E234	|
	PLA						;$00E237	|
	AND #$FF00				;$00E238	|
	XBA						;$00E23B	|
	JMP label_00E17F		;$00E23C	|

label_00E23F:
	PHA						;$00E23F	|
	AND #$00FF				;$00E240	|
	LDX $6DD0,Y				;$00E243	|
	BMI label_00E249		;$00E246	|
	INC A					;$00E248	|
label_00E249:				;			|
	STA $6436,Y				;$00E249	|
	PLA						;$00E24C	|
	AND #$FF00				;$00E24D	|
	XBA						;$00E250	|
	JMP label_00E17F		;$00E251	|

label_00E254:
	PHA						;$00E254	|
	AND #$00FF				;$00E255	|
	LDX $6DD0,Y				;$00E258	|
	BMI label_00E25E		;$00E25B	|
	INC A					;$00E25D	|
label_00E25E:				;			|
	STA $6436,Y				;$00E25E	|
	PLA						;$00E261	|
	AND #$FF00				;$00E262	|
	XBA						;$00E265	|
	JMP label_00E17F		;$00E266	|

label_00E269:
	TYX						;$00E269	|
	INC $6436,X				;$00E26A	|
	INC $6436,X				;$00E26D	|
	JMP label_00E17F		;$00E270	|

label_00E273:
	TYX						;$00E273	|
	DEC $6436,X				;$00E274	|
	DEC $6436,X				;$00E277	|
	JMP label_00E17F		;$00E27A	|

label_00E27D:
	LDX $6DD0,Y				;$00E27D	|
	BRA label_00E285		;$00E280	|
	LDX $778C				;$00E282	|
label_00E285:				;			|
	CPX #$4000				;$00E285	|
	BEQ label_00E28E		;$00E288	|
	EOR #$FFFF				;$00E28A	|
	INC A					;$00E28D	|
label_00E28E:				;			|
	STA $6986,Y				;$00E28E	|
	LDA #$8000				;$00E291	|
	STA $6A7A,Y				;$00E294	|
	RTL						;$00E297	|

label_00E298:
	STA $6A00,Y				;$00E298	|
	LDA #$8000				;$00E29B	|
	STA $6AF4,Y				;$00E29E	|
	RTL						;$00E2A1	|

label_00E2A2:
	STA $6986,Y				;$00E2A2	|
	LDA $6DD0,Y				;$00E2A5	|
	CMP #$4000				;$00E2A8	|
	BEQ label_00E2B1		;$00E2AB	|
	TXA						;$00E2AD	|
	STA $6986,Y				;$00E2AE	|
label_00E2B1:				;			|
	LDA #$8000				;$00E2B1	|
	STA $6A7A,Y				;$00E2B4	|
	RTL						;$00E2B7	|

label_00EDB8:
	STA $6986,Y				;$00E2B8	|
	LDA $6DD0,Y				;$00E2BB	|
	CMP #$4000				;$00E2BE	|
	BNE label_00E2C7		;$00E2C1	|
	TXA						;$00E2C3	|
	STA $6986,Y				;$00E2C4	|
label_00E2C7:				;			|
	LDA #$8000				;$00E2C7	|
	STA $6A7A,Y				;$00E2CA	|
	RTL						;$00E2CD	|

label_00E2CE:
	PHX						;$00E2CE	|
	TYX						;$00E2CF	|
	LDY $6DD0,X				;$00E2D0	|
	PLX						;$00E2D3	|
	BRA label_00E2D9		;$00E2D4	|

label_00E2D6:
	LDY $778C				;$00E2D6	|
label_00E2D9:				;			|
	CPY #$4000				;$00E2D9	|
	BEQ label_00E2E2		;$00E2DC	|
	EOR #$FFFF				;$00E2DE	|
	INC A					;$00E2E1	|
label_00E2E2:				;			|
	LDY $39					;$00E2E2	|
	STA $6986,Y				;$00E2E4	|
	LDA #$8000				;$00E2E7	|
	STA $6A7A,Y				;$00E2EA	|
	TXA						;$00E2ED	|
	STA $6A00,Y				;$00E2EE	|
	LDA #$8000				;$00E2F1	|
	STA $6AF4,Y				;$00E2F4	|
	RTL						;$00E2F7	|

label_00E2F8:
	LDA #$A6EC				;$00E2F8	|
	BRA label_00E33A		;$00E2FB	|

label_00E2FD:
	LDA #$A6F1				;$00E2FD	|
	BRA label_00E33A		;$00E300	|

label_00E302:
	LDA #$A6FB				;$00E302	|
	BRA label_00E33A		;$00E305	|

label_00E307:
	LDA #$A713				;$00E307	|
	BRA label_00E33A		;$00E30A	|

label_00E30C:
	TYX						;$00E30C	|
	STZ $6B6E,X				;$00E30D	|
	STZ $6BE8,X				;$00E310	|
	STZ $6C62,X				;$00E313	|
	STZ $6CDC,X				;$00E316	|
	LDA #$A71D				;$00E319	|
	BRA label_00E33A		;$00E31C	|

label_00E31E:
	LDA #$A72A				;$00E31E	|
	BRA label_00E33A		;$00E321	|

label_00E323:
	TYX						;$00E323	|
	STZ $6B6E,X				;$00E324	|
	STZ $6BE8,X				;$00E327	|
	STZ $6C62,X				;$00E32A	|
	STZ $6CDC,X				;$00E32D	|
	LDA #$A737				;$00E330	|
	BRA label_00E33A		;$00E333	|
label_00E333:				;			|
	LDA #$A744				;$00E335	|
	BRA label_00E33A		;$00E338	|
label_00E33A:				;			|
	STA $66AA,Y				;$00E33A	|
	RTL						;$00E33D	|

label_00E33E:
	STA $00					;$00E33E	|
	PLA						;$00E340	|
	INC A					;$00E341	|
	STA $14					;$00E342	|
	SEP #$20				;$00E344	|
	PLA						;$00E346	|
	STA $16					;$00E347	|
	REP #$20				;$00E349	|
	LDX $39					;$00E34B	|
	LDY #$0000				;$00E34D	|
	LDA [$14],Y				;$00E350	|
	STA $7846,X				;$00E352	|
	INY						;$00E355	|
	INY						;$00E356	|
	LDA [$14],Y				;$00E357	|
	STA $786E,X				;$00E359	|
	INY						;$00E35C	|
	INY						;$00E35D	|
	LDA [$14],Y				;$00E35E	|
	STA $7896,X				;$00E360	|
	INY						;$00E363	|
	INY						;$00E364	|
	LDA [$14],Y				;$00E365	|
	STA $78BE,X				;$00E367	|
	INY						;$00E36A	|
	INY						;$00E36B	|
	TYA						;$00E36C	|
	CLC						;$00E36D	|
	ADC $14					;$00E36E	|
	STA $14					;$00E370	|
	STA $6028				;$00E372	|
	LDA $16					;$00E375	|
	STA $602A				;$00E377	|
	LDY $39					;$00E37A	|
	LDA $00					;$00E37C	|
	BEQ label_00E394		;$00E37E	|
	LDA $7846,Y				;$00E380	|
	EOR #$FFFF				;$00E383	|
	INC A					;$00E386	|
	STA $7846,Y				;$00E387	|
	LDA $7896,Y				;$00E38A	|
	EOR #$FFFF				;$00E38D	|
	INC A					;$00E390	|
	STA $7896,Y				;$00E391	|
label_00E394:				;			|
	JMP [$6028]				;$00E394	|

label_00E397:
	PLA						;$00E397	|
	INC A					;$00E398	|
	STA $14					;$00E399	|
	SEP #$20				;$00E39B	|
	PLA						;$00E39D	|
	STA $16					;$00E39E	|
	REP #$20				;$00E3A0	|
	LDX $39					;$00E3A2	|
	LDY #$0000				;$00E3A4	|
	BRA label_00E3C7		;$00E3A7	|
	PLA						;$00E3A9	|
	INC A					;$00E3AA	|
	STA $14					;$00E3AB	|
	SEP #$20				;$00E3AD	|
	PLA						;$00E3AF	|
	STA $16					;$00E3B0	|
	REP #$20				;$00E3B2	|
	LDX $39					;$00E3B4	|
	LDY #$0000				;$00E3B6	|
	LDA [$14],Y				;$00E3B9	|
	STA $6DD0,X				;$00E3BB	|
	INY						;$00E3BE	|
	INY						;$00E3BF	|
	LDA [$14],Y				;$00E3C0	|
	STA $781E,X				;$00E3C2	|
	INY						;$00E3C5	|
	INY						;$00E3C6	|
label_00E3C7:				;			|
	LDA [$14],Y				;$00E3C7	|
	STA $7846,X				;$00E3C9	|
	INY						;$00E3CC	|
	INY						;$00E3CD	|
	LDA [$14],Y				;$00E3CE	|
	STA $786E,X				;$00E3D0	|
	INY						;$00E3D3	|
	INY						;$00E3D4	|
	LDA [$14],Y				;$00E3D5	|
	STA $7896,X				;$00E3D7	|
	INY						;$00E3DA	|
	INY						;$00E3DB	|
	LDA [$14],Y				;$00E3DC	|
	STA $78BE,X				;$00E3DE	|
	INY						;$00E3E1	|
	INY						;$00E3E2	|
	TYA						;$00E3E3	|
	CLC						;$00E3E4	|
	ADC $14					;$00E3E5	|
	STA $14					;$00E3E7	|
	STA $6028				;$00E3E9	|
	LDA $16					;$00E3EC	|
	STA $602A				;$00E3EE	|
	TXY						;$00E3F1	|
	JMP [$6028]				;$00E3F2	|

label_00E3F5:
	LDA $7846,Y				;$00E3F5	|
	CLC						;$00E3F8	|
	ADC $7896,Y				;$00E3F9	|
	STA $7846,Y				;$00E3FC	|
	LDA $786E,Y				;$00E3FF	|
	CLC						;$00E402	|
	ADC $78BE,Y				;$00E403	|
	STA $786E,Y				;$00E406	|
	LDA $7846,Y				;$00E409	|
	LDX $786E,Y				;$00E40C	|
	JSL $059CC6				;$00E40F	|
	TYX						;$00E413	|
	LDY $39					;$00E414	|
	STA $6BE8,Y				;$00E416	|
	TXA						;$00E419	|
	STA $6B6E,Y				;$00E41A	|
	RTL						;$00E41D	|

label_00E41E:
	LDA $7846,Y				;$00E41E	|
	CLC						;$00E421	|
	ADC $7896,Y				;$00E422	|
	STA $7846,Y				;$00E425	|
	LDA $786E,Y				;$00E428	|
	CLC						;$00E42B	|
	ADC $78BE,Y				;$00E42C	|
	STA $786E,Y				;$00E42F	|
	LDA $7846,Y				;$00E432	|
	LDX $786E,Y				;$00E435	|
	JSL $059CC6				;$00E438	|
	STY $00					;$00E43C	|
	STA $02					;$00E43E	|
	LDY $39					;$00E440	|
	LDA $6DD0,Y				;$00E442	|
	CLC						;$00E445	|
	ADC $00					;$00E446	|
	STA $6B6E,Y				;$00E448	|
	LDA $781E,Y				;$00E44B	|
	CLC						;$00E44E	|
	ADC $02					;$00E44F	|
	STA $6BE8,Y				;$00E451	|
	RTL						;$00E454	|
	CLC						;$00E455	|
	ADC $6DD0,Y				;$00E456	|
	STA $6DD0,Y				;$00E459	|
	TXA						;$00E45C	|
	CLC						;$00E45D	|
	ADC $781E,Y				;$00E45E	|
	STA $781E,Y				;$00E461	|
	RTL						;$00E464	|

label_00E465:
	TYX						;$00E465	|
	STZ $6B6E,X				;$00E466	|
	STZ $6BE8,X				;$00E469	|
	STZ $6C62,X				;$00E46C	|
	STZ $6CDC,X				;$00E46F	|
	RTL						;$00E472	|

label_00E473:
	JSL label_00E465		;$00E473	|
	JMP label_00E17F		;$00E477	|

label_00E47A:
	TYX						;$00E47A	|
	STZ $6B6E,X				;$00E47B	|
	STZ $6BE8,X				;$00E47E	|
	RTL						;$00E481	|

label_00E482:
	TYX						;$00E482	|
	STZ $6C62,X				;$00E483	|
	STZ $6CDC,X				;$00E486	|
	RTL						;$00E489	|

label_00E48A:
	STA $6B6E,Y				;$00E48A	|
	TXA						;$00E48D	|
	STA $6BE8,Y				;$00E48E	|
	RTL						;$00E491	|

label_00E492:
	STA $6C62,Y				;$00E492	|
	TXA						;$00E495	|
	STA $6CDC,Y				;$00E496	|
	RTL						;$00E499	|

label_00E49A:
	STA $6B6E,Y				;$00E49A	|
	TXA						;$00E49D	|
	STA $6C62,Y				;$00E49E	|
	RTL						;$00E4A1	|

label_00E4A2:
	STA $6BE8,Y				;$00E4A2	|
	TXA						;$00E4A5	|
	STA $6CDC,Y				;$00E4A6	|
	RTL						;$00E4A9	|

label_00E4AA:
	STA $6B6E,Y				;$00E4AA	|
	TXA						;$00E4AD	|
	JMP label_00E17F		;$00E4AE	|

label_00E4B1:
	STA $6BE8,Y				;$00E4B1	|
	TXA						;$00E4B4	|
	JMP label_00E17F		;$00E4B5	|

label_00E4B8:
	STA $6C62,Y				;$00E4B8	|
	TXA						;$00E4BB	|
	JMP label_00E17F		;$00E4BC	|

label_00E4BF:
	STA $6CDC,Y				;$00E4BF	|
	TXA						;$00E4C2	|
	JMP label_00E17F		;$00E4C3	|

label_00E4C6:
	PHY						;$00E4C6	|
	LDY $39					;$00E4C7	|
	JSL label_00E48A		;$00E4C9	|
	PLA						;$00E4CD	|
	JMP label_00E17F		;$00E4CE	|

label_00E4D1:
	PHY						;$00E4D1	|
	LDY $39					;$00E4D2	|
	JSL label_00E492		;$00E4D4	|
	PLA						;$00E4D8	|
	JMP label_00E17F		;$00E4D9	|

label_00E4DC:
	PHY						;$00E4DC	|
	LDY $39					;$00E4DD	|
	JSL label_00E49A		;$00E4DF	|
	PLA						;$00E4E3	|
	JMP label_00E17F		;$00E4E4	|

label_00E4E7:
	PHY						;$00E4E7	|
	LDY $39					;$00E4E8	|
	JSL label_00E4A2		;$00E4EA	|
	PLA						;$00E4EE	|
	JMP label_00E17F		;$00E4EF	|

label_00E4F2:
	LDX $6DD0,Y				;$00E4F2	|
	BRA label_00E4FA		;$00E4F5	|
label_00E4F7:				;			|
	LDX $778C				;$00E4F7	|
label_00E4FA:				;			|
	CPX #$4000				;$00E4FA	|
	BEQ label_00E503		;$00E4FD	|
	EOR #$FFFF				;$00E4FF	|
	INC A					;$00E502	|
label_00E503:				;			|
	STA $6B6E,Y				;$00E503	|
	RTL						;$00E506	|

label_00E507:
	LDX $6DD0,Y				;$00E507	|
	CPX #$8000				;$00E50A	|
	BEQ label_00E513		;$00E50D	|
	EOR #$FFFF				;$00E50F	|
	INC A					;$00E512	|
label_00E513:				;			|
	STA $6BE8,Y				;$00E513	|
	RTL						;$00E516	|

label_00E517:
	PHY						;$00E517	|
	LDY $39					;$00E518	|
	JSL label_00E52B		;$00E51A	|
	PLA						;$00E51E	|
	JML label_00E215		;$00E51F	|

label_00E523:
	PHX						;$00E523	|
	TYX						;$00E524	|
	LDY $6DD0,X				;$00E525	|
	PLX						;$00E528	|
	BRA label_00E52E		;$00E529	|

label_00E52B:
	LDY $778C				;$00E52B	|
label_00E52E:				;			|
	CPY #$4000				;$00E52E	|
	BEQ label_00E537		;$00E531	|
	EOR #$FFFF				;$00E533	|
	INC A					;$00E536	|
label_00E537:				;			|
	LDY $39					;$00E537	|
	STA $6B6E,Y				;$00E539	|
	TXA						;$00E53C	|
	STA $6BE8,Y				;$00E53D	|
	RTL						;$00E540	|
	PHX						;$00E541	|
	TYX						;$00E542	|
	LDY $6DD0,X				;$00E543	|
	PLX						;$00E546	|
	BRA label_00E54C		;$00E547	|

label_00E549:
	LDY $778C				;$00E549	|
label_00E54C:				;			|
	CPY #$4000				;$00E54C	|
	BEQ label_00E555		;$00E54F	|
	EOR #$FFFF				;$00E551	|
	INC A					;$00E554	|
label_00E555:				;			|
	LDY $39					;$00E555	|
	STA $6B6E,Y				;$00E557	|
	TXA						;$00E55A	|
	JMP label_00E17F		;$00E55B	|

label_00E55E:
	STA $6BE8,Y				;$00E55E	|
	TXA						;$00E561	|
	JMP label_00E17F		;$00E562	|

label_00E565:
	PHA						;$00E565	|
	PHX						;$00E566	|
	LDX $39					;$00E567	|
	TYA						;$00E569	|
	ORA $6DD0,X				;$00E56A	|
	TAY						;$00E56D	|
	PLX						;$00E56E	|
	PLA						;$00E56F	|
	BRA label_00E579		;$00E570	|

label_00E572:
	PHA						;$00E572	|
	TYA						;$00E573	|
	ORA $778C				;$00E574	|
	TAY						;$00E577	|
	PLA						;$00E578	|
label_00E579:				;			|
	CPY #$C000				;$00E579	|
	BCC label_00E582		;$00E57C	|
	EOR #$FFFF				;$00E57E	|
	INC A					;$00E581	|
label_00E582:				;			|
	PHY						;$00E582	|
	LDY $39					;$00E583	|
	STA $6B6E,Y				;$00E585	|
	TXA						;$00E588	|
	STA $6BE8,Y				;$00E589	|
	PLA						;$00E58C	|
	AND #$00FF				;$00E58D	|
	JMP label_00E17F		;$00E590	|

label_00E593:
	LDX $6DD0,Y				;$00E593	|
	BRA label_00E59B		;$00E596	|

label_00E598:
	LDX $778C				;$00E598	|
label_00E59B:				;			|
	CPX #$4000				;$00E59B	|
	BEQ label_00E5A4		;$00E59E	|
	EOR #$FFFF				;$00E5A0	|
	INC A					;$00E5A3	|
label_00E5A4:				;			|
	STA $6C62,Y				;$00E5A4	|
	RTL						;$00E5A7	|

label_00E5A8:
	LDX $6DD0,Y				;$00E5A8	|
	CPX #$8000				;$00E5AB	|
	BEQ label_00E5B4		;$00E5AE	|
	EOR #$FFFF				;$00E5B0	|
	INC A					;$00E5B3	|
label_00E5B4:				;			|
	STA $6CDC,Y				;$00E5B4	|
	RTL						;$00E5B7	|

label_00E5B8:
	PHX						;$00E5B8	|
	TYX						;$00E5B9	|
	LDY $6DD0,X				;$00E5BA	|
	PLX						;$00E5BD	|
	BRA label_00E5C3		;$00E5BE	|

label_00E5C0:
	LDY $778C				;$00E5C0	|
label_00E5C3:				;			|
	CPY #$4000				;$00E5C3	|
	BEQ label_00E5CC		;$00E5C6	|
	EOR #$FFFF				;$00E5C8	|
	INC A					;$00E5CB	|
label_00E5CC:				;			|
	LDY $39					;$00E5CC	|
	STA $6C62,Y				;$00E5CE	|
	TXA						;$00E5D1	|
	STA $6CDC,Y				;$00E5D2	|
	RTL						;$00E5D5	|

label_00E5D6:
	PHX						;$00E5D6	|
	TYX						;$00E5D7	|
	LDY $6DD0,X				;$00E5D8	|
	PLX						;$00E5DB	|
	BRA label_00E5E1		;$00E5DC	|

label_00E5DE:
	LDY $778C				;$00E5DE	|
label_00E5E1:				;			|
	CPY #$4000				;$00E5E1	|
	BEQ label_00E5EA		;$00E5E4	|
	EOR #$FFFF				;$00E5E6	|
	INC A					;$00E5E9	|
label_00E5EA:				;			|
	LDY $39					;$00E5EA	|
	STA $6C62,Y				;$00E5EC	|
	TXA						;$00E5EF	|
	JMP label_00E17F		;$00E5F0	|

label_00E5F3:
	STA $6CDC,Y				;$00E5F3	|
	TXA						;$00E5F6	|
	JMP label_00E17F		;$00E5F7	|

label_00E5FA:
	PHA						;$00E5FA	|
	PHX						;$00E5FB	|
	LDX $39					;$00E5FC	|
	TYA						;$00E5FE	|
	ORA $6DD0,X				;$00E5FF	|
	TAY						;$00E602	|
	PLX						;$00E603	|
	PLA						;$00E604	|
	BRA label_00E60E		;$00E605	|

label_00E607:
	PHA						;$00E607	|
	TYA						;$00E608	|
	ORA $778C				;$00E609	|
	TAY						;$00E60C	|
	PLA						;$00E60D	|
label_00E60E:				;			|
	CPY #$C000				;$00E60E	|
	BCC label_00E617		;$00E611	|
	EOR #$FFFF				;$00E613	|
	INC A					;$00E616	|
label_00E617:				;			|
	PHY						;$00E617	|
	LDY $39					;$00E618	|
	STA $6C62,Y				;$00E61A	|
	TXA						;$00E61D	|
	STA $6CDC,Y				;$00E61E	|
	PLA						;$00E621	|
	AND #$00FF				;$00E622	|
	JMP label_00E17F		;$00E625	|

label_00E628:
	PHY						;$00E628	|
	LDY $39					;$00E629	|
	JSL label_00E640		;$00E62B	|
	PLA						;$00E62F	|
	JML label_00E17F		;$00E630	|

label_00E634:
	PHY						;$00E634	|
	LDY $39					;$00E635	|
	JSL label_00E648		;$00E637	|
	PLA						;$00E63B	|
	JML label_00E17F		;$00E63C	|

label_00E640:
	STA $6B6E,Y				;$00E640	|
	TXA						;$00E643	|
	STA $6C62,Y				;$00E644	|
	RTL						;$00E647	|

label_00E648:
	STA $6BE8,Y				;$00E648	|
	TXA						;$00E64B	|
	STA $6CDC,Y				;$00E64C	|
	RTL						;$00E64F	|

label_00E650:
	PHA						;$00E650	|
	LDA $6DD0,Y				;$00E651	|
	TAY						;$00E654	|
	PLA						;$00E655	|
	BRA label_00E65B		;$00E656	|

label_00E658:
	LDY $778C				;$00E658	|
label_00E65B:				;			|
	CPY #$4000				;$00E65B	|
	BEQ label_00E672		;$00E65E	|
	LDY $39					;$00E660	|
	EOR #$FFFF				;$00E662	|
	INC A					;$00E665	|
	STA $6B6E,Y				;$00E666	|
	TXA						;$00E669	|
	EOR #$FFFF				;$00E66A	|
	INC A					;$00E66D	|
	STA $6C62,Y				;$00E66E	|
	RTL						;$00E671	|

label_00E672:
	LDY $39					;$00E672	|
	STA $6B6E,Y				;$00E674	|
	TXA						;$00E677	|
	STA $6C62,Y				;$00E678	|
	RTL						;$00E67B	|

label_00E67C:
	LDA $6B6E,Y				;$00E67C	|
	EOR #$FFFF				;$00E67F	|
	INC A					;$00E682	|
	STA $6B6E,Y				;$00E683	|
	RTL						;$00E686	|

label_00E687:
	LDA $6BE8,Y				;$00E687	|
	EOR #$FFFF				;$00E68A	|
	INC A					;$00E68D	|
	STA $6BE8,Y				;$00E68E	|
	RTL						;$00E691	|

label_00E692:
	CLC						;$00E692	|
	ADC $3037				;$00E693	|
	STA $3037				;$00E696	|
	RTL						;$00E699	|

label_00E69A:
	CLC						;$00E69A	|
	ADC $303D				;$00E69B	|
	STA $303D				;$00E69E	|
	RTL						;$00E6A1	|

label_00E6A2:
	CLC						;$00E6A2	|
	ADC $3039				;$00E6A3	|
	STA $3039				;$00E6A6	|
	RTL						;$00E6A9	|

label_00E6AA:
	CLC						;$00E6AA	|
	ADC $303F				;$00E6AB	|
	STA $303F				;$00E6AE	|
	RTL						;$00E6B1	|

label_00E6B2:
	LDX $39					;$00E6B2	|
	LDA #$A6EC				;$00E6B4	|
	STA $66AA,X				;$00E6B7	|
	JSL label_00925B		;$00E6BA	|
	JML label_009142		;$00E6BE	|

label_00E6C2:
	STA $308B				;$00E6C2	|
	STX $308D				;$00E6C5	|
	RTL						;$00E6C8	|

label_00E6C9:
	STA $307D				;$00E6C9	|
label_00E6CC:				;			|
	LDA $307D				;$00E6CC	|
	LDX $307F				;$00E6CF	|
	LDY $3081				;$00E6D2	|
	JSL label_00A668		;$00E6D5	|
	LDY $39					;$00E6D9	|
	RTL						;$00E6DB	|

label_00E6DC:
	STA $00					;$00E6DC	|
	LDA $307D				;$00E6DE	|
	SEC						;$00E6E1	|
	SBC $00					;$00E6E2	|
	STA $307D				;$00E6E4	|
	JMP label_00E6CC		;$00E6E7	|

label_00E6EA:
	STA $307F				;$00E6EA	|
	STA $3081				;$00E6ED	|
	JMP label_00E6CC		;$00E6F0	|

label_00E6F3:
	CLC						;$00E6F3	|
	ADC $307F				;$00E6F4	|
	STA $307F				;$00E6F7	|
	TXA						;$00E6FA	|
	CLC						;$00E6FB	|
	ADC $3081				;$00E6FC	|
	STA $3081				;$00E6FF	|
	JMP label_00E6CC		;$00E702	|
	STA $6FB8,Y				;$00E705	|
	TXA						;$00E708	|
	XBA						;$00E709	|
	STA $6F3E,Y				;$00E70A	|
	RTL						;$00E70D	|

label_00E70E:
	LDA $6F3E,Y				;$00E70E	|
	CMP #$FFFF				;$00E711	|
	BEQ label_00E736		;$00E714	|
	AND #$00FF				;$00E716	|
	DEC A					;$00E719	|
	PHP						;$00E71A	|
	SEP #$20				;$00E71B	|
	STA $6F3E,Y				;$00E71D	|
	REP #$20				;$00E720	|
	PLP						;$00E722	|
	BPL label_00E736		;$00E723	|
	LDA $6F3E,Y				;$00E725	|
	XBA						;$00E728	|
	STA $602A				;$00E729	|
	LDA $6FB8,Y				;$00E72C	|
	STA $6028				;$00E72F	|
	JSL label_009258		;$00E732	|
label_00E736:				;			|
	RTL						;$00E736	|

label_00E737:
	DEC A					;$00E737	|
	LDY $39					;$00E738	|
	SEP #$20				;$00E73A	|
	STA $6F3E,Y				;$00E73C	|
	REP #$20				;$00E73F	|
	PLA						;$00E741	|
	INC A					;$00E742	|
	STA $6FB8,Y				;$00E743	|
	SEP #$20				;$00E746	|
	PLA						;$00E748	|
	STA $6F3F,Y				;$00E749	|
	REP #$20				;$00E74C	|
	RTL						;$00E74E	|

label_00E74F:
	STA $71A0,Y				;$00E74F	|
	TXA						;$00E752	|
	XBA						;$00E753	|
	STA $70AC,Y				;$00E754	|
	RTL						;$00E757	|

label_00E758:
	LDA $70AC,Y				;$00E758	|
	CMP #$FFFF				;$00E75B	|
	BEQ label_00E780		;$00E75E	|
	AND #$00FF				;$00E760	|
	DEC A					;$00E763	|
	PHP						;$00E764	|
	SEP #$20				;$00E765	|
	STA $70AC,Y				;$00E767	|
	REP #$20				;$00E76A	|
	PLP						;$00E76C	|
	BPL label_00E780		;$00E76D	|
	LDA $70AC,Y				;$00E76F	|
	XBA						;$00E772	|
	STA $602A				;$00E773	|
	LDA $71A0,Y				;$00E776	|
	STA $6028				;$00E779	|
	JSL label_009258		;$00E77C	|
label_00E780:				;			|
	RTL						;$00E780	|

label_00E781:
	DEC A					;$00E781	|
	LDY $39					;$00E782	|
	SEP #$20				;$00E784	|
	STA $70AC,Y				;$00E786	|
	REP #$20				;$00E789	|
	PLA						;$00E78B	|
	INC A					;$00E78C	|
	STA $71A0,Y				;$00E78D	|
	SEP #$20				;$00E790	|
	PLA						;$00E792	|
	STA $70AD,Y				;$00E793	|
	REP #$20				;$00E796	|
	RTL						;$00E798	|

label_00E799:
	JSL label_00D12D		;$00E799	|
	LDY $39					;$00E79D	|
	RTL						;$00E79F	|

label_00E7A0:
	STA $00					;$00E7A0	|
	LDY $778C				;$00E7A2	|
	BEQ label_00E7BC		;$00E7A5	|
	SEP #$20				;$00E7A7	|
	LDA $01					;$00E7A9	|
	EOR #$FF				;$00E7AB	|
	INC A					;$00E7AD	|
	STA $01					;$00E7AE	|
	REP #$20				;$00E7B0	|
	LDA $6006				;$00E7B2	|
	EOR #$FFFF				;$00E7B5	|
	INC A					;$00E7B8	|
	STA $6006				;$00E7B9	|
label_00E7BC:				;			|
	LDA $00					;$00E7BC	|
	JSL label_009AEB		;$00E7BE	|
	LDY $39					;$00E7C2	|
	RTL						;$00E7C4	|

label_00E7C5:
	JSL label_009AEB		;$00E7C5	|
	LDY $39					;$00E7C9	|
	RTL						;$00E7CB	|

label_00E7CC:
	LDX $6DD0,Y				;$00E7CC	|
	BPL label_00E7D5		;$00E7CF	|
	EOR #$FFFF				;$00E7D1	|
	INC A					;$00E7D4	|
label_00E7D5:				;			|
	STA $6B6E,Y				;$00E7D5	|
	RTL						;$00E7D8	|

label_00E7D9:
	LDX $6DD0,Y				;$00E7D9	|
	BPL label_00E7E2		;$00E7DC	|
	EOR #$FFFF				;$00E7DE	|
	INC A					;$00E7E1	|
label_00E7E2:				;			|
	STA $6C62,Y				;$00E7E2	|
	RTL						;$00E7E5	|

label_00E7E6:
	PHA						;$00E7E6	|
	LDA $6892,Y				;$00E7E7	|
	SEC						;$00E7EA	|
	SBC $735E				;$00E7EB	|
	CMP #$FFC0				;$00E7EE	|
	BCS label_00E7F8		;$00E7F1	|
	CMP #$0140				;$00E7F3	|
	BCS label_00E80C		;$00E7F6	|
label_00E7F8:				;			|
	LDA $690C,Y				;$00E7F8	|
	SEC						;$00E7FB	|
	SBC $7360				;$00E7FC	|
	CMP #$FFC0				;$00E7FF	|
	BCS label_00E809		;$00E802	|
	CMP #$0120				;$00E804	|
	BCS label_00E80C		;$00E807	|
label_00E809:				;			|
	PLA						;$00E809	|
	CLC						;$00E80A	|
	RTL						;$00E80B	|

label_00E80C:
	PLA						;$00E80C	|
	SEC						;$00E80D	|
	RTL						;$00E80E	|

label_00E80F:
	STA $679E,Y				;$00E80F	|
	TXA						;$00E812	|
	SEP #$20				;$00E813	|
	STA $6818,Y				;$00E815	|
	REP #$20				;$00E818	|
	TYX						;$00E81A	|
	STZ $6724,X				;$00E81B	|
	RTL						;$00E81E	|

label_00E81F:
	STA $00					;$00E81F	|
	JSR label_00E849		;$00E821	|
	CLC						;$00E824	|
	ADC $00					;$00E825	|
	STA $6986,Y				;$00E827	|
	STA $6892,Y				;$00E82A	|
	LDA #$8000				;$00E82D	|
	STA $6A7A,Y				;$00E830	|
	RTL						;$00E833	|
	STA $00					;$00E834	|
	JSR label_00E849		;$00E836	|
	CLC						;$00E839	|
	ADC $00					;$00E83A	|
	STA $6A00,Y				;$00E83C	|
	STA $690C,Y				;$00E83F	|
	LDA #$8000				;$00E842	|
	STA $6AF4,Y				;$00E845	|
	RTL						;$00E848	|

label_00E849:
	STX $02					;$00E849	|
	STY $04					;$00E84B	|
	TXA						;$00E84D	|
	JSL CallRNG_ModA		;$00E84E	|
	LDX $04					;$00E852	|
	JSL label_00A593		;$00E854	|
	LDX $32E4				;$00E858	|
	LDA $02					;$00E85B	|
	JSL label_00A593		;$00E85D	|
	LDA $32E4				;$00E861	|
	LDY $39					;$00E864	|
	RTS						;$00E866	|

label_00E867:
	JSL label_00D003		;$00E867	|
	LDY $39					;$00E86B	|
	RTL						;$00E86D	|

label_00E86E:
	JSL label_00D12D		;$00E86E	|
	LDY $39					;$00E872	|
	RTL						;$00E874	|

label_00E875:
	JSR label_00E879		;$00E875	|
	RTL						;$00E878	|
label_00E879:				;			|
	JSR label_00A7B8		;$00E879	|
	JSR label_00A87F		;$00E87C	|
	JSR label_00E887		;$00E87F	|
	RTS						;$00E882	|

label_00E883:
	JSR label_00E887		;$00E883	|
	RTL						;$00E886	|
label_00E887:				;			|
	LDY $39					;$00E887	|
	LDX $6E4A,Y				;$00E889	|
	LDA $6892,Y				;$00E88C	|
	CLC						;$00E88F	|
	ADC $76A7,X				;$00E890	|
	STA $6892,Y				;$00E893	|
	LDA $690C,Y				;$00E896	|
	CLC						;$00E899	|
	ADC $76AF,X				;$00E89A	|
	STA $690C,Y				;$00E89D	|
	RTS						;$00E8A0	|

label_00E8A1:
	JSR label_00E8A5		;$00E8A1	|
	RTL						;$00E8A4	|
label_00E8A5:				;			|
	LDY $39					;$00E8A5	|
	LDX $6E4A,Y				;$00E8A7	|
	LDA $37A6,X				;$00E8AA	|
	STA $6892,Y				;$00E8AD	|
	STA $6986,Y				;$00E8B0	|
	LDA $37AA,X				;$00E8B3	|
	STA $690C,Y				;$00E8B6	|
	STA $6A00,Y				;$00E8B9	|
	RTS						;$00E8BC	|

label_00E8BD:
	JSR label_00E8C1		;$00E8BD	|
	RTL						;$00E8C0	|
label_00E8C1:				;			|
	LDY $39					;$00E8C1	|
	LDX $6E4A,Y				;$00E8C3	|
	LDA $6892,X				;$00E8C6	|
	CLC						;$00E8C9	|
	ADC $76A7,X				;$00E8CA	|
	CLC						;$00E8CD	|
	ADC $6B6E,Y				;$00E8CE	|
	STA $6986,Y				;$00E8D1	|
	STA $6892,Y				;$00E8D4	|
	LDA $690C,X				;$00E8D7	|
	CLC						;$00E8DA	|
	ADC $76AF,X				;$00E8DB	|
	CLC						;$00E8DE	|
	ADC $6BE8,Y				;$00E8DF	|
	STA $6A00,Y				;$00E8E2	|
	STA $690C,Y				;$00E8E5	|
	LDA #$8000				;$00E8E8	|
	STA $6A7A,Y				;$00E8EB	|
	STA $6AF4,Y				;$00E8EE	|
	RTS						;$00E8F1	|

label_00E8F2:
	JSR label_00E8F6		;$00E8F2	|
	RTL						;$00E8F5	|
label_00E8F6:				;			|
	LDY $39					;$00E8F6	|
	LDX $6E4A,Y				;$00E8F8	|
	LDA $6B6E,Y				;$00E8FB	|
	CLC						;$00E8FE	|
	ADC $6892,X				;$00E8FF	|
	STA $6892,Y				;$00E902	|
	STA $6986,Y				;$00E905	|
	LDA $6BE8,Y				;$00E908	|
	CLC						;$00E90B	|
	ADC $690C,X				;$00E90C	|
	STA $690C,Y				;$00E90F	|
	STA $6A00,Y				;$00E912	|
	RTS						;$00E915	|

label_00E916:
	JSR label_00E91A		;$00E916	|
	RTL						;$00E919	|
label_00E91A:				;			|
	JSR label_00E8F6		;$00E91A	|
	JSR label_00E997		;$00E91D	|
	CPY #$0002				;$00E920	|
	BNE label_00E951		;$00E923	|
	JSR label_00E952		;$00E925	|
	BCC label_00E951		;$00E928	|
	LDX $6E4A,Y				;$00E92A	|
	LDA $6DD0,X				;$00E92D	|
	BMI label_00E937		;$00E930	|
	LDA #$FFF6				;$00E932	|
	BRA label_00E93A		;$00E935	|

label_00E937:
	LDA #$000A				;$00E937	|
label_00E93A:				;			|
	CLC						;$00E93A	|
	ADC $6892,Y				;$00E93B	|
	STA $6892,X				;$00E93E	|
	STA $6986,X				;$00E941	|
	LDA $690C,Y				;$00E944	|
	CLC						;$00E947	|
	ADC #$FFF6				;$00E948	|
	STA $690C,X				;$00E94B	|
	STA $6A00,X				;$00E94E	|
label_00E951:				;			|
	RTS						;$00E951	|

label_00E952:
	LDY $39					;$00E952	|
	LDA $735E				;$00E954	|
	CLC						;$00E957	|
	ADC #$0010				;$00E958	|
	CMP $6892,Y				;$00E95B	|
	BCS label_00E969		;$00E95E	|
	CLC						;$00E960	|
	ADC #$00E0				;$00E961	|
	CMP $6892,Y				;$00E964	|
	BCS label_00E971		;$00E967	|
label_00E969:				;			|
	STA $6892,Y				;$00E969	|
	STA $6986,Y				;$00E96C	|
	SEC						;$00E96F	|
	RTS						;$00E970	|

label_00E971:
	CLC						;$00E971	|
	RTS						;$00E972	|

label_00E973:
	JSR label_00E977		;$00E973	|
	RTL						;$00E976	|
label_00E977:				;			|
	JSR label_00E8F6		;$00E977	|
	JSR label_00E997		;$00E97A	|
	RTS						;$00E97D	|

label_00E97E:
	JSR label_00E982		;$00E97E	|
	RTL						;$00E981	|
label_00E982:				;			|
	JSR label_00A6FB		;$00E982	|
	JSR label_00E997		;$00E985	|
	JSR label_00E952		;$00E988	|
	RTS						;$00E98B	|
	JSR label_00E990		;$00E98C	|
	RTL						;$00E98F	|

label_00E990:
	JSR label_00A6FB		;$00E990	|
	JSR label_00E997		;$00E993	|
	RTS						;$00E996	|

label_00E997:
	LDY $39					;$00E997	|
	CPY #$0002				;$00E999	|
	BNE label_00E9B2		;$00E99C	|
	LDA $6892,Y				;$00E99E	|
	SEC						;$00E9A1	|
	SBC #$0080				;$00E9A2	|
	STA $3342				;$00E9A5	|
	LDA $690C,Y				;$00E9A8	|
	SEC						;$00E9AB	|
	SBC #$0054				;$00E9AC	|
	STA $3346				;$00E9AF	|
label_00E9B2:				;			|
	RTS						;$00E9B2	|

label_00E9B3:
	JSR label_00E9B7		;$00E9B3	|
	RTL						;$00E9B6	|
label_00E9B7:				;			|
	JSR label_00A81B		;$00E9B7	|
	JSR label_00A7B8		;$00E9BA	|
	JMP label_00E9C4		;$00E9BD	|

label_00E9C0:
	JSR label_00E9C4		;$00E9C0	|
	RTL						;$00E9C3	|
label_00E9C4:				;			|
	LDY $39					;$00E9C4	|
	LDX $7846,Y				;$00E9C6	|
	LDA $6986,Y				;$00E9C9	|
	CLC						;$00E9CC	|
	ADC $6892,X				;$00E9CD	|
	STA $6892,Y				;$00E9D0	|
	LDA $6A00,Y				;$00E9D3	|
	CLC						;$00E9D6	|
	ADC $690C,X				;$00E9D7	|
	STA $690C,Y				;$00E9DA	|
	RTS						;$00E9DD	|

label_00E9DE:
	JSR label_00E9E2		;$00E9DE	|
	RTL						;$00E9E1	|
label_00E9E2:				;			|
	LDA $6B6E,Y				;$00E9E2	|
	LDX $6DD0,Y				;$00E9E5	|
	BPL label_00E9EE		;$00E9E8	|
	EOR #$FFFF				;$00E9EA	|
	INC A					;$00E9ED	|
label_00E9EE:				;			|
	LDX $6E4A,Y				;$00E9EE	|
	CLC						;$00E9F1	|
	ADC $6892,X				;$00E9F2	|
	STA $6892,Y				;$00E9F5	|
	STA $6986,Y				;$00E9F8	|
	LDA $6BE8,Y				;$00E9FB	|
	CLC						;$00E9FE	|
	ADC $690C,X				;$00E9FF	|
	STA $690C,Y				;$00EA02	|
	STA $6A00,Y				;$00EA05	|
	RTS						;$00EA08	|

label_00EA09:
	STA $28					;$00EA09	|
	STX $14					;$00EA0B	|
	STY $16					;$00EA0D	|
	LDA #$EA1A				;$00EA0F	|\ 
	LDX #$0000				;$00EA12	|| Execute the below on the SNES>
	JSL SA1_ExecuteSNES		;$00EA15	|/
	RTL						;$00EA19	|
label_00EA1A:				;			|
	LDA $28					;$00EA1A	|
	BRA label_00EA22		;$00EA1C	|
label_00EA1E:				;			|
	STZ $16					;$00EA1E	|
	STX $14					;$00EA20	|
label_00EA22:				;			|
	JSR label_00EA71		;$00EA22	|
	ORA [$14],Y				;$00EA25	|
	STA [$14],Y				;$00EA27	|
	RTL						;$00EA29	|

label_00EA2A:
	STA $28					;$00EA2A	|
	STX $14					;$00EA2C	|
	STY $16					;$00EA2E	|
	LDA #$EA3D				;$00EA30	|\ 
	LDX #$0000				;$00EA33	|| Execute the below on the SNES.
	JSL SA1_ExecuteSNES		;$00EA36	|/
	LDA $28					;$00EA3A	|
	RTL						;$00EA3C	|
label_00EA3D:				;			|
	LDA $28					;$00EA3D	|
	BRA label_00EA45		;$00EA3F	|
label_00EA41:				;			|
	STZ $16					;$00EA41	|
	STX $14					;$00EA43	|
label_00EA45:				;			|
	JSR label_00EA71		;$00EA45	|
	AND [$14],Y				;$00EA48	|
	STA $28					;$00EA4A	|
	RTL						;$00EA4C	|

label_00EA4D:
	STA $28					;$00EA4D	|
	STX $14					;$00EA4F	|
	STY $16					;$00EA51	|
	LDA #$EA5E				;$00EA53	|\ 
	LDX #$0000				;$00EA56	|| Execute the below on the SNES.
	JSL SA1_ExecuteSNES		;$00EA59	|/
	RTL						;$00EA5D	|
label_00EA5E:				;			|
	LDA $28					;$00EA5E	|
	BRA label_00EA66		;$00EA60	|
label_00EA62:				;			|
	STZ $16					;$00EA62	|
	STX $14					;$00EA64	|
label_00EA66:				;			|
	JSR label_00EA71		;$00EA66	|
	EOR #$FFFF				;$00EA69	|
	AND [$14],Y				;$00EA6C	|
	STA [$14],Y				;$00EA6E	|
	RTL						;$00EA70	|

label_00EA71:
	LDX #$0022				;$00EA71	|
label_00EA74:				;			|
	DEX						;$00EA74	|
	DEX						;$00EA75	|
	CMP.l DATA_00EA8E,X		;$00EA76	|
	BCC label_00EA74		;$00EA7A	|
	TXY						;$00EA7C	|
	AND #$0007				;$00EA7D	|
	TAX						;$00EA80	|
	TYA						;$00EA81	|
	LSR A					;$00EA82	|
	TAY						;$00EA83	|
	LDA #$0001				;$00EA84	|
label_00EA87:				;			|
	DEX						;$00EA87	|
	BMI label_00EA8D		;$00EA88	|
	ASL A					;$00EA8A	|
	BRA label_00EA87		;$00EA8B	|
label_00EA8D:				;			|
	RTS						;$00EA8D	|


DATA_00EA8E:
	dw $0000,$0008,$0010,$0018
	dw $0020,$0028,$0030,$0038
	dw $0040,$0048,$0050,$0058
	dw $0060,$0068,$0070,$0078
	dw $0080





label_00EAB0:
	TAX						;$00EAB0	|
	LDA $739A				;$00EAB1	|
	AND #$00FF				;$00EAB4	|
	BEQ label_00EABA		;$00EAB7	|
	RTL						;$00EAB9	|

label_00EABA:
	TXA						;$00EABA	|
	LDY $7AE3				;$00EABB	|\ 
	CMP #$000B				;$00EABE	|| Jump to the routine.
  -	BCS -					;$00EAC1	||] Hardlock the game if a vlue >= 0xB is used.
	ASL A					;$00EAC3	||
	TAX						;$00EAC4	||
	JMP (label_00EAC8,X)	;$00EAC5	|/

label_00EAC8:
	dw label_00EADE
	dw label_00EBD9
	dw label_00EAED
	dw label_00EAFC
	dw label_00EB0B
	dw label_00EB5C
	dw label_00EB99
	dw label_00EBA5
	dw label_00EBB4
	dw label_00EBE7
	dw label_00EBCD


label_00EADE:
	LDA $7AE5				;$00EADE	|
	STA $7F0A,Y				;$00EAE1	|
	LDA $7A93				;$00EAE4	|
	STA $7F0F,Y				;$00EAE7	|
	JMP label_00EC34		;$00EAEA	|


label_00EAED:
	LDA $7AEB				;$00EAED	|
	STA $7F11,Y				;$00EAF0	|
	LDA $7AED				;$00EAF3	|
	STA $7F13,Y				;$00EAF6	|
	JMP label_00EC34		;$00EAF9	|


label_00EAFC:
	LDA $7AEF				;$00EAFC	|
	STA $7F15,Y				;$00EAFF	|
	LDA $7AF1				;$00EB02	|
	STA $7F17,Y				;$00EB05	|
	JMP label_00EC34		;$00EB08	|


label_00EB0B:
	LDA $7B2D				;$00EB0B	|
	BEQ label_00EB35		;$00EB0E	|
	LDA $7B03				;$00EB10	|
	STA $7F29,Y				;$00EB13	|
	SEP #$20				;$00EB16	|
	LDA $7AFF				;$00EB18	|
	STA $7F25,Y				;$00EB1B	|
	LDA $7B00				;$00EB1E	|
	STA $7F26,Y				;$00EB21	|
	LDA $7B01				;$00EB24	|
	STA $7F27,Y				;$00EB27	|
	LDA $7B02				;$00EB2A	|
	STA $7F28,Y				;$00EB2D	|
	REP #$20				;$00EB30	|
	JMP label_00EC34		;$00EB32	|

label_00EB35:
	LDA $7AF3				;$00EB35	|
	STA $7F19,Y				;$00EB38	|
	LDA $7AF5				;$00EB3B	|
	STA $7F1B,Y				;$00EB3E	|
	LDA $7AF7				;$00EB41	|
	STA $7F1D,Y				;$00EB44	|
	LDA $7AF9				;$00EB47	|
	STA $7F1F,Y				;$00EB4A	|
	LDA $7AFB				;$00EB4D	|
	STA $7F21,Y				;$00EB50	|
	LDA $7AFD				;$00EB53	|
	STA $7F23,Y				;$00EB56	|
	JMP label_00EC34		;$00EB59	|


label_00EB5C:
	LDA $7B05				;$00EB5C	|
	STA $7F2B,Y				;$00EB5F	|
	LDA $7B07				;$00EB62	|
	STA $7F2D,Y				;$00EB65	|
	LDA $7B09				;$00EB68	|
	STA $7F2F,Y				;$00EB6B	|
	LDA $7B0B				;$00EB6E	|
	STA $7F31,Y				;$00EB71	|
	SEP #$20				;$00EB74	|
	LDA $7B13				;$00EB76	|
	STA $7F38,Y				;$00EB79	|
	LDA $32F2				;$00EB7C	|
	STA $7F33,Y				;$00EB7F	|
	LDA $7B14				;$00EB82	|
	STA $7F39,Y				;$00EB85	|
	REP #$20				;$00EB88	|
	LDA $7B0F				;$00EB8A	|
	STA $7F34,Y				;$00EB8D	|
	LDA $7B11				;$00EB90	|
	STA $7F36,Y				;$00EB93	|
	JMP label_00EC34		;$00EB96	|


label_00EB99:
	LDA $7B19				;$00EB99	|
	STA $7F3E,Y				;$00EB9C	|
	LDA $7B1B				;$00EB9F	|
	STA $7F40,Y				;$00EBA2	|
label_00EBA5:				;			|
	LDA $7B15				;$00EBA5	|
	STA $7F3A,Y				;$00EBA8	|
	LDA $7B17				;$00EBAB	|
	STA $7F3C,Y				;$00EBAE	|
	JMP label_00EC34		;$00EBB1	|


label_00EBB4:
	LDA $7B1D				;$00EBB4	|
	STA $7F42,Y				;$00EBB7	|
	SEP #$20				;$00EBBA	|
	LDA $7B1F				;$00EBBC	|
	STA $7F44,Y				;$00EBBF	|
	LDA $7B20				;$00EBC2	|
	STA $7F45,Y				;$00EBC5	|
	REP #$20				;$00EBC8	|
	JMP label_00EC34		;$00EBCA	|


label_00EBCD:
	SEP #$20				;$00EBCD	|
	LDA $7B21				;$00EBCF	|
	STA $7F46,Y				;$00EBD2	|
	REP #$20				;$00EBD5	|
	BRA label_00EC34		;$00EBD7	|


label_00EBD9:
	LDA $7AE7				;$00EBD9	|
	STA $7F0C,Y				;$00EBDC	|
	LDA $7AE8				;$00EBDF	|
	STA $7F0D,Y				;$00EBE2	|
	BRA label_00EC34		;$00EBE5	|


label_00EBE7:
	LDA $32EA				;$00EBE7	|
	CMP #$0005				;$00EBEA	|
	BEQ label_00EC26		;$00EBED	|
	CMP #$0004				;$00EBEF	|
	BEQ label_00EC1E		;$00EBF2	|
	SEP #$20				;$00EBF4	|
	LDA $7A63				;$00EBF6	|
	STA $7F47,Y				;$00EBF9	|
	LDA $7A64				;$00EBFC	|
	STA $7F48,Y				;$00EBFF	|
	LDA $7A65				;$00EC02	|
	STA $7F49,Y				;$00EC05	|
	LDA $7A66				;$00EC08	|
	STA $7F4A,Y				;$00EC0B	|
	LDA $7A67				;$00EC0E	|
	STA $7F4B,Y				;$00EC11	|
	LDA $7A68				;$00EC14	|
	STA $7F4C,Y				;$00EC17	|
	REP #$20				;$00EC1A	|
	BRA label_00EC34		;$00EC1C	|

label_00EC1E:
	LDA $7A69				;$00EC1E	|
	STA $7F4D,Y				;$00EC21	|
	BRA label_00EC34		;$00EC24	|

label_00EC26:
	LDA $7A6B				;$00EC26	|
	STA $7F4F,Y				;$00EC29	|
	LDA $7A6D				;$00EC2C	|
	STA $7F51,Y				;$00EC2F	|
	BRA label_00EC34		;$00EC32	|


label_00EC34:
	LDA $7AE3				;$00EC34	|
	JSL label_00EF16		;$00EC37	|
	LDX $7AE3				;$00EC3B	|
	STA $7F04,X				;$00EC3E	|
	RTL						;$00EC41	|





label_00EC42:
	LDY $7AE3				;$00EC42	|\ 
	CMP #$0002				;$00EC45	|| Jump to the routine.
  -	BCS -					;$00EC48	||] Hardlock the game if a value >= 2 is passed.
	ASL A					;$00EC4A	||
	TAX						;$00EC4B	||
	JMP (label_00EC4F,X)	;$00EC4C	|/

label_00EC4F:
	dw label_00EC53
	dw label_00ED3B

label_00EC53:
	LDA $7F0A,Y				;$00EC53	|
	STA $7AE5				;$00EC56	|
	LDA $7F0C,Y				;$00EC59	|
	STA $7AE7				;$00EC5C	|
	LDA $7F0D,Y				;$00EC5F	|
	STA $7AE8				;$00EC62	|
	LDA $7F0F,Y				;$00EC65	|
	STA $7A93				;$00EC68	|
	LDA $7F11,Y				;$00EC6B	|
	STA $7AEB				;$00EC6E	|
	LDA $7F13,Y				;$00EC71	|
	STA $7AED				;$00EC74	|
	LDA $7F15,Y				;$00EC77	|
	STA $7AEF				;$00EC7A	|
	LDA $7F17,Y				;$00EC7D	|
	STA $7AF1				;$00EC80	|
	LDA $7F29,Y				;$00EC83	|
	STA $7B03				;$00EC86	|
	SEP #$20				;$00EC89	|
	LDA $7F25,Y				;$00EC8B	|
	STA $7AFF				;$00EC8E	|
	LDA $7F26,Y				;$00EC91	|
	STA $7B00				;$00EC94	|
	LDA $7F27,Y				;$00EC97	|
	STA $7B01				;$00EC9A	|
	LDA $7F28,Y				;$00EC9D	|
	STA $7B02				;$00ECA0	|
	REP #$20				;$00ECA3	|
	LDA $7F19,Y				;$00ECA5	|
	STA $7AF3				;$00ECA8	|
	LDA $7F1B,Y				;$00ECAB	|
	STA $7AF5				;$00ECAE	|
	LDA $7F1D,Y				;$00ECB1	|
	STA $7AF7				;$00ECB4	|
	LDA $7F1F,Y				;$00ECB7	|
	STA $7AF9				;$00ECBA	|
	LDA $7F21,Y				;$00ECBD	|
	STA $7AFB				;$00ECC0	|
	LDA $7F23,Y				;$00ECC3	|
	STA $7AFD				;$00ECC6	|
	LDA $7F3A,Y				;$00ECC9	|
	STA $7B15				;$00ECCC	|
	LDA $7F3C,Y				;$00ECCF	|
	STA $7B17				;$00ECD2	|
	LDA $7F3E,Y				;$00ECD5	|
	STA $7B19				;$00ECD8	|
	LDA $7F40,Y				;$00ECDB	|
	STA $7B1B				;$00ECDE	|
	LDA $7F42,Y				;$00ECE1	|
	STA $7B1D				;$00ECE4	|
	SEP #$20				;$00ECE7	|
	LDA $7F44,Y				;$00ECE9	|
	STA $7B1F				;$00ECEC	|
	LDA $7F45,Y				;$00ECEF	|
	STA $7B20				;$00ECF2	|
	REP #$20				;$00ECF5	|
	SEP #$20				;$00ECF7	|
	LDA $7F46,Y				;$00ECF9	|
	STA $7B21				;$00ECFC	|
	REP #$20				;$00ECFF	|
	SEP #$20				;$00ED01	|
	LDA $7F47,Y				;$00ED03	|
	STA $7A63				;$00ED06	|
	LDA $7F48,Y				;$00ED09	|
	STA $7A64				;$00ED0C	|
	LDA $7F49,Y				;$00ED0F	|
	STA $7A65				;$00ED12	|
	LDA $7F4A,Y				;$00ED15	|
	STA $7A66				;$00ED18	|
	LDA $7F4B,Y				;$00ED1B	|
	STA $7A67				;$00ED1E	|
	LDA $7F4C,Y				;$00ED21	|
	STA $7A68				;$00ED24	|
	REP #$20				;$00ED27	|
	LDA $7F4D,Y				;$00ED29	|
	STA $7A69				;$00ED2C	|
	LDA $7F4F,Y				;$00ED2F	|
	STA $7A6B				;$00ED32	|
	LDA $7F51,Y				;$00ED35	|
	STA $7A6D				;$00ED38	|
label_00ED3B:				;```````````|
	LDA $7F2B,Y				;$00ED3B	|
	STA $7B05				;$00ED3E	|
	LDA $7F2D,Y				;$00ED41	|
	STA $7B07				;$00ED44	|
	LDA $7F2F,Y				;$00ED47	|
	STA $7B09				;$00ED4A	|
	LDA $7F31,Y				;$00ED4D	|
	STA $7B0B				;$00ED50	|
	LDA $7F34,Y				;$00ED53	|
	STA $7B0F				;$00ED56	|
	LDA $7F36,Y				;$00ED59	|
	STA $7B11				;$00ED5C	|
	SEP #$20				;$00ED5F	|
	LDA $7F38,Y				;$00ED61	|
	STA $7B13				;$00ED64	|
	LDA $7F39,Y				;$00ED67	|
	STA $7B14				;$00ED6A	|
	REP #$20				;$00ED6D	|
	LDA $7F33,Y				;$00ED6F	|
	AND #$00FF				;$00ED72	|
	CMP #$00FF				;$00ED75	|
	BNE label_00ED7D		;$00ED78	|
	LDA #$FFFF				;$00ED7A	|
label_00ED7D:				;			|
	STA $7B0D				;$00ED7D	|
	RTL						;$00ED80	|





label_00ED81:
	LDX $32EA				;$00ED81	|
	CPX #$0006				;$00ED84	|
	BEQ label_00EDAE		;$00ED87	|
	PHA						;$00ED89	|
	LDX #$7AE7				;$00ED8A	|
	JSL label_00EA1E		;$00ED8D	|
	LDA $32EA				;$00ED91	|
	CMP #$0003				;$00ED94	|
	BNE label_00ED9C		;$00ED97	|
	PLA						;$00ED99	|
	BRA label_00EDB3		;$00ED9A	|

label_00ED9C:
	LDA #$0001				;$00ED9C	|
	JSL label_00EAB0		;$00ED9F	|
	PLA						;$00EDA3	|
	CMP #$0003				;$00EDA4	|
	BEQ label_00EDB6		;$00EDA7	|
	CMP #$0004				;$00EDA9	|
	BEQ label_00EDB6		;$00EDAC	|
label_00EDAE:				;			|
	CMP #$0012				;$00EDAE	|
	BEQ label_00EDB6		;$00EDB1	|
label_00EDB3:				;			|
	LDY $39					;$00EDB3	|
	RTL						;$00EDB5	|

label_00EDB6:
	LDX $32EA				;$00EDB6	|
	LDA.l DATA_00EDE5,X		;$00EDB9	|
	AND #$00FF				;$00EDBD	|
	TSB $7A93				;$00EDC0	|
	LDX $32EA				;$00EDC3	|
	LDA.l DATA_00EDDE,X		;$00EDC6	|
	AND #$00FF				;$00EDCA	|
	LDX #$7AE5				;$00EDCD	|
	JSL label_00EA1E		;$00EDD0	|
	LDA #$0000				;$00EDD4	|
	JSL label_00EAB0		;$00EDD7	|
	LDY $39					;$00EDDB	|
	RTL						;$00EDDD	|

DATA_00EDDE:				;$00EDDE	|
	db $00,$01,$02,$03,$04,$05,$06

DATA_00EDE5:				;$00EDE5	|
	db $01,$02,$04,$08,$10,$20,$40





label_00EDEC:
	PHA						;$00EDEC	|
	PHX						;$00EDED	|
	PHY						;$00EDEE	|
	LDA $32EA				;$00EDEF	|
	CMP #$0000				;$00EDF2	|
	BNE label_00EE08		;$00EDF5	|
	LDA #$0000				;$00EDF7	|
	LDX #$7AE5				;$00EDFA	|
	JSL label_00EA41		;$00EDFD	|
	BNE label_00EE08		;$00EE01	|
	PLY						;$00EE03	|
	PLX						;$00EE04	|
	PLA						;$00EE05	|
	SEC						;$00EE06	|
	RTL						;$00EE07	|

label_00EE08:
	PLY						;$00EE08	|
	PLX						;$00EE09	|
	PLA						;$00EE0A	|
	CLC						;$00EE0B	|
	RTL						;$00EE0C	|

label_00EE0D:
	LDA #$0001				;$00EE0D	|
	RTL						;$00EE10	|

label_00EE11:
	STX $2A					;$00EE11	|
	STY $2C					;$00EE13	|
	LDX #$7AE5				;$00EE15	|
	JSL label_00EA41		;$00EE18	|
	PHP						;$00EE1C	|
	LDX $2A					;$00EE1D	|
	LDY $2C					;$00EE1F	|
	PLP						;$00EE21	|
	RTL						;$00EE22	|





EraseFile:					;-----------| Routine to erase a file specified in A.
	CMP #$0003				;$00EE23	|\ Hardlock the game if the file number is outside the defined range.
  -	BCS -					;$00EE26	|/
	ASL A					;$00EE28	|
	TAX						;$00EE29	|
	JMP (.FileErasePtrs,X)	;$00EE2A	|

  .FileErasePtrs:			;$00EE2D	| Pointers to the below routine for each file.
	dw .EraseFile1
	dw .EraseFile2
	dw .EraseFile3

  .EraseFile1:				;```````````| Erasing file 1.
	STZ $7F04				;$00EE33	|\ 
	LDX #$7F04				;$00EE36	||
	LDY #$7F05				;$00EE39	|| Clear out $7F04-$7F52.
	LDA #$004D				;$00EE3C	||
	MVN $0000				;$00EE3F	|/
	LDY #$0000				;$00EE42	|
	LDX #$0000				;$00EE45	|
	BRA .MakeNewFile		;$00EE48	|
	
  .EraseFile2:				;```````````| Erasing file 2.
	STZ $7F53				;$00EE4A	|\ 
	LDX #$7F53				;$00EE4D	||
	LDY #$7F54				;$00EE50	|| Clear out $7F53-$7FA1.
	LDA #$004D				;$00EE53	||
	MVN $0000				;$00EE56	|/
	LDY #$004F				;$00EE59	|
	LDX #$0001				;$00EE5C	|
	BRA .MakeNewFile		;$00EE5F	|
	
  .EraseFile3:				;```````````| Erasing file 3.
	STZ $7FA2				;$00EE61	|\ 
	LDX #$7FA2				;$00EE64	||
	LDY #$7FA3				;$00EE67	|| Clear out $7FA2-$7FF0.
	LDA #$004D				;$00EE6A	||
	MVN $0000				;$00EE6D	|/
	LDY #$009E				;$00EE70	|
	LDX #$0002				;$00EE73	|
  .MakeNewFile:				;```````````| All three join back up. X = file number, Y = base index to file data.
	LDA $7F06,Y				;$00EE76	|
	ORA #$00FF				;$00EE79	|
	STA $7F06,Y				;$00EE7C	|
	SEP #$20				;$00EE7F	|
	LDA #$00				;$00EE81	|
	STA $7F07,Y				;$00EE83	|
	STA $7F08,Y				;$00EE86	|
	STA $7F09,Y				;$00EE89	|
	REP #$20				;$00EE8C	|
	LDA #$6363				;$00EE8E	|
	STA $7F19,Y				;$00EE91	|
	STA $7F1D,Y				;$00EE94	|
	STA $7F21,Y				;$00EE97	|
	LDA #$0063				;$00EE9A	|
	STA $7F1B,Y				;$00EE9D	|
	STA $7F1F,Y				;$00EEA0	|
	STA $7F23,Y				;$00EEA3	|
	LDA #$93DD				;$00EEA6	|
	STA $7F3A,Y				;$00EEA9	|
	LDA #$0004				;$00EEAC	|
	STA $7F3C,Y				;$00EEAF	|
	PHY						;$00EEB2	|\ 
	JSL GetSaveChecksum		;$00EEB3	|| Get a new checksum for the data.
	PLY						;$00EEB7	||
	STA $7F04,Y				;$00EEB8	|/
	RTL						;$00EEBB	|


ValidateSaves:				;-----------| Routine to validate save file integrity. If a save file fails, it is deleted.
	STZ $00					;$00EEBC	|
	LDX #$0000				;$00EEBE	|\ 
	JSL GetSaveChecksum		;$00EEC1	||
	CMP $7F04				;$00EEC5	|| Get a sum of all bytes in $7F0A through $7F52 (save file 1),
	BEQ .ValidFile1			;$00EEC8	||  and if it does not match $7F04, erase it.
	LDA #$0000				;$00EECA	||
	JSL EraseFile			;$00EECD	|/
	INC $00					;$00EED1	|
  .ValidFile1:				;			|
	LDX #$0001				;$00EED3	|\ 
	JSL GetSaveChecksum		;$00EED6	||
	CMP $7F53				;$00EEDA	|| Get a sum of all bytes in $7F59 through $7FA1 (save file 2),
	BEQ .ValidFile2			;$00EEDD	||  and if it does not match $7F53, erase it.
	LDA #$0001				;$00EEDF	||
	JSL EraseFile			;$00EEE2	|/
	INC $00					;$00EEE6	|
  .ValidFile2:				;			|
	LDX #$0002				;$00EEE8	|\ 
	JSL GetSaveChecksum		;$00EEEB	||
	CMP $7FA2				;$00EEEF	|| Get a sum of all bytes in $7FA8 through $7FF0 (save file 3),
	BEQ .ValidFile3			;$00EEF2	||  and if it does not match $7FA2, erase it.
	LDA #$0002				;$00EEF4	||
	JSL EraseFile			;$00EEF7	|/
	INC $00					;$00EEFB	|
  .ValidFile3:				;			|
	LDA $00					;$00EEFD	|
	CMP #$0003				;$00EEFF	|
	BNE .notAllInvalid		;$00EF02	|
	SEP #$20				;$00EF04	|\ 
	STZ $7F00				;$00EF06	|| For when creating a new SRAM?
	STZ $7F01				;$00EF09	||
	REP #$20				;$00EF0C	|/
  .notAllInvalid:			;			|
	RTL						;$00EF0E	|


GetSaveChecksum:			;-----------| Subroutine to take a checksum of the save file in X.
	LDA.l SaveIndices,X		;$00EF0F	|\ 
	AND #$00FF				;$00EF13	||
label_00EF16:				;			||
	CLC						;$00EF16	|| $14 = 24-bit pointer to file data ($7F0A, $7F59, $7FA8).
	ADC #$7F0A				;$00EF17	||
	STA $14					;$00EF1A	||
	STZ $16					;$00EF1C	|/
	LDY #$0048				;$00EF1E	|\ 
	STZ $02					;$00EF21	||
  .loop:					;			||
	LDA [$14],Y				;$00EF23	||
	AND #$00FF				;$00EF25	|| Get a sum of all the bytes in the range.
	CLC						;$00EF28	||
	ADC $02					;$00EF29	||
	STA $02					;$00EF2B	||
	DEY						;$00EF2D	||
	BPL .loop				;$00EF2E	|/
	RTL						;$00EF30	|

SaveIndices:				;$00EF31	| Indices to each save file from $7F0A.
	db $00								; File 1
	db $4F								; File 2
	db $9E								; File 3



CheckEmptySaves:			;-----------| Subroutine to check for any uninitialized save files and prepare them so $00EEBC will generate a new file over them.
	LDX #$0000				;$00EF34	|\ 
	JSR .CheckIfEmpty		;$00EF37	||
	LDA $28					;$00EF3A	|| If file 1 is unitialized, give it an invalid checksum.
	BNE .okayFile1			;$00EF3C	||
	LDA #$FFFF				;$00EF3E	||
	STA $7F04				;$00EF41	|/
  .okayFile1:				;			|
	LDX #$0001				;$00EF44	|\ 
	JSR .CheckIfEmpty		;$00EF47	||
	LDA $28					;$00EF4A	|| If file 2 is unitialized, give it an invalid checksum.
	BNE .okayFile2			;$00EF4C	||
	LDA #$FFFF				;$00EF4E	||
	STA $7F53				;$00EF51	|/
  .okayFile2:				;			|
	LDX #$0002				;$00EF54	|\ 
	JSR .CheckIfEmpty		;$00EF57	||
	LDA $28					;$00EF5A	|| If file 3 is unitialized, give it an invalid checksum.
	BNE .okayFile3			;$00EF5C	||
	LDA #$FFFF				;$00EF5E	||
	STA $7FA2				;$00EF61	|/
  .okayFile3:				;			|
	RTL						;$00EF64	|

  .CheckIfEmpty:			;```````````| Check if the file give in X is uninitialized.
	LDA.l SaveIndices,X		;$00EF65	|
	AND #$00FF				;$00EF69	|
	CLC						;$00EF6C	|
	ADC #$7F0A				;$00EF6D	|
	STA $14					;$00EF70	|
	STZ $16					;$00EF72	|
	LDY #$0048				;$00EF74	|
	STZ $28					;$00EF77	|
label_00EF79:				;			|
	LDA [$14],Y				;$00EF79	|
	AND #$00FF				;$00EF7B	|
	ORA $28					;$00EF7E	|
	STA $28					;$00EF80	|
	DEY						;$00EF82	|
	BPL label_00EF79		;$00EF83	|
	RTS						;$00EF85	|





label_00EF86:
	LDX $7AE3				;$00EF86	|
	LDA $32EA				;$00EF89	|
	SEP #$20				;$00EF8C	|
	STA $7F06,X				;$00EF8E	|
	REP #$20				;$00EF91	|
	RTL						;$00EF93	|
	STA $02					;$00EF94	|
	TAX						;$00EF96	|
	STZ $00					;$00EF97	|
	LDA $7F0A,X				;$00EF99	|
	BIT #$0001				;$00EF9C	|
	BEQ label_00EFA6		;$00EF9F	|
	LDA #$000B				;$00EFA1	|
	BRA label_00EFBF		;$00EFA4	|

label_00EFA6:
	LDA $7F0C,X				;$00EFA6	|
	LDY #$0003				;$00EFA9	|
label_00EFAC:				;			|
	LSR A					;$00EFAC	|
	BCC label_00EFB3		;$00EFAD	|
	INC $00					;$00EFAF	|
	INC $00					;$00EFB1	|
label_00EFB3:				;			|
	DEY						;$00EFB3	|
	BNE label_00EFAC		;$00EFB4	|
	LSR A					;$00EFB6	|
	BCC label_00EFC1		;$00EFB7	|
	LDA $00					;$00EFB9	|
	CLC						;$00EFBB	|
	ADC #$0005				;$00EFBC	|
label_00EFBF:				;			|
	STA $00					;$00EFBF	|
label_00EFC1:				;			|
	STZ $06					;$00EFC1	|
	LDA $7F47,X				;$00EFC3	|
	AND #$00FF				;$00EFC6	|
	BEQ label_00EFDD		;$00EFC9	|
	TAX						;$00EFCB	|
label_00EFCC:				;			|
	LDA.l DATA_00F0ED,X		;$00EFCC	|
	AND #$00FF				;$00EFD0	|
	CLC						;$00EFD3	|
	ADC $06					;$00EFD4	|
	STA $06					;$00EFD6	|
	DEX						;$00EFD8	|
	BNE label_00EFCC		;$00EFD9	|
	LDX $02					;$00EFDB	|
label_00EFDD:				;			|
	LDA $7F0C,X				;$00EFDD	|
	BIT #$0010				;$00EFE0	|
	BEQ label_00EFED		;$00EFE3	|
	LDA $06					;$00EFE5	|
	CLC						;$00EFE7	|
	ADC #$0005				;$00EFE8	|
	STA $06					;$00EFEB	|
label_00EFED:				;			|
	LDA $7F48,X				;$00EFED	|
	LSR A					;$00EFF0	|
	BCC label_00EFF5		;$00EFF1	|
	INC $06					;$00EFF3	|
label_00EFF5:				;			|
	LSR A					;$00EFF5	|
	BCC label_00EFFA		;$00EFF6	|
	INC $06					;$00EFF8	|
label_00EFFA:				;			|
	LDA $7F07,X				;$00EFFA	|
	AND #$00FF				;$00EFFD	|
	CMP #$0010				;$00F000	|
	BCS label_00F009		;$00F003	|
	CMP $06					;$00F005	|
	BCS label_00F012		;$00F007	|
label_00F009:				;			|
	LDA $06					;$00F009	|
	SEP #$20				;$00F00B	|
	STA $7F07,X				;$00F00D	|
	REP #$20				;$00F010	|
label_00F012:				;			|
	CLC						;$00F012	|
	ADC $00					;$00F013	|
	STA $00					;$00F015	|
	LDA $7F26,X				;$00F017	|
	AND #$00FF				;$00F01A	|
	BEQ label_00F027		;$00F01D	|
	LDA #$0006				;$00F01F	|
	CLC						;$00F022	|
	ADC $00					;$00F023	|
	STA $00					;$00F025	|
label_00F027:				;			|
	STZ $06					;$00F027	|
	LDA $7F38,X				;$00F029	|
	AND #$00FF				;$00F02C	|
	LSR A					;$00F02F	|
	LSR A					;$00F030	|
	CLC						;$00F031	|
	ADC $06					;$00F032	|
	STA $06					;$00F034	|
	LDA $7F0C,X				;$00F036	|
	LSR A					;$00F039	|
	LSR A					;$00F03A	|
	LSR A					;$00F03B	|
	LSR A					;$00F03C	|
	LSR A					;$00F03D	|
	LDY #$0004				;$00F03E	|
label_00F041:				;			|
	LSR A					;$00F041	|
	BCC label_00F046		;$00F042	|
	INC $06					;$00F044	|
label_00F046:				;			|
	DEY						;$00F046	|
	BNE label_00F041		;$00F047	|
	LDA $7F39,X				;$00F049	|
	AND #$00FF				;$00F04C	|
	BEQ label_00F059		;$00F04F	|
	LDA $06					;$00F051	|
	CLC						;$00F053	|
	ADC #$0003				;$00F054	|
	STA $06					;$00F057	|
label_00F059:				;			|
	LDA $7F08,X				;$00F059	|
	AND #$00FF				;$00F05C	|
	CMP #$0017				;$00F05F	|
	BCS label_00F068		;$00F062	|
	CMP $06					;$00F064	|
	BCS label_00F071		;$00F066	|
label_00F068:				;			|
	LDA $06					;$00F068	|
	SEP #$20				;$00F06A	|
	STA $7F08,X				;$00F06C	|
	REP #$20				;$00F06F	|
label_00F071:				;			|
	CLC						;$00F071	|
	ADC $00					;$00F072	|
	STA $00					;$00F074	|
	LDA $7F0A,X				;$00F076	|
	BIT #$0010				;$00F079	|
	BEQ label_00F086		;$00F07C	|
	LDA $00					;$00F07E	|
	CLC						;$00F080	|
	ADC #$0012				;$00F081	|
	BRA label_00F0B3		;$00F084	|

label_00F086:
	LDA $7F4D,X				;$00F086	|
	BEQ label_00F0A5		;$00F089	|
	CMP #$0008				;$00F08B	|
	BNE label_00F093		;$00F08E	|
	LDA #$0004				;$00F090	|
label_00F093:				;			|
	TAX						;$00F093	|
label_00F094:				;			|
	LDA $00F0F3,X			;$00F094	|
	AND #$00FF				;$00F098	|
	CLC						;$00F09B	|
	ADC $00					;$00F09C	|
	STA $00					;$00F09E	|
	DEX						;$00F0A0	|
	BNE label_00F094		;$00F0A1	|
	LDX $02					;$00F0A3	|
label_00F0A5:				;			|
	LDA $7F0E,X				;$00F0A5	|
	BIT #$0001				;$00F0A8	|
	BEQ label_00F0B5		;$00F0AB	|
	LDA $00					;$00F0AD	|
	CLC						;$00F0AF	|
	ADC #$0004				;$00F0B0	|
label_00F0B3:				;			|
	STA $00					;$00F0B3	|
label_00F0B5:				;			|
	JSL label_00F0FC		;$00F0B5	|
	STA $06					;$00F0B9	|
	LDA $7F09,X				;$00F0BB	|
	AND #$00FF				;$00F0BE	|
	CMP #$001A				;$00F0C1	|
	BCS label_00F0CA		;$00F0C4	|
	CMP $06					;$00F0C6	|
	BCS label_00F0D3		;$00F0C8	|
label_00F0CA:				;			|
	LDA $06					;$00F0CA	|
	SEP #$20				;$00F0CC	|
	STA $7F09,X				;$00F0CE	|
	REP #$20				;$00F0D1	|
label_00F0D3:				;			|
	CLC						;$00F0D3	|
	ADC $00					;$00F0D4	|
	STA $00					;$00F0D6	|
	LDA $7F46,X				;$00F0D8	|
	AND #$00FF				;$00F0DB	|
	BEQ label_00F0E8		;$00F0DE	|
	LDA $00					;$00F0E0	|
	CLC						;$00F0E2	|
	ADC #$0003				;$00F0E3	|
	STA $00					;$00F0E6	|
label_00F0E8:				;			|
	LDA $00					;$00F0E8	|
	LDY $39					;$00F0EA	|
	RTL						;$00F0EC	|


DATA_00F0ED:
	db $00,$02,$02,$02,$02,$00,$00,$01
	db $02,$02,$02,$02,$02,$03,$00


label_00F0FC:
	STZ $06					;$00F0FC	|
	LDA $7F45,X				;$00F0FE	|
	AND #$00FF				;$00F101	|
	CMP #$0013				;$00F104	|
	BCC label_00F10B		;$00F107	|
	INC $06					;$00F109	|
label_00F10B:				;			|
	LSR A					;$00F10B	|
	CLC						;$00F10C	|
	ADC $06					;$00F10D	|
	STA $06					;$00F10F	|
	LDA $7F4F,X				;$00F111	|
	LDY #$0007				;$00F114	|
label_00F117:				;			|
	LSR A					;$00F117	|
	BCC label_00F11C		;$00F118	|
	INC $06					;$00F11A	|
label_00F11C:				;			|
	DEY						;$00F11C	|
	BNE label_00F117		;$00F11D	|
	LDA $7F0E,X				;$00F11F	|
	BIT #$0002				;$00F122	|
	BEQ label_00F12B		;$00F125	|
	INC $06					;$00F127	|
	INC $06					;$00F129	|
label_00F12B:				;			|
	BIT #$0004				;$00F12B	|
	BEQ label_00F138		;$00F12E	|
	LDA #$0006				;$00F130	|
	CLC						;$00F133	|
	ADC $06					;$00F134	|
	STA $06					;$00F136	|
label_00F138:				;			|
	LDA $06					;$00F138	|
	LDY $39					;$00F13A	|
	RTL						;$00F13C	|

label_00F13D:
	LDA $7AED				;$00F13D	|
	CMP $7378				;$00F140	|
	BNE label_00F14B		;$00F143	|
	LDA $7AEB				;$00F145	|
	CMP $7376				;$00F148	|
label_00F14B:				;			|
	BCS label_00F160		;$00F14B	|
	LDA $7378				;$00F14D	|
	STA $7AED				;$00F150	|
	LDA $7376				;$00F153	|
	STA $7AEB				;$00F156	|
	LDA #$0002				;$00F159	|
	JSL label_00EAB0		;$00F15C	|
label_00F160:				;			|
	RTL						;$00F160	|

label_00F161:
	LDA $7AF1				;$00F161	|
	CMP $7378				;$00F164	|
	BNE label_00F16F		;$00F167	|
	LDA $7AEF				;$00F169	|
	CMP $7376				;$00F16C	|
label_00F16F:				;			|
	BCS label_00F184		;$00F16F	|
	LDA $7378				;$00F171	|
	STA $7AF1				;$00F174	|
	LDA $7376				;$00F177	|
	STA $7AEF				;$00F17A	|
	LDA #$0003				;$00F17D	|
	JSL label_00EAB0		;$00F180	|
label_00F184:
	RTL						;$00F184	|





Empty_00F185:				;$00F185	| Unused.
	padbyte $FF : pad $00FFB0

SNES_Registration:			;$00FFB0	| Internal SNES registration info.
	db $30,$31,$41,$4B,$46,$45,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00

SNES_Header:				;$00FFC0	| Internal ROM header.
	db "KIRBY SUPER DELUXE   "			; $00FFC0 - Game name
	db $23								; $00FFD5 -   Mapping: SA-1
	db $35								; $00FFD6 -      Type: ROM + RAM + SRAM + SA-1
	db $0C								; $00FFD7 -  ROM size: 32 MBit
	db $03								; $00FFD8 - SRAM size: 64 KBit
	db $01								; $00FFD9 -    Locale: EN
	db $33								; $00FFDA - (Fixed value; always $33)
	db $00								; $00FFDB -   Version: 1.0
	dw $3955							; $00FFDC - Complement checksum
	dw $C6AA							; $00FFDE - Checksum

Interrupt_Vectors_Nat:		;$00FFE0	| Native mode interrupt vectors
	dw $0000,$0000						; $00FFE0 - (unused)
	dw $0000							; $00FFE4 - COP
	dw $5FFF							; $00FFE6 - BRK
	dw $0000							; $00FFE8 - ABORT
	dw NMI_SNES							; $00FFEA - NMI
	dw $0000							; $00FFEC - (unused)
	dw IRQ_SNES							; $00FFEE - IRQ

Interrupt_Vectors_Emu:		;$00FFF0	| Emulation mode interrupt vectors
	dw $0000,$0000						; $00FFF0 - (unused)
	dw $0000							; $00FFF4 - COP
	dw $0000							; $00FFF6 - (unused)
	dw $0000							; $00FFF8 - ABORT
	dw $0000							; $00FFFA - NMI
	dw Reset_SNES						; $00FFFC - RESET
	dw $0000							; $00FFFE - IRQ, BRK. Also used as a fixed $0000 value by $0080F6.