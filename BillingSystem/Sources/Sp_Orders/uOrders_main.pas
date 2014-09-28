unit uOrders_main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ImgList, cxGraphics, cxContainer, cxEdit,
  cxProgressBar, dxStatusBar, cxControls, IBase, uOrders_DM, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxClasses, cxTextEdit, uCommon_Funcs, uConsts, uOrders_AE,
  uConsts_Messages, uCommon_Types, uCommon_Messages, Placemnt, AccMGMT,
  cxCheckBox;

type
  TfrmOrders_main = class(TForm)
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
    id_national: TcxGridDBColumn;
    short_name: TcxGridDBColumn;
    SelectButton: TdxBarLargeButton;
    FormStorage: TFormStorage;
    is_deleted: TcxGridDBColumn;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelectButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure GridDBViewDblClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
  private
    PLanguageIndex : byte;
    DM : TfrmOrders_DM;
    procedure FormIniLanguage;
  public
    res : Variant;
    Is_admin : Boolean;
    constructor Create(AParameter:TbsSimpleParams);reintroduce;
  end;


implementation

{$R *.dfm}

constructor TfrmOrders_main.Create(AParameter:TbsSimpleParams);
begin
  Screen.Cursor:=crHourGlass;
  Inherited Create(AParameter.Owner);

  DM:=TfrmOrders_DM.Create(Self);
  DM.DB.Handle:=AParameter.Db_Handle;
  DM.DB.Connected := True;
  DM.WriteTransaction.StartTransaction;

  DM.DataSet.Close;
  DM.DataSet.SQLs.SelectSQL.Text := 'select * from bs_SP_ORDERS order by name';
  DM.DataSet.Open;

  GridDBView.DataController.DataSource := DM.DataSource;

  FormIniLanguage();

  Is_admin := AParameter.is_admin;

  FormStorage.RestoreFormPlacement;
  Screen.Cursor:=crDefault;
end;

procedure TfrmOrders_main.FormIniLanguage;
begin
  PLanguageIndex:=             uCommon_Funcs.bsLanguageIndex();

  //кэпшн формы
  Caption:=                    uConsts.bs_Main_SpOrders[PLanguageIndex];

  //названия кнопок
  AddButton.Caption :=         uConsts.bs_InsertBtn_Caption[PLanguageIndex];
  EditButton.Caption :=        uConsts.bs_EditBtn_Caption[PLanguageIndex];
  DeleteButton.Caption :=      uConsts.bs_DeleteBtn_Caption[PLanguageIndex];
  RefreshButton.Caption :=     uConsts.bs_RefreshBtn_Caption[PLanguageIndex];
  SelectButton.Caption :=      uConsts.bs_SelectBtn_Caption[PLanguageIndex];
  ExitButton.Caption :=        uConsts.bs_ExitBtn_Caption[PLanguageIndex];

  name.Caption:=               uConsts.bs_Name_Column[PLanguageIndex];
  is_deleted.Caption :=        uConsts.bs_IS_Deleted_Column[PLanguageIndex];

  //статусбар
  StatusBar.Panels[0].Text :=  uConsts.bs_InsertBtn_ShortCut[PLanguageIndex]  + uConsts.bs_InsertBtn_Caption[PLanguageIndex];
  StatusBar.Panels[1].Text :=  uConsts.bs_EditBtn_ShortCut[PLanguageIndex]    + uConsts.bs_EditBtn_Caption[PLanguageIndex];
  StatusBar.Panels[2].Text :=  uConsts.bs_DeleteBtn_ShortCut[PLanguageIndex]  + uConsts.bs_DeleteBtn_Caption[PLanguageIndex];
  StatusBar.Panels[3].Text :=  uConsts.bs_RefreshBtn_ShortCut[PLanguageIndex] + uConsts.bs_RefreshBtn_Caption[PLanguageIndex];
  StatusBar.Panels[4].Text :=  uConsts.bs_EnterBtn_ShortCut[PLanguageIndex]   + uConsts.bs_SelectBtn_Caption[PLanguageIndex];
  StatusBar.Panels[5].Text :=  uConsts.bs_ExitBtn_ShortCut[PLanguageIndex]    + uConsts.bs_ExitBtn_Caption[PLanguageIndex];
end;

procedure TfrmOrders_main.ExitButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmOrders_main.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FormStorage.SaveFormPlacement;

  if FormStyle = fsMDIChild
   then action:=caFree
   else DM.Free;
end;

procedure TfrmOrders_main.SelectButtonClick(Sender: TObject);
var
  id_sp: int64;
begin
  If GridDBView.DataController.RecordCount = 0 then exit;
  
  Res:=VarArrayCreate([0,3],varVariant);
  id_sp:= DM.DataSet['ID_ORDERS'];
  Res[0]:= id_sp;
  Res[1]:=DM.DataSet['NAME'];
  Res[2]:=DM.DataSet['SHORT_NAME'];
  ModalResult:=mrOk;
end;

procedure TfrmOrders_main.FormShow(Sender: TObject);
begin
  if FormStyle = fsMDIChild then  SelectButton.Visible := ivNever;
