unit OperationEndUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, FIBQuery, pFIBQuery,
  pFIBStoredProc, FIBDatabase, pFIBDatabase,IBase,ZMessages, pFIBErrorHandler,ZProc,
  PackageLoad, cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls;

type
  TOperationEndForm = class(TForm)
    MainDatabase: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    WorkProc: TpFIBStoredProc;
    Panel1: TPanel;
    SaveAccountBtn: TcxButton;
    RemoveAccountBtn: TcxButton;
    UvBtn: TcxButton;
    CancelBtn: TcxButton;
    Panel2: TPanel;
    Label1: TLabel;
    procedure SaveAccountBtnClick(Sender: TObject);
    procedure RemoveAccountBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UvBtnClick(Sender: TObject);
  private
    pIsRollback:boolean;
    function ExecuteWorkProc(Commit:Boolean):Boolean;
  public
    constructor Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;IS_rollback:boolean);reintroduce;
  end;

  function ShowOperationEndForm(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;IS_rollback:boolean):Variant;stdcall;
   exports ShowOperationEndForm;




implementation

function ShowOperationEndForm(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;IS_Rollback:boolean):Variant;stdcall;
var
form: TOperationEndForm;
begin

   form:=TOperationEndForm.Create(AOwner,DB_HANDLE,IS_rollback);
   form.ShowModal;
   ShowOperationEndForm:=null;
   form.FreeNotification(form);


end;



{$R *.dfm}

{ TOperationEndForm }

constructor TOperationEndForm.Create(AOwner: TComponent;DB_HANDLE: TISC_DB_HANDLE;Is_Rollback:boolean);
var kod_op:variant;
    DONT_SAVE_CALC:Variant;
begin
    inherited Create(AOwner);
    MainDataBase.Handle:=DB_HANDLE;

    pIsRollback:=IS_rollback;


    if pIsRollback
    then begin
              Label1.Caption:='УВАГА! ВИ ХОЧЕТЕ ПЕРЕВЕСТИ СИСТЕМУ У ПОПЕРЕДНІЙ ПЕРІОД?'
    end
    else begin
              kod_op:=ValueFieldZSetup(MainDatabase.Handle,'UV_Z_KOD_ACTION');

              if kod_op<>null
              then begin
                        if kod_op = 1
                        then Label1.Caption:='УВАГА! ВИ ХОЧЕТЕ ЗБЕРЕГТИ РОЗРАХУНОК ЗАРОБІТНОЇ ПЛАТИ ТА ПЕРЕВЕСТИ СИСТЕМУ У НАСТУПНИЙ ПЕРІОД?'
                        else Label1.Caption:='УВАГА! ВИ ХОЧЕТЕ ЗБЕРЕГТИ РОЗРАХУНОК?';


                        DONT_SAVE_CALC:=NULL;
                        DONT_SAVE_CALC:=ValueFieldZSetup(MainDatabase.Handle, 'DONT_SAVE_CALC');
                        if DONT_SAVE_CALC=1
                        then SaveAccountBtn.Enabled:=false;
              end
              else Label1.Caption:='УВАГА! ВИ ХОЧЕТЕ ЗБЕРЕГТИ РОЗРАХУНОК?';
    end;


    if pIsRollback
    then begin
              SaveAccountBtn.Visible:=False;
              UvBtn.Visible:=False;
              RemoveAccountBtn.Caption:='Перевести період';
    end;

    self.Color := Application.MainForm.Color;
end;

function TOperationEndForm.ExecuteWorkProc(Commit:Boolean): Boolean;
begin

    if (not WriteTransaction.InTransaction) then WriteTransaction.StartTransaction;

    try
        WorkProc.ExecProc;
    except
    on  E:Exception do
      begin
          WriteTransaction.Rollback;
          ZShowMessage('Помилка!', PChar(E.Message),mtInformation, [mbOk]);
          ExecuteWorkProc:=False;
          Exit;
      end;
    end;


    if Commit then WriteTransaction.Commit;

    ExecuteWorkProc:=True;
end;

procedure TOperationEndForm.SaveAccountBtnClick(Sender: TObject);
begin
     WorkProc.SQL.Text:='EXECUTE PROCEDURE Z_PAYMENT_COUNT_OPERATION_END(''F'')';

     if ExecuteWorkProc(True)
     then begin
          ZShowMessage('Вдале завершення', 'Розрахунок збережений!', mtInformation,[mbOk]);
          ZProc.SetBeginAction(MainDataBase.Handle,0);
     end;
end;

procedure TOperationEndForm.RemoveAccountBtnClick(Sender: TObject);
begin
     if pIsRollback then WorkProc.SQL.Text:='EXECUTE PROCEDURE Z_PAYMENT_COUNT_OPERATION_END(''O'')'
                    else WorkProc.SQL.Text:='EXECUTE PROCEDURE Z_PAYMENT_COUNT_OPERATION_END(''T'')';


    if ExecuteWorkProc(True) then
    begin
        if not pIsRollback then ZShowMessage('Вдале завершення','Розрахунок вилучено!',mtInformation,[mbOk])
                       else ZShowMessage('Вдале завершення','Переведення системи завершено!!',mtInformation,[mbOk]);
        ZProc.SetBeginAction(MainDataBase.Handle,0);
    end;
end;

procedure TOperationEndForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if WriteTransaction.InTransaction then WriteTransaction.Commit;
end;

procedure TOperationEndForm.UvBtnClick(Sender: TObject);
var kodAction:variant;
    SumLimit:variant;
begin
  kodAction := ValueFieldZSetup(MainDatabase.Handle,'UV_Z_KOD_ACTION');
  SumLimit  := ValueFieldZSetup(MainDatabase.Handle,'UV_Z_LIMIT');

  if VarIsNull(kodAction) then
  begin
        ZShowMessage('Помилка','Не можливо переформувати!',mtInformation,[mbOk]);
        exit;
  end;

  WorkProc.Sql.Text:='EXECUTE PROCEDURE UV_END_OF_OPERATION(''F'',''F'')';

  if ExecuteWorkProc(True) then uvFormSheet(self,MainDatabase.Handle,kodAction,SumLimit);
end;

end.
