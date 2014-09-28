unit LogInFormaUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ActnList, RxMemDS, IBase,uSpravControl, uCommonSp,
  FIBDatabase, pFIBDatabase, DB;

type
  TLogForm = class(TForm)
    Label2: TLabel;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    PasswordEdit: TEdit;
    ActionList1: TActionList;
    okAction: TAction;
    cancelAction: TAction;
    Database: TpFIBDatabase;
    ActionList2: TActionList;
    sel_ok: TAction;
    sel_cancel: TAction;
    procedure okActionExecute(Sender: TObject);
    procedure cancelActionExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sel_okExecute(Sender: TObject);
    procedure sel_cancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
   pass   : String;
   Output : TrxMemoryData;
   constructor Create(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; outp : TRxMemoryData); reintroduce;
    procedure SelectAll;
    { Public declarations }
  end;
  TUP_LogInForma = class(TSprav)
  public
    logfrm : TLogForm;
    constructor Create;
    procedure Show; override;
  end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;
implementation

uses uFControl;

{$R *.dfm}


function CreateSprav: TSprav;
begin
    Result := TUP_LogInForma.Create;
end;

constructor TUP_LogInForma.Create;
begin
    inherited Create;
    Output.FieldDefs.Add('PASS', ftString, 4096);
    PrepareMemoryDatasets;
end;

procedure TUP_LogInForma.Show;
begin
    logfrm := TLogForm.Create(Application.MainForm, TISC_DB_HANDLE(integer(Input['DBHandle'])), Output);
    begin
        logfrm.ShowModal;
    end;
end;

constructor TLogForm.Create(AOwner: TComponent; DBHandle: TISC_DB_HANDLE; outp : TRxMemoryData);
begin
    inherited Create(AOwner);
    Output := outp;
    Database.Handle := DBHandle;
end;


procedure TLogForm.SelectAll;
begin
end;

procedure TLogForm.okActionExecute(Sender: TObject);
begin
    Output.Open;
    Output.Append;
    Output['PASS']:=PasswordEdit.Text;
    Output.Post;
    ModalResult:=mrok;
end;

procedure TLogForm.cancelActionExecute(Sender: TObject);
begin
    close;
end;

procedure TLogForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then action := caFree;
end;

procedure TLogForm.sel_okExecute(Sender: TObject);
begin
    Output.Open;
    Output.Append;
    Output['PASS']:=PasswordEdit.Text;
    Output.Post;
    ModalResult:=mrok;
end;

procedure TLogForm.sel_cancelExecute(Sender: TObject);
begin
close;
end;

end.
