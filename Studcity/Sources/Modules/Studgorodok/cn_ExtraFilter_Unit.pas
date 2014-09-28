unit cn_ExtraFilter_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxRadioGroup,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxCheckBox, cxMaskEdit,
  cxDropDownEdit, cxButtonEdit, Ibase, DB, FIBDataSet, pFIBDataSet, Unit_of_Utilits,
  uCommonSp, cxCalendar, LoadPackegeStudCity;

type
  TfrmExtraFilter = class(TForm)
    GroupBox1: TGroupBox;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    Params_Button: TcxButton;
    Date_Beg_Check: TcxCheckBox;
    Date_beg_z: TcxDateEdit;
    Date_Beg_po: TcxDateEdit;
    Date_End_Check: TcxCheckBox;
    Date_End_Z: TcxDateEdit;
    Date_End_Po: TcxDateEdit;
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure Date_Beg_CheckPropertiesChange(Sender: TObject);
    procedure Date_End_CheckPropertiesChange(Sender: TObject);
    procedure Params_ButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    aHandle : TISC_DB_HANDLE;
    ID_SESSION_FILTER : Int64;
  end;

var
  frmExtraFilter: TfrmExtraFilter;

implementation

uses DataModule1_Unit;

{$R *.dfm}

procedure TfrmExtraFilter.CancelButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmExtraFilter.OkButtonClick(Sender: TObject);
begin
 ModalResult:= MrOk;
end;

procedure TfrmExtraFilter.Date_Beg_CheckPropertiesChange(Sender: TObject);
begin
  If Date_Beg_Check.Checked then
   Begin
    Date_beg_z.Enabled:=true;
    Date_beg_po.Enabled:=true;
   End
  Else
   Begin
    Date_beg_z.Enabled:=False;
    Date_beg_po.Enabled:=False;
   End;
end;

procedure TfrmExtraFilter.Date_End_CheckPropertiesChange(Sender: TObject);
begin
  If Date_End_Check.Checked then
   Begin
    Date_End_z.Enabled:=true;
    Date_End_po.Enabled:=true;
   End
  Else
   Begin
    Date_End_z.Enabled:=False;
    Date_End_po.Enabled:=False;
   End;
end;

procedure TfrmExtraFilter.Params_ButtonClick(Sender: TObject);
begin
  LoadPackegeStudCity.LoadReportsFilter(self, aHandle, ID_SESSION_FILTER);
end;

end.

