//******************************************************************************
// Проект "Контракты"
// Справочник третий
// Чернявский А.Э. 2005г.
//******************************************************************************

unit cn_DM_kr_db_Unit_Third;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ImgList, cxGraphics, cxContainer, cxEdit,
  cxProgressBar, dxStatusBar, cxControls, IBase,
  cn_DM_kr_db, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxClasses, cxTextEdit,
  cn_Common_Funcs, cnConsts, cn_Common_Types, StdCtrls, cxGroupBox,
  ActnList;

type TDB_KR = class
    ID_OPER   : int64;
    DATE_PROV : Tdate;
    DB_ID_SM  : int64;
    DB_ID_RZ  : int64;
    DB_ID_ST  : int64;
    DB_ID_KEKV: int64;
    KR_ID_SM  : int64;
    KR_ID_RZ  : int64;
    KR_ID_ST  : int64;
    KR_ID_KEKV: int64;
end;

type
  TfrmDB_KR_Info_3 = class(TForm)
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    PopupImageList: TImageList;
    LargeImages: TImageList;
    DisabledLargeImages: TImageList;
    StatusBar: TdxStatusBar;
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
    SelectButton: TdxBarLargeButton;
    cxGroupBox2: TcxGroupBox;
    db_l1: TLabel;
    db_l2: TLabel;
    db_l3: TLabel;
    db_l4: TLabel;
    db_l5: TLabel;
    db_l6: TLabel;
    cxGroupBox1: TcxGroupBox;
    kr_l1: TLabel;
    kr_l2: TLabel;
    kr_l3: TLabel;
    kr_l4: TLabel;
    kr_l5: TLabel;
    kr_l6: TLabel;
    ActionList1: TActionList;
    EscAction: TAction;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EscActionExecute(Sender: TObject);
  private
    PLanguageIndex: byte;
    DM:TDM_kr_db;
    procedure FormIniLanguage;
  public
    res:Variant;
    constructor  Create(InParams: TcnSimpleParamsEx; DB_KR: TDB_KR);reintroduce;
  end;


implementation

{$R *.dfm}

constructor TfrmDB_KR_Info_3.Create(InParams: TcnSimpleParamsEx; DB_KR: TDB_KR);
begin
Screen.Cursor:=crHourGlass;
inherited Create(InParams.Owner);
DM:=TDM_kr_db.Create(Self);
DM.DataSet.SQLs.SelectSQL.Text := 'select * from CN_GET_DB_KR_PROV_INFO(' +
                                  '''' + inttostr(DB_KR.ID_OPER)    + '''' + ','+
                                  '''' + datetostr(DB_KR.DATE_PROV) + '''' + ','+
                                  '''' + inttostr(DB_KR.DB_ID_SM)   + '''' + ','+
                                  '''' + inttostr(DB_KR.DB_ID_RZ)   + '''' + ','+
                                  '''' + inttostr(DB_KR.DB_ID_ST)   + '''' + ','+
                                  '''' + inttostr(DB_KR.DB_ID_KEKV) + '''' + ','+
                                  '''' + inttostr(DB_KR.KR_ID_SM)   + '''' + ','+
                                  '''' + inttostr(DB_KR.KR_ID_RZ)   + '''' + ','+
                                  '''' + inttostr(DB_KR.KR_ID_ST)   + '''' + ','+
                                  '''' + inttostr(DB_KR.KR_ID_KEKV) + '''' + ') where MODE =' +''''+ 'KR' + '''';
