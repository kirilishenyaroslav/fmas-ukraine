unit uSynchEDBO_select;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxCheckBox;

type
  TfrmSynchEDBO_select = class(TForm)
    CheckBox_facul: TcxCheckBox;
    CheckBox_spec: TcxCheckBox;
    CheckBox_okr: TcxCheckBox;
    CheckBox_kurs: TcxCheckBox;
    CheckBox_group: TcxCheckBox;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSynchEDBO_select: TfrmSynchEDBO_select;

implementation

{$R *.dfm}

procedure TfrmSynchEDBO_select.cxButton2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmSynchEDBO_select.cxButton1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
