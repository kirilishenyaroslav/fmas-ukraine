unit UpComandOrderTargetAdd;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, ActnList, cxTextEdit, cxControls,
    cxContainer, cxEdit, cxLabel, BaseTypes;

type
    TFormTargetAdd = class(TForm)
        cxLabel2: TcxLabel;
        NameTE: TcxTextEdit;
        ActionList: TActionList;
        AcceptAction: TAction;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        procedure AcceptActionExecute(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    FormTargetAdd: TFormTargetAdd;

implementation

{$R *.dfm}

procedure TFormTargetAdd.AcceptActionExecute(Sender: TObject);
begin
    if (NameTE.Text = '') then
    begin
        agMessageDlg('Увага', 'Заповніть поле "Текст мети"', mtError, [mbOk]);
        NameTE.SetFocus;
        Exit;
    end;
    ModalResult := mrOk;
end;

end.
