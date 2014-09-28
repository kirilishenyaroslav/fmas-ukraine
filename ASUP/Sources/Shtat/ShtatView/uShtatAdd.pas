{test}
unit uShtatAdd;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, ExtCtrls, uFControl, uLabeledFControl,
    uSpravControl, uFormControl, uShtatData, uCharControl, uFloatControl,
    ComCtrls, ActnList, uBoolControl, uDateControl, uLogicCheck, uSimpleCheck,
    uMemoControl, uInvisControl, FIBDatabase, pFIBDatabase, TuCommonLoader,
    TuCommontypes, cxControls, cxContainer, cxEdit, cxTextEdit, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, DB, uWMFillGrid, cxLabel;

type
    TfmShtatAdd = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        FormControl: TqFFormControl;
        PageControl: TPageControl;
        MainPage: TTabSheet;
        AddPage: TTabSheet;
        Smeta: TqFSpravControl;
        Department: TqFSpravControl;
        PostSalary: TqFSpravControl;
        Base_Oklad: TqFFloatControl;
        Kol_Stavok: TqFFloatControl;
        OkladRange: TLabel;
        Label1: TLabel;
        Label2: TLabel;
        Label3: TLabel;
        ActionList1: TActionList;
        OpenSmeta: TAction;
        OpenDepartment: TAction;
        OpenSalary: TAction;
        Accept: TAction;
        DateBeg: TqFDateControl;
        DateEnd: TqFDateControl;
        Koeff_Pps: TqFFloatControl;
        Kod_Sm_Pps: TqFSpravControl;
        qFSimpleCheck1: TqFSimpleCheck;
        OkladCheck: TqFLogicCheck;
        Type_Post: TqFSpravControl;
        Label4: TLabel;
        OpenTypePost: TAction;
        Label5: TLabel;
        OpenSmetaPps: TAction;
        WorkMode: TqFSpravControl;
        WorkCond: TqFSpravControl;
        PayForm: TqFSpravControl;
        qFMemoControl1: TqFMemoControl;
        Spz: TqFSpravControl;
        Label6: TLabel;
        OpenSPz: TAction;
        UsePpsLabel: TLabel;
        Oklad_Pps: TqFFloatControl;
        OkladPpsRange: TLabel;
        Bevel1: TBevel;
        Bevel2: TBevel;
        Bevel3: TBevel;
        Bevel4: TBevel;
        Oklad: TqFFloatControl;
        CheckOkladPps: TqFLogicCheck;
        Panel2: TPanel;
        VacantStavok: TqFCharControl;
        BonusDates: TqFBoolControl;
    SmetEdit: TcxTextEdit;
    WorkModeGridDBTableView: TcxGridDBTableView;
    WorkModeGridLevel: TcxGridLevel;
    WorkModeGrid: TcxGrid;
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
    WorkModeGridDBTableViewDBColumn1: TcxGridDBColumn;
    WorkModeGridDBTableViewDBColumn2: TcxGridDBColumn;
    WorkModeGridDBTableViewDBColumn3: TcxGridDBColumn;
    WorkModeGridDBTableViewDBColumn4: TcxGridDBColumn;
    WorkModeGridDBTableViewDBColumn5: TcxGridDBColumn;
    WorkModeGridDBTableViewDBColumn6: TcxGridDBColumn;
    WorkModeGridDBTableViewDBColumn7: TcxGridDBColumn;
    WorkModeGridDBTableViewDBColumn8: TcxGridDBColumn;
    DepartEdit: TcxTextEdit;
        procedure CancelButtonClick(Sender: TObject);
        procedure SmetaOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure DepartmentOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure PostSalaryOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure PostSalaryChange(Sender: TObject);
        procedure OpenSmetaExecute(Sender: TObject);
        procedure OpenDepartmentExecute(Sender: TObject);
        procedure OpenSalaryExecute(Sender: TObject);
        procedure AcceptExecute(Sender: TObject);
        procedure OkladCheckCheck(Sender: TObject; var Error: string);
        procedure Type_PostOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure OpenTypePostExecute(Sender: TObject);
        procedure OpenSmetaPpsExecute(Sender: TObject);
        procedure WorkModeOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure WorkCondOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure PayFormOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure FormActivate(Sender: TObject);
        procedure FormControlNewRecordAfterPrepare(Sender: TObject);
        procedure OpenSPzExecute(Sender: TObject);
        procedure SpzOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure Koeff_PpsChange(Sender: TObject);
        procedure Base_OkladChange(Sender: TObject);
        procedure FormControlAfterPrepare(Sender: TObject; Form: TForm;
            Mode: TFormMode);
        procedure CheckOkladPpsCheck(Sender: TObject; var Error: string);
        procedure FormControlAfterRecordAdded(Sender: TObject);
        procedure DateBegChange(Sender: TObject);
        procedure FormControlDatabaseEventBefore(Sender: TObject; Form: TForm;
            Mode: TFormMode; Transaction: TFIBTransaction);
    procedure SmetEditKeyPress(Sender: TObject; var Key: Char);
    procedure SmetEditPropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure WorkModeChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DateEndChange(Sender: TObject);
    procedure DepartEditKeyPress(Sender: TObject; var Key: Char);
    procedure DepartEditPropertiesChange(Sender: TObject);
    private
        Salary_Min, Salary_Max: Double;
        Pps_Salary_Min, Pps_Salary_Max: Double;

        procedure GetSalaryRange;
    public
        DM: TdmShtatView;
        Id_Department: Variant;
        Id_Smeta: Variant;
    end;

