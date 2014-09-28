//***********************************************************************
//* Проект "Студгородок"                                                *
//* Справочник льгот                                                    *
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//***********************************************************************
unit uSp_Lgota_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, Menus, ComCtrls, ToolWin, ExtCtrls,
  cxContainer, cxCheckBox, cxDBEdit, StdCtrls, ImgList, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, cxCalendar, cxCurrencyEdit,
  FIBQuery, pFIBQuery, pFIBStoredProc, ActnList, cxTextEdit, dxBar,
  dxStatusBar, AccMGMT, st_ConstUnit, uSp_lgota_AE, st_common_funcs,
  dxBarExtItems, Placemnt, uSp_Lgota_DM, st_common_types, st_Consts_Messages,
  st_Common_Messages;

type
  TfrmLgota_main = class(TForm)
    Panel1: TPanel;
    GosCheck: TcxCheckBox;
    MedCheck: TcxCheckBox;
    SokrLabel: TLabel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle3: TcxStyle;
    ActionList1: TActionList;
    AddAction: TAction;
    EditAction: TAction;
    DeleteAction: TAction;
    RefreshAction: TAction;
    ExitAction: TAction;
    cxStyle2: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    LargeImages: TImageList;
    DisabledLargeImages: TImageList;
    ShortNameLabel: TEdit;
    SearchAction: TAction;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    Column_name_lgot: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    PopupMenu1: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    HotKey_StatusBar: TdxStatusBar;
    N4: TMenuItem;
    PopupImageList: TImageList;
    SelectAction: TAction;
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    SelectButton: TdxBarLargeButton;
    Search_BarEdit: TdxBarEdit;
    StFormStorage: TFormStorage;
    act_help: TAction;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExitButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DataSet_mainAfterScroll(DataSet: TDataSet);
    procedure DataSet_mainAfterOpen(DataSet: TDataSet);
    procedure SelectButtonClick(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure act_helpExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    PLanguageIndex: byte;
    DM : TfrmLgot_DM;
    is_admin : Boolean;
    procedure FormIniLanguage();
  public
    res : Variant;
    constructor Create(aParameter : TstSimpleParams);reintroduce;
  end;
  
var
  frmLgota_main: TfrmLgota_main;

implementation

{uses St_PfLg_Add_Form, ;}

{$R *.dfm}

procedure TfrmLgota_main.FormIniLanguage();
begin
  // индекс языка (1-укр, 2 - рус)
  PLanguageIndex:=              stLanguageIndex;

  //названия кнопок
  ExitButton.Caption :=         st_ConstUnit.st_ExitBtn_Caption[PLanguageIndex];
  ExitButton.Hint :=            st_ConstUnit.st_ExitBtn_Caption[PLanguageIndex];
  AddButton.Caption :=          st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
  AddButton.Hint :=             st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
  EditButton.Caption :=         st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
  EditButton.Hint :=            st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
  DeleteButton.Caption :=       st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
  DeleteButton.Hint :=          st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
  RefreshButton.Caption :=      st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];
  RefreshButton.Hint :=         st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];
  SelectButton.Caption :=      st_ConstUnit.st_Select_Caption[PLanguageIndex];
  SelectButton.Hint :=         st_ConstUnit.st_Select_Caption[PLanguageIndex];

  HotKey_StatusBar.Panels[0].Text := st_ConstUnit.st_HelpBtn_ShortCut[PLanguageIndex]    + st_ConstUnit.st_HelpBtn_Caption[PLanguageIndex];
  HotKey_StatusBar.Panels[1].Text := st_ConstUnit.st_InsertBtn_ShortCut[PLanguageIndex]  + st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
  HotKey_StatusBar.Panels[2].Text := st_ConstUnit.st_EditBtn_ShortCut[PLanguageIndex]    + st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
  HotKey_StatusBar.Panels[3].Text := st_ConstUnit.st_DeleteBtn_ShortCut[PLanguageIndex]  + st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
  HotKey_StatusBar.Panels[4].Text := st_ConstUnit.st_RefreshBtn_ShortCut[PLanguageIndex] + st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];
  HotKey_StatusBar.Panels[5].Text := st_ConstUnit.st_Select_Caption[PLanguageIndex]      + st_ConstUnit.st_EnterBtn_ShortCut[PLanguageIndex];
  HotKey_StatusBar.Panels[6].Text := st_ConstUnit.st_ExitBtn_ShortCut[PLanguageIndex]    + st_ConstUnit.st_ExitBtn_Caption[PLanguageIndex];
  HotKey_StatusBar.Hint           := st_ConstUnit.st_HotKeys[PLanguageIndex];

  // скорочення
  SokrLabel.Caption           := st_ConstUnit.st_ShortLable[PLanguageIndex];
  GosCheck.Properties.Caption := st_ConstUnit.st_GosCheck[PLanguageIndex];
  MedCheck.Properties.Caption := st_ConstUnit.st_MedCheck[PLanguageIndex];

  // пошел грид
  cxGrid1DBTableView1DBColumn1.Caption := st_ConstUnit.st_Nomer[PLanguageIndex];
  Column_name_lgot.Caption             := st_ConstUnit.st_NameLable[PLanguageIndex];
  cxGrid1DBTableView1DBColumn3.Caption := st_ConstUnit.st_PercentOnly[PLanguageIndex];
  cxGrid1DBTableView1DBColumn2.Caption := st_ConstUnit.st_Summa_Pay[PLanguageIndex];

  MenuItem1.Caption := st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
  MenuItem2.Caption := st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
  MenuItem3.Caption := st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
  MenuItem4.Caption := st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];
  N4.Caption        := st_ConstUnit.st_ExitBtn_Caption[PLanguageIndex];

  MenuItem1.Hint := st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
  MenuItem2.Hint := st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
  MenuItem3.Hint := st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
  MenuItem4.Hint := st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];
  N4.Hint        := st_ConstUnit.st_ExitBtn_Caption[PLanguageIndex];
