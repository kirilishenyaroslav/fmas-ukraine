//***********************************************************************
//* Проект "Студгородок"                                                *
//* Справочник категорий - добавление источников финансирования         *
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//***********************************************************************
unit uSp_Kat_Pay_Istoch_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit, cxLabel,
  cxControls, cxContainer, cxEdit, cxGroupBox, cxCurrencyEdit, cxMaskEdit,
  cxButtonEdit, uSp_kat_pay_DM, GlobalSPR, DB, FIBDataSet, pFIBDataSet,
  ActnList, Math, st_ConstUnit, st_common_funcs, iBase, st_common_types,
  st_common_loader, st_Consts_Messages;

type
  TCategoryFormAddFin = class(TForm)
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
    SummaLabel: TcxLabel;
    SummaEdit: TcxCurrencyEdit;
    Currency_PDV: TcxCurrencyEdit;
    cxLabel1: TcxLabel;
    S_SummaEdit: TcxCurrencyEdit;
    cxLabel8: TcxLabel;
    cxLabel2: TcxLabel;
    KEKV_Edit: TcxButtonEdit;
    kekv_Label: TcxLabel;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PercentEditKeyPress(Sender: TObject; var Key: Char);
    procedure Persent_Subs_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Smeta_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Smeta_EditPropertiesEditValueChanged(Sender: TObject);
    procedure Kekv_EditKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure Ok_ActionExecute(Sender: TObject);
    procedure SummaEditEnter(Sender: TObject);
    procedure S_SummaEditEnter(Sender: TObject);
    procedure serves_ButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Currency_PDVExit(Sender: TObject);
    procedure S_SummaEditExit(Sender: TObject);
    procedure SummaEditExit(Sender: TObject);
    procedure Currency_PDVEnter(Sender: TObject);
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
  end;

var
  CategoryFormAddFin: TCategoryFormAddFin;
  const kav = ''''; // это кавычки

implementation

uses uSp_Kat_Pay_Summ_AE, uSp_Kat_Pay_AE;
{$R *.dfm}

procedure TCategoryFormAddFin.FormIniLanguage();
begin
  // индекс языка (1-укр, 2 - рус)
  PLanguageIndex:=              stLanguageIndex;

  //названия кнопок
  OKButton.Caption :=       st_ConstUnit.st_Accept[PLanguageIndex];
  CancelButton.Caption :=   st_ConstUnit.st_Cancel[PLanguageIndex];

  // смета
  cxLabel3.Caption :=            st_ConstUnit.st_Smeta[PLanguageIndex];

  SummaLabel.Caption:=       st_ConstUnit.st_SummaSliv[PLanguageIndex];
  cxLabel1.Caption:=         st_ConstUnit.st_SubSumma[PLanguageIndex];
end;

procedure TCategoryFormAddFin.CancelButtonClick(Sender: TObject);
begin
  close;
end;

procedure TCategoryFormAddFin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 // Action := caFree;
end;

procedure TCategoryFormAddFin.OKButtonClick(Sender: TObject);
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

  if Currency_PDV.EditValue <> 0 then
   begin
    ReadDataSet.Close;
    ReadDataSet.SQLs.SelectSQL.Text := 'Select * from ST_SERVICE_DETAIL where ID_SERVICE = :id_serves and ST_OPTIONS = 2';
    ReadDataSet.ParamByName('id_serves').AsInt64 := id_serves;
    ReadDataSet.Open;

    If ReadDataSet.RecordCount = 0 then
     begin
      ShowMessage('У вибраної послуги немає статті для акумуляції ПДВ!');
      serves_ButtonEdit.SetFocus;
      Exit;
     end;
   end;

  ModalResult := mrOK;
end;

procedure TCategoryFormAddFin.FormShow(Sender: TObject);
begin
  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text := 'select CUR_DATE from ST_GET_CURRENT_DATE';
  ReadDataSet.Open;

  Cur_date:= ReadDataSet['CUR_DATE'];

  ReadDataSet.Close;

  serves_ButtonEdit.SetFocus;
end;


procedure TCategoryFormAddFin.PercentEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then S_SummaEdit.SetFocus;
end;

procedure TCategoryFormAddFin.Persent_Subs_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then Smeta_Edit.SetFocus;
end;

procedure TCategoryFormAddFin.Smeta_EditPropertiesButtonClick(
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


procedure TCategoryFormAddFin.Smeta_EditPropertiesEditValueChanged(
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
     end
    else
     begin
      Smeta_Label.Clear;
      Smeta_Label.Visible:=false;
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

procedure TCategoryFormAddFin.SummaEditEnter(Sender: TObject);
begin
  SummaEdit.Value := RoundTo(SummaEdit.Value, -2);
end;

procedure TCategoryFormAddFin.S_SummaEditEnter(Sender: TObject);
begin
  S_SummaEdit.Value := RoundTo(S_SummaEdit.Value, -2);
end;

procedure TCategoryFormAddFin.serves_ButtonEditPropertiesButtonClick(
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

  If VarArrayDimCount(res) <>0 then
   begin
     id_serves              := res[0];
     serves_ButtonEdit.Text := res[1];

     ReadDataSet.Close;
     ReadDataSet.SQLs.SelectSQL.Text := 'Select * from ST_SERVICE_DETAIL where id_service = :id_serves and st_options = 2';
     ReadDataSet.ParamByName('ID_SERVES').AsInt64 := id_serves;
     ReadDataSet.Open;
     ReadDataSet.FetchAll;

     if ReadDataSet.RecordCount = 0 then
      begin
       Currency_PDV.Enabled := False;
       Currency_PDV.Value := 0;
      End 
      else Currency_PDV.Enabled := True;
    ReadDataSet.Close;
   end;

  aParameter.Free;
end;

procedure TCategoryFormAddFin.Currency_PDVExit(Sender: TObject);
begin
  If Currency_PDV.Text = '' then Currency_PDV.EditValue := 0;
end;

procedure TCategoryFormAddFin.S_SummaEditExit(Sender: TObject);
begin
  If S_SummaEdit.Text = '' then S_SummaEdit.EditValue := 0;
end;

procedure TCategoryFormAddFin.SummaEditExit(Sender: TObject);
begin
  if SummaEdit.Text = '' then SummaEdit.EditValue := 0;
end;

procedure TCategoryFormAddFin.Currency_PDVEnter(Sender: TObject);
begin
  if Currency_PDV.EditValue <> 0 then Exit;
  Currency_PDV.EditValue := SummaEdit.EditValue / 5;
end;

procedure TCategoryFormAddFin.KEKV_EditPropertiesButtonClick(
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

procedure TCategoryFormAddFin.KEKV_EditPropertiesEditValueChanged(
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
     end
    else
     begin
      Kekv_Label.Clear;
      Kekv_Label.Visible:=false;
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

procedure TCategoryFormAddFin.serves_ButtonEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then Smeta_Edit.SetFocus;
end;


end.



