unit uShtatData;

interface

uses
    SysUtils, Classes, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
    Controls, RxMemDS, uShtatUtils, FIBQuery, pFIBQuery;

type
    TdmShtatView = class(TDataModule)
        DB: TpFIBDatabase;
        DefaultTransaction: TpFIBTransaction;
        ReadTransaction: TpFIBTransaction;
        CurrSR: TpFIBDataSet;
        DepartmentsSelect: TpFIBDataSet;
        SmetaSelect: TpFIBDataSet;
        BonusSelect: TpFIBDataSet;
        BonusSource: TDataSource;
        BonusSelectID_SHTAT_BONUS: TFIBIntegerField;
        BonusSelectID_RAISE: TFIBIntegerField;
        BonusSelectDATE_BEG: TFIBDateField;
        BonusSelectDATE_END: TFIBDateField;
        BonusSelectIS_PERCENT: TFIBStringField;
        BonusSelectSUMMA: TFIBFloatField;
        BonusSelectKOD_SM: TFIBIntegerField;
        BonusSelectKOD_SM_PPS: TFIBIntegerField;
        BonusSelectRAISE_NAME: TFIBStringField;
        BonusSelectSMETA_TITLE: TFIBStringField;
        BonusSelectPPS_SMETA_TITLE: TFIBStringField;
        BonusSelectSMETA_KOD: TFIBIntegerField;
        BonusSelectPPS_SMETA_KOD: TFIBIntegerField;
        AllSR: TpFIBDataSet;
        BonusCalcSource: TDataSource;
        SelectTypePost: TpFIBDataSet;
        SelectTypePostID_TYPE_POST: TFIBIntegerField;
        SelectTypePostNAME_TYPE_POST: TFIBStringField;
        ShtatLocate: TpFIBDataSet;
        AllTypePost: TpFIBDataSet;
        dsShtatTree: TpFIBDataSet;
        MakeMFundTable: TpFIBDataSet;
        CleanMFundTable: TpFIBQuery;
        WriteTransaction: TpFIBTransaction;
        BonusSelectBONUS_SUM: TFIBFloatField;
        BonusSelectBONUS_PPS: TFIBFloatField;
        BonusSelectPERCENT: TFIBFloatField;
        Consts_Query: TpFIBDataSet;
        RaiseDefaults: TpFIBDataSet;
        CalcVacancies: TpFIBQuery;
        PeopleSource: TDataSource;
        BonusSelectBONUS_MAIN: TFIBFloatField;
        LevelsSelect: TpFIBDataSet;
        LevelsSelectID_LEVEL: TFIBBCDField;
        LevelsSelectLEVEL_ORDER: TFIBIntegerField;
        LevelsSelectLEVEL_NAME: TFIBStringField;
        GetPercentFromSum: TpFIBDataSet;
        ShtatViewTransaction: TpFIBTransaction;
        ShtatPeople: TpFIBDataSet;
        ShtatPeopleID_MAN_MOV_SMET: TFIBIntegerField;
        ShtatPeopleID_MAN_MOVING: TFIBIntegerField;
        ShtatPeopleNAME_POST: TFIBStringField;
        ShtatPeopleOKLAD: TFIBFloatField;
        ShtatPeopleFIO: TFIBStringField;
        ShtatPeopleDATE_BEG: TFIBDateField;
        ShtatPeopleREAL_DATE_END: TFIBDateField;
        ShtatPeopleTN: TFIBIntegerField;
        ShtatPeopleKOD_SM: TFIBIntegerField;
        ShtatPeopleKOD_SM_PPS: TFIBIntegerField;
        ShtatPeopleSMETA_TITLE: TFIBStringField;
        ShtatPeopleSMETA_PPS_TITLE: TFIBStringField;
        ShtatPeopleSTATUS: TFIBIntegerField;
        ShtatPeopleNUM_ORDER: TFIBStringField;
        ShtatPeopleDATE_ORDER: TFIBDateField;
        ShtatPeopleNUM_ORDER_KADR: TFIBStringField;
        ShtatPeopleDATE_ORDER_KADR: TFIBDateField;
        ShtatPeopleID_ORDER: TFIBIntegerField;
        ShtatPeopleTEMPFOR: TFIBStringField;
        ShtatPeopleTEMPFREE: TFIBStringField;
        ShtatPeopleNAME_SOVMEST: TFIBStringField;
        ShtatPeopleORDER_STR: TFIBStringField;
        ShtatPeopleFACT_STAVOK: TFIBFloatField;
        ShtatPeopleTEMPFREE_STAVOK: TFIBFloatField;
        ShtatPeopleTEMPFOR_STAVOK: TFIBFloatField;
        ShtatPeopleILL: TFIBIntegerField;
        ShtatPeopleHOLIDAY: TFIBIntegerField;
        ShtatPeopleNAME_HOLIDAY: TFIBStringField;
        ShtatPeopleID_WORK_REASON: TFIBIntegerField;
        ShtatPeopleTEMP_REASON: TFIBStringField;
        ShtatPeopleNAME_TYPE_POST: TFIBStringField;
        ShtatPeopleIS_SOVM: TFIBIntegerField;
        ShtatPeopleFIO_TN: TStringField;
        ShtatPeopleSMETS: TStringField;
        PeopleTransaction: TpFIBTransaction;
    SmetEditDataSet: TpFIBDataSet;
    WMByPeriodSet: TpFIBDataSet;
    DepartEditDSet: TpFIBDataSet;
    IsTarifDSet: TpFIBDataSet;
    DSetGetComment: TpFIBDataSet;
    PubSysData: TpFIBDataSet;
    ShtatPeopleBASE_OKLAD: TFIBFloatField;
    ShtatPeopleOKLAD_PPS: TFIBFloatField;
    ShtatPeopleFIO_SMALL: TFIBStringField;
    ShtatPeopleORDER_STR_SIMPLE: TFIBStringField;
    ShtatPeopleKOL_STAVOK: TFIBBCDField;
        procedure DataModuleCreate(Sender: TObject);
        procedure ShtatPeopleCalcFields(DataSet: TDataSet);
    private
        { Private declarations }
    public
        SR_Date_Beg: TDate;
        SR_Date_End: TDate;

        DMUtils: TdmShtatUtils;

        LastActionIsAdd: Boolean;
        Last_ShtatRas_Smet: Variant;
        Last_Smeta: Variant;
        Last_TypePost: Variant;

        NewVersion: Boolean;

        constructor Create(AOwner: TComponent; Handle: Integer); reintroduce;
        destructor Destroy; override;

        procedure GetSmeta(var Value: Variant; var DisplayText: string);
        procedure GetDepartment(var Value: Variant; var DisplayText: string);
        procedure GetShtatDoc(var Value: Variant; var DisplayText: string;
            var LAST_VACANCIES_CALC_DATE: Variant);
        procedure GetTypePost(var Value: Variant; var DisplayText: string);
        procedure GetRaise(var Value: Variant; var DisplayText: string);
        function PostSalaryIsTarif(IdPostSalary:Variant; ActDate:TDate):Boolean;
        function GetInfinityDate:TDate;
    end;

