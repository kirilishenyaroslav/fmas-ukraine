unit AsupReportChildren_FilterForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxDropDownEdit, cxCalendar, ActnList, IBase, uCommonSp,
  Asup_LoaderPrintDocs_Types, Asup_LoaderPrintDocs_Proc,
  Asup_LoaderPrintDocs_WaitForm, ASUP_LoaderPrintDocs_Consts,
  ASUP_LoaderPrintDocs_Messages, cxMRUEdit, cxCheckBox, DB, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxSpinEdit;

type
  TFormOptions = class(TForm)
    Bevel1: TBevel;
    ActionList: TActionList;
    YesAction: TAction;
    CancelAction: TAction;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    LabelDateForm: TcxLabel;
    DateEdit: TcxDateEdit;
    procedure CancelActionExecute(Sender: TObject);
    procedure YesActionExecute(Sender: TObject);
  private
    PDb_Handle:TISC_DB_HANDLE;
  public
    constructor Create(AParameter:TSimpleParam);reintroduce;
  end;


implementation

{$R *.dfm}

constructor TFormOptions.Create(AParameter:TSimpleParam);
begin
 inherited Create(AParameter.Owner);
 PDb_Handle:=AParameter.DB_Handle;
 Caption := 'Список дітей співробітників';
 YesBtn.Caption := 'Гаразд';
 CancelBtn.Caption := 'Відміна';
 YesBtn.Hint := YesBtn.Caption;
 CancelBtn.Hint := CancelBtn.Caption;
 DateEdit.Date := Date;
end;

procedure TFormOptions.YesActionExecute(Sender: TObject);
begin
    ModalResult := mrYes;
end;

procedure TFormOptions.CancelActionExecute(Sender: TObject);
begin
    ModalResult:=mrCancel;
end;


end.
