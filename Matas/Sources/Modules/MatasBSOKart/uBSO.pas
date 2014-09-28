unit uBSO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ExtCtrls, FIBDataSet, pFIBDataSet,
  FIBDatabase, pFIBDatabase, ibase, uPackageManager, cxContainer,
  cxTextEdit, cxDBEdit, StdCtrls, cxLookAndFeelPainters, cxMaskEdit,
  cxButtonEdit, cxButtons, ActnList, uSpMatOtv, uSpMatSchMulti, Menus,
  FIBQuery, pFIBQuery, pFIBStoredProc,uMatasUtils;

type
  TBSOForm = class(TForm)
    pnl1: TPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    BsoDb: TpFIBDatabase;
    BsoDs: TpFIBDataSet;
    ds1: TDataSource;
    BsoTr: TpFIBTransaction;
    cxgrdbclmnGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    BsoDsID_BSO_KART: TFIBBCDField;
    BsoDsSERIYA: TFIBStringField;
    BsoDsNUMBER: TFIBStringField;
    BsoDsDATE_OUT: TFIBDateField;
    BsoDsDATE_OPR: TFIBDateField;
    BsoDsID_DOC_OUT: TFIBBCDField;
    BsoDsID_DOC_OPR: TFIBBCDField;
    BsoDsID_OST: TFIBBCDField;
    BsoDsID_MO: TFIBBCDField;
    BsoDsSFIO: TFIBStringField;
    BsoDsNAME_DEPARTMENT: TFIBStringField;
    BsoDsFIO: TFIBStringField;
    BsoDsTIPD_OPR: TFIBStringField;
    BsoDsTIPD_OUT: TFIBStringField;
    BsoDsNAME: TFIBStringField;
    BsoDsID_NOMN: TFIBBCDField;
    cxgrdbclmnGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    StyleRepository: TcxStyleRepository;
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
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    pnl2: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    BsoDsNUM_DOC_OPR: TFIBStringField;
    BsoDsNUM_DOC_OUT: TFIBStringField;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBTextEdit6: TcxDBTextEdit;
    cxExit: TcxButton;
    cxMatOtv: TcxButtonEdit;
    lbl3: TLabel;
    cxButton1: TcxButton;
    actlst1: TActionList;
    actOk: TAction;
    actExit: TAction;
    cxgrdbclmnGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    lbl4: TLabel;
    cxSch: TcxButtonEdit;
    BsoDsID_SCH: TFIBBCDField;
    BsoDsSCH_NUMBER: TFIBStringField;
    BsoDsBAL_ID_SCH: TFIBBCDField;
    BsoDsBAL_SCH_NUMBER: TFIBStringField;
    BsoDsKOD_SYSTEM: TFIBIntegerField;
    cxgrdbclmnGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    pm1: TPopupMenu;
    N2: TMenuItem;
    tr_edit: TpFIBTransaction;
    StorProc: TpFIBStoredProc;
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure actOkExecute(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxSchPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    DBHANDLE:TISC_DB_HANDLE;
    ID_MO:Integer;
    FILTER_ID_SESSION:Integer;
    F_SCH:Boolean;
    constructor Create(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE);overload;
  end;
  
   procedure ShowBsoKarts(AOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE);stdcall;
   
   exports ShowBsoKarts;
var
  BSOForm: TBSOForm;

implementation

{$R *.dfm}
uses uEditNumKart;
constructor TBSOForm.Create(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 if Assigned(aDBHandle) then
 begin
  Self.DBHANDLE := aDBHandle;
  Self.BsoDb.Close;
  Self.BsoDb.Handle := DBHANDLE;
  ID_MO:=0;
  N2.Enabled:=MatasCheckAccess('/ROOT/MATAS/ACCOUNT/BSO_KART','Edit', false)=0;
 end;
end;

procedure ShowBsoKarts(AOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE);stdcall;
var
 form : TBSOForm;
begin
 form := TBSOForm.Create(aOwner, aDBHANDLE);
 form.FormStyle := fsMDIChild;
 form.Show;
end;

procedure TBSOForm.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var
  Res : Variant;
  FioMO, SpodrMO: string;
  IsMoOk: boolean;
begin
  Res:=uSpMatOtv.GetMatOtv(self, DBHandle, 0, ID_MO);
  if  VarType(Res) <> varEmpty
   then begin
    ID_MO:=Res[0];
    FioMO := Res[1];
    SpodrMO := Res[2];
    IsMoOk:=true;
  end;
  if IsMoOk then
  begin
   cxMatOtv.Text:=FioMO+' / '+SpodrMO;
  end;
//actOk.Execute;
end;

procedure TBSOForm.actOkExecute(Sender: TObject);
var prefix:string;
begin
 if cxMatOtv.Text='' then ID_MO:=0;

 BsoDs.Close;
 BsoDs.SelectSQL.Clear;
 BsoDs.SelectSQL.Add('SELECT * FROM MAT_BSO_KART_SELECT ');
 prefix:=' WHERE ';
 if ID_MO<>0 then
 begin
 BsoDs.SelectSQL.Add(prefix+' ID_MO = '+IntToStr(ID_MO));
 prefix:=' AND ';
 end;

 if F_SCH = True then
 begin
   BsoDs.SelectSQL.Add(prefix+' ( ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
   BsoDs.SelectSQL.Add('OR BAL_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+'))');
 end;
 BsoDs.Prepare;
 BsoDs.CloseOpen(False);
end;

procedure TBSOForm.actExitExecute(Sender: TObject);
begin
Close;
end;

procedure TBSOForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TBSOForm.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  var   Arect : TRect;
begin
 Arect:=AViewInfo.Bounds;
  if (vartostr(AViewInfo.GridRecord.Values[4])<> '')  then
  begin
      ACanvas.Canvas.Brush.Color := $00D2D2D2;
      ACanvas.Canvas.FillRect(Arect);
  end;
end;

procedure TBSOForm.cxSchPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res : Variant;
  mr: boolean;
  VarDimCnt: integer;
  i: integer;
  s: string;
begin
 mr:=false;
 if FILTER_ID_SESSION=0 then
  FILTER_ID_SESSION:=BsoDb.Gen_Id('MAT_ID_SESSION',1, BsoTr);

 Res:=uSpMatSchMulti.GetMatSchMulti(self, DBHandle, 0, FILTER_ID_SESSION, mr);
 if mr then begin
  if  VarType(Res) <> varEmpty then begin
   VarDimCnt:=VarArrayHighBound(Res,  1);
   s:='';
   for i:=0 to VarDimCnt do begin
    s:=s+VarToStr(Res[i][1])+';';
   end;
   cxSch.Text := s;
   F_SCH:=true;
  end
 end
 else
 begin
  F_SCH:=false;
  FILTER_ID_SESSION:=0;
  cxSch.Text:='';
 end;
//actOk.Execute;
end;

procedure TBSOForm.N2Click(Sender: TObject);
var f:TEditNumForm;
    id:Integer;
begin
f:=TEditNumForm.Create(Self);
f.lbl1.Caption:=BsoDsSFIO.AsString;
f.lbl2.Caption:=BsoDsNAME.AsString;
f.cxSer.Text:=BsoDsSERIYA.AsString;
f.cxNum.Text:=BsoDsNUMBER.AsString;
f.ShowModal;
if f.ModalResult=mrOk then
begin
 id:=BsoDsID_BSO_KART.AsInteger;
try
 StorProc.Close;
 StorProc.Transaction := tr_edit;
 StorProc.Transaction.StartTransaction;
 StorProc.StoredProcName:='MAT_DT_BSO_KART_UPD';
 StorProc.Prepare;
 StorProc.ParamByName('ID_BSO_KART').AsInteger:=id;
 StorProc.ParamByName('SERIYA').AsString:=f.cxSer.Text;
 StorProc.ParamByName('NUMBER').AsString:=f.cxNum.Text;
 StorProc.ExecProc;
 StorProc.Transaction.Commit;
except on E : Exception
 do begin
  ShowMessage(E.Message);
  StorProc.Transaction.Rollback;
  exit;
  end;
end;
end;
f.free;
actOk.Execute;
BsoDs.Locate('ID_BSO_KART', id,[]);
end;

end.
