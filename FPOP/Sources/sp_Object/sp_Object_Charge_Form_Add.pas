{******************************************************************************}
{               Автоматизированная система «Формирование планов основного      }
{                          производства ГПП «Укрпромводчермет»                 }
{               (c) Донецкий национальный университет, 2002-2003               }
{******************************************************************************}

{              Модуль "Добавление характеристики объекта водоснабжения"        }
{       Добавление и изменение характеристик объектов водоснабжения ГПП        }
{                                               ответственный: Андрей Таганский}

unit sp_Object_Charge_Form_Add;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, ComCtrls, tagBaseTypes, tagSys_Options,
  cxLookAndFeelPainters, cxMaskEdit, cxDropDownEdit, cxCalendar, cxButtons,
  cxControls, cxContainer, cxEdit, cxTextEdit, ActnList, cxRadioGroup;

type
  Tsp_Object_Charge_Form_Add1 = class(TForm)
    Label2: TLabel;
    Label1: TLabel;
    Bevel1: TBevel;
    OK_Btn: TcxButton;
    Cancel_Btn: TcxButton;
    DateTimePicker1: TcxDateEdit;
    DateTimePicker2: TcxDateEdit;
    ActionList: TActionList;
    ActionExit: TAction;
    VolumeEdit: TcxTextEdit;
    PercentEdit: TcxTextEdit;
    Label3: TLabel;
    Label4: TLabel;
    VolumeButton: TcxRadioButton;
    PercentButton: TcxRadioButton;
    Bevel2: TBevel;
    procedure Button2Click(Sender: TObject);
    procedure DateFormCreate(Sender : TObject);
    procedure Button1Click(Sender: TObject);
    procedure VolumeEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure DateTimePicker1KeyPress(Sender: TObject; var Key: Char);
    procedure DateTimePicker2KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionExitExecute(Sender: TObject);
    procedure VolumeButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
   destructor Destroy; override;
  end;

var
  sp_Object_Charge_Form_Add1 : Tsp_Object_Charge_Form_Add1;
  SelCombo     : TComboBox;
  DateForm     : TForm;
  Min_Date_Num : integer;
  State        : boolean;
implementation

uses sp_Object_Form, DataModule, cxCustomData;

{$R *.DFM}

procedure Tsp_Object_Charge_Form_Add1.Button2Click(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

procedure Tsp_Object_Charge_Form_Add1.DateFormCreate(Sender : TObject);
begin
 Application.CreateForm(TForm, DateForm);
 DateForm.Caption := 'Введите дату';
end;

procedure Tsp_Object_Charge_Form_Add1.Button1Click(Sender: TObject);
var
 i        : integer;
 min_date : TDateTime;
 Year1,
 Year2,
 Month1,
 Month2,
 Day1,
 Day2     : Word;
 Flag     : boolean;
begin
 Flag := False;
 DecodeDate(DateTimePicker1.Date, Year1, Month1, Day1);
 DecodeDate(DateTimePicker2.Date, Year2, Month2, Day2);
 if (Year1 = Year2) and (Month1 = Month2) and (Day1 = Day2) then Flag := True;
 if Flag or (DateTimePicker1.Date > DateTimePicker2.Date) then begin
  ShowMessage('Дата початку повинна бути менше дати закінчення!');
  Exit;
 end;

 if not State then begin
  if sp_Object_Form1.StringGrid1.DataController.RecordCount > 0 then begin
   min_date := StrToDate(sp_Object_Form1.StringGrid1.DataController.Values[0, 4]);
   for i := 0 to sp_Object_Form1.StringGrid1.DataController.RecordCount - 1 do begin
    if min_date < StrToDate(sp_Object_Form1.StringGrid1.DataController.Values[i, 4]) then
    min_date := StrToDate(sp_Object_Form1.StringGrid1.DataController.Values[i, 4]);
   end;
  end
  else min_date := SYS_MIN_TIMESTAMP;
 end
 else begin
  if sp_Object_Form1.StringGrid1.DataController.FocusedRowIndex <> 0 then begin
   min_date := StrToDate(sp_Object_Form1.StringGrid1.DataController.Values[0, 4]);
   for i := 0 to sp_Object_Form1.StringGrid1.DataController.FocusedRowIndex - 1 do begin
    if min_date < StrToDate(sp_Object_Form1.StringGrid1.DataController.Values[i, 4]) then
    min_date := StrToDate(sp_Object_Form1.StringGrid1.DataController.Values[i, 4]);
   end;
  end
  else min_date := SYS_MIN_TIMESTAMP;
 end;

 if DateTimePicker1.Date < min_date then begin
  ShowMessage('Дата початку повинна бути більше ніж ' + PChar(DateToStr(min_date)));
  Exit;
 end;

 if State
 and (sp_Object_Form1.StringGrid1.DataController.FocusedRowIndex < sp_Object_Form1.StringGrid1.DataController.RecordCount - 1)
 and (StrToDate(sp_Object_Form1.StringGrid1.DataController.Values[sp_Object_Form1.StringGrid1.DataController.FocusedRowIndex + 1, 3]) <=
 DateTimePicker2.Date) then begin
  ShowMessage('Дата закінчення повинна бути менше ніж '
  + sp_Object_Form1.StringGrid1.DataController.Values[sp_Object_Form1.StringGrid1.DataController.FocusedRowIndex + 1, 3]);
  Exit;
 end;

 if (VolumeEdit.Text = '') or (PercentEdit.Text = '') then begin
  ShowMessage('Правильно введить об''єм та відсоток');
  Exit;
 end;

 ModalResult := mrOk;
end;

procedure Tsp_Object_Charge_Form_Add1.VolumeEditKeyPress(Sender: TObject; var Key: Char);
begin
 if not (Key in ['0'..'9',#8, #46, #9, #13]) then Key := #0;
 if Key = #13 then begin
  if Sender = VolumeEdit then PercentEdit.SetFocus
  else OK_Btn.SetFocus;
 end;
end;

procedure Tsp_Object_Charge_Form_Add1.FormCreate(Sender: TObject);
begin
 DateTimePicker1.Date := Date;
 DateTimePicker2.Date := Date;

 VolumeButtonClick(Sender);
end;

procedure Tsp_Object_Charge_Form_Add1.DateTimePicker1KeyPress(
  Sender: TObject; var Key: Char);
begin
 if Key = #13 then DateTimePicker2.SetFocus;
end;

procedure Tsp_Object_Charge_Form_Add1.DateTimePicker2KeyPress(
  Sender: TObject; var Key: Char);
begin
 if Key = #13 then VolumeEdit.SetFocus;
end;

destructor Tsp_Object_Charge_Form_Add1.Destroy;
begin
  sp_Object_Charge_Form_Add1 := nil;
  inherited;
end;

procedure Tsp_Object_Charge_Form_Add1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure Tsp_Object_Charge_Form_Add1.ActionExitExecute(Sender: TObject);
begin
 Button2Click(Sender);
end;

procedure Tsp_Object_Charge_Form_Add1.VolumeButtonClick(Sender: TObject);
begin
 VolumeEdit.Enabled  := VolumeButton.Checked;
 PercentEdit.Enabled := PercentButton.Checked;
end;

end.
