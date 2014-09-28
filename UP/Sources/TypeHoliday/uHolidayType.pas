Unit uHolidayType;

Interface

Uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uSpravControl, uCommonSp, FIBDatabase, pFIBDatabase, Ibase,
    cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
    cxEdit, DB, cxDBData, cxGridLevel, cxControls, cxGridCustomView,
    cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
    ExtCtrls, cxClasses, dxBar, dxBarExtItems, FIBDataSet, pFIBDataSet,
    FIBQuery, pFIBQuery, pFIBStoredProc, ComCtrls, RxMemDS, cxTL,
    cxCurrencyEdit, cxMaskEdit, cxInplaceContainer, cxDBTL, cxTLData,
    cxTextEdit, cxContainer, cxCheckBox, AccMgmt;

Type
    TfrmHolidayType = Class(TForm)
        Database: TpFIBDatabase;
        ReadTransaction: TpFIBTransaction;
        WriteTransaction: TpFIBTransaction;
        dxBarManager1: TdxBarManager;
        btnAdd: TdxBarLargeButton;
        btnEdit: TdxBarLargeButton;
        btnDelete: TdxBarLargeButton;
        btnView: TdxBarLargeButton;
        btnClose: TdxBarLargeButton;
        btnSelect: TdxBarLargeButton;
        DataSet: TpFIBDataSet;
        DataSource1: TDataSource;
        StoredProc: TpFIBStoredProc;
        StatusBar1: TStatusBar;
        btnRefresh: TdxBarLargeButton;
        cxDBTreeList1: TcxDBTreeList;
        cxDBTreeList1ID_TYPE_HOLIDAY: TcxDBTreeListColumn;
        cxDBTreeList1FULL_NAME: TcxDBTreeListColumn;
        cxDBTreeList1SHORT_NAME: TcxDBTreeListColumn;
        cxDBTreeList1COMMENT: TcxDBTreeListColumn;
        cxDBTreeList1ID_PARENT: TcxDBTreeListColumn;
        cxDBTreeList1MIN_WORKED_DAYS: TcxDBTreeListColumn;
        cxDBTreeList1CHECK_PLAN_WITH_FACT: TcxDBTreeListColumn;
        cxDBTreeList1IS_ACTIVE: TcxDBTreeListColumn;
        cxDBTreeList1MAX_DAY_COUNT: TcxDBTreeListColumn;
        cxDBTreeList1CALC_WITH_HOLIDAYS: TcxDBTreeListColumn;
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
        ContentError: TcxStyle;
        qizzStyle: TcxGridTableViewStyleSheet;
        cxDBTreeList1DEFAULT_TERM: TcxDBTreeListColumn;
        cxDBTreeList1IS_PAY_UKR: TcxDBTreeListColumn;
        cxDBTreeList1SHORT_VIHOD: TcxDBTreeListColumn;
        Panel1: TPanel;
        Panel2: TPanel;
        IsOldCheck: TcxCheckBox;
        Procedure btnCloseClick(Sender: TObject);
        Procedure btnAddClick(Sender: TObject);
        Procedure btnEditClick(Sender: TObject);
        Procedure btnDeleteClick(Sender: TObject);
        Procedure btnSelectClick(Sender: TObject);
        Procedure FormShow(Sender: TObject);
        Procedure btnRefreshClick(Sender: TObject);
        //procedure IsOldDataSet(Flag:Boolean);
        Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
        Procedure cxDBTreeList1KeyDown(Sender: TObject; Var Key: Word;
            Shift: TShiftState);
        Procedure IsOldCheckPropertiesChange(Sender: TObject);
        Procedure FormCreate(Sender: TObject);
    private
    public
        Output: TrxMemoryData;
        {--константы для работы с группами отпусков}
        UseGroupHoliday: Boolean; //Используются ли на объекте группы отпусков
        IdGroupAnnualHoliday: Integer; //Идентификатор группы, соответствующей ежегодным отпускам
        {--}
        Constructor Create(AOwner: TComponent; DBHandle: TISC_DB_HANDLE; outp: TRxMemoryData); reintroduce;
        Procedure SelectAll;
    End;

    TUP_HolidayTarifType = Class(TSprav)
    public
        frm: TfrmHolidayType;
        Constructor Create;
        Procedure Show; override;
    End;

