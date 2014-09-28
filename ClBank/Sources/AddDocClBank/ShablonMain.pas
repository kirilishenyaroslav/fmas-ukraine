unit ShablonMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, StdCtrls, cxGridLevel, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxClasses, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet,IBase, cxContainer, cxLabel, cxTextEdit, cxMemo,
  ToolWin, ImgList,ConstClBank, FIBQuery, pFIBQuery, pFIBStoredProc,
  ActnList;

type
  TfrmShablonMain = class(TForm)
    StatusBar1: TStatusBar;
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
    cxGrid: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    GroupBox1: TGroupBox;
    pFIBDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    pFIBDataSetShablon: TpFIBDataSet;
    DataSourceShablon: TDataSource;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    cxLabel1: TcxLabel;
    cxLabelRSCust: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabelMFOCUST: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabelRSNative: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabelMFONative: TcxLabel;
    cxGridDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridDBTableView1DBColumn3: TcxGridDBColumn;
    GroupBox4: TGroupBox;
    cxMemoNote: TcxMemo;
    cxLabelCust: TcxLabel;
    cxLabelCustNative: TcxLabel;
    ToolBar1: TToolBar;
    ToolButtonADD: TToolButton;
    ToolButtonEdit: TToolButton;
    ToolButtonDelete: TToolButton;
    ToolButtonGet: TToolButton;
    LargeImages: TImageList;
    ToolButtonExit: TToolButton;
    pFIBStoredProcAll: TpFIBStoredProc;
    WriteTransaction: TpFIBTransaction;
    actlst1: TActionList;
    ActionClose: TAction;
    ActionAdd: TAction;
    procedure cxGridDBTableView1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxGridDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pFIBDataSetShablonAfterScroll(DataSet: TDataSet);
    procedure ToolButtonExitClick(Sender: TObject);
    procedure ToolButtonGetClick(Sender: TObject);
    procedure ToolButtonADDClick(Sender: TObject);
    procedure ToolButtonEditClick(Sender: TObject);
    procedure ToolButtonDeleteClick(Sender: TObject);
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
  private

    { Private declarations }
  public
    id_native:int64;
    function GetShablon():Variant;
    constructor Create (AOwner : TComponent;DB:TISC_DB_HANDLE;ID_ACC_NATIVE:INT64);overload;
    { Public declarations }
  end;

var
  frmShablonMain: TfrmShablonMain;
  id_shablon:Variant;

implementation
uses
  FormAddDocClBank,
  AddShablon;
{$R *.dfm}
constructor TfrmShablonMain.Create (AOwner : TComponent;DB:TISC_DB_HANDLE;ID_ACC_NATIVE:INT64);
begin
  Inherited Create(AOwner);
  pFIBDatabase.Handle:=DB;

  id_native:=ID_ACC_NATIVE;

  pFIBDataSetShablon.Active:=false;
  pFIBDataSetShablon.SQLs.SelectSQL.Clear;
  pFIBDataSetShablon.SQLs.SelectSQL.Text:='select * from CLBANK_INI_SHABLON_VIEW';
  if ID_ACC_NATIVE=-99999 then
    begin
      ToolButtonGet.Visible:=false;
      pFIBDataSetShablon.Active:=true;
    end;
  if ID_ACC_NATIVE>0 then
    begin
      pFIBDataSetShablon.SQLs.SelectSQL.Add(' where ID_ACC_NATIVE=:param_acc_native or ID_ACC_NATIVE is null');
      pFIBDataSetShablon.ParamByName('param_acc_native').AsInt64:=ID_ACC_NATIVE;
      pFIBDataSetShablon.Active:=true;
    end;
  if ID_ACC_NATIVE=0 then
    begin
      pFIBDataSetShablon.Active:=true;
    end;
end;

function TfrmShablonMain.GetShablon():Variant;
begin
  ShowModal;
  GetShablon:=id_shablon;
  free;
end;

procedure TfrmShablonMain.cxGridDBTableView1DblClick(Sender: TObject);
begin
  id_shablon:=pFIBDataSetShablon.fieldbyname('id_shablon').AsVariant;
  close;
end;

procedure TfrmShablonMain.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//id_shablon:=0;
end;

procedure TfrmShablonMain.cxGridDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if KEY=VK_RETURN then
  begin
    if pFIBDataSetShablon.RecordCount>0 then
      begin
        id_shablon:=pFIBDataSetShablon.fieldbyname('id_shablon').AsVariant;
        close;
      end;
  end;
end;

