unit uMainOplata;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ActnList, cxClasses, cxStyles,
  cxGridTableView, ImgList, DB, DBTables,uCommon_Funcs, uConsts,
  uCommon_Messages, uConsts_Messages,uCommon_Types,  AccMGMT,
  ExtCtrls, cxControls, cxSplitter, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxTextEdit, cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxGridCustomView, cxGrid,
  FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxContainer, cxLabel, DateUtils, FIBQuery,
  pFIBQuery, pFIBStoredProc, cxSpinEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox;

type
  TfrmMainOplata = class(TForm)
    dxBarManager1: TdxBarManager;
    dxBarLargeButtonAdd: TdxBarLargeButton;
    PopupMenuAdd: TdxBarPopupMenu;
    SubItemAddByImport: TdxBarSubItem;
    SubItemAddByHand: TdxBarSubItem;
    OplataActList: TActionList;
    ActAddByHand: TAction;
    ActionAddByImport: TAction;
    Panel1: TPanel;
    Panel2: TPanel;
    cxSplitter1: TcxSplitter;
    Panel3: TPanel;
    DataSetPack: TpFIBDataSet;
    DSPack: TDataSource;
    Styles: TcxStyleRepository;
    BackGround: TcxStyle;
    FocusedRecord: TcxStyle;
    Header: TcxStyle;
    DesabledRecord: TcxStyle;
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
    cxGridTableViewStyleSheet2: TcxGridTableViewStyleSheet;
    DevExpress_Style: TcxGridTableViewStyleSheet;
    GridPack: TcxGrid;
    GridPackDBView: TcxGridDBTableView;
    GridPackLevel: TcxGridLevel;
    GridPersAcc: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    DataSetPersAcc: TpFIBDataSet;
    DataSourcePersAcc: TDataSource;
    dxBarLargeButtonEdit: TdxBarLargeButton;
    ActionChange: TAction;
    dxBarSubItem1: TdxBarSubItem;
    dxBarLargeButtonDel: TdxBarLargeButton;
    ActionDel: TAction;
    TransRead: TpFIBTransaction;
    DB: TpFIBDatabase;
    GridPackDBViewDBColumn1: TcxGridDBColumn;
    GridPackDBViewDBColumn2: TcxGridDBColumn;
    GridPackDBViewDBColumn3: TcxGridDBColumn;
    GridPackDBViewDBColumn4: TcxGridDBColumn;
    GridPackDBViewDBColumn5: TcxGridDBColumn;
    GridPackDBViewDBColumn6: TcxGridDBColumn;
    LabelDatePack: TcxLabel;
    DateEditBeg: TcxDateEdit;
    DateEditEnd: TcxDateEdit;
    DataSetIni: TpFIBDataSet;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarSubItem2: TdxBarSubItem;
    dxBarLargeButton4: TdxBarLargeButton;
    ActionAdd: TAction;
    ActionRefresh: TAction;
    ImageList: TImageList;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    DataSetPersAccID_DT_ALLOC_PERS_AC: TFIBBCDField;
    DataSetPersAccID_PERSONAL_ACCOUNT: TFIBBCDField;
    DataSetPersAccSUM_OPL: TFIBBCDField;
    DataSetPersAccDATE_OPL: TFIBDateField;
    DataSetPersAccDATE_OBR: TFIBDateField;
    DataSetPersAccID_REC_BUFF: TFIBBCDField;
    DataSetPersAccDATE_BEG_PERIOD_FOR_ACC: TFIBDateField;
    DataSetPersAccDATE_END_PERIOD_FOR_ACC: TFIBDateField;
    DataSetPersAccCLIENT_ACCOUNT: TFIBBCDField;
    DataSetPersAccNAME_CASH_TYPE: TFIBStringField;
    DataSetPersAccNOTE_CASH_TYPE: TFIBStringField;
    DataSetPersAccNAME_KASSA_APP: TFIBStringField;
    DataSetPersAccNOTE_KASSA_APP: TFIBStringField;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridDBTableView1DBColumn4: TcxGridDBColumn;
    ActionClose: TAction;
    StoredProc: TpFIBStoredProc;
    dxBarButton1: TdxBarButton;
    GridPackDBViewDBColumn7: TcxGridDBColumn;
    BarLargeButtonSign: TdxBarLargeButton;
    BarLargeButtonUnsign: TdxBarLargeButton;
    BarLargeButtonView: TdxBarLargeButton;
    ActionView: TAction;
    ActionSign: TAction;
    ActionUnsign: TAction;
    DataSetCheckErr: TpFIBDataSet;
    DataSetCheckErrERROR_MESSAGE: TFIBStringField;
    DataSetCheckErrID_DT_ALLOC_PERS_AC: TFIBBCDField;
    DataSetCheckErrSUM_OPL: TFIBBCDField;
    DataSetCheckErrSUM_ALLOC_ALL: TFIBBCDField;
    DataSetCheckErrFLAG_ALLOC_ER: TFIBIntegerField;
    DataSetCheckErrCLIENT_ACCOUNT: TFIBBCDField;
    DataSetCheckErrFIO: TFIBStringField;
    DataSetCheckErrMONTH_SYS: TFIBIntegerField;
    DataSetCheckErrYEAR_SYS: TFIBIntegerField;
    DataSetCheckErrKOD_ERROR: TFIBIntegerField;
    DataSetCheckErrNAME_ERROR: TFIBStringField;
    LabelName_file: TcxLabel;
    BoxNameFile: TcxLookupComboBox;
    LabelNumbPack: TcxLabel;
    TextEditNumbPack: TcxTextEdit;
    LabelPackSys: TcxLabel;
    cxSpinEditYear: TcxSpinEdit;
    cxComboBoxMonth: TcxComboBox;
    ComboBoxProp: TcxComboBox;
    ComboBoxStatePack: TcxComboBox;
    LabelPackState: TcxLabel;
    LabelPackProp: TcxLabel;
    TimeEnter: TTimer;
    DataSetNameFile: TpFIBDataSet;
    DataSourceNameFile: TDataSource;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    ActionFilter: TAction;
    ActionClear: TAction;
    DataSetPackID_DT_PACK: TFIBBCDField;
    DataSetPackNUMB_PACK: TFIBBCDField;
    DataSetPackNAME_FILE_IMPORT: TFIBStringField;
    DataSetPackDATE_CURRENT: TFIBDateField;
    DataSetPackALL_COUNT_REC_PACK: TFIBIntegerField;
    DataSetPackALL_SUM_OPL_PACK: TFIBBCDField;
    DataSetPackIS_SIGNED: TFIBSmallIntField;
    DataSetPackKOD_PERIOD_SYSTEM: TFIBSmallIntField;
    DataSetPackADD_BY_HAND: TFIBSmallIntField;
    DataSetPackMONTH_INT: TFIBIntegerField;
    DataSetPackYEAR_INT: TFIBIntegerField;
    DataSetPackMONTH_YEAR: TFIBStringField;
    DataSetPackNAME_DOC_PROP: TFIBStringField;
    DataSetPackID_DOC_PROP: TFIBIntegerField;
    DataSetPackID_DOCUMENT: TFIBBCDField;
    dxBarLargeButton7: TdxBarLargeButton;
    dxBarLargeButton8: TdxBarLargeButton;
    dxBarLargeButton9: TdxBarLargeButton;
    dxBarLargeButton10: TdxBarLargeButton;
    dxBarLargeButton11: TdxBarLargeButton;
    dxBarLargeButton12: TdxBarLargeButton;
    procedure ActionAddByImportExecute(Sender: TObject);
    procedure ActionChangeExecute(Sender: TObject);
    procedure ActionDelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridPackDBViewCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure ActAddByHandExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionCloseExecute(Sender: TObject);
    procedure DataSetPackEndScroll(DataSet: TDataSet);
    procedure ActionViewExecute(Sender: TObject);
    procedure ActionSignExecute(Sender: TObject);
    procedure ActionUnsignExecute(Sender: TObject);
    procedure BoxNameFileClick(Sender: TObject);
    procedure BoxNameFileKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TimeEnterTimer(Sender: TObject);
    procedure BoxNameFilePropertiesInitPopup(Sender: TObject);
    procedure ActionFilterExecute(Sender: TObject);
    procedure ActionClearExecute(Sender: TObject);
  private
    PLanguageIndex: byte;
    //DM : TMainOpl_DM;
    procedure FormIniLanguage;
    procedure ButtonsEnabletrue;
    procedure ButtonsEnableFalse;
  public
    res         :Variant;
    Is_admin    :Boolean;
    add_by_hand : integer;
    id_dt_pack  : int64;
    id_doc_ini, type_doc, count : integer;
    name_source, name_path, proc_name : string;
    flag_visible_er : integer;
    constructor Create(AParameter:TbsSimpleParams);reintroduce;
  end;

