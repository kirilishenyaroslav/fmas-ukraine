unit uMnaNumAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons,
  cxControls, cxContainer, cxEdit, cxTextEdit;

type
  TNumAddForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cxAdd: TcxButton;
    cxCancel: TcxButton;
    ActionList1: TActionList;
    acAdd: TAction;
    acCansel: TAction;
    teInNum: TcxTextEdit;
    teZavNum: TcxTextEdit;
    tePasNum: TcxTextEdit;
    procedure acCanselExecute(Sender: TObject);
    procedure acAddExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NumAddForm: TNumAddForm;

implementation
                                        
{$R *.dfm}

procedure TNumAddForm.acCanselExecute(Sender: TObject);
begin
close;
end;

procedure TNumAddForm.acAddExecute(Sender: TObject);
begin
 Modalresult:=mrOk;
end;

end.
