unit ExternProgsUnit;

interface

uses
    ShellApi, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, ExtCtrls, Buttons;

type
    TExternProgsForm = class(TForm)
        Panel1: TPanel;
        ResultGrid: TDBGrid;
        CancelButton: TSpeedButton;
        ResultQuery: TIBQuery;
        ResultSource: TDataSource;
        OutputQuery: TIBQuery;
        AddButton: TSpeedButton;
        DeleteButton: TSpeedButton;
        ResultQueryPROG_NAME: TIBStringField;
        ResultQueryID_PROG: TIntegerField;
        ResultQueryIS_REPORT: TIBStringField;
        ResultQueryPARAMS: TIBStringField;
        ResultQueryEXE_NAME: TIBStringField;
        SpeedButton1: TSpeedButton;
        procedure FormResize(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure FormCreate(Sender: TObject);
        procedure AddButtonClick(Sender: TObject);
        procedure DeleteButtonClick(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
        procedure ExecuteProg;
        procedure ResultGridDblClick(Sender: TObject);
        procedure SpeedButton1Click(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    ExternProgsForm: TExternProgsForm;

implementation
uses PersonalCommon, SpCommon, ExternProgsAddUnit;
{$R *.dfm}

procedure TExternProgsForm.FormResize(Sender: TObject);
begin
    GridResize(ResultGrid);
end;

procedure TExternProgsForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TExternProgsForm.FormCreate(Sender: TObject);
begin
    ResultQuery.Transaction := PersonalCommon.ReadTransaction;
    OutputQuery.Transaction := PersonalCommon.WriteTransaction;
    ResultQuery.Close;
    ResultQuery.Open;
end;

procedure TExternProgsForm.AddButtonClick(Sender: TObject);
var
    Form: TExternProgsAddForm;
begin
    Form := TExternProgsAddForm.Create(self);
    if Form.ShowModal = mrOk
        then begin
        OutputQuery.Close;
        OutputQuery.SQL.Text := 'EXECUTE PROCEDURE EXTERN_PROGS_INSERT(' + QuotedStr(Form.NameEdit.Text) + ',' + QuotedStr(Form.FileEdit.Text) + ',''T'',' + QuotedStr(Form.ParamsEdit.Text) + ');';
        ExecQuery(OutputQuery);
        ResultQuery.Close;
        ResultQuery.Open;
        GridResize(ResultGrid);
    end;
end;

procedure TExternProgsForm.DeleteButtonClick(Sender: TObject);
begin
    if not ResultQuery.IsEmpty
        then begin

        if MessageDlg('Чи справді ви бажаєте вилучити цей запис?',
            mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;

        OutputQuery.Close;
        OutputQuery.SQL.Text := 'EXECUTE PROCEDURE EXTERN_PROGS_DELETE(' + IntToStr(ResultQueryID_PROG.Value) + ');';
        ExecQuery(OutputQuery);
        ResultQuery.Close;
        ResultQuery.Open;
        GridResize(ResultGrid);
    end
    else
        MessageDlg('Немає записів!', mtError, [mbOk], 0);
end;

procedure TExternProgsForm.CancelButtonClick(Sender: TObject);
begin
    Close();
end;

procedure TExternProgsForm.ExecuteProg;
begin
    if not ResultQuery.IsEmpty
        then begin
        ShellExecute(0, 'open', PChar(ResultQueryEXE_NAME.Value), PChar(ResultQueryEXE_NAME.Value), '', SW_SHOWNORMAL);
    end
    else MessageDlg('Немає записів!', mtError, [mbOk], 0);
end;

procedure TExternProgsForm.ResultGridDblClick(Sender: TObject);
begin
    ExecuteProg;
end;

procedure TExternProgsForm.SpeedButton1Click(Sender: TObject);
begin
    ExecuteProg;
end;

end.
