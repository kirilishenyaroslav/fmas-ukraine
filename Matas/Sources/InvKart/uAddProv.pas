{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                              Инвентарная картотека                           }
{                                                                              }
{               (c) Шамарин Ю.В., Данильченко А.Н.     2004-2007               }
{                                                                              }
unit uAddProv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxMaskEdit, cxButtonEdit, MainInvKartForm, 
  uOperacii, cxGroupBox, GlobalSPR, ActnList, Kernel, ibase, uResources;

type
  TfmAddProv = class(TForm)
    ActionList1: TActionList;
    Action1: TAction;
    ButtonEdit_DB_Kekv: TcxButtonEdit;
    Label7: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    ButtonEdit_DB_SM: TcxButtonEdit;
    Label1: TLabel;
    Label3: TLabel;
    cxTextEditSumma: TcxTextEdit;
    cxButtonAdd: TcxButton;
    cxButtonCansel: TcxButton;
    ButtonEdit_DB_RZ: TcxTextEdit;
    ButtonEdit_DB_ST: TcxTextEdit;
    cxButtonEdit1: TcxButtonEdit;
    Label2: TLabel;
    procedure cxButtonCanselClick(Sender: TObject);
    procedure cxTextEditSummaKeyPress(Sender: TObject; var Key: Char);
    procedure cxButtonEditDebetPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ButtonEdit_DB_SMKeyPress(Sender: TObject; var Key: Char);
    procedure Action1Execute(Sender: TObject);
    procedure ButtonEdit_DB_RZKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonEdit_DB_ST1KeyPress(Sender: TObject; var Key: Char);
    procedure ButtonEdit_DB_KekvKeyPress(Sender: TObject; var Key: Char);

    procedure ButtonEdit_DB_KekvPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ButtonEdit_DB_STKeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEditSummaExit(Sender: TObject);
  private
        FlagNaAdd : boolean;
        haed_form : TfmMainIvKartForm;
        uchet     : integer;
        id_debet, id_kredit : int64;
        deb_name, kred_name, summ_value : string;
        mayachok  : Integer;
        mode_on   : integer;
        date_doc  : Tdate;
        id_db_smeta  : int64;
        id_db_razdel : int64;
        id_db_statya : int64;

        DB_ID_KEKV   : int64;
        DB_NAME_KEKV : string;
        DB_KOD_KEKV  : Integer;

        DB_NAME_SM   : string;
        DB_NAME_RZ   : string;
        DB_NAME_ST   : string;

        DB_KOD_SM    : Integer;
        DB_KOD_RZ    : Integer;
        DB_KOD_ST    : Integer;

        long_pole : string;
        prap_flag, d, dk : integer;
        zpt, zpt1 : string;
  public
    ResultArray : Variant;
  end;

function GetProv(AOwner:TComponent; fg : Boolean; mfor : TfmMainIvKartForm;  id_debil, id_kredil : Int64; debil, kredil, sumashed : String; sm, rz, st, kekv : String; Date_doc : Tdate; id_sm, id_rz, id_st, id_kek : int64):Variant;

implementation

{$R *.dfm}
function GetProv(AOwner:TComponent; fg : Boolean; mfor : TfmMainIvKartForm;  id_debil, id_kredil : int64; debil, kredil, sumashed : String; sm, rz, st, kekv : String; Date_doc : Tdate; id_sm, id_rz, id_st, id_kek : int64):Variant;
var
 form  : TfmAddProv;
 ds, i : integer;
