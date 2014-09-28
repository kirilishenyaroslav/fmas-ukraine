{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uSpOperProvEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxContainer, cxTextEdit, ExtCtrls, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, FIBDatabase, pFIBDatabase, FIBDataSet,
  uMatasUtils, pFIBDataSet, FIBQuery, pFIBQuery, pFIBStoredProc,
  cxCheckBox, cxButtonEdit, cxMaskEdit, cxDropDownEdit, uResources, GlobalSPR;

type
  TSpOperProvForm = class(TForm)
    PanelTop: TPanel;
    LabelName: TLabel;
    cxNameEdit: TcxTextEdit;
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
    WorkStoredProc: TpFIBStoredProc;
    ProvTransaction: TpFIBTransaction;
    ProvDB: TpFIBDatabase;
    ProvDataSet: TpFIBDataSet;
    ProvDataSource: TDataSource;
    ProvDataSetID_PROV: TFIBIntegerField;
    ProvDataSetID_OPER: TFIBIntegerField;
    ProvDataSetDB_ID_SCH: TFIBIntegerField;
    ProvDataSetDB_SCH_TITLE: TFIBStringField;
    ProvDataSetDB_SCH_NUMBER: TFIBStringField;
    ProvDataSetKR_ID_SCH: TFIBIntegerField;
    ProvDataSetKR_SCH_TITLE: TFIBStringField;
    ProvDataSetKR_SCH_NUMBER: TFIBStringField;
    ProvDataSetFORMULA: TFIBStringField;
    PanelButton: TPanel;
    CancelButton: TcxButton;
    OkButton: TcxButton;
    cxDelButton: TcxButton;
    cxAddButton: TcxButton;
    cxEditButton: TcxButton;
    ProvDataSetDB_SCH_TYPE: TFIBIntegerField;
    ProvDataSetDB_TYPE_OBJECT: TFIBIntegerField;
    ProvDataSetDB_SCH_OBJ_TYPE_TITLE: TFIBStringField;
    ProvDataSetDB_SCH_TYPE_TITLE: TFIBStringField;
    ProvDataSetDB_ID_SYSTEM: TFIBIntegerField;
    ProvDataSetDB_ID_SM: TFIBBCDField;
    ProvDataSetDB_NAME_SM: TFIBStringField;
    ProvDataSetDB_KOD_SM: TFIBIntegerField;
    ProvDataSetDB_ID_RZ: TFIBBCDField;
    ProvDataSetDB_NAME_RZ: TFIBStringField;
    ProvDataSetDB_KOD_RZ: TFIBIntegerField;
    ProvDataSetDB_ID_ST: TFIBBCDField;
    ProvDataSetDB_NAME_ST: TFIBStringField;
    ProvDataSetDB_KOD_ST: TFIBIntegerField;
    ProvDataSetDB_ID_KEKV: TFIBBCDField;
    ProvDataSetDB_NAME_KEKV: TFIBStringField;
    ProvDataSetDB_KOD_KEKV: TFIBIntegerField;
    ProvDataSetDB_ID_MARK: TFIBBCDField;
    ProvDataSetDB_NAME_MARK: TFIBStringField;
    ProvDataSetDB_SHORT_MARK: TFIBStringField;
    ProvDataSetKR_SCH_TYPE: TFIBIntegerField;
    ProvDataSetKR_TYPE_OBJECT: TFIBIntegerField;
    ProvDataSetKR_SCH_OBJ_TYPE_TITLE: TFIBStringField;
    ProvDataSetKR_SCH_TYPE_TITLE: TFIBStringField;
    ProvDataSetKR_ID_SYSTEM: TFIBIntegerField;
    ProvDataSetKR_ID_SM: TFIBBCDField;
    ProvDataSetKR_NAME_SM: TFIBStringField;
    ProvDataSetKR_KOD_SM: TFIBIntegerField;
    ProvDataSetKR_ID_RZ: TFIBBCDField;
    ProvDataSetKR_NAME_RZ: TFIBStringField;
    ProvDataSetKR_KOD_RZ: TFIBIntegerField;
    ProvDataSetKR_ID_ST: TFIBBCDField;
    ProvDataSetKR_NAME_ST: TFIBStringField;
    ProvDataSetKR_KOD_ST: TFIBIntegerField;
    ProvDataSetKR_ID_KEKV: TFIBBCDField;
    ProvDataSetKR_NAME_KEKV: TFIBStringField;
    ProvDataSetKR_KOD_KEKV: TFIBIntegerField;
    ProvDataSetKR_ID_MARK: TFIBBCDField;
    ProvDataSetKR_NAME_MARK: TFIBStringField;
    ProvDataSetKR_SHORT_MARK: TFIBStringField;
    ProvDataSetIS_EX_PROV: TFIBIntegerField;
    ProvDataSetSUM_DB_PROV: TFIBIntegerField;
    ProvDataSetSUM_KR_PROV: TFIBIntegerField;
    ProvDataSetDB_SCH: TFIBStringField;
    ProvDataSetKR_SCH: TFIBStringField;
    ProvDataSetFDB_SCH: TFIBSmallIntField;
    ProvDataSetFKR_SCH: TFIBSmallIntField;
    ProvDataSetFKOL_MAT: TFIBSmallIntField;
    ProvDataSetFSUMMA: TFIBSmallIntField;
    ProvDataSetIS_GROUP: TFIBSmallIntField;
    ProvDataSetNPROV: TFIBIntegerField;
    ProvDataSetSUM_BY_DB_SCH: TFIBSmallIntField;
    ProvDataSetSUM_BY_DB_SM: TFIBSmallIntField;
    ProvDataSetSUM_BY_DB_RZ: TFIBSmallIntField;
    ProvDataSetSUM_BY_DB_ST: TFIBSmallIntField;
    ProvDataSetSUM_BY_DB_KEKV: TFIBSmallIntField;
    ProvDataSetSUM_BY_KR_SCH: TFIBSmallIntField;
    ProvDataSetSUM_BY_KR_SM: TFIBSmallIntField;
    ProvDataSetSUM_BY_KR_RZ: TFIBSmallIntField;
    ProvDataSetSUM_BY_KR_ST: TFIBSmallIntField;
    ProvDataSetSUM_BY_KR_KEKV: TFIBSmallIntField;
    ProvDataSetSUM_ID_DB_SCH: TFIBBCDField;
    ProvDataSetSUM_DB_SCH_NUMBER: TFIBStringField;
    ProvDataSetSUM_ID_DB_SM: TFIBBCDField;
    ProvDataSetSUM_DB_NAME_SM: TFIBStringField;
    ProvDataSetSUM_DB_KOD_SM: TFIBIntegerField;
    ProvDataSetSUM_ID_DB_RZ: TFIBBCDField;
    ProvDataSetSUM_DB_NAME_RZ: TFIBStringField;
    ProvDataSetSUM_DB_KOD_RZ: TFIBIntegerField;
    ProvDataSetSUM_ID_DB_ST: TFIBBCDField;
    ProvDataSetSUM_DB_NAME_ST: TFIBStringField;
    ProvDataSetSUM_DB_KOD_ST: TFIBIntegerField;
    ProvDataSetSUM_ID_DB_KEKV: TFIBBCDField;
    ProvDataSetSUM_DB_NAME_KEKV: TFIBStringField;
    ProvDataSetSUM_DB_KOD_KEKV: TFIBIntegerField;
    ProvDataSetSUM_ID_KR_SCH: TFIBBCDField;
    ProvDataSetSUM_KR_SCH_NUMBER: TFIBStringField;
    ProvDataSetSUM_ID_KR_SM: TFIBBCDField;
    ProvDataSetSUM_KR_NAME_SM: TFIBStringField;
    ProvDataSetSUM_KR_KOD_SM: TFIBIntegerField;
    ProvDataSetSUM_ID_KR_RZ: TFIBBCDField;
    ProvDataSetSUM_KR_NAME_RZ: TFIBStringField;
    ProvDataSetSUM_KR_KOD_RZ: TFIBIntegerField;
    ProvDataSetSUM_ID_KR_ST: TFIBBCDField;
    ProvDataSetSUM_KR_NAME_ST: TFIBStringField;
    ProvDataSetSUM_KR_KOD_ST: TFIBIntegerField;
    ProvDataSetSUM_ID_KR_KEKV: TFIBBCDField;
    ProvDataSetSUM_KR_NAME_KEKV: TFIBStringField;
    ProvDataSetSUM_KR_KOD_KEKV: TFIBIntegerField;
    ProvDataSetIS_OUT_POS: TFIBSmallIntField;
    Panel1: TPanel;
    cxProvGrid: TcxGrid;
    cxProvGridDBTableView1: TcxGridDBTableView;
    cxProvGridLevel1: TcxGridLevel;
    cxProvGridDBTableView1ID_PROV: TcxGridDBColumn;
    cxProvGridDBTableView1ID_OPER: TcxGridDBColumn;
    cxProvGridDBTableView1DB_ID_SCH: TcxGridDBColumn;
    cxProvGridDBTableView1DB_SCH_TITLE: TcxGridDBColumn;
    cxProvGridDBTableView1DB_SCH_NUMBER: TcxGridDBColumn;
    cxProvGridDBTableView1KR_ID_SCH: TcxGridDBColumn;
    cxProvGridDBTableView1KR_SCH_TITLE: TcxGridDBColumn;
    cxProvGridDBTableView1KR_SCH_NUMBER: TcxGridDBColumn;
    cxProvGridDBTableView1FORMULA: TcxGridDBColumn;
    cxProvGridDBTableView1DB_SCH_TYPE: TcxGridDBColumn;
    cxProvGridDBTableView1DB_TYPE_OBJECT: TcxGridDBColumn;
    cxProvGridDBTableView1DB_SCH_OBJ_TYPE_TITLE: TcxGridDBColumn;
    cxProvGridDBTableView1DB_SCH_TYPE_TITLE: TcxGridDBColumn;
    cxProvGridDBTableView1DB_ID_SYSTEM: TcxGridDBColumn;
    cxProvGridDBTableView1DB_ID_SM: TcxGridDBColumn;
    cxProvGridDBTableView1DB_NAME_SM: TcxGridDBColumn;
    cxProvGridDBTableView1DB_KOD_SM: TcxGridDBColumn;
    cxProvGridDBTableView1DB_ID_RZ: TcxGridDBColumn;
    cxProvGridDBTableView1DB_NAME_RZ: TcxGridDBColumn;
    cxProvGridDBTableView1DB_KOD_RZ: TcxGridDBColumn;
    cxProvGridDBTableView1DB_ID_ST: TcxGridDBColumn;
    cxProvGridDBTableView1DB_NAME_ST: TcxGridDBColumn;
    cxProvGridDBTableView1DB_KOD_ST: TcxGridDBColumn;
    cxProvGridDBTableView1DB_ID_KEKV: TcxGridDBColumn;
    cxProvGridDBTableView1DB_NAME_KEKV: TcxGridDBColumn;
    cxProvGridDBTableView1DB_KOD_KEKV: TcxGridDBColumn;
    cxProvGridDBTableView1DB_ID_MARK: TcxGridDBColumn;
    cxProvGridDBTableView1DB_NAME_MARK: TcxGridDBColumn;
    cxProvGridDBTableView1DB_SHORT_MARK: TcxGridDBColumn;
    cxProvGridDBTableView1KR_SCH_TYPE: TcxGridDBColumn;
    cxProvGridDBTableView1KR_TYPE_OBJECT: TcxGridDBColumn;
    cxProvGridDBTableView1KR_SCH_OBJ_TYPE_TITLE: TcxGridDBColumn;
    cxProvGridDBTableView1KR_SCH_TYPE_TITLE: TcxGridDBColumn;
    cxProvGridDBTableView1KR_ID_SYSTEM: TcxGridDBColumn;
    cxProvGridDBTableView1KR_ID_SM: TcxGridDBColumn;
    cxProvGridDBTableView1KR_NAME_SM: TcxGridDBColumn;
    cxProvGridDBTableView1KR_KOD_SM: TcxGridDBColumn;
    cxProvGridDBTableView1KR_ID_RZ: TcxGridDBColumn;
    cxProvGridDBTableView1KR_NAME_RZ: TcxGridDBColumn;
    cxProvGridDBTableView1KR_KOD_RZ: TcxGridDBColumn;
    cxProvGridDBTableView1KR_ID_ST: TcxGridDBColumn;
    cxProvGridDBTableView1KR_NAME_ST: TcxGridDBColumn;
    cxProvGridDBTableView1KR_KOD_ST: TcxGridDBColumn;
    cxProvGridDBTableView1KR_ID_KEKV: TcxGridDBColumn;
    cxProvGridDBTableView1KR_NAME_KEKV: TcxGridDBColumn;
    cxProvGridDBTableView1KR_KOD_KEKV: TcxGridDBColumn;
    cxProvGridDBTableView1KR_ID_MARK: TcxGridDBColumn;
    cxProvGridDBTableView1KR_NAME_MARK: TcxGridDBColumn;
    cxProvGridDBTableView1KR_SHORT_MARK: TcxGridDBColumn;
    cxProvGridDBTableView1IS_EX_PROV: TcxGridDBColumn;
    cxProvGridDBTableView1SUM_DB_PROV: TcxGridDBColumn;
    cxProvGridDBTableView1SUM_KR_PROV: TcxGridDBColumn;
    cxProvGridDBTableView1DB_SCH: TcxGridDBColumn;
    cxProvGridDBTableView1KR_SCH: TcxGridDBColumn;
    cxProvGridDBTableView1FDB_SCH: TcxGridDBColumn;
    cxProvGridDBTableView1FKR_SCH: TcxGridDBColumn;
    cxProvGridDBTableView1FKOL_MAT: TcxGridDBColumn;
    cxProvGridDBTableView1FSUMMA: TcxGridDBColumn;
    cxProvGridDBTableView1IS_GROUP: TcxGridDBColumn;
    cxProvGridDBTableView1NPROV: TcxGridDBColumn;
    cxProvGridDBTableView1SUM_BY_DB_SCH: TcxGridDBColumn;
    cxProvGridDBTableView1SUM_BY_DB_SM: TcxGridDBColumn;
    cxProvGridDBTableView1SUM_BY_DB_RZ: TcxGridDBColumn;
    cxProvGridDBTableView1SUM_BY_DB_ST: TcxGridDBColumn;
    cxProvGridDBTableView1SUM_BY_DB_KEKV: TcxGridDBColumn;
    cxProvGridDBTableView1SUM_BY_KR_SCH: TcxGridDBColumn;
    cxProvGridDBTableView1SUM_BY_KR_SM: TcxGridDBColumn;
    cxProvGridDBTableView1SUM_BY_KR_RZ: TcxGridDBColumn;
    cxProvGridDBTableView1SUM_BY_KR_ST: TcxGridDBColumn;
    cxProvGridDBTableView1SUM_BY_KR_KEKV: TcxGridDBColumn;
    cxProvGridDBTableView1SUM_ID_DB_SCH: TcxGridDBColumn;
    cxProvGridDBTableView1SUM_DB_SCH_NUMBER: TcxGridDBColumn;
    cxProvGridDBTableView1SUM_ID_DB_SM: TcxGridDBColumn;
    cxProvGridDBTableView1SUM_DB_NAME_SM: TcxGridDBColumn;
    cxProvGridDBTableView1SUM_DB_KOD_SM: TcxGridDBColumn;
    cxProvGridDBTableView1SUM_ID_DB_RZ: TcxGridDBColumn;
    cxProvGridDBTableView1SUM_DB_NAME_RZ: TcxGridDBColumn;
    cxProvGridDBTableView1SUM_DB_KOD_RZ: TcxGridDBColumn;
    cxProvGridDBTableView1SUM_ID_DB_ST: TcxGridDBColumn;
    cxProvGridDBTableView1SUM_DB_NAME_ST: TcxGridDBColumn;
    cxProvGridDBTableView1SUM_DB_KOD_ST: TcxGridDBColumn;
    cxProvGridDBTableView1SUM_ID_DB_KEKV: TcxGridDBColumn;
    cxProvGridDBTableView1SUM_DB_NAME_KEKV: TcxGridDBColumn;
    cxProvGridDBTableView1SUM_DB_KOD_KEKV: TcxGridDBColumn;
    cxProvGridDBTableView1SUM_ID_KR_SCH: TcxGridDBColumn;
    cxProvGridDBTableView1SUM_KR_SCH_NUMBER: TcxGridDBColumn;
    cxProvGridDBTableView1SUM_ID_KR_SM: TcxGridDBColumn;
    cxProvGridDBTableView1SUM_KR_NAME_SM: TcxGridDBColumn;
    cxProvGridDBTableView1SUM_KR_KOD_SM: TcxGridDBColumn;
    cxProvGridDBTableView1SUM_ID_KR_RZ: TcxGridDBColumn;
    cxProvGridDBTableView1SUM_KR_NAME_RZ: TcxGridDBColumn;
    cxProvGridDBTableView1SUM_KR_KOD_RZ: TcxGridDBColumn;
    cxProvGridDBTableView1SUM_ID_KR_ST: TcxGridDBColumn;
    cxProvGridDBTableView1SUM_KR_NAME_ST: TcxGridDBColumn;
    cxProvGridDBTableView1SUM_KR_KOD_ST: TcxGridDBColumn;
    cxProvGridDBTableView1SUM_ID_KR_KEKV: TcxGridDBColumn;
    cxProvGridDBTableView1SUM_KR_NAME_KEKV: TcxGridDBColumn;
    cxProvGridDBTableView1SUM_KR_KOD_KEKV: TcxGridDBColumn;
    cxProvGridDBTableView1IS_OUT_POS: TcxGridDBColumn;
    ProvDataSetEX_PROV: TStringField;
    ProvDataSetSTR_FDB_SCH: TStringField;
    ProvDataSetSTR_FKR_SCH: TStringField;
    cxProvGridDBTableView1DBColumn1: TcxGridDBColumn;
    cxProvGridDBTableView1DBColumn2: TcxGridDBColumn;
    cxProvGridDBTableView1DBColumn3: TcxGridDBColumn;
    ProvDataSetSTR_FSUMMA: TStringField;
    cxProvGridDBTableView1DBColumn4: TcxGridDBColumn;
    Label1: TLabel;
    cxPropDbSch: TcxButtonEdit;
    cxPropKrSch: TcxButtonEdit;
    cxCheckDBProp: TcxCheckBox;
    cxCheckKRProp: TcxCheckBox;
    IniDataSet: TpFIBDataSet;
    cxIstfin: TcxCheckBox;
    procedure cxAddButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxDelButtonClick(Sender: TObject);
    procedure cxEditButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ProvDataSetIS_EX_PROVGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure ProvDataSetCalcFields(DataSet: TDataSet);
    procedure cxPropDbSchPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxCheckDBPropPropertiesChange(Sender: TObject);
    procedure cxCheckKRPropPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    ID_OPER: integer;
    ID_PROP_DB_SCH: integer;
    ID_PROP_KR_SCH: integer;
    procedure LoadComboBoxFromDB(CB: TcxComboBox);
  end;

var
  SpOperProvForm: TSpOperProvForm;

implementation

uses uSpOper, uSpOperProvWork;

{$R *.dfm}

procedure TSpOperProvForm.cxAddButtonClick(Sender: TObject);
var
 fmp: TSpOperWorkForm;
 vals : array of Variant;
 id: integer;
begin
 fmp:=TSpOperWorkForm.Create(self);
 fmp.DBHandle:=ProvDB.Handle;

 LoadComboBoxFromDB(fmp.cxUnitIndex);

 fmp.cxKolMatParam.ItemIndex:=0;
 fmp.cxSumParam.ItemIndex:=0;
 fmp.ShowModal;
 if fmp.ModalResult=mrOk then
//  if (fmp.DB_ID_SCH<>0) or (fmp.KR_ID_SCH<>0) then
  begin
   SetLength(Vals, 45);
{
0    ID_OPER NUMERIC(10,0),
1    DB_ID_SCH NUMERIC(10,0),
2    DB_ID_SM NUMERIC(10,0),
3    DB_ID_RZ NUMERIC(10,0),
4    DB_ID_ST NUMERIC(10,0),
5    DB_ID_KEKV NUMERIC(10,0),
6    DB_ID_MARK NUMERIC(10,0),
7    KR_ID_SCH NUMERIC(10,0),
8    KR_ID_SM NUMERIC(10,0),
9    KR_ID_RZ NUMERIC(10,0),
10    KR_ID_ST NUMERIC(10,0),
1    KR_ID_KEKV NUMERIC(10,0),
2    KR_ID_MARK NUMERIC(10,0),
3    IS_EX_PROV INTEGER,
4    SUM_DB_PROV INTEGER,
5    SUM_KR_PROV INTEGER)
6    NPROV NUMERIC(10,0),
7    IS_GROUP INTEGER,
8     IS_OUT_POS INTEGER,
9    FDB_SCH SMALLINT,
20    DB_SCH VARCHAR(10),
1    FKR_SCH SMALLINT,
2    KR_SCH VARCHAR(10),
3    FKOL_MAT SMALLINT,
4    FSUMMA SMALLINT,
5    SUM_BY_DB_SCH INTEGER,
6    SUM_BY_DB_SM INTEGER,
7    SUM_BY_DB_RZ INTEGER,
8    SUM_BY_DB_ST INTEGER,
9    SUM_BY_DB_KEKV INTEGER,
30    SUM_BY_KR_SCH INTEGER,
1    SUM_BY_KR_SM INTEGER,
2    SUM_BY_KR_RZ INTEGER,
3    SUM_BY_KR_ST INTEGER,
4    SUM_BY_KR_KEKV INTEGER,
5    SUM_ID_DB_SCH NUMERIC(10,0),
6    SUM_ID_DB_SM NUMERIC(10,0),
7    SUM_ID_DB_RZ NUMERIC(10,0),
8    SUM_ID_DB_ST NUMERIC(10,0),
9    SUM_ID_DB_KEKV NUMERIC(10,0),
40    SUM_ID_KR_SCH NUMERIC(10,0),
1    SUM_ID_KR_SM NUMERIC(10,0),
2    SUM_ID_KR_RZ NUMERIC(10,0),
3    SUM_ID_KR_ST NUMERIC(10,0),
4    SUM_ID_KR_KEKV NUMERIC(10,0))
}
   Vals[ 0] := ID_OPER;
   Vals[ 1] := fmp.DB_ID_SCH;
   Vals[ 2] := fmp.DB_ID_SM;
   Vals[ 3] := fmp.DB_ID_RZ;
   Vals[ 4] := fmp.DB_ID_ST;
   Vals[ 5] := fmp.DB_ID_KEKV;
   Vals[ 6] := fmp.DB_ID_MARK;
   Vals[ 7] := fmp.KR_ID_SCH;
   Vals[ 8] := fmp.KR_ID_SM;
   Vals[ 9] := fmp.KR_ID_RZ;
   Vals[10] := fmp.KR_ID_ST;
   Vals[11] := fmp.KR_ID_KEKV;
   Vals[12] := fmp.KR_ID_MARK;
   if fmp.cxCheckExProv.Checked then
    Vals[13] :=1
   else
    Vals[13] :=0;
   if fmp.cxCheckDBSum.Checked then
    Vals[14] :=1
   else
    Vals[14] :=0;
   if fmp.cxCheckKRSum.Checked then
    Vals[15] := 1
   else
    Vals[15] :=0;
   Vals[16]:=fmp.cxUnitIndex.ItemIndex;
   if fmp.cxUnitProv.Checked then
    Vals[17]:=1
   else
    Vals[17]:=0;
   if fmp.cxCheckOutPos.Checked then
    Vals[18]:=1
   else
    Vals[18]:=0;
   Vals[19]:=fmp.cxDBSchParam.ItemIndex;
   Vals[20]:=fmp.cxDbSch.Text;
   Vals[21]:=fmp.cxKRSchParam.ItemIndex;
   Vals[22]:=fmp.cxKrSch.Text;
   Vals[23]:=fmp.cxKolMatParam.ItemIndex;
   Vals[24]:=fmp.cxSumParam.ItemIndex;
   Vals[25]:=fmp.SUM_BY_DB_SCH;
   Vals[26]:=fmp.SUM_BY_DB_SM;
   Vals[27]:=fmp.SUM_BY_DB_RZ;
   Vals[28]:=fmp.SUM_BY_DB_ST;
   Vals[29]:=fmp.SUM_BY_DB_KEKV;
   Vals[30]:=fmp.SUM_BY_KR_SCH;
   Vals[31]:=fmp.SUM_BY_KR_SM;
   Vals[32]:=fmp.SUM_BY_KR_RZ;
   Vals[33]:=fmp.SUM_BY_KR_ST;
   Vals[34]:=fmp.SUM_BY_KR_KEKV;
   Vals[35]:=fmp.SUM_DB_ID_SCH;
   Vals[36]:=fmp.SUM_DB_ID_SM;
   Vals[37]:=fmp.SUM_DB_ID_RZ;
   Vals[38]:=fmp.SUM_DB_ID_ST;
   Vals[39]:=fmp.SUM_DB_ID_KEKV;
   Vals[40]:=fmp.SUM_KR_ID_SCH;
   Vals[41]:=fmp.SUM_KR_ID_SM;
   Vals[42]:=fmp.SUM_KR_ID_RZ;
   Vals[43]:=fmp.SUM_KR_ID_ST;
   Vals[44]:=fmp.SUM_KR_ID_KEKV;
   try
    WorkStoredProc.Transaction := ProvTransaction;
    WorkStoredProc.Transaction.StartTransaction;
    WorkStoredProc.StoredProcName:='MAT_SP_OPER_PROV_INSERT';
    WorkStoredProc.Prepare;
    WorkStoredProc.ExecProcedure('MAT_SP_OPER_PROV_INSERT', vals);
    WorkStoredProc.Transaction.Commit;
    id:=WorkStoredProc.ParamByName('ID_PROV').AsInteger;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     WorkStoredProc.Transaction.Rollback;
     exit;
    end;
   end;
  end;
 fmp.Free;
 ProvDataSet.CloseOpen(false);
 ProvDataSet.Locate('ID_OPER', ID, []);
