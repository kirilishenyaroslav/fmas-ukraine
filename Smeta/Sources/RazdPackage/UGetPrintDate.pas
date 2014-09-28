unit UGetPrintDate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, ibase, cxCheckBox;

type
  TfrmPrintConfigure = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxDateEdit1: TcxDateEdit;
    Label1: TLabel;
    cxCheckBox1: TcxCheckBox;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;dbhandle:Tisc_db_handle);reintroduce;
  end;

implementation

uses DateUtils;

{$R *.dfm}

constructor TfrmPrintConfigure.Create(AOwner: TComponent;
  dbhandle: Tisc_db_handle);
begin
     inherited Create(AOwner);
     cxDateEdit1.Date:=StartOfTheMonth(date);
end;

procedure TfrmPrintConfigure.cxButton1Click(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfrmPrintConfigure.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

end.
