unit EditReestSubs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, ExtCtrls, StdCtrls, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, FIBDataSet, pFIBDataSet,
  StudcityConst, cxTextEdit, RxMemDS, DBCtrls, FIBQuery, pFIBQuery,
  pFIBStoredProc, Gauges, cxContainer, cxMemo, cxLookAndFeelPainters,
  cxButtons,St_ser_function;

type
  TfrmEditReestrSubs = class(TForm)
    StatusBar1: TStatusBar;
    cxGridPRDBTableView1: TcxGridDBTableView;
    cxGridPRLevel1: TcxGridLevel;
    cxGridPR: TcxGrid;
    cxGridListDBTableView1: TcxGridDBTableView;
    cxGridListLevel1: TcxGridLevel;
    cxGridList: TcxGrid;
    GroupBox1: TGroupBox;
    Splitter1: TSplitter;
    GroupBox2: TGroupBox;
    pFIBDataSetPR: TpFIBDataSet;
    DataSourceList: TDataSource;
    pFIBDataSetList: TpFIBDataSet;
    DataSourcePr: TDataSource;
    FIOList: TcxGridDBColumn;
    RxMemoryDataList: TRxMemoryData;
    FIOPr: TcxGridDBColumn;
    LabelDateStart: TLabel;
    LabelBuilds: TLabel;
    DateTimePickerDatestart: TDateTimePicker;
    DBLookupComboBoxBuilds: TDBLookupComboBox;
    DataSourceBuilds: TDataSource;
    pFIBDataSetBuilds: TpFIBDataSet;
    pFIBDataSetDATAList: TpFIBDataSet;
    RxMemoryDataPR: TRxMemoryData;
    pFIBStoredProc: TpFIBStoredProc;
    PanelProgress: TPanel;
    GaugeProress: TGauge;
    cxMemoError: TcxMemo;
    Timer1: TTimer;
    ButtonRihgtOne: TcxButton;
    ButtonRihgtAll: TcxButton;
    ButtonLeftOne: TcxButton;
    ButtonLeftAll: TcxButton;
    ButtonSave: TcxButton;
    ButtonClose: TcxButton;
    pFIBDataSetConfig: TpFIBDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DateTimePickerDatestartChange(Sender: TObject);
    procedure DateTimePickerDatestartKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure DBLookupComboBoxBuildsExit(Sender: TObject);
    procedure DateTimePickerDatestartExit(Sender: TObject);
    function valid_user(id_people:Int64):Integer;
    procedure Timer1Timer(Sender: TObject);
    procedure ButtonRihgtOneClick(Sender: TObject);
    procedure ButtonRihgtAllClick(Sender: TObject);
    procedure ButtonLeftOneClick(Sender: TObject);
    procedure ButtonLeftAllClick(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
    procedure cxGridPRDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGridListDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    Constructor Create(Aowner:TComponent;id_List:Integer);overload;
    { Public declarations }
  end;

var
  frmEditReestrSubs: TfrmEditReestrSubs;
  id_list_edit:Integer;
  valid_sprav,valid_reg,valid_live,not_exist_sub:Integer;
  Lang:Integer;
implementation
uses
  MainformSubsReestr, DateUtils, Math;
{$R *.dfm}

Constructor TfrmEditReestrSubs.Create(Aowner:TComponent;id_List:Integer);
var
  i:Integer;
begin
  Inherited Create (Aowner);

  Lang:=ST_serLanguageIndex(TfrmMainFormListSubs(self.Owner).Database.Handle);
  Caption:=StudcityConst.Studcity_SubsMAIN_NEW_EX[lang];
  id_list_edit:=id_List;
  if id_List<>0 then
    begin
      Timer1.Enabled:=true;
    end;
end;

procedure TfrmEditReestrSubs.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
  id_list_edit:=0;
end;

procedure TfrmEditReestrSubs.FormCreate(Sender: TObject);
var
  dd,mm,yy:Word;
begin

  Lang:=ST_serLanguageIndex(TfrmMainFormListSubs(self.Owner).Database.Handle);

  Caption:=StudcityConst.Studcity_SubsMAIN_EDIT_EX[lang];
  ButtonLeftOne.Caption:=StudcityConst.Studcity_SubsLeftOne_EX[lang];
  ButtonLeftAll.Caption:=StudcityConst.Studcity_SubsLeftAll_EX[lang];
  ButtonRihgtOne.Caption:=StudcityConst.Studcity_SubsRightOne_EX[lang];
  ButtonRihgtAll.Caption:=StudcityConst.Studcity_SubsRightALL_EX[lang];
  ButtonClose.Caption:=StudcityConst.Studcity_ACTION_CLOSE_CONST_EX[lang];
  ButtonSave.Caption:=StudcityConst.Studcity_ACTION_SAVE_CONST_EX[lang];


  FIOList.Caption:=StudcityConst.Studcity_SubsRegFIOList_EX[lang];
  FIOPr.Caption:=StudcityConst.Studcity_SubsRegFIOOPR_EX[lang];

  LabelDateStart.Caption:=StudcityConst.Studcity_SubsStart_EX[lang];
  LabelBuilds.Caption:=StudcityConst.Studcity_SubsHostel_EX[lang];

  if id_list_edit=0 then
    begin
      //заполняем началом месяца
      DecodeDate(Date,yy,mm,dd);
      DateTimePickerDatestart.Date:=EncodeDate(yy,mm,1);
    end;
  //подключаем справочник общ
  pFIBDataSetBuilds.Active:=false;
  pFIBDataSetBuilds.Active:=true;
  pFIBDataSetBuilds.FetchAll;

  pFIBDataSetConfig.Database:=TfrmMainFormListSubs(self.Owner).Database;
  pFIBDataSetConfig.Transaction:=TfrmMainFormListSubs(self.Owner).ReadTransaction;
  pFIBDataSetConfig.Active:=false;
  pFIBDataSetConfig.Active:=true;
end;


procedure TfrmEditReestrSubs.DateTimePickerDatestartChange(
  Sender: TObject);
Var
  MM,YY,DD:Word;
begin
  DecodeDate(DateTimePickerDatestart.Date,YY,MM,DD);
  DateTimePickerDatestart.Date:=EncodeDate(YY,MM,1);
end;

procedure TfrmEditReestrSubs.DateTimePickerDatestartKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  MM,YY,DD:Word;
begin
  DecodeDate(DateTimePickerDatestart.Date,YY,MM,DD);
  DateTimePickerDatestart.Date:=EncodeDate(YY,MM,1);
end;

procedure TfrmEditReestrSubs.DBLookupComboBoxBuildsExit(Sender: TObject);
var
  i:Integer;
begin
if DBLookupComboBoxBuilds.KeyValue>0 then
  begin
    GaugeProress.Visible:=false;
    PanelProgress.Caption:=StudcityConst.Studcity_Wait;
    PanelProgress.Visible:=true;
    Refresh;
    cxGridPRDBTableView1.BeginUpdate;


    RxMemoryDataList.EmptyTable;
    RxMemoryDataPR.EmptyTable;

    //отбор претендентов
    pFIBDataSetPR.Database:=TfrmMainFormListSubs(self.Owner).Database;
    pFIBDataSetPR.Transaction:=TfrmMainFormListSubs(self.Owner).ReadTransaction;
    pFIBDataSetPR.Active:=false;
    pFIBDataSetPR.ParamByName('param_list').AsInt64:=0;
    pFIBDataSetPR.ParamByName('param_date').AsDate:=DateTimePickerDatestart.Date;
    pFIBDataSetPR.ParamByName('param_build').AsInt64:=DBLookupComboBoxBuilds.KeyValue;
    pFIBDataSetPR.Active:=True;
    pFIBDataSetPR.FetchAll;

    pFIBDataSetPR.First;
    for i:=0 to pFIBDataSetPR.RecordCount-1 do
      begin
        RxMemoryDataPR.Open;
        RxMemoryDataPR.Insert;
        RxMemoryDataPR.FieldByName('RXPRFIO').Value:='';
        RxMemoryDataPR.FieldByName('RxPRID_PEOPLE').Value:=0;
        RxMemoryDataPR.FieldByName('RxPRSumma').Value:=0;
        RxMemoryDataPR.Post;
        pFIBDataSetPR.Next;
      end;

    //отбор из списка
    pFIBDataSetPR.First;
    RxMemoryDataPR.First;
    for i:=0 to pFIBDataSetPR.RecordCount-1 do
      begin
        RxMemoryDataPR.Open;
        RxMemoryDataPR.Edit;
        RxMemoryDataPR.FieldByName('RXPRFIO').Value:=pFIBDataSetPR.FieldValues['FIO'];
        RxMemoryDataPR.FieldByName('RXPRID_PEOPLE').Value:=pFIBDataSetPR.FieldValues['ID_KOD'];
        RxMemoryDataPR.FieldByName('RxPRSumma').Value:=pFIBDataSetPR.FieldValues['SUMMA'];
        RxMemoryDataPR.Post;
        pFIBDataSetPR.Next;
        RxMemoryDataPR.Next;
      end;
    RxMemoryDataPR.First;
    PanelProgress.Visible:=false;
    cxGridPRDBTableView1.EndUpdate;
  end;
end;

procedure TfrmEditReestrSubs.DateTimePickerDatestartExit(Sender: TObject);
begin
  DBLookupComboBoxBuildsExit(self);
end;

function TfrmEditReestrSubs.valid_user(id_people:Int64):Integer;
begin
    TfrmMainFormListSubs(Self.owner).pFIBStoredProc.Database:=TfrmMainFormListSubs(Self.owner).Database;
    TfrmMainFormListSubs(Self.owner).pFIBStoredProc.Transaction:=TfrmMainFormListSubs(Self.owner).WriteTransaction;
    TfrmMainFormListSubs(Self.owner).WriteTransaction.StartTransaction;
    TfrmMainFormListSubs(Self.owner).pFIBStoredProc.StoredProcName:='ST_SUBS_VALID_PEOPLE';
    TfrmMainFormListSubs(Self.owner).pFIBStoredProc.Prepare;
    TfrmMainFormListSubs(Self.owner).pFIBStoredProc.ParamByName('ID_PEOPLE').AsInt64:=id_people;
    TfrmMainFormListSubs(Self.owner).pFIBStoredProc.ParamByName('DATE_START').AsDate:=DateTimePickerDatestart.Date;
    try
      TfrmMainFormListSubs(Self.owner).pFIBStoredProc.ExecProc;
      except
        begin
          TfrmMainFormListSubs(Self.owner).WriteTransaction.Rollback;
          Exit;
        end;
    end;
    if (pFIBDataSetConfig.FieldByName('ST_SUBS_SPRAV').AsInteger=0)  then
      begin
        if (TfrmMainFormListSubs(Self.owner).pFIBStoredProc.FieldByName('VALID_REG').AsInteger=1)
            and (TfrmMainFormListSubs(Self.owner).pFIBStoredProc.FieldByName('VALID_LIVE').AsInteger=1)
            and (TfrmMainFormListSubs(Self.owner).pFIBStoredProc.FieldByName('NOT_EXISTS_SUBS').AsInteger=1) then
          begin
            valid_user:=1;
          end
          else
          begin
            valid_user:=-1;
            valid_sprav:=1;
            valid_reg:=TfrmMainFormListSubs(Self.owner).pFIBStoredProc.FieldByName('VALID_REG').AsInteger;
            valid_live:=TfrmMainFormListSubs(Self.owner).pFIBStoredProc.FieldByName('VALID_LIVE').AsInteger;
            not_exist_sub:=TfrmMainFormListSubs(Self.owner).pFIBStoredProc.FieldByName('NOT_EXISTS_SUBS').AsInteger;
          end;
      end
      else
      begin
        if (TfrmMainFormListSubs(Self.owner).pFIBStoredProc.FieldByName('VALID_SPRAV').AsInteger=1)
            and (TfrmMainFormListSubs(Self.owner).pFIBStoredProc.FieldByName('VALID_REG').AsInteger=1)
            and (TfrmMainFormListSubs(Self.owner).pFIBStoredProc.FieldByName('VALID_LIVE').AsInteger=1)
            and (TfrmMainFormListSubs(Self.owner).pFIBStoredProc.FieldByName('NOT_EXISTS_SUBS').AsInteger=1) then
          begin
            valid_user:=1;
          end
          else
          begin
            valid_user:=-1;
            valid_sprav:=TfrmMainFormListSubs(Self.owner).pFIBStoredProc.FieldByName('VALID_SPRAV').AsInteger;
            valid_reg:=TfrmMainFormListSubs(Self.owner).pFIBStoredProc.FieldByName('VALID_REG').AsInteger;
            valid_live:=TfrmMainFormListSubs(Self.owner).pFIBStoredProc.FieldByName('VALID_LIVE').AsInteger;
            not_exist_sub:=TfrmMainFormListSubs(Self.owner).pFIBStoredProc.FieldByName('NOT_EXISTS_SUBS').AsInteger;
          end;
      end;
end;

procedure TfrmEditReestrSubs.Timer1Timer(Sender: TObject);
var
  i:Integer;
begin
  Timer1.Enabled:=false;
  GaugeProress.Visible:=false;
  PanelProgress.Caption:=StudcityConst.Studcity_Wait;
  PanelProgress.Visible:=true;
  Refresh;
  cxGridPRDBTableView1.BeginUpdate;
  cxGridListDBTableView1.BeginUpdate;


  pFIBDataSetDATAList.Active:=false;
  pFIBDataSetDATAList.ParamByName('param_list').Value:=id_list_edit;
  pFIBDataSetDATAList.Active:=true;


  pFIBDataSetList.Active:=false;
  pFIBDataSetList.ParamByName('param_list').Value:=id_list_edit;
  pFIBDataSetList.Active:=true;
  pFIBDataSetList.FetchAll;

  pFIBDataSetList.First;
  for i:=0 to pFIBDataSetList.RecordCount-1 do
    begin
      RxMemoryDataList.Open;
      RxMemoryDataList.Insert;
      RxMemoryDataList.FieldByName('RXFIO').Value:='';
      RxMemoryDataList.FieldByName('RxFlagNew').Value:=0;
      RxMemoryDataList.FieldByName('RxID_PEOPLE').Value:=0;
      RxMemoryDataList.Post;
      pFIBDataSetList.Next;
    end;

  //отбор из списка
  pFIBDataSetList.First;
  RxMemoryDataList.First;
  for i:=0 to pFIBDataSetList.RecordCount-1 do
    begin
      RxMemoryDataList.Open;
      RxMemoryDataList.Edit;
      RxMemoryDataList.FieldByName('RXFIO').Value:=pFIBDataSetList.FieldValues['FIO'];
      RxMemoryDataList.FieldByName('RXFLAGNEW').Value:=0;
      RxMemoryDataList.FieldByName('RxID_PEOPLE').Value:=pFIBDataSetList.FieldValues['ID_KOD'];
      RxMemoryDataList.Post;
      pFIBDataSetList.Next;
      RxMemoryDataList.Next;
    end;
  RxMemoryDataList.First;

  //отбор претендентов
  pFIBDataSetPR.Database:=TfrmMainFormListSubs(self.Owner).Database;
  pFIBDataSetPR.Transaction:=TfrmMainFormListSubs(self.Owner).ReadTransaction;
  pFIBDataSetPR.Active:=false;
  pFIBDataSetPR.ParamByName('param_list').Value:=id_list_edit;
  pFIBDataSetPR.Active:=True;
  pFIBDataSetPR.FetchAll;

  pFIBDataSetPR.First;
  for i:=0 to pFIBDataSetPR.RecordCount-1 do
    begin
      RxMemoryDataPR.Open;
      RxMemoryDataPR.Insert;
      RxMemoryDataPR.FieldByName('RXPRFIO').Value:='';
      RxMemoryDataPR.FieldByName('RxPRID_PEOPLE').Value:=0;
      RxMemoryDataPR.FieldByName('RxPRSumma').Value:=0;
      RxMemoryDataPR.Post;
      pFIBDataSetPR.Next;
    end;

  //отбор из списка
  pFIBDataSetPR.First;
  RxMemoryDataPR.First;
  for i:=0 to pFIBDataSetPR.RecordCount-1 do
    begin
      RxMemoryDataPR.Open;
      RxMemoryDataPR.Edit;
      RxMemoryDataPR.FieldByName('RXPRFIO').Value:=pFIBDataSetPR.FieldValues['FIO'];
      RxMemoryDataPR.FieldByName('RXPRID_PEOPLE').Value:=pFIBDataSetPR.FieldValues['ID_KOD'];
      RxMemoryDataPR.FieldByName('RxPRSumma').Value:=pFIBDataSetPR.FieldValues['SUMMA'];
      RxMemoryDataPR.Post;
      pFIBDataSetPR.Next;
      RxMemoryDataPR.Next;
    end;
  RxMemoryDataPR.First;

  //общага
  pFIBDataSetBuilds.Active:=false;
  pFIBDataSetBuilds.Active:=true;
  pFIBDataSetBuilds.FetchAll;
  pFIBDataSetBuilds.Locate('ID_BUILD',pFIBDataSetDATAList.FieldValues['KOD_BUILD'],[]);
  DBLookupComboBoxBuilds.KeyValue:=pFIBDataSetDATAList.FieldValues['KOD_BUILD'];
  DBLookupComboBoxBuilds.Enabled:=false;
  //дата
  DateTimePickerDatestart.Date:=pFIBDataSetDATAList.FieldValues['DATE_START'];
  DateTimePickerDatestart.Enabled:=false;
  if pFIBDataSetDATAList.FieldByName('AFFIX').AsString<>'' then
    begin
      ButtonLeftOne.Enabled:=false;
      ButtonLeftAll.Enabled:=false;
      ButtonRihgtOne.Enabled:=false;
      ButtonRihgtAll.Enabled:=false;
    end;

  GaugeProress.Visible:=false;
  PanelProgress.Caption:=StudcityConst.Studcity_Wait;
  PanelProgress.Visible:=false;
  Refresh;
  cxGridPRDBTableView1.EndUpdate;
  cxGridListDBTableView1.EndUpdate;


end;

procedure TfrmEditReestrSubs.ButtonRihgtOneClick(Sender: TObject);
begin
if RxMemoryDataPR.RecordCount>0 then
  begin
  PanelProgress.Caption:=StudcityConst.Studcity_Wait_DO;
  PanelProgress.Visible:=true;
  GaugeProress.Visible:=false;
  Refresh;
  if (valid_user(RxMemoryDataPR.FieldByName('RxPRID_PEOPLE').AsVariant)=1) then
    begin
      cxMemoError.Visible:=false;
      RxMemoryDataList.Open;
      RxMemoryDataList.Insert;
      RxMemoryDataList.FieldByName('RXFIO').Value:=RxMemoryDataPR.FieldValues['RXPRFIO'];
      RxMemoryDataList.FieldByName('RXFLAGNEW').Value:=1;
      RxMemoryDataList.FieldByName('RxID_PEOPLE').Value:=RxMemoryDataPR.FieldValues['RxPRID_PEOPLE'];
      RxMemoryDataList.FieldByName('RxSUMMA').Value:=RxMemoryDataPR.FieldValues['RxPRSUMMA'];
      RxMemoryDataList.Post;
      RxMemoryDataPR.Delete;
    end
    else
    begin
      cxMemoError.Clear;
      cxMemoError.Lines.Add(StudcityConst.Studcity_SubsRegError_EX[lang]);
      cxMemoError.Lines.Add(StudcityConst.Studcity_SubsRegErrorFIO_EX[lang]+' '+RxMemoryDataPR.FieldValues['RXPRFIO']);
      If valid_sprav=-1 then
        begin
          cxMemoError.Lines.Add(StudcityConst.Studcity_SubsRegErrorSPRAV_EX[lang]);
        end;
      If valid_reg=-1 then
        begin
          cxMemoError.Lines.Add(StudcityConst.Studcity_SubsRegErrorREG_EX[lang]);
        end;
      If valid_live=-1 then
        begin
          cxMemoError.Lines.Add(StudcityConst.Studcity_SubsRegErrorLIVE_EX[lang]);
        end;
      If not_exist_sub=-1 then
        begin
          cxMemoError.Lines.Add(StudcityConst.Studcity_SubsRegErrorSUBS_EX[lang]);
        end;
        cxMemoError.Visible:=true;
    end;
  end;
  PanelProgress.Visible:=false;
  GaugeProress.Visible:=false;
  Refresh;
end;

procedure TfrmEditReestrSubs.ButtonRihgtAllClick(Sender: TObject);
var
  i:Integer;
  peopleDel:array of variant;
  cntDel:Integer;
begin

if RxMemoryDataPR.RecordCount=0 then
  begin
    Exit;
  end;

PanelProgress.Caption:=StudcityConst.Studcity_Wait_DO;
GaugeProress.MaxValue:=RxMemoryDataPR.RecordCount-1;
GaugeProress.Progress:=0;
PanelProgress.Visible:=true;
GaugeProress.Visible:=true;
Refresh;

cxGridPRDBTableView1.BeginUpdate;
cxGridListDBTableView1.BeginUpdate;
RxMemoryDataPR.First;

SetLength(peopleDel,RxMemoryDataPR.RecordCount+1);
cntDel:=0;

{RecCnt:=0;
while(RecCnt<>RxMemoryDataPR.RecordCount) do
  begin
      RecCnt:=RxMemoryDataPR.RecordCount;
}      for i:=0 to RxMemoryDataPR.RecordCount-1 do
        begin
  if (valid_user(RxMemoryDataPR.FieldByName('RxPRID_PEOPLE').AsVariant)=1) then
            begin
              RxMemoryDataList.Open;
              RxMemoryDataList.Insert;
              RxMemoryDataList.FieldByName('RXFIO').Value:=RxMemoryDataPR.FieldValues['RXPRFIO'];
              RxMemoryDataList.FieldByName('RXFLAGNEW').Value:=1;
              RxMemoryDataList.FieldByName('RxID_PEOPLE').Value:=RxMemoryDataPR.FieldValues['RxPRID_PEOPLE'];
              RxMemoryDataList.FieldByName('RxSUMMA').Value:=RxMemoryDataPR.FieldValues['RxPRSUMMA'];
              RxMemoryDataList.Post;
              peopleDel[cntDel]:=RxMemoryDataPR.FieldValues['RxPRID_PEOPLE'];
              inc(cntDel);
              //RxMemoryDataPR.Delete;
            end;
          RxMemoryDataPR.Next;
          GaugeProress.Progress:=i;
        end;
 // end;
//удаление
for i:=0 to cntDel-1 do
  begin
    RxMemoryDataPR.Locate('RxPRID_PEOPLE',peopleDel[i],[]);
    RxMemoryDataPR.Delete;
  end;
cxGridPRDBTableView1.EndUpdate;
cxGridListDBTableView1.EndUpdate;
PanelProgress.Visible:=false;
GaugeProress.Visible:=false;
end;

procedure TfrmEditReestrSubs.ButtonLeftOneClick(Sender: TObject);
begin
if RxMemoryDataList.RecordCount>0 then
  begin
    RxMemoryDataPR.Open;
    RxMemoryDataPR.Insert;
    RxMemoryDataPR.FieldByName('RXPRFIO').Value:=RxMemoryDataList.FieldValues['RXFIO'];
    RxMemoryDataPR.FieldByName('RXPRID_PEOPLE').Value:=RxMemoryDataList.FieldValues['RxID_PEOPLE'];
    RxMemoryDataPR.Post;
    RxMemoryDataList.Delete;
  end;
end;

procedure TfrmEditReestrSubs.ButtonLeftAllClick(Sender: TObject);
var
  i:Integer;
begin
if RxMemoryDataList.RecordCount=0 then
  begin
    Exit;
  end;
cxGridPRDBTableView1.BeginUpdate;
cxGridListDBTableView1.BeginUpdate;

PanelProgress.Caption:=StudcityConst.Studcity_Wait_DO;
PanelProgress.Visible:=true;
GaugeProress.Visible:=true;
Refresh;
GaugeProress.MaxValue:=RxMemoryDataList.RecordCount-1;

RxMemoryDataList.First;
for i:=0 to RxMemoryDataList.RecordCount-1 do
  begin
    RxMemoryDataPR.Open;
    RxMemoryDataPR.Insert;
    RxMemoryDataPR.FieldByName('RXPRFIO').Value:=RxMemoryDataList.FieldValues['RXFIO'];
    RxMemoryDataPR.FieldByName('RXPRID_PEOPLE').Value:=RxMemoryDataList.FieldValues['RxID_PEOPLE'];
    RxMemoryDataPR.Post;
    RxMemoryDataList.Next;
    GaugeProress.Progress:=i;
  end;

PanelProgress.Visible:=false;
GaugeProress.Visible:=false;

RxMemoryDataList.EmptyTable;
cxGridPRDBTableView1.EndUpdate;
cxGridListDBTableView1.EndUpdate;
end;

procedure TfrmEditReestrSubs.ButtonSaveClick(Sender: TObject);
var
   i,pos:Integer;
   id_list_add:Int64;
begin
//сохранение
if (id_list_edit>0) then
  begin
    //проверка и удаление из базы, тех кого переместили в претендентов

    pFIBDataSetList.FetchAll;
    pFIBDataSetList.First;
    GaugeProress.MaxValue:=pFIBDataSetList.RecordCount+RxMemoryDataList.RecordCount;
    PanelProgress.Caption:=StudcityConst.Studcity_Wait_DO;
    PanelProgress.Visible:=true;
    GaugeProress.Visible:=true;

    for i:=0 to pFIBDataSetList.RecordCount-1 do
      begin
        RxMemoryDataList.Locate('RxID_PEOPLE',pFIBDataSetList.FieldByName('ID_KOD').AsVariant,[]);
        if RxMemoryDataList.FieldByName('RxID_PEOPLE').AsVariant<>pFIBDataSetList.FieldByName('ID_KOD').AsVariant then
          begin
            TfrmMainFormListSubs(Self.Owner).WriteTransaction.StartTransaction;
            pFIBStoredProc.StoredProcName:='ST_DT_SLATE_DELETE_PEOPLE';
            pFIBStoredProc.Prepare;
            pFIBStoredProc.ParamByName('ID_PEOPLE').AsInt64:=pFIBDataSetList.FieldByName('ID_KOD').AsVariant;
            pFIBStoredProc.ParamByName('ID_LIST').AsInt64:=id_list_edit;
            try
              pFIBStoredProc.ExecProc;
              except
                begin
                  TfrmMainFormListSubs(Self.Owner).WriteTransaction.Rollback;
                  Exit;
                end;
            end;
            TfrmMainFormListSubs(Self.Owner).WriteTransaction.Commit
          end
          else
          begin
            RxMemoryDataList.Delete;
          end;
        GaugeProress.Progress:=i;
        pFIBDataSetList.Next;
      end;
    //теперь сохраняем тех кто остался
    pos:=GaugeProress.Progress;
    RxMemoryDataList.First;
    for i:=0 to RxMemoryDataList.RecordCount-1 do
      begin
            TfrmMainFormListSubs(Self.Owner).WriteTransaction.StartTransaction;
            pFIBStoredProc.StoredProcName:='ST_DT_SLATE_INSERT_EDITLIST';
            pFIBStoredProc.Prepare;
            pFIBStoredProc.ParamByName('ID_KOD').AsInt64:=RxMemoryDataList.FieldValues['RxID_PEOPLE'];
            pFIBStoredProc.ParamByName('ID_LIST').AsInt64:=id_list_edit;
            pFIBStoredProc.ParamByName('PAY_SUM').AsVariant:=RxMemoryDataList.FieldValues['RxSUMMA'];;
            try
              pFIBStoredProc.ExecProc;
            except
              begin
                TfrmMainFormListSubs(Self.Owner).WriteTransaction.Rollback;
                Exit;
              end;
            end;
            TfrmMainFormListSubs(Self.Owner).WriteTransaction.Commit;
            RxMemoryDataList.Next;
            GaugeProress.Progress:=pos+i;
      end;
    RxMemoryDataList.EmptyTable;
    GaugeProress.Progress:=GaugeProress.MaxValue;

    //обновление даты редактирования
    TfrmMainFormListSubs(Self.Owner).WriteTransaction.StartTransaction;
    pFIBStoredProc.StoredProcName:='ST_DT_SLSUB_UPDATE_PR_EDIT';
    pFIBStoredProc.Prepare;
    pFIBStoredProc.ParamByName('ID_LIST').AsInt64:=id_list_edit;
    pFIBStoredProc.ParamByName('PARAM_WORK').AsInteger:=1;
    try
      pFIBStoredProc.ExecProc;
      except
        begin
          TfrmMainFormListSubs(Self.Owner).WriteTransaction.Rollback;
          Exit;
        end;
    end;
    TfrmMainFormListSubs(Self.Owner).WriteTransaction.Commit;
  end;


if (id_list_edit=0) then
  begin
    //сохраняем шапку документа
    TfrmMainFormListSubs(Self.Owner).WriteTransaction.StartTransaction;
    pFIBStoredProc.StoredProcName:='ST_DT_SLSUB_INS_NEW_LIST';
    pFIBStoredProc.Prepare;
//    pFIBStoredProc.ParamByName('AFFIX').AsString:='ser';
    pFIBStoredProc.ParamByName('DATE_REG').AsDate:=Date;
    pFIBStoredProc.ParamByName('DATE_START').AsDate:=DateTimePickerDatestart.Date;
    pFIBStoredProc.ParamByName('KOD_BUILD').AsInt64:=DBLookupComboBoxBuilds.KeyValue;
    try
      pFIBStoredProc.ExecProc;
      except
        begin
          TfrmMainFormListSubs(Self.Owner).WriteTransaction.Rollback;
          Exit;
        end;
    end;
    id_list_add:=pFIBStoredProc.FieldByName('ID_LIST_ADD').AsInt64;
    TfrmMainFormListSubs(Self.Owner).WriteTransaction.Commit;
    //сохранение списка
    RxMemoryDataList.First;
    for i:=0 to RxMemoryDataList.RecordCount-1 do
      begin
            TfrmMainFormListSubs(Self.Owner).WriteTransaction.StartTransaction;
            pFIBStoredProc.StoredProcName:='ST_DT_SLATE_INSERT_EDITLIST';
            pFIBStoredProc.Prepare;
            pFIBStoredProc.ParamByName('ID_KOD').AsInt64:=RxMemoryDataList.FieldValues['RxID_PEOPLE'];
            pFIBStoredProc.ParamByName('ID_LIST').AsInt64:=id_list_add;
            pFIBStoredProc.ParamByName('PAY_SUM').AsVariant:=RxMemoryDataList.FieldValues['RxSUMMA'];;

            try
              pFIBStoredProc.ExecProc;
            except
              begin
                TfrmMainFormListSubs(Self.Owner).WriteTransaction.Rollback;
                Exit;
              end;
            end;
            TfrmMainFormListSubs(Self.Owner).WriteTransaction.Commit;
            RxMemoryDataList.Next;
      end;
  end;
  Close;
end;

procedure TfrmEditReestrSubs.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEditReestrSubs.cxGridPRDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key=VK_SPACE then
  begin
    ButtonRihgtOneClick(self);
  end;
end;

procedure TfrmEditReestrSubs.cxGridListDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key=VK_SPACE then
  begin
    ButtonLeftOneClick(self);
  end;
end;

end.
