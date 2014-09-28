//******************************************************************************
// Проект "Студгородок"
// Справочник инф. о документах и проводках
// Чернявский А.Э. 2007г.
//******************************************************************************

unit cn_DM_kr_db_Unit_Begin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ImgList, cxGraphics, cxContainer, cxEdit,
  cxProgressBar, dxStatusBar, cxControls, IBase,
  cn_DM_kr_db, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxClasses, cxTextEdit,
  cn_Common_Funcs, cnConsts, cn_Common_Types, cxCalendar, cn_DM_kr_db_Unit_Second,
  cxCurrencyEdit;

type
  TfrmDB_KR_Info = class(TForm)
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
    date_prov: TcxGridDBColumn;
    note: TcxGridDBColumn;
    user: TcxGridDBColumn;
    SelectButton: TdxBarLargeButton;
    DATE_REG: TcxGridDBColumn;
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
    ID_DOC : int64;
    procedure FormIniLanguage;
  public
    res:Variant;
    constructor  Create(InParams: TcnSimpleParamsEx);reintroduce;
  end;


implementation

{$R *.dfm}

constructor TfrmDB_KR_Info.Create(InParams: TcnSimpleParamsEx);
begin
Screen.Cursor:=crHourGlass;
inherited Create(InParams.Owner);
DM:=TDM_kr_db.Create(Self);
DM.DataSet.SQLs.SelectSQL.Text := 'select * from CN_GET_DOC_INFO_BY_ID_DOC('+
                                   inttostr(InParams.cnParamsToPakage.ID_DOC) + ')' ;
DM.DB.Handle:=InParams.Db_Handle;
DM.DataSet.Open;
GridDBView.DataController.DataSource := DM.DataSource;
ID_DOC := InParams.cnParamsToPakage.ID_DOC;
FormIniLanguage();
Screen.Cursor:=crDefault;
end;

procedure TfrmDB_KR_Info.FormIniLanguage;
begin
 PLanguageIndex:=           cn_Common_Funcs.cnLanguageIndex();

 //кэпшн формы
 Caption:=                      '\';
 //названия кнопок
 AddButton.Caption :=           cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 EditButton.Caption :=          cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 DeleteButton.Caption :=        cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 RefreshButton.Caption :=       cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 SelectButton.Caption :=        cnConsts.cn_SelectBtn_Caption[PLanguageIndex];
 ExitButton.Caption :=          cnConsts.cn_ExitBtn_Caption[PLanguageIndex];

 date_prov.Caption :=          cnConsts.cn_DateProv[PLanguageIndex];
 note.Caption :=          cnConsts.cn_ProvNote[PLanguageIndex];
 user.Caption :=          cnConsts.cn_Pevdonim[PLanguageIndex];

  //статусбар
 StatusBar.Panels[0].Text:=  cnConsts.cn_InsertBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 StatusBar.Panels[1].Text:=  cnConsts.cn_EditBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 StatusBar.Panels[2].Text:=  cnConsts.cn_DeleteBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 StatusBar.Panels[3].Text:=  cnConsts.cn_RefreshBtn_ShortCut[PLanguageIndex] + cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 StatusBar.Panels[4].Text:=  cnConsts.cn_EnterBtn_ShortCut[PLanguageIndex]   + cnConsts.cn_SelectBtn_Caption[PLanguageIndex];
 StatusBar.Panels[5].Text:=  cnConsts.cn_ExitBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_ExitBtn_Caption[PLanguageIndex];
end;

procedure TfrmDB_KR_Info.ExitButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmDB_KR_Info.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if FormStyle = fsMDIChild then action:=caFree
else
DM.Free;
end;

procedure TfrmDB_KR_Info.FormShow(Sender: TObject);
begin
if FormStyle = fsMDIChild then  SelectButton.Enabled:=false;
end;

procedure TfrmDB_KR_Info.SelectButtonClick(Sender: TObject);
var ViewForm : TfrmDB_KR_Info_2;
    AParameter : TcnSimpleParamsEx;
begin
 AParameter:= TcnSimpleParamsEx.Create;
 AParameter.Owner:=self;
 AParameter.Db_Handle:= DM.DB.Handle;
 AParameter.Formstyle:=fsNormal;
 AParameter.cnParamsToPakage.ID_DOC := ID_DOC;
 AParameter.WaitPakageOwner:= self;
 ViewForm := TfrmDB_KR_Info_2.Create(AParameter, DM.DataSet['DATE_REG']);
 ViewForm.DATE_PROV := DM.DataSet['DATE_PROV'];
 ViewForm.ShowModal;

end;

procedure TfrmDB_KR_Info.GridDBViewDblClick(Sender: TObject);
begin
if GridDBView.DataController.RecordCount = 0 then exit;
SelectButtonClick(Sender);
end;

procedure TfrmDB_KR_Info.GridDBViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then close;
if key = vk_return then GridDBViewDblClick(Sender);
end;

end.
