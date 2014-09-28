unit TypeReestr_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase,TiCommonStyles, ExtCtrls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, dxBar,
  dxBarExtItems, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,TiCommonProc;

type
  TTypeReestrMainForm = class(TForm)
    TypeReestrGridDBTableView: TcxGridDBTableView;
    TypeReestrGridLevel: TcxGridLevel;
    TypeReestrGrid: TcxGrid;
    dxBarManager1: TdxBarManager;
    SelectButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    TypeReestrGridDBTableViewDB_NameNotes: TcxGridDBColumn;
    procedure ExitButtonClick(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TypeReestrGridDBTableViewDblClick(Sender: TObject);
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
  TypeReestrMainForm: TTypeReestrMainForm;

implementation

uses TypeReestr_DM;

{$R *.dfm}
constructor TTypeReestrMainForm.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);

begin
  inherited Create(AOwner);
  PDb_Handle           := Db_Handle;
  TypeReestrDM         := TTypeReestrDM.Create(AOwner,Db_Handle);
//******************************************************************************
  pLanguageIndex       := LanguageIndex;
  Caption              := GetConst('SpecialNotes',tcForm);
  SelectButton.Caption := GetConst('Select',tcButton);
  ExitButton.Caption   := GetConst('Exit',tcButton);
//******************************************************************************
  pStylesDM            := TStyleDM.Create(Self);
  TypeReestrGridDBTableView.Styles.StyleSheet := pStylesDM.GridTableViewStyleSheetDevExpress;
//******************************************************************************
  TypeReestrDM.TypeReestrDSet.Close;
  TypeReestrDM.TypeReestrDSet.SelectSQL.Text:='select * from TI_SP_TYPE_REESTR';
  TypeReestrDM.TypeReestrDSet.Open;
end;

procedure TTypeReestrMainForm.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TTypeReestrMainForm.SelectButtonClick(Sender: TObject);
begin
  PRes    := VarArrayCreate([0,3], varVariant);
  PRes[0] := TypeReestrDM.TypeReestrDSet['ID_TYPE_REESTR'];
  PRes[1] := TypeReestrDM.TypeReestrDSet['NAME_TYPE_REESTR'];
  ModalResult:=mrYes;
end;

procedure TTypeReestrMainForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   TypeReestrDM.Free;
end;

procedure TTypeReestrMainForm.TypeReestrGridDBTableViewDblClick(
  Sender: TObject);
begin
  SelectButton.Click;
end;

end.
