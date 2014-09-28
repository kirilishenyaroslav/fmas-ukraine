unit cn_Select_Payer_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, dxStatusBar, cn_Common_Types, DM_ContractsList,
  cxTextEdit, cnConsts, Placemnt;

type
  TfrmSelectPayer = class(TForm)
    StatusBar: TdxStatusBar;
    Grid: TcxGrid;
    GridDBView: TcxGridDBTableView;
    GridLevel: TcxGridLevel;
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
    name_payer: TcxGridDBColumn;
    type_payer: TcxGridDBColumn;
    procedure GridDBViewDblClick(Sender: TObject);
    procedure GridDBViewKeyPress(Sender: TObject; var Key: Char);
    procedure GridDBViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    PLanguageIndex: byte;
    procedure FormIniLanguage();
  public
    DM_PS:TDM_CL;
    constructor  Create(CurrentConnect:TCurrentConnect;
                 ID_DOG_ROOT: int64; ID_DOG: int64; ID_STUD: int64);reintroduce;
  end;

var
  frmSelectPayer: TfrmSelectPayer;

implementation

{$R *.dfm}


constructor TfrmSelectPayer.Create(CurrentConnect:TCurrentConnect;
                                   ID_DOG_ROOT: int64; ID_DOG: int64; ID_STUD: int64);
begin
Screen.Cursor:=crHourGlass;
inherited Create(Owner);
DM_PS:=TDM_CL.Create(Self);
DM_PS.DB.Handle:=CurrentConnect.Db_Handle;
PLanguageIndex :=CurrentConnect.PLanguageIndex;
DM_PS.DataSet.SQLs.SelectSQL.clear;
DM_PS.DataSet.SQLs.SelectSQL.Text := 'select * from CN_DT_ALL_PAYERS_SELECT('+
                                              inttostr(ID_STUD) + ','+ inttostr(ID_DOG)
                                       + ','+ inttostr(ID_DOG_ROOT)
                                       +')';
DM_PS.DataSet.Open;
GridDBView.DataController.DataSource := DM_PS.DataSource;
FormIniLanguage();
Screen.Cursor:=crDefault;
end;

procedure TfrmSelectPayer.FormIniLanguage;
begin
 //кэпшн формы
 Caption:=                   cnConsts.cn_Payer_Osoba[PLanguageIndex];
 //статусбар
 StatusBar.Panels[0].Text:=  cnConsts.cn_PayerSelect[PLanguageIndex];
 StatusBar.Panels[1].Text:=  cnConsts.cn_EnterBtn_ShortCut[PLanguageIndex]   + cnConsts.cn_SelectBtn_Caption[PLanguageIndex];
 StatusBar.Panels[2].Text:=  cnConsts.cn_ExitBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_ExitBtn_Caption[PLanguageIndex];
 StatusBar.Hint:=            cnConsts.cn_HotKeys[PLanguageIndex];
 // Грид
 name_payer.Caption :=       cnConsts.cn_grid_FIO_Column[PLanguageIndex];
 type_payer.Caption :=       cnConsts.cn_PayerType[PLanguageIndex];

end;

procedure TfrmSelectPayer.GridDBViewDblClick(Sender: TObject);
begin
  if DM_PS.DataSet.RecordCount = 0 then
   ModalResult := -1
   else
   ModalResult := mrOk;
end;

procedure TfrmSelectPayer.GridDBViewKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then GridDBViewDblClick(Sender);
end;

procedure TfrmSelectPayer.GridDBViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = VK_ESCAPE then close;
end;

end.

