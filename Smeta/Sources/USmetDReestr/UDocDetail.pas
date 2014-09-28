unit UDocDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, cxStyles, ImgList, ExtCtrls, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxTextEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxGridBandedTableView, cxGridDBBandedTableView,Ibase, FIBDatabase,
  pFIBDatabase, Menus,pFibDataSet, cxMemo, StdCtrls, cxContainer,
  cxMaskEdit, cxDropDownEdit, cxCalendar, FIBDataSet, pFibStoredProc,
  Halcn6db, frxClass, frxDBSet;

type
  TfrmDocDetail = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    SmallImages: TImageList;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    ToolBar1: TToolBar;
    AddButton: TToolButton;
    DelButton: TToolButton;
    cxGrid1: TcxGrid;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn2: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn3: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn4: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn5: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn6: TcxGridDBBandedColumn;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    WorkDatabase: TpFIBDatabase;
    AddProvPopupMenu: TPopupMenu;
    N1: TMenuItem;
    EdDocNum: TcxTextEdit;
    Label1: TLabel;
    Panel3: TPanel;
    Splitter1: TSplitter;
    Label3: TLabel;
    EditDocDate: TcxDateEdit;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    Label4: TLabel;
    EdDateProv: TcxDateEdit;
    TemplatesDataSet: TpFIBDataSet;
    TemplatesDataSource: TDataSource;
    ProvsDataSet: TpFIBDataSet;
    ProvsDataSource: TDataSource;
    cxGrid1DBBandedTableView1DBBandedColumn7: TcxGridDBBandedColumn;
    ToolButton4: TToolButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    EdComment: TcxMemo;
    ActionLog: TcxMemo;
    cxGrid4: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBTableView2DBColumn1: TcxGridDBColumn;
    cxGridDBTableView2DBColumn2: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    Panel4: TPanel;
    ErrorProvDataSet: TpFIBDataSet;
    ErrorProvDataSource: TDataSource;
    Label5: TLabel;
    EdSumma: TcxTextEdit;
    Panel5: TPanel;
    Label2: TLabel;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    ToolButton5: TToolButton;
    OpenDialog1: TOpenDialog;
    HalcyonDataSet1: THalcyonDataSet;
    ToolButton6: TToolButton;
    frxDBDataset1: TfrxDBDataset;
    cxGrid1DBBandedTableView1DBBandedColumn8: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn9: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn10: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn11: TcxGridDBBandedColumn;
    frxReport1: TfrxReport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AddButtonClick(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure cxGrid1DBBandedTableView1DblClick(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
  private
    KEY_SESSION:Int64;
    id_user:Integer;
    Mode:Integer;
    { Private declarations }
  public
    { Public declarations }
    pk_id : int64;
    ActualDate:TDateTime;
    constructor Create(AOwner:TComponent;DBHandle:TISC_DB_Handle;ActualDate:TDateTime;Mode:Integer;Id_user:Integer;PK_ID:Int64);overload;
    procedure CreateNewDoc;
    procedure LoadDataToBuffer;
    procedure UpdateSum;
  end;


  procedure GetBuDoc(AOwner:TComponent;DBHandle:TISC_DB_Handle;ActualDate:TDateTime;Mode:Integer;Id_user:Integer;PK_ID:Int64);stdcall;
  exports GetBuDoc;

implementation

uses Kernel, UGetTemplate, GlobalSpr, UGetSmRzSt, UGetSum,  BaseTypes;

procedure GetBuDoc(AOwner:TComponent;DBHandle:TISC_DB_Handle;ActualDate:TDateTime;Mode:Integer;Id_user:Integer;PK_ID:Int64);
var f:Boolean;
    i:Integer;
begin
     f :=true;
     for i:=0 to Application.MainForm.MDIChildCount-1 do
     begin
         if (Application.MainForm.MDIChildren[i] is TfrmDocDetail)
         then begin
                   if (Application.MainForm.MDIChildren[i] as TfrmDocDetail).pk_id=pk_id
                   then begin
                             Application.MainForm.MDIChildren[i].BringToFront;
                             f:=false;
                   end;
         end;
     end;
     if f then TfrmDocDetail.Create(AOwner,DBHandle,ActualDate,Mode,Id_user,PK_ID);
end;

{$R *.dfm}
constructor TfrmDocDetail.Create(AOwner:TComponent;DBHandle:TISC_DB_Handle;ActualDate:TDateTime;Mode:Integer;Id_user:Integer;PK_ID:Int64);
  var SysDataSet,InfoDoc:TpFibDataset;
begin
     inherited Create(AOwner);
     WorkDatabase.Handle:=DBHandle;
     ReadTransaction.StartTransaction;
     self.PK_ID:=PK_ID;
     self.ActualDate:=ActualDate;
     self.Mode:=Mode;

     if (self.Mode=1) then CreateNewDoc;
     if (self.Mode=2) then LoadDataToBuffer;

     InfoDoc:=TpFibDataset.create(self);
     InfoDoc.Database:=WorkDatabase;
     InfoDoc.Transaction:=ReadTransaction;
     InfoDoc.SelectSQL.Text:=' SELECT * FROM BU_DOC_BUFFER_SELECT('+IntToStr(self.KEY_SESSION)+')';
     InfoDoc.Open;

     EdDocNum.Text                    := InfoDoc.FieldByName('NUM_DOC').AsString;
     EditDocDate.Date                 := InfoDoc.FieldByName('DATE_DOC').AsDateTime;
     EdDateProv.editValue             := InfoDoc.FieldByName('DATE_PROV').AsDateTime;
     EdSumma.Text                     := InfoDoc.FieldByName('SUMMA').AsString;
     EdComment.Lines.Text             := InfoDoc.FieldByName('NOTE').AsString;
     self.Caption                     :='Робота з документом  №'+InfoDoc.FieldByName('NUM_DOC').AsString+' від '+InfoDoc.FieldByName('DATE_DOC').AsString;

     InfoDoc.Close;
     InfoDoc.Free;

     ErrorProvDataSet.SelectSQL.Text :=' SELECT * FROM KERNEL_PROVS_ERRORS WHERE ID_PROV=:ID_PROV AND KEY_SESSION='+IntToStr(self.KEY_SESSION);

     ProvsDataSet.SelectSQL.Text     := 'SELECT * FROM BU_PROV_BUFFER_SELECT('+IntToStr(self.KEY_SESSION)+')';
     ProvsDataSet.Open;
end;


procedure TfrmDocDetail.LoadDataToBuffer;
var CP:TpFibStoredProc;
begin
     CP:=TpFibStoredProc.Create(self);
     CP.Database:=WorkDatabase;
     CP.Transaction:=WriteTransaction;
     CP.Transaction.StartTransaction;
     CP.StoredProcName:='MBOOK_LOAD_DATA_TO_BUFFER';
     CP.Prepare;
     CP.ParamByName('PK_ID').AsInt64:=self.PK_ID;
     CP.ExecProc;
     self.KEY_SESSION:=CP.ParamByName('KEY_SESSION').AsInt64;
     CP.Transaction.Commit;
     CP.Free;
end;

procedure TfrmDocDetail.CreateNewDoc;
var CP:TpFibStoredProc;
begin
     KEY_SESSION:=WorkDatabase.Gen_Id('KERNEL_GEN_ID_SESSION',1);
     CP:=TpFibStoredProc.Create(self);
     CP.Database:=WorkDatabase;
     CP.Transaction:=WriteTransaction;
     CP.Transaction.StartTransaction;
     CP.StoredProcName:='BU_CREATE_DOC';
     CP.Prepare;
     CP.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
     CP.ParamByName('ACTUAL_DATE').value:=self.ActualDate;
     CP.ParamByName('COMPUTER').Value:=GlobalSpr.GetComputerNetName;
     CP.ExecProc;
     PK_ID:=CP.ParamByName('PK_ID').AsInt64;
     CP.Transaction.Commit;
     CP.Free;
end;

procedure TfrmDocDetail.FormClose(Sender: TObject;
  var Action: TCloseAction);
var  CP:TpFibStoredProc;
begin
     CP:=TpFibStoredProc.Create(self);
     CP.Database:=WorkDatabase;
     CP.Transaction:=WriteTransaction;
     CP.Transaction.StartTransaction;
     CP.StoredProcName:='KERNEL_CLEAR_TMP';
     CP.Prepare;
     CP.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
     CP.ExecProc;
     CP.Transaction.Commit;
     CP.Free;
     Action:=caFree;
end;

procedure TfrmDocDetail.AddButtonClick(Sender: TObject);
var T:TfrmGetTemplate;
    CP:TpFibStoredProc;
    ID_PROV : Integer;
    DB_ID_SM,DB_ID_RZ,DB_ID_ST,
    KR_ID_SM,KR_ID_RZ,KR_ID_ST:Integer;
    CF:TfrmGetSmRzSt;
    InfoDoc:TpFibDataset;
begin
    DB_ID_SM:=-1;
    DB_ID_RZ:=-1;
    DB_ID_ST:=-1;
    KR_ID_SM:=-1;
    KR_ID_RZ:=-1;
    KR_ID_ST:=-1;
    T:=TfrmGetTemplate.Create(self);
    if T.ShowModal=mrYes
    then begin
               {Проверяем шаблон}
               if (TemplatesDataSet.FieldByName('ID_TEMPLATE').AsInteger<>-1)
               then begin
                         {Забираем данные согласно шаблону}
                         DB_ID_SM:=TemplatesDataSet.FieldByName('DB_ID_SM').Value;
                         DB_ID_RZ:=TemplatesDataSet.FieldByName('DB_ID_RZ').Value;
                         DB_ID_ST:=TemplatesDataSet.FieldByName('DB_ID_ST').Value;
                         KR_ID_SM:=TemplatesDataSet.FieldByName('KR_ID_SM').Value;
                         KR_ID_RZ:=TemplatesDataSet.FieldByName('KR_ID_RZ').Value;
                         KR_ID_ST:=TemplatesDataSet.FieldByName('KR_ID_ST').Value;
               end;

               CF:=TfrmGetSmRzSt.Create(self,DB_ID_SM,DB_ID_RZ,DB_ID_ST,KR_ID_SM,KR_ID_RZ,KR_ID_ST);
               CF.Caption:='Вибрати кошторис/розділ/статтю для проводки';
               if CF.ShowModal=mrYes
               then begin
                           CP:=TpFibStoredProc.Create(self);
                           CP.Database:=WorkDatabase;
                           CP.Transaction:=WriteTransaction;
                           CP.Transaction.StartTransaction;
                           CP.StoredProcName:='BU_CREATE_PROV';
                           CP.Prepare;
                           CP.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                           CP.ParamByName('DB_ID_SM').Value:=CF.DB_ID_SM;
                           CP.ParamByName('DB_ID_RZ').Value:=CF.DB_ID_RZ;
                           CP.ParamByName('DB_ID_ST').Value:=CF.DB_ID_ST;
                           CP.ParamByName('KR_ID_SM').Value:=CF.KR_ID_SM;
                           CP.ParamByName('KR_ID_RZ').Value:=CF.KR_ID_RZ;
                           CP.ParamByName('KR_ID_ST').Value:=CF.KR_ID_ST;
                           CP.ExecProc;
                           ID_PROV:=CP.ParamByName('ID_PROV').AsInteger;
                           CP.Transaction.Commit;
                           CP.Free;

                           ProvsDataSet.CloseOpen(true);
                           ProvsDataSet.Locate('ID_PROV',ID_PROV,[]);


                           InfoDoc:=TpFibDataset.create(self);
                           InfoDoc.Database:=WorkDatabase;
                           InfoDoc.Transaction:=ReadTransaction;
                           InfoDoc.SelectSQL.Text:=' SELECT * FROM BU_DOC_BUFFER_SELECT('+IntToStr(self.KEY_SESSION)+')';
                           InfoDoc.Open;

                           EdSumma.Text                     := InfoDoc.FieldByName('SUMMA').AsString;
                           InfoDoc.Close;
                           InfoDoc.Free;
               end;
               CF.Free;
    end;
    T.Free;
end;

procedure TfrmDocDetail.ToolButton3Click(Sender: TObject);
begin
    Close;
end;


procedure TfrmDocDetail.ToolButton4Click(Sender: TObject);
var ID_PROV:Integer;
    InfoDoc:TpFibDataset;
begin
     InfoDoc:=TpFibDataset.create(self);
     InfoDoc.Database:=WorkDatabase;
     InfoDoc.Transaction:=ReadTransaction;
     InfoDoc.SelectSQL.Text:=' SELECT * FROM BU_DOC_BUFFER_SELECT('+IntToStr(self.KEY_SESSION)+')';
     InfoDoc.Open;

     EdDocNum.Text                    := InfoDoc.FieldByName('NUM_DOC').AsString;
     EditDocDate.Date                 := InfoDoc.FieldByName('DATE_DOC').AsDateTime;
     EdDateProv.editValue             := InfoDoc.FieldByName('DATE_PROV').AsDateTime;
     EdSumma.Text                     := InfoDoc.FieldByName('SUMMA').AsString;
     EdComment.Lines.Text             := InfoDoc.FieldByName('NOTE').AsString;

     self.Caption                     :='Робота з документом  №'+InfoDoc.FieldByName('NUM_DOC').AsString+' від '+InfoDoc.FieldByName('DATE_DOC').AsString;

     InfoDoc.Close;
     InfoDoc.Free;

     ID_PROV:=0;
     if ProvsDataSet.RecordCount>0 then ID_PROV:=ProvsDataSet.FieldByName('ID_PROV').AsInteger;
     ProvsDataSet.CloseOpen(true);
     ProvsDataSet.Locate('ID_PROV',ID_PROV,[]);
end;

procedure TfrmDocDetail.ToolButton2Click(Sender: TObject);
var DoResult:Boolean;
    ErrorList:TStringList;
    i:Integer;
    UpdProc:TpFibStoredProc;
    STRU:KERNEL_MODE_STRUCTURE;
begin
     DoResult:=false;
     if (Mode=1)
     then begin
                 {Добавление нового документа}
                 UpdProc:=TpFibStoredProc.Create(self);
                 UpdProc.Database:=WorkDatabase;
                 UpdProc.Transaction:=WriteTransaction;
                 UpdProc.Transaction.StartTransaction;
                 UpdProc.StoredProcName:='MBOOK_UPDATE_DOC';
                 UpdProc.Prepare;
                 UpdProc.ParamByName('ID_TYPE_DOC').Value       :=998;
                 UpdProc.ParamByName('NUM_DOC').Value           :=EdDocNum.Text;
                 UpdProc.ParamByName('DATE_DOC').Value          :=EditDocDate.Date;
                 UpdProc.ParamByName('DATE_PROV').Value         :=EdDateProv.date;
                 UpdProc.ParamByName('ID_CUSTOMER').Value       :=NULL;
                 UpdProc.ParamByName('NOTE').Value              :=EdComment.Text;
                 UpdProc.ParamByName('FIO').Value               :=NULL;
                 UpdProc.ParamByName('ID_RATE_ACC').Value       :=NULL;
                 UpdProc.ParamByName('ID_RATE_ACC_NATIVE').Value:=NULL;
                 UpdProc.ParamByName('PRIHOD').AsInt64          :=0;
                 UpdProc.ParamByName('KEY_SESSION').AsInt64     :=KEY_SESSION;
                 UpdProc.ExecProc;
                 UpdProc.Transaction.Commit;
                 UpdProc.Free;

                 WriteTransaction.StartTransaction;
                 STRU.DBHANDLE      :=WorkDatabase.Handle;
                 STRU.TRHANDLE      :=WriteTransaction.Handle;
                 STRU.WORKDATE      :=ActualDate;
                 STRU.KERNEL_ACTION :=1;
                 STRU.KEY_SESSION   :=KEY_SESSION;
                 STRU.ID_USER       :=id_user;                 
                 ActionLog.Lines.Insert(0,'Проведення документу... '+TimeToStr(Time));
                 try
                     DoResult:=Kernel.KernelDo(@STRU);
                 except on E:Exception do
                     ShowMessage('Помилка ядра '+E.Message);
                 end;

                 if  DoResult
                 then begin
                        ActionLog.Lines.Insert(0,'Документ було проведено без помилок!');
                        Mode:=2;
                        ShowMessage('Документ було проведенно без помилок!');
                 end
                 else begin
                        tabSheet2.TabVisible:=true;
                        tabSheet3.TabVisible:=true;
                        PageControl1.ActivePage:=tabSheet2;
                        ActionLog.Lines.Clear;
                        ActionLog.Lines.Insert(0,'При проведенні документа виникли помилки');
                        ErrorList:=Kernel.GetDocErrorsList(@STRU);
                        if ErrorList<>nil then for i:=0 to  ErrorList.Count-1 do ActionLog.Lines.Insert(0,'ОШИБКА- '+ErrorList.Strings[i]);
                 end;
                 WriteTransaction.Commit;
                 ToolButton4Click(self);
     end
     else begin
                 UpdProc:=TpFibStoredProc.Create(self);
                 UpdProc.Database:=WorkDatabase;
                 UpdProc.Transaction:=WriteTransaction;
                 UpdProc.Transaction.StartTransaction;
                 UpdProc.StoredProcName:='MBOOK_UPDATE_DOC';
                 UpdProc.Prepare;
                 UpdProc.ParamByName('ID_TYPE_DOC').Value       :=998;
                 UpdProc.ParamByName('NUM_DOC').Value           :=EdDocNum.Text;
                 UpdProc.ParamByName('DATE_DOC').Value          :=EditDocDate.Date;
                 UpdProc.ParamByName('DATE_PROV').Value         :=EdDateProv.date;
                 UpdProc.ParamByName('ID_CUSTOMER').Value       :=NULL;
                 UpdProc.ParamByName('NOTE').Value              :=EdComment.Text;
                 UpdProc.ParamByName('FIO').Value               :=NULL;
                 UpdProc.ParamByName('ID_RATE_ACC').Value       :=NULL;
                 UpdProc.ParamByName('ID_RATE_ACC_NATIVE').Value:=NULL;
                 UpdProc.ParamByName('PRIHOD').AsInt64          :=0;
                 UpdProc.ParamByName('KEY_SESSION').AsInt64     :=KEY_SESSION;
                 UpdProc.ExecProc;
                 UpdProc.Transaction.Commit;
                 UpdProc.Free;

                 WriteTransaction.StartTransaction;
                 STRU.DBHANDLE      :=WorkDatabase.Handle;
                 STRU.TRHANDLE      :=WriteTransaction.Handle;
                 STRU.WORKDATE      :=ActualDate;
                 STRU.KERNEL_ACTION :=3;
                 STRU.PK_ID         :=self.pk_id;
                 STRU.KEY_SESSION   :=KEY_SESSION;
                 STRU.ID_USER       :=id_user;
                 ActionLog.Lines.Insert(0,'Проведення документу... '+TimeToStr(Time));
                 try
                     DoResult:=Kernel.KernelDo(@STRU);
                 except on E:Exception do
                     ShowMessage('Ошибка ядра '+E.Message);
                 end;
                 if  DoResult
                 then begin
                        ActionLog.Lines.Insert(0,'Документ було проведено без помилок!');
                        ShowMessage('Документ було проведено без помилок!');
                 end
                 else begin
                        tabSheet2.TabVisible:=true;
                        tabSheet3.TabVisible:=true;
                        PageControl1.ActivePage:=tabSheet2;
                        ActionLog.Lines.Clear;
                        ActionLog.Lines.Insert(0,'При проведенні документа виникли помилки');
                        ErrorList:=Kernel.GetDocErrorsListEx(@STRU);
                        if ErrorList<>nil then for i:=0 to  ErrorList.Count-1 do ActionLog.Lines.Insert(0,'ОШИБКА- '+ErrorList.Strings[i]);
                 end;
                 WriteTransaction.Commit;
                 ToolButton4Click(self);
     end;
end;


procedure TfrmDocDetail.UpdateSum;
var T:TfrmGetSum;
    ID_PROV:Integer;
    UpdProc:TpFibStoredProc;
begin
 if (ProvsDataSet.RecordCount>0)
 then begin
    T:=TfrmGetSum.Create(self);
    T.cxCalcEdit1.Value:=ProvsDataSet.FieldByName('SUMMA').AsFloat;
    if T.ShowModal=mrYes
    then begin
                 ID_PROV:=ProvsDataSet.FieldByName('ID_PROV').AsInteger;
                 UpdProc:=TpFibStoredProc.Create(self);
                 UpdProc.Database:=WorkDatabase;
                 UpdProc.Transaction:=WriteTransaction;
                 UpdProc.Transaction.StartTransaction;
                 UpdProc.StoredProcName:='MBOOK_UPDATE_PROV_INFO_EX';
                 UpdProc.Prepare;
                 UpdProc.ParamByName('SUMMA').Value:=T.cxCalcEdit1.Value;
                 UpdProc.ParamByName('SUMMA_VALUTE').Value:=0;
                 UpdProc.ParamByName('ID_VALUTE').Value:=NULL;
                 UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                 UpdProc.ParamByName('ID_PROV').AsInt64:=ID_PROV;
                 UpdProc.ExecProc;
                 UpdProc.Transaction.Commit;
                 UpdProc.Free;
                 ProvsDataSet.CloseOpen(true);
                 ProvsDataSet.Locate('ID_PROV',ID_PROV,[]);
    end;
    T.Free;
end;    
end;


procedure TfrmDocDetail.cxGrid1DBBandedTableView1DblClick(Sender: TObject);
begin
     UpdateSum;
end;

procedure TfrmDocDetail.DelButtonClick(Sender: TObject);
var  CP:TpFibStoredProc;
begin
if ProvsDataSet.RecordCount>0
then begin
   if BaseTypes.agMessageDlg('Увага!','Ви хочете видалити проводку з документа?',mtWarning,[mbYes,mbNo])=mrYes
   then begin
            CP:=TpFibStoredProc.Create(self);
            CP.Database:=WorkDatabase;
            CP.Transaction:=WriteTransaction;
            CP.Transaction.StartTransaction;
            CP.StoredProcName:='MBOOK_DELETE_PROV';
            CP.Prepare;
            CP.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
            CP.ParamByName('ID_PROV').AsInt64    :=ProvsDataSet.FieldByName('ID_PROV').Value;
            CP.ExecProc;
            CP.Transaction.Commit;
            CP.Free;
            ProvsDataSet.CacheDelete;
   end;
end;end;

procedure TfrmDocDetail.N1Click(Sender: TObject);
begin
     AddButton.OnClick(self);
end;

procedure TfrmDocDetail.N2Click(Sender: TObject);
begin
     DelButton.OnClick(self);
end;

procedure TfrmDocDetail.N4Click(Sender: TObject);
begin
     ToolButton4.OnClick(self);
end;

procedure TfrmDocDetail.N6Click(Sender: TObject);
begin
     ToolButton2.OnClick(self);
end;

procedure TfrmDocDetail.N8Click(Sender: TObject);
begin
     ToolButton3.OnClick(self);
end;

procedure TfrmDocDetail.ToolButton5Click(Sender: TObject);
var i:Integer;
    InsertStoredProc:TpFibStoredProc;
begin
     if OpenDialog1.Execute
     then begin
               if HalcyonDataSet1.Active then HalcyonDataSet1.Close;
               HalcyonDataSet1.DatabaseName:=ExtractFilePath(OpenDialog1.FileName);
               HalcyonDataSet1.TableName:=ExtractFileName(OpenDialog1.FileName);
               HalcyonDataSet1.Open;

               if HalcyonDataSet1.Active
               then begin
                         HalcyonDataSet1.First;

                         if (HalcyonDataSet1.RecordCount>0)
                         then begin
                                   InsertStoredProc:=TpFibStoredProc.Create(self);
                                   InsertStoredProc.Database:=WorkDatabase;
                                   InsertStoredProc.Transaction:=WriteTransaction;
                                   WriteTransaction.StartTransaction;

                                   //Добавление проводок
                                   InsertStoredProc.StoredProcName:='PUB_DT_ALL_PROV_BUFFER_INSERT_A';
                                   InsertStoredProc.Prepare;
                                   for i:=1 to HalcyonDataSet1.RecordCount do
                                   begin
                                        //Сохраняем информацию по проводке
                                        InsertStoredProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                                        InsertStoredProc.ParamByName('DATE_REG').Value     :=ActualDate;
                                        InsertStoredProc.ParamByName('CR_BY_DT').Value     :=0;
                                        InsertStoredProc.ParamByName('STORNO').Value       :=0;
                                        InsertStoredProc.ParamByName('KR_KOD_SM').Value    :=HalcyonDataSet1.FieldByName('KOD_SM').AsInteger;
                                        InsertStoredProc.ParamByName('KR_KOD_RAZ').Value   :=1000;
                                        InsertStoredProc.ParamByName('KR_KOD_ST').Value    :=1001;
                                        InsertStoredProc.ParamByName('DB_KOD_SM').Value    :=400;
                                        InsertStoredProc.ParamByName('DB_KOD_RAZ').Value   :=1000;
                                        InsertStoredProc.ParamByName('DB_KOD_ST').Value    :=1044;
                                        InsertStoredProc.ParamByName('SUMMA').Value        :=HalcyonDataSet1.FieldByName('FCARRY_SUM').Value;
                                        InsertStoredProc.ExecProc;

                                        HalcyonDataSet1.Next;
                                   end;
                                   WriteTransaction.Commit;
                                   InsertStoredProc.Free;
                         end;

               end;
     end;
end;

procedure TfrmDocDetail.ToolButton6Click(Sender: TObject);
begin
     if (ProvsDataSet.RecordCount>0)
     then begin
               //cxGrid1.BeginUpdate;
               frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+
                                       '\Reports\Mbook\ReportDocPrint.fr3',true);
               frxReport1.Variables['DOC_DATE']:=EditDocdate.Date;
               frxReport1.Variables['DATE_REG']:=EdDateProv.Date;
               frxReport1.Variables['DOC_PROV']:=EdDateProv.Date;
               frxReport1.Variables['SUMMA']   :=''''+EdSumma.Text+'''';
               frxReport1.Variables['DOC_NUM'] :=''''+EdDocNum.Text+'''';
               frxReport1.Variables['TYPE_DOC']:=''''+'Довідка по бюджетам(бюджетний облік)'+'''';
               frxReport1.Variables['DOC_NOTE']:=''''+EdComment.Text+'''';
               frxReport1.PrepareReport(true);
               //cxGrid1.EndUpdate;
               frxReport1.ShowPreparedReport;
     end;
end;

end.
