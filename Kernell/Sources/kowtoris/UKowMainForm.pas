unit UKowMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, Ibase, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  StdCtrls, ExtCtrls, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGrid, ComCtrls, ToolWin, ImgList,
  pFibStoredProc, FIBDataSet, pFIBDataSet, cxTextEdit;

type
  TfrmKowtoris = class(TForm)
    WorkDatabase: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
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
    ToolButton6: TToolButton;
    ToolButton1: TToolButton;
    ToolButton5: TToolButton;
    cxGrid3: TcxGrid;
    PlanView: TcxGridDBBandedTableView;
    cxGridLevel2: TcxGridLevel;
    PlanViewDBBandedColumn1: TcxGridDBBandedColumn;
    PlanViewDBBandedColumn2: TcxGridDBBandedColumn;
    PlanViewDBBandedColumn3: TcxGridDBBandedColumn;
    PlanViewDBBandedColumn4: TcxGridDBBandedColumn;
    PlanViewDBBandedColumn5: TcxGridDBBandedColumn;
    Panel1: TPanel;
    Label1: TLabel;
    cbYearBeg: TComboBox;
    DocsDataSet: TpFIBDataSet;
    DataSource1: TDataSource;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure PlanViewDblClick(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure cbYearBegChange(Sender: TObject);
  private
    { Private declarations }
    FIdUser:Int64;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; DbHandle: TISC_DB_HANDLE; id_User: Int64);reintroduce;
  end;

implementation

{$R *.dfm}

uses dateUtils, UKowEditDoc, UKowDocsValues;

{ TfrmKowtoris }

constructor TfrmKowtoris.Create(AOwner: TComponent; DbHandle: TISC_DB_HANDLE; id_User: Int64);
var I:Integer;
begin
     inherited Create(AOwner);
     WorkDatabase.Handle:=DbHandle;
     ReadTransaction.StartTransaction;
     FIdUser:=id_user;
     for i:=0 to 25 do
     begin
          cbYearBeg.Items.Add(TRIM(IntToStr(2010+i)));
     end;

     for i:=0 to cbYearBeg.Items.Count-1 do
     begin
           if pos(cbYearBeg.Items[i],IntToStr(YearOf(Date)))>0
           then begin
              cbYearBeg.ItemIndex:=i;
              break;
           end;
     end;

     DocsDataSet.SelectSQL.Text:='select * from acards_kosh_docs_sel('+''''+'01.01.'+cbYearBeg.Text+''''+')';
     DocsDataSet.Open;
end;

procedure TfrmKowtoris.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TfrmKowtoris.ToolButton3Click(Sender: TObject);
  var T:TfrmDocEdit;
      SP:TpFibStoredProc;
      id_doc:Integer;
begin
      T:=TfrmDocEdit.Create(self, WorkDatabase, ReadTransaction, FIdUser);

      if T.ShowModal=mrYes
      then begin
                SP:=TpFibStoredProc.Create(self);
                SP.Database:=WorkDatabase;
                Sp.Transaction:=WriteTransaction;
                WriteTransaction.StartTransaction;
                Sp.StoredProcName:='ACARDS_KOSH_DOCS_INS';
                Sp.Prepare;
                Sp.ParamByName('KOSH_DOC_DATE').Value :=T.cxDateEdit1.Date;
                Sp.ParamByName('KOSH_DOC_NUM').Value  :=T.cxTextEdit1.Text;
                Sp.ParamByName('KOSH_DOC_NOTE').Value :=T.cxMemo1.Text;
                Sp.ParamByName('ID_USER').AsInt64     :=FIdUser;
                Sp.ParamByName('KOSH_DOC_TYPE').Value :=1-Integer(T.cxRadioButton1.Checked);
                Sp.ParamByName('ID_PKV').Value        :=T.id_pkv;
                SP.ParamByName('ID_TF').Value         :=T.id_tf;
                Sp.ExecProc;
                id_doc:=SP.ParamByName('ID_KOSH_DOC').Value;
                WriteTransaction.Commit;
                Sp.Free;
                PlanView.BeginUpdate;
                DocsDataSet.CloseOpen(true);
                DocsDataSet.Locate('ID_KOSH_DOC',id_doc,[]);
                PlanView.EndUpdate;
      end;

      T.Free;
end;

procedure TfrmKowtoris.ToolButton4Click(Sender: TObject);
 var T:TfrmDocEdit;
      SP:TpFibStoredProc;
      id_doc:Integer;
