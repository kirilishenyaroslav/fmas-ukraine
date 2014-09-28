unit frmDateOplUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, Menus, cxGridTableView,
  ImgList, dxBar, dxBarExtItems, cxGridLevel, cxGridCustomTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  dxStatusBar, DM_IniTypeStage, cn_Common_Funcs, cnConsts, ibase, cn_Common_Messages, cnConsts_Messages;

type
  TfrmDateOpl = class(TForm)
    Grid: TcxGrid;
    GridDBView: TcxGridDBTableView;
    GridLevel: TcxGridLevel;
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    SelectButton: TdxBarLargeButton;
    DateOlpButton: TdxBarLargeButton;
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
    PopupMenu1: TPopupMenu;
    AddPop: TMenuItem;
    EditPop: TMenuItem;
    DeletePop: TMenuItem;
    RefreshPop: TMenuItem;
    ExitPop: TMenuItem;
    DayStage_Col: TcxGridDBColumn;
    MonthSatge_Col: TcxGridDBColumn;
    procedure ExitButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure GridDBViewDblClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
  private
    PLanguageIndex: byte;
    ID_TYPE_STAGE: int64;
    DM:TDM_ITS;
    procedure FormIniLanguage;
  public
    constructor  Create(ChildOwner: TComponent; DBH: TISC_DB_HANDLE; ID_TYPE_STAGE_in : int64);reintroduce;
  end;

implementation
  uses frmDateOplUnit_AE;

{$R *.dfm}
procedure TfrmDateOpl.FormIniLanguage;
begin
 PLanguageIndex:=           cn_Common_Funcs.cnLanguageIndex();
 //кэпшн формы
 Caption:=                  cnConsts.cn_Main_SpDatePay[PLanguageIndex];
 //названия кнопок
 AddButton.Caption :=       cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 EditButton.Caption :=      cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 DeleteButton.Caption :=    cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 RefreshButton.Caption :=   cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 SelectButton.Caption :=    cnConsts.cn_SelectBtn_Caption[PLanguageIndex];
 ExitButton.Caption :=      cnConsts.cn_ExitBtn_Caption[PLanguageIndex];
 // попап
 AddPop.Caption :=          cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 EditPop.Caption :=         cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 DeletePop.Caption :=       cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 RefreshPop.Caption :=      cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 ExitPop.Caption :=         cnConsts.cn_ExitBtn_Caption[PLanguageIndex];
 //грид
 DayStage_Col.  Caption:=   cnConsts.cn_Day[PLanguageIndex];
 MonthSatge_Col.Caption:=   cnConsts.cn_Month[PLanguageIndex];
end;

constructor TfrmDateOpl.Create(ChildOwner: TComponent; DBH: TISC_DB_HANDLE; ID_TYPE_STAGE_in : int64);
begin
Screen.Cursor:=crHourGlass;
inherited Create(ChildOwner);
ID_TYPE_STAGE:= ID_TYPE_STAGE_in;
DM:=TDM_ITS.Create(Self);
DM.DataSet.SQLs.SelectSQL.Text := 'select * from CN_INI_DATEOPL_BY_STAGE_SELECT(' + inttostr(ID_TYPE_STAGE)+ ')';
DM.DB.Handle:= DBH;
DM.DataSet.Open;
GridDBView.DataController.DataSource := DM.DataSource;
FormIniLanguage();
Screen.Cursor:=crDefault;
end;

procedure TfrmDateOpl.ExitButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmDateOpl.AddButtonClick(Sender: TObject);
var
ViewForm : TfrmDateOplAE;
New_id_Locator : int64;
begin
ViewForm:= TfrmDateOplAE.Create(Self, PLanguageIndex);
ViewForm.Caption := cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 if ViewForm.ShowModal = mrOk then
 begin
     with DM.StProc do
       try
        Transaction.StartTransaction;
        StoredProcName := 'CN_INI_DATEOPL_BY_STAGE_INSERT';
        Prepare;
        ParamByName('ID_TYPE_STAGE').AsInt64     := ID_TYPE_STAGE;
        ParamByName('DAY_STAGE').AsString        := ViewForm.Day_Edit.Text;
        ParamByName('MONTH_STAGE').AsString      := ViewForm.Month_Edit.Text;
        ExecProc;
        New_id_Locator:=ParamByName('ID_DATEOPL_STAGE').AsInt64;
        Transaction.Commit;
       except
          Transaction.Rollback;
       end;
 DM.DataSet.CloseOpen(True);
 DM.DataSet.Locate('ID_DATEOPL_STAGE',New_id_Locator,[] );
   end;
end;


procedure TfrmDateOpl.EditButtonClick(Sender: TObject);
var
ViewForm : TfrmDateOplAE;
id_Locator : Int64;
begin
if Dm.DataSet.RecordCount = 0 then exit;
ViewForm:= TfrmDateOplAE.Create(Self, PLanguageIndex);
ViewForm.Caption := cnConsts.cn_EditBtn_Caption[PLanguageIndex];
ViewForm.Day_Edit.Text:=  DM.DataSet['DAY_STAGE'];
ViewForm.Month_Edit.Text:=  DM.DataSet['MONTH_STAGE'];
 if ViewForm.ShowModal = mrOk then
 begin
     id_Locator:=  DM.DataSet['ID_DATEOPL_STAGE'];
     with DM.StProc do
       try
        Transaction.StartTransaction;
        StoredProcName := 'CN_INI_DATEOPL_BY_STAGE_U';
        Prepare;
        ParamByName('ID_DATEOPL_STAGE').AsInt64  := id_Locator;
        ParamByName('ID_TYPE_STAGE').AsInt64     := ID_TYPE_STAGE;
        ParamByName('DAY_STAGE').AsString        := ViewForm.Day_Edit.Text;
        ParamByName('MONTH_STAGE').AsString      := ViewForm.Month_Edit.Text;
        ExecProc;
        Transaction.Commit;
       except
          Transaction.Rollback;
       end;
 DM.DataSet.CloseOpen(True);
 DM.DataSet.Locate('ID_DATEOPL_STAGE', id_Locator ,[] );
   end;
end;

procedure TfrmDateOpl.GridDBViewDblClick(Sender: TObject);
begin
EditButtonClick(Sender);
end;

procedure TfrmDateOpl.DeleteButtonClick(Sender: TObject);
 var
  i: byte;
 begin
  if Dm.DataSet.RecordCount = 0 then exit;
  i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts_Messages.cn_warning_Delete[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit
  else
  begin
     with DM.StProc do
       try
        Transaction.StartTransaction;
        StoredProcName := 'CN_INI_DATEOPL_BY_STAGE_D';
        Prepare;
        ParamByName('ID_DATEOPL_STAGE').AsInt64       :=  DM.DataSet['ID_DATEOPL_STAGE'];
        ExecProc;
        Transaction.Commit;
       except
        Transaction.Rollback;
       end;
 DM.DataSet.CloseOpen(True);
   end;
end;

procedure TfrmDateOpl.RefreshButtonClick(Sender: TObject);
begin
 DM.DataSet.CloseOpen(True);
end;

end.
