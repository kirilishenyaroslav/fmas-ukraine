unit uPiPropIncomeAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons,
  cxTextEdit, cxMemo, cxControls, cxContainer, cxEdit, cxLabel, ibase;

type
  TfmPropIncomeAdd = class(TForm)
    cxLabel4: TcxLabel;
    MemoName: TcxMemo;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    ActionList1: TActionList;
    ActionSave: TAction;
    ActionExit: TAction;
    cxLabel1: TcxLabel;
    TextEditKod: TcxTextEdit;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    id_prop : variant;
    DB_handle : TISC_DB_HANDLE;
    constructor Create(AOwner:TComponent);reintroduce;
  end;

var
  fmPropIncomeAdd: TfmPropIncomeAdd;

implementation

{$R *.dfm}

constructor TfmPropIncomeAdd.Create(AOwner:TComponent);
begin
  Screen.Cursor:=crHourGlass;

  inherited Create(AOwner);

  Screen.Cursor:=crDefault;
end;

procedure TfmPropIncomeAdd.OkButtonClick(Sender: TObject);
begin
    if(TextEditKod.Text = '')  then
    Begin
        ShowMessage('Необхідно заповнити код ознаки дохода!');
        TextEditKod.SetFocus;
        Exit;
    end;
    if(MemoName.Text = '')  then
    Begin
        ShowMessage('Необхідно заповнити назву ознаки дохода!');
        MemoName.SetFocus;
        Exit;
    end;
    ModalResult := mrOk;
end;

procedure TfmPropIncomeAdd.CancelButtonClick(Sender: TObject);
begin
    close;
end;

end.
