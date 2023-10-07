

label_01DE76:					;-----------| Routine to prepare a VWF upload. A = index to placement info ($CB0000), X = index to text data ($CB0F18)
	STZ $4B						;$01DE76	|] Set the BG3 tilemap to be cleared out.
	BRA label_01DE7F			;$01DE78	|

label_01DE7A:					;```````````| Entry point to the above, which does not clear out the BG3 tilemap.
	LDY #$0001					;$01DE7A	|\ Set the BG3 tilemap to not be cleared out.
	STY $4B						;$01DE7D	|/
label_01DE7F:					;			|
	STA $49						;$01DE7F	|
	LDA.l DATA_CB0F18,X			;$01DE81	|\ 
	STA $45						;$01DE85	|| Get pointer to data in the text data in bank 0x16.
	LDA #$00CB					;$01DE87	||
	STA $47						;$01DE8A	|/
	LDA #$FFFF					;$01DE8C	|
	STA $7A23					;$01DE8F	|
	STZ $303B					;$01DE92	|
	STZ $3041					;$01DE95	|
	BIT $0000					;$01DE98	|\ 
	BPL label_01DEA7			;$01DE9B	||
	LDA #$DEA7					;$01DE9D	|| Make sure the below executes on the SNES.
	LDX #$0001					;$01DEA0	||
	JML SA1_ExecuteSNES			;$01DEA3	|/

label_01DEA7:					;```````````| Should now be running on the SNES.
	LDA $45						;$01DEA7	|\ 
	STA $0091					;$01DEA9	|| $91 = pointer to VWF data.
	LDA $47						;$01DEAC	||
	STA $0093					;$01DEAE	|/
	LDA $49						;$01DEB1	|\ $8F = index to some info about where to place the tilemap.
	STA $008F					;$01DEB3	|/
	ASL A						;$01DEB6	|
	ASL A						;$01DEB7	|
	ASL A						;$01DEB8	|
	TAX							;$01DEB9	|
	LDA.l DATA_CB0000,X			;$01DEBA	|\ $4F = base BG3 GFX VRAM address to use
	STA $004F					;$01DEBD	|/
	LDA.l DATA_CB0000+2,X		;$01DEC1	|\ $4B = base BG3 tilemap VRAM address to use
	STA $004B					;$01DEC5	|/
	LDA.l DATA_CB0000+5,X		;$01DEC8	|\ 
	AND #$00FF					;$01DECC	||
	ORA #$2000					;$01DECF	||
	STA $4202					;$01DED2	||
	LDA.l DATA_CB0000+4,X		;$01DED5	|| $4D = VRAM address to start writing the tilemap at
	AND #$00FF					;$01DED9	||
	ADC $4216					;$01DEDC	||
	ADC $004B					;$01DEDF	||
	STA $004D					;$01DEE2	|/
	LDA.l DATA_CB0000+6,X		;$01DEE5	|\ 
	STA $4202					;$01DEE9	||
	AND #$00FF					;$01DEEC	||
	STA $0051					;$01DEEF	||
	LDA.l DATA_CB0000+7,X		;$01DEF2	|| $51 = width of text
	AND #$00FF					;$01DEF6	|| $53 = height of text
	STA $0053					;$01DEF9	|| $55 = total number of 8x8 tiles in text
	LDA $4216					;$01DEFC	||
	INC A						;$01DEFF	||
	INC A						;$01DF00	||
	STA $0055					;$01DF01	|/
	LDA #$0000					;$01DF04	|\ 
	LDX $004F					;$01DF07	|| Set VRAM address for the BG3 tilemap/GFX as specified.
 	LDY $004B					;$01DF0A	||
	JSL SetupBG3VRAM			;$01DF0D	|/
	LDA #$0006					;$01DF11	|\ 
	STA $31						;$01DF14	||
	LDA #$0010					;$01DF16	||
	STA $32						;$01DF19	|| Set up a 16-byte fixed-transfer DMA from
	LDA #$DF94					;$01DF1B	||  $01DF94 (00) to the start of the BG3 GFX file.
	STA $34						;$01DF1E	|| Basically, this writes a blank tile.
	LDA #$0001					;$01DF20	||
	STA $36						;$01DF23	||
	LDA $004F					;$01DF25	||
	STA $37						;$01DF28	||
	JSL WriteToDMABuffer		;$01DF2A	|/
	LDA $4B						;$01DF2E	|\ Branch if the tilemap is not supposed to be cleared.
	BNE label_01DF53			;$01DF30	|/
	LDA #$000C					;$01DF32	|\ 
	STA $31						;$01DF35	||
	LDA #$0400					;$01DF37	||
	STA $32						;$01DF3A	|| Set up two 0x400 fixed-transfer DMAs from
	LDA $004B					;$01DF3C	||  $01DF94 (00,20) to the BG3 tilemap.
	STA $37						;$01DF3F	|| The first transfer does the low bytes (00 - tile number),
	JSL WriteToDMABuffer		;$01DF41	||  while the second does the high bytes (20 - yxppccct).
	SEP #$20					;$01DF45	||
	LDA #$12					;$01DF47	|| In other words, this clears out the tilemap.
	STA $31						;$01DF49	||
	REP #$20					;$01DF4B	||
	INC $34						;$01DF4D	||
	JSL WriteToDMABuffer		;$01DF4F	|/
label_01DF53:					;			|
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
	JMP label_01DFC6			;$01DF91	|
	
DATA_01DF94:					;$01DF94	| Used for a fixed-transfer DMA to a specified VRAM location.
	db $00,$20



label_01DF96:					;-----------| 
	LDA.l DATA_CB0F18,X			;$01DF96	|\ 
	STA $45						;$01DF9A	|| Get pointer to the text string being read.
	LDA #$00CB					;$01DF9C	||
	STA $47						;$01DF9F	|/
	STZ $33C6					;$01DFA1	|
	BIT $0000					;$01DFA4	|\ 
	BPL label_01DFB3			;$01DFA7	||
	LDA #$DFB3					;$01DFA9	|| Run the below on the SNES.
	LDX #$0001					;$01DFAC	||
	JML $008C92					;$01DFAF	|/

label_01DFB3:					;```````````| On the SNES now.
	STZ $0083					;$01DFB3	|
	STZ $0061					;$01DFB6	|
	JMP label_01DFC6			;$01DFB9	|


label_01DFBC:					;-----------| Alt entry to the below: increments text pointer by 5 before moving on.
	INC $45						;$01DFBC	|
label_01DFBE:					;```````````| ...by 4.
	INC $45						;$01DFBE	|
label_01DFC0:					;```````````| ...by 3.
	INC $45						;$01DFC0	|
label_01DFC2:					;```````````| ...by 2.
	INC $45						;$01DFC2	|
label_01DFC4:					;```````````| ...by 1.
	INC $45						;$01DFC4	|
label_01DFC6:					;-----------| Main entry to the VWF text loop. Reads and prepares text to be written to the screen.
	LDA $33C6					;$01DFC6	|
	BNE label_01DFEA			;$01DFC9	|
	LDA $30A3					;$01DFCB	|
	AND #$0004					;$01DFCE	|
	TSB $7A28					;$01DFD1	|
	LDA $0061					;$01DFD4	|
	BEQ label_01DFED			;$01DFD7	|
	DEC $0061					;$01DFD9	|
	LDA $32C4					;$01DFDC	|
	ORA $32C6					;$01DFDF	|
	AND $005F					;$01DFE2	|
	BEQ label_01DFEA			;$01DFE5	|
	STZ $0061					;$01DFE7	|
label_01DFEA:					;			|
	JMP label_01E6F6			;$01DFEA	|

label_01DFED:
	LDA [$45]					;$01DFED	|\ Get current byte and increment text pointer.
	INC $45						;$01DFEF	|/
	AND #$00FF					;$01DFF1	|\ 
	CMP #$0020					;$01DFF4	|| Branch if this is a normal character and not a command.
	BCS label_01E03E			;$01DFF7	|/
	ASL A						;$01DFF9	|
	TAX							;$01DFFA	|
	JMP (Pointers01DFFE,X)		;$01DFFB	|

Pointers01DFFE:					;$01DFFE	| Pointers to routines for special text commands.
	dw label_01E362				; 00 - End of text
	dw label_01E386				; 01 - Wait $XX frames
	dw label_01E47E				; 02 - New line
	dw label_01E4B1				; 03 - 
	dw label_01E6C8				; 04 - 
	dw label_01E4F1				; 05 - Set character width
	dw label_01E504				; 06 - 
	dw label_01E519				; 07 - 
	dw label_01E521				; 08 - Change text foreground/background color
	dw label_01E52D				; 09 - 
	dw label_01E543				; 0A - 
	dw label_01E54C				; 0B - 
	dw label_01E555				; 0C - 
	dw label_01E56F				; 0D - 
	dw label_01E588				; 0E - Jump to text macro
	dw label_01E5AE				; 0F - 
	dw label_01E67D				; 10 - Write 8-bit value to RAM address
	dw label_01E694				; 11 - Write 16-bit value to RAM address
	dw label_01E6A7				; 12 - Enable text cursor
	dw label_01E6B0				; 13 - Disable text cursor
	dw label_01E6B9				; 14 - Enable secondary color
	dw label_01E6C2				; 15 - Disable secondary color
	dw label_01DFC6				; 16 - Unused?
	dw label_01DFC6				; 17 - Unused?
	dw label_01E067				; 18 - Write character 1xx
	dw label_01E05B				; 19 - Write character 2xx
	dw label_01DFC6				; 1A - Unused?
	dw label_01E35F				; 1B - Skip next byte?
	dw label_01DFC6				; 1C - Unused?
	dw label_01E6D3				; 1D - 
	dw label_01E6DE				; 1E - 
	dw label_01E6EA				; 1F - 



label_01E03E:					;-----------| Not a special command; write either a space or normal character.
	CMP #$0020					;$01E03E	|\ Branch if reading a non-space character (0x20).
	BNE label_01E071			;$01E041	|/
	LDA $0063					;$01E043	|\\ ???
	BPL label_01E04B			;$01E046	||/
	LDA #$0006					;$01E048	||] Standard space width (6 pixels).
label_01E04B:					;			|| Increment text position by the specified space width.
	CLC							;$01E04B	||
	ADC $0057					;$01E04C	||
	STA $0057					;$01E04F	|/
	LDA $005D					;$01E052	|\ ?
	STA $0061					;$01E055	|/
	JMP label_01DFC6			;$01E058	|



label_01E05B:					;-----------| Text command 19 - Write tile directly, with a high byte of 0x02.
	LDA [$45]					;$01E05B	|\ 
	AND #$00FF					;$01E05D	|| Set high byte of next tile to 0x02.
	ORA #$0200					;$01E060	||
	INC $45						;$01E063	|/
	BRA label_01E071			;$01E065	| Prepare that tile for VRAM.

label_01E067:					;-----------| Text command 18 - Write tile directly, with a high byte of 0x01.
	LDA [$45]					;$01E05B	|\ 
	AND #$00FF					;$01E05D	|| Set high byte of the next tile to 0x01.
	ORA #$0100					;$01E060	||
	INC $45						;$01E063	|/

label_01E071:					;-----------| Text value of 0x21-0xFF: Prepare for writing tile directly into VRAM. TODO: later...
	SEC							;$01E071	|\ 
	SBC #$0021					;$01E072	|| $0C = char number
	STA $0C						;$01E075	|/
	LDX $0057					;$01E077	|
	CPX #$0100					;$01E07A	|
	BCC label_01E082			;$01E07D	|
	JMP label_01E310			;$01E07F	|

label_01E082:
	CMP #$000A					;$01E082	|
	BCS label_01E090			;$01E085	|
	ASL A						;$01E087	|
	ASL A						;$01E088	|
	ASL A						;$01E089	|
	ASL A						;$01E08A	|
	ADC #$00F8					;$01E08B	|
	BRA label_01E098			;$01E08E	|

label_01E090:
	ASL A						;$01E090	|
	ASL A						;$01E091	|
	ASL A						;$01E092	|
	ASL A						;$01E093	|
	ASL A						;$01E094	|
	ADC #$0058					;$01E095	|
label_01E098:					;			|
	STA $14						;$01E098	|
	LDA #$00CB					;$01E09A	|
	STA $16						;$01E09D	|
	SEP #$20					;$01E09F	|
	LDX #$0000					;$01E0A1	|
label_01E0A4:					;			|
	LDA $0D						;$01E0A4	|
	BNE label_01E0E0			;$01E0A6	|
	LDA $0C						;$01E0A8	|
	CMP #$0A					;$01E0AA	|
	BCS label_01E0E0			;$01E0AC	|
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
	BMI label_01E11E			;$01E0C4	|
	CPX $0066					;$01E0C6	|
	BNE label_01E0D1			;$01E0C9	|
	LDA #$FF					;$01E0CB	|
	STA $00						;$01E0CD	|
	BRA label_01E11E			;$01E0CF	|

label_01E0D1:
	TXA							;$01E0D1	|
	CLC							;$01E0D2	|
	ADC #$10					;$01E0D3	|
	CMP $0066					;$01E0D5	|
	BNE label_01E11E			;$01E0D8	|
	LDA #$FF					;$01E0DA	|
	STA $03						;$01E0DC	|
	BRA label_01E11E			;$01E0DE	|

label_01E0E0:
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
	BMI label_01E11E			;$01E100	|
	CPX $0066					;$01E102	|
	BNE label_01E10F			;$01E105	|
	LDA #$FF					;$01E107	|
	STA $00						;$01E109	|
	STA $01						;$01E10B	|
	BRA label_01E11E			;$01E10D	|

label_01E10F:
	TXA							;$01E10F	|
	CLC							;$01E110	|
	ADC #$10					;$01E111	|
	CMP $0066					;$01E113	|
	BNE label_01E11E			;$01E116	|
	LDA #$FF					;$01E118	|
	STA $03						;$01E11A	|
	STA $04						;$01E11C	|
label_01E11E:					;			|
	LDA $0057					;$01E11E	|
	AND #$07					;$01E121	|
	BEQ label_01E134			;$01E123	|
label_01E125:					;			|
	LSR $00						;$01E125	|
	ROR $01						;$01E127	|
	ROR $02						;$01E129	|
	LSR $03						;$01E12B	|
	ROR $04						;$01E12D	|
	ROR $05						;$01E12F	|
	DEC A						;$01E131	|
	BNE label_01E125			;$01E132	|
label_01E134:					;			|
	LDA $0063					;$01E134	|
	BPL label_01E159			;$01E137	|
	TXY							;$01E139	|
	LDX $0C						;$01E13A	|
	CPX #$0060					;$01E13C	|
	BCS label_01E158			;$01E13F	|
	LDA.l DATA_01E8C1,X			;$01E141	|
	AND #$FF					;$01E145	|
	BEQ label_01E158			;$01E147	|
label_01E149:					;			|
	ASL $02						;$01E149	|
	ROL $01						;$01E14B	|
	ROL $00						;$01E14D	|
	ASL $05						;$01E14F	|
	ROL $04						;$01E151	|
	ROL $03						;$01E153	|
	DEC A						;$01E155	|
	BNE label_01E149			;$01E156	|
label_01E158:					;			|
	TYX							;$01E158	|
label_01E159:					;			|
	LDA $006D					;$01E159	|
	BEQ label_01E17E			;$01E15C	|
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
	BRA label_01E18A			;$01E17C	|

label_01E17E:
	STZ $06						;$01E17E	|
	STZ $07						;$01E180	|
	STZ $08						;$01E182	|
	STZ $09						;$01E184	|
	STZ $0A						;$01E186	|
	STZ $0B						;$01E188	|
label_01E18A:					;			|
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
	BEQ label_01E251			;$01E21F	|
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
label_01E251:					;			|
	LDA $0065					;$01E251	|
	AND #$02					;$01E254	|
	BEQ label_01E288			;$01E256	|
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
label_01E288:					;			|
	INC $14						;$01E288	|
	INX							;$01E28A	|
	INX							;$01E28B	|
	CPX #$0010					;$01E28C	|
	BCS label_01E294			;$01E28F	|
	JMP label_01E0A4			;$01E291	|

label_01E294:
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
label_01E2B1:					;			|
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
	BCC label_01E2B1			;$01E30B	|
	STX $006F					;$01E30D	|
label_01E310:					;			|
	LDX $0C						;$01E310	|
	LDA $0063					;$01E312	|
	BPL label_01E32A			;$01E315	|
	CPX #$0060					;$01E317	|
	BCS label_01E325			;$01E31A	|
	LDA.l DATA_01E861,X			;$01E31C	|
	AND #$00FF					;$01E320	|
	BRA label_01E336			;$01E323	|

label_01E325:
	LDA #$0006					;$01E325	|
	BRA label_01E336			;$01E328	|

label_01E32A:
	CPX #$000A					;$01E32A	|
	BCS label_01E336			;$01E32D	|
	LSR A						;$01E32F	|
	STA $00						;$01E330	|
	LSR A						;$01E332	|
	CLC							;$01E333	|
	ADC $00						;$01E334	|
label_01E336:					;			|
	CLC							;$01E336	|
	ADC $0057					;$01E337	|
	STA $0057					;$01E33A	|
	LDA $0067					;$01E33D	|
	BEQ label_01E34E			;$01E340	|
	EOR #$8000					;$01E342	|
	STA $0067					;$01E345	|
	BPL label_01E34E			;$01E348	|
	JSL $00D12D					;$01E34A	|
label_01E34E:					;			|
	LDA $005D					;$01E34E	|
	STA $0061					;$01E351	|
	BEQ label_01E35C			;$01E354	|
	JSR label_01E795			;$01E356	|
	JSR label_01E756			;$01E359	|
label_01E35C:					;			|
	JMP label_01DFC6			;$01E35C	|



label_01E35F:					;-----------| Text command 1B - Increment text pointer by 1?
	JMP label_01DFC4			;$01E35F	| Increment text pointer by 1 and return back to the VWF loop?



label_01E362:					;-----------| Text command 00 - End of text
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
	JMP label_01DFC6			;$01E377	|/

  .endOfText:					;```````````| Actual end of message.
	JSR label_01E795			;$01E37A	| ?????
	JSR label_01E756			;$01E37D	|
	INC $33C6					;$01E380	|
	JMP label_01E6F6			;$01E383	|



