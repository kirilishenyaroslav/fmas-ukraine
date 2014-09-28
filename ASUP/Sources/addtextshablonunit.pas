unit AddTextShablonUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, ExtCtrls, Buttons, ActnList, PersonalCommon;

type
    TAddTextShablonForm = class(TForm)
        Panel1: TPanel;
        Label1: TLabel;
        Memo1: TMemo;
        Panel2: TPanel;
        Label2: TLabel;
        Memo2: TMemo;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        ActionList: TActionList;
        OkAction: TAction;
        CancelAction: TAction;
        Panel3: TPanel;
        CheckBox1: TCheckBox;
        procedure FormShow(Sender: TObject);
        procedure OkActionExecute(Sender: TObject);
        procedure CancelActionExecute(Sender: TObject);
    private
    { Private declarations }
    public
        ID_TYPE: Integer;
    end;

var
    AddTextShablonForm: TAddTextShablonForm;

implementation

{$R *.dfm}

procedure TAddTextShablonForm.FormShow(Sender: TObject);
begin
    case ID_TYPE of
        1: begin
                Panel2.Visible := False;
                Caption := 'Шаблон пункту наказу';
                Label1.Caption := 'Текст';
            end;

        2: begin
                Panel2.Visible := False;
                Caption := 'Шаблон додаткового пункту наказу';
                Label1.Caption := 'Текст';
            end;
        3: begin
                Panel2.Visible := False;
                Caption := 'Особа, що візує наказ';
                Label1.Caption := 'П.І.Б.';
            end;
        4: begin
                Panel2.Visible := False;
                Caption := 'Особа, що ознайомлена з наказом';
                Label1.Caption := 'П.І.Б.';
            end;
        5: begin
                Panel2.Visible := False;
                Caption := 'Особа, що погоджує наказ';
                Label1.Caption := 'П.І.Б.';
            end;
        6: begin
                Caption := 'Особа, що підписує друковану версію наказу';
                Label1.Caption := 'П.І.Б.';
                Label2.Caption := 'Посада';

                if NewOrders then begin
                    Panel3.Visible := True;
                    CheckBox1.Caption := 'Автоматично додавати до нових наказів';
                end;
            end;
        7: begin
                Panel2.Visible := False;
                Caption := 'Друкована назва';
                Label1.Caption := 'Текст';
            end;
        8: begin
                Panel2.Visible := False;
                Caption := 'Вступ до наказу';
                Label1.Caption := 'Текст';
            end;
        9: begin
            //Panel2.Visible := False;
                if not NewOrders then
                    Caption := 'Виконавці наказів'
                else
                    Caption := 'Проект наказу вносить';

                Label1.Caption := 'П.І.П/б';
                Label2.Caption := 'Посада';
            end;
        10: begin
                Panel2.Visible := False;
                Caption := 'Текст пункту наказу';
                Label1.Caption := 'Текст';
            end;
        16: begin
                Panel2.Visible := False;
                Caption := 'Текст шаблону підстави';
                Label1.Caption := 'Текст';
            end;
        17: begin
                Panel2.Visible := False;
                Caption := 'Назва групи пунктів';
                Label1.Caption := 'Назва';
            end;
        13, 14, 15: begin
                Caption := 'Візуючий/Погоджуючий/Ознайомлений';
                Label1.Caption := 'П.І.Б.';
                Label2.Caption := 'Посада';

                if NewOrders then begin
                    Panel3.Visible := True;
                    CheckBox1.Caption := 'Автоматично додавати до нових наказів';
                end;
            end;
    end;
end;

procedure TAddTextShablonForm.OkActionExecute(Sender: TObject);
begin
    if (Memo1.Text = '') and (Panel1.Visible)
        then begin
        MessageDlg('Потрібно заповнити поле "' + Label1.Caption + '"', mtError, [mbOk], 0);
        ModalResult := mrNone;
        Memo1.SetFocus;
        exit;
    end;

    if (Memo2.Text = '') and (Panel2.Visible)
        then begin
        MessageDlg('Потрібно заповнити поле "' + Label2.Caption + '"', mtError, [mbOk], 0);
        ModalResult := mrNone;
        Memo2.SetFocus;
        exit;
    end;
end;

procedure TAddTextShablonForm.CancelActionExecute(Sender: TObject);
begin
    Close;
end;

end.
