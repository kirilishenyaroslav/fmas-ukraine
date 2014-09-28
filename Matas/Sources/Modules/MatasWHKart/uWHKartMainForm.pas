{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль работы со складской картотекой                 }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uWHKartMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, DateUtils,
  cxGridDBTableView, cxGrid, ExtCtrls, cxLookAndFeelPainters, StdCtrls,
  cxButtons, Buttons, cxDBEdit, cxContainer, cxTextEdit, cxMaskEdit,
  cxButtonEdit, FIBDataSet, pFIBDataSet, uResources, uSpMatOtv, uMatasUtils,
  cxDropDownEdit, cxCalendar, cxGridBandedTableView, ibase,
  cxGridDBBandedTableView, FR_DSet, FR_DBSet, FR_Class, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxSpinEdit, DBTables, MemTable,
  cxSplitter, FR_Cross, FIBDatabase, pFIBDatabase, Menus, ImgList,
  FIBQuery, pFIBQuery, pFIBStoredProc, Grids, uMatasVars, uPackageManager,
  uSpMatSchMulti, Placemnt;

type
  TWHKartMainForm = class(TForm)
    Panel1: TPanel;
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
    WorkDataSet: TpFIBDataSet;
    LabelMol: TLabel;
    cxMatOtv: TcxButtonEdit;
    ApplyButton: TcxButton;
    PrintButton: TcxButton;
    ExitButton: TcxButton;
    frReportOborot: TfrReport;
    frDataSetOborot: TfrDBDataSet;
    LabelSch: TLabel;
    WorkDataSetID_SCH: TFIBBCDField;
    WorkDataSetSCH_NUMBER: TFIBStringField;
    WorkDataSetSCH_TITLE: TFIBStringField;
    WorkDataSetID_MO: TFIBBCDField;
    WorkDataSetFIO: TFIBStringField;
    WorkDataSetSFIO: TFIBStringField;
    WorkDataSetNAME_DEPARTMENT: TFIBStringField;
    WorkDataSetID_NOMN: TFIBIntegerField;
    WorkDataSetNOMN: TFIBStringField;
    WorkDataSetNAME: TFIBStringField;
    WorkDataSetID_UNIT: TFIBIntegerField;
    WorkDataSetUNIT: TFIBStringField;
    WorkDataSetUNIT_NAME: TFIBStringField;
    WorkDataSetKOL_BEG: TFIBBCDField;
    WorkDataSetKOL_PRH: TFIBBCDField;
    WorkDataSetKOL_RSH: TFIBBCDField;
    WorkDataSetKOL_OST: TFIBBCDField;
    WorkDataSetSUMM_BEG: TFIBBCDField;
    WorkDataSetSUMM_PRH: TFIBBCDField;
    WorkDataSetSUMM_RSH: TFIBBCDField;
    WorkDataSetSUMM_OST: TFIBBCDField;
    WorkDataSource: TDataSource;
    WorkDataSetID_MARK: TFIBBCDField;
    WorkDataSetMARK: TFIBStringField;
    cxLookupSch: TcxButtonEdit;
    cxSplitter1: TcxSplitter;
    Panel2: TPanel;
    Panel3: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView1ID_SCH: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SCH_NUMBER: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SCH_TITLE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1ID_MO: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FIO: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SFIO: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1NAME_DEPARTMENT: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1ID_NOMN: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1NOMN: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1NAME: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1ID_UNIT: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1UNIT: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1UNIT_NAME: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1KOL_BEG: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1KOL_PRH: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1KOL_OST: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1KOL_RSH: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SUMM_BEG: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SUMM_PRH: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SUMM_RSH: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SUMM_OST: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1MOL: TcxGridDBBandedColumn;
    cxGrid1Level1: TcxGridLevel;
    PrhDocDataSet: TpFIBDataSet;
    RshDocDataSet: TpFIBDataSet;
    PrhDocDataSource: TDataSource;
    RshDocDataSource: TDataSource;
    PrhDocDataSetID_DOC: TFIBBCDField;
    PrhDocDataSetID_TIPD: TFIBBCDField;
    PrhDocDataSetTIPD: TFIBStringField;
    PrhDocDataSetNAME_TIPD: TFIBStringField;
    PrhDocDataSetNUM_DOC: TFIBStringField;
    PrhDocDataSetDATE_DOC: TFIBDateField;
    PrhDocDataSetID_MO_OUT: TFIBBCDField;
    PrhDocDataSetFIO_MO_OUT: TFIBStringField;
    PrhDocDataSetNAME_DEP_OUT: TFIBStringField;
    cxGrid3DBTableView1: TcxGridDBTableView;
    cxGrid3Level1: TcxGridLevel;
    cxGrid3: TcxGrid;
    PrhDocDataSetID_CUST: TFIBBCDField;
    PrhDocDataSetNAME_CUSTOMER: TFIBStringField;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGrid2ID_DOC: TcxGridDBColumn;
    cxGrid2ID_TIPD: TcxGridDBColumn;
    cxGrid2TIPD: TcxGridDBColumn;
    cxGrid2NAME_TIPD: TcxGridDBColumn;
    cxGrid2NUM_DOC: TcxGridDBColumn;
    cxGrid2DATE_DOC: TcxGridDBColumn;
    cxGrid2ID_MO_OUT: TcxGridDBColumn;
    cxGrid2FIO_MO_OUT: TcxGridDBColumn;
    cxGrid2NAME_DEP_OUT: TcxGridDBColumn;
    cxGrid2ID_CUST: TcxGridDBColumn;
    cxGrid2NAME_CUSTOMER: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    RshDocDataSetID_DOC: TFIBBCDField;
    RshDocDataSetID_TIPD: TFIBBCDField;
    RshDocDataSetTIPD: TFIBStringField;
    RshDocDataSetNAME_TIPD: TFIBStringField;
    RshDocDataSetNUM_DOC: TFIBStringField;
    RshDocDataSetDATE_DOC: TFIBDateField;
    RshDocDataSetID_MO_IN: TFIBBCDField;
    RshDocDataSetFIO_MO_IN: TFIBStringField;
    RshDocDataSetNAME_DEP_IN: TFIBStringField;
    RshDocDataSetID_CUST: TFIBBCDField;
    RshDocDataSetNAME_CUSTOMER: TFIBStringField;
    cxGrid3ID_DOC: TcxGridDBColumn;
    cxGrid3ID_TIPD: TcxGridDBColumn;
    cxGrid3TIPD: TcxGridDBColumn;
    cxGrid3NAME_TIPD: TcxGridDBColumn;
    cxGrid3NUM_DOC: TcxGridDBColumn;
    cxGrid3DATE_DOC: TcxGridDBColumn;
    cxGrid3ID_MO_IN: TcxGridDBColumn;
    cxGrid3FIO_MO_IN: TcxGridDBColumn;
    cxGrid3NAME_DEP_IN: TcxGridDBColumn;
    cxGrid3ID_CUST: TcxGridDBColumn;
    cxGrid3NAME_CUSTOMER: TcxGridDBColumn;
    RepPrhDocDataSet: TpFIBDataSet;
    RepRshDocDataSet: TpFIBDataSet;
    RepPrhDocDataSetID_DOC: TFIBBCDField;
    RepPrhDocDataSetID_TIPD: TFIBBCDField;
    RepPrhDocDataSetTIPD: TFIBStringField;
    RepPrhDocDataSetNAME_TIPD: TFIBStringField;
    RepPrhDocDataSetNUM_DOC: TFIBStringField;
    RepPrhDocDataSetDATE_DOC: TFIBDateField;
    RepPrhDocDataSetID_MO_OUT: TFIBBCDField;
    RepPrhDocDataSetFIO_MO_OUT: TFIBStringField;
    RepPrhDocDataSetNAME_DEP_OUT: TFIBStringField;
    RepPrhDocDataSetID_CUST: TFIBBCDField;
    RepPrhDocDataSetNAME_CUSTOMER: TFIBStringField;
    RepRshDocDataSetID_DOC: TFIBBCDField;
    RepRshDocDataSetID_TIPD: TFIBBCDField;
    RepRshDocDataSetTIPD: TFIBStringField;
    RepRshDocDataSetNAME_TIPD: TFIBStringField;
    RepRshDocDataSetNUM_DOC: TFIBStringField;
    RepRshDocDataSetDATE_DOC: TFIBDateField;
    RepRshDocDataSetID_MO_IN: TFIBBCDField;
    RepRshDocDataSetFIO_MO_IN: TFIBStringField;
    RepRshDocDataSetNAME_DEP_IN: TFIBStringField;
    RepRshDocDataSetID_CUST: TFIBBCDField;
    RepRshDocDataSetNAME_CUSTOMER: TFIBStringField;
    frDBDataSetPrhDoc: TfrDBDataSet;
    frDBDataSetRshDoc: TfrDBDataSet;
    WHKartDataBase: TpFIBDatabase;
    WHKartTransaction: TpFIBTransaction;
    WorkDataSetPRICE: TFIBBCDField;
    cxGrid1DBBandedTableView1PRICE: TcxGridDBBandedColumn;
    WorkDataSetID_OST: TFIBBCDField;
    pmOborot: TPopupMenu;
    NPrint: TMenuItem;
    NRefresh: TMenuItem;
    imgOborot: TImageList;
    PrhDocDataSetKOL_MAT: TFIBBCDField;
    PrhDocDataSetSUMMA: TFIBBCDField;
    RshDocDataSetKOL_MAT: TFIBBCDField;
    RshDocDataSetSUMMA: TFIBBCDField;
    cxGrid2KOL_MAT: TcxGridDBColumn;
    cxGrid2SUMMA: TcxGridDBColumn;
    cxGrid3KOL_MAT: TcxGridDBColumn;
    cxGrid3SUMMA: TcxGridDBColumn;
    StringGrid1: TStringGrid;
    OborotFormStorage: TFormStorage;
    WorkDataSetBAL_ID_SCH: TFIBIntegerField;
    WorkDataSetBAL_SCH_NUMBER: TFIBStringField;
    WorkDataSetBAL_SCH_TITLE: TFIBStringField;
    WorkDataSetINV_NUM_LIST: TFIBStringField;
    WorkDataSetMNA_NUM_LIST: TFIBStringField;
    WorkDataSetDOC_ID_TIPD: TFIBIntegerField;
    WorkDataSetDOC_TIPD: TFIBStringField;
    WorkDataSetDOC_NAME_TIPD: TFIBStringField;
    WorkDataSetDOC_NUM_DOC: TFIBStringField;
    WorkDataSetDOC_DATE_DOC: TFIBDateField;
    Label1: TLabel;
    cxNameFilter: TcxTextEdit;
    frDBDataSetPrh: TfrDBDataSet;
    frDBDataSetRsh: TfrDBDataSet;
    procedure cxExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxMatOtvPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure SetSelectSQL;
    procedure ApplyButtonClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure cxMatOtvKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxLookupSchPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxLookupSchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure NRefreshClick(Sender: TObject);
    procedure NPrintClick(Sender: TObject);
    procedure cxGridDBTableView1DblClick(Sender: TObject);
    procedure cxGrid3DBTableView1DblClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
   DBHANDLE : TISC_DB_HANDLE;
   ID_USER : Int64;
  public
   FWidth:integer;
   ID_MO: integer;
   ID_SCH: integer;
   FioMO, SpodrMO: string;
   DATE_BEG, DATE_END, PERIOD: TDateTime;
   F_SCH: boolean;
   FILTER_ID_SESSION: integer;
   constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_USER: int64; PERIOD: TDateTime);overload;
  end;

