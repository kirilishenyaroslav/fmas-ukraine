unit uDebKrDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, Buttons, StdCtrls, cxSpinEdit,
  cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ExtCtrls, FIBDataSet,
  pFIBDataSet, FIBDatabase, pFIBDatabase, DateUtils, Menus, ActnList,
  cxDBEdit, cxLookAndFeelPainters, cxButtons, ibase, uMainPerem,
  cxButtonEdit, cxCurrencyEdit, cxHyperLinkEdit, Kernel, FIBQuery,
  pFIBQuery, ImgList, uMainFanc, pFIBStoredProc, frxClass, frxDesgn,
  frxDBSet;

type
// TResProc = procedure(id_Doc : int64; Kredit : boolean) of object;

   TDocForm = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    DebDB: TpFIBDatabase;
    DebDS: TpFIBDataSet;
    dsDeb: TDataSource;
    ReadTr: TpFIBTransaction;
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
    cxGridNUM_DOC: TcxGridDBColumn;
    cxGridDATE_DOC: TcxGridDBColumn;
    cxGridTYPE_DOC: TcxGridDBColumn;
    cxGridSUMMA: TcxGridDBColumn;
    cxGridIS_OUR_DOC: TcxGridDBColumn;
    actlst1: TActionList;
    actShow: TAction;
    pm1: TPopupMenu;
    actShow1: TMenuItem;
    pnl2: TPanel;
    lbl2: TLabel;
    Pidst: TcxDBTextEdit;
    DataSet: TpFIBDataSet;
    DebDSPK_ID: TFIBBCDField;
    DebDSNUM_DOC: TFIBStringField;
    DebDSDATE_DOC: TFIBDateField;
    DebDSTYPE_DOC: TFIBStringField;
    DebDSSUMMA: TFIBBCDField;
    DebDSNOTE: TFIBStringField;
    WriteTr: TpFIBTransaction;
    cxgrdbclmnNOTE: TcxGridDBColumn;
    actClose: TAction;
    actAdd: TAction;
    actUpd: TAction;
    actDel: TAction;
    DebDSID_TYPE_DOC: TFIBBCDField;
    DebDSID_OUT_DOC: TFIBBCDField;
    WQuery: TpFIBQuery;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    pnl1: TPanel;
    pnl3: TPanel;
    lbl1: TLabel;
    cxMonthBeg: TcxComboBox;
    cxYearBeg: TcxSpinEdit;
    lbl5: TLabel;
    cxMonthEnd: TcxComboBox;
    cxYearEnd: TcxSpinEdit;
    actRefresh: TAction;
    ilDocImageList: TImageList;
    btnAddButton: TSpeedButton;
    btnModifyButton: TSpeedButton;
    btnDeleteButton: TSpeedButton;
    btnRefreshButton: TSpeedButton;
    btnOkButton: TSpeedButton;
    btnCancelButton: TSpeedButton;
    N4: TMenuItem;
    DebDSIS_OUR_DOC: TFIBIntegerField;
    btnShow: TSpeedButton;
    actPrint: TAction;
    pm2: TPopupMenu;
    N5: TMenuItem;
    StPrDopDog: TpFIBStoredProc;
    TrDopDog: TpFIBTransaction;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    tr_del: TpFIBTransaction;
    stpr_del: TpFIBStoredProc;
    frxDBDataset1: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    DS_DocsList: TpFIBDataSet;
    frxReport: TfrxReport;
    DATE_VIP: TcxGridDBColumn;
    DebDSDATE_VIP: TFIBDateField;
    procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure actShowExecute(Sender: TObject);
    procedure btnChooseButtonClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
//    procedure N2Click(Sender: TObject);
//    procedure P1Click(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actUpdExecute(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actPrintExecute(Sender: TObject);
    procedure N6Click(Sender: TObject);

  private
     DBHANDLE : TISC_DB_HANDLE;
  public
   is_debkr:Integer;
   DBEG, DEND, DATE_REC: TDateTime;
   Year, Month: Word;
   procedure LocateRecord(id : int64);
//   procedure ResProc(id_Doc : int64; Kredit : boolean);
   constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; is_deb_kr:Integer);overload;
  end;

  procedure ShowDocForm(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; is_deb_kr:Integer); stdcall;
  exports ShowDocForm;