end;

procedure TfrmOrders_main.AddButtonClick(Sender: TObject);
var
  ViewForm : TfrmOrders_AE;
  New_id_Locator : int64;
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

  ViewForm:= TfrmOrders_AE.Create(Self, PLanguageIndex);
  ViewForm.Caption := uConsts.bs_InsertBtn_Caption[PLanguageIndex];
  ViewForm.CheckBox_delete.Visible := False; 

  if ViewForm.ShowModal = mrOk then
   begin
     with DM.StProc do
      Begin
       Transaction.StartTransaction;
       StoredProcName := 'bs_SP_ORDERS_INS';
       Prepare;
       ParamByName('NAME').AsString       := ViewForm.Name_Edit.Text;
       ParamByName('SHORT_NAME').AsString := ViewForm.ShortName_Edit.text;
       ExecProc;
       New_id_Locator:=ParamByName('ID_ORDERS').AsInt64;
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
       DM.DataSet.CloseOpen(True);
       DM.DataSet.Locate('ID_ORDERS',New_id_Locator,[] );
      end;
   end;
  ViewForm.Free;
end;

procedure TfrmOrders_main.EditButtonClick(Sender: TObject);
var
  ViewForm : TfrmOrders_AE;
  id_Locator : Int64;
begin
   if not Is_Admin then
   if CheckPermission('/ROOT/Contracts/Cn_Sp','Edit') <> 0
    then
     begin
      messagebox(handle,
      pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
      +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
      pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     end;

  If GridDBView.DataController.RecordCount = 0 then exit;

  ViewForm:= TfrmOrders_AE.Create(Self, PLanguageIndex);
  ViewForm.Caption := uConsts.bs_EditBtn_Caption[PLanguageIndex];
  if DM.DataSet['NAME'] <> null
   then ViewForm.Name_Edit.Text :=  DM.DataSet['NAME']
   else ViewForm.Name_Edit.Text :=  '';
  if DM.DataSet['SHORT_NAME'] <> null
   then ViewForm.ShortName_Edit.Text :=  DM.DataSet['SHORT_NAME']
   else ViewForm.ShortName_Edit.Text := '';
  IF DM.DataSet['IS_DELETED'] <> null then
   begin
    if DM.DataSet['IS_DELETED'] = 1
     then ViewForm.CheckBox_delete.Checked := True
     else ViewForm.CheckBox_delete.Checked := False;
   end;

  if ViewForm.ShowModal = mrOk then
   begin
     id_Locator:=  DM.DataSet['ID_ORDERS'];
     with DM.StProc do
      Begin
       Transaction.StartTransaction;
       StoredProcName := 'bs_SP_ORDERS_UPD';
       Prepare;
       ParamByName('ID_ORDERS').AsInt64        := DM.DataSet['ID_ORDERS'];
       ParamByName('NAME').AsString           := ViewForm.Name_Edit.Text;
       ParamByName('SHORT_NAME').AsString     := ViewForm.ShortName_Edit.text;
       if ViewForm.CheckBox_delete.Checked
        then ParamByName('IS_DELETED').AsInteger     := 1
        else ParamByName('IS_DELETED').AsInteger     := 0;
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
      End;
     DM.DataSet.CloseOpen(True);
     DM.DataSet.Locate('ID_ORDERS', id_Locator ,[] );
   end;
  ViewForm.Free; 
end;

procedure TfrmOrders_main.GridDBViewDblClick(Sender: TObject);
begin
  if FormStyle = fsNormal
   then SelectButtonClick(Sender)
   else EditButtonClick(Sender);
end;

procedure TfrmOrders_main.DeleteButtonClick(Sender: TObject);
var
  i: byte;
begin
  if not Is_Admin then
   if CheckPermission('/ROOT/Contracts/Cn_Sp','Edit') <> 0
    then
     begin
      messagebox(handle,
      pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
      +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
      pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     end;
     
  If GridDBView.DataController.RecordCount = 0 then exit;

  i:= uCommon_Messages.bsShowMessage(uConsts.bs_Confirmation_Caption[PLanguageIndex], uConsts_Messages.bs_warning_Delete[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit;

  with DM.StProc do
   Begin
    Transaction.StartTransaction;
    StoredProcName := 'bs_SP_ORDERS_DEL';
    Prepare;
    ParamByName('ID_ORDERS').AsInt64       :=  DM.DataSet['ID_ORDERS'];
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
   End;
   DM.DataSet.CloseOpen(True);
end;

procedure TfrmOrders_main.RefreshButtonClick(Sender: TObject);
var
  id_Locator : Int64;
begin
  If GridDBView.DataController.RecordCount = 0 then exit;
  
  Screen.Cursor := crHourGlass;
  id_Locator    :=  DM.DataSet['ID_ORDERS'];
  DM.DataSet.CloseOpen(True);
  DM.DataSet.Locate('ID_ORDERS', id_Locator ,[] );
  Screen.Cursor := crDefault;
end;

end.
