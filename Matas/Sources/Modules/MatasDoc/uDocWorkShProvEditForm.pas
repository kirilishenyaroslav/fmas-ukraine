{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль работы с документами                           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uDocWorkShProvEditForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uSpMatSch, uPackageManager, GlobalSPR, cxLookAndFeelPainters,
  StdCtrls, cxButtons, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit, ibase, cxCurrencyEdit, uMatasVars, uResources, uMatasUtils,
  cxCheckBox, Kernel;

type
  TDocWorkShProvEditForm = class(TForm)
    Label7: TLabel;
    cxNameDbSch: TcxButtonEdit;
    Label8: TLabel;
    cxNameKrSch: TcxButtonEdit;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    Label6: TLabel;
    cxSumma: TcxCurrencyEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    cxDBKEKV: TcxButtonEdit;
    cxDbSmeta: TcxButtonEdit;
    Label9: TLabel;
    cxKRSmeta: TcxButtonEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    cxKRKEKV: TcxButtonEdit;
    cxDogEdit: TcxButtonEdit;
    Label2: TLabel;
    cxCheckKr: TcxCheckBox;
    cxKrSchManage: TcxButton;
    cxDbSchManage: TcxButton;
    cxDBRazdel: TcxTextEdit;
    cxDBStatya: TcxTextEdit;
    cxKRRazdel: TcxTextEdit;
    cxKRStatya: TcxTextEdit;
    procedure OkButtonClick(Sender: TObject);
    procedure cxNameDbSchPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxNameDbSchExit(Sender: TObject);
    procedure cxNameDbSchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxNameKrSchExit(Sender: TObject);
    procedure cxNameKrSchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxNameKrSchPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxSummaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxDbSmetaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxKRSmetaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxDbSmetaPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure cxKRSmetaPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxDBKEKVPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxDBKEKVKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxKRKEKVKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxKRKEKVPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxCheckKrPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   DBHANDLE : TISC_DB_HANDLE;
   DB_KOD_DOG, DB_ID_DOG: int64;
   DB_ID_SCH, KR_ID_SCH: integer;
   KR_KOD_DOG, KR_ID_DOG: int64;
   DB_ID_SM, DB_ID_RZ, DB_ID_ST, DB_ID_KEKV: integer;
   KR_ID_SM, KR_ID_RZ, KR_ID_ST, KR_ID_KEKV: integer;
   DB_NAME_SM, KR_NAME_SM, DB_NAME_RZ, KR_NAME_RZ, DB_NAME_ST, KR_NAME_ST, DB_NAME_KEKV, KR_NAME_KEKV: string;
   DB_KOD_SM, KR_KOD_SM, DB_KOD_RZ, KR_KOD_RZ, DB_KOD_ST, KR_KOD_ST, DB_KOD_KEKV, KR_KOD_KEKV: integer;
  end;

var
  DocWorkShProvEditForm: TDocWorkShProvEditForm;

implementation

uses uDocWorkOstForm, uDocWorkForm, uDocWorkProv, uDocWorkMarks;

{$R *.dfm}

procedure TDocWorkShProvEditForm.OkButtonClick(Sender: TObject);
var
 STRU:WIZARD_GET_PROV_INFO;
begin
 if (DB_ID_SCH>0) and (KR_ID_SCH>0) then
 begin
  if _CHECK_PROV_BY_MANAGER then
  begin
    // запускаем менеджер проводок
    STRU.DBHANDLE:=DBHANDLE;
    STRU.ACTUAL_DATE:=_MATAS_PERIOD;
    STRU.MODE:=11;
    STRU.WIZARD_FORM_SH:=false;
    STRU.INFO_PANEL_SH:=true;
    STRU.NOT_DIF_BDG_FG:=not cxCheckKr.Checked;
    STRU.PROP_BUDG_NUM:=0;
    STRU.ID_LANGUAGE:=1;
    STRU.SCH_SET_FLAG:=0;
    STRU.CR_BY_DT:=0;
    STRU.ID_FORM_UCH:=0;
    STRU.ID_REG_UCH:=0;
    STRU.ID_SCH_IN:=KR_ID_SCH;
    STRU.AOWNER:=self;

    STRU.ID_OPER:=0;
    STRU.KR_ID_SCH:=KR_ID_SCH;
    STRU.KR_ID_SCH_KOD:='';
    STRU.KR_ID_SCH_TIT:='';

    STRU.DB_ID_SCH:=DB_ID_SCH;
    STRU.DB_ID_SCH_KOD:='';
    STRU.DB_ID_SCH_TIT:='';

    STRU.DB_ID_SMETA:=DB_ID_SM;
    STRU.DB_KOD_SMETA:=DB_KOD_SM;
    STRU.DB_TITLE_SMETA:='';

    STRU.DB_ID_RAZD:=DB_ID_RZ;
    STRU.DB_KOD_RAZD:=DB_KOD_RZ;
    STRU.DB_TITLE_RAZD:='';

    STRU.DB_ID_STAT:=DB_ID_ST;
    STRU.DB_KOD_STAT:=DB_KOD_ST;
    STRU.DB_TITLE_STAT:='';

    STRU.DB_ID_SM_GR:=0;
    STRU.DB_TITLE_SM_GR:='';

    STRU.DB_ID_KEKV:=DB_ID_KEKV;
    STRU.DB_KOD_KEKV:=DB_KOD_KEKV;
    STRU.DB_KEKV_TITLE:='';

    STRU.KR_ID_SMETA:=KR_ID_SM;
    STRU.KR_KOD_SMETA:=KR_KOD_SM;
    STRU.KR_TITLE_SMETA:='';

    STRU.KR_ID_RAZD:=KR_ID_RZ;
    STRU.KR_KOD_RAZD:=KR_KOD_RZ;
    STRU.KR_TITLE_RAZD:='';

    STRU.KR_ID_STAT:=KR_ID_ST;
    STRU.KR_KOD_STAT:=KR_KOD_ST;
    STRU.KR_TITLE_STAT:='';

    STRU.KR_ID_SM_GR:=0;
    STRU.KR_TITLE_SM_GR:='';

    STRU.KR_ID_KEKV:=KR_ID_KEKV;
    STRU.KR_KOD_KEKV:=KR_KOD_KEKV;
    STRU.KR_KEKV_TITLE:='';

    STRU.FACED_ID_DOC:=0;
    STRU.FACED_ID_PROV:=0;
{       FACED_FLAG       : Boolean;         // Флаг (true=проводка должна наложится на существующую проводку, false=)
       FACED_ID_DOC     : Int64;           // Идентфикатор документа, на проводку которого будет осуществляться наложение
       FACED_ID_PROV    : Int64;           // Идентфикатор встречной проводки на которую будет осуществляться наложение
       FACED_CR_BY_DT   : Integer;         // Главный счет проводки на которую будет осуществляться наложение
       FACED_PROV_SUMMA : Currency;        // Сумма проводки на которую будет осуществляться наложение
       FACED_ID_DOG     : Int64;           // Договор проводки на которую будет осуществляться наложение
       FACED_KOD_DOG    : Int64 ;          // Код Договор проводки на которую будет осуществляться наложение
       FACED_ID_MAN     : Int64;           // Физ лицо проводки на которую будет осуществляться наложение
       FACED_ID_PAYER   : Int64;           // Плательщик проводки на которую будет осуществляться наложение
}

    STRU.DB_ANALIZE1:=0;           // Дебетовая аналитика
    STRU.DB_ANALIZE2:=0;           // Дебетовая аналитика
    STRU.DB_ANALIZE3:=0;           // Дебетовая аналитика
    STRU.DB_ANALIZE4:=0;           // Дебетовая аналитика
    STRU.DB_ANALIZE5:=0;           // Дебетовая аналитика
    STRU.DB_ANALIZE6:=0;           // Дебетовая аналитика
    STRU.DB_ANALIZE7:=0;           // Дебетовая аналитика
    STRU.DB_ANALIZE8:=0;           // Дебетовая аналитика
    STRU.DB_ANALIZE9:=0;           // Дебетовая аналитика
    STRU.DB_ANALIZE10:=0;          // Дебетовая аналитика

    STRU.KR_ANALIZE1:=0;           // Кредитовая аналитика
    STRU.KR_ANALIZE2:=0;           // Кредитовая аналитика
    STRU.KR_ANALIZE3:=0;           // Кредитовая аналитика
    STRU.KR_ANALIZE4:=0;           // Кредитовая аналитика
    STRU.KR_ANALIZE5:=0;           // Кредитовая аналитика
    STRU.KR_ANALIZE6:=0;           // Кредитовая аналитика
    STRU.KR_ANALIZE7:=0;           // Кредитовая аналитика
    STRU.KR_ANALIZE8:=0;           // Кредитовая аналитика
    STRU.KR_ANALIZE9:=0;           // Кредитовая аналитика
    STRU.KR_ANALIZE10:=0;          // Кредитовая аналитика
    if Kernel.WizardGetProvInfo(@STRU)=true then
    begin
     //меняем значения на значения из менеджера
     DB_ID_SCH:=STRU.DB_ID_SCH;
     DB_ID_SM:=STRU.DB_ID_SMETA;
     DB_ID_RZ:=STRU.DB_ID_RAZD;
     DB_ID_ST:=STRU.DB_ID_STAT;
     DB_ID_KEKV:=STRU.DB_ID_KEKV;
     DB_NAME_SM:=STRU.DB_TITLE_SMETA;
     KR_NAME_SM:=STRU.KR_TITLE_SMETA;
     DB_NAME_RZ:=STRU.DB_TITLE_RAZD;
     KR_NAME_RZ:=STRU.KR_TITLE_RAZD;
     DB_NAME_ST:=STRU.DB_TITLE_STAT;
     KR_NAME_ST:=STRU.KR_TITLE_STAT;
     DB_NAME_KEKV:=STRU.DB_KEKV_TITLE;
     KR_NAME_KEKV:=STRU.KR_KEKV_TITLE;
     DB_KOD_SM:=STRU.DB_KOD_SMETA;
     KR_KOD_SM:=STRU.KR_KOD_SMETA;
     DB_KOD_RZ:=STRU.DB_KOD_RAZD;
     KR_KOD_RZ:=STRU.KR_KOD_RAZD;
     DB_KOD_ST:=STRU.DB_KOD_STAT;
     KR_KOD_ST:=STRU.KR_KOD_STAT;
     DB_KOD_KEKV:=STRU.DB_KOD_KEKV;
     KR_KOD_KEKV:=STRU.KR_KOD_KEKV;
     cxNameDbSch.EditText:=STRU.DB_ID_SCH_KOD;
     cxNameKrSch.EditText:=STRU.KR_ID_SCH_KOD;
     cxDbSmeta.EditText:=IntToStr(STRU.DB_KOD_SMETA);
     cxDBRazdel.Text:=IntToStr(STRU.DB_KOD_RAZD);
     cxDBStatya.Text:=IntToStr(STRU.DB_KOD_STAT);
     cxDBKEKV.EditText:=IntToStr(STRU.DB_KOD_KEKV);
     cxKrSmeta.EditText:=IntToStr(STRU.KR_KOD_SMETA);
     cxKrRazdel.Text:=IntToStr(STRU.KR_KOD_RAZD);
     cxKrStatya.Text:=IntToStr(STRU.KR_KOD_STAT);
     cxKrKEKV.EditText:=IntToStr(STRU.KR_KOD_KEKV);
     ModalResult:=mrOk;
    end;
  end
  else
   ModalResult:=mrOk;
 end
 else
  ShowMessage('Необходимо заполнить все поля!');
end;

procedure TDocWorkShProvEditForm.cxNameDbSchPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Res : Variant;
begin
 Res:=GlobalSPR.GetSch(self,DBHandle, fsNormal, _MATAS_PERIOD, _ID_SCH_ROOT, -1, DB_ID_SCH);
 if VarArrayDimCount(Res)>0 then
 begin
   DB_ID_Sch := Res[0][0];
   cxNameDbSch.Text := VarToStr(RES[0][3]);
  end;
end;

procedure TDocWorkShProvEditForm.cxNameDbSchExit(Sender: TObject);
begin
  if (Owner as TDocWorkProv).PubSchDataSet.Locate('SCH_NUMBER',cxNameDBSch.Text,[]) then
  begin
   DB_ID_SCH := (Owner as TDocWorkProv).PubSchDataSetID_SCH.Value;
   cxNameDbSch.Text := (Owner as TDocWorkProv).PubSchDataSetSCH_NUMBER.Value;
  end
  else
  begin
   ShowMessage('Указанный счет не найден в справочнике счетов');
   DB_ID_SCH:=0;
  end;
end;

procedure TDocWorkShProvEditForm.cxNameDbSchKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key=VK_RETURN then
  cxNameKrSch.SetFocus;
end;

procedure TDocWorkShProvEditForm.cxNameKrSchExit(Sender: TObject);
begin
  if (Owner as TDocWorkProv).PubSchDataSet.Locate('SCH_NUMBER',cxNameKrSch.Text,[]) then
  begin
   KR_ID_SCH := (Owner as TDocWorkProv).PubSchDataSetID_SCH.Value;
   cxNameKrSch.Text := (Owner as TDocWorkProv).PubSchDataSetSCH_NUMBER.Value;
  end
  else
  begin
   ShowMessage('Указанный счет не найден в справочнике счетов');
   KR_ID_SCH:=0;
  end;
end;

procedure TDocWorkShProvEditForm.cxNameKrSchKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key=VK_RETURN then
  cxSumma.SetFocus;
end;

procedure TDocWorkShProvEditForm.cxNameKrSchPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
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

procedure TDocWorkShProvEditForm.cxSummaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key=VK_RETURN then
  OkButton.SetFocus;
end;

procedure TDocWorkShProvEditForm.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (Key=VK_RETURN) and (Shift<>[ssCtrl])  then
  Key:=VK_TAB;
 if Key=VK_ESCAPE	then
  CancelButton.SetFocus;
 if (Key=VK_F10) or ((Key=VK_END) and (Shift=[ssCtrl])) then
  OkButton.SetFocus;
end;

procedure TDocWorkShProvEditForm.cxDbSmetaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  cxDBSmeta.Text:='';
  DB_ID_SM:=0;
  DB_NAME_SM:='';
  DB_KOD_SM:=0;
 end;
end;

procedure TDocWorkShProvEditForm.cxKRSmetaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  cxKRSmeta.Text:='';
  KR_ID_SM:=0;
  KR_NAME_SM:='';
  KR_KOD_SM:=0;
 end;
end;

procedure TDocWorkShProvEditForm.cxDbSmetaPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  id:variant;
begin
  id:=GlobalSPR.GetSmetsEx(self, DBHandle, _MATAS_PERIOD, psmRazdSt, DB_ID_SM, DB_ID_RZ, DB_ID_ST);
  if VarArrayDimCount(id)>0
  then begin
   if id[0]<>NULL
   then begin
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
    if (KR_ID_SM=0) or (not cxCheckKr.Checked) then
    begin
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
    end
  end;
 end;
end;

procedure TDocWorkShProvEditForm.FormCreate(Sender: TObject);
begin
  OkButton.Caption:=MAT_BUTTON_OK_CONST;
  CancelButton.Caption:=MAT_BUTTON_CANCEL_CONST;
  DB_ID_SCH:=0;
  cxNameDbSch.Text:='';
  KR_ID_SCH:=0;
  cxNameKrSch.Text:='';
  DB_ID_SM:=0;
  DB_ID_RZ:=0;
  DB_ID_ST:=0;
  DB_ID_KEKV:=0;
  KR_ID_SM:=0;
  KR_ID_RZ:=0;
  KR_ID_ST:=0;
  KR_ID_KEKV:=0;
end;

procedure TDocWorkShProvEditForm.cxKRSmetaPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  id:variant;
begin
  id:=GlobalSPR.GetSmetsEx(self, DBHandle, _MATAS_PERIOD, psmRazdSt, KR_ID_SM, KR_ID_RZ, KR_ID_ST);
  if VarArrayDimCount(id)>0
  then begin
   if id[0]<>NULL
   then begin
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
    if (DB_ID_SM=0) then
    begin
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
end;

procedure TDocWorkShProvEditForm.cxDBKEKVPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
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
   if (KR_ID_KEKV=0) or (not cxCheckKr.Checked) then begin
    KR_ID_KEKV:=id[0][0];
    KR_NAME_KEKV:=id[0][1];
    KR_KOD_KEKV:=id[0][2];
    cxKRKEKV.Text:=IntToStr(KR_KOD_KEKV);
   end
  end;
 end;
end;

procedure TDocWorkShProvEditForm.cxDBKEKVKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  cxDBKekv.Text:='';
  DB_ID_KEKV:=0;
  DB_NAME_KEKV:='';
  DB_KOD_KEKV:=0;
 end;
end;

procedure TDocWorkShProvEditForm.cxKRKEKVKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  cxKRKekv.Text:='';
  KR_ID_KEKV:=0;
  KR_NAME_KEKV:='';
  KR_KOD_KEKV:=0;
 end;
end;

procedure TDocWorkShProvEditForm.cxKRKEKVPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
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
   if DB_ID_KEKV=0 then begin
    DB_ID_KEKV:=id[0][0];
    DB_NAME_KEKV:=id[0][1];
    DB_KOD_KEKV:=id[0][2];
    cxDBKEKV.Text:=IntToStr(DB_KOD_KEKV);
   end
  end;
 end;
end;

procedure TDocWorkShProvEditForm.cxCheckKrPropertiesChange(
  Sender: TObject);
begin
 if cxCheckKr.Checked then
 begin
  cxKRSmeta.Enabled:=true;
  cxKRRazdel.Enabled:=true;
  cxKRStatya.Enabled:=true;
  cxKRKEKV.Enabled:=true;
 end;
 if not cxCheckKr.Checked then
 begin
  cxKRSmeta.Enabled:=false;
  cxKRRazdel.Enabled:=false;
  cxKRStatya.Enabled:=false;
  cxKRKEKV.Enabled:=false;
 end;
end;

end.
