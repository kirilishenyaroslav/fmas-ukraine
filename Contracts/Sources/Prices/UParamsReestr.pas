//******************************************************************************
// Проект "Контракты"
// Форма работы с прейскурантом
// Перчак А.Л. 2008
//******************************************************************************
unit UParamsReestr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, cxStyles, ImgList, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit,
  cxContainer, cxCheckBox, ExtCtrls, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls,  Contnrs, FIBDataSet,
  pFIBDataSet, pFibStoredProc, cxLookAndFeelPainters, cxButtons, cxDBEdit,
  Menus, Ibase, FIBDatabase, pFIBDatabase, ActnList, FIBQuery, pFIBQuery,
  CnConsts, cn_Common_Funcs, cxPC, Placemnt, cxCalendar;

type
  TRecInfo=array of int64;

  TfrmPriceReestr = class(TForm)
    ToolBar3: TToolBar;
    AddButton: TToolButton;
    DelButton: TToolButton;
    RefreshButton: TToolButton;
    ExitButton: TToolButton;
    DataSource: TDataSource;
    cxStyleRepository1: TcxStyleRepository;
    back: TcxStyle;
    column_gray: TcxStyle;
    periods: TcxStyle;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    backbold: TcxStyle;
    LargeImages: TImageList;
    WorkDatabase: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    ActionList1: TActionList;
    StProc: TpFIBStoredProc;
    ChangeButton: TToolButton;
    DataSetGrid: TpFIBDataSet;
    Change: TAction;
    Add: TAction;
    Refresh: TAction;
    Del: TAction;
    Choose: TAction;
    Out: TAction;
    cxPageControl1: TcxPageControl;
    Page1: TcxTabSheet;
    Page2: TcxTabSheet;
    Page3: TcxTabSheet;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGrid3: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridDBColumn12: TcxGridDBColumn;
    cxGridDBColumn13: TcxGridDBColumn;
    cxGridDBColumn14: TcxGridDBColumn;
    cxGridDBColumn15: TcxGridDBColumn;
    cxGridDBColumn16: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridDBColumn17: TcxGridDBColumn;
    cxGridDBColumn18: TcxGridDBColumn;
    cxGridDBColumn19: TcxGridDBColumn;
    cxGridDBColumn20: TcxGridDBColumn;
    cxGridDBColumn21: TcxGridDBColumn;
    cxGridDBColumn22: TcxGridDBColumn;
    cxGridDBColumn23: TcxGridDBColumn;
    cxGridDBColumn24: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    PopupMenu2: TPopupMenu;
    Add1: TMenuItem;
    Change1: TMenuItem;
    Check1: TMenuItem;
    exit1: TMenuItem;
    Refresh1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    AddbyParam: TAction;
    AddbyParam1: TMenuItem;
    ChooseButton: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    BudgetButton: TToolButton;
    CnFormStorage: TFormStorage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ChangeExecute(Sender: TObject);
    procedure RefreshExecute(Sender: TObject);
    procedure DelExecute(Sender: TObject);
    procedure OutExecute(Sender: TObject);
    procedure cxGridDBTableView3CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGridDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGridDBTableView2CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure N3Click(Sender: TObject);
    procedure AddExecute(Sender: TObject);
    procedure AddbyParamExecute(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure ChooseButtonClick(Sender: TObject);
    procedure BudgetButtonClick(Sender: TObject);
    procedure cxGridDBTableView3FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cxGridDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cxGridDBTableView2FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cxGridDBTableView3DblClick(Sender: TObject);
    procedure cxGridDBTableView1DblClick(Sender: TObject);
    procedure cxGridDBTableView2DblClick(Sender: TObject);

  private
    DateBeg:TDateTime;
    DateEnd:TDateTime;
  public
    { Public declarations }
    Result       : Variant;
    Quene        : TObjectStack;
    New_Id_price:Int64;
    PLanguageIndex:integer;
    Is_admin:Boolean;
    constructor Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;ID_PRICE:Int64;ID_USER:Int64);overload;
    constructor Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;DateBeg,DateEnd:TDateTime;ID_USER:Int64);overload;
  end;


implementation

uses UGetRec, UPriceSmet, DateUtils,BaseTypes, cn_SummaEdit_Unit,PricesMain;
{$R *.dfm}

