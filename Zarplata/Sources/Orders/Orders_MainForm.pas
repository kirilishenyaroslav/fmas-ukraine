unit Orders_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ExtCtrls, cxSplitter, dxStatusBar,
  dxBarExtItems, dxBar, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, IBase,
  z_dmCommonStyles, ZcxLocateBar, FIBQuery, pFIBQuery, pFIBStoredProc,UnitZarplataConsts,
  PackageLoad, z_StProc_DM;

type
  TfmOrders = class(TForm)
    OrdersGridDBTableView1: TcxGridDBTableView;
    OrdersGridLevel1: TcxGridLevel;
    OrdersGrid: TcxGrid;
    BarManager: TdxBarManager;
    btnAdd: TdxBarLargeButton;
    btnEdit: TdxBarLargeButton;
    btnDelete: TdxBarLargeButton;
    DetailBtn: TdxBarLargeButton;
    PrintBtn: TdxBarLargeButton;
    RefreshBtn: TdxBarLargeButton;
    MonthCombo: TdxBarCombo;
    RegUchComboBox: TdxBarCombo;
    CloseSchBtn: TdxBarLargeButton;
    OpenSchBtn: TdxBarLargeButton;
    AddOrderBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    YearSpinEdit: TdxBarSpinEdit;
    dxBarButton1: TdxBarButton;
    dxBarStatic1: TdxBarStatic;
    dxBarButton2: TdxBarButton;
    FilterBtn: TdxBarButton;
    dxStatusBar1: TdxStatusBar;
    cxSplitter1: TcxSplitter;
    DetailGridDBTableView1: TcxGridDBTableView;
    DetailGridLevel1: TcxGridLevel;
    DetailGrid: TcxGrid;
    DetailPanel: TPanel;
    cxSplitter2: TcxSplitter;
    ManGridDBTableView1: TcxGridDBTableView;
    ManGridLevel1: TcxGridLevel;
    ManGrid: TcxGrid;
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    DSet1: TpFIBDataSet;
    DSet2: TpFIBDataSet;
    DSet3: TpFIBDataSet;
    DSource1: TDataSource;
    DSource2: TDataSource;
    DSource3: TDataSource;
    cmnID_ORDER: TcxGridDBColumn;
    cmnNUM_ORDER: TcxGridDBColumn;
    cmnNUM_ORDER_KADR: TcxGridDBColumn;
    cmnNOTE: TcxGridDBColumn;
    cmnDATE_ORDER: TcxGridDBColumn;
    cmnDATE_ORDER_KADR: TcxGridDBColumn;
    cmnD_ID_ORDER: TcxGridDBColumn;
    cmnD_NAME_TYPE: TcxGridDBColumn;
    cmnD_NUM: TcxGridDBColumn;
    cmnTN: TcxGridDBColumn;
    cmnFIO: TcxGridDBColumn;
    BegDateCmb: TdxBarDateCombo;
    EndDateCmb: TdxBarDateCombo;
    dxBarButton3: TdxBarButton;
    dxBarStatic2: TdxBarStatic;
    dxBarStatic3: TdxBarStatic;
    cmnD_SUB_NUM: TcxGridDBColumn;
    dxBarStatic4: TdxBarStatic;
    BarDockLocate: TdxBarDockControl;
    ShowAcceptedBtn: TdxBarLargeButton;
    StoredProc: TpFIBStoredProc;
    DeleteBtn: TdxBarLargeButton;
    WriteTransaction: TpFIBTransaction;
    AcceptDataBtn: TdxBarLargeButton;
    ManFilterEdit: TdxBarEdit;
    ManFilterBtn: TdxBarButton;
    dxBarStatic5: TdxBarStatic;
    DelManBtn: TdxBarButton;
    procedure ExitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FilterBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure BegDateCmbChange(Sender: TObject);
    procedure EndDateCmbChange(Sender: TObject);
    procedure ShowAcceptedBtnClick(Sender: TObject);
    procedure AddOrderBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure AcceptDataBtnClick(Sender: TObject);
    procedure ManFilterBtnClick(Sender: TObject);
    procedure DelManBtnClick(Sender: TObject);
  private
    { Private declarations }
    PLanguageIndex:Integer;
    pStyles:TStylesDM;
    pBarLocate:TZBarLocate;
//    pMan:Variant;
    pIdMan:integer;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE); reintroduce;
    procedure DSetsReOpen;
  end;

