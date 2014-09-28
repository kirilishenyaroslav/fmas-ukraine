unit MortgageTara_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase,TiCommonStyles, ExtCtrls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, dxBar,
  dxBarExtItems, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,TiCommonProc;

type
  TMortgageTaraMainForm = class(TForm)
    MortgageTaraGridDBTableView: TcxGridDBTableView;
    MortgageTaraGridLevel: TcxGridLevel;
    MortgageTaraGrid: TcxGrid;
    dxBarManager1: TdxBarManager;
    SelectButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    MortgageTaraGridDBTableViewDB_Kod: TcxGridDBColumn;
    MortgageTaraGridDBTableViewDB_NameNotes: TcxGridDBColumn;
    procedure ExitButtonClick(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MortgageTaraGridDBTableViewDblClick(Sender: TObject);
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
  MortgageTaraMainForm: TMortgageTaraMainForm;

implementation

uses MortgageTara_DM;

{$R *.dfm}
constructor TMortgageTaraMainForm.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);

begin
  inherited Create(AOwner);
  PDb_Handle           := Db_Handle;
  MortgageTaraDM       := TMortgageTaraDM.Create(AOwner,Db_Handle);
//******************************************************************************
  pLanguageIndex       := LanguageIndex;
  Caption              := GetConst('SpecialNotes',tcForm);
  SelectButton.Caption := GetConst('Select',tcButton);
  ExitButton.Caption   := GetConst('Exit',tcButton);
//******************************************************************************
  pStylesDM            := TStyleDM.Create(Self);
  MortgageTaraGridDBTableView.Styles.StyleSheet := pStylesDM.GridTableViewStyleSheetDevExpress;
//******************************************************************************
  MortgageTaraDM.MortgageTaraDSet.Close;
  MortgageTaraDM.MortgageTaraDSet.SelectSQL.Text:='select * from TI_SP_TARE';
  MortgageTaraDM.MortgageTaraDSet.Open;
end;

procedure TMortgageTaraMainForm.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TMortgageTaraMainForm.SelectButtonClick(Sender: TObject);
begin
  PRes:=VarArrayCreate([0,3], varVariant);
  PRes[0]:=MortgageTaraDM.MortgageTaraDSet['ID_TARE'];
  PRes[1]:=MortgageTaraDM.MortgageTaraDSet['NAME_TARE'];
  ModalResult:=mrYes;
end;

procedure TMortgageTaraMainForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   MortgageTaraDM.Free;
end;

procedure TMortgageTaraMainForm.MortgageTaraGridDBTableViewDblClick(
  Sender: TObject);
begin
  SelectButton.Click;
end;

end.
