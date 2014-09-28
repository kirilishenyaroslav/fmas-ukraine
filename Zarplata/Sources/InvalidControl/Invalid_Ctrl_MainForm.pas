//******************************************************************************
// Пакет для добавленя, изменения, удаления данных о свойствах людей
// параметры: ID - идентификатор, если добавление, то идентификатор человека, иначе
// идентификатор свойства человека.
//******************************************************************************
unit Invalid_Ctrl_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, StdCtrls, cxButtons, cxCalendar,
  cxTextEdit, cxMaskEdit, cxContainer, cxEdit, cxLabel, ExtCtrls,
  cxControls, cxGroupBox,ZMessages, ZProc,
  Unit_ZGlobal_Consts, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, DB, FIBDataSet, pFIBDataSet, ZTypes, IBase, ActnList, Invalid_Ctrl_DM;

type
  TFSp_Invalid_Control = class(TForm)
    IdentificationBox: TcxGroupBox;
    PeopleLabel: TcxLabel;
    PeopleEdit: TcxMaskEdit;
    PeriodBox: TcxGroupBox;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    Bevel1: TBevel;
    NoteLabel: TcxLabel;
    DateBegLabel: TcxLabel;
    DateBeg: TcxDateEdit;
    DateEndLabel: TcxLabel;
    DateEnd: TcxDateEdit;
    Actions: TActionList;
    ActionYes: TAction;
    NoteEdit: TcxMaskEdit;
    procedure CancelBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionYesExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure NoteEditKeyPress(Sender: TObject; var Key: Char);
  private
    Ins_Id_Man:LongWord;
    PParameter:TZCtrlWithHistoryParam;
    DM:TDM_Ctrl;
    PLanguageIndex:Byte;
  public
    constructor Create(AOwner: TComponent;DB_Handle:TISC_DB_HANDLE;AParameters:TZCtrlWithHistoryParam);reintroduce;
    property ID_Man:LongWord read Ins_Id_Man write Ins_Id_Man;
    property Parameter:TZCtrlWithHistoryParam read PParameter;
  end;

implementation

uses StrUtils;

{$R *.dfm}

constructor TFSp_Invalid_Control.Create(AOwner: TComponent;DB_Handle:TISC_DB_HANDLE;AParameters:TZCtrlWithHistoryParam);
begin
 inherited Create(AOwner);
 PParameter := AParameters;
 DM := TDM_Ctrl.Create(AOwner,DB_Handle,AParameters);
 PLanguageIndex:=LanguageIndex;
//******************************************************************************
 PeopleLabel.Caption           := LabelMan_Caption[PLanguageIndex];
 NoteLabel.Caption             := LabelNote_Caption[PLanguageIndex];
 DateBegLabel.Caption          := LabelDateBeg_Caption[PLanguageIndex]+' - ';
 DateEndLabel.Caption          := ' - '+AnsiLowerCase(LabelDateEnd_Caption[PLanguageIndex]);
 YesBtn.Caption                := YesBtn_Caption[PLanguageIndex];
 CancelBtn.Caption             := CancelBtn_Caption[PLanguageIndex];
//******************************************************************************
 case PParameter.ControlFormStyle of
  zcfsInsert:
   begin
    Caption            := Caption_Insert[PLanguageIndex];
    PeopleEdit.Text    := VarToStr(DM.DSetData.FieldValues['TN'])+' - '+VarToStr(DM.DSetData.FieldValues['FIO']);
    DateBeg.Date       := VarToDateTime(DM.DSetData['PERIOD_BEG']);
    DateEnd.Date       := VarToDateTime(DM.DSetData['PERIOD_END']);
   end;
  zcfsUpdate:
   begin
    Caption            := Caption_Update[PLanguageIndex];
    PeopleEdit.Text    := VarToStr(DM.DSetData.FieldValues['TN'])+' - '+VarToStr(DM.DSetData.FieldValues['FIO']);
    DateBeg.Date       := VarToDateTime(DM.DSetData['DATE_BEG']);
    DateEnd.Date       := VarToDateTime(DM.DSetData['DATE_END']);
    NoteEdit.Text      := VarToStr(DM.DSetData['NOTE']);
   end;
  zcfsShowDetails:
   begin
    Caption            := Caption_Detail[PLanguageIndex];
    PeopleEdit.Text    := VarToStr(DM.DSetData.FieldValues['TN'])+' - '+VarToStr(DM.DSetData.FieldValues['FIO']);
    DateBeg.Text       := VarToStr(DM.DSetData['DATE_BEG']);
    DateBeg.Date       := VarToDateTime(DM.DSetData['DATE_BEG']);
    DateEnd.Date       := VarToDateTime(DM.DSetData['DATE_END']);
    NoteEdit.Text      := VarToStr(DM.DSetData['NOTE']);
    PeriodBox.Enabled  := False;
    YesBtn.Visible     := False;
    CancelBtn.Caption  := ExitBtn_Caption[PLanguageIndex];
   end;
 end;
