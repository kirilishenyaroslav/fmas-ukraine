unit uAddIstFinVal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons,
  cxCurrencyEdit, cxTextEdit, cxControls, cxContainer, cxEdit, cxMaskEdit,
  cxButtonEdit, ibase, GlobalSpr, uMainPerem;

type
  TAddIstValForm = class(TForm)
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl11: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    cxDBKEKV: TcxButtonEdit;
    cxDbSmeta: TcxButtonEdit;
    cxDBRazdel: TcxTextEdit;
    cxDBStatya: TcxTextEdit;
    Kr_summa: TcxCurrencyEdit;
    Db_summa: TcxCurrencyEdit;
    AddBut: TcxButton;
    CancelBut: TcxButton;
    actlst1: TActionList;
    actOk: TAction;
    actNo: TAction;
    lbl4: TLabel;
    db_summa_val: TcxCurrencyEdit;
    lbl5: TLabel;
    kr_summa_val: TcxCurrencyEdit;
    lbl6: TLabel;
    lblVal: TLabel;
    lbl8: TLabel;
    lblKurs: TLabel;
    procedure Db_summaExit(Sender: TObject);
    procedure db_summa_valExit(Sender: TObject);
    procedure Kr_summaExit(Sender: TObject);
    procedure kr_summa_valExit(Sender: TObject);
    procedure cxDbSmetaPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxDBKEKVPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure actOkExecute(Sender: TObject);
    procedure actNoExecute(Sender: TObject);
  private
    { Private declarations }
  public
    kurs:Double;
    ID_SM, ID_RZ, ID_ST, ID_KEKV: integer;
    d_summa, k_summa, d_summa_val, k_summa_val: Double;
   constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; is_add:integer);overload;
  end;

var
  AddIstValForm: TAddIstValForm;

implementation

{$R *.dfm}
constructor TAddIstValForm.Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; is_add:integer);
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
   d_summa_val:=0;
   k_summa_val:=0;
  end
  else Self.Caption:='Редагування';
 end;
end;
procedure TAddIstValForm.Db_summaExit(Sender: TObject);
begin
db_summa_val.EditValue:=Db_summa.EditValue/kurs;
end;

procedure TAddIstValForm.db_summa_valExit(Sender: TObject);
begin
db_summa.EditValue:=Db_summa_val.EditValue*kurs;
end;

procedure TAddIstValForm.Kr_summaExit(Sender: TObject);
begin
kr_summa_val.EditValue:=kr_summa.EditValue/kurs;
end;

procedure TAddIstValForm.kr_summa_valExit(Sender: TObject);
begin
kr_summa.EditValue:=kr_summa_val.EditValue*kurs;
end;

procedure TAddIstValForm.cxDbSmetaPropertiesButtonClick(Sender: TObject;
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

procedure TAddIstValForm.cxDBKEKVPropertiesButtonClick(Sender: TObject;
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

procedure TAddIstValForm.actOkExecute(Sender: TObject);
begin
if (ID_SM=0) and (ID_RZ=0) and (ID_ST=0) and (ID_KEKV=0) and (d_summa=0) and (k_summa=0) then
 begin
   ShowMessage('Заповніть усі поля!');
   Exit;
 end
else
begin
AddBut.SetFocus;
d_summa:=Db_summa.EditValue;
k_summa:=Kr_summa.EditValue;
d_summa_val:=Db_summa_val.EditValue;
k_summa_val:=Kr_summa_val.EditValue;
ModalResult:=mrOk;
end;
end;

procedure TAddIstValForm.actNoExecute(Sender: TObject);
begin
Close;
end;

end.
