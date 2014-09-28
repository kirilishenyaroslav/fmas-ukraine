
{ -$Id: SpStajUnit.pas,v 1.2 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                     Модуль "Справочник стажей"                               }
{         Отображение списка стажей.
                                                   {         Вызов формы для редактирования стажа.                                 }
{         Ответственный: Данил Збуривский                                      }

unit SpStajUnit;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    SpFormUnit, Db, IBCustomDataSet, IBQuery, Buttons, StdCtrls, ExtCtrls,
    Grids, DBGrids, AddStaj, EditControl, DBCtrls, SpCommon, PersonalCommon,
    uSearchFrame;

type
    TSpStajForm = class(TSpForm)
        ResultQueryID_STAJ: TIntegerField;
        ResultQueryNAME_STAJ: TIBStringField;
        ResultQueryIS_DEFAULT: TIBStringField;
        procedure AddButtonClick(Sender: TObject);
        procedure ModifyButtonClick(Sender: TObject);
        procedure ResultQueryIS_DEFAULTGetText(Sender: TField;
            var Text: string; DisplayText: Boolean);
        procedure DeleteButtonClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    SpStajForm: TSpStajForm;
    AddStajForm: TAddStajForm;
implementation

{$R *.DFM}

procedure TSpStajForm.AddButtonClick(Sender: TObject);
begin
    if not GPP_Check then Exit;

    AddStajForm := TAddStajForm.Create(Self, emNew, -1);
    if AddStajForm.ShowModal = mrOk then Refresh;
    AddStajForm.Free;
end;

procedure TSpStajForm.ModifyButtonClick(Sender: TObject);
begin
    if not GPP_Check then Exit;

    AddStajForm := TAddStajForm.Create(Self, emModify, ResultQuery['id_staj']);
    if AddStajForm.ShowModal = mrOk then Refresh;
    AddStajForm.Free;
end;

procedure TSpStajForm.ResultQueryIS_DEFAULTGetText(Sender: TField;
    var Text: string; DisplayText: Boolean);
begin
    inherited;
    if ResultQueryIS_DEFAULT.asString = 'T' then Text := 'Так'
    else
        Text := 'Ні';


end;

procedure TSpStajForm.DeleteButtonClick(Sender: TObject);
begin
    if not GPP_Check then Exit;
    inherited;
end;

initialization
    RegisterClass(TSpStajForm);
end.
