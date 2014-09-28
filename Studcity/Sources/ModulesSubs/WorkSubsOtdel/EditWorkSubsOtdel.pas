unit EditWorkSubsOtdel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, StdCtrls, cxGridTableView,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridDBTableView, cxGrid,
  StudcityConst, Gauges, ExtCtrls, cxLookAndFeelPainters, cxButtons,
  FIBDataSet, pFIBDataSet, RxMemDS, cxContainer, cxLabel, ActnList,
  St_ser_function;

type
  TfrmEditWorkSubsOtdel = class(TForm)
    StatusBar1: TStatusBar;
    cxGridPret: TcxGrid;
    cxGridPretDBTableView1: TcxGridDBTableView;
    cxGridPretLevel1: TcxGridLevel;
    StyleRepository: TcxStyleRepository;
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
    cxStyleYellow: TcxStyle;
    cxStyleFontBlack: TcxStyle;
    cxStyleMalin: TcxStyle;
    cxStyleBorder: TcxStyle;
    cxStylemalinYellow: TcxStyle;
    cxStyleGrid: TcxStyle;
    cxStyleSilver: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    GroupBox1: TGroupBox;
    cxGridList: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    PanelProgress: TPanel;
    GaugeProress: TGauge;
    ButtonRihgtAll: TcxButton;
    ButtonLeftOne: TcxButton;
    ButtonLeftAll: TcxButton;
    ButtonSave: TcxButton;
    ButtonClose: TcxButton;
    ButtonRihgtOne: TcxButton;
    pFIBDataSetPret: TpFIBDataSet;
    pFIBDataSetWork: TpFIBDataSet;
    cxGridPretFIO: TcxGridDBColumn;
    cxGridWorkFIO: TcxGridDBColumn;
    DataSourcePret: TDataSource;
    DataSourceWork: TDataSource;
    Timer: TTimer;
    RxMemoryDataList: TRxMemoryData;
    RxMemoryDataPR: TRxMemoryData;
    pFIBDataSetCorrect: TpFIBDataSet;
    GroupBox2: TGroupBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    pFIBDataSetGetFamily: TpFIBDataSet;
    ActionList1: TActionList;
    ActionSave: TAction;
    procedure FormCreate(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure ButtonRihgtOneClick(Sender: TObject);
    procedure ButtonRihgtAllClick(Sender: TObject);
    procedure ButtonLeftOneClick(Sender: TObject);
    procedure ButtonLeftAllClick(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);
    procedure RxMemoryDataPRAfterScroll(DataSet: TDataSet);
    procedure RxMemoryDataListAfterScroll(DataSet: TDataSet);
    procedure cxGridPretDBTableView1CellClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGridDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure ActionSaveExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cxGridPretDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGridDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    id_serves : int64;
    constructor Create (Aowner:TComponent;id_list:Int64);overload;
    { Public declarations }
  end;

var
  frmEditWorkSubsOtdel: TfrmEditWorkSubsOtdel;
  id_list_edit:Int64;
  ResultWork:Variant;
  viewDetails:Integer;
  closeFlag:Integer;
  lang:Integer;
implementation
uses
  MainFormWorkSubsOrdel,
  EditWorkSubsOtdelPeople;
{$R *.dfm}

constructor  TfrmEditWorkSubsOtdel.Create (Aowner:TComponent;id_list:Int64);
begin
  Inherited Create(Aowner);
  id_list_edit:=id_list;
end;

procedure TfrmEditWorkSubsOtdel.FormCreate(Sender: TObject);
begin

  Lang:=ST_serLanguageIndex(TfrmMainFormWorkSubsOrdel(self.owner).Database.Handle);

  Caption:=StudcityConst.Studcity_WorkListEditList_EX[lang];

  ButtonLeftOne.Caption:=StudcityConst.Studcity_SubsLeftOne_EX[lang];
  ButtonLeftAll.Caption:=StudcityConst.Studcity_SubsLeftAll_EX[lang];
  ButtonRihgtOne.Caption:=StudcityConst.Studcity_SubsRightOne_EX[lang];
  ButtonRihgtAll.Caption:=StudcityConst.Studcity_SubsRightALL_EX[lang];
  ButtonClose.Caption:=StudcityConst.Studcity_ACTION_CLOSE_CONST_EX[lang];
  ButtonSave.Caption:=StudcityConst.Studcity_ACTION_SAVE_CONST_EX[lang];
  cxGridPretFIO.Caption:=StudcityConst.Studcity_WorkListEditPret_EX[lang];
  cxGridWorkFIO.Caption:=StudcityConst.Studcity_WorkListEditWork_EX[lang];

  cxLabel1.Caption:=StudcityConst.Studcity_WorkListNUMB_EX[lang];
  cxLabel2.Caption:=StudcityConst.Studcity_WorkListMounth_EX[lang];
  cxLabel3.Caption:=StudcityConst.Studcity_WorkListSumSumma_EX[lang];
  cxLabel4.Caption:=StudcityConst.Studcity_WorkListSumSubs_EX[lang];

  Timer.Enabled:=true;

  pFIBDataSetGetFamily.Database:=TfrmMainFormWorkSubsOrdel(self.owner).Database;
  pFIBDataSetGetFamily.Transaction:=TfrmMainFormWorkSubsOrdel(self.owner).ReadTransaction;

  closeFlag:=0;
  viewDetails:=0;
end;

procedure TfrmEditWorkSubsOtdel.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEditWorkSubsOtdel.TimerTimer(Sender: TObject);
var
  pos,i:Integer;

begin
  Timer.Enabled:=false;

  pos:=0;

  viewDetails:=0;

  cxGridPretDBTableView1.BeginUpdate;
  cxGridDBTableView1.BeginUpdate;

  GaugeProress.Visible:=true;
  PanelProgress.Caption:=StudcityConst.Studcity_Wait;
  PanelProgress.Visible:=true;
  Refresh;

  pFIBDataSetPret.Active:=false;
  pFIBDataSetPret.Database:=TfrmMainFormWorkSubsOrdel(self.owner).Database;
  pFIBDataSetPret.Transaction:=TfrmMainFormWorkSubsOrdel(self.owner).ReadTransaction;
  pFIBDataSetPret.ParamByName('param_list').AsInt64:=id_list_edit;
  pFIBDataSetPret.Active:=true;
  pFIBDataSetPret.FetchAll;


  pFIBDataSetWork.Active:=false;
  pFIBDataSetWork.Database:=TfrmMainFormWorkSubsOrdel(self.owner).Database;
  pFIBDataSetWork.Transaction:=TfrmMainFormWorkSubsOrdel(self.owner).ReadTransaction;
  pFIBDataSetWork.ParamByName('param_list').AsInt64:=id_list_edit;
  pFIBDataSetWork.Active:=true;
  pFIBDataSetWork.FetchAll;

  GaugeProress.MaxValue:=pFIBDataSetPret.RecordCount+pFIBDataSetWork.RecordCount;

  Refresh;
  //отбор претендентов
  pFIBDataSetPret.First;
  RxMemoryDataPR.First;
  for i:=0 to pFIBDataSetPret.RecordCount-1 do
    begin
      RxMemoryDataPR.Open;
      RxMemoryDataPR.Insert;
      RxMemoryDataPR.FieldByName('RXFIO').Value:=pFIBDataSetPret.FieldValues['FIO'];
      RxMemoryDataPR.FieldByName('RxID_Key').Value:=pFIBDataSetPret.FieldValues['ID_KEY'];
      RxMemoryDataPR.FieldByName('RxNumB').Value:=pFIBDataSetPret.FieldValues['NUMB'];
      RxMemoryDataPR.FieldByName('RxMonth').Value:=pFIBDataSetPret.FieldValues['NUMM'];
      RxMemoryDataPR.FieldByName('RxSumma').Value:=pFIBDataSetPret.FieldValues['Summa'];
      RxMemoryDataPR.FieldByName('RxSubs').Value:=pFIBDataSetPret.FieldValues['Subs'];
      RxMemoryDataPR.Post;
      pFIBDataSetPret.Next;
      RxMemoryDataPR.Next;
      inc(pos);
      GaugeProress.Progress:=pos;
    end;
  Refresh;

  RxMemoryDataPr.First;


 //отбор обработанных

  Refresh;

  pFIBDataSetWork.First;
  RxMemoryDataList.First;
  for i:=0 to pFIBDataSetWork.RecordCount-1 do
    begin
      RxMemoryDataList.Open;
      RxMemoryDataList.Insert;
      RxMemoryDataList.FieldByName('RXFIO').Value:=pFIBDataSetWork.FieldValues['FIO'];
      RxMemoryDataList.FieldByName('RxID_PEOPLE').Value:=pFIBDataSetWork.FieldValues['ID_KOD'];
      RxMemoryDataList.FieldByName('RxID_Key').Value:=pFIBDataSetWork.FieldValues['ID_KEY'];
      RxMemoryDataList.FieldByName('RxFlagNew').Value:=0;
      RxMemoryDataList.FieldByName('RxNumB').Value:=pFIBDataSetWork.FieldValues['NUMB'];
      RxMemoryDataList.FieldByName('RxMonth').Value:=pFIBDataSetWork.FieldValues['NUMM'];
      RxMemoryDataList.FieldByName('RxSumma').Value:=pFIBDataSetWork.FieldValues['Summa'];
      RxMemoryDataList.FieldByName('RxSubs').Value:=pFIBDataSetWork.FieldValues['Subs'];
      RxMemoryDataList.Post;
      pFIBDataSetWork.Next;
      RxMemoryDataList.Next;
      inc(pos);
      GaugeProress.Progress:=pos;
    end;

  Refresh;
  RxMemoryDataList.First;



  GaugeProress.Visible:=false;
  PanelProgress.Caption:=StudcityConst.Studcity_Wait;
  PanelProgress.Visible:=false;

  cxGridPretDBTableView1.EndUpdate;
  cxGridDBTableView1.EndUpdate;


  Refresh;
  
  viewDetails:=1;

  RxMemoryDataPR.Next;
  RxMemoryDataPR.Prior;  
end;

procedure TfrmEditWorkSubsOtdel.ButtonRihgtOneClick(Sender: TObject);
var
  Work:TfrmEditWorkSubsOtdelPeople;
  NumB:Int64;
begin
if RxMemoryDataPR.RecordCount>0 then
  begin
    NumB:=RxMemoryDataPR.FieldByName('RxId_Key').asVariant;
    ResultWork:=0;
    viewDetails:=0;
    Work:=TfrmEditWorkSubsOtdelPeople.Create(self,NumB,TfrmMainFormWorkSubsOrdel(self.owner).Database.Handle);
    ResultWork:=Work.Get();
    if ResultWork>0 then
      begin
        //добавление
        RxMemoryDataList.Open;
        RxMemoryDataList.Insert;
        RxMemoryDataList.FieldByName('RXFIO').Value:=RxMemoryDataPR.FieldByName('RXFIO').AsVariant;
        RxMemoryDataList.FieldByName('RxID_PEOPLE').Value:=ResultWork;
        RxMemoryDataList.FieldByName('RxID_Key').Value:=RxMemoryDataPR.FieldByName('RXID_KEY').AsVariant;
        RxMemoryDataList.FieldByName('RxFlagNew').Value:=1;
        RxMemoryDataList.FieldByName('RxNumB').Value:=RxMemoryDataPR.FieldByName('RXNUMB').AsVariant;
        RxMemoryDataList.FieldByName('RXMonth').Value:=RxMemoryDataPR.FieldByName('RXMonth').AsVariant;
        RxMemoryDataList.FieldByName('RXsumma').Value:=RxMemoryDataPR.FieldByName('RXsumma').AsVariant;
        RxMemoryDataList.FieldByName('RXsubs').Value:=RxMemoryDataPR.FieldByName('RXsubs').AsVariant;                
        RxMemoryDataList.Post;
        //Удаление
        RxMemoryDataPR.Delete;
        viewDetails:=1;
      end;
  end;
end;

procedure TfrmEditWorkSubsOtdel.ButtonRihgtAllClick(Sender: TObject);
var
  i:Integer;
  peopleDel:array of variant;
  cntDel:Integer;
begin
viewDetails:=0;
if RxMemoryDataPR.RecordCount>0 then
  begin
    cxGridPretDBTableView1.BeginUpdate;
    cxGridDBTableView1.BeginUpdate;

    GaugeProress.Visible:=true;
    PanelProgress.Caption:=StudcityConst.Studcity_Wait;
    PanelProgress.Visible:=true;
    Refresh;
    GaugeProress.MaxValue:=2*RxMemoryDataPR.RecordCount-1;

    SetLength(peopleDel,RxMemoryDataPR.RecordCount+1);
    cntDel:=0;
    pFIBDataSetCorrect.Active:=false;
    pFIBDataSetCorrect.Database:=TfrmMainFormWorkSubsOrdel(self.owner).Database;
    pFIBDataSetCorrect.Transaction:=TfrmMainFormWorkSubsOrdel(self.owner).ReadTransaction;

    RxMemoryDataPR.First;

    for i:=0 to RxMemoryDataPR.RecordCount-1 do
      begin
        if  RxMemoryDataPR.FieldByName('RxNumB').AsVariant>0 then
          begin
            pFIBDataSetCorrect.Active:=false;
            pFIBDataSetCorrect.ParamByName('param_act').AsVariant:=RxMemoryDataPR.FieldByName('RxNumB').AsVariant;
            pFIBDataSetCorrect.Active:=true;
            pFIBDataSetCorrect.FetchAll;
            if pFIBDataSetCorrect.RecordCount=1 then
              begin
                RxMemoryDataList.Open;
                RxMemoryDataList.Insert;
                RxMemoryDataList.FieldByName('RXFIO').Value:=RxMemoryDataPR.FieldByName('RXFIO').AsVariant;
                RxMemoryDataList.FieldByName('RxID_PEOPLE').Value:=pFIBDataSetCorrect.FieldByName('id_kod').AsVariant;
                RxMemoryDataList.FieldByName('RxID_Key').Value:=RxMemoryDataPR.FieldByName('RXID_KEY').AsVariant;
                RxMemoryDataList.FieldByName('RxFlagNew').Value:=1;
                RxMemoryDataList.FieldByName('RxNumB').Value:=RxMemoryDataPR.FieldByName('RXNumB').AsVariant;
                RxMemoryDataList.FieldByName('RXmonth').Value:=RxMemoryDataPR.FieldByName('RxMonth').AsVariant;
                RxMemoryDataList.FieldByName('RXsumma').Value:=RxMemoryDataPR.FieldByName('RXsumma').AsVariant;
                RxMemoryDataList.FieldByName('RXsubs').Value:=RxMemoryDataPR.FieldByName('RXsubs').AsVariant;
                RxMemoryDataList.Post;
                peopleDel[cntDel]:=RxMemoryDataPR.FieldValues['RxID_KEY'];
                inc(cntDel);
              end;
          end;
        RxMemoryDataPR.Next;
        GaugeProress.Progress:=i;
      end;
    Refresh;      
    for i:=0 to cntDel-1 do
      begin
        RxMemoryDataPR.Locate('RxID_KEY',peopleDel[i],[]);
        RxMemoryDataPR.Delete;
        GaugeProress.Progress:=GaugeProress.Progress+1;;
      end;
    GaugeProress.Visible:=false;
    PanelProgress.Caption:=StudcityConst.Studcity_Wait;
    PanelProgress.Visible:=false;

    RxMemoryDataPR.First;
    RxMemoryDataList.First;

    cxGridPretDBTableView1.EndUpdate;
    cxGridDBTableView1.EndUpdate;
  end;
viewDetails:=1;  
end;

procedure TfrmEditWorkSubsOtdel.ButtonLeftOneClick(Sender: TObject);
begin
if RxMemoryDataList.RecordCount>0 then
  begin
      //добавление
      RxMemoryDataPR.Open;
      RxMemoryDataPR.Insert;
      RxMemoryDataPR.FieldByName('RXFIO').Value:=RxMemoryDataList.FieldByName('RXFIO').AsVariant;
      RxMemoryDataPR.FieldByName('RxID_Key').Value:=RxMemoryDataList.FieldByName('RxID_Key').AsVariant;
      RxMemoryDataPR.FieldByName('RxNumB').Value:=RxMemoryDataList.FieldByName('RxNumB').AsVariant;
      RxMemoryDataPR.FieldByName('RxMonth').Value:=RxMemoryDataList.FieldByName('RxMonth').AsVariant;
      RxMemoryDataPR.FieldByName('RXsumma').Value:=RxMemoryDataList.FieldByName('RXsumma').AsVariant;
      RxMemoryDataPR.FieldByName('RXsubs').Value:=RxMemoryDataList.FieldByName('RXsubs').AsVariant;
      RxMemoryDataPR.Post;
      //удаление
      RxMemoryDataList.Delete;
  end;
end;

procedure TfrmEditWorkSubsOtdel.ButtonLeftAllClick(Sender: TObject);
var
  i,pos:Integer;
begin
viewDetails:=0;
if RxMemoryDataList.RecordCount>0 then
  begin

    cxGridPretDBTableView1.BeginUpdate;
    cxGridDBTableView1.BeginUpdate;

    GaugeProress.Visible:=true;
    PanelProgress.Caption:=StudcityConst.Studcity_Wait;
    PanelProgress.Visible:=true;
    Refresh;

    GaugeProress.MaxValue:=RxMemoryDataList.RecordCount-1;

    RxMemoryDataList.First;
    for i:=0 to RxMemoryDataList.RecordCount-1 do
      begin
        //добавление
        RxMemoryDataPR.Open;
        RxMemoryDataPR.Insert;
        RxMemoryDataPR.FieldByName('RXFIO').Value:=RxMemoryDataList.FieldByName('RXFIO').AsVariant;
        RxMemoryDataPR.FieldByName('RxID_Key').Value:=RxMemoryDataList.FieldByName('RxID_Key').AsVariant;
        RxMemoryDataPR.FieldByName('RxNumB').Value:=RxMemoryDataList.FieldByName('RxNumB').AsVariant;
        RxMemoryDataPR.FieldByName('RxMonth').Value:=RxMemoryDataList.FieldByName('RxMonth').AsVariant;
        RxMemoryDataPR.FieldByName('RXsumma').Value:=RxMemoryDataList.FieldByName('RXsumma').AsVariant;
        RxMemoryDataPR.FieldByName('RXsubs').Value:=RxMemoryDataList.FieldByName('RXsubs').AsVariant;
        RxMemoryDataPR.Post;
        GaugeProress.Progress:=i;
        RxMemoryDataList.Next;
      end;  
      //удаление
      RxMemoryDataList.EmptyTable;

      cxGridPretDBTableView1.EndUpdate;
      cxGridDBTableView1.EndUpdate;

      GaugeProress.Visible:=false;
      PanelProgress.Caption:=StudcityConst.Studcity_Wait;
      PanelProgress.Visible:=false;
      Refresh;
  end;
viewDetails:=1;
end;

procedure TfrmEditWorkSubsOtdel.ButtonSaveClick(Sender: TObject);
var
  i:Integer;
begin
  cxGridPretDBTableView1.BeginUpdate;
  cxGridDBTableView1.BeginUpdate;

  GaugeProress.Visible:=true;
  PanelProgress.Caption:=StudcityConst.Studcity_Wait;
  PanelProgress.Visible:=true;
  Refresh;

  GaugeProress.MaxValue := RxMemoryDataPr.RecordCount+RxMemoryDataList.RecordCount-1;

  RxMemoryDataPR.First;

  for i:=0 to RxMemoryDataPR.RecordCount-1 do
    begin
      TfrmMainFormWorkSubsOrdel(Self.Owner).WriteTransaction.StartTransaction;
      TfrmMainFormWorkSubsOrdel(Self.Owner).pFIBStoredProc.StoredProcName:='ST_DT_RZSUB_SAVE';
      TfrmMainFormWorkSubsOrdel(Self.Owner).pFIBStoredProc.Prepare;
      TfrmMainFormWorkSubsOrdel(Self.Owner).pFIBStoredProc.ParamByName('ID_ID_KEY').AsInt64:=RxMemoryDataPR.FieldByName('RxId_Key').asVariant;
      TfrmMainFormWorkSubsOrdel(Self.Owner).pFIBStoredProc.ParamByName('IN_ID_PEOPLE').Value:=0;
      TfrmMainFormWorkSubsOrdel(Self.Owner).pFIBStoredProc.ParamByName('IN_SAVE').Value := 1; //удаление
      try
        TfrmMainFormWorkSubsOrdel(Self.Owner).pFIBStoredProc.ExecProc;
        except
          begin
            TfrmMainFormWorkSubsOrdel(Self.Owner).WriteTransaction.Rollback;
            Exit;
          end;
      end;
      TfrmMainFormWorkSubsOrdel(Self.Owner).WriteTransaction.Commit;
      GaugeProress.Progress:=i;
      RxMemoryDataPR.Next;
    end;

  refresh;

  RxMemoryDataList.First;
  for i:=0 to RxMemoryDataList.RecordCount-1 do
    begin
      TfrmMainFormWorkSubsOrdel(Self.Owner).WriteTransaction.StartTransaction;
      TfrmMainFormWorkSubsOrdel(Self.Owner).pFIBStoredProc.StoredProcName:='ST_DT_RZSUB_SAVE';
      TfrmMainFormWorkSubsOrdel(Self.Owner).pFIBStoredProc.Prepare;
      TfrmMainFormWorkSubsOrdel(Self.Owner).pFIBStoredProc.ParamByName('ID_ID_KEY').AsInt64:=RxMemoryDataList.FieldByName('RxId_Key').asVariant;
      TfrmMainFormWorkSubsOrdel(Self.Owner).pFIBStoredProc.ParamByName('IN_ID_PEOPLE').AsInt64:=RxMemoryDataList.FieldByName('RxId_PEOPLE').asVariant;
      TfrmMainFormWorkSubsOrdel(Self.Owner).pFIBStoredProc.ParamByName('IN_SAVE').Value:=0;
      try
        TfrmMainFormWorkSubsOrdel(Self.Owner).pFIBStoredProc.ExecProc;
        except
          begin
            TfrmMainFormWorkSubsOrdel(Self.Owner).WriteTransaction.Rollback;
            Exit;
          end;
      end;
      TfrmMainFormWorkSubsOrdel(Self.Owner).WriteTransaction.Commit;
      GaugeProress.Progress := GaugeProress.Progress + 1;
      RxMemoryDataList.Next;
    end;


  cxGridPretDBTableView1.EndUpdate;
  cxGridDBTableView1.EndUpdate;

  GaugeProress.Visible:=false;
  PanelProgress.Caption:=StudcityConst.Studcity_Wait;
  PanelProgress.Visible:=false;
  Refresh;
  closeFlag:=1;
  Close;
end;

procedure TfrmEditWorkSubsOtdel.RxMemoryDataPRAfterScroll(
  DataSet: TDataSet);
begin
if viewDetails=1 then
  begin
    cxLabel1.Caption:=StudcityConst.Studcity_WorkListNUMB_EX[lang]+RxMemoryDataPR.FieldByName('RxNumB').AsString;
    cxLabel2.Caption:=StudcityConst.Studcity_WorkListMounth_EX[lang]+RxMemoryDataPR.FieldByName('RxMonth').AsString;
    cxLabel3.Caption:=StudcityConst.Studcity_WorkListSumSumma_EX[lang]+VarToStr(RxMemoryDataPR.FieldByName('RxSumma').AsVariant);
    cxLabel4.Caption:=StudcityConst.Studcity_WorkListSumSubs+VarToStr(RxMemoryDataPR.FieldByName('RxSubs').AsVariant);
  end;
end;

procedure TfrmEditWorkSubsOtdel.RxMemoryDataListAfterScroll(
  DataSet: TDataSet);
begin
if (viewDetails=1)  and (RxMemoryDataList.RecordCount>0) then
  begin
    pFIBDataSetGetFamily.Active:=false;
    pFIBDataSetGetFamily.ParamByName('param_kod').AsInt64:=RxMemoryDataList.FieldByName('RxID_PEOPLE').AsVariant;
    pFIBDataSetGetFamily.Active:=true;
    cxLabel1.Caption:=pFIBDataSetGetFamily.FieldbyName('FIO').AsString;
    cxLabel2.Caption:=StudcityConst.Studcity_WorkListMounth_EX[lang]+RxMemoryDataList.FieldByName('RxMonth').AsString;
    cxLabel3.Caption:=StudcityConst.Studcity_WorkListSumSumma_EX[lang]+VarToStr(RxMemoryDataList.FieldByName('RxSumma').AsVariant);
    cxLabel4.Caption:=StudcityConst.Studcity_WorkListSumSubs_EX[lang]+VarToStr(RxMemoryDataList.FieldByName('RxSubs').AsVariant);
  end;
end;

procedure TfrmEditWorkSubsOtdel.cxGridPretDBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
if viewDetails=1 then
  begin
    cxLabel1.Caption:=StudcityConst.Studcity_WorkListNUMB_EX[lang]+RxMemoryDataPR.FieldByName('RxNumB').AsString;
    cxLabel2.Caption:=StudcityConst.Studcity_WorkListMounth_EX[lang]+RxMemoryDataPR.FieldByName('RxMonth').AsString;
    cxLabel3.Caption:=StudcityConst.Studcity_WorkListSumSumma_EX[lang]+VarToStr(RxMemoryDataPR.FieldByName('RxSumma').AsVariant);
    cxLabel4.Caption:=StudcityConst.Studcity_WorkListSumSubs_EX[lang]+VarToStr(RxMemoryDataPR.FieldByName('RxSubs').AsVariant);
  end;
end;

procedure TfrmEditWorkSubsOtdel.cxGridDBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
if viewDetails=1 then
  begin
    pFIBDataSetGetFamily.Active:=false;
    pFIBDataSetGetFamily.ParamByName('param_kod').AsInt64:=RxMemoryDataList.FieldByName('RxID_PEOPLE').AsVariant;
    pFIBDataSetGetFamily.Active:=true;
    cxLabel1.Caption:=pFIBDataSetGetFamily.FieldbyName('FIO').AsString;
    cxLabel2.Caption:=StudcityConst.Studcity_WorkListMounth_EX[lang]+RxMemoryDataList.FieldByName('RxMonth').AsString;
    cxLabel3.Caption:=StudcityConst.Studcity_WorkListSumSumma_EX[lang]+VarToStr(RxMemoryDataList.FieldByName('RxSumma').AsVariant);
    cxLabel4.Caption:=StudcityConst.Studcity_WorkListSumSubs_EX[lang]+VarToStr(RxMemoryDataList.FieldByName('RxSubs').AsVariant);
  end;
end;

procedure TfrmEditWorkSubsOtdel.ActionSaveExecute(Sender: TObject);
begin
  ButtonSaveClick(self);
end;

procedure TfrmEditWorkSubsOtdel.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
if closeFlag=0 then
  begin
    if messageBox(Handle,PChar(StudcityConst.Studcity_MESSAGE_NOT_SAVE),
     PChar(StudcityConst.Studcity_MESSAGE_WARNING_CONST),MB_YESNO or MB_ICONQUESTION)=mrYes then
       begin
         CanClose:=true;
       end
       else
       begin
         CanClose:=false;
       end;
  end
  else
  begin
    CanClose:=true;
  end;
end;

procedure TfrmEditWorkSubsOtdel.cxGridPretDBTableView1KeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
if key=vk_return then
  begin
    ButtonRihgtOneClick(self);
  end;
end;

procedure TfrmEditWorkSubsOtdel.cxGridDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key=vk_return then
  begin
    ButtonLeftOneClick(self);
  end;
end;

end.
