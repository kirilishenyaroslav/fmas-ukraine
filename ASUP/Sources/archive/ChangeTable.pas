
{ -$Id: ChangeTable.pas,v 1.1.1.1 2005/07/07 10:35:16 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                        Модуль "Изменение табеля"                             }
{                         Правка табеля вручную                                }
{                                                  ответственный: Олег Волков  }

unit ChangeTable;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, SpComboBox, Mask, CheckEditUnit, ComCtrls,
  Spin, PersonalCommon, DateUtils, SpTimeUtils;

type
  TChangeTableForm = class(TForm)
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    HoursLabel: TLabel;
    HoursEdit: TCheckEdit;
    TimeRadio: TRadioButton;
    VihodRadio: TRadioButton;
    VihodBox: TSpComboBox;
    WorkModeRadio: TRadioButton;
    WorkModeBox: TSpComboBox;
    ShiftSpin: TSpinEdit;
    Label1: TLabel;
    Label8: TLabel;
    NomerEdit: TCheckEdit;
    WorkBegEdit: TCheckEdit;
    WorkEndEdit: TCheckEdit;
    Label4: TLabel;
    Label5: TLabel;
    BreakBegEdit: TCheckEdit;
    BreakEndEdit: TCheckEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure WorkBegPickerEnter(Sender: TObject);
    procedure VihodBoxEnter(Sender: TObject);
    procedure WorkModeBoxEnter(Sender: TObject);
    procedure HoursEditChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure WorkBegEditChange(Sender: TObject);
    procedure WorkBegEditExit(Sender: TObject);
  private
    ReactHour: Boolean;
  public
    { Public declarations }
  end;

var
  ChangeTableForm: TChangeTableForm;

implementation

{$R *.dfm}

procedure TChangeTableForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    VihodBox.SaveIntoRegistry;
    WorkModeBox.SaveIntoRegistry;
end;

procedure TChangeTableForm.WorkBegPickerEnter(Sender: TObject);
begin
    TimeRadio.Checked := True;
end;

procedure TChangeTableForm.VihodBoxEnter(Sender: TObject);
begin
    VihodRadio.Checked := True;
end;

procedure TChangeTableForm.WorkModeBoxEnter(Sender: TObject);
begin
    WorkModeRadio.Checked := True;
end;

procedure TChangeTableForm.HoursEditChange(Sender: TObject);
var
    h, m, sec: Integer;
    t: TTime;
begin
    if not ReactHour then Exit;

    DecodeTimeString(HoursEdit.Text, h, m, sec);

    try
        t := StringToTime(WorkBegEdit.Text);
        t := IncHour(t, h);
        t := IncMinute(t, m);
        t := IncSecond(t, sec);
        WorkEndEdit.Text := TimeToStr(t);
    except
    end;
end;


procedure TChangeTableForm.FormCreate(Sender: TObject);
begin
    ReactHour := True;
end;

procedure TChangeTableForm.WorkBegEditChange(Sender: TObject);
var
    wb, we, bb, be: TTime;
begin
    ReactHour := False;
    try
        wb := StringToTime(WorkBegEdit.Text);
        we := StringToTime(WorkEndEdit.Text);
        bb := StringToTime(BreakBegEdit.Text);
        be := StringToTime(BreakEndEdit.Text);
        HoursEdit.Text := EncodeTimeString(TimeDiff(wb, we) - TimeDiff(bb, be), False)
    except
    end;
end;

procedure TChangeTableForm.WorkBegEditExit(Sender: TObject);
begin
    ReactHour := True;
end;

end.
