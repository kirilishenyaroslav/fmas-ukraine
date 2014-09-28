unit uPrK_Results_of_Filtr_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid,AArray, cxCheckBox, cxLabel, RxMemDS,
  FIBDataSet, pFIBDataSet, cxDBLookupComboBox, StdCtrls, dxBar,
  dxBarExtItems, ActnList, ImgList;

Type TPrKColProp=(LabelPropC,TextEditPropC,CheckBoxPropC,LookupComboBoxPropC);
type
  TFormPrK_Results_of_Filtr_Edit = class(TForm)
    cxGridPrKEdit: TcxGrid;
    cxGridPrKEditDBTableView1: TcxGridDBTableView;
    cxGridPrKEditLevel1: TcxGridLevel;
    DataSetPrKEdit: TpFIBDataSet;
    RxMemoryDataPrKEdit: TRxMemoryData;
    DataSourcePrKEdit: TDataSource;
    DataSourceEditDopData1: TDataSource;
    DataSetEditDopData1: TpFIBDataSet;
    ImageListEkzVedom: TImageList;
    ActionListFiltrEdit: TActionList;
    ActionObnov: TAction;
    ActionSave: TAction;
    ActionOtmena: TAction;
    dxBarManagerEkzVedom: TdxBarManager;
    dxBarLargeButtonObnov: TdxBarLargeButton;
    dxBarLargeButtonSave: TdxBarLargeButton;
    dxBarLargeButtonOtmena: TdxBarLargeButton;
    DataSourceEditDopData2: TDataSource;
    DataSetEditDopData2: TpFIBDataSet;
    procedure FormCreate(Sender: TObject);
    procedure cxGridPrKEditDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
   procedure colLookupComboBoxPropEditValueChanged(Sender: TObject);
    procedure ActionOtmenaExecute(Sender: TObject);
    procedure ActionObnovExecute(Sender: TObject);
    procedure ActionSaveExecute(Sender: TObject);
  private
    LangEdit :integer;
    DataRF   :TAArray;
    FSelectSQLTextPrKEdit: string;
    FSelectSQLTextPrKEditDopData1: string;
    FSelectSQLTextPrKEditDopData2: string;
    procedure InicCaption;
    procedure SetSelectSQLTextPrKEdit(const Value: string);
    procedure ColCreate(columnName:string;fldName:string;columnCaption :string;TipProp :TPrKColProp;aListCol: TAArray=nil;aDataSource :TDataSource=nil);
    procedure SetSelectSQLTextPrKEditDopData1(const Value: string);
    procedure SetSelectSQLTextPrKEditDopData2(const Value: string);
  public
    constructor Create(aOwner: TComponent;aData :TAArray);overload;
    Property SelectSQLTextPrKEdit :string read FSelectSQLTextPrKEdit write SetSelectSQLTextPrKEdit;
    Property SelectSQLTextPrKEditDopData1 :string read FSelectSQLTextPrKEditDopData1 write SetSelectSQLTextPrKEditDopData1;
    Property SelectSQLTextPrKEditDopData2 :string read FSelectSQLTextPrKEditDopData2 write SetSelectSQLTextPrKEditDopData2;
  end;

var
  FormPrK_Results_of_Filtr_Edit: TFormPrK_Results_of_Filtr_Edit;

implementation
uses
 uPrK_Resources,uConstants,uPrK_Results_of_Filtr;
{$R *.dfm}


constructor TFormPrK_Results_of_Filtr_Edit.Create(aOwner: TComponent;
  aData: TAArray);
begin
  DataRF     :=aData;
  LangEdit   :=SelectLanguage;
  inherited Create(aOwner);
end;

procedure TFormPrK_Results_of_Filtr_Edit.FormCreate(Sender: TObject);
var
   ListCol :TAArray;
   i:integer;
