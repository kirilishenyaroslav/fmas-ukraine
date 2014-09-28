{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uSpTipDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ibase, FIBDatabase, pFIBDatabase,
  uResources, Buttons, ExtCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, FIBDataSet, FIBQuery,
  pFIBQuery, pFIBDataSet, cxTL, cxMaskEdit, cxInplaceContainer, cxDBTL,
  uMatasUtils, cxSplitter, cxTLData, cxTextEdit, ImgList, cxCurrencyEdit,
  Menus, pFIBStoredProc, ActnList, cxCheckBox, FR_Ctrls;

type
  TTipDocForm = class(TForm)
    fdbTipDoc: TpFIBDatabase;
    TopPanel: TPanel;
    AddButton: TSpeedButton;
    ModifyButton: TSpeedButton;
    DeleteButton: TSpeedButton;
    OkButton: TSpeedButton;
    CancelButton: TSpeedButton;
    RefreshButton: TSpeedButton;
    ReadTransaction: TpFIBTransaction;
    TipDocDataSet: TpFIBDataSet;
    WriteTransaction: TpFIBTransaction;
    WorkQuery: TpFIBQuery;
    TipDocDataSource: TDataSource;
    TipGrpDataSet: TpFIBDataSet;
    TipGrpDataSource: TDataSource;
    cxDBTreeList1: TcxDBTreeList;
    cxDBTreeList1ID_TIPD_GRP: TcxDBTreeListColumn;
    cxDBTreeList1NAME: TcxDBTreeListColumn;
    TipDocDataSetID_TIPD: TFIBBCDField;
    TipDocDataSetID_TIPD_GRP: TFIBBCDField;
    TipDocDataSetTIPD: TFIBStringField;
    TipDocDataSetNAME: TFIBStringField;
    TipDocDataSetTEMPLATE: TFIBStringField;
    TipDocDataSetPROPERTIES: TFIBStringField;
    TipGrpDataSetID_TIPD_GRP: TFIBBCDField;
    TipGrpDataSetNAME: TFIBStringField;
    TipGrpDataSetIS_OSN: TFIBBooleanField;
    TipDocDataSetKOD_DOC: TFIBSmallIntField;
    TipDocDataSetSYSTEM: TFIBBooleanField;
    TipDocDataSetSYS: TStringField;
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
    PopupMenu1: TPopupMenu;
    NTipGrpAdd: TMenuItem;
    NTipGrpEdit: TMenuItem;
    NTipGrpDel: TMenuItem;
    N4: TMenuItem;
    NTipGrpRefr: TMenuItem;
    TipGrpDataSetSYSTEM: TFIBBooleanField;
    cxSplitter1: TcxSplitter;
    WorkStoredProc: TpFIBStoredProc;
    N6: TMenuItem;
    NTipGrpTempl: TMenuItem;
    TemplateDataSet: TpFIBDataSet;
    TemplateDataSetID_TEMPLATE: TFIBBCDField;
    TemplateDataSetID_TIPDOC: TFIBBCDField;
    TemplateDataSetTEMPLATE: TFIBStringField;
    TemplateDataSetNAME_SHABLON: TFIBStringField;
    TemplateDataSetFLAG: TFIBBCDField;
    Panel1: TPanel;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1ID_TIPD: TcxGridDBColumn;
    cxGrid1DBTableView1ID_TIPD_GRP: TcxGridDBColumn;
    cxGrid1DBTableView1TIPD: TcxGridDBColumn;
    cxGrid1DBTableView1NAME: TcxGridDBColumn;
    cxGrid1DBTableView1TEMPLATE: TcxGridDBColumn;
    cxGrid1DBTableView1PROPERTIES: TcxGridDBColumn;
    cxGrid1DBTableView1System: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxSplitter2: TcxSplitter;
    TemplateDataSource: TDataSource;
    cxGridDBTableView1ID_TEMPLATE: TcxGridDBColumn;
    cxGridDBTableView1ID_TIPDOC: TcxGridDBColumn;
    cxGridDBTableView1TEMPLATE: TcxGridDBColumn;
    cxGridDBTableView1NAME_SHABLON: TcxGridDBColumn;
    cxGridDBTableView1FLAG: TcxGridDBColumn;
    PopupMenu2: TPopupMenu;
    NTemplAdd: TMenuItem;
    NTemplDel: TMenuItem;
    NTemplEdit: TMenuItem;
    TipDocDataSetPREFIX: TFIBStringField;
    TipDocDataSetNUM_LEN: TFIBSmallIntField;
    TemplateDataSetDEF_TEMPLATE: TFIBBooleanField;
    TemplateDataSetNAME_STORED_PROC: TFIBStringField;
    TipDocDataSetPUB_ID_TYPE_DOC: TFIBBCDField;
    TipDocDataSetDEF_ID_MO_IN: TFIBBCDField;
    TipDocDataSetDEF_ID_MO_OUT: TFIBBCDField;
    TipDocDataSetID_INV_OPER: TFIBIntegerField;
    TipDocDataSetID_MNA_OPER: TFIBIntegerField;
    ActionListMain: TActionList;
    acExit: TAction;
    TipDocDataSetPOS_MODE: TFIBIntegerField;
    MainImageList: TImageList;
    frSpeedButton1: TfrSpeedButton;
    ChooseOperButton: TSpeedButton;
    N1: TMenuItem;
    TipDocDataSetTIP_WORK: TFIBIntegerField;
    ForFIO: TpFIBDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    procedure cxDBTreeList1Click(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure ModifyButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure cxGrid1DblClick(Sender: TObject);
    procedure TipDocDataSetCalcFields(DataSet: TDataSet);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure NTipGrpTemplClick(Sender: TObject);
    procedure NTemplAddClick(Sender: TObject);
    procedure NTemplEditClick(Sender: TObject);
    procedure NTemplDelClick(Sender: TObject);
    procedure cxSplitter2AfterOpen(Sender: TObject);
    procedure acExitExecute(Sender: TObject);
    procedure ChooseOperButtonClick(Sender: TObject);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);

  private
   DBHANDLE : TISC_DB_HANDLE;
   ID_USER : Int64;
  public
   IS_OSN: integer;
   ResultArray:Variant;
   constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aIsOsn: integer; aIsSys: integer);overload;
  end;

  function GetTipDoc(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aIsOsn: integer):Variant; stdcall;
  function GetTipDocEx(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aID_TIPD: integer):Variant; stdcall;
  procedure ShowSpTipDoc(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64); stdcall;

  exports GetTipDoc;
  exports GetTipDocEx;
  exports ShowSpTipDoc;

