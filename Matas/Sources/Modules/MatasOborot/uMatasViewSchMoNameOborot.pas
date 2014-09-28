{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль работы с оборотами                             }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uMatasViewSchMoNameOborot;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxLabel,
  cxContainer, cxTextEdit, cxDBEdit, cxGroupBox, FIBDataSet, pFIBDataSet,
  ImgList, ActnList, cxGridTableView, frxClass, frxDesgn, frxDBSet,
  cxGridLevel, cxGridCustomTableView, cxGridBandedTableView,
  cxGridDBBandedTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, cxButtons, ExtCtrls;

type
  TViewSchMoNameOborotForm = class(TForm)
    Panel1: TPanel;
    ApplyButton: TcxButton;
    PrintButton: TcxButton;
    ExitButton: TcxButton;
    cxGridIOborotSchMoName: TcxGrid;
    cxGridIOborotSchMoNameDBBandedTableView1: TcxGridDBBandedTableView;
    colSName: TcxGridDBBandedColumn;
    colKOL_BEG: TcxGridDBBandedColumn;
    colSUMMA_BEG: TcxGridDBBandedColumn;
    colKOL_PRH: TcxGridDBBandedColumn;
    colSUMMA_PRH: TcxGridDBBandedColumn;
    colKOL_RSH: TcxGridDBBandedColumn;
    colSUMMA_RSH: TcxGridDBBandedColumn;
    colKOL_END: TcxGridDBBandedColumn;
    colSUMMA_END: TcxGridDBBandedColumn;
    colUnit: TcxGridDBBandedColumn;
    colPrice: TcxGridDBBandedColumn;
    cxGridIOborotSchMoNameLevel1: TcxGridLevel;
    frxDBDatasetSchMoNameOborot: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
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
    ImageList: TImageList;
    pFIBDataSetOborotSchMoName: TpFIBDataSet;
    DataSourceOborotSchMoName: TDataSource;
    cxGroupBoxSchMo: TcxGroupBox;
    cxDBTextEditMol: TcxDBTextEdit;
    cxLabelMol: TcxLabel;
    ActionList1: TActionList;
    ActionObnov: TAction;
    ActionPrint: TAction;
    ActionExit: TAction;
    pFIBDataSetOborotSchMoNameBAL_ID_SCH: TFIBBCDField;
    pFIBDataSetOborotSchMoNameBAL_SCH_NUMBER: TFIBStringField;
    pFIBDataSetOborotSchMoNameBAL_SCH_TITLE: TFIBStringField;
    pFIBDataSetOborotSchMoNameID_SCH: TFIBBCDField;
    pFIBDataSetOborotSchMoNameSCH_TITLE: TFIBStringField;
    pFIBDataSetOborotSchMoNameSCH_NUMBER: TFIBStringField;
    pFIBDataSetOborotSchMoNameID_MO: TFIBBCDField;
    pFIBDataSetOborotSchMoNameFIO: TFIBStringField;
    pFIBDataSetOborotSchMoNameSFIO: TFIBStringField;
    pFIBDataSetOborotSchMoNameNAME_DEPARTMENT: TFIBStringField;
    pFIBDataSetOborotSchMoNameID_NOMN: TFIBBCDField;
    pFIBDataSetOborotSchMoNameNOMN: TFIBStringField;
    pFIBDataSetOborotSchMoNameNAME: TFIBStringField;
    pFIBDataSetOborotSchMoNamePRICE: TFIBBCDField;
    pFIBDataSetOborotSchMoNameID_UNIT: TFIBIntegerField;
    pFIBDataSetOborotSchMoNameUNIT: TFIBStringField;
    pFIBDataSetOborotSchMoNameUNIT_NAME: TFIBStringField;
    pFIBDataSetOborotSchMoNameKOL_BEG: TFIBBCDField;
    pFIBDataSetOborotSchMoNameSUMMA_BEG: TFIBBCDField;
    pFIBDataSetOborotSchMoNameKOL_PRH: TFIBBCDField;
    pFIBDataSetOborotSchMoNameSUMMA_PRH: TFIBBCDField;
    pFIBDataSetOborotSchMoNameKOL_RSH: TFIBBCDField;
    pFIBDataSetOborotSchMoNameSUMMA_RSH: TFIBBCDField;
    pFIBDataSetOborotSchMoNameKOL_END: TFIBBCDField;
    pFIBDataSetOborotSchMoNameSUMMA_END: TFIBBCDField;
    frxReportSchMoNameOborot: TfrxReport;
    procedure InicCaption;
    procedure ApplyButtonClick(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure frxReportSchMoNameOborotGetValue(const VarName: String;
      var Value: Variant);
  private
       id_for_locate: int64;
  public
       constructor Create(aOwner:TComponent; P_ID_MO : int64);
  end;

var
  ViewSchMoNameOborotForm: TViewSchMoNameOborotForm;

implementation
uses
   uMatasViewSchOborot,uResources,uMatasOborot,uMatasOborotPrintForm,uMatasVars;

{$R *.dfm}

constructor TViewSchMoNameOborotForm.Create(aOwner:TComponent; P_ID_MO : int64);
begin
  inherited Create(aOwner);
  InicCaption;
  pFIBDataSetOborotSchMoName.Active:=false;
  pFIBDataSetOborotSchMoName.SelectSQL.Clear;
  pFIBDataSetOborotSchMoName.SQLs.SelectSQL.Text  :='Select * from MAT_GET_OBOROT_BY_SCH_NAME(:ID_SESSION,:PID_SCH) WHERE ID_MO=:P_ID_MO';
  pFIBDataSetOborotSchMoName.ParamByName('ID_SESSION').AsInt64 :=15362;//TOborotForm(self.Owner.Owner.Owner).ID_SESSION;
  pFIBDataSetOborotSchMoName.ParamByName('PID_SCH').AsInt64    :=TViewSchOborotForm(self.Owner.owner).ParamPID_SCH;
  pFIBDataSetOborotSchMoName.ParamByName('P_ID_MO').AsInt64    :=P_ID_MO;
  pFIBDataSetOborotSchMoName.CloseOpen(false);
  cxGridIOborotSchMoNameDBBandedTableView1.ViewData.Expand(true);
end;

procedure TViewSchMoNameOborotForm.InicCaption;
begin
  TViewSchMoNameOborotForm(self).Caption:=TViewSchOborotForm(self.Owner.owner).WorkDataSet.FBN('SCH_TITLE').AsString +
                                      ' - '+TViewSchOborotForm(self.Owner.owner).WorkDataSet.FBN('SCH_NUMBER').AsString ;  

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

procedure TViewSchMoNameOborotForm.ApplyButtonClick(Sender: TObject);
begin
 pFIBDataSetOborotSchMoName.CloseOpen(false);
 cxGridIOborotSchMoNameDBBandedTableView1.ViewData.Expand(true);
end;

procedure TViewSchMoNameOborotForm.PrintButtonClick(Sender: TObject);
Var
  T :TMatasOborotPrintForm;
begin
  id_for_locate:=pFIBDataSetOborotSchMoName.FieldValues['ID_NOMN'];
  DataSourceOborotSchMoName.Enabled:=false;
  T:=TMatasOborotPrintForm.Create(self, TViewSchOborotForm(self.Owner.owner).WorkDatabase.Handle,'Oborot_SCH_MO_Name',frxReportSchMoNameOborot);
  T.ShowModal;
  T.Free;
  pFIBDataSetOborotSchMoName.Locate('ID_NOMN',id_for_locate, []);
  DataSourceOborotSchMoName.Enabled:=true;
end;

procedure TViewSchMoNameOborotForm.ExitButtonClick(Sender: TObject);
begin
    close;
end;



procedure TViewSchMoNameOborotForm.frxReportSchMoNameOborotGetValue(
  const VarName: String; var Value: Variant);
Var
    Month :String;
    Year  :Word;
begin
   if VarName = 'MONTHBEG'          then Value :=AnsiUpperCase(TOborotForm(self.owner.owner.Owner).MonthBeg);
   if VarName = 'MONTHEND'          then Value :=AnsiUpperCase(TOborotForm(self.owner.owner.Owner).MonthEnd);
   if VarName = 'YEARBEG'           then Value :=FloatToStr(TOborotForm(self.owner.owner.Owner).YearBeg);
   if VarName = 'YEAREND'           then Value :=FloatToStr(TOborotForm(self.owner.owner.Owner).YearEnd);
   if VarName = 'FullName'          then Value :=_ORG_FULL_NAME;
   if VarName = 'KodOKPO'           then Value :=_ORG_KOD_OKPO;
///////
   Year:=TOborotForm(self.owner.owner.Owner).YearBeg;
   If TOborotForm(self.owner.owner.Owner).MonthBegNumber>9
      then Month:=IntToStr(TOborotForm(self.owner.Owner.owner).MonthBegNumber)
      else Month:='0'+ IntToStr(TOborotForm(self.owner.Owner.owner).MonthBegNumber);
   if VarName = 'NumberDateBeg'     then Value :='01.'+Month+'.'+IntToStr(Year);
////////

    Year:=TOborotForm(self.owner.owner.Owner).YearBeg;
    If (TOborotForm(self.owner.owner.Owner).MonthEndNumber+1)>9
      then begin
         if TOborotForm(self.owner.owner.Owner).MonthEndNumber=12
          then begin
             Month :='01';
             Year  :=Year+1;
          end
          else  Month:=IntToStr(TOborotForm(self.owner.Owner.owner).MonthEndNumber+1);
      end
      else Month:='0'+ IntToStr(TOborotForm(self.owner.Owner.owner).MonthEndNumber+1);

   if VarName = 'NumberDateEnd'     then Value :='01.'+Month+'.'+IntTostr(Year);
end;

end.
