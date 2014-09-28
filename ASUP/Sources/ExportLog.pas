
{ -$Id: ExportLog.pas,v 1.2 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                  Модуль "Вывод протокола изменений базы данных"              }
{                      Вывод протокола измений базы данных                     }
{                                                  ответственный: Олег Волков  }

unit ExportLog;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    StdCtrls, ComCtrls, Buttons, Db, IBCustomDataSet, IBQuery, PersonalCommon;

type
    TExportLogForm = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        LogQuery: TIBQuery;
        LogQueryLOGTIME: TDateTimeField;
        LogQueryID_SERVER: TIntegerField;
        LogQueryID_USER: TIntegerField;
        LogQuerySQL: TIBStringField;
        Label10: TLabel;
        SaveLogDialog: TSaveDialog;
        FileEdit: TEdit;
        Label2: TLabel;
        PeopleDbfButton: TButton;
        UpdateLogTimeQuery: TIBQuery;
        AcceptButton: TBitBtn;
        procedure OkButtonClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
        procedure PeopleDbfButtonClick(Sender: TObject);
        procedure AcceptButtonClick(Sender: TObject);
    private
        Log_Time: TDateTime;
        procedure SetDate;
    public
    { Public declarations }
    end;

var
    ExportLogForm: TExportLogForm;

implementation

{$R *.DFM}

procedure TExportLogForm.OkButtonClick(Sender: TObject);
var
    f: TextFile;
begin
    try
        AssignFile(f, FileEdit.Text);
        Rewrite(f);

        LogQuery.Close;
        LogQuery.Params.ParamValues['LogTime'] := Log_Time;
        LogQuery.Open;

        with LogQuery do
        begin
            First;
            while not Eof do
            begin
                Writeln(f, LogQuery['SQL'] + '¤');
                Next;
            end;
        end;
        CloseFile(f);
        UpdateLogTimeQuery.SQL.Text :=
            'UPDATE Ini_Asup_Consts SET Last_End_Log_Date = ''' +
            DateTimeToStr(Now) + '''';
        UpdateLogTimeQuery.ExecSQL;
        WriteTransaction.Commit;
    except on E: EInOutError do
        begin
            MessageDlg('При записі у файл виникла помилка. Перевірьте ім''я файла або права.', mtError, [mbOk], 0);
            Exit;
        end;
    end;
    ShowMessage('Експорт завершений!');
end;

procedure TExportLogForm.FormCreate(Sender: TObject);
begin
    LogQuery.Transaction := ReadTransaction;
    UpdateLogTimeQuery.Transaction := WriteTransaction;
    SetDate;
end;

procedure TExportLogForm.SetDate;
begin
    Log_Time := Consts_Query['Last_Beg_Log_Date'];
end;

procedure TExportLogForm.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TExportLogForm.PeopleDbfButtonClick(Sender: TObject);
begin
    if SaveLogDialog.Execute then
        FileEdit.Text := SaveLogDialog.FileName;
end;

procedure TExportLogForm.AcceptButtonClick(Sender: TObject);
begin
    UpdateLogTimeQuery.SQL.Text :=
        'Update Ini_Asup_Consts SET Last_Beg_Log_Date = Last_End_Log_Date';
    UpdateLogTimeQuery.ExecSQL;
    WriteTransaction.Commit;
    Consts_Query.Close;
    Consts_Query.Open;
    SetDate;
end;

end.
