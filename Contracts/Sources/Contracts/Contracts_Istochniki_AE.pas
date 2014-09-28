//******************************************************************************
// Проект "Контракты"
// Источники финансирования
// Чернявский А.Э. 2005г.
//******************************************************************************

unit Contracts_Istochniki_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ImgList, cxGraphics, cxContainer, cxEdit,
  cxProgressBar, dxStatusBar, cxControls, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxMaskEdit, cxButtonEdit, cxLabel, cxTextEdit, cxCurrencyEdit,
  cxGroupBox,
  ibase,
  cnConsts,DM, cn_Common_Funcs,cnConsts_Messages,
  GlobalSPR, cxDropDownEdit;

type
  Tfrm_Istochniki_AE = class(TForm)
    GroupBox: TcxGroupBox;
    Persent_Edit: TcxCurrencyEdit;
    Persent_Label: TcxLabel;
    Smeta_Edit: TcxButtonEdit;
    Razdel_Edit: TcxButtonEdit;
    Stat_Edit: TcxButtonEdit;
    Smeta_Label: TcxLabel;
    Razdel_Label: TcxLabel;
    Stat_Label: TcxLabel;
    Smeta_description_Label: TcxLabel;
    Razdel_description_Label: TcxLabel;
    Stat_description_Label: TcxLabel;
    P_Label: TcxLabel;
    Kekv_Edit: TcxButtonEdit;
    Kekv_description_Label: TcxLabel;
    Kekv_Label: TcxLabel;
    OKButton: TcxButton;
    CancelButton: TcxButton;
    id_stud_ComboBox: TcxComboBox;
    id_stud_Label: TLabel;
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Persent_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Smeta_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Razdel_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Stat_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Kekv_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Smeta_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Kekv_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure Razdel_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Stat_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Smeta_EditPropertiesEditValueChanged(Sender: TObject);
    procedure Razdel_EditPropertiesEditValueChanged(Sender: TObject);
    procedure Stat_EditPropertiesEditValueChanged(Sender: TObject);
    procedure Kekv_EditPropertiesEditValueChanged(Sender: TObject);
  private
    PLanguageIndex:byte;
    DB_sp_Handle:TISC_DB_HANDLE;
    DM, DM_DEF_IST :TDM_Contracts;
    CurrentServerDate: TDate;
    procedure FormIniLanguage;
  public
     ID_SMETA  : int64;
     ID_RAZDEL : int64;
     ID_STAT   : int64;
     ID_KEKV   : int64;
     IS_AE     : Boolean;
     constructor Create(AOwner:TComponent; LanguageIndex : byte; DB_Handle:TISC_DB_HANDLE);reintroduce;
  end;

implementation

uses Contract_Add_Edit;

