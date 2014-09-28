//******************************************************************************
// Проект "BillingSystem"
// Справочник льгот
//
// последние изменения Перчак А 22/07/2011
//******************************************************************************

unit uLgots_main;

interface

uses
  Windows, Variants, SysUtils, Forms, uCommon_Funcs, uConsts, uLgots_DM,
  uLgots_AE, uCommon_Messages, uConsts_Messages, uCommon_Types, AccMGMT,
  Dialogs, uLgot_Sum_AE, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxCheckBox, cxCalendar,
  Placemnt, Menus, cxGridTableView, ImgList, Controls, dxBar, dxBarExtItems,
  cxGridLevel, cxGridCustomTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxGroupBox, Classes, dxStatusBar,
  cxTL, cxMaskEdit, cxInplaceContainer, cxDBTL, cxTLData;
  
type
  TfrmLgots_Main = class(TForm)
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
    SelectButton: TdxBarLargeButton;
    PopupMenu1: TPopupMenu;
    AddPop: TMenuItem;
    EditPop: TMenuItem;
    DeletePop: TMenuItem;
    RefreshPop: TMenuItem;
    ExitPop: TMenuItem;
    bsFormStorage: TFormStorage;
    Box_lgot: TcxGroupBox;
    Box_sum: TcxGroupBox;
    Grid_sum: TcxGrid;
    GridDBView_sum: TcxGridDBTableView;
    Colum_date_beg: TcxGridDBColumn;
    Colum_date_end: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    BarDockControl_lgot: TdxBarDockControl;
    BarDockControl_sum: TdxBarDockControl;
    Colum_Sum: TcxGridDBColumn;
    Button_Add_sum: TdxBarLargeButton;
    Button_Edit_sum: TdxBarLargeButton;
    Button_del_sum: TdxBarLargeButton;
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
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    cxStyle47: TcxStyle;
    cxStyle48: TcxStyle;
    cxStyle49: TcxStyle;
    cxStyle50: TcxStyle;
    cxStyle51: TcxStyle;
    cxStyle52: TcxStyle;
    cxStyle53: TcxStyle;
    cxStyle54: TcxStyle;
    cxStyle55: TcxStyle;
    cxStyle56: TcxStyle;
    cxStyle57: TcxStyle;
    testColorStyle: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    TreeList_lgots: TcxDBTreeList;
    TreeList_lgots_name: TcxDBTreeListColumn;
    TreeList_lgots_is_delete: TcxDBTreeListColumn;
    BarPopupMenu_add_lgot: TdxBarPopupMenu;
    BarButton_add_lgot: TdxBarButton;
    BarButton_add_lgot_parent: TdxBarButton;
    TreeList_lgots_shifr: TcxDBTreeListColumn;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelectButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure AddPopClick(Sender: TObject);
    procedure EditPopClick(Sender: TObject);
    procedure DeletePopClick(Sender: TObject);
    procedure RefreshPopClick(Sender: TObject);
    procedure ExitPopClick(Sender: TObject);
    procedure Refresh_Sum;
    procedure Button_Add_sumClick(Sender: TObject);
    procedure Button_Edit_sumClick(Sender: TObject);
    procedure Button_del_sumClick(Sender: TObject);
    procedure BarButton_add_lgot_parentClick(Sender: TObject);
    procedure TreeList_lgotsDblClick(Sender: TObject);
    procedure TreeList_lgotsChange(Sender: TObject);
    procedure GridDBView_sumDblClick(Sender: TObject);
  private
    PLanguageIndex: byte;
    DM : TLgots_DM;
    aShortCut : TbsShortCut;
    procedure FormIniLanguage;
  public
    res : Variant;
    is_Admin, Belong : Boolean;
    ID_LGOT : Int64;
    constructor  Create(AParameter:TbsSimpleParams);reintroduce;
  end;


implementation

uses cxCurrencyEdit, FIBQuery;

{$R *.dfm}

