Unit UpPremiaOrderFormEditSm;

Interface

Uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uFControl, uLabeledFControl, uSpravControl, StdCtrls, Buttons,
    GlobalSPR, qFTools, uCommonSP, uCharControl, uFloatControl, uIntControl,
    DB, FIBDataSet, pFIBDataSet, cxControls, cxContainer, cxEdit, cxCheckBox,
    AppEvnts, cxLabel, cxDBLabel, ActnList;

Type
    TfmChangeSmeta = Class(TForm)
        Smeta: TqFSpravControl;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        NumSm: TqFIntControl;
        PubSprSmet: TpFIBDataSet;
        PubSprSmetID_SMETA: TFIBBCDField;
        PubSprSmetSMETA_TITLE: TFIBStringField;
        PubSprSmetSMETA_KOD: TFIBIntegerField;
        EditSumaForAll: TcxCheckBox;
        Summa: TqFFloatControl;
        ActionList1: TActionList;
        OKBut: TAction;
        EditBudgetForAll: TcxCheckBox;
        EditForAllPeople: TcxCheckBox;
        Procedure SmetaOpenSprav(Sender: TObject; Var Value: Variant;
            Var DisplayText: String);
        Procedure FormCreate(Sender: TObject);
        Procedure NumSmChange(Sender: TObject);
        Procedure OKButExecute(Sender: TObject);
        Procedure SummaKeyDown(Sender: TObject; Var Key: Word;
            Shift: TShiftState);
        Procedure NumSmKeyDown(Sender: TObject; Var Key: Word;
            Shift: TShiftState);
    private
        { Private declarations }
    public
        { Public declarations }
    End;

Implementation

Uses UpPremiaOrderForm;

{$R *.dfm}

Procedure TfmChangeSmeta.SmetaOpenSprav(Sender: TObject;
    Var Value: Variant; Var DisplayText: String);
Var
    id: variant;
Begin
    id := GlobalSPR.GetSmets(Owner, TfmPremiaOrder(Owner).WorkDatabase.Handle, Date, psmSmetWithoutPeriod);

    If (VarArrayDimCount(id) > 0) And (id[0] <> Null) Then
    Begin
        Value := id[0];
        DisplayText := IntToStr(id[3]) + '. ' + id[2];
    End;
End;

Procedure TfmChangeSmeta.FormCreate(Sender: TObject);
Begin
    //if (TfmPremiaOrder(self.Owner).IdType.Value=2) then Percent.Blocked:=True;
    //if (TfmPremiaOrder(self.Owner).IdType.Value=1) then Percent.Blocked:=False;
      {if  TfmPremiaOrder(Owner).RadioButton1.Checked
      then begin
                Summa.DisplayName   :='Відсоток';
      end
      else begin
                Summa.DisplayName   :='Сума';
      end;}
End;

Procedure TfmChangeSmeta.NumSmChange(Sender: TObject);
Begin
    If VarIsNull(NumSm.Value)
        Then
        exit;

    Try

        PubSprSmet.Database := TfmPremiaOrder(self.Owner).WorkDatabase;
        PubSprSmet.Transaction := TfmPremiaOrder(self.Owner).ReadTransaction;
        PubSprSmet.UpdateTransaction := TfmPremiaOrder(self.Owner).ReadTransaction;
        PubSprSmet.Close;
        PubSprSmet.ParamByName('smeta_kod').AsInteger := StrToInt(NumSm.Value);
        PubSprSmet.Open;
        PubSprSmet.FetchAll;

        If PubSprSmet.RecordCount = 1 Then
        Begin
            Smeta.Value := PubSprSmet['ID_SMETA'];
            Smeta.DisplayText := IntToStr(PubSprSmet['SMETA_KOD']) +
                '. ' + PubSprSmet['SMETA_TITLE'];
        End;

    Except On e: Exception Do
            ShowMessage(e.Message);
    End;
End;

Procedure TfmChangeSmeta.OKButExecute(Sender: TObject);
Begin
    If Not qFCheckAll(Self) Then
        exit;
    ModalResult := mrOk;
End;

Procedure TfmChangeSmeta.SummaKeyDown(Sender: TObject; Var Key: Word;
    Shift: TShiftState);
Begin
    If Key = VK_RETURN Then
        OkButton.SetFocus;
End;

Procedure TfmChangeSmeta.NumSmKeyDown(Sender: TObject; Var Key: Word;
    Shift: TShiftState);
Begin
    If Key = VK_RETURN Then
        Summa.ShowFocus;
End;

End.

