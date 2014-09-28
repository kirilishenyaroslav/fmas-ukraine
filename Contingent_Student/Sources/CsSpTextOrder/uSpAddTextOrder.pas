unit uSpAddTextOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ibase, cxLookAndFeelPainters, cxLabel, ActnList, StdCtrls,
  cxButtons, cxControls, cxContainer, cxEdit, cxTextEdit, cxMemo,DogLoaderUnit;

type
  TfmSpAddTextOrder = class(TForm)
    MemoText: TcxMemo;
    OkButton: TcxButton;
    ActionList1: TActionList;
    ActionSave: TAction;
    ActionExit: TAction;
    CancelButton: TcxButton;
    cxLabel4: TcxLabel;
    procedure ActionSaveExecute(Sender: TObject);
    procedure ActionExitExecute(Sender: TObject);
  private
    { Private declarations }
  public
    id_shablon : variant;
    DB_handle : TISC_DB_HANDLE;
    constructor Create(AOwner:TComponent);reintroduce;
  end;

{var
  fmSpAddTextOrder: TfmSpAddTextOrder;   }

implementation

{$R *.dfm}

constructor TfmSpAddTextOrder.Create(AOwner:TComponent);
begin
  Screen.Cursor:=crHourGlass;

  inherited Create(AOwner);

  Screen.Cursor:=crDefault;
end;

procedure TfmSpAddTextOrder.ActionSaveExecute(Sender: TObject);
begin
    if  (MemoText.Text = '')  then
    Begin
        ShowMessage('Необхідно заповнити текст вступу!');
        MemoText.SetFocus;
        Exit;
    end;

  ModalResult := mrOk;
end;

procedure TfmSpAddTextOrder.ActionExitExecute(Sender: TObject);
begin
    close;
end;

end.
