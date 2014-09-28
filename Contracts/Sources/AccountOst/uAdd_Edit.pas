unit uAdd_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxLabel, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxCurrencyEdit, cxMaskEdit, cxButtonEdit,
  cn_common_types, cn_common_loader, cn_common_funcs, cnConsts, cxGroupBox,
  GlobalSPR, DB, FIBDataSet, pFIBDataSet, cnConsts_Messages;

type
  TfrmAdd_Edit = class(TForm)
    Button_ok: TcxButton;
    Button_cancel: TcxButton;
    GroupBox: TcxGroupBox;
    Summa_Edit: TcxCurrencyEdit;
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
    Edit_num_dog: TcxTextEdit;
    Label_Num_dog: TcxLabel;
    Label_fio: TcxLabel;
    Edit_FIO: TcxButtonEdit;
    DataSet_Add: TpFIBDataSet;
    constructor Create(pParameter:TcnSimpleParams); overload;
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Button_cancelClick(Sender: TObject);
    procedure Button_okClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Smeta_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Smeta_EditPropertiesEditValueChanged(Sender: TObject);
    procedure Razdel_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Razdel_EditPropertiesEditValueChanged(Sender: TObject);
    procedure Stat_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Stat_EditPropertiesEditValueChanged(Sender: TObject);
    procedure Kekv_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Kekv_EditPropertiesEditValueChanged(Sender: TObject);
    procedure Edit_FIOKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_num_dogKeyPress(Sender: TObject; var Key: Char);
    procedure Summa_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Smeta_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Razdel_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Stat_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Kekv_EditKeyPress(Sender: TObject; var Key: Char);
  private
    CurrentServerDate:TDate;
    { Private declarations }
  public
    PLanguageIndex:byte;
    AParameter:TcnSimpleParams;
    ID_SMETA    : int64;
    ID_RAZDEL   : int64;
    ID_STAT     : int64;
    ID_KEKV     : int64;
    ID_STUD     : int64;
    ID_DOG_ROOT : int64;
    ID_DOG      : int64;
    { Public declarations }
  end;

var
  frmAdd_Edit: TfrmAdd_Edit;

implementation

Uses uAccountOst_Main;
{$R *.dfm}

constructor TfrmAdd_edit.Create(pParameter:TcnSimpleParams);
Begin
  inherited create(PParameter.owner);
  AParameter:=pParameter;
  PLanguageIndex:=cn_Common_Funcs.cnLanguageIndex();
End;

procedure TfrmAdd_Edit.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  fParameter:TcnSimpleParamsEx;
  res:Variant;
  smeta_kod,razdel_kod,stat_kod,kekv_kod:integer;
begin
  fParameter                              := TcnSimpleParamsEx.Create;
  fParameter.Owner                        := self;
  fParameter.Db_Handle                    := AParameter.Db_Handle;
  fParameter.Formstyle                    := fsNormal;
  fParameter.ReturnMode                   := 'Single';
  fParameter.WaitPakageOwner              := self;
  Res:= RunFunctionFromPackage(fParameter, 'Contracts\cn_sp_ContractsList.bpl','ShowSPContractsList');

  If VarArrayDimCount(res)>0  then
   Begin
    id_dog:=res[0][0];
    id_stud:=res[0][1];
    Edit_FIO.Text:=res[0][4];
    Edit_num_dog.Text:=res[0][5];
    id_dog_root:=res[0][13];

    DataSet_Add.Close;
    DataSet_Add.SQLs.SelectSQL.Clear;
    DataSet_add.SQLs.SelectSQL.Add('Select *');
    DataSet_add.SQLs.SelectSQL.Add('From CN_DT_DOG_SMET_KOD_BY_ID(:id_dog,:id_dog_root,:id_stud)');
    DataSet_Add.ParamByName('ID_DOG').AsInt64:=id_dog;
    DataSet_Add.ParamByName('ID_STUD').AsInt64:=id_stud;
    DataSet_Add.ParamByName('ID_DOG_ROOT').AsInt64:=id_dog_root;
    DataSet_Add.Open;
    if DataSet_Add['SMETA_KOD']<>null then Smeta_kod:=DataSet_Add['SMETA_KOD'];
    if DataSet_Add['razdel_kod']<>null then Razdel_kod:=DataSet_Add['razdel_kod'];
    if DataSet_Add['STAT_KOD']<>null then Stat_kod:=DataSet_Add['STAT_KOD'];
    if DataSet_Add['KEKV_KOD']<>null then Kekv_kod:=DataSet_Add['KEKV_KOD'];

    Smeta_Edit.Text:=IntToStr(smeta_kod);
    Razdel_Edit.Text:=IntToStr(razdel_kod);
    Stat_Edit.Text:=IntToStr(stat_kod);
    Kekv_Edit.text:=IntToStr(kekv_kod);

   End;
  fParameter.Free;
