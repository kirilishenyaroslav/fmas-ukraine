unit uSp_Class_Kat_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ToolWin, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox,
  FIBQuery, pFIBQuery, pFIBStoredProc, ActnList, FIBDataSet, pFIBDataSet,
  cxContainer, cxLabel, ExtCtrls, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, Menus, FIBDatabase, pFIBDatabase, IBase,
  dxStatusBar, st_ConstUnit, st_common_funcs, st_common_types, uSp_Class_Kat_DM,
  dxBar, dxBarExtItems, Placemnt, st_consts_messages, st_Common_Messages,
  uSp_Class_Kat_AE;

type
  TfrmClass_Kat = class(TForm)
    ImageListOfCategory: TImageList;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1ID_CATEGORY_CLASS: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_CATEGORY_CLASS: TcxGridDBColumn;
    cxGrid1DBTableView1PEOPLE: TcxGridDBColumn;
    cxGrid1DBTableView1PLACES: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    PeopleLabel: TcxLabel;
    cxLabel2: TcxLabel;
    PlaceLabel: TcxLabel;
    DataSource: TDataSource;
    ActionList1: TActionList;
    AddAction: TAction;
    EditAction: TAction;
    DeleteAction: TAction;
    RefreshAction: TAction;
    ExitAction: TAction;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    DeleteAction1: TMenuItem;
    RefreshAction1: TMenuItem;
    N3: TMenuItem;
    PopupImageList: TImageList;
    HotKey_StatusBar: TdxStatusBar;
    SelectAction: TAction;
    StFormStorage: TFormStorage;
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    SelectButton: TdxBarLargeButton;
    Search_BarEdit: TdxBarEdit;
    Act_help: TAction;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DataSet_mainAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure Act_helpExecute(Sender: TObject);
  private
    PLanguageIndex : byte;
    DM : TfrmClass_Kat_DM;
    is_admin : Boolean;
    procedure FormIniLanguage();
  public
    res : Variant;
    constructor Create (aParameter : TstSimpleParams);reintroduce;
  end;

var
  frmClass_Kat: TfrmClass_Kat;
  res:Variant;

implementation
{$R *.dfm}

procedure TfrmClass_Kat.FormIniLanguage();
begin
 // индекс языка (1-укр, 2 - рус)
 PLanguageIndex:=              stLanguageIndex;
 Caption :=                    st_ConstUnit.st_CatClassSprav[PLanguageIndex];
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

 HotKey_StatusBar.Panels[0].Text:=  st_ConstUnit.st_InsertBtn_ShortCut[PLanguageIndex]  + st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 HotKey_StatusBar.Panels[1].Text:=  st_ConstUnit.st_EditBtn_ShortCut[PLanguageIndex]    + st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 HotKey_StatusBar.Panels[2].Text:=  st_ConstUnit.st_DeleteBtn_ShortCut[PLanguageIndex]  + st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
 HotKey_StatusBar.Panels[3].Text:=  st_ConstUnit.st_RefreshBtn_ShortCut[PLanguageIndex] + st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];
 HotKey_StatusBar.Panels[4].Text:=  st_ConstUnit.st_Select_Caption[PLanguageIndex]      + st_ConstUnit.st_EnterBtn_ShortCut[PLanguageIndex];
 HotKey_StatusBar.Panels[5].Text:=  st_ConstUnit.st_ExitBtn_ShortCut[PLanguageIndex]    + st_ConstUnit.st_ExitBtn_Caption[PLanguageIndex];
 HotKey_StatusBar.Hint :=           st_ConstUnit.st_HotKeys[PLanguageIndex];

 // кол-во людей
 cxLabel1.Caption :=      st_ConstUnit.st_KolvoLudey[PLanguageIndex];
 // кол-во мест
 cxLabel2.Caption :=      st_ConstUnit.st_KolvoMest[PLanguageIndex];


 // пошел грид
 cxGrid1DBTableView1NAME_CATEGORY_CLASS.Caption :=    st_ConstUnit.st_NameLable[PLanguageIndex];

 N1.Caption :=             st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 N2.Caption :=             st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 DeleteAction1.Caption :=  st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
 RefreshAction1.Caption := st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];
 N3.Caption :=             st_ConstUnit.st_KontextPoisk[PLanguageIndex];

 N1.Hint :=               st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 N2.Hint :=               st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 DeleteAction1.Hint :=    st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
 RefreshAction1.Hint :=   st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];
 N3.Caption :=            st_ConstUnit.st_KontextPoisk[PLanguageIndex];
