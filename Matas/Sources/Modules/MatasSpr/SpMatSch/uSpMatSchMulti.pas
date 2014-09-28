{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uSpMatSchMulti;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ibase, FIBDatabase, pFIBDatabase,
  uResources, Buttons, ExtCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, FIBDataSet, FIBQuery,
  pFIBQuery, pFIBDataSet, cxTL, cxMaskEdit, cxInplaceContainer, cxDBTL,
  cxSplitter, cxTLData, cxTextEdit, ImgList, cxCurrencyEdit, ActnList,
  pFIBStoredProc, cxCheckBox,   uMatasUtils, uMatasVars, cxSpinEdit,
  cxContainer, cxDropDownEdit, StdCtrls;

type
  TMatSchFormMulti = class(TForm)
    fdbMatSch: TpFIBDatabase;
    TopPanel: TPanel;
    OkButton: TSpeedButton;
    RefreshButton: TSpeedButton;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    MatSchDataSet: TpFIBDataSet;
    MatSchDataSource: TDataSource;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    MatSchDataSetID_SCH: TFIBIntegerField;
    MatSchDataSetSCH_TITLE: TFIBStringField;
    MatSchDataSetSCH_NUMBER: TFIBStringField;
    MatSchDataSetSCH_TYPE: TFIBIntegerField;
    MatSchDataSetLINK_TO: TFIBIntegerField;
    MatSchDataSetDATE_BEG: TFIBDateTimeField;
    MatSchDataSetDATE_END: TFIBDateTimeField;
    MatSchDataSetTYPE_OBJECT: TFIBIntegerField;
    MatSchDataSetSCH_OBJ_TYPE_TITLE: TFIBStringField;
    MatSchDataSetSCH_TYPE_TITLE: TFIBStringField;
    MatSchDataSetID_SYSTEM: TFIBIntegerField;
    CancelButton: TSpeedButton;
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
    MatSchDataSetBAL_ID_SCH: TFIBIntegerField;
    MatSchDataSetBAL_SCH_NUMBER: TFIBStringField;
    MatSchDataSetBAL_SCH_TITLE: TFIBStringField;
    MatSchDataSetSYSTEM_TEXT: TFIBStringField;
    MatSchDataSetKOD_SYSTEM: TFIBIntegerField;
    MatSchDataSetIS_BLOCKED: TFIBIntegerField;
    MatSchDataSetOPEN_SCH: TFIBDateField;
    MatSchDataSetID_REG_UCH: TFIBIntegerField;
    ActionList1: TActionList;
    acExit: TAction;
    MatSchDataSetTIP_SCH: TFIBIntegerField;
    MatSchDataSetCHECKED: TFIBIntegerField;
    cxGrid1DBTableView1ID_SCH: TcxGridDBColumn;
    cxGrid1DBTableView1SCH_TITLE: TcxGridDBColumn;
    cxGrid1DBTableView1SCH_NUMBER: TcxGridDBColumn;
    cxGrid1DBTableView1SCH_TYPE: TcxGridDBColumn;
    cxGrid1DBTableView1LINK_TO: TcxGridDBColumn;
    cxGrid1DBTableView1DATE_BEG: TcxGridDBColumn;
    cxGrid1DBTableView1DATE_END: TcxGridDBColumn;
    cxGrid1DBTableView1TYPE_OBJECT: TcxGridDBColumn;
    cxGrid1DBTableView1SCH_OBJ_TYPE_TITLE: TcxGridDBColumn;
    cxGrid1DBTableView1SCH_TYPE_TITLE: TcxGridDBColumn;
    cxGrid1DBTableView1ID_SYSTEM: TcxGridDBColumn;
    cxGrid1DBTableView1BAL_ID_SCH: TcxGridDBColumn;
    cxGrid1DBTableView1BAL_SCH_NUMBER: TcxGridDBColumn;
    cxGrid1DBTableView1BAL_SCH_TITLE: TcxGridDBColumn;
    cxGrid1DBTableView1SYSTEM_TEXT: TcxGridDBColumn;
    cxGrid1DBTableView1KOD_SYSTEM: TcxGridDBColumn;
    cxGrid1DBTableView1IS_BLOCKED: TcxGridDBColumn;
    cxGrid1DBTableView1OPEN_SCH: TcxGridDBColumn;
    cxGrid1DBTableView1ID_REG_UCH: TcxGridDBColumn;
    cxGrid1DBTableView1TIP_SCH: TcxGridDBColumn;
    cxGrid1DBTableView1CHECKED: TcxGridDBColumn;
    WorkStoredProc: TpFIBStoredProc;
    MatSchDataSetBAL_SCH: TStringField;
    MatSchDataSetSUB_SCH: TStringField;
    LabelPeriod: TLabel;
    cxMonth: TcxComboBox;
    cxYear: TcxSpinEdit;
    cxSystem: TcxComboBox;
    WorkQuery: TpFIBQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure cxGrid1DblClick(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SchCheck(f: boolean);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure MatSchDataSetCalcFields(DataSet: TDataSet);
    procedure cxComboBox1PropertiesChange(Sender: TObject);
    procedure OpenMatSchDataSet;
  private
   DBHANDLE : TISC_DB_HANDLE;
   ID_USER : Int64;
  public
   ID_SESSION: int64;
   ResultArray: Variant;
   FormResult: boolean;
   constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_SESSION: int64);overload;
  end;

  function GetMatSchMulti(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aID_SESSION: int64; var aResult: boolean):Variant; stdcall;

  exports GetMatSchMulti;

var
  MatSchFormMulti: TMatSchFormMulti;

implementation

{$R *.dfm}

constructor TMatSchFormMulti.Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_SESSION: int64);
var
  dd, dm, dy: Word;
