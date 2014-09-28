Unit UpComandFactEditForm;

Interface

Uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
    cxFilter, cxData, cxDataStorage, cxEdit, cxGridLevel,
    cxGridCustomTableView, cxGridTableView, cxClasses, cxControls,
    cxGridCustomView, cxGrid, StdCtrls, cxButtons, uFControl,
    uLabeledFControl, uDateControl, uFormControl, cxContainer, cxLabel, uSpravControl,
    cxTextEdit, ExtCtrls, FIBDatabase, pFIBDatabase, DB, FIBDataSet,
    pFIBDataSet, iBase, AllPeopleUnit, UpComandFactOrderMain, qfTools, cxMemo,
    StrUtils, cxDBData, cxGridDBTableView, cxMaskEdit, cxDropDownEdit,
    cxCalendar, Buttons, cxCheckBox, Clipbrd, pFibStoredProc, UpComandFactSmet;

Type
    TFormComandFactEdit = Class(TForm)
        cxDateEdit1: TcxDateEdit;
        PanelFiltr: TPanel;
        cxLabelData: TcxLabel;
        ManEdit: TqFSpravControl;
        ComandEdit: TqFSpravControl;
        PanelDialog: TPanel;
        PanelFact: TPanel;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        cxDateBeg: TcxDateEdit;
        cxDateEnd: TcxDateEdit;
        cxLabelDateBeg: TcxLabel;
        cxLabelDateEnd: TcxLabel;
        cxLabelDaysCount: TcxLabel;
        cxMEditDaysCount: TcxMaskEdit;
        GBSmet: TGroupBox;
        btnAddSmet: TcxButton;
        btnEditSmet: TcxButton;
        btnDeleteSmet: TcxButton;
        cxGridSmet: TcxGrid;
        cxGridSmetTableView: TcxGridTableView;
        col_Id_smeta: TcxGridColumn;
        col_Kod_Smeta: TcxGridColumn;
        col_Name_Smeta: TcxGridColumn;
        col_Percent: TcxGridColumn;
        cxGridSmetLevel: TcxGridLevel;
        GBTexts: TPanel;
        cxLabelReason: TcxLabel;
        cxTextEditReason: TcxTextEdit;
        cxLabelNote: TcxLabel;
        cxTextEditNote: TcxTextEdit;
        DataSet: TpFIBDataSet;
        DataSource: TDataSource;
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
        qizzStyle: TcxGridTableViewStyleSheet;
        DSetSelect: TpFIBDataSet;
    DB: TpFIBDatabase;
    ReadTr: TpFIBTransaction;
        Procedure ManEditOpenSprav(Sender: TObject; Var Value: Variant;
            Var DisplayText: String);
        Procedure ComandEditOpenSprav(Sender: TObject; Var Value: Variant;
            Var DisplayText: String);
        Procedure OkButtonClick(Sender: TObject);
        Procedure btnAddSmetClick(Sender: TObject);
        Procedure ComandEditChange(Sender: TObject);
        Procedure btnEditSmetClick(Sender: TObject);
        Procedure btnDeleteSmetClick(Sender: TObject);
        Procedure CancelButtonClick(Sender: TObject);
        Procedure FormKeyDown(Sender: TObject; Var Key: Word;
            Shift: TShiftState);
        Procedure FormCreate(Sender: TObject);
        Procedure cxMEditDaysCountPropertiesEditValueChanged(Sender: TObject);
        Procedure cxDateBegPropertiesEditValueChanged(Sender: TObject);
        Procedure cxDateEndPropertiesEditValueChanged(Sender: TObject);
    private
        { Private declarations }
        CheckFinance: Boolean;
        Function CheckAll: Boolean;
        Function CheckSumPercent: Boolean;
        Procedure SetControlsFact(Enable: Boolean);
        Procedure ClearSmets;
    public
        { Public declarations }
        DBHandle: TISC_DB_HANDLE;
        Id_Comand_Plan: Variant;
        Procedure SelSmet(aId_Comand_Plan: Variant);

    End;

Var
    FormComandFactEdit: TFormComandFactEdit;

Implementation

Uses BaseTypes, uAddPlanComand;

{$R *.dfm}

Procedure TFormComandFactEdit.ManEditOpenSprav(Sender: TObject; Var Value: Variant;
    Var DisplayText: String);
Var
    Result: Variant;