label_01E386:					;-----------| Text command 01 - Wait $XX frames
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
	MVN $7F7F					;$01E3AC	|
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
	STA $37						;$01E3D1	|
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
label_01E3FC:					;			|
	LDA $0065					;$01E3FC	|
	AND #$04					;$01E3FF	|
	BEQ label_01E407			;$01E401	|
	LDA $CB00F0,X				;$01E403	|
label_01E407:					;			|
	STA [$14],Y					;$01E407	|
	LDA $0065					;$01E409	|
	AND #$08					;$01E40C	|
	BEQ label_01E414			;$01E40E	|
	LDA $CB00F0,X				;$01E410	|
label_01E414:					;			|
	STA [$18],Y					;$01E414	|
	LDA $0065					;$01E416	|
	AND #$01					;$01E419	|
	BEQ label_01E425			;$01E41B	|
	LDA [$14],Y					;$01E41D	|
	ORA $CB00E8,X				;$01E41F	|
	STA [$14],Y					;$01E423	|
label_01E425:					;			|
	LDA $0065					;$01E425	|
	AND #$02					;$01E428	|
	BEQ label_01E434			;$01E42A	|
	LDA [$18],Y					;$01E42C	|
	ORA $CB00E8,X				;$01E42E	|
	STA [$18],Y					;$01E432	|
label_01E434:					;			|
	DEY							;$01E434	|
	DEY							;$01E435	|
	DEX							;$01E436	|
	BPL label_01E3FC			;$01E437	|
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
	STA $37						;$01E45D	|
	JSL WriteToDMABuffer		;$01E45F	|
	JSR label_01E756			;$01E463	|
	JSR label_01E737			;$01E466	|
	STZ $006F					;$01E469	|
	INC $0061					;$01E46C	|
	LDA #$0004					;$01E46F	|
	TSB $3072					;$01E472	|
	LDA #$8000					;$01E475	|
	TRB $0067					;$01E478	|
	JMP label_01DFC6			;$01E47B	|



label_01E47E:					;-----------| Text command 02 - New line
	JSR label_01E795			;$01E47E	|
	LDA $005B					;$01E481	|
	BEQ label_01E489			;$01E484	|
	JSR label_01E756			;$01E486	|
label_01E489:					;			|
	JSR label_01E737			;$01E489	|
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
	JMP label_01DFC6			;$01E4AE	|



label_01E4B1:					;-----------| Text command 03 - ???
	JSR label_01E795			;$01E4B1	|
	LDA $005B					;$01E4B4	|
	BEQ label_01E4BC			;$01E4B7	|
	JSR label_01E756			;$01E4B9	|
label_01E4BC:					;			|
	JSR label_01E737			;$01E4BC	|
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
	STA $4202					;$01E4D8	|
	LDA $0073					;$01E4DB	|
	ADC $4216					;$01E4DE	|
	CMP $0055					;$01E4E1	|
	BCC label_01E4EB			;$01E4E4	|
	SBC $0055					;$01E4E6	|
	INC A						;$01E4E9	|
	INC A						;$01E4EA	|
label_01E4EB:					;			|
	STA $0075					;$01E4EB	|
	JMP label_01DFC4			;$01E4EE	|



label_01E4F1:					;-----------| Text command 05 - Set character width. If argument is FF, uses a dynamic width?
	LDA [$45]					;$01E4F1	|
	AND #$00FF					;$01E4F3	|
	CMP #$00FF					;$01E4F6	|
	BNE label_01E4FE			;$01E4F9	|
	LDA #$FFFF					;$01E4FB	|
label_01E4FE:					;			|
	STA $0063					;$01E4FE	|
	JMP label_01DFC4			;$01E501	|



label_01E504:					;-----------| Text command 06 - ???
	LDA [$45]					;$01E504	|
	AND #$00FF					;$01E506	|
	STA $005B					;$01E509	|
	INC $45						;$01E50C	|
	LDA [$45]					;$01E50E	|
	AND #$00FF					;$01E510	|
	STA $005D					;$01E513	|
	JMP label_01DFC4			;$01E516	|



label_01E519:					;-----------| Text command 07 - ???
	LDA [$45]					;$01E519	|
	STA $005F					;$01E51B	|
	JMP label_01DFC2			;$01E51E	|



label_01E521:					;-----------| Text command 08 - Change text foreground/background color.
	SEP #$20					;$01E521	|
	LDA [$45]					;$01E523	|\ Write the next byte directly to the text FG/BG color.
	STA $0065					;$01E525	|/
	REP #$20					;$01E528	|
	JMP label_01DFC4			;$01E529	|



label_01E52D:					;-----------| Text command 09 - ???
	SEP #$20					;$01E52D	|
	LDA [$45]					;$01E52F	|
	ASL A						;$01E531	|
	STA $00						;$01E532	|
	LDA $0066					;$01E534	|
	AND #$80					;$01E537	|
	ORA $00						;$01E539	|
	STA $0066					;$01E53B	|
	REP #$20					;$01E53E	|
	JMP label_01DFC4			;$01E540	|



label_01E543:					;-----------| Text command 0A - ???
	LDA #$0080					;$01E543	|
	TRB $0066					;$01E546	|
	JMP label_01DFC6			;$01E549	|

label_01E54C:					;-----------| Text command 0B - ???
	LDA #$0080					;$01E54C	|
	TSB $0066					;$01E54F	|
	JMP label_01DFC6			;$01E552	|



label_01E555:					;-----------| Text command 0C - ???
	JSR label_01E795			;$01E555	|
	JSR label_01E756			;$01E558	|
	LDA [$45]					;$01E55B	|
	BIT $32C4					;$01E55D	|
	BNE label_01E56C			;$01E560	|
	BIT $32C6					;$01E562	|
	BNE label_01E56C			;$01E565	|
	DEC $45						;$01E567	|
	JMP label_01E6F6			;$01E569	|

label_01E56C:
	JMP label_01DFC2			;$01E56C	|



label_01E56F:					;-----------| Text command 0D - ???
	JSR label_01E795			;$01E56F	|
	JSR label_01E756			;$01E572	|
	LDA [$45]					;$01E575	|
	AND #$00FF					;$01E577	|
	STA $0061					;$01E57A	|
	INC $45						;$01E57D	|
	LDA #$8000					;$01E57F	|
	TRB $0067					;$01E582	|
	JMP label_01E6F6			;$01E585	|



label_01E588:					;-----------| Text command 0E - Use data from pointer $ZZYYXX
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
	JMP label_01DFC6			;$01E5AB	|



label_01E5AE:					;-----------| Text command 0F - ???
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
label_01E5EA:					;			|
	LDY #$FF					;$01E5EA	|
label_01E5EC:					;			|
	INY							;$01E5EC	|
	LDA $00						;$01E5ED	|
	SEC							;$01E5EF	|
	SBC.l DATA_01E659,X			;$01E5F0	|
	STA $00						;$01E5F4	|
	LDA $02						;$01E5F6	|
	SBC.l DATA_01E66B,X			;$01E5F8	|
	STA $02						;$01E5FC	|
	BCS label_01E5EC			;$01E5FE	|
	LDA $00						;$01E600	|
	ADC.l DATA_01E659,X			;$01E602	|
	STA $00						;$01E606	|
	LDA $02						;$01E608	|
	ADC.l DATA_01E66B,X			;$01E60A	|
	STA $02						;$01E60E	|
	TYA							;$01E610	|
	BNE label_01E640			;$01E611	|
	DEX							;$01E613	|
	DEX							;$01E614	|
	BPL label_01E5EA			;$01E615	|
	BRA label_01E64C			;$01E617	|

label_01E619:
	LDY #$FF					;$01E619	|
label_01E61B:					;			|
	INY							;$01E61B	|
	LDA $00						;$01E61C	|
	SEC							;$01E61E	|
	SBC.l DATA_01E659,X			;$01E61F	|
	STA $00						;$01E623	|
	LDA $02						;$01E625	|
	SBC.l DATA_01E66B,X			;$01E627	|
	STA $02						;$01E62B	|
	BCS label_01E61B			;$01E62D	|
	LDA $00						;$01E62F	|
	ADC.l DATA_01E659,X			;$01E631	|
	STA $00						;$01E635	|
	LDA $02						;$01E637	|
	ADC.l DATA_01E66B,X			;$01E639	|
	STA $02						;$01E63D	|
	TYA							;$01E63F	|
label_01E640:					;			|
	CLC							;$01E640	|
	ADC #$0021					;$01E641	|
	STA [$14]					;$01E644	|
	INC $14						;$01E646	|
	DEX							;$01E648	|
	DEX							;$01E649	|
	BPL label_01E619			;$01E64A	|
label_01E64C:					;			|
	REP #$10					;$01E64C	|
	LDA $00						;$01E64E	|
	CLC							;$01E650	|
	ADC #$0021					;$01E651	|
	STA [$14]					;$01E654	|
	JMP label_01DFC6			;$01E656	|

DATA_01E659:					;$01E659	| ???
	dw $000A,$0064,$03E8,$2710
	dw $86A0,$4240,$9680,$E100
	dw $CA00

DATA_01E66B:					;$01E66B	| ???
	dw $0000,$0000,$0000,$0000
	dw $0001,$000F,$0098,$05F5
	dw $3B9A



label_01E67D:					;-----------| Text command 10 - Write 8-bit value to RAM address.
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
	JMP label_01DFBE			;$01E691	| Increment text pointer by 4.



label_01E694:					;-----------| Text command 11 - Write 16-bit value to RAM address.
	LDA [$45]					;$01E694	|\ 
	STA $14						;$01E696	||
	LDY #$0002					;$01E698	|| Write the first 3 bytes to $14 as a 24-bit pointer.
	LDA [$45],Y					;$01E69B	||
	STA $16						;$01E69D	|/
	INY							;$01E69F	|\ 
	LDA [$45],Y					;$01E6A0	|| Write the next 2 bytes to that pointer.
	STA [$14]					;$01E6A2	|/
	JMP label_01DFBC			;$01E6A4	| Increment text pointer by 5.



label_01E6A7:					;-----------| Text command 12 - Enable text cursor
	LDA #$0001					;$01E6A7	|
	TSB $006B					;$01E6AA	|
	JMP label_01DFC6			;$01E6AD	|

label_01E6B0:					;-----------| Text command 13 - Disable text cursor
	LDA #$0001					;$01E6B0	|
	TRB $006B					;$01E6B3	|
	JMP label_01DFC6			;$01E6B6	|



label_01E6B9:					;-----------| Text command 14 - Enable secondary color
	LDA #$0001					;$01E6B9	|
	STA $006D					;$01E6BC	|
	JMP label_01DFC6			;$01E6BF	|

label_01E6C2:					;-----------| Text command 15 - Disable secondary color
	STZ $006D					;$01E6C2	|
	JMP label_01DFC6			;$01E6C5	|



label_01E6C8:					;-----------| Text command 04 - ???
	LDA [$45]					;$01E6C8	|
	AND #$00FF					;$01E6CA	|
	STA $0069					;$01E6CD	|
	JMP label_01DFC4			;$01E6D0	|

label_01E6D3:					;-----------| Text command 1D - ???
	LDA [$45]					;$01E6D3	|
	AND #$00FF					;$01E6D5	|
	STA $0067					;$01E6D8	|
	JMP label_01DFC4			;$01E6DB	|

label_01E6DE:					;-----------| Text command 1E - Play song?
	LDA [$45]					;$01E6DE	|
	AND #$00FF					;$01E6E0	|
	JSL label_00D003			;$01E6E3	|
	JMP label_01DFC4			;$01E6E7	|

label_01E6EA:					;-----------| Text command 1F - Play song?
	LDA [$45]					;$01E6EA	|
	AND #$00FF					;$01E6EC	|
	JSL label_00D12D			;$01E6EF	|
	JMP label_01DFC4			;$01E6F3	|



label_01E6F6:					;-----------| Text subroutine to ???
	LDA $006B					;$01E6F6	|
	BEQ label_01E736			;$01E6F9	|
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
	BEQ label_01E727			;$01E712	|
	LDA #$8000					;$01E714	|
	TSB $006B					;$01E717	|
	LDA $3094					;$01E71A	|
	AND #$0008					;$01E71D	|
	BEQ label_01E72F			;$01E720	|
	LDA #$2002					;$01E722	|
	BRA label_01E732			;$01E725	|

label_01E727:
	LDA $006B					;$01E727	|
	BPL label_01E736			;$01E72A	|
	TRB $006B					;$01E72C	|
label_01E72F:					;			|
	LDA #$2001					;$01E72F	|
label_01E732:					;			|
	JSL $00880C					;$01E732	|
label_01E736:					;			|
	RTL							;$01E736	|





label_01E737:					;-----------| Text subroutine to initialize the VWF text buffer with its background color..
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
	MVN $7F7F					;$01E751	|/
	PLB							;$01E754	|
	RTS							;$01E755	|



label_01E756:					;-----------| Text subroutine to ???
	LDA $0071					;$01E756	|
	BEQ label_01E794			;$01E759	|
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
	STA $37						;$01E778	|/
label_01E77A:					;			|
	JSL WriteToDMABuffer		;$01E77A	|\ 
	LDA $34						;$01E77E	||
	CLC							;$01E780	||
	ADC #$0040					;$01E781	||
	STA $34						;$01E784	|| Perform each DMA, incrementing the source by 0x40 each time and destination by 0x20.
	LDA $37						;$01E786	||
	ADC #$0020					;$01E788	||
	STA $37						;$01E78B	||
	DEC $2E						;$01E78D	||
	BNE label_01E77A			;$01E78F	|/
	STZ $0071					;$01E791	|
label_01E794:					;			|
	RTS							;$01E794	|



label_01E795:					;-----------| Text subroutine to ???
	LDA $006F					;$01E795	|
	BNE label_01E79B			;$01E798	|
	RTS							;$01E79A	|