Function CreateSprav: TSprav; stdcall;
Exports CreateSprav;

Implementation
Uses uHolidayTypeAdd, uFControl, UpKernelUnit, BaseTypes, uUnivSprav;

{$R *.dfm}

{procedure TfrmHolidayType.IsOldDataSet(Flag:Boolean);
var id:Integer;
begin
   id := -1;
   if DataSet.RecordCount <> 0 then id := DataSet['ID_TYPE_HOLIDAY'];
   if Flag=False then
   begin
      DataSet.Close;
      DataSet.SQLs.SelectSQL.Clear;
      DataSet.SQLs.SelectSQL.Text:='select * from HL_SP_TYPE_HOLIDAY_S where is_old=0';
      DataSet.Open;
   end
   else
   begin
      DataSet.Close;
      DataSet.SQLs.SelectSQL.Clear;
      DataSet.SQLs.SelectSQL.Text:='select * from HL_SP_TYPE_HOLIDAY_S';
      DataSet.Open;
   end;
   SelectAll;
   if id <> -1 then DataSet.Locate('ID_TYPE_HOLIDAY', id, []);
   //cxDBTreeList1.OptionsView.RestoreDefaults;
end;  }

Function CreateSprav: TSprav;
Begin
    Result := TUP_HolidayTarifType.Create;
End;

Constructor TUP_HolidayTarifType.Create;
Begin
    Inherited Create;
    //  Input.FieldDefs.Add('DBHandle', ftInteger);
    Input.FieldDefs.Add('FormStyle', ftInteger);
    Output.FieldDefs.Add('ID_TYPE_HOLIDAY', ftInteger);
    Output.FieldDefs.Add('FULL_NAME', ftString, 4096);
    PrepareMemoryDatasets;
End;

Procedure TUP_HolidayTarifType.Show;
Begin
    frm := TfrmHolidayType.Create(Application.MainForm, TISC_DB_HANDLE(integer(Input['DBHandle'])), Output);
    If Not VarIsNull(Input['FormStyle']) Then
        frm.FormStyle := Input['FormStyle'];
    If frm.FormStyle = fsNormal Then
    Begin
        frm.btnSelect.Visible := ivAlways;
        frm.ShowModal;
        frm.Free;
    End;
End;

{ TfrmHolidayType }

Constructor TfrmHolidayType.Create(AOwner: TComponent; DBHandle: TISC_DB_HANDLE; outp: TRxMemoryData);
Var
    ConstsDS: tpFIBDataset;
Begin
    Inherited Create(AOwner);
    Output := outp;
    Database.Handle := DBHandle;

    ConstsDS := tpFIBDataset.Create(Self);
    ConstsDS.Database := Database;
    ConstsDS.Transaction := ReadTransaction;
    If ConstsDS.Active Then
        ConstsDS.Close;
    ConstsDS.SQLs.SelectSQL.Text := 'SELECT ID_GROUP_ANNUAL_HOLIDAY, USE_GROUP_HOLIDAY FROM UP_SYS_INI_CONSTS';
    ConstsDS.Open;

    UseGroupHoliday := (ConstsDS['USE_GROUP_HOLIDAY'] = 1);
    IdGroupAnnualHoliday := ConstsDS['ID_GROUP_ANNUAL_HOLIDAY'];

    ConstsDS.Close;
    ConstsDS.Free;

    //if cxDBTreeList1.FocusedNode<>nil
      //      then
   // cxDBTreeList1.FocusedNode.Expand(true);
  {if (KEY=VK_LEFT) then
     begin
        if cxDBTreeList2.FocusedNode<>nil
            then cxDBTreeList2.FocusedNode.Collapse(true);
     end;
     if (KEY=VK_RIGHT) then
     begin
        if cxDBTreeList2.FocusedNode<>nil
            then cxDBTreeList2.FocusedNode.Expand(false);
     end;   }
End;

Procedure TfrmHolidayType.btnCloseClick(Sender: TObject);
Begin
    Close;
End;

