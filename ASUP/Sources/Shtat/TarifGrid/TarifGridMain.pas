unit TarifGridMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxCheckBox,
  cxGridTableView, cxGridLevel, cxGridCustomTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, ActnList, FIBQuery,
  pFIBQuery, pFIBStoredProc, FIBDataSet, pFIBDataSet, FIBDatabase,
  pFIBDatabase, dxBar, dxBarExtItems, ImgList, Basetypes, ibase, uCommonSp,
  uUnivSprav, AccMgmt, ExtCtrls, cxLookAndFeelPainters, StdCtrls, cxButtons,
  RxMemDS, cxSplitter, cxLabel, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxContainer, DateUtils;

type
  TfrmTarifGrid = class(TForm)
    TarifGrid: TcxGrid;
    TarifGridTV: TcxGridDBTableView;
    TarifGridLvl: TcxGridLevel;
    cxStyleRepository1: TcxStyleRepository;
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
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    DBase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    TarifGridDSet: TpFIBDataSet;
    TarifGridDSource: TDataSource;
    StorProc: TpFIBStoredProc;
    ActionList1: TActionList;
    InsAct: TAction;
    ModifyAct: TAction;
    DelAct: TAction;
    RefreshAct: TAction;
    CloseAct: TAction;
    CategoryAct: TAction;
    BarManager: TdxBarManager;
    btnAdd: TdxBarLargeButton;
    btnEdit: TdxBarLargeButton;
    btnDelete: TdxBarLargeButton;
    btnClose: TdxBarLargeButton;
    btnRefresh: TdxBarLargeButton;
    btnSearch: TdxBarLargeButton;
    ImageList: TImageList;
    pnlTarifGrid: TPanel;
    pnlbtnTarifGrid: TPanel;
    CatTarifDSet: TpFIBDataSet;
    CatTarifGridDSource: TDataSource;
    InsActCat: TAction;
    ModifyActCat: TAction;
    DelActCat: TAction;
    RefreshActCat: TAction;
    SelectCategory: TAction;
    pnlTarifCaption: TPanel;
    GridBarDockControl: TdxBarDockControl;
    dxBarButton1: TdxBarButton;
    btnAddD: TdxBarLargeButton;
    btnModifyD: TdxBarLargeButton;
    btnDelD: TdxBarLargeButton;
    btnRefreshD: TdxBarLargeButton;
    btnSelect: TdxBarLargeButton;
    PopupMenuAdd: TdxBarPopupMenu;
    PopupMenuEdit: TdxBarPopupMenu;
    PopupMenuDel: TdxBarPopupMenu;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    btnExit: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    FilterBox: TcxCheckBox;
    DateBegFilter: TcxDateEdit;
    DateEndFilter: TcxDateEdit;
    lblBegFilter: TcxLabel;
    lblEndFilter: TcxLabel;
    PNL: TPanel;
    pnlTarifHead: TPanel;
    GridHead: TcxGrid;
    GridHeadTV: TcxGridDBTableView;
    GridLvl: TcxGridLevel;
    Panel3: TPanel;
    GridCategory: TcxGrid;
    GridCategoryTV: TcxGridDBTableView;
    GridCategoryLvl: TcxGridLevel;
    TarifGridTVDBColumn1: TcxGridDBColumn;
    TarifGridTVDBColumn2: TcxGridDBColumn;
    TarifGridTVDBColumn3: TcxGridDBColumn;
    TarifGridTVDBColumn4: TcxGridDBColumn;
    GridHeadTVDBColumn1: TcxGridDBColumn;
    GridCategoryTVDBColumn1: TcxGridDBColumn;
    GridCategoryTVDBColumn2: TcxGridDBColumn;
    GridCategoryTVDBColumn3: TcxGridDBColumn;
    GridCategoryTVDBColumn4: TcxGridDBColumn;
    ActHeadIns: TAction;
    ActHeadEdit: TAction;
    ActHeadDel: TAction;
    ActHeadRef: TAction;
    pnlToolCategory: TPanel;
    CategBarDockControl: TdxBarDockControl;
    dxBarButton2: TdxBarButton;
    btnCatAdd: TdxBarLargeButton;
    btnCatEdit: TdxBarLargeButton;
    btnCatDel: TdxBarLargeButton;
    btnCatRefresh: TdxBarLargeButton;
    Panel1: TPanel;
    dxBarDockControl1: TdxBarDockControl;
    btnHeadAdd: TdxBarLargeButton;
    btnHeadEdit: TdxBarLargeButton;
    btnHeadDel: TdxBarLargeButton;
    btnHeadRefresh: TdxBarLargeButton;
    HeadDSet: TpFIBDataSet;
    HeadDSource: TDataSource;
    cxSplitter1: TcxSplitter;
    cxSplitter2: TcxSplitter;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure InsActExecute(Sender: TObject);
    procedure RefreshActExecute(Sender: TObject);
    procedure ModifyActExecute(Sender: TObject);
    procedure DelActExecute(Sender: TObject);
    procedure CloseActExecute(Sender: TObject);
    procedure CategoryActExecute(Sender: TObject);
    procedure TarifGridTVKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure InsActCatExecute(Sender: TObject);
    procedure ModifyActCatExecute(Sender: TObject);
    procedure RefreshActCatExecute(Sender: TObject);
    procedure DelActCatExecute(Sender: TObject);
    procedure SelectCategoryExecute(Sender: TObject);
    procedure CatTarifGridDBViewDblClick(Sender: TObject);
    procedure FilterBoxPropertiesChange(Sender: TObject);
    procedure DateBegFilterPropertiesChange(Sender: TObject);
    procedure DateEndFilterPropertiesChange(Sender: TObject);
    procedure GridCategoryTVDblClick(Sender: TObject);
    procedure ActHeadRefExecute(Sender: TObject);
    procedure ActHeadInsExecute(Sender: TObject);
    procedure ActHeadEditExecute(Sender: TObject);
    procedure ActHeadDelExecute(Sender: TObject);
    procedure HeadDSetAfterScroll(DataSet: TDataSet);
    procedure TarifGridDSetAfterScroll(DataSet: TDataSet);
    procedure GridHeadTVKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridCategoryTVKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
     IdTarifGrid, IdHeadTarif:Variant;
     FullName:string;
     DateBeg, DateEnd, ActDate: TDate;
     Output: TRxMemoryData;
     IsDBOpen:Boolean;
     SumStav, RateFirstCategory:Double;
    { Private declarations }
  public
    isSelect:Boolean;
    { Public declarations }
    constructor Create(AOwner:TComponent; OutPut:TRxMemoryData;
                       DbHnd:TISC_DB_HANDLE; SelectMode:Integer;
                       DateBegIn, DateEndIn:TDate);
    procedure TarifDataSetCloseOpen;
    procedure HeadDataSetCloseOpen;
    procedure CategoryDataSetCloseOpen;
    procedure RefreshAllGrids;
    procedure EnableButton(IsEnabled:Boolean);
    procedure PrepareDatesFilter;
    procedure GridsBeginEndUpdate(isBegin:Boolean);
  end;

