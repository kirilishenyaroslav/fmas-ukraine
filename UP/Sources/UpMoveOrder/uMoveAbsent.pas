unit uMoveAbsent;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, uFControl, uLabeledFControl, uSpravControl,
    uEnumControl, ActnList, uCommonSp, DB, FIBDataSet, pFIBDataSet,
    FIBDatabase, pFIBDatabase;

type
    TfmUpAbsentForm = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        Id_Away_Type: TqFEnumControl;
        Id_PCard_Away: TqFSpravControl;
        Id_Key: TqFSpravControl;
        ActionList1: TActionList;
        AcceptAction: TAction;
        CancelAction: TAction;
        AwayInfo: TpFIBDataSet;
        IniAwayType: TpFIBDataSet;
        ConstSet: TpFIBDataSet;
        procedure CancelActionExecute(Sender: TObject);
        procedure AcceptActionExecute(Sender: TObject);
        procedure Id_PCard_AwayOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure Id_KeyOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure Id_Away_TypeChange(Sender: TObject);
        procedure FormShow(Sender: TObject);
    private
        { Private declarations }
    public
        Date_Beg: TDate;
        Date_End: TDate;
        InfinityDate: TDate;
        InAwayType: Variant;
        Reason, {Name_Work_Reason_W,} Name_Type_Away_W: string;
        //Id_Work_Reason_W: integer;
        Locate_Id_Type_Away: boolean;
        procedure Prepare(In_Id_Type_Away: Variant; In_Id_PCard_Away: Variant;
            In_Id_Key: Variant);
    end;

var
    fmUpAbsentForm: TfmUpAbsentForm;

implementation

{$R *.dfm}

uses qFTools, uMoveAdd;