Procedure TfrmHolidayType.btnAddClick(Sender: TObject);
Var
    frm: TfrmHolidayTypeAdd;
    id, i, Ch: integer;
    id_parent: variant;
    AllPropQuery: TpFibDataSet;
    HolPropQuery: TpFibDataSet;
    WorkQuery: TpFIBStoredProc;
Begin
    frm := TfrmHolidayTypeAdd.Create(Self);
    frm.Caption := 'Додати ' + frm.Caption;
    id_parent := null;


    {  frm.DSetGroupHoliday.Database := Database;
      frm.DSetGroupHoliday.Transaction := ReadTransaction;}

    frm.DSetGroupHoliday.Close;
    frm.DSetGroupHoliday.SelectSQL.Text := 'SELECT ID_GROUP_HOLIDAY, NAME_GROUP FROM HL_SP_GROUP_HOLIDAY';
    frm.DSetGroupHoliday.Open;

    frm.GroupComboBox.Properties.ListSource := frm.DSGroupHoliday;

    If UseGroupHoliday Then
        frm.GroupComboBox.Enabled := True
    Else
    Begin
        frm.GroupComboBox.Enabled := False;
        frm.GroupComboBox.EditValue := IdGroupAnnualHoliday;
    End;

    AllPropQuery := TpFibDataSet.Create(self);
    AllPropQuery.Database := Database;
    AllPropQuery.Transaction := ReadTransaction;
    AllPropQuery.Close;
    AllPropQuery.SelectSQL.Text := 'SELECT Id_Prop,Name_Prop FROM INI_HOLIDAY_PROP';
    HolPropQuery := TpFibDataSet.Create(self);
    HolPropQuery.Database := Database;
    HolPropQuery.Transaction := ReadTransaction;
    HolPropQuery.SelectSQL.Text := 'SELECT DISTINCT S.Id_Prop,S.Name_Prop FROM Ini_Holiday_Prop S';
    frm.HolidayPropList.Clear;
    With AllPropQuery Do
    Begin
        Close;
        Open;
        First;
        While Not Eof Do
        Begin
            frm.HolidayPropList.Items.Add.Text := FieldValues['Name_Prop'];
            Next;
        End;
    End;
    //HolPropQuery.Params.ParamByName('id_holiday').Value := Dataset['ID_TYPE_HOLIDAY'];
    HolPropQuery.Close;
    HolPropQuery.Open;
    For i := 0 To frm.HolidayPropList.Items.Count - 1 Do
        frm.HolidayPropList.Items[i].Checked := False;


    If DataSet.RecordCount <> 0 Then
        id_parent := DataSet['ID_TYPE_HOLIDAY'];
    If frm.ShowModal = mrOk Then
    Begin
        StoredProc.Transaction.StartTransaction;
        StoredProc.StoredProcName := 'HL_SP_TYPE_HOLIDAY_I';
        StoredProc.Prepare;
        If frm.ParentCheck.Checked = true Then
            id_parent := null;
        StoredProc.ParamByName('FULL_NAME').Value := frm.NameEdit.Value;
        StoredProc.ParamByName('SHORT_NAME').Value := frm.ShortNameEdit.Value;
        StoredProc.ParamByName('COMMENT').Value := frm.NoteEdit.Text;
        StoredProc.ParamByName('ID_PARENT').Value := id_parent;
        StoredProc.ParamByName('MIN_WORKED_DAYS').Value := frm.DaysEdit.Value;
        StoredProc.ParamByName('DEFAULT_TERM').Value := frm.DefaultDaysEdit.Value;
        If frm.PlanFactCheck.Checked = true Then
            StoredProc.ParamByName('CHECK_PLAN_WITH_FACT').Value := 1
        Else
            StoredProc.ParamByName('CHECK_PLAN_WITH_FACT').Value := 0;
        If frm.IsOldCheck.Checked = true Then
            StoredProc.ParamByName('IS_OLD').Value := 1
        Else
            StoredProc.ParamByName('IS_OLD').Value := 0;
        If frm.ActiveCheck.Checked = true Then
            StoredProc.ParamByName('IS_ACTIVE').Value := 1
        Else
            StoredProc.ParamByName('IS_ACTIVE').Value := 0;
        If frm.IsPayHol.Checked = true Then
            StoredProc.ParamByName('IS_MAIN').Value := 'T'
        Else
            StoredProc.ParamByName('IS_MAIN').Value := 'F';
        If frm.IsPrintDays.Checked = true Then
            StoredProc.ParamByName('Is_Print_Days').Value := 1
        Else
            StoredProc.ParamByName('Is_Print_Days').Value := 0;
        StoredProc.ParamByName('MAX_DAY_COUNT').Value := frm.MaxDaysEdit.Value;
        If frm.CalcCheck.Checked = true Then
            StoredProc.ParamByName('CALC_WITH_HOLIDAYS').Value := 1
        Else
            StoredProc.ParamByName('CALC_WITH_HOLIDAYS').Value := 0;

        If frm.PrintPer.Checked = true Then
            StoredProc.ParamByName('HOLIDAY_PERIOD_PRINT_TYPE').Value := 1
        Else
            StoredProc.ParamByName('HOLIDAY_PERIOD_PRINT_TYPE').Value := 0;

        If frm.IsPayHol.Checked = true Then
            StoredProc.ParamByName('IS_PAY').Value := 'T'
        Else
            StoredProc.ParamByName('IS_PAY').Value := 'F';

        If frm.IsPrintDays.Checked = true Then
            StoredProc.ParamByName('Is_Print_Days').Value := 1
        Else
            StoredProc.ParamByName('Is_Print_Days').Value := 0;

        If Not VarIsNull(frm.BtnTypeVihod.Value) Then
            StoredProc.ParamByName('VIHOD_TYPE').AsInteger := frm.BtnTypeVihod.Value
        Else
            StoredProc.ParamByName('VIHOD_TYPE').Value := null;

        If Not VarIsNull(frm.BtnVidOpl.Value) Then
            StoredProc.ParamByName('ID_VIDOPL').AsInteger := frm.BtnVidOpl.Value
        Else
            StoredProc.ParamByName('ID_VIDOPL').Value := null;

        StoredProc.ParamByName('TYPE_HOLIDAY').Value := frm.TypeEdit.Value;
        StoredProc.ParamByName('ID_GROUP_HOLIDAY').Value := frm.GroupComboBox.EditValue;
        Try
            StoredProc.ExecProc;
        Except
            StoredProc.Transaction.Rollback;
            frm.Free;
            exit;
        End;
        id := StoredProc['ID_TYPE_HOLIDAY'].AsInteger;
        StoredProc.Transaction.Commit;


        WorkQuery := TpFIBStoredProc.Create(self);
        WorkQuery.Database := Database;
        WorkQuery.Transaction := WriteTransaction;
        WorkQuery.Close;
        WorkQuery.Transaction.StartTransaction;

        With frm.HolidayPropList Do
            For i := 0 To Items.Count - 1 Do
            Begin
                If frm.HolidayPropList.Items[i].Checked Then
                    Ch := 1
                Else
                    Ch := 0;
                With WorkQuery.SQL Do
                Begin
                    Clear;
                    AllPropQuery.Locate('Name_Prop', frm.HolidayPropList.Items[i].Text, []);
                    Add('EXECUTE PROCEDURE HOLIDAY_PROP_UPDATE ' +
                        IntToStr(AllPropQuery['Id_Prop']) + ',' + IntToStr(id) + ',' +
                        IntToStr(Ch));
                End;

                Try
                    WorkQuery.ExecProc;
                Except
                    WorkQuery.Transaction.Rollback;
                    frm.Free;
                    exit;
                End;

            End;
        WorkQuery.Transaction.Commit;
        SelectAll;
        DataSet.Locate('ID_TYPE_HOLIDAY', id, []);
    End;
    frm.Free;