var
  frmTarifGrid: TfrmTarifGrid;

implementation

uses TarifGridAdd, uFControl, CatTarifGridAdd, TarifNameAdd;

{$R *.dfm}

constructor TfrmTarifGrid.Create(AOwner:TComponent; OutPut:TRxMemoryData;
                                 DbHnd:TISC_DB_HANDLE; SelectMode:Integer;
                                 DateBegIn, DateEndIn:TDate);
begin
  inherited Create(AOwner);
  Self.Output:=OutPut;
  DateBegFilter.Date:=DateBegIn;
  DateEndFilter.Date:=DateEndIn;
  DBase.Handle:=TISC_DB_HANDLE(DbHnd);
  RefreshAllGrids;
  IsDBOpen:=True;
  if SelectMode=0 then isSelect:=True
  else
  begin
     isSelect:=False;
     btnSelect.Visible:=ivNever;
     SelectCategory.Enabled:=False;
  end;
end;

procedure TfrmTarifGrid.GridsBeginEndUpdate(isBegin:Boolean);
begin
   if isBegin then
   begin
       GridHeadTV.DataController.BeginUpdate;
       TarifGridTV.DataController.BeginUpdate;
       GridCategoryTV.DataController.BeginUpdate;
   end
   else
   begin
       GridHeadTV.DataController.EndUpdate;
       TarifGridTV.DataController.EndUpdate;
       GridCategoryTV.DataController.EndUpdate;
   end;
end;

procedure TfrmTarifGrid.PrepareDatesFilter;
begin
   if FilterBox.Checked then
   begin
      if ((Length(DateBegFilter.EditText)=10) and (Length(DateEndFilter.EditText)=10)) then
      begin
          DateBegFilter.Date:=StrToDate(DateBegFilter.EditText);
          DateEndFilter.Date:=StrToDate(DateEndFilter.EditText);
          DateBeg:=DateBegFilter.Date;
          DateEnd:=DateEndFilter.Date;
      end;
   end
   else
   begin
      DateBeg:=EncodeDate(1900, 1, 1);
      DateEnd:=EncodeDate(9999, 12, 31);
   end;
end;

