{******************************************************************************}
{               Автоматизированная система «Формирование планов основного      }
{                          производства ГПП «Укрпромводчермет»                 }
{               (c) Донецкий национальный университет, 2002-2003               }
{******************************************************************************}

{                   Модуль "Добавление периода документа плана"                }
{   Добавление и изменение периодов документа плана                            }
{                                               ответственный: Андрей Таганский}

unit dt_Stage_Add;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, DataModule, cxLookAndFeelPainters,
  cxButtons, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar;

type
  Tdt_Stage_Add_Form = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Bevel1: TBevel;
    DateTimePicker1: TcxDateEdit;
    DateTimePicker2: TcxDateEdit;
    Button1: TcxButton;
    Button2: TcxButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
   destructor Destroy; override;
  end;

var
  dt_Stage_Add_Form : Tdt_Stage_Add_Form;
  Date_Beg          : TDateTime;
  Date_End          : TDateTime;
  DateUpLimit       : TDateTime; // Date_End limit
  DateDawnLimit     : TDateTime; // Date_Beg limit

implementation

{$R *.DFM}

uses PlanEditor;

destructor Tdt_Stage_Add_Form.Destroy;
begin
 dt_Stage_Add_Form := nil;
 inherited;
end;

procedure Tdt_Stage_Add_Form.Button1Click(Sender: TObject);
begin
 if (Trunc(DateTimePicker1.Date) < Trunc(DateDawnLimit)) then begin
  ShowMessage('Дата початка повинна бути не меншою ніж ' + DateToStr(DateDawnLimit));
  Exit;
 end;

 if (Trunc(DateTimePicker2.Date) > Trunc(DateUpLimit)) then begin
  ShowMessage('Дата закінчення повинна бути не більшою ніж ' + DateToStr(DateUpLimit));
  Exit;
 end;

 if DateTimePicker2.Date - DateTimePicker1.Date < 1 then begin
  ShowMessage('Дата початку повинна бути більшою ніж дата закінчення!');
  Exit;
 end;

 Date_Beg := DateTimePicker1.Date;
 Date_End := DateTimePicker2.Date;

 ModalResult := mrOk;
end;

procedure Tdt_Stage_Add_Form.Button2Click(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

procedure Tdt_Stage_Add_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure Tdt_Stage_Add_Form.FormShow(Sender: TObject);
var
 Day, Month, Year : word;
begin
 DecodeDate(DateTimePicker1.Date, Year, Month, Day);
 if PlanEditorForm.YearPlan then
  if Month + 3 <= 12 then DateTimePicker2.Date := EncodeDate(Year, Month + 3, Day) - 1
  else DateTimePicker2.Date := EncodeDate(Year + 1, Month + 3 - 12, Day) - 1
 else
  if Month + 1 <= 12 then DateTimePicker2.Date := EncodeDate(Year, Month + 1, Day) - 1
  else DateTimePicker2.Date := EncodeDate(Year + 1, Month + 1 - 12, Day) - 1;
end;

end.
