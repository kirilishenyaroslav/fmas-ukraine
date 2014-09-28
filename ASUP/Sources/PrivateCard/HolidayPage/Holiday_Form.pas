unit Holiday_Form;

interface             

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDateControl, uCharControl, uIntControl, uFControl,
  uLabeledFControl, uSpravControl, StdCtrls, Buttons,
  ExtCtrls, DB, FIBDataSet, pFIBDataSet, HolidayDM, uCommonSp,
  uSelectForm, qFTools, uFormControl,

  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, uInvisControl, RxMemDS, uShtatUtils,
  cxContainer, cxCheckListBox, cxDBCheckListBox, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCheckComboBox, cxDBCheckComboBox, FIBQuery, pFIBQuery,
  CheckLst, ActnList;


type
  THolidayAuto = class(TForm)
    PostSalary: TqFSpravControl;
    Period_Beg: TqFDateControl;
    Period_end: TqFDateControl;
    Holiday: TqFSpravControl;
    SpeedButton2: TSpeedButton;
    DateBeg: TqFDateControl;
    DateEnd: TqFDateControl;
    HTerm: TqFIntControl;
    OkButton: TBitBtn;
    Department: TqFSpravControl;
    SpeedButton3: TSpeedButton;
    Dont_Calc_Holidays: TqFInvisControl;
    GroupBox1: TGroupBox;
    Type_Post_b: TRadioButton;
    Post_Salary_b: TRadioButton;
    SelectTypePost: TpFIBDataSet;
    SelectTypePostID_TYPE_POST: TFIBIntegerField;
    SelectTypePostNAME_TYPE_POST: TFIBStringField;
    SelectTypePostSHORT_NAME: TFIBStringField;
    FormControl: TqFFormControl;
    CheckPlan: TCheckListBox;
    BitBtn1: TBitBtn;
    Post: TqFInvisControl;
    new_id_plan_auto: TqFInvisControl;
    HTermN: TqFIntControl;
    procedure DepartmentOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure HolidayOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Type_PostOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure PostSalaryOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure Post_Salary_bClick(Sender: TObject);
    procedure Type_Post_bClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    constructor Create(aOwner : TComponent; Mode: TFormMode; Where: Variant; aid_pcard:Variant);reintroduce;
  private
    { Private declarations }
  public
     Mode:TFormMode;
     ar: array [1..1000] of integer;
  end;

var
  HolidayAuto: THolidayAuto;

implementation

{$R *.dfm}

constructor THolidayAuto.Create(aOwner : TComponent; Mode: TFormMode; Where: Variant; aid_pcard:Variant);
begin
  inherited Create(aOwner);
  Self.Mode := Mode;
  FormControl.Prepare(DM.DB,Mode,Where,null);
end;


procedure THolidayAuto.DepartmentOpenSprav(Sender: TObject; var Value: Variant;
  var DisplayText: String);
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
            FieldValues['DBHandle'] := Integer(DM.DB.Handle);
            FieldValues['Actual_Date'] := Period_Beg.Value;
            Post;
        end;

                // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        if ( sp.Output <> nil ) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['Id_Department'];
            DisplayText := sp.Output['Name_Full'];
        end;
        sp.Free;
    end;
end;

procedure THolidayAuto.FormActivate(Sender: TObject);
begin
  //OkButton.SetFocus;
end;

procedure THolidayAuto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure THolidayAuto.HolidayOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
begin
    Dm.SpHolidaySelect.Close;
    Dm.SpHolidaySelect.Open;

    if qSelect(Dm.SpHolidaySelect, 'Довідник типів відпусток') then
    begin
        Value := Dm.SpHolidaySelectID_HOLIDAY.Value;
        DisplayText := Dm.SpHolidaySelectNAME_HOLIDAY.Value;
        Dont_Calc_Holidays.Value := Dm.SpHolidaySelectDONT_CALC_HOLIDAYS.Value;
    end;
end;

procedure THolidayAuto.SpeedButton2Click(Sender: TObject);
var
  int : Integer;
begin    if (VarIsNull(Holiday.Value)) or (Holiday.DisplayText = '') then begin
        qFErrorDialog('Потрібно вибрати тип відпустки!');
        exit;
    end;

    int := Trunc(DateEnd.Value - DateBeg.Value) + 1;

    HTerm.Value := int;

    if DONT_CALC_HOLIDAYS.Value = 'F' then
        exit;

    Dm.CheckQuery.Close;
    Dm.CheckQuery.ParamByName('DATE1').AsDate := DateBeg.Value;
    Dm.CheckQuery.ParamByName('DATE2').AsDate := DateEnd.Value;
    Dm.CheckQuery.Open;

    HTerm.Value := int - Dm.CheckQueryHCOUNT.value;
