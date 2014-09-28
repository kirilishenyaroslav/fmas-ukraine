unit uSchInvMna;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, StdCtrls, Buttons, FIBQuery, pFIBQuery,
  pFIBStoredProc, FIBDatabase, pFIBDatabase, cxSpinEdit, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, IBASE,
  DateUtils, uMatasVars, uMatasUtils,  uResources, cxLookAndFeelPainters,
  cxButtons;

type
  TInvMnaForm = class(TForm)
    ActionList1: TActionList;
    acOk: TAction;
    acCansel: TAction;
    Label1: TLabel;
    WorkDatabase: TpFIBDatabase;
    Trans: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    cxMonth: TcxComboBox;
    cxYear: TcxSpinEdit;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    procedure acCanselExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acOkExecute(Sender: TObject);

  private
   DBHANDLE : TISC_DB_HANDLE;
   ID_USER : Int64;
  public
   MatasMonth, MatasYear: Word;
   tip:Integer;
   constructor Create(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; ID_USER: int64; aType:integer);overload;
  end;

  procedure SchInvMna(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aType:integer);stdcall;
  exports SchInvMna;

var
  InvMnaForm: TInvMnaForm;

implementation

{$R *.dfm}
procedure SchInvMna(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aType:integer);stdcall;
begin
 TInvMnaForm.Create(aOwner, aDBHANDLE, aID_USER, aType);
end;

constructor TInvMnaForm.Create(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; ID_USER : Int64; aType:integer);
var  dy, dm, dd: Word;
begin
 inherited Create(AOwner);
 if Assigned(aDBHandle)
 then begin
   Self.DBHANDLE := aDBHandle;
   Self.ID_USER:=ID_USER;
   Self.WorkDatabase.Handle:=aDBHANDLE;
   self.tip:=aType;
 end;
end;

procedure TInvMnaForm.acCanselExecute(Sender: TObject);
begin
 Close;
end;

procedure TInvMnaForm.FormCreate(Sender: TObject);
var
  dd, dm, dy: Word;
begin
 DecodeDate(_MATAS_PERIOD, dy, dm, dd);
 LoadMonthTocxComboBox(cxMonth);
 cxMonth.ItemIndex:=dm-1;
 cxYear.Value:=dy;
end;

procedure TInvMnaForm.acOkExecute(Sender: TObject);
begin
if tip=1 then
 begin
  try
    StoredProc.Transaction.StartTransaction;
    StoredProc.StoredProcName:='MAT_UTIL_EXP_INV_OSTB';
    StoredProc.Prepare;
    StoredProc.ParamByName('DATE_REC').Value:=StartOfAMonth(cxYear.Value, cxMonth.ItemIndex+1);
    StoredProc.ExecProc;
    StoredProc.Transaction.Commit;
  except on E : Exception
   do begin
     ShowMessage(MAT_STR_SAVE_ERROR);
     StoredProc.Transaction.Rollback;
     exit;
   end;
  end;
 end;
if tip=2 then
 begin
  try
    StoredProc.Transaction.StartTransaction;
    StoredProc.StoredProcName:='MAT_UTIL_EXP_MNA_OSTB';
    StoredProc.Prepare;
    StoredProc.ParamByName('DATE_REC').Value:=StartOfAMonth(cxYear.Value, cxMonth.ItemIndex+1);
    StoredProc.ExecProc;
    StoredProc.Transaction.Commit;
  except on E : Exception
   do begin
     ShowMessage(MAT_STR_SAVE_ERROR);
     StoredProc.Transaction.Rollback;
     exit;
   end;
  end;
 end;
 Close;
end;

end.