begin
      form           := TfmAddProv.Create(AOwner);
      form.FlagNaAdd := fg;
      form.haed_form := mfor;
      form.Date_doc  := Date_doc;

      if (form.FlagNaAdd = true) then
      begin
      form.DB_NAME_SM   := '';
      form.DB_NAME_RZ   := '';
      form.DB_NAME_ST   := '';
      form.DB_NAME_KEKV := '';

      form.DB_KOD_SM    := StrToInt(SM);
      form.DB_KOD_RZ    := StrToInt(RZ);
      form.DB_KOD_ST    := StrToInt(ST);
      form.DB_KOD_KEKV  := StrToInt(KEKV);
      form.id_db_smeta  := id_sm;
      form.id_db_razdel := id_rz;
      form.id_db_statya := id_st;
      form.DB_ID_KEKV   := id_kek;

      form.mode_on                := 1;
      form.Caption                := MAT_INV_system_name + 'Додання';
      form.cxButtonCansel.Caption := 'Вiдмiнити';
      form.cxButtonAdd.Caption    := 'Прийняти';
      form.mayachok               := 1;
      ds := 0;
      form.uchet := ds;

      form.ButtonEdit_DB_SM.Text  := sm;
      form.ButtonEdit_DB_RZ.Text  := rz;
      form.ButtonEdit_DB_ST.Text  := st;
      form.ButtonEdit_DB_KEKV.Text:= kekv;

      form.cxTextEditSumma.Text   := sumashed;

      //**********************************************************************
      form.prap_flag := 0;
      form.d         := 0;

        form.zpt := form.cxTextEditSumma.Text;
        form.zpt1 := form.zpt;
        form.long_pole:= IntToStr(form.cxTextEditSumma.GetTextLen);
        for i := 1 to StrToInt(form.long_pole) do
        begin
            if form.zpt[i] <> ',' then
            begin
               form.prap_flag := 1;
            end;
            if form.zpt[i] = ',' then
            begin
                form.prap_flag := 0;
                form.d:= 1;
            end;
            if form.zpt[StrToInt(form.long_pole)-1] = ',' then
            begin
                form.prap_flag := 0;
                if form.zpt[StrToInt(form.long_pole)] <> '0' then
                begin
                    form.d:= 2;
                end;
            end;
        end;
        if form.prap_flag = 1 then
            begin
                    form.zpt := form.zpt+',00';
                    form.cxTextEditSumma.Clear;
                    form.cxTextEditSumma.Text :=form.zpt;
                    form.prap_flag := 0;
            end;

        if (form.d = 1) and (form.prap_flag = 0) then
            begin
                form.cxTextEditSumma.Clear;
                form.cxTextEditSumma.Text :=form.zpt1;
            end;
        if (form.d = 2) and (form.prap_flag = 0) then
            begin
                form.cxTextEditSumma.Clear;
                form.cxTextEditSumma.Text :=form.zpt1+'0';
                form.d := 0;
            end;
        //**********************************************************************

      if (form.cxTextEditSumma.Text = '') then form.cxTextEditSumma.Text := '0,00';
      end else
      begin
          form.mode_on                := 1;
          form.Caption                := MAT_INV_system_name + 'Змiнення';
          form.cxButtonCansel.Caption := 'Вiдмiнити';
          form.cxButtonAdd.Caption    := 'Прийняти';
          form.mayachok               := 1;
          ds := 0;
          form.uchet := ds;
          form.cxTextEditSumma.Enabled:= true;
          form.Label3.Enabled         := true;

          form.DB_KOD_SM    := StrToInt(SM);
          form.DB_KOD_RZ    := StrToInt(RZ);
          form.DB_KOD_ST    := StrToInt(ST);
          form.DB_KOD_KEKV  := StrToInt(KEKV);
          form.id_db_smeta  := id_sm;
          form.id_db_razdel := id_rz;
          form.id_db_statya := id_st;
          form.DB_ID_KEKV   := id_kek;

          form.ButtonEdit_DB_SM.Text  := sm;
          form.ButtonEdit_DB_RZ.Text  := rz;
          form.ButtonEdit_DB_ST.Text  := st;
          form.ButtonEdit_DB_KEKV.Text:= kekv;

          form.cxTextEditSumma.Text   := sumashed;

      //**********************************************************************
      form.prap_flag := 0;
      form.d         := 0;

        form.zpt := form.cxTextEditSumma.Text;
        form.zpt1 := form.zpt;
        form.long_pole:= IntToStr(form.cxTextEditSumma.GetTextLen);
        for i := 1 to StrToInt(form.long_pole) do
        begin
            if form.zpt[i] <> ',' then
            begin
               form.prap_flag := 1;
            end;
            if form.zpt[i] = ',' then
            begin
                form.prap_flag := 0;
                form.d:= 1;
            end;
            if form.zpt[StrToInt(form.long_pole)-1] = ',' then
            begin
                form.prap_flag := 0;
                if form.zpt[StrToInt(form.long_pole)] <> '0' then
                begin
                    form.d:= 2;
                end;
            end;
        end;
        if form.prap_flag = 1 then
            begin
                    form.zpt := form.zpt+',00';
                    form.cxTextEditSumma.Clear;
                    form.cxTextEditSumma.Text :=form.zpt;
                    form.prap_flag := 0;
            end;

        if (form.d = 1) and (form.prap_flag = 0) then
            begin
                form.cxTextEditSumma.Clear;
                form.cxTextEditSumma.Text :=form.zpt1;
            end;
        if (form.d = 2) and (form.prap_flag = 0) then
            begin
                form.cxTextEditSumma.Clear;
                form.cxTextEditSumma.Text :=form.zpt1+'0';
                form.d := 0;
            end;
        //**********************************************************************

          if (form.cxTextEditSumma.Text = '') then form.cxTextEditSumma.Text := '0,00';
      end;

      form.ShowModal;
      GetProv := form.ResultArray;
      form.Free;
end;

procedure TfmAddProv.ButtonEdit_DB_SMKeyPress(Sender: TObject;
  var Key: Char);
begin
    Key := Chr(0);
end;

procedure TfmAddProv.ButtonEdit_DB_RZKeyPress(Sender: TObject;
  var Key: Char);
begin
        Key := Chr(0);
end;

procedure TfmAddProv.ButtonEdit_DB_ST1KeyPress(Sender: TObject;
  var Key: Char);
begin
        Key := Chr(0);
end;

procedure TfmAddProv.ButtonEdit_DB_KekvKeyPress(Sender: TObject;
  var Key: Char);
begin
        Key := Chr(0);
end;

