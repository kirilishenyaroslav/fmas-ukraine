unit TuSpOfficialNote_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, ExtCtrls, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, dxBar, dxBarExtItems,  dates,
  TuCommonLoader, cxGridBandedTableView, cxGridDBBandedTableView,TuCommonStyles,
  dxStatusBar, cxSplitter;

type   TOfficialNoteFilterParam = class(TObject)
  Owner:TComponent;
  KodSetup:integer;
  DateBegActive:variant;
  DateEndActive:variant;
  DateBegCreate:variant;
  DateEndCreate:variant;
  id_man:variant;
  id_vihod:variant;
  is_work_mode:string;
  id_work_mode:variant;
  rmoving:variant;
  id_post_moving:variant;
  FioDog:string;
  NameVihod:string;
  NameWorkMode:string;
  FioMan:string;

end;


type
  TFormOfficialNote = class(TForm)
    BarManager: TdxBarManager;
    ButtonRefresh: TdxBarLargeButton;
    ButtonExit: TdxBarLargeButton;
    ButtonDelete: TdxBarLargeButton;
    ButtonUpdate: TdxBarLargeButton;
    InsertBtn: TdxBarLargeButton;
    DetailBtn: TdxBarLargeButton;
    ButtonInsert: TdxBarLargeButton;
    ButtonPermis: TdxBarLargeButton;
    cxGrid1: TcxGrid;
    Table1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    Panel1: TPanel;
    cxGrid2: TcxGrid;
    cxGridLevel1: TcxGridLevel;
    ButtonTransInsert: TdxBarLargeButton;
    dxBarDockControl1: TdxBarDockControl;
    ButtonTransUpdate: TdxBarLargeButton;
    ButtonTransDelete: TdxBarLargeButton;
    Table1ColNote: TcxGridDBColumn;
    Table1ColDate: TcxGridDBColumn;
    ButtonFilter: TdxBarLargeButton;
    dxBarText: TdxBarStatic;
    Table2: TcxGridDBBandedTableView;
    Table2DBBandedColumn1: TcxGridDBBandedColumn;
    Table2DBBandedColumn2: TcxGridDBBandedColumn;
    Table2DBBandedColumn7: TcxGridDBBandedColumn;
    Table2DBBandedColumn8: TcxGridDBBandedColumn;
    Table2DBBandedColumn9: TcxGridDBBandedColumn;
    dxStatusBar1: TdxStatusBar;
    dxStatusBar2: TdxStatusBar;
    cxSplitter5: TcxSplitter;
    Table1ColDateDoc: TcxGridDBColumn;
    Table1ColNum: TcxGridDBColumn;
    Styles: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet;
    procedure ButtonRefreshClick(Sender: TObject);
    procedure ButtonInsertClick(Sender: TObject);
    procedure ButtonExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonTransInsertClick(Sender: TObject);
    procedure ButtonTransUpdateClick(Sender: TObject);
    procedure ButtonTransDeleteClick(Sender: TObject);
    procedure ButtonDeleteClick(Sender: TObject);
    procedure ButtonUpdateClick(Sender: TObject);
    procedure ButtonFilterClick(Sender: TObject);
    procedure Table2DblClick(Sender: TObject);
    procedure Table1DblClick(Sender: TObject);
    procedure Table1FocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure Table2FocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);

  private
    { Private declarations }
  public
    pStylesDM:TStyleDM;
    ParamFilter:TOfficialNoteFilterParam;
    constructor create (AParam:TOfficialNoteFilterParam); reintroduce;
    procedure ActivityButtons;
  end;

var
  FormOfficialNote: TFormOfficialNote;

implementation

uses TuSpOfficialNote_DM,TuSpOfficialNote_Filter;

{$R *.dfm}

