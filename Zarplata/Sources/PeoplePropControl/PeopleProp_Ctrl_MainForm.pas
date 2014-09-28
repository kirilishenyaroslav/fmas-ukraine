//******************************************************************************
// Пакет для добавленя, изменения, удаления данных о свойствах людей
// параметры: ID - идентификатор, если добавление, то идентификатор человека, иначе
// идентификатор свойства человека.
//******************************************************************************
unit PeopleProp_Ctrl_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, StdCtrls, cxButtons, cxCalendar,
  cxTextEdit, cxMaskEdit, cxContainer, cxEdit, cxLabel, ExtCtrls,
  cxControls, cxGroupBox,ZMessages, ZProc,
  Unit_ZGlobal_Consts, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, DB, FIBDataSet, pFIBDataSet, ZTypes, IBase, ActnList, PeopleProp_Ctrl_DM,
  Dates, gr_uCommonProc;

type
  TFSp_People_Prop_Control = class(TForm)
    IdentificationBox: TcxGroupBox;
    PeopleLabel: TcxLabel;
    PeopleEdit: TcxMaskEdit;
    PeriodBox: TcxGroupBox;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    Bevel1: TBevel;
    PropLabel: TcxLabel;
    PropEdit: TcxLookupComboBox;
    DateBegLabel: TcxLabel;
    DateBeg: TcxDateEdit;
    DateEndLabel: TcxLabel;
    DateEnd: TcxDateEdit;
    Actions: TActionList;
    ActionYes: TAction;
    PrikazLabel: TcxLabel;
    PrikazEdit: TcxTextEdit;
    procedure CancelBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionYesExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    Ins_Id_Man:LongWord;
    PParameter:TZPeoplePropParameters;
    DM:TDM_Ctrl;
    PLanguageIndex:Byte;
    pNumPredpr:integer;
  public
    constructor Create(AOwner: TComponent;DB_Handle:TISC_DB_HANDLE;AParameters:TZPeoplePropParameters;Is_Grant: TZChildSystems);reintroduce;
    property ID_Man:LongWord read Ins_Id_Man write Ins_Id_Man;
    property Parameter:TZPeoplePropParameters read PParameter;
  end;

implementation

uses StrUtils;

{$R *.dfm}

constructor TFSp_People_Prop_Control.Create(AOwner: TComponent;DB_Handle:TISC_DB_HANDLE;AParameters:TZPeoplePropParameters;Is_Grant: TZChildSystems);
begin
 inherited Create(AOwner);
 PParameter := AParameters;
 DM := TDM_Ctrl.Create(AOwner,DB_Handle,AParameters,Is_Grant);
 PLanguageIndex:=LanguageIndex;
 pNumPredpr := StrToInt(VarToStrDef(ValueFieldZSetup(DB_Handle,'NUM_PREDPR'),'1'));
//******************************************************************************
 PeopleLabel.Caption           := LabelMan_Caption[PLanguageIndex];
 PropLabel.Caption             := GridClPropertyName_Caption[PLanguageIndex];
 DateBegLabel.Caption          := LabelDateBeg_Caption[PLanguageIndex]+' - ';
 DateEndLabel.Caption          := ' - '+AnsiLowerCase(LabelDateEnd_Caption[PLanguageIndex]);
 YesBtn.Caption                := YesBtn_Caption[PLanguageIndex];
 CancelBtn.Caption             := CancelBtn_Caption[PLanguageIndex];
//******************************************************************************
 PropEdit.Properties.ListFieldNames := 'NAME_PEOPLE_PROP';
 PropEdit.Properties.KeyFieldNames  :='ID_PEOPLE_PROP';
 PropEdit.Properties.DataController.DataSource := DM.DSourceProp;
 DateBeg.Properties.MaxDate := VarToDateTime(DM.DSetData['PERIOD_BEG']);
 DateBeg.Properties.MinDate := VarToDateTime(DM.DSetData['PERIOD_END']);
 DateEnd.Properties.MaxDate := VarToDateTime(DM.DSetData['PERIOD_BEG']);
 DateEnd.Properties.MinDate := VarToDateTime(DM.DSetData['PERIOD_END']);
