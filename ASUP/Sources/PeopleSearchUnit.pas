
{ -$Id: PeopleSearchUnit.pas,v 1.2 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                     Модуль "Поиск физического лица"                          }
{         Осуществляет поиск физического лица по  фамилии,либо
{         налоговому номеру                                                    }
{         Ответственный: Данил Збуривский                                      }

unit PeopleSearchUnit;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    StdCtrls, Buttons, ExtCtrls, Db, IBCustomDataSet, IBQuery, PersonalCommon;

type
    TPeopleSearchForm = class(TForm)
        SearchRadioGroup: TRadioGroup;
        SearchEdit: TEdit;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        PassCheck: TCheckBox;
        SearchQuery: TIBQuery;
        procedure SearchRadioGroupClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    PeopleSearchForm: TPeopleSearchForm;

implementation
{$R *.DFM}

procedure TPeopleSearchForm.SearchRadioGroupClick(Sender: TObject);
begin
    SearchEdit.Text := '';
    SearchEdit.SetFocus;
end;

procedure TPeopleSearchForm.FormCreate(Sender: TObject);
begin
    SearchQuery.Transaction := PersonalCommon.ReadTransaction;
end;

end.