constructor TFormOfficialNote.create(AParam:TOfficialNoteFilterParam);
var i:integer;
begin
  inherited create(AParam.Owner);
  ParamFilter:=AParam;
  ButtonRefreshClick(nil);
  Table1.DataController.DataSource:=dm.DSource1;
  Table2.DataController.DataSource:=dm.DSource2;
  pStylesDM:=TStyleDM.Create(Self);
  Table1.Styles.StyleSheet:=pStylesDM.GridTableViewStyleSheetDevExpress ;
  Table2.Styles.StyleSheet:=pStylesDM.GridBandedTableViewStyleSheetDevExpress ;
//******************************************************************************
 dxStatusBar1.Panels[0].text:='Ins- '+ButtonInsert.Caption;
 dxStatusBar1.Panels[1].text:='F2- ' +ButtonUpdate.Caption;
 dxStatusBar1.Panels[2].text:='Del- '+ButtonDelete.Caption;
 dxStatusBar1.Panels[3].text:='F5- '+ButtonRefresh.Caption;
 dxStatusBar1.Panels[4].text:='F8- '+ButtonFilter.Caption;
 dxStatusBar2.Panels[0].text:='Esc- '+ButtonExit.Caption;
 dxStatusBar2.Panels[1].text:='Shift+Ins- '+ButtonTransInsert.Caption;
 dxStatusBar2.Panels[2].text:='Shift+F2- ' +ButtonTransUpdate.Caption;
 dxStatusBar2.Panels[3].text:='Shift+Del- '+ButtonTransDelete.Caption;
 for i:=0 to dxStatusBar1.Panels.Count-1 do
   dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;
    for i:=0 to dxStatusBar2.Panels.Count-1 do
   dxStatusBar2.Panels[i].Width := dxStatusBar2.Width div dxStatusBar2.Panels.Count;
//******************************************************************************
end;

