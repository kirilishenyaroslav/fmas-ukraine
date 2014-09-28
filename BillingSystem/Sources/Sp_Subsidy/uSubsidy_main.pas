//******************************************************************************
// Проект ""
// Справочник категорий
//
// последние изменения
//******************************************************************************

unit uSubsidy_main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ImgList, cxGraphics, cxContainer, cxEdit,
  cxProgressBar, dxStatusBar, cxControls, IBase,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxClasses, cxTextEdit,
  uCommon_Funcs, uConsts, uSubsidy_DM, uSubsidy_AE, uCommon_Messages, uConsts_Messages,
  Menus, uCommon_Types, Placemnt, cxCheckBox, AccMGMT;

type
  TfrmSubsidy_Main = class(TForm)
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
    bsFormStorage: TFormStorage;
    is_deleted: TcxGridDBColumn;
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
  private
    PLanguageIndex: byte;
    DM : TSubsidy_DM;
    procedure FormIniLanguage;
  public
    res:Variant;
    Is_admin:Boolean;
    constructor  Create(AParameter:TbsSimpleParams);reintroduce;
  end;


implementation

{$R *.dfm}

constructor TfrmSubsidy_Main.Create(AParameter:TbsSimpleParams);
begin
   Screen.Cursor:=crHourGlass;
   inherited Create(AParameter.Owner);

   DM:=TSubsidy_DM.Create(Self);
   DM.DB.Handle := AParameter.Db_Handle;
   DM.DB.Connected := True;
   DM.ReadTransaction.StartTransaction;
   GridDBView.DataController.DataSource := DM.DataSource;

   DM.DataSet.Close;
   DM.DataSet.SQLs.SelectSQL.Text := 'select * from bs_sp_Subsidy_sel';
   DM.DataSet.Open;

   if AParameter.ID_Locate <> null
    then DM.DataSet.Locate('ID_SUBSIDY', AParameter.ID_Locate, [] );

   FormIniLanguage();
   Screen.Cursor:=crDefault;
   bsFormStorage.RestoreFormPlacement;
end;

procedure TfrmSubsidy_Main.FormIniLanguage;
begin
 PLanguageIndex:=               uCommon_Funcs.bsLanguageIndex();

 //кэпшн формы
 Caption:=                      uConsts.bs_Main_Subsidy[PLanguageIndex];
 //названия кнопок
 AddButton.Caption :=           uConsts.bs_InsertBtn_Caption[PLanguageIndex];
 EditButton.Caption :=          uConsts.bs_EditBtn_Caption[PLanguageIndex];
 DeleteButton.Caption :=        uConsts.bs_DeleteBtn_Caption[PLanguageIndex];
 RefreshButton.Caption :=       uConsts.bs_RefreshBtn_Caption[PLanguageIndex];
 SelectButton.Caption :=        uConsts.bs_SelectBtn_Caption[PLanguageIndex];
 ExitButton.Caption :=          uConsts.bs_ExitBtn_Caption[PLanguageIndex];
 // попап
 AddPop.Caption :=           uConsts.bs_InsertBtn_Caption[PLanguageIndex];
 EditPop.Caption :=          uConsts.bs_EditBtn_Caption[PLanguageIndex];
 DeletePop.Caption :=        uConsts.bs_DeleteBtn_Caption[PLanguageIndex];
 RefreshPop.Caption :=       uConsts.bs_RefreshBtn_Caption[PLanguageIndex];
 ExitPop.Caption :=          uConsts.bs_ExitBtn_Caption[PLanguageIndex];

  //грид
  name.Caption:=                   uConsts.bs_Name_Column[PLanguageIndex];
  is_deleted.Caption :=            uConsts.bs_is_deleted_Column[PLanguageIndex];
  //статусбар
 StatusBar.Panels[0].Text:=  uConsts.bs_InsertBtn_ShortCut[PLanguageIndex]  + uConsts.bs_InsertBtn_Caption[PLanguageIndex];
 StatusBar.Panels[1].Text:=  uConsts.bs_EditBtn_ShortCut[PLanguageIndex]    + uConsts.bs_EditBtn_Caption[PLanguageIndex];
 StatusBar.Panels[2].Text:=  uConsts.bs_DeleteBtn_ShortCut[PLanguageIndex]  + uConsts.bs_DeleteBtn_Caption[PLanguageIndex];
 StatusBar.Panels[3].Text:=  uConsts.bs_RefreshBtn_ShortCut[PLanguageIndex] + uConsts.bs_RefreshBtn_Caption[PLanguageIndex];
 StatusBar.Panels[4].Text:=  uConsts.bs_EnterBtn_ShortCut[PLanguageIndex]   + uConsts.bs_SelectBtn_Caption[PLanguageIndex];
 StatusBar.Panels[5].Text:=  uConsts.bs_ExitBtn_ShortCut[PLanguageIndex]    + uConsts.bs_ExitBtn_Caption[PLanguageIndex];