implementation

{$R *.dfm}

uses zWait, zProc, StrUtils, zMessages;

constructor TfmOrders.Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE);
var ZILRec:TZItemLocate;
begin
  inherited Create(AOwner);
  PLanguageIndex:=LanguageIndex;
  pIdMan:=-1;
//******************************************************************************
  DB.Handle:=ADB_Handle;
  DB.DefaultTransaction.Active:=True;
  DSetsReOpen;
//******************************************************************************
  pStyles:=TStylesDM.Create(Self);
  OrdersGridDBTableView1.Styles.StyleSheet:=pStyles.GridTableViewStyleSheetDevExpress;
  DetailGridDBTableView1.Styles.StyleSheet:=pStyles.GridTableViewStyleSheetDevExpress;
  ManGridDBTableView1.Styles.StyleSheet   :=pStyles.GridTableViewStyleSheetDevExpress;
//******************************************************************************
  cxSplitter1.CloseSplitter;
//******************************************************************************
 PBarLocate:=TZBarLocate.Create(BarManager);
 PBarLocate.DataSet := DSet1;
 PBarLocate.BorderStyle := bbsNone;

 pBarLocate.AddLocateItem(cmnNUM_ORDER.DataBinding.FieldName,
                          cmnNUM_ORDER.Caption,[loCaseInsensitive,loPartialKey]);
{ ZILRec.NameField    :='NUM_ORDER';
 ZILRec.Caption      :=cmnNUM_ORDER.Caption;
 ZILRec.LocateOptions:=[loCaseInsensitive,loPartialKey];
 PBarLocate.AddLocateItem(ZILRec);}

 ZILRec.NameField    :='NUM_ORDER_KADR';
 ZILRec.Caption      :=cmnNUM_ORDER_KADR.Caption;
 ZILRec.LocateOptions:=[loCaseInsensitive];
 PBarLocate.AddLocateItem(ZILRec);

 ZILRec.NameField    :='DATE_ORDER';
 ZILRec.Caption      :=cmnDATE_ORDER.Caption;
 ZILRec.LocateOptions:=[loCaseInsensitive];
 PBarLocate.AddLocateItem(ZILRec);

 ZILRec.NameField    :='DATE_ORDER_KADR';
 ZILRec.Caption      :=cmnDATE_ORDER_KADR.Caption;
 ZILRec.LocateOptions:=[loCaseInsensitive];
 PBarLocate.AddLocateItem(ZILRec);

 ZILRec.NameField    :='NOTE';
 ZILRec.Caption      :=cmnNOTE.Caption;
 ZILRec.LocateOptions:=[loCaseInsensitive];
 PBarLocate.AddLocateItem(ZILRec);

 PBarLocate.FieldSelectVisible := True;
 PBarLocate.DockControl := BarDockLocate;
//******************************************************************************
  Show;
end;

