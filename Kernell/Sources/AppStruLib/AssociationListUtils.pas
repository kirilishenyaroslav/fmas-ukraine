unit AssociationListUtils;

interface

uses AssociationListConst, SySUtils;

procedure G_CopyLongs(Source, Dest: Pointer; Count: Cardinal);
function G_CompareText(P1, P2: PChar): Integer; overload;
function G_CompareText(const S1, S2: string): Integer; overload;
function G_CompareStr(const S1, S2: string): Integer;
function G_EnlargeCapacity(Capacity: Integer): Integer;
function G_IncPowerOfTwo(L: LongWord): LongWord;
procedure G_ReverseLongs(P: Pointer; Count: Cardinal);
procedure G_MoveLongs(Source, Dest: Pointer; Count: Cardinal);
function G_NormalizeCapacity(Capacity: Integer): Integer;
function G_CeilPowerOfTwo(L: LongWord): LongWord;
procedure RaiseErrorFmt(const msg, S: string);
procedure RaiseError(const msg: string);

implementation

procedure RaiseError(const msg: string);
begin
  raise Exception.Create(msg);
end;


procedure RaiseErrorFmt(const msg, S: string);
begin
  raise Exception.CreateFmt(msg, [S]);
end;

function G_CeilPowerOfTwo(L: LongWord): LongWord;
asm
        TEST    EAX,EAX
        JE      @@zq
        BSR     EDX,EAX
        BSF     ECX,EAX
        CMP     EDX,ECX
        JNE     @@nx
        RET
@@zq:   MOV     EAX,1
        RET
@@nx:   INC     EDX
        TEST    EAX,$80000000
        JNE     @@ov
        MOV     EAX,DWORD PTR [EDX*4+BitMasks32]
        RET
@@ov:   XOR     EAX,EAX
end;


function G_NormalizeCapacity(Capacity: Integer): Integer;
begin
  if Capacity <= 64 then
  begin
    if Capacity <= 16 then
      Result := 16
    else
      Result := 64;
  end
  else if Capacity <= 1024 then
  begin
    if Capacity <= 256 then
      Result := 256
    else
      Result := 1024;
  end
  else
    Result := G_CeilPowerOfTwo(Capacity);
end;


procedure G_MoveLongs(Source, Dest: Pointer; Count: Cardinal);
asm
        CMP     EDX,EAX
        JA      @@bm
        JE      @@qt
        CALL    G_CopyLongs
@@qt:   RET
@@bm:   SHL     ECX,2
        ADD     EAX,ECX
        ADD     EDX,ECX
@@lp:   SUB     ECX,64
        JS      @@nx
        SUB     EAX,64
        SUB     EDX,64
        MOVQ    MM0,[EAX]
        MOVQ    MM1,[EAX+8]
        MOVQ    MM2,[EAX+16]
        MOVQ    MM3,[EAX+24]
        MOVQ    MM4,[EAX+32]
        MOVQ    MM5,[EAX+40]
        MOVQ    MM6,[EAX+48]
        MOVQ    MM7,[EAX+56]
        MOVQ    [EDX],MM0
        MOVQ    [EDX+8],MM1
        MOVQ    [EDX+16],MM2
        MOVQ    [EDX+24],MM3
        MOVQ    [EDX+32],MM4
        MOVQ    [EDX+40],MM5
        MOVQ    [EDX+48],MM6
        MOVQ    [EDX+56],MM7
        JMP     @@lp
@@nx:   ADD     ECX,64
        SUB     EAX,ECX
        SUB     EDX,ECX
        JMP     DWORD PTR @@wV[ECX]
@@wV:   DD      @@w00, @@w01, @@w02, @@w03
        DD      @@w04, @@w05, @@w06, @@w07
        DD      @@w08, @@w09, @@w10, @@w11
        DD      @@w12, @@w13, @@w14, @@w15
@@w15:  MOV     ECX,[EAX+56]
        MOV     [EDX+56],ECX
@@w14:  MOV     ECX,[EAX+52]
        MOV     [EDX+52],ECX
@@w13:  MOV     ECX,[EAX+48]
        MOV     [EDX+48],ECX
@@w12:  MOV     ECX,[EAX+44]
        MOV     [EDX+44],ECX
@@w11:  MOV     ECX,[EAX+40]
        MOV     [EDX+40],ECX
@@w10:  MOV     ECX,[EAX+36]
        MOV     [EDX+36],ECX
@@w09:  MOV     ECX,[EAX+32]
        MOV     [EDX+32],ECX
@@w08:  MOV     ECX,[EAX+28]
        MOV     [EDX+28],ECX
@@w07:  MOV     ECX,[EAX+24]
        MOV     [EDX+24],ECX
@@w06:  MOV     ECX,[EAX+20]
        MOV     [EDX+20],ECX
@@w05:  MOV     ECX,[EAX+16]
        MOV     [EDX+16],ECX
@@w04:  MOV     ECX,[EAX+12]
        MOV     [EDX+12],ECX
@@w03:  MOV     ECX,[EAX+8]
        MOV     [EDX+8],ECX
@@w02:  MOV     ECX,[EAX+4]
        MOV     [EDX+4],ECX
