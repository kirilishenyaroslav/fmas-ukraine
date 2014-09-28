unit AllBank;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, StdCtrls, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxControls,
  cxGridCustomView, cxGrid, cxClasses, FIBDataSet, pFIBDataSet,
  FIBDatabase, pFIBDatabase,Ibase,ConstClBank, cxTextEdit;

type
  TfrmAllBank = class(TForm)
    DataBase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    pFIBDataSetAllBank: TpFIBDataSet;
    DataSourceAllBank: TDataSource;
    StyleRepository: TcxStyleRepository;
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
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyleYellow: TcxStyle;
    cxStyleFontBlack: TcxStyle;
    cxStyleMalin: TcxStyle;
    cxStyleBorder: TcxStyle;
    cxStylemalinYellow: TcxStyle;
    cxStyleGrid: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    GroupBox1: TGroupBox;
    cxGridAllBank: TcxGrid;
    cxGridAllBankDBTableView1: TcxGridDBTableView;
    SHORT_NAME: TcxGridDBColumn;
    SECTION: TcxGridDBColumn;
    LAST_RUNS: TcxGridDBColumn;
    cxGridAllBankLevel1: TcxGridLevel;
    GroupBox3: TGroupBox;
    LabelSpL: TLabel;
    LabelSP: TLabel;
    LabelFileL: TLabel;
    LabelFile: TLabel;
    procedure pFIBDataSetAllBankAfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxGridAllBankDBTableView1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxGridAllBankDBTableView1KeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    constructor Create (AOwner : TComponent;DB:TISC_DB_HANDLE);overload;
    { Public declarations }
  end;
function RunClBank(AOwner : TComponent;DB:TISC_DB_HANDLE):integer;stdcall;
exports RunClBank;

var
  frmAllBank: TfrmAllBank;

implementation
uses
  LogForm;
{$R *.dfm}
function RunClBank(AOwner : TComponent;DB:TISC_DB_HANDLE):integer;
var
  Bank:TfrmAllBank;
begin
  Bank:=TfrmAllBank.Create(AOwner,DB);
end;

constructor TfrmAllBank.Create (AOwner : TComponent;DB:TISC_DB_HANDLE);
begin
  Inherited Create(AOwner);
  Database.Handle:=DB;
  pFIBDataSetAllBank.Active:=false;
  pFIBDataSetAllBank.Active:=true;
end;

procedure TfrmAllBank.pFIBDataSetAllBankAfterScroll(DataSet: TDataSet);
begin
  LabelSP.Caption:=pFIBDataSetAllBank.FieldByName('NAME_SP').AsString;
  //LabelFile.Caption:=pFIBDataSetAllBank.FieldByName('PATH_FILE').AsString;
  if (pFIBDataSetAllBank.FieldByName('CHOOSE_FILE').AsInteger=0) then
      begin
          LabelFile.Caption:=pFIBDataSetAllBank.FieldByName('PATH_FILE').AsString ;
          LabelFile.Visible  := true;
          LabelFileL.Visible := true;
      end
  else
      begin
           LabelFile.Visible := false;
           LabelFileL.Visible := false;
      end;
end;

procedure TfrmAllBank.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmAllBank.cxGridAllBankDBTableView1DblClick(Sender: TObject);
var
  log:TFormLog;
begin
if pFIBDataSetAllBank.RecordCount>0 then
  begin
    log:=TFormLog.Create(self,DataBase.Handle,pFIBDataSetAllBank.FieldByName('ID_BANK').AsVariant,pFIBDataSetAllBank.FieldByName('SECTION').AsVariant,pFIBDataSetAllBank.FieldByName('SHORT_NAME').AsString);
  end;
end;

procedure TfrmAllBank.FormCreate(Sender: TObject);
begin
  SHORT_NAME.Caption:=ConstClBank.ClBank_NAME_BANK;
  SECTION.Caption:=ConstClBank.ClBank_CODE_BANK;
  LAST_RUNS.Caption:=ConstClBank.ClBank_LAST_RUN;
  LabelSpL.Caption:=ConstClBank.ClBank_SP;
  LabelFileL.Caption:=ConstClBank.ClBank_FILE;
end;

procedure TfrmAllBank.cxGridAllBankDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if Key=VK_RETURN	then
  begin
   cxGridAllBankDBTableView1DblClick(self);
  end;
end;

end.