procedure TfmAddProv.cxButtonCanselClick(Sender: TObject);
begin
    Close;
end;

procedure TfmAddProv.cxTextEditSummaKeyPress(Sender: TObject; var Key: Char);
var
   i: integer;
begin
    if Key = '.' then Key := DecimalSeparator;

    if (Key >= 'а') and (Key <= 'я') then
    begin
        Key := Chr(0);
    end;
    if Key = ',' then
    begin
        prap_flag := 0;
        zpt := cxTextEditSumma.Text;
        long_pole:= IntToStr(cxTextEditSumma.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] = ',' then
            begin
                Key := Chr(0);
            end;
        end;
    end;
    //********************  Конец проверки символов  ***************************

   { if cxTextEditSumma.Text = '' then cxTextEditSumma.Text := '0,00';
    if Key = '.' then Key := DecimalSeparator;
    if ((Ord(Key) < 48) or (Ord(Key) > 57)) and (Ord(Key) <> 8) and (Ord(Key) <> VK_DELETE) and (Key <> DecimalSeparator)
    then Key := Chr(0) else
    if  (Key = DecimalSeparator) and (Pos(DecimalSeparator, cxTextEditSumma.Text) > 0)
    then Key := Chr(0) else
    if ((Length(cxTextEditSumma.Text) - Pos(DecimalSeparator, cxTextEditSumma.Text) > 1) and (Pos(DecimalSeparator,cxTextEditSumma.Text) <> 0))
        and (Ord(Key) <> 8) and (Ord(Key) <> VK_DELETE) and ((Ord(Key) > 48) or (Ord(Key) < 57))
    then  Key := Chr(0); }
end;

procedure TfmAddProv.cxButtonEditDebetPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  id:variant;
begin
  id:=GlobalSPR.GetSmets(self, haed_form.DatabaseMain.Handle, Date_doc, psmRazdSt);
  if VarArrayDimCount(id)>0
  then begin
   if id[0]<>NULL
   then begin
    id_db_smeta:=id[0];
    id_db_razdel:=id[1];
    id_db_statya:=id[2];
    DB_NAME_SM:=id[6];
    DB_NAME_RZ:=id[4];
    DB_NAME_ST:=id[5];
    DB_KOD_SM:=id[9];
    DB_KOD_RZ:=id[7];
    DB_KOD_ST:=id[8];
    ButtonEdit_DB_SM.text := IntToStr(DB_KOD_SM);
    ButtonEdit_DB_RZ.text := IntToStr(DB_KOD_RZ);
    ButtonEdit_DB_ST.text := IntToStr(DB_KOD_ST);
   end;
  end;
end;

procedure TfmAddProv.Action1Execute(Sender: TObject);
begin
    if (id_db_smeta > 0) and (DB_ID_KEKV > 0) then
    begin
        ResultArray     := VarArrayCreate([0,14], varVariant);
        ResultArray[0]  := '';
        ResultArray[1]  := '';
        ResultArray[2]  := cxTextEditSumma.Text;
        ResultArray[3]  := '';
        ResultArray[4]  := '';
        ResultArray[5]  := mayachok;

        ResultArray[6]  := DB_KOD_SM;
        ResultArray[7]  := DB_KOD_RZ;
        ResultArray[8]  := DB_KOD_ST;
        ResultArray[9]  := DB_KOD_KEKV;
        ResultArray[10] := id_db_smeta;
        ResultArray[11] := id_db_razdel;
        ResultArray[12] := id_db_statya;
        ResultArray[13] := DB_ID_KEKV;
        Close;
    end;
end;

procedure TfmAddProv.ButtonEdit_DB_KekvPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  id:variant;
begin
 id:=GlobalSPR.GetKEKVSpr(self, haed_form.DatabaseMain.Handle, fsNormal, Date_doc, DEFAULT_ROOT_ID);
 if VarArrayDimCount(id)>0 then
 begin
  if id[0][0]<>NULL then begin
   DB_ID_KEKV:=id[0][0];
   DB_NAME_KEKV:=id[0][1];
   DB_KOD_KEKV:=id[0][2];
   ButtonEdit_DB_Kekv.Text:=IntToStr(DB_KOD_KEKV);
 end;
end;
end;

procedure TfmAddProv.ButtonEdit_DB_STKeyPress(Sender: TObject;
  var Key: Char);
begin
    Key := Chr(0);
end;

procedure TfmAddProv.cxTextEditSummaExit(Sender: TObject);
var
   i: integer;
   sexy : Currency;
begin
    //**********************************************************************
      prap_flag := 0;
      d         := 0;

        zpt := cxTextEditSumma.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditSumma.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
               prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
            begin
                prap_flag := 0;
                if zpt[StrToInt(long_pole)] <> '0' then
                begin
                    d:= 2;
                end;
            end;
        end;
        if prap_flag = 1 then
            begin
                    zpt := zpt+',00';
                    cxTextEditSumma.Clear;
                    cxTextEditSumma.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditSumma.Clear;
                cxTextEditSumma.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditSumma.Clear;
                cxTextEditSumma.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
end;

end.