@@w01:  MOV     ECX,[EAX]
        MOV     [EDX],ECX
@@w00:  EMMS
end;

procedure G_ReverseLongs(P: Pointer; Count: Cardinal);
asm
        PUSH    EDI
        ADD     EAX,4
        LEA     EDI,[EAX+EDX*4-12]
@@lp:   CMP     EAX,EDI
        JGE     @@nx
        MOV     ECX,[EAX-4]
        MOV     EDX,[EDI+4]
        MOV     [EDI+4],ECX
        MOV     [EAX-4],EDX
        MOV     ECX,[EAX]
        MOV     EDX,[EDI]
        MOV     [EDI],ECX
        MOV     [EAX],EDX
        ADD     EAX,8
        SUB     EDI,8
        JMP     @@lp
@@nx:   SUB     EAX,4
        CMP     EAX,EDI
        JG      @@qt
        MOV     ECX,[EAX]
        MOV     EDX,[EDI+4]
        MOV     [EDI+4],ECX
        MOV     [EAX],EDX
@@qt:   POP     EDI
end;

function G_IncPowerOfTwo(L: LongWord): LongWord;
asm
        TEST    EAX,EAX
        JE      @@zq
        TEST    EAX,$80000000
        JNE     @@ov
        BSR     EDX,EAX
        INC     EDX
        MOV     EAX,DWORD PTR [EDX*4+BitMasks32]
        RET
@@zq:   MOV     EAX,1
        RET
@@ov:   XOR     EAX,EAX
end;

function G_EnlargeCapacity(Capacity: Integer): Integer;
begin
  if Capacity < 54 then
  begin
    if Capacity < 6 then
      Result := 16
    else
      Result := 64;
  end
  else if Capacity < 1014 then
  begin
    if Capacity < 246 then
      Result := 256
    else
      Result := 1024;
  end
  else
    Result := G_IncPowerOfTwo(Capacity + 10);
end;


function G_CompareStr(const S1, S2: string): Integer;
asm
        CMP     EAX,EDX
        JE      @@ex
        TEST    EAX,EAX
        JE      @@2
        TEST    EDX,EDX
        JE      @@3
        PUSH    EAX
        MOVZX   EAX,BYTE PTR [EAX]
        MOVZX   ECX,BYTE PTR [EDX]
        SUB     EAX,ECX
        JE      @@m
        POP     ECX
        RET
@@ex:   XOR     EAX,EAX
        RET
@@m:    POP     EAX
        INC     EAX
        INC     EDX
@@0:    TEST    CL,CL
        JE      @@5
        MOV     CL,BYTE PTR [EAX]
        MOV     CH,BYTE PTR [EDX]
        CMP     CL,CH
        JNE     @@ne
        TEST    CL,CL
        JE      @@5
        MOV     CL,BYTE PTR [EAX+1]
        MOV     CH,BYTE PTR [EDX+1]
        CMP     CL,CH
        JNE     @@ne
        TEST    CL,CL
        JE      @@5
        MOV     CL,BYTE PTR [EAX+2]
        MOV     CH,BYTE PTR [EDX+2]
        CMP     CL,CH
        JNE     @@ne
        TEST    CL,CL
        JE      @@5
        MOV     CL,BYTE PTR [EAX+3]
        MOV     CH,BYTE PTR [EDX+3]
        ADD     EAX,4
        ADD     EDX,4
        CMP     CL,CH
        JE      @@0
@@ne:   MOVZX   EAX,CL
        MOVZX   EDX,CH
        SUB     EAX,EDX
        RET
@@2:    TEST    EDX,EDX
        JE      @@7
        MOV     CH,BYTE PTR [EDX]
        TEST    CH,CH
        JE      @@7
        NOT     EAX
        RET
@@3:    MOV     CL,BYTE PTR [EAX]
        TEST    CL,CL
        JE      @@5
        MOV     EAX,1
        RET
@@5:    XOR     EAX,EAX
@@7:
end;


function G_CompareText(const S1, S2: string): Integer;
asm
        CMP     EAX,EDX
        JE      @@ex
        TEST    EAX,EAX
        JE      @@2
        TEST    EDX,EDX
        JE      @@3
        PUSH    ESI
        PUSH    EDI
        MOV     ESI,EAX
        MOV     EDI,EDX
        JMP     @@1
@@ex:   XOR     EAX,EAX
        RET
@@0:    TEST    AL,AL
        JE      @@4
        INC     ESI
        INC     EDI
@@1:    MOVZX   EAX,BYTE PTR [ESI]
        MOVZX   EDX,BYTE PTR [EDI]
        CMP     AL,DL
        JE      @@0
        MOV     AL,BYTE PTR [EAX+ToUpperChars]
        MOV     DL,BYTE PTR [EDX+ToUpperChars]
        CMP     AL,DL
        JE      @@0
        MOVZX   EAX,AL
        MOVZX   EDX,DL
        SUB     EAX,EDX
        POP     EDI
        POP     ESI
        RET
@@2:    TEST    EDX,EDX
        JE      @@7
        MOV     CH,BYTE PTR [EDX]
        TEST    CH,CH
        JE      @@7
        NOT     EAX
        RET
