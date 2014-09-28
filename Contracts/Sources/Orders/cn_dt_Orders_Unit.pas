//******************************************************************************
// Проект "Контракты"
// Справочник приказов по студенту
// Чернявский А.Э. 2006г.
//******************************************************************************

unit cn_dt_Orders_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ImgList, cxGraphics, cxContainer, cxEdit,
  cxProgressBar, dxStatusBar, cxControls, IBase,
  DM_orders, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxClasses, cxTextEdit,
  cn_Common_Funcs, cnConsts, cn_Common_Types, cn_dt_Orders_Unit_AE,
  StdCtrls, ExtCtrls, cnConsts_Messages, cn_Common_Messages;

type
  TfrmOrders = class(TForm)
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
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelectButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure GridDBViewDblClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
  private
    PLanguageIndex: byte;
    ID_STUD : int64;
    DM:TDM;
    procedure FormIniLanguage;
  public
    res : Variant;
    is_admin : Boolean;
    constructor  Create(Aparams :TcnSimpleParamsEx);reintroduce;
    procedure    DataSetAfterOpen(DataSet: TDataSet);
    procedure    DataSetAfterScroll(DataSet: TDataSet);
  end;


implementation

uses cxCalendar;

{$R *.dfm}

procedure TfrmOrders.DataSetAfterOpen(DataSet: TDataSet);
begin
 if DataSet['COMMENTS'] <> null then
 ShortNameLabel.Text := DataSet['COMMENTS']
 else
 ShortNameLabel.Text := '';
end;

procedure TfrmOrders.DataSetAfterScroll(DataSet: TDataSet);
begin
 if DataSet['COMMENTS'] <> null then
 ShortNameLabel.Text := DataSet['COMMENTS']
 else
 ShortNameLabel.Text := '';
end;

constructor TfrmOrders.Create(Aparams :TcnSimpleParamsEx);
begin
 Screen.Cursor:=crHourGlass;
 inherited Create(Aparams.Owner);
 is_admin := Aparams.is_admin;
 ID_STUD := Aparams.cnParamsToPakage.ID_STUD;
 DM:=TDM.Create(Self);
 DM.DataSet.SQLs.SelectSQL.Text := 'select * from CN_DT_ORDERS_SELECT(' + inttostr(Aparams.cnParamsToPakage.ID_STUD) + ')';
 DM.DB.Handle:=Aparams.Db_Handle;
 DM.DataSet.AfterOpen   := DataSetAfterOpen;
 DM.DataSet.AfterScroll := DataSetAfterScroll;
 DM.DataSet.Open;
 GridDBView.DataController.DataSource := DM.DataSource;
 FormIniLanguage();
 Screen.Cursor:=crDefault;
end;


procedure TfrmOrders.FormIniLanguage;
begin
 PLanguageIndex:=           cn_Common_Funcs.cnLanguageIndex();

 //кэпшн формы
 Caption:=                      cnConsts.cn_Orders[PLanguageIndex];
 //названия кнопок
 AddButton.Caption :=           cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 EditButton.Caption :=          cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 DeleteButton.Caption :=        cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 RefreshButton.Caption :=       cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 SelectButton.Caption :=        cnConsts.cn_SelectBtn_Caption[PLanguageIndex];
 ExitButton.Caption :=          cnConsts.cn_ExitBtn_Caption[PLanguageIndex];


 order.Caption :=              cnConsts.cn_OrderType[PLanguageIndex];
 num_order.Caption :=          cnConsts.cn_NumOrd[PLanguageIndex];
 date_order.Caption :=         cnConsts.cn_DateOrd[PLanguageIndex];
 Label1.Caption :=             cnConsts.cn_CommentDiss[PLanguageIndex];

  //статусбар
 StatusBar.Panels[0].Text:=  cnConsts.cn_InsertBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 StatusBar.Panels[1].Text:=  cnConsts.cn_EditBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 StatusBar.Panels[2].Text:=  cnConsts.cn_DeleteBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 StatusBar.Panels[3].Text:=  cnConsts.cn_RefreshBtn_ShortCut[PLanguageIndex] + cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 StatusBar.Panels[4].Text:=  cnConsts.cn_EnterBtn_ShortCut[PLanguageIndex]   + cnConsts.cn_SelectBtn_Caption[PLanguageIndex];
 StatusBar.Panels[5].Text:=  cnConsts.cn_ExitBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_ExitBtn_Caption[PLanguageIndex];
end;

procedure TfrmOrders.ExitButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmOrders.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if FormStyle = fsMDIChild then action:=caFree
else
DM.Free;
end;

procedure TfrmOrders.SelectButtonClick(Sender: TObject);
begin
ModalResult:=mrOk;
end;

