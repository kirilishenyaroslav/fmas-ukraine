//******************************************************************************
// Проект "Контракты"
// Справочник второй
// Чернявский А.Э. 2005г.
//******************************************************************************

unit cn_DM_kr_db_Unit_Second;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ImgList, cxGraphics, cxContainer, cxEdit,
  cxProgressBar, dxStatusBar, cxControls, IBase,
  cn_DM_kr_db, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxClasses, cxTextEdit,
  cn_Common_Funcs, cnConsts, cn_Common_Types, cxCurrencyEdit, cn_DM_kr_db_Unit_Third,
  cxCalendar ;

type
  TfrmDB_KR_Info_2 = class(TForm)
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
    Grid: TcxGrid;
    GridDBView: TcxGridDBTableView;
    GridLevel: TcxGridLevel;
    SUMMA: TcxGridDBColumn;
    FIO_PEOPLE: TcxGridDBColumn;
    NUM_DOG: TcxGridDBColumn;
    SelectButton: TdxBarLargeButton;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
    procedure GridDBViewDblClick(Sender: TObject);
    procedure GridDBViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    PLanguageIndex: byte;
    DM:TDM_kr_db;
    procedure FormIniLanguage;
  public
    Date_Reg : TDate;
    DATE_PROV : Tdate;
    res:Variant;
    constructor  Create(InParams: TcnSimpleParamsEx; DateIn : TDate);reintroduce;
  end;


implementation

{$R *.dfm}

constructor TfrmDB_KR_Info_2.Create(InParams: TcnSimpleParamsEx; DateIn : TDate);
begin
Screen.Cursor:=crHourGlass;
inherited Create(InParams.Owner);
DM:=TDM_kr_db.Create(Self);
Date_Reg := DateIn;
DM.DataSet.SQLs.SelectSQL.Text := 'select * from CN_GET_ALL_PROV_INFO_BY_DOC('
                                  +''''+
                                  inttostr(InParams.cnParamsToPakage.ID_DOC)
                                  +''''+
                                  ',' +''''+ datetostr(Date_Reg)
                                  +''''+ ')';

DM.DB.Handle:=InParams.Db_Handle;
DM.DataSet.Open;
GridDBView.DataController.DataSource := DM.DataSource;
FormIniLanguage();
Screen.Cursor:=crDefault;
end;

procedure TfrmDB_KR_Info_2.FormIniLanguage;
begin
 PLanguageIndex:=           cn_Common_Funcs.cnLanguageIndex();

 //кэпшн формы
 Caption:=                      '\\';
 //названия кнопок
 AddButton.Caption :=           cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 EditButton.Caption :=          cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 DeleteButton.Caption :=        cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 RefreshButton.Caption :=       cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 SelectButton.Caption :=        cnConsts.cn_SelectBtn_Caption[PLanguageIndex];
 ExitButton.Caption :=          cnConsts.cn_ExitBtn_Caption[PLanguageIndex];

 FIO_PEOPLE.Caption :=          cnConsts.cn_grid_FIO_Column[PLanguageIndex];
 NUM_DOG.Caption :=             cnConsts.cn_DogNumProv[PLanguageIndex];
 SUMMA.Caption :=               cnConsts.cn_Summa_Column[PLanguageIndex];

  //статусбар
 StatusBar.Panels[0].Text:=  cnConsts.cn_InsertBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 StatusBar.Panels[1].Text:=  cnConsts.cn_EditBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 StatusBar.Panels[2].Text:=  cnConsts.cn_DeleteBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 StatusBar.Panels[3].Text:=  cnConsts.cn_RefreshBtn_ShortCut[PLanguageIndex] + cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 StatusBar.Panels[4].Text:=  cnConsts.cn_EnterBtn_ShortCut[PLanguageIndex]   + cnConsts.cn_SelectBtn_Caption[PLanguageIndex];
 StatusBar.Panels[5].Text:=  cnConsts.cn_ExitBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_ExitBtn_Caption[PLanguageIndex];
end;

procedure TfrmDB_KR_Info_2.ExitButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmDB_KR_Info_2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if FormStyle = fsMDIChild then action:=caFree
else
DM.Free;
end;

procedure TfrmDB_KR_Info_2.FormShow(Sender: TObject);
begin
if FormStyle = fsMDIChild then  SelectButton.Enabled:=false;
end;

procedure TfrmDB_KR_Info_2.SelectButtonClick(Sender: TObject);
var ViewForm : TfrmDB_KR_Info_3;
    AParameter : TcnSimpleParamsEx;
    DB_KR : TDB_KR;
begin
 AParameter:= TcnSimpleParamsEx.Create;
 DB_KR := TDB_KR.Create;
 DB_KR.ID_OPER    := Dm.DataSet['ID_OPER'];
 DB_KR.DATE_PROV  := DATE_PROV ;
 DB_KR.DB_ID_SM   := Dm.DataSet['DB_ID_SM'];
 DB_KR.DB_ID_RZ   := Dm.DataSet['DB_ID_RZ'];
 DB_KR.DB_ID_ST   := Dm.DataSet['DB_ID_ST'];
 DB_KR.DB_ID_KEKV := Dm.DataSet['DB_ID_KEKV'];
 DB_KR.KR_ID_SM   := Dm.DataSet['KR_ID_SM'];
 DB_KR.KR_ID_RZ   := Dm.DataSet['KR_ID_RZ'];
 DB_KR.KR_ID_ST   := Dm.DataSet['KR_ID_ST'];
 DB_KR.KR_ID_KEKV := Dm.DataSet['KR_ID_KEKV'];
 AParameter.Owner:=self;
 AParameter.Db_Handle:= DM.DB.Handle;
 AParameter.Formstyle:=fsNormal;
 AParameter.WaitPakageOwner:= self;
 ViewForm := TfrmDB_KR_Info_3.Create(AParameter, DB_KR);
 ViewForm.ShowModal;
end;

procedure TfrmDB_KR_Info_2.GridDBViewDblClick(Sender: TObject);
begin
SelectButtonClick(Sender);
end;

procedure TfrmDB_KR_Info_2.GridDBViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = vk_escape then close;
if key = vk_return then GridDBViewDblClick(Sender);
end;

end.
