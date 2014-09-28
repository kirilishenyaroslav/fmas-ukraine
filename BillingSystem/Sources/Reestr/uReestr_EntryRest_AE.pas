unit uReestr_EntryRest_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxMaskEdit,
  cxButtonEdit, cxTextEdit, cxCurrencyEdit, cxContainer, cxEdit, cxLabel,
  cxControls, cxGroupBox, GlobalSPR, DB, FIBDataSet, pFIBDataSet, uCommon_Funcs,
  uConsts, iBase, uConsts_Messages, uReestr_DM;

type
  TfrmReestr_EntryRest_AE = class(TForm)
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    Cur_date: string;
    PLanguageIndex: byte;
    CURRENT_TIMESTAMP : TDateTime;
    DM : TfrmReestr_DM;
    procedure FormIniLanguage();
  public
    id_smeta, id_razdel, id_stat, id_kekv: int64;
    constructor Create(aOwner : TComponent; aHandle : TISC_DB_HANDLE); reintroduce;
  end;

var
    frmReestr_EntryRest_AE: TfrmReestr_EntryRest_AE;
    const kav = ''''; // это кавычки


implementation


{$R *.dfm}

constructor TfrmReestr_EntryRest_AE.Create(aOwner : TComponent; aHandle : TISC_DB_HANDLE);
begin
  inherited Create(aOwner);

  DM := TfrmReestr_DM.Create(self);
  DM.DB.Handle := aHandle;
  DM.DB.Connected := True;
  DM.ReadTransaction.StartTransaction;

  ReadDataSet.Database := DM.DB;
  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text := 'select * from CN_GET_SYS_CURRENT_DATE';
  ReadDataSet.Open;
  Cur_date:= ReadDataSet['CURRENTDATE'];
  CURRENT_TIMESTAMP := ReadDataSet['CURRENTDATE'];
  ReadDataSet.Close;
end;

procedure TfrmReestr_EntryRest_AE.FormIniLanguage();
begin
  // индекс €зыка (1-укр, 2 - рус)
  PLanguageIndex:=               uCommon_Funcs.bsLanguageIndex;;

  //названи€ кнопок
  OkButton.Caption :=            uConsts.bs_Accept[PLanguageIndex];
  CancelButton.Caption :=        uConsts.bs_Cancel[PLanguageIndex];

  SummaLabel.Caption :=          uConsts.bs_Summa_Column[PLanguageIndex];
  cxLabel3.Caption :=            uConsts.bs_Smeta[PLanguageIndex];
  cxLabel4.Caption :=            uConsts.bs_Razdel[PLanguageIndex];
  cxLabel5.Caption :=            uConsts.bs_Statya[PLanguageIndex];
  cxLabel6.Caption :=            uConsts.bs_KEKV[PLanguageIndex];
end;


procedure TfrmReestr_EntryRest_AE.CancelButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmReestr_EntryRest_AE.Smeta_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  id:variant;
begin
  id:=GlobalSPR.GetSmets(self, DM.DB.Handle, CURRENT_TIMESTAMP, psmRazdSt);
  if VarArrayDimCount(id)>0 then
   begin
    if id[0]<>NULL then
     begin
      //id[0]  -идентификатор сметы
      //id[1]  -идентификатор раздела
      //id[2]  -идентификатор статьи
      //id[3]  -идентификатор группы смет
      //id[4]  -наименование раздела
      //id[5]  -наименование статьи
      //id[6]  -наименование сметы
      //id[7]  -номер раздела
      //id[8]  -номер статьи
      //id[9]  -код сметы
      //id[10] -наименование группы смет

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

procedure TfrmReestr_EntryRest_AE.Smeta_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then Razdel_Edit.SetFocus;
end;

procedure TfrmReestr_EntryRest_AE.Stat_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then Kekv_Edit.SetFocus;
end;

procedure TfrmReestr_EntryRest_AE.Razdel_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then Stat_Edit.SetFocus;
end;

procedure TfrmReestr_EntryRest_AE.Kekv_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then OKButton.SetFocus;
end;

procedure TfrmReestr_EntryRest_AE.Smeta_EditPropertiesEditValueChanged(
  Sender: TObject);
begin
  if Smeta_Edit.Text= '' then exit;

  if not IntegerCheck(Smeta_Edit.Text) then
   begin
    ShowMessage(pchar(uConsts_Messages.bs_NotCorrectCode[PLanguageIndex]));
    Smeta_Label.Clear;
    Smeta_Label.Visible:=false;
    Smeta_Edit.SetFocus;
    exit;
   end;

  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text := 'select ID_OBJECT, TITLE_OBJECT from PUB_GET_NAME_BUDG_BY_KOD ( '+Smeta_Edit.Text+','+kav+Cur_date+kav+',' +'1)';
  ReadDataSet.Open;

  if ReadDataSet['ID_OBJECT']<> null then
   begin
    id_smeta  := ReadDataSet['ID_OBJECT'];
    if ReadDataSet['TITLE_OBJECT']<> null
     then
      begin
       Smeta_Label.Caption:= ReadDataSet['TITLE_OBJECT'];
       Smeta_Label.Visible:=true;
      end
    else
     begin
      Smeta_Label.Clear;
      Smeta_Label.Visible:=false;
     end
   end
  else
   begin
    ShowMessage(pchar(uConsts_Messages.bs_NotCorrectSmeta[PLanguageIndex]));
    Smeta_Label.Clear;
    Smeta_Label.Visible:=false;
    Smeta_Edit.SetFocus;
    ReadDataSet.Close;
    exit;
   end;
  ReadDataSet.Close;
end;

procedure TfrmReestr_EntryRest_AE.OKButtonClick(Sender: TObject);
begin
  if Smeta_Edit.Text = '' then
   begin
    ShowMessage(pchar(uConsts_Messages.bs_NeedNumber_Smeta[PLanguageIndex]));
    Smeta_Edit.SetFocus;
    exit;
   end;

  if Razdel_Edit.Text = '' then
   begin
    ShowMessage(pchar(uConsts_Messages.bs_NeedNumber_Razdel[PLanguageIndex]));
    Razdel_Edit.SetFocus;
    exit;
   end;

  if Stat_Edit.Text = '' then
   begin
    ShowMessage(pchar(uConsts_Messages.bs_NeedNumber_Stat[PLanguageIndex]));
    Stat_Edit.SetFocus;
    exit;
   end;

  if Kekv_Edit.Text = '' then
   begin
    ShowMessage(pchar(uConsts_Messages.bs_NeedNumber_KEKV[PLanguageIndex]));
    Kekv_Edit.SetFocus;
    exit;
   end;

  if SummaEdit.Value=0 then
   begin
    ShowMessage(pchar(uConsts_Messages.bs_NotNull_Summa[PLanguageIndex]));
    SummaEdit.SetFocus;
    exit;
   end;

  if not FloatCheck(SummaEdit.Text) then
   begin
    ShowMessage(pchar(uConsts_Messages.bs_NotCorrect_summa[PLanguageIndex]));
    SummaEdit.SetFocus;
    exit;
   end;

  if not IntegerCheck(Smeta_Edit.Text) then
   begin
    ShowMessage(pchar(uConsts_Messages.bs_mess_Code_need[PLanguageIndex]));
    Smeta_Label.Clear;
    Smeta_Label.Visible:=false;
    Smeta_Edit.SetFocus;
    exit;
   end;

  if not IntegerCheck(Razdel_Edit.Text) then
   begin
    ShowMessage(pchar(uConsts_Messages.bs_mess_Code_need[PLanguageIndex]));
    Razdel_Label.Clear;
    Razdel_Label.Visible:=false;
    Razdel_Edit.SetFocus;
    exit;
   end;

  if not IntegerCheck(Stat_Edit.Text) then
   begin
    ShowMessage(pchar(uConsts_Messages.bs_mess_Code_need[PLanguageIndex]));
    Stat_Label.Clear;
    Stat_Label.Visible:=false;
    Stat_Edit.SetFocus;
    exit;
   end;

  if not IntegerCheck(Kekv_Edit.Text) then
   begin
    ShowMessage(pchar(uConsts_Messages.bs_mess_Code_need[PLanguageIndex]));
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
  if ReadDataSet['RESULT_VALUE']=0 then
   begin
    ShowMessage(pchar(uConsts_Messages.bs_NotCorrect_Istoch[PLanguageIndex]));
    Smeta_Edit.SetFocus;
    ReadDataSet.Close;
    exit;
   end;
  ReadDataSet.Close;

  ModalResult := mrOK;
end;

procedure TfrmReestr_EntryRest_AE.Razdel_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  id:variant;
begin
  id:=GlobalSPR.GetSmets(self, DM.DB.Handle, CURRENT_TIMESTAMP, psmRazdSt);
  if VarArrayDimCount(id)>0 then
   begin
    if id[0]<>NULL then
     begin
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

procedure TfrmReestr_EntryRest_AE.Razdel_EditPropertiesEditValueChanged(
  Sender: TObject);
begin
  if Razdel_Edit.Text= '' then exit;

  if not IntegerCheck(Razdel_Edit.Text) then
   begin
    ShowMessage(pchar(uConsts_Messages.bs_NotCorrectCode[PLanguageIndex]));
    Razdel_Label.Clear;
    Razdel_Label.Visible:=false;
    Razdel_Edit.SetFocus;
    exit;
   end;

  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text := 'select ID_OBJECT, TITLE_OBJECT from PUB_GET_NAME_BUDG_BY_KOD ( '+Razdel_Edit.Text+','+kav+Cur_date+kav+',' +'2)';
  ReadDataSet.Open;

  if ReadDataSet['ID_OBJECT']<> null
   then
    begin
     id_razdel  := ReadDataSet['ID_OBJECT'];
     if ReadDataSet['TITLE_OBJECT']<> null
      then
       begin
        Razdel_Label.Caption:= ReadDataSet['TITLE_OBJECT'];
        Razdel_Label.Visible:=true;
       end
      else
       begin
        Razdel_Label.Clear;
        Razdel_Label.Visible:=false;
       end
    end
   else
    begin
     ShowMessage(pchar(uConsts_Messages.bs_NotCorrectRazdel[PLanguageIndex]));
     Razdel_Label.Clear;
     Razdel_Label.Visible:=false;
     Razdel_Edit.SetFocus;
     ReadDataSet.Close;
     exit;
    end;
  ReadDataSet.Close;
end;

procedure TfrmReestr_EntryRest_AE.Stat_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  id:variant;
begin
  id:=GlobalSPR.GetSmets(self, DM.DB.Handle, CURRENT_TIMESTAMP, psmRazdSt);
  if VarArrayDimCount(id)>0 then
   begin
    if id[0]<>NULL then
     begin
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

procedure TfrmReestr_EntryRest_AE.Stat_EditPropertiesEditValueChanged(
  Sender: TObject);
begin
  if Stat_Edit.Text= '' then exit;

  if not IntegerCheck(Stat_Edit.Text) then
   begin
    ShowMessage(pchar(uConsts_Messages.bs_NotCorrectCode[PLanguageIndex]));
    Stat_Label.Clear;
    Stat_Label.Visible:=false;
    Stat_Edit.SetFocus;
    exit;
   end;

  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text := 'select ID_RAZD_ST, RAZD_ST_TITLE from ST_GET_ID_STAT_BY_CODE ('+ IntToStr(id_razdel) +','+ Stat_Edit.Text +')';
  ReadDataSet.Open;

  if ReadDataSet['ID_RAZD_ST']<> null
   then
    begin
     id_stat  := ReadDataSet['ID_RAZD_ST'];
     if ReadDataSet['RAZD_ST_TITLE']<> null
      then
       begin
        Stat_Label.Caption:= ReadDataSet['RAZD_ST_TITLE'];
        Stat_Label.Visible:=true;
       end
      else
       begin
        Stat_Label.Clear;
        Stat_Label.Visible:=false;
       end
    end
   else
    begin
     ShowMessage(pchar(uConsts_Messages.bs_NotCorrectStat[PLanguageIndex]));
     Stat_Label.Clear;
     Stat_Label.Visible:=false;
     Stat_Edit.SetFocus;
     ReadDataSet.Close;
     exit;
    end;
  ReadDataSet.Close;
end;

procedure TfrmReestr_EntryRest_AE.Kekv_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  id:variant;
begin
  id:=GlobalSPR.GetKEKVSpr(self, DM.DB.Handle, FSNormal, CURRENT_TIMESTAMP, DEFAULT_ROOT_ID);

  if VarArrayDimCount(id)>0 then
   begin
    if VarArrayDimCount(id)>0 then
     begin
      if id[0][0]<>NULL then
       begin
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

procedure TfrmReestr_EntryRest_AE.Kekv_EditPropertiesEditValueChanged(
  Sender: TObject);
begin
  if Kekv_Edit.Text= '' then exit;

  if not IntegerCheck(Kekv_Edit.Text) then
   begin
    ShowMessage(pchar(uConsts_Messages.bs_NotCorrectCode[PLanguageIndex]));
    Kekv_Label.Clear;
    Kekv_Label.Visible:=false;
    Kekv_Edit.SetFocus;
    exit;
   end;

  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text := 'select ID_KEKV, KEKV_TITLE from PUB_SPR_KEKV_INFO_EX2 ( '+Kekv_Edit.Text+','+kav+Cur_date+kav+')';
  ReadDataSet.Open;

  if ReadDataSet['ID_KEKV']<> null
   then
    begin
     id_kekv  := ReadDataSet['ID_KEKV'];
     if ReadDataSet['KEKV_TITLE']<> null
      then
       begin
        Kekv_Label.Caption:= ReadDataSet['KEKV_TITLE'];
        Kekv_Label.Visible:=true;
       end
      else
       begin
        Kekv_Label.Clear;
        Kekv_Label.Visible:=false;
       end
    end
   else
    begin
     ShowMessage(pchar(uConsts_Messages.bs_NotCorrectKekv[PLanguageIndex]));
     Kekv_Label.Clear;
     Kekv_Label.Visible:=false;
     Kekv_Edit.SetFocus;
     ReadDataSet.Close;
     exit;
    end;
  ReadDataSet.Close;
end;

procedure TfrmReestr_EntryRest_AE.SummaEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then Smeta_Edit.SetFocus;
end;

procedure TfrmReestr_EntryRest_AE.FormCreate(Sender: TObject);
begin
  FormIniLanguage();
end;

procedure TfrmReestr_EntryRest_AE.FormShow(Sender: TObject);
begin
  SummaEdit.SetFocus;
end;

procedure TfrmReestr_EntryRest_AE.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if FormStyle = fsMDIChild
   then action:=caFree
   else DM.Free;
end;

end.
