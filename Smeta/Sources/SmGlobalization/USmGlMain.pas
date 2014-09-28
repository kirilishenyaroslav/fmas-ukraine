unit USmGlMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxMaskEdit, cxCheckBox, cxInplaceContainer, cxDBTL, cxControls, cxTLData,
  ComCtrls, ToolWin, ImgList, FIBDatabase, pFIBDatabase, DB, FIBDataSet,
  pFIBDataSet, Placemnt, pFibStoredProc, Menus, frxClass, frxDBSet;

type
  TfrmSmGlMain = class(TForm)
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    SmallImages: TImageList;
    cxStyleRepository1: TcxStyleRepository;
    back: TcxStyle;
    column_gray: TcxStyle;
    periods: TcxStyle;
    cxStyle1: TcxStyle;
    ToolBar1: TToolBar;
    AddButton: TToolButton;
    DelButton: TToolButton;
    UpdateButton: TToolButton;
    ToolButton7: TToolButton;
    ToolButton14: TToolButton;
    CloseButton: TToolButton;
    KekvTreeList: TcxDBTreeList;
    cxDBTreeList1cxDBTreeListColumn2: TcxDBTreeListColumn;
    GlobalObjDataSet: TpFIBDataSet;
    SmGlobObjectDataSource: TDataSource;
    FormStorage1: TFormStorage;
    KekvTreeListcxDBTreeListColumn1: TcxDBTreeListColumn;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    PopupMenu: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    DataSet: TpFIBDataSet;
    frxDBDataset1: TfrxDBDataset;
    PlanRestDataset: TpFIBDataSet;
    frxReport1: TfrxReport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CloseButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure UpdateButtonClick(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;id_user:int64);reintroduce;
  end;

  procedure GetSmGlobalization(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;id_user:int64);stdcall;
  exports GetSmGlobalization;

implementation

uses USmGrEdit, BaseTypes, USmGlReestr, UGetDate;

procedure GetSmGlobalization(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;id_user:int64);
var i:Integer;
    f:Boolean;
begin
      f :=true;
      for i:=0 to Application.MainForm.MDIChildCount-1 do
      begin
           if (Application.MainForm.MDIChildren[i] is TfrmSmGlMain)
           then begin
                     Application.MainForm.MDIChildren[i].BringToFront;
                     f:=false;
           end;
      end;
      if f then TfrmSmGlMain.Create(AOwner,DB_Handle,id_user);
end;

{$R *.dfm}

{ TfrmSmGlMain }

constructor TfrmSmGlMain.Create(AOwner: TComponent; DB_Handle: TISC_DB_HANDLE; id_user: int64);
begin
     inherited Create(AOwner);
     WorkDatabase.Handle:=DB_Handle;
     ReadTransaction.StartTransaction;

     GlobalObjDataSet.Open;
     GlobalObjDataSet.First;
end;

procedure TfrmSmGlMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TfrmSmGlMain.CloseButtonClick(Sender: TObject);
begin
      Close;
end;

procedure TfrmSmGlMain.AddButtonClick(Sender: TObject);
var T:TfrmSmGlObjectEdit;
    InsertSP:TpFibStoredProc;
    new_id:Integer;
begin
     T:=TfrmSmGlObjectEdit.Create(self);
     if T.ShowModal=mrYes
     then begin
               InsertSP:=TpFibStoredProc.Create(self);
               InsertSP.Database:=WorkDatabase;
               InsertSP.Transaction:=WriteTransaction;
               WriteTransaction.StartTransaction;
               InsertSP.StoredProcName:='BU_SM_GLOBAL_OBJECT_INSERT';
               InsertSP.Prepare;
               InsertSP.ParamByName('OBJECT_TITLE').Value:=T.ObjectName.Text;
               if T.cxCheckBox1.Checked
               then InsertSP.ParamByName('LINKTO').Value :=NULL
               else begin
                         if (GlobalObjDataSet.RecordCount>0)
                         then InsertSP.ParamByName('LINKTO').Value :=GlobalObjDataSet.FieldByName('ID_OBJECT').Value
                         else InsertSP.ParamByName('LINKTO').Value :=NULL;
               end;
               InsertSP.ExecProc;
               new_id:=InsertSP.ParamByName('ID_OBJECT').Value;
               WriteTransaction.Commit;
               GlobalObjDataSet.CloseOpen(true);
               GlobalObjDataSet.Locate('ID_OBJECT',new_id,[]);

               InsertSP.Free;
     end;
     T.Free;
