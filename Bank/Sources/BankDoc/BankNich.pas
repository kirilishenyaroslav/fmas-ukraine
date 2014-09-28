unit BankNich; //

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxMaskEdit, cxDropDownEdit,
  cxCalendar, StdCtrls, ExtCtrls, cxMemo, dxBar, dxBarExtItems, BankNichAdd, pFIBDatabase,
  FIBDatabase, FIBDataSet, pFIBDataSet, cxImage, cxCurrencyEdit, FIBQuery,
  pFIBQuery, pFIBStoredProc, Un_R_file_Alex, cxSplitter,
  cxLookAndFeelPainters, cxButtons;

type
  TfmBankNich = class(TForm)
    pnl1: TPanel;
    lbl_num_doc: TLabel;
    lbl_date_doc: TLabel;
    lbl_sum_doc: TLabel;
    lbl_pidstava: TLabel;
    cxNum_doc: TcxTextEdit;
    cxDate_doc: TcxDateEdit;
    cxSum_doc: TcxTextEdit;
    cxMemo1: TcxMemo;
    pFIBTransaction1: TpFIBTransaction;
    DB: TpFIBDatabase;
    ds1: TDataSource;
    pFIBDataSet1: TpFIBDataSet;
    cxNameCustEdit: TcxTextEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    cxRREdit: TcxTextEdit;
    cxMFOEdit: TcxTextEdit;
    cxBankEdit: TcxTextEdit;
    pnl2: TPanel;
    cxSplitter1: TcxSplitter;
    pnl3: TPanel;
    cxResultGrid: TcxGrid;
    cxResultGridDBTableView1: TcxGridDBTableView;
    cxResultGridDBTableView1DBColumn1: TcxGridDBColumn;
    cxResultGridDBTableView1DBColumn2: TcxGridDBColumn;
    cxResultGridDBTableView1DBColumn3: TcxGridDBColumn;
    cxResultGridDBTableView1DBColumn4: TcxGridDBColumn;
    cxResultGridLevel1: TcxGridLevel;
    cxParamGrid: TcxGrid;
    cxParamGridTableView1: TcxGridTableView;
    cxParamGridTableView1ColumnMonth: TcxGridColumn;
    cxParamGridTableView1ColumnYear: TcxGridColumn;
    cxParamGridTableView1ColumnSmt: TcxGridColumn;
    cxParamGridTableView1ColumnRazd: TcxGridColumn;
    cxParamGridTableView1ColumnSum: TcxGridColumn;
    cxParamGridTableView1month: TcxGridColumn;
    cxParamGridTableView1SmGroup: TcxGridColumn;
    cxParamGridTableView1IdRazd: TcxGridColumn;
    cxParamGridTableView1SmGroupText: TcxGridColumn;
    cxParamGridTableView1RazdText: TcxGridColumn;
    cxParamGridLevel1: TcxGridLevel;
    cxResultGridDBTableView1DBColumn5: TcxGridDBColumn;
    cxResultGridDBTableView1DBColumn6: TcxGridDBColumn;
    cxResultGridDBTableView1DBColumn7: TcxGridDBColumn;
    pnl4: TPanel;
    cxButtonCancel: TcxButton;
    cxButtonOk: TcxButton;
    pnl5: TPanel;
    cxButtonAdd: TcxButton;
    cxButtonEdit: TcxButton;
    cxButtonDel: TcxButton;
    IBQuery1: TpFIBQuery;
    cxResultGridDBTableView1DBColumn8: TcxGridDBColumn;
    cxResultGridDBTableView1DBColumn9: TcxGridDBColumn;
    cxResultGridDBTableView1DBColumn10: TcxGridDBColumn;
    cxResultGridDBTableView1DBColumn11: TcxGridDBColumn;
    cxResultGridDBTableView1DBColumn12: TcxGridDBColumn;
    cxResultGridDBTableView1DBColumn13: TcxGridDBColumn;
    cxResultGridDBTableView1DBColumn14: TcxGridDBColumn;
    cxResultGridDBTableView1DBColumn15: TcxGridDBColumn;
    cxResultGridDBTableView1DBColumn16: TcxGridDBColumn;
    Label2: TLabel;
    Label1: TcxMemo;
    procedure FormCreate(Sender: TObject);
    procedure cxParamGridTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cxButtonCancelClick(Sender: TObject);
    procedure cxButtonOkClick(Sender: TObject);
    procedure cxButtonAddClick(Sender: TObject);
    procedure cxButtonEditClick(Sender: TObject);
    procedure cxButtonDelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fltForm1 : TfmBankNichAdd;
    fmBankNich: TfmBankNich;
    id_us : Integer;
    id_dog : Double;
    date_d : TDateTime;
    n_dog, d_dog, reg_dog, name_cust, summa, summa_raz : string;
    constructor Create(AOwner: TComponent; DBHANDLE : TpFIBDatabase; id_doc: Int64; date_doc: TDate; num_doc, sum_doc, note: string; id_user : Integer; name_cust, mfo_cust, name_bank, ras_cust: string; prih : Integer); reintroduce; overload;
  end;

implementation
uses
     Un_lo_file_Alex,
     BankInputSumma,
     DogLoaderUnit,
     BankSelectDocProvVstrech,
     Un_func_file_Alex,
     BankSelectKomisDoc,
     BankKomOrder,
     Math,
     {uTreatiesDM,
     ujbApplication,
     ujbTypes,
     ujbKernel,}
     BankTypeKassa,
     ST_Loader_Unit,
     Un_form_info_doc,
     //cn_Common_Loader,
     cn_Common_Types,
     BankExpertSysSch,
     BankMoveToDay,
     dateutils;

{$R *.dfm}



