unit f1df_Insertm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxRadioGroup,
  cxTextEdit, cxMaskEdit, cxSpinEdit, cxControls, cxContainer, cxEdit,
  cxLabel, ExtCtrls, ibase, ZProc, Unit_ZGlobal_Consts, PackageLoad,
  f1df_AddOstm;

type
  TFInsert = class(TForm)
    Bevel1: TBevel;
    LabelKvartal: TcxLabel;
    LabelYear: TcxLabel;
    RadioRee: TcxRadioButton;
    RadioOst: TcxRadioButton;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    procedure CancelBtnClick(Sender: TObject);
    procedure YesBtnClick(Sender: TObject);
  private
    PLanguageIndex:Byte;
    PDb_Handle:TISC_DB_HANDLE;
    ID:integer;
  public
    constructor Create(AOwner:TComponent;ADB_handle:TISC_DB_HANDLE;Id_1df:integer;Kvartal:integer;Year:integer);reintroduce;
  end;

implementation

{$R *.dfm}

constructor TFInsert.Create(AOwner:TComponent;ADB_handle:TISC_DB_HANDLE;Id_1df:integer;Kvartal:integer;Year:integer);
begin
 inherited Create(AOwner);
 PDb_Handle := ADB_handle;
 PLanguageIndex := LanguageIndex;
 ID:=Id_1df;

 Caption := Caption_Insert[PLanguageIndex];
 LabelYear.Caption := LabelYear_Caption[PLanguageIndex]+' '+IntToStr(Year);
 LabelKvartal.Caption := LabelKvartal_Caption[PLanguageIndex]+' '+IntToStr(Kvartal);
 RadioRee.Caption     := Reestr_Const[PLanguageIndex];
 RadioOst.Caption     := Ostatok_Const[PLanguageIndex];


 YesBtn.Caption := YesBtn_Caption[PLanguageIndex];
 CancelBtn.Caption := CancelBtn_Caption[PLanguageIndex];
end;

procedure TFInsert.CancelBtnClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TFInsert.YesBtnClick(Sender: TObject);
var Form: TFAddOst;
begin
  if RadioRee.Checked=true then
    LoadReeVed(self,PDb_Handle,ID)
  else
  begin
    Form:= TFAddOst.Create(self,PDb_Handle,ID);
    Form.ShowModal;
  end;
  ModalResult:=mrYes;
end;

end.
