unit uRegardsFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView, EditControl,
  cxGridDBTableView, cxGrid, uRegardsDataModule, Buttons, ExtCtrls,
  ActnList, ComCtrls, FieldControl, SpComboBox, uCommonSp, SpCommon, Mask,
  CheckEditUnit, cxContainer, cxLabel, cxDBLabel, uRegardsAdd, uFormControl,
  DBCtrls, UpKernelUnit, FIBQuery, pFIBQuery, pFIBStoredProc, cxTextEdit, iBase;

type
  TfmPCardRegardsPage = class(TFrame)
    Panel11: TPanel;
    SB_AddRegards: TSpeedButton;
    ALRegards: TActionList;
    AddRegardsA: TAction;
    ModifRegardsA: TAction;
    RegardsGridDBTableView1: TcxGridDBTableView;
    RegardsGridLevel1: TcxGridLevel;
    RegardsGrid: TcxGrid;
    cxStyleRepository1: TcxStyleRepository;
    SB_DelRegards: TSpeedButton;
    DS_Regards: TDataSource;
    RegardsGridDBTableView1DBColumn1: TcxGridDBColumn;
    RegardsGridDBTableView1DBColumn2: TcxGridDBColumn;
    RegardsGridDBTableView1DBColumn3: TcxGridDBColumn;
    RegardsGridDBTableView1DBColumn4: TcxGridDBColumn;
    RegardsGridDBTableView1DBColumn5: TcxGridDBColumn;
    RegardsGridDBTableView1DBColumn6: TcxGridDBColumn;
    Panel1: TPanel;
    Panel2: TPanel;
    DelRegardsA: TAction;
    SB_ModifRegards: TSpeedButton;
    lblSpec: TLabel;
    SpecName: TDBText;
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
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    RegardsGridDBTableView1DBColumn7: TcxGridDBColumn;
    RegardsGridDBTableView1DBColumn8: TcxGridDBColumn;
    TemaDis: TDBText;
    lblThemeDis: TLabel;
    lblShifr: TLabel;
    NumShifr: TDBText;
    procedure AddRegardsAExecute(Sender: TObject);
    procedure DelRegardsAExecute(Sender: TObject);
    procedure FrameExit(Sender: TObject);
    procedure FrameEnter(Sender: TObject);
    procedure RegardsGridDBTableView1KeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure RegardsGridFocusedViewChanged(Sender: TcxCustomGrid;
      APrevFocusedView, AFocusedView: TcxCustomGridView);
    procedure SB_ModifRegardsClick(Sender: TObject);
  private
    { Private declarations }
  public
    DM:TdmRegards;
    id_pcard:integer;
    DmHandle:integer;
    constructor Create(AOwner: TComponent; Dmod:TdmRegards; Id_PC: Integer; modify :integer; Handle:Integer); reintroduce;
    procedure DSetCloseOpen;
  end;

implementation

uses FIBDatabase, uFControl, cxCalendar;

{$R *.dfm}

constructor TfmPCardRegardsPage.Create(AOwner: TComponent; Dmod:TdmRegards; Id_PC: Integer; modify :integer; Handle:Integer);
begin
  try
    inherited Create(AOwner);
    DM:=TdmRegards.Create(Application.MainForm);
    DM.DB.Handle:=Tisc_Db_Handle(Handle);
    id_pcard:=Id_PC;
    DS_Regards.DataSet:=DM.RegardsSelect;
    {DM.RegardsSelect.ParamByName('Id_PCard').AsInt64 := Id_PCard;
    //DM.RegardsSelect.AfterOpen:=RegardsSelectAfterOpen;
    DM.RegardsSelect.Open; }
    DSetCloseOpen;
    if (modify=0) then
     begin
       Panel11.Enabled:=False;
       ModifRegardsA.Enabled:=False;
       AddRegardsA.Enabled:=False;
       DelRegardsA.Enabled:=False;
     end;
   except on e:Exception
          do ShowMessage(e.Message);
   end;
end;

procedure TfmPCardRegardsPage.DSetCloseOpen;
begin
  try
   DM.RegardsSelect.Close;
   DM.RegardsSelect.SQLs.SelectSQL.Text:='SELECT * FROM SP_MAN_REGARDS_SELECT(:Id_PCard)';
   DM.RegardsSelect.ParamByName('Id_PCard').AsInt64 := Id_PCard;
   DM.RegardsSelect.Open;
   RegardsGridDBTableView1.ViewData.Expand(True);
   except on e:exception
          do showmessage(e.message);
   end;       
