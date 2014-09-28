unit USmetaDocs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, StdCtrls, ComCtrls, ToolWin, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  FIBDataSet, pFIBDataSet,pFibStoredProc, Resources_unitb, cxTextEdit;

type
  TfrmSDocs = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    AddButton: TToolButton;
    DelButton: TToolButton;
    RefreshButton: TToolButton;
    ToolButton12: TToolButton;
    CloseButton: TToolButton;
    SmallImages: TImageList;
    ToolButton1: TToolButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    DocsDataSet: TpFIBDataSet;
    DocDataSource: TDataSource;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    back: TcxStyle;
    column_gray: TcxStyle;
    periods: TcxStyle;
    StDoxod: TcxStyle;
    StRasxod: TcxStyle;
    MarkSummStyle: TcxStyle;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    procedure AddButtonClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses uEditSmetaDocs,USmetStru, BaseTypes;

{$R *.dfm}

procedure TfrmSDocs.AddButtonClick(Sender: TObject);
var T:TfrmEditSmetaDocs;
    Proc:TpFibStoredProc;
    id : Integer;
begin
    T:=TfrmEditSmetaDocs.create(self);
    T.edit_flag:=false;
    if T.ShowModal=mrYes
    then begin
         id:=0;
         Proc:=TpFibStoredProc.Create(self);
         Proc.Database:=TfrmSmetaStru(self.owner).WorkDatabase;
         Proc.Transaction:=TfrmSmetaStru(self.owner).WriteTransaction;
         proc.StoredProcName:='BU_SMET_DOCS_INSERT';
         TfrmSmetaStru(self.owner).WriteTransaction.StartTransaction;
         try
                proc.Prepare;
                proc.ParamByName('P_DATE_DOC').Value:=T.DocDate.Date;
                proc.ParamByName('P_DATE_NUM').Value:=T.EdNum.text;
                proc.ParamByName('P_DOC_ACTION').Value:=T.cbDocType.ItemIndex;
                if T.RadioButton1.Checked then proc.ParamByName('P_DOC_STATE').Value:=0;
                if T.RadioButton2.Checked then proc.ParamByName('P_DOC_STATE').Value:=1;
                if T.RadioButton3.Checked then proc.ParamByName('P_DOC_STATE').Value:=2;
                proc.ParamByName('P_ID_PLAN').AsInt64:=TfrmSmetaStru(self.owner).CurIdPlan;
                proc.ParamByName('P_DOC_NOTE').Value:=T.Memo1.Text;
                proc.ExecProc;
                id:=proc.ParamByName('P_ID_DOC').Value;
         except on E:Exception do
                begin
                   BaseTypes.agMessageDlg('гтрур!',E.Message,mtError,[mbOk]);
                   TfrmSmetaStru(self.owner).WriteTransaction.Rollback;
                end;
         end;
         TfrmSmetaStru(self.owner).WriteTransaction.Commit;
         DocsDataSet.CloseOpen(true);
         DocsDataSet.Locate('ID_DOC',id,[]);
    end;
    T.Free;
end;

procedure TfrmSDocs.ToolButton1Click(Sender: TObject);
var T:TfrmEditSmetaDocs;
    Proc:TpFibStoredProc;
    id : Integer;
begin
    T:=TfrmEditSmetaDocs.create(self);
    T.edit_flag:=true;
    if T.ShowModal=mrYes
    then begin
         id:=0;
         Proc:=TpFibStoredProc.Create(self);
         Proc.Database:=TfrmSmetaStru(self.owner).WorkDatabase;
         Proc.Transaction:=TfrmSmetaStru(self.owner).WriteTransaction;
         proc.StoredProcName:='BU_SMET_DOCS_UPDATE';
         TfrmSmetaStru(self.owner).WriteTransaction.StartTransaction;
         try
                proc.Prepare;
                id:=DocsDataSet.FieldByName('ID_DOC').AsInteger;
                proc.ParamByName('P_ID_DOC').Value:=DocsDataSet.FieldByName('ID_DOC').AsInteger;
                proc.ParamByName('P_DATE_DOC').Value:=T.DocDate.Date;
                proc.ParamByName('P_DATE_NUM').Value:=T.EdNum.text;
                proc.ParamByName('P_DOC_ACTION').Value:=T.cbDocType.ItemIndex;
                if T.RadioButton1.Checked then proc.ParamByName('P_DOC_STATE').Value:=0;
                if T.RadioButton2.Checked then proc.ParamByName('P_DOC_STATE').Value:=1;
                if T.RadioButton3.Checked then proc.ParamByName('P_DOC_STATE').Value:=2;
                proc.ParamByName('P_ID_PLAN').AsInt64:=TfrmSmetaStru(self.owner).CurIdPlan;
                proc.ParamByName('P_DOC_NOTE').Value:=T.Memo1.Text;
                proc.ExecProc;

         except on E:Exception do
                begin
                   BaseTypes.agMessageDlg('гтрур!',E.Message,mtError,[mbOk]);
                   TfrmSmetaStru(self.owner).WriteTransaction.Rollback;
                end;
         end;
         TfrmSmetaStru(self.owner).WriteTransaction.Commit;
         DocsDataSet.CloseOpen(true);
         DocsDataSet.Locate('ID_DOC',id,[]);
    end;
    T.Free;
end;

procedure TfrmSDocs.FormShow(Sender: TObject);
begin
     DocsDataSet.Database:=TfrmSmetaStru(self.owner).WorkDatabase;
     DocsDataSet.Transaction:=TfrmSmetaStru(self.owner).ReadTransaction;
     DocsDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM BU_SMET_DOCS_SELECT('+IntToStr(TfrmSmetaStru(self.owner).CurIdPlan)+') ORDER BY ID_DOC';
     DocsDataSet.Open;
     DocsDataSet.FetchAll;
     DocsDataSet.RecordCount;
end;

procedure TfrmSDocs.DelButtonClick(Sender: TObject);
    var Proc:TpFibStoredProc;
begin
    if MessageBox(Handle,PChar(BU_DeleteConfirmation+' '+DocsDataSet.FieldByName('DATE_NUM').AsString),PChar(BU_WarningCaption),MB_YESNO or MB_ICONQUESTION)=idYes
    then begin
         Proc:=TpFibStoredProc.Create(self);
         Proc.Database:=TfrmSmetaStru(self.owner).WorkDatabase;
         Proc.Transaction:=TfrmSmetaStru(self.owner).WriteTransaction;
         proc.StoredProcName:='BU_SMET_DOCS_DELETE';
         TfrmSmetaStru(self.owner).WriteTransaction.StartTransaction;
         try
                proc.Prepare;
                proc.ParamByName('P_ID_DOC').Value:=DocsDataSet.FieldByName('ID_DOC').AsInteger;
                proc.ExecProc;
         except on E:Exception do
                begin
                   BaseTypes.agMessageDlg('гтрур!',E.Message,mtError,[mbOk]);
                end;
         end;
         TfrmSmetaStru(self.owner).WriteTransaction.Commit;
         DocsDataSet.CloseOpen(true);
    end;
end;

procedure TfrmSDocs.CloseButtonClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmSDocs.RefreshButtonClick(Sender: TObject);
begin
     DocsDataSet.CloseOpen(true);
end;

end.
