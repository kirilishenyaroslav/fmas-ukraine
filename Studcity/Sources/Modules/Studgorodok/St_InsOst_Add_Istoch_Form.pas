unit St_InsOst_Add_Istoch_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxMaskEdit,
  cxButtonEdit, cxTextEdit, cxCurrencyEdit, cxContainer, cxEdit, cxLabel,
  cxControls, cxGroupBox, GlobalSPR, DB, FIBDataSet, pFIBDataSet,
  St_Proc, st_ConstUnit;

type
  TSt_InsOst_Form = class(TForm)
    cxGroupBox1: TcxGroupBox;
    SummaLabel: TcxLabel;
    SummaEdit: TcxCurrencyEdit;
    Smeta_Edit: TcxButtonEdit;
    Razdel_Edit: TcxButtonEdit;
    Stat_Edit: TcxButtonEdit;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    Smeta_Label: TcxLabel;
    Razdel_Label: TcxLabel;
    Stat_Label: TcxLabel;
    Kekv_Edit: TcxButtonEdit;
    Kekv_Label: TcxLabel;
    cxLabel6: TcxLabel;
    GroupBox1: TGroupBox;
    OKButton: TcxButton;
    CancelButton: TcxButton;
    ReadDataSet: TpFIBDataSet;
    procedure CancelButtonClick(Sender: TObject);
    procedure Smeta_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Smeta_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Stat_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Razdel_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Kekv_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Smeta_EditPropertiesEditValueChanged(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure Razdel_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Razdel_EditPropertiesEditValueChanged(Sender: TObject);
    procedure Stat_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Stat_EditPropertiesEditValueChanged(Sender: TObject);
    procedure Kekv_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Kekv_EditPropertiesEditValueChanged(Sender: TObject);
    procedure SummaEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
   Cur_date: string;
   PLanguageIndex: byte;
   procedure FormIniLanguage();
  public
      id_smeta, id_razdel, id_stat, id_kekv: int64;
  end;

var
    St_InsOst_Form: TSt_InsOst_Form;
    const kav = ''''; // это кавычки


implementation

uses DataModule1_Unit, Unit_of_Utilits;

{$R *.dfm}
procedure TSt_InsOst_Form.FormIniLanguage();
begin
 // индекс €зыка (1-укр, 2 - рус)
 PLanguageIndex:=               St_Proc.cnLanguageIndex;
 //названи€ кнопок
 OkButton.Caption :=            st_ConstUnit.st_Accept[PLanguageIndex];
 CancelButton.Caption :=        st_ConstUnit.st_Cancel[PLanguageIndex];
 // сумма
 SummaLabel.Caption :=          st_ConstUnit.st_Sum[PLanguageIndex];
 // смета
 cxLabel3.Caption :=            st_ConstUnit.st_Smeta[PLanguageIndex];
 // раздел
 cxLabel4.Caption :=            st_ConstUnit.st_Razdel[PLanguageIndex];
 // стать€
 cxLabel5.Caption :=            st_ConstUnit.st_Stat[PLanguageIndex];
 // кекв
 cxLabel6.Caption :=            st_ConstUnit.st_KEKV[PLanguageIndex];
end;


procedure TSt_InsOst_Form.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TSt_InsOst_Form.Smeta_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  id:variant;
begin
    id:=GlobalSPR.GetSmets(self,DataModule1.DB.Handle,DataModule1_Unit.DataModule1.CURRENT_TIMESTAMP,psmRazdSt);
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

procedure TSt_InsOst_Form.Smeta_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then Razdel_Edit.SetFocus;
end;

procedure TSt_InsOst_Form.Stat_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then Kekv_Edit.SetFocus;
end;

procedure TSt_InsOst_Form.Razdel_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then Stat_Edit.SetFocus;
end;

procedure TSt_InsOst_Form.Kekv_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then OKButton.SetFocus;
end;

procedure TSt_InsOst_Form.Smeta_EditPropertiesEditValueChanged(
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

procedure TSt_InsOst_Form.OKButtonClick(Sender: TObject);
begin
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

 if SummaEdit.Value=0 then begin
  ShowMessage(pchar(st_ConstUnit.st_10[PLanguageIndex]));
  SummaEdit.SetFocus;
  exit;
 end;

if not FloatCheck(SummaEdit.Text) then begin
  ShowMessage(pchar(st_ConstUnit.st_6[PLanguageIndex]));
  SummaEdit.SetFocus;
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
 ModalResult := mrOK;
end;

procedure TSt_InsOst_Form.Razdel_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var
  id:variant;
  begin
    id:=GlobalSPR.GetSmets(self,DataModule1.DB.Handle,DataModule1_Unit.DataModule1.CURRENT_TIMESTAMP,psmRazdSt);
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

procedure TSt_InsOst_Form.Razdel_EditPropertiesEditValueChanged(
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

procedure TSt_InsOst_Form.Stat_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  id:variant;
begin
    id:=GlobalSPR.GetSmets(self,DataModule1.DB.Handle,DataModule1_Unit.DataModule1.CURRENT_TIMESTAMP,psmRazdSt);
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

procedure TSt_InsOst_Form.Stat_EditPropertiesEditValueChanged(
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

procedure TSt_InsOst_Form.Kekv_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  id:variant;
begin
    id:=GlobalSPR.GetKEKVSpr(self, DataModule1.DB.Handle,
                                         FSNormal,
                                         DataModule1_Unit.DataModule1.CURRENT_TIMESTAMP,
                                         DEFAULT_ROOT_ID);

    if VarArrayDimCount(id)>0 //- проверка на то что id вариантный массив
    then begin

    if VarArrayDimCount(id)>0
    then begin
     if id[0][0]<>NULL
     then begin
//           id[0][0]  - идентификатор  ≈ ¬а
//           id[0][1]  - наименование  ≈ ¬а
//           id[0][2]  - код  ≈ ¬а

     id_kekv:=id[0][0];

     Kekv_Edit.Text:= id[0][2];
     Kekv_Label.Caption:=id[0][1];
     Kekv_Label.Visible:=true;
     end;
    end;
    end;
end;

procedure TSt_InsOst_Form.Kekv_EditPropertiesEditValueChanged(
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

procedure TSt_InsOst_Form.SummaEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then Smeta_Edit.SetFocus;
end;

procedure TSt_InsOst_Form.FormCreate(Sender: TObject);
begin
ReadDataSet.Close;
ReadDataSet.SelectSQL.Clear;
ReadDataSet.SelectSQL.Text := 'select CUR_DATE from ST_GET_CURRENT_DATE';
ReadDataSet.Open;
Cur_date:= ReadDataSet['CUR_DATE'];
ReadDataSet.Close;
FormIniLanguage();
end;

procedure TSt_InsOst_Form.FormShow(Sender: TObject);
begin
SummaEdit.SetFocus;
end;

end.
