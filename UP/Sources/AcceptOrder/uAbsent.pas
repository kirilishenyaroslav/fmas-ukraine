unit uAbsent;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, uFControl, uLabeledFControl, uSpravControl,
    uEnumControl, ActnList, UP_DMAcception, uCommonSp;

type
    TfmAbsentForm = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        Id_Away_Type: TqFEnumControl;
        Id_PCard_Away: TqFSpravControl;
        Id_Key: TqFSpravControl;
        ActionList1: TActionList;
        AcceptAction: TAction;
        CancelAction: TAction;
        procedure CancelActionExecute(Sender: TObject);
        procedure AcceptActionExecute(Sender: TObject);
        procedure Id_PCard_AwayOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure Id_KeyOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure Id_Away_TypeChange(Sender: TObject);
    private
    { Private declarations }
    public
        DM: TUPAcceptDM;
        Date_Beg: TDate;
        Date_End: TDate;
        Reason: string;

        constructor Create(AOwner: TComponent; DataModule: TUPAcceptDM); reintroduce;
        procedure Prepare(In_Id_Type_Away: Variant; In_Id_PCard_Away: Variant;
            In_Id_Key: Variant);
    end;

var
    fmAbsentForm: TfmAbsentForm;

implementation

{$R *.dfm}

{ TfmAbsentForm }

uses qFTools;

constructor TfmAbsentForm.Create(AOwner: TComponent;
    DataModule: TUPAcceptDM);
var
    val_string: string;
    first_value: Integer;
begin
    inherited Create(AOwner);
    DM := DataModule;

    DM.IniAwayType.Close;
    DM.IniAwayType.Open;
    DM.UPConsts.Close;
    DM.UPConsts.Open;
    DM.IniAwayType.First;
    val_string := '';
    if not DM.IniAwayType.IsEmpty then
        first_value := DM.IniAwayType['Id_Type_Away'];
    while not DM.IniAwayType.Eof do
    begin
        Id_Away_Type.Items.Add(DM.IniAwayType['Name_Type_Away']);
        if val_string = '' then
            val_string := IntToStr(DM.IniAwayType['Id_Type_Away'])
        else
            val_string := val_string + ',' + IntToStr(DM.IniAwayType['Id_Type_Away']);
        DM.IniAwayType.Next;
    end;
    Id_Away_Type.ValuesString := val_string;
    Id_Away_Type.Value := first_value;
    Date_Beg := 0;
    Date_End := 0;
end;

procedure TfmAbsentForm.CancelActionExecute(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure TfmAbsentForm.AcceptActionExecute(Sender: TObject);
begin
    if qFCheckAll(Self) then ModalResult := mrOk
    else ModalResult := 0;
end;

procedure TfmAbsentForm.Id_PCard_AwayOpenSprav(Sender: TObject;
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
            FieldValues['DBHandle'] := Integer(DM.DB.Handle);
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

procedure TfmAbsentForm.Id_KeyOpenSprav(Sender: TObject;
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
                FieldValues['DBHandle'] := Integer(DM.DB.Handle);
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
                    Date_End := DM.UpConsts['INFINITY_DATE'];
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
                FieldValues['DBHandle'] := Integer(DM.DB.Handle);
                FieldValues['Select'] := 1;
                Post;
            end;

                // показать справочник и проанализировать результат
            sp.Show;
            if (sp.Output <> nil) and not sp.Output.IsEmpty then
            begin
                Value := sp.Output['Id_Man_Holiday_Fact'];

                DM.AwayInfo.Close;
                DM.AwayInfo.ParamByName('Id_Type_Away').AsInteger := Id_Away_Type.Value;
                DM.AwayInfo.ParamByName('Id_PCard_Away').AsVariant := Null;
                DM.AwayInfo.ParamByName('Id_Key').AsInteger := sp.Output['Id_Man_Holiday_Fact'];
                DM.AwayInfo.Open;

                DisplayText := Coalesce(DM.AwayInfo['Reason'], '');

                Id_PCard_Away.Value := DM.AwayInfo['Id_Pcard_Out'];
                Id_PCard_Away.DisplayText := Coalesce(DM.AwayInfo['Fio_String'], '');

                Date_Beg := sp.Output['Holiday_Beg'];
                Date_End := sp.Output['Holiday_End'];

                Reason := DM.AwayInfo['Reason'];
            end;
            sp.Free;
        end;
    end;
end;

procedure TfmAbsentForm.Id_Away_TypeChange(Sender: TObject);
begin
    Id_Key.Clear;
    Id_PCard_Away.Clear;
end;


procedure TfmAbsentForm.Prepare(In_Id_Type_Away: Variant; In_Id_PCard_Away: Variant;
    In_Id_Key: Variant);
begin
    DM.AwayInfo.Close;
    DM.AwayInfo.ParamByName('Id_Type_Away').AsVariant := In_Id_Type_Away;
    DM.AwayInfo.ParamByName('Id_PCard_Away').AsVariant := In_Id_Pcard_Away;
    DM.AwayInfo.ParamByName('Id_Key').AsVariant := In_Id_Key;
    DM.AwayInfo.Open;

    if not VarIsNull(In_Id_Type_Away) then
        Id_Away_Type.Value := In_Id_Type_Away;
    Id_Key.Value := In_Id_Key;
    if not DM.AwayInfo.IsEmpty then
        Id_Key.DisplayText := DM.AwayInfo['Reason'];
    Id_PCard_Away.Value := In_Id_PCard_Away;
    if not DM.AwayInfo.IsEmpty then
        Id_Pcard_Away.DisplayText := DM.AwayInfo['FIO_String'];
end;

end.

