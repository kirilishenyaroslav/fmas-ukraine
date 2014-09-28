unit CTEditFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxTextEdit, cxButtons, ConstSumsDM,ZTypes,ZMessages,
  Unit_ZGlobal_Consts, FIBDatabase, pFIBDatabase, FIBQuery,
  pFIBQuery, pFIBStoredProc, Ibase, ZProc, cxLookAndFeelPainters,
  cxControls, cxContainer, cxEdit;

type
  TCTEditForm = class(TForm)
    ConstTypeEdit: TcxTextEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    DefaultTransaction: TpFIBTransaction;
    StProc: TpFIBStoredProc;
    DB: TpFIBDatabase;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    DM:TMainDM;
    FEditMode:TZControlFormStyle;
    PLanguageIndex:byte;
    PDb_handle:TISC_DB_HANDLE;
    PId:integer;
  public
    constructor Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;
                       EditMode:TZControlFormStyle;Id:integer);reintroduce;
    property Id:integer read PId;
  end;

var
  CTEditForm: TCTEditForm;

implementation

{$R *.dfm}
constructor TCTEditForm.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;
                       EditMode:TZControlFormStyle;Id:integer);
begin
    inherited Create(AOwner);
    FEditMode:=EditMode;
    PLanguageIndex:= LanguageIndex;
    PId:=Id;
    PDB_Handle:= DB_Handle;
    case FEditMode of
    zcfsInsert:
     begin
      Caption:=Caption_Insert[PLanguageIndex];
     end;
    zcfsUpdate:
    begin
     with StProc do
     begin
      Caption:=Caption_Update[PLanguageIndex];
      DB.Handle := PDb_handle;
      StoredProcName:='Z_SP_CONSTS_S_BY_ID';
      Transaction.StartTransaction;
      Prepare;
      ParamByName('IN_ID').AsInteger:= PId;
      ExecProc;
      ConstTypeEdit.Text:=ParamByName('CONST_NAME').AsString;
      Transaction.Commit;
    end;
  end;
 end;
end;
procedure TCTEditForm.cxButton1Click(Sender: TObject);
begin
Close;
end;

procedure TCTEditForm.cxButton2Click(Sender: TObject);
begin
  if (ConstTypeEdit.Text='') then
  begin
        ZShowMessage('Помилка!','Не вказана назва типу констант!',mtWarning,[mbOk]);
        ConstTypeEdit.SetFocus;
        Exit;
  end;
with StProc do
 try
    case FEditMode of
    zcfsInsert:
    begin
      DB.Handle := PDb_handle;
      StoredProcName:='Z_SP_CONSTS_I';
      Transaction.StartTransaction;
      Prepare;
      ParamByName('CONST_NAME').AsString:=ConstTypeEdit.Text;
      ExecProc;
      Transaction.Commit;
     end;
     zcfsUpdate:
     begin
      DB.Handle := PDb_handle;
      StoredProcName:='Z_SP_CONSTS_U';
      Transaction.StartTransaction;
      Prepare;
      ParamByName('ID').AsInteger:= PId;
      ParamByName('CONST_NAME').AsString:=ConstTypeEdit.Text;
      ExecProc;
      Transaction.Commit;
     end;
    end;
 except
    on e:exception do
    begin
      ZShowMessage('Помилка!',e.Message,mtError,[mbOk]);
      Transaction.Rollback;
    end;
end;
Close;
end;

end.






