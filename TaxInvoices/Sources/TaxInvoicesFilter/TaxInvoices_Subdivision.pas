unit TaxInvoices_Subdivision;

interface

uses
  Windows, Messages, SysUtils, Variants, IBase,Classes, Graphics, Controls, Forms,
   TaxInvoicesFilter_DM, Dialogs, cxGraphics, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  dxStatusBar, ExtCtrls, dxBar, RxMemDS,dxBarExtItems, cxCheckBox;

type
  TTISubdivisionForm = class(TForm)
    dxBarManager1: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    SelectBtn: TdxBarLargeButton;
    InverseBtn: TdxBarLargeButton;
    ExecBtn: TdxBarLargeButton;
    Panel1: TPanel;
    dxStatusBar1: TdxStatusBar;
    SubdivisionGrid1DBTableView: TcxGridDBTableView;
    SubdivisionGrid1Level1: TcxGridLevel;
    SubdivisionGrid: TcxGrid;
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
    SubdivisionGrid1DBTableViewDB_ID_SUBDIVISION: TcxGridDBColumn;
    SubdivisionGrid1DBTableViewDB_NAME_SUBDIVISION: TcxGridDBColumn;
    SubdivisionGrid1DBTableViewDB_CHECK: TcxGridDBColumn;
    procedure InverseBtnClick(Sender: TObject);
    procedure SubdivisionGrid1DBTableViewDblClick(Sender: TObject);
    procedure ExecBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure SelectBtnClick(Sender: TObject);
  private
    PDb_Handle:TISC_DB_HANDLE;
  public
    //MemoryData: TRxMemoryData;
    key_session:Int64;
    constructor Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE);reintroduce;
  end;

var
  TISubdivisionForm: TTISubdivisionForm;

implementation

{$R *.dfm}
constructor TTISubdivisionForm.Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE);

begin
   inherited Create(AOwner);
   PDb_Handle := ADB_Handle;
   SubdivisionGrid1DBTableView.DataController.DataSource := TaxInvoicesFilterDM.SubdivisionDSource;
   {нужно сгенерировать идентификатор сессии}
   key_session := TaxInvoicesFilterDM.DB.Gen_Id('GEN_TI_KEY_SESSION', 1);
   TaxInvoicesFilterDM.SubdivisionDSet.Close;
   TaxInvoicesFilterDM.SubdivisionDSet.SelectSQL.Text:='select * from TI_SELECT_SUBDIVISION(:KEY_SESSION)';
   TaxInvoicesFilterDM.SubdivisionDSet.ParamByName('KEY_SESSION').AsInt64 := key_session;
   TaxInvoicesFilterDM.SubdivisionDSet.Open;

   TaxInvoicesFilterDM.MemoryData.EmptyTable;
   TaxInvoicesFilterDM.MemoryData.Open;
   TaxInvoicesFilterDM.SubdivisionDSet.First;

   while not(TaxInvoicesFilterDM.SubdivisionDSet.Eof)do
   begin
    TaxInvoicesFilterDM.MemoryData.Insert;
    TaxInvoicesFilterDM.MemoryData['ID_SUBDIVISION']:=TaxInvoicesFilterDM.SubdivisionDSet['ID_SUBDIVISION'];
    TaxInvoicesFilterDM.MemoryData['NAME_SUBDIVISION']:=TaxInvoicesFilterDM.SubdivisionDSet['NAME_SUBDIVISION'];

    if (TaxInvoicesFilterDM.SubdivisionDSet['is_cheked']='1') then
      TaxInvoicesFilterDM.MemoryData['CHECK']:=True
    else
      TaxInvoicesFilterDM.MemoryData['CHECK']:=False;

    TaxInvoicesFilterDM.MemoryData.Post;
    TaxInvoicesFilterDM.SubdivisionDSet.Next
   end;

   TaxInvoicesFilterDM.MemoryData.First;

end;

procedure TTISubdivisionForm.InverseBtnClick(Sender: TObject);
var i:integer;
begin
  i:=SubdivisionGrid1DBTableView.DataController.FocusedRecordIndex;
  TaxInvoicesFilterDM.MemoryData.First;
  TaxInvoicesFilterDM.WriteTransaction.StartTransaction;
  while not(TaxInvoicesFilterDM.MemoryData.Eof)do
  begin
    if(TaxInvoicesFilterDM.MemoryData['CHECK']=true)then
    begin
      TaxInvoicesFilterDM.MemoryData.Edit;
      TaxInvoicesFilterDM.MemoryData['CHECK']:=false;
      TaxInvoicesFilterDM.MemoryData.Post;

      TaxInvoicesFilterDM.pFIBStoredProc.StoredProcName                      := 'TI_SUBDIVISION_SELECT_DEL';
      TaxInvoicesFilterDM.pFIBStoredProc.ParamByName('ID_SUBDIVISION').Value := TaxInvoicesFilterDM.MemoryData['ID_SUBDIVISION'];
      TaxInvoicesFilterDM.pFIBStoredProc.ParamByName('KEY_SESSION').AsInt64  := key_session;
      TaxInvoicesFilterDM.pFIBStoredProc.ExecProc;
    end
    else
    begin
      TaxInvoicesFilterDM.MemoryData.Edit;
      TaxInvoicesFilterDM.MemoryData['CHECK']:=true;
      TaxInvoicesFilterDM.MemoryData.Post;

      TaxInvoicesFilterDM.pFIBStoredProc.StoredProcName                      := 'TI_SUBDIVISION_SELECT_INS';
      TaxInvoicesFilterDM.pFIBStoredProc.ParamByName('ID_SUBDIVISION').Value := TaxInvoicesFilterDM.MemoryData['ID_SUBDIVISION'];
      TaxInvoicesFilterDM.pFIBStoredProc.ParamByName('KEY_SESSION').AsInt64  := key_session;
      TaxInvoicesFilterDM.pFIBStoredProc.ParamByName('is_cheked').AsInt64    := 1;
      TaxInvoicesFilterDM.pFIBStoredProc.ExecProc;

    end;
    TaxInvoicesFilterDM.MemoryData.Next;
  end;
  SubdivisionGrid1DBTableView.DataController.FocusedRecordIndex:=i;
  TaxInvoicesFilterDM.WriteTransaction.Commit;
