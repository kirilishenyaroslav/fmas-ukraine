//******************************************************************************
// Пакет для добавленя, изменения, удаления данных о свойствах людей
// параметры: ID - идентификатор, если добавление, то идентификатор человека, иначе
// идентификатор свойства человека.
//******************************************************************************
unit PeopleProp_ByPeriod_MainForm2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxDropDownEdit, cxLookupEdit,
  

type, ActnList, StdCtrls, cxButtons, cxCalendar, cxTextEdit, cxMaskEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxContainer, cxEdit, cxLabel,
  ExtCtrls, cxControls, cxGroupBox
  TFPeople_Prop_ByPeriod1 = class(TForm)
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
    procedure CancelBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionYesExecute(Sender: TObject);
  private
    PParameter:TZPeoplePropParameters;
    PLanguageIndex:Byte;
  public
    constructor Create(AOwner: TComponent;DB_Handle:TISC_DB_HANDLE);reintroduce;
  end;

implementation

uses StrUtils;

{$R *.dfm}

constructor TFPeople_Prop_ByPeriod1.Create(AOwner: TComponent;DB_Handle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 {PParameter := AParameters;
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

    Caption            := ZPeoplePropCtrl_Caption_Insert[PLanguageIndex];
    PeopleEdit.Text    := VarToStr(DM.DSetData.FieldValues['TN'])+' - '+VarToStr(DM.DSetData.FieldValues['FIO']);
//strtodate(KodSetupToPeriod(grKodSetup(DB_Handle), 6))

     DateBeg.Date      := strtodate(KodSetupToPeriod(CurrentKodSetup(DB_Handle), 6));
    DateEnd.Date       := VarToDateTime(DM.DSetData['PERIOD_END']);
   }

end;

procedure TFPeople_Prop_ByPeriod1.CancelBtnClick(Sender: TObject);
begin
 //ModalResult:=mrCancel;
end;

procedure TFPeople_Prop_ByPeriod1.FormCreate(Sender: TObject);
begin
{if PParameter.ControlFormStyle = zcfsDelete then
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
 end;   }
end;

procedure TFPeople_Prop_ByPeriod1.ActionYesExecute(Sender: TObject);
var ID:integer;
begin
 //
end;

end.