procedure TFormOfficialNote.ButtonRefreshClick(Sender: TObject);
var T1,T2: variant;
begin
with Dm do
begin
  DSet1.close;
  DSet2.close;
  dm.DSet1.SelectSQL.Text:='select * from TU_OFFICIAL_NOTE_S('
                           +varToStrDef(''''+ParamFilter.DateBegCreate+'''','Null')+','
                           +varToStrDef(''''+ParamFilter.DateEndCreate+'''','Null')+','
                           +varToStrDef(''''+ParamFilter.DateBegActive+'''','Null')+','
                           +varToStrDef(''''+ParamFilter.DateEndActive+'''','Null')+','
                           +varToStrDef(ParamFilter.id_man,'Null')+','
                           +varToStrDef(ParamFilter.rmoving,'Null')+','
                           +varToStrDef(ParamFilter.id_post_moving,'Null')+','
                           +varToStrDef(ParamFilter.id_vihod,'Null')+','
                           +varToStrDef(''''+ParamFilter.is_work_mode+'''','Null')+','
                           +varToStrDef(ParamFilter.id_work_mode,'Null')+')';
  dm.DSet2.SelectSQL.Text:='select  * from TU_OFFICIAL_NOTE_TRANS_S(null,'
                           +varToStrDef(''''+ParamFilter.DateBegActive+'''','Null')+','
                           +varToStrDef(''''+ParamFilter.DateEndActive+'''','Null')+','
                           +varToStrDef(ParamFilter.id_man,'Null')+','
                           +varToStrDef(ParamFilter.rmoving,'Null')+','
                           +varToStrDef(ParamFilter.id_post_moving,'Null')+','
                           +varToStrDef(ParamFilter.id_vihod,'Null')+','
                           +varToStrDef(''''+ParamFilter.is_work_mode+'''','Null')+','
                           +varToStrDef(ParamFilter.id_work_mode,'Null')+') where ID_OFFICIAL_NOTE=:ID_OFFICIAL_NOTE';
  DSet1.open;
  DSet2.open;
ActivityButtons;
end
end;

procedure TFormOfficialNote.ButtonInsertClick(Sender: TObject);
var Parameter:TTuSpOfficialNoteEditParam;
    ID:variant;
begin
  Parameter := TTuSpOfficialNoteEditParam.Create;
  Parameter.DB_Handle := DM.DB.Handle;
  Parameter.Owner := self;
  Parameter.CFStyle:=tfsOnI;
  Parameter.DateBeg:=strtodate(KodSetupToPeriod(ParamFilter.KodSetup,6));
  Parameter.DateEnd:=strtodate(KodSetupToPeriod(ParamFilter.KodSetup+1,6))-1;
  Parameter.KodSetup:=ParamFilter.KodSetup;
  ID:=DoFunctionFromPackage(Parameter,Tu_SpOfficialNoteEdit_Pack) ;
  if ID[2]=mryes then
  begin
    ButtonRefreshClick(sender);
    DM.DSet1.Locate('ID_OFFICIAL_NOTE', ID[0],[]);
  end;
  Parameter.Destroy;

end;



procedure TFormOfficialNote.ButtonExitClick(Sender: TObject);
begin
close;
end;

procedure TFormOfficialNote.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if FormStyle=fsMDICHILD then  Action:=caFree;
end;

procedure TFormOfficialNote.ButtonTransInsertClick(Sender: TObject);
var Parameter:TTuSpOfficialNoteEditParam;
    ID:variant;
begin
  Parameter := TTuSpOfficialNoteEditParam.Create;
  Parameter.DB_Handle := DM.DB.Handle;
  Parameter.Owner := self;
  Parameter.CFStyle:=tfsOnTransI;
  Parameter.DateBeg:=strtodate(KodSetupToPeriod(ParamFilter.KodSetup,6));
  Parameter.DateEnd:=strtodate(KodSetupToPeriod(ParamFilter.KodSetup+1,6))-1;
  Parameter.IdOfficialNote:=DM.Dset1['ID_OFFICIAL_NOTE'];
  Parameter.Note:=DM.Dset1['NOTE'];
  Parameter.KodSetup:=ParamFilter.KodSetup;
    Parameter.Num:= DM.DSet1['Num'];
  Parameter.DateDoc:= DM.DSet1['DATE_DOC'];
  ID:=DoFunctionFromPackage(Parameter,Tu_SpOfficialNoteEdit_Pack) ;
  if   ID[2]=mrYes then
  begin
    ButtonRefreshClick(sender);
    DM.DSet1.Locate('ID_OFFICIAL_NOTE', ID[0],[]);
    DM.DSet2.Locate('ID_OFFICIAL_NOTE_trans', ID[1],[]);
  end;
  Parameter.Destroy;
end;

procedure TFormOfficialNote.ButtonTransUpdateClick(Sender: TObject);
var Parameter:TTuSpOfficialNoteEditParam;
  id:variant;
begin
  Parameter := TTuSpOfficialNoteEditParam.Create;
  Parameter.DB_Handle := DM.DB.Handle;
  Parameter.Owner := self;
  Parameter.CFStyle:=tfsOnTransU;
  Parameter.IdOfficialNote:=DM.Dset1['ID_OFFICIAL_NOTE'];
  Parameter.IdOfficialNoteTrans:=DM.Dset2['ID_OFFICIAL_NOTE_TRANS'];
  Parameter.Note:=DM.Dset1['NOTE'];
  Parameter.KodSetup:=ParamFilter.KodSetup;
    Parameter.Num:= DM.DSet1['Num'];
  Parameter.DateDoc:= DM.DSet1['DATE_DOC'];
  id:=DoFunctionFromPackage(Parameter,Tu_SpOfficialNoteEdit_Pack);
  if ID[2]=mrYes then
  begin
    ButtonRefreshClick(sender);
    DM.DSet1.Locate('ID_OFFICIAL_NOTE', Parameter.IdOfficialNote,[]);
    DM.DSet2.Locate('ID_OFFICIAL_NOTE_trans',Parameter.IdOfficialNoteTrans,[]);
  end;
  Parameter.Destroy;
end;

procedure TFormOfficialNote.ButtonTransDeleteClick(Sender: TObject);
var Parameter:TTuSpOfficialNoteEditParam;
id :variant;
begin
  Parameter := TTuSpOfficialNoteEditParam.Create;
  Parameter.DB_Handle := DM.DB.Handle;
  Parameter.Owner := self;
  Parameter.CFStyle:=tfsOnTransD;
  Parameter.IdOfficialNoteTrans:=DM.Dset2['ID_OFFICIAL_NOTE_TRANS'];
  id:=DoFunctionFromPackage(Parameter,Tu_SpOfficialNoteEdit_Pack);
  if id[2]=mryes then
    ButtonRefreshClick(sender);
  Parameter.Destroy;

end;

procedure TFormOfficialNote.ButtonDeleteClick(Sender: TObject);
var Parameter:TTuSpOfficialNoteEditParam;
   id:variant;
begin
  Parameter := TTuSpOfficialNoteEditParam.Create;
  Parameter.DB_Handle := DM.DB.Handle;
  Parameter.Owner := self;
  Parameter.CFStyle:=tfsOnD;
  Parameter.IdOfficialNote:=DM.Dset1['ID_OFFICIAL_NOTE'];
  id:=DoFunctionFromPackage(Parameter,Tu_SpOfficialNoteEdit_Pack);
  if id[2]=mryes then
  begin
    ButtonRefreshClick(sender);
  end;
  Parameter.Destroy;
end;

procedure TFormOfficialNote.ButtonUpdateClick(Sender: TObject);
var Parameter:TTuSpOfficialNoteEditParam;
   id: variant;
begin
  Parameter := TTuSpOfficialNoteEditParam.Create;
  Parameter.DB_Handle := DM.DB.Handle;
  Parameter.Owner := self;
  Parameter.CFStyle:=tfsOnU;
  Parameter.IdOfficialNote:= DM.DSet1['ID_OFFICIAL_NOTE'];
  Parameter.Note:= DM.DSet1['NOTE'];
  Parameter.Num:= DM.DSet1['Num'];
  Parameter.DateDoc:= DM.DSet1['DATE_DOC'];
  id:=DoFunctionFromPackage(Parameter,Tu_SpOfficialNoteEdit_Pack);
  if id[2]=mrYes then
  begin
    ButtonRefreshClick(sender);
    DM.DSet1.Locate('ID_OFFICIAL_NOTE', ID[0],[]);
  end;
  Parameter.Destroy;
end;

procedure TFormOfficialNote.ButtonFilterClick(Sender: TObject);
var FormFilter:  TFormOfficialNote_Filtr;
begin
  FormFilter:=TFormOfficialNote_Filtr.create(ParamFilter);
  if  FormFilter.ShowModal=mrYes then
  begin
     ButtonRefreshClick(sender);
  end;
end;

procedure TFormOfficialNote.Table2DblClick(Sender: TObject);
begin
ButtonTransUpdateClick(Sender);
end;

procedure TFormOfficialNote.Table1DblClick(Sender: TObject);
begin
ButtonUpdateClick(Sender)
end;

procedure TFormOfficialNote.ActivityButtons;
begin
if dm.DSet1.RecordCount =0 then
begin
  ButtonTransInsert.Enabled:=false;
  ButtonUpdate.Enabled:=false;
  ButtonDelete.Enabled:=false;
  ButtonTransUpdate.Enabled:=false;
  ButtonTransDelete.Enabled:=false;
end
else
begin
  ButtonUpdate.Enabled:=true;
  ButtonDelete.Enabled:=true;
  ButtonTransInsert.Enabled:=true;
  if dm.DSet2.RecordCount=0 then
  begin
    ButtonTransUpdate.Enabled:=false;
    ButtonTransDelete.Enabled:=false;
  end
  else
  begin
    ButtonTransUpdate.Enabled:=true;
    ButtonTransDelete.Enabled:=true;
  end
end

end;

procedure TFormOfficialNote.Table1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
ActivityButtons;
end;

procedure TFormOfficialNote.Table2FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
ActivityButtons;
end;

end.
