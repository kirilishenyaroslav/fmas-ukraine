unit DiscSpec_DistribEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, ExtCtrls, StdCtrls,
  cxButtons, ActnList, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery,
  pFIBStoredProc, FIBDataSet, pFIBDataSet, cxContainer, cxTextEdit,
  cxMaskEdit, cxButtonEdit, IBase, uUO_Resources, AArray, cxLabel, uPrK_Resources,
  DiscSpec_dmCommonStyles, cxRadioGroup;

type
  TfDistribEdit = class(TForm)
    DSetMain: TpFIBDataSet;
    Transaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    DB: TpFIBDatabase;
    ActionList1: TActionList;
    OkAction: TAction;
    CancelAction: TAction;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    DSetValues: TpFIBDataSet;
    DSourceMain: TDataSource;
    DSourceValues: TDataSource;
    PanelDistrib: TPanel;
    PanelKaf: TPanel;
    PanelMain: TPanel;
    GridDistribDBTableView1: TcxGridDBTableView;
    GridDistribLevel1: TcxGridLevel;
    GridDistrib: TcxGrid;
    GridVal: TcxGrid;
    GridValDBTableView1: TcxGridDBTableView;
    GridValLevel1: TcxGridLevel;
    cmnID: TcxGridDBColumn;
    cmnVAL: TcxGridDBColumn;
    cmnID_SP_TYPE_KAF_DISTRIB: TcxGridDBColumn;
    cmnDESCRIPTION: TcxGridDBColumn;
    BEKaf: TcxButtonEdit;
    mePercent: TcxMaskEdit;
    lPercent: TcxLabel;
    cxLabel1: TcxLabel;
    RGSelect: TcxRadioGroup;
    procedure BEKafPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure CancelActionExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OkActionExecute(Sender: TObject);
    procedure RGSelectPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    pDSet:TpFIBDataSet;
    pIsGroup:Boolean;
    pRejim:UORejim;
    pStylesDM:TStylesDM;
    procedure ReOpenDSets;
    function CanAddOnlyKaf:Boolean;
    function IsTypeUsed(AID_TYPE:Int64):Boolean;
  public
    { Public declarations }
    pID_SP_DEPARTMENT:Int64;
//    pID_PARENT:Int64;
    pPERCENT:Extended;
    pID_SP_TYPE_KAF_DISTRIB:Int64;
    pID_SP_VAL_KAF_DISTRIB:Int64;
    constructor Create(AOwner:TComponent;ADSet:TpFIBDataSet;ARejim:UORejim;AIsGroup:Boolean);reintroduce;
  end;

  procedure ViewDistribEdit(AOwner:TComponent;ADSet:TpFIBDataSet;ARejim:UORejim;AIsGroup:Boolean=False);
implementation

{$R *.dfm}
uses uCommonSp, Math;

procedure ViewDistribEdit(AOwner:TComponent;ADSet:TpFIBDataSet;ARejim:UORejim;AIsGroup:Boolean=False);
var ViewForm:TfDistribEdit;
begin
  ViewForm:=TfDistribEdit.Create(AOwner,ADSet,ARejim,AIsGroup);
  if ARejim=uoDelete then
    ViewForm.OkActionExecute(nil)
  else
    ViewForm.ShowModal;
  ViewForm.Release;
end;

function TfDistribEdit.IsTypeUsed(AID_TYPE:Int64):Boolean;
var pId,i:Int64;
begin
  pDSet.DisableControls;
  pId:=pDSet['ID_SP_DISC_SPEC_DISTRIB'];
  Result:=False;
  i:=pId;
  repeat
    Result:=(AID_TYPE=pDSet['ID_SP_TYPE_KAF_DISTRIB']);
    i:=pDSet['ID_PARENT'];
    pDSet.Locate('ID_SP_DISC_SPEC_DISTRIB',i,[]);
  until (Result) or (pDSet['ID_PARENT']=-1);
  if not Result then
    Result:=(AID_TYPE=pDSet['ID_SP_TYPE_KAF_DISTRIB']);

  pDSet.Locate('ID_SP_DISC_SPEC_DISTRIB',pId,[]);
  pDSet.EnableControls;
