unit Contracts_ViewReestrData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxLabel, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMemo, ActnList;

type
  TfmCnViewReestrData = class(TForm)
    cxButton1: TcxButton;
    cxTextNum: TcxTextEdit;
    cxTextData: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxTextNote: TcxMemo;
    ActionList1: TActionList;
    acExit: TAction;
    procedure cxButton1Click(Sender: TObject);
    procedure acExitExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmCnViewReestrData: TfmCnViewReestrData;

implementation

{$R *.dfm}

procedure TfmCnViewReestrData.cxButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TfmCnViewReestrData.acExitExecute(Sender: TObject);
begin
  Close;
end;

end.