end;

procedure TfmPCardRegardsPage.AddRegardsAExecute(Sender: TObject);
var RegardsForm: TfrmRegardsAdd;
RegardsProc:TpFIBStoredProc;
id_loc:Integer;
begin
    RegardsForm:=TfrmRegardsAdd.Create(Self, DM);
    RegardsForm.Caption:='Додати';
    RegardsForm.DateEdit.Date:=Date;
    RegardsProc:=TpFIBStoredProc.Create(Self);
    RegardsProc.Database:=dm.DB;
    RegardsProc.Transaction:=dm.DefaultTransaction;
    dmhandle:=integer(Dm.DB.Handle);
    RegardsForm.Hl:=dmhandle;
    RegardsProc.StoredProcName:='ASUP_MAN_REGARDS_I';
    RegardsProc.Transaction.StartTransaction;
    //StartHistory(dm.DefaultTransaction);
    if (RegardsForm.ShowModal=mrOk) then
    begin
        RegardsProc.Prepare;
        if DateToStr(RegardsForm.DateEdit.Date)='00.00.0000' then RegardsProc.ParamByName('DATE_BEG').Value:=null
        else RegardsProc.ParamByName('DATE_BEG').Value:=RegardsForm.DateEdit.Date;
        RegardsProc.ParamByName('ID_PCARD').AsInteger:=Id_PCard;
        RegardsProc.ParamByName('ID_REGARD').Value:=RegardsForm.val1;
        RegardsProc.ParamByName('NUM_DOC').AsString:=RegardsForm.NumDoc.Text;
        RegardsProc.ParamByName('THEME_DIS').AsString:=RegardsForm.TemaDis.Text;
        if VarIsNull(RegardsForm.SprShifrSpec.Value) then RegardsProc.ParamByName('ID_SHIFR_SPEC').Value:=null
        else RegardsProc.ParamByName('ID_SHIFR_SPEC').AsInt64:=RegardsForm.SprShifrSpec.Value;
        RegardsProc.ExecProc;
        id_loc:=RegardsProc.FieldByName('ID_M_REG').AsInteger;
        RegardsProc.Transaction.Commit;
        RegardsProc.Close;
        RegardsProc.Free;
        DSetCloseOpen;
        DM.RegardsSelect.Locate('ID_MAN_REGARD',id_loc,[]);
    end;
end;

