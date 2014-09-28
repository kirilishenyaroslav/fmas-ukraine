unit fmAddMoveSmetaUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDateControl, uLogicCheck, uCharControl, uFloatControl,
  uFControl, uLabeledFControl, uSpravControl, ActnList, StdCtrls, Buttons, GlobalSPR,
  uFormControl, qFTools, ExtCtrls, uSimpleCheck, uSelectForm, DB,
  FIBDataSet, pFIBDataSet, Math;

type
  TfmAddMoveSmeta = class(TForm)
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
    SmPPsNumberEdit: TEdit;
    PubSprSmet: TpFIBDataSet;
    PubSprSmetID_SMETA: TFIBBCDField;
    PubSprSmetSMETA_TITLE: TFIBStringField;
    PubSprSmetSMETA_KOD: TFIBIntegerField;
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
  fmAddMoveSmeta: TfmAddMoveSmeta;

implementation

uses MoveUnit;

{$R *.dfm}

function ValueInBounds(X: Double; XMin, XMax: Double; eps: Double = 1e-2): Boolean;
begin
    Result := ( X > XMin - eps ) and ( X < XMax + eps );
end;

procedure TfmAddMoveSmeta.Prepare;
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

procedure TfmAddMoveSmeta.SmetaOpenSprav(Sender: TObject; var Value: Variant;
  var DisplayText: String);
var
    id : Variant;
begin
    id := GlobalSPR.GetSmets(Owner, MoveForm.LocalDatabase.Handle, MoveForm.Date_Order, psmSmet);

    if ( VarArrayDimCount(id)>0 ) and ( id[0] <> Null ) then
    begin
        Value := id[0];
        DisplayText := IntToStr(id[3]) + '. ' + id[2];
   end;    
end;

procedure TfmAddMoveSmeta.OkActionExecute(Sender: TObject);
begin
 if qFCheckAll(Self) then
        ModalResult := mrOk;
end;

procedure TfmAddMoveSmeta.Kod_Sm_PpsOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    id : Variant;
begin
    id := GlobalSPR.GetSmets(Owner, MoveForm.LocalDatabase.Handle, MoveForm.Date_Order, psmSmet);

    if ( VarArrayDimCount(id)>0 ) and ( id[0] <> Null ) then
    begin
        Value := id[0];
        DisplayText := IntToStr(id[3]) + '. ' + id[2];
   end;   
end;

procedure TfmAddMoveSmeta.Base_OkladChange(Sender: TObject);
begin
        // считаем итоговый оклад
    Oklad.Value := 0;

    if not VarIsNull(Base_Oklad.Value) and not VarIsEmpty(Base_Oklad.Value) then
        Oklad.Value := Base_Oklad.Value;

    if not VarIsNull(Oklad_Pps.Value) and not VarIsEmpty(Oklad_Pps.Value) then
        Oklad.Value := Oklad.Value + Oklad_Pps.Value;

    //Oklad.Value := Round(Oklad.Value);
end;

procedure TfmAddMoveSmeta.Koeff_PpsChange(Sender: TObject);
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

procedure TfmAddMoveSmeta.GetSalaryRange;
begin
    if IdPostSalary = 0 then
        exit;

    MoveForm.dmShtatUtils.GetSalaryRange(IdPostSalary, Salary_Min, Salary_Max,
            Base_Salary_Min, Base_Salary_Max);
{    if VarIsNull(Kol_Stavok.Value) then
        exit;

        // здесь могут быть глюки!
    if VarIsNull(Base_Oklad.Value)
        then Base_Oklad.Value := Salary_Max * Kol_Stavok.Value;

    if Salary_Min <> Salary_Max then
    begin
        OkladRange.Caption := '(від ' + FormatFloat('##########0.00', Salary_Min) +
            ' до ' + FormatFloat('###########0.00', Salary_Max) + ')';
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
        Pps_Salary_Min := Salary_Min * Koeff_Pps.Value;
        Pps_Salary_Max := Salary_Max * Koeff_Pps.Value;

                // здесь могут быть глюки!
        if not VarIsNull(Oklad_Pps.Value) and
            not ValueInBounds(Oklad_Pps.Value, Pps_Salary_Min, Pps_Salary_Max)
        then Oklad_Pps.Value := Round(Pps_Salary_Max);

        if Pps_Salary_Min <> Pps_Salary_Max then
        begin
            OkladPpsRange.Caption := '(від ' + FormatFloat('##########0.00',
                Pps_Salary_Min  * Kol_Stavok.Value) + ' до ' + FormatFloat('###########0.00',
                Pps_Salary_Max * Kol_Stavok.Value) + ')';
            Oklad_Pps.Blocked := False;
        end
        else
        begin
            Oklad_Pps.Blocked := True;
            Pps_Salary_Max := Round(Pps_Salary_Max);
            Pps_Salary_Min := Round(Pps_Salary_Min);
            OkladPpsRange.Caption := '(фіксовано: ' +
            IntToStr(Round(Pps_Salary_Max)) + ')';
        end;
    end
    else
    begin
        Pps_Salary_Min := 0;
        Pps_Salary_Max := 0;
    end; }

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

