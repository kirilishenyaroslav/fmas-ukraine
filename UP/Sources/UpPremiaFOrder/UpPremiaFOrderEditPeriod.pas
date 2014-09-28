unit UpPremiaFOrderEditPeriod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, Buttons, uFControl,
  uLabeledFControl, uSpravControl, uCommonSP, UpPremiaFOrderForm, cxCheckBox,
  cxCurrencyEdit, cxLabel, AppEvnts, ActnList;

type
  TfrmEditPeriod = class(TForm)
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    DateBeg: TcxDateEdit;
    DateEnd: TcxDateEdit;
    Label6: TLabel;
    Label1: TLabel;
    Per_Department: TqFSpravControl;
    EditForAllPeriod: TcxCheckBox;
    RecalcEdit: TcxCurrencyEdit;
    RndComboBox: TcxComboBox;
    EditForRecalc: TcxCheckBox;
    EditForRound: TcxCheckBox;
    GroupBox1: TGroupBox;
    ActionList1: TActionList;
    OKBut: TAction;
    procedure Per_DepartmentOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure FormCreate(Sender: TObject);
    procedure EditForRecalcClick(Sender: TObject);
    procedure EditForRoundClick(Sender: TObject);
    procedure OKButExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmEditPeriod.Per_DepartmentOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
     sp: TSprav;
begin
     sp := GetSprav('SpDepartment');
     if sp <> nil then
     begin
            with sp.Input do
            begin
                  Append;
                  FieldValues['DBHandle']   := Integer(TfmPremiaOrder(self.Owner).WorkDatabase.Handle);
                  FieldValues['Select']     := 1;
                  FieldValues['ShowStyle']  := 0;
                  Post;
            end;
            sp.Show;

            if ( sp.Output <> nil ) and not sp.Output.IsEmpty
            then begin
                      Value := sp.Output['ID_DEPARTMENT'];
                      DisplayText := sp.Output['NAME_FULL'];
            end;
     end;
end;

procedure TfrmEditPeriod.FormCreate(Sender: TObject);
begin
    if (TfmPremiaOrder(self.Owner).IdType.ItemIndex=1) then Per_Department.Blocked:=False;
    if (TfmPremiaOrder(self.Owner).IdType.ItemIndex=0) then Per_Department.Blocked:=True;

end;

procedure TfrmEditPeriod.EditForRecalcClick(Sender: TObject);
begin
   RecalcEdit.Enabled:=EditForRecalc.Checked;
end;

procedure TfrmEditPeriod.EditForRoundClick(Sender: TObject);
begin
  RndComboBox.Enabled:=EditForRound.Checked;
end;

procedure TfrmEditPeriod.OKButExecute(Sender: TObject);
begin
     ModalResult:=mrOk;
end;

end.