end;

procedure TSpOperProvForm.FormCreate(Sender: TObject);
begin
 OkButton.Caption:=MAT_BUTTON_OK_CONST;
 CancelButton.Caption:=MAT_BUTTON_CANCEL_CONST;
 cxAddButton.Caption:=MAT_ACTION_ADD_CONST;
 cxDelButton.Caption:=MAT_ACTION_DELETE_CONST;
 cxEditButton.Caption:=MAT_ACTION_UPDATE_CONST;
 cxProvGridDBTableView1DB_SCH_NUMBER.Caption:=MAT_STR_COL_DB;
 cxProvGridDBTableView1KR_SCH_NUMBER.Caption:=MAT_STR_COL_KR;
 LabelName.Caption:=MAT_OPER_LABEL_NAME;
// LabelObject.Caption:=MAT_OPER_LABEL_OBJECT;
// cxUseTipd.Properties.Caption:=MAT_OPER_LABEL_DOC;
// cxUseIn.Properties.Caption:=MAT_OPER_LABEL_IN;
// cxUseOut.Properties.Caption:=MAT_OPER_LABEL_OUT;
// cxUseDog.Properties.Caption:=MAT_OPER_LABEL_USE_DOG;
// cxBarter.Properties.Caption:=MAT_OPER_LABEL_BARTER;
 ID_OPER:=0;