var
  DocForm: TDocForm;

implementation

{$R *.dfm}
 uses uWate, uProsmDoc, uDocsAdd, uDocFiltr,uSchDopDog;

constructor TDocForm.Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; is_deb_kr:Integer);
begin
 inherited Create(AOwner);
  if Assigned(DBHandle)
  then begin
   Self.DBHANDLE := DBHandle;
   Self.DebDB.Close;
   Self.DebDB.Handle:=DBHANDLE;
   is_debkr:=is_deb_kr;
   if is_deb_kr = 0 then Self.Caption:='Дебетові документи'
   else Self.Caption:='Кредитові документи';
   month:=MonthOf(PERS_PAY_PERIOD);
   year:=YearOf(PERS_PAY_PERIOD);
   Self.cxMonthBeg.ItemIndex:=month-1;
   Self.cxYearBeg.value:=year;
   Self.cxMonthEnd.ItemIndex:=month-1;
   Self.cxYearEnd.value:=year;
// Self.cxMonthBeg.ItemIndex:=0;
// Self.cxYearBeg.Value:=2009;
   Self.DebDS.Close;
   Self.DataSet.Close;
   actRefreshExecute(Self);

 //access
   actAdd.Enabled:= PCCheckAccess('/ROOT/PERSONPAY/PC_'+ID_SYSTEM+'/PC_'+ID_SYSTEM+'_UCH/PC_'+ID_SYSTEM+'_DOCS','Edit', false)=0;
   actUpd.Enabled:= PCCheckAccess('/ROOT/PERSONPAY/PC_'+ID_SYSTEM+'/PC_'+ID_SYSTEM+'_UCH/PC_'+ID_SYSTEM+'_DOCS','Edit', false)=0;
   actDel.Enabled:= PCCheckAccess('/ROOT/PERSONPAY/PC_'+ID_SYSTEM+'/PC_'+ID_SYSTEM+'_UCH/PC_'+ID_SYSTEM+'_DOCS','Edit', false)=0;

   {if ID_SYSTEM = 1 then
   begin
   actAdd.Enabled:= PCCheckAccess('/ROOT/PERSONPAY/PC_CONTRACTS/PC_CONTR_UCH/PC_CONTR_DOCS','Edit', false)=0;
   actUpd.Enabled:= PCCheckAccess('/ROOT/PERSONPAY/PC_CONTRACTS/PC_CONTR_UCH/PC_CONTR_DOCS','Edit', false)=0;
   actDel.Enabled:= PCCheckAccess('/ROOT/PERSONPAY/PC_CONTRACTS/PC_CONTR_UCH/PC_CONTR_DOCS','Edit', false)=0;
   end;
   if ID_SYSTEM = 2 then
   begin
   actAdd.Enabled:= PCCheckAccess('/ROOT/PERSONPAY/PC_STUD_SITY/PC_STUD_SITY_UCH/PC_STUD_SITY_DOCS','Edit', false)=0;
   actUpd.Enabled:= PCCheckAccess('/ROOT/PERSONPAY/PC_STUD_SITY/PC_STUD_SITY_UCH/PC_STUD_SITY_DOCS','Edit', false)=0;
   actDel.Enabled:= PCCheckAccess('/ROOT/PERSONPAY/PC_STUD_SITY/PC_STUD_SITY_UCH/PC_STUD_SITY_DOCS','Edit', false)=0;
   end;
   if ID_SYSTEM = 3 then
   begin
   actAdd.Enabled:= PCCheckAccess('/ROOT/PERSONPAY/PC_CONTRACTS_VALUTE/PC_CONTR_VAL_UCH/PC_CONTR_VAL_DOCS','Edit', false)=0;
   actUpd.Enabled:= PCCheckAccess('/ROOT/PERSONPAY/PC_CONTRACTS_VALUTE/PC_CONTR_VAL_UCH/PC_CONTR_VAL_DOCS','Edit', false)=0;
   actDel.Enabled:= PCCheckAccess('/ROOT/PERSONPAY/PC_CONTRACTS_VALUTE/PC_CONTR_VAL_UCH/PC_CONTR_VAL_DOCS','Edit', false)=0;
   end;}
 end;
end;