end;

procedure TfrmAdd_Edit.Button_cancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmAdd_Edit.Button_okClick(Sender: TObject);
begin
  if Edit_FIO.Text = '' then
   begin
    showmessage(cnConsts.cn_Studer_Need[PLanguageIndex]);
    Edit_FIO.SetFocus;
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

  if not IntegerCheck(Smeta_Edit.Text) then
   begin
    ShowMessage(cnConsts_Messages.cn_warningVvod_Code[PLanguageIndex]);
    Smeta_Label.Clear;
    Smeta_Label.Visible:=false;
    Smeta_Edit.SetFocus;
    exit;
   end;
  if not IntegerCheck(Razdel_Edit.Text) then
   begin
    ShowMessage(cnConsts_Messages.cn_warningVvod_Code[PLanguageIndex]);
    Razdel_Label.Clear;
    Razdel_Label.Visible:=false;
    Razdel_Edit.SetFocus;
    exit;
   end;
  if not IntegerCheck(Stat_Edit.Text) then
   begin
    ShowMessage(cnConsts_Messages.cn_warningVvod_Code[PLanguageIndex]);
    Stat_Label.Clear;
    Stat_Label.Visible:=false;
    Stat_Edit.SetFocus;
    exit;
   end;
  if not IntegerCheck(Kekv_Edit.Text) then
   begin
    ShowMessage(cnConsts_Messages.cn_warningVvod_Code[PLanguageIndex]);
    Kekv_Label.Clear;
    Kekv_Label.Visible:=false;
    Kekv_Edit.SetFocus;
    exit;
   end;

  ModalResult:=mrOk;
end;

procedure TfrmAdd_Edit.FormShow(Sender: TObject);
begin
  ;
end;

procedure TfrmAdd_Edit.FormCreate(Sender: TObject);
begin
  Label_fio.Caption     := cn_grid_FIO_Column[PLanguageIndex];
  Label_Num_dog.Caption := cn_grid_Num_Dog_Column[PLanguageIndex];
  Button_ok.Caption     := cn_accept[PLanguageIndex];
  Button_ok.Hint        := cn_accept[PLanguageIndex];
  Button_Cancel.Caption := cn_cancel[PLanguageIndex];
  Button_Cancel.Hint    := cn_cancel[PLanguageIndex];
  DataSet_add.SQLs.SelectSQL.Text := 'select CUR_DATE from ST_GET_CURRENT_DATE';
  DataSet_add.Open;
  CurrentServerDate:= DataSet_add['CUR_DATE'];
  DataSet_add.close;
end;

procedure TfrmAdd_Edit.Smeta_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  id:variant;
begin
    id:=GlobalSPR.GetSmets(self,AParameter.Db_Handle,CurrentServerDate,psmRazdSt);
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
    if VarArrayDimCount(id)>0 //- проверка на то что id вариантный массив
    then
     begin
      if id[0]<>NULL then
       begin
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

procedure TfrmAdd_Edit.Smeta_EditPropertiesEditValueChanged(
  Sender: TObject);
begin
  if Smeta_Edit.Text= '' then exit;
  if not cn_Common_Funcs.IntegerCheck(Smeta_Edit.Text) then
   begin
    ShowMessage(cnConsts_Messages.cn_warningVvod_Code[PLanguageIndex]);
    Smeta_description_Label.Clear;
    Smeta_description_Label.Visible:=false;
    Smeta_Edit.SetFocus;
    exit;
   end;

  DataSet_add.Close;
  DataSet_add.SQLs.SelectSQL.clear;
  DataSet_add.SQLs.SelectSQL.Add('select ID_OBJECT, TITLE_OBJECT');
  DataSet_Add.SQLs.SelectSQL.Add('from PUB_GET_NAME_BUDG_BY_KOD (:Smeta ,:CurrentServerDate,1)');
  DataSet_Add.ParamByName('SMETA').AsString:=Smeta_Edit.Text;
  DataSet_Add.ParamByName('CurrentServerDate').AsString:=datetostr(CurrentServerDate);
  DataSet_add.Open;


  if DataSet_add['ID_OBJECT']<> null then
   begin
    ID_SMETA  := DataSet_add['ID_OBJECT'];
    if DataSet_add['TITLE_OBJECT']<> null then
     begin
      Smeta_description_Label.Caption:= DataSet_add['TITLE_OBJECT'];
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
    ShowMessage(cnConsts_Messages.cn_warningVvod_Smeta[PLanguageIndex]);
    Smeta_description_Label.Clear;
    Smeta_description_Label.Visible:=false;
    Smeta_Edit.SetFocus;
    DataSet_add.close;
    exit;
   end;
  DataSet_add.close;
