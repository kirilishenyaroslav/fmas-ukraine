//******************************************************************************
// Проект "Контракты"
// Справочник периодичностей оплат
// Чернявский А.Э. 2005г.
// последние изменения Перчак А.Л. 28/09/2010
//******************************************************************************

unit IniTypeStage_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ImgList, cxGraphics, cxContainer, cxEdit,
  cxProgressBar, dxStatusBar, cxControls, IBase,
  DM_IniTypeStage, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxClasses, cxTextEdit,
  cn_Common_Funcs, cnConsts, cn_Common_Messages, cnConsts_Messages,
  Menus, cn_Common_Types;

type
  TfrmIniTypeStage = class(TForm)
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
    name: TcxGridDBColumn;
    SelectButton: TdxBarLargeButton;
    PopupMenu1: TPopupMenu;
    AddPop: TMenuItem;
    EditPop: TMenuItem;
    DeletePop: TMenuItem;
    RefreshPop: TMenuItem;
    ExitPop: TMenuItem;
    DateOlpButton: TdxBarLargeButton;
    n_part: TcxGridDBColumn;
    cnt_month_term: TcxGridDBColumn;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelectButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridDBViewDblClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure AddPopClick(Sender: TObject);
    procedure EditPopClick(Sender: TObject);
    procedure DeletePopClick(Sender: TObject);
    procedure RefreshPopClick(Sender: TObject);
    procedure ExitPopClick(Sender: TObject);
    procedure DateOlpButtonClick(Sender: TObject);
    procedure Refresh_Grid;
  private
    PLanguageIndex: byte;
    DM:TDM_ITS;
    procedure FormIniLanguage;
  public
    res:Variant;
    Is_admin:Boolean;
    constructor  Create(AParameter:TcnSimpleParams);reintroduce;
  end;


implementation

uses IniTypeStage_Add_Edit, cxCurrencyEdit, FIBQuery, frmDateOplUnit,
  cxDropDownEdit;

{$R *.dfm}

constructor TfrmIniTypeStage.Create(AParameter:TcnSimpleParams);
begin
  Screen.Cursor:=crHourGlass;
  inherited Create(AParameter.Owner);
  DM:=TDM_ITS.Create(Self);
  DM.DB.Handle:=AParameter.DB_Handle;
  GridDBView.DataController.DataSource := DM.DataSource;
  Refresh_Grid;
  if AParameter.ID_Locate <> null then  DM.DataSet.Locate('ID_TYPE_STAGE', AParameter.ID_Locate, [] );

  FormIniLanguage();
  Is_admin:=AParameter.is_admin;
  Screen.Cursor:=crDefault;
  DateOlpButton.Visible:=ivNever;
end;

procedure TfrmIniTypeStage.Refresh_Grid;
begin
  Screen.Cursor := crHourGlass;

  DM.DataSet.Close;
  DM.DataSet.SQLs.SelectSQL.Text := 'select * from CN_INI_TYPE_STAGE_SELECT';
  DM.DataSet.Open;

  Screen.Cursor := crDefault;
end;

procedure TfrmIniTypeStage.FormIniLanguage;
begin
  PLanguageIndex:=           cn_Common_Funcs.cnLanguageIndex();
  Caption:=                      cnConsts.cn_Main_IniPeriodic[PLanguageIndex];
  AddButton.Caption :=           cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
  EditButton.Caption :=          cnConsts.cn_EditBtn_Caption[PLanguageIndex];
  DeleteButton.Caption :=        cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
  RefreshButton.Caption :=       cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
  SelectButton.Caption :=        cnConsts.cn_SelectBtn_Caption[PLanguageIndex];
  ExitButton.Caption :=          cnConsts.cn_ExitBtn_Caption[PLanguageIndex];
  DateOlpButton.Caption :=       cnConsts.cn_Date_Opl_Column[PLanguageIndex];

  AddPop.Caption :=           cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
  EditPop.Caption :=          cnConsts.cn_EditBtn_Caption[PLanguageIndex];
  DeletePop.Caption :=        cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
  RefreshPop.Caption :=       cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
  ExitPop.Caption :=          cnConsts.cn_ExitBtn_Caption[PLanguageIndex];
  name.Caption:=                cnConsts.cn_Name_Column[PLanguageIndex];
//  CNT_MONTH.Caption:=           cnConsts.cn_cntMonth_Column[PLanguageIndex];
  //статусбар
  StatusBar.Panels[0].Text:=  cnConsts.cn_InsertBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
  StatusBar.Panels[1].Text:=  cnConsts.cn_EditBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_EditBtn_Caption[PLanguageIndex];
  StatusBar.Panels[2].Text:=  cnConsts.cn_DeleteBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
  StatusBar.Panels[3].Text:=  cnConsts.cn_RefreshBtn_ShortCut[PLanguageIndex] + cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
  StatusBar.Panels[4].Text:=  cnConsts.cn_EnterBtn_ShortCut[PLanguageIndex]   + cnConsts.cn_SelectBtn_Caption[PLanguageIndex];
  StatusBar.Panels[5].Text:=  cnConsts.cn_ExitBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_ExitBtn_Caption[PLanguageIndex];