constructor TfrmPriceReestr.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;ID_PRICE:Int64;ID_USER:Int64);
begin
  Inherited Create(AOwner);
  WorkDatabase.Handle:=DB_Handle;
  New_Id_price:=ID_PRICE;

  ReadTransaction.StartTransaction;
  DateBeg:=(AOwner as TfrmPricesMain).TreeDataSet.FieldByName('PRICE_BEG').AsDateTime;
  DateEnd:=(AOwner as TfrmPricesMain).TreeDataSet.FieldByName('PRICE_End').AsDateTime;

  DatasetGrid.Close;
  DataSetGrid.ParamByName('ID_PRICE').AsInt64:=New_Id_price;
  DataSetGrid.Open;

  PLanguageIndex        := cn_Common_Funcs.cnLanguageIndex;
  AddButton.Caption     := cn_InsertBtn_Caption[PLanguageIndex];
  AddButton.Hint        := cn_InsertBtn_Caption[PLanguageIndex];
  ChangeButton.Caption  := cn_EditBtn_Caption[PLanguageIndex];
  ChangeButton.Hint     := cn_EditBtn_Caption[PLanguageIndex];
  Change1.Caption       := cn_EditBtn_Caption[PLanguageIndex];
  Change1.hint          := cn_EditBtn_Caption[PLanguageIndex];
  RefreshButton.Caption := cn_RefreshBtn_Caption[PLanguageIndex];
  RefreshButton.Hint    := cn_RefreshBtn_Caption[PLanguageIndex];
  Refresh1.Caption      := cn_RefreshBtn_Caption[PLanguageIndex];
  Refresh1.Hint         := cn_RefreshBtn_Caption[PLanguageIndex];
  DelButton.Caption     := cn_DeleteBtn_Caption[PLanguageIndex];
  DelButton.Hint        := cn_DeleteBtn_Caption[PLanguageIndex];
  Del.Caption           := cn_DeleteBtn_Caption[PLanguageIndex];
  Del.Hint              := cn_DeleteBtn_Caption[PLanguageIndex];
  ChooseButton.Caption  := cn_SelectBtn_Caption[PLanguageIndex];
  ChooseButton.Hint     := cn_SelectBtn_Caption[PLanguageIndex];
  ExitButton.Caption    := cn_ExitBtn_Caption[PLanguageIndex];
  ExitButton.Hint       := cn_ExitBtn_Caption[PLanguageIndex];
  add.Caption           := cn_add_new_summ[PLanguageIndex];
  add.Hint              := cn_add_new_summ[PLanguageIndex];
  AddbyParam.Caption    := cn_add_new_summ_by_param[PLanguageIndex];
  AddbyParam.Hint       := cn_add_new_summ_by_param[PLanguageIndex];
  Exit1.Caption         := cn_ExitBtn_Caption[PLanguageIndex];
  exit1.Hint            := cn_ExitBtn_Caption[PLanguageIndex];
  N3.Caption            := cn_ViewAll[PLanguageIndex];
  N3.Hint               := cn_ViewAll[PLanguageIndex];
  N4.Caption            := cn_HidenAll[PLanguageIndex];
  N4.Hint               := cn_HidenAll[PLanguageIndex];

  ChooseButton.Visible:=False;
  CnFormStorage.RestoreFormPlacement;
end;

procedure TfrmPriceReestr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CnFormStorage.SaveFormPlacement;
  Action:=caFree;
end;


