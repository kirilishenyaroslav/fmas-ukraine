{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uSpMatSchEx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ibase, FIBDatabase, pFIBDatabase,
  uResources, Buttons, ExtCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, FIBDataSet, FIBQuery,
  pFIBQuery, pFIBDataSet, cxTL, cxMaskEdit, cxInplaceContainer, cxDBTL,
  cxSplitter, cxTLData, cxTextEdit, ImgList, cxCurrencyEdit, cxCalendar,
  cxCheckBox, cxSpinEdit, cxContainer, cxDropDownEdit, StdCtrls,
  uMatasUtils, uMatasVars;

type
  TMatSchExForm = class(TForm)
    fdbMatSch: TpFIBDatabase;
    TopPanel: TPanel;
    OkButton: TSpeedButton;
    RefreshButton: TSpeedButton;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    MatSchDataSet: TpFIBDataSet;
    MatSchDataSource: TDataSource;
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
    PubSchDataSet: TpFIBDataSet;
    PubSchDataSetID_SCH: TFIBIntegerField;
    PubSchDataSetSCH_TITLE: TFIBStringField;
    PubSchDataSetSCH_NUMBER: TFIBStringField;
    PubSchDataSetSCH_TYPE: TFIBIntegerField;
    PubSchDataSetLINK_TO: TFIBIntegerField;
    PubSchDataSetDATE_BEG: TFIBDateTimeField;
    PubSchDataSetDATE_END: TFIBDateTimeField;
    PubSchDataSetTYPE_OBJECT: TFIBIntegerField;
    PubSchDataSetSCH_OBJ_TYPE_TITLE: TFIBStringField;
    PubSchDataSetSCH_TYPE_TITLE: TFIBStringField;
    PubSchDataSetID_SYSTEM: TFIBIntegerField;
    PubSchDataSetSYSTEM_TEXT: TFIBStringField;
    MatSchDataSetBAL_ID_SCH: TFIBIntegerField;
    MatSchDataSetBAL_SCH_NUMBER: TFIBStringField;
    MatSchDataSetBAL_SCH_TITLE: TFIBStringField;
    MatSchDataSetSYSTEM_TEXT: TFIBStringField;
    MatSchDataSetKOD_SYSTEM: TFIBIntegerField;
    MatSchDataSetIS_BLOCKED: TFIBIntegerField;
    MatSchDataSetOPEN_SCH: TFIBDateField;
    MatSchDataSetID_REG_UCH: TFIBIntegerField;
    cxDBTreeList1: TcxDBTreeList;
    cxDBTreeList1ID_SCH: TcxDBTreeListColumn;
    cxDBTreeList1SCH_TITLE: TcxDBTreeListColumn;
    cxDBTreeList1SCH_NUMBER: TcxDBTreeListColumn;
    cxDBTreeList1SCH_TYPE: TcxDBTreeListColumn;
    cxDBTreeList1LINK_TO: TcxDBTreeListColumn;
    cxDBTreeList1DATE_BEG: TcxDBTreeListColumn;
    cxDBTreeList1DATE_END: TcxDBTreeListColumn;
    cxDBTreeList1TYPE_OBJECT: TcxDBTreeListColumn;
    cxDBTreeList1SCH_OBJ_TYPE_TITLE: TcxDBTreeListColumn;
    cxDBTreeList1SCH_TYPE_TITLE: TcxDBTreeListColumn;
    cxDBTreeList1ID_SYSTEM: TcxDBTreeListColumn;
    cxDBTreeList1BAL_ID_SCH: TcxDBTreeListColumn;
    cxDBTreeList1BAL_SCH_NUMBER: TcxDBTreeListColumn;
    cxDBTreeList1BAL_SCH_TITLE: TcxDBTreeListColumn;
    cxDBTreeList1SYSTEM_TEXT: TcxDBTreeListColumn;
    cxDBTreeList1KOD_SYSTEM: TcxDBTreeListColumn;
    cxDBTreeList1IS_BLOCKED: TcxDBTreeListColumn;
    cxDBTreeList1OPEN_SCH: TcxDBTreeListColumn;
    cxDBTreeList1ID_REG_UCH: TcxDBTreeListColumn;
    MatSchDataSetTIP_SCH: TFIBIntegerField;
    LabelPeriod: TLabel;
    cxMonth: TcxComboBox;
    cxYear: TcxSpinEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure cxGrid1DblClick(Sender: TObject);
    procedure cxDBTreeList1DblClick(Sender: TObject);
    procedure cxDBTreeList1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
   DBHANDLE : TISC_DB_HANDLE;
   ID_USER : Int64;
  public
   ResultArray: Variant;
   constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_SCH: integer);overload;
  end;

  function GetMatSchFull(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; ID_SCH: integer):Variant; stdcall;

  exports GetMatSchFull;

