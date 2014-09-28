//******************************************************************************
// Пакет для добавленя, изменения, удаления данных о свойствах людей
// параметры: ID - идентификатор, если добавление, то идентификатор человека, иначе
// идентификатор свойства человека.
//******************************************************************************
unit PeopleWorkMode_Ctrl_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, StdCtrls, cxButtons, cxCalendar,
  cxTextEdit, cxMaskEdit, cxContainer, cxEdit, cxLabel, ExtCtrls,
  cxControls, cxGroupBox,ZMessages, ZProc,
  Unit_ZGlobal_Consts, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, DB, FIBDataSet, pFIBDataSet, ZTypes, IBase, ActnList, PeopleWorkMode_Ctrl_DM,
  ComCtrls, Grids, IBDatabase, Ibexternals;

type
  TFSp_People_WorkMode_Control = class(TForm)
    IdentificationBox: TcxGroupBox;
    PeopleLabel: TcxLabel;
    PeopleEdit: TcxMaskEdit;
    PeriodBox: TcxGroupBox;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    Bevel1: TBevel;
    WorkModeLabel: TcxLabel;
    PropEdit: TcxLookupComboBox;
    DateBegLabel: TcxLabel;
    DateBeg: TcxDateEdit;
    DateEndLabel: TcxLabel;
    DateEnd: TcxDateEdit;
    Actions: TActionList;
    ActionYes: TAction;
    WorkDogLabel: TcxLabel;
    cxMaskEdit1: TcxMaskEdit;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cxTextEdit1: TcxTextEdit;
    UpDown1: TUpDown;
    WorkModeGrid: TStringGrid;
    procedure CancelBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionYesExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PropEditPropertiesEditValueChanged(Sender: TObject);
    procedure DateBegPropertiesEditValueChanged(Sender: TObject);
    procedure DateEndPropertiesEditValueChanged(Sender: TObject);
    procedure cxTextEdit1PropertiesEditValueChanged(Sender: TObject);
    procedure DateBegPropertiesChange(Sender: TObject);
    procedure DateEndPropertiesChange(Sender: TObject);
    procedure PropEditPropertiesChange(Sender: TObject);
    procedure PropEditPropertiesCloseUp(Sender: TObject);
  private
    Ins_Id_Man:LongWord;
    PParameter:TZPeopleWorkModeParameters;
    DM:TDMWorkMode_Ctrl;
    PLanguageIndex:Byte;
    pNumPredpr:integer;
  public
    constructor Create(AOwner: TComponent;DB_Handle:TISC_DB_HANDLE;AParameters:TZPeopleWorkModeParameters;Is_Grant: TZChildSystems);reintroduce;
    procedure UpdateGrid;
    property ID_Man:LongWord read Ins_Id_Man write Ins_Id_Man;
    property Parameter:TZPeopleWorkModeParameters read PParameter;
  end;

implementation

uses StrUtils;

{$R *.dfm}

constructor TFSp_People_WorkMode_Control.Create(AOwner: TComponent;DB_Handle:TISC_DB_HANDLE;AParameters:TZPeopleWorkModeParameters;Is_Grant: TZChildSystems);
begin
 inherited Create(AOwner);
 PParameter := AParameters;
 DM := TDMWorkMode_Ctrl.Create(AOwner,DB_Handle,AParameters,Is_Grant);
 PLanguageIndex:=LanguageIndex;
 pNumPredpr := StrToInt(VarToStrDef(ValueFieldZSetup(DB_Handle,'NUM_PREDPR'),'1'));
//******************************************************************************
 PeopleLabel.Caption           := LabelMan_Caption[PLanguageIndex];
 WorkModeLabel.Caption         := 'Режим праці';
 WorkDogLabel.Caption          := 'Трудовий договір';
 DateBegLabel.Caption          := LabelDateBeg_Caption[PLanguageIndex]+' - ';
 DateEndLabel.Caption          := ' - '+AnsiLowerCase(LabelDateEnd_Caption[PLanguageIndex]);
 YesBtn.Caption                := YesBtn_Caption[PLanguageIndex];
 CancelBtn.Caption             := CancelBtn_Caption[PLanguageIndex];
//******************************************************************************
 PropEdit.Properties.ListFieldNames := 'NAME';
 PropEdit.Properties.KeyFieldNames  :='ID_WORK_MODE';
 PropEdit.Properties.DataController.DataSource := DM.DSourceProp;

