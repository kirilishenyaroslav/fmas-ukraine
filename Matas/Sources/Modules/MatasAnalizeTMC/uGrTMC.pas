unit uGrTMC;

interface

uses
  IBASE, GlobalSPR,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, cxGraphics, cxCustomData, cxStyles, cxTL,
  cxMaskEdit, cxClasses, cxGridTableView, DB, FIBQuery, pFIBQuery,
  pFIBStoredProc, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  cxInplaceContainer, cxDBTL, cxControls, cxTLData, cxCurrencyEdit;

type
  TAddGrTMCForm = class(TForm)
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
    procedure AddButtonClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DelButtonClick(Sender: TObject);
  private
    DBHANDLE : TISC_DB_HANDLE;
     ID_USER : Int64;
  public
    ID_OBJECT :Integer;
    ID_SESSION:Integer;

    ID_SCH     :Integer;
    Date_SESSION_:TDateTime;
    Result :Variant;

    constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_USER: int64;_ID_SESSION:Integer;_ID_OBJECT:Integer; DATE_SESSION:TDateTime;NameForm:String);overload;
  end;

var
  AddGrTMCForm: TAddGrTMCForm;

implementation

{$R *.dfm}
uses DateUtils,uPackageManager;


constructor TAddGrTMCForm.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; ID_USER : Int64;_ID_SESSION:Integer;_ID_OBJECT:Integer; DATE_SESSION:TDateTime;NameForm:String);
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
   Self.DBgr.Close;
   Self.DBHANDLE:=DBHANDLE;
   Self.DBgr.Handle:=DBHANDLE;
   Self.Caption:='Додати параметри фільтрації по :: '+NameForm;
   self.ID_OBJECT:=_ID_OBJECT;
   self.ID_SESSION:=_ID_SESSION;
   self.Date_SESSION_:=DATE_SESSION;
   self.ExitButton.Align:=alRight;
   with Self.DSgr do
   begin
     Close;
     ParamByName('Date').Value:=DATE_SESSION;
     ParamByName('ID_SESSION').Value:=_ID_SESSION;
     ParamByName('ID_OBJECT').Value:=_ID_OBJECT;
//:Date,:ID_SESSION,:ID_OBJECT
      CloseOpen(false);
   end;


 end;
end;
procedure TAddGrTMCForm.AddButtonClick(Sender: TObject);
var
  Res : Variant;
begin
    Res:=uPackageManager.LGetNomn(self, DBHandle, fsNormal, 0, id_sch , 0, 0, 0, 2, 0);
    if  VarType(Res) <> varEmpty then
    id_sch:=res[0];

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
    DSgr.CloseOpen(false);
    
end;

procedure TAddGrTMCForm.ExitButtonClick(Sender: TObject);
begin
close();
end;

procedure TAddGrTMCForm.FormClose(Sender: TObject;
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

procedure TAddGrTMCForm.DelButtonClick(Sender: TObject);
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

end.