constructor TfmBankNich.Create(AOwner: TComponent; DBHANDLE : TpFIBDatabase; id_doc: Int64; date_doc: TDate; num_doc, sum_doc, note: string; id_user : Integer; name_cust, mfo_cust, name_bank, ras_cust: string; prih : Integer);
begin
    inherited Create (nil);
    DB := DBHANDLE;
    pFIBTransaction1.DefaultDatabase := DB;
    DB.DefaultTransaction := pFIBTransaction1;
     cxNum_doc.Text:=  num_doc;
     cxDate_doc.Date:= date_doc;
     cxSum_doc.Text:= sum_doc;
     cxMemo1.Text:= note;
     cxNameCustEdit.Text:= name_cust;
     cxRREdit.Text:=ras_cust;
     cxMFOEdit.Text:=mfo_cust;
     cxBankEdit.Text:=name_bank;
     fmBankNich.Caption:='Фінансування НІЧ';
     id_us:= id_user;
     date_d:=date_doc;
     summa:=sum_doc;
     if (prih=1) then lbl_num_doc.Caption:='Прибутковий банківський документ №'
     else lbl_num_doc.Caption:='Видатковий банківський документ №';

     cxParamGridTableView1ColumnMonth.DataBinding.ValueTypeClass := TcxStringValueType;
     cxParamGridTableView1ColumnYear.DataBinding.ValueTypeClass := TcxStringValueType;
     cxParamGridTableView1ColumnSmt.DataBinding.ValueTypeClass := TcxStringValueType;
     cxParamGridTableView1ColumnRazd.DataBinding.ValueTypeClass := TcxStringValueType;
     cxParamGridTableView1ColumnSum.DataBinding.ValueTypeClass := TcxCurrencyValueType;
     cxParamGridTableView1month.DataBinding.ValueTypeClass := TcxStringValueType;
     cxParamGridTableView1SmGroup.DataBinding.ValueTypeClass := TcxStringValueType;
     cxParamGridTableView1IdRazd.DataBinding.ValueTypeClass := TcxStringValueType;
     cxParamGridTableView1SmGroupText.DataBinding.ValueTypeClass := TcxStringValueType;
     cxParamGridTableView1RazdText.DataBinding.ValueTypeClass := TcxStringValueType;

     cxResultGridDBTableView1DBColumn1.DataBinding.ValueTypeClass := TcxStringValueType;
     cxResultGridDBTableView1DBColumn2.DataBinding.ValueTypeClass := TcxStringValueType;
     cxResultGridDBTableView1DBColumn3.DataBinding.ValueTypeClass := TcxStringValueType;
     cxResultGridDBTableView1DBColumn4.DataBinding.ValueTypeClass := TcxCurrencyValueType;
     cxResultGridDBTableView1DBColumn5.DataBinding.ValueTypeClass := TcxStringValueType;
     cxResultGridDBTableView1DBColumn6.DataBinding.ValueTypeClass := TcxStringValueType;
     cxResultGridDBTableView1DBColumn7.DataBinding.ValueTypeClass := TcxStringValueType;
     cxResultGridDBTableView1DBColumn8.DataBinding.ValueTypeClass := TcxStringValueType;
     cxResultGridDBTableView1DBColumn9.DataBinding.ValueTypeClass := TcxStringValueType;
     cxResultGridDBTableView1DBColumn10.DataBinding.ValueTypeClass := TcxStringValueType;
     cxResultGridDBTableView1DBColumn11.DataBinding.ValueTypeClass := TcxStringValueType;
     cxResultGridDBTableView1DBColumn12.DataBinding.ValueTypeClass := TcxStringValueType;
     cxResultGridDBTableView1DBColumn13.DataBinding.ValueTypeClass := TcxStringValueType;
     cxResultGridDBTableView1DBColumn14.DataBinding.ValueTypeClass := TcxStringValueType;
     cxResultGridDBTableView1DBColumn15.DataBinding.ValueTypeClass := TcxStringValueType;
     cxResultGridDBTableView1DBColumn16.DataBinding.ValueTypeClass := TcxStringValueType;
end;


procedure TfmBankNich.FormCreate(Sender: TObject);
begin
   fmBankNich.Caption:='Фінансування НІЧ';
   fmBankNich.BorderStyle:=bsSingle;
end;

procedure TfmBankNich.cxParamGridTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
var
      //GetNameSP:TPfibStoredProc;
      //IBQuery1:TpFIBQuery;
      //format: TFormatSettings;
      DataSetProc : TpFIBDataSet;
      dataset_data : string;
      i, k : Integer;
