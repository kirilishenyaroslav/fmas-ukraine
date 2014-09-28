unit uDismissAddForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, uFormControl, ActnList, StdCtrls,
  Buttons, uInvisControl, uCharControl, uIntControl, uDateControl,
  uFControl, uLabeledFControl, uSpravControl, uCommonSp, qFTools, DB,
  FIBDataSet, pFIBDataSet, uSelectForm, DateUtils, dmDismissSovmestOrder;

type
  TfmDismissDate = class(TForm)
    OkButton: TBitBtn;
    KeyList: TActionList;
    OkAction: TAction;
    CancelAction: TAction;
    PeriodBeg: TqFDateControl;
    procedure CancelActionExecute(Sender: TObject);
    procedure OkActionExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  fmDismissDate: TfmDismissDate;

implementation

{$R *.dfm}

procedure TfmDismissDate.CancelActionExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmDismissDate.OkActionExecute(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TfmDismissDate.FormShow(Sender: TObject);
begin
  PeriodBeg.Value := EncodeDate(YearOf(Date), 6, 30);
end;

initialization
    RegisterClass(TfmDismissDate);

end.