end;

procedure TfrmAdd_Edit.Razdel_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  id:variant;
begin
  id:=GlobalSPR.GetSmets(self,AParameter.Db_Handle,CurrentServerDate,psmRazdSt);
  if VarArrayDimCount(id)>0 //- проверка на то что id вариантный массив
   then
    if id[0]<>NULL
     then
      begin
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

procedure TfrmAdd_Edit.Razdel_EditPropertiesEditValueChanged(
  Sender: TObject);
begin
  if Razdel_Edit.Text= '' then exit;
  if not cn_Common_Funcs.IntegerCheck(Razdel_Edit.Text) then
   begin
    ShowMessage(cnConsts_Messages.cn_warningVvod_Code[PLanguageIndex]);
    Razdel_description_Label.Clear;
    Razdel_description_Label.Visible:=false;
    Razdel_Edit.SetFocus;
    exit;
   end;

  DataSet_add.Close;
  DataSet_add.SQLs.SelectSQL.Clear;
  DataSet_add.SQLs.SelectSQL.Add('select ID_OBJECT, TITLE_OBJECT');
  DataSet_add.SQLs.SelectSQL.Add('from PUB_GET_NAME_BUDG_BY_KOD (:Razdel,:CurrentServerDate,2)');
  DataSet_Add.ParamByName('Razdel').AsString:=Razdel_Edit.Text;
  DataSet_Add.ParamByName('CurrentServerDate').AsString:=datetostr(CurrentServerDate);
  DataSet_add.Open;

  if DataSet_add['ID_OBJECT']<> null then
   begin
    ID_RAZDEL  := DataSet_add['ID_OBJECT'];
    if DataSet_add['TITLE_OBJECT']<> null then
     begin
      Razdel_description_Label.Caption:= DataSet_add['TITLE_OBJECT'];
      Razdel_description_Label.Visible:=true;
     end
    else
     begin
      Razdel_description_Label.Clear;
      Razdel_description_Label.Visible:=false;
     end
   end
  else
   begin
    ShowMessage(cnConsts_Messages.cn_warningVvod_Razdel[PLanguageIndex]);
    Razdel_description_Label.Clear;
    Razdel_description_Label.Visible:=false;
    Razdel_Edit.SetFocus;
    DataSet_add.close;
    exit;
   end;
  DataSet_add.close;
end;

procedure TfrmAdd_Edit.Stat_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  id:variant;
begin
  id:=GlobalSPR.GetSmets(self,AParameter.Db_Handle,CurrentServerDate,psmRazdSt);
  if VarArrayDimCount(id)>0 //- проверка на то что id вариантный массив
   then
    if id[0]<>NULL
     then
      begin
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
End;

procedure TfrmAdd_Edit.Stat_EditPropertiesEditValueChanged(
  Sender: TObject);
begin
  if Stat_Edit.Text= '' then exit;
  if not cn_Common_Funcs.IntegerCheck(Stat_Edit.Text) then
   begin
    ShowMessage(cnConsts_Messages.cn_warningVvod_Code[PLanguageIndex]);
    Stat_description_Label.Clear;
    Stat_description_Label.Visible:=false;
    Stat_Edit.SetFocus;
    exit;
   end;

  DataSet_add.Close;
  DataSet_Add.SQLs.SelectSQL.Clear;
  DataSet_add.SQLs.SelectSQL.Add('select ID_RAZD_ST, RAZD_ST_TITLE');
  DataSet_Add.SQLs.SelectSQL.Add('from ST_GET_ID_STAT_BY_CODE (:ID_Razdel,:Stat)');
  DataSet_Add.ParamByName('ID_RAZDEL').AsString:=IntToStr(id_razdel);
  DataSet_Add.ParamByName('STAT').AsString:=Stat_Edit.Text;
  DataSet_add.Open;

  if DataSet_add['ID_RAZD_ST']<> null then
   begin
    ID_STAT  := DataSet_add['ID_RAZD_ST'];
    if DataSet_add['RAZD_ST_TITLE']<> null then
     begin
      Stat_description_Label.Caption:= DataSet_add['RAZD_ST_TITLE'];
      Stat_description_Label.Visible:=true;
     end
    else
     begin
      Stat_description_Label.Clear;
      Stat_description_Label.Visible:=false;
     end
   end
  else
   begin
    ShowMessage(cnConsts_Messages.cn_warningVvod_Stat[PLanguageIndex]);
    Stat_description_Label.Clear;
    Stat_description_Label.Visible:=false;
    Stat_Edit.SetFocus;
    DataSet_add.close;
    exit;
   end;
  DataSet_add.close;
