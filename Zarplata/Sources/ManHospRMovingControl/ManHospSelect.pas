unit ManHospSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, ActnList, dxBar,
  dxBarExtItems, cxGridBandedTableView, cxGridTableView, cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ExtCtrls, dxStatusBar, ibase, ManHospControlDm, Ztypes,
  FIBDataSet, pFIBDataSet, Unit_ZGlobal_Consts;

type
  TfmManHospSelect = class(TForm)
    dxStatusBar1: TdxStatusBar;
    dxStatusBar2: TdxStatusBar;
    PanelHosp: TPanel;
    GridHosp: TcxGrid;
    GridHospDBTableView1: TcxGridDBTableView;
    Grid3Seria: TcxGridDBColumn;
    Grid3Nomer: TcxGridDBColumn;
    Grid3DateBeg: TcxGridDBColumn;
    Grid3DateEnd: TcxGridDBColumn;
    GridHospLevel1: TcxGridLevel;
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
    ExitBtn: TdxBarLargeButton;
    SelectBtn: TdxBarLargeButton;
    actlst1: TActionList;
    act1: TAction;
    act2: TAction;
    DataSet: TpFIBDataSet;
    procedure ExitBtnClick(Sender: TObject);
    procedure SelectBtnClick(Sender: TObject);
    procedure GridHospDBTableView1DblClick(Sender: TObject);
  private
    DM:TDM;
    FId_man:Int64;
    FKodSetup:Integer;
    PParameter:THospRMovingParameter;
   PKod_VidOpl:integer;
   PlanguageIndex: Byte;
  public
    { Public declarations }
    constructor Create(Aparameter:THospRMovingParameter);
  end;

{ TfmManHospSelect; }

implementation




{$R *.dfm}

constructor TfmManHospSelect.Create(Aparameter:THospRMovingParameter);
begin
    inherited Create(AParameter.AOwner);
    DM:=TDM.Create(AParameter);
    PParameter:=AParameter;


    DataSet :=  DM.DataSet;

    GridHospDBTableView1.DataController.DataSource := DM.DataSourceProdl;
    DM.DataSet.Close;
    DM.DataSet.SelectSQL.Text:='SELECT * FROM MAN_HOSPITAL_SELECT(:ID_PCARD) WHERE Ending = 2 AND Has_Cont = 0 ORDER BY DATE_BEG DESC';
    DM.DataSet.ParamByName('ID_PCARD').AsInt64 := PParameter.AId_pcard;
    DM.DataSet.Open;
end;



procedure TfmManHospSelect.ExitBtnClick(Sender: TObject);
begin
     ModalResult:=mrNo;
     close;
end;

procedure TfmManHospSelect.SelectBtnClick(Sender: TObject);
begin
     if DM.DataSet.RecordCount>0
     then
     begin
         ModalResult:=mrYes;
     end;
end;

procedure TfmManHospSelect.GridHospDBTableView1DblClick(Sender: TObject);
begin
     SelectBtnClick(Self);
end;

end.