begin
 inherited Create(AOwner);
 Caption:=MAT_SYS_PREFIX + MAT_FORMCAP_SP_MATSCH;
 if Assigned(DBHandle)
 then begin
  Self.fdbMatSch.Close;
  Self.DBHANDLE := DBHandle;
  Self.fdbMatSch.Handle := DBHANDLE;
  Self.ID_SESSION:=aID_SESSION;
  Self.MatSchDataSet.ParamByName('DATE').Value:=_MATAS_PERIOD;
  Self.MatSchDataSet.ParamByName('ID_SESSION').AsInt64:=aID_SESSION;
  Self.MatSchDataSet.CloseOpen(False);
  Self.MatSchDataSet.RefreshSQL.Add('SELECT * FROM MAT_SP_SCH_SELECT_FILTER(:DATE, :ID_SESSION) WHERE ID_SCH=:ID_SCH');
 end;
 DecodeDate(_MATAS_PERIOD, dy, dm, dd);
 LoadMonthTocxComboBox(Self.cxMonth);
 Self.cxMonth.ItemIndex:=dm-1;
 Self.cxYear.Value:=dy;
 Self.LabelPeriod.Caption:=MAT_STR_COL_PERIOD;
 Self.RefreshButton.Caption:=MAT_ACTION_REFRESH_CONST;
 Self.OkButton.Caption:=MAT_ACTION_CHOOSE_CONST;
 Self.CancelButton.Caption:=MAT_ACTION_CLOSE_CONST;
 Self.cxGrid1DBTableView1SCH_NUMBER.Caption:=MAT_STR_COL_SUB_SCH;
 Self.cxGrid1DBTableView1BAL_SCH_NUMBER.Caption:=MAT_STR_COL_SCH;
 Self.cxGrid1DBTableView1SCH_TITLE.Caption:=MAT_STR_COL_NAME;
 Self.CancelButton.Align := alRight;
 Self.OkButton.Align := alRight;
end;

function GetMatSchMulti(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aID_SESSION: int64; var aResult: boolean):Variant;stdcall;
var
 form : TMatSchFormMulti;
begin
 form := TMatSchFormMulti.Create(AOwner, DBHANDLE, aID_SESSION);
 form.ID_USER := aID_USER;
 form.ShowModal;
 aResult:=form.FormResult;
 GetMatSchMulti := form.ResultArray;
 form.Free;
end;

procedure TMatSchFormMulti.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TMatSchFormMulti.OkButtonClick(Sender: TObject);
var
 ResCount: integer;
 rIdSch: string;
 rSchNumber: string;
 rSchTitle: string;
 rTipSch: integer;
 i: integer;
begin
 FormResult:=false;
 if Not MatSchDataSet.IsEmpty
  then begin
   MatSchDataSource.Enabled:=false;
   ResCount:=0;
   MatSchDataSet.First;
   while not MatSchDataSet.Eof do
   begin
    if MatSchDataSetCHECKED.Value=1 then
     ResCount:=ResCount+1;
    MatSchDataSet.Next;
   end;
   if ResCount>0 then begin
    ResultArray := VarArrayCreate([0,ResCount-1], varVariant);
    i:=0;
    MatSchDataSet.First;
    while not MatSchDataSet.Eof do
    begin
     if MatSchDataSetCHECKED.Value=1 then begin
      rIdSch := MatSchDataSet['ID_SCH'];
      rSchNumber := Self.MatSchDataSet['SCH_NUMBER'];
      rSchTitle := Self.MatSchDataSet['SCH_TITLE'];
      rTipSch := Self.MatSchDataSet['TIP_SCH'];
      ResultArray[i]:=VarArrayOf([rIdSch, rSchNumber, rSchTitle, rTipSch]);
      i:=i+1;
      FormResult:=true;
     end;
     MatSchDataSet.Next;
    end;
   end
   else
    FormResult:=false;
   Close;
  end;
