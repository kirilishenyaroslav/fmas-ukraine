unit fmAddSmetaUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDateControl, uLogicCheck, uCharControl, uFloatControl,
  uFControl, uLabeledFControl, uSpravControl, ActnList, StdCtrls, Buttons, GlobalSPR,
  uFormControl, qFTools, ExtCtrls, uSimpleCheck, uSelectForm, DB,
  FIBDataSet, pFIBDataSet;

type
  TfmAddSmeta = class(TForm)
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    KeyList: TActionList;
    OkAction: TAction;
    CancelAction: TAction;
    FormControl: TqFFormControl;
    Panel1: TPanel;
    OkladCheck: TqFLogicCheck;
    CheckOkladPps: TqFLogicCheck;
    Smeta: TqFSpravControl;
    Kol_Stavok: TqFFloatControl;
    Koeff_Pps: TqFFloatControl;
    Kod_Sm_Pps: TqFSpravControl;
    Base_Oklad: TqFFloatControl;
    Oklad_Pps: TqFFloatControl;
    Oklad: TqFFloatControl;
    DateBeg: TqFDateControl;
    DateEnd: TqFDateControl;
    UsePpsLabel: TLabel;
    OkladRange: TLabel;
    OkladPpsRange: TLabel;
    qFSimpleCheck1: TqFSimpleCheck;
    ForeverLabel: TLabel;
    ShtatSelectButton: TButton;
    KolVacantStavok: TqFFloatControl;
    KolStavokCheck: TqFLogicCheck;
    SmNumberEdit: TEdit;
    PubSprSmet: TpFIBDataSet;
    PubSprSmetID_SMETA: TFIBBCDField;
    PubSprSmetSMETA_TITLE: TFIBStringField;
    PubSprSmetSMETA_KOD: TFIBIntegerField;
    SmPPsNumberEdit: TEdit;
    procedure SmetaOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure Prepare;
    procedure OkActionExecute(Sender: TObject);
    procedure Kod_Sm_PpsOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure Base_OkladChange(Sender: TObject);
    procedure Koeff_PpsChange(Sender: TObject);
    procedure GetSalaryRange;
    procedure CancelActionExecute(Sender: TObject);
    procedure OkladCheckCheck(Sender: TObject; var Error: String);
    procedure CheckOkladPpsCheck(Sender: TObject; var Error: String);
    procedure ShtatSelectButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Kol_StavokChange(Sender: TObject);
    procedure KolStavokCheckCheck(Sender: TObject; var Error: String);
    procedure SmNumberEditChange(Sender: TObject);
    procedure SmPPsNumberEditChange(Sender: TObject);
  private
    Pps_Salary_Min, Pps_Salary_Max : Double;
    Salary_Min, Salary_Max: Double;
    Base_Salary_Min, Base_Salary_Max: Double;
  public
    FMode : TFormMode;
    IdPostSalary : Integer;
  end;

var
  fmAddSmeta: TfmAddSmeta;

implementation

uses NewAcceptUnit, Math;

{$R *.dfm}

function ValueInBounds(X: Double; XMin, XMax: Double; eps: Double = 1e-2): Boolean;
begin
    Result := ( X > XMin - eps ) and ( X < XMax + eps );
end;

procedure TfmAddSmeta.Prepare;
begin
    case FMode of
        fmAdd : begin
            Caption := 'Додавання джерела фінансування';
            GetSalaryRange;
        end;

        fmModify : begin
            Caption := 'Редагування джерела фінансування';
        end;

        fmInfo : begin
            Caption := 'Перегляд джерела фінансування';
            Panel1.Enabled := False;            
        end;
    end;
end;

procedure TfmAddSmeta.SmetaOpenSprav(Sender: TObject; var Value: Variant;
  var DisplayText: String);
var
    id : Variant;
begin
    id := GlobalSPR.GetSmets(Owner, NewAcceptForm.LocalDatabase.Handle, NewAcceptForm.Date_Order, psmSmet);

    if ( VarArrayDimCount(id)>0 ) and ( id[0] <> Null ) then
    begin
        Value := id[0];
        DisplayText := IntToStr(id[3]) + '. ' + id[2];
   end;    
end;

procedure TfmAddSmeta.OkActionExecute(Sender: TObject);
begin
    if qFCheckAll(Self) then
        ModalResult := mrOk;
end;

procedure TfmAddSmeta.Kod_Sm_PpsOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    id : Variant;
begin
    id := GlobalSPR.GetSmets(Owner, NewAcceptForm.LocalDatabase.Handle, NewAcceptForm.Date_Order, psmSmet);

    if ( VarArrayDimCount(id)>0 ) and ( id[0] <> Null ) then
    begin
        Value := id[0];
        DisplayText := IntToStr(id[3]) + '. ' + id[2];
   end;   
end;

