{ -$Id: ShtatRas.pas,v 1.16 2007/11/15 11:51:57 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }
{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                        Модуль "Штатное расписание"                           }
{                    Работа с плановым штатным расписанием                     }
{                                                  ответственный: Олег Волков  }

unit ShtatRas;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    ComCtrls, ToolWin, Db, IBCustomDataSet, IBQuery, DepartmentsViewUnit,
    PersonalCommon, StdCtrls, ExtCtrls, Grids, DBGrids, Buttons, AddShtatPost,
    EditControl, DBCtrls, SpFormUnit, ShtatSPZ, DepartmentsSearchUnit,
    ShtatPrint, SpCommon, Variants, FormPlanShtat, SpComboBox,
    uDepartmentsTree, NagScreenUnit, Clipbrd, uCommonSp;

type
    TShtatRasForm = class(TForm)
        DepartmentsQuery: TIBQuery;
        ShtatQuery: TIBQuery;
        ShtatSource: TDataSource;
        DepartmentsPanel: TPanel;
        PostsPanel: TPanel;
        ShtatGrid: TDBGrid;
        Splitter1: TSplitter;
        PostPanel: TPanel;
        SRSource: TDataSource;
        SRPanel: TPanel;
        GroupBox1: TGroupBox;
        SRLabel1: TLabel;
        ShtatQueryNAME_POST: TIBStringField;
        ShtatQueryNUM_ITEM: TIntegerField;
        ShtatQueryID_TAR_NET: TIntegerField;
        ShtatQueryNAME_TAR_NET: TIBStringField;
        ShtatQueryKOL_STAVOK: TIBBCDField;
        ShtatQueryMONEY: TIBBCDField;
        ShtatQueryID_SHTATRAS: TIntegerField;
        ShtatQueryID_POST: TIntegerField;
        ShtatQueryID_ORDER: TIntegerField;
        p: TIBStringField;
        ShtatQueryNUM_DIGIT: TIntegerField;
        ShtatQueryOKLAD: TIBBCDField;
        ShtatQueryDATE_BEG: TDateField;
        ShtatQueryDATE_END: TDateField;
        TarLabel: TLabel;
        TarDBText: TDBText;
        Label1: TLabel;
        DateBegDBText: TDBText;
        Label2: TLabel;
        DateEndDBText: TDBText;
        Label3: TLabel;
        OrderDBText: TDBText;
        Label4: TLabel;
        ItemDBText: TDBText;
        DeleteQuery: TIBQuery;
        DepartmentSearchQuery: TIBQuery;
        ShtatQueryID_PAY_FORM: TIntegerField;
        ShtatQueryID_WORK_COND: TIntegerField;
        Label5: TLabel;
        Label6: TLabel;
        PayFormDBText: TDBText;
        WorkCondDBText: TDBText;
        ShtatQueryNAME_PAY_FORM: TIBStringField;
        ShtatQueryNAME_WORK_COND: TIBStringField;
        ShtatPanel: TPanel;
        AddButton: TSpeedButton;
        ModifyButton: TSpeedButton;
        DeleteButton: TSpeedButton;
        OkButton: TSpeedButton;
        CancelButton: TSpeedButton;
        Panel1: TPanel;
        VacanciesBox: TCheckBox;
        Label7: TLabel;
        WorkModeDBText: TDBText;
        ShtatQueryID_WORK_MODE: TIntegerField;
        ShtatQueryNAME_WORK_MODE: TIBStringField;
        DeptLabel: TLabel;
        Panel2: TPanel;
        ShtatButton: TSpeedButton;
        ReportButton: TSpeedButton;
        RefreshButton: TSpeedButton;
        PlanLabel: TLabel;
        SRBox: TSpComboBox;
        SRQuery: TIBQuery;
        CheckDeleteQuery: TIBQuery;
        ShtatQueryCOMMENT: TIBStringField;
        Label8: TLabel;
        CommentDBText: TDBText;
        ShtatQueryDONT_SHOW_IN_PLAN: TIBStringField;
        ShtatQueryDONT_SHOW_IN_FACT: TIBStringField;
        ShowLabel: TLabel;
        ActualBox: TCheckBox;
        Label9: TLabel;
        CurTimePicker: TDateTimePicker;
        Label10: TLabel;
        ShtatQueryPREMIA: TIntegerField;
        ShtatQueryHARMFUL_HOLIDAY: TIntegerField;
        ShtatQuerySPECIAL_HOLIDAY: TIntegerField;
        BonusLabel: TLabel;
        AllLabel: TLabel;
        FilterBox: TComboBox;
        Label11: TLabel;
        ShtatQueryID_CATEGORY: TIntegerField;
        MoveButton: TSpeedButton;
        MoveQuery: TIBQuery;
        GetSRRoot: TIBQuery;
        DepartmentsTree: TfmDepartmentsTree;
        DepartmentsQueryID_DEPARTMENT: TIntegerField;
        DepartmentsQueryID_PARENT: TIntegerField;
        DepartmentsQueryNAME_SHORT: TIBStringField;
        DepartmentsQueryDISPLAY_ORDER: TIntegerField;
        DepartmentsQueryDISPLAY_ORDER2: TIntegerField;
        DepartmentsQueryNAME_FULL: TIBStringField;
        DepartmentsQueryDISPLAY_NAME: TStringField;
        ShtatQueryBONUS1: TIBBCDField;
        ShtatQueryBONUS2: TIBBCDField;
        ShtatQueryID_SPZ: TIntegerField;
        ShtatQueryDISPLAY_ORDER: TIntegerField;
        ShtatQueryBASED_ON: TIntegerField;
        ShtatQueryREAL_NUM_DIGIT: TIntegerField;
        ViewShtatButton: TSpeedButton;
        ShtatQueryNUM_IN_SMENA: TIntegerField;
        ShtatQueryCONTRACT: TIntegerField;
    GetSR: TIBQuery;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure FormResize(Sender: TObject);
        procedure DepartmentsTreeDblClick(Sender: TObject);
        procedure ShtatQueryNUM_DIGITGetText(Sender: TField; var Text: string;
            DisplayText: Boolean);
        procedure ShtatButtonClick(Sender: TObject);
        procedure AddButtonClick(Sender: TObject);
        procedure Splitter1Moved(Sender: TObject);
        procedure ModifyButtonClick(Sender: TObject);
        procedure ShtatQueryNAME_TAR_NETGetText(Sender: TField;
            var Text: string; DisplayText: Boolean);
        procedure ShtatQueryDATE_BEGGetText(Sender: TField; var Text: string;
            DisplayText: Boolean);
        procedure ShtatQueryDATE_ENDGetText(Sender: TField; var Text: string;
            DisplayText: Boolean);
        procedure pGetText(Sender: TField; var Text: string;
            DisplayText: Boolean);
        procedure ShtatQueryNUM_ITEMGetText(Sender: TField; var Text: string;
            DisplayText: Boolean);
        procedure DeleteButtonClick(Sender: TObject);
        procedure SPZButtonClick(Sender: TObject);
        procedure ReportButtonClick(Sender: TObject);
        procedure ShtatGridDblClick(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure VacanciesBoxClick(Sender: TObject);
        procedure VacanciesBoxEnter(Sender: TObject);
        procedure DepartmentsQueryAfterScroll(DataSet: TDataSet);
        procedure DepartmentsTreeKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure RefreshButtonClick(Sender: TObject);
        procedure ShtatGridKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure SRBoxChange(Sender: TObject);
        procedure ShtatQueryAfterScroll(DataSet: TDataSet);
        procedure ShtatGridDrawColumnCell(Sender: TObject; const Rect: TRect;
            DataCol: Integer; Column: TColumn; State: TGridDrawState);
        procedure ActualBoxClick(Sender: TObject);
        procedure CurTimePickerChange(Sender: TObject);
        procedure ShtatQueryFilterRecord(DataSet: TDataSet;
            var Accept: Boolean);
        procedure MoveButtonClick(Sender: TObject);
        procedure DepartmentsQueryCalcFields(DataSet: TDataSet);
        procedure DepartmentsTreeTreeListDblClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure ViewShtatButtonClick(Sender: TObject);
        procedure ShtatQueryMONEYGetText(Sender: TField; var Text: string;
            DisplayText: Boolean);
    private
        Mode: TSpMode;
        Id_Order: Integer;
        Num_Item: Integer;
        Vacancies: Boolean;
        Id_SR: Integer;
        Actual: Boolean;
        Cur_Time: TDateTime;

        Bonus1_Abbr: string;
        Bonus2_Abbr: string;

        Move_Department: Integer;
        SRRoot: Integer;

        TraceComboChanges: Boolean;

        procedure ShowChangeForm(Mode: TEditMode);
        procedure Refresh;
        procedure VacanciesChange(v: Boolean);
    public
        constructor Create(AOwner: TComponent; Mode: TSpMode;
            Id_Order: Integer; Num_Item: Integer; Vacancies: Boolean;
            Cur_Time: TDateTime; Plan: Boolean = False); reintroduce;
    end;

var
    ShtatRasForm: TShtatRasForm;

implementation


{$R *.DFM}

constructor TShtatRasForm.Create(AOwner: TComponent; Mode: TSpMode;
    Id_Order: Integer; Num_Item: Integer; Vacancies: Boolean;
    Cur_Time: TDateTime; Plan: Boolean = False);
var
    NagScreen: TNagScreen;
begin
    NagScreen := TNagScreen.Create(self);
    NagScreen.Show;
    NagScreen.SetStatusText('Відкривається штатний розклад...');

    inherited Create(AOwner);

    Self.Mode := Mode;
    Self.Id_Order := Id_Order;
    Self.Num_Item := Num_Item;
    Self.Vacancies := Vacancies;

    DepartmentsQuery.Transaction := PersonalCommon.ReadTransaction;
    ShtatQuery.Transaction := PersonalCommon.ReadTransaction;
    DeleteQuery.Transaction := PersonalCommon.WriteTransaction;
    DepartmentSearchQuery.Transaction := PersonalCommon.ReadTransaction;
    CheckDeleteQuery.Transaction := ReadTransaction;
    SRQuery.Transaction := ReadTransaction;
    GetSRRoot.Transaction := ReadTransaction;

    Self.Cur_Time := Cur_Time;
    CurTimePicker.DateTime := Cur_Time;
    ShtatQuery.Params.ParamValues['Cur_Time'] := Cur_Time;
    ShtatQuery.Params.ParamValues['Vacancies'] := Vacancies;

    Id_SR := Curr_SR;
    TraceComboChanges := True;
    SRBox.Prepare(Id_SR);

    VacanciesChange(Vacancies);
    VacanciesBox.Checked := Vacancies;

    AddButton.Align := alLeft;
    ModifyButton.Align := alLeft;
    DeleteButton.Align := alLeft;
    ViewShtatButton.Align := alLeft;

    CancelButton.Align := alRight;
    OkButton.Align := alRight;

    AddButton.Visible := spfAdd in Mode;
    ModifyButton.Visible := spfModify in Mode;
    DeleteButton.Visible := spfDelete in Mode;
    OkButton.Visible := spfSelect in Mode;
    MoveButton.Visible := spfModify in Mode;

    if VarIsNull(Consts_Query['Bonus1_Abbr']) then
        Bonus1_Abbr := ''
    else
        Bonus1_Abbr := Trim(Consts_Query['Bonus1_Abbr']);

    if VarIsNull(Consts_Query['Bonus2_Abbr']) then
        Bonus2_Abbr := ''
    else
        Bonus2_Abbr := Trim(Consts_Query['Bonus2_Abbr']);

    if spfSelect in Mode then
    begin
        CurTimePicker.Enabled := False;

        GetSR.Transaction := ReadTransaction;
        GetSR.Close;
        GetSR.Params.ParamValues['Cur_Date'] := CurTimePicker.Date;
        GetSR.Open;

        if not GetSR.IsEmpty then SRBOx.Prepare(GetSR['Id_SR']);
    end;

    Resize;

    Actual := True;
    NagScreen.Free;
end;

procedure TShtatRasForm.VacanciesChange(v: Boolean);
begin
    Vacancies := v;

    if ShtatQuery.Active then
    begin
        ShtatQuery.Close;
        if Vacancies then
            ShtatQuery.Params.ParamValues['Vacancies'] := 1
        else
            ShtatQuery.Params.ParamValues['Vacancies'] := 0;
        ShtatQuery.Open;
        GridResize(ShtatGrid);
    end;

    if Vacancies then
        if spfAdd in Mode then
            Caption := 'Вакансії штатного розкладу: редагування'
        else
            Caption := 'Вакансії штатного розкладу: перегляд'
    else
        if spfAdd in Mode then
            Caption := 'Штатний розклад: редагування'
        else
            Caption := 'Штатний розклад: перегляд';
end;

procedure TShtatRasForm.ShowChangeForm(Mode: TEditMode);
var
    id: Integer;
    form: TAddShtatPostForm;
begin
    if (Mode = emModify) and (ShtatQuery.IsEmpty) then Exit;
    if VarIsEmpty(ShtatQuery.Params.ParamValues['Id_Department']) then
    begin
        MessageDlg('Потрібно відкрити штат підрозділу', mtError, [mbOk], 0);
        Exit;
    end;

    if Mode <> emNew then
        id := ShtatQuery['Id_ShtatRas']
    else
        id := -1;

    form := TAddShtatPostForm.Create(Self, Mode, Id_SR,
        ShtatQuery.Params.ParamValues['Id_Department'], id,
        Id_Order, Num_Item,
        SRQuery['Date_Beg'], SRQuery['Date_End'], Cur_Time,
        SRQuery['Id_Tar_Plan']);
    form.Caption := form.Caption + ' - підрозділ ' +
        DepartmentsQuery['Name_Short'];

    if form.ShowModal = mrOk then
    begin
        Refresh;
        ShtatQuery.Locate('Id_ShtatRas', form.Id_ShtatRas, []);
    end;
    form.Free;
end;

procedure TShtatRasForm.Refresh;
var
    all: Double;
begin
    ShtatQuery.Params.ParamValues['Cur_Time'] := Cur_Time;
    if ShtatQuery.Active then
        QueryRefresh(ShtatQuery)
    else
        ShtatQuery.Open;
    all := 0;
    ShtatQuery.DisableControls;
    with ShtatQuery do
    begin
        First;
        while not Eof do
        begin
            all := all + ShtatQuery['Kol_Stavok'];
            Next;
        end;
        First;
    end;
    ShtatQuery.EnableControls;
    AllLabel.Caption := 'Усього робітників: ' + FloatToStr(all);
    GridResize(ShtatGrid);
end;

procedure TShtatRasForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    SRBox.SaveIntoRegistry;
    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TShtatRasForm.FormResize(Sender: TObject);
begin
    GridResize(ShtatGrid);
end;

procedure TShtatRasForm.DepartmentsTreeDblClick(Sender: TObject);
begin
    ShtatButton.Click;
end;

procedure TShtatRasForm.ShtatQueryNUM_DIGITGetText(Sender: TField;
    var Text: string; DisplayText: Boolean);
begin
    if ShtatQuery.IsEmpty then
        Text := ''
    else
        if ShtatQuery['Id_Tar_Net'] = 0 then
            Text := 'оклад'
        else
            if ShtatQuery['Num_Digit'] = -1 then
                Text := ''
            else
                Text := IntToStr(ShtatQuery['Num_Digit']);
end;

procedure TShtatRasForm.ShtatButtonClick(Sender: TObject);
var
    dep: Integer;
begin
    dep := DepartmentsQuery['Id_Department'];
    if dep = -1 then Exit;
    DepartmentsQuery.Locate('Id_Department', dep, []);
    ShtatQuery.Close;
    ShtatQuery.Params.ParamValues['Id_Department'] := dep;
    Refresh;
    ShtatGrid.SetFocus;
    DeptLabel.Caption :=
        'Штат підрозділу «' + DepartmentsQuery['Name_Short'] + '»';
end;

procedure TShtatRasForm.AddButtonClick(Sender: TObject);
begin
    if spfAdd in Mode then ShowChangeForm(emNew);
end;

procedure TShtatRasForm.ModifyButtonClick(Sender: TObject);
begin
    if spfModify in Mode then ShowChangeForm(emModify);
end;

procedure TShtatRasForm.Splitter1Moved(Sender: TObject);
begin
    GridResize(ShtatGrid);
end;


procedure TShtatRasForm.ShtatQueryNAME_TAR_NETGetText(Sender: TField;
    var Text: string; DisplayText: Boolean);
begin
    if ShtatQuery.IsEmpty then
        Text := ''
    else
        if ShtatQuery['Name_Tar_Net'] = '' then
            Text := 'нема'
        else
            Text := ShtatQuery['Name_Tar_Net'];
end;

procedure TShtatRasForm.ShtatQueryDATE_BEGGetText(Sender: TField;
    var Text: string; DisplayText: Boolean);
begin
    if ShtatQuery.IsEmpty then
        Text := ''
    else
        Text := DateToStr(ShtatQuery['Date_Beg']);
end;

procedure TShtatRasForm.ShtatQueryDATE_ENDGetText(Sender: TField;
    var Text: string; DisplayText: Boolean);
begin
    if ShtatQuery.IsEmpty then
        Text := ''
    else
        Text := DateToStr(ShtatQuery['Date_End']);
end;

procedure TShtatRasForm.pGetText(Sender: TField;
    var Text: string; DisplayText: Boolean);
begin
    if ShtatQuery.IsEmpty or VarIsNull(ShtatQuery['Num_Order']) then
        Text := ''
    else
        Text := ShtatQuery['Num_Order'];
end;

procedure TShtatRasForm.ShtatQueryNUM_ITEMGetText(Sender: TField;
    var Text: string; DisplayText: Boolean);
begin
    if ShtatQuery.IsEmpty then
        Text := ''
    else
        Text := IntToStr(ShtatQuery['Num_Item']);
end;

procedure TShtatRasForm.DeleteButtonClick(Sender: TObject);
var
    s: string;
begin
    if not (spfDelete in Mode) then Exit;
    if ShtatQuery.IsEmpty then Exit;
    if MessageDlg('Чи справді ви бажаєте вилучити цю посаду?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
        CheckDeleteQuery.Close;
        CheckDeleteQuery.Params.ParamValues['Id_ShtatRas'] :=
            ShtatQuery['Id_ShtatRas'];
        CheckDeleteQuery.Open;

        s := '';
        with CheckDeleteQuery do
        begin
            First;
            while not Eof do
            begin
                s := s + CheckDeleteQuery['FIO'] + #13#10;
                Next;
            end;
        end;

        if s <> '' then
            if MessageDlg('На цій посаді вже працють:'#13#10 + s +
                'Ви справді бажаєте вилучити цю посаду?',
                mtConfirmation, [mbYes, mbNo], 0) = mrNo
                then Exit;

        DeleteQuery.Params.ParamValues['Id_ShtatRas'] :=
            ShtatQuery['Id_ShtatRas'];

        ExecQuery(DeleteQuery);
        Refresh;
    end;
end;

procedure TShtatRasForm.SPZButtonClick(Sender: TObject);
var
    info: string;
    form: TShtatSPZForm;
begin
    if not (spfExt in Mode) then Exit;
    if ShtatQuery.IsEmpty then Exit;

    info := 'Посада "' + ShtatQuery['Name_Post'] + '", ';
    if ShtatQuery['Id_Tar_Net'] = 0 then
        info := info + 'оклад ' + FloatToStr(ShtatQuery['Oklad'])
    else
        info := info + IntToStr(ShtatQuery['Num_Digit']) + ' розряд' +
            ' тарифної сітки "' + ShtatQuery['Name_Tar_Net'] + '"';

    form := TShtatSPZForm.Create(Self, ShtatQuery['Id_ShtatRas'], info,
        ShtatQuery['Kol_Stavok']);
    form.ShowModal;
    form.Free;
end;

procedure TShtatRasForm.ReportButtonClick(Sender: TObject);
var
    form: TShtatPrintForm;
    sp: TSprav;
begin
    if Version = 1 then
    begin
        form := TShtatPrintForm.Create(Self);
        form.Department := DepartmentsQuery['Id_Department'];
        form.SetSR(Id_SR);
        form.ShowModal;
        form.Prepare(Cur_Time, Cur_Time, Cur_Time);
        form.Free;
    end
    else
    begin
        sp := GetSprav('ASUP\ShtatPrint_v2');
        if sp <> nil then
        begin
            with sp.Input do
            begin
                Append;
                FieldValues['DBHandle'] := Integer(Database.Handle);
                FieldValues['Id_Department'] := DepartmentsQuery['Id_Department'];
                FieldValues['Id_SR'] := Id_SR;
                FieldValues['Actual_Date'] := Cur_Time;
                FieldValues['DesignReport'] := sDesignReport;
                Post;
            end;

            sp.Show;
            sp.Free;
        end;
    end;
end;

procedure TShtatRasForm.ShtatGridDblClick(Sender: TObject);
begin
    if spfSelect in Mode then
        OkButton.Click
    else
        ModifyButton.Click;
end;

procedure TShtatRasForm.CancelButtonClick(Sender: TObject);
begin
    ModalResult := mrCancel;
    if FormStyle = fsMDIChild then Close;
end;

procedure TShtatRasForm.OkButtonClick(Sender: TObject);
begin
    if ShtatQuery.IsEmpty then
    begin
        MessageDlg('Неможливо вибрати запис, бо штат пустий!',
            mtError, [mbOk], 0);
        Exit;
    end
    else
    if not CurTimePicker.Enabled and
        ( ( CurTimePicker.Date < ShtatQuery['Date_Beg']   ) or
            ( CurTimePicker.Date > ShtatQuery['Date_End'] ) ) then
    begin
        MessageDlg('Дата, на яку отримуються дані не належить періоду посади (можливо, вибрано не той документ штатного розкладу?)',
            mtError, [mbOk], 0);
        Exit;
    end
    else
        ModalResult := mrOk;

    if FormStyle = fsMDIChild then Close;
end;

procedure TShtatRasForm.VacanciesBoxClick(Sender: TObject);
begin
    if VacanciesBox.Checked <> Vacancies then
        VacanciesChange(VacanciesBox.Checked);
end;

procedure TShtatRasForm.VacanciesBoxEnter(Sender: TObject);
begin
    if spfCantRemoveFilter in Mode then ShtatGrid.SetFocus;
end;

procedure TShtatRasForm.DepartmentsQueryAfterScroll(DataSet: TDataSet);
begin
    ShtatQuery.Close;
    DepartmentsQueryCalcFields(DataSet);
end;

procedure TShtatRasForm.DepartmentsTreeKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if Key = VK_RETURN then ShtatButton.Click;

    if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift)
        and (ssCtrl in Shift) then
    try
        ShowMessage('Id_Department: ' + IntToStr(DepartmentsQuery['Id_Department']));
    except
    end;
end;

procedure TShtatRasForm.RefreshButtonClick(Sender: TObject);
var
    i: Integer;
begin
    i := DepartmentsQuery['Id_Department'];
    DepartmentsTree.Refresh;
    DepartmentsQuery.Locate('Id_Department', i, []);
    Refresh;
end;

procedure TShtatRasForm.ShtatGridKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (Key = VK_RETURN) and (spfSelect in Mode) then OkButton.Click;

    if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift)
        and (ssCtrl in Shift) then
    try
        Clipboard.AsText := IntToStr(ShtatQuery['Id_ShtatRas']);
        ShowMessage('Id_ShtatRas: ' + IntToStr(ShtatQuery['Id_ShtatRas']));
    except
    end;