end;

procedure TSpOperProvForm.cxDelButtonClick(Sender: TObject);
var
 id: integer;
begin
 if agMessageDlg(MAT_STR_MODE_DEL, MAT_STR_ASK_DELETE, mtConfirmation, [mbYes, mbNo]) = ID_YES  then
 begin
  id:=ProvDataSet.FieldByName('ID_PROV').AsInteger;
  try
    WorkStoredProc.Transaction := ProvTransaction;
    WorkStoredProc.Transaction.StartTransaction;
    WorkStoredProc.StoredProcName:='MAT_SP_OPER_PROV_DELETE';
    WorkStoredProc.Prepare;
    WorkStoredProc.ExecProcedure('MAT_SP_OPER_PROV_DELETE', [id]);
    WorkStoredProc.Transaction.Commit;
  except on E : Exception
    do begin
     ShowMessage(E.Message);
     WorkStoredProc.Transaction.Rollback;
     exit;
    end;
  end;
  ProvDataSet.CloseOpen(false);
 end;
end;

procedure TSpOperProvForm.cxEditButtonClick(Sender: TObject);
var
 fmp: TSpOperWorkForm;
 vals : array of Variant;
 id: integer;
begin
 fmp:=TSpOperWorkForm.Create(self);
 fmp.DBHandle:=ProvDB.Handle;

 LoadComboBoxFromDB(fmp.cxUnitIndex);

 id:=ProvDataSetID_PROV.AsInteger;
 fmp.DB_ID_SCH:=ProvDataSetDB_ID_SCH.AsInteger;
 fmp.DB_ID_SM:=ProvDataSetDB_ID_SM.AsInteger;
 fmp.DB_ID_RZ:=ProvDataSetDB_ID_RZ.AsInteger;
 fmp.DB_ID_ST:=ProvDataSetDB_ID_ST.AsInteger;
 fmp.DB_ID_KEKV:=ProvDataSetDB_ID_KEKV.AsInteger;
 fmp.DB_ID_MARK:=ProvDataSetDB_ID_MARK.AsInteger;
 fmp.KR_ID_SCH:=ProvDataSetKR_ID_SCH.AsInteger;
 fmp.KR_ID_SM:=ProvDataSetKR_ID_SM.AsInteger;
 fmp.KR_ID_ST:=ProvDataSetKR_ID_ST.AsInteger;
 fmp.KR_ID_RZ:=ProvDataSetKR_ID_RZ.AsInteger;
 fmp.KR_ID_KEKV:=ProvDataSetKR_ID_KEKV.AsInteger;
 fmp.KR_ID_MARK:=ProvDataSetKR_ID_MARK.AsInteger;
 fmp.DB_NAME_SM:=ProvDataSetDB_NAME_SM.AsString;
 fmp.DB_NAME_RZ:=ProvDataSetDB_NAME_RZ.AsString;
 fmp.DB_NAME_ST:=ProvDataSetDB_NAME_ST.AsString;
 fmp.DB_NAME_KEKV:=ProvDataSetDB_NAME_KEKV.AsString;
 fmp.KR_NAME_SM:=ProvDataSetKR_NAME_SM.AsString;
 fmp.KR_NAME_ST:=ProvDataSetKR_NAME_ST.AsString;
 fmp.KR_NAME_RZ:=ProvDataSetKR_NAME_RZ.AsString;
 fmp.KR_NAME_KEKV:=ProvDataSetKR_NAME_KEKV.AsString;
 fmp.DB_KOD_SM:=ProvDataSetDB_KOD_SM.AsInteger;
 fmp.DB_KOD_RZ:=ProvDataSetDB_KOD_RZ.AsInteger;
 fmp.DB_KOD_ST:=ProvDataSetDB_KOD_ST.AsInteger;
 fmp.DB_KOD_KEKV:=ProvDataSetDB_KOD_KEKV.AsInteger;
 fmp.KR_KOD_SM:=ProvDataSetKR_KOD_SM.AsInteger;
 fmp.KR_KOD_ST:=ProvDataSetKR_KOD_ST.AsInteger;
 fmp.KR_KOD_RZ:=ProvDataSetKR_KOD_RZ.AsInteger;
 fmp.KR_KOD_KEKV:=ProvDataSetKR_KOD_KEKV.AsInteger;
 fmp.DB_SHORT_MARK:=ProvDataSetDB_SHORT_MARK.AsString;
 fmp.KR_SHORT_MARK:=ProvDataSetKR_SHORT_MARK.AsString;
 fmp.DB_NAME_MARK:=ProvDataSetDB_NAME_MARK.AsString;
 fmp.KR_NAME_MARK:=ProvDataSetKR_NAME_MARK.AsString;
 fmp.cxDbSch.Text:=ProvDataSetDB_SCH_NUMBER.AsString;
 fmp.cxKrSch.Text:=ProvDataSetKR_SCH_NUMBER.AsString;
 fmp.cxDbSmeta.Text:=ProvDataSetDB_KOD_SM.AsString;
 fmp.cxDBRazdel.Text:=ProvDataSetDB_KOD_RZ.AsString;
 fmp.cxDBStatya.Text:=ProvDataSetDB_KOD_ST.AsString;
 fmp.cxDBKEKV.Text:=ProvDataSetDB_KOD_KEKV.AsString;
 fmp.cxKRSmeta.Text:=ProvDataSetKR_KOD_SM.AsString;
 fmp.cxKRRazdel.Text:=ProvDataSetKR_KOD_RZ.AsString;
 fmp.cxKRStatya.Text:=ProvDataSetKR_KOD_ST.AsString;
 fmp.cxKRKEKV.Text:=ProvDataSetKR_KOD_KEKV.AsString;
 fmp.cxCheckExProv.Checked:=ProvDataSetIS_EX_PROV.AsBoolean;
 fmp.cxCheckDBSum.Checked:=ProvDataSetSUM_DB_PROV.AsBoolean;
 fmp.cxCheckKRSum.Checked:=ProvDataSetSUM_KR_PROV.AsBoolean;
 fmp.SUM_DB_ID_SCH:=ProvDataSetSUM_ID_DB_SCH.AsInteger;
 fmp.SUM_DB_ID_SM:=ProvDataSetSUM_ID_DB_SM.AsInteger;
 fmp.SUM_DB_ID_RZ:=ProvDataSetSUM_ID_DB_RZ.AsInteger;
 fmp.SUM_DB_ID_ST:=ProvDataSetSUM_ID_DB_ST.AsInteger;
 fmp.SUM_DB_ID_KEKV:=ProvDataSetSUM_ID_DB_KEKV.AsInteger;
 fmp.SUM_KR_ID_SCH:=ProvDataSetSUM_ID_KR_SCH.AsInteger;
 fmp.SUM_KR_ID_SM:=ProvDataSetSUM_ID_KR_SM.AsInteger;
 fmp.SUM_KR_ID_RZ:=ProvDataSetSUM_ID_KR_RZ.AsInteger;
 fmp.SUM_KR_ID_ST:=ProvDataSetSUM_ID_KR_ST.AsInteger;
 fmp.SUM_KR_ID_KEKV:=ProvDataSetSUM_ID_KR_KEKV.AsInteger;
 fmp.SUM_BY_DB_SCH:=ProvDataSetSUM_BY_DB_SCH.AsInteger;
 fmp.SUM_BY_DB_SM:=ProvDataSetSUM_BY_DB_SM.AsInteger;
 fmp.SUM_BY_DB_RZ:=ProvDataSetSUM_BY_DB_RZ.AsInteger;
 fmp.SUM_BY_DB_ST:=ProvDataSetSUM_BY_DB_ST.AsInteger;
 fmp.SUM_BY_DB_KEKV:=ProvDataSetSUM_BY_DB_KEKV.AsInteger;
 fmp.SUM_BY_KR_SCH:=ProvDataSetSUM_BY_KR_SCH.AsInteger;
 fmp.SUM_BY_KR_SM:=ProvDataSetSUM_BY_KR_SM.AsInteger;
 fmp.SUM_BY_KR_RZ:=ProvDataSetSUM_BY_KR_RZ.AsInteger;
 fmp.SUM_BY_KR_ST:=ProvDataSetSUM_BY_KR_ST.AsInteger;
 fmp.SUM_BY_KR_KEKV:=ProvDataSetSUM_BY_KR_KEKV.AsInteger;
 fmp.SUM_DB_SCH_NUMBER:=ProvDataSetSUM_DB_SCH_NUMBER.AsString;
 fmp.SUM_DB_NAME_SM:=ProvDataSetSUM_DB_NAME_SM.AsString;
 fmp.SUM_DB_NAME_RZ:=ProvDataSetSUM_DB_NAME_RZ.AsString;
 fmp.SUM_DB_NAME_ST:=ProvDataSetSUM_DB_NAME_ST.AsString;
 fmp.SUM_DB_NAME_KEKV:=ProvDataSetSUM_DB_NAME_KEKV.AsString;
 fmp.SUM_KR_SCH_NUMBER:=ProvDataSetSUM_KR_SCH_NUMBER.AsString;
 fmp.SUM_KR_NAME_SM:=ProvDataSetSUM_KR_NAME_SM.AsString;
 fmp.SUM_KR_NAME_RZ:=ProvDataSetSUM_KR_NAME_RZ.AsString;
 fmp.SUM_KR_NAME_ST:=ProvDataSetSUM_KR_NAME_ST.AsString;
 fmp.SUM_KR_NAME_KEKV:=ProvDataSetSUM_KR_NAME_KEKV.AsString;
 fmp.SUM_DB_KOD_SM:=ProvDataSetSUM_DB_KOD_SM.AsString;
 fmp.SUM_DB_KOD_RZ:=ProvDataSetSUM_DB_KOD_RZ.AsString;
 fmp.SUM_DB_KOD_ST:=ProvDataSetSUM_DB_KOD_ST.AsString;
 fmp.SUM_DB_KOD_KEKV:=ProvDataSetSUM_DB_KOD_KEKV.AsString;
 fmp.SUM_KR_KOD_SM:=ProvDataSetSUM_KR_KOD_SM.AsString;
 fmp.SUM_KR_KOD_RZ:=ProvDataSetSUM_KR_KOD_RZ.AsString;
 fmp.SUM_KR_KOD_ST:=ProvDataSetSUM_KR_KOD_ST.AsString;
 fmp.SUM_KR_KOD_KEKV:=ProvDataSetSUM_KR_KOD_KEKV.AsString;
 fmp.cxKolMatParam.ItemIndex:=ProvDataSetFKOL_MAT.AsInteger;
 fmp.cxSumParam.ItemIndex:=ProvDataSetFSUMMA.AsInteger;
 fmp.cxUnitProv.Checked:=ProvDataSetIS_GROUP.AsBoolean;
 fmp.cxUnitIndex.ItemIndex:=ProvDataSetNPROV.AsInteger;
 if not fmp.cxUnitProv.Checked then
 begin
  fmp.cxUnitIndex.ItemIndex:=0;
  fmp.cxUnitIndex.Enabled:=false;
 end;
 fmp.cxCheckOutPos.Checked:=ProvDataSetIS_OUT_POS.AsBoolean;
 fmp.cxIsDBSumSch.Checked:=ProvDataSetSUM_BY_DB_SCH.AsBoolean;
 fmp.cxIsDBSumSm.Checked:=ProvDataSetSUM_BY_DB_SM.AsBoolean;
 fmp.cxIsDBSumRz.Checked:=ProvDataSetSUM_BY_DB_RZ.AsBoolean;
 fmp.cxIsDBSumSt.Checked:=ProvDataSetSUM_BY_DB_ST.AsBoolean;
 fmp.cxIsKRSumSch.Checked:=ProvDataSetSUM_BY_KR_SCH.AsBoolean;
 fmp.cxIsKRSumSm.Checked:=ProvDataSetSUM_BY_KR_SM.AsBoolean;
 fmp.cxIsKRSumRz.Checked:=ProvDataSetSUM_BY_KR_RZ.AsBoolean;
 fmp.cxIsKRSumSt.Checked:=ProvDataSetSUM_BY_KR_ST.AsBoolean;
 fmp.cxDBSumSch.Text:=ProvDataSetSUM_DB_SCH_NUMBER.AsString;
 fmp.cxDBSumSm.Text:=ProvDataSetSUM_DB_KOD_SM.AsString;
 fmp.cxDBSumRz.Text:=ProvDataSetSUM_DB_KOD_RZ.AsString;
 fmp.cxDBSumSt.Text:=ProvDataSetSUM_DB_KOD_ST.AsString;
 fmp.cxKRSumSch.Text:=provDataSetSUM_KR_SCH_NUMBER.AsString;
 fmp.cxKRSumSm.Text:=ProvDataSetSUM_KR_KOD_SM.AsString;
 fmp.cxKRSumRz.Text:=ProvDataSetSUM_KR_KOD_RZ.AsString;
 fmp.cxKRSumSt.Text:=ProvDataSetSUM_KR_KOD_ST.AsString;
 fmp.cxDBSchParam.ItemIndex:=ProvDataSetFDB_SCH.AsInteger;
 fmp.cxKRSchParam.ItemIndex:=ProvDataSetFKR_SCH.AsInteger;
 fmp.ShowModal;
 if fmp.ModalResult=mrOk then
