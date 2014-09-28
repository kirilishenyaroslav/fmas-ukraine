unit gr_Filter_DateSTFOND;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxLabel, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, StdCtrls, cxButtons;

type
  TFFilterStFond = class(TForm)
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    EditDateBeg: TcxDateEdit;
    cxLabel1: TcxLabel;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFilterStFond: TFFilterStFond;

implementation

{$R *.dfm}

procedure TFFilterStFond.cxButton1Click(Sender: TObject);
begin
 ModalResult:=mrYes;
end;

procedure TFFilterStFond.cxButton2Click(Sender: TObject);
begin
 ModalResult:=mrCANCEL;
end;

procedure TFFilterStFond.FormCreate(Sender: TObject);
begin
 EditDateBeg.EditValue:=Date;
end;

end.
