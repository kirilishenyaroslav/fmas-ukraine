unit PeopleProp_ByPeriod_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons,
  cxDropDownEdit, cxCalendar, cxTextEdit, cxMaskEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxContainer, cxEdit, cxLabel,
  ExtCtrls, cxControls, cxGroupBox, IBase, ZProc, Unit_ZGlobal_Consts,
  FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, frxClass,
  frxDBSet, cxCheckBox, frxExportRTF;

type
  TFPeople_Prop_ByPeriod = class(TForm)
    PeriodBox: TcxGroupBox;
    Bevel1: TBevel;
    PropLabel: TcxLabel;
    PropEdit: TcxLookupComboBox;
    DateBegLabel: TcxLabel;
    DateBeg: TcxDateEdit;
    DateEndLabel: TcxLabel;
    DateEnd: TcxDateEdit;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    Actions: TActionList;
    ActionYes: TAction;
    DB: TpFIBDatabase;
    DSetProp: TpFIBDataSet;
    DSetPeopleProp: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DSourceProp: TDataSource;
    Report: TfrxReport;
    ReportDBDSet: TfrxDBDataset;
    ActionCancel: TAction;
    ActionEnter: TAction;
    cxCheckBox1: TcxCheckBox;
    frxrtfxprtRTFExport: TfrxRTFExport;
    procedure ActionYesExecute(Sender: TObject);
    procedure ActionEnterExecute(Sender: TObject);
    procedure ReportGetValue(const VarName: String; var Value: Variant);
  private
    PLanguageIndex:Byte;
  public
    constructor Create(AOwner: TComponent;DB_Handle:TISC_DB_HANDLE);reintroduce;
  end;

var
  FPeople_Prop_ByPeriod: TFPeople_Prop_ByPeriod;

implementation
const PathReport               = 'Reports\Zarplata\PeoplePropByPeriod.fr3';

{$R *.dfm}

{ TFPeople_Prop_ByPeriod }

constructor TFPeople_Prop_ByPeriod.Create(AOwner: TComponent;DB_Handle: TISC_DB_HANDLE);
begin
  inherited Create(AOwner);
  DB.handle:=DB_Handle;
  PLanguageIndex:=LanguageIndex;
  ReadTransaction.StartTransaction;
  PropEdit.Properties.DataController.DataSource := DSourceProp;
//******************************************************************************
  PropLabel.Caption             := GridClPropertyName_Caption[PLanguageIndex];
  DateBegLabel.Caption          := LabelDateBeg_Caption[PLanguageIndex]+' - ';
  DateEndLabel.Caption          := ' - '+AnsiLowerCase(LabelDateEnd_Caption[PLanguageIndex]);
  YesBtn.Caption                := YesBtn_Caption[PLanguageIndex];
  CancelBtn.Caption             := CancelBtn_Caption[PLanguageIndex];
//******************************************************************************
  PropEdit.Properties.ListFieldNames := 'NAME_PEOPLE_PROP';
  PropEdit.Properties.KeyFieldNames  := 'ID_PEOPLE_PROP';
  DSetProp.Close;
  DSetProp.SQLs.SelectSQL.Text       := 'SELECT * FROM Z_SP_PEOPLE_PROP_SEL(''F'')';
  DSetProp.Open;

  DateBeg.Properties.MaxDate := strToDate('01.01.2050');
  DateBeg.Properties.MinDate := strToDate('01.01.1990');
  DateEnd.Properties.MaxDate := strToDate('01.01.2050');
  DateEnd.Properties.MinDate := strToDate('01.01.1990');

  DateBeg.Date   := StrToDate('01.01.'+FormatDateTime('yyyy',Date));
  DateEnd.Date   := IncMonth(strToDate('01.01.'+FormatDateTime('yyyy',Date)),12);



end;

procedure TFPeople_Prop_ByPeriod.ActionYesExecute(Sender: TObject);
var NotProp:integer;
begin
  {if (PropEdit.EditValue=-1)    then
    begin
      ShowMessage('¬ластив≥сть не обрана');
      PropEdit.SetFocus;
      exit;
    end; }

  if  cxCheckBox1.Checked then NotProp:=1
  else NotProp:=0;

  DSetPeopleProp.Close;
  DSetPeopleProp.SQLs.SelectSQL.Text:='Select * From Z_GET_PEOPLE_PROP('+
  VarToStr(PropEdit.EditValue)+','''+DateToStr(DateBeg.Date)+''','''+
  DateToStr(DateEnd.Date)+''','+IntToStr(NotProp)+')'+
  ' order by NAME_ORG_STRUCT, NAME_DEPARTMENT, FIO' ;
  DSetPeopleProp.Open;

  Report.Clear;
  Report.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReport,True);
  if zDesignReport then Report.DesignReport
  else Report.ShowReport();
end;

procedure TFPeople_Prop_ByPeriod.ActionEnterExecute(Sender: TObject);
begin


if CancelBtn.focused=true then  ModalResult:=mrCancel;
if YesBtn.focused=true then begin ActionYesExecute(Sender); exit; end;
if DateEnd.focused=true then begin YesBtn.SetFocus; exit; end;
if DateBeg.focused=true then begin DateEnd.SetFocus; exit; end;
if PropEdit.focused=true then begin DateBeg.SetFocus; exit; end;

end;

procedure TFPeople_Prop_ByPeriod.ReportGetValue(const VarName: String;
  var Value: Variant);
begin
if UpperCase(VarName)='PROP' then
    Value:=PropEdit.Text;
if UpperCase(VarName)='NOPROP' then
  if cxCheckBox1.Checked then
    Value:='не'
  else Value:='';
end;

end.
