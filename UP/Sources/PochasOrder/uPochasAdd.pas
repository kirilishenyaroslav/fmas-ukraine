unit uPochasAdd;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, uSpravControl, uDateControl, uFControl,
    uLabeledFControl, uCharControl, uIntControl, uFormControl, uInvisControl,
    uBoolControl, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, cxGridCustomTableView, cxGridTableView, cxClasses,
    cxControls, cxGridCustomView, cxGridLevel, cxGrid, dxBar, uMemoControl,
    ExtCtrls, IBase, uPochas, uCommonSp, qfTools, uPochasSmet, AllPeopleUnit,
    ActnList, cxLookAndFeelPainters, cxButtons, RxMemDS, FIBDatabase,
    pFIBDatabase, DB, FIBDataSet, pFIBDataSet;

type
    TfrmPochasOrderAdd = class(TForm)
        GroupBox1: TGroupBox;
        btnOk: TBitBtn;
        btnCancel: TBitBtn;
        TarifEdit: TqFSpravControl;
        DateBegEdit: TqFDateControl;
        DateEndEdit: TqFDateControl;
        ManEdit: TqFSpravControl;
        DepEdit: TqFSpravControl;
        TypePochasEdit: TqFSpravControl;
        NoteEdit: TqFMemoControl;
        ReasonEdit: TqFCharControl;
        ActionList1: TActionList;
        ActionSelect: TAction;
        Action1: TAction;
        Action2: TAction;
        cbAll2: TqFBoolControl;
        GroupBox2: TGroupBox;
        btnAdd: TcxButton;
        btnEdit: TcxButton;
        btnDelete: TcxButton;
        cxGrid1: TcxGrid;
        cxGrid1TableView1: TcxGridTableView;
        cxGrid1TableView1ID_SMETA: TcxGridColumn;
        cxGrid1TableView1KOD_SMETA: TcxGridColumn;
        cxGrid1TableView1NAME_SMETA: TcxGridColumn;
        cxGrid1TableView1HOURS: TcxGridColumn;
        cxGrid1Level1: TcxGridLevel;
        PostEdit: TqFSpravControl;
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
        DSConsts: TpFIBDataSet;
        ReadTransaction: TpFIBTransaction;
        procedure NameDismissionOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure btnOkClick(Sender: TObject);
        procedure TarifEditOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure DepEditOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure ManEditOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure btnAddClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure btnDeleteClick(Sender: TObject);
        procedure btnEditClick(Sender: TObject);
        procedure TypePochasEditOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure cxGrid1TableView1KeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure PostEditOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);

    private
        zav_kaf: Integer;
        function CheckSumHours: Boolean;
    public
    { Public declarations }
    end;

implementation

uses DateUtils, uUnivSprav, BaseTypes;
{$R *.dfm}

procedure TfrmPochasOrderAdd.NameDismissionOpenSprav(Sender: TObject; var Value: Variant; var DisplayText: string);
var
    sp: TSprav;
begin
    // создать справочник
    sp := GetSprav('asup\SpDismission');
    if sp <> nil then
    begin
        // заполнить входные параметры
        sp.Input.Append;
        sp.Input.FieldValues['DBHandle'] := Integer(TfrmPochasOrder(owner).Database.Handle);
        sp.Input.FieldValues['FormStyle'] := fsNormal;
        sp.Input.Post;
        // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['Id_Dismission'];
            DisplayText := sp.Output['Name_Dismission'];

            if not VarIsNull(sp.Output['Kzot_St']) then
                DisplayText := DisplayText + ' ' + sp.Output['Kzot_St'];
        end;
        sp.Free;
    end;
end;

procedure TfrmPochasOrderAdd.btnOkClick(Sender: TObject);
begin
    if TfrmPochasOrder(Owner).Input['mode'] = 2 then Close;

    // проверка на корректность даты
    if DateBegEdit.Value > DateEndEdit.Value then
    begin
        agMessageDlg('Увага!', 'Дата кінця повинна бути більше дати початку!', mtError, [mbOk]);
        DateBegEdit.SetFocus;
        DateBegEdit.Highlight(true);
        DateEndEdit.Highlight(true);
        Exit;
    end;

    if qFCheckAll(Self) then if CheckSumHours then ModalResult := mrOk;
end;

procedure TfrmPochasOrderAdd.TarifEditOpenSprav(Sender: TObject; var Value: Variant; var DisplayText: string);
var
    sp: TSprav;