{var
  frmMainOplata: TfrmMainOplata;}

implementation
uses uImportSourceSel, uImportPersAcc, uImportProgress;
{$R *.dfm}

constructor TfrmMainOplata.Create(AParameter:TbsSimpleParams);
begin
   Screen.Cursor:=crHourGlass;
   inherited Create(AParameter.Owner);

   Self.Is_admin                  := AParameter.is_admin;

   DB.Handle                      := AParameter.Db_Handle;

   TransRead.DefaultDatabase      := DB;
   DB.DefaultTransaction          := TransRead;

   DataSetPack.Database           := DB;
   DataSetPack.Transaction        := TransRead;

   DataSetIni.Database            := DB;
   DataSetIni.Transaction         := TransRead;

   DataSetPersAcc.Database        := DB;
   DataSetPersAcc.Transaction     := TransRead;

   StoredProc.Database            := DB;
   StoredProc.Transaction         := TransRead;

   DataSetNameFile.Database       := DB;
   DataSetNameFile.Transaction    := TransRead;

   TransRead.StartTransaction;

   DataSetIni.Close;
   DataSetIni.SQLs.SelectSQL.Text := 'select * from BS_KOD_SYSTEM_SEL_CONVERT';
   DataSetIni.Open;

   DateEditBeg.Date := DataSetIni.FieldByName('date_period_system').AsDateTime;
   DateEditEnd.Date := date;

   DataSetPack.Close;
   DataSetPack.SQLs.SelectSQL.Text := 'select * from bs_dt_pack_sel('+'null'+',null'+',null'+',null'+',null'+',null'+',null'+',null'+')';
   DataSetPack.Open;
   DataSetPack.First;


   DataSetPersAcc.Close;
   DataSetPersAcc.SQLs.SelectSQL.Text := 'select * from BS_DT_ALLOCATION_ACCOUNTS_SEL(?ID_DT_PACK)';
   DataSetPersAcc.Open;
   DataSetPersAcc.First;

   FormIniLanguage();
   Screen.Cursor:=crDefault;

   flag_visible_er := 0;
  // bsFormStorage.RestoreFormPlacement;
