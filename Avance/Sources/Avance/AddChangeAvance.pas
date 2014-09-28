unit AddChangeAvance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, Buttons, cxListView,
  cxTextEdit, cxDropDownEdit, cxMemo, cxCalendar, cxLabel, cxControls,
  cxContainer, cxEdit, cxMaskEdit, cxMRUEdit, ExtCtrls, ComCtrls, MainClassAvance,
  mainAvanceOtchet, pFIBDatabase, DateUtils, DB, FIBDataSet, pFIBDataSet,
  Un_lo_file_Alex, Grids, GlobalSPR, ActnList, ToolWin, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData,
  RxMemDS, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxSplitter, Kernel, FIBQuery,
  pFIBQuery, pFIBStoredProc, FIBDatabase, IBase, Un_R_file_Alex, Menus, Un_func_file_Alex,
  dxStatusBar, cxImage, ImgList, cxCurrencyEdit, Math, cxCheckBox, SelectFromVedomost,
  cxButtonEdit,AvanceSelectTypeDoc;

type
  TfmModeAvance = (AddAvance, ChangeAvance, ShowAvance, ClonAvance);

  TfmAddChangeAvance = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel3: TPanel;
    cxTextEdit2: TcxTextEdit;
    cxLabel7: TcxLabel;
    cxButtonClose: TcxButton;
    cxButtonOk: TcxButton;
    Panel4: TPanel;
    Panel2: TPanel;
    cxMRUEditFio: TcxMRUEdit;
    cxLabel8: TcxLabel;
    cxEditNumber1: TcxTextEdit;
    cxLabel9: TcxLabel;
    cxDateEditAo: TcxDateEdit;
    cxTextEditSumma: TcxTextEdit;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxMemoNote: TcxMemo;
    cxLabel3: TcxLabel;
    DataSetNumber: TpFIBDataSet;
    cxButtonNext: TcxButton;
    cxEditNumber2: TcxTextEdit;
    SpBtUp: TSpeedButton;
    SpBtDown: TSpeedButton;
    cxLabel1: TcxLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    DataSetChange: TpFIBDataSet;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ActionList1: TActionList;
    ActionAdd: TAction;
    ActionEdit: TAction;
    ActionDel: TAction;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    RxMemoryDataSaveProv: TRxMemoryData;
    RxMemoryDataRas: TRxMemoryData;
    ActionSave: TAction;
    cxSplitter1: TcxSplitter;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn7: TcxGridDBColumn;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn2: TcxGridDBColumn;
    DataSourceSave: TDataSource;
    StyleRepository: TcxStyleRepository;
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
    cxStyle17: TcxStyle;
    cxStyleYellow: TcxStyle;
    cxStyleFontBlack: TcxStyle;
    cxStyleMalin: TcxStyle;
    cxStyleBorder: TcxStyle;
    cxStylemalinYellow: TcxStyle;
    cxStyleGrid: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    cxMemo2: TcxMemo;
    TabSheet4: TTabSheet;
    cxGrid4: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBTableView2DBColumn1: TcxGridDBColumn;
    cxGridDBTableView2DBColumn2: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    DataSourceRas: TDataSource;
    Class_StoredProc: TpFIBStoredProc;
    Class_DataSet: TpFIBDataSet;
    Class_Transaction_Wr: TpFIBTransaction;
    cxGrid2DBTableView1DBColumn3: TcxGridDBColumn;
    PopupMenuRas: TPopupMenu;
    RxError: TRxMemoryData;
    DataSetError: TpFIBDataSet;
    DataSourceError: TDataSource;
    pFIBDataSet1: TpFIBDataSet;
    TabSheet5: TTabSheet;
    cxLabel15: TcxLabel;
    cxTextEdit4: TcxTextEdit;
    cxLabel16: TcxLabel;
    cxTextEdit1: TcxTextEdit;
    cxLabel17: TcxLabel;
    cxTextEdit3: TcxTextEdit;
    cxLabel18: TcxLabel;
    cxTextEdit5: TcxTextEdit;
    pFIBTransactionRead: TpFIBTransaction;
    dxStatusBar1: TdxStatusBar;
    cxLabel2: TcxLabel;
    cxMemoDog: TcxMemo;
    SpeedButtonDog: TSpeedButton;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    ImageList1: TImageList;
    ActionShowAll: TAction;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    Ds: TpFIBDataSet;
    cxGrid1DBTableView1DBColumn8: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn9: TcxGridDBColumn;
    cxCheckBoxKom: TcxCheckBox;
    Panel5: TPanel;
    cxLabelFrom: TcxLabel;
    cxDateEditFrom: TcxDateEdit;
    cxLabelTo: TcxLabel;
    cxDateEditTo: TcxDateEdit;
    DataSetVed: TpFIBDataSet;
    Query: TpFIBQuery;
    DataSetSch: TpFIBDataSet;
    LabelTypeDoc: TLabel;
    ButtonEditTypeDoc: TcxButtonEdit;
    procedure cxButtonCloseClick(Sender: TObject);
    procedure cxDateEditAoPropertiesChange(Sender: TObject);
    procedure cxEditNumber2KeyPress(Sender: TObject; var Key: Char);
    procedure cxButtonNextClick(Sender: TObject);
    procedure SpBtUpClick(Sender: TObject);
    procedure SpBtDownClick(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
    procedure cxMRUEditFioPropertiesButtonClick(Sender: TObject);
    procedure cxMRUEditTypePropertiesButtonClick(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionDelExecute(Sender: TObject);
//    procedure ToolButton3Click(Sender: TObject);
    procedure ActionSaveExecute(Sender: TObject);
    procedure ActionEditExecute(Sender: TObject);
    procedure cxDateEditAoFocusChanged(Sender: TObject);
    procedure cxGrid2DBTableView1DblClick(Sender: TObject);
    function Check_date : boolean;
    procedure cxGrid2DBTableView1KeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEditSummaKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure RxMemoryDataSaveProvAfterScroll(DataSet: TDataSet);
    procedure cxGrid1DBTableView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    function LoadDogovor : boolean;
    procedure SpeedButtonDogClick(Sender: TObject);
    procedure cxGrid1DBTableView1DBColumn5CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxTextEditSummaExit(Sender: TObject);
    procedure ActionShowAllExecute(Sender: TObject);
    procedure DelBuffer(id_s : int64);
    procedure DefineKodSchAo(id_sch_main: int64);
    //procedure CheckShowFormSchAo(F_sch_ao: boolean);
    procedure cxCheckBoxKomClick(Sender: TObject);
    procedure Get_Date_Beg_end(var date_b, date_e: tdate);
    procedure ButtonEditTypeDocPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    my_m : TfmModeAvance;
    kod_system : string;
    ras : integer;
    id_people, id_dog_group,id_dog_group_pr,id_dog_group_rash : int64;
    //id_type_doc : int64;
    id_ao_change : int64;
    Last_number : string;
    id_session : int64;
    id_ao: int64;
    delete_buff : smallint;
    last_date : TDate;
    flag_na_zapusk_fio : boolean;
    flag_na_zapusk_sch : boolean;
    count_sch          : integer;
    id_sch_in          : int64;
    num_sch_in, title_sch_in : string;
    kod_sch_ao : integer;
  public
    database : TpFIBDatabase;
    myclass : TMainClassAvance;
    myform : TfmAvanceOtchet;
    flag_exists_ras : boolean;
    flag_new_alg : boolean;
    prihod : integer;
    flag_na_aftoscroll : boolean;
    id_rate, id_rate_n, id_customer: int64;
    id_oper_act : integer;
    use_new_alg_for_num_ao   : integer;
    date_new_alg_for_num_ao  : Tdate;
    date_beg_ao, date_end_ao  : tdate;
    use_expert_system : integer;
    id_form_uch : integer;
    is_select_type_doc : Integer;
    id_type_doc : Int64;
    name_type_doc : string;
    constructor Create(AOwner: TComponent; mform : TfmAvanceOtchet; mclass: TMainClassAvance; DB: TpFIBDatabase; m : TfmModeAvance; rassch : integer; kod_sys : string; id_system : int64; id_ao_send : int64; id_p : int64); reintroduce; overload;
  end;


implementation
uses AddChangeProvAvance,
     AddRaspAvance,
     DogLoaderUnit,
     AvanceInputSumma,
     AvanceSelectSch;
{$R *.dfm}

{ TfmAddChangeAvance }

constructor TfmAddChangeAvance.Create(AOwner: TComponent;
  mform: TfmAvanceOtchet; mclass: TMainClassAvance; DB: TpFIBDatabase;
  m: TfmModeAvance; rassch : integer; kod_sys : string; id_system : int64; id_ao_send : int64; id_p : int64);
var
    year : integer;
    year_l  : string;
    month : integer;
    month_l : string;
    year_1, year_last : integer;
    month_last : integer;
    NUMBER : INTEGER;
    num : string;
    inputDog : TDogInput;
    res   : TDogResult;
    summa_dog : double;
    pr, i : integer;
    flag_exists_dog_intoDataset : boolean;
    date_b, date_e : tdate;
begin
    inherited Create (AOwner);

    flag_na_aftoscroll := false;
    DecimalSeparator   := ',';
    myclass            := mclass;
    my_m               := m;
    myform             := mform;
    ras                := rassch;
    database           := DB;

    cxDateEditFrom.Date := date;
    cxDateEditTo.Date   := date;

    Class_Transaction_Wr.DefaultDatabase := myform.DatabaseMain;
    DataSetChange.Database               := myform.DatabaseMain;
    DataSetNumber.Database               := myform.DatabaseMain;
    Class_DataSet.Database               := myform.DatabaseMain;
    Class_StoredProc.Database            := myform.DatabaseMain;
    Query.Database                       := myform.DatabaseMain;
    DataSetError.Database                := myform.DatabaseMain;
    pFIBDataSet1.Database                := myform.DatabaseMain;
    pFIBTransactionRead.DefaultDatabase  := myform.DatabaseMain;
    DataSetSch.Database                  := myform.DatabaseMain;
    DataSetChange.Transaction            := pFIBTransactionRead;
    DataSetNumber.Transaction            := pFIBTransactionRead;
    Class_DataSet.Transaction            := pFIBTransactionRead;
    Class_StoredProc.Transaction         := Class_Transaction_Wr;
    Query.Transaction                    := Class_Transaction_Wr;
    pFIBDataSet1.Transaction             := pFIBTransactionRead;
    DataSetSch.Transaction               := pFIBTransactionRead;

    Ds.Database                          := myform.DatabaseMain;
    Ds.Transaction                       := pFIBTransactionRead;

    pFIBTransactionRead.StartTransaction;
    id_oper_act :=myform.id_oper;
    if myform.show_neosn_prov = 1 then
    begin
        cxGrid1DBTableView1DBColumn8.Visible := true;
        cxGrid1DBTableView1DBColumn9.Visible := true;
        cxGrid1DBTableView1DBColumn7.Visible := false;
    end else
    begin
        cxGrid1DBTableView1DBColumn8.Visible := false;
        cxGrid1DBTableView1DBColumn9.Visible := false;
        cxGrid1DBTableView1DBColumn7.Visible := true;
    end;

    if myform.show_date_kom = 1 then
    begin
        cxCheckBoxKom.Visible  := true;
    end else
    begin
        cxCheckBoxKom.Visible  := false;
    end;

    Class_DataSet.Close;
    Class_DataSet.SQLs.SelectSQL.Text := 'select * from J4_INI';
    Class_DataSet.Open;
    try delete_buff := Class_DataSet.FieldByName('DEL_BUFFER').AsInteger; except delete_buff := 0; end;
    try id_dog_group := Class_DataSet.FieldByName('ID_GROUP').AsInteger; except id_dog_group := 0; end;
    try id_dog_group_pr := Class_DataSet.FieldByName('ID_GROUP_ADD_PR').AsInteger; except id_dog_group_pr := 0; end;
    try id_dog_group_rash := Class_DataSet.FieldByName('ID_GROUP_ADD_RAS').AsInteger; except id_dog_group_rash := 0; end;
    try use_new_alg_for_num_ao := Class_DataSet.FieldByName('USE_NEW_ALG_FOR_NUM_AO').AsInteger; except use_new_alg_for_num_ao := 0; end;
    try date_new_alg_for_num_ao := Class_DataSet.FieldByName('DATE_NEW_ALG_FOR_NUM_AO').AsDateTime; except date_new_alg_for_num_ao := 0; end;
    try use_expert_system := Class_DataSet.FieldByName('use_expert_system').AsInteger; except use_expert_system := 0; end;
    try id_form_uch := Class_DataSet.FieldByName('ID_KOD_SYS').AsInteger; except id_form_uch := 0; end;

    Class_DataSet.Close;

    cxLabel8.Caption                             := Un_R_file_Alex.J4_MAIN_ADD_TAKE_INI;
    cxLabel11.Caption                            := Un_R_file_Alex.J4_MAIN_ADD_DATA_DOC;
    cxLabel10.Caption                            := Un_R_file_Alex.J4_MAIN_FORM_SUMMA;
    cxLabel3.Caption                             := Un_R_file_Alex.J4_MAIN_FORM_OSNOVA;
    cxLabel4.caption                             := Un_R_file_Alex.N_TAB_NUM_LONG;
    SpBtUp.Caption                               := Un_R_file_Alex.J4_MAIN_ADD_UP;
    SpBtDown.Caption                             := Un_R_file_Alex.J4_MAIN_ADD_DOWN;
    cxGrid2DBTableView1DBColumn1.Caption         := Un_R_file_Alex.J4_ADD_NAME_RAS;
    cxGrid2DBTableView1DBColumn2.Caption         := Un_R_file_Alex.J4_MAIN_FORM_SUMMA;
    cxGrid2DBTableView1DBColumn3.Caption         := Un_R_file_Alex.J4_MAIN_FORM_NUMBER;
    cxGrid1DBTableView1DBColumn2.Caption         := Un_R_file_Alex.J4_SCH_KORESPOND;
    cxGrid1DBTableView1DBColumn3.Caption         := Un_R_file_Alex.KASSA_KOD_S_R_S_K;
    cxGrid1DBTableView1DBColumn4.Caption         := Un_R_file_Alex.KASSA_SMETA;
    cxGrid1DBTableView1DBColumn7.Caption         := Un_R_file_Alex.J4_MAIN_FORM_SUMMA;
    cxLabel1.Caption                             := Un_R_file_Alex.J4_MAIN_ADD_ALL_SUMMA;
    cxButtonNext.Caption                         := Un_R_file_Alex.J4_MAIN_ADD_NEXT;
    cxButtonOk.Caption                           := Un_R_file_Alex.J4_MAIN_PRINAT;
    cxButtonClose.Caption                        := Un_R_file_Alex.J4_MAIN_OTMENA;
    cxGrid1DBTableView1DBColumn8.Caption         := Un_R_file_Alex.J4_OSN_SUMMA;
    cxGrid1DBTableView1DBColumn9.Caption         := Un_R_file_Alex.J4_NEOSN_SUMMA;
    dxStatusBar1.Panels[0].Text                  := Un_R_file_Alex.J4_BAR_SELECT_PEOPLE  + ' - Ctrl+Enter';
    dxStatusBar1.Panels[1].Text                  := Un_R_file_Alex.J4_BAR_TAB_SELECT     + ' - Tab';
    dxStatusBar1.Panels[2].Text                  := Un_R_file_Alex.J4_BAR_ADD            + Un_R_file_Alex.J4_BAR_PROV  + ' - Ins';
    dxStatusBar1.Panels[3].Text                  := Un_R_file_Alex.J4_BAR_EDIT           + Un_R_file_Alex.J4_BAR_PROV  + ' - F2';
    dxStatusBar1.Panels[4].Text                  := Un_R_file_Alex.J4_BAR_DEL            + Un_R_file_Alex.J4_BAR_PROV  + ' - Del';
    dxStatusBar1.Panels[5].Text                  := Un_R_file_Alex.J4_MAIN_PRINAT        + ' - F10';
    dxStatusBar1.Panels[6].Text                  := Un_R_file_Alex.J4_MAIN_OTMENA        + ' - Esc';
    cxLabel5.Caption                             := Un_R_file_Alex.TAB_NUM;
    cxLabel2.Caption                             := Un_R_file_Alex.J4_PRIKAZ;
    TabSheet1.Caption                            := Un_R_file_Alex.j4_po_smetam;
    TabSheet2.Caption                            := Un_R_file_Alex.J4_RAS;
    TabSheet3.Caption                            := Un_R_file_Alex.J4_ERROR_DOC;
    TabSheet4.Caption                            := Un_R_file_Alex.J4_ERROR_PROV;
    TabSheet5.Caption                            := Un_R_file_Alex.KASSA_PROV_SHOW_PROV;
    cxGridDBTableView2DBColumn1.Caption          := Un_R_file_Alex.J4_KOD_ERROR;
    cxGridDBTableView2DBColumn2.Caption          := Un_R_file_Alex.J4_SOOBSCHENIE;

    cxLabel15.Caption                            := Un_R_file_Alex.BANK_DOGOVOR;
    cxLabel16.Caption                            := Un_R_file_Alex.KASSA_RAZD;
    cxLabel17.Caption                            := Un_R_file_Alex.KASSA_STAT;
    cxLabel18.Caption                            := Un_R_file_Alex.KASSA_KEKV;
    ToolButton1.Caption                          := Un_R_file_Alex.MY_ACTION_ADD_CONST;
    ToolButton3.Caption                          := Un_R_file_Alex.MY_ACTION_UPDATE_CONST;
    ToolButton2.Caption                          := Un_R_file_Alex.MY_ACTION_DELETE_CONST;
    cxLabelFrom.Caption                          := Un_R_file_Alex.J4_MAIN_FORM_FROM;
    cxLabelTo.Caption                            := Un_R_file_Alex.J4_MAIN_FORM_TO;
    cxCheckBoxKom.Properties.Caption             := Un_R_file_Alex.J4_AVANCE_KOM;

    //if(myform.cxDateBegin.Date <> null) then
   //      date_beg_ao := myform.cxDateBegin.Date
    //else

    Get_Date_Beg_end(date_b, date_e);
    date_beg_ao := date_b;
    date_end_ao := date_e;


    if (myform.add_new_alg = 1) and (myform.date_new_alg<=date) then
    begin
        cxLabel2.Visible       := true;
        cxMemoDog.Visible      := true;
        SpeedButtonDog.Visible := true;
    end else
    begin
        cxLabel2.Visible       := false;
        cxMemoDog.Visible      := false;
        SpeedButtonDog.Visible := false;
    end;

    id_people               := id_p;
    //id_type_doc             := 0;
    Last_number             := '';
    cxEditNumber2.Text      := '';
    cxSplitter1.CloseSplitter;
    PageControl1.ActivePage := TabSheet1;
    if rassch <> 1 then
    begin
        PageControl1.ActivePage := TabSheet1;
        TabSheet2.TabVisible    := false;
    end;
    prihod := myform.prihod;
    if myform.prihod = 1
    then
    BEGIN
        cxLabel9.Caption                     := Un_R_file_Alex.J4_MAIN_ADD_NUM_DOC_DEB;
        cxGrid1DBTableView1DBColumn1.Caption := Un_R_file_Alex.J4_MAIN_ADD_DEBET_SCH;
        if m = AddAvance
            then Caption := Un_R_file_Alex.J4_ADD_AVANCE_DEBET_CAPION
            else Caption := Un_R_file_Alex.J4_CHANGE_AVANCE_DEBET_CAPTION;
        if m = ClonAvance then Caption := Un_R_file_Alex.J4_CLON_DOC;
    end;
    if myform.prihod = 0  then
    begin
        cxGrid1DBTableView1DBColumn1.Caption := Un_R_file_Alex.J4_MAIN_ADD_KREDIT_SCH;
        cxLabel9.Caption                     := Un_R_file_Alex.J4_MAIN_ADD_NUM_DOC_AVANCE;
        if m = ChangeAvance
            then Caption := Un_R_file_Alex.J4_CHANGE_AVANCE_AVANCE_CAPTION
            else Caption := Un_R_file_Alex.J4_ADD_AVANCE_AVANCE_CAPTION ;
       if m = ClonAvance then
       begin
           Caption := Un_R_file_Alex.J4_CLON_DOC;
           cxGrid2DBTableView1.Styles.Content.Color := $00FFF8E6;
       end;
    end;

    kod_system := kod_sys;

    if m = AddAvance then
    begin
        cxDateEditAo.Date   := date;
        last_date           := date;
        cxMemoNote.Text     := Un_R_file_Alex.J4_AVANCE_NOTE_TEXT;
        year                := YearOf(Date);
        year                := year mod 100;
        year_l              := IntToStr(year);
        if length(year_l) = 1
            then year_l     := '0' + year_l;
        month               := MonthOf(Date);
        month_l             := IntToStr(month);
        if length(month_l) = 1
            then month_l    := '0' + month_l;
        cxEditNumber1.Text  := kod_system + '-' + year_l + '/' + month_l + '-';
        flag_new_alg        := false;

        if (((myform.id_oper = 1) and (myform.show_shablon = 1)) or (myform.show_shablon = 0)) and (myform.add_new_alg = 1) and (myform.date_new_alg<=date) then
        begin
            flag_new_alg := true;
            summa_dog := 0;
            if Show_Summa_Avance(summa_dog, '') then
            begin
                LoadSysData(pFIBTransactionRead);
//                SYS_ID_USER          := 1;
//                SYS_USER_NAME        := 'bvs';
//                SYS_USER_PASSWORD    := '3030';
//                SYS_ID_GROUP_DOG_VIEW := 399;
//                SYS_ID_GROUP_DOG      := 399;
                inputDog.Owner        := self;
                inputDog.DBHandle     := database.Handle;
                inputDog.WriteTrans   := Class_Transaction_Wr.Handle;
                inputDog.ReadTrans    := pFIBTransactionRead.Handle;
                inputDog.FormStyle    := fsNormal;
                inputDog.Summa        := summa_dog;
                inputDog.id_Group     := id_dog_group;
                if(prihod = 1)then
                    inputDog.id_Group_add := id_dog_group_pr
                else
                    inputDog.id_Group_add := id_dog_group_rash;          /////////61599;
                SYS_CURRENT_DATE      := cxDateEditAo.Date;
                //inputDog.shablon_data.id_rate_account    := 0;
                //inputshablon_data.id_rate_acc_native := 0;

                SYS_ID_USER           := myclass.id_user;
                res := ShowDogMain(inputDog);
                if res.ModalResult = 1 then
                begin
                    pr := 0;
                    cxTextEditSumma.Text := Un_func_file_Alex.AddNol(FloatToStr(summa_dog), pr);
                    cxMemoNote.Text      := VarToStr(res.dog_note);
                    cxMemoDog.Text       := VarToStr(res.name_tip_dog)+'; №  '+VarToStr(res.n_dog)+' '+ Un_R_file_Alex.KASSA_DOC_ORDER_FROM + ' ' +VarToStr(res.d_dog) + ' ( '+ Un_R_file_Alex.KASSA_REG_NUM + VarToStr(res.regest_num)+' ); ' + Un_R_file_Alex.BANK_NAME_CUSTMERA + ' : ' + VarToStr(res.name_customer);
                    i := 0;
                    if res.sum_today{id_customer} <> null then
                    begin
                        id_people := res.sum_today{id_customer};
                        DataSetChange.Close;
                        DataSetChange.SQLs.SelectSQL.Text := 'SELECT * FROM PUB_GET_MAN_INFO('+IntToStr(id_people)+','''+DateToStr(Date)+''')';
                        DataSetChange.Open;
                        cxMRUEditFio.Text := DataSetChange.FieldByName('UKR_FAMILIA').asString + ' ' + DataSetChange.FieldByName('UKR_IMYA').asString + ' ' + DataSetChange.FieldByName('UKR_OTCHESTVO').asString;
                        cxLabel5.Caption  := DataSetChange.FieldByName('TN').asString;
                        DataSetChange.Close;
                    end;
                    while i <= length(res.Smets)-1 do
                    begin
                        if id_people > 0 then
                        begin
                            flag_na_zapusk_fio := false;
                            if id_people <> res.sum_today{id_customer} then
                            begin
                                DataSetChange.Close;
                                DataSetChange.SQLs.SelectSQL.Text := 'SELECT * FROM PUB_GET_MAN_INFO('+IntToStr(id_people)+','''+DateToStr(Date)+''')';
                                DataSetChange.Open;
                                showMessage(Un_R_file_Alex.J4_OSTATOK_ERROR_MAN + #13 + Un_R_file_Alex.J4_OSTATOK_IN_OST + cxMRUEditFio.Text+ #13 + Un_R_file_Alex.J4_OSTATOK_IN_DOG + DataSetChange.FieldByName('UKR_FAMILIA').AsString + ' ' + DataSetChange.FieldByName('UKR_IMYA').AsString + ' ' + DataSetChange.FieldByName('UKR_OTCHESTVO').AsString);
//                                MessageBox(Handle, PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), PChar(''{Un_R_file_Alex.J4_ERROR_CELOSTNOCT_DANNIH}//), 16);
                                exit;
                            end;
                        end else
                        begin
                            flag_na_zapusk_fio := true;
                        end;
//                        id_people := res.Smets[i].id_people;
                        DataSetChange.Close;
                        DataSetChange.SQLs.SelectSQL.Text := 'SELECT * FROM J4_SELECT_DANNIE('+iNTtOsTR(0)+', '+VarToStr(res.Smets[i].NumSmeta)+', '+VarToStr(res.Smets[i].NumRazd)+', '+VarToStr(res.Smets[i].NumStat)+', '+VarToStr(res.Smets[i].NumKekv)+', '+IntToStr(myform.id_system)+', '+IntToStr(res.id_bl_account)+')';
                        DataSetChange.Open;
                        RxMemoryDataSaveProv.Open;
                        RxMemoryDataSaveProv.Insert;
                        RxMemoryDataSaveProv.FieldByName('id').Value := i+1;
                        RxMemoryDataSaveProv.FieldByName('RxMemDatId_doc_prov').Value := 0;
                        RxMemoryDataSaveProv.FieldByName('RxMemDatid_doc').Value      := 0;
                        RxMemoryDataSaveProv.FieldByName('RxMemDat_summa').Value      := res.Smets[i].NSumma;
                        RxMemoryDataSaveProv.FieldByName('Summa_po_osnovnim').Value   := res.Smets[i].NSumma;
                        RxMemoryDataSaveProv.FieldByName('Summa_po_neosnovnim').Value := null;
                        RxMemoryDataSaveProv.FieldByName('RxMemDatid_sm').Value       := DataSetChange.FieldByName('ID_SMETA').AsVariant;
                        RxMemoryDataSaveProv.FieldByName('RxMemDatid_razd').Value     := DataSetChange.FieldByName('ID_RAZD').AsVariant;
                        RxMemoryDataSaveProv.FieldByName('RxMemDatid_st').Value       := DataSetChange.FieldByName('ID_STATE').AsVariant;
                        RxMemoryDataSaveProv.FieldByName('RxMemDatid_kekv').Value     := DataSetChange.FieldByName('ID_KEKV').AsVariant;
                        RxMemoryDataSaveProv.FieldByName('RxMemDatid_man').Value      := res.sum_today;
                        RxMemoryDataSaveProv.FieldByName('RxMemDatid_sch').Value      := DataSetChange.FieldByName('ID_SCH').AsVariant;
                        RxMemoryDataSaveProv.FieldByName('RxMemDatNameSch').Value     := DataSetChange.FieldByName('SCH_NUM').AsString;
                        RxMemoryDataSaveProv.FieldByName('RxMemDatNameStat').Value    := DataSetChange.FieldByName('ST_KOD').AsString;
                        RxMemoryDataSaveProv.FieldByName('RxMemDatNameRazd').Value    := DataSetChange.FieldByName('RAZ_KOD').AsString;
                        RxMemoryDataSaveProv.FieldByName('RxMemDatNameSmeta').Value   := DataSetChange.FieldByName('SM_KOD').AsString;
                        RxMemoryDataSaveProv.FieldByName('RxMemDatFio').Value         := DataSetChange.FieldByName('FIO').AsString;
                        RxMemoryDataSaveProv.FieldByName('RxMemDatNameKekv').Value    := DataSetChange.FieldByName('KEKV_KOD').AsString;
                        RxMemoryDataSaveProv.FieldByName('RxMemDatID_SCH_KORESPOND').Value := res.id_bl_account;
                        RxMemoryDataSaveProv.FieldByName('RxMemDatname_korespond').Value   := DataSetChange.FieldByName('SCH_NUM_KOR').AsString;
                        RxMemoryDataSaveProv.FieldByName('RxMemDatid_all_prov').Value  := myform.DatabaseMain.Gen_Id('KERNEL_GEN_ID', 1);
                        RxMemoryDataSaveProv.FieldByName('RxMemDatkod_dog').Value      := res.kod_dog;
                        RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveId_Dog').Value := res.id_dog;
                        RxMemoryDataSaveProv.FieldByName('RxMemDatsumma_value').Value  := 0;
                        RxMemoryDataSaveProv.FieldByName('RxMemDatid_value').Value     := 0;
                        RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_sm').Value      := DataSetChange.FieldByName('SM_TITLE').AsString;
                        RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_raz').Value     := DataSetChange.FieldByName('RAZ_TITLE').AsString;
                        RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_st').Value      := DataSetChange.FieldByName('ST_TITLE').AsString;
                        RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_kekv').Value    := DataSetChange.FieldByName('KEKV_TITLE').AsString;
                        RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldNameCust').Value      := res.name_customer;
                        RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldNum_dog').Value       := res.n_dog;
                        RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldDate_dog').Value      := res.d_dog;
                        RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_sch').Value     := DataSetChange.FieldByName('SCH_TITLE').AsString;
                        RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_kor_sch').Value := DataSetChange.FieldByName('SCH_TITLE_KOR').AsString;
                        RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldSmRzStK').Value       := DataSetChange.FieldByName('SM_KOD').AsString +'\' +DataSetChange.FieldByName('RAZ_KOD').AsString + '\' +DataSetChange.FieldByName('ST_KOD').AsString +'\'+ DataSetChange.FieldByName('KEKV_KOD').AsString;
                        RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTypeDog').Value       := res.name_tip_dog;
                        RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldRegDog').Value        := res.regest_num;
                        RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTin').Value           := DataSetChange.FieldByName('TIN').AsString;
                        RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldBirthday').Value      := DataSetChange.FieldByName('BIRTHDAY').AsDateTime;
                        RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldMain').Value          := 1;
                        RxMemoryDataSaveProv.Post;
                        i := i+ 1;
                    end;
                end else flag_na_zapusk_fio := true;


            end else
            begin
                flag_na_zapusk_fio := true;
            end;

        end else if ((myform.id_oper = 2) and (myform.show_shablon = 1)) then
        begin
            if(use_expert_system=1) then
            begin
                count_sch := 0;
                DataSetSch.Close;
                DataSetSch.SQLs.SelectSQL.Text := 'SELECT * FROM PUB_GET_NATIVE_SCH_BY_SM('+IntToStr(id_form_uch)+','+IntToStr(0)+','+IntToStr(myform.id_sm)+', '''+dateToStr(date_beg_ao)+''','+IntToStr(myform.prihod)+','+IntToStr(myform.id_razd)+','+IntToStr(myform.id_st)+') ';
                DataSetSch.Open;
                DataSetSch.FetchAll;
                count_sch :=  DataSetSch.RecordCount;
                if (count_sch >1) then
                begin
                     flag_na_zapusk_sch := true;
                    { if(use_new_alg_for_num_ao=1) and (date_new_alg_for_num_ao<= cxDateEditAo.Date) then
                     begin
                         flag_na_zapusk_sch := true;
                         id_sch_in    := 0;
                         num_sch_in   := '';
                         title_sch_in := '';
                     end
                     else
                     begin
                         id_sch_in    := myform.id_osn_sch;
                         num_sch_in   := myform.sch_osn_num;
                         title_sch_in := myform.sch_osn_title;
                     end; }
                end
                else
                if (count_sch =1) then
                begin
                     id_sch_in    := TFIBBCDField(DataSetSch.FieldByName('IDNATIVESCH')).AsInt64;
                     num_sch_in   := DataSetSch.FieldByName('SCH_NUMBER').AsString;
                     title_sch_in := DataSetSch.FieldByName('SCH_TITLE').AsString;
                     if(use_new_alg_for_num_ao=1) and (date_new_alg_for_num_ao<= cxDateEditAo.Date) then
                     begin
                         DefineKodSchAo(id_sch_in);
                         cxDateEditAoPropertiesChange(Self);
                     end;
                end;
                if (count_sch =0) then
                begin
                     id_sch_in    := myform.id_osn_sch;
                     num_sch_in   := myform.sch_osn_num;
                     title_sch_in := myform.sch_osn_title;
                     if(use_new_alg_for_num_ao=1) and (date_new_alg_for_num_ao<= cxDateEditAo.Date) then
                     begin
                         DefineKodSchAo(id_sch_in);
                         cxDateEditAoPropertiesChange(Self);
                     end;
                end;

            end else
            begin
                count_sch := 0;
                DataSetSch.Close;
                DataSetSch.SQLs.SelectSQL.Text := 'SELECT * FROM J4_SELECT_ALL_SCH_N('+IntToStr(id_system)+', '''+dateToStr(date_beg_ao)+''') ';
                DataSetSch.Open;
                DataSetSch.FetchAll;
                count_sch :=  DataSetSch.RecordCount;

                if (count_sch >1) then
                begin
                     flag_na_zapusk_sch := true;
                     id_sch_in    := 0;
                     num_sch_in   := '';
                     title_sch_in := '';
                end
                else
                if (count_sch =1) then
                begin
                     id_sch_in    := TFIBBCDField(DataSetSch.FieldByName('ID_SCH')).AsInt64;
                     num_sch_in   := DataSetSch.FieldByName('SCH_NUM').AsString;
                     title_sch_in := DataSetSch.FieldByName('SCH_TITLE').AsString;
                     if(use_new_alg_for_num_ao=1) and (date_new_alg_for_num_ao<= cxDateEditAo.Date) then
                     begin
                         DefineKodSchAo(id_sch_in);
                         cxDateEditAoPropertiesChange(Self);
                     end;
                end;
                if (count_sch =0) then
                begin
                     id_sch_in    := myform.id_osn_sch;
                     num_sch_in   := myform.sch_osn_num;
                     title_sch_in := myform.sch_osn_title;
                     if(use_new_alg_for_num_ao=1) and (date_new_alg_for_num_ao<= cxDateEditAo.Date) then
                     begin
                         DefineKodSchAo(id_sch_in);
                         cxDateEditAoPropertiesChange(Self);
                     end;
                end;
            end;
            cxMRUEditFio.Text    := myform.fio_man;
            cxLabel5.Caption     := IntToStr(myform.tn);
            pr := 0;
            cxTextEditSumma.Text := Un_func_file_Alex.AddNol(FloatToStr(myform.sum_vedomost), pr);
            flag_na_zapusk_fio   := false;
            id_people            := myform.id_man;

            RxMemoryDataSaveProv.Open;
            RxMemoryDataSaveProv.Insert;
            RxMemoryDataSaveProv.FieldByName('id').Value                  := 1;
            RxMemoryDataSaveProv.FieldByName('RxMemDatId_doc_prov').Value := 0;
            RxMemoryDataSaveProv.FieldByName('RxMemDatid_doc').Value      := 0;
            RxMemoryDataSaveProv.FieldByName('RxMemDat_summa').Value      := myform.sum_vedomost;
            RxMemoryDataSaveProv.FieldByName('Summa_po_osnovnim').Value   := myform.sum_vedomost;
            RxMemoryDataSaveProv.FieldByName('Summa_po_neosnovnim').Value := null;
            RxMemoryDataSaveProv.FieldByName('RxMemDatid_sm').Value       := myform.id_sm;
            RxMemoryDataSaveProv.FieldByName('RxMemDatid_razd').Value     := myform.id_razd;
            RxMemoryDataSaveProv.FieldByName('RxMemDatid_st').Value       := myform.id_st;
            RxMemoryDataSaveProv.FieldByName('RxMemDatid_kekv').Value     := myform.id_kekv;
            RxMemoryDataSaveProv.FieldByName('RxMemDatid_man').Value      := myform.id_man;
            RxMemoryDataSaveProv.FieldByName('RxMemDatid_sch').Value      := id_sch_in;
            RxMemoryDataSaveProv.FieldByName('RxMemDatNameSch').Value     := num_sch_in;
            RxMemoryDataSaveProv.FieldByName('RxMemDatNameStat').Value    := myform.st_kod;
            RxMemoryDataSaveProv.FieldByName('RxMemDatNameRazd').Value    := myform.raz_kod;
            RxMemoryDataSaveProv.FieldByName('RxMemDatNameSmeta').Value   := myform.smeta_kod;
            RxMemoryDataSaveProv.FieldByName('RxMemDatFio').Value         := myform.fio_man;
            RxMemoryDataSaveProv.FieldByName('RxMemDatNameKekv').Value    := myform.kekv_kod;
            RxMemoryDataSaveProv.FieldByName('RxMemDatID_SCH_KORESPOND').Value := myform.id_kor_sch;
            RxMemoryDataSaveProv.FieldByName('RxMemDatname_korespond').Value   := myform.kod_sch;
            RxMemoryDataSaveProv.FieldByName('RxMemDatid_all_prov').Value  := myform.DatabaseMain.Gen_Id('KERNEL_GEN_ID', 1);
            RxMemoryDataSaveProv.FieldByName('RxMemDatkod_dog').Value      := 0;
            RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveId_Dog').Value := 0;
            RxMemoryDataSaveProv.FieldByName('RxMemDatsumma_value').Value  := 0;
            RxMemoryDataSaveProv.FieldByName('RxMemDatid_value').Value     := 0;
            RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_sm').Value      := myform.title_sm;
            RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_raz').Value     := myform.title_raz;
            RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_st').Value      := myform.title_st;
            RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_kekv').Value    := myform.title_kod;
            RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldNameCust').Value      := '';
            RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldNum_dog').Value       := '';
            RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldDate_dog').Value      := null;
            RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_sch').Value     := title_sch_in;;
            RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_kor_sch').Value := myform.title_sch;
            RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldSmRzStK').Value       := myform.smeta_kod +'\' + myform.raz_kod + '\' + myform.st_kod +'\'+ myform.kekv_kod;
            RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTypeDog').Value       := 0;
            RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldRegDog').Value        := 0;
            RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTin').Value           := myform.tin;
            RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldBirthday').Value      := myform.birthday;
            RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldMain').Value          := 1;
            RxMemoryDataSaveProv.Post;

        end else
        begin
            flag_na_zapusk_fio := true;
        end;

    end;
    if (m = ChangeAvance) or (m = ShowAvance) then
    begin
         id_ao_change := myform.DataSetMain.FieldByName('ID_AO').asVariant;
         if (myform.add_new_alg = 1) and (myform.date_new_alg<=date) then
         begin
             flag_new_alg := true;
         end;
         cxMRUEditFio.Text       := myform.DataSetMain.FieldByname('R_FIO').AsString;

         if((myform.DataSetMain.FieldByname('R_KOM_ON').AsInteger=1) and (myform.show_date_kom = 1)) then
         begin
             cxCheckBoxKom.Checked   := true;
             cxDateEditFrom.Date     := myform.DataSetMain.FieldByname('R_KOM_DATE_BEG').AsDateTime;
             cxDateEditTo.Date       := myform.DataSetMain.FieldByname('R_KOM_DATE_END').AsDateTime;
         end;

         DataSetChange.Close;
         DataSetChange.SQLs.SelectSQL.Text := 'select * from J4_DT_AO_SELECT_ALL('+IntToStr(id_ao_change)+')';
         DataSetChange.Open;
         cxDateEditAo.Date     := DataSetChange.FieldByname('R_DATE_AO').AsDateTime;
         last_date             := DataSetChange.FieldByname('R_DATE_AO').AsDateTime;
         cxTextEditSumma.Text  := DataSetChange.FieldByname('R_SUM_AO').AsString;
         cxMemoNote.Text       := DataSetChange.FieldByname('R_NOTE').AsString;
         cxEditNumber2.Text    := DataSetChange.FieldByname('R_NUM_AO').AsString;

         Last_number           := cxEditNumber2.Text;

         try cxLabel5.Caption := myform.DataSetMain.FieldByname('R_TN').AsString except cxLabel5.Caption := ''; end;
         try cxMemoDog.Text   := myform.DataSetMain.FieldByname('R_DOGOVOR').AsString except cxMemoDog.Text   := ''; end;
         DataSetChange.Close;
         DataSetChange.SQLs.SelectSQL.Text := 'Select * from J4_DT_AO_RASPREDELENIE_SELECT(' + IntToStr(id_ao_change) + ')';
         DataSetChange.Open;
         if DataSetChange.IsEmpty
             then flag_exists_ras := false
             else flag_exists_ras := true;
         DataSetChange.First;
         while not DataSetChange.Eof do
         begin
               RxMemoryDataRas.Open;
               RxMemoryDataRas.Insert;
               RxMemoryDataRas.FieldByName('RxMemoryDataName').value   := DataSetChange.FieldByName('NAME').AsString;
               RxMemoryDataRas.FieldByName('RxMemoryDataId').value     := DataSetChange.FieldByName('ID_SP_RASP').AsVariant;
               RxMemoryDataRas.FieldByName('RxMemoryDataNumber').value := DataSetChange.FieldByName('NUM').AsInteger;
               RxMemoryDataRas.FieldByName('RxMemoryDataSumma').value  := DataSetChange.FieldByName('SUMMA').AsFloat;
               RxMemoryDataRas.FieldByName('id_prov').value            := StrToInt64(DataSetChange.FieldByName('ID_PROV').AsString);
               RxMemoryDataRas.Post;
               DataSetChange.Next;
         end;
         DataSetChange.Close;
         DataSetChange.SQLs.SelectSQL.Text := 'Select * from J4_SELECT_ALL_PROV('''+myform.DataSetMain.FieldByName('R_ID_DT_DOC').AsString +''')';
         DataSetChange.Open;
         DataSetChange.First;
         DefineKodSchAo(DataSetChange.FieldByName('ID_SCH').AsVariant);
         cxDateEditAoPropertiesChange(Self);
         i := 1;
         while not DataSetChange.Eof do
         begin
               if DataSetChange.FieldByName('ID_CUSTOMER').AsVariant <> null
                then id_customer := StrToInt64(DataSetChange.FieldByName('ID_CUSTOMER').AsString)
                else id_customer := 0;

               RxMemoryDataSaveProv.Open;
               RxMemoryDataSaveProv.Insert;
               RxMemoryDataSaveProv.FieldByName('id').Value :=  i;
               RxMemoryDataSaveProv.FieldByName('RxMemDatId_doc_prov').Value :=  0;
               RxMemoryDataSaveProv.FieldByName('RxMemDatid_doc').Value      :=  0;
               RxMemoryDataSaveProv.FieldByName('RxMemDat_summa').Value      := DataSetChange.FieldByName('SUMMA').AsFloat;
               if DataSetChange.FieldByName('MAIN').AsInteger = 1 then
               begin
                   RxMemoryDataSaveProv.FieldByName('Summa_po_osnovnim').Value   := DataSetChange.FieldByName('SUMMA').AsFloat;
                   RxMemoryDataSaveProv.FieldByName('Summa_po_neosnovnim').Value := null;
               end else
               begin
                   RxMemoryDataSaveProv.FieldByName('Summa_po_osnovnim').Value   := null;
                   RxMemoryDataSaveProv.FieldByName('Summa_po_neosnovnim').Value := DataSetChange.FieldByName('SUMMA_NEOSN').AsFloat;
                   RxMemoryDataSaveProv.FieldByName('RxMemDat_summa').Value      := DataSetChange.FieldByName('SUMMA_NEOSN').AsFloat;
               end;
               RxMemoryDataSaveProv.FieldByName('RxMemDatid_sm').Value       := DataSetChange.FieldByName('ID_SM').AsVariant;
               RxMemoryDataSaveProv.FieldByName('RxMemDatid_razd').Value     := DataSetChange.FieldByName('ID_RAZD').AsVariant;
               RxMemoryDataSaveProv.FieldByName('RxMemDatid_st').Value       := DataSetChange.FieldByName('ID_ST').AsVariant;
               RxMemoryDataSaveProv.FieldByName('RxMemDatid_kekv').Value     := DataSetChange.FieldByName('ID_KEKV').AsVariant;
               RxMemoryDataSaveProv.FieldByName('RxMemDatid_man').Value      := DataSetChange.FieldByName('ID_MAN').AsVariant;
               RxMemoryDataSaveProv.FieldByName('RxMemDatid_sch').Value      := DataSetChange.FieldByName('ID_SCH').AsVariant;
               RxMemoryDataSaveProv.FieldByName('RxMemDatNameSch').Value     := DataSetChange.FieldByName('SCH_NUMBER').AsString;
               RxMemoryDataSaveProv.FieldByName('RxMemDatNameStat').Value    := DataSetChange.FieldByName('STAT_KOD').AsString;
               RxMemoryDataSaveProv.FieldByName('RxMemDatNameRazd').Value    := DataSetChange.FieldByName('RAZD_NUM').AsString;
               RxMemoryDataSaveProv.FieldByName('RxMemDatNameSmeta').Value   := DataSetChange.FieldByName('SMETA_KOD').AsString;
               RxMemoryDataSaveProv.FieldByName('RxMemDatFio').Value         := DataSetChange.FieldByName('FIO_man').AsString;
               RxMemoryDataSaveProv.FieldByName('RxMemDatNameKekv').Value    := DataSetChange.FieldByName('KEKV_KOD').AsString;
               RxMemoryDataSaveProv.FieldByName('RxMemDatID_SCH_KORESPOND').Value := DataSetChange.FieldByName('ID_KASS_SH').AsVariant;
               RxMemoryDataSaveProv.FieldByName('RxMemDatname_korespond').Value   := DataSetChange.FieldByName('SCH_KASS_NUMBER').AsString;
               RxMemoryDataSaveProv.FieldByName('RxMemDatid_all_prov').Value      := StrToInt64(DataSetChange.FieldByName('ID_ALL_PROV').AsString);
               RxMemoryDataSaveProv.FieldByName('RxMemDatkod_dog').Value                        := TFIBBCDField(DataSetChange.FieldByName('KOD_DOG')).AsInt64;
               RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveId_Dog').Value                 := TFIBBCDField(DataSetChange.FieldByName('ID_DOG')).AsInt64;
               RxMemoryDataSaveProv.FieldByName('RxMemDatsumma_value').Value                    := 0;
               RxMemoryDataSaveProv.FieldByName('RxMemDatid_value').Value                       := 0;
               RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_sm').Value      := DataSetChange.FieldByName('TITLE_SMETA').AsString;
               RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_raz').Value     := DataSetChange.FieldByName('TITLE_RZ').AsString;
               RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_st').Value      := DataSetChange.FieldByName('TITLE_STATE').AsString;
               RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_kekv').Value    := DataSetChange.FieldByName('TITLE_KEKV').AsString;
               RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldNameCust').Value      := DataSetChange.FieldByName('NAME_CUST').AsVariant;
               RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldNum_dog').Value       := DataSetChange.FieldByName('NUM_DOG').AsString;
               RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldDate_dog').Value      := DataSetChange.FieldByName('DATE_DOG').AsDateTime;
               RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_sch').Value     := DataSetChange.FieldByName('TITLE_SCH').AsString;
               RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_kor_sch').Value := DataSetChange.FieldByName('TITLE_KOR_SCH').AsString;
               RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldSmRzStK').Value       := DataSetChange.FieldByName('SMETA_KOD').AsString +'\' +DataSetChange.FieldByName('RAZD_NUM').AsString + '\' +DataSetChange.FieldByName('STAT_KOD').AsString +'\'+ DataSetChange.FieldByName('KEKV_KOD').AsString;
               RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTypeDog').Value       := DataSetChange.FieldByName('TYPE_DOG').AsString;
               RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldRegDog').Value        := DataSetChange.FieldByName('REG_DOG').AsString;
               RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldRegDog').Value        := DataSetChange.FieldByName('REG_DOG').AsString;
//               RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTin').Value           := DataSetChange.FieldByName('TIN').AsString;
//               RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldBirthday').Value      := DataSetChange.FieldByName('BIRTHDAY').AsString;
               RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldMain').Value          := DataSetChange.FieldByName('MAIN').AsInteger;
               RxMemoryDataSaveProv.Post;

               flag_exists_dog_intoDataset := false;
               while not RxMemoryDataSaveProv.Eof do
               begin
                   if (RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveId_Dog').Value <> TFIBBCDField(DataSetChange.FieldByName('ID_DOG')).AsInt64) then
                   begin
                       flag_exists_dog_intoDataset := true;
                   end;
                   RxMemoryDataSaveProv.Next;
               end;
               if flag_exists_dog_intoDataset then
               begin
                   if (cxMemoDog.Text = '') then
                        cxMemoDog.Text       := {Un_R_file_Alex.BANK_TYPE_DOGOVOR+' : ' + }DataSetChange.FieldByName('TYPE_DOG').AsString+'; №  '+DataSetChange.FieldByName('NUM_DOG').AsString+' '+ Un_R_file_Alex.KASSA_DOC_ORDER_FROM + ' ' +DataSetChange.FieldByName('DATE_DOG').AsString + ' ( '+ Un_R_file_Alex.KASSA_REG_NUM + DataSetChange.FieldByName('REG_DOG').AsString+' ); ' + Un_R_file_Alex.BANK_NAME_CUSTMERA + ' : ' + DataSetChange.FieldByName('NAME_CUST').AsString;
                   if (cxMemoDog.Text <> '') and (cxMemoDog.Lines.Strings[0] <> Un_R_file_Alex.SOGLASNO_SPISKU_DOG) then
                        cxMemoDog.Text       :=  Un_R_file_Alex.SOGLASNO_SPISKU_DOG + #13 + cxMemoDog.Text + DataSetChange.FieldByName('TYPE_DOG').AsString+'; №  '+DataSetChange.FieldByName('NUM_DOG').AsString+' '+ Un_R_file_Alex.KASSA_DOC_ORDER_FROM + ' ' +DataSetChange.FieldByName('DATE_DOG').AsString + ' ( '+ Un_R_file_Alex.KASSA_REG_NUM + DataSetChange.FieldByName('REG_DOG').AsString+' ); ' + Un_R_file_Alex.BANK_NAME_CUSTMERA + ' : ' + DataSetChange.FieldByName('NAME_CUST').AsString
                   ELSE cxMemoDog.Text       :=  cxMemoDog.Text + #13 + DataSetChange.FieldByName('TYPE_DOG').AsString+'; №  '+DataSetChange.FieldByName('NUM_DOG').AsString+' '+ Un_R_file_Alex.KASSA_DOC_ORDER_FROM + ' ' +DataSetChange.FieldByName('DATE_DOG').AsString + ' ( '+ Un_R_file_Alex.KASSA_REG_NUM + DataSetChange.FieldByName('REG_DOG').AsString+' ); ' + Un_R_file_Alex.BANK_NAME_CUSTMERA + ' : ' + DataSetChange.FieldByName('NAME_CUST').AsString;
               end;
               DataSetChange.Next;
         end;
    end;

    if  (m = ClonAvance) then
    begin
         id_ao_change := myform.DataSetMain.FieldByName('ID_AO').asVariant;

         if (myform.add_new_alg = 1) and (myform.date_new_alg<=date) then
         begin
             flag_new_alg := true;
         end;
         cxMRUEditFio.Text       := myform.DataSetMain.FieldByname('R_FIO').AsString;

         if((myform.DataSetMain.FieldByname('R_KOM_ON').AsInteger=1) and (myform.show_date_kom = 1)) then
         begin
             cxCheckBoxKom.Checked   := true;
             cxDateEditFrom.Date     := myform.DataSetMain.FieldByname('R_KOM_DATE_BEG').AsDateTime;
             cxDateEditTo.Date       := myform.DataSetMain.FieldByname('R_KOM_DATE_END').AsDateTime;
         end;

         DataSetChange.Close;
         DataSetChange.SQLs.SelectSQL.Text := 'select * from J4_DT_AO_SELECT_ALL('+IntToStr(id_ao_change)+')';
         DataSetChange.Open;
         cxDateEditAo.Date     := DataSetChange.FieldByname('R_DATE_AO').AsDateTime;
         last_date             := DataSetChange.FieldByname('R_DATE_AO').AsDateTime;

         cxTextEditSumma.Text  := DataSetChange.FieldByname('R_SUM_AO').AsString;
         cxMemoNote.Text       := DataSetChange.FieldByname('R_NOTE').AsString;

         cxDateEditAoPropertiesChange(Self);
         {If cxDateEditAo.Date < myform.date_beg then
          cxDateEditAo.Date := myform.date_beg;
          year_1 := YearOf(cxDateEditAo.Date);
          year := year_1 mod 100;
          year_l := IntToStr(year);
          if length(year_l) = 1 then year_l := '0' + year_l;
          month := MonthOf(cxDateEditAo.Date);
          month_l := IntToStr(month);
          if length(month_l) = 1 then month_l := '0' + month_l;
          cxEditNumber1.Text := kod_system + '-' + year_l + '/' + month_l + '-';
          year_last  := YearOf(last_date);
          month_last := MonthOf(last_date);

          if (year_last <> year_1) or (month_last <> month) then
          begin
              DataSetNumber.Close;
              DataSetNumber.SQLs.SelectSQL.Text := 'SELECT * FROM J4_ADD_AO_SELECT_MAX_NUMBER('''+ cxDateEditAo.Text +''', '+inttostr(myform.id_system)+')';
              DataSetNumber.Open;
              if not DataSetNumber.IsEmpty then
              begin
                  number := StrToInt(DataSetNumber.FieldByName('NUMBER').AsString);
                  if number < 99999 then
                  begin
                      number := number +1;
                      num := intToStr(number);
                      while length(num) < 5 do
                          num := '0' + num;
                      cxEditNumber2.Text := num;
                  end else
                      cxEditNumber2.Text := '99999';
              end else
                  cxEditNumber2.Text := '00001';
              if Last_number = '' then
                  Last_number := cxEditNumber2.Text;
          end;
                 }
         try cxLabel5.Caption := myform.DataSetMain.FieldByname('R_TN').AsString except cxLabel5.Caption := ''; end;
         try cxMemoDog.Text   := myform.DataSetMain.FieldByname('R_DOGOVOR').AsString except cxMemoDog.Text   := ''; end;
         DataSetChange.Close;
         DataSetChange.SQLs.SelectSQL.Text := 'Select * from J4_DT_AO_RASPREDELENIE_SELECT(' + IntToStr(id_ao_change) + ')';
         DataSetChange.Open;
         if DataSetChange.IsEmpty
             then flag_exists_ras := false
             else flag_exists_ras := true;
         DataSetChange.First;
         while not DataSetChange.Eof do
         begin
               RxMemoryDataRas.Open;
               RxMemoryDataRas.Insert;
               RxMemoryDataRas.FieldByName('RxMemoryDataName').value   := DataSetChange.FieldByName('NAME').AsString;
               RxMemoryDataRas.FieldByName('RxMemoryDataId').value     := DataSetChange.FieldByName('ID_SP_RASP').AsVariant;
               RxMemoryDataRas.FieldByName('RxMemoryDataNumber').value := DataSetChange.FieldByName('NUM').AsInteger;
               RxMemoryDataRas.FieldByName('RxMemoryDataSumma').value  := DataSetChange.FieldByName('SUMMA').AsFloat;
               RxMemoryDataRas.FieldByName('id_prov').value            := StrToInt64(DataSetChange.FieldByName('ID_PROV').AsString);
               RxMemoryDataRas.Post;
               DataSetChange.Next;
         end;
         DataSetChange.Close;
         DataSetChange.SQLs.SelectSQL.Text := 'Select * from J4_SELECT_ALL_PROV('''+myform.DataSetMain.FieldByName('R_ID_DT_DOC').AsString +''')';
         DataSetChange.Open;
         DataSetChange.First;
         i := 1;
         while not DataSetChange.Eof do
         begin
               if DataSetChange.FieldByName('ID_CUSTOMER').AsVariant <> null
                then id_customer := StrToInt64(DataSetChange.FieldByName('ID_CUSTOMER').AsString)
                else id_customer := 0;

               RxMemoryDataSaveProv.Open;
               RxMemoryDataSaveProv.Insert;
               RxMemoryDataSaveProv.FieldByName('id').Value :=  i;
               RxMemoryDataSaveProv.FieldByName('RxMemDatId_doc_prov').Value :=  0;
               RxMemoryDataSaveProv.FieldByName('RxMemDatid_doc').Value      :=  0;
               RxMemoryDataSaveProv.FieldByName('RxMemDat_summa').Value      := DataSetChange.FieldByName('SUMMA').AsFloat;
               if DataSetChange.FieldByName('MAIN').AsInteger = 1 then
               begin
                   RxMemoryDataSaveProv.FieldByName('Summa_po_osnovnim').Value   := DataSetChange.FieldByName('SUMMA').AsFloat;
                   RxMemoryDataSaveProv.FieldByName('Summa_po_neosnovnim').Value := null;
               end else
               begin
                   RxMemoryDataSaveProv.FieldByName('Summa_po_osnovnim').Value   := null;
                   RxMemoryDataSaveProv.FieldByName('Summa_po_neosnovnim').Value := DataSetChange.FieldByName('SUMMA_NEOSN').AsFloat;
                   RxMemoryDataSaveProv.FieldByName('RxMemDat_summa').Value      := DataSetChange.FieldByName('SUMMA_NEOSN').AsFloat;
               end;
               RxMemoryDataSaveProv.FieldByName('RxMemDatid_sm').Value       := DataSetChange.FieldByName('ID_SM').AsVariant;
               RxMemoryDataSaveProv.FieldByName('RxMemDatid_razd').Value     := DataSetChange.FieldByName('ID_RAZD').AsVariant;
               RxMemoryDataSaveProv.FieldByName('RxMemDatid_st').Value       := DataSetChange.FieldByName('ID_ST').AsVariant;
               RxMemoryDataSaveProv.FieldByName('RxMemDatid_kekv').Value     := DataSetChange.FieldByName('ID_KEKV').AsVariant;
               RxMemoryDataSaveProv.FieldByName('RxMemDatid_man').Value      := DataSetChange.FieldByName('ID_MAN').AsVariant;
               RxMemoryDataSaveProv.FieldByName('RxMemDatid_sch').Value      := DataSetChange.FieldByName('ID_SCH').AsVariant;
               RxMemoryDataSaveProv.FieldByName('RxMemDatNameSch').Value     := DataSetChange.FieldByName('SCH_NUMBER').AsString;
               RxMemoryDataSaveProv.FieldByName('RxMemDatNameStat').Value    := DataSetChange.FieldByName('STAT_KOD').AsString;
               RxMemoryDataSaveProv.FieldByName('RxMemDatNameRazd').Value    := DataSetChange.FieldByName('RAZD_NUM').AsString;
               RxMemoryDataSaveProv.FieldByName('RxMemDatNameSmeta').Value   := DataSetChange.FieldByName('SMETA_KOD').AsString;
               RxMemoryDataSaveProv.FieldByName('RxMemDatFio').Value         := DataSetChange.FieldByName('FIO_man').AsString;
               RxMemoryDataSaveProv.FieldByName('RxMemDatNameKekv').Value    := DataSetChange.FieldByName('KEKV_KOD').AsString;
               RxMemoryDataSaveProv.FieldByName('RxMemDatID_SCH_KORESPOND').Value := DataSetChange.FieldByName('ID_KASS_SH').AsVariant;
               RxMemoryDataSaveProv.FieldByName('RxMemDatname_korespond').Value   := DataSetChange.FieldByName('SCH_KASS_NUMBER').AsString;
               RxMemoryDataSaveProv.FieldByName('RxMemDatid_all_prov').Value      := myform.DatabaseMain.Gen_Id('KERNEL_GEN_ID', 1);
               RxMemoryDataSaveProv.FieldByName('RxMemDatkod_dog').Value                        := TFIBBCDField(DataSetChange.FieldByName('KOD_DOG')).AsInt64;
               RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveId_Dog').Value                 := TFIBBCDField(DataSetChange.FieldByName('ID_DOG')).AsInt64;
               RxMemoryDataSaveProv.FieldByName('RxMemDatsumma_value').Value                    := 0;
               RxMemoryDataSaveProv.FieldByName('RxMemDatid_value').Value                       := 0;
               RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_sm').Value      := DataSetChange.FieldByName('TITLE_SMETA').AsString;
               RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_raz').Value     := DataSetChange.FieldByName('TITLE_RZ').AsString;
               RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_st').Value      := DataSetChange.FieldByName('TITLE_STATE').AsString;
               RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_kekv').Value    := DataSetChange.FieldByName('TITLE_KEKV').AsString;
               RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldNameCust').Value      := DataSetChange.FieldByName('NAME_CUST').AsVariant;
               RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldNum_dog').Value       := DataSetChange.FieldByName('NUM_DOG').AsString;
               RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldDate_dog').Value      := DataSetChange.FieldByName('DATE_DOG').AsDateTime;
               RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_sch').Value     := DataSetChange.FieldByName('TITLE_SCH').AsString;
               RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_kor_sch').Value := DataSetChange.FieldByName('TITLE_KOR_SCH').AsString;
               RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldSmRzStK').Value       := DataSetChange.FieldByName('SMETA_KOD').AsString +'\' +DataSetChange.FieldByName('RAZD_NUM').AsString + '\' +DataSetChange.FieldByName('STAT_KOD').AsString +'\'+ DataSetChange.FieldByName('KEKV_KOD').AsString;
               RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTypeDog').Value       := DataSetChange.FieldByName('TYPE_DOG').AsString;
               RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldRegDog').Value        := DataSetChange.FieldByName('REG_DOG').AsString;
               RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldRegDog').Value        := DataSetChange.FieldByName('REG_DOG').AsString;
//               RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTin').Value           := DataSetChange.FieldByName('TIN').AsString;
//               RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldBirthday').Value      := DataSetChange.FieldByName('BIRTHDAY').AsString;
               RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldMain').Value          := DataSetChange.FieldByName('MAIN').AsInteger;
               RxMemoryDataSaveProv.Post;

               flag_exists_dog_intoDataset := false;
               while not RxMemoryDataSaveProv.Eof do
               begin
                   if (RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveId_Dog').Value <> TFIBBCDField(DataSetChange.FieldByName('ID_DOG')).AsInt64) then
                   begin
                       flag_exists_dog_intoDataset := true;
                   end;
                   RxMemoryDataSaveProv.Next;
               end;
               if flag_exists_dog_intoDataset then
               begin
                   if (cxMemoDog.Text = '') then
                        cxMemoDog.Text       := {Un_R_file_Alex.BANK_TYPE_DOGOVOR+' : ' + }DataSetChange.FieldByName('TYPE_DOG').AsString+'; №  '+DataSetChange.FieldByName('NUM_DOG').AsString+' '+ Un_R_file_Alex.KASSA_DOC_ORDER_FROM + ' ' +DataSetChange.FieldByName('DATE_DOG').AsString + ' ( '+ Un_R_file_Alex.KASSA_REG_NUM + DataSetChange.FieldByName('REG_DOG').AsString+' ); ' + Un_R_file_Alex.BANK_NAME_CUSTMERA + ' : ' + DataSetChange.FieldByName('NAME_CUST').AsString;
                   if (cxMemoDog.Text <> '') and (cxMemoDog.Lines.Strings[0] <> Un_R_file_Alex.SOGLASNO_SPISKU_DOG) then
                        cxMemoDog.Text       :=  Un_R_file_Alex.SOGLASNO_SPISKU_DOG + #13 + cxMemoDog.Text + DataSetChange.FieldByName('TYPE_DOG').AsString+'; №  '+DataSetChange.FieldByName('NUM_DOG').AsString+' '+ Un_R_file_Alex.KASSA_DOC_ORDER_FROM + ' ' +DataSetChange.FieldByName('DATE_DOG').AsString + ' ( '+ Un_R_file_Alex.KASSA_REG_NUM + DataSetChange.FieldByName('REG_DOG').AsString+' ); ' + Un_R_file_Alex.BANK_NAME_CUSTMERA + ' : ' + DataSetChange.FieldByName('NAME_CUST').AsString
                   ELSE cxMemoDog.Text       :=  cxMemoDog.Text + #13 + DataSetChange.FieldByName('TYPE_DOG').AsString+'; №  '+DataSetChange.FieldByName('NUM_DOG').AsString+' '+ Un_R_file_Alex.KASSA_DOC_ORDER_FROM + ' ' +DataSetChange.FieldByName('DATE_DOG').AsString + ' ( '+ Un_R_file_Alex.KASSA_REG_NUM + DataSetChange.FieldByName('REG_DOG').AsString+' ); ' + Un_R_file_Alex.BANK_NAME_CUSTMERA + ' : ' + DataSetChange.FieldByName('NAME_CUST').AsString;
               end;
               DataSetChange.Next;
         end;
    end;


    if {(m = ChangeAvance) or} (m = ShowAvance) then
    begin
        cxEditNumber2.Enabled   := false;
        cxMRUEditFio.Enabled    := false;
        cxDateEditAo.Enabled    := false;
        cxTextEditSumma.Enabled := false;
        cxMemoNote.Enabled      := false;
        ActionAdd.Enabled       := false;
        ActionEdit.Enabled      := false;
        ActionDel.Enabled       := false;
        ActionSave.Enabled      := false;
        cxCheckBoxKom.Enabled   := false;
        cxDateEditFrom.Enabled  := false;
        cxDateEditTo.Enabled    := false;
    end;
{    if id_p = 0 then cxMRUEditFio.Text := ''
        else
        begin
            cxMRUEditFio.Text := myform.DataSetMain.FieldByName('R_MAN_FAMILIA').AsString+' '+myform.DataSetMain.FieldByName('R_MAN_NAME').AsString+' '+myform.DataSetMain.FieldByName('R_MAN_OTCHESTVO').AsString;
            cxLabel5.Caption := '';
        end;
 }

    if ((myform.id_oper = 1)or(myform.id_oper = 0)or(myform.id_oper = null)) and (m = AddAvance)and(use_new_alg_for_num_ao=1) and (date_new_alg_for_num_ao<= cxDateEditAo.Date) then
    begin
        DataSetSch.Close;
        DataSetSch.SQLs.SelectSQL.Text := 'SELECT * FROM J4_SELECT_ALL_SCH_N('+IntToStr(id_system)+', '''+dateToStr(date_beg_ao)+''') ';
        DataSetSch.Open;
        DataSetSch.FetchAll;
        count_sch :=  DataSetSch.RecordCount;

        if (count_sch >1) then flag_na_zapusk_sch := true
        else
        if (count_sch =1) then
        begin
             id_sch_in := TFIBBCDField(DataSetSch.FieldByName('ID_SCH')).AsInt64;
             DefineKodSchAo(id_sch_in);
        end;
    end;



    flag_na_aftoscroll := true;
end;

procedure TfmAddChangeAvance.Get_Date_Beg_end(var date_b, date_e: tdate);
var date_cur_tmp : string;
begin
    if(cxDateEditAo.text<>'')and(cxDateEditAo.text<>null) then
    begin
        date_b := strToDate('01'+copy(cxDateEditAo.text, 3, 8));
    end
    else
    begin
        date_cur_tmp := datetostr(date);
        date_b := strToDate('01'+copy(date_cur_tmp, 3, 8))
    end;
    date_e := IncMonth(date_b,1);
    date_e := IncDay(date_e,-1);
end;

procedure TfmAddChangeAvance.DefineKodSchAo(id_sch_main : int64);
var date_b,date_e : Tdate;
begin
     Get_Date_Beg_end(date_b, date_e);
     date_beg_ao := date_b;
     date_end_ao := date_e;
     DataSetSch.Close;
     DataSetSch.SQLs.SelectSQL.Text := 'SELECT * FROM J4_SP_J0_SCH where id_sch='+IntToStr(id_sch_main)+' and date_begin<='''+dateToStr(date_beg_ao)+ ''' and date_end>='''+dateToStr(date_beg_ao)+'''';
     DataSetSch.Open;
     if DataSetSch['KOD_SCH'] <> null then
        kod_sch_ao := DataSetSch.FieldByName('KOD_SCH').AsInteger
     else
        kod_sch_ao := 0;
end;


procedure TfmAddChangeAvance.cxButtonCloseClick(Sender: TObject);
begin
    Close;
end;

procedure TfmAddChangeAvance.cxDateEditAoPropertiesChange(Sender: TObject);
var
    year, year_1, year_last : integer;
    year_l : string;
    month, month_last : integer;
    month_l : string;
    NUMBER : INTEGER;
    num, kod_sch_ao_str : string;
begin
    If cxDateEditAo.Date < myform.date_beg then
        cxDateEditAo.Date := myform.date_beg;
    year_1 := YearOf(cxDateEditAo.Date);
    year := year_1 mod 100;
    year_l := IntToStr(year);
    if length(year_l) = 1 then year_l := '0' + year_l;
    month := MonthOf(cxDateEditAo.Date);
    month_l := IntToStr(month);
    if length(month_l) = 1 then month_l := '0' + month_l;
    if (kod_sch_ao<>null) and (kod_sch_ao<>0) then
    begin
       if(kod_sch_ao<9) then
            kod_sch_ao_str  := '0'+inttostr(kod_sch_ao)
       else
            kod_sch_ao_str  := inttostr(kod_sch_ao)
    end else
       kod_sch_ao_str  := '';

    if(use_new_alg_for_num_ao=1) and (date_new_alg_for_num_ao<= cxDateEditAo.Date) then
         cxEditNumber1.Text := kod_system + '-' + year_l + '/' + month_l + '-'+kod_sch_ao_str+'/'
    else
         cxEditNumber1.Text := kod_system + '-' + year_l + '/' + month_l + '-';

    year_last  := YearOf(last_date);
    month_last := MonthOf(last_date);

    if (year_last <> year_1) or (month_last <> month)or((use_new_alg_for_num_ao=1) and (date_new_alg_for_num_ao<= cxDateEditAo.Date)) then
    begin
        DataSetNumber.Close;
        DataSetNumber.SQLs.SelectSQL.Text := 'SELECT * FROM J4_ADD_AO_SELECT_MAX_NUMBER('''+ cxDateEditAo.Text +''', '+inttostr(myform.id_system)+', '+inttostr(kod_sch_ao)+')';
        DataSetNumber.Open;
        if not DataSetNumber.IsEmpty then
        begin
            number := StrToInt(DataSetNumber.FieldByName('NUMBER').AsString);
            if number < 99999 then
            begin
                number := number +1;
                num := intToStr(number);
                while length(num) < 5 do
                    num := '0' + num;
                cxEditNumber2.Text := num;
            end else
                cxEditNumber2.Text := '99999';
        end else
            cxEditNumber2.Text := '00001';
        if Last_number = '' then
            Last_number := cxEditNumber2.Text;
    end;
end;

procedure TfmAddChangeAvance.cxEditNumber2KeyPress(Sender: TObject;
  var Key: Char);
begin
    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and (Ord(Key) <> VK_ESCAPE)
    then
        Key := Chr(0)
end;

procedure TfmAddChangeAvance.cxButtonNextClick(Sender: TObject);
var
    s : boolean;
begin
    PageControl1Changing(Sender, s);
end;

procedure TfmAddChangeAvance.SpBtUpClick(Sender: TObject);
var
//    name, summa : string;
    id, id_pred : integer;
begin
   if RxMemoryDataRas.RecordCount > 1 then
   begin
       if RxMemoryDataRas.FieldByName('RxMemoryDataNumber').value > 1 then
       begin
            id      := RxMemoryDataRas.FieldByName('RxMemoryDataId').Value;

            //ShowMessage(RxMemoryDataRas.FieldByName('RxMemoryDataNumber').AsString);

            cxGrid2DBTableView1.Controller.GoToPrev(False);
            id_pred := RxMemoryDataRas.FieldByName('RxMemoryDataId').Value;

            //ShowMessage(RxMemoryDataRas.FieldByName('RxMemoryDataNumber').AsString);

            RxMemoryDataRas.Locate('RxMemoryDataId', id, [] );
            RxMemoryDataRas.Open;
            RxMemoryDataRas.Edit;

            //ShowMessage(RxMemoryDataRas.FieldByName('RxMemoryDataNumber').AsString);

            RxMemoryDataRas.FieldByName('RxMemoryDataNumber').AsInteger := RxMemoryDataRas.FieldByName('RxMemoryDataNumber').AsInteger - 1;

            //ShowMessage(RxMemoryDataRas.FieldByName('RxMemoryDataNumber').AsString);

            RxMemoryDataRas.Post;

            RxMemoryDataRas.Locate('RxMemoryDataId', id_pred, [] );
            RxMemoryDataRas.Open;
            RxMemoryDataRas.Edit;

            //ShowMessage(RxMemoryDataRas.FieldByName('RxMemoryDataNumber').AsString);

            RxMemoryDataRas.FieldByName('RxMemoryDataNumber').AsInteger := RxMemoryDataRas.FieldByName('RxMemoryDataNumber').AsInteger + 1;

            //ShowMessage(RxMemoryDataRas.FieldByName('RxMemoryDataNumber').AsString);

            RxMemoryDataRas.Post;

            RxMemoryDataRas.Refresh;
            RxMemoryDataRas.Locate('RxMemoryDataId', id, [] );

            //ShowMessage(RxMemoryDataRas.FieldByName('RxMemoryDataNumber').AsString);
       end;
   end;
end;

procedure TfmAddChangeAvance.SpBtDownClick(Sender: TObject);
var
//    name, summa : string;
    id, id_pred : integer;
begin
   if RxMemoryDataRas.RecordCount > 1 then
   begin
       if RxMemoryDataRas.FieldByName('RxMemoryDataNumber').value < RxMemoryDataRas.RecordCount then
       begin
            id      := RxMemoryDataRas.FieldByName('RxMemoryDataId').Value;
            //ShowMessage(RxMemoryDataRas.FieldByName('RxMemoryDataNumber').AsString);
            cxGrid2DBTableView1.Controller.GoToLast(False);
            id_pred := RxMemoryDataRas.FieldByName('RxMemoryDataId').Value;
            //ShowMessage(RxMemoryDataRas.FieldByName('RxMemoryDataNumber').AsString);
            RxMemoryDataRas.Locate('RxMemoryDataId', id, []);
            RxMemoryDataRas.Open;
            RxMemoryDataRas.Edit;
            //ShowMessage(RxMemoryDataRas.FieldByName('RxMemoryDataNumber').AsString);
            RxMemoryDataRas.FieldByName('RxMemoryDataNumber').AsInteger := RxMemoryDataRas.FieldByName('RxMemoryDataNumber').AsInteger + 1;
            //ShowMessage(RxMemoryDataRas.FieldByName('RxMemoryDataNumber').AsString);
            RxMemoryDataRas.Post;
            RxMemoryDataRas.Locate('RxMemoryDataId', id_pred, []);
            RxMemoryDataRas.Open;
            RxMemoryDataRas.Edit;
            //ShowMessage(RxMemoryDataRas.FieldByName('RxMemoryDataNumber').AsString);
            RxMemoryDataRas.FieldByName('RxMemoryDataNumber').AsInteger := RxMemoryDataRas.FieldByName('RxMemoryDataNumber').AsInteger - 1;
            //ShowMessage(RxMemoryDataRas.FieldByName('RxMemoryDataNumber').AsString);
            RxMemoryDataRas.Post;
            RxMemoryDataRas.Refresh;
            RxMemoryDataRas.Locate('RxMemoryDataId', id, []);
            //ShowMessage(RxMemoryDataRas.FieldByName('RxMemoryDataNumber').AsString);
       end;
   end;
end;

procedure TfmAddChangeAvance.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
    if PageControl1.ActivePage = TabSheet2 then
    begin
        PageControl1.ActivePage := TabSheet1;
//        SpBtChange.Enabled := true;
    end else
    begin
        PageControl1.ActivePage := TabSheet2;
//        SpBtChange.Enabled := false;
    end;
end;

procedure TfmAddChangeAvance.cxMRUEditFioPropertiesButtonClick(
  Sender: TObject);
var
    Res : Variant;
    date_b,date_e : Tdate;
begin
    flag_na_aftoscroll := false;
    Get_Date_Beg_end(date_b, date_e);
    date_beg_ao := date_b;
    date_end_ao := date_e;

    Res := Un_lo_file_Alex.MY_GetManExAo(self, database.Handle, date_beg_ao, date_end_ao, false, false, id_people);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) and (res[1]<>null) then
        begin
            pFIBDataSet1.Close;
            pFIBDataSet1.SQLs.SelectSQL.Text := 'SELECT * FROM PUB_SYS_DATA';
            pFIBDataSet1.Open;
            id_people := res[0];
            if pFIBDataSet1['ID_LANGUAGE'] = 1 then
            begin
                cxMRUEditFio.Text := res[5] + ' '+ res[6] + ' ' + res[7];
                if res[10] <> null
                    then cxLabel5.caption  := res[10]
                    else cxLabel5.caption  := '';
                RxMemoryDataSaveProv.First;
                while not RxMemoryDataSaveProv.Eof do
                begin
                    RxMemoryDataSaveProv.Open;
                    RxMemoryDataSaveProv.Edit;
                    RxMemoryDataSaveProv.FieldByName('RxMemDatid_man').Value                    := res[0];
                    RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTin').Value      := res[9];
                    RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldBirthday').Value := res[8];
                    RxMemoryDataSaveProv.FieldByName('RxMemDatFio').Value                       := cxMRUEditFio.Text;
                    RxMemoryDataSaveProv.Post;
                    RxMemoryDataSaveProv.Next;
                end;
            end;
            if pFIBDataSet1['ID_LANGUAGE'] = 0 then
            begin
                cxMRUEditFio.Text := res[1];
                if res[10] <> null
                    then cxLabel5.caption  := res[10]
                    else cxLabel5.caption  := '';
                if not RxMemoryDataSaveProv.IsEmpty then
                begin
                    RxMemoryDataSaveProv.First;
                    while not RxMemoryDataSaveProv.Eof do
                    begin
                        RxMemoryDataSaveProv.Open;
                        RxMemoryDataSaveProv.Edit;
                        RxMemoryDataSaveProv.FieldByName('RxMemDatid_man').Value                    := res[0];
                        RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTin').Value      := res[9];
                        RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldBirthday').Value := res[8];
                        RxMemoryDataSaveProv.FieldByName('RxMemDatFio').Value                       := cxMRUEditFio.Text;
                        RxMemoryDataSaveProv.Post;
                        RxMemoryDataSaveProv.Next;
                    end;
                end;
            end;
            cxDateEditAo.SetFocus;
            pFIBDataSet1.Close;
        end;
    end;
    flag_na_aftoscroll := true;
end;

procedure TfmAddChangeAvance.cxMRUEditTypePropertiesButtonClick(
  Sender: TObject);
//var
//    Res : Variant;
begin
{    Res := Un_lo_file_Alex.LoadSpTypeDoc(self, myclass.id_user, database);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) and (res[1]<>null) then
        begin
//            ShowMessage(IntToStr(res[0]));
            id_type_doc := res[0];
            cxMRUEditType.Text := res[2];
        end;
    end;}
end;

procedure TfmAddChangeAvance.ActionAddExecute(Sender: TObject);
var
    res : Variant;
    j, max, num, main, i, kod_neos : integer;
    id, id_prov, id_pprr, id_cust : int64;
    flag : boolean;
    name : string;
    ssum, sum_prov : Currency;
    id_smeta, id_stat, id_r, id_k, id_sch, id_man_prov, id_kor_sch, id_dog, kod_dog : int64;
    name_smeta, name_stat, name_r, name_k, name_sch, name_fio, name_kor_sch, date_dog, num_dog, name_cust, title_sm, title_rz, title_st, title_kekv, title_sch, title_kor_sch, type_dog, reg_dog, tin, birthday : string;
    summa, summa_doc : double;
    c : TfmModeProv;
begin
    flag_na_aftoscroll := false;
    if my_m <> ShowAvance then
    begin
        if PageControl1.ActivePage = TabSheet2 then
    //добавление расшафровок
        begin
            res := Un_lo_file_Alex.LoadSpEditSpRazdelAvanse(self, 1, database);
            if VarArrayDimCount(res) > 0 then
//            for i:=0 to VarArrayHighBound(Res,1) do
            begin
                if (res[2]<>null) and (res[0]<>null) then
                begin
                    flag     := false;
                    max      := 0;
                    sum_prov := 0;
                    if not RxMemoryDataRas.IsEmpty then
                    begin
                        RxMemoryDataRas.First;
                        for j := 1 to RxMemoryDataRas.RecordCount do
                        begin
//                            if RxMemoryDataRas.FieldByName('RxMemoryDataId').Value = res[0]
//                                then flag := true;
                            if RxMemoryDataRas.FieldByName('RxMemoryDataNumber').Value > max then
                                max := RxMemoryDataRas.FieldByName('RxMemoryDataNumber').Value;
                            sum_prov := sum_prov + RxMemoryDataRas.FieldByName('RxMemoryDataSumma').Value;
                            RxMemoryDataRas.Next;
                        end;
                        if not flag then
                        begin
                            name := res[2];
                            id   := res[0];
                            try ssum := StrToCurr(cxTextEditSumma.Text) - sum_prov; except ssum := 0; end;
                            num  := max + 1;
                            if Show_Ras(self, myform.DatabaseMain, myform.TransactionRead, AddRas, id, ssum, name, num, id_pprr, '') then
                            begin
                                RxMemoryDataRas.Open;
                                RxMemoryDataRas.Insert;
                                RxMemoryDataRas.FieldByName('RxMemoryDataName').value   := name;
                                RxMemoryDataRas.FieldByName('RxMemoryDataId').value     := id;
                                RxMemoryDataRas.FieldByName('RxMemoryDataNumber').value := num;
                                RxMemoryDataRas.FieldByName('RxMemoryDataSumma').Value  := ssum;
                                RxMemoryDataRas.FieldByName('id_prov').Value            := id_pprr;
                                RxMemoryDataRas.Post;
                            end;
                        end;
                    end
                    else begin
                            name := res[2];
                            id   := res[0];
                            try ssum := StrToCurr(cxTextEditSumma.Text); except ssum := 0; end; 
                            num  := 1;
                            if Show_Ras(self, myform.DatabaseMain, myform.TransactionRead, AddRas, id, ssum, name, num, id_pprr, '') then
                            begin
                                RxMemoryDataRas.Open;
                                RxMemoryDataRas.Insert;
                                RxMemoryDataRas.FieldByName('RxMemoryDataName').value   := NAME;
                                RxMemoryDataRas.FieldByName('RxMemoryDataId').value     := ID;
                                RxMemoryDataRas.FieldByName('RxMemoryDataNumber').value := NUM;
                                RxMemoryDataRas.FieldByName('RxMemoryDataSumma').Value  := ssum;
                                RxMemoryDataRas.FieldByName('id_prov').Value            := id_pprr;
                                RxMemoryDataRas.Post;
                            END;
                    end;
                end;
            end;
        end;

        // добавление шапки
        if PageControl1.ActivePage = TabSheet1 then
        begin
            id_smeta := 0;
            id_stat  := 0;
            id_r     := 0;
            id_k     := 0;
            if (id_sch_in<>null) then id_sch := id_sch_in else  id_sch   := 0;
            id_kor_sch  := 0;
            id_man_prov := id_people;
            id_cust    := 0;
            name_fio   := cxMRUEditFio.Text;
            name_kor_sch := '';
            name_smeta := '';
            name_stat  := '';
            name_r     := '';
            name_k     := '';
            name_sch   := '';
            summa_doc  := 0;
            kod_neos   := -1;
            if RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveId_Dog').Value <> null
                 then id_dog := RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveId_Dog').Value
                 else id_dog := 0;
            if RxMemoryDataSaveProv.FieldByName('RxMemDatkod_dog').Value <> null
                 then kod_dog := RxMemoryDataSaveProv.FieldByName('RxMemDatkod_dog').Value
                 else kod_dog := 0;
            if RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldDate_dog').Value <> null
                 then date_dog := RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldDate_dog').Value
                 else date_dog := '';
            if RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldNum_dog').Value <> null
                 then num_dog := RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldNum_dog').Value
                 else num_dog := '';
            if RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldNameCust').Value <> null
                 then name_cust := RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldNameCust').Value
                 else name_cust := '';
            if RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTypeDog').Value <> null
                 then type_dog := RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTypeDog').Value
                 else type_dog := '';
            if RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldRegDog').Value <> null
                 then reg_dog := RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldRegDog').Value
                 else reg_dog := '';
            title_sm      := '';
            title_rz      := '';
            title_st      := '';
            title_kekv    := '';
            title_sch     := '';
            title_kor_sch := '';
            tin           := RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTin').AsString;
            if RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldBirthday').Value <> null
                then birthday := RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldBirthday').Value
                else birthday := '';
            id_prov := 0;
            if myform.show_neosn_prov = 1 then
            begin
                if MessageBox(HANDLE, pcHAR(Un_R_file_Alex.MY_MAIN_PROV + #13 + Un_R_file_Alex.MY_MAIN_PROV_NEOS), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), mb_YesNO)=mrYes then
                begin
                    c    := AddProvAvance;
                    main := 1;
                end else
                begin
                    c    := DontMainProvAvance;
                    main := 0;
                end;
                summa_doc  := 0;

                if main = 1 then
                begin
                    RxMemoryDataSaveProv.First;
                    while not RxMemoryDataSaveProv.Eof do
                    begin
                        try summa_doc := summa_doc + RxMemoryDataSaveProv.FieldByName('Summa_po_osnovnim').Value; except end;
                        RxMemoryDataSaveProv.next;
                    end;
                    if StrToFloat(cxTextEditSumma.Text) <> 0
                        then summa := StrToFloat(cxTextEditSumma.Text) - summa_doc
                        else summa := 0;
                end else
                begin
                    RxMemoryDataSaveProv.First;
                    while not RxMemoryDataSaveProv.Eof do
                    begin
                        try summa_doc := summa_doc + RxMemoryDataSaveProv.FieldByName('Summa_po_neosnovnim').Value; except end;
                        RxMemoryDataSaveProv.next;
                    end;
                    if StrToFloat(cxTextEditSumma.Text) <> 0
                        then summa := StrToFloat(cxTextEditSumma.Text) - summa_doc
                        else summa := 0;
                end;
            end else
            begin
                c    := AddProvAvance;
                main := 1;

                RxMemoryDataSaveProv.First;
                while not RxMemoryDataSaveProv.Eof do
                begin
                    summa_doc := summa_doc + RxMemoryDataSaveProv.FieldByName('RxMemDat_summa').Value;
                    RxMemoryDataSaveProv.next;
                end;
                if StrToFloat(cxTextEditSumma.Text) <> 0
                    then summa := StrToFloat(cxTextEditSumma.Text) - summa_doc
                    else summa := 0;
            end;
            if Show_Provodka(self, myform.prihod, myform.id_system, myform.DatabaseMain, myform.TransactionRead, c, id_sch, id_man_prov, id_kor_sch, id_smeta, id_stat, id_r, id_k, id_cust,  summa, name_fio, name_kor_sch, name_smeta, name_stat, name_r, name_k, name_sch, id_dog, kod_dog, date_dog, num_dog, name_cust, title_sm, title_rz, title_st, title_kekv, title_sch, title_kor_sch, reg_dog, type_dog, tin, birthday, id_prov, main, kod_neos, id_dog_group,id_dog_group_pr,id_dog_group_rash) then
            begin
                 RxMemoryDataSaveProv.First;
                 i := 0;
                 while not RxMemoryDataSaveProv.Eof do
                 begin
                     if i < RxMemoryDataSaveProv.FieldByName('id').AsInteger then i := RxMemoryDataSaveProv.FieldByName('id').AsInteger;
                     RxMemoryDataSaveProv.Next;
                 end;

                 RxMemoryDataSaveProv.Open;
                 RxMemoryDataSaveProv.Insert;
                 RxMemoryDataSaveProv.FieldByName('id').Value                                     :=  i+1;
                 RxMemoryDataSaveProv.FieldByName('RxMemDatId_doc_prov').Value                    :=  0;
                 RxMemoryDataSaveProv.FieldByName('RxMemDatid_doc').Value                         :=  0;
                 RxMemoryDataSaveProv.FieldByName('RxMemDat_summa').Value                         := summa;
                 RxMemoryDataSaveProv.FieldByName('RxMemDatid_sm').Value                          := id_smeta;
                 RxMemoryDataSaveProv.FieldByName('RxMemDatid_razd').Value                        := id_r;
                 RxMemoryDataSaveProv.FieldByName('RxMemDatid_st').Value                          := id_stat;
                 RxMemoryDataSaveProv.FieldByName('RxMemDatid_kekv').Value                        := id_k;
                 RxMemoryDataSaveProv.FieldByName('RxMemDatid_man').Value                         :=  id_man_prov;
                 RxMemoryDataSaveProv.FieldByName('RxMemDatid_sch').Value                         := id_sch;
                 RxMemoryDataSaveProv.FieldByName('RxMemDatNameSch').Value                        := name_sch;
                 RxMemoryDataSaveProv.FieldByName('RxMemDatNameStat').Value                       := name_stat;
                 RxMemoryDataSaveProv.FieldByName('RxMemDatNameRazd').Value                       := name_r;
                 RxMemoryDataSaveProv.FieldByName('RxMemDatNameSmeta').Value                      := name_smeta;
                 RxMemoryDataSaveProv.FieldByName('RxMemDatFio').Value                            := name_fio;
                 RxMemoryDataSaveProv.FieldByName('RxMemDatNameKekv').Value                       := name_k;
                 RxMemoryDataSaveProv.FieldByName('RxMemDatID_SCH_KORESPOND').Value               := id_kor_sch;
                 RxMemoryDataSaveProv.FieldByName('RxMemDatname_korespond').Value                 := name_kor_sch;
                 if id_prov > 0
                      then RxMemoryDataSaveProv.FieldByName('RxMemDatid_all_prov').Value          := id_prov
                      else RxMemoryDataSaveProv.FieldByName('RxMemDatid_all_prov').Value          := myform.DatabaseMain.Gen_Id('KERNEL_GEN_ID', 1);
                 RxMemoryDataSaveProv.FieldByName('RxMemDatkod_dog').Value                        := kod_dog;
                 RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveId_Dog').Value                 := id_dog;
                 RxMemoryDataSaveProv.FieldByName('RxMemDatsumma_value').Value                    := 0;
                 RxMemoryDataSaveProv.FieldByName('RxMemDatid_value').Value                       := 0;
                 RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldSmRzStK').Value       := name_smeta + '\' + name_r + '\' + name_stat + '\' + name_k;
                 RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldNum_dog').Value       := num_dog;
                 RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldNameCust').Value      := name_cust;
                 RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_kor_sch').Value := title_kor_sch;
                 RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_sch').Value     := title_sch;
                 RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_kekv').Value    := title_kekv;
                 RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_st').Value      := title_st;
                 RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_raz').Value     := title_rz;
                 RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_sm').Value      := title_sm;
                 try RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldDate_dog').Value  := StrTodate(date_dog) except RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldDate_dog').Value := null; end;
                 RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTypeDog').Value       := type_dog;
                 RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldRegDog').Value        := reg_dog;
                 RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTin').Value           := tin;
                 try RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldBirthday').Value  := birthday except RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldBirthday').Value := null; end;
                 RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldMain').Value          := main;
                 if main = 1 then
                 begin
                     RxMemoryDataSaveProv.FieldByName('Summa_po_osnovnim').Value   := summa;
                     RxMemoryDataSaveProv.FieldByName('Summa_po_neosnovnim').Value := null;
                 end else
                 begin
                     RxMemoryDataSaveProv.FieldByName('Summa_po_osnovnim').Value   := null;
                     RxMemoryDataSaveProv.FieldByName('Summa_po_neosnovnim').Value := summa;
                 end;

                 RxMemoryDataSaveProv.Post;

                 RxMemoryDataSaveProv.Locate('id', i+1, []);

                 if kod_neos <> -1 then
                 begin
                     Ds.Close;
                     Ds.Sqls.SelectSql.Text := 'SELECT * FROM J4_SELECT_NEOSNOV_PROV_INFO('+IntToStr(kod_neos)+', '''+cxDateEditAo.Text+''')';
                     Ds.Open;
                     Ds.First;
                     i := i+1;
                     while not Ds.Eof do
                     begin
                         RxMemoryDataSaveProv.Open;
                         RxMemoryDataSaveProv.Insert;
                         RxMemoryDataSaveProv.FieldByName('id').Value :=  i+1;
                         RxMemoryDataSaveProv.FieldByName('RxMemDatId_doc_prov').Value                    := 0;
                         RxMemoryDataSaveProv.FieldByName('RxMemDatid_doc').Value                         := 0;
                         RxMemoryDataSaveProv.FieldByName('RxMemDat_summa').Value                         := RoundTo((summa/100)*Ds.fbn('PER_SUM').AsCurrency, -2);
                         RxMemoryDataSaveProv.FieldByName('RxMemDatid_sm').Value                          := StrToint64(Ds.FBN('ID_SM').AsString);
                         RxMemoryDataSaveProv.FieldByName('RxMemDatid_razd').Value                        := StrToint64(Ds.FBN('ID_RAZD').AsString);
                         RxMemoryDataSaveProv.FieldByName('RxMemDatid_st').Value                          := StrToint64(Ds.FBN('ID_ST').AsString);
                         RxMemoryDataSaveProv.FieldByName('RxMemDatid_kekv').Value                        := StrToint64(Ds.FBN('ID_K').AsString);
                         RxMemoryDataSaveProv.FieldByName('RxMemDatid_man').Value                         := id_man_prov;
                         RxMemoryDataSaveProv.FieldByName('RxMemDatid_sch').Value                         := id_kor_sch;
                         RxMemoryDataSaveProv.FieldByName('RxMemDatNameSch').Value                        := name_kor_sch;
                         RxMemoryDataSaveProv.FieldByName('RxMemDatNameStat').Value                       := Ds.FBN('R_STETE_NUM').AsString;
                         RxMemoryDataSaveProv.FieldByName('RxMemDatNameRazd').Value                       := Ds.FBN('R_RAZD_NUM').AsString;
                         RxMemoryDataSaveProv.FieldByName('RxMemDatNameSmeta').Value                      := Ds.FBN('R_KOD_SM').AsString;
                         RxMemoryDataSaveProv.FieldByName('RxMemDatFio').Value                            := name_fio;
                         RxMemoryDataSaveProv.FieldByName('RxMemDatNameKekv').Value                       := Ds.FBN('R_NAME_KEKV').AsString;
                         RxMemoryDataSaveProv.FieldByName('RxMemDatID_SCH_KORESPOND').Value               := StrToint64(Ds.FBN('ID_SCH').AsString);
                         RxMemoryDataSaveProv.FieldByName('RxMemDatname_korespond').Value                 := Ds.FBN('KOD_SCH').AsString;
                         RxMemoryDataSaveProv.FieldByName('RxMemDatid_all_prov').Value                    := myform.DatabaseMain.Gen_Id('KERNEL_GEN_ID', 1);
                         RxMemoryDataSaveProv.FieldByName('RxMemDatkod_dog').Value                        := kod_dog;
                         RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveId_Dog').Value                 := id_dog;
                         RxMemoryDataSaveProv.FieldByName('RxMemDatsumma_value').Value                    := 0;
                         RxMemoryDataSaveProv.FieldByName('RxMemDatid_value').Value                       := 0;
                         RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldSmRzStK').Value       := Ds.FBN('PROV').AsString;
                         RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldNum_dog').Value       := num_dog;
                         RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldNameCust').Value      := name_cust;
                         RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_kor_sch').Value := Ds.FBN('TITLY_SCH').AsString;
                         RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_sch').Value     := title_kor_sch;
                         RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_kekv').Value    := Ds.FBN('R_KEKV_TITLE').AsString;
                         RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_st').Value      := Ds.FBN('R_STATE_TITLE').AsString;
                         RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_raz').Value     := Ds.FBN('R_RAZD_TITLE').AsString;
                         RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_sm').Value      := Ds.FBN('R_SMETA_TITLE').AsString;
                         try RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldDate_dog').Value  := StrTodate(date_dog) except RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldDate_dog').Value := null; end;
                         RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTypeDog').Value       := type_dog;
                         RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldRegDog').Value        := reg_dog;
                         RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTin').Value           := tin;
                         try RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldBirthday').Value  := birthday except RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldBirthday').Value := null; end;
                         RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldMain').Value          := 0;
                         RxMemoryDataSaveProv.FieldByName('Summa_po_osnovnim').Value                      := null;
                         RxMemoryDataSaveProv.FieldByName('Summa_po_neosnovnim').Value                    := RoundTo((summa/100)*Ds.fbn('PER_SUM').AsCurrency, -2);
                         RxMemoryDataSaveProv.Post;

                         Ds.Next;
                     end;
                end;
           end;
        end;
    end;
    flag_na_aftoscroll := true;
end;

procedure TfmAddChangeAvance.ActionDelExecute(Sender: TObject);
var
    i{, j} : integer;
begin
    i:= -1;
  flag_na_aftoscroll := false;
  if cxGrid1.IsFocused then
  begin
    if (MessageBox(Handle, Pchar(Un_R_file_Alex.KASSA_DELETE_PROV +' '+ RxMemoryDataSaveProv.FieldByName('RxMemDat_summa').AsString), Pchar(Un_R_file_Alex.KASSA_LOOK_FOR), MB_YESNO)=mrYes) and (not RxMemoryDataSaveProv.IsEmpty) then
    begin
//      j := RxMemoryDataSaveProv.FieldByName('id').AsInteger;
      if cxGrid1DBTableView1.Controller.GoToPrev(false) then
      begin
          i := RxMemoryDataSaveProv.FieldByName('id').AsInteger;
          cxGrid1DBTableView1.Controller.GoToNext(false);
//          RxMemoryDataSaveProv.Locate('id', j, [] );
      end;
      if not RxMemoryDataSaveProv.IsEmpty then
      begin
          RxMemoryDataSaveProv.Delete;
          RxMemoryDataSaveProv.Locate('id', i, [] );
      end;
    end;
  end;
  if cxGrid2.IsFocused then
  begin
      if not RxMemoryDataRas.IsEmpty then RxMemoryDataRas.Delete;
  end;
  flag_na_aftoscroll := true;
end;

procedure TfmAddChangeAvance.ActionSaveExecute(Sender: TObject);
var
    id_all_doc : int64;
    i : integer;
    id_all{, id_izm} : int64;
    s1, s2, s3,s4 : double;
//    add_num : integer;
    STRU : KERNEL_MODE_STRUCTURE;
    errorList : TstringList;
    DoResult, flag : boolean;
    flag_izmeni_rasshif : boolean;
    flag_exist_num: integer;
    mes: string;
begin
    flag_na_aftoscroll := false;
    cxMemoNote.Text    := StringReplace(cxMemoNote.Text, '''', '''''', [rfReplaceAll]);
    cxMRUEditFio.Text  := StringReplace(cxMRUEditFio.Text, '''', '''''', [rfReplaceAll]);
    DoResult           := false;
    flag := false;
    mes := '';

    if ((use_new_alg_for_num_ao=1) and (date_new_alg_for_num_ao<=cxDateEditAo.Date) and ((kod_sch_ao=null)or(kod_sch_ao=0))) then
    begin
        mes := Un_R_file_Alex.J4_KOD_SCH_AO_EMPTY;
        flag := true;
    end;


    //проверка на корректность данных
    if cxEditNumber2.Text ='' then
    begin
        mes := Un_R_file_Alex.J4_ADD_WARNING_NUMBER;
        cxEditNumber2.SetFocus;
        flag := true;
        cxEditNumber2.style.Color := clred;
    end else
        cxEditNumber2.style.Color := $00FFFBF0;

   if cxDateEditFrom.Date>cxDateEditTo.Date then
    begin
        if not flag then
        begin
            mes := Un_R_file_Alex.J4_ADD_WARNING_DATE;
            cxDateEditFrom.SetFocus;
        end;
        FLAG := TRUE;
    end ;

    if cxMRUEditFio.Text = '' then
    begin
        if not flag then
        begin
            mes := Un_R_file_Alex.J4_ADD_WARNING_FIO;
            cxMRUEditFio.SetFocus;
        end;
        cxMRUEditFio.style.Color := clred;
        FLAG := TRUE;
    end ELSE
        cxMRUEditFio.style.Color := $00FFFBF0;

    if cxTextEditSumma.Text = '' then
    begin
        if not flag then
        begin
            MES := Un_R_file_Alex.J4_ADD_WARNING_SUMMA;
            cxTextEditSumma.SetFocus;
        end;
        cxTextEditSumma.style.Color := clred;
        FLAG := TRUE;
    end else
        cxTextEditSumma.style.Color := $00FFFBF0;

    if cxMemoNote.Text = '' then
    begin
        if not flag then
        begin
            MES := Un_R_file_Alex.J4_ADD_WARNING_NOTE;
            cxMemoNote.SetFocus;
        end;
        cxMemoNote.style.Color := clred;
        FLAG := TRUE;
    end else
        cxMemoNote.style.Color := $00FFFBF0;
    if (myform.add_new_alg = 1) and (myform.date_new_alg<=cxDateEditAo.Date) then
    begin
        if not RxMemoryDataSaveProv.isEmpty then
        begin
            RxMemoryDataSaveProv.First;
            while not RxMemoryDataSaveProv.Eof do
            begin
                if (RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveId_Dog').Value <= 0) and
                   (RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveId_Dog').Value = 1) then
                begin
                    if not flag then
                    begin
                        MES := Un_R_file_Alex.MY_ERROR_SAVE_DOG;
                    end;
                    FLAG := TRUE;
                end;
                if (RxMemoryDataSaveProv.FieldByName('RxMemDatkod_dog').Value <= 0) and
                   (RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldMain').Value = 1) then
                begin
                    if not flag then
                    begin
                        MES := Un_R_file_Alex.MY_ERROR_SAVE_DOG;
                        cxGrid1.SetFocus;
                    end;
                    FLAG := TRUE;
                end;
                RxMemoryDataSaveProv.next;
            end;
        end;
    end;

//    проверка на суммы
    if not RxMemoryDataSaveProv.isEmpty then
    begin
        RxMemoryDataSaveProv.First;
        s1 := 0;
        s2 := StrToCurr(cxTextEditSumma.Text);
        s3 := 0.01;
        while not RxMemoryDataSaveProv.Eof do
        begin
            if RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldMain').Value = 1 then
                s1 := s1 + RxMemoryDataSaveProv.FieldByName('RxMemDat_summa').AsCurrency;
            RxMemoryDataSaveProv.next;
        end;
        s4 := Roundto(abs(s1 - s2),-2);
        if (s4>=s3){ and (myform.predv_prov = 1) }then
        begin
            if not flag then
            begin
                MES := Un_R_file_Alex.J4_ADD_WARNING_PROV;
                cxTextEditSumma.SetFocus;
            end;
            cxTextEditSumma.style.Color := clred;
            FLAG := TRUE;
        end else
            cxTextEditSumma.style.Color := $00FFFBF0;
    end;

    if not RxMemoryDataRas.IsEmpty then
    begin
        RxMemoryDataRas.First;
        s1 := 0;
        s2 := StrToCurr(cxTextEditSumma.Text);
        s3 := 0.01;
        
        while not RxMemoryDataRas.Eof do
        begin
            s1 := s1 + RxMemoryDataRas.FieldByName('RxMemoryDataSumma').AsCurrency;
            RxMemoryDataRas.Next;
        end;
        s4 := Roundto(abs(s1 - s2),-2);
        if (s4 >= s3){ and (myform.predv_prov = 1) }then
        begin
            if not flag then
            begin
                MES := Un_R_file_Alex.J4_ADD_WARNING_PROV;
                cxTextEditSumma.SetFocus;
            end;
            cxTextEditSumma.style.Color := clred;
            PageControl1.ActivePage := TabSheet2;
            FLAG := TRUE;
        end else
            cxTextEditSumma.style.Color := $00FFFBF0;
    end;

    if flag then
    begin
        showmessage(mes);
        exit;
    end;

    if ((name_type_doc = 'СПРАВКА') and (cxTextEditSumma.Text <> '0')) then
    begin
        showmessage('Сума справки повинна дорівнювати нулю!');
        cxTextEditSumma.SetFocus;
        exit;
    end;

    while length(cxEditNumber2.Text) < 5 do
    begin
        cxEditNumber2.Text := '0' + cxEditNumber2.Text;
    end;

        id_session := myform.DatabaseMain.Gen_Id('KERNEL_GEN_ID_SESSION', 1);
        DataSetError.Transaction    := Class_Transaction_Wr;

//добавление
    if my_m = AddAvance then
    begin
        Class_StoredProc.Database    := myform.DatabaseMain;
        Query.Database               := myform.DatabaseMain;
        DataSetError.Database        := myform.DatabaseMain;
        Class_StoredProc.Transaction := Class_Transaction_Wr;
        Query.Transaction            := Class_Transaction_Wr;
        Class_DataSet.Database       := myform.DatabaseMain;
        Class_DataSet.Transaction    := Class_Transaction_Wr;
        Class_Transaction_Wr.StartTransaction;
        try
//            DecimalSeparator := '.';

            // ДОБАВЛЕНИЕ ДОКУМЕНТА
             Class_DataSet.Close;
            //если бухгалтер выбирал тип документа
            if (is_select_type_doc = 1)then
            begin
              Class_DataSet.SQLs.SelectSQL.Text:='select * from J4_INSERT_ALL_DOC('+IntToStr(myform.prihod)+', '''+cxMRUEditFio.Text+''', '''+cxMemoNote.Text+''', ''' + StringReplace(cxTextEditSumma.Text,',','.',[]) + ''', '+intToStr(myclass.id_user)+', '+IntTostr(id_session)+', '''+cxDateEditAo.Text+''', '''+cxEditNumber1.Text+cxEditNumber2.text+''', '+IntToStr(id_type_doc)+', ' + IntToStr(id_ao) + ', '''+GetComputerNetName+''', '+IntTostr(id_rate)+', '+IntTostr(id_rate_n)+', '+IntTostr(id_customer)+', '+IntToStr(0)+', '+inttostr(0)+')';
            end
            else //если бухгалтер НЕ выбирал тип документа
            begin
              if myform.prihod = 1 then
                Class_DataSet.SQLs.SelectSQL.Text:='select * from J4_INSERT_ALL_DOC('+IntToStr(myform.prihod)+', '''+cxMRUEditFio.Text+''', '''+cxMemoNote.Text+''', ''' + StringReplace(cxTextEditSumma.Text,',','.',[]) + ''', '+intToStr(myclass.id_user)+', '+IntTostr(id_session)+', '''+cxDateEditAo.Text+''', '''+cxEditNumber1.Text+cxEditNumber2.text+''', '+IntToStr(40004)+', ' + IntToStr(id_ao) + ', '''+GetComputerNetName+''', '+IntTostr(id_rate)+', '+IntTostr(id_rate_n)+', '+IntTostr(id_customer)+', '+IntToStr(0)+', '+inttostr(0)+')'
              else
                Class_DataSet.SQLs.SelectSQL.Text:='select * from J4_INSERT_ALL_DOC('+IntToStr(myform.prihod)+', '''+cxMRUEditFio.Text+''', '''+cxMemoNote.Text+''', ''' + StringReplace(cxTextEditSumma.Text,',','.',[]) + ''', '+intToStr(myclass.id_user)+', '+IntTostr(id_session)+', '''+cxDateEditAo.Text+''', '''+cxEditNumber1.Text+cxEditNumber2.text+''', '+IntToStr(4)+', ' + IntToStr(id_ao) + ', '''+GetComputerNetName+''', '+IntTostr(id_rate)+', '+IntTostr(id_rate_n)+', '+IntTostr(id_customer)+', '+IntToStr(0)+', '+inttostr(0)+')';
            end;

            Class_DataSet.Open;
            id_all_doc := TFIBBCDField(Class_DataSet.FieldByName('R_ID')).AsInt64;
            Class_DataSet.Close;

                //добавление проводок

                RxMemoryDataSaveProv.First;
                while not RxMemoryDataSaveProv.Eof do
                begin
                    Class_StoredProc.StoredProcName:='J4_INSERT_ALL_PROV';
                    Class_StoredProc.Prepare;
//                        Class_StoredProc.ParamByName('D_ID_DT_DOC').AsInt64    := id_ao;
                    Class_StoredProc.ParamByName('D_KEY_SESSION').AsInt64  := id_session;
                    Class_StoredProc.ParamByName('D_SUMMA_DOC').AsDouble   := RxMemoryDataSaveProv.FieldByName('RxMemDat_summa').Value;
                    Class_StoredProc.ParamByName('D_ID_SM').AsInt64        := RxMemoryDataSaveProv.FieldByName('RxMemDatid_sm').Value;
                    Class_StoredProc.ParamByName('D_ID_RAZD').AsInt64      := RxMemoryDataSaveProv.FieldByName('RxMemDatid_razd').Value;
                    Class_StoredProc.ParamByName('D_ID_ST').AsInt64        := RxMemoryDataSaveProv.FieldByName('RxMemDatid_st').Value;
                    Class_StoredProc.ParamByName('D_ID_KEKV').AsInt64      := RxMemoryDataSaveProv.FieldByName('RxMemDatid_kekv').Value;
                    Class_StoredProc.ParamByName('D_ID_DOG').AsInt64       := RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveId_Dog').Value;
                    Class_StoredProc.ParamByName('D_ID_MAN').AsInt64       := id_people;// RxMemoryDataSaveProv.FieldByName('RxMemDatid_man').Value;
                    Class_StoredProc.ParamByName('D_ID_SCH').AsInt64       := RxMemoryDataSaveProv.FieldByName('RxMemDatID_SCH_KORESPOND').Value;
//                Class_StoredProc.ParamByName('D_SUMMA_VALUE').AsDouble := RxMemoryDataSaveProv.FieldByName('RxMemDatsumma_value').Value;
//                Class_StoredProc.ParamByName('D_ID_VALUE').AsInt64     := RxMemoryDataSaveProv.FieldByName('RxMemDatid_value').Value;
                    Class_StoredProc.ParamByName('D_KOD_DOG').AsInt64      := RxMemoryDataSaveProv.FieldByName('RxMemDatkod_dog').Value;
                    Class_StoredProc.ParamByName('D_ID_USER').AsInt64      := myclass.id_user;
                    Class_StoredProc.ParamByName('D_ID_ALL_DOC').AsInt64   := id_all_doc;
                    Class_StoredProc.ParamByName('D_ID_KASSA_SCH').AsInt64 := RxMemoryDataSaveProv.FieldByName('RxMemDatid_sch').Value;
                    Class_StoredProc.ParamByName('D_ID_PROV').AsInt64      := RxMemoryDataSaveProv.FieldByName('RxMemDatid_all_prov').Value;
                    Class_StoredProc.ParamByName('D_TODAY').AsDate         := cxDateEditAo.Date;
                    Class_StoredProc.ParamByName('D_PRIHOD').AsInteger     := myform.prihod;
                    Class_StoredProc.ParamByName('IS_M').AsInteger         := RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldMain').Value;
                    Class_StoredProc.ExecProc;
                    RxMemoryDataSaveProv.Next;
                end;

            Class_Transaction_Wr.Commit;

            Class_StoredProc.Database    := myform.DatabaseMain;
            DataSetError.Database        := myform.DatabaseMain;
            Class_StoredProc.Transaction := Class_Transaction_Wr;
            Class_DataSet.Database       := myform.DatabaseMain;
            Class_DataSet.Transaction    := Class_Transaction_Wr;
            Class_Transaction_Wr.StartTransaction;

            // добавление шапки

            Class_DataSet.Close;
            if (cxCheckBoxKom.Checked) then
                Class_DataSet.SQLs.SelectSQL.Text := 'select * from J4_DT_AO_ADD('+IntToStr(id_people)+', ''' + cxEditNumber2.Text+''', ''' + cxDateEditAo.Text + ''', ''' + StringReplace(cxTextEditSumma.Text,',','.',[]) + ''', '''+cxMemoNote.Text+''', '+IntToStr(myform.prihod)+', ' + IntToStr(id_all_doc) +', ' + IntToStr(myform.id_system) + ', '+intToStr(myclass.id_user) + ', 1, ''' + cxDateEditFrom.text + ''', ''' + cxDateEditTo.text+ ''', ' +inttostr(kod_sch_ao)+ ')'
            else
                Class_DataSet.SQLs.SelectSQL.Text := 'select * from J4_DT_AO_ADD('+IntToStr(id_people)+', ''' + cxEditNumber2.Text+''', ''' + cxDateEditAo.Text + ''', ''' + StringReplace(cxTextEditSumma.Text,',','.',[]) + ''', '''+cxMemoNote.Text+''', '+IntToStr(myform.prihod)+', ' + IntToStr(id_all_doc) +', ' + IntToStr(myform.id_system) + ', '+intToStr(myclass.id_user) + ', null, null, null, ' +inttostr(kod_sch_ao)+ ')';
            Class_DataSet.Open;
            id_ao := StrToInt64(Class_DataSet.FieldByName('R_ID').AsString);
            flag_exist_num := Class_DataSet.FieldByName('EXIST_NUM').AsInteger;
            Class_DataSet.Close;

            if(flag_exist_num=1) then
            begin
                showmessage(Un_R_file_Alex.J4_EXIST_NUM_AO);
                exit;
            end;

            //добавление расшифровок

            if ras = 1 then
            begin
                if not RxMemoryDataRas.IsEmpty then
                begin
                    RxMemoryDataRas.First;
                    while not RxMemoryDataRas.Eof do
                    begin
                        Class_StoredProc.StoredProcName:='J4_DT_AO_RASPREDELENIE_ADD';
                        Class_StoredProc.Prepare;
                        Class_StoredProc.ParamByName('D_N_PP').AsInteger    := RxMemoryDataRas.FieldByName('RxMemoryDataNumber').AsInteger;
                        Class_StoredProc.ParamByName('D_SUMMA').AsDouble    := RxMemoryDataRas.FieldByName('RxMemoryDataSumma').AsFloat;
                        Class_StoredProc.ParamByName('D_ID_RASP').AsInt64   := RxMemoryDataRas.FieldByName('RxMemoryDataId').AsVariant;
                        Class_StoredProc.ParamByName('D_ID_AO').AsInt64     := id_ao;
                        Class_StoredProc.ParamByName('D_ID_PROV').AsInt64   := RxMemoryDataRas.FieldByName('id_prov').Value;
                        Class_StoredProc.ExecProc;
                        RxMemoryDataRas.Next;
                    end;
                end;
            end;
                    if (myform.id_oper = 2) then
                    begin
                        if(myform.prihod=0) then
                        begin
                            Query.Close;
                            Query.SQL.Text := 'update UW_DT_PROV_VEDOMOST2 set ID_J4_DT='+IntToStr(id_ao)+', ID_ALL_PROV ='+IntToStr(id_all_doc) + ' where ID_DT_PROV_VEDOMOST2 = '+IntToStr(myform.id_prov_vedom);
                            Query.ExecQuery;
                        end else
                        begin
                            Query.Close;
                            Query.SQL.Text := 'update UW_DT_PROV_VEDOMOST2 set ID_J4_DT_D='+IntToStr(id_ao)+', ID_ALL_PROV_D ='+IntToStr(id_all_doc) + ' where ID_DT_PROV_VEDOMOST2 = '+IntToStr(myform.id_prov_vedom);
                            Query.ExecQuery;
                        end
                    end;

                    STRU.DBHANDLE      := myform.DatabaseMain.Handle;
                    STRU.TRHANDLE      := Class_Transaction_Wr.Handle;
                    STRU.KERNEL_ACTION := 1;
                    STRU.KEY_SESSION   := id_session;
                    STRU.WORKDATE      := cxDateEditAo.Date;
                    STRU.ID_USER       := myclass.id_user;
                    try
                        DoResult := Kernel.KernelDo(@STRU);
                    except on E:Exception do
                        begin
                            ShowMessage(Un_R_file_Alex.MY_ERROR_KERNELL+E.Message);
                            DecimalSeparator := ',';
                            if delete_buff = 1 then
                            begin
                                DelBuffer(id_session);
                            end;
                            Class_Transaction_Wr.Rollback;
                        end;
                    end;
                    if DoResult then
                    begin
                        DecimalSeparator := ',';
                        if delete_buff = 1 then
                        begin
                            DelBuffer(id_session);
                        end;
                        Class_Transaction_Wr.Commit;
                        myform.ActionRefreshExecute(sender);
                        Myform.DataSetMain.Locate('ID_AO', id_ao, []);
                        close;
                    end
                    else begin
                        PageControl1.ActivePage := TabSheet1;
                        PageControl2.ActivePage := TabSheet5;
                        cxSplitter1.OpenSplitter;
                        cxMemo2.Lines.Clear;
                        cxMemo2.Lines.Insert(0, Un_R_file_Alex.MY_DOC_ERROR_KERNELL);
                        ErrorList:=Kernel.GetDocErrorsList(@STRU);
                        if ErrorList<>nil then for i:=0 to  ErrorList.Count-1 do cxMemo2.Lines.Insert(0, Un_R_file_Alex.MY_MESSAGE_ERROR +' '+ErrorList.Strings[i]);

                        DataSetError.Close;
                        DataSetError.SelectSQL.Text :='SELECT * FROM KASSA_SELECT_ERROR_PROVS('+IntToStr(STRU.KEY_SESSION)+')';
                        DataSetError.Open;
                        DataSetError.First;
                        RxError.EmptyTable;
                        while not DataSetError.Eof do
                        begin
                            RxError.Open;
                            RxError.Insert;
                            RxError.FieldByName('Rxkod').Value  := DataSetError['ID_ERROR'];
                            RxError.FieldByName('RxName').Value := DataSetError['ERROR_MESSAGE'];
                            RxError.Post;
                            DataSetError.Next;
                        end;
                        DecimalSeparator := ',';
                        //Class_Transaction_Wr.Commit;
                        if delete_buff = 1 then
                        begin
                            DelBuffer(id_session);
                        end;
                        Class_Transaction_Wr.Rollback;
                        exit;
                    end;
        except on E:Exception do begin
            DecimalSeparator := ',';
            if delete_buff = 1 then
            begin
                DelBuffer(id_session);
            end;
            Class_Transaction_Wr.Rollback;
            ShowMessage(E.Message);
            exit;
        end
        end;
    end;
  //klonirovanie
  if my_m = ClonAvance then
    begin
        Class_StoredProc.Database    := myform.DatabaseMain;
        Query.Database               := myform.DatabaseMain;
        DataSetError.Database        := myform.DatabaseMain;
        Class_StoredProc.Transaction := Class_Transaction_Wr;
        Query.Transaction            := Class_Transaction_Wr;
        Class_DataSet.Database       := myform.DatabaseMain;
        Class_DataSet.Transaction    := Class_Transaction_Wr;
        Class_Transaction_Wr.StartTransaction;
        try
//            DecimalSeparator := '.';

            // ДОБАВЛЕНИЕ ДОКУМЕНТА
                Class_DataSet.Close;


            //если бухгалтер выбирал тип документа
            if (is_select_type_doc = 1)then
            begin
              Class_DataSet.SQLs.SelectSQL.Text:='select * from J4_INSERT_ALL_DOC('+IntToStr(myform.prihod)+', '''+cxMRUEditFio.Text+''', '''+cxMemoNote.Text+''', ''' + StringReplace(cxTextEditSumma.Text,',','.',[]) + ''', '+intToStr(myclass.id_user)+', '+IntTostr(id_session)+', '''+cxDateEditAo.Text+''', '''+cxEditNumber1.Text+cxEditNumber2.text+''', '+IntToStr(id_type_doc)+', ' + IntToStr(id_ao) + ', '''+GetComputerNetName+''', '+IntTostr(id_rate)+', '+IntTostr(id_rate_n)+', '+IntTostr(id_customer)+', '+IntToStr(0)+', '+inttostr(0)+')';
            end
            else //если бухгалтер НЕ выбирал тип документа
            begin
              if myform.prihod = 1
                then Class_DataSet.SQLs.SelectSQL.Text:='select * from J4_INSERT_ALL_DOC('+IntToStr(myform.prihod)+', '''+cxMRUEditFio.Text+''', '''+cxMemoNote.Text+''', ''' + StringReplace(cxTextEditSumma.Text,',','.',[]) + ''', '+intToStr(myclass.id_user)+', '+IntTostr(id_session)+', '''+cxDateEditAo.Text+''', '''+cxEditNumber1.Text+cxEditNumber2.text+''', '+IntToStr(40004)+', ' + IntToStr(id_ao) + ', '''+GetComputerNetName+''', '+IntTostr(id_rate)+', '+IntTostr(id_rate_n)+', '+IntTostr(id_customer)+', '+IntToStr(0)+', '+inttostr(0)+')'
                else Class_DataSet.SQLs.SelectSQL.Text:='select * from J4_INSERT_ALL_DOC('+IntToStr(myform.prihod)+', '''+cxMRUEditFio.Text+''', '''+cxMemoNote.Text+''', ''' + StringReplace(cxTextEditSumma.Text,',','.',[]) + ''', '+intToStr(myclass.id_user)+', '+IntTostr(id_session)+', '''+cxDateEditAo.Text+''', '''+cxEditNumber1.Text+cxEditNumber2.text+''', '+IntToStr(4)+', ' + IntToStr(id_ao) + ', '''+GetComputerNetName+''', '+IntTostr(id_rate)+', '+IntTostr(id_rate_n)+', '+IntTostr(id_customer)+', '+IntToStr(0)+', '+inttostr(0)+')';
            end;

            {//так было раньше
            if myform.prihod = 1
                then Class_DataSet.SQLs.SelectSQL.Text:='select * from J4_INSERT_ALL_DOC('+IntToStr(myform.prihod)+', '''+cxMRUEditFio.Text+''', '''+cxMemoNote.Text+''', ''' + StringReplace(cxTextEditSumma.Text,',','.',[]) + ''', '+intToStr(myclass.id_user)+', '+IntTostr(id_session)+', '''+cxDateEditAo.Text+''', '''+cxEditNumber1.Text+cxEditNumber2.text+''', '+IntToStr(40004)+', ' + IntToStr(id_ao) + ', '''+GetComputerNetName+''', '+IntTostr(id_rate)+', '+IntTostr(id_rate_n)+', '+IntTostr(id_customer)+', '+IntToStr(0)+', '+inttostr(0)+')'
                else Class_DataSet.SQLs.SelectSQL.Text:='select * from J4_INSERT_ALL_DOC('+IntToStr(myform.prihod)+', '''+cxMRUEditFio.Text+''', '''+cxMemoNote.Text+''', ''' + StringReplace(cxTextEditSumma.Text,',','.',[]) + ''', '+intToStr(myclass.id_user)+', '+IntTostr(id_session)+', '''+cxDateEditAo.Text+''', '''+cxEditNumber1.Text+cxEditNumber2.text+''', '+IntToStr(4)+', ' + IntToStr(id_ao) + ', '''+GetComputerNetName+''', '+IntTostr(id_rate)+', '+IntTostr(id_rate_n)+', '+IntTostr(id_customer)+', '+IntToStr(0)+', '+inttostr(0)+')';  }

                Class_DataSet.Open;
                id_all_doc := TFIBBCDField(Class_DataSet.FieldByName('R_ID')).AsInt64;
                Class_DataSet.Close;

                //добавление проводок

                RxMemoryDataSaveProv.First;
                while not RxMemoryDataSaveProv.Eof do
                begin
                    Class_StoredProc.StoredProcName:='J4_INSERT_ALL_PROV';
                    Class_StoredProc.Prepare;
//                        Class_StoredProc.ParamByName('D_ID_DT_DOC').AsInt64    := id_ao;
                    Class_StoredProc.ParamByName('D_KEY_SESSION').AsInt64  := id_session;
                    Class_StoredProc.ParamByName('D_SUMMA_DOC').AsDouble   := RxMemoryDataSaveProv.FieldByName('RxMemDat_summa').Value;
                    Class_StoredProc.ParamByName('D_ID_SM').AsInt64        := RxMemoryDataSaveProv.FieldByName('RxMemDatid_sm').Value;
                    Class_StoredProc.ParamByName('D_ID_RAZD').AsInt64      := RxMemoryDataSaveProv.FieldByName('RxMemDatid_razd').Value;
                    Class_StoredProc.ParamByName('D_ID_ST').AsInt64        := RxMemoryDataSaveProv.FieldByName('RxMemDatid_st').Value;
                    Class_StoredProc.ParamByName('D_ID_KEKV').AsInt64      := RxMemoryDataSaveProv.FieldByName('RxMemDatid_kekv').Value;
                    Class_StoredProc.ParamByName('D_ID_DOG').AsInt64       := RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveId_Dog').Value;
                    Class_StoredProc.ParamByName('D_ID_MAN').AsInt64       := id_people;// RxMemoryDataSaveProv.FieldByName('RxMemDatid_man').Value;
                    Class_StoredProc.ParamByName('D_ID_SCH').AsInt64       := RxMemoryDataSaveProv.FieldByName('RxMemDatID_SCH_KORESPOND').Value;
//                Class_StoredProc.ParamByName('D_SUMMA_VALUE').AsDouble := RxMemoryDataSaveProv.FieldByName('RxMemDatsumma_value').Value;
//                Class_StoredProc.ParamByName('D_ID_VALUE').AsInt64     := RxMemoryDataSaveProv.FieldByName('RxMemDatid_value').Value;
                    Class_StoredProc.ParamByName('D_KOD_DOG').AsInt64      := RxMemoryDataSaveProv.FieldByName('RxMemDatkod_dog').Value;
                    Class_StoredProc.ParamByName('D_ID_USER').AsInt64      := myclass.id_user;
                    Class_StoredProc.ParamByName('D_ID_ALL_DOC').AsInt64   := id_all_doc;
                    Class_StoredProc.ParamByName('D_ID_KASSA_SCH').AsInt64 := RxMemoryDataSaveProv.FieldByName('RxMemDatid_sch').Value;
                    Class_StoredProc.ParamByName('D_ID_PROV').AsInt64      := RxMemoryDataSaveProv.FieldByName('RxMemDatid_all_prov').Value;
                    Class_StoredProc.ParamByName('D_TODAY').AsDate         := cxDateEditAo.Date;
                    Class_StoredProc.ParamByName('D_PRIHOD').AsInteger     := myform.prihod;
                    Class_StoredProc.ParamByName('IS_M').AsInteger         := RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldMain').Value;
                    Class_StoredProc.ExecProc;
                    RxMemoryDataSaveProv.Next;
                end;

            Class_Transaction_Wr.Commit;

            Class_StoredProc.Database    := myform.DatabaseMain;
            DataSetError.Database        := myform.DatabaseMain;
            Class_StoredProc.Transaction := Class_Transaction_Wr;
            Class_DataSet.Database       := myform.DatabaseMain;
            Class_DataSet.Transaction    := Class_Transaction_Wr;
            Class_Transaction_Wr.StartTransaction;

            // добавление шапки

            Class_DataSet.Close;
            if (cxCheckBoxKom.Checked) then
                Class_DataSet.SQLs.SelectSQL.Text := 'select * from J4_DT_AO_ADD('+IntToStr(id_people)+', ''' + cxEditNumber2.Text+''', ''' + cxDateEditAo.Text + ''', ''' + StringReplace(cxTextEditSumma.Text,',','.',[]) + ''', '''+cxMemoNote.Text+''', '+IntToStr(myform.prihod)+', ' + IntToStr(id_all_doc) +', ' + IntToStr(myform.id_system) + ', '+intToStr(myclass.id_user) + ', 1, ''' + cxDateEditFrom.text + ''', ''' + cxDateEditTo.text + ''', ' +inttostr(kod_sch_ao)+ ')'
            else
                Class_DataSet.SQLs.SelectSQL.Text := 'select * from J4_DT_AO_ADD('+IntToStr(id_people)+', ''' + cxEditNumber2.Text+''', ''' + cxDateEditAo.Text + ''', ''' + StringReplace(cxTextEditSumma.Text,',','.',[]) + ''', '''+cxMemoNote.Text+''', '+IntToStr(myform.prihod)+', ' + IntToStr(id_all_doc) +', ' + IntToStr(myform.id_system) + ', '+intToStr(myclass.id_user) + ', null, null, null, ' +inttostr(kod_sch_ao)+ ')';
            Class_DataSet.Open;
            id_ao := StrToInt64(Class_DataSet.FieldByName('R_ID').AsString);
            flag_exist_num := Class_DataSet.FieldByName('EXIST_NUM').AsInteger;
            Class_DataSet.Close;
            if(flag_exist_num=1) then
            begin
                showmessage(Un_R_file_Alex.J4_EXIST_NUM_AO);
                exit;
            end;
            //добавление расшифровок

            if ras = 1 then
            begin
                if not RxMemoryDataRas.IsEmpty then
                begin
                    RxMemoryDataRas.First;
                    while not RxMemoryDataRas.Eof do
                    begin
                        Class_StoredProc.StoredProcName:='J4_DT_AO_RASPREDELENIE_ADD';
                        Class_StoredProc.Prepare;
                        Class_StoredProc.ParamByName('D_N_PP').AsInteger    := RxMemoryDataRas.FieldByName('RxMemoryDataNumber').AsInteger;
                        Class_StoredProc.ParamByName('D_SUMMA').AsDouble    := RxMemoryDataRas.FieldByName('RxMemoryDataSumma').AsFloat;
                        Class_StoredProc.ParamByName('D_ID_RASP').AsInt64   := RxMemoryDataRas.FieldByName('RxMemoryDataId').AsVariant;
                        Class_StoredProc.ParamByName('D_ID_AO').AsInt64     := id_ao;
                        Class_StoredProc.ParamByName('D_ID_PROV').AsInt64   := RxMemoryDataRas.FieldByName('id_prov').Value;
                        Class_StoredProc.ExecProc;
                        RxMemoryDataRas.Next;
                    end;
                end;
            end;
                    if (myform.id_oper = 2) then
                    begin
                        Query.Close;
                        Query.SQL.Text := 'update UW_DT_PROV_VEDOMOST2 set ID_J4_DT='+IntToStr(id_ao)+', ID_ALL_PROV ='+IntToStr(id_all_doc) + ' where ID_DT_PROV_VEDOMOST2 = '+IntToStr(myform.id_prov_vedom);
                        Query.ExecQuery;
                    end;

                    STRU.DBHANDLE      := myform.DatabaseMain.Handle;
                    STRU.TRHANDLE      := Class_Transaction_Wr.Handle;
                    STRU.KERNEL_ACTION := 1;
                    STRU.KEY_SESSION   := id_session;
                    STRU.WORKDATE      := cxDateEditAo.Date;
                    STRU.ID_USER       := myclass.id_user;
                    try
                        DoResult := Kernel.KernelDo(@STRU);
                    except on E:Exception do
                        begin
                            ShowMessage(Un_R_file_Alex.MY_ERROR_KERNELL+E.Message);
                            DecimalSeparator := ',';
                            if delete_buff = 1 then
                            begin
                                DelBuffer(id_session);
                            end;
                            Class_Transaction_Wr.Rollback;
                        end;
                    end;
                    if DoResult then
                    begin
                        DecimalSeparator := ',';
                        if delete_buff = 1 then
                        begin
                            DelBuffer(id_session);
                        end;
                        Class_Transaction_Wr.Commit;
                        myform.ActionRefreshExecute(sender);
                        Myform.DataSetMain.Locate('ID_AO', id_ao, []);
                        close;
                    end
                    else begin
                        PageControl1.ActivePage := TabSheet1;
                        PageControl2.ActivePage := TabSheet5;
                        cxSplitter1.OpenSplitter;
                        cxMemo2.Lines.Clear;
                        cxMemo2.Lines.Insert(0, Un_R_file_Alex.MY_DOC_ERROR_KERNELL);
                        ErrorList:=Kernel.GetDocErrorsList(@STRU);
                        if ErrorList<>nil then for i:=0 to  ErrorList.Count-1 do cxMemo2.Lines.Insert(0, Un_R_file_Alex.MY_MESSAGE_ERROR +' '+ErrorList.Strings[i]);

                        DataSetError.Close;
                        DataSetError.SelectSQL.Text :='SELECT * FROM KASSA_SELECT_ERROR_PROVS('+IntToStr(STRU.KEY_SESSION)+')';
                        DataSetError.Open;
                        DataSetError.First;
                        RxError.EmptyTable;
                        while not DataSetError.Eof do
                        begin
                            RxError.Open;
                            RxError.Insert;
                            RxError.FieldByName('Rxkod').Value  := DataSetError['ID_ERROR'];
                            RxError.FieldByName('RxName').Value := DataSetError['ERROR_MESSAGE'];
                            RxError.Post;
                            DataSetError.Next;
                        end;
                        DecimalSeparator := ',';
                        //Class_Transaction_Wr.Commit;
                        if delete_buff = 1 then
                        begin
                            DelBuffer(id_session);
                        end;
                        Class_Transaction_Wr.Rollback;
                        exit;
                    end;
        except on E:Exception do begin
            DecimalSeparator := ',';
            if delete_buff = 1 then
            begin
                DelBuffer(id_session);
            end;
            Class_Transaction_Wr.Rollback;
            ShowMessage(E.Message);
            exit;
        end
        end;
    end;
//изменение
    if my_m = ChangeAvance then
    begin
        if Check_date then exit;
        id_ao := StrToInt64(myform.DataSetMain.FieldByName('ID_AO').AsString);

        Class_StoredProc.Database    := myform.DatabaseMain;
        Class_StoredProc.Transaction := Class_Transaction_Wr;
        Class_DataSet.Database       := myform.DatabaseMain;
        Class_DataSet.Transaction    := Class_Transaction_Wr;
        Class_Transaction_Wr.StartTransaction;

        id_all     := StrToInt64(myform.DataSetMain.FieldByname('R_ID_DT_DOC').AsSTRing);

        Class_DataSet.Close;

        //если бухгалтер выбирал тип документа
        if (is_select_type_doc = 1)then
          begin
            Class_DataSet.SQLs.SelectSQL.Text:='select * from J4_INSERT_ALL_DOC('+IntToStr(myform.prihod)+', '''+cxMRUEditFio.Text+''', '''+cxMemoNote.Text+''', ''' + StringReplace(cxTextEditSumma.Text,',','.',[]) + ''', '+intToStr(myclass.id_user)+', '+IntTostr(id_session)+', '''+cxDateEditAo.Text+''', '''+cxEditNumber1.Text+cxEditNumber2.text+''', '+IntToStr(id_type_doc)+', ' + IntToStr(id_ao_change) + ', '''+GetComputerNetName+''', '+IntTostr(1)+', '+IntTostr(id_all)+', '+IntTostr(id_rate)+', '+IntToStr(id_rate_n)+', '+inttostr(id_customer)+')';
          end
        else //если бухгалтер НЕ выбирал тип документа
          begin
            if myform.prihod = 1
            then Class_DataSet.SQLs.SelectSQL.Text:='select * from J4_INSERT_ALL_DOC('+IntToStr(myform.prihod)+', '''+cxMRUEditFio.Text+''', '''+cxMemoNote.Text+''', ''' + StringReplace(cxTextEditSumma.Text,',','.',[]) + ''', '+intToStr(myclass.id_user)+', '+IntTostr(id_session)+', '''+cxDateEditAo.Text+''', '''+cxEditNumber1.Text+cxEditNumber2.text+''', '+IntToStr(40004)+', ' + IntToStr(id_ao_change) + ', '''+GetComputerNetName+''', '+IntToStr(1)+', '+inttostr(id_all)+', '+IntTostr(id_rate)+', '+IntTostr(id_rate_n)+', '+IntTostr(id_customer){+', '+IntToStr(1)+', '+inttostr(id_all)}+')'
            else Class_DataSet.SQLs.SelectSQL.Text:='select * from J4_INSERT_ALL_DOC('+IntToStr(myform.prihod)+', '''+cxMRUEditFio.Text+''', '''+cxMemoNote.Text+''', ''' + StringReplace(cxTextEditSumma.Text,',','.',[]) + ''', '+intToStr(myclass.id_user)+', '+IntTostr(id_session)+', '''+cxDateEditAo.Text+''', '''+cxEditNumber1.Text+cxEditNumber2.text+''', '+IntToStr(4)+', ' + IntToStr(id_ao_change) + ', '''+GetComputerNetName+''', '+IntToStr(1)+', '+inttostr(id_all)+', '+IntTostr(id_rate)+', '+IntTostr(id_rate_n)+', '+IntTostr(id_customer){+', '+IntToStr(1)+', '+inttostr(id_all)}+')';
          end;

        //так было раньше
        //if myform.prihod = 1
        //then Class_DataSet.SQLs.SelectSQL.Text:='select * from J4_INSERT_ALL_DOC('+IntToStr(myform.prihod)+', '''+cxMRUEditFio.Text+''', '''+cxMemoNote.Text+''', ''' + StringReplace(cxTextEditSumma.Text,',','.',[]) + ''', '+intToStr(myclass.id_user)+', '+IntTostr(id_session)+', '''+cxDateEditAo.Text+''', '''+cxEditNumber1.Text+cxEditNumber2.text+''', '+IntToStr(40004)+', ' + IntToStr(id_ao_change) + ', '''+GetComputerNetName+''', '+IntToStr(1)+', '+inttostr(id_all)+', '+IntTostr(id_rate)+', '+IntTostr(id_rate_n)+', '+IntTostr(id_customer){+', '+IntToStr(1)+', '+inttostr(id_all)}+')'
        //else Class_DataSet.SQLs.SelectSQL.Text:='select * from J4_INSERT_ALL_DOC('+IntToStr(myform.prihod)+', '''+cxMRUEditFio.Text+''', '''+cxMemoNote.Text+''', ''' + StringReplace(cxTextEditSumma.Text,',','.',[]) + ''', '+intToStr(myclass.id_user)+', '+IntTostr(id_session)+', '''+cxDateEditAo.Text+''', '''+cxEditNumber1.Text+cxEditNumber2.text+''', '+IntToStr(4)+', ' + IntToStr(id_ao_change) + ', '''+GetComputerNetName+''', '+IntToStr(1)+', '+inttostr(id_all)+', '+IntTostr(id_rate)+', '+IntTostr(id_rate_n)+', '+IntTostr(id_customer){+', '+IntToStr(1)+', '+inttostr(id_all)}+')';

        Class_DataSet.Open;
        Class_DataSet.Close;
        DefineKodSchAo(RxMemoryDataSaveProv.FieldByName('RxMemDatid_sch').Value);
        RxMemoryDataSaveProv.First;
        for i:=1 to RxMemoryDataSaveProv.RecordCount do
        begin
            Class_StoredProc.StoredProcName:='J4_INSERT_ALL_PROV';
            Class_StoredProc.Prepare;
            Class_StoredProc.ParamByName('D_KEY_SESSION').AsInt64  := id_session;
            Class_StoredProc.ParamByName('D_SUMMA_DOC').AsDouble   := RxMemoryDataSaveProv.FieldByName('RxMemDat_summa').Value;
            Class_StoredProc.ParamByName('D_ID_SM').AsInt64        := RxMemoryDataSaveProv.FieldByName('RxMemDatid_sm').Value;
            Class_StoredProc.ParamByName('D_ID_RAZD').AsInt64      := RxMemoryDataSaveProv.FieldByName('RxMemDatid_razd').Value;
            Class_StoredProc.ParamByName('D_ID_ST').AsInt64        := RxMemoryDataSaveProv.FieldByName('RxMemDatid_st').Value;
            Class_StoredProc.ParamByName('D_ID_KEKV').AsInt64      := RxMemoryDataSaveProv.FieldByName('RxMemDatid_kekv').Value;
            Class_StoredProc.ParamByName('D_ID_DOG').AsInt64       := RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveId_Dog').Value;
            Class_StoredProc.ParamByName('D_ID_MAN').AsInt64       := RxMemoryDataSaveProv.FieldByName('RxMemDatid_man').Value;
            Class_StoredProc.ParamByName('D_ID_SCH').AsInt64       := RxMemoryDataSaveProv.FieldByName('RxMemDatID_SCH_KORESPOND').Value;
            Class_StoredProc.ParamByName('D_KOD_DOG').AsInt64      := RxMemoryDataSaveProv.FieldByName('RxMemDatkod_dog').Value;
            Class_StoredProc.ParamByName('D_ID_USER').AsInt64      := myclass.id_user;
            Class_StoredProc.ParamByName('D_ID_ALL_DOC').AsInt64   := id_all;
            Class_StoredProc.ParamByName('D_ID_KASSA_SCH').AsInt64 := RxMemoryDataSaveProv.FieldByName('RxMemDatid_sch').Value;
            Class_StoredProc.ParamByName('D_ID_PROV').AsInt64      := RxMemoryDataSaveProv.FieldByName('RxMemDatid_all_prov').Value;
            Class_StoredProc.ParamByName('D_TODAY').AsDate         := cxDateEditAo.Date;
            Class_StoredProc.ParamByName('D_PRIHOD').AsInteger     := myform.prihod;
            Class_StoredProc.ParamByName('IS_M').AsInteger         := RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldMain').Value;
            Class_StoredProc.ExecProc;
            RxMemoryDataSaveProv.Next;
        end;
        Class_Transaction_Wr.Commit;

        Class_StoredProc.Database    := myform.DatabaseMain;
        Class_StoredProc.Transaction := Class_Transaction_Wr;
        Class_DataSet.Database       := myform.DatabaseMain;
        Class_DataSet.Transaction    := Class_Transaction_Wr;
        Class_Transaction_Wr.StartTransaction;
        try

            //изменение шапки
            s1 := myform.DataSetMain.FieldByName('R_SUM_AO').AsCurrency;
            s2 := StrToCurr(cxTextEditSumma.Text);
            s3 := 0.01;

            IF (myform.DataSetMain.FieldByName('R_DATE_AO').AsDateTime <> cxDateEditAo.Date) or (myform.DataSetMain.FieldByName('R_NOTE').AsString <> cxMemoNote.Text) or
               (TFIBBCDField(myform.DataSetMain.FieldByName('R_ID_MAN')).AsInt64 <> id_people ) or (myform.DataSetMain.FieldByName('R_NUM_AO').AsString <> cxEditNumber2.Text) or
               (Roundto(abs(s1 - s2),-2) >= s3) or
               (cxCheckBoxKom.Checked) or
               (myform.DataSetMain.FieldByName('KOD_SCH').AsInteger <> kod_sch_ao) then
            begin
                Class_StoredProc.StoredProcName := 'J4_DT_AO_CHANGE';
                Class_StoredProc.Prepare;
                Class_StoredProc.ParamByName('D_ID_MAN').AsInt64      := id_people;
                Class_StoredProc.ParamByName('D_NU_AO').AsString      := cxEditNumber2.Text;
                Class_StoredProc.ParamByName('D_DATE').AsDate         := cxDateEditAo.Date;
                Class_StoredProc.ParamByName('D_SUM_AO').AsString     := cxTextEditSumma.Text;
                Class_StoredProc.ParamByName('D_NOTE').AsString       := cxMemoNote.Text;
                Class_StoredProc.ParamByName('D_ID_AO').AsInt64       := id_ao;
                Class_StoredProc.ParamByName('D_ID_J4_SP_JO').AsInt64 := myform.id_system;
                //showmessage(Class_dataset.FieldByName('R_NU_AO').AsString);
                if (cxCheckBoxKom.Checked) then
                begin
                    Class_StoredProc.ParamByName('D_KOM_ON').AsInteger          := 1;
                    Class_StoredProc.ParamByName('D_KOM_DATE_BEG').AsDate       := cxDateEditFrom.Date;
                    Class_StoredProc.ParamByName('D_KOM_DATE_END').AsDate       := cxDateEditTo.Date;
                end else
                begin
                    Class_StoredProc.ParamByName('D_KOM_ON').AsInteger          := 0;
                    Class_StoredProc.ParamByName('D_KOM_DATE_BEG').AsDate       := StrToDate('01.01.1900');
                    Class_StoredProc.ParamByName('D_KOM_DATE_END').AsDate       := StrToDate('01.01.1900');
                end;
                Class_StoredProc.ParamByName('D_KOD_SCH_AO').AsInteger := kod_sch_ao;
                Class_StoredProc.ExecProc;
            end;

            //изменение расшифровок

            if ras = 1 then
            begin
                Class_StoredProc.StoredProcName := 'J4_DT_AO_RASPREDELENIE_DELETE';
                Class_StoredProc.ParamByName('D_ID_AO').AsInt64   := id_ao;
                Class_StoredProc.ExecProc;
                if not RxMemoryDataRas.IsEmpty then
                begin
                    if flag_exists_ras then
                    begin
                        RxMemoryDataRas.First;
                        flag_izmeni_rasshif := false;
                        while not RxMemoryDataRas.Eof do
                        begin
                            Class_StoredProc.StoredProcName:='J4_DT_AO_RASPREDELENIE_CHANGE';
                            Class_StoredProc.Prepare;
                            IF (not flag_izmeni_rasshif) THEN
                            begin
                                Class_StoredProc.ParamByName('D_FLAG').AsInteger  := 1;
                                flag_izmeni_rasshif := true;
                            end else
                            Class_StoredProc.ParamByName('D_FLAG').AsInteger  := 0;
                            Class_StoredProc.ParamByName('D_N_PP').AsInteger  := RxMemoryDataRas.FieldByName('RxMemoryDataNumber').AsInteger;
                            Class_StoredProc.ParamByName('D_SUMMA').AsDouble  := RxMemoryDataRas.FieldByName('RxMemoryDataSumma').AsFloat;
                            Class_StoredProc.ParamByName('D_ID_RASP').AsInt64 := RxMemoryDataRas.FieldByName('RxMemoryDataId').AsVariant;
                            Class_StoredProc.ParamByName('D_ID_AO').AsInt64   := id_ao;
                            Class_StoredProc.ParamByName('D_ID_PROV').AsInt64 := RxMemoryDataRas.FieldByName('Id_prov').Value;;
                            Class_StoredProc.ExecProc;
                            RxMemoryDataRas.Next;
                        end;
                    end else
                    begin
                        RxMemoryDataRas.First;
                        while not RxMemoryDataRas.Eof do
                        begin
                            Class_StoredProc.StoredProcName:='J4_DT_AO_RASPREDELENIE_ADD';
                            Class_StoredProc.Prepare;
                            Class_StoredProc.ParamByName('D_N_PP').AsInteger    := RxMemoryDataRas.FieldByName('RxMemoryDataNumber').AsInteger;
                            Class_StoredProc.ParamByName('D_SUMMA').AsDouble    := RxMemoryDataRas.FieldByName('RxMemoryDataSumma').AsFloat;
                            Class_StoredProc.ParamByName('D_ID_RASP').AsInt64   := RxMemoryDataRas.FieldByName('RxMemoryDataId').AsVariant;
                            Class_StoredProc.ParamByName('D_ID_AO').AsInt64     := id_ao;
                            Class_StoredProc.ParamByName('D_ID_PROV').AsInt64   := RxMemoryDataRas.FieldByName('Id_prov').Value;;
                            Class_StoredProc.ExecProc;
                            RxMemoryDataRas.Next;
                        end;
                    end;
                end;
            end;

                if (id_all > 0) then
                begin
                    STRU.DBHANDLE      := myform.DatabaseMain.Handle;
                    STRU.TRHANDLE      := Class_Transaction_Wr.Handle;
                    STRU.KERNEL_ACTION := 3;
                    STRU.KEY_SESSION   := id_session;
                    STRU.PK_ID         := id_all;
                    STRU.WORKDATE      := cxDateEditAo.Date;
                    STRU.ID_USER       := myclass.id_user;
                    try
                        DoResult:=Kernel.KernelDo(@STRU);
                    except on E:Exception do
                        begin
                            ShowMessage(Un_R_file_Alex.MY_ERROR_KERNELL+E.Message);
                            DecimalSeparator := ',';
                            if delete_buff = 1 then
                            begin
                                DelBuffer(id_session);
                            end;
                            Class_Transaction_Wr.Rollback;
                        end;
                    end;
                    if  DoResult then
                    begin
                        if delete_buff = 1 then
                        begin
                            DelBuffer(id_session);
                        end;
                        Class_Transaction_Wr.Commit;
                        DecimalSeparator := ',';
                        myform.ActionRefreshExecute(sender);
                        Myform.DataSetMain.Locate('ID_AO', id_ao_change, []);
                        close;
                    end
                    else begin
                        PageControl1.ActivePage := TabSheet1;
                        PageControl2.ActivePage := TabSheet5;
                        cxSplitter1.OpenSplitter;
                        cxMemo2.Lines.Clear;
                        cxMemo2.Lines.Insert(0, Un_R_file_Alex.MY_DOC_ERROR_KERNELL);
                        ErrorList:=Kernel.GetDocErrorsList(@STRU);
                        if ErrorList<>nil then for i:=0 to  ErrorList.Count-1 do cxMemo2.Lines.Insert(0, Un_R_file_Alex.MY_MESSAGE_ERROR +' '+ErrorList.Strings[i]);
                        DataSetError.Close;
                        DataSetError.SelectSQL.Text :='SELECT * FROM KASSA_SELECT_ERROR_PROVS('+IntToStr(STRU.KEY_SESSION)+')';
                        DataSetError.Open;
                        DataSetError.First;
                        RxError.EmptyTable;
                        while not DataSetError.Eof do
                        begin
                            RxError.Open;
                            RxError.Insert;
                            RxError.FieldByName('Rxkod').Value  := DataSetError['ID_ERROR'];
                            RxError.FieldByName('RxName').Value := DataSetError['ERROR_MESSAGE'];
                            RxError.Post;
                            DataSetError.Next;
                        end;
                        if delete_buff = 1 then
                        begin
                            DelBuffer(id_session);
                        end;
                        Class_Transaction_Wr.Rollback;
//                        Class_Transaction_Wr.commit;
                        DecimalSeparator := ',';
                        exit;
                    end;
                end else
                begin
                    STRU.DBHANDLE      := myform.DatabaseMain.Handle;
                    STRU.TRHANDLE      := Class_Transaction_Wr.Handle;
                    STRU.KERNEL_ACTION := 1;
                    STRU.KEY_SESSION   := id_session;
                    STRU.PK_ID         := 0;
                    STRU.WORKDATE      := cxDateEditAo.Date;
                    STRU.ID_USER       := myclass.id_user;
                    try
                         DoResult:=Kernel.KernelDo(@STRU);
                    except on E:Exception do begin
                             ShowMessage(Un_R_file_Alex.MY_DOC_ERROR_KERNELL+E.Message);
                             if delete_buff = 1 then
                             begin
                                 DelBuffer(id_session);
                             end;
                             Class_Transaction_Wr.Rollback;
                             DecimalSeparator := ',';
                         end;
                    end;
                    if  DoResult
                    then begin
                            if delete_buff = 1 then
                            begin
                                DelBuffer(id_session);
                            end;
                            Class_Transaction_Wr.Commit;
                            myform.ActionRefreshExecute(sender);
                            Myform.DataSetMain.Locate('ID_AO', id_ao_change, []);
                            DecimalSeparator := ',';
                            close;
                    end
                    else begin
                        cxSplitter1.OpenSplitter;
                        cxMemo2.Lines.Clear;
                        cxMemo2.Lines.Insert(0, Un_R_file_Alex.MY_DOC_ERROR_KERNELL);
                        ErrorList:=Kernel.GetDocErrorsList(@STRU);
                        if ErrorList<>nil then for i:=0 to  ErrorList.Count-1 do cxMemo2.Lines.Insert(0, Un_R_file_Alex.MY_MESSAGE_ERROR+' '+ErrorList.Strings[i]);
                        DataSetError.Close;
                        DataSetError.SelectSQL.Text :='SELECT * FROM KASSA_SELECT_ERROR_PROVS('+IntToStr(STRU.KEY_SESSION)+')';
                        DataSetError.Open;
                        DataSetError.First;
                        RxError.EmptyTable;
                        while not DataSetError.Eof do
                        begin
                            RxError.Open;
                            RxError.Insert;
                            RxError.FieldByName('Rxkod').Value  := DataSetError['ID_ERROR'];
                            RxError.FieldByName('RxName').Value := DataSetError['ERROR_MESSAGE'];
                            RxError.Post;
                            DataSetError.Next;
                        end;
                        if delete_buff = 1 then
                        begin
                            DelBuffer(id_session);
                        end;
                        Class_Transaction_Wr.Rollback;
                        DecimalSeparator := ',';
                        exit;
                    end;
              end;
      except on E:Exception do begin
            if delete_buff = 1 then
            begin
                DelBuffer(id_session);
            end;
          Class_Transaction_Wr.Rollback;
          ShowMessage(E.Message);
          exit;
      end
      end;
            DecimalSeparator := ',';
            end;
            myform.ActionRefreshExecute(sender);
            Myform.DataSetMain.Locate('ID_AO', id_ao, []);
            close;
end;

procedure TfmAddChangeAvance.ActionEditExecute(Sender: TObject);
var
    id_kor_sch, id_man_prov, id_smeta, id_stat, id_r, id_k, id_sch, id_dog, kod_dog, id_cust : int64;
    name_kor_sch, name_fio, name_smeta, name_stat, name_r, name_k, name_sch, date_dog, num_dog, name_cust, title_sm, title_rz, title_st, title_kekv, title_sch, title_kor_sch, type_dog, reg_dog, tin, birthday : string;
    summa : double;
    num, main, i, kod_neos : integer;
    id_raspred, id_prov, id_pprr, loc_id_last : int64;
    ssum : Currency;
    name, s : string;
begin
    flag_na_aftoscroll := false;
    if my_m <> ShowAvance then
    begin
        if PageControl1.ActivePage = TabSheet1 then
        begin
            if not RxMemoryDataSaveProv.IsEmpty then
            begin
                i := RxMemoryDataSaveProv.FieldByName('id').AsInteger;
                if RxMemoryDataSaveProv.FieldByName('RxMemDatid_sm').Value <> null
                    then id_smeta := RxMemoryDataSaveProv.FieldByName('RxMemDatid_sm').Value
                    else id_smeta := 0;
                if RxMemoryDataSaveProv.FieldByName('RxMemDatid_st').Value <> null
                    then id_stat  := RxMemoryDataSaveProv.FieldByName('RxMemDatid_st').Value
                    else id_stat  := 0;
                if RxMemoryDataSaveProv.FieldByName('RxMemDatid_razd').Value <> null
                    then id_r     := RxMemoryDataSaveProv.FieldByName('RxMemDatid_razd').Value
                    else id_r     := 0;
                if RxMemoryDataSaveProv.FieldByName('RxMemDatid_kekv').Value <> null
                    then id_k     := RxMemoryDataSaveProv.FieldByName('RxMemDatid_kekv').Value
                    else id_k     := 0;
                if RxMemoryDataSaveProv.FieldByName('RxMemDatid_sch').Value <> null
                    then id_sch   := RxMemoryDataSaveProv.FieldByName('RxMemDatid_sch').Value
                    else id_sch   := 0;
                if RxMemoryDataSaveProv.FieldByName('RxMemDatid_man').Value <> null
                    then id_man_prov := RxMemoryDataSaveProv.FieldByName('RxMemDatid_man').Value
                    else id_man_prov := 0;
                if RxMemoryDataSaveProv.FieldByName('RxMemDatFio').Value <> null
                    then name_fio   := RxMemoryDataSaveProv.FieldByName('RxMemDatFio').Value
                    else name_fio   := '';
                if RxMemoryDataSaveProv.FieldByName('RxMemDatNameSmeta').Value <> null
                    then name_smeta := RxMemoryDataSaveProv.FieldByName('RxMemDatNameSmeta').Value
                    else name_smeta := '';
                if RxMemoryDataSaveProv.FieldByName('RxMemDatNameStat').Value <> null
                    then name_stat  := RxMemoryDataSaveProv.FieldByName('RxMemDatNameStat').Value
                    else name_stat  := '';
                if RxMemoryDataSaveProv.FieldByName('RxMemDatNameRazd').Value <> null
                    then name_r     := RxMemoryDataSaveProv.FieldByName('RxMemDatNameRazd').Value
                    else name_r     := '';
                if RxMemoryDataSaveProv.FieldByName('RxMemDatNameKekv').Value <> null
                    then name_k     := RxMemoryDataSaveProv.FieldByName('RxMemDatNameKekv').Value
                    else name_k     := '';
                if RxMemoryDataSaveProv.FieldByName('RxMemDatNameSch').Value <> null
                    then name_sch   := RxMemoryDataSaveProv.FieldByName('RxMemDatNameSch').Value
                    else name_sch   := '';
                if RxMemoryDataSaveProv.FieldByName('RxMemDat_summa').Value <> null
                    then summa      := RxMemoryDataSaveProv.FieldByName('RxMemDat_summa').Value
                    else summa      := 0;
                if RxMemoryDataSaveProv.FieldByName('RxMemDatID_SCH_KORESPOND').Value <> null
                    then id_kor_sch := RxMemoryDataSaveProv.FieldByName('RxMemDatID_SCH_KORESPOND').Value
                    else id_kor_sch := 0;
                if RxMemoryDataSaveProv.FieldByName('RxMemDatname_korespond').Value <> null
                    then name_kor_sch := RxMemoryDataSaveProv.FieldByName('RxMemDatname_korespond').Value
                    else name_kor_sch := '';
                if RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveId_Dog').Value <> null
                    then id_dog := RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveId_Dog').Value
                    else id_dog := 0;
                if RxMemoryDataSaveProv.FieldByName('RxMemDatkod_dog').Value <> null
                    then kod_dog := RxMemoryDataSaveProv.FieldByName('RxMemDatkod_dog').Value
                    else kod_dog := 0;

                if RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldDate_dog').Value <> null
                    then date_dog := RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldDate_dog').Value
                    else date_dog := '';
                if RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldNum_dog').Value <> null
                    then num_dog := RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldNum_dog').Value
                    else num_dog := '';
                if RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldNameCust').Value <> null
                    then name_cust := RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldNameCust').Value
                    else name_cust := '';
                if RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_sm').Value <> null
                    then title_sm := RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_sm').Value
                    else title_sm := '';
                if RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_raz').Value <> null
                    then title_rz := RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_raz').Value
                    else title_rz := '';
                if RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_st').Value <> null
                    then title_st := RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_st').Value
                    else title_st := '';
                if RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_kor_sch').Value <> null
                    then title_kor_sch := RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_kor_sch').Value
                    else title_kor_sch := '';
                if RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_sch').Value <> null
                    then title_sch := RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_sch').Value
                    else title_sch := '';
                if RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_kekv').Value <> null
                    then title_kekv := RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_kekv').Value
                    else title_kekv := '';
                if RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTypeDog').Value <> null
                    then type_dog := RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTypeDog').Value
                    else type_dog := '';
                if RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldRegDog').Value <> null
                    then reg_dog := RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldRegDog').Value
                    else reg_dog := '';
                if RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTin').Value <> null
                    then tin := RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTin').Value
                    else tin := '';
                if RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldBirthday').Value <> null
                    then birthday := RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldBirthday').Value
                    else birthday := '';
                id_prov := RxMemoryDataSaveProv.FieldByName('RxMemDatid_all_prov').Value;
                if RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldMain').Value = 1
                    then main := 1
                    else main := 0;
                if main = 0
                    then summa := RxMemoryDataSaveProv.FieldByName('Summa_po_neosnovnim').Value;
                if RxMemoryDataSaveProv.FieldByName('id_customer').Value <> null
                    then id_cust := RxMemoryDataSaveProv.FieldByName('id_customer').Value
                    else id_cust := 0;


                kod_neos := -1;
                if Show_Provodka(self, myform.prihod, myform.id_system, myform.DatabaseMain, myform.TransactionRead, ChangeProvAvance, id_sch, id_man_prov, id_kor_sch, id_smeta, id_stat, id_r, id_k, id_cust, summa, name_fio, name_kor_sch, name_smeta, name_stat, name_r, name_k, name_sch, id_dog, kod_dog, date_dog, num_dog, name_cust, title_sm, title_rz, title_st, title_kekv, title_sch, title_kor_sch, reg_dog, type_dog, tin, birthday, id_prov, main, kod_neos, id_dog_group,id_dog_group_pr,id_dog_group_rash) then
                begin
                     RxMemoryDataSaveProv.Open;
                     RxMemoryDataSaveProv.Edit;
                     RxMemoryDataSaveProv.FieldByName('RxMemDat_summa').Value                         := summa;
                     RxMemoryDataSaveProv.FieldByName('RxMemDatid_sm').Value                          := id_smeta;
                     RxMemoryDataSaveProv.FieldByName('RxMemDatid_razd').Value                        := id_r;
                     RxMemoryDataSaveProv.FieldByName('RxMemDatid_st').Value                          := id_stat;
                     RxMemoryDataSaveProv.FieldByName('RxMemDatid_kekv').Value                        := id_k;
                     RxMemoryDataSaveProv.FieldByName('RxMemDatid_doc').Value                         := 0;
                     RxMemoryDataSaveProv.FieldByName('RxMemDatkod_dog').Value                        := kod_dog;
                     RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveId_Dog').Value                 := id_dog;
                     RxMemoryDataSaveProv.FieldByName('RxMemDatid_man').Value                         := id_man_prov;
                     RxMemoryDataSaveProv.FieldByName('RxMemDatid_sch').Value                         := id_sch;
                     RxMemoryDataSaveProv.FieldByName('RxMemDatsumma_value').Value                    :=  0;
                     RxMemoryDataSaveProv.FieldByName('RxMemDatid_value').Value                       :=  0;
                     if id_prov > 0
                         then RxMemoryDataSaveProv.FieldByName('RxMemDatid_all_prov').Value           := id_prov
                         else RxMemoryDataSaveProv.FieldByName('RxMemDatid_all_prov').Value           := myform.DatabaseMain.Gen_Id('KERNEL_GEN_ID', 1);
//                     RxMemoryDataSaveProv.FieldByName('RxMemDatId_doc_prov').Value :=  0;
                     RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveId_Dog').Value                 := id_dog;
                     RxMemoryDataSaveProv.FieldByName('RxMemDatkod_dog').Value                        := kod_dog;
                     RxMemoryDataSaveProv.FieldByName('RxMemDatNameSch').Value                        := name_sch;
                     RxMemoryDataSaveProv.FieldByName('RxMemDatNameStat').Value                       := name_stat;
                     RxMemoryDataSaveProv.FieldByName('RxMemDatNameRazd').Value                       := name_r;
                     RxMemoryDataSaveProv.FieldByName('RxMemDatNameSmeta').Value                      := name_smeta;
                     RxMemoryDataSaveProv.FieldByName('RxMemDatNameKekv').Value                       := name_k;
                     RxMemoryDataSaveProv.FieldByName('RxMemDatFio').Value                            := name_fio;
                     RxMemoryDataSaveProv.FieldByName('RxMemDatID_SCH_KORESPOND').Value               := id_kor_sch;
                     RxMemoryDataSaveProv.FieldByName('RxMemDatname_korespond').Value                 := name_kor_sch;
                     RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldSmRzStK').Value       := name_smeta + '\' + name_r + '\' + name_stat + '\' +name_k;
                     RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldNum_dog').Value       := num_dog;
                     RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldNameCust').Value      := name_cust;
                     RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_kor_sch').Value := title_kor_sch;
                     RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_sch').Value     := title_sch;
                     RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_kekv').Value    := title_kekv;
                     RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_st').Value      := title_st;
                     RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_raz').Value     := title_rz;
                     RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_sm').Value      := title_sm;
                     try RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldDate_dog').Value  := StrTodate(date_dog) except RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldDate_dog').Value := null; end;
                     RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTypeDog').Value       := type_dog;
                     RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldRegDog').Value        := reg_dog;
                     RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTin').Value           := tin;
                     try RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldBirthday').Value  := birthday except RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldBirthday').Value := null; end;
                     RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldMain').Value          := main;
                     RxMemoryDataSaveProv.FieldByName('id_customer').Value                            := id_cust;
                     if main = 1 then
                     begin
                         RxMemoryDataSaveProv.FieldByName('Summa_po_osnovnim').Value                  := summa;
                         RxMemoryDataSaveProv.FieldByName('Summa_po_neosnovnim').Value                := null;
                     end else
                     begin
                         RxMemoryDataSaveProv.FieldByName('Summa_po_osnovnim').Value                  := null;
                         RxMemoryDataSaveProv.FieldByName('Summa_po_neosnovnim').Value                := summa;
                     end;
                     RxMemoryDataSaveProv.Post;
                     RxMemoryDataSaveProv.Locate('id', i, []);

                 if kod_neos <> -1 then
                 begin
                     Ds.Close;
                     Ds.Sqls.SelectSql.Text := 'SELECT * FROM J4_SELECT_NEOSNOV_PROV_INFO('+IntToStr(kod_neos)+', '''+cxDateEditAo.Text+''')';
                     Ds.Open;
                     Ds.First;
                     i := i+1;
                     while not Ds.Eof do
                     begin
                         RxMemoryDataSaveProv.Open;
                         RxMemoryDataSaveProv.Insert;
                         RxMemoryDataSaveProv.FieldByName('id').Value                                     :=  i+1;
                         RxMemoryDataSaveProv.FieldByName('RxMemDatId_doc_prov').Value                    := 0;
                         RxMemoryDataSaveProv.FieldByName('RxMemDatid_doc').Value                         := 0;
                         RxMemoryDataSaveProv.FieldByName('RxMemDat_summa').Value                         := RoundTo((summa/100)*Ds.fbn('PER_SUM').AsCurrency, -2);
                         RxMemoryDataSaveProv.FieldByName('RxMemDatid_sm').Value                          := StrToint64(Ds.FBN('ID_SM').AsString);
                         RxMemoryDataSaveProv.FieldByName('RxMemDatid_razd').Value                        := StrToint64(Ds.FBN('ID_RAZD').AsString);
                         RxMemoryDataSaveProv.FieldByName('RxMemDatid_st').Value                          := StrToint64(Ds.FBN('ID_ST').AsString);
                         RxMemoryDataSaveProv.FieldByName('RxMemDatid_kekv').Value                        := StrToint64(Ds.FBN('ID_K').AsString);
                         RxMemoryDataSaveProv.FieldByName('RxMemDatid_man').Value                         := id_man_prov;
                         RxMemoryDataSaveProv.FieldByName('RxMemDatid_sch').Value                         := id_kor_sch;
                         RxMemoryDataSaveProv.FieldByName('RxMemDatNameSch').Value                        := name_kor_sch;
                         RxMemoryDataSaveProv.FieldByName('RxMemDatNameStat').Value                       := Ds.FBN('R_STETE_NUM').AsString;
                         RxMemoryDataSaveProv.FieldByName('RxMemDatNameRazd').Value                       := Ds.FBN('R_RAZD_NUM').AsString;
                         RxMemoryDataSaveProv.FieldByName('RxMemDatNameSmeta').Value                      := Ds.FBN('R_KOD_SM').AsString;
                         RxMemoryDataSaveProv.FieldByName('RxMemDatFio').Value                            := name_fio;
                         RxMemoryDataSaveProv.FieldByName('RxMemDatNameKekv').Value                       := Ds.FBN('R_NAME_KEKV').AsString;
                         RxMemoryDataSaveProv.FieldByName('RxMemDatID_SCH_KORESPOND').Value               := StrToint64(Ds.FBN('ID_SCH').AsString);
                         RxMemoryDataSaveProv.FieldByName('RxMemDatname_korespond').Value                 := Ds.FBN('KOD_SCH').AsString;
                         RxMemoryDataSaveProv.FieldByName('RxMemDatid_all_prov').Value                    := myform.DatabaseMain.Gen_Id('KERNEL_GEN_ID', 1);
                         RxMemoryDataSaveProv.FieldByName('RxMemDatkod_dog').Value                        := kod_dog;
                         RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveId_Dog').Value                 := id_dog;
                         RxMemoryDataSaveProv.FieldByName('RxMemDatsumma_value').Value                    := 0;
                         RxMemoryDataSaveProv.FieldByName('RxMemDatid_value').Value                       := 0;
                         RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldSmRzStK').Value       := Ds.FBN('PROV').AsString;
                         RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldNum_dog').Value       := num_dog;
                         RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldNameCust').Value      := name_cust;
                         RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_kor_sch').Value := Ds.FBN('TITLY_SCH').AsString;
                         RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_sch').Value     := title_kor_sch;
                         RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_kekv').Value    := Ds.FBN('R_KEKV_TITLE').AsString;
                         RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_st').Value      := Ds.FBN('R_STATE_TITLE').AsString;
                         RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_raz').Value     := Ds.FBN('R_RAZD_TITLE').AsString;
                         RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_sm').Value      := Ds.FBN('R_SMETA_TITLE').AsString;
                         try RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldDate_dog').Value  := StrTodate(date_dog) except RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldDate_dog').Value := null; end;
                         RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTypeDog').Value       := type_dog;
                         RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldRegDog').Value        := reg_dog;
                         RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTin').Value           := tin;
                         try RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldBirthday').Value  := birthday except RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldBirthday').Value := null; end;
                         RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldMain').Value          := 0;
                         RxMemoryDataSaveProv.FieldByName('Summa_po_osnovnim').Value                      := null;
                         RxMemoryDataSaveProv.FieldByName('Summa_po_neosnovnim').Value                    := RoundTo((summa/100)*Ds.fbn('PER_SUM').AsCurrency, -2);
                         RxMemoryDataSaveProv.Post;
                         Ds.Next;
                     end;
                 end;
                 end;
              end;
            end;
            if PageControl1.ActivePage = TabSheet2 then
            begin
               if not RxMemoryDataRas.IsEmpty then
               begin
                   name         := RxMemoryDataRas.FieldByName('RxMemoryDataName').value;
                   id_raspred   := RxMemoryDataRas.FieldByName('RxMemoryDataId').value;
                   ssum         := RxMemoryDataRas.FieldByName('RxMemoryDataSumma').Value;
                   num          := RxMemoryDataRas.FieldByName('RxMemoryDataNumber').value;
                   id_pprr      := RxMemoryDataRas.FieldByName('id_prov').value;
                   if id_pprr >0 then
                   begin
                       loc_id_last := RxMemoryDataSaveProv.FieldbyName('id').AsInteger;
                       RxMemoryDataSaveProv.Locate('RxMemDatid_all_prov', id_pprr, []);
                       s           := RxMemoryDataSaveProv.FieldbyName('RxMemDatNameSch').AsString + ' - ' + RxMemoryDataSaveProv.FieldbyName('RxMemDatname_korespond').AsString + ' ' + RxMemoryDataSaveProv.FieldbyName('RxMemoryDataSaveProvFieldSmRzStK').AsString + ' ' + RxMemoryDataSaveProv.FieldbyName('RxMemoryDataSaveProvFieldTitle_sm').AsString + ' ' + RxMemoryDataSaveProv.FieldbyName('RxMemDat_summa').AsString;
                       RxMemoryDataSaveProv.Locate('id', loc_id_last, []);
                   end;
                   if Show_Ras(self, myform.DatabaseMain, myform.TransactionRead, ChangeRas, id_raspred, ssum, name, num, id_pprr, s) then
                      begin
                          RxMemoryDataRas.Open;
                          RxMemoryDataRas.Edit;
                          RxMemoryDataRas.FieldByName('RxMemoryDataName').value   := name;
                          RxMemoryDataRas.FieldByName('RxMemoryDataId').value     := id_raspred;
                          RxMemoryDataRas.FieldByName('RxMemoryDataNumber').value := num;
                          RxMemoryDataRas.FieldByName('RxMemoryDataSumma').Value  := ssum;
                          RxMemoryDataRas.FieldByName('Id_prov').Value            := id_pprr;
                          RxMemoryDataRas.Post;
                      end;
               end
            end;
        end;
    flag_na_aftoscroll := true;
end;

procedure TfmAddChangeAvance.cxDateEditAoFocusChanged(Sender: TObject);
begin
    IF cxDateEditAo.text = '' then
        cxDateEditAo.date := date;
end;

procedure TfmAddChangeAvance.cxGrid2DBTableView1DblClick(Sender: TObject);
{var
    num  : integer;
    id   : int64;
    name : string;
    ssum : Currency;}
begin
{    if not RxMemoryDataRas.IsEmpty then
    begin
        name  := RxMemoryDataRas.FieldByName('RxMemoryDataName').value;
        id    := RxMemoryDataRas.FieldByName('RxMemoryDataId').value;
        ssum  := RxMemoryDataRas.FieldByName('RxMemoryDataSumma').Value;
        num   := RxMemoryDataRas.FieldByName('RxMemoryDataNumber').value;
        if Show_Ras(self, myform.DatabaseMain, myform.TransactionRead, ChangeRas, id, ssum, name, num) then
        begin
            RxMemoryDataRas.Open;
            RxMemoryDataRas.Insert;
            RxMemoryDataRas.FieldByName('RxMemoryDataName').value   := name;
            RxMemoryDataRas.FieldByName('RxMemoryDataId').value     := id;
            RxMemoryDataRas.FieldByName('RxMemoryDataNumber').value := num;
            RxMemoryDataRas.FieldByName('RxMemoryDataSumma').Value  := ssum;
            RxMemoryDataRas.Post;
        end;
    end}
    ActionEditExecute(Self);
end;

procedure TfmAddChangeAvance.cxGrid2DBTableView1KeyPress(Sender: TObject;
  var Key: Char);
begin
    if key = '13' then cxGrid2DBTableView1DblClick(Sender);
end;

procedure TfmAddChangeAvance.cxTextEditSummaKeyPress(Sender: TObject;
  var Key: Char);
begin
    if cxTextEditSumma.Text = '0,00' then cxTextEditSumma.Text := '';

    if Key = '.' then Key := DecimalSeparator;

    if (Key = '-') and (Length(cxTextEditSumma.Text)>0)
    then Key := Chr(0);

    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and (Key <> DecimalSeparator)
        and (Key <> '-')
    then
        Key := Chr(0)
    else
    if  (Key = DecimalSeparator) and
        (Pos(DecimalSeparator, cxTextEditSumma.Text) > 0)
    then
        Key := Chr(0)
    else
    if ((Length(cxTextEditSumma.Text) - Pos(DecimalSeparator, cxTextEditSumma.Text) > 1) and (Pos(DecimalSeparator,cxTextEditSumma.Text) <> 0))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and ((Ord(Key) > 48) or (Ord(Key) < 57))
    then
        Key := Chr(0);
end;


procedure TfmAddChangeAvance.FormActivate(Sender: TObject);
var
    id_sss : int64;
    num_out, title_out : string;
begin
    if flag_na_zapusk_sch then
    begin
        if not ShowSelectSch(myform.DatabaseMain,pFIBTransactionRead,myform.id_system,myform.id_sm ,myform.id_razd ,myform.id_st,myform.id_oper,myform.prihod, use_expert_system, id_form_uch, cxDateEditAo.Date, id_sss, num_out, title_out) then
        begin
            exit;
        end;
        flag_na_zapusk_sch := false;;
        id_sch_in     := id_sss;
        num_sch_in    := num_out;
        title_sch_in  := title_out;
        DefineKodSchAo(id_sch_in);
        cxDateEditAoPropertiesChange(self);

        if ((myform.id_oper = 2) and (myform.show_shablon = 1)) then
        begin
            RxMemoryDataSaveProv.Open;
            RxMemoryDataSaveProv.Edit;
            RxMemoryDataSaveProv.FieldByName('RxMemDatid_sch').Value      := id_sch_in;
            RxMemoryDataSaveProv.FieldByName('RxMemDatNameSch').Value     := num_sch_in;
            RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_sch').Value     := title_sch_in;
            RxMemoryDataSaveProv.Post;
            RxMemoryDataSaveProv.Refresh;

        end;
     end;
    if flag_na_zapusk_fio then
    begin
        flag_na_zapusk_fio := false;
        cxMRUEditFioPropertiesButtonClick(Self);
    end;
end;

procedure TfmAddChangeAvance.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
    ActionEditExecute(Sender);
end;


procedure TfmAddChangeAvance.RxMemoryDataSaveProvAfterScroll(
  DataSet: TDataSet);
begin
  if flag_na_aftoscroll then
  begin
    if not RxMemoryDataSaveProv.IsEmpty then
    begin
        cxTextEdit1.Text := RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_raz').AsString;
        cxTextEdit2.Text := RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_st').AsString;
        cxTextEdit3.Text := RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_kekv').AsString;
        if RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveId_Dog').AsVariant > 0 then
            cxTextEdit4.Text := Un_R_file_Alex.BANK_TYPE_DOGOVOR+' : ' + RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTypeDog').AsString + '; №  '+RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldNum_dog').AsString + ' '+ Un_R_file_Alex.KASSA_DOC_ORDER_FROM + ' ' + RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldDate_dog').AsString + ' ( '+ Un_R_file_Alex.KASSA_REG_NUM + RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldRegDog').AsString+' ); ' + Un_R_file_Alex.BANK_NAME_CUSTMERA + ' : ' + RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldNameCust').AsString;
    end;
  end;
end;

procedure TfmAddChangeAvance.cxGrid1DBTableView1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if Key = VK_DELETE then ActionDelExecute(Sender);
end;

function TfmAddChangeAvance.LoadDogovor : boolean;
var
    inputDog : TDogInput;
    res   : TDogResult;
    summa_dog : double;
    pr{, i} : integer;
begin
    flag_na_aftoscroll := false;
    summa_dog := StrToFloat(cxTextEditSumma.Text);
    if Show_Summa_Avance(summa_dog, '') then
    begin
        LoadSysData(pFIBTransactionRead);
        inputDog.Owner        := self;
        inputDog.DBHandle     := database.Handle;
        inputDog.WriteTrans   := Class_Transaction_Wr.Handle;
        inputDog.ReadTrans    := pFIBTransactionRead.Handle;
        inputDog.FormStyle    := fsNormal;
        inputDog.Summa        := summa_dog;
        inputDog.id_Group     := id_dog_group;
        if(prihod = 1)then
             inputDog.id_Group_add := id_dog_group_pr
        else
             inputDog.id_Group_add := id_dog_group_rash;
        SYS_CURRENT_DATE      := cxDateEditAo.Date;

        res := ShowDogMain(inputDog);
        if res.ModalResult = 1 then
        begin
            pr := 0;
            cxTextEditSumma.Text := Un_func_file_Alex.AddNol(FloatToStr(summa_dog), pr);
            cxMemoNote.Text      := VarToStr(res.dog_note);
            cxMemoDog.Text       := {Un_R_file_Alex.BANK_TYPE_DOGOVOR+' : ' + }VarToStr(res.name_tip_dog)+'; №  '+VarToStr(res.n_dog)+' '+ Un_R_file_Alex.KASSA_DOC_ORDER_FROM + ' ' +VarToStr(res.d_dog) + ' ( '+ Un_R_file_Alex.KASSA_REG_NUM + VarToStr(res.regest_num)+' ); ' + Un_R_file_Alex.BANK_NAME_CUSTMERA + ' : ' + VarToStr(res.name_customer);
            if id_people <> res.sum_today then
            begin
                DataSetChange.Close;
                DataSetChange.SQLs.SelectSQL.Text := 'SELECT * FROM PUB_GET_MAN_INFO('+IntToStr(res.sum_today)+','''+DateToStr(Date)+''')';
                DataSetChange.Open;
                showMessage(Un_R_file_Alex.J4_OSTATOK_ERROR_MAN + #13 + Un_R_file_Alex.J4_OSTATOK_IN_OST + cxMRUEditFio.Text+ #13 + Un_R_file_Alex.J4_OSTATOK_IN_DOG + DataSetChange.FieldByName('UKR_FAMILIA').AsString + ' ' + DataSetChange.FieldByName('UKR_IMYA').AsString + ' ' + DataSetChange.FieldByName('UKR_OTCHESTVO').AsString);
//                        MessageBox(Handle, PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), PChar(''{Un_R_file_Alex.J4_ERROR_CELOSTNOCT_DANNIH}), 16);
                Result := false;
                exit;
            end;
            if not RxMemoryDataSaveProv.IsEmpty then
            begin
                RxMemoryDataSaveProv.First;
                while not RxMemoryDataSaveProv.Eof do
                begin
                    RxMemoryDataSaveProv.Open;
                    RxMemoryDataSaveProv.Edit;
                    RxMemoryDataSaveProv.FieldByName('RxMemDatkod_dog').Value                   := res.kod_dog;
                    RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveId_Dog').Value            := res.id_dog;
                    RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldNameCust').Value := res.name_customer;
                    RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldNum_dog').Value  := res.n_dog;
                    RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldDate_dog').Value := res.d_dog;
                    RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTypeDog').Value  := res.name_tip_dog;
                    RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldRegDog').Value   := res.regest_num;
                    RxMemoryDataSaveProv.Post;
                    RxMemoryDataSaveProv.Next;
                end;
            end;
        end else
        begin
            result := false;
            exit;
        end;
        result := true;
    end else
    begin
        result := false;
    end;
    flag_na_aftoscroll := true;
end;

procedure TfmAddChangeAvance.SpeedButtonDogClick(Sender: TObject);
begin
    if cxMemoDog.Lines.Strings[0] <> Un_R_file_Alex.SOGLASNO_SPISKU_DOG then
        LoadDogovor;
end;

procedure TfmAddChangeAvance.cxGrid1DBTableView1DBColumn5CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
    if (AviewInfo.GridRecord.Values[cxGrid1DBTableView1DBColumn5.Index] = 0) then begin
            ACanvas.FillRect(AViewInfo.Bounds);
            ACanvas.DrawImage(ImageList1, AViewInfo.Bounds.Left + Trunc((AViewInfo.Bounds.Right - AViewInfo.Bounds.Left) / 3),
                                AviewInfo.Bounds.Top, 0);
            ADone := True;
    end;
end;

function TfmAddChangeAvance.Check_date : boolean;
var
    _M1, _M2, i : INTEGER;
//    id_all : int64;
    id_all_doc : int64;
    STRU : KERNEL_MODE_STRUCTURE;
    errorList : TstringList;
    DoResult : boolean;
    mes : string;
    flag_exist_num : integer;
begin
    _M1 := MonthOf(cxDateEditAo.Date);
    _M2 := MonthOf(myform.DataSetMain.FieldByName('R_DATE_AO').AsDateTime);

    if (cxDateEditAo.Date <> myform.DataSetMain.FieldByName('R_DATE_AO').AsDateTime) and (_M1 <> _M2) then
    begin  
        Result := true;
        Class_StoredProc.Database    := myform.DatabaseMain;
        Class_StoredProc.Transaction := Class_Transaction_Wr;

        DataSetError.Database        := myform.DatabaseMain;

        Class_DataSet.Database       := myform.DatabaseMain;
        Class_DataSet.Transaction    := Class_Transaction_Wr;

        Class_Transaction_Wr.StartTransaction;

        try
            STRU.DBHANDLE      := myform.DatabaseMain.Handle;
            STRU.TRHANDLE      := Class_Transaction_Wr.Handle;
            STRU.WORKDATE      := myform.DataSetMain.fbn('R_DATE_AO').AsDateTime;
            STRU.KERNEL_ACTION := 2;
            STRU.KEY_SESSION   := myform.DatabaseMain.Gen_Id('KERNEL_GEN_ID_SESSION', 1);
            STRU.PK_ID         := TFIBBCDField(myform.DataSetMain.FieldByname('R_ID_DT_DOC')).AsInt64;
            DoResult           := Kernel.KernelDo(@STRU);
            if not DoResult then
            begin
                ErrorList      := Kernel.GetDocErrorsList(@STRU);
                if ErrorList<>nil then
                    for i := 0 to  ErrorList.Count-1 do
                        mes :=  mes +' '+ ErrorList.Strings[i] +#13;
                ShowMessage(mes);
                Class_Transaction_Wr.Rollback;
                exit;
            end;
            Class_StoredProc.StoredProcName := 'J4_DT_AO_DELETE';
            Class_StoredProc.Prepare;
            Class_StoredProc.ParamByName('D_ID_AO').AsInt64 := TFIBBCDField(myform.DataSetMain.fbn('ID_AO')).AsInt64;
            Class_StoredProc.ExecProc;
            //Class_StoredProc.Transaction.Commit;
        except on E:Exception do begin
            Class_Transaction_Wr.Rollback;
            ShowMessage(E.Message);
            exit;
        end end;

        try
            Class_DataSet.Close;
            if myform.prihod = 1
                then Class_DataSet.SQLs.SelectSQL.Text:='select * from J4_INSERT_ALL_DOC('+IntToStr(myform.prihod)+', '''+cxMRUEditFio.Text+''', '''+cxMemoNote.Text+''', ''' + StringReplace(cxTextEditSumma.Text,',','.',[]) + ''', '+intToStr(myclass.id_user)+', '+IntTostr(id_session)+', '''+cxDateEditAo.Text+''', '''+cxEditNumber1.Text+cxEditNumber2.text+''', '+IntToStr(40004)+', ' + IntToStr(id_ao) + ', '''+GetComputerNetName+''', '+IntTostr(id_rate)+', '+IntTostr(id_rate_n)+', '+IntTostr(id_customer)+', '+IntToStr(0)+', '+inttostr(0)+')'
                else Class_DataSet.SQLs.SelectSQL.Text:='select * from J4_INSERT_ALL_DOC('+IntToStr(myform.prihod)+', '''+cxMRUEditFio.Text+''', '''+cxMemoNote.Text+''', ''' + StringReplace(cxTextEditSumma.Text,',','.',[]) + ''', '+intToStr(myclass.id_user)+', '+IntTostr(id_session)+', '''+cxDateEditAo.Text+''', '''+cxEditNumber1.Text+cxEditNumber2.text+''', '+IntToStr(4)+', ' + IntToStr(id_ao) + ', '''+GetComputerNetName+''', '+IntTostr(id_rate)+', '+IntTostr(id_rate_n)+', '+IntTostr(id_customer)+', '+IntToStr(0)+', '+inttostr(0)+')';
            Class_DataSet.Open;
            id_all_doc := TFIBBCDField(Class_DataSet.FieldByName('R_ID')).AsInt64;
            Class_DataSet.Close;

            RxMemoryDataSaveProv.First;
            while not RxMemoryDataSaveProv.Eof do
            begin
                Class_StoredProc.StoredProcName:='J4_INSERT_ALL_PROV';
                Class_StoredProc.Prepare;
//                    Class_StoredProc.ParamByName('D_ID_DT_DOC').AsInt64    := id_ao;
                Class_StoredProc.ParamByName('D_KEY_SESSION').AsInt64  := id_session;
                Class_StoredProc.ParamByName('D_SUMMA_DOC').AsDouble   := RxMemoryDataSaveProv.FieldByName('RxMemDat_summa').Value;
                Class_StoredProc.ParamByName('D_ID_SM').AsInt64        := RxMemoryDataSaveProv.FieldByName('RxMemDatid_sm').Value;
                Class_StoredProc.ParamByName('D_ID_RAZD').AsInt64      := RxMemoryDataSaveProv.FieldByName('RxMemDatid_razd').Value;
                Class_StoredProc.ParamByName('D_ID_ST').AsInt64        := RxMemoryDataSaveProv.FieldByName('RxMemDatid_st').Value;
                Class_StoredProc.ParamByName('D_ID_KEKV').AsInt64      := RxMemoryDataSaveProv.FieldByName('RxMemDatid_kekv').Value;
                Class_StoredProc.ParamByName('D_ID_DOG').AsInt64       := RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveId_Dog').Value;
                Class_StoredProc.ParamByName('D_ID_MAN').AsInt64       := id_people;// RxMemoryDataSaveProv.FieldByName('RxMemDatid_man').Value;
                Class_StoredProc.ParamByName('D_ID_SCH').AsInt64       := RxMemoryDataSaveProv.FieldByName('RxMemDatID_SCH_KORESPOND').Value;
//            Class_StoredProc.ParamByName('D_SUMMA_VALUE').AsDouble := RxMemoryDataSaveProv.FieldByName('RxMemDatsumma_value').Value;
//            Class_StoredProc.ParamByName('D_ID_VALUE').AsInt64     := RxMemoryDataSaveProv.FieldByName('RxMemDatid_value').Value;
                Class_StoredProc.ParamByName('D_KOD_DOG').AsInt64      := RxMemoryDataSaveProv.FieldByName('RxMemDatkod_dog').Value;
                Class_StoredProc.ParamByName('D_ID_USER').AsInt64      := myclass.id_user;
                Class_StoredProc.ParamByName('D_ID_ALL_DOC').AsInt64   := id_all_doc;
                Class_StoredProc.ParamByName('D_ID_KASSA_SCH').AsInt64 := RxMemoryDataSaveProv.FieldByName('RxMemDatid_sch').Value;
                Class_StoredProc.ParamByName('D_ID_PROV').AsInt64      := RxMemoryDataSaveProv.FieldByName('RxMemDatid_all_prov').Value;
                Class_StoredProc.ParamByName('D_TODAY').AsDate         := cxDateEditAo.Date;
                Class_StoredProc.ParamByName('D_PRIHOD').AsInteger     := myform.prihod;
                Class_StoredProc.ParamByName('IS_M').AsInteger         := RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldMain').Value;
                Class_StoredProc.ExecProc;
                RxMemoryDataSaveProv.Next;
            end;



           Class_DataSet.Close;
            if (cxCheckBoxKom.Checked) then
                Class_DataSet.SQLs.SelectSQL.Text := 'select * from J4_DT_AO_ADD('+IntToStr(id_people)+', ''' + cxEditNumber2.Text+''', ''' + cxDateEditAo.Text + ''', ''' + StringReplace(cxTextEditSumma.Text,',','.',[]) + ''', '''+cxMemoNote.Text+''', '+IntToStr(myform.prihod)+', ' + IntToStr(id_all_doc) +', ' + IntToStr(myform.id_system) + ', '+intToStr(myclass.id_user) + ', 1, ''' + cxDateEditFrom.text + ''', ''' + cxDateEditTo.text + ''', ' +inttostr(kod_sch_ao)+ ')'
            else
                Class_DataSet.SQLs.SelectSQL.Text := 'select * from J4_DT_AO_ADD('+IntToStr(id_people)+', ''' + cxEditNumber2.Text+''', ''' + cxDateEditAo.Text + ''', ''' + StringReplace(cxTextEditSumma.Text,',','.',[]) + ''', '''+cxMemoNote.Text+''', '+IntToStr(myform.prihod)+', ' + IntToStr(id_all_doc) +', ' + IntToStr(myform.id_system) + ', '+intToStr(myclass.id_user) + ', null, null, null, ' +inttostr(kod_sch_ao)+ ')';
            Class_DataSet.Open;

            flag_exist_num := Class_DataSet.FieldByName('EXIST_NUM').AsInteger;
            id_ao := StrToInt64(Class_DataSet.FieldByName('R_ID').AsString);
            Class_DataSet.Close;

            if(flag_exist_num=1) then
            begin
                showmessage(Un_R_file_Alex.J4_EXIST_NUM_AO);
                exit;
            end;
            //добавление расшифровок

            if ras = 1 then
            begin
                if not RxMemoryDataRas.IsEmpty then
                begin
                    RxMemoryDataRas.First;
                    while not RxMemoryDataRas.Eof do
                    begin
                        Class_StoredProc.StoredProcName:='J4_DT_AO_RASPREDELENIE_ADD';
                        Class_StoredProc.Prepare;
                        Class_StoredProc.ParamByName('D_N_PP').AsInteger    := RxMemoryDataRas.FieldByName('RxMemoryDataNumber').AsInteger;
                        Class_StoredProc.ParamByName('D_SUMMA').AsDouble    := RxMemoryDataRas.FieldByName('RxMemoryDataSumma').AsFloat;
                        Class_StoredProc.ParamByName('D_ID_RASP').AsInt64   := RxMemoryDataRas.FieldByName('RxMemoryDataId').AsVariant;
                        Class_StoredProc.ParamByName('D_ID_AO').AsInt64     := id_ao;
                        Class_StoredProc.ParamByName('D_ID_PROV').AsInt64   := RxMemoryDataRas.FieldByName('id_prov').Value;
                        Class_StoredProc.ExecProc;
                        RxMemoryDataRas.Next;
                    end;
                end;
            end;
            STRU.DBHANDLE      := myform.DatabaseMain.Handle;
            STRU.TRHANDLE      := Class_Transaction_Wr.Handle;
            STRU.KERNEL_ACTION := 1;
            STRU.KEY_SESSION   := id_session;
            STRU.WORKDATE      := cxDateEditAo.Date;
            STRU.ID_USER       := myclass.id_user;
            try
                DoResult:=Kernel.KernelDo(@STRU);
            except on E:Exception do
                begin
                    ShowMessage(Un_R_file_Alex.MY_ERROR_KERNELL+E.Message);
                    DecimalSeparator := ',';
                    if delete_buff = 1 then
                    begin
                         DelBuffer(id_session);
                    end;
                    Class_Transaction_Wr.Rollback;
                    exit;
                end;
            end;
            if DoResult then
            begin
                DecimalSeparator := ',';
                if delete_buff = 1 then
                begin
                    DelBuffer(id_session);
                end;
                Class_Transaction_Wr.Commit;
                myform.ActionRefreshExecute(self);
                Myform.DataSetMain.Locate('ID_AO', id_ao, []);
                close;
            end
            else begin
                PageControl1.ActivePage := TabSheet1;
                PageControl2.ActivePage := TabSheet5;
                cxSplitter1.OpenSplitter;
                cxMemo2.Lines.Clear;
                cxMemo2.Lines.Insert(0, Un_R_file_Alex.MY_DOC_ERROR_KERNELL);
                ErrorList:=Kernel.GetDocErrorsList(@STRU);
                if ErrorList<>nil then for i:=0 to  ErrorList.Count-1 do cxMemo2.Lines.Insert(0, Un_R_file_Alex.MY_MESSAGE_ERROR +' '+ErrorList.Strings[i]);

                DataSetError.Close;
                DataSetError.SelectSQL.Text :='SELECT * FROM KASSA_SELECT_ERROR_PROVS('+IntToStr(STRU.KEY_SESSION)+')';
                DataSetError.Open;
                DataSetError.First;
                RxError.EmptyTable;
                while not DataSetError.Eof do
                begin
                    RxError.Open;
                    RxError.Insert;
                    RxError.FieldByName('Rxkod').Value  := DataSetError['ID_ERROR'];
                    RxError.FieldByName('RxName').Value := DataSetError['ERROR_MESSAGE'];
                    RxError.Post;
                    DataSetError.Next;
                end;
                DecimalSeparator := ',';
                //Class_Transaction_Wr.Commit;
                if delete_buff = 1 then
                begin
                    DelBuffer(id_session);
                end;
                Class_Transaction_Wr.Rollback;
                exit;
            end;
        except on E:Exception do begin
            DecimalSeparator := ',';
            if delete_buff = 1 then
            begin
                DelBuffer(id_session);
            end;
            Class_Transaction_Wr.Rollback;
            ShowMessage(E.Message);
            exit;
        end
        end;
    end else
    begin
        Result := false;
        exit;
    end;
end;

procedure TfmAddChangeAvance.cxTextEditSummaExit(Sender: TObject);
var
    pr : integer;
begin
    pr := 1;
    cxTextEditSumma.Text := AddNol(cxTextEditSumma.Text, pr);
    if pr = -1 then
    begin
        ShowMessage(Un_R_file_Alex.MY_ERROR_SUMMA_LENGTH);
    end;
end;

procedure TfmAddChangeAvance.ActionShowAllExecute(Sender: TObject);
begin
    flag_na_aftoscroll := false;
    RxMemoryDataSaveProv.First;
    while not RxMemoryDataSaveProv.Eof do
    begin
        showmessage('summa - '      + RxMemoryDataSaveProv.FieldByName('RxMemDat_summa').Asstring           + #13 +
                    'id_sm - '      + RxMemoryDataSaveProv.FieldByName('RxMemDatid_sm').Asstring            + #13 +
                    'id_razd - '    + RxMemoryDataSaveProv.FieldByName('RxMemDatid_razd').Asstring          + #13 +
                    'id_st - '      + RxMemoryDataSaveProv.FieldByName('RxMemDatid_st').Asstring            + #13 +
                    'id_kekv - '    + RxMemoryDataSaveProv.FieldByName('RxMemDatid_kekv').Asstring          + #13 +
                    'id_dog - '     + RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveId_Dog').Asstring   + #13 +
                    'kod_dog - '    + RxMemoryDataSaveProv.FieldByName('RxMemDatkod_dog').Asstring          + #13 +
                    'id_sch - '     + RxMemoryDataSaveProv.FieldByName('RxMemDatid_sch').Asstring           + #13 +
                    'id_kor_sch - ' + RxMemoryDataSaveProv.FieldByName('RxMemDatID_SCH_KORESPOND').Asstring + #13 +
                    'id_man - '     + RxMemoryDataSaveProv.FieldByName('RxMemDatid_man').Asstring           + #13
//                    'id_rate - ' + IntToStr(id_rate)+#13+
//                    'id_rate_n - ' +IntToStr(id_rate_n)+#13+
 //                   'id_customer - ' +IntToStr(id_customer)
                    );
        RxMemoryDataSaveProv.Next;
    end;
    flag_na_aftoscroll := true;
end;

procedure TfmAddChangeAvance.DelBuffer(id_s : int64);
begin
    Class_StoredProc.StoredProcName:='KERNEL_CLEAR_TMP'; //удаление
    Class_StoredProc.Prepare;
    Class_StoredProc.ParamByName('KEY_SESSION').AsInt64  := id_s;
    Class_StoredProc.ExecProc;
end;

procedure TfmAddChangeAvance.cxCheckBoxKomClick(Sender: TObject);
begin
    if  cxCheckBoxKom.Checked then
    begin
        Panel5.Visible             := true;
        cxDateEditFrom.Visible     := true;
        cxDateEditTo.Visible       := true;
        cxLabelFrom.Visible        := true;
        cxLabelTo.Visible          := true;
    end else
    begin
        Panel5.Visible             := false;
        cxDateEditFrom.Visible     := false;
        cxDateEditTo.Visible       := false;
        cxLabelFrom.Visible        := false;
        cxLabelTo.Visible          := false;
        //cxDateEnd.Date := date;
    end;
end;

procedure TfmAddChangeAvance.ButtonEditTypeDocPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  ViewForm : TfmSelectTypeDoc;
begin
    viewform                         := TfmSelectTypeDoc.Create(Self);
    viewform.Database                := database;
    viewform.Trans.DefaultDatabase   := viewform.Database;
    viewform.DSetTypeDoc.Transaction := viewform.Trans;
    viewform.DSetTypeDoc.Close;
    viewform.DSetTypeDoc.SelectSQL.Text := 'select * from J4_SP_TYPE_DOC_FOR_CR_AV_O_SEL';
    viewform.DSetTypeDoc.Open;
    viewform.cxGrid1DBTableView1.DataController.DataSource := ViewForm.DSourceTypeDoc;
    viewform.ShowModal;

    if (viewform.ModalResult = mrok)then
    begin
      id_type_doc            := StrToInt64(viewform.DSetTypeDoc.fbn('id_type_doc').AsString);
      name_type_doc          := viewform.DSetTypeDoc['name_type_doc_for_create_av_o'];
      ButtonEditTypeDoc.Text := name_type_doc;
    end;
end;

end.


