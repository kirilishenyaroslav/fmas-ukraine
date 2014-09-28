
unit uTableSelectFrame;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, ComCtrls, Spin, DB, IBCustomDataSet, IBQuery,
    PersonalCommon, DepartmentsViewUnit, Registry, DateUtils, ExtCtrls,
    uDepartmentGroup, GoodFunctionsUnit, SpCommon, uCommonDB;

type
    TfrmTableSelect = class(TFrame)
        OptionPageControl: TPageControl;
        DepartmentsPage: TTabSheet;
        DepartmentEdit: TEdit;
        DepartmentButton: TBitBtn;
        YearPanel: TPanel;
        YearCaptionLabel: TLabel;
        YearEdit: TSpinEdit;
        MonthCaptionLabel: TLabel;
        MonthBox: TComboBox;
        AcceptButton: TBitBtn;
        WorkersCaptionLabel: TLabel;
        PeopleLabel: TLabel;
        OneManPage: TTabSheet;
        FIOEdit: TEdit;
        PCardButton: TBitBtn;
        GroupPage: TTabSheet;
        GroupEdit: TEdit;
        GroupButton: TBitBtn;
        SignQuery: TIBQuery;
        SignInfo: TIBQuery;
        SignLabel: TLabel;
        TableTypeBox: TComboBox;
        IncludingBox: TCheckBox;
        SortBox: TComboBox;
        SortLabel: TLabel;
        SortLabel2: TLabel;
        SortLabel3: TLabel;
        procedure AcceptButtonClick(Sender: TObject);
        procedure DepartmentButtonClick(Sender: TObject);
        procedure FrameResize(Sender: TObject);
        procedure GroupButtonClick(Sender: TObject);
        procedure PCardButtonClick(Sender: TObject);
        procedure MonthBoxChange(Sender: TObject);
    private
    { Private declarations }
    public
        Kind: Integer;
        Id: Integer;
        Id_Department: Integer;
        Id_Group: Integer;
        Id_PCard: Integer;
        Year: Integer;
        Month: Integer;
        Days: Integer;
        Loaded: Boolean;
        Load_Signed: Boolean;
        Signed: Boolean;

        Id_Table_Group: Integer;

        Date_Beg: Variant;
        Date_End: Variant;

        TableQuery: TDataSet;

        procedure SaveState;
        procedure LoadState;
        procedure CopyState(frm: TfrmTableSelect);

        function Sign: Integer;
    end;

resourcestring
    sqlTable_Dept = 'SELECT * FROM Get_Table_People' +
        '(:Id_Department, :Month_Beg, :Month_End, :Including) ORDER BY :Order';
    sqlTable_Group = 'SELECT * FROM Get_Table_People_By_Group' +
        '(:Id_Group, :Month_Beg, :Month_End) ORDER BY :Order';
    sqlTable_PCard = 'SELECT * FROM Get_Table_People_By_PCard' +
        '(:Id_PCard, :Month_Beg, :Month_End) ORDER BY :Order';
    sqlTable_Signed = 'SELECT * FROM Get_Table_People_Signed' +
        '(:Kind, :Id, :Year, :Month) ORDER BY :Order';

implementation

uses Math, uCommonSp;

{$R *.dfm}

function TfrmTableSelect.Sign: Integer;
begin
    if not Loaded then
        raise Exception.Create('Спочатку треба отримати дані!');

    SignQuery.Transaction := WriteTransaction;
    with SignQuery.Params do
    begin
        ParamByName('Kind').AsInteger := Kind;
        case Kind of
            1: ParamByName('Id').AsInteger := Id_Department;
            2: ParamByName('Id').AsInteger := Id_Group;
            3: ParamByName('Id').AsInteger := Id_PCard;
            4: ParamByName('Id').AsInteger := Id_Department;
        end;
        ParamByName('Signer_Login').AsString := CurrentLogin;
        ParamByName('Signer_FIO').AsString := CurrentUserName;
        ParamByName('Year').AsInteger := Year;
        ParamByName('Month').AsInteger := Month;
    end;
    Result := ExecQuery(SignQuery);
end;

procedure TfrmTableSelect.CopyState(frm: TfrmTableSelect);
begin
    YearEdit.Value := frm.YearEdit.Value;
    MonthBox.ItemIndex := frm.MonthBox.ItemIndex;
    SortBox.ItemIndex := frm.SortBox.ItemIndex;

    if frm.OptionPageControl.ActivePage = frm.DepartmentsPage then
    begin
        OptionPageControl.ActivePage := DepartmentsPage;
        DepartmentEdit.Text := frm.DepartmentEdit.Text;
        Id_Department := frm.Id_Department;
    end
    else if frm.OptionPageControl.ActivePage = frm.GroupPage then
    begin
        OptionPageControl.ActivePage := GroupPage;
        GroupEdit.Text := frm.GroupEdit.Text;
        Id_Group := frm.Id_Group;
    end
    else if frm.OptionPageControl.ActivePage = frm.OneManPage then
    begin
        OptionPageControl.ActivePage := OneManPage;
        FIOEdit.Text := frm.FIOEdit.Text;
        Id_PCard := frm.Id_PCard;
    end;
