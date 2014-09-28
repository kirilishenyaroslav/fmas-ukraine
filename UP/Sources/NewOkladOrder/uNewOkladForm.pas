unit uNewOkladForm;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ufmNewOklad, RxMemDS, StdCtrls, Buttons, ExtCtrls;

type
    TfmNewOklad = class(TForm)
        Frame: TfmNewOkladOrder;
        Panel3: TPanel;
        Label4: TLabel;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        procedure OkButtonClick(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
    private
        Outer_HWND: Variant;
    public
        constructor Create(AOwner: TComponent; Input: TRxMemoryData); reintroduce;
    end;

var
    fmNewOklad: TfmNewOklad;

implementation

{$R *.dfm}

uses AppStruClasses, uFormControl, qFTools;

constructor TfmNewOklad.Create(AOwner: TComponent; Input: TRxMemoryData);
begin
    inherited Create(AOwner);

    Self.Outer_HWND := Input['Outer_HWND'];

    Frame.Prepare(Input);
    if Input['Mode'] <> 0 then OkButton.Visible := False;

    BorderStyle := bsNone;
    BorderIcons := [];
    Visible := true;

    SendMessage(outer_hwnd, FMAS_MESS_GET_BUTTON_OK, OkButton.Handle, OkButton.Handle);
    SendMessage(outer_hwnd, FMAS_MESS_GET_BUTTON_CANCEL, CancelButton.Handle, CancelButton.Handle);
end;

procedure TfmNewOklad.OkButtonClick(Sender: TObject);
begin
    if Frame.Accept then
        SendMessage(outer_hwnd, FMAS_MESS_SAVE_ITEM_OK, 0, 0)
    else SendMessage(outer_hwnd, FMAS_MESS_SAVE_ITEM_ERR, 0, 0);
end;

procedure TfmNewOklad.CancelButtonClick(Sender: TObject);
begin
    if not Frame.InForm or (Frame.FormControl.Mode = fmInfo) or
        qFConfirm('Відмінити формування пункту наказу?')
        then
    begin
        qFAutoSaveIntoRegistry(Frame.Panel1);
        SendMessage(outer_hwnd, FMAS_MESS_CLOSE_FRAME, 0, 0);
    end;
end;

end.

