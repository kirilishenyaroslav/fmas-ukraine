unit BankBuff;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, FIBDatabase, pFIBDatabase,  xStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, ImgList, dxBarExtItems, dxBar, cxGridTableView, cxTL,
  FIBDataSet, pFIBDataSet, ExtCtrls, cxGridLevel, cxGridCustomTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxStyles, DB, ,
  pFIBDataSet, dbcgrids, iBase, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, ImgList,
  dxBarExtItems, dxBar, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxTL, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, IBDatabase, IBSQL, ExtCtrls;

type
  TfrmBuff = class(TForm)
    Button1: TButton;
    pFIBDatabase: TpFIBDatabase;
    pFIBDataSetBuff: TpFIBDataSet;
    pFIBTransactionRead: TpFIBTransaction;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    cxStyle47: TcxStyle;
    cxStyle48: TcxStyle;
    cxStyle49: TcxStyle;
    cxStyle50: TcxStyle;
    cxStyle51: TcxStyle;
    cxStyle52: TcxStyle;
    cxStyle53: TcxStyle;
    cxStyle54: TcxStyle;
    cxStyle55: TcxStyle;
    cxStyle56: TcxStyle;
    cxStyle57: TcxStyle;
    cxStyle58: TcxStyle;
    cxStyle59: TcxStyle;
    cxStyle60: TcxStyle;
    cxStyle61: TcxStyle;
    cxStyle62: TcxStyle;
    cxStyle63: TcxStyle;
    cxStyle64: TcxStyle;
    cxStyle65: TcxStyle;
    cxStyle66: TcxStyle;
    cxStyle67: TcxStyle;
    cxStyle68: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    dxBarManager1: TdxBarManager;
    dxBarButton1: TdxBarButton;
    dxBarLargeButton_add: TdxBarLargeButton;
    dxBarLargeButton_red: TdxBarLargeButton;
    dxBarLargeButton_del: TdxBarLargeButton;
    dxBarLargeButton_pr: TdxBarLargeButton;
    dxBarLargeButton_upd: TdxBarLargeButton;
    dxBarLargeButton_get: TdxBarLargeButton;
    dxBarLargeButton_get_group_doc: TdxBarLargeButton;
    dxBarLargeButton_close: TdxBarLargeButton;
    dxBarButton2: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    LargeImages: TImageList;
    DataSource: TDataSource;
    dxBarLargeButtonRel: TdxBarLargeButton;
    pFIBTransactionWrite: TpFIBTransaction;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dxBarLargeButton_addClick(Sender: TObject);
    procedure dxBarLargeButton_closeClick(Sender: TObject);
    procedure dxBarLargeButtonRelClick(Sender: TObject);
    procedure dxBarLargeButton_updClick(Sender: TObject);
    procedure dxBarLargeButton_redClick(Sender: TObject);
    procedure pFIBDataSetBuffAfterScroll(DataSet: TDataSet);
    procedure dxBarLargeButton_prClick(Sender: TObject);
  private
    { Private declarations }
  public
  procedure SelectAll();
    { Public declarations }
  end;

  function BankBuffer(AOwner : TComponent;):Variant; stdcall;
  exports BankBuffer;


var
  frmBuff: TfrmBuff;

implementation
uses
  BankBuffEdit, BuffRelations;

{$R *.dfm}

function BankBuffer(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE):Variant; stdcall;
var
  F: TfrmBuff;
begin
  F := TfrmBuff.Create(Aowner);
  F.pFIBDatabase.Handle := DBHANDLE;

  F.pFIBDataSetBuff.Active := false;
  F.pFIBDataSetBuff.Active := true;

  F.Label4.Caption := F.pFIBDataSetBuff.FieldByName('comment').AsString;
  F.Label5.Caption := F.pFIBDataSetBuff.FieldByName('prog_save').AsString;
  F.Label6.Caption := F.pFIBDataSetBuff.FieldByName('prog_dele').AsString;

//  F.ShowModal;
//  F.Free;
end;

procedure TfrmBuff.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmBuff.SelectAll();
begin
  pFIBDataSetBuff.Active := false;
  pFIBDataSetBuff.Active := true;
end;

procedure TfrmBuff.dxBarLargeButton_addClick(Sender: TObject);
var
  frmEdit : TfrmBuffEdit;
begin
  frmEdit := TfrmBuffEdit.Create(Self,'add','','','','','',0);
  frmEdit.ShowModal;
  frmEdit.Free;
  SelectAll();
  pFIBDataSetBuff.Locate('id_bank_buff', frmEdit.id_bank_buff, []);
end;

procedure TfrmBuff.dxBarLargeButton_closeClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBuff.dxBarLargeButtonRelClick(Sender: TObject);
var
  frmRel : TfrmRelations;
begin
  frmRel := TfrmRelations.Create(Self);
  frmRel.id_bankbuff := pFIBDataSetBuff.FieldByName('id_bank_buff').asInteger;
  frmRel.path := pFIBDataSetBuff.FieldByName('path_buff').AsString;
  frmRel.alias := pFIBDataSetBuff.FieldByName('alias_buff').AsString;
  frmRel.ShowModal;
  frmRel.Free;
end;

procedure TfrmBuff.dxBarLargeButton_updClick(Sender: TObject);
begin
  SelectAll();
end;

procedure TfrmBuff.dxBarLargeButton_redClick(Sender: TObject);
var
  frmEdit : TfrmBuffEdit;
  id_buff: Integer;
  path: String;
begin
  path := pFIBDataSetBuff.FieldByName('path_buff').AsString + '\' + pFIBDataSetBuff.FieldByName('alias_buff').AsString;
  frmEdit := TfrmBuffEdit.Create(Self,'red',path,
             pFIBDataSetBuff.FieldByName('comment').AsString,pFIBDataSetBuff.FieldByName('name_table_buff').AsString,
             pFIBDataSetBuff.FieldByName('prog_save').AsString,pFIBDataSetBuff.FieldByName('prog_dele').AsString,
             pFIBDataSetBuff.FieldByName('id_bank_buff').AsInteger);
  id_buff := pFIBDataSetBuff.FieldByName('id_bank_buff').AsInteger;
  frmEdit.ShowModal;
  frmEdit.Free;
  SelectAll();
  pFIBDataSetBuff.LocateNext('id_bank_buff', id_buff, []);
end;

procedure TfrmBuff.pFIBDataSetBuffAfterScroll(DataSet: TDataSet);
begin
  Label4.Caption := pFIBDataSetBuff.FieldByName('comment').AsString;
  Label5.Caption := pFIBDataSetBuff.FieldByName('prog_save').AsString;
  Label6.Caption := pFIBDataSetBuff.FieldByName('prog_dele').AsString;
end;

procedure TfrmBuff.dxBarLargeButton_prClick(Sender: TObject);
  var
  frmEdit : TfrmBuffEdit;
  path: String;
begin
  path := pFIBDataSetBuff.FieldByName('path_buff').AsString + '\' + pFIBDataSetBuff.FieldByName('alias_buff').AsString;
  frmEdit := TfrmBuffEdit.Create(Self,'view',path,
             pFIBDataSetBuff.FieldByName('comment').AsString,pFIBDataSetBuff.FieldByName('name_table_buff').AsString,
             pFIBDataSetBuff.FieldByName('prog_save').AsString,pFIBDataSetBuff.FieldByName('prog_dele').AsString,
             pFIBDataSetBuff.FieldByName('id_bank_buff').AsInteger);
  id_buff := pFIBDataSetBuff.FieldByName('id_bank_buff').AsInteger;
  frmEdit.ShowModal;
  frmEdit.Free;
end;

end.
