unit ProtFSS_ReestrFillForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,IBase,ProtFSS_DM, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, dxBar, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ExtCtrls, dxBarExtItems,
  cxDropDownEdit, cxContainer, cxTextEdit, cxMaskEdit, cxButtonEdit,
  StdCtrls, cxLabel, cxDBLabel, cxGridBandedTableView,
  cxGridDBBandedTableView, Menus, cxCalendar, cxCheckBox;

type
  TReestrFillForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Splitter1: TSplitter;
    Panel4: TPanel;
    dxBarDockControl1: TdxBarDockControl;
    dxBarManager1: TdxBarManager;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    Panel5: TPanel;
    dxBarLargeButton4: TdxBarLargeButton;
    Label1: TLabel;
    cxStyleRepository1: TcxStyleRepository;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
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
    Label5: TLabel;
    NumHosps: TLabel;
    RepHospGrid: TcxGrid;
    RepHospGridLevel1: TcxGridLevel;
    Panel6: TPanel;
    Label4: TLabel;
    DBLabelNumReestr: TcxDBLabel;
    DBLabelDateReestr: TcxDBLabel;
    Label6: TLabel;
    Label7: TLabel;
    HospListGridLevel1: TcxGridLevel;
    HospListGrid: TcxGrid;
    HospListGridDBTV: TcxGridDBBandedTableView;
    HospListGridDBTVDBBanded_TN: TcxGridDBBandedColumn;
    HospListGridDBTVDBBanded_FAMILIA: TcxGridDBBandedColumn;
    HospListGridDBTVDBBanded_DATE_BEG: TcxGridDBBandedColumn;
    HospListGridDBTVDBBanded_DATE_END: TcxGridDBBandedColumn;
    HospListGridDBTVDBBanded_SERIA: TcxGridDBBandedColumn;
    HospListGridDBTVDBBanded_NOMER: TcxGridDBBandedColumn;
    HospListGridDBTVDBBanded_PERCENT: TcxGridDBBandedColumn;
    HospListGridDBTVDBBanded_TITLE: TcxGridDBBandedColumn;
    RepHospGridDBTV: TcxGridDBBandedTableView;
    RepHospGridDBBandedTableView_TN: TcxGridDBBandedColumn;
    RepHospGridDBBandedTableView_FAMILIA: TcxGridDBBandedColumn;
    RepHospGridDBBandedTableView_DATE_BEG: TcxGridDBBandedColumn;
    RepHospGridDBBandedTableView_DATE_END: TcxGridDBBandedColumn;
    RepHospGridDBTV_SERIA: TcxGridDBBandedColumn;
    RepHospGridDBBandedTableView_NOMER: TcxGridDBBandedColumn;
    PopupMenu: TPopupMenu;
    AddAllList: TMenuItem;
    RemoveAllList: TMenuItem;
    HospListGridDBTVDBBanded_ID_HOSP: TcxGridDBBandedColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure IllTypeBoxChange(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure HospListGridDBTVDblClick(Sender: TObject);
    procedure RepHospGridDBTVDblClick(Sender: TObject);
    procedure cxGrid1DBBandedTableView1DblClick(Sender: TObject);
    procedure AddAllListClick(Sender: TObject);
    procedure RemoveAllListClick(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
  private
   // PDb_Handle:TISC_DB_HANDLE;
    procedure RefreshHospList;
  public
  DM: TDM;
  Id_Reestr: Integer;
  Owner:TComponent;
    procedure Prepare(IdReestr: Integer);
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE); reintroduce;
  end;

var
  ReestrFillForm: TReestrFillForm;

  Id_FilterDepartment: Integer;
  Id_Type: Integer;

implementation

uses ProtFSS_MainForm;
{$R *.dfm}

constructor TReestrFillForm.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);
begin
  inherited Create(AOwner);
  Owner:=AOwner;
  DM:=TDM.Create(AOwner,Db_Handle);
  RepHospGridDBTV.DataController.DataSource  := DM.DSourseList;
  HospListGridDBTV.DataController.DataSource := DM.DSourceHospList;
end;

procedure TReestrFillForm.FormCreate(Sender: TObject);
begin
    Id_FilterDepartment := -1;
    Id_Type := -1;
    RefreshHospList;
end;

procedure TReestrFillForm.Prepare(IdReestr: Integer);
begin
  Id_Reestr := IdReestr;

  DM.DSetList.Close;
  DM.DSetList.SelectSQL.Text := 'SELECT * FROM GET_HOSP_IN_REESTR(:ID_REESTR)';
  DM.DSetList.ParamByName('ID_REESTR').Value := Id_Reestr;
  DM.DSetList.Open;

end;


procedure TReestrFillForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  (Owner as TFZProtFSS).Refresh;
  Action := caFree;
end;

procedure TReestrFillForm.RefreshHospList;
var
n:Integer;
begin
    DM.DSetHospList.Close;
    {DM.DSetHospList.SelectSQL.Text := 'SELECT * FROM GET_HOSP_FOR_REESTR(:ID_DEP,:ID_TYPE)';
    DM.DSetHospList.ParamByName('ID_DEP').Value:=Id_FilterDepartment;
    if (Id_Type<>-1) then
      DM.DSetHospList.ParamByName('ID_TYPE').Value:=Id_Type
    else
      DM.DSetHospList.ParamByName('ID_TYPE').Value:=Null; }
    DM.DSetHospList.SelectSQL.Text := 'SELECT * FROM GET_HOSP_FOR_REESTR_SEL';
    DM.DSetHospList.Open;

    DM.DSetHospList.Last;
    n := DM.DSetHospList.RecordCount;
    DM.DSetHospList.First;
    NumHosps.Caption:=IntToStr(n);

    DM.DSetList.Close;
    DM.DSetList.SelectSQL.Text := 'SELECT * FROM GET_HOSP_IN_REESTR(:ID_REESTR)';
    DM.DSetList.ParamByName('ID_REESTR').Value := Id_Reestr;
    DM.DSetList.Open;
