//***********************************************************************
//* Проект "Студгородок"                                                *
//* Справка об оплате за проживание                                     *
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//***********************************************************************
unit St_pfio_OplataSprav_Form_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCalendar, cxCurrencyEdit,
  StdCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView, cxClasses,
  cxControls, cxGridCustomView, cxGridDBTableView, cxGrid,
  cxLookAndFeelPainters, cxButtons, FIBDataSet, pFIBDataSet, ExtCtrls,
  cxTextEdit, cxContainer, cxGroupBox,
  St_Proc, st_ConstUnit , st_Common_Types, st_Common_Loader;
  
type
  TSt_pfio_OplataSprav_Form = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    FIO_Label: TLabel;
    Fac_Label: TLabel;
    Kurs_Label: TLabel;
    DataRog_Label: TLabel;
    CancelButton: TcxButton;
    DataSet: TpFIBDataSet;
    DataSource: TDataSource;
    Beg_Date: TcxGridDBColumn;
    End_Date: TcxGridDBColumn;
    Pay_Sum: TcxGridDBColumn;
    Persent: TcxGridDBColumn;
    Sum_Subs: TcxGridDBColumn;
    Cnt_Month: TcxGridDBColumn;
    Summa: TcxGridDBColumn;
    id_kategory: TcxGridDBColumn;
    FIOCOMBO_Label: TLabel;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    Doc_num: TcxGridDBColumn;
    Doc_date: TcxGridDBColumn;
    Doc_summa: TcxGridDBColumn;
    Note: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    DataSource1: TDataSource;
    ReadDataSet: TpFIBDataSet;
    cxGroupBox1: TcxGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Zadolg_Label: TLabel;
    DateOpl_Label: TLabel;
    Label8: TLabel;
    St_SNeed_Edit: TcxCurrencyEdit;
    St_UplSum_Edit: TcxCurrencyEdit;
    Zadolgnost_Edit: TcxCurrencyEdit;
    Today_Opl_Edit: TcxCurrencyEdit;
    Label9: TLabel;
    Label10: TLabel;
    zadolg_grn_Label: TLabel;
    Label12: TLabel;
    Comment_Label: TLabel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure ReadDataSetAfterOpen(DataSet: TDataSet);
    procedure ReadDataSetAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxGridDBTableView1DblClick(Sender: TObject);
    procedure cxGridDBTableView1KeyPress(Sender: TObject; var Key: Char);
  private
    PLanguageIndex: byte;
    procedure FormIniLanguage();
  public
      id_session_calc, id_session_PAY: int64;
      procedure SelectAll;
  end;

var
  St_pfio_OplataSprav_Form: TSt_pfio_OplataSprav_Form;

implementation

uses DataModule1_Unit;

{$R *.dfm}


procedure TSt_pfio_OplataSprav_Form.FormIniLanguage();
begin
 // индекс языка (1-укр, 2 - рус)
 PLanguageIndex:=               St_Proc.cnLanguageIndex;
 //названия кнопок
 CancelButton.Caption :=         st_ConstUnit.st_Cancel[PLanguageIndex];
 FIO_Label.Caption:= st_ConstUnit.st_grid_FIO_Column[PLanguageIndex];
 Fac_Label.Caption:=st_ConstUnit.st_footer_Faculty[PLanguageIndex];
 Kurs_Label.Caption:=st_ConstUnit.st_footer_Kurs[PLanguageIndex];
 DataRog_Label.Caption:=st_ConstUnit.st_DateBorn[PLanguageIndex];

 Beg_Date.Caption:=st_ConstUnit.st_Beg_Opl[PLanguageIndex];
 End_Date.Caption:=st_ConstUnit.st_End_Opl[PLanguageIndex];
 Pay_Sum.Caption:=st_ConstUnit.st_Summa_Opl[PLanguageIndex];
 Persent.Caption:=st_ConstUnit.st_Percent_Opl[PLanguageIndex];
 Sum_Subs.Caption:=st_ConstUnit.st_SubsSumma_Opl[PLanguageIndex];
 Cnt_Month.Caption:=st_ConstUnit.st_MonthCount_Opl[PLanguageIndex];
 Summa.Caption:=st_ConstUnit.st_SummFinal_Opl[PLanguageIndex];

 cxGroupBox1.Caption:=st_ConstUnit.st_Itogo_Pay[PLanguageIndex];

 Label4.Caption:=st_ConstUnit.st_Need_Pay[PLanguageIndex];
 Label5.Caption:=st_ConstUnit.st_Was_Pay[PLanguageIndex];
 Zadolg_Label.Caption:=st_ConstUnit.st_Zadolg_Pay[PLanguageIndex];
 DateOpl_Label.Caption:=st_ConstUnit.st_PayPo_Pay[PLanguageIndex];
 Label8.Caption:=st_ConstUnit.st_Now_Pay[PLanguageIndex];
 Comment_Label.Caption:=st_ConstUnit.st_Hint_Pay[PLanguageIndex];

 Doc_num.Caption:=st_ConstUnit.st_NumDoc_Pay[PLanguageIndex];
 Doc_date.Caption:=st_ConstUnit.st_DateDoc_Pay[PLanguageIndex];
 Doc_summa.Caption:=st_ConstUnit.st_Summa_Pay[PLanguageIndex];
