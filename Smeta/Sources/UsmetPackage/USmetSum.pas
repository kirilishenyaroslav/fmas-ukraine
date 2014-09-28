unit USmetSum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls,Buttons, Resources_unitb, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalc,
  ComCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, DB, cxDBData, cxCheckBox, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridBandedTableView,
  cxGridDBBandedTableView, cxClasses, cxGridCustomView, cxGrid, FIBDataSet,
  pFIBDataSet, RxMemDS, pFibStoredProc, TeeProcs, TeEngine, Chart, Series,
  cxRadioGroup, cxPropertiesStore, cxGridDBTableView,
  cxLookAndFeelPainters, cxButtons, cxSplitter, cxCurrencyEdit;

type
  TfrmPlanSum = class(TForm)
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    columnst: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    MonthValuesDataSetBuffer: TRxMemoryData;
    SchFibDataSet: TpFIBDataSet;
    cxPropertiesStore1: TcxPropertiesStore;
    MonthDataSource: TDataSource;
    MonthValues: TpFIBDataSet;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EdObj: TEdit;
    EdDoc: TEdit;
    EdCurrentValue: TcxTextEdit;
    GroupBox2: TGroupBox;
    checkDelta: TcxRadioButton;
    EdDeltaSum: TcxCalcEdit;
    checknewsum: TcxRadioButton;
    EdNewSum: TcxCalcEdit;
    BeforeSumma: TcxTextEdit;
    Label4: TLabel;
    UseAutoByMonth: TcxRadioButton;
    cxRadioButton2: TcxRadioButton;
    Panel1: TPanel;
    cxSplitter1: TcxSplitter;
    cxGrid1: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridDBTableView3DBColumn1: TcxGridDBColumn;
    cxGridDBTableView3DBColumn2: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    Panel4: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure EdSumKeyPress(Sender: TObject; var Key: Char);
    procedure checkDeltaClick(Sender: TObject);
    procedure checknewsumClick(Sender: TObject);
    procedure EdNewSumPropertiesEditValueChanged(Sender: TObject);
    procedure EdDeltaSumPropertiesEditValueChanged(Sender: TObject);
    procedure EdDeltaSumEnter(Sender: TObject);
    procedure EdNewSumEnter(Sender: TObject);
    procedure cxRadioButton2Click(Sender: TObject);
    procedure UseAutoByMonthClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxGridDBTableView3DblClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
  private
    { Private declarations }
    local_is_inserting:Boolean;
    id_sum:Int64;
    function CorrectData:Boolean;
  public
    { Public declarations }
    KEY_SESSION:Int64;
    constructor Create(AOwner:TComponent;Id_SUM:Int64; id_plan:Int64; is_inserting:Boolean);reintroduce;
  end;

implementation

Uses BaseTypes, USmetStru, FIBDatabase, uBuMonthValues;
{$R *.dfm}

procedure TfrmPlanSum.Button1Click(Sender: TObject);
begin
     if CorrectData
     then begin
               ModalResult:=mrYes;
     end;
end;

procedure TfrmPlanSum.Button2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

function TfrmPlanSum.CorrectData: Boolean;
var ResChecking:Boolean;
    NewPlanSumma:variant;
begin
      ResChecking:=true;
      if (EdDeltaSum.Text='') and ResChecking
      then begin
                ResChecking:=false;
                BaseTypes.agMessageDlg(BU_ErrorCaption,BU_TitleError,mtError,[mbOk]);
      end;

      //ѕровер€ем что помес€чна€ разбивка совпадает с общим итогом
      if ResChecking and (not UseAutoByMonth.Checked)
      then begin
                if CheckDelta.Checked
                then NewPlanSumma:=StrToFloat(EdDeltaSum.Text)+StrToFloat(EdCurrentValue.Text)
                else NewPlanSumma:=StrToFloat(EdNewSum.Text);

                if (NewPlanSumma<>cxGridDBTableView3.DataController.Summary.FooterSummaryValues[0])
                then begin
                          ResChecking:=false;
                          BaseTypes.agMessageDlg(BU_ErrorCaption,'–озбивка по м≥с€ц€м не сп≥впадаЇ з загальною сумою!',mtError,[mbOk]);
                end;
      end;

      CorrectData:=ResChecking;
