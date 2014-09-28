unit uOrdersReestr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, FIBDatabase, pFIBDatabase,IBase,
  FIBDataSet, pFIBDataSet,dmMain,ZMessages, StdCtrls, Buttons, ImgList,
  ZcxLocateBar, AllPeopleUnit, dxBarExtDBItems,ZWait;

type
  TOrdersReestrViewForm = class(TForm)
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    OtherBtn: TdxBarLargeButton;
    DeleteChild1Btn: TdxBarLargeButton;
    UpdateChild1Btn: TdxBarLargeButton;
    InsertChild1Btn: TdxBarLargeButton;
    InsertChild2Btn: TdxBarLargeButton;
    UpdateChild2Btn: TdxBarLargeButton;
    DeleteChild2Btn: TdxBarLargeButton;
    ViewChild2Btn: TdxBarLargeButton;
    ViewChild1Btn: TdxBarLargeButton;
    ReestrTableView: TcxGridDBTableView;
    ReestrGridLevel: TcxGridLevel;
    ReestrGrid: TcxGrid;
    StyleRepository: TcxStyleRepository;
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
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    ReestrTableViewNUM_ORDER: TcxGridDBColumn;
    ReestrTableViewDATE_ORDER: TcxGridDBColumn;
    ReestrTableViewNOTE: TcxGridDBColumn;
    dxBarColorCombo1: TdxBarColorCombo;
    AddOrder: TdxBarLargeButton;
    dxBarStatic1: TdxBarStatic;
    dxBarSubItem1: TdxBarSubItem;
    dxBarDateCombo1: TdxBarDateCombo;
    DateBegLabel: TdxBarStatic;
    DateBegCombo: TdxBarDateCombo;
    dxBarGroup1: TdxBarGroup;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    dxBarContainerItem1: TdxBarContainerItem;
    dxBarContainerItem2: TdxBarContainerItem;
    dxBarButton1: TdxBarButton;
    LabelBeg: TdxBarStatic;
    DateCombo: TdxBarDateCombo;
    dxBarButton2: TdxBarButton;
    dxBarContainerItem3: TdxBarContainerItem;
    dxBarControlContainerItem2: TdxBarControlContainerItem;
    FilterOnOffBtn: TSpeedButton;
    dxBarStatic2: TdxBarStatic;
    dxBarControlContainerItem3: TdxBarControlContainerItem;
    Filter2OnOffBtn: TSpeedButton;
    ReestrTableViewOREDR_TYPE: TcxGridDBColumn;
    ImageList: TImageList;
    CancelBtn: TdxBarLargeButton;
    dxBarStatic3: TdxBarStatic;
    CustomdxBarCombo1: TCustomdxBarCombo;
    dxBarLookupCombo1: TdxBarLookupCombo;
    ManEdit: TdxBarEdit;
    dxBarButton3: TdxBarButton;
    dxBarContainerItem4: TdxBarContainerItem;
    ManFilterBtn: TSpeedButton;
    ManFilterContainer: TdxBarControlContainerItem;
    dxBarStatic4: TdxBarStatic;
    dxBarStatic5: TdxBarStatic;
    DateEndCombo: TdxBarDateCombo;
    dxBarStatic6: TdxBarStatic;
    dxBarStatic7: TdxBarStatic;
    AcceptDataBtn: TdxBarLargeButton;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExitBtnClick(Sender: TObject);
    procedure AddOrderClick(Sender: TObject);
    procedure ReestrTableViewDblClick(Sender: TObject);
    procedure ReestrTableViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FilterOnOffBtnClick(Sender: TObject);
    procedure DateComboChange(Sender: TObject);
    procedure Filter2OnOffBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure dxBarButton3Click(Sender: TObject);
    procedure ManFilterBtnClick(Sender: TObject);
    procedure DateEndComboChange(Sender: TObject);
    procedure AcceptDataBtnClick(Sender: TObject);
  private
    FShowAccepted:Boolean;
    PBarLocate:TZBarLocate;
    FIdPCard:    Integer;
    procedure RefreshList();
    procedure AcceptOrder();
  public
    constructor Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE);reintroduce;
  end;

   function ShowOrdersReestr(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE):Variant;
                                                                      stdcall;
   exports ShowOrdersReestr;

var
  OrdersReestrViewForm: TOrdersReestrViewForm;

implementation

constructor TOrdersReestrViewForm.Create(AOwner:TComponent;
                                            DB_HANDLE:TISC_DB_HANDLE);
