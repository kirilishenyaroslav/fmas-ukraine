{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uSpMatSch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ibase, FIBDatabase, pFIBDatabase,
  uResources, Buttons, ExtCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, FIBDataSet, FIBQuery,
  pFIBQuery, pFIBDataSet, cxTL, cxMaskEdit, cxInplaceContainer, cxDBTL,
  cxSplitter, cxTLData, cxTextEdit, ImgList, cxCurrencyEdit, ActnList, uMatasVars;

type
  TMatSchForm = class(TForm)
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
    ActionList1: TActionList;
    acExit: TAction;
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
  private
   DBHANDLE : TISC_DB_HANDLE;
   ID_USER : Int64;
  public
   ResultArray: Variant;
   constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_SCH: integer);overload;
  end;

  function GetMatSch(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; ID_SCH: integer):Variant; stdcall;
  function GetMatSchEx(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aMode: integer; ID_SCH: integer; SCH_NUMBER: string):Variant; stdcall;

  exports GetMatSch;
  exports GetMatSchEx;

var
  MatSchForm: TMatSchForm;

implementation

{$R *.dfm}

constructor TMatSchForm.Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_SCH: integer);
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
//  Self.cxGrid1DBTableView1.ViewData.Expand(true);
  if not Self.MatSchDataSet.Locate('ID_SCH', ID_SCH,[]) then
   Self.MatSchDataSet.First;
 end;
 Self.RefreshButton.Caption:=MAT_ACTION_REFRESH_CONST;
 Self.OkButton.Caption:=MAT_ACTION_CHOOSE_CONST;
 Self.CancelButton.Caption:=MAT_ACTION_CLOSE_CONST;
 Self.cxGrid1DBTableView1SCH_NUMBER.Caption:=MAT_STR_COL_SCH;
 Self.cxGrid1DBTableView1SCH_TITLE.Caption:=MAT_STR_COL_NAME;
 Self.CancelButton.Align := alRight;
 Self.OkButton.Align := alRight;
end;

function GetMatSch(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; ID_SCH: integer):Variant;stdcall;
var
 form : TMatSchForm;
begin
 form := TMatSchForm.Create(AOwner,DBHANDLE, ID_SCH);
 form.ID_USER := aID_USER;
 form.ShowModal;
 GetMatSch := form.ResultArray;
 form.Free;
end;

function GetMatSchEx(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aMode: integer; ID_SCH: integer; SCH_NUMBER: string):Variant;stdcall;
var
 form : TMatSchForm;
 Res: Variant;
begin
 form := TMatSchForm.Create(AOwner,DBHANDLE, ID_SCH);
 form.ID_USER := aID_USER;
 if not form.MatSchDataSet.Locate('SCH_NUMBER', Trim(SCH_NUMBER),[]) then begin
  form.ShowModal;
  GetMatSchEx := form.ResultArray;
 end
 else begin
  Res := VarArrayCreate([0,3], varVariant);
  Res[0] := form.MatSchDataSet['ID_SCH'];
  Res[1] := form.MatSchDataSet['SCH_NUMBER'];
  Res[2] := form.MatSchDataSet['SCH_TITLE'];
  Res[3] := form.MatSchDataSet['KOD_SYSTEM'];
  GetMatSchEx:=Res;
 end;
 form.Free;
end;

procedure TMatSchForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TMatSchForm.OkButtonClick(Sender: TObject);
begin
 if Not Self.MatSchDataSet.IsEmpty
  then begin
   ResultArray := VarArrayCreate([0,3], varVariant);
   ResultArray[0] := Self.MatSchDataSet['ID_SCH'];
   ResultArray[1] := Self.MatSchDataSet['SCH_NUMBER'];
   ResultArray[2] := Self.MatSchDataSet['SCH_TITLE'];
   ResultArray[3] := Self.MatSchDataSet['KOD_SYSTEM'];
   Close;
  end;
end;

procedure TMatSchForm.RefreshButtonClick(Sender: TObject);
begin
 MatSchDataSet.CloseOpen(False);
end;

procedure TMatSchForm.cxGrid1DblClick(Sender: TObject);
begin
 if OkButton.Visible then
  OkButton.Click;
end;

procedure TMatSchForm.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TMatSchForm.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
 if OkButton.Visible then
  OkButton.Click;
end;

procedure TMatSchForm.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (Key=VK_RETURN) and (OkButton.Visible) then
   OkButton.Click;
end;

procedure TMatSchForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=VK_ESCAPE) then
  CancelButton.Click;
end;

end.
