unit Sp_VidOpl_Corespond_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxTextEdit, cxMaskEdit, cxControls, cxContainer, cxEdit, cxLabel, DB,
  FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, Unit_Sp_VidOpl_Consts, IBase;

type
  TFCorespondEdit = class(TForm)
    LabelNameVidOpl: TcxLabel;
    EditVoName: TcxMaskEdit;
    CorespondComboBox: TcxLookupComboBox;
    LabelCorespond: TcxLabel;
    Bevel1: TBevel;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    DB: TpFIBDatabase;
    DSet: TpFIBDataSet;
    RTransaction: TpFIBTransaction;
    DSource: TDataSource;
    procedure YesBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);reintroduce;
  end;


implementation

{$R *.dfm}

constructor TFCorespondEdit.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 Caption:=FCorespondEdit_Caption;
 YesBtn.Caption:=YesBtn_Caption;
 CancelBtn.Caption:=CancelBtn_Caption;
 LabelNameVidOpl.Caption := FCorespondEdit_LabelVidOplName_Caption;
 LabelCorespond.Caption  := FCorespondEdit_LabelCorespond_Caption;
 DSet.SQLs.SelectSQL.Text:='SELECT * from Z_VOPL_PROP_S_FOR_GROUP(3)';
 DB.Handle:=DB_Handle;
 DSet.Open;
end;

procedure TFCorespondEdit.YesBtnClick(Sender: TObject);
begin
if CorespondComboBox.EditText<>'' then ModalResult:=mrYes
else CorespondComboBox.SetFocus;
end;

end.
