unit UP_HP_AddPeriod;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uLogicCheck, uSimpleCheck, uInvisControl, uDateControl, UP_HP_DM,
    uFControl, uLabeledFControl, uSpravControl, uFormControl, StdCtrls,
    Buttons, ExtCtrls, uAddModifForm, ActnList, uBoolControl, cxTextEdit,
    cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
    cxDBLookupComboBox, cxControls, cxContainer, cxEdit, cxLabel, DB,
    FIBDataSet, pFIBDataSet;

type
    THP_AddPeriod = class(TAddModifForm)
        BottomPanel: TPanel;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        qFFormControl1: TqFFormControl;
        qFSC_Moving: TqFSpravControl;
        qFDC_PBeg: TqFDateControl;
        qFDC_PEnd: TqFDateControl;
        qFIC_MBeg: TqFInvisControl;
        qFIC_MEnd: TqFInvisControl;
        qFSC_Interval1: TqFSimpleCheck;
        qFSC_Period: TqFSimpleCheck;
        qFSC_Interval2: TqFSimpleCheck;
        ActionList1: TActionList;
        SecretAction: TAction;
        OK: TAction;
        ESC: TAction;
        qfIgnoreCheck: TqFBoolControl;
        ActIgnoreCheck: TAction;
        lblGroup: TcxLabel;
        GroupComboBox: TcxLookupComboBox;
        qFIC_Group: TqFInvisControl;
        procedure qFSC_MovingOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure SecretActionExecute(Sender: TObject);
        procedure ESCExecute(Sender: TObject);
        procedure OKExecute(Sender: TObject);
        procedure ActIgnoreCheckExecute(Sender: TObject);
        procedure GroupComboBoxPropertiesEditValueChanged(Sender: TObject);
    private
        { Private declarations }
    public
        can_add_hol: Integer;
        WorkEnd: TDate;
        constructor Create(AOwner: TComponent; DMod: THP_DM; Mode: TFormMode; Where: Variant); reintroduce;
    end;

implementation

{$R *.dfm}

uses uUnivSprav, RxMemDS, uCommonSP, BaseTypes;

constructor THP_AddPeriod.Create(AOwner: TComponent; DMod: THP_DM; Mode: TFormMode; Where: Variant);
begin
    inherited Create(AOwner);
    DBHandle := Integer(DMod.pFIBD_HP.Handle);
    qfIgnoreCheck.Visible := False;
    qfIgnoreCheck.Value := False;

    DMod.pFIB_CAN_ADD.Open;
    can_add_hol := DMod.pFIB_CAN_ADDCAN_ADD_HOL_PROP.AsInteger;

    qFFormControl1.Prepare(DMod.pFIBD_HP, Mode, Where, Null);
    GroupComboBox.EditValue := qFIC_Group.Value;
end;

procedure THP_AddPeriod.qFSC_MovingOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
begin
    Screen.Cursor := crHourGlass;
    Params.FormCaption := 'Посада для надання планової відпустки';
    Params.ShowMode := fsmSelect;
    Params.ShowButtons := [fbExit];
    Params.TableName := 'UP_GET_MAN_MOVINGS2(' + IntToStr(AddParametrs['id_pcard']) + ')';
    Params.Fields := 'fio_tn,name_post,STAVOK,mov_beg,mov_end,id_work_dog_moving';
    Params.FieldsName := '~*ПІП/б,Посада,Ставок,Початок,Кінець';
    Params.KeyField := 'id_work_dog_moving';
    Params.ReturnFields := 'fio_tn,name_post,STAVOK,mov_beg,mov_end,id_work_dog_moving';
    Params.DBHandle := DBHandle;
    Params.AddParametrs := TRxMemoryData.Create(Self);
    Params.AddParametrs := AddParametrs;

    OutPut := TRxMemoryData.Create(self);
    try
        Screen.Cursor := crDefault;
        if GetUnivSprav(Params, OutPut) then
        begin
            value := VarAsType(output['id_work_dog_moving'], varInt64);
            qFDC_PBeg.Value := VarAsType(output['mov_beg'], varDate);
            qFDC_PEnd.Value := VarAsType(output['mov_end'], varDate);
            qFIC_MBeg.SetValue(output['mov_beg']);
            qFIC_MEnd.SetValue(output['mov_end']);
            WorkEnd := output['mov_end'];
            DisplayText := VarToStr(output['FIO_TN']) + ' : ' + VarToStr(output['name_post']);
        end;
    except on E: Exception do
        begin

        end;
    end;

end;

procedure THP_AddPeriod.SecretActionExecute(Sender: TObject);
begin
    qFSC_Interval1.CheckEnabled := False;
    qFSC_Interval2.CheckEnabled := False;
end;

procedure THP_AddPeriod.ESCExecute(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure THP_AddPeriod.OKExecute(Sender: TObject);
begin
    if (can_add_hol = 1) then
    begin
        qFSC_Interval1.CheckEnabled := False;
        qFSC_Interval2.CheckEnabled := False;
    end
    else
    begin
        qFSC_Interval1.CheckEnabled := True;
        qFSC_Interval2.CheckEnabled := True;
    end;

    if (WorkEnd < qFDC_PEnd.Value) then
    begin
        agMessageDlg('Увага', 'Дата кінця періода не може перевищувати дату кінця трудового договора!', mtInformation,
            [mbOK]);
        Exit;
    end;

    if qFDC_PBeg.Value = 0 then
    begin
        agMessageDlg('Увага', 'Поле "Початок періоду" не може бути пустим!', mtInformation, [mbOK]);
        Exit;
    end;

    if qFDC_PEnd.Value = 0 then
    begin
        agMessageDlg('Увага', 'Поле "Кінець періоду" не може бути пустим!', mtInformation, [mbOK]);
        Exit;
    end;

    qFFormControl1.Ok;
end;

procedure THP_AddPeriod.ActIgnoreCheckExecute(Sender: TObject);
begin
    qfIgnoreCheck.Visible := not qfIgnoreCheck.Visible;
end;

procedure THP_AddPeriod.GroupComboBoxPropertiesEditValueChanged(
    Sender: TObject);
begin
    qFIC_Group.Value := GroupComboBox.EditValue;
end;

initialization
    RegisterClass(THP_AddPeriod);

end.

