unit ImportCurrentPremiya_Type;

interface

uses
  Windows, Messages, SysUtils, Variants, IBase,Classes, Graphics, Controls, Forms,
  ZProc, ImportCurrentPremiya_DM, Dialogs, cxGraphics, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  dxStatusBar, ExtCtrls, dxBar, RxMemDS,dxBarExtItems;

type
  TfmImpType = class(TForm)
    dxBarManager1: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    SelectBtn: TdxBarLargeButton;
    InverseBtn: TdxBarLargeButton;
    ExecBtn: TdxBarLargeButton;
    Panel1: TPanel;
    dxStatusBar1: TdxStatusBar;
    ImportTypeGrid1DBTableView1: TcxGridDBTableView;
    ImportTypeGrid1Level1: TcxGridLevel;
    ImportTypeGrid: TcxGrid;
    cxStyleRepository1: TcxStyleRepository;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
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
    ImportTypeGrid1DBTableView1DB_ID_TYPE: TcxGridDBColumn;
    ImportTypeGrid1DBTableView1DB_TYPE_NAME: TcxGridDBColumn;
    ImportTypeGrid1DBTableView1DB_CHECK: TcxGridDBColumn;
    procedure InverseBtnClick(Sender: TObject);
    procedure ImportTypeGrid1DBTableView1DblClick(Sender: TObject);
    procedure ExecBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure SelectBtnClick(Sender: TObject);
  private
    PDb_Handle:TISC_DB_HANDLE;
  public
    //MemoryData: TRxMemoryData;
    id_:Int64;
    constructor Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;id:Int64);reintroduce;
  end;

var
  fmImpType: TfmImpType;

implementation

{$R *.dfm}
constructor TfmImpType.Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;id:Int64);

begin
   inherited Create(AOwner);
   PDb_Handle := ADB_Handle;
   id_:=id;

   DM.DSetType.Close;
   //DM.DSetType.SelectSQL.Text := 'select t.ID_TYPE, t.TYPE_NAME from up_dt_order_type t where t.moving_type=7';
   DM.DSetType.SelectSQL.Text:='select * from Z_IMP_CUR_PREMIYA_TYPE_S(:id_session)';
   DM.DSetType.ParamByName('id_session').AsInt64:=id_;
   DM.DSetType.Open;

   DM.MemoryData.EmptyTable;
   DM.MemoryData.Open;
   DM.DSetType.First;
{   while not(DM.DSetType.Eof)do
   begin
     DM.MemoryData.Insert;
     DM.MemoryData['ID_TYPE']:=DM.DSetType['ID_TYPE'];
     DM.MemoryData['TYPE_NAME']:=DM.DSetType['TYPE_NAME'];
     //if (exists)
     DM.MemoryData['CHECK']:=false;
     DM.MemoryData.Post;
     DM.DSetType.Next;
   end;  }
   while not(DM.DSetType.Eof)do
  begin
    DM.MemoryData.Insert;
    DM.MemoryData['ID_TYPE']:=DM.DSetType['ID_TYPE'];
    DM.MemoryData['TYPE_NAME']:=DM.DSetType['TYPE_NAME'];

   { DM.WriteTransaction.StartTransaction;
    DM.pFIBStoredProc.StoredProcName                    := 'Z_IMP_CUR_PREM_TYPE_POISK';
    DM.pFIBStoredProc.ParamByName('ID_TYPE').Value      := DM.MemoryData['ID_TYPE'];
    DM.pFIBStoredProc.ParamByName('ID_SESSION').AsInt64 := id_;
    DM.pFIBStoredProc.ExecProc;
    DM.WriteTransaction.Commit;  }

    if (DM.DSetType['is_cheked']='1') then
      DM.MemoryData['CHECK']:=True
    else
      DM.MemoryData['CHECK']:=False;

    DM.MemoryData.Post;
    DM.DSetType.Next
  end;

   DM.MemoryData.First;

end;

procedure TfmImpType.InverseBtnClick(Sender: TObject);
var i:integer;
begin
  i:=ImportTypeGrid1DBTableView1.DataController.FocusedRecordIndex;
  DM.MemoryData.First;
  DM.WriteTransaction.StartTransaction;
  while not(DM.MemoryData.Eof)do
  begin
    if(DM.MemoryData['CHECK']=true)then
    begin
      DM.MemoryData.Edit;
      DM.MemoryData['CHECK']:=false;
      DM.MemoryData.Post;

      DM.pFIBStoredProc.StoredProcName                    := 'Z_IMP_CUR_PREM_TYPE_DEL';
      DM.pFIBStoredProc.ParamByName('ID_TYPE').Value      := DM.MemoryData['ID_TYPE'];
      DM.pFIBStoredProc.ParamByName('ID_SESSION').AsInt64 := id_;
      DM.pFIBStoredProc.ExecProc;
    end
    else
    begin
      DM.MemoryData.Edit;
      DM.MemoryData['CHECK']:=true;
      DM.MemoryData.Post;

      DM.pFIBStoredProc.StoredProcName                    := 'Z_IMP_CUR_PREMIYA_TYPE_INS';
      DM.pFIBStoredProc.ParamByName('ID_TYPE').Value      := DM.MemoryData['ID_TYPE'];
      DM.pFIBStoredProc.ParamByName('ID_SESSION').AsInt64 := id_;
      DM.pFIBStoredProc.ExecProc;

    end;
    DM.MemoryData.Next;
  end;
  ImportTypeGrid1DBTableView1.DataController.FocusedRecordIndex:=i;
  DM.WriteTransaction.Commit;