end;

procedure TfrmIniTypeStage.ExitButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmIniTypeStage.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if FormStyle = fsMDIChild then action:=caFree
else
DM.Free;
end;

procedure TfrmIniTypeStage.SelectButtonClick(Sender: TObject);
var id_sp: int64;
    RecMultiSelected, i: integer;
begin
if GridDBView.datacontroller.recordcount = 0 then exit;
 if GridDBView.OptionsSelection.MultiSelect=true then
  begin
   RecMultiSelected:= GridDBView.DataController.GetSelectedCount;
   res:=VarArrayCreate([0,RecMultiSelected-1],varVariant);
   for i:=0 to GridDBView.DataController.GetSelectedCount-1 do
     begin
      res[i]:=GridDBView.Controller.SelectedRecords[i].Values[1];
     end;
  end
  else
  begin
    Res:=VarArrayCreate([0,3],varVariant);
    id_sp:= DM.DataSet['ID_TYPE_STAGE'];
    Res[0]:= id_sp;
    Res[1]:=DM.DataSet['NAME_STAGE'];
  end;  
ModalResult:=mrOk;
end;

procedure TfrmIniTypeStage.FormShow(Sender: TObject);
begin
  if FormStyle = fsMDIChild then  SelectButton.Visible:=ivNever;
end;

procedure TfrmIniTypeStage.GridDBViewDblClick(Sender: TObject);
begin
if FormStyle = fsNormal then SelectButtonClick(Sender)
else  EditButtonClick(Sender);
end;

procedure TfrmIniTypeStage.AddButtonClick(Sender: TObject);
var
  ViewForm : TfrmIniTypeStage_AE;
  New_id_Locator : int64;
  i:Integer;
begin
  if not Is_Admin then
  if CheckPermission('/ROOT/Contracts/Cn_Sp','Edit') <> 0
   then
    begin
     messagebox(handle,
     pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
     +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
     pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
     exit;
    end;

  ViewForm:= TfrmIniTypeStage_AE.Create(Self, PLanguageIndex);
  ViewForm.Caption := cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
  if ViewForm.ShowModal = mrOk then
   begin
    with DM.StProc do
     try
      Transaction.StartTransaction;
      StoredProcName := 'CN_INI_TYPE_STAGE_INSERT';
      Prepare;
      ParamByName('NAME_STAGE').AsString       := ViewForm.NameStage_Edit.Text;
      ParamByName('CNT_PART').AsInteger        := ViewForm.kol_parts_Edit.EditValue;
      ExecProc;
      New_id_Locator:=ParamByName('ID_TYPE_STAGE').AsInt64;

      ViewForm.MemoryData.First;
      For i:=1 to ViewForm.MemoryData.RecordCount do
       Begin
        StoredProcName := 'CN_INI_TYPE_STAGE_MONTH_INSERT';
        Prepare;
        ParamByName('ID_TYPE_STAGE').AsInt64  := New_id_Locator;
        ParamByName('KOL_MONTH').AsInteger    := ViewForm.MemoryData['mrMonth'];
        ParamByName('PART').AsInteger         := ViewForm.MemoryData['mrID'];
        ExecProc;
        ViewForm.MemoryData.Next;
       End;

      Transaction.Commit;
     except
      on E:Exception do
       begin
        cnShowMessage('Error',e.Message,mtError,[mbOK]);
        Transaction.Rollback;
       end;
     end;
    DM.DataSet.CloseOpen(True);
    DM.DataSet.Locate('ID_TYPE_STAGE',New_id_Locator,[] );
   end;
end;

procedure TfrmIniTypeStage.DeleteButtonClick(Sender: TObject);
 var
  i : byte;
 id : Int64;
begin
   if not Is_Admin then
   if CheckPermission('/ROOT/Contracts/Cn_Sp','Edit') <> 0
    then
     begin
      messagebox(handle,
      pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
      +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
      pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     end;

  //if the grid is empty then exit
  If GridDBView.DataController.RecordCount = 0 then Exit;

  //check the dependence of the treaties
  DM.ReadDataSet.Close;
  DM.ReadDataSet.SQLs.SelectSQL.Text := 'select * from cn_dt_payer_stage p where p.id_type_stage = :id_type_stage and use_end = :use_end';
  DM.ReadDataSet.ParamByName('id_type_stage').AsInt64 := DM.DataSet['ID_TYPE_STAGE'];
  DM.ReadDataSet.ParamByName('Use_end').AsDate := StrToDate('01.01.3050');
  DM.ReadDataSet.Open;

  If not DM.ReadDataSet.IsEmpty then
   begin
    cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts_Messages.cn_NonDeleteDependet[PLanguageIndex], mtInformation, [mbYes]);
    Exit;
   end;

  i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts_Messages.cn_warning_Delete[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2))
   then exit
   else
    begin
     id:= DM.DataSet['ID_TYPE_STAGE'];
     with DM.StProc do
      try
       Transaction.StartTransaction;
       StoredProcName := 'CN_INI_TYPE_STAGE_DELETE';
       Prepare;
       ParamByName('ID_TYPE_STAGE').AsInt64       :=  id;
       ExecProc;
       Transaction.Commit;
      except
       on E:Exception do
        begin
         cnShowMessage('Error',e.Message,mtError,[mbOK]);
         Transaction.Rollback;
        end;
      end;
     DM.DataSet.CloseOpen(True);
     Dm.DataSet.LocateNext('ID_TYPE_STAGE',id,[] );
    end;