constructor TfrmPriceReestr.Create(AOwner: TComponent; DB_Handle: TISC_DB_HANDLE; DateBeg, DateEnd: TDateTime; ID_USER: Int64);
begin
  Inherited Create(AOwner);
  Self.FormStyle:=fsNormal;
  WorkDatabase.Handle:=DB_Handle;

  ReadTransaction.StartTransaction;
  DataSetGrid.Close;
  DataSetGrid.SQLs.SelectSQL.Clear;
  DataSetGrid.SQLs.SelectSQL.Add('SELECT * FROM CN_PRICES_SELECT_BY_DATE(:DATE_BEG,:DATE_END)');
  DataSetGrid.SQLs.SelectSQL.Add('Order by faculty, speciality, date_start;');
  DataSetGrid.ParamByName('DATE_BEG').AsDate:=DateBeg;
  DataSetGrid.ParamByName('DATE_END').AsDate:=DateEnd;
  DataSetGrid.Open;

  Self.Caption:='Треба вибрати суму договору по параметрам навчання';

  AddButton.Enabled:=false;
  DelButton.Enabled:=false;

  PLanguageIndex        := cn_Common_Funcs.cnLanguageIndex;
  AddButton.Caption     := cn_InsertBtn_Caption[PLanguageIndex];
  AddButton.Hint        := cn_InsertBtn_Caption[PLanguageIndex];
  ChangeButton.Caption  := cn_EditBtn_Caption[PLanguageIndex];
  ChangeButton.Hint     := cn_EditBtn_Caption[PLanguageIndex];
  Change1.Caption       := cn_EditBtn_Caption[PLanguageIndex];
  Change1.hint          := cn_EditBtn_Caption[PLanguageIndex];
  RefreshButton.Caption := cn_RefreshBtn_Caption[PLanguageIndex];
  RefreshButton.Hint    := cn_RefreshBtn_Caption[PLanguageIndex];
  Refresh1.Caption      := cn_RefreshBtn_Caption[PLanguageIndex];
  Refresh1.Hint         := cn_RefreshBtn_Caption[PLanguageIndex];
  DelButton.Caption     := cn_DeleteBtn_Caption[PLanguageIndex];
  DelButton.Hint        := cn_DeleteBtn_Caption[PLanguageIndex];
  Del.Caption           := cn_DeleteBtn_Caption[PLanguageIndex];
  Del.Hint              := cn_DeleteBtn_Caption[PLanguageIndex];
  ChooseButton.Caption  := cn_SelectBtn_Caption[PLanguageIndex];
  ChooseButton.Hint     := cn_SelectBtn_Caption[PLanguageIndex];
  ExitButton.Caption    := cn_ExitBtn_Caption[PLanguageIndex];
  ExitButton.Hint       := cn_ExitBtn_Caption[PLanguageIndex];
  add.Caption          := cn_add_new_summ[PLanguageIndex];
  add.Hint             := cn_add_new_summ[PLanguageIndex];
  AddbyParam.Caption    := cn_add_new_summ_by_param[PLanguageIndex];
  AddbyParam.Hint       := cn_add_new_summ_by_param[PLanguageIndex];
  Exit1.Caption         := cn_ExitBtn_Caption[PLanguageIndex];
  exit1.Hint            := cn_ExitBtn_Caption[PLanguageIndex];
  N3.Caption            := cn_ViewAll[PLanguageIndex];
  N3.Hint               := cn_ViewAll[PLanguageIndex];
  N4.Caption            := cn_HidenAll[PLanguageIndex];
  N4.Hint               := cn_HidenAll[PLanguageIndex];
end;

//--------------------------Процедура изменения---------------------------------
procedure TfrmPriceReestr.ChangeExecute(Sender: TObject);
var
  ChangeForm: TfrmSummaEdit;
  id:integer;
begin
 ChangeForm:= TfrmSummaEdit.Create(self);
 ChangeForm.curEdit.Value := DataSetGrid.FieldByName('SUMMA').Value;
 id:=DataSetGrid.FieldByName('Id_Rec').AsInteger;

 ChangeForm.PLanguageIndex:=PLanguageIndex;
 ChangeForm.Caption          :=cn_Summa_Column[PLanguageIndex];
 ChangeForm.btnOk.Caption    :=cn_Accept[PLanguageIndex];
 ChangeForm.btnOk.Hint       :=cn_Accept[PLanguageIndex];
 ChangeForm.btnClose.Caption :=cn_Cancel[PLanguageIndex];
 ChangeForm.btnClose.Hint    :=cn_Cancel[PLanguageIndex];

 if ChangeForm.ShowModal= mrOk then
  begin
   with StProc do
   begin
     StoredProcName := 'CN_PRICES_EDIT_BY_PARAMS';
     Transaction.StartTransaction;
     ParamByName('ID_REC').AsInt64        := id;
     ParamByName('DATE_START').AsDate     := DataSetGrid.FieldByName('DATE_START').Value;
     ParamByName('SUMMA_OLD').AsCurrency  := DataSetGrid.FieldByName('SUMMA').Value;
     ParamByName('SUMMA_NEW').AsCurrency  := ChangeForm.curEdit.Value;
     Prepare;
     ExecProc;
     try
      Transaction.Commit;
     except
       Transaction.Rollback;
       raise;
     end;
   end;
    DataSetGrid.CloseOpen(true);
    DataSetGrid.Locate('ID_REC', id, []);
    ChangeForm.Free;
  end;
