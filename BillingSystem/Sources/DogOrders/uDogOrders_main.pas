unit uDogOrders_main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ImgList, cxGraphics, cxContainer, cxEdit,
  cxProgressBar, dxStatusBar, cxControls, IBase,
  uDogOrders_DM, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxClasses, cxTextEdit,
  uCommon_Funcs, uConsts, uCommon_Types, uDogOrders_AE, StdCtrls, ExtCtrls,
  uConsts_Messages, uCommon_Messages, Placemnt;

type
  TfrmDogOrders = class(TForm)
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
    order: TcxGridDBColumn;
    num_order: TcxGridDBColumn;
    date_order: TcxGridDBColumn;
    SelectButton: TdxBarLargeButton;
    Panel1: TPanel;
    Label1: TLabel;
    ShortNameLabel: TEdit;
    FormStorage: TFormStorage;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure GridDBViewDblClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
  private
    PLanguageIndex : byte;
    DM : TfrmDogOrders_DM;
    ID_DOG : Int64;
    procedure FormIniLanguage;
  public
    res : Variant;
    is_admin : Boolean;
    constructor  Create(Aparams :TbsSimpleParamsEx);reintroduce;
    procedure    DataSetAfterOpen(DataSet: TDataSet);
    procedure    DataSetAfterScroll(DataSet: TDataSet);
  end;


implementation

uses cxCalendar;

{$R *.dfm}

procedure TfrmDogOrders.DataSetAfterOpen(DataSet: TDataSet);
begin
  if DataSet['COMMENTS'] <> null
   then ShortNameLabel.Text := DataSet['COMMENTS']
   else ShortNameLabel.Text := '';
end;

procedure TfrmDogOrders.DataSetAfterScroll(DataSet: TDataSet);
begin
  if DataSet['COMMENTS'] <> null
   then ShortNameLabel.Text := DataSet['COMMENTS']
   else ShortNameLabel.Text := '';
end;

constructor TfrmDogOrders.Create(Aparams :TbsSimpleParamsEx);
begin
  Screen.Cursor:=crHourGlass;

  inherited Create(Aparams.Owner);
  is_admin := Aparams.is_admin;
  ID_DOG := Aparams.bsParamsToPakage.ID_DOG;

  DM:=TfrmDogOrders_DM.Create(Self);
  DM.DB.Handle:=Aparams.Db_Handle;
  DM.DB.Connected := True;
  DM.ReadTransaction.StartTransaction;

  DM.DataSet.Close;
  DM.DataSet.SQLs.SelectSQL.Text := 'select * from bs_DT_DOG_ORDERS_SEL(:Id_Dog)';
  DM.DataSet.ParamByName('ID_DOG').AsInt64 := ID_DOG;
  DM.DataSet.Open;

  DM.DataSet.AfterOpen   := DataSetAfterOpen;
  DM.DataSet.AfterScroll := DataSetAfterScroll;


  GridDBView.DataController.DataSource := DM.DataSource;

  FormIniLanguage();

  FormStorage.RestoreFormPlacement;

  Screen.Cursor:=crDefault;
end;


procedure TfrmDogOrders.FormIniLanguage;
begin
  PLanguageIndex:=           uCommon_Funcs.bsLanguageIndex();

  //кэпшн формы
  Caption:=                      uConsts.bs_Orders[PLanguageIndex];

  //названия кнопок
  AddButton.Caption :=           uConsts.bs_InsertBtn_Caption[PLanguageIndex];
  EditButton.Caption :=          uConsts.bs_EditBtn_Caption[PLanguageIndex];
  DeleteButton.Caption :=        uConsts.bs_DeleteBtn_Caption[PLanguageIndex];
  RefreshButton.Caption :=       uConsts.bs_RefreshBtn_Caption[PLanguageIndex];
  SelectButton.Caption :=        uConsts.bs_SelectBtn_Caption[PLanguageIndex];
  ExitButton.Caption :=          uConsts.bs_ExitBtn_Caption[PLanguageIndex];


  order.Caption :=              uConsts.bs_OrderType[PLanguageIndex];
  num_order.Caption :=          uConsts.bs_NumOrd[PLanguageIndex];
  date_order.Caption :=         uConsts.bs_DateOrd[PLanguageIndex];
  Label1.Caption :=             uConsts.bs_CommentDiss[PLanguageIndex];

  //статусбар
  StatusBar.Panels[0].Text:=  uConsts.bs_InsertBtn_ShortCut[PLanguageIndex]  + uConsts.bs_InsertBtn_Caption[PLanguageIndex];
  StatusBar.Panels[1].Text:=  uConsts.bs_EditBtn_ShortCut[PLanguageIndex]    + uConsts.bs_EditBtn_Caption[PLanguageIndex];
  StatusBar.Panels[2].Text:=  uConsts.bs_DeleteBtn_ShortCut[PLanguageIndex]  + uConsts.bs_DeleteBtn_Caption[PLanguageIndex];
  StatusBar.Panels[3].Text:=  uConsts.bs_RefreshBtn_ShortCut[PLanguageIndex] + uConsts.bs_RefreshBtn_Caption[PLanguageIndex];
  StatusBar.Panels[4].Text:=  uConsts.bs_EnterBtn_ShortCut[PLanguageIndex]   + uConsts.bs_SelectBtn_Caption[PLanguageIndex];
  StatusBar.Panels[5].Text:=  uConsts.bs_ExitBtn_ShortCut[PLanguageIndex]    + uConsts.bs_ExitBtn_Caption[PLanguageIndex];