//procedure ShowWareHouseKart(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;

//exports ShowWareHouseKart;

var
  WHKartMainForm: TWHKartMainForm;

implementation

uses uWHKartWorkSplash, uSpMatSch, uWHKartPrintForm;

{$R *.dfm}

{procedure ShowWareHouseKart(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
begin
 TWHKartMainForm.Create(AOwner, DBHANDLE, aID_USER, aPERIOD);
end; }

constructor TWHKartMainForm.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; ID_USER : Int64; PERIOD: TDateTime);
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
   Self.DBHANDLE := DBHandle;
   Self.WHKartDataBase.Close;
   Self.WHKartDatabase.Handle:=DBHANDLE;
   Self.PERIOD:=PERIOD;
 end;
end;

procedure TWHKartMainForm.SetSelectSQL;
var
 f: boolean;
 prefix: string;
begin
 prefix:='WHERE ';
 WorkDataSet.SelectSQL.Clear;
 WorkDataSet.SelectSQL.Add('SELECT * ');
 WorkDataSet.SelectSQL.Add('FROM MAT_MAKE_OBOROT_FOR_WH_KART(:PID_MO, :DATE_BEG, :DATE_END)');
 f:=false;
 if F_SCH then
 begin
  WorkDataSet.SelectSQL.Add(prefix+' ( ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
  WorkDataSet.SelectSQL.Add('OR BAL_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+'))');
  prefix:='AND'
 end;
 if cxNameFilter.Text<>'' then
  WorkDataSet.SelectSQL.Add(prefix+' NAME LIKE :PNAME');
 WorkDataSet.SelectSQL.Add('ORDER BY FIO, NAME_DEPARTMENT, SCH_NUMBER, NAME');