end;

 procedure TSt_pfio_OplataSprav_Form.SelectAll;

 begin
 DataSet.SelectSQL.Clear;
 DataSet.SelectSQL.text:= 'select * from ST_TMP_TN_CALC_SELECT('+ IntToStr(id_session_calc)+')'+ 'order by beg_date desc';

 ReadDataSet.SelectSQL.Clear;
 ReadDataSet.SelectSQL.text:= 'select * from ST_TMP_DOC_SELECT('+ IntToStr(id_session_pay)+')';

 if DataSet.Active then DataSet.CloseOpen(True)
else DataSet.Open;
if ReadDataSet.Active then  ReadDataSet.CloseOpen(True)
else ReadDataSet.Open;
 end;

procedure TSt_pfio_OplataSprav_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
ModalResult:=mrOk;
end;

procedure TSt_pfio_OplataSprav_Form.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TSt_pfio_OplataSprav_Form.OkButtonClick(Sender: TObject);
begin
ModalResult:=mrOk;
end;

procedure TSt_pfio_OplataSprav_Form.ReadDataSetAfterOpen(
  DataSet: TDataSet);
begin
if  ReadDataSet.RecordCount<> 0 then begin
if ReadDataSet['NOTE'] <> null then Comment_Label.Caption := ReadDataSet['NOTE'];
end;
end;

procedure TSt_pfio_OplataSprav_Form.ReadDataSetAfterScroll(
  DataSet: TDataSet);
begin
if ReadDataSet.RecordCount = 0 then exit;
if ReadDataSet.RecordCount<> 0 then begin
if ReadDataSet['NOTE'] <> null then Comment_Label.Caption := ReadDataSet['NOTE'];
end;
end;

procedure TSt_pfio_OplataSprav_Form.FormShow(Sender: TObject);
begin
SelectAll;
 if Zadolgnost_Edit.Value = 0 then
  begin
   Zadolgnost_Edit.Visible:=false;
   zadolg_grn_Label.Visible:=false;
   Zadolg_Label.Font.Color:=$0085732C ;
   Zadolg_Label.Caption:= st_ConstUnit.st_FullOplata[PLanguageIndex];
  end;
end;

procedure TSt_pfio_OplataSprav_Form.FormCreate(Sender: TObject);
begin
FormIniLanguage();
end;

procedure TSt_pfio_OplataSprav_Form.cxGridDBTableView1DblClick(
  Sender: TObject);
var AParameter : TstSimpleParamsEx;
  begin
if cxGridDBTableView1.DataController.RecordCount = 0 then exit;
 AParameter:= TstSimpleParamsEx.Create;
 AParameter.Owner:=self;
 AParameter.Db_Handle:= DataModule1.DB.Handle;
 AParameter.Formstyle:=fsNormal;
// AParameter.cnParamsToPakage.ID_DOC := strtoint(DM.Dataset.FieldByName('ID_DOC_VARCHAR').AsVariant);
 AParameter.stParamsToPakage.ID_DOC := StrToInt64(ReadDataset['ID_DOC_VARCHAR']);
 AParameter.WaitPakageOwner:= self;
 RunFunctionFromPackage(AParameter, 'Studcity\st_inf_DocsProv_DB_KR_Info.bpl','StShowDocProvInfo');
 AParameter.Free;
 Screen.Cursor := crDefault;
end;

procedure TSt_pfio_OplataSprav_Form.cxGridDBTableView1KeyPress(
  Sender: TObject; var Key: Char);
begin
if key = #13 then cxGridDBTableView1DblClick(Sender);
end;

end.
