unit BankNastroikaTranz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ibase, FIBDatabase, pFIBDatabase, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery, pFIBStoredProc, ActnList,
  cxGridTableView, ImgList, cxContainer, cxLabel, ExtCtrls, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridDBTableView, cxGrid, ComCtrls, ToolWin, cxSplitter, Placemnt;

type
  TfmNasroikaTranz = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton6: TToolButton;
    ToolButton5: TToolButton;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    ImageList: TImageList;
    TransactionRead: TpFIBTransaction;
    DataSource: TDataSource;
    Database: TpFIBDatabase;
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
    ActionDel: TAction;
    ActionRefresh: TAction;
    pFIBStoredProc1: TpFIBStoredProc;
    DataSetMain: TpFIBDataSet;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridDBTableView1DBColumn4: TcxGridDBColumn;
    cxGridDBTableView1DBColumn5: TcxGridDBColumn;
    cxGridDBTableView1DBColumn6: TcxGridDBColumn;
    DataSetMainID_SHABLON: TFIBBCDField;
    DataSetMainID_ACC_A: TFIBBCDField;
    DataSetMainID_ACC_B: TFIBBCDField;
    DataSetMainID_SCH_B: TFIBBCDField;
    DataSetMainID_SM: TFIBBCDField;
    DataSetMainID_RAZD: TFIBBCDField;
    DataSetMainID_STAT: TFIBBCDField;
    DataSetMainID_KEKV: TFIBBCDField;
    DataSetMainID_DOG: TFIBBCDField;
    DataSetMainCOMMENT_SHABLON: TFIBStringField;
    DataSetMainD_MFO_K: TFIBStringField;
    DataSetMainD_BANK_NAME_K: TFIBStringField;
    DataSetMainD_RSCH_K: TFIBStringField;
    DataSetMainD_ID_CUSTOMER: TFIBBCDField;
    DataSetMainD_NAME_CUSTOMER_K: TFIBStringField;
    DataSetMainD_MFO_N: TFIBStringField;
    DataSetMainD_BANK_NAME_N: TFIBStringField;
    DataSetMainD_RSCH_N: TFIBStringField;
    DataSetMainD_ID_CUSTOMER_N: TFIBBCDField;
    DataSetMainD_NAME_CUSTOMER_N: TFIBStringField;
    DataSetMainKOD_DOG: TFIBBCDField;
    DataSetMainREG_NUM_SH2: TFIBStringField;
    DataSetMainD_DOG_SH2: TFIBDateField;
    DataSetMainD_OKPO_K: TFIBStringField;
    DataSetMainD_OKPO_N: TFIBStringField;
    DataSetMainKOD_SCH_DEFAULT: TFIBStringField;
    DataSetMainTITLE_SCH_DEFAULT: TFIBStringField;
    DataSetMainKOD_SCH_DEFAULT_N: TFIBStringField;
    DataSetMainTITLE_SCH_DEFAULT_N: TFIBStringField;
    DataSetMainSM_TITLE: TFIBStringField;
    DataSetMainSM_KOD: TFIBIntegerField;
    DataSetMainRAZ_TITLE: TFIBStringField;
    DataSetMainRAZ_KOD: TFIBIntegerField;
    DataSetMainST_TITLE: TFIBStringField;
    DataSetMainST_KOD: TFIBIntegerField;
    DataSetMainKEKV_TITLE: TFIBStringField;
    DataSetMainKEKV_KOD: TFIBIntegerField;
    DataSetMainSM_RAZ_ST_KEKV: TFIBStringField;
    DataSet: TpFIBDataSet;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cxSplitter1: TcxSplitter;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    cxLabel15: TcxLabel;
    cxLabel16: TcxLabel;
    cxGridDBTableView1DBColumn2: TcxGridDBColumn;
    FormStorage1: TFormStorage;
    DataSetMainNAME_RSCH: TFIBStringField;
    cxGridDBTableView1DBColumn7: TcxGridDBColumn;
    procedure ActionDelExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionChangeExecute(Sender: TObject);
    procedure ActionCloseExecute(Sender: TObject);
    procedure DataSetMainAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private

  public
  id_user : int64;
    constructor Create(AOwner: TComponent; d : Tpfibdatabase); reintroduce;
  end;

  {fmNasroikaTranz: TfmNasroikaTranz; }

