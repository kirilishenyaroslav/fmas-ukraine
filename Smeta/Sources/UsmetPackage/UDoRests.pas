unit UDoRests;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,Ibase, cxLookAndFeelPainters, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, ComCtrls, StdCtrls,
  cxButtons, ExtCtrls, FIBDatabase, pFIBDatabase,pFibStoredProc;

type
  TfrmGetBuRests = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxDateEdit1: TcxDateEdit;
    Label1: TLabel;
    WorkDatabase: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    CalcTransaction: TpFIBTransaction;
    Panel5: TPanel;
    procedure cxButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;id_user:Integer);overload;
  end;


implementation

{$R *.dfm}
constructor TfrmGetBuRests.Create(AOwner: TComponent; DBHandle: TISC_DB_HANDLE;id_user: Integer);
begin
     inherited Create(AOwner);
     WorkDatabase.Handle:=DBHandle;
     CxDateEdit1.Date:=Date;
     CalcTransaction.StartTransaction;
end;

procedure TfrmGetBuRests.cxButton1Click(Sender: TObject);
var DoSP:TpFibStoredProc;
begin
    Screen.Cursor:=crHourGlass;
    panel5.Visible:=true;
    self.Update;
    Application.ProcessMessages;

    DoSP:=TpFibStoredProc.Create(nil);
    DoSP.Database   :=WorkDatabase;
    DoSP.Transaction:=WriteTransaction;
    WriteTransaction.StartTransaction;
    DoSP.StoredProcName:='BU_GET_BU_RESTS';
    DoSP.Prepare;
    DoSP.ParamByName('ACTUAL_DATE').value:=cxDateEdit1.Date;
    DoSP.ExecProc;
    if (DoSP.ParamByName('RESULT').AsInteger=1)
    then begin
              WriteTransaction.Commit;
              cxButton1.Caption:='Почати процес';
              ShowMessage('Процес розрахунку завершено!');
    end
    else begin
              WriteTransaction.Rollback;
              ShowMessage('Під час розрахунку виникли помилки!');
    end;
    Screen.Cursor:=crDefault;
    panel5.Visible:=false;
    DoSP.Free;
end;



procedure TfrmGetBuRests.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

end.
