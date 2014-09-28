unit UpFBonusEdit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, uFControl, uLabeledFControl, uCharControl,
    uFloatControl, uDateControl, uSpravControl, uBoolControl, uFormControl,
    uInvisControl, IBase, DB, FIBDataSet, pFIBDataSet, FIBDatabase,
  pFIBDatabase;

type
    TfmBonusEdit = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        Percent: TqFFloatControl;
        IdRaise: TqFSpravControl;
        DateBeg: TqFDateControl;
        DateEnd: TqFDateControl;
        All_Periods: TqFBoolControl;
        FormControl: TqFFormControl;
        Smeta: TqFSpravControl;
        Kod_Sm_Pps: TqFSpravControl;
        Summa: TqFFloatControl;
        Label1: TLabel;
        Key_Session: TqFInvisControl;
    ActualDate: TqFInvisControl;
        DB: TpFIBDatabase;
        ReadTransaction: TpFIBTransaction;
        RaiseDefaults: TpFIBDataSet;
        Id_Order_Item: TqFInvisControl;
        procedure IdRaiseOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure SmetaOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure OkButtonClick(Sender: TObject);
        procedure SummaChange(Sender: TObject);
        procedure PercentChange(Sender: TObject);
        procedure IdRaiseChange(Sender: TObject);
        procedure FormControlModifyRecordAfterPrepare(Sender: TObject);
        procedure All_PeriodsChange(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure Prepare(DBase:TISC_DB_HANDLE;KeySession:Int64;ID_Item:Int64;Actual_Date:Variant);
    procedure Button1Click(Sender: TObject);
    private
        PDBHandle: TISC_DB_HANDLE;
    public
    end;

var
    fmBonusEdit: TfmBonusEdit;

implementation

{$R *.dfm}

uses uCommonSp, GlobalSPR, qfTools;

procedure TfmBonusEdit.IdRaiseOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
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
            FieldValues['Actual_Date'] := Date;
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

procedure TfmBonusEdit.SmetaOpenSprav(Sender: TObject; var Value: Variant;
    var DisplayText: string);
var
    id: variant;
begin
    id := GlobalSPR.GetSmets(Owner, TISC_DB_Handle(DB.Handle), Date, psmSmet);

    if (VarArrayDimCount(id) > 0) and (id[0] <> Null) then
    begin
        Value := id[0];
        DisplayText := IntToStr(id[3]) + '. ' + id[2];
    end;
end;

procedure TfmBonusEdit.OkButtonClick(Sender: TObject);
begin
    FormControl.Ok;
end;

procedure TfmBonusEdit.SummaChange(Sender: TObject);
begin
    if (not VarIsNull(Summa.Value) and (Summa.Value > 0)) or (Percent.Blocked) then
        Percent.Required := False
    else    
        Percent.Required := True;
end;

procedure TfmBonusEdit.PercentChange(Sender: TObject);
begin
    if (not VarIsNull(Percent.Value) and (Percent.Value > 0)) or (Summa.Blocked) then
        Summa.Required := False
    else
        Summa.Required := True;
end;

procedure TfmBonusEdit.IdRaiseChange(Sender: TObject);
begin
    RaiseDefaults.Close;
    RaiseDefaults.ParamByName('Key_Session').AsVariant := Key_Session.Value;
    RaiseDefaults.ParamByName('ID_ORDER_ITEM').AsVariant := Id_Order_Item.Value;
    RaiseDefaults.ParamByName('Id_Raise').AsVariant := IdRaise.Value;
    RaiseDefaults.Open;


    if RaiseDefaults['ID_CALC_TYPE']=1 then
      begin
         Summa.Blocked      := False;
         Percent.Blocked    := True;
         All_Periods.Value  := 0;
         All_Periods.Blocked:= True;
         Smeta.Blocked      := False;
         Kod_Sm_Pps.Blocked := True;
      end;
    if RaiseDefaults['ID_CALC_TYPE']=2 then
      begin
         Summa.Blocked      := True;
         Percent.Blocked    := False;
         All_Periods.Value  := 1;
         All_Periods.Blocked:= False;
         Smeta.Blocked      := True;
         Kod_Sm_Pps.Blocked := True;
      end;
    if RaiseDefaults['ID_CALC_TYPE']=3 then
      begin
         Summa.Blocked      := False;
         Percent.Blocked    := False;
         Smeta.Blocked      := False;
         Kod_Sm_Pps.Blocked := True;
      end;

    if Percent.Blocked then
      begin
        Percent.Required := False;
        Summa.Required := True;
      end;
    if Summa.Blocked then
      begin
        Percent.Required := True;
        Summa.Required := False;
      end;
end;

procedure TfmBonusEdit.FormControlModifyRecordAfterPrepare(
    Sender: TObject);
begin
    IdRaise.Blocked := True;
end;

procedure TfmBonusEdit.All_PeriodsChange(Sender: TObject);
begin
    if All_Periods.Value then
    begin
        DateBeg.Visible := False;
        DateEnd.Visible := False;
    end
    else
    begin
        DateBeg.Visible := True;
        DateEnd.Visible := True;
    end;
end;

procedure TfmBonusEdit.FormCreate(Sender: TObject);
begin
    DateBeg.Visible := False;
    DateEnd.Visible := False;
end;

procedure TfmBonusEdit.Prepare(DBase:TISC_DB_HANDLE;KeySession,ID_Item:Int64;Actual_Date:Variant);
begin
    DB.Handle              := DBase;
    ReadTransaction.StartTransaction;

    RaiseDefaults.SQLs.SelectSQL.Text := 'SELECT * FROM UP_ORDER_MOVE_RAISE_DEFAULTS(:Key_Session,:Id_order_item,:Id_Raise)';

    ActualDate.Value := Actual_Date;
    Key_Session.Value := KeySession;
    Id_Order_Item.Value := Id_Item;
end;

procedure TfmBonusEdit.Button1Click(Sender: TObject);
begin
  ShowMessage('KEY_SESSION = '+VarToStrDef(Key_Session.Value,'NULL')+#13+
              'ID_ORDER_ITEM = '+VarToStrDef(Id_Order_Item.Value,'NULL')+#13+
              'ID_RAISE = '+VarToStrDef(IdRaise.Value,'NULL')+#13+
              'DATE_BEG = '+VarToStrDef(DateBeg.Value,'NULL')+#13+
              'DATE_END = '+VarToStrDef(DateEnd.Value,'NULL')+#13+
              'ALL_PERIODS = '+VarToStrDef(All_Periods.Value,'NULL'));
end;

initialization
    RegisterClass(TfmBonusEdit);

end.

