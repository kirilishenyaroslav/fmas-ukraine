
{ -$Id: DepartmentsSearchUnit.pas,v 1.2 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                 Модуль "Ввод критериев поиска подразделения"                 }
{                   Ввод критериев поиска подразделения                        }
{                                                  ответственный: Олег Волков  }

unit DepartmentsSearchUnit;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    StdCtrls, Buttons, ExtCtrls, DB, IBCustomDataSet, IBQuery, PersonalCommon;

type
    TDepartmentsSearchForm = class(TForm)
        Search: TRadioGroup;
        SearchEdit: TEdit;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        procedure FormActivate(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    DepartmentsSearchForm: TDepartmentsSearchForm;

implementation

uses DepartmentsViewUnit;

{$R *.DFM}

procedure TDepartmentsSearchForm.FormActivate(Sender: TObject);
begin
    SearchEdit.Text := '';
    SearchEdit.SetFocus;
end;

end.
