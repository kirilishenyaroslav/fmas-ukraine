unit MainSpSchForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxControls,
  cxInplaceContainer, cxTLData, cxDBTL, ComCtrls, ToolWin, cxClasses,
  cxGridBandedTableView, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, DB, FIBDataSet, pFIBDataSet, ImgList, ActnList, cxMaskEdit,
  MainSpSChClass, Menus, Ibase, cxLookAndFeelPainters,
  StdCtrls, cxRadioGroup, cxButtons, cxContainer, cxEdit, cxTextEdit,
  cxDropDownEdit, cxMRUEdit, ExtCtrls, cxFilter, cxData, cxDataStorage,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxGridCustomView, cxGrid, cxLabel, Un_R_file_Alex;

type
  TfmSpRazdelMode = (Edit, Sp, SpEdit);

  TfmForm = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolBar2: TToolBar;
    ToolButtonAdd: TToolButton;
    ToolButtonChange: TToolButton;
    ToolButtonDelete: TToolButton;
    ToolButtonRefresh: TToolButton;
    ToolButtonExit: TToolButton;
    ActionList1: TActionList;
    ImageList: TImageList;
    Database: TpFIBDatabase;
    DataSetMain: TpFIBDataSet;
    TransactionRead: TpFIBTransaction;
    ActionClose: TAction;
    ActionAdd: TAction;
    ActionChange: TAction;
    ActionDelete: TAction;
    ActionRefresh: TAction;
    DataSource: TDataSource;
    PopupButton: TPopupMenu;
    ActionAdd1: TMenuItem;
    ActionChange1: TMenuItem;
    ActionClose1: TMenuItem;
    ActionRefresh1: TMenuItem;
    ActionCancel: TAction;
    ActionCancel1: TMenuItem;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn2: TcxGridDBColumn;
    Splitter1: TSplitter;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    DataSetSch: TpFIBDataSet;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    DataSetMainID_J4_SP_JO: TFIBBCDField;
    DataSetMainFULL_NAME: TFIBStringField;
    DataSetMainSHORT_NAME: TFIBStringField;
    DataSetMainDATA_OPEN: TFIBDateField;
    DataSetMainSYSTEM_OPEN: TFIBSmallIntField;
    DataSetMainKOD: TFIBStringField;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ActionAddSCh: TAction;
    ActionChangeSch: TAction;
    ActionDeleteSch: TAction;
    DataSourceSch: TDataSource;
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
    DataSetSchID_SCH: TFIBBCDField;
    DataSetSchDATE_BEG: TFIBDateField;
    DataSetSchDATE_END: TFIBDateField;
    DataSetSchID_SP_KASS: TFIBBCDField;
    DataSetSchSCH_TITLE: TFIBStringField;
    DataSetSchSCH_NUM: TFIBStringField;
    cxGrid2DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn4: TcxGridDBColumn;
    DataSetSchSCH_DEFAULT: TFIBIntegerField;
    DataSetSchKOD_SCH_AO: TFIBStringField;
    cxGrid2DBTableView1DBColumn5: TcxGridDBColumn;
    DataSetSchID_JN_JO_SCH: TFIBIntegerField;
    StoredProc: TpFIBStoredProc;
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionDeleteExecute(Sender: TObject);
    procedure ActionChangeExecute(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure DataSetMainAfterRefresh(DataSet: TDataSet);
    procedure ActionAddSChExecute(Sender: TObject);
    procedure ActionChangeSchExecute(Sender: TObject);
    procedure ActionDeleteSchExecute(Sender: TObject);
  private
  public
    myclass : TSpRazdClass;
    ResValue : Variant;
    constructor Create(AOwner: TComponent; mclass: TSpRazdClass; DBHandle: TISC_DB_HANDLE{TpFIBDatabase}; ReadTr : TISC_TR_HANDLE{TpFIBTransaction}; m : TfmSpRazdelMode); reintroduce; overload;
    destructor Destroy; override;
  end;

implementation
uses AddSpJ4, Addsch, Accmgmt;

{$R *.dfm}

procedure TfmForm.ActionCloseExecute(Sender: TObject);
begin
    Close;
end;

constructor TfmForm.Create(AOwner: TComponent; mclass: TSpRazdClass;
  DBHandle: TISC_DB_HANDLE{TpFIBDatabase}; ReadTr: {TpFIBTransaction}TISC_TR_HANDLE; m: TfmSpRazdelMode);
begin
    inherited Create (AOwner);
    myclass := mclass;

    Database.Handle:=DBHandle;
    TransactionRead.DefaultDatabase := Database;
    Database.DefaultTransaction     := TransactionRead;

    DataSetSch.Database             := Database;
    DataSetSch.Transaction          := TransactionRead;

    DataSetMain.Database            := Database;
    DataSetMain.Transaction         := TransactionRead;

    StoredProc.DataBase             := Database;
    StoredProc.Transaction          := TransactionRead;

    TransactionRead.StartTransaction;

    Caption                      := Un_R_file_Alex.J4_SP_RAZDELENIE_FORM_CAPTION;
    ActionAdd.Caption            := Un_R_file_Alex.MY_BUTTON_ADD;
    ActionClose.Caption          := Un_R_file_Alex.MY_BUTTON_CLOSE;
    ActionChange.Caption         := Un_R_file_Alex.MY_BUTTON_EDIT;
    ActionDelete.Caption         := Un_R_file_Alex.My_BUTTON_DELETE;
    ActionRefresh.Caption        := Un_R_file_Alex.MY_BUTTON_REFRESH;
    ActionCancel.Caption         := Un_R_file_Alex.J4_FORM_CANCLE;

    ActionAddSCh.Caption         := Un_R_file_Alex.MY_ADD_SCH;
    ActionChangeSch.Caption      := Un_R_file_Alex.MY_EDIT_SCH;
    ActionDeleteSch.Caption      := Un_R_file_Alex.MY_DELETE_SCH;

    DataSetSch.SQLs.SelectSQL.Text :='SELECT * FROM J4_SELECT_ALL_SCH(?ID_J4_SP_JO)';
    DataSetMain.Close;
    DataSetMain.SQLs.SelectSQL.Text :='SELECT * FROM J4_SP_JO where system_open='+inttostr(1);
    DataSetMain.open;

end;

procedure TfmForm.ActionCancelExecute(Sender: TObject);
begin
//
end;

procedure TfmForm.ActionRefreshExecute(Sender: TObject);
begin
        DataSetMain.CloseOpen(true);
end;

procedure TfmForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    DataSetMain.Close;
    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TfmForm.ActionDeleteExecute(Sender: TObject);
var
    error : integer;
    id_jo : int64;
begin
    error := Accmgmt.fibCheckPermission('/ROOT/JO4/Setup_j4/Setup_sys','Del');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.MY_MESSAGE_WARNING_DEL), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;

    if DataSetMain.IsEmpty then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.J4_FORM_ERROR_DEL), PChar(Un_R_file_Alex.J4_FORM_WARNING), 16);
        exit;
    end
    else begin
        if MessageBox(Handle,Pchar(Un_R_file_Alex.J4_MESSAGE_DEL+' - '+DataSetMain.FieldByName('FULL_NAME').AsString),Pchar(Un_R_file_Alex.J4_MESSAGE_OK),mb_YesNO)=mrYes
        then
        begin
            // Удаляем поле
            try
                id_jo := DataSetMain['ID_J4_SP_JO'];
                StoredProc.StoredProcName := 'J4_SP_JO_DELETE';
                StoredProc.Prepare;
                StoredProc.ParamByName('D_ID_J4_SP_JO').AsInt64   := id_jo;
                StoredProc.ExecProc;
                TransactionRead.Commit;
            except
                begin
                   TransactionRead.Rollback;
                   Showmessage('При видалены виникла помилка');
                   exit;
                end;
            end;
            ActionRefreshExecute(Sender);
            DataSetMain.Locate('ID_J4_SP_JO', DataSetMain['ID_J4_SP_JO'], []);
        end;
    end;
