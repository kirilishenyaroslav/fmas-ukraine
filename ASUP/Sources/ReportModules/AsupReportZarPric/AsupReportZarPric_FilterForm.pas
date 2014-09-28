unit AsupReportZarPric_FilterForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxDropDownEdit, cxCalendar, ActnList, IBase, uCommonSp,
  Asup_LoaderPrintDocs_Types, Asup_LoaderPrintDocs_Proc,
  Asup_LoaderPrintDocs_WaitForm, ASUP_LoaderPrintDocs_Consts,
  ASUP_LoaderPrintDocs_Messages, cxMRUEdit, cxCheckBox,qftools;

type
  TFormOptions = class(TForm)
    Bevel1: TBevel;
    DateEdit: TcxDateEdit;
    LabelDate: TcxLabel;
    ActionList: TActionList;
    YesAction: TAction;
    CancelAction: TAction;
    Export: TAction;
    YesBtn: TcxButton;
    ExpBtn: TcxButton;
    CancelBtn: TcxButton;
    procedure CancelActionExecute(Sender: TObject);
    procedure YesActionExecute(Sender: TObject);
    procedure ExportExecute(Sender: TObject);
  private
    PDb_Handle:TISC_DB_HANDLE;
    PExp:boolean;
  public
    constructor Create(AParameter:TSimpleParam);reintroduce;
    property Exp:boolean read PExp;
  end;


implementation

{$R *.dfm}
constructor TFormOptions.Create(AParameter:TSimpleParam);
begin
 inherited Create(AParameter.Owner);
 PDb_Handle:=AParameter.DB_Handle;
//******************************************************************************
 Caption := 'Список зареєстрованих наказів';
 YesBtn.Caption := 'Гаразд';
 CancelBtn.Caption := 'Відміна';
 YesBtn.Hint := 'Гаразд';
 CancelBtn.Hint := 'Відміна';
 ExpBtn.Caption := 'Експорт';
 ExpBtn.Hint :='Експорт';
 PExp:=false;
 DateEdit.Date:=Date;
//******************************************************************************
end;

procedure TFormOptions.CancelActionExecute(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TFormOptions.YesActionExecute(Sender: TObject);
begin
ModalResult := mrYes;
end;

procedure TFormOptions.ExportExecute(Sender: TObject);
begin
ModalResult := mrYes;
PExp:=true;
end;

end.
