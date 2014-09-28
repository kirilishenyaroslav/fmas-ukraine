
{ -$Id: PCardsViewUnit.pas,v 1.1 2005/07/11 17:06:32 valik Exp $}
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
    EditControl, ComCtrls, ToolWin, SpCommon, ExtCtrls,
    DepartmentsViewUnit, FIBDataSet, pFIBDataSet, NagScreenUnit, AccMgmt,
    dmPCardsView;

type
    TPCardsViewForm = class(TForm)
        Label3: TLabel;
        PCardGrid: TDBGrid;
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
        PCardCountLabel: TLabel;
        Label1: TLabel;
        CurDateLabel: TLabel;
        CurDateBox: TDateTimePicker;
        Label2: TLabel;
        DateFilter: TBitBtn;
    ResultQuery: TpFIBDataSet;
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

    procedure SelectPCard(var Value: Variant; var DisplayText: String);

var
    PCardsViewForm: TPCardsViewForm;

implementation

uses PCardsDetailsUnit, PCardsSearchUnit;

{$R *.DFM}

procedure SelectPCard(var Value: Variant; var DisplayText: String);
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

    Id_Filter_Department := Consts_Query['LOCAL_DEPARTMENT'];
    DepartmentEdit.Text := DepNameQuery['NAME_SHORT'];
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
begin
    if (ResultQuery.IsEmpty) and (Mode <> emNew) then Exit;
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
    SysOptQuery.Open;
    if (ResultQuery['ID_PCARD'] - (ResultQuery['ID_PCARD'] div 100) * 100 =
        SysOptQuery['ID_SERVER'])
        or ((SysOptQuery['ID_SERVER'] = 12) and (ResultQuery['ID_PCARD'] < 100))
            then
    begin
        ShowDetails(emModify);
    end
    else
        MessageDlg('Ця особиста картка була експортована з іншого РУ і не редагується!', mtinformation, [mbYes], 0);
    SysOPtQuery.Close;

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
    ResultQuery['FIO'] := ResultQuery['Familia'] + ' ' +
        Copy(ResultQuery['Imya'], 1, 1) + '.' +
        Copy(ResultQuery['Otchestvo'], 1, 1) + '.';
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

end.

