unit AddExceptPeriodUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons;

type
  TAddExceptPeriodForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DateBeg: TDateTimePicker;
    DateEnd: TDateTimePicker;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    procedure OkButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddExceptPeriodForm: TAddExceptPeriodForm;

implementation

{$R *.dfm}

procedure TAddExceptPeriodForm.OkButtonClick(Sender: TObject);
begin
//comment
end;

procedure TAddExceptPeriodForm.FormCreate(Sender: TObject);
begin
  DateBeg.DateTime:=Date();
  DateEnd.DateTime:=Date();
end;

end.