end;

constructor TfrmClass_Kat.Create(aParameter : TstSimpleParams);
begin
  inherited Create(Aparameter.Owner);
  Screen.Cursor:= crHourGlass;

  DM := TfrmClass_Kat_DM.Create(self);
  DM.DB.Handle := aParameter.Db_Handle;
  DM.DB.Connected := True;
  DM.Transaction_Read.StartTransaction;

  is_admin := aParameter.is_admin;
  
  RefreshButtonClick(self);

  cxGrid1DBTableView1.DataController.DataSource := DM.DataSource_main;
  DM.DataSet_main.AfterScroll := DataSet_MainAfterScroll;

  Screen.Cursor:= crDefault;

  StFormStorage.RestoreFormPlacement;
end;

procedure TfrmClass_Kat.ExitButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmClass_Kat.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  StFormStorage.SaveFormPlacement;
  if FormStyle = fsMDIChild
   then action:=caFree
   else DM.Free;
end;

procedure TfrmClass_Kat.DataSet_mainAfterScroll(DataSet: TDataSet);
begin
  If DM.DataSet_main.RecordCount = 0 then exit;
  PeopleLabel.Caption := IntToStr(DataSet['PEOPLES']);
  PlaceLabel.Caption := FloatToStr(DataSet['PLACES']);
end;

procedure TfrmClass_Kat.FormShow(Sender: TObject);
begin
  FormIniLanguage();
  if FormStyle = fsMDIChild then
   begin
    SelectButton.Visible := ivNever;
    cxGrid1DBTableView1.OptionsSelection.MultiSelect := False;
   end;
end;

procedure TfrmClass_Kat.SelectButtonClick(Sender: TObject);
begin
  if DM.DataSet_main.RecordCount = 0 then Exit;

  res := VarArrayCreate([0,1],varVariant);
  res[0] := DM.DataSet_main['ID_CATEGORY_CLASS'];
  res[1] := DM.DataSet_main['NAME_CATEGORY_CLASS'];
  
  ModalResult := mrOK;
end;

procedure TfrmClass_Kat.cxGrid1DBTableView1DblClick(Sender: TObject);
var i : integer;
    RecMultiSelected : integer;
begin
    if cxGrid1DBTableView1.OptionsSelection.MultiSelect=true then
    begin
      RecMultiSelected:=cxGrid1DBTableView1.DataController.GetSelectedCount;
      res:=VarArrayCreate([0,RecMultiSelected-1],varVariant);
      for i:=0 to cxGrid1DBTableView1.DataController.GetSelectedCount-1 do
        begin
          res[i]:=cxGrid1DBTableView1.Controller.SelectedRecords[i].Values[1];
        end;
     end;
     if cxGrid1DBTableView1.OptionsSelection.MultiSelect=false then
     begin
      res:=VarArrayCreate([0,1],varVariant);
      res[0]:=DM.DataSet_main['ID_CATEGORY_CLASS'];
      res[1]:= DM.DataSet_main['NAME_CATEGORY_CLASS'];
     end;

    if FormStyle = fsMDIChild then EditButtonClick(Sender);
        
ModalResult := mrOK;
end;

procedure TfrmClass_Kat.AddButtonClick(Sender: TObject);
var
  id : integer;
  ViewForm : TfrmClass_Kat_AE;