Begin
    Try
        result := AllPeopleUnit.GetManForASUP(Self, DBHandle, False, False);
        If (Not VarIsNull(result)) And Not (VarType(result) = varNull) And
            Not (VarArrayDimCount(result) = 0) Then
        Begin
            ManEdit.Value := result[0];
            DisplayText := result[1];
        End;
    Except On e: Exception Do
        Begin
            qFErrorDialog('Неможливо завантажити довідник фізичних осіб! Виникла помилка: "'
                + e.Message + '"');
            exit;

        End;
    End;

    ComandEdit.Value := Null;
    ComandEdit.DisplayText := '';
    cxDateBeg.EditValue := Null;
    cxDateEnd.EditValue := Null;
    cxMEditDaysCount.EditValue := Null;
    ClearSmets;


    { ClearPosts;

     if (not VarIsNull(cxDate_Beg.EditValue) and not (VarIsNull(ManEdit.Value))) then
         GridPostView(ManEdit.Value, cxDate_Beg.Date);
    }

End;

Procedure TFormComandFactEdit.ComandEditOpenSprav(Sender: TObject;
    Var Value: Variant; Var DisplayText: String);
Var
    f: TfrmAddComandPlan;
Begin
    If VarIsNull(ManEdit.Value) Then
    Begin
        MessageDlg('Оберіть фізичну особу!', mtError, [mbOk], 0);
        ManEdit.SetFocus;
        exit;
    End;

    f := TfrmAddComandPlan.Create(Self);


    DataSet.Close;
    DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM UP_DT_COMAND_PLAN_BUFF_SEL_EX(?F_DATE_BEG, ?ID_MAN)';
    If VarIsNull(cxDateEdit1.EditValue) Then
        DataSet.ParamByName('F_DATE_BEG').AsVariant := Null
    Else
        DataSet.ParamByName('F_DATE_BEG').AsDate := cxDateEdit1.Date;
    DataSet.ParamByName('ID_MAN').AsVariant := ManEdit.Value;

    DataSet.Open;
    DataSet.FetchAll;

//    f := TfrmAddComandPlan.Create(Self);
    If f.ShowModal = mrOk Then
    Begin
        If DataSet.RecordCount <> 0 Then
        Begin
            Value := DataSet['ID_COMAND_PLAN'];
            cxDateBeg.EditValue := DataSet['DATE_BEG'];
            cxDateEnd.EditValue := DataSet['DATE_END'];
            cxMEditDaysCount.EditValue := DataSet.fbn('DAYS_COUNT').AsVariant;
            Id_Comand_Plan := DataSet['ID_COMAND_PLAN'];
            DisplayText := '№ ' + DataSet.fbn('NUM_ORDER').AsString + ' від ' + DateToStr(DataSet.fbn('DATE_ORDER').AsDateTime) + '. Відрядження: ' +
                DateToStr(DataSet['DATE_BEG']) + ' - ' + DateToStr(DataSet['DATE_END']) + ' на ' + IntToStr(DataSet['DAYS_COUNT']) + ' днів до ' + DataSet.fbn('NAME_ORG_FULL').asString;

            ClearSmets;
            SelSmet(Id_Comand_Plan);
            CheckFinance := DataSet['IS_PAY'];
        End;
    End;
    f.Free;

    OkButton.Enabled := True;

End;

Procedure TFormComandFactEdit.OkButtonClick(Sender: TObject);
Begin
    If CheckAll Then
        ModalResult := mrOk;
End;

Function TFormComandFactEdit.CheckAll: Boolean;
Begin
    Result := False;
    If VarIsNull(cxDateBeg.EditValue) Then
    Begin
        MessageDlg('Введіть фактичну дату початку відрядження!', mtError, [mbOk], 0);
        cxDateBeg.SetFocus;
        Exit;
    End;
    If VarIsNull(cxDateEnd.EditValue) Then
    Begin
        MessageDlg('Введіть фактичну дату кінця відрядження!', mtError, [mbOk], 0);
        cxDateEnd.SetFocus;
        Exit;
    End;
    If cxDateBeg.Date > cxDateEnd.Date Then
    Begin
        MessageDlg('Дата кінця повинна бути більше дати початку!', mtError, [mbOk], 0);
        cxDateBeg.SetFocus;
        Exit;
    End;
    If CheckFinance then
        If cxGridSmetTableView.DataController.FocusedRecordIndex = -1 Then
        Begin
            MessageDlg('Додайте фінансування!', mtError, [mbOk], 0);
            btnAddSmet.SetFocus;
            Exit;
        End;

    If (cxTextEditReason.Text = '') then
    Begin
        MessageDlg('Введіть підставу!', mtError, [mbOk], 0);
        cxTextEditReason.SetFocus;
        Exit;
    End;

    Result := CheckSumPercent;