function ValueInBounds(X: Double; XMin, XMax: Double; eps: Double = 1E-3): Boolean;

var
    fmShtatAdd: TfmShtatAdd;

implementation

uses uCommonSp, uShtatConsts, qFTools, Math, UpKernelUnit, FIBDataSet,
  pFIBDataSet;

{$R *.dfm}

function ValueInBounds(X: Double; XMin, XMax: Double; eps: Double = 1E-3): Boolean;
begin
    Result := (X > XMin - eps) and (X < XMax + eps);
end;



procedure TfmShtatAdd.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TfmShtatAdd.SmetaOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
begin
    DM.GetSmeta(Value, DisplayText);
end;

procedure TfmShtatAdd.DepartmentOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
begin
    DM.GetDepartment(Value, DisplayText);
end;

procedure TfmShtatAdd.PostSalaryOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
begin
    DM.DMUtils.Actual_Date := DateBeg.Value;
    DM.DMUtils.GetSalary(Value, DisplayText);

    Base_Oklad.Value := 0;
    Oklad_Pps.Value := 0;
end;

procedure TfmShtatAdd.GetSalaryRange;
var
    Base_Salary_Min, Base_Salary_Max: Double;
begin
    if VarIsNull(PostSalary.Value) then Exit;

    DM.DMUtils.Actual_Date := DateBeg.Value;
    DM.DMUtils.GetSalaryRange(PostSalary.Value, Salary_Min, Salary_Max,
        Base_Salary_Min, Base_Salary_Max);
    if DM.PostSalaryIsTarif(PostSalary.Value, DateBeg.value)=False then
    begin
      Salary_Min := SimpleRoundTo(Salary_Min, 0);
      Salary_Max := SimpleRoundTo(Salary_Max, 0);
    end;
    
    if VarIsNull(Base_Oklad.Value) or (Base_Oklad.Value = 0)
        then Base_Oklad.Value := Salary_Max;

    if Salary_Min <> Salary_Max then
    begin
        OkladRange.Caption := '(від ' + FormatFloat('##########0.00', Salary_Min)
            + ' до ' + FormatFloat('###########0.00', Salary_Max) + ')';
        Base_Oklad.Blocked := False;
    end
    else
    begin
        Base_Oklad.Blocked := True;
        OkladRange.Caption := '(фіксовано: ' +
            FormatFloat('########0.00', Salary_Max) + ')';
    end;

    if not (VarIsNull(Koeff_Pps.Value) or VarIsEmpty(Koeff_Pps.Value)
        or (Koeff_Pps.Value = 0)) then
    begin
        Pps_Salary_Min := SimpleRoundTo(Base_Salary_Min * Koeff_Pps.Value, 0);
        Pps_Salary_Max := SimpleRoundTo(Base_Salary_Max * Koeff_Pps.Value, 0);

        if VarIsNull(Oklad_Pps.Value) or (Oklad_Pps.Value = 0) then
            Oklad_Pps.Value := Pps_Salary_Max;

        if Pps_Salary_Min <> Pps_Salary_Max then
        begin
            OkladPpsRange.Caption := '(від ' + FormatFloat('##########0.00',
                Pps_Salary_Min) + ' до ' + FormatFloat('###########0.00',
                Pps_Salary_Max) + ')';
            Oklad_Pps.Blocked := False;
        end
        else
        begin
            Oklad_Pps.Blocked := True;
            OkladPpsRange.Caption := '(фіксовано: ' +
                FormatFloat('########0.00', Pps_Salary_Max) + ')';
        end;
    end
    else
    begin
        Pps_Salary_Min := 0;
        Pps_Salary_Max := 0;
    end;
