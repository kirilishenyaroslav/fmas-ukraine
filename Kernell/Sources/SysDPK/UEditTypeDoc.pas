unit UEditTypeDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, StdCtrls, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxButtons;

type
  TfrmEditDocType = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxTextEdit1: TcxTextEdit;
    cxTextEdit2: TcxTextEdit;
    SysLookUp: TcxLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    RegLookUp: TcxLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

uses SysMain;
{$R *.dfm}

procedure TfrmEditDocType.FormCreate(Sender: TObject);
begin
     SysLookUp.Properties.ListSource:=TfrmSysOptions(owner).SysUchDataSource;
     RegLookUp.Properties.ListSource:=TfrmSysOptions(owner).RegUchDataSource;
end;

procedure TfrmEditDocType.cxButton1Click(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfrmEditDocType.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

end.
