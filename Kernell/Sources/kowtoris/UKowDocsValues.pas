unit UKowDocsValues;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridBandedTableView,
  cxGridDBBandedTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  ComCtrls, ToolWin, ImgList, pFibDataBase, Ibase, FIBDatabase,
  pFibDataSet, ExtCtrls, FIBDataSet, pFibStoredProc, StdCtrls;

type
  TfrmDocValues = class(TForm)
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    columnst: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    SmallImages: TImageList;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton2: TToolButton;
    ToolButton7: TToolButton;
    ToolButton5: TToolButton;
    cxGrid3: TcxGrid;
    PlanView: TcxGridDBBandedTableView;
    PlanViewDBBandedColumn1: TcxGridDBBandedColumn;
    PlanViewDBBandedColumn2: TcxGridDBBandedColumn;
    PlanViewDBBandedColumn3: TcxGridDBBandedColumn;
    cxGridLevel2: TcxGridLevel;
    PlanViewDBBandedColumn4: TcxGridDBBandedColumn;
    PlanViewDBBandedColumn5: TcxGridDBBandedColumn;
    WorkDatabase: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    Panel1: TPanel;
    PosDataSet: TpFIBDataSet;
    DataSource1: TDataSource;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    procedure ToolButton5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure PlanViewDblClick(Sender: TObject);
  private
    { Private declarations }
    fiduser:Int64;
  public
    { Public declarations }
    id_doc :Integer;
    constructor Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;id_user:Int64; fid_doc:Integer);reintroduce;
  end;


implementation

uses UDocValueEdit, cxCalc;

{$R *.dfm}

constructor TfrmDocValues.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;id_user:Int64; fid_doc:Integer);
var DocInfoDS:TpFibDataSet;
begin
     inherited Create(AOwner);
     self.id_doc:=fid_doc;
     self.fiduser:=id_user;
     WorkDatabase.Handle:=DB_Handle;
     ReadTransaction.StartTransaction;
     DocInfoDS:=TpFibDataSet.Create(self);
     DocInfoDS.Database:=WorkDatabase;
     DocInfoDS.Transaction:=ReadTransaction;
     DocInfoDS.SelectSQL.Text:='select * from acards_kosh_docs_sel2('+IntToStr(self.id_doc)+')';
     DocInfoDS.Open;
     if DocInfoDS.RecordCount>0
     then begin
               Panel1.Caption:=DocInfoDS.FieldByName('KOSH_DOC_TYPE_TEXT').AsString+
                             '  від '+ DocInfoDS.FieldByName('KOSH_DOC_DATE').AsString +
                             '  №'+ DocInfoDS.FieldByName('KOSH_DOC_NUM').AsString;
               Panel1.Repaint;
               Label1.Caption:=DocInfoDS.FieldByName('pkv_kode').AsString +' '+DocInfoDS.FieldByName('pkv_title').AsString;
               Label2.Caption:=DocInfoDS.FieldByName('tf_kode').AsString +' '+DocInfoDS.FieldByName('type_finance_name').AsString;
     end;
     PosDataSet.SelectSQL.Text:='select * from acards_kosh_pos_sel('+IntToStr(self.id_doc)+')';
     PosDataSet.Open;
end;

procedure TfrmDocValues.ToolButton5Click(Sender: TObject);
begin
     Close;
end;

procedure TfrmDocValues.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TfrmDocValues.ToolButton3Click(Sender: TObject);
var T:TfrmEditValue;
    SP:TpFibStoredProc;
    id:Integer;
begin
     T:=TfrmEditValue.Create(self, WorkDatabase, ReadTransaction, fiduser);
     if T.ShowModal=mrYes
     then begin
                SP:=TpFibStoredProc.Create(self);
                SP.Database:=WorkDatabase;
                Sp.Transaction:=WriteTransaction;
                WriteTransaction.StartTransaction;
                Sp.StoredProcName:='ACARDS_KOSH_POS_INS';
                Sp.Prepare;
                Sp.ParamByName('id_doc').Value          :=self.id_doc;
                Sp.ParamByName('id_analitic_rz').Value  :=T.id_rz;
                Sp.ParamByName('id_analitic_kv').Value  :=T.id_kv;
                Sp.ParamByName('val_summa').Value       :=t.cxCalcEdit1.Value;
                Sp.ExecProc;
                id:=SP.ParamByName('ID_POS').Value;
                WriteTransaction.Commit;
                Sp.Free;
                PlanView.BeginUpdate;
                PosDataSet.CloseOpen(true);
                PosDataSet.Locate('ID_POS',id,[]);
                PlanView.EndUpdate;
     end;
     T.Free;
