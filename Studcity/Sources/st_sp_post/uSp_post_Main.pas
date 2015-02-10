unit uSp_post_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, FIBQuery, pFIBQuery,
  pFIBStoredProc, ActnList, FIBDataSet, pFIBDataSet, cxContainer, cxLabel,
  ExtCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  ImgList, ComCtrls, ToolWin, cxGridCustomPopupMenu, cxGridPopupMenu, Menus,
  StdCtrls, FIBDatabase, pFIBDatabase,IBase, dxStatusBar, st_ConstUnit,
  uSp_post_AE, st_common_funcs, st_common_types, dxBar, dxBarExtItems,
  uSp_post_DM, Placemnt, st_Common_Messages, st_consts_messages;

type
  TfrmPost = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1ID_POST: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_POST: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Panel1: TPanel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    DataSource: TDataSource;
    ActionList1: TActionList;
    AddAction: TAction;
    EditAction: TAction;
    DeleteAction: TAction;
    RefreshAction: TAction;
    ExitAction: TAction;
    ImageListOfPost: TImageList;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    DeleteAction1: TMenuItem;
    RefreshAction1: TMenuItem;
    N3: TMenuItem;
    PopupImageList: TImageList;
    HotKey_StatusBar: TdxStatusBar;
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
    Act_help: TAction;
    procedure SelectButtonClick(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Act_helpExecute(Sender: TObject);
  private
    PLanguageIndex: byte;
    DM : TfrmPost_DM;
    is_admin : Boolean;
    procedure FormIniLanguage();
  public
    res : Variant;
    constructor Create (aParameter : TstSimpleParams);reintroduce;
  end;

var
  frmPost: TfrmPost;

implementation

{$R *.dfm}

procedure TfrmPost.FormIniLanguage();
begin
 // индекс языка (1-укр, 2 - рус)
 PLanguageIndex := stLanguageIndex;
 Caption        := st_ConstUnit.st_CatTypeSprav[PLanguageIndex];

 //названия кнопок
 ExitButton.Caption        := st_ConstUnit.st_ExitBtn_Caption[PLanguageIndex];
 ExitButton.Hint           := st_ConstUnit.st_ExitBtn_Caption[PLanguageIndex];
 AddButton.Caption         := st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 AddButton.Hint            := st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 EditButton.Caption        := st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 EditButton.Hint           := st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 DeleteButton.Caption      := st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
 DeleteButton.Hint         := st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
 RefreshButton.Caption     := st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];
 RefreshButton.Hint        := st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];
 SelectButton.Caption      := st_ConstUnit.st_Select_Caption[PLanguageIndex];
 SelectButton.Hint         := st_ConstUnit.st_Select_Caption[PLanguageIndex];

 HotKey_StatusBar.Panels[0].Text:=  st_ConstUnit.st_InsertBtn_ShortCut[PLanguageIndex]  + st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 HotKey_StatusBar.Panels[1].Text:=  st_ConstUnit.st_EditBtn_ShortCut[PLanguageIndex]    + st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 HotKey_StatusBar.Panels[2].Text:=  st_ConstUnit.st_DeleteBtn_ShortCut[PLanguageIndex]  + st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
 HotKey_StatusBar.Panels[3].Text:=  st_ConstUnit.st_RefreshBtn_ShortCut[PLanguageIndex] + st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];
 HotKey_StatusBar.Panels[4].Text:=  st_ConstUnit.st_Select_Caption[PLanguageIndex]      + st_ConstUnit.st_EnterBtn_ShortCut[PLanguageIndex];
 HotKey_StatusBar.Panels[5].Text:=  st_ConstUnit.st_ExitBtn_ShortCut[PLanguageIndex]    + st_ConstUnit.st_ExitBtn_Caption[PLanguageIndex];
 HotKey_StatusBar.Hint :=           st_ConstUnit.st_HotKeys[PLanguageIndex];

 // пошел грид
 cxGrid1DBTableView1NAME_POST.Caption :=    st_ConstUnit.st_NameLable[PLanguageIndex];

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

