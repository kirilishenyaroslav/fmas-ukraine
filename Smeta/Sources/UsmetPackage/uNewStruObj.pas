unit uNewStruObj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ActnList;

type
  TfrmSelectNewObjType = class(TForm)
    Button1: TButton;
    Button2: TButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

procedure TfrmSelectNewObjType.Button1Click(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfrmSelectNewObjType.Button2Click(Sender: TObject);
begin
    ModalResult:=mrNO;
end;

procedure TfrmSelectNewObjType.Action1Execute(Sender: TObject);
begin
     Button1.OnClick(self);
end;

procedure TfrmSelectNewObjType.Action2Execute(Sender: TObject);
begin
     Button2.OnClick(self);
end;

end.
