unit uKapRem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxMaskEdit, cxButtonEdit, FIBDatabase,
  pFIBDatabase, cxDropDownEdit, cxCalendar, cxCurrencyEdit, ibase, GlobalSpr, uMatasVars;

type
  TKapRemForm = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxDbSmeta: TcxButtonEdit;
    cxDBRazdel: TcxTextEdit;
    cxDBStatya: TcxTextEdit;
    cxDBKEKV: TcxButtonEdit;
    DB_Kap_Rem: TpFIBDatabase;
    cxDateEdit: TcxDateEdit;
    cxNameKrSch: TcxButtonEdit;
    cxNameDbSch: TcxButtonEdit;
    cxIspolnit: TcxTextEdit;
    cxSoderj: TcxTextEdit;
    cxSumma: TcxCurrencyEdit;
    procedure cxDbSmetaPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxNameDbSchPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxNameKrSchPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxDBKEKVPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private

  public
    DBHandle:TISC_DB_HANDLE;
    db_id_sch, kr_id_sch, id_sm, id_rz, id_st, id_kekv:Integer;
    summa:Double;
    ispolnitel, soderj:string;
    date_rem:TDateTime;

  end;

var
  KapRemForm: TKapRemForm;

implementation

{$R *.dfm}

procedure TKapRemForm.cxDbSmetaPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  id:variant;
begin
 id:=GlobalSPR.GetSmetsEx(self, DBHandle, _MATAS_PERIOD, psmRazdSt, ID_SM, ID_RZ, ID_ST);
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

procedure TKapRemForm.cxNameDbSchPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res : Variant;
begin
 Res:=GlobalSPR.GetSch(self,DBHandle, fsNormal, _MATAS_PERIOD, _ID_SCH_ROOT, -1, DB_ID_SCH);
 if VarArrayDimCount(Res)>0 then
 begin
   Db_ID_Sch := Res[0][0];
   cxNameDbSch.Text := VarToStr(RES[0][3]);
  end;

end;

procedure TKapRemForm.cxNameKrSchPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res : Variant;
begin
 Res:=GlobalSPR.GetSch(self,DBHandle, fsNormal, _MATAS_PERIOD, _ID_SCH_ROOT, -1, KR_ID_SCH);
 if VarArrayDimCount(Res)>0 then
 begin
   KR_ID_Sch := Res[0][0];
   cxNameKRSch.Text := VarToStr(RES[0][3]);
  end;

end;

procedure TKapRemForm.cxButton1Click(Sender: TObject);
begin
modalResult:=mrOk;
end;

procedure TKapRemForm.cxButton2Click(Sender: TObject);
begin
Close;
end;

procedure TKapRemForm.cxDBKEKVPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  id:variant;
begin
 id:=GlobalSPR.GetKEKVSpr(self, DBHandle, fsNormal, _MATAS_PERIOD, DEFAULT_ROOT_ID);
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

end.
