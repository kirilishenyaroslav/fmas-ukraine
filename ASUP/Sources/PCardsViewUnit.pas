
{ -$Id: PCardsViewUnit.pas,v 1.14 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                       Модуль "Список личных карточек"                        }
{    Отображение списка личных карочек, вызов модуля                           }
{     редактирования личной карточки                                           }
{    Ответственный:Данил Збуривский                                            }

unit PCardsViewUnit;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    Db, IBCustomDataSet, IBQuery, StdCtrls, Buttons, Grids, DBGrids,
    EditControl, ComCtrls, ToolWin, PersonalCommon, SpCommon, ExtCtrls,
    DepartmentsViewUnit, FIBDataSet, pFIBDataSet, NagScreenUnit, AccMgmt;

type
    TPCardsViewForm = class(TForm)
        Label3: TLabel;
        PCardGrid: TDBGrid;
        ResultQuery: TIBQuery;
        PCardSource: TDataSource;
        ToolBar1: TToolBar;
        ToolButton1: TToolButton;
        ToolPanel: TPanel;
        AddButton: TSpeedButton;
        ModifyButton: TSpeedButton;
        DetailsButton: TSpeedButton;
        FindButton: TSpeedButton;
        OkButton: TSpeedButton;
        CancelButton: TSpeedButton;
        Bevel1: TBevel;
        FilterPanel: TPanel;
        WorkingBox: TCheckBox;
        RefreshButton: TSpeedButton;
        FindPanel: TPanel;
        SearchLabel: TLabel;
        SearchEdit: TEdit;
        DepartmentEdit: TEdit;
        DepartmentButton: TBitBtn;
        DieButton: TSpeedButton;
        WorkQuery: TIBQuery;
        SysOptQuery: TIBQuery;
        SysOptQueryID_SERVER: TIntegerField;
        PCardCountLabel: TLabel;
        Label1: TLabel;
        CurDateLabel: TLabel;
        CurDateBox: TDateTimePicker;
        ResultQueryID_PCARD: TIntegerField;
        ResultQueryTN: TIntegerField;
        ResultQueryFAMILIA: TIBStringField;
        ResultQueryIMYA: TIBStringField;
        ResultQueryOTCHESTVO: TIBStringField;
        ResultQueryID_MAN: TIntegerField;
        ResultQueryFIO: TStringField;
        Label2: TLabel;
        DateFilter: TBitBtn;
        SearchNextButton: TBitBtn;
        ResultQueryDATE_CLOSE: TDateField;
        ResultQueryID_SERVER: TIntegerField;
        procedure AddButtonClick(Sender: TObject);
        procedure ModifyButtonClick(Sender: TObject);
        procedure DetailsButtonClick(Sender: TObject);
        procedure PCardGridDblClick(Sender: TObject);

        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure FormResize(Sender: TObject);
        procedure ShowDetails(Mode: TEditMode);
        procedure FindButtonClick(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
        procedure PCardGridKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure FormShow(Sender: TObject);
        procedure RefreshButtonClick(Sender: TObject);
        procedure SearchEditChange(Sender: TObject);
        procedure PCardGridKeyPress(Sender: TObject; var Key: Char);
        procedure PCardGridCellClick(Column: TColumn);
        procedure DepartmentButtonClick(Sender: TObject);
        procedure DieButtonClick(Sender: TObject);
        procedure WorkingBoxClick(Sender: TObject);
        procedure DepFilterBoxClick(Sender: TObject);
        procedure FilterPanelResize(Sender: TObject);
        procedure ResultQueryCalcFields(DataSet: TDataSet);
        procedure DateFilterClick(Sender: TObject);
        procedure FocusGrid;
        procedure SearchNextButtonClick(Sender: TObject);
        procedure PCardGridDrawColumnCell(Sender: TObject; const Rect: TRect;
            DataCol: Integer; Column: TColumn; State: TGridDrawState);
    private
  //PCardsCount:Integer;
    public
        Select: Boolean;
        Id_Filter_Department: Integer; // подразделение, по которому фильтровать
        Cur_Date: TDate; // дата, на которую смотрятся работающие
        Second_Date: TDate;
            // если нужно выбрать работающих за период, конец периода
        UseFilter: Boolean; // надо ли фильтровать

        procedure ApplyFilter;
        function ShowModal: Integer; reintroduce;

        constructor Create(AOwner: TComponent; ShowWorking: Boolean;
            CanRemoveFilter: Boolean; Cur_Date: TDate = 0); reintroduce;
  // начало периода работы, конец периода работы
    end;

procedure SelectPCard(var Value: Variant; var DisplayText: string);

var
    PCardsViewForm: TPCardsViewForm;

implementation

uses PCardsDetailsUnit, PCardsSearchUnit, uCommonSp, Variants, qFTools,
    Clipbrd;

{$R *.DFM}

procedure SelectPCard(var Value: Variant; var DisplayText: string);
var
    form: TPCardsViewForm;
begin
    form := TPCardsViewForm.Create(Application.MainForm, True, True);
    form.Select := True;
    if form.ShowModal = mrOk then
        with form do
        begin
            Value := ResultQuery['Id_PCard'];
            DisplayText := ResultQuery['Familia'] + ' ' + ResultQuery['Imya'] + ' ' +
                ResultQuery['Otchestvo'] + ' (' + IntToStr(ResultQuery['TN']) + ')';
        end;
    form.Free;
end;

constructor TPCardsViewForm.Create(AOwner: TComponent; ShowWorking: Boolean;
    CanRemoveFilter: Boolean; Cur_Date: TDate = 0);
begin
    inherited Create(AOwner);

    if Cur_Date = 0 then Cur_Date := Date;
    Self.Cur_Date := Cur_Date;
    Self.Second_Date := Second_Date;

    if not PersonalCommon.AdminMode then DieButton.Visible := False;
    ResultQuery.Transaction := PersonalCommon.ReadTransaction;
    WorkQuery.Transaction := PersonalCommon.WriteTransaction;
    SysOptQuery.Transaction := PersonalCommon.ReadTransaction;

        // подготавливаем фильтры
    UseFilter := False;

    Id_Filter_Department := Coalesce(Consts_Query['LOCAL_DEPARTMENT'], 0);
    DepartmentEdit.Text := Coalesce(DepNameQuery['NAME_SHORT'], 0);
    WorkingBox.Checked := ShowWorking;
    CurDateBox.Date := Cur_Date;

    DateFilter.Visible := CanRemoveFilter;
    WorkingBox.Enabled := CanRemoveFilter;
    CurDateBox.Enabled := canRemoveFilter;

    UseFilter := True;
    ApplyFilter;
end;

function TPcardsViewForm.ShowModal: Integer;

begin
    //проверка прав доступа для модальной формы
    if (CheckAccess('/ROOT/PCardsList', 'View', True) <> 0) then
    begin
        ModalResult := mrCancel;
        Result := mrCancel;
        Exit;
    end;
    ShowModal := inherited ShowModal;
end;

procedure TPCardsViewForm.ApplyFilter;
var
    NagScreen: TNagScreen;
begin
    if not UseFilter then Exit;

    NagScreen := TNagScreen.Create(self);
    NagScreen.Show;
    NagScreen.SetStatusText('Отримується дані...');

    with ResultQuery do
    begin
        Close;
        ParamByName('Cur_Date').AsDate := CurDateBox.Date;
        if WorkingBox.Checked then
            ParamByName('Only_Working').AsInteger := 1
        else ParamByName('Only_Working').AsInteger := 0;
        ParamByName('Id_Department').AsInteger := Id_Filter_Department;
        Open;
        FetchAll;
        PCardCountLabel.Caption := 'Кількість карток: ' +
            IntToStr(RecordCount);
    end;
    ResultQuery.First;
    GridResize(PCardGrid);

    NagScreen.Free;
    FocusGrid;
end;

procedure TPCardsViewForm.ShowDetails(Mode: TEditMode);
var
    form: TPCardsDetailsForm;
    id: Integer;
    PcardSp: TSprav;
begin
    if (ResultQuery.IsEmpty) and (Mode <> emNew) then Exit;

    if NewOrders then
    begin
        PCardSp := GetSprav('ASUP\PrivateCard');
        with PCardSp.Input do
        begin
            Append;
            FieldValues['Id_PCard'] := ResultQuery['Id_PCard'];
            FieldValues['Actual_Date'] := Cur_Date;
            FieldValues['DBHandle'] := Integer(FIBDatabase.Handle);
            if Mode = emView then
                FieldValues['Modify'] := 0
            else FieldValues['Modify'] := 1;
            Post;
        end;
        PCardSp.Show;
        PCardSp.Free;
        Exit;
    end;

    form := TPCardsDetailsForm.Create(Self);

    form.Mode := Mode;
    if (not ResultQuery.IsEmpty) and (Mode <> emNew) then
    begin
        form.Id_PCard := ResultQuery['Id_PCard'];
        form.Id_Man := ResultQuery['Id_Man'];
    end
    else
    begin
        form.Id_PCard := -1;
        form.Id_Man := -1;
    end;

    form.PrepareForm;
    if form.ShowModal = mrOk then
        with ResultQuery do
        begin
            Close;
            Open;

            id := Form.IDPCARD;
                // если новая карточка - снять фильтр, иначе не увидим добавленного
            if Mode = emNew then
            begin
                WorkingBox.Checked := False;
                ApplyFilter;
            end;
            Locate('ID_PCARD', id, []);
        end;
    form.Free;
end;

procedure TPCardsViewForm.AddButtonClick(Sender: TObject);
begin
    ShowDetails(emNew);
end;

procedure TPCardsViewForm.ModifyButtonClick(Sender: TObject);
begin
    if not SysOptQuery.Active then SysOptQuery.Open;

    if (Version = 1) and (VarIsNull(ResultQuery['Id_Server']) or
        (SysOptQuery['Id_Server'] <> ResultQuery['Id_Server'])) then
        MessageDlg('Ця особиста картка була експортована з іншого РУ і не редагується!', mtinformation, [mbYes], 0)
    else ShowDetails(emModify);
end;

procedure TPCardsViewForm.DetailsButtonClick(Sender: TObject);
begin
    ShowDetails(emView);
end;

procedure TPCardsViewForm.PCardGridDblClick(Sender: TObject);
begin
    OkButton.Click;
end;

procedure TPCardsViewForm.FindButtonClick(Sender: TObject);
var
    form: TPCardsSearchForm;
    S: string;
begin
    form := TPCardsSearchForm.Create(Self);
    with form do
        if ShowModal = mrOk then
        begin
            s := Trim(SearchEdit.Text);
            case SearchRadioGroup.ItemIndex of
                0:
                    if s <> '' then
                    begin
                        if ResultQuery.Locate('Familia', s, [loCaseInsensitive,
                            loPartialKey])
                            = False then
                            with SearchFamiliaQuery do
                            begin
                                Close;
                                Params.ParamValues['Familia'] :=
                                    SearchEdit.Text;
                                Open;
                                if IsEmpty then
                                    MessageDlg('Не знайдено такого запису!',
                                        mtWarning, [mbOk], 0)
                                else
                                    ResultQuery.Locate('Id_PCard',
                                        SearchFamiliaQuery['Id_PCard'], []);
                            end;
                    end;
                1:
                    begin
                        SearchTNQuery.Close;
                        with SearchTNQuery.Params do
                            ParamValues['TN'] := s;
                        SearchTNQuery.Open;
                        if SearchTNQuery.IsEmpty then
                            MessageDlg('Не знайдено такого запису!',
                                mtWarning, [mbOk], 0)
                        else
                            ResultQuery.Locate('Id_PCard',
                                SearchTNQuery['Id_PCard'], []);
                    end;
            end;
        end;
    form.Free;
end;

procedure TPCardsViewForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then Action := caFree;

end;

procedure TPCardsViewForm.FormResize(Sender: TObject);
begin
    GridResize(PCardGrid);
end;

procedure TPCardsViewForm.OkButtonClick(Sender: TObject);
begin
    if Select then
    begin
        if not ResultQuery.IsEmpty then ModalResult := mrOk
        else
            MessageDlg('Немає записів.',
                mtInformation, [mbOk], 0);
    end
    else
        ShowDetails(emView);
end;

procedure TPCardsViewForm.CancelButtonClick(Sender: TObject);
begin
    if FormStyle = fsNormal then ModalResult := mrCancel;
    Close;
end;

procedure TPCardsViewForm.PCardGridKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    case Key of
        VK_RETURN: OkButton.Click;
        VK_SPACE: ModifyButton.Click;
        VK_ADD: AddButton.Click;
        VK_BACK: SearchEdit.Text := '';
        ord('Z'): if (ssAlt in Shift) and (ssShift in Shift) and (ssCtrl in
                Shift) then
            try
                Clipboard.AsText := 'Id_PCard: ' + IntToStr(ResultQuery['Id_PCard']) +
                    ' Id_Man: ' + IntToStr(ResultQuery['Id_Man']);
                ShowMessage('Id_PCard: ' + IntToStr(ResultQuery['Id_PCard']) +
                    ' Id_Man: ' + IntToStr(ResultQuery['Id_Man']));
            except
            end;
    end;
end;

procedure TPCardsViewForm.FormShow(Sender: TObject);
begin

//проверка прав доступа еcли MDI;

    if FormStyle = fsMDIChild then
    begin

        if (CheckAccess('/ROOT/PCardsList', 'View', True)) <> 0 then
        begin
            Close;
            Exit;
        end;
    end;

    if (CheckAccess('/ROOT/PCardsList', 'Edit')) <> 0 then
    begin
        AddButton.Enabled := False;
        ModifyButton.Enabled := False;
    end
    else
    begin
        AddButton.Enabled := True;
        ModifyButton.Enabled := True;
    end;

    if Select then OkButton.Caption := 'Вибрати'
    else OkButton.Visible := false;
    CancelButton.Align := alRight;
    OkButton.Align := alRight;
end;

procedure TPCardsViewForm.RefreshButtonClick(Sender: TObject);
begin
    QueryRefresh(ResultQuery);
    PCardCountLabel.Caption := 'Клацніть тут, щоб побачити кількість карток';
end;

procedure TPCardsViewForm.SearchEditChange(Sender: TObject);
var
    TN: Integer;
begin
    try
        TN := StrToInt(SearchEdit.Text);
    except
        TN := 0;
    end;

    if TN <> 0 then
        ResultQuery.Locate('TN', SearchEdit.Text, [loPartialKey])
    else
        ResultQuery.Locate('Familia', SearchEdit.Text, [loPartialKey,
            loCaseInsensitive]);
end;

procedure TPCardsViewForm.PCardGridKeyPress(Sender: TObject;
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

procedure TPCardsViewForm.PCardGridCellClick(Column: TColumn);
begin
    SearchEdit.Text := '';
end;

procedure TPCardsViewForm.DepartmentButtonClick(Sender: TObject);
var
    form: TDepartmentsViewForm;
begin
    form := TDepartmentsViewForm.Create(Self);
    form.Buhg := False;
    form.Prepare(True, Date);
    form.CanSelectRoot := True;
    if form.ShowModal = mrOk then
        with form do
        begin
            Id_Filter_Department := Selected_Id;
            if Id_Filter_Department = -1 then
                DepartmentEdit.Text := Consts_Query['Firm_Name']
            else DepartmentEdit.Text := ResultQuery['Name_Short'];

            UseFilter := False;
            WorkingBox.Checked := True;
            UseFilter := True;
            ApplyFilter;
        end;
    form.Free;
end;

procedure TPCardsViewForm.DieButtonClick(Sender: TObject);
begin
    if not ResultQuery.IsEmpty then
    begin
        if
            MessageDlg('Запис, та усі з ним зв''язані будуть вилучені!Продовжити?',
            mtconfirmation, [mbYes, MbNo], 0) = mrYes
            then
        begin
            WorkQuery.SQL.Text := 'EXECUTE PROCEDURE UTIL_PCARD_DEL ' +
                IntToStr(ResultQuery['ID_PCARD']);
            ExecQuery(WorkQuery);
            ResultQuery.Close;
            ResultQuery.Open;
        end;
    end;
end;

procedure TPCardsViewForm.WorkingBoxClick(Sender: TObject);
begin
    ApplyFilter;
    CurDateBox.Visible := WorkingBox.Checked;
    CurDateLabel.Visible := WorkingBox.Checked;
    DateFilter.Visible := WorkingBox.Checked;
end;

procedure TPCardsViewForm.DepFilterBoxClick(Sender: TObject);
begin
    ApplyFilter;
end;

procedure TPCardsViewForm.FilterPanelResize(Sender: TObject);
begin
    DateFilter.Left := FilterPanel.ClientWidth - DateFilter.Width - 5;
    CurDateBox.Left := DateFilter.Left - CurDateBox.Width - 5;
    CurDateLabel.Left := CurDateBox.Left - CurDateLabel.Width - 20;
    DepartmentButton.Left := FilterPanel.ClientWidth - DepartmentButton.Width;
    DepartmentEdit.Width := FilterPanel.ClientWidth - DepartmentEdit.Left;
end;

procedure TPCardsViewForm.ResultQueryCalcFields(DataSet: TDataSet);
begin
    try
        ResultQuery['FIO'] := ResultQuery['Familia'] + ' ' +
            Copy(ResultQuery['Imya'], 1, 1) + '.' +
            Copy(ResultQuery['Otchestvo'], 1, 1) + '.';
    except
        ShowMessage('Помилка при CalcFields F: ' +
            Coalesce(ResultQuery['Familia'], '<>') + ' I: ' +
            Coalesce(ResultQuery['Imya'], '<>') + ' O: ' +
            Coalesce(ResultQuery['Otchestvo'], '<>'));
    end;
end;

procedure TPCardsViewForm.DateFilterClick(Sender: TObject);
begin
    WorkingBox.Checked;
    ApplyFilter;
end;

procedure TPCardsViewForm.FocusGrid;
begin
    if Visible and Enabled and PCardGrid.Enabled and PCardGrid.Visible then
        PCardGrid.SetFocus;
end;

procedure TPCardsViewForm.SearchNextButtonClick(Sender: TObject);
var
    TN: Integer;
begin
    try
        TN := StrToInt(SearchEdit.Text);
    except
        TN := 0;
    end;

    if TN <> 0 then
        ResultQuery.LocateNext('TN', SearchEdit.Text, [loPartialKey])
    else
        ResultQuery.LocateNext('Familia', SearchEdit.Text, [loPartialKey,
            loCaseInsensitive]);
end;

procedure TPCardsViewForm.PCardGridDrawColumnCell(Sender: TObject;
    const Rect: TRect; DataCol: Integer; Column: TColumn;
    State: TGridDrawState);
var
    Filter_Date: TDate;
begin
    if WorkingBox.Checked then Filter_Date := CurDateBox.Date
    else Filter_Date := Date;

        // красим закрытую карточку
    if Filter_Date >= ResultQuery['Date_Close'] then
        PCardGrid.Canvas.Brush.Color := clSilver
    else
        if gdSelected in State then PCardGrid.Canvas.Brush.Color := clHighlight
        else PCardGrid.Canvas.Brush.Color := clInfoBk;

    PCardGrid.Canvas.FillRect(Rect);

    PCardGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State)
end;

end.
