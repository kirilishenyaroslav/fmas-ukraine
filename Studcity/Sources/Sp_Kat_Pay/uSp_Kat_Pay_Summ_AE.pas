//***********************************************************************
//* Проект "Студгородок"                                                *
//* Справочник категорий - добавление сумм                              *
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//* Последнии изминения: Перчак А.Л. 10.01.2012                         *
//***********************************************************************
unit uSp_Kat_Pay_Summ_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxClasses,
  cxControls, cxGridCustomView, cxGridDBTableView, cxGrid, Buttons,
  cxLabel, cxMaskEdit, cxDropDownEdit, cxCalendar, cxContainer, cxGroupBox,
  StdCtrls, cxButtons, cxCurrencyEdit, ExtCtrls, FIBDataSet, pFIBDataSet,
  ActnList, st_ConstUnit, cxCheckBox, st_common_funcs, iBase, uSp_kat_pay_DM,
  RxMemDS, st_Common_Messages, st_Consts_Messages;

type
  TCategoryFormAddSum = class(TForm)
    OKButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    DateBegEdit: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxGroupBox2: TcxGroupBox;
    AddButton: TSpeedButton;
    EditButton: TSpeedButton;
    DeleteButton: TSpeedButton;
    Category_ActionList: TActionList;
    Add_Action: TAction;
    Edit_Action: TAction;
    Delete_Action: TAction;
    Ok_Action: TAction;
    ReadDataSet: TpFIBDataSet;
    SummaLabel: TcxLabel;
    SummaEdit: TcxCurrencyEdit;
    SubsSummaLabel: TcxLabel;
    SubsSummaEdit: TcxCurrencyEdit;
    Panel1: TPanel;
    MemoryData_sum: TRxMemoryData;
    DataSource1: TDataSource;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    Cash_Style: TcxStyle;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn7: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn8: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn9: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn10: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn11: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn12: TcxGridDBColumn;
    MemoryData_summd_istochnik: TStringField;
    MemoryData_summd_subs_sum: TCurrencyField;
    MemoryData_summd_subs_procent: TFloatField;
    MemoryData_summd_sum: TCurrencyField;
    MemoryData_summd_procent: TFloatField;
    MemoryData_summd_id_smeta: TIntegerField;
    MemoryData_summd_id_razdel: TIntegerField;
    MemoryData_summd_id_stat: TIntegerField;
    MemoryData_summd_id_kekv: TIntegerField;
    MemoryData_summd_name_serves: TStringField;
    MemoryData_summd_id_serves: TIntegerField;
    MemoryData_summd_options: TIntegerField;
    cxLabel2: TcxLabel;
    DateEndEdit: TcxDateEdit;
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure SubsSummaEditKeyPress(Sender: TObject; var Key: Char);
    procedure DateBegEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure SubsMaxEditKeyPress(Sender: TObject; var Key: Char);
    procedure SubsSummaEditExit(Sender: TObject);
    procedure SubsMaxEditExit(Sender: TObject);
    procedure SummaEditExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure Ok_ActionExecute(Sender: TObject);
    procedure Add_ActionExecute(Sender: TObject);
    procedure Edit_ActionExecute(Sender: TObject);
  private
    PLanguageIndex: byte;
    CURRENT_TIMESTAMP : TDateTime;
    Current_day       : TDate;
    id_razd,  id_stat : Int64;
    kod_razd, kod_stat : Integer;
    procedure auto_get_procent;
    procedure FormIniLanguage();
  public
    aHandle : TISC_DB_HANDLE;
    is_admin : Boolean;
    id_stage : Int64;
  end;

