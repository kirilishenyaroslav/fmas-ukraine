unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, U_ExpImpFrame, StdCtrls, Buttons, ExtCtrls, IniFiles,
  iBase;

type
  TImportForm = class(TForm)
    Panel1: TPanel;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    ImportFrame: TExpImpFr;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
  private
    pHandle: TISC_DB_HANDLE;
  public
    constructor Create(AOwner: TComponent; aDbHandle: TISC_DB_HANDLE);reintroduce;
  end;

function ShowForm(AOwner:TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
 exports ShowForm;

implementation

{$R *.dfm}

function ShowForm(AOwner:TComponent;DB:TISC_DB_HANDLE):Variant;
var ViewForm: TImportForm;
begin
    ViewForm:=TImportForm.Create(AOwner,DB);
    ViewForm.ShowModal;
    ViewForm.Free;
end;

constructor TImportForm.Create(AOwner: TComponent; aDbHandle: TISC_DB_HANDLE);
begin
    inherited Create(AOwner);
    pHandle  := aDbHandle;
end;

procedure TImportForm.OkButtonClick(Sender: TObject);
begin
    ImportFrame.Import(pHandle);
end;

procedure TImportForm.CancelButtonClick(Sender: TObject);
begin
    ImportFrame.Stop;
end;

end.
