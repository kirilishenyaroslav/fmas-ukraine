unit platInfoForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, ExtCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxLookAndFeelPainters, StdCtrls, cxButtons, FIBDatabase, pFIBDatabase,
  cxCalendar, cxCurrencyEdit, cxCheckBox, cxLabel, cxContainer, cxTextEdit,
  cxMaskEdit, cxDropDownEdit;

type
  TfrmPlatInfo = class(TForm)
    DataSetInfo: TpFIBDataSet;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView2: TcxGridDBTableView;
    cxGrid1DBTableView2ID_DOG_DT_PL_SMET: TcxGridDBColumn;
    cxGrid1DBTableView2ID_KEY: TcxGridDBColumn;
    cxGrid1DBTableView2ID_SMETA: TcxGridDBColumn;
    cxGrid1DBTableView2ID_RAZD: TcxGridDBColumn;
    cxGrid1DBTableView2ID_STAT: TcxGridDBColumn;
    cxGrid1DBTableView2SUMMA: TcxGridDBColumn;
    cxGrid1DBTableView3: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    Panel2: TPanel;
    DataSourceInfo: TDataSource;
    cxGrid1DBTableView1RATE_ACCOUNT: TcxGridDBColumn;
    cxGrid1DBTableView1MFO: TcxGridDBColumn;
    cxGrid1DBTableView1SUM_PLAT: TcxGridDBColumn;
    cxGrid1DBTableView1SUM_ZAYAV_NEOPL: TcxGridDBColumn;
    cxGrid1DBTableView1SUM_ZAYAV: TcxGridDBColumn;
    DateBegEdit: TcxDateEdit;
    DateEndEdit: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    RefreshButton: TcxButton;
    cxButton1: TcxButton;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    procedure cxButton1Click(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DateBegEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DateEndEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  public
    where_cond : string;    
  private
    procedure SelectAll;
  end;

var
  frmPlatInfo: TfrmPlatInfo;

implementation
uses WSUnit;
{$R *.dfm}

procedure TfrmPlatInfo.cxButton1Click(Sender: TObject);
begin
 Close;
end;

procedure TfrmPlatInfo.RefreshButtonClick(Sender: TObject);
begin
 SelectAll;
end;

procedure TfrmPlatInfo.SelectAll;
var
 f : TForm;
begin
 f := WaitScreenShow(Self);
 DataSetInfo.Close;
 DataSetInfo.ParamByName('DATE_BEG').AsDate := DateBegEdit.Date;
 DataSetInfo.ParamByName('DATE_END').AsDate := DateEndEdit.Date;
 DataSetInfo.Open;
 WaitScreenClose(f);
end;

procedure TfrmPlatInfo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 DataSetInfo.Close;
end;

procedure TfrmPlatInfo.FormCreate(Sender: TObject);
begin
 DateBegEdit.Date := now;
 DateEndEdit.Date := now;
end;

procedure TfrmPlatInfo.FormShow(Sender: TObject);
begin
 SelectAll;
end;

procedure TfrmPlatInfo.DateBegEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_RETURN then
 begin
   DateEndEdit.SetFocus;
 end
end;

procedure TfrmPlatInfo.DateEndEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_RETURN then
 begin
   RefreshButton.SetFocus;
 end
end;

end.