begin
      if (DocsDataSet.RecordCount>0)
      then begin
                T:=TfrmDocEdit.Create(self, WorkDatabase, ReadTransaction, FIdUser);
                T.cxMemo1.Text:=DocsDataSet.FieldByName('KOSH_DOC_NOTE').Value;

                if DocsDataSet.FieldByName('KOSH_DOC_TYPE').Value=0
                then T.cxRadioButton1.Checked:=true
                else T.cxRadioButton2.Checked:=true;

                T.cxRadioButton1.Enabled:=false;
                T.cxRadioButton2.Enabled:=false;

                T.cxDateEdit1.Date:=DocsDataSet.FieldByName('KOSH_DOC_DATE').Value;
                T.cxTextEdit1.Text:=DocsDataSet.FieldByName('KOSH_DOC_NUM').Value;
                T.cxButtonEdit2.Text:=DocsDataSet.FieldByName('pkv_kode').Value;
                T.cxButtonEdit2.Enabled:=false;
                T.id_pkv:=DocsDataSet.FieldByName('id_pkv').Value;
                T.cxButtonEdit1.Text:=DocsDataSet.FieldByName('tf_kode').Value;
                T.id_pkv:=DocsDataSet.FieldByName('id_tf').Value;
                T.cxButtonEdit1.Enabled:=false;

                if T.ShowModal=mrYes
                then begin
                          SP:=TpFibStoredProc.Create(self);
                          SP.Database:=WorkDatabase;
                          Sp.Transaction:=WriteTransaction;
                          WriteTransaction.StartTransaction;
                          Sp.StoredProcName:='ACARDS_KOSH_DOCS_UPD';
                          Sp.Prepare;
                          id_doc:=DocsDataSet.FieldByName('ID_KOSH_DOC').Value;
                          SP.ParamByName('ID_KOSH_DOC').Value:=id_doc;
                          Sp.ParamByName('KOSH_DOC_DATE').Value :=T.cxDateEdit1.Date;
                          Sp.ParamByName('KOSH_DOC_NUM').Value  :=T.cxTextEdit1.Text;
                          Sp.ParamByName('KOSH_DOC_NOTE').Value :=T.cxMemo1.Text;
                          Sp.ParamByName('ID_USER').AsInt64     :=FIdUser;
                          Sp.ParamByName('KOSH_DOC_TYPE').Value :=1-Integer(T.cxRadioButton1.Checked);
                          Sp.ParamByName('ID_PKV').Value        :=T.id_pkv;
                          SP.ParamByName('ID_TF').Value         :=T.id_tf;
                          Sp.ExecProc;

                          WriteTransaction.Commit;
                          Sp.Free;
                          PlanView.BeginUpdate;
                          DocsDataSet.CloseOpen(true);
                          DocsDataSet.Locate('ID_KOSH_DOC',id_doc,[]);
                          PlanView.EndUpdate;
                end;

                T.Free;
      end;
end;

procedure TfrmKowtoris.ToolButton2Click(Sender: TObject);
var SP:TpFibStoredProc;
    id_doc:Integer;
begin
     if DocsDataSet.RecordCount>0
     then begin
               if MessageBox(Handle, 'Ви хочете видалити документ?', 'Увага!',MB_YESNO + MB_ICONQUESTION) = IDYES
               then begin
                          SP:=TpFibStoredProc.Create(self);
                          SP.Database:=WorkDatabase;
                          Sp.Transaction:=WriteTransaction;
                          WriteTransaction.StartTransaction;
                          Sp.StoredProcName:='ACARDS_KOSH_DOCS_DEL';
                          Sp.Prepare;
                          id_doc:=DocsDataSet.FieldByName('ID_KOSH_DOC').Value;
                          SP.ParamByName('ID_KOSH_DOC').Value:=id_doc;
                          Sp.ExecProc;
                          WriteTransaction.Commit;
                          Sp.Free;
                          PlanView.BeginUpdate;
                          DocsDataSet.CacheDelete;
                          PlanView.EndUpdate;
               end;
     end;
end;

procedure TfrmKowtoris.ToolButton7Click(Sender: TObject);
var id_doc :Integer;
begin
     id_doc:=-1;
     if DocsDataSet.RecordCount>0 then id_doc:=DocsDataSet.FieldByName('ID_KOSH_DOC').Value;
     PlanView.BeginUpdate;
     DocsDataSet.CloseOpen(true);
     DocsDataSet.Locate('ID_KOSH_DOC',id_doc,[]);
     PlanView.EndUpdate;
end;

procedure TfrmKowtoris.ToolButton8Click(Sender: TObject);
var T:TfrmDocValues;
    i:Integer;
    f:Boolean;
begin
     if (DocsDataSet.RecordCount>0)
     then begin
               f:=true;
               for i:=0 to Application.MainForm.MDIChildCount-1 do
               begin
                    if (Application.MainForm.MDIChildren[i] is TfrmDocValues)
                    then begin
                              if (Application.MainForm.MDIChildren[i] as TfrmDocValues).id_doc=
                              DocsDataSet.FieldByName('ID_KOSH_DOC').Value
                              then begin
                                        (Application.MainForm.MDIChildren[i] as TfrmDocValues).BringToFront;
                                        f:=false;
                                        Break;

                              end;
                    end;
               end;
               if f then T:=TfrmDocValues.Create(Application.MainForm,
               WorkDatabase.Handle,FIdUser,DocsDataSet.FieldByName('ID_KOSH_DOC').Value);
     end;
end;

procedure TfrmKowtoris.PlanViewDblClick(Sender: TObject);
begin
     ToolButton8Click(self);
end;

procedure TfrmKowtoris.ToolButton5Click(Sender: TObject);
begin
     Close;
end;

procedure TfrmKowtoris.cbYearBegChange(Sender: TObject);
begin
     if DocsDataSet.Active then DocsDataSet.Close;
     DocsDataSet.SelectSQL.Text:='select * from acards_kosh_docs_sel('+''''+'01.01.'+cbYearBeg.Text+''''+')';
     ToolButton7Click(self);
end;

end.
