unit Contracts_Periods_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxCurrencyEdit,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxControls, cxGroupBox,
  cnConsts,cnConsts_Messages, Dm, ibase;

type
  Tfrm_Contracts_Periods_AE = class(TForm)
    GroupBox: TcxGroupBox;
    Date_End_Label: TLabel;
    Date_End_DateEdit: TcxDateEdit;
    Date_Beg_Label: TLabel;
    Date_Beg_DateEdit: TcxDateEdit;
    Date_Opl_Label: TLabel;
    Date_Opl_DateEdit: TcxDateEdit;
    Summa_Edit: TcxCurrencyEdit;
    Summa_Label: TLabel;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    id_payer_ComboBox: TcxComboBox;
    id_stud_ComboBox: TcxComboBox;
    id_stud_Label: TLabel;
    id_payer_Label: TLabel;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Date_Beg_DateEditKeyPress(Sender: TObject; var Key: Char);
    procedure Date_End_DateEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure Date_Opl_DateEditKeyPress(Sender: TObject; var Key: Char);
    procedure Summa_EditKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Date_Beg_DateEditPropertiesChange(Sender: TObject);
  private
    PLanguageIndex, EndMonth:byte;
    DateStart : TDate;
    DM:TDM_Contracts;
    DBHandle:TISC_DB_HANDLE;
    procedure FormIniLanguage;
  public
     CountMonthAE: integer;
     SummaAE : Currency;
     constructor Create(AOwner:TComponent; LanguageIndex : byte; DBH : TISC_DB_HANDLE);reintroduce;
  end;

implementation
   uses Contract_Add_Edit;
{$R *.dfm}

constructor Tfrm_Contracts_Periods_AE.Create(AOwner:TComponent; LanguageIndex : byte; DBH : TISC_DB_HANDLE);
begin
 Screen.Cursor:=crHourGlass;
 inherited Create(AOwner);
 PLanguageIndex:= LanguageIndex;
 FormIniLanguage();
 DBHandle := DBH;
 // проверяем дату старта системы
 Dm := TDM_Contracts.Create(self);
 Dm.DB.Handle := DBHandle;
 Dm.ReadDataSet.SelectSQL.Text := 'select CN_DATE_START from CN_PUB_SYS_DATA_GET_ALL';
 Dm.ReadDataSet.Open;
 if Dm.ReadDataSet['CN_DATE_START'] <> null then
  DateStart:= Dm.ReadDataSet['CN_DATE_START']
 else
  DateStart:= strtodate('01.01.1900');
 Dm.ReadDataSet.Close;

 // далее проверяем признак разбивки по 30-е число
 Dm.ReadDataSet.SelectSQL.Clear;
 Dm.ReadDataSet.SelectSQL.Text := 'select * from CN_GET_END_MONTH';
 Dm.ReadDataSet.Open;
 if Dm.ReadDataSet['CN_END_MONTH'] <> null then
  EndMonth:= Dm.ReadDataSet['CN_END_MONTH']
 else
  EndMonth:= 0;
 Dm.ReadDataSet.Close;

 Screen.Cursor:=crDefault;
 end;

procedure Tfrm_Contracts_Periods_AE.FormIniLanguage;
begin
Date_Beg_Label.Caption:=   cnConsts.cn_Date_Beg_Label[PLanguageIndex];
Date_End_Label.Caption:=   cnConsts.cn_Date_End_Label[PLanguageIndex];
Date_Opl_Label.Caption:=   cnConsts.cn_Periods_DateOpl[PLanguageIndex];
Summa_Label.Caption:=      cnConsts.cn_Summa_Column[PLanguageIndex];

id_stud_Label.Caption:=      cnConsts.cn_Studer_Osoba[PLanguageIndex];
id_payer_Label.Caption:=     cnConsts.cn_Payer_Osoba[PLanguageIndex];

OkButton.Caption:=              cnConsts.cn_Accept[PLanguageIndex];
CancelButton.Caption:=          cnConsts.cn_Cancel[PLanguageIndex];
end;

