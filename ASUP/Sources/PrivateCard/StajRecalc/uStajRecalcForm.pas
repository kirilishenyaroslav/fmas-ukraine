unit uStajRecalcForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, uFControl, uLabeledFControl, uDateControl,
  FIBQuery, pFIBQuery, FIBDatabase, pFIBDatabase, IBase;

type
  TStajRecalcForm = class(TForm)
    pFIBD_FullDB: TpFIBDatabase;
    pFIBT_Recalc: TpFIBTransaction;
    pFIBQ_Recalc: TpFIBQuery;
    qFDC_ActDate: TqFDateControl;
    CancelButton: TBitBtn;
    OkButton: TBitBtn;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent; Hnd: integer); reintroduce;
  end;

var
  StajRecalcForm: TStajRecalcForm;

implementation

{$R *.dfm}

uses NagScreenUnit;

constructor TStajRecalcForm.Create(AOwner: TComponent; Hnd: integer);
begin
    inherited Create(AOwner);
    pFIBD_FullDB.Handle:=TISC_DB_HANDLE(hnd);
    pFIBD_FullDB.Open;
end;

procedure TStajRecalcForm.OkButtonClick(Sender: TObject);
begin
  if VarIsNull(qFDC_ActDate.Value) then
   begin
     MessageDlg('Помилка: необхідно заповнити дату перерахунку! ',mtError,[mbYes],0);
     ModalResult:=0;
     Exit;
   end;

  try
    NagScreen := TNagScreen.Create(nil);
    NagScreen.Show;
    NagScreen.SetStatusText('Перераховується стаж...');
    pFIBT_Recalc.StartTransaction;
    pFIBQ_Recalc.ParamByName('act_date').AsDate:=qFDC_ActDate.Value;
    pFIBQ_Recalc.ExecProc;
    pFIBT_Recalc.Commit;
    NagScreen.Free;
    ModalResult := mrOk;
  except on e: Exception do
  begin
    pFIBT_Recalc.Rollback;
    NagScreen.Free;
    MessageDlg('Помилка: '+e.Message,mtError,[mbYes],0);
    ModalResult := 0;
  end;
  end;
end;

procedure TStajRecalcForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

end.