begin
   InicCaption;
   ListCol :=TAArray.Create;
   ColCreate('colFIO', 'fio',ncolFIO[LangEdit],LabelPropC);
   case TFormPrK_Results_of_Filtr(Self.Owner).cxRadioGroupCaseEdit.ItemIndex of
   0:   {Номер дела}
     begin
       ColCreate('colNomer_dela',      'nomer_dela',       ncolNOMER_DELA[LangEdit],            TextEditPropC);
       ColCreate('colJurnal_npp',      'jurnal_npp',       nColNpp[LangEdit],         TextEditPropC);
       ColCreate('colDate_append_rec', 'date_append_rec',  nColDateReg[LangEdit],     TextEditPropC);
     end;
   1:  {Категория приема}
     begin
       SelectSQLTextPrKEditDopData1      :='select * from PRK_SP_KAT_PRI_D_SELECT';
       SelectSQLTextPrKEditDopData2      :='select * from PRK_SP_KAT_PRI_X_SELECT';
       ColCreate('colNomer_dela',      'nomer_dela',           ncolNOMER_DELA[LangEdit],     LabelPropC);

      {1}ListCol['KeyFieldNames'].AsString :='id_sp_kat_pri_d';
         ListCol['Item_Kol_vo'].AsInteger  :=1;
         i:=0;
         ListCol['Item_Name'][i].AsString :='short_name';
       ColCreate('colkat_pri_d', 'id_sp_kat_pri_d',ncolKat_Pri_D[LangEdit],LookupComboBoxPropC,ListCol,DataSourceEditDopData1);

      {2}ListCol['KeyFieldNames'].AsString :='id_sp_kat_pri_x';
         ListCol['Item_Kol_vo'].AsInteger  :=1;
         i:=0;
         ListCol['Item_Name'][i].AsString :='short_name';
       ColCreate('colkat_pri_x', 'id_sp_kat_pri_x',ncolKat_Pri_X[LangEdit],LookupComboBoxPropC,ListCol,DataSourceEditDopData2);
     end;
   2:   {Протокол про допуск}
     begin
       SelectSQLTextPrKEditDopData1      :='select * from PRK_FND_PROT_DOPUSK_SELECT('+IntToStr(TFormPrK_Results_of_Filtr(Self.Owner).ID_GOD_NABORA_GLOBAL)+')';
       ColCreate('colNomer_dela',      'nomer_dela',   ncolNOMER_DELA[LangEdit],     LabelPropC);

      {1}ListCol['KeyFieldNames'].AsString :='id_dt_prot_dopusk';
         ListCol['Item_Kol_vo'].AsInteger  :=4;
         i:=0;
         ListCol['Item_Name'][i].AsString :='nomer';
         i:=1;
         ListCol['Item_Name'][i].AsString :='period';
         i:=2;
         ListCol['Item_Name'][i].AsString :='date_form';
         i:=3;
         ListCol['Item_Name'][i].AsString :='short_name_fob_prot';
       ColCreate('colNomer', 'id_dt_prot_dopusk',ncolNOMER[LangEdit],LookupComboBoxPropC,ListCol,DataSourceEditDopData1);

      {2}ListCol['KeyFieldNames'].AsString :='id_dt_prot_dopusk';
         ListCol['Item_Kol_vo'].AsInteger  :=4;
         i:=0;
         ListCol['Item_Name'][i].AsString :='period';
         i:=1;
         ListCol['Item_Name'][i].AsString :='nomer';
         i:=2;
         ListCol['Item_Name'][i].AsString :='date_form';
         i:=3;
         ListCol['Item_Name'][i].AsString :='short_name_fob_prot';
       ColCreate('colPeriod',  'id_dt_prot_dopusk', ncolPeriod[LangEdit], LookupComboBoxPropC,ListCol,DataSourceEditDopData1);

      {3}ListCol['KeyFieldNames'].AsString :='id_dt_prot_dopusk';
         ListCol['Item_Kol_vo'].AsInteger  :=4;
         i:=0;
         ListCol['Item_Name'][i].AsString :='date_form';
         i:=1;
         ListCol['Item_Name'][i].AsString :='nomer';
         i:=2;
         ListCol['Item_Name'][i].AsString :='period';
         i:=3;
         ListCol['Item_Name'][i].AsString :='short_name_fob_prot';
       ColCreate('colDate_form',  'id_dt_prot_dopusk',  ncolDATE_FORM[LangEdit], LookupComboBoxPropC,ListCol,DataSourceEditDopData1);

      {4}ListCol['KeyFieldNames'].AsString :='id_dt_prot_dopusk';
         ListCol['Item_Kol_vo'].AsInteger  :=4;
         i:=0;
         ListCol['Item_Name'][i].AsString :='short_name_fob_prot';
         i:=1;
         ListCol['Item_Name'][i].AsString :='nomer';
         i:=2;
         ListCol['Item_Name'][i].AsString :='period';
         i:=3;
         ListCol['Item_Name'][i].AsString :='date_form';
       ColCreate('colName_fob_prot',  'id_dt_prot_dopusk', ncolNAME_FOB_PROT[LangEdit], LookupComboBoxPropC,ListCol,DataSourceEditDopData1);

     end;

     3:  {Протокол про зарах.}
     begin
       SelectSQLTextPrKEditDopData1      :='select * from PRK_FND_PROT_ZACH_SELECT('+IntToStr(TFormPrK_Results_of_Filtr(Self.Owner).ID_GOD_NABORA_GLOBAL)+')';
       ColCreate('colNomer_dela',      'nomer_dela',   ncolNOMER_DELA[LangEdit],     LabelPropC);

      {1}ListCol['KeyFieldNames'].AsString :='id_dt_prot_zach';
         ListCol['Item_Kol_vo'].AsInteger  :=4;
         i:=0;
         ListCol['Item_Name'][i].AsString :='nomer';
         i:=1;
         ListCol['Item_Name'][i].AsString :='short_name_derg_zakaz_prot_zach';
         i:=2;
         ListCol['Item_Name'][i].AsString :='date_form';
         i:=3;
         ListCol['Item_Name'][i].AsString :='short_name_fob_prot';
       ColCreate('colNomer', 'id_dt_prot_zach',ncolNOMER[LangEdit],LookupComboBoxPropC,ListCol,DataSourceEditDopData1);

      {2}ListCol['KeyFieldNames'].AsString :='id_dt_prot_zach';
         ListCol['Item_Kol_vo'].AsInteger  :=4;
         i:=0;
         ListCol['Item_Name'][i].AsString :='short_name_derg_zakaz_prot_zach';
         i:=1;
         ListCol['Item_Name'][i].AsString :='nomer';
         i:=2;
         ListCol['Item_Name'][i].AsString :='date_form';
         i:=3;
         ListCol['Item_Name'][i].AsString :='short_name_fob_prot';
       ColCreate('colderg_zakaz',  'id_dt_prot_zach', ncolDERG_ZAKAZ[LangEdit], LookupComboBoxPropC,ListCol,DataSourceEditDopData1);

      {3}ListCol['KeyFieldNames'].AsString :='id_dt_prot_zach';
         ListCol['Item_Kol_vo'].AsInteger  :=4;
         i:=0;
         ListCol['Item_Name'][i].AsString :='date_form';
         i:=1;
         ListCol['Item_Name'][i].AsString :='nomer';
         i:=2;
         ListCol['Item_Name'][i].AsString :='short_name_derg_zakaz_prot_zach';
         i:=3;
         ListCol['Item_Name'][i].AsString :='short_name_fob_prot';
       ColCreate('colDate_form',  'id_dt_prot_zach',  ncolDATE_FORM[LangEdit], LookupComboBoxPropC,ListCol,DataSourceEditDopData1);

      {4}ListCol['KeyFieldNames'].AsString :='id_dt_prot_zach';
         ListCol['Item_Kol_vo'].AsInteger  :=4;
         i:=0;
         ListCol['Item_Name'][i].AsString :='short_name_fob_prot';
         i:=1;
         ListCol['Item_Name'][i].AsString :='nomer';
         i:=2;
         ListCol['Item_Name'][i].AsString :='short_name_derg_zakaz_prot_zach';
         i:=3;
         ListCol['Item_Name'][i].AsString :='date_form';
       ColCreate('colName_fob_prot',  'id_dt_prot_zach', ncolNAME_FOB_PROT[LangEdit], LookupComboBoxPropC,ListCol,DataSourceEditDopData1);

     end;

     4: {Признак зарахуванняя}
     begin
        SelectSQLTextPrKEditDopData1      :='select * from PRK_SP_PRIZN_ZACHISL_SELECT';
        ColCreate('colNomer_dela',      'nomer_dela',         ncolNOMER_DELA[LangEdit],     LabelPropC);
        ColCreate('colIs_cel_nabor',    'is_cel_nabor',       ncolIS_CEL_NABOR[LangEdit],   CheckBoxPropC);
        ColCreate('colIs_rek_zachisl',  'is_rek_zachisl',     ncolIS_REK_ZACHISL[LangEdit], CheckBoxPropC);
         ListCol['KeyFieldNames'].AsString :='id_sp_prizn_zachisl';
         ListCol['Item_Kol_vo'].AsInteger  :=1;
         i:=0;
         ListCol['Item_Name'][i].AsString :='short_name';
        ColCreate('colPrizn_zachisl',   'id_sp_prizn_zachisl',ncolPrizn_zachisl[LangEdit],LookupComboBoxPropC,ListCol,DataSourceEditDopData1);
     end;

     5: {Накази}
     begin
        SelectSQLTextPrKEditDopData1      :='select * from PRK_FND_PRIK_ZACH_SELECT('+IntToStr(TFormPrK_Results_of_Filtr(Self.Owner).ID_GOD_NABORA_GLOBAL)+')';
        ColCreate('colNomer_dela',      'nomer_dela',         ncolNOMER_DELA[LangEdit],     LabelPropC);

     {1}ListCol['KeyFieldNames'].AsString :='id_dt_prik_zach';
         ListCol['Item_Kol_vo'].AsInteger  :=3;
         i:=0;
         ListCol['Item_Name'][i].AsString :='nomer';
         i:=1;
         ListCol['Item_Name'][i].AsString :='date_prikaz';
         i:=2;
         ListCol['Item_Name'][i].AsString :='date_zarax';
       ColCreate('colNomer',   'id_dt_prik_zach',ncolNomer[LangEdit],LookupComboBoxPropC,ListCol,DataSourceEditDopData1);

     {2}ListCol['KeyFieldNames'].AsString :='id_dt_prik_zach';
         ListCol['Item_Kol_vo'].AsInteger  :=3;
         i:=0;
         ListCol['Item_Name'][i].AsString :='date_prikaz';
         i:=1;
         ListCol['Item_Name'][i].AsString :='nomer';
         i:=2;
         ListCol['Item_Name'][i].AsString :='date_zarax';
       ColCreate('colDate_prikaz',   'id_dt_prik_zach',ncolDATE_PRIKAZ[LangEdit],LookupComboBoxPropC,ListCol,DataSourceEditDopData1);

     {2}ListCol['KeyFieldNames'].AsString :='id_dt_prik_zach';
         ListCol['Item_Kol_vo'].AsInteger  :=3;
         i:=0;
         ListCol['Item_Name'][i].AsString :='date_zarax';
         i:=1;
         ListCol['Item_Name'][i].AsString :='nomer';
         i:=2;
         ListCol['Item_Name'][i].AsString :='date_prikaz';
       ColCreate('colDate_zarax',   'id_dt_prik_zach',ncolDATE_ZARAX[LangEdit],LookupComboBoxPropC,ListCol,DataSourceEditDopData1);

     end;

     6:{Недопуск}
     begin
       ColCreate('colNomer_dela',      'nomer_dela',  ncolNOMER_DELA[LangEdit],     LabelPropC);
       ColCreate('colIs_nedopusk',     'Is_nedopusk', ncolIs_nedopusk[LangEdit], CheckBoxPropC);
     end;

     7:  {Забрав документи}
     begin
        SelectSQLTextPrKEditDopData1      :='select * from PRK_SP_ZABR_SELECT';
        ColCreate('colNomer_dela',      'nomer_dela',         ncolNOMER_DELA[LangEdit],     LabelPropC);

     {1}ListCol['KeyFieldNames'].AsString :='id_sp_zabr';
         ListCol['Item_Kol_vo'].AsInteger  :=1;
         i:=0;
         ListCol['Item_Name'][i].AsString :='short_name';
        ColCreate('colid_sp_zabr',    'id_sp_zabr',  nColNameZabrDoc[LangEdit], LookupComboBoxPropC,ListCol,DataSourceEditDopData1);
        ColCreate('colDate_zabr',     'date_zabr',   nColDateZabrDoc[LangEdit], TextEditPropC);
     end;
   end;
  // SelectSQLTextPrKEdit  :='select * from PRK_FND_ABIT_LIST_SELECT(:ID_SP_GOD_NABORA) where ID_DT_ABIT in '+DataRF['TextWhere'].asString;
   SelectSQLTextPrKEdit  :='select * from PRK_FND_ABIT_LIST_SELECT(:ID_SP_GOD_NABORA,:WHERE_STMT)';
   ListCol.Free;
   ListCol:=nil;