procedure TfmUpAbsentForm.CancelActionExecute(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure TfmUpAbsentForm.AcceptActionExecute(Sender: TObject);
begin
    if IniAwayType.Locate('Id_Type_Away', Id_Away_Type.Value, []) then
    begin
        //Id_Work_Reason_W := IniAwayType['Id_Work_Reason'];
        //Name_Work_Reason_W := IniAwayType['Name_Work_Reason'];
        Name_Type_Away_W := IniAwayType['Name_Type_Away'];

        Locate_Id_Type_Away := true;
    end
    else
        Locate_Id_Type_Away := false;

    if qFCheckAll(Self) then
        ModalResult := mrOk
    else
        ModalResult := 0;
end;

procedure TfmUpAbsentForm.Id_PCard_AwayOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    sp: TSprav;
begin
    // создать справочник
    sp := GetSprav('asup\PCardsList');
    if sp <> nil then
    begin
        // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(AwayInfo.Database.Handle);
            FieldValues['ActualDate'] := Date;
            FieldValues['SecondDate'] := 0;
            FieldValues['ShowWorking'] := False;
            FieldValues['CanRemoveFilter'] := True;
            FieldValues['ShowStyle'] := 0;
            FieldValues['NewVersion'] := 1;
            Post;
        end;
        // показать справочник и проанализировать результат
        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['ID_PCARD'];
            DisplayText := sp.Output['FIO'] + ' (т/н ' + IntToStr(sp.Output['TN']) + ')';
        end;
        sp.Free;
    end;
end;

procedure TfmUpAbsentForm.Id_KeyOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    sp: TSprav;
begin
    if Id_Away_Type.Value = 0 then
    begin
        sp := GetSprav('Asup\AsupHospital');
        if sp <> nil then
        begin
            // заполнить входные параметры
            with sp.Input do
            begin
                Append;
                FieldValues['DBHandle'] := Integer(AwayInfo.Database.Handle);
                FieldValues['Select'] := 1;
                Post;
            end;
            // показать справочник и проанализировать результат
            sp.Show;
            if (sp.Output <> nil) and not sp.Output.IsEmpty then
            begin
                Value := sp.Output['Id_Man_Hosp'];
                DisplayText := sp.Output['DisplayText'];
                Id_PCard_Away.Value := sp.Output['Id_Pcard'];
                Id_PCard_Away.DisplayText := sp.Output['FIO'] + ' (т/н '
                    + IntToStr(sp.Output['TN']) + ')';
                Date_Beg := sp.Output['Date_Beg'];
                if sp.Output['Ending'] <> 2 then
                    Date_End := sp.Output['Date_End']
                else
                begin
                    //Date_End := TfrmMoveOrder(owner.owner).UpConsts['INFINITY_DATE'];
                    Date_End := InfinityDate;
                end;

                Reason := 'лист непрацездатності №' + sp.Output['Nomer'] +
                    ' серія ' + sp.Output['Seria'];
            end;
            sp.Free;
        end;
    end;
    if Id_Away_Type.Value = 1 then
    begin
        sp := GetSprav('Up\UpHolidayFact.bpl');
        if sp <> nil then
        begin
            // заполнить входные параметры
            with sp.Input do
            begin
                Append;
                FieldValues['DBHandle'] := Integer(AwayInfo.Database.Handle);
                FieldValues['Select'] := 1;
                Post;
            end;
            // показать справочник и проанализировать результат
            sp.Show;
            if (sp.Output <> nil) and not sp.Output.IsEmpty then
            begin
                Value := sp.Output['Id_Man_Holiday_Fact'];
                AwayInfo.Close;
                AwayInfo.SelectSQL.Text := 'SELECT * FROM UP_GET_AWAY_INFO_2(:Id_Type_Away, :Id_PCard_Away, :Id_Key)';
                AwayInfo.ParamByName('Id_Type_Away').AsInteger := Id_Away_Type.Value;
                AwayInfo.ParamByName('Id_PCard_Away').AsVariant := Null;
                AwayInfo.ParamByName('Id_Key').AsInteger := sp.Output['Id_Man_Holiday_Fact'];
                AwayInfo.Open;
                DisplayText := Coalesce(AwayInfo['Reason'], '');

                Id_PCard_Away.Value := AwayInfo['Id_Pcard_Out'];
                Id_PCard_Away.DisplayText := Coalesce(AwayInfo['Fio_String'], '');

                Date_Beg := sp.Output['Holiday_Beg'];
                Date_End := sp.Output['Holiday_End'];

                Reason := AwayInfo['Reason'];
            end;
            sp.Free;
        end;
    end;
end;

procedure TfmUpAbsentForm.Id_Away_TypeChange(Sender: TObject);
begin
    Id_Key.Clear;
    Id_PCard_Away.Clear;
end;

procedure TfmUpAbsentForm.Prepare(In_Id_Type_Away: Variant; In_Id_PCard_Away: Variant;
    In_Id_Key: Variant);
begin
    ConstSet.Close;
    ConstSet.SQLs.SelectSQL.Text := 'select infinity_date from pub_sys_data';
    ConstSet.Open;
    InfinityDate := ConstSet['infinity_date'];

    InAwayType := In_Id_Type_Away;
    AwayInfo.Close;
    AwayInfo.SelectSQL.Text := 'SELECT * FROM UP_GET_AWAY_INFO_2(:Id_Type_Away, :Id_PCard_Away, :Id_Key)';
    AwayInfo.ParamByName('Id_Type_Away').AsVariant := In_Id_Type_Away;
    AwayInfo.ParamByName('Id_PCard_Away').AsVariant := In_Id_Pcard_Away;
    AwayInfo.ParamByName('Id_Key').AsVariant := In_Id_Key;
    AwayInfo.Open;

    if not VarIsNull(In_Id_Type_Away) then
        Id_Away_Type.Value := In_Id_Type_Away;
    Id_Key.Value := In_Id_Key;
    if not AwayInfo.IsEmpty then
        Id_Key.DisplayText := AwayInfo['Reason'];
    Id_PCard_Away.Value := In_Id_PCard_Away;
    if not AwayInfo.IsEmpty then
        Id_Pcard_Away.DisplayText := AwayInfo['FIO_String'];
end;

procedure TfmUpAbsentForm.FormShow(Sender: TObject);
var
    val_string: string;
    first_value: Integer;
begin
    IniAwayType.Close;
    IniAwayType.SelectSQL.Text := 'SELECT * FROM UP_INI_AWAY_TYPE_SELECT';
    IniAwayType.Open;
    IniAwayType.First;

    val_string := '';
    if not IniAwayType.IsEmpty then
        first_value := IniAwayType['Id_Type_Away'];
    while not IniAwayType.Eof do
    begin
        Id_Away_Type.Items.Add(IniAwayType['Name_Type_Away']);
        if val_string = '' then
            val_string := IntToStr(IniAwayType['Id_Type_Away'])
        else
            val_string := val_string + ',' + IntToStr(IniAwayType['Id_Type_Away']);
        IniAwayType.Next;
    end;
    Id_Away_Type.ValuesString := val_string;
    if not VarIsNull(InAwayType) then
        Id_Away_Type.Value := InAwayType
    else
        Id_Away_Type.Value := first_value;
    if not VarIsNull(AwayInfo['Date_Beg']) then
        Date_Beg := AwayInfo['Date_Beg']
    else
        Date_Beg := 0;
    if not VarIsNull(AwayInfo['Date_End']) then
        Date_End := AwayInfo['Date_End']
    else
        Date_End := 0;
end;

end.
