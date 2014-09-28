unit UBalance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxGraphics, cxCustomData, cxStyles, cxTL,
  cxMaskEdit, cxInplaceContainer, cxDBTL, cxTLData, cxPC, cxControls,
  StdCtrls, cxButtons, ExtCtrls, frxDock, FIBDatabase, pFIBDatabase, IBase,
  DB, FIBDataSet, pFIBDataSet, cxCurrencyEdit, cxContainer, cxEdit,
  cxTextEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, cxSplitter, cxFilter, cxData, cxDataStorage,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  UAddEditBalance, UBalanceSetupProp, FIBQuery, pFIBQuery, pFIBStoredProc,
  cxCheckComboBox, cxShellComboBox, Buttons, cxCheckBox, ActnList,
  frxClass, frxDBSet, frxDesgn, ComCtrls, cxMemo, cxLabel, Menus, RxMenus,
  cxCalendar, frxExportHTML, frxExportXLS, frxExportRTF;

type
  TfrmBalance = class(TForm)
    PageControl: TcxPageControl;
    ActivSheet: TcxTabSheet;
    PassivSheet: TcxTabSheet;
    cxDBTreeListPassive: TcxDBTreeList;
    cxDBTreeList1: TcxDBTreeListColumn;
    cxDBTreeList2: TcxDBTreeListColumn;
    cxDBTreeList3: TcxDBTreeListColumn;
    cxDBTreeList4: TcxDBTreeListColumn;
    cxDBTreeList5: TcxDBTreeListColumn;
    cxDBTreeListActive: TcxDBTreeList;
    cxDBTreeList6: TcxDBTreeListColumn;
    cxDBTreeList7: TcxDBTreeListColumn;
    cxDBTreeList8: TcxDBTreeListColumn;
    cxDBTreeList9: TcxDBTreeListColumn;
    cxDBTreeList10: TcxDBTreeListColumn;
    cxDBTreeList11: TcxDBTreeListColumn;
    Balance_Print: TPanel;
    btnADD_balance_setup: TcxButton;
    btnEDIT_balance_setup: TcxButton;
    btnDEL_balance_setup: TcxButton;
    btnPrint_balance_setup: TcxButton;
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    DSet_ActiveBalance: TpFIBDataSet;
    DSet_PassiveBalance: TpFIBDataSet;
    DSourceActive: TDataSource;
    DSourcePassiv: TDataSource;
    cxSplitter1: TcxSplitter;
    SP_Balance_Panel: TPanel;
    Panel: TPanel;
    SP_Balance_View: TcxGridDBTableView;
    cxGrid_SP_BalanceLevel1: TcxGridLevel;
    cxGrid_SP_Balance: TcxGrid;
    btnADD_balance: TcxButton;
    btnEDIT_balance: TcxButton;
    btnDEL_balance: TcxButton;
    DSet_SP_Balance: TpFIBDataSet;
    DSource_SP_Balance: TDataSource;
    SP_Balance_ViewDBColumn1: TcxGridDBColumn;
    SP_Balance_ViewDBColumn2: TcxGridDBColumn;
    SP_Balance_ViewDBColumn3: TcxGridDBColumn;
    SP_Balance_ViewDBColumn4: TcxGridDBColumn;
    SP_Balance_ViewDBColumn5: TcxGridDBColumn;
    Panel_BALANCE_Name: TPanel;
    pFIBStoredProc: TpFIBStoredProc;
    Button_BalanceName: TcxButton;
    pFIBQuery: TpFIBQuery;
    ActionList1: TActionList;
    act_exit: TAction;
    act_ADD: TAction;
    act_DEL: TAction;
    act_EDIT: TAction;
    WriteTransaction: TpFIBTransaction;
    act_refresh: TAction;
    frxDBDataset_Active: TfrxDBDataset;
    frxDBDataset_Passive: TfrxDBDataset;
    act_Print: TAction;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxEditStyleController1: TcxEditStyleController;
    act_Design: TAction;
    frxDesigner1: TfrxDesigner;
    btnEXIT1: TcxButton;
    btn_CheckInSch: TcxButton;
    Panel_NotIncludedSch: TPanel;
    DSet_NotIncludedSch: TpFIBDataSet;
    Lbl_sch: TcxLabel;
    Button_HideSCH: TcxButton;
    Grid_NotInSchDBView: TcxGridDBTableView;
    Grid_NotIncludedSchLevel1: TcxGridLevel;
    Grid_NotIncludedSch: TcxGrid;
    DSource_NotIncludedSch: TDataSource;
    Grid_NotIncludedSchColumn_ID_SCH: TcxGridDBColumn;
    Grid_NotIncludedSchColumn_SCH_NUMBER: TcxGridDBColumn;
    GroupBox_Sch: TGroupBox;
    Lbl_TotalOutSch: TcxLabel;
    PopupMenu_OutSch: TPopupMenu;
    PopupMenu_AddPlus: TMenuItem;
    PopupMenu_AddMinus: TMenuItem;
    ComboBox_Year: TcxComboBox;
    ComboBox_Month: TcxComboBox;
    PanelDate: TcxMaskEdit;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    cxDBTreeList12: TcxDBTreeListColumn;
    cxDBTreeList13: TcxDBTreeListColumn;
    frxRTFExport1: TfrxRTFExport;
    frxXLSExport1: TfrxXLSExport;
    frxHTMLExport1: TfrxHTMLExport;
    cxDBTreeListActivecxDBTreeListColumn1: TcxDBTreeListColumn;
    cxStyle2: TcxStyle;
    cxDBTreeListPassivecxDBTreeListColumn1: TcxDBTreeListColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnEXITClick(Sender: TObject);
    procedure cxSplitter1AfterClose(Sender: TObject);
    procedure cxSplitter1AfterOpen(Sender: TObject);
    procedure DSet_SP_BalanceAfterScroll(DataSet: TDataSet);
    procedure btnADD_balanceClick(Sender: TObject);
    procedure btnEDIT_balanceClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnDEL_balanceClick(Sender: TObject);
    procedure btnADD_balance_setupClick(Sender: TObject);
    procedure btnEDIT_balance_setupClick(Sender: TObject);
    procedure btnDEL_balance_setupClick(Sender: TObject);
    procedure Button_BalanceNameClick(Sender: TObject);
    procedure act_exitExecute(Sender: TObject);
    procedure act_ADDExecute(Sender: TObject);
    procedure act_refreshExecute(Sender: TObject);
    procedure act_EDITExecute(Sender: TObject);
    procedure act_DELExecute(Sender: TObject);
    procedure act_PrintExecute(Sender: TObject);
    procedure act_DesignExecute(Sender: TObject);
    procedure btn_CheckInSchClick(Sender: TObject);
    procedure Button_HideSCHClick(Sender: TObject);
    procedure PopupMenu_AddPlusClick(Sender: TObject);
    procedure PopupMenu_AddMinusClick(Sender: TObject);
    procedure ComboBox_MonthKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ComboBox_DatePropertiesChange(Sender: TObject);
    procedure frxReport1GetValue(const VarName: String;
      var Value: Variant);
    procedure cxDBTreeListActiveStylesGetContentStyle(Sender,
      AItem: TObject; ANode: TcxTreeListNode; var AStyle: TcxStyle);
    procedure cxDBTreeListPassiveStylesGetContentStyle(Sender,
      AItem: TObject; ANode: TcxTreeListNode; var AStyle: TcxStyle);
  private
    PeriodDate: TDate;
    design_mode: Boolean;
  public
    constructor Create( AOwner:TComponent; DB_handle: TISC_DB_HANDLE; BegDate: TDate; id_user:int64);overload;
  end;