var
    dmShtatView: TdmShtatView;

implementation

uses IBase, GlobalSPR, Forms, Variants, uShtatConsts, uCommonSp,
    uShtatSalarySelect, uSelectForm, Dialogs, qFTools, UpKernelUnit;

constructor TdmShtatView.Create(AOwner: TComponent; Handle: Integer);
begin
    inherited Create(AOwner);
    DB.Handle := TISC_DB_Handle(Handle);

    DMUtils := TdmShtatUtils.Create(AOwner, Handle, ActualDate);
end;

destructor TdmShtatView.Destroy;
begin
    inherited Destroy;

    DMUtils.Free;
end;

procedure TdmShtatView.GetTypePost(var Value: Variant; var DisplayText: string);
begin
    if qSelect(SelectTypePost) then
    begin
        Value := SelectTypePost['Id_Type_Post'];
        DisplayText := SelectTypePost['Name_Type_Post'];
    end;
end;

function TdmShtatView.PostSalaryIsTarif(IdPostSalary:Variant; ActDate:TDate):Boolean;
begin
   Result:=False;
   if VarIsNull(IdPostSalary) then Exit;
   with IsTarifDSet do
   begin
      Close;
      SQLs.SelectSQL.Text:='select first(1) bs.use_digit '+
                           'from   sp_post_base_salary bs, sp_post_salary s '+
                           'where  bs.id_post_base_salary=s.id_post_base_salary '+
                           'and    s.id_post_salary=:id_post_salary '+
                           'and    :act_date between bs.date_beg and bs.date_end ';
      ParamByName('id_post_salary').AsInteger:=IdPostSalary;
      ParamByName('act_date').AsDate:=ActDate;
      Open;
      FetchAll;
   end;
   if ((IsTarifDSet['use_digit']=2) and (not IsTarifDSet.IsEmpty))
   then Result:=True
   else Result:=False;
