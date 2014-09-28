
{ -$Id: SpAwardUnit.pas,v 1.2 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                      Модуль "Справочник поощрений"                           }
{                    Работа со справочником поощрений                          }
{                                             ответственный: Данил Збуривский  }

unit SpAwardUnit;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    SpFormUnit, Db, IBCustomDataSet, IBQuery, Buttons, StdCtrls, ExtCtrls,
    Grids, DBGrids, EditControl, PersonalCommon, AddAwardUnit, SpCommon,
    uSearchFrame;

type
    TSpAwardForm = class(TSpForm)
        ResultQueryID_AWARD: TIntegerField;
        ResultQueryID_AWARD_TYPE: TIntegerField;
        ResultQueryNAME_AWARD: TIBStringField;
        ResultQueryNAME_AWARD_TYPE: TIBStringField;
        procedure AddButtonClick(Sender: TObject);
        procedure ModifyButtonClick(Sender: TObject);
        procedure DeleteButtonClick(Sender: TObject);
    private
        procedure ShowChangeForm(Mode: TEditMode);
    public
    { Public declarations }
    end;

var
    SpAwardForm: TSpAwardForm;

implementation

{$R *.DFM}

uses AddPrivUnit;



procedure TSpAwardForm.ShowChangeForm(Mode: TEditMode);
var
    form: TAddAwardForm;
    id: Integer;
begin

    form := TAddAwardForm.Create(Self);
    if Mode = emModify then id := ResultQuery['Id_Award']
    else id := -1;
    form.Prepare(id, Mode);
    if form.ShowModal = mrOk then Refresh;

end;


procedure TSpAwardForm.AddButtonClick(Sender: TObject);
begin
    ShowChangeForm(emNew);
end;

procedure TSpAwardForm.ModifyButtonClick(Sender: TObject);
begin
    if not ResultQuery.IsEmpty then ShowChangeForm(emModify);
end;

procedure TSpAwardForm.DeleteButtonClick(Sender: TObject);
begin
    WorkQuery.Close;
    WorkQuery.SQL.Text := 'EXECUTE PROCEDURE SP_AWARD_DELETE(' + IntToStr(ResultQueryID_AWARD.Value) + ');';
    ExecQuery(WorkQuery);

    QueryRefresh(ResultQuery);

end;

initialization
    RegisterClass(TSpAwardForm);
end.
