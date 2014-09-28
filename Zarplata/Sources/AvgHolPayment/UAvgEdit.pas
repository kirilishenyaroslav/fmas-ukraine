unit UAvgEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxTextEdit, cxButtonEdit, cxControls, cxContainer, cxEdit, cxMaskEdit,
  cxDropDownEdit, cxCalc, Ibase;

type
  TfrmAvgEdit = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    SummaNar: TcxCalcEdit;
    Label1: TLabel;
    Label2: TLabel;
    SmFull: TcxButtonEdit;
    SmCode: TcxTextEdit;
    NumDays: TcxTextEdit;
    Label3: TLabel;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure SmFullPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure SmCodeExit(Sender: TObject);
  private
    { Private declarations }
    DbH:TISC_DB_Handle;
  public
    { Public declarations }
    FidSmeta:Integer;
    constructor Create(AOwner:TComponent;DbHandle:TISC_DB_HANDLE);reintroduce;
  end;


implementation

{$R *.dfm}

uses GlobalSpr, Zproc;

constructor TfrmAvgEdit.Create(AOwner: TComponent;
  DbHandle: TISC_DB_HANDLE);
begin
     inherited Create(AOwner);
     DbH:=DbHandle;
end;

procedure TfrmAvgEdit.cxButton1Click(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfrmAvgEdit.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmAvgEdit.SmFullPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Smeta:Variant;
begin
Smeta:=GetSmets(self,DbH,Date,psmSmet);
if VarArrayDimCount(Smeta)> 0 then
 If Smeta[0]<>NULL then
  begin
   SmCode.Text         := Smeta[3];
   SmFull.Text := Smeta[2];
   FidSmeta              := Smeta[0];
  end;
end;

procedure TfrmAvgEdit.SmCodeExit(Sender: TObject);
var Smeta:variant;
begin
 if SmCode.Text<>'' then
  begin
   Smeta:=SmetaByKod(StrToInt(SmCode.Text),DbH);
   if not VarIsNull(Smeta) then
    begin
     FidSmeta:=Smeta[0];
     SmFull.Text:=VarToStr(Smeta[2]);
    end
   else
    SmCode.SetFocus;
  end
end;

end.