End;

Procedure TfrmHolidayType.SelectAll;
Begin

    DataSet.CloseOpen(false);
    cxDBTreeList1.BeginUpdate;
    cxDBTreeList1.FullExpand;
    cxDBTreeList1.EndUpdate;
End;

Procedure TfrmHolidayType.btnEditClick(Sender: TObject);
Var
    frm: TfrmHolidayTypeAdd;
    id, i, Ch: integer;
    AllPropQuery: TpFibDataSet;
    HolPropQuery: TpFibDataSet;
    CheckHolidayQuery: TpFIBDataset;
    WorkQuery: TpFIBStoredProc;
    CanChangeGroup: Boolean;
Begin
    If DataSet.RecordCount = 0 Then
        exit;
    id := Dataset['ID_TYPE_HOLIDAY'];
    frm := TfrmHolidayTypeAdd.Create(Self);
    frm.Caption := 'Змінити ' + frm.Caption;

    frm.DSetGroupHoliday.Close;
    frm.DSetGroupHoliday.SelectSQL.Text := 'SELECT ID_GROUP_HOLIDAY, NAME_GROUP FROM HL_SP_GROUP_HOLIDAY';
    frm.DSetGroupHoliday.Open;

    frm.GroupComboBox.Properties.ListSource := frm.DSGroupHoliday;

    //проверяем, используется ли данный тип отпуска в плановых отпусках, если да, то группу уже изменить нельзя
    CheckHolidayQuery := TpFIBDataSet.Create(Self);
    CheckHolidayQuery.Database := Database;
    CheckHolidayQuery.Transaction := ReadTransaction;
    If CheckHolidayQuery.Active Then
        CheckHolidayQuery.Close;
    CheckHolidayQuery.SQLs.SelectSQL.Text := 'SELECT FIRST 1 ID_MAN_HOLIDAY_PLAN FROM HL_DT_MAN_HOLIDAY_PLAN ' +
        'WHERE ID_TYPE_HOLIDAY = ' + IntToStr(Id);
    CheckHolidayQuery.Open;
    If CheckHolidayQuery.IsEmpty Then
        CanChangeGroup := True
    Else
        CanChangeGroup := False;
    CheckHolidayQuery.Close;
    CheckHolidayQuery.Free;

    If UseGroupHoliday Then
    Begin
        If Not VarIsNull(DataSet['ID_GROUP_HOLIDAY']) Then
            frm.GroupComboBox.EditValue := DataSet['ID_GROUP_HOLIDAY']
        Else
            frm.GroupComboBox.EditValue := Null;

        If CanChangeGroup Then
            frm.GroupComboBox.Enabled := True
        Else
            frm.GroupComboBox.Enabled := False;
    End
    Else
    Begin
        frm.GroupComboBox.Enabled := False;
        frm.GroupComboBox.EditValue := IdGroupAnnualHoliday;
    End;

    If Not VarIsNull(DataSet['FULL_NAME'])
        Then
        frm.NameEdit.Value := DataSet['FULL_NAME']
    Else
        frm.NameEdit.Value := Null;
    If Not VarIsNull(DataSet['SHORT_NAME'])
        Then
        frm.ShortNameEdit.Value := DataSet['SHORT_NAME']
    Else
        frm.ShortNameEdit.Value := Null;
    If Not VarIsNull(DataSet['SHORT_NAME'])
        Then
        frm.ShortNameEdit.Value := DataSet['SHORT_NAME']
    Else
        frm.ShortNameEdit.Value := Null;
    If Not VarIsNull(DataSet['COMMENT'])
        Then
        frm.NoteEdit.Text := DataSet['COMMENT'];
    If Not VarIsNull(DataSet['MIN_WORKED_DAYS'])
        Then
        frm.DaysEdit.Value := DataSet['MIN_WORKED_DAYS']
    Else
        frm.DaysEdit.Value := Null;
    If Not VarIsNull(DataSet['DEFAULT_TERM'])
        Then
        frm.DefaultDaysEdit.Value := DataSet['DEFAULT_TERM']
    Else
        frm.DefaultDaysEdit.Value := Null;
    frm.PlanFactCheck.Checked := DataSet['CHECK_PLAN_WITH_FACT'] = 1;
    frm.ActiveCheck.Checked := DataSet['IS_ACTIVE'] = 1;
    frm.IsMainHol.Checked := DataSet['IS_MAIN'] = 'T';
    frm.MaxDaysEdit.Value := DataSet['MAX_DAY_COUNT'];
    frm.CalcCheck.Checked := DataSet['CALC_WITH_HOLIDAYS'] = 1;
    frm.TypeEdit.Value := DataSet['TYPE_HOLIDAY'];
    frm.PrintPer.Checked := DataSet['HOLIDAY_PERIOD_PRINT_TYPE'] = 1;
    frm.IsPayHol.Checked := DataSet['IS_PAY'] = 'T';
    frm.IsPrintDays.Checked := DataSet['IS_PRINT_DAYS'] = 1;
    If VarIsNull(DataSet['IS_OLD']) Then
        frm.IsOldCheck.Checked := False
    Else
        frm.IsOldCheck.Checked := DataSet['IS_OLD'];
    If Not VarIsNull(DataSet['DEFAULT_TERM'])
        Then
        frm.DefaultDaysEdit.Value := DataSet['DEFAULT_TERM']
    Else
        frm.DefaultDaysEdit.Value := Null;

    If Not VarIsNull(DataSet['ID_VIDOPL'])
        Then
    Begin
        frm.BtnVidOpl.Value := DataSet['ID_VIDOPL'];
        frm.BtnVidOpl.DisplayText := DataSet['Name_VidOpl'];
    End
    Else
    Begin
        frm.BtnVidOpl.Value := Null;
        frm.BtnVidOpl.DisplayText := '';
    End;

    If Not VarIsNull(DataSet['Vihod_Type'])
        Then
    Begin
        frm.BtnTypeVihod.Value := DataSet['Vihod_Type'];
        If Not VarIsNull(DataSet['Name_VIHOD'])
            Then
            frm.BtnTypeVihod.DisplayText := DataSet['Name_VIHOD']
        Else
            frm.BtnTypeVihod.DisplayText := '';
    End
    Else
    Begin
        frm.BtnTypeVihod.Value := Null;
        frm.BtnTypeVihod.DisplayText := '';
    End;

    AllPropQuery := TpFibDataSet.Create(self);
    AllPropQuery.Database := Database;
    AllPropQuery.Transaction := ReadTransaction;
    AllPropQuery.Close;
    AllPropQuery.SelectSQL.Text := 'SELECT Id_Prop,Name_Prop FROM INI_HOLIDAY_PROP';
    HolPropQuery := TpFibDataSet.Create(self);
    HolPropQuery.Database := Database;
    HolPropQuery.Transaction := ReadTransaction;
    HolPropQuery.SelectSQL.Text :=
        'SELECT DISTINCT S.Id_Prop,S.Name_Prop FROM Holiday_Property W,Ini_Holiday_Prop S WHERE W. Id_Holiday=' +
        IntToStr(Dataset['ID_TYPE_HOLIDAY']) + ' AND W.Id_Prop=S.Id_Prop';
    frm.HolidayPropList.Clear;

    With AllPropQuery Do
    Begin
        Close;
        Open;
        First;
        While Not Eof Do
        Begin
            frm.HolidayPropList.Items.Add.Text := FieldValues['Name_Prop'];
            Next;
        End;
    End;
    HolPropQuery.Close;
    HolPropQuery.Open;
    For i := 0 To frm.HolidayPropList.Items.Count - 1 Do
        frm.HolidayPropList.Items[i].Checked := False;
    For i := 0 To frm.HolidayPropList.Items.Count - 1 Do
    Begin
        If HolPropQuery.Locate('Name_Prop', frm.HolidayPropList.Items[i].Text, []) Then
            frm.HolidayPropList.Items[i].Checked := True;
    End;

    frm.ParentCheck.Visible := false;
    If frm.ShowModal = mrOk Then
    Begin
        StoredProc.Transaction.StartTransaction;
        StoredProc.StoredProcName := 'HL_SP_TYPE_HOLIDAY_U';
        StoredProc.Prepare;
        StoredProc.ParamByName('ID_TYPE_HOLIDAY').AsInteger := id;
        StoredProc.ParamByName('FULL_NAME').Value := frm.NameEdit.Value;
        StoredProc.ParamByName('SHORT_NAME').Value := frm.ShortNameEdit.Value;
        StoredProc.ParamByName('COMMENT').Value := frm.NoteEdit.Text;
        StoredProc.ParamByName('MIN_WORKED_DAYS').Value := frm.DaysEdit.Value;
        StoredProc.ParamByName('DEFAULT_TERM').Value := frm.DefaultDaysEdit.Value;
        If frm.PlanFactCheck.Checked = true Then
            StoredProc.ParamByName('CHECK_PLAN_WITH_FACT').Value := 1
        Else
            StoredProc.ParamByName('CHECK_PLAN_WITH_FACT').Value := 0;
        If frm.IsOldCheck.Checked = true Then
            StoredProc.ParamByName('IS_OLD').Value := 1
        Else
            StoredProc.ParamByName('IS_OLD').Value := 0;
        If frm.IsMainHol.Checked = true Then
            StoredProc.ParamByName('IS_MAIN').Value := 'T'
        Else
            StoredProc.ParamByName('IS_MAIN').Value := 'F';
        If frm.ActiveCheck.Checked = true Then
            StoredProc.ParamByName('IS_ACTIVE').Value := 1
        Else
            StoredProc.ParamByName('IS_ACTIVE').Value := 0;
        StoredProc.ParamByName('MAX_DAY_COUNT').Value := frm.MaxDaysEdit.Value;
        If frm.CalcCheck.Checked = true Then
            StoredProc.ParamByName('CALC_WITH_HOLIDAYS').Value := 1
        Else
            StoredProc.ParamByName('CALC_WITH_HOLIDAYS').Value := 0;
        If frm.PrintPer.Checked = true Then
            StoredProc.ParamByName('HOLIDAY_PERIOD_PRINT_TYPE').Value := 1
        Else
            StoredProc.ParamByName('HOLIDAY_PERIOD_PRINT_TYPE').Value := 0;
        If frm.IsPayHol.Checked = true Then
            StoredProc.ParamByName('IS_PAY').Value := 'T'
        Else
            StoredProc.ParamByName('IS_PAY').Value := 'F';

        If frm.IsPrintDays.Checked = true Then
            StoredProc.ParamByName('IS_PRINT_DAYS').Value := 1
        Else
            StoredProc.ParamByName('IS_PRINT_DAYS').Value := 0;

        If Not VarIsNull(frm.BtnTypeVihod.Value) Then
            StoredProc.ParamByName('VIHOD_TYPE').AsInteger := frm.BtnTypeVihod.Value
        Else
            StoredProc.ParamByName('VIHOD_TYPE').Value := null;

        If Not VarIsNull(frm.BtnVidOpl.Value) Then
            StoredProc.ParamByName('ID_VIDOPL').AsInteger := frm.BtnVidOpl.Value
        Else
            StoredProc.ParamByName('ID_VIDOPL').Value := null;

        StoredProc.ParamByName('TYPE_HOLIDAY').Value := frm.TypeEdit.Value;
        StoredProc.ParamByName('ID_GROUP_HOLIDAY').Value := frm.GroupComboBox.EditValue;
        Try
            StoredProc.ExecProc;
        Except
            StoredProc.Transaction.Rollback;
            frm.Free;
            exit;
        End;
        StoredProc.Transaction.Commit;

        WorkQuery := TpFIBStoredProc.Create(self);
        WorkQuery.Database := Database;
        WorkQuery.Transaction := WriteTransaction;
        WorkQuery.Close;
        WorkQuery.Transaction.StartTransaction;

        With frm.HolidayPropList Do
            For i := 0 To Items.Count - 1 Do
            Begin
                If frm.HolidayPropList.Items[i].Checked Then
                    Ch := 1
                Else
                    Ch := 0;
                With WorkQuery.SQL Do
                Begin
                    Clear;
                    AllPropQuery.Locate('Name_Prop', frm.HolidayPropList.Items[i].Text, []);
                    Add('EXECUTE PROCEDURE HOLIDAY_PROP_UPDATE ' +
                        IntToStr(AllPropQuery['Id_Prop']) + ',' + IntToStr(id) + ',' +
                        IntToStr(Ch));
                End;

                Try
                    WorkQuery.ExecProc;
                Except
                    WorkQuery.Transaction.Rollback;
                    frm.Free;
                    exit;
                End;

            End;
        WorkQuery.Transaction.Commit;
        SelectAll;
        DataSet.Locate('ID_TYPE_HOLIDAY', id, []);
        //cxDBTreeList1.OptionsView.RestoreDefaults;
    End;
    frm.Free;
