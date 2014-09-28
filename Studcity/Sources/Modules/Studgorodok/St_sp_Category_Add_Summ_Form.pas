//***********************************************************************
//* Проект "Студгородок"                                                *
//* Справочник категорий - добавление сумм                              *
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//***********************************************************************
unit St_sp_Category_Add_Summ_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxClasses,
  cxControls, cxGridCustomView, cxGridDBTableView, cxGrid, Buttons,
  cxLabel, cxMaskEdit, cxDropDownEdit, cxCalendar, cxContainer, cxGroupBox,
  StdCtrls, cxButtons, cxCurrencyEdit, ExtCtrls, FIBDataSet, pFIBDataSet,
  ActnList,
  St_Proc, st_ConstUnit, cxCheckBox;

type
  TCategoryFormAddSum = class(TForm)
    OKButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    DateBegEdit: TcxDateEdit;
    cxLabel1: TcxLabel;
    DateEndEdit: TcxDateEdit;
    cxLabel2: TcxLabel;
    cxGroupBox3: TcxGroupBox;
    SummaLabel: TcxLabel;
    SubsSummaLabel: TcxLabel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    SummaEdit: TcxCurrencyEdit;
    SubsSummaEdit: TcxCurrencyEdit;
    SubsMaxEdit: TcxCurrencyEdit;
    cxLabel3: TcxLabel;
    cxGroupBox2: TcxGroupBox;
    AddButton: TSpeedButton;
    EditButton: TSpeedButton;
    DeleteButton: TSpeedButton;
    Bevel2: TBevel;
    Bevel1: TBevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1TableView1: TcxGridTableView;
    cxGrid1TableView1Column1: TcxGridColumn;
    cxGrid1TableView1SubsSumma: TcxGridColumn;
    cxGrid1TableView1PersentSubs: TcxGridColumn;
    cxGrid1TableView1SUMMA: TcxGridColumn;
    cxGrid1TableView1PERCENT: TcxGridColumn;
    cxGrid1Level1: TcxGridLevel;
    Sum_subs_Result: TcxCurrencyEdit;
    Percent_subs_Result: TcxCurrencyEdit;
    Percent_Result: TcxCurrencyEdit;
    Sum_Result: TcxCurrencyEdit;
    cxGrid1TableView1_id_smeta: TcxGridColumn;
    cxGrid1TableView1_id_razdel: TcxGridColumn;
    cxGrid1TableView1_id_stat: TcxGridColumn;
    cxStyle5: TcxStyle;
    cxGrid1TableView1_id_kekv: TcxGridColumn;
    Category_ActionList: TActionList;
    Add_Action: TAction;
    Edit_Action: TAction;
    Delete_Action: TAction;
    Ok_Action: TAction;
    ReadDataSet: TpFIBDataSet;
    Image1: TImage;
    AvtoSumma_CheckBox: TcxCheckBox;
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure SummaEditKeyPress(Sender: TObject; var Key: Char);
    procedure SubsSummaEditKeyPress(Sender: TObject; var Key: Char);
    procedure DateBegEditKeyPress(Sender: TObject; var Key: Char);
    procedure DateEndEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure SubsMaxEditKeyPress(Sender: TObject; var Key: Char);
    procedure SubsSummaEditExit(Sender: TObject);
    procedure SubsMaxEditExit(Sender: TObject);
    procedure SummaEditExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxGrid1TableView1DblClick(Sender: TObject);
    procedure Ok_ActionExecute(Sender: TObject);
    procedure Add_ActionExecute(Sender: TObject);
    procedure Edit_ActionExecute(Sender: TObject);
    procedure Delete_ActionExecute(Sender: TObject);
  private
  Cur_date: string;
  PLanguageIndex: byte;
  procedure FormIniLanguage();
 // function  FinancesSourceOpen: boolean;
  public
    { Public declarations }
  end;

