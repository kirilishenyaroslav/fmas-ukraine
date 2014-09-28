{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль работы с оборотами                             }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uMatasViewSchOborot;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxLookAndFeelPainters, StdCtrls,
  cxButtons, ExtCtrls, Menus, FIBDataSet, pFIBDataSet, FIBDatabase,
  pFIBDatabase, ImgList, cxGridTableView, cxGridLevel,
  cxGridCustomTableView, cxGridBandedTableView, cxGridDBBandedTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, uResources, ActnList,
  cxCurrencyEdit, frxClass, frxDBSet, frxDesgn;

type
  TViewSchOborotForm = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
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
    ImageList1: TImageList;
    WorkDatabase: TpFIBDatabase;
    WorkTransaction: TpFIBTransaction;
    WorkDataSet: TpFIBDataSet;
    WorkDataSource: TDataSource;
    Panel1: TPanel;
    ApplyButton: TcxButton;
    PrintButton: TcxButton;
    ExitButton: TcxButton;
    WorkDataSetBAL_ID_SCH: TFIBBCDField;
    WorkDataSetBAL_SCH_NUMBER: TFIBStringField;
    WorkDataSetBAL_SCH_TITLE: TFIBStringField;
    WorkDataSetID_SCH: TFIBBCDField;
    WorkDataSetSCH_TITLE: TFIBStringField;
    WorkDataSetSCH_NUMBER: TFIBStringField;
    WorkDataSetKOL_BEG: TFIBBCDField;
    WorkDataSetSUMMA_BEG: TFIBBCDField;
    WorkDataSetKOL_PRH: TFIBBCDField;
    WorkDataSetSUMMA_PRH: TFIBBCDField;
    WorkDataSetKOL_RSH: TFIBBCDField;
    WorkDataSetSUMMA_RSH: TFIBBCDField;
    WorkDataSetKOL_END: TFIBBCDField;
    WorkDataSetSUMMA_END: TFIBBCDField;
    cxGrid1DBBandedTableView1BAL_ID_SCH: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1BAL_SCH_NUMBER: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1BAL_SCH_TITLE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1ID_SCH: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SCH_TITLE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SCH_NUMBER: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1KOL_BEG: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SUMMA_BEG: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1KOL_PRH: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SUMMA_PRH: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1KOL_RSH: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SUMMA_RSH: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1KOL_END: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SUMMA_END: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn;
    ActionList1: TActionList;
    ActionOborotBySchMo: TAction;
    frxDBDatasetSchOborot: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    cxButtonOborotName: TcxButton;
    ActionObnov: TAction;
    ActionPrint: TAction;
    ActionExit: TAction;
    frxReportSchOborot: TfrxReport;
    procedure ApplyButtonClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Oborot_by_sch_mo;
    procedure ActionOborotBySchMoExecute(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure frxReportSchOborotGetValue(const VarName: String;
      var Value: Variant);
    procedure cxGrid1DBBandedTableView1DblClick(Sender: TObject);
    procedure cxButtonOborotNameClick(Sender: TObject);
  private
    { Private declarations }
    id_for_locate :int64;
  public
   ParamPID_SCH: Int64;
  end;

var
  ViewSchOborotForm: TViewSchOborotForm;

implementation
uses
    uMatasViewSchMoOborot,uMatasOborot,uMatasOborotPrintForm,uMatasVars,uMatasViewSchNameOborot;

{$R *.dfm}

procedure TViewSchOborotForm.ApplyButtonClick(Sender: TObject);
begin
 WorkDataSet.CloseOpen(false);
 cxGrid1DBBandedTableView1.ViewData.Expand(true);
end;

procedure TViewSchOborotForm.ExitButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TViewSchOborotForm.FormCreate(Sender: TObject);
begin
 self.Caption:= MAT_SYSTEM_SHORT_NAME;

 ApplyButton.Caption:=MAT_ACTION_REFRESH_CONST;
 PrintButton.Caption:=MAT_ACTION_PRINT_CONST;
 ExitButton.Caption:=MAT_ACTION_CLOSE_CONST;
 cxGrid1DBBandedTableView1SCH_NUMBER.Caption:=MAT_STR_COL_SCH;
 cxGrid1DBBandedTableView1KOL_BEG.Caption:=MAT_STR_COL_KOL_BEG;
 cxGrid1DBBandedTableView1SUMMA_BEG.Caption:=MAT_STR_COL_SUM_BEG;
 cxGrid1DBBandedTableView1KOL_PRH.Caption:=MAT_STR_COL_PRH_KOL;
 cxGrid1DBBandedTableView1SUMMA_PRH.Caption:=MAT_STR_COL_PRH_SUM;
 cxGrid1DBBandedTableView1KOL_RSH.Caption:=MAT_STR_COL_RSH_KOL;
 cxGrid1DBBandedTableView1SUMMA_RSH.Caption:=MAT_STR_COL_RSH_SUM;
 cxGrid1DBBandedTableView1KOL_END.Caption:=MAT_STR_COL_KOL_END;
 cxGrid1DBBandedTableView1SUMMA_END.Caption:=MAT_STR_COL_SUM_END;
end;

procedure TViewSchOborotForm.Oborot_by_sch_mo;
var
    T: TViewSchMoOborotForm;
begin
  ParamPID_SCH := StrToInt64(WorkDataSet.FBN('ID_SCH').AsString);
  T:=TViewSchMoOborotForm.Create(self);
  T.ShowModal;
  T.Free;
end;

procedure TViewSchOborotForm.ActionOborotBySchMoExecute(Sender: TObject);
begin
    Oborot_by_sch_mo;
end;

procedure TViewSchOborotForm.PrintButtonClick(Sender: TObject);
Var
 T :TMatasOborotPrintForm;
begin
  id_for_locate:=WorkDataSet.FieldValues['ID_SCH'];
  WorkDataSource.Enabled:=false;
  T:=TMatasOborotPrintForm.Create(self,WorkDatabase.Handle,'Oborot_SCH',frxReportSchOborot);
  T.ShowModal;
  T.Free;
  WorkDataSet.Locate('ID_SCH',id_for_locate, []);
  WorkDataSource.Enabled:=true;
end;

procedure TViewSchOborotForm.frxReportSchOborotGetValue(
  const VarName: String; var Value: Variant);
Var
    Month :String;
    Year  :Word;
begin
   if VarName = 'MONTHBEG'          then Value :=AnsiUpperCase(TOborotForm(self.owner).MonthBeg);
   if VarName = 'MONTHEND'          then Value :=AnsiUpperCase(TOborotForm(self.owner).MonthEnd);
   if VarName = 'YEARBEG'           then Value :=FloatToStr(TOborotForm(self.owner).YearBeg);
   if VarName = 'YEAREND'           then Value :=FloatToStr(TOborotForm(self.owner).YearEnd);
   if VarName = 'FullName'          then Value :=_ORG_FULL_NAME;
   if VarName = 'KodOKPO'           then Value :=_ORG_KOD_OKPO;
///////
   Year:=TOborotForm(self.owner).YearBeg;
   If TOborotForm(self.owner).MonthBegNumber>9
      then Month:=IntToStr(TOborotForm(self.owner).MonthBegNumber)
      else Month:='0'+ IntToStr(TOborotForm(self.owner).MonthBegNumber);
   if VarName = 'NumberDateBeg'     then Value :='01.'+Month+'.'+IntToStr(Year);
////////

    Year:=TOborotForm(self.owner).YearBeg;
    If (TOborotForm(self.owner).MonthEndNumber+1)>9
      then begin
         if TOborotForm(self.owner).MonthEndNumber=12
          then begin
             Month :='01';
             Year  :=Year+1;
          end
          else  Month:=IntToStr(TOborotForm(self.owner).MonthEndNumber+1);
      end
      else Month:='0'+ IntToStr(TOborotForm(self.owner).MonthEndNumber+1);

   if VarName = 'NumberDateEnd'     then Value :='01.'+Month+'.'+IntTostr(Year);
end;

procedure TViewSchOborotForm.cxGrid1DBBandedTableView1DblClick(
  Sender: TObject);
begin
    Oborot_by_sch_mo;
end;

procedure TViewSchOborotForm.cxButtonOborotNameClick(Sender: TObject);
Var
  T :TViewSchNameOborotForm;
begin
  ParamPID_SCH := StrToInt64(WorkDataSet.FBN('ID_SCH').AsString);
  T:=TViewSchNameOborotForm.Create(self);
  T.ShowModal;
  T.Free;
end;

end.