end;

procedure TMatSchFormMulti.RefreshButtonClick(Sender: TObject);
begin
 OpenMatSchDataSet;
end;

procedure TMatSchFormMulti.cxGrid1DblClick(Sender: TObject);
begin
 if OkButton.Visible then
  OkButton.Click;
end;

procedure TMatSchFormMulti.CancelButtonClick(Sender: TObject);
begin
 FormResult:=false;
 Close;
end;

procedure TMatSchFormMulti.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
 if OkButton.Visible then
  OkButton.Click;
end;

procedure TMatSchFormMulti.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (Key=VK_RETURN) and (OkButton.Visible) then
   OkButton.Click;
 if Key = VK_SPACE then SchCheck(true);
end;

procedure TMatSchFormMulti.SchCheck(f: boolean);
begin
   try
    WriteTransaction.StartTransaction;
    WorkStoredProc.ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
    WorkStoredProc.ParamByName('ID_KEY').AsInt64:=MatSchDataSet.FieldByName('ID_SCH').AsInteger;
    if MatSchDataSet.FieldByName('TIP_SCH').Value=0 then
     WorkStoredProc.ParamByName('ID_OBJECT').Value:=3
    else
     WorkStoredProc.ParamByName('ID_OBJECT').Value:=2;
    WorkStoredProc.ExecProc;
    WriteTransaction.Commit;
   except on E : Exception
    do begin
     WriteTransaction.Rollback;
     ShowMessage(E.Message);
    end;
   end;
   MatSchDataSet.Refresh;
   if f then MatSchDataset.Next;
end;

procedure TMatSchFormMulti.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=VK_ESCAPE) then
  CancelButton.Click;
end;

procedure TMatSchFormMulti.cxGrid1DBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
 if ACellViewInfo.Item.Index=0 then
 begin
  SchCheck(false);
 end;
 AHandled:=true;
end;

procedure TMatSchFormMulti.MatSchDataSetCalcFields(DataSet: TDataSet);
begin
 if MatSchDataSetTIP_SCH.Value=1 then
  begin
   MatSchDataSetBAL_SCH.Value:='';
   MatSchDataSetSUB_SCH.Value:=MatSchDataSetSCH_NUMBER.Value;
  end
 else
  begin
   MatSchDataSetBAL_SCH.Value:=MatSchDataSetSCH_NUMBER.Value;
   MatSchDataSetSUB_SCH.Value:='';
  end;

end;

procedure TMatSchFormMulti.cxComboBox1PropertiesChange(Sender: TObject);
begin
 OpenMatSchDataSet;
end;

procedure TMatSchFormMulti.OpenMatSchDataSet;
var
 dm, dy: Word;
 PERIOD: TDateTime;
 ID_SCH: integer;
 kod_sys: integer;
begin
 kod_sys:=0;
 if cxSystem.ItemIndex=1 then
  kod_sys:=_KOD_SYSTEM_OS;
 if cxSystem.ItemIndex=2 then
  kod_sys:=_KOD_SYSTEM_MNA;
 if cxSystem.ItemIndex=3 then
  kod_sys:=_KOD_SYSTEM_MBP;
 if cxSystem.ItemIndex=4 then
  kod_sys:=_KOD_SYSTEM_MAT;
 dy:=cxYear.Value;
 dm:=cxMonth.ItemIndex+1;
 PERIOD:=EncodeDate(dy, dm, 1);
 ID_SCH:=MatSchDataSet.FieldByName('ID_SCH').AsInteger;
 MatSchDataSet.Close;
 with WorkQuery.SQL do
 begin
  Clear;
  Add('DELETE FROM MAT_TMP_FILTER WHERE ID_SESSION='+IntToStr(ID_SESSION));
 end;
 try
  WorkQuery.Transaction:=WriteTransaction;
  WorkQuery.Transaction.StartTransaction;
  WorkQuery.ExecQuery;
  WorkQuery.Transaction.Commit;
 except on E : Exception
  do begin
    WorkQuery.Transaction.Rollback;
    ShowMessage(E.Message);
  end;
 end;
 WorkQuery.Close;
 with MatSchDataSet.SelectSQL do
 begin
  Clear;
  Add('SELECT * FROM MAT_SP_SCH_SELECT_FILTER(:DATE, :ID_SESSION)');
  if kod_sys<>0 then
   Add('WHERE KOD_SYSTEM='+IntToStr(kod_sys));
  Add('ORDER BY SCH_NUMBER');
 end;
 MatSchDataSet.Prepare;
 MatSchDataSet.ParamByName('DATE').Value:=PERIOD;
 MatSchDataSet.ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
 MatSchDataSet.CloseOpen(False);
 if not MatSchDataSet.Locate('ID_SCH', ID_SCH,[]) then
  MatSchDataSet.First;
end;

end.
