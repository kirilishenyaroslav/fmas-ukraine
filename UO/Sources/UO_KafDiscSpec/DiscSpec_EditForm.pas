unit DiscSpec_EditForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, dxBar, dxBarExtItems, ImgList, cxGraphics,
  cxCustomData, cxStyles, cxTL, cxControls, cxInplaceContainer, cxTLData,
  cxDBTL, cxLabel, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxButtonEdit, ExtCtrls, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery,
  pFIBStoredProc, DB, FIBDataSet, pFIBDataSet, IBase, DiscSpec_dmCommonStyles;

type
  TfEditForm = class(TForm)
    ImageList: TImageList;
    BarManager1: TdxBarManager;
    RefresBtn: TdxBarLargeButton;
    SaveBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    ActionList: TActionList;
    RefreshA: TAction;
    SaveA: TAction;
    ExitA: TAction;
    MainTreeList: TcxDBTreeList;
    DiscSpecPanel: TPanel;
    SpecBE: TcxButtonEdit;
    DiscBE: TcxButtonEdit;
    SpecLabel: TcxLabel;
    DiscLabel: TcxLabel;
    DB: TpFIBDatabase;
    Transaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DSet: TpFIBDataSet;
    StoredProc: TpFIBStoredProc;
    DSource: TDataSource;
    cmnTEXT: TcxDBTreeListColumn;
    cmnPERCENT: TcxDBTreeListColumn;
    cmnID: TcxDBTreeListColumn;
    cmnID_PARENT: TcxDBTreeListColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RefreshAExecute(Sender: TObject);
  private
    { Private declarations }
    pStylesDM:TStylesDM;
    pID_DISC_SPEC:Int64;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE;AID:Int64);reintroduce;
  end;

implementation

{$R *.dfm}

constructor TfEditForm.Create(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE;AID:Int64);
begin
  inherited Create(AOwner);
  pID_DISC_SPEC:=AID;
//******************************************************************************
  DB.Handle:=ADB_HANDLE;
  Transaction.Active:=True;
//******************************************************************************
  pStylesDM:=TStylesDM.Create(Self);
  MainTreeList.Styles.StyleSheet:=pStylesDM.TreeListStyleSheetDevExpress;
//******************************************************************************
  RefreshAExecute(Self); 
end;

procedure TfEditForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Transaction.Active:=False;
end;

procedure TfEditForm.RefreshAExecute(Sender: TObject);
begin
  if DSet.Active then DSet.Close;
  DSet.SQLs.SelectSQL.Text:='SELECT * FROM UO_SP_DISC_SPEC_DISTRIB_S('+IntToStr(pID_DISC_SPEC)+')';
  DSet.Open;
end;

end.