implementation

uses getBalance, USetFilter, GlobalSPR, DateUtils, UDbKrSch, Resources_unitb;

{$R *.dfm}

constructor TfrmBalance.Create( AOwner:TComponent; DB_handle: TISC_DB_HANDLE; BegDate: TDate; id_user:int64);
var
  i: integer;
begin
    Inherited Create(AOwner);
    DB.Handle:=DB_handle;
    DB.Connected:=True;
    self.PeriodDate:=BegDate;
    design_mode:=false;

    btnADD_balance_setup.Caption      := getBalance.btn_Add;
    btnADD_balance.Caption            := getBalance.btn_Add;
    btnEDIT_balance.Caption           := getBalance.btn_Edit;
    btnEDIT_balance_setup.Caption     := getBalance.btn_Edit;
    btnDEL_balance.Caption            := getBalance.btn_Del;
    btnDEL_balance_setup.Caption      := getBalance.btn_Del;
    btnPrint_balance_setup.Caption    := getBalance.btn_Print;
    btnEXIT1.Caption                  := getBalance.btn_Exit;
    btn_CheckInSch.Caption            := getBalance.btn_CheckInSch;
    btn_CheckInSch.Hint               := getBalance.btnhint_CheckInSch;

    PageControl.Pages[0].Caption      := getBalance.page_Active;
    PageControl.Pages[1].Caption      := getBalance.page_Passive;

    cxDBTreeList2.Caption.Text        := getBalance.column_Name;
    cxDBTreeList3.Caption.Text        := getBalance.column_Code;
    cxDBTreeList4.Caption.Text        := getBalance.column_BegYear;
    cxDBTreeList5.Caption.Text        := getBalance.column_EndPeriod;

    cxDBTreeList7.Caption.Text        := getBalance.column_Name;
    cxDBTreeList8.Caption.Text        := getBalance.column_Code;
    cxDBTreeList9.Caption.Text        := getBalance.column_BegYear;
    cxDBTreeList10.Caption.Text       := getBalance.column_EndPeriod;

    SP_Balance_ViewDBColumn2.Caption  := getBalance.column_BalanceName;
    SP_Balance_ViewDBColumn3.Caption  := getBalance.column_DKUD;
    SP_Balance_ViewDBColumn4.Caption  := getBalance.column_KODU;
    SP_Balance_ViewDBColumn5.Caption  := getBalance.column_RoundTo;

    GroupBox_Sch.Caption:=getBalance.Lbl_NotIncludedSch;
    PageControl.ActivePageIndex:=0;
    self.Caption:=getBalance.frmCap_BalanceMain;
    Panel_NotIncludedSch.Visible:=False;

    ComboBox_Month.Properties.Items.Add(TRIM(BU_Month_12));
    ComboBox_Month.Properties.Items.Add(TRIM(BU_Month_11));
    ComboBox_Month.Properties.Items.Add(TRIM(BU_Month_10));
    ComboBox_Month.Properties.Items.Add(TRIM(BU_Month_09));
    ComboBox_Month.Properties.Items.Add(TRIM(BU_Month_08));
    ComboBox_Month.Properties.Items.Add(TRIM(BU_Month_07));
    ComboBox_Month.Properties.Items.Add(TRIM(BU_Month_06));
    ComboBox_Month.Properties.Items.Add(TRIM(BU_Month_05));
    ComboBox_Month.Properties.Items.Add(TRIM(BU_Month_04));
    ComboBox_Month.Properties.Items.Add(TRIM(BU_Month_03));
    ComboBox_Month.Properties.Items.Add(TRIM(BU_Month_02));
    ComboBox_Month.Properties.Items.Add(TRIM(BU_Month_01));

    for i:=BASE_YEAR+YEARS_COUNT downto BASE_YEAR do
        ComboBox_Year.Properties.Items.Add(inttostr(i));

    ComboBox_Year.ItemIndex:=BASE_YEAR+YEARS_COUNT-YearOf(PeriodDate);
    ComboBox_Month.ItemIndex:=12-MonthOf(PeriodDate);
end;

procedure TfrmBalance.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action:=caFree;
end;

