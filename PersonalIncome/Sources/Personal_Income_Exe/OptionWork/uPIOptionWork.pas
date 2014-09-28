unit uPIOptionWork;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxLabel, StdCtrls, cxButtons, ActnList,
  DB, FIBDataSet, pFIBDataSet, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox,AArray, ComCtrls;

type
  TFormOptionWork = class(TForm)
    PageControl1: TPageControl;
    TabSheetGodNabora: TTabSheet;
    TabSheetAdminSheet1: TTabSheet;
    cxLookupComboBoxGodNabora: TcxLookupComboBox;
    cxButtonOK: TcxButton;
    cxButtonCansel: TcxButton;
    cxLabelGodNabora: TcxLabel;
    DataSetGodNabora: TpFIBDataSet;
    DataSourceGodNabora: TDataSource;
    ActionListKlassSpravEdit: TActionList;
    ActionOK: TAction;
    ActionCansel: TAction;
    cxButtonINI_KASSA_BANK: TcxButton;
    ActionShowPageToAdmin: TAction;
    cxButtonEditStRpt: TcxButton;
    cxButtonEditFiltr: TcxButton;
    cxButtonZachRules: TcxButton;
    procedure ActionShowPageToAdminExecute(Sender: TObject);
  private
    IndLang:  Integer;
    procedure InicCaption;
  public
    constructor Create(aOwner: TComponent;aParam :TAArray);overload;
  end;

var
  FormOptionWork: TFormOptionWork;

implementation
uses
  uPersonal_income,uPI_Constants,uPI_Resources,uPI_Loader;
{$R *.dfm}

constructor TFormOptionWork.Create(aOwner: TComponent;aParam :TAArray);
begin
    inherited Create(aOwner);
    IndLang:=SelectLanguage;
    InicCaption;
end;

procedure TFormOptionWork.InicCaption;
begin
   TFormOptionWork(Self).Caption:=nFormOptionWork_Caption[IndLang];
   TabSheetAdminSheet1.TabVisible:=false;

   ActionOK.Hint              :=nHintActiont_OK[IndLang];
   ActionCansel.Hint          :=nHintActiont_Cansel[IndLang];
end;

procedure TFormOptionWork.ActionShowPageToAdminExecute(Sender: TObject);
begin
    TabSheetAdminSheet1.TabVisible:=true;
end;

end.