label_01E79B:
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
	MVN $7F7E					;$01E7C4	|/
	PLB							;$01E7C7	|
	LDA $34						;$01E7C8	|\ 
	CLC							;$01E7CA	||
	ADC $00						;$01E7CB	||
	TAY							;$01E7CD	|| Transfer more data from $7F6770 to the decompressed data region, immediately following the first block.
	LDA $00						;$01E7CE	||
	LDX #$6770					;$01E7D0	||
	PHB							;$01E7D3	||
	MVN $7F7E					;$01E7D4	|/
	PLB							;$01E7D7	|
	LDA $0075					;$01E7D8	|\ 
	ASL A						;$01E7DB	||
	ASL A						;$01E7DC	|| Set the DMA destionation based on $0075 * 8 + $004F.
	ASL A						;$01E7DD	||
	ADC $004F					;$01E7DE	||
	STA $37						;$01E7E1	|/
	JSL WriteToDMABuffer		;$01E7E3	|] Execute the DMA.
	LDA $0059					;$01E7E7	|\ 
	AND #$3FF8					;$01E7EA	||
	ASL A						;$01E7ED	||
	ASL A						;$01E7EE	||
	ASL A						;$01E7EF	|| $14 = 24-bit pointer to something at $7F6970 indexed by $0059
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
label_01E809:					;			||
	STA [$14],Y					;$01E809	||
	INC A						;$01E80B	||
	INY							;$01E80C	||
	INY							;$01E80D	||
	CPY $00						;$01E80E	||
	BCC label_01E809			;$01E810	|/
	TAY							;$01E812	|\ 
	LDA $14						;$01E813	||
	CLC							;$01E815	||
	ADC #$0040					;$01E816	||
	STA $14						;$01E819	||
	TYA							;$01E81B	||
	LDY #$0000					;$01E81C	||
label_01E81F:					;			||
	STA [$14],Y					;$01E81F	||
	INC A						;$01E821	||
	INY							;$01E822	||
	INY							;$01E823	||
	CPY $00						;$01E824	||
	BCC label_01E81F			;$01E826	|/
	STZ $006F					;$01E828	|
	INC $0071					;$01E82B	|
	RTS							;$01E82E	|



label_01E82F:					;-----------|
	LDA $0053					;$01E82F	|
	STA $2E						;$01E832	|
	LDA #$000C					;$01E834	|\ 
	STA $31						;$01E837	||
	LDA $0051					;$01E839	||
	STA $32						;$01E83C	|| Set up a 1-byte fixed ($2118) DMA
	LDA #$E860					;$01E83E	||  from $01E860 to the destination in $4D
	STA $34						;$01E841	||  with a size from $51.
	LDA #$0001					;$01E843	||
	STA $36						;$01E846	||
	LDA $004D					;$01E848	||
	STA $37						;$01E84B	|/
label_01E84D:					;			|
	JSL WriteToDMABuffer		;$01E84D	|\ 
	LDA $37						;$01E851	||
	ADC #$0020					;$01E853	||
	STA $37						;$01E856	||
	DEC $2E						;$01E858	||
	BNE label_01E84D			;$01E85A	|/
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





;///////////////////////////////////////////////////////////////////////////////////
;/////   Rest of this bank handles the status bar.   ///////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////

label_01E921:					;-----------| Routine to run setup for the status bar.
	JSR label_01E925			;$01E921	|
	RTL							;$01E924	|

label_01E925:
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
	BNE label_01E965			;$01E955	||
	LDA $007B2D					;$01E957	||
	BNE label_01E965			;$01E95B	||
	LDA #$00E7					;$01E95D	|| Get the status bar GFX for the current subgame
	LDX #$A1F2					;$01E960	||  from the pointer table at $01FDA7,
	BRA label_01E970			;$01E963	|| unless in the solo mode of Gourmet Race,
label_01E965:					;			||  in which case just use $E7A1F2.
	LDA.l DATA_01FDA7+2,X		;$01E965	||
	TAY							;$01E969	|| Decompress that data to $7E2000.
	LDA.l DATA_01FDA7,X			;$01E96A	||
	TAX							;$01E96E	||
	TYA							;$01E96F	|| 
label_01E970:					;			|| 
	LDY #$2000					;$01E970	||
	JSL DecompressData			;$01E973	|/
	PLB							;$01E977	|
	LDA #$FF54					;$01E978	|\ Load the DMA table at $01FF54.
	LDX #$0001					;$01E97B	|| Uploads the data decompressed above, and clears out 0x280 bytes just before it.
	JSL LoadDMATable			;$01E97E	|/
	LDA #$EA1F					;$01E982	|\ 
	STA $309B					;$01E985	||
	SEP #$30					;$01E988	|| Set the IRQ routine to $01EA1F.
	LDA #$01					;$01E98A	||
	STA $309D					;$01E98C	|/
	LDA #$01					;$01E98F	|\ Enable HDMA on channel 1.
	TSB $3092					;$01E991	|/
	LDX #$A8					;$01E994	|\\ Scanline to fire IRQ at.
	STX $4209					;$01E996	|/
	LDA #$20					;$01E999	|\ Enable IRQ.
	TSB $3091					;$01E99B	|/
	REP #$30					;$01E99E	|
	STZ $7A19					;$01E9A0	|
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
	STA $7A1B					;$01E9C1	|
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





label_01EA1F:					;-----------| IRQ routine for the in-game HUD.
	SEP #$20					;$01EA1F	|
	PHA							;$01EA21	|
	PHX							;$01EA22	|
	LDX #$151F					;$01EA23	|\ 
	STX $4322					;$01EA26	|| Run a DMA on channel 2 for 0xFC bytes (0x7E colors) from $151F.
	LDX #$00FC					;$01EA29	||  (channel 2 is fixed for writes to CGRAM starting at color $04)
	STX $4325					;$01EA2C	|| Actually, it should probably only be 0xF8 bytes; the remaining two end up on $80/$81...
	LDA #$04					;$01EA2F	||
	STA $420B					;$01EA31	|/
	LDA $7A28					;$01EA34	|\ Set main screen designation.
	STA $212C					;$01EA37	|/
	LDA #$50					;$01EA3A	|\ Set BG2 GFX address to $5000.
	STA $210B					;$01EA3C	|/
	LDA #$58					;$01EA3F	|\ Set BG2 tilemap address to $5800 and size to 256x256.
	STA $2108					;$01EA41	|/
	STZ $210F					;$01EA44	|\ Clear horizontal scroll.
	STZ $210F					;$01EA47	|/
	LDA #$56					;$01EA4A	|\ 
	STA $2110					;$01EA4C	|| Set vertical scroll.
	STZ $2110					;$01EA4F	|/
	STZ $2106					;$01EA52	|\ Disable mosaic and color math effects.
	STZ $2131					;$01EA55	|/
	STZ $212D					;$01EA58	|\ Turn off subscreen.
	STZ $212E					;$01EA5B	|/
	LDA #$09					;$01EA5E	|\ Set as mode 1 with BG3 priority.
	STA $2105					;$01EA60	|/
	PLX							;$01EA63	|
	PLA							;$01EA64	|
	JML $0084BB					;$01EA65	| Return IRQ.





label_01EA69:					;-----------| Status bar handler routine.
	JSR label_01EA6D			;$01EA69	|
	RTL							;$01EA6C	|

label_01EA6D:
	LDA $7A1B					;$01EA6D	|\ 
	BPL label_01EA75			;$01EA70	|| If a boss isn't active, ???
	STZ $7A1F					;$01EA72	|/
label_01EA75:					;			|
	LDA $32EA					;$01EA75	|\ 
	ASL A						;$01EA78	|| Jump to the appropriate game routine.
	TAX							;$01EA79	||
	JMP (label_01EA7D,X)		;$01EA7A	|/

label_01EA7D:					;$01EA7D	| Subgame status bar routine pointers.
	dw label_01EA93				; 0 - Spring Breeze
	dw label_01EBF1				; 1 - Dyna Blade
	dw label_01ED69				; 2 - Gourmet Race
	dw label_01F008				; 3 - The Great Cave Offensive
	dw label_01F15D				; 4 - Revenge of Meta-Knight
	dw label_01F436				; 5 - Milky Way Wishes
	dw label_01F5C9				; 6 - The Arena
	dw label_01F5C9				; 7 - Sound Test
	dw label_01F5C9				; 8 - Guide / Minigame
	dw label_01F5C9				; 9 - Unused
	dw label_01F5C9				; A - Unused





label_01EA93:					;-----------| Status bar routine for Spring Breeze.
	JSR label_01F81F			;$01EA93	|
	JMP (label_01EA99,X)		;$01EA96	|

label_01EA99:					;$01EA99	| Pointers to status bar routines for Spring Breeze.
	dw label_01EAA1				; 0 - No partner, no boss
	dw label_01EB29				; 1 - Has partner, no boss
	dw label_01EAE5				; 2 - No partner, has boss
	dw label_01EB84				; 3 - Has partner, has boss



label_01EAA1:					;-----------| Spring Breeze status bar routine 0 - No partner, no boss
	CPX $00B3					;$01EAA1	|\ Skip if the status bar has already been initialized.
	BEQ label_01EAC2			;$01EAA4	|/
	STX $00B3					;$01EAA6	|
	LDA #$EBDF					;$01EAA9	|\ Load the DMA table at $01EBDF.
	LDX #$0001					;$01EAAC	|| Presumably, this loads the basic tilemap.
	JSL LoadDMATable			;$01EAAF	|/
	LDA #$00EB					;$01EAB3	|\ 
	LDX #$110D					;$01EAB6	|| Load the base tilemap from $EB110D.
	JSR LoadStatusBarBase		;$01EAB9	|/
	LDA #$8000					;$01EABC	|
	TSB $00B5					;$01EABF	|
label_01EAC2:					;			|
	LDX #$166E					;$01EAC2	|\ Write the score.
	JSR label_01F947			;$01EAC5	|/
	LDX #$16AF					;$01EAC8	|\ Write the life count.
	JSR label_01F8B7			;$01EACB	|/
	JSR label_01FBD0			;$01EACE	|
	BCC label_01EADF			;$01EAD1	|
	LDX #$165E					;$01EAD3	|\ 
	JSR WriteHPBar				;$01EAD6	|| Update Kirby's HP bar.
	LDX #$167E					;$01EAD9	||
	JSR WriteHPBar				;$01EADC	|/
label_01EADF:					;			|
	JSR label_01FA25			;$01EADF	|
	JMP label_01F706			;$01EAE2	|



label_01EAE5:					;-----------| Spring Breeze status bar routine 2 - No partner, has boss
	CPX $00B3					;$01EAE5	|\ Skip if the status bar has already been initialized.
	BEQ label_01EB06			;$01EAE8	|/
	STX $00B3					;$01EAEA	|
	LDA #$EBE8					;$01EAED	|\ 
	LDX #$0001					;$01EAF0	|| Load the DMA table at $01EBE8.
	JSL LoadDMATable			;$01EAF3	|/
	LDA #$00EB					;$01EAF7	|\ 
	LDX #$110D					;$01EAFA	|| Load the base tilemap from $EB110D.
	JSR LoadStatusBarBase		;$01EAFD	|/
	LDA #$8000					;$01EB00	|
	TSB $7A1F					;$01EB03	|
label_01EB06:					;			|
	LDX #$166E					;$01EB06	|\ Write the boss's HP bar.
	JSR label_01F87B			;$01EB09	|/
	LDX #$16B0					;$01EB0C	|\ Write the life count.
	JSR label_01F8B7			;$01EB0F	|/
	JSR label_01FBD0			;$01EB12	|
	BCC label_01EB23			;$01EB15	|
	LDX #$165E					;$01EB17	|\ 
	JSR WriteHPBar				;$01EB1A	|| Update Kirby's HP bar.
	LDX #$167E					;$01EB1D	||
	JSR WriteHPBar				;$01EB20	|/



label_01EB29:					;-----------| Spring Breeze status bar routine 1 - Has partner, no boss
	CPX $00B3					;$01EB29	|\ Skip if the status bar has already been initialized.
	BEQ label_01EB4D			;$01EB2C	|/
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
label_01EB4D:					;			|
	LDX #$16C9					;$01EB4D	|\ Write the score.
	JSR label_01F947			;$01EB50	|/
	LDX #$16C0					;$01EB53	|\ Write the life count.
	JSR label_01F8B7			;$01EB56	|/
	JSR label_01FBD0			;$01EB59	|
	BCC label_01EB6A			;$01EB5C	|
	LDX #$165E					;$01EB5E	|\ 
	JSR WriteHPBar				;$01EB61	|| Update Kirby's HP bar.
	LDX #$167E					;$01EB64	||
	JSR WriteHPBar				;$01EB67	|/
label_01EB6A:					;			|
	JSR label_01FC62			;$01EB6A	|
	BCC label_01EB7B			;$01EB6D	|
	LDX #$1669					;$01EB6F	|\ 
	JSR WriteHPBar2				;$01EB72	|| Update the partner's HP bar.
	LDX #$1689					;$01EB75	||
	JSR WriteHPBar2				;$01EB78	|/
label_01EB7B:					;			|
	JSR label_01FA25			;$01EB7B	|
	JSR label_01FAF3			;$01EB7E	|
	JMP label_01F706			;$01EB81	|



label_01EB84:					;-----------| Spring Breeze status bar routine 3 - Has partner, has boss
	CPX $00B3					;$01EB84	|\ Skip if the status bar has already been initialized.
	BEQ label_01EBA8			;$01EB87	|/
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
label_01EBA8:					;			|
	LDX #$16C9					;$01EBA8	|\ Write the boss's HP bar.
	JSR label_01F87B			;$01EBAB	|/
	LDX #$16C0					;$01EBAE	|\ Write the life count.
	JSR label_01F8B7			;$01EBB1	|/
	JSR label_01FBD0			;$01EBB4	|
	BCC label_01EBC5			;$01EBB7	|
	LDX #$165E					;$01EBB9	|\ 
	JSR WriteHPBar				;$01EBBC	|| Update Kirby's HP bar.
	LDX #$167E					;$01EBBF	||
	JSR WriteHPBar				;$01EBC2	|/
label_01EBC5:					;			|
	JSR label_01FC62			;$01EBC5	|
	BCC label_01EBD6			;$01EBC8	|
	LDX #$1669					;$01EBCA	|\ 
	JSR WriteHPBar2				;$01EBCD	|| Update the partner's HP bar.
	LDX #$1689					;$01EBD0	||
	JSR WriteHPBar2				;$01EBD3	|/
label_01EBD6:					;			|
	JSR label_01FA25			;$01EBD6	|
	JSR label_01FAF3			;$01EBD9	|
	JMP label_01F706			;$01EBDC	|


label_01EBDF:					;$01EBDF	| DMA table used by the above routines.
	db $03 : dw $00A0 : dl $ED6540 : dw $5E40		; 2-byte DMA; 0xA0 bytes from $ED6540 to $5E40.
	db $FF

label_01EBE8:					;$01EBE8	| DMA table used by the above routines.
	db $03 : dw $00A0 : dl $ED64A0 : dw $5E40		; 2-byte DMA; 0xA0 bytes from $ED65A0 to $5E40.
	db $FF





label_01EBF1:					;-----------| Status bar routine for Dyna Blade.
	JSR label_01F81F			;$01EBF1	|\ Jump to the appropriate status bar routine.
	JMP (label_01EBF7,X)		;$01EBF4	|/

label_01EBF7:					;$01EBF7	| Pointers to status bar routines for Dyna Blade.
	dw label_01EBFF				; 0 - No partner, no boss
	dw label_01EC8F				; 1 - Has partner, no boss
	dw label_01EC47				; 2 - No partner, has boss
	dw label_01ECE8				; 3 - Has partner, has boss



label_01EBFF:					;-----------| Dyna Blade status bar routine 0 - No partner, no boss
	CPX $00B3					;$01EBFF	|\ Skip if the status bar has already been initialized.
	BEQ label_01EC2A			;$01EC02	|/
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
label_01EC2A:					;			|
	LDX #$166B					;$01EC2A	|\ Write the score.
	JSR label_01F947			;$01EC2D	|/
	LDX #$16AB					;$01EC30	|\ Write the life count.
	JSR label_01F8B7			;$01EC33	|/
	JSR label_01FBD0			;$01EC36	|
	BCC label_01EC41			;$01EC39	|
	LDX #$165E					;$01EC3B	|\ Update Kirby's HP bar.
	JSR WriteHPBar				;$01EC3E	|/
label_01EC41:					;			|
	JSR label_01FA25			;$01EC41	|
	JMP label_01F706			;$01EC44	|



label_01EC47:					;-----------| Dyna Blade status bar routine 2 - No partner, has boss
	CPX $00B3					;$01EC47	|\ Skip if the status bar has already been initialized.
	BEQ label_01EC72			;$01EC4A	|/
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
label_01EC72:					;			|
	LDX #$166B					;$01EC72	|\ Write the boss's HP bar.
	JSR label_01F87B			;$01EC75	|/
	LDX #$16AB					;$01EC78	|\ Write the life count.
	JSR label_01F8B7			;$01EC7B	|/
	JSR label_01FBD0			;$01EC7E	|
	BCC label_01EC89			;$01EC81	|
	LDX #$165E					;$01EC83	|\ Update Kirby's HP bar.
	JSR WriteHPBar				;$01EC86	|/
