unit uPochasTypeAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFControl, uLabeledFControl, uCharControl, StdCtrls, Buttons,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLabel;

type
  TfrmPochasTypeAdd = class(TForm)
    NameEdit: TqFCharControl;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    ZavKaf: TCheckBox;
    CBPriznakType: TcxComboBox;
    cxLabel1: TcxLabel;
    procedure OkButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    {}
  end;

implementation
uses qfTools, uPochasType;
{$R *.dfm}

procedure TfrmPochasTypeAdd.OkButtonClick(Sender: TObject);
begin
    if qFCheckAll(Self) then ModalResult := mrOk;
end;

procedure TfrmPochasTypeAdd.FormCreate(Sender: TObject);
var
    str: string;
    i: Integer;
begin
    str := '';
    for i := 1 to Length(PriznakList_Text) do
        str := str + PriznakList_Text[i] + #13;
    CBPriznakType.Properties.Items.Text := str;
    CBPriznakType.ItemIndex := 0; //по умолчанию почасовка ВУЗа
end;

end.
