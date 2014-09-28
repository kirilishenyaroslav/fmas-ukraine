unit UpCommandCancelSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, Buttons, ExtCtrls, cxClasses,uSpravControl,
  uFControl, uLabeledFControl, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxContainer, cxLabel,ibase,qfTools, FIBDataSet, pFIBDataSet,
  FIBDatabase, pFIBDatabase, cxLookAndFeelPainters, cxButtons;

type
  TfmUpCommandCancelSelect = class(TForm)
    StyleRepository: TcxStyleRepository;
    stBackground: TcxStyle;
    stContent: TcxStyle;
    stContentEven: TcxStyle;
    stContentOdd: TcxStyle;
    stFilterBox: TcxStyle;
    stFooter: TcxStyle;
    stGroup: TcxStyle;
    stGroupByBox: TcxStyle;
    stHeader: TcxStyle;
    stInactive: TcxStyle;
    stIncSearch: TcxStyle;
    stIndicator: TcxStyle;
    stPreview: TcxStyle;
    stSelection: TcxStyle;
    stHotTrack: TcxStyle;
    qizzStyle: TcxGridTableViewStyleSheet;
    Panel1: TPanel;
    btnOk: TSpeedButton;
    btnCancel: TBitBtn;
    cxGridComandPlan: TcxGrid;
    cxGridComandPlanDBTableView: TcxGridDBTableView;
    colId_Comand_Plan: TcxGridDBColumn;
    colNum_Order: TcxGridDBColumn;
    colDate_Order: TcxGridDBColumn;
    colReg_Num: TcxGridDBColumn;
    colDate_Cert: TcxGridDBColumn;
    colName_Post_Full: TcxGridDBColumn;
    colName_Org_Full: TcxGridDBColumn;
    colSm_Title_Full: TcxGridDBColumn;
    colDate_Beg: TcxGridDBColumn;
    colDate_End: TcxGridDBColumn;
    colDays_Count: TcxGridDBColumn;
    cxGridComandPlanLevel: TcxGridLevel;
    IL_OrdAcc: TImageList;
    DB: TpFIBDatabase;
    ReadTr: TpFIBTransaction;
    DSetSelect: TpFIBDataSet;
    DataSource: TDataSource;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
      id_mode   : integer;
      Is_Working: Boolean;
      Id_Comand_Plan : variant;
      DBHandle: TISC_DB_HANDLE;
  end;

var
  fmUpCommandCancelSelect: TfmUpCommandCancelSelect;

implementation

{$R *.dfm}



procedure TfmUpCommandCancelSelect.btnOkClick(Sender: TObject);
begin
    ModalResult := mrOk;
end;

procedure TfmUpCommandCancelSelect.btnCancelClick(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

end.
