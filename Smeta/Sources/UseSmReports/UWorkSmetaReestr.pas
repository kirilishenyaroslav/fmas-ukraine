unit UWorkSmetaReestr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, StdCtrls, ComCtrls, ToolWin,

  cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,

  Ibase,Menus, FIBDatabase, pFIBDatabase,DateUtils,
  FIBDataSet, pFIBDataSet,pFibStoredProc, ExtCtrls, Buttons,IB_Externals,RegUnit,
  cxCheckBox, cxTextEdit, Resources_unitb, GlobalSpr,
  cxGridBandedTableView, cxGridDBBandedTableView, cxContainer, cxDBEdit,
  cxProgressBar, cxDBProgressBar,FibQuery,UPrBar{, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, dxPScxGridLnk};




type
  TfrmSmetaSpr = class(TForm)
    SmallImages: TImageList;
    cxStyleRepository1: TcxStyleRepository;
    back: TcxStyle;
    WorkPopup: TPopupMenu;
    WorkDatabase: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    SmetaDataSet: TpFIBDataSet;
    SmetaSource: TDataSource;
    column_gray: TcxStyle;
    periods: TcxStyle;
    Panel3: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    Panel5: TPanel;
    Panel1: TPanel;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn2: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn3: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn4: TcxGridDBBandedColumn;
    Label1: TLabel;
    cbMonth: TComboBox;
    cbYear: TComboBox;
    Panel4: TPanel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBTextEdit6: TcxDBTextEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    cxDBTextEdit7: TcxDBTextEdit;
    cxDBTextEdit8: TcxDBTextEdit;
    cxDBTextEdit9: TcxDBTextEdit;
    cxDBTextEdit10: TcxDBTextEdit;
    Label11: TLabel;
    Label12: TLabel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    cxCheckBox1: TcxCheckBox;
    Splitter1: TSplitter;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    cxGrid1DBBandedTableView1DBBandedColumn5: TcxGridDBBandedColumn;
    cxCheckBox2: TcxCheckBox;
    cxGrid1DBBandedTableView1DBBandedColumn6: TcxGridDBBandedColumn;
    ToolButton7: TToolButton;
    cxStyle1: TcxStyle;
    cxGrid1DBBandedTableView1DBBandedColumn7: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn8: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn9: TcxGridDBBandedColumn;
    cxStyle2: TcxStyle;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CloseButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure PropButtonClick(Sender: TObject);
    procedure cxCheckBox1Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure cbMonthChange(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure cxCheckBox2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
     INFINITY_DATE:TdateTime;
     ActualDate:TDateTime;
     ResultValue:Variant;
     CurFS:TFormStyle;
     CurFilter:TSmetaFilterValues;
    { Public declarations }
     constructor Create(AOwner:TComponent; DBHandle:TISC_DB_HANDLE;FS:TFormStyle; Book_Date:TDateTime;Filter:TSmetaFilterValues);overload;
     procedure GetData;
  end;


implementation



{$R *.dfm}
constructor TfrmSmetaSpr.Create(AOwner: TComponent;
  DBHandle: TISC_DB_HANDLE; FS: TFormStyle; Book_Date: TDateTime;Filter:TSmetaFilterValues);
var i:Integer;
begin
      inherited Create(AOwner);
      Self.WorkDatabase.Handle:=DBHAndle;
      caption:='Ðåºñòð áþäæåò³â, ÿê³ ôóíêö³îíóþòü â ïåð³îä³';
      ActualDate:=Book_Date;
      CurFS:=FS;
      CurFilter:=Filter;
      self.FormStyle:=FS;

      cbMonth.Items.Add(TRIM(BU_Month_01));
      cbMonth.Items.Add(TRIM(BU_Month_02));
      cbMonth.Items.Add(TRIM(BU_Month_03));
      cbMonth.Items.Add(TRIM(BU_Month_04));
      cbMonth.Items.Add(TRIM(BU_Month_05));
      cbMonth.Items.Add(TRIM(BU_Month_06));
      cbMonth.Items.Add(TRIM(BU_Month_07));
      cbMonth.Items.Add(TRIM(BU_Month_08));
      cbMonth.Items.Add(TRIM(BU_Month_09));
      cbMonth.Items.Add(TRIM(BU_Month_10));
      cbMonth.Items.Add(TRIM(BU_Month_11));
      cbMonth.Items.Add(TRIM(BU_Month_12));

      for i:=0 to YEARS_COUNT do
      begin
          cbYear.Items.Add(TRIM(IntToStr(BASE_YEAR+i)));
      end;

      cbMonth.ItemIndex:=MonthOf(ActualDate)-1;
      for i:=0 to cbYear.Items.Count-1 do
      begin
           if pos(cbYear.Items[i],IntToStr(YearOf(ActualDate)))>0
           then begin
              cbYear.ItemIndex:=i;
              break;
           end;
      end;
end;

procedure TfrmSmetaSpr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action:=caFree;
end;

procedure TfrmSmetaSpr.CloseButtonClick(Sender: TObject);
begin
    close;
end;

procedure TfrmSmetaSpr.RefreshButtonClick(Sender: TObject);
begin
     GetData;
end;

procedure TfrmSmetaSpr.PropButtonClick(Sender: TObject);
begin
if SmetaDataSet.RecordCount>0
then GetPropByObj(self.owner,WorkDatabase.Handle,
     SmetaDataSet.FieldByName('P_ID_SMETA').AsInteger,ActualDate,4);
end;

procedure TfrmSmetaSpr.GetData;
var ID_PLAN,i:Integer;
    Progress:TfrmPrBar;
begin
         Progress:=TfrmPrBar.Create(self);
         Progress.Show;
         Progress.cxProgressBar1.Position:=5;
         Progress.cxProgressBar1.Update;

         ID_PLAN:=0;
         if SmetaDataSet.Active
         then begin
              if SmetaDataSet.RecordCount>0
              then ID_PLAN:=SmetaDataSet.FieldByName('ID_PLAN').Value
              else ID_PLAN:=0;
              SmetaDataSet.Close;
              Progress.cxProgressBar1.Position:=10;
              Progress.cxProgressBar1.Update;
         end;
         SmetaDataSet.SelectSQL.Text:=' SELECT * FROM BU_GET_WORK_SM_REESTR('+''''+DateTimeToStr(ActualDate)+''''+')';
         Progress.cxProgressBar1.Position:=Progress.cxProgressBar1.Position+50;
         Progress.cxProgressBar1.Update;
         SmetaDataSet.Open;
         Progress.cxProgressBar1.Max:=SmetaDataSet.RecordCountFromSrv+10;
         for i:=1 to SmetaDataSet.RecordCountFromSrv do
         begin
              SmetaDataSet.FetchNext(1);
              Progress.cxProgressBar1.Position:=Progress.cxProgressBar1.Position+1;
              Progress.cxProgressBar1.Update;
         end;
         cxGrid1DBBandedTableView1.DataController.LocateByKey(ID_PLAN);
         Sleep(1000);
         Progress.cxProgressBar1.Position:=100;
         Progress.cxProgressBar1.Update;
         Progress.Close;
         Progress.Free;
