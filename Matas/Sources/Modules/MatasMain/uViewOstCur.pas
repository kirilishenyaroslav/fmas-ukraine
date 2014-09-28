{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль просмотра остатков и оборотов                  }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uViewOstCur;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uResources, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxMaskEdit, cxButtonEdit,
  Buttons, cxContainer, cxTextEdit, cxDBEdit, StdCtrls, ExtCtrls,
  cxGridTableView, FIBDataSet, pFIBDataSet, cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, uSpMatOtv, cxLookAndFeelPainters,
  cxButtons, uPackageManager, ibase, FIBDatabase, pFIBDatabase,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  FR_Class, FR_DSet, FR_DBSet, cxSplitter, DateUtils,
  uMatasVars, uMatasUtils, uSpMatSchEx, uSpMatSchMulti, Placemnt, ActnList,
  Menus, frxClass, frxDBSet, frxExportHTML, frxExportPDF, frxExportXML,
  frxExportRTF, ImgList, cxCheckBox, frxDesgn, cxImage, RxGIF, FIBQuery,
  pFIBQuery, pFIBStoredProc;

type
  TOstCurForm = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1ID_OST: TcxGridDBColumn;
    cxGrid1DBTableView1ID_MO: TcxGridDBColumn;
    cxGrid1DBTableView1FIO: TcxGridDBColumn;
    cxGrid1DBTableView1SFIO: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_DEPARTMENT: TcxGridDBColumn;
    cxGrid1DBTableView1NAME: TcxGridDBColumn;
    cxGrid1DBTableView1ID_NOMN: TcxGridDBColumn;
    cxGrid1DBTableView1ID_UNIT: TcxGridDBColumn;
    cxGrid1DBTableView1UNIT: TcxGridDBColumn;
    cxGrid1DBTableView1KOL_MAT: TcxGridDBColumn;
    cxGrid1DBTableView1PRICE: TcxGridDBColumn;
    cxGrid1DBTableView1SUMMA: TcxGridDBColumn;
    cxGrid1DBTableView1ID_PRH: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    DocOstDataSet: TpFIBDataSet;
    DocOstDataSetID_OST: TFIBIntegerField;
    DocOstDataSetID_MO: TFIBIntegerField;
    DocOstDataSetFIO: TFIBStringField;
    DocOstDataSetSFIO: TFIBStringField;
    DocOstDataSetNAME_DEPARTMENT: TFIBStringField;
    DocOstDataSetNAME: TFIBStringField;
    DocOstDataSetID_NOMN: TFIBIntegerField;
    DocOstDataSetID_UNIT: TFIBIntegerField;
    DocOstDataSetUNIT: TFIBStringField;
    DocOstDataSetKOL_MAT: TFIBBCDField;
    DocOstDataSetPRICE: TFIBBCDField;
    DocOstDataSetSUMMA: TFIBBCDField;
    DocOstDataSetID_PRH: TFIBIntegerField;
    DocOstDataSource: TDataSource;
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
    Panel1: TPanel;
    LabelMol: TLabel;
    cxMatOtv: TcxButtonEdit;
    PrintButton: TcxButton;
    ExitButton: TcxButton;
    ApplyButton: TcxButton;
    DocOstDataSetNOMN: TFIBStringField;
    DocOstDataSetLINKTO: TFIBBCDField;
    DocOstDataSetID_SCH: TFIBBCDField;
    DocOstDataSetKOL_DOC: TFIBBCDField;
    DocOstDataSetSUM_DOC: TFIBBCDField;
    OstDatabase: TpFIBDatabase;
    WorkTransaction: TpFIBTransaction;
    DocOstDataSetSCH_NUMBER: TFIBStringField;
    DocOstDataSetSCH_TITLE: TFIBStringField;
    cxGrid1DBTableView1SCH_NUMBER: TcxGridDBColumn;
    LabelSch: TLabel;
    WriteTransaction: TpFIBTransaction;
    DocOstDataSetGROUP_NAME: TFIBStringField;
    FilterButton: TcxButton;
    DocOstDataSetBAL_ID_SCH: TFIBIntegerField;
    DocOstDataSetBAL_SCH_NUMBER: TFIBStringField;
    DocOstDataSetBAL_SCH_TITLE: TFIBStringField;
    DocOstDataSetDOC_ID_TIPD: TFIBIntegerField;
    DocOstDataSetDOC_TIPD: TFIBStringField;
    DocOstDataSetDOC_NAME_TIPD: TFIBStringField;
    DocOstDataSetDOC_NUM_DOC: TFIBStringField;
    DocOstDataSetDOC_DATE_DOC: TFIBDateField;
    DocOstDataSetDOC_OSN_ID_TIPD: TFIBIntegerField;
    DocOstDataSetDOC_OTIPD: TFIBStringField;
    DocOstDataSetDOC_NAME_OSN: TFIBStringField;
    DocOstDataSetDOC_OSN_NUM_DOC: TFIBStringField;
    DocOstDataSetDOC_OSN_DATE_DOC: TFIBDateField;
    DocOstDataSetDOC_ID_MO_IN: TFIBIntegerField;
    DocOstDataSetDOC_FIO_MO_IN: TFIBStringField;
    DocOstDataSetDOC_FIO_IN: TFIBStringField;
    DocOstDataSetDOC_NAME_DEP_IN: TFIBStringField;
    DocOstDataSetDOC_ID_MO_OUT: TFIBIntegerField;
    DocOstDataSetDOC_FIO_MO_OUT: TFIBStringField;
    DocOstDataSetDOC_FIO_OUT: TFIBStringField;
    DocOstDataSetDOC_NAME_DEP_OUT: TFIBStringField;
    DocOstDataSetDOC_ID_CUST: TFIBIntegerField;
    DocOstDataSetDOC_NAME_CUSTOMER: TFIBStringField;
    DocOstDataSetDOC_SUMMA: TFIBBCDField;
    DocOstDataSetDOC_DATE_REC: TFIBDateField;
    DocOstDataSetNAME_IN: TFIBStringField;
    DocOstDataSetNAME_OUT: TFIBStringField;
    DocOstDataSetDOC_PERIOD: TStringField;
    IstfinDataSet: TpFIBDataSet;
    IstfinDataSetISTFIN_ID_SM: TFIBBCDField;
    IstfinDataSetISTFIN_SM_TITLE: TFIBStringField;
    IstfinDataSetISTFIN_SM_KOD: TFIBIntegerField;
    IstfinDataSetISTFIN_ID_RZ: TFIBBCDField;
    IstfinDataSetISTFIN_RZ_TITLE: TFIBStringField;
    IstfinDataSetISTFIN_RZ_KOD: TFIBIntegerField;
    IstfinDataSetISTFIN_ID_ST: TFIBBCDField;
    IstfinDataSetISTFIN_ST_TITLE: TFIBStringField;
    IstfinDataSetISTFIN_ST_KOD: TFIBIntegerField;
    IstfinDataSetISTFIN_ID_KEKV: TFIBBCDField;
    IstfinDataSetISTFIN_KEKV_TITLE: TFIBStringField;
    IstfinDataSetISTFIN_KEKV_KOD: TFIBIntegerField;
    IstfinDataSetISTFIN_STR: TFIBStringField;
    IstfinDataSetISTFIN_PERCENT: TFIBBCDField;
    IstfinDataSource: TDataSource;
    PanelInfo: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2DBTableView1ISTFIN_ID_SM: TcxGridDBColumn;
    cxGrid2DBTableView1ISTFIN_SM_TITLE: TcxGridDBColumn;
    cxGrid2DBTableView1ISTFIN_SM_KOD: TcxGridDBColumn;
    cxGrid2DBTableView1ISTFIN_ID_RZ: TcxGridDBColumn;
    cxGrid2DBTableView1ISTFIN_RZ_TITLE: TcxGridDBColumn;
    cxGrid2DBTableView1ISTFIN_RZ_KOD: TcxGridDBColumn;
    cxGrid2DBTableView1ISTFIN_ID_ST: TcxGridDBColumn;
    cxGrid2DBTableView1ISTFIN_ST_TITLE: TcxGridDBColumn;
    cxGrid2DBTableView1ISTFIN_ST_KOD: TcxGridDBColumn;
    cxGrid2DBTableView1ISTFIN_ID_KEKV: TcxGridDBColumn;
    cxGrid2DBTableView1ISTFIN_KEKV_TITLE: TcxGridDBColumn;
    cxGrid2DBTableView1ISTFIN_KEKV_KOD: TcxGridDBColumn;
    cxGrid2DBTableView1ISTFIN_STR: TcxGridDBColumn;
    cxGrid2DBTableView1ISTFIN_PERCENT: TcxGridDBColumn;
    cxGrid2Level1: TcxGridLevel;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBTextEdit6: TcxDBTextEdit;
    cxSplitterInfo: TcxSplitter;
    cxDBButtonEdit1: TcxDBButtonEdit;
    cxLookupSch: TcxButtonEdit;
    OstFormStorage: TFormStorage;
    DocOstDataSetDATE_OPR: TFIBDateField;
    DocOstDataSetDATE_EXPL: TFIBDateField;
    MainActionList: TActionList;
    acShow: TAction;
    acFilter: TAction;
    acPrint: TAction;
    acExit: TAction;
    acFields: TAction;
    acExport: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    acExport1: TMenuItem;
    N4: TMenuItem;
    NInvKart: TMenuItem;
    DocOstDataSetKOD_SYSTEM: TFIBIntegerField;
    frReport: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    frxRTFExport1: TfrxRTFExport;
    frxXMLExport1: TfrxXMLExport;
    frxPDFExport1: TfrxPDFExport;
    frxHTMLExport1: TfrxHTMLExport;
    ImageList1: TImageList;
    ForBSO: TpFIBDataSet;
    DocOstDataSetIS_ACC_PRICE: TFIBIntegerField;
    DocOstDataSetPRIZNAK: TFIBIntegerField;
    cxgrdbclmnGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    frxDesigner1: TfrxDesigner;
    pnl1: TPanel;
    cxToDoc: TcxButton;
    cxImage1: TcxImage;
    ds_compare: TpFIBDataSet;
    StPr_Compare: TpFIBStoredProc;
    Tr_Compare: TpFIBTransaction;
    WorkQuery: TpFIBQuery;
    pm1: TPopupMenu;
    N3: TMenuItem;
    procedure CancelButtonClick(Sender: TObject);
    procedure cxMatOtvPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxMatOtvKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DocOstDataSetCalcFields(DataSet: TDataSet);
    procedure cxDBButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxLookupSchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxLookupSchPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure acShowExecute(Sender: TObject);
    procedure acFilterExecute(Sender: TObject);
    procedure acPrintExecute(Sender: TObject);
    procedure acExitExecute(Sender: TObject);
    procedure acFieldsExecute(Sender: TObject);
    procedure acExportExecute(Sender: TObject);
    procedure NInvKartClick(Sender: TObject);
    procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure CompareOst;
    procedure cxToDocClick(Sender: TObject);
    procedure pnl1Resize(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
   DBHANDLE : TISC_DB_HANDLE;
   ID_USER : Int64;
  public
   ID_MO: integer;
   ID_SCH: integer;
   TIP_SCH: integer;
   F_ID_NOMN, F_LINKTO, F_ID_SCH: integer;
   F_NAME_TMC, F_GROUP_TMC: string;
   F_SORT: string;
   F_SCH: boolean;
   name_nomn, name_nomn_1:string;
   FILTER_ID_SESSION: integer;
   constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_USER: int64);overload;
  end;

  procedure ShowOstCur(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
  exports ShowOstCur;

var
  OstCurForm: TOstCurForm;

implementation

uses uPrnOstatki, uViewOstFilter, uViewOstInvKart, uViewOstMnaKart, uViewBSOKart;

{$R *.dfm}

procedure ShowOstCur(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
begin
 TOstCurForm.Create(AOwner, DBHANDLE, aID_USER);
end;

constructor TOstCurForm.Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_USER : Int64);
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
   Self.DBHANDLE := DBHandle;
   Self.ID_USER:=ID_USER;
   Self.OstDatabase.Handle:=DBHANDLE;
   Self.F_SCH:=false;
   self.LabelMol.Caption:=MAT_STR_COL_MOL;
   self.LabelSch.Caption:=MAT_STR_COL_SCH;
   self.acShow.Caption:=MAT_BUTTON_SHOW_CONST;
   self.acPrint.Caption:=MAT_ACTION_PRINT_CONST;
   self.acExit.Caption:=MAT_ACTION_CLOSE_CONST;
   self.acFilter.Caption:=MAT_ACTION_FILTER_CONST;
   self.cxGrid1DBTableView1NAME.Caption:=MAT_STR_COL_NAME;
   self.cxGrid1DBTableView1SCH_NUMBER.Caption:=MAT_STR_COL_SCH;
   self.cxGrid1DBTableView1UNIT.Caption:=MAT_STR_COL_NAME_UNIT;
   self.cxGrid1DBTableView1KOL_MAT.Caption:=MAT_STR_COL_KOL_MAT;
   self.cxGrid1DBTableView1PRICE.Caption:=MAT_STR_COL_PRICE;
   self.cxGrid1DBTableView1SUMMA.Caption:=MAT_STR_COL_SUMMA;
   self.F_SORT:='ORDER BY FIO, SCH_NUMBER, NAME';
   self.WorkTransaction.StartTransaction;
   self.cxGrid2DBTableView1ISTFIN_STR.Caption:=MAT_STR_COL_ISTFIN;
   self.cxGrid2DBTableView1ISTFIN_PERCENT.Caption:=MAT_STR_COL_PERCENT;
   Self.acExport.Caption:=MAT_ACTION_EXPORT_CONST;
   self.NInvKart.Caption:=MAT_STR_COL_INV_NUMS;
 end;
end;

procedure TOstCurForm.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TOstCurForm.CompareOst;
begin
 pnl1.visible:=False;
 if _COMPARE_OST_OBOROT =1 then
 begin
    if ID_MO<>0 then
    begin
      ds_compare.close;
      ds_compare.selectSql.Clear;
      ds_compare.SelectSQL.Add('select distinct a.id_doc from mat_dt_doc a inner join mat_dt_doc_pos b on a.id_doc=b.id_doc where a.pub_id_doc is null and ((a.id_mo_in=:id_mo) or (a.id_mo_out=:id_mo)) ');
       if F_SCH then
       begin
       ds_compare.SelectSQL.Add('and ((b.ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+'))');
       ds_compare.SelectSQL.Add('OR (b.ID_SCH IN (select id_sch from pub_sp_main_sch s where s.link_to in(SELECT  ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+'))))');
       end;
       if F_ID_NOMN>0 then
       begin
       ds_compare.SelectSQL.Add(' and b.ID_NOMN=:NOMN');
       end;
      ds_compare.Prepare;
       ds_compare.ParamByName('ID_MO').Value:=ID_MO;
      if F_ID_NOMN>0 then
       ds_compare.ParamByName('NOMN').Value:=F_ID_NOMN;
       ds_compare.CloseOpen(False);

       ds_compare.fetchall;
       ds_compare.first;
       if ds_compare.RecordCount>0 then pnl1.Visible:=True;
    end;
  end;

