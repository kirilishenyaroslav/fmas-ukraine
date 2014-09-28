unit SpPeople_SpGranted;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Buttons,
  ExtCtrls,StdCtrls, dxBar, dxBarExtItems, FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet, cxContainer, cxTextEdit, IBase, SpPeople_z_dmCommonStyles, UAddVidanPlace,
  ActnList;

type
  TPasVidanForm = class(TForm)
    MainGrid: TcxGrid;
    MainGridDBTableView1: TcxGridDBTableView;
    MainGridLevel1: TcxGridLevel;
    SearchPanel: TPanel;
    MainGridDBTableView1VIDAN: TcxGridDBColumn;
    BarManager: TdxBarManager;
    SelectBtn: TdxBarLargeButton;
    AddBtn: TdxBarLargeButton;
    DB: TpFIBDatabase;
    DSet1: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    DSource1: TDataSource;
    SearchTE: TcxTextEdit;
    Timer1: TTimer;
    ActionList1: TActionList;
    CloseAction: TAction;
    SelectAction: TAction;
    procedure AddBtnClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SearchTEKeyPress(Sender: TObject; var Key: Char);
    procedure SelectActionExecute(Sender: TObject);
    procedure CloseActionExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    pStylesDM:TStylesDM;  
    procedure ReOpenDSet;
  public
    GrantedPlace:String; // Êול גûהאם
    constructor Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE);reintroduce;
  end;

function GetVidanPlace(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE):String;

implementation

{$R *.dfm}

function GetVidanPlace(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE):String;
var ViewForm:TPasVidanForm;
begin
  ViewForm:=TPasVidanForm.Create(AOwner,ADB_Handle);
  if ViewForm.ShowModal=mrOk then
    Result:=ViewForm.GrantedPlace
  else
    Result:='';
  ViewForm.Free;
end;

constructor TPasVidanForm.Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE);
begin
  inherited Create(AOwner);
//******************************************************************************
  DB.Handle:=ADB_Handle;
  pStylesDM:=TStylesDM.Create(Self);
  MainGridDBTableView1.Styles.StyleSheet:=pStylesDM.GridTableViewStyleSheetDevExpress;
  ReOpenDSet;
  SearchTE.Width:=SearchPanel.Width-64;
end;

procedure TPasVidanForm.ReOpenDSet;
begin
  if DSet1.Active then DSet1.Close;
  if SearchTE.Text<>'' then
    DSet1.SQLs.SelectSQL.Text:='SELECT * FROM Z_GET_PASS_VIDAN('''+SearchTE.Text+''') ORDER BY VIDAN'
  else
  DSet1.SQLs.SelectSQL.Text:='SELECT * FROM Z_GET_PASS_VIDAN(NULL) ORDER BY VIDAN';
  DSet1.Open;
end;

procedure TPasVidanForm.AddBtnClick(Sender: TObject);
var s:String;
begin
  s:=AddVidan;
  if s<>'' then
    begin
      GrantedPlace:=s;
      ModalResult:=mrOk;
    end;
end;

procedure TPasVidanForm.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled:=False;
  ReOpenDSet;
end;

procedure TPasVidanForm.SearchTEKeyPress(Sender: TObject; var Key: Char);
begin
  Timer1.Enabled:=False;
  Timer1.Enabled:=True;
end;

procedure TPasVidanForm.SelectActionExecute(Sender: TObject);
begin
  GrantedPlace:=DSet1['VIDAN'];
  ModalResult:=mrOk;
end;

procedure TPasVidanForm.CloseActionExecute(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TPasVidanForm.FormResize(Sender: TObject);
begin
  SearchTE.Width:=SearchPanel.Width-64;
end;

end.