constructor TfrmPost.Create(Aparameter : TstSimpleParams);
begin
  inherited Create(Aparameter.Owner);
  Screen.Cursor:= crHourGlass;

  DM := TfrmPost_DM.Create(self);
  DM.DB.Handle := aParameter.Db_Handle;
  DM.DB.Connected := True;
  DM.Transaction_Read.StartTransaction;

  is_admin := aParameter.is_admin;
  
  RefreshButtonClick(self);

  cxGrid1DBTableView1.DataController.DataSource := DM.DataSource_main;

  Screen.Cursor:= crDefault;

  StFormStorage.RestoreFormPlacement;
end;

procedure TfrmPost.ExitButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPost.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  stFormStorage.SaveFormPlacement;
  if FormStyle = fsMDIChild
   then action:=caFree
   else DM.Free;
end;

procedure TfrmPost.AddButtonClick(Sender: TObject);
var
 ViewForm : TfrmPost_AE;
 id : Int64;
begin
{  if not Is_Admin then
   if CheckPermission('/ROOT/StudCity/St_Sp','Add') <> 0
    then
     begin
      messagebox(handle,
      pchar(st_Consts_Messages.st_NotHaveRights[PLanguageIndex]
      +#13+ st_Consts_Messages.st_GoToAdmin[PLanguageIndex]),
      pchar(st_Consts_Messages.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     end; }

  ViewForm := TfrmPost_AE.Create(Self);
  ViewForm.Caption := st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
  ViewForm.PLanguageIndex := PLanguageIndex;
  ViewForm.ShowModal;

  if ViewForm.ModalResult = mrOK then
  begin
   DM.Transaction_write.StartTransaction;
   DM.StoredProc.StoredProcName := 'ST_POST_INSERT';
   DM.StoredProc.Prepare;
   DM.StoredProc.ParamByName('NAME_POST').AsString := ViewForm.NameEdit.Text;

   DM.StoredProc.ExecProc;
   id := DM.StoredProc.FieldByName('ID_POST').AsInteger;
   try
    DM.Transaction_write.Commit;
    except
     on E:Exception do
       begin
        stShowMessage('Error in ST_POST_INSERT',e.Message,mtError,[mbOK]);
        DM.Transaction_write.Rollback;
        Send_mail(e.Message);
       end;
   end;

   DM.StoredProc.Close;

   RefreshButtonClick(self);
   DM.DataSet_main.Locate('ID_POST', id, []);
  end;
  ViewForm.Free;
end;

procedure TfrmPost.EditButtonClick(Sender: TObject);
var
  id       : Int64;
  ViewForm : TfrmPost_AE;
begin
{  if not Is_Admin then
   if CheckPermission('/ROOT/StudCity/St_Sp','Edit') <> 0
    then
     begin
      messagebox(handle,
      pchar(st_Consts_Messages.st_NotHaveRights[PLanguageIndex]
      +#13+ st_Consts_Messages.st_GoToAdmin[PLanguageIndex]),
      pchar(st_Consts_Messages.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     end;  }

  if DM.DataSet_main.RecordCount = 0 then Exit;

  ViewForm := TfrmPost_AE.Create(Self);
  ViewForm.Caption := st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
  ViewForm.PLanguageIndex := PLanguageIndex;

  id := DM.DataSet_main['ID_POST'];

  if DM.DataSet_main['NAME_POST']<> null
   then ViewForm.NameEdit.Text := DM.DataSet_main['NAME_POST'];

  ViewForm.ShowModal;

  if ViewForm.ModalResult = mrOK then
   begin
    DM.StoredProc.StoredProcName := 'ST_POST_UPDATE';
    DM.StoredProc.Transaction.StartTransaction;
    DM.StoredProc.Prepare;
    DM.StoredProc.ParamByName('ID_POST').AsInteger := id;
    DM.StoredProc.ParamByName('NAME_POST').AsString := ViewForm.NameEdit.Text;

    DM.StoredProc.ExecProc;
    try
     DM.StoredProc.Transaction.Commit;
    except
     on E:Exception do
       begin
        stShowMessage('Error in ST_POST_UPDATE',e.Message,mtError,[mbOK]);
        DM.Transaction_write.Rollback;
        Send_mail(e.Message);
       end;
    end;
    DM.StoredProc.Close;

    RefreshButtonClick(self);
    DM.DataSet_main.Locate('ID_POST', id, []);
   end;
  ViewForm.Free;
end;

procedure TfrmPost.DeleteButtonClick(Sender: TObject);
var
  id : Int64;
  //i  : byte;
begin
 { if not Is_Admin then
   if CheckPermission('/ROOT/StudCity/St_Sp','Del') <> 0
    then
     begin
      messagebox(handle,
      pchar(st_Consts_Messages.st_NotHaveRights[PLanguageIndex]
      +#13+ st_Consts_Messages.st_GoToAdmin[PLanguageIndex]),
      pchar(st_Consts_Messages.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     end; }

  If MessageBox(Handle,PChar(st_ConstUnit.st_DeletePromt[PLanguageIndex]),PChar(st_ConstUnit.st_Confirmation_Caption[PLanguageIndex]),MB_YESNO or MB_ICONQUESTION)= mrNo
   then exit;
  DM.StoredProc.StoredProcName := 'ST_POST_DELETE';
  DM.StoredProc.Transaction.StartTransaction;
  DM.StoredProc.Prepare;
  DM.StoredProc.ParamByName('ID_POST').AsInteger := DM.DataSet_main['ID_POST'];
  DM.StoredProc.ExecProc;
  try
   DM.StoredProc.Transaction.Commit;
   except
   on E:Exception do
       begin
        stShowMessage('Error in ST_POST_DELETE',e.Message,mtError,[mbOK]);
        DM.Transaction_write.Rollback;
        Send_mail(e.Message);
       end;
  end;
  DM.StoredProc.Close;

  id := cxGrid1DBTableView1.DataController.FocusedRowIndex-1;
  RefreshButtonClick(self);
  
  DM.DataSet_main.Locate('ID_POST', id, []);
end;

procedure TfrmPost.RefreshButtonClick(Sender: TObject);
var
  Id : Int64;
begin
  Screen.Cursor:=crHourGlass;

  Id := -1;

  if DM.DataSet_main.RecordCount <> 0
   then ID := DM.DataSet_main['ID_POST'];

  DM.DataSet_main.Close;
  DM.DataSet_main.sqls.SelectSql.Text := 'select * from ST_POST_SELECT';
  DM.DataSet_main.Open;

  DM.DataSet_main.Locate('ID_POST', id, []);

  Screen.Cursor:=crDefault;
end;

procedure TfrmPost.SelectButtonClick(Sender: TObject);
begin
 If DM.DataSet_main.RecordCount = 0 then Exit;

  Res := VarArrayCreate([0,1], varVariant);
  
  Res[0] := DM.DataSet_main['ID_POST'];
  Res[1] := DM.DataSet_main['NAME_POST'];


  ModalResult := mrOK;
end;

procedure TfrmPost.FormShow(Sender: TObject);
begin
  FormIniLanguage();
  if FormStyle = fsMDIChild then
   begin
    SelectButton.Visible := ivNever;
    cxGrid1DBTableView1.OptionsSelection.MultiSelect:= False;
   end;
end;

procedure TfrmPost.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  SelectButtonClick(self);
end;

procedure TfrmPost.Act_helpExecute(Sender: TObject);
begin
  Load_Help(self, DM.DB.Handle, 'sp_type_kat');
end;

end.