end;

procedure TOstCurForm.cxMatOtvPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res : Variant;
  FioMO, SpodrMO: string;
begin
  Res:=uSpMatOtv.GetMatOtv(self, DBHandle, 0, ID_MO);
  if  VarType(Res) <> varEmpty
   then begin
    ID_MO:=Res[0];
    FioMO := Res[1];
    SpodrMO := Res[2];
    cxMatOtv.Text:=FioMO+' / '+SpodrMO;
    acShowExecute(self);
  end;
end;

procedure TOstCurForm.FormCreate(Sender: TObject);
begin
 Caption:=MAT_SYS_PREFIX+MAT_STR_MAIN_MENU_ACC_OSTC;
 OstFormStorage.RestoreFormPlacement;
 try
  Width:=OstFormStorage.StoredValue['FormWidth'];
  Height:=OstFormStorage.StoredValue['FormHeight'];
 except
  Width:=750;
  Height:=500;
 end;
 if Width<200 then Width:=750;
 if Height<100 then Height:=500;
 ID_MO:=0;
 F_ID_NOMN:=0;
 F_LINKTO:=0;
end;

procedure TOstCurForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 OstFormStorage.StoredValue['FormWidth']:=Width;
 OstFormStorage.StoredValue['FormHeight']:=Height;
 OstFormStorage.SaveFormPlacement;
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TOstCurForm.cxMatOtvKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  cxMatOtv.Text:='';
  ID_MO:=0;
  DocOstDataSet.Close;
 end;