procedure TfrmBalance.FormCreate(Sender: TObject);
begin
    //SendMessage(self.handle,WM_SIZE,SIZE_MAXIMIZED,0);
    if DSet_SP_Balance.Active then DSet_SP_Balance.Close;
    DSet_SP_Balance.SelectSQL.Text:='select * from PUB_SP_BALANCE order by ID_BALANCE';
    DSet_SP_Balance.Open;

    if DSet_ActiveBalance.Active then DSet_ActiveBalance.Close;
    DSet_ActiveBalance.SelectSQL.Text:='select * from PUB_SP_BALANCE_SCH_CALCULATION('''+DateToStr(PeriodDate)+''',0,?ID_BALANCE) order by ORDER_CODE';
    DSet_ActiveBalance.Open;
    //showmessage(DSet_ActiveBalance.SelectSQL.Text);

    if DSet_PassiveBalance.Active then DSet_PassiveBalance.Close;
    DSet_PassiveBalance.SelectSQL.Text:='select * from PUB_SP_BALANCE_SCH_CALCULATION('''+DateToStr(PeriodDate)+''',1,?ID_BALANCE) order by ORDER_CODE';
    DSet_PassiveBalance.Open;

    cxDBTreeListActive.FullExpand;
    cxDBTreeListPassive.FullExpand;
end;

procedure TfrmBalance.btnEXITClick(Sender: TObject);
begin
    close;
end;

procedure TfrmBalance.cxSplitter1AfterClose(Sender: TObject);
begin
    if PageControl.ActivePageIndex=0 then cxDBTreeListActive.SetFocus;
    if PageControl.ActivePageIndex=1 then cxDBTreeListPassive.SetFocus;
end;

procedure TfrmBalance.cxSplitter1AfterOpen(Sender: TObject);
begin
    cxGrid_SP_Balance.SetFocus;
end;

procedure TfrmBalance.DSet_SP_BalanceAfterScroll(DataSet: TDataSet);
begin
    Button_BalanceName.Caption:=DSet_SP_Balance.FBN('BALANCE_NAME').AsString;
    cxDBTreeListActive.FullExpand;
    cxDBTreeListPassive.FullExpand;
    Lbl_sch.Caption:='"'+DSet_SP_Balance.FBN('BALANCE_NAME').AsString+'"';
    Lbl_TotalOutSch.Caption:='Загалом  '+IntToStr(DSet_NotIncludedSch.RecordCount)+'       ';
end;

procedure TfrmBalance.FormShow(Sender: TObject);
begin
    Button_BalanceNameClick(Sender);
    Button_HideSCH.BringToFront;
end;

procedure TfrmBalance.btnADD_balanceClick(Sender: TObject);
var
  T: TfrmAddEditBalance;
  d: int64;
begin
    T:=TfrmAddEditBalance.Create(self);
    if not DSet_SP_Balance.IsEmpty then d:=DSet_SP_Balance['ID_BALANCE'];
    if T.ShowModal=mrYes then
    begin
        pFIBStoredProc.StoredProcName:='PUB_SP_BALANCE_INS';
        try
        pFIBStoredProc.Prepare;
        pFIBStoredProc.ParamByName('BALANCE_NAME').AsString:=T.TextEdit_BalanceName.Text;
        pFIBStoredProc.ParamByName('DKUD').AsString:=T.TextEdit_DKUD.Text;
        pFIBStoredProc.ParamByName('KODU').AsString:=T.TextEdit_KODU.Text;
        pFIBStoredProc.ParamByName('CODE_VYDATKIV').AsString:=T.TextEdit_CodeVyd.Text;
        pFIBStoredProc.ParamByName('ROUND_TO').AsString:=T.cxComboBox1.EditText;
        pFIBStoredProc.Transaction.StartTransaction;
        pFIBStoredProc.ExecProc;
        d:=pFIBStoredProc.FieldByName('ID_BALANCE').AsInt64;
        pFIBStoredProc.Transaction.Commit;
        except on E:Exception
        do  begin pFIBStoredProc.Transaction.Rollback;
                  ShowMessage(E.Message);
            end;
        end;
    end;
    act_refreshExecute(Sender);
    if not DSet_SP_Balance.IsEmpty then DSet_SP_Balance.Locate('ID_BALANCE',d,[]);
    cxGrid_SP_Balance.SetFocus;
end;

procedure TfrmBalance.btnEDIT_balanceClick(Sender: TObject);
var
  T: TfrmAddEditBalance;
  d,e,f: int64;
begin
    if DSet_SP_Balance.IsEmpty then exit;
    if Panel_NotIncludedSch.Visible and not DSet_NotIncludedSch.IsEmpty
    then f:=DSet_NotIncludedSch.FBN('ID_SCH').AsInteger
    else f:=-1;    
    T:=TfrmAddEditBalance.Create(self);
    T.Caption:=getBalance.frmCap_EditBalance;
    T.TextEdit_BalanceName.Text:=DSet_SP_Balance.FieldByName('BALANCE_NAME').AsString;
    T.TextEdit_DKUD.Text:=DSet_SP_Balance.FieldByName('DKUD').AsString;
    T.TextEdit_KODU.Text:=DSet_SP_Balance.FieldByName('KODU').AsString;
    T.TextEdit_CodeVyd.Text:=DSet_SP_Balance.FieldByName('CODE_VYDATKIV').AsString;
    T.cxComboBox1.EditText:=DSet_SP_Balance.FieldByName('ROUND_TO').AsString;
    d:=DSet_SP_Balance['ID_BALANCE'];
    if PageControl.ActivePageIndex=0 then e:=DSet_ActiveBalance.FBN('ID_BALANCE_SETUP').AsInteger
                                    else e:=DSet_PassiveBalance.FBN('ID_BALANCE_SETUP').AsInteger;
    if T.ShowModal=mrYes then
    begin
        pFIBStoredProc.StoredProcName:='PUB_SP_BALANCE_UPD';
        try
        pFIBStoredProc.Prepare;
        pFIBStoredProc.ParamByName('ID_BALANCE').AsString:=DSet_SP_Balance['ID_BALANCE'];
        pFIBStoredProc.ParamByName('BALANCE_NAME').AsString:=T.TextEdit_BalanceName.Text;
        pFIBStoredProc.ParamByName('DKUD').AsString:=T.TextEdit_DKUD.Text;
        pFIBStoredProc.ParamByName('KODU').AsString:=T.TextEdit_KODU.Text;
        pFIBStoredProc.ParamByName('CODE_VYDATKIV').AsString:=T.TextEdit_CodeVyd.Text;
        pFIBStoredProc.ParamByName('ROUND_TO').AsString:=T.cxComboBox1.EditText;
        pFIBStoredProc.Transaction.StartTransaction;
        pFIBStoredProc.ExecProc;
        pFIBStoredProc.Transaction.Commit;
        except on E:Exception
        do  begin pFIBStoredProc.Transaction.Rollback;
                  ShowMessage(E.Message);
            end;
        end;
    end;
    act_refreshExecute(Sender);
    if not DSet_SP_Balance.IsEmpty then DSet_SP_Balance.Locate('ID_BALANCE',d,[]);
    if Panel_NotIncludedSch.Visible and not DSet_NotIncludedSch.IsEmpty and (f<>-1)
    then DSet_NotIncludedSch.Locate('ID_SCH',f,[]);
    if (PageControl.ActivePageIndex=0) and (not DSet_ActiveBalance.IsEmpty)
    then DSet_ActiveBalance.Locate('ID_BALNCE_SETUP',e,[]);
    if (PageControl.ActivePageIndex=1) and (not DSet_PassiveBalance.IsEmpty)
    then DSet_PassiveBalance.Locate('ID_BALNCE_SETUP',e,[]);
    cxGrid_SP_Balance.SetFocus;
end;

procedure TfrmBalance.btnDEL_balanceClick(Sender: TObject);
begin
    if DSet_SP_Balance.IsEmpty then exit;
    if MessageBox(self.Handle,PChar(msg_Del+#13+DSet_SP_Balance.FBN('BALANCE_NAME').asString+#63),getBalance.frmCap_Delete,MB_YESNO or MB_ICONWARNING)=mryes then
    begin
        pFIBStoredProc.StoredProcName:='PUB_SP_BALANCE_DEL';
        try
        pFIBStoredProc.Prepare;
        pFIBStoredProc.ParamByName('ID_BALANCE').AsInt64:=DSet_SP_Balance['ID_BALANCE'];
        pFIBStoredProc.Transaction.StartTransaction;
        pFIBStoredProc.ExecProc;
        pFIBStoredProc.Transaction.Commit;
        except on E:Exception
        do  begin pFIBStoredProc.Transaction.Rollback;
                  ShowMessage(E.Message);
            end;
        end;
    end;
    act_refreshExecute(Sender);
    cxGrid_SP_Balance.SetFocus;
end;

procedure TfrmBalance.btnADD_balance_setupClick(Sender: TObject);
var
  d,e,f: Int64;
  T: TfrmBalanceSetupProp;
begin
    if DSet_SP_Balance.IsEmpty then exit;
    d:=DSet_SP_Balance.FBN('ID_BALANCE').AsInteger;
    if (PageControl.ActivePageIndex=0) and (not DSet_ActiveBalance.IsEmpty)
    then e:=DSet_ActiveBalance.FBN('ID_BALANCE_SETUP').AsInteger;
    if (PageControl.ActivePageIndex=1) and (not DSet_PassiveBalance.IsEmpty)
    then e:=DSet_PassiveBalance.FBN('ID_BALANCE_SETUP').AsInteger;
    if Panel_NotIncludedSch.Visible and not DSet_NotIncludedSch.IsEmpty
    then f:=DSet_NotIncludedSch.FBN('ID_SCH').AsInteger
    else f:=-1;
        
    T:=TfrmBalanceSetupProp.Create(self,-1,d);
    T.Caption:=getBalance.frmCap_BalanceSetupAdd;
    T.CheckBox_root.Visible:=true;
    if ((PageControl.ActivePageIndex=0) and (DSet_ActiveBalance.IsEmpty)) or ((PageControl.ActivePageIndex=1) and (DSet_PassiveBalance.IsEmpty))
    then begin
        T.CheckBox_root.Checked:=true;
        T.CheckBox_root.Enabled:=false;
    end;

    T.LFormula.Enabled:=false;
    T.cxGrid1.Enabled:=false;
    T.Button_plusSch.Enabled:=false;
    T.Button_minusSch.Enabled:=false;
    T.Button_DelSch.Enabled:=false;
    T.TextEdit_Formula.Enabled:=false;
    T.Height:=200;
    if T.ShowModal=mrOk
    then begin
        pFIBStoredProc.StoredProcName:='PUB_SP_BALANCE_SETUP_INS';
        try
        pFIBStoredProc.Prepare;
        pFIBStoredProc.ParamByName('ID_BALANCE').AsInt64:=DSet_SP_Balance['ID_BALANCE'];
        pFIBStoredProc.ParamByName('NAME').AsString:=T.TextEdit_BalanceSetupName.Text;
        pFIBStoredProc.ParamByName('BALANCE_TYPE').AsString:=inttostr(PageControl.ActivePageIndex);

        if T.MaskEdit_LineCode.Text<>''
        then pFIBStoredProc.ParamByName('LINE_CODE').AsInteger:=strtoint(T.MaskEdit_LineCode.Text)
        else pFIBStoredProc.ParamByName('LINE_CODE').AsVariant:=null;

        if T.MaskEdit_OrderCode.Text<>''
        then pFIBStoredProc.ParamByName('ORDER_CODE').AsInteger:=strtoint(T.MaskEdit_OrderCode.Text)
        else pFIBStoredProc.ParamByName('ORDER_CODE').AsVariant:=null;

        if T.CheckBox_root.Checked
        then begin
            pFIBStoredProc.ParamByName('LINK_TO').AsInteger:=-1;
            pFIBStoredProc.ParamByName('FORMULA_TYPE').AsString:='0';
        end else begin
            pFIBStoredProc.ParamByName('LINK_TO').AsInteger:=e;

        if T.CheckBox_no_summ.Checked then
          pFIBStoredProc.ParamByName('NO_SUMM').AsInteger:=1
        else
          pFIBStoredProc.ParamByName('NO_SUMM').AsInteger:=0;

          pFIBStoredProc.ParamByName('FORMULA_TYPE').AsString:=IntToStr(T.RadioGroup_FormulaType.ItemIndex);
        end;
        pFIBStoredProc.Transaction.StartTransaction;
        pFIBStoredProc.ExecProc;
        e:=pFIBStoredProc.FldByName['ID_BALANCE_SETUP'].AsInt64;
        pFIBStoredProc.Transaction.Commit;
        except on E:Exception
        do  begin pFIBStoredProc.Transaction.Rollback;
                  ShowMessage(E.Message);
            end;
        end;
    end;
    T.Free;
    act_refreshExecute(Sender);
    if not DSet_SP_Balance.IsEmpty  then DSet_SP_Balance.Locate('ID_BALANCE',d,[]);
    if Panel_NotIncludedSch.Visible and not DSet_NotIncludedSch.IsEmpty and (f<>-1)
    then DSet_NotIncludedSch.Locate('ID_SCH',f,[]);
    if (PageControl.ActivePageIndex=0) and (not DSet_ActiveBalance.IsEmpty) then
    begin
        DSet_ActiveBalance.Locate('ID_BALANCE_SETUP',e,[]);
        cxDBTreeListActive.SetFocus;
    end;
    if (PageControl.ActivePageIndex=1) and (not DSet_PassiveBalance.IsEmpty) then
    begin
        DSet_PassiveBalance.Locate('ID_BALANCE_SETUP',e,[]);
        cxDBTreeListPassive.SetFocus;
    end;
end;

procedure TfrmBalance.btnEDIT_balance_setupClick(Sender: TObject);
var
  d,e,f: int64;
  T: TfrmBalanceSetupProp;
begin
    if (PageControl.ActivePageIndex=0) and DSet_ActiveBalance.IsEmpty then exit;
    if (PageControl.ActivePageIndex=1) and DSet_PassiveBalance.IsEmpty then exit;
    d:=DSet_SP_Balance.FBN('ID_BALANCE').AsInteger;

    if (PageControl.ActivePageIndex=0)
    then e:=DSet_ActiveBalance.FBN('ID_BALANCE_SETUP').AsInteger
    else e:=DSet_PassiveBalance.FBN('ID_BALANCE_SETUP').AsInteger;
    if e=0 then exit;

    if Panel_NotIncludedSch.Visible and not DSet_NotIncludedSch.IsEmpty
    then f:=DSet_NotIncludedSch.FBN('ID_SCH').AsInteger
    else f:=-1;

    T:=TfrmBalanceSetupProp.Create(self,e,d);
    T.Caption:=getBalance.frmCap_BalanceSetupEdit;
    if PageControl.ActivePageIndex=0 then
    begin
        T.TextEdit_BalanceSetupName.Text:=DSet_ActiveBalance.FBN('NAME').AsString;
        if DSet_ActiveBalance.FBN('LINE_CODE').AsString<>''
        then T.MaskEdit_LineCode.Text:=DSet_ActiveBalance['LINE_CODE']
        else T.MaskEdit_LineCode.Text:='';
        if DSet_ActiveBalance.FBN('ORDER_CODE').AsString<>''
        then T.MaskEdit_OrderCode.Text:=DSet_ActiveBalance['ORDER_CODE']
        else T.MaskEdit_OrderCode.Text:='';
    end else begin
        T.TextEdit_BalanceSetupName.Text:=DSet_PassiveBalance.FBN('NAME').AsString;
        if DSet_PassiveBalance.FBN('LINE_CODE').AsString<>''
        then T.MaskEdit_LineCode.Text:=DSet_PassiveBalance['LINE_CODE']
        else T.MaskEdit_LineCode.Text:='';
        if DSet_PassiveBalance.FBN('ORDER_CODE').AsString<>''
        then T.MaskEdit_OrderCode.Text:=DSet_PassiveBalance['ORDER_CODE']
        else T.MaskEdit_OrderCode.Text:='';
    end;
    if ((PageControl.ActivePageIndex=0) and (DSet_ActiveBalance.FBN('LINK_TO').AsInteger=-1))
    or ((PageControl.ActivePageIndex=1) and (DSet_PassiveBalance.FBN('LINK_TO').AsInteger=-1))
    then begin
        T.LFormula.Enabled:=false;
        T.RadioGroup_FormulaType.Visible:=false;
        T.cxGrid1.Enabled:=false;
        T.Button_plusSch.Enabled:=false;
        T.Button_minusSch.Enabled:=false;
        T.Button_DelSch.Enabled:=false;
        T.TextEdit_Formula.Enabled:=false;
        T.Height:=190;
    end else begin
        if PageControl.ActivePageIndex=0 then
          T.RadioGroup_FormulaType.ItemIndex := StrToInt(DSet_ActiveBalance.FBN('FORMULA_TYPE').AsString)
        else
          T.RadioGroup_FormulaType.ItemIndex := StrToInt(DSet_PassiveBalance.FBN('FORMULA_TYPE').AsString);
    end;

    if T.ShowModal=mrOk then
    begin
        pFIBStoredProc.StoredProcName:='PUB_SP_BALANCE_SETUP_UPD';
        try
        pFIBStoredProc.Transaction.StartTransaction;
        pFIBStoredProc.ParamByName('ID_BALANCE_SETUP').AsInt64:=e;
        pFIBStoredProc.ParamByName('ID_BALANCE').AsInt64:=d;
        pFIBStoredProc.ParamByName('NAME').AsString:=T.TextEdit_BalanceSetupName.Text;

        if T.MaskEdit_LineCode.Text<>''
        then pFIBStoredProc.ParamByName('LINE_CODE').AsInteger:=strtoint(T.MaskEdit_LineCode.Text)
        else pFIBStoredProc.ParamByName('LINE_CODE').AsVariant:=null;

        if T.MaskEdit_OrderCode.Text<>''
        then pFIBStoredProc.ParamByName('ORDER_CODE').AsInteger:=strtoint(T.MaskEdit_OrderCode.Text)
        else pFIBStoredProc.ParamByName('ORDER_CODE').AsVariant:=null;

        if T.CheckBox_no_summ.Checked then
          pFIBStoredProc.ParamByName('NO_SUMM').AsInteger:=1
        else
          pFIBStoredProc.ParamByName('NO_SUMM').AsInteger:=0;

        if T.RadioGroup_FormulaType.ItemIndex <= 0
        then pFIBStoredProc.ParamByName('FORMULA_TYPE').AsString:='0'
        else begin
            if T.RadioGroup_FormulaType.ItemIndex = 1 then
            begin
              pFIBStoredProc.ParamByName('FORMULA_TYPE').AsString:='1';
              if (T.n1<>'') and (T.n2<>'')
              then begin
                pFIBStoredProc.ParamByName('STROKA1').AsString:=T.n1;
                pFIBStoredProc.ParamByName('STROKA2').AsString:=T.n2;
              end;
            end
            else
              pFIBStoredProc.ParamByName('FORMULA_TYPE').AsString:='2';
        end;
        pFIBStoredProc.Prepare;
        pFIBStoredProc.ExecProc;
        pFIBStoredProc.Transaction.Commit;
        except on E:Exception
        do  begin pFIBStoredProc.Transaction.Rollback;
                  ShowMessage(E.Message);
            end;
        end;
    end;
    T.Free;
    act_refreshExecute(Sender);
    if not DSet_SP_Balance.IsEmpty then DSet_SP_Balance.Locate('ID_BALANCE',d,[]);
    if Panel_NotIncludedSch.Visible and not DSet_NotIncludedSch.IsEmpty and (f<>-1)
    then DSet_NotIncludedSch.Locate('ID_SCH',f,[]);
    if (PageControl.ActivePageIndex=0) and (not DSet_ActiveBalance.IsEmpty)
    then begin
        DSet_ActiveBalance.Locate('ID_BALANCE_SETUP',e,[]);
        cxDBTreeListActive.SetFocus;
    end;
    if (PageControl.ActivePageIndex=1) and (not DSet_PassiveBalance.IsEmpty)
    then begin
        DSet_PassiveBalance.Locate('ID_BALANCE_SETUP',e,[]);
        cxDBTreeListPassive.SetFocus;
    end;
end;                                               

procedure TfrmBalance.btnDEL_balance_setupClick(Sender: TObject);
var
  d,e,f: int64;
  str: string;
begin
    if (PageControl.ActivePageIndex=0) and DSet_ActiveBalance.IsEmpty then exit;
    if (PageControl.ActivePageIndex=1) and DSet_PassiveBalance.IsEmpty then exit;
    if (PageControl.ActivePageIndex=0)
    then str:=DSet_ActiveBalance.FBN('NAME').asString
    else str:=DSet_PassiveBalance.FBN('NAME').asString;
    d:=DSet_SP_Balance.FBN('ID_BALANCE').AsInteger;
    if Panel_NotIncludedSch.Visible and not DSet_NotIncludedSch.IsEmpty
    then f:=DSet_NotIncludedSch.FBN('ID_SCH').AsInteger
    else f:=-1;
    if MessageBox(self.Handle,PChar(msg_Del+#13+str+#63),getBalance.frmCap_Delete,MB_YESNO or MB_ICONWARNING)=mryes then
    begin
        if (PageControl.ActivePageIndex=0)
        then e:=DSet_ActiveBalance.FBN('LINK_TO').AsInteger
        else e:=DSet_PassiveBalance.FBN('LINK_TO').AsInteger;
        pFIBStoredProc.StoredProcName:='PUB_SP_BALANCE_SETUP_DEL';
        try
        pFIBStoredProc.Prepare;
        if (PageControl.ActivePageIndex=0) then pFIBStoredProc.ParamByName('ID_BALANCE_SETUP').AsInt64:=DSet_ActiveBalance['ID_BALANCE_SETUP'];
        if (PageControl.ActivePageIndex=1) then pFIBStoredProc.ParamByName('ID_BALANCE_SETUP').AsInt64:=DSet_PassiveBalance['ID_BALANCE_SETUP'];
        pFIBStoredProc.Transaction.StartTransaction;
        pFIBStoredProc.ExecProc;
        pFIBStoredProc.Transaction.Commit;
        except on E:Exception
        do  begin pFIBStoredProc.Transaction.Rollback;
                  ShowMessage(E.Message);
            end;
        end;
        act_refreshExecute(Sender);
        if not DSet_SP_Balance.IsEmpty then DSet_SP_Balance.Locate('ID_BALANCE',d,[]);
        if Panel_NotIncludedSch.Visible and not DSet_NotIncludedSch.IsEmpty and (f<>-1)
        then DSet_NotIncludedSch.Locate('ID_SCH',f,[]);
        if (PageControl.ActivePageIndex=0) and (not DSet_ActiveBalance.IsEmpty) and (e<>-1)
        then begin
            DSet_ActiveBalance.Locate('ID_BALANCE_SETUP',e,[]);
            cxDBTreeListActive.SetFocus;
        end;
        if (PageControl.ActivePageIndex=1) and (not DSet_PassiveBalance.IsEmpty) and (e<>-1)
        then begin
            DSet_PassiveBalance.Locate('ID_BALANCE_SETUP',e,[]);
            cxDBTreeListPassive.SetFocus;
        end;
    end;
end;

procedure TfrmBalance.Button_BalanceNameClick(Sender: TObject);
begin
    if cxSplitter1.State=ssOpened
    then begin
        cxSplitter1.CloseSplitter;
        btnEXIT1.Parent:=Balance_Print;
        btnEXIT1.Top:=0;
        PanelDate.Parent:=Balance_Print;
        PanelDate.Top:=-1;
        ComboBox_Month.Parent:=Balance_Print;
        ComboBox_Month.Top:=5;
        ComboBox_Year.Parent:=Balance_Print;
        ComboBox_Year.Top:=5;
    end else begin
        cxSplitter1.OpenSplitter;
        btnEXIT1.Parent:=Panel;
        btnEXIT1.Top:=9;
        PanelDate.Parent:=Panel;
        PanelDate.Top:=8;
        ComboBox_Month.Parent:=Panel;
        ComboBox_Month.Top:=14;
        ComboBox_Year.Parent:=Panel;
        ComboBox_Year.Top:=14;
    end;
end;                               

procedure TfrmBalance.act_exitExecute(Sender: TObject);
begin
    close;
end;

procedure TfrmBalance.act_refreshExecute(Sender: TObject);
begin
    DSet_SP_Balance.CloseOpen(true);

    if DSet_ActiveBalance.Active then DSet_ActiveBalance.Close;
    DSet_ActiveBalance.SelectSQL.Text:='select * from PUB_SP_BALANCE_SCH_CALCULATION('''+DateToStr(PeriodDate)+''',0,?ID_BALANCE) order by ORDER_CODE';
    DSet_ActiveBalance.Open;

    if DSet_PassiveBalance.Active then DSet_PassiveBalance.Close;
    DSet_PassiveBalance.SelectSQL.Text:='select * from PUB_SP_BALANCE_SCH_CALCULATION('''+DateToStr(PeriodDate)+''',1,?ID_BALANCE) order by ORDER_CODE';
    DSet_PassiveBalance.Open;

    if Panel_NotIncludedSch.Visible
    then begin
        if DSet_NotIncludedSch.Active then DSet_NotIncludedSch.Close;
        DSet_NotIncludedSch.SelectSQL.Text:='select bsc.* from PUB_SP_BALANCE_CHECK_SCH(:IN_DATE,?ID_BALANCE) bsc';
        DSet_NotIncludedSch.ParamByName('IN_DATE').AsDate:=PeriodDate;
        DSet_NotIncludedSch.Open;
    end;

    cxDBTreeListActive.FullExpand;
    cxDBTreeListPassive.FullExpand;
end;

procedure TfrmBalance.act_ADDExecute(Sender: TObject);
begin
    if (cxSplitter1.State=ssClosed) or (cxDBTreeListActive.Focused and (PageControl.ActivePageIndex=0)) or (cxDBTreeListPassive.Focused and (PageControl.ActivePageIndex=1))
    then btnADD_balance_setupClick(Sender)
    else btnADD_balanceClick(Sender);
end;

procedure TfrmBalance.act_EDITExecute(Sender: TObject);
begin
    if (cxSplitter1.State=ssClosed) or (cxDBTreeListActive.Focused and (PageControl.ActivePageIndex=0)) or (cxDBTreeListPassive.Focused and (PageControl.ActivePageIndex=1))
    then btnEDIT_balance_setupClick(Sender)
    else btnEDIT_balanceClick(Sender);
end;

procedure TfrmBalance.act_DELExecute(Sender: TObject);
begin
    if (cxSplitter1.State=ssClosed) or (cxDBTreeListActive.Focused and (PageControl.ActivePageIndex=0)) or (cxDBTreeListPassive.Focused and (PageControl.ActivePageIndex=1))
    then btnDEL_balance_setupClick(Sender)
    else btnDEL_balanceClick(Sender);
end;

procedure TfrmBalance.act_PrintExecute(Sender: TObject);
begin           
    if DSet_SP_Balance.IsEmpty then exit;
    frxReport1.Clear;
    frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\MBook\ReportBalance.fr3');
    frxReport1.Variables['PERIOD']:=''''+DateToStr(self.PeriodDate)+'''';
    cxDBTreeListActive.BeginUpdate;
    cxDBTreeListPassive.BeginUpdate;
    if design_mode
    then frxReport1.DesignReport
    else if frxReport1.PrepareReport
          then frxReport1.ShowPreparedReport;
    cxDBTreeListActive.EndUpdate;
    cxDBTreeListPassive.EndUpdate;
end;

procedure TfrmBalance.act_DesignExecute(Sender: TObject);
begin
    design_mode:=not design_mode;
    if design_mode
    then self.Caption:=self.Caption+' [Design mode is On]'
    else self.Caption:=getBalance.frmCap_BalanceMain;
end;

procedure TfrmBalance.btn_CheckInSchClick(Sender: TObject);
var
  ttl: Integer;
  s: string;
begin
    if DSet_SP_Balance.IsEmpty then exit;
    if DSet_NotIncludedSch.Active then DSet_NotIncludedSch.Close;
    DSet_NotIncludedSch.SelectSQL.Text:='select bsc.* from PUB_SP_BALANCE_CHECK_SCH(:IN_DATE,?ID_BALANCE) bsc';
    DSet_NotIncludedSch.ParamByName('IN_DATE').AsDate:=PeriodDate;
    DSet_NotIncludedSch.Open;
    DSet_NotIncludedSch.FetchAll;
    ttl:=DSet_NotIncludedSch.RecordCount;
    if (ttl mod 10 = 1) and (ttl mod 100 <> 11)
    then s:='ок'
    else begin
        if (ttl mod 10 in [2,3,4]) then s:='ки';
        if ((ttl mod 100 in [11..19]) or (ttl mod 10 in [5..9,0])) then s:='ків';
    end;
    Lbl_TotalOutSch.Caption:='Загалом  '+IntToStr(ttl)+'       ';
    Panel_NotIncludedSch.Visible:=true;    
    ShowMessage('До балансу'+'"'+DSet_SP_Balance.FBN('BALANCE_NAME').AsString+'"'+#13+'не увійшло '+IntToStr(ttl)+' рахун'+s);
end;

procedure TfrmBalance.Button_HideSCHClick(Sender: TObject);
begin
    Panel_NotIncludedSch.Visible:=False;
    DSet_NotIncludedSch.Close;
end;

procedure TfrmBalance.PopupMenu_AddPlusClick(Sender: TObject);
var
  d,e: int64;
  T: TfrmDbKr;
begin
    if DSet_NotIncludedSch.IsEmpty then exit;

    if (PageControl.ActivePageIndex=0) and DSet_ActiveBalance.IsEmpty then exit;
    if (PageControl.ActivePageIndex=1) and DSet_PassiveBalance.IsEmpty then exit;
    d:=DSet_SP_Balance.FBN('ID_BALANCE').AsInteger;

    if (PageControl.ActivePageIndex=0) then
        if DSet_ActiveBalance.FBN('FORMULA_TYPE').AsString='0'
        then e:=DSet_ActiveBalance.FBN('ID_BALANCE_SETUP').AsInteger
        else begin
            ShowMessage('"'+DSet_ActiveBalance.FBN('NAME').AsString+'"'+#13+'має інший тип формули.'+#13+'Ви не можите додати рахунок.');
            exit;
        end
    else
        if DSet_PassiveBalance.FBN('FORMULA_TYPE').AsString='0'
        then e:=DSet_PassiveBalance.FBN('ID_BALANCE_SETUP').AsInteger
        else begin
            ShowMessage('"'+DSet_PassiveBalance.FBN('NAME').AsString+'"'+#13+'має інший тип формули.'+#13+'Ви не можите додати рахунок.');
            exit;
        end;
    if e=0 then exit;

    T:=TfrmDbKr.Create(self);
    if PageControl.ActivePageIndex=0
    then T.RadioButton_Db.Checked:=true
    else T.RadioButton_Kr.Checked:=true;
    if T.ShowModal=mrOk then
    begin
        try
        pFIBQuery.Close;
        pFIBQuery.Transaction.StartTransaction;
        pFIBQuery.SQL.Text:='execute procedure PUB_SP_BALANCE_SETUP_CHNG_FRML(:ID_BALANCE_SETUP,:ID_SCH,:SCH_SIGN,:DB_KR)';
        pFIBQuery.ParamByName('ID_BALANCE_SETUP').AsInt64:=e;
        pFIBQuery.ParamByName('ID_SCH').AsInt64:=DSet_NotIncludedSch.FBN('ID_SCH').AsInteger;
        pFIBQuery.ParamByName('SCH_SIGN').AsInteger:=1;
        if T.RadioButton_Db.Checked then pFIBQuery.ParamByName('DB_KR').AsString:='дб';
        if T.RadioButton_Kr.Checked then pFIBQuery.ParamByName('DB_KR').AsString:='кр';
        pFIBQuery.Prepare;
        pFIBQuery.ExecProc;

        pFIBQuery.Transaction.Commit;
        except on E:Exception
        do  begin pFIBQuery.Transaction.Rollback;
                  ShowMessage(E.Message);
            end;
        end;
        act_refreshExecute(Sender);
        if not DSet_SP_Balance.IsEmpty
        then DSet_SP_Balance.Locate('ID_BALANCE',d,[]);

        if (PageControl.ActivePageIndex=0) and (not DSet_ActiveBalance.IsEmpty)
        then begin
            DSet_ActiveBalance.Locate('ID_BALANCE_SETUP',e,[]);
            cxDBTreeListActive.SetFocus;
        end;
        if (PageControl.ActivePageIndex=1) and (not DSet_PassiveBalance.IsEmpty)
        then begin
            DSet_PassiveBalance.Locate('ID_BALANCE_SETUP',e,[]);
            cxDBTreeListPassive.SetFocus;
        end;
    end;
end;

procedure TfrmBalance.PopupMenu_AddMinusClick(Sender: TObject);
var
  d,e: int64;
  T: TfrmDbKr;
begin
    if DSet_NotIncludedSch.IsEmpty then exit;

    if (PageControl.ActivePageIndex=0) and DSet_ActiveBalance.IsEmpty then exit;
    if (PageControl.ActivePageIndex=1) and DSet_PassiveBalance.IsEmpty then exit;
    d:=DSet_SP_Balance.FBN('ID_BALANCE').AsInteger;

    if (PageControl.ActivePageIndex=0) then
        if DSet_ActiveBalance.FBN('FORMULA_TYPE').AsString='0'
        then e:=DSet_ActiveBalance.FBN('ID_BALANCE_SETUP').AsInteger
        else begin
            ShowMessage('"'+DSet_ActiveBalance.FBN('NAME').AsString+'"'+#13+'має інший тип формули.'+#13+'Ви не можите додати рахунок.');
            exit;
        end
    else
        if DSet_PassiveBalance.FBN('FORMULA_TYPE').AsString='0'
        then e:=DSet_PassiveBalance.FBN('ID_BALANCE_SETUP').AsInteger
        else begin
            ShowMessage('"'+DSet_PassiveBalance.FBN('NAME').AsString+'"'+#13+'має інший тип формули.'+#13+'Ви не можите додати рахунок.');
            exit;
        end;
    if e=0 then exit;

    T:=TfrmDbKr.Create(self);
    if PageControl.ActivePageIndex=0
    then T.RadioButton_Db.Checked:=true
    else T.RadioButton_Kr.Checked:=true;
    if T.ShowModal=mrOk then
    begin
        try
        pFIBQuery.Close;
        pFIBQuery.Transaction.StartTransaction;
        pFIBQuery.SQL.Text:='execute procedure PUB_SP_BALANCE_SETUP_CHNG_FRML(:ID_BALANCE_SETUP,:ID_SCH,:SCH_SIGN,:DB_KR)';
        pFIBQuery.ParamByName('ID_BALANCE_SETUP').AsInt64:=e;
        pFIBQuery.ParamByName('ID_SCH').AsInt64:=DSet_NotIncludedSch.FBN('ID_SCH').AsInteger;
        pFIBQuery.ParamByName('SCH_SIGN').AsInteger:=-1;
        if T.RadioButton_Db.Checked then pFIBQuery.ParamByName('DB_KR').AsString:='дб';
        if T.RadioButton_Kr.Checked then pFIBQuery.ParamByName('DB_KR').AsString:='кр';
        pFIBQuery.Prepare;
        pFIBQuery.ExecProc;

        pFIBQuery.Transaction.Commit;
        except on E:Exception
        do  begin pFIBQuery.Transaction.Rollback;
                  ShowMessage(E.Message);
            end;
        end;
        act_refreshExecute(Sender);
        if not DSet_SP_Balance.IsEmpty
        then DSet_SP_Balance.Locate('ID_BALANCE',d,[]);

        if (PageControl.ActivePageIndex=0) and (not DSet_ActiveBalance.IsEmpty)
        then begin
            DSet_ActiveBalance.Locate('ID_BALANCE_SETUP',e,[]);
            cxDBTreeListActive.SetFocus;
        end;
        if (PageControl.ActivePageIndex=1) and (not DSet_PassiveBalance.IsEmpty)
        then begin
            DSet_PassiveBalance.Locate('ID_BALANCE_SETUP',e,[]);
            cxDBTreeListPassive.SetFocus;
        end;
    end;
end;

procedure TfrmBalance.ComboBox_MonthKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if (key=38) and (ComboBox_Month.ItemIndex=0) and (ComboBox_Year.ItemIndex>0)
    then begin
        ComboBox_Year.ItemIndex:=ComboBox_Year.ItemIndex-1;
        ComboBox_Month.ItemIndex:=11;
        Key:=0;
    end;
    if (key=40) and (ComboBox_Month.ItemIndex=11) and (ComboBox_Year.ItemIndex<25)
    then begin
        ComboBox_Year.ItemIndex:=ComboBox_Year.ItemIndex+1;
        ComboBox_Month.ItemIndex:=0;
        Key:=0;
    end;
end;

procedure TfrmBalance.ComboBox_DatePropertiesChange(Sender: TObject);
begin
    if self.Showing
    then begin
        PeriodDate:=EncodeDate(StrToInt(ComboBox_Year.Text),12-ComboBox_Month.ItemIndex,1);
        act_refreshExecute(Sender);
    end;
end;

procedure TfrmBalance.frxReport1GetValue(const VarName: String; var Value: Variant);
begin
    if VarName = 'YEAR'
    then Value := inttostr(YearOf(PeriodDate));
    if VarName = 'OBJECT'
    then begin
        pFIBQuery.Close;
        pFIBQuery.Transaction.StartTransaction;
        pFIBQuery.SQL.Text:='select c.NAME_CUSTOMER from PUB_SP_CUSTOMER c join PUB_SYS_DATA psd on c.ID_CUSTOMER=psd.ORGANIZATION';
        pFIBQuery.ExecQuery;
        Value :=pFIBQuery.FldByName['NAME_CUSTOMER'].AsString;
        pFIBQuery.Transaction.Commit;
        pFIBQuery.Close;
    end;
    if VarName = 'KVKV'
    then Value := 'dsfgdfgdfgfgdfgfgdfgdfg';
    if VarName = 'EDRPOU'
    then begin
        pFIBQuery.Close;
        pFIBQuery.Transaction.StartTransaction;
        pFIBQuery.SQL.Text:='select c.KOD_EDRPOU from PUB_SP_CUSTOMER c join PUB_SYS_DATA psd on c.ID_CUSTOMER=psd.ORGANIZATION';
        pFIBQuery.ExecQuery;
        Value :=pFIBQuery.FldByName['KOD_EDRPOU'].AsString;
        pFIBQuery.Transaction.Commit;
        pFIBQuery.Close;
    end;
end;

procedure TfrmBalance.cxDBTreeListActiveStylesGetContentStyle(Sender,
  AItem: TObject; ANode: TcxTreeListNode; var AStyle: TcxStyle);
begin
     if (ANode.Values[7]<2) then AStyle:=cxStyle2;
end;

procedure TfrmBalance.cxDBTreeListPassiveStylesGetContentStyle(Sender,
  AItem: TObject; ANode: TcxTreeListNode; var AStyle: TcxStyle);
begin
     if (ANode.Values[6]<2) then AStyle:=cxStyle2;
end;

end.
