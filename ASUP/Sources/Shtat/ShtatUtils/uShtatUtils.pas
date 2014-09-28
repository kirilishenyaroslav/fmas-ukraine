unit uShtatUtils;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  Controls;

type
  TdmShtatUtils = class(TDataModule)
    WorkCondSelect: TpFIBDataSet;
    WorkCondSelectID_WORK_COND: TFIBIntegerField;
    WorkCondSelectNAME_WORK_COND: TFIBStringField;
    WorkModeSelect: TpFIBDataSet;
    WorkModeSelectID_WORK_MODE: TFIBIntegerField;
    WorkModeSelectNAME_WORK_MODE: TFIBStringField;
    SpzSelect: TpFIBDataSet;
    SpzSelectID_SPZ: TFIBIntegerField;
    SpzSelectSPZ: TFIBStringField;
    SpzSelectNAME_SPZ: TFIBStringField;
    PayFormSelect: TpFIBDataSet;
    PayFormSelectID_PAY_FORM: TFIBIntegerField;
    PayFormSelectNAME_PAY_FORM: TFIBStringField;
    SalarySelect: TpFIBDataSet;
    SalarySelectID_POST_SALARY: TFIBIntegerField;
    SalarySelectNAME_POST: TFIBStringField;
    SalarySelectNAME_POST_BASE_SALARY: TFIBStringField;
    SalarySelectNAME_POST_SALARY: TFIBStringField;
    SalarySelectSALARY_MIN: TFIBFloatField;
    SalarySelectSALARY_MAX: TFIBFloatField;
    SalarySelectID_POST: TFIBIntegerField;
    SalarySelectPPS_KOEF: TFIBStringField;
    SalarySource: TDataSource;
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    DefaultTransaction: TpFIBTransaction;
    ConstsQuery: TpFIBDataSet;
    SalarySelectNAME_CATEGORY: TFIBStringField;
    PayFormSelectNAME_PAY_FORM_RUS: TFIBStringField;
    SalaryFilterSource: TDataSource;
    SalarySelectFilter: TpFIBDataSet;
    FIBIntegerField1: TFIBIntegerField;
    FIBStringField1: TFIBStringField;
    FIBStringField2: TFIBStringField;
    FIBStringField3: TFIBStringField;
    FIBFloatField1: TFIBFloatField;
    FIBFloatField2: TFIBFloatField;
    FIBIntegerField2: TFIBIntegerField;
    FIBStringField4: TFIBStringField;
    FIBStringField5: TFIBStringField;
    AcceptHistoryQuery: TpFIBDataSet;
    AcceptHistoryQueryNAME_ACCEPT_COND: TFIBStringField;
    AcceptHistoryQueryNAME_ACCEPT_COND_PRINT: TFIBStringField;
    AcceptHistoryQueryDATE_BEG: TFIBDateField;
    AcceptHistoryQueryDATE_END: TFIBDateField;
    AcceptHistoryQueryACCEPT_COND_YEARS: TFIBFloatField;
    AcceptHistoryQueryID_MAN_MOVING: TFIBIntegerField;
    AcceptHistoryQueryID_ACCEPT_COND: TFIBIntegerField;
    SalarySelectFilterID_TYPE_POST: TFIBIntegerField;
    SalarySelectFilterNAME_TYPE_POST: TFIBStringField;
    SalarySelectFULL_SALARY_NAME: TFIBStringField;
    SalarySelectFilterFULL_SALARY_NAME: TFIBStringField;
    SalarySelectFilterSHORT_NAME: TFIBStringField;
    SalarySelectFilterIS_PPS: TFIBStringField;
    dsSalaryRange: TpFIBDataSet;
    SalarySelectSALARY_MIN_STR: TStringField;
    SalarySelectSALARY_MAX_STR: TStringField;
  private
     FActual_Date: TDate;
     FOld_Oklads: Integer;

  public
    constructor Create(AOwner: TComponent; Handle: Integer; ActualDate: TDate); reintroduce;

    procedure GetSalary(var Value: Variant; var DisplayText: String);
    procedure GetSalaryFilter(var Value: Variant; var DisplayText: String; Id_Department : Variant);
    procedure GetSalaryRange(Id_Post_Salary: Integer; var Salary_Min, Salary_Max,
                             Base_Salary_Min, Base_Salary_Max: Double);
    function GetSalaryIdPost(Id_Post_Salary: Integer): Integer;

    procedure GetWorkMode(var Value: Variant; var DisplayText: String);
    procedure GetWorkCond(var Value: Variant; var DisplayText: String);
    procedure GetPayForm(var Value: Variant; var DisplayText: String);
    procedure GetSPZ(var Value: Variant; var DisplayText: String);
    procedure GetAcceptCondHistory(ID_Pcard : Integer; var Value: Variant; var DisplayText: String);

    function DefaultWorkMode: Integer;
    function DefaultWorkModeName: String;

    function DefaultWorkCond: Integer;
    function DefaultWorkCondName: String;

    function DefaultPayForm: Integer;
    function DefaultPayFormName: String;

    procedure SetActualDate(Act_Date: TDate);
    procedure SetOldOklads(P_Old_Oklads: Integer);

    procedure ReOpen;

    property Actual_Date: TDate read FActual_Date write SetActualDate;
    property Old_Oklads: Integer read FOld_Oklads write SetOldOklads;
  end;

