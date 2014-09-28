unit Jo5_mainSaldo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,Jo5_Types, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxControls,
  cxGridCustomView, cxGrid, cxGridBandedTableView, cxClasses, dxBar,Jo5_SaldoDM,
  dxBarExtItems,Ibase, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxGroupBox, ExtCtrls, cxMemo, cxContainer,BaseTypes, dxStatusBar;



type
  TfmMainSaldo = class(TForm)
    dxBarManager1: TdxBarManager;
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
    ButtonInsert: TdxBarLargeButton;
    ButtonEdit: TdxBarLargeButton;
    ButtonDelete: TdxBarLargeButton;
    Panel: TPanel;
    Bevel1: TBevel;
    Label6: TLabel;
    Label5: TLabel;
    MainPanel: TPanel;
    dxBarDockControl1: TdxBarDockControl;
    EditFio: TcxTextEdit;
    KomentMemo: TcxMemo;
    Panel2: TPanel;
    St_Label: TLabel;
    Label17: TLabel;
    Label16: TLabel;
    R_Label: TLabel;
    S_Label: TLabel;
    Label15: TLabel;
    Label4: TLabel;
    Sch_Label: TLabel;
    Label7: TLabel;
    Kekv_Label: TLabel;
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
    dxBarLargeButton2: TdxBarLargeButton;
    ButtonExit: TcxButton;
    ButtonOK: TcxButton;
    dxStatusBar1: TdxStatusBar;
    procedure ButtonInsertClick(Sender: TObject);
    procedure ButtonEditClick(Sender: TObject);
   procedure GridSaldoMainDBTableView1CellClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);

    procedure ButtonOkClick(Sender: TObject);
    procedure ButtonDeleteClick(Sender: TObject);
    procedure ButtonExitClick(Sender: TObject);
    procedure GridSaldoMainDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
   
    procedure GridSaldoMainDBTableView1KeyPress(Sender: TObject;
      var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
  id:variant;
  id_system:integer;
  User:TJo5AccessResult;
  FormStyle:string;
  constructor Create (Param:TJo5Object);reintroduce;
  end;

function Viev_Jo5_Saldo (AParameter:TObject):Variant;stdcall;
exports Viev_Jo5_Saldo;

implementation
 uses Jo5_Edit, FIBQuery;
//******************************************************************************
function Viev_Jo5_Saldo (AParameter:TObject):Variant;stdcall;
var Form:TfmMainSaldo;
begin

 Form:=TfmMainSaldo.Create(TJo5Object(AParameter));//(TgrCtrlSimpleParam(AParameter).Owner);

 Result :=  Form.ShowModal;
   TJo5Object(AParameter).id:=Form.id;
 if Result=mrYes then    Result:=Form.id
else  Result:=NULL;
 Form.Destroy;
end;
//******************************************************************************
constructor TfmMainSaldo.Create(Param:TJo5Object);
begin
 inherited create(Param.Owner);
 id:=Param.id;
 id_system:=Param.Id_system;
 User:=Param.User;
 FormStyle:=Param.FormType;
 KomentMemo.Text:=param.Koment;
 DM:=TDM.Create(self);
 Dm.DB.Handle:=Param.Db_Handle;
 if id<>null
 then
 dm.DSetMain.SQLs.SelectSQL.Text:=
 'SELECT * FROM JO5_Saldo_Doc_S('+inttostr(id)+','+inttostr(id_system)+') order by DATE_PERIOD'
 else
 dm.DSetMain.SQLs.SelectSQL.Text:=
 'SELECT * FROM JO5_Saldo_Doc_S(-999999'+','+inttostr(id_system)+') order by DATE_PERIOD';


  dm.DSetMain.Open;
  if dm.DSetMain.RecordCount=0 then
  begin
    ButtonDelete.Enabled:=false;
    ButtonEdit.Enabled:=false;
  end;
 WITH DM do
 begin
  if dm.DSetMain['Sch_title']<>null then
  Sch_Label.Caption :=DSetMain['Sch_title'];
  if dm.DSetMain['Smet_title']<>null then
  S_Label.Caption   :=DSetMain['Smet_title'];
  if dm.DSetMain['razd_title']<>null then
  R_Label.Caption   :=DSetMain['razd_title'];
  if dm.DSetMain['stat_title']<>null then
  St_Label.Caption  :=DSetMain['stat_title'];
  if dm.DSetMain['kekv_title']<>null then
  Kekv_Label.Caption:=DSetMain['kekv_title'];
 end;



 DM.DSourceMain.DataSet:=DM.DSetMain;
 GridSaldoMainDBTableView1.DataController.DataSource:=DM.DSourceMain;
 EditFio.Text:=user.User_Fio;

if Param.FormType='Просмотр' then
begin
  ButtonDelete.Enabled:=false;
  ButtonEdit.Enabled:=false;
  ButtonInsert.Enabled:=false;
  ButtonOK.Visible:=false;
  KomentMemo.Enabled:=false;
  Caption:=Caption+'(Режим перегляду)';
end
else  Caption:=Caption+'(Режим редагування)';

end;
{$R *.dfm}
//******************************************************************************
procedure TfmMainSaldo.ButtonInsertClick(Sender: TObject);
var Param:TJo5ObjectSaldo;
   id_saldo:variant;
begin
Param:=TJo5ObjectSaldo.create;
Param.Owner:=self;
Param.DB_Handle:=DM.DB.Handle;
Param.id_doc:=id;
Param.id_saldo:=null;
Param.id_razd:=null;
Param.id_stat:=null;
Param.id_smeta:=null;
Param.id_system:=id_system;
Param.koment:=komentMemo.text;
Param.User:=user;
id_saldo:=ShowEditForm(Param);
id:=param.ID_doc;
if id_saldo<>null then
if not dm.DSetMain.Active then
begin
  dm.DSetMain.SQLs.SelectSQL.Text:=
  'SELECT * FROM JO5_Saldo_Doc_S('+inttostr(Param.ID_doc)+','+inttostr(id_system)+')order by DATE_PERIOD';
  dm.DSetMain.Open;
END
ELSE
BEGIN
dm.DSetMain.SQLs.RefreshSQL.Text:= 'SELECT * FROM JO5_SALDO_DOC_S_BY_KEY('+inttostr(Param.ID_doc)+','+IntToStr(id_saldo)+')';
dm.DSetMain.SQLs.InsertSQL.Text := 'execute procedure z_empty_proc';
dm.DSetMain.insert;
dm.DSetMain.Post;
END;
Param.Destroy;
end;
//******************************************************************************
procedure TfmMainSaldo.ButtonEditClick(Sender: TObject);
var Param:TJo5ObjectSaldo;
id_saldo:variant;
begin
 Param:=TJo5ObjectSaldo.create;
Param.Owner:=self;
Param.DB_Handle:=DM.DB.Handle;
Param.id_doc:=id;
Param.id_system:=id_system;
Param.id_saldo:=dm.DSetMain['id_saldo'];

if dm.DSetMain['id_smet']<>null then     Param.id_smeta:=dm.DSetMain['id_smet'];
if dm.DSetMain['SMET_title']<>null then  Param.smet_title:=dm.DSetMain['SMET_title'];
if dm.DSetMain['SMETA_KOD']<>null then   Param.smet_kod:=dm.DSetMain['SMETA_KOD'];
if dm.DSetMain['id_sch']<>null then      Param.id_sch:= dm.DSetMain['id_sch'];
if dm.DSetMain['SCH_NUMBER']<>null then  Param.sch_num:= dm.DSetMain['SCH_NUMBER'];
if dm.DSetMain['SCH_title']<>null then   Param.sch_title:= dm.DSetMain['SCH_title'];
if dm.DSetMain['id_stat']<>null then     Param.id_sTAT:= dm.DSetMain['id_stat'];
if dm.DSetMain['STAT_NUM']<>null then    Param.stat_num:=dm.DSetMain['STAT_NUM'];
if dm.DSetMain['STAT_title']<>null then  Param.stat_title:=dm.DSetMain['STAT_title'];
if dm.DSetMain['id_razd']<>null then     Param.id_razd:= dm.DSetMain['id_razd'];
if dm.DSetMain['RAZD_NUM']<>null then    Param.razd_num:=dm.DSetMain['RAZD_NUM'];
if dm.DSetMain['RAZD_title']<>null then  Param.razd_title:=dm.DSetMain['RAZD_title'];
if dm.DSetMain['id_kekv']<>null then     Param.id_kekv:= dm.DSetMain['id_kekv'];
if dm.DSetMain['KEKV_KODE']<>null then   Param.kekv_kod:=dm.DSetMain['KEKV_KODE'];
if dm.DSetMain['KEKV_title']<>null then  Param.kekv_title:=dm.DSetMain['KEKV_title'];


Param.saldo:=dm.DSetMain['SALDO'];
id_saldo:=ShowEditForm(Param);
if id_saldo<>null then
begin
  dm.DSetMain.SQLs.RefreshSQL.Text:= 'SELECT * FROM JO5_SALDO_DOC_S_BY_KEY('+inttostr(id)+','+IntToStr(id_saldo)+')';
  dm.DSetMain.SQLs.updateSQL.Text := 'execute procedure z_empty_proc';
  dm.DSetMain.Edit;
  dm.DSetMain.Post;
end;
Param.Destroy;
end;
//******************************************************************************
procedure TfmMainSaldo.GridSaldoMainDBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
WITH DM do
begin
  if dm.DSetMain['Sch_title']<>null then
  Sch_Label.Caption :=DSetMain['Sch_title'];
  if dm.DSetMain['Smet_title']<>null then
  S_Label.Caption   :=DSetMain['Smet_title'];
  if dm.DSetMain['razd_title']<>null then
  R_Label.Caption   :=DSetMain['razd_title'];
  if dm.DSetMain['stat_title']<>null then
  St_Label.Caption  :=DSetMain['stat_title'];
  if dm.DSetMain['kekv_title']<>null then
  Kekv_Label.Caption:=DSetMain['kekv_title'];
end;
end;
//******************************************************************************

//******************************************************************************
procedure TfmMainSaldo.ButtonOkClick(Sender: TObject);
begin
WITH DM.StProc DO
BEGIN


      if dm.DSetMain.RecordCount=0 then
      begin
        ShowMessage('Треба додати сальдо');
        exit
      end
  else
  begin
    Transaction.Active:=true;
    StoredProcName:='JO5_DOC_U';
    Prepare;
    ParamByName('coment').AsString:=KomentMemo.text;
    ParamByName('id_user').AsInteger:=User.ID_User;
    ParamByName('id_doc').AsInteger:= ID;
    ParamByName('ID_SYSTEM').asinteger:=id_system;
    
    ExecProc;
  end;
  Transaction.commit;
end;
modalresult:=mrYes;

end;
//******************************************************************************
procedure TfmMainSaldo.ButtonDeleteClick(Sender: TObject);
begin
if  BaseTypes.agMessageDlg('Увага!','Ви хочете видалити залишок?',mtWarning,[mbYes,mbNo])=mrYes then
        begin
          dm.DSetMain.SQLs.DeleteSQL.Text:=
          'EXECUTE PROCEDURE JO5_saldo_D('+inttostr(dm.DSetMain['id_saldo'])+')';
          DM.DSetmAIN.DELETE;
          Dm.TransactionWrite.commit;
        end;
  end;

//******************************************************************************
procedure TfmMainSaldo.ButtonExitClick(Sender: TObject);
begin
WITH DM.StProc DO


if (id<>null) and (dm.DSetMain.RecordCount=0) then

begin
   if BaseTypes.agMessageDlg('Увага!','Документ буде видаленим?',mtWarning,[mbYes,mbNo])=mrYes then
        begin

        modalresult:=mrNo;
        end;
end
else  modalresult:=mrYes;



end;
//******************************************************************************
procedure TfmMainSaldo.GridSaldoMainDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
 if dm.DSetMain.RecordCount=0 then
  begin
    ButtonDelete.Enabled:=false;
    ButtonEdit.Enabled:=false;
  end
 else
    if FormStyle<>'Просмотр' then
    begin
      ButtonDelete.Enabled:=true;
      ButtonEdit.Enabled:=true;
    end;
end;
//******************************************************************************
procedure TfmMainSaldo.GridSaldoMainDBTableView1KeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #13 then
    begin
      Key := #0;
      ButtonOkClick(Sender);
    end;
  if getasynckeystate(27)<>0 then ButtonExitClick(sender);
end;

procedure TfmMainSaldo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
WITH DM.StProc DO


if (id<>null) and (dm.DSetMain.RecordCount=0) then

begin
   if BaseTypes.agMessageDlg('Увага!','Документ буде видаленим?',mtWarning,[mbYes,mbNo])=mrYes then
        begin

        modalresult:=mrNo;
        end;
end
else  modalresult:=mrYes;

end;

end.