procedure TfrmTarifGrid.EnableButton(IsEnabled:Boolean);
begin
   btnAdd.Enabled:=IsEnabled;
   btnAddD.Enabled:=IsEnabled;
   btnEdit.Enabled:=IsEnabled;
   btnModifyD.Enabled:=IsEnabled;
   btnDelete.Enabled:=IsEnabled;
   btnDelD.Enabled:=IsEnabled;
   if IsEnabled=True then  btnSelect.Visible:=ivNever
   else btnSelect.Visible:=ivAlways;
   //btnSelect.Visible:=not IsEnabled;
   InsAct.Enabled:=IsEnabled;
   InsActCat.Enabled:=IsEnabled;
   ModifyAct.Enabled:=IsEnabled;
   ModifyActCat.Enabled:=IsEnabled;
   DelAct.Enabled:=IsEnabled;
   DelActCat.Enabled:=IsEnabled;
   CategoryAct.Enabled:=not IsEnabled;
end;

procedure TfrmTarifGrid.RefreshAllGrids;
begin
  try
     GridsBeginEndUpdate(True);
     PrepareDatesFilter;
     HeadDSet.Close;
     TarifGridDSet.Close;
     CatTarifDSet.Close;
     HeadDSet.SQLs.SelectSQL.Text:='select distinct * from up_dt_tarif_head_sel(:date_beg, :date_end)';
     HeadDSet.ParamByName('date_beg').AsDate:=DateBeg;
     HeadDSet.ParamByName('date_end').AsDate:=DateEnd;
     TarifGridDSet.SQLs.SelectSQL.Text:='select distinct * from up_dt_tarif_grid_sel(?id_tarif_head, :date_beg_in, :date_end_in)';
     TarifGridDSet.ParamByName('date_beg_in').AsDate:=DateBeg;
     TarifGridDSet.ParamByName('date_end_in').AsDate:=DateEnd;
     CatTarifDSet.SQLs.SelectSQL.Text:='select distinct * from up_category_tarif_grid_sel(?id_tarif_grid) order by num_category asc';
     HeadDSet.Open;
     TarifGridDSet.Open;
     CatTarifDSet.Open;
     GridsBeginEndUpdate(False);
  except on E:Exception
         do begin
               agMessageDlg('Увага', E.Message, mtError, [mbOK]);
               HeadDSet.Close;
               TarifGridDSet.Close;
               CatTarifDSet.Close;
         end;
   end;
end;

procedure TfrmTarifGrid.HeadDataSetCloseOpen;
begin
  try
     GridsBeginEndUpdate(True);
     PrepareDatesFilter;
     HeadDSet.Close;
     HeadDSet.SQLs.SelectSQL.Text:='select distinct * from up_dt_tarif_head_sel(:date_beg, :date_end)';
     HeadDSet.ParamByName('date_beg').AsDate:=DateBeg;
     HeadDSet.ParamByName('date_end').AsDate:=DateEnd;
     HeadDSet.Open;
     GridsBeginEndUpdate(False);
  except on E:Exception
         do begin
               agMessageDlg('Увага', E.Message, mtError, [mbOK]);
               HeadDSet.Close;
         end;
   end;
end;

procedure TfrmTarifGrid.TarifDataSetCloseOpen;
begin
  try
     if VarIsNull(IdHeadTarif) then Exit;
     GridsBeginEndUpdate(True);
     PrepareDatesFilter;
     TarifGridDSet.Close;
     TarifGridDSet.SQLs.SelectSQL.Text:='select distinct * from up_dt_tarif_grid_sel(:id_tarif_head, :date_beg_in, :date_end_in)';
     TarifGridDSet.ParamByName('id_tarif_head').AsDate:=IdHeadTarif;
     TarifGridDSet.ParamByName('date_beg_in').AsDate:=DateBeg;
     TarifGridDSet.ParamByName('date_end_in').AsDate:=DateEnd;
     TarifGridDSet.Open;
     GridsBeginEndUpdate(False);
  except on E:Exception
         do begin
               agMessageDlg('Увага', E.Message, mtError, [mbOK]);
               TarifGridDSet.Close;
         end;
   end;
end;

procedure TfrmTarifGrid.CategoryDataSetCloseOpen;
var DBeg, DEnd:TDate;
begin
  try
     if VarIsNull(IdTarifGrid) then Exit;
     GridsBeginEndUpdate(True);
     PrepareDatesFilter;
     CatTarifDSet.Close;
     CatTarifDSet.SQLs.SelectSQL.Text:='select distinct * from up_category_tarif_grid_sel(:id_tarif_grid) order by num_category asc';
     CatTarifDSet.ParamByName('id_tarif_grid').AsInteger:=IdTarifGrid;
     CatTarifDSet.Open;
     GridsBeginEndUpdate(False);
  except on E:Exception
         do begin
               agMessageDlg('Увага', E.Message, mtError, [mbOK]);
               CatTarifDSet.Close;
         end;
   end;
end;


procedure TfrmTarifGrid.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then Action:=caFree;
end;

procedure TfrmTarifGrid.InsActExecute(Sender: TObject);
var Id, IdHead, Check:Integer;
    frm:TfrmTarifGridAdd;