end;

procedure TfrmSmGlMain.UpdateButtonClick(Sender: TObject);
var T:TfrmSmGlObjectEdit;
    UpdateSP:TpFibStoredProc;
    new_id:Integer;
begin
     if (GlobalObjDataSet.RecordCount>0)
     then begin
               T:=TfrmSmGlObjectEdit.Create(self);
               T.ObjectName.Text:=GlobalObjDataSet.FieldByName('OBJECT_TITLE').AsString;
               T.cxCheckBox1.Enabled:=false;
               if T.ShowModal=mrYes
               then begin
                         UpdateSP:=TpFibStoredProc.Create(self);
                         UpdateSP.Database:=WorkDatabase;
                         UpdateSP.Transaction:=WriteTransaction;
                         WriteTransaction.StartTransaction;
                         UpdateSP.StoredProcName:='BU_SM_GLOBAL_OBJECT_UPDATE';
                         UpdateSP.Prepare;
                         new_id:=GlobalObjDataSet.FieldByName('ID_OBJECT').Value;
                         UpdateSP.ParamByName('ID_OBJECT').Value   :=GlobalObjDataSet.FieldByName('ID_OBJECT').Value;
                         UpdateSP.ParamByName('OBJECT_TITLE').Value:=T.ObjectName.Text;
                         UpdateSP.ParamByName('LINKTO').Value      :=GlobalObjDataSet.FieldByName('LINKTO').Value;
                         UpdateSP.ExecProc;
                         WriteTransaction.Commit;
                         GlobalObjDataSet.CloseOpen(true);
                         GlobalObjDataSet.Locate('ID_OBJECT',new_id,[]);
                         UpdateSP.Free;
               end;
               T.Free;
     end;
end;

procedure TfrmSmGlMain.DelButtonClick(Sender: TObject);
var deleteSP:TpFibStoredProc;
    new_id:integer;
begin
     new_id:=-1;
     if (GlobalObjDataSet.RecordCount>0)
     then begin
               if (agMessageDlg('Увага!','Ви хочете видалити запис?',mtConfirmation,[mbYes,mbNo])=mrYes)
               then begin
                         deleteSP:=TpFibStoredProc.Create(self);
                         deleteSP.Database:=WorkDatabase;
                         deleteSP.Transaction:=WriteTransaction;
                         WriteTransaction.StartTransaction;
                         deleteSP.StoredProcName:='BU_SM_GLOBAL_OBJECT_DELETE';
                         deleteSP.Prepare;
                         if GlobalObjDataSet.FieldByName('LINKTO').Value<>null
                         then new_id:=GlobalObjDataSet.FieldByName('LINKTO').Value;
                         deleteSP.ParamByName('ID_OBJECT').Value   :=GlobalObjDataSet.FieldByName('ID_OBJECT').Value;
                         deleteSP.ExecProc;
                         WriteTransaction.Commit;
                         GlobalObjDataSet.CacheDelete;
                         GlobalObjDataSet.Locate('ID_OBJECT',new_id,[]);
                         deleteSP.Free;
               end;
     end;
end;

procedure TfrmSmGlMain.ToolButton7Click(Sender: TObject);
var new_id:Integer;
begin
     new_id:=-1;
     if GlobalObjDataSet.RecordCount>0
     then new_id:=GlobalObjDataSet.FieldByName('ID_OBJECT').Value;
     GlobalObjDataSet.CloseOpen(true);
     GlobalObjDataSet.Locate('ID_OBJECT',new_id,[]);
end;

