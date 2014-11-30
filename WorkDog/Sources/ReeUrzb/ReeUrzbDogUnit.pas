unit ReeUrzbDogUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxCurrencyEdit,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxLookAndFeelPainters,
  StdCtrls, cxButtons, FIBDataSet, pFIBDataSet, DogLoaderUnit, dxBar,
  dxBarExtItems, ImgList, cxTL, dxStatusBar, ExtCtrls, cxMaskEdit,
  cxContainer, cxButtonEdit, GlobalSPR, cxCalc, LoadDogManedger, ActnList,
  FIBQuery, pFIBQuery, cxCheckBox,DateChooseUnit,
  FIBDatabase, pFIBDatabase, Menus, Halcn6db, ReeUrzbAddKekv, cxCalendar,
  pFIBStoredProc;
type TTypeAddDog=(TypeAddDog_by_sp_dog, TypeAddDog_by_plat);
type
  TfrmUrzbDog = class(TForm)
    DataSource: TDataSource;
    DataSet: TpFIBDataSet;
    LargeImages: TImageList;
    dxBarManager1: TdxBarManager;
    dxBarLargeButton_add: TdxBarLargeButton;
    dxBarLargeButton_del: TdxBarLargeButton;
    dxBarLargeButton_upd: TdxBarLargeButton;
    dxBarLargeButton_ex: TdxBarLargeButton;
    cxStyleRepository2: TcxStyleRepository;
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
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    cxStyle47: TcxStyle;
    cxStyle48: TcxStyle;
    cxStyle49: TcxStyle;
    cxStyle50: TcxStyle;
    cxStyle51: TcxStyle;
    cxStyle52: TcxStyle;
    cxStyle53: TcxStyle;
    cxStyle54: TcxStyle;
    cxStyle55: TcxStyle;
    cxStyle56: TcxStyle;
    cxStyle57: TcxStyle;
    cxStyle58: TcxStyle;
    cxStyle59: TcxStyle;
    cxStyle60: TcxStyle;
    cxStyle61: TcxStyle;
    cxStyle62: TcxStyle;
    cxStyle63: TcxStyle;
    cxStyle64: TcxStyle;
    cxStyle65: TcxStyle;
    cxStyle66: TcxStyle;
    cxStyle67: TcxStyle;
    cxStyle68: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    dxStatusBar1: TdxStatusBar;
    Panel1: TPanel;
    cxGrid2: TcxGrid;
    cxGridLevel1: TcxGridLevel;
    cxGrid2TableView1: TcxGridTableView;
    cxGrid2TableView1Column_n_uz: TcxGridColumn;
    cxGrid2TableView1Column_kekv: TcxGridColumn;
    cxGrid2TableView1Column_d_dog: TcxGridColumn;
    cxGrid2TableView1Column_n_dog: TcxGridColumn;
    cxGrid2TableView1Column_name_cust: TcxGridColumn;
    cxGrid2TableView1Column_date_end: TcxGridColumn;
    cxGrid2TableView1Column_summa: TcxGridColumn;
    cxGrid2TableView1Column_id_kekv: TcxGridColumn;
    cxGrid2TableView1Column_id_dog: TcxGridColumn;
    cxGrid2TableView1Column_id_urzb: TcxGridColumn;
    cxGrid2TableView1Column_id_customer: TcxGridColumn;
    cxGrid2TableView1Column_sum_predopl: TcxGridColumn;
    dxBarLargeButton1: TdxBarLargeButton;
    cxButton_ok: TcxButton;
    cxButton_cancel: TcxButton;
    cxGrid2TableView1Column_summa_fact_fz: TcxGridColumn;
    cxGrid2TableView1Column_summa_fact_pay: TcxGridColumn;
    dxBarLargeButton_add_dog: TdxBarLargeButton;
    cxGrid2TableView1Column_id_rate_acc: TcxGridColumn;
    cxGrid2TableView1Column_reg_nomer: TcxGridColumn;
    ActionList1: TActionList;
    ok: TAction;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    dxBarControlContainerItem2: TdxBarControlContainerItem;
    dxBarControlContainerItem3: TdxBarControlContainerItem;
    Panel2: TPanel;
    Label1: TLabel;
    cxGrid2TableView1Column_flag_del: TcxGridColumn;
    add: TAction;
    edit: TAction;
    dele: TAction;
    cxGrid2TableView1Column_id_dog2: TcxGridColumn;
    PrintButton: TdxBarLargeButton;
    DataSet2: TpFIBDataSet;
    StProc: TpFIBStoredProc;
    Label3: TLabel;
    cxGrid2TableView1Column_note: TcxGridColumn;
    cxGrid2TableView1ColumnOZNTN: TcxGridColumn;
    dxBarLargeButton2: TdxBarLargeButton;
    RTransaction: TpFIBTransaction;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarPopupMenu1: TdxBarPopupMenu;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    cxGrid2TableView1Column_date_beg: TcxGridColumn;
    Q1: TpFIBQuery;
    StoredProc: TpFIBStoredProc;
    Label4: TLabel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    pFIBDataSet1: TpFIBDataSet;
    ds1: TDataSource;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarPopupMenu2: TdxBarPopupMenu;
    dxBarPopupMenu3: TdxBarPopupMenu;
    DbfExport: THalcyonDataSet;
    NewDbfTableCreate: TCreateHalcyonDataSet;
    DataSetExport: TpFIBDataSet;
    cbDBFPath: TdxBarCombo;
    dxbrbtn1: TdxBarButton;
    Timer1: TTimer;
    cxGrid2TableView1ColumnIfKEKV: TcxGridColumn;
    dxBarButton7: TdxBarButton;
    dxBarPopupMenu4: TdxBarPopupMenu;
    dxBarButton8: TdxBarButton;
    dxBarLargeButton_edit: TdxBarLargeButton;
    cxGrid1DBTableView1DBSmId: TcxGridDBColumn;
    cxGrid1DBTableView1DBSmName: TcxGridDBColumn;
    cxGrid1DBTableView1DBRzId: TcxGridDBColumn;
    cxGrid1DBTableView1DBRzName: TcxGridDBColumn;
    cxGrid1DBTableView1DBStId: TcxGridDBColumn;
    cxGrid1DBTableView1DBStName: TcxGridDBColumn;
    cxGrid1DBTableView1DBKekvId: TcxGridDBColumn;
    cxGrid1DBTableView1DBKekvName: TcxGridDBColumn;
    cxGrid1DBTableView1DBInfoId: TcxGridDBColumn;
    WorkDatabase: TpFIBDatabase;
    WTransaction: TpFIBTransaction;
    KoshtAdd: TdxBarButton;
    KoshtEdit: TdxBarButton;
    KoshtDel: TdxBarButton;
    cxGrid1DBTableView1DBNumInfo: TcxGridDBColumn;
    cbKod: TdxBarCombo;
    dxBarButton9: TdxBarButton;
    dxBarButton10Ref: TdxBarButton;
    function SelectDogovor(all_summa : double):boolean;
    procedure dxBarLargeButton_addClick(Sender: TObject);
    procedure dxBarLargeButton_delClick(Sender: TObject);
    procedure dxBarLargeButton_updClick(Sender: TObject);
    procedure dxBarLargeButton_exClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxGrid2TableView1Column_kekvPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxButton_cancelClick(Sender: TObject);
    procedure cxButton_okClick(Sender: TObject);
    procedure dxBarLargeButton_add_dogClick(Sender: TObject);
    procedure cxGrid2TableView1Column_reg_nomerPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure okExecute(Sender: TObject);
    procedure cxGrid2TableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure addExecute(Sender: TObject);
    procedure deleExecute(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure dxBarButton3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure dxBarButton5Click(Sender: TObject);
    procedure dxBarButton6Click(Sender: TObject);
    procedure cxGrid2TableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure dxBarLargeButton5Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure dxBarLargeButton_editClick(Sender: TObject);
    procedure KoshtEditClick(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure KoshtAddClick(Sender: TObject);
    procedure KoshtDelClick(Sender: TObject);
    procedure cxGrid2TableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGrid2TableView1EditChanged(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem);
    procedure dxBarButton10RefClick(Sender: TObject);
    procedure cxGrid2TableView1ColumnOZNTNPropertiesValidate(
      Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
  private
    procedure SaveDog;
    function DiscInDrive(Drive: char): Boolean;
    { Private declarations }
  public
    add_kekv: Integer;
    id_kekv_dog: Int64;
    record_p : Integer;
    summa_dog  : Variant;
    kod_kekv_dog: Integer;
    id_dog: Int64;
    id_urzb: Int64;
    id_urzb_data: Int64;
    id_rate_acc_nat: Int64;
    mode: String;
    TypeAddDog:TTypeAddDog;
    DiscForOwner:string;
    DiskTree:TStringList;
    procedure SelectAll;
    constructor Create (Aowner:TComponent; _mode: String; _id_urzb: Integer); overload;
    function  GetIdKekv(id: Int64; summa: Variant; kod_kekv: Integer): Variant;
    procedure DelUrzb (ii: Integer);

    { Public declarations }
  end;

var
   frmUrzbDog: TfrmUrzbDog;


implementation
uses
  WSUnit, ReeUrzbUnit, DogZarplUnit;

{$R *.dfm}

constructor TfrmUrzbDog.Create (Aowner:TComponent; _mode: String; _id_urzb: Integer);
var
  Per:  TfrmUrzbDog;
begin
 inherited Create (Aowner);
 WorkDatabase.Handle := (Owner as TfrmReeUrzb).WorkDatabase.Handle;
 WorkDatabase.DefaultTransaction.Active:=true;
 WorkDatabase.DefaultUpdateTransaction.Active:=true;
 RTransaction.Active:=true;
 add_kekv:=0;
 mode := _mode;
 id_urzb := _id_urzb;
 if mode <> 'edit' then cxButton_ok.Visible := false;
 if mode = 'edit' then
 begin
  Caption := 'Редагування реєстра юридичних зобов''язань';
  FormStyle := fsMDIChild;
  WindowState:=wsMaximized;
 end;
 if mode = 'view' then
 begin
   Caption := 'Перегляд реєстра юридичних зобов''язань';
   dxBarLargeButton_add.Enabled := false;
   dxBarLargeButton_edit.Enabled := false;
   dxBarLargeButton_del.Enabled := false;
   dxBarLargeButton_add_dog.Enabled := false;
   dxBarLargeButton2.Enabled := false;
   dxBarLargeButton3.Enabled := false;
   dxBarButton10Ref.Enabled := false;
   KoshtAdd.Enabled:=false;
   KoshtEdit.Enabled:=false;
   KoshtDel.Enabled:=false;
   FormStyle := fsMDIChild;
   WindowState:=wsMaximized;
   cxGrid2TableView1.OptionsSelection.CellSelect := false;
 end;
end;


function TfrmUrzbDog.SelectDogovor(all_summa : double) : boolean;
var
    inputDog : TDogInput;
    res   : TDogResult;
    id_dog_add, kod_dog_add: Double;
    name_cust, r_dog, num_dog, mfo: string;
    GetNameSP:TPfibStoredProc;
    pFIBDataSet2 : TPfibDataset;
    myYear, myMonth, myDay : Word;
    mydate_beg, mydate_end : TDate;
    date_beg, date_end : string;
    i, j, l, c : Integer;
    DataSetDog : TpFIBDataSet;
    StrTMP: string;
    AAddKekv : TfrmAddKekv;
begin
        DataSetDog := TpFIBDataSet.Create(Self);

        DecodeDate(now, myYear, myMonth, myDay);
        if (myMonth <= 9) then
         begin
          date_beg := '01.0'+IntToStr(myMonth)+'.'+IntToStr(myYear);
          if ((myMonth=1) or (myMonth=3) or (myMonth=5) or (myMonth=7) or (myMonth=8) or (myMonth=10) or (myMonth=12))  then
          date_end := '31.0'+IntToStr(myMonth)+'.'+IntToStr(myYear)
          else  date_end := '30.0'+IntToStr(myMonth)+'.'+IntToStr(myYear)
         end else
        date_beg := '01.'+IntToStr(myMonth)+'.'+IntToStr(myYear);
        if ((myMonth=1) or (myMonth=3) or (myMonth=5) or (myMonth=7) or (myMonth=8) or (myMonth=10) or (myMonth=12))  then
          date_end := '31.'+IntToStr(myMonth)+'.'+IntToStr(myYear)
        else  date_end := '30.'+IntToStr(myMonth)+'.'+IntToStr(myYear);
        if (myMonth=2) then date_end := '28.0'+IntToStr(myMonth)+'.'+IntToStr(myYear);
        mydate_beg:= StrToDate(date_beg);
        mydate_end:= StrToDate(date_end);


        SelectDogovor := true;
        LoadSysData(RTransaction);
        //SYS_ID_USER          := SYS_ID_USER;
        decimalseparator := ',';
        inputDog              := SYS_DEFAULT_DOG_INPUT;
        inputDog.Owner        := Self;
        inputDog.DBHandle     := WorkDatabase.Handle;
        inputDog.ReadTrans    := RTransaction.Handle;
        inputDog.WriteTrans   := WTransaction.Handle;
        inputDog.FormStyle    := fsNormal;
        pFIBDataSet2:=TPfibDataset.Create(self);
        pFIBDataSet2.Database:=WorkDatabase;
        pFIBDataSet2.Transaction:=RTransaction;
        RTransaction.StartTransaction;
        pFIBDataSet2.Close;
        pFIBDataSet2.SQLs.SelectSQL.Text := 'select * from dog_ini_def_group g WHERE g.id=8';
        pFIBDataSet2.Open;
        //mm.prih = 1
         // then inputDog.id_Group_add := pFIBDataSet1.FieldByName('ID_GROUP_ADD_PR').AsInteger
         // else inputDog.id_Group_add := pFIBDataSet1.FieldByName('ID_GROUP_ADD_RAS').AsInteger;
        inputDog.id_Group     := pFIBDataSet2.FieldByName('ID_GROUP').AsInteger;
        //RTransaction.Commit;
        inputDog.DateSys:=Now;
        pFIBDataSet1.Close;
        inputDog.Summa        := 1;
        inputDog.filter.bShowFilterForm:=true;
        inputDog.filter.bUseFilter:=true;
        inputDog.filter.bDate:=true;
        inputDog.filter.DateBeg := mydate_beg;
        inputDog.filter.DateEnd := mydate_end;
        inputDog.isZayav     := false;
        inputDog.arndGetPay  := 1;
        inputDog.shablon_data.bUse     := true;
        //putDog.shablon_data.num      := mm.cxTextEditNum.Text;
        //putDog.shablon_data.date_dog := mm.DateTimePicker2.Date;
        //S_CURRENT_DATE      := mm.DateTimePicker2.Date;
        //putDog.shablon_data.note     := mm.cxMemo1.Text;
        //putDog.shablon_data.summa    := StrToCurr(mm.cxTextEditSumma.Text);
        //putDog.shablon_data.id_rate_account    := mm.myform.id_account_customer;
        //putDog.shablon_data.id_rate_acc_native := mm.myform.id_ras;
        //inputDog.filter.SummaFrom      := null;
        //inputDog.filter.SummaTo        := n;
        //inputDog.filter.bSumma         := true;
        //inputDog.filter.NameCust       := mm.myform.name_cust;
        //inputDog.filter.bNameCust      := true;
        //inputDog.filter.id_cust        := mm.myform.id_customer;
        //inputDog.filter.bID_Cust       := true;

  res := ShowDogMain(inputDog);
  if res.ModalResult = 1 then
  begin
            StProc.Transaction.StartTransaction;
             StProc.StoredProcName:='DOG_REE_URZB_EXISTS_DOG';
             StProc.ParamByName('id_dog').AsInt64:=res.id_dog;
             StProc.ExecProc;
             if StProc.ParamByName('is_exists').AsString='T' then
             begin
              i:= MessageDlg('Увага', 'Договір вже існує в юридичних зобов''язаннях. Дійсно бажаєте додати договір?',mtWarning,mbOKCancel);
               if  i<>1 then
               begin
                 StProc.Transaction.Commit;
                 Exit;
               end;
             end;
             StProc.Close;

             if id_rate_acc_nat <> res.id_rate_acc_nat    then
             begin
               if MessageBox(Handle,PChar('Данный договор сформирован на счет, отличающийся от счета реестра юр. обязательств. Добавить?'),
               'Підтвердження',MB_YesNo or MB_Iconquestion) <> mrYes then Exit;
             end;


             DataSetDog.Database := WorkDatabase;
             DataSetDog.Transaction:= RTransaction;
             RTransaction.StartTransaction;

             record_p:=record_p + 1;
             id_Dog            := res.id_dog;
             DataSetDog.Active := false;
             DataSetDog.SQLs.SelectSQL.Text := 'select * from dog_ree_urzb_data_sel_by_id_dog(' + IntToStr(id_dog) + ',' + IntToStr(record_p) + ')';

             DataSetDog.Active := true;
             DataSetDog.FetchAll;
             DataSetDog.First;

             c:=DataSetDog.RecordCount;

        if (DataSetDog.FBN('KEKV').AsInteger <> 0) then
        begin
             cxGrid2TableView1Column_n_uz.DataBinding.DataController.RecordCount := cxGrid2TableView1Column_n_uz.DataBinding.DataController.RecordCount + DataSetDog.RecordCount;
             for i := cxGrid2TableView1Column_n_uz.DataBinding.DataController.RecordCount - DataSetDog.RecordCount to cxGrid2TableView1Column_n_uz.DataBinding.DataController.RecordCount - 1  do
             begin
                //cxGrid2TableView1Column_n_uz.DataBinding.DataController.RecordCount := cxGrid2TableView1Column_n_uz.DataBinding.DataController.RecordCount + 1;
                cxGrid2TableView1Column_n_uz.DataBinding.ValueTypeClass := TcxIntegerValueType;       // 1
                cxGrid2TableView1Column_n_uz.DataBinding.DataController.Values[i, 0] := DataSetDog['NUMBER_URZB']; //DataSetDog.FBN('NUMBER_URZB').asInteger;

                cxGrid2TableView1Column_kekv.DataBinding.ValueTypeClass := TcxStringValueType;       // 2
                cxGrid2TableView1Column_kekv.DataBinding.DataController.Values[i, 1] := DataSetDog['KEKV'];

                cxGrid2TableView1Column_d_dog.DataBinding.ValueTypeClass := TcxDateTimeValueType;    // 3
                cxGrid2TableView1Column_d_dog.DataBinding.DataController.Values[i, 2] := DataSetDog.FBN('D_DOG').AsDateTime;

                cxGrid2TableView1Column_n_dog.DataBinding.ValueTypeClass := TcxStringValueType;      // 4
                cxGrid2TableView1Column_n_dog.DataBinding.DataController.Values[i, 3] := DataSetDog.FBN('N_DOG').AsString;

                cxGrid2TableView1Column_name_cust.DataBinding.ValueTypeClass := TcxStringValueType;  // 5
                cxGrid2TableView1Column_name_cust.DataBinding.DataController.Values[i, 4] := DataSetDog.FBN('NAME_CUSTOMER').AsString;

                cxGrid2TableView1Column_date_end.DataBinding.ValueTypeClass := TcxDateTimeValueType; // 6
                cxGrid2TableView1Column_date_end.DataBinding.DataController.Values[i, 5] := DataSetDog.FBN('DATE_END').AsDateTime;

                cxGrid2TableView1Column_date_beg.DataBinding.ValueTypeClass := TcxDateTimeValueType; // 6
                cxGrid2TableView1Column_date_beg.DataBinding.DataController.Values[i, 19] := DataSetDog.FBN('DATE_BEG').AsDateTime;

                cxGrid2TableView1Column_summa.DataBinding.ValueTypeClass := TcxCurrencyValueType;    // 7
                cxGrid2TableView1Column_summa.DataBinding.DataController.Values[i, 6] := DataSetDog.FBN('SUMMA').AsCurrency;

                cxGrid2TableView1Column_id_kekv.DataBinding.ValueTypeClass := TcxIntegerValueType;   // 8
                cxGrid2TableView1Column_id_kekv.DataBinding.DataController.Values[i, 7] := DataSetDog['ID_KEKV'];

                StrTMP:=DataSetDog.FBN('ID_DOG').AsString;
                cxGrid2TableView1Column_id_dog.DataBinding.DataController.Values[i, 8] := DataSetDog.FBN('ID_DOG').AsString;

                cxGrid2TableView1Column_id_urzb.DataBinding.ValueTypeClass := TcxIntegerValueType;   // 10
                cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[i, 9] := -1;

                cxGrid2TableView1Column_id_customer.DataBinding.ValueTypeClass := TcxCurrencyValueType; // 11
                cxGrid2TableView1Column_id_customer.DataBinding.DataController.Values[i, 10] := DataSetDog.fbn('ID_CUSTOMER').AsVariant;

                cxGrid2TableView1Column_sum_predopl.DataBinding.ValueTypeClass := TcxCurrencyValueType; // 12
                cxGrid2TableView1Column_sum_predopl.DataBinding.DataController.Values[i, 11] := DataSetDog.FBN('SUM_PREDOPL').AsCurrency;

                cxGrid2TableView1Column_summa_fact_fz.DataBinding.ValueTypeClass := TcxWordValueType;  // 13
                cxGrid2TableView1Column_summa_fact_pay.DataBinding.DataController.Values[i, 12] := 0;

                cxGrid2TableView1Column_summa_fact_pay.DataBinding.ValueTypeClass := TcxCurrencyValueType; // 14
                cxGrid2TableView1Column_summa_fact_pay.DataBinding.DataController.Values[i, 13] := DataSetDog.FBN('SUM_PAY').AsCurrency;

                cxGrid2TableView1Column_id_rate_acc.DataBinding.ValueTypeClass := TcxIntegerValueType;     // 15
                cxGrid2TableView1Column_id_rate_acc.DataBinding.DataController.Values[i, 14] :=DataSetDog['ID_RATE_ACC'];

                cxGrid2TableView1Column_reg_nomer.DataBinding.ValueTypeClass  := TcxStringValueType;
                cxGrid2TableView1Column_reg_nomer.DataBinding.DataController.Values[i, 15] := DataSetDog['REG_NOMER'];

                cxGrid2TableView1Column_note.DataBinding.ValueTypeClass  := TcxStringValueType;
                cxGrid2TableView1Column_note.DataBinding.DataController.Values[i, 18] := ' ';

                cxGrid2TableView1ColumnIfKEKV.DataBinding.ValueTypeClass := TcxStringValueType;
                cxGrid2TableView1ColumnIfKEKV.DataBinding.DataController.Values[i, 20] := '0';

                cxGrid2TableView1ColumnOZNTN.DataBinding.ValueTypeClass := TcxStringValueType;       // 2
                cxGrid2TableView1ColumnOZNTN.DataBinding.DataController.Values[i, 21] := '';

                DataSetDog.Next;

                cxGrid2TableView1.DataController.Post;
             end;
             DataSetDog.Active:=false;
             DataSetDog.Free;

             for i := cxGrid2TableView1Column_n_uz.DataBinding.DataController.RecordCount - c to cxGrid2TableView1Column_n_uz.DataBinding.DataController.RecordCount - 1  do
             begin
                StoredProc.StoredProcName := 'DOG_REE_URZB_DATA_INSERT';
                StoredProc.Prepare;
                StoredProc.ParamByName('ID_DOG').AsInt64 := cxGrid2TableView1Column_id_dog.DataBinding.DataController.Values[i, 8];
                StoredProc.ParamByName('ID_URZB').AsInt64 := ID_URZB;
                StoredProc.ParamByName('ID_KEKV').AsInt64 := cxGrid2TableView1Column_id_kekv.DataBinding.DataController.Values[i, 7];
                StoredProc.ParamByName('N_DOG').Value := cxGrid2TableView1Column_n_dog.DataBinding.DataController.Values[i, 3];
                StoredProc.ParamByName('D_DOG').Value := cxGrid2TableView1Column_d_dog.DataBinding.DataController.Values[i, 2];
                StoredProc.ParamByName('ID_CUSTOMER').AsInt64 := cxGrid2TableView1Column_id_customer.DataBinding.DataController.Values[i, 10];
                StoredProc.ParamByName('DATE_BEG').Value := cxGrid2TableView1Column_date_beg.DataBinding.DataController.Values[i, 19];
                StoredProc.ParamByName('DATE_END').Value := cxGrid2TableView1Column_date_end.DataBinding.DataController.Values[i, 5];
                StoredProc.ParamByName('SUMMA').Value := cxGrid2TableView1Column_summa.DataBinding.DataController.Values[i, 6];
                StoredProc.ParamByName('SUM_PREDOPL').Value := cxGrid2TableView1Column_sum_predopl.DataBinding.DataController.Values[i, 11];
                StoredProc.ParamByName('NUM_URZB').Value := cxGrid2TableView1Column_n_uz.DataBinding.DataController.Values[i, 0];
                StoredProc.ParamByName('ID_RATE_ACC').AsInt64 := cxGrid2TableView1Column_id_rate_acc.DataBinding.DataController.Values[i, 14];
                StoredProc.ParamByName('NOTE').Value := cxGrid2TableView1Column_note.DataBinding.DataController.Values[i, 18];
                StoredProc.ParamByName('SUM_PAY').AsCurrency:=cxGrid2TableView1Column_summa_fact_pay.DataBinding.DataController.Values[i, 13];
                StoredProc.ParamByName('NUMBER_INFO').AsInt64:=1;
                try
                  StoredProc.ExecProc;
                  StoredProc.Close;
                except on e: Exception do
                begin
                  ShowMessage(e.Message);
                  StoredProc.Transaction.Rollback;
                  Exit;
                end;
                end;
                StoredProc.Transaction.Commit;
                cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[i, 9] := StoredProc.FldByName['ID_URZB_DATA'].AsInt64;
                cxGrid2TableView1.DataController.Post;

                pFIBDataSet1.Close;
                pFIBDataSet1.ParamByName('id_urzb_data').AsInt64 := cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[i, 9];
                pFIBDataSet1.ParamByName('ACTUAL_DATE').AsDate := cxGrid2TableView1Column_date_beg.DataBinding.DataController.Values[i, 19];
                pFIBDataSet1.Active := true;
                pFIBDataSet1.FetchAll;
                cxGrid1DBTableView1.DataController.RecordCount := pFIBDataSet1.RecordCount;
                if(pFIBDataSet1.RecordCount>0) then
                begin
                  for j:=0 to cxGrid1DBTableView1.DataController.RecordCount - 1 do
                  begin
                    cxGrid1DBTableView1DBNumInfo.DataBinding.DataController.Values[j, 0]:= pFIBDataSet1['NUMBER_INFO'];
                    cxGrid1DBTableView1DBColumn1.DataBinding.DataController.Values[j, 1]:= cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[cxGrid2TableView1Column_id_urzb.DataBinding.DataController.FocusedRecordIndex, 9];
                    cxGrid1DBTableView1DBColumn2.DataBinding.DataController.Values[j, 2]:= pFIBDataSet1['SMETA_KOD'];
                    cxGrid1DBTableView1DBColumn3.DataBinding.DataController.Values[j, 3] := pFIBDataSet1['RAZD_KOD'];
                    cxGrid1DBTableView1DBColumn4.DataBinding.DataController.Values[j, 4] := pFIBDataSet1['ST_KOD'];
                    cxGrid1DBTableView1DBColumn5.DataBinding.DataController.Values[j, 5] := pFIBDataSet1['KEKV_KOD'];
                    cxGrid1DBTableView1DBColumn6.DataBinding.DataController.Values[j, 6] := StrToCurr(pFIBDataSet1['SUMMA']);
                    cxGrid1DBTableView1DBSmId.DataBinding.DataController.Values[j, 7] := pFIBDataSet1['ID_SMETA'];
                    cxGrid1DBTableView1DBSmName.DataBinding.DataController.Values[j, 8] := pFIBDataSet1['SMETA_NAME'];
                    cxGrid1DBTableView1DBRzId.DataBinding.DataController.Values[j, 9] := pFIBDataSet1['ID_RAZD'];
                    cxGrid1DBTableView1DBRzName.DataBinding.DataController.Values[j, 10] := pFIBDataSet1['RAZD_NAME'];
                    cxGrid1DBTableView1DBStId.DataBinding.DataController.Values[j, 11] := pFIBDataSet1['ID_ST'];
                    cxGrid1DBTableView1DBStName.DataBinding.DataController.Values[j, 12] := pFIBDataSet1['ST_NAME'];
                    cxGrid1DBTableView1DBKekvId.DataBinding.DataController.Values[j, 13] := pFIBDataSet1['ID_KEKV'];
                    cxGrid1DBTableView1DBKekvName.DataBinding.DataController.Values[j, 14] := pFIBDataSet1['KEKV_NAME'];
                    cxGrid1DBTableView1DBInfoId.DataBinding.DataController.Values[j, 15] := pFIBDataSet1['ID_INFO'];
                    pFIBDataSet1.Next;
                  end;
                end;
             end;
             //record_p := i + 1;
             //DataSetDog.Free;
             //RTransaction.Commit;
             //DataSetDog := TpFIBDataSet.Create(Self);
             //DataSetDog.Active:=false;
             //DataSetDog.Free;
             cxGrid2TableView1.ViewData.Records[cxGrid2TableView1.DataController.RecordCount-1].Focused:=True;
             //with cxGrid2TableView1.DataController do
             //FocusedRecordIndex := FindRecordIndexByText(i-1, 0, IntToStr(cxGrid2TableView1.DataController.Values[i-1, 0]), False, True, True);
             //cxGrid2TableView1.ViewData.Records[FocusedRecordIndex].Focused:=True;
             cxGrid2TableView1EditChanged(cxGrid2TableView1, cxGrid2TableView1Column_summa);
             //DataSetDog.Close;
             //with cxGrid2TableView1.DataController do FocusedRecordIndex := FindRecordIndexByText(0, 8, IntToStr(id_dog), False, True, True);
             //cxGrid2TableView1.ViewData.Records[0].Focused:=True;
             //cxGrid1DBTableView1.ViewData.Records[0].Focused:=True;
        end
        else
        begin
            ShowMessage('У цього договора немає жодного кошториса. Введіть, будь ласка, розбивку!');
            AAddKekv:=TfrmAddKekv.Create(self, WorkDatabase.Handle);
            AAddKekv.sum_smet:=DataSetDog.FBN('SUMMA').AsString;
            AAddKekv.CurrencyEdit_sum_smet.Text:=DataSetDog.FBN('SUMMA').AsString;
            if (AAddKekv.ShowModal <> MrOk) then Exit
            else
            begin
            cxGrid2TableView1Column_n_uz.DataBinding.DataController.RecordCount := cxGrid2TableView1Column_n_uz.DataBinding.DataController.RecordCount + 1;
            for i := cxGrid2TableView1Column_n_uz.DataBinding.DataController.RecordCount - 1 to cxGrid2TableView1Column_n_uz.DataBinding.DataController.RecordCount-1  do
            begin
                cxGrid2TableView1Column_n_uz.DataBinding.ValueTypeClass := TcxIntegerValueType;       // 1
                cxGrid2TableView1Column_n_uz.DataBinding.DataController.Values[i, 0] := record_p; //DataSetDog.FBN('NUMBER_URZB').asInteger;

                cxGrid2TableView1Column_kekv.DataBinding.ValueTypeClass := TcxStringValueType;       // 2
                cxGrid2TableView1Column_kekv.DataBinding.DataController.Values[i, 1] := AAddKekv.cxMaskEdit_kekv.Text;

                cxGrid2TableView1Column_d_dog.DataBinding.ValueTypeClass := TcxDateTimeValueType;    // 3
                cxGrid2TableView1Column_d_dog.DataBinding.DataController.Values[i, 2] := DataSetDog.FBN('D_DOG').AsDateTime;

                cxGrid2TableView1Column_n_dog.DataBinding.ValueTypeClass := TcxStringValueType;      // 4
                cxGrid2TableView1Column_n_dog.DataBinding.DataController.Values[i, 3] := DataSetDog.FBN('N_DOG').AsString;

                cxGrid2TableView1Column_name_cust.DataBinding.ValueTypeClass := TcxStringValueType;  // 5
                cxGrid2TableView1Column_name_cust.DataBinding.DataController.Values[i, 4] := DataSetDog.FBN('NAME_CUSTOMER').AsString;

                cxGrid2TableView1Column_date_end.DataBinding.ValueTypeClass := TcxDateTimeValueType; // 6
                cxGrid2TableView1Column_date_end.DataBinding.DataController.Values[i, 5] := DataSetDog.FBN('DATE_END').AsDateTime;

                cxGrid2TableView1Column_date_beg.DataBinding.ValueTypeClass := TcxDateTimeValueType; // 6
                cxGrid2TableView1Column_date_beg.DataBinding.DataController.Values[i, 19] := DataSetDog.FBN('DATE_BEG').AsDateTime;

                cxGrid2TableView1Column_summa.DataBinding.ValueTypeClass := TcxCurrencyValueType;    // 7
                cxGrid2TableView1Column_summa.DataBinding.DataController.Values[i, 6] := DataSetDog.FBN('SUMMA').AsCurrency;

                cxGrid2TableView1Column_id_kekv.DataBinding.ValueTypeClass := TcxIntegerValueType;   // 8
                cxGrid2TableView1Column_id_kekv.DataBinding.DataController.Values[i, 7] := AAddKekv.id_kekv;

                StrTMP:=DataSetDog.FBN('ID_DOG').AsString;
                cxGrid2TableView1Column_id_dog.DataBinding.DataController.Values[i, 8] := DataSetDog.FBN('ID_DOG').AsString;

                cxGrid2TableView1Column_id_urzb.DataBinding.ValueTypeClass := TcxIntegerValueType;   // 10
                cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[i, 9] := -1;

                cxGrid2TableView1Column_id_customer.DataBinding.ValueTypeClass := TcxCurrencyValueType; // 11
                cxGrid2TableView1Column_id_customer.DataBinding.DataController.Values[i, 10] := DataSetDog.fbn('ID_CUSTOMER').AsVariant;

                cxGrid2TableView1Column_sum_predopl.DataBinding.ValueTypeClass := TcxCurrencyValueType; // 12
                cxGrid2TableView1Column_sum_predopl.DataBinding.DataController.Values[i, 11] := DataSetDog.FBN('SUM_PREDOPL').AsCurrency;

                cxGrid2TableView1Column_summa_fact_fz.DataBinding.ValueTypeClass := TcxWordValueType;  // 13
                cxGrid2TableView1Column_summa_fact_pay.DataBinding.DataController.Values[i, 12] := 0;

                cxGrid2TableView1Column_summa_fact_pay.DataBinding.ValueTypeClass := TcxCurrencyValueType; // 14
                cxGrid2TableView1Column_summa_fact_pay.DataBinding.DataController.Values[i, 13] := DataSetDog.FBN('SUM_PAY').AsCurrency;

                cxGrid2TableView1Column_id_rate_acc.DataBinding.ValueTypeClass := TcxIntegerValueType;     // 15
                cxGrid2TableView1Column_id_rate_acc.DataBinding.DataController.Values[i, 14] :=DataSetDog['ID_RATE_ACC'];

                cxGrid2TableView1Column_reg_nomer.DataBinding.ValueTypeClass  := TcxStringValueType;
                cxGrid2TableView1Column_reg_nomer.DataBinding.DataController.Values[i, 15] := DataSetDog['REG_NOMER'];

                cxGrid2TableView1Column_note.DataBinding.ValueTypeClass  := TcxStringValueType;
                cxGrid2TableView1Column_note.DataBinding.DataController.Values[i, 18] := ' ';

                cxGrid2TableView1ColumnIfKEKV.DataBinding.ValueTypeClass := TcxStringValueType;
                cxGrid2TableView1ColumnIfKEKV.DataBinding.DataController.Values[i, 20] := '0';

                cxGrid2TableView1ColumnOZNTN.DataBinding.ValueTypeClass := TcxStringValueType;       // 2
                cxGrid2TableView1ColumnOZNTN.DataBinding.DataController.Values[i, 21] := '';
                DataSetDog.Next;

                cxGrid2TableView1.DataController.Post;

                StoredProc.StoredProcName := 'DOG_REE_URZB_DATA_INSERT';
                StoredProc.Prepare;
                StoredProc.ParamByName('ID_DOG').AsInt64 := cxGrid2TableView1Column_id_dog.DataBinding.DataController.Values[i, 8];
                StoredProc.ParamByName('ID_URZB').AsInt64 := ID_URZB;
                StoredProc.ParamByName('ID_KEKV').AsInt64 := cxGrid2TableView1Column_id_kekv.DataBinding.DataController.Values[i, 7];
                StoredProc.ParamByName('N_DOG').Value := cxGrid2TableView1Column_n_dog.DataBinding.DataController.Values[i, 3];
                StoredProc.ParamByName('D_DOG').Value := cxGrid2TableView1Column_d_dog.DataBinding.DataController.Values[i, 2];
                StoredProc.ParamByName('ID_CUSTOMER').AsInt64 := cxGrid2TableView1Column_id_customer.DataBinding.DataController.Values[i, 10];
                StoredProc.ParamByName('DATE_BEG').Value := cxGrid2TableView1Column_date_beg.DataBinding.DataController.Values[i, 19];
                StoredProc.ParamByName('DATE_END').Value := cxGrid2TableView1Column_date_end.DataBinding.DataController.Values[i, 5];
                StoredProc.ParamByName('SUMMA').Value := cxGrid2TableView1Column_summa.DataBinding.DataController.Values[i, 6];
                StoredProc.ParamByName('SUM_PREDOPL').Value := cxGrid2TableView1Column_sum_predopl.DataBinding.DataController.Values[i, 11];
                StoredProc.ParamByName('NUM_URZB').Value := cxGrid2TableView1Column_n_uz.DataBinding.DataController.Values[i, 0];
                StoredProc.ParamByName('ID_RATE_ACC').AsInt64 := cxGrid2TableView1Column_id_rate_acc.DataBinding.DataController.Values[i, 14];
                StoredProc.ParamByName('NOTE').Value := cxGrid2TableView1Column_note.DataBinding.DataController.Values[i, 18];
                StoredProc.ParamByName('SUM_PAY').AsCurrency:=cxGrid2TableView1Column_summa_fact_pay.DataBinding.DataController.Values[i, 13];
                try
                  StoredProc.ExecProc;
                  StoredProc.Close;
                except on e: Exception do
                begin
                  ShowMessage(e.Message);
                  StoredProc.Transaction.Rollback;
                  Exit;
                end;
                end;
                StoredProc.Transaction.Commit;
                cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[i, 9] := StoredProc.FldByName['ID_URZB_DATA'].AsInt64;
                cxGrid2TableView1.DataController.Post;

              //ShowMessage(VarToStr(cxGrid1DBTableView1DBNumInfo.DataBinding.DataController.RecordCount));
              StProc.Transaction.StartTransaction;
              StProc.StoredProcName := 'DOG_REE_URZB_DATA_INFO_INS';
              StProc.Prepare;
              StProc.ParamByName('ID_URZB_DATA').AsInt64 := cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[i, 9];
              StProc.ParamByName('ID_SMETA').Value := AAddKekv.id_smet;
              StProc.ParamByName('ID_RAZD').Value := AAddKekv.id_razd;
              StProc.ParamByName('ID_ST').Value := AAddKekv.id_stat;
              StProc.ParamByName('ID_KEKV').Value := AAddKekv.id_kekv;
              StProc.ParamByName('SUMMA').Value := AAddKekv.sum_smet;
              StProc.ParamByName('ID_URZB').AsInt64 := ID_URZB;
              StProc.ParamByName('NUMBER_INFO').AsInt64 := 1;
              StProc.ExecProc;
              StProc.Close;
              StProc.Transaction.Commit;

              for l := 0 to cxGrid2TableView1Column_n_uz.DataBinding.DataController.RecordCount - 1 do
               begin
                StoredProc.StoredProcName := 'DOG_REE_URZB_DATA_UPD';
                StoredProc.Prepare;
                StoredProc.ParamByName('ID_DOG').AsInt64 := cxGrid2TableView1Column_id_dog.DataBinding.DataController.Values[l, 8];
                StoredProc.ParamByName('ID_URZB').AsInt64 := ID_URZB;
                StoredProc.ParamByName('ID_KEKV').AsInt64 := cxGrid2TableView1Column_id_kekv.DataBinding.DataController.Values[l, 7];
                StoredProc.ParamByName('N_DOG').Value := cxGrid2TableView1Column_n_dog.DataBinding.DataController.Values[l, 3];
                StoredProc.ParamByName('d_DOG').Value := cxGrid2TableView1Column_d_dog.DataBinding.DataController.Values[l, 2];
                StoredProc.ParamByName('ID_CUSTOMER').AsInt64 := cxGrid2TableView1Column_id_customer.DataBinding.DataController.Values[l, 10];
                StoredProc.ParamByName('DATE_BEG').Value := cxGrid2TableView1Column_date_beg.DataBinding.DataController.Values[l, 19];
                StoredProc.ParamByName('DATE_END').Value := cxGrid2TableView1Column_date_end.DataBinding.DataController.Values[l, 5];
                StoredProc.ParamByName('SUMMA').Value := cxGrid2TableView1Column_summa.DataBinding.DataController.Values[l, 6];
                StoredProc.ParamByName('SUM_PREDOPL').Value := cxGrid2TableView1Column_sum_predopl.DataBinding.DataController.Values[l, 11];
                StoredProc.ParamByName('ID_RATE_ACC').AsInt64 :=  cxGrid2TableView1Column_id_rate_acc.DataBinding.DataController.Values[l, 14];
                StoredProc.ParamByName('ID_URZB_DATA').AsInt64 := cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[l, 9];
                StoredProc.ParamByName('NOTE').Value := cxGrid2TableView1Column_note.DataBinding.DataController.Values[l, 18];
                StoredProc.ParamByName('SUM_PAY').Value := cxGrid2TableView1Column_summa_fact_pay.DataBinding.DataController.Values[l, 13];
                StoredProc.ParamByName('OZNTN').Value := cxGrid2TableView1ColumnOZNTN.DataBinding.DataController.Values[l, 21];
                try
                   StoredProc.ExecProc;
                   StoredProc.Close;
                except on e: Exception do
                begin
                   ShowMessage(e.Message);
                   StoredProc.Transaction.Rollback;
                   Exit;
                end;
                end;
                StoredProc.Transaction.Commit;
               end;

              pFIBDataSet1.Close;
              pFIBDataSet1.ParamByName('id_urzb_data').AsInt64 := cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[i, 9];
              pFIBDataSet1.ParamByName('ACTUAL_DATE').AsDate := cxGrid2TableView1Column_date_beg.DataBinding.DataController.Values[i, 19];
              pFIBDataSet1.Active := true;
              pFIBDataSet1.FetchAll;
              cxGrid1DBTableView1.DataController.RecordCount := pFIBDataSet1.RecordCount;
              for j:=0 to cxGrid1DBTableView1.DataController.RecordCount - 1 do
              begin
                cxGrid1DBTableView1DBNumInfo.DataBinding.DataController.Values[j, 0]:= pFIBDataSet1['NUMBER_INFO'];
                cxGrid1DBTableView1DBColumn1.DataBinding.DataController.Values[j, 1]:= cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[i, 9];
                cxGrid1DBTableView1DBColumn2.DataBinding.DataController.Values[j, 2]:= pFIBDataSet1['SMETA_KOD'];
                cxGrid1DBTableView1DBColumn3.DataBinding.DataController.Values[j, 3] := pFIBDataSet1['RAZD_KOD'];
                cxGrid1DBTableView1DBColumn4.DataBinding.DataController.Values[j, 4] := pFIBDataSet1['ST_KOD'];
                cxGrid1DBTableView1DBColumn5.DataBinding.DataController.Values[j, 5] := pFIBDataSet1['KEKV_KOD'];
                cxGrid1DBTableView1DBColumn6.DataBinding.DataController.Values[j, 6] := StrToCurr(pFIBDataSet1['SUMMA']);
                cxGrid1DBTableView1DBSmId.DataBinding.DataController.Values[j, 7] := pFIBDataSet1['ID_SMETA'];
                cxGrid1DBTableView1DBSmName.DataBinding.DataController.Values[j, 8] := pFIBDataSet1['SMETA_NAME'];
                cxGrid1DBTableView1DBRzId.DataBinding.DataController.Values[j, 9] := pFIBDataSet1['ID_RAZD'];
                cxGrid1DBTableView1DBRzName.DataBinding.DataController.Values[j, 10] := pFIBDataSet1['RAZD_NAME'];
                cxGrid1DBTableView1DBStId.DataBinding.DataController.Values[j, 11] := pFIBDataSet1['ID_ST'];
                cxGrid1DBTableView1DBStName.DataBinding.DataController.Values[j, 12] := pFIBDataSet1['ST_NAME'];
                cxGrid1DBTableView1DBKekvId.DataBinding.DataController.Values[j, 13] := pFIBDataSet1['ID_KEKV'];
                cxGrid1DBTableView1DBKekvName.DataBinding.DataController.Values[j, 14] := pFIBDataSet1['KEKV_NAME'];
                cxGrid1DBTableView1DBInfoId.DataBinding.DataController.Values[j, 15] := pFIBDataSet1['ID_INFO'];
                pFIBDataSet1.Next;
              end;
              AAddKekv.Close;

              if (cxGrid2TableView1Column_summa.DataBinding.DataController.Values[i, 6] <> cxGrid1DBTableView1.DataController.Summary.FooterSummaryValues[0]) then ShowMessage('Увага! Сума по кошторисам не збігається з сумою юридичного зобов''язання!');
              //cxGrid2TableView1Column_summa.DataBinding.DataController.Values[i, 6] := cxGrid1DBTableView1.DataController.Summary.FooterSummaryValues[0];  //frmAddKekv.CurrencyEdit_sum_smet.Value;
              //cxGrid2TableView1.DataController.Post;
            end;
         end;
    end;
    cxGrid2TableView1.ViewData.Records[cxGrid2TableView1.DataController.RecordCount-1].Focused:=True;
  end
  else
  begin
      SelectDogovor := false;
  end;
  //ShowMessage(VarToStr(cxGrid2TableView1.DataController.RecordCount));
  //cxGrid2TableView1.ViewData.Records[cxGrid2TableView1.DataController.RecordCount-1].Focused:=True;
  //cxGrid2TableView1.ViewData.Records[cxGrid2TableView1.DataController.RecordCount].Focused:=True;
end;





procedure TfrmUrzbDog.SelectAll;
var
  i : Integer;
  DataSetTemp: TpFIBDataSet;
  kodFlag : Integer;
begin
  DataSet.Close;
  DataSet.ParamByName('id_urzb').AsInt64 := id_urzb;
  DataSet.Active := true;

  DataSetTemp := TpFIBDataSet.Create(Self);
  DataSetTemp.Database := WorkDatabase;
  DataSetTemp.Transaction := RTransaction;
  DataSetTemp.SQLs.SelectSQL.Text := 'SELECT ur.id_rate_acc, ''('' || b.mfo || '') '' || r.rate_account   as rate_account ' +
    'FROM   dog_ree_urzb ur, pub_sp_cust_rate_acc r, pub_sp_bank b ' +
    'WHERE  ur.id_rate_acc = r.id_rate_account and  r.id_bank = b.id_bank ' +
    'and    ur.id_urzb = ' + IntToStr(id_urzb);
  DataSetTemp.Active := true;

  StProc.Transaction.StartTransaction;
  StProc.StoredProcName:='DOG_REE_URZB_GET_BANK_ACC';
  StProc.ParamByName('ID_URZB').AsInteger:=id_urzb;
  StProc.ExecProc;
  StProc.Transaction.Commit;

  Label4.Caption:= StProc.FldByName['NUMBER_URZB'].AsString + ' від ' + StProc.FldByName['DATER_URZB'].AsString + 'р.:';

  Label3.Caption:=StProc.FldByName['RATE_ACCOUNT_BANK'].AsString + ',   ' + DataSetTemp.FBN('rate_account').AsString;

  //Label2.Caption := DataSetTemp.FBN('rate_account').AsString;
  id_rate_acc_nat := DataSetTemp['id_rate_acc'];

  DataSetTemp.Active := false;
  DataSetTemp.Free;    
  DataSet.FetchAll;
  cxGrid2TableView1.DataController.RecordCount := DataSet.RecordCount;
  for i:=0 to cxGrid2TableView1.DataController.RecordCount - 1 do
  begin
    cxGrid2TableView1Column_n_uz.DataBinding.DataController.Values[i, 0]:= i+1;
    cxGrid2TableView1Column_kekv.DataBinding.DataController.Values[i, 1]:= DataSet.FBN('KEKV').asInteger;
    cxGrid2TableView1Column_d_dog.DataBinding.DataController.Values[i, 2] := DataSet.FBN('D_DOG').AsDateTime;
    cxGrid2TableView1Column_n_dog.DataBinding.DataController.Values[i, 3] := DataSet.FBN('N_DOG').AsString;
    cxGrid2TableView1Column_name_cust.DataBinding.DataController.Values[i, 4] := DataSet.FBN('NAME_CUSTOMER').AsString;
    cxGrid2TableView1Column_date_end.DataBinding.DataController.Values[i, 5] := DataSet.FBN('DATE_END').AsDateTime;
    cxGrid2TableView1Column_summa.DataBinding.DataController.Values[i, 6] := DataSet.FBN('SUMMA').AsCurrency;
    cxGrid2TableView1Column_id_kekv.DataBinding.DataController.Values[i, 7] := DataSet['ID_KEKV'];
    cxGrid2TableView1Column_id_dog.DataBinding.DataController.Values[i, 8] := DataSet['ID_DOG'];
    cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[i, 9] := DataSet['ID_URZB_DATA'];
    cxGrid2TableView1Column_id_customer.DataBinding.DataController.Values[i, 10] := DataSet['ID_CUSTOMER'];
    cxGrid2TableView1Column_sum_predopl.DataBinding.DataController.Values[i, 11] := DataSet.FBN('SUM_PREDOPL').AsCurrency;
    cxGrid2TableView1Column_summa_fact_fz.DataBinding.DataController.Values[i, 12] := DataSet.FBN('SUMMA_FACT_FZ').AsCurrency;
    cxGrid2TableView1Column_summa_fact_pay.DataBinding.DataController.Values[i, 13] := DataSet.FBN('SUMMA_FACT_PAY').AsCurrency;
    cxGrid2TableView1Column_id_rate_acc.DataBinding.DataController.Values[i, 14] := DataSet['ID_RATE_ACC'];
    cxGrid2TableView1Column_reg_nomer.DataBinding.DataController.Values[i, 15] := DataSet.FBN('REG_NOMER').AsString;
    cxGrid2TableView1Column_note.DataBinding.DataController.Values[i, 18] := DataSet['NOTE'];
    cxGrid2TableView1Column_date_beg.DataBinding.DataController.Values[i, 19] := DataSet['DATE_BEG'];
    cxGrid2TableView1ColumnOZNTN.DataBinding.DataController.Values[i, 21] := DataSet['OZNTN'];
    DataSet.Next;
  end;

  Q1.Close;
  Q1.SQL.Text := 'select KOD_TYPE from DOG_SYS_OPTIONS';
  Q1.ExecQuery;
  kodFlag := Q1.FldByName['KOD_TYPE'].AsInteger;
  Q1.Close;
  cbKod.ItemIndex := 0;
end;



procedure TfrmUrzbDog.SaveDog;
var
 i: Integer;
begin
    StoredProc.Transaction.StartTransaction;
     for i := 0 to cxGrid2TableView1Column_n_uz.DataBinding.DataController.RecordCount - 1 do
     begin
        if cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[i, 9] = -1 then
        {Добавляем}
        begin
            if ((cxGrid2TableView1Column_flag_del.DataBinding.DataController.Values[i, 16] <> 1)
                and (cxGrid2TableView1ColumnIfKEKV.DataBinding.DataController.Values[i, 20] <> '1')) then
            begin
                StoredProc.StoredProcName := 'DOG_REE_URZB_DATA_INSERT';
                StoredProc.Prepare;
                StoredProc.ParamByName('ID_DOG').AsInt64 := cxGrid2TableView1Column_id_dog.DataBinding.DataController.Values[i, 8];
                StoredProc.ParamByName('ID_URZB').AsInt64 := ID_URZB;
                StoredProc.ParamByName('ID_KEKV').AsInt64 := cxGrid2TableView1Column_id_kekv.DataBinding.DataController.Values[i, 7];
                StoredProc.ParamByName('N_DOG').Value := cxGrid2TableView1Column_n_dog.DataBinding.DataController.Values[i, 3];
                StoredProc.ParamByName('D_DOG').Value := cxGrid2TableView1Column_d_dog.DataBinding.DataController.Values[i, 2];
                StoredProc.ParamByName('ID_CUSTOMER').AsInt64 := cxGrid2TableView1Column_id_customer.DataBinding.DataController.Values[i, 10];
                StoredProc.ParamByName('DATE_BEG').Value := cxGrid2TableView1Column_date_beg.DataBinding.DataController.Values[i, 19];
                StoredProc.ParamByName('DATE_END').Value := cxGrid2TableView1Column_date_end.DataBinding.DataController.Values[i, 5];
                StoredProc.ParamByName('SUMMA').Value := cxGrid2TableView1Column_summa.DataBinding.DataController.Values[i, 6];
                StoredProc.ParamByName('SUM_PREDOPL').Value := cxGrid2TableView1Column_sum_predopl.DataBinding.DataController.Values[i, 11];
                StoredProc.ParamByName('NUM_URZB').Value := cxGrid2TableView1Column_n_uz.DataBinding.DataController.Values[i, 0];
                StoredProc.ParamByName('ID_RATE_ACC').AsInt64 := cxGrid2TableView1Column_id_rate_acc.DataBinding.DataController.Values[i, 14];
                StoredProc.ParamByName('NOTE').Value := cxGrid2TableView1Column_note.DataBinding.DataController.Values[i, 18];
                StoredProc.ParamByName('SUM_PAY').AsCurrency:=cxGrid2TableView1Column_summa_fact_pay.DataBinding.DataController.Values[i, 13];
               try
                StoredProc.ExecProc;
                StoredProc.Close;
               except on e: Exception do
                 begin
                   ShowMessage(e.Message);
                   StoredProc.Transaction.Rollback;
                   Exit;
                 end;
               end;
               StoredProc.Transaction.Commit;
               cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[i, 9] := StoredProc.FldByName['ID_URZB_DATA'].AsInt64;
               cxGrid2TableView1.DataController.Post;
            end;
        end
        else
        {Обновляем}
        begin
            if (cxGrid2TableView1Column_flag_del.DataBinding.DataController.Values[i, 16] = 1) then
            begin
               DelUrzb(i);
            end;

               StoredProc.StoredProcName := 'DOG_REE_URZB_DATA_UPD';
               StoredProc.Prepare;
               StoredProc.ParamByName('ID_DOG').AsInt64 := cxGrid2TableView1Column_id_dog.DataBinding.DataController.Values[i, 8];
               StoredProc.ParamByName('ID_URZB').AsInt64 := ID_URZB;
               StoredProc.ParamByName('ID_KEKV').AsInt64 := cxGrid2TableView1Column_id_kekv.DataBinding.DataController.Values[i, 7];
               StoredProc.ParamByName('N_DOG').Value := cxGrid2TableView1Column_n_dog.DataBinding.DataController.Values[i, 3];
               StoredProc.ParamByName('d_DOG').Value := cxGrid2TableView1Column_d_dog.DataBinding.DataController.Values[i, 2];
               StoredProc.ParamByName('ID_CUSTOMER').AsInt64 := cxGrid2TableView1Column_id_customer.DataBinding.DataController.Values[i, 10];
               StoredProc.ParamByName('DATE_BEG').Value := cxGrid2TableView1Column_date_beg.DataBinding.DataController.Values[i, 19];
               StoredProc.ParamByName('DATE_END').Value := cxGrid2TableView1Column_date_end.DataBinding.DataController.Values[i, 5];
               StoredProc.ParamByName('SUMMA').Value := cxGrid2TableView1Column_summa.DataBinding.DataController.Values[i, 6];
               StoredProc.ParamByName('SUM_PREDOPL').Value := cxGrid2TableView1Column_sum_predopl.DataBinding.DataController.Values[i, 11];
               StoredProc.ParamByName('ID_RATE_ACC').AsInt64 :=  cxGrid2TableView1Column_id_rate_acc.DataBinding.DataController.Values[i, 14];
               StoredProc.ParamByName('ID_URZB_DATA').AsInt64 := cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[i, 9];
               StoredProc.ParamByName('NOTE').Value := cxGrid2TableView1Column_note.DataBinding.DataController.Values[i, 18];
               StoredProc.ParamByName('SUM_PAY').Value := cxGrid2TableView1Column_summa_fact_pay.DataBinding.DataController.Values[i, 13];
               StoredProc.ParamByName('NUMBER_URZB').Value := cxGrid2TableView1Column_n_uz.DataBinding.DataController.Values[i, 0];
               StoredProc.ParamByName('OZNTN').Value := cxGrid2TableView1ColumnOZNTN.DataBinding.DataController.Values[i, 21];
                try
                 StoredProc.ExecProc;
                 StoredProc.Close;
                except on e: Exception do
                  begin
                    ShowMessage(e.Message);
                    StoredProc.Transaction.Rollback;
                    Exit;
                  end;
                end;
                StoredProc.Transaction.Commit;
            end;
     end; //конец цикла
    //id_urzb_data := (Owner as TfrmReeUrzb).StoredProc.FldByName['ID_URZB_DATA'].AsInt64;
    //(Owner as TfrmReeUrzb).StoredProc.Transaction.Commit;
    Close;
end;

procedure TfrmUrzbDog.dxBarLargeButton_addClick(Sender: TObject);
begin
  SelectDogovor(0);
end;

procedure TfrmUrzbDog.dxBarLargeButton_delClick(Sender: TObject);
var
  i : Integer;
begin
  if MessageBox(Handle,PChar('Вы дійсно бажаєте видалити запис?'),
  'Підтвердження видалення',MB_YesNo or MB_Iconquestion) = mrYes then
  begin
    //i:= cxGrid2TableView1Column_n_uz.DataBinding.DataController.FocusedRowIndex;
    //cxGrid2TableView1Column_flag_del.DataBinding.DataController.Values[i, 16] := 1;
    i:=cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[cxGrid2TableView1Column_id_urzb.DataBinding.DataController.FocusedRecordIndex, 0];
    cxGrid2TableView1Column_flag_del.DataBinding.DataController.Values[i-1, 16] := 1;
  end;
end;

procedure TfrmUrzbDog.dxBarLargeButton_updClick(Sender: TObject);
begin
  SelectAll;
end;

procedure TfrmUrzbDog.dxBarLargeButton_exClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmUrzbDog.FormCreate(Sender: TObject);
var
  i : Integer;
begin
    cbKod.Items.Add('CP866');
    cbKod.Items.Add('WIN1251');

    cxGrid2TableView1Column_n_uz.DataBinding.ValueTypeClass := TcxIntegerValueType;       // 1
    cxGrid2TableView1Column_kekv.DataBinding.ValueTypeClass := TcxStringValueType;       // 2
    cxGrid2TableView1Column_d_dog.DataBinding.ValueTypeClass := TcxDateTimeValueType;    // 3
    cxGrid2TableView1Column_n_dog.DataBinding.ValueTypeClass := TcxStringValueType;      // 4
    cxGrid2TableView1Column_name_cust.DataBinding.ValueTypeClass := TcxStringValueType;  // 5
    cxGrid2TableView1Column_date_end.DataBinding.ValueTypeClass := TcxDateTimeValueType; // 6
    cxGrid2TableView1Column_date_beg.DataBinding.ValueTypeClass := TcxDateTimeValueType; // 6
    cxGrid2TableView1Column_summa.DataBinding.ValueTypeClass := TcxCurrencyValueType;    // 7
    cxGrid2TableView1Column_id_kekv.DataBinding.ValueTypeClass := TcxIntegerValueType;   // 8
    cxGrid2TableView1Column_id_dog.DataBinding.ValueTypeClass := TcxStringValueType;    // 9
    cxGrid2TableView1Column_id_dog2.DataBinding.ValueTypeClass := TcxStringValueType;    // 9
    cxGrid2TableView1Column_id_urzb.DataBinding.ValueTypeClass := TcxIntegerValueType;   // 10

    //cxGrid2TableView1Column_iуd_customer.DataBinding.ValueTypeClass := TcxIntegerValueType;
    cxGrid2TableView1Column_id_customer.DataBinding.ValueTypeClass := TcxCurrencyValueType; // 11
                                                                        //TcxWordValueType
    cxGrid2TableView1Column_sum_predopl.DataBinding.ValueTypeClass := TcxCurrencyValueType; // 12
    cxGrid2TableView1Column_summa_fact_fz.DataBinding.ValueTypeClass := TcxCurrencyValueType;  // 13
    cxGrid2TableView1Column_summa_fact_pay.DataBinding.ValueTypeClass := TcxCurrencyValueType; // 14
    cxGrid2TableView1Column_id_rate_acc.DataBinding.ValueTypeClass := TcxIntegerValueType;     // 15
    cxGrid2TableView1Column_reg_nomer.DataBinding.ValueTypeClass := TcxStringValueType;        // 16
    cxGrid2TableView1Column_flag_del.DataBinding.ValueTypeClass := TcxIntegerValueType;        // 17
    cxGrid2TableView1Column_note.DataBinding.ValueTypeClass  := TcxStringValueType;           // 18
    cxGrid2TableView1ColumnIfKEKV.DataBinding.ValueTypeClass := TcxStringValueType;
    cxGrid2TableView1ColumnOZNTN.DataBinding.ValueTypeClass := TcxStringValueType;

    cxGrid1DBTableView1DBNumInfo.DataBinding.ValueTypeClass:=TcxStringValueType;
    cxGrid1DBTableView1DBColumn1.DataBinding.ValueTypeClass:=TcxStringValueType;
    cxGrid1DBTableView1DBColumn2.DataBinding.ValueTypeClass:=TcxStringValueType;
    cxGrid1DBTableView1DBColumn3.DataBinding.ValueTypeClass:=TcxStringValueType;
    cxGrid1DBTableView1DBColumn4.DataBinding.ValueTypeClass:=TcxStringValueType;
    cxGrid1DBTableView1DBColumn5.DataBinding.ValueTypeClass:=TcxStringValueType;
    cxGrid1DBTableView1DBColumn6.DataBinding.ValueTypeClass:=TcxCurrencyValueType;
    cxGrid1DBTableView1DBSmId.DataBinding.ValueTypeClass:=TcxStringValueType;
    cxGrid1DBTableView1DBSmName.DataBinding.ValueTypeClass:=TcxStringValueType;
    cxGrid1DBTableView1DBRzId.DataBinding.ValueTypeClass:=TcxStringValueType;
    cxGrid1DBTableView1DBRzName.DataBinding.ValueTypeClass:=TcxStringValueType;
    cxGrid1DBTableView1DBStId.DataBinding.ValueTypeClass:=TcxStringValueType;
    cxGrid1DBTableView1DBStName.DataBinding.ValueTypeClass:=TcxStringValueType;
    cxGrid1DBTableView1DBKekvId.DataBinding.ValueTypeClass:=TcxStringValueType;
    cxGrid1DBTableView1DBKekvName.DataBinding.ValueTypeClass:=TcxStringValueType;
    cxGrid1DBTableView1DBInfoId.DataBinding.ValueTypeClass:=TcxStringValueType;


    SelectAll;
 for i :=0 to cxGrid2TableView1.DataController.RecordCount - 1 do
 begin
    cxGrid2TableView1Column_flag_del.DataBinding.DataController.Values[i, 16] := 0;
 end; 

 cxGrid2TableView1.ViewData.Records[0].Focused:=True;
 cxGrid1DBTableView1.ViewData.Records[0].Focused:=True;

 record_p := cxGrid2TableView1.DataController.RecordCount;
// Label2.Caption := DataSet.FBN('RATE_ACC').AsString;
end;

procedure TfrmUrzbDog.cxGrid2TableView1Column_kekvPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  res : variant;
  i : integer;
begin
  i := cxGrid2TableView1Column_id_kekv.DataBinding.DataController.Values[cxGrid2TableView1Column_id_kekv.DataBinding.DataController.FocusedRecordIndex, 0];
  //i := cxGrid2TableView1Column_id_kekv.DataBinding.DataController.FocusedRowIndex;
  res := GlobalSPR.GetKEKVSpr(self,WorkDatabase.Handle, fsNormal, Date, 1);
  if VarArrayDimCount(res) > 0 then
  begin
      if (res[0][0]<>null) and (res[0][1]<>null) then
      begin
          cxGrid2TableView1Column_id_kekv.DataBinding.DataController.Values[i - 1, 7] := res[0][0];               //Id
          cxGrid2TableView1Column_kekv.DataBinding.DataController.Values[i - 1, 1] := res[0][2]; //Kod
      end;
  end;
end;

procedure TfrmUrzbDog.cxButton_cancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmUrzbDog.cxButton_okClick(Sender: TObject);
begin
  SaveDog;
 (Owner as TfrmReeUrzb).SelectAll;
end;

procedure TfrmUrzbDog.dxBarLargeButton_add_dogClick(Sender: TObject);
var
  //DataSetDogovor : TpFIBDataSet;
  //i: Integer;
  //id_cust_native: Int64;
  //name_cust_native: String;
  //date_end_dog: TDate;
  //date_beg_dog: TDate;
  new_date_pl_beg, new_date_pl_end: string;
  myYear, myMonth, myDay : Word;
  mydatebeg, mydateend : TDate;
  Add: Variant;
  tmp_val, cnt, i, j, id_native_cust, ndogFlag: Integer;
  native_cust, native_edrpou, native_cust_edrpou : string;
  id_adding_flag:Integer;
  AAddKekv : TfrmAddKekv;
  DateSetTemp : TpFIBDataSet;
begin
  AAddKekv:=TfrmAddKekv.Create(self, WorkDatabase.Handle);
  if (AAddKekv.ShowModal <> MrOk) then Exit;
  record_p:=record_p + 1;
  DecodeDate(now, myYear, myMonth, myDay);
  if ((myMonth=1) or (myMonth=3) or (myMonth=5) or (myMonth=7) or (myMonth=8) or (myMonth=10) or (myMonth=12))  then
    if (myMonth <= 9) then
      new_date_pl_end := '31.0'+IntToStr(myMonth)+'.'+IntToStr(myYear)
    else new_date_pl_end := '31.'+IntToStr(myMonth)+'.'+IntToStr(myYear)
  else
  if (myMonth <= 9) and (myMonth <> 2) then
    new_date_pl_end := '30.0'+IntToStr(myMonth)+'.'+IntToStr(myYear)
    else new_date_pl_end := '30.'+IntToStr(myMonth)+'.'+IntToStr(myYear);
  if (myMonth = 2) then new_date_pl_end := '28.0'+IntToStr(myMonth)+'.'+IntToStr(myYear);
  mydateend:= StrToDate(new_date_pl_end);

  if (myMonth <= 9) then
      new_date_pl_beg := '01.0'+IntToStr(myMonth)+'.'+IntToStr(myYear)
  else new_date_pl_beg := '01.'+IntToStr(myMonth)+'.'+IntToStr(myYear);
  mydatebeg:= StrToDate(new_date_pl_beg);

  Q1.Close;
  Q1.SQL.Text:='SELECT first 1 d.id_customer_invoices as idcust, c.name_customer as ncust, c.kod_edrpou as edrpou FROM dog_sys_options d, pub_sp_customer c where d.id_customer_invoices = c.id_customer';
  Q1.ExecQuery;
  id_native_cust:= Q1.FldByName['idcust'].AsInt64;
  native_cust:= Q1.FldByName['ncust'].AsString;
  native_edrpou:= Q1.FldByName['edrpou'].AsString;
  native_cust_edrpou:=native_cust + ' (' + native_edrpou + ')';
  Q1.Close;


  Q1.SQL.Text := 'select ADD_NUM_REE from DOG_SYS_OPTIONS';
  Q1.ExecQuery;
  ndogFlag := Q1.FldByName['ADD_NUM_REE'].AsInteger;
  Q1.Close;

  StProc.Transaction.StartTransaction;
  StProc.StoredProcName:='DOG_REE_URZB_GET_BANK_ACC';
  StProc.ParamByName('ID_URZB').AsInteger:=id_urzb;
  StProc.ExecProc;
  StProc.Transaction.Commit;

  //Label4.Caption:= StProc.FldByName['NUMBER_URZB'].AsString

  //DateSetTemp := TpFIBDataSet.Create(Self);
  //DateSetTemp.Database :=  WorkDatabase;
  //DateSetTemp.Transaction :=  RTransaction;
  //DateSetTemp.SQLs.SelectSQL.Add('SELECT first 1 d.name_full FROM sys_options s, sp_department d where s.st_department = d.id_department');
  //native_cust:=DataSet.FieldByName('d.name_full').AsVString;

  cxGrid2TableView1Column_n_uz.DataBinding.DataController.RecordCount := cxGrid2TableView1Column_n_uz.DataBinding.DataController.RecordCount + 1;
   for i := cxGrid2TableView1Column_n_uz.DataBinding.DataController.RecordCount-1  to cxGrid2TableView1Column_n_uz.DataBinding.DataController.RecordCount-1  do
   begin
      cxGrid2TableView1Column_n_uz.DataBinding.ValueTypeClass := TcxIntegerValueType;       // 1
      cxGrid2TableView1Column_n_uz.DataBinding.DataController.Values[i, 0] := record_p;

      cxGrid2TableView1Column_kekv.DataBinding.ValueTypeClass := TcxStringValueType;       // 2
      cxGrid2TableView1Column_kekv.DataBinding.DataController.Values[i, 1] := AAddKekv.cxMaskEdit_kekv.Text;

      cxGrid2TableView1Column_d_dog.DataBinding.ValueTypeClass := TcxDateTimeValueType;    // 3
      cxGrid2TableView1Column_d_dog.DataBinding.DataController.Values[i, 2] := mydatebeg;

      cxGrid2TableView1Column_n_dog.DataBinding.ValueTypeClass := TcxStringValueType;
      if (ndogFlag = 0) then cxGrid2TableView1Column_n_dog.DataBinding.DataController.Values[i, 3] := AAddKekv.cxMaskEdit_kekv.Text
      else cxGrid2TableView1Column_n_dog.DataBinding.DataController.Values[i, 3] := StProc.FldByName['NUMBER_URZB'].AsString;

      cxGrid2TableView1Column_name_cust.DataBinding.ValueTypeClass := TcxStringValueType;  // 5
      cxGrid2TableView1Column_name_cust.DataBinding.DataController.Values[i, 4] := native_cust_edrpou;

      cxGrid2TableView1Column_date_end.DataBinding.ValueTypeClass := TcxDateTimeValueType; // 6
      cxGrid2TableView1Column_date_end.DataBinding.DataController.Values[i, 5] := mydateend;

      cxGrid2TableView1Column_summa.DataBinding.ValueTypeClass := TcxCurrencyValueType;    // 7
      cxGrid2TableView1Column_summa.DataBinding.DataController.Values[i, 6] := AAddKekv.CurrencyEdit_sum_smet.Value;

      cxGrid2TableView1Column_id_kekv.DataBinding.ValueTypeClass := TcxIntegerValueType;   // 8
      cxGrid2TableView1Column_id_kekv.DataBinding.DataController.Values[i, 7] := AAddKekv.id_kekv;

      Q1.Close;
      Q1.SQL.Clear;
      Q1.SQL.Add('select gen_id(KEKV_ID_GEN, 0) + 1 from rdb$database');
      Q1.ExecQuery;
      cxGrid2TableView1Column_id_dog.DataBinding.DataController.Values[i, 8] := Q1.FldByName['ADD'].AsInteger;

      cxGrid2TableView1Column_id_urzb.DataBinding.ValueTypeClass := TcxIntegerValueType;   // 10
      cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[i, 9] := -1;

      cxGrid2TableView1Column_id_customer.DataBinding.ValueTypeClass := TcxCurrencyValueType; // 11
      cxGrid2TableView1Column_id_customer.DataBinding.DataController.Values[i, 10] := id_native_cust;

      cxGrid2TableView1Column_sum_predopl.DataBinding.ValueTypeClass := TcxCurrencyValueType; // 12
      cxGrid2TableView1Column_sum_predopl.DataBinding.DataController.Values[i, 11] := 0;

      cxGrid2TableView1Column_summa_fact_fz.DataBinding.ValueTypeClass := TcxWordValueType;  // 13
      cxGrid2TableView1Column_summa_fact_pay.DataBinding.DataController.Values[i, 12] := 0;

      cxGrid2TableView1Column_summa_fact_pay.DataBinding.ValueTypeClass := TcxCurrencyValueType; // 14
      cxGrid2TableView1Column_summa_fact_pay.DataBinding.DataController.Values[i, 13] := 0;

      cxGrid2TableView1Column_id_rate_acc.DataBinding.ValueTypeClass := TcxIntegerValueType;     // 15
      cxGrid2TableView1Column_id_rate_acc.DataBinding.DataController.Values[i, 14] :=0;

      cxGrid2TableView1Column_reg_nomer.DataBinding.ValueTypeClass  := TcxStringValueType;
      cxGrid2TableView1Column_reg_nomer.DataBinding.DataController.Values[i, 15] := ' ';

      cxGrid2TableView1Column_note.DataBinding.ValueTypeClass  := TcxStringValueType;
      cxGrid2TableView1Column_note.DataBinding.DataController.Values[i, 18] := ' ';

      cxGrid2TableView1Column_date_beg.DataBinding.ValueTypeClass := TcxDateTimeValueType; // 6
      cxGrid2TableView1Column_date_beg.DataBinding.DataController.Values[i, 19] := mydatebeg;

      cxGrid2TableView1ColumnIfKEKV.DataBinding.ValueTypeClass := TcxStringValueType;
      cxGrid2TableView1ColumnIfKEKV.DataBinding.DataController.Values[i, 20] := '1';

      cxGrid2TableView1ColumnOZNTN.DataBinding.ValueTypeClass := TcxStringValueType;
      cxGrid2TableView1ColumnOZNTN.DataBinding.DataController.Values[i, 21] := '';

      cxGrid2TableView1.DataController.Post;

      StoredProc.StoredProcName := 'DOG_REE_URZB_DATA_INSERT';
      StoredProc.Prepare;
      StoredProc.ParamByName('ID_DOG').AsInt64 := cxGrid2TableView1Column_id_dog.DataBinding.DataController.Values[i, 8];
      StoredProc.ParamByName('ID_URZB').AsInt64 := ID_URZB;
      StoredProc.ParamByName('ID_KEKV').AsInt64 := cxGrid2TableView1Column_id_kekv.DataBinding.DataController.Values[i, 7];
      StoredProc.ParamByName('N_DOG').Value := cxGrid2TableView1Column_n_dog.DataBinding.DataController.Values[i, 3];
      StoredProc.ParamByName('D_DOG').Value := cxGrid2TableView1Column_d_dog.DataBinding.DataController.Values[i, 2];
      StoredProc.ParamByName('ID_CUSTOMER').AsInt64 := cxGrid2TableView1Column_id_customer.DataBinding.DataController.Values[i, 10];
      StoredProc.ParamByName('DATE_BEG').Value := cxGrid2TableView1Column_date_beg.DataBinding.DataController.Values[i, 19];
      StoredProc.ParamByName('DATE_END').Value := cxGrid2TableView1Column_date_end.DataBinding.DataController.Values[i, 5];
      StoredProc.ParamByName('SUMMA').Value := cxGrid2TableView1Column_summa.DataBinding.DataController.Values[i, 6];
      StoredProc.ParamByName('SUM_PREDOPL').Value := cxGrid2TableView1Column_sum_predopl.DataBinding.DataController.Values[i, 11];
      StoredProc.ParamByName('NUM_URZB').Value := cxGrid2TableView1Column_n_uz.DataBinding.DataController.Values[i, 0];
      StoredProc.ParamByName('ID_RATE_ACC').AsInt64 := cxGrid2TableView1Column_id_rate_acc.DataBinding.DataController.Values[i, 14];
      StoredProc.ParamByName('NOTE').Value := cxGrid2TableView1Column_note.DataBinding.DataController.Values[i, 18];
      StoredProc.ParamByName('SUM_PAY').AsCurrency:=cxGrid2TableView1Column_summa_fact_pay.DataBinding.DataController.Values[i, 13];
      try
        StoredProc.ExecProc;
        StoredProc.Close;
      except on e: Exception do
      begin
        ShowMessage(e.Message);
        StoredProc.Transaction.Rollback;
        Exit;
      end;
      end;
      StoredProc.Transaction.Commit;
      cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[i, 9] := StoredProc.FldByName['ID_URZB_DATA'].AsInt64;
      cxGrid2TableView1.DataController.Post;

      //ShowMessage(VarToStr(cxGrid1DBTableView1DBNumInfo.DataBinding.DataController.RecordCount+1));
      StProc.Transaction.StartTransaction;
      StProc.StoredProcName := 'DOG_REE_URZB_DATA_INFO_INS';
      StProc.Prepare;
      StProc.ParamByName('ID_URZB_DATA').AsInt64 := cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[i, 9];
      StProc.ParamByName('ID_SMETA').Value := AAddKekv.id_smet;
      StProc.ParamByName('ID_RAZD').Value := AAddKekv.id_razd;
      StProc.ParamByName('ID_ST').Value := AAddKekv.id_stat;
      StProc.ParamByName('ID_KEKV').Value := AAddKekv.id_kekv;
      StProc.ParamByName('SUMMA').Value := AAddKekv.sum_smet;
      StProc.ParamByName('ID_URZB').AsInt64 := ID_URZB;
      StProc.ParamByName('NUMBER_INFO').AsInt64 := cxGrid1DBTableView1DBNumInfo.DataBinding.DataController.RecordCount+1;
      StProc.ExecProc;
      StProc.Close;
      StProc.Transaction.Commit;

      pFIBDataSet1.Close;
      pFIBDataSet1.ParamByName('id_urzb_data').AsInt64 := cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[i, 9];
      pFIBDataSet1.ParamByName('ACTUAL_DATE').AsDate := cxGrid2TableView1Column_date_beg.DataBinding.DataController.Values[i, 19];
      pFIBDataSet1.Active := true;
      pFIBDataSet1.FetchAll;
      cxGrid1DBTableView1.DataController.RecordCount := pFIBDataSet1.RecordCount;
      for j:=0 to cxGrid1DBTableView1.DataController.RecordCount - 1 do
      begin
        cxGrid1DBTableView1DBNumInfo.DataBinding.DataController.Values[j, 0]:= pFIBDataSet1['NUMBER_INFO'];
        cxGrid1DBTableView1DBColumn1.DataBinding.DataController.Values[j, 1]:= cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[cxGrid2TableView1Column_id_urzb.DataBinding.DataController.FocusedRecordIndex, 9];
        cxGrid1DBTableView1DBColumn2.DataBinding.DataController.Values[j, 2]:= pFIBDataSet1['SMETA_KOD'];
        cxGrid1DBTableView1DBColumn3.DataBinding.DataController.Values[j, 3] := pFIBDataSet1['RAZD_KOD'];
        cxGrid1DBTableView1DBColumn4.DataBinding.DataController.Values[j, 4] := pFIBDataSet1['ST_KOD'];
        cxGrid1DBTableView1DBColumn5.DataBinding.DataController.Values[j, 5] := pFIBDataSet1['KEKV_KOD'];
        cxGrid1DBTableView1DBColumn6.DataBinding.DataController.Values[j, 6] := StrToCurr(pFIBDataSet1['SUMMA']);
        cxGrid1DBTableView1DBSmId.DataBinding.DataController.Values[j, 7] := pFIBDataSet1['ID_SMETA'];
        cxGrid1DBTableView1DBSmName.DataBinding.DataController.Values[j, 8] := pFIBDataSet1['SMETA_NAME'];
        cxGrid1DBTableView1DBRzId.DataBinding.DataController.Values[j, 9] := pFIBDataSet1['ID_RAZD'];
        cxGrid1DBTableView1DBRzName.DataBinding.DataController.Values[j, 10] := pFIBDataSet1['RAZD_NAME'];
        cxGrid1DBTableView1DBStId.DataBinding.DataController.Values[j, 11] := pFIBDataSet1['ID_ST'];
        cxGrid1DBTableView1DBStName.DataBinding.DataController.Values[j, 12] := pFIBDataSet1['ST_NAME'];
        cxGrid1DBTableView1DBKekvId.DataBinding.DataController.Values[j, 13] := pFIBDataSet1['ID_KEKV'];
        cxGrid1DBTableView1DBKekvName.DataBinding.DataController.Values[j, 14] := pFIBDataSet1['KEKV_NAME'];
        cxGrid1DBTableView1DBInfoId.DataBinding.DataController.Values[j, 15] := pFIBDataSet1['ID_INFO'];
        pFIBDataSet1.Next;
      end;
     end;
     AAddKekv.Close;

     //with cxGrid2TableView1.DataController do FocusedRecordIndex := FindRecordIndexByText(0, 8, IntToStr(id_dog), False, True, True);
     //ShowMessage(VarToStr(cxGrid2TableView1.DataController.RecordCount));
     cxGrid2TableView1.ViewData.Records[cxGrid2TableView1.DataController.RecordCount-1].Focused:=True;
     //cxGrid1DBTableView1.ViewData.Records[0].Focused:=True;
end;


function TfrmUrzbDog.GetIdKekv(id: Int64; summa: Variant; kod_kekv: Integer): Variant;
begin
  id_kekv_dog  := id;
  summa_dog    := summa;
  kod_kekv_dog := kod_kekv;
end;

procedure TfrmUrzbDog.cxGrid2TableView1Column_reg_nomerPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  DateSetTemp : TpFIBDataSet;
begin
  if cxGrid2TableView1.Controller.SelectedRecords[0].Values[8] = -1 then Exit;
  DateSetTemp := TpFIBDataSet.Create(Self);
  DateSetTemp.Database :=  WorkDatabase;
  DateSetTemp.Transaction :=  RTransaction;
  DateSetTemp.SQLs.SelectSQL.Add('SELECT p.id_tip_dog, s.name_shablon ' +
    'FROM   dog_dt_document d, pub_sp_tip_dog p, dog_ini_shablon s ' +
    'WHERE  d.id_tip_dog=p.id_tip_dog ' +
    'AND    p.id_ini_shablon=s.id_shablon ' +
    'AND    d.id_dog = ' + IntToStr(cxGrid2TableView1.Controller.SelectedRecords[0].Values[8]));
  LoadDogManedger.LoadShablon(self, WorkDatabase.Handle, fsNormal,
                                     cxGrid2TableView1.Controller.SelectedRecords[0].Values[8],
                                      'prosmotr', DataSet.FieldByName('id_tip_dog').AsVariant, PChar(DataSet.FieldByName('name_shablon').asString), nil);
end;

procedure TfrmUrzbDog.FormShow(Sender: TObject);
begin
  LoadPositionFromRegistry(Self);
end;

procedure TfrmUrzbDog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SavePositionToRegistry(Self);
  Action := caFree;
end;

procedure TfrmUrzbDog.okExecute(Sender: TObject);
begin
  cxButton_okClick(Self);
end;

procedure TfrmUrzbDog.cxGrid2TableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Arect: TRect;
begin
  Arect := AViewInfo.Bounds;
  ACanvas.Canvas.Pen.Color := clBlack;
  if AViewInfo.GridRecord.Values[16] = 1 then
    begin
      ACanvas.Canvas.Font.Color := clRed;
      ACanvas.Canvas.Font.Style := [fsStrikeOut];
      ACanvas.Canvas.FillRect(Arect);
    end
    else
    begin
      ACanvas.Canvas.Font.Color := clBlack;
      ACanvas.Canvas.Font.Style := [];
      ACanvas.Canvas.FillRect(Arect);
    end;
end;

procedure TfrmUrzbDog.DelUrzb (ii: Integer);
var
  i : Integer;
begin
    i := ii;
    StoredProc.StoredProcName := 'DOG_REE_URZB_DATA_DELETE';
    StoredProc.Prepare;
    StoredProc.ParamByName('ID_URZB_DATA').AsInt64 := cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[i, 9];
    try
     StoredProc.ExecProc;
     StoredProc.Close;
    except on e: Exception do
      begin
        ShowMessage(e.Message);
        StoredProc.Transaction.Rollback;
        Exit;
      end;
    end;
    StoredProc.Transaction.Commit;
end;

procedure TfrmUrzbDog.addExecute(Sender: TObject);
begin
  dxBarLargeButton_addClick(Self);
end;

procedure TfrmUrzbDog.deleExecute(Sender: TObject);
begin
  dxBarLargeButton_delClick(Self);
end;

procedure TfrmUrzbDog.PrintButtonClick(Sender: TObject);
begin

// (Owner as TfrmReeUrzb).DiscForOwner:=cbDBFPath.Text;
 (Owner as TfrmReeUrzb).printExecute(self);
 self.SetFocus;
 // Печать текущего реестра
end;
// -----------------------------------------------------------------------------
// Процедура доливки заявок, не вошедших в юр.обязательства, но по которым
// уже есть готовые платёжки, за дату Д1 - Д2.
//
procedure TfrmUrzbDog.dxBarLargeButton2Click(Sender: TObject);
var
  ChForm:TDateChooseForm;
begin
  ChForm:=TDateChooseForm.Create(self);

  Q1.Close;
  Q1.SQL.Text:='select NUM_REESTR as max_num from DOG_DT_PL_REE order by id_reestr desc';
  Q1.ExecQuery;

  ChForm.NumEdit.EditValue:= Q1.FldByName['max_num'].AsInt64;
  Q1.Close;
  if (ChForm.ShowModal <> MrOk) then Exit;

  //StProc2.Transaction.StartTransaction;
  //StProc2.StoredProcName:='DOG_REE_URZB_NUMBER';
  //StProc2.ExecProc;
  //p2 := StProc2.FldByName['NUMBER'].AsInteger;
  //StProc2.Transaction.Commit;

  StProc.Transaction.StartTransaction;
  StProc.StoredProcName:='DOG_REE_URZB_MAKE_ALL_FILTER';
  StProc.ParamByName('ID_RATE_ACC_NATIVE_IN').AsInteger:=id_rate_acc_nat;
  StProc.ParamByName('NUM_REE').AsInteger:=ChForm.NumEdit.EditValue ;
  StProc.ParamByName('ID_URZB').AsInteger:=id_urzb;
  StProc.ParamByName('P').AsInteger:=record_p;
  StProc.ExecProc;

  record_p:=record_p+StProc.FldByName['ALL_CNT'].AsInteger;
  ShowMessage('Додано '+StProc.FldByName['ALL_CNT'].AsString + ' договорiв!');
  StProc.Transaction.Commit;

  SelectAll;

  cxGrid2TableView1.ViewData.Records[cxGrid2TableView1.DataController.RecordCount-1].Focused:=True;
end;

procedure TfrmUrzbDog.dxBarButton3Click(Sender: TObject); //Гребенник М. 23.09.2013
var
  date_new : string;
  new_date_pl : string;
  myYear, myMonth, myDay : Word;
  mydate : TDate;
begin
 DecodeDate(now, myYear, myMonth, myDay);
 if ((myMonth=1) or (myMonth=3) or (myMonth=5) or (myMonth=7) or (myMonth=8) or (myMonth=10) or (myMonth=12))  then
  if (myMonth <= 9) then
    new_date_pl := '31.0'+IntToStr(myMonth)+'.'+IntToStr(myYear)
    else new_date_pl := '31.'+IntToStr(myMonth)+'.'+IntToStr(myYear)
 else
 if (myMonth <= 9) and (myMonth <> 2) then
    new_date_pl := '30.0'+IntToStr(myMonth)+'.'+IntToStr(myYear)
    else new_date_pl := '30.'+IntToStr(myMonth)+'.'+IntToStr(myYear);
 if (myMonth = 2) then new_date_pl := '28.0'+IntToStr(myMonth)+'.'+IntToStr(myYear);
  mydate:= StrToDate(new_date_pl);
 cxGrid2TableView1Column_date_end.DataBinding.DataController.Values[cxGrid2TableView1Column_date_end.DataBinding.DataController.FocusedRecordIndex, 5] := mydate;
end;

procedure TfrmUrzbDog.N1Click(Sender: TObject);
var
 Res : TDogResult;
 input : TDogInput;
 DataSetDog : TpFIBDataSet;
 i: Integer;
 StrTMP: string;
begin
 DataSetDog := TpFIBDataSet.Create(Self);
 DataSetDog.Database := WorkDatabase;
 DataSetDog.Transaction := RTransaction;
 DataSetDog.Active := false;
 DataSetDog.SQLs.SelectSQL.Add('SELECT * FROM   dog_ini_def_group g WHERE  g.id=8');
 DataSetDog.Active := true;

 input              := SYS_DEFAULT_DOG_INPUT;
 input.Owner        := Self;
 input.DBHandle     := WorkDatabase.Handle;
 input.ReadTrans    := RTransaction.Handle;
 input.WriteTrans   := WTransaction.Handle;
 input.FormStyle    := fsNormal;

 input.isZayav      := false;


 input.id_Group_add := DataSetDog.FBN('ID_GROUP').AsInteger;
 input.id_Group     := DataSetDog.FBN('ID_GROUP').AsInteger;
 input.filter.bUseFilter:=true;

 input.filter.bDate:=true;
 input.filter.bShowFilterForm:=true;
 input.filter.DateBeg := now;
 input.filter.DateEnd := now;


 res := ShowDogMain(input);

 if res.ModalResult <> mrOk then Exit;

 if id_rate_acc_nat <> res.id_rate_acc_nat then
 begin
   if MessageBox(Handle,PChar('Данный договор сформирован на счет, отличающийся от счета реестра юр. обязательств. Привязать?'),
   'Підтвердження',MB_YesNo or MB_Iconquestion) <> mrYes then Exit;
 end;

 id_Dog            := res.id_dog;
 DataSetDog.Active := false;
 DataSetDog.SQLs.SelectSQL.Text := 'select * from dog_ree_urzb_data_sel_by_id_dog(' + IntToStr(id_dog) + ')';

 DataSetDog.Active := true;
 DataSetDog.FetchAll;
 DataSetDog.First;

 i:=cxGrid2TableView1Column_n_uz.DataBinding.DataController.FocusedRecordIndex;
 cxGrid2TableView1Column_id_dog.DataBinding.DataController.Values[i, 8] := DataSetDog.FBN('ID_DOG').AsString;
 ShowMessage('Договор привязан!');

end;


procedure TfrmUrzbDog.dxBarButton5Click(Sender: TObject);
begin
  TypeAddDog:=TypeAddDog_by_sp_dog;
end;


procedure TfrmUrzbDog.dxBarButton6Click(Sender: TObject);
begin
  TypeAddDog:=TypeAddDog_by_plat;
end;


procedure TfrmUrzbDog.cxGrid2TableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
  var
    i : Integer;
begin
  //if (cxGrid2TableView1.DataController.RecordCount <> 0) then
  //begin

    pFIBDataSet1.Close;
    pFIBDataSet1.ParamByName('id_urzb_data').AsInt64 := cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[cxGrid2TableView1Column_id_urzb.DataBinding.DataController.FocusedRecordIndex, 9];
    pFIBDataSet1.ParamByName('ACTUAL_DATE').AsDate := cxGrid2TableView1Column_date_beg.DataBinding.DataController.Values[cxGrid2TableView1Column_id_urzb.DataBinding.DataController.FocusedRecordIndex, 19];
    pFIBDataSet1.Active := true;
    pFIBDataSet1.FetchAll;
    cxGrid1DBTableView1.DataController.RecordCount := pFIBDataSet1.RecordCount;
    for i:=0 to cxGrid1DBTableView1.DataController.RecordCount - 1 do
    begin
      cxGrid1DBTableView1DBNumInfo.DataBinding.DataController.Values[i, 0]:=pFIBDataSet1['NUMBER_INFO'];
      cxGrid1DBTableView1DBColumn1.DataBinding.DataController.Values[i, 1]:= cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[cxGrid2TableView1Column_id_urzb.DataBinding.DataController.FocusedRecordIndex, 9];
      cxGrid1DBTableView1DBColumn2.DataBinding.DataController.Values[i, 2]:= pFIBDataSet1['SMETA_KOD'];
      cxGrid1DBTableView1DBColumn3.DataBinding.DataController.Values[i, 3] := pFIBDataSet1['RAZD_KOD'];
      cxGrid1DBTableView1DBColumn4.DataBinding.DataController.Values[i, 4] := pFIBDataSet1['ST_KOD'];
      cxGrid1DBTableView1DBColumn5.DataBinding.DataController.Values[i, 5] := pFIBDataSet1['KEKV_KOD'];
      cxGrid1DBTableView1DBColumn6.DataBinding.DataController.Values[i, 6] := StrToCurr(pFIBDataSet1['SUMMA']);
      cxGrid1DBTableView1DBSmId.DataBinding.DataController.Values[i, 7] := pFIBDataSet1['ID_SMETA'];
      cxGrid1DBTableView1DBSmName.DataBinding.DataController.Values[i, 8] := pFIBDataSet1['SMETA_NAME'];
      cxGrid1DBTableView1DBRzId.DataBinding.DataController.Values[i, 9] := pFIBDataSet1['ID_RAZD'];
      cxGrid1DBTableView1DBRzName.DataBinding.DataController.Values[i, 10] := pFIBDataSet1['RAZD_NAME'];
      cxGrid1DBTableView1DBStId.DataBinding.DataController.Values[i, 11] := pFIBDataSet1['ID_ST'];
      cxGrid1DBTableView1DBStName.DataBinding.DataController.Values[i, 12] := pFIBDataSet1['ST_NAME'];
      cxGrid1DBTableView1DBKekvId.DataBinding.DataController.Values[i, 13] := pFIBDataSet1['ID_KEKV'];
      cxGrid1DBTableView1DBKekvName.DataBinding.DataController.Values[i, 14] := pFIBDataSet1['KEKV_NAME'];
      cxGrid1DBTableView1DBInfoId.DataBinding.DataController.Values[i, 15] := pFIBDataSet1['ID_INFO'];
      pFIBDataSet1.Next; 
    end;

  // end;
end;



procedure TfrmUrzbDog.dxBarLargeButton3Click(Sender: TObject);  //Гребенник М. 23.09.2013
var
  date_new : string;
  new_date_pl : string;
  myYear, myMonth, myDay : Word;
  mydate : TDate;
begin
  DecodeDate(now, myYear, myMonth, myDay);
  if ((myMonth=1) or (myMonth=3) or (myMonth=5) or (myMonth=7) or (myMonth=8) or (myMonth=10) or (myMonth=12))  then
    if (myMonth <= 9) then
      new_date_pl := '31.0'+IntToStr(myMonth)+'.'+IntToStr(myYear)
      else new_date_pl := '31.'+IntToStr(myMonth)+'.'+IntToStr(myYear)
  else
  if (myMonth <= 9) and (myMonth <> 2) then
    new_date_pl := '30.0'+IntToStr(myMonth)+'.'+IntToStr(myYear)
    else new_date_pl := '30.'+IntToStr(myMonth)+'.'+IntToStr(myYear);
  if (myMonth = 2) then new_date_pl := '28.0'+IntToStr(myMonth)+'.'+IntToStr(myYear);
  mydate:= StrToDate(new_date_pl);
  cxGrid2TableView1Column_date_end.DataBinding.DataController.Values[cxGrid2TableView1Column_date_end.DataBinding.DataController.FocusedRecordIndex, 5] := mydate;
end;

procedure TfrmUrzbDog.dxBarLargeButton5Click(Sender: TObject);
var
  path : String;
  dirSch, count_z : String;
  i, k, m : Integer;
  id_reestr : array of integer;
  rs : TResourceStream;
  selected : integer;
  f : TForm;
  error_mes_note : String;
begin
  if (cbKod.CurItemIndex = 0) then DbfExport.TranslateASCII := True
      else DbfExport.TranslateASCII := False;

 if (cbDBFPath.Text = 'A:\') then
 begin
   if(DiscInDrive('A') <> true) then
   begin
    ShowMessage('Невозможно произвести экспорт!');
    Exit;
   end;
 end;

  f := WaitScreenShowWithProgress(Self, 60, 'Іде експорт...');

  DataSetExport.Close;
  DataSetExport.ParamByName('id_urzb').AsInt64 := id_urzb;
  DataSetExport.ParamByName('kod_type').AsInt64 := cbKod.CurItemIndex;
  DataSetExport.Open;
  DataSetExport.FetchAll;

  for m :=1 to (5-Length(DataSetExport.FBN('NREE').AsString))  do
    count_z := count_z+'0';

   dirSch:=DiscForOwner+'U-'+count_z+DataSetExport.FBN('NREE').AsString+'-'+DataSetExport.FBN('RATE_ACC').AsString+'\';
    if (DiscForOwner<>'') then begin
    if DirectoryExists(DiscForOwner+dirSch)=false then
    begin
      MkDir(DiscForOwner+'U-'+count_z+DataSetExport['nree'].AsString+'-'+DataSetExport['RATE_ACC'].AsString);
    end
  end
  else
    if DirectoryExists(cbDBFPath.Text+dirSch)=false then
    begin
      MkDir(cbDBFPath.Text+'U-'+count_z+DataSetExport.FBN('NREE').AsString+'-'+DataSetExport.FBN('RATE_ACC').AsString);
    end;

  if (DiscForOwner<>'') then
  begin
    path := DiscForOwner +dirSch+ DataSetExport.FBN('NAME_DBF').AsString;
  end
  else
  begin
    path := cbDBFPath.Text +dirSch+ DataSetExport.FBN('NAME_DBF').AsString;
  end;

  DbfExport.Close;
  DbfExport.DatabaseName := ExtractFilePath(path);
  DbfExport.TableName := ExtractFileName(path);

 if FileExists(path) then
 begin
   if MessageBox(Handle,PChar('DBF Файл вже існує. Перезаписати?'),
     'Підтвердження',MB_YesNo or MB_Iconquestion) = mrYes then
   begin
     DeleteFile(path);
   end
   else
   begin
    Exit;
   end;
   end;
  if (NewDbfTableCreate.Execute) then
  begin
    DbfExport.Exclusive := true;
    DbfExport.Open;
  end
  else
  begin
    ShowMessage('Неможливо створити файл!');
    Exit;
  end;

  DataSetExport.First;

  for i := 0 to DataSetExport.RecordCount - 1 do
  begin
    DbfExport.Append;
    DbfExport['OP'] := DataSetExport.FBN('OP').AsInteger;
    DbfExport['NP'] := DataSetExport.FBN('NP').AsInteger;
    DbfExport['DATER'] := DataSetExport.FBN('DATER').AsDateTime;
    DbfExport['RRAX'] := DataSetExport.FBN('RRAX').AsString;
    DbfExport['KPK'] := StrToInt(DataSetExport.FBN('KPK').AsString);
    DbfExport['KFK'] := StrToInt(DataSetExport.FBN('KFK').AsString);
    DbfExport['KVK'] := StrToInt(DataSetExport.FBN('KVK').AsString);
    DbfExport['KPOL'] := DataSetExport.FBN('KPOL').AsInteger;
    DbfExport['KEKV'] := DataSetExport.FBN('KEKV').AsInteger;
    DbfExport['NDOC'] := DataSetExport.FBN('NDOC').AsString;
    DbfExport['DATEDOC'] := DataSetExport.FBN('DATEDOC').AsDateTime;
    DbfExport['S'] := DataSetExport.FBN('S').AsCurrency;
    DbfExport['SO'] := DataSetExport.FBN('SO').AsCurrency;
    DbfExport['EDRPOUK'] := DataSetExport.FBN('EDRPOUK').AsString;
    DbfExport['POLUT'] := DataSetExport.FBN('POLUT').AsString;
    DbfExport['DATETERM'] := DataSetExport.FBN('DATETERM').AsDateTime;
    DbfExport['SK'] := DataSetExport.FBN('SK').AsInteger;
    DbfExport['EDRPOUR'] := DataSetExport.FBN('EDRPOUR').AsString;
    DbfExport['NAMER'] := DataSetExport.FBN('NAMER').AsString;
    DbfExport['NOTE'] := DataSetExport.FBN('NOTE').AsString;
    DbfExport['BUDGET'] := DataSetExport.FBN('BUDGET').AsString;
    DbfExport['NREE'] := DataSetExport.FBN('NREE').AsInteger;
    DbfExport['DATEPOCH'] := DataSetExport.FBN('DATEPOCH').AsDateTime;
    DbfExport['OZNTN'] := DataSetExport.FBN('OZNTN').AsString;
    error_mes_note := DataSetExport.FBN('error_mes_note').AsString;
    DbfExport.Post;
    DataSetExport.Next;
    WaitScreenStep(F);
  end;
  DbfExport.Exclusive := false;
  DbfExport.Close;
  WaitScreenClose(f);
  if(error_mes_note <> '0') then ShowMessage('Примітка була обрізана до 20 символів.');
  ShowMessage('Експорт завершено.');
end;

function TfrmUrzbDog.DiscInDrive(Drive: char): Boolean;
var
  ErrorMode: Word;
begin
  ErrorMode := SetErrorMode(SEM_FailCriticalErrors);
  try
    if DiskSize(Ord(Drive) - $40) = -1 then
      Result := False
    else
      Result := True;
  finally
    SetErrorMode(ErrorMode);
  end;
end;



procedure TfrmUrzbDog.Timer1Timer(Sender: TObject);
var
 r: LongWord;
 Drives: array[0..128] of char;
 pDrive: PChar;
 k     : Integer;
begin
 DiskTree:=TStringList.Create();
 DiskTree.Clear;
 DiskTree.Add('A:\');
 DiskTree.Add('C:\');

 r := GetLogicalDriveStrings(SizeOf(Drives), Drives);
 if r = 0 then Exit;
 if r > SizeOf(Drives) then
 raise Exception.Create(SysErrorMessage(ERROR_OUTOFMEMORY));
 pDrive := Drives;

 while pDrive^ <> #0 do
 begin
  if GetDriveType(pDrive) = DRIVE_REMOVABLE then
  begin
    if pDrive <> 'A:\' then
    begin
     if cbDBFPath.Items.IndexOf(pDrive) = -1 then
     begin
       cbDBFPath.Items.Add(pDrive);
     end;
     DiskTree.Add(pDrive);
    end;

  end;
  Inc(pDrive, 4);
 end;

  for k:=0 to cbDBFPath.Items.Count - 1 do
  begin
    if DiskTree.IndexOf(cbDBFPath.Items[k]) = -1  then
    begin
     cbDBFPath.Items.Delete(k);
     cbDBFPath.Text:='A:\';
    end;
  end;
end;

procedure TfrmUrzbDog.dxBarLargeButton_editClick(Sender: TObject);
var
  BAddKekv : TfrmAddKekv;
  Add: Variant;
  tmp_val, cnt, i, j: Integer;
  id_adding_flag:Integer;
begin
  BAddKekv:=TfrmAddKekv.Create(self, WorkDatabase.Handle);
  BAddKekv.id_smet:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,6];
  BAddKekv.kod_smet:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,1];
  BAddKekv.name_smet:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,7];
  BAddKekv.cxButtonEdit_name_smet.Text := cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,7];
  BAddKekv.cxMaskEdit_kod_smeti.Text := cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,1];

  BAddKekv.id_razd:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,8];
  BAddKekv.nomer_razd:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,2];
  BAddKekv.name_razd:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,9];
  BAddKekv.cxMaskEdit_n_razd.Text:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,2];
  BAddKekv.cxTextEdit_name_razd.Text:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,9];

  BAddKekv.id_stat:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,10];
  BAddKekv.nomer_stat:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,3];
  BAddKekv.name_stat:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,11];
  BAddKekv.cxMaskEdit_n_stat.Text:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,3];
  BAddKekv.cxTextEdit_stat.Text:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,11];

  BAddKekv.id_kekv:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,12];
  BAddKekv.kod_kekv:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,4];
  BAddKekv.name_kekv:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,13];
  BAddKekv.cxMaskEdit_kekv.Text:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,4];
  BAddKekv.cxButtonEdit_name_kekv.Text:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,13];

  BAddKekv.sum_smet:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,5];
  BAddKekv.CurrencyEdit_sum_smet.Text:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,5];

  if (BAddKekv.ShowModal <> MrOk) then Exit
  else
  begin
      StProc.Transaction.StartTransaction;
      StProc.StoredProcName := 'DOG_REE_URZB_DATA_INFO_UPD';
      StProc.Prepare;
      StProc.ParamByName('ID_URZB_DATA').AsInt64 := cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[cxGrid2TableView1.DataController.FocusedRecordIndex, 9];
      StProc.ParamByName('ID_SMETA').Value := BAddKekv.id_smet;
      StProc.ParamByName('ID_RAZD').Value := BAddKekv.id_razd;
      StProc.ParamByName('ID_ST').Value := BAddKekv.id_stat;
      StProc.ParamByName('ID_KEKV').Value := BAddKekv.id_kekv;
      StProc.ParamByName('SUMMA').Value := BAddKekv.sum_smet;
      StProc.ParamByName('ID_URZB').AsInt64 := ID_URZB;
      StProc.ParamByName('ID_INFO').AsInt64 := cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,14];
      StProc.ParamByName('NUMBER_INFO').AsInt64 :=  cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,0];
      StProc.ExecProc;
      StProc.Close;
      StProc.Transaction.Commit;

      pFIBDataSet1.Close;
      pFIBDataSet1.ParamByName('id_urzb_data').AsInt64 := cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[cxGrid2TableView1Column_id_urzb.DataBinding.DataController.FocusedRecordIndex, 9];
      pFIBDataSet1.ParamByName('ACTUAL_DATE').AsDate := cxGrid2TableView1Column_date_beg.DataBinding.DataController.Values[cxGrid2TableView1Column_id_urzb.DataBinding.DataController.FocusedRecordIndex, 19];
      pFIBDataSet1.Active := true;
      pFIBDataSet1.FetchAll;
      cxGrid1DBTableView1.DataController.RecordCount := pFIBDataSet1.RecordCount;
      for j:=0 to cxGrid1DBTableView1.DataController.RecordCount - 1 do
      begin
        cxGrid1DBTableView1DBNumInfo.DataBinding.DataController.Values[j, 0]:= pFIBDataSet1['NUMBER_INFO'];
        cxGrid1DBTableView1DBColumn1.DataBinding.DataController.Values[j, 1]:= cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[cxGrid2TableView1Column_id_urzb.DataBinding.DataController.FocusedRecordIndex, 9];
        cxGrid1DBTableView1DBColumn2.DataBinding.DataController.Values[j, 2]:= pFIBDataSet1['SMETA_KOD'];
        cxGrid1DBTableView1DBColumn3.DataBinding.DataController.Values[j, 3] := pFIBDataSet1['RAZD_KOD'];
        cxGrid1DBTableView1DBColumn4.DataBinding.DataController.Values[j, 4] := pFIBDataSet1['ST_KOD'];
        cxGrid1DBTableView1DBColumn5.DataBinding.DataController.Values[j, 5] := pFIBDataSet1['KEKV_KOD'];
        cxGrid1DBTableView1DBColumn6.DataBinding.DataController.Values[j, 6] := StrToCurr(pFIBDataSet1['SUMMA']);
        cxGrid1DBTableView1DBSmId.DataBinding.DataController.Values[j, 7] := pFIBDataSet1['ID_SMETA'];
        cxGrid1DBTableView1DBSmName.DataBinding.DataController.Values[j, 8] := pFIBDataSet1['SMETA_NAME'];
        cxGrid1DBTableView1DBRzId.DataBinding.DataController.Values[j, 9] := pFIBDataSet1['ID_RAZD'];
        cxGrid1DBTableView1DBRzName.DataBinding.DataController.Values[j, 10] := pFIBDataSet1['RAZD_NAME'];
        cxGrid1DBTableView1DBStId.DataBinding.DataController.Values[j, 11] := pFIBDataSet1['ID_ST'];
        cxGrid1DBTableView1DBStName.DataBinding.DataController.Values[j, 12] := pFIBDataSet1['ST_NAME'];
        cxGrid1DBTableView1DBKekvId.DataBinding.DataController.Values[j, 13] := pFIBDataSet1['ID_KEKV'];
        cxGrid1DBTableView1DBKekvName.DataBinding.DataController.Values[j, 14] := pFIBDataSet1['KEKV_NAME'];
        cxGrid1DBTableView1DBInfoId.DataBinding.DataController.Values[j, 15] := pFIBDataSet1['ID_INFO'];
        pFIBDataSet1.Next;
      end;

      cxGrid2TableView1Column_kekv.DataBinding.DataController.Values[cxGrid2TableView1.DataController.FocusedRecordIndex, 1] := BAddKekv.cxMaskEdit_kekv.Text;
      //cxGrid2TableView1Column_summa.DataBinding.DataController.Values[cxGrid2TableView1.DataController.FocusedRecordIndex, 6] := cxGrid1DBTableView1.DataController.Summary.FooterSummaryValues[0];  //frmAddKekv.CurrencyEdit_sum_smet.Value;
      cxGrid2TableView1Column_id_kekv.DataBinding.DataController.Values[cxGrid2TableView1.DataController.FocusedRecordIndex, 7] := BAddKekv.id_kekv;
      cxGrid2TableView1.DataController.Post;
      if (cxGrid2TableView1Column_summa.DataBinding.DataController.Values[i, 6] <> cxGrid1DBTableView1.DataController.Summary.FooterSummaryValues[0]) then ShowMessage('Увага! Сума по кошторисам не збігається з сумою юридичного зобов''язання!');

    for i := 0 to cxGrid2TableView1Column_n_uz.DataBinding.DataController.RecordCount - 1 do
     begin
      StoredProc.StoredProcName := 'DOG_REE_URZB_DATA_UPD';
      StoredProc.Prepare;
      StoredProc.ParamByName('ID_DOG').AsInt64 := cxGrid2TableView1Column_id_dog.DataBinding.DataController.Values[i, 8];
      StoredProc.ParamByName('ID_URZB').AsInt64 := ID_URZB;
      StoredProc.ParamByName('ID_KEKV').AsInt64 := cxGrid2TableView1Column_id_kekv.DataBinding.DataController.Values[i, 7];
      StoredProc.ParamByName('N_DOG').Value := cxGrid2TableView1Column_n_dog.DataBinding.DataController.Values[i, 3];
      StoredProc.ParamByName('d_DOG').Value := cxGrid2TableView1Column_d_dog.DataBinding.DataController.Values[i, 2];
      StoredProc.ParamByName('ID_CUSTOMER').AsInt64 := cxGrid2TableView1Column_id_customer.DataBinding.DataController.Values[i, 10];
      StoredProc.ParamByName('DATE_BEG').Value := cxGrid2TableView1Column_date_beg.DataBinding.DataController.Values[i, 19];
      StoredProc.ParamByName('DATE_END').Value := cxGrid2TableView1Column_date_end.DataBinding.DataController.Values[i, 5];
      StoredProc.ParamByName('SUMMA').Value := cxGrid2TableView1Column_summa.DataBinding.DataController.Values[i, 6];
      StoredProc.ParamByName('SUM_PREDOPL').Value := cxGrid2TableView1Column_sum_predopl.DataBinding.DataController.Values[i, 11];
      StoredProc.ParamByName('ID_RATE_ACC').AsInt64 :=  cxGrid2TableView1Column_id_rate_acc.DataBinding.DataController.Values[i, 14];
      StoredProc.ParamByName('ID_URZB_DATA').AsInt64 := cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[i, 9];
      StoredProc.ParamByName('NOTE').Value := cxGrid2TableView1Column_note.DataBinding.DataController.Values[i, 18];
      StoredProc.ParamByName('SUM_PAY').Value := cxGrid2TableView1Column_summa_fact_pay.DataBinding.DataController.Values[i, 13];
      StoredProc.ParamByName('OZNTN').Value := cxGrid2TableView1ColumnOZNTN.DataBinding.DataController.Values[i, 21];
      try
         StoredProc.ExecProc;
         StoredProc.Close;
      except on e: Exception do
      begin
         ShowMessage(e.Message);
         StoredProc.Transaction.Rollback;
         Exit;
      end;
      end;
      StoredProc.Transaction.Commit;
     end;
  end;