begin
   Check := fibCheckPermission('/ROOT/SHR_Sprav/TARIF_GRID', 'Add');
   if check<>0 then
   begin
      agMessageDlg('Помилка!','Ви не маєте прав на виконання цієї дії! ',mtError,[mbOk]);
      exit;
   end;

   if HeadDSet.IsEmpty then
   begin
      agMessageDlg('Увага!', 'Треба спочатку додати шапку тарифа!', mtInformation, [mbOK]);
      Exit;
   end;
   IdHead:=IdHeadTarif;
   frm:=TfrmTarifGridAdd.Create(Self, False);
   frm.Caption:='Додати тариф';
   if frm.ShowModal=mrOk then
   begin
      StorProc.StoredProcName:='UP_DT_TARIF_GRID_INS';
      StorProc.Transaction.StartTransaction;
      StorProc.Prepare;
      StorProc.ParamByName('RATE_FIRST_CATEGORY').AsFloat:=frm.TarifRate.Value;
      StorProc.ParamByName('ID_TARIF_HEAD').AsInteger:=IdHeadTarif;
      StorProc.ParamByName('PERIOD_BEG').AsDate:=frm.TarifDateBeg.Date;
      StorProc.ParamByName('PERIOD_END').AsDate:=frm.TarifDateEnd.Date;
      try
        StorProc.ExecProc;
        id:=StorProc.FieldByName('ID_TARIF_GRID').AsInteger;
        StorProc.Transaction.Commit;
      except on E:Exception
             do begin
                   ShowMessage(E.Message);
                   StorProc.Transaction.Rollback;
                end;
      end;
   end;
   frm.Free;
   //TarifDataSetCloseOpen;
   HeadDataSetCloseOpen;
   HeadDSet.Locate('ID_TARIF_HEAD', IdHead, []);
   TarifGridDSet.Locate('ID_TARIF_GRID', Id, []);
end;

procedure TfrmTarifGrid.RefreshActExecute(Sender: TObject);
var id:Variant;
begin
   Id:=TarifGridDSet['Id_Tarif_Grid'];
   TarifDataSetCloseOpen;
   try
      TarifGridDSet.Locate('Id_Tarif_Grid', Id, []);
   except
   end;
end;

procedure TfrmTarifGrid.ModifyActExecute(Sender: TObject);
var IdTarif, IdHead, Check:Integer;
    frm:TfrmTarifGridAdd;
    KeyStr:string;
begin
   Check := fibCheckPermission('/ROOT/SHR_Sprav/TARIF_GRID', 'Edit');
   if check<>0 then
   begin
      agMessageDlg('Помилка!','Ви не маєте прав на виконання цієї дії! ',mtError,[mbOk]);
      exit;
   end;

   If TarifGridDSet.IsEmpty then
   begin
     agMessageDlg('Увага!', 'Немає інформації для змін!', mtInformation, [mbOK]);
     Exit;
   end;
   IdHead:=IdHeadTarif;
   frm:=TfrmTarifGridAdd.Create(Self, True);
   frm.Caption:='Змінити тариф';
   IdTarif:=TarifGridDSet['ID_TARIF_GRID'];
   If VarIsNull(TarifGridDSet['RATE_FIRST_CATEGORY']) then
      frm.TarifRate.Value:=0
   else
      frm.TarifRate.Value:=TarifGridDSet['RATE_FIRST_CATEGORY'];
   If VarIsNull(TarifGridDSet['DATE_BEG']) then
      frm.TarifDateBeg.Date:=Date
   else
      frm.TarifDateBeg.Date:=TarifGridDSet['DATE_BEG'];
   If VarIsNull(TarifGridDSet['DATE_END']) then
      frm.TarifDateEnd.Date:=Date
   else
   begin
      if DateToStr(TarifGridDSet['DATE_END'])='31.12.9999' then
         frm.WithOutEndPeriod.Checked:=True;
      frm.TarifDateEnd.Date:=TarifGridDSet['DATE_END'];
   end;

   if frm.ShowModal=mrOk then
   begin
      StorProc.StoredProcName:='UP_DT_TARIF_GRID_UPD';
      StorProc.Transaction.StartTransaction;
      StorProc.Prepare;
      StorProc.ParamByName('ID_TARIF_GRID').AsFloat:=IdTarif;
      StorProc.ParamByName('RATE_FIRST_CATEGORY').AsFloat:=frm.TarifRate.Value;
      StorProc.ParamByName('ID_TARIF_HEAD').AsInteger:=IdHeadTarif;
      StorProc.ParamByName('DATE_BEG').AsDate:=frm.TarifDateBeg.Date;
      StorProc.ParamByName('DATE_END').AsDate:=frm.TarifDateEnd.Date;
      try
        StorProc.ExecProc;
        StorProc.Transaction.Commit;
      except on E:Exception
             do begin
                   ShowMessage(E.Message);
                   StorProc.Transaction.Rollback;
                end;
      end;
   End;
   TarifDataSetCloseOpen;
   //HeadDataSetCloseOpen;
   //HeadDSet.Locate('ID_TARIF_HEAD', IdHead, []);
   TarifGridDSet.Locate('ID_TARIF_GRID', IdTarif, []);
   frm.Free;
