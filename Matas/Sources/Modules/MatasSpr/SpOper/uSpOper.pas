{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uSpOper;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxSplitter, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ExtCtrls, cxInplaceContainer, cxTLData, cxDBTL, ibase,
  Placemnt, Buttons, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDataSet,
  pFIBDataSet, FIBDatabase, pFIBDatabase, uMatasUtils, Menus,
  uResources, ImgList;

type
  TSpOperForm = class(TForm)
    PanelTop: TPanel;
    AddButton: TSpeedButton;
    ModifyButton: TSpeedButton;
    DeleteButton: TSpeedButton;
    RefreshButton: TSpeedButton;
    OkButton: TSpeedButton;
    CancelButton: TSpeedButton;
    SpOperFormStorage: TFormStorage;
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
    SpOperDatabase: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    OperDataSet: TpFIBDataSet;
    TreeDataSet: TpFIBDataSet;
    ProvDataSet: TpFIBDataSet;
    TreeDataSource: TDataSource;
    OperDataSource: TDataSource;
    ProvDataSource: TDataSource;
    StoredProc: TpFIBStoredProc;
    PanelRight: TPanel;
    cxOperBaseGrid: TcxGrid;
    cxOperBaseGridDBTableView1: TcxGridDBTableView;
    cxOperBaseGridLevel1: TcxGridLevel;
    cxOperProvGrid: TcxGrid;
    cxOperProvGridDBTableView1: TcxGridDBTableView;
    cxOperProvGridLevel1: TcxGridLevel;
    cxSplitter1: TcxSplitter;
    PanelLeft: TPanel;
    cxOperTreeGrid: TcxGrid;
    cxOperTreeGridDBTableView1: TcxGridDBTableView;
    cxOperTreeGridLevel1: TcxGridLevel;
    Splitter1: TSplitter;
    TreeDataSetID_OPER: TFIBBCDField;
    TreeDataSetNAME: TFIBStringField;
    TreeDataSetTIP: TFIBBooleanField;
    TreeDataSetLINKTO: TFIBBCDField;
    cxOperTreeGridDBTableView1ID_OPER: TcxGridDBColumn;
    cxOperTreeGridDBTableView1NAME: TcxGridDBColumn;
    cxOperTreeGridDBTableView1TIP: TcxGridDBColumn;
    cxOperTreeGridDBTableView1LINKTO: TcxGridDBColumn;
    cxOperBaseGridDBTableView1ID_OPER: TcxGridDBColumn;
    cxOperBaseGridDBTableView1NAME: TcxGridDBColumn;
    cxOperBaseGridDBTableView1TIP: TcxGridDBColumn;
    cxOperBaseGridDBTableView1LINKTO: TcxGridDBColumn;
    OperPopupMenu: TPopupMenu;
    NAdd: TMenuItem;
    NEdit: TMenuItem;
    NDel: TMenuItem;
    N4: TMenuItem;
    NRefr: TMenuItem;
    ProvDataSetID_OPER: TFIBIntegerField;
    ProvDataSetDB_ID_SCH: TFIBIntegerField;
    ProvDataSetDB_SCH_TITLE: TFIBStringField;
    ProvDataSetDB_SCH_NUMBER: TFIBStringField;
    ProvDataSetDB_SCH_TYPE: TFIBIntegerField;
    ProvDataSetDB_TYPE_OBJECT: TFIBIntegerField;
    ProvDataSetDB_SCH_OBJ_TYPE_TITLE: TFIBStringField;
    ProvDataSetDB_SCH_TYPE_TITLE: TFIBStringField;
    ProvDataSetDB_ID_SYSTEM: TFIBIntegerField;
    ProvDataSetKR_ID_SCH: TFIBIntegerField;
    ProvDataSetKR_SCH_TITLE: TFIBStringField;
    ProvDataSetKR_SCH_NUMBER: TFIBStringField;
    ProvDataSetKR_SCH_TYPE: TFIBIntegerField;
    ProvDataSetKR_TYPE_OBJECT: TFIBIntegerField;
    ProvDataSetKR_SCH_OBJ_TYPE_TITLE: TFIBStringField;
    ProvDataSetKR_SCH_TYPE_TITLE: TFIBStringField;
    ProvDataSetKR_ID_SYSTEM: TFIBIntegerField;
    ProvDataSetFORMULA: TFIBStringField;
    cxOperProvGridDBTableView1ID_OPER: TcxGridDBColumn;
    cxOperProvGridDBTableView1DB_ID_SCH: TcxGridDBColumn;
    cxOperProvGridDBTableView1DB_SCH_TITLE: TcxGridDBColumn;
    cxOperProvGridDBTableView1DB_SCH_NUMBER: TcxGridDBColumn;
    cxOperProvGridDBTableView1DB_SCH_TYPE: TcxGridDBColumn;
    cxOperProvGridDBTableView1DB_TYPE_OBJECT: TcxGridDBColumn;
    cxOperProvGridDBTableView1DB_SCH_OBJ_TYPE_TITLE: TcxGridDBColumn;
    cxOperProvGridDBTableView1DB_SCH_TYPE_TITLE: TcxGridDBColumn;
    cxOperProvGridDBTableView1DB_ID_SYSTEM: TcxGridDBColumn;
    cxOperProvGridDBTableView1KR_ID_SCH: TcxGridDBColumn;
    cxOperProvGridDBTableView1KR_SCH_TITLE: TcxGridDBColumn;
    cxOperProvGridDBTableView1KR_SCH_NUMBER: TcxGridDBColumn;
    cxOperProvGridDBTableView1KR_SCH_TYPE: TcxGridDBColumn;
    cxOperProvGridDBTableView1KR_TYPE_OBJECT: TcxGridDBColumn;
    cxOperProvGridDBTableView1KR_SCH_OBJ_TYPE_TITLE: TcxGridDBColumn;
    cxOperProvGridDBTableView1KR_SCH_TYPE_TITLE: TcxGridDBColumn;
    cxOperProvGridDBTableView1KR_ID_SYSTEM: TcxGridDBColumn;
    cxOperProvGridDBTableView1FORMULA: TcxGridDBColumn;
    ProvDataSetID_PROV: TFIBIntegerField;
    OperDataSetID_OPER: TFIBBCDField;
    OperDataSetNAME: TFIBStringField;
    OperDataSetTIP: TFIBIntegerField;
    OperDataSetLINKTO: TFIBBCDField;
    OperDataSetUSE_DOG: TFIBIntegerField;
    OperDataSetID_PROP_DB_SCH: TFIBBCDField;
    OperDataSetN_PP_PROP_DB_SCH: TFIBIntegerField;
    OperDataSetNAME_PROP_DB_SCH: TFIBStringField;
    OperDataSetID_PROP_KR_SCH: TFIBBCDField;
    OperDataSetN_PP_PROP_KR_SCH: TFIBIntegerField;
    OperDataSetNAME_PROP_KR_SCH: TFIBStringField;
    MainImageList: TImageList;
    ChooseDoc: TSpeedButton;
    N1: TMenuItem;
    OperDataSetIS_CHANGE_ISTFIN: TFIBIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure ModifyButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure cxOperBaseGridDBTableView1DblClick(Sender: TObject);
    procedure cxOperBaseGridDBTableView1KeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure ChooseDocClick(Sender: TObject);
    procedure cxOperBaseGridClick(Sender: TObject);
    procedure cxOperBaseGridDBTableView1CellClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxOperTreeGridDBTableView1CellClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
   DBHANDLE : TISC_DB_HANDLE;
   ID_USER : Int64;
  public
   ResultArray: Variant;
   constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE);overload;
  end;

  function GetOper(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; ID_TIPD: integer):Variant;stdcall;
  procedure ShowSpOper(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
  exports GetOper;
  exports ShowSpOper;

var
  SpOperForm: TSpOperForm;

implementation

uses uSpOperTreeEdit, uSpOperProvEdit, uSpOperTipD, uSpWorkDoc;
{$R *.dfm}

constructor TSpOperForm.Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
  Self.DBHANDLE := DBHandle;
  Self.SpOperDatabase.Close;
  Self.SpOperDatabase.Handle:=DBHANDLE;
  Self.CancelButton.Align := alRight;
  Self.OkButton.Align := alRight;
  Self.AddButton.Caption:=MAT_ACTION_ADD_CONST;
  Self.DeleteButton.Caption:=MAT_ACTION_DELETE_CONST;
  Self.ModifyButton.Caption:=MAT_ACTION_UPDATE_CONST;
  Self.RefreshButton.Caption:=MAT_ACTION_REFRESH_CONST;
  Self.OkButton.Caption:=MAT_ACTION_CHOOSE_CONST;
  Self.CancelButton.Caption:=MAT_ACTION_CLOSE_CONST;
  Self.cxOperTreeGridDBTableView1NAME.Caption:=MAT_STR_COL_NAME;
  Self.cxOperBaseGridDBTableView1NAME.Caption:=MAT_STR_COL_NAME;
  Self.cxOperProvGridDBTableView1DB_SCH_NUMBER.Caption:=MAT_STR_COL_DB;
  Self.cxOperProvGridDBTableView1KR_SCH_NUMBER.Caption:=MAT_STR_COL_KR;
  Self.NAdd.Caption:=MAT_ACTION_ADD_CONST;
  Self.NEdit.Caption:=MAT_ACTION_UPDATE_CONST;
  Self.NDel.Caption:=MAT_ACTION_DELETE_CONST;
  Self.NRefr.Caption:=MAT_ACTION_REFRESH_CONST;
  Self.CancelButton.Align := alRight;
  TreeDataSet.CloseOpen(True);
  OperDataSet.CloseOpen(false);
  ProvDataSet.CloseOpen(false);
  if (MatasCheckAccess('/ROOT/MATAS/SPRAV/SP_OPER','Edit', false)<>0) then
  begin
   Self.AddButton.Enabled:=false;
   Self.DeleteButton.Enabled:=false;
   Self.ModifyButton.Enabled:=false;
   Self.NAdd.Enabled:=false;
   Self.NEdit.Enabled:=false;
   Self.NDel.Enabled:=false;
  end;
 end;
 Caption:=MAT_SYS_PREFIX+' :: '+MAT_STR_MAIN_MENU_SPR_OPER;
 ChooseDoc.Enabled:=False;
end;

function GetOper(AOwner:TComponent; DBHANDLE:TISC_DB_HANDLE; aID_USER : INT64; ID_TIPD: integer):Variant;
var
 form : TSpOperForm;
 f: TDocWorkoperForm;
 sprav:Integer;
 ResultArray: Variant;
begin
  if ID_TIPD<>0 then
   begin
     f := TDocWorkoperForm.Create(AOwner, DBHANDLE, ID_TIPD);
     f.ShowModal;
     sprav:=f.sprav;
     if sprav=0 then
     begin
      ResultArray := VarArrayCreate([0,2], varVariant);
      ResultArray[0] := f.id_oper;
      ResultArray[1] := 0;
      ResultArray[2] := 0;
      GetOper := ResultArray;
      f.Free;
     end
     else
     begin
      f.Free;
      form := TSpOperForm.Create(AOwner, DBHANDLE);
      form.ID_USER := aID_USER;
      form.OkButton.Visible := True;
      form.ShowModal;
      GetOper := form.ResultArray;
      form.Free;
     end;
   end
   else
   begin
     form := TSpOperForm.Create(AOwner, DBHANDLE);
     form.ID_USER := aID_USER;
     form.OkButton.Visible := True;
     form.ShowModal;
     GetOper := form.ResultArray;
     form.Free;
   end;
end;

procedure ShowSpOper(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
var
 form : TSpOperForm;
begin
 form := TSpOperForm.Create(AOwner,DBHANDLE);
 form.ID_USER := aID_USER;
 form.FormStyle := fsMDIChild;
 form.OkButton.Visible := False;
 form.cxOperTreeGrid.SetFocus;
end;

procedure TSpOperForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 SpOperFormStorage.SaveFormPlacement;
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TSpOperForm.FormCreate(Sender: TObject);
begin
 SpOperFormStorage.RestoreFormPlacement;
end;

procedure TSpOperForm.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TSpOperForm.AddButtonClick(Sender: TObject);
var
 fmt: TSpOperEditForm;
 fmp: TSpOperProvForm;
 s: string;
 id, linkto, is_istfin: integer;
 use_dog: integer;
begin
 if cxOperTreeGrid.IsFocused then
 begin
  fmt:=TSpOperEditForm.Create(self);
  fmt.ShowModal;
  if (fmt.ModalResult=mrOk) and (fmt.cxNameEdit.Text<>'') then
  begin
   try
    s:=fmt.cxNameEdit.Text;
    StoredProc.Transaction := WriteTransaction;
    StoredProc.Transaction.StartTransaction;
    StoredProc.StoredProcName:='MAT_SP_OPER_TREE_INSERT';
    StoredProc.Prepare;
    StoredProc.ExecProcedure('MAT_SP_OPER_TREE_INSERT', [s]);
    StoredProc.Transaction.Commit;
    id:=StoredProc.ParamByName('ID_OPER').AsInteger;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     StoredProc.Transaction.Rollback;
     exit;
    end;
   end;
  end;
  fmt.Free;
  TreeDataSet.CloseOpen(False);
  TreeDataSet.Locate('ID_OPER', ID, []);
  OperDataSet.CloseOpen(false);
  ProvDataSet.CloseOpen(false);
 end;
 if cxOperBaseGrid.IsFocused then
 begin
  s:='';
  id:=-1;
  linkto:=TreeDataSet.FieldByName('ID_OPER').AsInteger;
  try
   StoredProc.Transaction := WriteTransaction;
   StoredProc.Transaction.StartTransaction;
   StoredProc.StoredProcName:='MAT_SP_OPER_BASE_INSERT';
   StoredProc.Prepare;
   StoredProc.ExecProcedure('MAT_SP_OPER_BASE_INSERT', [linkto, s, 0]);
   StoredProc.Transaction.Commit;
   id:=StoredProc.ParamByName('ID_OPER').AsInteger;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     StoredProc.Transaction.Rollback;
     exit;
   end;
  end;
  fmp:=TSpOperProvForm.Create(self);
  fmp.ID_OPER:=id;
  fmp.ProvDB.Handle:=SpOperDatabase.Handle;
  fmp.ProvDataSet.ParamByName('ID_OPER').Value:=id;
  fmp.ProvDataSet.CloseOpen(true);
  fmp.ShowModal;
  if (fmp.ModalResult=mrOk) and (fmp.cxNameEdit.Text<>'') then begin
   try
    s:=fmp.cxNameEdit.Text;
//    if fmp.cxUseDog.Checked then
//     use_dog:=1
//    else
    use_dog:=0;
    if fmp.cxIStfin.Checked then is_istfin:=1 else is_istfin:=0;
    StoredProc.Transaction := WriteTransaction;
    StoredProc.Transaction.StartTransaction;
    StoredProc.StoredProcName:='MAT_SP_OPER_BASE_UPDATE';
    StoredProc.Prepare;
    StoredProc.ExecProcedure('MAT_SP_OPER_BASE_UPDATE', [id, s, use_dog, is_istfin]);
    StoredProc.Transaction.Commit;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     StoredProc.Transaction.Rollback;
     exit;
    end;
   end;
  end
  else begin
   try
    StoredProc.Transaction := WriteTransaction;
    StoredProc.Transaction.StartTransaction;
    StoredProc.StoredProcName:='MAT_SP_OPER_BASE_DELETE';
    StoredProc.Prepare;
    StoredProc.ExecProcedure('MAT_SP_OPER_BASE_DELETE', [id]);
    StoredProc.Transaction.Commit;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     StoredProc.Transaction.Rollback;
     exit;
    end;
   end;
  end;
  fmp.Free;
  OperDataSet.CloseOpen(false);
  OperDataSet.Locate('ID_OPER', ID, []);
  ProvDataSet.CloseOpen(false);
 end;
end;

procedure TSpOperForm.ModifyButtonClick(Sender: TObject);
var
 fmt: TSpOperEditForm;
 fmp: TSpOperProvForm;
 vals : array of Variant;
 s: string;
 id, is_istfin: integer;
 use_dog: integer;
begin
 if cxOperTreeGrid.IsFocused then
 begin
  id:=TreeDataSet.FieldByName('ID_OPER').AsInteger;
  s:=TreeDataSet.FieldByName('NAME').AsString;
  fmt:=TSpOperEditForm.Create(self);
  fmt.cxNameEdit.Text:=s;
  fmt.ShowModal;
  if (fmt.ModalResult=mrOk) and (fmt.cxNameEdit.Text<>'') then
  begin
   try
    s:=fmt.cxNameEdit.Text;
    SetLength(Vals, 2);
    Vals[0] := id;
    Vals[1] := s;
    StoredProc.Transaction := WriteTransaction;
    StoredProc.Transaction.StartTransaction;
    StoredProc.StoredProcName:='MAT_SP_OPER_TREE_UPDATE';
    StoredProc.Prepare;
    StoredProc.ExecProcedure('MAT_SP_OPER_TREE_UPDATE', vals);
    StoredProc.Transaction.Commit;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     StoredProc.Transaction.Rollback;
     exit;
    end;
   end;
  end;
  fmt.Free;
  TreeDataSet.CloseOpen(False);
  TreeDataSet.Locate('ID_OPER', ID, []);
  OperDataSet.CloseOpen(false);
  ProvDataSet.CloseOpen(false);
 end;
 if cxOperBaseGrid.IsFocused then
 begin
  fmp:=TSpOperProvForm.Create(self);
  id:=OperDataSet.FieldByName('ID_OPER').AsInteger;
  fmp.cxNameEdit.Text:=OperDataSet.FieldByName('NAME').AsString;
  fmp.ID_OPER:=id;
  fmp.ID_PROP_DB_SCH:=OperDataSet.FieldByName('ID_PROP_DB_SCH').AsInteger;
  fmp.ID_PROP_KR_SCH:=OperDataSet.FieldByName('ID_PROP_KR_SCH').AsInteger;
  if fmp.ID_PROP_DB_SCH=0 then fmp.cxCheckDBProp.Checked:=false;
  if fmp.ID_PROP_KR_SCH=0 then fmp.cxCheckKRProp.Checked:=false;
  if OperDataSet.FieldByName('IS_CHANGE_ISTFIN').AsInteger=0 then fmp.cxIstfin.Checked:=False else fmp.cxIstfin.Checked:=True;
  fmp.cxPropDbSch.Text:=IntToStr(OperDataSet.FieldByName('N_PP_PROP_DB_SCH').AsInteger)+' '+OperDataSet.FieldByName('NAME_PROP_DB_SCH').AsString;
  fmp.cxPropKrSch.Text:=IntToStr(OperDataSet.FieldByName('N_PP_PROP_KR_SCH').AsInteger)+' '+OperDataSet.FieldByName('NAME_PROP_KR_SCH').AsString;
  fmp.ProvDB.Handle:=SpOperDatabase.Handle;
  fmp.ProvDataSet.ParamByName('ID_OPER').Value:=id;
  fmp.ProvDataSet.CloseOpen(true);
//  fmp.cxUseDog.Checked:=OperDataSetUSE_DOG.AsBoolean;
  fmp.ShowModal;
  if (fmp.ModalResult=mrOk) and (fmp.cxNameEdit.Text<>'') then begin
   try
    s:=fmp.cxNameEdit.Text;
//    if fmp.cxUseDog.Checked then
//     use_Dog:=1
//    else
    use_dog:=0;
    if fmp.cxIStfin.Checked then is_istfin:=1 else is_istfin:=0;
    StoredProc.Transaction := WriteTransaction;
    StoredProc.Transaction.StartTransaction;
    StoredProc.StoredProcName:='MAT_SP_OPER_BASE_UPDATE';
    StoredProc.Prepare;
    StoredProc.ExecProcedure('MAT_SP_OPER_BASE_UPDATE', [id, s, use_dog, is_istfin]);
    StoredProc.Transaction.Commit;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     StoredProc.Transaction.Rollback;
     exit;
    end;
   end;
  end;
  fmp.Free;
  OperDataSet.CloseOpen(false);
  OperDataSet.Locate('ID_OPER', ID, []);
  ProvDataSet.CloseOpen(false);
 end;
end;

procedure TSpOperForm.DeleteButtonClick(Sender: TObject);
var
 id: integer;
begin
 if cxOperTreeGrid.IsFocused then
 begin
  if agMessageDlg('Удаление', 'Вы действительно желаете удалить раздел?', mtConfirmation, [mbYes, mbNo]) = ID_YES  then
  begin
   try
    id:=TreeDataSet.FieldByName('ID_OPER').AsInteger;
    StoredProc.Transaction := WriteTransaction;
    StoredProc.Transaction.StartTransaction;
    StoredProc.StoredProcName:='MAT_SP_OPER_TREE_DELETE';
    StoredProc.Prepare;
    StoredProc.ExecProcedure('MAT_SP_OPER_TREE_DELETE', [id]);
    StoredProc.Transaction.Commit;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     StoredProc.Transaction.Rollback;
     exit;
    end;
   end;
   TreeDataSet.CloseOpen(False);
   OperDataSet.CloseOpen(false);
   ProvDataSet.CloseOpen(false);
  end;
 end;
 if cxOperBaseGrid.IsFocused then
 begin
  if agMessageDlg('Удаление', 'Вы действительно желаете удалить запись?', mtConfirmation, [mbYes, mbNo]) = ID_YES  then
  begin
   try
    id:=OperDataSet.FieldByName('ID_OPER').AsInteger;
    StoredProc.Transaction := WriteTransaction;
    StoredProc.Transaction.StartTransaction;
    StoredProc.StoredProcName:='MAT_SP_OPER_BASE_DELETE';
    StoredProc.Prepare;
    StoredProc.ExecProcedure('MAT_SP_OPER_BASE_DELETE', [id]);
    StoredProc.Transaction.Commit;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     StoredProc.Transaction.Rollback;
     exit;
    end;
   end;
   OperDataSet.CloseOpen(false);
   ProvDataSet.CloseOpen(false);
  end;
 end;
end;

procedure TSpOperForm.RefreshButtonClick(Sender: TObject);
begin
  TreeDataSet.CloseOpen(True);
  OperDataSet.CloseOpen(false);
  ProvDataSet.CloseOpen(false);
end;

procedure TSpOperForm.OkButtonClick(Sender: TObject);
begin
 if Not Self.OperDataSet.IsEmpty
  then begin
   ResultArray := VarArrayCreate([0,2], varVariant);
   ResultArray[0] := Self.OperDataSet['ID_OPER'];
   ResultArray[1] := Self.OperDataSet['NAME'];
   ResultArray[2] := Self.OperDataSetUSE_DOG.AsInteger;
  end;
 Close;
end;

procedure TSpOperForm.cxOperBaseGridDBTableView1DblClick(Sender: TObject);
begin
 OkButtonClick(self);
end;

procedure TSpOperForm.cxOperBaseGridDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (Key=VK_RETURN) and (OkButton.Visible) then
   OkButton.Click;
end;

procedure TSpOperForm.ChooseDocClick(Sender: TObject);
var  T: TOperTipDForm;
     id: Integer;
     name: string;
begin
   id:= OperDataSet.FieldByName('ID_OPER').AsInteger;
   name:= OperDataSet.FieldByName('NAME').AsString;
   T:=TOperTipDForm.Create(self, DBHANDLE, id, name);
   T.ShowModal;
   T.Free;
end;

procedure TSpOperForm.cxOperBaseGridClick(Sender: TObject);
var link: integer;
begin

end;

procedure TSpOperForm.cxOperBaseGridDBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
Self.ChooseDoc.Enabled:=True;
end;

procedure TSpOperForm.cxOperTreeGridDBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  Self.ChooseDoc.Enabled:=False;
end;

end.
