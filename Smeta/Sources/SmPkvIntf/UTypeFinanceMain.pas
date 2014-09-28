unit UTypeFinanceMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase, cxControls, cxContainer, cxEdit, cxTextEdit;

type
  TfrmMainTypeFinance = class(TForm)
    cxTextEdit1: TcxTextEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  public
    ResultValue:Variant;
    constructor Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;fs:TFormStyle;id_user:Int64);reintroduce;
  end;


implementation

{$R *.dfm}

constructor TfrmMainTypeFinance.Create(AOwner: TComponent;DB_HANDLE: TISC_DB_HANDLE; fs: TFormStyle; id_user: Int64);
begin
     inherited Create(AOwner);
     self.FormStyle:=fs;
end;

procedure TfrmMainTypeFinance.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

end.
