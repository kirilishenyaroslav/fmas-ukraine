unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ComCtrls, ToolWin, ExtCtrls, cxContainer,
  cxLabel, FIBDatabase, pFIBDatabase, ActnList, ImgList, MainUnit, 
  FIBDataSet, pFIBDataSet;

type
  TfmMode = (Edit, Sp, SpEdit);
  
  TfmMainForm = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ImageList: TImageList;
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
    ActionList1: TActionList;
    ActionClose: TAction;
    ActionAdd: TAction;
    ActionChange: TAction;
    ActionDelete: TAction;
    ActionRefresh: TAction;
    ActionCancel: TAction;
    DataSource: TDataSource;
    Database: TpFIBDatabase;
    TransactionRead: TpFIBTransaction;
    Panel2: TPanel;
    cxLabel2: TcxLabel;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    DataSetMain: TpFIBDataSet;
    DataSetMainID_SP_OPERATION: TFIBBCDField;
    DataSetMainID_SCH: TFIBBCDField;
    DataSetMainID_SM: TFIBBCDField;
    DataSetMainID_RAZD: TFIBBCDField;
    DataSetMainID_ST: TFIBBCDField;
    DataSetMainID_KEKV: TFIBBCDField;
    DataSetMainNAME: TFIBStringField;
    DataSetMainFLAG_PRIHOD: TFIBIntegerField;
    DataSetMainFLAG_RASHOD: TFIBIntegerField;
    DataSetMainFLAG_FOND: TFIBIntegerField;
    DataSetMainFLAG_SYSTEM: TFIBIntegerField;
    DataSetMainFLAG_VISIBLE: TFIBIntegerField;
    DataSetMainKOD: TFIBIntegerField;
    DataSetMainSCH_TITLE: TFIBStringField;
    DataSetMainSCH_NUM: TFIBStringField;
    DataSetMainST_TITLE: TFIBStringField;
    DataSetMainST_NUM: TFIBStringField;
    DataSetMainSM_TITLE: TFIBStringField;
    DataSetMainSM_NUM: TFIBStringField;
    DataSetMainRAZD_TITLE: TFIBStringField;
    DataSetMainRAZD_NUM: TFIBStringField;
    DataSetMainKEKV_TITLE: TFIBStringField;
    DataSetMainKEKV_NUM: TFIBStringField;
    DataSetMainFLAG: TFIBStringField;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    procedure ActionRefreshExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionDeleteExecute(Sender: TObject);
    procedure ActionCloseExecute(Sender: TObject);
  private
  public
    myclass : TSpOperetionClass;
    ResValue : Variant;
    constructor Create(AOwner: TComponent; mclass: TSpOperetionClass; m : TfmMode); reintroduce; overload;
    destructor Destroy; override;
  end;



implementation

{$R *.dfm}

{ TfmMainForm }

constructor TfmMainForm.Create(AOwner: TComponent;
  mclass: TSpOperetionClass; m: TfmMode);
begin
    inherited Create (AOwner);
    myclass := mclass;

    Database.Handle:=myclass.Class_Database.Handle;
    TransactionRead.DefaultDatabase := Database;

    Caption                      := resources_unit.KASSA_SP_AND_SCH;
    ActionClose.Caption          := resources_unit.PUB_BUTTON_CLOSE;
    ActionRefresh.Caption        := resources_unit.PUB_BUTTON_REFRESH;
    ActionCancel.Caption         := resources_unit.AUTOKOD_FORM_CANCLE;

    ActionAdd.Caption            := resources_unit.KASSA_ADD_KASSA;
    ActionChange.Caption         := resources_unit.KASSA_CHANGE_KASSA;
    ActionDelete.Caption         := resources_unit.KASSA_DELETE_KASSA;
//    cxLabel1.Caption             := resources_unit.KASSA_EXISTS_SCH;
    cxLabel2.Caption             := resources_unit.KASSA_EXISTS_KASSA;
    cxGrid1DBTableView1DBColumn1.Caption := resources_unit.KASSA_SHORT_NAME;
    cxGrid1DBTableView1DBColumn2.Caption := resources_unit.KASSA_FULL_NAME;
    cxGrid1DBTableView1DBColumn3.Caption := resources_unit.KASSA_KOD;


    DataSetMain.Transaction.StartTransaction;
    DataSetMain.open;
end;

destructor TfmMainForm.Destroy;
begin

  inherited;
end;

procedure TfmMainForm.ActionRefreshExecute(Sender: TObject);
begin
        DataSetMain.CloseOpen(true);
end;

procedure TfmMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    DataSetMain.Close;
    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TfmMainForm.ActionDeleteExecute(Sender: TObject);
begin
    if DataSetMain.IsEmpty then
    begin
        MessageBox(Handle, PChar(resources_unit.AUTOKOD_FORM_ERROR_DEL), PChar(resources_unit.AUTOKOD_FORM_WARNING), 16);
        exit;
    end
    else begin
        if MessageBox(Handle,Pchar(resources_unit.AUTOKOD_MESSAGE_DEL+' - '+DataSetMain.FieldByName('NAME').AsString),Pchar(resources_unit.AUTOKOD_MESSAGE_OK),mb_YesNO)=mrYes
        then
        begin
            // Удаляем поле
            myclass.Delete(DataSetMain['ID_SP_OPERATION']);
            ActionRefreshExecute(Sender);
        end;
    end;
end;

procedure TfmMainForm.ActionCloseExecute(Sender: TObject);
begin
    Close;
end;

end.
