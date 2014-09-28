unit uFormNewShtat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, uFloatControl, uDateControl, uFControl,
  uLabeledFControl, uCharControl, uFormControl, uInvisControl, uLogicCheck;

type
  TfmFormNewShtat = class(TForm)
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    qFCharControl1: TqFCharControl;
    Date_Beg: TqFDateControl;
    Date_End: TqFDateControl;
    Inc_Percent: TqFFloatControl;
    Label1: TLabel;
    FormControl: TqFFormControl;
    OLD_SR: TqFInvisControl;
    qFLogicCheck1: TqFLogicCheck;
    procedure FormControlNewRecordAfterPrepare(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure qFLogicCheck1Check(Sender: TObject; var Error: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmFormNewShtat: TfmFormNewShtat;

implementation

{$R *.dfm}

uses DateUtils, qFTools;

procedure TfmFormNewShtat.FormControlNewRecordAfterPrepare(
  Sender: TObject);
begin
    Date_Beg.Value := EncodeDate(YearOf(Date), 1, 1);
    Date_End.Value := EncodeDate(YearOf(Date), 12, 31);
    Inc_Percent.Value := 0;
end;

procedure TfmFormNewShtat.OkButtonClick(Sender: TObject);
begin
    FormControl.Ok;
end;

procedure TfmFormNewShtat.qFLogicCheck1Check(Sender: TObject;
  var Error: String);
begin
    if qFConfirm('Справді бажаєте створити новий документ ШР?') then
        Error := ''
    else Error := 'Відмінено користувачем!';
end;

end.
