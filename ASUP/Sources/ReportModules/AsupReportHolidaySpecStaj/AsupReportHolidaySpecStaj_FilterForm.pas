unit AsupReportHolidaySpecStaj_FilterForm;

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
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    cxLabel1: TcxLabel;
    ActionList: TActionList;
    YesAction: TAction;
    CancelAction: TAction;
    DesRep: TAction;
    cxSpinYear: TcxSpinEdit;
    procedure CancelActionExecute(Sender: TObject);
    procedure YesActionExecute(Sender: TObject);
    procedure cxSpinYearKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxSpinYearKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DesRepExecute(Sender: TObject);
  private
    PDb_Handle:TISC_DB_HANDLE;
    PDesignRep: Boolean;
    Pyears:integer;
  public
    constructor Create(AParameter:TSimpleParam);reintroduce;
    property DesignRep:Boolean read PDesignRep write PDesignRep;    
  end;


implementation

{$R *.dfm}

constructor TFormOptions.Create(AParameter:TSimpleParam);
var Year, Month, Day :word;
begin
 inherited Create(AParameter.Owner);
 PDb_Handle:=AParameter.DB_Handle;
 Caption := 'Відпустки, що враховуються до спецстажу (форма №62)';
 YesBtn.Caption := 'Гаразд';
 CancelBtn.Caption := 'Відміна';
 YesBtn.Hint := YesBtn.Caption;
 CancelBtn.Hint := CancelBtn.Caption;
 PDesignRep:=false;
 DecodeDate(Date, Year, Month, Day);
 cxSpinYear.Value:=year;
end;

procedure TFormOptions.CancelActionExecute(Sender: TObject);
begin
    ModalResult:=mrCancel;
end;

procedure TFormOptions.YesActionExecute(Sender: TObject);
begin
if cxSpinYear.Value<=0 then
begin
    AsupShowMessage(Error_Caption,'Рік не може бути менше нуля!',mtWarning,[mbOK]);
    Exit;
end;

ModalResult := mrYes;
end;

procedure TFormOptions.cxSpinYearKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   Pyears:=cxSpinYear.Value;
end;

procedure TFormOptions.cxSpinYearKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   Pyears:=cxSpinYear.Value;
end;

procedure TFormOptions.DesRepExecute(Sender: TObject);
begin
    PDesignRep:=not PDesignRep;
end;


end.