End;

Procedure TFormComandFactEdit.btnAddSmetClick(Sender: TObject);
Var
    frmSmet: TFormAddSmet;
    idx: Integer;
Begin
    frmSmet := TFormAddSmet.Create(Self);
    frmSmet.pFIBStoredProc.Database := DB;
    frmSmet.pFIBStoredProc.Transaction := ReadTr;
    Try
        If VarIsNull(cxDateBeg.EditValue) Then
            frmSmet.DateBeg := Date
        Else
            frmSmet.DateBeg := cxDateBeg.Date;
        frmSmet.PercentEdit.Value := 100;
    Except
        On E: Exception Do
        Begin
            ShowMessage(E.Message);
            exit;
        End;
    End;
    If frmSmet.ShowModal = mrOk Then
    Begin
        cxGridSmetTableView.DataController.RecordCount := cxGridSmetTableView.DataController.RecordCount + 1;
        idx := cxGridSmetTableView.DataController.RecordCount - 1;
        cxGridSmetTableView.DataController.Values[idx, 0] := frmSmet.SmetaEdit.Value;
        cxGridSmetTableView.DataController.Values[idx, 1] := IntToStr(frmSmet.kod_sm);
        cxGridSmetTableView.DataController.Values[idx, 2] := frmSmet.SmetaEdit.DisplayText;
        cxGridSmetTableView.DataController.Values[idx, 3] := frmSmet.PercentEdit.Value;
        cxGridSmetTableView.DataController.FocusedRecordIndex := idx;
    End;
    frmSmet.Free;
End;

Procedure TFormComandFactEdit.ComandEditChange(Sender: TObject);
Begin
    If VarIsNull(ComandEdit.Value) Then
        SetControlsFact(False)
    Else
        SetControlsFact(True);
End;

Procedure TFormComandFactEdit.SetControlsFact(Enable: Boolean);
Begin
    cxDateBeg.Enabled := Enable;
    cxDateEnd.Enabled := Enable;
    cxMEditDaysCount.Enabled := Enable;
    GBSmet.Enabled := Enable;
End;

Procedure TFormComandFactEdit.SelSmet(aId_Comand_Plan: Variant);
Var
    idx: Integer;
Begin
    DSetSelect.Close;
    DSetSelect.Sqls.SelectSQL.Text := 'SELECT * FROM UP_DT_COMAND_PLAN_SMET_SEL(' +
        VarToStr(aId_Comand_Plan) + ')';
    DSetSelect.Open;

    DSetSelect.First;
    While Not DSetSelect.Eof Do
    Begin
        cxGridSmetTableView.DataController.RecordCount := cxGridSmetTableView.DataController.RecordCount + 1;
        idx := cxGridSmetTableView.DataController.RecordCount - 1;

        cxGridSmetTableView.DataController.Values[idx, 0] := DSetSelect['ID_SMET'];
        cxGridSmetTableView.DataController.Values[idx, 1] := DSetSelect['SM_KOD'];
        cxGridSmetTableView.DataController.Values[idx, 2] := DSetSelect['SM_TITLE'];
        cxGridSmetTableView.DataController.Values[idx, 3] := DSetSelect['PERCENT'];
        cxGridSmetTableView.DataController.FocusedRecordIndex := idx;

        DSetSelect.Next;
    End;
End;

Procedure TFormComandFactEdit.btnEditSmetClick(Sender: TObject);
Var
    frmSmet: TFormAddSmet;
    idx: integer;
