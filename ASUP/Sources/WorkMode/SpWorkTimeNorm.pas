
{ -$Id: SpWorkTimeNorm.pas,v 1.2 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                 Модуль "Справочник норм рабочего времени"                    }
{               Работа со справочником норм рабочего времени                   }
{                                                  ответственный: Олег Волков  }

unit SpWorkTimeNorm;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    SpFormUnit, Db, IBCustomDataSet, IBQuery, StdCtrls, ExtCtrls, ComCtrls,
    Buttons, ToolWin, Grids, DBGrids, AddWorkTimeNorm, EditControl,
    PersonalCommon, SpCommon, uSearchFrame;

type
    TSpWorkTimeForm = class(TSpForm)
        ResultQueryWTYEAR: TIntegerField;
        ResultQueryWTMONTH: TIntegerField;
        ResultQueryKOL_HOURS: TIBBCDField;
        procedure AddButtonClick(Sender: TObject);
        procedure ModifyButtonClick(Sender: TObject);
        procedure ShowChangeForm(Mode: TEditMode);
        procedure DeleteButtonClick(Sender: TObject);
        procedure ResultQueryWTMONTHGetText(Sender: TField; var Text: string;
            DisplayText: Boolean);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    SpWorkTimeForm: TSpWorkTimeForm;

implementation

{$R *.DFM}

procedure TSpWorkTimeForm.ShowChangeForm(Mode: TEditMode);
var
    form: TAddWorkTimeForm;
    year, month: Integer;
begin
    if ResultQuery.IsEmpty and (Mode = emModify) then
    begin
        MessageDlg('Нема чого змінювати - пустий довідник',
            mtError, [mbOk], 0);
        Exit;
    end;

    form := TAddWorkTimeForm.Create(Self);

    if Mode = emModify then
    begin
        year := ResultQuery['wtYear'];
        month := ResultQuery['wtMonth'];
    end
    else
    begin
        year := -1;
        month := -1;
    end;

    form.Prepare(year, month, Mode);

    if form.ShowModal = mrOk then Refresh;
    form.Free;
end;

procedure TSpWorkTimeForm.AddButtonClick(Sender: TObject);
begin
    if not GPP_Check then Exit;
    ShowChangeForm(emNew);
end;

procedure TSpWorkTimeForm.ModifyButtonClick(Sender: TObject);
begin
    if not GPP_Check then Exit;
    ShowChangeForm(emModify);
end;

procedure TSpWorkTimeForm.DeleteButtonClick(Sender: TObject);
begin
    if not GPP_Check then Exit;
    if ResultQuery.IsEmpty then
    begin
        MessageDlg('Нема чого вилучати - пустий довідник',
            mtError, [mbOk], 0);
        Exit;
    end;

    if MessageDlg('Чи справді ви бажаєте вилучити це значення?',
        mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

    WorkQuery.SQL.Text := 'EXECUTE PROCEDURE dt_WorkTimeNorm_Delete ' +
        IntToStr(ResultQuery['wtYear']) + ',' +
        IntToStr(ResultQuery['wtMonth']);
    ExecQuery(WorkQuery);
    Refresh;
end;

procedure TSpWorkTimeForm.ResultQueryWTMONTHGetText(Sender: TField;
    var Text: string; DisplayText: Boolean);
const
    Months: array[1..12] of string = ('січень', 'лютий', 'березень',
        'квітень', 'травень', 'червень', 'липень', 'серпень', 'вересень',
        'жовтень', 'листопад', 'грудень');
var
    i: Integer;
begin
    if not ResultQuery.IsEmpty then
    begin
        i := ResultQuery['wtMonth'];
        Text := Months[i];
    end
    else Text := '';
end;

end.