label_01EC89:					;			|
	JSR label_01FA25			;$01EC89	|
	JMP label_01F706			;$01EC8C	|



label_01EC8F:					;-----------| Dyna Blade status bar routine 1 - Has partner, no boss
	CPX $00B3					;$01EC8F	|\ Skip if the status bar has already been initialized.
	BEQ label_01ECBD			;$01EC92	|/
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
label_01ECBD:					;			|
	LDX #$16AF					;$01ECBD	|\ Write the score.
	JSR label_01F947			;$01ECC0	|/
	LDX #$16A1					;$01ECC3	|\ Write the life count.
	JSR label_01F8B7			;$01ECC6	|/
	JSR label_01FBD0			;$01ECC9	|
	BCC label_01ECD4			;$01ECCC	|
	LDX #$165E					;$01ECCE	|\ Update Kirby's HP bar.
	JSR WriteHPBar				;$01ECD1	|/
label_01ECD4:					;			|
	JSR label_01FC62			;$01ECD4	|
	BCC label_01ECDF			;$01ECD7	|
	LDX #$166E					;$01ECD9	|\ Update the partner's HP bar.
	JSR WriteHPBar				;$01ECDC	|/
label_01ECDF:					;			|
	JSR label_01FA25			;$01ECDF	|
	JSR label_01FAF3			;$01ECE2	|
	JMP label_01F706			;$01ECE5	|



label_01ECE8:					;-----------| Dyna Blade status bar routine 3 - Has partner, has boss
	CPX $00B3					;$01ECE8	|\ Skip if the status bar has already been initialized.
	BEQ label_01ED16			;$01ECEB	|/
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
label_01ED16:					;			|
	LDX #$16AF					;$01ED16	|\ Write the boss's HP bar.
	JSR label_01F87B			;$01ED19	|/
	LDX #$16A1					;$01ED1C	|\ Write the life count.
	JSR label_01F8B7			;$01ED1F	|/
	JSR label_01FBD0			;$01ED22	|
	BCC label_01ED2D			;$01ED25	|
	LDX #$165E					;$01ED27	|\ Update Kirby's HP bar.
	JSR WriteHPBar				;$01ED2A	|/
label_01ED2D:					;			|
	JSR label_01FC62			;$01ED2D	|
	BCC label_01ED38			;$01ED30	|
	LDX #$166E					;$01ED32	|\ Update the partner's HP bar.
	JSR WriteHPBar				;$01ED35	|/
label_01ED38:					;			|
	JSR label_01FA25			;$01ED38	|
	JSR label_01FAF3			;$01ED3B	|
	JMP label_01F706			;$01ED3E	|


label_01ED41:					;$01ED41	| DMA table used by the above routines.
	db $03 : dw $0080 : dl $EC48EA : dw $5E30		; 2-byte DMA; 0x80 bytes from $EC48EA to $5E30.
	db $FF

label_01ED4A:					;$01ED4A	| DMA table used by the above routines.
	db $03 : dw $0080 : dl $EC482A : dw $5E30		; 2-byte DMA; 0x80 bytes from $EC482A to $5E30.
	db $FF

label_01ED53:					;$01ED53	| DMA table used by the above routines.
	db $03 : dw $0040 : dl $EC47EA : dw $5E10		; 2-byte DMA; 0x40 bytes from $EC47EA to $5E10.
	db $FF

label_01ED5C:					;$01ED5C	| DMA table used by the above routines.
	db $03 : dw $0040 : dl $EC48AA : dw $5E10		; 2-byte DMA; 0x40 bytes from $EC48AA to $5E10.
	db $FF





label_01ED69:					;-----------| Status bar routine for Gourmet Race.
	LDA $00B3					;$01ED69	|
	LDY $7B2D					;$01ED6C	|
	BNE label_01ED74			;$01ED6F	|
	JMP label_01EEAF			;$01ED71	|

label_01ED74:
	LDY $6240					;$01ED74	|
	BPL label_01EDBD			;$01ED77	|
	CMP #$0000					;$01ED79	|
	BEQ label_01ED9A			;$01ED7C	|
	LDA #$00EA					;$01ED7E	|\ 
	LDX #$ECA5					;$01ED81	|| Load the base tilemap from $EAECA5.
	JSR LoadStatusBarBase		;$01ED84	|/
	LDA #$DD82					;$01ED87	|\ 
	LDX #$00EF					;$01ED8A	|| Transfer 15 colors from $EFDD82 to $41-$4F.
	LDY #$410F					;$01ED8D	||
	JSL WriteStatusPal			;$01ED90	|/
	LDA #$FFFF					;$01ED94	|
	STA $00C1					;$01ED97	|
label_01ED9A:					;			|
	LDA $7A25					;$01ED9A	|
	CMP $00C1					;$01ED9D	|
	BEQ label_01EDB2			;$01EDA0	|
	STA $00C1					;$01EDA2	|
	ASL A						;$01EDA5	|
	TAX							;$01EDA6	|
	LDA.l DATA_01EFE7,X			;$01EDA7	|\ 
	LDX #$0001					;$01EDAB	|| Load a specified DMA table.
	JSL LoadDMATable			;$01EDAE	|/
label_01EDB2:					;			|
	LDA #$0000					;$01EDB2	|
	LDY #$16C5					;$01EDB5	|
	LDX #$58AE					;$01EDB8	|
	BRA label_01EDD4			;$01EDBB	|

label_01EDBD:
	CMP #$0001					;$01EDBD	|
	BEQ label_01EDCE			;$01EDC0	|
	LDA #$00EA					;$01EDC2	|\ 
	LDX #$FB31					;$01EDC5	|| Load the base tilemap from $EAFB31.
	JSR LoadStatusBarBase		;$01EDC8	|/
	LDA #$0001					;$01EDCB	|
label_01EDCE:					;			|
	LDY #$16CA					;$01EDCE	|
	LDX #$58B3					;$01EDD1	|
label_01EDD4:					;			|
	STA $00B3					;$01EDD4	|
	JSR label_01EE5C			;$01EDD7	|
	LDA #$0009					;$01EDDA	|
	STA $31						;$01EDDD	|
	LDA #$0008					;$01EDDF	|
	STA $32						;$01EDE2	|
	STY $34						;$01EDE4	|
	LDA #$0000					;$01EDE6	|
	STA $36						;$01EDE9	|
	STX $37						;$01EDEB	|
	SEP #$30					;$01EDED	|
	LDA #$F2					;$01EDEF	|
	LDY #$02					;$01EDF1	|
	STA [$34],Y					;$01EDF3	|
	LDY #$05					;$01EDF5	|
	STA [$34],Y					;$01EDF7	|
	LDA $7A2F					;$01EDF9	|
	LDY #$00					;$01EDFC	|
	JSR label_01EF80			;$01EDFE	|
	LDA $7A2E					;$01EE01	|
	LDY #$03					;$01EE04	|
	JSR label_01EF80			;$01EE06	|
	LDA $7A2D					;$01EE09	|
	LDY #$06					;$01EE0C	|
	JSR label_01EF80			;$01EE0E	|
	REP #$30					;$01EE11	|
	JSL WriteToDMABuffer		;$01EE13	|
	LDA $7A29					;$01EE17	|
	CMP #$0063					;$01EE1A	|
	BCC label_01EE25			;$01EE1D	|
	LDA #$0063					;$01EE1F	|
	STA $7A29					;$01EE22	|
label_01EE25:					;			|
	CMP $00BB					;$01EE25	|
	BEQ label_01EE35			;$01EE28	|
	LDX #$5D00					;$01EE2A	|
	JSR label_01EF93			;$01EE2D	|
	BCC label_01EE35			;$01EE30	|
	STA $00BB					;$01EE32	|
label_01EE35:					;			|
	LDA $7A2B					;$01EE35	|
	CMP #$0063					;$01EE38	|
	BCC label_01EE43			;$01EE3B	|
	LDA #$0063					;$01EE3D	|
	STA $7A29					;$01EE40	|
label_01EE43:					;			|
	CMP $00BD					;$01EE43	|
	BEQ label_01EE53			;$01EE46	|
	LDX #$5D80					;$01EE48	|
	JSR label_01EF93			;$01EE4B	|
	BCC label_01EE53			;$01EE4E	|
	STA $00BD					;$01EE50	|
label_01EE53:					;			|
	JSR label_01FA25			;$01EE53	|
	JSR label_01FAF3			;$01EE56	|
	JMP label_01F706			;$01EE59	|



label_01EE5C:					;-----------| Status bar subroutine.
	LDA $7A19					;$01EE5C	|
	BEQ label_01EEAE			;$01EE5F	|
	SEP #$20					;$01EE61	|
	LDA $7A30					;$01EE63	|
	INC A						;$01EE66	|
	CMP #$03					;$01EE67	|
	BCC label_01EE6D			;$01EE69	|
	LDA #$00					;$01EE6B	|
label_01EE6D:					;			|
	STA $7A30					;$01EE6D	|
	CMP #$00					;$01EE70	|
	BEQ label_01EE76			;$01EE72	|
	LDA #$01					;$01EE74	|
label_01EE76:					;			|
	SEC							;$01EE76	|
	ADC $7A2D					;$01EE77	|
	CMP #$64					;$01EE7A	|
	BCC label_01EE92			;$01EE7C	|
	SBC #$64					;$01EE7E	|
	PHA							;$01EE80	|
	LDA $7A2E					;$01EE81	|
	INC A						;$01EE84	|
	CMP #$3C					;$01EE85	|
	BCC label_01EE8E			;$01EE87	|
	INC $7A2F					;$01EE89	|
	LDA #$00					;$01EE8C	|
label_01EE8E:					;			|
	STA $7A2E					;$01EE8E	|
	PLA							;$01EE91	|
label_01EE92:					;			|
	STA $7A2D					;$01EE92	|
	LDA $7A2F					;$01EE95	|
	CMP #$64					;$01EE98	|
	BCC label_01EEAC			;$01EE9A	|
	LDA #$63					;$01EE9C	|
	STA $7A2D					;$01EE9E	|
	STA $7A2F					;$01EEA1	|
	LDA #$3B					;$01EEA4	|
	STA $7A2E					;$01EEA6	|
	STZ $7A19					;$01EEA9	|
label_01EEAC:					;			|
	REP #$20					;$01EEAC	|
label_01EEAE:					;			|
	RTS							;$01EEAE	|


label_01EEAF:					;-----------| Gourmet Race solo race (shows timer instead of scores).
	CMP #$0002					;$01EEAF	|
	BEQ label_01EEC6			;$01EEB2	|
	LDA #$00EC					;$01EEB4	|\ 
	LDX #$31E6					;$01EEB7	|| Load the base tilemap from $EC31E6.
	JSR LoadStatusBarBase		;$01EEBA	|/
	LDA #$0002					;$01EEBD	|
	STA $00B3					;$01EEC0	|
	JSR label_01EF32			;$01EEC3	|
label_01EEC6:					;			|
	JSR label_01EE5C			;$01EEC6	|
	JSR label_01EED2			;$01EEC9	| Upload the timer's tiles.
	JSR label_01FA25			;$01EECC	|
	JMP label_01F706			;$01EECF	|


label_01EED2:					;-----------| Gourmet Race subroutine to upload the timer's tiles in solo mode.
	LDX #$0000					;$01EED2	|
	LDA $7A2F					;$01EED5	|\ Upload the minutes...
	JSR label_01EEE4			;$01EED8	|/
	LDA $7A2E					;$01EEDB	|\ And the seconds...
	JSR label_01EEE4			;$01EEDE	|/
	LDA $7A2D					;$01EEE1	| And finally the milliseconds.
label_01EEE4:					;			|
	SEP #$30					;$01EEE4	|\ 
	LDY #$FF					;$01EEE6	||
label_01EEE8:					;			||
	INY							;$01EEE8	|| Hex->Dec conversion.
	SEC							;$01EEE9	|| Tens digit stored in Y, ones in A.
	SBC #$0A					;$01EEEA	||
	BCS label_01EEE8			;$01EEEC	||
	ADC #$0A					;$01EEEE	||
	REP #$30					;$01EEF0	||
	AND #$00FF					;$01EEF2	|/
	PHA							;$01EEF5	|
	TYA							;$01EEF6	|\ Draw tens digit...
	JSR label_01EEFB			;$01EEF7	|/
	PLA							;$01EEFA	| Then ones.
label_01EEFB:					;			|
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
	STA $37						;$01EF1B	||
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



label_01EF32:					;-----------| Gourmet Race subroutine.
	LDA #$0009					;$01EF32	|\ 
	STA $31						;$01EF35	||
	LDA #$0008					;$01EF37	||
	STA $32						;$01EF3A	|| Write a normal 1-byte $2118 DMA
	LDA #$16C4					;$01EF3C	||  for 8 bytes from $0016C4
	STA $34						;$01EF3F	||  to VRAM address $58AD.
	LDA #$0000					;$01EF41	||
	STA $36						;$01EF44	||
	LDA #$58AD					;$01EF46	||
	STA $37						;$01EF49	|/
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
	JSR label_01EF80			;$01EF6A	|
	PLA							;$01EF6D	|
	LDY #$03					;$01EF6E	|
	JSR label_01EF80			;$01EF70	|
	PLA							;$01EF73	|
	LDY #$06					;$01EF74	|
	JSR label_01EF80			;$01EF76	|
	REP #$30					;$01EF79	|
	JSL WriteToDMABuffer		;$01EF7B	|
	RTS							;$01EF7F	|


label_01EF80:
	LDX #$B5					;$01EF80	|
	SEC							;$01EF82	|
label_01EF83:					;			|
	INX							;$01EF83	|
	SBC #$0A					;$01EF84	|
	BCS label_01EF83			;$01EF86	|
	PHA							;$01EF88	|
	TXA							;$01EF89	|
	STA [$34],Y					;$01EF8A	|
	INY							;$01EF8C	|
	PLA							;$01EF8D	|
	ADC #$C0					;$01EF8E	|
	STA [$34],Y					;$01EF90	|
	RTS							;$01EF92	|


label_01EF93:
	TAY							;$01EF93	|
	LDA $3019					;$01EF94	|
	CLC							;$01EF97	|
	ADC #$014C					;$01EF98	|
	CMP $301B					;$01EF9B	|
	BCC label_01EFA2			;$01EF9E	|
	CLC							;$01EFA0	|
	RTS							;$01EFA1	|

label_01EFA2:
	TYA							;$01EFA2	|
	PHA							;$01EFA3	|
	LDY #$FFFF					;$01EFA4	|
	SEC							;$01EFA7	|
label_01EFA8:					;			|
	INY							;$01EFA8	|
	SBC #$000A					;$01EFA9	|
	BCS label_01EFA8			;$01EFAC	|
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
	STX $37						;$01EFCA	|
	JSL WriteToDMABuffer		;$01EFCC	|
	LDA $2E						;$01EFD0	|
	XBA							;$01EFD2	|
	LSR A						;$01EFD3	|
	ADC #$62D2					;$01EFD4	|
	STA $34						;$01EFD7	|
	LDA $37						;$01EFD9	|
	ADC #$0040					;$01EFDB	|
	STA $37						;$01EFDE	|
	JSL WriteToDMABuffer		;$01EFE0	|
	PLA							;$01EFE4	|
	SEC							;$01EFE5	|
	RTS							;$01EFE6	|


DATA_01EFE7:					;$01EFE7	| Pointers to some DMA tables in bank $01 for Gourmet Race.
	dw label_01EFED
	dw label_01EFF6
	dw label_01EFFF

DATA_01EFED:					;$01EFED	| DMA table used by the above routines.
	db $83 : dw $0280 : dl $CDDDEE : dw $5A20		; 2-byte DMA to decompress and transfer 0x280 bytes from $CDDDEE to $5A20.
	db $FF

DATA_01EFF6:					;$01EFED	| DMA table used by the above routines.
	db $83 : dw $0280 : dl $CDE051 : dw $5A20		; 2-byte DMA to decompress and transfer 0x280 bytes from $CDE051 to $5A20.
	db $FF

DATA_01EFFF:					;$01EFED	| DMA table used by the above routines.
	db $83 : dw $0280 : dl $CDE2C5 : dw $5A20		; 2-byte DMA to decompress and transfer 0x280 bytes from $CDE2C5 to $5A20.
	db $FF





