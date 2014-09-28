unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, cxLookAndFeelPainters, StdCtrls, cxButtons,
  Ibase, cxTextEdit, cxMaskEdit, cxButtonEdit, cxControls, cxContainer,
  cxEdit, cxCheckBox, UCommonSp, FIBDatabase, pFIBDatabase, uFControl,
  uLabeledFControl, uSpravControl, uShtatUtils, uDateControl, DB, RxMemDS,
  uCharControl, uFloatControl, cxRadioGroup, pFibStoredProc, pFibDataSet,
  FIBDataSet, uSelectForm, AllPeopleUnit, cxPC, ImgList, uIntControl,
  ActnList, cxLabel, cxDropDownEdit, cxCalendar;

type
  TFilterMainForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    cxButton4: TcxButton;
    SelectCurWorkPlace: TpFIBDataSet;
    SelectCurWorkPlaceID_DEPARTMENT: TFIBIntegerField;
    SelectCurWorkPlaceNAME_POST_SALARY: TFIBStringField;
    SelectCurWorkPlaceID_POST_SALARY: TFIBIntegerField;
    SelectCurWorkPlaceNAME_DEPARTMENT: TFIBStringField;
    SelectCurWorkPlaceID_MAN_MOVING: TFIBIntegerField;
    SelectCurWorkPlaceDATE_BEG: TFIBDateField;
    SelectCurWorkPlaceDATE_END: TFIBDateField;
    SelectCurWorkPlaceKOL_STAVOK: TFIBFloatField;
    SelectCurWorkPlaceWORK_REASON: TFIBStringField;
    SelectCurWorkPlaceID_POST_SALARY2: TIntegerField;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    cxTabSheet4: TcxTabSheet;
    cxTabSheet5: TcxTabSheet;
    cxTabSheet6: TcxTabSheet;
    cxTabSheet7: TcxTabSheet;
    Panel3: TPanel;
    CheckWorkCond: TcxCheckBox;
    WorkCondValue: TqFSpravControl;
    CheckWorkMode: TcxCheckBox;
    WorkModeValue: TqFSpravControl;
    CheckIsMain: TcxCheckBox;
    IsMainValue: TcxRadioGroup;
    CheckCategory: TcxCheckBox;
    CategoryValue: TqFSpravControl;
    CheckPrivateCard: TcxCheckBox;
    PCardValue: TqFSpravControl;
    CheckPostSalary: TcxCheckBox;
    PostSalaryValue: TqFSpravControl;
    CheckFormPayValue: TcxCheckBox;
    FormPayValue: TqFSpravControl;
    CheckBudgetValue: TcxCheckBox;
    BudgetValue: TqFSpravControl;
    CheckDepartmentValue: TcxCheckBox;
    DepartmentValue: TqFSpravControl;
    ExistRateDateValue: TqFDateControl;
    CheckExistRate: TcxCheckBox;
    ExistRateValue: TqFSpravControl;
    ExistTypeRateValue: TcxRadioGroup;
    CheckNotExistsRate: TcxCheckBox;
    NotExistRateValue: TqFSpravControl;
    NotExistTypeRateValue: TcxRadioGroup;
    CheckIdMen: TcxCheckBox;
    NotExistRateDateValue: TqFDateControl;
    IL_Orders: TImageList;
    ManValue: TqFSpravControl;
    CHECK_CHILD_DEPARTMENT: TcxCheckBox;
    TypeStajValue: TqFSpravControl;
    CheckStaj: TcxCheckBox;
    StajDate: TqFDateControl;
    Label2: TLabel;
    Label3: TLabel;
    StajValueMIn: TqFIntControl;
    Label4: TLabel;
    StajValueMax: TqFIntControl;
    Label5: TLabel;
    Label6: TLabel;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    cxCheck4: TcxCheckBox;
    qFIntControl1: TqFIntControl;
    CheckProcBox: TcxCheckBox;
    CheckSumBox: TcxCheckBox;
    cxCheckBox3: TcxCheckBox;
    qFIntControl4: TqFIntControl;
    cxTabSheet8: TcxTabSheet;
    Label1: TLabel;
    CheckMMDateBeg: TcxCheckBox;
    MMDateBeg: TqFDateControl;
    CheckMMDateEnd: TcxCheckBox;
    MMDateEnd: TqFDateControl;
    CheckMMDate: TcxCheckBox;
    MMDate: TqFDateControl;
    CheckSex: TcxCheckBox;
    SexValue: TqFSpravControl;
    CheckRates: TcxCheckBox;
    CheckWorkReason: TcxCheckBox;
    WorkReasonValue: TqFSpravControl;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    RateMinValue: TqFFloatControl;
    RateMaxValue: TqFFloatControl;
    CheckDateEndAfter: TcxCheckBox;
    DateEndAfter: TqFDateControl;
    CheckBudgetRate: TcxCheckBox;
    BudgetRate: TqFSpravControl;
    cxTabSheet9: TcxTabSheet;
    Label10: TLabel;
    WillDateValue: TqFDateControl;
    Label11: TLabel;
    WillStajYearValue: TqFIntControl;
    Label12: TLabel;
    WillTypeStajValue: TqFSpravControl;
    cxIsInSovm: TcxCheckBox;
    cxIsExtSovm: TcxCheckBox;
    CheckPostRazr: TcxCheckBox;
    PostRazr: TqFFloatControl;
    CheckPostSum: TcxCheckBox;
    Label13: TLabel;
    Label14: TLabel;
    MinPostSumValue: TqFFloatControl;
    Label15: TLabel;
    MaxPostSumValue: TqFFloatControl;
    WithoutDekret: TcxCheckBox;
    DekretDateBeg: TcxDateEdit;
    DekretDateEnd: TcxDateEdit;
    lblDekretBeg: TcxLabel;
    lblDekretEnd: TcxLabel;
    DSetConsts: TpFIBDataSet;
    DSetGetMoveType: TpFIBDataSet;
    ProcRateValue: TqFFloatControl;
    SumRateValue: TqFFloatControl;
    procedure PCardValueOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure CheckPrivateCardPropertiesChange(Sender: TObject);
    procedure CheckPostPropertiesChange(Sender: TObject);
    procedure PostSalaryValueOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure WorkCondValueOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure CheckWorkCondPropertiesChange(Sender: TObject);
    procedure WorkModeValueOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure CheckWorkModePropertiesChange(Sender: TObject);
    procedure FormPayValueOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure CheckFormPayValuePropertiesChange(Sender: TObject);
    procedure DepartmentValueOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure CheckDepartmentValuePropertiesChange(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure BudgetValueOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure CheckBudgetValuePropertiesChange(Sender: TObject);
    procedure CheckMMDateBegPropertiesChange(Sender: TObject);
    procedure CheckMMDateEndPropertiesChange(Sender: TObject);
    procedure CheckMMDatePropertiesChange(Sender: TObject);
    procedure CheckExistRatePropertiesChange(Sender: TObject);
    procedure CheckNotExistsRatePropertiesChange(Sender: TObject);
    procedure ExistRateValueOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure NotExistRateValueOpenSprav(Sender: TObject;
      var Value: Variant; var DisplayText: String);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure SexValueOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure CheckSexPropertiesChange(Sender: TObject);
    procedure CategoryValueOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure CheckCategoryPropertiesChange(Sender: TObject);
    procedure CheckIsMainPropertiesChange(Sender: TObject);
    procedure CheckIdMenPropertiesChange(Sender: TObject);
    procedure ManValueOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure CheckStajPropertiesChange(Sender: TObject);
    procedure TypeStajValueOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure WorkReasonValueOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure CheckWorkReasonPropertiesChange(Sender: TObject);
    procedure CheckDateEndAfterPropertiesChange(Sender: TObject);
    procedure cxCheckBox4PropertiesChange(Sender: TObject);
    procedure CheckBudgetRatePropertiesChange(Sender: TObject);
    procedure BudgetRateOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure CheckPostRazrPropertiesChange(Sender: TObject);
    procedure CheckPostSumPropertiesChange(Sender: TObject);
    procedure WithoutDekretPropertiesChange(Sender: TObject);
    procedure ExistTypeRateValuePropertiesChange(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
    procedure cxCheckBox2PropertiesChange(Sender: TObject);
  private
    { Private declarations }
    id_order_type:integer;
    key_session :int64;
    isOrderTypeNewOklad:Boolean;
    procedure LoadPredefinedInfo(id_predefined:Integer);
    procedure GetFilteringData;
    function CheckData:Boolean;
  public
    { Public declarations }
    Count:Integer;
    constructor Create(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_user,KEY_SESSION:Int64;Id_order_type,Id_predefined:Integer); reintroduce;
  end;

implementation

uses uUnivSprav, GlobalSpr, BaseTypes, FIBQuery;

{$R *.dfm}

constructor TFilterMainForm.Create(AOwner: TComponent; DBHandle: TISC_DB_HANDLE; Id_user,KEY_SESSION: Int64;Id_order_type,Id_predefined:Integer);
begin
     inherited Create(AOwner);
     Count:=-1;
     isOrderTypeNewOklad:=False;
     WorkDatabase.Handle:=DBHandle;
     ReadTransaction.StartTransaction;
     cxPageControl1.ActivePageIndex:=0;

     ExistRateDateValue.Value:=Date;
     NotExistRateDateValue.Value:=Date;
     MMDateBeg.Value:=Date;
     MMDateEnd.Value:=Date;
     MMDate.Value:=Date;
     DateEndAfter.Value:=Date;
     StajDate.Value:=Date;
     DekretDateBeg.Date:=Date;
     DekretDateEnd.Date:=Date;
     self.id_order_type:=id_order_type;
     try
       DSetConsts.Close;
       DSetConsts.SQLs.SelectSQL.Text:='select * from up_sys_ini_consts';
       DSetConsts.Open;

       DSetGetMoveType.Close;
       DSetGetMoveType.SQLs.SelectSQL.Text:='select first(1) moving_type '+
                                            'from up_dt_order_type '+
                                            'where id_type=:id_type';
       DSetGetMoveType.ParamByName('id_type').AsInteger:=self.id_order_type;
       DSetGetMoveType.Open;

       if (Id_predefined<>-1) then LoadPredefinedInfo(Id_predefined);

       if DSetGetMoveType['moving_type']=DSetConsts['new_oklad_mov_type'] then
       begin
           isOrderTypeNewOklad:=True;
           CheckMMDate.Checked:=False;
       end;
       self.key_session:=KEY_SESSION;
     except on E:Exception
            do agShowMessage(e.Message);
     end;
end;

procedure TFilterMainForm.PCardValueOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
     sp: TSprav;
begin
     sp := GetSprav('asup\PCardsList');
     if sp <> nil then
     begin
            with sp.Input do
            begin
                  Append;
                  FieldValues['DBHandle']   := Integer(workDatabase.Handle);
                  FieldValues['ActualDate'] := Date;
                  FieldValues['AdminMode']  := 0;
                  FieldValues['Select']     := 1;
                  FieldValues['ShowStyle']  := 0;

                  if FindField('NewVersion')<>nil
                  then begin
                            FieldValues['NewVersion'] := 1;
                  end;
                  Post;
            end;
            sp.Show;

            if ( sp.Output <> nil ) and not sp.Output.IsEmpty
            then begin
                      Value := sp.Output['ID_PCARD'];
                      DisplayText := sp.Output['FIO'];
                      cxButton1.SetFocus;
            end;
     end;
end;

procedure TFilterMainForm.CheckPrivateCardPropertiesChange(
  Sender: TObject);
var Res:Variant;
    S:String;
begin
     PCardValue.Blocked:=not CheckPrivateCard.Checked;
     if (CheckPrivateCard.Checked) and (PCardValue.Value=NULL)
     then begin
               PCardValue.OnOpenSprav(PCardValue, Res, S);
               PCardValue.Value      :=Res;
               PCardValue.DisplayText:=S;
     end;
end;

procedure TFilterMainForm.CheckPostPropertiesChange(Sender: TObject);
var Res:Variant;
    S:String;
begin
     PostSalaryValue.Blocked:=not CheckPostSalary.Checked;
     if CheckPostSalary.Checked and PostSalaryValue.Value=null
     then begin
               PostSalaryValue.OnOpenSprav(PCardValue, Res, S);
               PostSalaryValue.Value      :=Res;
               PostSalaryValue.DisplayText:=S;
     end;
end;

procedure TFilterMainForm.PostSalaryValueOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var   DM :TdmShtatUtils;
      Params:TUnivParams;
      OutPut : TRxMemoryData;
begin
      if (PCardValue.Value=null) or (not CheckPrivateCard.checked)
      then begin
                DM := TdmShtatUtils.Create(self, Integer(WorkDatabase.Handle),  Date);
                DM.GetSalary(Value,DisplayText);
      end
      else begin
                {SelectCurWorkPlace.Close;
                SelectCurWorkPlace.ParamByName('Cur_Date').AsDate := Date;
                SelectCurWorkPlace.ParamByName('Id_Pcard').AsInteger := PCardValue.Value;
                SelectCurWorkPlace.Open;   }

               {if qSelect(SelectCurWorkPlace) then
                begin
                    Value := SelectCurWorkPlace['ID_POST_SALARY_REAL'];
                    DisplayText := VarToStr(SelectCurWorkPlace['NAME_POST']) + ' (' + VarToStr(SelectCurWorkPlace['NAME_DEPARTMENT']) + ')';
                end;   }

                Params.FormCaption:='Посади';
                Params.ShowMode:=fsmSelect;
                Params.ShowButtons:=[fbExit];
                Params.TableName:='UP_KER_GET_CUR_WORK_PLACE('+ QuotedStr(DateToStr(MMDate.Value))+','+QuotedStr(IntToStr(PCardValue.Value))+')';
                Params.Fields:='NAME_POST,NAME_DEPARTMENT,DATE_BEG,KOL_STAVOK_STR,WORK_REASON,NAME_AWAY,NAME_SOVMEST,ID_POST_SALARY_REAL,ID_MAN_MOVING';
                Params.FieldsName:='  Посада  ,  Підрозділ  , Початок , К-ть ставок, Підстава для роботи, На час кого працює?';
                Params.KeyField:='ID_MAN_MOVING';
                Params.ReturnFields:='NAME_POST,NAME_DEPARTMENT,ID_POST_SALARY_REAL, ID_POST_SALARY_REAL,ID_MAN_MOVING';
                Params.DBHandle:=Integer(WorkDatabase.Handle);
                OutPut:=TRxMemoryData.Create(self);

                if GetUnivSprav(Params,OutPut)
                then begin
                           value:=output['ID_MAN_MOVING'];
                           DisplayText:=VarToStr(output['NAME_POST']) + ' (' + VarToStr(output['NAME_DEPARTMENT']) + ')';
                end;

      end;
end;

procedure TFilterMainForm.WorkCondValueOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
      Params:TUnivParams;
      OutPut : TRxMemoryData;
begin
      Params.FormCaption:='Довідник умов праці';
      Params.ShowMode:=fsmSelect;
      Params.ShowButtons:=[fbExit];
      Params.TableName:='INI_WORK_COND';
      Params.Fields:='NAME_WORK_COND,ID_WORK_COND';
      Params.FieldsName:='Назва';
      Params.KeyField:='ID_WORK_COND';
      Params.ReturnFields:='NAME_WORK_COND,ID_WORK_COND';
      Params.DBHandle:=Integer(WorkDatabase.Handle);

      OutPut:=TRxMemoryData.Create(self);

      if GetUnivSprav(Params,OutPut)
      then begin
                 value:=output['ID_WORK_COND'];
                 DisplayText:=VarToStr(output['NAME_WORK_COND']);
      end;
end;

procedure TFilterMainForm.CheckWorkCondPropertiesChange(Sender: TObject);
var S:String;
    Res:variant;
begin
     WorkCondValue.Blocked:=not CheckWorkCond.Checked;
     if CheckWorkCond.Checked and WorkCondValue.Value=null
     then begin
                WorkCondValue.OnOpenSprav(WorkCondValue, Res, S);
                WorkCondValue.Value      :=Res;
                WorkCondValue.DisplayText:=S;
     end;
end;

procedure TFilterMainForm.WorkModeValueOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
      Params:TUnivParams;
      OutPut : TRxMemoryData;
begin
      Params.FormCaption:='Довідник режимів праці';
      Params.ShowMode:=fsmSelect;
      Params.ShowButtons:=[fbExit];
      Params.TableName:='DT_WORK_MODE';
      Params.Fields:='NAME,ID_WORK_MODE';
      Params.FieldsName:='Назва';
      Params.KeyField:='ID_WORK_MODE';
      Params.ReturnFields:='NAME,ID_WORK_MODE';
      Params.DBHandle:=Integer(WorkDatabase.Handle);

      OutPut:=TRxMemoryData.Create(self);

      if GetUnivSprav(Params,OutPut)
      then begin
                value:=output['ID_WORK_MODE'];
                DisplayText:=VarToStr(output['NAME']);
      end;
end;

procedure TFilterMainForm.CheckWorkModePropertiesChange(Sender: TObject);
var Res:Variant;
    S:String;
begin
     WorkModeValue.Blocked:=not CheckWorkMode.Checked;
     if CheckWorkMode.Checked and WorkModeValue.Value=null
     then begin
                WorkModeValue.OnOpenSprav(WorkCondValue, Res, S);
                WorkModeValue.Value      :=Res;
                WorkModeValue.DisplayText:=S;
     end;
end;

procedure TFilterMainForm.FormPayValueOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
      Params:TUnivParams;
      OutPut : TRxMemoryData;
begin
      Params.FormCaption:='Довідник форм оплати';
      Params.ShowMode:=fsmSelect;
      Params.ShowButtons:=[fbExit];
      Params.TableName:='INI_PAY_FORM';
      Params.Fields:='NAME_PAY_FORM,ID_PAY_FORM';
      Params.FieldsName:='Назва';
      Params.KeyField:='ID_PAY_FORM';
      Params.ReturnFields:='NAME_PAY_FORM,ID_PAY_FORM';
      Params.DBHandle:=Integer(WorkDatabase.Handle);

      OutPut:=TRxMemoryData.Create(self);

      if GetUnivSprav(Params,OutPut)
      then begin
                value:=output['ID_PAY_FORM'];
                DisplayText:=VarToStr(output['NAME_PAY_FORM']);
      end;
end;

procedure TFilterMainForm.CheckFormPayValuePropertiesChange(
  Sender: TObject);
var S:String;
    Res:variant;
begin
     FormPayValue.Blocked:=not CheckFormPayValue.Checked;
     if CheckFormPayValue.Checked and FormPayValue.Value=null
     then begin
                FormPayValue.OnOpenSprav(FormPayValue, Res, S);
                FormPayValue.Value      :=Res;
                FormPayValue.DisplayText:=S;
     end;
end;

procedure TFilterMainForm.DepartmentValueOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
     sp: TSprav;
begin
     sp := GetSprav('SpDepartment');
     if sp <> nil then
     begin
            with sp.Input do
            begin
                  Append;
                  FieldValues['DBHandle']   := Integer(workDatabase.Handle);
                  FieldValues['Select']     := 1;
                  FieldValues['ShowStyle']  := 0;
                  Post;
            end;
            sp.Show;

            if ( sp.Output <> nil ) and not sp.Output.IsEmpty
            then begin
                      Value := sp.Output['ID_DEPARTMENT'];
                      DisplayText := sp.Output['NAME_FULL'];
            end;
     end;
end;

procedure TFilterMainForm.CheckDepartmentValuePropertiesChange(
  Sender: TObject);
var S:sTring;
    Res:variant;
begin
     DepartmentValue.Blocked:=not CheckDepartmentValue.Checked;
     CHECK_CHILD_DEPARTMENT.Enabled:=CheckDepartmentValue.Checked;
     if CheckDepartmentValue.Checked and DepartmentValue.value=null
     then begin
                DepartmentValue.OnOpenSprav(DepartmentValue, Res, S);
                DepartmentValue.Value      :=Res;
                DepartmentValue.DisplayText:=S;
     end;
end;

procedure TFilterMainForm.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TFilterMainForm.cxButton1Click(Sender: TObject);
begin
     if CheckData
     then begin
               GetFilteringData;
               if ((isOrderTypeNewOklad) And (CheckDateEndAfter.Checked=False)) then
               begin
                  if agMessageDlg('Увага!', 'На вкладці "Періоди" були обрані такі значення фільтру,'+#13+
                                  'що можуть привести до неправильного встановлення нового окладу.'+#13+
                                  'Продовжити роботу?', mtInformation, [mbYes, mbNo])=mrYes
                  then ModalResult:=mrYes;
               end
               else ModalResult:=mrYes;
     end;
end;

procedure TFilterMainForm.BudgetValueOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var Res:Variant;
begin
    Res:=GlobalSPR.GetSmets(self,
                       WorkDatabase.Handle,
                       Date,
                       psmSmetWithoutPeriod);
    if (VarArrayDimCount(Res)>0)
    then begin
              Value:=Res[0];
              DisplayText:=VarToStr(Res[3])+ ' "'+VarToStr(Res[2])+'"';
    end;
end;

procedure TFilterMainForm.CheckBudgetValuePropertiesChange(
  Sender: TObject);
var S:String;
    Res:Variant;
begin
     BudgetValue.Blocked:=not CheckBudgetValue.Checked;
     if CheckBudgetValue.Checked and BudgetValue.Value=null
     then begin
                BudgetValue.OnOpenSprav(BudgetValue, Res, S);
                BudgetValue.Value      :=Res;
                BudgetValue.DisplayText:=S;
     end;
end;

procedure TFilterMainForm.CheckMMDateBegPropertiesChange(Sender: TObject);
begin
     MMDateBeg.Blocked:=not CheckMMDateBeg.Checked;
end;

procedure TFilterMainForm.CheckMMDateEndPropertiesChange(Sender: TObject);
begin
     MMDateEnd.Blocked:=not CheckMMDateEnd.Checked;
end;

procedure TFilterMainForm.CheckMMDatePropertiesChange(Sender: TObject);
begin
     MMDate.Blocked:=not CheckMMDate.Checked;
end;

procedure TFilterMainForm.CheckExistRatePropertiesChange(Sender: TObject);
var S:String;
    Res:variant;
begin
     ExistRateValue.Blocked    :=not CheckExistRate.Checked;
     ExistTypeRateValue.Enabled:=CheckExistRate.Checked;
     ExistRateDateValue.Blocked:=not CheckExistRate.Checked;
     ExistTypeRateValue.ItemIndex:=0;

     if CheckExistRate.checked and ExistRateValue.Value=null
     then begin
               ExistRateValue.OnOpenSprav(ExistRateValue, Res, S);
               ExistRateValue.Value      :=Res;
               ExistRateValue.DisplayText:=S;
     end;
end;

procedure TFilterMainForm.CheckNotExistsRatePropertiesChange(
  Sender: TObject);
var S:String;
    Res:Variant;
begin
     NotExistRateValue.Blocked    :=not CheckNotExistsRate.Checked;
     NotExistTypeRateValue.Enabled:=CheckNotExistsRate.Checked;
     NotExistRateDateValue.Blocked:=not CheckNotExistsRate.Checked;

     if CheckNotExistsRate.Checked and NotExistRateValue.Value=Null
     then begin
               NotExistRateValue.OnOpenSprav(NotExistRateValue, Res, S);
               NotExistRateValue.Value      :=Res;
               NotExistRateValue.DisplayText:=S;
     end;
end;

procedure TFilterMainForm.ExistRateValueOpenSprav
(Sender: TObject; var Value: Variant; var DisplayText: String);
var
     sp: TSprav;
begin
     sp := GetSprav('Asup/SpRaise');
     if sp <> nil then
     begin
            with sp.Input do
            begin
                  Append;
                  FieldValues['DBHandle']   := Integer(workDatabase.Handle);
                  FieldValues['Select']     := 1;
                  FieldValues['Actual_Date']:= ExistRateDateValue.Value;
                  FieldValues['ShowStyle']  := 0;
                  Post;
            end;
            sp.Show;

            if ( sp.Output <> nil ) and not sp.Output.IsEmpty
            then begin
                      Value       := sp.Output['ID_RAISE'];
                      DisplayText := sp.Output['NAME'];
            end;
     end;
end;
procedure TFilterMainForm.NotExistRateValueOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
     sp: TSprav;
begin
     sp := GetSprav('Asup/SpRaise');
     if sp <> nil then
     begin
            with sp.Input do
            begin
                  Append;
                  FieldValues['DBHandle']   := Integer(workDatabase.Handle);
                  FieldValues['Select']     := 1;
                  FieldValues['Actual_Date']:= NotExistRateDateValue.Value;
                  FieldValues['ShowStyle']  := 0;
                  Post;
            end;
            sp.Show;

            if ( sp.Output <> nil ) and not sp.Output.IsEmpty
            then begin
                      Value       := sp.Output['ID_RAISE'];
                      DisplayText := sp.Output['NAME'];
            end;
     end;
end;

procedure TFilterMainForm.cxButton3Click(Sender: TObject);
begin
    if CheckPrivateCard.Checked
    then begin
              CheckPrivateCard.Checked:=false;
              CheckPrivateCard.Properties.OnChange(self);
    end;

    if CheckPostSalary.Checked
    then begin
              CheckPostSalary.Checked:=false;
              CheckPostSalary.Properties.OnChange(self);
    end;

    if CheckWorkMode.Checked
    then begin
              CheckWorkMode.Checked:=false;
              CheckWorkMode.Properties.OnChange(self);
    end;

    if CheckWorkCond.Checked
    then begin
              CheckWorkCond.Checked:=false;
              CheckWorkCond.Properties.OnChange(self);
    end;

    if CheckMMDateBeg.Checked
    then begin
              CheckMMDateBeg.Checked:=false;
              CheckMMDateBeg.Properties.OnChange(self);
    end;

    if CheckFormPayValue.Checked
    then begin
              CheckFormPayValue.Checked:=false;
              CheckFormPayValue.Properties.OnChange(self);
    end;

    if CheckBudgetValue.Checked
    then begin
              CheckBudgetValue.Checked:=false;
              CheckBudgetValue.Properties.OnChange(self);
    end;

    if CheckExistRate.Checked
    then begin
              CheckExistRate.Checked:=false;
              CheckExistRate.Properties.OnChange(self);
    end;

     if CheckBudgetRate.Checked
    then begin
              CheckBudgetRate.Checked:=false;
              CheckBudgetRate.Properties.OnChange(self);
    end;

    if CheckNotExistsRate.Checked
    then begin
              CheckNotExistsRate.Checked:=false;
              CheckNotExistsRate.Properties.OnChange(self);
    end;

    if CheckDepartmentValue.Checked
    then begin
              CheckDepartmentValue.Checked:=false;
              CheckDepartmentValue.Properties.OnChange(self);
    end;

    if CheckMMDateEnd.Checked
    then begin
              CheckMMDateEnd.Checked:=false;
              CheckMMDateEnd.Properties.OnChange(self);
    end;

    if CheckMMDate.Checked
    then begin
              CheckMMDate.Checked:=false;
              CheckMMDate.Properties.OnChange(self);
    end;

    if CheckSex.Checked
    then begin
              CheckSex.Checked:=false;
              CheckSex.Properties.OnChange(self);
    end;

    if CheckStaj.Checked
    then begin
              CheckStaj.Checked:=false;
              CheckStaj.Properties.OnChange(self);
    end;

    if CheckWorkCond.Checked
    then begin
              CheckWorkCond.Checked:=false;
              CheckWorkCond.Properties.OnChange(self);
    end;

    if CheckRates.Checked
    then begin
              CheckRates.Checked:=false;
              CheckRates.Properties.OnChange(self);
    end;

    if CheckDateEndAfter.Checked
    then begin
              CheckDateEndAfter.Checked:=false;
              CheckDateEndAfter.Properties.OnChange(self);
    end;

end;

procedure TFilterMainForm.cxButton4Click(Sender: TObject);
 var InsertSP:TpFibStoredProc;
begin
     InsertSP:=TpFibStoredProc.Create(self);
     InsertSP.Database   :=WorkDatabase;
     InsertSP.Transaction:=WriteTransaction;
     WriteTransaction.StartTransaction;
     InsertSP.StoredProcName:='UP_DT_KERNELL_FILTER_DEFINE_INS';
     InsertSP.Prepare;
     InsertSP.ParamByName('ID_ORDER_TYPE').Value             :=self.id_order_type;
     InsertSP.ParamByName('DEF_NAME').Value                  :=InputBox('Увага!','Треба ввести назву конфігурації','Конфігурація без назви!');
     InsertSP.ParamByName('CHECK_PCARD_VALUE').Value         :=Integer(CheckPrivateCard.Checked);
     InsertSP.ParamByName('PCARD_DISPLAYTEXT').Value         :=PCardValue.DisplayText;
     InsertSP.ParamByName('PCARD_VALUE').Value               :=PCardValue.Value;
     InsertSP.ParamByName('CHECK_MMDATE_BEG_VALUE').Value    :=Integer(CheckMMDateBeg.Checked);
     InsertSP.ParamByName('MMDATE_BEG_VALUE').Value          :=VarAsType(MMDateBeg.Value,varDate);
     InsertSP.ParamByName('CHECK_MMDATE_END_VALUE').Value    :=Integer(CheckMMDateEnd.Checked);
     InsertSP.ParamByName('MMDATE_END_VALUE').Value          :=VarAsType(MMDateEnd.Value,varDate);
     InsertSP.ParamByName('CHECK_MMDATE_VALUE').Value        :=Integer(CheckMMDate.Checked);
     InsertSP.ParamByName('MMDATE_VALUE').Value              :=VarAsType(MMDate.Value,varDate);
     InsertSP.ParamByName('CHECK_POSTSALARY_VALUE').Value    :=Integer(CheckPostSalary.Checked);
     InsertSP.ParamByName('POSTSALARY_DISPLAYTEXT').Value    :=PostSalaryValue.DisplayText;
     InsertSP.ParamByName('POSTSALARY_VALUE').Value          :=PostSalaryValue.Value;
     InsertSP.ParamByName('CHECK_WORKCOND_VALUE').Value      :=Integer(CheckWorkCond.Checked);
     InsertSP.ParamByName('WORKCOND_DISPLAYTEXT').Value      :=WorkCondValue.DisplayText;
     InsertSP.ParamByName('WORKCOND_VALUE').Value            :=WorkCondValue.Value;
     InsertSP.ParamByName('CHECK_WORKMODE_VALUE').Value      :=Integer(CheckWorkMode.Checked);
     InsertSP.ParamByName('WORKMODE_DISPLAYTEXT').Value      :=WorkModeValue.DisplayText;
     InsertSP.ParamByName('WORKMODE_VALUE').Value            :=WorkModeValue.Value;
     InsertSP.ParamByName('CHECK_FORMPAY_VALUE').Value       :=Integer(CheckFormPayValue.Checked);
     InsertSP.ParamByName('FORMPAY_DISPLAYTEXT').Value       :=FormPayValue.DisplayText;
     InsertSP.ParamByName('FORMPAY_VALUE').Value             :=FormPayValue.Value;
     InsertSP.ParamByName('CHECK_BUDGET_VALUE').Value        :=Integer(CheckBudgetValue.Checked);
     InsertSP.ParamByName('BUDGET_DISPLAYTEXT').Value        :=BudgetValue.DisplayText;
     InsertSP.ParamByName('BUDGET_VALUE').Value              :=BudgetValue.Value;
     InsertSP.ParamByName('CHECK_DEPARTMENT_VALUE').Value    :=Integer(CheckDepartmentValue.Checked);
     InsertSP.ParamByName('DEPARTMENT_DISPLAYTEXT').Value    :=DepartmentValue.DisplayText;
     InsertSP.ParamByName('DEPARTMENT_VALUE').Value          :=DepartmentValue.Value;
     InsertSP.ParamByName('CHECK_EXISTRATE').Value           :=Integer(CheckExistRate.Checked);
     InsertSP.ParamByName('EXISTRATE_DISPLAYTEXT').Value     :=ExistRateValue.DisplayText;
     InsertSP.ParamByName('EXISTRATE_VALUE').Value           :=ExistRateValue.Value;
     InsertSP.ParamByName('CHECK_BUDGETRATE').Value           :=Integer(CheckBudgetRate.Checked);
     InsertSP.ParamByName('BUDGETRATE_DISPLAYTEXT').Value     :=BudgetRate.DisplayText;
     InsertSP.ParamByName('BUDGETRATE_VALUE').Value           :=BudgetRate.Value;
     InsertSP.ParamByName('EXISTRATEDATE_VALUE').Value       :=VarAsType(ExistRateDateValue.Value,varDate);
     InsertSP.ParamByName('EXISTTYPERATE_VALUE').Value       :=ExistTypeRateValue.ItemIndex;
     InsertSP.ParamByName('EXISTSUM_RATE_VALUE').Value       :=NULL;
     InsertSP.ParamByName('EXISTPERCENT_RATE_VALUE').Value   :=NULL;
     InsertSP.ParamByName('CHECK_NOTEXISTSRATE').Value       :=Integer(CheckNotExistsRate.Checked);
     InsertSP.ParamByName('NOTEXISTRATE_DISPLAYTEXT').Value  :=NotExistRateValue.DisplayText;
     InsertSP.ParamByName('NOTEXISTRATE_VALUE').Value        :=NotExistRateValue.Value;
     InsertSP.ParamByName('NOTEXISTRATEDATE_VALUE').Value    :=VarAsType(NotExistRateDateValue.Value,varDate);
     InsertSP.ParamByName('NOTEXISTTYPERATE_VALUE').Value    :=NotExistTypeRateValue.ItemIndex;
     InsertSP.ParamByName('NOTEXISTSUM_RATE_VALUE').Value    :=NULL;
     InsertSP.ParamByName('NOTEXISTPERCENT_RATE_VALUE').Value:=NULL;

     InsertSP.ParamByName('CHECK_IS_MAIN_VALUE').Value       :=Integer(CheckIsMain.Checked);
     InsertSP.ParamByName('IS_MAIN_VALUE').Value             :=IsMainValue.ItemIndex;
     InsertSP.ParamByName('CHECK_CATEGORY_VALUE').Value      :=Integer(CheckCategory.Checked);
     InsertSP.ParamByName('CATEGORY_VALUE').Value            :=CategoryValue.Value;
     InsertSP.ParamByName('CATEGORY_DISPLAYTEXT').Value      :=CategoryValue.DisplayText;
     InsertSP.ParamByName('CHECK_SEX_VALUE').Value           :=Integer(CheckSex.Checked);
     InsertSP.ParamByName('SEX_VALUE').Value                 :=SexValue.Value;
     InsertSP.ParamByName('SEX_DISPLAYTEXT').Value           :=SexValue.DisplayText;
     InsertSP.ExecProc;
     WriteTransaction.Commit;
     InsertSP.Free;
end;

procedure TFilterMainForm.LoadPredefinedInfo(id_predefined: Integer);
var GetPrInfo:TpFibDataSet;
begin
     GetPrInfo:=TpFibDataSet.Create(self);
     GetPrInfo.Database:=WorkDatabase;
     GetPrInfo.Transaction:=ReadTransaction;
     GetPrInfo.SelectSQL.Text:='select * from UP_DT_KERNELL_FILTER_DEFINE where ID_DEFINE='+IntToStr(id_predefined);
     GetPrInfo.Open;
     if (GetPrInfo.RecordCount>0)
     then begin
               CheckPrivateCard.Checked  :=GetPrInfo.FieldByName('CHECK_PCARD_VALUE').Value;
               PCardValue.DisplayText    :=GetPrInfo.FieldByName('PCARD_DISPLAYTEXT').Value;
               PCardValue.Value          :=GetPrInfo.FieldByName('PCARD_VALUE').Value;
               CheckMMDateBeg.Checked    :=GetPrInfo.FieldByName('CHECK_MMDATE_BEG_VALUE').Value;
               MMDateBeg.Value           :=GetPrInfo.FieldByName('MMDATE_BEG_VALUE').Value;
               CheckMMDateEnd.Checked    :=GetPrInfo.FieldByName('CHECK_MMDATE_END_VALUE').Value;
               MMDateEnd.Value           :=GetPrInfo.FieldByName('MMDATE_END_VALUE').Value;
               CheckMMDate.Checked       :=GetPrInfo.FieldByName('CHECK_MMDATE_VALUE').Value;
               MMDate.Value              :=GetPrInfo.FieldByName('MMDATE_VALUE').Value;
               CheckPostSalary.Checked   :=GetPrInfo.FieldByName('CHECK_POSTSALARY_VALUE').Value;
               PostSalaryValue.DisplayText:=GetPrInfo.FieldByName('POSTSALARY_DISPLAYTEXT').Value;
               PostSalaryValue.Value     :=GetPrInfo.FieldByName('POSTSALARY_VALUE').Value;
               CheckWorkCond.Checked     :=GetPrInfo.FieldByName('CHECK_WORKCOND_VALUE').Value;
               WorkCondValue.DisplayText :=GetPrInfo.FieldByName('WORKCOND_DISPLAYTEXT').Value;
               WorkCondValue.Value       :=GetPrInfo.FieldByName('WORKCOND_VALUE').Value;
               CheckWorkMode.Checked     :=GetPrInfo.FieldByName('CHECK_WORKMODE_VALUE').Value;
               WorkModeValue.DisplayText :=GetPrInfo.FieldByName('WORKMODE_DISPLAYTEXT').Value;
               WorkModeValue.Value       :=GetPrInfo.FieldByName('WORKMODE_VALUE').Value;
               CheckFormPayValue.Checked :=GetPrInfo.FieldByName('CHECK_FORMPAY_VALUE').Value;
               FormPayValue.DisplayText  :=GetPrInfo.FieldByName('FORMPAY_DISPLAYTEXT').Value;
               FormPayValue.Value        :=GetPrInfo.FieldByName('FORMPAY_VALUE').Value;
               CheckBudgetValue.Checked  :=GetPrInfo.FieldByName('CHECK_BUDGET_VALUE').Value;
               BudgetValue.DisplayText   :=GetPrInfo.FieldByName('BUDGET_DISPLAYTEXT').Value;
               BudgetValue.Value         :=GetPrInfo.FieldByName('BUDGET_VALUE').Value;
               CheckDepartmentValue.Checked:=GetPrInfo.FieldByName('CHECK_DEPARTMENT_VALUE').Value;
               DepartmentValue.DisplayText:=GetPrInfo.FieldByName('DEPARTMENT_DISPLAYTEXT').Value;
               DepartmentValue.Value     :=GetPrInfo.FieldByName('DEPARTMENT_VALUE').Value;
               CheckExistRate.Checked    :=GetPrInfo.FieldByName('CHECK_EXISTRATE').Value;
               ExistRateValue.DisplayText:=GetPrInfo.FieldByName('EXISTRATE_DISPLAYTEXT').Value;
               ExistRateValue.Value      :=GetPrInfo.FieldByName('EXISTRATE_VALUE').Value;
               CheckBudgetRate.Checked    :=GetPrInfo.FieldByName('CHECK_BUDGETRATE').Value;
               BudgetRate.DisplayText:=GetPrInfo.FieldByName('BUDGETRATE_DISPLAYTEXT').Value;
               BudgetRate.Value     :=GetPrInfo.FieldByName('BUDGETRATE_VALUE').Value;
               ExistRateDateValue.Value  :=GetPrInfo.FieldByName('EXISTRATEDATE_VALUE').Value;
               ExistTypeRateValue.ItemIndex:=GetPrInfo.FieldByName('EXISTTYPERATE_VALUE').Value;
               //ExistSum_Value.Value      :=GetPrInfo.FieldByName('EXISTSUM_RATE_VALUE').Value;
               //ExistPercent_Value.Value  :=GetPrInfo.FieldByName('EXISTPERCENT_RATE_VALUE').Value;
               CheckNotExistsRate.Checked:=GetPrInfo.FieldByName('CHECK_NOTEXISTSRATE').Value;
               NotExistRateValue.DisplayText:=GetPrInfo.FieldByName('NOTEXISTRATE_DISPLAYTEXT').Value;
               NotExistRateValue.Value   :=GetPrInfo.FieldByName('NOTEXISTRATE_VALUE').Value;
               NotExistRateDateValue.Value:=GetPrInfo.FieldByName('NOTEXISTRATEDATE_VALUE').Value;
               NotExistTypeRateValue.ItemIndex:=GetPrInfo.FieldByName('NOTEXISTTYPERATE_VALUE').Value;
               //NotExistSum_Value.Value   :=GetPrInfo.FieldByName('NOTEXISTSUM_RATE_VALUE').Value;
               //NotExistPercent_Value.Value:=GetPrInfo.FieldByName('NOTEXISTPERCENT_RATE_VALUE').Value;
               CheckIsMain.Checked        :=GetPrInfo.FieldByName('CHECK_IS_MAIN_VALUE').Value;
               IsMainValue.ItemIndex      :=GetPrInfo.FieldByName('IS_MAIN_VALUE').Value;
               CheckCategory.Checked      :=GetPrInfo.FieldByName('CHECK_CATEGORY_VALUE').Value;
               CategoryValue.Value        :=GetPrInfo.FieldByName('CATEGORY_VALUE').Value;
               CategoryValue.DisplayText  :=GetPrInfo.FieldByName('CATEGORY_DISPLAYTEXT').Value;
               CheckSex.Checked           :=GetPrInfo.FieldByName('CHECK_SEX_VALUE').Value;
               SexValue.Value             :=GetPrInfo.FieldByName('SEX_VALUE').Value;
               SexValue.DisplayText       :=GetPrInfo.FieldByName('SEX_DISPLAYTEXT').Value;
               CheckDateEndAfter.Checked  :=GetPrInfo.FieldByName('CHECK_DATE_END_AFTER').Value;
               DateEndAfter.Value         :=GetPrInfo.FieldByName('DATE_END_AFTER').Value;

               CheckPrivateCard.Properties.OnChange(self);
               CheckPostSalary.Properties.OnChange(self);
               CheckWorkMode.Properties.OnChange(self);
               CheckWorkCond.Properties.OnChange(self);
               CheckMMDateBeg.Properties.OnChange(self);
               CheckFormPayValue.Properties.OnChange(self);
               CheckBudgetValue.Properties.OnChange(self);
               CheckExistRate.Properties.OnChange(self);
               CheckBudgetRate.Properties.OnChange(self);
               CheckNotExistsRate.Properties.OnChange(self);
               CheckDepartmentValue.Properties.OnChange(self);
               CheckMMDateEnd.Properties.OnChange(self);
               CheckMMDate.Properties.OnChange(self);
               CheckDateEndAfter.Properties.OnChange(Self);
     end;
     GetPrInfo.Close;
     GetPrInfo.Free;
end;

procedure TFilterMainForm.SexValueOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
      Params:TUnivParams;
      OutPut : TRxMemoryData;
begin
      Params.FormCaption:='Довідник статі';
      Params.ShowMode:=fsmSelect;
      Params.ShowButtons:=[fbExit];
      Params.TableName:='INI_SEX';
      Params.Fields:='FULL_NAME,ID_SEX';
      Params.FieldsName:='Назва';
      Params.KeyField:='ID_SEX';
      Params.ReturnFields:='FULL_NAME,ID_SEX';
      Params.DBHandle:=Integer(WorkDatabase.Handle);

      OutPut:=TRxMemoryData.Create(self);

      if GetUnivSprav(Params,OutPut)
      then begin
                 value:=output['ID_SEX'];
                 DisplayText:=VarToStr(output['FULL_NAME']);
      end;
end;

procedure TFilterMainForm.CheckSexPropertiesChange(Sender: TObject);
var S:String;
    Res:Variant;
begin
     SexValue.Blocked:=not CheckSex.Checked;
     if CheckSex.Checked and SexValue.Value=null
     then begin
               SexValue.OnOpenSprav(PCardValue, Res, S);
               SexValue.Value      :=Res;
               SexValue.DisplayText:=S;
     end;
end;

procedure TFilterMainForm.CategoryValueOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
      Params:TUnivParams;
      OutPut : TRxMemoryData;
begin
      Params.FormCaption:='Довідник типів персонала';
      Params.ShowMode:=fsmSelect;
      Params.ShowButtons:=[fbExit];
      Params.TableName:='SP_TYPE_POST';
      Params.Fields:='NAME_TYPE_POST,ID_TYPE_POST';
      Params.FieldsName:='Назва';
      Params.KeyField:='ID_TYPE_POST';
      Params.ReturnFields:='NAME_TYPE_POST,ID_TYPE_POST';
      Params.DBHandle:=Integer(WorkDatabase.Handle);

      OutPut:=TRxMemoryData.Create(self);

      if GetUnivSprav(Params,OutPut)
      then begin
                 value:=output['ID_TYPE_POST'];
                 DisplayText:=VarToStr(output['NAME_TYPE_POST']);
      end;
end;

procedure TFilterMainForm.CheckCategoryPropertiesChange(Sender: TObject);
var S:String;
    Res:Variant;
begin
     CategoryValue.Blocked:=not CheckCategory.Checked;
     if CheckCategory.Checked and CategoryValue.Value=Null
     then begin
                CategoryValue.OnOpenSprav(CategoryValue, Res, S);
                CategoryValue.Value      :=Res;
                CategoryValue.DisplayText:=S;
     end;
end;

procedure TFilterMainForm.CheckIsMainPropertiesChange(Sender: TObject);
begin
     IsMainValue.Enabled:=CheckIsMain.Checked;
end;

procedure TFilterMainForm.GetFilteringData;
var GetData:TpFibStoredProc;
begin
     try
               Panel3.Visible:=true;
               Screen.Cursor:=crHourGlass;
               Application.ProcessMessages;
               GetData:=TpFibStoredProc.Create(self);
               GetData.Database:=WorkDatabase;
               GetData.Transaction:=WriteTransaction;
               WriteTransaction.StartTransaction;
               GetData.StoredProcName:='UP_KER_GET_FILTER_DATA';
               GetData.Prepare;
               GetData.ParamByName('KEY_SESSION').asInt64             :=key_session;
               GetData.ParamByName('CHECK_PCARD_VALUE').Value         :=integer(CheckPrivateCard.Checked);
               GetData.ParamByName('PCARD_VALUE').Value               :=PCardValue.Value;
               GetData.ParamByName('CHECK_MMDATE_BEG_VALUE').Value    :=integer(CheckMMDateBeg.Checked);
               GetData.ParamByName('MMDATE_BEG_VALUE').Value          :=VarAsType(MMDateBeg.Value,varDate);
               GetData.ParamByName('CHECK_MMDATE_END_VALUE').Value    :=integer(CheckMMDateEnd.Checked);
               GetData.ParamByName('MMDATE_END_VALUE').Value          :=VarAsType(MMDateEnd.Value,varDate);
               GetData.ParamByName('CHECK_MMDATE_VALUE').Value        :=Integer(CheckMMDate.Checked);
               GetData.ParamByName('MMDATE_VALUE').Value              :=VarAsType(MMDate.Value,varDate);
               GetData.ParamByName('CHECK_POSTSALARY_VALUE').Value    :=integer(CheckPostSalary.Checked);
               GetData.ParamByName('POSTSALARY_VALUE').Value          :=PostSalaryValue.Value;
               GetData.ParamByName('CHECK_WORKCOND_VALUE').Value      :=integer(CheckWorkCond.Checked);
               GetData.ParamByName('WORKCOND_VALUE').Value            :=WorkCondValue.Value;
               GetData.ParamByName('CHECK_WORKMODE_VALUE').Value      :=integer(CheckWorkMode.Checked);
               GetData.ParamByName('WORKMODE_VALUE').Value            :=WorkModeValue.Value;
               GetData.ParamByName('CHECK_FORMPAY_VALUE').Value       :=integer(CheckFormPayValue.Checked);
               GetData.ParamByName('FORMPAY_VALUE').Value             :=FormPayValue.Value;
               GetData.ParamByName('CHECK_BUDGET_VALUE').Value        :=integer(CheckBudgetValue.Checked);
               GetData.ParamByName('BUDGET_VALUE').Value              :=BudgetValue.Value;
               GetData.ParamByName('CHECK_DEPARTMENT_VALUE').Value    :=integer(CheckDepartmentValue.Checked);
               GetData.ParamByName('DEPARTMENT_VALUE').Value          :=DepartmentValue.Value;
               GetData.ParamByName('CHECK_EXISTRATE').Value           :=integer(CheckExistRate.Checked);
               GetData.ParamByName('EXISTRATE_VALUE').Value           :=ExistRateValue.Value;
               GetData.ParamByName('CHECK_BUDGETRATE').Value          :=integer(CheckBudgetRate.Checked);
               GetData.ParamByName('BUDGETRATE_VALUE').Value          :=BudgetRate.Value;
               GetData.ParamByName('EXISTRATEDATE_VALUE').Value       :=VarAsType(ExistRateDateValue.Value,varDate);
               GetData.ParamByName('EXISTTYPERATE_VALUE').Value       :=ExistTypeRateValue.ItemIndex;
               if CheckExistRate.Checked then
               begin
                  if ExistTypeRateValue.ItemIndex=0 then
                  begin
                     if CheckSumBox.Checked then GetData.ParamByName('EXISTSUM_RATE_VALUE').Value:=SumRateValue.Value;
                     GetData.ParamByName('EXISTPERCENT_RATE_VALUE').Value:=null;
                  end
                  else
                  begin
                     GetData.ParamByName('EXISTSUM_RATE_VALUE').Value:=Null;
                     if CheckProcBox.Checked then GetData.ParamByName('EXISTPERCENT_RATE_VALUE').Value:=ProcRateValue.Value;
                  end;
               end;
               GetData.ParamByName('CHECK_NOTEXISTSRATE').Value       :=integer(CheckNotExistsRate.Checked);
               GetData.ParamByName('NOTEXISTRATE_VALUE').Value        :=NotExistRateValue.Value;
               GetData.ParamByName('NOTEXISTRATEDATE_VALUE').Value    :=VarAsType(NotExistRateDateValue.Value,varDate);
               GetData.ParamByName('NOTEXISTTYPERATE_VALUE').Value    :=NotExistTypeRateValue.ItemIndex;
               GetData.ParamByName('NOTEXISTSUM_RATE_VALUE').Value    :=null{NotExistSum_Value.Value};
               GetData.ParamByName('NOTEXISTPERCENT_RATE_VALUE').Value:=null{NotExistPercent_Value.Value};
               GetData.ParamByName('CHECK_IS_MAIN_VALUE').Value       :=Integer(CheckIsMain.Checked);
               GetData.ParamByName('IS_MAIN_VALUE').Value             :=IsMainValue.ItemIndex;
               GetData.ParamByName('CHECK_CATEGORY_VALUE').Value      :=integer(CheckCategory.Checked);
               GetData.ParamByName('CATEGORY_VALUE').Value            :=CategoryValue.Value;
               GetData.ParamByName('CHECK_SEX_VALUE').Value           :=CheckSex.Checked;
               GetData.ParamByName('SEX_VALUE').Value                 :=SexValue.Value;
               GetData.ParamByName('CHECK_ID_MAN').Value              :=CheckIdMen.Checked;
               GetData.ParamByName('ID_MEN').Value                    :=ManValue.Value;
               GetData.ParamByName('CHECK_CHILD_DEPARTMENT').Value    :=Integer(CHECK_CHILD_DEPARTMENT.Checked);
               GetData.ParamByName('CHECK_STAJ_VALUE').Value          :=Integer(CheckStaj.Checked);
               GetData.ParamByName('ID_STAJ_VALUE').Value             :=TypeStajValue.Value;
               GetData.ParamByName('STAJ_VALUE_MIN').Value            :=StajValueMin.Value;
               GetData.ParamByName('STAJ_VALUE_MAX').Value            :=StajValueMax.Value;
               GetData.ParamByName('STAJ_DATE').Value                 :=VarAsType(StajDate.Value,varDate);
               GetData.ParamByName('CHECK_ID_WORK_REASON').Value      :=Integer(CheckWorkReason.Checked);
               GetData.ParamByName('ID_WORK_REASON').Value            :=WorkReasonValue.Value;
               GetData.ParamByName('CHECK_DATEENDAFTER').Value        :=Integer(CheckDateEndAfter.Checked);
               GetData.ParamByName('DATEENDAFTER').Value              :=VarAsType(DateEndAfter.Value,varDate);
               GetData.ParamByName('CHECK_RATES').Value               :=Integer(CheckRates.Checked);
               GetData.ParamByName('RATE_MIN').Value                  :=RateMinValue.Value;
               GetData.ParamByName('RATE_MAX').Value                  :=RateMaxValue.Value;
               GetData.ParamByName('IS_IN_SOVM').Value                :=Integer(cxIsInSovm.Checked);
               GetData.ParamByName('IS_EXT_SOVM').Value               :=Integer(cxIsExtSovm.Checked);
               GetData.ParamByName('check_post_razr').Value           :=Integer(CheckPostRazr.Checked);
               GetData.ParamByName('post_razr').Value                 :=PostRazr.Value;
               GetData.ParamByName('check_post_sum').Value            :=Integer(CheckPostSum.Checked);
               GetData.ParamByName('min_post_sum').Value              :=MinPostSumValue.Value;
               GetData.ParamByName('max_post_sum').Value              :=MaxPostSumValue.Value;
               //Блок для исключения декретчиков
               GetData.ParamByName('WITHOUT_DEKRET').Value            :=Integer(WithoutDekret.Checked);
               GetData.ParamByName('DEKRET_DATE_BEG').Value           :=DekretDateBeg.Date;
               GetData.ParamByName('DEKRET_DATE_END').Value           :=DekretDateEnd.Date;

               GetData.ExecProc;
               self.Count:=GetData.ParamByName('CNT').Value;
               WriteTransaction.Commit;
               Panel3.Visible:=false;
               Screen.Cursor:=crDefault;
               Application.ProcessMessages;
      except on E:Exception do
               begin
                     ShowMessage(E.Message);
                     Screen.Cursor:=crDefault;
                     Application.ProcessMessages;
               end;
      end
end;

function TFilterMainForm.CheckData: Boolean;
var Res:Boolean;
begin
     Res:=true;
     if     Integer(CheckWorkCond.Checked)+
            Integer(CheckWorkMode.Checked)+
            Integer(CheckIsMain.Checked)+
            Integer(CheckCategory.Checked)+
            Integer(CheckPrivateCard.Checked)+
            Integer(CheckPostSalary.Checked)+
            Integer(CheckFormPayValue.Checked)+
            Integer(CheckBudgetValue.Checked)+
            Integer(CheckDepartmentValue.Checked)+
            Integer(CheckExistRate.Checked)+
            Integer(CheckBudgetRate.Checked)+
            Integer(CheckNotExistsRate.Checked)+
            Integer(CheckIdMen.Checked)+
            Integer(CHECK_CHILD_DEPARTMENT.Checked)+
            Integer(CheckStaj.Checked)+
            Integer(CheckMMDateBeg.Checked)+
            Integer(CheckMMDateEnd.Checked)+
            Integer(CheckSex.Checked)+
            Integer(CheckRates.Checked)+
            Integer(CheckWorkReason.Checked)+
            Integer(CheckDateEndAfter.Checked)+
            Integer(CheckPostRazr.Checked)+
            Integer(CheckPostSum.Checked)+
            Integer(CheckMMDate.Checked)   = 0
      then begin
                 if
                 agMessageDlg('Увага!','Ви не вибрали жодного критерію фільтрації!'+#13+
                              'Буде відібрана вся інснуюча інформація. Продовжити?',mtConfirmation, [mbYes,mbNo])=mrYes
                 then Res:=true
                 else Res:=false;
      end;

     if Integer(CheckWorkCond.Checked)+
            Integer(CheckWorkMode.Checked)+
            Integer(CheckIsMain.Checked)+
            Integer(CheckCategory.Checked)+
            Integer(CheckPrivateCard.Checked)+
            Integer(CheckPostSalary.Checked)+
            Integer(CheckFormPayValue.Checked)+
            Integer(CheckBudgetValue.Checked)+
            Integer(CheckDepartmentValue.Checked)+
            Integer(CheckExistRate.Checked)+
            Integer(CheckBudgetRate.Checked)+
            Integer(CheckNotExistsRate.Checked)+
            Integer(CheckIdMen.Checked)+
            Integer(CHECK_CHILD_DEPARTMENT.Checked)+
            Integer(CheckStaj.Checked)+
            Integer(CheckMMDateBeg.Checked)+
            Integer(CheckMMDateEnd.Checked)+
            Integer(CheckSex.Checked)+
            Integer(CheckRates.Checked)+
            Integer(CheckWorkReason.Checked)+
            Integer(CheckPostRazr.Checked)+
            Integer(CheckPostSum.Checked)+
            Integer(CheckDateEndAfter.Checked)= 0
      then begin
                 if
                 agMessageDlg('Увага!','Буде відібрана інформація по всім праціючим!'+
                              'Продовжити?',mtConfirmation, [mbYes,mbNo])=mrYes
                 then Res:=true
                 else Res:=false;
      end;

      Result:=Res;
end;

procedure TFilterMainForm.CheckIdMenPropertiesChange(Sender: TObject);
var Res:Variant;
    S:String;
begin
     ManValue.Blocked:=not CheckIdMen.Checked;
     if (CheckIdMen.Checked) and (ManValue.Value=NULL)
     then begin
               ManValue.OnOpenSprav(ManValue, Res, S);
               ManValue.Value      :=Res;
               ManValue.DisplayText:=S;
     end;
end;

procedure TFilterMainForm.ManValueOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var result:Variant;
begin
        result := AllPeopleUnit.GetManForASUP(Self, WorkDatabase.Handle, False, True);
        if (not VarIsNull(result)) and not (VarType(result) = varNull) and
        not (VarArrayDimCount(result) = 0) then begin
            Value := result[0];
            DisplayText := result[1];
        end;
end;

procedure TFilterMainForm.CheckStajPropertiesChange(Sender: TObject);
var Res:Variant;
    S:String;
begin
     TypeStajValue.Blocked:=not CheckStaj.Checked;
     StajDate.Blocked:=not CheckStaj.Checked;
     StajValueMin.Blocked:=not CheckStaj.Checked;
     StajValueMax.Blocked:=not CheckStaj.Checked;     

     if (CheckStaj.Checked) and (TypeStajValue.Value=NULL)
     then begin
               TypeStajValue.OnOpenSprav(ManValue, Res, S);
               TypeStajValue.Value      :=Res;
               TypeStajValue.DisplayText:=S;
     end;
end;

procedure TFilterMainForm.TypeStajValueOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
      Params:TUnivParams;
      OutPut : TRxMemoryData;
begin
      Params.FormCaption:='Довідник типів стажу';
      Params.ShowMode:=fsmSelect;
      Params.ShowButtons:=[fbExit];
      Params.TableName:='INI_STAJ';
      Params.Fields:='NAME_STAJ,ID_STAJ';
      Params.FieldsName:='Назва';
      Params.KeyField:='ID_SEX';
      Params.ReturnFields:='NAME_STAJ,ID_STAJ';
      Params.DBHandle:=Integer(WorkDatabase.Handle);

      OutPut:=TRxMemoryData.Create(self);

      if GetUnivSprav(Params,OutPut)
      then begin
                 value:=output['ID_STAJ'];
                 DisplayText:=VarToStr(output['NAME_STAJ']);
      end;
end;

procedure TFilterMainForm.WorkReasonValueOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
      Params:TUnivParams;
      OutPut : TRxMemoryData;
begin
      Params.FormCaption:='Довідник підстав для роботи';
      Params.ShowMode:=fsmSelect;
      Params.ShowButtons:=[fbExit];
      //Params.TableName:='UP_WORK_REASON_ACC_SELECT';
      Params.TableName:='ASUP_INI_WORK_REASON';
      Params.Fields:='NAME_FULL,ID_WORK_REASON';
      Params.FieldsName:='Назва';
      Params.KeyField:='ID_WORK_REASON';
      Params.ReturnFields:='NAME_FULL,ID_WORK_REASON';
      Params.DBHandle:=Integer(WorkDatabase.Handle);

      OutPut:=TRxMemoryData.Create(self);

      if GetUnivSprav(Params,OutPut)
      then begin
                 value:=output['ID_WORK_REASON'];
                 DisplayText:=VarToStr(output['NAME_FULL']);
      end;
end;

procedure TFilterMainForm.CheckWorkReasonPropertiesChange(Sender: TObject);
var Res:Variant;
    S:String;
begin
     WorkReasonValue.Blocked:=not CheckWorkReason.Checked;
     if (CheckWorkReason.Checked) and (WorkReasonValue.Value=NULL)
     then begin
               WorkReasonValue.OnOpenSprav(PCardValue, Res, S);
               WorkReasonValue.Value      :=Res;
               WorkReasonValue.DisplayText:=S;
     end;
end;

procedure TFilterMainForm.CheckDateEndAfterPropertiesChange(
  Sender: TObject);
begin
     DateEndAfter.Blocked:=not CheckDateEndAfter.Checked;
end;

procedure TFilterMainForm.cxCheckBox4PropertiesChange(Sender: TObject);
begin
     Label7.Enabled:=CheckRates.Enabled;
     Label8.Enabled:=CheckRates.Enabled;
     Label9.Enabled:=CheckRates.Enabled;

     RateMinValue.Blocked:=not CheckRates.Enabled;
     RateMaxValue.Blocked:=not CheckRates.Enabled;     
end;

procedure TFilterMainForm.CheckBudgetRatePropertiesChange(Sender: TObject);
var S:String;
    Res:Variant;
begin
     BudgetRate.Blocked:=not CheckBudgetRate.Checked;
     if CheckBudgetRate.Checked and BudgetRate.Value=null
     then begin
                BudgetRate.OnOpenSprav(BudgetRate, Res, S);
                BudgetRate.Value      :=Res;
                BudgetRate.DisplayText:=S;
     end;
end;

procedure TFilterMainForm.BudgetRateOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var Res:Variant;
begin
    Res:=GlobalSPR.GetSmets(self,
                       WorkDatabase.Handle,
                       Date,
                       psmSmetWithoutPeriod);
    if (VarArrayDimCount(Res)>0)
    then begin
              Value:=Res[0];
              DisplayText:=VarToStr(Res[3])+ ' "'+VarToStr(Res[2])+'"';
    end;
end;

procedure TFilterMainForm.CheckPostRazrPropertiesChange(Sender: TObject);
begin
     PostRazr.Blocked:=not CheckPostRazr.Checked;
end;

procedure TFilterMainForm.CheckPostSumPropertiesChange(Sender: TObject);
begin
     MinPostSumValue.Blocked:= not CheckPostSum.Checked;
     MaxPostSumValue.Blocked:= not CheckPostSum.Checked;
     Label13.Enabled:=CheckPostSum.Checked;
     Label14.Enabled:=CheckPostSum.Checked;
     Label15.Enabled:=CheckPostSum.Checked;          
end;

procedure TFilterMainForm.WithoutDekretPropertiesChange(Sender: TObject);
begin
   DekretDateBeg.Enabled:=WithoutDekret.Checked;
   DekretDateEnd.Enabled:=WithoutDekret.Checked;
end;

procedure TFilterMainForm.ExistTypeRateValuePropertiesChange(
  Sender: TObject);
begin
   if ExistTypeRateValue.ItemIndex=0 then
   begin
      CheckSumBox.Enabled:=True;
      CheckProcBox.Enabled:=not CheckSumBox.Enabled;
   end
   else
   begin
      CheckProcBox.Enabled:=True;
      CheckSumBox.Enabled:=not CheckProcBox.Enabled;
   end;
end;

procedure TFilterMainForm.cxCheckBox1PropertiesChange(Sender: TObject);
begin
   ProcRateValue.Blocked:=not CheckProcBox.Checked;
end;

procedure TFilterMainForm.cxCheckBox2PropertiesChange(Sender: TObject);
begin
   SumRateValue.Blocked:=not CheckSumBox.Checked;
end;

end.