end;

procedure TfrmTarifGrid.DelActExecute(Sender: TObject);
var Check, IdHead, LocId: Integer;
begin
   LocId:=-1;
   Check := fibCheckPermission('/ROOT/SHR_Sprav/TARIF_GRID', 'Del');
   if check<>0 then
   begin
      agMessageDlg('Помилка!','Ви не маєте прав на виконання цієї дії! ',mtError,[mbOk]);
      exit;
   end;
   if TarifGridDSet.IsEmpty then Exit;
   IdHead:=IdHeadTarif;
   if agMessageDlg('Увага!', 'Ви дійсно бажаєте вилучити цей запис?', mtConfirmation, [mbYes, mbNo])=mrYes then
   begin
      StorProc.StoredProcName:='UP_DT_TARIF_GRID_DEL';
      StorProc.Transaction.StartTransaction;
      StorProc.Prepare;
      StorProc.ParamByName('ID_TARIF_GRID').AsInteger:=TarifGridDSet['ID_TARIF_GRID'];
      StorProc.ExecProc;
      StorProc.Transaction.Commit;
   end
   else LocId:=TarifGridDSet['ID_TARIF_GRID'];
   //TarifDataSetCloseOpen;
   HeadDataSetCloseOpen;
   HeadDSet.Locate('ID_TARIF_HEAD', IdHead, []);
   If LocId<>-1 then TarifGridDSet.Locate('ID_TARIF_GRID', LocId, []);
end;

procedure TfrmTarifGrid.CloseActExecute(Sender: TObject);
begin
   Close;
end;

procedure TfrmTarifGrid.CategoryActExecute(Sender: TObject);
var Sp:TSprav;
    Check: Integer;
begin
   Check := fibCheckPermission('/ROOT/SHR_Sprav/CATEG_TARIF_GRID', 'Belong');
   if check<>0 then
   begin
      agMessageDlg('Помилка!','Ви не маєте прав на виконання цієї дії! ',mtError,[mbOk]);
      exit;
   end;
   if TarifGridDSet.IsEmpty then Exit;
   Sp:=GetSprav('UP\UpCategoryTarifGrid');
   if sp <> nil then
   begin
      with sp.Input do
      begin
        Append;
        FieldValues['DBHandle']    := Integer(Dbase.Handle);
        FieldValues['IdTarifGrid'] := TarifGridDSet['ID_TARIF_GRID'];
        FieldValues['FormCaption'] := TarifGridDSet['NAME_TARIF_GRID'];
        Post;
      end;
      sp.Show;
   end;
   Sp.Free;
end;

procedure TfrmTarifGrid.TarifGridTVKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   If (( Key = VK_F12) and (ssShift in Shift)) Then ShowInfo(TarifGridDSet);
   if Key=VK_INSERT Then InsActExecute(Sender);
   if Key=VK_F2 then ModifyActExecute(Sender);
   If Key=VK_DELETE then DelActExecute(Sender);
   If Key=VK_F5 Then RefreshActExecute(Sender);
end;

procedure TfrmTarifGrid.InsActCatExecute(Sender: TObject);
var Id, IdTarif, IdHead, Check:Integer;
    frm:TfrmCatTarifGridAdd;
begin
   Check := fibCheckPermission('/ROOT/SHR_Sprav/CATEG_TARIF_GRID', 'Add');
   if check<>0 then
   begin
      agMessageDlg('Помилка!','Ви не маєте прав на виконання цієї дії! ',mtError,[mbOk]);
      exit;
   end;
   if TarifGridDSet.IsEmpty then Exit;
   IdTarif:=IdTarifGrid;
   IdHead:=IdHeadTarif;
   frm:=TfrmCatTarifGridAdd.Create(Self, False, IdTarifGrid, ActDate, RateFirstCategory, SumStav, null);
   frm.Caption:='Додати розряд';
   if frm.ShowModal=mrOk then
   begin
      StorProc.StoredProcName:='UP_CATEGORY_TARIF_GRID_INS';
      StorProc.Transaction.StartTransaction;
      StorProc.Prepare;
      StorProc.ParamByName('ID_TARIF_GRID').AsInteger:=IdTarifGrid;
      StorProc.ParamByName('NUM_CATEGORY').AsInteger:=StrToInt(frm.CategoryEdit.Text);
      StorProc.ParamByName('KOEFF_FIRST_CATEGORY').AsFloat:=frm.CatKoeff.Value;
      StorProc.ParamByName('NOTE').AsString:=frm.CatNote.Text;
      try
        StorProc.ExecProc;
        id:=StorProc.FieldByName('ID_CAT_TARIF_GRID').AsInteger;
        StorProc.Transaction.Commit;
      except on E:Exception
             do begin
                   ShowMessage(E.Message);
                   StorProc.Transaction.Rollback;
                end;
      end;
   end;
   CategoryDataSetCloseOpen;
   TarifGridDSet.Locate('ID_TARIF_GRID', IdTarif, []);
   CatTarifDSet.Locate('ID_CAT_TARIF_GRID', Id, []);
   frm.Free;
