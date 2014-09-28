unit MainFormSprTypeDog;
{*******************************************************************************
* MainFormSprTypeDog                                                           *
*                                                                              *
* Справочник типов договоров                                                   *
* Copyright ©  2004, Бурмистрова Е.                                            *
*******************************************************************************}

interface

uses
  Registry,Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, iBase, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ToolWin, ComCtrls, FIBDataSet, pFIBDataSet,
  ImgList, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery,
  pFIBStoredProc, ActnList, Menus,  LoadDogManedger, cxCalc, Grids, DBGrids,
  cxTextEdit, cxCheckBox, dxBarExtItems, dxBar, cxTL, Kernel, StdCtrls,
  ExtCtrls, dogLangPackUnit2, Accmgmt, DogLoaderUnit ,
  cxMaskEdit, dxStatusBar;
  //WSUnit, 
resourcestring
    errTipDogNotNumber = 'Тип договору повинен бути числом!';
    errTipDogExists = 'Такий тип договору вже є!';
    errTipDogProgNameEmpty = 'Поле "Назва пакету" не заповнено!';
    errTipDogShortNameEmpty = 'Поле "Скорочена назва" не заповнено!';
    errTipDogNameEmpty = 'Поле "Назва" не заповнено!';
    errTipDogActiveEmpty = 'Поле "Активність" не заповнено!';
    errTipDogDatabase = 'Не вдалося занести запис до бази даних';
    askTipDogDelete = 'Ви справді бажаєте вилучити цей тип договору?';


