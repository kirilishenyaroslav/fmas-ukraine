unit uViewMnaKart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxDBEdit, StdCtrls, uDocWorkOstForm,
  ActnList, DB;

type
  TMNAViewForm = class(TForm)
    lbl2: TLabel;
    cxDBTextEdit9: TcxDBTextEdit;
    lbl3: TLabel;
    cxDBTextEdit8: TcxDBTextEdit;
    lbl4: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    lbl5: TLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    lbl6: TLabel;
    cxDBTextEdit5: TcxDBTextEdit;
    actlst1: TActionList;
    act1: TAction;
    ds1: TDataSource;
    procedure act1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MNAViewForm: TMNAViewForm;

implementation

{$R *.dfm}

procedure TMNAViewForm.act1Execute(Sender: TObject);
begin
Close;
end;

end.