label_01F008:					;-----------| Status bar routine for The Great Cave Offensive.
	LDA $7B0F					;$01F008	|
	STA $7372					;$01F00B	|
	LDA $7B11					;$01F00E	|
	STA $7374					;$01F011	|
	LDA #$0000					;$01F014	|\ 
	LDY $6240					;$01F017	||
	BMI label_01F01F			;$01F01A	||
	ORA #$0004					;$01F01C	|| Get the layout to use.
label_01F01F:					;			|| Start with X = 0;
	LDY $7A1B					;$01F01F	||  If a partner is active, add 4.
	BMI label_01F027			;$01F022	||  If a boss is active, add 2.
	ORA #$0002					;$01F024	||
label_01F027:					;			||
	TAX							;$01F027	|/
	JMP (label_01F02B,X)		;$01F028	|

label_01F02B:					;$01F02B	| Pointers to status bar routines for The Great Cave Offensive.
	dw label_01F033				; 0 - No partner, no boss
	dw label_01F06B				; 1 - No partner, has boss
	dw label_01F0AE				; 2 - Has partner, no boss
	dw label_01F0FA				; 3 - Has partner, has boss



label_01F033:					;-----------| The Great Cave Offensive status bar routine 0 - No partner, no boss.
	CPX $00B3					;$01F033	|\ Skip if the status bar has already been initialized.
	BEQ label_01F04E			;$01F036	|/
	STX $00B3					;$01F038	|
	LDA #$F14B					;$01F03B	|\ 
	LDX #$0001					;$01F03E	|| Load the DMA table at $01F14B.
	JSL LoadDMATable			;$01F041	|/
	LDA #$00EA					;$01F045	|\ 
	LDX #$658C					;$01F048	|| Load the base tilemap from $EA658C.
	JSR LoadStatusBarBase		;$01F04B	|/
label_01F04E:					;			|
	LDX #$165A					;$01F04E	|\ Write the score/money.
	JSR label_01F8EE			;$01F051	|/
	LDX #$16BD					;$01F054	|\ Write the life count.
	JSR label_01F8B7			;$01F057	|/
	JSR label_01FBD0			;$01F05A	|
	BCC label_01F065			;$01F05D	|
	LDX #$1669					;$01F05F	|\ Update Kirby's HP bar.
	JSR WriteHPBar				;$01F062	|/
label_01F065:					;			|
	JSR label_01FA25			;$01F065	|
	JMP label_01F706			;$01F068	|



label_01F06B:					;-----------| The Great Cave Offensive status bar routine 1 - No partner, has boss.
	CPX $00B3					;$01F06B	|\ Skip if the status bar has already been initialized.
	BEQ label_01F08C			;$01F06E	|/
	STX $00B3					;$01F070	|
	LDA #$F154					;$01F073	|\ 
	LDX #$0001					;$01F076	|| Load the DMA table at $01F154.
	JSL LoadDMATable			;$01F079	|/
	LDA #$00EA					;$01F07D	|\ 
	LDX #$69C0					;$01F080	|| Load the base tilemap from $EA69C0.
	JSR LoadStatusBarBase		;$01F083	|/
	LDA #$8000					;$01F086	|
	TSB $7A1F					;$01F089	|
label_01F08C:					;			|
	JSR label_01FCD5			;$01F08C	|
	BCC label_01F097			;$01F08F	|
	LDX #$165B					;$01F091	|\ Update the boss's HP bar.
	JSR WriteHPBar				;$01F094	|/
label_01F097:					;			|
	LDX #$16BD					;$01F097	|\ Write the life count.
	JSR label_01F8B7			;$01F09A	|/
	JSR label_01FBD0			;$01F09D	|
	BCC label_01F0A8			;$01F0A0	|
	LDX #$1669					;$01F0A2	|\ Update Kirby's HP bar.
	JSR WriteHPBar				;$01F0A5	|/
label_01F0A8:					;			|
	JSR label_01FA25			;$01F0A8	|
	JMP label_01F706			;$01F0AB	|



label_01F0AE:					;-----------| The Great Cave Offensive status bar routine 2 - No partner, has boss.
	CPX $00B3					;$01F0AE	|\ Skip if the status bar has already been initialized.
	BEQ label_01F0CF			;$01F0B1	|/
	STX $00B3					;$01F0B3	|
	LDA #$F14B					;$01F0B6	|\ 
	LDX #$0001					;$01F0B9	|| Load the DMA table at $01F14B.
	JSL LoadDMATable			;$01F0BC	|/
	LDA #$00EA					;$01F0C0	|\ 
	LDX #$939B					;$01F0C3	|| Load the base tilemap from $EA939B.
	JSR LoadStatusBarBase		;$01F0C6	|/
	LDA #$8000					;$01F0C9	|
	TSB $7A1F					;$01F0CC	|
label_01F0CF:					;			|
	LDX #$165A					;$01F0CF	|\ Write the score/money.
	JSR label_01F8EE			;$01F0D2	|/
	LDX #$16BD					;$01F0D5	|\ Write the life count.
	JSR label_01F8B7			;$01F0D8	|/
	JSR label_01FBD0			;$01F0DB	|
	BCC label_01F0E6			;$01F0DE	|
	LDX #$1669					;$01F0E0	|\ Update Kirby's HP bar.
	JSR WriteHPBar				;$01F0E3	|/
label_01F0E6:					;			|
	JSR label_01FC62			;$01F0E6	|
	BCC label_01F0F1			;$01F0E9	|
	LDX #$16AA					;$01F0EB	|\ Update the partner's HP bar.
	JSR WriteHPBar2				;$01F0EE	|/
label_01F0F1:					;			|
	JSR label_01FA25			;$01F0F1	|
	JSR label_01FAF3			;$01F0F4	|
	JMP label_01F706			;$01F0F7	|



label_01F0FA:					;-----------| The Great Cave Offensive status bar routine 3 - Has partner, has boss.
	CPX $00B3					;$01F0FA	|\ Skip if the status bar has already been initialized.
	BEQ label_01F11B			;$01F0FD	|/
	STX $00B3					;$01F0FF	|
	LDA #$F154					;$01F102	|\ 
	LDX #$0001					;$01F105	|| Load the DMA table at $01F154.
	JSL LoadDMATable			;$01F108	|/
	LDA #$00EA					;$01F10C	|\ 
	LDX #$94DF					;$01F10F	|| Load the base tilemap from $EA64DF.
	JSR LoadStatusBarBase		;$01F112	|/
	LDA #$8000					;$01F115	|
	TSB $7A1F					;$01F118	|
label_01F11B:					;			|
	JSR label_01FCD5			;$01F11B	|
	BCC label_01F126			;$01F11E	|
	LDX #$165B					;$01F120	|\ Update the boss's HP bar.
	JSR WriteHPBar				;$01F123	|/
label_01F126:					;			|
	LDX #$16BD					;$01F126	|\ Write the life count.
	JSR label_01F8B7			;$01F129	|/
	JSR label_01FBD0			;$01F12C	|
	BCC label_01F137			;$01F12F	|
	LDX #$1669					;$01F131	|\ Update Kirby's HP bar.
	JSR WriteHPBar				;$01F134	|/
label_01F137:					;			|
	JSR label_01FC62			;$01F137	|
	BCC label_01F142			;$01F13A	|
	LDX #$16AA					;$01F13C	|\ Update partner's HP bar.
	JSR WriteHPBar2				;$01F13F	|/
label_01F142:					;			|
	JSR label_01FA25			;$01F142	|
	JSR label_01FAF3			;$01F145	|
	JMP label_01F706			;$01F148	|

DATA_01F14B:					;$01F14B	| DMA table used by the above routines.
	db $03 : dw $0040 : dl $EFB792 : dw $5F30
	db $FF

DATA_01F154:					;$01F154	| DMA table used by the above routines.
	db $03 : dw $0040 : dl $EFB752 : dw $5F30
	db $FF





label_01F15D:					;-----------| Status bar routine for Revenge of Meta-Knight.
	LDA #$0000					;$01F15D	|\ 
	LDY $6240					;$01F160	||
	BMI label_01F168			;$01F163	||
	ORA #$0004					;$01F165	|| Get the layout to use.
label_01F168:					;			|| Start with X = 0;
	LDY $7A1B					;$01F168	||  If a partner is active, add 4.
	BMI label_01F170			;$01F16B	||  If a boss is active, add 2.
	ORA #$0002					;$01F16D	||
label_01F170:					;			||
	TAX							;$01F170	|/
	LDA $7A23					;$01F171	|\ 
	AND #$00FF					;$01F174	||
	CMP #$00FF					;$01F177	|| Alternatively, if a textbox is active, use X = 8.
	BEQ label_01F17F			;$01F17A	||
	LDX #$0008					;$01F17C	|/
label_01F17F:					;			|
	JMP (label_01F182,X)		;$01F17F	|


label_01F182:					;$01F182	| Pointers to status bar routines for Revenge of Meta-Knight.
	dw label_01F18C				; 0 - No partner, no boss
	dw label_01F1AF				; 1 - No partner, has boss
	dw label_01F1D6				; 2 - Has partner, no boss
	dw label_01F206				; 3 - Has partner, has boss
	dw label_01F27A				; 4 - Textbox

label_01F18C:					;-----------| Revenge of Meta-Knight status bar routine 0 - No partner, no boss
	CPX $00B3					;$01F18C	|\ Skip if the status bar has already been initialized.
	BEQ label_01F1A6			;$01F18F	|/
	STX $00B3					;$01F191	|
	LDA #$0004					;$01F194	|
	TRB $3072					;$01F197	|
	TRB $7A28					;$01F19A	|
	LDX #$056D					;$01F19D	|\ 
	LDA #$00EB					;$01F1A0	|| Load the base tilemap from $EB056D.
	JSR LoadStatusBarBase		;$01F1A3	|/
label_01F1A6:					;			|
	LDX #$16A8					;$01F1A6	|\ Write the score.
	JSR label_01F947			;$01F1A9	|/
	JMP $F239					;$01F1AC	|



label_01F1AF:					;-----------| Revenge of Meta-Knight status bar routine 1 - No partner, has boss
	CPX $00B3					;$01F1AF	|\ Skip if the status bar has already been initialized.
	BEQ label_01F1C9			;$01F1B2	|/
	STX $00B3					;$01F1B4	|
	LDA #$0004					;$01F1B7	|
	TRB $3072					;$01F1BA	|
	TRB $7A28					;$01F1BD	|
	LDX #$FA16					;$01F1C0	|\ 
	LDA #$00EA					;$01F1C3	|| Load the base tilemap from $EAFA16.
	JSR LoadStatusBarBase		;$01F1C6	|/
label_01F1C9:					;			|
	JSR label_01FCD5			;$01F1C9	|
	BCC label_01F1D4			;$01F1CC	|
	LDX #$16C4					;$01F1CE	|\ Update the boss's HP bar.
	JSR WriteHPBar				;$01F1D1	|/
label_01F1D4:					;			|
	BRA label_01F239			;$01F1D4	|



label_01F1D6:					;-----------| Revenge of Meta-Knight status bar routine 2 - Has partner, no boss
	CPX $00B3					;$01F1D6	|\ Skip if the status bar has already been initialized.
	BEQ label_01F1F3			;$01F1D9	|/
	STX $00B3					;$01F1DB	|
	LDA #$0004					;$01F1DE	|
	TRB $3072					;$01F1E1	|
	TRB $7A28					;$01F1E4	|
	LDX #$0CE2					;$01F1E7	|\ 
	LDA #$00EB					;$01F1EA	|| Load the base tilemap from $EB0CE2.
	JSR LoadStatusBarBase		;$01F1ED	|/
	STA $00BD					;$01F1F0	|
label_01F1F3:					;			|
	LDX #$16A8					;$01F1F3	|\ Write the score.
	JSR label_01F947			;$01F1F6	|/
	JSR label_01FC62			;$01F1F9	|
	BCC label_01F204			;$01F1FC	|
	LDX #$166A					;$01F1FE	|\ Update the partner's HP bar.
	JSR WriteHPBar2				;$01F201	|/
label_01F204:					;			|
	BRA label_01F239			;$01F204	|



label_01F206:					;-----------| Revenge of Meta-Knight status bar routine 3 - Has partner, has boss
	CPX $00B3					;$01F206	|\ Skip if the status bar has already been initialized.
	BEQ label_01F223			;$01F209	|/
	STX $00B3					;$01F20B	|
	LDA #$0004					;$01F20E	|
	TRB $3072					;$01F211	|
	TRB $7A28					;$01F214	|
	LDX #$FE81					;$01F217	|\ 
	LDA #$00EA					;$01F21A	|| Load the base tilemap from $EAFE81.
	JSR LoadStatusBarBase		;$01F21D	|/
	STA $00BD					;$01F220	|
label_01F223:					;			|
	JSR label_01FCD5			;$01F223	|
	BCC label_01F22E			;$01F226	|
	LDX #$16C4					;$01F228	|\ Update the boss's HP bar.
	JSR WriteHPBar				;$01F22B	|/
label_01F22E:					;			|
	JSR label_01FC62			;$01F22E	|
	BCC label_01F239			;$01F231	|
	LDX #$166A					;$01F233	|\ Update the partner's HP bar.
	JSR WriteHPBar2				;$01F236	|/
label_01F239:					;			|
	JSR label_01FBD0			;$01F239	|
	BCC label_01F244			;$01F23C	|
	LDX #$165D					;$01F23E	|\ Update Kirby's HP bar.
	JSR WriteHPBar				;$01F241	|/
label_01F244:					;			|
	LDX #$16A0					;$01F244	|\ Write the life count.
	JSR label_01F8B7			;$01F247	|/
	JSR label_01F3D3			;$01F24A	|
	LDA $7A2D					;$01F24D	|
	INC A						;$01F250	|
	CMP #$0003					;$01F251	|
	BCS label_01F261			;$01F254	|
	STA $7A2D					;$01F256	|
	LDA #$E4E4					;$01F259	|\ From $EFE4E4...
	LDX #$00EF					;$01F25C	|/
	BRA label_01F26A			;$01F25F	|

label_01F261:
	STZ $7A2D					;$01F261	|
	LDA #$E502					;$01F264	|\ From $EFE502...
	LDX #$00EF					;$01F267	|/
label_01F26A:					;			|
	LDY #$610F					;$01F26A	|\ ...transfer 15 colors to $61-$6F.
	JSL WriteStatusPal			;$01F26D	|/
	JSR label_01FA25			;$01F271	|
	JSR label_01FAF3			;$01F274	|
	JMP label_01F706			;$01F277	|



label_01F27A:					;-----------| Revenge of Meta-Knight status bar routine 4 - Textbox
	CPX $00B3					;$01F27A	|\ Skip if the status bar has already been initialized.
	BEQ label_01F2C1			;$01F27D	|/
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
	LDA $7A1B					;$01F2A8	|\ 
	BPL label_01F2B8			;$01F2AB	||
	LDX #$056D					;$01F2AD	||
	LDA #$00EB					;$01F2B0	|| Load the base tilemap from either
	JSR LoadStatusBarBase		;$01F2B3	||  $EB056D (if no boss is active)
	BRA label_01F2C1			;$01F2B6	||  or $EAFA16 (if a boss is active).
label_01F2B8:					;			||
	LDX #$FA16					;$01F2B8	||
	LDA #$00EA					;$01F2BB	||
	JSR LoadStatusBarBase		;$01F2BE	|/
label_01F2C1:					;			|
	LDX #$16A0					;$01F2C1	|\ Write the life count.
	JSR label_01F8B7			;$01F2C4	|/
	JSR label_01F3D3			;$01F2C7	|
	JSR label_01FBD0			;$01F2CA	|
	BCC label_01F2D5			;$01F2CD	|
	LDX #$165D					;$01F2CF	|\ Update Kirby's HP bar.
	JSR WriteHPBar				;$01F2D2	|/
label_01F2D5:					;			|
	LDA $7A1B					;$01F2D5	|\ Branch if a boss is active.
	BPL label_01F2E2			;$01F2D8	|/
	LDX #$16A8					;$01F2DA	|\ Write the score.
	JSR label_01F947			;$01F2DD	|/
	BRA label_01F2ED			;$01F2E0	|

label_01F2E2:
	JSR label_01FCD5			;$01F2E2	|
	BCC label_01F2ED			;$01F2E5	|
	LDX #$16C4					;$01F2E7	|\ Update the boss's HP bar.
	JSR WriteHPBar				;$01F2EA	|/
