unit UpComandFactSmet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, FIBQuery, pFIBQuery, pFIBStoredProc,
  uIntControl, uCharControl, uFloatControl, uFControl, uLabeledFControl,
  uSpravControl, cxControls, cxGroupBox, GlobalSPR;

type
  TFormAddSmet = class(TForm)
    cxGroupBox1: TcxGroupBox;
    SmetaEdit: TqFSpravControl;
    PercentEdit: TqFFloatControl;
    KodEdit: TqFIntControl;
    pFIBStoredProc: TpFIBStoredProc;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    procedure KodEditChange(Sender: TObject);
    procedure KodEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SmetaEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SmetaEditOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure PercentEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    DateBeg: TDate;
    kod_sm: Integer;
  end;

var
  FormAddSmet: TFormAddSmet;

implementation

{$R *.dfm}

procedure TFormAddSmet.KodEditChange(Sender: TObject);
begin
    SmetaEdit.DisplayText := '';
    SmetaEdit.Value := Null;
    If VarIsNull(KodEdit.Value) Then
        exit;
    If trim(VarToStr(KodEdit.Value)) <> '' Then
    Begin
        //  pFIBStoredProc.Database := pFIBDatabase;
        //  pFIBStoredProc.Transaction := pFIBTransactionWrite;
        //  pFIBTransactionWrite.DefaultDatabase := pFIBDatabase;
        Try
            pFIBStoredProc.Transaction.StartTransaction;
        Except
            On E: Exception Do
            Begin
                ShowMessage('123  ' + E.Message);
                exit;
            End;
        End;
        Try
            pFIBStoredProc.StoredProcName := 'PUB_GET_NAME_BUDG_BY_KOD';
            pFIBStoredProc.Prepare;
            pFIBStoredProc.ParamByName('NUM_OBJECT').Value := KodEdit.Value;
            pFIBStoredProc.ParamByName('ACTUAL_DATE').Value := DateBeg;
            pFIBStoredProc.ParamByName('TYPE_OBJECT').Value := 1;

            pFIBStoredProc.ExecProc;
        Except On e: Exception Do
            Begin
                ShowMessage(e.Message);
                pFIBStoredProc.Close;
                Exit;
            End;
        End;
        SmetaEdit.Value := pFIBStoredProc.FieldByName('ID_OBJECT').AsVariant;
        SmetaEdit.DisplayText := pFIBStoredProc.FieldByName('TITLE_OBJECT').AsString;
        pFIBStoredProc.Close;
        kod_sm := StrToInt(KodEdit.Value);
    End;
end;

procedure TFormAddSmet.KodEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    If Key = VK_RETURN Then
    Begin
        Key := 0;
        PercentEdit.ShowFocus;
    End;
end;

procedure TFormAddSmet.SmetaEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    If Key = VK_RETURN Then
    Begin
        Key := 0;
        PercentEdit.ShowFocus;
    End;
end;

procedure TFormAddSmet.SmetaEditOpenSprav(Sender: TObject; var Value: Variant;
  var DisplayText: String);
Var
    smet: Variant;
Begin
    smet := GetSmets(self, pFIBStoredProc.Database.Handle, DateBeg, psmSmetWithoutPeriod);
    If VarArrayDimCount(smet) > 0 Then
    Begin
        If smet[0] <> 0 Then
        Begin
            Value := smet[0];
            DisplayText := smet[2];
            kod_sm := smet[3];
            KodEdit.Value := kod_sm;
        End;
    End;
End;

procedure TFormAddSmet.OkButtonClick(Sender: TObject);
begin
    If (VarIsNull(SmetaEdit.Value))
        Then
    Begin
        MessageDlg('Оберіть фінансування відрядження!', mtError, [mbOk], 0);
        SmetaEdit.SetFocus;
        Exit;
    End;
    If (VarIsNull(PercentEdit.Value))
        Then
    Begin
        MessageDlg('Вкажіть відсоток фінансування!', mtError, [mbOk], 0);
        PercentEdit.SetFocus;
        Exit;
    End;
    If ((PercentEdit.Value < 0) or (PercentEdit.Value > 100)) then
    begin
        MessageDlg('Відсоток фінансування має бути в межах від 0 до 100!', mtError, [mbOk], 0);
        PercentEdit.SetFocus;
        Exit;
    end;
    ModalResult := mrOk;
end;

procedure TFormAddSmet.CancelButtonClick(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure TFormAddSmet.PercentEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    If Key = VK_RETURN Then
    Begin
        Key := 0;
        OkButton.SetFocus;
    End;
end;

end.
