unit PremiaFilterUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, ExtCtrls, Buttons, Mask, CheckEditUnit, ComCtrls,
    SpComboBox, DB, IBCustomDataSet, IBQuery, GoodFunctionsUnit, SpCommon;

type
    TPremiaFilterForm = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        ManPanel: TPanel;
        Label1: TLabel;
        FIOEdit: TEdit;
        PCardButton: TBitBtn;
        Label6: TLabel;
        Podrazd: TEdit;
        SelectPodrazdAndPostButton: TButton;
        Label11: TLabel;
        Post: TEdit;
        RadioButton1: TRadioButton;
        RadioButton2: TRadioButton;
        GroupPanel: TPanel;
        Edit1: TEdit;
        SelectDepartment: TButton;
        CheckBox2: TCheckBox;
        Label2: TLabel;
        BonusGroup: TRadioGroup;
        PercentEdit: TCheckEdit;
        SumEdit: TCheckEdit;
        SpComboBox1: TSpComboBox;
        TempQuery: TIBQuery;
        Label5: TLabel;
        BonusBox: TSpComboBox;
        TarCalc: TBitBtn;
        GroupBox1: TGroupBox;
        Label3: TLabel;
        SelectNumItemButton: TButton;
        NumItemEdit: TEdit;
        procedure BonusGroupClick(Sender: TObject);
        procedure RadioButton1Click(Sender: TObject);
        procedure CheckBox2Click(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure PCardButtonClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure SelectDepartmentClick(Sender: TObject);
        function CheckData: Boolean;
        procedure OkButtonClick(Sender: TObject);
        procedure SumEditKeyPress(Sender: TObject; var Key: Char);
        procedure TarCalcClick(Sender: TObject);
        procedure SelectPodrazdAndPostButtonClick(Sender: TObject);
        procedure SelectNumItemButtonClick(Sender: TObject);
        procedure FormShow(Sender: TObject);
        procedure NumItemEditKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
    private
    { Private declarations }

    public
        ID_Department: Integer;
        ID_PCARD: Integer;
        ID_MAN_MOVING: Integer;
        Order_Date: TDate;
        ID_ORDER: integer;
        ID_ORDER_TYPE: Integer;
    end;

var
    PremiaFilterForm: TPremiaFilterForm;

implementation

uses SpFormUnit, PersonalCommon, DepartmentsViewUnit, TextShablonsUnit,
    DtManBonusItemsUnit;

{$R *.dfm}

procedure TPremiaFilterForm.BonusGroupClick(Sender: TObject);
begin
    if BonusGroup.ItemIndex = 0
        then
    begin
        PercentEdit.Enabled := True;
        if Self.Visible then PercentEdit.SetFocus;
        SumEdit.Enabled := False;
        SumEdit.Text := '';
    end
    else
    begin
        PercentEdit.Enabled := False;
        SumEdit.Enabled := True;
        if Self.Visible = True then SumEdit.SetFocus;
        PercentEdit.Text := '';
    end;
end;

procedure TPremiaFilterForm.RadioButton1Click(Sender: TObject);
begin
    if RadioButton1.Checked
        then
    begin
        ManPanel.Visible := True;
        GroupPanel.Visible := False;
    end
    else
    begin
        ManPanel.Visible := False;
        GroupPanel.Visible := True;
    end;
end;

procedure TPremiaFilterForm.CheckBox2Click(Sender: TObject);
begin
    if CheckBox2.Checked
        then
    begin
        SpComboBox1.Enabled := True;
    end
    else
    begin
        SpComboBox1.Enabled := False;
        SpComboBox1.Prepare(-1, '');
    end;
end;

procedure TPremiaFilterForm.FormCreate(Sender: TObject);
begin

    BonusBox.Prepare(-1, '');
    SpComboBox1.Prepare(-1, '');

    ID_Department := -1;
    ID_PCARD := -1;
    ID_MAN_MOVING := -1;

    TempQuery.Transaction := PersonalCommon.ReadTransaction;
end;

procedure TPremiaFilterForm.PCardButtonClick(Sender: TObject);
var
    ID_SHTATRAS: Integer;
    new_id_pcard: Integer;
begin
    new_id_pcard := GoodfunctionsUnit.getpcard(0);

    if new_id_pcard <> -1 then
    begin
                // Если мы выбрали другого человека, то нужно обнулить мувинг, если тот выбран
        if (ID_PCARD <> -1) and (ID_PCARD <> new_id_pcard) then
        begin
            ID_MAN_MOVING := -1;
            Podrazd.Text := '';
            Post.Text := '';
            SelectPodrazdAndPostButton.Enabled := True;
        end;
        Id_PCard := new_id_pcard;
        FIOEdit.Text := GoodFunctionsUnit.Fam;
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
            Podrazd.Text := TempQuery['NAME_FULL'];
            Post.Text := TempQuery['NAME_POST'];
        end;
    end;
end;

procedure TPremiaFilterForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    BonusBox.SaveIntoRegistry;
    SpComboBox1.SaveIntoRegistry;
    if FormStyle = fsMDIChild then
        Action := caFree;
end;

procedure TPremiaFilterForm.SelectDepartmentClick(Sender: TObject);
var
    form: TDepartmentsViewForm;
begin
    form := TDepartmentsViewForm.Create(Self);
    form.Prepare(True, Order_Date);
    form.CanSelectRoot := True;
    if form.ShowModal = mrOk then
        with form do
        begin
            Id_Department := Selected_Id;
            Edit1.Text := ResultQuery['Name_Short'];
        end;
    form.Free;
end;

function TPremiaFilterForm.CheckData: Boolean;
begin
    CheckData := False;
    if BonusBox.GetId = -1 then
    begin
        if (id_ordeR_type = 17) then MessageDlg('Необхідно вибрати тип премії!', mtError, [mbOk], 0);
        if (id_ordeR_type = 21) then MessageDlg('Необхідно вибрати тип мат. допомоги!', mtError, [mbOk], 0);
        BonusBox.SetFocus;
    end
    else if (NumItemEdit.Text = '') then
    begin
        MessageDlg('Треба вибрати пункт наказу!', mtError, [mbOk], 0);
    end
    else if (BonusGroup.ItemIndex = 0) and (PercentEdit.Text = '') then
    begin
        MessageDlg('Треба ввести кілкість процентів.', mtError, [mbOk], 0);
        BonusGroupClick(nil);
    end
    else if (BonusGroup.ItemIndex = 1) and (SumEdit.Text = '') then
    begin
        MessageDlg('Треба ввести сумму.', mtError, [mbOk], 0);
        BonusGroupClick(nil);
    end
    else if (RadioButton1.Checked) and (ID_MAN_MOVING = -1) then
    begin
        MessageDlg('Треба вибрати працівника а також місце і підрозділ де він працює.', mtError, [mbOk], 0);
    end
    else if (RadioButton2.Checked) and (ID_DEPARTMENT = -1) then
    begin
        MessageDlg('Треба вибрати підрозділ.', mtError, [mbOk], 0);
    end
    else if (RadioButton2.Checked) and (CheckBox2.Checked) and (SpComboBox1.GetId = -1) then
    begin
        MessageDlg('Треба вибрати категорію.', mtError, [mbOk], 0);
    end
    else
        CheckData := True;
end;

procedure TPremiaFilterForm.OkButtonClick(Sender: TObject);
begin
    if not CheckData then ModalResult := mrNone;
end;

procedure TPremiaFilterForm.SumEditKeyPress(Sender: TObject;
    var Key: Char);
begin
    if (Pos(SumEdit.Text, ',') <> 0) and (Key <> #08) then Key := #0;
    if Key = '.' then Key := ',';
end;

procedure TPremiaFilterForm.TarCalcClick(Sender: TObject);
var
    percent: Double;
begin
    try
        PercentEdit.Text := StringReplace(PercentEdit.Text, '.', DecimalSeparator, []);
        PercentEdit.Text := StringReplace(PercentEdit.Text, ',', DecimalSeparator, []);
        percent := StrToFloat(PercentEdit.Text);
    except
        Exit;
    end;

    if Id_Man_Moving = -1 then
    begin
        MessageDlg('Потрібно вибрати людину!', mtError, [mbOk], 0);
        Exit;
    end;

    TempQuery.Close;
    TempQuery.SQL.Text := 'SELECT Summa FROM Calc_Proc_Avg_Tarif(' +
        IntToStr(Id_Man_Moving) + ',' + FloatToStr(percent) + ',''' +
        DateToStr(Order_Date) + ''')';
    TempQuery.Open;
    if not VarIsNull(TempQuery['Summa']) then
    begin
        BonusGroup.ItemIndex := 1;
        SumEdit.Text := FloatToStr(Round(TempQuery['Summa']));
    end;
end;

procedure TPremiaFilterForm.SelectPodrazdAndPostButtonClick(
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
            Podrazd.Text := temp.ResultQuery['NAME_DEPARTMENT_FULL'];
            Post.Text := temp.ResultQuery['POST'];
        end;
        temp.free;
    end;

end;

procedure TPremiaFilterForm.SelectNumItemButtonClick(Sender: TObject);
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

procedure TPremiaFilterForm.FormShow(Sender: TObject);
var
    id_vidopl_prop: Integer;

begin
    if id_order_type = 17
        then
    begin
        BonusBox.SpParams.SelectProcName := 'Sp_VidOpl_Select(501)';
        Id_Vidopl_Prop := 501;
    end;

    if id_order_type = 21
        then
    begin
        BonusBox.SpParams.SelectProcName := 'Sp_VidOpl_Select(701)';
        Id_Vidopl_Prop := 701;
        Caption := 'Додавання мат. допомог';
        Label2.Caption := 'Мат. допомога';
        BonusGroup.Caption := 'Мат. допомога';
    end;
{
        BonusBox.ItemIndex := 1;

        While BonusBox.ItemIndex < BonusBox.ItemCount
        do begin
            TempQuery.Close;
            TempQuery.SQL.Text := 'SELECT ID_VIDOPL FROM VIDOPL_PROPERTIES WHERE ID_VIDOPL_PROP = ' +
                                    IntToStr(id_vidopl_prop) +
                                    ' and ID_VIDOPL = ' +
                                    IntToStr(BonusBox.GetId);
            TempQuery.Open;

            if TempQuery.IsEmpty
                then begin
                    BonusBox.Items.Delete(BonusBox.ItemIndex);
                    BonusBox.ItemCount := BonusBox.ItemCount - 1;
                    BonusBox.ItemIndex := BonusBox.ItemIndex + 1;
                end;

            BonusBox.ItemIndex := BonusBox.ItemIndex + 1;

        end;
}
end;

procedure TPremiaFilterForm.NumItemEditKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if (ssCtrl in Shift) and (Key = VK_RETURN) then
        SelectNumItemButton.Click;
end;

end.