//  if (fmp.DB_ID_SCH<>0) or (fmp.KR_ID_SCH<>0) then
  begin
   SetLength(Vals, 45);
{
1    ID_OPER NUMERIC(10,0),
2    DB_ID_SCH NUMERIC(10,0),
3    DB_ID_SM NUMERIC(10,0),
4    DB_ID_RZ NUMERIC(10,0),
5    DB_ID_ST NUMERIC(10,0),
6    DB_ID_KEKV NUMERIC(10,0),
7    DB_ID_MARK NUMERIC(10,0),

8    KR_ID_SCH NUMERIC(10,0),
9    KR_ID_SM NUMERIC(10,0),
0    KR_ID_RZ NUMERIC(10,0),
1    KR_ID_ST NUMERIC(10,0),
2    KR_ID_KEKV NUMERIC(10,0),
3    KR_ID_MARK NUMERIC(10,0),
4    IS_EX_PROV INTEGER,
5    SUM_DB_PROV INTEGER,
6    SUM_KR_PROV INTEGER)
}
   Vals[ 0] := ID;
   Vals[ 1] := fmp.DB_ID_SCH;
   Vals[ 2] := fmp.DB_ID_SM;
   Vals[ 3] := fmp.DB_ID_RZ;
   Vals[ 4] := fmp.DB_ID_ST;
   Vals[ 5] := fmp.DB_ID_KEKV;
   Vals[ 6] := fmp.DB_ID_MARK;
   Vals[ 7] := fmp.KR_ID_SCH;
   Vals[ 8] := fmp.KR_ID_SM;
   Vals[ 9] := fmp.KR_ID_RZ;
   Vals[10] := fmp.KR_ID_ST;
   Vals[11] := fmp.KR_ID_KEKV;
   Vals[12] := fmp.KR_ID_MARK;
   if fmp.cxCheckExProv.Checked then
    Vals[13] :=1
   else
    Vals[13] :=0;
   if fmp.cxCheckDBSum.Checked then
    Vals[14] :=1
   else
    Vals[14] :=0;
   if fmp.cxCheckKRSum.Checked then
    Vals[15] := 1
   else
    Vals[15] :=0;
   Vals[16]:=fmp.cxUnitIndex.ItemIndex;
   if fmp.cxUnitProv.Checked then
    Vals[17]:=1
   else
    Vals[17]:=0;
   if fmp.cxCheckOutPos.Checked then
    Vals[18]:=1
   else
    Vals[18]:=0;
   Vals[19]:=fmp.cxDBSchParam.ItemIndex;
   Vals[20]:=fmp.cxDbSch.Text;
   Vals[21]:=fmp.cxKRSchParam.ItemIndex;
   Vals[22]:=fmp.cxKrSch.Text;
   Vals[23]:=fmp.cxKolMatParam.ItemIndex;
   Vals[24]:=fmp.cxSumParam.ItemIndex;
   Vals[25]:=fmp.SUM_BY_DB_SCH;
   Vals[26]:=fmp.SUM_BY_DB_SM;
   Vals[27]:=fmp.SUM_BY_DB_RZ;
   Vals[28]:=fmp.SUM_BY_DB_ST;
   Vals[29]:=fmp.SUM_BY_DB_KEKV;
   Vals[30]:=fmp.SUM_BY_KR_SCH;
   Vals[31]:=fmp.SUM_BY_KR_SM;
   Vals[32]:=fmp.SUM_BY_KR_RZ;
   Vals[33]:=fmp.SUM_BY_KR_ST;
   Vals[34]:=fmp.SUM_BY_KR_KEKV;
   Vals[35]:=fmp.SUM_DB_ID_SCH;
   Vals[36]:=fmp.SUM_DB_ID_SM;
   Vals[37]:=fmp.SUM_DB_ID_RZ;
   Vals[38]:=fmp.SUM_DB_ID_ST;
   Vals[39]:=fmp.SUM_DB_ID_KEKV;
   Vals[40]:=fmp.SUM_KR_ID_SCH;
   Vals[41]:=fmp.SUM_KR_ID_SM;
   Vals[42]:=fmp.SUM_KR_ID_RZ;
   Vals[43]:=fmp.SUM_KR_ID_ST;
   Vals[44]:=fmp.SUM_KR_ID_KEKV;
   try
    WorkStoredProc.Transaction := ProvTransaction;
    WorkStoredProc.Transaction.StartTransaction;
    WorkStoredProc.StoredProcName:='MAT_SP_OPER_PROV_UPDATE';
    WorkStoredProc.Prepare;
    WorkStoredProc.ExecProcedure('MAT_SP_OPER_PROV_UPDATE', vals);
    WorkStoredProc.Transaction.Commit;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     WorkStoredProc.Transaction.Rollback;
     exit;
    end;
   end;
  end;
 fmp.Free;
 ProvDataSet.CloseOpen(false);
 ProvDataSet.Locate('ID_PROV', ID, []);
