
{ -$Id: AutoAccept.pas,v 1.3 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{               Модуль "Автоматическое принятие людей на работу"               }
{                Первоначальное принятие людей на работу                       }
{                                                  ответственный: Олег Волков  }

unit AutoAccept;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    StdCtrls, Mask, CheckEditUnit, Buttons, SpComboBox, ComCtrls, FieldControl,
    DepartmentsViewUnit, PersonalCommon, Db, IBCustomDataSet, IBQuery, Halcn6db,
    EditControl, TarDigits, Variants, Grids, DBGrids, SpCommon, ShtatRas, FileCtrl;

type
    TAutoAcceptForm = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        DbfGroup: TGroupBox;
        Label4: TLabel;
        PathEdit: TEdit;
        OpenPeopleButton: TButton;
        Label9: TLabel;
        AcceptDatePicker: TDateTimePicker;
        PeopleTable: THalcyonDataSet;
        Label14: TLabel;
        PeopleQuery: TIBQuery;
        PeopleQueryID_MAN: TIntegerField;
        PeopleQueryFAMILIA: TIBStringField;
        PeopleQueryIMYA: TIBStringField;
        PeopleQueryOTCHESTVO: TIBStringField;
        PeopleQueryID_SEX: TIntegerField;
        PeopleQueryFIO: TIBStringField;
        PeopleDataSource: TDataSource;
        PeopleGrid: TDBGrid;
        PeopleQueryTIN: TIBStringField;
        PeopleQueryTN: TIntegerField;
        Label1: TLabel;
        Label15: TLabel;
        StatusLabel: TLabel;
        Label22: TLabel;
        SearchLabel: TLabel;
        ToPicker: TDateTimePicker;
        Label16: TLabel;
        KolStavokEdit: TCheckEdit;
        Label2: TLabel;
        DetailsMemo: TMemo;
        Label3: TLabel;
        PostTable: THalcyonDataSet;
        PodrTable: THalcyonDataSet;
        Label5: TLabel;
        Z: TLabel;
        DepartmentLabel: TLabel;
        SelectShtatRas: TButton;
        Label6: TLabel;
        PostLabel: TLabel;
        IsMainBox: TCheckBox;
        FC_KolStavok: TFieldControl;
        FC_ShtatRas: TFieldControl;
        FC_DateBeg: TFieldControl;
        FC_DateEnd: TFieldControl;
        FC_IsMain: TFieldControl;
        Label7: TLabel;
        OkladLabel: TLabel;
        FC_PodrB: TFieldControl;
        PodrBQuery: TIBQuery;
        OnlyWorkers: TCheckBox;
        Button1: TButton;
        OutputQuery: TIBQuery;
        PeopleQueryID_PCARD: TIntegerField;
        SPZComboBox: TSpComboBox;
        FC_SPZ: TFieldControl;
        Label8: TLabel;
        procedure CancelButtonClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure FormCreate(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure FormActivate(Sender: TObject);
        procedure PeopleDataSourceDataChange(Sender: TObject; Field: TField);
        procedure PeopleEditChange(Sender: TObject);
        procedure PodrEditChange(Sender: TObject);
        procedure PeopleGridKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure PeopleGridKeyPress(Sender: TObject; var Key: Char);
        procedure PeopleGridCellClick(Column: TColumn);
        procedure PathEditExit(Sender: TObject);
        procedure SelectShtatRasClick(Sender: TObject);
        procedure OpenPeopleButtonClick(Sender: TObject);
        procedure OnlyWorkersClick(Sender: TObject);
        procedure Button1Click(Sender: TObject);
    private
        AcceptControl: TEditControl;
        ShtatForm: TShtatRasForm;
        procedure OpenDbf;
        procedure TakeDataFromDbf;
    public
        Loaded: Boolean;
        DbfOpen: Boolean;
        LastError: string;
        Id_Department: Integer;
    end;

var
    AutoAcceptForm: TAutoAcceptForm;

implementation

{$R *.DFM}

procedure TAutoAcceptForm.FormCreate(Sender: TObject);
begin
    PathEdit.Text := IMPORT_PATH;
    PeopleQuery.Transaction := ReadTransaction;
    PodrBQuery.Transaction := ReadTransaction;
    OutputQuery.Transaction := WriteTransaction;
    SearchLabel.Caption := '';

    PodrBQuery.Open;

    ShtatForm := TShtatRasForm.Create(Self, spmReadOnly + [spfCantRemoveFilter], -1, -1, True, Date);
    ShtatForm.FormStyle := fsNormal;
    ShtatForm.Hide;

    AcceptControl := TEditControl.Create;
    AcceptControl.Add([FC_ShtatRas, FC_KolStavok, FC_DateBeg, FC_DateEnd,
        FC_IsMain, FC_PodrB, FC_SPZ]);
    AcceptControl.Prepare(emNew);
end;

procedure TAutoAcceptForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    ShtatForm.Free;
    if FormStyle = fsMDIChild then Action := caFree;
    AcceptControl.Free;
end;

procedure TAutoAcceptForm.OpenDbf;
begin
    if Version = 2
        then begin
        DbfOpen := False;
        exit;
    end;

    if not Loaded then Exit;
    try
        PeopleTable.Active := False;
        PeopleTable.TableName := PathEdit.Text + '\' + ImportPeopleDbf;
        PeopleTable.Active := True;

        PodrTable.Active := False;
        PodrTable.TableName := PathEdit.Text + '\' + ImportPodrDbf;
        PodrTable.Active := True;

        if ImportType = 2 then
        begin
            PostTable.Active := False;
            PostTable.TableName := PathEdit.Text + '\' + ImportPostDbf;
            PostTable.Active := True;
        end;

    except on e: Exception do
        begin
            LastError := 'Виникла помилка під час відкриття DBF: ' +
                e.Message;
            StatusLabel.Caption := LastError;
            StatusLabel.Font.Color := clRed;
            DbfOpen := False;
            Exit;
        end;
    end;
    DbfOpen := True;
end;

procedure TAutoAcceptForm.PathEditExit(Sender: TObject);
begin
    OpenDbf;
end;

procedure TAutoAcceptForm.TakeDataFromDbf;
begin
    if not DbfOpen then OpenDbf;
    if not DbfOpen then Exit;

    FC_ShtatRas.Value := Null;
    FC_PodrB.Value := Null;
    DetailsMemo.Text := '';
    ToPicker.Checked := False;
    IsMainBox.Checked := True;
    KolStavokEdit.Text := '1';

    PeopleTable.Locate('Ink', PeopleQuery['Tin'], []);
    if Trim(PeopleTable['Ink']) <> Trim(PeopleQuery['Tin']) then
    begin
        LastError := 'Неможливо знайти цю людину у файлі';
        Exit;
    end;

    with DetailsMemo.Lines do
    begin
        Add('Табельний номер: ' + IntToStr(PeopleTable['T_Num']));

        if ImportType = 2 then
        begin
            if PodrTable.Locate('Id_PodrB', PeopleTable['Id_PodrB'], [])
                then Add('Підрозділ: ' + PodrTable['Podr_Name'])
        end
        else
        begin
            if PodrTable.Locate('NB', PeopleTable['Podr'], [])
                then Add('Підрозділ: ' + PodrTable['Name'])
        end;

        if ImportType = 2 then
        begin
            if PostTable.Locate('Id_PostK', PeopleTable['Id_PostK'], [])
                then Add('Посада: ' + PostTable['Post_Name'])
        end
        else Add('Посада: ' + PeopleTable['Post']);

        if ImportType = 2 then
        begin
            if PeopleTable['Oklad'] <> 0
                then Add('Оклад: ' + FloatToStr(PeopleTable['Oklad']));
            if PeopleTable['Tarst'] <> 0
                then Add('Тарифна ставка: ' + FloatToStr(PeopleTable['Tarst']));
        end;

        if not VarIsNull(PeopleTable['Common_St'])
            then Add('Дата прийняття на роботу: ' +
                DateToStr(PeopleTable['Common_St']));
        if not VarIsNull(PeopleTable['Erasing'])
            then Add('Дата звільнення: ' +
                DateToStr(PeopleTable['Erasing']));
    end;

    if not VarIsNull(PeopleTable['Common_St']) then
        AcceptDatePicker.Date := PeopleTable['Common_St'];

    if ImportType = 2 then
    begin
        if PodrBQuery.Locate('Id_PodrB', PeopleTable['Id_PodrB'], []) then
            FC_PodrB.Value := PodrBQuery['Id_Department'];
    end
    else
        if PodrBQuery.Locate('Id_PodrB', PeopleTable['Podr'], []) then
            FC_PodrB.Value := PodrBQuery['Id_Department'];
end;


procedure TAutoAcceptForm.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TAutoAcceptForm.OkButtonClick(Sender: TObject);
var
    s: string;
begin
    if PeopleQuery.IsEmpty then
    begin
        MessageDlg('Нема людей!', mtError, [mbOk], 0);
        Exit;
    end;

    AcceptControl.Read;
    if not AcceptControl.CheckFill then
    begin
        ModalResult := 0;
        Exit;
    end;

    if FC_KolStavok.Value > ShtatForm.ShtatQuery['Kol_Stavok'] then
    begin
        MessageDlg('Кількість ставок людини не повинна перевищувати кількість ставок на вакансії',
            mtError, [mbOk], 0);
        Exit;
    end;

    try
        FC_KolStavok.Value := StrToFloat(KolStavokEdit.Text);
        AcceptControl.ExecProc('Quick_Accept_2', [PeopleQuery['Id_Man']]);
    except on e: Exception do
            ShowError(e);
    end;

    DepartmentLabel.Caption := '---';
    PostLabel.Caption := '---';
    OkladLabel.Caption := '---';

    PeopleQuery.Next;
    s := PeopleQuery['FIO'];
    PeopleQuery.Close;
    PeopleQuery.Open;
    PeopleQuery.Locate('FIO', s, []);
    PeopleGrid.SetFocus;
    GridResize(PeopleGrid);
end;

procedure TAutoAcceptForm.FormActivate(Sender: TObject);
begin
    if Screen.Height <= 600 then Top := 0;
    Loaded := True;
    PeopleQuery.Open;
    GridResize(PeopleGrid);
end;

procedure TAutoAcceptForm.PeopleDataSourceDataChange(Sender: TObject;
    Field: TField);
begin
    if not Loaded then Exit;

    if PeopleQuery.IsEmpty then Exit;
    LastError := '';
    TakeDataFromDbf;
    if LastError <> '' then
    begin
        StatusLabel.Caption := LastError;
        StatusLabel.Font.Color := clRed;
    end
    else
    begin
        StatusLabel.Caption :=
            'Отримано дані по людині «' + PeopleQuery['FIO'] + '»';
        StatusLabel.Font.Color := clBlack;
    end;
end;

procedure TAutoAcceptForm.PeopleEditChange(Sender: TObject);
begin
    OpenDbf;
end;

procedure TAutoAcceptForm.PodrEditChange(Sender: TObject);
begin
    OpenDbf;
end;

procedure TAutoAcceptForm.PeopleGridKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    case Key of
        VK_BACK: SearchLabel.Caption := '';
        VK_RETURN:
            begin
                Key := 0;
                if VarIsNull(FC_ShtatRas.Value) then
                    SelectShtatRas.Click
                else OkButton.Click;
            end;
    end;
end;

procedure TAutoAcceptForm.PeopleGridKeyPress(Sender: TObject;
    var Key: Char);
const
    LettersBig = 'АБВГҐДЕЁЖЗЄІИЇЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ';
    LettersSmall = 'абвгґдеёжзєіиїйклмнопрстуфхцчшщъыьэюя';
    Signs = '0123456789-()/\';
begin
    if (Pos(Key, LettersBig) = 0)
        and (Pos(Key, LettersSmall) = 0)
        and (Pos(Key, Signs) = 0)
        then Exit;

    SearchLabel.Caption := SearchLabel.Caption + Key;
    PeopleQuery.Locate('FIO', SearchLabel.Caption,
        [loPartialKey, loCaseInsensitive]);
end;

procedure TAutoAcceptForm.PeopleGridCellClick(Column: TColumn);
begin
    SearchLabel.Caption := '';
end;

procedure TAutoAcceptForm.SelectShtatRasClick(Sender: TObject);
begin
    ShtatForm.RefreshButton.Click;
    with ShtatForm do
        if ShowModal = mrOk then
        begin
            FC_ShtatRas.Value := ShtatQuery['Id_ShtatRas'];
            DepartmentLabel.Caption := DepartmentsQuery['Name_Short'];
            PostLabel.Caption := ShtatQuery['Name_Post'];
            ToPicker.Date := ShtatQuery['Date_End'];
            if ShtatQuery['Oklad'] <> 0 then
                OkladLabel.Caption := ShtatQuery['Oklad'];
            if ShtatQuery['Kol_Stavok'] > 1 then KolStavokEdit.Text := '1'
            else KolStavokEdit.Text := FloatToStr(ShtatQuery['Kol_Stavok']);
        end;
end;

procedure TAutoAcceptForm.OpenPeopleButtonClick(Sender: TObject);
var
    Directory: string;
begin
    if SelectDirectory('Виберіть місце, де знаходиться буфер обміну',
        '', Directory) then PathEdit.Text := Directory;
end;

procedure TAutoAcceptForm.OnlyWorkersClick(Sender: TObject);
var
    s: string;
begin

    s := PeopleQuery['FIO'];
    PeopleQuery.Close;

    if OnlyWorkers.Checked then
        PeopleQuery.SQL.Text := 'SELECT C.ID_PCARD, P.Id_Man, Familia, Imya, Otchestvo, Id_Sex, '
            + 'Tin, TN, Familia || '' '' || Imya || '' '' || Otchestvo AS FIO '
            + 'FROM People P, Private_Cards C '
            + 'WHERE C.Id_Man = P.Id_Man '
            + 'AND NOT EXISTS(SELECT * FROM Man_Moving M '
            + 'WHERE M.Id_PCard = C.Id_PCard) '
            + 'ORDER BY Familia, Imya'
    else
        PeopleQuery.SQL.Text := 'SELECT C.ID_PCARD, P.Id_Man, Familia, Imya, Otchestvo, Id_Sex,'
            + 'Tin, TN, Familia || '' '' || Imya || '' '' || Otchestvo AS FIO '
            + 'FROM People P, Private_Cards C '
            + 'WHERE C.Id_Man = P.Id_Man '
            + 'ORDER BY Familia, Imya';

    PeopleQuery.Open;


    PeopleQuery.Open;
    PeopleQuery.Locate('FIO', s, []);
    PeopleGrid.SetFocus;
    GridResize(PeopleGrid);
end;

procedure TAutoAcceptForm.Button1Click(Sender: TObject);
begin

    if VarIsNull(PeopleQuery['ID_PCARD']) then exit;

    if MessageDlg('Ви справді бажаєте вилучити усі переміщення для цієї людини, які було зроблено за допомогою спрощенного прийняття?', mtConfirmation, [MbYes, mbNo], 0) = ID_NO then exit;

    OutputQuery.Close;
    OutputQuery.SQL.Text := 'DELETE FROM MAN_MOVING WHERE ID_ORDER = -1 AND ID_PCARD = ' + IntToStr(PeopleQuery['ID_PCARD']);
    ExecQuery(OutputQuery);
end;

end.
