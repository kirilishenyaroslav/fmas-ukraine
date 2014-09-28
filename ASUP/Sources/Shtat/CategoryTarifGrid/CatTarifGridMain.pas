unit CatTarifGridMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxCheckBox,
  cxGridTableView, cxGridLevel, cxGridCustomTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, ActnList, FIBQuery,
  pFIBQuery, pFIBStoredProc, FIBDataSet, pFIBDataSet, FIBDatabase,
  pFIBDatabase, dxBar, dxBarExtItems, ImgList, Basetypes, ibase, uCommonSp,
  uUnivSprav, AccMgmt;

type
  TfrmCatTarifGrid = class(TForm)
    TarifGrid: TcxGrid;
    TarifGridDBTView: TcxGridDBTableView;
    TarifGridDBTViewDBColumn3: TcxGridDBColumn;
    TarifGridDBTViewDBColumn2: TcxGridDBColumn;
    TarifGridDBTViewDBColumn4: TcxGridDBColumn;
    TarifGridLevel: TcxGridLevel;
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
    WDBase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    CatTarifGridDSet: TpFIBDataSet;
    CatTarifGridDS: TDataSource;
    StorProc: TpFIBStoredProc;
    ActionList1: TActionList;
    InsAct: TAction;
    ModifyAct: TAction;
    DelAct: TAction;
    RefreshAct: TAction;
    CloseAct: TAction;
    BarManager: TdxBarManager;
    btnAdd: TdxBarLargeButton;
    btnEdit: TdxBarLargeButton;
    btnDelete: TdxBarLargeButton;
    btnClose: TdxBarLargeButton;
    btnRefresh: TdxBarLargeButton;
    btnSearch: TdxBarLargeButton;
    ImageList: TImageList;
    TarifGridDBTViewDBColumn1: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure InsActExecute(Sender: TObject);
    procedure RefreshActExecute(Sender: TObject);
    procedure ModifyActExecute(Sender: TObject);
    procedure DelActExecute(Sender: TObject);
    procedure CloseActExecute(Sender: TObject);
    procedure TarifGridDBTViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
     IdTarifGrid:Integer;
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent; IdTarif:Integer);
    procedure CatTarifDSetCloseOpen;
  end;

var
  frmCatTarifGrid: TfrmCatTarifGrid;

implementation

uses CatTarifGridAdd, uFControl;

{$R *.dfm}

constructor TfrmCatTarifGrid.Create(AOwner:TComponent; IdTarif:Integer);
begin
   inherited Create(AOwner);
   IdTarifGrid:=IdTarif;
end;

procedure TfrmCatTarifGrid.CatTarifDSetCloseOpen;
begin
  try
    CatTarifGridDSet.Close;
    CatTarifGridDSet.SQLs.SelectSQL.Text:='select distinct * from up_category_tarif_grid_sel(:id)';
    CatTarifGridDSet.ParamByName('id').AsInteger:=IdTarifGrid;
    CatTarifGridDSet.Open;
   except on e:Exception
          do ShowMessage(e.Message);
   end;
end;

procedure TfrmCatTarifGrid.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then Action:=caFree;
end;

procedure TfrmCatTarifGrid.InsActExecute(Sender: TObject);
var Id, Check:Integer;
    frm:TfrmCatTarifGridAdd;
begin
   Check := fibCheckPermission('/ROOT/SHR_Sprav/CATEG_TARIF_GRID', 'Add');
   if check<>0 then
   begin
      agMessageDlg('Помилка!','Ви не маєте прав на виконання цієї дії! ',mtError,[mbOk]);
      exit;
   end;
   frm:=TfrmCatTarifGridAdd.Create(Self, False);
   frm.Caption:='Додати розряд';
   if frm.ShowModal=mrOk then
   begin
      StorProc.StoredProcName:='UP_CATEGORY_TARIF_GRID_INS';
      StorProc.Transaction.StartTransaction;
      StorProc.Prepare;
      StorProc.ParamByName('ID_TARIF_GRID').AsInteger:=IdTarifGrid;
      StorProc.ParamByName('NUM_CATEGORY').AsInteger:=frm.CategoryEdit.Value;
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
      CatTarifDSetCloseOpen;
      CatTarifGridDSet.Locate('ID_CAT_TARIF_GRID', Id, []);
   end;
   frm.Free;
