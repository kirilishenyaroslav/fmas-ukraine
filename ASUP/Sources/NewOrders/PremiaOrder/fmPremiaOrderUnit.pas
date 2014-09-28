unit fmPremiaOrderUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormControl, ComCtrls, DB, FIBDataSet, pFIBDataSet, RxMemDS,
  FIBDatabase, pFIBDatabase, ActnList, StdCtrls, Buttons, uFControl,
  uInvisControl, uLabeledFControl, uSpravControl, uCommonSP, uCharControl,
  uDateControl, uFloatControl, ExtCtrls, cxControls, cxSplitter,
  uShtatUtils, qFTools, uSelectForm, GlobalSPR, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, uLogicCheck,
  uSimpleCheck, uEnumControl, uBoolControl,AllPeopleUnit, DateUtils;

type
  TfmPremiaOrder = class(TForm)
    KeyList: TActionList;
    LocalDatabase: TpFIBDatabase;
    LocalReadTransaction: TpFIBTransaction;
    LocalWriteTransaction: TpFIBTransaction;
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
    TopPanel: TPanel;
    BottomPanel: TPanel;
    Fio: TqFSpravControl;
    WorkPlace: TqFSpravControl;
    DateBeg: TqFDateControl;
    DateEnd: TqFDateControl;
    IsPercentBox: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Percent: TqFFloatControl;
    Summa: TqFFloatControl;
    Reason: TqFCharControl;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    IdRaise: TqFSpravControl;
    GetRaiseCalcType: TpFIBDataSet;
    GetRaiseCalcTypeID_CALC_TYPE: TFIBIntegerField;
    GetRaiseCalcTypeCALC_TYPE_NAME: TFIBStringField;
    Smeta: TqFSpravControl;
    FormControl: TqFFormControl;
    SelectMovSmet: TpFIBDataSet;
    SelectMovSmetKOD_SM: TFIBIntegerField;
    SelectMovSmetKOD_SM_PPS: TFIBIntegerField;
    SelectMovSmetOKLAD_BASE: TFIBBCDField;
    SelectMovSmetOKLAD_PPS: TFIBBCDField;
    SelectMovSmetTITLE_SM: TFIBStringField;
    SelectMovSmetTITLE_SM_PPS: TFIBStringField;
    PeriodCheck: TqFSimpleCheck;
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
    IdType: TqFEnumControl;
    Note: TqFCharControl;
    ShtatrasQuery: TpFIBDataSet;
    ShtatrasQueryID_SR: TFIBIntegerField;
    ShtatrasQueryKOD_SM: TFIBIntegerField;
    ShtatrasQuerySM_NUMBER: TFIBIntegerField;
    ShtatrasQuerySM_TITLE: TFIBStringField;
    ShtatrasQueryKOL_STAVOK: TFIBFloatField;
    ShtatrasQueryKOL_VACANT_STAVOK: TFIBFloatField;
    ShtatrasQueryOKLAD: TFIBFloatField;
    ShtatrasQuerySM_NUMBER_PPS: TFIBIntegerField;
    ShtatrasQueryKOD_SM_PPS: TFIBIntegerField;
    ShtatrasQuerySM_TITLE_PPS: TFIBStringField;
    ShtatrasQueryKOEFF_PPS: TFIBFloatField;
    ShtatrasQueryWITHKOEF: TFIBStringField;
    ShtatrasQuerySR_NAME: TFIBStringField;
    ShtatrasQueryID_WORK_COND: TFIBIntegerField;
    ShtatrasQueryNAME_WORK_COND: TFIBStringField;
    ShtatrasQueryID_WORK_MODE: TFIBIntegerField;
    ShtatrasQueryNAME_WORK_MODE: TFIBStringField;
    IsDepartment: TqFBoolControl;
    Department: TqFSpravControl;
    qFCharControl_Notes: TqFCharControl;
    SelectCurWorkPlaceWORK_REASON: TFIBStringField;
    SelectCurWorkPlaceNAME_SOVMEST: TFIBStringField;
    SelectCurWorkPlaceID_SOVMEST: TFIBIntegerField;
    SelectCurWorkPlaceNAME_POST: TFIBStringField;
    SelectCurWorkPlaceKOL_STAVOK: TFIBFloatField;
    SelectCurWorkPlaceRMOVING: TFIBIntegerField;
    MPanel: TPanel;
    DSPercent: TpFIBDataSet;
    DSPercentOKLAD: TFIBFloatField;
    PanelOther: TPanel;
    procedure OkActionExecute(Sender: TObject);
    procedure CancelActionExecute(Sender: TObject);
    procedure FioOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure FioChange(Sender: TObject);
    procedure WorkPlaceOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure RadioButton1Click(Sender: TObject);
    procedure IdRaiseOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure SmetaOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure FormControlNewRecordAfterPrepare(Sender: TObject);
    procedure FormControlModifyRecordAfterPrepare(Sender: TObject);
    procedure IdTypeChange(Sender: TObject);
    procedure FormControlAfterRecordAdded(Sender: TObject);
    procedure FormControlAfterPrepare(Sender: TObject; Form: TForm;
      Mode: TFormMode);
    procedure Department1OpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure Department1Change(Sender: TObject);
    procedure DepartmentChange(Sender: TObject);
    procedure DepartmentOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure IsDepartmentChange(Sender: TObject);
    procedure FormControlInfoRecordAfterPrepare(Sender: TObject);
    procedure PercentChange(Sender: TObject);
  private
    { Private declarations }
  public
    Id_Calc_Type : Integer; // Тип расчета разбивки надбавок
    dmShtatUtils : TdmShtatUtils;
    DateOrder : TDate;
    IdOrder : Integer;
  end;

