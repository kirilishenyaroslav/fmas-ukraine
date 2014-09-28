unit uNormIzn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ibase, cxGraphics, cxCustomData, cxStyles, cxTL,
  cxControls, cxInplaceContainer, DB, FIBDatabase, pFIBDatabase, FIBQuery,
  pFIBQuery, pFIBStoredProc, FIBDataSet, pFIBDataSet, cxMaskEdit, cxDBTL,
  cxTLData, ActnList, Menus, cxClasses, cxGridTableView, cxCurrencyEdit,GlobalSPR,uResources,
  ToolWin, ActnMan, ActnCtrls, XPStyleActnCtrls, ImgList,
  cxLookAndFeelPainters, StdCtrls, cxButtons, uMatasUtils;

type
  TNormIznForm = class(TForm)
    Db_iznos: TpFIBDatabase;
    ds_iznos: TpFIBDataSet;
    StPr_iznos: TpFIBStoredProc;
    Tr_iznos: TpFIBTransaction;
    ds1: TDataSource;
    ds_iznosID_OBJECT: TFIBBCDField;
    ds_iznosLINKTO: TFIBBCDField;
    ds_iznosIS_NORMA: TFIBIntegerField;
    ds_iznosNAME: TFIBStringField;
    cxDBTreeList1: TcxDBTreeList;
    cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn;
    StyleRepository: TcxStyleRepository;
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
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    pm1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    actlst1: TActionList;
    actAddGrupTMC: TAction;
    actAddGrupAmort: TAction;
    actDelete: TAction;
    tr_work: TpFIBTransaction;
    ImageList: TImageList;
    pnl1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    actClose: TAction;
    cxButton3: TcxButton;
    actEditGrpAmort: TAction;
    cxButton4: TcxButton;
    ds_iznosPERCENT: TFIBIntegerField;
    ds_iznosS_YEAR: TFIBSmallIntField;
    ds_iznosS_MONTH: TFIBSmallIntField;
    cxDBTreeList1cxDBTreeListColumn2: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn3: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn4: TcxDBTreeListColumn;
    ds_iznosPERCENT_ST: TFIBStringField;
    ds_iznosS_YEAR_ST: TFIBStringField;
    ds_iznosS_MONTH_ST: TFIBStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actAddGrupTMCExecute(Sender: TObject);
    procedure actAddGrupAmortExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure actEditGrpAmortExecute(Sender: TObject);
  private
    DB_HANDLE:TISC_DB_HANDLE;
  public
    id_grp:Integer;
    constructor Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE);
  end;

  procedure ShowSpNormIzn(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE);stdcall;
  exports ShowSpNormIzn;

var
  NormIznForm: TNormIznForm;

implementation

uses  uAddTMC, uAddNormIzn;
{$R *.dfm}

constructor TNormIznForm.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then
 begin
   Self.DB_HANDLE:=DBHANDLE;
   Self.Db_iznos.Close;
   Self.Db_iznos.Handle:=DBHANDLE;
   Self.Ds_iznos.Close;
   Self.ds_iznos.SelectSQL.Clear;
   Self.ds_iznos.SelectSQL.Text:='Select * from MAT_IZNOS_LINK_GRP_TMC_SELECT';
   Self.ds_iznos.CloseOpen(False);
 end;
end;

procedure ShowSpNormIzn(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE);stdcall;
var
   form : TNormIznForm;
begin
    form := TNormIznForm.Create(AOwner, DBHANDLE);
    Form.FormStyle := fsMDIChild;
end;
procedure TNormIznForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action := caFree;
end;

procedure TNormIznForm.actAddGrupTMCExecute(Sender: TObject);
var form: TNomnForm;
    w: TForm;
begin
 w:=ShowWaitWindow(self);
if ds_iznosIS_NORMA.AsInteger = 0 then Exit;
  form:=TNomnForm.Create(Self, DB_HANDLE);
  form.id_group:=ds_iznosID_OBJECT.AsInteger;
  id_grp:= ds_iznosID_OBJECT.AsInteger;
  form.ShowModal;
  if form.ModalResult = mrOk then
  begin
    ds_iznos.CloseOpen(False);
    ds_iznos.locate('ID_OBJECT',id_grp,[]);
  end;
CloseWaitWindow(w);
end;

procedure TNormIznForm.actAddGrupAmortExecute(Sender: TObject);
var form:TAddGrpIznosForm;
    id_norma:Integer;
