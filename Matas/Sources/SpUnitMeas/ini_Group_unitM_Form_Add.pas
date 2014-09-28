unit ini_Group_UnitM_Form_Add;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ActnList, cxLookAndFeelPainters,
  cxButtons, cxControls, cxContainer, cxEdit, cxTextEdit;

type
  Tini_Group_UnitM_Form_Add1 = class(TForm)
    Label1: TLabel;
    ActionList1: TActionList;
    ActionExit: TAction;
    Name_Group_UnitM: TcxTextEdit;
    ApplyButton: TcxButton;
    Button2: TcxButton;
    procedure ApplyButtonClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Name_Group_UnitMKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionExitExecute(Sender: TObject);
  private
    { Private declarations }
  public
   destructor Destroy; override;
  end;

var
  id_Group_UnitM            : Integer;
implementation


{$R *.DFM}

destructor Tini_Group_UnitM_Form_Add1.Destroy;
begin
 inherited;
end;

procedure Tini_Group_UnitM_Form_Add1.ApplyButtonClick(Sender: TObject);
begin
 if Name_Group_UnitM.Text = '' then begin
  ShowMessage('¬ведить в≥рно назву групи одиниць вим≥ру');
  Exit;
 end;
 ModalResult := mrOk;
end;

procedure Tini_Group_UnitM_Form_Add1.Button2Click(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

procedure Tini_Group_UnitM_Form_Add1.Name_Group_UnitMKeyPress(
  Sender: TObject; var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  ApplyButton.SetFocus;
 end;
end;

procedure Tini_Group_UnitM_Form_Add1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure Tini_Group_UnitM_Form_Add1.ActionExitExecute(Sender: TObject);
begin
 Button2Click(Sender);
end;

end.

