unit FormCalculations_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase,TiCommonStyles, ExtCtrls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, dxBar,
  dxBarExtItems, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,TiCommonProc;

type
  TFormCalculationsMainForm = class(TForm)
    FormCalculationsGridDBTableView: TcxGridDBTableView;
    FormCalculationsGridLevel: TcxGridLevel;
    FormCalculationsGrid: TcxGrid;
    dxBarManager1: TdxBarManager;
    SelectButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    FormCalculationsGridDBTableViewDB_Kod: TcxGridDBColumn;
    FormCalculationsGridDBTableViewDB_NameNotes: TcxGridDBColumn;
    procedure ExitButtonClick(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCalculationsGridDBTableViewDblClick(Sender: TObject);
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
  FormCalculationsMainForm: TFormCalculationsMainForm;

implementation

uses FormCalculations_DM;

{$R *.dfm}
constructor TFormCalculationsMainForm.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);

begin
  inherited Create(AOwner);
  PDb_Handle           := Db_Handle;
  FormCalculationsDM   := TFormCalculationsDM.Create(AOwner,Db_Handle);
//******************************************************************************
  pLanguageIndex       := LanguageIndex;
  Caption              := GetConst('FormCalculations',tcForm);
  SelectButton.Caption := GetConst('Select',tcButton);
  ExitButton.Caption   := GetConst('Exit',tcButton);
//******************************************************************************
  pStylesDM            := TStyleDM.Create(Self);
  FormCalculationsGridDBTableView.Styles.StyleSheet := pStylesDM.GridTableViewStyleSheetDevExpress;
//******************************************************************************
  FormCalculationsDM.FormCalculationsDSet.Close;
  FormCalculationsDM.FormCalculationsDSet.SelectSQL.Text:='select * from TI_SP_Form_Calculations';
  FormCalculationsDM.FormCalculationsDSet.Open;
end;

procedure TFormCalculationsMainForm.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TFormCalculationsMainForm.SelectButtonClick(Sender: TObject);
begin
  PRes:=VarArrayCreate([0,3], varVariant);
  PRes[0]:=FormCalculationsDM.FormCalculationsDSet['CODE'];
  PRes[1]:=FormCalculationsDM.FormCalculationsDSet['NAME'];
 // ShowMessage(SpecialNotesDM.SpecialNotesDSet['NAME']);
 // PRes[2]:=SpecialNotesDM.SpecialNotesDSet['NUM'];
 // PRes[3]:=SpecialNotesDM.SpecialNotesDSet['DATEBEG'];
 // PRes[4]:=SpecialNotesDM.SpecialNotesDSet['DATEEND'];
  ModalResult:=mrYes;
end;

procedure TFormCalculationsMainForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   FormCalculationsDM.Free;
end;

procedure TFormCalculationsMainForm.FormCalculationsGridDBTableViewDblClick(
  Sender: TObject);
begin
  SelectButton.Click;
end;

end.