end;

function TfDistribEdit.CanAddOnlyKaf:Boolean;
var pId:Int64;
begin
  pId:=pDSet['ID_SP_DISC_SPEC_DISTRIB'];
  Result:= pDSet.Locate('ID_SP_TYPE_KAF_DISTRIB; ID_PARENT',VarArrayOf([-1,pId]),[]);
  pDSet.Locate('ID_SP_DISC_SPEC_DISTRIB',pId,[]);
end;

procedure TfDistribEdit.ReOpenDSets;
begin
  if DSetValues.Active then DSetValues.Close;
  if DSetMain.Active then DSetMain.Close;

  DSetMain.SQLs.SelectSQL.Text:='SELECT * FROM UO_SP_TYPE_KAF_DISTRIB_SEL';
  DSetValues.SQLs.SelectSQL.Text:='SELECT * FROM UO_SP_TYPE_KAF_DISTRIB_SEL_VAL(?TABLE_NAME,?KEY_FIELD_NAME,?FIELD_NAME)';
  DSetMain.Open;
  if not DSetMain.IsEmpty then
    DSetValues.Open;
  if (pRejim=uoEdit) or (pRejim=uoView) then
    begin
      DSetMain.Locate('ID_SP_TYPE_KAF_DISTRIB',pDSet['ID_SP_TYPE_KAF_DISTRIB'],[]);
      DSetValues.Locate('ID',pDSet['ID_SP_VAL_KAF_DISTRIB'],[]);
    end;
end;

constructor TfDistribEdit.Create(AOwner:TComponent;ADSet:TpFIBDataSet;ARejim:UORejim;AIsGroup:Boolean);
var pHeight:Integer;
begin
  inherited Create(AOwner);
  DB.Handle:=ADSet.Database.Handle;
  Transaction.Active:=True;
  pStylesDM:=TStylesDM.Create(Self);
  GridDistribDBTableView1.Styles.StyleSheet:=pStylesDM.GridTableViewStyleSheetDevExpress;
  GridValDBTableView1.Styles.StyleSheet:=pStylesDM.GridTableViewStyleSheetDevExpress;

  pID_SP_DEPARTMENT:=-1;
  pDSet:=ADSet;
  pRejim:=ARejim;
  pIsGroup:=AIsGroup;

  Caption:=GetEditCaption(pRejim);
  RGSelect.EditValue:=True;
  pHeight:=0;

 if pRejim=uoAdd then
  begin
   if pIsGroup then
    ReOpenDSets
   else
    if not CanAddOnlyKaf then
      ReOpenDSets
    else
      begin
        pHeight:=RGSelect.Height;
        RGSelect.EditValue:=True;
        PanelDistrib.Visible:=False;
        pHeight:=pHeight+PanelDistrib.Height;
        RGSelect.Visible:=False;
      end;
  end
 else
 begin
  pHeight:=RGSelect.Height;
  if pDSet['ID_SP_TYPE_KAF_DISTRIB']<0 then
    begin
      RGSelect.EditValue:=True;
      PanelDistrib.Visible:=False;
      pHeight:=pHeight+PanelDistrib.Height;

      if (pRejim=uoEdit) or (pRejim=uoView) then
        begin
          pID_SP_DEPARTMENT:=pDSet['ID_SP_VAL_KAF_DISTRIB'];
          BEKaf.Text:=pDSet['TEXT_KAF_DISTRIB'];
          mePercent.EditValue:=pDSet['PERCENT_KAF_DISTRIB'];
        end;
    end
  else
    begin
      RGSelect.EditValue:=False;
      PanelKaf.Visible:=False;
      pHeight:=pHeight+PanelKaf.Height;
      ReOpenDSets;
    end;
   RGSelect.Visible:=False;
  end;
  PanelMain.Height:=PanelMain.Height-pHeight;
  Height:=Height-pHeight;
  OkButton.Top:=OkButton.Top-pHeight;
  CancelButton.Top:=CancelButton.Top-pHeight;
end;

procedure TfDistribEdit.BEKafPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
    sp: TSprav;
