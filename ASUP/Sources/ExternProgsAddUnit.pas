unit ExternProgsAddUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons;

type
    TExternProgsAddForm = class(TForm)
        NameEdit: TEdit;
        FileEdit: TEdit;
        ParamsEdit: TEdit;
        Label1: TLabel;
        Label2: TLabel;
        Label3: TLabel;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        Button2: TButton;
        OpenDialog: TOpenDialog;
        procedure OkButtonClick(Sender: TObject);
        procedure Button2Click(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    ExternProgsAddForm: TExternProgsAddForm;

implementation

{$R *.dfm}

procedure TExternProgsAddForm.OkButtonClick(Sender: TObject);
begin
    if (NameEdit.Text = '')
        then
        MessageDlg('Потрібно ввести назву!', mtError, [mbOk], 0)
    else
        if (FileEdit.Text = '')
            then
            MessageDlg('Потрібно вибрати файл!', mtError, [mbOk], 0)
        else
            ModalResult := mrOk;
end;

procedure TExternProgsAddForm.Button2Click(Sender: TObject);
begin
    OpenDialog.Filter := 'Исполняемые файлы|*.exe';
    if OpenDialog.Execute then FileEdit.Text := OpenDialog.FileName;
end;

end.