procedure ShowDocForm(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; is_deb_kr:Integer);stdcall;
var
 form : TDocForm;
begin
 form := TDocForm.Create(AOwner,DBHANDLE, is_deb_kr);
 Form.Show;
// Form.Free;
end;

{procedure TDocForm.ResProc(id_Doc: int64; Kredit : boolean);
begin
{ if Kredit and (RadioGroup.ItemIndex = 1) then RadioGroup.ItemIndex := 1
 else if not Kredit and (RadioGroup.ItemIndex = 2) then RadioGroup.ItemIndex := 2
 else SelectAll;   }
//   SelectAll;
{ LocateRecord(id_Doc);
 Show;
end;}

procedure TDocForm.LocateRecord(id: int64);
begin
 if id = -1 then Exit;
 DebDS.Locate('PK_ID', id, []);
end;

procedure TDocForm.btnChooseButtonClick(Sender: TObject);
begin
// cxGrid1DBTableView1.ViewData.Expand(true);

// ShowMessage(IntToStr(DebDS.RecordCount));
end;

procedure TDocForm.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var   Arect : TRect;
begin
Arect:=AViewInfo.Bounds;
  if (vartostr(AViewInfo.GridRecord.Values[4]) = '0')  then
  begin
      ACanvas.Canvas.Brush.Color := $00D2D2D2;
      ACanvas.Canvas.Font.Color:=4;
      ACanvas.Canvas.FillRect(Arect);
  end;
end;

procedure TDocForm.actShowExecute(Sender: TObject);
var form:TProsmDocForm;
      d_b, d_e:TDateTime;
      is_dk, k:Integer;
      id:Int64;
      doc:TDocsAddForm;
begin
  if DebDS.IsEmpty then Exit;
  d_b:=DBEG;
  d_e:=DEND;
  is_dk:=is_debkr;
  id:=DebDSPK_ID.AsInt64;
  {form:=TProsmDocForm.Create(Self, d_b, d_e, is_dk, id);
  if DebDS.FieldValues['NUM_DOC']<>null then form.NumDoc.Text:=DebDS.FieldValues['NUM_DOC'] else form.NumDoc.Text:='';
  if DebDS.FieldValues['DATE_DOC']<>null then form.DateDoc.Text:=DateToStr(DebDS.FieldValues['DATE_DOC']) else form.DateDoc.Text:='';
  if DebDS.FieldValues['SUMMA']<>null then form.SumDoc.Text:=FloatToStr(DebDS.FieldValues['SUMMA']) else form.SumDoc.Text:='';
  if DebDS.FieldValues['NOTE']<>null then form.ContrDoc.Text:=DebDS.FieldValues['NOTE'] else form.ContrDoc.Text:='';
  form.ShowModal;
  Form.free; }
  k := cxGrid1DBTableView1.DataController.FocusedRecordIndex;

  doc := TDocsAddForm.Create(Self);
  doc.State := 'View';
  doc.Caption := 'Перегляд документа';

  doc.NumDoc.Text   := cxGrid1DBTableView1.DataController.Values[k, 0];

  if not VarIsNull(cxGrid1DBTableView1.DataController.Values[k, 6]) then doc.NoteMemo.Text := cxGrid1DBTableView1.DataController.Values[k, 6];
  doc.DateDoc.Date  := cxGrid1DBTableView1.DataController.Values[k, 1];
  doc.PK_id         := DebDSPK_ID.Asint64;

  if is_dk = 0 then
  doc.is_Kredit := False
  else doc.is_Kredit := True;

  doc.Database         := DebDB.Handle;
  doc.ReadTransaction  := ReadTr.Handle;
  doc.WriteTransaction := WriteTr.Handle;

  doc.is_Native := True;

  doc.FormStyle  := fsNormal;
  doc.ShowModal;
  doc.Free;
end;



procedure TDocForm.cxButton2Click(Sender: TObject);
begin
 Close;
end;

{procedure TDocForm.N2Click(Sender: TObject);
var //f:TDocAddUpdForm;
    pk_id: Int64;
    doc:TDocsAddForm;
begin
// pk_id:= DebDSPK_ID.AsInt64;
// f:= TDocAddUpdForm.Create(Self, DBHANDLE, 1, is_debkr, 0, 0, 0);
// f.Show;
// Application.CreateForm(TDocsAddForm, DocsAddForm);
 doc:=TDocsAddForm.Create(Self);
 doc.State     := 'Add';

 if is_debkr = 0 then
  doc.Caption   := 'Додавання дебетового документа'
 else
  doc.Caption   := 'Додавання кредитового документа';

 if is_debkr = 0 then
 doc.is_Kredit := False
 else doc.is_Kredit := True;

 doc.Database         := DebDB.Handle;
 doc.ReadTransaction  := ReadTr.Handle;
 doc.WriteTransaction := WriteTr.Handle;

// DocsAddForm.Res        := ResProc;

// Month := Copy(cxMonthBeg.Text, 1, 2);
 Year:=cxYearBeg.Value;
 Month:=cxMonthBeg.ItemIndex+1;

 doc.ActualDate := StartOfAMonth(Year, Month);
 doc.is_Native := True;

 doc.FormStyle  := fsNormal;
// doc.Position:=MainFormCenter;
 doc.ShowModal;
 doc.Free;
end;         }

{procedure TDocForm.P1Click(Sender: TObject);
var
 k          : integer;
 PK_id      : int64;

// RecInfo    : RECORD_INFO_STRUCTURE;
// ResultInfo : RESULT_STRUCTURE;
// Month      : string;
// o          : TSPEC_OPER_STRUCTURE;

 form:TProsmDocForm;
 d_b, d_e:TDateTime;
 is_dk:Integer;
 id:Int64;
 doc:TDocsAddForm;
begin
 if DebDS.IsEmpty then Exit;
 d_b:=DBEG;
 d_e:=DEND;
 is_dk:=is_debkr;
 id:=DebDSPK_ID.AsInt64;
 form:=TProsmDocForm.Create(Self, d_b, d_e, is_dk, id);
 if form.ForProsmotr.FieldValues['IS_OUR_DOC'] = 0 then
 begin
  ShowMessage('Неможливо змінити цей документ!');
  form.Free;
 end
 else
 begin
  if DocsAddForm2 <> nil then begin
  ShowMessage('Форма редагування зайнята іншим документом!');
  DocsAddForm2.Show;
  Exit;
  end;
//  Application.CreateForm(TDocsAddForm, DocsAddForm2);
  doc:=TDocsAddForm.Create(Self);
  doc.State   := 'Edit';
  doc.Caption := 'Редагування документа';

{  if RadioGroup.ItemIndex = 0 then
   jo9_docs_add_Form2.is_Kredit := VarIsNull(TableView.DataController.Values[k, 20])
  else jo9_docs_add_Form2.is_Kredit := (RadioGroup.ItemIndex = 2); }
{  if is_debkr = 0 then
  doc.is_Kredit := False
  else doc.is_Kredit := True;
  
  k := cxGrid1DBTableView1.DataController.FocusedRecordIndex;

  doc.NumDoc.Text   := cxGrid1DBTableView1.DataController.Values[k, 0];
  doc.NoteMemo.Text := cxGrid1DBTableView1.DataController.Values[k, 5];
  doc.DateDoc.Date  := cxGrid1DBTableView1.DataController.Values[k, 1];
  doc.PK_id         := DebDS.FieldValues['PK_ID'];

  doc.Database         := DebDB.Handle;
  doc.ReadTransaction  := ReadTr.Handle;
  doc.WriteTransaction := WriteTr.Handle;

 Year:=cxYearBeg.Value;
 Month:=cxMonthBeg.ItemIndex+1;

 doc.ActualDate := StartOfAMonth(Year, Month);

//  DocsAddForm2.Res        := ResProc;
//  DocsAddForm2.ActualDate := StartOfAMonth(StrToInt(YearCombo.Text), StrToInt(Month));
  doc.is_Native := True;

  doc.FormStyle  := fsNormal;

  doc.ShowModal;
//  btnChooseButtonClick(Self);
 end;

{



 if TableView.DataController.Values[k, 23] = 1 then begin
  Month := Copy(MonthCombo.Text, 1, 2);

  o.AOwner     := Self;
  o.DBHandle   := Database.Handle;
  o.RTrans     := ReadTransaction.Handle;
  o.WTrans     := WriteTransaction.Handle;
  o.FS         := fsMDIChild;
  o.Mode       := somEdit;
  o.Info       := SYS_INFO;

  if RadioGroup.ItemIndex = 0 then
   o.Kredit := VarIsNull(TableView.DataController.Values[k, 20])
  else o.Kredit := (RadioGroup.ItemIndex = 2);

  o.ActualDate := StartOfAMonth(StrToInt(YearCombo.Text), StrToInt(Month));

  if not VarIsNull(TableView.DataController.Values[k, 11]) then o.Note := TableView.DataController.Values[k, 11];
  o.DateDoc    := TableView.DataController.Values[k, 8];
  o.pk_id      := TableView.DataController.Values[k, 0];
  o.NumDoc     := TableView.DataController.Values[k, 7];
  o.id_out_doc := TableView.DataController.Values[k, 16];

  jo9_PackageLoader.SpecOperations(o);
 end
 else begin
  PK_id := TableView.DataController.Values[k, 0];

  if not WriteTransaction.Active then WriteTransaction.StartTransaction;

  RecInfo.TRHANDLE       := WriteTransaction.Handle;
  RecInfo.DBHANDLE       := Database.Handle;
  RecInfo.ID_RECORD      := VarArrayOf([PK_id]);
  RecInfo.PK_FIELD_NAME  := VarArrayOf(['PK_ID']);
  RecInfo.TABLE_NAME     := 'PUB_DT_ALL_DOC';
  RecInfo.RAISE_FLAG     := false;

  ResultInfo := Kernel.LockRecord(@RecInfo);
  if ResultInfo.RESULT_CODE = 0 then begin
   WriteTransaction.Rollback;
   ShowMessage(ResultInfo.RESULT_MESSAGE);
   Exit;
  end;

  Application.CreateForm(Tjo9_docs_add_Form, jo9_docs_add_Form2);
  jo9_docs_add_Form2.State   := 'Edit';
  jo9_docs_add_Form2.Caption := 'Редагування документа';

  if RadioGroup.ItemIndex = 0 then
   jo9_docs_add_Form2.is_Kredit := VarIsNull(TableView.DataController.Values[k, 20])
  else jo9_docs_add_Form2.is_Kredit := (RadioGroup.ItemIndex = 2);

  jo9_docs_add_Form2.NumDoc.Text   := TableView.DataController.Values[k, 7];
  jo9_docs_add_Form2.NoteMemo.Text := TableView.DataController.Values[k, 11];
  jo9_docs_add_Form2.DateDoc.Date  := TableView.DataController.Values[k, 8];
  jo9_docs_add_Form2.PK_id         := PK_id;

  jo9_docs_add_Form2.Database         := Database.Handle;
  jo9_docs_add_Form2.ReadTransaction  := ReadTransaction.Handle;
  jo9_docs_add_Form2.WriteTransaction := WriteTransaction.Handle;

  Month := Copy(MonthCombo.Text, 1, 2);

  jo9_docs_add_Form2.Res        := ResProc;
  jo9_docs_add_Form2.ActualDate := StartOfAMonth(StrToInt(YearCombo.Text), StrToInt(Month));
  jo9_docs_add_Form2.is_Native := True;

  jo9_docs_add_Form2.FormStyle  := fsMDIChild;

  jo9_docs_add_Form2.Show;
 end;


end; }

procedure TDocForm.actCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TDocForm.actAddExecute(Sender: TObject);
var //f:TDocAddUpdForm;
    pk_id: Int64;
    doc:TDocsAddForm;
begin
// pk_id:= DebDSPK_ID.AsInt64;
// f:= TDocAddUpdForm.Create(Self, DBHANDLE, 1, is_debkr, 0, 0, 0);
// f.Show;
// Application.CreateForm(TDocsAddForm, DocsAddForm);
 doc:=TDocsAddForm.Create(Self);
 doc.State     := 'Add';

 if is_debkr = 0 then
  doc.Caption   := 'Додавання дебетового документа'
 else
  doc.Caption   := 'Додавання кредитового документа';

 if is_debkr = 0 then
 doc.is_Kredit := False
 else doc.is_Kredit := True;

 doc.Database         := DebDB.Handle;
 doc.ReadTransaction  := ReadTr.Handle;
 doc.WriteTransaction := WriteTr.Handle;

// DocsAddForm.Res        := ResProc;

// Month := Copy(cxMonthBeg.Text, 1, 2);
 Year:=cxYearBeg.Value;
 Month:=cxMonthBeg.ItemIndex+1;

 doc.ActualDate := StartOfAMonth(Year, Month);
 doc.is_Native := True;

 doc.FormStyle  := fsNormal;
// doc.Position:=MainFormCenter;
 doc.ShowModal;

 doc.Free;

 actRefreshExecute(Self);

end;

procedure TDocForm.actUpdExecute(Sender: TObject);
var
 k          : integer;
 PK_id      : int64;

// RecInfo    : RECORD_INFO_STRUCTURE;
// ResultInfo : RESULT_STRUCTURE;
// Month      : string;
// o          : TSPEC_OPER_STRUCTURE;

 form:TProsmDocForm;
 d_b, d_e:TDateTime;
 is_dk:Integer;
 id:Int64;
 doc:TDocsAddForm;
begin

 if DebDS.IsEmpty then Exit;
 d_b:=DBEG;
 d_e:=DEND;
 is_dk:=is_debkr;
 id:=DebDSPK_ID.AsInt64;
// form:=TProsmDocForm.Create(Self, d_b, d_e, is_dk, id);
 if {form.ForProsmotr.FieldValues['IS_OUR_DOC'] = 0 } DebDSIS_OUR_DOC.AsInteger=0
 then
 begin
  ShowMessage('Неможливо змінити цей документ!');
  //form.Free;
 end
 else
 begin
  if DocsAddForm2 <> nil then begin
  ShowMessage('Форма редагування зайнята іншим документом!');
  DocsAddForm2.Show;
  Exit;
  end;
  doc:=TDocsAddForm.Create(Self);
  doc.State   := 'Edit';
  doc.Caption := 'Редагування документа';

 if is_debkr = 0 then
  doc.is_Kredit := False
  else doc.is_Kredit := True;
  
  k := cxGrid1DBTableView1.DataController.FocusedRecordIndex;

  doc.NumDoc.Text   := cxGrid1DBTableView1.DataController.Values[k, 0];
  doc.NoteMemo.Text := DebDSNOTE.AsString;//cxGrid1DBTableView1.DataController.Values[k, 6];
  doc.DateDoc.Date  := cxGrid1DBTableView1.DataController.Values[k, 1];
  doc.PK_id         := DebDSPK_ID.Asint64;//cxGrid1DBTableView1.DataController.Values[k, 6];//DebDS.FieldValues['PK_ID'];
  doc.ID_TYPE_DOC   :=DebDSID_TYPE_DOC.AsInteger;
  doc.Database         := DebDB.Handle;
  doc.ReadTransaction  := ReadTr.Handle;
  doc.WriteTransaction := WriteTr.Handle;

 Year:=cxYearBeg.Value;
 Month:=cxMonthBeg.ItemIndex+1;

 doc.ActualDate := StartOfAMonth(Year, Month);

 doc.is_Native := True;

 doc.FormStyle  := fsNormal;

 doc.ShowModal;

actRefreshExecute(Self);
DebDS.Locate('PK_ID', intTostr(id), []);
 end;
end;

procedure TDocForm.actDelExecute(Sender: TObject);
var
 k           : integer;
 PK_id       : int64;

 RecInfo     : RECORD_INFO_STRUCTURE;
 ResultInfo  : RESULT_STRUCTURE;

 STRU        : KERNEL_MODE_STRUCTURE;
 DoResult    : Boolean;
 KEY_SESSION : integer;
 ErrorList   : TStringList;
 DocDate     : TDate;

 Key, id     : int64;
 d_b, d_e    :TDateTime;
 is_dk       :Integer;
 form        :TProsmDocForm;
 f           :TWateForm;
 is_prov     :Integer;
begin
 k := cxGrid1DBTableView1.DataController.FocusedRecordIndex;
  if DebDS.IsEmpty then Exit;
 d_b:=DBEG;
 d_e:=DEND;
 is_dk:=is_debkr;
 id:=DebDSPK_ID.AsInt64;

 if DebDSIS_OUR_DOC.AsInteger = 0
 then
 begin
  ShowMessage('Неможливо видалити цей документ!');
  Exit;
 end;

 PK_id   := id;
 DocDate := cxGrid1DBTableView1.DataController.Values[k, 1];
 if MessageDlg('Ви дійсно бажаєте видалити обраний документ?', mtConfirmation, [mbYes, mbNo],0) = mrYes then
begin

 WriteTr.StartTransaction;
 // Удаляю выбранный документ

 KEY_SESSION := DebDB.Gen_Id('KERNEL_GEN_ID_SESSION', 1);

 STRU.KEY_SESSION   := KEY_SESSION;
 STRU.WORKDATE      := PERS_PAY_PERIOD;
 STRU.DBHANDLE      := DebDB.Handle;
 STRU.TRHANDLE      := WriteTr.Handle;
 STRU.KERNEL_ACTION := 2;
 STRU.PK_ID         := PK_id;
 STRU.ID_USER       := USER_ID;

 try
  DoResult:=Kernel.KernelDo(@STRU);
 except
  on E:Exception do begin
   WriteTr.Rollback;
   ShowMessage('Помилка ядра ' + E.Message);
   Exit;
  end;
 end;

 if not DoResult then begin
  ErrorList := Kernel.GetDocErrorsListEx(@STRU);
  WriteTr.Rollback;
  ShowMessage(ErrorList.Text);
  Exit;
 end;
 WriteTr.Commit;
 // удаляю из таблиц контрактов и студгородка
 try
 stpr_del.Close;
 stpr_del.Transaction := tr_del;
 stpr_del.Transaction.StartTransaction;
 stpr_del.StoredProcName:='PC_DT_DEL_FROM_STUD_CONTR';
 stpr_del.Prepare;
 stpr_del.ParamByName('PK_ID').AsInt64         := PK_id;
 stpr_del.ParamByName('FORM_UCH').AsInteger    := FORM_UCH;
 stpr_del.ExecProc;
 stpr_del.Transaction.Commit;
except on E : Exception
 do begin
  ShowMessage(E.Message);
 stpr_del.Transaction.Rollback;
  exit;
    end;
end;

 //
end;

 actRefreshExecute(Self);
end;

procedure TDocForm.actRefreshExecute(Sender: TObject);
var
 form:TWateForm;

begin
 Year:=cxYearBeg.Value;
 Month:=cxMonthBeg.ItemIndex+1;
 DBEG:=StartOfAMonth(Year, Month);
 Year:=cxYearEnd.Value;
 Month:=cxMonthEnd.ItemIndex+1;
 DEND:=EndOfAMonth(Year, Month);

 form:=TWateForm.Create(Self);
 form.Show;
 form.Update;
 DebDS.Close;
// DebDS.SelectSQL.Clear;
// DebDS.SelectSQL.Add('SELECT * FROM PC_DT_DEB_KR_DOC(:DATE_BEG, :DATE_END, :IS_DEB_KR, :ID_REG)');
 DebDS.Prepare;
 DebDS.ParamByName('DATE_BEG').AsDate:=DBEG;
 DebDS.ParamByName('DATE_END').AsDate:=DEND;
 DebDS.ParamByName('IS_DEB_KR').AsInteger:=is_debkr;
 DebDS.ParamByName('ID_REG').AsInteger:=ID_REG;
 DebDS.CloseOpen(False);

 form.Free;

end;

procedure TDocForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TDocForm.actPrintExecute(Sender: TObject);
var Form:TWateForm;
    name_report: string;
begin
  Form:=TWateForm.Create(Self);
  Form.Show;
  Form.Update;
  DS_DocsList.Close;
  DS_DocsList.SQLs.SelectSQL.Text:='select * from PC_CURRENT_DOCS_LIST(:DATE_BEG, :DATE_END, :IS_DEB_KR, :ID_REG) order by name_customer, num_doc, date_doc';
  DS_DocsList.ParamByName('DATE_BEG').AsDate:=DBEG;
  DS_DocsList.ParamByName('DATE_END').AsDate:=DEND;
  DS_DocsList.ParamByName('IS_DEB_KR').AsInteger:=is_debkr;
  DS_DocsList.ParamByName('ID_REG').AsInteger:=ID_REG;
  DS_DocsList.CloseOpen(False);

  name_report:='\frReestrDocs.fr3';
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+ name_report);
  frxReport.Variables['MONTH1']:=''''+AnsiUpperCase(cxMonthBeg.Text)+'''';
  frxReport .Variables['YEAR1']:=IntToStr(cxYearBeg.Value);
  frxReport.Variables['MONTH2']:=''''+AnsiUpperCase(cxMonthEnd.Text)+'''';
  frxReport.Variables['YEAR2']:=IntToStr(cxYearEnd.Value);
  frxReport.Variables['ORG_NAME']:=''''+ORG_FULL_NAME+'''';
  frxReport.Variables['ORG_SHORT_NAME']:=''''+SHORT_TITLE+'''';
  frxReport.Variables['ORG_KOD_OKPO']:=''''+ORG_KOD_OKPO+'''';
  frxReport.Variables['USER']:=''''+USER_FIO+'''';
  frxReport.Variables['NOT_PRINT_FIO_ISPOLN']:=NOT_PRINT_FIO_ISPOLN;
  frxReport.Variables['IS_DEB_KR']:=is_debkr;

  frxReport.PrepareReport;
  frxReport.PrintOptions.ShowDialog:=True;
  //frxReport.DesignReport;
  frxReport.ShowReport;
  Form.Free;
end;

procedure TDocForm.N6Click(Sender: TObject);
var year, month:Word;
    form:TWateForm;
    STRU:KERNEL_MODE_STRUCTURE;
    DoResult    : Boolean;
    ErrorList   : TStringList;
    MemoLines   : TStringList;
    f           : TDopDogForm;
    id_db_sch   : Integer;
begin
  f:=TDopDogForm.Create(Self);
  f.ShowModal;
  if f.ModalResult=mrOk then
  begin

  year:=YearOf(PERS_PAY_PERIOD);
  month:=Monthof(PERS_PAY_PERIOD);
 form:=TWateForm.Create(Self);
 form.Show;
 form.Update;
 try
 StPrDopDog.Close;
 StPrDopDog.Transaction := TrDopDog;
 StPrDopDog.Transaction.StartTransaction;
 StPrDopDog.StoredProcName:='PC_DT_DOP_DOG_CLOSE';
 StPrDopDog.Prepare;
 StPrDopDog.ParamByName('ID_REG').AsInteger:=ID_REG;
 StPrDopDog.ParamByName('DATE_END').AsDate:=EndofAMonth(year, month);
 StPrDopDog.ParamByName('ID_DB_SCH').AsInteger:=SCH_ARRAY[f.cxSCH.ItemIndex][0];
 StPrDopDog.ParamByName('IS_CLOSE_DB_OST').AsInteger:=f.is_close_db_ost;
 StPrDopDog.ExecProc;
 StPrDopDog.Transaction.Commit;
except on E : Exception
 do begin
  ShowMessage(E.Message);
 StPrDopDog.Transaction.Rollback;
  exit;
    end;
end;
// StPrDopDog.Open;
 form.Update;
 if StPrDopDog.ParamByName('RESULTING').Value = 1 then
 begin
 TrDopDog.Active:=True;

 STRU.KEY_SESSION   := StPrDopDog.ParamByName('KEY_SESSION').Value;
 STRU.WORKDATE      := PERS_PAY_PERIOD;
 STRU.DBHANDLE      := StPrDopDog.Database.Handle;
 STRU.TRHANDLE      := StPrDopDog.Transaction.Handle;
 STRU.KERNEL_ACTION := 1;
 STRU.ID_USER       := USER_ID;

 try
  DoResult:=Kernel.KernelDo(@STRU);
 except
  on E:Exception do begin
   StPrDopDog.Transaction.Rollback;
   form.Free;
   ShowMessage(E.Message);
   Exit;
  end;
 end;

 if not DoResult then
 begin
  ErrorList := Kernel.GetDocErrorsListEx(@STRU);
  MemoLines:=TStringList.Create;
  MemoLines.AddStrings(ErrorList);
  ShowMessage(MemoLines.Text);
  StPrDopDog.Transaction.Rollback;
 end
 else
 begin
  StPrDopDog.Transaction.Commit;
  ShowMessage('Документ проведено без помилок!');
 end;
 end
 else
 ShowMessage('Немає проводок для створення документу');
 form.Free;
 actRefresh.Execute;
end;
f.Free;
end;
end.