end;
procedure TfrmMainOplata.FormIniLanguage();
begin
//
end;

procedure TfrmMainOplata.ActionAddByImportExecute(Sender: TObject);
var
        PersAcc : TfrmImportPersAcc;
        id_dt_pack_out : int64;
        id_doc_ini_out, type_doc_out, count_out : integer;
        name_source_out, name_path_out, proc_name_out : string;
begin
    add_by_hand :=0;
    if ShowImportSourceSel(DB, id_doc_ini_out,name_source_out,type_doc_out,count_out, name_path_out, proc_name_out) then
    begin
         id_doc_ini  := id_doc_ini_out;
         name_source := name_source_out;
         type_doc    := type_doc_out;
         name_path   := name_path_out;
         proc_name   := proc_name_out;
         count       := count_out;
    end;
    //showmessage(inttostr(id_doc_ini));
   // showmessage(inttostr(count));
    if (id_doc_ini>0) then
    begin
        if ShowImportProgress(DB, id_doc_ini,name_source,type_doc,name_path, proc_name, id_dt_pack_out) then
        begin
             id_dt_pack  := id_dt_pack_out;
        end;
        ActionRefreshExecute(Sender);
        DataSetPack.Locate('ID_DT_PACK', id_dt_pack, []);
        PersAcc := TfrmImportPersAcc.Create(Self, DB, Self, add);
        PersAcc.Show;
    end;