End;

Procedure TfrmHolidayType.btnDeleteClick(Sender: TObject);
Begin
    If DataSet.RecordCount = 0 Then
        exit;
    If (agMessageDlg('Увага!', 'Ви хочете видалити запис?', mtConfirmation, [mbYes, mbNo]) <> mrYes) Then
        exit;
    StoredProc.Transaction.StartTransaction;
    StoredProc.StoredProcName := 'HL_SP_TYPE_HOLIDAY_D';
    StoredProc.Prepare;
    StoredProc.ParamByName('ID_TYPE_HOLIDAY').AsInteger := DataSet['ID_TYPE_HOLIDAY'];
    Try
        StoredProc.ExecProc;
    Except
        StoredProc.Transaction.Rollback;
        exit;
    End;
    StoredProc.Transaction.Commit;
    DataSet.CacheDelete;
End;

Procedure TfrmHolidayType.btnSelectClick(Sender: TObject);
Begin
    If DataSet.RecordCount = 0 Then
        exit;
    If btnSelect.Visible = ivNever Then
        exit;
    Output.Open;
    Output.Append;
    Output['ID_TYPE_HOLIDAY'] := DataSet['ID_TYPE_HOLIDAY'];
    Output['FULL_NAME'] := DataSet['FULL_NAME'];
    Output.Post;
    ModalResult := mrOk;
