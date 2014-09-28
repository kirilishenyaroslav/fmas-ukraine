//******************************************************************************
// Проект "Контракты"
// sys_options
// Чернявский А.Э. 2006г.
//******************************************************************************

unit uSysOp_Unit;                         

interface                         

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ImgList, cxGraphics, cxContainer, cxEdit,
  cxProgressBar, dxStatusBar, cxControls, IBase, uDM_SysOp, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxClasses, cxTextEdit, uCommon_Funcs, uConsts, StdCtrls, cxGroupBox,
  cxMaskEdit, cxButtonEdit,uCommon_Types, uCommon_Loader, GlobalSPR,
  cxDropDownEdit, cxCalendar, RxGIF, ExtCtrls, cxLabel, uConsts_Messages;

type
  TfrmSysOp = class(TForm)
    BarManager: TdxBarManager;
    EditButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    PopupImageList: TImageList;
    LargeImages: TImageList;
    DisabledLargeImages: TImageList;
    Styles: TcxStyleRepository;
    BackGround: TcxStyle;
    FocusedRecord: TcxStyle;
    Header: TcxStyle;
    DesabledRecord: TcxStyle;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    Default_StyleSheet: TcxGridTableViewStyleSheet;
    DevExpress_Style: TcxGridTableViewStyleSheet;
    cxGroupBox1: TcxGroupBox;
    //Label_bs_max_sys_timestamp: TLabel;
    //bs_max_sys_timestamp_Edit: TcxDateEdit;
    Label48: TLabel;
    Label_date_start: TLabel;
    DateEdit_date_start: TcxDateEdit;
    GroupBox_Istochniki: TcxGroupBox;
    cxLabel3: TcxLabel;
    Smeta_Edit: TcxButtonEdit;
    cxLabel4: TcxLabel;
    Razdel_Edit: TcxButtonEdit;
    cxLabel5: TcxLabel;
    Stat_Edit: TcxButtonEdit;
    cxLabel6: TcxLabel;
    Kekv_Edit: TcxButtonEdit;
    Smeta_Label: TcxLabel;
    Razdel_Label: TcxLabel;
    Stat_Label: TcxLabel;
    Kekv_Label: TcxLabel;
    bs_max_sys_timestamp_Edit: TcxDateEdit;
    Label_bs_max_sys_timestamp: TLabel;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditButtonClick(Sender: TObject);
    procedure Smeta_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Smeta_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Stat_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Razdel_EditKeyPress(Sender: TObject; var Key: Char);
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
  private
    PLanguageIndex: byte;
    DM:TDM_SO;
    Id_smeta, id_razdel, id_stat, id_kekv : Int64;
    Current_timestamp : TDateTime;
    Cur_date : String;
    procedure FormIniLanguage;
  public
    res:Variant;
    constructor  Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);reintroduce;
  end;

