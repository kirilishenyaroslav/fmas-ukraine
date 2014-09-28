unit AccountReload_MainForm;

interface

uses
  Windows, Messages, IBase, DB, AccountReload_DM, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, ExtCtrls, cxControls, dxStatusBar, dxBarExtItems,
  dxBar, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridDBTableView,
  z_uWaitForm,  Unit_sprSubs_Consts,Unit_zGlobal_Consts, zMessages,ZTypes,cxGrid, cxCheckBox,
  cxTextEdit, cxDBEdit, StdCtrls, cxContainer, cxLabel;

type
  TfmAccountReload = class(TForm)
    dxBarManager1: TdxBarManager;
    dxBarButton1: TdxBarButton;
    dxBut_Select: TdxBarLargeButton;
    dxStatusBar1: TdxStatusBar;
    Panel1: TPanel;
    AccountReloadGridDBTableView1: TcxGridDBTableView;
    AccountReloadGridLevel1: TcxGridLevel;
    AccountReloadGrid: TcxGrid;
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
    AccountReloadGridDBTableView_FIO_UPPER: TcxGridDBColumn;
    AccountReloadGridDBTableView_CHECK: TcxGridDBColumn;
    AccountReloadGridDBTableView_TN: TcxGridDBColumn;
    dxBarLargeButton1: TdxBarLargeButton;
    Panel3: TPanel;
    LabelSearch: TLabel;
    SearchEdit: TcxTextEdit;
    procedure AccountReloadGridDBTableView1DblClick(Sender: TObject);
    procedure dxBut_SelectClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure SearchEditKeyPress(Sender: TObject; var Key: Char);
    procedure SearchEditPropertiesChange(Sender: TObject);
  private
    PLanguageIndex:Byte;
    SearchText:string;
    SearchType:boolean;
  public
     DM: TDM;
    flag:String;
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;f:string); reintroduce;

  end;

var
  fmAccountReload: TfmAccountReload;

implementation

{$R *.dfm}
constructor TfmAccountReload.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;f:string);
var
  wf:TForm;
begin
  inherited Create(AOwner);
  DM:=TDM.Create(AOwner,Db_Handle);
  flag:=f;
  try
    wf := ShowWaitForm(Self,zwfPrepareData);

    if (flag ='T') then
    begin
      fmAccountReload.Caption:='Видалення перерахунків і завантаження співробітників на перерахунок';
      AccountReloadGridDBTableView_TN.Caption := 'Таб. номер';
    end;

    if (flag ='F') then
    begin
      fmAccountReload.Caption:='Видалення перерахунків';
      AccountReloadGridDBTableView_TN.Caption := 'Шифр';
    end;

    DM.DSetMain.Close;
    DM.DSetMain.SelectSQL.Text         := 'select * from Z_UTIL_GET_PEOPLE_FOR_ACC_SEL(:f) order by tn desc';
    DM.DSetMain.ParamByName('f').Value := flag;
    DM.DSetMain.Open;

    DM.MemoryData.EmptyTable;
    DM.MemoryData.Open;
    DM.DSetMain.First;

    while not(DM.DSetMain.Eof)do
     begin
       DM.MemoryData.Insert;
       DM.MemoryData['id_man']   := DM.DSetMain['id_man'];
       DM.MemoryData['fio_upper']:= DM.DSetMain['fio_upper'];
       DM.MemoryData['TN']       := DM.DSetMain['TN'];
       DM.MemoryData['CHECK']    := False;
       DM.MemoryData.Post;
       DM.DSetMain.Next;
     end;

    CloseWaitForm(wf);
    DM.MemoryData.First;

    DM.DSourceMain.DataSet:=DM.MemoryData;
    AccountReloadGridDBTableView1.DataController.DataSource:=DM.DSourceMain;

  except on E: Exception do
      begin
        zshowMessage(Error_Caption[pLanguageIndex],e.Message,mtError,[mbOk]);
        CloseWaitForm(wf);
        DM.ReadTransaction.Rollback;
       // close;
      end; 
  end;
end;

procedure TfmAccountReload.AccountReloadGridDBTableView1DblClick(
  Sender: TObject);
