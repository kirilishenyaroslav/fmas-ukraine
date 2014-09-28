//******************************************************************************
// Проект ""
// Справочник видов водомеров
//
// последние изменения
//******************************************************************************

unit uHydrometerVid_main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, Placemnt, Menus,
  cxGridTableView, ImgList, dxBar, dxBarExtItems, cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, dxStatusBar,uCommon_Funcs, uConsts,
  uHydrometerVid_DM, uHydrometerVid_AE, uCommon_Messages, uConsts_Messages,
  uCommon_Types,  AccMGMT;

type
  TfrmHydrometerVid_main = class(TForm)
    StatusBar: TdxStatusBar;
    Grid: TcxGrid;
    GridDBView: TcxGridDBTableView;
    name_hydrometer_vid: TcxGridDBColumn;
    GridLevel: TcxGridLevel;
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    SelectButton: TdxBarLargeButton;
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
    bsFormStorage: TFormStorage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure GridDBViewDblClick(Sender: TObject);
    procedure AddPopClick(Sender: TObject);
    procedure EditPopClick(Sender: TObject);
    procedure DeletePopClick(Sender: TObject);
    procedure RefreshPopClick(Sender: TObject);
    procedure ExitPopClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
  private
    PLanguageIndex: byte;
    DM : THydrometerVid_DM;
    procedure FormIniLanguage;
  public
    res:Variant;
    Is_admin:Boolean;
    constructor  Create(AParameter:TbsSimpleParams);reintroduce;
  end;

{var
  frmHydrometerVid_main: TfrmHydrometerVid_main; }

implementation

{$R *.dfm}

constructor TfrmHydrometerVid_main.Create(AParameter:TbsSimpleParams);
begin
   Screen.Cursor:=crHourGlass;
   inherited Create(AParameter.Owner);

   Self.Is_admin := AParameter.is_admin;

   DM:=THydrometerVid_DM.Create(Self);
   DM.DB.Handle := AParameter.Db_Handle;
   DM.DB.Connected := True;
   DM.ReadTransaction.StartTransaction;
   GridDBView.DataController.DataSource := DM.DataSource;

   DM.DataSet.Close;
   DM.DataSet.SQLs.SelectSQL.Text := 'select * from BS_SP_HYDROMETER_VID_SEL';
   DM.DataSet.Open;

   if AParameter.ID_Locate <> null
    then DM.DataSet.Locate('id_hydrometer_vid', AParameter.ID_Locate, [] );

   FormIniLanguage();
   Screen.Cursor:=crDefault;
   bsFormStorage.RestoreFormPlacement;
end;

procedure TfrmHydrometerVid_Main.FormIniLanguage;
begin
 PLanguageIndex:=               uCommon_Funcs.bsLanguageIndex();

 //кэпшн формы
 Caption:=                      uConsts.bs_sp_hydrometer_vid[PLanguageIndex];
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
 name_hydrometer_vid.Caption  :=  uConsts.bs_name_hydrometer_vid[PLanguageIndex];


  //статусбар
 StatusBar.Panels[0].Text:=  uConsts.bs_InsertBtn_ShortCut[PLanguageIndex]  + uConsts.bs_InsertBtn_Caption[PLanguageIndex];
 StatusBar.Panels[1].Text:=  uConsts.bs_EditBtn_ShortCut[PLanguageIndex]    + uConsts.bs_EditBtn_Caption[PLanguageIndex];
 StatusBar.Panels[2].Text:=  uConsts.bs_DeleteBtn_ShortCut[PLanguageIndex]  + uConsts.bs_DeleteBtn_Caption[PLanguageIndex];
 StatusBar.Panels[3].Text:=  uConsts.bs_RefreshBtn_ShortCut[PLanguageIndex] + uConsts.bs_RefreshBtn_Caption[PLanguageIndex];
 StatusBar.Panels[4].Text:=  uConsts.bs_EnterBtn_ShortCut[PLanguageIndex]   + uConsts.bs_SelectBtn_Caption[PLanguageIndex];
 StatusBar.Panels[5].Text:=  uConsts.bs_ExitBtn_ShortCut[PLanguageIndex]    + uConsts.bs_ExitBtn_Caption[PLanguageIndex];
end;

procedure TfrmHydrometerVid_main.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    bsFormStorage.SaveFormPlacement;
    if FormStyle = fsMDIChild then action:=caFree
    else
    DM.Free;
end;

procedure TfrmHydrometerVid_main.FormShow(Sender: TObject);
begin
     if FormStyle = fsMDIChild then  SelectButton.Visible:=ivNever;
end;

procedure TfrmHydrometerVid_main.GridDBViewDblClick(Sender: TObject);
begin
     if FormStyle = fsNormal then SelectButtonClick(Sender)
     else EditButtonClick(Sender);
end;