procedure TfmAddSmeta.Base_OkladChange(Sender: TObject);
begin
        // считаем итоговый оклад
    Oklad.Value := 0;

    if not VarIsNull(Base_Oklad.Value) and not VarIsEmpty(Base_Oklad.Value) then
        Oklad.Value := Base_Oklad.Value;

    if not VarIsNull(Oklad_Pps.Value) and not VarIsEmpty(Oklad_Pps.Value) then
        Oklad.Value := Oklad.Value + Oklad_Pps.Value;
end;

procedure TfmAddSmeta.Koeff_PpsChange(Sender: TObject);
begin
    GetSalaryRange;

    if VarIsNull(Koeff_Pps.Value) or VarIsEmpty(Koeff_Pps.Value) or
        ( Koeff_Pps.Value = 0 ) then
    begin
        Kod_Sm_Pps.Blocked := True;
        SmPpsNumberEdit.Enabled := False;
        Oklad_Pps.Value := 0;
        Oklad_Pps.Blocked := True;
        Kod_Sm_Pps.Required := False;
        Kod_Sm_Pps.Value := Null;
        Kod_Sm_Pps.DisplayText := '';
        OkladPpsRange.Caption := '';
        Oklad_Pps.Required := False;
    end
    else
    begin
        Kod_Sm_Pps.Blocked := False;
        SmPpsNumberEdit.Enabled := True;
        if Pps_Salary_Min <> Pps_Salary_Max then
            Oklad_Pps.Blocked := False;
        Kod_Sm_Pps.Required := True;
        Oklad_Pps.Required := True;
    end;
end;

procedure TfmAddSmeta.GetSalaryRange;
begin
    if IdPostSalary = 0 then
        exit;

    NewAcceptForm.dmShtatUtils.GetSalaryRange(IdPostSalary, Salary_Min, Salary_Max,
            Base_Salary_Min, Base_Salary_Max);

    if VarIsNull(Kol_Stavok.Value) then
        exit;

        // здесь могут быть глюки!
    if VarIsNull(Base_Oklad.Value)
        then Base_Oklad.Value := Salary_Max * Kol_Stavok.Value;

    if Salary_Min <> Salary_Max then
    begin
        OkladRange.Caption := '(від ' + FormatFloat('##########0.00', Salary_Min * Kol_Stavok.Value) +
            ' до ' + FormatFloat('###########0.00', Salary_Max * Kol_Stavok.Value) + ')';
        Base_Oklad.Blocked := False;
    end
    else
    begin
        Base_Oklad.Blocked := True;
        OkladRange.Caption := '(фіксовано: ' +
            FormatFloat('###########0.00', Salary_Max  * Kol_Stavok.Value) + ')';
        Base_Oklad.Value := Salary_Max * Kol_Stavok.Value;
    end;

    if not ( VarIsNull(Koeff_Pps.Value) or VarIsEmpty(Koeff_Pps.Value)
        or ( Koeff_Pps.Value = 0 ) ) then
    begin
        Pps_Salary_Min := SimpleRoundTo(Base_Salary_Min * Koeff_Pps.Value, 0) * Kol_Stavok.Value;
        Pps_Salary_Max := SimpleRoundTo(Base_Salary_Max * Koeff_Pps.Value, 0) * Kol_Stavok.Value;

                // здесь могут быть глюки!
        if not VarIsNull(Oklad_Pps.Value) and
            not ValueInBounds(Oklad_Pps.Value, Pps_Salary_Min, Pps_Salary_Max)
        then Oklad_Pps.Value := Pps_Salary_Max;

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
            Pps_Salary_Max := Pps_Salary_Max;
            Pps_Salary_Min := Pps_Salary_Min;
            OkladPpsRange.Caption := '(фіксовано: ' +
            FloatToStr(Pps_Salary_Max) + ')';
        end;
    end
    else
    begin
        Pps_Salary_Min := 0;
        Pps_Salary_Max := 0;
    end;
end;

procedure TfmAddSmeta.CancelActionExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmAddSmeta.OkladCheckCheck(Sender: TObject; var Error: String);
begin
    try
        if not ValueInBounds(Base_Oklad.Value, Salary_Min  * Kol_Stavok.Value, Salary_Max  * Kol_Stavok.Value) then
            Error := 'Значення окладу повинно бути у встановлених межах!'
    except
        Error := '';
    end;
end;

procedure TfmAddSmeta.CheckOkladPpsCheck(Sender: TObject;
  var Error: String);
begin
    try
        if (not ValueInBounds(Oklad_Pps.Value, Pps_Salary_Min, Pps_Salary_Max )) then
            Error := 'Значення підвищення окладу повинно бути у встановлених межах!';
    except
        Error := '';
    end;
end;

