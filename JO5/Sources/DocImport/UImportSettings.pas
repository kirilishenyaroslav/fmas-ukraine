unit UImportSettings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, FIBDatabase,
  pFIBDatabase, Ibase, ExtCtrls, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxButtonEdit, ComCtrls;

type
  TfrmImportSettings = class(TForm)
    WorkDatabase: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    cxButtonEdit1: TcxButtonEdit;
    Label2: TLabel;
    cxButtonEdit2: TcxButtonEdit;
    Label3: TLabel;
    cxButtonEdit3: TcxButtonEdit;
    Label4: TLabel;
    cxButtonEdit4: TcxButtonEdit;
    Label5: TLabel;
    cxButtonEdit5: TcxButtonEdit;
    Label6: TLabel;
    cxButtonEdit6: TcxButtonEdit;
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Label7: TLabel;
    cxButtonEdit7: TcxButtonEdit;
    Label8: TLabel;
    cxButtonEdit8: TcxButtonEdit;
    Label9: TLabel;
    cxButtonEdit9: TcxButtonEdit;
    Label10: TLabel;
    cxButtonEdit10: TcxButtonEdit;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
    id_user:Int64;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent;DbHandle: TISC_DB_HANDLE; id_user: int64); reintroduce ;
  end;


implementation

{$R *.dfm}

constructor TfrmImportSettings.Create(AOwner: TComponent; DbHandle: TISC_DB_HANDLE; id_user: int64);
begin
     inherited Create(AOwner);
     self.id_user       :=id_user;
     WorkDatabase.Handle:=DbHandle;
     ReadTransaction.StartTransaction;
end;

procedure TfrmImportSettings.cxButton1Click(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfrmImportSettings.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

end.