end;

procedure TWHKartMainForm.cxExitButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TWHKartMainForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TWHKartMainForm.cxMatOtvPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res : Variant;
  IsMoOk:boolean;
begin
 IsMoOk:=false;
 Res:=uSpMatOtv.GetMatOtv(self, DBHANDLE, 0, ID_MO);
 if  VarType(Res) <> varEmpty then
 begin
  ID_MO:=Res[0];
  FioMO := Res[1];
  SpodrMO := Res[2];
  IsMoOk:=true;
 end;
  if IsMoOk then
  begin
   cxMatOtv.Text:=FioMO+' / '+SpodrMO;
   ApplyButtonClick(self);
  end;
end;

procedure TWHKartMainForm.FormCreate(Sender: TObject);
var
 dd, dm, dy: Word;
begin
 Caption:=MAT_SYS_PREFIX+MAT_STR_MAIN_MENU_ACC_OBV;
 with OborotFormStorage do
 begin
  RestoreFormPlacement;
  Width:=StoredValue['FormWidth'];
  Height:=StoredValue['FormHeight'];
 end;
 if Width<750 then Width:=750;
 if Height<550 then Height:=550;
 ID_SCH:=0;
 ID_MO:=0;
 FioMO:='';
 SpodrMO:='';
 LabelMol.Caption:=MAT_STR_COL_MOL;
 LabelSch.Caption:=MAT_STR_COL_SCH;
 ApplyButton.Caption:=MAT_BUTTON_SHOW_CONST;
 PrintButton.Caption:=MAT_ACTION_PRINT_CONST;
 ExitButton.Caption:=MAT_ACTION_CLOSE_CONST;
 cxGrid1DBBandedTableView1SCH_NUMBER.Caption:=MAT_STR_COL_SCH;
 cxGrid1DBBandedTableView1NAME.Caption:=MAT_STR_COL_NAME_TMC;
 cxGrid1DBBandedTableView1UNIT.Caption:=MAT_STR_COL_NAME_UNIT;
 cxGrid1DBBandedTableView1PRICE.Caption:=MAT_STR_COL_NAME_UNIT;
 cxGrid1DBBandedTableView1KOL_BEG.Caption:=MAT_STR_COL_KOL_BEG;
 cxGrid1DBBandedTableView1KOL_PRH.Caption:=MAT_STR_COL_PRH_KOL;
 cxGrid1DBBandedTableView1KOL_OST.Caption:=MAT_STR_COL_KOL_END;
 cxGrid1DBBandedTableView1KOL_RSH.Caption:=MAT_STR_COL_RSH_KOL;
 cxGrid1DBBandedTableView1SUMM_BEG.Caption:=MAT_STR_COL_SUM_BEG;
 cxGrid1DBBandedTableView1SUMM_OST.Caption:=MAT_STR_COL_SUM_END;
 cxGrid1DBBandedTableView1SUMM_PRH.Caption:=MAT_STR_COL_PRH_SUM;
 cxGrid1DBBandedTableView1SUMM_RSH.Caption:=MAT_STR_COL_RSH_SUM;
 cxGrid2TIPD.Caption:=MAT_STR_COL_TIPD;
 cxGrid2NUM_DOC.Caption:=MAT_STR_COL_NUM_DOC;
 cxGrid2DATE_DOC.Caption:=MAT_STR_COL_DATE_DOC;
 cxGrid2FIO_MO_OUT.Caption:=MAT_STR_COL_OUT;
 cxGrid2KOL_MAT.Caption:=MAT_STR_COL_KOL_MAT;
 cxGrid2SUMMA.Caption:=MAT_STR_COL_SUMMA;
 cxGrid3TIPD.Caption:=MAT_STR_COL_TIPD;
 cxGrid3NUM_DOC.Caption:=MAT_STR_COL_NUM_DOC;
 cxGrid3DATE_DOC.Caption:=MAT_STR_COL_DATE_DOC;
 cxGrid3FIO_MO_IN.Caption:=MAT_STR_COL_IN;
 cxGrid3KOL_MAT.Caption:=MAT_STR_COL_KOL_MAT;
 cxGrid3SUMMA.Caption:=MAT_STR_COL_SUMMA;
 NRefresh.Caption:=MAT_ACTION_REFRESH_CONST;
 NPrint.Caption:=MAT_ACTION_PRINT_CONST;
 DecodeDate(PERIOD, dy, dm,  dd);
 Date_Beg:=StartOfTheMonth(_MATAS_BEG_PERIOD);
 Date_End:=EndOfTheMonth(_MATAS_PERIOD);
 cxSplitter1.CloseSplitter;
 F_SCH:=false;