Begin
    If cxGridSmetTableView.DataController.RecordCount = 0 Then
        exit;
    idx := cxGridSmetTableView.DataController.FocusedRecordIndex;
    frmSmet := TFormAddSmet.Create(Self);
    frmSmet.pFIBStoredProc.Database := DB;
    frmSmet.pFIBStoredProc.Transaction := ReadTr;
    If VarIsNull(cxDateBeg.EditValue) Then
            frmSmet.DateBeg := Date
    Else
       frmSmet.DateBeg := cxDateBeg.Date;  

    frmSmet.SmetaEdit.Value := cxGridSmetTableView.DataController.Values[idx, 0];
    frmSmet.SmetaEdit.DisplayText := cxGridSmetTableView.DataController.Values[idx, 2];
    frmSmet.kod_sm := StrToInt(cxGridSmetTableView.DataController.Values[idx, 1]);
    frmSmet.KodEdit.Value := frmSmet.kod_sm;
    frmSmet.PercentEdit.Value := cxGridSmetTableView.DataController.Values[idx, 3];

    If frmSmet.ShowModal = mrOk Then
    Begin
        cxGridSmetTableView.DataController.Values[idx, 0] := frmSmet.SmetaEdit.Value;
        cxGridSmetTableView.DataController.Values[idx, 1] := IntToStr(frmSmet.kod_sm);
        cxGridSmetTableView.DataController.Values[idx, 2] := frmSmet.SmetaEdit.DisplayText;
        cxGridSmetTableView.DataController.Values[idx, 3] := frmSmet.PercentEdit.Value;
    End;
    frmSmet.Free;
End;

Procedure TFormComandFactEdit.btnDeleteSmetClick(Sender: TObject);
Begin
    cxGridSmetTableView.DataController.DeleteFocused;
End;

Function TFormComandFactEdit.CheckSumPercent: Boolean;
Var
    i: Integer;
    SumPercent: Real;
Begin
    Result := True;
    if (CheckFinance = False) and (cxGridSmetTableView.DataController.Recordcount = 0) then Exit;
    SumPercent := 0;
    For i := 0 To cxGridSmetTableView.DataController.Recordcount - 1 Do
    Begin
        If VarIsNull(cxGridSmetTableView.DataController.Values[i, 3])
            Then
            SumPercent := SumPercent + 0
        Else
            SumPercent := SumPercent + cxGridSmetTableView.DataController.Values[i, 3];
    End;
    If SumPercent <> 100 Then
    Begin
        MessageDlg('Помилка: Загальний відсоток фінансування повинен дорівнювати 100%!', mtError, [mbOk], 0);
        Result := False;
    End;
End;

Procedure TFormComandFactEdit.CancelButtonClick(Sender: TObject);
Begin
    ModalResult := mrCancel;
End;

Procedure TFormComandFactEdit.FormKeyDown(Sender: TObject; Var Key: Word;
    Shift: TShiftState);
Begin
    If Key = VK_ESCAPE Then
        ModalResult := mrCancel;
End;

Procedure TFormComandFactEdit.FormCreate(Sender: TObject);
Begin
    cxGridSmetTableView.Columns[0].DataBinding.ValueTypeClass := TcxStringValueType;
    cxGridSmetTableView.Columns[1].DataBinding.ValueTypeClass := TcxStringValueType;
    cxGridSmetTableView.Columns[2].DataBinding.ValueTypeClass := TcxStringValueType;
    cxGridSmetTableView.Columns[3].DataBinding.ValueTypeClass := TcxStringValueType;

End;

Procedure TFormComandFactEdit.cxMEditDaysCountPropertiesEditValueChanged(
    Sender: TObject);
Begin
    If (Not(VarIsNull(cxDateBeg.EditValue)) And Not(VarIsNull(cxDateEnd.EditValue))) Then
        cxDateEnd.EditValue := cxDateBeg.EditValue + cxMEditDaysCount.EditValue - 1;
End;

Procedure TFormComandFactEdit.cxDateBegPropertiesEditValueChanged(
    Sender: TObject);
Begin
    If (Not (VarIsNull(cxDateBeg.EditValue)) And Not (VarIsNull(cxDateEnd.EditValue)))
        Then
        cxMEditDaysCount.EditValue := cxDateEnd.EditValue - cxDateBeg.EditValue + 1;
End;

Procedure TFormComandFactEdit.cxDateEndPropertiesEditValueChanged(
    Sender: TObject);
Begin
    If (Not (VarIsNull(cxDateBeg.EditValue)) And Not (VarIsNull(cxDateEnd.EditValue)))
    Then
        cxMEditDaysCount.EditValue := cxDateEnd.EditValue - cxDateBeg.EditValue + 1;
End;

procedure TFormComandFactEdit.ClearSmets;
var idx: Integer;
begin
    if cxGridSmetTableView.DataController.RecordCount < 0 then exit;
    idx := cxGridSmetTableView.DataController.RecordCount-1;
    while idx >= 0 do
    begin
        cxGridSmetTableView.DataController.FocusedRecordIndex := idx;
        cxGridSmetTableView.DataController.DeleteFocused;
        idx := idx - 1;
    end;
end;

End.

