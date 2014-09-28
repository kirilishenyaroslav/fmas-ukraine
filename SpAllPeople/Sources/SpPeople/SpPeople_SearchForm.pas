unit SpPeople_SearchForm;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit,
    cxControls, cxContainer, cxEdit, cxMemo, ExtCtrls;

type
    TfSearch = class(TForm)
        InfoPanel: TPanel;
        InfoMemo: TcxMemo;
        SearchPanel: TPanel;
        Label1: TLabel;
        SearchTE: TcxTextEdit;
        SearchBtn: TcxButton;
        procedure SearchBtnClick(Sender: TObject);
        procedure SearchTEKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

function GetSearchParams(AOwner: TComponent): string;

implementation

{$R *.dfm}

function GetSearchParams(AOwner: TComponent): string;
var
    ViewForm: TfSearch;
begin
    ViewForm := TfSearch.Create(AOwner);
    if ViewForm.ShowModal = mrOk then
        Result := ViewForm.SearchTE.Text
    else
        Result := '';
    ViewForm.Release;
end;

procedure TfSearch.SearchBtnClick(Sender: TObject);
begin
    ModalResult := mrOk;
end;

procedure TfSearch.SearchTEKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = 13 then
        ModalResult := mrOk;
end;

end.