end;

procedure TfrmUrzbDog.KoshtEditClick(Sender: TObject);
var
  BAddKekv : TfrmAddKekv;
  Add: Variant;
  tmp_val, cnt, i, j, j1: Integer;
  id_adding_flag:Integer;
  sum : Currency;
begin
  BAddKekv:=TfrmAddKekv.Create(self, WorkDatabase.Handle);
  BAddKekv.id_smet:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,7];
  BAddKekv.kod_smet:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,2];
  BAddKekv.name_smet:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,8];
  BAddKekv.cxButtonEdit_name_smet.Text := cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,8];
  BAddKekv.cxMaskEdit_kod_smeti.Text := cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,2];

  BAddKekv.id_razd:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,9];
  BAddKekv.nomer_razd:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,3];
  BAddKekv.name_razd:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,10];
  BAddKekv.cxMaskEdit_n_razd.Text:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,3];
  BAddKekv.cxTextEdit_name_razd.Text:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,10];

  BAddKekv.id_stat:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,11];
  BAddKekv.nomer_stat:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,4];
  BAddKekv.name_stat:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,12];
  BAddKekv.cxMaskEdit_n_stat.Text:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,4];
  BAddKekv.cxTextEdit_stat.Text:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,12];

  BAddKekv.id_kekv:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,13];
  BAddKekv.kod_kekv:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,4];
  BAddKekv.name_kekv:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,14];
  BAddKekv.cxMaskEdit_kekv.Text:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,5];
  BAddKekv.cxButtonEdit_name_kekv.Text:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,14];

  BAddKekv.sum_smet:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,6];
  BAddKekv.CurrencyEdit_sum_smet.Text:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,6];

  if (BAddKekv.ShowModal <> MrOk) then Exit
  else
  begin
      //cxGrid2TableView1Column_summa.DataBinding.DataController.Values[cxGrid2TableView1.DataController.FocusedRecordIndex, 6] := cxGrid1DBTableView1.DataController.Summary.FooterSummaryValues[0];  //frmAddKekv.CurrencyEdit_sum_smet.Value;
      if (cxGrid2TableView1Column_id_kekv.DataBinding.DataController.Values[cxGrid2TableView1.DataController.FocusedRecordIndex, 7] <> BAddKekv.id_kekv) then
        begin
          ShowMessage('КЕКВ договору не співпадає з КЕКВом, який Ви намагаєтесь додати!');
          Exit;
        end
      else
      begin
        j1 := cxGrid1DBTableView1DBInfoId.DataBinding.DataController.Values[cxGrid1DBTableView1DBInfoId.DataBinding.DataController.FocusedRecordIndex, 15];
        for j:=0 to cxGrid1DBTableView1.DataController.RecordCount - 1 do
        begin
          if (cxGrid1DBTableView1DBInfoId.DataBinding.DataController.Values[j, 15] <> j1) then
          sum:=sum + cxGrid1DBTableView1DBColumn6.DataBinding.DataController.Values[j, 6];
        end;
        sum:=sum + BAddKekv.sum_smet;
        if (cxGrid2TableView1Column_summa.DataBinding.DataController.Values[cxGrid2TableView1.DataController.FocusedRecordIndex, 6] <> sum) then
          begin
            ShowMessage('Увага! Сума по кошторисам не збігається з сумою юридичного зобов''язання!');
            Exit;
          end
        else
        begin
            cxGrid2TableView1Column_id_kekv.DataBinding.DataController.Values[cxGrid2TableView1.DataController.FocusedRecordIndex, 7] := BAddKekv.id_kekv;
            cxGrid2TableView1Column_kekv.DataBinding.DataController.Values[cxGrid2TableView1.DataController.FocusedRecordIndex, 1] := BAddKekv.cxMaskEdit_kekv.Text;

            StProc.Transaction.StartTransaction;
            StProc.StoredProcName := 'DOG_REE_URZB_DATA_INFO_UPD';
            StProc.Prepare;
            StProc.ParamByName('ID_URZB_DATA').AsInt64 := cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[cxGrid2TableView1.DataController.FocusedRecordIndex, 9];
            StProc.ParamByName('ID_SMETA').Value := BAddKekv.id_smet;
            StProc.ParamByName('ID_RAZD').Value := BAddKekv.id_razd;
            StProc.ParamByName('ID_ST').Value := BAddKekv.id_stat;
            StProc.ParamByName('ID_KEKV').Value := BAddKekv.id_kekv;
            StProc.ParamByName('SUMMA').Value := BAddKekv.sum_smet;
            StProc.ParamByName('ID_URZB').AsInt64 := ID_URZB;
            StProc.ParamByName('ID_INFO').AsInt64 := cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,15];
            StProc.ParamByName('NUMBER_INFO').AsInt64 := cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,0];
            StProc.ExecProc;
            StProc.Close;
            StProc.Transaction.Commit;


            for i := 0 to cxGrid2TableView1Column_n_uz.DataBinding.DataController.RecordCount - 1 do
            begin
              StoredProc.StoredProcName := 'DOG_REE_URZB_DATA_UPD';
              StoredProc.Prepare;
              StoredProc.ParamByName('ID_DOG').AsInt64 := cxGrid2TableView1Column_id_dog.DataBinding.DataController.Values[i, 8];
              StoredProc.ParamByName('ID_URZB').AsInt64 := ID_URZB;
              StoredProc.ParamByName('ID_KEKV').AsInt64 := cxGrid2TableView1Column_id_kekv.DataBinding.DataController.Values[i, 7];
              StoredProc.ParamByName('N_DOG').Value := cxGrid2TableView1Column_n_dog.DataBinding.DataController.Values[i, 3];
              StoredProc.ParamByName('d_DOG').Value := cxGrid2TableView1Column_d_dog.DataBinding.DataController.Values[i, 2];
              StoredProc.ParamByName('ID_CUSTOMER').AsInt64 := cxGrid2TableView1Column_id_customer.DataBinding.DataController.Values[i, 10];
              StoredProc.ParamByName('DATE_BEG').Value := cxGrid2TableView1Column_date_beg.DataBinding.DataController.Values[i, 19];
              StoredProc.ParamByName('DATE_END').Value := cxGrid2TableView1Column_date_end.DataBinding.DataController.Values[i, 5];
              StoredProc.ParamByName('SUMMA').Value := cxGrid1DBTableView1.DataController.Summary.FooterSummaryValues[0];
              StoredProc.ParamByName('SUM_PREDOPL').Value := cxGrid2TableView1Column_sum_predopl.DataBinding.DataController.Values[i, 11];
              StoredProc.ParamByName('ID_RATE_ACC').AsInt64 :=  cxGrid2TableView1Column_id_rate_acc.DataBinding.DataController.Values[i, 14];
              StoredProc.ParamByName('ID_URZB_DATA').AsInt64 := cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[i, 9];
              StoredProc.ParamByName('NOTE').Value := cxGrid2TableView1Column_note.DataBinding.DataController.Values[i, 18];
              StoredProc.ParamByName('SUM_PAY').Value := cxGrid2TableView1Column_summa_fact_pay.DataBinding.DataController.Values[i, 13];
              StoredProc.ParamByName('NUMBER_URZB').Value := cxGrid2TableView1Column_n_uz.DataBinding.DataController.Values[i, 0];
              StoredProc.ParamByName('OZNTN').Value := cxGrid2TableView1ColumnOZNTN.DataBinding.DataController.Values[i, 21];
              try
                 StoredProc.ExecProc;
                 StoredProc.Close;
              except on e: Exception do
                begin
                  ShowMessage(e.Message);
                  StoredProc.Transaction.Rollback;
                  Exit;
                end;
              end;
              StoredProc.Transaction.Commit;
            end;

            pFIBDataSet1.Close;
            pFIBDataSet1.ParamByName('id_urzb_data').AsInt64 := cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[cxGrid2TableView1Column_id_urzb.DataBinding.DataController.FocusedRecordIndex, 9];
            pFIBDataSet1.ParamByName('ACTUAL_DATE').AsDate := cxGrid2TableView1Column_date_beg.DataBinding.DataController.Values[cxGrid2TableView1Column_id_urzb.DataBinding.DataController.FocusedRecordIndex, 19];
            pFIBDataSet1.Active := true;
            pFIBDataSet1.FetchAll;
            cxGrid1DBTableView1.DataController.RecordCount := pFIBDataSet1.RecordCount;
            for j:=0 to cxGrid1DBTableView1.DataController.RecordCount - 1 do
            begin
              cxGrid1DBTableView1DBNumInfo.DataBinding.DataController.Values[j, 0]:= pFIBDataSet1['NUMBER_INFO'];
              cxGrid1DBTableView1DBColumn1.DataBinding.DataController.Values[j, 1]:= cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[cxGrid2TableView1Column_id_urzb.DataBinding.DataController.FocusedRecordIndex, 9];
              cxGrid1DBTableView1DBColumn2.DataBinding.DataController.Values[j, 2]:= pFIBDataSet1['SMETA_KOD'];
              cxGrid1DBTableView1DBColumn3.DataBinding.DataController.Values[j, 3] := pFIBDataSet1['RAZD_KOD'];
              cxGrid1DBTableView1DBColumn4.DataBinding.DataController.Values[j, 4] := pFIBDataSet1['ST_KOD'];
              cxGrid1DBTableView1DBColumn5.DataBinding.DataController.Values[j, 5] := pFIBDataSet1['KEKV_KOD'];
              cxGrid1DBTableView1DBColumn6.DataBinding.DataController.Values[j, 6] := StrToCurr(pFIBDataSet1['SUMMA']);
              cxGrid1DBTableView1DBSmId.DataBinding.DataController.Values[j, 7] := pFIBDataSet1['ID_SMETA'];
              cxGrid1DBTableView1DBSmName.DataBinding.DataController.Values[j, 8] := pFIBDataSet1['SMETA_NAME'];
              cxGrid1DBTableView1DBRzId.DataBinding.DataController.Values[j, 9] := pFIBDataSet1['ID_RAZD'];
              cxGrid1DBTableView1DBRzName.DataBinding.DataController.Values[j, 10] := pFIBDataSet1['RAZD_NAME'];
              cxGrid1DBTableView1DBStId.DataBinding.DataController.Values[j, 11] := pFIBDataSet1['ID_ST'];
              cxGrid1DBTableView1DBStName.DataBinding.DataController.Values[j, 12] := pFIBDataSet1['ST_NAME'];
              cxGrid1DBTableView1DBKekvId.DataBinding.DataController.Values[j, 13] := pFIBDataSet1['ID_KEKV'];
              cxGrid1DBTableView1DBKekvName.DataBinding.DataController.Values[j, 14] := pFIBDataSet1['KEKV_NAME'];
              cxGrid1DBTableView1DBInfoId.DataBinding.DataController.Values[j, 15] := pFIBDataSet1['ID_INFO'];
              pFIBDataSet1.Next;
            end;
        end;
      end;
  end;
