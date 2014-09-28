unit add_predopl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, Mask, ToolEdit,
  CurrEdit, ExtCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxCurrencyEdit, RXSplit, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, DB, cxDBData, cxGridTableView, cxTL, ImgList,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridDBTableView, cxGrid, cxSplitter, dxBar, dxBarExtItems, cxCheckBox;

resourcestring
    errNotPredopl = '¬вед≥ть суму предоплати!';

type
  TFrmAddPredopl = class(TForm)
    Panel1: TPanel;
    Label_vipol: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    CurrencyEdit_sum_predopl: TCurrencyEdit;
    CurrencyEdit_sum_kowt: TCurrencyEdit;
    CurrencyEdit_sum_vipol: TCurrencyEdit;
    CurrencyEdit_sum_opl: TCurrencyEdit;
    LargeImages: TImageList;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    cxStyle47: TcxStyle;
    cxStyle48: TcxStyle;
    cxStyle49: TcxStyle;
    cxStyle50: TcxStyle;
    cxStyle51: TcxStyle;
    cxStyle52: TcxStyle;
    cxStyle53: TcxStyle;
    cxStyle54: TcxStyle;
    cxStyle55: TcxStyle;
    cxStyle56: TcxStyle;
    cxStyle57: TcxStyle;
    cxStyle58: TcxStyle;
    cxStyle59: TcxStyle;
    cxStyle60: TcxStyle;
    cxStyle61: TcxStyle;
    cxStyle62: TcxStyle;
    cxStyle63: TcxStyle;
    cxStyle64: TcxStyle;
    cxStyle65: TcxStyle;
    cxStyle66: TcxStyle;
    cxStyle67: TcxStyle;
    cxStyle68: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    cxSplitter1: TcxSplitter;
    cxButton_ok: TcxButton;
    cxButton_cancel: TcxButton;
    dxBarManager1: TdxBarManager;
    dxBarLargeButton_add: TdxBarLargeButton;
    dxBarLargeButton_red: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    dxBarLargeButton_del: TdxBarLargeButton;
    GroupBox1: TGroupBox;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    dxBarDockControl1: TdxBarDockControl;
    cxCheckBox_kredit: TcxCheckBox;
    procedure cxButton_cancelClick(Sender: TObject);
    procedure cxButton_okClick(Sender: TObject);
    procedure cxSplitter1AfterClose(Sender: TObject);
    procedure cxSplitter1AfterOpen(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public

    constructor Create(Aowner:TComponent; summa, sum_vipol, sum_opl: Double);overload;
    { Public declarations }
  end;

var
  FrmAddPredopl: TFrmAddPredopl;
  razn: Double;

implementation
uses
  Prepopl;

{$R *.dfm}

constructor TFrmAddPredopl.Create(Aowner:TComponent; summa, sum_vipol, sum_opl: Double);
begin
  inherited Create (Aowner);
  CurrencyEdit_sum_kowt.Text := FloatToStr(summa);
  CurrencyEdit_sum_vipol.Text := FloatToStr(sum_vipol);
  CurrencyEdit_sum_opl.Text := FloatToStr(sum_opl);
  razn := sum_vipol - sum_opl;
end;

procedure TFrmAddPredopl.cxButton_cancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TFrmAddPredopl.cxButton_okClick(Sender: TObject);
begin
       // проверка на заполнение предоплаты
    if  Trim(CurrencyEdit_sum_predopl.Text) = '' then
        begin
        MessageDlg(errNotPredopl, mtError, [mbOk], 0);
        CurrencyEdit_sum_predopl.SetFocus;
        Exit;
    end;

  if (CurrencyEdit_sum_predopl.Value > CurrencyEdit_sum_kowt.Value - CurrencyEdit_sum_opl.Value) then
  begin
    ShowMessage('—умма предоплаты не может превышать сумму остатка по смете!');
    CurrencyEdit_sum_predopl.Value := CurrencyEdit_sum_kowt.Value - CurrencyEdit_sum_opl.Value;
  end;

  ModalResult := mrOk;
end;

procedure TFrmAddPredopl.cxSplitter1AfterClose(Sender: TObject);
begin
  frmPredopl.Height := 105;
end;

procedure TFrmAddPredopl.cxSplitter1AfterOpen(Sender: TObject);
begin
//  frmPredopl.Height := 300;
end;

procedure TFrmAddPredopl.FormShow(Sender: TObject);
begin
  if razn > 0 then
  cxCheckBox_kredit.Checked := true else
  cxCheckBox_kredit.Visible := false;
end;

end.
