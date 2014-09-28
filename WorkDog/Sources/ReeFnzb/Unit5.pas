unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxControls, cxContainer, cxEdit, cxTextEdit, StdCtrls,
  cxButtons, ExtCtrls;

type
  TForm5 = class(TForm)
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Label14: TLabel;
    Num_edit: TcxTextEdit;
    Label5: TLabel;
    DateEdit: TcxDateEdit;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    procedure Action1Execute(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;



implementation

{$R *.dfm}

procedure TForm5.Action1Execute(Sender: TObject);
begin
  ModalResult:=mrYes;
end;

procedure TForm5.cxButton2Click(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TForm5.Action2Execute(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

end.
