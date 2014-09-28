unit PassVidanUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, Grids, DBGrids, StdCtrls, Buttons, PersonalCommon, DB,
    IBCustomDataSet, IBQuery;

type
    TPassVidanForm = class(TForm)
        ResultGrid: TDBGrid;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        ResultQuery: TIBQuery;
        resultSource: TDataSource;

        Label1: TLabel;
        SearchEdit: TEdit;
        ResultQueryVIDAN: TIBStringField;
        procedure FormCreate(Sender: TObject);
        procedure ResultGridDblClick(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure SearchEditChange(Sender: TObject);
    private
    public

    end;

var
    PassVidanForm: TPassVidanForm;

implementation

{$R *.dfm}

procedure TPassVidanForm.FormCreate(Sender: TObject);
begin
    ResultQuery.Transaction := PersonalCommon.ReadTransaction;
    ResultQuery.Open;
end;

procedure TPassVidanForm.ResultGridDblClick(Sender: TObject);
begin
    OkButton.Click;
end;

procedure TPassVidanForm.OkButtonClick(Sender: TObject);
begin
    ModalResult := mrOK;
end;

procedure TPassVidanForm.SearchEditChange(Sender: TObject);
begin
    if SearchEdit.Text <> '' then
    begin
        ResultQuery.SQL.Clear;
        ResultQuery.SQL.Add('SELECT DISTINCT Vidan ');
        ResultQuery.SQL.Add(' FROM Pass_Data WHERE UPPER(Vidan COLLATE PXW_CYRL) CONTAINING ''' + UpperCase(SearchEdit.Text) + ''' ORDER BY Vidan');

        ResultQuery.Close;
        ResultQuery.Open;
    end
    else
    begin
        ResultQuery.SQL.Clear;
        ResultQuery.SQL.Add('SELECT DISTINCT Vidan ');
        ResultQuery.SQL.Add(' FROM Pass_Data ORDER BY Vidan');

        ResultQuery.Close;
        ResultQuery.Open;

    end;

end;

end.
