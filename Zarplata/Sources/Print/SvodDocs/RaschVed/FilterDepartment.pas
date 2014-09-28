unit FilterDepartment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, dxBar,
  dxBarExtItems, cxGridLevel, cxGridCustomTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, ZSvodTypesUnit,
  RaschVedMainDM, ZProc, Unit_ZGlobal_Consts, RaschVedPrintDM;

type
  TFFilterDepartment = class(TForm)
    Grid: TcxGrid;
    GridDBTableView1: TcxGridDBTableView;
    GridClShifr: TcxGridDBColumn;
    GridClCount: TcxGridDBColumn;
    cxgrdlvlGridLevel1: TcxGridLevel;
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    PrintSvodBtn: TdxBarLargeButton;
    PrintReestrBtn: TdxBarLargeButton;
    Styles: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    procedure RefreshBtnClick(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure PrintSvodBtnClick(Sender: TObject);
  private
    PParameter:TZAccListParameter;
    MainDM:TMainDM;
    PLanguageIndex:byte;
  public
    constructor Create(AParameter:TZAccListParameter);reintroduce;
    destructor Destroy;reintroduce;
  end;

implementation

{$R *.dfm}

constructor TFFilterDepartment.Create(AParameter:TZAccListParameter);
begin
 inherited Create(AParameter.AOwner);
 PParameter:=AParameter;
 PParameter.AOwner:=self;
 MainDM:=TMainDM.Create(PParameter);
 PParameter:=AParameter;
 PLanguageIndex:=LanguageIndex;
//******************************************************************************
 PrintSvodBtn.Caption := Sheets_Const[PLanguageIndex];
 PrintReestrBtn.Caption :=  Reestr_Const[PLanguageIndex];
 RefreshBtn.Caption := RefreshBtn_Caption[PLanguageIndex];
 ExitBtn.Caption    := ExitBtn_Caption[PLanguageIndex];

 GridClShifr.Caption := GridClKodDepartment_Caption[PLanguageIndex];;
 GridClCount.Caption := OfPeople_Const[PLanguageIndex];

 Caption := FRaschVed_SelDepartment_Caption[PLanguageIndex];
//******************************************************************************
 GridClShifr.DataBinding.FieldName := 'SHIFR';
 GridClCount.DataBinding.FieldName := 'COUNT_PEOPLE';
 GridDBTableView1.DataController.Summary.FooterSummaryItems[1].Format:=Itogo_Caption[PLanguageIndex];

 GridDBTableView1.DataController.DataSource:=MainDM.DSource;
end;

procedure TFFilterDepartment.RefreshBtnClick(Sender: TObject);
var _recno:integer;
begin
_recno:=MainDM.DSet.RecNo;
MainDM.DSet.CloseOpen(True);
MainDM.DSet.RecNo:=_Recno;
end;

procedure TFFilterDepartment.ExitBtnClick(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

destructor TFFilterDepartment.Destroy;
begin
 MainDM.Destroy;
 inherited Destroy;
end;

procedure TFFilterDepartment.PrintSvodBtnClick(Sender: TObject);
var PrintDM:TPrintDM;
begin
PParameter.AOwner:=Self;
with MainDM do
begin
 if(MainDM.DSet['SHIFR']<>null)then
   PParameter.Id_Department:=MainDM.DSet['SHIFR']
 else
   PParameter.Id_Department:=-1;
end;
PrintDM:=TPrintDM.Create(self);
PrintDM.ReportCreate(PParameter);
PrintDM.Free;
end;

end.
