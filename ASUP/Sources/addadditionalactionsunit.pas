unit AddAdditionalActionsUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, Spin, PersonalCommon, SpCommon, SpFormUnit,
    Mask, CheckEditUnit;

type
    TAddAdditionalActionsForm = class(TForm)
        Label1: TLabel;
        Label2: TLabel;
        TextEdit: TMemo;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        AddExist: TSpeedButton;
        PoryadokEdit: TCheckEdit;
        procedure OkButtonClick(Sender: TObject);
        procedure AddExistClick(Sender: TObject);
        procedure FormShow(Sender: TObject);
        procedure PoryadokEditKeyPress(Sender: TObject; var Key: Char);
    private
    { Private declarations }
    public
        ID_TYPE: Integer; // 2, 10
    end;

var
    AddAdditionalActionsForm: TAddAdditionalActionsForm;

implementation

uses TextShablonsUnit;

{$R *.dfm}

procedure TAddAdditionalActionsForm.OkButtonClick(Sender: TObject);
begin
    if ID_TYPE = 2
        then begin

        if (TextEdit.Text = '')
            then begin
            MessageDlg('Треба ввести текст додаткового пункту наказу!', mtError, [mbOk], 0);
            TextEdit.SetFocus;
            exit;
        end;

        ModalResult := mrOk;
    end;

    if (ID_TYPE = 10) or (ID_TYPE = 1) // Надбавки, премии
        then begin

        if (TextEdit.Text = '')
            then begin
            MessageDlg('Треба ввести текст пункту наказу!', mtError, [mbOk], 0);
            TextEdit.SetFocus;
            exit;
        end;

        ModalResult := mrOk;
    end;
end;

procedure TAddAdditionalActionsForm.AddExistClick(Sender: TObject);
var
    Form: TTextShablonsForm;
begin
    form := TTextShablonsForm.Create(Self);

    form.Prepare(ID_TYPE);

    if Form.ShowModal = mrOk
        then begin
        TextEdit.Text := Form.ResultQueryTEXT1.Value;
    end;

    form.Free;
end;

procedure TAddAdditionalActionsForm.FormShow(Sender: TObject);
begin

    if ID_TYPE = 2
        then begin
        PoryadokEdit.InputSet := isAll;
    end;

    if ID_TYPE = 10
        then begin
        Label1.Caption := 'Номер';
        PoryadokEdit.InputSet := isDigits;
    end;
end;

procedure TAddAdditionalActionsForm.PoryadokEditKeyPress(Sender: TObject;
    var Key: Char);
begin
    if (isDigits in [PoryadokEdit.InputSet]) // or (ID_TYPE = 10)
        then begin
        if ((Ord(Key) < Ord('0')) or (Ord(Key) > Ord('9'))) and
            (key <> #8)
            then key := Chr(0);
    end;
end;

end.