procedure TfmAddMoveSmeta.CancelActionExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmAddMoveSmeta.OkladCheckCheck(Sender: TObject; var Error: String);
begin
    try
        if not ValueInBounds(Base_Oklad.Value, Salary_Min * Kol_Stavok.Value, Salary_Max * Kol_Stavok.Value) then
            Error := 'Значення окладу повинно бути у встановлених межах!'
    except
        Error := '';
    end;
end;

procedure TfmAddMoveSmeta.CheckOkladPpsCheck(Sender: TObject;
  var Error: String);
begin
    try
        if (not ValueInBounds(Oklad_Pps.Value, Pps_Salary_Min, Pps_Salary_Max )) then
            Error := 'Значення підвищення окладу повинно бути у встановлених межах!';
    except
        Error := '';
    end;
end;

procedure TfmAddMoveSmeta.ShtatSelectButtonClick(Sender: TObject);
begin
    SelectForm := TSelectForm.Create(Self, MoveForm.ShtatrasQuery);
    SelectForm.Caption := 'Виберіть посаду штатного розкладу...';
    SelectForm.TableView.OptionsView.CellAutoHeight := True;
    SelectForm.TableView.OptionsView.HeaderAutoHeight := True;
    SelectForm.TableView.OptionsCustomize.ColumnFiltering := False;
    SelectForm.WindowState := wsMaximized;
    MoveForm.ShtatrasQuery.Close;
    MoveForm.ShtatrasQuery.Open;

    if SelectForm.ShowModal = mrOk then begin
        Smeta.Value := MoveForm.ShtatrasQuery['KOD_SM'];
        Smeta.DisplayText := MoveForm.ShtatrasQuerySM_NUMBER.AsString + '. ' +
                             MoveForm.ShtatrasQuerySM_TITLE.Value;

        KolVacantStavok.Value := MoveForm.ShtatrasQueryKOL_VACANT_STAVOK.Value;

        Koeff_Pps.Value := MoveForm.ShtatrasQuery['KOEFF_PPS'];

        Kod_Sm_Pps.Value := MoveForm.ShtatrasQuery['KOD_SM_PPS'];
        Kod_Sm_Pps.DisplayText := MoveForm.ShtatrasQuerySM_NUMBER_PPS.AsString + '. ' +
                                  MoveForm.ShtatrasQuerySM_TITLE_PPS.Value;
                                  
    end;

    SelectForm.Free;
end;

procedure TfmAddMoveSmeta.FormCreate(Sender: TObject);
begin
    if FMode = fmAdd then begin

        MoveForm.ShtatrasQuery.Close;
        MoveForm.ShtatrasQuery.Open;
        MoveForm.ShtatrasQuery.FetchAll;

        if MoveForm.ShtatrasQuery.RecordCount = 1 then begin
            Smeta.Value := MoveForm.ShtatrasQuery['KOD_SM'];
            Smeta.DisplayText := MoveForm.ShtatrasQuerySM_NUMBER.AsString + '. ' +
                             MoveForm.ShtatrasQuerySM_TITLE.Value;

            KolVacantStavok.Value := MoveForm.ShtatrasQueryKOL_VACANT_STAVOK.Value;

            Koeff_Pps.Value := MoveForm.ShtatrasQuery['KOEFF_PPS'];

            Kod_Sm_Pps.Value := MoveForm.ShtatrasQuery['KOD_SM_PPS'];
            Kod_Sm_Pps.DisplayText := MoveForm.ShtatrasQuerySM_NUMBER_PPS.AsString + '. ' +
                                  MoveForm.ShtatrasQuerySM_TITLE_PPS.Value;
        end;

        MoveForm.ShtatrasQuery.Close;
    end;
end;

procedure TfmAddMoveSmeta.Kol_StavokChange(Sender: TObject);
begin
    GetSalaryRange;
end;

procedure TfmAddMoveSmeta.KolStavokCheckCheck(Sender: TObject;
  var Error: String);
begin
    if not MoveForm.GetDefaultsQuery.Active then
        MoveForm.GetDefaultsQuery.Open;

    if  (not VarIsNull(MoveForm.GetDefaultsQueryCHECK_SR_VACANT_ST.Value)) and
        (MoveForm.GetDefaultsQueryCHECK_SR_VACANT_ST.Value = 'F') then
        exit;

    if VarIsNull(Kol_Stavok.Value) then
        Kol_Stavok.Value := 0;

    if VarIsNull(KolVacantStavok.Value) then
        Kol_Stavok.Value := 0;

    if Kol_Stavok.Value > KolVacantStavok.Value then
        Error := 'Кількість ставок не може перевищувати кількість вакантних ставок!';
end;

procedure TfmAddMoveSmeta.SmNumberEditChange(Sender: TObject);
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

procedure TfmAddMoveSmeta.SmPPsNumberEditChange(Sender: TObject);
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