end;

procedure TShtatRasForm.SRBoxChange(Sender: TObject);
var
    expNode: Integer;
begin
    if not TraceComboChanges then Exit;

    if SRQuery.Transaction <> nil then
    begin
        Id_SR := SRBox.GetId;

        SRQuery.Close;
        SRQuery.Params.ParamValues['Id_SR'] := Id_SR;
        SRQuery.Open;

            // получить корневое подразделение и текущее подразделение
        if SRQuery['Is_GLOBAL'] = 'T' then
        begin
            expNode := Consts_Query['Local_Department'];
            SRRoot := Consts_Query['Current_Department'];
        end
        else
        begin
            GetSRRoot.Close;
            GetSRRoot.Params.ParamValues['Id_SR'] := Id_SR;
            GetSRRoot.Open;

            SRRoot := GetSRRoot['Root'];
            expNode := SRRoot;
        end;

            // построить дерево :) окрыть нужный узел
        DepartmentsQuery.Close;
        DepartmentsQuery.Params.ParamValues['Root'] := SRRoot;
        DepartmentsQuery.Params.ParamValues['Actual_Date'] := CurTimePicker.Date;

        DepartmentsTree.Prepare(DepartmentsQuery);
        DepartmentsQuery.Locate('Id_Department', expNode, []);
        DepartmentsTree.TreeList.FocusedNode.Expand(False);

           // подготовить запросы
        ShtatQuery.Close;
        ShtatQuery.Params.ParamValues['Id_SR'] := Id_SR;
    end;
