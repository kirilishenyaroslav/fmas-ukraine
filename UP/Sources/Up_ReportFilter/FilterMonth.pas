unit FilterMonth;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxControls, cxContainer, cxEdit, cxLabel, StdCtrls,
  cxButtons, ComCtrls;

type
  TfrmFilterMonth = class(TForm)
    StatusBar1: TStatusBar;
    cxButtonEnter: TcxButton;
    cxButtonCancel: TcxButton;
    MonthComboBox: TcxComboBox;
    cxLabel1: TcxLabel;
    procedure FormShow(Sender: TObject);
    procedure cxButtonEnterClick(Sender: TObject);
    procedure cxButtonCancelClick(Sender: TObject);
    procedure MonthComboBoxPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFilterMonth: TfrmFilterMonth;
  //Result:Variant;
  CurIndex:Integer;
  CurText:String;
implementation

{$R *.dfm}

procedure TfrmFilterMonth.FormShow(Sender: TObject);
begin
    MonthComboBox.Properties.Items.Add('Січень');
    MonthComboBox.Properties.Items.Add('Лютий');
    MonthComboBox.Properties.Items.Add('Березень');
    MonthComboBox.Properties.Items.Add('Квітень');
    MonthComboBox.Properties.Items.Add('Травень');
    MonthComboBox.Properties.Items.Add('Червень');
    MonthComboBox.Properties.Items.Add('Липень');
    MonthComboBox.Properties.Items.Add('Серпень');
    MonthComboBox.Properties.Items.Add('Вересень');
    MonthComboBox.Properties.Items.Add('Жовтень');
    MonthComboBox.Properties.Items.Add('Листопад');
    MonthComboBox.Properties.Items.Add('Грудень');
    MonthComboBox.ItemIndex:=0;
    CurIndex:=0;
    CurText:='Січень';
end;

procedure TfrmFilterMonth.cxButtonEnterClick(Sender: TObject);
begin
   ModalResult:=mrOk;
end;

procedure TfrmFilterMonth.cxButtonCancelClick(Sender: TObject);
begin
    ModalResult:=mrCancel;
end;

procedure TfrmFilterMonth.MonthComboBoxPropertiesChange(Sender: TObject);
begin
    if MonthComboBox.ItemIndex=-1 then
    begin
       MonthComboBox.ItemIndex:=CurIndex;
       MonthComboBox.Properties.Items.ValueFromIndex[CurIndex];
    end
    else
    begin
       CurIndex:=MonthComboBox.ItemIndex;
       CurText:=MonthComboBox.Properties.Items.ValueFromIndex[CurIndex];
    end;
end;

end.