end;

procedure TfrmDocValues.ToolButton4Click(Sender: TObject);
var T:TfrmEditValue;
    SP:TpFibStoredProc;
    id:Integer;
begin
     if (PosDataSet.RecordCount>0)
     then begin
               T:=TfrmEditValue.Create(self, WorkDatabase, ReadTransaction, fiduser);
               T.cxButtonEdit1.Text:=PosDataSet.FieldByName('razd_st_num').AsString+' "'+
                         PosDataSet.FieldByName('razd_st_title').AsString+'"';
               T.id_rz:=PosDataSet.FieldByName('id_analitic_rz').Value;
               T.cxButtonEdit1.Enabled:=false;

               T.cxButtonEdit2.Text:=PosDataSet.FieldByName('kekv_code').AsString+' "'+
                         PosDataSet.FieldByName('kekv_title').AsString+'"';
               T.id_kv:=PosDataSet.FieldByName('id_analitic_kv').Value;
               T.cxCalcEdit1.Value:=PosDataSet.FieldByName('val_summa').Value;
               T.cxButtonEdit2.Enabled:=false;
               
               if T.ShowModal=mrYes
               then begin
                          SP:=TpFibStoredProc.Create(self);
                          SP.Database:=WorkDatabase;
                          Sp.Transaction:=WriteTransaction;
                          WriteTransaction.StartTransaction;
                          Sp.StoredProcName:='ACARDS_KOSH_POS_UPD';
                          Sp.Prepare;
                          Sp.ParamByName('id_pos').Value          :=PosDataSet.FieldByName('id_pos').Value;
                          //Sp.ParamByName('id_analitic_rz').Value  :=T.id_rz;
                          //Sp.ParamByName('id_analitic_kv').Value  :=T.id_kv;
                          Sp.ParamByName('val_summa').Value       :=t.cxCalcEdit1.Value;
                          Sp.ExecProc;
                          id:=SP.ParamByName('ID_POS').Value;
                          WriteTransaction.Commit;
                          Sp.Free;
                          PlanView.BeginUpdate;
                          PosDataSet.CloseOpen(true);
                          PosDataSet.Locate('ID_POS',id,[]);
                          PlanView.EndUpdate;
               end;
               T.Free;
     end;
end;

procedure TfrmDocValues.ToolButton2Click(Sender: TObject);
var SP:TpFibStoredProc;
    id:Integer;
begin
     if (PosDataSet.RecordCount>0)
     then begin
               if MessageBox(Handle, 'Ви хочете видалити показник з документа?', 'Увага!',MB_YESNO + MB_ICONQUESTION) = IDYES
               then begin
                          SP:=TpFibStoredProc.Create(self);
                          SP.Database:=WorkDatabase;
                          Sp.Transaction:=WriteTransaction;
                          WriteTransaction.StartTransaction;
                          Sp.StoredProcName:='ACARDS_KOSH_POS_DEL';
                          Sp.Prepare;
                          id:=PosDataSet.FieldByName('ID_POS').Value;
                          SP.ParamByName('ID_POS').Value:=id;
                          Sp.ExecProc;
                          WriteTransaction.Commit;
                          Sp.Free;
                          PlanView.BeginUpdate;
                          PosDataSet.CacheDelete;
                          PlanView.EndUpdate;
               end;
     end;
end;

procedure TfrmDocValues.ToolButton7Click(Sender: TObject);
var id :Integer;
begin
     id:=-1;
     if PosDataSet.RecordCount>0 then id:=PosDataSet.FieldByName('ID_POS').Value;
     PlanView.BeginUpdate;
     PosDataSet.CloseOpen(true);
     PosDataSet.Locate('ID_POS',id,[]);
     PlanView.EndUpdate;
end;

procedure TfrmDocValues.PlanViewDblClick(Sender: TObject);
begin
     ToolButton4Click(Self);
end;

end.