end;

procedure TFormPrK_Results_of_Filtr_Edit.ColCreate(columnName:string;fldName:string;columnCaption :string;TipProp :TPrKColProp;aListCol: TAArray=nil;aDataSource :TDataSource=nil);
var
  tmpColumn:TcxGridDBColumn;
  i:integer;
begin
    with cxGridPrKEditDBTableView1 do
    begin
      tmpColumn := CreateColumn;
      with tmpColumn do
      begin
        case TipProp of
        LabelPropC:
           begin
             PropertiesClassName                                := 'TcxLabelProperties';
           end;
        CheckBoxPropC:
           begin
             PropertiesClassName                                := 'TcxCheckBoxProperties';
             TcxCheckBoxProperties(Properties).DisplayUnchecked := 'False';
             TcxCheckBoxProperties(Properties).NullStyle        := nssUnchecked;
             TcxCheckBoxProperties(Properties).ReadOnly         := False;
             TcxCheckBoxProperties(Properties).ValueChecked     := 1;
             TcxCheckBoxProperties(Properties).ValueUnchecked   := 0;
           end;
        LookupComboBoxPropC:
           begin
             PropertiesClassName                                   := 'TcxLookupComboBoxProperties';
             TcxLookupComboBoxProperties(Properties).KeyFieldNames := aListCol['KeyFieldNames'].AsString; //'??? ID_SP_OCENKA';
             for i:=0 to aListCol['Item_Kol_vo'].AsInteger-1 do
              begin
               TcxLookupComboBoxProperties(Properties).ListColumns.Add;
               TcxLookupComboBoxProperties(Properties).ListColumns.Items[i].FieldName := aListCol['Item_Name'][i].AsString;
               TcxLookupComboBoxProperties(Properties).ListColumns.Items[i].Width:=100;
              end;
             TcxLookupComboBoxProperties(Properties).DropDownWidth                    :=350;
             TcxLookupComboBoxProperties(Properties).ListOptions.ShowHeader           := False;
             TcxLookupComboBoxProperties(Properties).ListSource                       := aDataSource;
             TcxLookupComboBoxProperties(Properties).ReadOnly                         := False;
             //TcxLookupComboBoxProperties(Properties).OnEditValueChanged               := colLookupComboBoxPropEditValueChanged;
           end;
        end;

        HeaderAlignmentHorz   := taCenter;
        HeaderAlignmentVert   := vaCenter;
        Name                  := columnName;
        DataBinding.FieldName := fldName;
        FooterAlignmentHorz   := taCenter;
        Caption               := columnCaption;
      end;
    end;
