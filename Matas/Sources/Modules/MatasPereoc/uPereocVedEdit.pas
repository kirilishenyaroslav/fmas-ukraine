{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль работы с переоценкой ТМЦ                       }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uPereocVedEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxGridTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridDBTableView, cxGrid,
  cxCurrencyEdit, cxDBEdit, cxContainer, cxTextEdit, cxGroupBox,
  uResources, uMatasVars, cxLookAndFeelPainters, StdCtrls, cxButtons, ibase,
  FIBQuery, pFIBQuery, pFIBStoredProc, uMatasUtils;

type
  TVedPereocPosForm = class(TForm)
    dbRecost: TpFIBDatabase;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    dsPereocPos: TpFIBDataSet;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
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
    dsSource: TDataSource;
    dsPereocPosID_RECOST_PREP: TFIBBCDField;
    dsPereocPosID_MO: TFIBBCDField;
    dsPereocPosFIO: TFIBStringField;
    dsPereocPosSFIO: TFIBStringField;
    dsPereocPosNAME_DEPARTMENT: TFIBStringField;
    dsPereocPosID_NOMN: TFIBBCDField;
    dsPereocPosNOMN: TFIBStringField;
    dsPereocPosNAME: TFIBStringField;
    dsPereocPosUNIT: TFIBStringField;
    dsPereocPosID_SCH: TFIBBCDField;
    dsPereocPosSCH_NUMBER: TFIBStringField;
    dsPereocPosID_OST: TFIBBCDField;
    dsPereocPosID_PROV: TFIBBCDField;
    dsPereocPosSUMMA_OLD: TFIBBCDField;
    dsPereocPosSUMMA_NEW: TFIBBCDField;
    dsPereocPosSUMMA: TFIBBCDField;
    dsPereocPosDB_ID_SCH: TFIBBCDField;
    dsPereocPosDB_SCH_NUMBER: TFIBStringField;
    dsPereocPosKR_ID_SCH: TFIBBCDField;
    dsPereocPosKR_SCH_NUMBER: TFIBStringField;
    dsPereocPosID_SM: TFIBBCDField;
    dsPereocPosID_RZ: TFIBBCDField;
    dsPereocPosID_ST: TFIBBCDField;
    dsPereocPosID_KEKV: TFIBBCDField;
    dsPereocPosSM_KOD: TFIBIntegerField;
    dsPereocPosRZ_KOD: TFIBIntegerField;
    dsPereocPosST_KOD: TFIBIntegerField;
    dsPereocPosKEKV_KOD: TFIBIntegerField;
    dsPereocPosISTFIN_STR: TFIBStringField;
    cxGrid1DBTableView1ID_RECOST_PREP: TcxGridDBColumn;
    cxGrid1DBTableView1ID_MO: TcxGridDBColumn;
    cxGrid1DBTableView1FIO: TcxGridDBColumn;
    cxGrid1DBTableView1SFIO: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_DEPARTMENT: TcxGridDBColumn;
    cxGrid1DBTableView1ID_NOMN: TcxGridDBColumn;
    cxGrid1DBTableView1NOMN: TcxGridDBColumn;
    cxGrid1DBTableView1NAME: TcxGridDBColumn;
    cxGrid1DBTableView1UNIT: TcxGridDBColumn;
    cxGrid1DBTableView1ID_SCH: TcxGridDBColumn;
    cxGrid1DBTableView1SCH_NUMBER: TcxGridDBColumn;
    cxGrid1DBTableView1ID_OST: TcxGridDBColumn;
    cxGrid1DBTableView1ID_PROV: TcxGridDBColumn;
    cxGrid1DBTableView1SUMMA_OLD: TcxGridDBColumn;
    cxGrid1DBTableView1SUMMA_NEW: TcxGridDBColumn;
    cxGrid1DBTableView1SUMMA: TcxGridDBColumn;
    cxGrid1DBTableView1DB_ID_SCH: TcxGridDBColumn;
    cxGrid1DBTableView1DB_SCH_NUMBER: TcxGridDBColumn;
    cxGrid1DBTableView1KR_ID_SCH: TcxGridDBColumn;
    cxGrid1DBTableView1KR_SCH_NUMBER: TcxGridDBColumn;
    cxGrid1DBTableView1ID_SM: TcxGridDBColumn;
    cxGrid1DBTableView1ID_RZ: TcxGridDBColumn;
    cxGrid1DBTableView1ID_ST: TcxGridDBColumn;
    cxGrid1DBTableView1ID_KEKV: TcxGridDBColumn;
    cxGrid1DBTableView1SM_KOD: TcxGridDBColumn;
    cxGrid1DBTableView1RZ_KOD: TcxGridDBColumn;
    cxGrid1DBTableView1ST_KOD: TcxGridDBColumn;
    cxGrid1DBTableView1KEKV_KOD: TcxGridDBColumn;
    cxGrid1DBTableView1ISTFIN_STR: TcxGridDBColumn;
    cxGroupBox1: TcxGroupBox;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBCurrencyEdit1: TcxDBCurrencyEdit;
    cxDBCurrencyEdit2: TcxDBCurrencyEdit;
    cxDBCurrencyEdit3: TcxDBCurrencyEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxButtonAddProv: TcxButton;
    StoredProc: TpFIBStoredProc;
    dsPereocMO: TpFIBDataSet;
    procedure FormCreate(Sender: TObject);
    procedure cxButtonAddProvClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    DBHANDLE : TISC_DB_HANDLE;
    ID_SESSION: Integer;
  end;

var
  VedPereocPosForm: TVedPereocPosForm;

implementation

{$R *.dfm}
uses uPereocIstFinEdit;

procedure TVedPereocPosForm.FormCreate(Sender: TObject);
begin
 Caption:=MAT_SYS_PREFIX+MAT_STR_MAIN_MENU_ACC_RECOST+'::Відомість';
 OkButton.Caption:=MAT_BUTTON_OK_CONST;
 CancelButton.Caption:=MAT_BUTTON_CANCEL_CONST;
end;

procedure TVedPereocPosForm.cxButtonAddProvClick(Sender: TObject);
var
 T:TVedPereocIstFinFrom;
 vals : array of Variant;
 w: TForm;
begin
 T:=TVedPereocIstFinFrom.Create(Self);
 T.DBHANDLE:=DBHANDLE;
 if T.ShowModal=mrOk then
 begin
  Refresh;
  w:=ShowWaitWindow(self);
  SetLength(Vals, 5);
  Vals[ 0] := ID_SESSION;
  Vals[ 1] := T.ID_SM;
  Vals[ 2] := T.ID_RZ;
  Vals[ 3] := T.ID_ST;
  Vals[ 4] := T.ID_KEKV;
  try
    StoredProc.Transaction:=trWrite;
    StoredProc.Transaction.StartTransaction;
    StoredProc.StoredProcName:='MAT_TMP_RECOST_PREP_UB';
    StoredProc.Prepare;
    StoredProc.ExecProcedure('MAT_TMP_RECOST_PREP_UB', vals);
    StoredProc.Transaction.Commit;
    CloseWaitWindow(w);
  except on E : Exception
   do begin
     ShowMessage(E.Message);
     StoredProc.Transaction.Rollback;
     CloseWaitWindow(w);
     exit;
   end;
  end;
 end;
 dsPereocPos.CloseOpen(false);
 T.Free;
end;

end.
