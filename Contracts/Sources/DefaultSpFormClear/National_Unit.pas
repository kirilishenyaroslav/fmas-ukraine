//******************************************************************************
// Проект "Контракты"
// Справочник национальностей
// Чернявский А.Э. 2005г.
//******************************************************************************

unit National_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ImgList, cxGraphics, cxContainer, cxEdit,
  cxProgressBar, dxStatusBar, cxControls, IBase,
  DM_National, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxClasses, cxTextEdit;

type
  TfrmNationality = class(TForm)
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    PopupImageList: TImageList;
    LargeImages: TImageList;
    DisabledLargeImages: TImageList;
    dxStatusBar1: TdxStatusBar;
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
    name: TcxGridDBColumn;
    id_national: TcxGridDBColumn;
    short_name: TcxGridDBColumn;
  private
    PLanguageIndex: byte;
    DM:TDM;
    procedure FormIniLanguage;
  public
    constructor  Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);reintroduce;
  end;


implementation

{$R *.dfm}

constructor TfrmNationality.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);
begin
Screen.Cursor:=crHourGlass;
inherited Create(AOwner);
DM:=TDM.Create(Self);
DM.DataSet.SQLs.SelectSQL.Text := 'select * from CN_SP_NATIONAL_SELECT';
DM.DB.Handle:=DB_Handle;
DM.DataSet.Open;
GridDBView.DataController.DataSource := DM.DataSource;
Screen.Cursor:=crDefault;
end;

procedure TfrmNationality.FormIniLanguage;
begin
//
end;

end.