end;

procedure TFormPrK_Results_of_Filtr_Edit.InicCaption;
begin

   cxGridPrKEditDBTableView1.Styles.Header     :=TFormPrK_Results_of_Filtr(Self.Owner).cxStyleHeader;
   cxGridPrKEditDBTableView1.Styles.Background :=TFormPrK_Results_of_Filtr(Self.Owner).cxStyleSkyBlue;
   cxGridPrKEditDBTableView1.Styles.Content    :=TFormPrK_Results_of_Filtr(Self.Owner).cxStyleSkyBlue;
   cxGridPrKEditDBTableView1.Styles.Selection  :=TFormPrK_Results_of_Filtr(Self.Owner).cxStyleSelection;
   cxGridPrKEditDBTableView1.Styles.Inactive   :=TFormPrK_Results_of_Filtr(Self.Owner).cxStyleInactive;

   TFormPrK_Results_of_Filtr_Edit(self).Caption  :=nFormPrK_Results_of_Filtr_Edit_Caption[LangEdit];
   ActionObnov.Caption       :=nActiont_Obnov[LangEdit];
   ActionSave.Caption       :=nActionSave[LangEdit];
   ActionOtmena.Caption      :=nAction_Exit[LangEdit];
   ActionObnov.Hint          :=nHintAction_Obnov[LangEdit];
   ActionSave.Hint           :=nHintActionSaveVedom[LangEdit];
   ActionOtmena.Hint         :=nHintAction_Exit[LangEdit];

end;

procedure TFormPrK_Results_of_Filtr_Edit.SetSelectSQLTextPrKEdit(
  const Value: string);
begin
  FSelectSQLTextPrKEdit := Value;
    DataSetPrKEdit.Active                                  :=false;
    DataSetPrKEdit.Database                                := TFormPrK_Results_of_Filtr(Self.Owner).DataBasePrK;
    DataSetPrKEdit.Transaction                             := TFormPrK_Results_of_Filtr(Self.Owner).TransactionReadPrK;
    DataSetPrKEdit.SelectSQL.Clear;
    DataSetPrKEdit.SQLs.SelectSQL.Text                     := FSelectSQLTextPrKEdit;
    DataSetPrKEdit.ParamByName('ID_SP_GOD_NABORA').AsInt64 :=TFormPrK_Results_of_Filtr(Self.Owner).ID_GOD_NABORA_GLOBAL;
    DataSetPrKEdit.ParamByName('WHERE_STMT').AsString :='ID_DT_ABIT in' + DataRF['TextWhere'].asString;
    DataSetPrKEdit.CloseOpen(false);
    DataSetPrKEdit.fetchAll;
    RxMemoryDataPrKEdit.LoadFromDataSet(DataSetPrKEdit,DataSetPrKEdit.RecordCount,lmCopy);
    DataSetPrKEdit.Active:=false;
end;

procedure TFormPrK_Results_of_Filtr_Edit.cxGridPrKEditDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AviewInfo.Item.PropertiesClassName='TcxLabelProperties' then
   begin
            ACanvas.FillRect(AViewInfo.Bounds);
            ACanvas.Font.color :=clGray;
            ADone := false;
   end;

end;


procedure TFormPrK_Results_of_Filtr_Edit.SetSelectSQLTextPrKEditDopData1(
  const Value: string);