end;

procedure TShtatRasForm.ShtatQueryAfterScroll(DataSet: TDataSet);
begin
    if ShtatQuery.IsEmpty then Exit;

    if ShtatQuery['Dont_Show_In_Plan'] = 'T' then
        ShowLabel.Caption := 'Посада по факту'
    else
        if ShtatQuery['Dont_Show_In_Fact'] = 'T' then
            ShowLabel.Caption := 'Нормативна посада'
        else
            ShowLabel.Caption := '';

    BonusLabel.Caption := '';
    if not VarIsNull(ShtatQuery['Bonus1']) then
        BonusLabel.Caption := BonusLabel.Caption + FloatToStr(ShtatQuery['Bonus1'])
            + '% ' + Bonus1_Abbr;

    if not VarIsNull(ShtatQuery['Bonus2']) then
        BonusLabel.Caption := BonusLabel.Caption + ' ' +
            FloatToStr(ShtatQuery['Bonus2']) + '% ' + Bonus2_Abbr;
end;

procedure TShtatRasForm.ShtatGridDrawColumnCell(Sender: TObject;
    const Rect: TRect; DataCol: Integer; Column: TColumn;
    State: TGridDrawState);
begin
    with ShtatGrid.Canvas.Brush do
        if gdSelected in State then
            Color := clBlack
        else
            if ShtatQuery['Dont_Show_In_Plan'] = 'T' then
                Color := clYellow
            else
                if ShtatQuery['Dont_Show_In_Fact'] = 'T' then
                    Color := clSkyBlue
                else
                    if ShtatQuery['Date_End'] < Cur_Time then
                        Color := clSilver
                    else
                        Color := clInfoBk;
    ShtatGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TShtatRasForm.ActualBoxClick(Sender: TObject);