end;

procedure TfrmIniTypeStage.EditButtonClick(Sender: TObject);
var
  ViewForm : TfrmIniTypeStage_AE;
  id_Locator : Int64;
  i:Integer;
  year, month, day : Word;
  Now_date : TDate;
begin
  if not Is_Admin then
  if CheckPermission('/ROOT/Contracts/Cn_Sp','Edit') <> 0 then
   begin
    messagebox(handle,
    pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
    +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
    pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
    exit;
   end;

  ViewForm:= TfrmIniTypeStage_AE.Create(Self, PLanguageIndex);

  id_Locator:=  DM.DataSet['ID_TYPE_STAGE'];

  ViewForm.Caption := cnConsts.cn_EditBtn_Caption[PLanguageIndex];
  ViewForm.NameStage_Edit.Text:=  DM.DataSet['NAME_STAGE'];
  If DM.DataSet['CNT_PART']<>null then ViewForm.kol_parts_Edit.Text:=DM.DataSet['CNT_PART'];

  viewForm.get_parts(id_Locator);

  if ViewForm.ShowModal = mrOk then
   begin
    with DM.StProc do
     try
      Transaction.StartTransaction;
      StoredProcName := 'CN_INI_TYPE_STAGE_UPDATE';
      Prepare;
      ParamByName('ID_TYPE_STAGE').AsInt64     := DM.DataSet['ID_TYPE_STAGE'];
      ParamByName('NAME_STAGE').AsString       := ViewForm.NameStage_Edit.Text;
      ParamByName('CNT_PART').AsInteger        := ViewForm.kol_parts_Edit.EditValue;
      ExecProc;

      StoredProcName := 'CN_INI_TERM_STAGE_DELETE';
      Prepare;
      ParamByName('ID_TYPE_STAGE').AsInt64     := DM.DataSet['ID_TYPE_STAGE'];
      ExecProc;

      ViewForm.MemoryData.First;
      For i:=1 to ViewForm.MemoryData.RecordCount do
       Begin
        StoredProcName := 'CN_INI_TYPE_STAGE_MONTH_INSERT';
        Prepare;
        ParamByName('ID_TYPE_STAGE').AsInt64 := DM.DataSet['ID_TYPE_STAGE'];
        ParamByName('kol_month').AsInteger   := ViewForm.MemoryData['mrMonth'];
        ParamByName('part').AsInteger      := ViewForm.MemoryData['mrID'];
        ExecProc;
        ViewForm.MemoryData.Next;
       End;

      Transaction.Commit;
     except
      on E:Exception do
       begin
        cnShowMessage('Error',e.Message,mtError,[mbOK]);
        Transaction.Rollback;
       end;
     end;
    DM.DataSet.CloseOpen(True);
    DM.DataSet.Locate('ID_TYPE_STAGE', id_Locator ,[] );
   end;
end;

procedure TfrmIniTypeStage.RefreshButtonClick(Sender: TObject);
begin
  Refresh_Grid;
end;

procedure TfrmIniTypeStage.AddPopClick(Sender: TObject);
begin
AddButtonClick(Sender);
end;

procedure TfrmIniTypeStage.EditPopClick(Sender: TObject);
begin
EditButtonClick(Sender);
end;

procedure TfrmIniTypeStage.DeletePopClick(Sender: TObject);
begin
DeleteButtonClick(Sender);
end;

procedure TfrmIniTypeStage.RefreshPopClick(Sender: TObject);
begin
RefreshButtonClick(Sender);
end;

procedure TfrmIniTypeStage.ExitPopClick(Sender: TObject);
begin
ExitButtonClick(Sender);
end;

procedure TfrmIniTypeStage.DateOlpButtonClick(Sender: TObject);
var ViewForm: TfrmDateOpl;
begin
 ViewForm:= TfrmDateOpl.Create(self, DM.DB.Handle, Dm.DataSet['ID_TYPE_STAGE']);
 ViewForm.ShowModal;

end;

end.