begin
    inherited Create(AOwner);
    MainDataModule:=TMainDataModule.Create(Self);
    MainDataModule.MainDataBase.Connected:=False;
    MainDataModule.MainDataBase.Handle:=DB_HANDLE;
    FShowAccepted:=False;

 PBarLocate:=TZBarLocate.Create(BarManager);

 PBarLocate.DataSet := MainDataModule.OrdersListDataSet;
 PBarLocate.AddLocateItem('NUM_ORDER',
                           'Номер наказу',
                           [loCaseInsensitive,loPartialKey]);

end;

procedure TOrdersreestrViewForm.AcceptOrder();
begin

with MainDataModule do
  begin
    if not(OrdersListDataSet.IsEmpty)
    then
      begin
        OrderInsertProc.ParamByName('ID_ORDER').Value:=
          OrdersListDataSet['ID_ORDER'];
        WriteTransaction.StartTransaction;
        try
          OrderInsertProc.ExecProc;
          WriteTransaction.Commit;
        except on E:Exception
        do
          begin
            ZShowMessage('Помилка!',E.Message,mtError,[mbOk]);
            WriteTransaction.Rollback;
          end;
        end;
        end;
    end;

end;


procedure TOrdersReestrViewForm.RefreshList();
begin

    MainDataModule.OrdersListDataSet.CloseOpen(False);
    MainDataModule.OrdersListDataSet.Filter:='ID_STATUS=5';
    MainDataModule.OrdersListDataSet.Filtered:=True;

end;

function ShowOrdersReestr(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE):Variant;

begin
    OrdersReestrViewForm:=TOrdersReestrViewForm.Create(AOwner,DB_HANDLE);
    with OrdersReestrViewForm do

    begin

        MainDataModule.OrdersListDataSet.
                ParamByName('FILTER_BEG').Value:='01.01.1900';

        MainDataModule.OrdersListDataSet.
                ParamByName('FILTER_END').Value:='01.01.1900';

        MainDataModule.OrdersListDataSet.
                ParamByName('ID_PCARD').asInteger:=-1;


        RefreshList;

        Show;

    end;

end;




{$R *.dfm}

procedure TOrdersReestrViewForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action:=caFree;
end;

procedure TOrdersReestrViewForm.ExitBtnClick(Sender: TObject);
begin
    Close;
end;

procedure TOrdersReestrViewForm.AddOrderClick(Sender: TObject);
var
  OrdType:Integer;
begin

if (not FShowAccepted)
then
begin

   if(ReestrTableView.Controller.FocusedRow.Expandable)
   then
      begin
        ReestrTableView.Controller.GoToNext(True);
        OrdType:=MainDataModule.OrdersListDataSet['ID_ORDER_TYPE'];

        while (OrdType=MainDataModule.OrdersListDataSet['ID_ORDER_TYPE'])
        do
          begin

            AcceptOrder;
            ReestrTableView.Controller.GoToNext(True);

            if (ReestrTableView.Controller.IsFinish)
            then
              OrdType:=-255;

          end;

      end
      else
        AcceptOrder;

     RefreshList;
end;
end;

procedure TOrdersReestrViewForm.ReestrTableViewDblClick(Sender: TObject);
begin
{ if (not FShowAccepted)
    then
        AddOrderClick(Sender)
    else
        CancelBtnClick(Sender);}

end;

procedure TOrdersReestrViewForm.ReestrTableViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if Key=VK_RETURN
        then
        begin
            if (not FShowAccepted )
            then
                AddOrderClick(Sender)
            else
                CancelBtnClick(Sender);
        end;

end;

procedure TOrdersReestrViewForm.FilterOnOffBtnClick(Sender: TObject);
begin

    if FilterOnOffBtn.Down
    then
        begin
            MainDataModule.OrdersListDataSet.
                ParamByName('FILTER_BEG').Value:=DateToStr(DateCombo.Date);
            MainDataModule.OrdersListDataSet.
                ParamByName('FILTER_END').Value:=DateToStr(DateEndCombo.Date);

        end

    else
        begin

            MainDataModule.OrdersListDataSet.
                ParamByName('FILTER_BEG').Value:='01.01.1900';
            MainDataModule.OrdersListDataSet.
                ParamByName('FILTER_END').Value:='01.01.1900';

        end;


    RefreshList;


end;

procedure TOrdersReestrViewForm.DateComboChange(Sender: TObject);
begin
    if FilterOnOffBtn.Down
    then
        MainDataModule.OrdersListDataSet.
            ParamByName('FILTER_BEG').Value:=DateToStr(DateCombo.Date);

    RefreshList;

end;

