unit uPochasTarifTypeAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFControl, uLabeledFControl, uCharControl, StdCtrls, Buttons;

type
  TfrmPochasTypeAdd = class(TForm)
    NameEdit: TqFCharControl;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    procedure OkButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation
uses qfTools;
{$R *.dfm}

procedure TfrmPochasTypeAdd.OkButtonClick(Sender: TObject);
begin
 if qFCheckAll(Self) then ModalResult := mrOk;
end;

end.
