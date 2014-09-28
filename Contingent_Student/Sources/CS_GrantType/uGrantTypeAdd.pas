unit uGrantTypeAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit, cxMemo,
  cxControls, cxContainer, cxEdit, cxLabel, ibase, ActnList;

type
  TfmGrantTypeAdd = class(TForm)
    cxLabel4: TcxLabel;
    MemoName: TcxMemo;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    ActionList1: TActionList;
    ActionSave: TAction;
    ActionExit: TAction;
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    id_type_name : variant;
    DB_handle : TISC_DB_HANDLE;
    constructor Create(AOwner:TComponent);reintroduce;
  end;

{var
  fmGrantTypeAdd: TfmGrantTypeAdd;}

implementation

{$R *.dfm}

constructor TfmGrantTypeAdd.Create(AOwner:TComponent);
begin
  Screen.Cursor:=crHourGlass;

  inherited Create(AOwner);

  Screen.Cursor:=crDefault;
end;

procedure TfmGrantTypeAdd.CancelButtonClick(Sender: TObject);
begin
    close;
end;

procedure TfmGrantTypeAdd.OkButtonClick(Sender: TObject);
begin
    if  (MemoName.Text = '')  then
    Begin
        ShowMessage('Необхідно заповнити назву типу стипендії!');
        MemoName.SetFocus;
        Exit;
    end;


  ModalResult := mrOk;
end;

end.
