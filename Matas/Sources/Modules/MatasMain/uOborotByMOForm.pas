{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль просмотра остатков и оборотов                  }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uOborotByMOForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ExtCtrls, cxLookAndFeelPainters, StdCtrls,
  cxButtons, Buttons, cxDBEdit, cxContainer, cxTextEdit, cxMaskEdit,
  cxButtonEdit, FIBDataSet, pFIBDataSet,uResources, uSpMatOtv,
  cxDropDownEdit, cxCalendar, DateUtils, cxGridBandedTableView,
  cxGridDBBandedTableView, FR_DSet, FR_DBSet, FR_Class,
  Menus, ImgList, ibase, FIBDatabase, pFIBDatabase, uMatasVars, cxCheckBox;

type
  TOborotByMoForm = class(TForm)
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
    WorkDataSource: TDataSource;
    Label1: TLabel;
    cxMatOtv: TcxButtonEdit;
    Label2: TLabel;
    cxDateBeg: TcxDateEdit;
    Label3: TLabel;
    ApplyButton: TcxButton;
    WorkDataSetID_MO: TFIBIntegerField;
    WorkDataSetID_NOMN: TFIBIntegerField;
    WorkDataSetNOMN: TFIBStringField;
    WorkDataSetNAME: TFIBStringField;
    WorkDataSetID_UNIT: TFIBIntegerField;
    WorkDataSetUNIT: TFIBStringField;
    WorkDataSetKOL_BEG: TFIBBCDField;
    WorkDataSetKOL_PRH: TFIBBCDField;
    WorkDataSetKOL_RSH: TFIBBCDField;
    WorkDataSetKOL_OST: TFIBBCDField;
    WorkDataSetSUMM_BEG: TFIBBCDField;
    WorkDataSetSUMM_PRH: TFIBBCDField;
    WorkDataSetSUMM_RSH: TFIBBCDField;
    WorkDataSetSUMM_OST: TFIBBCDField;
    cxGrid1: TcxGrid;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView1ID_MO: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1ID_NOMN: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1NOMN: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1NAME: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1ID_UNIT: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1UNIT: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1KOL_BEG: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1KOL_PRH: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1KOL_RSH: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1KOL_OST: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SUMM_BEG: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SUMM_PRH: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SUMM_RSH: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SUMM_OST: TcxGridDBBandedColumn;
    PrintButton: TcxButton;
    ExitButton: TcxButton;
    frReportOborot: TfrReport;
    frDataSetOborot: TfrDBDataSet;
    cxDateEnd: TcxDateEdit;
    WorkDataSetNAME_GROUP: TFIBStringField;
    cxGrid1DBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    ImageList1: TImageList;
    WorkDatabase: TpFIBDatabase;
    WorkTransaction: TpFIBTransaction;
    ButtonUpDate: TSpeedButton;
    ButtonDownDate: TSpeedButton;
    cxCheckFooter: TcxCheckBox;
    procedure cxExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxMatOtvPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure ApplyButtonClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure ButtonUpDateClick(Sender: TObject);
    procedure ButtonDownDateClick(Sender: TObject);
    procedure cxCheckFooterPropertiesChange(Sender: TObject);
  private
    { Private declarations }
   DBHANDLE : TISC_DB_HANDLE;
   ID_USER : Int64;
  public
    { Public declarations }
     ID_MO: integer;
     FioMO, SpodrMO: string;
   constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_USER: int64);overload;
  end;

  procedure ShowOborotByMO(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
  exports ShowOborotByMO;

var
  OborotByMoForm: TOborotByMoForm;

implementation

{$R *.dfm}
procedure ShowOborotByMO(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
begin
 TOborotByMoForm.Create(AOwner, DBHANDLE, aID_USER);
end;

constructor TOborotByMoForm.Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_USER : Int64);
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
   Self.DBHANDLE := DBHandle;
   Self.ID_USER:=ID_USER;
   Self.WorkDatabase.Handle:=DBHANDLE;
 end;
end;

procedure TOborotByMoForm.cxExitButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TOborotByMoForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TOborotByMoForm.cxMatOtvPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res : Variant;
  IsMoOk:boolean;
begin
 IsMoOk:=false;
 Res:=uSpMatOtv.GetMatOtv(self, DBHandle, 0, ID_MO);
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
   WorkDataSet.Close;
   WorkDataSet.ParamByName('ID_MO').Value:=ID_MO;
   WorkDataSet.ParamByName('DATE_BEG').Value:=cxDateBeg.EditValue;
   WorkDataSet.ParamByName('DATE_END').Value:=cxDateEnd.EditValue;
   WorkDataSet.CloseOpen(false);
   cxGrid1DBBandedTableView1.ViewData.Expand(true);
  end;
end;

procedure TOborotByMoForm.FormCreate(Sender: TObject);
begin
 Caption:=MAT_SYS_PREFIX+'Обороты';
 ID_MO:=0;
 FioMO:='';
 SpodrMO:='';
 cxDateBeg.EditValue:=StartOfTheMonth(_MATAS_PERIOD);
 cxDateEnd.EditValue:=EndOfTheMonth(_MATAS_PERIOD);
end;

procedure TOborotByMoForm.ApplyButtonClick(Sender: TObject);
begin
  if ID_MO<>0 then
  begin
   WorkDataSet.Close;
   WorkDataSet.ParamByName('ID_MO').Value:=ID_MO;
   WorkDataSet.ParamByName('DATE_BEG').Value:=cxDateBeg.EditValue;
   WorkDataSet.ParamByName('DATE_END').Value:=cxDateEnd.EditValue;
   WorkDataSet.CloseOpen(false);
   cxGrid1DBBandedTableView1.ViewData.Expand(true);
  end;
end;

procedure TOborotByMoForm.ExitButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TOborotByMoForm.PrintButtonClick(Sender: TObject);
begin
 if WorkDataSet.IsEmpty then exit;
 WorkDataSource.Enabled:=false;
 frVariables['FIO_MO']:=FioMO;
 frVariables['SPODR']:=SpodrMO;
 frVariables['DATE_BEG']:=DateToStr(cxDateBeg.EditValue);
 frVariables['DATE_END']:=DateToStr(cxDateEnd.EditValue);
 frReportOborot.LoadFromFile(ExtractFilePath(Application.ExeName)+_PATH_REPORTS+'\Oborot_mol.frf');
 frReportOborot.PrepareReport;
 frReportOborot.ShowPreparedReport;
// frReportOborot.DesignReport;
 WorkDataSource.Enabled:=true;
end;

procedure TOborotByMoForm.N1Click(Sender: TObject);
begin
//
end;

procedure TOborotByMoForm.N2Click(Sender: TObject);
begin
//
end;

procedure TOborotByMoForm.N4Click(Sender: TObject);
begin
 PrintButtonClick(self);
end;

procedure TOborotByMoForm.ButtonUpDateClick(Sender: TObject);
begin
 cxDateBeg.EditValue:=IncMonth(cxDateBeg.EditValue,-1);
 cxDateEnd.EditValue:=IncMonth(cxDateEnd.EditValue,-1);
end;

procedure TOborotByMoForm.ButtonDownDateClick(Sender: TObject);
begin
 cxDateBeg.EditValue:=IncMonth(cxDateBeg.EditValue,1);
 cxDateEnd.EditValue:=IncMonth(cxDateEnd.EditValue,1);
end;

procedure TOborotByMoForm.cxCheckFooterPropertiesChange(Sender: TObject);
begin
 cxGrid1DBBandedTableView1.OptionsView.Footer:=cxCheckFooter.Checked;
end;

end.
