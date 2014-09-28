unit UPlanSign;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, ComCtrls, ToolWin, ImgList,
  ExtCtrls, cxLookAndFeelPainters, StdCtrls, cxButtons, FIBDataSet,
  pFIBDataSet,pFibStoredProc;

type
  TfrmSigners = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Splitter1: TSplitter;
    Panel4: TPanel;
    cxStyleRepository1: TcxStyleRepository;
    back: TcxStyle;
    column_gray: TcxStyle;
    periods: TcxStyle;
    StDoxod: TcxStyle;
    StRasxod: TcxStyle;
    MarkSummStyle: TcxStyle;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    SmallImages: TImageList;
    ToolBar3: TToolBar;
    addsumbutton: TToolButton;
    delsumbutton: TToolButton;
    updsumbutton: TToolButton;
    cxGrid4: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    Panel5: TPanel;
    Panel6: TPanel;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxButton1: TcxButton;
    Label1: TLabel;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    PersonsDataSet: TpFIBDataSet;
    UnderPlanDataSet: TpFIBDataSet;
    PersonsDataSource: TDataSource;
    UnderDocDataSource: TDataSource;
    Panel7: TPanel;
    cxButton4: TcxButton;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    procedure cxButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure addsumbuttonClick(Sender: TObject);
    procedure updsumbuttonClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses USmetStru, UPlanSignEdt;

procedure TfrmSigners.cxButton1Click(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfrmSigners.FormCreate(Sender: TObject);
begin
     PersonsDataSet.Database:=TfrmSmetaStru(owner).WorkDatabase;
     PersonsDataSet.Transaction:=TfrmSmetaStru(owner).ReadTransaction;
     PersonsDataSet.SelectSQL.Text:='SELECT * FROM BU_DOCS_SIGN_PERSON';
     PersonsDataSet.Open;


     UnderPlanDataSet.Database:=TfrmSmetaStru(owner).WorkDatabase;
     UnderPlanDataSet.Transaction:=TfrmSmetaStru(owner).ReadTransaction;
     UnderPlanDataSet.SelectSQL.Text:='SELECT * FROM BU_DOCS_SIGNS_SELECT('+IntToStr(TfrmSmetaStru(owner).CurIdPlan)+')';
     UnderPlanDataSet.Open;
end;

procedure TfrmSigners.addsumbuttonClick(Sender: TObject);
var  T:TfrmPersonEdit;
     InsertSP:TpFibStoredProc;
     new_id:Integer;
begin
     T:=TfrmPersonEdit.Create(self);
     if T.ShowModal=mrYes
     then begin
               InsertSP:=TpFibStoredProc.Create(self);
               InsertSP.Database:=TfrmSmetaStru(owner).WorkDatabase;
               InsertSP.Transaction:=TfrmSmetaStru(owner).WriteTransaction;
               InsertSP.StoredProcName:='BU_DOCS_SIGN_PERSON_INSERT';
               TfrmSmetaStru(owner).WriteTransaction.StartTransaction;
               InsertSP.Prepare;
               InsertSP.ParamByName('FIO').Value:=T.cxTextEdit1.Text;
               InsertSP.ParamByName('FIO_INFO').Value:=T.cxTextEdit2.Text;
               InsertSP.ExecProc;
               new_id:=InsertSP.ParamByName('ID_PERSON').Value;
               TfrmSmetaStru(owner).WriteTransaction.Commit;
               PersonsDataSet.CloseOpen(true);
               PersonsDataSet.Locate('ID_PERSON',new_id,[]);
     end;
     T.Free;
end;

procedure TfrmSigners.updsumbuttonClick(Sender: TObject);
var  T:TfrmPersonEdit;
     InsertSP:TpFibStoredProc;
     new_id:Integer;
begin
     T:=TfrmPersonEdit.Create(self);
     T.cxTextEdit1.Text:=PersonsDataSet.FieldByName('FIO').AsString;
     T.cxTextEdit2.Text:=PersonsDataSet.FieldByName('FIO_INFO').AsString;
     if T.ShowModal=mrYes
     then begin
               InsertSP:=TpFibStoredProc.Create(self);
               InsertSP.Database:=TfrmSmetaStru(owner).WorkDatabase;
               InsertSP.Transaction:=TfrmSmetaStru(owner).WriteTransaction;
               InsertSP.StoredProcName:='BU_DOCS_SIGN_PERSON_UPDATE';
               TfrmSmetaStru(owner).WriteTransaction.StartTransaction;
               InsertSP.Prepare;
               new_id:=PersonsDataSet.FieldByName('ID_PERSON').Value;
               InsertSP.ParamByName('ID_PERSON').Value:=PersonsDataSet.FieldByName('ID_PERSON').Value;
               InsertSP.ParamByName('FIO').Value:=T.cxTextEdit1.Text;
               InsertSP.ParamByName('FIO_INFO').Value:=T.cxTextEdit2.Text;
               InsertSP.ExecProc;
               TfrmSmetaStru(owner).WriteTransaction.Commit;
               PersonsDataSet.CloseOpen(true);
               PersonsDataSet.Locate('ID_PERSON',new_id,[]);
               InsertSP.Free;
     end;
     T.Free;
end;

procedure TfrmSigners.cxButton2Click(Sender: TObject);
var InsertSP:TpFibStoredProc;
begin
    if (PersonsDataSet.RecordCount>0)
    then begin
         if not UnderPlanDataSet.Locate('ID_SIGN_PERSON',PersonsDataSet.FieldByName('ID_PERSON').Value,[])
         then begin
               InsertSP:=TpFibStoredProc.Create(self);
               InsertSP.Database:=TfrmSmetaStru(owner).WorkDatabase;
               InsertSP.Transaction:=TfrmSmetaStru(owner).WriteTransaction;
               InsertSP.StoredProcName:='BU_DOCS_SIGNS_INSERT';
               TfrmSmetaStru(owner).WriteTransaction.StartTransaction;
               InsertSP.Prepare;
               InsertSP.ParamByName('ID_PLAN').AsInt64     :=TfrmSmetaStru(owner).CurIdPlan;
               InsertSP.ParamByName('ID_SIGN_PERSON').Value:=PersonsDataSet.FieldByName('ID_PERSON').Value;
               InsertSP.ExecProc;
               TfrmSmetaStru(owner).WriteTransaction.Commit;
               UnderPlanDataSet.CloseOpen(true);
               InsertSP.Free;
         end;
    end;
end;

procedure TfrmSigners.cxButton3Click(Sender: TObject);
var InsertSP:TpFibStoredProc;
begin
if (UnderPlanDataSet.RecordCount>0)
then begin
     InsertSP:=TpFibStoredProc.Create(self);
     InsertSP.Database:=TfrmSmetaStru(owner).WorkDatabase;
     InsertSP.Transaction:=TfrmSmetaStru(owner).WriteTransaction;
     InsertSP.StoredProcName:='BU_DOCS_SIGNS_DELETE';
     TfrmSmetaStru(owner).WriteTransaction.StartTransaction;
     InsertSP.Prepare;
     InsertSP.ParamByName('ID_PLAN').AsInt64     :=TfrmSmetaStru(owner).CurIdPlan;
     InsertSP.ParamByName('ID_SIGN_PERSON').Value:=UnderPlanDataSet.FieldByName('ID_SIGN_PERSON').Value;
     InsertSP.ExecProc;
     TfrmSmetaStru(owner).WriteTransaction.Commit;
     UnderPlanDataSet.CloseOpen(true);
     InsertSP.Free;
end;
end;

end.