end;


procedure TfrmUrzbDog.cxGrid1DBTableView1DblClick(Sender: TObject);
var
  BBAddKekv : TfrmAddKekv;
begin
  BBAddKekv:=TfrmAddKekv.Create(self, WorkDatabase.Handle);
  BBAddKekv.cxMaskEdit_kod_smeti.Properties.ReadOnly:=True;
  BBAddKekv.cxMaskEdit_n_razd.Properties.ReadOnly:=True;
  BBAddKekv.cxMaskEdit_n_stat.Properties.ReadOnly:=True;
  BBAddKekv.cxMaskEdit_kekv.Properties.ReadOnly:=True;
  BBAddKekv.cxButtonEdit_name_smet.Properties.ReadOnly:=True;
  BBAddKekv.cxTextEdit_name_razd.Properties.ReadOnly:=True;
  BBAddKekv.cxTextEdit_stat.Properties.ReadOnly:=True;
  BBAddKekv.cxButtonEdit_name_kekv.Properties.ReadOnly:=True;
  BBAddKekv.CurrencyEdit_sum_smet.ReadOnly:=True;
  BBAddKekv.cxButton_cancel.Visible:=False;

  BBAddKekv.id_smet:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,7];
  BBAddKekv.kod_smet:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,2];
  BBAddKekv.name_smet:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,8];
  BBAddKekv.cxButtonEdit_name_smet.Text := cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,8];
  BBAddKekv.cxMaskEdit_kod_smeti.Text := cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,2];

  BBAddKekv.id_razd:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,9];
  BBAddKekv.nomer_razd:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,3];
  BBAddKekv.name_razd:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,10];
  BBAddKekv.cxMaskEdit_n_razd.Text:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,3];
  BBAddKekv.cxTextEdit_name_razd.Text:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,10];

  BBAddKekv.id_stat:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,11];
  BBAddKekv.nomer_stat:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,4];
  BBAddKekv.name_stat:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,12];
  BBAddKekv.cxMaskEdit_n_stat.Text:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,4];
  BBAddKekv.cxTextEdit_stat.Text:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,12];

  BBAddKekv.id_kekv:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,13];
  BBAddKekv.kod_kekv:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,5];
  BBAddKekv.name_kekv:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,14];
  BBAddKekv.cxMaskEdit_kekv.Text:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,5];
  BBAddKekv.cxButtonEdit_name_kekv.Text:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,14];

  BBAddKekv.sum_smet:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,6];
  BBAddKekv.CurrencyEdit_sum_smet.Text:=cxGrid1DBTableView1.DataController.Values[cxGrid1DBTableView1.DataController.FocusedRecordIndex,6];
  BBAddKekv.ShowModal;