var
  dmShtatUtils: TdmShtatUtils;

implementation

{$R *.dfm}

uses uSelectForm, IBase, uShtatSalarySelect, Forms, Variants, Dialogs;

procedure TdmShtatUtils.ReOpen;
begin
    SalarySelect.Close;

    SalarySelect.ParamByName('Cur_Date').AsDate := Actual_Date;
    SalarySelect.ParamByName('Old_Oklads').AsInteger := FOld_Oklads;
    SalarySelect.Open;

    SalarySelectFilter.ParamByName('Cur_Date').AsDate := Actual_Date;
    SalarySelectFilter.ParamByName('Old_Oklads').AsInteger := FOld_Oklads;
end;

procedure TdmShtatUtils.SetOldOklads(P_Old_Oklads: Integer);
begin
    if FOld_Oklads <> P_Old_Oklads then
    begin
        FOld_Oklads := P_Old_Oklads;

        ReOpen;
    end;
end;

procedure TdmShtatUtils.SetActualDate(Act_Date: TDate);
begin
    if Self.Actual_Date <> Act_Date then
    begin
        FActual_Date := Act_Date;
        ReOpen;
    end;
end;

constructor TdmShtatUtils.Create(AOwner: TComponent; Handle: Integer; ActualDate: TDate);
begin
    inherited Create(AOwner);
    DB.Handle := TISC_DB_Handle(Handle);
    Self.Actual_Date := ActualDate;
    Old_Oklads := 0;

    ReOpen;

    ConstsQuery.Open;

    PayFormSelect.Open;
    SpzSelect.Open;
    WorkCondSelect.Open;
    WorkModeSelect.Open;
end;

function TdmShtatUtils.DefaultWorkMode: Integer;
begin
    Result := ConstsQuery['Default_Work_Mode'];
end;

function TdmShtatUtils.DefaultWorkCond: Integer;
begin
    Result := ConstsQuery['Default_Work_Cond'];
end;

function TdmShtatUtils.DefaultPayForm: Integer;
begin
    Result := ConstsQuery['Default_Pay_Form'];
end;

function TdmShtatUtils.DefaultWorkModeName: String;
begin
    if WorkModeSelect.Locate('Id_Work_Mode', ConstsQuery['Default_Work_Mode'], [])
        then Result := WorkModeSelect['Name']
    else Result := '???';
end;

function TdmShtatUtils.DefaultWorkCondName: String;
begin
    if WorkCondSelect.Locate('Id_Work_Cond', ConstsQuery['Default_Work_Cond'], [])
        then Result := WorkCondSelect['Name_Work_Cond']
    else Result := '???';
end;

function TdmShtatUtils.DefaultPayFormName: String;
begin
    if PayFormSelect.Locate('Id_Pay_Form', ConstsQuery['Default_Pay_Form'], [])
        then Result := PayFormSelect['Name_Pay_Form']
    else Result := '???';
end;

function TdmShtatUtils.GetSalaryIdPost(Id_Post_Salary: Integer): Integer;
begin
    SalarySelect.Locate('Id_Post_Salary', Id_Post_Salary, []);

    Result := SalarySelect['Id_Post'];
end;

procedure TdmShtatUtils.GetSalaryRange(Id_Post_Salary: Integer; var Salary_Min, Salary_Max,
                                       Base_Salary_Min, Base_Salary_Max: Double);