begin
    if VarIsNull(DateBegEdit.Value) then
    begin
        ShowMessage('Вкажіть дату початку');
        DateBegEdit.SetFocus;
        exit;
    end;
    sp := GetSprav('up\PochasTarif');
    if sp <> nil then
    begin
        sp.Input.Append;
        sp.Input.FieldValues['DBHandle'] := Integer(TfrmPochasOrder(owner).Database.Handle);
        sp.Input.FieldValues['FormStyle'] := fsNormal;
        sp.Input.FieldValues['DateFlt'] := DateBegEdit.Value;
        sp.Input.Post;
        sp.Show;
        if (sp.Output <> nil) and (not sp.Output.IsEmpty) then
        begin
            Value := sp.Output['ID_POCHAS_TARIF'];
            DisplayText := sp.Output['TARIF'];
        end;
        sp.Free;
    end;
end;

procedure TfrmPochasOrderAdd.DepEditOpenSprav(Sender: TObject; var Value: Variant; var DisplayText: string);
var
    sp: TSprav;
begin
    sp := GetSprav('SpDepartment');
    if sp <> nil then
    begin
        sp.Input.Append;
        sp.Input.FieldValues['DBHandle'] := Integer(TfrmPochasOrder(owner).Database.Handle);
        sp.Input.FieldValues['Select'] := 1;
        sp.Input.FieldValues['ShowStyle'] := 0;
        sp.Input.Post;
        sp.Show;
        if (sp.Output <> nil) and (not sp.Output.IsEmpty) then
        begin
            Value := sp.Output['ID_DEPARTMENT'];
            DisplayText := sp.Output['NAME_FULL'];
        end;
        sp.Free;
    end;
end;

procedure TfrmPochasOrderAdd.ManEditOpenSprav(Sender: TObject; var Value: Variant; var DisplayText: string);
var
    Result: Variant;
begin
    try

        result := AllPeopleUnit.GetManForASUP(Self, TfrmPochasOrder(owner).Database.Handle, False, True);
        if (not VarIsNull(result)) and not (VarType(result) = varNull) and
            not (VarArrayDimCount(result) = 0) then begin
            Value := result[0];
            DisplayText := result[1];
//            s :=
//            ReasonEdit.Value := 'заява ' + Result[2] + ' ' + result[3][1] + '.' + result[4][1];
            ReasonEdit.Value := 'заява ' + Result[2] + ' ' + Copy(result[3], 1, 1) + '.' + Copy(result[4], 1, 1) + '.';
//            ReasonEdit.Value := 'заява ' + Copy(Trim(DisplayText), 1, pos(' ', Trim(DisplayText))) + Copy(Trim(DisplayText), pos(' ', Trim(DisplayText)) + 1, 1) + '.';
        end;

    except on e: Exception do begin
            qFErrorDialog('Неможливо завантажити довідник фізичних осіб! Виникла помилка: "' +
                e.Message + '"');

            exit;
        end;
    end;
end;

procedure TfrmPochasOrderAdd.btnAddClick(Sender: TObject);
var
    frm: TfrmPochasSmet;
    idx: integer;
begin
    frm := TfrmPochasSmet.Create(Self);
    if frm.ShowModal = mrOk then
    begin
        cxGrid1TableView1.DataController.RecordCount := cxGrid1TableView1.DataController.RecordCount + 1;
        idx := cxGrid1TableView1.DataController.RecordCount - 1;
        cxGrid1TableView1.DataController.Values[idx, 0] := frm.SmetaEdit.Value;
        cxGrid1TableView1.DataController.Values[idx, 1] := IntToStr(frm.kod_sm);
        cxGrid1TableView1.DataController.Values[idx, 2] := frm.SmetaEdit.DisplayText;
        if frm.cxCheckHour.Enabled then
            cxGrid1TableView1.DataController.Values[idx, 3] := frm.HoursEdit.Value
        else cxGrid1TableView1.DataController.Values[idx, 3] := Null;
        cxGrid1TableView1.DataController.FocusedRecordIndex := idx;
    end;
    frm.Free;
end;

procedure TfrmPochasOrderAdd.FormCreate(Sender: TObject);
var
    Present: TDateTime;
    Year, Month, Day: Word;

