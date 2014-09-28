unit uNomnFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uResources, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxSpinEdit, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, DB, FIBDataSet, pFIBDataSet, FR_Class, FR_DSet, FR_DBSet,
  cxCheckBox, FIBDatabase, pFIBDatabase, ibase, cxButtonEdit, uSpMatSch,
  uMatasVars, uMatasUtils, ActnList, GlobalSPR, cxGraphics, cxCustomData,
  cxStyles, cxTL, cxInplaceContainer, cxDBTL, cxTLData, ExtCtrls,
  cxCurrencyEdit, cxClasses, cxGridTableView, Buttons, FIBQuery, pFIBQuery,
  pFIBStoredProc, uPackageManager, DateUtils;


function ShowNomnFilter(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_SESSION:Int64; var aNomnList: string):boolean;stdcall;

exports ShowNomnFilter;

type
  TNomnFilterForm = class(TForm)
    WorkDatabase: TpFIBDatabase;
    WorkTransaction: TpFIBTransaction;
    Panel1: TPanel;
    cxDBTreeList1: TcxDBTreeList;
    AllGroupDataSource: TDataSource;
    AllGroupDataSet: TpFIBDataSet;
    cxDBTreeList1TYPE_RECORD: TcxDBTreeListColumn;
    cxDBTreeList1LINK_TO: TcxDBTreeListColumn;
    cxDBTreeList1ID_NOM: TcxDBTreeListColumn;
    cxDBTreeList1NAME: TcxDBTreeListColumn;
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
    WorkStoredProc: TpFIBStoredProc;
    AddButton: TSpeedButton;
    DelButton: TSpeedButton;
    DelAllButton: TSpeedButton;
    ExitButton: TSpeedButton;
    AllGroupDataSetID_NOMN: TFIBBCDField;
    AllGroupDataSetLINK_TO: TFIBBCDField;
    AllGroupDataSetNAME: TFIBStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure DelAllButtonClick(Sender: TObject);
  private
    { Private declarations }
   DBHANDLE : TISC_DB_HANDLE;
   ID_USER : Int64;
   ID_SESSION:Integer;// содержит  идентификатор  сессии
  public
    { Public declarations }
   MatasMonth, MatasYear: Word;
   PERIOD: TDateTime;
   ID_SCH: integer;
   NomnList: string;
   constructor Create(aOwner:TComponent;aDBHANDLE : TISC_DB_HANDLE;aID_SESSION:Int64);
  end;

var
  NomnFilterForm: TNomnFilterForm;

implementation

{$R *.dfm}

function ShowNomnFilter(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_SESSION:Int64; var aNomnList: string):boolean;stdcall;
var
 form : TNomnFilterForm;
begin
 form := TNomnFilterForm.Create(aOwner, aDBHANDLE, aID_SESSION);
 form.FormStyle:= fsNormal;
 form.ShowModal;
 aNomnList:=form.NomnList;
 if form.AllGroupDataSet.IsEmpty then
  Result:=false
 else
  Result:=true;
 form.Free;
end;

constructor TNomnFilterForm.Create(aOwner:TComponent;aDBHANDLE : TISC_DB_HANDLE;aID_SESSION:Int64);
var
 dy, dm, dd: Word;
begin
 inherited Create(aOwner);
 if Assigned(aDBHandle) then
  begin
   Self.WorkDatabase.Close;
   Self.DBHANDLE:= aDBHandle;
   Self.WorkDatabase.Handle:=aDBHANDLE;
   self.WorkDatabase.Open;
   ID_SESSION:=aID_SESSION;
   AllGroupDataSet.Close;
   AllGroupDataSet.ParamByName('ID_SESSION').Value :=ID_SESSION;
   AllGroupDataSet.CloseOpen(false);
 end;
end;

procedure TNomnFilterForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
 Str:String;
begin
  if AllGroupDataSet.IsEmpty then exit;
  AllGroupDataSet.First;
  while (not AllGroupDataSet.Eof) and (Length(Str)<255) do
  begin
   Str:=Str + AllGroupDataSetNAME.AsString + ';';
   AllGroupDataSet.Next;
  end;
  NomnList:=Str;
end;

procedure TNomnFilterForm.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TNomnFilterForm.ActionCancelExecute(Sender: TObject);
begin
 Close;
end;

procedure TNomnFilterForm.AddButtonClick(Sender: TObject);
var
 Res:Variant;
 TempID:Int64;
 sTempID: string;
begin
 Res:=uPackageManager.LGetNomn(self, DBHandle, fsNormal, 0, 0, 0, 0, 0, 2, 1);
 if  VarType(Res) <> varEmpty then
 begin
  sTempID:=Res[0];
  TempID:=StrToInt64(sTempID);
  if (TempID=0) then Exit;
  try
   WorkTransaction.StartTransaction;
   WorkStoredProc.StoredProcName:='MAT_FILTER_ADD_NOMN_TREE';
   WorkStoredProc.Prepare;
   WorkStoredProc.ParamByName('ID_OBJECT_NOMN').AsInt64:=TempID;
   WorkStoredProc.ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
   WorkStoredProc.ExecProc;
   WorkStoredProc.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    WorkStoredProc.Transaction.Rollback;
    Exit;
   end;
  end;
  AllGroupDataSet.CloseOpen(false);
 end;
end;

procedure TNomnFilterForm.DelButtonClick(Sender: TObject);
var
  ID:Int64;
  Link:Int64;
begin
 ID:=AllGroupDataSetID_NOMN.AsInt64;
 Link:=AllGroupDataSetLINK_TO.AsInt64;
 try
   WorkTransaction.StartTransaction;
   WorkStoredProc.StoredProcName:='MAT_DEL_FROM_TMP_FTR_RECORD';
   WorkStoredProc.Prepare;
   WorkStoredProc.ParamByName('ID_NOMN').AsInt64:=ID;
   WorkStoredProc.ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
   WorkStoredProc.ExecProc;
   WorkStoredProc.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    WorkStoredProc.Transaction.Rollback;
    Exit;
   end;
  end;
 AllGroupDataSet.Close;
 AllGroupDataSet.ParamByName('ID_SESSION').Value :=ID_SESSION;
 AllGroupDataSet.CloseOpen(false);
 AllGroupDataSet.Locate('id_nom',Link,[]);


end;

procedure TNomnFilterForm.ExitButtonClick(Sender: TObject);
begin
 Close();
end;
procedure TNomnFilterForm.DelAllButtonClick(Sender: TObject);
 begin

 try
   WorkTransaction.StartTransaction;
   WorkStoredProc.StoredProcName:='MAT_DEL_FROM_TMP_FILTER';
   WorkStoredProc.Prepare;
   WorkStoredProc.ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
   WorkStoredProc.ExecProc;
   WorkStoredProc.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    WorkStoredProc.Transaction.Rollback;
    Exit;
   end;
  end;
end;
end.