end;

procedure TfmShtatAdd.PostSalaryChange(Sender: TObject);
begin

    if VarIsNull(PostSalary.Value) then Exit;
    // получить вилку оклада
    GetSalaryRange;

    // получить тип персонала по умолчанию
    try
        DM.SelectTypePost.Close;
        DM.SelectTypePost.ParamByName('Id_Post').Value :=
            DM.DMUtils.GetSalaryIdPost(PostSalary.Value);

        DM.SelectTypePost.Open;
        DM.SelectTypePost.FetchAll;
        //  if not DM.SelectTypePost.Active then ShowMessage('DM.SelectTypePost is not active!');
    except
    end;
    if not VarIsNull(DM.SelectTypePost['Id_Type_Post']) then
    begin
        if DM.SelectTypePost.RecordCount = 1 then
        begin
            Type_Post.Value := DM.SelectTypePost['Id_Type_Post'];
            Type_Post.DisplayText := DM.SelectTypePost['Name_Type_Post'];
        end
        else Type_Post.Clear;

    end;
end;

procedure TfmShtatAdd.OpenSmetaExecute(Sender: TObject);
begin
    Smeta.OpenSprav;
end;

procedure TfmShtatAdd.OpenDepartmentExecute(Sender: TObject);
begin
    Department.OpenSprav;
end;

procedure TfmShtatAdd.OpenSalaryExecute(Sender: TObject);
begin
    PostSalary.OpenSprav;
end;

procedure TfmShtatAdd.AcceptExecute(Sender: TObject);
begin
    FormControl.Ok;
end;

procedure TfmShtatAdd.OkladCheckCheck(Sender: TObject;
    var Error: string);
begin
    if VarIsNull(Base_Oklad.Value) then Exit;

    if not ValueInBounds(Base_Oklad.Value, Salary_Min, Salary_Max) then
        if Base_Oklad.Blocked then
        begin
            if qFConfirm('Невірне значення окладу! Встановити вірне значення?')
                then Base_Oklad.Value := Salary_Max
            else Error := 'Значення окладу повинно бути у встановлених межах!'
        end
        else
            Error := 'Значення окладу повинно бути у встановлених межах!'
    else Error := ''
end;

procedure TfmShtatAdd.Type_PostOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
begin
    DM.GetTypePost(Value, DisplayText);
end;

procedure TfmShtatAdd.OpenTypePostExecute(Sender: TObject);
begin
    Type_Post.OpenSprav;
end;

procedure TfmShtatAdd.OpenSmetaPpsExecute(Sender: TObject);
begin
    Kod_Sm_Pps.OpenSprav;
