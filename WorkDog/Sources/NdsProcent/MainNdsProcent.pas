unit MainNdsProcent;
{*******************************************************************************
* MainNdsProcent                                                               *
*                                                                              *
* Справочник процента НДС, главная форма                                       *
* Copyright ©  2004, Бурмистрова Е.                                            *
*******************************************************************************}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, iBase,StdCtrls,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, FIBDataSet, pFIBDataSet, ImgList, ComCtrls,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, ToolWin, FIBQuery,
  pFIBQuery, pFIBStoredProc, cxTL;

type
  TfrmNdsProcent = class(TForm)
    pFIBDatabase: TpFIBDatabase;
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    ToolButton_add: TToolButton;
    ToolButton_red: TToolButton;
    ToolButton_del: TToolButton;
    ToolButton_upd: TToolButton;
    ImageList1: TImageList;
    ToolButton_cl: TToolButton;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBTransactionWrite: TpFIBTransaction;
    pFIBDataSet_nds_proc: TpFIBDataSet;
    DataSource: TDataSource;
    pFIBStoredProc_proc_nds: TpFIBStoredProc;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    cxStyle47: TcxStyle;
    cxStyle48: TcxStyle;
    cxStyle49: TcxStyle;
    cxStyle50: TcxStyle;
    cxStyle51: TcxStyle;
    cxStyle52: TcxStyle;
    cxStyle53: TcxStyle;
    cxStyle54: TcxStyle;
    cxStyle55: TcxStyle;
    cxStyle56: TcxStyle;
    cxStyle57: TcxStyle;
    cxStyle58: TcxStyle;
    cxStyle59: TcxStyle;
    cxStyle60: TcxStyle;
    cxStyle61: TcxStyle;
    cxStyle62: TcxStyle;
    cxStyle63: TcxStyle;
    cxStyle64: TcxStyle;
    cxStyle65: TcxStyle;
    cxStyle66: TcxStyle;
    cxStyle67: TcxStyle;
    cxStyle68: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ToolButton_clClick(Sender: TObject);
    procedure ToolButton_addClick(Sender: TObject);
    procedure ToolButton_updClick(Sender: TObject);
    procedure ToolButton_delClick(Sender: TObject);
    procedure ToolButton_redClick(Sender: TObject);
  private
    { Private declarations }
  public
  constructor Create (Aowner:TComponent;DBHANDLE : TISC_DB_HANDLE; frmStyle:TFormStyle); overload;
    { Public declarations }
  end;
  function WorkNdsProcent(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle):Variant;stdcall;
  exports WorkNdsProcent;

var
  frmNdsProcent: TfrmNdsProcent;
  id_nds: Variant;

implementation
uses
  MainNdsProcentEdit;

{$R *.dfm}

constructor TfrmNdsProcent.Create(Aowner:TComponent;DBHANDLE : TISC_DB_HANDLE; frmStyle:TFormStyle);
begin
  inherited Create (Aowner);
  pFIBDatabase.Handle := DBHANDLE;
  pFIBDataSet_nds_proc.Database := pFIBDatabase;
  pFIBDataSet_nds_proc.Transaction := pFIBTransactionRead;
  pFIBDataSet_nds_proc.Active := false;
  pFIBDataSet_nds_proc.Active := true;
end;

procedure TfrmNdsProcent.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

function WorkNdsProcent(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; frmStyle:TFormStyle):Variant;
var
  NdsProc: TfrmNdsProcent;
begin
  NdsProc := TfrmNdsProcent.Create(AOwner, DBHANDLE, frmStyle);
end;

procedure TfrmNdsProcent.FormCreate(Sender: TObject);
begin
  pFIBDataSet_nds_proc.Database := pFIBDatabase;
  pFIBDataSet_nds_proc.Transaction := pFIBTransactionRead;
  pFIBDataSet_nds_proc.Active := false;
  pFIBDataSet_nds_proc.Active := true;
  //Интерфейс
{  ToolButton_add.Caption:=Resources_unit.PUB_ACTION_ADD_CONST;
  ToolButton_red.Caption:=Resources_unit.PUB_ACTION_UPDATE_CONST;
  ToolButton_del.Caption:=Resources_unit.PUB_ACTION_DELETE_CONST;
  ToolButton_upd.Caption:=Resources_unit.PUB_ACTION_REFRESH_CONST;
  ToolButton_cl.Caption:=Resources_unit.PUB_ACTION_CLOSE_CONST;
  cxGrid1DBTableView1DBColumn1.Caption:=Resources_unit.DT_DATE_BEG;
  cxGrid1DBTableView1DBColumn2.Caption:=Resources_unit.DT_DATE_END;
  cxGrid1DBTableView1DBColumn3.Caption:=Resources_unit.DT_NDS_PROC;}
end;

procedure TfrmNdsProcent.ToolButton_clClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmNdsProcent.ToolButton_addClick(Sender: TObject);
var
  NdsPr: TfrmNdsProcEdit;
begin
  NdsPr := TfrmNdsProcEdit.Create(Self, 0, false);
  NdsPr.ShowModal;
  NdsPr.Free;
  pFIBDataSet_nds_proc.Active := false;
  pFIBDataSet_nds_proc.Active := true;
end;

procedure TfrmNdsProcent.ToolButton_updClick(Sender: TObject);
begin
  id_nds := pFIBDataSet_nds_proc.FieldByName('id_nds_procent').AsVariant;
  pFIBDataSet_nds_proc.Active := false;
  pFIBDataSet_nds_proc.Active := true;
  pFIBDataSet_nds_proc.Locate('id_nds_procent', id_nds, []);
end;

procedure TfrmNdsProcent.ToolButton_delClick(Sender: TObject);
begin
if MessageBox(Handle,PChar('Ви дійсно бажаєте видалити запис?'),
      'Підтвердження видалення',MB_YesNo or MB_Iconquestion) = mrYes then
    begin
      pFIBTransactionWrite.DefaultDatabase := pFIBDatabase;
      pFIBTransactionWrite.StartTransaction;
      pFIBStoredProc_proc_nds.Database := pFIBDatabase;
      pFIBStoredProc_proc_nds.Transaction := pFIBTransactionWrite;
      pFIBStoredProc_proc_nds.StoredProcName := 'PUB_NDS_PROC_DELETE';
      pFIBStoredProc_proc_nds.Prepare;
      pFIBStoredProc_proc_nds.ParamByName('D_ID_NDS_PROCENT').Value := pFIBDataSet_nds_proc.FieldByName('id_nds_procent').AsVariant;
      try
        pFIBStoredProc_proc_nds.ExecProc;
      except
        begin
          pFIBTransactionWrite.Rollback;
          Exit;
        end;
      end;
        pFIBTransactionWrite.Commit;
        pFIBDataSet_nds_proc.Active := false;
        pFIBDataSet_nds_proc.Active := true;
    end;
end;

procedure TfrmNdsProcent.ToolButton_redClick(Sender: TObject);
var
  NdsPr: TfrmNdsProcEdit;
begin
  NdsPr := TfrmNdsProcEdit.Create(Self, pFIBDataSet_nds_proc.FieldByName('ID_NDS_PROCENT').AsVariant, true);
  NdsPr.ShowModal;
  NdsPr.Free;
  pFIBDataSet_nds_proc.Active := false;
  pFIBDataSet_nds_proc.Active := true;
end;

end.
