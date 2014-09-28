//******************************************************************************
//******************************************************************************
unit fGetData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData,
  cxStyles, cxTL, cxControls, cxInplaceContainer, cxTLData, cxDBTL,
  cxMaskEdit, dxBar, dxBarExtItems, ExtCtrls, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  dxDockControl, dxDockPanel, cxPropertiesStore, StdCtrls,
  cxLookAndFeelPainters, cxButtons, cxContainer, cxTextEdit, FIBQuery,
  pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet, ZTypes, Unit_ZGlobal_Consts, IBase, ZProc,
  ZSvodTypesUnit,ZMessages,zSvodLoaderUnit, cxCheckBox, ZcxLocateBar;

type
  TFZForm = class(TForm)
    DB: TpFIBDatabase;
    Transaction: TpFIBTransaction;
    PanelData: TPanel;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    StProc: TpFIBStoredProc;
    procedure CancelBtnClick(Sender: TObject);
    procedure YesBtnClick(Sender: TObject);
  private
    PDB_Handle: TISC_DB_HANDLE;
  public
    constructor Create(AOwner:TComponent;DB_handle:TISC_DB_HANDLE);reintroduce;
  end;

function View_Form(AOwner:TComponent;DB_handle:TISC_DB_HANDLE):Variant; stdcall;
 exports  View_Form;

implementation

{$R *.dfm}

function View_Form(AOwner:TComponent;DB_handle:TISC_DB_HANDLE):Variant; stdcall;
var ViewForm: TFZForm;
begin
   ViewForm  :=  TFZForm.Create(AOwner,DB_handle);
   ViewForm.ShowModal;
   ViewForm.Free;
end;

constructor TFZForm.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 self.Caption                :=  '';
 PDB_Handle                  := DB_handle;
end;

procedure TFZForm.CancelBtnClick(Sender: TObject);
begin
Close;
end;

procedure TFZForm.YesBtnClick(Sender: TObject);
var id_level:integer;
begin
  DB.Handle := PDB_Handle;
  YesBtn.Enabled := False;
  CancelBtn.Enabled := False;

  try
    id_level := ValueFieldZSetup(pdb_handle,'ID_ORDER_LEVEL');

    Transaction.StartTransaction;

    PanelData.Caption := 'Йде вибір переміщень';
    StProc.StoredProcName := 'UP_Z_MOVINGS_CREATE';
    StProc.Prepare;
    StProc.ParamByName('ID_LEVEL').AsVariant := id_level;
    StProc.ParamByName('ID_SESSION').AsVariant := 1;
    StProc.ExecProc;

    PanelData.Caption := 'Йде вибір надбавок';
    StProc.StoredProcName := 'UP_Z_BONUS_CREATE';
    StProc.Prepare;
    StProc.ParamByName('ID_LEVEL').AsVariant := id_level;
    StProc.ParamByName('ID_SESSION').AsVariant := 1;
    StProc.ExecProc;

    Transaction.Commit;
  except
    on E:Exception do
      begin
        StProc.Transaction.Rollback;
        ZShowMessage('Ошибка',e.Message,mtError,[mbOK]);
      end;
  end;

  PanelData.Caption := 'Переформувати буфер?';
  YesBtn.Enabled := true;
  CancelBtn.Enabled := True;
end;

end.
