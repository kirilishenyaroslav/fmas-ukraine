Unit UpChange_BonusForm;

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
    cxMaskEdit, cxDropDownEdit, cxRadioGroup;

Type
    TfmChange_Bonus = Class(TForm)
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
        RndComboBox: TcxComboBox;
        cxLblCurEdit: TcxLabel;
        CurValue: TcxCurrencyEdit;
    ProcentEdit: TcxCurrencyEdit;
    RecalcEdit: TcxCurrencyEdit;
    cxRBSum: TRadioButton;
    cxRBProc: TRadioButton;
        Procedure CancelActionExecute(Sender: TObject);
        Procedure EditForRecalcClick(Sender: TObject);
        Procedure EditForRoundClick(Sender: TObject);
        Procedure OkButtonClick(Sender: TObject);
    procedure cxRBSumClick(Sender: TObject);
    procedure cxRBProcClick(Sender: TObject);
    Private
         { Private declarations }
    Public
        IdManBonus, SpType: Integer;
        IdOrder: Int64;
        Constructor Create(AOwner: TComponent;
            Db_Handle: TISC_DB_HANDLE;
            id_order: int64); Reintroduce;
    End;

Implementation

Uses BaseTypes, AccMgmt, FIBQuery, UpKernelUnit;

{$R *.dfm}

Procedure TfmChange_Bonus.CancelActionExecute(Sender: TObject);
Begin
    ModalResult := mrCancel;
End;

Constructor TfmChange_Bonus.Create(AOwner: TComponent; Db_Handle: TISC_DB_HANDLE; id_order: int64);
Var SummaSet, ProverkaSet: TpFIBDataSet;
Begin
    Inherited Create(AOwner);
    WorkDatabase.Handle := Db_Handle;
    ReadTransaction.StartTransaction;
    StartHistory(ReadTransaction);
    self.IdOrder := id_order;
/////////проверка id_calp_type
    ProverkaSet := TpFIBDataSet.Create(Self);
    ProverkaSet.Database := WorkDatabase;
    ProverkaSet.Transaction := ReadTransaction;

    ProverkaSet.SelectSQL.Text := 'Select R.ID_CALC_TYPE as CTYPE  from UP_DT_MAN_CHECK_CALP_TYPE(:id_order) R';
    Try
        ProverkaSet.ParamByName('Id_Order').AsInt64 := self.IdOrder;
        ProverkaSet.Active := true;
        if ( ProverkaSet['CTYPE']<>1 )then
        begin
            messageBox(0, PChar('Неможливо перерахувати суму наказу,'+#13#10+
            'тому що в наказі є надбавки залежні від окладу!'), 'Помилка!', MB_OK);
            ModalResult := mrCancel;
            Self.Free;
        end;
    Except
        On E: Exception Do
            Begin
                messageBox(0, PChar('Помилка при підрахунку суми наказу!'), 'Помилка!', MB_OK);
                Exit;
            End;
    End;

/////////////////////////////////
    SummaSet := TpFIBDataSet.Create(Self);
    SummaSet.Database := WorkDatabase;
    SummaSet.Transaction := ReadTransaction;

    SummaSet.SelectSQL.Text := 'Select Sum(Mbs.Summa) as CurSumma from UP_DT_MAN_BONUS_INST Mbb, Up_Dt_Order_Items_Inst I,';
    SummaSet.SelectSQL.Text := SummaSet.SelectSQL.Text + 'Up_Dt_Orders O, Up_Dt_Man_BONUS_Smet_Inst Mbs Where Mbb.Id_Order_Item=I.Id_Item ';
    SummaSet.SelectSQL.Text := SummaSet.SelectSQL.Text + 'and  Mbb.id_man_bonus_inst = mbs.id_man_bonus_inst And I.Id_Order=O.Id_Order And O.Id_Order=:Id_Order';
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

Procedure TfmChange_Bonus.EditForRecalcClick(Sender: TObject);
Begin
    cxRBSum.Enabled := EditForRecalc.Checked;
    cxRBProc.Enabled :=EditForRecalc.Checked;
    cxRBSum.Checked:=true;
    cxRBProc.Checked:=false;
    RecalcEdit.Enabled := EditForRecalc.Checked;
    //ProcentEdit.Enabled:= EditForRecalc.Checked;

End;

Procedure TfmChange_Bonus.EditForRoundClick(Sender: TObject);
Begin
    RndComboBox.Enabled := EditForRound.Checked;
End;

Procedure TfmChange_Bonus.OkButtonClick(Sender: TObject);
Var UpdateSP: TpFibStoredProc; i, rnd_value: integer;
Begin
    If EditForRecalc.Checked
        Then Begin
            if (cxRBProc.Checked)Then
            begin
                RecalcEdit.Value := ProcentEdit.Value*CurValue.Value/100;
            end;
            if  RecalcEdit.Value >0 then
            begin
                UpdateSP := TpFibStoredProc.Create(self);
                UpdateSP.Database := WorkDatabase;
                UpdateSP.Transaction := WriteTransaction;
                WriteTransaction.StartTransaction;
                StartHistory(WriteTransaction);
                UpdateSP.StoredProcName := 'UP_DT_MAN_BONUS_INST_RECALC';
                UpdateSP.Prepare;
                UpdateSP.ParamByName('ID_ORDER').asInt64 := self.IdOrder;
                UpdateSP.ParamByName('SUMMA_RECALC').AsExtended := RecalcEdit.Value;
                UpdateSP.ExecProc;
                UpdateSP.Close;
                UpdateSP.Free;
                WriteTransaction.Commit;
            end
        End;

    If EditForRound.Checked
        Then Begin
            UpdateSP := TpFibStoredProc.Create(self);
            UpdateSP.Database := WorkDatabase;
            UpdateSP.Transaction := WriteTransaction;
            WriteTransaction.StartTransaction;
            StartHistory(WriteTransaction);
            UpdateSP.StoredProcName := 'UP_DT_MAN_BONUS_INST_ROUND';
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

procedure TfmChange_Bonus.cxRBSumClick(Sender: TObject);
begin
if cxRBSum.Checked  then
begin
    cxRBProc.Checked := false;
    RecalcEdit.Enabled:=true;
    ProcentEdit.Enabled:=false;

end;
end;

procedure TfmChange_Bonus.cxRBProcClick(Sender: TObject);
begin
if cxRBProc.Checked  then
begin
    cxRBSum.Checked:= false;
    RecalcEdit.Enabled:=false;
    ProcentEdit.Enabled:=true;
end;
end;

End.