var
    actualSQL: string;
    p: Integer;
begin
    if Version = 1 then actualSQL := 'WHERE Date_End > :Cur_Time'
    else actualSQL := 'WHERE :Cur_Time BETWEEN Date_Beg AND Date_End';

    if ActualBox.Checked and not Actual then
    begin
        ShtatQuery.SQL.Text := ShtatQuery.SQL.Text + #13#10 + actualSQL;
        Actual := True;
        Refresh;
    end;

    if not ActualBox.Checked and Actual then
    begin
        p := Pos(actualSQL, ShtatQuery.SQL.Text);
        ShtatQuery.SQL.Text := Copy(ShtatQuery.SQL.Text, 1, p - 1);
        Actual := False;
        Refresh;
    end;
end;

procedure TShtatRasForm.CurTimePickerChange(Sender: TObject);
var
    id_dept: Integer;
begin
    Cur_Time := CurTimePicker.DateTime;

    id_dept := DepartmentsQuery['Id_Department'];
    DepartmentsQuery.Close;
    DepartmentsQuery.Params.ParamValues['Actual_Date'] := CurTimePicker.Date;
    DepartmentsTree.Refresh;
    DepartmentsQuery.Locate('Id_Department', id_dept, []);

    ShtatQuery.Close;
    ShtatQuery.Params.ParamValues['Cur_Time'] := Cur_Time;
    Refresh;
