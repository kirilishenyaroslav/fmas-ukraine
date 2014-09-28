unit UV_RefreshSKR_FieldNames;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxLabel, cxLookAndFeelPainters,
  ExtCtrls, StdCtrls, cxButtons, cxTextEdit, cxMaskEdit, ActnList,
  Unit_ZGlobal_Consts, ZProc, IniFiles, ZMessages;

type
  TFUV_RefreshSkr_FieldNames = class(TForm)
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
    procedure ActionCancelExecute(Sender: TObject);
    procedure ActionYesExecute(Sender: TObject);
  private
    PLanguageIndex:byte;
  public
    constructor Create(AOwner:TComponent);reintroduce;
  end;

function TinFieldName:String;
function CardFieldName:String;

implementation

{$R *.dfm}

const Path_IniFile_Reports     = 'Reports\Zarplata\Reports.ini';
const Section_IniFile_RefreshCards = 'Reports\Zarplata\Reports.ini';

function TinFieldName:String;
var IniFile:TIniFile;
begin
 IniFile:=TIniFile.Create(ExtractFilePath(Application.ExeName)+Path_IniFile_Reports);
 Result := IniFile.ReadString(Section_IniFile_RefreshCards,'TIN','KOD_NAL');
 IniFile.Free;
end;

function CardFieldName:String;
var IniFile:TIniFile;
begin
 IniFile:=TIniFile.Create(ExtractFilePath(Application.ExeName)+Path_IniFile_Reports);
 Result := IniFile.ReadString(Section_IniFile_RefreshCards,'CARD','CARD_NO');
 IniFile.Free;
end;

constructor TFUV_RefreshSkr_FieldNames.Create(Aowner:TComponent);
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
 MaskEditNameFieldCard.Text := CardFieldName;
end;

procedure TFUV_RefreshSkr_FieldNames.ActionCancelExecute(Sender: TObject);
begin
ModalResult := mrCancel;
end;

procedure TFUV_RefreshSkr_FieldNames.ActionYesExecute(Sender: TObject);
var IniFile:TIniFile;
begin
if Trim(MaskEditNameFieldTin.Text)='' then
 begin
  ZShowMessage(Error_Caption[PLanguageIndex],FUV_RefreshSkr_FieldNamesTin_NotInput_Text[PLanguageIndex],mtInformation,[mbOK]);
  MaskEditNameFieldTin.SetFocus;
  Exit;
 end;
if Trim(MaskEditNameFieldTin.Text)='' then
 begin
  ZShowMessage(Error_Caption[PLanguageIndex],FUV_RefreshSkr_FieldNamesAcctCard_NotInput_Text[PLanguageIndex],mtInformation,[mbOK]);
  MaskEditNameFieldTin.SetFocus;
  Exit;
 end;

 try
  if  not FileExists(ExtractFilePath(Application.ExeName)+Path_IniFile_Reports) then
   FileCreate(ExtractFilePath(Application.ExeName)+Path_IniFile_Reports);

  IniFile:=TIniFile.Create(ExtractFilePath(Application.ExeName)+Path_IniFile_Reports);
  IniFile.WriteString(Section_IniFile_RefreshCards,'TIN',MaskEditNameFieldTin.Text);
  IniFile.WriteString(Section_IniFile_RefreshCards,'CARD',MaskEditNameFieldCard.Text);
  IniFile.Free;
 except
  on e:exception do
   begin
    ZShowMessage(Error_Caption[PLanguageIndex],e.Message,mtError,[mbOK]);
    Exit;
   end;
 end;

 ModalResult:=mrYes;
end;

end.
