unit MinCategoryMain;

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
  TfrmMinCategory = class(TForm)
    MinCatGrid: TcxGrid;
    MinCatGridDBTView: TcxGridDBTableView;
    MinCatGridDBTViewDBColumn3: TcxGridDBColumn;
    MinCatGridDBTViewDBColumn2: TcxGridDBColumn;
    MinCatGridLevel: TcxGridLevel;
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
    MinCatDSet: TpFIBDataSet;
    MinCatDS: TDataSource;
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
    MinCatGridDBTViewDBColumn1: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure InsActExecute(Sender: TObject);
    procedure RefreshActExecute(Sender: TObject);
    procedure ModifyActExecute(Sender: TObject);
    procedure DelActExecute(Sender: TObject);
    procedure CloseActExecute(Sender: TObject);
    procedure MinCatGridDBTViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
     IdTarifGrid:Integer;
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent; IdTarif:Integer);
    procedure MinCatDSetCloseOpen;
  end;

var
  frmMinCategory: TfrmMinCategory;

implementation

uses MinCategoryAdd, uFControl, cxCalc;

{$R *.dfm}

constructor TfrmMinCategory.Create(AOwner:TComponent; IdTarif:Integer);
begin
   inherited Create(AOwner);
   IdTarifGrid:=IdTarif;
end;

procedure TfrmMinCategory.MinCatDSetCloseOpen;
begin
  try
    MinCatDSet.Close;
    MinCatDSet.SQLs.SelectSQL.Text:='select distinct * from SP_MIN_CATEGORY_SEL';
    MinCatDSet.Open;
   except on e:Exception
          do ShowMessage(e.Message);
   end;
end;

procedure TfrmMinCategory.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then Action:=caFree;
end;

procedure TfrmMinCategory.InsActExecute(Sender: TObject);
var Id, Check:Integer;
    frm:TfrmMinCatAdd;
begin
   {Check := fibCheckPermission('/ROOT/SHR_Sprav/CATEG_TARIF_GRID', 'Add');
   if check<>0 then
   begin
      agMessageDlg('Помилка!','Ви не маєте прав на виконання цієї дії! ',mtError,[mbOk]);
      exit;
   end;  }
   frm:=TfrmMinCatAdd.Create(Self, False);
   frm.Caption:='Додати';
   if frm.ShowModal=mrOk then
   begin
      StorProc.StoredProcName:='SP_MIN_CATEGORY_INS';
      StorProc.Transaction.StartTransaction;
      StorProc.Prepare;
      StorProc.ParamByName('MIN_VALUE').AsFloat:=StrToFloat(frm.cMinValue.Text);
      StorProc.ParamByName('DATE_BEG').AsDate:=frm.CatDateBeg.Date;
      StorProc.ParamByName('DATE_END').AsDate:=frm.CatDateEnd.Date;
      try
        StorProc.ExecProc;
        id:=StorProc.FieldByName('ID_MIN_CAT').AsInteger;
        StorProc.Transaction.Commit;
      except on E:Exception
             do begin
                   ShowMessage(E.Message);
                   StorProc.Transaction.Rollback;
                end;
      end;
      MinCatDSetCloseOpen;
      MinCatDSet.Locate('ID_MIN_CAT', Id, []);
   end;
   frm.Free;
end;

procedure TfrmMinCategory.RefreshActExecute(Sender: TObject);
begin
   MinCatDSetCloseOpen;
end;

procedure TfrmMinCategory.ModifyActExecute(Sender: TObject);
var Id, Check:Integer;
    frm:TfrmMinCatAdd;
begin
  { Check := fibCheckPermission('/ROOT/SHR_Sprav/CATEG_TARIF_GRID', 'Edit');
   if check<>0 then
   begin
      agMessageDlg('Помилка!','Ви не маєте прав на виконання цієї дії! ',mtError,[mbOk]);
      exit;
   end;   }

   If MinCatDSet.IsEmpty then
   begin
     agMessageDlg('Увага!', 'Немає інформації для змін!', mtInformation, [mbOK]);
     Exit;
   end;

   frm:=TfrmMinCatAdd.Create(Self, True);
   frm.Caption:='Змінити';
   Id:=MinCatDSet['ID_MIN_CAT'];
   if VarIsNull(MinCatDSet['MIN_VALUE']) then
      frm.cMinValue.Text:='0'
   else
      frm.cMinValue.Text:=FloatToStr(MinCatDSet['MIN_VALUE']);
   If VarIsNull(MinCatDSet['DATE_BEG']) then
      frm.CatDateBeg.Date:=0
   else
      frm.CatDateBeg.Date:=MinCatDSet['DATE_BEG'];
   If VarIsNull(MinCatDSet['DATE_END']) then
      frm.CatDateEnd.Date:=0
   else
      frm.CatDateEnd.Date:=MinCatDSet['DATE_END'];

   if frm.ShowModal=mrOk then
   begin
      StorProc.StoredProcName:='SP_MIN_CATEGORY_UPD';
      StorProc.Transaction.StartTransaction;
      StorProc.Prepare;
      StorProc.ParamByName('ID_MIN_CAT').AsInteger:=Id;
      StorProc.ParamByName('MIN_VALUE').AsFloat:=StrToFloat(frm.cMinValue.Text);
      StorProc.ParamByName('DATE_BEG').AsDate:=frm.CatDateBeg.Date;
      StorProc.ParamByName('DATE_END').AsDate:=frm.CatDateEnd.Date;
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
   MinCatDSetCloseOpen;
   MinCatDSet.Locate('ID_MIN_CAT', Id, []);
   frm.Free;
end;

procedure TfrmMinCategory.DelActExecute(Sender: TObject);
Var Check: Integer;
begin
   {Check := fibCheckPermission('/ROOT/SHR_Sprav/CATEG_TARIF_GRID', 'Del');
   if check<>0 then
   begin
      agMessageDlg('Помилка!','Ви не маєте прав на виконання цієї дії! ',mtError,[mbOk]);
      exit;
   end; }
   if MinCatDSet.IsEmpty then Exit;
   if agMessageDlg('Увага!', 'Ви дійсно бажаєте вилучити цей запис?', mtConfirmation, [mbYes, mbNo])=mrYes then
   begin
      StorProc.StoredProcName:='SP_MIN_CATEGORY_DEL';
      StorProc.Transaction.StartTransaction;
      StorProc.Prepare;
      StorProc.ParamByName('ID_MIN_CAT').AsInteger:=MinCatDSet['ID_MIN_CAT'];
      StorProc.ExecProc;
      StorProc.Transaction.Commit;
   end;
   MinCatDSetCloseOpen;
end;

procedure TfrmMinCategory.CloseActExecute(Sender: TObject);
begin
   Close;
end;


procedure TfrmMinCategory.MinCatGridDBTViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   If (( Key = VK_F12) and (ssShift in Shift)) Then ShowInfo(MinCatDSet);
end;

end.
