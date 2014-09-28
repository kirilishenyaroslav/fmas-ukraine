unit UpPochasChangeEdit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uSpravControl, uDateControl, uFControl,
    uLabeledFControl, uCharControl, uIntControl, uFormControl, uInvisControl,
    uBoolControl, uMemoControl, StdCtrls, cxStyles, cxCustomData,
    cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxMemo,
    cxLookAndFeelPainters, cxButtons, cxGridTableView, cxGridLevel,
    cxGridCustomTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
    pFIBDataSet, AllPeopleUnit, UpPochasChangeMain, RxMemDS, uCommonSp, uUnivSprav,
    UpPochasChangeSmetAdd, Buttons, BaseTypes, qfTools, cxLabel, pFibStoredProc,
    cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
    ExtCtrls;

type
    TFormPochasChangeEdit = class(TForm)
        GroupBox1: TGroupBox;
        TarifEdit: TqFSpravControl;
        ManEdit: TqFSpravControl;
        DepEdit: TqFSpravControl;
        TypePochasEdit: TqFSpravControl;
        NoteEdit: TqFMemoControl;
        ReasonEdit: TqFCharControl;
        PostEdit: TqFSpravControl;
        PochasEdit: TqFSpravControl;
        cxGridSmet: TcxGrid;
        cxGridSmetTableView: TcxGridTableView;
        col_Id_smeta: TcxGridColumn;
        col_Kod_Smeta: TcxGridColumn;
        col_Name_Smeta: TcxGridColumn;
        col_Hours: TcxGridColumn;
        cxGridSmetLevel: TcxGridLevel;
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
        btnEditSmet: TcxButton;
        GroupBox2: TGroupBox;
        col_Change_Hours: TcxGridColumn;
        btnAddSmet: TcxButton;
        btnDelSmet: TcxButton;
        col_Result: TcxGridColumn;
        btnOk: TBitBtn;
        btnCancel: TBitBtn;
        cxDateBegEdit: TcxDateEdit;
        lblDateBeg: TcxLabel;
        lblDateEnd: TcxLabel;
        cxDateEndEdit: TcxDateEdit;
        Panel1: TPanel;
        cxDateChange: TcxDateEdit;
        lblDateChange: TcxLabel;
        procedure ManEditOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure PochasEditOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure DepEditOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure PostEditOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure TypePochasEditOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure TarifEditOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure FormCreate(Sender: TObject);
        procedure btnEditSmetClick(Sender: TObject);
        procedure btnAddSmetClick(Sender: TObject);
        procedure btnDelSmetClick(Sender: TObject);
        procedure btnOkClick(Sender: TObject);
        procedure ManEditChange(Sender: TObject);
        procedure PochasEditChange(Sender: TObject);

    private
        function CheckSumHours: Boolean;
    public
        id_pochas_plan_old: variant;
        id_pcard: variant;
        DateBegOld: TDate;
        DateEndOld: TDate;
        procedure ViewMode;
        procedure ClearSmets;
        procedure SelSmetsByPochas(aIdPochasPlan: Int64; Mode: Integer);
        procedure SelSmetsByItem(key_session: Integer; id_order_item: Int64);
    end;

var
    FormPochasChangeEdit: TFormPochasChangeEdit;

implementation

{$R *.dfm}

uses UpPochasChangeManInfo;

procedure TFormPochasChangeEdit.ManEditOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    Result: Variant;
    DSet: TpFIBDataSet;