end;

procedure TdmShtatView.GetSmeta(var Value: Variant; var DisplayText: string);
var
    id: variant;
begin
    id := GlobalSPR.GetSmets(Owner, DB.Handle, Date, psmSmet);

    if (VarArrayDimCount(id) > 0) and (id[0] <> Null) then
    begin
        Value := id[0];
        DisplayText := IntToStr(id[3]) + '. ' + id[2];
    end;
end;

procedure TdmShtatView.GetDepartment(var Value: Variant; var DisplayText: string);
var
    sp: TSprav;
begin
    // создать справочник
    sp := GetSprav('SpDepartment');
    if sp <> nil then
    begin
        // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(DB.Handle);
            FieldValues['Actual_Date'] := ActualDate;
            Post;
        end;

        // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['Id_Department'];
            DisplayText := sp.Output['Name_Full'];
        end;
        sp.Free;
    end;
end;

procedure TdmShtatView.GetRaise(var Value: Variant; var DisplayText: string);
var
    sp: TSprav;
begin
    // создать справочник
    sp := GetSprav('ASUP\SpRaise');
    if sp <> nil then
    begin
        // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(DB.Handle);
            // модальный показ
            FieldValues['ShowStyle'] := 0;
            // единичная выборка
            FieldValues['Select'] := 1;

            FieldValues['Raise_Select_Kind'] := 1;
            FieldValues['Actual_Date'] := ActualDate;
            Post;
        end;

        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['Id_Raise'];
            DisplayText := sp.Output['Name'];
        end;
        sp.Free;
    end;
end;


procedure TdmShtatView.GetShtatDoc(var Value: Variant; var DisplayText: string;
    var LAST_VACANCIES_CALC_DATE: Variant);
var
    sp: TSprav;
begin
    // создать справочник
    sp := GetSprav('ASUP\ShtatDoc');
    if sp <> nil then
    begin
        // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(DB.Handle);
            // модальный показ
            FieldValues['ShowStyle'] := 0;
            // единичная выборка
            FieldValues['Select'] := 1;
            Post;
        end;

        // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['Id_SR'];
            DisplayText := sp.Output['Name'];
            SR_Date_Beg := sp.Output['Date_Beg'];
            SR_Date_End := sp.Output['Date_End'];
            AllSR.Close;
            AllSR.Open;
            if AllSR.Locate('Id_SR', Value, []) then
                LAST_VACANCIES_CALC_DATE := AllSR['LAST_VACANCIES_CALC_DATE'];

        end;
        sp.Free;
    end;
end;


{$R *.dfm}

procedure TdmShtatView.DataModuleCreate(Sender: TObject);
begin
    shtRootDepartment := DMUtils.ConstsQuery['Current_Department'];
    CurrSR.ParamByName('Cur_Date').AsDate := ActualDate;
    CurrSR.Open;

    DepartmentsSelect.ParamByName('Root').AsInteger := shtRootDepartment;
    DepartmentsSelect.ParamByName('Actual_Date').AsDate := ActualDate;
    DepartmentsSelect.Open;

    AllTypePost.Open;

    SmetaSelect.Open;

    StartHistory(WriteTransaction);
end;

procedure TdmShtatView.ShtatPeopleCalcFields(DataSet: TDataSet);
begin
    DataSet['FIO_TN'] := Coalesce(DataSet['FIO'], '') + ' (т/н ' +
        IntToStr(Coalesce(DataSet['TN'], -1)) + ')';

    if VarIsNull(DataSet['Kod_Sm_Pps']) or (DataSet['Kod_Sm_Pps'] = 0) then
        DataSet['Smets'] := IntToStr(DataSet['Kod_Sm'])
    else DataSet['Smets'] := IntToStr(DataSet['Kod_Sm']) + ' / ' +
        IntToStr(DataSet['Kod_Sm_Pps']);
end;

function TdmShtatView.GetInfinityDate:TDate;
begin
  try
    PubSysData.Close;
    PubSysData.SQLs.SelectSQL.Text:='select * from pub_sys_data';
    PubSysData.Open;
    if VarIsNull(PubSysData['INFINITY_DATE']) then Result:=EncodeDate(9999, 12, 31)
    else Result:=PubSysData['INFINITY_DATE'];
  except on E:Exception do
         begin
            ShowMessage(E.Message);
            Exit;
         end;
  end;
end;

end.

