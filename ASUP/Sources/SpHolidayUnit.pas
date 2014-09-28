{-$Id: SpHolidayUnit.pas,v 1.3 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                                Модуль "Справочник отпусков"                  }
{       Отображает список типов отпусков, вызывает форму для добавления или
{       редактирования информации.                                             }
{                                             ответственный: Збуривский Данил  }

unit SpHolidayUnit;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    SpFormUnit, Db, IBCustomDataSet, IBQuery, Grids, DBGrids, Buttons,
    StdCtrls, ExtCtrls, AddHoliday, SpCommon, PersonalCommon, uSearchFrame;

type
    TSpHolidayForm = class(TSpForm)
        ResultQueryID_HOLIDAY: TIntegerField;
        ResultQueryNAME_HOLIDAY: TIBStringField;
        ResultQueryIS_MAIN: TIBStringField;
        ResultQueryDEFAULT_TERM: TIntegerField;
        ResultQueryIS_PAY: TIBStringField;
        ResultQueryID_VIDOPL: TIntegerField;
        ResultQueryVIHOD_TYPE: TIntegerField;
        ResultQueryVIHOD_NAME: TIBStringField;
        ResultQueryDONT_CALC_HOLIDAYS: TIBStringField;
        procedure AddButtonClick(Sender: TObject);
        procedure ModifyButtonClick(Sender: TObject);
        procedure DetailsButtonClick(Sender: TObject);
        procedure DeleteButtonClick(Sender: TObject);
        procedure ResultQueryIS_PAYGetText(Sender: TField; var Text: string;
            DisplayText: Boolean);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    SpHolidayForm: TSpHolidayForm;

implementation

{$R *.DFM}


procedure TSpHolidayForm.AddButtonClick(Sender: TObject);
var
    form: TAddHolidayForm;
begin
    if not GPP_Check then Exit;

    form := TAddHolidayForm.Create(Self);
    form.Prepare(emNew, -1);
    if form.ShowModal = mrOk then Refresh;
end;

procedure TSpHolidayForm.ModifyButtonClick(Sender: TObject);
var
    form: TAddHolidayForm;
begin
    if not GPP_Check then Exit;

    form := TAddHolidayForm.Create(Self);
    form.Prepare(emModify, ResultQuery['Id_Holiday']);
    if form.ShowModal = mrOk then Refresh;
end;

procedure TSpHolidayForm.DetailsButtonClick(Sender: TObject);
var
    form: TAddHolidayForm;
begin

    form := TAddHolidayForm.Create(Self);
    form.Prepare(emView, ResultQuery['Id_Holiday']);
    form.ShowModal;
end;

procedure TSpHolidayForm.DeleteButtonClick(Sender: TObject);
begin
    if not GPP_Check then Exit;
    inherited;
end;

procedure TSpHolidayForm.ResultQueryIS_PAYGetText(Sender: TField;
    var Text: string; DisplayText: Boolean);
begin
    if ResultQuery.IsEmpty then Exit;

    if ResultQuery['Is_Pay'] = 'T' then Text := 'Так'
    else Text := 'Ні';
end;

end.