begin
        if (cxParamGridTableView1.DataController.RecordCount > 0) then begin
        dataset_data:='01.0'+VarToStr(cxParamGridTableView1month.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRowIndex, 5])+'.'+VarToStr(cxParamGridTableView1ColumnYear.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRowIndex, 1]);
        DataSetProc:=TpFIBDataSet.Create(self);
        DataSetProc.Database:=DB;
        DataSetProc.Transaction:=pFIBTransaction1;
        pFIBTransaction1.StartTransaction;
        DataSetProc.Close;
        //DataSetProc.SQLs.SelectSQL.Text:= 'SELECT * FROM BU_GET_SMGR_PLAN_RATIO_BY_STAT('''+VarToStr(cxParamGridTableView1SmGroup.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRowIndex, 6])+''', '''+VarToStr(cxParamGridTableView1IdRazd.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRowIndex, 7])+''', '''+VarToStr(dataset_data)+''', '''+VarToStr(sum)+''', '''+IntToStr(0)+''')';
        //ShowMessage(DataSetProc.SQLs.SelectSQL.Text);
        DataSetProc.SQLs.SelectSQL.Text:= 'SELECT * FROM BU_GET_SMGR_PLAN_RATIO_BY_STAT (:value1, :value2, :value3, :value4, :value5)';
        DataSetProc.ParamByName('value1').AsInteger:=StrToInt(cxParamGridTableView1SmGroup.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRowIndex, 6]);
        DataSetProc.ParamByName('value2').AsInteger:=StrToInt(cxParamGridTableView1IdRazd.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRowIndex, 7]);
        DataSetProc.ParamByName('value3').AsDate:=StrToDate(dataset_data);
        DataSetProc.ParamByName('value4').AsCurrency:=cxParamGridTableView1ColumnSum.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRecordIndex, 4];
        DataSetProc.ParamByName('value5').AsInteger:=0;
        DataSetProc.Open;
        DataSetProc.FetchAll;
        DataSetProc.First;
        cxResultGridDBTableView1.DataController.RecordCount:=0;
        for i := 1 to DataSetProc.RecordCount do
        begin
          cxResultGridDBTableView1.DataController.RecordCount := cxResultGridDBTableView1.DataController.RecordCount + 1;
          cxResultGridDBTableView1DBColumn1.DataBinding.DataController.Values[cxResultGridDBTableView1.DataController.RecordCount - 1, 0]:=DataSetProc.FieldByName('SM_CODE').AsString;
          cxResultGridDBTableView1DBColumn2.DataBinding.DataController.Values[cxResultGridDBTableView1.DataController.RecordCount - 1, 1]:=cxParamGridTableView1IdRazd.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRowIndex, 7];
          cxResultGridDBTableView1DBColumn3.DataBinding.DataController.Values[cxResultGridDBTableView1.DataController.RecordCount - 1, 2]:=DataSetProc.FieldByName('ST_CODE').AsString;
          cxResultGridDBTableView1DBColumn4.DataBinding.DataController.Values[cxResultGridDBTableView1.DataController.RecordCount - 1, 3]:=DataSetProc.FieldByName('PROV_SUM_RATIO').AsCurrency;
          cxResultGridDBTableView1DBColumn5.DataBinding.DataController.Values[cxResultGridDBTableView1.DataController.RecordCount - 1, 4]:=DataSetProc.FieldByName('SM_TITLE').AsString;
          cxResultGridDBTableView1DBColumn6.DataBinding.DataController.Values[cxResultGridDBTableView1.DataController.RecordCount - 1, 5]:=DataSetProc.FieldByName('ID_SM').AsString;
          cxResultGridDBTableView1DBColumn7.DataBinding.DataController.Values[cxResultGridDBTableView1.DataController.RecordCount - 1, 6]:=DataSetProc.FieldByName('ID_ST').AsString;
          cxResultGridDBTableView1DBColumn8.DataBinding.DataController.Values[cxResultGridDBTableView1.DataController.RecordCount - 1, 7]:=DataSetProc.FieldByName('ST_TITLE').AsString;
          cxResultGridDBTableView1DBColumn9.DataBinding.DataController.Values[cxResultGridDBTableView1.DataController.RecordCount - 1, 8]:=cxParamGridTableView1ColumnRazd.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRowIndex, 3];
          cxResultGridDBTableView1DBColumn10.DataBinding.DataController.Values[cxResultGridDBTableView1.DataController.RecordCount - 1, 9]:=cxParamGridTableView1RazdText.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRowIndex, 9];
          cxResultGridDBTableView1.DataController.Post;
          DataSetProc.Next;
        end;
        DataSetProc.Close;
        pFIBTransaction1.Commit;

        Label2.Caption:='Група бюджета: ';
        Label1.Text:=cxParamGridTableView1SmGroupText.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRowIndex, 8];

        //Достаем КЕКВ
        DataSetProc:=TpFIBDataSet.Create(self);
        DataSetProc.Database:=DB;
        DataSetProc.Transaction:=pFIBTransaction1;
        for i:=0 to cxResultGridDBTableView1.DataController.RecordCount - 1 do
        begin
          pFIBTransaction1.StartTransaction;
          DataSetProc.Close;
          DataSetProc.SQLs.SelectSQL.Text:= 'SELECT * FROM BU_GET_KEKV('''+VarToStr(dataset_data)+''', '''+VarToStr(cxResultGridDBTableView1DBColumn6.DataBinding.DataController.Values[i, 5]) +''')';
          DataSetProc.Open;
          cxResultGridDBTableView1DBColumn11.DataBinding.DataController.Values[i, 10]:=DataSetProc.FieldByName('ID_KEKV').AsString;
          cxResultGridDBTableView1.DataController.Post;
          DataSetProc.Close;
          DataSetProc.SQLs.SelectSQL.Text:= 'SELECT * FROM PUB_SPR_KEKV_INFO('''+ VarToStr(cxResultGridDBTableView1DBColumn11.DataBinding.DataController.Values[i, 10])+''', '''+ VarToStr(dataset_data) +''')';
          DataSetProc.Open;
          cxResultGridDBTableView1DBColumn12.DataBinding.DataController.Values[i, 11]:=DataSetProc.FieldByName('KEKV_KODE').AsString;
          cxResultGridDBTableView1DBColumn13.DataBinding.DataController.Values[i, 12]:=DataSetProc.FieldByName('KEKV_TITLE').AsString;
          cxResultGridDBTableView1.DataController.Post;
          DataSetProc.Close;
          pFIBTransaction1.Commit;
        end;


        //Достаем счет
        DataSetProc:=TpFIBDataSet.Create(self);
        DataSetProc.Database:=DB;
        DataSetProc.Transaction:=pFIBTransaction1;
        for i:=0 to cxResultGridDBTableView1.DataController.RecordCount - 1 do
        begin
          pFIBTransaction1.StartTransaction;
          DataSetProc.Close;
          DataSetProc.SQLs.SelectSQL.Text:= 'SELECT * FROM BU_GET_FOND(''' + VarToStr(cxResultGridDBTableView1DBColumn6.DataBinding.DataController.Values[i, 5]) + ''', ''' + cxParamGridTableView1IdRazd.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRowIndex, 7] + ''', ''' + VarToStr(dataset_data) + ''')';
          DataSetProc.Open;
          cxResultGridDBTableView1DBColumn14.DataBinding.DataController.Values[i, 13]:=DataSetProc.FieldByName('ID_FOND').AsString;
          cxResultGridDBTableView1DBColumn15.DataBinding.DataController.Values[i, 14]:=DataSetProc.FieldByName('FOND_NUM').AsString;
          cxResultGridDBTableView1DBColumn16.DataBinding.DataController.Values[i, 15]:=DataSetProc.FieldByName('FOND_TITLE').AsString;
          cxResultGridDBTableView1.DataController.Post;
          DataSetProc.Close;
          pFIBTransaction1.Commit;
        end;


        {cxParamGridTableView1ColumnSum.DataBinding.DataController.FocusedRowIndex:=0;
        GetNameSP:=TPfibStoredProc.Create(self);
        GetNameSP.Database:=DB;
        GetNameSP.Transaction:=pFIBTransaction1;
        pFIBTransaction1.StartTransaction;
        GetNameSP.StoredProcName:='BU_GET_SMGR_PLAN_RATIO_BY_STAT';
        GetNameSP.Prepare;
        GetNameSP.ParamByName('ID_SM_GROUP').Value:=cxParamGridTableView1SmGroup.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRowIndex, 6];
        GetNameSP.ParamByName('ID_RAZD').Value:=cxParamGridTableView1IdRazd.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRowIndex, 7];
        GetNameSP.ParamByName('ACTUAL_DATE_IN').Value:='01.'+VarToStr(cxParamGridTableView1month.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRowIndex, 5])+'.'+VarToStr(cxParamGridTableView1ColumnYear.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRowIndex, 1]);
        GetNameSP.ParamByName('PROV_SUM').Value:=cxParamGridTableView1ColumnSum.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRecordIndex, 4];
        GetNameSP.ParamByName('SHOW_NULL_POSITIONS').Value:='0';
        GetNameSP.ExecProc;
        cxResultGridDBTableView1.DataController.RecordCount:=0;
        cxResultGridDBTableView1.DataController.RecordCount := cxResultGridDBTableView1.DataController.RecordCount + 1;
        cxResultGridDBTableView1DBColumn1.DataBinding.DataController.Values[cxResultGridDBTableView1.DataController.RecordCount - 1, 0]:=GetNameSP.ParamByName('SM_CODE').AsString;
        cxResultGridDBTableView1DBColumn2.DataBinding.DataController.Values[cxResultGridDBTableView1.DataController.RecordCount - 1, 1]:=cxParamGridTableView1IdRazd.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRowIndex, 3];
        cxResultGridDBTableView1DBColumn3.DataBinding.DataController.Values[cxResultGridDBTableView1.DataController.RecordCount - 1, 2]:=GetNameSP.ParamByName('ST_CODE').AsString;
        cxResultGridDBTableView1DBColumn4.DataBinding.DataController.Values[cxResultGridDBTableView1.DataController.RecordCount - 1, 3]:=GetNameSP.ParamByName('PROV_SUM_RATIO').AsString;
        //cxResultGridDBTableView1.DataController.Post;
        //cxMemoEdit.Text:=GetNameSP.ParamByName('D_N_DOG').AsString +  Un_R_file_Alex.BANK_NASTROYKA_VID  + GetNameSP.ParamByName('D_D_DOG').AsString + ' ' + GetNameSP.ParamByName('D_NAME_CUSTOMER_K').AsString + ' (' + GetNameSP.ParamByName('D_REG_NOMER').AsString + ')';
        GetNameSP.Close;
        GetNameSP.Free;
        pFIBTransaction1.Commit; }


        {cxParamGridTableView1.DataController.FocusedRowIndex:=cxParamGridTableView1.DataController.RecordCount-1;
        dataset_data:='01.0'+VarToStr(cxParamGridTableView1month.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRowIndex, 5])+'.'+VarToStr(cxParamGridTableView1ColumnYear.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRowIndex, 1]);
        IBQuery1:=TpFIBQuery.Create(nil);
        IBQuery1.Database:=DB;
        IBQuery1.Transaction:=pFIBTransaction1;
        pFIBTransaction1.StartTransaction;
        IBQuery1.SQL.Clear;
        IBQuery1.SQL.Add('select * from BU_GET_SMGR_PLAN_RATIO_BY_STAT (:value1, :value2, :value3, :value4, :value5)');
        IBQuery1.ParamByName('value1').AsInteger:=StrToInt(cxParamGridTableView1SmGroup.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRowIndex, 6]);
        IBQuery1.ParamByName('value2').AsInteger:=StrToInt(cxParamGridTableView1IdRazd.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRowIndex, 7]);
        IBQuery1.ParamByName('value3').AsDate:=StrToDate(dataset_data);
        IBQuery1.ParamByName('value4').AsCurrency:=cxParamGridTableView1ColumnSum.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRecordIndex, 4];
        IBQuery1.ParamByName('value5').AsInteger:=0;
        IBQuery1.ExecQuery;
        cxResultGridDBTableView1.DataController.RecordCount:=0;
        for i:=1 to IBQuery1.RecordCount do
        begin
          cxResultGridDBTableView1.DataController.RecordCount := cxResultGridDBTableView1.DataController.RecordCount + 1;
          cxResultGridDBTableView1DBColumn1.DataBinding.DataController.Values[cxResultGridDBTableView1.DataController.RecordCount - 1, 0]:=IBQuery1.Current.ByName['SM_CODE'].AsString;
          cxResultGridDBTableView1DBColumn2.DataBinding.DataController.Values[cxResultGridDBTableView1.DataController.RecordCount - 1, 1]:=cxParamGridTableView1IdRazd.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRowIndex, 3];
          cxResultGridDBTableView1DBColumn3.DataBinding.DataController.Values[cxResultGridDBTableView1.DataController.RecordCount - 1, 2]:=IBQuery1.Current.ByName['ST_CODE'].AsString;
          cxResultGridDBTableView1DBColumn4.DataBinding.DataController.Values[cxResultGridDBTableView1.DataController.RecordCount - 1, 3]:=IBQuery1.Current.ByName['PROV_SUM_RATIO'].AsCurrency;
          cxResultGridDBTableView1DBColumn5.DataBinding.DataController.Values[cxResultGridDBTableView1.DataController.RecordCount - 1, 4]:=IBQuery1.Current.ByName['SM_TITLE'].AsString;
          cxResultGridDBTableView1DBColumn6.DataBinding.DataController.Values[cxResultGridDBTableView1.DataController.RecordCount - 1, 5]:=IBQuery1.Current.ByName['ID_SM'].AsString;
          cxResultGridDBTableView1DBColumn7.DataBinding.DataController.Values[cxResultGridDBTableView1.DataController.RecordCount - 1, 6]:=IBQuery1.Current.ByName['ID_ST'].AsString;
          cxResultGridDBTableView1DBColumn8.DataBinding.DataController.Values[cxResultGridDBTableView1.DataController.RecordCount - 1, 7]:=IBQuery1.Current.ByName['SM_TITLE'].AsString;
          cxResultGridDBTableView1DBColumn9.DataBinding.DataController.Values[cxResultGridDBTableView1.DataController.RecordCount - 1, 8]:=IBQuery1.Current.ByName['ST_TITLE'].AsString;
          IBQuery1.Next;
        end;
        IBQuery1.Close;
        pFIBTransaction1.Commit; }
      end;
end;


procedure TfmBankNich.cxButtonCancelClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TfmBankNich.cxButtonOkClick(Sender: TObject);
var
  s : Currency;
  i : Integer;
begin
    s:= 0;
    if not (cxParamGridTableView1.DataController.RecordCount = 0)  then
    begin
        i:=cxParamGridTableView1.DataController.RecordCount - 1;
        while (i <> -1) do
        begin
          s:= s + cxParamGridTableView1ColumnSum.DataBinding.DataController.Values[i, 4];
          i:=i-1;
        end;
    end;

  if (s = StrToCurr(summa)) then ModalResult:=mrOk
  else
  begin
    ShowMessage('Сума за розбивкою та сума документа не співпадають!');
    Exit;
  end;
end;

procedure TfmBankNich.cxButtonAddClick(Sender: TObject);
var
  month : Integer;
  month_edit : string;
  year : string;
  GetNameSP:TPfibStoredProc;
  Tr: TpFIBTransaction;
  Ds: TpFIBDataSet;
  razd_flag_1: Currency;
  DataSetProc:TpFIBDataSet;
  dataset_data:string;
  i, k : Integer;
begin
  if (cxParamGridTableView1.DataController.Summary.FooterSummaryValues[0] <> null) then
   summa_raz:=cxParamGridTableView1.DataController.Summary.FooterSummaryValues[0]
   else summa_raz:='0';
   fltForm1 := TfmBankNichAdd.Create(self, DB, id_us, date_d, summa, summa_raz);
   fltForm1.Enabled := false;
   fltForm1.Enabled := true;
   fltForm1.Visible := false;
   fltForm1.ShowModal;
   if fltForm1.ModalResult <> mrOk then
    begin
      //fltForm1.Free;
      exit;
    end
    else begin
         if(fltForm1.cxMonthEdit.ItemIndex = 0) then month:=1;
         if(fltForm1.cxMonthEdit.ItemIndex = 1) then month:=2;
         if(fltForm1.cxMonthEdit.ItemIndex = 2) then month:=3;
         if(fltForm1.cxMonthEdit.ItemIndex = 3) then month:=4;
         if(fltForm1.cxMonthEdit.ItemIndex = 4) then month:=5;
         if(fltForm1.cxMonthEdit.ItemIndex = 5) then month:=6;
         if(fltForm1.cxMonthEdit.ItemIndex = 6) then month:=7;
         if(fltForm1.cxMonthEdit.ItemIndex = 7) then month:=8;
         if(fltForm1.cxMonthEdit.ItemIndex = 8) then month:=9;
         if(fltForm1.cxMonthEdit.ItemIndex = 9) then month:=10;
         if(fltForm1.cxMonthEdit.ItemIndex = 10) then month:=11;
         if(fltForm1.cxMonthEdit.ItemIndex = 11) then month:=12;
         if(month = 1) then month_edit:='Січень';
         if(month = 2) then month_edit:='Лютий';
         if(month = 3) then month_edit:='Березень';
         if(month = 4) then month_edit:='Квітень';
         if(month = 5) then month_edit:='Травень';
         if(month = 6) then month_edit:='Червень';
         if(month = 7) then month_edit:='Липень';
         if(month = 8) then month_edit:='Серпень';
         if(month = 9) then month_edit:='Вересень';
         if(month = 10) then month_edit:='Жовтень';
         if(month = 11) then month_edit:='Листопад';
         if(month = 12) then month_edit:='Грудень';

         id_dog:=fltForm1.dog_flag;
         n_dog:=fltForm1.d_n_dog;
         d_dog:=fltForm1.d_d_dog;
         reg_dog:=fltForm1.d_reg_nomer;
         name_cust:=fltForm1.d_name_cust;

         cxParamGridTableView1.DataController.RecordCount := cxParamGridTableView1.DataController.RecordCount + 1;
         cxParamGridTableView1ColumnMonth.DataBinding.DataController.Values[cxParamGridTableView1.DataController.RecordCount - 1, 0]:=month_edit;
         cxParamGridTableView1ColumnYear.DataBinding.DataController.Values[cxParamGridTableView1.DataController.RecordCount - 1, 1]:=fltForm1.cxYearEdit.Text;
         cxParamGridTableView1ColumnSmt.DataBinding.DataController.Values[cxParamGridTableView1.DataController.RecordCount - 1, 2]:=fltForm1.kod_sm_group;
         cxParamGridTableView1ColumnRazd.DataBinding.DataController.Values[cxParamGridTableView1.DataController.RecordCount - 1, 3]:=fltForm1.kod_razd;
         cxParamGridTableView1ColumnSum.DataBinding.DataController.Values[cxParamGridTableView1.DataController.RecordCount - 1, 4]:=fltForm1.cxSumEdit.Value;
         cxParamGridTableView1month.DataBinding.DataController.Values[cxParamGridTableView1.DataController.RecordCount - 1, 5]:=fltForm1.month;
         cxParamGridTableView1SmGroup.DataBinding.DataController.Values[cxParamGridTableView1.DataController.RecordCount - 1, 6]:=fltForm1.id_sm_group;
         cxParamGridTableView1IdRazd.DataBinding.DataController.Values[cxParamGridTableView1.DataController.RecordCount - 1, 7]:=fltForm1.id_razd;
         cxParamGridTableView1SmGroupText.DataBinding.DataController.Values[cxParamGridTableView1.DataController.RecordCount - 1, 8]:=fltForm1.sm_group_text;
         cxParamGridTableView1RazdText.DataBinding.DataController.Values[cxParamGridTableView1.DataController.RecordCount - 1, 9]:=fltForm1.razd_text;
         cxParamGridTableView1.DataController.Post;
         Label2.Caption:='Група бюджета: ';
         Label1.Text:=fltForm1.cxSmEdit.Text;
         //fltForm1.Free;
    end;
    try
        cxParamGridTableView1.DataController.FocusedRowIndex:=cxParamGridTableView1.DataController.RecordCount-1;
        dataset_data:='01.0'+VarToStr(cxParamGridTableView1month.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRowIndex, 5])+'.'+VarToStr(cxParamGridTableView1ColumnYear.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRowIndex, 1]);
        DataSetProc:=TpFIBDataSet.Create(self);
        DataSetProc.Database:=DB;
        DataSetProc.Transaction:=pFIBTransaction1;
        pFIBTransaction1.StartTransaction;
        DataSetProc.Close;
        DataSetProc.SQLs.SelectSQL.Text:= 'SELECT * FROM BU_GET_SMGR_PLAN_RATIO_BY_STAT (:value1, :value2, :value3, :value4, :value5)';
        DataSetProc.ParamByName('value1').AsInteger:=StrToInt(cxParamGridTableView1SmGroup.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRecordIndex, 6]);
        DataSetProc.ParamByName('value2').AsInteger:=StrToInt(cxParamGridTableView1IdRazd.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRecordIndex, 7]);
        DataSetProc.ParamByName('value3').AsDate:=StrToDate(dataset_data);
        DataSetProc.ParamByName('value4').AsCurrency:=cxParamGridTableView1ColumnSum.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRecordIndex, 4];
        DataSetProc.ParamByName('value5').AsInteger:=0;
        DataSetProc.Open;
        DataSetProc.FetchAll;
        DataSetProc.First;
        cxResultGridDBTableView1.DataController.RecordCount:=0;
        for i:=1 to DataSetProc.RecordCount do
        begin
          cxResultGridDBTableView1.DataController.RecordCount := cxResultGridDBTableView1.DataController.RecordCount + 1;
          cxResultGridDBTableView1DBColumn1.DataBinding.DataController.Values[cxResultGridDBTableView1.DataController.RecordCount - 1, 0]:=DataSetProc.FieldByName('SM_CODE').AsString;
          cxResultGridDBTableView1DBColumn2.DataBinding.DataController.Values[cxResultGridDBTableView1.DataController.RecordCount - 1, 1]:=cxParamGridTableView1IdRazd.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRecordIndex, 7];
          cxResultGridDBTableView1DBColumn3.DataBinding.DataController.Values[cxResultGridDBTableView1.DataController.RecordCount - 1, 2]:=DataSetProc.FieldByName('ST_CODE').AsString;
          cxResultGridDBTableView1DBColumn4.DataBinding.DataController.Values[cxResultGridDBTableView1.DataController.RecordCount - 1, 3]:=DataSetProc.FieldByName('PROV_SUM_RATIO').AsCurrency;
          cxResultGridDBTableView1DBColumn5.DataBinding.DataController.Values[cxResultGridDBTableView1.DataController.RecordCount - 1, 4]:=DataSetProc.FieldByName('SM_TITLE').AsString;
          cxResultGridDBTableView1DBColumn6.DataBinding.DataController.Values[cxResultGridDBTableView1.DataController.RecordCount - 1, 5]:=DataSetProc.FieldByName('ID_SM').AsString;
          cxResultGridDBTableView1DBColumn7.DataBinding.DataController.Values[cxResultGridDBTableView1.DataController.RecordCount - 1, 6]:=DataSetProc.FieldByName('ID_ST').AsString;
          cxResultGridDBTableView1DBColumn8.DataBinding.DataController.Values[cxResultGridDBTableView1.DataController.RecordCount - 1, 7]:=DataSetProc.FieldByName('ST_TITLE').AsString;
          cxResultGridDBTableView1DBColumn9.DataBinding.DataController.Values[cxResultGridDBTableView1.DataController.RecordCount - 1, 8]:=cxParamGridTableView1ColumnRazd.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRecordIndex, 3];
          cxResultGridDBTableView1DBColumn10.DataBinding.DataController.Values[cxResultGridDBTableView1.DataController.RecordCount - 1, 9]:=cxParamGridTableView1RazdText.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRecordIndex, 9];
          cxResultGridDBTableView1.DataController.Post;
          DataSetProc.Next;
        end;
        DataSetProc.Close;
        pFIBTransaction1.Commit;
    except
          ShowMessage('Ви ввели некоректні дані! У цьому періоді нічого не заплановано.');
          k := cxParamGridTableView1.DataController.FocusedRecordIndex;
          if k < 0 then Exit;
          cxParamGridTableView1.DataController.DeleteRecord(k);
          cxButtonAddClick(self);
    end;



        //Достаем КЕКВ
        DataSetProc:=TpFIBDataSet.Create(self);
        DataSetProc.Database:=DB;
        DataSetProc.Transaction:=pFIBTransaction1;
        for i:=0 to cxResultGridDBTableView1.DataController.RecordCount - 1 do
        begin
          pFIBTransaction1.StartTransaction;
          DataSetProc.Close;
          DataSetProc.SQLs.SelectSQL.Text:= 'SELECT * FROM BU_GET_KEKV('''+VarToStr(dataset_data)+''', '''+VarToStr(cxResultGridDBTableView1DBColumn6.DataBinding.DataController.Values[i, 5]) +''')';
          DataSetProc.Open;
          cxResultGridDBTableView1DBColumn11.DataBinding.DataController.Values[i, 10]:=DataSetProc.FieldByName('ID_KEKV').AsString;
          cxResultGridDBTableView1.DataController.Post;
          DataSetProc.Close;
          DataSetProc.SQLs.SelectSQL.Text:= 'SELECT * FROM PUB_SPR_KEKV_INFO('''+ VarToStr(cxResultGridDBTableView1DBColumn11.DataBinding.DataController.Values[i, 10])+''', '''+ VarToStr(dataset_data) +''')';
          DataSetProc.Open;
          cxResultGridDBTableView1DBColumn12.DataBinding.DataController.Values[i, 11]:=DataSetProc.FieldByName('KEKV_KODE').AsString;
          cxResultGridDBTableView1DBColumn13.DataBinding.DataController.Values[i, 12]:=DataSetProc.FieldByName('KEKV_TITLE').AsString;
          cxResultGridDBTableView1.DataController.Post;
          DataSetProc.Close;
          pFIBTransaction1.Commit;
        end;


        //Достаем счет
        DataSetProc:=TpFIBDataSet.Create(self);
        DataSetProc.Database:=DB;
        DataSetProc.Transaction:=pFIBTransaction1;
        for i:=0 to cxResultGridDBTableView1.DataController.RecordCount - 1 do
        begin
          pFIBTransaction1.StartTransaction;
          DataSetProc.Close;
          DataSetProc.SQLs.SelectSQL.Text:= 'SELECT * FROM BU_GET_FOND(''' + VarToStr(cxResultGridDBTableView1DBColumn6.DataBinding.DataController.Values[i, 5]) + ''', ''' + VarToStr(cxResultGridDBTableView1DBColumn2.DataBinding.DataController.Values[i, 1]) + ''', ''' + VarToStr(dataset_data) + ''')';
          DataSetProc.Open;
          cxResultGridDBTableView1DBColumn14.DataBinding.DataController.Values[i, 13]:=DataSetProc.FieldByName('ID_FOND').AsString;
          cxResultGridDBTableView1DBColumn15.DataBinding.DataController.Values[i, 14]:=DataSetProc.FieldByName('FOND_NUM').AsString;
          cxResultGridDBTableView1DBColumn16.DataBinding.DataController.Values[i, 15]:=DataSetProc.FieldByName('FOND_TITLE').AsString;
          cxResultGridDBTableView1.DataController.Post;
          DataSetProc.Close;
          pFIBTransaction1.Commit;
        end;

end;


procedure TfmBankNich.cxButtonEditClick(Sender: TObject);
var
  month : Integer;
  month_edit : string;
  year : string;
  GetNameSP:TPfibStoredProc;
  Tr: TpFIBTransaction;
  Ds: TpFIBDataSet;
  razd_flag_1: Currency;
  format: TFormatSettings;
  f:string;
  DataSetProc:TpFIBDataSet;
  dataset_data:string;
  i, k : Integer;
begin
  k:=cxParamGridTableView1.DataController.FocusedRecordIndex;
  if (cxParamGridTableView1.DataController.RecordCount > 0) then
  begin
     if (cxParamGridTableView1ColumnMonth.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRecordIndex, 0] = 'Січень') then month:= 1;
     if (cxParamGridTableView1ColumnMonth.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRecordIndex, 0] = 'Лютий') then month:= 2;
     if (cxParamGridTableView1ColumnMonth.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRecordIndex, 0] = 'Березень') then month:= 3;
     if (cxParamGridTableView1ColumnMonth.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRecordIndex, 0] = 'Квітень') then month:= 4;
     if (cxParamGridTableView1ColumnMonth.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRecordIndex, 0] = 'Травень') then month:= 5;
     if (cxParamGridTableView1ColumnMonth.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRecordIndex, 0] = 'Червень') then month:= 6;
     if (cxParamGridTableView1ColumnMonth.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRecordIndex, 0] = 'Липень') then month:= 7;
     if (cxParamGridTableView1ColumnMonth.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRecordIndex, 0] = 'Серпень') then month:= 8;
     if (cxParamGridTableView1ColumnMonth.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRecordIndex, 0] = 'Вересень') then month:= 9;
     if (cxParamGridTableView1ColumnMonth.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRecordIndex, 0] = 'Жовтень') then month:= 10;
     if (cxParamGridTableView1ColumnMonth.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRecordIndex, 0] = 'Листопад') then month:= 11;
     if (cxParamGridTableView1ColumnMonth.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRecordIndex, 0] = 'Грудень') then month:= 12;
   format.DecimalSeparator := ',';
   if (cxParamGridTableView1.DataController.Summary.FooterSummaryValues[0] <> null) then
   summa_raz:=cxParamGridTableView1.DataController.Summary.FooterSummaryValues[0]
   else summa_raz:='0';
   fltForm1 := TfmBankNichAdd.Create(self, DB, id_us, date_d, summa, summa_raz);
   fltForm1.Enabled := false;
   fltForm1.Enabled := true;
   fltForm1.Visible := false;
   fltForm1.cxSmEditNum.Text:=cxParamGridTableView1ColumnSmt.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRecordIndex, 2];
   fltForm1.cxSmEdit.Text:=cxParamGridTableView1SmGroupText.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRecordIndex, 8];
   fltForm1.kod_sm_group :=cxParamGridTableView1ColumnSmt.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRecordIndex, 2];
   fltForm1.cxSumEdit.Value:=cxParamGridTableView1ColumnSum.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRecordIndex, 4];
   fltForm1.cxRazdEditNum.Text:=cxParamGridTableView1ColumnRazd.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRecordIndex, 3];
   fltForm1.cxRazdEdit.Text:=cxParamGridTableView1RazdText.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRecordIndex, 9];
   fltForm1.cxMonthEdit.ItemIndex:= month - 1;
   fltForm1.cxYearEdit.Text:= cxParamGridTableView1ColumnYear.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRecordIndex, 1];
   fltForm1.id_sm_group:=cxParamGridTableView1SmGroup.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRecordIndex, 6];
   fltForm1.id_razd:=cxParamGridTableView1IdRazd.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRecordIndex, 7];
   fltForm1.sm_group_text:=cxParamGridTableView1SmGroupText.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRecordIndex, 8];
   fltForm1.razd_text:=cxParamGridTableView1RazdText.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRecordIndex, 9];
   fltForm1.kod_razd:=cxParamGridTableView1ColumnRazd.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRecordIndex, 3];
   fltForm1.cxMemoEdit.Text := n_dog +  Un_R_file_Alex.BANK_NASTROYKA_VID  + d_dog + ' ' + name_cust + ' (рег. № ' + reg_dog + ')';
   fltForm1.dog_flag:=id_dog;
   fltForm1.d_n_dog:=n_dog;
   fltForm1.d_d_dog:=d_dog;
   fltForm1.d_reg_nomer:=reg_dog;
   fltForm1.d_name_cust:=name_cust;
   fltForm1.ShowModal;

   if fltForm1.ModalResult <> mrOk then
    begin
      //fltForm1.Free;
      exit;
    end
    else begin
         if(fltForm1.cxMonthEdit.ItemIndex = 0) then month:=1;
         if(fltForm1.cxMonthEdit.ItemIndex = 1) then month:=2;
         if(fltForm1.cxMonthEdit.ItemIndex = 2) then month:=3;
         if(fltForm1.cxMonthEdit.ItemIndex = 3) then month:=4;
         if(fltForm1.cxMonthEdit.ItemIndex = 4) then month:=5;
         if(fltForm1.cxMonthEdit.ItemIndex = 5) then month:=6;
         if(fltForm1.cxMonthEdit.ItemIndex = 6) then month:=7;
         if(fltForm1.cxMonthEdit.ItemIndex = 7) then month:=8;
         if(fltForm1.cxMonthEdit.ItemIndex = 8) then month:=9;
         if(fltForm1.cxMonthEdit.ItemIndex = 9) then month:=10;
         if(fltForm1.cxMonthEdit.ItemIndex = 10) then month:=11;
         if(fltForm1.cxMonthEdit.ItemIndex = 11) then month:=12;
         if(month = 1) then month_edit:='Січень';
         if(month = 2) then month_edit:='Лютий';
         if(month = 3) then month_edit:='Березень';
         if(month = 4) then month_edit:='Квітень';
         if(month = 5) then month_edit:='Травень';
         if(month = 6) then month_edit:='Червень';
         if(month = 7) then month_edit:='Липень';
         if(month = 8) then month_edit:='Серпень';
         if(month = 9) then month_edit:='Вересень';
         if(month = 10) then month_edit:='Жовтень';
         if(month = 11) then month_edit:='Листопад';
         if(month = 12) then month_edit:='Грудень';

         id_dog:=fltForm1.dog_flag;
         n_dog:=fltForm1.d_n_dog;
         d_dog:=fltForm1.d_d_dog;
         reg_dog:=fltForm1.d_reg_nomer;
         name_cust:=fltForm1.d_name_cust;


         cxParamGridTableView1ColumnMonth.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRecordIndex, 0]:=month_edit;
         cxParamGridTableView1ColumnYear.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRecordIndex, 1]:=fltForm1.cxYearEdit.Text;
         cxParamGridTableView1ColumnSmt.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRecordIndex, 2]:=fltForm1.kod_sm_group;
         cxParamGridTableView1ColumnRazd.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRecordIndex, 3]:=fltForm1.kod_razd;
         cxParamGridTableView1ColumnSum.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRecordIndex, 4]:=fltForm1.cxSumEdit.Value;
         cxParamGridTableView1month.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRecordIndex, 5]:=fltForm1.month;
         cxParamGridTableView1SmGroup.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRecordIndex, 6]:=fltForm1.id_sm_group;
         cxParamGridTableView1IdRazd.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRecordIndex, 7]:=fltForm1.id_razd;
         cxParamGridTableView1SmGroupText.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRecordIndex, 8]:=fltForm1.sm_group_text;
         cxParamGridTableView1RazdText.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRecordIndex, 9]:=fltForm1.razd_text;
         cxParamGridTableView1.DataController.Post;
         Label2.Caption:='Група бюджета: ';
         Label1.Text:=fltForm1.cxSmEdit.Text;
         //fltForm1.Free;
    end;

      try
        cxParamGridTableView1.DataController.FocusedRowIndex:=cxParamGridTableView1.DataController.RecordCount-1;
        dataset_data:='01.0'+VarToStr(cxParamGridTableView1month.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRowIndex, 5])+'.'+VarToStr(cxParamGridTableView1ColumnYear.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRowIndex, 1]);
        DataSetProc:=TpFIBDataSet.Create(self);
        DataSetProc.Database:=DB;
        DataSetProc.Transaction:=pFIBTransaction1;
        pFIBTransaction1.StartTransaction;
        DataSetProc.Close;
        DataSetProc.SQLs.SelectSQL.Text:= 'SELECT * FROM BU_GET_SMGR_PLAN_RATIO_BY_STAT (:value1, :value2, :value3, :value4, :value5)';
        DataSetProc.ParamByName('value1').AsInteger:=StrToInt(cxParamGridTableView1SmGroup.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRowIndex, 6]);
        DataSetProc.ParamByName('value2').AsInteger:=StrToInt(cxParamGridTableView1IdRazd.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRowIndex, 7]);
        DataSetProc.ParamByName('value3').AsDate:=StrToDate(dataset_data);
        DataSetProc.ParamByName('value4').AsCurrency:=cxParamGridTableView1ColumnSum.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRecordIndex, 4];
        DataSetProc.ParamByName('value5').AsInteger:=0;
        DataSetProc.Open;
        DataSetProc.FetchAll;
        DataSetProc.First;
        cxResultGridDBTableView1.DataController.RecordCount:=0;
        for i:=1 to DataSetProc.RecordCount do
        begin
          cxResultGridDBTableView1.DataController.RecordCount := cxResultGridDBTableView1.DataController.RecordCount + 1;
          cxResultGridDBTableView1DBColumn1.DataBinding.DataController.Values[cxResultGridDBTableView1.DataController.RecordCount - 1, 0]:=DataSetProc.FieldByName('SM_CODE').AsString;
          cxResultGridDBTableView1DBColumn2.DataBinding.DataController.Values[cxResultGridDBTableView1.DataController.RecordCount - 1, 1]:=cxParamGridTableView1IdRazd.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRowIndex, 7];
          cxResultGridDBTableView1DBColumn3.DataBinding.DataController.Values[cxResultGridDBTableView1.DataController.RecordCount - 1, 2]:=DataSetProc.FieldByName('ST_CODE').AsString;
          cxResultGridDBTableView1DBColumn4.DataBinding.DataController.Values[cxResultGridDBTableView1.DataController.RecordCount - 1, 3]:=DataSetProc.FieldByName('PROV_SUM_RATIO').AsString;
          cxResultGridDBTableView1DBColumn5.DataBinding.DataController.Values[cxResultGridDBTableView1.DataController.RecordCount - 1, 4]:=DataSetProc.FieldByName('SM_TITLE').AsString;
          cxResultGridDBTableView1DBColumn6.DataBinding.DataController.Values[cxResultGridDBTableView1.DataController.RecordCount - 1, 5]:=DataSetProc.FieldByName('ID_SM').AsString;
          cxResultGridDBTableView1DBColumn7.DataBinding.DataController.Values[cxResultGridDBTableView1.DataController.RecordCount - 1, 6]:=DataSetProc.FieldByName('ID_ST').AsString;
          cxResultGridDBTableView1DBColumn8.DataBinding.DataController.Values[cxResultGridDBTableView1.DataController.RecordCount - 1, 7]:=DataSetProc.FieldByName('ST_TITLE').AsString;
          cxResultGridDBTableView1DBColumn9.DataBinding.DataController.Values[cxResultGridDBTableView1.DataController.RecordCount - 1, 8]:=cxParamGridTableView1ColumnRazd.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRowIndex, 3];
          cxResultGridDBTableView1DBColumn10.DataBinding.DataController.Values[cxResultGridDBTableView1.DataController.RecordCount - 1, 9]:=cxParamGridTableView1RazdText.DataBinding.DataController.Values[cxParamGridTableView1.DataController.FocusedRowIndex, 9];
          cxResultGridDBTableView1.DataController.Post;
          DataSetProc.Next;
        end;
        DataSetProc.Close;
        pFIBTransaction1.Commit;
        except
          ShowMessage('Ви ввели некоректні дані! У цьому періоді нічого не заплановано.');
          k := cxParamGridTableView1.DataController.FocusedRecordIndex;
          if k < 0 then Exit;
          cxParamGridTableView1.DataController.DeleteRecord(k);
          cxButtonAddClick(self);
      end;

        //Достаем КЕКВ
        DataSetProc:=TpFIBDataSet.Create(self);
        DataSetProc.Database:=DB;
        DataSetProc.Transaction:=pFIBTransaction1;
        for i:=0 to cxResultGridDBTableView1.DataController.RecordCount - 1 do
        begin
          pFIBTransaction1.StartTransaction;
          DataSetProc.Close;
          DataSetProc.SQLs.SelectSQL.Text:= 'SELECT * FROM BU_GET_KEKV('''+VarToStr(dataset_data)+''', '''+VarToStr(cxResultGridDBTableView1DBColumn6.DataBinding.DataController.Values[i, 5]) +''')';
          DataSetProc.Open;
          cxResultGridDBTableView1DBColumn11.DataBinding.DataController.Values[i, 10]:=DataSetProc.FieldByName('ID_KEKV').AsString;
          cxResultGridDBTableView1.DataController.Post;
          DataSetProc.Close;
          DataSetProc.SQLs.SelectSQL.Text:= 'SELECT * FROM PUB_SPR_KEKV_INFO('''+ VarToStr(cxResultGridDBTableView1DBColumn11.DataBinding.DataController.Values[i, 10])+''', '''+ VarToStr(dataset_data) +''')';
          DataSetProc.Open;
          cxResultGridDBTableView1DBColumn12.DataBinding.DataController.Values[i, 11]:=DataSetProc.FieldByName('KEKV_KODE').AsString;
          cxResultGridDBTableView1DBColumn13.DataBinding.DataController.Values[i, 12]:=DataSetProc.FieldByName('KEKV_TITLE').AsString;
          cxResultGridDBTableView1.DataController.Post;
          DataSetProc.Close;
          pFIBTransaction1.Commit;
        end;


        //Достаем счет
        DataSetProc:=TpFIBDataSet.Create(self);
        DataSetProc.Database:=DB;
        DataSetProc.Transaction:=pFIBTransaction1;
        for i:=0 to cxResultGridDBTableView1.DataController.RecordCount - 1 do
        begin
          pFIBTransaction1.StartTransaction;
          DataSetProc.Close;
          DataSetProc.SQLs.SelectSQL.Text:= 'SELECT * FROM BU_GET_FOND(''' + VarToStr(cxResultGridDBTableView1DBColumn6.DataBinding.DataController.Values[i, 5]) + ''', ''' + VarToStr(cxResultGridDBTableView1DBColumn2.DataBinding.DataController.Values[i, 1]) + ''', ''' + VarToStr(dataset_data) + ''')';
          DataSetProc.Open;
          cxResultGridDBTableView1DBColumn14.DataBinding.DataController.Values[i, 13]:=DataSetProc.FieldByName('ID_FOND').AsString;
          cxResultGridDBTableView1DBColumn15.DataBinding.DataController.Values[i, 14]:=DataSetProc.FieldByName('FOND_NUM').AsString;
          cxResultGridDBTableView1DBColumn16.DataBinding.DataController.Values[i, 15]:=DataSetProc.FieldByName('FOND_TITLE').AsString;
          cxResultGridDBTableView1.DataController.Post;
          DataSetProc.Close;
          pFIBTransaction1.Commit;
        end;


     end else ShowMessage('Немає жодного запису! Нічого редагувати! Натисніть додати!');


     cxParamGridTableView1.DataController.FocusedRecordIndex:=k;
end;


procedure TfmBankNich.cxButtonDelClick(Sender: TObject);
var
  k, i, buttonSelected: Integer;
begin
  if(cxParamGridTableView1.DataController.RecordCount > 0) then begin
  if MessageBox(Handle,'Ви дійсно бажаєте видалити запис?', Pchar(Un_R_file_Alex.N_AUTOKOD_MESSAGE_OK), mb_YesNO)=mrYes  then
  begin
    i:=cxResultGridDBTableView1.DataController.RecordCount - 1;
    while (i <> -1) do
    begin
      cxResultGridDBTableView1.DataController.DeleteRecord(i);
      i:=i-1;
    end;
    k := cxParamGridTableView1.DataController.FocusedRecordIndex;
    if k < 0 then Exit;
    cxParamGridTableView1.DataController.DeleteRecord(k);
  end;
end else ShowMessage('Немає жодного запису! Нічого видаляти!');
end;

end.

