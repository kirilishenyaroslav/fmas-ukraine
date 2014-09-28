{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uSpOperProvWork;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, GlobalSPR, ibase,
  cxCheckBox, cxGroupBox, cxDropDownEdit, uMatasVars, uResources, uMatasUtils;

type
  TSpOperWorkForm = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    cxCheckDBSum: TcxCheckBox;
    cxDbSch: TcxButtonEdit;
    cxDbSmeta: TcxButtonEdit;
    cxDBRazdel: TcxButtonEdit;
    cxDBStatya: TcxButtonEdit;
    cxDBKEKV: TcxButtonEdit;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    cxGroupBox2: TcxGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    cxKRSmeta: TcxButtonEdit;
    cxKRRazdel: TcxButtonEdit;
    cxKRStatya: TcxButtonEdit;
    cxKRKEKV: TcxButtonEdit;
    cxCheckKRSum: TcxCheckBox;
    cxKrSch: TcxButtonEdit;
    cxDBSchParam: TcxComboBox;
    Label2: TLabel;
    cxDBSumSch: TcxButtonEdit;
    cxDBSumSm: TcxButtonEdit;
    cxDBSumRz: TcxButtonEdit;
    cxDBSumSt: TcxButtonEdit;
    cxDBSumKekv: TcxButtonEdit;
    cxIsDBSumSch: TcxCheckBox;
    cxIsDBSumSm: TcxCheckBox;
    cxIsDBSumRz: TcxCheckBox;
    cxIsDBSumSt: TcxCheckBox;
    cxIsDBSumKekv: TcxCheckBox;
    Label17: TLabel;
    cxKRSchParam: TcxComboBox;
    cxIsKRSumSch: TcxCheckBox;
    cxKRSumSch: TcxButtonEdit;
    cxIsKRSumSm: TcxCheckBox;
    cxKRSumSm: TcxButtonEdit;
    cxIsKRSumRz: TcxCheckBox;
    cxKRSumRz: TcxButtonEdit;
    cxIsKRSumSt: TcxCheckBox;
    cxKRSumSt: TcxButtonEdit;
    cxIsKRSumKekv: TcxCheckBox;
    cxKRSumKekv: TcxButtonEdit;
    cxGroupBox3: TcxGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    cxCheckExProv: TcxCheckBox;
    cxKolMatParam: TcxComboBox;
    cxSumParam: TcxComboBox;
    cxUnitProv: TcxCheckBox;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label7: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    cxCheckOutPos: TcxCheckBox;
    cxUnitIndex: TcxComboBox;
    procedure cxKrSchPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure cxCheckExProvPropertiesChange(Sender: TObject);
    procedure cxCheckDBSumPropertiesChange(Sender: TObject);
    procedure cxCheckKRSumPropertiesChange(Sender: TObject);
    procedure cxDBMarkPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxKRMarkPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxDBMarkKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxKRMarkKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxDbSchPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxDbSmetaPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxDBKEKVPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxKRSmetaPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxKRKEKVPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxDBKEKVKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxKRKEKVKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxDBStatyaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxKRStatyaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxKRRazdelKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxDBRazdelKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxDbSmetaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxKRSmetaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxIsDBSumSchPropertiesChange(Sender: TObject);
    procedure cxIsDBSumSmPropertiesChange(Sender: TObject);
    procedure cxIsDBSumRzPropertiesChange(Sender: TObject);
    procedure cxIsDBSumStPropertiesChange(Sender: TObject);
    procedure cxIsDBSumKekvPropertiesChange(Sender: TObject);
    procedure cxIsKRSumKekvPropertiesChange(Sender: TObject);
    procedure cxIsKRSumStPropertiesChange(Sender: TObject);
    procedure cxIsKRSumRzPropertiesChange(Sender: TObject);
    procedure cxIsKRSumSmPropertiesChange(Sender: TObject);
    procedure cxIsKRSumSchPropertiesChange(Sender: TObject);
    procedure cxDBSumSchPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxKRSumSchPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxDBSumKekvPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxKRSumKekvPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxDBSumSmPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxKRSumSmPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxDbSchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxKrSchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxUnitProvPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    DBHandle: TISC_DB_HANDLE;
    DB_ID_SCH, KR_ID_SCH: integer;
    DB_ID_MARK, KR_ID_MARK: integer;
    DB_ID_SM, DB_ID_RZ, DB_ID_ST, DB_ID_KEKV: integer;
    KR_ID_SM, KR_ID_RZ, KR_ID_ST, KR_ID_KEKV: integer;
    DB_NAME_SM, KR_NAME_SM, DB_NAME_RZ, KR_NAME_RZ, DB_NAME_ST, KR_NAME_ST, DB_NAME_KEKV, KR_NAME_KEKV: string;
    DB_KOD_SM, KR_KOD_SM, DB_KOD_RZ, KR_KOD_RZ, DB_KOD_ST, KR_KOD_ST, DB_KOD_KEKV, KR_KOD_KEKV: integer;
    DB_NAME_MARK, DB_SHORT_MARK, KR_NAME_MARK, KR_SHORT_MARK: string;
    SUM_DB_ID_SCH, SUM_DB_ID_SM, SUM_DB_ID_RZ, SUM_DB_ID_ST, SUM_DB_ID_KEKV: integer;
    SUM_KR_ID_SCH, SUM_KR_ID_SM, SUM_KR_ID_RZ, SUM_KR_ID_ST, SUM_KR_ID_KEKV: integer;
    SUM_BY_DB_SCH, SUM_BY_DB_SM, SUM_BY_DB_RZ, SUM_BY_DB_ST, SUM_BY_DB_KEKV: integer;
    SUM_BY_KR_SCH, SUM_BY_KR_SM, SUM_BY_KR_RZ, SUM_BY_KR_ST, SUM_BY_KR_KEKV: integer;
    SUM_DB_SCH_NUMBER, SUM_DB_NAME_SM, SUM_DB_NAME_RZ, SUM_DB_NAME_ST, SUM_DB_NAME_KEKV: string;
    SUM_KR_SCH_NUMBER, SUM_KR_NAME_SM, SUM_KR_NAME_RZ, SUM_KR_NAME_ST, SUM_KR_NAME_KEKV: string;
    SUM_DB_KOD_SM, SUM_DB_KOD_RZ, SUM_DB_KOD_ST, SUM_DB_KOD_KEKV: string;
    SUM_KR_KOD_SM, SUM_KR_KOD_RZ, SUM_KR_KOD_ST, SUM_KR_KOD_KEKV: string;
  end;

var
  SpOperWorkForm: TSpOperWorkForm;

implementation

uses uSpOper, uSpMarks;
{$R *.dfm}

procedure TSpOperWorkForm.cxKrSchPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res : Variant;
begin
 Res:=GlobalSPR.GetSch(self, DBHandle, fsNormal, Date, _ID_SCH_ROOT, -1, KR_ID_SCH);
 if  VarArrayDimCount(Res) > 0
  then begin
   KR_ID_SCH := Res[0][0];
   cxKRSch.Text := RES[0][3];
  end;
end;

procedure TSpOperWorkForm.FormCreate(Sender: TObject);
begin
 DB_ID_SCH:=0;
 KR_ID_SCH:=0;
 DB_ID_MARK:=0;
 KR_ID_MARK:=0;
 DB_ID_SM:=0;
 DB_ID_RZ:=0;
 DB_ID_ST:=0;
 DB_ID_KEKV:=0;
 KR_ID_SM:=0;
 KR_ID_RZ:=0;
 KR_ID_ST:=0;
 KR_ID_KEKV:=0;
 SUM_DB_ID_SCH:=0;
 SUM_DB_ID_SM:=0;
 SUM_DB_ID_RZ:=0;
 SUM_DB_ID_ST:=0;
 SUM_DB_ID_KEKV:=0;
 SUM_KR_ID_SCH:=0;
 SUM_KR_ID_SM:=0;
 SUM_KR_ID_RZ:=0;
 SUM_KR_ID_ST:=0;
 SUM_KR_ID_KEKV:=0;
 SUM_BY_DB_SCH:=0;
 SUM_BY_DB_SM:=0;
 SUM_BY_DB_RZ:=0;
 SUM_BY_DB_ST:=0;
 SUM_BY_DB_KEKV:=0;
 SUM_BY_KR_SCH:=0;
 SUM_BY_KR_SM:=0;
 SUM_BY_KR_RZ:=0;
 SUM_BY_KR_ST:=0;
 SUM_BY_KR_KEKV:=0;
 OkButton.Caption:=MAT_BUTTON_OK_CONST;
 CancelButton.Caption:=MAT_BUTTON_CANCEL_CONST;
 cxDBSchParam.ItemIndex:=0;
 cxKRSchParam.ItemIndex:=0;
end;

procedure TSpOperWorkForm.cxCheckExProvPropertiesChange(Sender: TObject);
begin
 if cxCheckExProv.Checked then
 begin
  cxCheckDBSum.Enabled:=True;
  cxCheckKRSum.Enabled:=true;
 end
 else
  begin
  cxCheckDBSum.Enabled:=false;
  cxCheckKRSum.Enabled:=false;
  cxCheckDBSum.Checked:=false;
  cxCheckKRSum.Checked:=false;
 end;
end;

procedure TSpOperWorkForm.cxCheckDBSumPropertiesChange(Sender: TObject);
begin
 if cxCheckDBSum.Checked then
 begin
  cxCheckKRSum.Checked:=false;
  cxIsKRSumSch.Checked:=false;
  cxIsKRSumSm.Checked:=false;
  cxIsKRSumSt.Checked:=false;
  cxIsKRSumRz.Checked:=false;
  cxIsKRSumKekv.Checked:=false;
  cxIsDBSumSch.Enabled:=true;
  cxIsDBSumSm.Enabled:=true;
  cxIsDBSumSt.Enabled:=true;
  cxIsDBSumRz.Enabled:=true;
  cxIsDBSumKekv.Enabled:=true;
 end
 else
 begin
  cxIsDBSumSch.Enabled:=false;
  cxIsDBSumSm.Enabled:=false;
  cxIsDBSumSt.Enabled:=false;
  cxIsDBSumRz.Enabled:=false;
  cxIsDBSumKekv.Enabled:=false;
 end;
end;

procedure TSpOperWorkForm.cxCheckKRSumPropertiesChange(Sender: TObject);
begin
 if cxCheckKRSum.Checked then
 begin
  cxCheckDBSum.Checked:=false;
  cxIsDBSumSch.Checked:=false;
  cxIsDBSumSm.Checked:=false;
  cxIsDBSumSt.Checked:=false;
  cxIsDBSumRz.Checked:=false;
  cxIsDBSumKekv.Checked:=false;
  cxIsKRSumSch.Enabled:=true;
  cxIsKRSumSm.Enabled:=true;
  cxIsKRSumSt.Enabled:=true;
  cxIsKRSumRz.Enabled:=true;
  cxIsKRSumKekv.Enabled:=true;
 end
 else
 begin
  cxIsKRSumSch.Enabled:=false;
  cxIsKRSumSm.Enabled:=false;
  cxIsKRSumSt.Enabled:=false;
  cxIsKRSumRz.Enabled:=false;
  cxIsKRSumKekv.Enabled:=false;
 end;
end;

procedure TSpOperWorkForm.cxDBMarkPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
 fm: TSpMarksForm;
begin
 fm:=TSpMarksForm.Create(self, DBHANDLE, 0, DB_ID_MARK);
 fm.ShowModal;
 if fm.Result then
 begin
  DB_ID_MARK:=fm.ID_MARK;
  DB_NAME_MARK:=fm.NAME_MARK;
  DB_SHORT_MARK:=fm.SHORT_MARK;
 end;
 fm.Free;
end;

procedure TSpOperWorkForm.cxKRMarkPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
 fm: TSpMarksForm;
begin
 fm:=TSpMarksForm.Create(self, DBHANDLE, 0, KR_ID_MARK);
 fm.ShowModal;
 if fm.Result then
 begin
  KR_ID_MARK:=fm.ID_MARK;
  KR_NAME_MARK:=fm.NAME_MARK;
  KR_SHORT_MARK:=fm.SHORT_MARK;
 end;
 fm.Free;
end;

procedure TSpOperWorkForm.cxDBMarkKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  DB_ID_MARK:=0;
  DB_NAME_MARK:='';
  DB_SHORT_MARK:='';
 end;
end;

procedure TSpOperWorkForm.cxKRMarkKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  KR_ID_MARK:=0;
  KR_NAME_MARK:='';
  KR_SHORT_MARK:='';
 end;
end;

procedure TSpOperWorkForm.cxDbSchPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res : Variant;
begin
 Res:=GlobalSPR.GetSch(self, DBHandle, fsNormal, Date, _ID_SCH_ROOT, -1, DB_ID_SCH);
 if  VarArrayDimCount(Res) > 0
  then begin
   DB_ID_SCH := Res[0][0];
   cxDBSch.Text := RES[0][3];
  end;
end;

procedure TSpOperWorkForm.cxDbSmetaPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  id:variant;
begin
  id:=GlobalSPR.GetSmets(self, DBHandle, Date, psmRazdSt);
  if VarArrayDimCount(id)>0
  then begin
   if id[0]<>NULL
   then begin
{              id[0]  -идентификатор сметы
              id[1]  -идентификатор раздела
              id[2]  -идентификатор статьи
              id[3]  -идентификатор группы смет
              id[4]  -наименование раздела
              id[5]  -наименование статьи
              id[6]  -наименование сметы
              id[7]  -номер раздела
              id[8]  -номер статьи
              id[9]  -код сметы
              id[10] -наименование группы смет
}
    DB_ID_SM:=id[0];
    DB_ID_RZ:=id[1];
    DB_ID_ST:=id[2];
    DB_NAME_SM:=id[6];
    DB_NAME_RZ:=id[4];
    DB_NAME_ST:=id[5];
    DB_KOD_SM:=id[9];
    DB_KOD_RZ:=id[7];
    DB_KOD_ST:=id[8];
    cxDbSmeta.Text:=IntToStr(DB_KOD_SM);
    cxDBRazdel.Text:=IntToStr(DB_KOD_RZ);
    cxDBStatya.Text:=IntToStr(DB_KOD_ST);
  end;
 end;
end;

procedure TSpOperWorkForm.cxDBKEKVPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  id:variant;
begin
 id:=GlobalSPR.GetKEKVSpr(self, DBHandle, fsNormal, Date, DEFAULT_ROOT_ID);
 if VarArrayDimCount(id)>0 then
 begin
  if id[0][0]<>NULL then begin
{           id[0][0]  - идентификатор КЕКВа
           id[0][1]  - наименование КЕКВа
           id[0][2]  - код КЕКВа
}
  DB_ID_KEKV:=id[0][0];
  DB_NAME_KEKV:=id[0][1];
  DB_KOD_KEKV:=id[0][2];
  cxDBKEKV.Text:=IntToStr(DB_KOD_KEKV);
  end;
 end;
end;

procedure TSpOperWorkForm.cxKRSmetaPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  id:variant;
begin
  id:=GlobalSPR.GetSmets(self, DBHandle, Date, psmRazdSt);
  if VarArrayDimCount(id)>0
  then begin
   if id[0]<>NULL
   then begin
{              id[0]  -идентификатор сметы
              id[1]  -идентификатор раздела
              id[2]  -идентификатор статьи
              id[3]  -идентификатор группы смет
              id[4]  -наименование раздела
              id[5]  -наименование статьи
              id[6]  -наименование сметы
              id[7]  -номер раздела
              id[8]  -номер статьи
              id[9]  -код сметы
              id[10] -наименование группы смет
}
    KR_ID_SM:=id[0];
    KR_ID_RZ:=id[1];
    KR_ID_ST:=id[2];
    KR_NAME_SM:=id[6];
    KR_NAME_RZ:=id[4];
    KR_NAME_ST:=id[5];
    KR_KOD_SM:=id[9];
    KR_KOD_RZ:=id[7];
    KR_KOD_ST:=id[8];
    cxKRSmeta.Text:=IntToStr(KR_KOD_SM);
    cxKRRazdel.Text:=IntToStr(KR_KOD_RZ);
    cxKRStatya.Text:=IntToStr(KR_KOD_ST);
  end;
 end;
end;

procedure TSpOperWorkForm.cxKRKEKVPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  id:variant;
begin
 id:=GlobalSPR.GetKEKVSpr(self, DBHandle, fsNormal, Date, DEFAULT_ROOT_ID);
 if VarArrayDimCount(id)>0 then
 begin
  if id[0][0]<>NULL then begin
{           id[0][0]  - идентификатор КЕКВа
           id[0][1]  - наименование КЕКВа
           id[0][2]  - код КЕКВа
}
  KR_ID_KEKV:=id[0][0];
  KR_NAME_KEKV:=id[0][1];
  KR_KOD_KEKV:=id[0][2];
  cxKRKEKV.Text:=IntToStr(KR_KOD_KEKV);
  end;
 end;
end;

procedure TSpOperWorkForm.cxDBKEKVKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  cxDBKekv.Text:='';
  DB_ID_KEKV:=0;
  DB_NAME_KEKV:='';
  DB_KOD_KEKV:=0;
 end;
end;

procedure TSpOperWorkForm.cxKRKEKVKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  cxKRKekv.Text:='';
  KR_ID_KEKV:=0;
  KR_NAME_KEKV:='';
  KR_KOD_KEKV:=0;
 end;

end;

procedure TSpOperWorkForm.cxDBStatyaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  cxDBStatya.Text:='';
  DB_ID_ST:=0;
  DB_NAME_ST:='';
  DB_KOD_ST:=0;
 end;
end;

procedure TSpOperWorkForm.cxKRStatyaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  cxKRStatya.Text:='';
  KR_ID_ST:=0;
  KR_NAME_ST:='';
  KR_KOD_ST:=0;
 end;
end;

procedure TSpOperWorkForm.cxKRRazdelKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  cxKRRazdel.Text:='';
  KR_ID_RZ:=0;
  KR_NAME_RZ:='';
  KR_KOD_RZ:=0;
 end;
end;

procedure TSpOperWorkForm.cxDBRazdelKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  cxDBRazdel.Text:='';
  DB_ID_RZ:=0;
  DB_NAME_RZ:='';
  DB_KOD_RZ:=0;
 end;
end;

procedure TSpOperWorkForm.cxDbSmetaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  cxDBSmeta.Text:='';
  DB_ID_SM:=0;
  DB_NAME_SM:='';
  DB_KOD_SM:=0;
 end;
end;

procedure TSpOperWorkForm.cxKRSmetaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  cxKRSmeta.Text:='';
  KR_ID_SM:=0;
  KR_NAME_SM:='';
  KR_KOD_SM:=0;
 end;
end;

procedure TSpOperWorkForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=VK_RETURN then
  Key:=VK_TAB;
 if Key=VK_ESCAPE	then
  CancelButton.SetFocus;
 if (Key=VK_F10) or ((Key=VK_END) and (Shift=[ssCtrl])) then
  OkButton.SetFocus;

end;

procedure TSpOperWorkForm.cxIsDBSumSchPropertiesChange(Sender: TObject);
begin
  cxDBSumSch.Enabled:=cxIsDBSumSch.Checked;
  SUM_BY_DB_SCH:=BoolToInt(cxIsDBSumSch.Checked);
end;

procedure TSpOperWorkForm.cxIsDBSumSmPropertiesChange(Sender: TObject);
begin
 cxDBSumSm.Enabled:=cxIsDBSumSm.Checked;
 SUM_BY_DB_SM:=BoolToInt(cxIsDBSumSm.Checked);
end;

procedure TSpOperWorkForm.cxIsDBSumRzPropertiesChange(Sender: TObject);
begin
 cxDBSumRz.Enabled:=cxIsDBSumRz.Checked;
 SUM_BY_DB_RZ:=BoolToInt(cxIsDBSumRz.Checked);
end;

procedure TSpOperWorkForm.cxIsDBSumStPropertiesChange(Sender: TObject);
begin
 cxDBSumSt.Enabled:=cxIsDBSumSt.Checked;
 SUM_BY_DB_ST:=BoolToInt(cxIsDBSumSt.Checked);
end;

procedure TSpOperWorkForm.cxIsDBSumKekvPropertiesChange(Sender: TObject);
begin
 cxDBSumKekv.Enabled:=cxIsDBSumKekv.Checked;
 SUM_BY_DB_KEKV:=BoolToInt(cxIsDBSumKekv.Checked);
end;

procedure TSpOperWorkForm.cxIsKRSumKekvPropertiesChange(Sender: TObject);
begin
 cxKRSumKekv.Enabled:=cxIsKRSumKekv.Checked;
 SUM_BY_KR_KEKV:=BoolToInt(cxIsKRSumKekv.Checked);
end;

procedure TSpOperWorkForm.cxIsKRSumStPropertiesChange(Sender: TObject);
begin
 cxKRSumSt.Enabled:=cxIsKRSumSt.Checked;
 SUM_BY_KR_ST:=BoolToInt(cxIsKRSumSt.Checked);
end;

procedure TSpOperWorkForm.cxIsKRSumRzPropertiesChange(Sender: TObject);
begin
 cxKRSumRz.Enabled:=cxIsKRSumRz.Checked;
 SUM_BY_KR_RZ:=BoolToInt(cxIsKRSumRz.Checked);
end;

procedure TSpOperWorkForm.cxIsKRSumSmPropertiesChange(Sender: TObject);
begin
 cxKRSumSM.Enabled:=cxIsKRSumSm.Checked;
 SUM_BY_KR_SM:=BoolToInt(cxIsKRSumSm.Checked);
end;

procedure TSpOperWorkForm.cxIsKRSumSchPropertiesChange(Sender: TObject);
begin
 cxKRSumSch.Enabled:=cxIsKRSumSch.Checked;
 SUM_BY_KR_SCH:=BoolToInt(cxIsKRSumSch.Checked);
end;

procedure TSpOperWorkForm.cxDBSumSchPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res : Variant;
begin
 Res:=GlobalSPR.GetSch(self,DBHandle, fsNormal, Date, _ID_SCH_ROOT, -1, -1);
 if  VarArrayDimCount(Res) > 0
  then begin
   SUM_DB_ID_SCH := Res[0][0];
   cxDBSumSch.Text := RES[0][3];
  end;
end;

procedure TSpOperWorkForm.cxKRSumSchPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res : Variant;
begin
 Res:=GlobalSPR.GetSch(self,DBHandle, fsNormal, Date, _ID_SCH_ROOT, -1, -1);
 if  VarArrayDimCount(Res) > 0
  then begin
   SUM_KR_ID_SCH := Res[0][0];
   cxKRSumSch.Text := RES[0][3];
  end;
end;

procedure TSpOperWorkForm.cxDBSumKekvPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  id:variant;
begin
 id:=GlobalSPR.GetKEKVSpr(self, DBHandle, fsNormal, Date, DEFAULT_ROOT_ID);
 if VarArrayDimCount(id)>0 then
 begin
  if id[0][0]<>NULL then begin
{           id[0][0]  - идентификатор КЕКВа
           id[0][1]  - наименование КЕКВа
           id[0][2]  - код КЕКВа
}
  SUM_DB_ID_KEKV:=id[0][0];
//  DB_NAME_KEKV:=id[0][1];
//  DB_KOD_KEKV:=id[0][2];
  cxDBSumKEKV.Text:=IntToStr(id[0][2]);
  end;
 end;
end;

procedure TSpOperWorkForm.cxKRSumKekvPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  id:variant;
begin
 id:=GlobalSPR.GetKEKVSpr(self, DBHandle, fsNormal, Date, DEFAULT_ROOT_ID);
 if VarArrayDimCount(id)>0 then
 begin
  if id[0][0]<>NULL then begin
{           id[0][0]  - идентификатор КЕКВа
           id[0][1]  - наименование КЕКВа
           id[0][2]  - код КЕКВа
}
  SUM_KR_ID_KEKV:=id[0][0];
//  DB_NAME_KEKV:=id[0][1];
//  DB_KOD_KEKV:=id[0][2];
  cxKRSumKEKV.Text:=IntToStr(id[0][2]);
  end;
 end;
end;

procedure TSpOperWorkForm.cxDBSumSmPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  id:variant;
  _KOD_SM, _KOD_ST, _KOD_RZ: integer;
begin
  id:=GlobalSPR.GetSmets(self, DBHandle, Date, psmRazdSt);
  if VarArrayDimCount(id)>0
  then begin
   if id[0]<>NULL
   then begin
{              id[0]  -идентификатор сметы
              id[1]  -идентификатор раздела
              id[2]  -идентификатор статьи
              id[3]  -идентификатор группы смет
              id[4]  -наименование раздела
              id[5]  -наименование статьи
              id[6]  -наименование сметы
              id[7]  -номер раздела
              id[8]  -номер статьи
              id[9]  -код сметы
              id[10] -наименование группы смет
}
    _KOD_SM:=id[9];
    _KOD_RZ:=id[7];
    _KOD_ST:=id[8];
    cxDbSumSm.Text:=IntToStr(_KOD_SM);
    cxDBSumRz.Text:=IntToStr(_KOD_RZ);
    cxDBSumSt.Text:=IntToStr(_KOD_ST);
    SUM_DB_ID_SM:=id[0];
    SUM_DB_ID_RZ:=id[1];
    SUM_DB_ID_ST:=id[2];
  end;
 end;
end;

procedure TSpOperWorkForm.cxKRSumSmPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  id:variant;
  _KOD_SM, _KOD_ST, _KOD_RZ: integer;
begin
  id:=GlobalSPR.GetSmets(self, DBHandle, Date, psmRazdSt);
  if VarArrayDimCount(id)>0
  then begin
   if id[0]<>NULL
   then begin
{              id[0]  -идентификатор сметы
              id[1]  -идентификатор раздела
              id[2]  -идентификатор статьи
              id[3]  -идентификатор группы смет
              id[4]  -наименование раздела
              id[5]  -наименование статьи
              id[6]  -наименование сметы
              id[7]  -номер раздела
              id[8]  -номер статьи
              id[9]  -код сметы
              id[10] -наименование группы смет
}
    _KOD_SM:=id[9];
    _KOD_RZ:=id[7];
    _KOD_ST:=id[8];
    cxKRSumSm.Text:=IntToStr(_KOD_SM);
    cxKRSumRz.Text:=IntToStr(_KOD_RZ);
    cxKRSumSt.Text:=IntToStr(_KOD_ST);
    SUM_KR_ID_SM:=id[0];
    SUM_KR_ID_RZ:=id[1];
    SUM_KR_ID_ST:=id[2];
  end;
 end;
end;

procedure TSpOperWorkForm.cxDbSchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  cxDbSch.Text:='';
  DB_ID_SCH:=0;
 end;
end;

procedure TSpOperWorkForm.cxKrSchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  cxKrSch.Text:='';
  KR_ID_SCH:=0;
 end;
end;

procedure TSpOperWorkForm.cxUnitProvPropertiesChange(Sender: TObject);
begin
 if cxUnitProv.Checked then
  cxUnitIndex.Enabled:=true
 else
  cxUnitIndex.Enabled:=false;
end;

end.