end;

procedure TfrmMainOplata.ActionChangeExecute(Sender: TObject);
var
    T : TfrmImportPersAcc;
begin
    T := TfrmImportPersAcc.Create(Self, DB, Self, change);
    T.Show;
end;

procedure TfrmMainOplata.ActionDelExecute(Sender: TObject);
var
  i: byte;
  error_message : string;
begin
    i:= uCommon_Messages.bsShowMessage(uConsts.bs_Confirmation_Caption[PLanguageIndex], 'Ви дійсно бажаєте видалити пачку №'+' '+DataSetPack.fbn('numb_pack').AsString+'(файл імпорту '+DataSetPack.fbn('name_file_import').AsString+')?', mtConfirmation, [mbYes, mbNo]);
    if ((i = 7) or (i= 2)) then exit;

    with StoredProc do
    begin
        TransRead.StartTransaction;
        StoredProcName:= 'BS_DT_PACK_DEL';
        Prepare;
        ParamByName('in_id_dt_pack').AsInt64       :=  DataSetPack['id_dt_pack'];
        ExecProc;
        error_message                              := ParamByName('error').value;
        if (UpperCase(error_message)<>UpperCase('No')) then
        begin
            showmessage(error_message);
            exit;
        end;
        TransRead.Commit;
        try
        except
            on E:Exception do
            begin
                LogException;
                bsShowMessage('Error',e.Message,mtError,[mbOK]);
                TransRead.Rollback;
            end;
       end;
       ActionRefreshExecute(Sender);
   end;
end;

procedure TfrmMainOplata.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TfrmMainOplata.GridPackDBViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
    Arect : TRect;
begin
  Arect:=AViewInfo.Bounds;
  if (AViewInfo.GridRecord.Values[6]=1){ and (not AViewInfo.GridRecord.Focused)} then
  begin //подписанные пачки
      ACanvas.Canvas.Font.color := RGB(0,150,0);//zelenii
      ACanvas.Canvas.FillRect(Arect);
      exit;
  end;
end;

procedure TfrmMainOplata.ActAddByHandExecute(Sender: TObject);
var
    T : TfrmImportPersAcc;
begin
    add_by_hand :=1;
    T := TfrmImportPersAcc.Create(Self, DB, Self, add);
    T.Show;
    //T.Free;
end;

procedure TfrmMainOplata.ActionRefreshExecute(Sender: TObject);
begin
    //if datasetPack.IsEmpty then Exit;
    DataSetPack.CloseOpen(true);
    DataSetPersAcc.CloseOpen(true);
end;

procedure TfrmMainOplata.ActionCloseExecute(Sender: TObject);
begin
    close;
end;

