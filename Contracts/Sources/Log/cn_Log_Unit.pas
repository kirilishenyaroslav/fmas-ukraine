//******************************************************************************
// Проект "Контракты"
// Справочник лог
// Чернявский А.Э. 2006г.
//******************************************************************************

unit cn_Log_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ImgList, cxGraphics, cxContainer, cxEdit,
  cxProgressBar, dxStatusBar, cxControls, IBase,
  cn_DM_Log, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxClasses, cxTextEdit,
  cn_Common_Funcs, cnConsts, cn_Common_Types, cxCalendar;

type
  TfrmLog = class(TForm)
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
    SelectButton: TdxBarLargeButton;
    USER_NAME: TcxGridDBColumn;
    ACTION_NAME: TcxGridDBColumn;
    TIMESTAMP_ACTION: TcxGridDBColumn;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    PLanguageIndex: byte;
    DM:TDM_Log;
    procedure FormIniLanguage;
  public
    res:Variant;
    constructor  Create(AParameter:TcnSimpleParamsEx);reintroduce;
  end;


implementation

{$R *.dfm}

constructor TfrmLog.Create(AParameter:TcnSimpleParamsEx);
begin
Screen.Cursor:=crHourGlass;
inherited Create(AParameter.Owner);
 GridDBView.Items[0].DataBinding.ValueTypeClass := TcxStringValueType;
 GridDBView.Items[1].DataBinding.ValueTypeClass := TcxStringValueType;
 GridDBView.Items[2].DataBinding.ValueTypeClass := TcxStringValueType;

DM:=TDM_Log.Create(Self);
DM.DataSet.SQLs.SelectSQL.Text := 'select * from CN_ACTION_HISTORY_SELECT(' +
 inttostr(AParameter.cnParamsToPakage.ID_DOG_ROOT) + ',' +
 inttostr(AParameter.cnParamsToPakage.ID_DOG)  + ',' +
 inttostr(AParameter.cnParamsToPakage.ID_STUD) + ')' ;
DM.DB.Handle:=AParameter.DB_Handle;
DM.DataSet.Open;
GridDBView.DataController.DataSource := DM.DataSource;
FormIniLanguage();
Screen.Cursor:=crDefault;
end;

procedure TfrmLog.FormIniLanguage;
begin
 PLanguageIndex:=           cn_Common_Funcs.cnLanguageIndex();

 //кэпшн формы
 Caption:=                      cnConsts.cn_Log[PLanguageIndex];
 //названия кнопок
 AddButton.Caption :=           cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 EditButton.Caption :=          cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 DeleteButton.Caption :=        cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 RefreshButton.Caption :=       cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 SelectButton.Caption :=        cnConsts.cn_SelectBtn_Caption[PLanguageIndex];
 ExitButton.Caption :=          cnConsts.cn_ExitBtn_Caption[PLanguageIndex];

 USER_NAME.Caption :=          cnConsts.cn_User[PLanguageIndex];
 ACTION_NAME.Caption :=        cnConsts.cn_Action[PLanguageIndex];
 TIMESTAMP_ACTION.Caption :=   cnConsts.cn_Stamp[PLanguageIndex];
  //статусбар
 StatusBar.Panels[0].Text:=  cnConsts.cn_InsertBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 StatusBar.Panels[1].Text:=  cnConsts.cn_EditBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 StatusBar.Panels[2].Text:=  cnConsts.cn_DeleteBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 StatusBar.Panels[3].Text:=  cnConsts.cn_RefreshBtn_ShortCut[PLanguageIndex] + cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 StatusBar.Panels[4].Text:=  cnConsts.cn_EnterBtn_ShortCut[PLanguageIndex]   + cnConsts.cn_SelectBtn_Caption[PLanguageIndex];
 StatusBar.Panels[5].Text:=  cnConsts.cn_ExitBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_ExitBtn_Caption[PLanguageIndex];
end;

procedure TfrmLog.ExitButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmLog.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if FormStyle = fsMDIChild then action:=caFree
else
DM.Free;
end;

procedure TfrmLog.FormShow(Sender: TObject);
begin
if FormStyle = fsMDIChild then  SelectButton.Enabled:=false;
end;

end.
