unit uPrK_Resources;

interface

uses Dialogs,StdCtrls, Classes;

Type TNamePrKViewWithFilter=(PrKViewKartkaAbit);
Type TNamePrKVuzLicense=(PrK_SP_MIN_PERELIK_SHIFR, PrK_SP_VUZ_LICENCE,  PrK_SP_PLAN_NABORA,
                         PrK_SP_EDUCORG,           PrK_SP_CEL_ZAMOVNIK, PrK_SP_PLAN_CEL_NABOR,
                         PrK_SP_EKZ_RASP);

Type TNamePrKSprav    =(PrK_SP_DERG_ZAKAZ,  PrK_SP_EXZFORM,       PrK_SP_GURTOG,         PrK_SP_IN_LANG,
                        PrK_SP_IS_COPY,     PrK_SP_KAT_PRI_X,     PrK_SP_KURS,           PrK_SP_LEVEL_VLADEN,
                        PrK_SP_MOVA,        PrK_SP_NPK,           PrK_SP_OLD_PRICH,      PrK_SP_PREDM,
                        PrK_SP_PRICH,       PrK_SP_PRIZN_ZACHISL, PrK_SP_RISH_TYPE,      PrK_SP_TYPE_DOK_OBR,
                        PrK_SP_TYPE_PEREKL, PrK_SP_TYPE_RAZN,     PrK_SP_TYPE_UCHZ,      PrK_SP_UKR_LANG,
                        PrK_SP_VID_DII,     PrK_SP_ZABR,
                        PrK_SP_FOB_PROT,    PrK_SP_GOD_NABORA,    PrK_SP_OCENKA,         PrK_SP_PREIM,
                        PrK_SP_FORM_OBUCH_KATEGORY,               PrK_SP_VID_DOG,        PrK_SP_MIN_PERELIK_PRIM,
                        PrK_SP_MIN_PERELIK_SPEC,                  PrK_SP_TYPE_KAT_STUD,  PrK_SP_SROK_OB,
                        PrK_SP_PREDM_u,     PrK_SP_POTOK,         PrK_SP_TYPE_DOP_DOK,   PrK_SP_ISPIT_VEDOM_TYPE,
                        PrK_SP_DOLGNOST_PK, PrK_SP_KAT_PRI_D,     PrK_SP_TYPE_ZACH,      PrK_SP_TYPE_DISC,
                        PrK_SP_DISC);
Type TNamePrKSpravEdit=(PrKSpravEditStandart,PrKSpravEditFobProt);
Type TWrongDataPrKSpr =(EmptyName,EmptyShortName,EmptyKod,ZerroKod,ThisKodExist,
                        EmptyNpp,ZerroNpp,ThisNppExist,EmptyVinitPadeg,
                        EmptyRoditPadeg,AllDataOk);
Type RejimPrK         =(AddPrK,ChangePrk,ViewPrK,DelPrK);

Type
  TDataPrKSprav = class
  private
    FKod: integer;
    FShortName: string;
    FName: string;
    FId: Int64;
    FNpp: integer;
    procedure SetKod(const Value: integer);
    procedure SetName(const Value: string);
    procedure SetShortName(const Value: string);
    procedure SetId(const Value: Int64);
    procedure SetNpp(const Value: integer);
  public
    constructor Create(aKodMax: Integer;aNppMax: Integer);overload;virtual;
    constructor Create(aId:int64; aName:String; aShortName:String;
                       aKod:integer;aNpp: Integer);overload;
     // Функция которая при добавлении(изм) данных проверяет их правильность
    function AddChangeData(aId:Int64; aName, aShortName:String;
                           aKod:integer; aAllDataKods: variant;
                           aNpp:integer; aAllDataNpps: variant):TWrongDataPrKSpr;

    Property Id   : Int64 read FId write SetId;
    Property Kod  : integer read FKod write SetKod;
    Property Npp  : integer read FNpp write SetNpp;
    Property Name : string read FName write SetName;
    Property ShortName :string read FShortName write SetShortName;
  end;


function SelectLanguage   : integer; stdcall;
function SelectShemaColor : integer; stdcall;
//exports  SelectLanguage;

function prkMessageDlg(const Caption : string; const Msg : string;const DlgType: TMsgDlgType;
                       const Buttons: TMsgDlgButtons;aIndexLanguage: integer) : word;stdcall;
//exports  agMessageDlg;

implementation

uses Forms,SysUtils,Windows,Variants,registry, uConstants,
     AccMgmt;
{ TDataPrKSprav }


constructor TDataPrKSprav.Create(aKodMax: Integer;aNppMax: Integer);
begin
   Kod       :=aKodMax+1;
   Npp       :=aNppMax+1;
   Name      :='';
   ShortName :='';
end;

function TDataPrKSprav.AddChangeData(aId:Int64; aName, aShortName: String;
    aKod: integer; aAllDataKods: variant;
    aNpp:integer; aAllDataNpps: variant): TWrongDataPrKSpr;
var
   i,razmer: integer;