@@3:    MOV     CL,BYTE PTR [EAX]
        TEST    CL,CL
        JE      @@5
        MOV     EAX,1
        RET
@@4:    POP     EDI
        POP     ESI
@@5:    XOR     EAX,EAX
@@7:
end;

function G_CompareText(P1, P2: PChar): Integer;
asm
        CMP     EAX,EDX
        JE      @@ex
        TEST    EAX,EAX
        JE      @@2
        TEST    EDX,EDX
        JE      @@3
        PUSH    ESI
        PUSH    EDI
        MOV     ESI,EAX
        MOV     EDI,EDX
        JMP     @@1
@@ex:   XOR     EAX,EAX
        RET
@@0:    TEST    AL,AL
        JE      @@4
        INC     ESI
        INC     EDI
@@1:    MOVZX   EAX,BYTE PTR [ESI]
        MOVZX   EDX,BYTE PTR [EDI]
        CMP     AL,DL
        JE      @@0
        MOV     AL,BYTE PTR [EAX+ToUpperChars]
        MOV     DL,BYTE PTR [EDX+ToUpperChars]
        CMP     AL,DL
        JE      @@0
        MOVZX   EAX,AL
        MOVZX   EDX,DL
        SUB     EAX,EDX
        POP     EDI
        POP     ESI
        RET
@@2:    TEST    EDX,EDX
        JE      @@7
        MOV     CH,BYTE PTR [EDX]
        TEST    CH,CH
        JE      @@7
        NOT     EAX
        RET
@@3:    MOV     CL,BYTE PTR [EAX]
        TEST    CL,CL
        JE      @@5
        MOV     EAX,1
        RET
@@4:    POP     EDI
        POP     ESI
@@5:    XOR     EAX,EAX
@@7:
end;

procedure G_CopyLongs(Source, Dest: Pointer; Count: Cardinal);
asm
@@lp:   SUB     ECX,16
        JS      @@nx
        MOVQ    MM0,[EAX]
        MOVQ    MM1,[EAX+8]
        MOVQ    MM2,[EAX+16]
        MOVQ    MM3,[EAX+24]
        MOVQ    MM4,[EAX+32]
        MOVQ    MM5,[EAX+40]
        MOVQ    MM6,[EAX+48]
        MOVQ    MM7,[EAX+56]
        MOVQ    [EDX],MM0
        MOVQ    [EDX+8],MM1
        MOVQ    [EDX+16],MM2
        MOVQ    [EDX+24],MM3
        MOVQ    [EDX+32],MM4
        MOVQ    [EDX+40],MM5
        MOVQ    [EDX+48],MM6
        MOVQ    [EDX+56],MM7
        ADD     EAX,64
        ADD     EDX,64
        JMP     @@lp
@@nx:   ADD     ECX,16
        PUSH    EBX
        JMP     DWORD PTR @@wV[ECX*4]
@@wV:   DD      @@w00, @@w01, @@w02, @@w03
        DD      @@w04, @@w05, @@w06, @@w07
        DD      @@w08, @@w09, @@w10, @@w11
        DD      @@w12, @@w13, @@w14, @@w15
@@w15:  MOV     EBX,[EAX+ECX*4-60]
        MOV     [EDX+ECX*4-60],EBX
@@w14:  MOV     EBX,[EAX+ECX*4-56]
        MOV     [EDX+ECX*4-56],EBX
@@w13:  MOV     EBX,[EAX+ECX*4-52]
        MOV     [EDX+ECX*4-52],EBX
@@w12:  MOV     EBX,[EAX+ECX*4-48]
        MOV     [EDX+ECX*4-48],EBX
@@w11:  MOV     EBX,[EAX+ECX*4-44]
        MOV     [EDX+ECX*4-44],EBX
@@w10:  MOV     EBX,[EAX+ECX*4-40]
        MOV     [EDX+ECX*4-40],EBX
@@w09:  MOV     EBX,[EAX+ECX*4-36]
        MOV     [EDX+ECX*4-36],EBX
@@w08:  MOV     EBX,[EAX+ECX*4-32]
        MOV     [EDX+ECX*4-32],EBX
@@w07:  MOV     EBX,[EAX+ECX*4-28]
        MOV     [EDX+ECX*4-28],EBX
@@w06:  MOV     EBX,[EAX+ECX*4-24]
        MOV     [EDX+ECX*4-24],EBX
@@w05:  MOV     EBX,[EAX+ECX*4-20]
        MOV     [EDX+ECX*4-20],EBX
@@w04:  MOV     EBX,[EAX+ECX*4-16]
        MOV     [EDX+ECX*4-16],EBX
@@w03:  MOV     EBX,[EAX+ECX*4-12]
        MOV     [EDX+ECX*4-12],EBX
@@w02:  MOV     EBX,[EAX+ECX*4-8]
        MOV     [EDX+ECX*4-8],EBX
@@w01:  MOV     EBX,[EAX+ECX*4-4]
        MOV     [EDX+ECX*4-4],EBX
@@w00:  POP     EBX
        EMMS
end;


end.
