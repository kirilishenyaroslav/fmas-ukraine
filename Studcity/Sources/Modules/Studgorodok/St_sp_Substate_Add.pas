//***********************************************************************
//* Проект "Студгородок"                                                *
//* Добавление состояния субсидии                                       *
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//***********************************************************************
unit St_sp_Substate_Add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxButtons;

type
  TSubstate_Add_Form = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    Name_Edit: TcxTextEdit;
    Label1: TLabel;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OkButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Substate_Add_Form: TSubstate_Add_Form;

implementation

{$R *.dfm}

procedure TSubstate_Add_Form.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TSubstate_Add_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TSubstate_Add_Form.OkButtonClick(Sender: TObject);
begin
if Name_Edit.Text='' then begin
ShowMessage('Необходимо ввести наименование состояния');
Name_Edit.SetFocus;
exit;
end;
ModalResult:=mrOk;
end;

procedure TSubstate_Add_Form.FormShow(Sender: TObject);
begin
Name_Edit.SetFocus;
end;

end.
