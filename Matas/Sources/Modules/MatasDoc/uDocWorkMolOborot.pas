{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль работы с документами                           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uDocWorkMolOborot;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxControls, ibase,
  cxGridCustomView, cxGrid, cxClasses, FIBDatabase, pFIBDatabase, Buttons,
  ExtCtrls, StdCtrls, cxContainer, cxTextEdit, cxMaskEdit, cxButtonEdit, uSpMatOtv,
  uResources, uMatasVars, Menus, ActnList, FR_DSet, FR_DBSet, FR_Class;

type
  TDocWorkMolOborotForm = class(TForm)
    WorkDataSet: TpFIBDataSet;
    WorkDataSource: TDataSource;
    WorkDatabase: TpFIBDatabase;
    WorkTransaction: TpFIBTransaction;
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
    OborotGrid: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    WorkDataSetID_SCH: TFIBBCDField;
    WorkDataSetSCH_NUMBER: TFIBStringField;
    WorkDataSetKOL_PRH: TFIBBCDField;
    WorkDataSetKOL_RSH: TFIBBCDField;
    WorkDataSetSUMM_PRH: TFIBBCDField;
    WorkDataSetSUMM_RSH: TFIBBCDField;
    cxGridDBTableView1ID_SCH: TcxGridDBColumn;
    cxGridDBTableView1SCH_NUMBER: TcxGridDBColumn;
    cxGridDBTableView1KOL_PRH: TcxGridDBColumn;
    cxGridDBTableView1KOL_RSH: TcxGridDBColumn;
    cxGridDBTableView1SUMM_PRH: TcxGridDBColumn;
    cxGridDBTableView1SUMM_RSH: TcxGridDBColumn;
    PanelWork: TPanel;
    RefreshButton: TSpeedButton;
    PrintButton: TSpeedButton;
    CancelButton: TSpeedButton;
    cxMatOtv: TcxButtonEdit;
    Label2: TLabel;
    ActionList1: TActionList;
    acRefresh: TAction;
    acPrint: TAction;
    acExit: TAction;
    OPopupMenu: TPopupMenu;
    acPrint1: TMenuItem;
    acRefresh1: TMenuItem;
    N1: TMenuItem;
    acExit1: TMenuItem;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    procedure cxMatOtvPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure acExitExecute(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    procedure acPrintExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ID_MO: integer;
    DBHANDLE : TISC_DB_HANDLE;
    DateBeg, DateEnd: TDateTime;
  end;

var
  DocWorkMolOborotForm: TDocWorkMolOborotForm;

implementation

{$R *.dfm}



procedure TDocWorkMolOborotForm.cxMatOtvPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Res : Variant;
  IsMoOk:boolean;
begin
 IsMoOk:=false;
 Res:=uSpMatOtv.GetMatOtv(self, DBHANDLE, 0, ID_MO);
 if  VarType(Res) <> varEmpty then begin
  ID_MO:=Res[0];
  cxMatOtv.Text:=Res[1];
 end
 else begin
  ID_MO:=0;
  cxMatOtv.Text:='';
 end;
 WorkDataSet.ParamByName('ID_MO').Value:=ID_MO;
 WorkDataSet.CloseOpen(false);
end;

procedure TDocWorkMolOborotForm.FormCreate(Sender: TObject);
begin
 cxGridDBTableView1SCH_NUMBER.Caption:=MAT_STR_COL_SCH;
 cxGridDBTableView1KOL_PRH.Caption:=MAT_STR_COL_PRH_KOL;
 cxGridDBTableView1KOL_RSH.Caption:=MAT_STR_COL_RSH_KOL;
 cxGridDBTableView1SUMM_PRH.Caption:=MAT_STR_COL_PRH_SUM;
 cxGridDBTableView1SUMM_RSH.Caption:=MAT_STR_COL_RSH_SUM;
 RefreshButton.Hint:=MAT_ACTION_REFRESH_CONST;
 PrintButton.Hint:=MAT_ACTION_PRINT_CONST;
 CancelButton.Hint:=MAT_BUTTON_EXIT_CONST;
 acExit.Caption:=MAT_BUTTON_EXIT_CONST;
 acRefresh.Caption:=MAT_ACTION_REFRESH_CONST;
 acPrint.Caption:=MAT_ACTION_PRINT_CONST;
 CancelButton.Caption:='';
 RefreshButton.Caption:='';
 PrintButton.Caption:='';
end;

procedure TDocWorkMolOborotForm.acExitExecute(Sender: TObject);
begin
 Close;
end;

procedure TDocWorkMolOborotForm.acRefreshExecute(Sender: TObject);
begin
 WorkDataSet.CloseOpen(false);
end;

procedure TDocWorkMolOborotForm.acPrintExecute(Sender: TObject);
begin
 frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\docoborot.frf');
 frVariables['MOL']:=cxMatOtv.Text;
 frVariables['DATE_BEG']:=DateToStr(DateBeg);
 frVariables['DATE_END']:=DateToStr(DateEnd);
 frReport1.PrepareReport;
 frReport1.ShowReport;
// frReport1.DesignReport;
end;

end.
