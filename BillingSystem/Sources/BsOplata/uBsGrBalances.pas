unit uBsGrBalances;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxLookAndFeelPainters, ActnList,
  StdCtrls, cxButtons, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxControls, cxGridCustomView, cxGrid, FIBQuery,
  pFIBQuery, pFIBStoredProc, ImgList, FIBDatabase, pFIBDatabase, cxClasses,
  FIBDataSet, pFIBDataSet, dxBar, dxBarExtItems, ExtCtrls, uImportPersAcc,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxTextEdit, cxContainer, cxLabel, RxMemDS,uCommon_Funcs, uConsts,
  uCommon_Messages, uConsts_Messages,uCommon_Types, math, cxSpinEdit, DateUtils;

type
  TfrmGrBalances = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    dxBarManager1: TdxBarManager;
    dxBarLargeButtonAdd: TdxBarLargeButton;
    SubItemAddByImport: TdxBarSubItem;
    SubItemAddByHand: TdxBarSubItem;
    dxBarLargeButtonEdit: TdxBarLargeButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarLargeButtonDel: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarSubItem2: TdxBarSubItem;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    Styles: TcxStyleRepository;
    BackGround: TcxStyle;
    FocusedRecord: TcxStyle;
    Header: TcxStyle;
    DesabledRecord: TcxStyle;
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
    cxGridTableViewStyleSheet2: TcxGridTableViewStyleSheet;
    DevExpress_Style: TcxGridTableViewStyleSheet;
    TransRead: TpFIBTransaction;
    DB: TpFIBDatabase;
    ImageList: TImageList;
    StoredProc: TpFIBStoredProc;
    GridBalance: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    BalanceActList: TActionList;
    ActionChange: TAction;
    ActionDel: TAction;
    ActionAdd: TAction;
    ActionRefresh: TAction;
    ActionClose: TAction;
    ActionTake: TAction;
    PopupImageList: TImageList;
    DataSetBalances: TpFIBDataSet;
    DataSetBalancesID_PAYMENT_CURRENT: TFIBIntegerField;
    DataSetBalancesKOD_PERIOD_FOR_ACC: TFIBSmallIntField;
    DataSetBalancesSUMMA_PAY: TFIBBCDField;
    DataSetBalancesID_TYPE_GROUP_BALANCE: TFIBSmallIntField;
    DataSetBalancesNAME_TYPE_GROUP_BALANCE: TFIBStringField;
    DataSourceBalances: TDataSource;
    ActionCancel: TAction;
    LabelSumAccAll: TcxLabel;
    TextEditSumAccAll: TcxTextEdit;
    LabelGrBalance: TcxLabel;
    BsGrBalanceBox: TcxLookupComboBox;
    LabelSumAcc: TcxLabel;
    TextEditSumAcc: TcxTextEdit;
    dxBarLargeButtonSaveAll: TdxBarLargeButton;
    DataSetGrBalances: TpFIBDataSet;
    TimeEnter: TTimer;
    DataSourceGrBalances: TDataSource;
    DataSetDate: TpFIBDataSet;
    ButtonSave: TcxButton;
    Panel2: TPanel;
    cxButton1: TcxButton;
    Panel4: TPanel;
    dxBarLargeButton1: TdxBarLargeButton;
    cxComboBoxMonth: TcxComboBox;
    cxSpinEditYear: TcxSpinEdit;
    cxLabel1: TcxLabel;
    DataSetBalancesMONTH_INT: TFIBIntegerField;
    DataSetBalancesYEAR_INT: TFIBIntegerField;
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure TextEditSumAccAllKeyPress(Sender: TObject; var Key: Char);
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionChangeExecute(Sender: TObject);
    procedure ActionDelExecute(Sender: TObject);
    procedure BsGrBalanceBoxClick(Sender: TObject);
    procedure TimeEnterTimer(Sender: TObject);
    procedure BsGrBalanceBoxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LabelGrBalanceClick(Sender: TObject);
    procedure BsGrBalanceBoxPropertiesInitPopup(Sender: TObject);
    procedure BsGrBalanceBoxExit(Sender: TObject);
    procedure ActionTakeExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure DataSetBalancesAfterScroll(DataSet: TDataSet);
  private
    myform               : TfrmImportPersAcc;
    id_dt_alloc_pers_acc : int64;
    flag_add_change      : integer;
    id_type_group_balance: integer;
    PLanguageIndex: byte;
  public
    constructor Create(AOwner: TComponent; dbase : TpFIBDatabase; mform : TfrmImportPersAcc);

  end;