procedure TfrmMainOplata.DataSetPackEndScroll(DataSet: TDataSet);
begin

    if datasetPack.IsEmpty then Exit;

    if(DataSetPack['is_signed']=1) then
    begin
         ButtonsEnableFalse;
         ComboBoxStatePack.ItemIndex := 1;
    end else
    begin
         ButtonsEnabletrue;
         ComboBoxStatePack.ItemIndex := 2;
    end;
    if(DataSetPack['id_doc_prop']=2) then
    begin
         ComboBoxProp.ItemIndex      := 1;
    end else
    begin
         ComboBoxProp.ItemIndex      := 2;
    end;
    TextEditNumbPack.Text       := DataSetPack['numb_pack'];
    DateEditBeg.Date            := DataSetPack['date_current'];
    DateEditEnd.Date            := DataSetPack['date_current'];
    DateEditEnd.Enabled         := false;
    cxComboBoxMonth.ItemIndex   := DataSetPack['month_int']-1;
    cxSpinEditYear.Value        := DataSetPack['year_int'];

    if DataSetNameFile.Active then DataSetNameFile.Close;
    DataSetNameFile.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_PACK_SEL_BY_ID(:IN_ID_DT_PACK)';
    DataSetNameFile.ParamByName('IN_ID_DT_PACK').AsInteger:=DataSetPack['id_dt_pack'];
    DataSetNameFile.Open;
    BoxNameFile.EditValue := DataSetPack['id_dt_pack'];
end;

procedure TfrmMainOplata.ButtonsEnabletrue;
begin
    dxBarLargeButtonAdd.Enabled     := true;
    dxBarLargeButtonEdit.Enabled    := true;
    dxBarLargeButtonDel.Enabled     := true;
    BarLargeButtonSign.Enabled      := true;
    BarLargeButtonUnSign.Enabled    := false;
end;

procedure TfrmMainOplata.ButtonsEnableFalse;
begin
    dxBarLargeButtonAdd.Enabled     := false;
    dxBarLargeButtonEdit.Enabled    := false;
    dxBarLargeButtonDel.Enabled     := false;
    BarLargeButtonSign.Enabled      := false;
    BarLargeButtonUnSign.Enabled    := true;
end;


procedure TfrmMainOplata.ActionViewExecute(Sender: TObject);
var
    T : TfrmImportPersAcc;
begin
    T := TfrmImportPersAcc.Create(Self, DB, Self, view);
    T.Show;
end;

procedure TfrmMainOplata.ActionSignExecute(Sender: TObject);
var
    T              : TfrmImportPersAcc;
    id_dt_pack_loc : int64;
begin
    DataSetCheckErr.Close;
    DataSetCheckErr.SQLs.SelectSQL.Text                     := 'select * from BS_SELECT_ERRORS_PACK_SIGN(:IN_ID_DT_PACK)';
    DataSetCheckErr.ParamByName('IN_ID_DT_PACK').AsInt64    := DataSetPack['id_dt_pack'];
    DataSetCheckErr.Open;

    if(DataSetCheckErr.IsEmpty) then
    begin
        TransRead.StartTransaction;
        try
            StoredProc.StoredProcName := 'BS_DT_PACK_UPD';

            StoredProc.Prepare;
            StoredProc.ParamByName('ID_DT_PACK').AsInt64                := DataSetPack['id_dt_pack'];
            StoredProc.ParamByName('NUMB_PACK').AsInt64                 := DataSetPack['NUMB_PACK'];
            StoredProc.ParamByName('NAME_FILE_IMPORT').AsString         := DataSetPack['NAME_FILE_IMPORT'];
            StoredProc.ParamByName('DATE_CURRENT').AsDate               := DataSetPack['date_current'];
            StoredProc.ParamByName('ALL_COUNT_REC_PACK').AsVariant      := DataSetPack['all_count_rec_pack'];
            StoredProc.ParamByName('all_sum_opl_pack').AsVariant        := DataSetPack['all_sum_opl_pack'];
            StoredProc.ParamByName('IS_SIGNED').AsInteger               := 1;
            StoredProc.ParamByName('MONTH_IN').AsInteger                := DataSetPack['month_int'];
            StoredProc.ParamByName('YEAR_IN').AsInteger                 := DataSetPack['year_int'];
            StoredProc.ParamByName('ID_DOC_PROP').AsInteger             := DataSetPack['id_doc_prop'];

            id_dt_pack_loc := DataSetPack['id_dt_pack'];
            StoredProc.ExecProc;
            TransRead.Commit;

            ButtonsEnableFalse;
            ActionRefreshExecute(Sender);
            DataSetPack.Locate('id_dt_pack', id_dt_pack_loc, []);
        except
            begin
                TransRead.Rollback;
                Showmessage('При редагуванні виникла помилка');
                exit;
            end;
        end;
        end else
        begin
            flag_visible_er := 1;
            T := TfrmImportPersAcc.Create(Self, DB, Self, change);
            T.Show;
        end;