const kav = '''';

implementation

{$R *.dfm}

constructor TfrmSysOp.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);
begin
  Screen.Cursor:=crHourGlass;
  inherited Create(AOwner);

  DM:=TDM_SO.Create(Self);
  DM.DB.Handle:=DB_Handle;
  DM.DB.Connected := True;

  DM.DataSet.Close;
  DM.DataSet.SQLs.SelectSQL.Text := 'select * from BS_GET_SYS_CURRENT_DATE';
  DM.DataSet.Open;
  Current_timestamp := DM.DataSet['currenttimestamp'];
  Cur_date          := DM.DataSet['CURRENTDATE'];

  DM.DataSet.Close;
  DM.DataSet.SQLs.SelectSQL.Text := 'select * from BS_CONSTS_GET_ALL';
  DM.DataSet.Open;
  
  If DM.DataSet['MAX_TIMESTAMP'] <> null
   then bs_max_sys_timestamp_Edit.Date := DM.DataSet['MAX_TIMESTAMP'];

  If DM.DataSet['DATE_START'] <> null
   then DateEdit_date_start.Date := DM.DataSet['DATE_START']
   else DateEdit_date_start.Date := 0;

  {If DM.DataSet['bs_def_smeta'] <> null  then Smeta_Edit.Text  := DM.DataSet['bs_def_smeta'];
  If DM.DataSet['bs_def_razdel'] <> null then Razdel_Edit.Text := DM.DataSet['bs_def_razdel'];
  If DM.DataSet['bs_def_stat'] <> null   then Stat_Edit.Text   := DM.DataSet['bs_def_stat'];
  If DM.DataSet['bs_def_kekv'] <> null   then Kekv_Edit.Text   := DM.DataSet['bs_def_kekv'];}

  FormIniLanguage();
  Screen.Cursor:=crDefault;
end;

procedure TfrmSysOp.FormIniLanguage;
begin
  PLanguageIndex := uCommon_Funcs.bsLanguageIndex();

  //кэпшн формы
  Caption := uConsts.bs_SysOptions[PLanguageIndex];

  //Названия кнопок
  EditButton.Caption := uConsts.bs_Accept[PLanguageIndex];
  ExitButton.Caption := uConsts.bs_ExitBtn_Caption[PLanguageIndex];

  //Название меток
  Label_bs_max_sys_timestamp.Caption := uConsts.bs_max_sys_timestamp[PLanguageIndex];
  Label_date_start.Caption            := uConsts.bs_date_start[PLanguageIndex];

  //Источники финансирования
  cxLabel3.Caption := uConsts.bs_Smeta[PLanguageIndex];
  cxLabel4.Caption := uConsts.bs_Razdel[PLanguageIndex];
  cxLabel5.Caption := uConsts.bs_Statya[PLanguageIndex];
  cxLabel6.Caption := uConsts.bs_KEKV[PLanguageIndex];

  GroupBox_Istochniki.Caption := bs_Istochniki_GroupBox[PLanguageIndex];
end;

procedure TfrmSysOp.ExitButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmSysOp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if FormStyle = fsMDIChild
   then action:=caFree
   else DM.Free;
end;

procedure TfrmSysOp.EditButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmSysOp.Smeta_EditPropertiesButtonClick(Sender: TObject;
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

procedure TfrmSysOp.Smeta_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then Razdel_Edit.SetFocus;
end;

procedure TfrmSysOp.Stat_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then Kekv_Edit.SetFocus;
end;

procedure TfrmSysOp.Razdel_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then Stat_Edit.SetFocus;
end;

procedure TfrmSysOp.Smeta_EditPropertiesEditValueChanged(
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

  DM.ReadDataSet.Close;
  DM.ReadDataSet.SelectSQL.Clear;
  DM.ReadDataSet.SelectSQL.Text := 'select ID_OBJECT, TITLE_OBJECT from PUB_GET_NAME_BUDG_BY_KOD ( '+Smeta_Edit.Text+','+kav+Cur_date+kav+',' +'1)';
  DM.ReadDataSet.Open;

  if DM.ReadDataSet['ID_OBJECT']<> null then
   begin
    id_smeta  := DM.ReadDataSet['ID_OBJECT'];
    if DM.ReadDataSet['TITLE_OBJECT']<> null
     then
      begin
       Smeta_Label.Caption:= DM.ReadDataSet['TITLE_OBJECT'];
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
    DM.ReadDataSet.Close;
    exit;
   end;
  DM.ReadDataSet.Close;
end;

procedure TfrmSysOp.Razdel_EditPropertiesButtonClick(Sender: TObject;
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

procedure TfrmSysOp.Razdel_EditPropertiesEditValueChanged(
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

  DM.ReadDataSet.Close;
  DM.ReadDataSet.SelectSQL.Clear;
  DM.ReadDataSet.SelectSQL.Text := 'select ID_OBJECT, TITLE_OBJECT from PUB_GET_NAME_BUDG_BY_KOD ( '+Razdel_Edit.Text+','+kav+Cur_date+kav+',' +'2)';
  DM.ReadDataSet.Open;

  if DM.ReadDataSet['ID_OBJECT']<> null
   then
    begin
     id_razdel  := DM.ReadDataSet['ID_OBJECT'];
     if DM.ReadDataSet['TITLE_OBJECT']<> null
      then
       begin
        Razdel_Label.Caption:= DM.ReadDataSet['TITLE_OBJECT'];
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
     DM.ReadDataSet.Close;
     exit;
    end;
  DM.ReadDataSet.Close;
end;

procedure TfrmSysOp.Stat_EditPropertiesButtonClick(Sender: TObject;
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

procedure TfrmSysOp.Stat_EditPropertiesEditValueChanged(
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

  DM.ReadDataSet.Close;
  DM.ReadDataSet.SelectSQL.Clear;
  DM.ReadDataSet.SelectSQL.Text := 'select ID_RAZD_ST, RAZD_ST_TITLE from ST_GET_ID_STAT_BY_CODE ('+ IntToStr(id_razdel) +','+ Stat_Edit.Text +')';
  DM.ReadDataSet.Open;

  if DM.ReadDataSet['ID_RAZD_ST']<> null
   then
    begin
     id_stat  := DM.ReadDataSet['ID_RAZD_ST'];
     if DM.ReadDataSet['RAZD_ST_TITLE']<> null
      then
       begin
        Stat_Label.Caption:= DM.ReadDataSet['RAZD_ST_TITLE'];
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
     DM.ReadDataSet.Close;
     exit;
    end;
  DM.ReadDataSet.Close;
end;

procedure TfrmSysOp.Kekv_EditPropertiesButtonClick(Sender: TObject;
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

procedure TfrmSysOp.Kekv_EditPropertiesEditValueChanged(
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

  DM.ReadDataSet.Close;
  DM.ReadDataSet.SelectSQL.Clear;
  DM.ReadDataSet.SelectSQL.Text := 'select ID_KEKV, KEKV_TITLE from PUB_SPR_KEKV_INFO_EX2 ( '+Kekv_Edit.Text+','+kav+Cur_date+kav+')';
  DM.ReadDataSet.Open;

  if DM.ReadDataSet['ID_KEKV']<> null
   then
    begin
     id_kekv  := DM.ReadDataSet['ID_KEKV'];
     if DM.ReadDataSet['KEKV_TITLE']<> null
      then
       begin
        Kekv_Label.Caption:= DM.ReadDataSet['KEKV_TITLE'];
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
     DM.ReadDataSet.Close;
     exit;
    end;
  DM.ReadDataSet.Close;
end;
end.
