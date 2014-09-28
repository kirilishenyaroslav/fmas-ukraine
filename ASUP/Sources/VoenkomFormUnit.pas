unit VoenkomFormUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, PassVidanUnit, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons,
    Grids, DBGrids;

type
    TVoenkomForm = class(TPassVidanForm)
        ResultQueryVOENKOMAT: TIBStringField;
        procedure SearchEditChange(Sender: TObject);
        procedure ResultQueryCalcFields(DataSet: TDataSet);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    VoenkomForm: TVoenkomForm;

implementation

{$R *.dfm}

procedure TVoenkomForm.SearchEditChange(Sender: TObject);
begin
    if SearchEdit.Text <> '' then
    begin
        ResultQuery.SQL.Clear;
        ResultQuery.SQL.Add('SELECT DISTINCT Voenkomat ');
        ResultQuery.SQL.Add(' FROM Man_War WHERE UPPER(Voenkomat COLLATE PXW_CYRL) CONTAINING ''' + UpperCase(SearchEdit.Text) + ''' ORDER BY Voenkomat');

        ResultQuery.Close;
        ResultQuery.Open;
    end
    else
    begin
        ResultQuery.SQL.Clear;
        ResultQuery.SQL.Add('SELECT DISTINCT Voenkomat ');
        ResultQuery.SQL.Add(' FROM Man_War ORDER BY Voenkomat');

        ResultQuery.Close;
        ResultQuery.Open;

    end;

end;

procedure TVoenkomForm.ResultQueryCalcFields(DataSet: TDataSet);
begin
    inherited;
    ResultQueryVIDAN.Value := '';
end;

end.
