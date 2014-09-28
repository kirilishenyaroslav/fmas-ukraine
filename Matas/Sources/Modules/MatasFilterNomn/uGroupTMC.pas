unit uGroupTMC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxMaskEdit, ActnList,
  cxClasses, cxGridTableView, DB, FIBQuery, pFIBQuery, pFIBStoredProc,
  FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, cxInplaceContainer,
  cxDBTL, cxControls, cxTLData, Buttons, ExtCtrls, ibase, Menus;

type
  TAddGroupTMC = class(TForm)
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
    btnInsert: TSpeedButton;
    pm1: TPopupMenu;
    N1: TMenuItem;
    btnInsert1: TSpeedButton;
    actSaveShablon: TAction;
    actShablon: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actInsertExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure actSaveShablonExecute(Sender: TObject);
    procedure actShablonExecute(Sender: TObject);
  private
    DBHANDLE : TISC_DB_HANDLE;
     ID_USER : Int64;
  public
    ID_OBJECT :Integer;
    ID_SESSION:Integer;

    is_pos:Integer;
    ID_SCH     :Integer;
    Date_SESSION_:TDateTime;
    Result :Variant;
    id_shablon: Integer;
    constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_USER: int64;_ID_SESSION:Integer;_ID_OBJECT:Integer; DATE_SESSION:TDateTime;NameForm:String; POS:Integer);overload;
  end;

  function GetGruppTMC(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; ID_USER : Int64;_ID_SESSION:Integer;_ID_OBJECT:Integer; DATE_SESSION:TDateTime;NameForm:String; POS:Integer):Variant;stdcall;
  exports  GetGruppTMC;

var
  AddGroupTMC: TAddGroupTMC;

implementation

{$R *.dfm}
uses DateUtils, uPackageManager, uAddShablon, uShablon;

function GetGruppTMC(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; ID_USER : Int64;_ID_SESSION:Integer;_ID_OBJECT:Integer; DATE_SESSION:TDateTime;NameForm:String; POS:Integer):Variant;
var
    form : TAddGroupTMC;
begin
    form := TAddGroupTMC.Create(AOwner, DBHANDLE, ID_USER, _ID_SESSION, _ID_OBJECT, DATE_SESSION, NameForm, POS);
    form.ID_USER := ID_USER;
    Form.ShowModal;
    GetGruppTMC := form.Result;
    form.Free;
end;

constructor TAddGroupTMC.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; ID_USER : Int64;_ID_SESSION:Integer;_ID_OBJECT:Integer; DATE_SESSION:TDateTime;NameForm:String; POS:Integer);
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
   is_pos:=POS;
//   self.ExitButton.Align:=alRight;
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

procedure TAddGroupTMC.FormClose(Sender: TObject;
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

procedure TAddGroupTMC.actInsertExecute(Sender: TObject);
var
  Res : Variant;
begin
  Res:=uPackageManager.LGetNomn(self, DBHandle, fsNormal, 0, id_sch , 0, 0, 0, 2, 0);
  if  VarType(Res) <> varEmpty then id_sch:=res[0];
 // DSgr.Close;
 // DSgr.SelectSQL.Clear;
//  DSgr.SelectSQL.Add('select * from MAT_TMP_FILTER_ANALAZE_SEL_THRE(:Date,:ID_SESSION,:ID_OBJECT,:id_old_nomn) ');
  DSgr.CloseOpen(true);
  DSgr.parambyname('id_old_nomn').Value:=res[0];
 // DSgr.ParamByName('Date').Value:=DATE_SESSION_;
//  DSgr.ParamByName('ID_SESSION').Value:=ID_SESSION;
//  DSgr.ParamByName('ID_OBJECT').Value:=ID_OBJECT;
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

  if is_pos = 1 then
  begin
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
  end;
  DSgr.CloseOpen(false);

end;

procedure TAddGroupTMC.actDeleteExecute(Sender: TObject);
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

   if is_pos = 1 then
  begin
     try
   TRgr.StartTransaction;
   StPrgr.StoredProcName:='MAT_FILTER_THREE_DEL_TMP_INV';
   StPrgr.Prepare;
   StPrgr.ParamByName('id_group').AsInt64:=ID;
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
  end;
  DSgr.CloseOpen(false);
end;

procedure TAddGroupTMC.actCloseExecute(Sender: TObject);
begin
Close;
end;

procedure TAddGroupTMC.actSaveShablonExecute(Sender: TObject);
var f:TNewShablonForm;
begin
  if DSgr.IsEmpty then exit;
  f:=TNewShablonForm.Create(Self);
  if Length(DSgrNAME.AsString)>=50 then
  f.cxTextEdit1.Text:=Copy(DSgrNAME.AsString, 1, 50)
  else f.cxTextEdit1.Text:=Copy(DSgrNAME.AsString, 1, 10);
  f.ShowModal;
  if f.ModalResult = mrOk then
  begin
   try
   TRgr.StartTransaction;
   StPrgr.StoredProcName:='MAT_SHABLON_INS';
   StPrgr.Prepare;
   StPrgr.ParamByName('NAME_SHABLON').AsString:=f.cxTextEdit1.Text;
   StPrgr.ExecProc;
   StPrgr.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    StPrgr.Transaction.Rollback;
    Exit;
   end;
  end;
  id_shablon:=StPrgr.ParamByName('ID_SHABLON').Value;
   try
   TRgr.StartTransaction;
   StPrgr.StoredProcName:='MAT_INV_OBJECT_SHABLON_INS';
   StPrgr.Prepare;
   StPrgr.ParamByName('ID_SESSION').AsInteger:=ID_SESSION;
   StPrgr.ParamByName('ID_SHABLON').AsInteger:=id_shablon;
   StPrgr.ExecProc;
   StPrgr.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    StPrgr.Transaction.Rollback;
    Exit;
   end;
  end;
  end;
   DSgr.CloseOpen(false);
end;

procedure TAddGroupTMC.actShablonExecute(Sender: TObject);
var f:TShablonForm;
    id:Integer;
begin
 f:=TShablonForm.Create(Self);
 f.DS_SHABLON.CloseOpen(False);
 f.ShowModal;
 if f.ModalResult = mrOk then
 begin
   id:=f.DS_SHABLONID_SHABLON.AsInteger;
   try
   TRgr.StartTransaction;
   StPrgr.StoredProcName:='MAT_CLEAR_TMP_BY_SESSION';
   StPrgr.Prepare;
   StPrgr.ParamByName('ID_SESSION').AsInteger:=ID_SESSION;
   StPrgr.ExecProc;
   StPrgr.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    StPrgr.Transaction.Rollback;
    Exit;
   end;
  end;
//   DSgr.CloseOpen(False);

   try
   TRgr.StartTransaction;
   StPrgr.StoredProcName:='MAT_TMP_FILTER_SHABLON';
   StPrgr.Prepare;
   StPrgr.ParamByName('ID_SHABLON').AsInteger:=id;
   StPrgr.ParamByName('ID_SESSION').AsInteger:=ID_SESSION;
   StPrgr.ExecProc;
   StPrgr.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    StPrgr.Transaction.Rollback;
    Exit;
   end;
  end;


 { DSgr.Close;
  DSgr.SelectSQL.Clear;
  DSgr.SelectSQL.Add(' select * from MAT_TMP_FILTER_SHABLON(:ID_SHABLON)');
  DSgr.ParamByName('ID_SHABLON').AsInteger:= DS_SHABLONID_SHABLON.AsInteger;  }
  DSgr.CloseOpen(False);
 end;
  DSgr.CloseOpen(false);
end;

end.