function Show_Bank_nastroyka_tranz(AO : tcomponent; D : Tpfibdatabase; id_use : int64) : integer; stdcall;
    exports Show_Bank_nastroyka_tranz;

implementation
uses Un_R_file_Alex, BankAddShablon;

{$R *.dfm}

function Show_Bank_nastroyka_tranz(AO : tcomponent; D : Tpfibdatabase; id_use : int64) : integer; stdcall;
var
    T : TfmNasroikaTranz;
begin
    T := TfmNasroikaTranz.Create(Ao, d);
    T.id_user := id_use;
    T.Show;
end;

constructor TfmNasroikaTranz.Create(AOwner: TComponent; d: Tpfibdatabase);
begin
    inherited Create(AOwner);

   // Database := D;
    Database.Handle                          := D.Handle;
    TransactionRead.StartTransaction;

    ActionAdd.Caption            := Un_R_file_Alex.MY_ACTION_ADD_CONST;
    ActionChange.Caption         := Un_R_file_Alex.MY_ACTION_UPDATE_CONST;
    ActionDel.Caption            := Un_R_file_Alex.MY_ACTION_DELETE_CONST;
    ActionClose.Caption          := Un_R_file_Alex.MY_ACTION_CLOSE_CONST;
    ActionRefresh.Caption        := Un_R_file_Alex.MY_ACTION_REFRESH_CONST;

    Caption           := Un_R_file_Alex.BANK_NASTR_TRANZ_SCH;

    cxLabel1.Caption  := Un_R_file_Alex.KASSA_SCH_KOR_SHORT;
    cxLabel3.Caption  := Un_R_file_Alex.KASSA_SMETA;
    cxLabel5.Caption  := Un_R_file_Alex.KASSA_RAZD;
    cxLabel7.Caption  := Un_R_file_Alex.KASSA_STAT;
    cxLabel9.Caption  := Un_R_file_Alex.KASSA_KEKV;
    cxLabel11.Caption := Un_R_file_Alex.BANK_DOGOVOR+' ' +Un_R_file_Alex.KASSA_DOC_ORDER_FROM;
    cxLabel13.Caption := Un_R_file_Alex.BANK_NAME_CUSTMERA;
    cxLabel15.Caption := Un_R_file_Alex.BANK_EDRPOU;

    DataSet.Close;
    DataSet.SQLs.SelectSQL.Text := 'select cust.SHORT_NAME as NAME from PUB_SYS_DATA s, PUB_SP_CUSTOMER cust where cust.ID_CUSTOMER = s.ORGANIZATION';
    DataSet.Open;

    cxGridDBTableView1DBColumn1.Caption := Un_R_file_Alex.BANK_R_S+' '+DataSet.FBN('NAME').AsString;
    cxGridDBTableView1DBColumn3.Caption := Un_R_file_Alex.BANK_P_S_NAME_CUSTOMER;
    cxGridDBTableView1DBColumn4.Caption := Un_R_file_Alex.KASSA_SCH_KOR_SHORT;
    cxGridDBTableView1DBColumn5.Caption := Un_R_file_Alex.KASSA_KOD_S_R_S_K;
    cxGridDBTableView1DBColumn6.Caption := Un_R_file_Alex.BANK_DOGOVOR;
    cxGridDBTableView1DBColumn2.Caption := Un_R_file_Alex.BANK_NAME_CUSTMERA;


    DataSetMain.Close;
    DataSetMain.SQLs.SelectSQL.Text:='select * from BANK_SELECT_SHABLON_TRANZ';
    DataSetMain.Open;
    cxSplitter1.CloseSplitter;