end;

procedure TfrmTarifGrid.ModifyActCatExecute(Sender: TObject);
var Id, IdTarif, IdHead, Check:Integer;
    frm:TfrmCatTarifGridAdd;
begin
   Check := fibCheckPermission('/ROOT/SHR_Sprav/CATEG_TARIF_GRID', 'Edit');
   if check<>0 then
   begin
      agMessageDlg('Помилка!','Ви не маєте прав на виконання цієї дії! ',mtError,[mbOk]);
      exit;
   end;

   If CatTarifDSet.IsEmpty then
   begin
     agMessageDlg('Увага!', 'Немає інформації для змін!', mtInformation, [mbOK]);
     Exit;
   end;
   IdTarif:=IdTarifGrid;
   IdHead:=IdHeadTarif;
   Id:=CatTarifDSet['ID_CAT_TARIF_GRID'];
   frm:=TfrmCatTarifGridAdd.Create(Self, True, IdTarifGrid, ActDate, RateFirstCategory, SumStav, Id);
   frm.Caption:='Змінити розряд';
   if VarIsNull(CatTarifDSet['NOTE']) then
      frm.CatNote.Text:=''
   else
      frm.CatNote.Text:=CatTarifDSet['NOTE'];
   If VarIsNull(CatTarifDSet['NUM_CATEGORY']) then
      frm.CategoryEdit.Text:='0'
   else
      frm.CategoryEdit.Text:=IntToStr(CatTarifDSet['NUM_CATEGORY']);
   If VarIsNull(CatTarifDSet['KOEFF_FIRST_CATEGORY']) then
      frm.CatKoeff.Value:=0
   else
      frm.CatKoeff.Value:=CatTarifDSet['KOEFF_FIRST_CATEGORY'];

   if frm.ShowModal=mrOk then
   begin
      StorProc.StoredProcName:='UP_CATEGORY_TARIF_GRID_UPD';
      StorProc.Transaction.StartTransaction;
      StorProc.Prepare;
      StorProc.ParamByName('ID_CAT_TARIF_GRID').AsInteger:=Id;
      StorProc.ParamByName('ID_TARIF_GRID').AsInteger:=IdTarifGrid;
      StorProc.ParamByName('NUM_CATEGORY').AsInteger:=StrToInt(frm.CategoryEdit.Text);
      StorProc.ParamByName('KOEFF_FIRST_CATEGORY').AsFloat:=frm.CatKoeff.Value;
      StorProc.ParamByName('NOTE').AsString:=frm.CatNote.Text;
      try
        StorProc.ExecProc;
        StorProc.Transaction.Commit;
      except on E:Exception
             do begin
                   ShowMessage(E.Message);
                   StorProc.Transaction.Rollback;
                end;
      end;
   end;
   CategoryDataSetCloseOpen;
   TarifGridDSet.Locate('ID_TARIF_GRID', IdTarif, []);
   CatTarifDSet.Locate('ID_CAT_TARIF_GRID', Id, []);
   frm.Free;
end;

procedure TfrmTarifGrid.RefreshActCatExecute(Sender: TObject);
var Id:Variant;
begin
   Id:=CatTarifDSet['Id_Cat_Tarif_Grid'];
   CategoryDataSetCloseOpen;
   try
      CatTarifDSet.Locate('Id_Cat_Tarif_Grid', Id, []);
   except
   end;
end;

procedure TfrmTarifGrid.DelActCatExecute(Sender: TObject);
Var Check, IdTarif, LocId: Integer;
begin
   LocId:=-1;
   Check := fibCheckPermission('/ROOT/SHR_Sprav/CATEG_TARIF_GRID', 'Del');
   if check<>0 then
   begin
      agMessageDlg('Помилка!','Ви не маєте прав на виконання цієї дії! ',mtError,[mbOk]);
      exit;
   end;
   if VarIsNull(CatTarifDSet['ID_CAT_TARIF_GRID']) then Exit;
   IdTarif:=IdTarifGrid;
   if agMessageDlg('Увага!', 'Ви дійсно бажаєте вилучити цей запис?', mtConfirmation, [mbYes, mbNo])=mrYes then
   begin
      StorProc.StoredProcName:='UP_CATEGORY_TARIF_GRID_DEL';
      StorProc.Transaction.StartTransaction;
      StorProc.Prepare;
      StorProc.ParamByName('ID_CAT_TARIF_GRID').AsInteger:=CatTarifDSet['ID_CAT_TARIF_GRID'];
      StorProc.ExecProc;
      StorProc.Transaction.Commit;
   end
   else LocId:=CatTarifDSet['ID_CAT_TARIF_GRID'];
   TarifDataSetCloseOpen;
   TarifGridDSet.Locate('ID_TARIF_GRID', IdTarif, []);
   if LocId<>-1 then CatTarifDSet.Locate('ID_CAT_TARIF_GRID', LocId, []);
