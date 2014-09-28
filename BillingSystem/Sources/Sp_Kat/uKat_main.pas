//******************************************************************************
// Проект ""
// Справочник категорий
//
// последние изменения
//******************************************************************************

unit uKat_main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ImgList, cxGraphics, cxContainer, cxEdit,
  cxProgressBar, dxStatusBar, cxControls, IBase,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxClasses, cxTextEdit,
  uCommon_Funcs, uConsts, uKat_DM, uKat_AE, uCommon_Messages, uConsts_Messages,
  Menus, uCommon_Types, Placemnt, cxCheckBox, AccMGMT, cxGroupBox,
  cxSplitter, cxCalendar, uKat_sum_AE;

type
  TfrmKat_Main = class(TForm)
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
    AddPop: TMenuItem;
    EditPop: TMenuItem;
    DeletePop: TMenuItem;
    RefreshPop: TMenuItem;
    ExitPop: TMenuItem;
    bsFormStorage: TFormStorage;
    box_kat: TcxGroupBox;
    Grid: TcxGrid;
    GridDBView: TcxGridDBTableView;
    name: TcxGridDBColumn;
    is_deleted: TcxGridDBColumn;
    GridLevel: TcxGridLevel;
    Box_sum: TcxGroupBox;
    Grid_kat_sum: TcxGrid;
    Grid_kat_sumDBView: TcxGridDBTableView;
    Colum_date_beg: TcxGridDBColumn;
    Colum_date_end: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    SelectButton: TdxBarLargeButton;
    DockControl_Name: TdxBarDockControl;
    DockControl_Price: TdxBarDockControl;
    Button_kat_sum_edit: TdxBarLargeButton;
    Button_kat_sum_del: TdxBarLargeButton;
    Button_kat_sum_add: TdxBarLargeButton;
    Colum_sum: TcxGridDBColumn;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelectButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridDBViewDblClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure AddPopClick(Sender: TObject);
    procedure EditPopClick(Sender: TObject);
    procedure DeletePopClick(Sender: TObject);
    procedure RefreshPopClick(Sender: TObject);
    procedure ExitPopClick(Sender: TObject);
    procedure GridDBViewCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure refresh_sum;
    procedure Button_kat_sum_addClick(Sender: TObject);
    procedure Button_kat_sum_editClick(Sender: TObject);
    procedure Button_kat_sum_delClick(Sender: TObject);
  private
    PLanguageIndex: byte;
    DM : TKat_DM;
    procedure FormIniLanguage;
  public
    res:Variant;
    Is_admin:Boolean;
    Use_end : TDate;
    constructor  Create(AParameter:TbsSimpleParams);reintroduce;
  end;


implementation

uses cxCurrencyEdit;

{$R *.dfm}

constructor TfrmKat_Main.Create(AParameter:TbsSimpleParams);
begin
   Screen.Cursor:=crHourGlass;
   inherited Create(AParameter.Owner);

   DM:=TKat_DM.Create(Self);
   DM.DB.Handle := AParameter.Db_Handle;
   DM.DB.Connected := True;
   DM.ReadTransaction.StartTransaction;

   DM.ReadDataSet.Close;
   DM.ReadDataSet.SQLs.SelectSQL.Text := 'select * from bs_PUB_SYS_DATA_GET_ALL';
   DM.ReadDataSet.Open;
   Use_end := DM.ReadDataSet['bs_max_sys_timestamp'];
   DM.ReadDataSet.Close;

   DM.DataSet.Close;
   DM.DataSet.SQLs.SelectSQL.Text := 'select * from bs_sp_kat';
   DM.DataSet.Open;

   if AParameter.ID_Locate <> 0
    then DM.DataSet.Locate('ID_KAT', AParameter.ID_Locate, [] );

   refresh_sum;

   if ((AParameter.ID_Locate_1 <> 0) and (DM.ReadDataSet.RecordCount<>0))
    then DM.ReadDataSet.Locate('ID_KAT_SUM', AParameter.ID_Locate_1, [] );

   FormIniLanguage();
   Screen.Cursor:=crDefault;
   bsFormStorage.RestoreFormPlacement;