//******************************************************************************
 case PParameter.ControlFormStyle of
  zcfsInsert:
   begin
    DateBeg.Properties.MaxDate := VarToDateTime(DM.DSetData['PER_DATE_BEG']);
    DateBeg.Properties.MinDate := VarToDateTime(DM.DSetData['PER_DATE_END']);
    DateEnd.Properties.MaxDate := VarToDateTime(DM.DSetData['PER_DATE_BEG']);
    DateEnd.Properties.MinDate := VarToDateTime(DM.DSetData['PER_DATE_END']);
    cxMaskEdit1.Text   :=DM.DSetData['NAME_POST'];
    Caption            := 'Додати режим праці';
    PeopleEdit.Text    := VarToStr(DM.DSetData.FieldValues['TN'])+' - '+VarToStr(DM.DSetData.FieldValues['FIO']);
    DateBeg.Date       := VarToDateTime(DM.DSetData['PER_DATE_BEG']);
    DateEnd.Date       := VarToDateTime(DM.DSetData['PER_DATE_END']);
   end;
  zcfsUpdate:
   begin
    DateBeg.Properties.MaxDate := VarToDateTime(DM.DSetData['PER_DATE_BEG']);
    DateBeg.Properties.MinDate := VarToDateTime(DM.DSetData['PER_DATE_END']);
    DateEnd.Properties.MaxDate := VarToDateTime(DM.DSetData['PER_DATE_BEG']);
    DateEnd.Properties.MinDate := VarToDateTime(DM.DSetData['PER_DATE_END']);
    cxMaskEdit1.Text      :=DM.DSetData['NAME_POST'];
    Caption               := 'Змінити режим праці';
    PeopleEdit.Text       := VarToStr(DM.DSetData['FIO']);
    DateBeg.Date          := AParameters.date_beg;
    DateEnd.Date          := AParameters.date_end;
    PropEdit.EditValue    := AParameters.id_workmode;
    UpDown1.Position      := AParameters.SHIFT;
    cxTextEdit1.EditValue := AParameters.SHIFT;
   end;
  zcfsShowDetails:
   begin
    cxMaskEdit1.Text   :=DM.DSetData['NAME_POST'];
    Caption            := 'Інформація по режиму праці';
    PeopleEdit.Text    := VarToStr(DM.DSetData['FIO']);
    DateBeg.Date       := AParameters.date_beg;
    DateEnd.Date       := AParameters.date_end;
    PropEdit.EditValue := AParameters.id_workmode;
    PeriodBox.Enabled  := False;
    YesBtn.Visible     := False;
    CancelBtn.Caption  := ExitBtn_Caption[PLanguageIndex];
   end;
 end;
end;

