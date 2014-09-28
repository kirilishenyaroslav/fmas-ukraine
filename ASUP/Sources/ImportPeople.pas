
{ -$Id: ImportPeople.pas,v 1.3 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                  Модуль "Первичный импорт физических лиц"                    }
{           Первичный импорт физических лиц и паспортных данных                }
{                                                  ответственный: Олег Волков  }

unit ImportPeople;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    StdCtrls, Buttons, IBDatabase, Db, Grids, DBGrids, DBTables,
    IBCustomDataSet, IBQuery, ComCtrls, PersonalCommon, Halcn6db,
    SpCommon, Variants;

type
    TImportPeopleForm = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        Label4: TLabel;
        PeopleEdit: TEdit;
        PeopleQuery: TIBQuery;
        IdManQuery: TIBQuery;
        PassQuery: TIBQuery;
        PCardQuery: TIBQuery;
        GetIdPCard: TIBQuery;
        PeopleProgress: TProgressBar;
        OpenPeople: TOpenDialog;
        PeopleDbfButton: TButton;
        IdManQueryIDMAN: TIntegerField;
        GetIdPCardIDPCARD: TIntegerField;
        Label10: TLabel;
        PeopleTable: THalcyonDataSet;
        Label1: TLabel;
        CountLabel: TLabel;
        Label2: TLabel;
        WasLabel: TLabel;
        Label3: TLabel;
        FailedLabel: TLabel;
        OldPeople: TIBQuery;
        Label5: TLabel;
        LogMemo: TRichEdit;
        PassError: TCheckBox;
        Label6: TLabel;
        OldPassQuery: TIBQuery;
        procedure OkButtonClick(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
        procedure PeopleDbfButtonClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure CreatePassButtonClick(Sender: TObject);
    private
        function ImportMan: Integer;
        procedure AddLog(S: string; EndLn: Boolean = False);
    public

    end;

var
    ImpForm: TImportPeopleForm;
function ToAnsi(s: string): string;
implementation

var
    TranslateToAnsi: Boolean;
    InProcess: Boolean;
    LastError: string;

{$R *.DFM}

function ToAnsi(s: string): string;
var
    outs: PChar;
begin
    if not TranslateToAnsi then
    begin
        Result := s;
        Exit;
    end;

    if s = '' then
    begin
        Result := '';
        Exit;
    end;
    outs := PChar(s);
    OemToChar(PChar(s), outs);
    Result := outs;
end;

function CheckDeleted(tbl: TDataSet): Boolean;
begin
{	if tbl is TApolloTable then
  Result := (tbl as TApolloTable).Deleted
 else}
    if tbl is THalcyonDataSet then
        Result := (tbl as THalcyonDataset).IsDeleted
    else Result := False;
end;

procedure Split(s: string; var f, i, o: string);
var
    p: Integer;
begin
    s := Trim(s);
    p := Pos(' ', s);
    f := Copy(s, 1, p - 1);

    s := Copy(s, p, Length(s));
    s := Trim(s);
    p := Pos(' ', s);
    i := Copy(s, 1, p - 1);

    s := Copy(s, p, Length(s));
    o := Trim(s);
end;

function TImportPeopleForm.ImportMan: Integer;
var
    f, i, o: string;
    idman, idpcard: Integer;
    IsMan, IsPass: Boolean;
    BirthField: string;
begin
    if VarIsNull(PeopleTable['Ink']) then
    begin
        f := ' немає ідентифікаційного кода!!';
        AddLog(f);
        if not PassError.Checked then
            MessageDlg(f, mtError, [mbOk], 0);
        Result := -1;
        Exit;
    end;

    IsMan := OldPeople.Locate('TIN', Trim(PeopleTable['Ink']), []);
    if IsMan then idman := OldPeople['Id_Man'];

    try
        WriteTransaction.StartTransaction;

        if not IsMan then
        begin
            IdManQuery.Close;
            idman := ExecQuery(IdManQuery);

            GetIdPCard.Close;
            idpcard := ExecQuery(GetIdPCard);

            with PeopleQuery.Params do
            begin
                ParamValues['Id_Man'] := idman;

                Split(ToAnsi(PeopleTable['FIO']), f, i, o);
                ParamValues['Rus_Familia'] := f;
                ParamValues['Rus_Imya'] := i;
                ParamValues['Rus_Otchestvo'] := o;

                Split(ToAnsi(PeopleTable['FIOU']), f, i, o);
                ParamValues['Familia'] := f;
                ParamValues['Imya'] := i;
                ParamValues['Otchestvo'] := o;

                if VarIsNull(PeopleTable['Sex']) then
                    ParamValues['Id_Sex'] := 2
                else
                    if PeopleTable['Sex'] then
                        ParamValues['Id_Sex'] := 1
                    else ParamValues['Id_Sex'] := 2;

                if ImportType = 2 then BirthField := 'Birthday'
                else BirthField := 'Buthday';

                if VarIsNull(PeopleTable[BirthField]) then
                    ParamValues['Birth_Date'] := '01.01.1970'
                else
                    ParamValues['Birth_Date'] := PeopleTable[BirthField];

                ParamValues['Tin'] :=
                    Copy(Trim(PeopleTable['Ink']), 1, 10);
            end;
            ExecQuery(PeopleQuery);
        end;

        IsPass := False;
        if IsMan then
            if OldPassQuery.Locate('Id_Man', idman, []) then
                if OldPassQuery['Seria'] <> '--' then IsPass := True;

        if not IsPass then
            if (not VarIsNull(PeopleTable['Nomer'])) and
                (Trim(PeopleTable['Nomer']) <> '') then
            begin
                with PassQuery.Params do
                begin
                    Split(ToAnsi(PeopleTable['FIO']), f, i, o);
                    ParamValues['Rus_Familia'] := f;
                    ParamValues['Rus_Imya'] := i;
                    ParamValues['Rus_Otchestvo'] := o;

                    Split(ToAnsi(PeopleTable['FIOU']), f, i, o);
                    ParamValues['Familia'] := f;
                    ParamValues['Imya'] := i;
                    ParamValues['Otchestvo'] := o;

                    ParamValues['Number'] := ToAnsi(PeopleTable['Nomer']);
                    ParamValues['Seria'] := ToAnsi(PeopleTable['Seria']);
                    ParamValues['Date_Beg'] := PeopleTable['DateV'];
                    ParamValues['Vidan'] := ToAnsi(PeopleTable['Mesto']);
                    ParamValues['Id_Man'] := idman;
                end;
                ExecQuery(PassQuery);
            end;

        if not IsMan then
            with PCardQuery.Params do
            begin
                ParamValues['Id_PCard'] := idpcard;
                ParamValues['Id_Man'] := idman;
                ParamValues['TN'] := PeopleTable['T_Num'];
                if PeopleQuery.Params.ParamValues['Id_Sex'] = 1 then
                    ParamValues['Id_Family_Status'] := 3
                else ParamValues['Id_Family_Status'] := 6;

                ParamValues['Enter_Date'] := PeopleTable['Common_St'];
                if VarIsNull(ParamValues['Enter_Date']) then
                    ParamValues['Enter_Date'] := '01.01.1930';

                if ImportType = 2 then
                    if VarIsNull(PeopleTable['Prof']) then
                        ParamValues['Prof'] := 'F'
                    else
                        if PeopleTable['Prof'] then ParamValues['Prof'] := 'T'
                        else ParamValues['Prof'] := 'F'
                    else ParamValues['Prof'] := 'T';

                        if VarIsNull(PeopleTable['Invalid']) then
                            ParamValues['Invalid'] := 'F'
                        else
                            if PeopleTable['Invalid'] then ParamValues['Invalid'] := 'T'
                            else ParamValues['Invalid'] := 'F';


                        if ImportType = 2 then
                            if not VarIsNull(PeopleTable['Klass']) then
                                ParamValues['Klass'] := PeopleTable['Klass'];

                        ExecQuery(PCardQuery);
            end;

    except on e: Exception do
        begin
            if not PassError.Checked then
                MessageDlg('Помилка при додаванні людини: ' +
                    e.Message, mtError, [mbOk], 0);
            LastError := e.Message;
            WriteTransaction.Rollback;
            Result := -1;
            Exit;
        end;

    end;

    WriteTransaction.Commit;
    if IsMan then Result := 0
    else Result := 1;
end;

procedure TImportPeopleForm.AddLog(S: string; EndLn: Boolean = False);
var
    c: Integer;
begin
    if EndLn then
    begin
        c := LogMemo.Lines.Count;
        LogMemo.Lines[c - 1] := LogMemo.Lines[c - 1] + s;
    end
    else LogMemo.Lines.Add(s);
end;

procedure TImportPeopleForm.OkButtonClick(Sender: TObject);
var
    count, was, failed: Integer;
begin
    if InProcess then Exit;
    LogMemo.SetFocus;

    InProcess := True;
    CancelButton.Caption := 'Стоп';

    OldPeople.Close;
    OldPeople.Open;
    OldPassQuery.Close;
    OldPassQuery.Open;

    try
        PeopleTable.Close;
        PeopleTable.TableName := PeopleEdit.Text;
        AddLog('Відкриваю бази даних DBF...');
        PeopleTable.Active := True;
        AddLog('Ok', True);

    except on e: Exception do
        begin
            if not PassError.Checked then
                MessageDlg('Неможливо відкрити DBF: ' +
                    e.Message, mtError, [mbOk], 0);
            InProcess := False;
            Exit;
        end
    end;

    PeopleProgress.Position := 1;
    PeopleProgress.Max := PeopleTable.RecordCount;

    count := 0;
    was := 0;
    failed := 0;

    while not PeopleTable.Eof do
    begin
        if not InProcess then
        begin
            CancelButton.Caption := 'Закрити';
            Exit;
        end;
        if not (CheckDeleted(PeopleTable)
            or (not VarIsNull(PeopleTable['Erasing']))
            or VarIsNull(PeopleTable['FIO'])
            or VarIsNull(PeopleTable['FIOU'])
            or ((Trim(PeopleTable['FIO']) = '') and
            (Trim(PeopleTable['FIOU']) = ''))
            )
            then
        begin
            AddLog('Додається ' + ToAnsi(PeopleTable['FIO']) +
                '(т/н ' + IntToStr(PeopleTable['T_NUM']) + ') ...');
            case ImportMan of
                1:
                    begin
                        inc(count);
                        CountLabel.Caption := IntToStr(count);
                        CountLabel.Refresh;
                        AddLog('Ok', True);
                    end;
                0:
                    begin
                        inc(was);
                        WasLabel.Caption := IntToStr(was);
                        WasLabel.Refresh;
                        AddLog(' - така людина вже була!', True);
                    end;
                -1:
                    begin
                        inc(failed);
                        FailedLabel.Caption := IntToStr(failed);
                        FailedLabel.Refresh;
                        AddLog(' - не вдалося додати! ' +
                            LastError, True);
                    end;
            end;
        end;

        PeopleTable.Next;
        PeopleProgress.StepBy(1);

        Application.ProcessMessages;
    end;

    AddLog('Імпорт завершено!');

    if not PassError.Checked then
        ShowMessage('Імпорт було успішно завершено');

    InProcess := False;
    CancelButton.Caption := 'Закрити';
end;

procedure TImportPeopleForm.CancelButtonClick(Sender: TObject);
begin
    if InProcess then InProcess := False
    else Close;
end;

procedure TImportPeopleForm.PeopleDbfButtonClick(Sender: TObject);
begin
    if OpenPeople.Execute then PeopleEdit.Text := OpenPeople.FileName;
end;

procedure TImportPeopleForm.FormCreate(Sender: TObject);
begin
    PeopleEdit.Text := Import_Path + '\' + ImportPeopleDbf;
    OpenPeople.InitialDir := Import_Path;
    GetIdPCard.Transaction := WriteTransaction;
    IdManQuery.Transaction := WriteTransaction;

    OldPeople.Transaction := ReadTransaction;
    OldPassQuery.Transaction := ReadTransaction;

    PeopleQuery.Transaction := WriteTransaction;
    PassQuery.Transaction := WriteTransaction;
    PCardQuery.Transaction := WriteTransaction;

    if PeopleTable is THalcyonDataset then
        if (PeopleTable as THalcyonDataset).TranslateASCII then
            TranslateToAnsi := False;
end;

procedure TImportPeopleForm.CreatePassButtonClick(Sender: TObject);
begin
    PassQuery.SQL.Text := 'EXECUTE PROCEDURE Create_Pass_Data';
    ExecQuery(PassQuery);
end;

end.
