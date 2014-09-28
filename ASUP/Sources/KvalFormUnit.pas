unit KvalFormUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, SpFormUnit, DB, IBCustomDataSet, IBQuery, Grids, DBGrids,
    Buttons, StdCtrls, ExtCtrls, PersonalCommon, uSearchFrame;

type
    TKvalForm = class(TSpForm)
        ResultQueryNAME_KVAL: TIBStringField;
        ResultQueryID_KVAL: TIntegerField;
        procedure FormCreate(Sender: TObject);
        procedure SearchEditChange(Sender: TObject);
        procedure SpGridCellClick(Column: TColumn);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    KvalForm: TKvalForm;

implementation

{$R *.dfm}

procedure TKvalForm.FormCreate(Sender: TObject);
begin
{  ResultQuery.Transaction:=PersonalCommon.ReadTransaction;
  ResultQuery.Open;}
end;

procedure TKvalForm.SearchEditChange(Sender: TObject);
begin
    if SearchFrame.SearchEdit.Text <> '' then
    begin
        ResultQuery.SQL.Clear;
        ResultQuery.SQL.Add('SELECT Id_Kval,Name_Kval ');
        ResultQuery.SQL.Add(' FROM Sp_Kvalification WHERE (NOT Id_Kval BETWEEN -10 AND 0) AND  UPPER(NAME_Kval COLLATE PXW_CYRL) CONTAINING ''' + UpperCase(SearchFrame.SearchEdit.Text) + ''' ORDER BY NAME_Kval');

        ResultQuery.Close;
        ResultQuery.Open;
    end
    else
    begin
        ResultQuery.SQL.Clear;
        ResultQuery.SQL.Add('SELECT Id_Kval,Name_Kval ');
        ResultQuery.SQL.Add(' FROM Sp_Kvalification WHERE (NOT Id_Kval BETWEEN -10 AND 0) ORDER BY NAME_Kval');

        ResultQuery.Close;
        ResultQuery.Open;

    end;

end;

procedure TKvalForm.SpGridCellClick(Column: TColumn);
begin
    SearchFrame.SearchEdit.Text := SearchFrame.SearchEdit.Text;

end;

end.