constructor TfrmLgots_Main.Create(AParameter:TbsSimpleParams);
begin
   Screen.Cursor:=crHourGlass;
   inherited Create(AParameter.Owner);

   is_Admin := AParameter.is_Admin;

   DM := TLgots_DM.Create(Self);

   DM.DB.Handle := AParameter.Db_Handle;
   DM.DB.Connected := True;
   DM.ReadTransaction.StartTransaction;
   TreeList_lgots.DataController.DataSource := DM.DataSource;
   GridDBView_sum.DataController.DataSource := DM.DataSource_Read;

   Belong := True;
   if not is_Admin then
   if fibCheckPermission('/ROOT/BillingSystem/BS_Sprav/BS_Lgots','Belong') <> 0
    then
     begin
      messagebox(handle,
      pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
      +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
      pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      Belong := False;
     End; 

   DM.DataSet.Close;
   DM.DataSet.SQLs.SelectSQL.Text := 'select * from BS_SP_LGOT_SEL';
   if Belong then DM.DataSet.Open;

   if AParameter.ID_Locate <> 0
    then DM.DataSet.Locate('ID_LGOT', AParameter.ID_Locate, [] );

   Refresh_Sum;

   if AParameter.ID_Locate_1 <> 0
    then DM.ReadDataSet.Locate('ID_LGOT_SUM', AParameter.ID_Locate_1, [] );
    
   FormIniLanguage();
   Screen.Cursor := crDefault;
   bsFormStorage.RestoreFormPlacement;
end;

procedure TfrmLgots_Main.FormIniLanguage;
begin
  PLanguageIndex := uCommon_Funcs.bsLanguageIndex();

  //кэпшн формы
  Caption := uConsts.bs_MAIN_LGOT[PLanguageIndex];

  //названия кнопок добавления льгот
  AddButton.Caption     := uConsts.bs_InsertBtn_Caption[PLanguageIndex];
  EditButton.Caption    := uConsts.bs_EditBtn_Caption[PLanguageIndex];
  DeleteButton.Caption  := uConsts.bs_DeleteBtn_Caption[PLanguageIndex];
  RefreshButton.Caption := uConsts.bs_RefreshBtn_Caption[PLanguageIndex];
  SelectButton.Caption  := uConsts.bs_SelectBtn_Caption[PLanguageIndex];
  ExitButton.Caption    := uConsts.bs_ExitBtn_Caption[PLanguageIndex];

  //названия кнопок добавления сумм
  Button_Add_sum.Caption  := uConsts.bs_InsertBtn_Caption[PLanguageIndex];
  Button_Edit_sum.Caption := uConsts.bs_EditBtn_Caption[PLanguageIndex];
  Button_del_sum.Caption  := uConsts.bs_DeleteBtn_Caption[PLanguageIndex];

  // попап
  AddPop.Caption     := uConsts.bs_InsertBtn_Caption[PLanguageIndex];
  EditPop.Caption    := uConsts.bs_EditBtn_Caption[PLanguageIndex];
  DeletePop.Caption  := uConsts.bs_DeleteBtn_Caption[PLanguageIndex];
  RefreshPop.Caption := uConsts.bs_RefreshBtn_Caption[PLanguageIndex];
  ExitPop.Caption    := uConsts.bs_ExitBtn_Caption[PLanguageIndex];

  //грид
  TreeList_lgots_shifr.Caption.Text     := uConsts.bs_roles_Kod[PLanguageIndex];
  TreeList_lgots_name.Caption.Text      := uConsts.bs_Name_Column[PLanguageIndex];
  TreeList_lgots_is_delete.Caption.Text := uConsts.bs_is_deleted_Column[PLanguageIndex];

  Colum_date_beg.Caption := uConsts.bs_Date_Beg_Label[PLanguageIndex];
  Colum_date_end.Caption := uConsts.bs_Date_End_Label[PLanguageIndex];
  Colum_Sum.Caption      := uConsts.bs_Persent_Column[PLanguageIndex];

  
  //Статусбар
  StatusBar.Panels[0].Text := uConsts.bs_InsertBtn_ShortCut[PLanguageIndex]  + uConsts.bs_InsertBtn_Caption[PLanguageIndex];
  StatusBar.Panels[1].Text := uConsts.bs_EditBtn_ShortCut[PLanguageIndex]    + uConsts.bs_EditBtn_Caption[PLanguageIndex];
  StatusBar.Panels[2].Text := uConsts.bs_DeleteBtn_ShortCut[PLanguageIndex]  + uConsts.bs_DeleteBtn_Caption[PLanguageIndex];
  StatusBar.Panels[3].Text := uConsts.bs_RefreshBtn_ShortCut[PLanguageIndex] + uConsts.bs_RefreshBtn_Caption[PLanguageIndex];
  StatusBar.Panels[4].Text := uConsts.bs_EnterBtn_ShortCut[PLanguageIndex]   + uConsts.bs_SelectBtn_Caption[PLanguageIndex];
  StatusBar.Panels[5].Text := uConsts.bs_ExitBtn_ShortCut[PLanguageIndex]    + uConsts.bs_ExitBtn_Caption[PLanguageIndex];

  //Бокс
  Box_lgot.Caption := uConsts.bs_Name_Column[PLanguageIndex];
  Box_sum.Caption  := uConsts.bs_Persent_Column[PLanguageIndex];

  aShortCut := LoadShortCut(DM.DB.Handle, self);

  AddButton.ShortCut     := aShortCut.Add;
  EditButton.ShortCut    := aShortCut.Edit;
  DeleteButton.ShortCut  := aShortCut.Del;
  RefreshButton.ShortCut := aShortCut.Refresh;
end;

procedure TfrmLgots_Main.ExitButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmLgots_Main.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  bsFormStorage.SaveFormPlacement;
  if FormStyle = fsMDIChild
   then action:=caFree
   else DM.Free;
end;

procedure TfrmLgots_Main.SelectButtonClick(Sender: TObject);
var
  id_lgot: int64;
begin
  if TreeList_lgots.DataController.RecordCount = 0 then exit;
  if GridDBView_sum.DataController.RecordCount = 0 then exit;

  Res := VarArrayCreate([0,5],varVariant);

  id_lgot := DM.DataSet['ID_LGOT'];
  Res[0]  := id_lgot;
  Res[1]  := DM.DataSet['NAME_LGOT'];
  Res[2]  := DM.ReadDataSet['ID_LGOT_SUM'];
  Res[3]  := DM.ReadDataSet['DATE_BEG'];
  Res[4]  := DM.ReadDataSet['DATE_END'];
  Res[5]  := DM.ReadDataSet['PROCENT'];

  ModalResult := mrOk;
end;

procedure TfrmLgots_Main.FormShow(Sender: TObject);
begin
  if FormStyle = fsMDIChild then  SelectButton.Visible := ivNever;
end;

procedure TfrmLgots_Main.AddButtonClick(Sender: TObject);
var
  ViewForm : TfrmLgots_AE;
begin
  if not is_Admin then
   if fibCheckPermission('/ROOT/BillingSystem/BS_Sprav/BS_Lgots','Add') <> 0
    then
     begin
      messagebox(handle,
      pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
      +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
      pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     end;

  ViewForm := TfrmLgots_AE.Create(Self, PLanguageIndex);

  ViewForm.Caption := uConsts.bs_InsertBtn_Caption[PLanguageIndex];
  ViewForm.CheckBox_delet.Enabled := False;

  if ViewForm.ShowModal = mrOk then
   begin
     with DM.StProc do
      Begin
       Transaction.StartTransaction;
       StoredProcName := 'BS_SP_LGOT_INS';
       Prepare;
       ParamByName('NAME_LGOT').AsString := ViewForm.Name_Edit.Text;
       ParamByName('KOD_LGOT').AsString  := ViewForm.TextEdit_lgot_kod.Text;
       ExecProc;
       Id_Lgot := FieldByName('ID_LGOT').AsInt64;
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
      End;
     RefreshButtonClick(self);
   end;
end;

procedure TfrmLgots_Main.EditButtonClick(Sender: TObject);
var
  ViewForm : TfrmLgots_AE;
begin
  if not is_Admin then
   if fibCheckPermission('/ROOT/BillingSystem/BS_Sprav/BS_Lgots','Edit') <> 0
    then
     begin
      messagebox(handle,
      pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
      +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
      pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     end;

  If TreeList_lgots.DataController.RecordCount = 0 then Exit;

  ViewForm := TfrmLgots_AE.Create(Self, PLanguageIndex);

  ViewForm.Caption                := uConsts.bs_EditBtn_Caption[PLanguageIndex];
  ViewForm.Name_Edit.Text         := DM.DataSet['NAME_LGOT'];
  ViewForm.TextEdit_lgot_kod.Text := DM.DataSet['SHIFR_LGOT'];
  if DM.DataSet['IS_DELETED'] = 0
   then ViewForm.CheckBox_delet.Checked := False
   else ViewForm.CheckBox_delet.Checked := True;

  if ViewForm.ShowModal = mrOk then
   begin
     with DM.StProc do
      Begin
       Transaction.StartTransaction;
       StoredProcName := 'BS_SP_LGOT_UPD';
       Prepare;
       ParamByName('ID_LGOT').AsInt64    := DM.DataSet['ID_LGOT'];
       ParamByName('NAME_LGOT').AsString := ViewForm.Name_Edit.Text;
       ParamByName('KOD_LGOT').AsString  := ViewForm.TextEdit_lgot_kod.Text;
       if ViewForm.CheckBox_delet.Checked
        then ParamByName('IS_DELETED').Asinteger := 1
        else ParamByName('IS_DELETED').Asinteger := 0;
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

procedure TfrmLgots_Main.DeleteButtonClick(Sender: TObject);
var
  i: byte;
begin
  if not is_Admin then
   if fibCheckPermission('/ROOT/BillingSystem/BS_Sprav/BS_Lgots','Del') <> 0
    then
     begin
      messagebox(handle,
      pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
      +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
      pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     end;

  If TreeList_lgots.DataController.RecordCount = 0 then Exit;

  i:= uCommon_Messages.bsShowMessage(uConsts.bs_Confirmation_Caption[PLanguageIndex], uConsts_Messages.bs_warning_Delete[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit;

   with DM.StProc do
    Begin
     Transaction.StartTransaction;
     StoredProcName := 'BS_SP_LGOT_DEL';
     Prepare;
     ParamByName('ID_LGOT').AsInt64 :=  DM.DataSet['ID_LGOT'];
     ExecProc;
     Transaction.Commit;
     try
      except
      on E:Exception do
       begin
        bsShowMessage('Error',e.Message,mtError,[mbOK]);
        Transaction.Rollback;
        raise;
       end;
     end;
    End;
  RefreshButtonClick(self);
end;

procedure TfrmLgots_Main.RefreshButtonClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;

  DM.DataSet.Close;
  if Belong then
   begin
    DM.DataSet.Open;
    DM.DataSet.Locate('ID_LGOT', ID_lgot, [] );
   End;

  Refresh_sum;

  Screen.Cursor := crDefault;
end;

procedure TfrmLgots_Main.AddPopClick(Sender: TObject);
begin
  AddButtonClick(Sender);
end;

procedure TfrmLgots_Main.EditPopClick(Sender: TObject);
begin
  EditButtonClick(Sender);
end;

procedure TfrmLgots_Main.DeletePopClick(Sender: TObject);
begin
  DeleteButtonClick(Sender);
end;

procedure TfrmLgots_Main.RefreshPopClick(Sender: TObject);
begin
  RefreshButtonClick(Sender);
end;

procedure TfrmLgots_Main.ExitPopClick(Sender: TObject);
begin
  ExitButtonClick(Sender);
end;

Procedure TfrmLgots_Main.Refresh_Sum;
Begin
  If DM.DataSet.RecordCount = 0 then Exit;

  DM.ReadDataSet.Close;
  DM.ReadDataSet.SQLs.SelectSQL.Text := 'Select * from BS_DT_LGOT_SUM_SEL(:ID_LGOT)';
  DM.ReadDataSet.ParamByName('ID_LGOT').AsInt64 := DM.DataSet['ID_LGOT'];
  DM.ReadDataSet.Open;
end;
  
procedure TfrmLgots_Main.Button_Add_sumClick(Sender: TObject);
var
  ViewForm : TfrmLgot_Sum_AE;
begin
  If not is_Admin then
   if fibCheckPermission('/ROOT/BillingSystem/BS_Sprav/BS_Lgots','Add') <> 0
    then
     begin
      messagebox(handle,
      pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
      +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
      pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     end;
   
  ViewForm := TfrmLgot_Sum_AE.Create(Self);

  ViewForm.Caption        := uConsts.bs_InsertBtn_Caption[PLanguageIndex];
  ViewForm.PLanguageIndex := PLanguageIndex;

  if ViewForm.ShowModal = mrOk then
   begin
     with DM.StProc do
      Begin
       Transaction.StartTransaction;
       StoredProcName := 'BS_DT_LGOT_SUM_INS';
       Prepare;
       ParamByName('ID_LGOT').AsInt64 := DM.DataSet['ID_LGOT'];
       ParamByName('Date_beg').AsDate := ViewForm.DateEdit_Date_beg.EditValue;
       ParamByName('procent').AsFloat := ViewForm.CurrencyEdit_Procent.EditValue;
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
      End;
     Refresh_Sum;
   end;
end;

procedure TfrmLgots_Main.Button_Edit_sumClick(Sender: TObject);
var
  ViewForm : TfrmLgot_Sum_AE;
begin
  if not is_Admin then
   if fibCheckPermission('/ROOT/BillingSystem/BS_Sprav/BS_Lgots','Edit') <> 0
    then
     begin
      messagebox(handle,
      pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
      +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
      pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     end;
   
  If GridDBView_sum.DataController.RecordCount = 0 then Exit;

  if DM.ReadDataSet['DATE_END'] <> StrToDate('31.12.9999') then
   begin
    ShowMessage('Данную запись невозможно измененить!!!');
    Exit;
   end;

  ViewForm := TfrmLgot_Sum_AE.Create(Self);

  ViewForm.PLanguageIndex                 := PLanguageIndex;
  ViewForm.Caption                        := uConsts.bs_EditBtn_Caption[PLanguageIndex];
  ViewForm.DateEdit_Date_beg.EditValue    :=  DM.ReadDataSet['Date_beg'];
  ViewForm.CurrencyEdit_Procent.EditValue :=  DM.ReadDataSet['Procent'];

  if ViewForm.ShowModal = mrOk then
   begin
     with DM.StProc do
      Begin
       Transaction.StartTransaction;
       StoredProcName := 'BS_DT_LGOT_SUM_UPD';
       Prepare;
       ParamByName('ID_LGOT_SUM').AsInt64       := DM.ReadDataSet['ID_LGOT_SUM'];
       ParamByName('Date_beg').AsDate           := ViewForm.DateEdit_Date_beg.EditValue;
       ParamByName('procent').AsFloat           := ViewForm.CurrencyEdit_Procent.EditValue;
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
      Refresh_Sum;
   end;
end;

procedure TfrmLgots_Main.Button_del_sumClick(Sender: TObject);
var
  i: byte;
begin
  if not is_Admin then
   if fibCheckPermission('/ROOT/BillingSystem/BS_Sprav/BS_Lgots','Del') <> 0
    then
     begin
      messagebox(handle,
      pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
      +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
      pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     end;

  If GridDBView_sum.DataController.RecordCount = 0 then Exit;

  if DM.ReadDataSet['DATE_END'] <> StrToDate('31.12.9999') then
   begin
    ShowMessage('Данную запись невозможно удалить!!!');
    Exit;
   end;

  i:= uCommon_Messages.bsShowMessage(uConsts.bs_Confirmation_Caption[PLanguageIndex], uConsts_Messages.bs_warning_Delete[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit;

   with DM.StProc do
    Begin
     Transaction.StartTransaction;
     StoredProcName := 'BS_DT_LGOT_SUM_DEL';
     Prepare;
     ParamByName('ID_LGOT_SUM').AsInt64 :=  DM.ReadDataSet['ID_LGOT_SUM'];
     ExecProc;
     Transaction.Commit;
     try
      except
      on E:Exception do
       begin
        bsShowMessage('Error',e.Message,mtError,[mbOK]);
        Transaction.Rollback;
        raise;
       end;
     end;
    End;
  Refresh_Sum;
end;

procedure TfrmLgots_Main.BarButton_add_lgot_parentClick(Sender: TObject);
var
  ViewForm : TfrmLgots_AE;

begin
  if not is_Admin then
   if fibCheckPermission('/ROOT/BillingSystem/BS_Sprav/BS_Lgots','Add') <> 0
    then
     begin
      messagebox(handle,
      pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
      +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
      pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     end;

  ViewForm := TfrmLgots_AE.Create(Self, PLanguageIndex);

  ViewForm.Caption := uConsts.bs_InsertBtn_Caption[PLanguageIndex];
  if DM.DataSet['Name_lgot'] <> null then
   ViewForm.Caption := ViewForm.Caption + ' в ' + DM.DataSet['Name_lgot'];
  ViewForm.CheckBox_delet.Enabled := False;
  

  if ViewForm.ShowModal = mrOk then
   begin
     with DM.StProc do
      Begin
       Transaction.StartTransaction;
       StoredProcName := 'BS_SP_LGOT_INS';
       Prepare;
       ParamByName('NAME_LGOT').AsString     := ViewForm.Name_Edit.Text;
       ParamByName('KOD_LGOT').AsString      := ViewForm.TextEdit_lgot_kod.Text;
       ParamByName('ID_LGOT_PARENT').AsInt64 := DM.DataSet['id_lgot_parent'];
       ExecProc;
       Id_Lgot := FieldByName('ID_LGOT').AsInt64;
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
      End;
     RefreshButtonClick(self);
   end;
end;

procedure TfrmLgots_Main.TreeList_lgotsDblClick(Sender: TObject);
begin
  if FormStyle <> fsNormal then SelectButtonClick(self);
end;

procedure TfrmLgots_Main.TreeList_lgotsChange(Sender: TObject);
begin
  Refresh_Sum;
end;

procedure TfrmLgots_Main.GridDBView_sumDblClick(Sender: TObject);
begin
  if SelectButton.Visible = ivAlways then SelectButtonClick(self); 
end;

end.