procedure TfmOrders.DSetsReOpen;
begin
  if DSet1.Active then DSet1.Close;
  if DSet2.Active then DSet2.Close;
  if DSet3.Active then DSet3.Close;
  DSet1.SQLs.SelectSQL.Text:='SELECT * FROM Z_GET_ASUP_ORDERS('+IfThen(ShowAcceptedBtn.Down,'1','0')+','''
                             +DateToStr(BegDateCmb.Date)+''','''
                             +DateToStr(EndDateCmb.Date)+''','
                             +IfThen(pIdMan<>-1,IntToStr(pIdMan),'NULL')+')';
//  ShowMessage(DSet1.SQLs.SelectSQL.Text);                             
  DSet2.SQLs.SelectSQL.Text:='SELECT * FROM ASUP_ORDERS_ITEMS_SELECT(?ID_ORDER_GROUP)';
  DSet3.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM ASUP_ORDERS_GET_PEOPLE_BY_ORDER(?ID_ORDER)';
  DSet1.Open;
  DSet2.Open;
  DSet3.Open;
end;
procedure TfmOrders.ExitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TfmOrders.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfmOrders.FilterBtnClick(Sender: TObject);
begin
  DSetsReOpen;
end;

procedure TfmOrders.RefreshBtnClick(Sender: TObject);
begin
  DSetsReOpen;
end;

procedure TfmOrders.BegDateCmbChange(Sender: TObject);
begin
  if BegDateCmb.Date>EndDateCmb.Date then
    BegDateCmb.Date:=EndDateCmb.Date;
end;

procedure TfmOrders.EndDateCmbChange(Sender: TObject);
begin
  if EndDateCmb.Date<BegDateCmb.Date then
    EndDateCmb.Date:=BegDateCmb.Date;
end;

procedure TfmOrders.ShowAcceptedBtnClick(Sender: TObject);
begin
  DSetsReOpen;
  AddOrderBtn.Enabled:= not ShowAcceptedBtn.Down;
  DeleteBtn.Enabled:= ShowAcceptedBtn.Down;
end;

procedure TfmOrders.AddOrderBtnClick(Sender: TObject);
var i:Integer;
begin
  if not DSet1.IsEmpty then
    begin
      try
        WriteTransaction.StartTransaction;
        StoredProc.StoredProcName:='Z_ORDERS_REESTR_GROUP_MODIFY';
        StoredProc.Prepare;

        for i:=0 to OrdersGridDBTableView1.Controller.SelectedRecordCount-1 do
          begin
            WriteTransaction.StartTransaction;
            StoredProc.ParamByName('IN_ID_ORDER_GROUP').AsInteger:=
                 OrdersGridDBTableView1.Controller.SelectedRecords[i].Values[cmnID_ORDER.Index];
            StoredProc.ParamByName('IN_ACTION').AsString:='I';
            StoredProc.ExecProc;
            WriteTransaction.Commit;
          end;

        DSetsReOpen;  

      except on E:Exception
      do
        begin
          ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
          WriteTransaction.Rollback;
        end;
      end;
    end;
end;

procedure TfmOrders.DeleteBtnClick(Sender: TObject);
var i:Integer;
begin
  if not DSet1.IsEmpty then
    begin
      try
        WriteTransaction.StartTransaction;
        StoredProc.StoredProcName:='Z_ORDERS_REESTR_GROUP_MODIFY';
        StoredProc.Prepare;

        for i:=0 to OrdersGridDBTableView1.Controller.SelectedRecordCount-1 do
          begin
            WriteTransaction.StartTransaction;
            StoredProc.ParamByName('IN_ID_ORDER_GROUP').AsInteger:=
                 OrdersGridDBTableView1.Controller.SelectedRecords[i].Values[cmnID_ORDER.Index];
            StoredProc.ParamByName('IN_ACTION').AsString:='D';
            StoredProc.ExecProc;
            WriteTransaction.Commit;
          end;

         DSetsReOpen; 
      except on E:Exception
      do
        begin
          ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
          WriteTransaction.Rollback;
        end;
      end;
    end;
end;

procedure TfmOrders.AcceptDataBtnClick(Sender: TObject);
var wf:TForm;
begin
  wf:=ShowWaitForm(Self);
  try
    WriteTransaction.StartTransaction;

    StoredProc.StoredProcName:='ASUP_Z_MOVING_CREATE';
    StoredProc.ParamByName('ID_SESSION').Value:=1;
    StoredProc.ParamByName('PERIOD_BEG').Value:='01.08.2004';
    StoredProc.ParamByName('PERIOD_END').Value:='01.01.2050';

    StoredProc.Prepare;
    StoredProc.ExecProc;

    StoredProc.StoredProcName:='ASUP_Z_BONUS_CREATE';
    StoredProc.ParamByName('ID_SESSION').Value:=1;
    StoredProc.ParamByName('PERIOD_BEG').Value:='01.08.2004';
    StoredProc.ParamByName('PERIOD_END').Value:='01.01.2050';

    StoredProc.Prepare;
    StoredProc.ExecProc;

    WriteTransaction.Commit;
  except on E:Exception
  do
    begin
      ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
      WriteTransaction.Rollback;
    end;
  end;
  CloseWaitForm(wf);
end;

procedure TfmOrders.ManFilterBtnClick(Sender: TObject);
var Res:Variant;
    pStProcDM:TStProcDM;
begin
  Res:=LoadPeopleModal(Self,DB.Handle);
  if not VarIsNull(Res) then
   begin
    ManFilterEdit.Text:=VarToStr(Res[4])+' - '+VarToStr(Res[1])+' '+VarToStr(Res[2])+' '+VarToStr(Res[3]);
    pIdMan := Res[0];
   end;
end;

procedure TfmOrders.DelManBtnClick(Sender: TObject);
begin
  pIdMan:=-1;
  ManFilterEdit.Text:='';
end;

end.