end;

procedure TWHKartMainForm.ApplyButtonClick(Sender: TObject);
var
 DBEG, DEND: TDateTime;
 w: TForm;
begin
 if ID_MO<=0 then
  exit;
 Refresh;
 w:=ShowWaitWindow(self);
 DEND:=EndOfTheMonth(_MATAS_PERIOD);
 DBEG:=StartOfTheMonth(_MATAS_BEG_PERIOD);
 DATE_BEG:=DBEG;
 DATE_END:=DEND;
 WorkDataSet.Close;
 SetSelectSQL;
 WorkDataSet.Prepare;
 WorkDataSet.ParamByName('DATE_BEG').Value:=DBEG;
 WorkDataSet.ParamByName('DATE_END').Value:=DEND;
 WorkDataSet.ParamByName('PID_MO').Value:=ID_MO;
 if cxNameFilter.Text<>'' then
  WorkDataSet.ParamByName('PNAME').Value:=AnsiUpperCase(cxNameFilter.Text)+'%';
 PrhDocDataSet.ParamByName('PDATE_BEG').Value:=DBEG;
 PrhDocDataSet.ParamByName('PDATE_END').Value:=DEND;
 RshDocDataSet.ParamByName('PDATE_BEG').Value:=DBEG;
 RshDocDataSet.ParamByName('PDATE_END').Value:=DEND;
 WorkDataSet.CloseOpen(false);
 WorkDataSet.First;
 PrhDocDataSet.CloseOpen(false);
 RshDocDataSet.CloseOpen(false);