end;

procedure TfrmSmetaSpr.cxCheckBox1Click(Sender: TObject);
begin
     if cxCheckBox1.Checked
     then begin
          Panel4.Visible:=true;
          Splitter1.Top:=Panel4.Top+1;
     end
     else begin
          Panel4.Visible:=false;
     end;
end;

procedure TfrmSmetaSpr.ToolButton4Click(Sender: TObject);
begin
     Close;
end;

procedure TfrmSmetaSpr.ToolButton6Click(Sender: TObject);
begin
     GetData;
end;

procedure TfrmSmetaSpr.cbMonthChange(Sender: TObject);
var date_str:string;
begin
     DateSeparator:='.';
     ActualDate:=StrToDate('01.'+IntToStr(cbMonth.ItemIndex+1)+'.'+cbYear.Items[cbYear.ItemIndex]);
     DateTimeToString(date_str,'dd.mm.yyyy',ActualDate);
     Getdata;
end;

procedure TfrmSmetaSpr.ToolButton3Click(Sender: TObject);
begin
     if SmetaDataSet.RecordCount>0
     then begin
          GlobalSpr.GetSmResults(Application.MainForm,
                                 WorkDatabase.Handle,
                                 fsMdiChild,
                                 ActualDate,
                                 TFibBCDField(SmetaDataSet.FieldByName('ID_SMETA')).AsInt64,
                                 TFibBCDField(SmetaDataSet.FieldByName('ID_PLAN')).AsInt64);
     end;
end;

procedure TfrmSmetaSpr.cxCheckBox2Click(Sender: TObject);
begin
     cxGrid1DBBandedTableView1.OptionsView.GroupByBox:=cxCheckBox2.Checked;
end;

procedure TfrmSmetaSpr.FormShow(Sender: TObject);
begin
      Screen.Cursor:=crHourGlass;
      GetData;
      Screen.Cursor:=crDefault;
end;

end.