end;

procedure TfrmCatTarifGrid.RefreshActExecute(Sender: TObject);
begin
   CatTarifDSetCloseOpen;
end;

procedure TfrmCatTarifGrid.ModifyActExecute(Sender: TObject);
var Id, Check:Integer;
    frm:TfrmCatTarifGridAdd;
begin
   Check := fibCheckPermission('/ROOT/SHR_Sprav/CATEG_TARIF_GRID', 'Edit');
   if check<>0 then
   begin
      agMessageDlg('Помилка!','Ви не маєте прав на виконання цієї дії! ',mtError,[mbOk]);
      exit;
   end;

   If CatTarifGridDSet.IsEmpty then
   begin
     agMessageDlg('Увага!', 'Немає інформації для змін!', mtInformation, [mbOK]);
     Exit;
   end;

   frm:=TfrmCatTarifGridAdd.Create(Self, False);
   frm.Caption:='Змінити розряд';
   Id:=CatTarifGridDSet['ID_CAT_TARIF_GRID'];
   if VarIsNull(CatTarifGridDSet['NOTE']) then
      frm.CatNote.Text:=''
   else
      frm.CatNote.Text:=CatTarifGridDSet['NOTE'];
   If VarIsNull(CatTarifGridDSet['NUM_CATEGORY']) then
      frm.CategoryEdit.Value:=0
   else
      frm.CategoryEdit.Value:=CatTarifGridDSet['NUM_CATEGORY'];
   If VarIsNull(CatTarifGridDSet['KOEFF_FIRST_CATEGORY']) then
      frm.CatKoeff.Value:=0
   else
      frm.CatKoeff.Value:=CatTarifGridDSet['KOEFF_FIRST_CATEGORY'];

   if frm.ShowModal=mrOk then
   begin
      StorProc.StoredProcName:='UP_CATEGORY_TARIF_GRID_UPD';
      StorProc.Transaction.StartTransaction;
      StorProc.Prepare;
      StorProc.ParamByName('ID_CAT_TARIF_GRID').AsInteger:=Id;
      StorProc.ParamByName('ID_TARIF_GRID').AsInteger:=IdTarifGrid;
      StorProc.ParamByName('NUM_CATEGORY').AsInteger:=frm.CategoryEdit.Value;
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
   CatTarifDSetCloseOpen;
   CatTarifGridDSet.Locate('ID_CAT_TARIF_GRID', Id, []);
   frm.Free;
end;

procedure TfrmCatTarifGrid.DelActExecute(Sender: TObject);
Var Check: Integer;
begin
   Check := fibCheckPermission('/ROOT/SHR_Sprav/CATEG_TARIF_GRID', 'Del');
   if check<>0 then
   begin
      agMessageDlg('Помилка!','Ви не маєте прав на виконання цієї дії! ',mtError,[mbOk]);
      exit;
   end;
   if CatTarifGridDSet.IsEmpty then Exit;
   if agMessageDlg('Увага!', 'Ви дійсно бажаєте вилучити цей запис?', mtConfirmation, [mbYes, mbNo])=mrYes then
   begin
      StorProc.StoredProcName:='UP_CATEGORY_TARIF_GRID_DEL';
      StorProc.Transaction.StartTransaction;
      StorProc.Prepare;
      StorProc.ParamByName('ID_CAT_TARIF_GRID').AsInteger:=CatTarifGridDSet['ID_CAT_TARIF_GRID'];
      StorProc.ExecProc;
      StorProc.Transaction.Commit;
   end;
   CatTarifDSetCloseOpen;
end;

procedure TfrmCatTarifGrid.CloseActExecute(Sender: TObject);
begin
   Close;
end;


procedure TfrmCatTarifGrid.TarifGridDBTViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   If (( Key = VK_F12) and (ssShift in Shift)) Then ShowInfo(CatTarifGridDSet);
end;

end.