procedure TOrdersReestrViewForm.Filter2OnOffBtnClick(Sender: TObject);
begin
    if (Filter2OnOffBtn.Down)
    then
        {Сохраняю старый текст запроса и меняю на новый}
        begin
            MainDataModule.OrdersListDataSet.Close;
            MainDataModule.OrdersListDataSet.RefreshSQL:=
                MainDataModule.OrdersListDataSet.SelectSQL;

            MainDataModule.OrdersListDataSet.SelectSQL:=
                MainDataModule.AcceptedOrdersDataSet.SelectSQL;

            MainDataModule.OrdersListDataSet.Open;
            FShowAccepted:=True;
            CancelBtn.Visible:=ivAlways;
            AddOrder.Visible:=ivNever;
        end

    else
        begin
            {Возвращаю старый текст запроса}
            MainDataModule.OrdersListDataSet.Close;

            MainDataModule.OrdersListDataSet.SelectSQL:=
                MainDataModule.OrdersListDataSet.RefreshSQL;
            MainDataModule.OrdersListDataSet.Open;
            FShowAccepted:=False;
            CancelBtn.Visible:=ivNever;
            AddOrder.Visible:=ivAlways;
        end;


end;

procedure TOrdersReestrViewForm.CancelBtnClick(Sender: TObject);
begin
if ( FShowAccepted)
then
begin

    with MainDataModule do
        begin
            if not(OrdersListDataSet.IsEmpty)
                then
                    begin
                        OrderDeleteProc.ParamByName('ID_ORDER').Value:=
                                    OrdersListDataSet['ID_ORDER'];

                        WriteTransaction.StartTransaction;

                        try
                            OrderDeleteProc.ExecProc;
                            WriteTransaction.Commit;
                        except on E:Exception
                        do
                            begin
                                ZShowMessage('Помилка!',E.Message,mtError,[mbOk]);
                                WriteTransaction.Rollback;
                            end;
                        end;
                    end;
        end;
    RefreshList;
end;

end;

procedure TOrdersReestrViewForm.dxBarButton3Click(Sender: TObject);
var
    ResArray:Variant;
    FIdMan:  Integer;
begin

    ResArray:=AllPeopleUnit.GetMan(Self,MainDataModule.MainDatabase.Handle);

    if (not VarIsNull(ResArray)) then
    begin
        ManEdit.Text:=ResArray[1]+'('+IntToStr(ResArray[10])+')';
        FIdMan:=ResArray[0];
        MainDataModule.GetIdPCardDataSet.ParamByName('ID_MAN').Value:=FIdMan;
        MainDataModule.GetIdPCardDataSet.CloseOpen(True);
        FIdPCard:=MainDataModule.GetIdPCardDataSet['ID_PCARD'];

    end;

   if (ManFilterBtn.Down) then
        MainDataModule.OrdersListDataSet.ParamByName('ID_PCARD').Value:=
                                                        FIdPCard;

    RefreshList;


end;

procedure TOrdersReestrViewForm.ManFilterBtnClick(Sender: TObject);
begin

    if (ManFilterBtn.Down) then
        MainDataModule.OrdersListDataSet.ParamByName('ID_PCARD').Value:=
                                                        FIdPCard
    else
        MainDataModule.OrdersListDataSet.ParamByName('ID_PCARD').asInteger:=-1;

   RefreshList;

end;

procedure TOrdersReestrViewForm.DateEndComboChange(Sender: TObject);
begin

    if FilterOnOffBtn.Down
    then
        MainDataModule.OrdersListDataSet.
            ParamByName('FILTER_END').Value:=DateToStr(DateEndCombo.Date);

    RefreshList;

end;

procedure TOrdersReestrViewForm.AcceptDataBtnClick(Sender: TObject);
var
WaitForm: TForm;
begin
  WaitForm:=ShowWaitForm(Self);
  MainDataModule.MovingsCreateProc.ParamByName('ID_SESSION').Value:=1;
  MainDataModule.MovingsCreateProc.ParamByName('PERIOD_BEG').Value:='01.01.1900';
  MainDataModule.MovingsCreateProc.ParamByName('PERIOD_END').Value:='01.01.2150';

  MainDataModule.BonusCreateProc.ParamByName('ID_SESSION').Value:=1;
  MainDataModule.BonusCreateProc.ParamByName('PERIOD_BEG').Value:='01.01.1900';
  MainDataModule.BonusCreateProc.ParamByName('PERIOD_END').Value:='01.01.2150';

  MainDataModule.WriteTransaction.StartTransaction;

  try
    MainDataModule.MovingsCreateProc.ExecProc;
    MainDataModule.BonusCreateProc.ExecProc;
    MainDataModule.WriteTransaction.Commit;
  except on E:Exception
  do
    begin
      ShowMessage(E.Message);
      MainDataModule.WriteTransaction.Rollback;
    end;
  end;
 CloseWaitForm(WaitForm);
end;

end.