procedure TfrmSmGlMain.ToolButton1Click(Sender: TObject);
var  T:TfrmSmGlReestr;
begin
     T:=TfrmSmGlReestr.Create(self);
     T.ShowModal;
     T.Free;
end;

procedure TfrmSmGlMain.N1Click(Sender: TObject);
var
  T: TfrmGetDate;
begin
     if (GlobalObjDataSet.RecordCount>0)
     then begin
               T:=TfrmGetDate.Create(self);
               if T.ShowModal=mrYes
               then begin
                         if PlanRestDataset.Active then PlanRestDataset.Close;
                         PlanRestDataset.SelectSQL.Text:='SELECT * FROM BU_SM_GLOBAL_GET_REST('+GlobalObjDataSet.FieldByName('ID_OBJECT').AsString+' ,'+
                                                         ''''+DateToStr(T.cxDateEdit1.Date)+''''+',0)';
                         PlanRestDataset.Open;


                         //Выполняем отчтет и даем его на просмотр
                         If DataSet.Active then DataSet.Close;
                         DataSet.SelectSQL.Text:=' SELECT * FROM BU_SM_GLOBAL_CALC('+GlobalObjDataSet.FieldByName('ID_OBJECT').AsString+' ,'+
                                                 ''''+DateToStr(T.cxDateEdit1.Date)+''''+') ORDER BY PROFIT_FLAG DESC, SHOW_POSITION, SHOW_NUM';
                         Screen.Cursor:=crHourGlass;
                         frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Budgeting\SmGlobalizationReportFull.fr3',true);
                         frxReport1.Variables['TITLE']:=''''+GlobalObjDataSet.FieldByName('OBJECT_TITLE').AsString+'''';
                         frxReport1.Variables['DATE_DATA']:=Date;
                         frxReport1.Variables['REST']     :=PlanRestDataset.FieldByName('REST').Value;
                         frxReport1.PrepareReport(true);
                         Screen.Cursor:=crDefault;
                         frxReport1.ShowPreparedReport;
               end;
               T.Free;
     end;
end;

procedure TfrmSmGlMain.N2Click(Sender: TObject);
var
  T: TfrmGetDate;
begin
     if (GlobalObjDataSet.RecordCount>0)
     then begin
               T:=TfrmGetDate.Create(self);
               if T.ShowModal=mrYes
               then begin
                         //Выполняем отчтет и даем его на просмотр
                         if PlanRestDataset.Active then PlanRestDataset.Close;
                         PlanRestDataset.SelectSQL.Text:='SELECT * FROM BU_SM_GLOBAL_GET_REST('+GlobalObjDataSet.FieldByName('ID_OBJECT').AsString+' ,'+
                                                         ''''+DateToStr(T.cxDateEdit1.Date)+''''+',1)';
                         PlanRestDataset.Open;


                         If DataSet.Active then DataSet.Close;
                         DataSet.SelectSQL.Text:=' SELECT * FROM BU_SM_GLOBAL_CALC('+GlobalObjDataSet.FieldByName('ID_OBJECT').AsString+' ,'+
                                                 ''''+DateToStr(T.cxDateEdit1.Date)+''''+') ORDER BY PROFIT_FLAG DESC, SHOW_POSITION, SHOW_NUM';
                         Screen.Cursor:=crHourGlass;
                         frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Budgeting\SmGlobalizationReportFullF.fr3',true);
                         frxReport1.Variables['TITLE']:=''''+GlobalObjDataSet.FieldByName('OBJECT_TITLE').AsString+'''';
                         frxReport1.Variables['DATE_DATA']:=Date;
                         frxReport1.Variables['REST']     :=PlanRestDataset.FieldByName('REST').Value;                         
                         frxReport1.PrepareReport(true);
                         Screen.Cursor:=crDefault;
                         frxReport1.ShowPreparedReport;
               end;
               T.Free;
     end;
end;

procedure TfrmSmGlMain.ToolButton3Click(Sender: TObject);
begin
     N1Click(self);
end;

end.
