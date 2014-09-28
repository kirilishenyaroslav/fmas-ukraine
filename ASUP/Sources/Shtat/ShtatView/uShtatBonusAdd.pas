unit uShtatBonusAdd;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, ExtCtrls, uDateControl, uFControl,
    uLabeledFControl, uSpravControl, uBoolControl, uFloatControl,
    uCharControl, uIntControl, uShtatData, uFormControl, ActnList,
    FIBDatabase, pFIBDatabase;

type
    TfmShtatBonusAdd = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        Panel1: TPanel;
        IdRaise: TqFSpravControl;
        DateBeg: TqFDateControl;
        DateEnd: TqFDateControl;
        Summa: TqFFloatControl;
        Label1: TLabel;
        Smeta: TqFSpravControl;
        Kod_Sm_Pps: TqFSpravControl;
        FormControl: TqFFormControl;
        ActionList: TActionList;
        AcceptAction: TAction;
        Panel2: TPanel;
        Percent: TqFFloatControl;
        OpenSmeta: TAction;
        RecalcPercent: TBitBtn;
        procedure SmetaOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure IdRaiseOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure Kod_Sm_PpsOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure SummaChange(Sender: TObject);
        procedure AcceptActionExecute(Sender: TObject);
        procedure FormActivate(Sender: TObject);
        procedure FormControlNewRecordAfterPrepare(Sender: TObject);
        procedure PercentChange(Sender: TObject);
        procedure IdRaiseChange(Sender: TObject);
        procedure OpenSmetaExecute(Sender: TObject);
        procedure RecalcPercentClick(Sender: TObject);
        procedure FormControlDatabaseEventBefore(Sender: TObject; Form: TForm;
            Mode: TFormMode; Transaction: TFIBTransaction);
    private
    public
        DM: TdmShtatView;
        Id_ShtatRas_Smet: Integer;
    end;

var
    fmShtatBonusAdd: TfmShtatBonusAdd;

implementation

uses qfTools, UpKernelUnit;
{$R *.dfm}

procedure TfmShtatBonusAdd.SmetaOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
begin
    DM.GetSmeta(Value, DisplayText);
end;

procedure TfmShtatBonusAdd.IdRaiseOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
begin
    DM.GetRaise(Value, DisplayText);
end;

procedure TfmShtatBonusAdd.Kod_Sm_PpsOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
begin
    DM.GetSmeta(Value, DisplayText);
end;

procedure TfmShtatBonusAdd.SummaChange(Sender: TObject);
begin
   { if not VarIsNull(Summa.Value) and (Summa.Value > 0) then}
    //поле "сумма" может быть отрицательным
    if not VarIsNull(Summa.Value)  then
        Percent.Required := False
    else Percent.Required := True;
end;

procedure TfmShtatBonusAdd.AcceptActionExecute(Sender: TObject);
begin
    FormControl.Ok;
end;

procedure TfmShtatBonusAdd.FormActivate(Sender: TObject);
begin
    IdRaise.ShowFocus;
end;

procedure TfmShtatBonusAdd.FormControlNewRecordAfterPrepare(
    Sender: TObject);
begin
    DateBeg.Value := DM.SR_Date_Beg;
    //    DateEnd.Value := DM.SR_Date_End;
    DateEnd.Value := EncodeDate(2150, 12, 31);
end;

procedure TfmShtatBonusAdd.PercentChange(Sender: TObject);
begin
    if not VarIsNull(Percent.Value) and (Percent.Value > 0) then
        Summa.Required := False
    else Summa.Required := True;
end;

procedure TfmShtatBonusAdd.IdRaiseChange(Sender: TObject);
begin
    if (FormControl.Mode = fmAdd) and not VarIsNull(IdRaise.Value) then
    begin
        DM.RaiseDefaults.Close;
        DM.RaiseDefaults.ParamByName('Id_ShtatRas_Smet').AsInteger := Id_ShtatRas_Smet;
        DM.RaiseDefaults.ParamByName('Id_Raise').AsInteger := IdRaise.Value;
        DM.RaiseDefaults.Open;

        if not DM.RaiseDefaults.IsEmpty then
        begin
            if (DM.RaiseDefaults['Id_Calc_Type'] = 2) or
                (DM.RaiseDefaults['Id_Calc_Type'] = 3) then
            begin
                Smeta.AutoSaveToRegistry := False;
                Smeta.Load(DM.RaiseDefaults);
                Kod_Sm_Pps.Load(DM.RaiseDefaults);
                Percent.Load(DM.RaiseDefaults);

                Smeta.Blocked := DM.RaiseDefaults['Id_Calc_Type'] = 2;
                Kod_Sm_Pps.Blocked := DM.RaiseDefaults['Id_Calc_Type'] = 2;
            end
            else
            begin
                Smeta.AutoSaveToRegistry := True;
                IdRaise.AutoSaveToRegistry := False;
                qFAutoLoadFromRegistry(Self);
                IdRaise.AutoSaveToRegistry := True;
                Smeta.Blocked := False;
                Kod_Sm_Pps.Blocked := False;
            end;
        end
        else
        begin
            Smeta.AutoSaveToRegistry := True;
            IdRaise.AutoSaveToRegistry := False;
            qFAutoLoadFromRegistry(Self);
            IdRaise.AutoSaveToRegistry := True;
            Smeta.Blocked := False;
            Kod_Sm_Pps.Blocked := False;
        end;
    end;
end;

procedure TfmShtatBonusAdd.OpenSmetaExecute(Sender: TObject);
begin
    Smeta.OpenSprav;
end;

procedure TfmShtatBonusAdd.RecalcPercentClick(Sender: TObject);
begin
    DM.GetPercentFromSum.Close;
    DM.GetPercentFromSum.ParamByName('Id_ShtatRas_Smet').AsVariant := Id_ShtatRas_Smet;
    DM.GetPercentFromSum.ParamByName('Summa').AsVariant := Summa.Value;
    DM.GetPercentFromSum.Open;

    if not DM.GetPercentFromSum.IsEmpty then
    begin
        Percent.Value := DM.GetPercentFromSum['Percent'];
        Summa.Value := Null;
    end;
end;

procedure TfmShtatBonusAdd.FormControlDatabaseEventBefore(Sender: TObject;
    Form: TForm; Mode: TFormMode; Transaction: TFIBTransaction);
begin
    UpKernelUnit.StartHistory(TpFIBTransaction(Transaction));
end;

initialization
    RegisterClass(TfmShtatBonusAdd);

end.
