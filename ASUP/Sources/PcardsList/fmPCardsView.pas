
{ -$Id: fmPCardsView.pas,v 1.47 2008/04/14 09:09:19 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                       Модуль "Список личных карточек"                        }
{    Отображение списка личных карочек, вызов модуля                           }
{     редактирования личной карточки                                           }
{    Ответственный: Кропов Валентин, Волков Олег                               }

unit fmPCardsView;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    Db, IBCustomDataSet, IBQuery, StdCtrls, Buttons, Grids, DBGrids,
    EditControl, ComCtrls, ToolWin, SpCommon, ExtCtrls, Registry,
    FIBDataSet, pFIBDataSet, NagScreenUnit, AccMgmt, dmPCardsView,
    uFControl, uLabeledFControl, uSpravControl, uCommonSp, cxStyles,
    cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
    cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
    cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
    Variants, cxSplitter, ActnList, cxContainer, cxTextEdit, cxMaskEdit,
    cxDropDownEdit, cxCalendar, SpFormUnit, cxLabel, uDateControl,
  uBoolControl;

type
    TPCardsViewForm = class(TForm)
        Label3: TLabel;
        ToolBar1: TToolBar;
        ToolButton1: TToolButton;
        ToolPanel: TPanel;
        SelectButton: TSpeedButton;
        CancelButton: TSpeedButton;
        Bevel1: TBevel;
        FilterPanel: TPanel;
        WorkingBox: TCheckBox;
        RefreshButton: TSpeedButton;
        FindPanel: TPanel;
        SearchLabel: TLabel;
        SearchEdit: TEdit;
        PCardCountLabel: TLabel;
        Label1: TLabel;
        DateFilter: TBitBtn;
        FilterBox: TqFSpravControl;
        PCardView: TcxGrid;
        PCardTableView: TcxGridDBTableView;
        TNColumn: TcxGridDBColumn;
        FamiliaColumn: TcxGridDBColumn;
        ImyaColumn: TcxGridDBColumn;
        PCardViewLevel1: TcxGridLevel;
        OtchestvoColumn: TcxGridDBColumn;
        FioFilterBox: TCheckBox;
        FioEdit: TEdit;
        StyleRepository: TcxStyleRepository;
        stBackground: TcxStyle;
        stContent: TcxStyle;
        stContentEven: TcxStyle;
        stContentOdd: TcxStyle;
        stFilterBox: TcxStyle;
        stFooter: TcxStyle;
        stGroup: TcxStyle;
        stGroupByBox: TcxStyle;
        stHeader: TcxStyle;
        stInactive: TcxStyle;
        stIncSearch: TcxStyle;
        stIndicator: TcxStyle;
        stPreview: TcxStyle;
        stSelection: TcxStyle;
        stHotTrack: TcxStyle;
        KlugStyle: TcxGridTableViewStyleSheet;
        cxSplitter1: TcxSplitter;
        Label2: TLabel;
        ActionList: TActionList;
        FilterAction: TAction;
        RefreshAction: TAction;
        AddButton: TSpeedButton;
        ModifyButton: TSpeedButton;
        DetailsButton: TSpeedButton;
        InsertAction: TAction;
        ModifyAction: TAction;
        QuitAction: TAction;
        FIOColumn: TcxGridDBColumn;
        InnColumn: TcxGridDBColumn;
        BirthDateColumn: TcxGridDBColumn;
        SysInfo: TAction;
        qFSC_TypePost: TqFSpravControl;
        IsWorkingColumn: TcxGridDBColumn;
        cxLabel1: TcxLabel;
        cxLabel2: TcxLabel;
        SetFilterAction: TAction;
        DeleteAction: TAction;
        TypePersColumn: TcxGridDBColumn;
        ZvanColumn: TcxGridDBColumn;
        StepenColumn: TcxGridDBColumn;
        SB_StajRecalc: TSpeedButton;
        ProfkomButton: TSpeedButton;
        SB_Remind: TSpeedButton;
        InfoAction: TAction;
        FocusAction: TAction;
        Level: TqFSpravControl;
        CurDate: TqFDateControl;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    UseRusFio: TqFBoolControl;
    VerLabel: TLabel;
    cxLabel5: TcxLabel;
    WorkTypeLabel: TLabel;
        procedure PCardGridDblClick(Sender: TObject);

        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure CancelButtonClick(Sender: TObject);
        procedure PCardGridKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure FormShow(Sender: TObject);
        procedure SearchEditChange(Sender: TObject);
        procedure PCardGridKeyPress(Sender: TObject; var Key: Char);
        procedure PCardGridCellClick(Column: TColumn);
        procedure WorkingBoxClick(Sender: TObject);
        procedure DepFilterBoxClick(Sender: TObject);
        procedure FilterPanelResize(Sender: TObject);
        procedure FilterBoxOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure PCardTableViewDblClick(Sender: TObject);
        procedure FilterActionExecute(Sender: TObject);
        procedure FormActivate(Sender: TObject);
        procedure SelectActionExecute(Sender: TObject);
        procedure RefreshActionExecute(Sender: TObject);
        procedure InfoActionExecute(Sender: TObject);
        procedure ModifyActionExecute(Sender: TObject);
        procedure QuitActionExecute(Sender: TObject);
        procedure InsertActionExecute(Sender: TObject);
        procedure SysInfoExecute(Sender: TObject);
        procedure PCardTableViewKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure qFSC_TypePostOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure PCardTableViewCustomDrawCell(Sender: TcxCustomGridTableView;
            ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
            var ADone: Boolean);
        procedure FioEditKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure SetFilterActionExecute(Sender: TObject);
        procedure DeleteActionExecute(Sender: TObject);
        procedure RefreshButtonClick(Sender: TObject);
        procedure SB_StajRecalcClick(Sender: TObject);
        procedure ProfkomButtonClick(Sender: TObject);
        procedure SB_RemindClick(Sender: TObject);
        procedure FocusActionExecute(Sender: TObject);
        procedure LevelOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure FioFilterBoxKeyUp(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure FilterBoxKeyUp(Sender: TObject; var Key: Word;
            Shift: TShiftState);
    procedure PCardTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure FioEditChange(Sender: TObject);
    private
        DM: TLocalModule;
        Sprav: TPCardsViewSprav;
        RusFio: Boolean;
        ShowAll: Boolean; //если true, то показывать всех
    public
        UseFilter: Boolean;
        procedure LoadFromRegistry;
        procedure SaveIntoRegistry;
        procedure ApplyFilter;
        function ShowModal: Integer; reintroduce;

        constructor Create(AOwner: TComponent; Sprav: TPCardsViewSprav;
            DM: TLocalModule; FilterString: string; RusFio: Boolean); reintroduce;
    end;

implementation

{$R *.DFM}

uses uSelectForm, qFTools, Clipbrd, UpKernelUnit;

constructor TPCardsViewForm.Create(AOwner: TComponent; Sprav: TPCardsViewSprav;
    DM: TLocalModule; FilterString: string; RusFio: Boolean);
var tv:String;
begin
    inherited Create(AOwner);

    Self.DM := DM;
    Self.Sprav := Sprav;
    Self.RusFIO := RusFio;
    UseRusFio.Value := RusFIO;

    ShowAll := False; //по умолчанию

    if Dm.ActualDate = 0 then dm.ActualDate := Date;

    UseFilter := False;

    if DM.NewVersion then
    begin
        DM.ResultQuery.SelectSQL.Text := 'SELECT * FROM PCard_List_4(' +
            ':Cur_Date,:Only_Working,:Id_Department,:Tn_Filter,:Fio_Filter,' +
            ':type_post_filter, :Id_Level, :Show_Dropped_Workers, :Rus_Filter_Fio)';

        DM.DefaultLevel.Close;
        DM.DefaultLevel.Open;

        if not DM.DefaultLevel.IsEmpty then
        begin
            Level.Value := DM.DefaultLevel['DEFAULT_WORK_LEVEL'];
            DM.LevelsSelect.Close;
            DM.LevelsSelect.Open;
            DM.LevelsSelect.Locate('Id_Level', Level.Value, []);
            Level.DisplayText := DM.LevelsSelect['Level_Name'];
        end;
    end
    else
    begin
        DM.ResultQuery.SelectSQL.Text := 'SELECT * FROM PCard_List_2(' +
            ':Cur_Date,:Only_Working,:Id_Department,:Tn_Filter,:Fio_Filter,' +
            ':type_post_filter)';
        Level.Visible := False;
        UseRusFio.Visible := False;
        FilterPanel.Constraints.MaxHeight := FilterPanel.Height - 25;
        FilterPanel.Height := FilterPanel.Height - 25;
    end;


    FilterBox.Value := dm.LocalIdDepartment;
    FilterBox.DisplayText := dm.LocalNameDepartment;

    WorkingBox.Checked := Dm.ShowWorking;
    CurDate.Value := Dm.ActualDate;

    DateFilter.Visible := Dm.CanRemoveFilter;
    WorkingBox.Enabled := Dm.CanRemoveFilter;
    CurDate.Blocked := not Dm.canRemoveFilter;

    UseFilter := True;

    if FilterString <> '' then
    begin
        FioFilterBox.Checked := True;
        FioEdit.Text := FilterString;
    end;

    PCardTableView.DataController.DataSource := DM.PCardSource;

    tv:='';
    tv:=KYVLoadFromRegistry('PCardListWorkingBox',GetUserId);
    if (tv='0') or (tv='1') then
    begin
       WorkingBox.Checked:=Boolean(StrToInt(tv));
       WorkingBoxClick(Self);
    end;

    LoadFromRegistry;
    ApplyFilter;

    if  FilterString = '-2' then
    begin
        FioFilterBox.Checked := False;
        FilterString := '-1';
        FioEdit.Text := '';

    end;

    CancelButton.Align := alRight;
    SelectButton.Align := alRight;
    SelectButton.Visible := DM.Select;

    Dm.ConstsQuery.Open;
    if Dm.ConstsQuery['New_Orders'] = 'F' then
    begin
        InnColumn.Visible := False;
        TypePersColumn.Visible := False;
        ZvanColumn.Visible := False;
        StepenColumn.Visible := False;
        SB_StajRecalc.Visible := False;
        qFSC_TypePost.Visible := False;

        AddButton.Visible := False;
        ModifyButton.Visible := False;
        DetailsButton.Visible := False;
        ProfkomButton.Visible := False;
        SB_StajRecalc.Visible := False;
        SB_Remind.Visible := False;
        RefreshButton.Left := 0;
    end;

    VerLabel.Visible := DM.NewVersion;

end;

procedure TPcardsViewForm.LoadFromRegistry;
var
    reg: TRegistry;
    key, ownerName: string;
    idtype: integer;
begin
    reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_CURRENT_USER;

        if Owner <> nil then ownerName := Owner.Name
        else ownerName := '<unknown owner>';

        key := '\Software\ASUP\Klug Soft\' +
            ExtractFileName(Application.ExeName) + '\' + ownerName + '\' + Name;

        if reg.OpenKey(key, False) then
        begin
            idtype := reg.ReadInteger('id_type_post_filter');
            if idtype = 0 then qFSC_TypePost.Value := null
            else qFSC_TypePost.Value := idtype;
            qFSC_TypePost.DisplayText := reg.ReadString('name_filter');
            Level.LoadFromRegistry(reg);
            reg.CloseKey;
        end;
    except;
    end;
    reg.Free;
end;

procedure TPcardsViewForm.SaveIntoRegistry;
var
    reg: TRegistry;
    key, ownerName: string;
    idtype: integer;
begin
    reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_CURRENT_USER;

        if Owner <> nil then ownerName := Owner.Name
        else ownerName := '<unknown owner>';

        key := '\Software\ASUP\Klug Soft\' +
            ExtractFileName(Application.ExeName) + '\' + ownerName + '\' + Name;

        if reg.OpenKey(key, True) then
        begin
            if VarIsNull(qFSC_TypePost.Value) then idtype := 0
            else idtype := qFSC_TypePost.Value;
            reg.WriteInteger('id_type_post_filter', idtype);
            reg.WriteString('name_filter', qFSC_TypePost.DisplayText);
            Level.SaveIntoRegistry(reg);
            reg.CloseKey;
        end;
    finally
        reg.Free;
    end;
end;

function TPcardsViewForm.ShowModal: Integer;
begin
    //проверка прав доступа для модальной формы
    if (Dm.CheckAccess('/ROOT/PCardsList', 'View', True) <> 0) then
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
    TN_Filter: Integer;
    Only_Working, Id_Department: Integer;
    Fio_Filter: string;
begin
    NagScreen := TNagScreen.Create(self);
    NagScreen.Show;
    NagScreen.SetStatusText('Отримуються дані...');

    Dm.ResultQuery.Close;

    if WorkingBox.Checked then
        Only_Working := 1
    else
        Only_Working := 0;

    if VarIsNull(FilterBox.Value) then
        Id_Department := -1
    else
        Id_Department := FilterBox.Value;

    if FioFilterBox.Checked then begin

        try
            TN_Filter := StrToInt(FioEdit.Text);
        except
            TN_Filter := -1;
        end;

        if TN_Filter = -1 then
            Fio_Filter := FioEdit.Text;

    end
    else begin
        Tn_Filter := -1;
        Fio_Filter := '';
        {if ShowAll then
        begin
            Tn_Filter := -3; //для разнообразия, чтоб всех отобрать
        end}
    end;

    Dm.ResultQuery.ParamByName('Cur_Date').AsDate := CurDate.Value;
    Dm.ResultQuery.ParamByName('Only_Working').AsInteger := Only_Working;
    Dm.ResultQuery.ParamByName('Id_Department').AsInteger := Id_Department;
    Dm.ResultQuery.ParamByName('Tn_Filter').AsInteger := Tn_Filter;
    Dm.ResultQuery.ParamByName('Fio_Filter').AsString := Fio_Filter;
    Dm.ResultQuery.ParamByName('type_post_filter').AsVariant := qFSC_TypePost.Value;
    if DM.NewVersion then
    begin
        Dm.ResultQuery.ParamByName('Id_Level').AsVariant := Level.Value;
        Dm.ResultQuery.ParamByName('Show_Dropped_Workers').AsInteger :=
            Coalesce(DM.Show_Dropped_Workers, 0);
//        Dm.ResultQuery.ParamByName('Show_Dropped_Workers').AsInteger := 0;
        if UseRusFio.Value then Dm.ResultQuery.ParamByName('Rus_Filter_Fio').AsInteger := 1
        else Dm.ResultQuery.ParamByName('Rus_Filter_Fio').AsInteger := 0;
    end;
    Dm.ResultQuery.Open;
    Dm.ResultQuery.FetchAll;

    PCardCountLabel.Caption := 'Кількість карток: ' + IntToStr(Dm.ResultQuery.RecordCount);

    Dm.ResultQuery.First;

    NagScreen.Free;
end;

procedure TPCardsViewForm.PCardGridDblClick(Sender: TObject);
begin
    SelectActionExecute(Sender);
end;

procedure TPCardsViewForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    SaveIntoRegistry;
    if FormStyle = fsMDIChild then
    begin
        Action := caFree;
        Sprav.Free;
    end;
end;

procedure TPCardsViewForm.CancelButtonClick(Sender: TObject);
begin
    if FormStyle = fsNormal then ModalResult := mrCancel
    else Close;
end;

procedure TPCardsViewForm.PCardGridKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    case Key of
        VK_RETURN: SelectActionExecute(Sender);
        VK_SPACE: InfoActionExecute(Sender);
        VK_BACK: SearchEdit.Text := '';
        ord('Z'):
            if (ssAlt in Shift) and (ssShift in Shift) and (ssCtrl in
                Shift) then
            try
                ShowMessage('Id_PCard: ' + IntToStr(Dm.ResultQuery['Id_PCard']) +
                    ' Id_Man: ' + IntToStr(Dm.ResultQuery['Id_Man']));
            except
            end;
    end;
end;

procedure TPCardsViewForm.FormShow(Sender: TObject);
begin
//проверка прав доступа еcли MDI;
    if FormStyle = fsMDIChild then
    begin

        if (Dm.CheckAccess('/ROOT/PCardsList', 'View', True)) <> 0 then
        begin
            Close;
            Exit;
        end;
    end;
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
        Dm.ResultQuery.Locate('TN', SearchEdit.Text, [loPartialKey])
    else
        Dm.ResultQuery.Locate('Familia', SearchEdit.Text, [loPartialKey,
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

procedure TPCardsViewForm.WorkingBoxClick(Sender: TObject);
begin
    KYVSaveIntoRegistry('PCardListWorkingBox',IntToStr(Integer(WorkingBox.Checked)),GetUserId);
{    ApplyFilter;
    CurDateBox.Visible := WorkingBox.Checked;
    CurDateLabel.Visible := WorkingBox.Checked;
    DateFilter.Visible := WorkingBox.Checked;}
    if WorkingBox.Checked then Exit;
    FilterBox.Value := Null;
    FilterBox.DisplayText := '';
    qFSC_TypePost.Value := Null;
    qFSC_TypePost.DisplayText := '';
    ShowAll := not(ShowAll); //при нажатию по птичку инвертируем
end;

procedure TPCardsViewForm.DepFilterBoxClick(Sender: TObject);
begin
    ApplyFilter;
end;

procedure TPCardsViewForm.FilterPanelResize(Sender: TObject);
begin
    DateFilter.Left := FilterPanel.ClientWidth - DateFilter.Width - 5;
    CurDate.Left := DateFilter.Left - CurDate.Width - 5;
end;

procedure TPCardsViewForm.FilterBoxOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    sp: TSprav;
begin
        // создать справочник
    sp := GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(Dm.LocalDatabase.Handle);
            FieldValues['Actual_Date'] := Dm.ActualDate;
            Post;
        end;

                // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['Id_Department'];
            DisplayText := sp.Output['Name_Full'];
        end;
        sp.Free;
    end;
        // использовать фильтр
    WorkingBox.Checked := True;
end;

procedure TPCardsViewForm.PCardTableViewDblClick(Sender: TObject);
begin
    if (not DM.ResultQuery.IsEmpty) and (SelectButton.Visible) then SelectActionExecute(Sender);
    if (not DM.ResultQuery.IsEmpty) and (not SelectButton.Visible) then ModifyActionExecute(Sender);
end;

procedure TPCardsViewForm.FilterActionExecute(Sender: TObject);
begin
//    WorkingBoxClick;
    ApplyFilter;
    PCardView.SetFocus;
end;

procedure TPCardsViewForm.FormActivate(Sender: TObject);
begin
    PCardView.SetFocus;
end;

procedure TPCardsViewForm.SelectActionExecute(Sender: TObject);
begin
    if Dm.Select then
    begin
        if not Dm.ResultQuery.IsEmpty then ModalResult := mrOk
        else
            MessageDlg('Немає записів.',
                mtInformation, [mbOk], 0);
    end;
end;

procedure TPCardsViewForm.RefreshActionExecute(Sender: TObject);
begin
    ApplyFilter;
    PCardCountLabel.Caption := 'Клацніть тут, щоб побачити кількість карток';
end;

procedure TPCardsViewForm.InfoActionExecute(Sender: TObject);
var
    PCardSp: TSprav;
begin
    if Dm.ResultQuery.IsEmpty then Exit;
    if (Dm.CheckAccess('/ROOT/PCardsList/PrivateCard', 'View', True)) <> 0 then
    begin
        Exit;
    end;
    PCardSp := GetSprav('ASUP\PrivateCard');
    with PCardSp.Input do
    begin
        Append;
        if not Dm.ResultQuery.IsEmpty then
            FieldValues['Id_PCard'] := DM.ResultQuery['Id_PCard'];
        FieldValues['Actual_Date'] := CurDate.Value;
        FieldValues['DBHandle'] := Integer(DM.LocalDatabase.Handle);
        FieldValues['Modify'] := 0;
        FieldValues['FIO'] := DM.ResultQuery['FIO'];
        FieldValues['AdminMode'] := DM.AdminMode;
        FieldValues['ShowStyle'] := Sprav.Input['ShowStyle'];
        Post;
    end;
    PCardSp.Show;
    PCardSp.Free;
end;


procedure TPCardsViewForm.ModifyActionExecute(Sender: TObject);
var
    PCardSp: TSprav;
begin
    if DM.ResultQuery.IsEmpty then Exit;

    if (Dm.CheckAccess('/ROOT/PCardsList/PrivateCard', 'Edit', True)) <> 0 then
    begin
        Exit;
    end;
    PCardSp := GetSprav('ASUP\PrivateCard');
    with PCardSp.Input do
    begin
        Append;
        if not Dm.ResultQuery.IsEmpty then
            FieldValues['Id_PCard'] := DM.ResultQuery['Id_PCard'];
        FieldValues['Actual_Date'] := CurDate.Value;
        FieldValues['DBHandle'] := Integer(DM.LocalDatabase.Handle);
        FieldValues['Modify'] := 1;
        FieldValues['FIO'] := DM.ResultQuery['FIO'];
        FieldValues['AdminMode'] := DM.AdminMode;
        if FormStyle = fsMDIChild then
            FieldValues['ShowStyle'] := 1
        else FieldValues['ShowStyle'] := 0;
        Post;
    end;
    PCardSp.Show;
    PCardSp.Free;
end;

procedure TPCardsViewForm.QuitActionExecute(Sender: TObject);
begin
    Close;
end;

procedure TPCardsViewForm.InsertActionExecute(Sender: TObject);
var
    PCardSp: TSprav;
begin
    if (Dm.CheckAccess('/ROOT/PCardsList/PrivateCard', 'Add', True)) <> 0 then
    begin
        Exit;
    end;
    PCardSp := GetSprav('ASUP\PrivateCard');
    with PCardSp.Input do
    begin
        Append;
        if not DM.ResultQuery.IsEmpty then
            FieldValues['Id_PCard'] := DM.ResultQuery['Id_PCard'];
        FieldValues['Actual_Date'] := CurDate.Value;
        FieldValues['DBHandle'] := Integer(DM.LocalDatabase.Handle);
        FieldValues['CreatePCard'] := 1;
        FieldValues['AdminMode'] := DM.AdminMode;
        FieldValues['Modify'] := 1;
        FieldValues['ShowStyle'] := Sprav.Input['ShowStyle'];
        Post;
    end;
    PCardSp.Show;
    if (not PCardSp.Output.IsEmpty) then
    begin
        FIOEdit.Text := IntToStr(PCardSp.Output['TN']);
        FioFilterBox.Checked := True;
        WorkingBox.Checked := False;
        FilterBox.Value := Null;
        FilterBox.DisplayText := '';
        qFSC_TypePost.Value := Null;
        qFSC_TypePost.DisplayText := '';
        PCardSp.Free;
        DateFilter.OnClick(DateFilter);
        ModifyButton.OnClick(ModifyButton);
    end
    else PCardSp.Free;
end;

procedure TPCardsViewForm.SysInfoExecute(Sender: TObject);
begin
    ShowInfo(PCardTableView.DataController.DataSource.DataSet);
end;

procedure TPCardsViewForm.PCardTableViewKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if (Key = VK_Return) then PCardTableViewDblClick(Sender);

    if (Key = VK_F5) then RefreshButton.Click;
    if (Key = VK_INSERT) then AddButton.Click;
    if (Key = VK_F2) then ModifyButton.Click;

    if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift)
        and (ssCtrl in Shift) then
    try
        ShowMessage('Id_PCard: ' + IntToStr(DM.ResultQueryID_PCARD.Value));
        Clipboard.AsText := IntToStr(DM.ResultQueryID_PCARD.Value);
    except
    end;
end;

procedure TPCardsViewForm.qFSC_TypePostOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    form: TSpForm;
    PropParams: TSpParams;
begin
    PropParams := TSpParams.Create;
    with PropParams do
    begin
        Table := 'Sp_type_post';
        Title := 'Тип персоналу';
        IdField := 'Id_type_post';
        SpFields := 'Name_type_post';
        ColumnNames := 'Тип персоналу';
        SpMode := spmSelect;
    end;
    form := TSpForm.Create(Self);
    form.Init(PropParams);
    if (form.ShowModal = mrOk) then
    begin
        value := form.ResultQuery['Id_type_post'];
        DisplayText := form.ResultQuery['Name_type_post'];
    end;
    form.Free;
    PropParams.Free;
end;

procedure TPCardsViewForm.PCardTableViewCustomDrawCell(
    Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
    AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
    if not AViewInfo.Selected then
    begin
        if (AViewInfo.GridRecord.Values[IsWorkingColumn.Index] = 0) then
        begin
            ACanvas.Brush.Color := clSilver;
            ACanvas.Font.Style := [fsBold];
        end;
        if (AViewInfo.GridRecord.Values[IsWorkingColumn.Index] = 1) then
        begin
            ACanvas.Brush.Color := clAqua;
            ACanvas.Font.Style := [fsBold];
        end;
        if (AViewInfo.GridRecord.Values[IsWorkingColumn.Index] = 3) then
        begin
            ACanvas.Brush.Color := $00CCCCFF;
            ACanvas.Font.Style := [fsBold];
        end;
        if (AViewInfo.GridRecord.Values[IsWorkingColumn.Index] = 4) then
        begin
            ACanvas.Brush.Color := $00FFE0E0;
            ACanvas.Font.Style := [fsBold];
        end;
    end;
end;

procedure TPCardsViewForm.FioEditKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (key = VK_RETURN) then
        FilterActionExecute(Sender);
end;

procedure TPCardsViewForm.SetFilterActionExecute(Sender: TObject);
begin
    FioFilterBox.Checked := True;
    FioEdit.SetFocus;
end;

procedure TPCardsViewForm.DeleteActionExecute(Sender: TObject);
begin
    if (Dm.CheckAccess('/ROOT/PCardsList/PrivateCard', 'Del', True)) <> 0 then
    begin
        Exit;
    end;
    if Dm.ResultQuery.IsEmpty then Exit;

    if (not VarIsNull(DM.ResultQuery['Id_PCard'])) then
        if (MessageDlg('Ви справді бажаєте вилучити цю картку?', mtWarning, [mbYes, mbNo], 0) = mrYes) then
        try
            DM.WriteTransaction.StartTransaction;
            DM.pFIBQ_Delete.ParamByName('id_pcard').AsInteger := DM.ResultQuery['Id_PCard'];
            DM.pFIBQ_Delete.ExecProc;
            DM.WriteTransaction.Commit;
            RefreshButton.Click;
        except on e: Exception do
            begin
                DM.WriteTransaction.Rollback;
                MessageDlg('Не вдалося вилучити цю картку:' + #13 + e.Message, mtWarning, [mbYes, mbNo], 0)
            end;
        end;
end;

procedure TPCardsViewForm.RefreshButtonClick(Sender: TObject);
begin
    ApplyFilter;
end;

procedure TPCardsViewForm.SB_StajRecalcClick(Sender: TObject);
var
    PCardSp: TSprav;
begin
    if (Dm.CheckAccess('/ROOT/PCardsList/StajRecalc', 'DONE', True)) <> 0 then
    begin
        Exit;
    end;
    PCardSp := GetSprav('ASUP\StajRecalc');
    with PCardSp.Input do
    begin
        Append;
        FieldValues['DBHandle'] := Integer(DM.LocalDatabase.Handle);
        Post;
    end;
    PCardSp.Show;
    PCardSp.Free;
end;

procedure TPCardsViewForm.ProfkomButtonClick(Sender: TObject);
var
    PCardSp: TSprav;
begin
    if (Dm.CheckAccess('/ROOT/PCardsList/ProfkomCard', 'View', True)) <> 0 then
    begin
        Exit;
    end;
    PCardSp := GetSprav('ASUP\ProfkomCard');
    with PCardSp.Input do
    begin
        Append;
        FieldValues['Id_PCard'] := DM.ResultQuery['Id_PCard'];
        FieldValues['Actual_Date'] := CurDate.Value;
        FieldValues['DBHandle'] := Integer(DM.LocalDatabase.Handle);
        FieldValues['Modify'] := 1;
        FieldValues['FIO'] := DM.ResultQuery['FIO'];
        Post;
    end;
    PCardSp.Show;
    PCardSp.Free;
end;

procedure TPCardsViewForm.SB_RemindClick(Sender: TObject);
var
    PCardSp: TSprav;
begin
    if (Dm.CheckAccess('/ROOT/PCardsList/Reminder', 'DONE', True)) <> 0 then
    begin
        Exit;
    end;
    PCardSp := GetSprav('ASUP\Reminder');
    with PCardSp.Input do
    begin
        Append;
        FieldValues['DBHandle'] := Integer(DM.LocalDatabase.Handle);
        Post;
    end;
    PCardSp.Show;
    PCardSp.Free;
end;

procedure TPCardsViewForm.FocusActionExecute(Sender: TObject);
begin
    if FioEdit.Visible and FioEdit.CanFocus then FioEdit.SetFocus;
end;

procedure TPCardsViewForm.LevelOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
begin
    if qSelect(DM.LevelsSelect) then
        with DM do
        begin
            Value := LevelsSelect['Id_Level'];
            DisplayText := IntToStr(LevelsSelect['Level_Order']) + '. ' +
                LevelsSelect['Level_Name'];
        end;

end;

procedure TPCardsViewForm.FioFilterBoxKeyUp(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (Key = VK_Return) then PCardTableViewDblClick(Sender);

    if (Key = VK_F5) or ( Key = VK_F8) then RefreshButton.Click;
    if (Key = VK_INSERT) then AddButton.Click;
    if (Key = VK_F2) then ModifyButton.Click;
end;

procedure TPCardsViewForm.FilterBoxKeyUp(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (Key = VK_Return) then PCardTableViewDblClick(Sender);

    if (Key = VK_F5) or ( Key = VK_F8) then RefreshAction.Execute;
    if (Key = VK_INSERT) then InsertAction.Execute;
    if (Key = VK_F2) then ModifyAction.Execute;
    if (Key = VK_DELETE) then DeleteAction.Execute;
end;

procedure TPCardsViewForm.PCardTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
    if AFocusedRecord = nil then Exit;
    
    if (AFocusedRecord.Values[IsWorkingColumn.Index] = 0) then
        WorkTypeLabel.Caption := 'Статус: Не працює';
    if (AFocusedRecord.Values[IsWorkingColumn.Index] = 1) then
        WorkTypeLabel.Caption := 'Статус: Звільнено';
    if (AFocusedRecord.Values[IsWorkingColumn.Index] = 2) then
        WorkTypeLabel.Caption := 'Статус: Працює';
    if (AFocusedRecord.Values[IsWorkingColumn.Index] = 3) then
        WorkTypeLabel.Caption := 'Статус:  Строк роботи закінчився, але наказа немає';
    if (AFocusedRecord.Values[IsWorkingColumn.Index] = 4) then
        WorkTypeLabel.Caption := 'Статус: Погодинна сплата';
end;

procedure TPCardsViewForm.FioEditChange(Sender: TObject);
begin
    if FioEdit.Text <> '' then
        FioFilterBox.Checked := True
    else FioFilterBox.Checked := False;
end;

end.

