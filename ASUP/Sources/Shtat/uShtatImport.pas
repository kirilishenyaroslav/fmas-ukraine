unit uShtatImport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, U_ExpImpFrame, StdCtrls, Buttons, IBase, ExtCtrls;

type
  TfmShtatImport = class(TForm)
    ImportFrame: TExpImpFr;
    Panel1: TPanel;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    procedure OkButtonClick(Sender: TObject);
    procedure ImportFrameBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    DBHandle: TISC_DB_HANDLE;
  end;

var
  fmShtatImport: TfmShtatImport;

implementation

{$R *.dfm}

procedure TfmShtatImport.OkButtonClick(Sender: TObject);
begin
    ImportFrame.Import(DBHandle);
end;

procedure TfmShtatImport.ImportFrameBitBtn1Click(Sender: TObject);
begin
  ImportFrame.BitBtn1Click(Sender);

end;

end.
