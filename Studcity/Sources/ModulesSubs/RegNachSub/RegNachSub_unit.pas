unit RegNachSub_unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, dxStatusBar, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, FIBDataSet, pFIBDataSet, FIBQuery,
  pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, dxBar, ImgList,
  ActnList, dxBarExtItems, iBase, AccMGMT, st_ConstUnit, st_Proc;

type
  TFormRegNachSub = class(TForm)
    HotKey_StatusBar: TdxStatusBar;
    DataSource: TDataSource;
    dxBarManager1: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    SelectButton: TdxBarLargeButton;
    ViewButton: TdxBarLargeButton;
    AddRoomButton: TdxBarLargeButton;
    DeleteRoomButton: TdxBarLargeButton;
    EditRoomButton: TdxBarLargeButton;
    AddRoomButton2: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    Search_Button: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    ActionList1: TActionList;
    AddAction: TAction;
    EditAction: TAction;
    DeleteAction: TAction;
    RefreshAction: TAction;
    ExitAction: TAction;
    ViewAction: TAction;
    LargeImages: TImageList;
    DisabledLargeImages: TImageList;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    PopupMenu1: TdxBarPopupMenu;
    PopupImageList: TImageList;
    DataBase: TpFIBDatabase;
    WriteProc: TpFIBStoredProc;
    DataSet: TpFIBDataSet;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1Date_deg: TcxGridDBColumn;
    cxGrid1Date_End: TcxGridDBColumn;
    cxGrid1Summa: TcxGridDBColumn;
    DataSetID_SMSUB: TFIBBCDField;
    DataSetDATE_BEG: TFIBDateField;
    DataSetDATE_END: TFIBDateField;
    DataSetSUMMA: TFIBBCDField;
    DataSetNOTE: TFIBStringField;
    WriteTransaction: TpFIBTransaction;
    procedure ExitActionExecute(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure ViewButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
  private
    Constructor Create(AOwner : TComponent;DB:TISC_DB_HANDLE);//overload;
    { Private declarations }
  public
    New_id_SmSub:integer;
    PLanguageIndex:integer;
    { Public declarations }
  end;

function LoadReestrSuds(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;stdcall;
exports LoadReestrSuds;

var
  FormRegNachSub: TFormRegNachSub;
  SummaSub:integer; //сумма из отдела субсидий
  PropSpisok:Boolean; //тип начислений пропорционально (true), списком (false)
  DateBeg,DateEnd:TDateTime;

implementation

Uses FormAdd, cxCalendar, FormSpNAchSub;
{$R *.dfm}

function LoadReestrSuds(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;
var
  Subs:TFormRegNachSub;
begin
  Subs:=TFormRegNachSub.Create(AOwner,DB);
  Subs.ShowModal;
  Subs.Free;
end;


Constructor TFormRegNachSub.Create(AOwner : TComponent;DB:TISC_DB_HANDLE);
begin
  Inherited Create(AOwner);
  Database.Handle:=DB;
  Database.Connected:=True;
  Dataset.close;
  Dataset.open;
  PLanguageIndex:=st_proc.cnLanguageIndex;
  {button.language}
  AddButton.Caption:=st_InsertBtn_Caption[PLanguageIndex];
  ViewButton.Caption:=st_ViewBtn_Caption[PLanguageIndex];
  DeleteButton.Caption:=st_DeleteBtn_Caption[PLanguageIndex];
  RefreshButton.Caption:=st_RefreshBtn_Caption[PLanguageIndex];
  ExitButton.Caption:=st_ExitBtn_Caption[PLanguageIndex];
end;

procedure TFormRegNachSub.ExitActionExecute(Sender: TObject);
begin
 close;
end;
//Добавление
procedure TFormRegNachSub.AddButtonClick(Sender: TObject);
Var
 T:TFormRegNachSubAdd;
 new_id:integer;
begin
if fibCheckPermission('/ROOT/Studcity/Sp_OplSub','ADD') <> 0 then
 begin
  messagebox(handle,
  pchar(st_ConstUnit.st_NotHaveRights[PLanguageIndex]
  +#13+ st_ConstUnit.st_GoToAdmin[PLanguageIndex]),
  pchar(st_ConstUnit.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
  exit;
 end;

 T:=TFormRegNachSubAdd.Create(self);
 T.ShowModal;
 If T.ModalResult=mrOk then
  Begin
   WriteProc.StoredProcName:='ST_DT_SPSMPFSUB';
   WriteProc.Transaction.StartTransaction;
   WriteProc.Prepare;
   WriteProc.ParamByName('DATE_BEG').AsDateTime     :=StrToDateTime(T.cxDateEdit1.EditValue);
   WriteProc.ParamByName('DATE_END').AsDateTime     :=StrToDateTime(T.cxDateEdit2.EditValue);
   WriteProc.ParamByName('SUMMA_SUB').AsInteger :=T.cxCalcEdit1.EditValue;
   If T.Prop.Checked
    Then WriteProc.ParamByName('PROP').AsInteger      :=1
    Else WriteProc.ParamByName('PROP').AsInteger      :=0;
   WriteProc.ParamByName('NOTE').AsString       :='Запись прошла';
   WriteProc.ExecProc;
   New_id:=WriteProc['NEW_ID_SMSUB'].AsInteger;
   try
    WriteProc.Transaction.Commit;
    WriteProc.Close;
   Except
    WriteProc.Transaction.Rollback;
    WriteProc.Close;
    Raise;
   End;
   DataSet.Close;
   DataSet.Open;
   DataSet.Locate('id_smsub', new_id, []);
  End;
 T.Free;
end;

procedure TFormRegNachSub.ViewButtonClick(Sender: TObject);
Var
 T:TFormRegNachSubAdd;
begin
 T:=TFormRegNachSubAdd.Create(self);
 T.Caption:='Просмотр';
 T.okButton.Enabled:=false;
 T.cxDateEdit1.Date:=DataSetDATE_BEG.AsDateTime;
 T.cxDateEdit2.Date:=DataSetDATE_END.AsDateTime;
 T.cxCalcEdit1.Value:=DataSetSUMMA.AsInteger;
 T.ShowModal;
 T.Free;
end;

procedure TFormRegNachSub.RefreshButtonClick(Sender: TObject);
begin
 DataSet.Close;
 DataSet.Open;
end;

procedure TFormRegNachSub.cxGrid1DBTableView1DblClick(Sender: TObject);
Var
 T:TSpNachSub;
begin
 New_id_SmSub:=DataSetID_SMSUB.AsInteger;
 T:=TSpNachSub.Create(self,new_id_smsub);
 T.ShowModal;
 T.Free;
end;

procedure TFormRegNachSub.DeleteButtonClick(Sender: TObject);
begin
 if fibCheckPermission('/ROOT/Studcity/Sp_OplSub','Del') <> 0 then
 begin
  messagebox(handle,
  pchar(st_ConstUnit.st_NotHaveRights[PLanguageIndex]
  +#13+ st_ConstUnit.st_GoToAdmin[PLanguageIndex]),
  pchar(st_ConstUnit.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
  exit;
 end;
 if MessageBox(Handle,PChar('Вы действительно хотите удалить запись ?'),'Подтверждение удаления ...',MB_YESNO or MB_ICONQUESTION)= mrNo then exit;
 new_id_SmSub:=DataSetID_SMSUB.AsInteger;
 WriteProc.StoredProcName:='ST_DT_SMSPSUB_DELETE';
 WriteProc.Transaction.StartTransaction;
 WriteProc.Prepare;
 WriteProc.ParamByName('ID_SMSUB').AsInteger:=New_id_SmSub;
 WriteProc.ExecProc;
 try
  WriteProc.Transaction.Commit;
  WriteProc.Close;
 Except
  WriteProc.Transaction.Rollback;
  WriteProc.Close;
  Raise;
 End;
 DataSet.Close;
 DataSet.Open;
end;

end.