var
  TipDocForm: TTipDocForm;

implementation

uses uSpTipDocFormEdit, uSpTipDocTemplate, cxSpinEdit, uSpTipDocMulti,
     uSpTipDOper;
{$R *.dfm}

constructor TTipDocForm.Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aIsOsn: integer; aIsSys: integer);
begin
 inherited Create(AOwner);
 Caption:=MAT_SYS_PREFIX + MAT_FORMCAP_SP_TIPDOC;
 if Assigned(DBHandle)
 then begin
  Self.fdbTipDoc.Close;
  Self.DBHANDLE := DBHandle;
  Self.fdbTipDoc.Handle := DBHANDLE;
  Self.IS_OSN:=aIsOsn;
  Self.TipGrpDataSet.SelectSQL.Clear;
  if aIsOsn>=0 then
   Self.TipGrpDataSet.SelectSQL.Add('SELECT * FROM MAT_SP_TIPD_GRP WHERE SYSTEM=0 AND IS_OSN='+IntToStr(aIsOsn)+' ORDER BY NAME')
  else
   Self.TipGrpDataSet.SelectSQL.Add('SELECT * FROM MAT_SP_TIPD_GRP WHERE SYSTEM=0 ORDER BY NAME');
  if aIsSys>0 then
  begin
   Self.TipGrpDataSet.SelectSQL.Clear;
   if aIsOsn>=0 then
    Self.TipGrpDataSet.SelectSQL.Add('SELECT * FROM MAT_SP_TIPD_GRP WHERE IS_OSN='+IntToStr(aIsOsn)+' ORDER BY NAME')
   else
    Self.TipGrpDataSet.SelectSQL.Add('SELECT * FROM MAT_SP_TIPD_GRP ORDER BY NAME');
  end;
  Self.TipGrpDataSet.CloseOpen(False);
  Self.TipGrpDataSet.First;
  Self.TipDocDataSet.ParamByName('ID_TIPD_GRP').Value:=Self.TipGrpDataSet.FieldByName('ID_TIPD_GRP').AsInteger;
  Self.TipDocDataSet.CloseOpen(False);
 end;
 Self.TemplateDataSet.CloseOpen(false);
 Self.AddButton.Caption:=MAT_ACTION_ADD_CONST;
 Self.DeleteButton.Caption:=MAT_ACTION_DELETE_CONST;
 Self.ModifyButton.Caption:=MAT_ACTION_UPDATE_CONST;
 Self.RefreshButton.Caption:=MAT_ACTION_REFRESH_CONST;
 Self.OkButton.Caption:=MAT_ACTION_CHOOSE_CONST;
 Self.CancelButton.Caption:=MAT_ACTION_CLOSE_CONST;
 Self.cxDBTreeList1NAME.Caption.Text:=MAT_STR_COL_TIPD_GRP;
 Self.cxGrid1DBTableView1TIPD.Caption:=MAT_STR_COL_SHORT_NAME;
 Self.cxGrid1DBTableView1NAME.Caption:=MAT_STR_COL_TIPD_NAME;
 Self.cxGridDBTableView1TEMPLATE.Caption:=MAT_STR_COL_TEMPLATE;
 Self.cxGridDBTableView1NAME_SHABLON.Caption:=MAT_STR_COL_NAME;
 Self.NTipGrpAdd.Caption:=MAT_ACTION_ADD_CONST;
 Self.NTipGrpEdit.Caption:=MAT_ACTION_UPDATE_CONST;
 Self.NTipGrpDel.Caption:=MAT_ACTION_DELETE_CONST;
 Self.NTipGrpTempl.Caption:=MAT_ACTION_TEMPLATE_CONST;
 Self.NTipGrpRefr.Caption:=MAT_ACTION_REFRESH_CONST;
 Self.NTemplAdd.Caption:=MAT_ACTION_ADD_CONST;
 Self.NTemplDel.Caption:=MAT_ACTION_DELETE_CONST;
 Self.NTemplEdit.Caption:=MAT_ACTION_UPDATE_CONST;
 Self.CancelButton.Align := alRight;
 Self.OkButton.Align := alRight;
 if (MatasCheckAccess('/ROOT/MATAS/SPRAV/SP_TIPD','Edit', false)<>0) then
 begin
  Self.AddButton.Enabled:=false;
  Self.ModifyButton.Enabled:=false;
  Self.DeleteButton.Enabled:=false;
 end;
 cxSplitter2.CloseSplitter;
 ChooseOperButton.Enabled:=False;
