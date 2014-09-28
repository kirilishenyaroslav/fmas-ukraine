
{ -$Id: ImportLog.pas,v 1.2 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                  Модуль "Применение протокола изменений базы данных"         }
{                    Применение протокола изменений базы данных                }
{                                                  ответственный: Олег Волков  }

unit ImportLog;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, Buttons, StdCtrls, DB, IBCustomDataSet, IBQuery;

type
    TImportLogForm = class(TForm)
        Label2: TLabel;
        FileEdit: TEdit;
        PeopleDbfButton: TButton;
        CancelButton: TBitBtn;
        OkButton: TBitBtn;
        OpenDialog: TOpenDialog;
        WorkQuery: TIBQuery;
        procedure PeopleDbfButtonClick(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    ImportLogForm: TImportLogForm;

implementation

{$R *.dfm}

uses PersonalCommon;

procedure TImportLogForm.PeopleDbfButtonClick(Sender: TObject);
begin
    if OpenDialog.Execute then
        FileEdit.Text := OpenDialog.FileName;
end;

procedure TImportLogForm.OkButtonClick(Sender: TObject);
var
    f: TextFile;
    sql, s: string;
    p: Integer;
begin
    WorkQuery.Transaction := WriteTransaction;


    AssignFile(f, FileEdit.Text);
    Reset(f);
    sql := '';
    while not Eof(f) do
    begin
        Readln(f, s);
        p := Pos('¤', s);
        if p = 0 then sql := sql + #13#10 + s
        else
        begin
            sql := sql + #13#10 + Copy(s, 1, p - 1);
            sql := Trim(sql);
            WriteTransaction.StartTransaction;
            try
                WorkQuery.Close;
                WorkQuery.SQL.Text := sql;
                if pos('SELECT', sql) = 1 then
                    WorkQuery.Open
                else WorkQuery.ExecSQL;
            except on E: Exception do
                begin
      //		MessageDlg('При імпорті виникла помилка.', mtError, [mbOk], 0);
                end;
            end;
            WriteTransaction.Commit;

            sql := Copy(s, p + 1, Length(s));
        end;
    end;
    CloseFile(f);

    ShowMessage('Імпорт завершений!');
end;

procedure TImportLogForm.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

end.
