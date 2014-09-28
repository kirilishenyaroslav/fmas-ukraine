unit UP_HolidayFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridDBTableView, cxGrid,  cxContainer, cxLabel,
  cxDBLabel, ExtCtrls, Buttons, cxCalendar, cxTL, //Clipbrd,
  cxInplaceContainer, cxTLData, cxDBTL, cxMaskEdit, cxCurrencyEdit,
  cxCheckBox, ActnList, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  Ibase, cxTextEdit, cxDropDownEdit, uFControl, uLabeledFControl,
  uDateControl, cxDBEdit, cxSplitter, cxLookAndFeelPainters, cxButtons;

type
  TfrAllHolidaysPage = class(TFrame)
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
    ActionList1: TActionList;
    BonusesAct: TAction;
    DB: TpFIBDatabase;
    HolidaysSelect: TpFIBDataSet;
    PlanTreeSource: TDataSource;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    HolidaysGrid: TcxGrid;
    ReportDataView: TcxGridDBTableView;
    ReportDataViewDBColumn1: TcxGridDBColumn;
    ReportDataViewDBColumn2: TcxGridDBColumn;
    DateBegCol: TcxGridDBColumn;
    DateEndCol: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    ReportDataViewDBColumn7: TcxGridDBColumn;
    Panel2: TPanel;
    cxCB_ShowOld: TcxCheckBox;
    OrderDataSet: TpFIBDataSet;
    OrdersDataSource: TDataSource;
    cxCheckBox2: TcxCheckBox;
    cxCheckBox3: TcxCheckBox;
    ReportDataViewDBColumn3: TcxGridDBColumn;
    ReportDataViewDBColumn4: TcxGridDBColumn;
    ReportDataViewDBColumn5: TcxGridDBColumn;
    ReportDataViewDBColumn6: TcxGridDBColumn;
    ReportDataViewDBColumn8: TcxGridDBColumn;
    procedure cxCheckBox2PropertiesChange(Sender: TObject);
    procedure cxCheckBox3PropertiesChange(Sender: TObject);
    procedure cxCB_ShowOldPropertiesChange(Sender: TObject);
  private
    Select_Type: Integer;
  public
    id_pcard:int64;
    procedure MovingsSelectAfterOpen(DataSet: TDataSet);
    constructor Create(AOwner: TComponent;DBHandle:TISC_DB_HANDLE;Id_PCard: Integer; ActualDate: TDate; Select_Type: Integer); reintroduce;
  end;

implementation

{$R *.dfm}

uses uFormControl, Registry, Clipbrd;

constructor TfrAllHolidaysPage.Create(AOwner: TComponent;
                                       DBHandle:TISC_DB_HANDLE;
                                       Id_PCard:Integer;
                                       ActualDate:TDate;
                                       Select_Type: Integer);
var D,M,Y,Hour, Min, Sec, MSec :Word;
begin
    inherited Create(AOwner);
    DecodeDate(Date,Y,M,D);
    DecodeTime(Time,Hour, Min, Sec, MSec);
    self.Name:=self.Name+IntToStr(Y)+IntToStr(M)+IntToStr(D)+IntToStr(Hour)+IntToStr(Min)+IntToStr(Sec);


    DB.Handle:=DBHandle;

    ReadTransaction.StartTransaction;

    HolidaysSelect.SelectSQL.Text:=' SELECT * FROM UP_KER_GET_HOLIDAYS_BY_PCARD('+IntToStr(id_pcard)+',1)';

    self.id_pcard:=Id_PCard;

    OrderDataSet.SelectSQL.Text:='SELECT * FROM UP_KER_GET_HOLIDAY_ORDER(?ID_WORK_DOG_MOVING, ?ID_HOLIDAY_PERIOD, ?ID_TYPE_HOLIDAY)';

    HolidaysSelect.Open;
end;



procedure TfrAllHolidaysPage.MovingsSelectAfterOpen(DataSet: TDataSet);
begin
end;

procedure TfrAllHolidaysPage.cxCheckBox2PropertiesChange(Sender: TObject);
var I:Integer;
begin
     for i:=0 to ReportDataView.ColumnCount-1 do
     begin
          ReportDataView.Columns[i].Options.Filtering:=cxCheckBox2.Checked;
     end;
end;

procedure TfrAllHolidaysPage.cxCheckBox3PropertiesChange(Sender: TObject);
begin
     ReportDataView.OptionsView.GroupByBox:=cxCheckBox3.Checked;
end;

procedure TfrAllHolidaysPage.cxCB_ShowOldPropertiesChange(
  Sender: TObject);
begin
     if HolidaysSelect.Active
     then HolidaysSelect.Close;

     HolidaysSelect.SelectSQL.Text:=' SELECT * FROM UP_KER_GET_HOLIDAYS_BY_PCARD('+IntToStr(id_pcard)+','+IntToStr(Integer(not cxCB_ShowOld.Checked))+')';

     HolidaysSelect.Open;
end;

end.