begin
  FSelectSQLTextPrKEditDopData1 := Value;
    DataSetEditDopData1.Active                                  :=false;
    DataSetEditDopData1.Database                                := TFormPrK_Results_of_Filtr(Self.Owner).DataBasePrK;
    DataSetEditDopData1.Transaction                             := TFormPrK_Results_of_Filtr(Self.Owner).TransactionReadPrK;
    DataSetEditDopData1.SelectSQL.Clear;
    DataSetEditDopData1.SQLs.SelectSQL.Text                     := FSelectSQLTextPrKEditDopData1;
    DataSetEditDopData1.CloseOpen(false);
end;

procedure TFormPrK_Results_of_Filtr_Edit.SetSelectSQLTextPrKEditDopData2(
  const Value: string);
begin
  FSelectSQLTextPrKEditDopData2 := Value;
  DataSetEditDopData2.Active                                  :=false;
    DataSetEditDopData2.Database                                := TFormPrK_Results_of_Filtr(Self.Owner).DataBasePrK;
    DataSetEditDopData2.Transaction                             := TFormPrK_Results_of_Filtr(Self.Owner).TransactionReadPrK;
    DataSetEditDopData2.SelectSQL.Clear;
    DataSetEditDopData2.SQLs.SelectSQL.Text                     := FSelectSQLTextPrKEditDopData2;
    DataSetEditDopData2.CloseOpen(false);
end;

procedure TFormPrK_Results_of_Filtr_Edit.colLookupComboBoxPropEditValueChanged(Sender: TObject);
begin
    RxMemoryDataPrKEdit.Edit;
    RxMemoryDataPrKEdit.Post;
end;

procedure TFormPrK_Results_of_Filtr_Edit.ActionOtmenaExecute(
  Sender: TObject);
begin
     close;
end;

procedure TFormPrK_Results_of_Filtr_Edit.ActionObnovExecute(
  Sender: TObject);
begin
    DataSetPrKEdit.CloseOpen(false);
    DataSetPrKEdit.fetchAll;
    RxMemoryDataPrKEdit.LoadFromDataSet(DataSetPrKEdit,DataSetPrKEdit.RecordCount,lmCopy);
    DataSetPrKEdit.Active:=false;
end;

procedure TFormPrK_Results_of_Filtr_Edit.ActionSaveExecute(
  Sender: TObject);
var
  id_loc:int64;
