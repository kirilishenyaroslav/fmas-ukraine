unit VoplPropGroupControl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls, cxLabel,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  Unit_Sp_VidOpl_Consts, ActnList, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, DB, FIBDataSet, pFIBDataSet,
  FIBDatabase, pFIBDatabase, IBase;

type
  TFVoplPropGroupControl = class(TForm)
    MaskEditFullName: TcxMaskEdit;
    LabelFullName: TcxLabel;
    Bevel1: TBevel;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    ActionList1: TActionList;
    Action1: TAction;
    LabelKod: TcxLabel;
    MaskEditKod: TcxMaskEdit;
    DB: TpFIBDatabase;
    RTransaction: TpFIBTransaction;
    DSet: TpFIBDataSet;
    DSource: TDataSource;
    LabelType: TcxLabel;
    Bevel2: TBevel;
    ComboBoxFilter: TcxLookupComboBox;
    Bevel3: TBevel;
    procedure CancelBtnClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);reintroduce;
  end;

implementation

{$R *.dfm}

constructor TFVoplPropGroupControl.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);
begin
inherited Create(AOwner);
DSet.SQLs.SelectSQL.Text:='SELECT * FROM Z_SP_VOPL_PROP_GROUP_FILTER_S(''T'')';
DB.Handle:=DB_Handle;
DSet.Open;
ComboBoxFilter.EditValue:=3;
YesBtn.Caption        := YesBtn_Caption;
CancelBtn.Caption     := CancelBtn_Caption;
LabelFullName.Caption := VoplPropGroupControl_LabelFullName_Caption;
LabelKod.Caption      := VoplPropGroupControl_LabelKod_Caption;
LabelType.Caption     := VoplPropGroupControl_LabelNameFilter_Caption;
end;

procedure TFVoplPropGroupControl.CancelBtnClick(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TFVoplPropGroupControl.Action1Execute(Sender: TObject);
begin
if (Trim(MaskEditFullName.Text)<>'') or (MaskEditFullName.Enabled=False) then
  begin
   ModalResult:=mrYes;
   Application.MainForm.ActiveMDIChild.SetFocus;
  end
else
   MaskEditFullName.SetFocus;
end;

end.
