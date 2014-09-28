{-$Id: CRC32.pas,v 1.1.1.1 2005/07/07 10:35:16 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                       Модуль "Расчет CRC"                                    }
{    Функции по расчету CRC а также перекодировке текста                       }
{    Ответственный: Кропов Валентин                                            }

unit CRC32;
interface

        function CalculateCRC32(var Buffer : String):longword;
        function CRCToString(ACRC:LongWord):string;
        function StringToOem(s: String): String;
        function StringToHalcyonASCII(S : String) : String;

implementation
uses sysutils, dialogs, windows;

type
 TData=array [0..0] of byte;

const
 HalcyonASCIITable:array [0..255] of Byte =
         ($00, $01, $02, $03,
          $04, $05, $06, $07, $08, $09, $0A, $0B, $0C, $0D, $0E, $0F, $10, $11, $12, $13,
          $14, $15, $16, $17, $18, $19, $1A, $1B, $1C, $1D, $1E, $1F, $20, $21, $22, $23,
          $24, $25, $26, $27, $28, $29, $2A, $2B, $2C, $2D, $2E, $2F, $30, $31, $32, $33,
          $34, $35, $36, $37, $38, $39, $3A, $3B, $3C, $3D, $3E, $3F, $40, $41, $42, $43,
          $44, $45, $46, $47, $48, $49, $4A, $4B, $4C, $4D, $4E, $4F, $50, $51, $52, $53,
          $54, $55, $56, $57, $58, $59, $5A, $5B, $5C, $5D, $5E, $5F, $60, $61, $62, $63,
          $64, $65, $66, $67, $68, $69, $6A, $6B, $6C, $6D, $6E, $6F, $70, $71, $72, $73,
          $74, $75, $76, $77, $78, $79, $7A, $7B, $7C, $7D, $7E, $7F, $B0, $B6, $B7, $B8,
          $B9, $BA, $C0, $C1, $C2, $C3, $C4, $C5, $C6, $C7, $C8, $C9, $CA, $CB, $CC, $CD,
          $CE, $CF, $D0, $D1, $D2, $D3, $D4, $D5, $D6, $D7, $D8, $D9, $FF, $F6, $F7, $DA,
          $FD, $DB, $B3, $15, $F0, $DC, $F2, $DD, $BF, $DE, $DF, $F4, $F8, $B1, $B2, $F9,
          $B4, $B5, $14, $FA, $F1, $FC, $F3, $BB, $BC, $BD, $BE, $F5, $80, $81, $82, $83,
          $84, $85, $86, $87, $88, $89, $8A, $8B, $8C, $8D, $8E, $8F, $90, $91, $92, $93,
          $94, $95, $96, $97, $98, $99, $9A, $9B, $9C, $9D, $9E, $9F, $A0, $A1, $A2, $A3,
          $A4, $A5, $A6, $A7, $A8, $A9, $AA, $AB, $AC, $AD, $AE, $AF, $E0, $E1, $E2, $E3,
          $E4, $E5, $E6, $E7, $E8, $E9, $EA, $EB, $EC, $ED, $EE, $EF);

