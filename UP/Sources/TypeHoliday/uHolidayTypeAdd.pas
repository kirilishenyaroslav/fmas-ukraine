Unit uHolidayTypeAdd;

Interface

Uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uFControl, uLabeledFControl, uCharControl, StdCtrls, Buttons,
    uMemoControl, uIntControl, uBoolControl, ExtCtrls, uEnumControl,
    cxControls, cxContainer, cxEdit, cxCheckBox, cxLabel, cxTextEdit,
    cxMaskEdit, cxButtonEdit, CheckLst, DB,
    FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery, cxCheckListBox,
    uSpravControl, ActnList, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
    cxDBLookupComboBox;

Type
    TfrmHolidayTypeAdd = Class(TForm)
        NameEdit: TqFCharControl;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        ShortNameEdit: TqFCharControl;
        DaysEdit: TqFIntControl;
        MaxDaysEdit: TqFIntControl;
        TypeEdit: TqFEnumControl;
        IsMainHol: TcxCheckBox;
        IsPayHol: TcxCheckBox;
        Panel1: TPanel;
        NoteEdit: TcxTextEdit;
        cxLabel2: TcxLabel;
        HolidayPropList: TcxCheckListBox;
        ActiveCheck: TcxCheckBox;
        ParentCheck: TcxCheckBox;
        PrintPer: TcxCheckBox;
        CalcCheck: TcxCheckBox;
        PlanFactCheck: TcxCheckBox;
        DefaultDaysEdit: TqFIntControl;
        BtnVidOpl: TqFSpravControl;
        BtnTypeVihod: TqFSpravControl;
        ActionList1: TActionList;
        OkBtn: TAction;
        CancelBtn: TAction;
        IsPrintDays: TcxCheckBox;
        IsOldCheck: TcxCheckBox;
        GroupComboBox: TcxLookupComboBox;
        DSetGroupHoliday: TpFIBDataSet;
        DSGroupHoliday: TDataSource;
        lblGroup: TcxLabel;
        Procedure OkButtonClick(Sender: TObject);
        Procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
            AButtonIndex: Integer);
        Procedure BtnTypeVihodPropertiesButtonClick(Sender: TObject;
            AButtonIndex: Integer);
        Procedure HolidayPropListKeyUp(Sender: TObject; Var Key: Word;
            Shift: TShiftState);
        Procedure BtnVidOplOpenSprav(Sender: TObject; Var Value: Variant;
            Var DisplayText: String);
        Procedure BtnTypeVihodOpenSprav(Sender: TObject; Var Value: Variant;
            Var DisplayText: String);
        Procedure OkBtnExecute(Sender: TObject);
        Procedure CancelBtnExecute(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
        Mode: integer;
        Id_Holiday: Integer;
        AllPropQuery: tpFibDataSet;
        HolPropQuery: TpFibDataSet;
        Procedure BuildPropList;
        Procedure ReBuildPropList;

    End;

Implementation
Uses qfTools, uUnivSprav, RxMemDS, uHolidayType, BaseTypes;
{$R *.dfm}

Procedure TfrmHolidayTypeAdd.BuildPropList;
Begin

End;

Procedure TfrmHolidayTypeAdd.OkButtonClick(Sender: TObject);
Begin
    If qFCheckAll(Self) Then
        ModalResult := mrOk;
End;

Procedure TfrmHolidayTypeAdd.ReBuildPropList;
Begin
End;

Procedure TfrmHolidayTypeAdd.cxButtonEdit1PropertiesButtonClick(
    Sender: TObject; AButtonIndex: Integer);
Var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
Begin
    Params.FormCaption := 'Вид оплати';
    Params.ShowMode := fsmSelect;
    Params.ShowButtons := [fbExit];
    Params.TableName := 'Sp_VidOpl_Select(301)';
    Params.Fields := 'Name_VidOpl,Id_VidOpl';
    Params.FieldsName := 'Вид оплати';
    Params.KeyField := 'Id_VidOpl';
    Params.ReturnFields := 'Id_VidOpl,Name_VidOpl';
    Params.DBHandle := Integer((owner As TfrmHolidayType).Database.Handle);

    OutPut := TRxMemoryData.Create(self);

    If GetUnivSprav(Params, OutPut)
        Then
    Begin
        BtnVidOpl.DisplayText := VarToStr(output['Name_VidOpl']);
        BtnVidOpl.Value := VarAsType(output['Id_VidOpl'], varInt64);
    End;
End;

Procedure TfrmHolidayTypeAdd.BtnTypeVihodPropertiesButtonClick(
    Sender: TObject; AButtonIndex: Integer);
Var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
Begin
    Params.FormCaption := 'Типи виходів на роботу';
    Params.ShowMode := fsmSelect;
    Params.ShowButtons := [fbExit];
    Params.TableName := 'Sp_Vihod_Select';
    Params.Fields := 'Name_Full,NAME_SHORT,IS_WORK,ID_VIHOD';
    Params.FieldsName := 'Найменування,Скорочення,Вихід';
    Params.KeyField := 'Id_Vihod';
    Params.ReturnFields := 'ID_VIHOD,Name_Full';
    Params.DBHandle := Integer((owner As TfrmHolidayType).Database.Handle);

    OutPut := TRxMemoryData.Create(self);

    If GetUnivSprav(Params, OutPut)
        Then
    Begin
        BtnTypeVihod.DisplayText := VarToStr(output['Name_Full']);
        BtnTypeVihod.Value := VarAsType(output['ID_VIHOD'], varInt64);
    End;
End;

Procedure TfrmHolidayTypeAdd.HolidayPropListKeyUp(Sender: TObject;
    Var Key: Word; Shift: TShiftState);
Begin
    If (key = vk_Insert) Then
    Begin
        HolidayPropList.Items[HolidayPropList.ItemIndex].Checked := Not
            HolidayPropList.Items[HolidayPropList.ItemIndex].Checked;
        HolidayPropList.ItemIndex := HolidayPropList.ItemIndex + 1;
    End;

    If (key = vk_Space) Then
    Begin
        HolidayPropList.ItemIndex := HolidayPropList.ItemIndex + 1;
    End;
End;

Procedure TfrmHolidayTypeAdd.BtnVidOplOpenSprav(Sender: TObject;
    Var Value: Variant; Var DisplayText: String);
Var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
Begin
    Params.FormCaption := 'Вид оплати';
    Params.ShowMode := fsmSelect;
    Params.ShowButtons := [fbExit];
    Params.TableName := 'Sp_VidOpl_Select(301)';
    Params.Fields := 'Name_VidOpl,Id_VidOpl';
    Params.FieldsName := 'Вид оплати';
    Params.KeyField := 'Id_VidOpl';
    Params.ReturnFields := 'Id_VidOpl,Name_VidOpl';
    Params.DBHandle := Integer((owner As TfrmHolidayType).Database.Handle);

    OutPut := TRxMemoryData.Create(self);

    If GetUnivSprav(Params, OutPut)
        Then
    Begin
        DisplayText := VarToStr(output['Name_VidOpl']);
        Value := VarAsType(output['Id_VidOpl'], varInt64);
    End;
End;

Procedure TfrmHolidayTypeAdd.BtnTypeVihodOpenSprav(Sender: TObject;
    Var Value: Variant; Var DisplayText: String);
Var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
Begin
    Params.FormCaption := 'Типи виходів на роботу';
    Params.ShowMode := fsmSelect;
    Params.ShowButtons := [fbExit];
    Params.TableName := 'Sp_Vihod_Select';
    Params.Fields := 'Name_Full,NAME_SHORT,IS_WORK,ID_VIHOD';
    Params.FieldsName := 'Найменування,Скорочення,Вихід';
    Params.KeyField := 'Id_Vihod';
    Params.ReturnFields := 'ID_VIHOD,Name_Full';
    Params.DBHandle := Integer((owner As TfrmHolidayType).Database.Handle);

    OutPut := TRxMemoryData.Create(self);

    If GetUnivSprav(Params, OutPut)
        Then
    Begin
        DisplayText := VarToStr(output['Name_Full']);
        Value := VarAsType(output['ID_VIHOD'], varInt64);
    End;
End;

Procedure TfrmHolidayTypeAdd.OkBtnExecute(Sender: TObject);
Begin
    If qFCheckAll(Self) Then
    Begin
        If VarIsNull(GroupComboBox.EditValue) Then
        Begin
            If (owner As TfrmHolidayType).UseGroupHoliday Then
            Begin
                agMessageDlg('Увага!', 'Оберіть групу, до якої відноситься цей тип відпустки', mtConfirmation,
                    [mbYes]);
                GroupComboBox.SetFocus;
            End
            Else
            Begin
                GroupComboBox.EditValue := (owner As TfrmHolidayType).IdGroupAnnualHoliday;
                ModalResult := mrOk;
            End
        End
        Else
            ModalResult := mrOk;
    End;
End;

Procedure TfrmHolidayTypeAdd.CancelBtnExecute(Sender: TObject);
Begin
    Close;
End;

End.