var
  fmPremiaOrder: TfmPremiaOrder;

implementation

{$R *.dfm}

procedure TfmPremiaOrder.OkActionExecute(Sender: TObject);
begin
    FormControl.Ok;
end;

procedure TfmPremiaOrder.CancelActionExecute(Sender: TObject);
begin
    Close;
end;

//вызов справочника физ.лиц
procedure TfmPremiaOrder.FioOpenSprav(Sender: TObject; var Value: Variant;
  var DisplayText: String);
var
    result : Variant;
begin
    try
        result := AllPeopleUnit.GetManForASUP(Self, LocalDatabase.Handle, False, True);
        if (not VarIsNull(result)) and not (VarType(result) = varNull) and
        not (VarArrayDimCount(result) = 0) then begin
            Value := result[0];
            DisplayText := result[1];
        end;

    except on e:Exception do begin
            qFErrorDialog('Неможливо завантажити довідник фізичних осіб! Виникла помилка: "' +
                        e.Message + '"');
            exit;
        end;
    end;

            SelectCurWorkPlace.Close;
            SelectCurWorkPlace.ParamByName('CUR_DATE').AsDate := DateBeg.Value;
            SelectCurWorkPlace.ParamByName('ID_MAN').AsInteger := FIO.Value;
            SelectCurWorkPlace.Open;
            SelectCurWorkPlace.FetchAll;

            if SelectCurWorkPlace.RecordCount = 1 then begin
                WorkPlace.Value := SelectCurWorkPlaceID_MAN_MOVING.Value;
                WorkPlace.DisplayText := SelectCurWorkPlace['NAME_POST_SALARY'] + ' (' + SelectCurWorkPlace['NAME_DEPARTMENT'] + ')';
            end
            else begin
                WorkPlace.Value := Null;
                WorkPlace.DisplayText := '';
            end;

            Reason.Value := 'Заява ' + result[2]+' '+copy(result[3],1,1)+'.'+copy(result[4],1,1)+'.';
            Percent.Value:=null;
            Summa.Value:=null;
end;

procedure TfmPremiaOrder.FioChange(Sender: TObject);
begin
    if VarIsNull(Fio.Value) then
        exit;

    SelectCurWorkPlace.Close;
    SelectCurWorkPlace.ParamByName('Cur_Date').AsDate := DateBeg.Value;
    SelectCurWorkPlace.ParamByName('Id_Man').AsInteger := Fio.Value;
    SelectCurWorkPlace.Open;
    SelectCurWorkPlace.FetchAll;

    if SelectCurWorkPlace.RecordCount = 1 then begin
        WorkPlace.Value := SelectCurWorkPlaceID_MAN_MOVING.Value;
        WorkPlace.DisplayText := SelectCurWorkPlaceNAME_POST_SALARY.Value + ' (' + SelectCurWorkPlaceNAME_DEPARTMENT.Value + ')';
    end;

    Percent.Value:=null;
    Summa.Value:=null;
end;

procedure TfmPremiaOrder.WorkPlaceOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
begin
    if VarIsNull(FIO.Value) then begin
        qFErrorDialog('Спочатку треба вибрати працівника!');
        exit;
    end;
    //чтобы верно выбиралось место работы
    SelectCurWorkPlace.Close;
    SelectCurWorkPlace.ParamByName('CUR_DATE').AsDate := DateBeg.Value;
    SelectCurWorkPlace.ParamByName('ID_MAN').AsInteger := FIO.Value;
    SelectCurWorkPlace.Open;
    SelectCurWorkPlace.FetchAll;

    if qSelect(SelectCurWorkPlace) then
    begin
        Value := SelectCurWorkPlace['ID_MAN_MOVING'];
        DisplayText := SelectCurWorkPlace['NAME_POST_SALARY'] + ' (' + SelectCurWorkPlace['NAME_DEPARTMENT'] + ')';
    end;

    Percent.Value:=null;
    Summa.Value:=null;

