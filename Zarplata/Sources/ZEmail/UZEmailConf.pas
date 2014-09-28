unit UZEmailConf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxMaskEdit, cxSpinEdit, StdCtrls,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxButtons, ExtCtrls,
  cxCheckBox, cxDropDownEdit, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdMessageClient, IdIMAP4,
  IdExplicitTLSClientServerBase, cxMemo, ComCtrls;

type
  TfrmZEmailConf = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    IMAP: TIdIMAP4;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    SMTP_server: TcxTextEdit;
    Label2: TLabel;
    SMTP_port: TcxSpinEdit;
    Label11: TLabel;
    IMAP_port: TcxSpinEdit;
    Label3: TLabel;
    SMTP_user: TcxTextEdit;
    Label4: TLabel;
    SMTP_password: TcxTextEdit;
    Label5: TLabel;
    SMTP_account: TcxTextEdit;
    CheckHistoryMailBox: TcxCheckBox;
    HistoryMailBox: TcxComboBox;
    cxCheckBox1: TcxCheckBox;
    Label10: TLabel;
    Proxy_type: TcxComboBox;
    Label6: TLabel;
    Proxy_server: TcxTextEdit;
    Label7: TLabel;
    Proxy_port: TcxSpinEdit;
    Label8: TLabel;
    Proxy_user: TcxTextEdit;
    Label9: TLabel;
    Proxy_password: TcxTextEdit;
    Body_template: TcxMemo;
    Panel3: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    cxTextEdit1: TcxTextEdit;
    Label15: TLabel;
    Label16: TLabel;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Label17: TLabel;
    body_info_template: TcxMemo;
    Label18: TLabel;
    INFO_SUBJECT_TEMPLATE: TcxTextEdit;
    Panel4: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    body_pswrd_template: TcxMemo;
    Label23: TLabel;
    PSWRD_SUBJECT_TEMPLATE: TcxTextEdit;
    Panel5: TPanel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxCheckBox1Click(Sender: TObject);
    procedure CheckHistoryMailBoxPropertiesChange(Sender: TObject);
  private
     UsersFolders: TStringList;
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);reintroduce;
    destructor Destroy;override;
  end;

implementation

{$R *.dfm}

procedure TfrmZEmailConf.cxButton1Click(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfrmZEmailConf.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmZEmailConf.cxCheckBox1Click(Sender: TObject);
begin
     Proxy_server.Enabled:=cxCheckBox1.Checked;
     Proxy_port.Enabled:=cxCheckBox1.Checked;
     Proxy_user.Enabled:=cxCheckBox1.Checked;
     Proxy_password.Enabled:=cxCheckBox1.Checked;
     Proxy_type.Enabled:=cxCheckBox1.Checked;
end;

procedure TfrmZEmailConf.CheckHistoryMailBoxPropertiesChange(
  Sender: TObject);
  var i:Integer;
begin
     HistoryMailBox.Enabled:=CheckHistoryMailBox.Checked;

     if CheckHistoryMailBox.Checked
     then begin
               IMAP.Host    :=SMTP_server.Text;
               IMAP.Port    :=IMAP_port.EditValue;
               IMAP.Username:=SMTP_user.Text;
               IMAP.Password:=SMTP_password.Text;

               try

               IMAP.Connect;

               if  (IMAP.Connected)
               and ((IMAP.ConnectionState = csAuthenticated) or (IMAP.ConnectionState = csSelected))
               then begin
                         if Imap.ListMailBoxes(UsersFolders)
                         then begin
                                   for i := 0 to UsersFolders.Count-1 do
                                   begin
                                        HistoryMailBox.Properties.Items.Add(UsersFolders[i]);
                                   end;
                         end;
               end;

               except on E:Exception do
               begin


               end;

               end;
     end;
end;

constructor TfrmZEmailConf.Create(AOwner: TComponent);
begin
     inherited Create(AOwner);
     UsersFolders:=TStringList.Create;
     PageControl1.ActivePageIndex:=0;
end;

destructor TfrmZEmailConf.Destroy;
begin
     UsersFolders.Free;
     inherited Destroy;
end;

end.
