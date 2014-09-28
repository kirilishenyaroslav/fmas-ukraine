unit uAddExceptPeriodUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons;

type
  TfmAddExceptPeriod = class(TForm)
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
  fmAddExceptPeriod: TfmAddExceptPeriod;

implementation

{$R *.dfm}

procedure TfmAddExceptPeriod.OkButtonClick(Sender: TObject);
begin
//comment
end;

procedure TfmAddExceptPeriod.FormCreate(Sender: TObject);
begin
  DateBeg.DateTime:=Date();
  DateEnd.DateTime:=Date();
end;

end.
