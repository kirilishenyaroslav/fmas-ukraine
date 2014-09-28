unit uHolidayPageView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCommonSp, ActnList;

type
  TfmHolidayPageView = class(TForm)
    ActionList1: TActionList;
    CloseAction: TAction;
    procedure FormCreate(Sender: TObject);
    procedure CloseActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmHolidayPageView: TfmHolidayPageView;

implementation

uses uPlanHolidayOrder;
{$R *.dfm}

procedure TfmHolidayPageView.FormCreate(Sender: TObject);
var
    sprav : TSprav;
    Frame: TFrame;
begin
        sprav := GetSprav('Asup\HolidayPage');

        with sprav.Input do
        begin
            Append;
            FieldValues['Id_PCard'] := fmPlanHolidayOrder.SelectQueryID_PCARD.Value;
            FieldValues['DBHandle'] := Integer(fmPlanHolidayOrder.LocalDatabase.Handle);
            if Fields.FindField('Actual_Date') <> nil then
                FieldValues['Actual_Date'] := Date;
            FieldValues['Modify'] := True;
            Post;
        end;

        Frame := sprav.GetFrame;

        if not (Frame = nil)
        then begin
            Frame.Parent := Self;
            Frame.Align := alClient;
        end;

        Caption := 'Перегляд графіків відпусток для "' + fmPlanHolidayOrder.SelectQueryFIO.Value + '"';
end;

procedure TfmHolidayPageView.CloseActionExecute(Sender: TObject);
begin
    Close;
end;

end.
