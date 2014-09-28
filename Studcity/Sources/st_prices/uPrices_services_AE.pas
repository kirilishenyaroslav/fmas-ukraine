//***********************************************************************
//* Проект "Студгородок"                                                *
//* Справочник категорий - добавление источников финансирования         *
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//***********************************************************************
unit uPrices_services_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit, cxLabel,
  cxControls, cxContainer, cxEdit, cxGroupBox, cxCurrencyEdit, cxMaskEdit,
  cxButtonEdit, uPrices_DM, GlobalSPR, DB, FIBDataSet, pFIBDataSet,
  ActnList, Math, st_ConstUnit, st_common_funcs, iBase, st_common_types,
  st_common_loader, st_Consts_Messages, cxCheckBox, cxDropDownEdit;

type
  TfrmPrices_services_AE = class(TForm)
    cxGroupBox1: TcxGroupBox;
    OKButton: TcxButton;
    CancelButton: TcxButton;
    ReadDataSet: TpFIBDataSet;
    Category_ActionList: TActionList;
    Add_Action: TAction;
    Edit_Action: TAction;
    Delete_Action: TAction;
    Ok_Action: TAction;
    cxLabel7: TcxLabel;
    serves_ButtonEdit: TcxButtonEdit;
    cxLabel3: TcxLabel;
    Smeta_Edit: TcxButtonEdit;
    Smeta_Label: TcxLabel;
    cxLabel2: TcxLabel;
    KEKV_Edit: TcxButtonEdit;
    kekv_Label: TcxLabel;
    ComboBox_type_norm: TcxComboBox;
    cxLabel1: TcxLabel;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Persent_Subs_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Smeta_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Smeta_EditPropertiesEditValueChanged(Sender: TObject);
    procedure Kekv_EditKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure serves_ButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure KEKV_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure KEKV_EditPropertiesEditValueChanged(Sender: TObject);
    procedure serves_ButtonEditKeyPress(Sender: TObject; var Key: Char);
  private
    Cur_date: string;
    PLanguageIndex: byte;
    //CURRENT_TIMESTAMP : TDateTime;
    procedure FormIniLanguage();
  public
    id_smeta : int64;
    id_kekv  : Int64;
    is_admin : Boolean;
    aHandle : TISC_DB_HANDLE;
    id_serves : Int64;
    id_type_norma : Int64;
    id_options : Int64;
    sm_kod, kekv_kod : string;
    DM : Tfrm_price_DM;
  end;