end;

procedure TfmShtatAdd.WorkModeOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
   res:Variant;
   Parameter:TTuSimpleParam;
begin
   Parameter := TTuSimpleParam.Create;
   Parameter.DB_Handle := Dm.DB.Handle;
   Parameter.Owner := self;
   Parameter.CFStyle:=tfsModal;
   res:=DoFunctionFromPackage(Parameter,Tu_SpWorkMode_Pack);
   if VarIsArray(res)then
   begin
      Value:=res[0];
      DisplayText:=res[1];
   end;
   PageControl.ActivePageIndex:=1;
   FillWorkModeDSet(DM.WMByPeriodSet, DateBeg.Value, DateEnd.Value, WorkMode.Value, null, null, 0, 7);
   FillWorkModeGrid(WorkModeGridDBTableView, DM.WMByPeriodSet);
   Parameter.Destroy;
end;

procedure TfmShtatAdd.WorkCondOpenSprav(Sender: TObject; var Value: Variant;
    var DisplayText: string);
begin
    DM.DMUtils.GetWorkCond(Value, DisplayText);
end;

procedure TfmShtatAdd.PayFormOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
begin
    DM.DMUtils.GetPayForm(Value, DisplayText);
end;

procedure TfmShtatAdd.FormActivate(Sender: TObject);
begin
    PageControl.ActivePage := MainPage;
    if VarIsNull(Smeta.Value) then Smeta.ShowFocus
    else
        if VarIsNull(Department.Value) then Department.ShowFocus
        else PostSalary.ShowFocus;
end;

procedure TfmShtatAdd.FormControlNewRecordAfterPrepare(Sender: TObject);
begin
    // установить по умолчанию необязательные параметры
    WorkMode.Value := DM.DMUtils.DefaultWorkMode;
    WorkMode.DisplayText := DM.DMUtils.DefaultWorkModeName;

    WorkCond.Value := DM.DMUtils.DefaultWorkCond;
    WorkCond.DisplayText := DM.DMUtils.DefaultWorkCondName;

    PayForm.Value := DM.DMUtils.DefaultPayForm;
    PayForm.DisplayText := DM.DMUtils.DefaultPayFormName;
    DateBeg.Value := DM.SR_Date_Beg;
    //    DateEnd.Value := DM.SR_Date_End;
    // DateEnd.Value := EncodeDate(2150, 12, 31);
    DateEnd.Value := DM.GetInfinityDate;
    
    if not (VarIsNull(Id_Smeta) or VarIsEmpty(Id_Smeta)) then
    begin
        DM.SmetaSelect.Locate('Id_Smeta', Id_Smeta, []);
        Smeta.Value := Id_Smeta;
        Smeta.DisplayText := IntToStr(DM.SmetaSelect['Smeta_Kod']) + '. ' +
            DM.SmetaSelect['Smeta_Title'];
    end;

    if not (VarIsNull(Id_Department) or VarIsEmpty(Id_Department)) then
        if DM.DepartmentsSelect.Locate('Id_Department', Id_Department, []) then
        begin
            Department.Value := Id_Department;
            Department.DisplayText := DM.DepartmentsSelect['Name_Full'];
        end;
end;

procedure TfmShtatAdd.OpenSPzExecute(Sender: TObject);
begin
    Spz.OpenSprav;
end;

procedure TfmShtatAdd.SpzOpenSprav(Sender: TObject; var Value: Variant;
    var DisplayText: string);
begin
    DM.DMUtils.GetSpz(Value, DisplayText);
end;