end;

procedure TfrmKat_Main.FormIniLanguage;
begin
 PLanguageIndex:=               uCommon_Funcs.bsLanguageIndex();

 //кэпшн формы
 Caption:=                      uConsts.bs_Main_KAT[PLanguageIndex];

  //названия кнопок
  AddButton.Caption :=           uConsts.bs_InsertBtn_Caption[PLanguageIndex];
  EditButton.Caption :=          uConsts.bs_EditBtn_Caption[PLanguageIndex];
  DeleteButton.Caption :=        uConsts.bs_DeleteBtn_Caption[PLanguageIndex];
  RefreshButton.Caption :=       uConsts.bs_RefreshBtn_Caption[PLanguageIndex];
  SelectButton.Caption :=        uConsts.bs_SelectBtn_Caption[PLanguageIndex];
  ExitButton.Caption :=          uConsts.bs_ExitBtn_Caption[PLanguageIndex];

  Button_kat_sum_add.Caption :=           uConsts.bs_InsertBtn_Caption[PLanguageIndex];
  Button_kat_sum_edit.Caption :=          uConsts.bs_EditBtn_Caption[PLanguageIndex];
  Button_kat_sum_del.Caption :=        uConsts.bs_DeleteBtn_Caption[PLanguageIndex];


 // попап
 AddPop.Caption :=           uConsts.bs_InsertBtn_Caption[PLanguageIndex];
 EditPop.Caption :=          uConsts.bs_EditBtn_Caption[PLanguageIndex];
 DeletePop.Caption :=        uConsts.bs_DeleteBtn_Caption[PLanguageIndex];
 RefreshPop.Caption :=       uConsts.bs_RefreshBtn_Caption[PLanguageIndex];
 ExitPop.Caption :=          uConsts.bs_ExitBtn_Caption[PLanguageIndex];

  //грид
  name.Caption:=            uConsts.bs_Name_Column[PLanguageIndex];
  is_deleted.Caption     := uConsts.bs_is_deleted_Column[PLanguageIndex];
  Colum_date_beg.Caption := uConsts.bs_Date_Beg_Label[PLanguageIndex];
  Colum_date_end.Caption := uConsts.bs_Date_End_Label[PLanguageIndex];
  Colum_Sum.Caption      := uConsts.bs_Summa_Column[PLanguageIndex];

  //статусбар
  StatusBar.Panels[0].Text :=  uConsts.bs_InsertBtn_ShortCut[PLanguageIndex]  + uConsts.bs_InsertBtn_Caption[PLanguageIndex];
  StatusBar.Panels[1].Text :=  uConsts.bs_EditBtn_ShortCut[PLanguageIndex]    + uConsts.bs_EditBtn_Caption[PLanguageIndex];
  StatusBar.Panels[2].Text :=  uConsts.bs_DeleteBtn_ShortCut[PLanguageIndex]  + uConsts.bs_DeleteBtn_Caption[PLanguageIndex];
  StatusBar.Panels[3].Text :=  uConsts.bs_RefreshBtn_ShortCut[PLanguageIndex] + uConsts.bs_RefreshBtn_Caption[PLanguageIndex];
  StatusBar.Panels[4].Text :=  uConsts.bs_EnterBtn_ShortCut[PLanguageIndex]   + uConsts.bs_SelectBtn_Caption[PLanguageIndex];
  StatusBar.Panels[5].Text :=  uConsts.bs_ExitBtn_ShortCut[PLanguageIndex]    + uConsts.bs_ExitBtn_Caption[PLanguageIndex];

  //Бокс
  Box_Kat.Caption  := uConsts.bs_Name_Column[PLanguageIndex];
  Box_sum.Caption  := uConsts.bs_Summa_Column[PLanguageIndex];
