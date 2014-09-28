unit uOptionWork;

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
    procedure ActionOKExecute(Sender: TObject);
    procedure ActionCanselExecute(Sender: TObject);
    procedure cxButtonINI_KASSA_BANKClick(Sender: TObject);
    procedure ActionShowPageToAdminExecute(Sender: TObject);
    procedure cxButtonEditStRptClick(Sender: TObject);
    procedure cxButtonEditFiltrClick(Sender: TObject);
    procedure cxButtonZachRulesClick(Sender: TObject);
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
  uPrK,uConstants,uPrK_Resources,uPrK_Loader;
{$R *.dfm}

constructor TFormOptionWork.Create(aOwner: TComponent;aParam :TAArray);
begin
    inherited Create(aOwner);
    IndLang:=SelectLanguage;

    DataSetGodNabora.Active                         :=false;
    DataSetGodNabora.Database                       :=TFormPrK(self.Owner).Database;
    DataSetGodNabora.Transaction                    :=TFormPrK(self.Owner).ReadTransaction;
    DataSetGodNabora.SelectSQL.Clear;
    DataSetGodNabora.SQLs.SelectSQL.Text            :='Select * from PRK_SP_GOD_NABORA_SELECT';
    DataSetGodNabora.CloseOpen(false);
    DataSetGodNabora.Locate('ID_SP_GOD_NABORA',aParam['Input']['GodNabora'].AsInt64,[]);
    cxLookupComboBoxGodNabora.Text:=aParam['Input']['NameGodNabora'].AsString;

    InicCaption;
end;

procedure TFormOptionWork.InicCaption;
begin
   TFormOptionWork(Self).Caption:=nFormOptionWork_Caption[IndLang];
   TabSheetAdminSheet1.TabVisible:=false;

   TabSheetGodNabora.Caption  :=nTabSheetGodNabora[IndLang];
   cxLabelGodNabora.Caption   :=nLabelGodNabora[IndLang];
   ActionOK.Caption           :=nActiont_OK[IndLang];
   ActionCansel.Caption       :=nActiont_Cansel[IndLang];

   ActionOK.Hint              :=nHintActiont_OK[IndLang];
   ActionCansel.Hint          :=nHintActiont_Cansel[IndLang];
end;

procedure TFormOptionWork.ActionOKExecute(Sender: TObject);
begin
    if cxLookupComboBoxGodNabora.Text='' then
     begin
       ShowMessage(nMsgEmptyGodNabora[IndLang]);
       cxLookupComboBoxGodNabora.SetFocus;
       exit;
     end;

     ModalResult:=mrOk;
end;

procedure TFormOptionWork.ActionCanselExecute(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

procedure TFormOptionWork.cxButtonINI_KASSA_BANKClick(Sender: TObject);
var
  InputParam :TAArray;
begin
  InputParam :=TAArray.Create;
    InputParam['Name_Bpl'].AsString                     := 'PrK_Edit_Ini.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(TFormPrK(self.Owner).Database.Handle);
    InputParam['Input']['aFrmStyle'].AsVariant          := fsNormal;
  uPrK_Loader.ShowAllPrkBpl(self,InputParam);
  InputParam.Free;
  InputParam:=Nil;
end;

procedure TFormOptionWork.ActionShowPageToAdminExecute(Sender: TObject);
begin
    TabSheetAdminSheet1.TabVisible:=true;
end;

procedure TFormOptionWork.cxButtonEditStRptClick(Sender: TObject);
var
  InputParam :TAArray;
begin
  InputParam :=TAArray.Create;
    InputParam['Name_Bpl'].AsString                     := 'PrK_Edit_ST_RPT.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(TFormPrK(self.Owner).Database.Handle);
    InputParam['Input']['aFrmStyle'].AsVariant          := fsNormal;
  uPrK_Loader.ShowAllPrkBpl(self,InputParam);
  InputParam.Free;
  InputParam:=Nil;
end;

procedure TFormOptionWork.cxButtonEditFiltrClick(Sender: TObject);
var
  InputParam :TAArray;
begin
  InputParam :=TAArray.Create;
    InputParam['Name_Bpl'].AsString                     := 'PrK_Edit_Filtr.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(TFormPrK(self.Owner).Database.Handle);
    InputParam['Input']['aFrmStyle'].AsVariant          := fsNormal;
    InputParam['Input']['aVibrat'].AsInteger            := 0;
  uPrK_Loader.ShowAllPrkBpl(self,InputParam);
  InputParam.Free;
  InputParam:=Nil;
end;

procedure TFormOptionWork.cxButtonZachRulesClick(Sender: TObject);
var
  InputParam :TAArray;
begin
  InputParam :=TAArray.Create;
    InputParam['Name_Bpl'].AsString                     := 'PRK_ZACH_RULES.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(TFormPrK(self.Owner).Database.Handle);
    InputParam['Input']['aFrmStyle'].AsVariant          := fsNormal;
    InputParam['Input']['GodNabora'].AsInt64            := DataSetGodNabora.FieldValues['ID_SP_GOD_NABORA'];
  uPrK_Loader.ShowAllPrkBpl(self,InputParam);
  InputParam.Free;
  InputParam:=Nil;
end;

end.
