unit uPrK_PROT_ZACH_SelFakDep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxLookAndFeelPainters, StdCtrls,
  cxButtons, ExtCtrls, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, IBase,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, uPrK_PROT_ZACH,
  ActnList, uPrK_Resources, uConstants;

type
  TPrK_PROT_ZACH_SelFakDepForm = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    DB: TpFIBDatabase;
    DSet1: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    DSource1: TDataSource;
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    ActionList1: TActionList;
    SelectA: TAction;
    CancelA: TAction;
    cmnNAME_FAK: TcxGridDBColumn;
    procedure CancelAExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelectAExecute(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
  private
    { Private declarations }
    LangInd:Integer;
  public
    pID_SP_DEPARTMENT_FAK:Int64;
    constructor Create(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE);reintroduce;
  end;

implementation

uses Math;

{$R *.dfm}

constructor TPrK_PROT_ZACH_SelFakDepForm.Create(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE);
begin
  inherited Create(AOwner);

  pID_SP_DEPARTMENT_FAK:=-1;
  LangInd:=SelectLanguage;

  DB.Handle:=ADB_HANDLE;
  ReadTransaction.Active:=True;

  DSet1.SQLs.SelectSQL.Text:='SELECT * FROM PRK_FND_PRIK_ZACH_FAK_SELECT2('+IntToStr(TFormPrK_PROT_ZACH(AOwner).ID_GOD_NABORA_GLOBAL)+') ORDER BY NPP, NAME_FAK';
  DSet1.Open;

  cxGrid1DBTableView1.Styles:=TFormPrK_PROT_ZACH(AOwner).cxGridPrKPZDBTableView1.Styles;

  Caption:=nMsgEmptyFacul[LangInd];
  cmnNAME_FAK.Caption:=ncolNAME_FAK[LangInd];
  SelectA.Caption:=nAction_Vibrat[LangInd];
  CancelA.Caption:=nActiont_Otmena[LangInd];
end;

procedure TPrK_PROT_ZACH_SelFakDepForm.CancelAExecute(Sender: TObject);
begin
  pID_SP_DEPARTMENT_FAK:=-1;
  ModalResult:=mrCancel;
end;

procedure TPrK_PROT_ZACH_SelFakDepForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ReadTransaction.Active:=False;
end;

procedure TPrK_PROT_ZACH_SelFakDepForm.SelectAExecute(Sender: TObject);
begin
  if DSet1.IsEmpty then Exit;
  pID_SP_DEPARTMENT_FAK:=DSet1['ID_SP_DEPARTMENT_FAK'];
  ModalResult:=mrOk;
end;

procedure TPrK_PROT_ZACH_SelFakDepForm.cxGrid1DBTableView1DblClick(
  Sender: TObject);
begin
  SelectAExecute(Self);
end;

end.
