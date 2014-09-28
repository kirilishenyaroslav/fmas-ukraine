unit UTypeFinanceMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase, cxControls, cxContainer, cxEdit, cxTextEdit, ComCtrls,
  ToolWin, ImgList, cxStyles, cxGraphics, cxCustomData, cxTL,
  cxInplaceContainer, cxDBTL, cxTLData, Placemnt, DB, FIBDataSet,
  pFIBDataSet, FIBDatabase, pFIBDatabase, pFibStoredProc, ActnList;

type
  TfrmMainTypeFinance = class(TForm)
    cxStyleRepository1: TcxStyleRepository;
    back: TcxStyle;
    column_gray: TcxStyle;
    periods: TcxStyle;
    cxStyle1: TcxStyle;
    SmallImages: TImageList;
    ToolBar1: TToolBar;
    AddButton: TToolButton;
    DelButton: TToolButton;
    UpdateButton: TToolButton;
    ToolButton3: TToolButton;
    ToolButton7: TToolButton;
    ToolButton14: TToolButton;
    CloseButton: TToolButton;
    TypeFinanceTreeView: TcxDBTreeList;
    SchTreeViewcxDBTreeListColumn1: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn2: TcxDBTreeListColumn;
    FormStorage1: TFormStorage;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    TypeFinanceDataSet: TpFIBDataSet;
    TypeFinanceDataSource: TDataSource;
    ActionList1: TActionList;
    Action1: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CloseButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure UpdateButtonClick(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure TypeFinanceTreeViewDblClick(Sender: TObject);
  private
  public
    ResultValue:Variant;
    constructor Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;fs:TFormStyle;id_user:Int64);reintroduce;
  end;

  function GetTypeFinance(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;fs:TFormStyle;id_user:Int64):Variant; stdcall;
  exports GetTypeFinance;

implementation

uses UTypeFinanceEdit, BaseTypes;

function GetTypeFinance(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;fs:TFormStyle;id_user:Int64):Variant;
var    f:Boolean;
       i:Integer;
       T:TfrmMainTypeFinance;
       Res:Variant;
begin
       Res:=NULL;
       if fs=fsNormal
       then begin
            T:=TfrmMainTypeFinance.Create(AOwner,DB_HANDLE,FS,id_user);
            if T.ShowModal=mrYes
            then begin
                      Res:=T.ResultValue;
            end;
            T.Free;
       end
       else begin
            f :=true;
            for i:=0 to Application.MainForm.MDIChildCount-1 do
            begin
                 if (Application.MainForm.MDIChildren[i] is TfrmMainTypeFinance)
                 then begin
                           Application.MainForm.MDIChildren[i].BringToFront;
                           f:=false;
                 end;
            end;
            if f then TfrmMainTypeFinance.Create(AOwner,DB_HANDLE,FS,ID_user);
       end;
       Result:=Res;
end;

{$R *.dfm}

constructor TfrmMainTypeFinance.Create(AOwner: TComponent;DB_HANDLE: TISC_DB_HANDLE; fs: TFormStyle; id_user: Int64);
begin
     inherited Create(AOwner);
     Self.FormStyle:=fs;
     WorkDatabase.Handle:=DB_HANDLE;
     ReadTransaction.StartTransaction;
     TypeFinanceDataSet.SelectSQL.Text:='SELECT * FROM PUB_SP_TYPE_FINANCE_SELECT';
     TypeFinanceDataSet.Open;

     if fs=fsNormal
     then begin
               TypeFinanceTreeView.FullExpand;
               ToolButton3.Visible:=true;
     end;

     if TypeFinanceTreeView.Nodes.Root<>nil
     then TypeFinanceTreeView.Nodes.Root.Expand(true);
end;

procedure TfrmMainTypeFinance.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TfrmMainTypeFinance.CloseButtonClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmMainTypeFinance.AddButtonClick(Sender: TObject);
var T:TfrmEditTypeFinance;
    InsertSp:TpFibStoredProc;
    id_:integer;
begin
    T:=TfrmEditTypeFinance.Create(self);
    if T.ShowModal=mrYes
    then begin
              InsertSp:=TpFibStoredProc.Create(self);
              InsertSp.Database    :=WorkDatabase;
              InsertSp.Transaction :=WriteTransaction;
              WriteTransaction.StartTransaction;
              InsertSp.StoredProcName:='PUB_SP_TYPE_FINANCE_INSERT';
              InsertSp.Prepare;
              InsertSp.ParamByName('TYPE_FINANCE_NAME').Value    :=T.NameText.Text;
              InsertSp.ParamByName('TYPE_FINANCE_CODE').Value    :=T.CodeText.Text;

              if (T.InsertAsRoot.Checked)
              then InsertSp.ParamByName('LINKTO').Value:=-1
              else begin
                        if (TypeFinanceTreeView.FocusedNode=nil)
                        then InsertSp.ParamByName('LINKTO').Value:=-1
                        else InsertSp.ParamByName('LINKTO').Value:=TypeFinanceDataSet.FieldByName('ID_TYPE_FINANCE').Value;
              end;
              InsertSp.ParamByName('M_ORDER_LETTER').Value       :=T.MLetterText.Text;
              InsertSp.ParamByName('TYPE_FINANCE_NAME_EXT').Value:=T.NameExtText.Text;
              InsertSp.ParamByName('TYPE_KAZN_KOD').Value:=T.cxtxtdtKaznCode.Text;


              InsertSp.ExecProc;
              id_:=InsertSp.ParamByName('ID_TYPE_FINANCE').Value;
              InsertSp.close;
              WriteTransaction.Commit;
              InsertSp.Free;
              TypeFinanceDataSet.CloseOpen(true);
              TypeFinanceDataSet.Locate('ID_TYPE_FINANCE',id_,[]);
    end;
    T.Free;
