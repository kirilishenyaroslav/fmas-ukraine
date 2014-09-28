unit mainWorkRemnants;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, cxTextEdit,
  cxCurrencyEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  ExtCtrls, dxBar, dxBarExtItems, cxButtonEdit, JO5_Types,PackageLoad,IBase,Jo5_RemnantsDM,
  cxGridBandedTableView, cxLookAndFeelPainters, StdCtrls, cxButtons,Jo5_PackageLoad,
  Jo5_PackageConst, dxStatusBar, cxSplitter,BaseTypes;

type
  TFMainWorkRemnants = class(TForm)
    dxBarManager1: TdxBarManager;
    dxBarLargeButton1: TdxBarLargeButton;
    ButtonEdit: TdxBarLargeButton;
    ButtonDelete: TdxBarLargeButton;
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
    GridMain: TcxGrid;
    GridMainDBTableView1: TcxGridDBTableView;
    GridMainUser: TcxGridDBColumn;
    GridMainComent: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    GridMainDate: TcxGridDBColumn;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    ButtonSee: TdxBarLargeButton;
    dxStatusBar1: TdxStatusBar;
    dxBarLargeButton2: TdxBarLargeButton;
    GridSumm: TcxGridDBColumn;
    Panel3: TPanel;
    GridSaldoMain: TcxGrid;
    GridSaldoMainDBTableView1: TcxGridDBTableView;
    GridSaldo: TcxGridDBColumn;
    GridDate: TcxGridDBColumn;
    GridSchNumber: TcxGridDBColumn;
    GridRazdNum: TcxGridDBColumn;
    GridStatNum: TcxGridDBColumn;
    GridSmetaKod: TcxGridDBColumn;
    GridKekvKod: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    Splitter3: TcxSplitter;
    dxBarLargeButton3: TdxBarLargeButton;
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure dxBarLargeButton5Click(Sender: TObject);
    procedure ButtonDeleteClick(Sender: TObject);
    procedure ButtonEditClick(Sender: TObject);
    procedure ButtonSeeClick(Sender: TObject);
    procedure GridMainDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure GridMainDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure dxBarLargeButton3Click(Sender: TObject);

  private
    { Private declarations }
    PRes:Variant;
    DM:TDM;
  public
    User:TJo5AccessResult;
    id_system:Integer;
    property Res:Variant read PRes;
    constructor Create(a:TJo5Object);reintroduce;
  end;


  function Viev_Jo5_WorkRemnants(AParameter:TObject):Variant;stdcall;
  exports Viev_Jo5_WorkRemnants;

implementation



{$R *.dfm}
//******************************************************************************
function Viev_Jo5_WorkRemnants(AParameter:TObject):Variant;stdcall;
var Form:TFMainWorkRemnants;
begin

  Form:=TFMainWorkRemnants.Create(TJo5Object(AParameter));


end;
//******************************************************************************
constructor TFMainWorkRemnants.Create(a:TJo5Object);
begin

  inherited Create(a.Owner);
        Show;
  id_system:=a.id_system;
  Dm:=TDM.create(self);

  Dm.DB.Handle:=a.Db_Handle;
  User:=a.User;
  dm.DSetMain.SQLs.SelectSQL.Text:=
  'SELECT * FROM JO5_DOC_MAIN_S('+inttostr(a.id_system)+')';

  dm.DSetMain.Open;

  if dm.DSetMain['ID_DOC']<>null then
  begin
    dm.DSet2.SQLs.SelectSQL.Text:=
    'SELECT * FROM JO5_Saldo_Doc_S('+inttostr(dm.DSetMain['ID_DOC'])+','+inttostr(a.id_system)+')';
    dm.DSet2.Open;
  end;
  DM.DSourceMain.DataSet:=DM.DSetMain;
  if dm.DSetMain.RecordCount=0 then
  begin
    ButtonDelete.Enabled:=false;
    ButtonEdit.Enabled:=false;
    ButtonSee.Enabled:=false;
  end;

end;


//******************************************************************************
procedure TFMainWorkRemnants.dxBarLargeButton1Click(Sender: TObject);
var Parameter:TJo5Object;
    id_doc:variant;