end;

procedure TfmImpType.ImportTypeGrid1DBTableView1DblClick(Sender: TObject);
begin
  ImportTypeGrid1DBTableView1DB_CHECK.EditValue:=not(ImportTypeGrid1DBTableView1DB_CHECK.EditValue);

  DM.WriteTransaction.StartTransaction;
  if (ImportTypeGrid1DBTableView1DB_CHECK.EditValue=true)   then
    begin
      DM.pFIBStoredProc.StoredProcName                    := 'Z_IMP_CUR_PREMIYA_TYPE_INS';
      DM.pFIBStoredProc.ParamByName('ID_TYPE').Value      := DM.MemoryData['ID_TYPE'];
      DM.pFIBStoredProc.ParamByName('ID_SESSION').AsInt64 := id_;
      DM.pFIBStoredProc.ExecProc;
    end
  else
    begin
      DM.pFIBStoredProc.StoredProcName                    := 'Z_IMP_CUR_PREM_TYPE_DEL';
      DM.pFIBStoredProc.ParamByName('ID_TYPE').Value      := DM.MemoryData['ID_TYPE'];
      DM.pFIBStoredProc.ParamByName('ID_SESSION').AsInt64 := id_;
      DM.pFIBStoredProc.ExecProc;
    end;

   DM.WriteTransaction.Commit;

end;

procedure TfmImpType.ExecBtnClick(Sender: TObject);
begin
close;
end;

procedure TfmImpType.RefreshBtnClick(Sender: TObject);
begin
  DM.DSetType.Close;
  DM.MemoryData.Close;
  DM.DSetType.Open;
  DM.MemoryData.EmptyTable;
  DM.MemoryData.Open;

  DM.DSetType.First;
  while not(DM.DSetType.Eof)do
  begin
    DM.MemoryData.Insert;
    DM.MemoryData['ID_TYPE']:=DM.DSetType['ID_TYPE'];
    DM.MemoryData['TYPE_NAME']:=DM.DSetType['TYPE_NAME'];

    DM.WriteTransaction.StartTransaction;
    DM.pFIBStoredProc.StoredProcName                    := 'Z_IMP_CUR_PREM_TYPE_POISK';
    DM.pFIBStoredProc.ParamByName('ID_TYPE').Value      := DM.MemoryData['ID_TYPE'];
    DM.pFIBStoredProc.ParamByName('ID_SESSION').AsInt64 := id_;
    DM.pFIBStoredProc.ExecProc;
    DM.WriteTransaction.Commit;

    if (DM.pFIBStoredProc.ParamByName('OUT').AsInteger=1) then
      DM.MemoryData['CHECK']:=True
    else
      DM.MemoryData['CHECK']:=False;

    DM.MemoryData.Post;
    DM.DSetType.Next
  end;
  DM.MemoryData.First;
end;


procedure TfmImpType.SelectBtnClick(Sender: TObject);
//var i:integer;
begin
{  i:=ImportTypeGrid1DBTableView1.DataController.FocusedRecordIndex;
  DM.MemoryData.First;
  DM.WriteTransaction.StartTransaction;
  while not(DM.MemoryData.Eof)do
  begin
    if(DM.MemoryData['CHECK']=true)then
    begin
      //DM.WriteTransaction.StartTransaction;
      DM.pFIBStoredProc.StoredProcName                    := 'Z_IMP_CUR_PREM_TYPE_POISK';
      DM.pFIBStoredProc.ParamByName('ID_TYPE').Value      := DM.MemoryData['ID_TYPE'];
      DM.pFIBStoredProc.ParamByName('ID_SESSION').AsInt64 := id_;
      DM.pFIBStoredProc.ExecProc;
      //DM.WriteTransaction.Commit;

      if (DM.pFIBStoredProc.ParamByName('OUT').AsInteger=0) then

      begin
       // DM.WriteTransaction.StartTransaction;
        DM.pFIBStoredProc.StoredProcName                    := 'Z_IMP_CUR_PREMIYA_TYPE_INS';
        DM.pFIBStoredProc.ParamByName('ID_TYPE').Value      := DM.MemoryData['ID_TYPE'];
        DM.pFIBStoredProc.ParamByName('ID_SESSION').AsInt64 := id_;
        DM.pFIBStoredProc.ExecProc;
       // DM.WriteTransaction.Commit;
      end;
    end;

    if(DM.MemoryData['CHECK']=false)then
    begin
      //DM.WriteTransaction.StartTransaction;
      DM.pFIBStoredProc.StoredProcName                    := 'Z_IMP_CUR_PREM_TYPE_DEL';
      DM.pFIBStoredProc.ParamByName('ID_TYPE').Value      := DM.MemoryData['ID_TYPE'];
      DM.pFIBStoredProc.ParamByName('ID_SESSION').AsInt64 := id_;
      DM.pFIBStoredProc.ExecProc;
      //DM.WriteTransaction.Commit;
    end;

    DM.MemoryData.Next;
  end;

  DM.WriteTransaction.Commit;
  ImportTypeGrid1DBTableView1.DataController.FocusedRecordIndex:=i; }
  ModalResult:=mrCancel;
end;

end.
