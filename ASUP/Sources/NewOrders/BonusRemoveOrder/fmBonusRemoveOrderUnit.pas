unit fmBonusRemoveOrderUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormControl, ComCtrls, DB, FIBDataSet, pFIBDataSet, RxMemDS,
  FIBDatabase, pFIBDatabase, ActnList, StdCtrls, Buttons, uFControl,
  uInvisControl, uLabeledFControl, uSpravControl, uCommonSP, uCharControl,
  cxClasses, cxStyles, cxGridTableView,  uDateControl, uFloatControl, ExtCtrls,
  cxControls, cxSplitter, qFTools, uSelectForm, uMemoControl;

type
  TfmBonusRemoveOrder = class(TForm)
    KeyList: TActionList;
    LocalDatabase: TpFIBDatabase;
    LocalReadTransaction: TpFIBTransaction;
    LocalWriteTransaction: TpFIBTransaction;
    SmetsViewQuery: TRxMemoryData;
    SmetSource: TDataSource;
    WorkQuery: TpFIBDataSet;
    CancelAction: TAction;
    SelectCurWorkPlace: TpFIBDataSet;
    SelectCurWorkPlaceID_DEPARTMENT: TFIBIntegerField;
    SelectCurWorkPlaceNAME_POST_SALARY: TFIBStringField;
    SelectCurWorkPlaceID_POST_SALARY: TFIBIntegerField;
    SelectCurWorkPlaceNAME_DEPARTMENT: TFIBStringField;
    SelectCurWorkPlaceID_MAN_MOVING: TFIBIntegerField;
    SelectCurWorkPlaceDATE_BEG: TFIBDateField;
    SelectCurWorkPlaceDATE_END: TFIBDateField;
    SelectCurWorkPlaceREAL_DATE_END: TFIBDateField;
    SmetsViewQueryKOD_SM: TIntegerField;
    SmetsViewQueryKOD_SM_PPS: TIntegerField;
    SmetsViewQuerySUMMA: TFloatField;
    SmetsViewQuerySUMMA_PPS: TFloatField;
    SmetsViewQueryTITLE_SM: TStringField;
    SmetsViewQueryTITLE_SM_PPS: TStringField;
    SmetsViewQueryPERCENT: TIntegerField;
    WorkQueryID_MAN_BONUS_SMET: TFIBIntegerField;
    WorkQueryID_MAN_BONUS: TFIBIntegerField;
    WorkQueryKOD_SM: TFIBIntegerField;
    WorkQueryKOD_SM_PPS: TFIBIntegerField;
    WorkQueryPERCENT: TFIBIntegerField;
    WorkQuerySUMMA: TFIBFloatField;
    WorkQuerySUMMA_PPS: TFIBFloatField;
    WorkQueryIS_PERCENT: TFIBStringField;
    WorkQueryDATE_BEG: TFIBDateField;
    WorkQueryDATE_END: TFIBDateField;
    WorkQueryREAL_DATE_END: TFIBDateField;
    WorkQuerySMETA_TITLE: TFIBStringField;
    WorkQuerySMETA_TITLE_PPS: TFIBStringField;
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
    SelectCurBonus: TpFIBDataSet;
    SelectCurBonusPERCENT: TFIBFloatField;
    SelectCurBonusSUMMA: TFIBFloatField;
    SelectCurBonusDATE_BEG: TFIBDateField;
    SelectCurBonusDATE_END: TFIBDateField;
    SelectCurBonusRAISE_FULL_NAME: TFIBStringField;
    SelectCurBonusID_MAN_BONUS: TFIBIntegerField;
    RemoveDate: TqFDateControl;
    Fio: TqFSpravControl;
    WorkPlace: TqFSpravControl;
    IdManBonus: TqFSpravControl;
    Reason: TqFCharControl;
    Note: TqFMemoControl;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    FormControl: TqFFormControl;
    IdOrderType: TqFInvisControl;
    NumItem: TqFInvisControl;
    SubItem: TqFInvisControl;
    IdOrderGroup: TqFInvisControl;
    Intro: TqFInvisControl;
    IdOrder: TqFInvisControl;
    DateOrder: TqFInvisControl;
    pFIBDS_CheckPermission: TpFIBDataSet;
    pFIBDS_CheckPermissionNUM_PROJECT: TFIBStringField;
    pFIBDS_CheckPermissionDATE_ORDER: TFIBDateField;
    pFIBDS_CheckPermissionOWNER_NAME: TFIBStringField;
    procedure OkActionExecute(Sender: TObject);
    procedure CancelActionExecute(Sender: TObject);
    procedure FioOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure FioChange(Sender: TObject);
    procedure WorkPlaceOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure IdManBonusOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure WorkPlaceChange(Sender: TObject);
    procedure FormControlAfterRecordAdded(Sender: TObject);
  private
    { Private declarations }
  public
    Id_order_group : Integer;
  end;

var
  fmBonusRemoveOrder: TfmBonusRemoveOrder;

