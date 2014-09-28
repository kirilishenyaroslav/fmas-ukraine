unit FinFrmEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxTextEdit, cxControls, cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxCheckBox;

type
  TfrmEditFinFrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cbTypeForm: TcxLookupComboBox;
    EdFormTitle: TcxTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cxCheckBox1: TcxCheckBox;
    cbMonthBeg: TcxComboBox;
    cbYearBeg: TcxComboBox;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

uses MainFinFrm, DateUtils, GlobalSpr, Resources_unitb;

{$R *.dfm}

procedure TfrmEditFinFrm.cxButton1Click(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfrmEditFinFrm.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmEditFinFrm.FormCreate(Sender: TObject);
var I:Integer;
begin
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_01));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_02));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_03));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_04));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_05));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_06));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_07));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_08));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_09));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_10));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_11));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_12));

     for i:=0 to YEARS_COUNT do
     begin
          cbYearBeg.Properties.Items.Add(TRIM(IntToStr(BASE_YEAR+i)));
     end;

     for i:=0 to cbYearBeg.Properties.Items.Count-1 do
     begin
           if pos(cbYearBeg.Properties.Items[i],IntToStr(YearOf(Date)))>0
           then begin
              cbYearBeg.ItemIndex:=i;
              break;
           end;
     end;

     cbMonthBeg.ItemIndex:=MonthOf(Date);

     cbTypeForm.Properties.ListSource:=TfrmFinForms(Self.Owner).FrmTypeDataSource;
     cbTypeForm.EditValue:=TfrmFinForms(Self.Owner).FrmTypeDataSource.DataSet.FieldByName('ID_TYPE_FORM').Value;
end;

procedure TfrmEditFinFrm.cxCheckBox1PropertiesChange(Sender: TObject);
begin
     cbMonthBeg.Enabled:=cxCheckBox1.Checked;
end;

end.
