unit MainSpSchFormKassa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxControls,
  cxInplaceContainer, cxTLData, cxDBTL, ComCtrls, ToolWin, cxClasses,
  cxGridBandedTableView, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, DB, FIBDataSet, pFIBDataSet, ImgList, ActnList, cxMaskEdit,
  MainSpSChClassKassa, Menus, Ibase, cxLookAndFeelPainters,
  StdCtrls, cxRadioGroup, cxButtons, cxContainer, cxEdit, cxTextEdit,
  cxDropDownEdit, cxMRUEdit, ExtCtrls, cxFilter, cxData, cxDataStorage,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxGridCustomView, cxGrid, cxLabel, cxSplitter, Un_R_file_Alex;

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
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    DataSetSch: TpFIBDataSet;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn3: TcxGridDBColumn;
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
    cxSplitter1: TcxSplitter;
    DataSetMainID_SP_KASS: TFIBBCDField;
    DataSetMainFULL_NAME_KASS: TFIBStringField;
    DataSetMainSHORT_NAME_KASS: TFIBStringField;
    DataSetMainID_SERVER: TFIBStringField;
    DataSetMainDATE_BLOK_SALDO_END: TFIBDateTimeField;
    DataSetMainID_USER_BLOK_SALDO_END: TFIBIntegerField;
    DataSetMainDATE_CLOSE: TFIBDateTimeField;
    DataSetMainID_USER_CLOSE_KASS: TFIBIntegerField;
    ToolButton1: TToolButton;
    DataSetSchID_SCH: TFIBBCDField;
    DataSetSchDATE_BEG: TFIBDateField;
    DataSetSchDATE_END: TFIBDateField;
    DataSetSchID_SP_KASS: TFIBBCDField;
    DataSetSchSCH_TITLE: TFIBStringField;
    DataSetSchSCH_NUM: TFIBStringField;
    DataSetSchFLAG_DEFAULT: TFIBIntegerField;
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionDeleteExecute(Sender: TObject);
    procedure ActionChangeExecute(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
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
uses AddSpJ4Kassa, AddSchKassa;

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

//    If m = Edit then
//    begin
//         ToolButtonTake.Enabled   := false;
//    end;
//    if m = Sp then
 //   begin
//         ToolButtonTake.Enabled   := true;
//         ToolButtonAdd.Enabled    := false;
//         ToolButtonChange.Enabled := false;
 //        ToolButtonDelete.Enabled := false;
//    end;

    Caption                      := Un_R_file_Alex.KASSA_SP_AND_SCH;
    ActionClose.Caption          := Un_R_file_Alex.MY_BUTTON_CLOSE;
    ActionRefresh.Caption        := Un_R_file_Alex.MY_BUTTON_REFRESH;
    ActionCancel.Caption         := Un_R_file_Alex.N_AUTOKOD_FORM_CANCLE;

    ActionAdd.Caption            := Un_R_file_Alex.KASSA_ADD_KASSA;
    ActionChange.Caption         := Un_R_file_Alex.KASSA_CHANGE_KASSA;
    ActionDelete.Caption         := Un_R_file_Alex.KASSA_DELETE_KASSA;
    ActionAddSch.Caption         := Un_R_file_Alex.KASSA_ADD_SCH;
    ActionChangeSch.Caption      := Un_R_file_Alex.KASSA_CHANGE_SCH;
    ActionDeleteSch.Caption      := Un_R_file_Alex.KASSA_DELETE_SCH;
    cxLabel1.Caption             := Un_R_file_Alex.KASSA_EXISTS_SCH;
    cxLabel2.Caption             := Un_R_file_Alex.KASSA_EXISTS_KASSA;
    cxGrid1DBTableView1DBColumn1.Caption := Un_R_file_Alex.KASSA_SHORT_NAME;
    cxGrid1DBTableView1DBColumn2.Caption := Un_R_file_Alex.KASSA_FULL_NAME;
    cxGrid1DBTableView1DBColumn3.Caption := Un_R_file_Alex.KASSA_KOD;
    cxGrid1DBTableView1DBColumn4.Caption := Un_R_file_Alex.KASSA_DATE_BEGIN;
    cxGrid2DBTableView1DBColumn1.Caption := Un_R_file_Alex.KASSA_SCH;
    cxGrid2DBTableView1DBColumn2.Caption := Un_R_file_Alex.KASSA_SCH_NAME;
    cxGrid2DBTableView1DBColumn3.Caption := Un_R_file_Alex.KASSA_DATE_BEGIN;

    DataSetSch.SQLs.SelectSQL.Text := 'select * from KASSA_SELECT_ALL_SCH(?ID_SP_KASS)';
    DataSetMain.Transaction.StartTransaction;
    DataSetMain.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SP_KASS';
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
{var
    id_del:int64;}
begin
    if DataSetMain.IsEmpty then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.N_AUTOKOD_FORM_ERROR_DEL), PChar(Un_R_file_Alex.N_AUTOKOD_FORM_WARNING), 16);
        exit;
    end
    else begin
        if MessageBox(Handle,Pchar(Un_R_file_Alex.N_AUTOKOD_MESSAGE_DEL+' - '+DataSetMain.FieldByName('NAME').AsString),Pchar(Un_R_file_Alex.N_AUTOKOD_MESSAGE_OK),mb_YesNO)=mrYes
        then
        begin
            // Удаляем поле
            myclass.DeleteVetka(DataSetMain['ID_SP_KASS']);
            ActionRefreshExecute(Sender);
        end;
    end;
end;

procedure TfmForm.ActionChangeExecute(Sender: TObject);
var
    T : TfmSpAdd;
begin
    if (not DataSetMain.IsEmpty) and (cxGrid1.IsFocused) then
    begin
        T := TfmSpAdd.Create(self, myclass, self, Change);
        T.ShowModal;
//        T.
        T.Free;
    end;
end;

procedure TfmForm.ActionAddExecute(Sender: TObject);
var
    T : TfmSpAdd;
begin
    T := TfmSpAdd.Create(self, myclass, self, Add);
    T.ShowModal;
    T.Free;
end;

destructor TfmForm.Destroy;
begin
    inherited;
end;

procedure TfmForm.ActionAddSChExecute(Sender: TObject);
var
    T : TfmAddsch;
begin
    if not DataSetMain.isEmpty then
    begin
        T := TfmAddsch.Create(self, myclass, self, addSch);
        T.ShowModal;
        T.Free;
    end;
end;

procedure TfmForm.ActionChangeSchExecute(Sender: TObject);
var
    T : TfmAddsch;
begin
    if (not DataSetSch.IsEmpty) and (cxGrid2.IsFocused)then
    begin
        T := TfmAddsch.Create(self, myclass, self, ChangeSch);
        T.ShowModal;
        T.Free;
    end;
end;

procedure TfmForm.ActionDeleteSchExecute(Sender: TObject);
begin
//
end;

end.
