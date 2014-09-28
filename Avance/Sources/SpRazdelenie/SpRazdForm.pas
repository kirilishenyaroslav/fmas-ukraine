unit SpRazdForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxControls,
  cxInplaceContainer, cxTLData, cxDBTL, ComCtrls, ToolWin, cxClasses,
  cxGridBandedTableView, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, DB, FIBDataSet, pFIBDataSet, ImgList, ActnList, cxMaskEdit,
  SpRazdClass, Un_R_file_Alex, Menus, Ibase, cxLookAndFeelPainters,
  StdCtrls, cxRadioGroup, cxButtons, cxContainer, cxEdit, cxTextEdit,
  cxDropDownEdit, cxMRUEdit, ExtCtrls, cxGridTableView;

type
  TfmSpRazdelMode = (Edit, Sp, SpEdit);

  TfmSpRazdForm = class(TForm)
    cxDBTreeMain: TcxDBTreeList;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolBar2: TToolBar;
    ToolButtonAdd: TToolButton;
    ToolButtonChange: TToolButton;
    ToolButtonDelete: TToolButton;
    ToolButtonRefresh: TToolButton;
    ToolButtonTake: TToolButton;
    ToolButtonExit: TToolButton;
    ActionList1: TActionList;
    ImageList: TImageList;
    Database: TpFIBDatabase;
    DataSetMain: TpFIBDataSet;
    TransactionRead: TpFIBTransaction;
    Short: TcxDBTreeListColumn;
    Full: TcxDBTreeListColumn;
    ActionClose: TAction;
    ActionAdd: TAction;
    ActionChange: TAction;
    ActionDelete: TAction;
    ActionRefresh: TAction;
    ActionTake: TAction;
    DataSourceTree: TDataSource;
    DataSetMainID_SP_AO_RASPREDELENIE: TFIBBCDField;
    DataSetMainNAME: TFIBStringField;
    DataSetMainLINKTO: TFIBBCDField;
    DataSetMainSHORT_NAME: TFIBStringField;
    PopupButton: TPopupMenu;
    ActionAdd1: TMenuItem;
    ActionChange1: TMenuItem;
    ActionClose1: TMenuItem;
    ActionRefresh1: TMenuItem;
    ActionTake1: TMenuItem;
    ActionCancel: TAction;
    ActionFind: TAction;
    ActionCancel1: TMenuItem;
    Panel1: TPanel;
    cxRadLong_name: TcxRadioButton;
    cxRadShort_name: TcxRadioButton;
    cxMRUEditFind: TcxMRUEdit;
    cxButtonFind: TcxButton;
    DataSetFind: TpFIBDataSet;
    DataSetMainSUTOCHNIE: TFIBIntegerField;
    StyleRepository: TcxStyleRepository;
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
    cxStyleYellow: TcxStyle;
    cxStyleFontBlack: TcxStyle;
    cxStyleMalin: TcxStyle;
    cxStyleBorder: TcxStyle;
    cxStylemalinYellow: TcxStyle;
    cxStyleGrid: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionTakeExecute(Sender: TObject);
    procedure cxDBTreeMainDblClick(Sender: TObject);
    procedure ActionDeleteExecute(Sender: TObject);
    procedure ActionFindExecute(Sender: TObject);
    procedure ActionChangeExecute(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure cxDBTreeMainKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
  public
    myclass : TSpRazdClass;
    ResValue : Variant;
    constructor Create(AOwner: TComponent; mclass: TSpRazdClass; DBHandle: TISC_DB_HANDLE{TpFIBDatabase}; ReadTr : TISC_TR_HANDLE{TpFIBTransaction}; m : TfmSpRazdelMode); reintroduce; overload;
    destructor Destroy; override;
  end;

procedure LoadMRUEditFromRegistry(mruEdit: TcxMRUEdit; local: boolean; const editname: string);
procedure SaveMRUEditToRegistry(mruEdit: TcxMRUEdit; local: boolean; const editname: string);


implementation
uses SpRazdAddChange;
const
    CompanyName = 'OurCompany';
    ProductName = 'OurProgram';
{$R *.dfm}
procedure SaveMRUEditToRegistry(
    mruEdit: TcxMRUEdit;
    local: boolean;
    const editname: string);
var
    i: integer;
    key, key1: HKEY;
    path: PChar;
    a: string;
begin
    if local then key := HKEY_CURRENT_USER else key := HKEY_LOCAL_MACHINE;
    path := PChar('Software\'+CompanyName+'\'+ProductName+'\'+editname);
    RegDeleteKey(key, path);
    if RegCreateKey(key, path, key1)<>ERROR_SUCCESS then exit;
    for i:=0 to mruEdit.Properties.LookupItems.Count-1 do
    begin
        a := mruEdit.Properties.LookupItems.Strings[i];
        RegSetValueEx(key1, PChar(IntToStr(i)), 0, REG_SZ, PChar(a), Length(a)+1)
    end;
    RegCloseKey(key1);
end;

procedure LoadMRUEditFromRegistry(
    mruEdit: TcxMRUEdit;
    local: boolean;
    const editname: string);
var
    i: integer;
    key, key1: HKEY;
    path: PChar;
    name, value: PChar;
    vs: DWORD;
    ns: Cardinal;
    tp: DWORD;
begin
    if local then key := HKEY_CURRENT_USER else key := HKEY_LOCAL_MACHINE;
    path := PChar('Software\'+CompanyName+'\'+ProductName+'\'+editname);
    if RegOpenKey(key, path, key1)<>ERROR_SUCCESS then exit;
    mruEdit.Properties.LookupItems.Clear;

    RegQueryInfoKey(key1, nil, nil, nil, nil, nil, nil, nil, @ns, @vs, nil, nil);
    ns := ns + 1;
    vs := vs + 1;
    GetMem(name, ns);
    GetMem(value, vs);
    i := 0;
    repeat
        if RegEnumValue(key1, i, name, ns, nil, @tp, PByte(value), @vs) = ERROR_NO_MORE_ITEMS then break;
        if tp = REG_SZ then mruEdit.Properties.LookupItems.Append(value);
        i := i + 1;
    until false;
    RegCloseKey(key1);
    FreeMem(name);
    FreeMem(value);
end;

procedure TfmSpRazdForm.ActionCloseExecute(Sender: TObject);
begin
    Close;
end;

constructor TfmSpRazdForm.Create(AOwner: TComponent; mclass: TSpRazdClass;
  DBHandle: TISC_DB_HANDLE{TpFIBDatabase}; ReadTr: {TpFIBTransaction}TISC_TR_HANDLE; m: TfmSpRazdelMode);
begin
    inherited Create (AOwner);
    myclass := mclass;

    Database.Handle:=DBHandle;
    TransactionRead.DefaultDatabase := Database;

    If m = Edit then
    begin
         ToolButtonTake.Enabled   := false;
    end;
    if m = Sp then
    begin
         ToolButtonTake.Enabled   := true;
         ToolButtonAdd.Enabled    := false;
         ToolButtonChange.Enabled := false;
         ToolButtonDelete.Enabled := false;
    end;

    Caption                      := Un_R_file_Alex.J4_SP_RAZDELENIE_FORM_CAPTION;
    ActionAdd.Caption            := Un_R_file_Alex.MY_BUTTON_ADD;
    ActionClose.Caption          := Un_R_file_Alex.MY_BUTTON_CLOSE;
//    ActionAddNewVetka.Caption  := Un_R_file_Alex.AUTOKOD_ADD_VETKA_FORM;
    ActionChange.Caption         := Un_R_file_Alex.MY_BUTTON_EDIT;
    ActionDelete.Caption         := Un_R_file_Alex.MY_BUTTON_DELETE;
    ActionRefresh.Caption        := Un_R_file_Alex.MY_BUTTON_REFRESH;
    ActionFind.Caption           := Un_R_file_Alex.MY_BUTTON_FIND;
    ActionTake.Caption           := Un_R_file_Alex.MY_BUTTON_GET;
    ActionCancel.Caption         := Un_R_file_Alex.J4_FORM_CANCLE;
    cxDBTreeMain.Columns[0].Caption.Text := Un_R_file_Alex.J4_SP_RAZDELENIE_FORM_SHORT_NAME;
    cxDBTreeMain.Columns[1].Caption.Text  := Un_R_file_Alex.J4_SP_RAZDELENIE_FORM_LONG_NAME;
    cxRadLong_name.Caption       := Un_R_file_Alex.J4_SP_RAZDELENIE_FORM_FIND_LONG_NAME;
    cxRadShort_name.Caption      := Un_R_file_Alex.J4_SP_RAZDELENIE_FORM_FIND_SHORT_NAME;

    DataSetMain.Transaction.StartTransaction;
    DataSetMain.open;

    LoadMRUEditFromRegistry(cxMRUEditFind, true, 'J4_Sp_Razd_Form_Find');
end;

procedure TfmSpRazdForm.ActionCancelExecute(Sender: TObject);
begin
//
end;

procedure TfmSpRazdForm.ActionRefreshExecute(Sender: TObject);
begin
        DataSetMain.CloseOpen(true);
end;

procedure TfmSpRazdForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    SaveMRUEditToRegistry(cxMRUEditFind, true, 'J4_Sp_Razd_Form_Find');
    DataSetMain.Close;
    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TfmSpRazdForm.ActionTakeExecute(Sender: TObject);
begin
    if DataSetMain.IsEmpty then
        ShowMessage(Un_R_file_Alex.J4_FORM_TAKE_ERROR)
    else
    begin
        cxDBTreeMainDblClick(sender);
        close;
    end;
end;

procedure TfmSpRazdForm.cxDBTreeMainDblClick(Sender: TObject);
var
    long_name, short_name : string;
    id : int64;
begin
        id         := DataSetMain['ID_SP_AO_RASPREDELENIE'];
        long_name  := DataSetMain['NAME'];
        short_name := DataSetMain['SHORT_NAME'];
        ResValue   := VarArrayOf([id, long_name, short_name]);
        close;
end;

procedure TfmSpRazdForm.ActionDeleteExecute(Sender: TObject);
var
    id_del:int64;
begin
    if DataSetMain.IsEmpty then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.J4_FORM_ERROR_DEL), PChar(Un_R_file_Alex.J4_FORM_WARNING), 16);
        exit;
    end
    else begin
        if MessageBox(Handle,Pchar(Un_R_file_Alex.J4_MESSAGE_DEL+' - '+DataSetMain.FieldByName('NAME').AsString),Pchar(Un_R_file_Alex.J4_MESSAGE_OK),mb_YesNO)=mrYes
        then
        begin
            // Удаляем поле
            if cxDBTreeMain.Selections[0].HasChildren then
            begin
                if MessageBox(Handle,Pchar(Un_R_file_Alex.J4_DEL_VETKA_ERROR+'. '+Un_R_file_Alex.J4_MESSAGE_DEL),Pchar(Un_R_file_Alex.J4_MESSAGE_OK),mb_YesNO)=IDNo then
                begin
                     exit;
                end;
            end;
            id_del := DataSetMain['LINKTO'];
            myclass.DeleteVetka(DataSetMain['ID_SP_AO_RASPREDELENIE']);
            ActionRefreshExecute(Sender);
            DataSetMain.Locate('ID_SP_AO_RASPREDELENIE',id_del, []);
        end;
    end;
end;

procedure TfmSpRazdForm.ActionFindExecute(Sender: TObject);
begin
    if cxMRUEditFind.Text = '' then
        MessageBox(Handle, PChar(Un_R_file_Alex.J4_DONT_NAME), PChar(Un_R_file_Alex.J4_FORM_WARNING), 16)
    else
    begin
        DataSetFind.Close;
        if cxRadShort_name.Checked then
              DataSetFind.SQLs.SelectSQL.Text := ' SELECT ID_SP_AO_RASPREDELENIE FROM J4_SP_AO_RASPREDELENIE WHERE SHORT_NAME = '+ QuotedStr(cxMRUEditFind.Text) +' '
        else
              DataSetFind.SQLs.SelectSQL.Text := ' SELECT ID_SP_AO_RASPREDELENIE FROM J4_SP_AO_RASPREDELENIE WHERE NAME = '+ QuotedStr(cxMRUEditFind.Text) +' ';
        DataSetFind.Open;
        if DataSetFind.IsEmpty then
           MessageBox(Handle, PChar(Un_R_file_Alex.J4_FORM_ERROR_DEL), PChar(Un_R_file_Alex.J4_FORM_WARNING), 16)
        else
           DataSetMain.Locate('ID_SP_AO_RASPREDELENIE', DataSetFind.FieldByName('ID_SP_AO_RASPREDELENIE').AsVariant, []);
        DataSetFind.Close;
    end;
end;

procedure TfmSpRazdForm.ActionChangeExecute(Sender: TObject);
var
    T : TfmSpRazdAddChange;
    id, linkto : int64;
    name, short : string;
begin
    if (not DataSetMain.IsEmpty) and (cxDBTreeMain.IsFocused)then
    begin
        id := DataSetMain['ID_SP_AO_RASPREDELENIE'];
        linkto := DataSetMain['LINKTO'];
        name := DataSetMain['NAME'];
        short := DataSetMain['SHORT_NAME'];
        T := TfmSpRazdAddChange.Create(self, myclass, self, change, name, short, id, linkto);
        T.ShowModal;
        T.Free;
    end;
end;

procedure TfmSpRazdForm.ActionAddExecute(Sender: TObject);
var
    T : TfmSpRazdAddChange;
    linkto : int64;
begin
    if DataSetMain.IsEmpty then
    begin
        T := TfmSpRazdAddChange.Create(self, myclass, self, add, '', '', 0, 0);
        T.ShowModal;
        T.Free;
    end;

    if (not DataSetMain.IsEmpty) and (cxDBTreeMain.IsFocused) then
    begin
        if MessageBox(Handle, PChar(Un_R_file_Alex.J4_SP_RAZDELENIE_ADD_NEW_MESS), PChar(Un_R_file_Alex.J4_SP_RAZDELENIE_MESSAGA), MB_YESNO or MB_ICONQUESTION) = IDYES then
        begin
            T := TfmSpRazdAddChange.Create(self, myclass, self, add, '', '', 0, 0);
            T.ShowModal;
            T.Free;
        end else
        begin
            linkto := DataSetMain['ID_SP_AO_RASPREDELENIE'];
            T := TfmSpRazdAddChange.Create(self, myclass, self, add, '', '', 0, linkto);
            T.ShowModal;
            T.Free;
        end;
    end;
end;

destructor TfmSpRazdForm.Destroy;
begin
    if FormStyle = fsMDIChild then myclass.Free;
    inherited;
end;

procedure TfmSpRazdForm.cxDBTreeMainKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (KEY=VK_LEFT) then
    begin
       if cxDBTreeMain.FocusedNode<>nil
           then cxDBTreeMain.FocusedNode.Collapse(true);
    end;
    if (KEY=VK_RIGHT) then
    begin
       if cxDBTreeMain.FocusedNode<>nil
           then cxDBTreeMain.FocusedNode.Expand(false);
    end;
end;

end.
