unit EntryRest_Istochniki;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxMaskEdit,
  cxButtonEdit, cxLabel, cxContainer, cxEdit, cxTextEdit, cxCurrencyEdit,
  cxControls, cxGroupBox, GlobalSPR,
  cnConsts_Messages, cn_Common_Funcs, cnConsts, IBase, DM_EntryRest;

type
  Tfrm_EntryRestIstochniki_AE = class(TForm)
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
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Smeta_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Razdel_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Stat_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Kekv_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Persent_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Smeta_EditPropertiesEditValueChanged(Sender: TObject);
    procedure Smeta_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Razdel_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Stat_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Kekv_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Razdel_EditPropertiesEditValueChanged(Sender: TObject);
    procedure Stat_EditPropertiesEditValueChanged(Sender: TObject);
    procedure Kekv_EditPropertiesEditValueChanged(Sender: TObject);
  private
    PLanguageIndex: byte;
    DM:TDM_ER;
    DB_sp_Handle: TISC_DB_HANDLE;
    CurrentServerDate: TDate;
    procedure FormIniLanguage;
  public
     ID_SMETA  : int64;
     ID_RAZDEL : int64;
     ID_STAT   : int64;
     ID_KEKV   : int64;
    constructor  Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);reintroduce;
  end;

var
  frm_EntryRestIstochniki_AE: Tfrm_EntryRestIstochniki_AE;

