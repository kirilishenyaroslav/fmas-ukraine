unit NewAcceptUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, RxMemDS, uCommonSp, uFormControl, Buttons, Grids, Spin,
  StdCtrls, SpComboBox, DBGrids, ExtCtrls, Mask, CheckEditUnit, ComCtrls,
  uFControl, uLabeledFControl, uSpravControl, uDateControl, uEnumControl,
  uCharControl, uIntControl, uBoolControl, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, ibase, uSelectForm, uFloatControl,  
  uShtatUtils, ActnList, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, uActionControl, uLogicCheck,
  uSimpleCheck, fmAddSmetaUnit, qFTools, DBCtrls;

type
  TNewAcceptForm = class(TForm)
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    FormControl: TqFFormControl;
    PageControl: TPageControl;
    MainSheet: TTabSheet;
    Fio: TqFSpravControl;
    DateBeg: TqFDateControl;
    DateEnd: TqFDateControl;
    MovingType: TqFSpravControl;
    Department: TqFSpravControl;
    PostSalary: TqFSpravControl;
    IsForever: TqFBoolControl;
    PayType: TqFEnumControl;
    LocalDatabase: TpFIBDatabase;
    GetIdMovingQuery: TpFIBDataSet;
    LocalReadTransaction: TpFIBTransaction;
    LocalWriteTransaction: TpFIBTransaction;
    GetIdMovingQueryID_MAN_MOVING: TFIBIntegerField;
    WorkModeSheet: TTabSheet;
    MovTypeQuery: TpFIBDataSet;
    MovTypeQueryID_MOVING_TYPE: TFIBIntegerField;
    MovTypeQueryNAME_MOVING_TYPE: TFIBStringField;
    KeyList: TActionList;
    OkAction: TAction;
    CancelAction: TAction;
    Spz: TqFSpravControl;
    WorkMode: TqFSpravControl;
    qFIntControl1: TqFIntControl;
    Label1: TLabel;
    PayForm: TqFSpravControl;
    WorkCond: TqFSpravControl;
    OkladSheet: TTabSheet;
    Panel3: TPanel;
    AddItemButton: TSpeedButton;
    ModifyItemButton: TSpeedButton;
    DeleteItemButton: TSpeedButton;
    ItemsGrid: TcxGrid;
    cxGridDBTableView5: TcxGridDBTableView;
    cxGridLevel5: TcxGridLevel;
    SmetViewQuery: TRxMemoryData;
    SmetSource: TDataSource;
    SmetViewQueryID_MAN_MOV_SMET: TIntegerField;
    SmetViewQueryID_MAN_MOVING: TIntegerField;
    SmetViewQueryKOD_SM: TIntegerField;
    SmetViewQueryKOD_SM_PPS: TIntegerField;
    SmetViewQueryDATE_BEG: TIntegerField;
    SmetViewQueryDATE_END: TIntegerField;
    SmetViewQueryKOEFF_PPS: TFloatField;
    SmetViewQueryKOL_STAVOK: TFloatField;
    SmetViewQueryOKLAD: TFloatField;
    SmetViewQueryOKLAD_PPS: TFloatField;
    SmetViewQueryOKLAD_BASE: TFloatField;
    cxGridDBTableView5DBColumn1: TcxGridDBColumn;
    cxGridDBTableView5DBColumn3: TcxGridDBColumn;
    cxGridDBTableView5DBColumn4: TcxGridDBColumn;
    cxGridDBTableView5DBColumn5: TcxGridDBColumn;
    cxGridDBTableView5DBColumn6: TcxGridDBColumn;
    AddSmeta: TAction;
    ModifySmeta: TAction;
    DeleteSmeta: TAction;
    ViewSmeta: TAction;
    qFSimpleCheck1: TqFSimpleCheck;
    GetSmTitle: TpFIBDataSet;
    SmetViewQuerySM_TITLE: TStringField;
    SmetViewQuerySM_PPS_TITLE: TStringField;
    GetSmTitleSM_TITLE: TFIBStringField;
    GetSmTitleSM_PPS_TITLE: TFIBStringField;
    WorkQuery: TpFIBDataSet;
    Type_Post: TqFSpravControl;
    SelectTypePost: TpFIBDataSet;
    SelectTypePostID_TYPE_POST: TFIBIntegerField;
    SelectTypePostNAME_TYPE_POST: TFIBStringField;
    qFLogicCheck1: TqFLogicCheck;
    GetDefaultsQuery: TpFIBDataSet;
    GetDefaultsQueryDEFAULT_WORK_MODE: TFIBIntegerField;
    GetDefaultsQueryDEFAULT_PAY_FORM: TFIBIntegerField;
    GetDefaultsQueryDEFAULT_WORK_COND: TFIBIntegerField;
    GetDefaultsQueryNAME: TFIBStringField;
    GetDefaultsQueryNAME_WORK_COND: TFIBStringField;
    GetDefaultsQueryNAME_PAY_FORM: TFIBStringField;
    Reason: TqFCharControl;
    SelectWorkType: TpFIBDataSet;
    SelectWorkTypeID_SOVMEST: TFIBIntegerField;
    SelectWorkTypeNAME_SOVMEST: TFIBStringField;
    SelectWorkTypeNO_ADD: TFIBStringField;
    SelectWorkTypeSHORT_NAME: TFIBStringField;
    SelectWorkTypeSHTAT: TFIBStringField;
    SelectWorkTypeTEMPFREE: TFIBStringField;
    SelectWorkTypeTEMPFOR: TFIBStringField;
    WorkType: TqFSpravControl;
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
    GetDefaultsQueryALLOW_EMPTY_SMETS_IN_ORDERS: TFIBStringField;
    ShtatrasQuery: TpFIBDataSet;
    ShtatrasQueryID_SR: TFIBIntegerField;
    ShtatrasQueryKOL_STAVOK: TFIBFloatField;
    ShtatrasQueryKOL_VACANT_STAVOK: TFIBFloatField;
    ShtatrasQueryKOEFF_PPS: TFIBFloatField;
    ShtatrasQueryWITHKOEF: TFIBStringField;
    ShtatrasQueryOKLAD: TFIBFloatField;
    ShtatrasQueryKOD_SM_PPS: TFIBIntegerField;
    ShtatrasQueryKOD_SM: TFIBIntegerField;
    ShtatrasQuerySM_TITLE: TFIBStringField;
    ShtatrasQuerySM_TITLE_PPS: TFIBStringField;
    ShtatrasQuerySM_NUMBER: TFIBIntegerField;
    ShtatrasQuerySM_NUMBER_PPS: TFIBIntegerField;
    ShtatrasQuerySR_NAME: TFIBStringField;
    IsMainPost: TqFBoolControl;
    CondDateBeg: TqFDateControl;
    CondDateEnd: TqFDateControl;
    IdAcceptCond: TqFSpravControl;
    Label2: TLabel;
    AcceptCondQuery: TpFIBDataSet;
    AcceptCondQueryID_ACCEPT_COND: TFIBIntegerField;
    AcceptCondQueryNAME_ACCEPT_COND: TFIBStringField;
    ShtatrasQueryID_WORK_COND: TFIBIntegerField;
    ShtatrasQueryNAME_WORK_COND: TFIBStringField;
    ShtatrasQueryID_WORK_MODE: TFIBIntegerField;
    ShtatrasQueryNAME_WORK_MODE: TFIBStringField;
    WorkReasonQuery: TpFIBDataSet;
    WorkReasonQueryID_WORK_REASON: TFIBIntegerField;
    WorkReasonQueryNAME_FULL: TFIBStringField;
    WorkReasonQueryNAME_SHORT: TFIBStringField;
    WorkReason: TqFSpravControl;
    SelectTypePostSHORT_NAME: TFIBStringField;
    BonusSheet: TTabSheet;
    BonusButtonsPanel: TPanel;
    AddBonusButton: TSpeedButton;
    ModifyBonusButton: TSpeedButton;
    DeleteBonusButton: TSpeedButton;
    BonusGrid: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    AddBonus: TAction;
    ModifyBonus: TAction;
    DeleteBonus: TAction;
    SpeedButton1: TSpeedButton;
    Panel1: TPanel;
    Label3: TLabel;
    DBText1: TDBText;
    BonusQuery: TpFIBDataSet;
    BonusQueryID_MAN_MOVING: TFIBIntegerField;
    BonusQueryID_MAN_BONUS: TFIBIntegerField;
    BonusQueryIS_PERCENT: TFIBStringField;
    BonusQuerySUMMA: TFIBFloatField;
    BonusQueryDATE_BEG: TFIBDateField;
    BonusQueryDATE_END: TFIBDateField;
    BonusQueryID_RAISE: TFIBIntegerField;
    BonusQueryNOTE: TFIBStringField;
    BonusQueryREASON: TFIBStringField;
    BonusQueryRAISE_NAME: TFIBStringField;
    BonusQueryFIO: TFIBStringField;
    BonusQueryWORK_PLACE: TFIBStringField;
    BonusQueryID_PCARD: TFIBIntegerField;
    BonusQueryThe_Bonus: TStringField;
    cxGridDBTableView5DBColumn2: TcxGridDBColumn;
    ViewBonusButton: TSpeedButton;
    ViewBonus: TAction;
    BonusSource: TDataSource;
    WorkQueryID_MAN_MOV_SMET: TFIBIntegerField;
    WorkQueryID_MAN_MOVING: TFIBIntegerField;
    WorkQueryKOD_SM: TFIBIntegerField;
    WorkQueryKOD_SM_PPS: TFIBIntegerField;
    WorkQueryKOEFF_PPS: TFIBFloatField;
    WorkQueryOKLAD: TFIBFloatField;
    WorkQueryOKLAD_PPS: TFIBFloatField;
    WorkQueryKOL_STAVOK: TFIBFloatField;
    WorkQueryDATE_BEG: TFIBDateField;
    WorkQueryDATE_END: TFIBDateField;
    WorkQueryOKLAD_BASE: TFIBFloatField;
    WorkQuerySM_TITLE: TFIBStringField;
    WorkQuerySM_PPS_TITLE: TFIBStringField;
    ReformBonusButton: TSpeedButton;
    FormShtatBonus: TAction;
    ReformBonusQuery: TpFIBDataSet;
    GetDefaultsQueryDEFAULT_ID_MOVING_TYPE_ACCEPT: TFIBIntegerField;
    GetDefaultsQueryDEFAULT_ID_SOVMEST_ACCEPT: TFIBIntegerField;
    GetDefaultsQueryNAME_MOVING_TYPE: TFIBStringField;
    GetDefaultsQueryNAME_SOVMEST: TFIBStringField;
    GetDefaultsQueryDEFAULT_ID_WORK_REASON: TFIBIntegerField;
    GetDefaultsQueryNAME_FULL: TFIBStringField;
    AcceptCondYears: TqFFloatControl;
    AcceptHistoryButton: TButton;
    AcceptCondQueryNAME_ACCEPT_COND_PRINT: TFIBStringField;
    GetDefaultsQueryCHECK_SR_VACANT_ST: TFIBStringField;
    StagirovkaSrok: TqFIntControl;
    IspitSrok: TqFIntControl;
    IsHoliday: TqFBoolControl;
    IsHospital: TqFBoolControl;
    HolidayFio: TqFSpravControl;
    HospitalFio: TqFSpravControl;
    BonusQueryPERCENT: TFIBFloatField;
    Note: TqFCharControl;
    BonusQueryORDER_BONUS_STR: TFIBStringField;
    BonusQueryRAISE_FULL_NAME: TFIBStringField;
    BonusQuerySOVM_ID_DEPARTMENT: TFIBIntegerField;
    BonusQuerySOVM_ID_POST_SALARY: TFIBIntegerField;
    BonusQuerySOVM_NAME_DEPARTMENT: TFIBStringField;
    BonusQuerySOVM_NAME_POST_SALARY: TFIBStringField;
    BonusQuerySMETA_NAME: TFIBStringField;
    cxGridDBColumn5: TcxGridDBColumn;
    pFIBDS_CheckPermission: TpFIBDataSet;
    pFIBDS_CheckPermissionNUM_PROJECT: TFIBStringField;
    pFIBDS_CheckPermissionDATE_ORDER: TFIBDateField;
    pFIBDS_CheckPermissionOWNER_NAME: TFIBStringField;
    procedure GetMovingByOrder;
    procedure DepartmentOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure OkButtonClick(Sender: TObject);
    procedure FioOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure SpzOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure WorkCondOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure WorkModeOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure PayFormOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure PostSalaryOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure MovingTypeOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure OkActionExecute(Sender: TObject);
    procedure CancelActionExecute(Sender: TObject);
    procedure IsForeverChange(Sender: TObject);
    procedure FormControlNewRecordAfterPrepare(Sender: TObject);
    procedure FormControlModifyRecordAfterPrepare(Sender: TObject);
    procedure FormControlInfoRecordAfterPrepare(Sender: TObject);
    procedure DeleteSmetaExecute(Sender: TObject);
    procedure ShowChangeSmetaForm(FMode : TFormMode);
    procedure AddSmetaExecute(Sender: TObject);
    procedure ModifySmetaExecute(Sender: TObject);
    procedure ViewSmetaExecute(Sender: TObject);
    procedure WriteSmetaInfo(FMode : TFormMode);
    procedure FormControlAfterRecordAdded(Sender: TObject);
    procedure ReadSmet;
    procedure Type_PostOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure PostSalaryChange(Sender: TObject);
    procedure qFLogicCheck1Check(Sender: TObject; var Error: String);
    procedure WorkTypeOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure GetDefaultsQueryAfterOpen(DataSet: TDataSet);
    procedure DateBegChange(Sender: TObject);
    procedure DepartmentChange(Sender: TObject);
    procedure IdAcceptCondOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure ShtatrasQueryAfterOpen(DataSet: TDataSet);
    procedure WorkReasonOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure ShowChangeBonusForm(FMode : TFormMode);
    procedure AddBonusExecute(Sender: TObject);
    procedure ModifyBonusExecute(Sender: TObject);
    procedure DeleteBonusExecute(Sender: TObject);
    procedure BonusQueryCalcFields(DataSet: TDataSet);
    procedure ViewBonusExecute(Sender: TObject);
    procedure FormShtatBonusExecute(Sender: TObject);
    procedure AcceptHistoryButtonClick(Sender: TObject);
    procedure DateEndChange(Sender: TObject);
    procedure HolidayFioOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure IsHolidayChange(Sender: TObject);
    procedure IsHospitalChange(Sender: TObject);
  private
    { Private declarations }
  public
    Id_Order_Type : Integer;
    Date_Order : TDate;
    Id_Order : Integer;
    Id_Man_Moving : Integer;
    dmShtatUtils : TdmShtatUtils;
    ALLOW_EMPTY_SMETS_IN_ORDERS : Boolean;
    Id_order_group : Integer;
  end;

  type
    TNewAcceptOrderSprav = class(TSprav)
    private
        IsConnected: Boolean;
        Form : TNewAcceptForm;
        procedure PrepareConnect;
    public
        constructor Create;
        destructor  Destroy;override;
        procedure   Show;override;
        procedure   GetInfo;override;
        function    Exists: boolean;override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

