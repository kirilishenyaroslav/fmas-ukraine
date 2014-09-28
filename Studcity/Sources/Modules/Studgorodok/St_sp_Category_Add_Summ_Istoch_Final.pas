//***********************************************************************
//* Проект "Студгородок"                                                *
//* Справочник категорий - добавление источников финансирования         *
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//***********************************************************************
unit St_sp_Category_Add_Summ_Istoch_Final;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit, cxLabel,
  cxControls, cxContainer, cxEdit, cxGroupBox, cxCurrencyEdit, cxMaskEdit,
  cxButtonEdit, DataModule1_Unit,GlobalSPR, DB, FIBDataSet, pFIBDataSet,
  ActnList, Math,
  St_Proc, st_ConstUnit;

type
  TCategoryFormAddFin = class(TForm)
    cxGroupBox1: TcxGroupBox;
    SummaLabel: TcxLabel;
    PercentLabel: TcxLabel;
    OKButton: TcxButton;
    CancelButton: TcxButton;
    SummaEdit: TcxCurrencyEdit;
    PercentEdit: TcxCurrencyEdit;
    S_SummaEdit: TcxCurrencyEdit;
    cxLabel1: TcxLabel;
    Persent_Subs_Edit: TcxCurrencyEdit;
    cxLabel2: TcxLabel;
    Smeta_Edit: TcxButtonEdit;
    Razdel_Edit: TcxButtonEdit;
    Stat_Edit: TcxButtonEdit;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    Smeta_Label: TcxLabel;
    Razdel_Label: TcxLabel;
    Stat_Label: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    Kekv_Edit: TcxButtonEdit;
    Kekv_Label: TcxLabel;
    cxLabel6: TcxLabel;
    GroupBox1: TGroupBox;
    ReadDataSet: TpFIBDataSet;
    Category_ActionList: TActionList;
    Add_Action: TAction;
    Edit_Action: TAction;
    Delete_Action: TAction;
    Ok_Action: TAction;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SummaEditKeyPress(Sender: TObject; var Key: Char);
    procedure PercentEditKeyPress(Sender: TObject; var Key: Char);
    procedure S_SummaEditKeyPress(Sender: TObject; var Key: Char);
    procedure Persent_Subs_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Smeta_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Razdel_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Stat_EditKeyPress(Sender: TObject; var Key: Char);
    procedure PercentEditExit(Sender: TObject);
    procedure Persent_Subs_EditExit(Sender: TObject);
    procedure SummaEditExit(Sender: TObject);
    procedure S_SummaEditExit(Sender: TObject);
    procedure Smeta_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Razdel_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Stat_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure PercentEditPropertiesEditValueChanged(Sender: TObject);
    procedure Persent_Subs_EditPropertiesEditValueChanged(Sender: TObject);
    procedure SummaEditPropertiesEditValueChanged(Sender: TObject);
    procedure S_SummaEditPropertiesEditValueChanged(Sender: TObject);
    procedure Smeta_EditPropertiesEditValueChanged(Sender: TObject);
    procedure Razdel_EditPropertiesEditValueChanged(Sender: TObject);
    procedure Stat_EditPropertiesEditValueChanged(Sender: TObject);
    procedure Kekv_EditPropertiesEditValueChanged(Sender: TObject);
    procedure Kekv_EditKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure Ok_ActionExecute(Sender: TObject);
    procedure PercentEditEnter(Sender: TObject);
    procedure Persent_Subs_EditEnter(Sender: TObject);
    procedure SummaEditEnter(Sender: TObject);
    procedure S_SummaEditEnter(Sender: TObject);
  private
  Cur_date: string;
  PLanguageIndex: byte;
  procedure FormIniLanguage();

  public
    AvtoRedact, SumRedact: boolean;
    id_smeta, id_razdel, id_stat, id_kekv : int64;
  end;

