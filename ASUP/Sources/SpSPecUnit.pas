unit SpSpecUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, PersonalCommon, SpCommon, SpFormUnit, DB, IBCustomDataSet, IBQuery, Grids,
    DBGrids, Buttons, StdCtrls, ExtCtrls, uSearchFrame;

type
    TSpecForm = class(TSpForm)
        ResultQueryID_SPEC: TIntegerField;
        ResultQueryNAME_SPEC: TIBStringField;
        procedure SearchEditChange(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure SpGridCellClick(Column: TColumn);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    SpecForm: TSpecForm;

implementation

{$R *.dfm}

procedure TSpecForm.SearchEditChange(Sender: TObject);
begin

    if SearchFrame.SearchEdit.Text <> '' then
    begin
        ResultQuery.SQL.Clear;
        ResultQuery.SQL.Add('SELECT Id_Spec,Name_Spec ');
        ResultQuery.SQL.Add(' FROM Sp_Spec WHERE (NOT Id_Spec BETWEEN -10 AND 0) AND  UPPER(NAME_SPEC COLLATE PXW_CYRL) CONTAINING ''' + UpperCase(SearchFrame.SearchEdit.Text) + ''' ORDER BY NAME_SPEC');

        ResultQuery.Close;
        ResultQuery.Open;
    end
    else
    begin
        ResultQuery.SQL.Clear;
        ResultQuery.SQL.Add('SELECT Id_Spec,Name_Spec ');
        ResultQuery.SQL.Add(' FROM Sp_Spec WHERE (NOT Id_Spec BETWEEN -10 AND 0) ORDER BY NAME_SPEC');

        ResultQuery.Close;
        ResultQuery.Open;

    end;

end;

procedure TSpecForm.FormCreate(Sender: TObject);
begin
{  ResultQuery.Transaction:=PersonalCommon.ReadTransaction;
  ResultQuery.Open;}

end;

procedure TSpecForm.SpGridCellClick(Column: TColumn);
begin
    SearchFrame.SearchEdit.Text := SearchFrame.SearchEdit.Text;

end;

end.