var
  CategoryFormAddSum: TCategoryFormAddSum;
  const kav = ''''; // это кавычки

  implementation
uses uSp_Kat_Pay_Istoch_AE, uSp_Kat_Pay_AE, Math;

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
 PLanguageIndex:=              stLanguageIndex;
 //названия кнопок
 OKButton.Caption :=       st_ConstUnit.st_Accept[PLanguageIndex];
 CancelButton.Caption :=   st_ConstUnit.st_Cancel[PLanguageIndex];

 cxLabel1.Caption         :=   st_ConstUnit.st_grid_Date_Beg[PLanguageIndex];
 SummaLabel.Caption       :=   st_ConstUnit.st_PaySum_Cat[PLanguageIndex];
 SubsSummaLabel.Caption   :=   st_ConstUnit.st_SubsSum_Cat[PLanguageIndex];

 AddButton.Hint :=         st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 EditButton.Hint :=        st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 DeleteButton.Hint :=      st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];

 cxGroupBox2.Caption:=                st_ConstUnit.st_IstFinance[PLanguageIndex];

  cxGrid1DBTableView1DBColumn1.Caption  := st_ConstUnit.st_IstFinance[PLanguageIndex];
  cxGrid1DBTableView1DBColumn2.Caption  := st_ConstUnit.st_SubsSum_Cat[PLanguageIndex];
  cxGrid1DBTableView1DBColumn3.Caption  := st_ConstUnit.st_SubPercent[PLanguageIndex];
  cxGrid1DBTableView1DBColumn4.Caption  := st_ConstUnit.st_SummaSliv[PLanguageIndex];
  cxGrid1DBTableView1DBColumn5.Caption  := st_ConstUnit.st_PercentSliv[PLanguageIndex];
  cxGrid1DBTableView1DBColumn10.Caption := st_ConstUnit.st_serves[PLanguageIndex];
end;

procedure TCategoryFormAddSum.OKButtonClick(Sender: TObject);
var
  i : Integer;
begin
  if DateBegEdit.Text = '' then
   begin
    ShowMessage(PChar(st_ConstUnit.st_CatAddBegDate_need[PLanguageIndex]));
    DateBegEdit.setfocus;
    exit;
   end;

  if DateEndEdit.Text = '' then
   begin
    ShowMessage(PChar(st_ConstUnit.st_CatAddEndDate_need[PLanguageIndex]));
    DateBegEdit.setfocus;
    exit;
   end;

  if DateEndEdit.EditValue < DateBegEdit.EditValue then
   Begin
    ShowMessage(st_DateBegNeedMoreDateEnd[PLanguageIndex]);
    DateEndEdit.SetFocus;
    Exit;
   end;

  if not FloatCheck(SummaEdit.Text) then
   begin
    ShowMessage(PChar(st_ConstUnit.st_CatAddSummNotCorrect[PLanguageIndex]));
    SummaEdit.setfocus;
    exit;
   end;

  if not FloatCheck(SubsSummaEdit.Text) then
   begin
    ShowMessage(PChar(st_ConstUnit.st_CatAddSubsSumNotCorrect[PLanguageIndex]));
    SubsSummaEdit.setfocus;
    exit;
   end;

  if cxGrid1DBTableView1.DataController.RecordCount = 0 then
   begin
    ShowMessage(PChar(st_ConstUnit.st_CatAddIstFinaceNotCorrect[PLanguageIndex]));
    cxGrid1.SetFocus;
    exit;
   end;

  //процент субсидии
  if  roundto(StrToFloat(cxGrid1DBTableView1.DataController.Summary.FooterSummaryValues[1]), -2) <> 100 then
   begin
    ShowMessage(PChar(st_ConstUnit.st_CatAddSumPercSubsNotCorrect[PLanguageIndex]));
    cxGrid1.SetFocus;
    exit;
   end;

  if  roundto(StrToFloat(cxGrid1DBTableView1.DataController.Summary.FooterSummaryValues[3]), -2) <> 100 then
   begin
    ShowMessage(PChar(st_ConstUnit.st_CatAddSumPercOtchNotCorrect[PLanguageIndex]));
    cxGrid1.SetFocus;
    exit;
   end;

  if (abs(SubsSummaEdit.Value - StrToFloat(cxGrid1DBTableView1.DataController.Summary.FooterSummaryValues[0])) > 0.01) then
   begin
    ShowMessage(PChar(st_ConstUnit.st_CatAddFinSubsNotCorrect[PLanguageIndex]));
    SubsSummaEdit.SetFocus;
    exit;
   end;

  if (abs(SummaEdit.Value - StrToFloat(cxGrid1DBTableView1.DataController.Summary.FooterSummaryValues[2]) ) > 0.01) then
   begin
    ShowMessage(PChar(st_ConstUnit.st_CatAddFinSumNotCorrect[PLanguageIndex]));
    SummaEdit.SetFocus;
    exit;
   end;

  MemoryData_sum.First;
  For i := 0 to MemoryData_sum.RecordCount - 1 do
   begin
    if ((MemoryData_sum['md_id_razdel']= - 1) or (MemoryData_sum['md_id_stat'] = -1)) then
     Begin
      ShowMessage('Не правильно заполненный источник финансирования!');
      Exit;
     end;
    MemoryData_sum.Next;
   end;

  ModalResult := mrOK;
end;

procedure TCategoryFormAddSum.CancelButtonClick(Sender: TObject);
begin
  close;
end;

procedure TCategoryFormAddSum.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//Action:=caFree;
end;

procedure TCategoryFormAddSum.AddButtonClick(Sender: TObject);
var
  ViewForm : TCategoryFormAddFin;
//  SX :string;
begin
  Screen.Cursor:=crHourGlass;

  ViewForm := TCategoryFormAddFin.Create(Self);
  ViewForm.Caption := st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
  ViewForm.is_admin := is_admin;
  ViewForm.aHandle := aHandle;

  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text := 'select * from ST_PROV_DEFAULT_SELECT';
  ReadDataSet.Open;

  if ReadDataSet['DEF_SMETA']  <> null then ViewForm.Smeta_Edit.Text:= inttostr(ReadDataSet['DEF_SMETA']);
  if ReadDataSet['DEF_KEKV']  <> null  then ViewForm.KEKV_Edit.Text:= inttostr(ReadDataSet['DEF_KEKV']);

  ReadDataSet.Close;

  Screen.Cursor:=crDefault;
  If ViewForm.ShowModal = mrOK then
   begin
    if ViewForm.Currency_PDV.Value <> 0 then
     Begin
      ReadDataSet.Close;
      ReadDataSet.SQLs.SelectSQL.Text := 'Select * From ST_GET_RAZD_STAT_SERVES(:id_serves) where ST_OPTIONS = 2';
      ReadDataSet.ParamByName('id_serves').AsInt64 := ViewForm.id_serves;
      ReadDataSet.Open;

      if ReadDataSet['id_razd'] <> null
       then id_razd := ReadDataSet['id_razd']
       else id_razd := -1;

      if ReadDataSet['Kod_razd'] <> null
       then kod_razd := ReadDataSet['kod_razd']
       else kod_razd := 0;

      if ReadDataSet['id_stat'] <> null
       then id_stat := ReadDataSet['id_stat']
       else id_stat := -1;

      if ReadDataSet['kod_stat'] <> null
       then kod_stat := ReadDataSet['kod_stat']
       else kod_stat := 0;

      MemoryData_sum.Insert;
      MemoryData_sum['md_istochnik']    := ViewForm.Smeta_Edit.Text + '.' + IntToStr(kod_razd) + '.' + IntToStr(kod_stat) + '.' + ViewForm.kekv_Edit.Text;
      MemoryData_sum['md_subs_sum']     := 0;
      MemoryData_sum['md_subs_procent'] := 100;
      MemoryData_sum['md_sum']          := ViewForm.Currency_PDV.Value;
      MemoryData_sum['md_procent']      := 100;
      MemoryData_sum['md_id_smeta']     := ViewForm.id_smeta;
      MemoryData_sum['md_id_razdel']    := id_razd;
      MemoryData_sum['md_id_stat']      := id_stat;
      MemoryData_sum['md_id_kekv']      := ViewForm.id_kekv;
      MemoryData_sum['md_name_serves']  := ViewForm.serves_ButtonEdit.Text;
      MemoryData_sum['md_id_serves']    := ViewForm.id_serves;
      MemoryData_sum['md_options']      := 2;
      MemoryData_sum.Post;

      ReadDataSet.Close;
      ReadDataSet.SQLs.SelectSQL.Text := 'Select * From ST_GET_RAZD_STAT_SERVES(:id_serves) where ST_OPTIONS = 1';
      ReadDataSet.ParamByName('id_serves').AsInt64 := ViewForm.id_serves;
      ReadDataSet.Open;

      if ReadDataSet['id_razd'] <> null
       then id_razd := ReadDataSet['id_razd']
       else id_razd := -1;

      if ReadDataSet['Kod_razd'] <> null
       then kod_razd := ReadDataSet['kod_razd']
       else kod_razd := 0;

      if ReadDataSet['id_stat'] <> null
       then id_stat := ReadDataSet['id_stat']
       else id_stat := -1;

      if ReadDataSet['kod_stat'] <> null
       then kod_stat := ReadDataSet['kod_stat']
       else kod_stat := 0;

      MemoryData_sum.Insert;
      MemoryData_sum['md_istochnik']    := ViewForm.Smeta_Edit.Text + '.' + IntToStr(kod_razd) + '.' + IntToStr(kod_stat) + '.' + ViewForm.kekv_Edit.Text;
      MemoryData_sum['md_subs_sum']     := ViewForm.S_SummaEdit.Value;
      MemoryData_sum['md_subs_procent'] := 100;
      MemoryData_sum['md_sum']          := ViewForm.SummaEdit.Value;
      MemoryData_sum['md_procent']      := 100;
      MemoryData_sum['md_id_smeta']     := ViewForm.id_smeta;
      MemoryData_sum['md_id_razdel']    := id_razd;
      MemoryData_sum['md_id_stat']      := id_stat;
      MemoryData_sum['md_id_kekv']      := ViewForm.id_kekv;
      MemoryData_sum['md_name_serves']  := ViewForm.serves_ButtonEdit.Text;
      MemoryData_sum['md_id_serves']    := ViewForm.id_serves;
      MemoryData_sum['md_options']      := 1;
      MemoryData_sum.Post;
     end
    else
     Begin
      ReadDataSet.Close;
      ReadDataSet.SQLs.SelectSQL.Text := 'Select * From ST_GET_RAZD_STAT_SERVES(:id_serves) where ST_OPTIONS = 0';
      ReadDataSet.ParamByName('id_serves').AsInt64 := ViewForm.id_serves;
      ReadDataSet.Open;

      if ReadDataSet['id_razd'] <> null
       then id_razd := ReadDataSet['id_razd']
       else id_razd := -1;

      if ReadDataSet['Kod_razd'] <> null
       then kod_razd := ReadDataSet['kod_razd']
       else kod_razd := 0;

      if ReadDataSet['id_stat'] <> null
       then id_stat := ReadDataSet['id_stat']
       else id_stat := -1;

      if ReadDataSet['kod_stat'] <> null
       then kod_stat := ReadDataSet['kod_stat']
       else kod_stat := 0;

      MemoryData_sum.Insert;
      MemoryData_sum['md_istochnik']    := ViewForm.Smeta_Edit.Text + '.' + IntToStr(kod_razd) + '.' + IntToStr(kod_stat) + '.' + ViewForm.kekv_Edit.Text;
      MemoryData_sum['md_subs_sum']     := ViewForm.S_SummaEdit.Value;;
      MemoryData_sum['md_subs_procent'] := 100;
      MemoryData_sum['md_sum']          := ViewForm.SummaEdit.Value;
      MemoryData_sum['md_procent']      := 100;
      MemoryData_sum['md_id_smeta']     := ViewForm.id_smeta;
      MemoryData_sum['md_id_razdel']    := id_razd;
      MemoryData_sum['md_id_stat']      := id_stat;
      MemoryData_sum['md_id_kekv']      := ViewForm.id_kekv;
      MemoryData_sum['md_name_serves']  := ViewForm.serves_ButtonEdit.Text;
      MemoryData_sum['md_id_serves']    := ViewForm.id_serves;
      MemoryData_sum['md_options']      := 0;
      MemoryData_sum.Post;
     end;

    auto_get_procent;

    cxGrid1DBTableView1.DataController.FocusedRowIndex:=cxGrid1DBTableView1.DataController.RecordCount - 1;
    EditButton.Enabled := true;
    DeleteButton.Enabled := true;
   end;

  ViewForm.Free;
end;

procedure TCategoryFormAddSum.EditButtonClick(Sender: TObject);
var
  i : Integer;
  id_serv : Int64;
  Viewform : TCategoryFormAddFin;
begin
  ViewForm          := TCategoryFormAddFin.Create(Self);
  ViewForm.Caption  := st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
  ViewForm.is_admin := is_admin;
  ViewForm.aHandle  := aHandle;

  ViewForm.id_smeta := MemoryData_sum['md_id_smeta'];
  ViewForm.id_kekv  := MemoryData_sum['md_id_kekv'];

  // нужно пихнуть номера смет, разд... извлечь по ид
  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text := 'select KOD_OBJECT, TITLE_OBJECT from ST_GET_NAME_BUDG_BY_ID('+ inttostr(ViewForm.id_smeta)+ ',1)';
  ReadDataSet.Open;
  if ReadDataSet['TITLE_OBJECT'] <> null
   then ViewForm.Smeta_Label.Caption := ReadDataSet['TITLE_OBJECT'];
  if ReadDataSet['KOD_OBJECT'] <> null
   then ViewForm.Smeta_Edit.Text:= ReadDataSet['KOD_OBJECT'];
  ReadDataSet.Close;

  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text := 'select KOD_OBJECT, TITLE_OBJECT from ST_GET_NAME_BUDG_BY_ID('+ inttostr(ViewForm.id_kekv)+ ',4)';
  ReadDataSet.Open;
  if ReadDataSet['TITLE_OBJECT'] <> null
   then ViewForm.kekv_Label.Caption:=ReadDataSet['TITLE_OBJECT'] ;
  if ReadDataSet['KOD_OBJECT'] <> null
   then ViewForm.KEKV_Edit.Text:= ReadDataSet['KOD_OBJECT'];
  ReadDataSet.Close;

  if MemoryData_sum['md_id_serves'] <> null
   then ViewForm.id_serves := MemoryData_sum['md_id_serves']
   else ViewForm.id_serves := -1;

  if MemoryData_sum['md_name_serves'] <> null
   then ViewForm.serves_ButtonEdit.Text := MemoryData_sum['md_name_serves']
   else ViewForm.serves_ButtonEdit.Text := '';

  if MemoryData_sum['md_id_serves'] <> null
   then id_serv := MemoryData_sum['md_id_serves']
   else id_serv := -1;

  MemoryData_sum.First;
  for i := 0 to MemoryData_sum.RecordCount - 1 do
   Begin
    if MemoryData_sum['md_id_serves'] = id_serv then
    if ((MemoryData_sum['md_options'] = 0) or (MemoryData_sum['md_options'] = 1))
     then
      begin
       ViewForm.SummaEdit.EditValue := MemoryData_sum['md_sum'];
       ViewForm.S_SummaEdit.EditValue := MemoryData_sum['md_subs_sum'];
      end
    else ViewForm.Currency_PDV.EditValue := MemoryData_sum['md_sum'];

    MemoryData_sum.next;
   end;

  if ViewForm.ShowModal = mrOK then
   begin
     //id_serv := MemoryData_sum['md_id_serves'];
     MemoryData_sum.First;
     i := 0;
     while i < MemoryData_sum.RecordCount do
      begin
       if MemoryData_sum['md_id_serves'] = id_serv
        then
         begin
          MemoryData_sum.Delete;
          i := 0;
          MemoryData_sum.First;
         End
        else
         begin
          i := i + 1;
          MemoryData_sum.Next;
         End;
      End;

    if ViewForm.Currency_PDV.EditValue <> 0 then
     Begin
      ReadDataSet.Close;
      ReadDataSet.SQLs.SelectSQL.Text := 'Select * From ST_GET_RAZD_STAT_SERVES(:id_serves) where ST_OPTIONS = 2';
      ReadDataSet.ParamByName('id_serves').AsInt64 := ViewForm.id_serves;
      ReadDataSet.Open;

      if ReadDataSet['id_razd'] <> null
       then id_razd := ReadDataSet['id_razd']
       else id_razd := -1;

      if ReadDataSet['Kod_razd'] <> null
       then kod_razd := ReadDataSet['kod_razd']
       else kod_razd := 0;

      if ReadDataSet['id_stat'] <> null
       then id_stat := ReadDataSet['id_stat']
       else id_stat := -1;

      if ReadDataSet['kod_stat'] <> null
       then kod_stat := ReadDataSet['kod_stat']
       else kod_stat := 0;

      MemoryData_sum.Insert;
      MemoryData_sum['md_istochnik']    := ViewForm.Smeta_Edit.Text + '.' + IntToStr(kod_razd) + '.' + IntToStr(kod_stat) + '.' + ViewForm.kekv_Edit.Text;
      MemoryData_sum['md_subs_sum']     := 0;
      MemoryData_sum['md_subs_procent'] := 100;
      MemoryData_sum['md_sum']          := ViewForm.Currency_PDV.EditValue;
      MemoryData_sum['md_procent']      := 100;
      MemoryData_sum['md_id_smeta']     := ViewForm.id_smeta;
      MemoryData_sum['md_id_razdel']    := id_razd;
      MemoryData_sum['md_id_stat']      := id_stat;
      MemoryData_sum['md_id_kekv']      := ViewForm.id_kekv;
      MemoryData_sum['md_name_serves']  := ViewForm.serves_ButtonEdit.Text;
      MemoryData_sum['md_id_serves']    := ViewForm.id_serves;
      MemoryData_sum['md_options']      := 2;
      MemoryData_sum.Post;

      ReadDataSet.Close;
      ReadDataSet.SQLs.SelectSQL.Text := 'Select * From ST_GET_RAZD_STAT_SERVES(:id_serves) where ST_OPTIONS = 1';
      ReadDataSet.ParamByName('id_serves').AsInt64 := ViewForm.id_serves;
      ReadDataSet.Open;

      if ReadDataSet['id_razd'] <> null
       then id_razd := ReadDataSet['id_razd']
       else id_razd := -1;

      if ReadDataSet['Kod_razd'] <> null
       then kod_razd := ReadDataSet['kod_razd']
       else kod_razd := 0;

      if ReadDataSet['id_stat'] <> null
       then id_stat := ReadDataSet['id_stat']
       else id_stat := -1;

      if ReadDataSet['kod_stat'] <> null
       then kod_stat := ReadDataSet['kod_stat']
       else kod_stat := 0;

      MemoryData_sum.Insert;
      MemoryData_sum['md_istochnik']    := ViewForm.Smeta_Edit.Text + '.' + IntToStr(kod_razd) + '.' + IntToStr(kod_stat) + '.' + ViewForm.kekv_Edit.Text;
      MemoryData_sum['md_subs_sum']     := ViewForm.S_SummaEdit.EditValue;
      MemoryData_sum['md_subs_procent'] := 100;
      MemoryData_sum['md_sum']          := ViewForm.SummaEdit.EditValue;
      MemoryData_sum['md_procent']      := 100;
      MemoryData_sum['md_id_smeta']     := ViewForm.id_smeta;
      MemoryData_sum['md_id_razdel']    := id_razd;
      MemoryData_sum['md_id_stat']      := id_stat;
      MemoryData_sum['md_id_kekv']      := ViewForm.id_kekv;
      MemoryData_sum['md_name_serves']  := ViewForm.serves_ButtonEdit.Text;
      MemoryData_sum['md_id_serves']    := ViewForm.id_serves;
      MemoryData_sum['md_options']      := 1;
      MemoryData_sum.Post;
     end
    else
     Begin
      ReadDataSet.Close;
      ReadDataSet.SQLs.SelectSQL.Text := 'Select * From ST_GET_RAZD_STAT_SERVES(:id_serves) where ST_OPTIONS = 0';
      ReadDataSet.ParamByName('id_serves').AsInt64 := ViewForm.id_serves;
      ReadDataSet.Open;

      if ReadDataSet['id_razd'] <> null
       then id_razd := ReadDataSet['id_razd']
       else id_razd := -1;

      if ReadDataSet['Kod_razd'] <> null
       then kod_razd := ReadDataSet['kod_razd']
       else kod_razd := 0;

      if ReadDataSet['id_stat'] <> null
       then id_stat := ReadDataSet['id_stat']
       else id_stat := -1;

      if ReadDataSet['kod_stat'] <> null
       then kod_stat := ReadDataSet['kod_stat']
       else kod_stat := 0;

      MemoryData_sum.Insert;
      MemoryData_sum['md_istochnik']    := ViewForm.Smeta_Edit.Text + '.' + IntToStr(kod_razd) + '.' + IntToStr(kod_stat) + '.' + ViewForm.kekv_Edit.Text;
      MemoryData_sum['md_subs_sum']     := ViewForm.S_SummaEdit.EditValue;;
      MemoryData_sum['md_subs_procent'] := 100;
      MemoryData_sum['md_sum']          := ViewForm.SummaEdit.EditValue;
      MemoryData_sum['md_procent']      := 100;
      MemoryData_sum['md_id_smeta']     := ViewForm.id_smeta;
      MemoryData_sum['md_id_razdel']    := id_razd;
      MemoryData_sum['md_id_stat']      := id_stat;
      MemoryData_sum['md_id_kekv']      := ViewForm.id_kekv;
      MemoryData_sum['md_name_serves']  := ViewForm.serves_ButtonEdit.Text;
      MemoryData_sum['md_id_serves']    := ViewForm.id_serves;
      MemoryData_sum['md_options']      := 0;
      MemoryData_sum.Post;
     end;

    auto_get_procent;
    MemoryData_sum.Locate('md_id_serves', id_serv, []);
   end;
  ViewForm.Free; 
end;

procedure TCategoryFormAddSum.DeleteButtonClick(Sender: TObject);
var
  i   : integer;
  id_serv : int64;
begin
  If MessageBox(Handle,PChar(st_ConstUnit.st_DeletePromt[PLanguageIndex]),PChar(st_ConstUnit.st_Confirmation_Caption[PLanguageIndex]),MB_YESNO or MB_ICONQUESTION)= mrNo
   then exit;

  if MemoryData_sum['md_id_serves'] <> null
   then id_serv := MemoryData_sum['md_id_serves']
   else id_serv := -1;

  MemoryData_sum.First;
  i := 0;
  while i < MemoryData_sum.RecordCount do
   begin
    if MemoryData_sum['md_id_serves'] = id_serv
     then
      begin
       MemoryData_sum.Delete;
       i := 0;
       MemoryData_sum.First;
      End 
     else
      begin
       i := i + 1;
       MemoryData_sum.Next;
      End;
   End;  

  auto_get_procent;

  If MemoryData_sum.RecordCount = 0 then
   begin
    EditButton.Enabled := false;
    Deletebutton.Enabled := false;
   end;
end;

procedure TCategoryFormAddSum.SubsSummaEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then  OKButton.SetFocus;
end;

procedure TCategoryFormAddSum.DateBegEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then  SummaEdit.SetFocus;
end;

procedure TCategoryFormAddSum.FormShow(Sender: TObject);
begin
  if cxGrid1DBTableView1.DataController.RecordCount = 0 then
   begin
    DateBegEdit.EditValue := Current_day;
    SummaEdit.Value       :=0;
    SubsSummaEdit.Value   := 0;

    EditButton.Enabled   := false;
    Deletebutton.Enabled := false;
   end
  else
   begin
    EditButton.Enabled   := true;
    Deletebutton.Enabled := true;
   end;

  if cxGrid1DBTableView1.DataController.RecordCount > 0
   then cxGrid1DBTableView1.DataController.FocusedRecordIndex := 0;

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
  ReadDataSet.Close;
  ReadDataSet.Sqls.SelectSql.Text := 'Select * from ST_GET_CURRENT_TIMESTAMP';
  ReadDataSet.Open;
  CURRENT_TIMESTAMP := ReadDataSet.FieldByName('CUR_TIMESTAMP').AsDateTime;
  Current_day       := ReadDataSet.FieldByName('CUR_DATE').AsDateTime;

  FormIniLanguage();
  MemoryData_sum.Open;
end;

procedure TCategoryFormAddSum.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
if cxGrid1DBTableView1.DataController.RecordCount = 0 then exit;
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

procedure TCategoryFormAddSum.auto_get_procent;
var
  i : Integer;
  sum, sum_sub : Double;
begin
  if MemoryData_sum.RecordCount = 0 then Exit;
  
  sum_sub := cxGrid1DBTableView1.DataController.Summary.FooterSummaryValues[0];
  sum     := cxGrid1DBTableView1.DataController.Summary.FooterSummaryValues[2];

  MemoryData_sum.First;
  For i := 0 to MemoryData_sum.RecordCount - 1 do
   Begin
    MemoryData_sum.Edit;

    if sum_sub <> 0
     then MemoryData_sum['md_subs_procent'] := MemoryData_sum['md_subs_sum'] / sum_sub * 100
     else MemoryData_sum['md_subs_procent'] := 100 / MemoryData_sum.RecordCount;

    if sum <> 0
     then MemoryData_sum['md_procent'] := MemoryData_sum['md_sum'] / sum * 100
     else MemoryData_sum['md_procent'] := 100 / MemoryData_sum.RecordCount;

    MemoryData_sum.Post;
    MemoryData_sum.Next; 
   End;
end;

end.