end;

procedure TSpOperProvForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=VK_RETURN then
  Key:=VK_TAB;
 if Key=VK_ESCAPE	then
  CancelButton.SetFocus;
 if (Key=VK_F10) or ((Key=VK_END) and (Shift=[ssCtrl])) then
  OkButton.SetFocus;
end;

procedure TSpOperProvForm.ProvDataSetIS_EX_PROVGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
 if DisplayText then
 begin
  if Sender.Value=1 then Text:='+' else Text:='';
 end;
end;

function GetSchParam(fp:integer):string;
begin
 case fp of
  0: Result:='';
  1: Result:='Фонд по джерелу фінанс.';
  2: Result:='Фонд по властивостям';
  3: Result:='Рахунок із документа';
  4: Result:='Рахунок по власт. із докум.';
 else
  Result:='';
 end;
end;

function GetSummaParam(fp:integer):string;
begin
 case fp of 
  0 : Result:='Сума позиції';
  1 : Result:='Сума документа';
  2 : Result:='Сума док. основи';
  3 : Result:='Сума ПДВ';
  4 : Result:='Сума док. основи-Сума документа';
  5 : Result:='Сума всіх ОЗ по ДБ';
  6 : Result:='Сума всіх МНА по ДБ';
  7 : Result:='Сума всіх матеріалів по ДБ';
  8 : Result:='Сума всіх ОЗ по КР';
  9 : Result:='Сума всіх МНА по КР';
  10: Result:='Сума всіх матеріалів по КР';
  11: Result:='0';
 else
  Result:='';
 end;