end;

procedure THolidayAuto.SpeedButton3Click(Sender: TObject);
var
    Date1 : TDate;
begin
    if (VarIsNull(Holiday.Value)) or (Holiday.DisplayText = '') then begin
        qFErrorDialog('Потрібно вибрати тип відпустки!');
        exit;
    end;

    if (VarIsNull(HTerm.Value)) then begin
        qFErrorDialog('Потрібно вести кілкість днів відпустки!');
        exit;
    end;

    DateEnd.Value := DateBeg.Value + HTerm.Value - 1;

    if DONT_CALC_HOLIDAYS.Value = 'F' then
        exit;

    Dm.CheckQuery.Close;
    Dm.CheckQuery.ParamByName('DATE1').AsDate := DateBeg.Value;
    Dm.CheckQuery.ParamByName('DATE2').AsDate := DateEnd.Value;
    Dm.CheckQuery.Open;

    while DM.CheckQueryHCOUNT.Value > 0
    do begin
        Date1 := DateEnd.Value + 1;
        DateEnd.Value := DateEnd.Value + Dm.CheckQueryHCOUNT.Value;

        Dm.CheckQuery.Close;
        Dm.CheckQuery.ParamByName('DATE1').AsDate := Date1;
        Dm.CheckQuery.ParamByName('DATE2').AsDate := DateEnd.Value;
        Dm.CheckQuery.Open;
    end;
end;

procedure THolidayAuto.Type_PostOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
begin
    SelectTypePost.Close;
    SelectTypePost.Open;
    if qSelect(SelectTypePost,'Довідник типу персонала') then
    begin
        Value := SelectTypePost['Id_Type_Post'];
        DisplayText := SelectTypePost['Name_Type_Post'];
    end;
end;

procedure THolidayAuto.PostSalaryOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);

begin
    dmShtatUtils.GetSalary(Value, DisplayText);
end;

procedure THolidayAuto.Post_Salary_bClick(Sender: TObject);
begin
    PostSalary.Blocked:=False;
    PostSalary.Required:=True;
    CheckPlan.Enabled:=False;
    Post.Blocked:=True;
    Post.Required:=False;

end;

procedure THolidayAuto.Type_Post_bClick(Sender: TObject);
begin
    CheckPlan.Enabled:=True;
    PostSalary.Blocked:=True;
    PostSalary.Required:=False;
    Post.Blocked:=False;
    Post.Required:=True;
    PostSalary.DisplayText:='';
end;

procedure THolidayAuto.FormCreate(Sender: TObject);
  var
    i:Integer;
begin
    dmShtatUtils := TdmShtatUtils.Create(Self, Integer(Dm.DB.Handle), Date);
    SelectTypePost.Open;
    SelectTypePost.First;
    i := 0;

    while not SelectTypePost.Eof do begin
        CheckPlan.Items.add(SelectTypePostNAME_TYPE_POST.Value);
        // запись в массив
        ar[i] := SelectTypePostID_TYPE_POST.Value;
        SelectTypePost.Next;
        i := i + 1;
    end;
    ShowModal;
end;

procedure THolidayAuto.OkButtonClick(Sender: TObject);
var
    i, k : Integer;
    Proverka: Boolean;
    str:String;
    len:Integer;
begin
if CheckPlan.Enabled = True then begin
    Proverka :=False;
    Post.Value :='';
 for k := 0 to CheckPlan.Items.Count - 1 do
 begin
     if CheckPlan.Checked[k] then begin
       Proverka :=True;
       break;
     end;
 end;
   if (proverka=True) then
    begin
        for i := 0 to CheckPlan.Items.Count - 1 do
         begin
            if CheckPlan.Checked[i] then
                Post.Value := Post.Value + IntToStr(ar[i]) + ',';
         end;
       len:= Length(post.value);
       Str:= Copy(Post.Value,0,(len-1));
       post.Value := QuotedStr(Str);
       FormControl.InsertSQL.Text:='select * from ASUP_DT_MAN_HOLIDAY_AUTO_I ( :period_beg,:period_end,:id_department,:id_holiday,:id_type_post,'+'null,'+':date_beg,:date_end,:h_term,:new_id_plan_auto,:htermn);';
       FormControl.Ok;
    end
     else
       MessageDlg('Не повнi даннi, перевірте правильність введення!',mtError,[mbYes],0);
  end
    else
    if (CheckPlan.Enabled = False) then
     begin
      FormControl.InsertSQL.Text:='select * from ASUP_DT_MAN_HOLIDAY_AUTO_I (:period_beg,:period_end,:id_department,:id_holiday,'+'null,'+':id_post_salary,:date_beg,:date_end,:h_term,:new_id_plan_auto,:htermn);';
      FormControl.Ok;
     end
end;


end.
