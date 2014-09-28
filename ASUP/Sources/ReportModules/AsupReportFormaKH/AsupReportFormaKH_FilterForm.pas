unit AsupReportFormaKH_FilterForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxDropDownEdit, cxCalendar, ActnList, IBase, uCommonSp,
  Asup_LoaderPrintDocs_Types, Asup_LoaderPrintDocs_Proc,
  Asup_LoaderPrintDocs_WaitForm, ASUP_LoaderPrintDocs_Consts,
  ASUP_LoaderPrintDocs_Messages, cxMRUEdit, cxCheckBox, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, DB, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet,qftools;

type
  TFormOptions = class(TForm)
    Bevel1: TBevel;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    ActionList: TActionList;
    YesAction: TAction;
    CancelAction: TAction;
    LabelDateForm: TcxLabel;
    DateEdit: TcxDateEdit;
    cxLabel1: TcxLabel;
    StupComboBox: TcxComboBox;
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
    Caption := 'Форма КН';
    YesBtn.Caption := 'Гаразд';
    CancelBtn.Caption := 'Відміна';
    YesBtn.Hint := YesBtn.Caption;
    CancelBtn.Hint := CancelBtn.Caption;

    StupComboBox.Properties.Items.Add('Кандидат');
    StupComboBox.Properties.Items.Add('Доктор');

    DateEdit.Date:=Date;
end;

procedure TFormOptions.CancelActionExecute(Sender: TObject);
begin
    ModalResult:=mrCancel;
end;

procedure TFormOptions.YesActionExecute(Sender: TObject);
begin
    if varIsNUll(StupComboBox.EditValue) then
    begin
        AsupShowMessage(Error_Caption,'Треба обрати вчений ступінь!',mtWarning,[mbOK]);
        Exit;
    end;

    ModalResult := mrYes;
end;

end.
