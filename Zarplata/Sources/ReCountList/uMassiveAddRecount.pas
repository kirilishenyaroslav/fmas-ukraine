unit uMassiveAddRecount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxSpinEdit, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, StdCtrls, cxLookAndFeelPainters, cxButtons,
  Unit_RecountConsts, dates,zproc, ibase;

type
  TMassiveAddForm = class(TForm)
    GroupBox1: TGroupBox;
    PeriodBegLabel: TLabel;
    MonthBegCombo: TcxComboBox;
    YearBegCombo: TcxSpinEdit;
    OkBtn: TcxButton;
    CancelBtn: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure OkBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    FMonthBeg:  Integer;
    FYearBeg:   Integer;
    constructor Create(AOwner:TComponent;dbhandle:Tisc_db_handle);reintroduce;

  end;

var
  MassiveAddForm: TMassiveAddForm;

implementation

{$R *.dfm}

constructor TMassiveAddForm.Create(AOwner: TComponent;dbhandle:tisc_db_handle);
begin
     inherited Create(AOwner);

     try
         MonthBegCombo.ItemIndex := YearMonthFromKodSetup(CurrentKodSetup(DbHandle)-1,False)-1;
         YearBegCombo.Value := YearMonthFromKodSetup(CurrentKodSetup(DbHandle));
         except on E:Exception do
         begin

         end;
     end;
end;

procedure TMassiveAddForm.FormCreate(Sender: TObject);
begin
    Self.PeriodBegLabel.Caption:=PeriodBegLabel_Caption;
    Self.OkBtn.Caption:=OkBtn_Caption;
    Self.CancelBtn.Caption:=CancelBtn_Caption;
end;

procedure TMassiveAddForm.OkBtnClick(Sender: TObject);
begin
    FMonthBeg:=StrToInt(MonthBegCombo.Text);
    FYearBeg:= StrToInt(YearBegCombo.Text);

end;

end.
