unit uSmetsContainer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxTextEdit, cxCheckBox, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet, Ibase, pFibStoredProc;

type
  TfrmGetSmForAnalize = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    WorkDatabase: TpFIBDatabase;
    GetInfoDataSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    cxStyleRepository1: TcxStyleRepository;
    back: TcxStyle;
    column_gray: TcxStyle;
    periods: TcxStyle;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    SilverStyle: TcxStyle;
    SmPeriodsDataSource: TDataSource;
    cxGrid3: TcxGrid;
    PeriodsView: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    IsDraft: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    Panel3: TPanel;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    WriteTransaction: TpFIBTransaction;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    KeySession:Int64;
    Localid_user:Int64;
    Constructor Create(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;id_user:int64);reintroduce;
  end;



implementation

uses GlobalSpr;


{$R *.dfm}

constructor TfrmGetSmForAnalize.Create(AOwner: TComponent;
  DBHandle: TISC_DB_HANDLE; id_user: int64);
begin
     inherited Create(AOwner);

     Localid_user:=id_user;
     WorkDatabase.Handle:=DBHandle;
     ReadTransaction.StartTransaction;

     KeySession:=WorkDatabase.Gen_Id('BU_SMET_CONTAINER_SESSION',1);

     GetInfoDataSet.SelectSQL.Text:=' SELECT * FROM BU_PLAN_CONTAINER_SELECT('+IntToStr(KeySession)+') ';
     GetInfoDataSet.Open;
end;

procedure TfrmGetSmForAnalize.cxButton1Click(Sender: TObject);
begin
     //Выводим отчте по сравнению вариантов бюджетов
     GlobalSpr.Wizard_GetPlanValuesReport(self,
                                          Workdatabase.Handle,
                                          KeySession,
                                          Date,
                                          Date,
                                          LocalId_user);
end;

procedure TfrmGetSmForAnalize.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmGetSmForAnalize.cxButton3Click(Sender: TObject);
var Res:Variant;
    Filter:TSmetaFilterValues;
    InsertSP:TpFibStoredProc;
begin
     Res:=NULL;
     Filter.DateFilter:=false;
     Filter.GroupFilter:=false;
     Filter.NOTEqual:=-1;
     Res:=GlobalSpr.WIZARD_GetPlan(Application.MainForm,
                      WorkDatabase.Handle,
                      fsNormal,
                      Date,
                      Filter,
                      LocalId_user);
     if (Res>0)
     then begin
               InsertSP            :=TpFibStoredProc.Create(self);
               InsertSP.Database   :=WorkDatabase;
               InsertSP.Transaction:=WriteTransaction;
               WriteTransaction.StartTransaction;
               InsertSP.StoredProcName:='BU_PLAN_CONTAINER_INSERT';
               InsertSP.Prepare;
               InsertSP.ParamByName('KEY_SESSION').AsInt64:=KeySession;
               InsertSP.ParamByName('ID_PLAN').asInt64    :=Res;
               InsertSP.ExecProc;
               InsertSP.Close;
               InsertSP.Free;
               WriteTransaction.Commit;

               GetInfoDataSet.CloseOpen(true);
     end;

end;

procedure TfrmGetSmForAnalize.FormDestroy(Sender: TObject);
var DropSP:TpFIBStoredProc;
begin
     DropSP:=TpFIBStoredProc.Create(self);
     DropSP.Database:=WorkDatabase;
     DropSP.Transaction:=WriteTransaction;
     WriteTransaction.StartTransaction;
     DropSP.StoredProcName:='BU_PLAN_CONTAINER_CLEAR';
     DropSP.ParamByName('KEY_SESSION').AsInt64:=self.KeySession;
     DropSP.ExecProc;
     DropSP.Close;
     DropSP.Free;
     WriteTransaction.Commit;
end;

procedure TfrmGetSmForAnalize.cxButton4Click(Sender: TObject);
var DropSP:TpFIBStoredProc;
begin
     if (GetInfoDataSet.RecordCount>0)
     then begin
               DropSP:=TpFIBStoredProc.Create(self);
               DropSP.Database:=WorkDatabase;
               DropSP.Transaction:=WriteTransaction;
               WriteTransaction.StartTransaction;
               DropSP.StoredProcName:='BU_PLAN_CONTAINER_DELETE';
               DropSP.ParamByName('KEY_SESSION').AsInt64:=self.KeySession;
               DropSP.ParamByName('ID_PLAN').AsInt64:=TFIBBCDField(GetInfoDataSet.FieldByName('ID_PLAN')).AsInt64;
               DropSP.ExecProc;
               DropSP.Close;
               DropSP.Free;
               WriteTransaction.Commit;
     end;
end;

end.
