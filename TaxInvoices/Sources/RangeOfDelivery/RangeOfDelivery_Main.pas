unit RangeOfDelivery_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase,TiCommonStyles, ExtCtrls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, dxBar,
  dxBarExtItems, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  TiCommonProc, RangeOfDelivery_Add;

type
  TRangeOfDeliveryMainForm = class(TForm)
    RangeOfDeliveryGridDBTableView: TcxGridDBTableView;
    RangeOfDeliveryGridLevel: TcxGridLevel;
    RangeOfDeliveryGrid: TcxGrid;
    dxBarManager1: TdxBarManager;
    SelectButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    RangeOfDeliveryGridDBTableViewDB_Kod: TcxGridDBColumn;
    RangeOfDeliveryGridDBTableViewDB_NameNotes: TcxGridDBColumn;
    RangeOfDeliveryGridDBTableViewDB_Price: TcxGridDBColumn;
    InsertButton: TdxBarLargeButton;
    UpdateButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    procedure ExitButtonClick(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RangeOfDeliveryGridDBTableViewDblClick(Sender: TObject);
    procedure InsertButtonClick(Sender: TObject);
    procedure UpdateButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure RangeOfDeliveryGridDBTableViewKeyPress(Sender: TObject;
      var Key: Char);
  private
    PRes               :Variant;
    pLanguageIndex     :Byte;
    pStylesDM          :TStyleDM;
    PDb_Handle         :TISC_DB_HANDLE;
  public
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);reintroduce;
    property Res:Variant read PRes;
  end;

var
  RangeOfDeliveryMainForm: TRangeOfDeliveryMainForm;

implementation

uses RangeOfDelivery_DM, cxCurrencyEdit;

{$R *.dfm}
constructor TRangeOfDeliveryMainForm.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);

begin
  inherited Create(AOwner);
  PDb_Handle           := Db_Handle;
  RangeOfDeliveryDM    := TRangeOfDeliveryDM.Create(AOwner,Db_Handle);
//******************************************************************************
  pLanguageIndex       := LanguageIndex;
  Caption              := GetConst('RangeOfDelivery',tcForm);
  SelectButton.Caption := GetConst('Select',tcButton);
  ExitButton.Caption   := GetConst('Exit',tcButton);
//******************************************************************************
  pStylesDM            := TStyleDM.Create(Self);
  RangeOfDeliveryGridDBTableView.Styles.StyleSheet := pStylesDM.GridTableViewStyleSheetDevExpress;
//******************************************************************************
  RangeOfDeliveryDM.RangeOfDeliveryDSet.Close;
  RangeOfDeliveryDM.RangeOfDeliveryDSet.SelectSQL.Text:='select * from TI_SP_RANGE_OF_DELIVERY';
  RangeOfDeliveryDM.RangeOfDeliveryDSet.Open;
end;

procedure TRangeOfDeliveryMainForm.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TRangeOfDeliveryMainForm.SelectButtonClick(Sender: TObject);
begin
  PRes:=VarArrayCreate([0,3], varVariant);
  PRes[0]:=RangeOfDeliveryDM.RangeOfDeliveryDSet['id_range_of_delivery'];
  PRes[1]:=RangeOfDeliveryDM.RangeOfDeliveryDSet['name_range_of_delivery'];
  ModalResult:=mrYes;
end;

procedure TRangeOfDeliveryMainForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   RangeOfDeliveryDM.Free;
end;

procedure TRangeOfDeliveryMainForm.RangeOfDeliveryGridDBTableViewDblClick(
  Sender: TObject);
begin
  SelectButton.Click;
end;

procedure TRangeOfDeliveryMainForm.InsertButtonClick(Sender: TObject);
var
  ViewForm : TRangeOfDeliveryAddForm;
  id_range:Integer;
begin
  ViewForm := TRangeOfDeliveryAddForm.Create(Self,RangeOfDeliveryDM.DB.Handle);
  ViewForm.KodRangeTextEdit.Text   := '';
  ViewForm.NameRangeTextEdit.Text  := '';
  ViewForm.PriceRangeCurrencyEdit.Text := '';
  ViewForm.Caption                 := GetConst('RangeOfDelivAdd',tcForm);
  ViewForm.ShowModal;
  if (ViewForm.ModalResult=mrOk) then
    begin
      RangeOfDeliveryDM.WriteTransaction.StartTransaction;
      RangeOfDeliveryDM.pFIBStoredProc.StoredProcName := 'TI_SP_RANGE_OF_DELIVERY_INS';
      RangeOfDeliveryDM.pFIBStoredProc.ParamByName('code_range_of_delivery').Value  := StrToInt(ViewForm.KodRangeTextEdit.Text);
      RangeOfDeliveryDM.pFIBStoredProc.ParamByName('name_range_of_delivery').Value  := ViewForm.NameRangeTextEdit.Text;
      RangeOfDeliveryDM.pFIBStoredProc.ParamByName('price_range_of_delivery').Value := ViewForm.PriceRangeCurrencyEdit.Value;
      RangeOfDeliveryDM.pFIBStoredProc.ExecProc;
      RangeOfDeliveryDM.WriteTransaction.Commit;
      id_range := RangeOfDeliveryDM.pFIBStoredProc.ParamByName('id_range_of_delivery_').AsInteger;
      RangeOfDeliveryDM.RangeOfDeliveryDSet.Close;
      RangeOfDeliveryDM.RangeOfDeliveryDSet.Open;
      RangeOfDeliveryDM.RangeOfDeliveryDSet.Locate('id_range_of_delivery',IntToStr(id_range),[]);
    end;

