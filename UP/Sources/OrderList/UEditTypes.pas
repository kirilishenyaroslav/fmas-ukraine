unit UEditTypes;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, cxCheckBox, cxControls, cxContainer, cxEdit,
    cxTextEdit, ActnList;

type
    TfrmEditTypeInfo = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        Title: TcxTextEdit;
        BplName: TcxTextEdit;
        Label1: TLabel;
        Label2: TLabel;
        PrintProcedure: TcxTextEdit;
        Label3: TLabel;
        Is_Active: TcxCheckBox;
        Label4: TLabel;
        Label5: TLabel;
        PrintShablon: TcxTextEdit;
        ActionList1: TActionList;
        Action1: TAction;
        Action2: TAction;
        Label6: TLabel;
        use_logic_link: TcxCheckBox;
        Label7: TLabel;
        SHOW_IN_PCARD: TcxCheckBox;
        Label8: TLabel;
        is_cancel: TcxCheckBox;
        procedure OkButtonClick(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

implementation

{$R *.dfm}

procedure TfrmEditTypeInfo.OkButtonClick(Sender: TObject);
begin
    ModalResult := mrYes;
end;

procedure TfrmEditTypeInfo.CancelButtonClick(Sender: TObject);
begin
    ModalResult := mrNo;
end;

end.