end;

procedure TfrmKat_Main.ExitButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmKat_Main.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  bsFormStorage.SaveFormPlacement;
  if FormStyle = fsMDIChild
   then action:=caFree
   else DM.Free;
end;

procedure TfrmKat_Main.SelectButtonClick(Sender: TObject);
var
  id_kat_sum : int64;
begin
  if GridDBView.DataController.RecordCount = 0 then exit;
  if Grid_kat_sumDBView.DataController.RecordCount = 0 then exit;

  Res := VarArrayCreate([0,5],varVariant);
  id_kat_sum  := DM.ReadDataSet['ID_KAT_SUM'];
  Res[0]      := id_kat_sum;
  Res[1]      := DM.ReadDataSet['DATE_BEG'];
  Res[2]      := DM.ReadDataSet['DATE_END'];
  Res[3]      := DM.ReadDataSet['SUMMA'];
  Res[4]      := DM.DataSet['NAME_KAT'];
  Res[5]      := DM.DataSet['ID_KAT'];
  ModalResult := mrOk;
end;

procedure TfrmKat_Main.FormShow(Sender: TObject);
begin
  if FormStyle = fsMDIChild then  SelectButton.Visible:=ivNever;
end;

procedure TfrmKat_Main.GridDBViewDblClick(Sender: TObject);
begin
  if FormStyle = fsNormal  then SelectButtonClick(Sender);
end;

procedure TfrmKat_Main.AddButtonClick(Sender: TObject);
var
  ViewForm : TfrmKat_AE;