implementation

{$R *.dfm}

procedure TfmBonusRemoveOrder.OkActionExecute(Sender: TObject);
begin
    pFIBDS_CheckPermission.ParamByName('id_pcard').AsInteger:=FIO.Value;
    pFIBDS_CheckPermission.ParamByName('id_order').AsInteger:=Id_order_group;
    pFIBDS_CheckPermission.Open;
    if (not pFIBDS_CheckPermission.IsEmpty)
     then begin
       qFInformDialog('Не можливо створити наказ на цю людину тому, що є інші не виконані накази пов''язані з нею!');
       qSelect(pFIBDS_CheckPermission,'Перелік наказів');
       pFIBDS_CheckPermission.Close;
       ModalResult:=0;
       Exit;
     end;
    pFIBDS_CheckPermission.Close;

    FormControl.Ok;
end;

procedure TfmBonusRemoveOrder.CancelActionExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmBonusRemoveOrder.FioOpenSprav(Sender: TObject; var Value: Variant;
  var DisplayText: String);
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
            FieldValues['ShowWorking'] := True;
            FieldValues['CanRemoveFilter'] := True;
            FieldValues['AdminMode'] := True;
            Post;
        end;

        // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        if ( sp.Output <> nil ) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['ID_PCARD'];
            DisplayText := sp.Output['FIO'];

            Reason.Value := 'Заява ' + DisplayText;
        end;
        sp.Free;
    end;
end;

procedure TfmBonusRemoveOrder.FioChange(Sender: TObject);
begin
    if (not Visible) or (VarIsNull(Fio.Value)) then
        exit;

    SelectCurWorkPlace.Close;
    SelectCurWorkPlace.ParamByName('Cur_Date').AsDate := RemoveDate.Value;
    SelectCurWorkPlace.ParamByName('Id_Pcard').AsInteger := Fio.Value;
    SelectCurWorkPlace.Open;
    SelectCurWorkPlace.FetchAll;

    if SelectCurWorkPlace.RecordCount = 1 then begin
        WorkPlace.Value := SelectCurWorkPlaceID_MAN_MOVING.Value;
        WorkPlace.DisplayText := SelectCurWorkPlaceNAME_POST_SALARY.Value + ' (' + SelectCurWorkPlaceNAME_DEPARTMENT.Value + ')';
    end else
        WorkPlace.OpenSprav;
end;

procedure TfmBonusRemoveOrder.WorkPlaceOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
begin
    if VarIsNull(FIO.Value) then
    begin
        qFErrorDialog('Спочатку треба вибрати працівника!');
        exit;
    end;

    SelectCurWorkPlace.Close;
    SelectCurWorkPlace.ParamByName('Cur_Date').AsDate := RemoveDate.Value;
    SelectCurWorkPlace.ParamByName('Id_Pcard').AsInteger := Fio.Value;
    SelectCurWorkPlace.Open;
    SelectCurWorkPlace.FetchAll;

    if qSelect(SelectCurWorkPlace, 'Виберіть місце роботи...') then
    begin
        Value := SelectCurWorkPlace['ID_MAN_MOVING'];
        DisplayText := SelectCurWorkPlace['NAME_POST_SALARY'] + ' (' + SelectCurWorkPlace['NAME_DEPARTMENT'] + ')';
    end;
end;

procedure TfmBonusRemoveOrder.IdManBonusOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
begin
    if VarIsNull(WorkPlace.Value) then
    begin
        qFErrorDialog('Спочатку треба вибрати працівника та місце роботи!');
        exit;
    end;

    SelectCurBonus.Close;
    SelectCurBonus.ParamByName('Id_Man_Moving').AsInteger := WorkPlace.Value;
    SelectCurBonus.Open;
    SelectCurBonus.FetchAll;

    if qSelect(SelectCurBonus, 'Виберіть надбавку (доплату), яку треба зняти...') then
    begin
        Value := SelectCurBonusID_MAN_BONUS.Value;
        DisplayText := SelectCurBonusRAISE_FULL_NAME.Value;
    end;
end;

procedure TfmBonusRemoveOrder.WorkPlaceChange(Sender: TObject);
begin
    if (not Visible) or (VarIsNull(FIO.Value)) then
        exit;

    SelectCurBonus.Close;
    SelectCurBonus.ParamByName('Id_Man_Moving').AsInteger := WorkPlace.Value;
    SelectCurBonus.Open;
    SelectCurBonus.FetchAll;

    if SelectCurBonus.RecordCount = 1 then begin
        IdManBonus.Value := SelectCurBonusID_MAN_BONUS.Value;
        IdManBonus.DisplayText := SelectCurBonusRAISE_FULL_NAME.Value;
    end
    else
        IdManBonus.OpenSprav;
end;

procedure TfmBonusRemoveOrder.FormControlAfterRecordAdded(Sender: TObject);
begin
    IdOrder.Value := FormControl.LastId;
end;

end.
