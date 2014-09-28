unit SpTuTemplet_ManDog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxLookAndFeelPainters, ActnList,
  StdCtrls, cxButtons, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  ExtCtrls,TuSpDog_DM,TuCommonProc,TuCommonStyles, dxBar, dxBarExtItems, ZcxLocateBar,
  Dates, dxStatusBar;

type   TSpDogFilterParam = class(TObject)
  Owner:TComponent;
  //FormStyle:TTuFormStyleTh;
  KodSetup:integer;
  DateBegActive:variant;
  DateEndActive:variant;
  id_man:variant;
  rmoving:variant;
  id_post_moving:variant;
  FioDog:string;
  FioMan:string;
  DateBeg:variant;
  DateEnd:variant;
end;

type
  TFormMan = class(TForm)
    Panel2: TPanel;
    Grid1: TcxGrid;
    Grid1DBTableView1: TcxGridDBTableView;
    Grid1ColTN: TcxGridDBColumn;
    Grid1ColFIO: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    BarManager: TdxBarManager;
    ButtonRefresh: TdxBarLargeButton;
    ButtonExit: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    Splitter1: TSplitter;
    BarDockLocate: TdxBarDockControl;
    Panel3: TPanel;
    cxGrid1: TcxGrid;
    Grid111DBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGrid2: TcxGrid;
    Grid11DBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    Splitter2: TSplitter;
    Grid111ColDateBeg: TcxGridDBColumn;
    Grid111ColDateEnd: TcxGridDBColumn;
    Grid111ColKolStavok: TcxGridDBColumn;
    Grid111ColNameSmet: TcxGridDBColumn;
    Grid11DBTableView1DBColumn1: TcxGridDBColumn;
    Grid11DBTableView1DBColumn2: TcxGridDBColumn;
    dxStatusBar1: TdxStatusBar;
    ButtonFilter: TdxBarLargeButton;
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure ButtonExitClick(Sender: TObject);
    procedure ButtonRefreshClick(Sender: TObject);
    procedure EditMonthClick(Sender: TObject);
    procedure Grid11DBTableView1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    KodSetup:integer;
    FIdMan:variant;
    pStylesDM:TStyleDM;
    PBarLocate:TZBarLocate;
   constructor create (Aowner:TComponent;AKodSetup:integer; AidMan:variant);reintroduce;
  end;



implementation

{$R *.dfm}

constructor TFormMan.create (Aowner:TComponent;AKodSetup:integer; AidMan:variant);
var YearAct, MonthAct,i:word;
date_Loc:Tdate;
begin

inherited create (Aowner);
 KodSetup:=AKodSetup;
FIdMan:=AIdMan;

Grid1DBTableView1.DataController.DataSource:=DM.DSource1;
Grid11DBTableView1.DataController.DataSource:=DM.DSource11;
Grid111DBTableView1.DataController.DataSource:=DM.DSource111;
//******************************************************************************
Grid1ColTN.Caption:=GetConst('TIN','GridColumn');
Grid1ColFIO.Caption:=GetConst('Fio','GridColumn');
caption:=GetConst('Dog','Form');
EditMonth.Items.Text:=GetConst('MonthJanuary','OtherConsts')+#13+
                                  GetConst('MonthFebruary','OtherConsts')+#13+
                                  GetConst('MonthMarch','OtherConsts')+#13+
                                  GetConst('MonthApril','OtherConsts')+#13+
                                  GetConst('MonthMay','OtherConsts')+#13+
                                  GetConst('MonthJune','OtherConsts')+#13+
                                  GetConst('MonthJuly','OtherConsts')+#13+
                                  GetConst('MonthAutumn','OtherConsts')+#13+
                                  GetConst('MonthSeptember','OtherConsts')+#13+
                                  GetConst('MonthOctober','OtherConsts')+#13+
                                  GetConst('MonthNovember','OtherConsts')+#13+
                                  GetConst('MonthDecember','OtherConsts');
//******************************************************************************
 date_Loc:=strtodate(KodSetupToPeriod(KodSetup,6));
  DecodeDate(Date_Loc,YearAct,MonthAct,i);
  EditMonth.ItemIndex:=MonthAct-1;
  EditYear.Value:=YearAct;
pStylesDM:=TStyleDM.Create(Self);
Grid1DBTableView1.Styles.StyleSheet:=pStylesDM.GridTableViewStyleSheetDevExpress ;
Grid11DBTableView1.Styles.StyleSheet:=pStylesDM.GridTableViewStyleSheetDevExpress ;
Grid111DBTableView1.Styles.StyleSheet:=pStylesDM.GridTableViewStyleSheetDevExpress ;
//******************************************************************************
 PBarLocate:=TZBarLocate.Create(BarManager);
 PBarLocate.DataSet := DM.DSet1;
 PBarLocate.BorderStyle := bbsNone;
 PBarLocate.AddLocateItem('FIO',Grid1ColFIO.Caption,[loCaseInsensitive,loPartialKey]);
 PBarLocate.AddLocateItem('TN',Grid1ColTn.Caption,[loCaseInsensitive,loPartialKey]);
 PBarLocate.DigitalField := 'TN';
 PBarLocate.FieldSelectVisible := False;
 PBarLocate.DockControl := BarDockLocate;
 ButtonRefreshClick(nil);
//******************************************************************************
end;





procedure TFormMan.dxBarLargeButton1Click(Sender: TObject);
begin
ModalResult:=mrYes
end;

procedure TFormMan.ButtonExitClick(Sender: TObject);
begin
Modalresult:=mrCancel;
end;

procedure TFormMan.ButtonRefreshClick(Sender: TObject);
begin
KodSetup:=PeriodToKodSetup(EditYear.IntValue,EditMonth.ItemIndex+1);
if DM.DSet1.active  then DM.DSet1.close;
if DM.DSet11.active  then DM.DSet11.close;
if DM.DSet111.active  then DM.DSet111.close;
if FIdman=null then
  DM.DSet1.SQLs.SelectSQL.Text:='select * from TU_Z_MOVINGS_DOG_1('+inttostr(KodSetup)+')'
else
  DM.DSet1.SQLs.SelectSQL.Text:='select * from TU_Z_MOVINGS_DOG_1('+inttostr(KodSetup)+') dg where dg.id_man='+inttostr(FidMan)  ;
DM.DSet11.SQLs.SelectSQL.Text:='select * from TU_Z_MOVINGS_DOG_2(?ID_MAN, '+inttostr(KodSetup)+')';
DM.DSet111.SQLs.SelectSQL.Text:='select * from TU_Z_MOVINGS_DOG_3(?RMOVING, ?ID_POST_MOVING,'+inttostr(KodSetup)+')';
DM.DSet1.open;
DM.DSet11.open;
DM.DSet111.open;
end;

procedure TFormMan.EditMonthClick(Sender: TObject);
begin
ButtonRefreshClick(Sender);
end;

procedure TFormMan.Grid11DBTableView1DblClick(Sender: TObject);
begin
if FormStyle=fsnormal then  dxBarLargeButton1Click(Sender);
end;

end.