end;

procedure TfmForm.ActionChangeExecute(Sender: TObject);
var
    T : TfmSpAdd;
    error : integer;
begin
    error := Accmgmt.fibCheckPermission('/ROOT/JO4/Setup_j4/Setup_sys','Edit');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.MY_MESSAGE_WARNING_EDIT), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
    
    if (not DataSetMain.IsEmpty) and (cxGrid1.IsFocused) then
    begin
        T := TfmSpAdd.Create(self, myclass, self, ChangeAvanceSystem);
        T.ShowModal;
        T.Free;
    end;
end;

procedure TfmForm.ActionAddExecute(Sender: TObject);
var
    T : TfmSpAdd;
    error : integer;
begin
    error := Accmgmt.fibCheckPermission('/ROOT/JO4/Setup_j4/Setup_sys','Add');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.MY_MESSAGE_WARNING_ADD), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
    
    T := TfmSpAdd.Create(self, myclass, self, AddAvanceSystem);
    T.ShowModal;
    T.Free;
end;

destructor TfmForm.Destroy;
begin
    inherited;
end;

procedure TfmForm.DataSetMainAfterRefresh(DataSet: TDataSet);
var
    id : int64;
begin
//        id := DataSetMain['ID_J4_SP_JO'];
    DataSetMain.CloseOpen(false);
{        DataSetSch.Close;

        DataSetSch.SQLs.SelectSQL.Text := 'select * from  J4_SELECT_ALL_SCH(' + IntToStr(id) + ')';
        DataSetSch.Open;}