procedure TfmPCardRegardsPage.DelRegardsAExecute(Sender: TObject);
begin
  with DM do
  begin
    If RegardsSelect.IsEmpty then
     begin
       MessageDlg('Не можливо видалити пустий запис!',mtError,[mbYes],0);
       Exit;
     end;
    if (MessageDlg('Чи ви справді бажаєте вилучити цей запис?',mtConfirmation,[mbYes,mbNo],0) = mrNo) then Exit;
    try
      DefaultTransaction.StartTransaction;
      StartHistory(dm.DefaultTransaction);
      DeleteQ.ParamByName('Id_man_Regard').AsInteger:=RegardsSelect['Id_man_Regard'];
      DeleteQ.ExecProc;
      DefaultTransaction.Commit;
      RegardsSelect.Close;
      RegardsSelect.Open;
    except on e: Exception do
     begin
       MessageDlg('Не вдалося видалити запис: '+#13+e.Message,mtError,[mbYes],0);
       DefaultTransaction.Rollback;
     end;
    end;
  end;
end;

procedure TfmPCardRegardsPage.FrameExit(Sender: TObject);
begin
     DM.ReadTransaction.CommitRetaining;
     //Dm.Free;
end;

procedure TfmPCardRegardsPage.FrameEnter(Sender: TObject);
begin
     {if not DM.ReadTransaction.InTransaction
     then DM.ReadTransaction.StartTransaction;

     if DM.RegardsSelect.Active
     then DM.RegardsSelect.Close;

     DM.RegardsSelect.Open;

     RegardsGridDBTableView1.ViewData.Expand(True);}

     RegardsGrid.SetFocus;   
end;

procedure TfmPCardRegardsPage.RegardsGridDBTableView1KeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (( Key = VK_F12) and (ssShift in Shift)) then
     ShowInfo(RegardsGridDBTableView1.DataController.DataSource.DataSet);
end;

procedure TfmPCardRegardsPage.RegardsGridFocusedViewChanged(
  Sender: TcxCustomGrid; APrevFocusedView,
  AFocusedView: TcxCustomGridView);
begin
  RegardsGridDBTableView1.ViewData.Expand(True);
end;

procedure TfmPCardRegardsPage.SB_ModifRegardsClick(Sender: TObject);
var RegardsForm: TfrmRegardsAdd;
RegardsProc:TpFIBStoredProc;
id_loc:Integer;
begin
    RegardsForm:=TfrmRegardsAdd.Create(Self, Dm);
    RegardsForm.Caption:='Змінити';
    id_loc:=dm.RegardsSelect['ID_MAN_REGARD'];
    if varIsNull(dm.RegardsSelect['DATE_BEG']) then RegardsForm.DateEdit.Date:=Date else
    RegardsForm.DateEdit.Date:=dm.RegardsSelect['DATE_BEG'];
    if VarIsNull(dm.RegardsSelect['NUM_DOC']) then RegardsForm.NumDoc.Text:='' else
    RegardsForm.NumDoc.Text:=dm.RegardsSelect['NUM_DOC'];
    if VarIsNull(dm.RegardsSelect['THEME_DIS']) then RegardsForm.TemaDis.Text:='' else
    RegardsForm.TemaDis.Text:=dm.RegardsSelect['THEME_DIS'];
    //RegardsForm.qFSpravControl1.Value:=dm.RegardsSelect['ID_REGARD'];
    RegardsForm.RegardsSet.Close;
    RegardsForm.RegardsSet.SQLs.SelectSQL.Text:=' select distinct sr.id_regard, sr.full_name from sp_regards sr where sr.id_regard=:id_regard';
    RegardsForm.RegardsSet.ParamByName('ID_REGARD').AsInteger:=dm.RegardsSelect['ID_REGARD'];
    RegardsForm.RegardsSet.Open;
    RegardsForm.val1:=RegardsForm.RegardsSet['ID_REGARD'];
    RegardsForm.qFSpravControl1.DisplayText:=RegardsForm.RegardsSet['full_name'];
    if not VarIsNull(Dm.RegardsSelect['Id_Spec']) then
    begin
       RegardsForm.SprShifrSpec.Value:=Dm.RegardsSelect['Id_Spec'];
       RegardsForm.SprShifrSpec.DisplayText:=Dm.RegardsSelect['Name_Spec'];
       If not VarIsNull(Dm.RegardsSelect['Num_Shifr']) then
          RegardsForm.SearchShifr.Text:=Dm.RegardsSelect['Num_Shifr'];
    end;

    RegardsProc:=TpFIBStoredProc.Create(Self);
    RegardsProc.Database:=dm.DB;
    RegardsProc.Transaction:=dm.DefaultTransaction;
    dmhandle:=integer(Dm.DB.Handle);
    RegardsForm.Hl:=dmhandle;
    RegardsProc.StoredProcName:='ASUP_MAN_REGARDS_UPD';
    RegardsProc.Transaction.StartTransaction;
    //StartHistory(dm.DefaultTransaction);
    if RegardsForm.ShowModal=mrOk then
    begin
        RegardsProc.Prepare;
        if DateToStr(RegardsForm.DateEdit.Date)='00.00.0000' then RegardsProc.ParamByName('DATE_BEG').Value:=null
        else RegardsProc.ParamByName('DATE_BEG').Value:=RegardsForm.DateEdit.Date;
        RegardsProc.ParamByName('ID_MAN_REGARD').AsInteger:=dm.RegardsSelect['ID_MAN_REGARD'];
        RegardsProc.ParamByName('ID_PCARD').AsInteger:=Id_PCard;
        RegardsProc.ParamByName('ID_REGARD').Value:=RegardsForm.val1;
        RegardsProc.ParamByName('NUM_DOC').AsString:=RegardsForm.NumDoc.Text;
        RegardsProc.ParamByName('THEME_DIS').AsString:=RegardsForm.TemaDis.Text;
        if VarIsNull(RegardsForm.SprShifrSpec.Value) then RegardsProc.ParamByName('ID_SHIFR_SPEC').Value:=null
        else RegardsProc.ParamByName('ID_SHIFR_SPEC').AsInt64:=RegardsForm.SprShifrSpec.Value;        
        RegardsProc.ExecProc;
        RegardsProc.Transaction.Commit;
        RegardsProc.Close;
        RegardsProc.Free;
        DSetCloseOpen;
        dm.RegardsSelect.Locate('ID_MAN_REGARD',id_loc,[]);
    end;
end;

end.