procedure TfmShtatAdd.Koeff_PpsChange(Sender: TObject);
begin
    GetSalaryRange;

    if VarIsNull(Koeff_Pps.Value) or VarIsEmpty(Koeff_Pps.Value) or
        (Koeff_Pps.Value = 0) then
    begin
        Kod_Sm_Pps.Blocked := True;
        Oklad_Pps.Value := 0;
        Oklad_Pps.Blocked := True;
        Kod_Sm_Pps.Required := False;
        Kod_Sm_Pps.Value := Null;
        Kod_Sm_Pps.DisplayText := '';
        OkladPpsRange.Caption := '';
    end
    else
    begin
        Kod_Sm_Pps.Blocked := False;
        if Pps_Salary_Min <> Pps_Salary_Max then
            Oklad_Pps.Blocked := False;
        Kod_Sm_Pps.Required := True;
    end;
end;



procedure TfmShtatAdd.Base_OkladChange(Sender: TObject);
begin
    // считаем итоговый оклад
    Oklad.Value := 0;

    if not VarIsNull(Base_Oklad.Value) and not VarIsEmpty(Base_Oklad.Value) then
        Oklad.Value := Base_Oklad.Value;

    if not VarIsNull(Oklad_Pps.Value) and not VarIsEmpty(Oklad_Pps.Value) then
        Oklad.Value := Oklad.Value + Oklad_Pps.Value;
    if DM.PostSalaryIsTarif(PostSalary.Value, DateBeg.Value)=False then
       Oklad.Value := Round(Oklad.Value);
end;

procedure TfmShtatAdd.FormControlAfterPrepare(Sender: TObject; Form: TForm;
    Mode: TFormMode);
begin
    if VarIsNull(Koeff_Pps.Value) or VarIsEmpty(Koeff_Pps.Value) or
        (Koeff_Pps.Value = 0) then
    begin
        Kod_Sm_Pps.Blocked := True;
        Oklad_PPs.Blocked := True;
    end
    else
    begin
        Kod_Sm_Pps.Blocked := False;
        Oklad_PPs.Blocked := False;
    end;

    if Mode <> fmAdd then
        if VacantStavok.Value = '-' then
            VacantStavok.Visible := False;

    if (Mode = fmAdd) or (Mode = fmInfo) then
        BonusDates.Visible := False;
end;

procedure TfmShtatAdd.CheckOkladPpsCheck(Sender: TObject;
    var Error: string);
begin
    if VarIsNull(Koeff_Pps.Value) or VarIsEmpty(Koeff_Pps.Value)
        or (Koeff_Pps.Value = 0) then
        Error := ''
    else
        if not ValueInBounds(Oklad_Pps.Value, Pps_Salary_Min, Pps_Salary_Max) then
            if Oklad_Pps.Blocked then
            begin
                if qFConfirm('Невірне значення підвищення окладу! Встановити вірне значення?')
                    then Oklad_Pps.Value := Pps_Salary_Max
                else Error := 'Значення підвищення окладу повинно бути у встановлених межах!'
            end
            else
                Error := 'Значення підвищення окладу повинно бути у встановлених межах!'
        else Error := ''
end;

procedure TfmShtatAdd.FormControlAfterRecordAdded(Sender: TObject);
begin
    DM.LastActionIsAdd := True;
    DM.Last_ShtatRas_Smet := FormControl.LastId;
    DM.Last_Smeta := Smeta.Value;
    DM.Last_TypePost := Type_Post.Value;
end;

procedure TfmShtatAdd.DateBegChange(Sender: TObject);
begin
   GetSalaryRange;
   FillWorkModeDSet(DM.WMByPeriodSet, DateBeg.Value, DateEnd.Value, WorkMode.Value, null, null, 0, 7);
   FillWorkModeGrid(WorkModeGridDBTableView, DM.WMByPeriodSet);
end;

procedure TfmShtatAdd.FormControlDatabaseEventBefore(Sender: TObject;
    Form: TForm; Mode: TFormMode; Transaction: TFIBTransaction);
begin
    UpKernelUnit.StartHistory(TpFIBTransaction(Transaction));
end;

