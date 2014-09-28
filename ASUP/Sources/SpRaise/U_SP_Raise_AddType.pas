unit U_SP_Raise_AddType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, CheckEditUnit, FieldControl, Buttons,
  U_SPRaise_DataModule;

type
  TSPRaise_AddGr = class(TForm)
    SbOk: TBitBtn;
    SbCancel: TBitBtn;
    FC_Name: TFieldControl;
    Label5: TLabel;
    CE_Name: TCheckEdit;
    procedure SbOkClick(Sender: TObject);
    procedure SbCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    DMod: TDMSPRaise;
    Add:Boolean;
    id:string;
    { Public declarations }
  end;

var
  SPRaise_AddGr: TSPRaise_AddGr;

implementation

{$R *.dfm}

function TextOk(Txt:string):Boolean;
var p:integer;
begin
  p:=Pos(' ',Txt);
  while (p<>0)and(Length(Txt)<>0)do
  begin
    Delete(Txt,p,1);
    p:=Pos(' ',Txt);
  end;
  if (Length(Txt)=0)
   then Result:=False
   else Result:=True;
end;

procedure TSPRaise_AddGr.SbOkClick(Sender: TObject);
begin
  FC_Name.Get;
  if not(FC_Name.Check)
   then begin
     MessageDlg('Не вірно введена назва',mtError,[mbYes],0);
     Exit;
   end;
  if not TextOk(CE_Name.Text)
   then begin
     MessageDlg('Не вірно введена назва',mtError,[mbYes],0);
     Exit;
   end;
  with DMod do
  try
    FIBWriteTransaction.StartTransaction;
    if Add then
     FIBQuery.SQL.Text:='execute procedure ini_type_raise_i('+QuotedStr(CE_Name.Text)+');'
     else FIBQuery.SQL.Text:='execute procedure ini_type_raise_u('+Id+', '+QuotedStr(CE_Name.Text)+');';
    FIBQuery.ExecProc;
    FIBWriteTransaction.Commit;
  except on e: Exception do
  begin
    MessageDlg('Не вдалося змінити запис: '+e.Message,mtError,[mbYes],0);
    FIBWriteTransaction.RollBack;
  end;
  end;

end;

procedure TSPRaise_AddGr.SbCancelClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

end.