end;

procedure TfrmUrzbDog.KoshtAddClick(Sender: TObject);
var
  AAddKekv : TfrmAddKekv;
  j, i : integer;
begin
  AAddKekv:=TfrmAddKekv.Create(self, WorkDatabase.Handle);
  if (AAddKekv.ShowModal <> MrOk) then Exit
  else
  begin
    if (cxGrid2TableView1Column_id_kekv.DataBinding.DataController.Values[cxGrid2TableView1.DataController.FocusedRecordIndex, 7] <> AAddKekv.id_kekv) then
        ShowMessage('КЕКВ договору не співпадає з КЕКВом, який Ви намагаєтесь додати!')
    else
    begin
      cxGrid2TableView1Column_id_kekv.DataBinding.DataController.Values[cxGrid2TableView1.DataController.FocusedRecordIndex, 7] := AAddKekv.id_kekv;
      cxGrid2TableView1Column_kekv.DataBinding.DataController.Values[cxGrid2TableView1.DataController.FocusedRecordIndex, 1] := AAddKekv.cxMaskEdit_kekv.Text;

      //ShowMessage(VarToStr(cxGrid1DBTableView1DBNumInfo.DataBinding.DataController.RecordCount));
      StProc.Transaction.StartTransaction;
      StProc.StoredProcName := 'DOG_REE_URZB_DATA_INFO_INS';
      StProc.Prepare;
      StProc.ParamByName('ID_URZB_DATA').AsInt64 := cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[cxGrid2TableView1Column_id_urzb.DataBinding.DataController.FocusedRecordIndex, 9];
      StProc.ParamByName('ID_SMETA').Value := AAddKekv.id_smet;
      StProc.ParamByName('ID_RAZD').Value := AAddKekv.id_razd;
      StProc.ParamByName('ID_ST').Value := AAddKekv.id_stat;
      StProc.ParamByName('ID_KEKV').Value := AAddKekv.id_kekv;
      StProc.ParamByName('SUMMA').Value := AAddKekv.sum_smet;
      StProc.ParamByName('ID_URZB').AsInt64 := ID_URZB;
      StProc.ParamByName('NUMBER_INFO').AsInt64 := cxGrid1DBTableView1DBNumInfo.DataBinding.DataController.RecordCount + 1;
      StProc.ExecProc;
      StProc.Close;
      StProc.Transaction.Commit;


      for i := 0 to cxGrid2TableView1Column_n_uz.DataBinding.DataController.RecordCount - 1 do
      begin
        StoredProc.StoredProcName := 'DOG_REE_URZB_DATA_UPD';
        StoredProc.Prepare;
        StoredProc.ParamByName('ID_DOG').AsInt64 := cxGrid2TableView1Column_id_dog.DataBinding.DataController.Values[i, 8];
        StoredProc.ParamByName('ID_URZB').AsInt64 := ID_URZB;
        StoredProc.ParamByName('ID_KEKV').AsInt64 := cxGrid2TableView1Column_id_kekv.DataBinding.DataController.Values[i, 7];
        StoredProc.ParamByName('N_DOG').Value := cxGrid2TableView1Column_n_dog.DataBinding.DataController.Values[i, 3];
        StoredProc.ParamByName('d_DOG').Value := cxGrid2TableView1Column_d_dog.DataBinding.DataController.Values[i, 2];
        StoredProc.ParamByName('ID_CUSTOMER').AsInt64 := cxGrid2TableView1Column_id_customer.DataBinding.DataController.Values[i, 10];
        StoredProc.ParamByName('DATE_BEG').Value := cxGrid2TableView1Column_date_beg.DataBinding.DataController.Values[i, 19];
        StoredProc.ParamByName('DATE_END').Value := cxGrid2TableView1Column_date_end.DataBinding.DataController.Values[i, 5];
        StoredProc.ParamByName('SUMMA').Value := cxGrid2TableView1Column_summa.DataBinding.DataController.Values[i, 6];
        StoredProc.ParamByName('SUM_PREDOPL').Value := cxGrid2TableView1Column_sum_predopl.DataBinding.DataController.Values[i, 11];
        StoredProc.ParamByName('ID_RATE_ACC').AsInt64 :=  cxGrid2TableView1Column_id_rate_acc.DataBinding.DataController.Values[i, 14];
        StoredProc.ParamByName('ID_URZB_DATA').AsInt64 := cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[i, 9];
        StoredProc.ParamByName('NOTE').Value := cxGrid2TableView1Column_note.DataBinding.DataController.Values[i, 18];
        StoredProc.ParamByName('SUM_PAY').Value := cxGrid2TableView1Column_summa_fact_pay.DataBinding.DataController.Values[i, 13];
        StoredProc.ParamByName('NUMBER_URZB').Value := cxGrid2TableView1Column_n_uz.DataBinding.DataController.Values[i, 0];
        StoredProc.ParamByName('OZNTN').Value := cxGrid2TableView1ColumnOZNTN.DataBinding.DataController.Values[i, 21];
        try
           StoredProc.ExecProc;
           StoredProc.Close;
        except on e: Exception do
        begin
           ShowMessage(e.Message);
           StoredProc.Transaction.Rollback;
           Exit;
        end;
        end;
        StoredProc.Transaction.Commit;
      end;

      pFIBDataSet1.Close;
      pFIBDataSet1.ParamByName('id_urzb_data').AsInt64 := cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[cxGrid2TableView1Column_id_urzb.DataBinding.DataController.FocusedRecordIndex, 9];
      pFIBDataSet1.ParamByName('ACTUAL_DATE').AsDate := cxGrid2TableView1Column_date_beg.DataBinding.DataController.Values[cxGrid2TableView1Column_date_beg.DataBinding.DataController.FocusedRecordIndex, 19];
      pFIBDataSet1.Active := true;
      pFIBDataSet1.FetchAll;
      cxGrid1DBTableView1.DataController.RecordCount := pFIBDataSet1.RecordCount;
      for j:=0 to cxGrid1DBTableView1.DataController.RecordCount - 1 do
      begin
        cxGrid1DBTableView1DBNumInfo.DataBinding.DataController.Values[j, 0]:= pFIBDataSet1['NUMBER_INFO'];
        cxGrid1DBTableView1DBColumn1.DataBinding.DataController.Values[j, 1]:= cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[cxGrid2TableView1Column_id_urzb.DataBinding.DataController.FocusedRecordIndex, 9];
        cxGrid1DBTableView1DBColumn2.DataBinding.DataController.Values[j, 2]:= pFIBDataSet1['SMETA_KOD'];
        cxGrid1DBTableView1DBColumn3.DataBinding.DataController.Values[j, 3] := pFIBDataSet1['RAZD_KOD'];
        cxGrid1DBTableView1DBColumn4.DataBinding.DataController.Values[j, 4] := pFIBDataSet1['ST_KOD'];
        cxGrid1DBTableView1DBColumn5.DataBinding.DataController.Values[j, 5] := pFIBDataSet1['KEKV_KOD'];
        cxGrid1DBTableView1DBColumn6.DataBinding.DataController.Values[j, 6] := StrToCurr(pFIBDataSet1['SUMMA']);
        cxGrid1DBTableView1DBSmId.DataBinding.DataController.Values[j, 7] := pFIBDataSet1['ID_SMETA'];
        cxGrid1DBTableView1DBSmName.DataBinding.DataController.Values[j, 8] := pFIBDataSet1['SMETA_NAME'];
        cxGrid1DBTableView1DBRzId.DataBinding.DataController.Values[j, 9] := pFIBDataSet1['ID_RAZD'];
        cxGrid1DBTableView1DBRzName.DataBinding.DataController.Values[j, 10] := pFIBDataSet1['RAZD_NAME'];
        cxGrid1DBTableView1DBStId.DataBinding.DataController.Values[j, 11] := pFIBDataSet1['ID_ST'];
        cxGrid1DBTableView1DBStName.DataBinding.DataController.Values[j, 12] := pFIBDataSet1['ST_NAME'];
        cxGrid1DBTableView1DBKekvId.DataBinding.DataController.Values[j, 13] := pFIBDataSet1['ID_KEKV'];
        cxGrid1DBTableView1DBKekvName.DataBinding.DataController.Values[j, 14] := pFIBDataSet1['KEKV_NAME'];
        cxGrid1DBTableView1DBInfoId.DataBinding.DataController.Values[j, 15] := pFIBDataSet1['ID_INFO'];
        pFIBDataSet1.Next;
      end;
      AAddKekv.Close;

      //cxGrid2TableView1Column_summa.DataBinding.DataController.Values[cxGrid2TableView1.DataController.FocusedRecordIndex, 6] := cxGrid1DBTableView1.DataController.Summary.FooterSummaryValues[0];  //frmAddKekv.CurrencyEdit_sum_smet.Value;
      //cxGrid2TableView1.DataController.Post;
      if (cxGrid2TableView1Column_summa.DataBinding.DataController.Values[i, 6] <> cxGrid1DBTableView1.DataController.Summary.FooterSummaryValues[0]) then ShowMessage('Увага! Сума по кошторисам не збігається з сумою юридичного зобов''язання!');

     end;
  end;
