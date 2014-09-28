unit UAddEditBalance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxMaskEdit,
  cxDropDownEdit, cxLabel, cxControls, cxEdit, cxTextEdit,
  ExtCtrls, ActnList, cxContainer;

type
  TfrmAddEditBalance = class(TForm)
    TextEdit_BalanceName: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxComboBox1: TcxComboBox;
    Button_Ok: TcxButton;
    Button_Cancel: TcxButton;
    Panel1: TPanel;
    Panel2: TPanel;
    ActionList1: TActionList;
    act_OK: TAction;
    act_CANCEL: TAction;
    TextEdit_DKUD: TcxMaskEdit;
    TextEdit_KODU: TcxMaskEdit;
    cxLabel_CodeVyd: TcxLabel;
    TextEdit_CodeVyd: TcxTextEdit;
    procedure act_OKExecute(Sender: TObject);
    procedure act_CANCELExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses getBalance, UBalance;

{$R *.dfm}

procedure TfrmAddEditBalance.FormCreate(Sender: TObject);
begin
    self.Caption            := getBalance.frmCap_AddBalance;
    cxLabel1.Caption        := getBalance.column_BalanceName;
    cxLabel2.Caption        := getBalance.column_DKUD;
    cxLabel3.Caption        := getBalance.column_KODU;
    cxLabel4.Caption        := getBalance.column_RoundTo;
    cxLabel_CodeVyd.Caption := getBalance.column_CodeVydatkiv;
    Button_Ok.Caption       := getBalance.btn_Ok;
    Button_Cancel.Caption   := getBalance.btn_Cancel;
end;

procedure TfrmAddEditBalance.act_OKExecute(Sender: TObject);
var
  f: boolean;                         
begin
    f:=true;
    if Length(TextEdit_BalanceName.Text)=0  then f:=false;
    if Length(TextEdit_DKUD.Text)=0         then f:=false;
    if Length(TextEdit_KODU.Text)=0         then f:=false;
    if Length(TextEdit_CodeVyd.Text)=0      then f:=false;
    TextEdit_BalanceName.Text:=trim(TextEdit_BalanceName.Text);
    TextEdit_DKUD.Text:=trim(TextEdit_DKUD.Text);
    TextEdit_KODU.Text:=trim(TextEdit_KODU.Text);
    IF Length(TextEdit_BalanceName.Text)>0
    THEN ModalResult:=mrYes
    ELSE ShowMessage('Заповніть дані, будь ласка.');
end;

procedure TfrmAddEditBalance.act_CANCELExecute(Sender: TObject);
begin
    ModalResult:=mrCancel;
end;


end.
