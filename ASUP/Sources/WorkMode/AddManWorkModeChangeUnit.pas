unit AddManWorkModeChangeUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ComCtrls, StdCtrls, Buttons, Spin, SpComboBox, ExtCtrls, GoodFunctionsUnit,
    DB, IBCustomDataSet, IBQuery, PersonalCommon, SpFormUnit, SpCommon, Grids,
    uFControl, uLabeledFControl, uSpravControl;

type
    TAddManWorkModeChangeForm = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        Panel1: TPanel;
        Label1: TLabel;
        FIO: TEdit;
        Label5: TLabel;
        DepartmentName: TEdit;
        Label11: TLabel;
        PostName: TEdit;
        SelectPodrazdAndPostButton: TButton;
        SelectPersonButton: TSpeedButton;
        GroupBox2: TGroupBox;
        RadioButton1: TRadioButton;
        RadioButton2: TRadioButton;
        DateBeg: TDateTimePicker;
        Label2: TLabel;
        Label3: TLabel;
        DateEnd: TDateTimePicker;
        WorkModeBox: TSpComboBox;
        Label4: TLabel;
        ShiftSpin: TSpinEdit;
        Label6: TLabel;
        Label7: TLabel;
        Label8: TLabel;
        WhyEdit: TEdit;
        PidstavaEdit: TEdit;
        Label9: TLabel;
        TempQuery: TIBQuery;
        GroupBox1: TGroupBox;
        Label10: TLabel;
        SelectNumItemButton: TButton;
        NumItemEdit: TEdit;
        WorkModeGrid: TStringGrid;
        Hospital: TqFSpravControl;
        EndLabel: TLabel;
        IsHospital: TCheckBox;
        UseKolStavokBox: TCheckBox;
        procedure SelectPersonButtonClick(Sender: TObject);
        procedure SelectPodrazdAndPostButtonClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure FormShow(Sender: TObject);
        procedure SelectNumItemButtonClick(Sender: TObject);
        procedure DateBegChange(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure RadioButton1Click(Sender: TObject);
        procedure HospitalOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure HospitalChange(Sender: TObject);
        procedure IsHospitalClick(Sender: TObject);
    private
    { Private declarations }
    public
        ID_PCARD: Integer;
        ID_MAN_MOVING: Integer;
        Id_Order: Integer;
        Order_Date, Hosp_Date_End: TDate;

        FMode: TEditMode;
        RealShift: Integer;
    end;

var
    AddManWorkModeChangeForm: TAddManWorkModeChangeForm;

implementation

uses DtManBonusItemsUnit, uCommonSp;

{$R *.dfm}

procedure TAddManWorkModeChangeForm.SelectPersonButtonClick(
    Sender: TObject);
var
    ID_SHTATRAS: Integer;
    new_id_pcard: Integer;
begin
    new_id_pcard := GoodfunctionsUnit.getpcard(Order_DAte);

    if new_id_pcard <> -1 then
    begin

        // Если мы выбрали другого человека, то нужно обнулить мувинг, если тот выбран
        if (ID_PCARD <> -1) and (ID_PCARD <> new_id_pcard) then
        begin
            ID_MAN_MOVING := -1;
            DepartmentName.Text := '';
            PostName.Text := '';
            SelectPodrazdAndPostButton.Enabled := True;
        end;

        Id_PCard := new_id_pcard;
        FIO.Text := GoodFunctionsUnit.Fam;
        //Проверяем, если есть только один мувинг, то проставляем его автоматически!
        TempQuery.Close;
        TempQuery.SQL.Text := 'SELECT ID_MAN_MOVING, ID_SHTATRAS FROM GET_CUR_MOVING_BY_ID_PCARD(' + IntToStr(Id_PCard) + ',' + QuotedStr(DateToStr(Order_Date)) + ')';
        TempQuery.Open;
        TempQuery.FetchAll;

        if TempQuery.RecordCount = 1 then
        begin

            SelectPodrazdAndPostButton.Enabled := False;
            Id_Man_Moving := TempQuery['ID_MAN_MOVING'];
            ID_SHTATRAS := TempQuery['ID_SHTATRAS'];
            TempQuery.Close;
            TempQuery.SQL.Text := 'SELECT NAME_FULL, NAME_POST ' +
                'FROM   DT_SHTATRAS S, SP_DEPARTMENT D, SP_POST P ' +
                'WHERE  S.Id_Shtatras = ' + IntToStr(ID_SHTATRAS) +
                'AND    S.Id_Department = D.Id_Department ' +
                'and    s.Id_Post = p.Id_Post ' +
                'and    (CURRENT_TIMESTAMP between s.Use_Beg and s.Use_End) ' +
                'and    (CURRENT_TIMESTAMP between d.Use_Beg and d.Use_End)';
            TempQuery.Open;
            DepartmentName.Text := TempQuery['NAME_FULL'];
            PostName.Text := TempQuery['NAME_POST'];

        end;
    end;
end;

procedure TAddManWorkModeChangeForm.SelectPodrazdAndPostButtonClick(
    Sender: TObject);
var
    temp: TSpForm;
    params: TSpParams;
begin
    if Id_Pcard = -1 then
        MessageDlg('Потрібно спочатку вибрати працівника!', mtError, [mbOk], 0)
    else
    begin
        temp := TSpForm.Create(Self);
        params := TSpParams.Create;
        params.IdField := 'ID_MAN_MOVING';
        params.SpFields := 'NAME_DEPARTMENT_FULL, POST, DATE_BEG, DATE_END';
        params.Title := 'Виберіть підрозділ та посаду';
        params.ColumnNames := 'Підрозділ,Посада, Дата початку,Дата кінця';
        params.ReadOnly := True;
        params.Table := 'GET_PCARD_MOVINGS(' + IntToStr(Id_Pcard) + ',''' + DateToStr(Order_Date) + ''')';
        params.SpMode := spmSelect;
        temp.Init(params);
        temp.ShowModal;

        if temp.ModalResult = mrOk then
        begin
            Id_Man_Moving := temp.ResultQuery['ID_MAN_MOVING'];
            DepartmentName.Text := temp.ResultQuery['NAME_DEPARTMENT_FULL'];
            PostName.Text := temp.ResultQuery['POST'];
        end;

        temp.free;
    end;
end;

procedure TAddManWorkModeChangeForm.FormCreate(Sender: TObject);
begin
    TempQuery.Transaction := ReadTransaction;
    WorkModeBox.LoadFromRegistry;
end;

procedure TAddManWorkModeChangeForm.OkButtonClick(Sender: TObject);
begin
    if (not (CheckForFillBool((id_pcard <> -1), 'Виберіть робітника!')) or
        not (CheckForFillBool((ID_MAN_MOVING <> -1), 'Виберіть підрозділ та посаду, де працює робітник!')) or
        not (CheckForFillBool((DateBeg.Date <= DateEnd.Date), 'Дата кінця повинна бути не меньш дати початку!')) or
        (not CheckForFill(WorkModeBox, 'новий графік роботи')) or
        (not CheckForFill(WhyEdit, 'причина зміни графіка')) or
        (not CheckForFill(PidstavaEdit, 'підстава для зміни графіка')) or
        (not CheckForFill(NumItemEdit, 'пункт наказу')))
        then exit;

    if (IsHospital.Checked) and (VarIsNull(Hospital.Value)) then
    begin
        ErrMsg('Треба вибрати листок непрацездатності!');
        Hospital.SetFocus;
        exit;
    end;

    ModalResult := mrOk;
end;

procedure TAddManWorkModeChangeForm.FormShow(Sender: TObject);
begin
    if FMode = emNew
        then
    begin
        Id_Man_Moving := -1;
        Id_PCard := -1;
        DateBeg.Date := Order_Date;
        DateEnd.Date := Order_Date;
    end;

    if FMode = emView
        then Panel1.Enabled := False;
end;

procedure TAddManWorkModeChangeForm.SelectNumItemButtonClick(
    Sender: TObject);
var
    form: TDtManBonusItemsForm;
begin
    Form := TDtManBonusItemsForm.Create(self);
    Form.id_order := ID_ORDER;
    Form.aID_TYPE := 1;

    Form.Prepare;

    if Form.ShowModal = mrOk
        then
    begin
        NumItemEdit.Text := IntToStr(form.ResultQueryNUM_ITEM.Value);
    end;

    Form.Free;
end;

procedure TAddManWorkModeChangeForm.DateBegChange(Sender: TObject);
begin
    if (WorkModeBox.GetId <> -1) and (DateBeg.Date <= DateEnd.Date)
        then RealShift := DrawWorkModeExample(WorkModeGrid, DateBeg.Date, DateEnd.Date, WorkModeBox.GetId, ShiftSpin.Value, 9);
end;

procedure TAddManWorkModeChangeForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    WorkModeBox.SaveIntoRegistry;
end;

procedure TAddManWorkModeChangeForm.RadioButton1Click(Sender: TObject);
begin
    if RadioButton1.Checked
        then
    begin
        DateEnd.Date := PersonalCommon.Consts_Query['DATE_END'];
        DateEnd.Visible := False;
        Label3.Visible := False;
    end
    else
    begin
        DateEnd.Date := DateBeg.Date;
        DateEnd.Visible := True;
        Label3.Visible := True;
    end;
end;

procedure TAddManWorkModeChangeForm.HospitalOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    sp: TSprav;
begin
        // создать справочник
    sp := GetSprav('Asup\AsupHospital');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(FibDatabase.Handle);
            FieldValues['Select'] := 1;
            FieldValues['NewVersion'] := PersonalCommon.NewVersion;
            Post;
        end;
                // показать справочник и проанализировать результат
        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['Id_Man_Hosp'];
            DisplayText := sp.Output['DisplayText'];
            DateBeg.Date := sp.Output['Date_Beg'];
            DateEnd.Date := sp.Output['Date_End'];
        end;
        sp.Free;
    end;
end;

procedure TAddManWorkModeChangeForm.HospitalChange(Sender: TObject);
begin
    DateEnd.Visible := VarIsNull(Hospital.Value);
    EndLabel.Visible := not VarIsNull(Hospital.Value);
    RadioButton1.Enabled := VarIsNull(Hospital.Value);
end;

procedure TAddManWorkModeChangeForm.IsHospitalClick(Sender: TObject);
begin
    if not IsHospital.Checked then
    begin
        Hospital.DisplayText := '';
        Hospital.Value := Null;
    end;
end;

end.
