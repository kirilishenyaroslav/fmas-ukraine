unit uAddInsIstFin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxCurrencyEdit, cxTextEdit, cxControls, cxContainer, cxEdit,
  cxMaskEdit, cxButtonEdit, StdCtrls, cxLookAndFeelPainters, cxButtons, GlobalSpr,
  uMainPerem, ibase, ActnList;

type
  TAddUpdIstFinForm = class(TForm)
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    cxDBKEKV: TcxButtonEdit;
    cxDbSmeta: TcxButtonEdit;
    cxDBRazdel: TcxTextEdit;
    cxDBStatya: TcxTextEdit;
    lbl11: TLabel;
    Kr_summa: TcxCurrencyEdit;
    lbl1: TLabel;
    Db_summa: TcxCurrencyEdit;
    AddBut: TcxButton;
    CancelBut: TcxButton;
    actlst1: TActionList;
    actOk: TAction;
    actNo: TAction;
    lbl2: TLabel;
    lbl3: TLabel;
    procedure cxDbSmetaPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxDBKEKVPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure actOkExecute(Sender: TObject);
    procedure actNoExecute(Sender: TObject);
  private
    DBHANDLE : TISC_DB_HANDLE;
  public
    ID_SM, ID_RZ, ID_ST, ID_KEKV: integer;
    d_summa, k_summa: Double;
   constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; is_add:integer);overload;
  end;

var
  AddUpdIstFinForm: TAddUpdIstFinForm;

implementation

{$R *.dfm}

constructor TAddUpdIstFinForm.Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; is_add:integer);
var DATE_REC:TDateTime;
    month, year:Word;
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
  if is_add = 0 then
  begin
   Self.Caption:='Додавання';
   ID_SM:=0;
   ID_RZ:=0;
   ID_ST:=0;
   ID_KEKV:=0;
   d_summa:=0;
   k_summa:=0;
  end
  else Self.Caption:='Редагування';
 end;
end;

procedure TAddUpdIstFinForm.cxDbSmetaPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var id:variant;
begin
id:=GlobalSPR.GetSmetsEx(self, MAIN_DB_HANDLE, PERS_PAY_PERIOD, psmRazdSt, ID_SM, ID_RZ, ID_ST);
 if VarArrayDimCount(id)>0
 then begin
  if id[0]<>NULL
  then begin
   ID_SM:=id[0];
   ID_RZ:=id[1];
   ID_ST:=id[2];
   cxDbSmeta.Text:=IntToStr(id[9]);
   cxDBRazdel.Text:=IntToStr(id[7]);
   cxDBStatya.Text:=IntToStr(id[8]);
  end;
 end;
end;

procedure TAddUpdIstFinForm.cxDBKEKVPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
 var id:variant;
begin
id:=GlobalSPR.GetKEKVSpr(self, MAIN_DB_HANDLE, fsNormal, Date, DEFAULT_ROOT_ID);
if VarArrayDimCount(id)>0 then
begin
 if id[0][0]<>NULL then begin
{           id[0][0]  - идентификатор КЕКВа
           id[0][1]  - наименование КЕКВа
           id[0][2]  - код КЕКВа
}
 ID_KEKV:=id[0][0];
 cxDBKEKV.Text:=IntToStr(id[0][2]);
 end;
end;
end;

procedure TAddUpdIstFinForm.actOkExecute(Sender: TObject);
begin
if (ID_SM=0) and (ID_RZ=0) and (ID_ST=0) and (ID_KEKV=0) and (d_summa=0) and (k_summa=0) then begin Modalresult:=mrCancel; Exit; end
else
begin
AddBut.SetFocus;
d_summa:=Db_summa.Value;
k_summa:=Kr_summa.Value;
ModalResult:=mrOk;
end;
end;

procedure TAddUpdIstFinForm.actNoExecute(Sender: TObject);
begin
 Close;
end;

end.