end;

procedure TRangeOfDeliveryMainForm.UpdateButtonClick(Sender: TObject);
var
  ViewForm : TRangeOfDeliveryAddForm;
  id_range:Integer;
begin
  id_range := RangeOfDeliveryDM.RangeOfDeliveryDSet['id_range_of_delivery'];
  ViewForm := TRangeOfDeliveryAddForm.Create(Self,RangeOfDeliveryDM.DB.Handle);
  ViewForm.KodRangeTextEdit.Text   := IntToStr(RangeOfDeliveryDM.RangeOfDeliveryDSet['code_range_of_delivery']);
  ViewForm.NameRangeTextEdit.Text  := RangeOfDeliveryDM.RangeOfDeliveryDSet['name_range_of_delivery'];
  ViewForm.PriceRangeCurrencyEdit.Text := FloatToStr(RangeOfDeliveryDM.RangeOfDeliveryDSet['price_range_of_delivery']);
  ViewForm.Caption                 := GetConst('RangeOfDelivAdd',tcForm);
  ViewForm.ShowModal;
  if (ViewForm.ModalResult=mrOk) then
    begin
      RangeOfDeliveryDM.WriteTransaction.StartTransaction;
      RangeOfDeliveryDM.pFIBStoredProc.StoredProcName := 'TI_SP_RANGE_OF_DELIVERY_UPD';
      RangeOfDeliveryDM.pFIBStoredProc.ParamByName('code_range_of_delivery').Value  := StrToInt(ViewForm.KodRangeTextEdit.Text);
      RangeOfDeliveryDM.pFIBStoredProc.ParamByName('name_range_of_delivery').Value  := ViewForm.NameRangeTextEdit.Text;
      RangeOfDeliveryDM.pFIBStoredProc.ParamByName('price_range_of_delivery').Value := ViewForm.PriceRangeCurrencyEdit.Value;
      RangeOfDeliveryDM.pFIBStoredProc.ParamByName('id_range_of_delivery').Value    := RangeOfDeliveryDM.RangeOfDeliveryDSet['id_range_of_delivery'];
      RangeOfDeliveryDM.pFIBStoredProc.ExecProc;
      RangeOfDeliveryDM.WriteTransaction.Commit;
      RangeOfDeliveryDM.RangeOfDeliveryDSet.Close;
      RangeOfDeliveryDM.RangeOfDeliveryDSet.Open;
      RangeOfDeliveryDM.RangeOfDeliveryDSet.Locate('id_range_of_delivery',IntToStr(id_range),[]);
    end;   
end;

procedure TRangeOfDeliveryMainForm.DeleteButtonClick(Sender: TObject);
begin
  if MessageDlg('Ви дійсно бажаєте вилучити запис? ', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
  begin
  try
    RangeOfDeliveryDM.WriteTransaction.StartTransaction;
    RangeOfDeliveryDM.pFIBStoredProc.StoredProcName:='TI_SP_RANGE_OF_DELIVERY_DEL';
    RangeOfDeliveryDM.pFIBStoredProc.ParamByName('id_range_of_delivery').Value:=RangeOfDeliveryDM.RangeOfDeliveryDSet['id_range_of_delivery'];
    RangeOfDeliveryDM.pFIBStoredProc.ExecProc;
    RangeOfDeliveryDM.WriteTransaction.Commit;
    RangeOfDeliveryDM.RangeOfDeliveryDSet.Close;
    RangeOfDeliveryDM.RangeOfDeliveryDSet.Open;
  except on E:Exception do
  begin
    MessageDlg('не можна видалити цей запис', mtError, [mbOK], 0);
    RangeOfDeliveryDM.WriteTransaction.Rollback;
  end;
  end;
  end;
end;

procedure TRangeOfDeliveryMainForm.RangeOfDeliveryGridDBTableViewKeyPress(
  Sender: TObject; var Key: Char);
begin
   if (RangeOfDeliveryGridDBTableView.OptionsBehavior.IncSearchItem<>RangeOfDeliveryGridDBTableViewDB_NameNotes)then
   begin
    RangeOfDeliveryGridDBTableView.Controller.IncSearchingText   := '';
    RangeOfDeliveryGridDBTableView.OptionsBehavior.IncSearchItem := RangeOfDeliveryGridDBTableViewDB_NameNotes;
   end;
end;

end.