end;

procedure TTISubdivisionForm.SubdivisionGrid1DBTableViewDblClick(Sender: TObject);
begin
  SubdivisionGrid1DBTableViewDB_CHECK.EditValue:=not(SubdivisionGrid1DBTableViewDB_CHECK.EditValue);

  TaxInvoicesFilterDM.WriteTransaction.StartTransaction;
  if (SubdivisionGrid1DBTableViewDB_CHECK.EditValue=true)   then
    begin
      TaxInvoicesFilterDM.pFIBStoredProc.StoredProcName                      := 'TI_SUBDIVISION_SELECT_INS';
      TaxInvoicesFilterDM.pFIBStoredProc.ParamByName('ID_SUBDIVISION').Value := TaxInvoicesFilterDM.MemoryData['ID_SUBDIVISION'];
      TaxInvoicesFilterDM.pFIBStoredProc.ParamByName('KEY_SESSION').AsInt64  := key_session;
      TaxInvoicesFilterDM.pFIBStoredProc.ParamByName('is_cheked').AsInt64    := 1;
      TaxInvoicesFilterDM.pFIBStoredProc.ExecProc;
    end
  else
    begin
      TaxInvoicesFilterDM.pFIBStoredProc.StoredProcName                      := 'TI_SUBDIVISION_SELECT_DEL';
      TaxInvoicesFilterDM.pFIBStoredProc.ParamByName('ID_SUBDIVISION').Value := TaxInvoicesFilterDM.MemoryData['ID_SUBDIVISION'];
      TaxInvoicesFilterDM.pFIBStoredProc.ParamByName('KEY_SESSION').AsInt64  := key_session;
      TaxInvoicesFilterDM.pFIBStoredProc.ExecProc;
    end;

   TaxInvoicesFilterDM.WriteTransaction.Commit;

end;

procedure TTISubdivisionForm.ExecBtnClick(Sender: TObject);
begin
close;
end;

procedure TTISubdivisionForm.RefreshBtnClick(Sender: TObject);
begin
  TaxInvoicesFilterDM.SubdivisionDSet.Close;
  TaxInvoicesFilterDM.MemoryData.Close;
  TaxInvoicesFilterDM.SubdivisionDSet.Open;
  TaxInvoicesFilterDM.MemoryData.EmptyTable;
  TaxInvoicesFilterDM.MemoryData.Open;

  TaxInvoicesFilterDM.SubdivisionDSet.First;
  while not(TaxInvoicesFilterDM.SubdivisionDSet.Eof)do
  begin
    TaxInvoicesFilterDM.MemoryData.Insert;
    TaxInvoicesFilterDM.MemoryData['ID_SUBDIVISION']:=TaxInvoicesFilterDM.SubdivisionDSet['ID_TYPE'];
    TaxInvoicesFilterDM.MemoryData['name_subdivision']:=TaxInvoicesFilterDM.SubdivisionDSet['name_subdivision'];

    TaxInvoicesFilterDM.WriteTransaction.StartTransaction;
    TaxInvoicesFilterDM.pFIBStoredProc.StoredProcName                      := 'TI_SUBDIVISION_SELECT_POISK';
    TaxInvoicesFilterDM.pFIBStoredProc.ParamByName('ID_SUBDIVISION').Value := TaxInvoicesFilterDM.MemoryData['ID_SUBDIVISION'];
    TaxInvoicesFilterDM.pFIBStoredProc.ParamByName('KEY_SESSION').AsInt64  := key_session;
    TaxInvoicesFilterDM.pFIBStoredProc.ExecProc;
    TaxInvoicesFilterDM.WriteTransaction.Commit;

    if (TaxInvoicesFilterDM.pFIBStoredProc.ParamByName('OUT').AsInteger=1) then
      TaxInvoicesFilterDM.MemoryData['CHECK']:=True
    else
      TaxInvoicesFilterDM.MemoryData['CHECK']:=False;

    TaxInvoicesFilterDM.MemoryData.Post;
    TaxInvoicesFilterDM.SubdivisionDSet.Next
  end;
  TaxInvoicesFilterDM.MemoryData.First;
end;


procedure TTISubdivisionForm.SelectBtnClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

end.