begin
form:=TAddGrpIznosForm.Create(Self);
 Form.ShowModal;
 if Form.ModalResult = mrOk then
 begin
 try
   Tr_work.StartTransaction;
   StPr_iznos.StoredProcName:='MAT_INV_ADD_NORMA';
   StPr_iznos.Prepare;
   StPr_iznos.ParamByName('NAME_NORMA').AsString:=Form.cxName.Text;
   StPr_iznos.ParamByName('PERCENTI').AsInteger:=form.cxPercent.EditValue;
   StPr_iznos.ParamByName('PERIOD').AsInteger:=2;
   StPr_iznos.ParamByName('ID_METHOD').AsInteger:=1;
   StPr_iznos.ParamByName('TIP').AsInteger:=0;
   StPr_iznos.ParamByName('FORMULA').AsString:='';
   StPr_iznos.ParamByName('SR_YEAR').AsInteger:=0;
   StPr_iznos.ParamByName('SR_MONTH').AsInteger:=0;
   StPr_iznos.ExecProc;
   StPr_iznos.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    StPr_iznos.Transaction.Rollback;
    Exit;
   end;
  end;
  id_norma:=  StPr_iznos.FldByName['ID_NORMA'].AsInteger;
  try
   Tr_work.StartTransaction;
   StPr_iznos.StoredProcName:='MAT_IZNOS_LINK_GRP_IZNOS_INSERT';
   StPr_iznos.Prepare;
   StPr_iznos.ParamByName('ID_GROUP').AsInteger:=id_norma;
   StPr_iznos.ExecProc;
   StPr_iznos.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    StPr_iznos.Transaction.Rollback;
    Exit;
   end;
  end;
 ds_iznos.CloseOpen(False);
 ds_iznos.locate('ID_OBJECT',id_norma,[])
 end;

end;

procedure TNormIznForm.actDeleteExecute(Sender: TObject);
begin
 if MessageDlg( '¬и д≥йсно бажаЇте видалити цей запис?', mtConfirmation, [mbYes, mbNo],0) = ID_YES then
 begin
  try
   Tr_work.StartTransaction;
   StPr_iznos.StoredProcName:='MAT_IZNOS_LINK_GRP_IZNOS_DELETE';
   StPr_iznos.Prepare;
   StPr_iznos.ParamByName('ID_OBJECT').AsInteger:=ds_iznosID_OBJECT.AsInteger;
   StPr_iznos.ExecProc;
   StPr_iznos.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    StPr_iznos.Transaction.Rollback;
    Exit;
   end;
  end;

  if ds_iznosIS_NORMA.AsInteger = 1 then
  try
   Tr_work.StartTransaction;
   StPr_iznos.StoredProcName:='MAT_INV_DELETE_NORMA';
   StPr_iznos.Prepare;
   StPr_iznos.ParamByName('D_ID').AsInteger:=ds_iznosID_OBJECT.AsInteger;
   StPr_iznos.ExecProc;
   StPr_iznos.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    StPr_iznos.Transaction.Rollback;
    Exit;
   end;
  end;

  ds_iznos.CloseOpen(False);
end;
end;
procedure TNormIznForm.actCloseExecute(Sender: TObject);
begin
 Close;
end;

procedure TNormIznForm.actEditGrpAmortExecute(Sender: TObject);
var form:TAddGrpIznosForm;
begin
if ds_iznosIS_NORMA.AsInteger <> 1 then Exit
else
begin
  form:=TAddGrpIznosForm.Create(Self);
  form.cxName.Text:=ds_iznosNAME.AsString;
  form.cxPercent.EditValue:=ds_iznosPERCENT.AsInteger;
  form.ShowModal;
  if form.ModalResult = mrOk then
  try
   Tr_work.StartTransaction;
   StPr_iznos.StoredProcName:='MAT_INV_CHANGE_NORMA';
   StPr_iznos.Prepare;
   StPr_iznos.ParamByName('NAME_NORMA').AsString:=Form.cxName.Text;
   StPr_iznos.ParamByName('PERCENTI').AsInteger:=form.cxPercent.EditValue;
   StPr_iznos.ParamByName('PERIOD').AsInteger:=2;
   StPr_iznos.ParamByName('ID_METHOD').AsInteger:=1;
   StPr_iznos.ParamByName('TIP').AsInteger:=0;
   StPr_iznos.ParamByName('FORMULA').AsString:='';
   StPr_iznos.ParamByName('SR_YEAR').AsInteger:=0;
   StPr_iznos.ParamByName('ID').AsInteger:=ds_iznosID_OBJECT.AsInt64;
   StPr_iznos.ExecProc;
   StPr_iznos.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    StPr_iznos.Transaction.Rollback;
    Exit;
   end;
  end;
  
end;
end;

end.