var
  NewAcceptForm : TNewAcceptForm;
  

implementation

{$R *.dfm}

procedure TNewAcceptForm.GetMovingByOrder;
begin
    GetIdMovingQuery.Close;
    GetIdMovingQuery.Params.ParamByName('ID_ORDER').AsInteger := Id_Order;
    GetIdMovingQuery.Open;

    if (GetIdMovingQuery.IsEmpty) or (VarIsNull(GetIdMovingQuery['ID_MAN_MOVING'])) then
        Id_Man_Moving := -1
    else
        Id_Man_Moving := GetIdMovingQueryID_MAN_MOVING.Value;

    GetIdMovingQuery.Close;
end;

function CreateSprav: TSprav;
begin
    Result := TNewAcceptOrderSprav.Create;
end;

constructor TNewAcceptOrderSprav.Create;
begin
    inherited Create;

    // создание входных/выходных полей
    Input.FieldDefs.Add('Id_Order_Type', ftInteger);
    Input.FieldDefs.Add('Id_Order', ftInteger);
    Input.FieldDefs.Add('Date_Order', ftDate);
    Input.FieldDefs.Add('SpMode', ftInteger);
    Input.FieldDefs.Add('Num_Item', ftInteger);
    Input.FieldDefs.Add('Sub_Item', ftInteger);
    Input.FieldDefs.Add('Id_Order_Group', ftInteger);
    Input.FieldDefs.Add('Intro', ftString, 4096);

    Output.FieldDefs.Add('New_Id_Order', ftInteger);