procedure TfrmHydrometerVid_main.AddPopClick(Sender: TObject);
begin
    AddButtonClick(Sender);
end;

procedure TfrmHydrometerVid_main.EditPopClick(Sender: TObject);
begin
    EditButtonClick(Sender);
end;

procedure TfrmHydrometerVid_main.DeletePopClick(Sender: TObject);
begin
    DeleteButtonClick(Sender);
end;

procedure TfrmHydrometerVid_main.RefreshPopClick(Sender: TObject);
begin
    RefreshButtonClick(Sender);
end;

procedure TfrmHydrometerVid_main.ExitPopClick(Sender: TObject);
begin
    ExitButtonClick(Sender);
end;

procedure TfrmHydrometerVid_main.AddButtonClick(Sender: TObject);
var
  ViewForm : TfrmHydrometerVid_AE;
begin
    if not Is_Admin then
        if fibCheckPermission('/ROOT/BillingSystem/bs_sprav/bs_sp_HydrVid','Add') <> 0 then
        begin
            messagebox(handle,
            pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
            +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
            pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
            exit;
        end;

    ViewForm := TfrmHydrometerVid_AE.Create(Self, PLanguageIndex);

    ViewForm.Caption := uConsts.bs_InsertBtn_Caption[PLanguageIndex];


    if ViewForm.ShowModal = mrOk then
    begin
        with DM.StProc do
        begin
           Transaction.StartTransaction;
           StoredProcName := 'BS_SP_HYDROMETER_VID_INS';
           Prepare;
           ParamByName('name_hydrometer_vid').AsString       := ViewForm.NameEdit.Text;
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
        end;
        RefreshButtonClick(self);
    end;
end;

procedure TfrmHydrometerVid_main.EditButtonClick(Sender: TObject);
var
  ViewForm : TfrmHydrometerVid_AE;
begin
    if not Is_Admin then
    if fibCheckPermission('/ROOT/BillingSystem/bs_sprav/bs_sp_HydrVid','Edit') <> 0 then
    begin
        messagebox(handle,
        pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
        +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
        pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
        exit;
    end;

    If GridDBView.DataController.RecordCount = 0 then Exit;

    ViewForm:= TfrmHydrometerVid_AE.Create(Self, PLanguageIndex);
    ViewForm.Caption              := uConsts.bs_EditBtn_Caption[PLanguageIndex];

    ViewForm.NameEdit.Text        :=  DM.DataSet['name_hydrometer_vid'];

    if ViewForm.ShowModal = mrOk then
    begin
        with DM.StProc do
        Begin
           Transaction.StartTransaction;
           StoredProcName := 'BS_SP_HYDROMETER_VID_UPD';
           Prepare;

           ParamByName('id_hydrometer_vid').AsInt64          := DM.DataSet['id_hydrometer_vid'];
           ParamByName('name_hydrometer_vid').AsString       := ViewForm.NameEdit.Text;
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

procedure TfrmHydrometerVid_main.DeleteButtonClick(Sender: TObject);
var
  i: byte;
begin
   if not Is_Admin then
       if fibCheckPermission('/ROOT/BillingSystem/bs_sprav/bs_sp_HydrVid','Del') <> 0 then
       begin
           messagebox(handle,
           pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
           +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
           pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
           exit;
       end;

    If GridDBView.DataController.RecordCount = 0 then Exit;

    i:= uCommon_Messages.bsShowMessage(uConsts.bs_Confirmation_Caption[PLanguageIndex], uConsts_Messages.bs_hydrometer_vid_del[PLanguageIndex]+' '+DM.DataSet['name_hydrometer_vid']+'?', mtConfirmation, [mbYes, mbNo]);
    if ((i = 7) or (i= 2)) then exit;

    with DM.StProc do
    begin
        Transaction.StartTransaction;
        StoredProcName := 'BS_SP_HYDROMETER_VID_DEL';
        Prepare;
        ParamByName('id_hydrometer_vid').AsInt64       :=  DM.DataSet['id_hydrometer_vid'];
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
   end;
    RefreshButtonClick(self);
end;

procedure TfrmHydrometerVid_main.RefreshButtonClick(Sender: TObject);
begin
    Screen.Cursor := crHourGlass;

    DM.DataSet.Close;
    DM.DataSet.Open;

    Screen.Cursor := crDefault;
end;

procedure TfrmHydrometerVid_main.SelectButtonClick(Sender: TObject);
var
  id_sp: int64;
begin
  if GridDBView.datacontroller.recordcount = 0 then exit;

  Res:=VarArrayCreate([0,3],varVariant);
  id_sp:= DM.DataSet['id_hydrometer_vid'];
  Res[0]:= id_sp;
  Res[1]:=DM.DataSet['name_hydrometer_vid'];

  ModalResult:=mrOk;
end;

procedure TfrmHydrometerVid_main.ExitButtonClick(Sender: TObject);
begin
    close;
end;

end.
