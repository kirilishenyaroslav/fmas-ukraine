unit uPochasSmet;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uFControl, uLabeledFControl, uSpravControl, GlobalSPR,
    uCharControl, uFloatControl, cxControls, cxGroupBox, StdCtrls, Buttons,
    FIBQuery, pFIBQuery, pFIBStoredProc, uIntControl, ActnList, cxContainer,
    cxEdit, cxCheckBox;

type
    TfrmPochasSmet = class(TForm)
        btnOk: TBitBtn;
        btnCancel: TBitBtn;
        cxGroupBox1: TcxGroupBox;
        SmetaEdit: TqFSpravControl;
        HoursEdit: TqFFloatControl;
        pFIBStoredProc: TpFIBStoredProc;
        KodEdit: TqFIntControl;
        ActionList1: TActionList;
        ActionSelect: TAction;
        cxCheckHour: TcxCheckBox;
        procedure SmetaEditOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure btnOkClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure KodEditChange(Sender: TObject);
        procedure FormShow(Sender: TObject);
        procedure KodEditKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure HoursEditKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure SmetaEditKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure cxCheckHourClick(Sender: TObject);
    public
        kod_sm: integer;
    end;

implementation
uses qFTools, uPochas;

{$R *.dfm}

procedure TfrmPochasSmet.SmetaEditOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    smet: Variant;
begin
    smet := GetSmets(self, TfrmPochasOrder(Owner.Owner).Database.Handle, Date, psmSmetWithoutPeriod);
    if VarArrayDimCount(smet) > 0 then
    begin
        if smet[0] <> 0 then
        begin
            Value := smet[0];
            DisplayText := smet[2];
            kod_sm := smet[3];
            KodEdit.Value := kod_sm;
        end;
    end;
end;

procedure TfrmPochasSmet.btnOkClick(Sender: TObject);
begin
    if not cxCheckHour.Checked then
        HoursEdit.Required := True
    else HoursEdit.Required := False;
    if qFCheckAll(Self) then ModalResult := mrOk;
end;

procedure TfrmPochasSmet.FormCreate(Sender: TObject);
begin
    pFIBStoredProc.Database := TfrmPochasOrder(Owner.Owner).Database;
    pFIBStoredProc.Transaction := TfrmPochasOrder(Owner.Owner).ReadTransaction;
end;

procedure TfrmPochasSmet.KodEditChange(Sender: TObject);
begin
    SmetaEdit.DisplayText := '';
    SmetaEdit.Value := Null;
    if VarIsNull(KodEdit.Value) then exit;
    if trim(KodEdit.Value) <> '' then
    begin
//  pFIBStoredProc.Database := pFIBDatabase;
//  pFIBStoredProc.Transaction := pFIBTransactionWrite;
//  pFIBTransactionWrite.DefaultDatabase := pFIBDatabase;
        pFIBStoredProc.Transaction.StartTransaction;
        pFIBStoredProc.StoredProcName := 'PUB_GET_NAME_BUDG_BY_KOD';
        pFIBStoredProc.Prepare;
        pFIBStoredProc.ParamByName('NUM_OBJECT').Value := KodEdit.Value;
        pFIBStoredProc.ParamByName('ACTUAL_DATE').Value := Date;
        pFIBStoredProc.ParamByName('TYPE_OBJECT').Value := 1;
        try
            pFIBStoredProc.ExecProc;
        except on e: Exception do
            begin
                ShowMessage(e.Message);
                pFIBStoredProc.Close;
                Exit;
            end;
        end;
        SmetaEdit.DisplayText := pFIBStoredProc.FieldByName('TITLE_OBJECT').AsString;
        SmetaEdit.Value := pFIBStoredProc.FieldByName('ID_OBJECT').AsInteger;
        pFIBStoredProc.Close;
        kod_sm := StrToInt(KodEdit.Value);
    end;
end;

procedure TfrmPochasSmet.FormShow(Sender: TObject);
begin
    KodEdit.ShowFocus;
end;

procedure TfrmPochasSmet.KodEditKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = VK_RETURN then
    begin
        Key := 0;
        SmetaEdit.ShowFocus;
    end;
end;

procedure TfrmPochasSmet.HoursEditKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = VK_RETURN then
    begin
        Key := 0;
        btnOk.SetFocus;
    end;
end;

procedure TfrmPochasSmet.SmetaEditKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = VK_RETURN then
    begin
        Key := 0;
        HoursEdit.ShowFocus;
    end;
end;

procedure TfrmPochasSmet.cxCheckHourClick(Sender: TObject);
begin
    HoursEdit.Blocked := cxCheckHour.Checked;
    if HoursEdit.Blocked then HoursEdit.Value := Null;
end;

end.
