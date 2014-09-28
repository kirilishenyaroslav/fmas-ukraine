unit uReg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxCalendar, cxInplaceContainer, cxDBTL, cxControls, cxTLData, cxClasses,
  dxBarExtItems, dxBar, ImgList, uDM, iBase, cn_Common_Funcs, cn_Common_Types,
  DB, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, uReg_Add, cnConsts, cn_Common_Messages;

type
  TfrReg = class(TForm)
    DisabledLargeImages: TImageList;
    LargeImages: TImageList;
    PopupImageList: TImageList;
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    PrintButton: TdxBarLargeButton;
    PayButton: TdxBarLargeButton;
    LgotaButton: TdxBarLargeButton;
    EntryRestButton: TdxBarLargeButton;
    HistoryButton: TdxBarLargeButton;
    FIO_BarContainer: TdxBarControlContainerItem;
    FilterExecute_Button: TdxBarButton;
    Dog_Filter_Edit: TdxBarEdit;
    GlobalFilterButton: TdxBarLargeButton;
    DsetRecordCount: TdxBarButton;
    CreditButton: TdxBarLargeButton;
    Faculty_Footer_Label: TdxBarStatic;
    Spec_Footer_Label: TdxBarStatic;
    Gragdanstvo_Footer_Label: TdxBarStatic;
    FormStudy_Footer_Label: TdxBarStatic;
    CategoryStudy_Footer_Label: TdxBarStatic;
    Kurs_Footer_Label: TdxBarStatic;
    Group_Footer_Label: TdxBarStatic;
    UpLoad_Button: TdxBarLargeButton;
    BreakDown_Button: TdxBarLargeButton;
    PayerData_Button: TdxBarButton;
    RastorgPri4ina_Button: TdxBarButton;
    dxBarStatic1: TdxBarStatic;
    Dodatki_Button: TdxBarSubItem;
    Log: TdxBarButton;
    RecoveryBtn: TdxBarButton;
    OrdersBtn: TdxBarLargeButton;
    SelectBtn: TdxBarLargeButton;
    Erased_Btn: TdxBarButton;
    NoteStatic: TdxBarStatic;
    ExportDataBtn: TdxBarButton;
    btnTwain: TdxBarLargeButton;
    dxBarStatic2: TdxBarStatic;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    Dog_status_label: TdxBarStatic;
    dxBarToolbarsListItem1: TdxBarToolbarsListItem;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    Styles: TcxStyleRepository;
    BackGround: TcxStyle;
    FocusedRecord: TcxStyle;
    Header: TcxStyle;
    DesabledRecord: TcxStyle;
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
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    cxStyle47: TcxStyle;
    cxStyle48: TcxStyle;
    cxStyle49: TcxStyle;
    cxStyle50: TcxStyle;
    cxStyle51: TcxStyle;
    cxStyle52: TcxStyle;
    cxStyle53: TcxStyle;
    cxStyle54: TcxStyle;
    cxStyle55: TcxStyle;
    cxStyle56: TcxStyle;
    cxStyle57: TcxStyle;
    testColorStyle: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    cxDBTreeList1: TcxDBTreeList;
    num_reg: TcxDBTreeListColumn;
    date_reg: TcxDBTreeListColumn;
    note: TcxDBTreeListColumn;
    DB: TpFIBDatabase;
    DataSet_Reg: TpFIBDataSet;
    Tran_Read: TpFIBTransaction;
    Tran_write: TpFIBTransaction;
    StorProc_add: TpFIBStoredProc;
    Source_Reg: TDataSource;
    constructor Create(AParameter:TcnSimpleParams); overload;
    procedure ExitButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure Refresh;
    procedure DeleteButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    PLanguageIndex: byte;
    { Public declarations }
  end;

  function ShowReg(AParameter:TcnSimpleParams):Variant;stdcall;
  exports ShowReg;

var
  frReg: TfrReg;

implementation

{$R *.dfm}
function ShowReg(AParameter:TcnSimpleParams):Variant;stdcall;
var ViewForm:TfrReg;
begin
 ViewForm := TfrReg.Create(AParameter);
 ViewForm.ShowModal;
 ViewForm.Free;
end;

Constructor TfrReg.Create(AParameter:TcnSimpleParams);
Begin
  inherited create(AParameter.Owner);
  PLanguageIndex:=cn_Common_Funcs.cnLanguageIndex();
  DB.Handle:=AParameter.Db_Handle;
  DB.Open;
  Tran_Read.StartTransaction;
  Refresh;
End;

Procedure TfrReg.Refresh;
Begin
  DataSet_Reg.Close;
  DataSet_Reg.SQLs.SelectSQL.Text:='select * from cn_dt_dog_reestr';
  DataSet_Reg.Open;
End;

procedure TfrReg.ExitButtonClick(Sender: TObject);
begin
 close;
end;

procedure TfrReg.AddButtonClick(Sender: TObject);
Var
  T:TfrReg_Add;
begin
  T:=TfrReg_Add.create(self);
  T.PLanguageIndex:=PLanguageIndex;
  T.Caption:='Добавить в реестр';
  T.showModal;
  If T.ModalResult=mrOk then Refresh;
  T.Free;
end;

procedure TfrReg.DeleteButtonClick(Sender: TObject);
var
  i:integer;
begin
{  If not Is_Admin then
    If fibCheckPermission('/ROOT/Contracts/Cn_Reg','Del') <> 0
     then
       Begin
        messagebox(handle,
        pchar(cnConsts_Messages.cn_NotHaveRights[PLanguageIndex]
        +#13+ cnConsts_Messages.cn_GoToAdmin[PLanguageIndex]),
        pchar(cnConsts_Messages.cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
        exit;
       End;}
  if cxDBTreeList1.DataController.RecordCount = 0 then exit;
  i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts.cn_DeletePromt[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit;

  Tran_write.StartTransaction;
  StorProc_add.StoredProcName:='CN_DT_DOG_REESTR_DEL';
  StorProc_add.Prepare;
  StorProc_add.ParamByName('ID_REESTR').AsInt64:=DataSet_Reg['ID_REESTR'];
  StorProc_add.ExecProc;
  Try
   Tran_write.Commit;
   StorProc_add.Close;
  except
   Tran_write.Rollback;
   StorProc_add.Close;
  End;
  Refresh; 
end;

procedure TfrReg.EditButtonClick(Sender: TObject);
Var
  T:TfrReg_Add;
begin
  T:=TfrReg_Add.create(self);
  T.Caption:='Просмотр реестра '+DataSet_Reg['NUM_REESTR']+' от '+DateToStr(DataSet_Reg['DATE_REESTR']);
  T.Dog_Filter_Edit.Enabled:=false;
  T.PLanguageIndex:=PLanguageIndex;
  T.cxButtonOneToList.Enabled:=false;
  T.cxButtonAllToList.Enabled:=false;
  T.cxButtonOneInList.Enabled:=false;
  T.cxButtonAllInList.Enabled:=false;
  T.cxButtonSave.Enabled:=False;
  T.Id_reestr:=DataSet_Reg['ID_REESTR'];
  T.showModal;
  T.Free;
end;

end.