end;

procedure TfrmSubsidy_Main.ExitButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmSubsidy_Main.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  bsFormStorage.SaveFormPlacement;
  if FormStyle = fsMDIChild then action:=caFree
  else
  DM.Free;
end;

procedure TfrmSubsidy_Main.SelectButtonClick(Sender: TObject);
var
  id_sp: int64;
begin
  if GridDBView.datacontroller.recordcount = 0 then exit;

  Res:=VarArrayCreate([0,3],varVariant);
  id_sp:= DM.DataSet['ID_SUBSIDY'];
  Res[0]:= id_sp;
  Res[1]:=DM.DataSet['NAME_SUBSIDY'];

  ModalResult:=mrOk;
end;

procedure TfrmSubsidy_Main.FormShow(Sender: TObject);
begin
  if FormStyle = fsMDIChild then  SelectButton.Visible:=ivNever;
end;

procedure TfrmSubsidy_Main.GridDBViewDblClick(Sender: TObject);
begin
  if FormStyle = fsNormal
   then SelectButtonClick(Sender)
   else EditButtonClick(Sender);
end;

procedure TfrmSubsidy_Main.AddButtonClick(Sender: TObject);
var
  ViewForm : TfrmSubsidy_AE;
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

  ViewForm:= TfrmSubsidy_AE.Create(Self, PLanguageIndex);
  ViewForm.Caption := uConsts.bs_InsertBtn_Caption[PLanguageIndex];
  if ViewForm.ShowModal = mrOk then
   begin
     with DM.StProc do
      Begin
       Transaction.StartTransaction;
       StoredProcName := 'bs_SP_SUBSIDY_INS';
       Prepare;
       ParamByName('NAME_Subsidy').AsString       := ViewForm.Name_Edit.Text;
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

procedure TfrmSubsidy_Main.EditButtonClick(Sender: TObject);
var
  ViewForm : TfrmSubsidy_AE;
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
    
  ViewForm:= TfrmSubsidy_AE.Create(Self, PLanguageIndex);
  ViewForm.Caption := uConsts.bs_EditBtn_Caption[PLanguageIndex];
  ViewForm.Name_Edit.Text:=  DM.DataSet['NAME_Subsidy'];

  if ViewForm.ShowModal = mrOk then
   begin
     with DM.StProc do
      Begin
       Transaction.StartTransaction;
       StoredProcName := 'bs_SP_SUBSIDY_UPD';
       Prepare;
       ParamByName('ID_Subsidy').AsInt64     := DM.DataSet['ID_Subsidy'];
       ParamByName('NAME_Subsidy').AsString           := ViewForm.Name_Edit.Text;
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

procedure TfrmSubsidy_Main.DeleteButtonClick(Sender: TObject);
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
     StoredProcName := 'bs_SP_SUBSIDY_DEL';
     Prepare;
     ParamByName('ID_Subsidy').AsInt64       :=  DM.DataSet['ID_Subsidy'];
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

procedure TfrmSubsidy_Main.RefreshButtonClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;

  DM.DataSet.Close;
  DM.DataSet.Open;

  Screen.Cursor := crDefault;
end;

procedure TfrmSubsidy_Main.AddPopClick(Sender: TObject);
begin
  AddButtonClick(Sender);
end;

procedure TfrmSubsidy_Main.EditPopClick(Sender: TObject);
begin
EditButtonClick(Sender);
end;

procedure TfrmSubsidy_Main.DeletePopClick(Sender: TObject);
begin
DeleteButtonClick(Sender);
end;

procedure TfrmSubsidy_Main.RefreshPopClick(Sender: TObject);
begin
RefreshButtonClick(Sender);
end;

procedure TfrmSubsidy_Main.ExitPopClick(Sender: TObject);
begin
ExitButtonClick(Sender);
end;

end.