end;

procedure TfrmMainOplata.ActionUnsignExecute(Sender: TObject);
var
    T : TfrmImportPersAcc;
    id_dt_pack_loc : int64;
begin
    DataSetCheckErr.Close;
    DataSetCheckErr.SQLs.SelectSQL.Text                     := 'select * from BS_SELECT_ERRORS_PACK_SIGN(:IN_ID_DT_PACK)';
    DataSetCheckErr.ParamByName('IN_ID_DT_PACK').AsInt64    := DataSetPack['id_dt_pack'];
    DataSetCheckErr.Open;

    if(DataSetCheckErr.IsEmpty) then
    begin
        TransRead.StartTransaction;
        try
            StoredProc.StoredProcName := 'BS_DT_PACK_UPD';

            StoredProc.Prepare;
            StoredProc.ParamByName('ID_DT_PACK').AsInt64                := DataSetPack['id_dt_pack'];
            StoredProc.ParamByName('NUMB_PACK').AsInt64                 := DataSetPack['NUMB_PACK'];
            StoredProc.ParamByName('NAME_FILE_IMPORT').AsString         := DataSetPack['NAME_FILE_IMPORT'];
            StoredProc.ParamByName('DATE_CURRENT').AsDate               := DataSetPack['date_current'];
            StoredProc.ParamByName('ALL_COUNT_REC_PACK').AsVariant      := DataSetPack['all_count_rec_pack'];
            StoredProc.ParamByName('all_sum_opl_pack').AsVariant        := DataSetPack['all_sum_opl_pack'];
            StoredProc.ParamByName('IS_SIGNED').AsInteger               := 0;
            StoredProc.ParamByName('MONTH_IN').AsInteger                := DataSetPack['month_int'];
            StoredProc.ParamByName('YEAR_IN').AsInteger                 := DataSetPack['year_int'];
            StoredProc.ParamByName('ID_DOC_PROP').AsInteger             := DataSetPack['id_doc_prop'];

            id_dt_pack_loc := DataSetPack['id_dt_pack'];

            StoredProc.ExecProc;
            TransRead.Commit;

            ButtonsEnableTrue;

            ActionRefreshExecute(Sender);
            DataSetPack.Locate('id_dt_pack', id_dt_pack_loc, []);
        except
            begin
                TransRead.Rollback;
                Showmessage('При редагуванні виникла помилка');
                exit;
            end;
        end;
        end else
        begin
            flag_visible_er := 1;
            T := TfrmImportPersAcc.Create(Self, DB, Self, change);
            T.Show;
        end;
end;

procedure TfrmMainOplata.BoxNameFileClick(Sender: TObject);
begin
     TimeEnter.Enabled:=False;
end;

procedure TfrmMainOplata.BoxNameFileKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if BoxNameFile.EditText='' then
       if DataSetNameFile.Active then
            DataSetNameFile.Close;
    TimeEnter.Enabled:=not (BoxNameFile.EditText='');

end;

procedure TfrmMainOplata.TimeEnterTimer(Sender: TObject);
begin
    TimeEnter.Enabled := False;
    DataSetNameFile.Close;
    DataSetNameFile.SQLs.SelectSQL.Text := 'SELECT DISTINCT * FROM BS_PACK_FILTER(:FILTER_STR)';
    DataSetNameFile.ParamByName('FILTER_STR').AsString := BoxNameFile.EditText;
    DataSetNameFile.Open;
    if not DataSetNameFile.IsEmpty then
    begin
         BoxNameFile.DroppedDown:=True;
    end;
    BoxNameFile.Properties.GridMode:=True;