var
  frmPrices_services_AE: TfrmPrices_services_AE;
  const kav = ''''; // это кавычки

implementation

{$R *.dfm}

procedure TfrmPrices_services_AE.FormIniLanguage();
begin
  // индекс языка (1-укр, 2 - рус)
  PLanguageIndex:=              stLanguageIndex;

  //названия кнопок
  OKButton.Caption :=       st_ConstUnit.st_Accept[PLanguageIndex];
  CancelButton.Caption :=   st_ConstUnit.st_Cancel[PLanguageIndex];

  // смета
  cxLabel3.Caption :=            st_ConstUnit.st_Smeta[PLanguageIndex];
end;

procedure TfrmPrices_services_AE.CancelButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPrices_services_AE.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 // Action := caFree;
end;

procedure TfrmPrices_services_AE.OKButtonClick(Sender: TObject);
begin
  if serves_ButtonEdit.Text = '' then
   begin
     ShowMessage('Неодхідно обрати послугу!');
     serves_ButtonEdit.SetFocus;
     Exit;
   end;

  if Smeta_Edit.Text = '' then
   begin
    ShowMessage(pchar(st_ConstUnit.st_2[PLanguageIndex]));
    Smeta_Edit.SetFocus;
    exit;
   end;

  if not IntegerCheck(Smeta_Edit.Text) then
   begin
    ShowMessage(pchar(st_ConstUnit.st_mess_Code_need[PLanguageIndex]));
    Smeta_Label.Clear;
    Smeta_Label.Visible:=false;
    Smeta_Edit.SetFocus;
    exit;
   end;

  ModalResult := mrOK;
end;

procedure TfrmPrices_services_AE.FormShow(Sender: TObject);
var
  i : integer;
begin
  serves_ButtonEdit.SetFocus;

  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text := 'select * from ST_INI_TYPE_NORM';
  ReadDataSet.Open;
  ReadDataSet.FetchAll;
  ReadDataSet.First;

  ComboBox_type_norm.Properties.Items.Clear;
  For i := 0 to ReadDataSet.RecordCount - 1 do
   Begin
    ComboBox_type_norm.Properties.Items.Add(ReadDataSet['NAME_TYPE_NORMA']);
    ReadDataSet.Next;
   end;

  if ReadDataSet.RecordCount > 0 then
   Begin
    if id_type_norma <> -1
     then ComboBox_type_norm.ItemIndex := id_type_norma - 1
     else ComboBox_type_norm.ItemIndex := 0;
   end;

  ReadDataSet.Close;
end;


procedure TfrmPrices_services_AE.Persent_Subs_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then Smeta_Edit.SetFocus;
end;

procedure TfrmPrices_services_AE.Smeta_EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  id:variant;
begin
    id:=GlobalSPR.GetSmets(self, aHandle, StrToDate(Cur_date), psmRazdSt);
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

     Smeta_Edit.Text:=vartostr(id[9]);
     Smeta_Label.Caption:=vartostr(id[6]);

     Smeta_Label.Visible:=true;
     end;
   end;
end;


procedure TfrmPrices_services_AE.Smeta_EditPropertiesEditValueChanged(
  Sender: TObject);
begin
  if Smeta_Edit.Text = '' then exit;

  if not IntegerCheck(Smeta_Edit.Text) then
   begin
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

  if ReadDataSet['ID_OBJECT']<> null then
   begin
    id_smeta  := ReadDataSet['ID_OBJECT'];
    if ReadDataSet['TITLE_OBJECT']<> null then
     begin
      Smeta_Label.Caption:= ReadDataSet['TITLE_OBJECT'];
      Smeta_Label.Visible:=true;
      sm_kod := Smeta_Edit.Text;
     end
    else
     begin
      Smeta_Label.Clear;
      Smeta_Label.Visible:=false;
      sm_kod := '';
     end
   end
  else
   begin
    ShowMessage(pchar(st_ConstUnit.st_NotCorrectSmeta[PLanguageIndex]));
    Smeta_Label.Clear;
    Smeta_Label.Visible:=false;
    Smeta_Edit.SetFocus;
    ReadDataSet.Close;
    exit;
   end;
  ReadDataSet.Close;
end;

procedure TfrmPrices_services_AE.Kekv_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then OKButton.SetFocus;
end;

procedure TfrmPrices_services_AE.FormCreate(Sender: TObject);
begin
  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text := 'select CUR_DATE from ST_GET_CURRENT_DATE';
  ReadDataSet.Open;

  Cur_date:= ReadDataSet['CUR_DATE'];

  ReadDataSet.Close;
  
  FormIniLanguage();
end;

procedure TfrmPrices_services_AE.serves_ButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  aParameter : TstSimpleParams;
  res : Variant;
begin
  aParameter                 := TstSimpleParams.Create;
  aParameter.Owner           := self;
  aParameter.Db_Handle       := aHandle;
  AParameter.Formstyle       := fsNormal;
  AParameter.WaitPakageOwner := self;
  aParameter.is_admin        := is_admin;

  res := RunFunctionFromPackage(aParameter, 'Studcity\st_services.bpl', 'getServices');

  If VarArrayDimCount(res) <> 0 then
   begin
     id_serves              := res[0];
     serves_ButtonEdit.Text := res[1];
     id_options             := res[3];
   end;

  aParameter.Free;
end;

procedure TfrmPrices_services_AE.KEKV_EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  id:variant;
begin
   id := GlobalSPR.GetKEKVSpr(self, aHandle, FSNormal, StrToDate(Cur_date), DEFAULT_ROOT_ID);

   if VarArrayDimCount(id)>0 //- проверка на то что id вариантный массив
    then begin
     if VarArrayDimCount(id) > 0 then
      begin
       if id[0][0] <> NULL then
        begin
//       id[0][0]  - идентификатор КЕКВа
//       id[0][1]  - наименование КЕКВа
//       id[0][2]  - код КЕКВа

         ID_KEKV := id[0][0];

         Kekv_Edit.Text     := id[0][2];
         kekv_Label.Caption := id[0][1];
         kekv_Label.Visible := True;
        end;
      end;
    end;
end;

procedure TfrmPrices_services_AE.KEKV_EditPropertiesEditValueChanged(
  Sender: TObject);
begin
  if Kekv_Edit.Text= '' then exit;

  if not IntegerCheck(Kekv_Edit.Text) then
   begin
    ShowMessage('Введен неверный код.');
    kekv_Label.Clear;
    Kekv_Label.Visible:=false;
    Kekv_Edit.SetFocus;
    exit;
   end;

  ReadDataSet.Close;
  ReadDataSet.SQLs.SelectSQL.Text := 'select ID_KEKV, KEKV_TITLE from PUB_SPR_KEKV_INFO_EX2 ( '+Kekv_Edit.Text+','+kav + Cur_date+kav+')';
  ReadDataSet.Open;

  If ReadDataSet['ID_KEKV'] <> null then
   begin
    ID_KEKV  := ReadDataSet['ID_KEKV'];
    if ReadDataSet['KEKV_TITLE']<> null then
     begin
      Kekv_Label.Caption:= ReadDataSet['KEKV_TITLE'];
      Kekv_Label.Visible:=true;
      kekv_kod := KEKV_Edit.Text;
     end
    else
     begin
      Kekv_Label.Clear;
      Kekv_Label.Visible:=false;
      kekv_kod := '';
     end
   end
  else
   begin
    ShowMessage(st_Consts_Messages.st_warningVvod_Kekv[PLanguageIndex]);

    Kekv_Label.Clear;
    Kekv_Label.Visible:=false;
    Kekv_Edit.SetFocus;
    ReadDataSet.close;
    exit;
   end;

 ReadDataSet.close;
end;

procedure TfrmPrices_services_AE.serves_ButtonEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then Smeta_Edit.SetFocus;
end;


end.