begin
    Present := Now;
    cxGrid1TableView1.Columns[0].DataBinding.ValueTypeClass := TcxStringValueType;
    cxGrid1TableView1.Columns[1].DataBinding.ValueTypeClass := TcxStringValueType;
    cxGrid1TableView1.Columns[2].DataBinding.ValueTypeClass := TcxStringValueType;
    cxGrid1TableView1.Columns[3].DataBinding.ValueTypeClass := TcxStringValueType;
    DecodeDate(Present, Year, Month, Day);
    if Month <= 8 then Year := Year - 1;
    DateBegEdit.Value := EncodeDate(Year, 9, 1);
    DateEndEdit.Value := EncodeDate(Year + 1, 8, 31);
    DSConsts.Database := TfrmPochasOrder(owner).Database;
    ReadTransaction.DefaultDatabase := TfrmPochasOrder(owner).Database;
end;

procedure TfrmPochasOrderAdd.btnDeleteClick(Sender: TObject);
begin
    cxGrid1TableView1.DataController.DeleteFocused;
end;

procedure TfrmPochasOrderAdd.btnEditClick(Sender: TObject);
var
    frm: TfrmPochasSmet;
    idx: integer;
begin
    if cxGrid1TableView1.DataController.FocusedRecordIndex = -1 then exit;
    idx := cxGrid1TableView1.DataController.FocusedRecordIndex;
    frm := TfrmPochasSmet.Create(Self);
    frm.SmetaEdit.Value := cxGrid1TableView1.DataController.Values[idx, 0];
    frm.SmetaEdit.DisplayText := cxGrid1TableView1.DataController.Values[idx, 2];
    frm.kod_sm := StrToInt(cxGrid1TableView1.DataController.Values[idx, 1]);
    frm.KodEdit.Value := frm.kod_sm;
    if VarIsNull(cxGrid1TableView1.DataController.Values[idx, 3]) then
    begin
        frm.HoursEdit.Value := Null;
        frm.HoursEdit.Blocked := True;
        frm.cxCheckHour.Checked := True;
    end
    else
    begin
        frm.HoursEdit.Value := cxGrid1TableView1.DataController.Values[idx, 3];
        frm.cxCheckHour.Checked := False;
        frm.HoursEdit.Blocked := False;
    end;

 //frm.HoursEdit.Value := cxGrid1TableView1.DataController.Values[idx, 3];
    if frm.ShowModal = mrOk then
    begin
        cxGrid1TableView1.DataController.Values[idx, 0] := frm.SmetaEdit.Value;
        cxGrid1TableView1.DataController.Values[idx, 1] := IntToStr(frm.kod_sm);
        cxGrid1TableView1.DataController.Values[idx, 2] := frm.SmetaEdit.DisplayText;
   //cxGrid1TableView1.DataController.Values[idx, 3] := frm.HoursEdit.Value;
        if VarIsNull(frm.HoursEdit.Value) then
        begin
            cxGrid1TableView1.DataController.Values[idx, 3] := Null;
            frm.HoursEdit.Blocked := True;
            frm.cxCheckHour.Checked := True;
        end
        else
        begin
            cxGrid1TableView1.DataController.Values[idx, 3] := frm.HoursEdit.Value;
            frm.cxCheckHour.Checked := False;
            frm.HoursEdit.Blocked := False;
        end

    end;
    frm.Free;
end;

procedure TfrmPochasOrderAdd.TypePochasEditOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    sp: TSprav;
begin
    sp := GetSprav('up\PochasType');
    if sp <> nil then
    begin
        sp.Input.Append;
        sp.Input.FieldValues['DBHandle'] := Integer(TfrmPochasOrder(owner).Database.Handle);
        sp.Input.FieldValues['FormStyle'] := fsNormal;
        sp.Input.Post;
        sp.Show;
        if (sp.Output <> nil) and (not sp.Output.IsEmpty) then
        begin
            Value := sp.Output['ID_POCHAS_TYPE'];
            DisplayText := sp.Output['POCHAS_TYPE_NAME'];
            zav_kaf := sp.Output['ZAV_KAF'];
        end;
        sp.Free;
    end;
end;

procedure TfrmPochasOrderAdd.cxGrid1TableView1KeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if key = VK_DELETE then btnDeleteClick(Self);
end;

procedure TfrmPochasOrderAdd.PostEditOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
begin
    Params.FormCaption := 'Довідник посад';
    Params.ShowMode := fsmSelect;
    Params.ShowButtons := [fbExit];
    Params.TableName := 'UP_POCHAS_POST_SELECT';
    Params.Fields := 'NAME_POST,ID_POST';
    Params.FieldsName := 'Назва посади';
    Params.KeyField := 'ID_POST';
    Params.ReturnFields := 'NAME_POST,ID_POST';
    Params.DBHandle := Integer(TfrmPochasOrder(Owner).Database.Handle);

    OutPut := TRxMemoryData.Create(self);

    if GetUnivSprav(Params, OutPut) then
    begin
        value := output['ID_POST'];
        DisplayText := VarToStr(output['NAME_POST']);
    end;