// cxGrid1DBBandedTableView1.ViewData.Expand(true);
 CloseWaitWindow(w);
end;

procedure TWHKartMainForm.ExitButtonClick(Sender: TObject);
begin
// ShowMessage('W='+IntToStr(Width)+' H='+Inttostr(Height));
 with OborotFormStorage do
 begin
  StoredValue['FormWidth']:=Width;
  StoredValue['FormHeight']:=Height;
  SaveFormPlacement;
 end;
 Close;
end;

procedure TWHKartMainForm.PrintButtonClick(Sender: TObject);
var
 fp: TOborotPrintForm;
 sp: TSplashForm;
 prh_doc_list, rsh_doc_list: string;
 name_report: string;
begin
 if WorkDataSet.IsEmpty then exit;
 fp:=TOborotPrintform.Create(self);
 if fp.ShowModal=mrOk then
 begin
  sp:=TSplashForm.Create(self);
  sp.MsgLabel.Caption:='Подготовка данных к печати';
  sp.Update;
  sp.Show;
  WorkDataSource.Enabled:=false;
  DATE_END:=EndOfTheMonth(_MATAS_PERIOD);
  DATE_BEG:=StartOfTheMonth(_MATAS_BEG_PERIOD);

{  RepPrhDocDataSet.ParamByName('PDATE_BEG').Value:=DATE_BEG;
  RepPrhDocDataSet.ParamByName('PDATE_END').Value:=DATE_END;
  RepRshDocDataSet.ParamByName('PDATE_BEG').Value:=DATE_BEG;
  RepRshDocDataSet.ParamByName('PDATE_END').Value:=DATE_END;
  RepPrhDocDataSet.ParamByName('PID_SCH').Value:=ID_SCH;
  RepRshDocDataSet.ParamByName('PID_SCH').Value:=ID_SCH;
  RepPrhDocDataSet.ParamByName('PID_MO').Value:=ID_MO;
  RepRshDocDataSet.ParamByName('PID_MO').Value:=ID_MO;
  RepPrhDocDataSet.CloseOpen(true);
  RepPrhDocDataSet.First;
  prh_doc_list:='';
  while not RepPrhDocDataSet.Eof do
  begin
   prh_doc_list:=prh_doc_list+RepPrhDocDataSet.FieldByName('TIPD').Value+' '+RepPrhDocDataSet.FieldByName('NUM_DOC').Value+', ';
   RepPrhDocDataSet.Next;
  end;
  //  RepPrhDocDataSet.Close;
  sp.ProgressBar.Position:=30;
  sp.Update;
  RepRshDocDataSet.CloseOpen(true);
  RepRshDocDataSet.First;
  rsh_doc_list:='';
  while not RepRshDocDataSet.Eof do
  begin
   rsh_doc_list:=rsh_doc_list+RepRshDocDataSet.FieldByName('TIPD').Value+' '+RepRshDocDataSet.FieldByName('NUM_DOC').Value+', ';
   RepRshDocDataSet.Next;
  end;
  //  RepRshDocDataSet.Close;
}
  sp.ProgressBar.Position:=60;
  sp.Update;