procedure TFSp_People_WorkMode_Control.CancelBtnClick(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TFSp_People_WorkMode_Control.FormCreate(Sender: TObject);
begin
     if PParameter.ControlFormStyle = zcfsDelete
     then begin
               if ZShowMessage(ZPeopleWorkModeCtrl_Caption_Delete[PLanguageIndex],DeleteRecordQuestion_Text[PLanguageIndex],mtConfirmation,[mbYes,mbNo])=mrYes
               then begin
                          with DM do
                          try
                              StoredProc.Database := DB;
                              StoredProc.Transaction := WriteTransaction;
                              StoredProc.Transaction.StartTransaction;
                              StoredProc.StoredProcName := 'Z_PEOPLE_WORKMODE_DELETE';
                              StoredProc.Prepare;
                              StoredProc.ParamByName('ID_PEOPLE_WORKMODE').AsInteger := PParameter.ID;
                              StoredProc.ExecProc;
                              StoredProc.Transaction.Commit;
                              ModalResult:=mrYes;
                          except on E:Exception do
                               begin
                                    ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
                                    StoredProc.Transaction.Rollback;
                               end;
                          end
               end
               else ModalResult:=mrCancel;
     end;
end;

procedure TFSp_People_WorkMode_Control.ActionYesExecute(Sender: TObject);
var ID:integer;
begin
     if PropEdit.EditText = ''
     then begin
               ZShowMessage(Error_Caption[PLanguageIndex],ZeInputProp_Error_Text[PLanguageIndex],mtWarning,[mbOK]);
               PropEdit.SetFocus;
    end
    else begin
              if DateBeg.Date>DateEnd.Date
              then begin
                        ZShowMessage(Error_Caption[PLanguageIndex],ZeInputTerms_ErrorText[PLanguageIndex],mtWarning,[mbOK]);
                        DateBeg.SetFocus;
              end
              else begin
                        case PParameter.ControlFormStyle of
                        zcfsInsert:
                                    with DM do
                                    try
                                     StoredProc.Database := DB;
                                     StoredProc.Transaction := WriteTransaction;
                                     StoredProc.Transaction.StartTransaction;
                                     StoredProc.StoredProcName := 'Z_PEOPLE_WORKMODE_INSERT';
                                     StoredProc.Prepare;
                                     StoredProc.ParamByName('ID_WORKMODE').AsInteger := PropEdit.EditValue;
                                     StoredProc.ParamByName('ID_WORK_DOG_MOVING').AsInteger := PParameter.rmoving;
                                     StoredProc.ParamByName('DATE_BEG').AsDate  := DateBeg.Date;
                                     StoredProc.ParamByName('DATE_END').AsDate  := DateEnd.Date;
                                     StoredProc.ParamByName('SHIFT').Value  := cxTextEdit1.EditValue;
                                     StoredProc.ExecProc;
                                     ID:=StoredProc.ParamByName('ID_PEOPLE_WORKMODE').AsInteger;
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
                                     StoredProc.StoredProcName := 'Z_PEOPLE_WORKMODE_UPDATE';
                                     StoredProc.Prepare;
                                     StoredProc.ParamByName('ID_PEOPLE_WORKMODE').AsInteger := PParameter.ID;
                                     StoredProc.ParamByName('ID_WORKMODE').AsInteger := PropEdit.EditValue;
                                     StoredProc.ParamByName('DATE_BEG').AsDate  := DateBeg.Date;
                                     StoredProc.ParamByName('DATE_END').AsDate  := DateEnd.Date;
                                     StoredProc.ParamByName('SHIFT').Value  := cxTextEdit1.EditValue;                                     
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
     end;
end;

procedure TFSp_People_WorkMode_Control.FormDestroy(Sender: TObject);
begin
if DM<>nil then DM.Destroy;
end;

procedure TFSp_People_WorkMode_Control.PropEditPropertiesEditValueChanged(
  Sender: TObject);
begin
     UpdateGrid;
end;

procedure TFSp_People_WorkMode_Control.DateBegPropertiesEditValueChanged(
  Sender: TObject);
begin
     UpdateGrid;
end;

procedure TFSp_People_WorkMode_Control.DateEndPropertiesEditValueChanged(
  Sender: TObject);
begin
     UpdateGrid;
end;

procedure TFSp_People_WorkMode_Control.cxTextEdit1PropertiesEditValueChanged(
  Sender: TObject);
begin
     UpdateGrid;
end;

procedure TFSp_People_WorkMode_Control.DateBegPropertiesChange(
  Sender: TObject);
begin
     UpdateGrid;
end;

procedure TFSp_People_WorkMode_Control.DateEndPropertiesChange(
  Sender: TObject);
begin
     UpdateGrid;
end;

procedure TFSp_People_WorkMode_Control.PropEditPropertiesChange(
  Sender: TObject);
begin
     UpdateGrid;
end;

procedure TFSp_People_WorkMode_Control.PropEditPropertiesCloseUp(
  Sender: TObject);
begin
     UpdateGrid;
end;

procedure TFSp_People_WorkMode_Control.UpdateGrid;
var  Trans:TIBTransaction;
     DBib:TIBDatabase;
begin
     WorkModeGrid.RowCount:=1;
     WorkModeGrid.ColCount:=1;
     Trans:=TIBTransaction.Create(self);
     DBib:=TIBDatabase.Create(self);
     DBib.SQLDialect:=3;
     DBib.DefaultTransaction:=Trans;
     DBib.SetHandle(Ibexternals.pvoid(DM.DB.Handle));
     Trans.StartTransaction;

     if  (PropEdit.EditValue>0)
     then begin
               if (PParameter.ControlFormStyle=zcfsInsert)
               then DrawWorkModeEx(WorkModeGrid,Date, IncMonth(Date),PropEdit.EditValue,cxTextEdit1.EditValue, Trans)
               else DrawWorkModeEx(WorkModeGrid,DateBeg.EditValue, IncMonth(Date),PropEdit.EditValue,cxTextEdit1.EditValue, Trans);
     end;

     Trans.Free;
     Dbib.Free;
end;

end.
