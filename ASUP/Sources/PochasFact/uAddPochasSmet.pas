unit uAddPochasSmet;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ActnList, FIBQuery, pFIBQuery, pFIBStoredProc, StdCtrls,
    Buttons, cxContainer, cxEdit, cxCheckBox, uIntControl, uCharControl,
    uFloatControl, uFControl, uLabeledFControl, uSpravControl, cxControls,
    cxGroupBox;

type
    TfrmAddPochasSmet = class(TForm)
        cxGroupBox1: TcxGroupBox;
        SmetaEdit: TqFSpravControl;
        HoursEdit: TqFFloatControl;
        KodEdit: TqFIntControl;
        btnOk: TBitBtn;
        btnCancel: TBitBtn;
        pFIBStoredProc: TpFIBStoredProc;
        ActionList1: TActionList;
        ActionSelect: TAction;
        procedure SmetaEditOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure SmetaEditKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure KodEditKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure KodEditChange(Sender: TObject);
        procedure btnOkClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
        kod_sm: integer;
    end;

var
    frmAddPochasSmet: TfrmAddPochasSmet;

implementation

{$R *.dfm}
uses GlobalSPR, fmPochasFactUnit, qfTools;

procedure TfrmAddPochasSmet.SmetaEditOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    smet: Variant;
begin
    smet := GetSmets(self, TfmPochasFact(Owner.Owner).LocalDatabase.Handle, Date, psmSmetWithoutPeriod);
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

procedure TfrmAddPochasSmet.SmetaEditKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if Key = VK_RETURN then
    begin
        Key := 0;
        HoursEdit.ShowFocus;
    end;
end;

procedure TfrmAddPochasSmet.KodEditKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = VK_RETURN then
    begin
        Key := 0;
        SmetaEdit.ShowFocus;
    end;
end;

procedure TfrmAddPochasSmet.KodEditChange(Sender: TObject);
begin
    SmetaEdit.DisplayText := '';
    SmetaEdit.Value := Null;
    if VarIsNull(KodEdit.Value) then exit;
    if trim(KodEdit.Value) <> '' then
    begin
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

        if not (VarIsNull(pFIBStoredProc.FieldByName('ID_OBJECT').Value))
            then
        begin
            SmetaEdit.DisplayText := pFIBStoredProc.FieldByName('TITLE_OBJECT').AsString;
            SmetaEdit.Value := pFIBStoredProc.FieldByName('ID_OBJECT').AsInteger;
            kod_sm := StrToInt(KodEdit.Value);
        end
        else
        begin
            SmetaEdit.Value := Null;
            SmetaEdit.DisplayText := 'бюджет не знайдено!';
        end;
        pFIBStoredProc.Close;
    end;
end;

procedure TfrmAddPochasSmet.btnOkClick(Sender: TObject);
begin
    if not qFCheckAll(Self)
     then exit;
    ModalResult := mrOk;
end;

end.
