unit uSelectParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst, uFControl, uLabeledFControl, uSpravControl,
  ActnList, Buttons, DB, FIBDataSet, pFIBDataSet, uCommonSp, uMemoControl,
  uInvisControl, uCharControl, qFTools;

type
  TfmSelectParams = class(TForm)
    Department: TqFSpravControl;
    CheckPlan: TCheckListBox;
    Label1: TLabel;
    OkButton: TBitBtn;
    BitBtn1: TBitBtn;
    KeyList: TActionList;
    OkAction: TAction;
    CancelAction: TAction;
    SelectTypePost: TpFIBDataSet;
    SelectTypePostID_TYPE_POST: TFIBIntegerField;
    SelectTypePostNAME_TYPE_POST: TFIBStringField;
    SelectTypePostSHORT_NAME: TFIBStringField;
    IntroText: TqFMemoControl;
    PostTypeStr: TqFCharControl;
    DetQuery: TpFIBDataSet;
    DetQueryPOST_TYPE_STR: TFIBStringField;
    DetQueryID_DEPARTMENT: TFIBIntegerField;
    DetQueryINTRO: TFIBStringField;
    DetQueryDEPARTMETN_NAME: TFIBStringField;
    procedure OkActionExecute(Sender: TObject);
    procedure CancelActionExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DepartmentOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure CheckPlanClick(Sender: TObject);
  private
    { Private declarations }
  public
    ar: array [0..100] of integer;
    ResultPostStr : String;
  end;

var
  fmSelectParams: TfmSelectParams;

implementation

uses uPlanHolidayOrder;
{$R *.dfm}

procedure TfmSelectParams.OkActionExecute(Sender: TObject);
var
    i, k : Integer;
    Proverka: Boolean;
    len:Integer;
begin
    if VarIsNull(Department.Value) then begin
        MessageDlg('Потрібно вибрати Підрозділ!',mtError,[mbYes],0);
        exit;
    end;

    Proverka :=False;
    ResultPostStr :='';

    for k := 0 to CheckPlan.Items.Count - 1 do
    begin
        if CheckPlan.Checked[k] then begin
            Proverka :=True;
            break;
        end;
    end;

    if (proverka=True) then begin
        for i := 0 to CheckPlan.Items.Count - 1 do
            if CheckPlan.Checked[i] then
                ResultPostStr := ResultPostStr + IntToStr(ar[i]) + ',';

        ResultPostStr := Copy(ResultPostStr, 1, Length(ResultPostStr) - 1);
    end
    else begin
       MessageDlg('Потрібно вибрати тип персоналу!',mtError,[mbYes],0);
       exit;
    end;

    PostTypeStr.Value := ResultPostStr;
    qFtools.qFAutoSaveIntoRegistry(Self, nil);
    ModalResult := mrOk;
end;

procedure TfmSelectParams.CancelActionExecute(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure TfmSelectParams.FormCreate(Sender: TObject);
  var
    i : Integer;
    s : String;
begin
    try
        if uPlanHolidayOrder.fmPlanHolidayOrder.SelectQuery.IsEmpty then begin
            qFtools.qFAutoLoadFromRegistry(Self, nil);
            S := PostTypeStr.Value;
        end
        else begin
            DetQuery.Close;
            DetQuery.ParamByName('ID_ORDER').AsInteger := uPlanHolidayOrder.fmPlanHolidayOrder.IdOrder;
            DetQuery.Open;

            if not DetQuery.IsEmpty then begin
                Department.Value := DetQueryID_DEPARTMENT.Value;
                Department.DisplayText := DetQueryDEPARTMETN_NAME.Value;
                IntroText.Value := DetQueryINTRO.Value;
                S := DetQueryPOST_TYPE_STR.Value;
            end;
        end;
    except
    end;        

    SelectTypePost.Open;
    SelectTypePost.First;
    i := 0;

    while not SelectTypePost.Eof do begin
        CheckPlan.Items.add(SelectTypePostNAME_TYPE_POST.Value);
        // запись в массив
        ar[i] := SelectTypePostID_TYPE_POST.Value;

        // если в предыдущий раз был выбран этот пункт, то устанавливаем флажок
        if (pos(IntToStr(SelectTypePostID_TYPE_POST.Value) + ',', s) <> 0) or
           (pos(',' + IntToStr(SelectTypePostID_TYPE_POST.Value), s) <> 0) or
           (IntToStr(SelectTypePostID_TYPE_POST.Value) = s) then
            CheckPlan.Checked[i] := True;

        SelectTypePost.Next;
        i := i + 1;
    end;
end;

procedure TfmSelectParams.DepartmentOpenSprav(Sender: TObject;
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
            FieldValues['DBHandle'] := Integer(fmPlanHolidayOrder.LocalDatabase.Handle);
            FieldValues['Actual_Date'] := Date;
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

procedure TfmSelectParams.CheckPlanClick(Sender: TObject);
var
    pPostType : String;
    y, m, d : Word;
    i : Integer;
begin
    for i := 0 to CheckPlan.Items.Count - 1 do
        if CheckPlan.Checked[i] then
            pPostType := pPostType + CheckPlan.Items[i] + ', ';

    pPostType := Copy(pPostType, 1, Length(pPostType) - 2);

    DecodeDate(uPlanHolidayOrder.fmPlanHolidayOrder.DateOrder, y, m, d);

    IntroText.Value := '   Згідно графіку відпусток для типів персоналу: ' + pPostType +
    ' за ' + IntToStr(y) + ' рік, затвердженому ректором і узгодженому з профкомом ДонНУ,' +
    ' надати щорічну відпустку нижепереліченим працівникам у наступний термін:';
end;

end.
