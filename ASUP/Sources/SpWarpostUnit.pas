
{ -$Id: SpWarpostUnit.pas,v 1.2 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                     Модуль "Справочник воинских званий"                      }
{         Отображение списка воинских званий.                                  }
                                                   {         Вызов формы для редактирования воинского звания                      }
{         Ответственный: Данил Збуривский                                      }

unit SpWarpostUnit;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    SpFormUnit, Db, IBCustomDataSet, IBQuery, StdCtrls, Buttons, Grids,
    DBGrids, FieldControl, EditControl, ExtCtrls, ComCtrls,
    PersonalCommon, ToolWin, SpCommon, uSearchFrame;

type
    TSpWarpostForm = class(TSpForm)
        ResultQueryID_WARPOST: TIntegerField;
        ResultQueryNAME_WARPOST: TIBStringField;
        ResultQueryID_WARSOSTAV: TIntegerField;
        ResultQueryNAME_WARSOSTAV: TIBStringField;
        ResultQueryNAME_WARPOSTGR: TIBStringField;
        procedure AddButtonClick(Sender: TObject);
        procedure ModifyButtonClick(Sender: TObject);
    private
        procedure ShowChangeForm(Mode: TEditMode);

    end;

var
    SpWarpostForm: TSpWarpostForm;

implementation

uses AddWarPost;

{$R *.DFM}

procedure TSpWarpostForm.ShowChangeForm(Mode: TEditMode);
var
    form: TAddWarPostForm;
    id: Integer;
    Ans: TModalResult;
begin
    form := TAddWarPostForm.Create(Self);
    if Mode = emModify then id := ResultQuery['Id_WarPost']
    else id := -1;
    form.Prepare(id, Mode);
    Ans := form.ShowModal;
    if Ans = mrOK then Refresh;
end;



procedure TSpWarpostForm.AddButtonClick(Sender: TObject);
begin
    ShowChangeForm(emNew);
end;

procedure TSpWarpostForm.ModifyButtonClick(Sender: TObject);
begin
    if not ResultQuery.IsEmpty then ShowChangeForm(emModify);
end;

initialization
    RegisterClass(TSpWarPostForm);
end.
