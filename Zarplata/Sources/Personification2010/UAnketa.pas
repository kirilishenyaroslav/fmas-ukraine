unit UAnketa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase, ZProc, Dates, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxControls, cxGridCustomView, cxGrid, dxBar, dxBarExtItems,
  cxGridBandedTableView, cxClasses, FIBDataSet, pFIBDataSet, FIBDatabase,
  pFIBDatabase, pFibStoredProc;

type
  TfrmAnketaInfo = class(TForm)
    Styles: TcxStyleRepository;
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
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet;
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    checked: TdxBarLargeButton;
    DelReportBtn: TdxBarLargeButton;
    ExportBtn: TdxBarLargeButton;
    GroupBtn: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarButton2: TdxBarButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    Grid1: TcxGrid;
    Grid1DBTableView1: TcxGridDBTableView;
    Grid1DBTableView1DBColumn1: TcxGridDBColumn;
    Grid1ClNumReport: TcxGridDBColumn;
    grid1ClDateReport: TcxGridDBColumn;
    Grid1DBTableView1DBColumn2: TcxGridDBColumn;
    Grid1Level1: TcxGridLevel;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    AnketaDataSet: TpFIBDataSet;
    AnketaDataSource: TDataSource;
    Grid1DBTableView1DBColumn3: TcxGridDBColumn;
    DelAllReportBtn: TdxBarLargeButton;
    AddZpReportBtn: TdxBarLargeButton;
    Grid1DBTableView1DBColumn4: TcxGridDBColumn;
    procedure ExitBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure checkedClick(Sender: TObject);
    procedure DelReportBtnClick(Sender: TObject);
    procedure DelAllReportBtnClick(Sender: TObject);
    procedure AddZpReportBtnClick(Sender: TObject);
  private
    { Private declarations }
    FIdReport:Int64;
    FKodSetup:Integer;
    procedure GetData(id:Int64);
  public
    { Public declarations }
    constructor Create(AOwner:TComponent; DBhandle:TISC_DB_HANDLE; id_user:Int64; id_report:int64; kod_setup:Integer;RStatus:Integer );reintroduce;
  end;

implementation

{$R *.dfm}

uses UAnketaEdit;

{ TfrmAnketaInfo }

constructor TfrmAnketaInfo.Create(AOwner: TComponent;
  DBhandle: TISC_DB_HANDLE; id_user: Int64; id_report:Int64; kod_setup:Integer; RStatus:Integer);
begin
     inherited Create(AOwner);
     FIdReport:=id_report;
     FKodSetup:=kod_setup;
     self.Caption:=Self.Caption+' для звіту за період '+KodSetupToPeriod(kod_setup,1);
     self.Update;
     WorkDatabase.Handle:=DBhandle;
     ReadTransaction.StartTransaction;
     AnketaDataSet.SelectSQL.Text:='SELECT * FROM Z_PERSONIFICATION_ANKETA_SEL('+IntToStr(id_report)+')';
     AnketaDataSet.Open;
     Grid1DBTableView1.Controller.GridView.ViewData.Collapse(true);

     if (RStatus<>0)
     then begin
               //AddReportBtn.Enabled:=False;
               DelReportBtn.Enabled:=False;
               DelAllReportBtn.Enabled:=False;
               AddZpReportBtn.Enabled:=False;
     end;
end;

procedure TfrmAnketaInfo.ExitBtnClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmAnketaInfo.RefreshBtnClick(Sender: TObject);
begin
     if AnketaDataSet.RecordCount>0
     then GetData(AnketaDataSet.FieldByName('ID').value)
     else GetData(-1);
end;

procedure TfrmAnketaInfo.checkedClick(Sender: TObject);
var T:TfrmAnketaEdit;
    InsertSP:TpFibStoredProc;
    id:Int64;
begin
     T:=TfrmAnketaEdit.Create(self,now, WorkDatabase.Handle);
     if T.ShowModal=mrYes
     then begin
               InsertSP:=TpFibStoredProc.Create(self);
               InsertSP.Database   :=WorkDatabase;
               InsertSP.Transaction:=WriteTransaction;
               WriteTransaction.StartTransaction;
               InsertSP.StoredProcName:='Z_PERSONIFICATION_ANKETA_I2';
               InsertSP.Prepare;
               InsertSP.ParamByName('TIN').Value        :=T.TIN;
               InsertSP.ParamByName('ID_REPORT').asInt64:=FIdReport;
               InsertSP.ParamByName('KOD_SETUP').Value  :=Dates.ConvertDateToKod(T.cxDateEdit1.EditValue);
               InsertSP.ExecProc;

               id:=InsertSP.ParamByName('id').AsInt64;
               WriteTransaction.Commit;
               GetData(ID);
               InsertSP.Free;
     end;
     T.Free;