end;

procedure TfrmLgota_main.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  StFormStorage.SaveFormPlacement;
   If FormStyle = fsMDIChild
    then action := caFree
    else DM.Free;
end;

procedure TfrmLgota_main.ExitButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmLgota_main.RefreshButtonClick(Sender: TObject);
var
  id : int64;
begin
  Screen.Cursor:=crHourGlass;

  id := -1;

  if DM.DataSet_main.RecordCount <> 0 then id := DM.DataSet_main['ID_LGOT'];

  DM.DataSet_main.Close;
  DM.DataSet_main.SQLs.SelectSQL.Text := 'SELECT * FROM ST_SP_LGOTA_SELECT';
  DM.DataSet_main.Open;

  DM.DataSet_main.Locate('ID_LGOT', id, []);

  Screen.Cursor:=crDefault;
end;

procedure TfrmLgota_main.FormCreate(Sender: TObject);
begin
  FormIniLanguage();
end;

procedure TfrmLgota_main.DeleteButtonClick(Sender: TObject);
var
 i : Byte;
begin
  if not Is_Admin then
   if CheckPermission('/ROOT/StudCity/Sprav/Lgot','Del') <> 0
    then
     begin
      messagebox(handle,
      pchar(st_Consts_Messages.st_NotHaveRights[PLanguageIndex]
      +#13+ st_Consts_Messages.st_GoToAdmin[PLanguageIndex]),
      pchar(st_Consts_Messages.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     end;

  DM.DataSet_read.Close;
  DM.DataSet_read.SQLs.SelectSQL.Text := 'select CAN from ST_SP_LGOTA_CAN_DELETE(:id_lgot)';
  DM.DataSet_read.ParamByName('ID_LGOT').AsInt64 := DM.DataSet_main['ID_LGOT'];
  DM.DataSet_read.Open;

  If DM.DataSet_read['CAN'] = 0 then
   begin
    ShowMessage(st_ConstUnit.st_CannotDelete_Lgota[PLanguageIndex]);
    exit;
   end;

  i:= st_Common_Messages.stShowMessage(st_Confirmation_Caption[PLanguageIndex], st_warning_Delete[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  If ((i = 7) or (i= 2)) then exit;

  DM.StoredProc.StoredProcName := 'ST_SP_LGOTA_DELETE';
  DM.Transaction_write.StartTransaction;
  DM.StoredProc.Prepare;
  DM.StoredProc.ParamByName('ID_LGOT').AsInteger := DM.DataSet_main['ID_LGOT'];
  DM.StoredProc.ExecProc;
  try
   DM.StoredProc.Transaction.Commit;
   except
   DM.StoredProc.Transaction.Rollback;
   raise;
  end;
  DM.StoredProc.Close;

  RefreshButton.Click;
end;

procedure TfrmLgota_main.AddButtonClick(Sender: TObject);
var
  ViewForm : Tfrm_Lgota_AE;
  new_id_lgot, new_id_lgot_sum : Int64;
  i, j : Integer;
begin
  if not Is_Admin then
   if CheckPermission('/ROOT/StudCity/Sprav/Lgot','Add') <> 0
    then
     begin
      messagebox(handle,
      pchar(st_Consts_Messages.st_NotHaveRights[PLanguageIndex]
      +#13+ st_Consts_Messages.st_GoToAdmin[PLanguageIndex]),
      pchar(st_Consts_Messages.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     end;

  ViewForm := Tfrm_Lgota_AE.Create(Self, DM.DB.Handle, -1);
  ViewForm.Caption := st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
  ViewForm.is_admin := is_admin;

  if ViewForm.ShowModal = mrOK then
   begin
    Screen.Cursor:= crHourGlass;
    //Добавляем льготу
    DM.StoredProc.StoredProcName := 'ST_SP_LGOTA_INSERT';
    DM.Transaction_write.StartTransaction;
    DM.StoredProc.Prepare;
    DM.StoredProc.ParamByName('NUM_LG').AsInteger    := StrToInt(ViewForm.KodEdit.Text);
    DM.StoredProc.ParamByName('SHORT_NAME').AsString := ViewForm.ShortEdit.Text;
    DM.StoredProc.ParamByName('NAME_LG').AsString    := ViewForm.NameEdit.Text;
    if ViewForm.MedCheck.Checked
     then DM.StoredProc.ParamByName('MEDICAL').AsShort := 1
     else DM.StoredProc.ParamByName('MEDICAL').AsShort := 0;
    if ViewForm.GosCheck.Checked
     then DM.StoredProc.ParamByName('STATE_LGOT').AsShort  := 1
     else DM.StoredProc.ParamByName('STATE_LGOT').AsShort  := 0;

    DM.StoredProc.ExecProc;
    new_id_lgot :=  DM.StoredProc['ID_LGOT'].AsInt64;

    ViewForm.DM.MemoryData.Open;
    ViewForm.DM.MemoryData.First;
    for i := 0 to ViewForm.DM.MemoryData.RecordCount - 1 do
     begin
      //Добавляение суммы, периодов и процентов льгот
      DM.StoredProc.StoredProcName := 'ST_SP_LGOT_SUM_INSERT';
      DM.StoredProc.Prepare;
      DM.StoredProc.ParamByName('ID_LGOT').AsInt64 := new_id_Lgot;

      if ViewForm.DM.MemoryData['md_procent'] <> null
       then DM.StoredProc.ParamByName('PERCENT').AsFloat := ViewForm.DM.MemoryData['md_procent']
       else DM.StoredProc.ParamByName('PERCENT').AsFloat := 0;

      if ViewForm.DM.MemoryData['md_SUM'] <> null
       then DM.StoredProc.ParamByName('SUMMA').AsCurrency := ViewForm.DM.MemoryData['md_SUM']
       else DM.StoredProc.ParamByName('SUMMA').AsCurrency := 0;

      DM.StoredProc.ParamByName('ID_SERVES').AsCurrency := ViewForm.DM.MemoryData['md_ID_SERVES'];
      DM.StoredProc.ExecProc;
      new_id_lgot_sum := DM.StoredProc['ID_LGOT_SUM'].AsInt64;

      DM.DataSet_read.Close;
      DM.DataSet_read.SQLs.SelectSQL.Text := 'Select * from ST_SERVICE_DETAIL where ID_SERVICE = :id_serves';
      DM.DataSet_read.ParamByName('ID_SERVES').AsInt64 := ViewForm.DM.MemoryData['md_ID_SERVES'];
      DM.DataSet_read.Open;

      DM.DataSet_read.FetchAll;
      DM.DataSet_read.First;
      For j:= 0 to DM.DataSet_read.RecordCount - 1 do
       begin
         DM.StoredProc.StoredProcName := 'ST_DT_LGOT_SMET_INS';
         DM.StoredProc.Prepare;
         DM.StoredProc.ParamByName('ID_LGOT_SUM').AsInt64 := new_id_lgot_sum;
         DM.StoredProc.ParamByName('ID_STAT').AsInt64     := DM.DataSet_read['ID_RAZD_ST'];
         If ViewForm.DM.MemoryData['md_procent'] <> null
          then DM.StoredProc.ParamByName('PROCENT').Asfloat := ViewForm.DM.MemoryData['md_procent']
          else DM.StoredProc.ParamByName('PROCENT').Asfloat := 0;

         If ViewForm.DM.MemoryData['md_sum'] <> null then
          begin
           If DM.DataSet_read['ST_OPTIONS'] = 2
            then DM.StoredProc.ParamByName('SUMMA').AsCurrency := ViewForm.DM.MemoryData['md_sum'] / 6;

           If DM.DataSet_read['ST_OPTIONS'] = 1
            then DM.StoredProc.ParamByName('SUMMA').AsCurrency := ViewForm.DM.MemoryData['md_sum'] - (ViewForm.DM.MemoryData['md_sum'] / 6);

           If DM.DataSet_read['ST_OPTIONS'] = 0
            then DM.StoredProc.ParamByName('SUMMA').AsCurrency := ViewForm.DM.MemoryData['md_sum'];
          end
          else DM.StoredProc.ParamByName('SUMMA').AsCurrency := 0;

         DM.StoredProc.ExecProc;
         DM.DataSet_read.Next;
       end;
      ViewForm.DM.MemoryData.Next;
     end;

    try
     DM.Transaction_write.Commit;
    except
     DM.Transaction_write.Rollback;
     raise;
    end;
    DM.StoredProc.Close;

    RefreshButtonClick(self);
    DM.DataSet_main.Locate('ID_LGOT', new_id_lgot, []);
   end;

  ViewForm.Free;
  Screen.Cursor:= crDefault;
end;

procedure TfrmLgota_main.EditButtonClick(Sender: TObject);
var
 edit_id_lgot, new_id_lgot_sum  : integer;
 i, j             : integer;
 ViewForm      : Tfrm_Lgota_AE;
begin
  if not Is_Admin then
   if CheckPermission('/ROOT/StudCity/Sprav/Lgot','Edit') <> 0
    then
     begin
      messagebox(handle,
      pchar(st_Consts_Messages.st_NotHaveRights[PLanguageIndex]
      +#13+ st_Consts_Messages.st_GoToAdmin[PLanguageIndex]),
      pchar(st_Consts_Messages.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     end;

  edit_id_lgot              := DM.DataSet_main['ID_LGOT'];
  ViewForm                  := Tfrm_Lgota_AE.Create(Self, DM.DB.Handle, edit_id_lgot);
  ViewForm.Caption          := st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
  ViewForm.KodEdit.Text     := DM.DataSet_main['NUM_LG'];
  ViewForm.ShortEdit.Text   := DM.DataSet_main['SHORT_NAME'];
  ViewForm.NameEdit.Text    := DM.DataSet_main['NAME_LGOT'];
  ViewForm.GosCheck.Checked := DM.DataSet_main['STATE_LGOT'] = 1;
  ViewForm.MedCheck.Checked := DM.DataSet_main['MEDICAL'] = 1;
  ViewForm.CurrencyEdit_procent.EditValue := DM.DataSet_main['PERCENT'];
  ViewForm.CurrencyEdit_sum.EditValue     := DM.DataSet_main['Summa'];

  If ViewForm.ShowModal = mrOK then
   begin
    Screen.Cursor:= crSQLWait;
    //Изменияем льготу
    DM.StoredProc.StoredProcName := 'ST_SP_LGOTA_UPDATE';
    DM.StoredProc.Transaction.StartTransaction;
    DM.StoredProc.Prepare;
    DM.StoredProc.ParamByName('KOD_LG').AsInteger := edit_id_lgot;
    DM.StoredProc.ParamByName('NUM_LG').AsInteger := StrToInt(ViewForm.KodEdit.Text);
    DM.StoredProc.ParamByName('SHORT_NAME').AsString := ViewForm.ShortEdit.Text;
    DM.StoredProc.ParamByName('NAME_LG').AsString := ViewForm.NameEdit.Text;

    If ViewForm.MedCheck.Checked
     then DM.StoredProc.ParamByName('MEDICAL').AsShort := 1
     else DM.StoredProc.ParamByName('MEDICAL').AsShort := 0;

    If ViewForm.GosCheck.Checked
     then DM.StoredProc.ParamByName('STATE_LGOT').AsShort := 1
     else DM.StoredProc.ParamByName('STATE_LGOT').AsShort := 0;

    DM.StoredProc.ExecProc;
    //Закрываем существующие суммы
    DM.StoredProc.StoredProcName := 'ST_SP_LGOT_SUM_CLOSE';
    DM.StoredProc.Prepare;
    DM.StoredProc.ParamByName('ID_LGOT').AsInteger := edit_id_lgot;
    DM.StoredProc.ExecProc;

    ViewForm.DM.MemoryData.Open;
    ViewForm.DM.MemoryData.First;
    for i := 0 to ViewForm.DM.MemoryData.RecordCount - 1 do
     begin
      //Добавляение суммы, периодов и процентов льгот
      DM.StoredProc.StoredProcName := 'ST_SP_LGOT_SUM_INSERT';
      DM.StoredProc.Prepare;
      DM.StoredProc.ParamByName('ID_LGOT').AsInt64 := edit_id_lgot;

      if ViewForm.DM.MemoryData['md_procent'] <> null
       then DM.StoredProc.ParamByName('PERCENT').AsFloat := ViewForm.DM.MemoryData['md_procent']
       else DM.StoredProc.ParamByName('PERCENT').AsFloat := 0;

      if ViewForm.DM.MemoryData['md_SUM'] <> null
       then DM.StoredProc.ParamByName('SUMMA').AsCurrency := ViewForm.DM.MemoryData['md_SUM']
       else DM.StoredProc.ParamByName('SUMMA').AsCurrency := 0;

      DM.StoredProc.ParamByName('ID_SERVES').AsCurrency := ViewForm.DM.MemoryData['md_ID_SERVES'];
      DM.StoredProc.ExecProc;
      new_id_lgot_sum := DM.StoredProc['ID_LGOT_SUM'].AsInt64;

      DM.DataSet_read.Close;
      DM.DataSet_read.SQLs.SelectSQL.Text := 'Select * from ST_SERVICE_DETAIL where ID_SERVICE = :id_serves';
      DM.DataSet_read.ParamByName('ID_SERVES').AsInt64 := ViewForm.DM.MemoryData['md_ID_SERVES'];
      DM.DataSet_read.Open;

      DM.DataSet_read.FetchAll;
      DM.DataSet_read.First;
      For j:= 0 to DM.DataSet_read.RecordCount - 1 do
       begin
         DM.StoredProc.StoredProcName := 'ST_DT_LGOT_SMET_INS';
         DM.StoredProc.Prepare;
         DM.StoredProc.ParamByName('ID_LGOT_SUM').AsInt64 := new_id_lgot_sum;
         DM.StoredProc.ParamByName('ID_STAT').AsInt64     := DM.DataSet_read['ID_RAZD_ST'];
         If ViewForm.DM.MemoryData['md_procent'] <> null
          then DM.StoredProc.ParamByName('PROCENT').Asfloat := ViewForm.DM.MemoryData['md_procent']
          else DM.StoredProc.ParamByName('PROCENT').Asfloat := 0;

         If ViewForm.DM.MemoryData['md_sum'] <> null then
          begin
           If DM.DataSet_read['ST_OPTIONS'] = 2
            then DM.StoredProc.ParamByName('SUMMA').AsCurrency := ViewForm.DM.MemoryData['md_sum'] / 6;

           If DM.DataSet_read['ST_OPTIONS'] = 1
            then DM.StoredProc.ParamByName('SUMMA').AsCurrency := ViewForm.DM.MemoryData['md_sum'] - (ViewForm.DM.MemoryData['md_sum'] / 6);

           If DM.DataSet_read['ST_OPTIONS'] = 0
            then DM.StoredProc.ParamByName('SUMMA').AsCurrency := ViewForm.DM.MemoryData['md_sum'];
          end
          else DM.StoredProc.ParamByName('SUMMA').AsCurrency := 0;

         DM.StoredProc.ExecProc;
         DM.DataSet_read.Next;
       end;
      ViewForm.DM.MemoryData.Next;
     end;
     
    try
     DM.StoredProc.Transaction.Commit;
     DM.StoredProc.Close;
    except
     DM.StoredProc.Transaction.Rollback;
     DM.StoredProc.Close;
     raise;
    end;

    RefreshButtonClick(self);
    DM.DataSet_main.Locate('ID_LGOT', edit_id_lgot , []);  
   end;

 ViewForm.Free;

 Screen.Cursor:= crDefault;  
end;

procedure TfrmLgota_main.DataSet_mainAfterScroll(DataSet: TDataSet);
begin
  if DM.DataSet_main.RecordCount = 0 then exit;

  ShortNameLabel.Text := DM.DataSet_main['SHORT_NAME'];
  GosCheck.Checked    := DM.DataSet_main['STATE_LGOT'] = 1;
  MedCheck.Checked    := DM.DataSet_main['MEDICAL'] = 1;
end;

procedure TfrmLgota_main.DataSet_mainAfterOpen(DataSet: TDataSet);
begin
  if DM.DataSet_main.RecordCount = 0 then
   begin
    EditButton.Enabled := false;
    DeleteButton.Enabled := false;
   end
  else
   begin
    EditButton.Enabled := true;
    DeleteButton.Enabled := true;
   end;
end;

procedure TfrmLgota_main.SelectButtonClick(Sender: TObject);
begin
  if DM.DataSet_main.RecordCount = 0 then Exit;

  res := VarArrayCreate([0,2],varVariant);
  res[0] := DM.DataSet_main['ID_LGOT'];
  res[1] := DM.DataSet_main['NAME_LGOT'];
  res[2] := DM.DataSet_main['NUM_LG'];

  ModalResult := mrOk;
end;

procedure TfrmLgota_main.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  if SelectButton.Enabled
   then SelectButtonClick(self)
   else EditAction.Execute;
end;

constructor TfrmLgota_main.Create(aParameter: TstSimpleParams);
begin
  inherited Create(Aparameter.Owner);
  Screen.Cursor:= crHourGlass;

  DM := TfrmLgot_DM.Create(self);
  DM.DB.Handle := aParameter.Db_Handle;
  DM.DB.Connected := True;
  DM.Transaction_Read.StartTransaction;

  is_admin := aParameter.is_admin;

  RefreshButtonClick(self);

  cxGrid1DBTableView1.DataController.DataSource := DM.DataSource_main;
  DM.DataSet_main.AfterScroll := DataSet_MainAfterScroll;
  DM.DataSet_main.AfterOpen   := DataSet_mainAfterOpen;

  Screen.Cursor:= crDefault;

  StFormStorage.RestoreFormPlacement;
end;

procedure TfrmLgota_main.act_helpExecute(Sender: TObject);
begin
  Load_Help(self, DM.DB.Handle, 'sp_lgots');
end;

procedure TfrmLgota_main.FormShow(Sender: TObject);
begin
  if formstyle = fsMDIChild
   then selectButton.Visible := ivNever
   else selectButton.Visible := ivAlways;
end;

end.