begin
// создать справочник
    sp := GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
                // присвоить хэндл базы данных
            FieldValues['DBHandle'] := Integer(DB.Handle);
                // MDI-окно
            FieldValues['ShowStyle'] := 1;
                // без выборки
            FieldValues['Select'] := 1;
                // с возможностью редактирования
            FieldValues['AllowEdit'] := False;
            Post;
        end;
    end;
        // просто показать справочник
    sp.Show;
    if not VarIsNull(sp.Output['ID_DEPARTMENT']) then
      begin
        pID_SP_DEPARTMENT:=sp.Output['ID_DEPARTMENT'];
        BEKaf.Text:=sp.Output['NAME_FULL'];
      end;
    sp.Free;
end;

procedure TfDistribEdit.CancelActionExecute(Sender: TObject);
begin
  Close;
end;

procedure TfDistribEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Transaction.Active:=False;
end;

procedure TfDistribEdit.OkActionExecute(Sender: TObject);
var pID_PARENT, pID_SP_DISC_SPEC:Int64;
begin
try
 StoredProc.Transaction.StartTransaction;
 pID_SP_DISC_SPEC:=pDSet.DataSource.DataSet['ID_SP_DISC_SPEC'];
 case pRejim of
  uoAdd:
    begin
      StoredProc.StoredProcName:='UO_SP_DISC_SPEC_DISTRIB_I';
      StoredProc.Prepare;
      if pIsGroup then
        pID_PARENT:=-1
      else
        pID_PARENT:=pDSet['ID_SP_DISC_SPEC_DISTRIB'];

      if (RGSelect.EditValue=True) then
        begin
          if (pID_SP_DEPARTMENT=-1) or (mePercent.Text='') then
           begin
            StoredProc.Transaction.Rollback;
            Exit;
           end;
//          StoredProc.ParamByName('ID_SP_DISC_SPEC_DISTRIB').AsInt64:=pDSet['ID_SP_DISC_SPEC_DISTRIB'];
          StoredProc.ParamByName('ID_SP_DISC_SPEC').AsInt64:=pID_SP_DISC_SPEC;
          StoredProc.ParamByName('ID_SP_DEPARTMENT').AsInt64:=pID_SP_DEPARTMENT;
          StoredProc.ParamByName('ID_PARENT').AsInt64:=pID_PARENT;
          StoredProc.ParamByName('ID_SP_TYPE_KAF_DISTRIB').AsInt64:=-1;
          StoredProc.ParamByName('ID_SP_VAL_KAF_DISTRIB').AsInt64:=-1;
          StoredProc.ParamByName('PERCENT_KAF_DISTRIB').AsExtended:=mePercent.EditValue;
        end
      else
        begin
          if DSetValues.IsEmpty then
           begin
            StoredProc.Transaction.Rollback;
            Exit;
           end;
          if not pIsGroup then
          if IsTypeUsed(DSetMain['ID_SP_TYPE_KAF_DISTRIB']) then
            begin
              prkMessageDlg('Увага','Збереження неможливе: група вже містить властивість обраного типу.',mtWarning,[mbOK],0);
              StoredProc.Transaction.Rollback;
              Exit;
            end;