end;

procedure TfrmUrzbDog.KoshtDelClick(Sender: TObject);
var
  i, j : Integer;
begin
  if MessageBox(Handle,PChar('Вы дійсно бажаєте видалити запис?'),
  'Підтвердження видалення',MB_YesNo or MB_Iconquestion) = mrYes then
  begin
    StProc.Transaction.StartTransaction;
    StProc.StoredProcName := 'DOG_REE_URZB_DATA_INFO_DEL';
    StProc.Prepare;
    StProc.ParamByName('ID_URZB_DATA').AsInt64 := cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[cxGrid2TableView1Column_id_urzb.DataBinding.DataController.FocusedRecordIndex, 9];
    StProc.ParamByName('ID_INFO').AsInt64 := cxGrid1DBTableView1DBInfoId.DataBinding.DataController.Values[cxGrid1DBTableView1DBNumInfo.DataBinding.DataController.FocusedRecordIndex, 15];
    StProc.ExecProc;
    StProc.Close;
    StProc.Transaction.Commit;


    for i := 0 to cxGrid2TableView1Column_n_uz.DataBinding.DataController.RecordCount - 1 do
    begin
      StoredProc.StoredProcName := 'DOG_REE_URZB_DATA_UPD';
      StoredProc.Prepare;
      StoredProc.ParamByName('ID_DOG').AsInt64 := cxGrid2TableView1Column_id_dog.DataBinding.DataController.Values[i, 8];
      StoredProc.ParamByName('ID_URZB').AsInt64 := ID_URZB;
      StoredProc.ParamByName('ID_KEKV').AsInt64 := cxGrid2TableView1Column_id_kekv.DataBinding.DataController.Values[i, 7];
      StoredProc.ParamByName('N_DOG').Value := cxGrid2TableView1Column_n_dog.DataBinding.DataController.Values[i, 3];
      StoredProc.ParamByName('d_DOG').Value := cxGrid2TableView1Column_d_dog.DataBinding.DataController.Values[i, 2];
      StoredProc.ParamByName('ID_CUSTOMER').AsInt64 := cxGrid2TableView1Column_id_customer.DataBinding.DataController.Values[i, 10];
      StoredProc.ParamByName('DATE_BEG').Value := cxGrid2TableView1Column_date_beg.DataBinding.DataController.Values[i, 19];
      StoredProc.ParamByName('DATE_END').Value := cxGrid2TableView1Column_date_end.DataBinding.DataController.Values[i, 5];
      StoredProc.ParamByName('SUMMA').Value := cxGrid2TableView1Column_summa.DataBinding.DataController.Values[i, 6];
      StoredProc.ParamByName('SUM_PREDOPL').Value := cxGrid2TableView1Column_sum_predopl.DataBinding.DataController.Values[i, 11];
      StoredProc.ParamByName('ID_RATE_ACC').AsInt64 :=  cxGrid2TableView1Column_id_rate_acc.DataBinding.DataController.Values[i, 14];
      StoredProc.ParamByName('ID_URZB_DATA').AsInt64 := cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[i, 9];
      StoredProc.ParamByName('NOTE').Value := cxGrid2TableView1Column_note.DataBinding.DataController.Values[i, 18];
      StoredProc.ParamByName('SUM_PAY').Value := cxGrid2TableView1Column_summa_fact_pay.DataBinding.DataController.Values[i, 13];
      StoredProc.ParamByName('NUMBER_URZB').Value := cxGrid2TableView1Column_n_uz.DataBinding.DataController.Values[i, 0];
      StoredProc.ParamByName('OZNTN').Value := cxGrid2TableView1ColumnOZNTN.DataBinding.DataController.Values[i, 21];
      try
         StoredProc.ExecProc;
         StoredProc.Close;
      except on e: Exception do
      begin
         ShowMessage(e.Message);
         StoredProc.Transaction.Rollback;
         Exit;
      end;
      end;
      StoredProc.Transaction.Commit;
    end;

    pFIBDataSet1.Close;
    pFIBDataSet1.ParamByName('id_urzb_data').AsInt64 := cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[cxGrid2TableView1Column_id_urzb.DataBinding.DataController.FocusedRecordIndex, 9];
    pFIBDataSet1.ParamByName('ACTUAL_DATE').AsDate := cxGrid2TableView1Column_date_beg.DataBinding.DataController.Values[cxGrid2TableView1Column_date_beg.DataBinding.DataController.FocusedRecordIndex, 19];
    pFIBDataSet1.Active := true;
    pFIBDataSet1.FetchAll;
    cxGrid1DBTableView1.DataController.RecordCount := pFIBDataSet1.RecordCount;
    for j:=0 to cxGrid1DBTableView1.DataController.RecordCount - 1 do
    begin
      cxGrid1DBTableView1DBNumInfo.DataBinding.DataController.Values[j, 0]:= pFIBDataSet1['NUMBER_INFO'];
      cxGrid1DBTableView1DBColumn1.DataBinding.DataController.Values[j, 1]:= cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[cxGrid2TableView1Column_id_urzb.DataBinding.DataController.FocusedRecordIndex, 9];
      cxGrid1DBTableView1DBColumn2.DataBinding.DataController.Values[j, 2]:= pFIBDataSet1['SMETA_KOD'];
      cxGrid1DBTableView1DBColumn3.DataBinding.DataController.Values[j, 3] := pFIBDataSet1['RAZD_KOD'];
      cxGrid1DBTableView1DBColumn4.DataBinding.DataController.Values[j, 4] := pFIBDataSet1['ST_KOD'];
      cxGrid1DBTableView1DBColumn5.DataBinding.DataController.Values[j, 5] := pFIBDataSet1['KEKV_KOD'];
      cxGrid1DBTableView1DBColumn6.DataBinding.DataController.Values[j, 6] := StrToCurr(pFIBDataSet1['SUMMA']);
      cxGrid1DBTableView1DBSmId.DataBinding.DataController.Values[j, 7] := pFIBDataSet1['ID_SMETA'];
      cxGrid1DBTableView1DBSmName.DataBinding.DataController.Values[j, 8] := pFIBDataSet1['SMETA_NAME'];
      cxGrid1DBTableView1DBRzId.DataBinding.DataController.Values[j, 9] := pFIBDataSet1['ID_RAZD'];
      cxGrid1DBTableView1DBRzName.DataBinding.DataController.Values[j, 10] := pFIBDataSet1['RAZD_NAME'];
      cxGrid1DBTableView1DBStId.DataBinding.DataController.Values[j, 11] := pFIBDataSet1['ID_ST'];
      cxGrid1DBTableView1DBStName.DataBinding.DataController.Values[j, 12] := pFIBDataSet1['ST_NAME'];
      cxGrid1DBTableView1DBKekvId.DataBinding.DataController.Values[j, 13] := pFIBDataSet1['ID_KEKV'];
      cxGrid1DBTableView1DBKekvName.DataBinding.DataController.Values[j, 14] := pFIBDataSet1['KEKV_NAME'];
      cxGrid1DBTableView1DBInfoId.DataBinding.DataController.Values[j, 15] := pFIBDataSet1['ID_INFO'];
      pFIBDataSet1.Next;
    end;

    //cxGrid2TableView1Column_summa.DataBinding.DataController.Values[cxGrid2TableView1.DataController.FocusedRecordIndex, 6] := cxGrid1DBTableView1.DataController.Summary.FooterSummaryValues[0];  //frmAddKekv.CurrencyEdit_sum_smet.Value;
    //cxGrid2TableView1.DataController.Post;
    if (cxGrid2TableView1Column_summa.DataBinding.DataController.Values[i, 6] <> cxGrid1DBTableView1.DataController.Summary.FooterSummaryValues[0]) then ShowMessage('Увага! Сума по кошторисам не збігається з сумою юридичного зобов''язання!');

  end;
