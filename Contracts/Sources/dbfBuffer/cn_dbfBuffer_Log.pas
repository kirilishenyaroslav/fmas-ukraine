unit cn_dbfBuffer_Log;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMemo, cnConsts, cn_Common_Funcs;

type
  TfrmLog = class(TForm)
    cxMemo1: TcxMemo;
    ExitButton: TcxButton;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    PLanguageIndex: byte;
  end;

var
  frmLog: TfrmLog;

implementation

{$R *.dfm}

procedure TfrmLog.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmLog.FormCreate(Sender: TObject);
begin
  PLanguageIndex:=           cn_Common_Funcs.cnLanguageIndex();
  cxMemo1.Clear;
  ExitButton.Caption :=          cnConsts.cn_ExitBtn_Caption[PLanguageIndex];
end;

end.