procedure TfrmOrders.FormShow(Sender: TObject);
begin
if FormStyle = fsMDIChild then  SelectButton.Enabled:=false;
end;

procedure TfrmOrders.AddButtonClick(Sender: TObject);
var
 ViewForm : TfrmOrdersAE;
 New_id_Locator : int64;
begin
 ViewForm := TfrmOrdersAE.create(self,DM.DB.Handle, PLanguageIndex );
 ViewForm.Caption := cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 ViewForm.is_admin := is_admin;
 ViewForm.id_order := -1;
 if ViewForm.ShowModal = mrOk then
 begin
     with DM.StProc do
       try
        Transaction.StartTransaction;
        StoredProcName := 'CN_DT_ORDERS_INSERT';
        Prepare;
        ParamByName('ID_ORDER').AsInt64       := ViewForm.id_order;
        ParamByName('ID_STUD').AsInt64        := ID_STUD;
        ParamByName('DATE_ORDER').AsDate      := ViewForm.ord_ae_Date_Ord.Date;
        ParamByName('NUM_ORDER').AsString     := ViewForm.ord_ae_Nom_Ord.text;
        ParamByName('COMMENTS').AsString      := ViewForm.ord_ae_Comments.text;
        ExecProc;
        New_id_Locator:=ParamByName('ID_ORDERS').AsInt64;
        Transaction.Commit;
       except
        on E:Exception do
         begin
          cnShowMessage('Error',e.Message,mtError,[mbOK]);
          Transaction.Rollback;
         end;
       end;
 DM.DataSet.CloseOpen(True);
 DM.DataSet.Locate('ID_ORDERS',New_id_Locator,[] );
   end;

end;

procedure TfrmOrders.EditButtonClick(Sender: TObject);
var
 ViewForm : TfrmOrdersAE;
 id_Locator : int64;
begin
if DM.DataSet.RecordCount = 0 then exit;
 ViewForm := TfrmOrdersAE.create(self,DM.DB.Handle, PLanguageIndex );
 ViewForm.Caption := cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 ViewForm.is_admin := is_admin;
 ViewForm.id_order := Dm.DataSet['ID_ORDER'];
 ViewForm.ord_ae_Type_Ord.Text := Dm.DataSet['SHORT_NAME_ORDER'];
 ViewForm.ord_ae_Date_Ord.Date := Dm.DataSet['DATE_ORDER'];
 ViewForm.ord_ae_Nom_Ord.Text := Dm.DataSet['NUM_ORDER'];
 ViewForm.ord_ae_Comments.Text := Dm.DataSet['COMMENTS'];

 if ViewForm.ShowModal = mrOk then
 begin
     id_Locator:=  DM.DataSet['ID_ORDERS'];
     with DM.StProc do
       try
        Transaction.StartTransaction;
        StoredProcName := 'CN_DT_ORDERS_UPDATE';
        Prepare;
        ParamByName('ID_ORDERS').AsInt64      := id_Locator;
        ParamByName('ID_ORDER').AsInt64       := ViewForm.id_order;
        ParamByName('ID_STUD').AsInt64        := ID_STUD;
        ParamByName('DATE_ORDER').AsDate      := ViewForm.ord_ae_Date_Ord.Date;
        ParamByName('NUM_ORDER').AsString     := ViewForm.ord_ae_Nom_Ord.text;
        ParamByName('COMMENTS').AsString      := ViewForm.ord_ae_Comments.text;
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
 DM.DataSet.Locate('ID_ORDERS', id_Locator ,[] );
   end;

end;

procedure TfrmOrders.GridDBViewDblClick(Sender: TObject);
begin
EditButtonClick(Sender);
end;

procedure TfrmOrders.RefreshButtonClick(Sender: TObject);
var
id_Locator : Int64;
begin
 Screen.Cursor := crHourGlass;
 if DM.DataSet['ID_ORDERS'] <> null then
 id_Locator    :=  DM.DataSet['ID_ORDERS']
 else
 id_Locator    := -1;
 DM.DataSet.CloseOpen(True);
 DM.DataSet.Locate('ID_ORDERS', id_Locator ,[] );
 Screen.Cursor := crDefault;
end;

procedure TfrmOrders.DeleteButtonClick(Sender: TObject);
 var
  i: byte;
 begin
if DM.DataSet.RecordCount = 0 then exit;
  i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts_Messages.cn_warning_Delete[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit
  else
  begin
     with DM.StProc do
       try
        Transaction.StartTransaction;
        StoredProcName := 'CN_DT_ORDERS_DELETE';
        Prepare;
        ParamByName('ID_ORDERS').AsInt64       :=  DM.DataSet['ID_ORDERS'];
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
   end;
end;


end.