end;

procedure TShtatRasForm.ShtatQueryFilterRecord(DataSet: TDataSet;
    var Accept: Boolean);
begin
 {   if FilterBox.ItemIndex = 0 then Accept := True;
    if FilterBox.ItemIndex = 1 then
        if ShtatQuery['Id_Category'] = 19 then  Accept := True;
    if FilterBox.ItemIndex = 2 then
        if ShtatQuery['Id_Category'] <> 19 then  Accept := True;}
end;

procedure TShtatRasForm.MoveButtonClick(Sender: TObject);
var
    form: TDepartmentsViewForm;
begin
    if ShtatQuery.IsEmpty then Exit;

    if MessageDlg('Бажаєте перемістити цю посаду у інший підрозділ?',
        mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;

    form := TDepartmentsViewForm.Create(Self);
    form.Prepare(True, Cur_Time);
    form.CanSelectRoot := True;
    form.ResultQuery.Locate('Id_Department', Move_Department, []);
    if form.ShowModal = mrOk then
        Move_Department := form.Selected_Id;
    form.Free;

    MoveQuery.Transaction := ReadTransaction;
    MoveQuery.SQL.Text := 'EXECUTE PROCEDURE MOVE_SHTAT ' +
        IntToStr(ShtatQuery['Id_ShtatRas']) + ',' + IntToStr(Move_Department);
    ExecQuery(MoveQuery);
    Refresh;
end;

procedure TShtatRasForm.DepartmentsQueryCalcFields(DataSet: TDataSet);
begin
    if DepartmentsQuery.IsEmpty then Exit;

    if Trim(DepartmentsQuery['Name_Short']) = '' then
        DepartmentsQuery['Display_Name'] := DepartmentsQuery['Name_Full']
    else
        DepartmentsQuery['Display_Name'] := DepartmentsQuery['Name_Full'] +
            '(' + DepartmentsQuery['Name_Short'] + ')';
end;

procedure TShtatRasForm.DepartmentsTreeTreeListDblClick(Sender: TObject);
begin
    ShtatButton.Click;
end;

procedure TShtatRasForm.FormCreate(Sender: TObject);
var
    actualSQL: string;
begin
    if Version = 1 then actualSQL := 'WHERE Date_End > :Cur_Time'
    else actualSQL := 'WHERE :Cur_Time BETWEEN Date_Beg AND Date_End';

    ShtatQuery.SQL.Text := ShtatQuery.SQL.Text + #13#10 + actualSQL;
end;

procedure TShtatRasForm.ViewShtatButtonClick(Sender: TObject);
begin
    ShowChangeForm(emView);
end;

procedure TShtatRasForm.ShtatQueryMONEYGetText(Sender: TField;
    var Text: string; DisplayText: Boolean);
begin
    if not ShtatQuery.IsEmpty then
        if ShtatQuery['Contract'] = 1 then Text := 'Контракт'
        else Text := FormatFloat(',########.00', ShtatQuery['Money']);
end;

end.

