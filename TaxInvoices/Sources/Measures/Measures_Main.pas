unit Measures_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase,TiCommonStyles, ExtCtrls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, dxBar,
  dxBarExtItems, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,TiCommonProc;

type
  TMeasuresMainForm = class(TForm)
    MeasuresGridDBTableView: TcxGridDBTableView;
    MeasuresGridLevel: TcxGridLevel;
    MeasuresGrid: TcxGrid;
    dxBarManager1: TdxBarManager;
    SelectButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    MeasuresGridDBTableViewDB_Kod: TcxGridDBColumn;
    MeasuresGridDBTableViewDB_NameNotes: TcxGridDBColumn;
    procedure ExitButtonClick(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MeasuresGridDBTableViewDblClick(Sender: TObject);
    procedure MeasuresGridDBTableViewKeyPress(Sender: TObject;
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
  MeasuresMainForm: TMeasuresMainForm;

implementation

uses  Measures_DM;

{$R *.dfm}
constructor TMeasuresMainForm.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);

begin
  inherited Create(AOwner);
  PDb_Handle           := Db_Handle;
  MeasuresDM           := TMeasuresDM.Create(AOwner,Db_Handle);
//******************************************************************************
  pLanguageIndex       := LanguageIndex;
  Caption              := GetConst('Measures',tcForm);
  SelectButton.Caption := GetConst('Select',tcButton);
  ExitButton.Caption   := GetConst('Exit',tcButton);
//******************************************************************************
  pStylesDM            := TStyleDM.Create(Self);
  MeasuresGridDBTableView.Styles.StyleSheet := pStylesDM.GridTableViewStyleSheetDevExpress;
//******************************************************************************
  MeasuresDM.MeasuresDSet.Close;
  MeasuresDM.MeasuresDSet.SelectSQL.Text:='select * from TI_SP_MEASURES';
  MeasuresDM.MeasuresDSet.Open;
end;

procedure TMeasuresMainForm.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TMeasuresMainForm.SelectButtonClick(Sender: TObject);
begin
  PRes:=VarArrayCreate([0,3], varVariant);
  PRes[0]:=MeasuresDM.MeasuresDSet['CODE'];
  PRes[1]:=MeasuresDM.MeasuresDSet['NAME'];
  PRes[2]:=MeasuresDM.MeasuresDSet['CHARCODE'];
 // ShowMessage(SpecialNotesDM.SpecialNotesDSet['NAME']);
 // PRes[2]:=SpecialNotesDM.SpecialNotesDSet['NUM'];
 // PRes[3]:=SpecialNotesDM.SpecialNotesDSet['DATEBEG'];
 // PRes[4]:=SpecialNotesDM.SpecialNotesDSet['DATEEND'];
  ModalResult:=mrYes;
end;

procedure TMeasuresMainForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   MeasuresDM.Free;
end;

procedure TMeasuresMainForm.MeasuresGridDBTableViewDblClick(
  Sender: TObject);
begin
  SelectButton.Click;
end;

procedure TMeasuresMainForm.MeasuresGridDBTableViewKeyPress(
  Sender: TObject; var Key: Char);
begin
   if (MeasuresGridDBTableView.OptionsBehavior.IncSearchItem<>MeasuresGridDBTableViewDB_NameNotes)then
   begin
    MeasuresGridDBTableView.Controller.IncSearchingText   := '';
    MeasuresGridDBTableView.OptionsBehavior.IncSearchItem := MeasuresGridDBTableViewDB_NameNotes;
   end;
end;

end.