begin
   if RxMemoryDataPrKEdit.FieldValues['id_dt_abit']=NULL then exit;
   RxMemoryDataPrKEdit.edit;
   RxMemoryDataPrKEdit.Post;
   case TFormPrK_Results_of_Filtr(Self.Owner).cxRadioGroupCaseEdit.ItemIndex of
   0:{Номер дела}
     begin
        TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.Transaction.StartTransaction;
        id_loc:=RxMemoryDataPrKEdit.FieldValues['id_dt_abit'];
        RxMemoryDataPrKEdit.first;
        while not RxMemoryDataPrKEdit.eof do
        begin
        
          if  (RxMemoryDataPrKEdit.FieldValues['nomer_dela']=Null) or (RxMemoryDataPrKEdit.FieldValues['jurnal_npp']=Null)or
              (RxMemoryDataPrKEdit.FieldValues['nomer_dela']<=0)   or (RxMemoryDataPrKEdit.FieldValues['jurnal_npp']<=0)  then
           begin
             Showmessage(nMsgNomerMoreZero[LangEdit]);
             TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.Transaction.Rollback;
             exit;
           end;
          if  RxMemoryDataPrKEdit.FieldValues['date_append_rec']=Null then
           begin
             Showmessage(nMsgEmptyDATE[LangEdit]);
             TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.Transaction.Rollback;
             exit;
           end;

          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.StoredProcName:='PRK_FND_ND_NPP_DPP_UPD';
          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.Prepare;
          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ParamByName('id_dt_abit').AsInt64         :=RxMemoryDataPrKEdit.FieldValues['id_dt_abit'];
          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ParamByName('nomer_dela').AsInteger       :=RxMemoryDataPrKEdit.FieldValues['nomer_dela'];
          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ParamByName('jurnal_npp').AsInteger       :=RxMemoryDataPrKEdit.FieldValues['jurnal_npp'];
          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ParamByName('date_append_rec').AsDate     :=RxMemoryDataPrKEdit.FieldValues['date_append_rec'];
          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ParamByName('id_user').AsInt64            :=TFormPrK_Results_of_Filtr(Self.Owner).ID_USER_GLOBAL;
          try
             TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ExecProc;
          except on e: Exception do
             begin
                MessageBox(Handle,Pchar(nMsgErrorTransaction[LangEdit]+chr(13)+
                       nMsgTryAgain[LangEdit]+nMsgOr[LangEdit]+nMsgToAdmin[LangEdit]+chr(13)+
                       e.Message),Pchar(nMsgBoxTitle[LangEdit]),MB_OK or MB_ICONWARNING);
                TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.Transaction.Rollback;
                exit;
             end;
          end;
          RxMemoryDataPrKEdit.next;
        end;
        try
          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.Transaction.Commit;
        except on e: Exception do
          begin
             MessageBox(Handle,Pchar(nMsgErrorTransaction[LangEdit]+chr(13)+
                    nMsgTryAgain[LangEdit]+nMsgOr[LangEdit]+nMsgToAdmin[LangEdit]+chr(13)+
                    e.Message),Pchar(nMsgBoxTitle[LangEdit]),MB_OK or MB_ICONWARNING);
             TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.Transaction.Rollback;
             exit;
          end;
        end;
        RxMemoryDataPrKEdit.Locate('id_dt_abit',id_loc,[]);
        ShowMessage(nMsgSaveDataWasOk[LangEdit]);
     end;

   1:{Категория приема}
     begin
        TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.Transaction.StartTransaction;
        id_loc:=RxMemoryDataPrKEdit.FieldValues['id_dt_abit'];
        RxMemoryDataPrKEdit.first;
        while not RxMemoryDataPrKEdit.eof do
        begin
          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.StoredProcName:='PRK_FND_KAT_PRI_UPD';
          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.Prepare;
          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ParamByName('id_dt_abit').AsInt64          :=RxMemoryDataPrKEdit.FieldValues['id_dt_abit'];
          if (RxMemoryDataPrKEdit.FieldValues['id_sp_kat_pri_d']=Null) or
             (RxMemoryDataPrKEdit.FieldValues['id_sp_kat_pri_d']=-1)
           then TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ParamByName('id_sp_kat_pri_d').AsInt64       :=-1
           else TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ParamByName('id_sp_kat_pri_d').AsInt64       :=RxMemoryDataPrKEdit.FieldValues['id_sp_kat_pri_d'];
          if (RxMemoryDataPrKEdit.FieldValues['id_sp_kat_pri_x']=Null) or
             (RxMemoryDataPrKEdit.FieldValues['id_sp_kat_pri_x']=-1)
           then TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ParamByName('id_sp_kat_pri_x').AsInt64       :=-1
           else TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ParamByName('id_sp_kat_pri_x').AsInt64       :=RxMemoryDataPrKEdit.FieldValues['id_sp_kat_pri_x'];
          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ParamByName('id_user').AsInt64            :=TFormPrK_Results_of_Filtr(Self.Owner).ID_USER_GLOBAL;
          try
             TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ExecProc;
          except on e: Exception do
             begin
                MessageBox(Handle,Pchar(nMsgErrorTransaction[LangEdit]+chr(13)+
                       nMsgTryAgain[LangEdit]+nMsgOr[LangEdit]+nMsgToAdmin[LangEdit]+chr(13)+
                       e.Message),Pchar(nMsgBoxTitle[LangEdit]),MB_OK or MB_ICONWARNING);
                TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.Transaction.Rollback;
                exit;
             end;
          end;
          RxMemoryDataPrKEdit.next;
        end;
        try
          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.Transaction.Commit;
        except on e: Exception do
          begin
             MessageBox(Handle,Pchar(nMsgErrorTransaction[LangEdit]+chr(13)+
                    nMsgTryAgain[LangEdit]+nMsgOr[LangEdit]+nMsgToAdmin[LangEdit]+chr(13)+
                    e.Message),Pchar(nMsgBoxTitle[LangEdit]),MB_OK or MB_ICONWARNING);
             TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.Transaction.Rollback;
             exit;
          end;
        end;
        RxMemoryDataPrKEdit.Locate('id_dt_abit',id_loc,[]);
        ShowMessage(nMsgSaveDataWasOk[LangEdit]);
     end;

   2:{Протокол про допуск}
     begin
        TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.Transaction.StartTransaction;
        id_loc:=RxMemoryDataPrKEdit.FieldValues['id_dt_abit'];
        RxMemoryDataPrKEdit.first;
        while not RxMemoryDataPrKEdit.eof do
        begin
          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.StoredProcName:='PRK_FND_PROT_DOPUSK_UPD';
          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.Prepare;
          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ParamByName('id_dt_abit').AsInt64          :=RxMemoryDataPrKEdit.FieldValues['id_dt_abit'];
          if (RxMemoryDataPrKEdit.FieldValues['id_dt_prot_dopusk']=Null) or
             (RxMemoryDataPrKEdit.FieldValues['id_dt_prot_dopusk']=-1)
           then TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ParamByName('id_dt_prot_dopusk').AsInt64       :=-1
           else TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ParamByName('id_dt_prot_dopusk').AsInt64       :=RxMemoryDataPrKEdit.FieldValues['id_dt_prot_dopusk'];
          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ParamByName('id_user').AsInt64            :=TFormPrK_Results_of_Filtr(Self.Owner).ID_USER_GLOBAL;
          try
             TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ExecProc;
          except on e: Exception do
             begin
                MessageBox(Handle,Pchar(nMsgErrorTransaction[LangEdit]+chr(13)+
                       nMsgTryAgain[LangEdit]+nMsgOr[LangEdit]+nMsgToAdmin[LangEdit]+chr(13)+
                       e.Message),Pchar(nMsgBoxTitle[LangEdit]),MB_OK or MB_ICONWARNING);
                TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.Transaction.Rollback;
                exit;
             end;
          end;
          RxMemoryDataPrKEdit.next;
        end;
        try
          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.Transaction.Commit;
        except on e: Exception do
          begin
             MessageBox(Handle,Pchar(nMsgErrorTransaction[LangEdit]+chr(13)+
                    nMsgTryAgain[LangEdit]+nMsgOr[LangEdit]+nMsgToAdmin[LangEdit]+chr(13)+
                    e.Message),Pchar(nMsgBoxTitle[LangEdit]),MB_OK or MB_ICONWARNING);
             TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.Transaction.Rollback;
             exit;
          end;
        end;
        RxMemoryDataPrKEdit.Locate('id_dt_abit',id_loc,[]);
        ShowMessage(nMsgSaveDataWasOk[LangEdit]);
     end;

   3:{Протокол про зарах.}
     begin
        TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.Transaction.StartTransaction;
        id_loc:=RxMemoryDataPrKEdit.FieldValues['id_dt_abit'];
        RxMemoryDataPrKEdit.first;
        while not RxMemoryDataPrKEdit.eof do
        begin
          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.StoredProcName:='PRK_FND_PROT_ZACH_UPD';
          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.Prepare;
          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ParamByName('id_dt_abit').AsInt64          :=RxMemoryDataPrKEdit.FieldValues['id_dt_abit'];
          if (RxMemoryDataPrKEdit.FieldValues['id_dt_prot_zach']=Null) or
             (RxMemoryDataPrKEdit.FieldValues['id_dt_prot_zach']=-1)
           then TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ParamByName('id_dt_prot_zach').AsInt64  :=-1
           else TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ParamByName('id_dt_prot_zach').AsInt64  :=RxMemoryDataPrKEdit.FieldValues['id_dt_prot_zach'];
          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ParamByName('id_user').AsInt64            :=TFormPrK_Results_of_Filtr(Self.Owner).ID_USER_GLOBAL;
          try
             TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ExecProc;
          except on e: Exception do
             begin
                MessageBox(Handle,Pchar(nMsgErrorTransaction[LangEdit]+chr(13)+
                       nMsgTryAgain[LangEdit]+nMsgOr[LangEdit]+nMsgToAdmin[LangEdit]+chr(13)+
                       e.Message),Pchar(nMsgBoxTitle[LangEdit]),MB_OK or MB_ICONWARNING);
                TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.Transaction.Rollback;
                exit;
             end;
          end;
          RxMemoryDataPrKEdit.next;
        end;
        try
          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.Transaction.Commit;
        except on e: Exception do
          begin
             MessageBox(Handle,Pchar(nMsgErrorTransaction[LangEdit]+chr(13)+
                    nMsgTryAgain[LangEdit]+nMsgOr[LangEdit]+nMsgToAdmin[LangEdit]+chr(13)+
                    e.Message),Pchar(nMsgBoxTitle[LangEdit]),MB_OK or MB_ICONWARNING);
             TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.Transaction.Rollback;
             exit;
          end;
        end;
        RxMemoryDataPrKEdit.Locate('id_dt_abit',id_loc,[]);
        ShowMessage(nMsgSaveDataWasOk[LangEdit]);
     end;

   4:{Признак зарахуванняя}
     begin
        TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.Transaction.StartTransaction;
        id_loc:=RxMemoryDataPrKEdit.FieldValues['id_dt_abit'];
        RxMemoryDataPrKEdit.first;
        while not RxMemoryDataPrKEdit.eof do
        begin
          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.StoredProcName:='PRK_FND_PRIZN_ZACHISL_UPD';
          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.Prepare;
          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ParamByName('id_dt_abit').AsInt64         :=RxMemoryDataPrKEdit.FieldValues['id_dt_abit'];
          if (RxMemoryDataPrKEdit.FieldValues['id_sp_prizn_zachisl']=Null) or
             (RxMemoryDataPrKEdit.FieldValues['id_sp_prizn_zachisl']=-1)
           then TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ParamByName('id_sp_prizn_zachisl').AsInt64    :=-1
           else TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ParamByName('id_sp_prizn_zachisl').AsInt64    :=RxMemoryDataPrKEdit.FieldValues['id_sp_prizn_zachisl'];
          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ParamByName('is_rek_zachisl').AsInteger   :=RxMemoryDataPrKEdit.FieldValues['is_rek_zachisl'];
          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ParamByName('is_cel_nabor').AsInteger     :=RxMemoryDataPrKEdit.FieldValues['is_cel_nabor'];
          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ParamByName('id_user').AsInt64            :=TFormPrK_Results_of_Filtr(Self.Owner).ID_USER_GLOBAL;
          try
             TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ExecProc;
          except on e: Exception do
             begin
                MessageBox(Handle,Pchar(nMsgErrorTransaction[LangEdit]+chr(13)+
                       nMsgTryAgain[LangEdit]+nMsgOr[LangEdit]+nMsgToAdmin[LangEdit]+chr(13)+
                       e.Message),Pchar(nMsgBoxTitle[LangEdit]),MB_OK or MB_ICONWARNING);
                TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.Transaction.Rollback;
                exit;
             end;
          end;
          RxMemoryDataPrKEdit.next;
        end;
        try
          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.Transaction.Commit;
        except on e: Exception do
          begin
             MessageBox(Handle,Pchar(nMsgErrorTransaction[LangEdit]+chr(13)+
                    nMsgTryAgain[LangEdit]+nMsgOr[LangEdit]+nMsgToAdmin[LangEdit]+chr(13)+
                    e.Message),Pchar(nMsgBoxTitle[LangEdit]),MB_OK or MB_ICONWARNING);
             TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.Transaction.Rollback;
             exit;
          end;
        end;
        RxMemoryDataPrKEdit.Locate('id_dt_abit',id_loc,[]);
        ShowMessage(nMsgSaveDataWasOk[LangEdit]);
     end;

   5:{Накази}
     begin
        TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.Transaction.StartTransaction;
        id_loc:=RxMemoryDataPrKEdit.FieldValues['id_dt_abit'];
        RxMemoryDataPrKEdit.first;
        while not RxMemoryDataPrKEdit.eof do
        begin
          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.StoredProcName:='PRK_FND_PRIK_ZACH_UPD';
          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.Prepare;
          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ParamByName('id_dt_abit').AsInt64          :=RxMemoryDataPrKEdit.FieldValues['id_dt_abit'];
          if (RxMemoryDataPrKEdit.FieldValues['id_dt_prik_zach']=Null) or
             (RxMemoryDataPrKEdit.FieldValues['id_dt_prik_zach']=-1)
           then TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ParamByName('id_dt_prik_zach').AsInt64    :=-1
           else TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ParamByName('id_dt_prik_zach').AsInt64    :=RxMemoryDataPrKEdit.FieldValues['id_dt_prik_zach'];
          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ParamByName('id_user').AsInt64            :=TFormPrK_Results_of_Filtr(Self.Owner).ID_USER_GLOBAL;
          try
             TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ExecProc;
          except on e: Exception do
             begin
                MessageBox(Handle,Pchar(nMsgErrorTransaction[LangEdit]+chr(13)+
                       nMsgTryAgain[LangEdit]+nMsgOr[LangEdit]+nMsgToAdmin[LangEdit]+chr(13)+
                       e.Message),Pchar(nMsgBoxTitle[LangEdit]),MB_OK or MB_ICONWARNING);
                TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.Transaction.Rollback;
                exit;
             end;
          end;
          RxMemoryDataPrKEdit.next;
        end;
        try
          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.Transaction.Commit;
        except on e: Exception do
          begin
             MessageBox(Handle,Pchar(nMsgErrorTransaction[LangEdit]+chr(13)+
                    nMsgTryAgain[LangEdit]+nMsgOr[LangEdit]+nMsgToAdmin[LangEdit]+chr(13)+
                    e.Message),Pchar(nMsgBoxTitle[LangEdit]),MB_OK or MB_ICONWARNING);
             TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.Transaction.Rollback;
             exit;
          end;
        end;
        RxMemoryDataPrKEdit.Locate('id_dt_abit',id_loc,[]);
        ShowMessage(nMsgSaveDataWasOk[LangEdit]);
     end;

   6:{Недопуск}
     begin
        TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.Transaction.StartTransaction;
        id_loc:=RxMemoryDataPrKEdit.FieldValues['id_dt_abit'];
        RxMemoryDataPrKEdit.first;
        while not RxMemoryDataPrKEdit.eof do
        begin
          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.StoredProcName:='PRK_FND_NEDOPUSK_UPD';
          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.Prepare;
          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ParamByName('id_dt_abit').AsInt64         :=RxMemoryDataPrKEdit.FieldValues['id_dt_abit'];
          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ParamByName('is_nedopusk').AsInteger      :=RxMemoryDataPrKEdit.FieldValues['is_nedopusk'];
          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ParamByName('id_user').AsInt64            :=TFormPrK_Results_of_Filtr(Self.Owner).ID_USER_GLOBAL;
          try
             TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ExecProc;
          except on e: Exception do
             begin
                MessageBox(Handle,Pchar(nMsgErrorTransaction[LangEdit]+chr(13)+
                       nMsgTryAgain[LangEdit]+nMsgOr[LangEdit]+nMsgToAdmin[LangEdit]+chr(13)+
                       e.Message),Pchar(nMsgBoxTitle[LangEdit]),MB_OK or MB_ICONWARNING);
                TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.Transaction.Rollback;
                exit;
             end;
          end;
          RxMemoryDataPrKEdit.next;
        end;
        try
          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.Transaction.Commit;
        except on e: Exception do
          begin
             MessageBox(Handle,Pchar(nMsgErrorTransaction[LangEdit]+chr(13)+
                    nMsgTryAgain[LangEdit]+nMsgOr[LangEdit]+nMsgToAdmin[LangEdit]+chr(13)+
                    e.Message),Pchar(nMsgBoxTitle[LangEdit]),MB_OK or MB_ICONWARNING);
             TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.Transaction.Rollback;
             exit;
          end;
        end;
        RxMemoryDataPrKEdit.Locate('id_dt_abit',id_loc,[]);
        ShowMessage(nMsgSaveDataWasOk[LangEdit]);
     end;

   7:{Забрав документи}
     begin
        TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.Transaction.StartTransaction;
        id_loc:=RxMemoryDataPrKEdit.FieldValues['id_dt_abit'];
        RxMemoryDataPrKEdit.first;
        while not RxMemoryDataPrKEdit.eof do
        begin
          if  (RxMemoryDataPrKEdit.FieldValues['date_zabr']=Null) and
              (RxMemoryDataPrKEdit.FieldValues['id_sp_zabr']>0)   then
           begin
             Showmessage(nMsgEmptyDATE[LangEdit]);
             TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.Transaction.Rollback;
             exit;
           end;

          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.StoredProcName:='PRK_FND_ZABR_UPD';
          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.Prepare;
          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ParamByName('id_dt_abit').AsInt64         :=RxMemoryDataPrKEdit.FieldValues['id_dt_abit'];
          if (RxMemoryDataPrKEdit.FieldValues['id_sp_zabr']=Null) or
             (RxMemoryDataPrKEdit.FieldValues['id_sp_zabr']=-1)
           then begin
             TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ParamByName('id_sp_zabr').AsInt64       :=-1;
             TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ParamByName('date_zabr').AsDate         :=0;
           end
           else begin
             TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ParamByName('id_sp_zabr').AsInt64       :=RxMemoryDataPrKEdit.FieldValues['id_sp_zabr'];
             TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ParamByName('date_zabr').AsDate         :=RxMemoryDataPrKEdit.FieldValues['date_zabr'];
           end;
          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ParamByName('id_user').AsInt64            :=TFormPrK_Results_of_Filtr(Self.Owner).ID_USER_GLOBAL;
          try
             TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.ExecProc;
          except on e: Exception do
             begin
                MessageBox(Handle,Pchar(nMsgErrorTransaction[LangEdit]+chr(13)+
                       nMsgTryAgain[LangEdit]+nMsgOr[LangEdit]+nMsgToAdmin[LangEdit]+chr(13)+
                       e.Message),Pchar(nMsgBoxTitle[LangEdit]),MB_OK or MB_ICONWARNING);
                TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.Transaction.Rollback;
                exit;
             end;
          end;
          RxMemoryDataPrKEdit.next;
        end;
        try
          TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.Transaction.Commit;
        except on e: Exception do
          begin
             MessageBox(Handle,Pchar(nMsgErrorTransaction[LangEdit]+chr(13)+
                    nMsgTryAgain[LangEdit]+nMsgOr[LangEdit]+nMsgToAdmin[LangEdit]+chr(13)+
                    e.Message),Pchar(nMsgBoxTitle[LangEdit]),MB_OK or MB_ICONWARNING);
             TFormPrK_Results_of_Filtr(Self.Owner).StoredProcPrK.Transaction.Rollback;
             exit;
          end;
        end;
        RxMemoryDataPrKEdit.Locate('id_dt_abit',id_loc,[]);
        ShowMessage(nMsgSaveDataWasOk[LangEdit]);
     end;
   end;
end;

end.
