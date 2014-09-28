unit uSpTipDocMulti;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, FIBDataSet, FIBDatabase,
  pFIBDatabase, cxGridLevel, cxControls, cxGridCustomView, cxGrid, Buttons,
  ExtCtrls, ActnList, Menus, ImgList, cxClasses, FIBQuery, pFIBQuery,
  pFIBStoredProc, pFIBDataSet, ibase, uMatasUtils, uResources, cxCheckBox,
  Placemnt;

type
  TTipDocMultiForm = class(TForm)
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    TipDocDataSet: TpFIBDataSet;
    WorkStoredProc: TpFIBStoredProc;
    TipDocDataSource: TDataSource;
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
    MainImageList: TImageList;
    ActionListMain: TActionList;
    acExit: TAction;
    TopPanel: TPanel;
    CancelButton: TSpeedButton;
    RefreshButton: TSpeedButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    fdbTipDoc: TpFIBDatabase;
    TipDocDataSetID_TIPD: TFIBIntegerField;
    TipDocDataSetTIPD: TFIBStringField;
    TipDocDataSetNAME: TFIBStringField;
    TipDocDataSetNAME_GRP: TFIBStringField;
    TipDocDataSetPROPERTIES: TFIBStringField;
    TipDocDataSetSYSTEM: TFIBIntegerField;
    TipDocDataSetID_INV_OPER: TFIBIntegerField;
    TipDocDataSetID_MNA_OPER: TFIBIntegerField;
    TipDocDataSetCHECKED: TFIBIntegerField;
    cxGrid1DBTableView1ID_TIPD: TcxGridDBColumn;
    cxGrid1DBTableView1TIPD: TcxGridDBColumn;
    cxGrid1DBTableView1NAME: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_GRP: TcxGridDBColumn;
    cxGrid1DBTableView1PROPERTIES: TcxGridDBColumn;
    cxGrid1DBTableView1SYSTEM: TcxGridDBColumn;
    cxGrid1DBTableView1ID_INV_OPER: TcxGridDBColumn;
    cxGrid1DBTableView1ID_MNA_OPER: TcxGridDBColumn;
    cxGrid1DBTableView1CHECKED: TcxGridDBColumn;
    OkButton: TSpeedButton;
    DocFormStorage: TFormStorage;
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure acExitExecute(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
  private
    { Private declarations }
   DBHANDLE : TISC_DB_HANDLE;
   ID_USER : Int64;
   ID_SESSION: Integer;
  public
    { Public declarations }
   FormResult: boolean;
   ResultArray: Variant;
   procedure TipDocCheck(f: Boolean);
   constructor Create(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_SESSION: int64);
  end;

  function GetTipDocMulti(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aID_SESSION: int64; var aResult: boolean):Variant; stdcall;
  exports GetTipDocMulti;

var
  TipDocMultiForm: TTipDocMultiForm;

implementation

{$R *.dfm}

function GetTipDocMulti(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aID_SESSION: int64; var aResult: boolean):Variant; stdcall;
var
  form: TTipDocMultiForm;
begin
 form := TTipDocMultiForm.Create(aOwner, aDBHANDLE, aID_SESSION);
 form.ID_USER := aID_USER;
 form.ShowModal;
 aResult:=form.FormResult;
 GetTipDocMulti := form.ResultArray;
 form.Free;
end;

{ TTipDocMultiForm }

constructor TTipDocMultiForm.Create(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_SESSION: int64);
begin
  inherited Create(AOwner);
 Caption:=MAT_SYS_PREFIX + MAT_FORMCAP_SP_TIPDOC;
 if Assigned(aDBHandle)
 then begin
  Self.fdbTipDoc.Close;
  Self.DBHANDLE := aDBHandle;
  Self.fdbTipDoc.Handle := aDBHANDLE;
  Self.ID_SESSION:=aID_SESSION;
  Self.TipDocDataSet.ParamByName('ID_SESSION').Value:=ID_SESSION;
  Self.TipDocDataSet.RefreshSQL.Add('SELECT * FROM MAT_SP_TIPD_SELECT_EX(:ID_SESSION) WHERE ID_TIPD=:ID_TIPD');
  Self.TipDocDataSet.CloseOpen(False);
 end;
 Self.RefreshButton.Caption:=MAT_ACTION_REFRESH_CONST;
 Self.CancelButton.Caption:=MAT_ACTION_CLOSE_CONST;
 Self.cxGrid1DBTableView1TIPD.Caption:=MAT_STR_COL_SHORT_NAME;
 Self.cxGrid1DBTableView1NAME.Caption:=MAT_STR_COL_TIPD_NAME;
 Self.cxGrid1DBTableView1NAME_GRP.Caption:=MAT_STR_COL_TIPD_GRP;
 Self.CancelButton.Align := alRight;
 Self.OkButton.Align := alRight;
 Self.RefreshButton.Align := alLeft;
 Self.OkButton.Caption:=MAT_ACTION_CHOOSE_CONST;
 Self.FormResult:=false;
end;

procedure TTipDocMultiForm.cxGrid1DBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
 if ACellViewInfo.Item.Index=0 then
 begin
  TipDocCheck(false);
 end;
 AHandled:=true;
end;

procedure TTipDocMultiForm.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (Key=VK_RETURN) then CancelButton.Click;
 if Key = VK_SPACE then TipDocCheck(true);
end;

procedure TTipDocMultiForm.TipDocCheck(f: Boolean);
begin
 try
  WriteTransaction.StartTransaction;
  WorkStoredProc.ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
  WorkStoredProc.ParamByName('ID_KEY').AsInt64:=TipDocDataSet.FieldByName('ID_TIPD').AsInteger;
  WorkStoredProc.ParamByName('ID_OBJECT').Value:=12;
  WorkStoredProc.ExecProc;
  WriteTransaction.Commit;
 except on E : Exception
  do begin
   WriteTransaction.Rollback;
   ShowMessage(E.Message);
  end;
 end;
 TipDocDataSet.Refresh;
 if f then TipDocDataSet.Next;
end;

procedure TTipDocMultiForm.acExitExecute(Sender: TObject);
begin
 Close;
end;

procedure TTipDocMultiForm.CancelButtonClick(Sender: TObject);
begin
 FormResult:=false;
 Close;
end;

procedure TTipDocMultiForm.OkButtonClick(Sender: TObject);
var
 ResCount: integer;
 rIdTipDoc: string;
 rTipd: string;
 rName: string;
 i: integer;
begin
 FormResult:=false;
 if Not TipDocDataSet.IsEmpty
  then begin
   TipDocDataSource.Enabled:=false;
   ResCount:=0;
   TipDocDataSet.First;
   while not TipDocDataSet.Eof do
   begin
    if TipDocDataSetCHECKED.Value=1 then
     ResCount:=ResCount+1;
    TipDocDataSet.Next;
   end;
   if ResCount>0 then begin
    ResultArray := VarArrayCreate([0,ResCount-1], varVariant);
    i:=0;
    TipDocDataSet.First;
    while not TipDocDataSet.Eof do
    begin
     if TipDocDataSetCHECKED.Value=1 then begin
      rIdTipDoc := TipDocDataSet.FieldByName('ID_TIPD').AsString;
      rTipd := TipDocDataSet.FieldByName('TIPD').AsString;
      rName := TipDocDataSet.FieldByName('NAME').AsString;
      ResultArray[i]:=VarArrayOf([rIdTipDoc, rTipd, rName]);
      i:=i+1;
      FormResult:=true;
     end;
     TipDocDataSet.Next;
    end;
   end
   else
    FormResult:=false;
   Close;
  end;
end;

end.
