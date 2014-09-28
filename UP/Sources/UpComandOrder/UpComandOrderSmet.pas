unit UpComandOrderSmet;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ActnList, FIBQuery, pFIBQuery, pFIBStoredProc, uIntControl,
    uCharControl, uFloatControl, uFControl, uLabeledFControl, uSpravControl,
    cxControls, cxGroupBox, StdCtrls, Buttons, GlobalSPR;

type
    TFormComandSmet = class(TForm)
        btnOk: TBitBtn;
        btnCancel: TBitBtn;
        cxGroupBox1: TcxGroupBox;
        SmetaEdit: TqFSpravControl;
        PercentEdit: TqFFloatControl;
        KodEdit: TqFIntControl;
        pFIBStoredProc: TpFIBStoredProc;
        procedure SmetaEditKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure SmetaEditOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure KodEditChange(Sender: TObject);
        procedure btnOkClick(Sender: TObject);
        procedure btnCancelClick(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure KodEditKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure PercentEditKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
    private
        { Private declarations }
    public
        DateBeg: TDate;
        kod_sm: Integer;
        { Public declarations }
    end;

var
    FormComandSmet: TFormComandSmet;

implementation

uses
    qFTools;

{$R *.dfm}

procedure TFormComandSmet.SmetaEditKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = VK_RETURN then
    begin
        Key := 0;
        PercentEdit.ShowFocus;
    end;
end;

procedure TFormComandSmet.SmetaEditOpenSprav(Sender: TObject; var Value: Variant;
    var DisplayText: string);
var
    smet: Variant;
begin
    smet := GetSmets(self, pFIBStoredProc.Database.Handle, DateBeg, psmSmetWithoutPeriod);
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

procedure TFormComandSmet.KodEditChange(Sender: TObject);
begin
    SmetaEdit.DisplayText := '';
    SmetaEdit.Value := Null;
    if VarIsNull(KodEdit.Value) then
        exit;
    if trim(VarToStr(KodEdit.Value)) <> '' then
    begin
        //  pFIBStoredProc.Database := pFIBDatabase;
        //  pFIBStoredProc.Transaction := pFIBTransactionWrite;
        //  pFIBTransactionWrite.DefaultDatabase := pFIBDatabase;
        try
            pFIBStoredProc.Transaction.StartTransaction;
        except
            on E: Exception do
            begin
                ShowMessage('123  ' + E.Message);
                exit;
            end;
        end;
        try
            pFIBStoredProc.StoredProcName := 'PUB_GET_NAME_BUDG_BY_KOD';
            pFIBStoredProc.Prepare;
            pFIBStoredProc.ParamByName('NUM_OBJECT').Value := KodEdit.Value;
            pFIBStoredProc.ParamByName('ACTUAL_DATE').Value := DateBeg;
            pFIBStoredProc.ParamByName('TYPE_OBJECT').Value := 1;

            pFIBStoredProc.ExecProc;
        except on e: Exception do
            begin
                ShowMessage(e.Message);
                pFIBStoredProc.Close;
                Exit;
            end;
        end;
        SmetaEdit.Value := pFIBStoredProc.FieldByName('ID_OBJECT').AsVariant;
        SmetaEdit.DisplayText := pFIBStoredProc.FieldByName('TITLE_OBJECT').AsString;
        pFIBStoredProc.Close;
        kod_sm := StrToInt(KodEdit.Value);
    end;
end;

procedure TFormComandSmet.btnOkClick(Sender: TObject);
begin
    if (VarIsNull(SmetaEdit.Value))
        then
    begin
        MessageDlg('Оберіть фінансування відрядження!', mtError, [mbOk], 0);
        SmetaEdit.SetFocus;
        Exit;
    end;
    if (VarIsNull(PercentEdit.Value))
        then
    begin
        MessageDlg('Вкажіть відсоток фінансування!', mtError, [mbOk], 0);
        PercentEdit.SetFocus;
        Exit;
    end;
    if ((PercentEdit.Value < 0) or (PercentEdit.Value > 100)) then
    begin
        MessageDlg('Відсоток фінансування має бути в межах від 0 до 100!', mtError, [mbOk], 0);
        PercentEdit.SetFocus;
        Exit;
    end;
    ModalResult := mrOk;
end;

procedure TFormComandSmet.btnCancelClick(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure TFormComandSmet.OkButtonClick(Sender: TObject);
begin
    if (not VarIsNull(SmetaEdit.Value) and not VarIsNull(PercentEdit.Value))
        then
        ModalResult := mrOk;
end;

procedure TFormComandSmet.KodEditKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = VK_RETURN then
    begin
        Key := 0;
        PercentEdit.ShowFocus;
    end;
end;

procedure TFormComandSmet.PercentEditKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if Key = VK_RETURN then
    begin
        Key := 0;
        btnOk.SetFocus;
    end;
end;

end.