end;

procedure TSpOperProvForm.ProvDataSetCalcFields(DataSet: TDataSet);
begin
 if ProvDataSetIS_EX_PROV.Value=1 then
  ProvDataSetEX_PROV.Value:='+'
 else
  ProvDataSetEX_PROV.Value:='';
 ProvDataSetSTR_FDB_SCH.Value:=GetSchParam(ProvDataSetFDB_SCH.AsInteger);
 ProvDataSetSTR_FKR_SCH.Value:=GetSchParam(ProvDataSetFKR_SCH.AsInteger);
 ProvDataSetSTR_FSUMMA.Value:=GetSummaParam(ProvDataSetFSUMMA.AsInteger);
end;

procedure TSpOperProvForm.cxPropDbSchPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
// GlobalSPR.GetPropByObj(self, ProvDB.Handle, id_object, date, pt);
 GlobalSPR.GetPropertiesSpr(self, ProvDB.Handle, date);
end;

procedure TSpOperProvForm.cxCheckDBPropPropertiesChange(Sender: TObject);
begin
 cxPropDbSch.Enabled:=cxCheckDBProp.Checked;
end;

procedure TSpOperProvForm.cxCheckKRPropPropertiesChange(Sender: TObject);
begin
 cxPropKrSch.Enabled:=cxCheckKRProp.Checked;
end;

procedure TSpOperProvForm.LoadComboBoxFromDB(CB: TcxComboBox);
begin
 IniDataSet.Close;
 IniDataSet.SelectSQL.Clear;
 IniDataSet.SelectSQL.Add('SELECT * FROM MAT_INI_PROV_OPER ORDER BY ID_OPER');
 IniDataSet.Open;
 CB.Properties.Items.Clear;
 CB.Properties.Items.Add('');
 while not IniDataSet.Eof do
 begin
   CB.Properties.Items.Add(IniDataSet.FieldByName('NAME_OPER').AsString);
   IniDataSet.Next;
 end;
 IniDataSet.Close;
end;

end.






