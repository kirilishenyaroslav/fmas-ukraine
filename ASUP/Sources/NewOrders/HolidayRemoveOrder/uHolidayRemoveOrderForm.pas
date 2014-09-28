unit uHolidayRemoveOrderForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, uFormControl, uFControl, uInvisControl,
  uCharControl, uDateControl, uLabeledFControl, uSpravControl, FIBDatabase,
  pFIBDatabase, ActnList, uCommonSp, DB, FIBDataSet, pFIBDataSet, qFTools,
  uSelectForm, uBoolControl, ExtCtrls, uEnumControl;

type
  TfmHolidayRemoveOrder = class(TForm)
    LocalDatabase: TpFIBDatabase;
    LocalReadTransaction: TpFIBTransaction;
    LocalWriteTransaction: TpFIBTransaction;
    SelectCurWorkPlace: TpFIBDataSet;
    SelectCurWorkPlaceID_DEPARTMENT: TFIBIntegerField;
    SelectCurWorkPlaceNAME_POST_SALARY: TFIBStringField;
    SelectCurWorkPlaceID_POST_SALARY: TFIBIntegerField;
    SelectCurWorkPlaceNAME_DEPARTMENT: TFIBStringField;
    SelectCurWorkPlaceID_MAN_MOVING: TFIBIntegerField;
    SelectCurWorkPlaceDATE_BEG: TFIBDateField;
    SelectCurWorkPlaceDATE_END: TFIBDateField;
    SelectCurWorkPlaceREAL_DATE_END: TFIBDateField;
    SelectCurWorkPlaceWORK_REASON: TFIBStringField;
    HolidaySelect: TpFIBDataSet;
    HolidaySelectID_MAN_HOLIDAY: TFIBIntegerField;
    HolidaySelectDATE_BEG: TFIBDateField;
    HolidaySelectDATE_END: TFIBDateField;
    HolidaySelectNAME_HOLIDAY: TFIBStringField;
    HolidaySelectPERIOD_BEG: TFIBDateField;
    HolidaySelectPERIOD_END: TFIBDateField;
    SelectCurWorkPlaceRMOVING: TFIBIntegerField;
    TopPanel: TPanel;
    Label1: TLabel;
    IdOrderType: TqFInvisControl;
    NumItem: TqFInvisControl;
    SubItem: TqFInvisControl;
    IdOrderGroup: TqFInvisControl;
    Intro: TqFInvisControl;
    IdOrder: TqFInvisControl;
    DateOrder: TqFInvisControl;
    WorkPlace: TqFSpravControl;
    Holiday: TqFSpravControl;
    Fio: TqFSpravControl;
    MovingsDate: TqFDateControl;
    ActionType: TqFEnumControl;
    RemovePanel: TPanel;
    DateRemove: TqFDateControl;
    DateRemoveEnd: TqFDateControl;
    RemoveForever: TCheckBox;
    MovePanel: TPanel;
    New_Date_Beg: TqFDateControl;
    New_Date_End: TqFDateControl;
    BottomPanel: TPanel;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    Note: TqFCharControl;
    KeyList: TActionList;
    OkAction: TAction;
    CancelAction: TAction;
    FormControl: TqFFormControl;
    procedure FioOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure WorkPlaceOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure OkActionExecute(Sender: TObject);
    procedure CancelActionExecute(Sender: TObject);
    procedure FormControlAfterRecordAdded(Sender: TObject);
    procedure HolidayOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure Label1Click(Sender: TObject);
    procedure FormControlAfterPrepare(Sender: TObject; Form: TForm;
      Mode: TFormMode);
    procedure RemoveForeverClick(Sender: TObject);
    procedure ActionTypeChange(Sender: TObject);
    procedure FormControlNewRecordAfterPrepare(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmHolidayRemoveOrder: TfmHolidayRemoveOrder;

implementation

{$R *.dfm}

procedure TfmHolidayRemoveOrder.FioOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    sp: TSprav;
begin
    // создать справочник
    sp :=  GetSprav('asup\PCardsList');
    if sp <> nil then
    begin

        // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(LocalDatabase.Handle);
            FieldValues['ActualDate'] := DateOrder.Value;
            FieldValues['SecondDate'] := 0;
            FieldValues['ShowWorking'] := False;
            FieldValues['CanRemoveFilter'] := True;
            FieldValues['AdminMode'] := True;
            Post;
        end;

        // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        if ( sp.Output <> nil ) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['ID_PCARD'];
            DisplayText := sp.Output['FIO'] + ' (Т/Н ' + IntToStr(sp.Output['TN']) + ')';

            SelectCurWorkPlace.Close;
            SelectCurWorkPlace.ParamByName('CUR_DATE').AsDate := MovingsDate.Value;
            SelectCurWorkPlace.ParamByName('Id_Pcard').AsInteger := FIO.Value;
            SelectCurWorkPlace.Open;
            SelectCurWorkPlace.FetchAll;

            if SelectCurWorkPlace.RecordCount = 1 then begin
                WorkPlace.Value := SelectCurWorkPlaceRMOVING.Value;
                WorkPlace.DisplayText := SelectCurWorkPlace['NAME_POST_SALARY'] + ' (' + SelectCurWorkPlace['NAME_DEPARTMENT'] + ')';
            end
            else begin
                WorkPlace.Value := Null;
                WorkPlace.DisplayText := '';
            end;

            Note.Value := 'Заява ' + sp.Output['FIO_SMALL'];
        end;
        sp.Free;
    end;
end;

procedure TfmHolidayRemoveOrder.WorkPlaceOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
begin
    if VarIsNull(FIO.Value) then begin
        qFErrorDialog('Спочатку треба вибрати працівника!');
        exit;
    end;

    SelectCurWorkPlace.Close;
    SelectCurWorkPlace.ParamByName('CUR_DATE').AsDate := MovingsDate.Value;
    SelectCurWorkPlace.ParamByName('Id_Pcard').AsInteger := FIO.Value;
    SelectCurWorkPlace.Open;

    if qSelect(SelectCurWorkPlace) then
    begin
        Value := SelectCurWorkPlace['RMOVING'];
        DisplayText := SelectCurWorkPlace['NAME_POST_SALARY'] + ' (' + SelectCurWorkPlace['NAME_DEPARTMENT'] + ')';

        Holiday.Value := null;
        Holiday.DisplayText := '';
    end;
end;

procedure TfmHolidayRemoveOrder.OkActionExecute(Sender: TObject);
begin
    FormControl.Ok;
end;

procedure TfmHolidayRemoveOrder.CancelActionExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmHolidayRemoveOrder.FormControlAfterRecordAdded(
  Sender: TObject);
begin
    IdOrder.Value := FormControl.LastId;
end;

procedure TfmHolidayRemoveOrder.HolidayOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
begin
    if varisnull(WorkPlace.Value) then begin
        qFErrorDialog('Спочатку треба вибрати місце праці!');
        exit;
    end;

    HolidaySelect.Close;
    HolidaySelect.ParamByName('RMOVING').AsInteger := WorkPlace.Value;
    HolidaySelect.Open;

    if qSelect(HolidaySelect, 'Довідник типів відпусток') then
    begin
        Value := HolidaySelectID_MAN_HOLIDAY.Value;
        
        DisplayText := HolidaySelectNAME_HOLIDAY.Value + ' з ' +
                       HolidaySelectDATE_BEG.AsString + ' по ' +
                       HolidaySelectDATE_END.AsString;
    end;
end;

procedure TfmHolidayRemoveOrder.Label1Click(Sender: TObject);
begin
    qFInformDialog('Якщо при виборі місця праці ви не знайшли потрібне, спробуйте змінити цю дату.');
end;

procedure TfmHolidayRemoveOrder.FormControlAfterPrepare(Sender: TObject;
  Form: TForm; Mode: TFormMode);
begin
    MovingsDate.Value := Date;

    if (DateRemoveEnd.Value = StrToDate('31.12.2150')) then
        RemoveForever.Checked := True;

    ActionTypeChange(ActionType);        
end;

procedure TfmHolidayRemoveOrder.RemoveForeverClick(Sender: TObject);
begin
    DateRemoveEnd.Visible := not (RemoveForever.Checked);

    if (RemoveForever.Checked) then
        DateRemoveEnd.Value := StrToDate('31.12.2150')
    else
        DateRemoveEnd.Value := Date;
end;

procedure TfmHolidayRemoveOrder.ActionTypeChange(Sender: TObject);
begin
    if VarIsNull(ActionType.value) then begin
        MovePanel.Visible := False;
        RemovePanel.Visible := False;
        exit;
    end;

    //BottomPanel.Align := alNone;

    try
       if ActionType.Value = 4
        then begin
          DateRemove.DisplayName:='Перенести з';
          DateRemoveEnd.DisplayName:='Перенести до';
          RemoveForever.Caption:='Перенести до кінця відпусти';
        end
        else begin
          DateRemove.DisplayName:='Відкликати з';
          DateRemoveEnd.DisplayName:='Відкликати до';
          RemoveForever.Caption:='Відкликати до кінця відпусти';
        end;
        MovePanel.Visible := (ActionType.Value = 1);
        RemovePanel.Visible := ((ActionType.Value = 2) or (ActionType.Value = 4));
    except
    end;

    BottomPanel.Top := 1000;
    //BottomPanel.Align := alTop;
end;

procedure TfmHolidayRemoveOrder.FormControlNewRecordAfterPrepare(
  Sender: TObject);
begin
    if VarIsNull(ActionType.Value) then
        ActionType.Value := 1;
end;

end.