end;

procedure TfrmPriceReestr.RefreshExecute(Sender: TObject);
begin
     DataSetGrid.CloseOpen(True);
end;

procedure TfrmPriceReestr.DelExecute(Sender: TObject);
begin
 if (DataSetGrid.RecordCount>0)then
  begin
   if BaseTypes.agMessageDlg('Увага!','Ви дійсно бажаєте видалити записи?',mtConfirmation,[mbYes,mbNo])=mrYes then
    begin
     with StProc do
      begin
       StoredProcName := 'CN_PRICES_DEL_BY_PARAMS';
       Transaction.StartTransaction;
       ParamByName('ID_PRICE').AsInt64 := new_Id_price;
       ParamByName('ID_FACULTY').AsInt64 := DataSetGrid.FieldByName('ID_FACULTY').AsInteger;
       ParamByName('ID_SPECIALITY').AsInt64 := DataSetGrid.FieldByName('ID_SPECIALITY').AsInteger;
       ParamByName('ID_GRAGDANSTVO').AsInt64 := DataSetGrid.FieldByName('ID_GRAGDANSTVO').AsInteger;
       ParamByName('ID_FORM_TEATCH').AsInt64 := DataSetGrid.FieldByName('ID_FORM_TEATCH').AsInteger;
       ParamByName('ID_KATEGORY').AsInt64    := DataSetGrid.FieldByName('ID_KATEGORY').AsInteger;
       ParamByName('ID_KURS').AsInt64        := DataSetGrid.FieldByName('ID_KURS').AsInteger;
       ParamByName('DATE_START').AsDate      := DataSetGrid.FieldByName('DATE_START').AsDateTime;
       Prepare;
       ExecProc;
       try
        Transaction.Commit;
       except
        Transaction.Rollback;
        raise;
       end;
      end;
     DataSetGrid.CloseOpen(true);
    end;
  end;
end;

procedure TfrmPriceReestr.OutExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmPriceReestr.cxGridDBTableView3CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  If (ACellViewInfo.Item.Index=7)or(ACellViewInfo.Item.Index=6) then
   begin
    ChangeButton.Enabled:=true;
    ChooseButton.Enabled:=true;
    BudgetButton.Enabled:=true;
   End;
  AHandled:=true;
end;

procedure TfrmPriceReestr.cxGridDBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  If (ACellViewInfo.Item.Index=7)or(ACellViewInfo.Item.Index=6) then
   begin
    ChangeButton.Enabled:=true;
    ChooseButton.Enabled:=true;
    BudgetButton.Enabled:=true;
   End;
  AHandled:=true;
end;

procedure TfrmPriceReestr.cxGridDBTableView2CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  If (ACellViewInfo.Item.Index=7)or(ACellViewInfo.Item.Index=6) then
   begin
    ChangeButton.Enabled:=true;
    ChooseButton.Enabled:=true;
    BudgetButton.Enabled:=true;
   End;
  AHandled:=true;
end;

procedure TfrmPriceReestr.N3Click(Sender: TObject);
begin
  if cxPageControl1.ActivePageIndex=0 then cxGridDBTableView3.ViewData.Expand(true);
  if cxPageControl1.ActivePageIndex=1 then  cxGridDBTableView1.ViewData.Expand(true);
  if cxPageControl1.ActivePageIndex=2 then cxGridDBTableView2.ViewData.Expand(true);
end;

procedure TfrmPriceReestr.AddExecute(Sender: TObject);
var
  T:TfrmGetRec;
  id_REC:integer;
