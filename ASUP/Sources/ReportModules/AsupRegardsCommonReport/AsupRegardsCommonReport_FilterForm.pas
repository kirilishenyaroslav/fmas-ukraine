unit AsupRegardsCommonReport_FilterForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxDropDownEdit, cxCalendar, ActnList, IBase, uCommonSp,
  Asup_LoaderPrintDocs_Types, Asup_LoaderPrintDocs_Proc,
  Asup_LoaderPrintDocs_WaitForm, ASUP_LoaderPrintDocs_Consts,
  ASUP_LoaderPrintDocs_Messages, cxMRUEdit, cxCheckBox, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, DB, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet,qftools, frxExportHTML, frxExportXLS, frxClass,
  frxExportRTF;

type
  TFormOptions = class(TForm)
    Bevel1: TBevel;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    ActionList: TActionList;
    YesAction: TAction;
    CancelAction: TAction;
    ComboRegards: TcxLookupComboBox;
    DB: TpFIBDatabase;
    DSet: TpFIBDataSet;
    Tran: TpFIBTransaction;
    DSource: TDataSource;
    cxLabel1: TcxLabel;
    WorkComboBox: TcxComboBox;
    cxLabel2: TcxLabel;
    procedure CancelActionExecute(Sender: TObject);
    procedure YesActionExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    PDb_Handle:TISC_DB_HANDLE;
  public
    constructor Create(AParameter:TSimpleParam);reintroduce;
  end;


implementation

{$R *.dfm}


constructor TFormOptions.Create(AParameter:TSimpleParam);
begin
 inherited Create(AParameter.Owner);
    PDb_Handle:=AParameter.DB_Handle;
    Caption := 'Список працівників, які мають звання або нагороди';
    YesBtn.Caption := 'Гаразд';
    CancelBtn.Caption := 'Відміна';
    YesBtn.Hint := YesBtn.Caption;
    CancelBtn.Hint := CancelBtn.Caption;

    WorkComboBox.Properties.Items.Add('Усі');
    WorkComboBox.Properties.Items.Add('Штатні');
    WorkComboBox.Properties.Items.Add('Зовнiшнi сумiсники');

    DB.Handle := AParameter.DB_Handle;
    DSet.SQLs.SelectSQL.Text := 'SELECT first(4) * FROM SP_REG_GROUPS';
    DSet.Open;
end;

procedure TFormOptions.CancelActionExecute(Sender: TObject);
begin
    ModalResult:=mrCancel;
end;

procedure TFormOptions.YesActionExecute(Sender: TObject);
begin
    if varIsNUll(ComboRegards.EditValue) then
    begin
        AsupShowMessage(Error_Caption,'Треба обрати тип відзнаки!',mtWarning,[mbOK]);
        Exit;
    end;
    ModalResult := mrYes;
end;

procedure TFormOptions.FormDestroy(Sender: TObject);
begin
    if Tran.InTransaction then Tran.Commit;
    if DB.Connected then DB.Connected:=False;
end;

end.
