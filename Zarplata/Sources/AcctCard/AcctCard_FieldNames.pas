unit AcctCard_FieldNames;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxLabel, cxLookAndFeelPainters,
  ExtCtrls, StdCtrls, cxButtons, cxTextEdit, cxMaskEdit, ActnList,
  Unit_ZGlobal_Consts, ZProc, ZMessages, Registry;

type
  TFZAcctCard_FieldNames = class(TForm)
    LabelNameFieldTin: TcxLabel;
    LabelNameFieldAcctCard: TcxLabel;
    MaskEditNameFieldTin: TcxMaskEdit;
    MaskEditNameFieldCard: TcxMaskEdit;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    Bevel: TBevel;
    ActionList: TActionList;
    ActionYes: TAction;
    ActionCancel: TAction;
    LabelNameFieldFIO: TcxLabel;
    MaskEditNameFieldFIO: TcxMaskEdit;
    procedure ActionCancelExecute(Sender: TObject);
    procedure ActionYesExecute(Sender: TObject);
  private
    PLanguageIndex:byte;
  public
    constructor Create(AOwner:TComponent);reintroduce;
  end;

function TinFieldName:String;
function CardFieldName:String;
function FIOFieldName:string;

implementation

{$R *.dfm}

const Path_IniFile_Reports     = '\Software\Zarplata\AcctCard\FieldNames';

function TinFieldName:String;
var reg:TRegistry;
    Key:string;
begin
  Key := Path_IniFile_Reports;
  reg := TRegistry.Create;
  reg.RootKey:=HKEY_CURRENT_USER;
  if not reg.OpenKey(Key,False) then
  begin
    reg.free;
    Result:='KOD_NAL';
    Exit;
  end;
  if(reg.ReadString('TIN')<>null)then
    Result:=reg.ReadString('TIN')
  else
    Result:='KOD_NAL';
  reg.Free;
end;

function CardFieldName:String;
var reg:TRegistry;
    Key:string;
begin
  Key := Path_IniFile_Reports;
  reg := TRegistry.Create;
  reg.RootKey:=HKEY_CURRENT_USER;
  if not reg.OpenKey(Key,False) then
  begin
    reg.free;
    Result:='CARD_NO';
    Exit;
  end;
  if(reg.ReadString('CARD')<>null)then
    Result:=reg.ReadString('CARD')
  else
    Result:='CARD_NO';
  reg.Free;
end;

function FIOFieldName:String;
var reg:TRegistry;
    Key:string;
begin
  Key := Path_IniFile_Reports;
  reg := TRegistry.Create;
  reg.RootKey:=HKEY_CURRENT_USER;
  if not reg.OpenKey(Key,False) then
  begin
    reg.free;
    Result:='FIO';
    Exit;
  end;
  if(reg.ReadString('FIO')<>null)then
    Result:=reg.ReadString('FIO')
  else
    Result:='FIO';
  reg.Free;
end;

constructor TFZAcctCard_FieldNames.Create(Aowner:TComponent);
begin
 inherited Create(AOwner);
 PLanguageIndex:=LanguageIndex;
//******************************************************************************
 CancelBtn.Caption := CancelBtn_Caption[PLanguageIndex];
 CancelBtn.Hint := CancelBtn.Caption;
 YesBtn.Caption := YesBtn_Caption[PLanguageIndex];
 YesBtn.Hint := YesBtn.Caption;
 Caption := FUV_RefreshSkr_FieldNames_Caption[PLanguageIndex];
 LabelNameFieldTin.Caption := FUV_RefreshSkr_FieldNamesTin_Caption[PLanguageIndex];
 LabelNameFieldAcctCard.Caption := FUV_RefreshSkr_FieldNamesAcctCard_Caption[PLanguageIndex];
//******************************************************************************
 MaskEditNameFieldTin.Text := TinFieldName;
 MaskEditNameFieldCard.Text:= CardFieldName;
 MaskEditNameFieldFIO.Text := FIOFieldName;
end;

procedure TFZAcctCard_FieldNames.ActionCancelExecute(Sender: TObject);
begin
ModalResult := mrCancel;
end;

procedure TFZAcctCard_FieldNames.ActionYesExecute(Sender: TObject);
var reg:TRegistry;
    Key:string;
begin
if Trim(MaskEditNameFieldTin.Text)='' then
 begin
  ZShowMessage(Error_Caption[PLanguageIndex],FUV_RefreshSkr_FieldNamesTin_NotInput_Text[PLanguageIndex],mtInformation,[mbOK]);
  MaskEditNameFieldTin.SetFocus;
  Exit;
 end;
if Trim(MaskEditNameFieldCard.Text)='' then
 begin
  ZShowMessage(Error_Caption[PLanguageIndex],FUV_RefreshSkr_FieldNamesAcctCard_NotInput_Text[PLanguageIndex],mtInformation,[mbOK]);
  MaskEditNameFieldTin.SetFocus;
  Exit;
 end;

 Key := Path_IniFile_Reports;
 try
   reg := TRegistry.Create;
   reg.RootKey:=HKEY_CURRENT_USER;
   reg.OpenKey(Key,True);
   reg.WriteString('TIN',MaskEditNameFieldTin.Text);
   reg.WriteString('CARD',MaskEditNameFieldCard.Text);
   reg.WriteString('FIO',MaskEditNameFieldFIO.Text);
 finally
   reg.Free;
 end;
 ModalResult:=mrYes;
end;

end.