end;

destructor TNewAcceptOrderSprav.Destroy;
begin
    inherited Destroy;
end;

        // подготовить соединение с базой
procedure TNewAcceptOrderSprav.PrepareConnect;
begin

end;

procedure TNewAcceptOrderSprav.Show;
var
    hnd : Integer;
    y, m, d : Word;
begin
    Form := TNewAcceptForm.Create(Application.MainForm);

    Form.LocalReadTransaction.Active := False;
    Form.LocalWriteTransaction.Active := False;

    if Form.LocalDatabase.Connected then Form.LocalDatabase.Close;

    hnd := Input['DBHANDLE'];
    Form.LocalDatabase.Handle := TISC_DB_HANDLE(hnd);

    Form.Id_Order := Input['Id_Order'];
    Form.Id_Order_Type := Input['Id_Order_Type'];
    Form.Date_Order := Input['Date_Order'];

    Form.PageControl.ActivePageIndex := 0;
    Form.dmShtatUtils := TdmShtatUtils.Create(Form, Integer(Form.LocalDatabase.Handle), Form.Date_Order);
    NewAcceptForm := Form;

    Form.GetMovingByOrder;

    if not Form.SmetViewQuery.Active then Form.SmetViewQuery.Active := True;

    case Input['SpMode'] of
        1 : Form.FormControl.Mode := fmAdd;
        2 : Form.FormControl.Mode := fmModify;
        3 : Form.FormControl.Mode := fmInfo;
    end;
    Form.Id_order_group:=Input['ID_ORDER_GROUP'];

    Form.FormControl.Prepare(Form.LocalDatabase, Form.FormControl.Mode, IntToStr(Form.Id_Man_Moving), '');

    Form.FormControl.InsertSQL.Text := StringReplace(Form.FormControl.InsertSQL.Text, ':ID_ORDER_TYPE', IntToStr(Form.Id_Order_Type), []);
    Form.FormControl.InsertSQL.Text := StringReplace(Form.FormControl.InsertSQL.Text, ':NUM_ITEM', IntToStr(Input['NUM_ITEM']), []);
    Form.FormControl.InsertSQL.Text := StringReplace(Form.FormControl.InsertSQL.Text, ':SUB_ITEM', IntToStr(Input['SUB_ITEM']), []);
    Form.FormControl.InsertSQL.Text := StringReplace(Form.FormControl.InsertSQL.Text, ':ID_ORDER_GROUP', IntToStr(Input['ID_ORDER_GROUP']), []);

    if not varIsNull(Input['INTRO']) then
        Form.FormControl.InsertSQL.Text := StringReplace(Form.FormControl.InsertSQL.Text, ':INTRO', QuotedStr(Input['INTRO']), []);

    Form.FormControl.UpdateSQL.Text := StringReplace(Form.FormControl.UpdateSQL.Text, ':ID_ORDER', IntToStr(Form.Id_Order), []);    

