unit SpecialNotes_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase,TiCommonStyles, ExtCtrls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, dxBar,
  dxBarExtItems, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,TiCommonProc;

type
  TSpecialNotesMainForm = class(TForm)
    SpecialNotesGridDBTableView: TcxGridDBTableView;
    SpecialNotesGridLevel: TcxGridLevel;
    SpecialNotesGrid: TcxGrid;
    dxBarManager1: TdxBarManager;
    SelectButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    SpecialNotesGridDBTableViewDB_Kod: TcxGridDBColumn;
    SpecialNotesGridDBTableViewDB_NameNotes: TcxGridDBColumn;
    procedure ExitButtonClick(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpecialNotesGridDBTableViewDblClick(Sender: TObject);
    procedure SpecialNotesGridDBTableViewKeyPress(Sender: TObject;
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
  SpecialNotesMainForm: TSpecialNotesMainForm;

implementation

uses SpecialNotes_DM;

{$R *.dfm}
constructor TSpecialNotesMainForm.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);

begin
  inherited Create(AOwner);
  PDb_Handle           := Db_Handle;
  SpecialNotesDM       := TSpecialNotesDM.Create(AOwner,Db_Handle);
//******************************************************************************
  pLanguageIndex       := LanguageIndex;
  Caption              := GetConst('SpecialNotes',tcForm);
  SelectButton.Caption := GetConst('Select',tcButton);
  ExitButton.Caption   := GetConst('Exit',tcButton);
//******************************************************************************
  pStylesDM            := TStyleDM.Create(Self);
  SpecialNotesGridDBTableView.Styles.StyleSheet := pStylesDM.GridTableViewStyleSheetDevExpress;
//******************************************************************************
  SpecialNotesDM.SpecialNotesDSet.Close;
  SpecialNotesDM.SpecialNotesDSet.SelectSQL.Text:='select * from TI_SP_SPECIALNOTES where DateBeg = :date';
  SpecialNotesDM.SpecialNotesDSet.ParamByName('date').Value := StrToDate('01.01.2011');
  SpecialNotesDM.SpecialNotesDSet.Open;
end;

procedure TSpecialNotesMainForm.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TSpecialNotesMainForm.SelectButtonClick(Sender: TObject);
begin
  PRes:=VarArrayCreate([0,3], varVariant);
  PRes[0]:=SpecialNotesDM.SpecialNotesDSet['CODE'];
  PRes[1]:=SpecialNotesDM.SpecialNotesDSet['NAME'];
  PRes[2]:=SpecialNotesDM.SpecialNotesDSet['NUM'];
 // ShowMessage(SpecialNotesDM.SpecialNotesDSet['NAME']);
 // PRes[2]:=SpecialNotesDM.SpecialNotesDSet['NUM'];
 // PRes[3]:=SpecialNotesDM.SpecialNotesDSet['DATEBEG'];
 // PRes[4]:=SpecialNotesDM.SpecialNotesDSet['DATEEND'];
  ModalResult:=mrYes;
end;

procedure TSpecialNotesMainForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   SpecialNotesDM.Free;
end;

procedure TSpecialNotesMainForm.SpecialNotesGridDBTableViewDblClick(
  Sender: TObject);
begin
  SelectButton.Click;
end;

procedure TSpecialNotesMainForm.SpecialNotesGridDBTableViewKeyPress(
  Sender: TObject; var Key: Char);
begin
   {if (SpecialNotesGridDBTableView.OptionsBehavior.IncSearchItem<>SpecialNotesGridDBTableViewDB_NameNotes)then
   begin
    SpecialNotesGridDBTableView.Controller.IncSearchingText   := '';
    SpecialNotesGridDBTableView.OptionsBehavior.IncSearchItem := SpecialNotesGridDBTableViewDB_NameNotes;
   end;  }
end;

end.
