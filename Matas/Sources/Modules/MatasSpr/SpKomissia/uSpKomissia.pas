{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uSpKomissia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ibase, FIBDatabase, pFIBDatabase,
  uResources, Buttons, ExtCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, FIBDataSet, FIBQuery,
  pFIBQuery, pFIBDataSet, cxTL, cxMaskEdit, cxInplaceContainer, cxDBTL,
  uMatasUtils, cxSplitter, cxTLData, cxTextEdit, ImgList, cxCurrencyEdit,
  Menus, pFIBStoredProc, cxCalendar, cxContainer, cxLabel, cxDBLabel,
  StdCtrls;

type
  TKomissiaMainForm = class(TForm)
    fdbKomissia: TpFIBDatabase;
    TopPanel: TPanel;
    AddButton: TSpeedButton;
    ModifyButton: TSpeedButton;
    DeleteButton: TSpeedButton;
    OkButton: TSpeedButton;
    CancelButton: TSpeedButton;
    RefreshButton: TSpeedButton;
    ReadTransaction: TpFIBTransaction;
    GroupDataSet: TpFIBDataSet;
    WriteTransaction: TpFIBTransaction;
    WorkQuery: TpFIBQuery;
    GroupDataSource: TDataSource;
    KomissiaDataSet: TpFIBDataSet;
    cxGroupTreeList: TcxDBTreeList;
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
    PopupMenu1: TPopupMenu;
    NTipGrpAdd: TMenuItem;
    NTipGrpEdit: TMenuItem;
    NTipGrpDel: TMenuItem;
    N4: TMenuItem;
    NTipGrpRefr: TMenuItem;
    cxSplitter1: TcxSplitter;
    WorkStoredProc: TpFIBStoredProc;
    Panel1: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    GroupDataSetID_KOMISSIA: TFIBBCDField;
    GroupDataSetLINKTO: TFIBBCDField;
    GroupDataSetNAME: TFIBStringField;
    GroupDataSetDIR_KOMISSIA: TFIBStringField;
    GroupDataSetKOMISSIA: TFIBStringField;
    GroupDataSetNUM_PRIKAZ: TFIBStringField;
    GroupDataSetDATE_PRIKAZ: TFIBDateField;
    GroupDataSetDATE_BEG: TFIBDateField;
    GroupDataSetDATE_END: TFIBDateField;
    GroupDataSetTIP: TFIBIntegerField;
    cxDBTreeList1ID_KOMISSIA: TcxDBTreeListColumn;
    cxDBTreeList1LINKTO: TcxDBTreeListColumn;
    cxDBTreeList1NAME: TcxDBTreeListColumn;
    cxDBTreeList1DIR_KOMISSIA: TcxDBTreeListColumn;
    cxDBTreeList1KOMISSIA: TcxDBTreeListColumn;
    cxDBTreeList1NUM_PRIKAZ: TcxDBTreeListColumn;
    cxDBTreeList1DATE_PRIKAZ: TcxDBTreeListColumn;
    cxDBTreeList1DATE_BEG: TcxDBTreeListColumn;
    cxDBTreeList1DATE_END: TcxDBTreeListColumn;
    cxDBTreeList1TIP: TcxDBTreeListColumn;
    KomissiaDataSetID_KOMISSIA: TFIBBCDField;
    KomissiaDataSetLINKTO: TFIBBCDField;
    KomissiaDataSetNAME: TFIBStringField;
    KomissiaDataSetDIR_KOMISSIA: TFIBStringField;
    KomissiaDataSetKOMISSIA: TFIBStringField;
    KomissiaDataSetNUM_PRIKAZ: TFIBStringField;
    KomissiaDataSetDATE_PRIKAZ: TFIBDateField;
    KomissiaDataSetDATE_BEG: TFIBDateField;
    KomissiaDataSetDATE_END: TFIBDateField;
    KomissiaDataSetTIP: TFIBIntegerField;
    cxGrid1DBTableView1ID_KOMISSIA: TcxGridDBColumn;
    cxGrid1DBTableView1LINKTO: TcxGridDBColumn;
    cxGrid1DBTableView1NAME: TcxGridDBColumn;
    cxGrid1DBTableView1DIR_KOMISSIA: TcxGridDBColumn;
    cxGrid1DBTableView1KOMISSIA: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_PRIKAZ: TcxGridDBColumn;
    cxGrid1DBTableView1DATE_PRIKAZ: TcxGridDBColumn;
    cxGrid1DBTableView1DATE_BEG: TcxGridDBColumn;
    cxGrid1DBTableView1DATE_END: TcxGridDBColumn;
    cxGrid1DBTableView1TIP: TcxGridDBColumn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cxDBLabel1: TcxDBLabel;
    KomissiaDataSource: TDataSource;
    cxDBLabel2: TcxDBLabel;
    cxDBLabel3: TcxDBLabel;
    cxDBLabel4: TcxDBLabel;
    MainImageList: TImageList;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure ModifyButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure cxGrid1DblClick(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
   DBHANDLE : TISC_DB_HANDLE;
   ID_USER : Int64;
  public
   IS_OSN: integer;
   ResultArray:Variant;
   constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE);overload;
  end;

  function GetKomissia(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64):Variant; stdcall;

  exports GetKomissia;

var
  KomissiaMainForm: TKomissiaMainForm;

implementation

uses uSpKomissiaGroupWork, uSpKomissiaWork;
{$R *.dfm}

constructor TKomissiaMainForm.Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 Caption:=MAT_SYS_PREFIX + MAT_FORMCAP_SP_TIPDOC;
 if Assigned(DBHandle)
 then begin
  Self.fdbKomissia.Close;
  Self.DBHANDLE := DBHandle;
  Self.fdbKomissia.Handle := DBHANDLE;
  Self.GroupDataSet.CloseOpen(False);
  Self.KomissiaDataSet.CloseOpen(False);
 end;
 Self.AddButton.Caption:=MAT_ACTION_ADD_CONST;
 Self.DeleteButton.Caption:=MAT_ACTION_DELETE_CONST;
 Self.ModifyButton.Caption:=MAT_ACTION_UPDATE_CONST;
 Self.RefreshButton.Caption:=MAT_ACTION_REFRESH_CONST;
 Self.OkButton.Caption:=MAT_ACTION_CHOOSE_CONST;
 Self.CancelButton.Caption:=MAT_ACTION_CLOSE_CONST;
 Self.NTipGrpAdd.Caption:=MAT_ACTION_ADD_CONST;
 Self.NTipGrpEdit.Caption:=MAT_ACTION_UPDATE_CONST;
 Self.NTipGrpDel.Caption:=MAT_ACTION_DELETE_CONST;
 Self.NTipGrpRefr.Caption:=MAT_ACTION_REFRESH_CONST;
 Self.CancelButton.Align := alRight;
 Self.OkButton.Align := alRight;
end;

function GetKomissia(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64):Variant;stdcall;
var
 form : TKomissiaMainForm;
begin
 form := TKomissiaMainForm.Create(AOwner,DBHANDLE);
 form.ID_USER := aID_USER;
 form.ShowModal;
 GetKomissia := form.ResultArray;
 form.Free;
end;

procedure TKomissiaMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TKomissiaMainForm.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TKomissiaMainForm.OkButtonClick(Sender: TObject);
begin
 if Not Self.KomissiaDataSet.IsEmpty
  then begin
   ResultArray := VarArrayCreate([0,5], varVariant);
   ResultArray[0] := Self.KomissiaDataSetID_KOMISSIA.Value;
   ResultArray[1] := Self.KomissiaDataSetNAME.Value;
   ResultArray[2] := Self.KomissiaDataSetDIR_KOMISSIA.Value;
   ResultArray[3] := Self.KomissiaDataSetKOMISSIA.Value;
   ResultArray[4] := Self.KomissiaDataSetNUM_PRIKAZ.Value;
   ResultArray[5] := Self.KomissiaDataSetDATE_PRIKAZ.Value;
   Close;
  end;
end;

procedure TKomissiaMainForm.AddButtonClick(Sender: TObject);
var
 T: TSpKomissiaGroupWorkForm;
 K: TSpKomissiaWorkForm;
 vals : array of Variant;
 id: integer;
begin
 if cxGroupTreeList.IsFocused then
 begin
  T:=TSpKomissiaGroupWorkForm.Create(self);
  T.Caption:=MAT_SYS_PREFIX + MAT_STR_MODE_ADD;
  if T.ShowModal=mrOk then
  begin
   SetLength(Vals, 9);
   if GroupDataSet.IsEmpty then
    Vals[0] := 0
   else
    Vals[ 0] := GroupDataSetID_KOMISSIA.AsInteger;
   Vals[ 1] := T.cxNameEdit.Text;
   Vals[ 2] := '';
   Vals[ 3] := '';
   Vals[ 4] := '';
   Vals[ 5] := null;
   Vals[ 6] := null;
   Vals[ 7] := null;
   Vals[ 8] := 0;
   try
    WorkStoredProc.Transaction := WriteTransaction;
    WorkStoredProc.Transaction.StartTransaction;
    WorkStoredProc.StoredProcName:='MAT_SP_KOMISSIA_INSERT';
    WorkStoredProc.Prepare;
    WorkStoredProc.ExecProcedure('MAT_SP_KOMISSIA_INSERT', vals);
    WorkStoredProc.Transaction.Commit;
    id:=WorkStoredProc.ParamByName('ID_KOMISSIA').AsInteger;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     WorkStoredProc.Transaction.Rollback;
     exit;
    end;
   end;
   GroupDataSet.CloseOpen(False);
   GroupDataSet.Locate('ID_KOMISSIA',id,[]);
   KomissiaDataSet.CloseOpen(false);
  end;
 end;
 if cxGrid1.IsFocused then
 begin
  K:=TSpKomissiaWorkForm.Create(self);
  K.Caption:=MAT_SYS_PREFIX + MAT_STR_MODE_ADD;
  K.cxDatePrikazKomissia.EditValue:=Date;
  if K.ShowModal=mrOk then
  begin
   SetLength(Vals, 9);
   Vals[ 0] := GroupDataSetID_KOMISSIA.AsInteger;
   Vals[ 1] := K.cxNameEdit.Text;
   Vals[ 2] := K.cxDirKomissia.Text;
   Vals[ 3] := K.cxKomissia.Text;
   Vals[ 4] := K.cxNumPrikazKomissia.Text;
   Vals[ 5] := K.cxDatePrikazKomissia.EditValue;
   Vals[ 6] := null;
   Vals[ 7] := null;
   Vals[ 8] := 1;
   try
    WorkStoredProc.Transaction := WriteTransaction;
    WorkStoredProc.Transaction.StartTransaction;
    WorkStoredProc.StoredProcName:='MAT_SP_KOMISSIA_INSERT';
    WorkStoredProc.Prepare;
    WorkStoredProc.ExecProcedure('MAT_SP_KOMISSIA_INSERT', vals);
    WorkStoredProc.Transaction.Commit;
    id:=WorkStoredProc.ParamByName('ID_KOMISSIA').AsInteger;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     WorkStoredProc.Transaction.Rollback;
     exit;
    end;
   end;
   KomissiaDataSet.CloseOpen(false);
   KomissiaDataSet.Locate('ID_KOMISSIA',id,[]);
  end;
 end;
end;

procedure TKomissiaMainForm.ModifyButtonClick(Sender: TObject);
var
 T: TSpKomissiaGroupWorkForm;
 K: TSpKomissiaWorkForm;
 id: integer;
 vals : array of Variant;
begin
 if cxGroupTreeList.IsFocused then
 begin
  T:=TSpKomissiaGroupWorkForm.Create(self);
  T.Caption:=MAT_SYS_PREFIX + MAT_STR_MODE_EDIT;
  id:=GroupDataSetID_KOMISSIA.AsInteger;
  T.cxNameEdit.Text:=GroupDataSetNAME.AsString;
  if T.ShowModal=mrOk then
  begin
   SetLength(Vals, 8);
   Vals[ 0] := id;
   Vals[ 1] := T.cxNameEdit.Text;
   Vals[ 2] := '';
   Vals[ 3] := '';
   Vals[ 4] := '';
   Vals[ 5] := null;
   Vals[ 6] := null;
   Vals[ 7] := null;
   try
    WorkStoredProc.Transaction := WriteTransaction;
    WorkStoredProc.Transaction.StartTransaction;
    WorkStoredProc.StoredProcName:='MAT_SP_KOMISSIA_UPDATE';
    WorkStoredProc.Prepare;
    WorkStoredProc.ExecProcedure('MAT_SP_KOMISSIA_UPDATE', vals);
    WorkStoredProc.Transaction.Commit;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     WorkStoredProc.Transaction.Rollback;
     exit;
    end;
   end;
   GroupDataSet.CloseOpen(False);
   GroupDataSet.Locate('ID_KOMISSIA',id,[]);
   KomissiaDataSet.CloseOpen(false);
  end;
 end;
 if cxGrid1.IsFocused then
 begin
  K:=TSpKomissiaWorkForm.Create(self);
  K.Caption:=MAT_SYS_PREFIX + MAT_STR_MODE_EDIT;
  K.cxDatePrikazKomissia.EditValue:=Date;
  id:=KomissiaDataSetID_KOMISSIA.AsInteger;
  K.cxNameEdit.Text:=KomissiaDataSetNAME.AsString;
  K.cxNumPrikazKomissia.Text:=KomissiaDataSetNUM_PRIKAZ.AsString;
  K.cxDatePrikazKomissia.Text:=KomissiaDataSetDATE_PRIKAZ.AsString;
  K.cxDirKomissia.Text:=KomissiaDataSetDIR_KOMISSIA.AsString;
  K.cxKomissia.Text:=KomissiaDataSetKOMISSIA.AsString;
  if K.ShowModal=mrOk then
  begin
   SetLength(Vals, 8);
   Vals[ 0] := id;
   Vals[ 1] := K.cxNameEdit.Text;
   Vals[ 2] := K.cxDirKomissia.Text;
   Vals[ 3] := K.cxKomissia.Text;
   Vals[ 4] := K.cxNumPrikazKomissia.Text;
   Vals[ 5] := K.cxDatePrikazKomissia.EditValue;
   Vals[ 6] := null;
   Vals[ 7] := null;
   try
    WorkStoredProc.Transaction := WriteTransaction;
    WorkStoredProc.Transaction.StartTransaction;
    WorkStoredProc.StoredProcName:='MAT_SP_KOMISSIA_UPDATE';
    WorkStoredProc.Prepare;
    WorkStoredProc.ExecProcedure('MAT_SP_KOMISSIA_UPDATE', vals);
    WorkStoredProc.Transaction.Commit;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     WorkStoredProc.Transaction.Rollback;
     exit;
    end;
   end;
   KomissiaDataSet.CloseOpen(false);
   KomissiaDataSet.Locate('ID_KOMISSIA',id,[]);
  end;
 end;
end;

procedure TKomissiaMainForm.DeleteButtonClick(Sender: TObject);
var
 id: integer;
begin
 if cxGroupTreeList.IsFocused then
 begin
  if KomissiaDataSet.IsEmpty then
   id:=GroupDataSetID_KOMISSIA.AsInteger
  else exit;
 end;
 if cxGrid1.IsFocused then
  id:=KomissiaDataSetID_KOMISSIA.AsInteger;
 if agMessageDlg(MAT_STR_MODE_DEL, MAT_STR_ASK_DELETE, mtConfirmation, [mbYes, mbNo]) = ID_YES  then
 begin
  try
    WorkStoredProc.Transaction := WriteTransaction;
    WorkStoredProc.Transaction.StartTransaction;
    WorkStoredProc.StoredProcName:='MAT_SP_KOMISSIA_DELETE';
    WorkStoredProc.Prepare;
    WorkStoredProc.ExecProcedure('MAT_SP_KOMISSIA_DELETE', [id]);
    WorkStoredProc.Transaction.Commit;
  except on E : Exception
   do begin
     ShowMessage(MAT_STR_ERROR_DELETE);
     WorkStoredProc.Transaction.Rollback;
     exit;
   end;
  end;
  GroupDataSet.CloseOpen(false);
  KomissiaDataSet.CloseOpen(False);
 end;
end;

procedure TKomissiaMainForm.RefreshButtonClick(Sender: TObject);
begin
 GroupDataSet.CloseOpen(False);
 KomissiaDataSet.CloseOpen(false);
end;

procedure TKomissiaMainForm.cxGrid1DblClick(Sender: TObject);
begin
 if OkButton.Visible then
  OkButton.Click;
end;

procedure TKomissiaMainForm.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (Key=VK_RETURN) and (OkButton.Visible) then
   OkButton.Click;
end;

end.