procedure TfmAddSmeta.ShtatSelectButtonClick(Sender: TObject);
begin
    SelectForm := TSelectForm.Create(Self, NewAcceptForm.ShtatrasQuery);
    SelectForm.Caption := 'Виберіть посаду штатного розкладу...';
    SelectForm.TableView.OptionsView.CellAutoHeight := True;
    SelectForm.TableView.OptionsView.HeaderAutoHeight := True;
    SelectForm.TableView.OptionsCustomize.ColumnFiltering := False;
    SelectForm.WindowState := wsMaximized;
    NewAcceptForm.ShtatrasQuery.Close;
    NewAcceptForm.ShtatrasQuery.Open;

    if SelectForm.ShowModal = mrOk then begin
        Smeta.Value := NewAcceptForm.ShtatrasQuery['KOD_SM'];
        Smeta.DisplayText := NewAcceptForm.ShtatrasQuerySM_NUMBER.AsString + '. ' +
                             NewAcceptForm.ShtatrasQuerySM_TITLE.Value;

        KolVacantStavok.Value := NewAcceptForm.ShtatrasQueryKOL_VACANT_STAVOK.Value;

        Koeff_Pps.Value := NewAcceptForm.ShtatrasQuery['KOEFF_PPS'];

        Kod_Sm_Pps.Value := NewAcceptForm.ShtatrasQuery['KOD_SM_PPS'];
        Kod_Sm_Pps.DisplayText := NewAcceptForm.ShtatrasQuerySM_NUMBER_PPS.AsString + '. ' +
                                  NewAcceptForm.ShtatrasQuerySM_TITLE_PPS.Value;
                                  
    end;

    SelectForm.Free;
end;

procedure TfmAddSmeta.FormCreate(Sender: TObject);
begin
    if FMode = fmAdd then begin

        NewAcceptForm.ShtatrasQuery.Close;
        NewAcceptForm.ShtatrasQuery.Open;
        NewAcceptForm.ShtatrasQuery.FetchAll;

        if NewAcceptForm.ShtatrasQuery.RecordCount = 1 then begin
            Smeta.Value := NewAcceptForm.ShtatrasQuery['KOD_SM'];
            Smeta.DisplayText := NewAcceptForm.ShtatrasQuerySM_NUMBER.AsString + '. ' +
                             NewAcceptForm.ShtatrasQuerySM_TITLE.Value;

            KolVacantStavok.Value := NewAcceptForm.ShtatrasQueryKOL_VACANT_STAVOK.Value;

            Koeff_Pps.Value := NewAcceptForm.ShtatrasQuery['KOEFF_PPS'];

            Kod_Sm_Pps.Value := NewAcceptForm.ShtatrasQuery['KOD_SM_PPS'];
            Kod_Sm_Pps.DisplayText := NewAcceptForm.ShtatrasQuerySM_NUMBER_PPS.AsString + '. ' +
                                  NewAcceptForm.ShtatrasQuerySM_TITLE_PPS.Value;
        end;

        NewAcceptForm.ShtatrasQuery.Close;
    end;
end;

procedure TfmAddSmeta.Kol_StavokChange(Sender: TObject);
begin
    GetSalaryRange;
end;

procedure TfmAddSmeta.KolStavokCheckCheck(Sender: TObject;
  var Error: String);
begin
    if not NewAcceptForm.GetDefaultsQuery.Active then
        NewAcceptForm.GetDefaultsQuery.Open;

    if  (not VarIsNull(NewAcceptForm.GetDefaultsQueryCHECK_SR_VACANT_ST.Value)) and
        (NewAcceptForm.GetDefaultsQueryCHECK_SR_VACANT_ST.Value = 'F') then
        exit;

    if VarIsNull(Kol_Stavok.Value) then
        Kol_Stavok.Value := 0;

    if VarIsNull(KolVacantStavok.Value) then
        Kol_Stavok.Value := 0;

    if Kol_Stavok.Value > KolVacantStavok.Value then
        Error := 'Кількість ставок не може перевищувати кількість вакантних ставок!';
end;

procedure TfmAddSmeta.SmNumberEditChange(Sender: TObject);
begin
    if SmNumberEdit.Text = '' then
        exit;

    try
        PubSprSmet.Close;
        PubSprSmet.ParamByName('smeta_kod').AsInteger := StrToInt(SmNumberEdit.Text);
        PubSprSmet.Open;
        PubSprSmet.FetchAll;

        if PubSprSmet.RecordCount = 1 then begin
            Smeta.Value := PubSprSmetID_SMETA.Value;
            Smeta.DisplayText := PubSprSmetSMETA_KOD.AsString +
                                 '. ' + PubSprSmetSMETA_TITLE.Value;
        end;
    except
    end;
end;

procedure TfmAddSmeta.SmPPsNumberEditChange(Sender: TObject);
begin
    if SmPpsNumberEdit.Text = '' then
        exit;

    try
        PubSprSmet.Close;
        PubSprSmet.ParamByName('smeta_kod').AsInteger := StrToInt(SmPpsNumberEdit.Text);
        PubSprSmet.Open;
        PubSprSmet.FetchAll;

        if PubSprSmet.RecordCount = 1 then begin
            Kod_Sm_Pps.Value := PubSprSmetID_SMETA.Value;
            Kod_Sm_Pps.DisplayText := PubSprSmetSMETA_KOD.AsString +
                                 '. ' + PubSprSmetSMETA_TITLE.Value;
        end;
    except
    end;
end;

end.