begin
     T:=TfrmGetRec.Create(self,nil,DateBeg,DateEnd);
     T.ActionOk.Caption     := cn_Accept[PLanguageIndex];
     T.ActionOk.Hint        := cn_Accept[PLanguageIndex];
     T.ActionCancel.Caption := cn_Cancel[PLanguageIndex];
     T.ActionCancel.Hint    := cn_Cancel[PLanguageIndex];

     if T.ShowModal=mrYes then
       begin
        StProc.StoredProcName:='CN_PRICES_REC_INSERT' ;
        StProc.Transaction.StartTransaction;
        StProc.Prepare;
        StProc.ParamByName('ID_PRICE')      .AsInt64 :=New_Id_price;
        StProc.ParamByName('ID_FACULTY')    .AsInt64 :=T.Id_Faculty;
        StProc.ParamByName('ID_KATEGORY')   .AsInt64 :=T.id_Kategory;
        StProc.ParamByName('ID_SPECIALITY') .AsInt64 :=T.Id_Speciality;
        StProc.ParamByName('ID_FORM_TEATCH').AsInt64 :=T.Id_FormTeatch;
        StProc.ParamByName('ID_GRAGDANSTVO').AsInt64 :=T.id_gragdanstv;
        StProc.ParamByName('ID_KURS')       .AsInt64 :=T.id_Kurs;
        StProc.ParamByName('SUMMA_VALUE')   .Value   :=T.SumValue.EditValue;
        StProc.ParamByName('DATE_START')    .Value   :=T.DateStart.Date;
        StProc.ExecProc;
        id_REC:=StProc.ParamByName('ID_REC').AsInt64;
        try
          stproc.Transaction.Commit;
          stproc.Close;
        except
          StProc.Transaction.Rollback;
          StProc.Close;
         raise;
        end;
        DataSetGrid.CloseOpen(true);
        DataSetGrid.Locate('ID_REC',id_REC,[]);
       End;
     T.Free;
end;

procedure TfrmPriceReestr.AddbyParamExecute(Sender: TObject);
var
  T:TfrmGetRec;
  id_REC:integer;
begin
     T:=TfrmGetRec.Create(self,nil,DateBeg,DateEnd);
     T.ActionOk.Caption     := cn_Accept[PLanguageIndex];
     T.ActionOk.Hint        := cn_Accept[PLanguageIndex];
     T.ActionCancel.Caption := cn_Cancel[PLanguageIndex];
     T.ActionCancel.Hint    := cn_Cancel[PLanguageIndex];

     T.SpecialityText.Enabled :=true;
     T.FacultyText.Text       :=DataSetGrid.FieldByName('FACULTY').AsString;
     T.Id_Faculty             :=DataSetGrid.FieldByName('ID_FACULTY').AsInteger;
     T.SpecialityText.Text    :=DataSetGrid.FieldByName('SPECIALITY').AsString;
     T.Id_Speciality          :=DataSetGrid.FieldByName('ID_SPECIALITY').AsInteger;
     T.FormTeatchText.Text    :=DataSetGrid.FieldByName('FORM_TEATCH').AsString;
     T.Id_FormTeatch          :=DataSetGrid.FieldByName('ID_FORM_TEATCH').AsInteger;
     T.GragdText.Text         :=DataSetGrid.FieldByName('GRAGDANSTVO').AsString;
     T.id_gragdanstv          :=DataSetGrid.FieldByName('ID_GRAGDANSTVO').AsInteger;
     T.KategoryText.Text      :=DataSetGrid.FieldByName('KATEGORY').AsString;
     T.id_Kategory            :=DataSetGrid.FieldByName('ID_KATEGORY').AsInteger;
     T.KursText.Text          :=DataSetGrid.FieldByName('KURS').AsString;
     T.id_Kurs                :=DataSetGrid.FieldByName('ID_KURS').AsInteger;

     if T.ShowModal=mrYes then
       begin
        StProc.StoredProcName:='CN_PRICES_REC_INSERT' ;
        StProc.Transaction.StartTransaction;
        StProc.Prepare;
        StProc.ParamByName('ID_PRICE')      .AsInt64 :=New_Id_price;
        StProc.ParamByName('ID_FACULTY')    .AsInt64 :=T.Id_Faculty;
        StProc.ParamByName('ID_KATEGORY')   .AsInt64 :=T.id_Kategory;
        StProc.ParamByName('ID_SPECIALITY') .AsInt64 :=T.Id_Speciality;
        StProc.ParamByName('ID_FORM_TEATCH').AsInt64 :=T.Id_FormTeatch;
        StProc.ParamByName('ID_GRAGDANSTVO').AsInt64 :=T.id_gragdanstv;
        StProc.ParamByName('ID_KURS')       .AsInt64 :=T.id_Kurs;
        StProc.ParamByName('SUMMA_VALUE')   .Value   :=T.SumValue.EditValue;
        StProc.ParamByName('DATE_START')    .Value   :=T.DateStart.Date;
        StProc.ExecProc;
        id_REC:=StProc.ParamByName('ID_REC').AsInt64;
        try
          stproc.Transaction.Commit;
          stproc.Close;
        except
          StProc.Transaction.Rollback;
          StProc.Close;
         raise;
        end;
        DataSetGrid.CloseOpen(true);
        DataSetGrid.Locate('ID_REC',id_REC,[]);
       End;
     T.Free;
