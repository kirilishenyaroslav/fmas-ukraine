unit UpBonusOrderFormEditSm;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uFControl, uLabeledFControl, uSpravControl, StdCtrls, Buttons,
    GlobalSPR, qFTools, uCommonSP, uCharControl, uFloatControl, ActnList, DB,
    FIBDataSet, pFIBDataSet, uIntControl, cxControls, cxContainer, cxEdit,
    cxCheckBox;

type
    TLocalWinControl = class(TWinControl)
    end;

    TfmChangeSmeta = class(TForm)
        Smeta: TqFSpravControl;
        SmetaPps: TqFSpravControl;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        Summa: TqFFloatControl;
        SummaPPS: TqFFloatControl;
        ActionList1: TActionList;
        Save: TAction;
        NumSm: TqFIntControl;
        NumSmPps: TqFIntControl;
        PubSprSmet: TpFIBDataSet;
        PubSprSmetID_SMETA: TFIBBCDField;
        PubSprSmetSMETA_TITLE: TFIBStringField;
        PubSprSmetSMETA_KOD: TFIBIntegerField;
        ForAll: TcxCheckBox;
        procedure SmetaOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure SmetaPpsOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure OkButtonClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure NumSmChange(Sender: TObject);
        procedure NumSmPpsChange(Sender: TObject);
        procedure SaveExecute(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

implementation

uses UpBonusOrderForm, BaseTypes;

{$R *.dfm}

procedure TfmChangeSmeta.SmetaOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    id: variant;
begin
    id := GlobalSPR.GetSmets(Owner, TfmBonusOrder(Owner).WorkDatabase.Handle, Date, psmSmetWithoutPeriod);

    if (VarArrayDimCount(id) > 0) and (id[0] <> Null) then
    begin
        Value := id[0];
        DisplayText := IntToStr(id[3]) + '. ' + id[2];
    end;
end;

procedure TfmChangeSmeta.SmetaPpsOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    id: variant;
begin
    id := GlobalSPR.GetSmets(Owner, TfmBonusOrder(Owner).WorkDatabase.Handle, Date, psmSmetWithoutPeriod);
    if (VarArrayDimCount(id) > 0) and (id[0] <> Null) then
    begin
        Value := id[0];
        DisplayText := IntToStr(id[3]) + '. ' + id[2];
    end;
end;

procedure TfmChangeSmeta.OkButtonClick(Sender: TObject);
begin
    if TfmBonusOrder(Owner).RadioButton2.Checked
        then begin
        if Summa.Value = NULL
            then begin
            agShowMessage('Треба ввести суму!');
            exit;
        end;
    end;

    if Smeta.Value = NULL
        then begin
        agShowMessage('Треба ввести джерело фінансування!');
        exit;
    end;



    ModalResult := mrOk;
end;

procedure TfmChangeSmeta.FormCreate(Sender: TObject);
begin
    Smeta.TabStop := False;
    SmetaPps.TabStop := False;
end;

procedure TfmChangeSmeta.NumSmChange(Sender: TObject);
begin
    if VarIsNull(NumSm.Value)
        then exit;

    try

        PubSprSmet.Database := TfmBonusOrder(Owner).WorkDatabase;
        PubSprSmet.Transaction := TfmBonusOrder(Owner).ReadTransaction;
        PubSprSmet.UpdateTransaction := TfmBonusOrder(Owner).ReadTransaction;
        PubSprSmet.Close;
        PubSprSmet.ParamByName('smeta_kod').AsInteger := StrToInt(NumSm.Value);
        PubSprSmet.Open;
        PubSprSmet.FetchAll;

        if PubSprSmet.RecordCount = 1 then
        begin
            Smeta.Value := PubSprSmet['ID_SMETA'];
            Smeta.DisplayText := IntToStr(PubSprSmet['SMETA_KOD']) +
                '. ' + PubSprSmet['SMETA_TITLE'];
        end;

    except on e: Exception do
            ShowMessage(e.Message);
    end;
end;

procedure TfmChangeSmeta.NumSmPpsChange(Sender: TObject);
begin
    if VarIsNull(NumSm.Value)
        then exit;

    try

        PubSprSmet.Database := TfmBonusOrder(Owner).WorkDatabase;
        PubSprSmet.Transaction := TfmBonusOrder(Owner).ReadTransaction;
        PubSprSmet.UpdateTransaction := TfmBonusOrder(Owner).ReadTransaction;
        PubSprSmet.Close;
        PubSprSmet.ParamByName('smeta_kod').AsInteger := StrToInt(NumSmPps.Value);
        PubSprSmet.Open;
        PubSprSmet.FetchAll;

        if PubSprSmet.RecordCount = 1 then
        begin
            SmetaPPs.Value := PubSprSmet['ID_SMETA'];
            SmetaPps.DisplayText := IntToStr(PubSprSmet['SMETA_KOD']) +
                '. ' + PubSprSmet['SMETA_TITLE'];
        end;

    except on e: Exception do
            ShowMessage(e.Message);
    end;
end;

procedure TfmChangeSmeta.SaveExecute(Sender: TObject);
begin
    OkButtonClick(self)
end;

end.