end;

procedure TfrmDogOrders.ExitButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmDogOrders.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FormStorage.SaveFormPlacement;

  if FormStyle = fsMDIChild
   then action:=caFree
   else DM.Free;
end;

procedure TfrmDogOrders.FormShow(Sender: TObject);
begin
  if FormStyle = fsMDIChild then  SelectButton.Visible := ivNever;
end;

procedure TfrmDogOrders.AddButtonClick(Sender: TObject);
var
 ViewForm : TfrmDogOrders_AE;
 New_id_Locator : int64;
begin
  ViewForm := TfrmDogOrders_AE.create(self,DM.DB.Handle, PLanguageIndex );
  ViewForm.Caption := uConsts.bs_InsertBtn_Caption[PLanguageIndex];
  ViewForm.is_admin := is_admin;
  ViewForm.id_order := -1;

  if ViewForm.ShowModal = mrOk then
   begin
     with DM.StProc do
      Begin
       Transaction.StartTransaction;
       StoredProcName := 'bs_DT_DOG_ORDERS_INS';
       Prepare;
       ParamByName('ID_ORDERS').AsInt64      := ViewForm.id_order;
       ParamByName('ID_DOG').AsInt64         := ID_Dog;
       ParamByName('DATE_ORDER').AsDate      := ViewForm.ord_ae_Date_Ord.Date;
       ParamByName('NUM_ORDER').AsString     := ViewForm.ord_ae_Nom_Ord.text;
       ParamByName('COMMENTS').AsString      := ViewForm.ord_ae_Comments.text;
       ExecProc;
       New_id_Locator:=ParamByName('ID_DOG_ORDERS').AsInt64;
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
    DM.DataSet.CloseOpen(True);
    DM.DataSet.Locate('ID_DOG_ORDERS',New_id_Locator,[] );
   end;
  ViewForm.Free;
end;

procedure TfrmDogOrders.EditButtonClick(Sender: TObject);
var
 ViewForm : TfrmDogOrders_AE;
 id_Locator : int64;
begin
  if DM.DataSet.RecordCount = 0 then exit;

  ViewForm := TfrmDogOrders_AE.create(self,DM.DB.Handle, PLanguageIndex );
  ViewForm.Caption := uConsts.bs_EditBtn_Caption[PLanguageIndex];

  ViewForm.is_admin := is_admin;
  ViewForm.id_order := Dm.DataSet['ID_ORDERS'];
  ViewForm.ord_ae_Type_Ord.Text := Dm.DataSet['SHORT_NAME_ORDER'];
  ViewForm.ord_ae_Date_Ord.Date := Dm.DataSet['DATE_ORDER'];
  ViewForm.ord_ae_Nom_Ord.Text := Dm.DataSet['NUM_ORDER'];
  ViewForm.ord_ae_Comments.Text := Dm.DataSet['COMMENTS'];

  if ViewForm.ShowModal = mrOk then
   begin
    id_Locator:=  DM.DataSet['ID_DOG_ORDERS'];
    with DM.StProc do
     Begin
      Transaction.StartTransaction;
      StoredProcName := 'bs_DT_DOG_ORDERS_UPD';
      Prepare;
      ParamByName('ID_DOG_ORDERS').AsInt64  := id_Locator;
      ParamByName('ID_ORDERS').AsInt64      := ViewForm.id_order;
      ParamByName('ID_DOG').AsInt64         := ID_DOG;
      ParamByName('DATE_ORDER').AsDate      := ViewForm.ord_ae_Date_Ord.Date;
      ParamByName('NUM_ORDER').AsString     := ViewForm.ord_ae_Nom_Ord.text;
      ParamByName('COMMENTS').AsString      := ViewForm.ord_ae_Comments.text;
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
    DM.DataSet.CloseOpen(True);
    DM.DataSet.Locate('ID_DOG_ORDERS', id_Locator ,[] );
   end;
   
  ViewForm.Free;
end;

procedure TfrmDogOrders.GridDBViewDblClick(Sender: TObject);
begin
  EditButtonClick(Sender);
end;

procedure TfrmDogOrders.RefreshButtonClick(Sender: TObject);
var
  id_Locator : Int64;
begin
  if GridDBView.DataController.RecordCount = 0 then Exit;

  Screen.Cursor := crHourGlass;
  if DM.DataSet['ID_DOG_ORDERS'] <> null
   then id_Locator    :=  DM.DataSet['ID_DOG_ORDERS']
   else id_Locator    := -1;
  DM.DataSet.CloseOpen(True);
  DM.DataSet.Locate('ID_DOG_ORDERS', id_Locator ,[] );
  Screen.Cursor := crDefault;
end;

procedure TfrmDogOrders.DeleteButtonClick(Sender: TObject);
 var
  i: byte;
begin
  if DM.DataSet.RecordCount = 0 then exit;

  i:= uCommon_Messages.bsShowMessage(uConsts.bs_Confirmation_Caption[PLanguageIndex], uConsts_Messages.bs_warning_Delete[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit;

  with DM.StProc do
   Begin
    Transaction.StartTransaction;
    StoredProcName := 'bs_DT_DOG_ORDERS_DEL';
    Prepare;
    ParamByName('ID_DOG_ORDERS').AsInt64       :=  DM.DataSet['ID_DOG_ORDERS'];
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
end.