end;

procedure TfrmMainTypeFinance.UpdateButtonClick(Sender: TObject);
var T:TfrmEditTypeFinance;
    InsertSp:TpFibStoredProc;
    id_:integer;
begin
    if (TypeFinanceDataSet.RecordCount>0)
    then begin
              T:=TfrmEditTypeFinance.Create(self);
              T.NameText.Text   :=TypeFinanceDataSet.FieldByName('TYPE_FINANCE_NAME').AsString;
              T.CodeText.Text   :=TypeFinanceDataSet.FieldByName('TYPE_FINANCE_CODE').AsString;
              T.MLetterText.Text:=TypeFinanceDataSet.FieldByName('M_ORDER_LETTER').AsString;
              T.NameExtText.Text:=TypeFinanceDataSet.FieldByName('TYPE_FINANCE_NAME_EXT').AsString;
              T.cxtxtdtKaznCode.Text:=TypeFinanceDataSet.FieldByName('TYPE_KAZN_KOD').Value;

              if T.ShowModal=mrYes
              then begin
                        InsertSp:=TpFibStoredProc.Create(self);
                        InsertSp.Database    :=WorkDatabase;
                        InsertSp.Transaction :=WriteTransaction;
                        WriteTransaction.StartTransaction;
                        InsertSp.StoredProcName:='PUB_SP_TYPE_FINANCE_UPDATE';
                        InsertSp.Prepare;
                        id_:=TypeFinanceDataSet.FieldByName('ID_TYPE_FINANCE').Value;
                        InsertSp.ParamByName('ID_TYPE_FINANCE').Value      :=TypeFinanceDataSet.FieldByName('ID_TYPE_FINANCE').Value;
                        InsertSp.ParamByName('TYPE_FINANCE_NAME').Value    :=T.NameText.Text;
                        InsertSp.ParamByName('TYPE_FINANCE_CODE').Value    :=T.CodeText.Text;
                        InsertSp.ParamByName('LINKTO').Value               :=TypeFinanceDataSet.FieldByName('LINKTO').Value;
                        InsertSp.ParamByName('M_ORDER_LETTER').Value       :=T.MLetterText.Text;
                        InsertSp.ParamByName('TYPE_FINANCE_NAME_EXT').Value:=T.NameExtText.Text;
                        InsertSp.ParamByName('TYPE_KAZN_KOD').Value:=T.cxtxtdtKaznCode.Text;
                        InsertSp.ExecProc;
                        InsertSp.close;
                        WriteTransaction.Commit;
                        InsertSp.Free;
                        TypeFinanceDataSet.CloseOpen(true);
                        TypeFinanceDataSet.Locate('ID_TYPE_FINANCE',id_,[]);
              end;
              T.Free;
    end;
end;

procedure TfrmMainTypeFinance.ToolButton7Click(Sender: TObject);
var id_:integer;
begin
     id_:=-1;
     if TypeFinanceDataSet.RecordCount>0 then id_:=TypeFinanceDataSet.FieldByName('ID_TYPE_FINANCE').Value;
     TypeFinanceDataSet.CloseOpen(true);
     TypeFinanceDataSet.Locate('ID_TYPE_FINANCE',id_,[]);
end;

procedure TfrmMainTypeFinance.DelButtonClick(Sender: TObject);
var  InsertSp:TpFibStoredProc;
     id_:integer;
begin
      if (TypeFinanceDataSet.RecordCount>0)
      then begin
                if (agMessageDlg('Увага!','Ви хочете видалити запис?',mtConfirmation,[mbYes,mbNo])=mrYes)
                then begin
                          InsertSp:=TpFibStoredProc.Create(self);
                          InsertSp.Database    :=WorkDatabase;
                          InsertSp.Transaction :=WriteTransaction;
                          WriteTransaction.StartTransaction;
                          InsertSp.StoredProcName:='PUB_SP_TYPE_FINANCE_DELETE';
                          InsertSp.Prepare;
                          id_:=TypeFinanceDataSet.FieldByName('LINKTO').Value;
                          InsertSp.ParamByName('ID_TYPE_FINANCE').Value      :=TypeFinanceDataSet.FieldByName('ID_TYPE_FINANCE').Value;
                          InsertSp.ExecProc;
                          InsertSp.close;
                          WriteTransaction.Commit;
                          InsertSp.Free;
                          TypeFinanceDataSet.CacheDelete;
                          TypeFinanceDataSet.Locate('ID_TYPE_FINANCE',id_,[]);
                end;
       end;
end;

procedure TfrmMainTypeFinance.ToolButton3Click(Sender: TObject);
begin
     if (TypeFinanceDataSet.RecordCount>0)
     then begin
               if not TypeFinanceTreeView.FocusedNode.HasChildren
               then begin
                         ResultValue:=TypeFinanceDataSet.FieldByName('ID_TYPE_FINANCE').Value;
                         ModalResult:=mrYes;
               end;
     end;
end;

procedure TfrmMainTypeFinance.TypeFinanceTreeViewDblClick(Sender: TObject);
begin
      if self.FormStyle=fsNormal
      then ToolButton3.OnClick(self);
end;

end.
