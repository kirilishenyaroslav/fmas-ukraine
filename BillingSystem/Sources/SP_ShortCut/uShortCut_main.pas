//******************************************************************************
// Проект ""
// Справочник категорий
//
// последние изменения
//******************************************************************************

unit uShortCut_main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ImgList, cxGraphics, cxContainer, cxEdit,
  cxProgressBar, dxStatusBar, cxControls, IBase,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxClasses, cxTextEdit,
  uCommon_Funcs, uConsts, uShortCut_DM, uShortCut_AE, uCommon_Messages, uConsts_Messages,
  Menus, uCommon_Types, Placemnt, cxCheckBox, AccMGMT, cxCalendar,
  cxGroupBox, cxSplitter, Grids;

type
  TfrmShortCut_Main = class(TForm)
    BarManager: TdxBarManager;
    EditButton: TdxBarLargeButton;
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
    PopupMenu1: TPopupMenu;
    EditPop: TMenuItem;
    RefreshPop: TMenuItem;
    ExitPop: TMenuItem;
    bsFormStorage: TFormStorage;
    SG_ShutCut: TStringGrid;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure EditPopClick(Sender: TObject);
    procedure RefreshPopClick(Sender: TObject);
    procedure ExitPopClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    PLanguageIndex: byte;
    DM : TShortCut_DM;
    procedure FormIniLanguage;
    procedure Refresh_SG;
  public
    res : Variant;
    is_Admin, Belong : Boolean;
    ID_LGOT : Int64;
    constructor  Create(AParameter:TbsSimpleParams);reintroduce;
  end;

const aShortCut : array [1..21] of String = ('View','Edit','Add','Del','Print','Block','Close','Work','Done','UnDone','Rejection','Sign','Configure','UnSign'
  ,'Change','Choice','Search','StepUp','StepDown','Clear','Refresh');


implementation

uses cxCurrencyEdit, FIBQuery;

{$R *.dfm}

constructor TfrmShortCut_Main.Create(AParameter:TbsSimpleParams);
begin
   Screen.Cursor:=crHourGlass;
   inherited Create(AParameter.Owner);

   is_Admin := AParameter.is_Admin;

   DM := TShortCut_DM.Create(Self);

   DM.DB.Handle := AParameter.Db_Handle;
   DM.DB.Connected := True;
   DM.ReadTransaction.StartTransaction;

   FormIniLanguage();

   RefreshButtonClick(self);

   Screen.Cursor := crDefault;

   bsFormStorage.RestoreFormPlacement;
end;

procedure TfrmShortCut_Main.FormIniLanguage;
begin
  PLanguageIndex := uCommon_Funcs.bsLanguageIndex();

  //кэпшн формы
  Caption := uConsts.BS_SHORT_CUT[PLanguageIndex];

  //названия кнопок добавления льгот
  EditButton.Caption    := uConsts.bs_EditBtn_Caption[PLanguageIndex];
  RefreshButton.Caption := uConsts.bs_RefreshBtn_Caption[PLanguageIndex];
  ExitButton.Caption    := uConsts.bs_ExitBtn_Caption[PLanguageIndex];

  // попап
  EditPop.Caption    := uConsts.bs_EditBtn_Caption[PLanguageIndex];
  RefreshPop.Caption := uConsts.bs_RefreshBtn_Caption[PLanguageIndex];
  ExitPop.Caption    := uConsts.bs_ExitBtn_Caption[PLanguageIndex];

  //Статусбар
  StatusBar.Panels[0].Text := uConsts.bs_EditBtn_ShortCut[PLanguageIndex]    + uConsts.bs_EditBtn_Caption[PLanguageIndex];
  StatusBar.Panels[1].Text := uConsts.bs_RefreshBtn_ShortCut[PLanguageIndex] + uConsts.bs_RefreshBtn_Caption[PLanguageIndex];
  StatusBar.Panels[2].Text := uConsts.bs_ExitBtn_ShortCut[PLanguageIndex]    + uConsts.bs_ExitBtn_Caption[PLanguageIndex];
end;

procedure TfrmShortCut_Main.ExitButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmShortCut_Main.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  bsFormStorage.SaveFormPlacement;
  if FormStyle = fsMDIChild
   then action := caFree
   else DM.Free;
end;

procedure TfrmShortCut_Main.EditButtonClick(Sender: TObject);
var
  ViewForm : TfrmShortCut_AE;
begin
  if not is_Admin then
   if fibCheckPermission('/ROOT/BillingSystem/BS_Configuration/BS_HotKey','Edit') <> 0
    then
     begin
      messagebox(handle,
      pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
      +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
      pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     end;

  ViewForm := TfrmShortCut_AE.Create(Self, PLanguageIndex);

  ViewForm.Caption          := uConsts.bs_EditBtn_Caption[PLanguageIndex];
  if DM.DataSet['act_' + aShortCut[SG_ShutCut.Row]] <> null
   then ViewForm.Name_Edit.HotKey := TextToShortCut(DM.DataSet['act_' + aShortCut[SG_ShutCut.Row]]);

  if ViewForm.ShowModal = mrOk then
   begin
     with DM.StProc do
      Begin
       Transaction.StartTransaction;
       StoredProcName := 'BS_SHORTCUT_UPD';
       Prepare;
       ParamByName('NAME_FIELD').AsString  := 'act_' + aShortCut[SG_ShutCut.Row];
       ParamByName('VALUE_FIELD').AsString := ShortCutToText(ViewForm.Name_Edit.HotKey);
       ExecProc;
       try
        Transaction.Commit;
        except
         on E:Exception do
          begin
           bsShowMessage('Error',e.Message,mtError,[mbOK]);
           Transaction.Rollback;
           raise;
          end;
       end;
      end;
      RefreshButtonClick(self);
   end;
end;

procedure TfrmShortCut_Main.RefreshButtonClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;

  DM.DataSet.Close;
  DM.DataSet.SQLs.SelectSQL.Text := 'Select * from bs_shortcut';
  DM.DataSet.Open;

  Refresh_SG;

  Screen.Cursor := crDefault;
end;

procedure TfrmShortCut_Main.EditPopClick(Sender: TObject);
begin
  EditButtonClick(Sender);
end;

procedure TfrmShortCut_Main.RefreshPopClick(Sender: TObject);
begin
  RefreshButtonClick(Sender);
end;

procedure TfrmShortCut_Main.ExitPopClick(Sender: TObject);
begin
  ExitButtonClick(Sender);
end;

procedure TfrmShortCut_Main.FormShow(Sender: TObject);
begin
  SG_ShutCut.Cells[0,0] := 'Действие';
  SG_ShutCut.Cells[1,0] := 'Горячая клавиша';
  SG_ShutCut.Cells[2,0] := 'Описание';

  Refresh_SG;
end;

procedure TfrmShortCut_Main.Refresh_SG;
var
  i : integer;
begin
  For i := 1 to 21 do
   Begin
    SG_ShutCut.Cells[0,i] := aShortCut[i];
    if DM.DataSet['act_' + aShortCut[i]] <> null
     then SG_ShutCut.Cells[1,i] := DM.DataSet['act_' + aShortCut[i]]
     else SG_ShutCut.Cells[1,i] := '';
   end;
end;

end.
