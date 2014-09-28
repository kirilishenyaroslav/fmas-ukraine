unit TI_TaxInvoicesParamEducation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, ExtCtrls;

type
  TFormParamEducation = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    cxDateEditWorkDate: TcxDateEdit;
    RadioButtonEducation: TRadioButton;
    RadioButtonStCity: TRadioButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormParamEducation: TFormParamEducation;

implementation

{$R *.dfm}

procedure TFormParamEducation.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormParamEducation.Button1Click(Sender: TObject);
begin
  if (cxDateEditWorkDate.Text = '')then
  begin
    ShowMessage('Заповніть робочий період системи');
    cxDateEditWorkDate.SetFocus;
    Exit;
  end;
  ModalResult := mrOk;
end;

end.