end;

procedure TOstCurForm.DocOstDataSetCalcFields(DataSet: TDataSet);
begin
 if DocOstDataSetDOC_ID_MO_IN.Value<>0 then
 begin
  DocOstDataSetNAME_IN.Value:=DocOstDataSetDOC_FIO_MO_IN.Value;
  if DocOstDataSetDOC_ID_CUST.Value<>0 then
   DocOstDataSetNAME_OUT.Value:=DocOstDataSetDOC_NAME_CUSTOMER.Value;
 end;
 if DocOstDataSetDOC_ID_MO_OUT.Value<>0 then
 begin
  DocOstDataSetNAME_OUT.Value:=DocOstDataSetDOC_FIO_MO_OUT.Value;
  if DocOstDataSetDOC_ID_CUST.Value<>0 then
   DocOstDataSetNAME_IN.Value:=DocOstDataSetDOC_NAME_CUSTOMER.Value;
 end;
 if DocOstDataSetDOC_DATE_REC.IsNull then
  DocOstDataSetDOC_PERIOD.Value:=''
 else
  DocOstDataSetDOC_PERIOD.Value:=IntToStr(MonthOf(DocOstDataSetDOC_DATE_REC.Value))+'/'+IntToStr(YearOf(DocOstDataSetDOC_DATE_REC.Value));
