
{ -$Id: SpWarSostavUnit.pas,v 1.2 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                     Модуль "Справочник воинских составов"                    }
{         Отображение списка воинских составов.                                }
                                                   {         Вызов формы для редактирования воинского состава.                    }
{         Ответственный: Данил Збуривский                                      }

unit SpWarSostavUnit;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    SpFormUnit, Db, IBCustomDataSet, IBQuery, StdCtrls, Buttons, Grids,
    DBGrids, EditControl, ExtCtrls, ComCtrls, ToolWin, SpCommon,
    PersonalCommon, uSearchFrame;

type
    TSpWarSostavForm = class(TSpForm)
        ResultQueryID_WARSOSTAV: TIntegerField;
        ResultQueryNAME_WARSOSTAV: TIBStringField;
        ResultQueryNAME_WARPOSTGR: TIBStringField;
        ResultQueryID_WARPOSTGR: TIntegerField;
        procedure AddButtonClick(Sender: TObject);
        procedure ModifyButtonClick(Sender: TObject);
    private
        procedure ShowChangeForm(Mode: TEditMode);
    end;

var
    SpWarSostavForm: TSpWarSostavForm;

implementation

uses AddWarSostav;

{$R *.DFM}

procedure TSpWarSostavForm.ShowChangeForm(Mode: TEditMode);
var
    form: TAddWarSostavForm;
    id: Integer;
    Ans: TModalResult;
begin
    form := TAddWarSostavForm.Create(Self);
    if Mode = emModify then id := ResultQuery['Id_WarSostav']
    else id := -1;
    form.Prepare(id, Mode);
    Ans := form.ShowModal;
    if Ans = mrOK then Refresh;
end;

procedure TSpWarSostavForm.AddButtonClick(Sender: TObject);
begin
    ShowChangeForm(emNew);
end;

procedure TSpWarSostavForm.ModifyButtonClick(Sender: TObject);
begin
    if not ResultQuery.IsEmpty then
        ShowChangeForm(emModify);
end;

initialization
    RegisterClass(TSpWarSostavForm);

end.