var
  CategoryFormAddSum: TCategoryFormAddSum;
  const kav = ''''; // это кавычки

  implementation
uses Unit_of_Utilits, St_sp_Category_Add_Summ_Istoch_Final,
  st_sp_category_FORM_ADD, DataModule1_Unit, Math;
{$R *.dfm}

{ function  TCategoryFormAddSum.FinancesSourceOpen: boolean;
 begin
 result:=true;
 if (SummaEdit.Text = '') or (SummaEdit.Value = 0) then result:=false;
// if (SubsSummaEdit.Text = '') or (SubsSummaEdit.Value = 0) then result:=false;
// if (SubsMaxEdit.Text = '') or (SubsMaxEdit.Value=0) then result:=false;
 end;         }

procedure TCategoryFormAddSum.FormIniLanguage();
begin
 // индекс языка (1-укр, 2 - рус)
 PLanguageIndex:=              St_Proc.cnLanguageIndex;
 //названия кнопок
 OKButton.Caption :=       st_ConstUnit.st_Accept[PLanguageIndex];
 CancelButton.Caption :=   st_ConstUnit.st_Cancel[PLanguageIndex];

 cxLabel1.Caption         :=   st_ConstUnit.st_grid_Date_Beg[PLanguageIndex];
 cxLabel2.Caption         :=   st_ConstUnit.st_grid_Date_End[PLanguageIndex];
 SummaLabel.Caption       :=   st_ConstUnit.st_PaySum_Cat[PLanguageIndex];
 cxLabel3.Caption         :=   st_ConstUnit.st_SubsMax_Cat[PLanguageIndex];
 SubsSummaLabel.Caption   :=   st_ConstUnit.st_SubsSum_Cat[PLanguageIndex];

 AddButton.Hint :=         st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 EditButton.Hint :=        st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 DeleteButton.Hint :=      st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];

 cxGroupBox2.Caption:=                st_ConstUnit.st_IstFinance[PLanguageIndex];
 AvtoSumma_CheckBox.Properties.Caption:=         st_ConstUnit.st_AvtoSummaCheckBox[PLanguageIndex];

 cxGrid1TableView1Column1.Caption:=     st_ConstUnit.st_IstFinance[PLanguageIndex];
 cxGrid1TableView1SubsSumma.Caption:=   st_ConstUnit.st_SubsSum_Cat[PLanguageIndex];
 cxGrid1TableView1PersentSubs.Caption:= st_ConstUnit.st_SubPercent[PLanguageIndex];
 cxGrid1TableView1SUMMA.Caption:=       st_ConstUnit.st_SummaSliv[PLanguageIndex];
 cxGrid1TableView1PERCENT.Caption:=     st_ConstUnit.st_PercentSliv[PLanguageIndex];
end;

procedure AcademicYear ;
var NowDate: TDateTime;
    Now_Year, Now_Month, Now_Day: Word;
    End_Year, End_Month, End_Day: Word;
begin
NowDate :=DataModule1_Unit.DataModule1.CURRENT_TIMESTAMP;
DecodeDate(NowDate,Now_Year,Now_Month,Now_Day);
if Now_Month >=7 then begin
Now_Day:=1;
Now_Month:=9;
End_Day:=1;
End_Month:=7;
End_Year := Now_Year+1;
CategoryFormAddSum.DateBegEdit.Date:=EncodeDate(Now_Year,Now_Month,Now_Day);
CategoryFormAddSum.DateEndEdit.Date:=EncodeDate(End_Year,End_Month,End_Day);
end
else begin
Now_Day:=1;
Now_Month:=9;
End_Day:=1;
End_Month:=7;
End_Year := Now_Year;
CategoryFormAddSum.DateBegEdit.Date:=EncodeDate(Now_Year-1,Now_Month,Now_Day);
CategoryFormAddSum.DateEndEdit.Date:=EncodeDate(End_Year,End_Month,End_Day);
end;
end;

procedure TCategoryFormAddSum.OKButtonClick(Sender: TObject);
begin
if DateBegEdit.Text = '' then begin
   ShowMessage(PChar(st_ConstUnit.st_CatAddBegDate_need[PLanguageIndex]));
   DateBegEdit.setfocus;
  exit;
 end;
 if DateEndEdit.Text = '' then begin
   ShowMessage(PChar(st_ConstUnit.st_CatAddEndDate_need[PLanguageIndex]));
  DateEndEdit.setfocus;
  exit;
 end;
 if DateBegEdit.Date >= DateEndEdit.Date then begin
   ShowMessage(PChar(st_ConstUnit.st_CatAddBegMoreEnd_need[PLanguageIndex]));
  DateEndEdit.setfocus;
  exit;
 end;
 if not FloatCheck(SummaEdit.Text) then begin
   ShowMessage(PChar(st_ConstUnit.st_CatAddSummNotCorrect[PLanguageIndex]));
  SummaEdit.setfocus;
  exit;
 end;
 if not FloatCheck(SubsSummaEdit.Text) then begin
   ShowMessage(PChar(st_ConstUnit.st_CatAddSubsSumNotCorrect[PLanguageIndex]));
  SubsSummaEdit.setfocus;
  exit;
 end;
 if cxGrid1TableView1.DataController.RecordCount = 0 then begin
   ShowMessage(PChar(st_ConstUnit.st_CatAddIstFinaceNotCorrect[PLanguageIndex]));
  cxGrid1.SetFocus;
  exit;
 end;

 if  roundto(StrToFloat(cxGrid1TableView1.DataController.Summary.FooterSummaryValues[2]), -2) <> 0 then
 if  roundto(StrToFloat(cxGrid1TableView1.DataController.Summary.FooterSummaryValues[2]), -2) <> 100 then
 begin
   ShowMessage(PChar(st_ConstUnit.st_CatAddSumPercSubsNotCorrect[PLanguageIndex]));
  cxGrid1.SetFocus;
  exit;
 end;

if  roundto(StrToFloat(cxGrid1TableView1.DataController.Summary.FooterSummaryValues[0]), -2) <> 100 then
 begin
   ShowMessage(PChar(st_ConstUnit.st_CatAddSumPercOtchNotCorrect[PLanguageIndex]));
  cxGrid1.SetFocus;
  exit;
 end;

{  if  abs(100.0000 - Percent_Result.Value) > 0.00001 then begin
  ShowMessage('Процент отчислений не может быть менее 100%. Внесите изменения.');
  cxGrid1.SetFocus;
  exit;
 end;       }
 if (not(StrToFloat(cxGrid1TableView1.DataController.Summary.FooterSummaryValues[2]) = 0))
 and (roundto(StrToFloat(cxGrid1TableView1.DataController.Summary.FooterSummaryValues[2]), -2) <> 100)then begin
   ShowMessage(PChar(st_ConstUnit.st_CatAddPercSubsSubSTONotCorrect[PLanguageIndex]));
  cxGrid1.SetFocus;
  exit;
 end;

 if cxGrid1TableView1.DataController.Summary.FooterSummaryValues[3] <> 0 then
 if  (abs(SubsSummaEdit.Value - StrToFloat(cxGrid1TableView1.DataController.Summary.FooterSummaryValues[3]))> 0.00001) then begin
   ShowMessage(PChar(st_ConstUnit.st_CatAddFinSubsNotCorrect[PLanguageIndex]));
  SubsSummaEdit.SetFocus;
  exit;
 end;
 if  (abs(SummaEdit.Value - StrToFloat(cxGrid1TableView1.DataController.Summary.FooterSummaryValues[1]) )>0.00001) then begin
   ShowMessage(PChar(st_ConstUnit.st_CatAddFinSumNotCorrect[PLanguageIndex]));
  SummaEdit.SetFocus;
  exit;
 end;
 CategoryFormAdd.RedactTrue;
 ModalResult := mrOK;
end;

procedure TCategoryFormAddSum.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TCategoryFormAddSum.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TCategoryFormAddSum.AddButtonClick(Sender: TObject);
//var
// i: integer;
begin
{if FinancesSourceOpen=false then begin
ShowMessage('Заполните поля с необходимыми суммами');
SummaEdit.SetFocus;
exit;
end;}
Screen.Cursor:=crHourGlass;
if cxGrid1TableView1.DataController.RecordCount > 0 then
if ( (roundto(StrToFloat(cxGrid1TableView1.DataController.Summary.FooterSummaryValues[2]), -4) = 100)
and  (roundto(StrToFloat(cxGrid1TableView1.DataController.Summary.FooterSummaryValues[0]), -4) = 100)) then
begin
ShowMessage(PChar(st_ConstUnit.st_CatAddOtchPercSTOMORE_need[PLanguageIndex]));
Screen.Cursor:=crDefault;
exit;
end;
 CategoryFormAddFin := TCategoryFormAddFin.Create(Self);
 CategoryFormAddFin.Caption := st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];

 ReadDataSet.Close;
 ReadDataSet.SelectSQL.Clear;
 ReadDataSet.SelectSQL.Text := 'select * from ST_PROV_DEFAULT_SELECT';
 ReadDataSet.Open;
 if ReadDataSet['DEF_SMETA']  <> null then  CategoryFormAddFin.Smeta_Edit.Text:= inttostr(ReadDataSet['DEF_SMETA']);
 if ReadDataSet['DEF_RAZDEL'] <> null then  CategoryFormAddFin.Razdel_Edit.Text:= inttostr(ReadDataSet['DEF_RAZDEL']);
 if ReadDataSet['DEF_STAT']   <> null then  CategoryFormAddFin.Stat_Edit.Text:= inttostr(ReadDataSet['DEF_STAT']);
 if ReadDataSet['DEF_KEKV']   <> null then  CategoryFormAddFin.Kekv_Edit.Text:= inttostr(ReadDataSet['DEF_KEKV']);
 ReadDataSet.Close;

 if cxGrid1TableView1.DataController.RecordCount = 0 then begin
 CategoryFormAddFin.SummaEdit.Value:= SummaEdit.Value;
 CategoryFormAddFin.S_SummaEdit.Value:=SubsSummaEdit.Value;
 CategoryFormAddFin.PercentEdit.Value:=100;
 CategoryFormAddFin.Persent_Subs_Edit.Value:=100;
 end
 else begin
 CategoryFormAddFin.SummaEdit.Value:= SummaEdit.Value    - StrToFloat(cxGrid1TableView1.DataController.Summary.FooterSummaryValues[1]);
 CategoryFormAddFin.S_SummaEdit.Value:=SubsSummaEdit.Value - StrToFloat(cxGrid1TableView1.DataController.Summary.FooterSummaryValues[3]);
 CategoryFormAddFin.PercentEdit.Value:=100 - StrToFloat(cxGrid1TableView1.DataController.Summary.FooterSummaryValues[0]);
 CategoryFormAddFin.Persent_Subs_Edit.Value:=100 -StrToFloat(cxGrid1TableView1.DataController.Summary.FooterSummaryValues[2]);
 end;

 if AvtoSumma_CheckBox.Checked then
 begin
  CategoryFormAddFin.AvtoRedact:= true;
  CategoryFormAddFin.SumRedact:= true;
 end
  else
   begin
   CategoryFormAddFin.AvtoRedact:= false;
   CategoryFormAddFin.SumRedact:= false;
  end;

  Screen.Cursor:=crDefault;
 if CategoryFormAddFin.ShowModal = mrOK then begin
  cxGrid1TableView1.DataController.RecordCount := cxGrid1TableView1.DataController.RecordCount + 1;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.RecordCount - 1, 0] := CategoryFormAddFin.Smeta_Edit.Text+'.'+CategoryFormAddFin.Razdel_Edit.Text+'.'+ CategoryFormAddFin.Stat_Edit.Text+'.'+CategoryFormAddFin.Kekv_Edit.Text;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.RecordCount - 1, 1] := CategoryFormAddFin.S_SummaEdit.Text;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.RecordCount - 1, 2] := CategoryFormAddFin.Persent_Subs_Edit.Text;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.RecordCount - 1, 3] := CategoryFormAddFin.SummaEdit.Text;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.RecordCount - 1, 4] := CategoryFormAddFin.PercentEdit.Text;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.RecordCount - 1, 5] := CategoryFormAddFin.id_smeta;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.RecordCount - 1, 6] := CategoryFormAddFin.id_razdel;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.RecordCount - 1, 7] := CategoryFormAddFin.id_stat;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.RecordCount - 1, 8] := CategoryFormAddFin.id_kekv;
  

 { Sum_subs_Result.Value:=0;
  Percent_subs_Result.Value:=0;
  Sum_Result.Value:=0;
  Percent_Result.Value:=0;
  for i:=0 to  cxGrid1TableView1.DataController.RecordCount-1 do begin
  Sum_subs_Result.Value:=Sum_subs_Result.Value + cxGrid1TableView1.DataController.Values[i, 1];
  Percent_subs_Result.Value:= Percent_subs_Result.Value + cxGrid1TableView1.DataController.Values[i, 2];
  Sum_Result.Value:= Sum_Result.Value + cxGrid1TableView1.DataController.Values[i, 3];
  Percent_Result.Value:= Percent_Result.Value + cxGrid1TableView1.DataController.Values[i, 4];
  end;}
  cxGrid1TableView1.DataController.FocusedRowIndex:=cxGrid1TableView1.DataController.RecordCount - 1;
  EditButton.Enabled := true;
  DeleteButton.Enabled := true;
 end;
 CategoryFormAddFin.Free;

end;

procedure TCategoryFormAddSum.EditButtonClick(Sender: TObject);
//var
// i: integer;
begin
 CategoryFormAddFin := TCategoryFormAddFin.Create(Self);
 CategoryFormAddFin.id_smeta:= cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 5];
 CategoryFormAddFin.id_razdel:= cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 6];
 CategoryFormAddFin.id_stat:= cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 7];
 CategoryFormAddFin.id_kekv:= cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 8];
 CategoryFormAddFin.Caption := st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];

 // нужно пихнуть номера смет, разд... извлечь по ид
 ReadDataSet.Close;
 ReadDataSet.SelectSQL.Clear;
 ReadDataSet.SelectSQL.Text := 'select KOD_OBJECT, TITLE_OBJECT from PUB_GET_NAME_BUDG_BY_ID('+ inttostr(CategoryFormAddFin.id_smeta)+ ','+kav+cur_date+kav+','+'1'+')';
 ReadDataSet.Open;
 CategoryFormAddFin.Smeta_Label.Caption:=ReadDataSet['TITLE_OBJECT'] ;
 CategoryFormAddFin.Smeta_Edit.Text:= ReadDataSet['KOD_OBJECT'];
 ReadDataSet.Close;

 ReadDataSet.SelectSQL.Clear;
 ReadDataSet.Close;
 ReadDataSet.SelectSQL.Text := 'select KOD_OBJECT, TITLE_OBJECT from PUB_GET_NAME_BUDG_BY_ID('+ inttostr(CategoryFormAddFin.id_razdel)+ ','+ kav+ cur_date +kav+','+'2'+')';
 ReadDataSet.Open;
 CategoryFormAddFin.Razdel_Label.Caption:=ReadDataSet['TITLE_OBJECT'] ;
 CategoryFormAddFin.Razdel_Edit.Text:= ReadDataSet['KOD_OBJECT'] ;
 ReadDataSet.Close;

 ReadDataSet.SelectSQL.Clear;
 ReadDataSet.Close;
 ReadDataSet.SelectSQL.Text := 'select KOD_OBJECT, TITLE_OBJECT from PUB_GET_NAME_BUDG_BY_ID('+ inttostr(CategoryFormAddFin.id_stat)+ ','+ kav+ cur_date +kav+','+'3'+')';
 ReadDataSet.Open;
 CategoryFormAddFin.Stat_Label.Caption:=ReadDataSet['TITLE_OBJECT'] ;
 CategoryFormAddFin.Stat_Edit.Text:= ReadDataSet['KOD_OBJECT'] ;
 ReadDataSet.Close;

 ReadDataSet.SelectSQL.Clear;
 ReadDataSet.Close;
 ReadDataSet.SelectSQL.Text := 'select KEKV_KODE, KEKV_TITLE from PUB_SPR_KEKV_INFO('+ inttostr(CategoryFormAddFin.id_kekv)+ ','+ kav+ cur_date +kav+')';
 ReadDataSet.Open;
 CategoryFormAddFin.Kekv_Label.Caption:=ReadDataSet['KEKV_TITLE'] ;
 CategoryFormAddFin.Kekv_Edit.Text:= ReadDataSet['KEKV_KODE'] ;
 ReadDataSet.Close;

 if AvtoSumma_CheckBox.Checked then
 begin
  CategoryFormAddFin.AvtoRedact:= true;
  CategoryFormAddFin.SumRedact:= true;
 end
  else
   begin
   CategoryFormAddFin.AvtoRedact:= false;
   CategoryFormAddFin.SumRedact:= false;
  end;

 CategoryFormAddFin.S_SummaEdit.Value := cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 1];
 CategoryFormAddFin.Persent_Subs_Edit.Value := cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 2];
 CategoryFormAddFin.SummaEdit.Value := cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 3];
 CategoryFormAddFin.PercentEdit.Value := cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 4];
 if CategoryFormAddFin.ShowModal = mrOK then begin
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 0] := CategoryFormAddFin.Smeta_Edit.Text+'.'+CategoryFormAddFin.Razdel_Edit.Text+'.'+ CategoryFormAddFin.Stat_Edit.Text+'.'+CategoryFormAddFin.Kekv_Edit.Text;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 1] := CategoryFormAddFin.S_SummaEdit.Text;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 2] := CategoryFormAddFin.Persent_Subs_Edit.Text;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 3] := CategoryFormAddFin.SummaEdit.Text;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 4] := CategoryFormAddFin.PercentEdit.Text;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 5] := CategoryFormAddFin.id_smeta;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 6] := CategoryFormAddFin.id_razdel;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 7] := CategoryFormAddFin.id_stat;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 8] := CategoryFormAddFin.id_kekv;

 { Sum_subs_Result.Value:=0;
  Percent_subs_Result.Value:=0;
  Sum_Result.Value:=0;
  Percent_Result.Value:=0;
  for i:=0 to  cxGrid1TableView1.DataController.RecordCount-1 do begin
  Sum_subs_Result.Value:=Sum_subs_Result.Value + cxGrid1TableView1.DataController.Values[i, 1];
  Percent_subs_Result.Value:= Percent_subs_Result.Value + cxGrid1TableView1.DataController.Values[i, 2];
  Sum_Result.Value:= Sum_Result.Value + cxGrid1TableView1.DataController.Values[i, 3];
  Percent_Result.Value:= Percent_Result.Value + cxGrid1TableView1.DataController.Values[i, 4];
  end;     }

 end;
 CategoryFormAddFin.Free;

end;

procedure TCategoryFormAddSum.DeleteButtonClick(Sender: TObject);
//var i: integer;
begin
if MessageBox(Handle,PChar(st_ConstUnit.st_DeletePromt[PLanguageIndex]),PChar(st_ConstUnit.st_Confirmation_Caption[PLanguageIndex]),MB_YESNO or MB_ICONQUESTION)= mrNo then exit;
cxGrid1TableView1.DataController.DeleteFocused;
 { Sum_subs_Result.Value:=0;
  Percent_subs_Result.Value:=0;
  Sum_Result.Value:=0;
  Percent_Result.Value:=0;
  for i:=0 to  cxGrid1TableView1.DataController.RecordCount-1 do begin
  Sum_subs_Result.Value:=Sum_subs_Result.Value + cxGrid1TableView1.DataController.Values[i, 1];
  Percent_subs_Result.Value:= Percent_subs_Result.Value + cxGrid1TableView1.DataController.Values[i, 2];
  Sum_Result.Value:= Sum_Result.Value + cxGrid1TableView1.DataController.Values[i, 3];
  Percent_Result.Value:= Percent_Result.Value + cxGrid1TableView1.DataController.Values[i, 4];
  end;     }
 if cxGrid1TableView1.DataController.RecordCount = 0 then begin
  EditButton.Enabled := false;
  Deletebutton.Enabled := false;
 end;
end;

procedure TCategoryFormAddSum.SummaEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then  SubsMaxEdit.SetFocus;
end;

procedure TCategoryFormAddSum.SubsSummaEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then  OKButton.SetFocus;
end;

procedure TCategoryFormAddSum.DateBegEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then  DateEndEdit.SetFocus;
end;

procedure TCategoryFormAddSum.DateEndEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then  SummaEdit.SetFocus;
end;

procedure TCategoryFormAddSum.FormShow(Sender: TObject);
begin
if cxGrid1TableView1.DataController.RecordCount = 0 then
begin
AcademicYear;
SummaEdit.Value:=0;
SubsSummaEdit.Value:=0;
SubsMaxEdit.Value:=0;
end;
   AddButton.Enabled:=true;
if cxGrid1TableView1.DataController.RecordCount = 0 then begin
  EditButton.Enabled := false;
  Deletebutton.Enabled := false;
  end
  else begin
  EditButton.Enabled := true;
  Deletebutton.Enabled := true;
  end;
if cxGrid1TableView1.DataController.RecordCount > 0 then
   cxGrid1TableView1.DataController.FocusedRecordIndex := 0;
SummaEdit.SetFocus;
end;

procedure TCategoryFormAddSum.SubsMaxEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then  SubsSummaEdit.SetFocus;
end;

procedure TCategoryFormAddSum.SubsSummaEditExit(Sender: TObject);
begin
{if FinancesSourceOpen=true then AddButton.Enabled:=true
else AddButton.Enabled:=false;}
end;

procedure TCategoryFormAddSum.SubsMaxEditExit(Sender: TObject);
begin
{if FinancesSourceOpen=true then AddButton.Enabled:=true
else AddButton.Enabled:=false;}
end;

procedure TCategoryFormAddSum.SummaEditExit(Sender: TObject);
begin
{if FinancesSourceOpen=true then AddButton.Enabled:=true
else AddButton.Enabled:=false;}
end;

procedure TCategoryFormAddSum.FormCreate(Sender: TObject);
begin
 cxGrid1TableView1.Items[0].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGrid1TableView1.Items[1].DataBinding.ValueTypeClass := TcxFloatValueType;
 cxGrid1TableView1.Items[2].DataBinding.ValueTypeClass := TcxFloatValueType;
 cxGrid1TableView1.Items[3].DataBinding.ValueTypeClass := TcxFloatValueType;
 cxGrid1TableView1.Items[4].DataBinding.ValueTypeClass := TcxFloatValueType;
 cxGrid1TableView1.Items[5].DataBinding.ValueTypeClass := TcxIntegerValueType;
 cxGrid1TableView1.Items[6].DataBinding.ValueTypeClass := TcxIntegerValueType;
 cxGrid1TableView1.Items[7].DataBinding.ValueTypeClass := TcxIntegerValueType;
 cxGrid1TableView1.Items[8].DataBinding.ValueTypeClass := TcxIntegerValueType;
// Percent_Result.Properties.DecimalPlaces:=4;
// Percent_subs_Result.Properties.DecimalPlaces:=4;

ReadDataSet.Close;
ReadDataSet.SelectSQL.Clear;
ReadDataSet.SelectSQL.Text := 'select CUR_DATE from ST_GET_CURRENT_DATE';
ReadDataSet.Open;
Cur_date:= ReadDataSet['CUR_DATE'];
ReadDataSet.Close;

FormIniLanguage();
end;

procedure TCategoryFormAddSum.cxGrid1TableView1DblClick(Sender: TObject);
begin
if cxGrid1TableView1.DataController.RecordCount = 0 then exit;
CategoryFormAddSum.EditButtonClick(Sender);
end;

procedure TCategoryFormAddSum.Ok_ActionExecute(Sender: TObject);
begin
CategoryFormAddSum.OKButtonClick(Sender);
end;

procedure TCategoryFormAddSum.Add_ActionExecute(Sender: TObject);
begin
CategoryFormAddSum.AddButtonClick(Sender);
end;

procedure TCategoryFormAddSum.Edit_ActionExecute(Sender: TObject);
begin
CategoryFormAddSum.EditButtonClick(Sender);
end;

procedure TCategoryFormAddSum.Delete_ActionExecute(Sender: TObject);
begin
//CategoryFormAddSum.DeleteButtonClick(Sender);
end;

end.