DM.DB.Handle:=InParams.DB_Handle;
DM.DataSet.Open;
kr_l1.Caption := inttostr(DM.DataSet['SMETA_KOD']) + '. ' + DM.DataSet['SMETA_TITLE'];
kr_l2.Caption := inttostr(DM.DataSet['RAZD_NUM']) + '. ' + DM.DataSet['RAZD_TITLE'];
kr_l3.Caption := inttostr(DM.DataSet['ST_NUM']) + '. ' + DM.DataSet['ST_TITLE'];
kr_l4.Caption := inttostr(DM.DataSet['KEKV_KODE']) + '. ' + DM.DataSet['KEKV_TITLE'];
kr_l5.Caption := DM.DataSet['SCH_NUMBER'] + '. ' + DM.DataSet['SCH_TITLE'];
kr_l6.Caption := DM.DataSet['SUB_SCH_NUMBER'] + '. ' + DM.DataSet['SUB_SCH_TITLE'];
DM.DataSet.Close;
DM.DataSet.SQLs.SelectSQL.Text := 'select * from CN_GET_DB_KR_PROV_INFO(' +
                                  '''' + inttostr(DB_KR.ID_OPER)    + '''' + ','+
                                  '''' + datetostr(DB_KR.DATE_PROV) + '''' + ','+
                                  '''' + inttostr(DB_KR.DB_ID_SM)   + '''' + ','+
                                  '''' + inttostr(DB_KR.DB_ID_RZ)   + '''' + ','+
                                  '''' + inttostr(DB_KR.DB_ID_ST)   + '''' + ','+
                                  '''' + inttostr(DB_KR.DB_ID_KEKV) + '''' + ','+
                                  '''' + inttostr(DB_KR.KR_ID_SM)   + '''' + ','+
                                  '''' + inttostr(DB_KR.KR_ID_RZ)   + '''' + ','+
                                  '''' + inttostr(DB_KR.KR_ID_ST)   + '''' + ','+
                                  '''' + inttostr(DB_KR.KR_ID_KEKV) + '''' + ') where MODE =' +''''+ 'DB' + '''';
DM.DB.Handle:=InParams.DB_Handle;
DM.DataSet.Open;
db_l1.Caption := inttostr(DM.DataSet['SMETA_KOD']) + '. ' + DM.DataSet['SMETA_TITLE'];
db_l2.Caption := inttostr(DM.DataSet['RAZD_NUM']) + '. ' + DM.DataSet['RAZD_TITLE'];
db_l3.Caption := inttostr(DM.DataSet['ST_NUM']) + '. ' + DM.DataSet['ST_TITLE'];
db_l4.Caption := inttostr(DM.DataSet['KEKV_KODE']) + '. ' + DM.DataSet['KEKV_TITLE'];
db_l5.Caption := DM.DataSet['SCH_NUMBER'] + '. ' + DM.DataSet['SCH_TITLE'];
db_l6.Caption := DM.DataSet['SUB_SCH_NUMBER'] + '. ' + DM.DataSet['SUB_SCH_TITLE'];
DM.DataSet.Close;

FormIniLanguage();
Screen.Cursor:=crDefault;
end;

procedure TfrmDB_KR_Info_3.FormIniLanguage;
begin
 PLanguageIndex:=           cn_Common_Funcs.cnLanguageIndex();

 //кэпшн формы
 Caption:=                      '\\\';
 //названия кнопок
 AddButton.Caption :=           cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 EditButton.Caption :=          cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 DeleteButton.Caption :=        cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 RefreshButton.Caption :=       cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 SelectButton.Caption :=        cnConsts.cn_SelectBtn_Caption[PLanguageIndex];
 ExitButton.Caption :=          cnConsts.cn_ExitBtn_Caption[PLanguageIndex];

 cxGroupBox1.Caption :=          cnConsts.cn_Kr[PLanguageIndex];
 cxGroupBox2.Caption :=          cnConsts.cn_Db[PLanguageIndex];

  //статусбар
 StatusBar.Panels[0].Text:=  cnConsts.cn_InsertBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 StatusBar.Panels[1].Text:=  cnConsts.cn_EditBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 StatusBar.Panels[2].Text:=  cnConsts.cn_DeleteBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 StatusBar.Panels[3].Text:=  cnConsts.cn_RefreshBtn_ShortCut[PLanguageIndex] + cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 StatusBar.Panels[4].Text:=  cnConsts.cn_EnterBtn_ShortCut[PLanguageIndex]   + cnConsts.cn_SelectBtn_Caption[PLanguageIndex];
 StatusBar.Panels[5].Text:=  cnConsts.cn_ExitBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_ExitBtn_Caption[PLanguageIndex];
end;

procedure TfrmDB_KR_Info_3.ExitButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmDB_KR_Info_3.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if FormStyle = fsMDIChild then action:=caFree
else
DM.Free;
end;

procedure TfrmDB_KR_Info_3.FormShow(Sender: TObject);
begin
if FormStyle = fsMDIChild then  SelectButton.Enabled:=false;
end;

procedure TfrmDB_KR_Info_3.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then close;
end;

procedure TfrmDB_KR_Info_3.EscActionExecute(Sender: TObject);
begin
Close;
end;

end.