//          StoredProc.ParamByName('ID_SP_DISC_SPEC_DISTRIB').AsInt64:=pDSet['ID_SP_DISC_SPEC_DISTRIB'];
          StoredProc.ParamByName('ID_SP_DISC_SPEC').AsInt64:=pID_SP_DISC_SPEC;
          StoredProc.ParamByName('ID_SP_DEPARTMENT').AsInt64:=-1;
          StoredProc.ParamByName('ID_PARENT').AsInt64:=pID_PARENT;
          StoredProc.ParamByName('ID_SP_TYPE_KAF_DISTRIB').AsInt64:=DSetMain['ID_SP_TYPE_KAF_DISTRIB'];
          StoredProc.ParamByName('ID_SP_VAL_KAF_DISTRIB').AsInt64:=DSetValues['ID'];;
          StoredProc.ParamByName('PERCENT_KAF_DISTRIB').AsExtended:=100;
        end;
      StoredProc.ExecProc;
    end;
  uoEdit:
    begin
      StoredProc.StoredProcName:='UO_SP_DISC_SPEC_DISTRIB_U';
      StoredProc.Prepare;
      if pDSet['ID_SP_TYPE_KAF_DISTRIB']<0 then
        begin
          StoredProc.ParamByName('ID_SP_DISC_SPEC_DISTRIB').AsInt64:=pDSet['ID_SP_DISC_SPEC_DISTRIB'];
          StoredProc.ParamByName('ID_SP_DISC_SPEC').AsInt64:=pID_SP_DISC_SPEC;
          StoredProc.ParamByName('ID_SP_DEPARTMENT').AsInt64:=pID_SP_DEPARTMENT;
          StoredProc.ParamByName('ID_PARENT').AsInt64:=pDSet['ID_PARENT'];
          StoredProc.ParamByName('ID_SP_TYPE_KAF_DISTRIB').AsInt64:=-1;
          StoredProc.ParamByName('ID_SP_VAL_KAF_DISTRIB').AsInt64:=-1;
          StoredProc.ParamByName('PERCENT_KAF_DISTRIB').AsExtended:=mePercent.EditValue;
        end
      else
        begin
          if pDSet['ID_SP_TYPE_KAF_DISTRIB']<>DSetMain['ID_SP_TYPE_KAF_DISTRIB'] then
           if IsTypeUsed(DSetMain['ID_SP_TYPE_KAF_DISTRIB']) then
            begin
              prkMessageDlg('Увага','Збереження неможливе: група вже містить властивість обраного типу.',mtWarning,[mbOK],0);
              StoredProc.Transaction.Rollback;
              Exit;
            end;
          StoredProc.ParamByName('ID_SP_DISC_SPEC_DISTRIB').AsInt64:=pDSet['ID_SP_DISC_SPEC_DISTRIB'];
          StoredProc.ParamByName('ID_SP_DISC_SPEC').AsInt64:=pID_SP_DISC_SPEC;
          StoredProc.ParamByName('ID_SP_DEPARTMENT').AsInt64:=-1;
          StoredProc.ParamByName('ID_PARENT').AsInt64:=pDSet['ID_PARENT'];
          StoredProc.ParamByName('ID_SP_TYPE_KAF_DISTRIB').AsInt64:=DSetMain['ID_SP_TYPE_KAF_DISTRIB'];
          StoredProc.ParamByName('ID_SP_VAL_KAF_DISTRIB').AsInt64:=DSetValues['ID'];;
          StoredProc.ParamByName('PERCENT_KAF_DISTRIB').AsExtended:=100;
        end;
      StoredProc.ExecProc;
    end;
  uoDelete:
    begin
      if prkMessageDlg('Видалення','Ви дійсно бажаєте видалити запис?',mtConfirmation,[mbYes,mbNo],0)=mrNo then
        Exit;
      StoredProc.StoredProcName:='UO_SP_DISC_SPEC_DISTRIB_D';
      StoredProc.Prepare;
      StoredProc.ParamByName('ID_SP_DISC_SPEC_DISTRIB').AsInt64:=pDSet['ID_SP_DISC_SPEC_DISTRIB'];
      StoredProc.ParamByName('DELETE_NODE').AsInteger:=0;
      StoredProc.ExecProc;
    end;
 end;
 StoredProc.Transaction.Commit;
 ModalResult:=mrOk;
except
on E:Exception do
  begin
    StoredProc.Transaction.Rollback;
    prkMessageDlg('Помилка',E.Message,mtError,[mbOK],0);
  end;
end;
end;

procedure TfDistribEdit.RGSelectPropertiesChange(Sender: TObject);
var pIsKaf:Boolean;
begin
  if not RGSelect.Visible then Exit;

  pIsKaf:=(RGSelect.EditValue=True);

  GridDistrib.Enabled := not pIsKaf;
  GridVal.Enabled     := not pIsKaf;
  mePercent.Enabled   := pIsKaf;
  BEKaf.Enabled       := pIsKaf;
end;

end.