const kav = '''';

{$R *.dfm}

constructor Tfrm_Istochniki_AE.Create(AOwner:TComponent; LanguageIndex : byte; DB_Handle:TISC_DB_HANDLE);
begin
 Screen.Cursor:=crHourGlass;
 inherited Create(AOwner);
 PLanguageIndex:= LanguageIndex;
 FormIniLanguage();
 DB_sp_Handle:= DB_Handle;
 Screen.Cursor:=crDefault;
 end;

procedure Tfrm_Istochniki_AE.FormIniLanguage;
begin
Persent_Label.Caption:=   cnConsts.cn_Persent_Column[PLanguageIndex];
Smeta_Label.Caption:=     cnConsts.cn_Smeta[PLanguageIndex];
Razdel_Label.Caption:=    cnConsts.cn_Razdel[PLanguageIndex];
Stat_Label.Caption:=      cnConsts.cn_Statya[PLanguageIndex];
Kekv_Label.Caption:=      cnConsts.cn_Kekv[PLanguageIndex];
id_stud_Label.Caption:=   cnConsts.cn_Studer_Osoba[PLanguageIndex];

OkButton.Caption:=        cnConsts.cn_Accept[PLanguageIndex];
CancelButton.Caption:=    cnConsts.cn_Cancel[PLanguageIndex];
end;


procedure Tfrm_Istochniki_AE.OKButtonClick(Sender: TObject);
begin
 if Persent_Edit.Value = 0 then
  begin
   showmessage(cnConsts.cn_Percent_Need[PLanguageIndex]);
   Persent_Edit.SetFocus;
   exit;
  end;

   if Smeta_Edit.text = '' then
  begin
   showmessage(cnConsts.cn_Smeta_Need[PLanguageIndex]);
   Smeta_Edit.SetFocus;
   exit;
  end;

   if Razdel_Edit.text = '' then
  begin
   showmessage(cnConsts.cn_Razdel_Need[PLanguageIndex]);
   Razdel_Edit.SetFocus;
   exit;
  end;

   if Stat_Edit.text = '' then
  begin
   showmessage(cnConsts.cn_Stat_Need[PLanguageIndex]);
   Stat_Edit.SetFocus;
   exit;
  end;

   if Kekv_Edit.text = '' then
  begin
   showmessage(cnConsts.cn_Kekv_Need[PLanguageIndex]);
   Kekv_Edit.SetFocus;
   exit;
  end;



 if not FloatCheck(Persent_Edit.Text) then begin
   ShowMessage(cnConsts_Messages.cn_warningVvod_Percent[PLanguageIndex]);
   Persent_Edit.SetFocus;
  exit;
 end;
 if Persent_Edit.Value > 100 then begin
   ShowMessage(cnConsts_Messages.cn_warning_PercentMoreThen100[PLanguageIndex]);
   Persent_Edit.SetFocus;
  exit;
 end;

  if not IntegerCheck(Smeta_Edit.Text) then begin
  ShowMessage(cnConsts_Messages.cn_warningVvod_Code[PLanguageIndex]);
  Smeta_Label.Clear;
  Smeta_Label.Visible:=false;
  Smeta_Edit.SetFocus;
  exit;
 end;
 if not IntegerCheck(Razdel_Edit.Text) then begin
  ShowMessage(cnConsts_Messages.cn_warningVvod_Code[PLanguageIndex]);
  Razdel_Label.Clear;
  Razdel_Label.Visible:=false;
  Razdel_Edit.SetFocus;
  exit;
 end;
 if not IntegerCheck(Stat_Edit.Text) then begin
  ShowMessage(cnConsts_Messages.cn_warningVvod_Code[PLanguageIndex]);
  Stat_Label.Clear;
  Stat_Label.Visible:=false;
  Stat_Edit.SetFocus;
  exit;
 end;
  if not IntegerCheck(Kekv_Edit.Text) then begin
  ShowMessage(cnConsts_Messages.cn_warningVvod_Code[PLanguageIndex]);
  Kekv_Label.Clear;
  Kekv_Label.Visible:=false;
  Kekv_Edit.SetFocus;
  exit;
 end;


 DM:=TDM_Contracts.Create(Self);
 DM.DB.Handle:=DB_sp_Handle;
 DM.ReadDataSet.SQLs.SelectSQL.Text :=
 'select * from PUB_GET_NAME_ST_BY_KOD ('+Razdel_Edit.Text +','+ Stat_Edit.Text+','+kav+datetostr(CurrentServerDate)+kav+')';
 DM.ReadDataSet.Open;
 if DM.ReadDataSet['ID_ST']<> null then ID_STAT:= DM.ReadDataSet['ID_ST'];
 DM.ReadDataSet.close;
 DM.Free;

 DM:=TDM_Contracts.Create(Self);
 DM.DB.Handle:=DB_sp_Handle;
 DM.ReadDataSet.SelectSQL.Text :=
 'select RESULT_VALUE from PUB_IS_CORRECT_SM_RAZD_ST ('+ inttostr(id_smeta)+','+inttostr(id_razdel)+','+inttostr(id_stat)+','+kav+datetostr(CurrentServerDate)+kav+')';
 DM.ReadDataSet.Open;
 if DM.ReadDataSet['RESULT_VALUE']=0 then begin
 ShowMessage(cnConsts_Messages.cn_warning_SmRozdStat[PLanguageIndex]);
 Smeta_Edit.SetFocus;
 DM.ReadDataSet.close;
 DM.Free;
 exit;
 end;
 DM.ReadDataSet.close;
 DM.Free;

ModalResult:=mrOk;
end;

procedure Tfrm_Istochniki_AE.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure Tfrm_Istochniki_AE.FormShow(Sender: TObject);
begin
  if ((Smeta_Edit.Text<>'') or
     (Razdel_Edit.Text<>'') or
     (Stat_Edit.Text<>'') or
     (Kekv_Edit.Text<>'')) Then Exit;

  // источники по-умолчанию
  DM_DEF_IST := TDM_Contracts.Create(self);
  DM_DEF_IST.DB.Handle := DB_sp_Handle;
  DM_DEF_IST.ReadDataSet.SelectSQL.Text := 'select * from CN_GET_DAEFAULT_ISTOCHNIKI';
  DM_DEF_IST.ReadDataSet.Open;
  if DM_DEF_IST.ReadDataSet['KOD_SMETA']  <> null then  Smeta_Edit.Text:= inttostr(DM_DEF_IST.ReadDataSet['KOD_SMETA']);
  if DM_DEF_IST.ReadDataSet['KOD_RAZDEL'] <> null then  Razdel_Edit.Text:= inttostr(DM_DEF_IST.ReadDataSet['KOD_RAZDEL']);
  if DM_DEF_IST.ReadDataSet['KOD_STAT']   <> null then  Stat_Edit.Text:=   inttostr(DM_DEF_IST.ReadDataSet['KOD_STAT']);
  if DM_DEF_IST.ReadDataSet['KOD_KEKV']   <> null then  Kekv_Edit.Text:=   inttostr(DM_DEF_IST.ReadDataSet['KOD_KEKV']);
  DM_DEF_IST.ReadDataSet.Close;
  DM_DEF_IST.Free;
 // Persent_Edit.setfocus;
end;

procedure Tfrm_Istochniki_AE.Persent_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then Smeta_Edit.SetFocus;
end;

procedure Tfrm_Istochniki_AE.Smeta_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then Razdel_Edit.SetFocus;
end;

procedure Tfrm_Istochniki_AE.Razdel_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then Stat_Edit.SetFocus;
end;

procedure Tfrm_Istochniki_AE.Stat_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then Kekv_Edit.SetFocus;
end;

procedure Tfrm_Istochniki_AE.Kekv_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then OKButton.SetFocus;
end;

procedure Tfrm_Istochniki_AE.Smeta_EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  id:variant;
begin
    id:=GlobalSPR.GetSmets(self,DB_sp_Handle,CurrentServerDate,psmRazdSt);
    if VarArrayDimCount(id)>0 //- проверка на то что id вариантный массив
    then begin
     if id[0]<>NULL
     then begin
//               id[0]  -идентификатор сметы
//               id[1]  -идентификатор раздела
//               id[2]  -идентификатор статьи
//               id[3]  -идентификатор группы смет
//               id[4]  -наименование раздела
//               id[5]  -наименование статьи
//               id[6]  -наименование сметы
//               id[7]  -номер раздела
//               id[8]  -номер статьи
//               id[9]  -код сметы
//               id[10] -наименование группы смет

     ID_SMETA  := id[0];
     ID_RAZDEL := id[1];
     ID_STAT   := id[2];

     Smeta_Edit.Text:=vartostr(id[9]);
     Smeta_description_Label.Caption:=vartostr(id[6]);
     Razdel_Edit.Text:= vartostr(id[7]);
     Razdel_description_Label.Caption:= vartostr(id[4]);
     Stat_Edit.Text:= vartostr(id[8]);
     Stat_description_Label.Caption:= vartostr(id[5]);

     Smeta_description_Label.Visible:=true;
     Razdel_description_Label.Visible:=true;
     Stat_description_Label.Visible:=true;
     end;
   end;
end;

procedure Tfrm_Istochniki_AE.Kekv_EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  id:variant;
begin
    id:=GlobalSPR.GetKEKVSpr
        (self, DB_sp_Handle, FSNormal,CurrentServerDate,DEFAULT_ROOT_ID);

    if VarArrayDimCount(id)>0 //- проверка на то что id вариантный массив
    then begin

    if VarArrayDimCount(id)>0
    then begin
     if id[0][0]<>NULL
     then begin
//           id[0][0]  - идентификатор КЕКВа
//           id[0][1]  - наименование КЕКВа
//           id[0][2]  - код КЕКВа

     ID_KEKV:=id[0][0];

     Kekv_Edit.Text:= id[0][2];
     Kekv_description_Label.Caption:=id[0][1];
     Kekv_description_Label.Visible:=true;
     end;
    end;
    end;
end;

procedure Tfrm_Istochniki_AE.FormCreate(Sender: TObject);
begin
 DM:=TDM_Contracts.Create(Self);
 DM.ReadDataSet.SQLs.SelectSQL.Text := 'select CUR_DATE from ST_GET_CURRENT_DATE';
 DM.DB.Handle:=DB_sp_Handle;
 DM.ReadDataSet.Open;
 CurrentServerDate:= DM.ReadDataSet['CUR_DATE'];
 DM.ReadDataSet.close;
 DM.Free;

 IS_AE:=False;
end;

procedure Tfrm_Istochniki_AE.Razdel_EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  id:variant;
begin
    id:=GlobalSPR.GetSmets(self,DB_sp_Handle,CurrentServerDate,psmRazdSt);
    if VarArrayDimCount(id)>0 //- проверка на то что id вариантный массив
    then begin
     if id[0]<>NULL
     then begin
//               id[0]  -идентификатор сметы
//               id[1]  -идентификатор раздела
//               id[2]  -идентификатор статьи
//               id[3]  -идентификатор группы смет
//               id[4]  -наименование раздела
//               id[5]  -наименование статьи
//               id[6]  -наименование сметы
//               id[7]  -номер раздела
//               id[8]  -номер статьи
//               id[9]  -код сметы
//               id[10] -наименование группы смет

     ID_SMETA  := id[0];
     ID_RAZDEL := id[1];
     ID_STAT   := id[2];

     Smeta_Edit.Text:=vartostr(id[9]);
     Smeta_description_Label.Caption:=vartostr(id[6]);
     Razdel_Edit.Text:= vartostr(id[7]);
     Razdel_description_Label.Caption:= vartostr(id[4]);
     Stat_Edit.Text:= vartostr(id[8]);
     Stat_description_Label.Caption:= vartostr(id[5]);

     Smeta_description_Label.Visible:=true;
     Razdel_description_Label.Visible:=true;
     Stat_description_Label.Visible:=true;
     end;
   end;
end;

procedure Tfrm_Istochniki_AE.Stat_EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  id:variant;
begin
    id:=GlobalSPR.GetSmets(self,DB_sp_Handle,CurrentServerDate,psmRazdSt);
    if VarArrayDimCount(id)>0 //- проверка на то что id вариантный массив
    then begin
     if id[0]<>NULL
     then begin
//               id[0]  -идентификатор сметы
//               id[1]  -идентификатор раздела
//               id[2]  -идентификатор статьи
//               id[3]  -идентификатор группы смет
//               id[4]  -наименование раздела
//               id[5]  -наименование статьи
//               id[6]  -наименование сметы
//               id[7]  -номер раздела
//               id[8]  -номер статьи
//               id[9]  -код сметы
//               id[10] -наименование группы смет

     ID_SMETA  := id[0];
     ID_RAZDEL := id[1];
     ID_STAT   := id[2];

     Smeta_Edit.Text:=vartostr(id[9]);
     Smeta_description_Label.Caption:=vartostr(id[6]);
     Razdel_Edit.Text:= vartostr(id[7]);
     Razdel_description_Label.Caption:= vartostr(id[4]);
     Stat_Edit.Text:= vartostr(id[8]);
     Stat_description_Label.Caption:= vartostr(id[5]);

     Smeta_description_Label.Visible:=true;
     Razdel_description_Label.Visible:=true;
     Stat_description_Label.Visible:=true;
     end;
   end;
end;

procedure Tfrm_Istochniki_AE.Smeta_EditPropertiesEditValueChanged(
  Sender: TObject);
begin
if Smeta_Edit.Text= '' then exit;
 if not cn_Common_Funcs.IntegerCheck(Smeta_Edit.Text) then begin
  ShowMessage('Введен неверный код.');
  Smeta_description_Label.Clear;
  Smeta_description_Label.Visible:=false;
  Smeta_Edit.SetFocus;
  exit;
 end;

 DM:=TDM_Contracts.Create(Self);
 DM.ReadDataSet.SQLs.SelectSQL.Text := 'select ID_OBJECT, TITLE_OBJECT from PUB_GET_NAME_BUDG_BY_KOD ( '+Smeta_Edit.Text+','+kav+ datetostr(CurrentServerDate)+kav+',' +'1)';
 DM.DB.Handle:=DB_sp_Handle;
 DM.ReadDataSet.Open;

  if DM.ReadDataSet['ID_OBJECT']<> null then
   begin
    ID_SMETA  := DM.ReadDataSet['ID_OBJECT'];
    if DM.ReadDataSet['TITLE_OBJECT']<> null then
     begin
      Smeta_description_Label.Caption:= DM.ReadDataSet['TITLE_OBJECT'];
      Smeta_description_Label.Visible:=true;
     end
    else
     begin
      Smeta_description_Label.Clear;
      Smeta_description_Label.Visible:=false;
     end
   end
 else
  begin
   if IS_AE then Smeta_Edit.Text:= ''
            else
             begin
              ShowMessage(cnConsts_Messages.cn_warningVvod_Smeta[PLanguageIndex]);
              Smeta_description_Label.Clear;
              Smeta_description_Label.Visible:=false;
              Smeta_Edit.SetFocus;
              DM.ReadDataSet.close;
              DM.Free;
              exit;
             End;
 end;

 DM.ReadDataSet.close;
 DM.Free;
end;

procedure Tfrm_Istochniki_AE.Razdel_EditPropertiesEditValueChanged(
  Sender: TObject);
begin
 if Razdel_Edit.Text= '' then exit;
 if not cn_Common_Funcs.IntegerCheck(Razdel_Edit.Text) then begin
  ShowMessage('Введен неверный код.');
  Razdel_description_Label.Clear;
  Razdel_description_Label.Visible:=false;
  Razdel_Edit.SetFocus;
  exit;
 end;

 DM:=TDM_Contracts.Create(Self);
 DM.ReadDataSet.SQLs.SelectSQL.Text := 'select ID_OBJECT, TITLE_OBJECT from PUB_GET_NAME_BUDG_BY_KOD ( '+Razdel_Edit.Text+','+kav+datetostr(CurrentServerDate)+kav+',' +'2)';
 DM.DB.Handle:=DB_sp_Handle;
 DM.ReadDataSet.Open;

  if DM.ReadDataSet['ID_OBJECT']<> null then begin
  ID_RAZDEL  := DM.ReadDataSet['ID_OBJECT'];
 if DM.ReadDataSet['TITLE_OBJECT']<> null then begin
  Razdel_description_Label.Caption:= DM.ReadDataSet['TITLE_OBJECT'];
  Razdel_description_Label.Visible:=true;
  end
  else begin
  Razdel_description_Label.Clear;
  Razdel_description_Label.Visible:=false;
  end
 end
 else
  begin
   if IS_AE then Razdel_Edit.Text:= ''
            else ShowMessage(cnConsts_Messages.cn_warningVvod_Razdel[PLanguageIndex]);
  Razdel_description_Label.Clear;
  Razdel_description_Label.Visible:=false;
  Razdel_Edit.SetFocus;
  DM.ReadDataSet.close;
  DM.Free;
  exit;
 end;

 DM.ReadDataSet.close;
 DM.Free;
end;

procedure Tfrm_Istochniki_AE.Stat_EditPropertiesEditValueChanged(
  Sender: TObject);
begin
 if Stat_Edit.Text= '' then exit;
 if not cn_Common_Funcs.IntegerCheck(Stat_Edit.Text) then begin
  ShowMessage('Введен неверный код.');
  Stat_description_Label.Clear;
  Stat_description_Label.Visible:=false;
  Stat_Edit.SetFocus;
  exit;
 end;

 DM:=TDM_Contracts.Create(Self);
 DM.ReadDataSet.SQLs.SelectSQL.Text := 'select ID_RAZD_ST, RAZD_ST_TITLE from ST_GET_ID_STAT_BY_CODE ('+ IntToStr(id_razdel) +','+ Stat_Edit.Text +')';
 DM.DB.Handle:=DB_sp_Handle;
 DM.ReadDataSet.Open;

  if DM.ReadDataSet['ID_RAZD_ST']<> null then begin
  ID_STAT  := DM.ReadDataSet['ID_RAZD_ST'];
 if DM.ReadDataSet['RAZD_ST_TITLE']<> null then begin
  Stat_description_Label.Caption:= DM.ReadDataSet['RAZD_ST_TITLE'];
  Stat_description_Label.Visible:=true;
  end
  else begin
  Stat_description_Label.Clear;
  Stat_description_Label.Visible:=false;
  end
 end
 else
  begin
   if IS_AE then Stat_Edit.Text:= ''
            else ShowMessage(cnConsts_Messages.cn_warningVvod_Stat[PLanguageIndex]);
  Stat_description_Label.Clear;
  Stat_description_Label.Visible:=false;
  Stat_Edit.SetFocus;
  DM.ReadDataSet.close;
  DM.Free;
  exit;
 end;

 DM.ReadDataSet.close;
 DM.Free;
end;

procedure Tfrm_Istochniki_AE.Kekv_EditPropertiesEditValueChanged(
  Sender: TObject);
begin
 if Kekv_Edit.Text= '' then exit;
 if not cn_Common_Funcs.IntegerCheck(Kekv_Edit.Text) then begin
  ShowMessage('Введен неверный код.');
  Kekv_description_Label.Clear;
  Kekv_description_Label.Visible:=false;
  Kekv_Edit.SetFocus;
  exit;
 end;

 DM:=TDM_Contracts.Create(Self);
 DM.ReadDataSet.SQLs.SelectSQL.Text := 'select ID_KEKV, KEKV_TITLE from PUB_SPR_KEKV_INFO_EX2 ( '+Kekv_Edit.Text+','+kav+datetostr(CurrentServerDate)+kav+')';
 DM.DB.Handle:=DB_sp_Handle;
 DM.ReadDataSet.Open;

  if DM.ReadDataSet['ID_KEKV']<> null then begin
  ID_KEKV  := DM.ReadDataSet['ID_KEKV'];
  if DM.ReadDataSet['KEKV_TITLE']<> null then begin
  Kekv_description_Label.Caption:= DM.ReadDataSet['KEKV_TITLE'];
  Kekv_description_Label.Visible:=true;
  end
  else begin
  Kekv_description_Label.Clear;
  Kekv_description_Label.Visible:=false;
  end
 end
 else
  begin
   if IS_AE then Kekv_Edit.Text:= ''
            else ShowMessage(cnConsts_Messages.cn_warningVvod_Kekv[PLanguageIndex]);
  Kekv_description_Label.Clear;
  Kekv_description_Label.Visible:=false;
  Kekv_Edit.SetFocus;
  DM.ReadDataSet.close;
  DM.Free;
  exit;
 end;

 DM.ReadDataSet.close;
 DM.Free;
end;
end.

