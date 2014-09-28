unit frmIstochniki_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxMaskEdit,
  cxButtonEdit, cxLabel, cxContainer, cxEdit, cxTextEdit, cxCurrencyEdit,
  cxControls, cxGroupBox, ibase, GlobalSPR, st_ConstUnit, St_Proc, DB,
  FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase;

type
  TfrmIstochniki = class(TForm)
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
    ReadDataSet: TpFIBDataSet;
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure Smeta_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Razdel_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Stat_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Kekv_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormShow(Sender: TObject);
    procedure Smeta_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Persent_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Razdel_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Stat_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Kekv_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Smeta_EditPropertiesEditValueChanged(Sender: TObject);
    procedure Razdel_EditPropertiesEditValueChanged(Sender: TObject);
    procedure Stat_EditPropertiesEditValueChanged(Sender: TObject);
    procedure Kekv_EditPropertiesEditValueChanged(Sender: TObject);
  private
    procedure FormIniLanguage();
  public
    DB_Handle : TISC_DB_HANDLE;
     ID_SMETA  :int64;
     ID_RAZDEL :int64;
     ID_STAT   :int64;
     ID_KEKV   :int64;
     PLanguageIndex : byte;
  end;

var
  frmIstochniki: TfrmIstochniki;
  const kav = '''';
implementation

{$R *.dfm}

procedure TfrmIstochniki.FormIniLanguage;
begin
Persent_Label.Caption:=   st_ConstUnit.st_Sum[PLanguageIndex];
Smeta_Label.Caption:=     st_ConstUnit.st_Smeta[PLanguageIndex];
Razdel_Label.Caption:=    st_ConstUnit.st_Razdel[PLanguageIndex];
Stat_Label.Caption:=      st_ConstUnit.st_Stat[PLanguageIndex];
Kekv_Label.Caption:=      st_ConstUnit.st_Kekv[PLanguageIndex];

OkButton.Caption:=        st_ConstUnit.st_Accept[PLanguageIndex];
CancelButton.Caption:=    st_ConstUnit.st_Cancel[PLanguageIndex];
end;

procedure TfrmIstochniki.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmIstochniki.OKButtonClick(Sender: TObject);
begin
if Persent_Edit.Value = 0 then begin
  ShowMessage(pchar(st_ConstUnit.st_NeedSum[PLanguageIndex]));
  Persent_Edit.SetFocus;
  exit;
 end;

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
ReadDataSet.SelectSQL.Text := 'select * from PUB_GET_NAME_ST_BY_KOD ('+Razdel_Edit.Text +','+ Stat_Edit.Text+','+kav+datetostr(now)+kav+')';
ReadDataSet.Open;
if ReadDataSet['ID_ST']<> null then id_stat:= ReadDataSet['ID_ST'];
ReadDataSet.Close;

ReadDataSet.Close;
ReadDataSet.SelectSQL.Clear;
ReadDataSet.SelectSQL.Text := 'select RESULT_VALUE from PUB_IS_CORRECT_SM_RAZD_ST ('+ inttostr(id_smeta)+','+inttostr(id_razdel)+','+inttostr(id_stat)+','+kav+datetostr(now)+kav+')';
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

procedure TfrmIstochniki.Smeta_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  id:variant;
begin
    id:=GlobalSPR.GetSmets(self,DB_Handle,now,psmRazdSt);
    if VarArrayDimCount(id)>0 //- проверка на то что id вариантный массив
    then begin
     if id[0]<>NULL
     then begin

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

procedure TfrmIstochniki.Razdel_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  id:variant;
begin
    id:=GlobalSPR.GetSmets(self,DB_Handle,now,psmRazdSt);
    if VarArrayDimCount(id)>0 //- проверка на то что id вариантный массив
    then begin
     if id[0]<>NULL
     then begin

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

procedure TfrmIstochniki.Stat_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  id:variant;
begin
    id:=GlobalSPR.GetSmets(self,DB_Handle,now,psmRazdSt);
    if VarArrayDimCount(id)>0 //- проверка на то что id вариантный массив
    then begin
     if id[0]<>NULL
     then begin

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

procedure TfrmIstochniki.Kekv_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  id:variant;
begin
    id:=GlobalSPR.GetKEKVSpr
        (self, DB_Handle, FSNormal,now,DEFAULT_ROOT_ID);

    if VarArrayDimCount(id)>0 //- проверка на то что id вариантный массив
    then begin

    if VarArrayDimCount(id)>0
    then begin
     if id[0][0]<>NULL
     then begin

     ID_KEKV:=id[0][0];

     Kekv_Edit.Text:= id[0][2];
     Kekv_description_Label.Caption:=id[0][1];
     Kekv_description_Label.Visible:=true;
     end;
    end;
    end;
end;

procedure TfrmIstochniki.FormShow(Sender: TObject);
begin
FormIniLanguage();
Persent_Edit.SetFocus;
end;

procedure TfrmIstochniki.Smeta_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then Razdel_Edit.SetFocus;
end;

procedure TfrmIstochniki.Persent_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then Smeta_Edit.SetFocus;
end;

procedure TfrmIstochniki.Razdel_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then Stat_Edit.SetFocus;
end;

procedure TfrmIstochniki.Stat_EditKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then Kekv_Edit.SetFocus;
end;

procedure TfrmIstochniki.Kekv_EditKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then OKButton.SetFocus;
end;

procedure TfrmIstochniki.Smeta_EditPropertiesEditValueChanged(
  Sender: TObject);
begin
if Smeta_Edit.Text= '' then exit;
 if not IntegerCheck(Smeta_Edit.Text) then begin
  ShowMessage('Введено невірний код');
  Smeta_description_Label.Clear;
  Smeta_description_Label.Visible:=false;
  Smeta_Edit.SetFocus;
  exit;
 end;
ReadDataSet.Close;
ReadDataSet.SelectSQL.Clear;
ReadDataSet.SelectSQL.Text := 'select ID_OBJECT, TITLE_OBJECT from PUB_GET_NAME_BUDG_BY_KOD ( '+Smeta_Edit.Text+','+kav + datetostr(now) + kav+',' +'1)';
ReadDataSet.Open;
 if ReadDataSet['ID_OBJECT']<> null then begin
  id_smeta  := ReadDataSet['ID_OBJECT'];
 if ReadDataSet['TITLE_OBJECT']<> null then begin
  Smeta_description_Label.Caption:= ReadDataSet['TITLE_OBJECT'];
  Smeta_description_Label.Visible:=true;
  end
  else begin
  Smeta_description_Label.Clear;
  Smeta_description_Label.Visible:=false;
  end
 end
 else begin
  ShowMessage('Введено невірний код. Даного кошториса не існує.');
  Smeta_description_Label.Clear;
  Smeta_description_Label.Visible:=false;
  Smeta_Edit.SetFocus;
  ReadDataSet.Close;
  exit;
 end;
ReadDataSet.Close
end;

procedure TfrmIstochniki.Razdel_EditPropertiesEditValueChanged(
  Sender: TObject);
begin
if Razdel_Edit.Text= '' then exit;
 if not IntegerCheck(Razdel_Edit.Text) then begin
  ShowMessage('Введено невірний код');
  Razdel_description_Label.Clear;
  Razdel_description_Label.Visible:=false;
  Razdel_Edit.SetFocus;
  exit;
 end;
ReadDataSet.Close;
ReadDataSet.SelectSQL.Clear;
ReadDataSet.SelectSQL.Text := 'select ID_OBJECT, TITLE_OBJECT from PUB_GET_NAME_BUDG_BY_KOD ( '+Razdel_Edit.Text+','+kav+datetostr(now)+kav+',' +'2)';
ReadDataSet.Open;
 if ReadDataSet['ID_OBJECT']<> null then begin
  id_razdel  := ReadDataSet['ID_OBJECT'];
 if ReadDataSet['TITLE_OBJECT']<> null then begin
  Razdel_description_Label.Caption:= ReadDataSet['TITLE_OBJECT'];
  Razdel_description_Label.Visible:=true;
  end
  else begin
  Razdel_description_Label.Clear;
  Razdel_description_Label.Visible:=false;
  end
 end
 else begin
  ShowMessage('Введено невірний код. Даного розділу не існує');
  Razdel_description_Label.Clear;
  Razdel_description_Label.Visible:=false;
  Razdel_Edit.SetFocus;
  ReadDataSet.Close;
  exit;
 end;
ReadDataSet.Close;
end;

procedure TfrmIstochniki.Stat_EditPropertiesEditValueChanged(
  Sender: TObject);
begin
if Stat_Edit.Text= '' then exit;
 if not IntegerCheck(Stat_Edit.Text) then begin
  ShowMessage('Введено невірний код');
  Stat_description_Label.Clear;
  Stat_description_Label.Visible:=false;
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
  Stat_description_Label.Caption:= ReadDataSet['RAZD_ST_TITLE'];
  Stat_description_Label.Visible:=true;
  end
  else begin
  Stat_Label.Clear;
  Stat_Label.Visible:=false;
  end
 end
 else begin
  ShowMessage('Введено невірний код. Даної статті не існує');
  Stat_description_Label.Clear;
  Stat_description_Label.Visible:=false;
  Stat_Edit.SetFocus;
  ReadDataSet.Close;
  exit;
 end;
ReadDataSet.Close;
end;

procedure TfrmIstochniki.Kekv_EditPropertiesEditValueChanged(
  Sender: TObject);
begin
begin
  if Kekv_Edit.Text= '' then exit;
 if not IntegerCheck(Kekv_Edit.Text) then begin
  ShowMessage('Введено невірний код');
  Kekv_description_Label.Clear;
  Kekv_description_Label.Visible:=false;
  Kekv_Edit.SetFocus;
  exit;
 end;
ReadDataSet.Close;
ReadDataSet.SelectSQL.Clear;
ReadDataSet.SelectSQL.Text := 'select ID_KEKV, KEKV_TITLE from PUB_SPR_KEKV_INFO_EX2 ( '+Kekv_Edit.Text+','+kav+datetostr(now)+kav+')';
ReadDataSet.Open;
 if ReadDataSet['ID_KEKV']<> null then begin
  id_kekv  := ReadDataSet['ID_KEKV'];
 if ReadDataSet['KEKV_TITLE']<> null then begin
  Kekv_description_Label.Caption:= ReadDataSet['KEKV_TITLE'];
  Kekv_description_Label.Visible:=true;
  end
  else begin
  Kekv_description_Label.Clear;
  Kekv_description_Label.Visible:=false;
  end
 end
 else begin
  ShowMessage('Введено невірний код. Даного КЕКВ не існує');
  Kekv_description_Label.Clear;
  Kekv_description_Label.Visible:=false;
  Kekv_Edit.SetFocus;
  ReadDataSet.Close;
  exit;
 end;
ReadDataSet.Close;
end;
end;

end.
