{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль работы с оборотами                             }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uMatasViewSchNameOborot;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, frxDesgn,
  frxClass, frxDBSet, cxGridTableView, ActnList, FIBDataSet, pFIBDataSet,
  ImgList, cxGridLevel, cxGridCustomTableView, cxGridBandedTableView,
  cxGridDBBandedTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, cxButtons, ExtCtrls, cxLabel, cxContainer, cxTextEdit,
  cxDBEdit, cxGroupBox;

type
  TViewSchNameOborotForm = class(TForm)
    Panel1: TPanel;
    ApplyButton: TcxButton;
    PrintButton: TcxButton;
    ExitButton: TcxButton;
    cxGridIOborotSchName: TcxGrid;
    cxGridIOborotSchNameDBBandedTableView1: TcxGridDBBandedTableView;
    colSName: TcxGridDBBandedColumn;
    colKOL_BEG: TcxGridDBBandedColumn;
    colSUMMA_BEG: TcxGridDBBandedColumn;
    colKOL_PRH: TcxGridDBBandedColumn;
    colSUMMA_PRH: TcxGridDBBandedColumn;
    colKOL_RSH: TcxGridDBBandedColumn;
    colSUMMA_RSH: TcxGridDBBandedColumn;
    colKOL_END: TcxGridDBBandedColumn;
    colSUMMA_END: TcxGridDBBandedColumn;
    cxGridIOborotSchNameLevel1: TcxGridLevel;
    ImageList: TImageList;
    pFIBDataSetOborotSchName: TpFIBDataSet;
    DataSourceOborotSchName: TDataSource;
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
    frxDBDatasetSchNameOborot: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    cxGroupBoxSchMo: TcxGroupBox;
    cxDBTextEditMol: TcxDBTextEdit;
    cxLabelMol: TcxLabel;
    colUnit: TcxGridDBBandedColumn;
    colPrice: TcxGridDBBandedColumn;
    ActionList1: TActionList;
    ActionObnov: TAction;
    ActionPrint: TAction;
    ActionExit: TAction;
    pFIBDataSetOborotSchNameBAL_ID_SCH: TFIBBCDField;
    pFIBDataSetOborotSchNameBAL_SCH_NUMBER: TFIBStringField;
    pFIBDataSetOborotSchNameBAL_SCH_TITLE: TFIBStringField;
    pFIBDataSetOborotSchNameID_SCH: TFIBBCDField;
    pFIBDataSetOborotSchNameSCH_TITLE: TFIBStringField;
    pFIBDataSetOborotSchNameSCH_NUMBER: TFIBStringField;
    pFIBDataSetOborotSchNameID_MO: TFIBBCDField;
    pFIBDataSetOborotSchNameFIO: TFIBStringField;
    pFIBDataSetOborotSchNameSFIO: TFIBStringField;
    pFIBDataSetOborotSchNameNAME_DEPARTMENT: TFIBStringField;
    pFIBDataSetOborotSchNameID_NOMN: TFIBBCDField;
    pFIBDataSetOborotSchNameNOMN: TFIBStringField;
    pFIBDataSetOborotSchNameNAME: TFIBStringField;
    pFIBDataSetOborotSchNamePRICE: TFIBBCDField;
    pFIBDataSetOborotSchNameID_UNIT: TFIBIntegerField;
    pFIBDataSetOborotSchNameUNIT: TFIBStringField;
    pFIBDataSetOborotSchNameUNIT_NAME: TFIBStringField;
    pFIBDataSetOborotSchNameKOL_BEG: TFIBBCDField;
    pFIBDataSetOborotSchNameSUMMA_BEG: TFIBBCDField;
    pFIBDataSetOborotSchNameKOL_PRH: TFIBBCDField;
    pFIBDataSetOborotSchNameSUMMA_PRH: TFIBBCDField;
    pFIBDataSetOborotSchNameKOL_RSH: TFIBBCDField;
    pFIBDataSetOborotSchNameSUMMA_RSH: TFIBBCDField;
    pFIBDataSetOborotSchNameKOL_END: TFIBBCDField;
    pFIBDataSetOborotSchNameSUMMA_END: TFIBBCDField;
    frxReportSchNameOborot: TfrxReport;
    procedure FormCreate(Sender: TObject);
    procedure InicCaption;
    procedure ApplyButtonClick(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure frxReportSchNameOborotGetValue(const VarName: String;
      var Value: Variant);
  private
     id_for_locate: int64;
  public
    { Public declarations }
  end;

var
  ViewSchNameOborotForm: TViewSchNameOborotForm;

implementation
uses
   uMatasViewSchOborot,uResources,uMatasOborot,uMatasOborotPrintForm,uMatasVars;

{$R *.dfm}

procedure TViewSchNameOborotForm.FormCreate(Sender: TObject);
begin
  InicCaption;
  pFIBDataSetOborotSchName.Active:=false;
  pFIBDataSetOborotSchName.SelectSQL.Clear;
  pFIBDataSetOborotSchName.SQLs.SelectSQL.Text  :='Select * from MAT_GET_OBOROT_BY_SCH_NAME(:ID_SESSION,:PID_SCH)';
  pFIBDataSetOborotSchName.ParamByName('ID_SESSION').AsInt64 :=15362;//TOborotForm(self.Owner.owner).ID_SESSION;
  pFIBDataSetOborotSchName.ParamByName('PID_SCH').AsInt64    :=TViewSchOborotForm(self.Owner).ParamPID_SCH;
  pFIBDataSetOborotSchName.CloseOpen(false);
  cxGridIOborotSchNameDBBandedTableView1.ViewData.Expand(true);
end;

procedure TViewSchNameOborotForm.InicCaption;
begin
  TViewSchNameOborotForm(self).Caption:=TViewSchOborotForm(self.Owner).WorkDataSet.FBN('SCH_TITLE').AsString +
                                      ' - '+TViewSchOborotForm(self.Owner).WorkDataSet.FBN('SCH_NUMBER').AsString ; 

  ApplyButton.Caption      :=MAT_ACTION_REFRESH_CONST;
  PrintButton.Caption      :=MAT_ACTION_PRINT_CONST;
  ExitButton.Caption       :=MAT_ACTION_CLOSE_CONST;

  colSName.Caption         :=MAT_STR_COL_NAME;
  colUnit.Caption          :=MAT_STR_COL_NAME_UNIT;
  colPrice.Caption         :=MAT_STR_COL_PRICE;
  colKOL_BEG.Caption       :=MAT_STR_COL_KOL_BEG;
  colSUMMA_BEG.Caption     :=MAT_STR_COL_SUM_BEG;
  colKOL_PRH.Caption       :=MAT_STR_COL_PRH_KOL;
  colSUMMA_PRH.Caption     :=MAT_STR_COL_PRH_SUM;
  colKOL_RSH.Caption       :=MAT_STR_COL_RSH_KOL;
  colSUMMA_RSH.Caption     :=MAT_STR_COL_RSH_SUM;
  colKOL_END.Caption       :=MAT_STR_COL_KOL_END;
  colSUMMA_END.Caption     :=MAT_STR_COL_SUM_END;

  cxLabelMol.Caption       :=MAT_STR_COL_MOL;
end;

procedure TViewSchNameOborotForm.ApplyButtonClick(Sender: TObject);
begin
 pFIBDataSetOborotSchName.CloseOpen(false);
 cxGridIOborotSchNameDBBandedTableView1.ViewData.Expand(true);
end;

procedure TViewSchNameOborotForm.PrintButtonClick(Sender: TObject);
Var
  T :TMatasOborotPrintForm;
begin
  id_for_locate:=pFIBDataSetOborotSchName.FieldValues['ID_NOMN'];
  DataSourceOborotSchName.Enabled:=false;
  T:=TMatasOborotPrintForm.Create(self, TViewSchOborotForm(self.Owner).WorkDatabase.Handle,'Oborot_SCH_Name',frxReportSchNameOborot);
  T.ShowModal;
  T.Free;
  pFIBDataSetOborotSchName.Locate('ID_NOMN',id_for_locate, []);
  DataSourceOborotSchName.Enabled:=true;
end;

procedure TViewSchNameOborotForm.ExitButtonClick(Sender: TObject);
begin
     close;
end;

procedure TViewSchNameOborotForm.frxReportSchNameOborotGetValue(
  const VarName: String; var Value: Variant);
Var
    Month :String;
    Year  :Word;
begin
   if VarName = 'MONTHBEG'          then Value :=AnsiUpperCase(TOborotForm(self.owner.owner).MonthBeg);
   if VarName = 'MONTHEND'          then Value :=AnsiUpperCase(TOborotForm(self.owner.owner).MonthEnd);
   if VarName = 'YEARBEG'           then Value :=FloatToStr(TOborotForm(self.owner.owner).YearBeg);
   if VarName = 'YEAREND'           then Value :=FloatToStr(TOborotForm(self.owner.owner).YearEnd);
   if VarName = 'FullName'          then Value :=_ORG_FULL_NAME;
   if VarName = 'KodOKPO'           then Value :=_ORG_KOD_OKPO;
///////
   Year:=TOborotForm(self.owner.owner).YearBeg;
   If TOborotForm(self.owner.owner).MonthBegNumber>9
      then Month:=IntToStr(TOborotForm(self.owner.owner).MonthBegNumber)
      else Month:='0'+ IntToStr(TOborotForm(self.owner.owner).MonthBegNumber);
   if VarName = 'NumberDateBeg'     then Value :='01.'+Month+'.'+IntToStr(Year);
////////

    Year:=TOborotForm(self.owner.owner).YearBeg;
    If (TOborotForm(self.owner.owner).MonthEndNumber+1)>9
      then begin
         if TOborotForm(self.owner.owner).MonthEndNumber=12
          then begin
             Month :='01';
             Year  :=Year+1;
          end
          else  Month:=IntToStr(TOborotForm(self.owner.owner).MonthEndNumber+1);
      end
      else Month:='0'+ IntToStr(TOborotForm(self.owner.owner).MonthEndNumber+1);

   if VarName = 'NumberDateEnd'     then Value :='01.'+Month+'.'+IntTostr(Year);
end;

end.