end;

procedure TfrmPlanSum.EdSumKeyPress(Sender: TObject; var Key: Char);
begin
     if not (Key in ['0'..'9',',']) then Key := #0;
end;


procedure TfrmPlanSum.checkDeltaClick(Sender: TObject);
begin
     EdDeltaSum.Enabled:=true;
     EdDeltaSum.Properties.OnEditValueChanged:=EdDeltaSumPropertiesEditValueChanged;

     EdNewSum.Enabled  :=false;
     EdNewSum.Properties.OnEditValueChanged:=nil;
end;

procedure TfrmPlanSum.checknewsumClick(Sender: TObject);
begin
     EdDeltaSum.Enabled:=false;
     EdDeltaSum.Properties.OnEditValueChanged:=nil;

     EdNewSum.Enabled  :=true;
     EdNewSum.Properties.OnEditValueChanged:=EdNewSumPropertiesEditValueChanged;
end;

procedure TfrmPlanSum.EdNewSumPropertiesEditValueChanged(Sender: TObject);
begin
     if (EdCurrentValue.Text<>'')
     then begin
                 try
                     EdDeltaSum.Value:=EdNewSum.Value-StrToFloat(EdCurrentValue.Text);
                 except on E:Exception do
                     begin
                          EdDeltaSum.Value:=0;
                     end
                 end;
     end;
end;

procedure TfrmPlanSum.EdDeltaSumPropertiesEditValueChanged(
  Sender: TObject);
begin
     if (EdCurrentValue.Text<>'')
     then begin
               try
                   EdNewSum.Value:=EdDeltaSum.Value+StrToFloat(EdCurrentValue.Text);
               except on E:Exception do
                   begin
                        EdNewSum.Value:=0;
                   end;
               end;
     end;
end;

procedure TfrmPlanSum.EdDeltaSumEnter(Sender: TObject);
begin
     EdNewSum.Properties.OnEditValueChanged  :=nil;
     EdDeltaSum.Properties.OnEditValueChanged:=EdDeltaSumPropertiesEditValueChanged;

end;

procedure TfrmPlanSum.EdNewSumEnter(Sender: TObject);
begin
     EdNewSum.Properties.OnEditValueChanged  :=EdNewSumPropertiesEditValueChanged;
     EdDeltaSum.Properties.OnEditValueChanged:=nil;
end;

constructor TfrmPlanSum.Create(AOwner: TComponent; Id_SUM: Int64; id_plan:Int64; is_inserting:Boolean);
begin
     inherited Create(AOwner);
     Local_is_inserting:=is_inserting;
     PageControl1.ActivePageIndex:=0;
     self.id_sum:=id_sum;

     if (ID_SUM<>-1)
     then begin
               MonthValues.Database:=TfrmSmetaStru(owner).WorkDatabase;
               MonthValues.Transaction:=TfrmSmetaStru(owner).ReadTransaction;
               MonthValues.SelectSQL.Text:=' SELECT * FROM BU_DOCS_SUM_BY_MONTH_SEL('+IntToStr(ID_SUM)+',0)';
               MonthValues.Open;
               MonthValues.FetchAll;
     end
     else begin
               MonthValues.Database:=TfrmSmetaStru(owner).WorkDatabase;
               MonthValues.Transaction:=TfrmSmetaStru(owner).ReadTransaction;
               MonthValues.SelectSQL.Text:=' SELECT * FROM BU_DOCS_SUM_BY_MONTH_SEL2('+IntToStr(id_plan)+')';
               MonthValues.Open;
               MonthValues.FetchAll;
     end;
     MonthValuesDataSetBuffer.CopyStructure(MonthValues);
     MonthValuesDataSetBuffer.LoadFromDataSet(MonthValues, MonthValues.RecordCount, lmCopy);
     MonthValues.Close;
