unit UP_PochasFrame;

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
  uDateControl, cxDBEdit, cxSplitter, cxLookAndFeelPainters, cxButtons,
  cxMemo;

type
  TfrPochasPage = class(TFrame)
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
    ReportDataViewDBColumn2: TcxGridDBColumn;
    DateBegCol: TcxGridDBColumn;
    DateEndCol: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    Panel2: TPanel;
    SmDataSet: TpFIBDataSet;
    OrdersDataSource: TDataSource;
    cxCheckBox2: TcxCheckBox;
    cxCheckBox3: TcxCheckBox;
    ReportDataViewDBColumn8: TcxGridDBColumn;
    ReportDataViewDBColumn1: TcxGridDBColumn;
    ReportDataViewDBColumn3: TcxGridDBColumn;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxSplitter1: TcxSplitter;
    ReportDataViewDBColumn5: TcxGridDBColumn;
    ReportDataViewDBNUM_PROJECT: TcxGridDBColumn;
    ReportDataViewDBDATE_PROJECT: TcxGridDBColumn;
    ReportDataViewDBColumn4: TcxGridDBColumn;
    ReportDataViewDBColumn6: TcxGridDBColumn;
    procedure cxCheckBox2PropertiesChange(Sender: TObject);
    procedure cxCheckBox3PropertiesChange(Sender: TObject);
    procedure ReportDataViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGridDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Select_Type: Integer;
  public
    id_pcard:int64;
    procedure MovingsSelectAfterOpen(DataSet: TDataSet);
    constructor Create(AOwner: TComponent;DBHandle:TISC_DB_HANDLE;Id_PCard: Integer; ActualDate: TDate; Select_Type: Integer); reintroduce;
  end;

implementation

{$R *.dfm}

uses uFormControl, Registry, Clipbrd, UpKernelUnit;

constructor TfrPochasPage.Create(AOwner: TComponent;
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

    HolidaysSelect.SelectSQL.Text:=' SELECT * FROM UP_KER_GET_POCHAS_INFO_BY_PCARD('+IntToStr(id_pcard)+')';
    self.id_pcard:=Id_PCard;

    SmDataSet.SelectSQL.Text:='SELECT * FROM UP_KER_GET_POCHAS_DETAIL(?ID_POCHAS_PLAN)';

    HolidaysSelect.Open;
end;



procedure TfrPochasPage.MovingsSelectAfterOpen(DataSet: TDataSet);
begin
end;

procedure TfrPochasPage.cxCheckBox2PropertiesChange(Sender: TObject);
var I:Integer;
begin
     for i:=0 to ReportDataView.ColumnCount-1 do
     begin
          ReportDataView.Columns[i].Options.Filtering:=cxCheckBox2.Checked;
     end;
end;

procedure TfrPochasPage.cxCheckBox3PropertiesChange(Sender: TObject);
begin
     ReportDataView.OptionsView.GroupByBox:=cxCheckBox3.Checked;
end;

procedure TfrPochasPage.ReportDataViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if (( Key = VK_F12) and (ssShift in Shift))
     then begin
               ShowInfo(HolidaysSelect);
     end;
end;

procedure TfrPochasPage.cxGridDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if (( Key = VK_F12) and (ssShift in Shift))
     then begin
               ShowInfo(SmDataSet);
     end;

end;

end.
