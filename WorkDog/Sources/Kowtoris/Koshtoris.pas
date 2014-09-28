unit Koshtoris;
                                                 
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxCurrencyEdit,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxMemo, cxGridTableView,
  cxTL, Buttons, ExtCtrls, Mask, ToolEdit, CurrEdit, cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxDropDownEdit, cxCalendar, cxContainer,
  cxMaskEdit, LoadDogManedger, dogLoaderUnit, FIBDatabase, pFIBDatabase, iBase,
  FIBDataSet, pFIBDataSet, ActnList, RxMemDS, dxStatusBar, FIBQuery,
  pFIBQuery, pFIBStoredProc, cxButtonEdit,uCommonSp, Accmgmt, AArray, LoaderUnit;

resourcestring
    errDtNotNumber = 'Номер договору не заповнен!';
    errDtNotKontragent = 'Виберіть контрагента!';
    errDtNotDonnu = 'Виберіть рахунок!';
    errDtNotNote = 'Підстава договору не заповнена!';
    errDtKritDate = 'Некоректно введена критична дата оплати!';
    errNotSmet = 'Необхідно додати кошторис!';

type
  TFrmKoshtoris = class(TForm)
    Panel1: TPanel;
    Label4: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label1: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label27: TLabel;
    Bevel1: TBevel;
    cxMaskEdit_n_dog: TcxMaskEdit;
    cxDateEdit_dog: TcxDateEdit;
    cxTextEdit_reg_nomer: TcxTextEdit;
    GroupBox6: TGroupBox;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn_smeta: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Panel2: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label13: TLabel;
    Label25: TLabel;
    Bevel2: TBevel;
    CurrencyEdit_nds: TCurrencyEdit;
    CurrencyEdit_sum_vipol: TCurrencyEdit;
    CurrencyEdit_sum_opl: TCurrencyEdit;
    cxMemo_dog_note: TcxMemo;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label24: TLabel;
    cxTextEdit_mfo_p: TcxTextEdit;
    cxTextEdit_rsch_p: TcxTextEdit;
    cxTextEdit_bank_p: TcxTextEdit;
    cxTextEdit_name_p: TcxTextEdit;
    cxButton_ok: TcxButton;
    cxButton_cancel: TcxButton;
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
    pFIBDatabase_ksh: TpFIBDatabase;
    pFIBDataSet_id_dokument_ksh: TpFIBDataSet;
    pFIBTransactionRead_ksh: TpFIBTransaction;
    Label6: TLabel;
    CurrencyEdit_sum_doc: TCurrencyEdit;
    pFIBDataSet_smet_ksh: TpFIBDataSet;
    DataSource: TDataSource;
    ActionList1: TActionList;
    save: TAction;
    save1: TAction;
    Panel4: TPanel;
    ToolButton_add: TSpeedButton;
    ToolButton_del: TSpeedButton;
    RxMemoryData_smet: TRxMemoryData;
    pFIBStoredProc_dt_add_ksh: TpFIBStoredProc;
    pFIBTransactionWrite_ksh: TpFIBTransaction;
    cxButton_predopl: TcxButton;
    Panel3: TPanel;
    cxTextEdit_kol_vo_smet: TcxTextEdit;
    CurrencyEdit_sum_po_smet: TCurrencyEdit;
    DataSet_rate: TpFIBDataSet;
    SpeedButton_red: TSpeedButton;
    edit: TAction;
    ins: TAction;
    dxStatusBar1: TdxStatusBar;
    Label12: TLabel;
    Label26: TLabel;
    cxButtonEdit_otd: TcxButtonEdit;
    del: TAction;
    SpecificationButton: TcxButton;
    TransactionSpec: TpFIBTransaction;
    Label9: TLabel;
    ClassEdit: TcxButtonEdit;
    lbSumSpec: TLabel;
    SumSpecEdit: TCurrencyEdit;
    SumNdsSpecEdit: TCurrencyEdit;
    lbSumNdsSpec: TLabel;
    pFIBQuery1: TpFIBQuery;
    cxButton1: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure cxButton_cancelClick(Sender: TObject);
    procedure cxButton_okClick(Sender: TObject);
    procedure pFIBDataSet_smet_kshAfterScroll(DataSet: TDataSet);
    procedure saveExecute(Sender: TObject);
    procedure save1Execute(Sender: TObject);
    procedure ToolButton_addClick(Sender: TObject);
    procedure ToolButton_delClick(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure RxMemoryData_smetAfterPost(DataSet: TDataSet);
    procedure RxMemoryData_smetAfterDelete(DataSet: TDataSet);
    procedure CurrencyEdit_sum_po_smetChange(Sender: TObject);
    procedure cxButton_predoplClick(Sender: TObject);
    procedure Label15Click(Sender: TObject);
    procedure Label14Click(Sender: TObject);
    procedure Label15MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label14MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure Label6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label6Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure RxMemoryData_smetAfterScroll(DataSet: TDataSet);
    procedure SpeedButton_redClick(Sender: TObject);
    procedure editExecute(Sender: TObject);
    procedure insExecute(Sender: TObject);
    procedure Label12Click(Sender: TObject);
    procedure cxButtonEdit_depPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure delExecute(Sender: TObject);
    procedure SpecificationButtonClick(Sender: TObject);
    procedure ClassEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton1Click(Sender: TObject);
  private
    fProc : TResProc;
    procedure SumNds();
    procedure SummaDoc(); //считает сумму документа
    procedure Summa(); //считает сумму документа
    procedure SumToSmet(); // сумма, допустимая к разбивке
    { Private declarations }
  public
    Priznak_vizova: String;
    id_otdel: Integer;
    id_class: Integer;
    spec_changed : integer;
    { Public declarations }
    constructor Create (Aowner:TComponent; DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle; id_dokument:
                      Variant; Pr_vizova: String; Id_t_d: Variant); overload;
  end;

function LoadShablon(Aowner: TComponent; DBHANDLE : TISC_DB_HANDLE; frmStyle:TFormStyle;id_dokument: Variant;
                 Pr_vizova: String; Id_t_d: Variant; proc : TResProc):Variant;stdcall;
exports LoadShablon;


var
  FrmKoshtoris: TFrmKoshtoris;
    kod_dog: Int64;
    id_dog, id_dog_pos : Int64;
    summa_to_smet: Currency;
    comment : String;
    ID_Dog_for_spec:Int64;

implementation
uses
  Registry;

{$R *.dfm}

constructor TFrmKoshtoris.Create(Aowner:TComponent ;DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle; id_dokument: Variant;
                               Pr_vizova: String; Id_t_d: Variant);
var
  i: Integer;
  Str:String;
  DataSetNPredopl: TpFIBDataSet;
  DataSetSumKosht: TpFIBDataSet;
begin
  inherited Create (Aowner);
  FormStyle := frmStyle;
  pFIBDatabase_ksh.Handle := DBHANDLE;
  Priznak_vizova := pr_vizova;
  cxDateEdit_dog.Date := Date;
  id_dog := id_dokument;
  ID_Dog_for_spec:= id_dokument;


   if fibCheckPermission('/ROOT/DOG/TIP_DOG/KOSHT', 'Add') <> 0 then ToolButton_add.Enabled := true;
   if fibCheckPermission('/ROOT/DOG/TIP_DOG/KOSHT', 'Del') <> 0 then ToolButton_del.Enabled := true;
   if fibCheckPermission('/ROOT/DOG/TIP_DOG/KOSHT', 'Edit') <> 0 then SpeedButton_red.Enabled := true;

   pFIBDataSet_id_dokument_ksh.Active := false;
   Str:=pFIBDataSet_id_dokument_ksh.SQLs.SelectSQL.Text;
   pFIBDataSet_id_dokument_ksh.SQLs.SelectSQL.Text :='select dog_sel_num_urzb_by_id_dog.id_urzb as NUM_URZB from dog_sel_num_urzb_by_id_dog('+IntToStr(kod_dog)+')';
   pFIBDataSet_id_dokument_ksh.Active := true;

   if  not(pFIBDataSet_id_dokument_ksh.IsEmpty) then  Caption:=Caption+'( № Юридичного зобо'+''''+'язання '+VarToStr(pFIBDataSet_id_dokument_ksh.FBN('NUM_URZB').AsVariant)+')';
   pFIBDataSet_id_dokument_ksh.Active := false;
   pFIBDataSet_id_dokument_ksh.SQLs.SelectSQL.Text:=Str;


  pFIBDataSet_id_dokument_ksh.Active := false;
  pFIBDataSet_id_dokument_ksh.ParamByName('d_id_dog_vx').AsInt64 := id_dokument;
  pFIBDataSet_id_dokument_ksh.Transaction.StartTransaction;
  pFIBDataSet_id_dokument_ksh.Active := true;

  if  not VarIsNull(pFIBDataSet_id_dokument_ksh.FBN('d_comment').AsVariant) then
  comment := pFIBDataSet_id_dokument_ksh.FBN('d_comment').asstring else
  comment := '';

  DataSetNPredopl := TpFIBDataSet.Create(Self);
  DataSetNPredopl.Database := pFIBDatabase_ksh;
  DataSetNPredopl.Transaction := pFIBTransactionRead_ksh;
  DataSetNPredopl.SQLs.SelectSQL.Text := 'select t.id_tip_dog, t.tip_dog from dog_dt_group_doc g, pub_sp_tip_dog t, dog_group_tip_dog gt, dog_ini_def_group i ' +
                                         'where  i.id_group=g.id_group_doc and i.id=7 and g.id_group_doc=gt.id_group_doc and t.id_tip_dog=gt.id_tip_dog ' +
                                         'and gt.value_group=1';
  DataSetNPredopl.Active := true;

 if fibCheckPermission('/ROOT/DOG/TIP_DOG/' + DataSetNPredopl.FBN('TIP_DOG').AsString,'Add') <> 0 then cxButton_predopl.Visible := true;
  DataSetNPredopl.Free;
{<---------------------------------------------------------------------------->}
{
 Изменено: Герасименко Роман Вячеславович
 Добавлено: Свзяь с классификатором продукции (добавление)
}
{<---------------------------------------------------------------------------->}
  if (pr_vizova = 'add') then
  begin
    cxButton_predopl.Enabled := false;
    Caption := 'Додання кошторису';

    kod_dog := id_dokument; //код дог кошториса
    cxTextEdit_name_p.Text := pFIBDataSet_id_dokument_ksh.FieldByName('d_name_customer_k').AsString;
    cxTextEdit_mfo_p.Text := pFIBDataSet_id_dokument_ksh.FieldByName('D_MFO_K').AsString;
    cxTextEdit_bank_p.Text := pFIBDataSet_id_dokument_ksh.FieldByName('D_BANK_NAME_K').AsString;
    cxTextEdit_rsch_p.Text := pFIBDataSet_id_dokument_ksh.FieldByName('D_RSCH_K').AsString;

   //если прислана сумма и стоят параметры по умолчанию, то записываем все в грид
     if (pFIBDataSet_id_dokument_ksh.FBN('use_def_values').AsInteger=1) and
       (pFIBDataSet_id_dokument_ksh.FBN('use_def_kekv').AsInteger=1) then
      begin
       //подставляем сумму кошториса равную сумма договора - сумма по всем кошторисам
        DataSetSumKosht := TpFIBDataSet.Create(Self);
        DataSetSumKosht.Database := pFIBDatabase_ksh;
        DataSetSumKosht.Transaction := pFIBTransactionRead_ksh;

        DataSetSumKosht.SQLs.SelectSQL.Text := 'select sum(d.summa) from dog_dt_document d ' +
                                              'where  d.kod_dog=:kod_dog and d.dog_close=0 ' +
                                              'and    d.use_end=''31.12.9999''and  d.id_dog<>d.kod_dog and id_dog<>:id_dog';
        DataSetSumKosht.ParamByName('kod_dog').AsInt64 := pFIBDataSet_id_dokument_ksh['kod_dog'];
        DataSetSumKosht.ParamByName('id_dog').AsInt64 := id_dokument;
        DataSetSumKosht.Active := true;

        RxMemoryData_smet.Open;
        RxMemoryData_smet.Insert;
        RxMemoryData_smet.FieldByName('id_smet').Value := pFIBDataSet_id_dokument_ksh.FBN('def_smeta').AsInteger;
        RxMemoryData_smet.FieldByName('id_razd').Value := pFIBDataSet_id_dokument_ksh.FBN('def_razd').AsInteger;
        RxMemoryData_smet.FieldByName('id_stat').Value := pFIBDataSet_id_dokument_ksh.FBN('def_stat').AsInteger;
        RxMemoryData_smet.FieldByName('sum_smet').Value := pFIBDataSet_id_dokument_ksh.FBN('d_summa').AsCurrency - DataSetSumKosht.FBN('sum').AsCurrency;
        RxMemoryData_smet.FieldByName('name_smet').Value := pFIBDataSet_id_dokument_ksh.FBN('smeta_title').AsString;
        RxMemoryData_smet.FieldByName('name_razd').Value := pFIBDataSet_id_dokument_ksh.FBN('razd_title').AsString;
        RxMemoryData_smet.FieldByName('name_stat').Value := pFIBDataSet_id_dokument_ksh.FBN('st_title').AsString;
        RxMemoryData_smet.FieldByName('kod_smety').Value := pFIBDataSet_id_dokument_ksh.FBN('smeta_kod').AsInteger;
        RxMemoryData_smet.FieldByName('n_razd').Value := pFIBDataSet_id_dokument_ksh.FBN('razd_kod').AsInteger;
        RxMemoryData_smet.FieldByName('n_stat').Value := pFIBDataSet_id_dokument_ksh.FBN('st_kod').AsInteger;
        RxMemoryData_smet.FieldByName('id_kekv').Value := pFIBDataSet_id_dokument_ksh.FBN('def_kekv').AsInteger;
        RxMemoryData_smet.FieldByName('kod_kekv').Value := pFIBDataSet_id_dokument_ksh.FBN('kekv_kode').AsInteger;
        RxMemoryData_smet.FieldByName('name_kekv').Value := pFIBDataSet_id_dokument_ksh.FBN('kekv_title').AsString;
        RxMemoryData_smet.FieldByName('id').Value := 0;
        RxMemoryData_smet.FieldByName('flag_del').Value := 0;
        RxMemoryData_smet.Post;
        CurrencyEdit_sum_doc.Value := pFIBDataSet_id_dokument_ksh.FBN('d_summa').AsCurrency - DataSetSumKosht.FBN('sum').AsCurrency;
        SumNds();
        cxDateEdit_dog.Date := pFIBDataSet_id_dokument_ksh.FBN('d_d_dog').AsDateTime;
        cxMaskEdit_n_dog.Text := pFIBDataSet_id_dokument_ksh.FBN('d_n_dog').AsString;
        cxMemo_dog_note.Text := pFIBDataSet_id_dokument_ksh.FBN('d_dog_note').AsString;

        DataSetSumKosht.Active := false;
        DataSetSumKosht.Free;
      end;

  end;
{<---------------------------------------------------------------------------->}
{
 Изменено: Герасименко Роман Вячеславович
 Добавлено: Свзяь с классификатором продукции (добавление)
}
{<---------------------------------------------------------------------------->}
  if (pr_vizova = 'prosmotr') then
  begin
    Caption := 'Перегляд кошторису';
//    cxButton_predopl.Enabled := false;
    cxMaskEdit_n_dog.Text := pFIBDataSet_id_dokument_ksh.FieldByName('D_N_DOG').AsString;
    cxDateEdit_dog.Date   := pFIBDataSet_id_dokument_ksh.FieldByName('D_D_DOG').AsDateTime;
    cxTextEdit_reg_nomer.Text := pFIBDataSet_id_dokument_ksh.FieldByName('D_REGEST_NUM').AsString;
    cxTextEdit_name_p.Text := pFIBDataSet_id_dokument_ksh.FieldByName('d_name_customer_k').AsString;
    cxTextEdit_mfo_p.Text := pFIBDataSet_id_dokument_ksh.FieldByName('D_MFO_K').AsString;
    cxTextEdit_bank_p.Text := pFIBDataSet_id_dokument_ksh.FieldByName('D_BANK_NAME_K').AsString;
    cxTextEdit_rsch_p.Text := pFIBDataSet_id_dokument_ksh.FieldByName('D_RSCH_K').AsString;
    CurrencyEdit_nds.Text := pFIBDataSet_id_dokument_ksh.FieldByName('D_NDS_SUM').AsString;
    CurrencyEdit_sum_po_smet.Text := pFIBDataSet_id_dokument_ksh.FieldByName('D_SUMMA').AsString;
    CurrencyEdit_sum_doc.Text := pFIBDataSet_id_dokument_ksh.FieldByName('D_SUMMA').AsString;
    CurrencyEdit_sum_opl.Text := pFIBDataSet_id_dokument_ksh.FieldByName('D_SUM_PAY').AsString;
    CurrencyEdit_sum_vipol.Text := pFIBDataSet_id_dokument_ksh.FieldByName('D_SUM_FULFIL').AsString;
    cxMemo_dog_note.Text :=  pFIBDataSet_id_dokument_ksh.FieldByName('D_DOG_NOTE').AsString;

//<---------------------------------------------------------------------------->
    id_class := pFIBDataSet_id_dokument_ksh.FBN('D_ID_CLASS').AsInteger;

    pFIBQuery1.SQL.Clear;
    pFIBQuery1.SQL.Text:='SELECT SHIFR from PUB_SP_CLASS WHERE id_ist='+IntToStr(id_class);
    pFIBQuery1.ExecQuery;

    ClassEdit.Text := pFIBQuery1.FieldByName('SHIFR').AsString+'.'+pFIBDataSet_id_dokument_ksh.FBN('NAME_CLASS').AsString;
    cxButtonEdit_otd.Text := pFIBDataSet_id_dokument_ksh.FBN('OTDEL_NAME_FULL').AsString;
//<---------------------------------------------------------------------------->


    pFIBDataSet_smet_ksh.Active := false;
    pFIBDataSet_smet_ksh.ParamByName('id_dog').AsInt64 := id_dokument;
    pFIBDataSet_smet_ksh.Active := true;
    pFIBDataSet_smet_ksh.FetchAll;
    pFIBDataSet_smet_ksh.First;

    for i := 0 to pFIBDataSet_smet_ksh.RecordCount-1 do
    begin
      RxMemoryData_smet.Open;
      RxMemoryData_smet.Insert;
      RxMemoryData_smet.FieldByName('name_kekv').Value := pFIBDataSet_smet_ksh.FieldByName('KEKV_TITLE').AsString;
      RxMemoryData_smet.FieldByName('kod_kekv').Value := pFIBDataSet_smet_ksh.FieldByName('KEKV_KODE').AsInteger;;
      RxMemoryData_smet.FieldByName('name_smet').Value := pFIBDataSet_smet_ksh.FieldByName('SMETA_TITLE').AsVariant;
      RxMemoryData_smet.FieldByName('kod_smety').Value := pFIBDataSet_smet_ksh.FieldByName('SMETA_KOD').AsVariant;
      RxMemoryData_smet.FieldByName('n_razd').Value := pFIBDataSet_smet_ksh.FieldByName('RAZD_KOD').AsVariant;
      RxMemoryData_smet.FieldByName('name_razd').Value := pFIBDataSet_smet_ksh.FieldByName('RAZD_TITLE').AsVariant;
      RxMemoryData_smet.FieldByName('name_stat').Value := pFIBDataSet_smet_ksh.FieldByName('ST_TITLE').AsVariant;
      RxMemoryData_smet.FieldByName('n_stat').Value := pFIBDataSet_smet_ksh.FieldByName('ST_KOD').AsVariant;
      RxMemoryData_smet.FieldByName('sum_smet').Value := pFIBDataSet_smet_ksh.FieldByName('summa').AsVariant;
      RxMemoryData_smet.FieldByName('id').Value := pFIBDataSet_smet_ksh.FieldByName('id_dt_smet_dog').AsVariant;
      RxMemoryData_smet.FieldByName('flag_del').Value := 0;
      RxMemoryData_smet.Post;
      pFIBDataSet_smet_ksh.Next;
    end;

  Panel4.Visible := false;
  cxMaskEdit_n_dog.Properties.ReadOnly := true;
  cxDateEdit_dog.Properties.ReadOnly   := true;
  CurrencyEdit_nds.ReadOnly := true;

  ins.Enabled := false;
  edit.Enabled := false;
  del.Enabled := false;

  dxStatusBar1.Visible := false;
  
  end;

  if (pr_vizova = 'red') then
  begin
    Caption := 'Редагування кошторису';
    cxMaskEdit_n_dog.Text := pFIBDataSet_id_dokument_ksh.FieldByName('D_N_DOG').AsString;
    cxDateEdit_dog.Date   := pFIBDataSet_id_dokument_ksh.FieldByName('D_D_DOG').AsDateTime;
    cxTextEdit_reg_nomer.Text := pFIBDataSet_id_dokument_ksh.FieldByName('D_REGEST_NUM').AsString;
    cxTextEdit_name_p.Text := pFIBDataSet_id_dokument_ksh.FieldByName('d_name_customer_k').AsString;
    cxTextEdit_mfo_p.Text := pFIBDataSet_id_dokument_ksh.FieldByName('D_MFO_K').AsString;
    cxTextEdit_bank_p.Text := pFIBDataSet_id_dokument_ksh.FieldByName('D_BANK_NAME_K').AsString;
    cxTextEdit_rsch_p.Text := pFIBDataSet_id_dokument_ksh.FieldByName('D_RSCH_K').AsString;
    CurrencyEdit_nds.Text := pFIBDataSet_id_dokument_ksh.FieldByName('D_NDS_SUM').AsString;
    CurrencyEdit_sum_po_smet.Text := pFIBDataSet_id_dokument_ksh.FieldByName('D_SUMMA').AsString;
    CurrencyEdit_sum_doc.Text := pFIBDataSet_id_dokument_ksh.FieldByName('D_SUMMA').AsString;
    CurrencyEdit_sum_opl.Text := pFIBDataSet_id_dokument_ksh.FieldByName('D_SUM_PAY').AsString;
    CurrencyEdit_sum_vipol.Text := pFIBDataSet_id_dokument_ksh.FieldByName('D_SUM_FULFIL').AsString;
    cxMemo_dog_note.Text :=  pFIBDataSet_id_dokument_ksh.FieldByName('D_DOG_NOTE').AsString;

    cxButtonEdit_otd.Text := pFIBDataSet_id_dokument_ksh.FBN('OTDEL_NAME_FULL').AsString;
    id_otdel := pFIBDataSet_id_dokument_ksh.FBN('ID_OTDEL').AsInteger;


    id_class := pFIBDataSet_id_dokument_ksh.FBN('D_ID_CLASS').AsInteger;

    pFIBQuery1.SQL.Clear;
    pFIBQuery1.SQL.Text:='SELECT SHIFR from PUB_SP_CLASS WHERE id_ist='+IntToStr(id_class);
    pFIBQuery1.ExecQuery;

    ClassEdit.Text := pFIBQuery1.FieldByName('SHIFR').AsString+'.'+pFIBDataSet_id_dokument_ksh.FBN('NAME_CLASS').AsString;

//    id_class := pFIBDataSet_id_dokument_ksh.FBN('D_ID_CLASS').AsInteger;
//    ClassEdit.Text := pFIBDataSet_id_dokument_ksh.FBN('NAME_CLASS').AsString;
    SumSpecEdit.Value := pFIBDataSet_id_dokument_ksh.FBN('SUM_SPEC').AsCurrency;
    SumNdsSpecEdit.Value := pFIBDataSet_id_dokument_ksh.FBN('SUM_NDS_SPEC').AsCurrency;

    pFIBDataSet_smet_ksh.Active := false;
    pFIBDataSet_smet_ksh.ParamByName('id_dog').asInt64 := id_dog;
    pFIBDataSet_smet_ksh.Active := true;
    pFIBDataSet_smet_ksh.FetchAll;
    pFIBDataSet_smet_ksh.First;
    for i := 0 to pFIBDataSet_smet_ksh.RecordCount-1 do
    begin
      RxMemoryData_smet.Open;         //
      RxMemoryData_smet.Insert;
      RxMemoryData_smet.FieldByName('name_kekv').Value := pFIBDataSet_smet_ksh.FieldByName('KEKV_TITLE').AsString;
      RxMemoryData_smet.FieldByName('kod_kekv').Value := pFIBDataSet_smet_ksh.FieldByName('KEKV_KODE').AsInteger;;
      RxMemoryData_smet.FieldByName('name_smet').Value := pFIBDataSet_smet_ksh.FieldByName('SMETA_TITLE').AsString;
      RxMemoryData_smet.FieldByName('kod_smety').Value := pFIBDataSet_smet_ksh.FieldByName('SMETA_KOD').AsString;
      RxMemoryData_smet.FieldByName('n_razd').Value := pFIBDataSet_smet_ksh.FieldByName('RAZD_KOD').AsInteger;
      RxMemoryData_smet.FieldByName('name_razd').Value := pFIBDataSet_smet_ksh.FieldByName('RAZD_TITLE').AsString;
      RxMemoryData_smet.FieldByName('name_stat').Value := pFIBDataSet_smet_ksh.FieldByName('ST_TITLE').AsString;
      RxMemoryData_smet.FieldByName('n_stat').Value := pFIBDataSet_smet_ksh.FieldByName('ST_KOD').AsInteger;
      RxMemoryData_smet.FieldByName('sum_smet').Value := pFIBDataSet_smet_ksh.FieldByName('summa').AsVariant;
      RxMemoryData_smet.FieldByName('id').Value := pFIBDataSet_smet_ksh.FieldByName('id_dt_smet_dog').AsVariant;
      RxMemoryData_smet.FieldByName('flag_del').Value := 0;
      RxMemoryData_smet.FieldByName('id_smet').Value := pFIBDataSet_smet_ksh.FieldByName('ID_SMETA').AsInteger;
      RxMemoryData_smet.FieldByName('id_razd').Value := pFIBDataSet_smet_ksh.FieldByName('ID_RAZD').AsInteger;
      RxMemoryData_smet.FieldByName('id_stat').Value := pFIBDataSet_smet_ksh.FieldByName('ID_STAT').AsInteger;
      RxMemoryData_smet.FieldByName('id_kekv').Value := pFIBDataSet_smet_ksh.FieldByName('ID_KEKV').AsInteger;
      RxMemoryData_smet.Post;
      pFIBDataSet_smet_ksh.Next;
    end;
    if  (pFIBDataSet_id_dokument_ksh.FieldByName('D_SUM_PAY').Value=pFIBDataSet_id_dokument_ksh.FieldByName('D_SUMMA').Value) then
    cxButton_predopl.Enabled := false;
  end;

end;

function LoadShablon(Aowner: TComponent; DBHANDLE : TISC_DB_HANDLE; frmStyle:TFormStyle;id_dokument: Variant;
                 Pr_vizova: String; Id_t_d: Variant; proc : TResProc):Variant;
var
  ksh: TFrmKoshtoris;
  reg       : TRegistry;
  DataSetOtd: TpFIBDataSet;
begin
//если нормал
  if frmStyle = fsNormal then
  begin

    ksh := TFrmKoshtoris.Create(AOwner, DBHANDLE, frmStyle, id_dokument, Pr_vizova, id_t_d);
    if fibCheckPermission('/ROOT/DOG/SPEC','View') <> 0 then ksh.SpecificationButton.Enabled := true;
    ksh.SpecificationButton.Visible := sys_is_DNEPR;
    ksh.Label9.Visible := sys_is_DNEPR;
    ksh.ClassEdit.Visible := sys_is_DNEPR;
    ksh.SumSpecEdit.Visible := sys_is_DNEPR;
    ksh.SumNdsSpecEdit.Visible := sys_is_DNEPR;
    ksh.lbSumSpec.Visible := sys_is_DNEPR;
    ksh.lbSumNdsSpec.Visible := sys_is_DNEPR;

     if Pr_vizova = 'add' then
       begin
         reg := TRegistry.Create;
         reg.OpenKey(REG_KEY + 'Otdel', true);
         try
           ksh.id_otdel := reg.ReadInteger('id_otdel');
         except
           ksh.id_otdel := 0;
         end;
         reg.Free;

         if ksh.id_otdel > 0 then
         begin
           DataSetOtd := TpFIBDataSet.Create(Nil);
           DataSetOtd.Database    := ksh.pFIBDatabase_ksh;
           DataSetOtd.Transaction := ksh.pFIBTransactionRead_ksh;
           DataSetOtd.SQLs.SelectSQL.Text := 'select * from sp_department d where d.id_department=:id_otdel AND ''NOW'' BETWEEN d.Use_Beg AND d.Use_End';
           DataSetOtd.ParamByName('id_otdel').Value := ksh.id_otdel;
           DataSetOtd.Open;
           ksh.cxButtonEdit_otd.Text := DataSetOtd.FBN('name_full').AsString;
           DataSetOtd.Close;
           DataSetOtd.Free;
         end
         else
         begin
           DataSetOtd := TpFIBDataSet.Create(Nil);
           DataSetOtd.Database    := ksh.pFIBDatabase_ksh;
           DataSetOtd.Transaction := ksh.pFIBTransactionRead_ksh;
           DataSetOtd.SQLs.SelectSQL.Text := 'select d.*, s.local_department from ini_asup_consts s, sp_department d where  s.local_department=d.id_department AND ''NOW'' BETWEEN d.Use_Beg AND d.Use_End';
           DataSetOtd.Open;
           ksh.cxButtonEdit_otd.Text := DataSetOtd.FBN('name_full').AsString;
           ksh.id_otdel := DataSetOtd.FBN('id_department').AsInteger;
           DataSetOtd.Close;
           DataSetOtd.Free;
         end;
     end;

    if  ksh.ShowModal = mrOk then
    begin
      Result := id_dog_pos;
    end;
 ksh.Free;
 end;

//если MDIChild
  if frmStyle = fsMDIChild then
  begin
    ksh := TFrmKoshtoris.Create(AOwner, DBHANDLE, frmStyle, id_dokument, Pr_vizova, id_t_d);
    ksh.Show;
    ksh.fProc := proc;
  end;
end;

procedure TFrmKoshtoris.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SavePositionToRegistry(Self);
  if FormStyle = fsMDIChild then  Action := caFree;
end;

procedure TFrmKoshtoris.FormShow(Sender: TObject);
 var
 Str:string;
begin
  LoadPositionFromRegistry(Self);
  Height := 411;
  Width  := 650;
end;

procedure TFrmKoshtoris.FormResize(Sender: TObject);
begin
//  Panel1.Left := Width div 2 - Panel1.Width div 2 - 6;
//  Panel1.Top := Height div 2 - Panel1.Height div 2 - 18;
end;

procedure TFrmKoshtoris.cxButton_cancelClick(Sender: TObject);
begin
  if spec_changed = 1 then if messagedlg('Увага!', 'Були зміни специфікацій. Скасувати зміни?', mtConfirmation, [mbYes, mbNo]) = mrNo then exit;

  pFIBDataSet_id_dokument_ksh.Active := false;
  pFIBDataSet_smet_ksh.Active := false;
  if TransactionSpec.Active then TransactionSpec.Rollback;
  Close;
end;

procedure TFrmKoshtoris.cxButton_okClick(Sender: TObject);
var
  s: String;
  action : TResAction;
  D_date: TDate;
  s_smet, s_pay, s_doc, temp_sum, s_ful_fil, sum_k_opl: Currency;
  nds: Variant;
  i, j: Integer;
  DataSetChekSum: TpFIBDataSet;
  sum_kosht, sum_dogovor: Currency;
  reg : TRegistry;
begin
   action := raView;

//проверка реквизитов контрагента по дате
//   s := 'SELECT date_beg, date_end FROM   pub_sp_cust_rate_acc WHERE  id_rate_account=:param_id';
   DataSet_rate.Active := false;
//   DataSet_rate.SQLs.SelectSQL.Add(s);
//   DataSet_rate.ParamByName('param_id').Value := pFIBDataSet_id_dokument_ksh.FieldByName('D_ID_RATE_ACCOUNT').AsInteger;

  pFIBDataSet_id_dokument_ksh.Active := false;
  pFIBDataSet_id_dokument_ksh.ParamByName('d_id_dog_vx').AsInt64 := id_dog;
  pFIBDataSet_id_dokument_ksh.Active := true;



   DataSet_rate.SQLs.SelectSQL.Text := 'SELECT date_beg, date_end FROM   pub_sp_cust_rate_acc WHERE  id_rate_account=' + pFIBDataSet_id_dokument_ksh.FieldByName('D_ID_RATE_ACCOUNT').AsString;

   DataSet_rate.Active := true;

   if (Date < DataSet_rate.FieldByName('date_beg').AsDateTime)
   or (DataSet_rate.FieldByName('date_end').AsDateTime < Date) then
   ShowMessage('Счет контрагента не функционирует в данном периоде');
// DataSet_rate.Free;

   //проверка на корректность даты договора
  { if Priznak_vizova = 'add' then
   begin
   action := raAdd;
    if (cxDateEdit_dog.Date > Date) then
    begin
      ShowMessage('Дата не повинна бути більш ніж поточна');
      cxDateEdit_dog.SetFocus;
      Exit;
    end;
   
   
    D_date := Date - VarToDateTime(pFIBDataSet_id_dokument_ksh.FieldByName('D_DATE_D_DOG_DEF').Value);
    if (cxDateEdit_dog.Date < D_date) then
    begin
      ShowMessage('Дата не повинна бути менше ніж'+'  '+DateToStr(D_date));
      cxDateEdit_dog.SetFocus;
      Exit;
    end;
  end;
   }

  s_smet := CurrencyEdit_sum_po_smet.Value;
  s_pay  := CurrencyEdit_sum_opl.Value;
  s_ful_fil := CurrencyEdit_sum_vipol.Value;
  s_doc  := CurrencyEdit_sum_doc.Value;

  if (s_smet<>s_doc) then
  begin
    ShowMessage('Сума по кошторису не дорівнює сумі документа');
    Exit;
  end;
    //проверка на корректность суммы (не должна превышать сумму вышестоящего договора)
  DataSetChekSum := TpFIBDataSet.Create(Self);
  DataSetChekSum.Database := pFIBDatabase_ksh;
  DataSetChekSum.Transaction := pFIBTransactionRead_ksh;

  if Priznak_vizova='add' then
  begin

    DataSetChekSum.SQLs.SelectSQL.Text := 'select sum(d.summa) from dog_dt_document d ' +
                                          'where  d.kod_dog=:kod_dog and d.dog_close=0 ' +
                                          'and    d.use_end=''31.12.9999''and  d.id_dog<>d.kod_dog';
    DataSetChekSum.ParamByName('kod_dog').AsInt64 := id_dog;
    DataSetChekSum.Active := true;
    sum_kosht := DataSetChekSum.FBN('sum').AsCurrency;
    DataSetChekSum.Active := false;
    sum_dogovor := pFIBDataSet_id_dokument_ksh.FBN('D_SUMMA').AsCurrency;
  end
  else
  begin
    DataSetChekSum.SQLs.SelectSQL.Text := 'select sum(d.summa) from dog_dt_document d ' +
                                          'where  d.kod_dog=:kod_dog and d.dog_close=0 ' +
                                          'and    d.use_end=''31.12.9999''and  d.id_dog<>d.kod_dog and id_dog<>:id_dog';
    DataSetChekSum.ParamByName('kod_dog').AsInt64 := pFIBDataSet_id_dokument_ksh['kod_dog'];
    DataSetChekSum.ParamByName('id_dog').AsInt64 := id_dog;
    DataSetChekSum.Active := true;
    sum_kosht := DataSetChekSum.FBN('sum').AsCurrency;
    DataSetChekSum.Active := false;

    DataSetChekSum.SQLs.SelectSQL.Text := 'select summa from dog_dt_document where id_dog=:param and id_dog<>:id_dog';
    DataSetChekSum.ParamByName('param').AsInt64 := pFIBDataSet_id_dokument_ksh['kod_dog'];
    DataSetChekSum.Active := true;
    sum_dogovor := DataSetChekSum.FBN('summa').AsCurrency;
    DataSetChekSum.Active := false;
  end;

    if (sum_kosht + s_doc > sum_dogovor) then
    begin
      ShowMessage('Сума по кошторисам перевищує суму договору.');
      Exit;
    end;
  DataSetChekSum.Free;

    // проверка на заполнение номера договора
  if  Trim(cxMaskEdit_n_dog.Text) = '' then
      begin
      MessageDlg('Увага', errDtNotNumber, mtError, [mbOk]);
      cxMaskEdit_n_dog.SetFocus;
      Exit;
  end;

       //проверка на заполнение смет
   if s_doc <> s_pay then
   begin
     if Trim(CurrencyEdit_sum_po_smet.Text) = '' then
     begin
       MessageDlg('Увага', errNotSmet, mtError, [mbOk]);
       Exit;
     end;
   end;

       // проверка на заполнение контрагента
  if  Trim(cxTextEdit_name_p.Text) = '' then
      begin
      MessageDlg('Увага', errDtNotKontragent, mtError, [mbOk]);
      cxTextEdit_name_p.SetFocus;
      Exit;
  end;

     //проверка на заполнение основания
  if Trim(cxMemo_dog_note.Text) = '' then
    begin
      MessageDlg('Увага', errDtNotNote, mtError, [mbOk]);
      cxMemo_dog_note.SetFocus;
      Exit;
    end;

    //проверка НДС
  if CurrencyEdit_nds.Text = '' then
  begin
    nds := 0;
  end
  else
  begin
    nds := StrToCurr(CurrencyEdit_nds.Text);
    if nds > s_doc then
    begin
      ShowMessage('ПДВ не може превищувати суму документа');
      CurrencyEdit_nds.SetFocus;
      Exit;
    end;
  end;


if (Priznak_vizova = 'add')  then
  begin
    action := raAdd;
    pFIBTransactionWrite_ksh.StartTransaction;
    pFIBStoredProc_dt_add_ksh.StoredProcName := 'DOG_DT_DOCUMENT_INSERT';
    pFIBStoredProc_dt_add_ksh.Prepare;
    pFIBStoredProc_dt_add_ksh.ParamByName('D_KOD_DOG').AsInt64 := id_dog;
    
    pFIBStoredProc_dt_add_ksh.ParamByName('D_N_DOG').Value := cxMaskEdit_n_dog.Text;
    pFIBStoredProc_dt_add_ksh.ParamByName('D_D_DOG').Value := cxDateEdit_dog.Date;

    if Trim(CurrencyEdit_sum_doc.Text) = '' then
    pFIBStoredProc_dt_add_ksh.ParamByName('D_SUMMA').Value := 0 else
    pFIBStoredProc_dt_add_ksh.ParamByName('D_SUMMA').Value := CurrencyEdit_sum_doc.Text;

    if Trim(cxMemo_dog_note.Text) = '' then
    pFIBStoredProc_dt_add_ksh.ParamByName('D_DOG_NOTE').Value := '' else
    pFIBStoredProc_dt_add_ksh.ParamByName('D_DOG_NOTE').Value := Trim(cxMemo_dog_note.Text);

    if Trim(CurrencyEdit_nds.Text) = '' then
    pFIBStoredProc_dt_add_ksh.ParamByName('D_NDS_SUM').Value := 0 else
    pFIBStoredProc_dt_add_ksh.ParamByName('D_NDS_SUM').Value := CurrencyEdit_nds.Text;

    pFIBStoredProc_dt_add_ksh.ParamByName('D_ID_RATE_ACCOUNT').Value := pFIBDataSet_id_dokument_ksh.FieldByName('D_ID_RATE_ACCOUNT').AsVariant;
    pFIBStoredProc_dt_add_ksh.ParamByName('D_ID_RATE_ACC_NATIVE').Value := pFIBDataSet_id_dokument_ksh.FieldByName('D_ID_RATE_ACC_NATIVE').AsVariant;
    
    pFIBStoredProc_dt_add_ksh.ParamByName('D_ID_CUSTOMER').AsInt64 :=StrToInt64(pFIBDataSet_id_dokument_ksh.FieldByName('D_ID_CUSTOMER').asString);
    pFIBStoredProc_dt_add_ksh.ParamByName('D_NAME_CUSTOMER').Value := pFIBDataSet_id_dokument_ksh.FieldByName('D_NAME_CUSTOMER_K').AsVariant;

    pFIBStoredProc_dt_add_ksh.ParamByName('D_NOT_SUMMA').Value := 0;
    pFIBStoredProc_dt_add_ksh.ParamByName('D_CONTINUE').Value := 0;
    pFIBStoredProc_dt_add_ksh.ParamByName('D_CLOSE').Value := 0;
    pFIBStoredProc_dt_add_ksh.ParamByName('D_ID_TIP_DOG').Value := SYS_ID_SMETA;

    pFIBStoredProc_dt_add_ksh.ParamByName('D_SUM_OPL').Value := 0;
    pFIBStoredProc_dt_add_ksh.ParamByName('d_sum_pay').Value := 0;
    pFIBStoredProc_dt_add_ksh.ParamByName('D_NDS_PAY').Value := 0;
    pFIBStoredProc_dt_add_ksh.ParamByName('D_SUM_FULFIL').Value := 0;
    pFIBStoredProc_dt_add_ksh.ParamByName('D_ID_USER').Value := SYS_ID_USER;
    pFIBStoredProc_dt_add_ksh.ParamByName('D_IP_COMP').Value := GetIPAddress;
    pFIBStoredProc_dt_add_ksh.ParamByName('D_NAME_COMP').Value := GetCompName;
    pFIBStoredProc_dt_add_ksh.ParamByName('D_COMMENT').Value := comment;
    pFIBStoredProc_dt_add_ksh.ParamByName('D_ID_OTDEL').Value := id_otdel;

    pFIBStoredProc_dt_add_ksh.ParamByName('D_ID_CLASS').Value := id_class;

    try
      pFIBStoredProc_dt_add_ksh.ExecProc;
    except  on e:Exception do
      begin
        ShowMessage(e.Message);
        pFIBTransactionWrite_ksh.Rollback;
        Exit;
      end;
    end;
      id_dog_pos := pFIBStoredProc_dt_add_ksh.FieldByName('VIX_ID_DOG').AsInt64;

    // Добавление сметы
      RxMemoryData_smet.First;
      for i := 0 to RxMemoryData_smet.RecordCount-1 do
      begin
         if (RxMemoryData_smet.FieldByName('flag_del').Value = 1) then
           begin
             RxMemoryData_smet.Next;
           end
           else
           begin
               pFIBStoredProc_dt_add_ksh.StoredProcName := 'DOG_DT_SMET_INSERT';
               pFIBStoredProc_dt_add_ksh.Prepare;
               pFIBStoredProc_dt_add_ksh.ParamByName('D_ID_DOG').AsInt64 := id_dog_pos;
               pFIBStoredProc_dt_add_ksh.ParamByName('D_ID_SMETA').Value := RxMemoryData_smet.FieldByName('id_smet').Value;
               pFIBStoredProc_dt_add_ksh.ParamByName('D_RAZD').Value := RxMemoryData_smet.FieldByName('id_razd').Value;
               pFIBStoredProc_dt_add_ksh.ParamByName('D_ID_STAT').Value := RxMemoryData_smet.FieldByName('id_stat').Value;
               pFIBStoredProc_dt_add_ksh.ParamByName('D_SUMMA_SM').Value := RxMemoryData_smet.FieldByName('sum_smet').Value;
               pFIBStoredProc_dt_add_ksh.ParamByName('D_ID_KEKV').Value := RxMemoryData_smet.FieldByName('id_kekv').Value;
               pFIBStoredProc_dt_add_ksh.ParamByName('D_ID_CLASS').Value := id_class;

               try
                 pFIBStoredProc_dt_add_ksh.ExecProc;
                 except on e: Exception do
                 begin
                   ShowMessage(e.Message);
                   pFIBTransactionWrite_ksh.Rollback;
                   Exit;
                 end;
               end;
               RxMemoryData_smet.Next;
           end;
      end;
    pFIBTransactionWrite_ksh.Commit;
    Close;
  end
  else
  if (Priznak_vizova = 'red') then
  begin
    action := raEdit;
    pFIBTransactionWrite_ksh.StartTransaction;
    pFIBStoredProc_dt_add_ksh.StoredProcName := 'DOG_DT_DOCUMENT_UPDATE';
    pFIBStoredProc_dt_add_ksh.Prepare;
    pFIBStoredProc_dt_add_ksh.ParamByName('D_ID_DOG').AsInt64 := id_dog;

    pFIBStoredProc_dt_add_ksh.ParamByName('D_N_DOG').Value := cxMaskEdit_n_dog.Text;
    pFIBStoredProc_dt_add_ksh.ParamByName('D_D_DOG').Value := cxDateEdit_dog.Date;

    if Trim(CurrencyEdit_sum_doc.Text) = '' then
    pFIBStoredProc_dt_add_ksh.ParamByName('D_SUMMA').Value := 0 else
    pFIBStoredProc_dt_add_ksh.ParamByName('D_SUMMA').Value := CurrencyEdit_sum_doc.Text;

    if Trim(cxMemo_dog_note.Text) = '' then
    pFIBStoredProc_dt_add_ksh.ParamByName('D_DOG_NOTE').Value := '' else
    pFIBStoredProc_dt_add_ksh.ParamByName('D_DOG_NOTE').Value := Trim(cxMemo_dog_note.Text);

    if Trim(CurrencyEdit_nds.Text) = '' then
    pFIBStoredProc_dt_add_ksh.ParamByName('D_NDS_SUM').Value := 0 else
    pFIBStoredProc_dt_add_ksh.ParamByName('D_NDS_SUM').Value := CurrencyEdit_nds.Text;

    pFIBStoredProc_dt_add_ksh.ParamByName('D_ID_RATE_ACCOUNT').Value := pFIBDataSet_id_dokument_ksh.FieldByName('D_ID_RATE_ACCOUNT').AsVariant;
    pFIBStoredProc_dt_add_ksh.ParamByName('D_ID_RATE_ACC_NATIVE').Value := pFIBDataSet_id_dokument_ksh.FieldByName('D_ID_RATE_ACC_NATIVE').AsVariant;

    pFIBStoredProc_dt_add_ksh.ParamByName('D_ID_USER').Value := SYS_ID_USER;
    pFIBStoredProc_dt_add_ksh.ParamByName('D_IP_COMP').Value := GetIPAddress;
    pFIBStoredProc_dt_add_ksh.ParamByName('D_NAME_COMP').Value := GetCompName;
    pFIBStoredProc_dt_add_ksh.ParamByName('D_COMMENT').Value := comment;
    pFIBStoredProc_dt_add_ksh.ParamByName('D_ID_OTDEL').Value := id_otdel;
    
    pFIBStoredProc_dt_add_ksh.ParamByName('D_ID_CLASS').Value := id_class;

    try
      pFIBStoredProc_dt_add_ksh.ExecProc;
    except  on e:Exception do
      begin
        ShowMessage(e.Message);
        pFIBTransactionWrite_ksh.Rollback;
        Exit;
      end;
    end;

   //удаляем все сметы
    pFIBStoredProc_dt_add_ksh.StoredProcName := 'DOG_DT_SMET_DELETE';
    pFIBStoredProc_dt_add_ksh.Prepare;
    pFIBStoredProc_dt_add_ksh.ParamByName('ID_DOG').AsInt64 := id_dog;
    try
      pFIBStoredProc_dt_add_ksh.ExecProc;
    except on e: Exception do
      begin
        ShowMessage(e.Message);
        pFIBTransactionWrite_ksh.Rollback;
        Exit;
      end;
    end;

   //добавляем все сметы, не помеченные к удалению
    RxMemoryData_smet.First;
    for j := 0 to RxMemoryData_smet.RecordCount-1 do
    begin
      if (RxMemoryData_smet.FieldByName('flag_del').Value = 0) then
       begin
         pFIBStoredProc_dt_add_ksh.StoredProcName := 'DOG_DT_SMET_INSERT';
         pFIBStoredProc_dt_add_ksh.Prepare;
         pFIBStoredProc_dt_add_ksh.ParamByName('D_ID_DOG').AsInt64  := id_dog;
         pFIBStoredProc_dt_add_ksh.ParamByName('D_ID_SMETA').Value  := RxMemoryData_smet.FieldByName('id_smet').Value;
         pFIBStoredProc_dt_add_ksh.ParamByName('D_RAZD').Value := RxMemoryData_smet.FieldByName('id_razd').Value;
         pFIBStoredProc_dt_add_ksh.ParamByName('D_ID_STAT').Value := RxMemoryData_smet.FieldByName('id_stat').Value;
         pFIBStoredProc_dt_add_ksh.ParamByName('D_SUMMA_SM').Value := RxMemoryData_smet.FieldByName('sum_smet').Value;
         pFIBStoredProc_dt_add_ksh.ParamByName('D_ID_KEKV').Value := RxMemoryData_smet.FieldByName('id_kekv').Value;
         pFIBStoredProc_dt_add_ksh.ParamByName('D_ID_CLASS').Value := id_class;
         try
           pFIBStoredProc_dt_add_ksh.ExecProc;
         except on e: Exception do
           begin
             ShowMessage(e.Message);
             pFIBTransactionWrite_ksh.Rollback;
             Exit;
           end;
         end;
       end;
       RxMemoryData_smet.Next;
     end;

    pFIBTransactionWrite_ksh.Commit;
    Close;
    end;

  if TransactionSpec.Active then TransactionSpec.Commit;
  ModalResult := mrOk;
  if Assigned(fProc) then fProc(id_dog, action);

  //запись в реестр последнего id_department
  reg := TRegistry.Create;
  reg.OpenKey(REG_KEY + 'Otdel', true);
  try
   reg.WriteInteger('id_otdel', id_otdel);
  except
  end;
  reg.Free;

end;

procedure TFrmKoshtoris.pFIBDataSet_smet_kshAfterScroll(DataSet: TDataSet);
begin
  Label21.Caption := pFIBDataSet_smet_ksh.FieldByName('smeta_title').AsString;
  Label22.Caption := pFIBDataSet_smet_ksh.FieldByName('razd_title').AsString;
  Label23.Caption := pFIBDataSet_smet_ksh.FieldByName('st_title').AsString;
  Label25.Caption := pFIBDataSet_smet_ksh.FieldByName('kekv_title').AsString;
  Label21.Hint := pFIBDataSet_smet_ksh.FieldByName('smeta_title').AsString;
  Label21.ShowHint := true;
  Label22.Hint := pFIBDataSet_smet_ksh.FieldByName('razd_title').AsString;
  Label22.ShowHint := true;
  Label23.Hint := pFIBDataSet_smet_ksh.FieldByName('st_title').AsString;
  Label23.ShowHint := true;
  Label25.Hint := pFIBDataSet_smet_ksh.FieldByName('kekv_title').AsString;
  Label25.ShowHint := true;
end;

procedure TFrmKoshtoris.saveExecute(Sender: TObject);
begin
  if Priznak_vizova <> 'prosmotr' then
  cxButton_okClick(Self);
end;

procedure TFrmKoshtoris.save1Execute(Sender: TObject);
begin
  if Priznak_vizova <> 'prosmotr' then
  cxButton_okClick(Self);
end;

procedure TFrmKoshtoris.ToolButton_addClick(Sender: TObject);
var
  Add: Variant;
  cnt,i: Integer;
  id_adding_flag:Integer;
begin
  id_adding_flag:=1;
  SumToSmet();
  Add := LoadDogManedger.AddKosht(self,pFIBDatabase_ksh.Handle,summa_to_smet,1,0,0,0,0,0,Date);
      if VarArrayDimCount(Add) > 0 then
      begin
      Cnt := VarArrayHighBound(Add, 1);
              { Проверка, есть ли однаковые разделы, кеквы, статьи }

//      tmp_val:=RxMemoryData_smet.FieldByName('sum_smet').Value;

          RxMemoryData_smet.First;
        while (not RxMemoryData_smet.Eof) do
        begin
          if ((RxMemoryData_smet['id_smet']=Add[i][7]) And
              (RxMemoryData_smet['id_razd']=Add[i][8]) And
              (RxMemoryData_smet['id_stat']=Add[i][9]) And
              (RxMemoryData_smet['id_kekv']=Add[i][10]))  then
          begin
              //MessageBox(0,'Found','Update',MB_OK);
              RxMemoryData_smet.Open;
              RxMemoryData_smet.Edit;
              RxMemoryData_smet.FieldByName('sum_smet').Value := Add[i][3]+RxMemoryData_smet.FieldByName('sum_smet').Value;
              RxMemoryData_smet.Post;
              id_adding_flag:=0;
              Break;
          end;
          RxMemoryData_smet.next;
         end;




      if id_adding_flag = 1 then
      begin
        for i := 0 to Cnt do
        begin



            RxMemoryData_smet.Open;
            RxMemoryData_smet.Insert;
            RxMemoryData_smet.FieldByName('id_smet').Value := Add[i][7];
            RxMemoryData_smet.FieldByName('id_razd').Value := Add[i][8];
            RxMemoryData_smet.FieldByName('id_stat').Value := Add[i][9];
            RxMemoryData_smet.FieldByName('sum_smet').Value := Add[i][3];
            RxMemoryData_smet.FieldByName('name_smet').Value := Add[i][0];
            RxMemoryData_smet.FieldByName('name_razd').Value := Add[i][1];
            RxMemoryData_smet.FieldByName('name_stat').Value := Add[i][2];
            RxMemoryData_smet.FieldByName('kod_smety').Value := Add[i][4];
            RxMemoryData_smet.FieldByName('n_razd').Value := Add[i][5];
            RxMemoryData_smet.FieldByName('n_stat').Value := Add[i][6];
            RxMemoryData_smet.FieldByName('id_kekv').Value := Add[i][10];
            RxMemoryData_smet.FieldByName('kod_kekv').Value := Add[i][11];
            RxMemoryData_smet.FieldByName('name_kekv').Value := Add[i][12];
            RxMemoryData_smet.FieldByName('id').Value := 0;
            RxMemoryData_smet.FieldByName('flag_del').Value := 0;
            RxMemoryData_smet.Post;
          end;
        end;  
      SumNds();
      end;
end;

procedure TFrmKoshtoris.SumNds();
var
  sum_d, sum_nds: Currency;
  pFIBDataSet_nds_procent : TpFIBDataSet;
  nds_procent: Variant;
begin
  sum_d := CurrencyEdit_sum_po_smet.Value;
  pFIBDataSet_nds_procent := TpFIBDataSet.Create(Self);
  pFIBDataSet_nds_procent.Database := pFIBDatabase_ksh;
  pFIBDataSet_nds_procent.Transaction := pFIBTransactionRead_ksh;
  pFIBDataSet_nds_procent.Active := false;
  pFIBDataSet_nds_procent.SQLs.SelectSQL.Text := 'select * from pub_nds_procent_info(:d_d_dog)';
  pFIBDataSet_nds_procent.ParamByName('D_D_DOG').Value := cxDateEdit_dog.Text;
  pFIBDataSet_nds_procent.Active := true;
  nds_procent := pFIBDataSet_nds_procent.FieldByName('D_NDS_PROCENT').AsVariant;
  if VarIsNull (pFIBDataSet_nds_procent.FieldValues['D_NDS_PROCENT']) then
  begin
   Showmessage('Сума ПДВ не виставлена в довіднику ПДВ,' + #13 +
                ' обратитесь к администратору сиситеми.' + #13 +
                ' ПДВ  буде розраховано зі ставкою 20 %.');
  end;
  if nds_procent <= 0 then nds_procent := 20;
  sum_nds := (sum_d*nds_procent)/(100+nds_procent);
  CurrencyEdit_nds.Text := VarToStr(sum_nds);
  pFIBDataSet_nds_procent.Free;
end;

procedure TFrmKoshtoris.ToolButton_delClick(Sender: TObject);
var
  id_sm: Variant;
begin

  //проверка на непустое значение
  if cxGrid1DBTableView1DBColumn_smeta.EditValue = 0 then
  begin
    Exit;
  end;

  RxMemoryData_smet.Open;
  RxMemoryData_smet.Edit;
  if RxMemoryData_smet.FieldByName('Flag_del').Value = 1 then
    begin
      RxMemoryData_smet.FieldByName('Flag_del').Value := 0;
    end
    else
    begin
      if MessageBox(Handle,PChar('Вы дійсно бажаєте видалити кошторис?'),
      'Підтвердження видалення',MB_YesNo or MB_Iconquestion) = mrYes then
      RxMemoryData_smet.FieldByName('Flag_del').Value := 1;
    end;
  RxMemoryData_smet.Post;
  SumNds();
  SummaDoc();
  id_sm := RxMemoryData_smet.FieldByName('id').Value;
  RxMemoryData_smet.Locate('id', id_sm, []);
end;

//подсчет суммы документа
procedure TFrmKoshtoris.SummaDoc();
var
  temp: Variant;
  i: Integer;
  sum_doc: Currency;
begin
  if Priznak_vizova = 'add' then
  sum_doc := CurrencyEdit_sum_doc.Value else
  sum_doc := pFIBDataSet_id_dokument_ksh.FieldByName('d_summa').AsVariant;

  if sum_doc < 0 then sum_doc := 0;
  RxMemoryData_smet.First;
    if (RxMemoryData_smet.FieldByName('flag_del').Value <> 1) and (RxMemoryData_smet.FieldByName('id').Value = 0) then
    begin
      temp := RxMemoryData_smet.FieldByName('sum_smet').AsVariant;
      sum_doc := sum_doc + temp;
    end
    else
    if (RxMemoryData_smet.FieldByName('flag_del').Value = 1) then
    begin
      temp := RxMemoryData_smet.FieldByName('sum_smet').AsVariant;
      sum_doc := sum_doc - temp;
    end;
  SumNds();
end;


procedure TFrmKoshtoris.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (Priznak_vizova = 'prosmotr') or (Priznak_vizova = 'hist')  then Exit;

if key = VK_DELETE then
  begin
    ToolButton_delClick(Self);
  end;
{if key = VK_INSERT then
  begin
    ToolButton_addClick(Self);
  end;}
end;

procedure TFrmKoshtoris.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Arect: TRect;
begin
  Arect := AViewInfo.Bounds;
  ACanvas.Canvas.Pen.Color := clBlack;
  if AViewInfo.GridRecord.Values[4] = 1 then
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

//Подсчет суммы по смете
procedure TFrmKoshtoris.Summa();
var
  i: Integer;
  temp: Variant;
  kol_vo_smet: Integer;
  sum_po_smet : Variant;
begin
  sum_po_smet := 0;
  RxMemoryData_smet.First;
  kol_vo_smet := 0;
  for i := 0 to RxMemoryData_smet.RecordCount-1 do
  begin
    if RxMemoryData_smet.FieldByName('flag_del').Value <> 1 then
    begin
      temp := RxMemoryData_smet.FieldByName('sum_smet').AsVariant;
      sum_po_smet := sum_po_smet + temp;
      kol_vo_smet := kol_vo_smet + 1;
    end;
    RxMemoryData_smet.Next;
  end;
   cxTextEdit_kol_vo_smet.Text := IntToStr(kol_vo_smet);
   CurrencyEdit_sum_po_smet.Text := VarToStr(sum_po_smet);
//   CurrencyEdit_summa.Text:=VarToStr(sum_po_smet);
end;


procedure TFrmKoshtoris.RxMemoryData_smetAfterPost(DataSet: TDataSet);
begin
  Summa();
end;

procedure TFrmKoshtoris.RxMemoryData_smetAfterDelete(DataSet: TDataSet);
begin
  Summa();
end;

procedure TFrmKoshtoris.CurrencyEdit_sum_po_smetChange(Sender: TObject);
begin
  if Priznak_vizova = 'add' then
  begin
    CurrencyEdit_sum_doc.Text:=CurrencyEdit_sum_po_smet.Text;
  end;
end;

procedure TFrmKoshtoris.cxButton_predoplClick(Sender: TObject);
begin
   LoadDogManedger.LoadShablon(Self, pFIBDatabase_ksh.Handle, fsNormal, id_dog, 'add', SYS_ID_PREDOPL,
                              PChar('Predoplata.bpl'), Nil);

end;

procedure TFrmKoshtoris.Label15Click(Sender: TObject);
begin
  if Priznak_vizova <> 'add' then
  begin
   //ShowMessage(VarToStr(id_dog));
   ShowDogPayFulfil(Self, pFIBDatabase_ksh.Handle, pFIBTransactionRead_ksh.Handle, pFIBTransactionWrite_ksh.Handle, fsNormal, id_dog, -1);
  end;
end;

procedure TFrmKoshtoris.Label14Click(Sender: TObject);
begin
  if Priznak_vizova <> 'add' then
  ShowDogPayFulfil(Self, pFIBDatabase_ksh.Handle, pFIBTransactionRead_ksh.Handle, pFIBTransactionWrite_ksh.Handle, fsNormal, id_dog, -1);
end;

procedure TFrmKoshtoris.Label15MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if Priznak_vizova <> 'add' then
  begin
    Label15.Cursor := crHandPoint;
  end;
end;

procedure TFrmKoshtoris.Label14MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if Priznak_vizova <> 'add' then
  begin
    Label14.Cursor := crHandPoint;
  end;
end;

procedure TFrmKoshtoris.FormCreate(Sender: TObject);
begin
  spec_changed := 0;
  //Label21.Caption := '';
  //Label22.Caption := '';
  //Label23.Caption := '';
  //Label25.Caption := '';

  if Priznak_vizova = 'red' then
  begin
    Label6.font.color := clBlue;
    Label6.font.Style := [fsUnderline];
    Label1.font.color := clBlue;
    Label1.font.Style := [fsUnderline];
  end;

  if Priznak_vizova <> 'add' then
  begin
    Label14.font.color := clBlue;
    Label14.font.Style := [fsUnderline];
    Label15.font.color := clBlue;
    Label15.font.Style := [fsUnderline];
  end;

end;

procedure TFrmKoshtoris.Label6MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if Priznak_vizova = 'red' then
  begin
    Label6.Cursor := crHandPoint;
  end;
end;

procedure TFrmKoshtoris.Label1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if Priznak_vizova = 'red' then
  begin
    Label1.Cursor := crHandPoint;
  end;
end;

procedure TFrmKoshtoris.Label6Click(Sender: TObject);
var
  Ret : VAriant;
begin
  if Priznak_vizova <> 'red' then Exit;
  Ret := LoadDogManedger.EditSum(self, 1, pFIBDataSet_id_dokument_ksh.FieldByName('d_sum_pay').AsCurrency,
                                 pFIBDataSet_id_dokument_ksh.FieldByName('d_nds_pay').AsCurrency,
                                 CurrencyEdit_sum_doc.Value, CurrencyEdit_nds.Value);
  if VarArrayDimCount(Ret)>0
  then begin
     if Ret[0]<>NULL
     then begin
       if Ret[0] > 0 then CurrencyEdit_sum_doc.Value := Ret[0];
       if Ret[1] > 0 then CurrencyEdit_nds.Value   := Ret[1];
     end;
  end;
end;

procedure TFrmKoshtoris.Label1Click(Sender: TObject);
begin
  Label6Click(Self);
end;

procedure TFrmKoshtoris.RxMemoryData_smetAfterScroll(DataSet: TDataSet);
begin
  Label21.Caption := RxMemoryData_smet.FieldByName('name_smet').AsString;
  Label22.Caption := RxMemoryData_smet.FieldByName('name_razd').AsString;
  Label23.Caption := RxMemoryData_smet.FieldByName('name_stat').AsString;
  Label25.Caption := RxMemoryData_smet.FieldByName('name_kekv').AsString;
  Label21.Hint := RxMemoryData_smet.FieldByName('name_smet').AsString;
  Label21.ShowHint := true;
  Label22.Hint := RxMemoryData_smet.FieldByName('name_razd').AsString;
  Label22.ShowHint := true;
  Label23.Hint := RxMemoryData_smet.FieldByName('name_stat').AsString;
  Label23.ShowHint := true;
  Label25.Hint := RxMemoryData_smet.FieldByName('name_kekv').AsString;
  Label25.ShowHint := true;
end;

procedure TFrmKoshtoris.SpeedButton_redClick(Sender: TObject);
var
  Add: Variant;
  d_dogovor: TDate;
  cnt, i: Integer;
begin
  d_dogovor := cxDateEdit_dog.Date;
  SumToSmet();

  Add := LoadDogManedger.AddKosht(self,pFIBDatabase_ksh.Handle,
         //summa_to_smet,
         -1,2,
         RxMemoryData_smet.FieldByName('id_smet').AsInteger,
         RxMemoryData_smet.FieldByName('id_razd').AsInteger,
         RxMemoryData_smet.FieldByName('id_stat').AsInteger,
         RxMemoryData_smet.FieldByName('id_kekv').AsInteger,
         RxMemoryData_smet.FieldByName('sum_smet').AsCurrency,
         d_dogovor);
      if VarArrayDimCount(Add) > 0 then
      begin
        Cnt := VarArrayHighBound(Add, 1);
        for i := 0 to Cnt do
        begin
//          id_smeta := Add[i][7];
//          id_dt_smet := RxMemoryData_smet.FieldByName('id').AsVariant;
//          RxMemoryData_smet.Locate('id', id_dt_smet, []);
          RxMemoryData_smet.Open;
          RxMemoryData_smet.Edit;
          RxMemoryData_smet.FieldByName('id_smet').Value := Add[i][7];
          RxMemoryData_smet.FieldByName('id_razd').Value := Add[i][8];
          RxMemoryData_smet.FieldByName('id_stat').Value := Add[i][9];
          RxMemoryData_smet.FieldByName('sum_smet').Value := Add[i][3];
          RxMemoryData_smet.FieldByName('name_smet').Value := Add[i][0];
          RxMemoryData_smet.FieldByName('name_razd').Value := Add[i][1];
          RxMemoryData_smet.FieldByName('name_stat').Value := Add[i][2];
          RxMemoryData_smet.FieldByName('kod_smety').Value := Add[i][4];
          RxMemoryData_smet.FieldByName('n_razd').Value := Add[i][5];
          RxMemoryData_smet.FieldByName('n_stat').Value := Add[i][6];
          RxMemoryData_smet.FieldByName('id_kekv').Value := Add[i][10];
          RxMemoryData_smet.FieldByName('kod_kekv').Value := Add[i][11];
          RxMemoryData_smet.FieldByName('name_kekv').Value := Add[i][12];
//          RxMemoryData_smet.FieldByName('flag_del').Value := 0;
          RxMemoryData_smet.Post;
        end;
      SumNds();
      end;
end;

procedure TFrmKoshtoris.SumToSmet();
var
  summa_d, summa_smet, sum_pay, sum_fulfil : Currency;
begin
  if Priznak_vizova <> 'red' then
  begin
    summa_to_smet := -1;
  end
  else
  begin

  //сумма, которую можно разбить по сметам
    summa_smet := CurrencyEdit_sum_po_smet.Value;
    sum_pay := CurrencyEdit_sum_opl.Value;
    sum_fulfil := CurrencyEdit_sum_vipol.Value;
    summa_d := CurrencyEdit_sum_doc.Value;

    summa_to_smet := summa_d - summa_smet;
  end;
end;

procedure TFrmKoshtoris.editExecute(Sender: TObject);
begin
  SpeedButton_redClick(Self);

end;

procedure TFrmKoshtoris.insExecute(Sender: TObject);
begin
  ToolButton_addClick(Self);

end;

procedure TFrmKoshtoris.Label12Click(Sender: TObject);
var
  s       : Variant;
begin
  s := LoadDogManedger.Comment(Self, comment, Priznak_vizova);
  comment := s;  
end;

procedure TFrmKoshtoris.cxButtonEdit_depPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    sp: TSprav;
begin
    if (Priznak_vizova = 'prosmotr') or (Priznak_vizova = 'hist')  then Exit;
        // создать справочник
    sp :=  GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(pFIBDatabase_ksh.Handle);
                // модальный показ
            FieldValues['ShowStyle'] := 0;
                // единичная выборка
            FieldValues['Select'] := 1;

            FieldValues['Root_Department'] := DogLoaderUnit.SYS_DEF_ID_DEPARTMENT;
            FieldValues['Actual_Date'] := Date;
            Post;
        end;
    end;
        // показать справочник и проанализировать результат (выбор одного подр.)
    sp.Show;
    if sp.Output = nil then
        ShowMessage('BUG: Output is NIL!!!')
    else
    if not sp.Output.IsEmpty then
    begin
        cxButtonEdit_otd.Text := sp.Output['Name_Full'];
    id_otdel := sp.Output['Id_Department'];
    end;
    sp.Free;
end;

procedure TFrmKoshtoris.delExecute(Sender: TObject);
begin
  ToolButton_delClick(Self);
end;

(*
procedure TFrmKoshtoris.SpecificationButtonClick(Sender: TObject);
var
 i, o : TSpravParams;
begin
  if not (Priznak_vizova = 'add') then
  begin
      if not TransactionSpec.Active then TransactionSpec.StartTransaction;
      i := DogLoaderUnit.TSpravParams.Create;
      o := DogLoaderUnit.TSpravParams.Create;

      i['DataBase']  := Integer(pFIBDatabase_ksh.Handle);
      i['ReadTransaction'] := Integer(pFIBTransactionRead_ksh.Handle);
      i['WriteTransaction'] := Integer(TransactionSpec.Handle);
      i['WriteTransaction2'] := Integer(pFIBTransactionWrite_ksh.Handle);
      i['FormStyle'] := fsNormal;
      i['OnlyView'] := Priznak_vizova <> 'red';
//      ShowMessage(inttostr(ID_Dog_for_spec));
      i['ID_DOG']    := IntToStr(ID_Dog_for_spec);

      dogLoaderUnit.LoadSprav('workdog\dogspec.bpl', Self, i, o);
      i.Free;
      o.Free;
  end
  else
  begin
      ShowMessage('Не можливо додати спеціфікацію, якщо договір не додано.');
  end;
end;
  *)

(*procedure TFrmKoshtoris.ClassEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
 i, o : TAArray;
begin
  i := TAArray.Create;
  o := TAArray.Create;
  i['Owner'].AsObject := Self;
  i['FormStyle'].AsVariant := fsNormal;
  i['Caption'].AsString := 'Тест универсального справочника';
  i['CaptionEdit'].AsString := 'тип объекта';
  i['TableName'].AsString := 'pub_SP_IST';
  i['KEY_FIELD'].AsString := 'id_ist';
  i['parent_field'].AsString := 'linkto';
  i['FIELDS'].AsString := 'name_ist;itog';
  i['FIELDS_caption'].AsString := 'Назва;Сума';
  i['SearchField'].AsString := 'name_ist';
  i['AddProc'].AsString := 'PUB_SP_IST_ADD';
  i['DelProc'].AsString := 'PUB_SP_IST_DEL';
  i['UpdProc'].AsString := 'PUB_SP_IST_MOD';

  LoaderUnit.LoadSprav(ExtractFilePath(Application.ExeName) + 'workdog\UnivTree.bpl', i, o);
  if o['MoadResult'].AsVariant = mrOk then
  begin
    id_class := o['ID_IST'].asInt64;
    classEdit.Text := o['NAME_IST'].AsString;
  end;
//  ViewArray(Self, o);
  i.Free;
  o.Free;
end;
  *)
procedure TFrmKoshtoris.SpecificationButtonClick(Sender: TObject);
var
 i, o : TSpravParams;
begin
  if not (Priznak_vizova = 'add') then
  begin
      if not TransactionSpec.Active then TransactionSpec.StartTransaction;
      i := DogLoaderUnit.TSpravParams.Create;
      o := DogLoaderUnit.TSpravParams.Create;

      i['DataBase']  := Integer(pFIBDatabase_ksh.Handle);
      i['ReadTransaction'] := Integer(pFIBTransactionRead_ksh.Handle);
      i['WriteTransaction'] := Integer(TransactionSpec.Handle);
      i['WriteTransaction2'] := Integer(pFIBTransactionWrite_ksh.Handle);
      i['FormStyle'] := fsNormal;
      i['OnlyView'] := Priznak_vizova <> 'red';
//      ShowMessage(inttostr(ID_Dog_for_spec));
      i['ID_DOG']    := IntToStr(ID_Dog_for_spec);
      i['Summa'] := CurrencyEdit_sum_doc.Value;

      dogLoaderUnit.LoadSprav('workdog\dogspec.bpl', Self, i, o);
      spec_changed := o['CHANGED'];
      i.Free;
      o.Free;
  end
  else
  begin
      ShowMessage('Не можливо додати спеціфікацію, якщо договір не додано.');
  end;
end;


procedure TFrmKoshtoris.ClassEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
 i, o : TAArray;
begin
  i := TAArray.Create;
  o := TAArray.Create;
  i['Owner'].AsObject := Self;
  i['FormStyle'].AsVariant := fsNormal;
  i['Caption'].AsString := 'Класіфікатор продукції';
  i['CaptionEdit'].AsString := 'клас';
  i['TableName'].AsString := 'pub_SP_CLASS';
  i['KEY_FIELD'].AsString := 'id_ist';
  i['parent_field'].AsString := 'linkto';
  i['FIELDS'].AsString := 'shifr;name_ist';
  i['FIELDS_caption'].AsString := 'Шифр;Назва';
  i['SearchField'].AsString := 'FIND_FIELD';
  i['AddProc'].AsString := 'PUB_SP_CLASS_ADD';
  i['DelProc'].AsString := 'PUB_SP_CLASS_DEL';
  i['UpdProc'].AsString := 'PUB_SP_CLASS_MOD';
  i['DBHandle'].AsInteger := integer(pFIBDatabase_ksh.handle);

  LoaderUnit.LoadSprav(ExtractFilePath(Application.ExeName) + 'workdog\UnivTree.bpl', i, o);
  if o['MoadResult'].AsVariant = mrOk then
  begin
    id_class := o['ID_IST'].asInt64;
    classEdit.Text := o['SHIFR'].AsString+'.'+o['NAME_IST'].AsString;
  end;
//  ViewArray(Self, o);
  i.Free;
  o.Free;
end;

procedure TFrmKoshtoris.cxButton1Click(Sender: TObject);
var
 i, o : TAArray;
begin
 
  i := TAArray.Create;
  o := TAArray.Create;
  i['Owner'].AsObject := Self;
  i['FormStyle'].AsVariant := fsNormal;
  i['Caption'].AsString := 'Справочник оснований';
  i['CaptionEdit'].AsString := 'клас';
  i['TableName'].AsString := 'PUB_SP_OSN';
  i['KEY_FIELD'].AsString := 'id_osn';
  i['parent_field'].AsString := 'linkto';
  i['FIELDS'].AsString := 'name_osn';
  i['FIELDS_caption'].AsString := 'Наименование основания';
  i['SearchField'].AsString := 'name_osn';
  i['AddProc'].AsString := 'PUB_SP_OSN_ADD';
  i['DelProc'].AsString := 'PUB_SP_OSN_DEL';
  i['UpdProc'].AsString := 'PUB_SP_OSN_MOD';
  i['DBHandle'].AsInteger := integer(pFIBDatabase_ksh.handle);

  LoaderUnit.LoadSprav(ExtractFilePath(Application.ExeName) + 'workdog\UnivTree.bpl', i, o);
  if o['MoadResult'].AsVariant = mrOk then
  begin

  cxMemo_dog_note.Text := o['name_osn'].AsString;
  end;
  i.Free;
  o.Free;
end;

end.
