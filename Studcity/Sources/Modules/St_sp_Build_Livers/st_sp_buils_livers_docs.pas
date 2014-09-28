unit st_sp_buils_livers_docs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxCalendar,
  cxCurrencyEdit, cxContainer, cxTextEdit, ExtCtrls, StdCtrls, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, FIBDataSet, pFIBDataSet, cxButtons,
  ImgList, ibase, LoadPackegeStudCity;

type
  TDocsOpl_Form = class(TForm)
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    ReadDataSet: TpFIBDataSet;
    DataSource: TDataSource;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    Doc_num: TcxGridDBColumn;
    Doc_date: TcxGridDBColumn;
    Doc_summa: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Label1: TLabel;
    Fio_Label: TLabel;
    Label2: TLabel;
    DateBeg_Label: TLabel;
    Label3: TLabel;
    DateEnd_Label: TLabel;
    Image1: TImage;
    Sum_Result: TcxCurrencyEdit;
    Comment_Label: TLabel;
    Note: TcxGridDBColumn;
    ImageList1: TImageList;
    cxButton1: TcxButton;
    OkButton: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure ReadDataSetAfterOpen(DataSet: TDataSet);
    procedure ReadDataSetAfterScroll(DataSet: TDataSet);
    procedure OkButtonClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
   SheglovHandle: TISC_DB_HANDLE;
   SheglovItem_id: Int64;
  end;

var
  DocsOpl_Form: TDocsOpl_Form;

implementation

{$R *.dfm}

procedure TDocsOpl_Form.FormShow(Sender: TObject);
var
i: integer;
begin
Sum_Result.Value:=0;
  for i:=0 to  cxGrid1DBTableView1.DataController.RecordCount-1 do begin
  Sum_Result.Value:= Sum_Result.Value + cxGrid1DBTableView1.DataController.Values[i, 2];
  end;

  OkButton.SetFocus;
end;

procedure TDocsOpl_Form.ReadDataSetAfterOpen(DataSet: TDataSet);
begin
if  ReadDataSet.RecordCount<> 0 then begin
if ReadDataSet['NOTE'] <> null then Comment_Label.Caption := ReadDataSet['NOTE'];
end;
end;

procedure TDocsOpl_Form.ReadDataSetAfterScroll(DataSet: TDataSet);
begin
if ReadDataSet.RecordCount = 0 then exit;
if ReadDataSet.RecordCount<> 0 then begin
if ReadDataSet['NOTE'] <> null then Comment_Label.Caption := ReadDataSet['NOTE'];
end;
end;

procedure TDocsOpl_Form.OkButtonClick(Sender: TObject);
begin
close;
end;

procedure TDocsOpl_Form.cxButton1Click(Sender: TObject);
begin
  LoadPackegeStudCity.LoadViewPrintPropi(self,SheglovHandle, SheglovItem_id, 0,'ST_PAY');
end;

procedure TDocsOpl_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
modalresult:=mrOk;
end;

end.