{var
  frmGrBalances: TfrmGrBalances;}

implementation

{$R *.dfm}

constructor TfrmGrBalances.Create(AOwner: TComponent; dbase : TpFIBDatabase; mform : TfrmImportPersAcc);
begin
    inherited Create (AOwner);

    myform     := mform;

    Db                                  := DBase;

    DB.DefaultTransaction               := TransRead;
    TransRead.DefaultDatabase           := DB;


    DataSetBalances.Database            := DB;
    DataSetBalances.Transaction         := TransRead;

    DataSetGrBalances.Database          := DB;
    DataSetGrBalances.Transaction       := TransRead;

    DataSetDate.Database                := DB;
    DataSetDate.Transaction             := TransRead;

    StoredProc.Database                 := DB;
    StoredProc.Transaction              := TransRead;

    TransRead.StartTransaction;

    id_dt_alloc_pers_acc                := strtoint64(myform.DataSetPersAcc.fbn('ID_DT_ALLOC_PERS_AC').AsString);

    {date_beg                            := myform.DataSetPersAcc.fbn('date_beg_period_for_acc').AsString ;
    date_beg_period_for_acc             := StrToDate('01'+copy(date_beg, 3, 8));

    DataSetDate.Close;
    DataSetDate.SQLs.SelectSQL.Text     := 'select * from Z_CONVERT_DATE_TO_KOD('''+datetostr(date_beg_period_for_acc)+''')';;
    DataSetDate.Open;

    kod_period :=  DataSetDate.fbn('KOD_SETUP').AsInteger;      }

    DataSetBalances.Close;
    DataSetBalances.SQLs.SelectSQL.Text := 'select * from BS_PAYMENT_CURRENT_SEL('''+inttostr(id_dt_alloc_pers_acc)+''')';;
    DataSetBalances.Open;
    DataSetBalances.FetchAll;

    TextEditSumAccAll.Text              := floattostr(myform.DataSetPersAcc.fbn('SUM_OPL').AsFloat);
end;

procedure TfrmGrBalances.ActionCloseExecute(Sender: TObject);
begin
    close;
end;

procedure TfrmGrBalances.ActionCancelExecute(Sender: TObject);
begin
     dxBarLargeButton1.Enabled        := false;
     dxBarLargeButtonAdd.Enabled     := true;
     dxBarLargeButtonEdit.Enabled    := true;
     dxBarLargeButtondEL.Enabled     := true;
     Panel2.Visible                  := false;
end;

procedure TfrmGrBalances.TextEditSumAccAllKeyPress(Sender: TObject;
  var Key: Char);
begin
    key := chr(0);
end;

procedure TfrmGrBalances.ActionAddExecute(Sender: TObject);
begin
     Panel2.Visible                   := true;
     dxBarLargeButtonEdit.Enabled     := false;
     dxBarLargeButtonDel.Enabled      := false;
     dxBarLargeButton1.Enabled        := false;
     flag_add_change                  := 1;

     TextEditSumAcc.Text              := '';
     BsGrBalanceBox.Text              := '';
     id_type_group_balance            := 0;

     cxComboBoxMonth.ItemIndex        := monthOf(date)-1;
     cxSpinEditYear.Value             := YearOf(date);
end;

procedure TfrmGrBalances.ActionChangeExecute(Sender: TObject);
begin
     Panel2.Visible                   := true;
     dxBarLargeButtonAdd.Enabled      := false;
     dxBarLargeButtonDel.Enabled      := false;
     dxBarLargeButton1.Enabled        := false;

     flag_add_change                  := 2;
     
     TextEditSumAcc.Text              := DataSetBalances['SUMMA_PAY'];
     BsGrBalanceBox.Text              := DataSetBalances['NAME_TYPE_GROUP_BALANCE'];
     id_type_group_balance            := DataSetBalances['ID_TYPE_GROUP_BALANCE'];
     cxComboBoxMonth.ItemIndex        := DataSetBalances['month_int']-1;
     cxSpinEditYear.Value             := DataSetBalances['year_int'];
end;

procedure TfrmGrBalances.ActionDelExecute(Sender: TObject);
var
     i : byte;
begin
     i:= uCommon_Messages.bsShowMessage(uConsts.bs_Confirmation_Caption[PLanguageIndex], 'Ви дійсно бажаєте видалити '+' '+'?', mtConfirmation, [mbYes, mbNo]);
     if ((i = 7) or (i= 2)) then exit;
     TransRead.StartTransaction;
     try
          StoredProc.StoredProcName := 'BS_PAYMENT_CURRENT_DEL';
          StoredProc.Prepare;

          StoredProc.ParamByName('ID_PAYMENT_CURRENT').AsInteger    := DataSetBalances['ID_PAYMENT_CURRENT'];

          StoredProc.ExecProc;
          TransRead.Commit;

          myform.ActionRefreshExecute(Sender);
          ActionRefreshExecute(Sender);
     except
         begin
             TransRead.Rollback;
             Showmessage('При додаванні виникла помилка');
              exit;
         end;
     end;
end;

procedure TfrmGrBalances.BsGrBalanceBoxClick(Sender: TObject);
begin
     TimeEnter.Enabled:=False;
end;


procedure TfrmGrBalances.TimeEnterTimer(Sender: TObject);
begin
    TimeEnter.Enabled := False;
    DataSetGrBalances.Close;
    DataSetGrBalances.SQLs.SelectSQL.Text := 'SELECT DISTINCT * FROM BS_SP_TYPE_GROUP_BALANCE_FILTER(:FILTER_STR)';
    DataSetGrBalances.ParamByName('FILTER_STR').AsString := BsGrBalanceBox.EditText;
    DataSetGrBalances.Open;
    if not DataSetGrBalances.IsEmpty then
    begin
         BsGrBalanceBox.DroppedDown:=True;
    end;
    BsGrBalanceBox.Properties.GridMode:=True;
end;

procedure TfrmGrBalances.BsGrBalanceBoxKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if ((Ord(Key)=VK_RETURN) and (ssCtrl in Shift)) then
          LabelGrBalanceClick(Sender)
    else
    begin
        if BsGrBalanceBox.EditText='' then
           if DataSetGrBalances.Active then
                DataSetGrBalances.Close;
        TimeEnter.Enabled:=not (BsGrBalanceBox.EditText='');
    end;

end;

procedure TfrmGrBalances.LabelGrBalanceClick(Sender: TObject);
begin
//
end;

procedure TfrmGrBalances.BsGrBalanceBoxPropertiesInitPopup(
  Sender: TObject);
begin
   if BsGrBalanceBox.EditText='' then
   begin
      DataSetGrBalances.Close;
      DataSetGrBalances.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_SP_TYPE_GROUP_BALANCE_FILTER(:FILTER_STR)';
      DataSetGrBalances.ParamByName('FILTER_STR').AsString:=BsGrBalanceBox.EditText;
      DataSetGrBalances.Open;
      BsGrBalanceBox.Properties.GridMode:=True;
   end;
end;

procedure TfrmGrBalances.BsGrBalanceBoxExit(Sender: TObject);
begin
   BsGrBalanceBox.Properties.GridMode:=False;
   TimeEnter.Enabled:=False;

    id_type_group_balance := DataSetGrBalances['ID_TYPE_GROUP_BALANCE'];
end;

procedure TfrmGrBalances.ActionTakeExecute(Sender: TObject);
begin
    if (flag_add_change=1) then
    begin
         TransRead.StartTransaction;
         try
              StoredProc.StoredProcName := 'BS_PAYMENT_CURRENT_INSERT';
              StoredProc.Prepare;

              StoredProc.ParamByName('IN_SUMMA_PAY').AsCurrency            := strtocurr(TextEditSumAcc.Text);
              StoredProc.ParamByName('IN_ID_TYPE_GROUP_BALANCE').AsInteger := id_type_group_balance;
              StoredProc.ParamByName('IN_ID_DT_ALLOC_ACC').AsInt64         := id_dt_alloc_pers_acc;
              StoredProc.ParamByName('IN_Month').AsInteger                 := cxComboBoxMonth.ItemIndex+1;
              StoredProc.ParamByName('IN_YEAR').AsInteger                  := cxSpinEditYear.Value;

              StoredProc.ExecProc;

              TransRead.Commit;

              myform.ActionRefreshExecute(Sender);
              myform.DataSetPersAcc.Locate('ID_DT_ALLOC_PERS_AC', id_dt_alloc_pers_acc, []);
              ActionRefreshExecute(Sender);
         except
             begin
                 TransRead.Rollback;
                 Showmessage('При додаванні виникла помилка');
                 exit;
             end;
         end;
    end else
    if (flag_add_change=2) then
    begin
         TransRead.StartTransaction;
         try
              StoredProc.StoredProcName := 'BS_PAYMENT_CURRENT_UPD';
              StoredProc.Prepare;

              StoredProc.ParamByName('IN_ID_PAYMENT_CURRENT').AsInteger    := DataSetBalances['ID_PAYMENT_CURRENT'];
              StoredProc.ParamByName('IN_SUMMA_PAY').AsCurrency            := strtocurr(TextEditSumAcc.Text);
              StoredProc.ParamByName('IN_ID_TYPE_GROUP_BALANCE').AsInteger := id_type_group_balance;
              StoredProc.ParamByName('IN_ID_DT_ALLOC_ACC').AsInt64         := id_dt_alloc_pers_acc;
              StoredProc.ParamByName('IN_MONTH').AsInteger                 := cxComboBoxMonth.ItemIndex+1;
              StoredProc.ParamByName('IN_YEAR').AsInteger                  := cxSpinEditYear.Value;

              StoredProc.ExecProc;

              TransRead.Commit;
              //DataSetBalances.Locate('id_payment_current', id_payment_current, []);
              myform.ActionRefreshExecute(Sender);
              ActionRefreshExecute(Sender);
         except
             begin
                 TransRead.Rollback;
                 Showmessage('При додаванні виникла помилка');
                  exit;
             end;
         end;
    end;
    ActionCancelExecute(Sender);
end;

procedure TfrmGrBalances.ActionRefreshExecute(Sender: TObject);
begin
     DataSetBalances.CloseOpen(true);
end;

procedure TfrmGrBalances.DataSetBalancesAfterScroll(DataSet: TDataSet);
begin
     if(DataSetBalances['SUMMA_PAY']<>null) then TextEditSumAcc.Text              := DataSetBalances['SUMMA_PAY']
     else TextEditSumAcc.Text              := '';
     if(DataSetBalances['NAME_TYPE_GROUP_BALANCE']<>null) then BsGrBalanceBox.Text              := DataSetBalances['NAME_TYPE_GROUP_BALANCE']
     else TextEditSumAcc.Text              := '';
     if(DataSetBalances['ID_TYPE_GROUP_BALANCE']<>null) then id_type_group_balance            := DataSetBalances['ID_TYPE_GROUP_BALANCE']
     else id_type_group_balance              := 0;
     if(DataSetBalances['month_int']<>null) then cxComboBoxMonth.ItemIndex        := DataSetBalances['month_int']-1
     else cxComboBoxMonth.ItemIndex        := monthOf(date)-1;
     if(DataSetBalances['year_int']<>null) then cxSpinEditYear.Value             := DataSetBalances['year_int']
     else cxSpinEditYear.Value               := YearOf(date);

end;

end.