begin
  if not Is_Admin then
   if CheckPermission('/ROOT/StudCity/St_Sp','Add') <> 0
    then
     begin
      messagebox(handle,
      pchar(st_Consts_Messages.st_NotHaveRights[PLanguageIndex]
      +#13+ st_Consts_Messages.st_GoToAdmin[PLanguageIndex]),
      pchar(st_Consts_Messages.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     end;
     
  ViewForm := TfrmClass_Kat_AE.Create(Self);
  ViewForm.Caption := st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
  ViewForm.PLanguageIndex := PLanguageIndex;
  ViewForm.ShowModal;

  if ViewForm.ModalResult = mrOK then
   begin
    start_sql_monitor;
    DM.StoredProc.StoredProcName := 'ST_INI_CATEGORY_CLASS_INSERT';
    DM.StoredProc.Transaction.StartTransaction;
    DM.StoredProc.Prepare;
    DM.StoredProc.ParamByName('NAME_CATEGORY_CLASS').AsString := ViewForm.NameEdit.Text;
    DM.StoredProc.ParamByName('PEOPLES').AsInteger            := StrToInt(ViewForm.PeopleEdit.Text);
    DM.StoredProc.ParamByName('PLACES').AsFloat               := StrToFloat(ViewForm.PlaceEdit.Text);
    DM.StoredProc.ExecProc;
    id := DM.StoredProc['ID_CATEGORY_CLASS'].AsInteger;
    try
     DM.StoredProc.Transaction.Commit;
     except
      on E:Exception do
       begin
        stShowMessage('Error in ST_INI_CATEGORY_CLASS_INSERT',e.Message,mtError,[mbOK]);
        DM.Transaction_write.Rollback;
        Send_mail(e.Message);
       end;
    end;
    DM.StoredProc.Close;
    stop_sql_monitor;

    RefreshButtonClick(Self);
    DM.DataSet_main.Locate('ID_CATEGORY_CLASS', id, []);
   end;
  ViewForm.Free;
end;

procedure TfrmClass_Kat.EditButtonClick(Sender: TObject);
var
  id : Int64;
  ViewForm : TfrmClass_Kat_AE;
begin
  if not Is_Admin then
   if CheckPermission('/ROOT/StudCity/St_Sp','Edit') <> 0
    then
     begin
      messagebox(handle,
      pchar(st_Consts_Messages.st_NotHaveRights[PLanguageIndex]
      +#13+ st_Consts_Messages.st_GoToAdmin[PLanguageIndex]),
      pchar(st_Consts_Messages.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     end;

  if DM.DataSet_main.RecordCount = 0 then Exit;

  id := DM.DataSet_main['ID_CATEGORY_CLASS'];
  ViewForm := TfrmClass_Kat_AE.Create(Self);
  ViewForm.Caption := st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
  ViewForm.PLanguageIndex := PLanguageIndex;

  if DM.DataSet_main['NAME_CATEGORY_CLASS'] <> null
   then ViewForm.NameEdit.Text := DM.DataSet_main['NAME_CATEGORY_CLASS'];
  if DM.DataSet_main['PEOPLES'] <> null
   then ViewForm.PeopleEdit.Text := IntToStr(DM.DataSet_main['PEOPLES']);
  if DM.DataSet_main['PLACES'] <> null
   then ViewForm.PlaceEdit.Text  := FloatToStr(DM.DataSet_main['PLACES']);
  ViewForm.ShowModal;

  if ViewForm.ModalResult = mrOK then
   begin
    start_sql_monitor;
    DM.StoredProc.StoredProcName := 'ST_INI_CATEGORY_CLASS_UPDATE';
    DM.StoredProc.Transaction.StartTransaction;
    DM.StoredProc.Prepare;
    DM.StoredProc.ParamByName('ID_CATEGORY_CLASS').AsInteger  := id;
    DM.StoredProc.ParamByName('NAME_CATEGORY_CLASS').AsString := ViewForm.NameEdit.Text;
    DM.StoredProc.ParamByName('PEOPLES').AsInteger            := StrToInt(ViewForm.PeopleEdit.Text);
    DM.StoredProc.ParamByName('PLACES').AsFloat               := StrToFloat(ViewForm.PlaceEdit.Text);
    DM.StoredProc.ExecProc;
    try
     DM.StoredProc.Transaction.Commit;
     except
      on E:Exception do
       begin
        stShowMessage('Error in ST_INI_CATEGORY_CLASS_UPDATE',e.Message,mtError,[mbOK]);
        DM.Transaction_write.Rollback;
        Send_mail(e.Message);
       end;
    end;
    DM.StoredProc.Close;
    stop_sql_monitor;

    RefreshButtonClick(self);
    DM.DataSet_main.Locate('ID_CATEGORY_CLASS', id, []);
   end;
  ViewForm.Free;
end;

procedure TfrmClass_Kat.DeleteButtonClick(Sender: TObject);
var
  Id : Int64;
   i : Byte;
begin
  if not Is_Admin then
   if CheckPermission('/ROOT/StudCity/St_Sp','Del') <> 0
    then
     begin
      messagebox(handle,
      pchar(st_Consts_Messages.st_NotHaveRights[PLanguageIndex]
      +#13+ st_Consts_Messages.st_GoToAdmin[PLanguageIndex]),
      pchar(st_Consts_Messages.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     end;

  if DM.DataSet_main.RecordCount = 0 then Exit;

  Screen.Cursor:=crHourGlass;

  DM.DataSet_read.Close;
  DM.DataSet_read.SelectSQL.Clear;
  DM.DataSet_read.SQLs.SelectSQL.Text:='select * from ST_INI_CATEGORY_CLASS_CAN_DELET(:ID_CATEGORY_CLASS)';
  DM.DataSet_read.ParamByName('ID_CATEGORY_CLASS').AsInt64 := DM.DataSet_main['ID_CATEGORY_CLASS'];
  DM.DataSet_read.Open;

  if DM.DataSet_read['Can'] = 0 then
   begin
    Screen.Cursor:=crDefault;
    ShowMessage(PChar(st_ConstUnit.st_mess_NoItemDelete[PLanguageIndex]));
    DM.DataSet_read.Close;
    exit;
   end;
  DM.DataSet_read.Close;
  Screen.Cursor:=crDefault;

  i:= st_Common_Messages.stShowMessage(st_Confirmation_Caption[PLanguageIndex], st_warning_Delete[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit;

  start_sql_monitor;
  DM.StoredProc.StoredProcName := 'ST_INI_CATEGORY_CLASS_DELETE';
  DM.StoredProc.Transaction.StartTransaction;
  DM.StoredProc.Prepare;
  DM.StoredProc.ParamByName('ID_CATEGORY_CLASS').AsInteger := DM.DataSet_main['ID_CATEGORY_CLASS'];
  DM.StoredProc.ExecProc;
  try
   DM.StoredProc.Transaction.Commit;
   except
    on E:Exception do
      begin
       stShowMessage('Error in ST_INI_CATEGORY_CLASS_DELETE',e.Message,mtError,[mbOK]);
       DM.Transaction_write.Rollback;
       Send_mail(e.Message);
      end;
  end;
  DM.StoredProc.Close;
  stop_sql_monitor;
  
  id := cxGrid1DBTableView1.DataController.FocusedRowIndex-1;
  RefreshButtonClick(self);
  DM.DataSet_main.Locate('ID_CATEGORY_CLASS', id, []);
end;

procedure TfrmClass_Kat.RefreshButtonClick(Sender: TObject);
var
  id : Int64;
begin
  Screen.Cursor:=crHourGlass;

  id := -1;
  if DM.DataSet_main.RecordCount <> 0
   then id := DM.DataSet_main['ID_CATEGORY_CLASS'];

  DM.DataSet_main.Close;
  DM.DataSet_main.SQLs.SelectSQL.Text := 'SELECT * FROM ST_INI_CATEGORY_CLASS_SELECT';
  DM.DataSet_main.Open;

  DM.DataSet_main.Locate('ID_CATEGORY_CLASS', id, []);

  Screen.Cursor:=crDefault;
end;

procedure TfrmClass_Kat.Act_helpExecute(Sender: TObject);
begin
  Load_Help(self, DM.DB.Handle, 'sp_class_kat');
end;

end.