begin
    try
        if VarIsNull(cxDateBegEdit.EditValue) then
        begin
            MessageDlg('Заповніть, будь ласка, дату початку періоду почасової оплати праці!', mtError, [mbOk], 0);
            cxDateBegEdit.SetFocus;
            exit;
        end;

        result := AllPeopleUnit.GetManForASUP(Self, TFormPochasChangeMain(owner).DB.Handle, False, True);
        if (not VarIsNull(result)) and not (VarType(result) = varNull) and
            not (VarArrayDimCount(result) = 0) then begin
            Value := result[0];
            DisplayText := result[1];
            PochasEdit.Blocked := False;
{Заява-то по-другому должна сочиняться}
           // ReasonEdit.Value := 'заява ' + Result[2] + ' ' + Copy(result[3], 1, 1) + '.' + Copy(result[4],1,1) + '.';

            try
                DSet := TpFIBDataSet.Create(nil);
                DSet.Database := TFormPochasChangeMain(owner).DB;
                DSet.Transaction := TFormPochasChangeMain(owner).ReadTransaction;

           // DSet.Transaction.StartTransaction;

                DSet.Close;
                DSet.SQLs.SelectSQL.Text := 'SELECT * FROM UP_GET_ID_PCARD_BY_ID_MAN(' + VarToStr(ManEdit.Value) +
                    ', ''' + DateToStr(Date) + ''')';
                DSet.Open;

                if DSet.IsEmpty then
                    id_pcard := null
                else id_pcard := DSet['ID_PCARD'];

                DSet.Close;
                DSet.Free;
            except on e: Exception do begin
                    MessageDlg('Виникла помилка: "' +
                        e.Message + '"', mtError, [mbOk], 0);
                    exit;
                end;
            end;
        end;
    except on e: Exception do begin
            MessageDlg('Неможливо завантажити довідник фізичних осіб! Виникла помилка: "' +
                e.Message + '"', mtError, [mbOk], 0);

            exit;
        end;
    end;
end;

procedure TFormPochasChangeEdit.PochasEditOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    frmPochasMan: TfrmPochasMan;
    str: string;
begin
    frmPochasMan := TfrmPochasMan.Create(Self);
    frmPochasMan.DSPochasMan.Close;
    frmPochasMan.DSPochasMan.SQLs.SelectSQL.Text := 'SELECT * FROM UP_GET_POCHAS_PLAN_BY_ID_MAN(' + VarToStr(ManEdit.Value) + ', ''' + DateToStr(cxDateBegEdit.Date) + ''')';
    frmPochasMan.DSPochasMan.Open;

    if not (VarIsNull(id_pochas_plan_old)) then
        frmPochasMan.DSPochasMan.Locate('ID_POCHAS_PLAN', id_pochas_plan_old, []);
    frmPochasMan.cxGrid1DBTableView1.ViewData.Expand(true);

    str := '';

    if frmPochasMan.ShowModal = mrOk then
    begin
        DepEdit.Value := frmPochasMan.DSPochasMan['ID_DEPARTMENT'];
        DepEdit.DisplayText := frmPochasMan.DSPochasMan.FieldByName('DEPARTMENT_NAME').AsString;
        DepEdit.Blocked := False;
        PostEdit.Value := frmPochasMan.DSPochasMan['ID_POST'];
        PostEdit.DisplayText := frmPochasMan.DSPochasMan.FieldByName('NAME_POST').AsString;
        PostEdit.Blocked := False;
        TypePochasEdit.Value := frmPochasMan.DSPochasMan['ID_POCHAS_TYPE'];
        TypePochasEdit.DisplayText := frmPochasMan.DSPochasMan.FieldByName('POCHAS_TYPE').AsString;
        TypePochasEdit.Blocked := False;
        TarifEdit.Value := frmPochasMan.DSPochasMan['ID_POCHAS_TARIF'];
        TarifEdit.DisplayText := frmPochasMan.DSPochasMan.FieldByName('TARIF_TYPE_NAME').AsString;
        TarifEdit.Blocked := False;
        cxDateBegEdit.EditValue := frmPochasMan.DSPochasMan['DATE_BEG'];
        cxDateEndEdit.EditValue := frmPochasMan.DSPochasMan['DATE_END'];

        btnAddSmet.Enabled := True;
        btnEditSmet.Enabled := True;
        btnDelSmet.Enabled := True;

        id_pochas_plan_old := frmPochasMan.DSPochasMan['ID_POCHAS_PLAN'];
        str := 'Наказ № ' + frmPochasMan.DSPochasMan.fbn('NUM_ORDER').AsString + ' від ' +
            DateToStr(frmPochasMan.DSPochasMan.fbn('DATE_ORDER').AsDateTime) + ' (проект № ' +
            frmPochasMan.DSPochasMan.fbn('NUM_PROJECT').AsString + ' від ' +
            DateToStr(frmPochasMan.DSPochasMan.fbn('DATE_PROJECT').AsDateTime) +
            '):  ' + FloatToStr(frmPochasMan.DSPochasMan.fbn('HOURS').AsFloat) + ' годин погодинної праці';

        DisplayText := str;
        Value := id_pochas_plan_old;

        DateBegOld := frmPochasMan.DSPochasMan['DATE_BEG'];
        DateEndOld := frmPochasMan.DSPochasMan['DATE_END'];

        ClearSmets;
        try
            SelSmetsByPochas(id_pochas_plan_old, 1);
        except on E: Exception do
                Showmessage(E.Message);
        end;
    end;
    frmPochasMan.Free;

end;

procedure TFormPochasChangeEdit.DepEditOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    sp: TSprav;
begin
    sp := GetSprav('SpDepartment');
    if sp <> nil then
    begin
        sp.Input.Append;
        sp.Input.FieldValues['DBHandle'] := Integer(TFormPochasChangeMain(owner).DB.Handle);
        sp.Input.FieldValues['Select'] := 1;
        sp.Input.FieldValues['ShowStyle'] := 0;
        sp.Input.Post;
        sp.Show;
        if (sp.Output <> nil) and (not sp.Output.IsEmpty) then
        begin
            if (Value <> sp.Output['ID_DEPARTMENT'])
                then ClearSmets;
            Value := sp.Output['ID_DEPARTMENT'];
            DisplayText := sp.Output['NAME_FULL'];
        end;
        sp.Free;
    end;
end;

procedure TFormPochasChangeEdit.PostEditOpenSprav(Sender: TObject;
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
    Params.DBHandle := Integer(TFormPochasChangeMain(owner).DB.Handle);

    OutPut := TRxMemoryData.Create(self);

    if GetUnivSprav(Params, OutPut) then
    begin
        if (value <> output['ID_POST']) then
            ClearSmets;
        value := output['ID_POST'];
        DisplayText := VarToStr(output['NAME_POST']);
    end;
    OutPut.Free;
end;

procedure TFormPochasChangeEdit.TypePochasEditOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    sp: TSprav;
begin
    sp := GetSprav('Up\PochasType');
    if sp <> nil then
    begin
        sp.Input.Append;
        sp.Input.FieldValues['DBHandle'] := Integer(TFormPochasChangeMain(owner).DB.Handle);
        sp.Input.FieldValues['FormStyle'] := fsNormal;
        sp.Input.Post;
        sp.Show;
        if (sp.Output <> nil) and (not sp.Output.IsEmpty) then
        begin
            if (Value <> sp.Output['ID_POCHAS_TYPE']) then
                ClearSmets;
            Value := sp.Output['ID_POCHAS_TYPE'];
            DisplayText := sp.Output['POCHAS_TYPE_NAME'];
// а нужна ли нам здесь проверка на завкафа?
     //zav_kaf :=sp.Output['ZAV_KAF'];
        end;
        sp.Free;
    end;
end;

procedure TFormPochasChangeEdit.TarifEditOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    sp: TSprav;
begin
    if VarIsNull(cxDateBegEdit.EditValue) then
    begin
        ShowMessage('Вкажіть дату початку');
        cxDateBegEdit.SetFocus;
        exit;
    end;
    sp := GetSprav('Up\PochasTarif');
    if sp <> nil then
    begin
        sp.Input.Append;
        sp.Input.FieldValues['DBHandle'] := Integer(TFormPochasChangeMain(owner).DB.Handle);
        sp.Input.FieldValues['FormStyle'] := fsNormal;
        sp.Input.FieldValues['DateFlt'] := cxDateBegEdit.EditValue;
        sp.Input.Post;
        sp.Show;
        if (sp.Output <> nil) and (not sp.Output.IsEmpty) then
        begin
            {* Не очищаем сметы при изменении тарифа, иначе нужно добавлять заново,
               причем пользователю необходимо правильно расставить часы и сметы.
               Пусть лучше при необходимости редактирует, то что уже есть. *}
           { if (Value <> sp.Output['ID_POCHAS_TARIF']) then
                ClearSmets;  }
            Value := sp.Output['ID_POCHAS_TARIF'];
            DisplayText := sp.Output['TARIF'];
        end;
        sp.Free;
    end;
end;

procedure TFormPochasChangeEdit.ClearSmets;
var
    idx: Integer;
begin
    if cxGridSmetTableView.DataController.RecordCount < 0 then exit;
    idx := cxGridSmetTableView.DataController.RecordCount - 1;
    while idx >= 0 do
    begin
        cxGridSmetTableView.DataController.FocusedRecordIndex := idx;
        cxGridSmetTableView.DataController.DeleteFocused;
        idx := idx - 1;
    end;
end;

procedure TFormPochasChangeEdit.SelSmetsByPochas(aIdPochasPlan: Int64; Mode: Integer);
var
    DSet: TpFIBDataSet;
    idx: Integer;
begin
    if aIdPochasPlan = -1 then
        ClearSmets
    else
    begin
        DSet := TpFIBDataSet.Create(nil);
        DSet.Database := TFormPochasChangeMain(owner).DB;
        DSet.Transaction := TFormPochasChangeMain(owner).ReadTransaction;
        DSet.Transaction.StartTransaction;
        if Mode = 1 then
        begin
            DSet.Close;
            DSet.SQLs.SelectSQL.Text := 'SELECT * FROM UP_GET_POCHAS_PLAN_SMET_DETAIL(' + IntToStr(aIdPochasPlan) + ')';
            DSet.Open;

            DSet.First;
            while not DSet.Eof do
            begin
                cxGridSmetTableView.DataController.RecordCount := cxGridSmetTableView.DataController.RecordCount + 1;
                idx := cxGridSmetTableView.DataController.RecordCount - 1;

                cxGridSmetTableView.DataController.Values[idx, 0] := DSet['ID_SM'];
                cxGridSmetTableView.DataController.Values[idx, 1] := DSet['KOD_SM'];
                cxGridSmetTableView.DataController.Values[idx, 2] := DSet['SM_TITLE'];
                cxGridSmetTableView.DataController.Values[idx, 3] := DSet['HOURS'];
                cxGridSmetTableView.DataController.Values[idx, 4] := 0;
                cxGridSmetTableView.DataController.Values[idx, 5] := DSet['HOURS'];
                cxGridSmetTableView.DataController.FocusedRecordIndex := idx;

                DSet.Next;
            end;
        end;
        DSet.Close;
        DSet.Free;
    end;
end;

procedure TFormPochasChangeEdit.FormCreate(Sender: TObject);
begin
    cxGridSmetTableView.Columns[0].DataBinding.ValueTypeClass := TcxStringValueType;
    cxGridSmetTableView.Columns[1].DataBinding.ValueTypeClass := TcxStringValueType;
    cxGridSmetTableView.Columns[2].DataBinding.ValueTypeClass := TcxStringValueType;
    cxGridSmetTableView.Columns[3].DataBinding.ValueTypeClass := TcxStringValueType;
    cxGridSmetTableView.Columns[4].DataBinding.ValueTypeClass := TcxStringValueType;
    cxGridSmetTableView.Columns[5].DataBinding.ValueTypeClass := TcxStringValueType;
end;

procedure TFormPochasChangeEdit.btnEditSmetClick(Sender: TObject);
var
    frmSmet: TFormAddSmet;
    idx: integer;
begin
    if cxGridSmetTableView.DataController.RecordCount = 0 then
        exit;
    idx := cxGridSmetTableView.DataController.FocusedRecordIndex;
    frmSmet := TFormAddSmet.Create(Self);
    frmSmet.pFIBStoredProc.Database := TFormPochasChangeMain(owner).DB;
    frmSmet.pFIBStoredProc.Transaction := TFormPochasChangeMain(owner).ReadTransaction;
    if VarIsNull(cxDateBegEdit.EditValue) then
        frmSmet.DateBeg := Date
    else
        frmSmet.DateBeg := cxDateBegEdit.Date;

    frmSmet.SmetaEdit.Value := cxGridSmetTableView.DataController.Values[idx, 0];
    frmSmet.SmetaEdit.DisplayText := cxGridSmetTableView.DataController.Values[idx, 2];
    frmSmet.kod_sm := StrToInt(cxGridSmetTableView.DataController.Values[idx, 1]);
    frmSmet.KodEdit.Value := frmSmet.kod_sm;
    if VarIsNull(cxGridSmetTableView.DataController.Values[idx, 3]) then
        frmSmet.AllEdit.Value := 0
    else
        frmSmet.AllEdit.Value := cxGridSmetTableView.DataController.Values[idx, 3];
    frmSmet.ChangeEdit.Value := cxGridSmetTableView.DataController.Values[idx, 4];
    frmSmet.ResultEdit.Value := cxGridSmetTableView.DataController.Values[idx, 5];

    if frmSmet.ShowModal = mrOk then
    begin
        cxGridSmetTableView.DataController.Values[idx, 0] := frmSmet.SmetaEdit.Value;
        cxGridSmetTableView.DataController.Values[idx, 1] := IntToStr(frmSmet.kod_sm);
        cxGridSmetTableView.DataController.Values[idx, 2] := frmSmet.SmetaEdit.DisplayText;
        cxGridSmetTableView.DataController.Values[idx, 3] := frmSmet.AllEdit.Value;
        cxGridSmetTableView.DataController.Values[idx, 4] := frmSmet.ChangeEdit.Value;
        cxGridSmetTableView.DataController.Values[idx, 5] := frmSmet.ResultEdit.Value;
    end;
    frmSmet.Free;
end;

procedure TFormPochasChangeEdit.ViewMode;
begin
    cxDateBegEdit.Enabled := False;
    cxDateEndEdit.Enabled := False;
    DepEdit.Blocked := True;
    ManEdit.Blocked := True;
    NoteEdit.Blocked := True;
    PochasEdit.Blocked := True;
    PostEdit.Blocked := True;
    ReasonEdit.Blocked := True;
    TarifEdit.Blocked := True;
    TypePochasEdit.Blocked := True;

    btnAddSmet.Enabled := False;
    btnEditSmet.Enabled := False;
    btnDelSmet.Enabled := False;
end;

procedure TFormPochasChangeEdit.SelSmetsByItem(key_session: Integer; id_order_item: Int64);
var
    DSet: TpFIBDataSet;
    idx: Integer;
begin
    DSet := TpFIBDataSet.Create(nil);
    DSet.Database := TFormPochasChangeMain(owner).DB;
    DSet.Transaction := TFormPochasChangeMain(owner).ReadTransaction;

    DSet.Close;
    DSet.SQLs.SelectSQL.Text := 'SELECT * FROM UP_DT_POCHAS_PLAN_CHANGE_S(' + IntToStr(id_order_item) +
        ', ' + IntToStr(key_session) + ')';
    DSet.Open;

    DSet.First;
    while not DSet.Eof do
    begin
        cxGridSmetTableView.DataController.RecordCount := cxGridSmetTableView.DataController.RecordCount + 1;
        idx := cxGridSmetTableView.DataController.RecordCount - 1;

        cxGridSmetTableView.DataController.Values[idx, 0] := DSet['ID_SM'];
        cxGridSmetTableView.DataController.Values[idx, 1] := DSet['KOD_SM'];
        cxGridSmetTableView.DataController.Values[idx, 2] := DSet['SM_TITLE'];
        cxGridSmetTableView.DataController.Values[idx, 3] := DSet['ALL_HOURS'];
        cxGridSmetTableView.DataController.Values[idx, 4] := DSet['CHANGE_HOURS'];
        cxGridSmetTableView.DataController.Values[idx, 5] := DSet['RESULT_HOURS'];
        cxGridSmetTableView.DataController.FocusedRecordIndex := idx;

        DSet.Next;
    end;

    DSet.Close;
    DSet.Free;
end;

procedure TFormPochasChangeEdit.btnAddSmetClick(Sender: TObject);
var
    frmSmet: TFormAddSmet;
    idx: integer;
begin
    frmSmet := TFormAddSmet.Create(Self);
    frmSmet.pFIBStoredProc.Database := TFormPochasChangeMain(owner).DB;
    frmSmet.pFIBStoredProc.Transaction := TFormPochasChangeMain(owner).ReadTransaction;
    if VarIsNull(cxDateBegEdit.EditValue) then
        frmSmet.DateBeg := Date
    else
        frmSmet.DateBeg := cxDateBegEdit.Date;

    frmSmet.AllEdit.Value := 0;
    frmSmet.ChangeEdit.Value := 0;
    frmSmet.ResultEdit.Value := 0;

    if frmSmet.ShowModal = mrOk then
    begin
        cxGridSmetTableView.DataController.RecordCount := cxGridSmetTableView.DataController.RecordCount + 1;
        idx := cxGridSmetTableView.DataController.RecordCount - 1;

        cxGridSmetTableView.DataController.Values[idx, 0] := frmSmet.SmetaEdit.Value;
        cxGridSmetTableView.DataController.Values[idx, 1] := IntToStr(frmSmet.kod_sm);
        cxGridSmetTableView.DataController.Values[idx, 2] := frmSmet.SmetaEdit.DisplayText;
        cxGridSmetTableView.DataController.Values[idx, 3] := frmSmet.AllEdit.Value;
        cxGridSmetTableView.DataController.Values[idx, 4] := frmSmet.ChangeEdit.Value;
        cxGridSmetTableView.DataController.Values[idx, 5] := frmSmet.ResultEdit.Value;
    end;
    frmSmet.Free;
end;

procedure TFormPochasChangeEdit.btnDelSmetClick(Sender: TObject);
begin
    cxGridSmetTableView.DataController.DeleteFocused;
end;

procedure TFormPochasChangeEdit.btnOkClick(Sender: TObject);
begin
  {  if VarIsNull(cxDateChange.EditValue) then
    begin
        agMessageDlg('Увага!', 'Необхідно заповнити поле "' + lblDateChange.Caption + '"!', mtError, [mbOk]);
        cxDateChange.SetFocus;
        Exit;
    end;
  }
  {  if ((cxDateChange.EditValue < cxDateBegEdit.EditValue) or
        (cxDateChange.EditValue > cxDateEndEdit.EditValue)) then
    begin
        agMessageDlg('Увага!', 'Дата зміни почасової оплати праці повинна належати поточному періоду почасовки!', mtError, [mbOk]);
        cxDateChange.SetFocus;
        Exit;
    end;
   }
    if cxDateBegEdit.EditValue > cxDateEndEdit.EditValue then
    begin
        agMessageDlg('Увага!', 'Дата кінця повинна бути більше дати початку!', mtError, [mbOk]);
        cxDateBegEdit.SetFocus;
        Exit;
    end;

    if (cxDateBegEdit.EditValue < DateBegOld) or (cxDateBegEdit.EditValue > (DateEndOld + 1)) then
    begin
        agMessageDlg('Увага!', 'Дата зміни почасової оплати праці повинна належати поточному періоду почасовки!', mtError, [mbOk]);
        cxDateBegEdit.SetFocus;
        Exit;
    end;

    if cxGridSmetTableView.DataController.RecordCount = 0 then
    begin
        agMessageDlg('Увага!', 'Вкажіть джерела фінансування!', mtError, [mbOk]);
        btnAddSmet.SetFocus;
        Exit;
    end;

    if qFCheckAll(Self) then if CheckSumHours then ModalResult := mrOk;
end;

function TFormPochasChangeEdit.CheckSumHours: Boolean;
var
    i: Integer;
    SumHours: real;
    s: string;
    check: Boolean;
    Year_Beg, Year_End, Month, Day: Word;
    year_b, month_b, day_b, year_e, month_e, day_e: Integer;
    date_check: TDate;
    DSConsts: TpFibDataSet;
begin
    check := True;
    SumHours := 0;
    S := '';

    for i := 0 to cxGridSmetTableView.DataController.Recordcount - 1 do
    begin
        if VarIsNull(cxGridSmetTableView.DataController.Values[i, 5])
            then SumHours := SumHours + 0
        else
            SumHours := SumHours + cxGridSmetTableView.DataController.Values[i, 5];
    end;
        {проверка на превышение часов}

    DSConsts := TpFIBDataSet.Create(nil);
    DSConsts.Database := TFormPochasChangeMain(owner).DB;
    DSConsts.Transaction := TFormPochasChangeMain(owner).ReadTransaction;

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

    DSConsts.Close;
    DSConsts.Free;

    DecodeDate(VarToDateTime(cxDateBegEdit.EditValue), Year_Beg, Month, Day);
    year_b := Year_Beg;
    month_b := Month;
    day_b := Day;

    DecodeDate(VarToDateTime(cxDateEndEdit.EditValue), Year_End, Month, Day);
    year_e := Year_End;
    month_e := Month;
    day_e := Day;
    {If (Month <> 9) and (Day <> 1) then
    begin
        MessageDlg('Помилка: Період прийому з почасовою оплатою праці повинен починатися з 1 вересня!',mtError,[mbOk], 0);
        cxDateBegEdit.SetFocus;
        Result := False;
        exit;
    end;
    DecodeDate(VarToDateTime(cxDateEndEdit.EditValue), Year_End, Month, Day);
    year_e:=Year_End;
    month_e:=Month;
    day_e:=Day;
   { If (Month > 8) and (Day <> 31) then
    begin

        MessageDlg('Помилка: Період прийому з почасовою оплатою праці повинен закінчуватися 31 серпня!',mtError,[mbOk], 0);
        cxDateEndEdit.SetFocus;
        Result := False;
        exit;
    end;    }
    if (Year_End - Year_Beg) > 1 then
    begin
        agMessageDlg('Увага!', 'Помилка: Недопустимий період прийому з почасовою оплатою праці! Перевірте роки прийому!', mtError, [mbOk]);
        cxDateBegEdit.SetFocus;
        Result := False;
        Exit;
    end;
    if ((year_e = year_b) and (month_b <= 8)) then
    begin
        date_check := EncodeDate(Year_e, 8, 31);
        if (cxDateEndEdit.Date > date_check) then
        begin
            agMessageDlg('Увага!', 'Помилка: Період прийому з почасовою оплатою праці повинен закінчуватися 31 серпня!', mtError, [mbOk]);
            cxDateEndEdit.SetFocus;
            Result := False;
            Exit;
        end;
    end;

    if (year_e - year_b) = 1 then
    begin
        date_check := EncodeDate(Year_e + 1, 8, 31);
        if ((cxDateEndEdit.Date > date_check) and (month_b = 9)) then
        begin
            agMessageDlg('Увага!', 'Помилка: Період прийому з почасовою оплатою праці повинен закінчуватися 31 серпня!', mtError, [mbOk]);
            cxDateEndEdit.SetFocus;
            Result := False;
            Exit;
        end;

        if (((month_e = month_b) and (day_e >= day_b)) or (month_e >= month_b)) then
        begin
            agMessageDlg('Увага', 'Помилка: Період почасовки більше навчального року!', mtError, [mbOk]);
            cxDateEndEdit.SetFocus;
            Result := False;
            Exit;
        end;
    end;

    Result := check;
end;

procedure TFormPochasChangeEdit.ManEditChange(Sender: TObject);
begin
    if VarIsNull(ManEdit.Value) then
    begin
        PochasEdit.Value := null;
        PochasEdit.Blocked := True;
        DepEdit.Value := null;
        DepEdit.Blocked := True;
        PostEdit.Value := null;
        PostEdit.Blocked := True;
        TypePochasEdit.Value := null;
        TypePochasEdit.Blocked := True;
        TarifEdit.Value := null;
        TarifEdit.Blocked := True;
        ClearSmets;
        btnAddSmet.Enabled := False;
        btnEditSmet.Enabled := False;
        btnDelSmet.Enabled := False;
    end;
end;

procedure TFormPochasChangeEdit.PochasEditChange(Sender: TObject);
begin
    if VarIsNull(PochasEdit.Value) then
    begin
        DepEdit.Value := null;
        DepEdit.Blocked := True;
        PostEdit.Value := null;
        PostEdit.Blocked := True;
        TypePochasEdit.Value := null;
        TypePochasEdit.Blocked := True;
        TarifEdit.Value := null;
        TarifEdit.Blocked := True;
        ClearSmets;
        btnAddSmet.Enabled := False;
        btnEditSmet.Enabled := False;
        btnDelSmet.Enabled := False;
    end;
end;

end.