end;

procedure TfmPremiaOrder.RadioButton1Click(Sender: TObject);
begin
    if FormControl.Mode = fmInfo then exit;

    if RadioButton1.Checked then begin
        Percent.Blocked := False;
        Percent.Required := True;
        Summa.Blocked := True;
        //Summa.Value := null;
        Summa.Required := False;
    end;

    if RadioButton2.Checked then begin
        Percent.Blocked := True;
        Summa.Blocked := False;
        Summa.Required := True;
        Percent.Value := null;
        Percent.Required := False;
    end;
end;

procedure TfmPremiaOrder.IdRaiseOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    sp: TSprav;
begin
        // создать справочник
    sp :=  GetSprav('ASUP\SpRaise');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(LocalDatabase.Handle);
                // модальный показ
            FieldValues['ShowStyle'] := 0;
                // единичная выборка
            FieldValues['Select'] := 1;

            FieldValues['Raise_Select_Kind'] := 0;
            FieldValues['Actual_Date'] := DateOrder;
            Post;
        end;

        sp.Show;
        if ( sp.Output <> nil ) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['Id_Raise'];
            DisplayText := sp.Output['Name'];
        end;
        sp.Free;
    end;
end;

procedure TfmPremiaOrder.SmetaOpenSprav(Sender: TObject; var Value: Variant;
  var DisplayText: String);
var
    id:variant;
begin
    id := GlobalSPR.GetSmets(Owner, LocalDatabase.Handle, DateOrder, psmSmet);

    if ( VarArrayDimCount(id)>0 ) and ( id[0] <> Null ) then
    begin
        Value := id[0];
        DisplayText := IntToStr(id[3]) + '. ' + id[2];
   end;
end;

procedure TfmPremiaOrder.FormControlNewRecordAfterPrepare(Sender: TObject);
var
    y, m, d : Word;
begin
    DecodeDate(Date, y, m, d);

    DateBeg.Value := EncodeDate(y, m, 1);
    d:=DaysInAMonth(y, m);
    DateEnd.Value := EncodeDate(y, m, d);
   // DateEnd.Value := EncodeDate(y, m + 1, 1) - 1;
end;


procedure TfmPremiaOrder.FormControlModifyRecordAfterPrepare(
  Sender: TObject);
begin
   if not VarIsNull(Department.Value) then begin
        IsDepartment.Value := True;
        IsDepartmentChange(IsDepartment);
    end;

    {if VarIsNull(Summa.Value) then
        RadioButton1.Checked := True
    else
        RadioButton2.Checked := True; }
    if VarIsNull(Percent.Value) then
        RadioButton2.Checked := True
    else
        RadioButton1.Checked := True;

    RadioButton1Click(Self);

end;

procedure TfmPremiaOrder.IdTypeChange(Sender: TObject);
begin
    if FormControl.Mode = fmInfo then exit;
    //мат. помощь
    if IdType.Value = 2 then begin
        RadioButton1.Enabled := False;
        RadioButton2.Checked := True;
        RadioButton1Click(Self);
        Note.Value := 'у зв''язку з  відповідно до п.  Положення "Про порядок і умови надання матеріальної допомоги"';
        Note.Default := 'у зв''язку з  відповідно до п.  Положення "Про порядок і умови надання матеріальної допомоги"';
        Reason.Required := True;
        Reason.Visible := True;

        //чтобы при переключении премия-мат.помощь отображение места работы было верное
        if (VarIsNull(WorkPlace.Value) and (IsDepartment.Value)) then
           WorkPlace.Visible :=False;

        //Department.Enabled := False;
        qFCharControl_Notes.Visible := True;
        IsDepartment.Visible  := True;
        WorkPlace.Required := True;
        Department.Visible:=True;

        //Скрытие невидимых панелей
        MPanel.Visible := True;
        PanelOther.Top:=154;
        IsPercentBox.Top:=286;
        Note.Top:=349;
        Reason.Top:=381;
        TopPanel.Height := 409;
    end
    else begin
        //премия
        RadioButton1.Enabled := True;
        RadioButton1Click(Self);
        Note.Value := '';
        Note.Default := '';
        Reason.Required := False;
        Reason.Value := '';

        qFCharControl_Notes.Visible := False;
        IsDepartment.Visible  := False;
        Department.Visible := False;

        //отключаем контроль обязательного заполнения места работы!
        //в дальнейшем - включить
        //WorkPlace.Required := True;
        WorkPlace.Required := False;
        WorkPlace.Visible := True;

       //Скрытие невидимых панелей
       MPanel.Visible := False;
       PanelOther.Top:=MPanel.Top;
       IsPercentBox.Top:=PanelOther.Top+PanelOther.Height+2;
       Note.Top:=IsPercentBox.Top+IsPercentBox.Height+6;
       Reason.Top:=Note.Top;//+Note.Height;+11;
       Reason.Visible := False;
       TopPanel.Height := Note.Top+Note.Height+7;
    end;
