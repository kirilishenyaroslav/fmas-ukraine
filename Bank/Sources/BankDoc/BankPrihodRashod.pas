unit BankPrihodRashod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ActnList, Un_R_file_Alex,
  cxControls, cxContainer, cxEdit, cxLabel;

type
  TfmBankPrihodRashod = class(TForm)
    cxButtonPrihod: TcxButton;
    cxButtonRashod: TcxButton;
    ActionList1: TActionList;
    ActionClose: TAction;
    cxLabel1: TcxLabel;
    procedure ActionCloseExecute(Sender: TObject);
    procedure cxButtonPrihodClick(Sender: TObject);
    procedure cxButtonRashodClick(Sender: TObject);
  private
    prihod : smallint;
    procedure LoadCaptions;
  public
    { Public declarations }
  end;

function Show_fmPrihod(var i : smallint): boolean;

implementation

{$R *.dfm}

function Show_fmPrihod(var i : smallint): boolean;
var
    T: TfmBankPrihodRashod;
begin
    T := TfmBankPrihodRashod.Create(nil);
    T.LoadCaptions;
    if T.ShowModal=mrOk then
    begin
        i := T.prihod;
        Result := true;
    end
    else
        Result := false;
    T.Free
end;

procedure TfmBankPrihodRashod.ActionCloseExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmBankPrihodRashod.cxButtonPrihodClick(Sender: TObject);
begin
    prihod := 1;
    ModalResult := mrOk;
end;

procedure TfmBankPrihodRashod.cxButtonRashodClick(Sender: TObject);
begin
    prihod := 0;
    ModalResult := mrOk;
end;

procedure TfmBankPrihodRashod.LoadCaptions;
begin
    Caption := Un_R_file_Alex.KASSA_SELECT_SHOBLON_CAPTION;
    cxButtonPrihod.Caption := Un_R_file_Alex.KASSA_DOC_ORDER_PRIH_;
    cxButtonRashod.Caption := Un_R_file_Alex.KASSA_DOC_ORDER_RASH_;
    cxLabel1.caption       := Un_R_file_Alex.KASSA_SELECT_SHOBLON_LABEL;
end;

end.
