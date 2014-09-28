unit UpComandOrderEdit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
    cxFilter, cxData, cxDataStorage, cxEdit, cxGridLevel,
    cxGridCustomTableView, cxGridTableView, cxClasses, cxControls,
    cxGridCustomView, cxGrid, StdCtrls, cxButtons, uFControl,
    uLabeledFControl, uDateControl, uFormControl, cxContainer, cxLabel, uSpravControl,
    cxTextEdit, ExtCtrls, FIBDatabase, pFIBDatabase, DB, FIBDataSet,
    pFIBDataSet, iBase, AllPeopleUnit, UpComandOrderMain, qfTools, cxMemo,
    StrUtils, cxDBData, cxGridDBTableView, cxMaskEdit, cxDropDownEdit,
    cxCalendar, Buttons, cxCheckBox, Clipbrd, pFibStoredProc, cxLookupEdit,
    cxDBLookupEdit, cxDBLookupComboBox, AccMGMT, cxButtonEdit;

type
    TFormComandOrderEdit = class(TForm)
        GroupBox1: TGroupBox;
        GBSmet: TGroupBox;
        btnAddSmet: TcxButton;
        btnEditSmet: TcxButton;
        btnDeleteSmet: TcxButton;
        GBPost: TGroupBox;
        btnAddPost: TcxButton;
        btnDeletePost: TcxButton;
        GBCity: TGroupBox;
        btnAddCity: TcxButton;
        btnDeleteCity: TcxButton;
        GBTexts: TPanel;
        cxLabelReason: TcxLabel;
        cxTextEditReason: TcxTextEdit;
        cxLabelNote: TcxLabel;
        cxTextEditNote: TcxTextEdit;
        ManEdit: TqFSpravControl;
        cxLabelGoal: TcxLabel;
        DSPosts: TDataSource;
        DSetPosts: TpFIBDataSet;
        ReadTransaction: TpFIBTransaction;
        WriteTransaction: TpFIBTransaction;
        btnRefreshPost: TcxButton;
        cxGridCityLevel: TcxGridLevel;
        cxGridCity: TcxGrid;
        cxGridPost: TcxGrid;
        cxGridSmet: TcxGrid;
        cxGridSmetLevel: TcxGridLevel;
        DSetSmet: TpFIBDataSet;
        DSSmet: TDataSource;
        cxDate_Beg: TcxDateEdit;
        lblDateBeg: TcxLabel;
        cxDate_End: TcxDateEdit;
        lblDateEnd: TcxLabel;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        DB: TpFIBDatabase;
        cxGridPostLevel: TcxGridLevel;
        cxGridPostTableView: TcxGridTableView;
        col_Id_Work_Dog_Moving: TcxGridColumn;
        col_Name_Department: TcxGridColumn;
        col_Name_Post: TcxGridColumn;
        col_Is_Post_main: TcxGridColumn;
        cx_Name_Work_Reason: TcxGridColumn;
        col_Rate_Count: TcxGridColumn;
        cxstylrpstry1: TcxStyleRepository;
        cxstyl1: TcxStyle;
        cxstyl2: TcxStyle;
        cxstyl3: TcxStyle;
        cxstyl4: TcxStyle;
        cxstyl5: TcxStyle;
        cxstyl6: TcxStyle;
        cxstyl7: TcxStyle;
        cxstyl8: TcxStyle;
        cxstyl9: TcxStyle;
        cxstyl10: TcxStyle;
        cxstyl11: TcxStyle;
        cxstyl12: TcxStyle;
        cxstyl13: TcxStyle;
        cxstyl14: TcxStyle;
        cxStyle1: TcxStyle;
        cxStyle2: TcxStyle;
        cxStyle3: TcxStyle;
        cxStyle4: TcxStyle;
        cxStyle5: TcxStyle;
        cxStyle6: TcxStyle;
        cxStyle7: TcxStyle;
        cxStyle8: TcxStyle;
        cxStyle9: TcxStyle;
        cxStyle10: TcxStyle;
        cxStyle11: TcxStyle;
        cxStyle12: TcxStyle;
        cxStyle13: TcxStyle;
        cxStyle14: TcxStyle;
        cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
        cxGridCityTableView: TcxGridTableView;
        col_Id_Comand_Org: TcxGridColumn;
        col_City: TcxGridColumn;
        col_Org: TcxGridColumn;
        cxGridSmetTableView: TcxGridTableView;
        col_Id_smeta: TcxGridColumn;
        col_Kod_Smeta: TcxGridColumn;
        col_Name_Smeta: TcxGridColumn;
        col_Percent: TcxGridColumn;
        cxLabelDaysCount: TcxLabel;
        cxMEditDaysCount: TcxMaskEdit;
        cxLabelRegNum: TcxLabel;
        cxLabelRegData: TcxLabel;
        cxNumCertText: TcxTextEdit;
        cxDateCertEdit: TcxDateEdit;
        cxGridCityTableView1: TcxGridTableView;
        CBTarget: TcxLookupComboBox;
        CityBtn: TcxButton;
        DSourceTarget: TDataSource;
        DSetTarget: TpFIBDataSet;
        cxTextEdit1: TcxTextEdit;
        cxTextEdit2: TcxTextEdit;
        col_id_place: TcxGridColumn;
        cxMemoPost: TcxMemo;

        procedure ManEditOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure btnRefreshPostClick(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
        procedure btnAddPostClick(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure btnDeletePostClick(Sender: TObject);
        procedure cxGridPostTableViewKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure btnAddCityClick(Sender: TObject);
        procedure btnDeleteCityClick(Sender: TObject);
        procedure btnAddSmetClick(Sender: TObject);
        procedure btnDeleteSmetClick(Sender: TObject);
        procedure btnEditSmetClick(Sender: TObject);
        procedure cxMEditDaysCountPropertiesEditValueChanged(Sender: TObject);
        procedure cxDate_BegPropertiesEditValueChanged(Sender: TObject);
        procedure cxDate_EndPropertiesEditValueChanged(Sender: TObject);
        procedure cxGridCityTableViewKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure CBTargetPropertiesCloseUp(Sender: TObject);
        procedure CBTargetPropertiesEditValueChanged(Sender: TObject);
        procedure CBTargetPropertiesChange(Sender: TObject);
        procedure CityBtnClick(Sender: TObject);
        procedure cxTextEdit1KeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
    private

        procedure ClearPosts;
        function CheckSumPercent: Boolean;
        function CheckAll: Boolean;
        procedure SetModeForm(aMode: Integer);
        function CalcDays(DateBeg: TDate; DateEnd: TDate): TDate;
    public
        { Public declarations }
        Is_Working: Boolean;
        DBHandle: TISC_DB_HANDLE;
        Id_Pcard: Variant;
        Man_Post: string;
        Days_Count: Integer;
        Id_Mode: Integer;
        CheckFinance: Boolean;
        procedure EnablePosts(bEnable: Boolean);
        constructor Create(aOwner: TComponent; aDBHandle: TISC_DB_HANDLE; Mode: Integer;
            id_order_item: Int64; id_order_type: Integer); reintroduce;
        procedure GridPostView(Id_Man: Integer; Date_Beg: TDate);

    end;

var
    FormComandOrderEdit: TFormComandOrderEdit;

implementation

uses UpComandOrderPosts, UpComandOrderCityOrg, UpComandOrderSmet, UpComandOrderSpTarget;
{$R *.dfm}

constructor TFormComandOrderEdit.Create(aOwner: TComponent; aDBHandle: TISC_DB_HANDLE; Mode: Integer;
    id_order_item: Int64; id_order_type: Integer);
begin
    inherited Create(AOwner);
    Days_Count := 0;
    Id_Mode := Mode;
    try
        DBHandle := aDBHandle;
        Db.Handle := DBHandle;
        ReadTransaction.Active := True;

        if DSetPosts.Active then
            DSetPosts.Close;


        DSetPosts.Database := DB;
        DSetPosts.Transaction := ReadTransaction;


        DSetTarget.Database := DB;
        DSetTarget.Transaction := ReadTransaction;

        if DSetTarget.Active then
            DSetTarget.Close;

        DSetTarget.SQLs.SelectSQL.Text := 'SELECT * FROM UP_DT_COMAND_TARGET';
        DSetTarget.Open;
        CBTarget.Properties.ListSource := DSourceTarget;

    except on E: Exception do
            Showmessage(E.Message);
    end;

    cxGridPostTableView.Columns[0].DataBinding.ValueTypeClass := TcxIntegerValueType;
    cxGridPostTableView.Columns[1].DataBinding.ValueTypeClass := TcxStringValueType;
    cxGridPostTableView.Columns[2].DataBinding.ValueTypeClass := TcxStringValueType;
    cxGridPostTableView.Columns[3].DataBinding.ValueTypeClass := TcxBooleanValueType;
    cxGridPostTableView.Columns[4].DataBinding.ValueTypeClass := TcxStringValueType;
    cxGridPostTableView.Columns[5].DataBinding.ValueTypeClass := TcxFloatValueType;

    cxGridCityTableView.Columns[0].DataBinding.ValueTypeClass := TcxIntegerValueType;
    cxGridCityTableView.Columns[1].DataBinding.ValueTypeClass := TcxStringValueType;
    cxGridCityTableView.Columns[2].DataBinding.ValueTypeClass := TcxStringValueType;
    cxGridCityTableView.Columns[3].DataBinding.ValueTypeClass := TcxIntegerValueType;

    cxGridSmetTableView.Columns[0].DataBinding.ValueTypeClass := TcxStringValueType;
    cxGridSmetTableView.Columns[1].DataBinding.ValueTypeClass := TcxStringValueType;
    cxGridSmetTableView.Columns[2].DataBinding.ValueTypeClass := TcxStringValueType;
    cxGridSmetTableView.Columns[3].DataBinding.ValueTypeClass := TcxStringValueType;

    SetModeForm(Id_Mode);
    if Id_Mode = 1 then ManEdit.Blocked := True;
end;

procedure TFormComandOrderEdit.ManEditOpenSprav(Sender: TObject; var Value: Variant;
    var DisplayText: string);
var
    Result: Variant;
begin
    try
        result := AllPeopleUnit.GetManForASUP(Self, DBHandle, False, False);
        if (not VarIsNull(result)) and not (VarType(result) = varNull) and
            not (VarArrayDimCount(result) = 0) then
        begin
            ManEdit.Value := result[0];
            DisplayText := result[1];
        end;
    except on e: Exception do
        begin
            qFErrorDialog('Неможливо завантажити довідник фізичних осіб! Виникла помилка: "'
                + e.Message + '"');
            exit;

        end;
    end;
    try
        ClearPosts;

        if (not VarIsNull(cxDate_Beg.EditValue) and not (VarIsNull(ManEdit.Value))) then
            GridPostView(ManEdit.Value, cxDate_Beg.Date);
    except on E: Exception do
            Showmessage(E.Message);
    end;

end;

procedure TFormComandOrderEdit.GridPostView(Id_Man: Integer; Date_Beg: TDate);
var
    idx: Integer;
begin
    if DSetPosts.Active then
        DSetPosts.Close;
    DSetPosts.SQls.SelectSQL.Text := 'Select distinct * from UP_GET_POST_BY_ID_MAN(' +
        IntToStr(Id_Man) + ', ''' + DateToStr(Date_Beg) + ''')';
    DSetPosts.Open;

    Is_Working := (DSetPosts.FieldByName('Is_Working').AsInteger = 1);

    // Если человек работает, то показываем панель с гридом,
    // если же не работает, то показываем Мемо-поле
    EnablePosts(Is_Working);

    Man_Post := '';

    if is_working then
    begin
        DSetPosts.First;
        //Получим сразу ID_PCARD
        Id_Pcard := DSetPosts.FieldByName('ID_PCARD').AsInteger;

        while not DSetPosts.Eof do
        begin
            if Man_Post <> '' then
                Man_Post := Man_Post + ', ';
            try
                cxGridPostTableView.DataController.RecordCount := cxGridPostTableView.DataController.RecordCount + 1;
                idx := cxGridPostTableView.DataController.RecordCount - 1;

                cxGridPostTableView.DataController.Values[idx, 0] := DSetPosts.FieldByName('ID_WORK_DOG_MOVING').AsInteger;
                cxGridPostTableView.DataController.Values[idx, 1] := DSetPosts.FieldByName('NAME_DEPARTMENT').AsString;
                cxGridPostTableView.DataController.Values[idx, 2] := DSetPosts.FieldByName('NAME_POST').AsString;
                cxGridPostTableView.DataController.Values[idx, 3] := (DSetPosts.FieldByName('IS_POST_MAIN').AsInteger = 1);
                cxGridPostTableView.DataController.Values[idx, 4] := DSetPosts.FieldByName('NAME_WORK_REASON').AsString;
                cxGridPostTableView.DataController.Values[idx, 5] := DSetPosts.FieldByName('RATE_COUNT').AsFloat;

                cxGridPostTableView.DataController.FocusedRecordIndex := idx;



                Man_Post := Man_Post + DSetPosts.FieldByName('NAME_POST').AsString;
                DSetPosts.Next;
            except on E: Exception do
                begin
                    Showmessage(E.Message);
                    exit;
                end;
            end;
        end;
    end;

end;

procedure TFormComandOrderEdit.btnRefreshPostClick(Sender: TObject);
begin
    ClearPosts;

    if (not VarIsNull(cxDate_Beg.EditValue) and not (VarIsNull(ManEdit.Value))) then
        GridPostView(ManEdit.Value, cxDate_Beg.Date);
end;

procedure TFormComandOrderEdit.EnablePosts(bEnable: Boolean);
begin
    btnAddPost.Enabled := bEnable;
    btnDeletePost.Enabled := bEnable;
    // btnRefreshPost.Enabled := bEnable; пусть будет открыто
    cxGridPost.Visible := bEnable;
    cxMemoPost.Visible := not (bEnable);
    cxMemoPost.Align := alClient;
end;


procedure TFormComandOrderEdit.CancelButtonClick(Sender: TObject);
begin
    ModalResult := mrCancel;
    // Close;
end;

procedure TFormComandOrderEdit.btnAddPostClick(Sender: TObject);
var
    frmPost: TFormPost;
    idx: Integer;
    Check: Boolean;
begin
    if (VarIsNull(cxDate_Beg.EditValue)) then
    begin
        qFErrorDialog('Вкажіть дати відрядження!');
        exit;
    end;
    if (VarIsNull(ManEdit.Value)) then
    begin
        qFErrorDialog('Оберіть фізичну особу!');
        exit;
    end;

    if not Is_Working then
        exit;

    frmPost := TFormPost.Create(Self);
    frmPost.cxGridPostTableView.DataController.DataSource := DSPosts;
    if frmPost.ShowModal = mrOk then
    begin
        Check := True;
        for idx := 0 to (cxGridPostTableView.DataController.RecordCount - 1) do
        begin
            if (cxGridPostTableView.DataController.Values[idx, 0] = DSetPosts['ID_WORK_DOG_MOVING']) then
            begin
                MessageDlg('Увага! Таку посаду вже було обрано!', mtError, [mbOk], 0);
                Check := False;
                Break;
            end;
        end;

        if (Check = True) then
        begin
            cxGridPostTableView.DataController.RecordCount := cxGridPostTableView.DataController.RecordCount + 1;
            idx := cxGridPostTableView.DataController.RecordCount - 1;

            cxGridPostTableView.DataController.Values[idx, 0] := DSetPosts['ID_WORK_DOG_MOVING'];
            cxGridPostTableView.DataController.Values[idx, 1] := DSetPosts['NAME_DEPARTMENT'];
            cxGridPostTableView.DataController.Values[idx, 2] := DSetPosts['NAME_POST'];
            cxGridPostTableView.DataController.Values[idx, 3] := (DSetPosts['IS_POST_MAIN'] = 1);
            cxGridPostTableView.DataController.Values[idx, 4] := DSetPosts['NAME_WORK_REASON'];
            cxGridPostTableView.DataController.Values[idx, 5] := DSetPosts['RATE_COUNT'];
            cxGridPostTableView.DataController.FocusedRecordIndex := idx;
        end;
    end;
    frmPost.Free;

end;

procedure TFormComandOrderEdit.OkButtonClick(Sender: TObject);

begin
    if not (Id_Mode = 2) then //проверяем на корректность, если режим не просмотр
    begin
        if not Is_Working then
            Man_Post := cxMemoPost.Text;
        if CheckAll then
            ModalResult := mrOk;
    end
    else
        ModalResult := mrOk;
end;

procedure TFormComandOrderEdit.btnDeletePostClick(Sender: TObject);
begin
    cxGridPostTableView.DataController.DeleteFocused;
end;

procedure TFormComandOrderEdit.cxGridPostTableViewKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
var
    idx: Integer;
begin
    if ((Key = VK_F12) and (ssShift in Shift))
        then
    begin
        try
            idx := cxGridPostTableView.DataController.FocusedRecordIndex;

            ShowMessage('Id_Work_Dog_Moving : ' + cxGridPostTableView.DataController.Values[idx, 0]);
        except on E: Exception do
                ShowMessage(E.Message);
        end;
    end;
end;

procedure TFormComandOrderEdit.ClearPosts;
var
    idx: Integer;
begin
    if cxGridPostTableView.DataController.RecordCount < 0 then
        exit;
    idx := cxGridPostTableView.DataController.RecordCount - 1;
    while idx >= 0 do
    begin
        cxGridPostTableView.DataController.FocusedRecordIndex := idx;
        cxGridPostTableView.DataController.DeleteFocused;
        idx := idx - 1;
    end;
    Man_Post := '';
end;

procedure TFormComandOrderEdit.btnAddCityClick(Sender: TObject);
var
    frmCity: TFormComandCityOrg;
    idx: Integer;
    Check: Boolean;
begin
    frmCity := TFormComandCityOrg.Create(Self);
    frmCity.DBHandle := DB.Handle;
    //frmCity.DSetCity.DataBase := DB;
    //frmCity.DSetCity.Transaction := ReadTransaction;
    frmCity.DSetOrg.Database := DB;
    frmCity.DSetOrg.Transaction := ReadTransaction;
    frmCity.DSetquery.Database := DB;
    frmCity.DSetquery.Transaction := ReadTransaction;
    {frmCity.DSetCity.Close;
    frmCity.DSetCity.SQLs.SelectSQL.Text := 'SELECT * FROM UP_DT_COMAND_CITY';
    frmCity.DSetCity.Open;
    frmCity.CBCity.Properties.ListSource := frmCity.DSCity; }
    frmCity.CBOrg.Properties.ListSource := frmCity.DSOrg;

    if frmCity.ShowModal = mrOk then
    begin
        Check := True;
        for idx := 0 to cxGridCityTableView.DataController.RecordCount - 1 do
        begin
            if (cxGridCityTableView.DataController.Values[idx, 0] = frmCity.CBOrg.EditValue) then
            begin
                MessageDlg('Увага! Таку організацію вже було обрано!', mtError, [mbOk], 0);
                Check := False;
                break;
            end;
        end;

        if (Check = True) then
        begin
            cxGridCityTableView.DataController.RecordCount := cxGridCityTableView.DataController.RecordCount + 1;
            idx := cxGridCityTableView.DataController.RecordCount - 1;

            cxGridCityTableView.DataController.Values[idx, 0] := frmCity.CBOrg.EditValue;
            cxGridCityTableView.DataController.Values[idx, 1] := frmCity.CBCity.Text;
            cxGridCityTableView.DataController.Values[idx, 2] := frmCity.CBOrg.Text;
            cxGridCityTableView.DataController.Values[idx, 3] := frmCity.ID_PLACE;
            cxGridCityTableView.DataController.FocusedRecordIndex := idx;
        end;
    end;
    frmCity.Free;
end;



procedure TFormComandOrderEdit.btnDeleteCityClick(Sender: TObject);
begin
    cxGridCityTableView.DataController.DeleteFocused;
end;

procedure TFormComandOrderEdit.btnAddSmetClick(Sender: TObject);
var
    frmSmet: TFormComandSmet;
    idx: Integer;
    Check: Boolean;
begin

    frmSmet := TFormComandSmet.Create(Self);
    frmSmet.pFIBStoredProc.Database := DB;
    frmSmet.pFIBStoredProc.Transaction := ReadTransaction;
    try
        //    frmSmet.pFIBStoredProc.Transaction.StartTransaction;
        if VarIsNull(cxDate_Beg.EditValue) then
            frmSmet.DateBeg := Date
        else
            frmSmet.DateBeg := cxDate_Beg.Date;
        frmSmet.PercentEdit.Value := 100;
    except
        on E: Exception do
        begin
            ShowMessage(E.Message);
            exit;
        end;
    end;
    if frmSmet.ShowModal = mrOk then
    begin
        Check := True;
        for idx := 0 to cxGridSmetTableView.DataController.RecordCount - 1 do
        begin
            if (cxGridSmetTableView.DataController.Values[idx, 0] = frmSmet.SmetaEdit.Value) then
            begin
                MessageDlg('Увага! Такий бюджет вже було обрано!', mtError, [mbOk], 0);
                Check := False;
                break;
            end;
        end;

        if Check then
        begin
            cxGridSmetTableView.DataController.RecordCount := cxGridSmetTableView.DataController.RecordCount + 1;
            idx := cxGridSmetTableView.DataController.RecordCount - 1;
            cxGridSmetTableView.DataController.Values[idx, 0] := frmSmet.SmetaEdit.Value;
            cxGridSmetTableView.DataController.Values[idx, 1] := IntToStr(frmSmet.kod_sm);
            cxGridSmetTableView.DataController.Values[idx, 2] := frmSmet.SmetaEdit.DisplayText;
            cxGridSmetTableView.DataController.Values[idx, 3] := frmSmet.PercentEdit.Value;
            cxGridSmetTableView.DataController.FocusedRecordIndex := idx;
        end;
    end;
    frmSmet.Free;
end;

procedure TFormComandOrderEdit.btnDeleteSmetClick(Sender: TObject);
begin
    cxGridSmetTableView.DataController.DeleteFocused;
end;

function TFormComandOrderEdit.CheckSumPercent: Boolean;
var
    i: Integer;
    SumPercent: Real;
begin
    Result := True;
    if CheckFinance = False and (cxGridSmetTableView.DataController.Recordcount = 0) then exit;
    SumPercent := 0;
    for i := 0 to cxGridSmetTableView.DataController.RecordCount - 1 do
    begin
        if VarIsNull(cxGridSmetTableView.DataController.Values[i, 3])
            then
            SumPercent := SumPercent + 0
        else
            SumPercent := SumPercent + cxGridSmetTableView.DataController.Values[i, 3];
    end;
    if SumPercent <> 100 then
    begin
        MessageDlg('Помилка: Загальний відсоток фінансування повинен дорівнювати 100%!', mtError, [mbOk], 0);
        Result := False;
    end;
end;

procedure TFormComandOrderEdit.btnEditSmetClick(Sender: TObject);
var
    frmSmet: TFormComandSmet;
    idx: integer;
begin
    if cxGridSmetTableView.DataController.FocusedRecordIndex = -1 then
        exit;
    idx := cxGridSmetTableView.DataController.FocusedRecordIndex;
    frmSmet := TFormComandSmet.Create(Self);
    frmSmet.pFIBStoredProc.Database := DB;
    frmSmet.pFIBStoredProc.Transaction := ReadTransaction;

    if VarIsNull(cxDate_Beg.EditValue) then
        frmSmet.DateBeg := Date
    else
        frmSmet.DateBeg := cxDate_Beg.Date;

    frmSmet.SmetaEdit.Value := cxGridSmetTableView.DataController.Values[idx, 0];
    frmSmet.SmetaEdit.DisplayText := cxGridSmetTableView.DataController.Values[idx, 2];
    frmSmet.kod_sm := StrToInt(cxGridSmetTableView.DataController.Values[idx, 1]);
    frmSmet.KodEdit.Value := frmSmet.kod_sm;
    frmSmet.PercentEdit.Value := cxGridSmetTableView.DataController.Values[idx, 3];

    if frmSmet.ShowModal = mrOk then
    begin
        cxGridSmetTableView.DataController.Values[idx, 0] := frmSmet.SmetaEdit.Value;
        cxGridSmetTableView.DataController.Values[idx, 1] := IntToStr(frmSmet.kod_sm);
        cxGridSmetTableView.DataController.Values[idx, 2] := frmSmet.SmetaEdit.DisplayText;
        cxGridSmetTableView.DataController.Values[idx, 3] := frmSmet.PercentEdit.Value;
    end;
    frmSmet.Free;
end;

function TFormComandOrderEdit.CheckAll: Boolean;
begin
    Result := False;
    if VarIsNull(cxDate_Beg.EditValue) then
    begin
        MessageDlg('Введіть дату початку відрядження!', mtError, [mbOk], 0);
        cxDate_Beg.SetFocus;
        Exit;
    end;
    if VarIsNull(cxDate_End.EditValue) then
    begin
        MessageDlg('Введіть дату кінця відрядження!', mtError, [mbOk], 0);
        cxDate_End.SetFocus;
        Exit;
    end;
    if cxDate_Beg.Date > cxDate_End.Date then
    begin
        MessageDlg('Дата кінця повинна бути більше дати початку!', mtError, [mbOk], 0);
        cxDate_Beg.SetFocus;
        Exit;
    end;
    if VarIsNull(ManEdit.Value) then
    begin
        MessageDlg('Оберіть людину, що їде у відрядження!', mtError, [mbOk], 0);
        ManEdit.SetFocus;
        Exit;
    end;
    if Is_Working then
    begin
        if cxGridPostTableView.DataController.RecordCount = 0 then
        begin
            MessageDlg('Додайте посади!', mtError, [mbOk], 0);
            btnAddPost.SetFocus;
            Exit;
        end;
    end
    else
    begin
        if cxMemoPost.Text = '' then
        begin
            MessageDlg('Вкажіть посаду!', mtError, [mbOk], 0);
            cxMemoPost.SetFocus;
            Exit;
        end;
    end;
    if cxGridCityTableView.DataController.RecordCount = 0 then
    begin
        MessageDlg('Додайте організацію!', mtError, [mbOk], 0);
        btnAddCity.SetFocus;
        Exit;
    end;
    if CheckFinance then
    begin
        if cxGridSmetTableView.DataController.RecordCount = 0 then
        begin
            MessageDlg('Додайте фінансування!', mtError, [mbOk], 0);
            btnAddSmet.SetFocus;
            Exit;
        end;
    end;
    if VarIsNull(CBTarget.EditValue) then
    begin
        MessageDlg('Вкажіть мету відрядження!', mtError, [mbOk], 0);
        CBTarget.SetFocus;
        Exit;
    end;
    if cxTextEditReason.Text = '' then
    begin
        MessageDlg('Вкажіть підставу наказу!', mtError, [mbOk], 0);
        cxTextEditReason.SetFocus;
        Exit;
    end;
    Result := CheckSumPercent;
end;

procedure TFormComandOrderEdit.SetModeForm(aMode: Integer);
begin
    if aMode = 2 then
    begin
        cxNumCertText.Enabled := False;
        cxTextEdit2.Enabled := False;
        cxTextEdit1.Enabled := False;
        cxDateCertEdit.Enabled := False;
        cxDate_Beg.Enabled := False;
        cxDate_End.Enabled := False;
        GBPost.Enabled := False;
        GBCity.Enabled := False;
        GBSmet.Enabled := False;
        GBTexts.Enabled := False;
        cxMEditDaysCount.Enabled := False;
        ManEdit.Enabled := False;
    end;
end;

function TFormComandOrderEdit.CalcDays(DateBeg: TDate; DateEnd: TDate): TDate;
var
    SP: TpFibStoredProc;
begin
    SP := TpFIBStoredProc.Create(Self);
    SP.Database := DB;
    Sp.Transaction := ReadTransaction;
    Sp.StoredProcName := 'UTIL_DAYS_BETWEEN';
    Sp.Prepare;

    Sp.ParamByName('DATE_BEG').asDate := cxDate_Beg.Date;
    Sp.ParamByName('DATE_END').AsDate := cxDate_End.Date;

    try
        Sp.ExecProc;
        CalcDays := SP.FieldByName('DAY_COUNT').AsInteger;
    except on E: Exception do
        begin
            ShowMessage(E.Message);
            CalcDays := 0;
            exit;
        end;
    end;
    Sp.Free;
end;



procedure TFormComandOrderEdit.cxMEditDaysCountPropertiesEditValueChanged(
    Sender: TObject);
begin
    if (not (VarIsNull(cxDate_Beg.EditValue)) and not (VarIsNull(cxDate_End.EditValue)))
        then
    begin
        cxDate_End.EditValue := cxDate_Beg.EditValue + cxMEditDaysCount.EditValue - 1;
        Days_Count := cxMEditDaysCount.EditValue;
    end;
end;

procedure TFormComandOrderEdit.cxDate_BegPropertiesEditValueChanged(
    Sender: TObject);
begin
    if (not (VarIsNull(cxDate_End.EditValue)) and not (VarIsNull(cxDate_Beg.EditValue)))
        then
    begin
        cxMEditDaysCount.EditValue := cxDate_End.EditValue - cxDate_Beg.EditValue + 1;
        Days_Count := cxMEditDaysCount.EditValue;
    end;

end;

procedure TFormComandOrderEdit.cxDate_EndPropertiesEditValueChanged(
    Sender: TObject);
begin
    if (not (VarIsNull(cxDate_End.EditValue)) and not (VarIsNull(cxDate_Beg.EditValue)))
        then
    begin
        cxMEditDaysCount.EditValue := cxDate_End.EditValue - cxDate_Beg.EditValue + 1;
        Days_Count := cxMEditDaysCount.EditValue;
    end;
end;

procedure TFormComandOrderEdit.cxGridCityTableViewKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
var idx: Integer;
begin
    if ((Key = VK_F12) and (ssShift in Shift))
        then
    begin
        try
            idx := cxGridCityTableView.DataController.FocusedRecordIndex;

            ShowMessage('Id_Comand_Org : ' + VarToStr(cxGridCityTableView.DataController.Values[idx, 0]));
        except on E: Exception do
                ShowMessage(E.Message);
        end;
    end;
end;

procedure TFormComandOrderEdit.CBTargetPropertiesCloseUp(Sender: TObject);
begin
    CBTargetPropertiesEditValueChanged(Self);
end;

procedure TFormComandOrderEdit.CBTargetPropertiesEditValueChanged(
    Sender: TObject);
begin
    if (not DSetTarget.Active) or (CBTarget.EditText = '') then
    begin
        CBTarget.EditValue := Null;
    end
    else
    begin
        DSetTarget.Locate('TEXT_TARGET', CBTarget.EditText, []);
        CBTarget.EditValue := DSetTarget['ID_COMAND_TARGET'];
        // CBOrg.EditText := DSetOrg['NAME_ORG'];
    end;
end;

procedure TFormComandOrderEdit.CBTargetPropertiesChange(Sender: TObject);
begin
    if (CBTarget.Text = '') then
        CBTargetPropertiesEditValueChanged(Self);
end;

procedure TFormComandOrderEdit.CityBtnClick(Sender: TObject);
var
    frmTarget: TFormComandSpTarget;
    Id: Variant;
begin
    frmTarget := TFormComandSpTarget.Create(self);
    frmTarget.DBHandle := DBHandle;
    if frmTarget.ShowModal = mrOk then
    begin
        Id := frmTarget.DSetTarget.FieldByName('ID_COMAND_TARGET').AsVariant;
        DSetTarget.Close;
        DSetTarget.Open;
        DSetTarget.Locate('ID_COMAND_TARGET', Id, []);
        CBTarget.EditValue := Id;
        //CBCity.EditText := frmCity.DSetCity.FieldByName('NAME_CITY').AsString;
    end;
    frmTarget.Free;
end;

procedure TFormComandOrderEdit.cxTextEdit1KeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
var res: integer;
begin
    //if (vk_Delete=Key) or (VK_BACK=Key) then Key:=0;
    res := fibCheckPermission('/ROOT/UP_ORDER_SYSTEM/EDIT_NUM', 'Edit');
    if (res <> ACCMGMT_OK)
        then
    begin
        MessageDlg('Ви не маєте прав доступу до цього пункту!', mtError, [mbYes], -1);
        Key := 0;
    end
end;

end.