implementation
const kav = '''';

{$R *.dfm}

constructor Tfrm_EntryRestIstochniki_AE.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);
begin
inherited Create(AOwner);
Screen.Cursor:=crHourGlass;
DB_sp_Handle:= DB_Handle;
FormIniLanguage();
Screen.Cursor:=crDefault;
end;

procedure Tfrm_EntryRestIstochniki_AE.FormIniLanguage;
begin
PLanguageIndex:=           cn_Common_Funcs.cnLanguageIndex();

Smeta_Label.Caption:=     cnConsts.cn_Smeta[PLanguageIndex];
Razdel_Label.Caption:=    cnConsts.cn_Razdel[PLanguageIndex];
Stat_Label.Caption:=      cnConsts.cn_Statya[PLanguageIndex];
Kekv_Label.Caption:=      cnConsts.cn_Kekv[PLanguageIndex];
Persent_Label.Caption:=   cnConsts.cn_Summa_Column[PLanguageIndex];

OkButton.Caption:=        cnConsts.cn_Accept[PLanguageIndex];
CancelButton.Caption:=    cnConsts.cn_Cancel[PLanguageIndex];

end;

procedure Tfrm_EntryRestIstochniki_AE.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure Tfrm_EntryRestIstochniki_AE.OKButtonClick(Sender: TObject);
var
  s:string;
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

 s:=Persent_Edit.Text;
 if s[1]='-' then
  begin
   Delete(S,1,1);
   Persent_Edit.Text:=s;
   if not FloatCheck(Persent_Edit.Text) then
    begin
     ShowMessage(cnConsts_Messages.cn_warningVvod_Percent[PLanguageIndex]);
     Persent_Edit.SetFocus;
     showmessage('1');
     exit;
    end;
   S:='-'+S;
   Persent_Edit.Text:=S;
  End
 else
  if not FloatCheck(Persent_Edit.Text) then
   begin
    ShowMessage(cnConsts_Messages.cn_warningVvod_Percent[PLanguageIndex]);
    Persent_Edit.SetFocus;
    showmessage('1');
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


 DM:=TDM_ER.Create(Self);
 DM.DB.Handle:=DB_sp_Handle;
 DM.ReadDataSet.SQLs.SelectSQL.Text :=
 'select * from PUB_GET_NAME_ST_BY_KOD ('+Razdel_Edit.Text +','+ Stat_Edit.Text+','+kav+datetostr(CurrentServerDate)+kav+')';
 DM.ReadDataSet.Open;
 if DM.ReadDataSet['ID_ST']<> null then ID_STAT:= DM.ReadDataSet['ID_ST'];
 DM.ReadDataSet.close;
 DM.Free;

 DM:=TDM_ER.Create(Self);
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

procedure Tfrm_EntryRestIstochniki_AE.FormCreate(Sender: TObject);
begin
 DM:=TDM_ER.Create(Self);
 DM.ReadDataSet.SQLs.SelectSQL.Text := 'select CUR_DATE from ST_GET_CURRENT_DATE';
 DM.DB.Handle:=DB_sp_Handle;
 DM.ReadDataSet.Open;
 CurrentServerDate:= DM.ReadDataSet['CUR_DATE'];
 DM.ReadDataSet.close;
 DM.Free;
end;

procedure Tfrm_EntryRestIstochniki_AE.Smeta_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then Razdel_Edit.SetFocus;
end;

procedure Tfrm_EntryRestIstochniki_AE.Razdel_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then Stat_Edit.SetFocus;
end;

procedure Tfrm_EntryRestIstochniki_AE.Stat_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then Kekv_Edit.SetFocus;
end;

procedure Tfrm_EntryRestIstochniki_AE.Kekv_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then OKButton.SetFocus;
end;

procedure Tfrm_EntryRestIstochniki_AE.Persent_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then Smeta_Edit.SetFocus;
end;

procedure Tfrm_EntryRestIstochniki_AE.Smeta_EditPropertiesEditValueChanged(
  Sender: TObject);
begin
 if Smeta_Edit.Text= '' then exit;
 if not cn_Common_Funcs.IntegerCheck(Smeta_Edit.Text) then begin
  ShowMessage(cnConsts_Messages.cn_warningVvod_Code[PLanguageIndex]);
  Smeta_description_Label.Clear;
  Smeta_description_Label.Visible:=false;
  Smeta_Edit.SetFocus;
  exit;
 end;

 DM:=TDM_ER.Create(Self);
 DM.ReadDataSet.SQLs.SelectSQL.Text := 'select ID_OBJECT, TITLE_OBJECT from PUB_GET_NAME_BUDG_BY_KOD ( '+Smeta_Edit.Text+','+kav+ datetostr(CurrentServerDate)+kav+',' +'1)';
 DM.DB.Handle:=DB_sp_Handle;
 DM.ReadDataSet.Open;


  if DM.ReadDataSet['ID_OBJECT']<> null then begin
  ID_SMETA  := DM.ReadDataSet['ID_OBJECT'];
 if DM.ReadDataSet['TITLE_OBJECT']<> null then begin
  Smeta_description_Label.Caption:= DM.ReadDataSet['TITLE_OBJECT'];
  Smeta_description_Label.Visible:=true;
  end
  else begin
  Smeta_description_Label.Clear;
  Smeta_description_Label.Visible:=false;
  end
 end
 else begin
  ShowMessage(cnConsts_Messages.cn_warningVvod_Smeta[PLanguageIndex]);
  Smeta_description_Label.Clear;
  Smeta_description_Label.Visible:=false;
  Smeta_Edit.SetFocus;
  DM.ReadDataSet.close;
  DM.Free;
  exit;
 end;

 DM.ReadDataSet.close;
 DM.Free;
end;

procedure Tfrm_EntryRestIstochniki_AE.Smeta_EditPropertiesButtonClick(
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


procedure Tfrm_EntryRestIstochniki_AE.Razdel_EditPropertiesButtonClick(
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

procedure Tfrm_EntryRestIstochniki_AE.Stat_EditPropertiesButtonClick(
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

procedure Tfrm_EntryRestIstochniki_AE.Kekv_EditPropertiesButtonClick(
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
//           id[0][0]  - идентификатор  ≈ ¬а
//           id[0][1]  - наименование  ≈ ¬а
//           id[0][2]  - код  ≈ ¬а

     ID_KEKV:=id[0][0];

     Kekv_Edit.Text:= id[0][2];
     Kekv_description_Label.Caption:=id[0][1];
     Kekv_description_Label.Visible:=true;
     end;
    end;
    end;
end;

procedure Tfrm_EntryRestIstochniki_AE.Razdel_EditPropertiesEditValueChanged(
  Sender: TObject);
begin
if Razdel_Edit.Text= '' then exit;
 if not cn_Common_Funcs.IntegerCheck(Razdel_Edit.Text) then begin
  ShowMessage(cnConsts_Messages.cn_warningVvod_Code[PLanguageIndex]);
  Razdel_description_Label.Clear;
  Razdel_description_Label.Visible:=false;
  Razdel_Edit.SetFocus;
  exit;
 end;

 DM:=TDM_ER.Create(Self);
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
 else begin
  ShowMessage(cnConsts_Messages.cn_warningVvod_Razdel[PLanguageIndex]);
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

procedure Tfrm_EntryRestIstochniki_AE.Stat_EditPropertiesEditValueChanged(
  Sender: TObject);
begin
if Stat_Edit.Text= '' then exit;
 if not cn_Common_Funcs.IntegerCheck(Stat_Edit.Text) then begin
  ShowMessage(cnConsts_Messages.cn_warningVvod_Code[PLanguageIndex]);
  Stat_description_Label.Clear;
  Stat_description_Label.Visible:=false;
  Stat_Edit.SetFocus;
  exit;
 end;

 DM:=TDM_ER.Create(Self);
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
 else begin
  ShowMessage(cnConsts_Messages.cn_warningVvod_Stat[PLanguageIndex]);
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

procedure Tfrm_EntryRestIstochniki_AE.Kekv_EditPropertiesEditValueChanged(
  Sender: TObject);
begin
if Kekv_Edit.Text= '' then exit;
 if not cn_Common_Funcs.IntegerCheck(Kekv_Edit.Text) then begin
  ShowMessage(cnConsts_Messages.cn_warningVvod_Code[PLanguageIndex]);
  Kekv_description_Label.Clear;
  Kekv_description_Label.Visible:=false;
  Kekv_Edit.SetFocus;
  exit;
 end;

 DM:=TDM_ER.Create(Self);
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
 else begin
  ShowMessage(cnConsts_Messages.cn_warningVvod_Kekv[PLanguageIndex]);
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