procedure TfrmShablonMain.pFIBDataSetShablonAfterScroll(DataSet: TDataSet);
begin
if pFIBDataSetShablon.FieldByName('ACC_CUST').AsString<>'' then
  begin
    cxLabelRSCust.Caption:=pFIBDataSetShablon.FieldByName('ACC_CUST').AsString;
    cxLabelMFOCUST.Caption:=pFIBDataSetShablon.FieldByName('MFO_CUST').AsString;
    cxLabelCust.Caption:=pFIBDataSetShablon.FieldByName('NAME_CUST').AsString;
  end
  else
  begin
    cxLabelRSCust.Caption:='';
    cxLabelMFOCUST.Caption:='';
    cxLabelCust.Caption:='';
  end;
if pFIBDataSetShablon.FieldByName('ACC_NATIVE').AsString<>'' then
  begin
    cxLabelRSNative.Caption:=pFIBDataSetShablon.FieldByName('ACC_NATIVE').AsString;
    cxLabelMFONative.Caption:=pFIBDataSetShablon.FieldByName('MFO_NATIVE').AsString;
    cxLabelCustNative.Caption:=pFIBDataSetShablon.FieldByName('NAME_NATIVE').AsString;
  end
  else
  begin
    cxLabelRSNative.Caption:='';
    cxLabelMFONative.Caption:='';
    cxLabelCustNative.Caption:='';
  end;
if pFIBDataSetShablon.FieldByName('NOTE').AsString<>'' then
  begin
    cxMemoNote.Text:=pFIBDataSetShablon.FieldByName('NOTE').AsString;
  end
  else
  begin
    cxMemoNote.Text:='';
  end;
end;

procedure TfrmShablonMain.ToolButtonExitClick(Sender: TObject);
begin
  id_shablon:=-1;
  close;
end;

procedure TfrmShablonMain.ToolButtonGetClick(Sender: TObject);
begin
if pFIBDataSetShablon.RecordCount>0 then
  begin
    id_shablon:=pFIBDataSetShablon.fieldbyname('id_shablon').AsVariant;
    close;
  end;
end;

procedure TfrmShablonMain.ToolButtonADDClick(Sender: TObject);
var
  Edit:TfrmAddShablon;
begin
  Edit:=TfrmAddShablon.create(self,pFIBDatabase.Handle,0);
  Edit.ShowModal;
  Edit.free;
  pFIBDataSetShablon.Active:=false;
  pFIBDataSetShablon.Active:=true;
end;

procedure TfrmShablonMain.ToolButtonEditClick(Sender: TObject);
var
  Edit:TfrmAddShablon;
begin
  Edit:=TfrmAddShablon.create(self,pFIBDatabase.Handle,pFIBDataSetShablon.fieldbyname('id_shablon').AsInteger);
  Edit.ShowModal;
  Edit.free;
  pFIBDataSetShablon.Active:=false;
  pFIBDataSetShablon.Active:=true;
end;

procedure TfrmShablonMain.ToolButtonDeleteClick(Sender: TObject);
begin
if pFIBDataSetShablon.RecordCount=0 then
  begin
    close;
  end;

if messageBox(Handle,PChar(ConstClBank.ClBank_MESSAGE_DELETE),
            PChar(ConstClBank.ClBank_MESSAGE_WARNING),MB_OKCANCEL or MB_ICONWARNING)=1 then
  begin
    pFIBStoredProcAll.Database:=pfibDataBase;
    pFIBStoredProcAll.Transaction:=WriteTransaction;
    WriteTransaction.DefaultDatabase:=pfibDataBase;
    WriteTransaction.Active:=true;
    pFIBStoredProcAll.StoredProcName:='CLBANK_INI_SHABLON_DELETE';
    pFIBStoredProcAll.Prepare;
    pFIBStoredProcAll.ParamByName('IN_ID_SHABLON').AsInt64:=pFIBDataSetShablon.fieldbyname('id_shablon').AsVariant;
    try
      pFIBStoredProcAll.ExecProc;
    Except
      begin
        WriteTransaction.Rollback;
        Exit;
      end;
    end;
    WriteTransaction.Commit;
    pFIBDataSetShablon.Active:=false;
    pFIBDataSetShablon.Active:=true;
  end;
end;

procedure TfrmShablonMain.ActionCloseExecute(Sender: TObject);
begin
    id_shablon:=-1;
     close;
end;

procedure TfrmShablonMain.ActionAddExecute(Sender: TObject);
var
  Edit:TfrmAddShablon;
begin
  Edit:=TfrmAddShablon.create(self,pFIBDatabase.Handle,0);
  Edit.ShowModal;
  Edit.free;
  pFIBDataSetShablon.Active:=false;
  pFIBDataSetShablon.Active:=true;
end;

end.
