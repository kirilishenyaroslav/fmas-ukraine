unit Sp_VidOplPropUse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxControls,
  cxGridCustomView, cxGrid, cxClasses, dxBar, dxBarExtItems, FIBQuery,
  pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet, ibase, ZProc, Unit_ZGlobal_Consts, dxStatusBar,
  ZMessages, SpVidOplPropControl;

type
  TFZVidOplPropUse = class(TForm)
    Styles: TcxStyleRepository;
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
    Grid1DBTableView1: TcxGridDBTableView;
    Grid1Level1: TcxGridLevel;
    Grid1: TcxGrid;
    Grid1DBTableView1DBDateBeg: TcxGridDBColumn;
    Grid1DBTableView1DBDateEnd: TcxGridDBColumn;
    DSource: TDataSource;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    DSet: TpFIBDataSet;
    DB: TpFIBDatabase;
    StoredProc: TpFIBStoredProc;
    StatusBar: TdxStatusBar;
    BarManager: TdxBarManager;
    SelectBtn: TdxBarLargeButton;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    InsertBtn: TdxBarLargeButton;
    DeleteBtn: TdxBarLargeButton;
    UpdateBtn: TdxBarLargeButton;
    UpdateAllBtn: TdxBarLargeButton;
    SpravGroupVidOplBtn: TdxBarButton;
    SpravPropVidOplBtn: TdxBarButton;
    SpravGroupVidOplPropBtn: TdxBarButton;
    LocateBtn: TdxBarLargeButton;
    PropertiesBtn: TdxBarLargeButton;
    procedure FormResize(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure InsertBtnClick(Sender: TObject);
    procedure UpdateBtnClick(Sender: TObject);
  private
    Ins_Result: Variant;
    PLanguageIndex:byte;
    IdVidOpl:integer;
    VidOplProp:integer;
  public
     constructor Create(ComeComponent:TComponent;ComeDB:TISC_DB_HANDLE;InIdVidOpl:integer;InVidOplProp:integer);reintroduce;
  end;

implementation

const ZVidOplPropUse_Caption   :array[1..2] of string = ('Періоди актуальності властивостей видів оплат',
                                                         'Периоды актуальности свойств видов оплат');
const ZVidOplPropControl_Caption_Update   :array[1..2] of string = ('Редагування періоду актуальності властивості видів оплат',
                                                         'Редактирование периода актуальности свойства видов оплат');
const ZVidOplPropControl_Caption_Insert   :array[1..2] of string = ('Додавання періоду актуальності властивості видів оплат',
                                                         'Добавления периода актуальности свойства видов оплат');
const Cant_Add_Period          :array[1..2] of string = ('Неможливо додати період','Невозможно добавить период');

{$R *.dfm}

constructor TFZVidOplPropUse.Create(ComeComponent:TComponent;ComeDB:TISC_DB_HANDLE;InIdVidOpl:integer;InVidOplProp:integer);
begin
 inherited Create(ComeComponent);
 PLanguageIndex:=LanguageIndex;
 IdVidOpl:=InIdVidOpl;
 VidOplProp:=InVidOplProp;

   self.FormStyle         := fsNormal;
   self.BorderStyle       := bsDialog;
   self.Position          := poOwnerFormCenter;
   StatusBar.Panels[0].Text := RefreshBtn_Hint[PLanguageIndex];
   StatusBar.Panels[1].Text := InsertBtn_Hint[PLanguageIndex];
   StatusBar.Panels[2].Text := UpdateBtn_Hint[PLanguageIndex];
   StatusBar.Panels[3].Text := DeleteBtn_Hint[PLanguageIndex];
   StatusBar.Panels[4].Text := ExitBtn_Hint[PLanguageIndex];

Ins_Result := VarArrayCreate([0,2],varVariant);

self.Caption     := ZVidOplPropUse_Caption[PLanguageIndex];

self.Grid1DBTableView1DBDateBeg.Caption  := LabelDateBeg_Caption[PLanguageIndex];
self.Grid1DBTableView1DBDateEnd.Caption  := LabelDateEnd_Caption[PLanguageIndex];

self.RefreshBtn.Caption                  := RefreshBtn_Caption[PLanguageIndex];
self.InsertBtn.Caption                   := InsertBtn_Caption[PLanguageIndex];
self.UpdateBtn.Caption                   := UpdateBtn_Caption[PLanguageIndex];
self.DeleteBtn.Caption                   := DeleteBtn_Caption[PLanguageIndex];
self.SelectBtn.Caption                   := SelectBtn_Caption[PLanguageIndex];
self.ExitBtn.Caption                     := ExitBtn_Caption[PLanguageIndex];;

DB.Handle := ComeDB;
Grid1DBTableView1.DataController.DataSource:=DSource;
DSet.SQLs.SelectSQL.Text := 'SELECT * FROM Z_VIDOPL_PROPERTIES_S(null,'+IntToStr(IdVidOpl)+','+IntToStr(VidOplProp)+')';
DSet.Open;

FormResize(Self);
end;

procedure TFZVidOplPropUse.FormResize(Sender: TObject);
var i:byte;
begin
if StatusBar.Panels.Count=0 then Exit;
 for i:=0 to StatusBar.Panels.Count-1 do
  StatusBar.Panels[i].Width := StatusBar.Width div StatusBar.Panels.Count;
end;

procedure TFZVidOplPropUse.ExitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TFZVidOplPropUse.RefreshBtnClick(Sender: TObject);
begin
  DSet.FullRefresh;
end;

procedure TFZVidOplPropUse.DeleteBtnClick(Sender: TObject);
begin
if ZShowMessage(Caption_Delete[PlanguageIndex],DeleteRecordQuestion_Text[PlanguageIndex],mtConfirmation,[mbYes,mbNo])=mrYes then
try
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName:='Z_VIDOPL_PROPERTIES_D';
  StoredProc.Prepare;
  StoredProc.ParamByName('IN_ID_VID_PROP').AsInteger:=DSet['ID_VID_PROP'];
  StoredProc.ExecProc;
  StoredProc.Transaction.Commit;
  DSet.RefreshSQL.Text:='SELECT * FROM Z_VIDOPL_PROPERTIES_S(null,'+IntToStr(IdVidOpl)+','+IntToStr(VidOplProp)+')';
  DSet.FullRefresh;
 except
  on E: Exception do
   begin
    ZShowMessage(Error_caption[PLanguageIndex],e.Message,mtError,[mbOK]);
    StoredProc.Transaction.Rollback;
   end;
 end;
end;

procedure TFZVidOplPropUse.InsertBtnClick(Sender: TObject);
var
  IdVidProp: integer;
  Form: TZFVidOplPropControl;
begin
  Form:=TZFVidOplPropControl.Create(self,DB.Handle);
    Form.Caption:=ZVidOplPropControl_Caption_Insert[PLanguageIndex];
  if Form.ShowModal=mrYes then
  try
    StoredProc.Transaction.StartTransaction;
    StoredProc.StoredProcName:='Z_VIDOPL_PROPERTIES_I';
    StoredProc.Prepare;
    StoredProc.ParamByName('ID_VIDOPL').AsInteger:=IdVidOpl;
    StoredProc.ParamByName('ID_VIDOPL_PROP').AsInteger:=VidOplProp;
    StoredProc.ParamByName('DATE_BEG').AsDateTime:=Form.Ins_Result[0];
    StoredProc.ParamByName('DATE_END').AsDateTime:=Form.Ins_Result[1];
    StoredProc.ExecProc;
    IdVidProp:=StoredProc.ParamByName('ID_VID_PROP').AsInteger;
    StoredProc.Transaction.Commit;
    DSet.RefreshSQL.Text:='SELECT * FROM Z_VIDOPL_PROPERTIES_S('+IntToStr(IdVidProp)+','+IntToStr(IdVidOpl)+','+IntToStr(VidOplProp)+')';
    DSet.FullRefresh;
  except
    on E: Exception do
    begin
      ZShowMessage(Error_caption[PLanguageIndex],e.Message,mtError,[mbOK]);
      StoredProc.Transaction.Rollback;
    end;
  end;
end;

procedure TFZVidOplPropUse.UpdateBtnClick(Sender: TObject);
var
  Form: TZFVidOplPropControl;
begin
  Form:=TZFVidOplPropControl.Create(self,DB.Handle);
  Form.Caption:=ZVidOplPropControl_Caption_Update[PLanguageIndex];
  if not VarIsNull(DSet['DATE_BEG']) then
    Form.DateBeg.Date:=VarToDateTime(DSet['DATE_BEG']);
  if not VarIsNull(DSet['DATE_END']) then
    Form.DateEnd.Date:=VarToDateTime(DSet['DATE_END']);
  if Form.ShowModal=mrYes then
  try
    StoredProc.Transaction.StartTransaction;
    StoredProc.StoredProcName:='Z_VIDOPL_PROPERTIES_U';
    StoredProc.Prepare;
    StoredProc.ParamByName('ID_VID_PROP').AsInteger:=DSet['ID_VID_PROP'];
    StoredProc.ParamByName('DATE_BEG').AsDateTime:=Form.Ins_Result[0];
    StoredProc.ParamByName('DATE_END').AsDateTime:=Form.Ins_Result[1];
    StoredProc.ExecProc;
    StoredProc.Transaction.Commit;
    DSet.RefreshSQL.Text:='SELECT * FROM Z_VIDOPL_PROPERTIES_S('+IntToStr(DSet['ID_VID_PROP'])+','+IntToStr(IdVidOpl)+','+IntToStr(VidOplProp)+')';
    DSet.FullRefresh;
  except
    on E: Exception do
    begin
      ZShowMessage(Error_caption[PLanguageIndex],e.Message,mtError,[mbOK]);
      StoredProc.Transaction.Rollback;
    end;
  end;
end;

end.