end;

procedure TfmPremiaOrder.FormControlAfterRecordAdded(Sender: TObject);
begin
    IdOrder := FormControl.LastId;
end;

procedure TfmPremiaOrder.FormControlAfterPrepare(Sender: TObject;
  Form: TForm; Mode: TFormMode);
begin
    IdTypeChange(Self);
    RadioButton1Click(Self);
end;

procedure TfmPremiaOrder.Department1OpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    sp: TSprav;
begin
        // создать справочник
    sp :=  GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(LocalDatabase.Handle);
            FieldValues['Actual_Date'] := DateBeg.Value;
            Post;
        end;

                // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        if ( sp.Output <> nil ) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['Id_Department'];
            DisplayText := sp.Output['Name_Full'];

            ShtatrasQuery.CloseOpen(False);
        end;
        sp.Free;
    end;
end;

procedure TfmPremiaOrder.Department1Change(Sender: TObject);
begin
    if not VarIsNull(Department.Value) then begin
        ShtatrasQuery.Close;
        ShtatrasQuery.ParamByName('ID_DEPARTMENT').AsInteger := Department.Value;
    end;
end;

procedure TfmPremiaOrder.DepartmentChange(Sender: TObject);
begin
 if not VarIsNull(Department.Value) then begin
        ShtatrasQuery.Close;
        ShtatrasQuery.ParamByName('ID_DEPARTMENT').AsInteger := Department.Value;
        WorkPlace.Required := False;
    end
    else
        WorkPlace.Required := True;
end;

procedure TfmPremiaOrder.DepartmentOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    sp: TSprav;
begin
        // создать справочник
    sp :=  GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(LocalDatabase.Handle);
            FieldValues['Actual_Date'] := DateBeg.Value;
            Post;
        end;

        // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        if ( sp.Output <> nil ) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['Id_Department'];
            DisplayText := sp.Output['Name_Full'];
            ShtatrasQuery.CloseOpen(False);
        end;
        sp.Free;
    end;
end;

procedure TfmPremiaOrder.IsDepartmentChange(Sender: TObject);
begin
    if IdType.Value = 2 then
    begin
        if VarIsNull(WorkPlace.Value) then
        begin
           if IsDepartment.Value then
           begin
              Department.Visible := True;
              Department.Required := True;
              Department.Blocked := False;
              WorkPlace.Visible := False;
              WorkPlace.Required := False;
              WorkPlace.Value := null;
              WorkPlace.DisplayText := '';
          end
          else
          begin
              //Department.Visible := False;
              Department.Blocked := True;
              Department.Required := False;
              WorkPlace.Required := True;
              WorkPlace.Visible := True;
              Department.Value := null;
              Department.DisplayText := '';
          end;
      end;
    end;
end;

procedure TfmPremiaOrder.FormControlInfoRecordAfterPrepare(
  Sender: TObject);
begin
   {if VarIsNull(Summa.Value) then
        RadioButton1.Checked := True
    else
        RadioButton2.Checked := True; }
    if VarIsNull(Percent.Value) then
        RadioButton2.Checked := True
    else
        RadioButton1.Checked := True;

    RadioButton1Click(Self);
end;

procedure TfmPremiaOrder.PercentChange(Sender: TObject);
begin
    if ((not VarIsNull(Percent.Value)) and (not VarIsNull(Fio.Value)) and (not VarIsNull(WorkPlace.Value))) then
    begin
            DSPercent.Close;
            DSPercent.ParamByName('ID_MAN_MOVING').AsInteger := WorkPlace.Value;//SelectCurWorkPlace['ID_MAN_MOVING'];
            DSPercent.ParamByName('CUR_DATE').AsDate := DateBeg.Value;
            DSPercent.ParamByName('PERCENT').AsExtended := Percent.Value;
            DSPercent.Open;
            DSPercent.FetchAll;
            Summa.Value:=DSPercentOKLAD.Value;
    end;
    //чтобы сумма не исчезала!
    if ((VarIsNull(Percent.Value) or VarIsNull(Fio.Value) or VarIsNull(WorkPlace.Value)) and (not(RadioButton2.Checked)))
    then Summa.Value:=0;
end;

end.