procedure TfmShtatAdd.SmetEditKeyPress(Sender: TObject; var Key: Char);
begin
   if (key in ['0'..'9']) or (key=#8) then SmetEdit.Properties.ReadOnly:=False
   else SmetEdit.Properties.ReadOnly:=True;
end;

procedure TfmShtatAdd.SmetEditPropertiesChange(Sender: TObject);
var SmKod:Integer;
begin
   if SmetEdit.Text='' then
   begin
      Smeta.Value:=Null;
      Smeta.DisplayText:='Бюджет на знайдено!';
      Exit;
   end;
   SmKod:=StrToInt(SmetEdit.Text);
   with DM.SmetEditDataSet do
   begin
      Close;
      SQLs.SelectSQL.Clear;
      SQLs.SelectSQL.Text:='select first(1) id_smeta, smeta_kod, smeta_title '+
                           'from pub_spr_smeta '+
                           'where smeta_kod=:smeta_kod';
      ParamByName('smeta_kod').AsInteger:=SmKod;
      Open;
      FetchAll;
   end;
   if DM.SmetEditDataSet.IsEmpty then
   begin
      Smeta.Value:=Null;
      Smeta.DisplayText:='Бюджет на знайдено!';
   end
   else
   begin
      Smeta.Value:=DM.SmetEditDataSet['id_smeta'];
      Smeta.DisplayText:=IntToStr(DM.SmetEditDataSet['smeta_kod'])+'. '+DM.SmetEditDataSet['smeta_title'];
   end;
end;

procedure TfmShtatAdd.FormShow(Sender: TObject);
begin
   SmetEdit.Enabled:=not Smeta.Blocked;
   DepartEdit.Enabled:= not Department.Blocked;
end;

procedure TfmShtatAdd.WorkModeChange(Sender: TObject);
begin
   FillWorkModeDSet(DM.WMByPeriodSet, DateBeg.Value, DateEnd.Value, WorkMode.Value, null, null, 0, 7);
   FillWorkModeGrid(WorkModeGridDBTableView, DM.WMByPeriodSet);
end;

procedure TfmShtatAdd.FormCreate(Sender: TObject);
var i:Integer;
begin
   for i:=0 to WorkModeGridDBTableView.ColumnCount-1 do
       WorkModeGridDBTableView.Columns[i].DataBinding.ValueTypeClass:=TcxStringValueType;
end;

procedure TfmShtatAdd.DateEndChange(Sender: TObject);
begin
   FillWorkModeDSet(DM.WMByPeriodSet, DateBeg.Value, DateEnd.Value, WorkMode.Value, null, null, 0, 7);
   FillWorkModeGrid(WorkModeGridDBTableView, DM.WMByPeriodSet);
end;

procedure TfmShtatAdd.DepartEditKeyPress(Sender: TObject; var Key: Char);
begin
   if (key in ['0'..'9']) or (key=#8) then DepartEdit.Properties.ReadOnly:=False
   else DepartEdit.Properties.ReadOnly:=True;
end;

procedure TfmShtatAdd.DepartEditPropertiesChange(Sender: TObject);
begin
   if DepartEdit.Text='' then
   begin
      Department.Value:=Null;
      Department.DisplayText:='Підрозділ на знайдено!';
      Exit;
   end;
   with DM.DepartEditDSet do
   begin
      Close;
      SQLs.SelectSQL.Text:='select first(1) id_department, name_full '+
                           'from sp_department '+
                           'where department_code=:department_code '+
                           'and :act_beg between use_beg and use_end';
      ParamByName('department_code').AsString:=DepartEdit.Text;
      ParamByName('act_beg').AsDate:=DateBeg.Value;
      Open;
      FetchAll;
   end;
   if DM.DepartEditDSet.IsEmpty then
   begin
      Department.Value:=Null;
      Department.DisplayText:='Підрозділ на знайдено!';
   end
   else
   begin
      Department.Value:=DM.DepartEditDSet['id_department'];
      Department.DisplayText:=DM.DepartEditDSet['name_full'];
   end;
end;

initialization
    RegisterClass(TfmShtatAdd);

end.

