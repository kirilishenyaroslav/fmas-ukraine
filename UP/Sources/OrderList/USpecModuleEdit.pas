unit USpecModuleEdit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, StdCtrls, Buttons,
    cxMaskEdit, cxButtonEdit;

type
    TfrmSpecModuleEdit = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        BplName: TcxTextEdit;
        cxtxtdtComment: TcxTextEdit;
        OrderTypeText: TcxButtonEdit;
        Label7: TLabel;
        Label1: TLabel;
        Label2: TLabel;
        procedure OrderTypeTextPropertiesButtonClick(Sender: TObject;
            AButtonIndex: Integer);
        procedure OkButtonClick(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
    private
    { Private declarations }
    public
        id_order_type: Integer;
    { Public declarations }
    end;



implementation

uses UpOrderList, RxmemDS, uUnivSprav, BaseTypes;

{$R *.dfm}

procedure TfrmSpecModuleEdit.OrderTypeTextPropertiesButtonClick(Sender: TObject;
    AButtonIndex: Integer);
var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
begin
    Params.FormCaption := 'Довідник типів наказів';
    Params.ShowMode := fsmSelect;
    Params.ShowButtons := [fbExit];
    Params.TableName := 'UP_DT_ORDER_TYPE_SEL_EX';
    Params.Fields := 'TYPE_NAME,ID_TYPE';
    Params.FieldsName := 'Назва';
    Params.KeyField := 'ID_TYPE';
    Params.ReturnFields := 'TYPE_NAME,ID_TYPE';
    Params.DBHandle := Integer(TUpOrderListForm(self.Owner.Owner).WorkDatabase.Handle);

    OutPut := TRxMemoryData.Create(self);

    if GetUnivSprav(Params, OutPut)
        then begin
        id_order_type := output['ID_TYPE'];
        OrderTypeText.Text := VarToStr(output['TYPE_NAME']);
    end;
end;

procedure TfrmSpecModuleEdit.OkButtonClick(Sender: TObject);
begin
    if (OrderTypeText.Text <> '')
        and (BplName.Text <> '')
        and (cxtxtdtComment.Text <> '')
        then ModalResult := mrYes
    else agShowMessage('Увага! Треба ввести всі атрибути спецоперації!');
end;

procedure TfrmSpecModuleEdit.CancelButtonClick(Sender: TObject);
begin
    ModalResult := mrNo;
end;

end.