label_01F2ED:					;			|
	SEP #$30					;$01F2ED	|
	LDA #$FF					;$01F2EF	|
	STA $7385					;$01F2F1	|
	STA $7387					;$01F2F4	|
	STA $7389					;$01F2F7	|
	LDA $7A23					;$01F2FA	|\ 
	CMP $7A24					;$01F2FD	|| Branch down if the textbox's character image has already been updated.
	BEQ label_01F371			;$01F300	||
	STA $7A24					;$01F302	|/
	CMP #$10					;$01F305	|\ If the image is set to 0x10 or more, don't draw any iamge.
	BCS label_01F365			;$01F307	|/
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
	STA $37						;$01F35D	||/
	JSL WriteToDMABuffer		;$01F35F	|/
	BRA label_01F371			;$01F363	|

label_01F365:					;```````````| No character image to be displayed.
	REP #$30					;$01F365	|
	LDX #$001C					;$01F367	|\ 
  .colorLoop:					;			||
	STZ $1539,X					;$01F36A	|| Black out the colors for the character image.
	DEX							;$01F36D	||
	DEX							;$01F36E	||
	BPL .colorLoop				;$01F36F	|/
label_01F371:					;```````````| Done with the character image.
	REP #$30					;$01F371	|
	JMP label_01F7AE			;$01F373	|


label_01F376:					;-----------| Unused routine?
	CMP #$0020					;$01F376	|
	BCC label_01F37E			;$01F379	|
	LDA #$0000					;$01F37B	|
label_01F37E:					;			|
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
label_01F3A5:					;			|
	LDA [$14],Y					;$01F3A5	|
	CLC							;$01F3A7	|
	ADC #$80					;$01F3A8	|
	STA $1638,X					;$01F3AA	|
	LDA [$18],Y					;$01F3AD	|
	STA $1718,X					;$01F3AF	|
	INX							;$01F3B2	|
	CPX #$04					;$01F3B3	|
	BEQ label_01F3C3			;$01F3B5	|
	CPX #$24					;$01F3B7	|
	BEQ label_01F3C3			;$01F3B9	|
	CPX #$44					;$01F3BB	|
	BEQ label_01F3C3			;$01F3BD	|
	CPX #$64					;$01F3BF	|
	BNE label_01F3C8			;$01F3C1	|
label_01F3C3:					;			|
	TXA							;$01F3C3	|
	CLC							;$01F3C4	|
	ADC #$1C					;$01F3C5	|
	TAX							;$01F3C7	|
label_01F3C8:					;			|
	INY							;$01F3C8	|
	CPY #$14					;$01F3C9	|
	BCC label_01F3A5			;$01F3CB	|
	REP #$30					;$01F3CD	|
	INC $00B1					;$01F3CF	|
	RTS							;$01F3D2	|


label_01F3D3:					;-----------| Status bar subroutine for Revenge of Meta-Knight.
	SEP #$10					;$01F3D3	|
	LDA $73A0					;$01F3D5	|
	STA $4204					;$01F3D8	|
	LDX #$03					;$01F3DB	|
	STX $4206					;$01F3DD	|
	PHA							;$01F3E0	|
	PLA							;$01F3E1	|
	LDX #$FF					;$01F3E2	|
	SEC							;$01F3E4	|
	LDA $4214					;$01F3E5	|
label_01F3E8:					;			|
	INX							;$01F3E8	|
	SBC #$03E8					;$01F3E9	|
	BCS label_01F3E8			;$01F3EC	|
	STX $00						;$01F3EE	|
	ADC #$03E8					;$01F3F0	|
	LDX #$FF					;$01F3F3	|
label_01F3F5:					;			|
	INX							;$01F3F5	|
	SBC #$0064					;$01F3F6	|
	BCS label_01F3F5			;$01F3F9	|
	STX $01						;$01F3FB	|
	ADC #$0064					;$01F3FD	|
	LDX #$FF					;$01F400	|
label_01F402:					;			|
	INX							;$01F402	|
	SBC #$000A					;$01F403	|
	BCS label_01F402			;$01F406	|
	STX $02						;$01F408	|
	ADC #$000A					;$01F40A	|
	SEP #$20					;$01F40D	|
	STA $03						;$01F40F	|
	LDX #$00					;$01F411	|
	LDA #$FF					;$01F413	|
label_01F415:					;			|
	LDY $00,X					;$01F415	|
	BNE label_01F422			;$01F417	|
	STA $001665,X				;$01F419	|
	INX							;$01F41D	|
	CPX #$03					;$01F41E	|
	BCC label_01F415			;$01F420	|
label_01F422:					;			|
	LDA $00,X					;$01F422	|
	CLC							;$01F424	|
	ADC #$B6					;$01F425	|
	STA $001665,X				;$01F427	|
	INX							;$01F42B	|
	CPX #$04					;$01F42C	|
	BCC label_01F422			;$01F42E	|
	REP #$30					;$01F430	|
	INC $00B1					;$01F432	|
	RTS							;$01F435	|





label_01F436:					;-----------| Status bar routine for Milky Way Wishes.
	LDA #$0000					;$01F436	|\ 
	LDY $6240					;$01F439	||
	BMI label_01F441			;$01F43C	||
	ORA #$0004					;$01F43E	|| Get the layout to use.
label_01F441:					;			|| Start with A = 0;
	LDY $7A1B					;$01F441	||  If a partner is active, add 4.
	BMI label_01F449			;$01F444	||  If a boss is active, add 2.
	ORA #$0002					;$01F446	||
label_01F449:					;			||
	TAX							;$01F449	|/
	JMP (label_01F44D,X)		;$01F44A	|

label_01F44D:					;$01F44D	| Pointers to status bar routines for Milky Way Wishes.
	db label_01F455				; 0 - No partner, no boss
	db label_01F489				; 1 - No partner, has boss
	db label_01F4C9				; 2 - Has partner, no boss
	db label_01F50E				; 3 - Has partner, has boss



label_01F455:					;-----------| Milky Way Wishes status bar routine 0 - No partner, no boss.
	CPX $00B3					;$01F455	|\ Skip if the status bar has already been initialized.
	BEQ label_01F46C			;$01F458	|/
	STX $00B3					;$01F45A	|
	LDX #$8FCB					;$01F45D	|\ 
	LDA #$00EA					;$01F460	|| Load the base tilemap from $EA8FCB.
	JSR LoadStatusBarBase		;$01F463	|/
	JSR label_01F55F			;$01F466	| Load the graphics for the planet name.
	INC $00B1					;$01F469	|
label_01F46C:					;			|
	LDX #$169A					;$01F46C	|\ Write the score.
	JSR label_01F947			;$01F46F	|/
	LDX #$16AB					;$01F472	|\ Write the life count.
	JSR label_01F8B7			;$01F475	|/
	JSR label_01FBD0			;$01F478	|
	BCC label_01F483			;$01F47B	|
	LDX #$165B					;$01F47D	|\ Update Kirby's HP bar.
	JSR WriteHPBar2				;$01F480	|/
label_01F483:					;			|
	JSR label_01FA25			;$01F483	|
	JMP label_01F706			;$01F486	|



label_01F489:					;-----------| Milky Way Wishes status bar routine 1 - No partner, has boss.
	CPX $00B3					;$01F489	|\ Skip if the status bar has already been initialized.
	BEQ label_01F4A7			;$01F48C	|/
	STX $00B3					;$01F48E	|
	LDX #$8BEB					;$01F491	|\ 
	LDA #$00EA					;$01F494	|| Load the base tilemap from $EA8BEB.
	JSR LoadStatusBarBase		;$01F497	|/
	LDX #$0001					;$01F49A	|\ Load the DMA table at $01F5C0.
	LDA #$F5C0					;$01F49D	|| This data overwrites the planet name.
	JSL LoadDMATable			;$01F4A0	|/
	INC $00B1					;$01F4A4	|
label_01F4A7:					;			|
	LDX #$169C					;$01F4A7	|\ Write the life count.
	JSR label_01F8B7			;$01F4AA	|/
	JSR label_01FCD5			;$01F4AD	|
	BCC label_01F4B8			;$01F4B0	|
	LDX #$168D					;$01F4B2	|\ Update the boss's HP bar.
	JSR WriteHPBar2				;$01F4B5	|/
label_01F4B8:					;			|
	JSR label_01FBD0			;$01F4B8	|
	BCC label_01F4C3			;$01F4BB	|
	LDX #$165B					;$01F4BD	|\ Update Kirby's HP bar.
	JSR WriteHPBar2				;$01F4C0	|/
label_01F4C3:					;			|
	JSR label_01FA25			;$01F4C3	|
	JMP label_01F706			;$01F4C6	|



label_01F4C9:					;-----------| Milky Way Wishes status bar routine 2 - Has partner, no boss.
	CPX $00B3					;$01F4C9	|\ Skip if the status bar has already been initialized.
	BEQ label_01F4E3			;$01F4CC	|/
	STX $00B3					;$01F4CE	|
	LDA #$00EA					;$01F4D1	|\ 
	LDX #$BCA1					;$01F4D4	|| Load the base tilemap from $EABCA1.
	JSR LoadStatusBarBase		;$01F4D7	|/
	STA $00BD					;$01F4DA	|
	JSR label_01F55F			;$01F4DD	| Load the graphics for the planet name.
	INC $00B1					;$01F4E0	|
label_01F4E3:					;			|
	LDX #$169A					;$01F4E3	|\ Write the score.
	JSR label_01F947			;$01F4E6	|/
	LDX #$167C					;$01F4E9	|\ Write the life count.
	JSR label_01F8B7			;$01F4EC	|/
	JSR label_01FBD0			;$01F4EF	|
	BCC label_01F4FA			;$01F4F2	|
	LDX #$165B					;$01F4F4	|\ Update Kirby's HP bar.
	JSR WriteHPBar2				;$01F4F7	|/
label_01F4FA:					;			|
	JSR label_01FC62			;$01F4FA	|
	BCC label_01F505			;$01F4FD	|
	LDX #$166D					;$01F4FF	|\ Update the partner's HP bar.
	JSR WriteHPBar				;$01F502	|/
label_01F505:					;			|
	JSR label_01FA25			;$01F505	|
	JSR label_01FAF3			;$01F508	|
	JMP label_01F706			;$01F50B	|



label_01F50E:					;-----------| Milky Way Wishes status bar routine 3 - Has partner, has boss.
	CPX $00B3					;$01F50E	|\ Skip if the status bar has already been initialized.
	BEQ label_01F52F			;$01F511	|/
	STX $00B3					;$01F513	|
	LDA #$00EA					;$01F516	|\ 
	LDX #$B421					;$01F519	|| Load the base tilemap from $EAB421.
	JSR LoadStatusBarBase		;$01F51C	|/
	STA $00BD					;$01F51F	|
	LDX #$0001					;$01F522	|\ Load the DMA table at $01F5C0.
	LDA #$F5C0					;$01F525	|| This data overwrites the planet name.
	JSL LoadDMATable			;$01F528	|/
	INC $00B1					;$01F52C	|
label_01F52F:					;			|
	LDX #$16CF					;$01F52F	|\ Write the life count.
	JSR label_01F8B7			;$01F532	|/
	JSR label_01FCD5			;$01F535	|
	BCC label_01F540			;$01F538	|
	LDX #$168D					;$01F53A	|\ Update the boss's HP bar.
	JSR WriteHPBar2				;$01F53D	|/
label_01F540:					;			|
	JSR label_01FBD0			;$01F540	|
	BCC label_01F54B			;$01F543	|
	LDX #$1659					;$01F545	|\ Update Kirby's HP bar.
	JSR WriteHPBar2				;$01F548	|/
label_01F54B:					;			|
	JSR label_01FC62			;$01F54B	|
	BCC label_01F556			;$01F54E	|
	LDX #$1699					;$01F550	|\ Update the partner's HP bar.
	JSR WriteHPBar2				;$01F553	|/
label_01F556:					;			|
	JSR label_01FA25			;$01F556	|
	JSR label_01FAF3			;$01F559	|
	JMP label_01F706			;$01F55C	|



label_01F55F:					;-----------| Subroutine to get the planet name for the status bar in Milky Way Wishes.
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
	STA $37						;$01F59B	||
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





label_01F5C9:					;-----------| Status bar routine for The Arena, Sound Test, Guide / Minigame, and the two unused games.
	LDA #$0000					;$01F5C9	|\ 
	LDY $6240					;$01F5CC	||
	BMI label_01F5D4			;$01F5CF	|| Get the layout to use.
	ORA #$0004					;$01F5D1	|| Start with A = 0;
label_01F5D4:					;			||  If a partner is active, add 4.
	LDY $7A1B					;$01F5D4	||  If a boss is active, add 2.
	BMI label_01F5DC			;$01F5D7	||
	ORA #$0002					;$01F5D9	|/
label_01F5DC:					;			|
	CMP $00B3					;$01F5DC	|\ Skip if the status bar has already been initialized.
	BEQ label_01F643			;$01F5DF	|/
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
	BCC label_01F604			;$01F5FC	|
	LDA #$0010					;$01F5FE	|
	STA $7A21					;$01F601	|
label_01F604:					;			|
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
	STA $37						;$01F63D	|
	JSL WriteToDMABuffer		;$01F63F	|
label_01F643:					;			|
	LDX $00B3					;$01F643	|
	JMP (label_01F649,X)		;$01F646	|

label_01F649:					;$01F649	| Pointers to status bar routines for The Arena/etc.
	dw label_01F651				; 0 - No partner, no boss
	dw label_01F662				; 1 - No partner, has boss
	dw label_01F67E				; 2 - Has partner, no boss
	dw label_01F69D				; 3 - Has partner, has boss



label_01F651:					;-----------| The Arena/etc. status bar routine 0.
	JSR label_01FBD0			;$01F651	|
	BCC label_01F65C			;$01F654	|
	LDX #$169D					;$01F656	|
	JSR WriteHPBar				;$01F659	|
label_01F65C:					;			|
	JSR label_01FA25			;$01F65C	|
	JMP label_01F706			;$01F65F	|



label_01F662:					;-----------| The Arena/etc. status bar routine 1.
	JSR label_01FCD5			;$01F662	|
	BCC label_01F66D			;$01F665	|
	LDX #$16AA					;$01F667	|
	JSR WriteHPBar2				;$01F66A	|
label_01F66D:					;			|
	JSR label_01FBD0			;$01F66D	|
	BCC label_01F678			;$01F670	|
	LDX #$169D					;$01F672	|
	JSR WriteHPBar				;$01F675	|
label_01F678:					;			|
	JSR label_01FA25			;$01F678	|
	JMP label_01F706			;$01F67B	|



label_01F67E:					;-----------| The Arena/etc. status bar routine 2.
	JSR label_01FBD0			;$01F67E	|
	BCC label_01F689			;$01F681	|
	LDX #$1680					;$01F683	|
	JSR WriteHPBar				;$01F686	|
label_01F689:					;			|
	JSR label_01FC62			;$01F689	|
	BCC label_01F694			;$01F68C	|
	LDX #$16C1					;$01F68E	|
	JSR WriteHPBar				;$01F691	|
label_01F694:					;			|
	JSR label_01FA25			;$01F694	|
	JSR label_01FAF3			;$01F697	|
	JMP label_01F706			;$01F69A	|




label_01F69D:					;-----------| The Arena/etc. status bar routine 3.
	JSR label_01FCD5			;$01F69D	|
	BCC label_01F6A8			;$01F6A0	|
	LDX #$168D					;$01F6A2	|
	JSR WriteHPBar2				;$01F6A5	|
label_01F6A8:					;			|
	JSR label_01FBD0			;$01F6A8	|
	BCC label_01F6B3			;$01F6AB	|
	LDX #$1680					;$01F6AD	|
	JSR WriteHPBar				;$01F6B0	|
label_01F6B3:					;			|
	JSR label_01FC62			;$01F6B3	|
	BCC label_01F6BE			;$01F6B6	|
	LDX #$16C1					;$01F6B8	|
	JSR WriteHPBar				;$01F6BB	|
label_01F6BE:					;			|
	JSR label_01FA25			;$01F6BE	|
	JSR label_01FAF3			;$01F6C1	|
	JMP label_01F706			;$01F6C4	|



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





label_01F706:
	LDA $32EA					;$01F706	|
	CMP #$0002					;$01F709	|
	BNE label_01F711			;$01F70C	|
	JMP label_01F7AE			;$01F70E	|

label_01F711:
	LDY #$0004					;$01F711	|
