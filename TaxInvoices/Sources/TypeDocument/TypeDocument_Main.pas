unit TypeDocument_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase,TiCommonStyles, ExtCtrls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, dxBar,
  dxBarExtItems, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,TiCommonProc;

type
  TTypeDocumentMainForm = class(TForm)
    TypeDocumentGridDBTableView: TcxGridDBTableView;
    TypeDocumentGridLevel: TcxGridLevel;
    TypeDocumentGrid: TcxGrid;
    dxBarManager1: TdxBarManager;
    SelectButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    TypeDocumentGridDBTableViewDB_Kod: TcxGridDBColumn;
    TypeDocumentGridDBTableViewDB_NameNotes: TcxGridDBColumn;
    TypeDocumentGridDBTableViewDB_CharCode: TcxGridDBColumn;
    procedure ExitButtonClick(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TypeDocumentGridDBTableViewDblClick(Sender: TObject);
  private
    PRes               :Variant;
    pLanguageIndex     :Byte;
    pStylesDM          :TStyleDM;
    PDb_Handle         :TISC_DB_HANDLE;
  public
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;Id_spr:Integer);reintroduce;
    property Res:Variant read PRes;
  end;

var
  TypeDocumentMainForm: TTypeDocumentMainForm;

implementation

uses TypeDocument_DM;

{$R *.dfm}
constructor TTypeDocumentMainForm.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;Id_spr:Integer);

begin
  inherited Create(AOwner);
  PDb_Handle           := Db_Handle;
  TypeDocumentDM       := TTypeDocumentDM.Create(AOwner,Db_Handle);
//******************************************************************************
  pLanguageIndex       := LanguageIndex;
  Caption              := GetConst('TypeDocument',tcForm);
  SelectButton.Caption := GetConst('Select',tcButton);
  ExitButton.Caption   := GetConst('Exit',tcButton);
//******************************************************************************
  pStylesDM            := TStyleDM.Create(Self);
  TypeDocumentGridDBTableView.Styles.StyleSheet := pStylesDM.GridTableViewStyleSheetDevExpress;
//******************************************************************************
  TypeDocumentDM.TypeDocumentDSet.Close;
  TypeDocumentDM.TypeDocumentDSet.SelectSQL.Text:='select * from TI_SP_TYPE_DOCUMENT where IDSPR=:ID and visible = 1';
  TypeDocumentDM.TypeDocumentDSet.ParamByName('ID').Value := Id_spr;
  TypeDocumentDM.TypeDocumentDSet.Open;
end;

procedure TTypeDocumentMainForm.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TTypeDocumentMainForm.SelectButtonClick(Sender: TObject);
begin
  PRes:=VarArrayCreate([0,3], varVariant);
  PRes[0]:=TypeDocumentDM.TypeDocumentDSet['CODE'];
  PRes[1]:=TypeDocumentDM.TypeDocumentDSet['NAME'];
 // ShowMessage(SpecialNotesDM.SpecialNotesDSet['NAME']);
 // PRes[2]:=SpecialNotesDM.SpecialNotesDSet['NUM'];
 // PRes[3]:=SpecialNotesDM.SpecialNotesDSet['DATEBEG'];
 // PRes[4]:=SpecialNotesDM.SpecialNotesDSet['DATEEND'];
  ModalResult:=mrYes;
end;

procedure TTypeDocumentMainForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   TypeDocumentDM.Free;
end;

procedure TTypeDocumentMainForm.TypeDocumentGridDBTableViewDblClick(
  Sender: TObject);
begin
  SelectButton.Click;
end;

end.