begin
     if Trim(aName)='' then
      begin
           result:=EmptyName;
           exit;
      end;

     if Trim(aShortName)='' then
      begin
           result:=EmptyShortName;
           exit;
      end;

      if aKod=0 then
       begin
           result:=ZerroKod;
           exit;
       end;

      if aKod=Unassigned then
       begin
           result:=EmptyKod;
           exit;
       end;

       if aNpp=0 then
       begin
           result:=ZerroNpp;
           exit;
       end;

      if aNpp=Unassigned then
       begin
           result:=EmptyNpp;
           exit;
       end;

      if (aKod<>Kod)and(VarArrayDimCount(aAllDataKods)>0)  then
       begin
          razmer:=VarArrayHighBound(aAllDataKods, 1)-VarArrayLowBound(aAllDataKods, 1);
          for i:=0 to razmer do
           begin
              if  aAllDataKods[i]=aKod then
               begin
                 result:=ThisKodExist;
                 exit;
               end;
           end;
       end;

       if (aNpp<>Npp)and(VarArrayDimCount(aAllDataNpps)>0)  then
       begin
          razmer:=VarArrayHighBound(aAllDataNpps, 1)-VarArrayLowBound(aAllDataNpps, 1);
          for i:=0 to razmer do
           begin
              if  aAllDataNpps[i]=aNpp then
               begin
                 result:=ThisNppExist;
                 exit;
               end;
           end;
       end;


      Id       :=aId;
      Name     :=aName;
      ShortName:=aShortName;
      Kod      :=aKod;
      Npp      :=aNpp;

      result:=AllDataOk;
end;

constructor TDataPrKSprav.Create(aId: int64; aName, aShortName: String;
  aKod: integer;aNpp: Integer);
begin
   Id        :=aId;
   Kod       :=aKod;
   Npp       :=aNpp;
   Name      :=aName;
   ShortName :=aShortName;
end;

procedure TDataPrKSprav.SetId(const Value: Int64);
begin
  FId := Value;
end;

procedure TDataPrKSprav.SetKod(const Value: integer);
begin
  FKod := Value;
end;

procedure TDataPrKSprav.SetNpp(const Value: integer);
begin
  FNpp := Value;
end;

procedure TDataPrKSprav.SetName(const Value: string);
begin
  FName := Value;
end;

procedure TDataPrKSprav.SetShortName(const Value: string);
begin
  FShortName := Value;
end;


{ выбор языка:  0-украинский, 1-русский}

function SelectLanguage: integer;
var
    reg           :TRegistry;
    RegisterValue :integer;
begin
   //вслучае боков по умолчанию будет украинский язык
   RegisterValue:=0;
   //чтение из регистра
   reg:=TRegistry.Create;
     try
        reg.RootKey :=HKEY_CURRENT_USER;
        if reg.OpenKey('\Software\PrK\Languegies\',false) then
        begin
           RegisterValue:=reg.ReadInteger('Index');
        end;
     finally
         reg.Free;
     end;
     result:=RegisterValue;
end;

{ выбор цветовой схемы:  0-желтая, 1-голубая}

function SelectShemaColor : integer;
var
    reg           :TRegistry;
    RegisterValue :integer;
begin
   //вслучае боков по умолчанию будет желтая схема язык
   RegisterValue:=0;
   //чтение из регистра
   reg:=TRegistry.Create;
     try
        reg.RootKey :=HKEY_CURRENT_USER;
        if reg.OpenKey('\Software\PrK\ShemaColor\',false) then
        begin
           RegisterValue:=reg.ReadInteger('Color');
        end;
     finally
         reg.Free;
     end;
     result:=RegisterValue;
end;

{Переделанный MessageDlg}

function prkMessageDlg(const Caption : string; const Msg : string;
                       const DlgType: TMsgDlgType; const Buttons: TMsgDlgButtons;
                       aIndexLanguage: integer) : word;
var
 formD : TForm;
 i    : integer;
begin
 if Buttons = [] then begin
  Result := 0;
  exit;
 end;
 formD := CreateMessageDialog(Msg, DlgType, Buttons);
 formD.Caption := Caption;
 for i := 0 to formD.ComponentCount - 1 do if formD.Components[i] is TButton then begin
  if UpperCase(TButton(formD.Components[i]).Caption) = 'OK'     then TButton(formD.Components[i]).Caption := nMsgDlgOk[aIndexLanguage];
  if UpperCase(TButton(formD.Components[i]).Caption) = 'CANCEL' then TButton(formD.Components[i]).Caption := nMsgDlgCansel[aIndexLanguage];
  if UpperCase(TButton(formD.Components[i]).Caption) = '&YES'   then TButton(formD.Components[i]).Caption := nMsgDlgYes[aIndexLanguage];
  if UpperCase(TButton(formD.Components[i]).Caption) = '&NO'    then TButton(formD.Components[i]).Caption := nMsgDlgNo[aIndexLanguage];
  if UpperCase(TButton(formD.Components[i]).Caption) = '&ABORT' then TButton(formD.Components[i]).Caption := nMsgDlgAbort[aIndexLanguage];
  if UpperCase(TButton(formD.Components[i]).Caption) = '&RETRY' then TButton(formD.Components[i]).Caption := nMsgDlgRetry[aIndexLanguage];
  if UpperCase(TButton(formD.Components[i]).Caption) = '&IGNORE'then TButton(formD.Components[i]).Caption := nMsgDlgIgnore[aIndexLanguage];
  if UpperCase(TButton(formD.Components[i]).Caption) = '&ALL'   then TButton(formD.Components[i]).Caption := nMsgDlgAll[aIndexLanguage];
  if UpperCase(TButton(formD.Components[i]).Caption) = '&HELP'  then TButton(formD.Components[i]).Caption := nMsgDlgHelp[aIndexLanguage];
  if UpperCase(TButton(formD.Components[i]).Caption) = 'N&O TO ALL'  then TButton(formD.Components[i]).Caption := nMsgDlgNoToAll[aIndexLanguage];
  if UpperCase(TButton(formD.Components[i]).Caption) = 'YES TO &ALL' then TButton(formD.Components[i]).Caption := nMsgDlgYesToAll[aIndexLanguage];
 end;
 Result := formD.ShowModal;
end;  

end.