begin
  if not Is_Admin then
   if fibCheckPermission('/ROOT/Contracts/Cn_Sp','Edit') <> 0
    then
     begin
      messagebox(handle,
      pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
      +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
      pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     end;

  ViewForm:= TfrmKat_AE.Create(Self, PLanguageIndex);
  ViewForm.Caption := uConsts.bs_InsertBtn_Caption[PLanguageIndex];
  if ViewForm.ShowModal = mrOk then
   begin
     with DM.StProc do
      Begin
       Transaction.StartTransaction;
       StoredProcName := 'bs_SP_KAT_INS';
       Prepare;
       ParamByName('NAME_KAT').AsString       := ViewForm.Name_Edit.Text;
       ExecProc;
       try
         Transaction.Commit;
        except
         on E:Exception do
          begin
           LogException;
           bsShowMessage('Error',e.Message,mtError,[mbOK]);
           Transaction.Rollback;
           raise;
          end;
       end;
      End;
     RefreshButtonClick(self);
   end;
end;

procedure TfrmKat_Main.EditButtonClick(Sender: TObject);
var
  ViewForm : TfrmKat_AE;
begin
 if not Is_Admin then
  if fibCheckPermission('/ROOT/Contracts/Cn_Sp','Edit') <> 0
   then
    begin
     messagebox(handle,
     pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
     +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
     pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
     exit;
    end;

  If GridDBView.DataController.RecordCount = 0 then Exit;
    
  ViewForm:= TfrmKat_AE.Create(Self, PLanguageIndex);
  ViewForm.Caption := uConsts.bs_EditBtn_Caption[PLanguageIndex];
  if DM.DataSet['NAME_KAT'] <> null
   then ViewForm.Name_Edit.Text:=  DM.DataSet['NAME_KAT'];

  if ViewForm.ShowModal = mrOk then
   begin
     with DM.StProc do
      Begin
       Transaction.StartTransaction;
       StoredProcName := 'bs_SP_KAT_UPD';
       Prepare;
       ParamByName('ID_KAT').AsInt64     := DM.DataSet['ID_KAT'];
       ParamByName('NAME_KAT').AsString           := ViewForm.Name_Edit.Text;
       ParamByName('IS_DELETED').Asinteger           := DM.DataSet['IS_DELETED'];
       ExecProc;
       try
        Transaction.Commit;
        except
         on E:Exception do
          begin
           LogException;
           bsShowMessage('Error',e.Message,mtError,[mbOK]);
           Transaction.Rollback;
          end;
       end;
      end; 
      RefreshButtonClick(self);
   end;
end;

procedure TfrmKat_Main.DeleteButtonClick(Sender: TObject);
var
  i: byte;
begin
   if not Is_Admin then
   if fibCheckPermission('/ROOT/Contracts/Cn_Sp','Edit') <> 0
    then
     begin
      messagebox(handle,
      pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
      +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
      pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     end;

  If GridDBView.DataController.RecordCount = 0 then Exit;

  i:= uCommon_Messages.bsShowMessage(uConsts.bs_Confirmation_Caption[PLanguageIndex], uConsts_Messages.bs_warning_Delete[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit;

   with DM.StProc do
    Begin
     Transaction.StartTransaction;
     StoredProcName := 'bs_SP_KAT_DEL';
     Prepare;
     ParamByName('ID_KAT').AsInt64       :=  DM.DataSet['ID_KAT'];
     ExecProc;
     Transaction.Commit;
     try
      except
      on E:Exception do
       begin
        LogException;
        bsShowMessage('Error',e.Message,mtError,[mbOK]);
        Transaction.Rollback;
       end;
     end;
    End;
  RefreshButtonClick(self);
end;

procedure TfrmKat_Main.RefreshButtonClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;

  DM.DataSet.Close;
  DM.DataSet.Open;

  Screen.Cursor := crDefault;
end;

procedure TfrmKat_Main.AddPopClick(Sender: TObject);
begin
  AddButtonClick(Sender);
end;

procedure TfrmKat_Main.EditPopClick(Sender: TObject);
begin
  EditButtonClick(Sender);
end;

procedure TfrmKat_Main.DeletePopClick(Sender: TObject);
begin
  DeleteButtonClick(Sender);
end;

procedure TfrmKat_Main.RefreshPopClick(Sender: TObject);
begin
  RefreshButtonClick(Sender);
end;

procedure TfrmKat_Main.ExitPopClick(Sender: TObject);
begin
  ExitButtonClick(Sender);
end;

procedure TfrmKat_Main.Refresh_sum;
Begin
  If DM.DataSet.RecordCount = 0 then Exit;

  DM.ReadDataSet.Close;
  DM.ReadDataSet.SQLs.SelectSQL.Text := 'Select * from bs_DT_KAT_SUM Where id_kat = :id_kat';
  DM.ReadDataSet.ParamByName('ID_KAT').AsInt64 := DM.DataSet['ID_KAT'];
  DM.ReadDataSet.Open;
end;

procedure TfrmKat_Main.GridDBViewCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  refresh_sum;
end;

procedure TfrmKat_Main.Button_kat_sum_addClick(Sender: TObject);
var
  ViewForm : TfrmKat_Sum_AE;
begin
  if not Is_Admin then
   if fibCheckPermission('/ROOT/Contracts/Cn_Sp','Edit') <> 0
    then
     begin
      messagebox(handle,
      pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
      +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
      pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     end;

  if DM.DataSet.RecordCount = 0 then Exit;  

  ViewForm:= TfrmKat_Sum_AE.Create(Self);
  ViewForm.Caption := uConsts.bs_InsertBtn_Caption[PLanguageIndex];
  ViewForm.PLanguageIndex := PLanguageIndex;
  ViewForm.Use_end := Use_end;

  If ViewForm.ShowModal = mrOk then
   begin
     with DM.StProc do
      Begin
       Transaction.StartTransaction;
       StoredProcName := 'bs_DT_KAT_SUM_INS';
       Prepare;
       ParamByName('ID_KAT').AsInt64  := DM.DataSet['ID_KAT'];
       ParamByName('SUMMA').AsFloat   := ViewForm.CurrencyEdit_Summa.EditValue;
       ParamByName('DATE_BEG').AsDate := ViewForm.DateEdit_Date_beg.EditValue;
       ParamByName('DATE_END').AsDate := ViewForm.DateEdit_Date_end.EditValue;
       ExecProc;
       try
         Transaction.Commit;
        except
         on E:Exception do
          begin
           LogException;
           bsShowMessage('Error',e.Message,mtError,[mbOK]);
           Transaction.Rollback;
           raise;
          end;
       end;
      End;
     refresh_sum;
   end;
end;

procedure TfrmKat_Main.Button_kat_sum_editClick(Sender: TObject);
var
  ViewForm : TfrmKat_sum_AE;
begin
 if not Is_Admin then
  if fibCheckPermission('/ROOT/Contracts/Cn_Sp','Edit') <> 0
   then
    begin
     messagebox(handle,
     pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
     +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
     pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
     exit;
    end;

  If Grid_kat_sumDBView.DataController.RecordCount = 0 then Exit;

  ViewForm:= TfrmKat_sum_AE.Create(Self);
  ViewForm.PLanguageIndex := PLanguageIndex;
  ViewForm.Caption := uConsts.bs_EditBtn_Caption[PLanguageIndex];
  if DM.ReadDataSet['DATE_BEG'] <> null
   then ViewForm.DateEdit_Date_beg.EditValue  :=  DM.ReadDataSet['DATE_BEG'];
  if DM.ReadDataSet['DATE_END'] <> null
   then ViewForm.DateEdit_Date_end.EditValue  :=  DM.ReadDataSet['DATE_END'];
  if DM.ReadDataSet['SUMMA'] <> null
   then ViewForm.CurrencyEdit_Summa.EditValue :=  DM.ReadDataSet['SUMMA'];

  if ViewForm.ShowModal = mrOk then
   begin
     with DM.StProc do
      Begin
       Transaction.StartTransaction;
       StoredProcName := 'bs_DT_KAT_SUM_UPD';
       Prepare;
       ParamByName('ID_KAT_SUM').AsInt64 := DM.ReadDataSet['ID_KAT_SUM'];
       ParamByName('DATE_BEG').AsDate    := ViewForm.DateEdit_Date_beg.EditValue;
       ParamByName('DATE_END').AsDate    := ViewForm.DateEdit_Date_end.EditValue;
       ParamByName('SUMMA').AsFloat      := ViewForm.CurrencyEdit_Summa.EditValue;
       ExecProc;
       try
        Transaction.Commit;
        except
         on E:Exception do
          begin
           LogException;
           bsShowMessage('Error',e.Message,mtError,[mbOK]);
           Transaction.Rollback;
          end;
       end;
      end; 
      Refresh_sum;
   end;
end;

procedure TfrmKat_Main.Button_kat_sum_delClick(Sender: TObject);
var
  i: byte;
begin
   if not Is_Admin then
   if fibCheckPermission('/ROOT/Contracts/Cn_Sp','Edit') <> 0
    then
     begin
      messagebox(handle,
      pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
      +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
      pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     end;

  If GridDBView.DataController.RecordCount = 0 then Exit;

  i:= uCommon_Messages.bsShowMessage(uConsts.bs_Confirmation_Caption[PLanguageIndex], uConsts_Messages.bs_warning_Delete[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit;

   with DM.StProc do
    Begin
     Transaction.StartTransaction;
     StoredProcName := 'bs_DT_KAT_SUM_DEL';
     Prepare;
     ParamByName('ID_KAT_SUM').AsInt64 :=  DM.ReadDataSet['ID_KAT_SUM'];
     ExecProc;
     Transaction.Commit;
     try
      except
      on E:Exception do
       begin
        LogException;
        bsShowMessage('Error',e.Message,mtError,[mbOK]);
        Transaction.Rollback;
       end;
     end;
    End;
  refresh_sum;
end;

end.
