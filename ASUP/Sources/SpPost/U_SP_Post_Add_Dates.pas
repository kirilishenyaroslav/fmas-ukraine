unit U_SP_Post_Add_Dates;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ActnList;

type
  TFDates = class(TForm)
    Label3: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    DTP_Beg: TDateTimePicker;
    Label2: TLabel;
    DTP_End: TDateTimePicker;
    SbOk: TBitBtn;
    SbCancel: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    ActionList1: TActionList;
    AcceptAction: TAction;
    CancelAction: TAction;
    procedure AcceptActionExecute(Sender: TObject);
    procedure CancelActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDates: TFDates;

implementation

{$R *.dfm}

procedure TFDates.AcceptActionExecute(Sender: TObject);
begin
  if not (DTP_Beg.Date<=DTP_End.Date) then
   begin
     MessageDlg('ƒата початку маЇ бути не меншою за дату к≥нц€!',mtError,[mbYes],0);
     ModalResult := 0;
     Exit;
   end;
  ModalResult := mrOk;
end;

procedure TFDates.CancelActionExecute(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

end.
