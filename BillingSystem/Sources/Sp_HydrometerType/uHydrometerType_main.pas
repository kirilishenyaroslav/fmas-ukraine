//******************************************************************************
// Проект ""
// Справочник типов водомеров
//
// последние изменения
//******************************************************************************

unit uHydrometerType_main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxCheckBox, Placemnt,
  Menus, cxGridTableView, ImgList, dxBar, dxBarExtItems, cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, dxStatusBar, uCommon_Funcs, uConsts,
  uHydrometerType_DM, uHydrometerType_AE, uCommon_Messages, uConsts_Messages,
  uCommon_Types, cxTimeEdit, AccMGMT, cxContainer, cxLabel, cxDBLabel,
  ExtCtrls, StdCtrls;

type
  TfrmHydrometerType_Main = class(TForm)
    StatusBar: TdxStatusBar;
    Grid: TcxGrid;
    GridDBView: TcxGridDBTableView;
    name_hydrometer_type: TcxGridDBColumn;
    caliber_hydrometer: TcxGridDBColumn;
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
    id_unit_meas: TcxGridDBColumn;
    capacity_hydrometer: TcxGridDBColumn;
    accuracy_hydrometer: TcxGridDBColumn;
    Panel1: TPanel;
    FactoryDBLabel: TcxDBLabel;
    NoteDBLabel: TcxDBLabel;
    FactoryLabel: TLabel;
    NoteLabel: TLabel;
    procedure AddPopClick(Sender: TObject);
    procedure EditPopClick(Sender: TObject);
    procedure DeletePopClick(Sender: TObject);
    procedure RefreshPopClick(Sender: TObject);
    procedure ExitPopClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure GridDBViewDblClick(Sender: TObject);
  private
    PLanguageIndex: byte;
    DM : THydrometerType_DM;
    procedure FormIniLanguage;
  public
    res:Variant;
    Is_admin:Boolean;
    constructor  Create(AParameter:TbsSimpleParams);reintroduce;
  end;


 { frmHydrometerType_Main: TfrmHydrometerType_Main; }

implementation

{$R *.dfm}
constructor TfrmHydrometerType_Main.Create(AParameter:TbsSimpleParams);
begin
   Screen.Cursor:=crHourGlass;
   inherited Create(AParameter.Owner);

   self.Is_admin := AParameter.is_admin;

   DM:=THydrometerType_DM.Create(Self);
   DM.DB.Handle := AParameter.Db_Handle;
   DM.DB.Connected := True;
   DM.ReadTransaction.StartTransaction;
   GridDBView.DataController.DataSource := DM.DataSource;
   FactoryDBLabel.DataBinding.DataSource    := DM.DataSource;
   NoteDBLabel.DataBinding.DataSource    := DM.DataSource;
   DM.DataSet.Close;
   DM.DataSet.SQLs.SelectSQL.Text := 'select * from BS_SP_HYDROMETER_TYPE_SEL';
   DM.DataSet.Open;

   if AParameter.ID_Locate <> null
    then DM.DataSet.Locate('id_hydrometer_type', AParameter.ID_Locate, [] );

   FormIniLanguage();
   Screen.Cursor:=crDefault;
   bsFormStorage.RestoreFormPlacement;
end;