begin
    dsSalaryRange.Close;
    dsSalaryRange.ParamByName('Id_Post_Salary').AsInteger := Id_Post_Salary;
    dsSalaryRange.ParamByName('Cur_Date').AsDate := FActual_Date;
    dsSalaryRange.Open;

    if dsSalaryRange.IsEmpty then
    begin
        Salary_Min := 0;
        Salary_Max := 0;
        Base_Salary_Min := 0;
        Base_Salary_Max := 0;
    end
    else
    begin
    if   VarIsNull(dsSalaryRange['Salary_Min'])
    then Salary_Min := 0
    else Salary_Min := dsSalaryRange['Salary_Min'];
    if   VarIsNull(dsSalaryRange['Salary_Max'])
    then Salary_Max := 0
    else Salary_Max := dsSalaryRange['Salary_Max'];
    if   VarIsNull(dsSalaryRange['Base_Salary_Min'])
    then Base_Salary_Min := 0
    else Base_Salary_Min := dsSalaryRange['Base_Salary_Min'];
    if   VarIsNull(dsSalaryRange['Base_Salary_Max'])
    then Base_Salary_Max := 0
    else Base_Salary_Max := dsSalaryRange['Base_Salary_Max'];


    end;
end;

procedure TdmShtatUtils.GetWorkMode(var Value: Variant; var DisplayText: String);
begin
    if qSelect(WorkModeSelect) then
    begin
        Value := WorkModeSelect['Id_Work_Mode'];
        DisplayText := WorkModeSelect['Name'];
    end;
end;

procedure TdmShtatUtils.GetPayForm(var Value: Variant; var DisplayText: String);
begin
    if qSelect(PayFormSelect) then
    begin
        Value := PayFormSelect['Id_Pay_Form'];
        DisplayText := PayFormSelect['Name_Pay_Form'];
    end;
end;

procedure TdmShtatUtils.GetSPZ(var Value: Variant; var DisplayText: String);
begin
    if qSelect(SpzSelect) then
    begin
        Value := SpzSelect['Id_Spz'];
        DisplayText := SpzSelect['Name_Spz'];
    end;
end;

procedure TdmShtatUtils.GetWorkCond(var Value: Variant; var DisplayText: String);
begin
    if qSelect(WorkCondSelect) then
    begin
        Value := WorkCondSelect['Id_Work_Cond'];
        DisplayText := WorkCondSelect['Name_Work_Cond'];
    end;
end;

procedure TdmShtatUtils.GetAcceptCondHistory(ID_Pcard : Integer; var Value: Variant; var DisplayText: String);
begin
    AcceptHistoryQuery.Close;
    AcceptHistoryQuery.ParamByName('ID_PCARD').AsInteger := ID_Pcard;
    AcceptHistoryQuery.Open;

    if qSelect(AcceptHistoryQuery) then
    begin
        Value := AcceptHistoryQueryID_ACCEPT_COND.Value;
        DisplayText := AcceptHistoryQueryNAME_ACCEPT_COND.Value;
    end;
end;


procedure TdmShtatUtils.GetSalary(var Value: Variant; var DisplayText: String);
var
    form: TfmShtatSalarySelect;
begin
    form := TfmShtatSalarySelect.Create(Application.MainForm, Self);
    if form.ShowModal = mrOk then
    begin
        Value := SalarySelect['Id_Post_Salary'];
        DisplayText := SalarySelect['Name_Post'] + ' ' +
            SalarySelect['Name_Post_Base_Salary'] + ' ' +
            SalarySelect['Name_Post_Salary'];
    end
    else
    begin
        Value := Null;
        DisplayText := '';
    end;
    form.Free;
end;

procedure TdmShtatUtils.GetSalaryFilter(var Value: Variant; var DisplayText: String; Id_Department : Variant);
var
    form: TfmShtatSalarySelect;
begin
    form := TfmShtatSalarySelect.Create(Application.MainForm, Self);
//    ShowMessage(DateToStr(Actual_Date));
    Self.SalarySelectFilter.Close;
    Self.SalarySelectFilter.ParamByName('CUR_DATE').AsDate := Actual_Date;
    Self.SalarySelectFilter.ParamByName('ID_DEPARTMENT').AsInteger := Id_Department;
    Self.SalarySelectFilter.ParamByName('Old_Oklads').AsInteger := FOld_Oklads;
    Self.SalarySelectFilter.Open;

    Form.SalaryTableView.DataController.DataSource := Self.SalaryFilterSource;

    if form.ShowModal = mrOk then
    begin
        Value := SalarySelectFilter['Id_Post_Salary'];
        DisplayText := SalarySelectFilter['Name_Post'] + ' ' +
            SalarySelectFilter['Name_Post_Base_Salary'] + ' ' +
            SalarySelectFilter['Name_Post_Salary'];
    end
    else
    begin
        Value := Null;
        DisplayText := '';
    end;
    form.Free;
end;

end.