//   frVariables['PERIOD']:='c '+cxMonthBeg.Text+' '+IntToStr(cxYearBeg.Value)+' по '+cxMonthEnd.Text+' '+IntToStr(cxYearEnd.Value);
   frVariables['DATE_BEG']:=DateToStr(DATE_BEG);
   frVariables['DATE_END']:=DateToStr(DATE_END);
   frVariables['PRH_DOC_LIST']:=prh_doc_list;
   frVariables['RSH_DOC_LIST']:=rsh_doc_list;
   frVariables['ORG_NAME']:=_ORG_FULL_NAME;
   frVariables['ORG_SHORT_NAME']:=_ORG_SHORT_NAME;
   frVariables['ORG_KOD_OKPO']:=_ORG_KOD_OKPO;

   sp.ProgressBar.Position:=100;
   sp.Update;
   sp.Free;

   if fp.TIP_REPORT=0 then
    NAME_REPORT:='wh_kart.frf';

   if fp.TIP_REPORT=1 then
    NAME_REPORT:='material_full.frf';

   frReportOborot.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\'+NAME_REPORT);
   if fp.cxCopies.Value>1 then
    frReportOborot.DefaultCopies:=fp.cxCopies.Value;
   if fp.cxCheckOnPrinter.Checked then
   begin
    if fp.cxSelectPrinter.Checked then
     frReportOborot.PrintPreparedReportDlg
    else
     frReportOborot.PrintPreparedReport('', fp.cxCopies.Value, false, frAll);
   end
   else
    frReportOborot.ShowReport;
   if fp.cxCheckEdit.Checked then
    frReportOborot.DesignReport;

  WorkDataSource.Enabled:=true;
  WorkDataSet.First;
  PrhDocDataSet.CloseOpen(false);
  RshDocDataSet.CloseOpen(false);
 end;
 fp.Free;
end;

procedure TWHKartMainForm.cxMatOtvKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  cxMatOtv.Text:='';
  ID_MO:=0;
 end
end;

procedure TWHKartMainForm.cxLookupSchPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res : Variant;
  mr: boolean;
  VarDimCnt: integer;
  i: integer;
  s: string;
begin
 mr:=false;
 if FILTER_ID_SESSION=0 then
  FILTER_ID_SESSION:=WHKartDataBase.Gen_Id('MAT_ID_SESSION',1, WHKartTransaction);
 Res:=uSpMatSchMulti.GetMatSchMulti(self, DBHandle, 0, FILTER_ID_SESSION, mr);
 if mr then begin
  if  VarType(Res) <> varEmpty then begin
   VarDimCnt:=VarArrayHighBound(Res,  1);
   s:='';
   for i:=0 to VarDimCnt do begin
    s:=s+VarToStr(Res[i][1])+';';
   end;
   cxLookupSch.Text := s;
   F_SCH:=true;
  end
 end
 else
 begin
  F_SCH:=false;
  FILTER_ID_SESSION:=0;
  cxLookupSch.Text:='';
 end;
end;

procedure TWHKartMainForm.cxLookupSchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  cxLookupSch.Text:='';
  F_SCH:=false;
  FILTER_ID_SESSION:=0;
 end
end;

procedure TWHKartMainForm.NRefreshClick(Sender: TObject);
begin
 ApplyButtonClick(self);
end;

procedure TWHKartMainForm.NPrintClick(Sender: TObject);
begin
 PrintButtonClick(self);
end;

procedure TWHKartMainForm.cxGridDBTableView1DblClick(Sender: TObject);
begin
 uPackageManager.ViewDoc(self, DBHANDLE, PrhDocDataSet.FieldByName('ID_DOC').AsInteger);
end;

procedure TWHKartMainForm.cxGrid3DBTableView1DblClick(Sender: TObject);
begin
 uPackageManager.ViewDoc(self, DBHANDLE, RshDocDataSet.FieldByName('ID_DOC').AsInteger);
end;

procedure TWHKartMainForm.FormResize(Sender: TObject);
begin
 cxGrid2.Width:= (Width div 2) - 4;
end;

end.