begin
Parameter := TJo5Object.Create;
Parameter.DB_Handle := DM.DB.Handle;
Parameter.Owner := self;
Parameter.id:=Null;
Parameter.id_system:=id_system;
Parameter.User:=User;
id_doc:=DoFunctionFromPackage(Parameter,Bpl_Jo5_Saldo);
if id_doc<>null then
begin

  dm.DSetMain.SQLs.RefreshSQL.Text:= 'SELECT * FROM JO5_DOC_MAIN_S_BY_KEY('+inttostr(id_doc)+','+inttostr(id_system)+')';
  dm.DSetMain.SQLs.insertSQL.Text := 'execute procedure z_empty_proc';
  dm.DSetMain.insert;
  dm.DSetMain.Post;
  dm.TransactionWrite.CommitRetaining;
  dm.DSet2.Close;
  if dm.DSetMain['ID_DOC'] <>null then
  begin
  dm.DSet2.SQLs.SelectSQL.Text:=
  'SELECT * FROM JO5_Saldo_Doc_S('+inttostr(dm.DSetMain['ID_DOC'])+','+inttostr(id_system)+') order by DATE_PERIOD';
  dm.DSet2.Open;
  end;
end
else
if Parameter.id<>null then
begin
dm.StProc.Transaction.Active:=true;
dm.StProc.StoredProcName:='JO5_DOC_MAIN_D';
dm.StProc.Prepare;
dm.StProc.ParamByName('id_doc').asinteger:=Parameter.id;
dm.StProc.ExecProc;
DM.StProc.Transaction.Commit;
dm.DSet2.Close;
if dm.DSetMain['ID_DOC'] <>null then
begin
  dm.DSet2.SQLs.SelectSQL.Text:=
  'SELECT * FROM JO5_Saldo_Doc_S('+inttostr(dm.DSetMain['ID_DOC'])+','+inttostr(id_system)+') order by DATE_PERIOD';
  dm.DSet2.Open;
end;
end;
Parameter.Destroy;
end;
//******************************************************************************
procedure TFMainWorkRemnants.dxBarLargeButton5Click(Sender: TObject);
begin
ModalResult:=mrCancel;
Close;
end;

procedure TFMainWorkRemnants.ButtonDeleteClick(Sender: TObject);
begin
if  BaseTypes.agMessageDlg('Увага!','Ви хочете видалити документ?',mtWarning,[mbYes,mbNo])=mrYes then
        begin
          dm.DSetMain.SQLs.DeleteSQL.Text:=
          'EXECUTE PROCEDURE JO5_DOC_MAIN_D('+inttostr(dm.DSetMain['id_doc'])+')';
          DM.DSetmAIN.DELETE;
          dm.TransactionWrite.Commit;
dm.DSet2.Close;
if dm.DSetMain['ID_DOC'] <>null then
begin
  dm.DSet2.SQLs.SelectSQL.Text:=
  'SELECT * FROM JO5_Saldo_Doc_S('+inttostr(dm.DSetMain['ID_DOC'])+','+inttostr(id_system)+') order by DATE_PERIOD';
  dm.DSet2.Open;
end;
        end;
  end;

//******************************************************************************
procedure TFMainWorkRemnants.ButtonEditClick(Sender: TObject);
var Parameter:TJo5Object;
    id_doc:variant;
begin
Parameter := TJo5Object.Create;
Parameter.DB_Handle := DM.DB.Handle;
Parameter.Owner := self;
Parameter.id:=DM.DSetMain['id_doc'];
Parameter.koment:=DM.DSetMain['coment'];
Parameter.User:=User;
Parameter.id_system:=id_system;
id_doc:=DoFunctionFromPackage(Parameter,Bpl_Jo5_Saldo);
if id_doc<>null then
begin
  dm.DSetMain.SQLs.RefreshSQL.Text:= 'SELECT * FROM JO5_DOC_MAIN_S_BY_KEY('+inttostr(id_doc)+','+inttostr(id_system)+')';
  dm.DSetMain.SQLs.UpdateSQL.Text := 'execute procedure z_empty_proc';
  dm.DSetMain.Edit;
  dm.DSetMain.Post;
  dm.DSet2.Close;
  dm.DSet2.SQLs.SelectSQL.Text:=
  'SELECT * FROM JO5_Saldo_Doc_S('+inttostr(dm.DSetMain['ID_DOC'])+','+inttostr(id_system)+') order by DATE_PERIOD';
  dm.DSet2.Open;