end;

procedure TFSp_Invalid_Control.CancelBtnClick(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TFSp_Invalid_Control.FormCreate(Sender: TObject);
begin
if PParameter.ControlFormStyle = zcfsDelete then
 begin
  if ZShowMessage(Caption_Delete[PLanguageIndex],DeleteRecordQuestion_Text[PLanguageIndex],mtConfirmation,[mbYes,mbNo])=mrYes then
   with DM do
   try
    StoredProc.Database := DB;
    StoredProc.Transaction := WriteTransaction;
    StoredProc.Transaction.StartTransaction;
    StoredProc.StoredProcName := 'Z_INVALID_D';
    StoredProc.Prepare;
    StoredProc.ParamByName('ID').AsInteger := PParameter.ID;
    StoredProc.ParamByName('USE_END').AsDateTime := PParameter.Use_DateTime;
    StoredProc.ExecProc;
    StoredProc.Transaction.Commit;
    ModalResult:=mrYes;
   except
    on E:Exception do
     begin
      ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
      StoredProc.Transaction.Rollback;
     end;
   end
  else
   ModalResult:=mrCancel;
 end;
end;

procedure TFSp_Invalid_Control.ActionYesExecute(Sender: TObject);
var ID:integer;
begin
 if DateBeg.Date>DateEnd.Date then
  begin
   ZShowMessage(Error_Caption[PLanguageIndex],ZeInputTerms_ErrorText[PLanguageIndex],mtWarning,[mbOK]);
   DateBeg.SetFocus;
  end
 else
  case PParameter.ControlFormStyle of
   zcfsInsert:
    with DM do
    try
     StoredProc.Database := DB;
     StoredProc.Transaction := WriteTransaction;
     StoredProc.Transaction.StartTransaction;
     StoredProc.StoredProcName := 'Z_INVALID_INSERT';
     StoredProc.Prepare;
     StoredProc.ParamByName('ID_MAN').AsInteger := PParameter.ID;
     StoredProc.ParamByName('DATE_BEG').AsDate  := StrToDate(DateBeg.Text);
     StoredProc.ParamByName('DATE_END').AsDate  := StrToDate(DateEnd.Text);
     StoredProc.ParamByName('NOTE').AsString    := NoteEdit.EditText;
     StoredProc.ExecProc;
     ID:=StoredProc.ParamByName('ID').AsInteger;
     PParameter.Use_DateTime := StoredProc.ParamByName('USE_END').AsDateTime;
     StoredProc.Transaction.Commit;
     PParameter.ID := ID;
     ModalResult:=mrYes;
    except
    on E:Exception do
     begin
      ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
      StoredProc.Transaction.Rollback;
     end;
    end;
   zcfsUpdate:
    with DM do
    try
     StoredProc.Database := DB;
     StoredProc.Transaction := WriteTransaction;
     StoredProc.Transaction.StartTransaction;
     StoredProc.StoredProcName := 'Z_INVALID_U';
     StoredProc.Prepare;
     StoredProc.ParamByName('ID').AsInteger := PParameter.ID;
     StoredProc.ParamByName('ID_MAN').AsInteger := DSetData.FieldValues['ID_MAN'];
     StoredProc.ParamByName('DATE_BEG').AsDate  := StrToDate(DateBeg.Text);
     StoredProc.ParamByName('DATE_END').AsDate  := StrToDate(DateEnd.Text);
     StoredProc.ParamByName('NOTE').AsString    := NoteEdit.EditText;
     StoredProc.ParamByName('USE_END').AsDateTime := PParameter.Use_DateTime;
     StoredProc.ExecProc;
     StoredProc.Transaction.Commit;
     ModalResult:=mrYes;
    except
    on E:Exception do
     begin
      ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
      StoredProc.Transaction.Rollback;
     end;
    end;
  end;
end;

procedure TFSp_Invalid_Control.FormDestroy(Sender: TObject);
begin
if DM<>nil then DM.Destroy;
end;

procedure TFSp_Invalid_Control.NoteEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if Length(NoteEdit.Text)>=400 then Key:=#0;
end;

end.