end;

procedure TfrmTableSelect.LoadState;
var
    reg: TRegistry;
    Year, Month, d: Word;
begin
   // считать из реестра последний год и месяц
    reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_CURRENT_USER;

        if reg.OpenKey('\Software\ASUP\Table\', False) then
        begin
            Year := reg.ReadInteger('Year');
            Month := reg.ReadInteger('Month');
            try
                Id_Department := reg.ReadInteger('Id_Department');
                DepartmentEdit.Text := reg.ReadString('Name_Department');
            except
            end;
            try
                Id_Group := reg.ReadInteger('Id_Group');
                GroupEdit.Text := reg.ReadString('Name_Group');
            except
            end;
            try
                Id_PCard := reg.ReadInteger('Id_PCard');
                FIOEdit.Text := reg.ReadString('FIO');
            except
            end;
            try
                SortBox.ItemIndex := reg.ReadInteger('Sort_Index');
            except
                if Version = 1 then
                    SortBox.ItemIndex := 2
                else
                    SortBox.ItemIndex := 0;
            end;
        end
        else
            DecodeDate(Date, Year, Month, d);

        reg.CloseKey;
    finally
        reg.Free;
    end;

    if (Month < 1) or (Month > 12) then Month := 1;
    if (Year < 1000) then Year := 2004;

    YearEdit.Value := Year;
    MonthBox.ItemIndex := Month - 1;

    OptionPageControl.ActivePage := DepartmentsPage;
end;

procedure TfrmTableSelect.SaveState;
var
    reg: TRegistry;
begin
    if not Loaded then Exit;

    reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_CURRENT_USER;

        if reg.OpenKey('\Software\ASUP\Table\', True) then
        begin
            reg.WriteInteger('Year', Year);
            reg.WriteInteger('Month', Month);
            reg.WriteInteger('Id_Department', Id_Department);
            reg.WriteString('Name_Department', DepartmentEdit.Text);
            reg.WriteInteger('Id_Group', Id_Group);
            reg.WriteString('Name_Group', GroupEdit.Text);
            reg.WriteInteger('Id_PCard', Id_PCard);
            reg.WriteString('FIO', FIOEdit.Text);
            reg.WriteInteger('Sort_Index', SortBox.ItemIndex);
            reg.CloseKey;
        end
    finally
        reg.Free;
    end;
end;

procedure TfrmTableSelect.AcceptButtonClick(Sender: TObject);
begin
        // получить месяц, год и даты начала и конца месяца
    Month := MonthBox.ItemIndex + 1;
    Year := YearEdit.Value;

    Days := DaysInAMonth(Year, Month);
    Date_Beg := EncodeDate(Year, Month, 1);
    Date_End := EncodeDate(Year, Month, Days);

        // сформировать нужный запрос
    Load_Signed := False;

    Curr_DB['Month_Beg'] := Date_Beg;
    Curr_DB['Month_End'] := Date_End;
    Curr_DB['Month'] := Month;
    Curr_DB['Year'] := Year;
    if IncludingBox.Checked then
        Curr_DB['Including'] := 1
    else
        Curr_DB['Including'] := 0;

    case SortBox.ItemIndex of
        0: Curr_DB['Order'] := 'TN, Date_Beg';
        1: Curr_DB['Order'] := 'FIO COLLATE WIN1251_UA, Date_Beg';
        2: if (OptionPageControl.ActivePage = GroupPage) or
            ((OptionPageControl.ActivePage = DepartmentsPage) and IncludingBox.Checked) then
                Curr_DB['Order'] := 'Path, Shtat_Order, Oklad DESC, TN, Date_Beg'
            else
                Curr_DB['Order'] := 'Shtat_Order, Oklad DESC, TN, Date_Beg'
    end;

    if OptionPageControl.ActivePage = DepartmentsPage then
    begin
        if Id_Department <= 0 then
        begin
            MessageDlg('Потрібно вибрати підрозділ!', mtError, [mbOk], 0);
            Exit;
        end;

        Curr_DB['Id_Department'] := Id_Department;
        TableQuery := Curr_DB.QueryData(sqlTable_Dept,
            'Id_Department, Month_Beg, Month_End, Order, Including', False);

        Loaded := True;
        if IncludingBox.Checked then
            Kind := 4
        else
            Kind := 1;
        Id := Id_Department;
    end
    else if OptionPageControl.ActivePage = GroupPage then
    begin
        if Id_Group <= 0 then
        begin
            MessageDlg('Потрібно вибрати групу підрозділів!', mtError, [mbOk], 0);
            Exit;
        end;

        Curr_DB['Id_Group'] := Id_Group;
        TableQuery := Curr_DB.QueryData(sqlTable_Group,
            'Id_Group, Month_Beg, Month_End, Order', False);

        Loaded := True;
        Kind := 2;
        Id := Id_Group;
    end
    else if OptionPageControl.ActivePage = OneManPage then
    begin
        if Id_PCard <= 0 then
        begin
            MessageDlg('Потрібно вибрати працівника!', mtError, [mbOk], 0);
            Exit;
        end;

        Curr_DB['Id_PCard'] := Id_PCard;
        TableQuery := Curr_DB.QueryData(sqlTable_PCard,
            'Id_PCard, Month_Beg, Month_End, Order', False);

        Loaded := True;
        Kind := 3;
        Id := Id_PCard;
    end;
    if TableTypeBox.ItemIndex = 1 then
    begin
        Curr_DB['Kind'] := Kind;
        Curr_DB['Id'] := Id;
        TableQuery := Curr_DB.QueryData(sqlTable_Signed,
            'Kind, Id, Year, Month, Order', False);

        Load_Signed := True;
    end;

    SignInfo.Transaction := ReadTransaction;
    SignInfo.Close;
    with SignInfo.Params do
    begin
        ParamByName('Kind').AsInteger := Kind;
        ParamByName('Id').AsInteger := Id;
        ParamByName('Year').AsInteger := Year;
        ParamByName('Month').AsInteger := Month;
    end;
    SignInfo.Open;
    if not SignInfo.IsEmpty then
    begin
        SignLabel.Caption := 'Підписаний ' +
            DateTimeToStr(SignInfo['Sign_Date']) + ' (' + SignInfo['Signer_FIO']
            + ')';
        SignLabel.Font.Color := clGreen;
        Signed := True;
        Id_Table_Group := SignInfo['Id_Table_Group'];
    end
    else
    begin
        SignLabel.Caption := 'Не підписаний';
        SignLabel.Font.Color := clMaroon;
        Signed := False;
        Id_Table_Group := -1;
    end;
end;

procedure TfrmTableSelect.DepartmentButtonClick(Sender: TObject);
var
    form: TDepartmentsViewForm;
    cDate: TDate;
begin
    form := TDepartmentsViewForm.Create(Self);

    try
        cDate := EncodeDate(YearEdit.Value, MonthBox.ItemIndex + 1, 1);
    except
        cDate := Date;
    end;

    form.Prepare(True, cDate);
    form.CanSelectRoot := True;
    form.ResultQuery.Locate('Id_Department', Id_Department, []);
    if form.ShowModal = mrOk then
        with form do
        begin
            Id_Department := Selected_Id;
            if Id_Department = -1 then
                DepartmentEdit.Text := Consts_Query['Firm_Name']
            else
                DepartmentEdit.Text := ResultQuery['Name_Full'];
        end;
    form.Free;
end;

procedure TfrmTableSelect.FrameResize(Sender: TObject);
begin
    DepartmentButton.Left := DepartmentsPage.ClientWidth - DepartmentButton.Width;
    DepartmentEdit.Width := DepartmentButton.Left - DepartmentEdit.Left;

    GroupButton.Left := GroupPage.ClientWidth - GroupButton.Width;
    GroupEdit.Width := GroupButton.Left - GroupEdit.Left;

    PCardButton.Left := GroupPage.ClientWidth - PCardButton.Width;
    FIOEdit.Width := PCardButton.Left - FIOEdit.Left;

    SortBox.Left := ClientWidth - SortBox.Width - 20;
    SortLabel.Left := SortBox.Left - SortLabel.Width - 10;
    SortLabel2.Left := SortLabel.Left;
    SortLabel3.Left := SortLabel.Left;
end;

procedure TfrmTableSelect.GroupButtonClick(Sender: TObject);
var
    form: TfmDepartmentsGroup;
begin
    form := TfmDepartmentsGroup.Create(Self);
    form.SelectButton.Visible := True;
    form.ShowModal;
    with form do
        if Id_Dept_Group <> -1 then
        begin
            Id_Group := DeptGroupSelect['Id_Dept_Group'];
            GroupEdit.Text := DeptGroupSelect['Name_Dept_Group'];
        end;
    form.Free;
end;

procedure TfrmTableSelect.PCardButtonClick(Sender: TObject);
var
    sp: TSprav;
begin
    if NewOrders then
    begin
            // создать справочник
        sp := GetSprav('asup\PCardsList');
        if sp <> nil then
        begin

        // заполнить входные параметры
            with sp.Input do
            begin
                Append;
                FieldValues['DBHandle'] := Integer(FIBDatabase.Handle);
                FieldValues['ActualDate'] := Date_Beg;
                FieldValues['SecondDate'] := 0;
                FieldValues['ShowWorking'] := False;
                FieldValues['CanRemoveFilter'] := True;
                FieldValues['AdminMode'] := AdminMode;
                Post;
            end;

        // показать справочник и проанализировать результат
            sp.Show;
            if (sp.Output <> nil) and not sp.Output.IsEmpty then
            begin
                Id_PCard := sp.Output['ID_PCARD'];
                FIOEdit.Text := sp.Output['FIO'] + ' (' + IntToStr(sp.Output['TN']) + ')';
            end;
            sp.Free;
        end;
    end
    else
    begin
        Id_PCard := getpcard(Date, False, True);
        FIOEdit.Text := Fam + ' (' + IntToStr(TN) + ')';
    end;
end;

procedure TfrmTableSelect.MonthBoxChange(Sender: TObject);
begin
    Month := MonthBox.ItemIndex + 1;
end;

end.