end;

procedure TfrmUrzbDog.cxGrid2TableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
  i, j : Integer;
begin

end;


procedure TfrmUrzbDog.cxGrid2TableView1EditChanged(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
var
  i : Integer;
  sum, z : currency;
begin
  {DecimalSeparator := ',';
  sum:=cxGrid1DBTableView1.DataController.Summary.FooterSummaryValues[0];
  //ShowMessage(VarToStr(sum));
  for i := 0 to cxGrid1DBTableView1.DataController.RecordCount - 1 do
  begin
      cxGrid1DBTableView1DBColumn6.DataBinding.DataController.Values[i, 6]:=cxGrid2TableView1Column_summa.DataBinding.DataController.Values[cxGrid2TableView1.DataController.FocusedRecordIndex, 6] * cxGrid1DBTableView1DBColumn6.DataBinding.DataController.Values[i, 6] / sum ;
      StProc.Transaction.StartTransaction;
      StProc.StoredProcName := 'DOG_REE_URZB_DATA_INFO_UPD';
      StProc.Prepare;
      StProc.ParamByName('ID_URZB_DATA').AsInt64 := cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[cxGrid2TableView1.DataController.FocusedRecordIndex, 9];
      StProc.ParamByName('ID_SMETA').Value := cxGrid1DBTableView1.DataController.Values[i,7];
      StProc.ParamByName('ID_RAZD').Value := cxGrid1DBTableView1.DataController.Values[i,9];
      StProc.ParamByName('ID_ST').Value := cxGrid1DBTableView1.DataController.Values[i,11];
      StProc.ParamByName('ID_KEKV').Value := cxGrid1DBTableView1.DataController.Values[i,13];
      StProc.ParamByName('SUMMA').Value := FormatFloat('0.00', StrToCurr(cxGrid1DBTableView1DBColumn6.DataBinding.DataController.Values[i, 6]));
      StProc.ParamByName('ID_URZB').AsInt64 := ID_URZB;
      StProc.ParamByName('ID_INFO').AsInt64 := cxGrid1DBTableView1.DataController.Values[i,15];
      StProc.ParamByName('NUMBER_INFO').AsInt64 := cxGrid1DBTableView1.DataController.Values[i,0];
      StProc.ExecProc;
      StProc.Close;
      StProc.Transaction.Commit;
  end;
  StProc.Transaction.StartTransaction;
  StProc.StoredProcName := 'DOG_REE_INFO_UPD_SUM';
  StProc.Prepare;
  StProc.ParamByName('ID_URZB_DATA').AsInt64 := cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[cxGrid2TableView1.DataController.FocusedRecordIndex, 9];
  StProc.ParamByName('ID_URZB').AsInt64 := ID_URZB;
  StProc.ExecProc;
  StProc.Close;
  StProc.Transaction.Commit;  }


  {z:= cxGrid2TableView1Column_summa.DataBinding.DataController.Values[cxGrid2TableView1.DataController.FocusedRecordIndex, 6] - cxGrid1DBTableView1.DataController.Summary.FooterSummaryValues[0];
  if (z <> 0) then
  begin
    //ShowMessage(VarToStr(cxGrid2TableView1Column_summa.DataBinding.DataController.Values[cxGrid2TableView1.DataController.FocusedRecordIndex, 6]));
    //ShowMessage(VarToStr(cxGrid1DBTableView1.DataController.Summary.FooterSummaryValues[0]));
    //ShowMessage(VarToStr(z));
    //ShowMessage(VarToStr(cxGrid1DBTableView1DBColumn6.DataBinding.DataController.Values[0, 6]));
    cxGrid1DBTableView1DBColumn6.DataBinding.DataController.Values[0, 6]:=cxGrid1DBTableView1DBColumn6.DataBinding.DataController.Values[0, 6] + z;
    ShowMessage(VarToStr(cxGrid1DBTableView1DBColumn6.DataBinding.DataController.Values[0, 6]));
    StProc.Transaction.StartTransaction;
    StProc.StoredProcName := 'DOG_REE_URZB_DATA_INFO_UPD';
    StProc.Prepare;
    StProc.ParamByName('ID_URZB_DATA').AsInt64 := cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[cxGrid2TableView1.DataController.FocusedRecordIndex, 9];
    StProc.ParamByName('ID_SMETA').Value := cxGrid1DBTableView1.DataController.Values[0,7];
    StProc.ParamByName('ID_RAZD').Value := cxGrid1DBTableView1.DataController.Values[0,9];
    StProc.ParamByName('ID_ST').Value := cxGrid1DBTableView1.DataController.Values[0,11];
    StProc.ParamByName('ID_KEKV').Value := cxGrid1DBTableView1.DataController.Values[0,13];
    StProc.ParamByName('SUMMA').Value := FormatFloat('0.00', StrToCurr(cxGrid1DBTableView1DBColumn6.DataBinding.DataController.Values[0, 6]));
    StProc.ParamByName('ID_URZB').AsInt64 := ID_URZB;
    StProc.ParamByName('ID_INFO').AsInt64 := cxGrid1DBTableView1.DataController.Values[0,15];
    StProc.ParamByName('NUMBER_INFO').AsInt64 := cxGrid1DBTableView1.DataController.Values[0,0];
    StProc.ExecProc;
    StProc.Close;
    StProc.Transaction.Commit;
  end;}
end;

procedure TfrmUrzbDog.dxBarButton10RefClick(Sender: TObject);
var
  l, j : Integer;
begin

  l:=cxGrid2TableView1Column_id_urzb.DataBinding.DataController.FocusedRecordIndex;
  StoredProc.StoredProcName := 'DOG_REE_URZB_DATA_UPD';
  StoredProc.Prepare;
  StoredProc.ParamByName('ID_DOG').AsInt64 := cxGrid2TableView1Column_id_dog.DataBinding.DataController.Values[l, 8];
  StoredProc.ParamByName('ID_URZB').AsInt64 := ID_URZB;
  StoredProc.ParamByName('ID_KEKV').AsInt64 := cxGrid2TableView1Column_id_kekv.DataBinding.DataController.Values[l, 7];
  StoredProc.ParamByName('N_DOG').Value := cxGrid2TableView1Column_n_dog.DataBinding.DataController.Values[l, 3];
  StoredProc.ParamByName('d_DOG').Value := cxGrid2TableView1Column_d_dog.DataBinding.DataController.Values[l, 2];
  StoredProc.ParamByName('ID_CUSTOMER').AsInt64 := cxGrid2TableView1Column_id_customer.DataBinding.DataController.Values[l, 10];
  StoredProc.ParamByName('DATE_BEG').Value := cxGrid2TableView1Column_date_beg.DataBinding.DataController.Values[l, 19];
  StoredProc.ParamByName('DATE_END').Value := cxGrid2TableView1Column_date_end.DataBinding.DataController.Values[l, 5];
  StoredProc.ParamByName('SUMMA').Value := cxGrid2TableView1Column_summa.DataBinding.DataController.Values[l, 6];
  StoredProc.ParamByName('SUM_PREDOPL').Value := cxGrid2TableView1Column_sum_predopl.DataBinding.DataController.Values[l, 11];
  StoredProc.ParamByName('ID_RATE_ACC').AsInt64 :=  cxGrid2TableView1Column_id_rate_acc.DataBinding.DataController.Values[l, 14];
  StoredProc.ParamByName('ID_URZB_DATA').AsInt64 := cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[l, 9];
  StoredProc.ParamByName('NOTE').Value := cxGrid2TableView1Column_note.DataBinding.DataController.Values[l, 18];
  StoredProc.ParamByName('SUM_PAY').Value := cxGrid2TableView1Column_summa_fact_pay.DataBinding.DataController.Values[l, 13];
  StoredProc.ParamByName('OZNTN').Value := cxGrid2TableView1ColumnOZNTN.DataBinding.DataController.Values[l, 21];
  try
    StoredProc.ExecProc;
    StoredProc.Close;
  except on e: Exception do
  begin
    ShowMessage(e.Message);
    StoredProc.Transaction.Rollback;
    Exit;
  end;
  end;
  StoredProc.Transaction.Commit;

  pFIBDataSet1.Close;
  pFIBDataSet1.ParamByName('id_urzb_data').AsInt64 := cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[l, 9];
  pFIBDataSet1.ParamByName('ACTUAL_DATE').AsDate := cxGrid2TableView1Column_date_beg.DataBinding.DataController.Values[l, 19];
  pFIBDataSet1.Active := true;
  pFIBDataSet1.FetchAll;
  cxGrid1DBTableView1.DataController.RecordCount := pFIBDataSet1.RecordCount;
  if(pFIBDataSet1.RecordCount>0) then
  begin
    for j:=0 to cxGrid1DBTableView1.DataController.RecordCount - 1 do
    begin
      cxGrid1DBTableView1DBNumInfo.DataBinding.DataController.Values[j, 0]:= pFIBDataSet1['NUMBER_INFO'];
      cxGrid1DBTableView1DBColumn1.DataBinding.DataController.Values[j, 1]:= cxGrid2TableView1Column_id_urzb.DataBinding.DataController.Values[cxGrid2TableView1Column_id_urzb.DataBinding.DataController.FocusedRecordIndex, 9];
      cxGrid1DBTableView1DBColumn2.DataBinding.DataController.Values[j, 2]:= pFIBDataSet1['SMETA_KOD'];
      cxGrid1DBTableView1DBColumn3.DataBinding.DataController.Values[j, 3] := pFIBDataSet1['RAZD_KOD'];
      cxGrid1DBTableView1DBColumn4.DataBinding.DataController.Values[j, 4] := pFIBDataSet1['ST_KOD'];
      cxGrid1DBTableView1DBColumn5.DataBinding.DataController.Values[j, 5] := pFIBDataSet1['KEKV_KOD'];
      cxGrid1DBTableView1DBColumn6.DataBinding.DataController.Values[j, 6] := StrToCurr(pFIBDataSet1['SUMMA']);
      cxGrid1DBTableView1DBSmId.DataBinding.DataController.Values[j, 7] := pFIBDataSet1['ID_SMETA'];
      cxGrid1DBTableView1DBSmName.DataBinding.DataController.Values[j, 8] := pFIBDataSet1['SMETA_NAME'];
      cxGrid1DBTableView1DBRzId.DataBinding.DataController.Values[j, 9] := pFIBDataSet1['ID_RAZD'];
      cxGrid1DBTableView1DBRzName.DataBinding.DataController.Values[j, 10] := pFIBDataSet1['RAZD_NAME'];
      cxGrid1DBTableView1DBStId.DataBinding.DataController.Values[j, 11] := pFIBDataSet1['ID_ST'];
      cxGrid1DBTableView1DBStName.DataBinding.DataController.Values[j, 12] := pFIBDataSet1['ST_NAME'];
      cxGrid1DBTableView1DBKekvId.DataBinding.DataController.Values[j, 13] := pFIBDataSet1['ID_KEKV'];
      cxGrid1DBTableView1DBKekvName.DataBinding.DataController.Values[j, 14] := pFIBDataSet1['KEKV_NAME'];
      cxGrid1DBTableView1DBInfoId.DataBinding.DataController.Values[j, 15] := pFIBDataSet1['ID_INFO'];
      pFIBDataSet1.Next;
      end;
  end;
end;


procedure TfrmUrzbDog.cxGrid2TableView1ColumnOZNTNPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  ozntn_kod : String;
begin
  StoredProc.StoredProcName := 'DOG_REE_URZB_USE_OZNTN_SELECT';
   StoredProc.Prepare;
   StoredProc.ParamByName('KOD').Value := VarToStr(DisplayValue);
  try
    StoredProc.ExecProc;
    StoredProc.Close;
  except on e: Exception do
  begin
     ShowMessage(e.Message);
     StoredProc.Transaction.Rollback;
  Exit;
  end;
  end;
  StoredProc.Transaction.Commit;

  if(StoredProc.FldByName['MES'].AsString <> '') then
  begin
    ShowMessage(StoredProc.FldByName['MES'].AsString);

    Q1.Close;
    Q1.SQL.Text := 'select OZNTN from DOG_SYS_OPTIONS';
    Q1.ExecQuery;
    ozntn_kod := Q1.FldByName['OZNTN'].AsString;
    Q1.Close;

    cxGrid2TableView1ColumnOZNTN.DataBinding.DataController.Values[cxGrid2TableView1ColumnOZNTN.DataBinding.DataController.FocusedRecordIndex, 21]:=ozntn_kod;
  end;

end;

end.
