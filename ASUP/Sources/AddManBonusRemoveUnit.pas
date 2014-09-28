unit AddManBonusRemoveUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ComCtrls, StdCtrls, Buttons, GoodFunctionsUnit, DtManBonusItemsUnit;

type
    TAddManBonusRemoveForm = class(TForm)
        Label9: TLabel;
        DateRemove: TDateTimePicker;
        Label10: TLabel;
        NumItemEdit: TEdit;
        SelectNumItemButton: TButton;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        procedure OkButtonClick(Sender: TObject);
        procedure SelectNumItemButtonClick(Sender: TObject);
    private
    { Private declarations }
    public
        id_order: Integer;
    end;

var
    AddManBonusRemoveForm: TAddManBonusRemoveForm;

implementation

{$R *.dfm}

procedure TAddManBonusRemoveForm.OkButtonClick(Sender: TObject);
begin
    if not CheckForFill(NumItemEdit, 'пункт наказу') then exit;

    ModalResult := mrOk;
end;

procedure TAddManBonusRemoveForm.SelectNumItemButtonClick(Sender: TObject);
var
    form: TDtManBonusItemsForm;
begin
    Form := TDtManBonusItemsForm.Create(self);
    Form.id_order := ID_ORDER;
    Form.aID_TYPE := 1;

    Form.Prepare;

    if Form.ShowModal = mrOk
        then begin
        NumItemEdit.Text := IntToStr(form.ResultQueryNUM_ITEM.Value);
    end;

    Form.Free;
end;

end.