//******************************************************************************
 case PParameter.ControlFormStyle of
  zcfsInsert:
   begin
    Caption            := ZPeoplePropCtrl_Caption_Insert[PLanguageIndex];
    PeopleEdit.Text    := VarToStr(DM.DSetData.FieldValues['TN'])+' - '+VarToStr(DM.DSetData.FieldValues['FIO']);
    if  Is_Grant=tsGrant then
      DateBeg.Date      :=strtodate(KodSetupToPeriod(grKodSetup(DB_Handle), 6))
    ELSE
     DateBeg.Date      := strtodate(KodSetupToPeriod(CurrentKodSetup(DB_Handle), 6));
    DateEnd.Date       := VarToDateTime(DM.DSetData['PERIOD_END']);
    if pNumPredpr=2 then     DateEnd.Date := StrToDate('31.12.9999');
   end;
  zcfsUpdate:
   begin
    Caption            := ZPeoplePropCtrl_Caption_Update[PLanguageIndex];
    PeopleEdit.Text    := VarToStr(DM.DSetData['FIO']);
    DateBeg.Date       := VarToDateTime(DM.DSetData['DATE_BEG']);
    DateEnd.Date       := VarToDateTime(DM.DSetData['DATE_END']);
    PropEdit.EditValue := DM.DSetData['ID_PEOPLE_PROP'];
    PrikazEdit.Text    := DM.DSetData['PRIKAZ'];
   end;
  zcfsShowDetails:
   begin
    Caption            := ZPeoplePropCtrl_Caption_Detail[PLanguageIndex];
    PeopleEdit.Text    := VarToStr(DM.DSetData['FIO']);
    DateBeg.Text       := VarToStr(DM.DSetData['DATE_BEG']);
    DateBeg.Date       := VarToDateTime(DM.DSetData['DATE_BEG']);
    DateEnd.Date       := VarToDateTime(DM.DSetData['DATE_END']);
    PropEdit.EditValue := DM.DSetData['ID_PEOPLE_PROP'];
    PrikazEdit.Text    :=DM.DSetData['PRIKAZ'];
    PeriodBox.Enabled  := False;
    YesBtn.Visible     := False;
    CancelBtn.Caption  := ExitBtn_Caption[PLanguageIndex];
   end;
 end;
end;

procedure TFSp_People_Prop_Control.CancelBtnClick(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TFSp_People_Prop_Control.FormCreate(Sender: TObject);
begin
if PParameter.ControlFormStyle = zcfsDelete then
 begin
  if ZShowMessage(ZPeoplePropCtrl_Caption_Delete[PLanguageIndex],DeleteRecordQuestion_Text[PLanguageIndex],mtConfirmation,[mbYes,mbNo])=mrYes then
   with DM do
   try
    StoredProc.Database := DB;
    StoredProc.Transaction := WriteTransaction;
    StoredProc.Transaction.StartTransaction;
    StoredProc.StoredProcName := 'Z_PEOPLE_PROP_DELETE';
    StoredProc.Prepare;
    StoredProc.ParamByName('ID').AsInteger := PParameter.ID;
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

procedure TFSp_People_Prop_Control.ActionYesExecute(Sender: TObject);
var ID:integer;
begin
if PropEdit.EditText = '' then
 begin
  ZShowMessage(Error_Caption[PLanguageIndex],ZeInputProp_Error_Text[PLanguageIndex],mtWarning,[mbOK]);
  PropEdit.SetFocus;
 end
else
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
     StoredProc.StoredProcName := 'Z_PEOPLE_PROP_INSERT';
     StoredProc.Prepare;
     StoredProc.ParamByName('ID_PEOPLE_PROP').AsInteger := PropEdit.EditValue;
     StoredProc.ParamByName('ID_MAN').AsInteger := PParameter.ID;
     StoredProc.ParamByName('DATE_BEG').AsDate  := DateBeg.Date;
     StoredProc.ParamByName('DATE_END').AsDate  := DateEnd.Date;
     StoredProc.ParamByName('PRIKAZ').AsString := PrikazEdit.Text;
     StoredProc.ExecProc;
     ID:=StoredProc.ParamByName('ID').AsInteger;
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
     StoredProc.StoredProcName := 'Z_PEOPLE_PROP_UPDATE';
     StoredProc.Prepare;
     StoredProc.ParamByName('ID_PEOPLE_PROP').AsInteger := PropEdit.EditValue;
     StoredProc.ParamByName('ID').AsInteger := PParameter.ID;
     StoredProc.ParamByName('ID_MAN').AsInteger := DSetData.FieldValues['ID_MAN'];
     StoredProc.ParamByName('DATE_BEG').AsDate  := DateBeg.Date;
     StoredProc.ParamByName('DATE_END').AsDate  := DateEnd.Date;
     StoredProc.ParamByName('PRIKAZ').AsString := PrikazEdit.Text;
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

procedure TFSp_People_Prop_Control.FormDestroy(Sender: TObject);
begin
if DM<>nil then DM.Destroy;
end;

end.
