unit sysSendMessageUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, cxMemo,
  StdCtrls, cxRadioGroup, cxGroupBox, cxCheckBox, cxLookAndFeelPainters,
  ExtCtrls, cxButtons, SysAdmin;

type
  TfrmSendMessage = class(TForm)
    cxLabel1: TcxLabel;
    cxGroupBox1: TcxGroupBox;
    cxRadioButton1: TcxRadioButton;
    cxRadioButton2: TcxRadioButton;
    cxRadioButton3: TcxRadioButton;
    cxRadioButton5: TcxRadioButton;
    cxRadioButton6: TcxRadioButton;
    cxButton1: TcxButton;
    SendButton: TcxButton;
    cxRadioButton7: TcxRadioButton;
    cxRadioButton8: TcxRadioButton;
    cxRadioButton9: TcxRadioButton;
    HourEdit: TcxTextEdit;
    MinEdit: TcxTextEdit;
    SecEdit: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxRadioButton4: TcxRadioButton;
    MessageEdit: TcxTextEdit;
    procedure cxButton1Click(Sender: TObject);
    procedure SendButtonClick(Sender: TObject);
    procedure cxRadioButton1Click(Sender: TObject);
    procedure cxRadioButton2Click(Sender: TObject);
    procedure cxRadioButton3Click(Sender: TObject);
    procedure cxRadioButton4Click(Sender: TObject);
    procedure cxRadioButton5Click(Sender: TObject);
    procedure cxRadioButton6Click(Sender: TObject);
    procedure cxRadioButton7Click(Sender: TObject);
    procedure cxRadioButton8Click(Sender: TObject);
    procedure cxRadioButton9Click(Sender: TObject);
    procedure msgMemoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure cbActiveClick(Sender: TObject);
  public
    id_system, id_user : Integer;
    function ConvertTime(h, m, s : Integer) : Longint;
  end;

var
  frmSendMessage: TfrmSendMessage;

implementation
uses SysUsers;
{$R *.dfm}

function TfrmSendMessage.ConvertTime(h, m, s: Integer): Longint;
begin
 Result := s + m * 60 + h * 60 * 60;
end;

procedure TfrmSendMessage.cxButton1Click(Sender: TObject);
begin
 Close;
end;

procedure TfrmSendMessage.SendButtonClick(Sender: TObject);
begin
  if TfrmSysUsers(Owner).SendMode = smAllsystems then
  begin
    TfrmSysUsers(Owner).StoredProc.Transaction.StartTransaction;
    TfrmSysUsers(Owner).StoredProc.ExecProcedure('PROC_SYS_MESSAGES_ADD', [Integer(-1), MessageEdit.Text, Integer(-1), ConvertTime(StrToInt(HourEdit.Text), StrToInt(MinEdit.Text), StrToInt(SecEdit.Text))]);
    TfrmSysUsers(Owner).StoredProc.Transaction.Commit;
  end;
  if TfrmSysUsers(Owner).SendMode = smSystem then
  begin
    TfrmSysUsers(Owner).StoredProc.Transaction.StartTransaction;
    TfrmSysUsers(Owner).StoredProc.ExecProcedure('PROC_SYS_MESSAGES_ADD', [id_system, MessageEdit.Text, Integer(-1), ConvertTime(StrToInt(HourEdit.Text), StrToInt(MinEdit.Text), StrToInt(SecEdit.Text))]);
    TfrmSysUsers(Owner).StoredProc.Transaction.Commit;
  end;
  if TfrmSysUsers(Owner).SendMode = smUser then
  begin
    TfrmSysUsers(Owner).StoredProc.Transaction.StartTransaction;
    TfrmSysUsers(Owner).StoredProc.ExecProcedure('PROC_SYS_MESSAGES_ADD', [id_system, MessageEdit.Text, Integer(id_user), ConvertTime(StrToInt(HourEdit.Text), StrToInt(MinEdit.Text), StrToInt(SecEdit.Text))]);
    TfrmSysUsers(Owner).StoredProc.Transaction.Commit;
  end;
  ModalResult := mrOk;
end;

procedure TfrmSendMessage.cxRadioButton1Click(Sender: TObject);
begin
 HourEdit.Text := '0';
 MinEdit.Text  := '1';
 SecEdit.Text  := '0';
end;

procedure TfrmSendMessage.cxRadioButton2Click(Sender: TObject);
begin
 HourEdit.Text := '0';
 MinEdit.Text  := '15';
 SecEdit.Text  := '0';
end;

procedure TfrmSendMessage.cxRadioButton3Click(Sender: TObject);
begin
 HourEdit.Text := '0';
 MinEdit.Text  := '30';
 SecEdit.Text  := '0';
end;

procedure TfrmSendMessage.cxRadioButton4Click(Sender: TObject);
begin
 HourEdit.Text := '0';
 MinEdit.Text  := '45';
 SecEdit.Text  := '0';
end;

procedure TfrmSendMessage.cxRadioButton5Click(Sender: TObject);
begin
 HourEdit.Text := '1';
 MinEdit.Text  := '0';
 SecEdit.Text  := '0';
end;

procedure TfrmSendMessage.cxRadioButton6Click(Sender: TObject);
begin
 HourEdit.Text := '2';
 MinEdit.Text  := '0';
 SecEdit.Text  := '0';
end;

procedure TfrmSendMessage.cxRadioButton7Click(Sender: TObject);
begin
 HourEdit.Text := '6';
 MinEdit.Text  := '0';
 SecEdit.Text  := '0';
end;

procedure TfrmSendMessage.cxRadioButton8Click(Sender: TObject);
begin
 HourEdit.Text := '24';
 MinEdit.Text  := '0';
 SecEdit.Text  := '0';
end;

procedure TfrmSendMessage.cxRadioButton9Click(Sender: TObject);
begin
 HourEdit.Text := '48';
 MinEdit.Text  := '0';
 SecEdit.Text  := '0';
end;

procedure TfrmSendMessage.msgMemoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_RETURN then SendButton.SetFocus; 
end;

procedure TfrmSendMessage.FormShow(Sender: TObject);
begin
 MessageEdit.SetFocus;
end;

procedure TfrmSendMessage.cbActiveClick(Sender: TObject);
begin
{ cxGroupBox1.Visible := not cbActive.Checked;
 if cxGroupBox1.Visible then
 begin
   frmSendMessage.Height := 279;
 end
 else
 begin
   frmSendMessage.Height := 135;
 end;}
end;

end.
