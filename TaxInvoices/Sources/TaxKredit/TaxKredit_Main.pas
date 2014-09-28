unit TaxKredit_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase,TiCommonStyles, ExtCtrls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, dxBar,
  dxBarExtItems, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,TiCommonProc;

type
  TTaxKreditMainForm = class(TForm)
    TaxKreditGridDBTableView: TcxGridDBTableView;
    TaxKreditGridLevel: TcxGridLevel;
    TaxKreditGrid: TcxGrid;
    dxBarManager1: TdxBarManager;
    SelectButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    TaxKreditGridDBTableViewDB_Kod: TcxGridDBColumn;
    TaxKreditGridDBTableViewDB_NameNotes: TcxGridDBColumn;
    procedure ExitButtonClick(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TaxKreditGridDBTableViewDblClick(Sender: TObject);
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
  TaxKreditMainForm: TTaxKreditMainForm;

implementation

uses TaxKredit_DM;

{$R *.dfm}
constructor TTaxKreditMainForm.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);

begin
  inherited Create(AOwner);
  PDb_Handle           := Db_Handle;
  TaxKreditDM          := TTaxKreditDM.Create(AOwner,Db_Handle);
//******************************************************************************
  pLanguageIndex       := LanguageIndex;
  Caption              := GetConst('TaxKredit',tcForm);
  SelectButton.Caption := GetConst('Select',tcButton);
  ExitButton.Caption   := GetConst('Exit',tcButton);
//******************************************************************************
  pStylesDM            := TStyleDM.Create(Self);
  TaxKreditGridDBTableView.Styles.StyleSheet := pStylesDM.GridTableViewStyleSheetDevExpress;
//******************************************************************************
  TaxKreditDM.TaxKreditDSet.Close;
  TaxKreditDM.TaxKreditDSet.SelectSQL.Text:='select * from TI_SP_TAXKREDIT';
  TaxKreditDM.TaxKreditDSet.Open;
end;

procedure TTaxKreditMainForm.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TTaxKreditMainForm.SelectButtonClick(Sender: TObject);
begin
  PRes:=VarArrayCreate([0,3], varVariant);
  PRes[0]:=TaxKreditDM.TaxKreditDSet['CODE'];
  PRes[1]:=TaxKreditDM.TaxKreditDSet['NAME'];
  PRes[2]:=TaxKreditDM.TaxKreditDSet['NUM'];
 // ShowMessage(SpecialNotesDM.SpecialNotesDSet['NAME']);
 // PRes[2]:=SpecialNotesDM.SpecialNotesDSet['NUM'];
 // PRes[3]:=SpecialNotesDM.SpecialNotesDSet['DATEBEG'];
 // PRes[4]:=SpecialNotesDM.SpecialNotesDSet['DATEEND'];
  ModalResult:=mrYes;
end;

procedure TTaxKreditMainForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   TaxKreditDM.Free;
end;

procedure TTaxKreditMainForm.TaxKreditGridDBTableViewDblClick(
  Sender: TObject);
begin
  SelectButton.Click;
end;

end.
