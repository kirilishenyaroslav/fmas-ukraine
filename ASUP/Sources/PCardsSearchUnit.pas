
{ -$Id: PCardsSearchUnit.pas,v 1.2 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                     Модуль "Поиск личной карточки"                           }
{         Осуществляет поиск личной карточки по фамилии сотрудника,либо по     }
{          табельному номеру.                                                  }
{         Ответственный: Данил Збуривский                                      }

unit PCardsSearchUnit;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    Db, IBCustomDataSet, IBQuery, StdCtrls, Buttons, ExtCtrls, PersonalCommon;

type
    TPCardsSearchForm = class(TForm)
        SearchRadioGroup: TRadioGroup;
        SearchEdit: TEdit;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        SearchTNQuery: TIBQuery;
        SearchTNQueryID_PCARD: TIntegerField;
        SearchFamiliaQuery: TIBQuery;
        SearchFamiliaQueryID_PCARD: TIntegerField;
        procedure FormCreate(Sender: TObject);
        procedure SearchRadioGroupClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    PCardsSearchForm: TPCardsSearchForm;

implementation


{$R *.DFM}

procedure TPCardsSearchForm.FormCreate(Sender: TObject);
begin
    SearchFamiliaQuery.Transaction := PersonalCommon.ReadTransaction;
    SearchTNQuery.Transaction := PersonalCommon.ReadTransaction;

end;

procedure TPCardsSearchForm.SearchRadioGroupClick(Sender: TObject);
begin
    SearchEdit.Text := '';
    SearchEdit.SetFocus;
end;

end.
