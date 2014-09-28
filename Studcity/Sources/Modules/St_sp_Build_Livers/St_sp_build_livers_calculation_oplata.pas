//***********************************************************************
//* Проект "Студгородок"                                                *
//* Форма анализа оплаты                                                *
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//***********************************************************************
unit St_sp_build_livers_calculation_oplata;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCurrencyEdit, cxCalendar,
  cxLookAndFeelPainters, FIBDataSet, pFIBDataSet, cxContainer, cxTextEdit,
  cxGroupBox, StdCtrls, cxButtons, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid;

type
  TOplataSprav_Form = class(TForm)
    FIO_Label: TLabel;
    Fac_Label: TLabel;
    Kurs_Label: TLabel;
    DataRog_Label: TLabel;
    FIOCOMBO_Label: TLabel;
    Comment_Label: TLabel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    id_kategory: TcxGridDBColumn;
    Beg_Date: TcxGridDBColumn;
    End_Date: TcxGridDBColumn;
    Pay_Sum: TcxGridDBColumn;
    Persent: TcxGridDBColumn;
    Sum_Subs: TcxGridDBColumn;
    Cnt_Month: TcxGridDBColumn;
    Summa: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    CancelButton: TcxButton;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    Doc_num: TcxGridDBColumn;
    Doc_date: TcxGridDBColumn;
    Doc_summa: TcxGridDBColumn;
    Note: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGroupBox1: TcxGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DateOpl_Label: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    St_SNeed_Edit: TcxCurrencyEdit;
    St_UplSum_Edit: TcxCurrencyEdit;
    Zadolgnost_Edit: TcxCurrencyEdit;
    Today_Opl_Edit: TcxCurrencyEdit;
    DataSet: TpFIBDataSet;
    DataSource: TDataSource;
    DataSource1: TDataSource;
    ReadDataSet: TpFIBDataSet;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    procedure ReadDataSetAfterOpen(DataSet: TDataSet);
    procedure ReadDataSetAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
                    id_session_calc,
                    id_session_pay: int64;
      procedure SelectAll;
  end;

var
  OplataSprav_Form: TOplataSprav_Form;

implementation

{$R *.dfm}
procedure TOplataSprav_Form.SelectAll;
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

procedure TOplataSprav_Form.FormShow(Sender: TObject);
begin
selectall;
end;

procedure TOplataSprav_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
modalresult:=mrOk;
end;

procedure TOplataSprav_Form.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TOplataSprav_Form.ReadDataSetAfterOpen(DataSet: TDataSet);
begin
if  ReadDataSet.RecordCount<> 0 then begin
if ReadDataSet['NOTE'] <> null then Comment_Label.Caption := ReadDataSet['NOTE'];
end;
end;

procedure TOplataSprav_Form.ReadDataSetAfterScroll(DataSet: TDataSet);
begin
if ReadDataSet.RecordCount = 0 then exit;
if ReadDataSet.RecordCount<> 0 then begin
if ReadDataSet['NOTE'] <> null then Comment_Label.Caption := ReadDataSet['NOTE'];
end;
end;

end.
