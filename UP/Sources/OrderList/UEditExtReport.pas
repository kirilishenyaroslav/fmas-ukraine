unit UEditExtReport;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxTextEdit, cxControls, cxContainer, cxEdit, cxMaskEdit,
    cxButtonEdit, StdCtrls, Buttons;

type
    TfrmGetExtReport = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        Label7: TLabel;
        OrderTypeText: TcxButtonEdit;
        ReportName: TcxTextEdit;
        Label1: TLabel;
        Label2: TLabel;
        ReportModule: TcxTextEdit;
        procedure OrderTypeTextPropertiesButtonClick(Sender: TObject;
            AButtonIndex: Integer);
        procedure OkButtonClick(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
        id_order_type: integer;
    end;


implementation

uses UpOrderList, RxmemDS, uUnivSprav;

{$R *.dfm}

procedure TfrmGetExtReport.OrderTypeTextPropertiesButtonClick(
    Sender: TObject; AButtonIndex: Integer);
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

procedure TfrmGetExtReport.OkButtonClick(Sender: TObject);
begin
    ModalResult := mrYes;
end;

procedure TfrmGetExtReport.CancelButtonClick(Sender: TObject);
begin
    ModalResult := mrNo;
end;

end.
