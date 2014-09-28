unit uAddCommonPremia;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, uBoolControl, uFControl, uLabeledFControl,
    uCharControl, uIntControl, uSpravControl, SpComboBox, uLogicCheck,
    uFloatControl;

type
    TfmAddCommonPremia = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        ITRCheck: TCheckBox;
        WorkersPremia: TqFBoolControl;
        Department: TqFSpravControl;
        Label1: TLabel;
        Label2: TLabel;
        ITR_Vidopl: TSpComboBox;
        Label3: TLabel;
        NumItemEdit: TEdit;
        SelectNumItemButton: TButton;
        qFLogicCheck1: TqFLogicCheck;
        Label4: TLabel;
        Workers_Vidopl: TSpComboBox;
        ITRPercent: TqFFloatControl;
        procedure DepartmentOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure ITRCheckClick(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure SelectNumItemButtonClick(Sender: TObject);
        procedure qFLogicCheck1Check(Sender: TObject; var Error: string);
    private
        Id_Order: Integer;
        ActualDate: TDate;
    public
        constructor Create(AOwner: TComponent;
            Id_Order: Integer; ActualDate: TDate); reintroduce;
    end;

var
    fmAddCommonPremia: TfmAddCommonPremia;

implementation

{$R *.dfm}

uses DepartmentsViewUnit, PersonalCommon, qFTools, DtManBonusItemsUnit;

constructor TfmAddCommonPremia.Create(AOwner: TComponent;
    Id_Order: Integer; ActualDate: TDate);
begin
    inherited Create(AOwner);

    Self.ActualDate := ActualDate;
    Self.Id_Order := Id_Order;

    Department.Value := Consts_Query['Local_Department'];
    Department.DisplayText := DepNameQuery['Name_Full'];

    ITR_Vidopl.Prepare(19812);
    Workers_Vidopl.Prepare(19912);
end;

procedure TfmAddCommonPremia.DepartmentOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    form: TDepartmentsViewForm;
begin
    form := TDepartmentsViewForm.Create(Self);
    form.Prepare(True, ActualDate);
    form.CanSelectRoot := True;
    if form.ShowModal = mrOk then
        with form do
        begin
            Value := Selected_Id;
            DisplayText := ResultQuery['Name_Full'];
        end;
    form.Free;
end;

procedure TfmAddCommonPremia.ITRCheckClick(Sender: TObject);
begin
    if ITRCheck.Checked then
    begin
        ITRPercent.Required := True;
    end
    else
    begin
        ITRPercent.Value := Null;
        ITRPercent.Required := False;
    end;
end;

procedure TfmAddCommonPremia.OkButtonClick(Sender: TObject);
begin
    if not qFCheckAll(Self) then ModalResult := 0;
end;

procedure TfmAddCommonPremia.SelectNumItemButtonClick(Sender: TObject);
var
    form: TDtManBonusItemsForm;
begin
    Form := TDtManBonusItemsForm.Create(self);
    Form.id_order := ID_ORDER;
    Form.aID_TYPE := 1;

    Form.Prepare;

    if Form.ShowModal = mrOk
        then
    begin
        NumItemEdit.Text := IntToStr(form.ResultQueryNUM_ITEM.Value);
    end;

    Form.Free;
end;

procedure TfmAddCommonPremia.qFLogicCheck1Check(Sender: TObject;
    var Error: string);
begin
    if ITR_Vidopl.GetId < 0 then
    begin
        Error := 'Не заповнено поле "Тип премії"';
        ITR_Vidopl.SetFocus;
    end;

    if Workers_Vidopl.GetId < 0 then
    begin
        Error := 'Не заповнено поле "Тип премії"';
        Workers_Vidopl.SetFocus;
    end;

    if NumItemEdit.Text = '' then
    begin
        Error := 'Не заповнено поле "Пункт наказу"';
        NumItemEdit.SetFocus;
    end;
end;

end.