label_01F714:					;			|
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
	BEQ label_01F745			;$01F72C	|
	CPX #$0001					;$01F72E	|
	BNE label_01F738			;$01F731	|
	LDA #$7FFF					;$01F733	|
	STA ($14)					;$01F736	|
label_01F738:					;			|
	CPX #$0003					;$01F738	|
	BCC label_01F78D			;$01F73B	|
	LDA #$0000					;$01F73D	|
	STA $00CF,Y					;$01F740	|
	BRA label_01F78D			;$01F743	|
label_01F745:					;			|
	LDX $00D5,Y					;$01F745	|
	BEQ label_01F763			;$01F748	|
	CPX #$0004					;$01F74A	|
	BCS label_01F78D			;$01F74D	|
	TXA							;$01F74F	|
	AND #$0001					;$01F750	|
	BEQ label_01F78D			;$01F753	|
	LDA #$7FFF					;$01F755	|
	STA ($14)					;$01F758	|
	CPX #$0001					;$01F75A	|
	BNE label_01F78D			;$01F75D	|
	STA ($18)					;$01F75F	|
	BRA label_01F78D			;$01F761	|
label_01F763:					;			|
	LDA $00DB,Y					;$01F763	|
	BEQ label_01F77B			;$01F766	|
	CMP #$0010					;$01F768	|
	BCS label_01F78D			;$01F76B	|
	AND #$0001					;$01F76D	|
	BEQ label_01F78D			;$01F770	|
	LDA #$7FFF					;$01F772	|
	STA ($14)					;$01F775	|
	STA ($18)					;$01F777	|
	BRA label_01F78D			;$01F779	|

label_01F77B:
	LDA $00E1,Y					;$01F77B	|
	BEQ label_01F78D			;$01F77E	|
	LDA $3094					;$01F780	|
	AND #$0003					;$01F783	|
	BNE label_01F78D			;$01F786	|
	LDA #$7FFF					;$01F788	|
	STA ($14)					;$01F78B	|
label_01F78D:					;			|
	CPY #$0002					;$01F78D	|
	BNE label_01F7A7			;$01F790	|
	LDA $75CF					;$01F792	|
	CMP #$0001					;$01F795	|
	BNE label_01F7A7			;$01F798	|
	LDA $3094					;$01F79A	|
	AND #$0003					;$01F79D	|
	BNE label_01F7A7			;$01F7A0	|
	LDA #$7FFF					;$01F7A2	|
	STA ($18)					;$01F7A5	|
label_01F7A7:					;			|
	DEY							;$01F7A7	|
	DEY							;$01F7A8	|
	BMI label_01F7AE			;$01F7A9	|
	JMP label_01F714			;$01F7AB	|


label_01F7AE:
	LDA $00B1					;$01F7AE	|\ Skip if the status bar doesn't need to be updated?
	BEQ label_01F7CC			;$01F7B1	|/
	LDA $3019					;$01F7B3	|\ 
	CLC							;$01F7B6	||
	ADC #$0226					;$01F7B7	|| Add to the NMI load, and if about to go over the limit, skip the data entirely.
	CMP $301B					;$01F7BA	||
	BCS label_01F7CC			;$01F7BD	|/
	STZ $00B1					;$01F7BF	|
	LDX #$0001					;$01F7C2	|\ Load the DMA table at $01F7CD.
	LDA #$F7CD					;$01F7C5	|| This table uploads the status bar tilemap.
	JSL LoadDMATable			;$01F7C8	|/
label_01F7CC:					;			|
	RTS							;$01F7CC	|


DATA_01F7CD:					;$01F7CD	| DMA table used to upload the status bar tilemap.
	db $09 : dw $00E0 : dl $001617 : dw $5800		; Lower DMA for 0xE0 bytes from $1617 to $5800.
	db $0F : dw $00E0 : dl $0016F7 : dw $5800		; Upper DMA for 0xE0 bytes from $16F7 to $5800.
	db $FF


DATA_01F7DE:					;$01F7DE	|
	dw $157B,$159B,$15BB





LoadStatusBarBase:				;-----------| Subroutine to upload a base status bar tilemap. Pass source address in $-AXX.
	LDY #$1617					;$01F7E4	|\ 
	PEA $007E					;$01F7E7	|| Decompress the data from the source to $1617.
	PLB							;$01F7EA	||
	JSL DecompressData			;$01F7EB	|/
	SEP #$20					;$01F7EF	|
	LDX #$00DF					;$01F7F1	|\ 
label_01F7F4:					;			||
	LDA $1617,X					;$01F7F4	||
	CLC							;$01F7F7	|| Add 0x80 to all the tiles for some reason...?
	ADC #$80					;$01F7F8	||
	STA $1617,X					;$01F7FA	||
	DEX							;$01F7FD	||
	BPL label_01F7F4			;$01F7FE	|/
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



label_01F81F:					;-----------| Subroutine used by Spring Breeze/Dyna Blade to get which status bar routine to run.
	LDA #$0000					;$01F81F	|  Returns X = (2*hasPartner) + (4*inBossBattle)
	LDY $6240					;$01F822	|\ 
	BMI label_01F82A			;$01F825	|| If the player has a partner, add 2.
	ORA #$0002					;$01F827	|/
label_01F82A:					;			|
	LDY $7A1B					;$01F82A	|\ 
	BMI label_01F832			;$01F82D	|| If a boss is active, add 4.
	ORA #$0004					;$01F82F	|/
label_01F832:					;			|
	TAX							;$01F832	|
	RTS							;$01F833	|



WriteHPBar:						;-----------| Subroutine to write HP bars for Kirby/partners/bosses. X = address to write to.
	PEA $007E					;$01F834	|  $00 - Values representing how "full" each tile is. 0 = empty, 8 = full.
	PLB							;$01F837	|  The routine after this is identical, except this routine handles 8-bit overflow on the destination.
	STX $14						;$01F838	|
	SEP #$30					;$01F83A	|
	LDY #$06					;$01F83C	|\ 
  .loop:						;			||
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
	PEA $007E					;$01F856	|  $00 - Values representing how "full" each tile is. 0 = empty, 8 = full.
	PLB							;$01F859	|  Identical to the above routine, except it doesn't handle 8-bit overflow on $14.
	STX $14						;$01F85A	|
	SEP #$30					;$01F85C	|
	LDY #$06					;$01F85E	|\ 
  .loop:						;			||
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



label_01F87B:					;-----------| Subroutine for Spring Breeze/Dyna Blade to write boss health bars. X = address to write to.
	JSR label_01FCD5			;$01F87B	|
	BCC label_01F898			;$01F87E	|
	SEP #$20					;$01F880	|
	LDY #$0006					;$01F882	|\ 
	LDX #$0000					;$01F885	||
label_01F888:					;			||
	LDA $00,X					;$01F888	||
	CLC							;$01F88A	|| Copy 7 tile numbers to the destination address.
	ADC #$C7					;$01F88B	|| Each tile is 0xC7 + (fill amount)
	STA ($14),Y					;$01F88D	||
	INX							;$01F88F	||
	DEY							;$01F890	||
	BPL label_01F888			;$01F891	|/
	REP #$20					;$01F893	|
	INC $00B1					;$01F895	|
label_01F898:					;			|
	RTS							;$01F898	|



label_01F899:					;-----------| Unused status bar subroutine?
	JSR label_01FCD5			;$01F899	|
	BCC label_01F8B6			;$01F89C	|
	SEP #$20					;$01F89E	|
	LDY #$0006					;$01F8A0	|
	LDX #$0000					;$01F8A3	|
label_01F8A6:					;			|
	LDA $3700,Y					;$01F8A6	|
	CLC							;$01F8A9	|
	ADC #$C7					;$01F8AA	|
	STA ($14),Y					;$01F8AC	|
	DEY							;$01F8AE	|
	BPL label_01F8A6			;$01F8AF	|
	REP #$20					;$01F8B1	|
	INC $00B1					;$01F8B3	|
label_01F8B6:					;			|
	RTS							;$01F8B6	|



label_01F8B7:					;-----------| Subroutine to write the player's life count into the status bar. X = address to write to4.
	LDA $737A					;$01F8B7	|
	CMP #$0064					;$01F8BA	|
	BCC label_01F8C5			;$01F8BD	|
	LDA #$0063					;$01F8BF	|
	STA $737A					;$01F8C2	|
label_01F8C5:					;			|
	CMP $00B9					;$01F8C5	|
	BEQ label_01F8ED			;$01F8C8	|
	STA $00B9					;$01F8CA	|
	LDY #$FFFF					;$01F8CD	|
	SEC							;$01F8D0	|
label_01F8D1:					;			|
	INY							;$01F8D1	|
	SBC #$000A					;$01F8D2	|
	BCS label_01F8D1			;$01F8D5	|
	ADC #$00C0					;$01F8D7	|
	SEP #$20					;$01F8DA	|
	STA $7E0001,X				;$01F8DC	|
	TYA							;$01F8E0	|
	CLC							;$01F8E1	|
	ADC #$B6					;$01F8E2	|
	STA $7E0000,X				;$01F8E4	|
	REP #$20					;$01F8E8	|
	INC $00B1					;$01F8EA	|
label_01F8ED:					;			|
	RTS							;$01F8ED	|



label_01F8EE:					;-----------| Subroutine to write the score for the Great Cave Offensive. X = address to write to.
	LDA $7372					;$01F8EE	|
	LDY $7374					;$01F8F1	|
	CMP $00B5					;$01F8F4	|
	BNE label_01F8FF			;$01F8F7	|
	CPY $00B7					;$01F8F9	|
	BNE label_01F8FF			;$01F8FC	|
	RTS							;$01F8FE	|

label_01F8FF:
	CPY #$0098					;$01F8FF	|
	BCC label_01F917			;$01F902	|
	BNE label_01F90B			;$01F904	|
	CMP #$967F					;$01F906	|
	BCC label_01F917			;$01F909	|
label_01F90B:					;			|
	LDA #$967F					;$01F90B	|
	STA $7372					;$01F90E	|
	LDY #$0098					;$01F911	|
	STY $7374					;$01F914	|
label_01F917:					;			|
	STA $00B5					;$01F917	|
	STA $00						;$01F91A	|
	STY $00B7					;$01F91C	|
	STX $14						;$01F91F	|
	LDX #$FFFF					;$01F921	|
label_01F924:					;			|
	INX							;$01F924	|
	LDA $00						;$01F925	|
	SEC							;$01F927	|
	SBC #$4240					;$01F928	|
	STA $00						;$01F92B	|
	TYA							;$01F92D	|
	SBC #$000F					;$01F92E	|
	TAY							;$01F931	|
	BPL label_01F924			;$01F932	|
	STX $06						;$01F934	|
	LDA $00						;$01F936	|
	CLC							;$01F938	|
	ADC #$4240					;$01F939	|
	STA $00						;$01F93C	|
	TYA							;$01F93E	|
	ADC #$000F					;$01F93F	|
	TAY							;$01F942	|
	LDA $00						;$01F943	|
	BRA label_01F978			;$01F945	|


label_01F947:					;```````````| Alternative entry to the above routine, for writing the score.
	LDA $7372					;$01F947	|
	LDY $7374					;$01F94A	|
	CMP $00B5					;$01F94D	|
	BNE label_01F958			;$01F950	|
	CPY $00B7					;$01F952	|
	BNE label_01F958			;$01F955	|
	RTS							;$01F957	|

label_01F958:
	CPY #$000F					;$01F958	|
	BCC label_01F970			;$01F95B	|
	BNE label_01F964			;$01F95D	|
	CMP #$4240					;$01F95F	|
	BCC label_01F970			;$01F962	|
label_01F964:					;			|
	LDA #$423F					;$01F964	|
	STA $7372					;$01F967	|
	LDY #$000F					;$01F96A	|
	STY $7374					;$01F96D	|
label_01F970:					;			|
	STA $00B5					;$01F970	|
	STY $00B7					;$01F973	|
	STX $14						;$01F976	|
label_01F978:					;```````````| Routine actually continues.
	LDX #$FFFF					;$01F978	|
label_01F97B:					;			|
	INX							;$01F97B	|
	SEC							;$01F97C	|
	SBC #$86A0					;$01F97D	|
	BCS label_01F983			;$01F980	|
	DEY							;$01F982	|
label_01F983:					;			|
	DEY							;$01F983	|
	BPL label_01F97B			;$01F984	|
	STX $00						;$01F986	|
	CLC							;$01F988	|
	ADC #$86A0					;$01F989	|
	BCC label_01F98F			;$01F98C	|
	INY							;$01F98E	|
label_01F98F:					;			|
	INY							;$01F98F	|
	LDX #$FFFF					;$01F990	|
label_01F993:					;			|
	INX							;$01F993	|
	SEC							;$01F994	|
	SBC #$2710					;$01F995	|
	BCS label_01F993			;$01F998	|
	DEY							;$01F99A	|
	BPL label_01F993			;$01F99B	|
	STX $01						;$01F99D	|
	ADC #$2710					;$01F99F	|
	LDX #$FFFF					;$01F9A2	|
	SEC							;$01F9A5	|
label_01F9A6:					;			|
	INX							;$01F9A6	|
	SBC #$03E8					;$01F9A7	|
	BCS label_01F9A6			;$01F9AA	|
	STX $02						;$01F9AC	|
	ADC #$03E8					;$01F9AE	|
	LDX #$FFFF					;$01F9B1	|
	SEC							;$01F9B4	|
label_01F9B5:					;			|
	INX							;$01F9B5	|
	SBC #$0064					;$01F9B6	|
	BCS label_01F9B5			;$01F9B9	|
	STX $03						;$01F9BB	|
	ADC #$0064					;$01F9BD	|
	LDX #$FFFF					;$01F9C0	|
	SEC							;$01F9C3	|
label_01F9C4:					;			|
	INX							;$01F9C4	|
	SBC #$000A					;$01F9C5	|
	BCS label_01F9C4			;$01F9C8	|
	STX $04						;$01F9CA	|
	ADC #$000A					;$01F9CC	|
	SEP #$20					;$01F9CF	|
	STA $05						;$01F9D1	|
	LDX #$00FF					;$01F9D3	|
	LDA $32EA					;$01F9D6	|
	CMP #$03					;$01F9D9	|
	BNE label_01F9F2			;$01F9DB	|
	LDA $06						;$01F9DD	|
	BNE label_01F9E4			;$01F9DF	|
	TXA							;$01F9E1	|
	BRA label_01F9EA			;$01F9E2	|

label_01F9E4:
	LDX #$0000					;$01F9E4	|
	CLC							;$01F9E7	|
	ADC #$B6					;$01F9E8	|
label_01F9EA:					;			|
	STA ($14)					;$01F9EA	|
	INC $14						;$01F9EC	|
	BNE label_01F9F2			;$01F9EE	|
	INC $15						;$01F9F0	|
label_01F9F2:					;			|
	LDY #$0000					;$01F9F2	|
label_01F9F5:					;			|
	LDA $3700,Y					;$01F9F5	|
	BNE label_01F9FD			;$01F9F8	|
	TXA							;$01F9FA	|
	BNE label_01FA03			;$01F9FB	|
label_01F9FD:					;			|
	LDX #$0000					;$01F9FD	|
	CLC							;$01FA00	|
	ADC #$B6					;$01FA01	|
label_01FA03:					;			|
	STA ($14),Y					;$01FA03	|
	INY							;$01FA05	|
	CPY #$0005					;$01FA06	|
	BCC label_01F9F5			;$01FA09	|
	LDA $3700,Y					;$01FA0B	|
	CLC							;$01FA0E	|
	ADC #$B6					;$01FA0F	|
	STA ($14),Y					;$01FA11	|
	INY							;$01FA13	|
	LDA $32EA					;$01FA14	|
	CMP #$03					;$01FA17	|
	BEQ label_01FA1F			;$01FA19	|
	LDA #$B6					;$01FA1B	|
	STA ($14),Y					;$01FA1D	|
label_01FA1F:					;			|
	REP #$20					;$01FA1F	|
	INC $00B1					;$01FA21	|
	RTS							;$01FA24	|



label_01FA25:					;-----------| Subroutine to handle Kirby's powerup icon.
	LDX $7388					;$01FA25	|\ Branch if no icon override in place.
	BEQ label_01FA6B			;$01FA28	|/
	LDA $738A					;$01FA2A	|\ 
	BEQ label_01FA39			;$01FA2D	|| Branch if the override timer is already 0 or hasn't run out yet.
	DEC $738A					;$01FA2F	||
	BNE label_01FA39			;$01FA32	|/
	STZ $7388					;$01FA34	| Timer ran out, so clear the override...
	BRA label_01FA6B			;$01FA37	| ...and branch down to draw the normal icon.

