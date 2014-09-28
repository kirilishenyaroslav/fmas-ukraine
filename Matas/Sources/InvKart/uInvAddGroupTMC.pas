unit uInvAddGroupTMC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxMaskEdit, ActnList,
  cxClasses, cxGridTableView, DB, FIBQuery, pFIBQuery, pFIBStoredProc,
  FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, cxInplaceContainer,
  cxDBTL, cxControls, cxTLData, Buttons, ExtCtrls, ibase, uPackageManager;

type
  TInvAddGroupForm = class(TForm)
    Panel: TPanel;
    btnacInsert: TSpeedButton;
    btnacDelete: TSpeedButton;
    btnacClose: TSpeedButton;
    cxNomTree: TcxDBTreeList;
    cxTreeListNAME: TcxDBTreeListColumn;
    DBgr: TpFIBDatabase;
    DSgr: TpFIBDataSet;
    DSgrID_KEY: TFIBBCDField;
    DSgrNAME: TFIBStringField;
    DSgrKOD: TFIBStringField;
    DSgrLINKTO: TFIBBCDField;
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
    actlst1: TActionList;
    actInsert: TAction;
    actDelete: TAction;
    actClose: TAction;
    procedure actInsertExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    DBHANDLE : TISC_DB_HANDLE;
     ID_USER : Int64;
  public
    ID_OBJECT :Integer;
    ID_SESSION:Integer;
    ID_SCH     :Integer;
    Result :Variant;
    constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_USER: int64;_ID_SESSION:Integer;_ID_OBJECT:Integer; DATE_SESSION:TDateTime);overload;
  end;

var
  InvAddGroupForm: TInvAddGroupForm;

implementation

{$R *.dfm}
constructor TInvAddGroupForm.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; ID_USER : Int64;_ID_SESSION:Integer;_ID_OBJECT:Integer; DATE_SESSION:TDateTime);
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
   Self.DBgr.Close;
   Self.DBHANDLE:=DBHANDLE;
   Self.DBgr.Handle:=DBHANDLE;
   self.ID_OBJECT:=_ID_OBJECT;
   self.ID_SESSION:=_ID_SESSION;
 //  self.Date_SESSION_:=DATE_SESSION;
   self.btnacClose.Align:=alRight;
   with Self.DSgr do
   begin
     Close;
     ParamByName('Date').Value:=DATE_SESSION;
     ParamByName('ID_SESSION').Value:=_ID_SESSION;
     ParamByName('ID_OBJECT').Value:=_ID_OBJECT;
     CloseOpen(false);
   end;
 end;
end;

procedure TInvAddGroupForm.actInsertExecute(Sender: TObject);
var
  Res : Variant;
begin
  Res:=uPackageManager.LGetNomn(self, DBHandle, fsNormal, 0, id_sch , 0, 0, 0, 2, 0);
  if  VarType(Res) <> varEmpty then id_sch:=res[0];
  DSgr.CloseOpen(true);
  DSgr.parambyname('id_old_nomn').Value:=res[0];
  DSgr.CloseOpen(false);
  try
   TRgr.StartTransaction;
   StPrgr.StoredProcName:='MAT_FILTER_THREE_IN_TMP';
   StPrgr.Prepare;
   StPrgr.ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
   StPrgr.ParamByName('id_nomn_tree').AsInt64:=ID_SCH;
   StPrgr.ExecProc;
   StPrgr.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    StPrgr.Transaction.Rollback;
    Exit;
   end;
  end;

 try
   TRgr.StartTransaction;
   StPrgr.StoredProcName:='MAT_FILTER_THREE_IN_TMP_INV';
   StPrgr.Prepare;
   StPrgr.ParamByName('id_group').AsInt64:=ID_SCH;
   StPrgr.ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
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

{  try
   TRgr.StartTransaction;
   StPrgr.StoredProcName:='MAT_FILTER_THREE_IN_TMP_INV';
   StPrgr.Prepare;
   StPrgr.ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
   StPrgr.ParamByName('id_group').AsInt64:=ID_SCH;
   StPrgr.ExecProc;
   StPrgr.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    StPrgr.Transaction.Rollback;
    Exit;
   end;
  end;}
end;

procedure TInvAddGroupForm.actDeleteExecute(Sender: TObject);
var
  ID :integer;
begin
  if DSgr.IsEmpty then exit;
  ID:=DSgrID_KEY.AsInt64;
  try
   TRgr.StartTransaction;
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

procedure TInvAddGroupForm.actCloseExecute(Sender: TObject);
begin
 Close;
end;

procedure TInvAddGroupForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
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

end.