var
  MatSchExForm: TMatSchExForm;

implementation

{$R *.dfm}

constructor TMatSchExForm.Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_SCH: integer);
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
  Self.MatSchDataSet.ParamByName('DATE').Value:=_MATAS_PERIOD;
  Self.MatSchDataSet.CloseOpen(False);
  Self.cxDBTreeList1.FullExpand;
  if not Self.MatSchDataSet.Locate('ID_SCH', ID_SCH,[]) then
   Self.MatSchDataSet.First;
 end;
 DecodeDate(_MATAS_PERIOD, dy, dm, dd);
 LoadMonthTocxComboBox(Self.cxMonth);
 Self.cxMonth.ItemIndex:=dm-1;
 Self.cxYear.Value:=dy;
 Self.LabelPeriod.Caption:=MAT_STR_COL_PERIOD;
 Self.RefreshButton.Caption:=MAT_ACTION_REFRESH_CONST;
 Self.OkButton.Caption:=MAT_ACTION_CHOOSE_CONST;
 Self.CancelButton.Caption:=MAT_ACTION_CLOSE_CONST;
 Self.cxDBTreeList1SCH_NUMBER.Caption.Text:=MAT_STR_COL_SCH;
 Self.cxDBTreeList1SCH_TITLE.Caption.Text:=MAT_STR_COL_NAME;
 Self.CancelButton.Align := alRight;
 Self.OkButton.Align := alRight;
end;

function GetMatSchFull(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; ID_SCH: integer):Variant;stdcall;
var
 form : TMatSchExForm;
begin
 form := TMatSchExForm.Create(AOwner,DBHANDLE, ID_SCH);
 form.ID_USER := aID_USER;
 form.ShowModal;
 GetMatSchFull := form.ResultArray;
 form.Free;
end;

procedure TMatSchExForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TMatSchExForm.OkButtonClick(Sender: TObject);
begin
 if Not Self.MatSchDataSet.IsEmpty
  then begin
   ResultArray := VarArrayCreate([0,3], varVariant);
   ResultArray[0] := Self.MatSchDataSet['ID_SCH'];
   ResultArray[1] := Self.MatSchDataSet['SCH_NUMBER'];
   ResultArray[2] := Self.MatSchDataSet['SCH_TITLE'];
   ResultArray[3] := Self.MatSchDataSet['TIP_SCH'];
   Close;
  end;
end;

procedure TMatSchExForm.RefreshButtonClick(Sender: TObject);
var
 ID_SCH: integer;
 dm, dy: Word;
 PERIOD: TDateTime;
begin
 dy:=cxYear.Value;
 dm:=cxMonth.ItemIndex+1;
 PERIOD:=EncodeDate(dy, dm, 1);
 ID_SCH:=MatSchDataSet.FieldByName('ID_SCH').AsInteger;
 MatSchDataSet.ParamByName('DATE').Value:=PERIOD;
 MatSchDataSet.CloseOpen(False);
 cxDBTreeList1.FullExpand;
 if not MatSchDataSet.Locate('ID_SCH', ID_SCH,[]) then
  MatSchDataSet.First;
end;

procedure TMatSchExForm.cxGrid1DblClick(Sender: TObject);
begin
 if OkButton.Visible then
  OkButton.Click;
end;

procedure TMatSchExForm.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TMatSchExForm.cxDBTreeList1DblClick(Sender: TObject);
begin
 if OkButton.Visible then
  OkButton.Click;
end;

procedure TMatSchExForm.cxDBTreeList1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (Key=VK_RETURN) and (OkButton.Visible) then
   OkButton.Click;
end;

procedure TMatSchExForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=VK_ESCAPE) then
  CancelButton.Click;
end;

end.