end;

procedure TReestrFillForm.IllTypeBoxChange(Sender: TObject);
begin
   // Id_Type:=IllTypeBox.ItemIndex+1;
end;

procedure TReestrFillForm.dxBarLargeButton3Click(Sender: TObject);
begin
  RemoveAllListClick(Self);
end;

procedure TReestrFillForm.HospListGridDBTVDblClick(Sender: TObject);
var
 n,id:Integer;
begin
  id:=DM.DSetHospList['ID_HOSP'];
  DM.WriteTransaction.StartTransaction;
  DM.pFIBStoredProc.StoredProcName                 := 'HOSP_REESTR_DATA_INSERT';
  DM.pFIBStoredProc.ParamByName('ID_REESTR').Value := Id_Reestr;
  DM.pFIBStoredProc.ParamByname('ID_HOSP').Value   := DM.DSetHospList['ID_HOSP'];
  DM.pFIBStoredProc.ExecProc;
  DM.WriteTransaction.Commit;

  n := DM.DSetHospList.RecordCount;
  NumHosps.Caption := IntToStr(n);
  DM.DSetHospList.First;

  RefreshHospList;


  DM.DSetList.Locate('ID_HOSP',id,[]);

end;

procedure TReestrFillForm.RepHospGridDBTVDblClick(Sender: TObject);
var
  n:Integer;
  id:Integer;
begin
 if (not DM.DSetList.IsEmpty) then
   begin
    id:=DM.DSetList['ID_HOSP'];
    DM.WriteTransaction.StartTransaction;
    DM.pFIBStoredProc.StoredProcName                 := 'HOSP_REESTR_DATA_DELETE';
    DM.pFIBStoredProc.ParamByName('ID_REESTR').Value := Id_Reestr;
    DM.pFIBStoredProc.ParamByname('ID_HOSP').Value   := DM.DSetList['ID_HOSP'];
    DM.pFIBStoredProc.ExecProc;
    DM.WriteTransaction.Commit;

    n := DM.DSetHospList.RecordCount;
    NumHosps.Caption := IntToStr(n);
    DM.DSetHospList.First;
    RefreshHospList;

    Application.ProcessMessages;
    DM.DSetHospList.Locate('ID_HOSP',id,[]);
   end;
end;

procedure TReestrFillForm.cxGrid1DBBandedTableView1DblClick(
  Sender: TObject);
var
 n,id:Integer;
begin
  if (not DM.DSetHospList.IsEmpty) then
  begin
    id:=DM.DSetHospList['ID_HOSP'];
    DM.WriteTransaction.StartTransaction;
    DM.pFIBStoredProc.StoredProcName                 := 'HOSP_REESTR_DATA_INSERT';
    DM.pFIBStoredProc.ParamByName('ID_REESTR').Value := Id_Reestr;
    DM.pFIBStoredProc.ParamByname('ID_HOSP').Value   := DM.DSetHospList['ID_HOSP'];
    DM.pFIBStoredProc.ExecProc;
    DM.WriteTransaction.Commit;

    n := DM.DSetHospList.RecordCount;
    NumHosps.Caption := IntToStr(n);
    DM.DSetHospList.First;

    RefreshHospList;
    
    DM.DSetList.Locate('ID_HOSP',id,[]);
  end;

end;


procedure TReestrFillForm.AddAllListClick(Sender: TObject);
var
    i, c: integer;
    n:Integer;
begin
  if (not DM.DSetHospList.IsEmpty) then
  begin
    c := HospListGridDBTV.DataController.RowCount;
    DM.DSetHospList.First;

    for i := 0 to c-1 do
    begin
      HospListGridDBTV.DataController.FocusedRowIndex :=i;
      DM.WriteTransaction.StartTransaction;
      DM.pFIBStoredProc.StoredProcName                 := 'HOSP_REESTR_DATA_INSERT';
      DM.pFIBStoredProc.ParamByName('ID_REESTR').Value := Id_Reestr;
      DM.pFIBStoredProc.ParamByname('ID_HOSP').Value   := HospListGridDBTVDBBanded_ID_HOSP.EditValue;
      DM.pFIBStoredProc.ExecProc;
      DM.WriteTransaction.Commit;
      Application.ProcessMessages;
    end;

    RefreshHospList;
    n := DM.DSetHospList.RecordCount;
    NumHosps.Caption := IntToStr(n);
    
  end;
end;

procedure TReestrFillForm.RemoveAllListClick(Sender: TObject);
var
    i, c: integer;
begin
 if (not DM.DSetList.IsEmpty) then
 begin
    DM.DSetList.Last;
    c := DM.DSetList.RecordCount;
    DM.DSetList.First;

    for i := 1 to c do
    begin
      DM.WriteTransaction.StartTransaction;
      DM.pFIBStoredProc.StoredProcName                 := 'HOSP_REESTR_DATA_DELETE';
      DM.pFIBStoredProc.ParamByName('ID_REESTR').Value := Id_Reestr;
      DM.pFIBStoredProc.ParamByname('ID_HOSP').Value   := DM.DSetList['ID_HOSP'];
      DM.pFIBStoredProc.ExecProc;
      DM.WriteTransaction.Commit;
      DM.DSetList.Next;
      Application.ProcessMessages;
    end;

    RefreshHospList;
    
 end;

end;

procedure TReestrFillForm.dxBarLargeButton2Click(Sender: TObject);
begin
  AddAllListClick(Self); 
end;

end.