end
else
begin
dm.DSetMain.SQLs.DeleteSQL.Text:=
          'EXECUTE PROCEDURE JO5_DOC_MAIN_D('+inttostr(Parameter.id)+')';
          DM.DSetmAIN.DELETE;
          dm.TransactionWrite.Commit;
dm.DSet2.Close;
if dm.DSetMain['ID_DOC'] <>null then
begin
  dm.DSet2.SQLs.SelectSQL.Text:=
  'SELECT * FROM JO5_Saldo_Doc_S('+inttostr(dm.DSetMain['ID_DOC'])+','+inttostr(id_system)+') order by DATE_PERIOD';
  dm.DSet2.Open;
end;
end;

Parameter.Destroy;
end;
//******************************************************************************
procedure TFMainWorkRemnants.ButtonSeeClick(Sender: TObject);
var Parameter:TJo5Object;
begin
Parameter := TJo5Object.Create;
Parameter.DB_Handle := DM.DB.Handle;
Parameter.Owner := self;
Parameter.id:=DM.DSetMain['id_doc'];
Parameter.id_system:=id_system;
Parameter.koment:=DM.DSetMain['coment'];;
Parameter.User.User_Fio:=DM.DSetMain['FULL_NAME'];
Parameter.User.ID_User:=DM.DSetMain['ID_USER'];
Parameter.FormType:='Просмотр';
DoFunctionFromPackage(Parameter,Bpl_Jo5_Saldo);
Parameter.Destroy;
end;
//******************************************************************************
procedure TFMainWorkRemnants.GridMainDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if dm.DSetMain.RecordCount=0 then
begin
  ButtonDelete.Enabled:=false;
  ButtonEdit.Enabled:=false;
  ButtonSee.Enabled:=false;
end
else
begin
  ButtonDelete.Enabled:=true;
  ButtonEdit.Enabled:=true;
  ButtonSee.Enabled:=true;
end;

if dm.DSetMain.RecordCount<>0 then
begin

end;

end;
//******************************************************************************
procedure TFMainWorkRemnants.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
dm.DefaultTransaction.Commit;
    Action:=caFree
end;

procedure TFMainWorkRemnants.dxBarLargeButton2Click(Sender: TObject);
begin
Dm.DSetMain.CloseOpen(true);
dm.DSet2.Close;
if dm.DSetMain['ID_DOC'] <>null then
begin
  dm.DSet2.SQLs.SelectSQL.Text:=
  'SELECT * FROM JO5_Saldo_Doc_S('+inttostr(dm.DSetMain['ID_DOC'])+','+inttostr(id_system)+') order by DATE_PERIOD';
  dm.DSet2.Open;
end;
end;

procedure TFMainWorkRemnants.GridMainDBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
dm.DSet2.Close;
if dm.DSetMain['ID_DOC'] <>null then
begin
  dm.DSet2.SQLs.SelectSQL.Text:=
  'SELECT * FROM JO5_Saldo_Doc_S('+inttostr(dm.DSetMain['ID_DOC'])+','+inttostr(id_system)+') order by DATE_PERIOD';
  dm.DSet2.Open;
end;
end;

procedure TFMainWorkRemnants.dxBarLargeButton3Click(Sender: TObject);
const ReportName='Reports\JO5\JO5_DOC_Remn';
var
  FileName : String;
begin
if Dm.DSetMain['id_doc']=null then
ShowMessage('Документ поржній')
else
begin
Dm.pFIBDataSet2.close;
Dm.pFIBDataSet2.SQLs.SelectSQL.Text:='SELECT * FROM JO5_Saldo_Doc_S('+
inttostr(Dm.DSetMain['id_doc'])+','+inttostr(id_system)+')';
Dm.pFIBDataSet2.open;
FileName:=ExtractFilePath(Application.ExeName)+ReportName+'.fr3';
  if FileExists(FileName) then
    begin
			DM.frxReport1.LoadFromFile(FileName,True);
     //  Dm.frxReport1.DesignReport;
                        Dm.frxReport1.ShowReport;
    end;
end;
end;

end.