end;

procedure TfrmPriceReestr.N4Click(Sender: TObject);
begin
   if cxPageControl1.ActivePageIndex=0 then cxGridDBTableView3.ViewData.Collapse(true);
   if cxPageControl1.ActivePageIndex=1 then cxGridDBTableView1.ViewData.Collapse(true);
   if cxPageControl1.ActivePageIndex=2 then cxGridDBTableView2.ViewData.Collapse(true);
end;

procedure TfrmPriceReestr.ChooseButtonClick(Sender: TObject);
begin
  if (DataSetGrid.RecordCount>0)
   then begin
     Result:=VarArrayOf([{Идентификаторы параметров обучения}
                                   DataSetGrid.FieldByName('ID_FACULTY').Value,
                                   DataSetGrid.FieldByName('ID_SPECIALITY').Value,
                                   DataSetGrid.FieldByName('ID_GRAGDANSTVO').Value,
                                   DataSetGrid.FieldByName('ID_FORM_TEATCH').Value,
                                   DataSetGrid.FieldByName('ID_KATEGORY').Value,
                                   DataSetGrid.FieldByName('ID_KURS').Value,
                                   {Коды параметров обучения}
                                   DataSetGrid.FieldByName('FACULTY').Value,
                                   DataSetGrid.FieldByName('SPECIALITY').Value,
                                   DataSetGrid.FieldByName('GRAGDANSTVO').Value,
                                   DataSetGrid.FieldByName('FORM_TEATCH').Value,
                                   DataSetGrid.FieldByName('KATEGORY').Value,
                                   DataSetGrid.FieldByName('KURS').Value,
                                   {Сумма по прейскуранту}
                                   DataSetGrid.FieldByName('SUMMA').Value]);
               ModalResult:=mrYes;
     end;
end;

procedure TfrmPriceReestr.BudgetButtonClick(Sender: TObject);
var
  T:TfrmGetValueSmet;
begin
  if (DataSetGrid.RecordCount>0)then
   begin
    T:=TfrmGetValueSmet.Create(self, StrToInt64(DataSetGrid.FieldByName('ID_REC').AsString));
    T.ShowModal;
    T.Free;
   end;
end;

procedure TfrmPriceReestr.cxGridDBTableView3FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  ChangeButton.Enabled:=False;
  ChooseButton.Enabled:=False;
  BudgetButton.Enabled:=False;
end;

procedure TfrmPriceReestr.cxGridDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  ChangeButton.Enabled:=False;
  ChooseButton.Enabled:=False;
  BudgetButton.Enabled:=False;
end;

procedure TfrmPriceReestr.cxGridDBTableView2FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  ChangeButton.Enabled:=False;
  ChooseButton.Enabled:=False;
  BudgetButton.Enabled:=False;  
end;

procedure TfrmPriceReestr.cxGridDBTableView3DblClick(Sender: TObject);
begin
  if ChooseButton.Enabled then ChooseButtonClick(self);
end;

procedure TfrmPriceReestr.cxGridDBTableView1DblClick(Sender: TObject);
begin
  if ChooseButton.Enabled then ChooseButtonClick(self);
end;

procedure TfrmPriceReestr.cxGridDBTableView2DblClick(Sender: TObject);
begin
  if ChooseButton.Enabled then ChooseButtonClick(self);
end;

End.
