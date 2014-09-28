Unit UpChangePremiaForm;

Interface

Uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uFormControl, ComCtrls, DB, FIBDataSet, pFIBDataSet, RxMemDS,
    FIBDatabase, pFIBDatabase, ActnList, StdCtrls, Buttons, uFControl,
    uInvisControl, uLabeledFControl, uSpravControl, uCommonSP, uCharControl,
    uDateControl, uFloatControl, ExtCtrls, cxControls, cxSplitter,
    qFTools, uSelectForm, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
    cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
    cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, uLogicCheck,
    uSimpleCheck, uBoolControl, GlobalSPR, uShtatUtils,
    Math, Ibase, cxLookAndFeelPainters, cxButtons, cxMemo, cxDBEdit,
    cxContainer, cxTextEdit, AppStruClasses, pFibStoredProc, Placemnt,
    uEnumControl, dxBar, dxBarExtItems, ImgList, DateUtils, cxCheckBox,
    AppEvnts, cxLabel, cxDBLabel, cxCurrencyEdit,
    cxMaskEdit, cxDropDownEdit;

Type
    TfmChangePremia = Class(TForm)
        KeyList: TActionList;
        WorkDatabase: TpFIBDatabase;
        ReadTransaction: TpFIBTransaction;
        WriteTransaction: TpFIBTransaction;
        CancelAction: TAction;
        BottomPanel: TPanel;
        Reform_Smet: TAction;
        MainOrderDataSet: TpFIBDataSet;
        Panel3: TPanel;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        GroupBox1: TGroupBox;
        EditForRound: TcxCheckBox;
        EditForRecalc: TcxCheckBox;
        RecalcEdit: TcxCurrencyEdit;
        RndComboBox: TcxComboBox;
        cxLblCurEdit: TcxLabel;
        CurValue: TcxCurrencyEdit;
        Procedure CancelActionExecute(Sender: TObject);
        Procedure EditForRecalcClick(Sender: TObject);
        Procedure EditForRoundClick(Sender: TObject);
        Procedure OkButtonClick(Sender: TObject);
    Private
         { Private declarations }
    Public
        IdManPremia, SpType: Integer;
        IdOrder: Int64;
        Constructor Create(AOwner: TComponent;
            Db_Handle: TISC_DB_HANDLE;
            id_order: int64); Reintroduce;
    End;

Implementation

Uses BaseTypes, AccMgmt, FIBQuery, UpKernelUnit;

{$R *.dfm}

Procedure TfmChangePremia.CancelActionExecute(Sender: TObject);
Begin
    ModalResult := mrCancel;
End;

Constructor TfmChangePremia.Create(AOwner: TComponent; Db_Handle: TISC_DB_HANDLE; id_order: int64);
Var SummaSet: TpFIBDataSet;
Begin
    Inherited Create(AOwner);
    WorkDatabase.Handle := Db_Handle;
    ReadTransaction.StartTransaction;
    StartHistory(ReadTransaction);
    self.IdOrder := id_order;

    SummaSet := TpFIBDataSet.Create(Self);
    SummaSet.Database := WorkDatabase;
    SummaSet.Transaction := ReadTransaction;

    SummaSet.SelectSQL.Text := 'Select Sum(Mbb.Summa) as CurSumma from Up_Dt_Man_Premia_Inst Mbb, Up_Dt_Order_Items_Inst I,';
    SummaSet.SelectSQL.Text := SummaSet.SelectSQL.Text + 'Up_Dt_Orders O Where Mbb.Id_Order_Item=I.Id_Item ';
    SummaSet.SelectSQL.Text := SummaSet.SelectSQL.Text + 'And I.Id_Order=O.Id_Order And O.Id_Order=:Id_Order';
    Try
        SummaSet.ParamByName('Id_Order').AsInt64 := self.IdOrder;
        SummaSet.Active := true;
    Except
        On E: Exception Do
            Begin
                messageBox(0, PChar('Помилка при підрахунку суми наказу!'), 'Помилка!', MB_OK);
                Exit;
            End;
    End;
    CurValue.Value := SummaSet['CurSumma']
End;

Procedure TfmChangePremia.EditForRecalcClick(Sender: TObject);
Begin
    RecalcEdit.Enabled := EditForRecalc.Checked;
End;

Procedure TfmChangePremia.EditForRoundClick(Sender: TObject);
Begin
    RndComboBox.Enabled := EditForRound.Checked;
End;

Procedure TfmChangePremia.OkButtonClick(Sender: TObject);
Var UpdateSP: TpFibStoredProc; i, rnd_value: integer;
Begin
    If EditForRecalc.Checked
        Then Begin
            UpdateSP := TpFibStoredProc.Create(self);
            UpdateSP.Database := WorkDatabase;
            UpdateSP.Transaction := WriteTransaction;
            WriteTransaction.StartTransaction;
            StartHistory(WriteTransaction);
            UpdateSP.StoredProcName := 'UP_DT_MAN_PREMIA_INST_RECALC';
            UpdateSP.Prepare;
            UpdateSP.ParamByName('ID_ORDER').asInt64 := self.IdOrder;
            UpdateSP.ParamByName('SUMMA_RECALC').AsExtended := RecalcEdit.Value;
            UpdateSP.ExecProc;
            UpdateSP.Close;
            UpdateSP.Free;
            WriteTransaction.Commit;
        End;

    If EditForRound.Checked
        Then Begin
            UpdateSP := TpFibStoredProc.Create(self);
            UpdateSP.Database := WorkDatabase;
            UpdateSP.Transaction := WriteTransaction;
            WriteTransaction.StartTransaction;
            StartHistory(WriteTransaction);
            UpdateSP.StoredProcName := 'UP_DT_MAN_PREMIA_INST_ROUND';
            UpdateSP.Prepare;
            UpdateSP.ParamByName('ID_ORDER').asInt64 := self.IdOrder;
            rnd_value := RndComboBox.ItemIndex;
            If rnd_value = -1 Then rnd_value := 0;
            UpdateSP.ParamByName('RND').AsInteger := rnd_value;
            UpdateSP.ExecProc;
            UpdateSP.Close;
            UpdateSP.Free;
            WriteTransaction.Commit;
        End;
    ModalResult := mrOk;
End;

End.