procedure Tfrm_Contracts_Periods_AE.OkButtonClick(Sender: TObject);
begin
// проверки на непустые поля заполнения
 if Date_Beg_DateEdit.Text = ''
 then
  begin
   showmessage(cnConsts.cn_Periods_Date_Beg_Need[PLanguageIndex]);
   Date_Beg_DateEdit.SetFocus;
   exit;
  end;

 if Date_End_DateEdit.Text = ''
 then
  begin
   showmessage(cnConsts.cn_Periods_Date_End_Need[PLanguageIndex]);
   Date_End_DateEdit.SetFocus;
   exit;
  end;

 if Date_Opl_DateEdit.Text = ''
 then
  begin
   showmessage(cnConsts.cn_Periods_Date_Pay_Need[PLanguageIndex]);
   Date_Opl_DateEdit.SetFocus;
   exit;
  end;

 {if Summa_Edit.Value = 0
 then
  begin
   showmessage(cnConsts.cn_Periods_Date_PaySum_Need[PLanguageIndex]);
   Summa_Edit.SetFocus;
   exit;
  end;
  }

 // проверяю период- не даю добавлять до даты старта
 if ((Date_Beg_DateEdit.Date < DateStart) or (Date_End_DateEdit.Date < DateStart)) then
  begin
   showmessage(cn_PeriodsLessDateStart[PLanguageIndex]);
   exit;
  end;

 if (Date_Beg_DateEdit.Date >= Date_End_DateEdit.Date ) then
  begin
   showmessage(cn_DateBegNeedMoreDateEnd[PLanguageIndex]);
   Date_End_DateEdit.SetFocus;
   exit;
  end;

  ModalResult:=mrOk;
end;

procedure Tfrm_Contracts_Periods_AE.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure Tfrm_Contracts_Periods_AE.FormShow(Sender: TObject);
begin
Date_Beg_DateEdit.setfocus;
end;

procedure Tfrm_Contracts_Periods_AE.Date_Beg_DateEditKeyPress(
  Sender: TObject; var Key: Char);
begin
if key = #13 then  Date_End_DateEdit.SetFocus;
end;

procedure Tfrm_Contracts_Periods_AE.Date_End_DateEditKeyPress(
  Sender: TObject; var Key: Char);
begin
if key = #13 then  Date_Opl_DateEdit.SetFocus;
end;

procedure Tfrm_Contracts_Periods_AE.Date_Opl_DateEditKeyPress(
  Sender: TObject; var Key: Char);
begin
if key = #13 then  Summa_Edit.SetFocus;
end;

procedure Tfrm_Contracts_Periods_AE.Summa_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then  OkButton.SetFocus;
end;

procedure Tfrm_Contracts_Periods_AE.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Dm.Free;
end;

procedure Tfrm_Contracts_Periods_AE.Date_Beg_DateEditPropertiesChange(
  Sender: TObject);
begin
if Caption = cnConsts.cn_InsertBtn_Caption[PLanguageIndex] then
 if Length(Date_Beg_DateEdit.Text)= 10 then
  begin
   Date_Beg_DateEdit.Date := strtodate(Date_Beg_DateEdit.Text);
   DM.StProc.StoredProcName := 'CN_INC_DATE';
   DM.StProc.Transaction.StartTransaction;
   DM.StProc.Prepare;
   DM.StProc.ParamByName('INDATE').AsDate := Date_Beg_DateEdit.Date;
   DM.StProc.ParamByName('CNT_DAY').AsVariant := null;
   DM.StProc.ParamByName('CNT_YEAR').AsVariant := null;
   DM.StProc.ParamByName('CNT_MONTH').AsInteger := CountMonthAE;
   DM.StProc.ExecProc;
   Date_End_DateEdit.Date := DM.StProc.ParamByName('OUTDATE').AsDate;
   DM.StProc.Transaction.Commit;
    if bool(EndMonth) then
     begin
        DM.StProc.StoredProcName := 'CN_INC_DATE';
        DM.StProc.Transaction.StartTransaction;
        DM.StProc.Prepare;
        DM.StProc.ParamByName('INDATE').AsDate := Date_End_DateEdit.Date;
        DM.StProc.ParamByName('CNT_DAY').AsInteger := -1;
        DM.StProc.ParamByName('CNT_YEAR').AsVariant := null;
        DM.StProc.ParamByName('CNT_MONTH').AsVariant := null;
        DM.StProc.ExecProc;
        Date_End_DateEdit.Date := DM.StProc.ParamByName('OUTDATE').AsDate;
        DM.StProc.Transaction.Commit;
     end;
      Date_Opl_DateEdit.Date := Date_End_DateEdit.Date;
      Summa_Edit.Value := SummaAE;
  end;

end;

end.
