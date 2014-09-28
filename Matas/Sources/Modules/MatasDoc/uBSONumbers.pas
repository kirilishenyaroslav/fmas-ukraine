unit uBSONumbers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ExtCtrls, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, RxMemDS, ibase, cxCheckBox, cxDBEdit,
  cxContainer, cxTextEdit, StdCtrls, cxLookAndFeelPainters, cxButtons;

type
  TBSONumForm = class(TForm)
    pnl1: TPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dsBsoDsr: TDataSource;
    StyleRepository: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    BsoDs: TpFIBDataSet;
    BsoTr: TpFIBTransaction;
    BsoDb: TpFIBDatabase;
    BsoDsID_BSO_KART: TFIBBCDField;
    BsoDsSERIYA: TFIBStringField;
    BsoDsNUMBER: TFIBStringField;
    BsoDsDATE_OUT: TFIBDateField;
    BsoDsDATE_OPR: TFIBDateField;
    cxgrdbclmnGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    ds1: TDataSource;
    RxBSO: TRxMemoryData;
    RxBSOCHECKED: TIntegerField;
    RxBSOID_BSO_K: TIntegerField;
    RxBSOSER: TStringField;
    RxBSOD_OUT: TDateField;
    RxBSOD_OPR: TDateField;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    cxAll: TcxTextEdit;
    cxChoose: TcxTextEdit;
    cxNeed: TcxTextEdit;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxOkButton: TcxButton;
    cxCancelButton: TcxButton;
    RxBSONUM: TFloatField;
    tmr1: TTimer;
    procedure cxgrdbclmnGrid1DBTableView1DBColumn1PropertiesChange(
      Sender: TObject);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxOkButtonClick(Sender: TObject);
    procedure cxCancelButtonClick(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    DBHANDLE:TISC_DB_HANDLE;
    choose, is_add_all:Integer;
    constructor Create(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; ID_OST:Integer; num_kart:integer);overload;
  end;

var
  BSONumForm: TBSONumForm;

implementation

{$R *.dfm}
constructor TBSONumForm.Create(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; ID_OST:Integer; num_kart:integer);
var num_pos:Integer;
    check:Integer;
begin
 inherited Create(AOwner);
 if Assigned(aDBHandle) then
 begin
  Self.DBHANDLE := aDBHandle;
  Self.BsoDb.Close;
  Self.BsoDb.Handle := DBHANDLE;

  Self.BsoDs.Prepare;
  Self.BsoDs.ParamByName('ID_OST').AsInteger:= ID_OST;
  Self.BsoDs.CloseOpen(False);
  Self.BsoDs.FetchAll;
  Self.BsoDs.First;
  num_pos:=1;
  Self.rxBso.Open;
  while not Self.BsoDs.Eof do
  begin
    if num_pos<=num_kart then check:=1 else check:=0;
    Self.rxBSO.Append;
    Self.rxBso.FieldByName('ID_BSO_K').value:=Self.BsoDs['ID_BSO_KART'];
    Self.rxBso.FieldByName('SER').AsString:=Self.BsoDs['SERIYA'];
    Self.rxBso.FieldByName('NUM').AsString:=Self.BsoDs['NUMBER'];
    Self.rxBso.FieldByName('D_OUT').Value:=Self.BsoDs['DATE_OUT'];
    Self.rxBso.FieldByName('D_OPR').value:=Self.BsoDs['DATE_OPR'];
    Self.rxBso.FieldByName('CHECKED').value:=check;

    Self.BsoDs.Next;
    Inc(num_pos);
    Self.rxBSO.Post;
  end;
  Self.rxBSO.First;
  cxNeed.Text:=IntToStr(num_kart);
  cxAll.Text:=IntToStr(Self.rxBso.RecordCount);
  cxChoose.Text:=IntToStr(num_kart);
  choose:= num_kart;
 end;
end;

procedure TBSONumForm.cxgrdbclmnGrid1DBTableView1DBColumn1PropertiesChange(
  Sender: TObject);
begin
 if RxBSO.FieldByName('CHECKED').AsInteger = 0 then choose:=choose-1
 else choose:=choose+1;
 cxChoose.Text:=IntToStr(choose);
end;

procedure TBSONumForm.cxGrid1DBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
 flag: integer;
begin
 flag:=0;
 if ACellViewInfo.Item.Index=0 then
 begin
   if RxBSOCHECKED.AsInteger = 1 then
   begin
     RxBSO.Edit;
     RxBSOCHECKED.AsInteger := 0;
     RxBSO.Post;
     flag:=-1;
   end
   else
   begin
     RxBSO.Edit;
     RxBSOCHECKED.AsInteger := 1;
     RxBSO.Post;
     flag:=1;
   end;
 end;
 AHandled:=true;
 choose:=choose+flag;
 cxChoose.Text:=intToStr(choose);
 if choose=StrToInt(cxNeed.Text) then
  cxOkButton.Enabled:=true
 else
  cxOkButton.Enabled:=false; 
end;


procedure TBSONumForm.cxOkButtonClick(Sender: TObject);
begin
ModalResult:=mrOk;
end;

procedure TBSONumForm.cxCancelButtonClick(Sender: TObject);
begin
Close;
end;

procedure TBSONumForm.tmr1Timer(Sender: TObject);
begin
cxOkButtonClick(Self);
tmr1.Enabled:=False;
end;

procedure TBSONumForm.FormShow(Sender: TObject);
begin
  if is_add_all = 1 then tmr1.Enabled:=True else  tmr1.Enabled:=False;
end;

end.
