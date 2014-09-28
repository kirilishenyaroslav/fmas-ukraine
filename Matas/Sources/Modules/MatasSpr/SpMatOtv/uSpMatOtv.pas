{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uSpMatOtv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, FIBDatabase, pFIBDatabase, ibase,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, FIBQuery, pFIBQuery, FIBDataSet, pFIBDataSet, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxGridBandedTableView,
  cxStyles, cxTL, cxMaskEdit, cxInplaceContainer,
  cxDBTL, cxTLData, uResources, Menus, StdCtrls, FR_Class, FR_DSet,
  FR_DBSet, uMatasUtils, cxContainer, cxTextEdit, cxDropDownEdit,
  cxCheckListBox, cxDBCheckListBox, cxCheckBox, pFIBStoredProc,
  uMatasPrintForm, uMatasVars, cxDBEdit, Placemnt, ImgList, ActnList;
//  AGPrintGridUnit;

type

  TFormMode = (fmSimple, fmMulti);

  TfmSpMatOtv = class(TForm)
    TopPanel: TPanel;
    AddButton: TSpeedButton;
    ModifyButton: TSpeedButton;
    DeleteButton: TSpeedButton;
    OkButton: TSpeedButton;
    CancelButton: TSpeedButton;
    RefreshButton: TSpeedButton;
    MatOtvDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DefaultTransaction: TpFIBTransaction;
    MatOtvDataSet: TpFIBDataSet;
    MatOtvDataSource: TDataSource;
    MatOtvDataSetID_SPODR: TFIBIntegerField;
    MatOtvDataSetID_MAN: TFIBIntegerField;
    MatOtvDataSetFIO: TFIBStringField;
    MatOtvDataSetNAME_DEPARTMENT: TFIBStringField;
    MatOtvDataSetID_MO: TFIBIntegerField;
    MoPopupMenu: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
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
    PrintButton: TSpeedButton;
    frReportMOL: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    MatOtvDataSetSFIO: TFIBStringField;
    MatOtvDataSetIS_SKLAD: TFIBSmallIntField;
    MatOtvDataSetDISABLE: TFIBSmallIntField;
    MatOtvDataSetSKLAD: TStringField;
    cxFilter: TcxComboBox;
    WorkStoredProc: TpFIBStoredProc;
    MatOtvDataSetCHECKED: TFIBIntegerField;
    PrintDataSet: TpFIBDataSet;
    StoredProc: TpFIBStoredProc;
    MatOtvDataSetDATE_BEG: TFIBDateField;
    MatOtvDataSetDATE_END: TFIBDateField;
    MatOtvDataSetCOMMENT: TFIBStringField;
    PanelInfo: TPanel;
    PanelData: TPanel;
    MatOtvGrid: TcxGrid;
    MatOtvGridDBTableView1: TcxGridDBTableView;
    MatOtvGridDBTableView1CHECK: TcxGridDBColumn;
    MatOtvGridDBTableView1FIO: TcxGridDBColumn;
    MatOtvGridDBTableView1NAME_DEPARTMENT: TcxGridDBColumn;
    MatOtvGridDBTableView1SKLAD: TcxGridDBColumn;
    MatOtvGridLevel1: TcxGridLevel;
    cxDBTextEdit1: TcxDBTextEdit;
    SpFormStorage: TFormStorage;
    MatOtvDataSetEXPIRED: TFIBIntegerField;
    MatOtvGridDBTableView1EXPIRED: TcxGridDBColumn;
    MainImageList: TImageList;
    actlst1: TActionList;
    actShowHistory: TAction;
    cxgrdbclmnMatOtvGridDBTableView1DBColumn1: TcxGridDBColumn;
    MatOtvDataSetN_N: TIntegerField;
    MatOtvGridDBTableView1Web: TcxGridDBColumn;
    MatOtvDataSetIS_GET_WEB_DATA: TFIBIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure ModifyButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure MatOtvGridDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MatOtvGridDBTableView1DblClick(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure MoPopupMenuPopup(Sender: TObject);
    procedure MatOtvDataSetCalcFields(DataSet: TDataSet);
    procedure cxFilterPropertiesChange(Sender: TObject);
    procedure MatOtvGridDBTableView1CellClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure MatOtvCheck(f:boolean) ;
    procedure FormResize(Sender: TObject);
    procedure MatOtvGridDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure actShowHistoryExecute(Sender: TObject);

  private
    DBHANDLE : TISC_DB_HANDLE;
    ID_USER : Int64;
    MODE: TFormMode;
    ID_SESSION: int64;
    PROC_NAME: string;

  public
    ResultArray:Variant;
    FormResult: boolean;
    constructor Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; aID_MO: integer; aID_SESSION: int64; aMODE: TFormMode; aPROC_NAME: string);overload;
  end;

    function GetMOSelectProcName(f: boolean): string;

    function GetMatOtv(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aID_MO: integer):Variant;stdcall;
    function GetMatOtvMulti(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aID_SESSION: INT64):boolean;stdcall;
    procedure ShowSpMatOtv(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;

    exports GetMatOtv;
    exports ShowSpMatOtv;
    exports GetMatOtvMulti;

var
  fmSpMatOtv: TfmSpMatOtv;

implementation

uses uSpMatOtvAdd, uSpMatOtvPrint, uSpMatOtvHistory;

{$R *.dfm}
function GetMOSelectProcName(f: boolean): string;
begin
 if (_USE_EXT_ACCESS_FOR_MO=0) then
  Result:='MAT_SP_MO_SELECT'
 else
  Result:='MAT_SP_MO_SELECT_BY_USER('+IntToStr(_CURRENT_USER_ID)+')';
 if f then
  if (MatasCheckAccess('/ROOT/MATAS/ADMIN','Belong', false)=0) then
   Result:='MAT_SP_MO_SELECT_FULL';
end;

constructor TfmSpMatOtv.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; aID_MO: integer; aID_SESSION: int64; aMODE: TFormMode; aPROC_NAME: string);
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then
 begin
  Self.PROC_NAME:=aPROC_NAME;
  Self.Caption := MAT_SYS_PREFIX+MAT_FORMCAP_SP_MO;
  Self.DBHANDLE := DBHandle;
  Self.MatOtvDatabase.Close;
  Self.MatOtvDatabase.Handle := DBHANDLE;
  Self.FormStyle := fsNormal;
  Self.CancelButton.Align := alRight;
  Self.OkButton.Align := alRight;
  Self.MODE:=aMODE;
  Self.ID_SESSION:=aID_SESSION;
  Self.FormResult:=false;
  if aMODE=fmMulti then
  begin
   Self.cxFilter.Visible:=false;
   with Self.MatOtvDataSet.SelectSQL do
   begin
    Clear;
    Add('SELECT * FROM MAT_SP_MO_SELECT_EX(:ID_SESSION)');
    Add('ORDER BY FIO COLLATE WIN1251_UA');
   end;
   Self.MatOtvDataSet.RefreshSQL.Add('SELECT * FROM MAT_SP_MO_SELECT_EX(:ID_SESSION) WHERE ID_MO=:ID_MO');
   Self.MatOtvDataSet.Prepare;
   Self.MatOtvDataSet.ParamByName('ID_SESSION').AsInt64:=aID_SESSION;
  end
  else
  begin
   with Self.MatOtvDataSet.SelectSQL do
   begin
    Clear;
    Add('SELECT * FROM '+PROC_NAME);
    Add('ORDER BY FIO COLLATE WIN1251_UA, NAME_DEPARTMENT');
   end;
  end;
  Self.MatOtvDataSet.CloseOpen(False);
  if aMODE=fmSimple then
  begin
   Self.MatOtvGridDBTableView1Check.Visible:=false;
   if aID_MO>0 then
    Self.MatOtvDataSet.Locate('ID_MO',aID_MO,[])
   else
    Self.MatOtvDataSet.First;
  end;
  Self.AddButton.Caption:=MAT_ACTION_ADD_CONST;
  Self.DeleteButton.Caption:=MAT_ACTION_DELETE_CONST;
  Self.ModifyButton.Caption:=MAT_ACTION_UPDATE_CONST;
  Self.RefreshButton.Caption:=MAT_ACTION_REFRESH_CONST;
  Self.OkButton.Caption:=MAT_ACTION_CHOOSE_CONST;
  Self.PrintButton.Caption:=MAT_ACTION_PRINT_CONST;
  Self.CancelButton.Caption:=MAT_ACTION_CLOSE_CONST;
  Self.MatOtvGridDBTableView1FIO.Caption:=MAT_STR_COL_FIO;
  Self.MatOtvGridDBTableView1NAME_DEPARTMENT.Caption:=MAT_STR_COL_DEP;
  Self.N1.Caption:=MAT_ACTION_ADD_CONST;
  Self.N2.Caption:=MAT_ACTION_UPDATE_CONST;
  Self.N3.Caption:=MAT_ACTION_DELETE_CONST;
  Self.N5.Caption:=MAT_ACTION_FIND_CONST;
  Self.N7.Caption:=MAT_ACTION_REFRESH_CONST;
  Self.cxFilter.ItemIndex:=0;
 end;
 if (MatasCheckAccess('/ROOT/MATAS/SPRAV/SP_MO','Edit', false)<>0) then
 begin
  Self.AddButton.Enabled:=false;
  Self.ModifyButton.Enabled:=false;
  Self.DeleteButton.Enabled:=false;
 end;
 if (MatasCheckAccess('/ROOT/MATAS/Web','Edit', false)=0) then
 MatOtvGridDBTableView1Web.Visible:=True
 else MatOtvGridDBTableView1Web.Visible:=False;
end;

function GetMatOtv(AOwner:TComponent; DBHANDLE:TISC_DB_HANDLE; aID_USER : INT64; aID_MO: integer):Variant;
var
    form : TfmSpMatOtv;
begin
    form := TfmSpMatOtv.Create(AOwner, DBHANDLE, aID_MO, 0, fmSimple, GetMOSelectProcName(false));
    form.ID_USER := aID_USER;
    Form.ShowModal;
    GetMatOtv := form.ResultArray;
    form.Free;
end;

function GetMatOtvMulti(AOwner:TComponent; DBHANDLE:TISC_DB_HANDLE; aID_USER : INT64; aID_SESSION: int64):boolean;
var
    form : TfmSpMatOtv;
begin
    form := TfmSpMatOtv.Create(AOwner, DBHANDLE, 0, aID_SESSION, fmMulti, GetMOSelectProcName(false));
    form.ID_USER := aID_USER;
    form.ShowModal;
    Result:=form.FormResult;
    Form.Free;
end;

procedure ShowSpMatOtv(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
var
   form : TfmSpMatOtv;
begin
    form := TfmSpMatOtv.Create(AOwner, DBHANDLE, 0, 0, fmSimple, GetMOSelectProcName(true));
    form.ID_USER := aID_USER;
    Form.FormStyle := fsMDIChild;
    Form.OkButton.Visible := False;
    Form.SpFormStorage.RestoreFormPlacement;
end;

procedure TfmSpMatOtv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 SpFormStorage.SaveFormPlacement;
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TfmSpMatOtv.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TfmSpMatOtv.RefreshButtonClick(Sender: TObject);
begin
 RefreshDataSet(MatOtvDataSet,'ID_MO');
end;

procedure TfmSpMatOtv.AddButtonClick(Sender: TObject);
var
 Form: TfmSpMatOtvAdd;
 vals: array of Variant;
 id: integer;
begin
 Form := TfmSpMatOtvAdd.Create(self,0,'','',-1,-1, 0, 0, DBHandle,0);
 if Form.ShowModal = mrOk then
 begin
  SetLength(Vals, 5);
  Vals[ 0] := Form.ID_SPODR;
  Vals[ 1] := Form.Id_Man;
  Vals[ 2] := Form.IS_SKLAD;
  Vals[ 3] := Form.cxComment.Text;
  if Form.chkWeb.Checked = True then
  Vals[ 4] := 1 else Vals[ 4] := 0;
  try
    StoredProc.Transaction := WriteTransaction;
    StoredProc.Transaction.StartTransaction;
    StoredProc.StoredProcName:='MAT_SP_MO_INSERT';
    StoredProc.Prepare;
    StoredProc.ExecProcedure('MAT_SP_MO_INSERT', vals);
    StoredProc.Transaction.Commit;
    id:=StoredProc.ParamByName('ID_MO').AsInteger;
  except on E : Exception
   do begin
     ShowMessage(E.Message);
     StoredProc.Transaction.Rollback;
     exit;
   end;
  end;
  MatOtvDataSet.CloseOpen(false);
  MatOtvDataSet.Locate('ID_MO',id,[]);
 end;
end;

procedure TfmSpMatOtv.ModifyButtonClick(Sender: TObject);
var
 form : TfmSpMatOtvAdd;
 id: integer;
 vals: array of Variant;
 is_admin: boolean;
 db, de: TDateTime;
begin
 if MatOtvDataSet.IsEmpty then exit;
 if (MatasCheckAccess('/ROOT/MATAS/ADMIN','Belong', false)=0) then
  is_admin:=true
 else is_admin:=false;
 id:=MatOtvDataSet.FieldByName('ID_MO').AsInteger;
 db:=MatOtvDataSet.FieldByName('DATE_BEG').AsDateTime;
 de:=MatOtvDataSet.FieldByName('DATE_END').AsDateTime;
 Form := TfmSpMatOtvAdd.Create(self,1,MatOtvDataSetFIO.Value,MatOtvDataSetNAME_DEPARTMENT.Value,MatOtvDataSetID_SPODR.AsInteger,MatOtvDataSetID_MAN.AsInteger, MatOtvDataSetIS_SKLAD.AsInteger, MatOtvDataSetDISABLE.AsInteger, DBHandle, MatOtvDataSetIS_GET_WEB_DATA.AsInteger);
 Form.cxComment.Text:=MatOtvDataSet.FieldByName('COMMENT').AsString;
 Form.cxDateBeg.EditValue:=db;
 Form.cxDateEnd.EditValue:=de;
 if is_admin then
 begin
  Form.LabelDB.Visible:=true;
  Form.LabelDE.Visible:=true;
  Form.cxDateBeg.Visible:=true;
  Form.cxDateEnd.Visible:=true;
 end;
 if Form.ShowModal = mrOk then
 begin
  if not is_admin then
  begin
   SetLength(Vals, 6);
   Vals[ 0] := id;
   Vals[ 1] := Form.ID_SPODR;
   Vals[ 2] := Form.Id_Man;
   Vals[ 3] := Form.IS_SKLAD;
   Vals[ 4] := Form.cxComment.Text;
   if Form.chkWeb.Checked = True then
   Vals[ 5] := 1 else Vals[ 5] := 0;
   try
    StoredProc.Transaction := WriteTransaction;
    StoredProc.Transaction.StartTransaction;
    StoredProc.StoredProcName:='MAT_SP_MO_UPDATE';
    StoredProc.Prepare;
    StoredProc.ExecProcedure('MAT_SP_MO_UPDATE', vals);
    StoredProc.Transaction.Commit;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     StoredProc.Transaction.Rollback;
     exit;
    end;
   end;
   RefreshDataSet(MatOtvDataSet,'ID_MO');
  end
  else
  begin
   SetLength(Vals, 10);
   Vals[ 0] := id;
   Vals[ 1] := Form.ID_SPODR;
   Vals[ 2] := Form.Id_Man;
   Vals[ 3] := Form.IS_SKLAD;
   Vals[ 4] := Form.cxComment.Text;
   Vals[ 5] := db;
   Vals[ 6] := de;
   Vals[ 7] := Form.cxDateBeg.EditValue;
   Vals[ 8] := Form.cxDateEnd.EditValue;
   if Form.chkWeb.Checked = True then
   Vals[ 9] := 1 else Vals[ 9] := 0;
   try
    StoredProc.Transaction := WriteTransaction;
    StoredProc.Transaction.StartTransaction;
    StoredProc.StoredProcName:='MAT_SP_MO_UPDATE_EX';
    StoredProc.Prepare;
    StoredProc.ExecProcedure('MAT_SP_MO_UPDATE_EX', vals);
    StoredProc.Transaction.Commit;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     StoredProc.Transaction.Rollback;
     exit;
    end;
   end;
   RefreshDataSet(MatOtvDataSet,'ID_MO');
  end;
 end;
end;

procedure TfmSpMatOtv.DeleteButtonClick(Sender: TObject);
var
 id: integer;
begin
 if MatOtvDataSet.IsEmpty then exit;
 if not AskForDelete then exit;
 id:=MatOtvDataSet.FieldByName('ID_MO').AsInteger;
 try
  StoredProc.Transaction := WriteTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName:='MAT_SP_MO_DELETE';
  StoredProc.Prepare;
  StoredProc.ExecProcedure('MAT_SP_MO_DELETE', [id]);
  StoredProc.Transaction.Commit;
 except on E : Exception
  do begin
    ShowMessage(E.Message);
    StoredProc.Transaction.Rollback;
    exit;
  end;
 end;
 RefreshDataSet(MatOtvDataSet,'ID_MO');
end;

procedure TfmSpMatOtv.FormShow(Sender: TObject);
begin
 OKButton.Visible := not (Self.FormStyle = fsMDIChild);
end;

procedure TfmSpMatOtv.OkButtonClick(Sender: TObject);
begin
 if Not Self.MatOtvDataSet.IsEmpty
 then begin
  ResultArray := VarArrayCreate([0,4],varVariant);
  ResultArray[0] := Self.MatOtvDataSet['ID_MO'];
  ResultArray[1] := Self.MatOtvDataSet['FIO'];
  ResultArray[2] := Self.MatOtvDataSet['NAME_DEPARTMENT'];
  ResultArray[3] := Self.MatOtvDataSet['COMMENT'];
  ResultArray[4] := Self.MatOtvDataSet['SFIO'];
  FormResult:=true;
  Close;
 end;
end;

procedure TfmSpMatOtv.MatOtvGridDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then CancelButton.Click;
  if (OkButton.Visible) and (Key=VK_RETURN) then OkButton.Click;
  if MODE = fmMulti then
   if Key = VK_SPACE then MatOtvCheck(true);
end;

procedure TfmSpMatOtv.MatOtvGridDBTableView1DblClick(Sender: TObject);
begin
    if OkButton.Visible then OkButton.Click;
end;

procedure TfmSpMatOtv.N9Click(Sender: TObject);
begin
 MatOtvGridDBTableView1.ViewData.Collapse(true);
end;

procedure TfmSpMatOtv.N10Click(Sender: TObject);
begin
 MatOtvGridDBTableView1.ViewData.Expand(true);
end;

procedure TfmSpMatOtv.PrintButtonClick(Sender: TObject);
var
 T: TfmSpMatOtvPrint;
begin
 T:=TfmSpMatOtvPrint.Create(self);
 if T.ShowModal=mrOk then
 begin
  if T.cxComboBoxShablon.ItemIndex=0 then
  begin
   PrintDataSet.Close;
   PrintDataSet.SelectSQL.Clear;
   PrintDataSet.SelectSQL.Add('SELECT * FROM MAT_SP_MO_SELECT');
   PrintDataSet.SelectSQL.Add('ORDER BY FIO, NAME_DEPARTMENT');
   PrintDataSet.CloseOpen(false);
   frReportMOL.LoadFromFile(ExtractFilePath(Application.ExeName)+_PATH_REPORTS+'\mol2.frf');
  end;
  if T.cxComboBoxShablon.ItemIndex=1 then
  begin
   PrintDataSet.Close;
   PrintDataSet.SelectSQL.Clear;
   PrintDataSet.SelectSQL.Add('SELECT * FROM MAT_SP_MO_SELECT');
   PrintDataSet.SelectSQL.Add('ORDER BY NAME_DEPARTMENT, FIO');
   PrintDataSet.CloseOpen(false);
   frReportMOL.LoadFromFile(ExtractFilePath(Application.ExeName)+_PATH_REPORTS+'\mol.frf');
  end;
  frReportMOL.PrepareReport;
  frVariables['ORG_NAME']:=_ORG_FULL_NAME;
//  frVariables['ORG_SHORT_NAME']:=_ORG_SHORT_NAME;
  frVariables['ORG_KOD_OKPO']:=_ORG_KOD_OKPO;
  if T.cxCopies.Value>1 then
   frReportMOL.DefaultCopies:=T.cxCopies.Value;
  if T.cxCheckOnPrinter.Checked then
  begin
   if T.cxSelectPrinter.Checked then
    frReportMOL.PrintPreparedReportDlg
   else
    frReportMOL.PrintPreparedReport('', T.cxCopies.Value, false, frAll);
  end
  else
   frReportMOL.ShowReport;
  if T.CheckBoxDoc.Checked then
   frReportMOL.DesignReport;
 end;
 T.Free;
// AGPrintGrid1.ShowReport;
end;

procedure TfmSpMatOtv.MoPopupMenuPopup(Sender: TObject);
begin
 if (MatasCheckAccess('/ROOT/MATAS/SPRAV/SP_MO','Edit', false)<>0) then
 begin
  N1.Enabled:=false;
  N2.Enabled:=false;
  N3.Enabled:=false;
 end;
end;

procedure TfmSpMatOtv.MatOtvDataSetCalcFields(DataSet: TDataSet);
begin
 if MatOtvDataSetIS_SKLAD.Value=1 then
  MatOtvDataSetSKLAD.Value:=MAT_STR_SKLAD_CONST
 else MatOtvDataSetSKLAD.Value:='' ;
 MatOtvDataSetN_N.AsInteger:=MatOtvDataSet.RecNo;
end;

procedure TfmSpMatOtv.cxFilterPropertiesChange(Sender: TObject);
var
 nn: integer;
begin
 nn:=cxFilter.ItemIndex;
 with MatOtvDataSet do
 begin
  Close;
  SelectSQL.Clear;
  if nn=0 then begin
   SelectSQL.Add('SELECT * FROM '+PROC_NAME);
   SelectSQL.Add('ORDER BY FIO COLLATE WIN1251_UA');
  end;
  if nn=1 then begin
   SelectSQL.Add('SELECT * FROM '+PROC_NAME);
   SelectSQL.Add('WHERE IS_SKLAD=1 ORDER BY FIO COLLATE WIN1251_UA');
  end;
  if nn=2 then begin
   SelectSQL.Add('SELECT * FROM '+PROC_NAME);
   SelectSQL.Add('WHERE IS_SKLAD=0 ORDER BY FIO COLLATE WIN1251_UA');
  end;
  CloseOpen(false);
 end;
end;

procedure TfmSpMatOtv.MatOtvCheck(f:boolean);
begin
   try
    WriteTransaction.StartTransaction;
    WorkStoredProc.ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
    WorkStoredProc.ParamByName('ID_KEY').AsInt64:=MatOtvDataSet.FieldByName('ID_MO').AsInteger;
    WorkStoredProc.ParamByName('ID_OBJECT').Value:=1;
    WorkStoredProc.ExecProc;
    WriteTransaction.Commit;
   except on E : Exception
    do begin
     WriteTransaction.Rollback;
     ShowMessage(E.Message);
    end;
   end;
   MatOtvDataSet.Refresh;
   if f then MatOtvDataset.Next;
end;

procedure TfmSpMatOtv.MatOtvGridDBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
 if ACellViewInfo.Item.Index=0 then
 begin
  MatOtvCheck(false);
 end;
 AHandled:=true;
end;

procedure TfmSpMatOtv.FormResize(Sender: TObject);
begin
 cxDBTextEdit1.Width:=Width-13;
end;

procedure TfmSpMatOtv.MatOtvGridDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
 Arect: TRect;
begin
  Arect:=AViewInfo.Bounds;
  if (AViewInfo.GridRecord.Values[1] = 1)  then
  begin
   ACanvas.Canvas.Font.Color := clGray;
   ACanvas.Canvas.FillRect(Arect);
  end;
end;

procedure TfmSpMatOtv.actShowHistoryExecute(Sender: TObject);
var form:TSpMatOtvHistoryForm;
begin
 if MatOtvDataSet.IsEmpty then Exit;
 Form:=TSpMatOtvHistoryForm.Create(Self);
 Form.id:=MatOtvDataSet.FieldValues['ID_MO'];
 Form.ShowModal;
 Form.Free;
end;

end.