procedure TfrmHydrometerType_Main.FormIniLanguage;
begin
 PLanguageIndex:=               uCommon_Funcs.bsLanguageIndex();

 //кэпшн формы
 Caption:=                      uConsts.bs_sp_hydrometer_type[PLanguageIndex];
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
  name_hydrometer_type.Caption  :=  uConsts.bs_name_hydrometer_type[PLanguageIndex];
  caliber_hydrometer.Caption    :=  uConsts.bs_caliber_hydrometer[PLanguageIndex];
  id_unit_meas.Caption          :=  uConsts.bs_id_unit_meas[PLanguageIndex];
  capacity_hydrometer.Caption   :=  uConsts.bs_capacity_hydrometer[PLanguageIndex];
  accuracy_hydrometer.Caption   :=  uConsts.bs_accuracy_hydrometer[PLanguageIndex];
  NoteLabel.caption          :=       uConsts.bs_note_hydrometer[PLanguageIndex];
  FactoryLabel.caption       :=       uConsts.bs_factory_hydrometer[PLanguageIndex];


  //статусбар
 StatusBar.Panels[0].Text:=  uConsts.bs_InsertBtn_ShortCut[PLanguageIndex]  + uConsts.bs_InsertBtn_Caption[PLanguageIndex];
 StatusBar.Panels[1].Text:=  uConsts.bs_EditBtn_ShortCut[PLanguageIndex]    + uConsts.bs_EditBtn_Caption[PLanguageIndex];
 StatusBar.Panels[2].Text:=  uConsts.bs_DeleteBtn_ShortCut[PLanguageIndex]  + uConsts.bs_DeleteBtn_Caption[PLanguageIndex];
 StatusBar.Panels[3].Text:=  uConsts.bs_RefreshBtn_ShortCut[PLanguageIndex] + uConsts.bs_RefreshBtn_Caption[PLanguageIndex];
 StatusBar.Panels[4].Text:=  uConsts.bs_EnterBtn_ShortCut[PLanguageIndex]   + uConsts.bs_SelectBtn_Caption[PLanguageIndex];
 StatusBar.Panels[5].Text:=  uConsts.bs_ExitBtn_ShortCut[PLanguageIndex]    + uConsts.bs_ExitBtn_Caption[PLanguageIndex];
end;

procedure TfrmHydrometerType_Main.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    bsFormStorage.SaveFormPlacement;
    if FormStyle = fsMDIChild then action:=caFree
    else
    DM.Free;
end;

procedure TfrmHydrometerType_Main.FormShow(Sender: TObject);
begin
     if FormStyle = fsMDIChild then  SelectButton.Visible:=ivNever;
end;

procedure TfrmHydrometerType_Main.GridDBViewDblClick(Sender: TObject);
begin
     if FormStyle = fsNormal then SelectButtonClick(Sender)
     else EditButtonClick(Sender);
end;

procedure TfrmHydrometerType_Main.AddPopClick(Sender: TObject);
begin
    AddButtonClick(Sender);
end;

procedure TfrmHydrometerType_Main.EditPopClick(Sender: TObject);
begin
    EditButtonClick(Sender);
end;

procedure TfrmHydrometerType_Main.DeletePopClick(Sender: TObject);
begin
    DeleteButtonClick(Sender);
end;

procedure TfrmHydrometerType_Main.RefreshPopClick(Sender: TObject);
begin
    RefreshButtonClick(Sender);
end;

procedure TfrmHydrometerType_Main.ExitPopClick(Sender: TObject);
begin
    ExitButtonClick(Sender);
end;

procedure TfrmHydrometerType_Main.AddButtonClick(Sender: TObject);
var
  ViewForm : TfrmHydrometerType_AE;