End;

Procedure TfrmHolidayType.FormShow(Sender: TObject);
Begin
    SelectAll;

End;

Procedure TfrmHolidayType.btnRefreshClick(Sender: TObject);
Var
    id: integer;
Begin
    id := -1;
    If DataSet.RecordCount <> 0 Then
        id := DataSet['ID_TYPE_HOLIDAY'];
    SelectAll;
    If id <> -1 Then
        DataSet.Locate('ID_TYPE_HOLIDAY', id, []);
End;

Procedure TfrmHolidayType.FormClose(Sender: TObject;
    Var Action: TCloseAction);
Begin
    If FormStyle = fsMDIChild Then
        Action := caFree;
End;


Procedure TfrmHolidayType.cxDBTreeList1KeyDown(Sender: TObject;
    Var Key: Word; Shift: TShiftState);
Begin
    If (Key = VK_INSERT)
        Then
        btnAdd.Click;

    If (Key = VK_DELETE)
        Then
        btnDelete.Click;

    If (Key = VK_F2)
        Then
        btnEdit.Click;

    If (Key = VK_F5)
        Then
        btnRefresh.Click;

    If (Key = VK_Escape)
        Then
        btnClose.Click;

    If (Key = VK_RETURN)
        Then
        btnSelect.Click;

    If ((Key = VK_F12) And (ssShift In Shift))
        Then
        ShowInfo(DataSet);