{    if Form.FormControl.Mode = fmAdd then begin
        DecodeDate(Form.Date_Order, y, m, d);
        Form.DateBeg.Value := EncodeDate(y, 9, 1);
        Form.DateEnd.Value := EncodeDate(y + 1, 8, 31);
    end;}

    Form.ShowModal;

    if Form.Id_Order <> -1 then begin
        Output.Open;
        Output.Append;
        Output['New_Id_Order'] := Form.Id_Order;
        Output.Post;
    end;

    form.Free;
end;

function    TNewAcceptOrderSprav.Exists: boolean;
begin
    if not IsConnected then PrepareConnect;
    Result := True;
end;

procedure   TNewAcceptOrderSprav.GetInfo;
begin
    if not IsConnected then PrepareConnect;
end;

procedure TNewAcceptForm.DepartmentOpenSprav(Sender: TObject;
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
            FieldValues['Actual_Date'] := Date_Order;
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

procedure TNewAcceptForm.OkButtonClick(Sender: TObject);
var
    Mode : TFormMode;
begin
//    ShowMessage(IntToStr(Id_order_group));
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

    if IsForever.Value then
        DateEnd.Value := EncodeDate(2150, 12, 31);

    Mode := FormControl.Mode;

    FormControl.Ok;

    WriteSmetaInfo(Mode);

    if Mode <> FormControl.Mode then begin
        ReformBonusQuery.Close;
        ReformBonusQuery.Transaction.StartTransaction;
        ReformBonusQuery.QInsert.ParamByName('Id_Man_Moving').AsInteger := Id_Man_Moving;
        ReformBonusQuery.QInsert.ExecQuery;
        ReformBonusQuery.Transaction.Commit;

        BonusQuery.Close;
        BonusQuery.ParamByName('ID_ORDER').AsInteger := Id_Order;
        BonusQuery.Open;

        PageControl.ActivePageIndex := 3;

        qFInformDialog('Наказ занесено до бази, перевірте автоматично створені "Доплати та надбавки"!');
    end;
end;

procedure TNewAcceptForm.FioOpenSprav(Sender: TObject; var Value: Variant;
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
            FieldValues['ActualDate'] := Date_Order;
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
            DisplayText := sp.Output['FIO'];

            Reason.Value := 'Заява ' + sp.Output['FIO_SMALL'];
        end;
        sp.Free;
    end;
end;

procedure TNewAcceptForm.SpzOpenSprav(Sender: TObject; var Value: Variant;
  var DisplayText: String);
begin
    dmShtatUtils.GetSPZ(Value, DisplayText);
end;

procedure TNewAcceptForm.WorkCondOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
begin
    dmShtatUtils.GetWorkCond(Value, DisplayText);
end;

procedure TNewAcceptForm.WorkModeOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
begin
    dmShtatUtils.GetWorkMode(Value, DisplayText);
end;

procedure TNewAcceptForm.PayFormOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
begin
    dmShtatUtils.GetPayForm(Value, DisplayText);
end;

procedure TNewAcceptForm.PostSalaryOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    NewValue, OldValue : Variant;
    NewDisplayText, OldDisplayText : String;
begin
    if VarIsNull(Department.Value) then begin
        qFErrorDialog('Спочатку треба вибрати підрозділ!');
        exit;
    end;

    OldValue := PostSalary.Value;
    OldDisplayText := PostSalary.DisplayText;

    dmShtatUtils.Actual_Date := DateBeg.Value;
    dmShtatUtils.GetSalaryFilter(NewValue, NewDisplayText, Department.Value);

    if (not (VarType(NewValue) = Unassigned)) and
       (not VarIsNull(PostSalary.Value)) and
       (qFConfirm('Зміна посадового окладу призведе до вилучення усіх заведених джерел фінансування, ви справді бажаєте змінити посадовий оклад?'))
    then begin
        SmetViewQuery.Close;
        SmetViewQuery.Open;
    end;

    Value := NewValue;
    DisplayText := NewDisplayText;
    Type_Post.Value := dmShtatUtils.SalarySelectFilterID_TYPE_POST.Value;
    Type_Post.DisplayText := dmShtatUtils.SalarySelectFilterNAME_TYPE_POST.Value;    

    ShtatrasQuery.CloseOpen(False);
end;

procedure TNewAcceptForm.MovingTypeOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    sp: TSprav;
begin
        // создать справочник
    sp :=  GetSprav('Asup\SpMovingType');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(LocalDatabase.Handle);
            FieldValues['IdType'] := 1;
            Post;
        end;

                // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        if ( sp.Output <> nil ) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['Id_Moving_Type'];
            DisplayText := sp.Output['Name_Moving_Type'];
        end;
        sp.Free;
    end;
end;

procedure TNewAcceptForm.OkActionExecute(Sender: TObject);
begin
    OkButton.Click;
end;

procedure TNewAcceptForm.CancelActionExecute(Sender: TObject);
begin
    CancelButton.Click;
end;

procedure TNewAcceptForm.IsForeverChange(Sender: TObject);
var
    Year, Day, Month : Word;
begin
    DecodeDate(Date, Year, Month, Day);

    if IsForever.Value then begin
        IsHoliday.Value := False;
        IsHospital.Value := False;
        IsHolidayChange(Sender);
        IsHospitalChange(Sender);

        DateEnd.Value := EncodeDate(2150, 12, 31);
        DateEnd.Visible := False;
    end
    else begin
        DateEnd.Value := EncodeDate(Year , 12, 31);
        DateEnd.Visible := True;
    end;

end;

procedure TNewAcceptForm.FormControlNewRecordAfterPrepare(Sender: TObject);
begin
    //IsForever.Value := True;
    //IsForeverChange(DateEnd);

    GetDefaultsQuery.Close;
    GetDefaultsQuery.Open;

    WorkMode.Value := GetDefaultsQueryDEFAULT_WORK_MODE.Value;
    WorkMode.DisplayText := GetDefaultsQueryNAME.Value;

    WorkCond.Value := GetDefaultsQueryDEFAULT_WORK_COND.Value;
    WorkCond.DisplayText := GetDefaultsQueryNAME_WORK_COND.Value;

    PayForm.Value := GetDefaultsQueryDEFAULT_PAY_FORM.Value;
    PayForm.DisplayText := GetDefaultsQueryNAME_PAY_FORM.Value;

    MovingType.Value := GetDefaultsQueryDEFAULT_ID_MOVING_TYPE_ACCEPT.Value;
    MovingType.DisplayText := GetDefaultsQueryNAME_MOVING_TYPE.Value;

    WorkType.Value := GetDefaultsQueryDEFAULT_ID_SOVMEST_ACCEPT.Value;
    WorkType.DisplayText := GetDefaultsQueryNAME_SOVMEST.Value;

    WorkReason.Value := GetDefaultsQueryDEFAULT_ID_WORK_REASON.Value;
    WorkReason.DisplayText := GetDefaultsQueryNAME_FULL.Value;

    dmShtatUtils.SpzSelect.Close;
    dmShtatUtils.SpzSelect.Open;
    dmShtatUtils.SpzSelect.FetchAll;

    if (not dmShtatUtils.SpzSelect.IsEmpty) and
       (dmShtatUtils.SpzSelect.RecordCount = 1)
    then begin
        Spz.Value := dmShtatUtils.SpzSelectID_SPZ.Value;
        Spz.DisplayText := dmShtatUtils.SpzSelectNAME_SPZ.Value;
    end;

    GetDefaultsQuery.Close;

    ShtatrasQuery.Close;
    ShtatrasQuery.ParamByName('CUR_DATE').AsDate := DateBeg.Value;     
end;

procedure TNewAcceptForm.FormControlModifyRecordAfterPrepare(
  Sender: TObject);
begin

    if not VarIsNull(HospitalFio.Value) then begin
        IsHospital.Value := True;
        IsHospitalChange(IsHospital);
    end
    else
    if not VarIsNull(HolidayFio.Value) then begin
        IsHoliday.Value := True;
        IsHolidayChange(IsHoliday);
    end
    else
    if DateEnd.Value = EncodeDate(2150, 12, 31) then begin
        IsForever.Value := True;
        IsForeverChange(DateEnd);
    end;

    ReadSmet;

    GetDefaultsQuery.Open;
    GetDefaultsQuery.Close;

    ShtatrasQuery.Close;
    ShtatrasQuery.ParamByName('ID_POST_SALARY').AsInteger := PostSalary.Value;
    ShtatrasQuery.ParamByName('ID_DEPARTMENT').AsInteger := Department.Value;
    ShtatrasQuery.ParamByName('CUR_DATE').AsDate := DateBeg.Value;

    BonusQuery.Close;
    BonusQuery.Params.ParamByName('ID_ORDER').AsInteger := Id_Order;
    BonusQuery.Open;
end;

procedure TNewAcceptForm.FormControlInfoRecordAfterPrepare(
  Sender: TObject);
begin
    if not VarIsNull(HospitalFio.Value) then begin
        IsHospital.Value := True;
        IsHospitalChange(IsHospital);
    end
    else
    if not VarIsNull(HolidayFio.Value) then begin
        IsHoliday.Value := True;
        IsHolidayChange(IsHoliday);
    end
    else
    if DateEnd.Value = EncodeDate(2150, 12, 31) then begin
        IsForever.Value := True;
        IsForeverChange(DateEnd);
    end;

    ReadSmet;

    AddItemButton.Enabled := False;
    ModifyItemButton.Enabled := False;
    DeleteItemButton.Enabled := False;

    AddBonusButton.Enabled := False;
    ModifyBonusButton.Enabled := False;
    DeleteBonusButton.Enabled := False;
    ReformBonusButton.Enabled := False;

    BonusQuery.Close;
    BonusQuery.Params.ParamByName('ID_ORDER').AsInteger := Id_Order;
    BonusQuery.Open;
end;

procedure TNewAcceptForm.ShowChangeSmetaForm(FMode : TFormMode);
var
    Form : TfmAddSmeta;
begin
    if VarIsNull(PostSalary.Value) then begin
        qFErrorDialog('Треба спочатку вибрати посадовий оклад!');
        exit;
    end;

    if (FMode <> fmAdd) and (SmetViewQuery.IsEmpty) then begin
        qFErrorDialog('Немає записів!');
        exit;
    end;

    Form := TfmAddSmeta.Create(Self);
    Form.FMode := FMode;
    Form.IdPostSalary := PostSalary.Value;
    Form.DateBeg.Value := DateBeg.Value;
    Form.DateEnd.Value := DateEnd.Value;

    Form.DateEnd.Visible := not (Form.DateEnd.Value = EncodeDate(2150, 12, 31));
    Form.ForeverLabel.Visible := (Form.DateEnd.Value = EncodeDate(2150, 12, 31));

    if (FMode = fmModify) or (FMode = fmInfo) then with Form do begin
        Smeta.Value := SmetViewQueryKOD_SM.Value;
        Smeta.DisplayText := SmetViewQuerySM_TITLE.Value;
        Kol_Stavok.value := SmetViewQueryKOL_STAVOK.Value;
        Koeff_Pps.Value := SmetViewQueryKOEFF_PPS.Value;
        Kod_Sm_Pps.DisplayText := SmetViewQuerySM_PPS_TITLE.Value;
        Kod_Sm_Pps.Value := SmetViewQueryKOD_SM_PPS.Value;

        if not VarIsNull(Form.Kod_Sm_Pps.Value) then
            GetSmTitle.ParamByName('KOD_SM_PPS').AsInteger := Form.Kod_Sm_Pps.Value
        else
            GetSmTitle.ParamByName('KOD_SM_PPS').AsVariant := null;

        // Пытаемся получить количество вакантных ставок
        ShtatrasQuery.open;
        
        if ShtatrasQuery.Locate('Kod_Sm;Kod_Sm_Pps', VarArrayOf([SmetViewQueryKOD_SM.Value, SmetViewQueryKOD_SM_PPS.Value]), [])
        then
            KolVacantStavok.Value := ShtatrasQueryKOL_VACANT_STAVOK.Value;

        ShtatrasQuery.Close;

        Base_Oklad.Value := SmetViewQueryOKLAD_BASE.Value;
        Oklad_Pps.Value := SmetViewQueryOKLAD_PPS.Value;
        Oklad.Value := SmetViewQueryOKLAD.Value;
    end;

    Form.Prepare;

    if (Form.ShowModal = mrOk) and (FMode <> fmInfo) then begin

        if FMode = fmAdd then
            SmetViewQuery.Append;

        if FMode = fmModify then
            SmetViewQuery.Edit;

        SmetViewQuery['ID_MAN_MOV_SMET'] := -1;
        SmetViewQuery['ID_MAN_MOVING'] := Id_Man_Moving;
        SmetViewQuery['KOD_SM'] := Form.Smeta.Value;
        SmetViewQuery['KOD_SM_PPS'] := Form.Kod_Sm_Pps.Value;
        SmetViewQuery['DATE_BEG'] := Form.DateBeg.Value;
        SmetViewQuery['DATE_END'] := Form.DateEnd.Value;
        SmetViewQuery['KOEFF_PPS'] := Form.Koeff_Pps.Value;
        SmetViewQuery['KOL_STAVOK'] := Form.Kol_Stavok.Value;
        SmetViewQuery['OKLAD'] := Form.Oklad.Value;
        SmetViewQuery['OKLAD_PPS'] := Form.Oklad_Pps.Value;
        SmetViewQuery['OKLAD_BASE'] := Form.Base_Oklad.Value;

        GetSmTitle.Close;
        GetSmTitle.ParamByName('KOD_SM').AsInteger := Form.Smeta.Value;

        if not VarIsNull(Form.Kod_Sm_Pps.Value) then
            GetSmTitle.ParamByName('KOD_SM_PPS').AsInteger := Form.Kod_Sm_Pps.Value
        else
            GetSmTitle.ParamByName('KOD_SM_PPS').AsVariant := null;

        GetSmTitle.Open;

        SmetViewQuery['SM_TITLE'] := GetSmTitleSM_TITLE.Value;
        SmetViewQuery['SM_PPS_TITLE'] := GetSmTitleSM_PPS_TITLE.Value;

        GetSmTitle.Close;

        SmetViewQuery.Post;
    end;

    Form.Free;
end;

procedure TNewAcceptForm.DeleteSmetaExecute(Sender: TObject);
begin
    if SmetViewQuery.IsEmpty then begin
        qFErrorDialog('Немає записів!');
        exit;
    end;

    if not qFConfirm('Ви справді бажаєте вилучити цей запис?') then
        exit;

    SmetViewQuery.Delete;
end;

procedure TNewAcceptForm.AddSmetaExecute(Sender: TObject);
begin
    ShowChangeSmetaForm(fmAdd);
end;

procedure TNewAcceptForm.ModifySmetaExecute(Sender: TObject);
begin
    ShowChangeSmetaForm(fmModify);
end;

procedure TNewAcceptForm.ViewSmetaExecute(Sender: TObject);
begin
    ShowChangeSmetaForm(fmInfo);
end;

procedure TNewAcceptForm.WriteSmetaInfo(FMode : TFormMode);
begin
    if (FMode = fmInfo) then exit;

    WorkQuery.Transaction.StartTransaction;

    try
        WorkQuery.Close;

        // Удаляем старые записи из БД
        if FMode <> fmAdd then begin
            WorkQuery.QDelete.Close;
            WorkQuery.QDelete.ParamByName('ID_ORDER').AsInteger := Id_Order;
            WorkQuery.QDelete.ExecQuery;
        end;

        // Пишем новые записи
        SmetViewQuery.First;

        while not SmetViewQuery.Eof do begin
            WorkQuery.QInsert.Close;
            WorkQuery.QInsert.ParamByName('ID_MAN_MOVING').AsInteger := Id_Man_Moving;
            WorkQuery.QInsert.ParamByName('KOD_SM').AsInteger := SmetViewQuery['KOD_SM'];

            if (VarType(SmetViewQuery['KOD_SM_PPS']) = Unassigned) or (not VarIsNull(SmetViewQuery['KOD_SM_PPS'])) then
                WorkQuery.QInsert.ParamByName('KOD_SM_PPS').AsInteger := SmetViewQuery['KOD_SM_PPS']
            else
                WorkQuery.QInsert.ParamByName('KOD_SM_PPS').Value := null;

            if (VarType(SmetViewQuery['KOEFF_PPS']) = Unassigned) or (not VarIsNull(SmetViewQuery['KOEFF_PPS'])) then
                WorkQuery.QInsert.ParamByName('KOEFF_PPS').AsFloat := SmetViewQuery['KOEFF_PPS']
            else
                WorkQuery.QInsert.ParamByName('KOEFF_PPS').Value := null;

            WorkQuery.QInsert.ParamByName('OKLAD').AsFloat := SmetViewQuery['OKLAD'];
            WorkQuery.QInsert.ParamByName('OKLAD_PPS').AsFloat := SmetViewQuery['OKLAD_PPS'];
            WorkQuery.QInsert.ParamByName('KOL_STAVOK').AsFloat := SmetViewQuery['KOL_STAVOK'];
            WorkQuery.QInsert.ParamByName('ID_ORDER').AsInteger := Id_Order;
            WorkQuery.QInsert.ParamByName('DATE_BEG').AsDate := SmetViewQuery['DATE_BEG'];
            WorkQuery.QInsert.ParamByName('DATE_END').AsDate := SmetViewQuery['DATE_END'];
            WorkQuery.QInsert.ParamByName('OKLAD_BASE').AsFloat := SmetViewQuery['OKLAD_BASE'];
            WorkQuery.QInsert.ExecQuery;

            SmetViewQuery.Next;
        end;
        
    except on E:Exception do begin
            qFErrorDialog('При занесенні даних про джерела фінансування виникла помилка: "' + E.Message + '"');
            WorkQuery.Transaction.Rollback;
            exit;
        end;
    end;

    WorkQuery.Transaction.Commit;
end;

procedure TNewAcceptForm.FormControlAfterRecordAdded(Sender: TObject);
begin
    Id_Order := FormControl.LastId;
    GetMovingByOrder;

    FormControl.Mode := fmModify;
    ModalResult := 0;
end;

procedure TNewAcceptForm.ReadSmet;
begin
    WorkQuery.Close;
    WorkQuery.ParamByName('ID_ORDER').AsInteger := Id_Order;
    WorkQuery.Open;

    While not WorkQuery.Eof do begin
        SmetViewQuery.Append;

        WorkQuery.QInsert.ParamByName('ID_MAN_MOVING').AsInteger := Id_Man_Moving;

        SmetViewQuery['KOD_SM'] := WorkQueryKOD_SM.Value;
        SmetViewQuery['KOD_SM_PPS'] := WorkQueryKOD_SM_PPS.Value;
        SmetViewQuery['KOEFF_PPS'] := WorkQueryKOEFF_PPS.Value;
        SmetViewQuery['OKLAD'] := WorkQueryOKLAD.Value;
        SmetViewQuery['OKLAD_PPS'] := WorkQueryOKLAD_PPS.Value;
        SmetViewQuery['KOL_STAVOK'] := WorkQueryKOL_STAVOK.Value;
        SmetViewQuery['DATE_BEG'] := WorkQueryDATE_BEG.Value;
        SmetViewQuery['DATE_END'] := WorkQueryDATE_END.Value;
        SmetViewQuery['OKLAD_BASE'] := WorkQueryOKLAD_BASE.Value;
        SmetViewQuery['SM_TITLE'] := WorkQuerySM_TITLE.Value;
        SmetViewQuery['SM_PPS_TITLE'] := WorkQuerySM_PPS_TITLE.Value;
        SmetViewQuery['ID_MAN_MOV_SMET'] := WorkQueryID_MAN_MOV_SMET.Value;
        SmetViewQuery['ID_MAN_MOVING'] := WorkQueryID_MAN_MOVING.Value;

        SmetViewQuery.Post;
        WorkQuery.Next;
    end;

    WorkQuery.Close;
end;

procedure TNewAcceptForm.Type_PostOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
begin
    if VarIsNull(PostSalary.Value) then begin
        qFErrorDialog('Спочатку треба вибрати посадовий оклад!');
        exit;
    end;

    if qSelect(SelectTypePost) then
    begin
        Value := SelectTypePost['Id_Type_Post'];
        DisplayText := SelectTypePost['Name_Type_Post'];
    end;
end;

procedure TNewAcceptForm.PostSalaryChange(Sender: TObject);
begin
    if not VarIsNull(PostSalary.Value) then begin
        SelectTypePost.Close;
        SelectTypePost.ParamByName('Id_Post').Value :=
            dmShtatUtils.GetSalaryIdPost(PostSalary.Value);
        SelectTypePost.Open;
        SelectTypePost.FetchAll;
    end;

    if not VarIsNull(PostSalary.Value) then begin
        ShtatrasQuery.Close;
        ShtatrasQuery.ParamByName('ID_POST_SALARY').AsInteger := PostSalary.Value;
    end;
end;

procedure TNewAcceptForm.qFLogicCheck1Check(Sender: TObject;
  var Error: String);
begin
    if ALLOW_EMPTY_SMETS_IN_ORDERS then
        exit;

    if SmetViewQuery.IsEmpty then begin
        Error := 'Треба вказати хоча б одне джерело фінансування!';
        OkladSheet.Show;
    end;
end;

procedure TNewAcceptForm.WorkTypeOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
begin
    if qSelect(SelectWorkType, 'Виберіть тип роботи') then begin
        Value := SelectWorkTypeID_SOVMEST.Value;
        DisplayText := SelectWorkTypeNAME_SOVMEST.Value;
    end;
end;

procedure TNewAcceptForm.GetDefaultsQueryAfterOpen(DataSet: TDataSet);
begin
    if (not GetDefaultsQuery.Active) or (GetDefaultsQuery.IsEmpty) then
        exit;
         
    ALLOW_EMPTY_SMETS_IN_ORDERS := (GetDefaultsQueryALLOW_EMPTY_SMETS_IN_ORDERS.Value = 'T');
end;

procedure TNewAcceptForm.DateBegChange(Sender: TObject);
begin
    ShtatrasQuery.Close;
    ShtatrasQuery.ParamByName('CUR_DATE').AsDate := DateBeg.Value;

    if FormControl.Mode = fmAdd then
        CondDateBeg.Value := DateBeg.Value;
end;

procedure TNewAcceptForm.DepartmentChange(Sender: TObject);
begin
  if not VarIsNull(Department.Value) then begin
      ShtatrasQuery.Close;
      ShtatrasQuery.ParamByName('ID_DEPARTMENT').AsInteger := Department.Value;
  end;

  PostSalary.Clear;
end;

procedure TNewAcceptForm.IdAcceptCondOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
begin
    if qSelect(AcceptCondQuery, 'Виберіть умови вступу до посади...') then begin
        Value := AcceptCondQueryID_ACCEPT_COND.Value;
        DisplayText := AcceptCondQueryNAME_ACCEPT_COND.Value;
    end;
end;

procedure TNewAcceptForm.ShtatrasQueryAfterOpen(DataSet: TDataSet);
begin
    if (Dataset.IsEmpty) or (varIsNull(ShtatrasQueryID_WORK_COND.Value)) then
        exit;

    WorkCond.Value := ShtatrasQueryID_WORK_COND.Value;
    WorkCond.DisplayText := ShtatrasQueryNAME_WORK_COND.Value;
    WorkMode.Value := ShtatrasQueryID_WORK_MODE.Value;
    WorkMode.DisplayText := ShtatrasQueryNAME_WORK_MODE.Value;
end;

procedure TNewAcceptForm.WorkReasonOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
begin
    if qSelect(WorkReasonQuery, 'Виберіть підставу роботи...') then begin
        Value := WorkReasonQueryID_WORK_REASON.Value;
        DisplayText := WorkReasonQueryNAME_FULL.Value;
    end;
end;

procedure TNewAcceptForm.ShowChangeBonusForm(FMode : TFormMode);
var
    Sp : TSprav;
    Mode : Integer;
begin
    if FormControl.Mode = fmAdd then begin
        qFErrorDialog('Змінення надбавок можливо тільки після створення наказу!');
        exit;
    end;

    Sp := GetSprav('Asup\BonusOrder');
    Sp.Input.Open;
    Sp.Input.Append;
    Sp.Input['DBHANDLE'] := Integer(LocalDatabase.Handle);

    Mode := 1;

    case FMode of
        fmAdd    : Mode := 1;
        fmModify : Mode := 2;
        fmInfo   : Mode := 3;
    end;

    Sp.Input['SpMode'] := Mode;
    Sp.Input['Id_Order'] := Id_Order;
    Sp.Input['Id_Order_group'] := Id_Order_group;
    Sp.Input['Date_Order'] := Date_Order;
    Sp.Input['Date_Beg'] := DateBeg.Value;
    Sp.Input['Date_End'] := DateEnd.Value;
    Sp.Input['Id_Man_Moving'] := Id_Man_Moving;
    Sp.Input['SpType'] := 1;

    if FMode = fmAdd then
        Sp.Input['Id_Man_Bonus'] := -1
    else
        Sp.Input['Id_Man_Bonus'] := BonusQueryID_MAN_BONUS.Value;

    Sp.Show;

    BonusQuery.Close;
    BonusQuery.Open;

    if Sp.Output.Active then
        BonusQuery.Locate('Id_Man_Bonus', Sp.Output['New_Id_Man_Bonus'], []);

    Sp.Free;
end;

procedure TNewAcceptForm.AddBonusExecute(Sender: TObject);
begin
    ShowChangeBonusForm(fmAdd);
end;

procedure TNewAcceptForm.ModifyBonusExecute(Sender: TObject);
begin
    ShowChangeBonusForm(fmModify);
end;

procedure TNewAcceptForm.DeleteBonusExecute(Sender: TObject);
begin
    if BonusQuery.IsEmpty then begin
        qFErrorDialog('Немає записів!');
        exit;
    end;

    if not qFConfirm('Ви справді бажаєте вилучити цей запис?') then
        exit;

    LocalWriteTransaction.StartTransaction;

    try
        BonusQuery.QDelete.Close;
        BonusQuery.QDelete.ParamByName('Id_Man_Bonus').AsInteger := BonusQueryID_MAN_BONUS.Value;
        BonusQuery.QDelete.ExecQuery;
    except on E:Exception
        do begin
            qFErrorDialog(E.Message);
            LocalWriteTransaction.Rollback;
            exit;
        end;
    end;

    LocalWriteTransaction.Commit;

    BonusQuery.CloseOpen(True);
end;

procedure TNewAcceptForm.BonusQueryCalcFields(DataSet: TDataSet);
begin
    if BonusQueryIS_PERCENT.Value = 'T' then
        BonusQueryThe_Bonus.Value := BonusQueryPERCENT.AsString + ' %'
    else
        BonusQueryThe_Bonus.Value := BonusQuerySUMMA.AsString + ' грн.';
end;

procedure TNewAcceptForm.ViewBonusExecute(Sender: TObject);
begin
    ShowChangeBonusForm(fmInfo);
end;

procedure TNewAcceptForm.FormShtatBonusExecute(Sender: TObject);
begin
    if FormControl.Mode = fmAdd then begin
        qFErrorDialog('Змінення надбавок можливо тільки після створення наказу!');
        exit;
    end;

    if not qFConfirm('Ви справді бажаєте переформувати список надбавок? При цьому буде вилучено усі надбавки і буде знову забрано зі штатного розкладу.') then
        exit;

    ReformBonusQuery.Close;
    ReformBonusQuery.Transaction.StartTransaction;
    ReformBonusQuery.QInsert.ParamByName('Id_Man_Moving').AsInteger := Id_Man_Moving;
    ReformBonusQuery.QInsert.ExecQuery;
    ReformBonusQuery.Transaction.Commit;

    BonusQuery.CloseOpen(True);
end;

procedure TNewAcceptForm.AcceptHistoryButtonClick(Sender: TObject);
var
    Value : Variant;
    DisplayText : String;
begin
    dmShtatUtils.GetAcceptCondHistory(FIO.Value, Value, DisplayText);
end;

procedure TNewAcceptForm.DateEndChange(Sender: TObject);
begin
    if FormControl.Mode = fmAdd then
        CondDateEnd.Value := DateEnd.Value;
    if (not SmetViewQuery.IsEmpty)
     then begin
       SmetViewQuery.First;
       SmetViewQuery.Edit;
       while (not SmetViewQuery.Eof) do
       begin
         SmetViewQuery['date_end']:=DateEnd.Value;
         SmetViewQuery.Next;
       end
     end;
end;

procedure TNewAcceptForm.HolidayFioOpenSprav(Sender: TObject;
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
            FieldValues['ActualDate'] := Date_Order;
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
            DisplayText := sp.Output['FIO'];
        end;
        sp.Free;
    end;
end;

procedure TNewAcceptForm.IsHolidayChange(Sender: TObject);
begin
    if IsHoliday.Value then begin
        HolidayFio.Blocked := False;
        HolidayFio.Required := True;

        IsForever.Value := False;
        IsHospital.Value := False;
    end
    else begin
        HolidayFio.Blocked := True;
        HolidayFio.Required := False;
        HolidayFio.Value := null;
        HolidayFio.DisplayText := '';
    end;
end;

procedure TNewAcceptForm.IsHospitalChange(Sender: TObject);
var
    Year, Day, Month : Word;
begin
    if IsHospital.Value then begin
        HospitalFio.Blocked := False;
        HospitalFio.Required := True;

        IsForever.Value := False;
        IsHoliday.Value := False;

        DateEnd.Value := EncodeDate(2150, 12, 31);
        DateEnd.Visible := False;
    end
    else begin
        HospitalFio.Blocked := True;
        HospitalFio.Required := False;
        HospitalFio.Value := null;
        HospitalFio.DisplayText := '';

        DecodeDate(Date, Year, Month, Day);
        DateEnd.Value := EncodeDate(Year , 12, 31);
        DateEnd.Visible := True;        
    end;
end;

end.
