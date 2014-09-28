unit DataModule;

interface

uses
 Windows,  SysUtils, Classes, FIBDatabase, pFIBDatabase, cxGridTableView, cxClasses,
  cxStyles, cxTL, cxLookAndFeels, cxContainer, cxEdit, ImgList, Controls,
  pFIBErrorHandler, fib, Dialogs, SIBEABase, SIBFIBEA, FIBQuery, pFIBQuery,
  pFIBStoredProc, Graphics, Variants;

type
  Tdm = class(TDataModule)
    Database: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    pFibErrorHandler1: TpFibErrorHandler;
    SIBfibEventAlerter1: TSIBfibEventAlerter;
    pFIBStoredProc1: TpFIBStoredProc;
    pFIBQuery1: TpFIBQuery;
    cxStyleRepository1: TcxStyleRepository;
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
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    procedure pFibErrorHandler1FIBErrorEvent(Sender: TObject;
      ErrorValue: EFIBError; KindIBError: TKindIBError;
      var DoRaise: Boolean);
    procedure SIBfibEventAlerter1EventAlert(Sender: TObject;
      EventName: String; EventCount: Integer);
    procedure DatabaseAfterConnect(Sender: TObject);
    procedure EventAlerterEventAlert(Sender: TObject; EventName: String;
      EventCount: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

uses dogUnit, dogLoaderUnit, Forms;

{$R *.dfm}

procedure Tdm.pFibErrorHandler1FIBErrorEvent(Sender: TObject;
  ErrorValue: EFIBError; KindIBError: TKindIBError; var DoRaise: Boolean);
begin
  if KindIBError = keForeignKey then begin
  DoRaise := false;
  ShowMessage('Ошибка внешнего ключа');
 end;
end;

procedure Tdm.SIBfibEventAlerter1EventAlert(Sender: TObject;
  EventName: String; EventCount: Integer);
var
 i : Integer;
 Msg : string;
begin
(* if (EventName = 'DOG_CLOSE_ALL') and (not MainForm.isServerApp) then
 begin
   MainForm.OnCloseQuery := nil;
   MainForm.Close;
 end;
 if (EventName = 'DOG_USER_LOCATE') then MainForm.AddActiveUserToTable;

 if (EventName = 'DOG_MESSAGE') and (not MainForm.isServerApp) then
 begin
   dm.pFIBQuery1.Close;
   dm.pFIBQuery1.SQL.Text := 'select DOG_MESSAGE from dog_sys_options';
   dm.pFIBQuery1.ExecQuery;
   if dm.pFIBQuery1.RecordCount <> 0 then
   begin
     Msg := '';
     if not VarIsNull(dm.pFIBQuery1['DOG_MESSAGE'].Value) then Msg := dm.pFIBQuery1['DOG_MESSAGE'].AsString;
     if Msg <> '' then
     begin
{       msgForm := TmsgForm.Create(MainForm);
       msgForm.msgEdit.Text := Msg;
       msgForm.ShowModal;
       msgform.Free;}
       //agShowMessage(Msg);
     end;
   end;
   dm.pFIBQuery1.Close;
 end;
  *)

(* if EventName = 'DOG_GO_OFF' then
 begin
   if not MainForm.isServerApp then
   begin
     if not Assigned(frmDisabled) then
     begin
       frmDisabled := TfrmDisabled.Create(MainForm);
       frmDisabled.Show;
       for i := 0 to Screen.FormCount - 1 do Screen.Forms[i].Enabled := False;
       frmDisabled.Enabled := True;
//       frmDisabled.Left := MainForm.Left;
//       frmDisabled.Top := MainForm.Top;
//       frmDisabled.Width := MainForm.Width;
//       frmDisabled.Height := MainForm.Height;
       MainForm.Enabled := False;
//       frmDisabled.ShowModal;
     end;
   end;
   MainForm.isServerApp := False;
 end;
 if EventName = 'DOG_GO_ON' then
 begin
   if not MainForm.isServerApp then
   begin
     MainForm.Enabled := true;
     for i := 0 to Screen.FormCount - 1 do Screen.Forms[i].Enabled := true;
     if Assigned(frmDisabled) then
     begin
       frmDisabled.cc := True;
       frmDisabled.Close;
       frmDisabled.Free;
       frmDisabled := nil;
     end;
   end;
   MainForm.isServerApp := False;
 end;
  *)
 MainForm.isServerApp := False;
end;

procedure Tdm.DatabaseAfterConnect(Sender: TObject);
begin
{ if not SIBfibEventAlerter1.Registered then
   SIBfibEventAlerter1.RegisterEvents;}
end;

procedure Tdm.EventAlerterEventAlert(Sender: TObject; EventName: String;
  EventCount: Integer);
begin
  if EventName = 'SYS_USERS_LOCATE' then
  begin
    pFIBStoredProc1.Transaction.StartTransaction;
    pFIBStoredProc1.ExecProcedure('PROC_SYS_USERS_ADD', [1, SYS_ID_USER, GetCompName, GetIPAddress]);
    pFIBStoredProc1.Transaction.Commit;
  end;
end;

end.