end;

procedure TfmForm.ActionAddSChExecute(Sender: TObject);
var
    T : TfmAddsch;
    error : integer;
begin
    error := Accmgmt.fibCheckPermission('/ROOT/JO4/Setup_j4/Setup_sys','Add');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.MY_MESSAGE_WARNING_ADD), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
    
    T := TfmAddsch.Create(self, Database, myclass, self, add);
    T.ShowModal;
    T.Free;
end;

procedure TfmForm.ActionChangeSchExecute(Sender: TObject);
var
    T : TfmAddsch;
    error : integer;
begin
    error := Accmgmt.fibCheckPermission('/ROOT/JO4/Setup_j4/Setup_sys','Edit');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.MY_MESSAGE_WARNING_EDIT), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
    
    if (not DataSetSch.IsEmpty) and (cxGrid2.IsFocused)then
    begin
        T := TfmAddsch.Create(self,Database, myclass, self, Change);
        T.ShowModal;
        T.Free;
    end;
end;

procedure TfmForm.ActionDeleteSchExecute(Sender: TObject);
var
    error : integer;
    id_jo_sch : integer;
begin
    error := Accmgmt.fibCheckPermission('/ROOT/Kassa/Sprav/Spr_kass_sys','Del');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.MY_MESSAGE_WARNING_DEL), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
    if DataSetMain.IsEmpty then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.J4_FORM_ERROR_DEL), PChar(Un_R_file_Alex.J4_FORM_WARNING), 16);
        exit;
    end
    else begin
        if MessageBox(Handle,Pchar(Un_R_file_Alex.J4_MESSAGE_DEL+' - '+ DataSetSch.FieldByName('SCH_NUM').AsString+' - '+DataSetSch.FieldByName('SCH_TITLE').AsString),Pchar(Un_R_file_Alex.J4_MESSAGE_OK),mb_YesNO)=mrYes then
        begin
            // Удаляем поле
            try
                id_jo_sch := DataSetSch.fieldByName('id_jn_jo_sch').AsInteger;
                StoredProc.StoredProcName := 'J4_SP_SCH_SYSTEM_DELETE';
                StoredProc.Prepare;
                StoredProc.ParamByName('d_id').AsInt64   := id_jo_sch;
                StoredProc.ParamByName('d_date_begin').AsDate  := DataSetSch.fieldByName('date_beg').AsdateTime;
                StoredProc.ExecProc;
                TransactionRead.Commit;
            except
                begin
                   TransactionRead.Rollback;
                   Showmessage('При видалены виникла помилка');
                   exit;
                end;
            end;
            ActionRefreshExecute(Sender);
            DataSetMain.Locate('ID_J4_SP_JO', DataSetMain['ID_J4_SP_JO'], []);
        end;
    end;
end;

end.