end;

procedure TfrmAdd_Edit.Kekv_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  id:variant;
begin
//           id[0][0]  - идентификатор  ≈ ¬а
//           id[0][1]  - наименование  ≈ ¬а
//           id[0][2]  - код  ≈ ¬а

  id:=GlobalSPR.GetKEKVSpr(self, AParameter.Db_Handle, FSNormal,CurrentServerDate,DEFAULT_ROOT_ID);
  if VarArrayDimCount(id)>0 //- проверка на то что id вариантный массив
   then
    if VarArrayDimCount(id)>0 then
     if id[0][0]<>NULL then
      begin
       ID_KEKV:=id[0][0];
       Kekv_Edit.Text:= id[0][2];
       Kekv_description_Label.Caption:=id[0][1];
       Kekv_description_Label.Visible:=true;
      end;
end;

procedure TfrmAdd_Edit.Kekv_EditPropertiesEditValueChanged(
  Sender: TObject);
begin
  if Kekv_Edit.Text= '' then exit;
  if not cn_Common_Funcs.IntegerCheck(Kekv_Edit.Text) then
   begin
    ShowMessage(cnConsts_Messages.cn_warningVvod_Code[PLanguageIndex]);
    Kekv_description_Label.Clear;
    Kekv_description_Label.Visible:=false;
    Kekv_Edit.SetFocus;
    exit;
   end;

  DataSet_add.Close;
  DataSet_add.SQLs.SelectSQL.Clear;
  DataSet_add.SQLs.SelectSQL.Add('select ID_KEKV, KEKV_TITLE');
  DataSet_add.SQLs.SelectSQL.Add('from PUB_SPR_KEKV_INFO_EX2 (:Kekv,:CurrentServerDate)');
  DataSet_Add.ParamByName('KEKV').AsString:=Kekv_Edit.Text;
  DataSet_Add.ParamByName('CurrentServerDate').AsString:=datetostr(CurrentServerDate);
  DataSet_add.Open;

  if DataSet_add['ID_KEKV']<> null then
   begin
    ID_KEKV  := DataSet_add['ID_KEKV'];
    if DataSet_add['KEKV_TITLE']<> null then
     begin
      Kekv_description_Label.Caption:= DataSet_add['KEKV_TITLE'];
      Kekv_description_Label.Visible:=true;
     end
    else
     begin
      Kekv_description_Label.Clear;
      Kekv_description_Label.Visible:=false;
     end
   end
  else
   begin
    ShowMessage(cnConsts_Messages.cn_warningVvod_Kekv[PLanguageIndex]);
    Kekv_description_Label.Clear;
    Kekv_description_Label.Visible:=false;
    Kekv_Edit.SetFocus;
    DataSet_add.close;
    exit;
   end;
  DataSet_add.close;
end;

procedure TfrmAdd_Edit.Edit_FIOKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then Edit_num_dog.SetFocus
               else key:=#0;
end;

procedure TfrmAdd_Edit.Edit_num_dogKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then Summa_Edit.SetFocus;
end;

procedure TfrmAdd_Edit.Summa_EditKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then Smeta_Edit.SetFocus;
end;

procedure TfrmAdd_Edit.Smeta_EditKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then Razdel_Edit.SetFocus;
end;

procedure TfrmAdd_Edit.Razdel_EditKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then Stat_Edit.SetFocus;
end;

procedure TfrmAdd_Edit.Stat_EditKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then Kekv_Edit.SetFocus;
end;

procedure TfrmAdd_Edit.Kekv_EditKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then Button_ok.SetFocus;
end;

end.