end;

procedure ShowSpTipDoc(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
var
 form : TTipDocForm;
begin
 form := TTipDocForm.Create(AOwner,DBHANDLE, -1, 1);
 form.ID_USER := aID_USER;
 form.FormStyle := fsMDIChild;
 form.OkButton.Visible := False;
end;

function GetTipDoc(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aIsOsn: integer):Variant;stdcall;
var
 form : TTipDocForm;
begin
 form := TTipDocForm.Create(AOwner,DBHANDLE, aIsOsn, 1);
 form.ID_USER := aID_USER;
 form.ShowModal;
 GetTipDoc := form.ResultArray;
 form.Free;
end;

function GetTipDocEx(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aID_TIPD: integer):Variant;stdcall;
var
 form : TTipDocForm;
 ResultArray:Variant;
begin
 form := TTipDocForm.Create(AOwner,DBHANDLE, 0, 0);
 form.ID_USER := aID_USER;
 form.TipDocDataSet.Close;
 form.TipDocDataSet.SelectSQL.Clear;
 form.TipDocDataSet.SelectSQL.Add('SELECT * FROM MAT_SP_TIPD WHERE id_tipd='+IntToStr(aID_TIPD));
 form.TipDocDataSet.CloseOpen(False);
 if not form.TipDocDataSet.IsEmpty
  then begin
   ResultArray := VarArrayCreate([0,11], varVariant);
   ResultArray[0] := form.TipDocDataSet['ID_TIPD'];
   ResultArray[1] := form.TipDocDataSet['TIPD'];
   ResultArray[2] := form.TipDocDataSet['NAME'];
   ResultArray[3] := form.TipDocDataSet['PROPERTIES'];
   ResultArray[4] := form.TipDocDataSet['PREFIX'];
   ResultArray[5] := form.TipDocDataSet['NUM_LEN'];
   ResultArray[6] := form.TipDocDataSet['ID_INV_OPER'];
   ResultArray[7] := form.TipDocDataSet['ID_MNA_OPER'];
   ResultArray[8] := form.TipDocDataSet['POS_MODE'];
   ResultArray[9] := form.TipDocDataSet['ID_TIPD_GRP'];
   ResultArray[10] := form.TipDocDataSet['DEF_ID_MO_IN'];
   ResultArray[11] := form.TipDocDataSet['DEF_ID_MO_OUT'];
  end;
 GetTipDocEx := ResultArray;
 form.Free;
end;

procedure TTipDocForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TTipDocForm.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TTipDocForm.cxDBTreeList1Click(Sender: TObject);
begin
  Self.TipDocDataSet.ParamByName('ID_TIPD_GRP').Value:=Self.TipGrpDataSet.FieldByName('ID_TIPD_GRP').AsInteger;
  Self.TipDocDataSet.CloseOpen(False);
  Self.ChooseOperButton.Enabled:=False;
end;

procedure TTipDocForm.OkButtonClick(Sender: TObject);
begin
 if Not Self.TipDocDataSet.IsEmpty
  then begin
   ResultArray := VarArrayCreate([0,11], varVariant);
   ResultArray[0] := Self.TipDocDataSet['ID_TIPD'];
   ResultArray[1] := Self.TipDocDataSet['TIPD'];
   ResultArray[2] := Self.TipDocDataSet['NAME'];
   ResultArray[3] := Self.TipDocDataSet['PROPERTIES'];
   ResultArray[4] := Self.TipDocDataSet['PREFIX'];
   ResultArray[5] := Self.TipDocDataSet['NUM_LEN'];
   ResultArray[6] := Self.TipDocDataSet['ID_INV_OPER'];
   ResultArray[7] := Self.TipDocDataSet['ID_MNA_OPER'];
   ResultArray[8] := Self.TipDocDataSet['POS_MODE'];
   ResultArray[9] := Self.TipDocDataSet['ID_TIPD_GRP'];
   ResultArray[10] := Self.TipDocDataSet['DEF_ID_MO_IN'];
   ResultArray[11] := Self.TipDocDataSet['DEF_ID_MO_OUT'];
   Close;
  end;
end;

procedure TTipDocForm.AddButtonClick(Sender: TObject);
var
 T: TTipDocEditForm;
 prop: string;
 vals : array of Variant;
 id: integer;
begin
 T:=TTipDocEditForm.Create(self);
 T.Caption:=MAT_SYS_PREFIX + MAT_FORMCAP_SP_TIPDOC+' :: '+MAT_STR_MODE_ADD;
 T.lIsOsn:=TipGrpDataSet.FieldByName('IS_OSN').AsInteger;
 T.cxPosMode.ItemIndex:=0;
 T.ID_MO_IN:=0;
 T.ID_MO_OUT:=0;
 T.DBHANDLE:= DBHANDLE;
 if T.ShowModal=mrOk then
 begin
  prop:=IntToStr(T.cxToCombo.ItemIndex)+';'+IntToStr(T.cxFromCombo.ItemIndex);
  if T.cxCheckKolDoc.Checked then prop:=prop+';1' else prop:=prop+';0';
  if T.cxCheckNalInvoice.Checked then prop:=prop+';1' else prop:=prop+';0';
  if T.cxCheckWorkPos.Checked then prop:=prop+';1' else prop:=prop+';0';
  if T.cxKodD.Text='' then
   T.cxKodD.Text:='0';
  SetLength(Vals, 13);
  Vals[ 0] := TipGrpDataSetID_TIPD_GRP.AsInteger;
  Vals[ 1] := T.cxKodD.Text;
  Vals[ 2] := T.cxTipd.Text;
  Vals[ 3] := T.cxName.Text;
  Vals[ 4] := prop;
  Vals[ 5] := T.cxPrefix.Text;
  Vals[ 6] := T.cxNumDocLen.Value;
  Vals[ 7] := T.cxOperInv.ItemIndex;
  Vals[ 8] := T.cxOperMna.ItemIndex;
  Vals[ 9] := T.cxPosMode.ItemIndex;
  Vals[10] := T.cxReport.ItemIndex;
  Vals[11] := T.ID_MO_IN;
  Vals[12] := T.ID_MO_OUT;
  try
    WorkStoredProc.Transaction := WriteTransaction;
    WorkStoredProc.Transaction.StartTransaction;
    WorkStoredProc.StoredProcName:='MAT_SP_TIPD_INSERT';
    WorkStoredProc.Prepare;
    WorkStoredProc.ExecProcedure('MAT_SP_TIPD_INSERT', vals);
    WorkStoredProc.Transaction.Commit;
    id:=WorkStoredProc.ParamByName('ID_TIPD').AsInteger;
  except on E : Exception
   do begin
     ShowMessage(E.Message);
     WorkStoredProc.Transaction.Rollback;
     exit;
   end;
  end;
  TipDocDataSet.CloseOpen(False);
  TipDocDataSet.Locate('ID_TIPD',id,[]);
 end;
end;

procedure TTipDocForm.ModifyButtonClick(Sender: TObject);
var
 T: TTipDocEditForm;
 prop: string[12];
 nt, nf: integer;
 id: integer;
 vals : array of Variant;
 is_sys: integer;
begin
 is_sys:=TipDocDataSet.FieldByName('SYSTEM').AsInteger;
 if (is_sys=1) then
 begin
  ShowMessage(MAT_STR_SYS_DOC_NO_EDIT);
  exit;
 end;
 T:=TTipDocEditForm.Create(self);
 T.Caption:=MAT_SYS_PREFIX + MAT_FORMCAP_SP_TIPDOC+' :: '+MAT_STR_MODE_EDIT;
  T.DBHANDLE:= DBHANDLE;
 T.lIsOsn:=TipGrpDataSet.FieldByName('IS_OSN').AsInteger;
 T.cxTipd.Text:=TipDocDataSet.FieldByName('TIPD').AsString;
 T.cxName.Text:=TipDocDataSet.FieldByName('NAME').AsString;
 T.cxKodD.Text:=TipDocDataSet.FieldByName('KOD_DOC').AsString;
 T.cxPrefix.Text:=TipDocDataSet.FieldByName('PREFIX').AsString;
 T.cxNumDocLen.Value:=TipDocDataSet.FieldByName('NUM_LEN').AsInteger;
 id:=TipDocDataSet.FieldByName('ID_TIPD').AsInteger;
 prop:=TipDocDataSet.FieldByName('PROPERTIES').AsString;
 T.cxOperInv.ItemIndex:=TipDocDataSet.FieldByName('ID_INV_OPER').AsInteger;
 T.cxOperMna.ItemIndex:=TipDocDataSet.FieldByName('ID_MNA_OPER').AsInteger;
 if (prop[1] in ['0', '1', '2']) then
  nt:=StrToInt(prop[1])
 else
  nt:=2;
 if (prop[3] in ['0', '1', '2']) then
  nf:=StrToInt(prop[3])
 else
  nf:=2;
 if prop[5] = '1' then
  T.cxCheckKolDoc.Checked:=true
 else
  T.cxCheckKolDoc.Checked:=false;
 if prop[7] = '1' then
  T.cxCheckNalInvoice.Checked:=true
 else
  T.cxCheckNalInvoice.Checked:=false;
 if prop[9] = '1' then
  T.cxCheckWorkPos.Checked:=true
 else
  T.cxCheckWorkPos.Checked:=false;
 T.cxToCombo.ItemIndex:=nt;
 T.cxFromCombo.ItemIndex:=nf;
 if T.cxFromCombo.ItemIndex<>2 then
  T.cxPosMode.Enabled:=false;
 T.cxPosMode.ItemIndex:=TipDocDataSet.FieldByName('POS_MODE').AsInteger;

 ForFIO.Close;
 ForFio.SelectSql.Clear;
 ForFIO.SelectSQL.Add(' SELECT SFIO, NAME_DEPARTMENT FROM MAT_SP_MO_SELECT_BY_ID(:ID_MO) ');
 ForFIO.Prepare;
 if TipDocDataSetDEF_ID_MO_IN.Value = null then
  ForFIO.ParamByName('ID_MO').AsInteger:=0
 else ForFIO.ParamByName('ID_MO').AsInteger:=TipDocDataSetDEF_ID_MO_IN.AsInteger;
 ForFIO.CloseOpen(False);
 if ForFIO.FieldValues['SFIO'] = null then T.cxAvtoMoIn.Text:=''
 else
 T.cxAvtoMoIn.Text:= ForFIO.FieldValues['SFIO']+' / '+ForFIO.FieldValues['NAME_DEPARTMENT'];

 if TipDocDataSetDEF_ID_MO_IN.Value = null then T.ID_MO_IN:=0
 else T.ID_MO_IN:=TipDocDataSetDEF_ID_MO_IN.AsInteger;

 ForFIO.Close;
 ForFio.SelectSql.Clear;
 ForFIO.SelectSQL.Add(' SELECT SFIO, NAME_DEPARTMENT FROM MAT_SP_MO_SELECT_BY_ID(:ID_MO) ');
 ForFIO.Prepare;
 if TipDocDataSetDEF_ID_MO_IN.Value = null then
  ForFIO.ParamByName('ID_MO').AsInteger:=0
 else ForFIO.ParamByName('ID_MO').AsInteger:=TipDocDataSetDEF_ID_MO_OUT.AsInteger;
 ForFIO.CloseOpen(False);
 if ForFIO.FieldValues['SFIO'] = null then T.cxAvtoMoOut.Text:=''
 else
 T.cxAvtoMoOut.Text:= ForFIO.FieldValues['SFIO']+' / '+ForFIO.FieldValues['NAME_DEPARTMENT'];

 if TipDocDataSetDEF_ID_MO_OUT.Value = null then T.ID_MO_OUT:=0
 else T.ID_MO_OUT:=TipDocDataSetDEF_ID_MO_OUT.AsInteger;

 if T.ShowModal=mrOk then
 begin
  prop:=IntToStr(T.cxToCombo.ItemIndex)+';'+IntToStr(T.cxFromCombo.ItemIndex);
  if T.cxCheckKolDoc.Checked then prop:=prop+';1' else prop:=prop+';0';
  if T.cxCheckNalInvoice.Checked then prop:=prop+';1' else prop:=prop+';0';
  if T.cxCheckWorkPos.Checked then prop:=prop+';1' else prop:=prop+';0';
  if T.cxKodD.Text='' then
   T.cxKodD.Text:='0';
  prop:=prop+';'+IntToStr(T.cxPosMode.ItemIndex);
  SetLength(Vals, 13);
  Vals[ 0] := id;
  Vals[ 1] := T.cxKodD.Text;
  Vals[ 2] := T.cxTipd.Text;
  Vals[ 3] := T.cxName.Text;
  Vals[ 4] := prop;
  Vals[ 5] := T.cxPrefix.Text;
  Vals[ 6] := T.cxNumDocLen.Value;
  Vals[ 7] := T.cxOperInv.ItemIndex;
  Vals[ 8] := T.cxOperMna.ItemIndex;
  Vals[ 9] := T.cxPosMode.ItemIndex;
  Vals[10] := T.cxReport.ItemIndex;
  Vals[11] := T.ID_MO_IN;
  Vals[12] := T.ID_MO_OUT;
  try
    WorkStoredProc.Transaction := WriteTransaction;
    WorkStoredProc.Transaction.StartTransaction;
    WorkStoredProc.StoredProcName:='MAT_SP_TIPD_UPDATE';
    WorkStoredProc.Prepare;
    WorkStoredProc.ExecProcedure('MAT_SP_TIPD_UPDATE', vals);
    WorkStoredProc.Transaction.Commit;
  except on E : Exception
   do begin
     ShowMessage(E.Message);
     WorkStoredProc.Transaction.Rollback;
     exit;
   end;
  end;
  TipDocDataSet.CloseOpen(False);
  TipDocDataSet.Locate('ID_TIPD',id,[]);
 end;
end;

procedure TTipDocForm.DeleteButtonClick(Sender: TObject);
var
 is_sys: integer;
begin
 is_sys:=TipDocDataSet.FieldByName('SYSTEM').AsInteger;
 if (is_sys=1) then
 begin
  ShowMessage(MAT_STR_SYS_DOC_NO_DEL);
  exit;
 end;
 if agMessageDlg(MAT_STR_MODE_DEL, MAT_STR_ASK_DELETE, mtConfirmation, [mbYes, mbNo]) = ID_YES  then
 begin
  try
    WorkStoredProc.Transaction := WriteTransaction;
    WorkStoredProc.Transaction.StartTransaction;
    WorkStoredProc.StoredProcName:='MAT_SP_TIPD_DELETE';
    WorkStoredProc.Prepare;
    WorkStoredProc.ExecProcedure('MAT_SP_TIPD_DELETE', [TipDocDataSet.FieldByName('ID_TIPD').AsInteger]);
    WorkStoredProc.Transaction.Commit;
  except on E : Exception
   do begin
     ShowMessage(MAT_STR_ERROR_DELETE);
     WorkStoredProc.Transaction.Rollback;
     exit;
   end;
  end;
  TipDocDataSet.CloseOpen(False);
 end;
end;

procedure TTipDocForm.RefreshButtonClick(Sender: TObject);
begin
 TipDocDataSet.CloseOpen(False);
end;

procedure TTipDocForm.cxGrid1DblClick(Sender: TObject);
begin
 if OkButton.Visible then
  OkButton.Click;
end;

procedure TTipDocForm.TipDocDataSetCalcFields(DataSet: TDataSet);
begin
 if (TipDocDataSetSYSTEM.Value=True) then TipDocDataSetSYS.Value:=' ! ';
 if (TipDocDataSetSYSTEM.Value=False) then TipDocDataSetSYS.Value:='   ';
end;

procedure TTipDocForm.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (Key=VK_RETURN) and (OkButton.Visible) then
   OkButton.Click;
end;

procedure TTipDocForm.PopupMenu1Popup(Sender: TObject);
begin
 if (MatasCheckAccess('/ROOT/MATAS/SPRAV/SP_TIPD','Edit', false)<>0) then
 begin
  NTipGrpAdd.Enabled:=false;
  NTipGrpEdit.Enabled:=false;
  NTipGrpDel.Enabled:=false;
 end;

end;

procedure TTipDocForm.NTipGrpTemplClick(Sender: TObject);
begin
 cxSplitter2.OpenSplitter;
end;

procedure TTipDocForm.NTemplAddClick(Sender: TObject);
var
 T: TSpTipDocTemplForm;
 vals : array of Variant;
begin
 T:=TSpTipDocTemplForm.Create(self);
 if T.ShowModal=mrOk then
 begin
  SetLength(Vals, 4);
  Vals[ 0] := TipDocDataSetID_TIPD.AsInteger;
  Vals[ 1] := T.cxName.Text;
  Vals[ 2] := T.cxFile.Text;
  Vals[ 3] := BoolToInt(T.cxDefTemplate.Checked);
  try
    WorkStoredProc.Transaction := WriteTransaction;
    WorkStoredProc.Transaction.StartTransaction;
    WorkStoredProc.StoredProcName:='MAT_SP_TEMPLATE_INSERT';
    WorkStoredProc.Prepare;
    WorkStoredProc.ExecProcedure('MAT_SP_TEMPLATE_INSERT', vals);
    WorkStoredProc.Transaction.Commit;
  except on E : Exception
   do begin
     ShowMessage(E.Message);
     WorkStoredProc.Transaction.Rollback;
     exit;
   end;
  end;
  TemplateDataSet.CloseOpen(false);
 end;
end;

procedure TTipDocForm.NTemplEditClick(Sender: TObject);
var
 T: TSpTipDocTemplForm;
 id: integer;
 vals : array of Variant;
begin
 T:=TSpTipDocTemplForm.Create(self);
 T.cxName.Text:=TemplateDataSetNAME_SHABLON.AsString;
 T.cxFile.Text:=TemplateDataSetTEMPLATE.AsString;
 id:=TemplateDataSetID_TEMPLATE.AsInteger;
 T.cxDefTemplate.Checked:=TemplateDataSet.FieldByName('DEF_TEMPLATE').AsBoolean;
 if T.ShowModal=mrOk then
 begin
  SetLength(Vals, 4);
  Vals[ 0] := id;
  Vals[ 1] := T.cxName.Text;
  Vals[ 2] := T.cxFile.Text;
  Vals[ 3] := BoolToInt(T.cxDefTemplate.Checked);
  try
    WorkStoredProc.Transaction := WriteTransaction;
    WorkStoredProc.Transaction.StartTransaction;
    WorkStoredProc.StoredProcName:='MAT_SP_TEMPLATE_UPDATE';
    WorkStoredProc.Prepare;
    WorkStoredProc.ExecProcedure('MAT_SP_TEMPLATE_UPDATE', vals);
    WorkStoredProc.Transaction.Commit;
  except on E : Exception
   do begin
     ShowMessage(E.Message);
     WorkStoredProc.Transaction.Rollback;
     exit;
   end;
  end;
  TemplateDataSet.CloseOpen(false);
 end;
end;

procedure TTipDocForm.NTemplDelClick(Sender: TObject);
begin
 if agMessageDlg(MAT_STR_MODE_DEL, MAT_STR_ASK_DELETE, mtConfirmation, [mbYes, mbNo]) = ID_YES  then
 begin
  try
    WorkStoredProc.Transaction := WriteTransaction;
    WorkStoredProc.Transaction.StartTransaction;
    WorkStoredProc.StoredProcName:='MAT_SP_TEMPLATE_DELETE';
    WorkStoredProc.Prepare;
    WorkStoredProc.ExecProcedure('MAT_SP_TEMPLATE_DELETE', [TemplateDataSetID_TEMPLATE.AsInteger]);
    WorkStoredProc.Transaction.Commit;
  except on E : Exception
   do begin
     ShowMessage(MAT_STR_ERROR_DELETE);
     WorkStoredProc.Transaction.Rollback;
     exit;
   end;
  end;
  TemplateDataSet.CloseOpen(False);
 end;
end;

procedure TTipDocForm.cxSplitter2AfterOpen(Sender: TObject);
begin
 TemplateDataSet.CloseOpen(False);
end;

procedure TTipDocForm.acExitExecute(Sender: TObject);
begin
 Close;
end;

procedure TTipDocForm.ChooseOperButtonClick(Sender: TObject);
var  T: TTipDOperForm;
     id, id_gr: Integer;
     name:string;
begin
   id:= TipDocDataSet.FieldByName('ID_TIPD').AsInteger;
   name:= TipDocDataSet.FieldByName('TIPD').AsString;
   id_gr:= TipDocDataSet.FieldByName('ID_TIPD_GRP').AsInteger;
   if (id_gr=3) or (id_gr=4) or (id_gr=5)then
   begin
     ShowMessage('Це системний документ!');
     Exit;
   end;
   T:=TTipDOperForm.Create(self, DBHANDLE, id, name);
   T.ShowModal;
   T.Free;
end;

procedure TTipDocForm.cxGrid1DBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
  var sys:integer;
begin
 sys:= Self.TipDocDataSet.ParamByName('ID_TIPD_GRP').Value;
 if (sys=3)or(sys=4)or(sys=5) then Self.ChooseOperButton.Enabled:=False
 else Self.ChooseOperButton.Enabled:=True;
end;

end.
