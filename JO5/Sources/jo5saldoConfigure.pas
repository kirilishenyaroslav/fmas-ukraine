unit jo5saldoConfigure;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxCheckBox, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxButtonEdit, cxRadioGroup, Placemnt, cxDropDownEdit, cxCalendar;

type
  TfrmJO5GetConfInfo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    ShowSmGr: TcxCheckBox;
    ShowSm: TcxCheckBox;
    ShowRz: TcxCheckBox;
    ShowSt: TcxCheckBox;
    ShowKv: TcxCheckBox;
    Label5: TLabel;
    Bevel3: TBevel;
    edTypeSmGrInfo: TcxRadioGroup;
    edTypeSmInfo: TcxRadioGroup;
    edTypeRzInfo: TcxRadioGroup;
    edTypeStInfo: TcxRadioGroup;
    edTypeKvInfo: TcxRadioGroup;
    cxButton2: TcxButton;
    FormStorage1: TFormStorage;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    DateBeg:TDateTime;
    constructor Create(AOwner:TComponent);overload;
  end;

implementation

{$R *.dfm}

constructor TfrmJO5GetConfInfo.Create(AOwner: TComponent);
begin
     inherited Create(AOwner);
end;

procedure TfrmJO5GetConfInfo.cxButton1Click(Sender: TObject);
begin
     if ShowSmGr.Checked
     or ShowSm.Checked
     or ShowRz.Checked
     or ShowSt.Checked
     or ShowKv.Checked
     then ModalResult:=mrYes
     else ShowMessage('Не вибрано жодного крітерію.');
end;

procedure TfrmJO5GetConfInfo.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmJO5GetConfInfo.FormShow(Sender: TObject);
begin
     PostMessage(TForm(Owner.Owner).Handle,WM_PAINT,0,0);
end;

end.