begin
    if not Is_Admin then
        if fibCheckPermission('/ROOT/BillingSystem/bs_sprav/bs_sp_HydrType','Add') <> 0 then
        begin
            messagebox(handle,
            pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
            +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
            pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
            exit;
        end;

    ViewForm := TfrmHydrometerType_AE.Create(Self, PLanguageIndex);

    ViewForm.Caption := uConsts.bs_InsertBtn_Caption[PLanguageIndex];


    if ViewForm.ShowModal = mrOk then
    begin
        with DM.StProc do
        begin
           Transaction.StartTransaction;
           StoredProcName := 'BS_SP_HYDROMETER_TYPE_INS';
           Prepare;
           ParamByName('name_hydrometer_type').AsString       := ViewForm.NameEdit.Text;
           ParamByName('caliber_hydrometer').AsFloat          := strtofloat(ViewForm.CalibrEdit.Text);
           ParamByName('id_unit_meas').AsInteger              := strtoint(ViewForm.MeasCalibrEdit.Text);
           ParamByName('capacity_hydrometer').AsInteger       := strtoint(ViewForm.CapacityEdit.Text);
           ParamByName('accuracy_hydrometer').AsInteger       := strtoint(ViewForm.AccuracyEdit.Text);
           ParamByName('note_hydrometer').AsString            := ViewForm.NoteMemo.Text;
           ParamByName('factory_hydrometer').AsString         := ViewForm.FactoryEdit.Text;
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

procedure TfrmHydrometerType_Main.EditButtonClick(Sender: TObject);
var
  ViewForm : TfrmHydrometerType_AE;
begin
    if not Is_Admin then
    if fibCheckPermission('/ROOT/BillingSystem/bs_sprav/bs_sp_HydrType','Edit') <> 0 then
    begin
        messagebox(handle,
        pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
        +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
        pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
        exit;
    end;

    If GridDBView.DataController.RecordCount = 0 then Exit;

    ViewForm:= TfrmHydrometerType_AE.Create(Self, PLanguageIndex);
    ViewForm.Caption              := uConsts.bs_EditBtn_Caption[PLanguageIndex];

    ViewForm.NameEdit.Text        :=  DM.DataSet['name_hydrometer_type'];
    ViewForm.CalibrEdit.Text      :=  DM.DataSet['caliber_hydrometer'];
    ViewForm.MeasCalibrEdit.Text  :=  DM.DataSet['id_unit_meas'];
    ViewForm.CapacityEdit.Text    :=  DM.DataSet['capacity_hydrometer'];
    ViewForm.AccuracyEdit.Text    :=  DM.DataSet['accuracy_hydrometer'];
    ViewForm.NoteMemo.Text        :=  DM.DataSet['note_hydrometer'];
    ViewForm.FactoryEdit.Text     :=  DM.DataSet['factory_hydrometer'];

    if ViewForm.ShowModal = mrOk then
    begin
        with DM.StProc do
        Begin
           Transaction.StartTransaction;
           StoredProcName := 'BS_SP_HYDROMETER_TYPE_UPD';
           Prepare;

           ParamByName('id_hydrometer_type').AsInt64          := DM.DataSet['id_hydrometer_type'];
           ParamByName('name_hydrometer_type').AsString       := ViewForm.NameEdit.Text;
           ParamByName('caliber_hydrometer').AsFloat          := strtofloat(ViewForm.CalibrEdit.Text);
           ParamByName('id_unit_meas').AsInteger              := strtoint(ViewForm.MeasCalibrEdit.Text);
           ParamByName('capacity_hydrometer').AsInteger       := strtoint(ViewForm.CapacityEdit.Text);
           ParamByName('accuracy_hydrometer').AsInteger       := strtoint(ViewForm.AccuracyEdit.Text);
           ParamByName('note_hydrometer').AsString            := ViewForm.NoteMemo.Text;
           ParamByName('factory_hydrometer').AsString         := ViewForm.FactoryEdit.Text;;
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


procedure TfrmHydrometerType_Main.DeleteButtonClick(Sender: TObject);
var
  i: byte;
begin
   if not Is_Admin then
       if fibCheckPermission('/ROOT/BillingSystem/bs_sprav/bs_sp_HydrType','Del') <> 0 then
       begin
           messagebox(handle,
           pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
           +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
           pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
           exit;
       end;

    If GridDBView.DataController.RecordCount = 0 then Exit;

    i:= uCommon_Messages.bsShowMessage(uConsts.bs_Confirmation_Caption[PLanguageIndex], uConsts_Messages.bs_hydrometer_type_del[PLanguageIndex]+' '+DM.DataSet['name_hydrometer_type']+'?', mtConfirmation, [mbYes, mbNo]);
    if ((i = 7) or (i= 2)) then exit;

    with DM.StProc do
    begin
        Transaction.StartTransaction;
        StoredProcName := 'BS_SP_HYDROMETER_TYPE_DEL';
        Prepare;
        ParamByName('id_hydrometer_type').AsInt64       :=  DM.DataSet['id_hydrometer_type'];
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

procedure TfrmHydrometerType_Main.RefreshButtonClick(Sender: TObject);
begin
    Screen.Cursor := crHourGlass;

    DM.DataSet.Close;
    DM.DataSet.Open;

    Screen.Cursor := crDefault;
end;

procedure TfrmHydrometerType_Main.ExitButtonClick(Sender: TObject);
begin
    close;
end;

procedure TfrmHydrometerType_Main.SelectButtonClick(Sender: TObject);
var
  id_sp: int64;
begin
  if GridDBView.datacontroller.recordcount = 0 then exit;

  Res:=VarArrayCreate([0,3],varVariant);
  id_sp:= DM.DataSet['id_hydrometer_type'];
  Res[0]:= id_sp;
  Res[1]:=DM.DataSet['name_hydrometer_type'];

  ModalResult:=mrOk;
end;


end.