end;

procedure TfmNasroikaTranz.ActionDelExecute(Sender: TObject);
var
    id : integer;
begin
    if not DataSetMain.IsEmpty then
    begin
        if MessageBox(Handle, Pchar(Un_R_file_Alex.N_AUTOKOD_MESSAGE_DEL +' шаблон між р/c'+DataSetMain.fbn('d_rsch_n').AsString+', '+DataSetMain.fbn('d_rsch_k').AsString), Pchar(Un_R_file_Alex.KASSA_LOOK_FOR), MB_YESNO)=mrYes then
        begin
            pFIBStoredProc1.Database         := Database;
            pFIBStoredProc1.Transaction      := TransactionRead;

            try
                id := DataSetMain.fieldByName('id_shablon').AsInteger;

                pFIBStoredProc1.StoredProcName := 'BANK_SHABLONS_TRANZIT_INI_DEL';
                pFIBStoredProc1.Prepare;
                pFIBStoredProc1.ParamByName('id_shablon').AsInteger := id;
                pFIBStoredProc1.ExecProc;
                TransactionRead.Commit;
            except
                begin
                   TransactionRead.Rollback;
                end;
            end;
        ActionRefreshExecute(Sender);
        end;
    end;
end;

procedure TfmNasroikaTranz.ActionRefreshExecute(Sender: TObject);
begin
   DataSetMain.CloseOpen(true);
end;

procedure TfmNasroikaTranz.ActionAddExecute(Sender: TObject);
var
    T : TfmBankAddShablon;
begin
    T := TfmBankAddShablon.Create(Self, Database, Self, Add);
    T.ShowModal;
    T.Free;
end;

procedure TfmNasroikaTranz.ActionChangeExecute(Sender: TObject);
var
    T : TfmBankAddShablon;
begin
    T := TfmBankAddShablon.Create(Self, Database, Self, Change);
    T.ShowModal;
    T.Free;
end;

procedure TfmNasroikaTranz.ActionCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfmNasroikaTranz.DataSetMainAfterScroll(DataSet: TDataSet);
begin

   if DataSetMain['kod_sch_default'] <> null
        then cxLabel2.Caption :=  DataSetMain['kod_sch_default']+' '+DataSetMain['title_sch_default'];
    if DataSetMain['sm_kod'] <> null
        then cxLabel4.Caption :=  VarToStr(DataSetMain['sm_kod'])+' '+DataSetMain['sm_title'];
    if DataSetMain['raz_kod'] <> null
        then cxLabel6.Caption :=  VarToStr(DataSetMain['raz_kod'])+' '+DataSetMain['raz_title'];
    if DataSetMain['st_kod'] <> null
        then cxLabel8.Caption :=  VarToStr(DataSetMain['st_kod'])+' '+DataSetMain['st_title'];
    if DataSetMain['kekv_kod'] <> null
        then cxLabel10.Caption :=  VarToStr(DataSetMain['kekv_kod'])+' '+DataSetMain['kekv_title'];
    if DataSetMain['d_dog_sh2'] <> null
        then cxLabel12.Caption :=  VarToStr(DataSetMain['d_dog_sh2']);
    if DataSetMain['D_NAME_CUSTOMER_K'] <> null
        then cxLabel14.Caption :=  VarToStr(DataSetMain['D_NAME_CUSTOMER_K']);
    if DataSetMain['D_OKPO_K'] <> null
        then cxLabel16.Caption :=  VarToStr(DataSetMain['D_OKPO_K']);
end;

procedure TfmNasroikaTranz.FormCreate(Sender: TObject);
begin
     FormStorage1.RestoreFormPlacement;
end;

procedure TfmNasroikaTranz.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FormStorage1.SaveFormPlacement;
end;

end.
