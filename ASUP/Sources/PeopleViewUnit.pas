
{ -$Id: PeopleViewUnit.pas,v 1.7 2008/02/19 13:25:41 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                     Модуль "Список физических лиц"                           }
{         Отображение списка физических лиц и вызов формы для редактирования
{         информации                                                           }
{         Ответственный: Данил Збуривский                                      }

unit PeopleViewUnit;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    Db, IBCustomDataSet, IBQuery, StdCtrls, Buttons, Grids,
    DBGrids, EditControl, ComCtrls, ToolWin, PersonalCommon, SpCommon,
    ExtCtrls;

type
    TPeopleViewForm = class(TForm)
        PeopleGrid: TDBGrid;
        Label3: TLabel;
        ResultQuery: TIBQuery;
        PeopleSource: TDataSource;
        ResultQueryID_MAN: TIntegerField;
        ResultQueryFAMILIA: TIBStringField;
        ResultQueryIMYA: TIBStringField;
        ResultQueryOTCHESTVO: TIBStringField;
        ToolBar1: TToolBar;
        ToolButton1: TToolButton;
        ResultQueryFIO: TIBStringField;
        ResultQueryID_SEX: TIntegerField;
        Panel1: TPanel;
        CancelButton: TSpeedButton;
        OkButton: TSpeedButton;
        FindButton: TSpeedButton;
        DetailsButton: TSpeedButton;
        ModifyButton: TSpeedButton;
        AddButton: TSpeedButton;
        DieButton: TSpeedButton;
        RefreshButton: TSpeedButton;
        FindPanel: TPanel;
        SearchLabel: TLabel;
        SearchEdit: TEdit;
        DeleteManQuery: TIBQuery;
        SysOptQuery: TIBQuery;
        SysOptQueryID_SERVER: TIntegerField;
        ResultQueryID_SERVER: TIntegerField;
        procedure AddButtonClick(Sender: TObject);
        procedure ModifyButtonClick(Sender: TObject);
        procedure DetailsButtonClick(Sender: TObject);
        procedure FindButtonClick(Sender: TObject);
        procedure PeopleGridDblClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure FormResize(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure PeopleGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

        procedure DieClick(Sender: TObject);
        procedure RefreshButtonClick(Sender: TObject);
        procedure PeopleGridKeyPress(Sender: TObject; var Key: Char);
        procedure SearchEditChange(Sender: TObject);
        procedure PeopleGridCellClick(Column: TColumn);
        procedure FormShow(Sender: TObject);
    private
        procedure ShowChangeForm(Mode: TEditMode);

        function CheckEnter: Boolean;
        function CheckAdd: Boolean;
        function CheckModify: Boolean;
        function CheckDelete: Boolean;
        function CheckView: Boolean;
    public
        Select: Boolean;

        function ShowModal: Integer; reintroduce;
        procedure Prepare(Select: Boolean);
    { Public declarations }
    end;

var
    PeopleViewForm: TPeopleViewForm;

implementation

uses PeopleDetailsUnit, PeopleSearchUnit;

{$R *.DFM}

function TPeopleViewForm.ShowModal: Integer;
begin
//проверка прав доступа для модальной формы
    if not CheckEnter then
    begin
        ModalResult := mrCancel;
        Exit;
    end;
    ShowModal := inherited ShowModal;
end;

procedure TPeopleViewForm.DieClick(Sender: TObject);
begin
    if not ResultQuery.IsEmpty then
    begin
        if
            MessageDlg
            ('Запись и все связанные с ней будут удалены!!! Ты уверен, что хочешь продолжить?',
            mtconfirmation, [mbYes, MbNo], 0) = mrYes
            then
        begin
            DeleteManQuery.Params.ParamValues['ID_MAN'] :=
                ResultQuery['Id_Man'];
            ExecQuery(DeleteManQuery);
            ResultQuery.Close;
            ResultQuery.Open;
        end;
    end;
end;

procedure TPeopleViewForm.Prepare(Select: Boolean);
begin
    if AdminMode then DieButton.Visible := True;

    ResultQuery.Transaction := PersonalCommon.ReadTransaction;
    ResultQuery.Close;
    ResultQuery.Open;
    Self.Select := Select;
    if Select then OkButton.Caption := 'Вибрати'
    else OkButton.Visible := False;
end;

procedure TPeopleViewForm.ShowChangeForm(Mode: TEditMode);
var
    form: TPeopleDetailsForm;
    id: Integer;
begin
    form := TPeopleDetailsForm.Create(Self);
    if Mode <> emNew then
        id := ResultQuery['Id_Man']
    else id := -1;
    form.Prepare(id, Mode);

    if form.ShowModal = mrOk then
    begin
        id := Form.IdMan;
        ResultQuery.Close;
        ResultQuery.Open;

        ResultQuery.Locate('Id_Man', id, []);
    end;
    form.Free;
end;

procedure TPeopleViewForm.AddButtonClick(Sender: TObject);
begin
    ShowChangeForm(emNew);
end;

procedure TPeopleViewForm.ModifyButtonClick(Sender: TObject);
begin
    SysOPtQuery.Open;

    if (Version <> 1)
        or (ResultQuery['ID_SERVER'] = SysOptQuery['ID_SERVER'])
        then
    begin
        if not ResultQuery.IsEmpty then
            ShowChangeForm(emModify);
    end
    else
        MessageDlg('Ця фізична особа була експортована з іншого РУ і не редагується!', mtinformation, [mbYes], 0);
    SysOptQuery.Close;
end;

procedure TPeopleViewForm.DetailsButtonClick(Sender: TObject);
begin
    if not ResultQuery.IsEmpty then
        ShowChangeForm(emView);
end;

procedure TPeopleViewForm.FindButtonClick(Sender: TObject);
var
    S: string;
    hyphen: Integer;
    form: TPeopleSearchForm;
begin
    form := TPeopleSearchForm.Create(Self);
    with form do
        if ShowModal = mrOk then
        begin
            case SearchRadioGroup.ItemIndex of
                0: begin
                        s := Trim(SearchEdit.Text);
                        if not PassCheck.Checked then
                            ResultQuery.Locate('familia', s, [loCaseInsensitive,
                                loPartialKey])
                        else begin
                            s := AnsiLowerCase(s);
                            s[1] := AnsiUpperCase(s[1])[1];
                            hyphen := Pos('-', s);
                            if hyphen <> 0 then s[hyphen + 1] :=
                                AnsiUpperCase(s[hyphen + 1])[1];
                            SearchQuery.SQL.Text :=
                                'Select ID_MAN FROM PASS_DATA	WHERE Familia STARTING WITH ' + ''''
                                + S + '''' +
                                ' OR Rus_Familia STARTING WITH ' + '''' + S +
                                '''';
                            SearchQuery.Close;
                            SearchQuery.Open;
                            if SearchQuery.IsEmpty then
                                MessageDlg('Не знайдено такого запису!', mtWarning,
                                    [mbOk], 0)
                            else
                                ResultQuery.Locate('ID_MAN', SearchQuery['Id_Man'],
                                    []);
                        end;
                    end;
                1: begin
                        SearchQuery.SQL.Text :=
                            'Select ID_MAN FROM PEOPLE WHERE Tin=' + '''' +
                            SearchEdit.Text + '''';
                        SearchQuery.Close;
                        SearchQuery.Open;
                        if SearchQuery.IsEmpty then
                            MessageDlg('Не знайдено такого запису!', mtWarning,
                                [mbOk], 0)
                        else
                            ResultQuery.Locate('ID_MAN', SearchQuery['Id_Man'],
                                []);
                    end;
            end;
        end;
    form.Free;
end;

procedure TPeopleViewForm.PeopleGridDblClick(Sender: TObject);
begin
    if (not ResultQuery.IsEmpty) then
    begin
        OkButton.Click;
    end;

end;

procedure TPeopleViewForm.FormCreate(Sender: TObject);
begin
    DeleteManQuery.Transaction := PersonalCommon.WriteTransaction;
    SysOPtQuery.Transaction := PersonalCommon.ReadTransaction;
    GridResize(PeopleGrid);
    CancelButton.Align := alRight;
    OkButton.Align := alRight;
    DieButton.Visible := False;
end;

procedure TPeopleViewForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TPeopleViewForm.FormResize(Sender: TObject);
begin
    GridResize(PeopleGrid);
end;

procedure TPeopleViewForm.CancelButtonClick(Sender: TObject);
begin
    ModalResult := mrCancel;
    if FormStyle = fsMDIChild then Close;
end;

procedure TPeopleViewForm.OkButtonClick(Sender: TObject);
begin
    if Select then
    begin
        ModalResult := mrOk;
        if FormStyle = fsMDIChild then Close;
    end
    else
        ShowChangeForm(emView);
end;

procedure TPeopleViewForm.PeopleGridKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    case Key of
        VK_RETURN: OkButton.Click;
        VK_SPACE: ModifyButton.Click;
        VK_ADD: AddButton.Click;
        VK_BACK: SearchEdit.Text := '';
    end;
end;

procedure TPeopleViewForm.RefreshButtonClick(Sender: TObject);
begin
    QueryRefresh(ResultQuery);
end;

procedure TPeopleViewForm.PeopleGridKeyPress(Sender: TObject;
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

    SearchEdit.Text := SearchEdit.Text + Key;
end;

procedure TPeopleViewForm.SearchEditChange(Sender: TObject);
begin
    ResultQuery.Locate('FIO', SearchEdit.Text, [loPartialKey,
        loCaseInsensitive]);
end;

procedure TPeopleViewForm.PeopleGridCellClick(Column: TColumn);
begin
    SearchEdit.Text := '';
end;

procedure TPeopleViewForm.FormShow(Sender: TObject);
begin
  //проверка прав доступа еcли MDI;

    if FormStyle = fsMDIChild then
    begin

        if not CheckEnter then
        begin
            Close;
            Exit;
        end;
    end;

    AddButton.Enabled := CheckAdd;
    ModifyButton.Enabled := CheckModify;
    DetailsButton.Enabled := CheckView;
    DieButton.Enabled := CheckDelete;
end;

function TPeopleViewForm.CheckAdd: Boolean;
begin
    if Version = 2 then Result := CheckAccess('/ROOT/SpAllPeople', 'Add') = 0
    else Result := CheckAccess('/ROOT/PeopleList', 'Edit') = 0;
end;

function TPeopleViewForm.CheckDelete: Boolean;
begin
    if Version = 2 then Result := CheckAccess('/ROOT/SpAllPeople', 'Del') = 0
    else Result := CheckAccess('/ROOT/PeopleList', 'Edit') = 0;
end;

function TPeopleViewForm.CheckEnter: Boolean;
begin
    if Version = 2 then Result := CheckAccess('/ROOT/SpAllPeople', 'Belong') = 0
    else Result := CheckAccess('/ROOT/PeopleList', 'View') = 0;
end;

function TPeopleViewForm.CheckModify: Boolean;
begin
    if Version = 2 then Result := CheckAccess('/ROOT/SpAllPeople', 'Edit') = 0
    else Result := CheckAccess('/ROOT/PeopleList', 'Edit') = 0;
end;

function TPeopleViewForm.CheckView: Boolean;
begin
    if Version = 1 then Result := True
    else Result := CheckAccess('/ROOT/SpAllPeople/SAP_MainInfo', 'View') = 0;
end;

end.