end;

function TfrmPochasOrderAdd.CheckSumHours: Boolean;
var
    i: Integer;
    SumHours: real;
    s: string;
    check: Boolean;
    Year_Beg, Year_End, Month, Day: Word;
    year_b, month_b, day_b, year_e, month_e, day_e: Integer;
    date_check: TDate;
begin
    check := True;
    SumHours := 0;
    S := '';

    for i := 0 to cxGrid1TableView1.DataController.Recordcount - 1 do
    begin
        if VarIsNull(cxGrid1TableView1.DataController.Values[i, 3])
            then SumHours := SumHours + 0
        else
            SumHours := SumHours + cxGrid1TableView1.DataController.Values[i, 3];
    end;
        {проверка на превышение часов}
    DSConsts.Close;

    DSConsts.SQLs.SelectSQL.Text := 'Select result_str, result_kod from Up_Check_Max_Pochas_Hours(:id_pochas_type, :Sum_hours)';
    DSConsts.ParamByName('id_pochas_type').AsVariant := TypePochasEdit.Value;
    DSConsts.ParamByName('Sum_Hours').AsFloat := SumHours;

    try
        DSConsts.Open;
        if (DSConsts['Result_Kod'] = 0) then
        begin
            MessageDlg(DSConsts['Result_Str'], mtError, [mbOk], 0);
            Result := false;
            exit;
        end
    except
        on E: Exception do
            ShowMessage(E.message);
    end;

    DecodeDate(VarToDateTime(DateBegEdit.Value), Year_Beg, Month, Day);
    year_b := Year_Beg;
    month_b := Month;
    day_b := Day;

    DecodeDate(VarToDateTime(DateEndEdit.Value), Year_End, Month, Day);
    year_e := Year_End;
    month_e := Month;
    day_e := Day;
    {If (Month <> 9) and (Day <> 1) then
    begin
        MessageDlg('Помилка: Період прийому з почасовою оплатою праці повинен починатися з 1 вересня!',mtError,[mbOk], 0);
        DateBegEdit.SetFocus;
        Result := False;
        exit;
    end;
    DecodeDate(VarToDateTime(DateEndEdit.Value), Year_End, Month, Day);
    year_e:=Year_End;
    month_e:=Month;
    day_e:=Day;
   { If (Month > 8) and (Day <> 31) then
    begin

        MessageDlg('Помилка: Період прийому з почасовою оплатою праці повинен закінчуватися 31 серпня!',mtError,[mbOk], 0);
        DateEndEdit.SetFocus;
        Result := False;
        exit;
    end;    }
    if (Year_End - Year_Beg) > 1 then
    begin
        agMessageDlg('Увага!', 'Помилка: Недопустимий період прийому з почасовою оплатою праці! Перевірте роки прийому!', mtError, [mbOk]);
        DateBegEdit.SetFocus;
        DateBegEdit.Highlight(true);
        Result := False;
        Exit;
    end;
    if ((year_e = year_b) and (month_b <= 8)) then
    begin
        date_check := EncodeDate(Year_e, 8, 31);
        if (DateEndEdit.Value > date_check) then
        begin
            agMessageDlg('Увага!', 'Помилка: Період прийому з почасовою оплатою праці повинен закінчуватися 31 серпня!', mtError, [mbOk]);
            DateEndEdit.SetFocus;
            DateEndEdit.Highlight(true);
            Result := False;
            Exit;
        end;
    end;

    if (year_e - year_b) = 1 then
    begin
        date_check := EncodeDate(Year_e + 1, 8, 31);
        if ((DateEndEdit.Value > date_check) and (month_b = 9)) then
        begin
            agMessageDlg('Увага!', 'Помилка: Період прийому з почасовою оплатою праці повинен закінчуватися 31 серпня!', mtError, [mbOk]);
            DateEndEdit.SetFocus;
            DateEndEdit.Highlight(true);
            Result := False;
            Exit;
        end;

        if (((month_e = month_b) and (day_e >= day_b)) or (month_e >= month_b)) then
        begin
            agMessageDlg('Увага', 'Помилка: Період почасовки більше навчального року!', mtError, [mbOk]);
            DateEndEdit.SetFocus;
            DateEndEdit.Highlight(true);
            Result := False;
            Exit;
        end;
    end;

    Result := check;
end;

end.