const
 CRC32Table:array [0..255] of longword=
       ($00000000,$77073096,$EE0E612C,$990951BA,$076DC419,$706AF48F,$E963A535,$9E6495A3,
	$0EDB8832,$79DCB8A4,$E0D5E91E,$97D2D988,$09B64C2B,$7EB17CBD,$E7B82D07,$90BF1D91,
	$1DB71064,$6AB020F2,$F3B97148,$84BE41DE,$1ADAD47D,$6DDDE4EB,$F4D4B551,$83D385C7,
	$136C9856,$646BA8C0,$FD62F97A,$8A65C9EC,$14015C4F,$63066CD9,$FA0F3D63,$8D080DF5,
	$3B6E20C8,$4C69105E,$D56041E4,$A2677172,$3C03E4D1,$4B04D447,$D20D85FD,$A50AB56B,
	$35B5A8FA,$42B2986C,$DBBBC9D6,$ACBCF940,$32D86CE3,$45DF5C75,$DCD60DCF,$ABD13D59,
	$26D930AC,$51DE003A,$C8D75180,$BFD06116,$21B4F4B5,$56B3C423,$CFBA9599,$B8BDA50F,
	$2802B89E,$5F058808,$C60CD9B2,$B10BE924,$2F6F7C87,$58684C11,$C1611DAB,$B6662D3D,
	$76DC4190,$01DB7106,$98D220BC,$EFD5102A,$71B18589,$06B6B51F,$9FBFE4A5,$E8B8D433,
	$7807C9A2,$0F00F934,$9609A88E,$E10E9818,$7F6A0DBB,$086D3D2D,$91646C97,$E6635C01,
	$6B6B51F4,$1C6C6162,$856530D8,$F262004E,$6C0695ED,$1B01A57B,$8208F4C1,$F50FC457,
	$65B0D9C6,$12B7E950,$8BBEB8EA,$FCB9887C,$62DD1DDF,$15DA2D49,$8CD37CF3,$FBD44C65,
	$4DB26158,$3AB551CE,$A3BC0074,$D4BB30E2,$4ADFA541,$3DD895D7,$A4D1C46D,$D3D6F4FB,
	$4369E96A,$346ED9FC,$AD678846,$DA60B8D0,$44042D73,$33031DE5,$AA0A4C5F,$DD0D7CC9,
	$5005713C,$270241AA,$BE0B1010,$C90C2086,$5768B525,$206F85B3,$B966D409,$CE61E49F,
	$5EDEF90E,$29D9C998,$B0D09822,$C7D7A8B4,$59B33D17,$2EB40D81,$B7BD5C3B,$C0BA6CAD,
	$EDB88320,$9ABFB3B6,$03B6E20C,$74B1D29A,$EAD54739,$9DD277AF,$04DB2615,$73DC1683,
	$E3630B12,$94643B84,$0D6D6A3E,$7A6A5AA8,$E40ECF0B,$9309FF9D,$0A00AE27,$7D079EB1,
	$F00F9344,$8708A3D2,$1E01F268,$6906C2FE,$F762575D,$806567CB,$196C3671,$6E6B06E7,
	$FED41B76,$89D32BE0,$10DA7A5A,$67DD4ACC,$F9B9DF6F,$8EBEEFF9,$17B7BE43,$60B08ED5,
	$D6D6A3E8,$A1D1937E,$38D8C2C4,$4FDFF252,$D1BB67F1,$A6BC5767,$3FB506DD,$48B2364B,
	$D80D2BDA,$AF0A1B4C,$36034AF6,$41047A60,$DF60EFC3,$A867DF55,$316E8EEF,$4669BE79,
	$CB61B38C,$BC66831A,$256FD2A0,$5268E236,$CC0C7795,$BB0B4703,$220216B9,$5505262F,
	$C5BA3BBE,$B2BD0B28,$2BB45A92,$5CB36A04,$C2D7FFA7,$B5D0CF31,$2CD99E8B,$5BDEAE1D,
	$9B64C2B0,$EC63F226,$756AA39C,$026D930A,$9C0906A9,$EB0E363F,$72076785,$05005713,
	$95BF4A82,$E2B87A14,$7BB12BAE,$0CB61B38,$92D28E9B,$E5D5BE0D,$7CDCEFB7,$0BDBDF21,
	$86D3D2D4,$F1D4E242,$68DDB3F8,$1FDA836E,$81BE16CD,$F6B9265B,$6FB077E1,$18B74777,
	$88085AE6,$FF0F6A70,$66063BCA,$11010B5C,$8F659EFF,$F862AE69,$616BFFD3,$166CCF45,
	$A00AE278,$D70DD2EE,$4E048354,$3903B3C2,$A7672661,$D06016F7,$4969474D,$3E6E77DB,
	$AED16A4A,$D9D65ADC,$40DF0B66,$37D83BF0,$A9BCAE53,$DEBB9EC5,$47B2CF7F,$30B5FFE9,
	$BDBDF21C,$CABAC28A,$53B39330,$24B4A3A6,$BAD03605,$CDD70693,$54DE5729,$23D967BF,
	$B3667A2E,$C4614AB8,$5D681B02,$2A6F2B94,$B40BBE37,$C30C8EA1,$5A05DF1B,$2D02EF8D);

function StringToHalcyonASCII(S : String) : String;
var
        res_str : String;
        i, k : Integer;
begin
        for i := 1 to Length(S)
        do begin
                k := Ord(S[i]);
                res_str := res_str + Chr(HalcyonASCIITable[k]);
        end;

        result := res_str;
end;

function StringToOem(s: String): String;
var
        i : Integer;
begin

	if s = '' then
	begin
		Result := '';
		Exit;
	end;

        SetLength(Result, Length(s));

        CharToOem(PChar(s),PChar(result));

        for i := 1 to Length(result)
        do
                if Ord(result[i]) = $5F then result[i] := Chr($F9);
                          
end;

function CRCToString(ACRC:LongWord):string;
var
	n:array[1..4] of Byte;
	c:array[1..4] of Char;
	i:integer;
begin
	for i:=1 to 4 do begin
		n[i]:=ACRC mod 256;
		ACRC:=(ACRC-n[i]) div 256;
		c[i]:=Chr(n[i]);
	end;
	CRCToString := c[4]+c[3]+c[2]+c[1];
	//Result := c[1]+c[2]+c[3]+c[4];
end;

function CalculateCRC32(var Buffer : String):longword;
var
        i : Integer;
        _ax, _bx, _dx : Word;
        x: LongWord;
begin

        _ax := $FFFF;
        _dx := $FFFF;

        for i := 1 to Length(Buffer)
        do begin

                _bx := Ord(Buffer[i]);

                asm
                        push    ax
                        push    bx
                        push    dx

                        mov     ax, _ax
                        mov     bx, _bx
                        mov     dx, _dx

                        xor     bl,al               //; Calculate table index
                        shl     bx,1                //; Word offset
                        shl     bx,1                //; DWord offset

                        //; 0 -> DH -> DL -> AH -> AL -> bit bucket
                        mov     al,ah               //; Shr AH into AL
                        mov     ah,dl               //; Shr DL into AH
                        mov     dl,dh               //; Shr DH into DL
                        xor     dh,dh               //; DH = 0

                        mov     _ax, ax
                        mov     _bx, bx
                        mov     _dx, dx

                        pop     dx
                        pop     bx
                        pop     ax

                end;

                _bx := _bx div 4;
                //;Get new CRC from table
                x := Crc32Table[_bx];
                _ax := _ax xor (x mod $10000);    //; Get new CRC-LO
                _dx := _dx xor (x div $10000); //; Get new CRC-HI

        end;

        //_ax := not _ax;
        //_dx := not _dx;


        x := _dx shl 16 + _ax;
        result := x;
end;



begin
{ test;}
end.

