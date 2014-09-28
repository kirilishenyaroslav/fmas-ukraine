unit uOkladInc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFControl, uLabeledFControl, uDateControl, StdCtrls, Buttons,
  uFormControl, uLogicCheck, uCharControl, uFloatControl, FIBDataBase,
  pFIBDatabase;

type
  TfmIncOklads = class(TForm)
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    Date_From: TqFDateControl;
    FormControl: TqFFormControl;
    qFLogicCheck1: TqFLogicCheck;
    Label1: TLabel;
    procedure OkButtonClick(Sender: TObject);
    procedure qFLogicCheck1Check(Sender: TObject; var Error: String);
    procedure FormControlNewRecordAfterPrepare(Sender: TObject);
    procedure FormControlDatabaseEventBefore(Sender: TObject; Form: TForm;
      Mode: TFormMode; Transaction: TFIBTransaction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmIncOklads: TfmIncOklads;

implementation

{$R *.dfm}

uses qFTools, DateUtils, UpKernelUnit;

procedure TfmIncOklads.OkButtonClick(Sender: TObject);
begin
    FormControl.Ok;
end;

procedure TfmIncOklads.qFLogicCheck1Check(Sender: TObject;
  var Error: String);
begin
    if qFConfirm('Справді бажаєте здійснити розрахунок довідника окладів?') then
        Error := ''
    else Error := 'Відмінено користувачем!';
end;

procedure TfmIncOklads.FormControlNewRecordAfterPrepare(Sender: TObject);
begin
    Date_From.Value := EncodeDate(YearOf(Date), 1, 1);
end;

procedure TfmIncOklads.FormControlDatabaseEventBefore(Sender: TObject;
  Form: TForm; Mode: TFormMode; Transaction: TFIBTransaction);
begin
     UpKernelUnit.StartHistory(TpFIBTransaction(Transaction));
end;

end.
