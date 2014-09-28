{******************************************************************************}
{               Автоматизированная система управления персоналом               }
{                                                                              }
{               (c) Донецкий национальный университет, 2002-2005               }
{******************************************************************************}

{                      Пакет "Справочник должностей"                           }
{                 Модуль добавления/изменения отпусков                         }
{                                               ответственный: Тимофеев Антон  }
unit U_SP_Post_Holliday_Add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, SpComboBox, Buttons, ComCtrls, FieldControl, SpCommon,
  EditControl, uDateControl, uFControl, uLabeledFControl, uSpravControl,
  uFormControl, uLogicCheck, uSimpleCheck, U_SPPost_DataModule, ActnList;

type
  TSP_post_holiday_Add = class(TForm)
    SbOk: TBitBtn;
    SbCancel: TBitBtn;
    IdPostHoliday: TqFSpravControl;
    Date_Beg: TqFDateControl;
    Date_End: TqFDateControl;
    FormControl: TqFFormControl;
    qFSimpleCheck1: TqFSimpleCheck;
    ActionList1: TActionList;
    AcceptButton: TAction;
    CancelAction: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure IdPostHolidayOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure AcceptButtonExecute(Sender: TObject);
    procedure CancelActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    HolidayLong : Integer;
    HolidayName: String;
    DM: TDMSPPost;

    procedure Prepare;
  end;

var
  SP_post_holiday_Add: TSP_post_holiday_Add;

implementation

{$R *.dfm}

uses DateUtils, qFTools, uHolidayLong;

procedure TSP_post_holiday_Add.FormCreate(Sender: TObject);
begin
  Date_End.Value :=Infinity_Date;
  IdPostHoliday.ShowFocus;
end;

procedure TSP_post_holiday_Add.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qFAutoSaveIntoRegistry(Self);
end;

procedure TSP_post_holiday_Add.IdPostHolidayOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    form: TSpHolidayLong;
begin
    form := TSpHolidayLong.Create(Self);
    form.DM := DM;
    form.ActionControl.Database := DM.FIBDatabase;
    form.ActionControl.SelectDataSet := DM.HolidayLongQuery;
    form.HolidayLongView.DataController.DataSource := DM.HolidayLong;
    DM.HolidayLongQuery.Open;

    if form.ShowModal = mrOk then
    begin
        Value := DM.HolidayLongQuery['Id_Post_Holiday'];
        DisplayText := DM.HolidayLongQuery['Holiday_Type_Full_Name'] +
            '(' + IntToStr(DM.HolidayLongQuery['Holiday_Long']) + ')';
        HolidayLong := DM.HolidayLongQuery['Holiday_Long'];
        HolidayName := DM.HolidayLongQuery['Holiday_Type_Full_Name'];
    end;
    form.Free;
end;

procedure TSP_post_holiday_Add.AcceptButtonExecute(Sender: TObject);
begin
    FormControl.Check;
    ModalResult := mrOk;
end;

procedure TSP_post_holiday_Add.CancelActionExecute(Sender: TObject);
begin
    SbCancel.Click;
end;

procedure TSP_post_holiday_Add.Prepare;
begin
  Date_Beg.Value := DM.Base_Date;
end;

end.