end;


procedure TfrmPlanSum.cxRadioButton2Click(Sender: TObject);
begin
     //¬ключен режим локальной корректировки
     cxButton1.Enabled:=cxRadioButton2.Checked;
     cxButton2.Enabled:=cxRadioButton2.Checked;
     cxGrid1.Enabled  :=cxRadioButton2.Checked;
     Panel1.Visible   :=cxRadioButton2.Checked;
end;

procedure TfrmPlanSum.UseAutoByMonthClick(Sender: TObject);
begin
     cxButton1.Enabled:=cxRadioButton2.Checked;
     cxButton2.Enabled:=cxRadioButton2.Checked;
     cxGrid1.Enabled  :=cxRadioButton2.Checked;
     Panel1.Visible   :=cxRadioButton2.Checked;

     cxSplitter1.OpenSplitter;
end;

procedure TfrmPlanSum.cxButton1Click(Sender: TObject);
var T:TfrmGetMonthValues;
begin
     T:=TfrmGetMonthValues.Create(self);
     T.cxCalcEdit1.Value:=MonthValuesDataSetBuffer.FieldByName('PLAN_SUM').Value;
     T.Label2.Caption   :=MonthValuesDataSetBuffer.FieldByName('DATE_REG').AsString;
     if T.ShowModal=mrYes
     then begin
               MonthValuesDataSetBuffer.Edit;
               MonthValuesDataSetBuffer.FieldByName('ID_SUM_BY_MONTH').AsInteger:=MonthValuesDataSetBuffer.FieldByName('ID_SUM_BY_MONTH').AsInteger;
               MonthValuesDataSetBuffer.FieldByName('ID_SUM').AsInteger         :=MonthValuesDataSetBuffer.FieldByName('ID_SUM').AsInteger;
               MonthValuesDataSetBuffer.FieldByName('PLAN_SUM').Value       :=T.cxCalcEdit1.Value;
               MonthValuesDataSetBuffer.Post;
     end;
     T.Free;
end;

procedure TfrmPlanSum.cxGridDBTableView3DblClick(Sender: TObject);
begin
     cxButton1.OnClick(self);
end;

procedure TfrmPlanSum.cxButton2Click(Sender: TObject);
var i:Integer;
begin
      MonthValuesDataSetBuffer.First;
      for i:=0 to MonthValuesDataSetBuffer.RecordCount-1 do
      begin
            MonthValuesDataSetBuffer.Edit;
            MonthValuesDataSetBuffer.FieldByName('ID_SUM_BY_MONTH').AsInteger:=MonthValuesDataSetBuffer.FieldByName('ID_SUM_BY_MONTH').AsInteger;
            MonthValuesDataSetBuffer.FieldByName('ID_SUM').AsInteger         :=MonthValuesDataSetBuffer.FieldByName('ID_SUM').AsInteger;
            MonthValuesDataSetBuffer.FieldByName('DATE_REG').Value       :=MonthValuesDataSetBuffer.FieldByName('DATE_REG').Value;
            MonthValuesDataSetBuffer.FieldByName('PLAN_SUM').Value           :=0;
            MonthValuesDataSetBuffer.Post;
            MonthValuesDataSetBuffer.Next;
      end;

end;

procedure TfrmPlanSum.cxButton3Click(Sender: TObject);
begin
     MonthValues.Database:=TfrmSmetaStru(owner).WorkDatabase;
     MonthValues.Transaction:=TfrmSmetaStru(owner).ReadTransaction;
     MonthValues.SelectSQL.Text:=' SELECT * FROM BU_DOCS_SUM_BY_MONTH_SEL('+IntToStr(ID_SUM)+',1)';
     MonthValues.Open;
     MonthValues.FetchAll;

     MonthValuesDataSetBuffer.Close;
     MonthValuesDataSetBuffer.CopyStructure(MonthValues);
     MonthValuesDataSetBuffer.LoadFromDataSet(MonthValues, MonthValues.RecordCount, lmCopy);
     MonthValues.Close;
end;

end.