end;

procedure TfrmTarifGrid.SelectCategoryExecute(Sender: TObject);
begin
   if isSelect=False then Exit;
   if VarIsNull(CatTarifDSet['ID_CAT_TARIF_GRID']) then Exit;
   if Output <> nil then
   begin
      Output.Open;
      Output.Append;
      Output['Id_Cat_Tarif_Grid'] := CatTarifDSet['Id_Cat_Tarif_Grid'];
      Output['Full_Name']:=FullName+'('+CatTarifDSet['NOTE']+') '+
                           FloatToStr(CatTarifDSet['Rate_Out'])+' '+
                           DateToStr(DateBeg)+' '+
                           DateToStr(DateEnd);
      Output['Name_Tarif']:=CatTarifDSet['NAME_TARIF_OUT'];
      Output['Name_Category']:=CatTarifDSet['NOTE'];
      Output['Rate_Out']:=FloatToStr(CatTarifDSet['Rate_Out']);
      Output['Date_Beg']:=CatTarifDSet['Date_Beg'];
      Output['Date_End']:=CatTarifDSet['Date_End'];
      Output['Num_Category']:=CatTarifDSet['Num_Category'];
      Output['Id_Category_Tarif']:=CatTarifDSet['Id_Category_Tarif'];
      Output.Post;
   end;
   ModalResult:=mrOk;
end;

procedure TfrmTarifGrid.CatTarifGridDBViewDblClick(Sender: TObject);
begin
   if CategoryAct.Enabled then
      SelectCategoryExecute(Self);
end;

procedure TfrmTarifGrid.FilterBoxPropertiesChange(Sender: TObject);
var id:Variant;
begin
    Id:=HeadDSet['Id_Tarif_Head'];
    DateBegFilter.Enabled:=FilterBox.Checked;
    DateEndFilter.Enabled:=FilterBox.Checked;
    If IsDBOpen then RefreshAllGrids;
    try
      HeadDSet.Locate('Id_Tarif_Head', id, []);
    except
    end;
end;

procedure TfrmTarifGrid.DateBegFilterPropertiesChange(Sender: TObject);
begin
   If IsDBOpen then RefreshAllGrids;
end;

procedure TfrmTarifGrid.DateEndFilterPropertiesChange(Sender: TObject);
begin
   If IsDBOpen then RefreshAllGrids;
end;

procedure TfrmTarifGrid.GridCategoryTVDblClick(Sender: TObject);
begin
   SelectCategoryExecute(Sender);
end;

procedure TfrmTarifGrid.ActHeadRefExecute(Sender: TObject);
var Id:Variant;
begin
   id:=HeadDSet['Id_tarif_head'];
   HeadDataSetCloseOpen;
   try
     HeadDSet.Locate('Id_Tarif_Head', Id, []);
   except
   end;
end;

procedure TfrmTarifGrid.ActHeadInsExecute(Sender: TObject);
var Id, Check:Integer;
    frm:TfrmTarifName;
begin
   Check := fibCheckPermission('/ROOT/SHR_Sprav/TARIF_GRID', 'Add');
   if check<>0 then
   begin
      agMessageDlg('Помилка!','Ви не маєте прав на виконання цієї дії! ',mtError,[mbOk]);
      exit;
   end;
   frm:=TfrmTarifName.Create(Self);
   frm.Caption:='Додати назву тарифа';
   if frm.ShowModal=mrOk then
   begin
      StorProc.StoredProcName:='UP_DT_TARIF_HEAD_INS';
      StorProc.Transaction.StartTransaction;
      StorProc.Prepare;
      StorProc.ParamByName('NAME_TARIF_GRID').AsString:=frm.TarifName.Text;
      try
        StorProc.ExecProc;
        Id:=StorProc.FieldByName('ID_TARIF_HEAD').AsInteger;
        StorProc.Transaction.Commit;
      except on E:Exception
             do begin
                   ShowMessage(E.Message);
                   StorProc.Transaction.Rollback;
                end;
      end;
      HeadDataSetCloseOpen;
      HeadDSet.Locate('ID_TARIF_HEAD', Id, []);
   end;
   frm.Free;
end;

procedure TfrmTarifGrid.ActHeadEditExecute(Sender: TObject);
var Id, Check:Integer;
    frm:TfrmTarifName;