End;

Procedure TfrmHolidayType.IsOldCheckPropertiesChange(Sender: TObject);
Var
    id_type: Integer;
Begin
    { if IsOldCheck.Checked=True then IsOldDataSet(True)
     else IsOldDataSet(False); }
     //if VarIsNull(DataSet['Id_Type_Holiday']) then id_type:=-1
    id_type := DataSet['Id_Type_Holiday'];
    DataSet.Close;
    DataSet.ParamByName('IS_OLD_SHOW').AsInteger := Integer(IsOldCheck.Checked);
    DataSet.Open;
    SelectAll;
    DataSet.Locate('Id_Type_Holiday', id_type, []);
    KYVSaveIntoRegistry('THP_FullForm_IsOldCheck', IntToStr(Integer(IsOldCheck.Checked)), GetUserId);
End;

Procedure TfrmHolidayType.FormCreate(Sender: TObject);
Var
    tv: String;
Begin
    tv := '';
    tv := KYVLoadFromRegistry('THP_FullForm_IsOldCheck', GetUserId);
    If (tv = '0') Or (tv = '1')
        Then
    Begin
        IsOldCheck.Checked := Boolean(StrToInt(tv));
        DataSet.Close;
        DataSet.ParamByName('IS_OLD_SHOW').AsInteger := Integer(IsOldCheck.Checked);
        DataSet.Open;
        SelectAll;
    End;
End;

End.

