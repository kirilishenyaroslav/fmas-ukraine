unit fmAsupReportCandZaslProf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxDropDownEdit, cxCalendar, ActnList, IBase, uCommonSp,
  Asup_LoaderPrintDocs_Types, Asup_LoaderPrintDocs_Proc,
  Asup_LoaderPrintDocs_WaitForm, ASUP_LoaderPrintDocs_Consts,
  ASUP_LoaderPrintDocs_Messages, cxMRUEdit,qftools;

type
  TFormOptions = class(TForm)
    DateFormEdit: TcxDateEdit;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    LabelDateForm: TcxLabel;
    ActionList: TActionList;
    YesAction: TAction;
    CancelAction: TAction;
    DesRep: TAction;
    FontAction: TAction;
    FontDialogs: TFontDialog;
    FontBtn: TcxButton;
    Bevel1: TBevel;
    procedure CancelActionExecute(Sender: TObject);
    procedure YesActionExecute(Sender: TObject);
    procedure DateFormEditEditing(Sender: TObject; var CanEdit: Boolean);
    procedure FontActionExecute(Sender: TObject);
    procedure DesRepExecute(Sender: TObject);
  private
    PDb_Handle:TISC_DB_HANDLE;
    PDateForm:TDate;
    PDesignRep: Boolean;
    PFontNames:string;
    PFontSizes:integer;
    PFontColors:TColor;
    PFontStyles:TFontStyles;
  public
    constructor Create(AParameter:TSimpleParam);reintroduce;
    property DateForm:Tdate read PDateForm;
    property FontNames:string read PFontNames;
    property FontSizes:integer read PFontSizes;
    property FontColors:TColor read PFontColors;
    property FontStyles:TFontStyles read PFontStyles;    
    property DesignRep:Boolean read PDesignRep write PDesignRep;
  end;


implementation
uses dmAsupReportCandZaslProf;
{$R *.dfm}

constructor TFormOptions.Create(AParameter:TSimpleParam);
begin
    inherited Create(AParameter.Owner);
    PDb_Handle:=DM.DB.Handle;
    Caption := 'Список кандидатів в заслужені професори (форма №13)';
    YesBtn.Caption := 'Гаразд';
    CancelBtn.Caption := 'Відміна';
    FontBtn.Caption := FontBtn_Caption;
    YesBtn.Hint := YesBtn.Caption;
    CancelBtn.Hint := CancelBtn.Caption;
    FontBtn.Hint := FontBtn.Caption;    
    PFontNames:='Times New Roman';
    PFontSizes:=-255;
    PFontColors:=clDefault;    
    LabelDateForm.Caption :='Дата формування:';
    DateFormEdit.Date:=Date;
end;

procedure TFormOptions.CancelActionExecute(Sender: TObject);
begin
    ModalResult:=mrCancel;
end;

procedure TFormOptions.YesActionExecute(Sender: TObject);
begin
    ModalResult := mrYes;
end;

procedure TFormOptions.DateFormEditEditing(Sender: TObject;
  var CanEdit: Boolean);
begin
    PDateForm:=DateFormEdit.Date;
end;

procedure TFormOptions.FontActionExecute(Sender: TObject);
begin
    if FontDialogs.Execute
    then
    begin
        PFontNames := FontDialogs.Font.Name;
        PFontSizes := FontDialogs.Font.Size;
        PFontColors := FontDialogs.Font.Color;
        PFontStyles := FontDialogs.Font.Style;
    end;
end;

procedure TFormOptions.DesRepExecute(Sender: TObject);
begin
    PDesignRep:=not PDesignRep;
end;

end.
