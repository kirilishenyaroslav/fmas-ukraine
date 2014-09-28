unit UpPochasChangeSmetAdd;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, uIntControl, uCharControl, uFloatControl,
    uFControl, uLabeledFControl, uSpravControl, cxControls, cxGroupBox,
    FIBQuery, pFIBQuery, pFIBStoredProc, GlobalSPR, BaseTypes;

type
    TFormAddSmet = class(TForm)
        cxGroupBox1: TcxGroupBox;
        SmetaEdit: TqFSpravControl;
        ChangeEdit: TqFFloatControl;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        pFIBStoredProc: TpFIBStoredProc;
        ResultEdit: TqFFloatControl;
        AllEdit: TqFFloatControl;
        KodEdit: TqFIntControl;
        procedure KodEdit1Change(Sender: TObject);
        procedure ChangeEditChange(Sender: TObject);
        procedure KodEdit1KeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure SmetaEditKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure SmetaEditOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure OkButtonClick(Sender: TObject);
        procedure KodEditChange(Sender: TObject);
        procedure KodEditKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure SmetaEditChange(Sender: TObject);
    procedure ChangeEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    private
    { Private declarations }
    public
        DateBeg: TDate;
        kod_sm: integer;
    end;

var
    FormAddSmet: TFormAddSmet;

implementation

{$R *.dfm}

procedure TFormAddSmet.KodEdit1Change(Sender: TObject);
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
        pFIBStoredProc.Transaction.StartTransaction;
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

procedure TFormAddSmet.ChangeEditChange(Sender: TObject);
begin
    ResultEdit.Value := AllEdit.Value + ChangeEdit.Value;
end;

procedure TFormAddSmet.KodEdit1KeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = VK_RETURN then
    begin
        Key := 0;
        ChangeEdit.ShowFocus;
    end;

end;

procedure TFormAddSmet.SmetaEditKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = VK_RETURN then
    begin
        Key := 0;
        ChangeEdit.ShowFocus;
    end;

end;

procedure TFormAddSmet.SmetaEditOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
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

procedure TFormAddSmet.OkButtonClick(Sender: TObject);
begin
    if not VarIsNull(ChangeEdit.Value) then
    begin
        if ResultEdit.Value >= 0 then
            ModalResult := mrOk
        else agMessageDlg('Увага!', 'Помилка: погодинної праці не може бути менше 0!', mtError, [mbOk]);
    end;
end;

procedure TFormAddSmet.KodEditChange(Sender: TObject);
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
        pFIBStoredProc.Transaction.StartTransaction;
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

procedure TFormAddSmet.KodEditKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = VK_RETURN then
    begin
        Key := 0;
        ChangeEdit.ShowFocus;
    end;
end;

procedure TFormAddSmet.SmetaEditChange(Sender: TObject);
begin
    AllEdit.Value := 0;
end;

procedure TFormAddSmet.ChangeEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_RETURN then
    begin
        OkButtonClick(Self);
    end;
end;

end.