end;


procedure TfrmAnketaInfo.GetData(id: Int64);
begin
     Grid1.BeginUpdate;
     if id<>-1 then Grid1DBTableView1.Controller.GridView.ViewData.Expand(true);
     AnketaDataSet.CloseOpen(false);
     AnketaDataSet.Locate('ID',id,[]);
     Grid1.EndUpdate;
end;

procedure TfrmAnketaInfo.DelReportBtnClick(Sender: TObject);
var DeleteSp:TpFIBStoredProc;
begin
     if AnketaDataSet.RecordCount>0
     then begin
               if Application.MessageBox('Ви хочете видалити анкету?', 'Увага!', MB_YESNO + MB_ICONQUESTION) = IDYES
               then begin
                         DeleteSp:=TpFIBStoredProc.Create(self);
                         DeleteSp.Database:=WorkDatabase;
                         DeleteSp.Transaction:=WriteTransaction;
                         WriteTransaction.StartTransaction;
                         DeleteSp.StoredProcName:='Z_PERSONIFICATION_ANKETA_DEL';
                         DeleteSp.Prepare;
                         DeleteSp.ParamByName('ID').Value:=AnketaDataSet.FieldByName('ID').Value;
                         DeleteSp.ExecProc;
                         WriteTransaction.Commit;
                         DeleteSp.Free;
                         AnketaDataSet.CacheDelete;
               end;
     end;
end;

procedure TfrmAnketaInfo.DelAllReportBtnClick(Sender: TObject);
var DeleteSp:TpFIBStoredProc;
begin
     if (AnketaDataSet.RecordCount>0)
     then begin
               if Application.MessageBox('Ви хочете видалити всі анкети?', 'Увага!', MB_YESNO + MB_ICONQUESTION) = IDYES
               then begin
                         DeleteSp:=TpFIBStoredProc.Create(self);
                         DeleteSp.Database:=WorkDatabase;
                         DeleteSp.Transaction:=WriteTransaction;
                         WriteTransaction.StartTransaction;
                         DeleteSp.StoredProcName:='Z_PERSONIFICATION_ANKETA_DEL2';
                         DeleteSp.Prepare;
                         DeleteSp.ParamByName('ID_REPORT').AsInt64:=FIdReport;
                         DeleteSp.ExecProc;
                         WriteTransaction.Commit;
                         DeleteSp.Free;
                         GetData(-1);
               end;
     end;
end;

procedure TfrmAnketaInfo.AddZpReportBtnClick(Sender: TObject);
var DeleteSp:TpFIBStoredProc;
    T:TfrmAnketaEdit;
begin
     if Application.MessageBox('Ви хочете оновити анкети на базі розрахунку ЗП?', 'Увага!', MB_YESNO + MB_ICONQUESTION) = IDYES
     then begin
               T:=TfrmAnketaEdit.Create(self,now, WorkDatabase.Handle);
               T.Label1.Enabled       :=False;
               T.cxTextEdit1.Enabled  :=False;
               T.cxButtonEdit1.Enabled:=False;
               T.TINText.Enabled      :=False;
               if T.ShowModal=mrYes
               then begin
                         DeleteSp:=TpFIBStoredProc.Create(self);
                         DeleteSp.Database:=WorkDatabase;
                         DeleteSp.Transaction:=WriteTransaction;
                         WriteTransaction.StartTransaction;
                         DeleteSp.StoredProcName:='Z_PERSONIFICATION_ANKETA_UPDATE';
                         DeleteSp.Prepare;
                         DeleteSp.ParamByName('ID_REPORT').AsInt64:=FIdReport;
                         DeleteSp.ParamByName('KOD_SETUP_IN').Value:=ConvertDateToKod(T.cxDateEdit1.Date);

                         Screen.Cursor:=crHourGlass;
                         DeleteSp.ExecProc;
                         WriteTransaction.Commit;
                         Screen.Cursor:=crDefault;                         
                         DeleteSp.Free;
                         GetData(-1);
                end;
     end;
end;

end.
