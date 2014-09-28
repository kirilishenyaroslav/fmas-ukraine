{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль работы с оборотами                             }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uMatasViewSchMoOborot;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ImgList, cxClasses, cxStyles, cxGridTableView, dxBar,
  dxBarExtDBItems, dxBarExtItems, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxCurrencyEdit, FIBDataSet,
  pFIBDataSet, cxGridLevel, cxGridCustomTableView, cxGridDBTableView,
  cxControls, cxGridCustomView, cxGrid, cxContainer, cxTextEdit, cxDBEdit,
  cxGroupBox, cxLabel, cxGridBandedTableView, cxGridDBBandedTableView,
  cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls, frxDesgn, frxClass,
  frxDBSet;

type
  TViewSchMoOborotForm = class(TForm)
    ActionList1: TActionList;
    ActionObnov: TAction;
    ActionOtmena: TAction;
    cxGridIOborotSchMo: TcxGrid;
    cxGridIOborotSchMoLevel1: TcxGridLevel;
    pFIBDataSetOborotSchMo: TpFIBDataSet;
    DataSourceOborotSchMo: TDataSource;
    cxGroupBoxSchMo: TcxGroupBox;
    cxDBTextEditName_Department: TcxDBTextEdit;
    cxLabelNameDepartment: TcxLabel;
    cxGridIOborotSchMoDBBandedTableView1: TcxGridDBBandedTableView;
    colSFIO: TcxGridDBBandedColumn;
    colKOL_BEG: TcxGridDBBandedColumn;
    colSUMMA_BEG: TcxGridDBBandedColumn;
    colKOL_PRH: TcxGridDBBandedColumn;
    colSUMMA_PRH: TcxGridDBBandedColumn;
    colKOL_RSH: TcxGridDBBandedColumn;
    colSUMMA_RSH: TcxGridDBBandedColumn;
    colSUMMA_END: TcxGridDBBandedColumn;
    colKOL_END: TcxGridDBBandedColumn;
    colPysto: TcxGridDBBandedColumn;
    Panel1: TPanel;
    ApplyButton: TcxButton;
    PrintButton: TcxButton;
    ExitButton: TcxButton;
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
    frxDBDatasetSchMoOborot: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    pFIBDataSetOborotSchMoBAL_ID_SCH: TFIBBCDField;
    pFIBDataSetOborotSchMoBAL_SCH_NUMBER: TFIBStringField;
    pFIBDataSetOborotSchMoBAL_SCH_TITLE: TFIBStringField;
    pFIBDataSetOborotSchMoID_SCH: TFIBBCDField;
    pFIBDataSetOborotSchMoID_MO: TFIBBCDField;
    pFIBDataSetOborotSchMoFIO: TFIBStringField;
    pFIBDataSetOborotSchMoSFIO: TFIBStringField;
    pFIBDataSetOborotSchMoNAME_DEPARTMENT: TFIBStringField;
    pFIBDataSetOborotSchMoSCH_TITLE: TFIBStringField;
    pFIBDataSetOborotSchMoSCH_NUMBER: TFIBStringField;
    pFIBDataSetOborotSchMoKOL_BEG: TFIBBCDField;
    pFIBDataSetOborotSchMoSUMMA_BEG: TFIBBCDField;
    pFIBDataSetOborotSchMoKOL_PRH: TFIBBCDField;
    pFIBDataSetOborotSchMoSUMMA_PRH: TFIBBCDField;
    pFIBDataSetOborotSchMoKOL_RSH: TFIBBCDField;
    pFIBDataSetOborotSchMoSUMMA_RSH: TFIBBCDField;
    pFIBDataSetOborotSchMoKOL_END: TFIBBCDField;
    pFIBDataSetOborotSchMoSUMMA_END: TFIBBCDField;
    frxReportSchMoOborot: TfrxReport;
    cxButtonOborotName: TcxButton;
    ActionPrint: TAction;
    procedure FormCreate(Sender: TObject);
    procedure InicCaption;
    procedure ActionOtmenaExecute(Sender: TObject);
    procedure ActionObnovExecute(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure frxReportSchMoOborotGetValue(const VarName: String;
      var Value: Variant);
    procedure cxButtonOborotNameClick(Sender: TObject);
  private
    id_for_locate: int64;
  public
    { Public declarations }
  end;

var
  ViewSchMoOborotForm: TViewSchMoOborotForm;

implementation
uses
   uMatasViewSchOborot,uResources,uMatasOborot,uMatasOborotPrintForm,uMatasVars,
   uMatasViewSchMoNameOborot;

{$R *.dfm}

procedure TViewSchMoOborotForm.FormCreate(Sender: TObject);
begin
  InicCaption;
  pFIBDataSetOborotSchMo.Active:=false;
  pFIBDataSetOborotSchMo.SelectSQL.Clear;
  pFIBDataSetOborotSchMo.SQLs.SelectSQL.Text  :='Select * from MAT_GET_OBOROT_BY_SCH_MO(:ID_SESSION,:PID_SCH)';
  pFIBDataSetOborotSchMo.ParamByName('ID_SESSION').AsInt64 :=15362;//TOborotForm(self.Owner).ID_SESSION;
  pFIBDataSetOborotSchMo.ParamByName('PID_SCH').AsInt64    :=TViewSchOborotForm(self.Owner).ParamPID_SCH;
  pFIBDataSetOborotSchMo.CloseOpen(false);
  cxGridIOborotSchMoDBBandedTableView1.ViewData.Expand(true);
end;

procedure TViewSchMoOborotForm.InicCaption;
begin
  TViewSchMoOborotForm(self).Caption:=TViewSchOborotForm(self.Owner).WorkDataSet.FBN('SCH_TITLE').AsString +
                                      ' - '+TViewSchOborotForm(self.Owner).WorkDataSet.FBN('SCH_NUMBER').AsString ;

  ApplyButton.Caption      :=MAT_ACTION_REFRESH_CONST;
  PrintButton.Caption      :=MAT_ACTION_PRINT_CONST;
  ExitButton.Caption       :=MAT_ACTION_CLOSE_CONST;

  colSFIO.Caption          :=MAT_STR_COL_MOL;
  colKOL_BEG.Caption       :=MAT_STR_COL_KOL_BEG;
  colSUMMA_BEG.Caption     :=MAT_STR_COL_SUM_BEG;
  colKOL_PRH.Caption       :=MAT_STR_COL_PRH_KOL;
  colSUMMA_PRH.Caption     :=MAT_STR_COL_PRH_SUM;
  colKOL_RSH.Caption       :=MAT_STR_COL_RSH_KOL;
  colSUMMA_RSH.Caption     :=MAT_STR_COL_RSH_SUM;
  colKOL_END.Caption       :=MAT_STR_COL_KOL_END;
  colSUMMA_END.Caption     :=MAT_STR_COL_SUM_END;

  cxLabelNameDepartment.Caption :=MAT_STR_COL_DEP;
end;

procedure TViewSchMoOborotForm.ActionOtmenaExecute(Sender: TObject);
begin
    Close;
end;

procedure TViewSchMoOborotForm.ActionObnovExecute(Sender: TObject);
begin
  pFIBDataSetOborotSchMo.CloseOpen(false);
  cxGridIOborotSchMoDBBandedTableView1.ViewData.Expand(true);
end;

procedure TViewSchMoOborotForm.PrintButtonClick(Sender: TObject);
Var
 T :TMatasOborotPrintForm;
begin
  id_for_locate:=pFIBDataSetOborotSchMo.FieldValues['ID_MO'];
  DataSourceOborotSchMo.Enabled:=false;
  T:=TMatasOborotPrintForm.Create(self, TViewSchOborotForm(self.Owner).WorkDatabase.Handle,'Oborot_SCH_MO',frxReportSchMoOborot);
  T.ShowModal;
  T.Free;
  pFIBDataSetOborotSchMo.Locate('ID_MO',id_for_locate, []);
  DataSourceOborotSchMo.Enabled:=true;
end;

procedure TViewSchMoOborotForm.frxReportSchMoOborotGetValue(
  const VarName: String; var Value: Variant);
Var
    Month             :String;
    Year              :Word;
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

procedure TViewSchMoOborotForm.cxButtonOborotNameClick(Sender: TObject);
var
  T :TViewSchMoNameOborotForm;
begin
  T:=TViewSchMoNameOborotForm.Create(self,pFIBDataSetOborotSchMo.FieldValues['ID_MO']);
  T.ShowModal;
  T.Free;
end;

end.