label_01FA39:					;```````````| Powerup icon is being overridden.
	SEP #$10					;$01FA39	|
	CPX $7389					;$01FA3B	|\ 
	BEQ label_01FA68			;$01FA3E	|| Return if the image hasn't changed.
	STX $7389					;$01FA40	|/
	TXA							;$01FA43	|\ If the new image is 0, branch to the normal icon routine?
	BEQ label_01FA6B			;$01FA44	|/  This shouldn't happen though, so essentially unused.
	AND #$00FF					;$01FA46	|\ 
	CMP #$000E					;$01FA49	|| If the image is set to 0x0E+, branch to switch it to 0x1C (a white box) instead.
	BCS label_01FA59			;$01FA4C	|/
	CLC							;$01FA4E	|\ Increment index for the icon.
	ADC #$0020					;$01FA4F	|/
	BRA label_01FA81			;$01FA52	| Done, now go upload the icon.


label_01FA54:					;```````````| Powerup image is 00 and not being overwritten; turn it white instead. 
	SEP #$20					;$01FA54	|
	STA $7385					;$01FA56	|
label_01FA59:					;			|
	REP #$30					;$01FA59	|
	LDX #$001C					;$01FA5B	|\ 
	LDA #$7FFF					;$01FA5E	||
label_01FA61:					;			||
	STA $1539,X					;$01FA61	|| Change colors $11-$1F to white.
	DEX							;$01FA64	||
	DEX							;$01FA65	||
	BPL label_01FA61			;$01FA66	|/
label_01FA68:					;			|
	REP #$30					;$01FA68	|
	RTS							;$01FA6A	|

label_01FA6B:					;```````````| Powerup icon is not being overridden; draw the normal one.
	LDA $7384					;$01FA6B	|\ 
	XBA							;$01FA6E	|| Return if the powerup icon hasn't changed.
	CMP $7384					;$01FA6F	||
	BEQ label_01FA68			;$01FA72	|/
	XBA							;$01FA74	|\ 
	AND #$00FF					;$01FA75	|| If the new image is 0, white out the powerup's colors instead and return.
	BEQ label_01FA54			;$01FA78	|/
	CMP #$0021					;$01FA7A	|\ If the image is >= 0x21, return.
	BCS label_01FA68			;$01FA7D	|/
	SEP #$10					;$01FA7F	|
label_01FA81:					;```````````| All icons join back up to actually draw it. A = index to use.
	TAX							;$01FA81	|
	LDA $3012					;$01FA82	|\ 
	CMP #$7D7F					;$01FA85	||
	BCS label_01FA68			;$01FA88	|| If the decompression buffer is full,
	LDA $3019					;$01FA8A	||  or too much data is being uploaded,
	CLC							;$01FA8D	||  wait until the next frame to update.
	ADC #$02E6					;$01FA8E	||
	CMP $301B					;$01FA91	||
	BCS label_01FA68			;$01FA94	|/
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
	STA $37						;$01FAEC	||/
	JSL WriteToDMABuffer		;$01FAEE	|/
	RTS							;$01FAF2	|



label_01FAF3:					;-----------| Subroutine to handle the partner's icon.
	LDY $6240					;$01FAF3	|\ Return if no partner is active?
	BMI label_01FB33			;$01FAF6	|/
	LDA $738C					;$01FAF8	|\ Return if the partner has been stolen by T.A.C. and already had its image switched.
	BMI label_01FB33			;$01FAFB	|/
	AND #$00FF					;$01FAFD	|\ 
	BEQ label_01FB10			;$01FB00	||
	SEP #$20					;$01FB02	||
	LDA #$FF					;$01FB04	|| If the partner has been stolen by T.A.C, use image 0x15.
	STA $738D					;$01FB06	||
	LDA #$15					;$01FB09	||| Image for when the partner is stolen by T.A.C.
	STA $7386					;$01FB0B	||
	REP #$20					;$01FB0E	|/
label_01FB10:					;			|
	LDA $7386					;$01FB10	|\ 
	XBA							;$01FB13	|| Return if the partner icon hasn't changed.
	CMP $7386					;$01FB14	||
	BEQ label_01FB33			;$01FB17	|/
	XBA							;$01FB19	|\ 
	AND #$00FF					;$01FB1A	|| If non-zero, branch to draw the image. Else, continue below to turn the image white.
	BNE label_01FB34			;$01FB1D	|/
	SEP #$20					;$01FB1F	|
	STA $7385					;$01FB21	|
	REP #$20					;$01FB24	|
	LDX #$001C					;$01FB26	|\ 
	LDA #$7FFF					;$01FB29	||
label_01FB2C:					;			||
	STA $1559,X					;$01FB2C	|| Change colors $21-$2F to white.
	DEX							;$01FB2F	||
	DEX							;$01FB30	||
	BPL label_01FB2C			;$01FB31	|/
label_01FB33:					;			|
	RTS							;$01FB33	|

label_01FB34:					;```````````| Partner image is not white.
	LDA $3012					;$01FB34	|\ 
	CMP #$7D7F					;$01FB37	||
	BCS label_01FB33			;$01FB3A	|| If the decompression buffer is full,
	LDA $3019					;$01FB3C	||  or too much data is being uploaded,
	CLC							;$01FB3F	||  wait until the next frame to update.
	ADC #$02E6					;$01FB40	||
	CMP $301B					;$01FB43	||
	BCS label_01FB33			;$01FB46	|/
	LDA $7386					;$01FB48	|\ 
	AND #$00FF					;$01FB4B	|| Also return if the icon ID is >= 0x16.
	CMP #$0016					;$01FB4E	||
	BCS label_01FB33			;$01FB51	|/
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
	LDY #$210F					;$01FB6D	||
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
	STA $37						;$01FBAA	||
	JSL WriteToDMABuffer		;$01FBAC	|/
	RTS							;$01FBB0	|



WriteStatusPal:					;-----------| Subroutine to write N colors to the status bar palette starting at a specified color.
	STA $14						;$01FBB1	|  A = Lower 16 bits of source, X = Upper 8 bits of source
	STX $16						;$01FBB3	|  Y = Starting color (high byte) and number of colors (low byte)
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
  .loop:						;			|
	LDA [$14],Y					;$01FBC7	|\ 
	STA ($18),Y					;$01FBC9	||
	DEY							;$01FBCB	|| Copy all the colors.
	DEY							;$01FBCC	||
	BPL .loop					;$01FBCD	|/
	RTL							;$01FBCF	|



label_01FBD0:					;-----------| Subroutine which most likely checks whether to update Kirby's HP bar.
	STX $14						;$01FBD0	|
	LDA $737C					;$01FBD2	|
	BPL label_01FBDA			;$01FBD5	|
	LDA #$0000					;$01FBD7	|
label_01FBDA:					;			|
	TAX							;$01FBDA	|
	BNE label_01FBE2			;$01FBDB	|
	INC $00DB					;$01FBDD	|
	BRA label_01FBE5			;$01FBE0	|

label_01FBE2:
	STZ $00DB					;$01FBE2	|
label_01FBE5:					;			|
	CMP $7380					;$01FBE5	|
	BCC label_01FBED			;$01FBE8	|
	LDA $7380					;$01FBEA	|
label_01FBED:					;			|
	STA $49						;$01FBED	|
	LDA $7380					;$01FBEF	|
	STA $4B						;$01FBF2	|
	LDA #$FD52					;$01FBF4	|\ 
	LDX #$0001					;$01FBF7	|| Wait for the SA-1 chip to execute $01FD52.
	JSL SNES_ExecuteSA1			;$01FBFA	|/
	LDA $00BB					;$01FBFE	|
	CMP #$FFFF					;$01FC01	|
	BNE label_01FC0A			;$01FC04	|
	LDA $49						;$01FC06	|
	BRA label_01FC32			;$01FC08	|

label_01FC0A:
	CMP $49						;$01FC0A	|
	BNE label_01FC16			;$01FC0C	|
	STZ $00CF					;$01FC0E	|
	STZ $00D5					;$01FC11	|
	CLC							;$01FC14	|
	RTS							;$01FC15	|

label_01FC16:
	AND #$7FFF					;$01FC16	|
	CMP $49						;$01FC19	|
	BEQ label_01FC32			;$01FC1B	|
	BCS label_01FC2B			;$01FC1D	|
	JSR label_01FC43			;$01FC1F	|
	INC $00CF					;$01FC22	|
	STZ $00D5					;$01FC25	|
	INC A						;$01FC28	|
	BRA label_01FC32			;$01FC29	|

label_01FC2B:
	STZ $00CF					;$01FC2B	|
	INC $00D5					;$01FC2E	|
	DEC A						;$01FC31	|
label_01FC32:					;			|
	STA $00BB					;$01FC32	|
	STZ $00E1					;$01FC35	|
	CMP #$000E					;$01FC38	|
	BCS label_01FC40			;$01FC3B	|
	INC $00E1					;$01FC3D	|
label_01FC40:					;			|
	JMP $FD35					;$01FC40	|


label_01FC43:					;```````````| Subroutine used by the above.
	PHA							;$01FC43	|
	LDA $305F					;$01FC44	|
	AND #$0080					;$01FC47	|
	BNE label_01FC60			;$01FC4A	|
	LDA $7A97					;$01FC4C	|
	BNE label_01FC60			;$01FC4F	|
	LDA $3094					;$01FC51	|
	AND #$0003					;$01FC54	|
	BNE label_01FC60			;$01FC57	|
	LDA #$0046					;$01FC59	|
	JSL $00D12D					;$01FC5C	|
label_01FC60:					;			|
	PLA							;$01FC60	|
	RTS							;$01FC61	|



label_01FC62:					;-----------| Subroutine which most likely checks whether to update the partner's HP bar.
	STX $14						;$01FC62	|
	LDA $737E					;$01FC64	|
	BPL label_01FC6C			;$01FC67	|
	LDA #$0000					;$01FC69	|
label_01FC6C:					;			|
	TAX							;$01FC6C	|
	BNE label_01FC74			;$01FC6D	|
	INC $00DD					;$01FC6F	|
	BRA label_01FC77			;$01FC72	|

label_01FC74:
	STZ $00DD					;$01FC74	|
label_01FC77:					;			|
	CMP $7382					;$01FC77	|
	BCC label_01FC7F			;$01FC7A	|
	LDA $7382					;$01FC7C	|
label_01FC7F:					;			|
	STA $49						;$01FC7F	|
	LDA $7382					;$01FC81	|
	STA $4B						;$01FC84	|
	LDA #$FD52					;$01FC86	|\ 
	LDX #$0001					;$01FC89	|| Wait for the SA-1 chip to execute $01FD52.
	JSL SNES_ExecuteSA1			;$01FC8C	|/
	LDA $00BD					;$01FC90	|
	CMP #$FFFF					;$01FC93	|
	BNE label_01FC9C			;$01FC96	|
	LDA $49						;$01FC98	|
	BRA label_01FCC4			;$01FC9A	|

label_01FC9C:
	CMP $49						;$01FC9C	|
	BNE label_01FCA8			;$01FC9E	|
	STZ $00D1					;$01FCA0	|
	STZ $00D7					;$01FCA3	|
	CLC							;$01FCA6	|
	RTS							;$01FCA7	|

label_01FCA8:
	AND #$7FFF					;$01FCA8	|
	CMP $49						;$01FCAB	|
	BEQ label_01FCC4			;$01FCAD	|
	BCS label_01FCBD			;$01FCAF	|
	JSR label_01FC43			;$01FCB1	|
	INC $00D1					;$01FCB4	|
	STZ $00D7					;$01FCB7	|
	INC A						;$01FCBA	|
	BRA label_01FCC4			;$01FCBB	|

label_01FCBD:
	STZ $00D1					;$01FCBD	|
	INC $00D7					;$01FCC0	|
	DEC A						;$01FCC3	|
label_01FCC4:					;			|
	STA $00BD					;$01FCC4	|
	STZ $00E3					;$01FCC7	|
	CMP #$000E					;$01FCCA	|
	BCS label_01FCD2			;$01FCCD	|
	INC $00E3					;$01FCCF	|
label_01FCD2:					;			|
	JMP label_01FD35			;$01FCD2	|



label_01FCD5:					;-----------| Subroutine which most likely checks whether to update the boss's HP bar.
	LDA $7A1B					;$01FCD5	|\ Branch if a boss is actually active.
	BPL label_01FCE2			;$01FCD8	|/
label_01FCDA:					;			|
	STZ $00D3					;$01FCDA	|
	STZ $00D9					;$01FCDD	|
	CLC							;$01FCE0	|
	RTS							;$01FCE1	|

label_01FCE2:
	BNE label_01FCE9			;$01FCE2	|
	INC $00DF					;$01FCE4	|
	BRA label_01FCEC			;$01FCE7	|

label_01FCE9:
	STZ $00DF					;$01FCE9	|
label_01FCEC:					;			|
	STX $14						;$01FCEC	|
	CMP $7A1D					;$01FCEE	|
	BCC label_01FCF6			;$01FCF1	|
	LDA $7A1D					;$01FCF3	|
label_01FCF6:					;			|
	STA $49						;$01FCF6	|
	LDA $7A1D					;$01FCF8	|
	STA $4B						;$01FCFB	|
	LDA #$FD52					;$01FCFD	|\ 
	LDX #$0001					;$01FD00	|| Wait for the SA-1 chip to execute $01FD52.
	JSL SNES_ExecuteSA1			;$01FD03	|/
	LDA $7A1F					;$01FD07	|
	BPL label_01FD11			;$01FD0A	|
	AND #$7FFF					;$01FD0C	|
	BRA label_01FD27			;$01FD0F	|

label_01FD11:
	CMP $49						;$01FD11	|
	BEQ label_01FCDA			;$01FD13	|
	BCS label_01FD20			;$01FD15	|
	INC $00D3					;$01FD17	|
	STZ $00D9					;$01FD1A	|
	INC A						;$01FD1D	|
	BRA label_01FD27			;$01FD1E	|

label_01FD20:
	STZ $00D3					;$01FD20	|
	INC $00D9					;$01FD23	|
	DEC A						;$01FD26	|
label_01FD27:					;			|
	STA $7A1F					;$01FD27	|
	STZ $00E5					;$01FD2A	|
	CMP #$000E					;$01FD2D	|
	BCS label_01FD35			;$01FD30	|
	INC $00E5					;$01FD32	|
label_01FD35:					;			|
	LDX #$0006					;$01FD35	|
	SEP #$20					;$01FD38	|
label_01FD3A:					;			|
	TAY							;$01FD3A	|
	CMP #$08					;$01FD3B	|
	BCC label_01FD41			;$01FD3D	|
	LDA #$08					;$01FD3F	|
label_01FD41:					;			|
	STA $00,X					;$01FD41	|
	TYA							;$01FD43	|
	SEC							;$01FD44	|
	SBC #$08					;$01FD45	|
	BCS label_01FD4B			;$01FD47	|
	LDA #$00					;$01FD49	|
label_01FD4B:					;			|
	DEX							;$01FD4B	|
	BPL label_01FD3A			;$01FD4C	|
	REP #$20					;$01FD4E	|
	SEC							;$01FD50	|
	RTS							;$01FD51	|



label_01FD52:					;-----------| SA-1 subroutine called in a couple of the above routines.
	LDY $4B						;$01FD52	|
	CPY $49						;$01FD54	|
	BNE label_01FD5E			;$01FD56	|
	LDA #$0038					;$01FD58	|
	STA $49						;$01FD5B	|
	RTL							;$01FD5D	|

label_01FD5E:
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



DATA_01FF54:					;$01FF54	| DMA table.
	db $03 : dw $0940 : dl $7E2000 : dw $5B60		; 2-byte DMA; 0x940 bytes from $7E2000 to $5B60.
	db $06 : dw $0500 : dl $01FF65 : dw $58E0		; 2-byte fixed DMA; 0x500 bytes from $01FF65 ($FF) to $58E0.
	db $FF

DATA_01FF65:					;$01FF65	| Fixed-transfer DMA source used by the above table.
	db $FF



DATA_01FF66:					;$01FF66	| Pointers to character palettes for the textboxes in Revenge of Meta-Knight.
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

DATA_01FF96:					;$01FF96	| Pointers to character images for the textboxes in Revenge of Meta-Knight.
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





Empty01FFE7:					;$01FFE7	| Empty.
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF