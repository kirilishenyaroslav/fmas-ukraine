unit UpFEditSmeta;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, uCharControl,
    uIntControl, uFControl, uLabeledFControl, uSpravControl, Buttons, DB,
    FIBDataSet, pFIBDataSet, uFloatControl, uFormControl, cxControls,
    cxContainer, cxEdit, cxLabel, uInvisControl, FIBDatabase, pFIBDatabase,
    iBase, uCommonSp;

type
    TUpEditSmeta = class(TForm)
        cxB_GetFromShtat: TcxButton;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        Smet: TqFSpravControl;
        NumSm: TqFIntControl;
        PubSprSmet: TpFIBDataSet;
        PubSprSmetID_SMETA: TFIBBCDField;
        PubSprSmetSMETA_TITLE: TFIBStringField;
        PubSprSmetSMETA_KOD: TFIBIntegerField;
        RateCount: TqFFloatControl;
        FreeRate: TqFFloatControl;
        PPSVal: TqFFloatControl;
        PPSSmet: TqFSpravControl;
        PPSNumSm: TqFIntControl;
        Oklad: TqFFloatControl;
        PPSOklad: TqFFloatControl;
        OkladSum: TqFFloatControl;
        AddSmet: TqFFormControl;
        cxL_OklRange: TcxLabel;
        cxLabel1: TcxLabel;
        qFIC_KeySession: TqFInvisControl;
        IdPostSalaryReal: TqFInvisControl;
        DateBeg: TqFInvisControl;
        DateEnd: TqFInvisControl;
        OkladSTRLabel: TLabel;
        AddBonuses: TqFInvisControl;
        IdPCard: TqFInvisControl;
        DB: TpFIBDatabase;
        ReadTransaction: TpFIBTransaction;
        GetSalary: TpFIBDataSet;
    IdOrderItem: TqFInvisControl;
      //  constructor Create(aOwner: TComponent; DM: TUPAcceptDM; Mode: TFormMode; idRec: Variant; ActDate: TDate); reintroduce;
        procedure Prepare(DBase: TISC_DB_HANDLE; Key_Session,Id_Order_Item: Int64;
            Id_Post_Salary_Real,Id_department,Id_type_post,ID_level: Integer; Date_Beg, Date_End: TDate;
            Add_Bonuses: Boolean; Id_PCard: Variant);
        procedure SmetOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure NumSmChange(Sender: TObject);
        procedure PPSSmetOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure PPSNumSmChange(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure cxB_GetFromShtatClick(Sender: TObject);

        procedure RateCountChange(Sender: TObject);
        procedure PPSValChange(Sender: TObject);

    private
        ActualDate: TDate;
        Period_Beg: TDate;
        Period_End: TDate;

        pIdDepartment: integer;
        pIdTypePost: integer;
        pIdLevel: integer;

        procedure CalcOklad;

    public
        Id_Man_moving_inst: Int64;
    end;

var
    UpEditSmeta: TUpEditSmeta;

implementation

uses GlobalSPR, Math, qFTools;

{$R *.dfm}

procedure TUpEditSmeta.Prepare(DBase: TISC_DB_HANDLE; Key_Session,Id_Order_Item: Int64;
    Id_Post_Salary_Real,Id_department,Id_type_post,Id_Level: Integer; Date_Beg, Date_End: TDate; Add_Bonuses: Boolean;
    Id_PCard: Variant);
begin
    DB.Handle              := DBase;
    ReadTransaction.StartTransaction;

    pIdLevel     := Id_level;
    pIdDepartment:= Id_department;
    pIdTypePost  := Id_Type_post;
    IdPostSalaryReal.Value := Id_Post_Salary_Real;
    IdOrderItem.Value     := Id_Order_Item;
    qFIC_KeySession.Value := Key_Session;

    ActualDate := Date_Beg;

    Period_Beg := Date_Beg;
    Period_End := Date_End;

    DateBeg.Value := QuotedStr(DateToStr(Date_Beg));
    DateEnd.Value := QuotedStr(DateToStr(Date_End));

    AddBonuses.Value := Add_Bonuses;
    IdPCard.Value := Id_PCard;
end;


procedure TUpEditSmeta.CalcOklad;
var
    OkladSTR: string;
    cnt: Integer;
begin
    GetSalary.Close;
    GetSalary.ParamByName('Id_Post_Salary').AsInteger := IdPostSalaryReal.Value;
    GetSalary.ParamByName('Period_Beg').AsDate := Period_Beg;
    GetSalary.ParamByName('Period_End').AsDate := Period_End;
    GetSalary.ParamByName('Rate_Count').Value := RateCount.Value;
    GetSalary.ParamByName('Koeff_Pps').Value := PPSVal.Value;
    GetSalary.Open;
    GetSalary.First;

    OkladSTR := '';

    cnt := 0;
    while not GetSalary.Eof do
    begin
        if not VarIsNull(GetSalary['Date_Beg'])
            and not VarIsNull(GetSalary['Oklad']) then
        begin
            if Period_Beg = GetSalary['Date_Beg'] then
            begin
                Oklad.Value := GetSalary['Oklad'];
                PPSOklad.Value := GetSalary['Oklad_Pps'];
                OkladSum.Value := Oklad.Value + Coalesce(PPSOklad.Value, 0);
            end;

            if GetSalary['Oklad'] > 0 then
            begin
                if OkladSTR <> '' then OkladSTR := OkladSTR + ', ';
                OkladSTR := OkladSTR + FloatToStr(GetSalary['Oklad']) + ' грн. з ' +
                    DateToStr(GetSalary['Date_Beg']);
                inc(cnt);
            end;
        end;
        GetSalary.Next;
    end;

    if cnt > 1 then OkladSTRLabel.Font.Color := clRed
    else OkladSTRLabel.Font.Color := clGreen;

    if OkladSTR <> '' then
        OkladSTRLabel.Caption := 'Оклад: ' + OkladSTR;
end;

procedure TUpEditSmeta.SmetOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    id: Variant;
begin
    id := GlobalSPR.GetSmets(Self, DB.Handle, ActualDate, psmSmet);

    if (VarArrayDimCount(id) > 0) and (id[0] <> Null)
        then
    begin
        Value := id[0];
        DisplayText := IntToStr(id[3]) + '. ' + id[2];
    end;
end;

procedure TUpEditSmeta.NumSmChange(Sender: TObject);
begin
    if VarIsNull(NumSm.Value)
        then exit;

    try
        PubSprSmet.Close;
        PubSprSmet.ParamByName('smeta_kod').AsInteger := StrToInt(NumSm.Value);
        PubSprSmet.Open;
        PubSprSmet.FetchAll;

        if PubSprSmet.RecordCount = 1 then
        begin
            Smet.Value := PubSprSmet['ID_SMETA'];
            Smet.DisplayText := IntToStr(PubSprSmet['SMETA_KOD']) +
                '. ' + PubSprSmet['SMETA_TITLE'];
        end;

    except on e: Exception do
            ShowMessage(e.Message);
    end;
end;

procedure TUpEditSmeta.PPSSmetOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    id: Variant;
begin
    id := GlobalSPR.GetSmets(Self, PubSprSmet.Database.Handle, ActualDate, psmSmet);

    if (VarArrayDimCount(id) > 0) and (id[0] <> Null)
        then
    begin
        Value := id[0];
        DisplayText := IntToStr(id[3]) + '. ' + id[2];
    end;
end;

procedure TUpEditSmeta.PPSNumSmChange(Sender: TObject);
begin
    if VarIsNull(PPSNumSm.Value)
        then exit;

    try
        PubSprSmet.Close;
        PubSprSmet.ParamByName('smeta_kod').AsInteger := StrToInt(PPSNumSm.Value);
        PubSprSmet.Open;
        PubSprSmet.FetchAll;

        if PubSprSmet.RecordCount = 1
            then
        begin
            PPSSmet.Value := PubSprSmet['ID_SMETA'];
            PPSSmet.DisplayText := IntToStr(PubSprSmet['SMETA_KOD']) +
                '. ' + PubSprSmet['SMETA_TITLE'];
        end;
    except
        ShowMessage('Error!');
    end;
end;

procedure TUpEditSmeta.OkButtonClick(Sender: TObject);
begin
    AddSmet.Ok;
end;

procedure TUpEditSmeta.cxB_GetFromShtatClick(Sender: TObject);
var
    sp: TSprav;
begin
  // создать справочник
    sp := GetSprav('Up\UpFreeFunds');
    if sp <> nil then
    begin
    // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(DB.Handle);
            FieldValues['Act_Date'] := Date;

            FieldValues['Id_post_salary'] := IdPostSalaryReal.Value;
            FieldValues['Id_department']  := pIdDepartment;
            FieldValues['id_type_post']   := pIdTypePost;
            FieldValues['ID_LEVEL']       := pIdLevel;

            Post;
        end;
     // показать справочник и проанализировать результат
        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin

          Smet.Value := sp.Output['Id_Smeta'];
          Smet.DisplayText := sp.Output['Smeta_Title'];
          FreeRate.Value := sp.Output['Kol_Vacant_Stavok'];
          PPSVal.Value := sp.Output['Koeff_Pps'];
          PPSSmet.Value := sp.Output['Id_Smeta_Pps'];
          PPSSmet.DisplayText := sp.Output['Smeta_Pps_Title'];

          CalcOklad;

          RateCount.SetFocus;
        end;
        sp.Free;
    end;
end;

procedure TUpEditSmeta.RateCountChange(Sender: TObject);
begin
    CalcOklad;
end;

procedure TUpEditSmeta.PPSValChange(Sender: TObject);
begin
    CalcOklad;
    PPSSmet.Blocked := VarIsNull(PPSVal.Value);
    PPSNumSm.Blocked := VarIsNull(PPSVal.Value);
end;

initialization
    RegisterClass(TUpEditSmeta);

end.

