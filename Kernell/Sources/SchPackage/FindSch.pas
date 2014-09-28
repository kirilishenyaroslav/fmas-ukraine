unit FindSch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls, ActnList;

type
  TfrmSearchSch = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Edit1: TEdit;
    Label1: TLabel;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmSearchSch.cxButton1Click(Sender: TObject);
begin
  ModalResult:=mrYes;
end;

procedure TfrmSearchSch.cxButton2Click(Sender: TObject);
begin
  ModalResult:=mrNo;
end;

procedure TfrmSearchSch.Action1Execute(Sender: TObject);
begin
  ModalResult:=mrYes;
end;

procedure TfrmSearchSch.Action2Execute(Sender: TObject);
begin
  ModalResult:=mrNo;
end;

end.