begin
AccountReloadGridDBTableView_CHECK.EditValue:=not(AccountReloadGridDBTableView_CHECK.EditValue);
//ImportTypeGrid1DBTableView1DB_CHECK.EditValue:=not(ImportTypeGrid1DBTableView1DB_CHECK.EditValue);
end;

procedure TfmAccountReload.dxBut_SelectClick(Sender: TObject);
var
  i:integer;

  wf: TForm;
begin
  wf:=ShowWaitForm(self, zwfDoFunction);

  i := AccountReloadGridDBTableView1.DataController.FocusedRecordIndex;
  DM.MemoryData.First;

  //DM.WriteTransaction.StartTransaction;
  DM.pFIBStoredProc.Transaction.StartTransaction;

  while not(DM.MemoryData.Eof)do
  begin
    if(DM.MemoryData['CHECK']=true)then
    begin
      DM.MemoryData.Edit;
      DM.MemoryData['CHECK'] := false;
      DM.MemoryData.Post;

      DM.pFIBStoredProc.StoredProcName                   := 'Z_UTIL_GET_PEOPLE_FOR_ACC_CLEAR';
      DM.pFIBStoredProc.ParamByName('ID_MAN').Value      := DM.MemoryData['ID_MAN'];
      DM.pFIBStoredProc.ParamByName('IS_ZARPLATA').Value := flag;
      DM.pFIBStoredProc.ExecProc;
    end;
    DM.MemoryData.Next;
  end;

  DM.pFIBStoredProc.Transaction.Commit;

  AccountReloadGridDBTableView1.DataController.FocusedRecordIndex:=i;

  if (flag='T') then
  begin
    DM.WriteTransaction.StartTransaction;
    DM.pFIBStoredProc.StoredProcName := 'Z_CLEAR_TMP_ACCOUNT';
    DM.pFIBStoredProc.ExecProc;
    DM.WriteTransaction.Commit;
  end;

  if (flag='F') then
  begin
    DM.WriteTransaction.StartTransaction;
    DM.pFIBStoredProc.StoredProcName := 'GR_CLEAR_TMP_ACCOUNT';
    DM.pFIBStoredProc.ExecProc;
    DM.WriteTransaction.Commit;
  end;

  DM.ReadTransaction.Commit;

  CloseWaitForm(wf);
  ZShowMessage(TFSprSubs_LabelTo_Caption,'Перерахунки видалені',mtInformation,[mbOK]);
  ModalResult:=mrCancel;

end;


procedure TfmAccountReload.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if formstyle = fsMDIChild then
   begin
     action := caFree;
   end
  else DM.free;
end;

procedure TfmAccountReload.dxBarLargeButton1Click(Sender: TObject);
var i:integer;
begin
  i:=AccountReloadGridDBTableView1.DataController.FocusedRecordIndex;
  DM.MemoryData.First;

  while not(DM.MemoryData.Eof)do
  begin
    if(DM.MemoryData['CHECK']=true)then
    begin
      DM.MemoryData.Edit;
      DM.MemoryData['CHECK']:=false;
      DM.MemoryData.Post;
    end

    else
    begin
      DM.MemoryData.Edit;
      DM.MemoryData['CHECK']:=true;
      DM.MemoryData.Post;
    end;
    DM.MemoryData.Next;
  end;

  AccountReloadGridDBTableView1.DataController.FocusedRecordIndex:=i;
end;

procedure TfmAccountReload.SearchEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if(key in ['0'..'9'])then
    SearchType:=true
  else
    SearchType:=false;
end;

procedure TfmAccountReload.SearchEditPropertiesChange(Sender: TObject);
begin
  with AccountReloadGridDBTableView1.DataController.Filter.Root do
  begin
    Clear;
    SearchText:='%'+StringReplace(AnsiUpperCase(SearchEdit.Text),' ','%',[rfReplaceAll])+'%';
    if SearchEdit.Text <> '' then
    begin
      if(SearchType=true)then
        AddItem(AccountReloadGridDBTableView_TN, foLike, SearchText, SearchEdit.Text)
      else
        AddItem(AccountReloadGridDBTableView_FIO_UPPER, foLike, SearchText, SearchEdit.Text)
    end;
    AccountReloadGridDBTableView1.DataController.Filter.Active:=true;
    AccountReloadGridDBTableView1.DataController.FocusedRowIndex:=0;
  end;
end;

end.