type
  TfrmTypeDog = class(TForm)
    ImageList1: TImageList;
    DataSource: TDataSource;
    pFIBDataSet_type_dog: TpFIBDataSet;
    pFIBDatabase: TpFIBDatabase;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBTransactionWrite: TpFIBTransaction;
    ActionList: TActionList;
    PopupMenu: TPopupMenu;
    add: TAction;
    red: TAction;
    del: TAction;
    up: TAction;
    cl: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    pFIBStoredProc_tip_dog: TpFIBStoredProc;
    prosmotr: TAction;
    dxBarManager1: TdxBarManager;
    dxBarButton1: TdxBarButton;
    dxBarLargeButton_add: TdxBarLargeButton;
    dxBarLargeButton_red: TdxBarLargeButton;
    dxBarLargeButton_del: TdxBarLargeButton;
    dxBarLargeButton_pr: TdxBarLargeButton;
    dxBarLargeButton_upd: TdxBarLargeButton;
    dxBarLargeButton_get: TdxBarLargeButton;
    dxBarLargeButton_get_group_doc: TdxBarLargeButton;
    dxBarLargeButton_close: TdxBarLargeButton;
    DisabledLargeImages: TImageList;
    LargeImages: TImageList;
    dxBarButton2: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    BottomPanel: TPanel;
    SearchEdit: TEdit;
    Label1: TLabel;
    pFIBDataSet_spr: TpFIBDataSet;
    pFIBTransaction_lock: TpFIBTransaction;
    dxStatusBar1: TdxStatusBar;
    cxStyleRepository2: TcxStyleRepository;
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
    cxStyle58: TcxStyle;
    cxStyle59: TcxStyle;
    cxStyle60: TcxStyle;
    cxStyle61: TcxStyle;
    cxStyle62: TcxStyle;
    cxStyle63: TcxStyle;
    cxStyle64: TcxStyle;
    cxStyle65: TcxStyle;
    cxStyle66: TcxStyle;
    cxStyle67: TcxStyle;
    cxStyle68: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure addExecute(Sender: TObject);
    procedure redExecute(Sender: TObject);
    procedure delExecute(Sender: TObject);
    procedure upExecute(Sender: TObject);
    procedure clExecute(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure prosmotrExecute(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure cxGrid1DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure dxBarLargeButton_addClick(Sender: TObject);
    procedure dxBarLargeButton_redClick(Sender: TObject);
    procedure dxBarLargeButton_delClick(Sender: TObject);
    procedure dxBarLargeButton_prClick(Sender: TObject);
    procedure dxBarLargeButton_updClick(Sender: TObject);
    procedure dxBarLargeButton_getClick(Sender: TObject);
    procedure dxBarLargeButton_get_group_docClick(Sender: TObject);
    procedure dxBarLargeButton_closeClick(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SearchEditChange(Sender: TObject);
    procedure cxGrid1DBTableView1KeyPress(Sender: TObject; var Key: Char);
    procedure SearchEditKeyPress(Sender: TObject; var Key: Char);
    procedure SearchEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
   fResProc : TResProc;
   inputdata : PShablonInputData;
  public
   perem_get_param:String;
   procedure TipDogId(id_t_dog: Variant);
   constructor Create (Aowner:TComponent;DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle;Get_param:String; Group: Variant; const data: PShablonInputData); overload;
   procedure CloseForm();
  end;

  function WorkTypeDogSPR(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle; Get_param:String; ResProc : TResProc; Group: Variant; const data: PShablonInputData):Variant; stdcall;
  exports WorkTypeDogSPR;

var
  frmTypeDog: TfrmTypeDog;
  td: Integer;
  Res:Variant;
  Res_name: String;
  id_tip_dog: Variant; // id для позиционирования при добавлении

implementation
uses
  SprTypeDogEdit;

{$R *.dfm}

constructor TfrmTypeDog.Create (Aowner:TComponent;DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle;Get_param:String; Group: Variant; const data: PShablonInputData);
var
  s: String;
begin
  inherited Create (Aowner);
  inputdata := data;
  pFIBDatabase.Handle := DBHANDLE;
  FormStyle := frmStyle;
  perem_get_param := Get_param;
//  ShowMessage(IntToStr(SYS_ID_USER));
//  ShowMessage(IntToStr(Group));
    if get_param = 'select' then //вызов из фильтра
      begin
        pFIBDataSet_type_dog.Database := pFIBDatabase;
        pFIBDataSet_type_dog.Transaction := pFIBTransactionRead;
        pFIBDataSet_type_dog.Active := false;
        pFIBDataSet_type_dog.ParamByName('groupp').Value:=Group;
        pFIBDataSet_type_dog.ParamByName('id_user').Value:=SYS_ID_USER;
        pFIBDataSet_type_dog.Active := true;
        dxBarLargeButton_get.Visible := ivNever;
        cxGrid1DBTableView1.OptionsSelection.MultiSelect := false;
        if pFIBDataSet_type_dog.IsEmpty then
        begin
          dxBarLargeButton_red.Enabled := false;
          dxBarLargeButton_del.Enabled := false;
          dxBarLargeButton_upd.Enabled := false;
          dxBarLargeButton_pr.Enabled  := false;
          dxBarLargeButton_get_group_doc.Enabled := false;
        end;
      end;
    if get_param = 'select2' then //вызов из фильтра
      begin
        pFIBDataSet_type_dog.Database := pFIBDatabase;
        pFIBDataSet_type_dog.Transaction := pFIBTransactionRead;
        pFIBDataSet_type_dog.Active := false;
        pFIBDataSet_type_dog.ParamByName('groupp').Value:=Group;
        pFIBDataSet_type_dog.ParamByName('id_user').Value:=SYS_ID_USER;
        pFIBDataSet_type_dog.Active := true;
        dxBarLargeButton_get.Visible := ivNever;
        cxGrid1DBTableView1.OptionsSelection.MultiSelect := true;
        if pFIBDataSet_type_dog.IsEmpty then
        begin
          dxBarLargeButton_red.Enabled := false;
          dxBarLargeButton_del.Enabled := false;
          dxBarLargeButton_upd.Enabled := false;
          dxBarLargeButton_pr.Enabled  := false;
          dxBarLargeButton_get_group_doc.Enabled := false;
        end;
      end;
    if get_param = 'get' then  //вызов при добавлении договора
      begin
        
        pFIBDataSet_type_dog.Database := pFIBDatabase;
        pFIBDataSet_type_dog.Transaction := pFIBTransactionRead;
        pFIBDataSet_type_dog.Active := false;
        pFIBDataSet_type_dog.ParamByName('groupp').Value:=Group;
        pFIBDataSet_type_dog.ParamByName('id_user').Value:=SYS_ID_USER;
        pFIBDataSet_type_dog.Active := true;
        dxBarLargeButton_get_group_doc.Visible := ivNever;
        cxGrid1DBTableView1.OptionsSelection.MultiSelect := false;
        if pFIBDataSet_type_dog.IsEmpty then
        begin
          dxBarLargeButton_red.Enabled := false;
          dxBarLargeButton_del.Enabled := false;
          dxBarLargeButton_upd.Enabled := false;
          dxBarLargeButton_pr.Enabled  := false;
          dxBarLargeButton_get.Enabled := false;
        end;
      end;
    if Get_param = 'doc_group' then //вызов из справочника групп
      begin
         DataSource.DataSet := pFIBDataSet_spr;
         pFIBDataSet_spr.Database := pFIBDatabase;
         pFIBDataSet_spr.Transaction := pFIBTransactionRead;
         pFIBDataSet_spr.Active := false;

         pFIBDataSet_spr.SelectSQL.Text := 'SELECT  b.id_tip_dog, cast(b.tip_dog as integer) as tip_dog, ' +
         'b.short_name, b.name, b.tip_active, b.id_ini_shablon, b.prop_sch, ' +
         'b.differ_sum, b.use_beg, b.use_end, b.id_bl_account, ' +
         'pub_sys_data.*, ' +
         'a.value_group ' +
         'FROM    pub_sys_data, ' +
         'pub_sp_tip_dog b LEFT JOIN dog_group_tip_dog a ON (a.id_tip_dog = b.id_tip_dog AND a.value_group = 1 AND a.id_group_doc ='+ IntToStr(Group)+ ') '+
         'WHERE   pub_sys_data.infinity_date=b.use_end ' +
         'and ((a.value_group=0)or(a.value_group is null)) ' +
         'Order by cast(b.tip_dog as integer)';

         pFIBDataSet_spr.Active := true;
         frmStyle := frmStyle;
         dxBarLargeButton_get.Visible := ivNever;
        if pFIBDataSet_spr.IsEmpty then
        begin
          dxBarLargeButton_red.Enabled := false;
          dxBarLargeButton_del.Enabled := false;
          dxBarLargeButton_upd.Enabled := false;
          dxBarLargeButton_pr.Enabled  := false;
          dxBarLargeButton_get_group_doc.Enabled := false;
        end;
      end;
    if Get_param='spr' then //вызов как справочник
    begin
      DataSource.DataSet := pFIBDataSet_spr;
      pFIBDataSet_spr.Database := pFIBDatabase;
      pFIBDataSet_spr.Transaction := pFIBTransactionRead;
      pFIBDataSet_spr.Active := false;
      pFIBDataSet_spr.Active := true;
      cxGrid1DBTableView1.OptionsSelection.MultiSelect := false;
      dxBarLargeButton_get.Visible := ivNever;
      dxBarLargeButton_get_group_doc.Visible := ivNever;
      if pFIBDataSet_spr.IsEmpty then
      begin
        dxBarLargeButton_red.Enabled := false;
        dxBarLargeButton_del.Enabled := false;
        dxBarLargeButton_upd.Enabled := false;
        dxBarLargeButton_pr.Enabled  := false;
      end;
    end;
    if Get_param='fulfil' then //вызов как справочник
    begin
      DataSource.DataSet := pFIBDataSet_spr;
      pFIBDataSet_spr.Database := pFIBDatabase;
      pFIBDataSet_spr.Transaction := pFIBTransactionRead;
      pFIBDataSet_spr.Active := false;
      pFIBDataSet_spr.Active := true;
      cxGrid1DBTableView1.OptionsSelection.MultiSelect := true;
      dxBarLargeButton_get.Visible := ivNever;
      if pFIBDataSet_spr.IsEmpty then
      begin
        dxBarLargeButton_red.Enabled := false;
        dxBarLargeButton_del.Enabled := false;
        dxBarLargeButton_upd.Enabled := false;
        dxBarLargeButton_pr.Enabled  := false;
      end;
    end;

end;

function CheckAccess(Path:string;Action:String;
                      DisplayMessage:Boolean=False):Integer;
var
i:Integer;
begin
i:=0;
  //if (not isAdmin) then
  //  begin

          i:=CheckPermission(Path,Action);
            if i<>0 then
              begin
                if DisplayMessage then
                  MessageDlg('Увага',AcMgmtErrMsg(i),mtError,[mbOk]);
              end;

  //  end;
  CheckAccess:=i;
end;

///////////////////////////////Сохранение параметров окна///////////////////

procedure SaveParam(Left,Top,Width,Height:integer;WinState:TWindowState);
  var
    Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('\Software\FMAS\Dogovor\SprTypeDog', True) then
    begin
      Reg.WriteString('Left',IntToStr(Left));
      Reg.WriteString('Top',IntToStr(Top));
      Reg.WriteString('Width',IntToStr(Width));
      Reg.WriteString('Height',IntToStr(Height));
      if (WinState = wsMaximized) then Reg.WriteString('WindowState','1');
      if (WinState = wsMinimized) then Reg.WriteString('WindowState','2');
      if (WinState = wsNormal)    then Reg.WriteString('WindowState','3');
      Reg.CloseKey;
    end;
  finally
    Reg.Free;
  end;
end;

procedure LoadParam(var Left,Top,Width,Height:integer;var WinState:TWindowState);
  var
    Reg: TRegistry;
    a: string;
begin
  Reg := TRegistry.Create;
  try
    begin
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('\Software\FMAS\Dogovor\SprTypeDog', True) then
    begin
      a := Reg.ReadString('Left');
      if (a <> '') then Left := StrToInt(a);
      a := Reg.ReadString('Top');
      if (a <> '') then Top := StrToInt(a);
      a := Reg.ReadString('Width');
      if (a <> '') then Width := StrToInt(a);
      a := Reg.ReadString('Height');
      if (a <> '') then Height := StrToInt(a);
      a := Reg.ReadString('WindowState');
      if a <> '' then begin
       if (a = '1') then WinState := wsMaximized;
       if (a = '2') then WinState := wsMinimized;
       if (a = '3') then WinState := wsNormal;
      end;
      Reg.CloseKey;
    end;
    end;
  finally
    Reg.Free;
  end;
end;

/////////////////////////////////////////////////////////////////

function WorkTypeDogSPR(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle; Get_param:String; ResProc : TResProc; Group: Variant; const data: PShablonInputData):Variant;
var
  spr: TfrmTypeDog;
begin
  spr := TfrmTypeDog.Create(Aowner,DBHANDLE,frmStyle,get_param,Group,data);

  spr.fResProc := ResProc;

  if frmStyle = fsNormal then
  begin
    res := Unassigned;
    spr.Visible := False;
    spr.ShowModal;
    WorkTypeDogSPR := Res;     // возвращает данные
    spr.Free;
  end;
end;

procedure TfrmTypeDog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveParam(Left,Top,Width,Height,WindowState);
  Action := caFree;
end;

procedure TfrmTypeDog.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
{ perem_ge_param='doc_group' then
  begin
    ACanvas.Canvas.Font.Color:=clBlack;
//    ACanvas.Canvas.Font.Style:=[fsBold];
    ACanvas.Canvas.FillRect(AViewInfo.Bounds);
  end
  else
  begin }
    if AViewInfo.GridRecord.Values[3] = 1 then
      begin
        ACanvas.Canvas.Font.Color := clRed;
  //      ACanvas.Canvas.Font.Style:=[fsBold];
        ACanvas.Canvas.FillRect(AViewInfo.Bounds);
      end
      else
      begin
        ACanvas.Canvas.Font.Color := clBlue;
  //      ACanvas.Canvas.Font.Style:=[];
        ACanvas.Canvas.FillRect(AViewInfo.Bounds);
      end;
//end;
end;


procedure TfrmTypeDog.addExecute(Sender: TObject);
begin

  if fibCheckPermission('/ROOT/DOG/SPRAV/TIP_DOGOVOR','Add') <> 0 then Exit;
  dxBarLargeButton_addClick(Self);
end;

procedure TfrmTypeDog.redExecute(Sender: TObject);
begin
  if fibCheckPermission('/ROOT/DOG/SPRAV/TIP_DOGOVOR','Edit') <> 0 then Exit;
  dxBarLargeButton_redClick(Self);
end;

procedure TfrmTypeDog.delExecute(Sender: TObject);
begin
  if fibCheckPermission('/ROOT/DOG/SPRAV/TIP_DOGOVOR','Del') <> 0 then Exit;
  dxBarLargeButton_delClick(Self);
end;

procedure TfrmTypeDog.upExecute(Sender: TObject);
begin
  dxBarLargeButton_updClick(Self);
end;

procedure TfrmTypeDog.clExecute(Sender: TObject);
begin
  dxBarLargeButton_closeClick(Self);
end;

procedure TfrmTypeDog.N1Click(Sender: TObject);
begin
  dxBarLargeButton_addClick(Self);
end;

procedure TfrmTypeDog.N2Click(Sender: TObject);
begin
  dxBarLargeButton_redClick(Self);
end;

procedure TfrmTypeDog.N3Click(Sender: TObject);
begin
  dxBarLargeButton_delClick(Self);
end;

procedure TfrmTypeDog.N4Click(Sender: TObject);
begin
  dxBarLargeButton_updClick(Self);
end;

procedure TfrmTypeDog.FormCreate(Sender: TObject);
var
  l,t,w,h: Integer;
  a: TWindowState;
  is_root_tip_dog: Variant;
  DataSetRoot: TpFIBDataSet;
begin

  if fibCheckPermission('/ROOT/DOG/SPRAV/TIP_DOGOVOR','Add') <> 0 then dxBarLargeButton_add.Visible := ivNever;
  if fibCheckPermission('/ROOT/DOG/SPRAV/TIP_DOGOVOR','Del') <> 0 then dxBarLargeButton_del.Visible := ivNever;
  if fibCheckPermission('/ROOT/DOG/SPRAV/TIP_DOGOVOR','Edit') <> 0 then dxBarLargeButton_red.Visible := ivNever;
  if fibCheckPermission('/ROOT/DOG/SPRAV/TIP_DOGOVOR','View') <> 0 then dxBarLargeButton_pr.Visible := ivNever;

  DataSetRoot := TpFIBDataSet.Create(Self);
  DataSetRoot.Database := pFIBDatabase;
  DataSetRoot.Transaction := pFIBTransactionRead;
  DataSetRoot.SQLs.SelectSQL.Text := 'select d.is_root_tip_dog from dog_sys_options d';
  DataSetRoot.Active := true;
  is_root_tip_dog := DataSetRoot.FBN('is_root_tip_dog').AsInteger;
  if (is_root_tip_dog) = 1 then
  begin
    add.Enabled := false;
    del.Enabled := false;
  end;
  DataSetRoot.Active := false;
  DataSetRoot.Free;

  pFIBDataSet_spr.Database := pFIBDatabase;
  pFIBDataSet_spr.Transaction := pFIBTransactionRead;
  pFIBDataSet_spr.Active := false;
  pFIBDataSet_spr.Active := true;

  pFIBDataSet_type_dog.Database := pFIBDatabase;
  pFIBDataSet_type_dog.Transaction := pFIBTransactionRead;
  pFIBDataSet_type_dog.Active := false;
  pFIBDataSet_type_dog.Active := true;
  cxGrid1DBTableView1.DataController.FocusedRowIndex := 0;

   //Интерфейс
  cxGrid1DBTableView1DBColumn1.Caption   := rstd_Tip_dog;
  cxGrid1DBTableView1DBColumn2.Caption   := rstd_Name;
  cxGrid1DBTableView1DBColumn3.Caption   := rstd_Short_name;
  cxGrid1DBTableView1DBColumn4.Caption   := rstd_Active;
  Label1.Caption                         := rstd_Find;

  l := Left;
  t := Top;
  w := Width;
  h := Height;
  a := WindowState;
  LoadParam(L,T,W,H,a);
  Left := l;
  Top := t;
  Width := w;
  Height := h;
  WindowState := a;
end;


//Выбирает тип договора по которому выбирается шаблон на добавление

procedure TfrmTypeDog.CloseForm();
begin
  Close;
end;


procedure TfrmTypeDog.prosmotrExecute(Sender: TObject);
begin
  if fibCheckPermission('/ROOT/DOG/SPRAV/TIP_DOGOVOR','View') <> 0 then Exit;
  dxBarLargeButton_prClick(Self);
end;


procedure TfrmTypeDog.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
if perem_get_param = 'get' then
  begin
    dxBarLargeButton_getClick(Self);
  end;
if (perem_get_param = 'doc_group') or (perem_get_param = 'select') or (perem_get_param = 'select2') then
  begin
    dxBarLargeButton_get_group_docClick(Self);
  end;
if  perem_get_param = 'spr' then
  begin
    dxBarLargeButton_prClick(Self);
  end;
end;

procedure TfrmTypeDog.cxGrid1DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if (AFocusedRecord <> nil) then
 if (AFocusedRecord.Expandable = True) then
  begin
   dxBarLargeButton_del.Enabled := false;
   cxGrid1DBTableView1.DataController.DataSource := nil;
  end;
end;

procedure TfrmTypeDog.dxBarLargeButton_addClick(Sender: TObject);
var
  spr: TfrmTypeDogEdit;
begin

  spr := TfrmTypeDogEdit.Create(Self,0,'add');

  spr.ShowModal;
  spr.Free;

  if perem_get_param='get' then
  begin
    pFIBDataSet_type_dog.Close;
    pFIBDataSet_type_dog.Open;
    pFIBDataSet_type_dog.Locate('id_tip_dog', id_tip_dog, []);
  end
  else
  begin
    pFIBDataSet_spr.Close;
    pFIBDataSet_spr.Open;
    pFIBDataSet_spr.Locate('id_tip_dog', id_tip_dog, []);
  end;
end;

procedure TfrmTypeDog.dxBarLargeButton_redClick(Sender: TObject);
var
  spr: TfrmTypeDogEdit;
  RecInfo: RECORD_INFO_STRUCTURE;
  ResultInfo: RESULT_STRUCTURE;
begin
 if perem_get_param='get' then
 begin
   td := pFIBDataSet_type_dog.FieldByName('id_tip_dog').AsVariant;
 end
 else
 begin
   td := pFIBDataSet_spr.FieldByName('id_tip_dog').AsVariant;
 end;

try
   pFIBStoredProc_tip_dog.Database:=pFIBDatabase;
   pFIBTransaction_lock.DefaultDatabase := pFIBDatabase;

   pFIBStoredProc_tip_dog.Transaction:=pFIBTransaction_lock;
   pFIBTransaction_lock.StartTransaction;

   RecInfo.TRHANDLE       :=pFIBTransaction_lock.Handle;
   RecInfo.DBHANDLE       :=pFIBDatabase.Handle;
   RecInfo.ID_RECORD      :=VarArrayOf([td]);
   RecInfo.PK_FIELD_NAME  :=VarArrayOf(['ID_TIP_DOG']);
   RecInfo.TABLE_NAME     :='PUB_SP_TIP_DOG';
   RecInfo.RAISE_FLAG     :=True;
   LockRecord(@RecInfo);

///////////////////////////////////////////////////////////////////////////////////////////////////////
      spr := TfrmTypeDogEdit.Create(Self, td, 'red');
      spr.ShowModal;
      spr.Free;
      pFIBTransaction_lock.Active := true;


      if perem_get_param='get' then
      begin
        pFIBDataSet_type_dog.Active := false;
        pFIBDataSet_type_dog.Active := true;
        pFIBDataSet_type_dog.Locate('id_tip_dog', td, []);
      end
      else
      begin
        pFIBDataSet_spr.Active := false;
        pFIBDataSet_spr.Active := true;
        pFIBDataSet_spr.Locate('id_tip_dog', td, []);
      end;

//////////////////////////////////////////////////////////////////////////////////////////////

    pFIBTransaction_lock.Commit;
    except on e:exception do
    begin
      MessageBox(self.Handle,PChar(e.Message),'Помилка',MB_OK+MB_ICONERROR);
      pFIBTransaction_lock.Rollback;
    end;
   end;
end;

procedure TfrmTypeDog.dxBarLargeButton_delClick(Sender: TObject);
var
    rec2del : Variant;
begin
if perem_get_param='get' then
begin
if MessageBox(Handle,PChar('Ви дійсно бажаєте видалити запис?'),
      'Підтвердження',MB_YesNo or MB_Iconquestion) = mrYes then
//if MessageDlg(askTipDogDelete, mtConfirmation, [mbYes, mbNo], 0) <> mrNo then
  begin
   pFIBTransactionWrite.DefaultDatabase := pFIBDatabase;
   pFIBStoredProc_tip_dog.Transaction := pFIBTransactionWrite;
   pFIBTransactionWrite.Active := True;
   pFIBTransactionWrite.StartTransaction;

   rec2del := pFIBDataSet_type_dog.FieldByName('id_tip_dog').AsVariant;

   pFIBDataSet_type_dog.FetchAll;

   if pFIBDataSet_type_dog.RecordCount > 1 then
   cxGrid1DBTableView1.Controller.GoToPrev(False);

   pFIBStoredProc_tip_dog.StoredProcName := 'PUB_SP_TIP_DOG_DEL';
   pFIBStoredProc_tip_dog.Prepare;
   pFIBStoredProc_tip_dog.ParamByName('d_id_tip_dog').Value := rec2del;
   try
     pFIBStoredProc_tip_dog.ExecProc;
   except on e: Exception do
     begin
       ShowMessage(e.Message);
       pFIBTransactionWrite.Rollback;
       pFIBTransactionWrite.Active := False;
       Exit;
     end;
   end;
   pFIBTransactionWrite.Commit;
   pFIBTransactionWrite.Active := False;

   rec2del := pFIBDataSet_type_dog.FieldByName('id_tip_dog').AsVariant;

   pFIBDataSet_type_dog.Active := false;
   pFIBDataSet_type_dog.Active := true;

   if not pFIBDataSet_type_dog.IsEmpty then
        pFIBDataSet_type_dog.Locate('id_tip_dog',rec2del,[]);

  end;
end
else
begin
if MessageBox(Handle,PChar('Ви дійсно бажаєте видалити запис?'),
      'Підтвердження',MB_YesNo or MB_Iconquestion) = mrYes then
//if MessageDlg(askTipDogDelete, mtConfirmation, [mbYes, mbNo], 0) <> mrNo then
  begin
   pFIBTransactionWrite.DefaultDatabase := pFIBDatabase;
   pFIBStoredProc_tip_dog.Transaction := pFIBTransactionWrite;
   pFIBTransactionWrite.Active := True;
   pFIBTransactionWrite.StartTransaction;

   rec2del := pFIBDataSet_spr.FieldByName('id_tip_dog').AsVariant;

   pFIBDataSet_spr.FetchAll;

   if pFIBDataSet_spr.RecordCount > 1 then
   cxGrid1DBTableView1.Controller.GoToPrev(False);

   pFIBStoredProc_tip_dog.StoredProcName := 'PUB_SP_TIP_DOG_DEL';
   pFIBStoredProc_tip_dog.Prepare;
   pFIBStoredProc_tip_dog.ParamByName('d_id_tip_dog').Value := rec2del;
   try
     pFIBStoredProc_tip_dog.ExecProc;
   except on e: Exception do
     begin
       ShowMessage(e.Message);
       pFIBTransactionWrite.Rollback;
       pFIBTransactionWrite.Active := False;
       Exit;
     end;
   end;
   pFIBTransactionWrite.Commit;
   pFIBTransactionWrite.Active := False;

   rec2del := pFIBDataSet_spr.FieldByName('id_tip_dog').AsVariant;

   pFIBDataSet_spr.Active := false;
   pFIBDataSet_spr.Active := true;

   if not pFIBDataSet_spr.IsEmpty then
        pFIBDataSet_spr.Locate('id_tip_dog',rec2del,[]);

  end;

end;

end;

procedure TfrmTypeDog.dxBarLargeButton_prClick(Sender: TObject);
var
  spr: TfrmTypeDogEdit;
  td: Variant;
begin
  if perem_get_param='get' then
  begin
    td := pFIBDataSet_type_dog.FieldByName('id_tip_dog').AsVariant;
  end
  else
  begin
    td := pFIBDataSet_spr.FieldByName('id_tip_dog').AsVariant;
  end;

  spr := TfrmTypeDogEdit.Create(Self, td, 'prosmotr');
  spr.ShowModal;
  spr.Free;
//  pFIBDataSet_type_dog.Active := false;
//  pFIBDataSet_type_dog.Active := true;
//  pFIBDataSet_type_dog.Locate('id_tip_dog', td, []);
end;

procedure TfrmTypeDog.dxBarLargeButton_updClick(Sender: TObject);
//var
// f : TForm;
begin
//  f := WaitScreenShow(self);
  if perem_get_param='get' then
  begin
    td := pFIBDataSet_type_dog.FieldByName('id_tip_dog').AsVariant;
    pFIBDataSet_type_dog.Close;
    pFIBDataSet_type_dog.Open;
    pFIBDataSet_type_dog.Locate('id_tip_dog', td, []);
  end
  else
  begin
    td := pFIBDataSet_spr.FieldByName('id_tip_dog').AsVariant;
    pFIBDataSet_spr.Close;
    pFIBDataSet_spr.Open;
    pFIBDataSet_spr.Locate('id_tip_dog', td, []);
  end;

//  WaitScreenClose(f);
end;

//Выбирает тип договора по которому выбирается шаблон на добавление
procedure TfrmTypeDog.dxBarLargeButton_getClick(Sender: TObject);
begin
    LoadDogManedger.LoadShablon(self.owner, pFIBDatabase.Handle, fsMDIChild, 0, 'add', pFIBDataSet_type_dog.FieldByName('id_tip_dog').AsVariant,
                              PChar(pFIBDataSet_type_dog.FieldByName('name_shablon').AsString), fResProc, inputdata);
    Close;
    pFIBDataSet_type_dog.Active := false;
    pFIBDataSet_type_dog.Active := true;
end;

//Для групп документов возвращает типы договоров
procedure TfrmTypeDog.dxBarLargeButton_get_group_docClick(Sender: TObject);
var
  max_change: Variant;
  i: Integer;
begin
  max_change := cxGrid1DBTableView1.DataController.GetSelectedCount;
  Res := VarArrayCreate([0,max_change-1], varVariant);
  for i := 0 to cxGrid1DBTableView1.DataController.GetSelectedCount-1 do
    begin
      Res[i] := VarArrayOf([cxGrid1DBTableView1.Controller.SelectedRecords[i].Values[4],
      cxGrid1DBTableView1.Controller.SelectedRecords[i].Values[0],
      cxGrid1DBTableView1.Controller.SelectedRecords[i].Values[1]]);
    end;
  Close;
end;

procedure TfrmTypeDog.dxBarLargeButton_closeClick(Sender: TObject);
begin
   Close;
end;

procedure  TfrmTypeDog.TipDogId(id_t_dog: Variant);
begin
  id_tip_dog := id_t_dog;
end;

procedure TfrmTypeDog.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
		VK_BACK:	SearchEdit.Text := '';
	end;
  if (perem_get_param = 'doc_group')
  //or (perem_get_param = 'select')
  and (key = VK_RETURN) then
  dxBarLargeButton_get_group_docClick(Self);

  if (perem_get_param = 'get') and (key = VK_RETURN) then
  dxBarLargeButton_getClick(Self);
end;

procedure TfrmTypeDog.SearchEditChange(Sender: TObject);
var
    N: Integer;
begin
    try
        N := StrToInt(SearchEdit.Text);
    except
        N := 0;
    end;

    if N <> 0 then
        DataSource.DataSet.Locate('TIP_DOG', SearchEdit.Text, [loPartialKey])
    else
        DataSource.DataSet.Locate('NAME', SearchEdit.Text, [loPartialKey, loCaseInsensitive]);

end;

procedure TfrmTypeDog.cxGrid1DBTableView1KeyPress(Sender: TObject;
  var Key: Char);
const
	LettersBig = 'АБВГҐДЕЁЖЗЄІИЇЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ';
	LettersSmall = 'абвгґдеёжзєіиїйклмнопрстуфхцчшщъыьэюя';
	Signs = '0123456789-()/\.';
begin
	if ( Pos(Key,LettersBig) = 0)
	   and ( Pos(Key,LettersSmall) = 0 )
	   and ( Pos(Key,Signs) = 0 )
			then
        Exit;

	SearchEdit.Text := SearchEdit.Text + Key;
end;

procedure TfrmTypeDog.SearchEditKeyPress(Sender: TObject; var Key: Char);
const
	LettersBig = 'АБВГҐДЕЁЖЗЄІИЇЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ';
	LettersSmall = 'абвгґдеёжзєіиїйклмнопрстуфхцчшщъыьэюя';
	Signs = '0123456789-()/\.';
begin
	if ( Pos(Key,LettersBig) = 0)
	   and ( Pos(Key,LettersSmall) = 0 )
	   and ( Pos(Key,Signs) = 0 )
     and ( key <> #8 )
			then
      begin
        Key:=#0;
      end;
end;

procedure TfrmTypeDog.SearchEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key =VK_RETURN then
  begin
 //
    DataSource.DataSet.Locate('NAME', SearchEdit.Text, [loPartialKey, loCaseInsensitive]);
  end;

end;

end.
