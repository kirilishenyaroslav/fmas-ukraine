unit BsLgotPeriods;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxControls, cxContainer, cxEdit,
  cxLabel, cxCheckBox, uConsts, uCommon_Funcs, uCommon_Loader, uCommon_Types,
  iBase;

type
  TfrmLgotPeriod = class(TForm)
    lblDateBeg: TcxLabel;
    lblDateEnd: TcxLabel;
    DateBeg: TcxDateEdit;
    DateEnd: TcxDateEdit;
    btnOk: TcxButton;
    btnCancel: TcxButton;
    FullPeriod: TcxCheckBox;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FullPeriodPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent; DbHandle:TISC_DB_HANDLE);reintroduce;
  end;

var
  frmLgotPeriod: TfrmLgotPeriod;

implementation

{$R *.dfm}

constructor TfrmLgotPeriod.Create(AOwner:TComponent; DbHandle:TISC_DB_HANDLE);
var //HtKey:TbsShortCut;
    iLang:Byte;
begin
   inherited Create(AOwner);
   //HtKey:=LoadShortCut(DbHandle, AOwner);
   iLang:=uCommon_Funcs.bsLanguageIndex();
   btnCancel.Caption:=uConsts.bs_Cancel[iLang];
   btnOk.Caption:=uConsts.bs_Accept[iLang];
end;

procedure TfrmLgotPeriod.btnOkClick(Sender: TObject);
begin
   ModalResult:=mrOk;
end;

procedure TfrmLgotPeriod.btnCancelClick(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

procedure TfrmLgotPeriod.FullPeriodPropertiesChange(Sender: TObject);
begin
   DateBeg.Enabled:=not FullPeriod.Checked;
   DateEnd.Enabled:=not FullPeriod.Checked;
end;

end.