var
  CategoryFormAddFin: TCategoryFormAddFin;
  const kav = ''''; // это кавычки

implementation
uses Unit_of_Utilits, St_sp_Category_Add_Summ_Form,
  st_sp_category_FORM_ADD;
{$R *.dfm}

procedure TCategoryFormAddFin.FormIniLanguage();
begin
 // индекс языка (1-укр, 2 - рус)
 PLanguageIndex:=              St_Proc.cnLanguageIndex;
 //названия кнопок
 OKButton.Caption :=       st_ConstUnit.st_Accept[PLanguageIndex];
 CancelButton.Caption :=   st_ConstUnit.st_Cancel[PLanguageIndex];

  // смета
 cxLabel3.Caption :=            st_ConstUnit.st_Smeta[PLanguageIndex];
 // раздел
 cxLabel4.Caption :=            st_ConstUnit.st_Razdel[PLanguageIndex];
 // статья
 cxLabel5.Caption :=            st_ConstUnit.st_Stat[PLanguageIndex];
 // кекв
 cxLabel6.Caption :=            st_ConstUnit.st_KEKV[PLanguageIndex];

 SummaLabel.Caption:=       st_ConstUnit.st_SummaSliv[PLanguageIndex];
 PercentLabel.Caption:=     st_ConstUnit.st_PercentSliv[PLanguageIndex];
 cxLabel1.Caption:=         st_ConstUnit.st_SubSumma[PLanguageIndex];
 cxLabel2.Caption:=         st_ConstUnit.st_SubPercent[PLanguageIndex];
end;

procedure TCategoryFormAddFin.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TCategoryFormAddFin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TCategoryFormAddFin.OKButtonClick(Sender: TObject);
begin
{if SummaEdit.Value = 0 then begin
  ShowMessage('Введите cумму отчислений');
  SummaEdit.SetFocus;
  exit;
 end;}


if PercentEdit.Value = 0 then begin
  ShowMessage(pchar(st_ConstUnit.st_1[PLanguageIndex]));
  PercentEdit.SetFocus;
  exit;
 end;

{ if S_SummaEdit.Value = 0 then begin
  ShowMessage('Введите cумму субсидии');
  S_SummaEdit.SetFocus;
  exit;
 end;

 if Persent_Subs_Edit.Value = 0 then begin
  ShowMessage('Введите процент субсидии');
  Persent_Subs_Edit.SetFocus;
  exit;
 end;}

if Smeta_Edit.Text = '' then begin
  ShowMessage(pchar(st_ConstUnit.st_2[PLanguageIndex]));
  Smeta_Edit.SetFocus;
  exit;
 end;

 if Razdel_Edit.Text = '' then begin
  ShowMessage(pchar(st_ConstUnit.st_3[PLanguageIndex]));
  Razdel_Edit.SetFocus;
  exit;
 end;

 if Stat_Edit.Text = '' then begin
  ShowMessage(pchar(st_ConstUnit.st_4[PLanguageIndex]));
  Stat_Edit.SetFocus;
  exit;
 end;

 if Kekv_Edit.Text = '' then begin
  ShowMessage(pchar(st_ConstUnit.st_5[PLanguageIndex]));
  Kekv_Edit.SetFocus;
  exit;
 end;

if not FloatCheck(SummaEdit.Text) then begin
  ShowMessage(pchar(st_ConstUnit.st_6[PLanguageIndex]));
  SummaEdit.SetFocus;
  exit;
 end;
 if not FloatCheck(PercentEdit.Text) then begin
  ShowMessage(pchar(st_ConstUnit.st_7[PLanguageIndex]));
   PercentEdit.SetFocus;
  exit;
 end;
 if PercentEdit.Value > 100 then begin
  ShowMessage(pchar(st_ConstUnit.st_8[PLanguageIndex]));
   PercentEdit.SetFocus;
  exit;
 end;
 if Persent_Subs_Edit.Value > 100 then begin
  ShowMessage(pchar(st_ConstUnit.st_9[PLanguageIndex]));
   Persent_Subs_Edit.SetFocus;
  exit;
 end;
  if not IntegerCheck(Smeta_Edit.Text) then begin
  ShowMessage(pchar(st_ConstUnit.st_mess_Code_need[PLanguageIndex]));
  Smeta_Label.Clear;
  Smeta_Label.Visible:=false;
  Smeta_Edit.SetFocus;
  exit;
 end;
 if not IntegerCheck(Razdel_Edit.Text) then begin
  ShowMessage(pchar(st_ConstUnit.st_mess_Code_need[PLanguageIndex]));
  Razdel_Label.Clear;
  Razdel_Label.Visible:=false;
  Razdel_Edit.SetFocus;
  exit;
 end;
 if not IntegerCheck(Stat_Edit.Text) then begin
  ShowMessage(pchar(st_ConstUnit.st_mess_Code_need[PLanguageIndex]));
  Stat_Label.Clear;
  Stat_Label.Visible:=false;
  Stat_Edit.SetFocus;
  exit;
 end;
  if not IntegerCheck(Kekv_Edit.Text) then begin
  ShowMessage(pchar(st_ConstUnit.st_mess_Code_need[PLanguageIndex]));
  Kekv_Label.Clear;
  Kekv_Label.Visible:=false;
  Kekv_Edit.SetFocus;
  exit;
 end;

ReadDataSet.Close;
ReadDataSet.SelectSQL.Clear;
ReadDataSet.SelectSQL.Text := 'select * from PUB_GET_NAME_ST_BY_KOD ('+Razdel_Edit.Text +','+ Stat_Edit.Text+','+kav+Cur_date+kav+')';
ReadDataSet.Open;
if ReadDataSet['ID_ST']<> null then id_stat:= ReadDataSet['ID_ST'];
ReadDataSet.Close;

ReadDataSet.Close;
ReadDataSet.SelectSQL.Clear;
ReadDataSet.SelectSQL.Text := 'select RESULT_VALUE from PUB_IS_CORRECT_SM_RAZD_ST ('+ inttostr(id_smeta)+','+inttostr(id_razdel)+','+inttostr(id_stat)+','+kav+Cur_date+kav+')';
ReadDataSet.Open;
 if ReadDataSet['RESULT_VALUE']=0 then begin
  ShowMessage(pchar(st_ConstUnit.st_11[PLanguageIndex]));
 Smeta_Edit.SetFocus;
 ReadDataSet.Close;
 exit;
 end;
 ReadDataSet.Close;
 CategoryFormAdd.RedactTrue;
 ModalResult := mrOK;
end;

procedure TCategoryFormAddFin.FormShow(Sender: TObject);
begin
AvtoRedact:= true;

ReadDataSet.Close;
ReadDataSet.SelectSQL.Clear;
ReadDataSet.SelectSQL.Text := 'select CUR_DATE from ST_GET_CURRENT_DATE';
ReadDataSet.Open;
Cur_date:= ReadDataSet['CUR_DATE'];
ReadDataSet.Close;
SummaEdit.SetFocus;
end;


procedure TCategoryFormAddFin.SummaEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then PercentEdit.SetFocus;
end;

procedure TCategoryFormAddFin.PercentEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then S_SummaEdit.SetFocus;
end;

procedure TCategoryFormAddFin.S_SummaEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then Persent_Subs_Edit.SetFocus;
end;

procedure TCategoryFormAddFin.Persent_Subs_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then Smeta_Edit.SetFocus;
end;

procedure TCategoryFormAddFin.Smeta_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then Razdel_Edit.SetFocus;
end;

procedure TCategoryFormAddFin.Razdel_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then Stat_Edit.SetFocus;
end;

procedure TCategoryFormAddFin.Stat_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then Kekv_Edit.SetFocus;
end;

procedure TCategoryFormAddFin.PercentEditExit(Sender: TObject);
begin
if PercentEdit.Value > 100.00001 then begin
ShowMessage(pchar(st_ConstUnit.st_NotCorrectMore100Pers[PLanguageIndex]));
if PercentEdit.CanFocusEx then
PercentEdit.SetFocus;
exit;
end;
{if PercentEdit.Value<>0 then
SummaEdit.Value:=CategoryFormAddSum.SummaEdit.Value* (PercentEdit.Value/100);
if PercentEdit.Value=0 then
PercentEdit.Value:= SummaEdit.Value*100/CategoryFormAddSum.SummaEdit.Value;}
end;

procedure TCategoryFormAddFin.Persent_Subs_EditExit(Sender: TObject);
begin
if Persent_Subs_Edit.Value > 100.00001 then begin
ShowMessage(pchar(st_ConstUnit.st_NotCorrectMore100Pers[PLanguageIndex]));
if Persent_Subs_Edit.CanFocusEx then
Persent_Subs_Edit.SetFocus;
exit;
end;
{if Persent_Subs_Edit.Value<>0 then
S_SummaEdit.Value:=CategoryFormAddSum.SubsMaxEdit.Value* (Persent_Subs_Edit.Value/100)
else
Persent_Subs_Edit.Value := S_SummaEdit.Value*100/CategoryFormAddSum.SubsSummaEdit.Value;}
end;

procedure TCategoryFormAddFin.SummaEditExit(Sender: TObject);
begin
{if CategoryFormAddSum.SummaEdit.Value <> 0   then
if (SummaEdit.Value <> 0) and (PercentEdit.Value = 0) then
PercentEdit.Value:= SummaEdit.Value*100/CategoryFormAddSum.SummaEdit.Value;}
end;

procedure TCategoryFormAddFin.S_SummaEditExit(Sender: TObject);
begin
{if CategoryFormAddSum.SubsSummaEdit.Value <> 0 then
if (S_SummaEdit.Value <> 0) and (Persent_Subs_Edit.Value = 0) then
Persent_Subs_Edit.Value := S_SummaEdit.Value*100/CategoryFormAddSum.SubsMaxEdit.Value;}
end;


procedure TCategoryFormAddFin.Smeta_EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  id:variant;
begin
    id:=GlobalSPR.GetSmets(self,DataModule1.pFIBDatabase1.Handle,DataModule1_Unit.DataModule1.CURRENT_TIMESTAMP,psmRazdSt);
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

     id_smeta  := id[0];
     id_razdel := id[1];
     id_stat   := id[2];

     Smeta_Edit.Text:=vartostr(id[9]);
     Smeta_Label.Caption:=vartostr(id[6]);
     Razdel_Edit.Text:= vartostr(id[7]);
     Razdel_Label.Caption:= vartostr(id[4]);
     Stat_Edit.Text:= vartostr(id[8]);
     Stat_Label.Caption:= vartostr(id[5]);
     Smeta_Label.Visible:=true;
     Razdel_Label.Visible:=true;
     Stat_Label.Visible:=true;
     end;
   end;
end;


procedure TCategoryFormAddFin.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  id:variant;
begin
    id:=GlobalSPR.GetKEKVSpr(self, DataModule1.pFIBDatabase1.Handle,
                                         FSNormal,
                                         DataModule1_Unit.DataModule1.CURRENT_TIMESTAMP,
                                         DEFAULT_ROOT_ID);

    if VarArrayDimCount(id)>0 //- проверка на то что id вариантный массив
    then begin

    if VarArrayDimCount(id)>0
    then begin
     if id[0][0]<>NULL
     then begin
//           id[0][0]  - идентификатор КЕКВа
//           id[0][1]  - наименование КЕКВа
//           id[0][2]  - код КЕКВа

     id_kekv:=id[0][0];

     Kekv_Edit.Text:= id[0][2];
     Kekv_Label.Caption:=id[0][1];
     Kekv_Label.Visible:=true;
     end;
    end;
    end;
end;

procedure TCategoryFormAddFin.Razdel_EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  id:variant;
begin
    id:=GlobalSPR.GetSmets(self,DataModule1.pFIBDatabase1.Handle,DataModule1_Unit.DataModule1.CURRENT_TIMESTAMP,psmRazdSt);
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

     id_smeta  := id[0];
     id_razdel := id[1];
     id_stat   := id[2];

     Smeta_Edit.Text:=vartostr(id[9]);
     Smeta_Label.Caption:=vartostr(id[6]);
     Razdel_Edit.Text:= vartostr(id[7]);
     Razdel_Label.Caption:= vartostr(id[4]);
     Stat_Edit.Text:= vartostr(id[8]);
     Stat_Label.Caption:= vartostr(id[5]);
     Smeta_Label.Visible:=true;
     Razdel_Label.Visible:=true;
     Stat_Label.Visible:=true;
     end;
   end;
end;

procedure TCategoryFormAddFin.Stat_EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  id:variant;
begin
    id:=GlobalSPR.GetSmets(self,DataModule1.pFIBDatabase1.Handle,DataModule1_Unit.DataModule1.CURRENT_TIMESTAMP,psmRazdSt);
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

     id_smeta  := id[0];
     id_razdel := id[1];
     id_stat   := id[2];

     Smeta_Edit.Text:=vartostr(id[9]);
     Smeta_Label.Caption:=vartostr(id[6]);
     Razdel_Edit.Text:= vartostr(id[7]);
     Razdel_Label.Caption:= vartostr(id[4]);
     Stat_Edit.Text:= vartostr(id[8]);
     Stat_Label.Caption:= vartostr(id[5]);
     Smeta_Label.Visible:=true;
     Razdel_Label.Visible:=true;
     Stat_Label.Visible:=true;
     end;
   end;
end;

procedure TCategoryFormAddFin.PercentEditPropertiesEditValueChanged(
  Sender: TObject);
begin
if AvtoRedact then begin
if PercentEdit.Value<>0 then
if SumRedact then
SummaEdit.Value:=CategoryFormAddSum.SummaEdit.Value* PercentEdit.Value/100;
if PercentEdit.Value=0 then
PercentEdit.Value:= SummaEdit.Value/CategoryFormAddSum.SummaEdit.Value*100;
end;
end;

procedure TCategoryFormAddFin.Persent_Subs_EditPropertiesEditValueChanged(
  Sender: TObject);
begin
if AvtoRedact then begin
if Persent_Subs_Edit.Value<>0 then
if SumRedact then
S_SummaEdit.Value:=CategoryFormAddSum.SubsSummaEdit.Value* Persent_Subs_Edit.Value/100 ;
if CategoryFormAddSum.SubsSummaEdit.Value <> 0 then
if Persent_Subs_Edit.Value = 0 then
Persent_Subs_Edit.Value := S_SummaEdit.Value/CategoryFormAddSum.SubsSummaEdit.Value*100;
end;
end;



procedure TCategoryFormAddFin.SummaEditPropertiesEditValueChanged(
  Sender: TObject);
begin
if AvtoRedact then
if CategoryFormAddSum.SummaEdit.Value <> 0   then
if ((SummaEdit.Value <> 0) and (PercentEdit.Value = 0)) then
PercentEdit.Value:= SummaEdit.Value/CategoryFormAddSum.SummaEdit.Value*100;
end;

procedure TCategoryFormAddFin.S_SummaEditPropertiesEditValueChanged(
  Sender: TObject);
begin
if AvtoRedact then 
if CategoryFormAddSum.SubsSummaEdit.Value <> 0 then
if ((S_SummaEdit.Value <> 0) and (Persent_Subs_Edit.Value = 0)) then
Persent_Subs_Edit.Value := S_SummaEdit.Value/CategoryFormAddSum.SubsSummaEdit.Value*100;
end;

procedure TCategoryFormAddFin.Smeta_EditPropertiesEditValueChanged(
  Sender: TObject);
begin
if Smeta_Edit.Text= '' then exit;
 if not IntegerCheck(Smeta_Edit.Text) then begin
  ShowMessage(pchar(st_ConstUnit.st_NotCorrectCode[PLanguageIndex]));
  Smeta_Label.Clear;
  Smeta_Label.Visible:=false;
  Smeta_Edit.SetFocus;
  exit;
 end;
ReadDataSet.Close;
ReadDataSet.SelectSQL.Clear;
ReadDataSet.SelectSQL.Text := 'select ID_OBJECT, TITLE_OBJECT from PUB_GET_NAME_BUDG_BY_KOD ( '+Smeta_Edit.Text+','+kav+Cur_date+kav+',' +'1)';
ReadDataSet.Open;
 if ReadDataSet['ID_OBJECT']<> null then begin
  id_smeta  := ReadDataSet['ID_OBJECT'];
 if ReadDataSet['TITLE_OBJECT']<> null then begin
  Smeta_Label.Caption:= ReadDataSet['TITLE_OBJECT'];
  Smeta_Label.Visible:=true;
  end
  else begin
  Smeta_Label.Clear;
  Smeta_Label.Visible:=false;
  end
 end
 else begin
  ShowMessage(pchar(st_ConstUnit.st_NotCorrectSmeta[PLanguageIndex]));
  Smeta_Label.Clear;
  Smeta_Label.Visible:=false;
  Smeta_Edit.SetFocus;
  ReadDataSet.Close;
  exit;
 end;
ReadDataSet.Close;
end;

procedure TCategoryFormAddFin.Razdel_EditPropertiesEditValueChanged(
  Sender: TObject);
begin
if Razdel_Edit.Text= '' then exit;
 if not IntegerCheck(Razdel_Edit.Text) then begin
  ShowMessage(pchar(st_ConstUnit.st_NotCorrectCode[PLanguageIndex]));
  Razdel_Label.Clear;
  Razdel_Label.Visible:=false;
  Razdel_Edit.SetFocus;
  exit;
 end;
ReadDataSet.Close;
ReadDataSet.SelectSQL.Clear;
ReadDataSet.SelectSQL.Text := 'select ID_OBJECT, TITLE_OBJECT from PUB_GET_NAME_BUDG_BY_KOD ( '+Razdel_Edit.Text+','+kav+Cur_date+kav+',' +'2)';
ReadDataSet.Open;
 if ReadDataSet['ID_OBJECT']<> null then begin
  id_razdel  := ReadDataSet['ID_OBJECT'];
 if ReadDataSet['TITLE_OBJECT']<> null then begin
  Razdel_Label.Caption:= ReadDataSet['TITLE_OBJECT'];
  Razdel_Label.Visible:=true;
  end
  else begin
  Razdel_Label.Clear;
  Razdel_Label.Visible:=false;
  end
 end
 else begin
  ShowMessage(pchar(st_ConstUnit.st_NotCorrectRazdel[PLanguageIndex]));
  Razdel_Label.Clear;
  Razdel_Label.Visible:=false;
  Razdel_Edit.SetFocus;
  ReadDataSet.Close;
  exit;
 end;
ReadDataSet.Close;
end;

procedure TCategoryFormAddFin.Stat_EditPropertiesEditValueChanged(
  Sender: TObject);
begin
if Stat_Edit.Text= '' then exit;
 if not IntegerCheck(Stat_Edit.Text) then begin
  ShowMessage(pchar(st_ConstUnit.st_NotCorrectCode[PLanguageIndex]));
  Stat_Label.Clear;
  Stat_Label.Visible:=false;
  Stat_Edit.SetFocus;
  exit;
 end;
ReadDataSet.Close;
ReadDataSet.SelectSQL.Clear;
ReadDataSet.SelectSQL.Text := 'select ID_RAZD_ST, RAZD_ST_TITLE from ST_GET_ID_STAT_BY_CODE ('+ IntToStr(id_razdel) +','+ Stat_Edit.Text +')';
ReadDataSet.Open;
 if ReadDataSet['ID_RAZD_ST']<> null then begin
  id_stat  := ReadDataSet['ID_RAZD_ST'];
 if ReadDataSet['RAZD_ST_TITLE']<> null then begin
  Stat_Label.Caption:= ReadDataSet['RAZD_ST_TITLE'];
  Stat_Label.Visible:=true;
  end
  else begin
  Stat_Label.Clear;
  Stat_Label.Visible:=false;
  end
 end
 else begin
  ShowMessage(pchar(st_ConstUnit.st_NotCorrectStat[PLanguageIndex]));
  Stat_Label.Clear;
  Stat_Label.Visible:=false;
  Stat_Edit.SetFocus;
  ReadDataSet.Close;
  exit;
 end;
ReadDataSet.Close;
end;

procedure TCategoryFormAddFin.Kekv_EditPropertiesEditValueChanged(
  Sender: TObject);
begin
  if Kekv_Edit.Text= '' then exit;
 if not IntegerCheck(Kekv_Edit.Text) then begin
  ShowMessage(pchar(st_ConstUnit.st_NotCorrectCode[PLanguageIndex]));
  Kekv_Label.Clear;
  Kekv_Label.Visible:=false;
  Kekv_Edit.SetFocus;
  exit;
 end;
ReadDataSet.Close;
ReadDataSet.SelectSQL.Clear;
ReadDataSet.SelectSQL.Text := 'select ID_KEKV, KEKV_TITLE from PUB_SPR_KEKV_INFO_EX2 ( '+Kekv_Edit.Text+','+kav+Cur_date+kav+')';
ReadDataSet.Open;
 if ReadDataSet['ID_KEKV']<> null then begin
  id_kekv  := ReadDataSet['ID_KEKV'];
 if ReadDataSet['KEKV_TITLE']<> null then begin
  Kekv_Label.Caption:= ReadDataSet['KEKV_TITLE'];
  Kekv_Label.Visible:=true;
  end
  else begin
  Kekv_Label.Clear;
  Kekv_Label.Visible:=false;
  end
 end
 else begin
  ShowMessage(pchar(st_ConstUnit.st_NotCorrectKekv[PLanguageIndex]));
  Kekv_Label.Clear;
  Kekv_Label.Visible:=false;
  Kekv_Edit.SetFocus;
  ReadDataSet.Close;
  exit;
 end;
ReadDataSet.Close;
end;

procedure TCategoryFormAddFin.Kekv_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then OKButton.SetFocus;
end;

procedure TCategoryFormAddFin.FormCreate(Sender: TObject);
begin
ReadDataSet.Close;
ReadDataSet.SelectSQL.Clear;
ReadDataSet.SelectSQL.Text := 'select CUR_DATE from ST_GET_CURRENT_DATE';
ReadDataSet.Open;
Cur_date:= ReadDataSet['CUR_DATE'];
ReadDataSet.Close;

FormIniLanguage();
end;

procedure TCategoryFormAddFin.Ok_ActionExecute(Sender: TObject);
begin
CategoryFormAddFin.OKButtonClick(Sender);
end;

procedure TCategoryFormAddFin.PercentEditEnter(Sender: TObject);
begin
PercentEdit.Value := RoundTo(PercentEdit.Value, -4);
end;

procedure TCategoryFormAddFin.Persent_Subs_EditEnter(Sender: TObject);
begin
Persent_Subs_Edit.Value := RoundTo(Persent_Subs_Edit.Value, -4);
end;

procedure TCategoryFormAddFin.SummaEditEnter(Sender: TObject);
begin
SummaEdit.Value := RoundTo(SummaEdit.Value, -2);
end;

procedure TCategoryFormAddFin.S_SummaEditEnter(Sender: TObject);
begin
S_SummaEdit.Value := RoundTo(S_SummaEdit.Value, -2);
end;

end.



