unit AllConfgi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, ComCtrls, FIBDatabase, pFIBDatabase,
  ExtCtrls, FIBDataSet, pFIBDataSet,ibase, cxCheckBox, ToolWin,
  cxDropDownEdit, cxTextEdit,ConstClBank, ImgList, cxContainer;

type
  TfrmAllConfig = class(TForm)
    ReadTransaction: TpFIBTransaction;
    DataBase: TpFIBDatabase;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    cxGridAllBankDBTableView1: TcxGridDBTableView;
    cxGridAllBankLevel1: TcxGridLevel;
    cxGridAllBank: TcxGrid;
    GroupBox2: TGroupBox;
    cxGridParamDBTableView1: TcxGridDBTableView;
    cxGridParamLevel1: TcxGridLevel;
    cxGridParam: TcxGrid;
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
    Splitter1: TSplitter;
    WriteTransaction: TpFIBTransaction;
    pFIBDataSetAllBank: TpFIBDataSet;
    DataSourceAllBank: TDataSource;
    SHORT_NAME: TcxGridDBColumn;
    SECTION: TcxGridDBColumn;
    TYPE_FILE: TcxGridDBColumn;
    LAST_RUNS: TcxGridDBColumn;
    GroupBox3: TGroupBox;
    LabelSPL: TLabel;
    LabelSP: TLabel;
    LabelFileL: TLabel;
    LabelFile: TLabel;
    pFIBDataSetParam: TpFIBDataSet;
    DataSourceParam: TDataSource;
    NAME_SP_PARAMETRS: TcxGridDBColumn;
    NAME_FILE_PARAMETRS: TcxGridDBColumn;
    ToolBar1: TToolBar;
    ToolButtonEdit: TToolButton;
    ImageList1: TImageList;
    ToolButtonClose: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure pFIBDataSetAllBankAfterScroll(DataSet: TDataSet);
    procedure ToolButtonEditClick(Sender: TObject);
    procedure ToolButtonCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
   constructor Create(AOwner : TComponent;DB:TISC_DB_HANDLE);overload;
    { Public declarations }
  end;
function ConfigClBank(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;stdcall;
exports ConfigClBank;
var
  frmAllConfig: TfrmAllConfig;

implementation
uses
  CongifFormClBank;
{$R *.dfm}
function ConfigClBank(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;
var
  frm:TfrmAllConfig;
begin
  frm:=TfrmAllConfig.Create(AOwner,DB);
end;

constructor TfrmAllConfig.Create(AOwner : TComponent;DB:TISC_DB_HANDLE);
begin
  inherited Create(AOwner);
  DataBase.handle:=DB;
end;

procedure TfrmAllConfig.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmAllConfig.FormCreate(Sender: TObject);
begin
  //загрузка интерфейса
  SHORT_NAME.Caption:=ConstClBank.ClBank_NAME_BANK;
  SECTION.Caption:=ConstClBank.ClBank_CODE_BANK;
  TYPE_FILE.Caption:=ConstClBank.ClBank_TYPE_FILE;
  LAST_RUNS.Caption:=ConstClBank.ClBank_LAST_RUN;
  NAME_SP_PARAMETRS.Caption:=ConstClBank.ClBank_SP_PARAM;
  NAME_FILE_PARAMETRS.Caption:=ConstClBank.ClBank_FILE_FIELDS;
  ToolButtonEdit.Caption:=ConstClBank.ClBank_ACTION_EDIT_CONST;
  ToolButtonClose.Caption:=ConstClBank.ClBank_ACTION_CLOSE_CONST;
  Caption:=ConstclBank.ClBank_SETUP;
  LabelSPL.Caption:=ConstclBank.ClBank_SP;
  LabelFileL.Caption:=ConstclBank.ClBank_FILE;

  pFIBDataSetAllBank.Active:=false;
  pFIBDataSetAllBank.Active:=true;
end;

procedure TfrmAllConfig.pFIBDataSetAllBankAfterScroll(DataSet: TDataSet);
begin
  LabelSP.Caption:=pFIBDataSetAllBank.FieldByName('NAME_SP').AsString;
  if (pFIBDataSetAllBank.FieldByName('CHOOSE_FILE').AsInteger=0) then
      begin
          LabelFile.Caption:=pFIBDataSetAllBank.FieldByName('PATH_FILE').AsString ;
          LabelFile.Visible  := true;
          LabelFileL.Visible := true;
      end
     // LabelFile.Caption:=pFIBDataSetAllBank.FieldByName('PATH_FILE').AsString
  else
      begin
           LabelFile.Visible := false;
           LabelFileL.Visible := false;
      end;
  pFIBDataSetParam.Active:=false;
  pFIBDataSetParam.ParamByName('PARAM_BANK').Value:=pFIBDataSetAllBank.FieldByName('ID_BANK').AsVariant;
  pFIBDataSetParam.Active:=true;

end;

procedure TfrmAllConfig.ToolButtonEditClick(Sender: TObject);
var
  conf:TfrmConfigExports;
begin
  conf:=TfrmConfigExports.Create(self,DataBase.Handle,pFIBDataSetAllBank.FieldByName('ID_BANK').AsString,pFIBDataSetAllBank.FieldByName('FULL_NAME').AsString);
  conf.ShowModal;
  conf.free;
  pFIBDataSetAllBank.Active:=false;
  pFIBDataSetAllBank.Active:=true;
end;

procedure TfrmAllConfig.ToolButtonCloseClick(Sender: TObject);
begin
  close;
end;

end.
