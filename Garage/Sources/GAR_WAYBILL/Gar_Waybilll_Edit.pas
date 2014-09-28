unit Gar_Waybilll_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, cxMaskEdit,
  cxDropDownEdit, cxDBEdit, DB, FIBDataSet, pFIBDataSet, StdCtrls,
  cxButtons, cxControls, cxContainer, cxEdit, cxTextEdit, gar_Types, zTypes,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, ActnList, gr_uMessage, gr_uCommonConsts,
  gr_uCommonProc, cxGroupBox, cxButtonEdit, cxLabel, gr_uCommonLoader, ZProc,
  cxCalendar, cxSpinEdit, cxTimeEdit, cxCheckBox, gar_Waybill_DM, gar_LoadPackageGarage,
  IBase, pFIBStoredProc, pFIBDatabase, gar_GarageProc, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData,
  dxBar, dxBarExtItems, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  RxMemDS, cxSplitter, Gar_Edit_Part, cxGridBandedTableView,Registry;
type
  TFEditWayBill = class(TForm)
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    pFIBDataSet1: TpFIBDataSet;
    DataSource1: TDataSource;
    ActionList1: TActionList;
    Action1: TAction;
    pFIBDataSet2: TpFIBDataSet;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    pFIBDataSet3: TpFIBDataSet;
    DataSource4: TDataSource;
    pFIBDataSet4: TpFIBDataSet;
    BarManager: TdxBarManager;
    DeleteBtn: TdxBarLargeButton;
    AddManBtn: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeBtnAdd5: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    LBtnUpdate: TdxBarLargeButton;
    LBtnDeletePayment: TdxBarLargeButton;
    BtnSave: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    dxBarLargeButton7: TdxBarLargeButton;
    dxBarLargeButton8: TdxBarLargeButton;
    dxBarLargeButton9: TdxBarLargeButton;
    RefreshBtn: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarLargeButton10: TdxBarLargeButton;
    dxBarLargeButton11: TdxBarLargeButton;
    dxBarLargeButton12: TdxBarLargeButton;
    dxBarButton2: TdxBarButton;
    dxBarLargeButton13: TdxBarLargeButton;
    dxBarLargeButton14: TdxBarLargeButton;
    dxBarLargeButton15: TdxBarLargeButton;
    dxBarLargeButton16: TdxBarLargeButton;
    dxBarLargeButton17: TdxBarLargeButton;
    dxBarLargeButton18: TdxBarLargeButton;
    dxBarLargeButton19: TdxBarLargeButton;
    dxBarLargeButton20: TdxBarLargeButton;
    DataSourceGrid: TDataSource;
    RxMemoryData1: TRxMemoryData;
    pFIBDataSet6: TpFIBDataSet;
    pFIBDataSet7: TpFIBDataSet;
    pFIBDataSet8: TpFIBDataSet;
    Panel4: TPanel;
    cxGroupBox17: TcxGroupBox;
    Action2: TAction;
    DataSource5: TDataSource;
    pFIBDataSet5: TpFIBDataSet;
    Panel5: TPanel;
    cxGroupBox25: TcxGroupBox;
    GroupBoxProp: TcxGroupBox;
    EditMan: TcxButtonEdit;
    EditManFio: TcxLabel;
    cxGroupBox2: TcxGroupBox;
    cxButtonEdit1: TcxButtonEdit;
    cxLabel1: TcxLabel;
    cxGroupBox12: TcxGroupBox;
    cxTextEdit11: TcxTextEdit;
    cxGroupBox13: TcxGroupBox;
    cxGroupBox3: TcxGroupBox;
    cxDateEdit1: TcxDateEdit;
    cxGroupBox4: TcxGroupBox;
    cxDateEdit2: TcxDateEdit;
    cxCheckBox6: TcxCheckBox;
    cxGroupBox10: TcxGroupBox;
    cxCheckBox2: TcxCheckBox;
    cxGroupBox11: TcxGroupBox;
    cxGroupBox7: TcxGroupBox;
    cxCheckBox1: TcxCheckBox;
    cxGroupBox8: TcxGroupBox;
    cxGroupBox9: TcxGroupBox;
    cxGroupBox15: TcxGroupBox;
    cxLookupComboBox2: TcxLookupComboBox;
    cxCheckBox3: TcxCheckBox;
    cxGroupBox5: TcxGroupBox;
    cxTimeEdit1: TcxTimeEdit;
    cxGroupBox6: TcxGroupBox;
    cxTimeEdit2: TcxTimeEdit;
    cxGroupBox1: TcxGroupBox;
    cxLookupComboBox1: TcxLookupComboBox;
    cxCheckBox11: TcxCheckBox;
    cxGroupBox14: TcxGroupBox;
    cxTextEdit13: TcxTextEdit;
    cxCheckBox5: TcxCheckBox;
    cxComboBox1: TcxComboBox;
    cxCheckBox8: TcxCheckBox;
    Panel2: TPanel;
    dxBarDockControl1: TdxBarDockControl;
    cxGroupBox21: TcxGroupBox;
    cxTextEdit5: TcxTextEdit;
    cxGroupBox19: TcxGroupBox;
    cxTextEdit3: TcxTextEdit;
    cxGroupBox22: TcxGroupBox;
    cxTextEdit14: TcxTextEdit;
    cxGroupBox20: TcxGroupBox;
    cxTextEdit4: TcxTextEdit;
    cxGroupBox16: TcxGroupBox;
    cxTextEdit1: TcxTextEdit;
    cxGroupBox18: TcxGroupBox;
    cxTextEdit2: TcxTextEdit;
    cxLabel15: TcxLabel;
    cxLabel2: TcxLabel;
    Panel3: TPanel;
    Panel7: TPanel;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    dxBarDockControl2: TdxBarDockControl;
    cxGrid2: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    dxBarButton3: TdxBarButton;
    cxGridDBTableView2DBColumn1: TcxGridDBColumn;
    DataSource6: TDataSource;
    pFIBDataSet9: TpFIBDataSet;
    RxMemoryData2: TRxMemoryData;
    cxTextEdit9: TcxMaskEdit;
    cxTextEdit10: TcxMaskEdit;
    cxTextEdit6: TcxMaskEdit;
    cxTextEdit7: TcxMaskEdit;
    cxTextEdit8: TcxMaskEdit;
    cxLabel3: TcxLabel;
    cxGroupBox23: TcxGroupBox;
    cxTextEdit15: TcxTextEdit;
    cxGroupBox24: TcxGroupBox;
    cxTextEdit16: TcxTextEdit;
    Panel6: TPanel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    Action3: TAction;
    Styles: TcxStyleRepository;
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
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet;
    cxGroupBox26: TcxGroupBox;
    cxMaskEdit1: TcxMaskEdit;
    cxCheckBox4: TcxCheckBox;
    cxGroupBox27: TcxGroupBox;
    cxTextEdit12: TcxMaskEdit;
    procedure Action1Execute(Sender: TObject);
    procedure EditManPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditManPropertiesEditValueChanged(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
    procedure cxCheckBox2PropertiesChange(Sender: TObject);
    procedure cxCheckBox3PropertiesChange(Sender: TObject);
    procedure cxCheckBox4PropertiesChange(Sender: TObject);
    procedure cxCheckBox40PropertiesChange(Sender: TObject);
    procedure cxCheckBox5PropertiesChange(Sender: TObject);
    procedure cxButtonEdit1PropertiesEditValueChanged(Sender: TObject);
    procedure cxCheckBox6PropertiesChange(Sender: TObject);
    procedure cxDateEdit1PropertiesChange(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxCheckBox8PropertiesChange(Sender: TObject);
    procedure cxComboBox1PropertiesChange(Sender: TObject);
    procedure dxBarLargeButton18Click(Sender: TObject);
    procedure dxBarLargeButton19Click(Sender: TObject);
    procedure cxCheckBox11PropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Action2Execute(Sender: TObject);
    procedure dxBarLargeBtnAdd5Click(Sender: TObject);
    procedure LBtnUpdateClick(Sender: TObject);
    procedure LBtnDeletePaymentClick(Sender: TObject);
    procedure cxTextEdit10Exit(Sender: TObject);
  private
    Def_ID_WORK_MODE:variant;
    DEF_TOPL_COUNT_END:variant;
    DEF_SPIDOMETR_END:variant;
    Def_date_END:Variant;
    DEF_ID_MARKA_TOPL:variant;
    PLanguageIndex:integer;
    ParamLoc:TgarParamWaybill;
    procedure WaybillChange(val:Boolean);
  public
    constructor Create(Param:TgarParamWayBill);reintroduce;
    function Delete(Param:TgarParamWaybill):variant;
    function PrepareData(Param:TgarParamWaybill):variant;
    procedure ReadReg;
    procedure WriteReg;
  end;

function View_FEdit(Param:TgarParamWaybill):variant;

var
  FEditWayBill: TFEditWayBill;

implementation

{$R *.dfm}
constructor TFEditWayBill.Create(Param:TgarParamWayBill);
begin
  inherited Create(Param.owner);
  PLanguageIndex:=IndexLanguage;
  ParamLoc:=Param;
  pFIBDataSet1.Database:=DM.DB;
  pFIBDataSet1.Transaction:=DM.RTransaction;
  DataSource1.DataSet:=pFIBDataSet1;

  pFIBDataSet2.Database:=DM.DB;
  pFIBDataSet2.Transaction:=DM.RTransaction;
  DataSource2.DataSet:=pFIBDataSet2;

  pFIBDataSet3.Database:=DM.DB;
  pFIBDataSet3.Transaction:=DM.RTransaction;
  DataSource3.DataSet:=pFIBDataSet3;

  pFIBDataSet4.Database:=DM.DB;
  pFIBDataSet4.Transaction:=DM.RTransaction;
  DataSource4.DataSet:=pFIBDataSet4;

  pFIBDataSet5.Database:=DM.DB;
  pFIBDataSet5.Transaction:=DM.RTransaction;
  DataSource5.DataSet:=pFIBDataSet5;

  cxLookupComboBox1.Properties.DataController.DataSource:=DataSource1;
  cxLookupComboBox1.Properties.KeyFieldNames  :='ID_WORK_MODE';
  cxLookupComboBox1.Properties.ListFieldNames :='NAME';
  pFIBDataSet1.Close;
  pFIBDataSet1.SQLs.SelectSQL.Text:='SELECT * FROM DT_WORK_MODE_SELECT';
  pFIBDataSet1.Open;

  {cxLookupComboBox3.Properties.DataController.DataSource:=DataSource4;
  cxLookupComboBox3.Properties.KeyFieldNames  :='ID_WORK_MODE';
  cxLookupComboBox3.Properties.ListFieldNames :='NAME';
  pFIBDataSet4.Close;
  pFIBDataSet4.SQLs.SelectSQL.Text:='SELECT * FROM DT_WORK_MODE_SELECT';
  pFIBDataSet4.Open;}

  cxLookupComboBox2.Properties.DataController.DataSource:=DataSource5;
  cxLookupComboBox2.Properties.KeyFieldNames  :='ID_MARKA_TOPL';
  cxLookupComboBox2.Properties.ListFieldNames :='MARKA_TOPL';
  pFIBDataSet5.Close;
  pFIBDataSet5.SQLs.SelectSQL.Text:='SELECT * FROM GAR_SP_MARKA_TOPL T';
  pFIBDataSet5.Open;


  RxMemoryData1.Close;
  RxMemoryData1.FieldDefs.Clear;
  RxMemoryData1.FieldDefs.Add('ID_WAYBILL_FACTOR',ftInteger,0,True);
  RxMemoryData1.FieldDefs.Add('ID_FACTOR',ftInteger,0,True);
  RxMemoryData1.FieldDefs.Add('NAME',ftString,50,True);
  RxMemoryData1.FieldDefs.Add('VALUE_FACTOR',ftFloat,0,True);
  RxMemoryData1.Open;

  RxMemoryData2.Close;
  RxMemoryData2.FieldDefs.Clear;
  RxMemoryData2.FieldDefs.Add('MILAGE',ftInteger,0,True);
  RxMemoryData2.FieldDefs.Add('NAME',ftString,50,True);
  RxMemoryData2.FieldDefs.Add('ID_FACTOR',ftInteger,0,True);
  RxMemoryData2.FieldDefs.Add('ID_WAYBILL_PART',ftInteger,0,True);
  RxMemoryData2.Open;

  DataSource6.DataSet:=RxMemoryData2;
  DataSourceGrid.DataSet:=RxMemoryData1;

  cxGridDBTableView1.DataController.DataSource:=DataSourceGrid;
  cxGridDBTableView2.DataController.DataSource:=DataSource6;

  ReadReg;

end;

function TFEditWayBill.Delete(Param:TgarParamWaybill):variant;
begin
  DM.pFIBStoredProc1.StoredProcName:='GAR_WAYBILL_D';
  DM.pFIBStoredProc1.Transaction.StartTransaction;
  DM.pFIBStoredProc1.Prepare;
  DM.pFIBStoredProc1.ParamByName('ID_WAYBILL').AsInteger:= Param.ID_WAYBILL;
  DM.pFIBStoredProc1.ExecProc;
  DM.pFIBStoredProc1.Transaction.Commit;
end;



function View_FEdit(Param:TgarParamWaybill):variant;
begin
  FEditWayBill:=TFEditWayBill.Create(Param);
  if Param.fs=garfsDelete then FEditWayBill.delete(Param)
  else  FEditWayBill.PrepareData(Param);
  if Param.fs<>garfsDelete then
  FEditWayBill.ShowModal;
  FEditWayBill.Free;
  Result:=Param.ID_WAYBILL;
end;

function TFEditWayBill.PrepareData(Param:TgarParamWaybill):variant;
begin

  case Param.fs of
    garfsInsert:
      try
          cxCheckBox8.Checked:=True;
          cxComboBox1.EditValue:='Форма путевого листа №3';
          cxComboBox1.Enabled:=False;

          cxCheckBox5.Checked:=True;
          cxTextEdit13.Enabled:=False;

          cxCheckBox6.Checked:=True;
          cxDateEdit2.Enabled:=False;

          cxCheckBox11.Checked:=True;
          cxLookupComboBox1.Enabled:=False;

          WaybillChange(False);
          cxLookupComboBox1.EditValue:=0;

          pFIBDataSet2.Close;
          pFIBDataSet2.SQLs.SelectSQL.Text:='SELECT * FROM GAR_WAYBILL_PREPAREDATA';
          pFIBDataSet2.Open;


          if not pFIBDataSet2.IsEmpty then
          begin
            //**********так было раньше - по последнему путевому листу******//
            //cxDateEdit1.EditValue:=pFIBDataSet2['DEFAULT_DATE_OUT_BEG'];
            //**************************************************************//

            //*********************сейчас нужно считывать с регистра********//

            ReadReg;

            cxDateEdit2.EditValue:=pFIBDataSet2['DEFAULT_DATE_OUT_END'];
            Def_date_END:=pFIBDataSet2['DEFAULT_DATE_OUT_END'];
            cxTimeEdit1.EditValue:=pFIBDataSet2['DEFAULT_TIME_OUT_BEG'];
            cxTextEdit13.EditValue:=pFIBDataSet2['SHORT_NAME'];
            cxTimeEdit2.EditValue:=pFIBDataSet2['DEFAULT_TIME_OUT_END'];
            //**********так было раньше - по последнему путевому листу******//
           { if (pFIBDataSet2['SERIES'] = null)
            then cxTextEdit11.EditValue:=''
            else cxTextEdit11.EditValue:=pFIBDataSet2['SERIES']; }
            //*************************************************************//
          end;



      except

      end;

    garfsUpdate:
      try

        {pFIBDataSet6.Close;
        pFIBDataSet6.DataSource:=DM.DataSource1;
        pFIBDataSet6.SQLs.SelectSQL.Text:='SELECT * FROM GAR_FACTOR_BY_WAYBILL_S('+VarToStrDef(DM.pFIBDataSet1['ID_WAYBILL'],'0')+')';
        pFIBDataSet6.Open;   }

        Case  Param.ID_FORMA  of
          2:  cxComboBox1.EditValue:='Форма путевого листа №2';
          3:  cxComboBox1.EditValue:='Форма путевого листа №3';
        end;
        pFIBDataSet9.Close;
        pFIBDataSet9.SQLs.SelectSQL.Text:='SELECT * FROM GAR_WAYBILL_PART P inner join GAR_SP_FACTOR F '+
                                           ' on P.ID_FACTOR=F.ID_FACTOR where P.ID_WAYBILL = '+VarToStr(ParamLoc.ID_Waybill);
        pFIBDataSet9.Open;
        RxMemoryData2.LoadFromDataSet(pFIBDataSet9,0,lmAppend);

        pFIBDataSet8.Close;
        pFIBDataSet8.SQLs.SelectSQL.Text:='SELECT * FROM GAR_FACTOR_BY_WAYBILL_S('+VarToStr(ParamLoc.ID_Waybill)+')';
        pFIBDataSet8.Open;

        RxMemoryData1.LoadFromDataSet(pFIBDataSet8,0,lmAppend);

        pFIBDataSet8.Close;

        pFIBDataSet2.Close;
        pFIBDataSet2.SQLs.SelectSQL.Text:='SELECT * FROM GAR_WAYBILL_PREPAREDATA_BY_AVTO('+VarToStr(ParamLoc.ParamAvto.id)+')';
        pFIBDataSet2.Open;

        pFIBDataSet7.Close;
        pFIBDataSet7.SQLs.SelectSQL.Text:='SELECT * FROM GAR_WAYBILL_PREPAREDATA_BY_MAN('+VarToStr(ParamLoc.ParamPeople.id)+')';
        pFIBDataSet7.Open;

        EditMan.Text:=                Param.ParamPeople.tn;
        EditManFio.EditValue:=        Param.ParamPeople.Caption;
        cxButtonEdit1.Text:=          Param.ParamAvto.Tn;
        cxLabel1.EditValue:=          Param.ParamAvto.Caption;
        cxLookupComboBox1.EditValue:= Param.ID_WORK_MODE;
        cxDateEdit1.EditValue:=       Param.DATE_BEG;
        cxDateEdit2.EditValue:=       Param.DATE_END;
        cxTimeEdit1.EditValue:=       Param.TIME_BEG;
        cxTimeEdit2.EditValue:=       Param.TIME_END;
        cxLookupComboBox2.EditValue:= Param.ID_TOPL;
        cxTextEdit6.EditValue:=       Param.TOPL_COUNT_BEG;
        cxTextEdit7.EditValue:=       Param.TOPL_COUNT_END;
        cxTextEdit8.EditValue:=       Param.TOPL_COUNT;
        cxTextEdit9.EditValue:=       Param.SPIDOMETR_BEG;
        cxTextEdit10.EditValue:=      Param.SPIDOMETR_END;
        cxTextEdit11.EditValue:=      Param.SERIES;
        cxTextEdit12.EditValue:=      Param.NOMBER;
        cxTextEdit13.EditValue:=      Param.KOLONA;
        cxMaskEdit1.EditValue:=       Param.WORK_TIME;
        if Param.CALC_METOD=1 then cxCheckBox4.Checked:=True
        else  cxCheckBox4.Checked:=False;


        cxTextEdit1.EditValue:=       Param.PRICEP1;
        cxTextEdit2.EditValue:=       Param.PRICEP2;
        cxTextEdit3.EditValue:=       Param.WAYPEOPLE_TXT;
        cxTextEdit4.EditValue:=       Param.TASK_DRIVER_TXT;
        cxTextEdit5.EditValue:=       Param.ORDER_TASK_TXT;
        cxTextEdit14.EditValue:=      Param.RES_WORK_AVTO_WITH_PRICEP;

        if Param.PROSTOI<>-1  then cxTextEdit15.EditValue:=      Param.PROSTOI;
        if Param.tempc<>-1    then cxTextEdit16.EditValue:=      Param.tempc;



      except

      end;

  end;

end;

procedure TFEditWayBill.Action1Execute(Sender: TObject);
var t:Integer;
sum_factor:Double;
begin

  if (cxComboBox1.EditValue<>'Форма путевого листа №2') and
  (cxComboBox1.EditValue<>'Форма путевого листа №3') and not cxCheckBox8.Checked then
    begin
      showmessage('Поле типа путевого листа не заполнено!');
      exit;
    end;

  if (EditManFio.Caption='')  then
    begin
      showmessage('Поле водителя не заполнено!');
      exit;
    end;

  if cxLabel1.Caption='' then
    begin
      showmessage('Поле "Авто" не заполнено!');
      exit;
    end;

  {if cxTextEdit11.Text='' then
    begin
      showmessage('Поле "Серия" не заполнено!');
      exit;
    end; }

  if cxTextEdit12.Text='' then
    begin
      showmessage('Поле "Номер" не заполнено!');
      exit;
    end;

  if cxDateEdit1.EditValue=Null then
    begin
      showmessage('Поле "Дата начала" не заполнено!');
      exit;
    end;

  if (cxDateEdit2.EditValue=Null) AND (NOT cxCheckBox6.Checked) then
    begin
      showmessage('Поле "Дата конца" не заполнено!');
      exit;
    end;

  if (cxTextEdit9.Text='') AND (NOT cxCheckBox2.Checked) then
    begin
      showmessage('Поле "Покоазания спидометра в начале" не заполнено!');
      exit;
    end;

  if cxTextEdit10.Text='' then
    begin
      showmessage('Поле "Покоазания спидометра в конце" пусто!');
      exit;
    end;

  if (cxTextEdit6.Text='') and (not cxCheckBox1.Checked) then
    begin
      showmessage('Поле "Топлива в начале" не заполнено!');
      exit;
    end;

  if cxTextEdit7.Text='' then
    begin
      showmessage('Поле "Топлива в конце" не заполнено!');
      exit;
    end;

  if cxTextEdit8.Text='' then
    begin
      //showmessage('Поле "Топлива выдано" не заполнено!');
      //exit;
      //cxTextEdit8.EditValue:=0;
    end;

  if (cxLookupComboBox2.EditValue=Null) AND (NOT cxCheckBox3.Checked) then
    begin
      showmessage('Поле "Марка топлива" не заполнено!');
      exit;
    end;

  if (cxTimeEdit1.EditValue=Null) then
    begin
      showmessage('Поле "Время начала" не заполнено!');
      exit;
    end;

  if (cxTimeEdit2.EditValue=Null) then
    begin
      showmessage('Поле "Время конца" не заполнено!');
      exit;
    end;

  if (cxLookupComboBox1.EditValue=Null) AND (not cxCheckBox11.Checked) then
    begin
      showmessage('Поле "Режим работы" не заполнено!');
      exit;
    end;
  {else if (pFIBDataSet7['ID_WORK_MODE']=Null) AND (cxCheckBox11.Checked) then
    begin
      showmessage('Значение поля "Режим работы" пусто!');
      exit;
    end; }

  if (cxTextEdit13.Text='') and (not cxCheckBox5.Checked) then
    begin
      showmessage('Поле "Колонна" не заполнено!');
      exit;
    end;

  if (cxMaskEdit1.Text='') and (cxCheckBox4.Checked) then
    begin
      showmessage('Поле "Время работы авт.(мин.)" не заполнено!');
      exit;
    end;

  with DM do
  try
    pFIBStoredProc1.Transaction.StartTransaction;
    case ParamLoc.fs of
      garfsInsert: pFIBStoredProc1.StoredProcName:='GAR_WAYBILL_I';
      garfsUpdate: pFIBStoredProc1.StoredProcName:='GAR_WAYBILL_U';
    end;
    pFIBStoredProc1.Prepare;

    if cxCheckBox8.Checked then
      pFIBStoredProc1.ParamByName('ID_FORMA').AsInt64         := 3
    else if (cxComboBox1.EditValue='Форма путевого листа №2') then
      pFIBStoredProc1.ParamByName('ID_FORMA').AsInt64         := 2
    else  if (cxComboBox1.EditValue='Форма путевого листа №3') then
      pFIBStoredProc1.ParamByName('ID_FORMA').AsInt64         := 3;

    pFIBStoredProc1.ParamByName('ID_MAN').AsInt64           := ParamLoc.ParamPeople.id;
    pFIBStoredProc1.ParamByName('ID_AVTO').AsInt64          := ParamLoc.ParamAvto.id;
    pFIBStoredProc1.ParamByName('DATE_BEG').AsDate          := cxDateEdit1.EditValue;
    if  cxCheckBox6.Checked then
      pFIBStoredProc1.ParamByName('DATE_END').AsDate          := cxDateEdit1.EditValue
    else
      pFIBStoredProc1.ParamByName('DATE_END').AsDate          := cxDateEdit2.EditValue;
    pFIBStoredProc1.ParamByName('TIME_BEG').AsTime          := cxTimeEdit1.EditValue;
    pFIBStoredProc1.ParamByName('TIME_END').AsTime          := cxTimeEdit2.EditValue;

    //if (cxCheckBox1.Checked)  then
      pFIBStoredProc1.ParamByName('TOPL_COUNT_BEG').Value := cxTextEdit6.EditValue;//DEF_TOPL_COUNT_END
    ///else
      //pFIBStoredProc1.ParamByName('TOPL_COUNT_BEG').AsVariant := cxTextEdit6.EditValue;

    //if (cxCheckBox3.Checked) then
      pFIBStoredProc1.ParamByName('ID_TOPL').AsInteger        := StrToInt(VarToStrDef(cxLookupComboBox2.EditValue,'-1'));//DEF_ID_MARKA_TOPL
    //else  pFIBStoredProc1.ParamByName('ID_TOPL').AsVariant        := StrToInt(VarToStrDef(cxLookupComboBox2.EditValue,'-1'));///

    pFIBStoredProc1.ParamByName('TOPL_COUNT_END').Value := cxTextEdit7.EditValue;
    if  cxTextEdit8.text<>'' then
      pFIBStoredProc1.ParamByName('TOPL_COUNT').AsVariant     := cxTextEdit8.EditValue
    else pFIBStoredProc1.ParamByName('TOPL_COUNT').AsVariant     := 0;

    //if (cxCheckBox2.Checked)  then
      pFIBStoredProc1.ParamByName('SPIDOMETR_BEG').Value  := cxTextEdit9.EditValue;
    //else  pFIBStoredProc1.ParamByName('SPIDOMETR_BEG').AsVariant  := cxTextEdit9.EditValue;

    pFIBStoredProc1.ParamByName('SPIDOMETR_END').Value  := cxTextEdit10.EditValue;
    pFIBStoredProc1.ParamByName('SERIES').AsVariant         := cxTextEdit11.EditValue;
    pFIBStoredProc1.ParamByName('NOMBER').AsVariant         := cxTextEdit12.EditValue;

    pFIBStoredProc1.ParamByName('ID_KOLONA').AsVariant      := 1; //cxTextEdit13.EditValue;
    //if  (cxCheckBox11.Checked) then
      pFIBStoredProc1.ParamByName('ID_WORK_MODE').AsInteger   :=StrToInt(VarToStrDef(cxLookupComboBox1.EditValue,'-1')); //-1
    //else
      //pFIBStoredProc1.ParamByName('ID_WORK_MODE').AsInteger   := Integer(cxLookupComboBox1.EditValue);
    if  cxMaskEdit1.Text<>'' then
      pFIBStoredProc1.ParamByName('WORK_TIME').AsInteger         := cxMaskEdit1.EditValue;
    if cxCheckBox4.Checked then pFIBStoredProc1.ParamByName('CALC_METOD').AsInteger:= 1
    else  pFIBStoredProc1.ParamByName('CALC_METOD').AsInteger:= 0;   //CALC_METOD

    if cxTextEdit15.Text<>'' then
      pFIBStoredProc1.ParamByName('PROSTOI').AsInteger        := cxTextEdit15.EditValue;
    if cxTextEdit16.Text<>'' then
      pFIBStoredProc1.ParamByName('tempc').AsInteger          := cxTextEdit16.EditValue;
    if cxComboBox1.EditValue='Форма путевого листа №2'  then
      begin
        pFIBStoredProc1.ParamByName('PRICEP1').AsVariant                    := cxTextEdit1.EditValue;
        pFIBStoredProc1.ParamByName('PRICEP2').AsVariant                    := cxTextEdit2.EditValue;
        pFIBStoredProc1.ParamByName('WAYPEOPLE_TXT').AsVariant              := cxTextEdit3.EditValue;
        pFIBStoredProc1.ParamByName('TASK_DRIVER_TXT').AsVariant            := cxTextEdit4.EditValue;
        pFIBStoredProc1.ParamByName('ORDER_TASK_TXT').AsVariant             := cxTextEdit5.EditValue;
        pFIBStoredProc1.ParamByName('RES_WORK_AVTO_WITH_PRICEP').AsVariant  := cxTextEdit14.EditValue;
      end
    else if cxComboBox1.EditValue='Форма путевого листа №3'  then
      begin
        pFIBStoredProc1.ParamByName('PRICEP1').AsVariant                    := '';
        pFIBStoredProc1.ParamByName('PRICEP2').AsVariant                    := '';
        pFIBStoredProc1.ParamByName('WAYPEOPLE_TXT').AsVariant              := '';
        pFIBStoredProc1.ParamByName('TASK_DRIVER_TXT').AsVariant            := '';
        pFIBStoredProc1.ParamByName('ORDER_TASK_TXT').AsVariant             := '';
        pFIBStoredProc1.ParamByName('RES_WORK_AVTO_WITH_PRICEP').AsVariant  := '';
      end ;

    RxMemoryData1.first;
    sum_factor:=0;
    while not RxMemoryData1.eof do
    begin
      sum_factor:=sum_factor+RxMemoryData1['VALUE_FACTOR'];
      RxMemoryData1.Next;
    end;

    pFIBStoredProc1.ParamByName('sum_factor').AsVariant  := sum_factor;

    case ParamLoc.fs of
     garfsUpdate:
       pFIBStoredProc1.ParamByName('ID_WAYBILL').AsInt64 := ParamLoc.ID_WAYBILL;
    end;

    pFIBStoredProc1.ExecProc;
    if ParamLoc.fs=garfsInsert then ParamLoc.ID_WAYBILL:=pFIBStoredProc1.ParamByName('ID_WAYBILL').AsInt64;

    case ParamLoc.fs of
      garfsInsert:
        begin
          pFIBStoredProc1.Transaction.StartTransaction;
          pFIBStoredProc1.StoredProcName:='GAR_WAYBILL_FACTOR_I';
          pFIBStoredProc1.Prepare;
          RxMemoryData1.First;
          for t:=1 to RxMemoryData1.RecordCount do
          begin
            pFIBStoredProc1.ParamByName('ID_WAYBILL').AsInt64   := ParamLoc.ID_WAYBILL;
            pFIBStoredProc1.ParamByName('ID_FACTOR').AsInt64    := RxMemoryData1['ID_FACTOR'];
            pFIBStoredProc1.ExecProc;
            RxMemoryData1.next;
          end;

          pFIBStoredProc1.StoredProcName:='GAR_WAYBILL_PART_I';
          pFIBStoredProc1.Prepare;
          RxMemoryData2.First;
          for t:=1 to RxMemoryData2.RecordCount do
          begin
            pFIBStoredProc1.ParamByName('ID_WAYBILL').AsInt64       := ParamLoc.ID_WAYBILL;
            pFIBStoredProc1.ParamByName('ID_FACTOR').AsInt64        := RxMemoryData2['ID_FACTOR'];
            pFIBStoredProc1.ParamByName('MILAGE').AsInteger          := RxMemoryData2['MILAGE'];
            pFIBStoredProc1.ExecProc;
            RxMemoryData2.next;
          end

        end;
    end;


    pFIBStoredProc1.Transaction.Commit;
  except
    on e:Exception do
      begin
        garShowMessage(ECaption[PLanguageIndex],e.message,mtError,[mbOk]);
        pFIBStoredProc1.Transaction.RollBack;
      end;
  end;
  writeReg;
  ModalResult:=mrYes;
end;

procedure TFEditWayBill.EditManPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Man:variant;
param:TgarSimpleParamMode;
begin
  param:=TgarSimpleParamMode.Create;
  param.DB_Handle:=ParamLoc.DB_Handle;
  Param.Owner:=self;
  Param.fs:=garfsSelect;
  man:=LoadPackageGarage(Param, Name_Gar_Sp_People);
  if VarArrayDimCount(Man)>0 then
   begin
     if man[0]<>NULL then
      begin
        ParamLoc.ParamPeople.id:=man[0];
        ParamLoc.ParamPeople.Tn:=grifThen(VarIsNull(Man[1]),0,Man[1]);
        ParamLoc.ParamPeople.Caption:=Man[2];
        EditManFio.Caption := ParamLoc.ParamPeople.Caption;
        EditMan.Text := IntToStr(ParamLoc.ParamPeople.Tn);
      end;
   end;

   pFIBDataSet7.Close;
   pFIBDataSet7.SQLs.SelectSQL.Text:='SELECT * FROM GAR_WAYBILL_PREPAREDATA_BY_MAN('+VarToStr(ParamLoc.ParamPeople.id)+')';
   pFIBDataSet7.Open;

   Param.Free;
  if not pFIBDataSet7.IsEmpty then
    begin
      cxLookupComboBox1.EditValue:=pFIBDataSet7['ID_WORK_MODE'];
      Def_ID_WORK_MODE:=pFIBDataSet7['ID_WORK_MODE'];
    end
  else Def_ID_WORK_MODE:=0;
   {if not pFIBDataSet2.IsEmpty then
    cxLookupComboBox1.EditValue:=pFIBDataSet2['ID_WORK_MODE']
   else  cxLookupComboBox1.EditValue:=0;   }
end;

procedure TFEditWayBill.EditManPropertiesEditValueChanged(Sender: TObject);
var man:Variant;
begin
try
if (EditMan.Text<>'') and (ParamLoc.ParamPeople.Tn<>EditMan.Text) then
 begin
  if StrToInt(EditMan.Text)=ParamLoc.ParamPeople.Tn then Exit;
  man:=Gar_ManByTn(StrToInt(EditMan.Text),ParamLoc.DB_Handle);
  if VarArrayDimCount(man)>0 then
   begin
    ParamLoc.ParamPeople.Id:=man[0];
    ParamLoc.ParamPeople.Tn:=grifThen(VarIsNull(Man[1]),0,Man[1]);
    ParamLoc.ParamPeople.Caption:=man[2];
    EditManFio.Caption := ParamLoc.ParamPeople.Caption;
   end
  else
   EditMan.SetFocus;

  pFIBDataSet7.Close;
  pFIBDataSet7.SQLs.SelectSQL.Text:='SELECT * FROM GAR_WAYBILL_PREPAREDATA_BY_MAN('+VarToStr(ParamLoc.ParamPeople.id)+')';
  pFIBDataSet7.Open;

    if not pFIBDataSet7.IsEmpty then
    begin
      cxLookupComboBox1.EditValue:=pFIBDataSet7['ID_WORK_MODE'];
      Def_ID_WORK_MODE:=pFIBDataSet7['ID_WORK_MODE'];
    end;
 end;
 {not pFIBDataSet2.IsEmpty then
 begin
 cxTextEdit6.EditValue:=pFIBDataSet2['TOPL_COUNT_END'];
 cxTextEdit9.EditValue:=pFIBDataSet2['SPIDOMETR_END'];
 end;   }
 except
 end;

end;

procedure TFEditWayBill.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var avto:variant;
param:TgarSimpleParamMode;
i:Integer;
begin
  param:=TgarSimpleParamMode.Create;
  param.DB_Handle:=ParamLoc.DB_Handle;
  Param.Owner:=self;
  Param.fs:=garfsSelect;
  avto:=LoadPackageGarage(Param, Name_Gar_Sp_Avto);
  if VarArrayDimCount(avto)>0 then
   begin
     if avto[0]<>NULL then
      begin
        ParamLoc.ParamAvto.id:=avto[0];
        ParamLoc.ParamAvto.Tn:=VarToStrDef(avto[1],'');
        ParamLoc.ParamAvto.Caption:=VarToStrDef(avto[2],'');
        cxLabel1.Caption := ParamLoc.ParamAvto.Caption;
        cxButtonEdit1.Text := ParamLoc.ParamAvto.Tn;
      end;
   end;

   pFIBDataSet2.Close;
   pFIBDataSet2.SQLs.SelectSQL.Text:='SELECT * FROM GAR_WAYBILL_PREPAREDATA_BY_AVTO('+VarToStr(ParamLoc.ParamAvto.id)+')';
   pFIBDataSet2.Open;

   if paramloc.fs=garfsInsert then
   begin
     pFIBDataSet6.Close;
     pFIBDataSet6.SQLs.SelectSQL.Text:='SELECT * FROM GAR_WAYBILL_PREPARE_FACTOR_BY_A('+VarToStr(ParamLoc.ParamAvto.id)+')';
     pFIBDataSet6.Open;

     For i:=1 to  RxMemoryData1.RecordCount do
     begin
      if pFIBDataSet6.Locate('id_factor',RxMemoryData1['id_factor'],[]) then
        RxMemoryData1.delete
      else RxMemoryData1.Next;
     end;

     RxMemoryData1.LoadFromDataSet(pFIBDataSet6,0,lmAppend) ;
   end;
   Param.Free;

   if not pFIBDataSet2.IsEmpty then
    begin
      cxTextEdit6.EditValue:=VarToStrDef(pFIBDataSet2['TOPL_COUNT_END'],'0');
      DEF_TOPL_COUNT_END:=   VarToStrDef(pFIBDataSet2['TOPL_COUNT_END'],'0');
      cxTextEdit9.EditValue:=VarToStrDef(pFIBDataSet2['SPIDOMETR_END'],'0');
      DEF_SPIDOMETR_END :=   VarToStrDef(pFIBDataSet2['SPIDOMETR_END'],'0');
      cxLookupComboBox2.EditValue:=VarToStrDef(pFIBDataSet2['ID_MARKA_TOPL'],'0');
      DEF_ID_MARKA_TOPL :=   VarToStrDef(pFIBDataSet2['ID_MARKA_TOPL'],'0');
    end
end;

procedure TFEditWayBill.cxCheckBox1PropertiesChange(Sender: TObject);
var temp:variant;
begin
  cxTextEdit6.Enabled         :=not   cxTextEdit6.Enabled;
  //if cxCheckBox1.checked then
  //begin
    temp:=cxTextEdit6.EditValue;
    cxTextEdit6.EditValue:=DEF_TOPL_COUNT_END;
    DEF_TOPL_COUNT_END:=temp;
  //end
end;

procedure TFEditWayBill.cxCheckBox2PropertiesChange(Sender: TObject);
var Temp:variant;
begin
  cxTextEdit9.Enabled         :=not   cxTextEdit9.Enabled;
  //if cxCheckBox2.checked then
  //begin
    Temp:=cxTextEdit9.EditValue;
    cxTextEdit9.EditValue:=DEF_SPIDOMETR_END;
    DEF_SPIDOMETR_END:=temp;
  //end

end;

procedure TFEditWayBill.cxCheckBox3PropertiesChange(Sender: TObject);
var temp:variant;
begin
  cxLookupComboBox2.Enabled         :=not   cxLookupComboBox2.Enabled;
  //if cxCheckBox3.Checked then
  //begin
    temp:=cxLookupComboBox2.EditValue;
    cxLookupComboBox2.EditValue:=DEF_ID_MARKA_TOPL;
    DEF_ID_MARKA_TOPL:=temp;
  //end;
end;

procedure TFEditWayBill.cxCheckBox40PropertiesChange(Sender: TObject);
begin

  if cxCheckBox4.Checked then cxGroupBox10.Caption:='Время начала'
  else cxGroupBox10.Caption:='Покоазания одометра в начале';

  if cxCheckBox4.Checked then cxGroupBox11.Caption:='Время конца'
  else cxGroupBox11.Caption:='Покоазания одометра в конце';
end;

procedure TFEditWayBill.cxCheckBox4PropertiesChange(Sender: TObject);
begin
  cxTextEdit12.Enabled         :=not   cxTextEdit12.Enabled;
end;

procedure TFEditWayBill.cxCheckBox5PropertiesChange(Sender: TObject);
begin
  cxTextEdit13.Enabled         :=not   cxTextEdit13.Enabled;
end;

procedure TFEditWayBill.cxButtonEdit1PropertiesEditValueChanged(
  Sender: TObject);
var avto:Variant;
i:Integer;
begin
if (cxButtonEdit1.Text<>'') and (ParamLoc.ParamAvto.Tn<>cxButtonEdit1.Text) then
 begin
  if cxButtonEdit1.Text=VarToStr(ParamLoc.ParamAvto.Tn) then Exit;
  avto:=Gar_Avto_By_NOM_GOS(VarToStr(cxButtonEdit1.Text),ParamLoc.DB_Handle);
  if VarArrayDimCount(avto)>0 then
   begin
    ParamLoc.ParamAvto.Id:=avto[0];
    ParamLoc.ParamAvto.Tn:=grifThen(VarIsNull(avto[1]),0,avto[1]);
    ParamLoc.ParamAvto.Caption:=avto[2];
    cxLabel1.Caption := VarToStr(ParamLoc.ParamAvto.Caption);
    cxButtonEdit1.Text:=VarToStr(ParamLoc.ParamAvto.tn);

   end
  else
   cxButtonEdit1.SetFocus;

  pFIBDataSet2.Close;
  pFIBDataSet2.SQLs.SelectSQL.Text:='SELECT * FROM GAR_WAYBILL_PREPAREDATA_BY_AVTO('+VarToStr(ParamLoc.ParamAvto.id)+')';
  pFIBDataSet2.Open;


  if paramloc.fs=garfsInsert then
   begin
     pFIBDataSet6.Close;
     pFIBDataSet6.SQLs.SelectSQL.Text:='SELECT * FROM GAR_WAYBILL_PREPARE_FACTOR_BY_A('+VarToStr(ParamLoc.ParamAvto.id)+')';
     pFIBDataSet6.Open;

     For i:=1 to  RxMemoryData1.RecordCount do
     begin
      if pFIBDataSet6.Locate('id_factor',RxMemoryData1['id_factor'],[]) then
        RxMemoryData1.delete
      else RxMemoryData1.Next;
     end;

     RxMemoryData1.LoadFromDataSet(pFIBDataSet6,0,lmAppend) ;
   end;


  if not pFIBDataSet2.IsEmpty then
    begin
      cxTextEdit6.EditValue:=VarToStrDef(pFIBDataSet2['TOPL_COUNT_END'],'0');
      DEF_TOPL_COUNT_END:=   VarToStrDef(pFIBDataSet2['TOPL_COUNT_END'],'0');
      cxTextEdit9.EditValue:=VarToStrDef(pFIBDataSet2['SPIDOMETR_END'],'0');
      DEF_SPIDOMETR_END :=   VarToStrDef(pFIBDataSet2['SPIDOMETR_END'],'0');
      cxLookupComboBox2.EditValue:=VarToStrDef(pFIBDataSet2['ID_MARKA_TOPL'],'0');
      DEF_ID_MARKA_TOPL :=   VarToStrDef(pFIBDataSet2['ID_MARKA_TOPL'],'0');
    end
 end;
end;

procedure TFEditWayBill.cxCheckBox6PropertiesChange(Sender: TObject);
var Temp:variant;
begin
  cxDateEdit2.Enabled         :=not   cxDateEdit2.Enabled;
  //if cxCheckBox2.checked then
  //begin
  Temp:=cxDateEdit2.EditValue;
  cxDateEdit2.EditValue:=Def_date_END;
  Def_date_END:=temp;
  //end


end;

procedure TFEditWayBill.cxDateEdit1PropertiesChange(Sender: TObject);
begin
  if cxDateEdit2.Enabled=False then cxDateEdit2.EditValue:=cxDateEdit1.EditValue;
end;

procedure TFEditWayBill.cxButton2Click(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TFEditWayBill.cxCheckBox8PropertiesChange(Sender: TObject);
begin
  cxComboBox1.Enabled:= not cxComboBox1.Enabled;
  if (cxComboBox1.EditValue='Форма путевого листа №3') and ( not cxCheckBox8.Checked) then
    WaybillChange(cxCheckBox8.Checked)
  else if (cxComboBox1.EditValue='Форма путевого листа №2') and ( not cxCheckBox8.Checked) then
    WaybillChange(not cxCheckBox8.Checked)
  else if cxCheckBox8.Checked then
    WaybillChange(not cxCheckBox8.Checked);
end;

procedure TFEditWayBill.WaybillChange(val: Boolean);
begin
  //GroupBoxDep.Visible:=not val;
  cxTextEdit1.Enabled:=val;
  cxTextEdit2.Enabled:=val;
  cxTextEdit3.Enabled:=val;
  cxTextEdit4.Enabled:=val;
  cxTextEdit5.Enabled:=val;
  cxTextEdit14.Enabled:=val;
end;

procedure TFEditWayBill.cxComboBox1PropertiesChange(Sender: TObject);
begin

  if cxComboBox1.EditValue='Форма путевого листа №2'  then  WaybillChange(True)
  else if cxComboBox1.EditValue='Форма путевого листа №3'  then  WaybillChange(False);
end;

procedure TFEditWayBill.dxBarLargeButton18Click(Sender: TObject);
var factor:variant;
param:TgarSimpleParamMode;
Sname:string;
begin
  param:=TgarSimpleParamMode.Create;
  param.DB_Handle:=ParamLoc.DB_Handle;
  Param.Owner:=self;
  Param.fs:=garfsSelect;
  factor:=LoadPackageGarage(Param, Name_Gar_Sp_Factor);
  if VarArrayDimCount(factor)>0 then
   begin
      if factor[0]<>NULL then
      begin
        try
          RxMemoryData1.Append;
          RxMemoryData1.FieldByName('ID_FACTOR').AsInteger:=factor[0];
          Sname := VarToStrDef(factor[1],'');
          RxMemoryData1.FieldByName('NAME').AsString:=Sname;
          RxMemoryData1.FieldByName('VALUE_FACTOR').AsFloat:=Double(factor[2]);

          case ParamLoc.fs of
            garfsUpdate:
            begin
             DM.pFIBStoredProc1.Transaction.StartTransaction;
             DM.pFIBStoredProc1.StoredProcName:='GAR_WAYBILL_FACTOR_I';
             DM.pFIBStoredProc1.Prepare;
             DM.pFIBStoredProc1.ParamByName('ID_WAYBILL').AsInt64 :=ParamLoc.ID_Waybill;
             DM.pFIBStoredProc1.ParamByName('ID_FACTOR').AsInt64  :=factor[0];
             DM.pFIBStoredProc1.ExecProc;
             RxMemoryData1.FieldByName('ID_WayBill_FACTOR').AsInteger:=DM.pFIBStoredProc1.ParamByName('ID_WayBill_FACTOR').AsInt64 ;
            end
          end;

          RxMemoryData1.Post;
        except
            on e:Exception do
              begin
                garShowMessage(ECaption[LanguageIndex],e.message,mtError,[mbOk]);
              end;
        end;
      end;
   end;

end;

procedure TFEditWayBill.dxBarLargeButton19Click(Sender: TObject);
begin

  case ParamLoc.fs of

    garfsUpdate:
          begin
           DM.pFIBStoredProc1.Transaction.StartTransaction;
           DM.pFIBStoredProc1.StoredProcName:='GAR_WAYBILL_FACTOR_D';
           DM.pFIBStoredProc1.Prepare;
           DM.pFIBStoredProc1.ParamByName('ID_WAYBILL_FACTOR').AsInt64 :=RxMemoryData1['ID_WAYBILL_FACTOR'];
           DM.pFIBStoredProc1.ExecProc;
          end
  end;
  RxMemoryData1.Delete;
end;

procedure TFEditWayBill.cxCheckBox11PropertiesChange(Sender: TObject);
var temp:variant;
begin
  cxLookupComboBox1.Enabled         :=not   cxLookupComboBox1.Enabled;
//  if cxCheckBox11.Checked then
  //begin
    temp:=cxLookupComboBox1.EditValue;
    cxLookupComboBox1.EditValue:=DEF_ID_WORK_MODE;
    DEF_ID_WORK_MODE:=temp;
  //end
end;

procedure TFEditWayBill.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  RxMemoryData1.Close;
  if DM.pFIBStoredProc1.Transaction.Active then DM.pFIBStoredProc1.Transaction.Rollback;
  if pFIBDataSet1.Active then pFIBDataSet1.Close;
  if pFIBDataSet2.Active then pFIBDataSet2.Close;
  if pFIBDataSet3.Active then pFIBDataSet3.Close;
  if pFIBDataSet4.Active then pFIBDataSet4.Close;
  if pFIBDataSet5.Active then pFIBDataSet5.Close;
  if pFIBDataSet6.Active then pFIBDataSet6.Close;
  if pFIBDataSet7.Active then pFIBDataSet7.Close;
  if pFIBDataSet8.Active then pFIBDataSet8.Close;
end;

procedure TFEditWayBill.Action2Execute(Sender: TObject);
begin
      if  cxButton1.Focused Then Action1Execute(Sender);
      if  cxButton2.Focused Then cxButton2Click(Sender);
      SendKeyDown(Self.ActiveControl,VK_TAB,[]);
end;

procedure TFEditWayBill.dxBarLargeBtnAdd5Click(Sender: TObject);
var param:TgarParamWaybillPart;
id:variant;
sum:variant;
begin
  param:=TgarParamWaybillPart.Create;
  param.DB_Handle:=ParamLoc.DB_Handle;
  Param.Owner:=self;
  Param.fs:=garfsInsert;
  if not RxMemoryData2.IsEmpty then
    begin
      id:=RxMemoryData2['ID_WAYBILL_PART'];
      sum:=0;
      RxMemoryData2.First;
      while not  RxMemoryData2.eof  do
        begin
          Sum:=Sum+RxMemoryData2['MILAGE'];
          RxMemoryData2.Next;
        end;
      RxMemoryData2.Locate('ID_WAYBILL_PART',id,[]);
      if (cxTextEdit9.Text<>'') and (cxTextEdit10.Text<>'') then
        Param.MILAGE:=cxTextEdit10.EditValue-cxTextEdit9.EditValue-Sum;
    end
  else if (cxTextEdit9.Text<>'') and (cxTextEdit10.Text<>'') then
        Param.MILAGE:=cxTextEdit10.EditValue-cxTextEdit9.EditValue;


  IF  view_edit_part(Param) THEN
    try
          RxMemoryData2.Append;
          RxMemoryData2.FieldByName('MILAGE').AsInteger:=param.MILAGE;
          RxMemoryData2.FieldByName('NAME').AsString:=   param.name_factor;
          RxMemoryData2.FieldByName('ID_FACTOR').AsInteger:=    param.id_factor;
          case ParamLoc.fs of
            garfsUpdate:
            begin
             DM.pFIBStoredProc1.Transaction.StartTransaction;
             DM.pFIBStoredProc1.StoredProcName:='GAR_WAYBILL_PART_I';
             DM.pFIBStoredProc1.Prepare;
             DM.pFIBStoredProc1.ParamByName('ID_WAYBILL').AsInteger :=ParamLoc.ID_Waybill;
             DM.pFIBStoredProc1.ParamByName('ID_FACTOR').AsInteger  :=param.id_factor;
             DM.pFIBStoredProc1.ParamByName('MILAGE').AsInteger  :=param.MILAGE;
             DM.pFIBStoredProc1.ExecProc;
             RxMemoryData2.FieldByName('ID_WAYBILL_PART').AsInteger:=DM.pFIBStoredProc1.ParamByName('ID_WAYBILL_PART').AsInt64 ;
            end
          end;
          RxMemoryData2.Post;
    except
            on e:Exception do
              begin
                garShowMessage(ECaption[LanguageIndex],e.message,mtError,[mbOk]);
              end;
    end;
  param.Free;
end;

procedure TFEditWayBill.LBtnUpdateClick(Sender: TObject);
var param:TgarParamWaybillPart;
begin
  if RxMemoryData2.IsEmpty then Exit;
  param:=TgarParamWaybillPart.Create;
  param.DB_Handle:=ParamLoc.DB_Handle;
  Param.Owner:=self;
  Param.fs:=garfsUpdate;
  Param.id_factor     :=RxMemoryData2['id_factor'];
  Param.name_factor   :=RxMemoryData2['NAME'];
  Param.MILAGE :=RxMemoryData2['MILAGE'];
  IF  view_edit_part(Param) THEN
    try
          RxMemoryData2.Edit;
          RxMemoryData2.FieldByName('MILAGE').AsInteger:=param.MILAGE;
          RxMemoryData2.FieldByName('NAME').AsString:=   param.name_factor;
          RxMemoryData2.FieldByName('ID_FACTOR').AsInteger:=    param.id_factor;
          case ParamLoc.fs of
            garfsUpdate:
            begin
             DM.pFIBStoredProc1.Transaction.StartTransaction;
             DM.pFIBStoredProc1.StoredProcName:='GAR_WAYBILL_PART_U';
             DM.pFIBStoredProc1.Prepare;
             //DM.pFIBStoredProc1.ParamByName('ID_WAYBILL').AsInteger :=ParamLoc.ID_Waybill;
             DM.pFIBStoredProc1.ParamByName('ID_WAYBILL_PART').AsInteger :=RxMemoryData2['ID_WAYBILL_PART'];
             DM.pFIBStoredProc1.ParamByName('ID_FACTOR').AsInteger      :=param.id_factor;
             DM.pFIBStoredProc1.ParamByName('MILAGE').AsInteger  :=param.MILAGE;
             DM.pFIBStoredProc1.ExecProc;
             //RxMemoryData2.FieldByName('ID_WAYBILL_PART').AsInteger:=DM.pFIBStoredProc1.ParamByName('ID_WayBill_FACTOR').AsInt64 ;
            end
          end;
          RxMemoryData2.Post;
    except
            on e:Exception do
              begin
                garShowMessage(ECaption[LanguageIndex],e.message,mtError,[mbOk]);
              end;
    end;
  param.Free;
end;

procedure TFEditWayBill.LBtnDeletePaymentClick(Sender: TObject);
begin
  case ParamLoc.fs of
    garfsUpdate:
          begin
           DM.pFIBStoredProc1.Transaction.StartTransaction;
           DM.pFIBStoredProc1.StoredProcName:='GAR_WAYBILL_PART_D';
           DM.pFIBStoredProc1.Prepare;
           DM.pFIBStoredProc1.ParamByName('ID_WAYBILL_PART').AsInt64 :=RxMemoryData2['ID_WAYBILL_PART'];
           DM.pFIBStoredProc1.ExecProc;
          end
  end;
  RxMemoryData2.Delete;
end;

procedure TFEditWayBill.cxTextEdit10Exit(Sender: TObject);
begin
  if (cxTextEdit10.Text<>'') and (cxTextEdit9.Text<>'') and cxCheckBox4.checked then
  cxMaskEdit1.EditValue := cxTextEdit10.EditValue-cxTextEdit9.EditValue;
end;

procedure TFEditWayBill.ReadReg;
var
  reg : TRegistry;
begin
  reg := TRegistry.Create;
  reg.RootKey := HKEY_CURRENT_USER;
  if reg.OpenKey('\Software\Garage\WayBillIns\',False) then
  begin
    cxDateEdit1.Date := StrToDate(reg.ReadString('DateBeg_WayBill'));
    cxTextEdit11.Text := reg.ReadString('Seriya_WayBill');
  end;
end;


procedure TFEditWayBill.WriteReg;
var
  reg : TRegistry;
begin
  reg := TRegistry.Create;
  try
   reg.RootKey:=HKEY_CURRENT_USER;
   if (reg.OpenKey('\Software\Garage\WayBillIns\',True)) then
   begin
     reg.WriteString('DateBeg_WayBill',DateToStr(Cxdateedit1.date));
     reg.WriteString('Seriya_WayBill',cxTextEdit11.text);
   end;
  finally
   reg.Free;
  end;
end;

end.
