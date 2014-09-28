
{ -$Id: SelectMovingUnit.pas,v 1.2 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                      Модуль "Выбор места работы человека"                    }
{                         Выбор места работы человека                          }
{                                             ответственный: Данил Збуривский  }


unit SelectMovingUnit;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    Db, IBCustomDataSet, IBQuery, Grids, DBGrids, PersonalCommon, SpCommon;

type
    TSelectMovingForm = class(TForm)
        DBGrid1: TDBGrid;
        ManMovingQuery: TIBQuery;
        ManMovingSource: TDataSource;
        ManMovingQueryID_MAN_MOVING: TIntegerField;
        ManMovingQueryNAME_DEPARTMENT_FULL: TIBStringField;
        ManMovingQueryNAME_DEPARTMENT_SHORT: TIBStringField;
        ManMovingQueryPOST: TIBStringField;
        ManMovingQueryDATE_BEG: TDateField;
        ManMovingQueryDATE_END: TDateField;
        ManMovingQueryKOL_STAVOK: TIBBCDField;
        ManMovingQueryID_SHTATRAS: TIntegerField;

        procedure DBGrid1DblClick(Sender: TObject);
        procedure FormResize(Sender: TObject);
    private
    { Private declarations }
    public
        Id_Pcard: Integer;
        procedure Prepare(IDPCARD: Integer);
    end;

var
    SelectMovingForm: TSelectMovingForm;

implementation

{$R *.DFM}


procedure TSelectMovingForm.Prepare(IDPCARD: INTEGER);
begin

    ID_PCARD := IDPCARD;
    ManMovingQuery.Transaction := PersonalCommon.ReadTransaction;
    ManMovingQuery.Close;
    ManMovingQuery.Params.ParamValues['Id_Pcard'] := ID_PCARD;
    ManMovingQuery.Open;

end;

procedure TSelectMovingForm.DBGrid1DblClick(Sender: TObject);
begin
    ModalResult := mrOk;


end;

procedure TSelectMovingForm.FormResize(Sender: TObject);
begin
    GridResize(DbGrid1);
end;

end.