begin
   Check := fibCheckPermission('/ROOT/SHR_Sprav/TARIF_GRID', 'Edit');
   if check<>0 then
   begin
      agMessageDlg('Помилка!','Ви не маєте прав на виконання цієї дії! ',mtError,[mbOk]);
      exit;
   end;

   If HeadDSet.IsEmpty then
   begin
     agMessageDlg('Увага!', 'Немає інформації для змін!', mtInformation, [mbOK]);
     Exit;
   end;

   frm:=TfrmTarifName.Create(Self);
   frm.Caption:='Змінити назву тарифа';
   Id:=HeadDSet['ID_TARIF_HEAD'];
   if VarIsNull(HeadDSet['NAME_TARIF_GRID']) then
      frm.TarifName.Text:=''
   else
      frm.TarifName.Text:=HeadDSet['NAME_TARIF_GRID'];
   if frm.ShowModal=mrOk then
   begin
      StorProc.StoredProcName:='UP_DT_TARIF_HEAD_UPD';
      StorProc.Transaction.StartTransaction;
      StorProc.Prepare;
      StorProc.ParamByName('ID_TARIF_HEAD').AsInteger:=Id;
      StorProc.ParamByName('NAME_TARIF_GRID').AsString:=frm.TarifName.Text;
      try
        StorProc.ExecProc;
        StorProc.Transaction.Commit;
      except on E:Exception
             do begin
                   agMessageDlg('Увага!', E.Message, mtError, [mbOK]);
                   StorProc.Transaction.Rollback;
                end;
      end;
   end;
   HeadDataSetCloseOpen;
   HeadDSet.Locate('ID_TARIF_HEAD', Id, []);
   frm.Free;
end;

procedure TfrmTarifGrid.ActHeadDelExecute(Sender: TObject);
var Check, LocId: Integer;
begin
   LocId:=-1;
   Check := fibCheckPermission('/ROOT/SHR_Sprav/TARIF_GRID', 'Del');
   if check<>0 then
   begin
      agMessageDlg('Помилка!','Ви не маєте прав на виконання цієї дії! ',mtError,[mbOk]);
      exit;
   end;
   if HeadDSet.IsEmpty then Exit;
   if agMessageDlg('Увага!', 'Ви дійсно бажаєте вилучити цей запис?', mtConfirmation, [mbYes, mbNo])=mrYes then
   begin
      StorProc.StoredProcName:='UP_DT_TARIF_HEAD_DEL';
      StorProc.Transaction.StartTransaction;
      StorProc.Prepare;
      StorProc.ParamByName('ID_TARIF_HEAD').AsInteger:=HeadDSet['ID_TARIF_HEAD'];
      StorProc.ExecProc;
      StorProc.Transaction.Commit;
   end
   else LocId:=HeadDSet['ID_TARIF_HEAD'];
   HeadDataSetCloseOpen;
   If LocId<>-1 then HeadDSet.Locate('ID_TARIF_HEAD', LocId, []);
end;

procedure TfrmTarifGrid.HeadDSetAfterScroll(DataSet: TDataSet);
begin
   if not VarIsNull(HeadDSet['ID_TARIF_HEAD']) then IdHeadTarif:=HeadDSet['ID_TARIF_HEAD'];
   TarifDataSetCloseOpen;
end;

procedure TfrmTarifGrid.TarifGridDSetAfterScroll(DataSet: TDataSet);
begin
   if not VarIsNull(TarifGridDSet['ID_TARIF_GRID']) then IdTarifGrid:=TarifGridDSet['ID_TARIF_GRID'];
   if not VarIsNull(TarifGridDSet['DATE_END']) then ActDate:=TarifGridDSet['DATE_END'];
   if not VarIsNull(TarifGridDSet['SUMM_STAV']) then SumStav:=TarifGridDSet['SUMM_STAV'];
   if not VarIsNull(TarifGridDSet['RATE_FIRST_CATEGORY']) then RateFirstCategory:=TarifGridDSet['RATE_FIRST_CATEGORY'];
   CategoryDataSetCloseOpen;
end;

procedure TfrmTarifGrid.GridHeadTVKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    If (( Key = VK_F12) and (ssShift in Shift)) Then ShowInfo(HeadDSet);
    if Key=VK_INSERT Then ActHeadInsExecute(Sender);
    if Key=VK_F2 then ActHeadEditExecute(Sender);
    If Key=VK_DELETE then ActHeadDelExecute(Sender);
    If Key=VK_F5 Then ActHeadRefExecute(Sender);
end;

procedure TfrmTarifGrid.GridCategoryTVKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   If (( Key = VK_F12) and (ssShift in Shift)) Then ShowInfo(CatTarifDSet);
   if Key=VK_INSERT Then InsActCatExecute(Sender);
   if Key=VK_F2 then ModifyActCatExecute(Sender);
   If Key=VK_DELETE then DelActCatExecute(Sender);
   If Key=VK_F5 Then RefreshActCatExecute(Sender);
end;

end.
