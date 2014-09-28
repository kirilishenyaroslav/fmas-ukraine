unit UoOptionWork;

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
    ActionShowPageToAdmin: TAction;
    procedure ActionOKExecute(Sender: TObject);
    procedure ActionCanselExecute(Sender: TObject);
    procedure ActionShowPageToAdminExecute(Sender: TObject);
  private
    IndLang:  Integer;
    procedure InicCaption;
  public
    constructor Create(aOwner: TComponent;aParam :TAArray);reintroduce;
  end;

var
  FormOptionWork: TFormOptionWork;

implementation
uses
  UOMainForm,uUO_Resources,uUO_Loader,uUO_Constants;
{$R *.dfm}

constructor TFormOptionWork.Create(aOwner: TComponent;aParam :TAArray);
begin
    inherited Create(aOwner);
    IndLang:=SelectLanguage;

    DataSetGodNabora.Active                         :=false;
    DataSetGodNabora.Database                       :=TfmUOMainForm(self.Owner).Database;
    DataSetGodNabora.Transaction                    :=TfmUOMainForm(self.Owner).pFIBTransaction1;
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

procedure TFormOptionWork.ActionShowPageToAdminExecute(Sender: TObject);
begin
    TabSheetAdminSheet1.TabVisible:=true;
end;

end.