end;

procedure TOstCurForm.cxDBButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
 uPackageManager.ViewDoc(self, DBHANDLE, DocOstDataSet.FieldByName('ID_PRH').AsInteger);
end;

procedure TOstCurForm.cxLookupSchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  cxLookupSch.Text:='';
  F_SCH:=false;
  FILTER_ID_SESSION:=0;
  acShowExecute(self);
 end
end;

procedure TOstCurForm.cxLookupSchPropertiesButtonClick(Sender: TObject;
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
  FILTER_ID_SESSION:=OstDatabase.Gen_Id('MAT_ID_SESSION',1, WriteTransaction);

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
 acShowExecute(self);
end;

procedure TOstCurForm.acShowExecute(Sender: TObject);
var
 prefix: string;
 w: TForm;
begin
 w:=ShowWaitWindow(self);
 prefix:='WHERE';
 DocOstDataSet.Close;
 DocOstDataSet.SelectSQL.Clear;
 DocOstDataSet.SelectSQL.Add('SELECT * FROM MAT_SEL_MO_OST_CUR(:ID_MO, 0)') ;
 if F_LINKTO>0 then
 begin
  DocOstDataSet.SelectSQL.Add(prefix+' LINKTO=:LINKTO');
  prefix:='AND';
 end;
 if F_ID_NOMN>0 then
 begin
  DocOstDataSet.SelectSQL.Add(prefix+' ID_NOMN=:NOMN');
  prefix:='AND';
 end;
 if (F_ID_NOMN=0) and (F_NAME_TMC<>'') then
 begin
  DocOstDataSet.SelectSQL.Add(prefix+' NAME LIKE :NAME');
  prefix:='AND';
 end;
 if name_nomn<>'' then
 begin
  name_nomn:='%'+name_nomn+'%';
  name_nomn_1:='%'+name_nomn_1+'%';
  DocOstDataSet.SelectSQL.Add(prefix+' (( NAME LIKE :NAME_NOMN) OR (NAME LIKE :NAME_NOMN_1))');
  prefix:='AND';
 end;
 F_ID_SCH:=ID_SCH;
 if F_SCH then
 begin
  DocOstDataSet.SelectSQL.Add(prefix+'( ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
  DocOstDataSet.SelectSQL.Add('OR BAL_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+'))');
 end;
 DocOstDataSet.Prepare;
 DocOstDataSet.ParamByName('ID_MO').Value:=ID_MO;
 if F_ID_SCH>0 then
  DocOstDataSet.ParamByName('ID_SCH').Value:=F_ID_SCH;
 if F_LINKTO>0 then
  DocOstDataSet.ParamByName('LINKTO').Value:=F_LINKTO;
 if F_ID_NOMN>0 then
  DocOstDataSet.ParamByName('NOMN').Value:=F_ID_NOMN;
 if (F_ID_NOMN=0) and (F_NAME_TMC<>'') then
  DocOstDataSet.ParamByName('NAME').Value:=F_NAME_TMC+'%';
 if name_nomn<>'' then
 begin
  DocOstDataSet.ParamByName('NAME_NOMN').Value:=name_nomn;
  DocOstDataSet.ParamByName('NAME_NOMN_1').Value:=name_nomn_1;
 end;
 DocOstDataSet.SelectSQL.Add(F_SORT);
 DocOstDataSet.CloseOpen(false);
 IstfinDataSet.CloseOpen(false);
 cxGrid1DBTableView1.ViewData.Expand(true);
 CompareOst;
 CloseWaitWindow(w);
end;

procedure TOstCurForm.acFilterExecute(Sender: TObject);
var
 F: TOstFilterForm;
begin
 F:=TOstFilterForm.Create(self);
 F.DBHandle:=DBHANDLE;
 F.F_ID_NOMN:=F_ID_NOMN;
 F.F_LINKTO:=F_LINKTO;
 F.cxNOMN.Text:=F_NAME_TMC;
 F.cxLINKTO.Text:=F_GROUP_TMC;
 f.TextNomn.Text:='';
 if F.ShowModal=mrOk then
 begin
  F_ID_NOMN:=F.F_ID_NOMN;
  F_LINKTO:=F.F_LINKTO;
  F_NAME_TMC:=F.cxNOMN.Text;
  if F.cxCheckSubstr.Checked then
   F_NAME_TMC:='%'+F_NAME_TMC;
  F_GROUP_TMC:=F.cxLINKTO.Text;
  name_nomn:='';
  name_nomn:=AnsiUpperCase(F.TextNomn.Text);
  name_nomn_1:= F.TextNomn.Text;
  acShowExecute(self);
 end;
 F.Free;
end;

procedure TOstCurForm.acPrintExecute(Sender: TObject);
var
 fp: TfmOstPrint;
 id: integer;
begin
 if DocOstDataSet.IsEmpty then
  Exit;
 fp:=TfmOstPrint.Create(self);
 fp.ShowModal;
 if fp.PMode>=0 then begin

 if fp.PMode=0 then begin
   frReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\OstCur.fr3');
  end;
  if fp.PMode=1 then begin
   frReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\OstCurSchMol.fr3');
   F_SORT:='ORDER BY SCH_NUMBER, FIO, NAME';
   acShowExecute(self);
  end;

  if fp.PMode=2 then begin
   frReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\OstCurMolSch.fr3');
   F_SORT:='ORDER BY FIO, SCH_NUMBER, NAME';
   acShowExecute(self);
  end;

  if fp.PMode=3 then begin
   frReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\OstCurMolSchG.fr3');
   F_SORT:='ORDER BY FIO, SCH_NUMBER, GROUP_NAME, NAME';
   acShowExecute(self);
  end;

  if fp.PMode=4 then begin
   frReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\OstCurBschMol.fr3');
   F_SORT:='ORDER BY BAL_SCH_NUMBER, SCH_NUMBER, FIO, NAME';
   acShowExecute(self);
  end;

  if fp.PMode=5 then begin
   frReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\OstCurMolBsch.fr3');
   F_SORT:='ORDER BY FIO, BAL_SCH_NUMBER, SCH_NUMBER, NAME';
   acShowExecute(self);
  end;

 frReport.Variables['ORG_NAME']:=''''+_ORG_FULL_NAME+'''';
 frReport.Variables['ORG_SHORT_NAME']:=''''+_ORG_SHORT_NAME+'''';
 frReport.Variables['ORG_KOD_OKPO']:=''''+_ORG_KOD_OKPO+'''';

//  cxGrid1DBTableView1.BeginUpdate;
  id:=DocOstDataSet.FieldByName('ID_OST').Value;
  DocOstDataSource.Enabled:=false;

    frReport.PrepareReport;
  if fp.cxCopies.Value>1 then
    frReport.PrintOptions.Copies:=fp.cxCopies.Value;
frReport.PrintOptions.ShowDialog:=fp.cxSelectPrinter.Checked;
 if fp.cxCheckOnPrinter.Checked then
  frReport.Print
 else
 if fp.cxCheckEdit.Checked then
   frReport.DesignReport
 else
  frReport.ShowReport;

  F_SORT:='ORDER BY FIO, SCH_NUMBER, NAME';
  acShowExecute(self);
  DocOstDataSource.Enabled:=true;
  DocOstDataSet.Locate('ID_OST', id, []);
 end;
 fp.Free;
end;

procedure TOstCurForm.acExitExecute(Sender: TObject);
begin
 Close;
end;

procedure TOstCurForm.acFieldsExecute(Sender: TObject);
begin
 ShowDataSetFields(self, DocOstDataSet);
end;

procedure TOstCurForm.acExportExecute(Sender: TObject);
begin
 ExportDataSet(self, DocOstDataSet);
end;

procedure TOstCurForm.NInvKartClick(Sender: TObject);
var
 T: TOstInvKartForm;
 M: TOstMnaKartForm;
 B: TBsoForm;
 is_bso, id_sch_bso:Integer;
begin
 if DocOstDataSet.FieldByName('KOD_SYSTEM').AsInteger=_KOD_SYSTEM_OS then
 begin
  T:=TOstInvKartForm.Create(self);
  T.KartDataSet.Database:=OstDatabase;
  T.KartDataSet.ParamByName('ID_POS').Value:=0;
  T.KartDataSet.ParamByName('ID_OST').Value:=DocOstDataSet.FieldByName('ID_OST').AsInteger;
  T.KartDataSet.CloseOpen(false);
  T.ShowModal;
  T.Free;
 end;
 if (DocOstDataSet.FieldByName('KOD_SYSTEM').AsInteger=_KOD_SYSTEM_MNA) or
  (DocOstDataSet.FieldByName('KOD_SYSTEM').AsInteger=_KOD_SYSTEM_MBP) then
 begin
  M:=TOstMnaKartForm.Create(self);
  M.KartDataSet.Database:=OstDatabase;
  M.KartDataSet.ParamByName('ID_POS').Value:=0;
  M.KartDataSet.ParamByName('ID_OST').Value:=DocOstDataSet.FieldByName('ID_OST').AsInteger;
  M.KartDataSet.CloseOpen(false);
  M.ShowModal;
  M.Free;
 end;
 // opredelit svoystvo scheta na BSO
  is_bso:=0;
  ForBSO.Close;
  ForBSO.SelectSQL.Clear;
  ForBSO.SelectSQL.Add(' SELECT C.ID_SCH FROM PUB_SP_MAIN_SCH C INNER JOIN PUB_DT_OBJ_PROP PR ON C.ID_SCH = PR.ID_OBJ ');
  ForBSO.SelectSQL.Add(' INNER JOIN PUB_SP_PROPERTIES P ON PR.ID_PROP = P.ID_PROP WHERE P.PROP_N_PP = 2030 AND C.ID_SCH=:ID_SCH AND');
  ForBSO.SelectSQL.Add(' :DATE_BEG BETWEEN C.DATE_BEG AND C.DATE_END ');
  ForBSO.Prepare;
  ForBSO.ParamByName('DATE_BEG').AsDate:=_MATAS_PERIOD;
  ForBSO.ParamByName('ID_SCH').AsInteger:=DocOstDataSetID_SCH.AsInteger;
  ForBSO.CloseOpen(False);
 if ForBSO.FieldValues['ID_SCH']<> null then is_bso:=1
 else is_bso:=0;
  ForBSO.Close;
  //
 if is_bso = 1 then
 begin
  B:=TBsoForm.Create(Self);
  ForBSO.Close;
  ForBSO.SelectSQL.Clear;
  ForBSO.SelectSQL.Add(' SELECT * FROM MAT_DT_BSO_KART WHERE ID_OST=:ID_OST AND DATE_OUT IS NULL');
  ForBSO.Prepare;
  ForBSO.ParamByName('ID_OST').AsInteger:=DocOstDataSetID_OST.AsInteger;
  ForBSO.CloseOpen(False);
  ForBSO.FetchAll;
  ForBSO.First;
  B.ds1.DataSet:=ForBSO;
  B.ShowModal;
  B.Free;
 end;
end;

procedure TOstCurForm.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var ARect: TRect;
begin
 Arect:=AViewInfo.Bounds;
  if (AViewInfo.GridRecord.Values[14] = 1 )  then
  begin
      ACanvas.Canvas.Font.Color := $00E80074;
      ACanvas.Canvas.FillRect(Arect);
  end;

end;

procedure TOstCurForm.cxToDocClick(Sender: TObject);
var id_key :Integer;
begin
if not ds_compare.IsEmpty then
begin

  if FILTER_ID_SESSION=0 then
  FILTER_ID_SESSION:=OstDatabase.Gen_Id('MAT_ID_SESSION',1, WriteTransaction);

  WorkQuery.Close;
  WorkQuery.SQL.Clear;
  WorkQuery.SQL.Add('DELETE FROM MAT_TMP_FILTER WHERE ID_OBJECT=30 and ID_SESSION='+IntToStr(FILTER_ID_SESSION));
  try
   WorkQuery.Transaction := WriteTransaction;
   WorkQuery.Transaction.StartTransaction;
   WorkQuery.ExecQuery;
   WorkQuery.Transaction.Commit;
  except on E : Exception
   do begin
     ShowMessage(E.Message);
     WorkQuery.Transaction.Rollback;
     exit;
   end;
 end;
 
  ds_compare.FetchAll;
  ds_compare.First;
  while not ds_compare.Eof do
  begin
    id_key:=ds_compare.FieldByname('ID_DOC').AsInteger;

   try
      StPr_Compare.Close;
      StPr_Compare.Transaction:=Tr_Compare;
      StPr_Compare.Transaction.StartTransaction;
      StPr_Compare.StoredProcName:='MAT_FILTER_CHECK';
      StPr_Compare.Prepare;
      StPr_Compare.ParamByName('ID_SESSION').AsInt64:=FILTER_ID_SESSION;
      StPr_Compare.ParamByName('ID_KEY').AsInt64:=id_key;
      StPr_Compare.ParamByName('ID_OBJECT').AsInt64:=30;
      StPr_Compare.ExecProc;
      StPr_Compare.Transaction.Commit;
    except on E : Exception
      do begin
        ShowMessage(E.Message);
        StPr_Compare.Transaction.Rollback;
        Exit;
      end;
    end;
    ds_compare.Next;
  end;

   uPackageManager.LDocWork_Compare(self, DBHANDLE, 0, _MATAS_PERIOD, FILTER_ID_SESSION);
end; 
end;

procedure TOstCurForm.pnl1Resize(Sender: TObject);
begin
  cxToDoc.Left:=pnl1.Width- 125;
end;

procedure TOstCurForm.N3Click(Sender: TObject);
begin
pnl1.Visible:=False;
end;

end.
