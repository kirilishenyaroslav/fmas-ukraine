unit AsupBirthDatesReportHeaders_FilterForm;

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
    LabelMonth: TcxLabel;
    MonthComboBox: TcxComboBox;
    cxLabel1: TcxLabel;
    WorkComboBox: TcxComboBox;
    DesRep: TAction;
    procedure CancelActionExecute(Sender: TObject);
    procedure YesActionExecute(Sender: TObject);
    procedure DesRepExecute(Sender: TObject);
  private
    PDb_Handle:TISC_DB_HANDLE;
    PDesignRep: Boolean;
  public

    constructor Create(AParameter:TSimpleParam);reintroduce;
    property DesignRep:Boolean read PDesignRep write PDesignRep;

  end;


implementation

{$R *.dfm}


constructor TFormOptions.Create(AParameter:TSimpleParam);
begin
 inherited Create(AParameter.Owner);
    PDb_Handle:=AParameter.DB_Handle;
    Caption := 'Список днів народження (форма №33)';
    YesBtn.Caption := 'Гаразд';
    CancelBtn.Caption := 'Відміна';
    YesBtn.Hint := YesBtn.Caption;
    CancelBtn.Hint := CancelBtn.Caption;

    WorkComboBox.Properties.Items.Add('Усі');
    WorkComboBox.Properties.Items.Add('Штатні');
    WorkComboBox.Properties.Items.Add('Зовнiшнi сумiсники');

    DateEdit.Date:=Date;
    PDesignRep:=false;
end;

procedure TFormOptions.CancelActionExecute(Sender: TObject);
begin
    ModalResult:=mrCancel;
end;

procedure TFormOptions.YesActionExecute(Sender: TObject);
begin

    if varIsNUll(MonthComboBox.EditValue) then
    begin
        AsupShowMessage(Error_Caption,'Треба обрати місяць!',mtWarning,[mbOK]);
        Exit;
    end;
    ModalResult := mrYes;
end;

procedure TFormOptions.DesRepExecute(Sender: TObject);
begin
    PDesignRep:=not PDesignRep;
end;

end.
