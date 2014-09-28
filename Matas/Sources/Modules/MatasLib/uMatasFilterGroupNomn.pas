unit uMatasFilterGroupNomn;

interface

uses
  IBASE, GlobalSPR,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, cxGraphics, cxCustomData, cxStyles, cxTL,
  cxMaskEdit, cxClasses, cxGridTableView, DB, FIBQuery, pFIBQuery,
  pFIBStoredProc, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  cxInplaceContainer, cxDBTL, cxControls, cxTLData, cxCurrencyEdit,
  ActnList;

type
  TFilterGroupNomnForm = class(TForm)
    Panel: TPanel;
    AddButton: TSpeedButton;
    DelButton: TSpeedButton;
    ExitButton: TSpeedButton;
    DBgr: TpFIBDatabase;
    DSgr: TpFIBDataSet;
    TRgr: TpFIBTransaction;
    StPrgr: TpFIBStoredProc;
    DataSource: TDataSource;
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
    cxNomTree: TcxDBTreeList;
    cxTreeListNAME: TcxDBTreeListColumn;
    DSgrID_KEY: TFIBBCDField;
    DSgrNAME: TFIBStringField;
    DSgrKOD: TFIBStringField;
    DSgrLINKTO: TFIBBCDField;
    ActionList1: TActionList;
    acInsert: TAction;
    acDelete: TAction;
    acClose: TAction;
    ClearButton: TSpeedButton;
    OkButton: TSpeedButton;
    trWrite: TpFIBTransaction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acInsertExecute(Sender: TObject);
    procedure acDeleteExecute(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
  private
    DBHANDLE : TISC_DB_HANDLE;
     ID_USER : Int64;
  public
    ID_OBJECT :Integer;
    ID_SESSION:Integer;

    ID_SCH     :Integer;
    Date_SESSION_:TDateTime;
    Result :Variant;

    constructor Create(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_SESSION:Integer; aID_OBJECT:Integer; aDATE_SESSION:TDateTime; aNameForm:String);overload;
  end;

var
  FilterGroupNomnForm: TFilterGroupNomnForm;

implementation

{$R *.dfm}
uses DateUtils,uPackageManager;


constructor TFilterGroupNomnForm.Create(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_SESSION:Integer; aID_OBJECT:Integer; aDATE_SESSION:TDateTime; aNameForm:String);
begin
 inherited Create(aOwner);
 if Assigned(aDBHandle)
 then begin
   Self.DBgr.Close;
   Self.DBHANDLE:=aDBHANDLE;
   Self.DBgr.Handle:=aDBHANDLE;
   Self.Caption:='Додати параметри фільтрації по :: '+aNameForm;
   self.ID_OBJECT:=aID_OBJECT;
   self.ID_SESSION:=aID_SESSION;
   self.Date_SESSION_:=aDATE_SESSION;
   self.ExitButton.Align:=alRight;
   self.OkButton.Align:=alRight;
   with Self.DSgr do
   begin
     Close;
     ParamByName('Date').Value:=aDATE_SESSION;
     ParamByName('ID_SESSION').Value:=aID_SESSION;
     ParamByName('ID_OBJECT').Value:=aID_OBJECT;
     CloseOpen(false);
   end;
 end;
end;

procedure TFilterGroupNomnForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
   Str:String;
begin
  Str:='';
  Result:=Str;
  if DSgr.IsEmpty then exit;
  DSgr.First;
  while (not DSgr.Eof) and (Length(Str)<1000) do
  begin
    Str:=Str + DSgrNAME.AsString + ';';
    DSgr.Next;
  end;
  Result:=Str;
end;

procedure TFilterGroupNomnForm.acInsertExecute(Sender: TObject);
var
  Res : Variant;
begin
  Res:=uPackageManager.LGetNomn(self, DBHandle, fsNormal, 0, id_sch , 0, 0, 0, 2, 0);
  if  VarType(Res) <> varEmpty then id_sch:=res[0];
  DSgr.CloseOpen(true);
  DSgr.parambyname('id_old_nomn').Value:=res[0];
  DSgr.CloseOpen(false);
  try
   trWrite.StartTransaction;
   StPrgr.StoredProcName:='MAT_FILTER_THREE_IN_TMP';
   StPrgr.Prepare;
   StPrgr.ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
   StPrgr.ParamByName('ID_NOMN_TREE').AsInt64:=ID_SCH;
   StPrgr.ExecProc;
   StPrgr.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    StPrgr.Transaction.Rollback;
    Exit;
   end;
  end;
  DSgr.CloseOpen(false);
end;

procedure TFilterGroupNomnForm.acDeleteExecute(Sender: TObject);
var
  ID :integer;
begin
  if DSgr.IsEmpty then exit;
  ID:=DSgrID_KEY.AsInt64;
  try
   trWrite.StartTransaction;
   StPrgr.StoredProcName:='MAT_FILTER_CHECK';
   StPrgr.Prepare;
   StPrgr.ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
   StPrgr.ParamByName('ID_KEY').AsInt64:=ID;
   StPrgr.ParamByName('ID_OBJECT').AsInt64:=ID_OBJECT;
   StPrgr.ExecProc;
   StPrgr.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    StPrgr.Transaction.Rollback;
    Exit;
   end;
  end;
  DSgr.CloseOpen(false);
end;

procedure TFilterGroupNomnForm.acCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TFilterGroupNomnForm.ClearButtonClick(Sender: TObject);
begin
  try
   trWrite.StartTransaction;
   StPrgr.StoredProcName:='MAT_FILTER_CLEANER';
   StPrgr.Prepare;
   StPrgr.ParamByName('ID_SESSION').Value:=ID_SESSION;
   StPrgr.ParamByName('ID_OBJECT').Value:=ID_OBJECT;
   StPrgr.ExecProc;
   StPrgr.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    StPrgr.Transaction.Rollback;
    Exit;
   end;
  end;
  DSgr.CloseOpen(false);
end;

end.
