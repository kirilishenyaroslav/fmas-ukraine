unit UpComandOrderCityAdd;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, cxLookAndFeelPainters, ActnList, cxButtons,
    cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, BaseTypes, Buttons;

type
    TFormCityAdd = class(TForm)
        cxLabel2: TcxLabel;
        NameTE: TcxTextEdit;
        ActionList: TActionList;
        AcceptAction: TAction;
        CancelButton: TBitBtn;
        OkButton: TBitBtn;
        procedure AcceptActionExecute(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    FormCityAdd: TFormCityAdd;

implementation

{$R *.dfm}

procedure TFormCityAdd.AcceptActionExecute(Sender: TObject);
begin
    if (NameTE.Text = '') then
    begin
        agMessageDlg('Увага', 'Заповніть поле "Назва міста"', mtError, [mbOk]);
        NameTE.SetFocus;
        Exit;
    end;
    ModalResult := mrOk;

end;

end.