end;

procedure TfrmMainOplata.BoxNameFilePropertiesInitPopup(Sender: TObject);
begin
      DataSetNameFile.Close;
      DataSetNameFile.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_PACK_FILTER(:FILTER_STR)';
      DataSetNameFile.ParamByName('FILTER_STR').AsString:=BoxNameFile.EditText;
      DataSetNameFile.Open;
      BoxNameFile.Properties.GridMode:=True;
end;

procedure TfrmMainOplata.ActionFilterExecute(Sender: TObject);
var
     strFilter   : String;
     month_pack  : integer;
begin
    strFilter := '';

    if BoxNameFile.EditText=''
        then strFilter := strFilter+'Null,'
        else strFilter := strFilter+''''+BoxNameFile.EditText+''',';

    if TextEditNumbPack.Text=''
         then strFilter := strFilter+'Null,'
         else strFilter := strFilter+TextEditNumbPack.Text+',';

    if DateEditBeg.text= '01.01.1899'
         then strFilter := strFilter+'Null,'
         else strFilter := strFilter+''''+DateEditBeg.text+''',';

    if DateEditEnd.text='01.01.1899'
         then strFilter := strFilter+'Null,'
         else strFilter := strFilter+''''+DateEditEnd.Text+''',';

    if ((ComboBoxProp.ItemIndex=-1)or(ComboBoxProp.Text='')or(ComboBoxProp.ItemIndex=0)) then
         strFilter := strFilter+'Null,'
    else
    begin
         if(ComboBoxProp.ItemIndex=1) then
         begin
             strFilter := strFilter+'2'+','
         end else
         if(ComboBoxProp.ItemIndex=2) then
         begin
             strFilter := strFilter+'4'+','
         end;
    end;

    if ((ComboBoxStatePack.ItemIndex=-1)or(ComboBoxStatePack.Text='')or(ComboBoxStatePack.ItemIndex=0))  then
         strFilter := strFilter+'Null,'
    else
    begin
        if(ComboBoxStatePack.ItemIndex=1) then
        begin
            strFilter := strFilter+'1'+','
        end else
        if(ComboBoxStatePack.ItemIndex=2) then
        begin
            strFilter := strFilter+'0'+','
        end;
    end;

    if ((cxComboBoxMonth.ItemIndex=-1)or(cxComboBoxMonth.Text='')) then
        strFilter := strFilter+'Null,'
    else
    begin
        month_pack := cxComboBoxMonth.ItemIndex+1;
        strFilter  := strFilter+inttostr(month_pack)+',';
    end;

   if ((cxSpinEditYear.Text='') or (cxSpinEditYear.Value=0))
        then strFilter := strFilter+'Null'
        else strFilter := strFilter+inttostr(cxSpinEditYear.Value);

   if DataSetPack.Active then DataSetPack.Close;
   DataSetPack.SQLs.SelectSQL.Text:='select distinct * from BS_DT_PACK_SEL('+strFilter+')';
   DataSetPack.Open;

   DataSetPersAcc.CloseOpen(true);
end;


procedure TfrmMainOplata.ActionClearExecute(Sender: TObject);
begin
    ComboBoxStatePack.ItemIndex := -1;
    ComboBoxProp.ItemIndex      := -1;
    TextEditNumbPack.Text       := '';
    DateEditBeg.Date            := strtodate('01.01.1899');
    DateEditEnd.Date            := strtodate('01.01.1899');
    DateEditEnd.Enabled         := true;
    cxComboBoxMonth.ItemIndex   := -1;
    cxSpinEditYear.Value        := 0;

    if DataSetNameFile.Active then DataSetNameFile.Close;
end;

end.
