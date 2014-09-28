{-$Id: SpPrivUnit.pas,v 1.2 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                       Модуль "Справочник льгот"                              }
{    Отображает справочник льгот                                               }
{    Ответственный: Кропов Валентин                                            }

unit SpPrivUnit;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    SpFormUnit, Db, IBCustomDataSet, IBQuery, Buttons, StdCtrls, ExtCtrls,
    Grids, DBGrids, EditControl, PersonalCommon, SpCommon, uSearchFrame;

type
    TSpPrivForm = class(TSpForm)
        ResultQueryID_PRIVELEGE: TIntegerField;
        ResultQueryID_PRIV_TYPE: TIntegerField;
        ResultQueryNAME_PRIV: TIBStringField;
        ResultQueryNAME_PRIV_TYPE: TIBStringField;
        procedure AddButtonClick(Sender: TObject);
        procedure ModifyButtonClick(Sender: TObject);
        procedure DeleteButtonClick(Sender: TObject);
    private
        procedure ShowChangeForm(Mode: TEditMode);
    public
    { Public declarations }
    end;

var
    SpPrivForm: TSpPrivForm;

implementation

{$R *.DFM}

uses AddPrivUnit;



procedure TSpPrivForm.ShowChangeForm(Mode: TEditMode);
var
    form: TAddPrivForm;
    id: Integer;
begin

    form := TAddPrivForm.Create(Self);
    if Mode = emModify then id := ResultQuery['Id_Privelege']
    else id := -1;
    form.Prepare(id, Mode);
    if form.ShowModal = mrOk then Refresh;

end;


procedure TSpPrivForm.AddButtonClick(Sender: TObject);
begin
    ShowChangeForm(emNew);
end;

procedure TSpPrivForm.ModifyButtonClick(Sender: TObject);
begin
    if not ResultQuery.IsEmpty then ShowChangeForm(emModify);
end;

procedure TSpPrivForm.DeleteButtonClick(Sender: TObject);
begin
    WorkQuery.Close;
    WorkQuery.SQL.Text := 'EXECUTE PROCEDURE SP_PRIVELEGE_DELETE(' + IntToStr(ResultQueryID_PRIVELEGE.Value) + ');';
    ExecQuery(WorkQuery);
    QueryRefresh(ResultQuery);

end;

initialization
    RegisterClass(TSpPrivForm);
end.
