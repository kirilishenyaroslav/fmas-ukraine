unit gr_GrantRise_Problem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, dxBar, dxBarExtItems, cxGridBandedTableView,
  cxClasses, ZProc, gr_uCommonConsts, gr_uCommonProc, gr_uMessage;

type
  TFGrantRiseProblem = class(TForm)
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
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet;
    BarManager: TdxBarManager;
    PrintBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    RollbackBtn: TdxBarLargeButton;
    RollbackAllBtn: TdxBarLargeButton;
    Grid1DBTableView1: TcxGridDBTableView;
    Grid1Level1: TcxGridLevel;
    Grid1: TcxGrid;
    Grid1DBTableView1DBTIN: TcxGridDBColumn;
    Grid1DBTableView1DBFIO: TcxGridDBColumn;
    Grid1DBTableView1DBSumma: TcxGridDBColumn;
    procedure ExitBtnClick(Sender: TObject);
    procedure RollbackBtnClick(Sender: TObject);
    procedure RollbackAllBtnClick(Sender: TObject);
    procedure PrintBtnClick(Sender: TObject);
  private
    PLanguageIndex:Byte;
  public
    Result: variant;
    constructor Create(AOwner:TComponent; PHistory: integer);reintroduce;
  end;

var
  FGrantRiseProblem: TFGrantRiseProblem;

implementation

uses gr_GrantRise_DM;

{$R *.dfm}

const FullNameReport           = '\grRiseProblem.fr3';

constructor TFGrantRiseProblem.Create(AOwner:TComponent; PHistory: integer);
begin
  inherited Create(AOwner);
  PLanguageIndex                := LanguageIndex;
  Caption:=GrantRiseProblem_Text[PLanguageIndex];
//******************************************************************************
  DM.DSet3.SelectSQL.Text:='SELECT * FROM GR_DT_RISE_PROBLEM_S('+IntToStr(PHistory)+')';
  DM.DSet3.Open;
  Grid1DBTableView1.DataController.DataSource:=DM.DSource3;
//******************************************************************************
  PrintBtn.Caption        :=PrintBtn_Caption[PLanguageIndex];
  RollbackBtn.Caption     :=RollbackBtn_Caption[PLanguageIndex];
  RollbackAllBtn.Caption  :=RollbackAllBtn_Caption[PLanguageIndex];
  ExitBtn.Caption         :=ExitBtn_Caption[PLanguageIndex];
//******************************************************************************
  Grid1DBTableView1DBTIN.Caption       :=GridClTin_Caption[PLanguageIndex];
  Grid1DBTableView1DBFIO.Caption       :=GridClFIO_Caption[PLanguageIndex];
  Grid1DBTableView1DBSumma.Caption     :=GridClSumma_Caption[PLanguageIndex];
end;

procedure TFGrantRiseProblem.ExitBtnClick(Sender: TObject);
begin
  DM.DSet3.Close;
  ModalResult:=mrNo;
end;

procedure TFGrantRiseProblem.RollbackBtnClick(Sender: TObject);
begin
  Result:=0;
  ModalResult:=mrYes;
end;

procedure TFGrantRiseProblem.RollbackAllBtnClick(Sender: TObject);
begin
  Result:=1;
  ModalResult:=mrYes;
end;

procedure TFGrantRiseProblem.PrintBtnClick(Sender: TObject);
begin
try
  DM.DSet3.Open;
  DM.Report.Clear;
  DM.Report.LoadFromFile(ExtractFilePath(Application.ExeName)+PathReports+FullNameReport,True);

  if grDesignReport then DM.Report.DesignReport
                    else DM.Report.ShowReport;
except
  on E:Exception do
  begin
    grShowMessage(ECaption[Indexlanguage],e.Message,mtError,[mbOK]);
  end;
end;
end;

end.
