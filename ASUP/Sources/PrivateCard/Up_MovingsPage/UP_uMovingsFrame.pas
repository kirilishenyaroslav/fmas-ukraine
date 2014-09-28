unit UP_uMovingsFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridDBTableView, cxGrid,  cxContainer, cxLabel,
  cxDBLabel, ExtCtrls, Buttons, cxCalendar, cxTL, //Clipbrd,
  cxInplaceContainer, cxTLData, cxDBTL, cxMaskEdit, cxCurrencyEdit,
  cxCheckBox, ActnList, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  Ibase, cxTextEdit, cxDropDownEdit, uFControl, uLabeledFControl,
  uDateControl, cxDBEdit, cxSplitter, cxLookAndFeelPainters, cxButtons,
  cxButtonEdit, cxPropertiesStore, Placemnt, uLogicCheck, ComCtrls, pFibStoredProc,
  FIBQuery, pFIBQuery, BaseTypes;

type
  TfmPCardMovingsPage = class(TFrame)
    StyleRepository: TcxStyleRepository;
    stBackground: TcxStyle;
    stContent: TcxStyle;
    stContentEven: TcxStyle;
    stContentOdd: TcxStyle;
    stFilterBox: TcxStyle;
    stFooter: TcxStyle;
    stGroup: TcxStyle;
    stGroupByBox: TcxStyle;
    stHeader: TcxStyle;
    stInactive: TcxStyle;
    stIncSearch: TcxStyle;
    stIndicator: TcxStyle;
    stPreview: TcxStyle;
    stSelection: TcxStyle;
    stHotTrack: TcxStyle;
    qizzStyle: TcxGridTableViewStyleSheet;
    Panel1: TPanel;
    ActionList1: TActionList;
    BonusesAct: TAction;
    DB: TpFIBDatabase;
    MovingsSelect: TpFIBDataSet;
    MovingsSource: TDataSource;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    pFIBDS_Format: TpFIBDataSet;
    pFIBDS_FormatSTAVKI_DISP_FORMAT: TFIBStringField;
    BonusSelect: TpFIBDataSet;
    BonusSelectNUM_ORDER: TFIBStringField;
    BonusSelectDATE_ORDER: TFIBDateField;
    BonusSelectID_MAN_BONUS: TFIBIntegerField;
    BonusSelectID_BONUS: TFIBIntegerField;
    BonusSelectIS_PERCENT: TFIBStringField;
    BonusSelectPERCENT: TFIBFloatField;
    BonusSelectSUMMA: TFIBFloatField;
    BonusSelectID_ORDER: TFIBIntegerField;
    BonusSelectNAME_BONUS: TFIBStringField;
    BonusSelectTHE_BONUS: TFIBStringField;
    BonusSelectTYPE_BONUS: TFIBStringField;
    BonusSelectDATE_BEG: TFIBDateField;
    BonusSelectDATE_END: TFIBDateField;
    BonusSelectPERIOD: TFIBStringField;
    BonusSelectID: TFIBIntegerField;
    BonusSelectID_PARENT: TFIBIntegerField;
    BonusSelectALL_NAME: TFIBStringField;
    BonusSelectID_MAN_MOVING: TFIBIntegerField;
    BonusSelectid_man_bonus_smet: TIntegerField;
    ItemsGrid: TcxGrid;
    ReportDataView: TcxGridDBTableView;
    ReportDataViewDBColumn1: TcxGridDBColumn;
    ReportDataViewDBColumn2: TcxGridDBColumn;
    RATE_COUNT_STR: TcxGridDBColumn;
    DateBegCol: TcxGridDBColumn;
    DateEndCol: TcxGridDBColumn;
    cxgrdbclmnOkladCol: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    ReportDataViewDBColumn7: TcxGridDBColumn;
    Panel2: TPanel;
    cxCB_ShowOld: TcxCheckBox;
    ReportDataViewDBColumn8: TcxGridDBColumn;
    ReportDataViewDBColumn10: TcxGridDBColumn;
    cxCheckBox1: TcxCheckBox;
    OnDate: TqFDateControl;
    Panel3: TPanel;
    cxSplitter1: TcxSplitter;
    cxGrid1: TcxGrid;
    SmView: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    L: TcxGridLevel;
    SmViewDBColumn1: TcxGridDBColumn;
    SmetsDataSet: TpFIBDataSet;
    SmetsDataSource: TDataSource;
    SmViewDBColumn2: TcxGridDBColumn;
    cxCheckBox3: TcxCheckBox;
    SmViewDBColumn3: TcxGridDBColumn;
    SmViewDBColumn4: TcxGridDBColumn;
    cxCheckBox4: TcxCheckBox;
    cxgrdbclmnReportDataViewDBColumn3: TcxGridDBColumn;
    cxCheckBox5: TcxCheckBox;
    LevelEdit: TcxButtonEdit;
    cxprprtstr1: TcxPropertiesStore;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    Label6: TLabel;
    cxDBTextEdit6: TcxDBTextEdit;
    Label3: TLabel;
    Label4: TLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    Label2: TLabel;
    Label5: TLabel;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    cxButton2: TcxButton;
    cxButton1: TcxButton;
    Label7: TLabel;
    cxDBTextEdit7: TcxDBTextEdit;
    Label8: TLabel;
    Label9: TLabel;
    cxDBTextEdit8: TcxDBTextEdit;
    cxDBTextEdit9: TcxDBTextEdit;
    Label10: TLabel;
    Label11: TLabel;
    cxDBTextEdit10: TcxDBTextEdit;
    cxDBTextEdit11: TcxDBTextEdit;
    Label12: TLabel;
    cxDBTextEdit12: TcxDBTextEdit;
    Label13: TLabel;
    Label14: TLabel;
    cxDBTextEdit13: TcxDBTextEdit;
    cxDBTextEdit14: TcxDBTextEdit;
    Label15: TLabel;
    cxDBTextEdit15: TcxDBTextEdit;
    cxDBTextEdit16: TcxDBTextEdit;
    Label16: TLabel;
    isPCardView: TcxCheckBox;
    TabSheet3: TTabSheet;
    DInfoDataSet: TpFIBDataSet;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    cxDBTextEdit18: TcxDBTextEdit;
    cxDBTextEdit19: TcxDBTextEdit;
    Label20: TLabel;
    Label21: TLabel;
    cxDBTextEdit20: TcxDBTextEdit;
    cxDBTextEdit21: TcxDBTextEdit;
    cxDBTextEdit17: TcxDBTextEdit;
    DinfoDataSource: TDataSource;
    cxDBTextEdit22: TcxDBTextEdit;
    Label22: TLabel;
    Label23: TLabel;
    cxDBTextEdit23: TcxDBTextEdit;
    ConstSet: TpFIBDataSet;
    lblDateWorkBeg: TLabel;
    WorkDateBegDset: TpFIBDataSet;
    StorProc: TpFIBStoredProc;
    DateWorkBeg: TcxDateEdit;
    btnOk: TSpeedButton;
    procedure cxCB_ShowOldPropertiesChange(Sender: TObject);
    procedure OnDateChange(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
    procedure cxCheckBox3PropertiesChange(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure ReportDataViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SmViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxCheckBox4PropertiesChange(Sender: TObject);
    procedure cxgrdbclmnReportDataViewDBColumn3StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure cxCheckBox5PropertiesChange(Sender: TObject);
    procedure LevelEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure isPCardViewPropertiesChange(Sender: TObject);
    procedure DInfoDataSetAfterOpen(DataSet: TDataSet);
    procedure MovingsSelectEndScroll(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
  private
    Select_Type: Integer;
    id_level:Variant;
    procedure GetData;
  public
    id_pcard:int64;
    procedure MovingsSelectAfterOpen(DataSet: TDataSet);
    constructor Create(AOwner: TComponent;DBHandle:TISC_DB_HANDLE;Id_PCard: Integer; ActualDate: TDate; Select_Type: Integer); reintroduce;
  end;

implementation

{$R *.dfm}

uses uFormControl, Registry, Clipbrd, UP_uMovingsRedact, UBonusByMovig,
     UpKernelUnit, uUnivSprav, RxmemDS, accmgmt, UP_uMovDep;

constructor TfmPCardMovingsPage.Create(AOwner: TComponent;
                                       DBHandle:TISC_DB_HANDLE;
                                       Id_PCard:Integer;
                                       ActualDate:TDate;
                                       Select_Type: Integer);
var D,M,Y,Hour, Min, Sec, MSec :Word;
    DefLevevInfoDS:TpFIBDataSet;
    tv:string;
    
begin
    inherited Create(AOwner);
    id_level:=null;

    tv:='';
    tv:=KYVLoadFromRegistry('TfmPCardMovingsPage_cxCheckBox1',GetUserId);
    if (tv='0') or (tv='1')
    then begin
             cxCheckBox1.Checked:=Boolean(StrToInt(tv));
             cxCheckBox1.Properties.OnChange(Self);
    end;

    tv:='';
    tv:=KYVLoadFromRegistry('TfmPCardMovingsPage_cxCheckBox3',GetUserId);
    if (tv='0') or (tv='1')
    then begin
             cxCheckBox3.Checked:=Boolean(StrToInt(tv));
             cxCheckBox3.Properties.OnChange(Self);
    end;

    tv:='';
    tv:=KYVLoadFromRegistry('TfmPCardMovingsPage_cxCheckBox4',GetUserId);
    if (tv='0') or (tv='1')
    then begin
             cxCheckBox4.Checked:=Boolean(StrToInt(tv));
             cxCheckBox4.Properties.OnChange(Self);
    end;

    tv:='';
    tv:=KYVLoadFromRegistry('TfmPCardMovingsPage_cxCheckBox5',GetUserId);
    if (tv='0') or (tv='1')
    then begin
             cxCheckBox5.Checked:=Boolean(StrToInt(tv));
             cxCheckBox5.Properties.OnChange(Self);
    end;

    DecodeDate(Date,Y,M,D);
    DecodeTime(Time,Hour, Min, Sec, MSec);
    self.Name:=self.Name+IntToStr(Y)+IntToStr(M)+IntToStr(D)+IntToStr(Hour)+IntToStr(Min)+IntToStr(Sec);
    DB.Handle:=DBHandle;
    ReadTransaction.StartTransaction;

    Self.Select_Type := Select_Type;
    self.id_pcard:=Id_PCard;

    SmetsDataSet.SelectSQL.Text:='SELECT * FROM UP_KER_GET_MOV_SMET_INFO(?ID_MAN_MOVING)';

    pFIBDS_Format.Open;

    MovingsSelect.AfterOpen:=MovingsSelectAfterOpen;

    MovingsSelect.ParamByName('Id_PCard').AsInteger :=Id_PCard;
    if not cxCB_ShowOld.Checked
    then MovingsSelect.ParamByName('Act_date').AsDate    :=ActualDate
    else MovingsSelect.ParamByName('Act_date').Value     :=null;

    if cxCheckBox5.Checked
    then MovingsSelect.ParamByName('ID_LEVEL').Value:=id_level
    else MovingsSelect.ParamByName('ID_LEVEL').Value:=null;

    if isPCardView.Checked
    then MovingsSelect.ParamByName('check_mode').Value:=1
    else MovingsSelect.ParamByName('check_mode').Value:=0;

    MovingsSelect.Open;

    if not cxCB_ShowOld.Checked
    then begin
              ReportDataView.ViewData.Expand(true);
    end
    else begin
              ReportDataView.ViewData.Expand(true);
    end;

    OnDate.Visible:=not cxCB_ShowOld.Checked;

    OnDate.Value := ActualDate;

    DefLevevInfoDS:=TpFIBDataSet.Create(self);
    DefLevevInfoDS.Database:=DB;
    DefLevevInfoDS.Transaction:=ReadTransaction;
    DefLevevInfoDS.SelectSQL.Text:='SELECT * FROM UP_KER_UTIL_GET_DEF_LEVEL';
    DefLevevInfoDS.Open;
    if (DefLevevInfoDS.RecordCount>0)
    then begin
              LevelEdit.Text:=DefLevevInfoDS.FieldByName('LEVEL_NAME').AsString;
              id_level:=DefLevevInfoDS.FieldByName('ID_LEVEL').Value;
    end;
    DefLevevInfoDS.Close;
    DefLevevInfoDS.Free;

    if DInfoDataSet.Active then DInfoDataSet.Close;

    if cxCheckBox5.Checked
    then DInfoDataSet.ParamByName('ID_LEVEL').Value:=id_level
    else DInfoDataSet.ParamByName('ID_LEVEL').Value:=null;

    DInfoDataSet.ParamByName('Id_PCard').AsInt64 :=Id_PCard;

    if cxCB_ShowOld.Checked
    then DInfoDataSet.ParamByName('Actual_date').Value:=null
    else DInfoDataSet.ParamByName('Actual_date').AsDate:=OnDate.Value;

    DInfoDataSet.Open;

    tv:='';
    tv:=KYVLoadFromRegistry('TfmPCardMovingsPage_isPCardView',GetUserId);
    if (tv='0') or (tv='1')
    then begin
             isPCardView.Checked:=Boolean(StrToInt(tv));
             isPCardView.Properties.OnChange(Self);
    end;
    ConstSet.Close;
    ConstSet.SQLs.SelectSQL.Text:='select Is_Show_Edit_Work_Date_Beg from up_sys_ini_consts';
    ConstSet.Open;
    if (ConstSet['Is_Show_Edit_Work_Date_Beg']=1) then
    begin
       btnOk.Visible:=True;
       btnOk.Enabled:=True;
       DateWorkBeg.Visible:=True;
       DateWorkBeg.Enabled:=True;
       lblDateWorkBeg.Visible:=True;
    end;
end;



procedure TfmPCardMovingsPage.MovingsSelectAfterOpen(DataSet: TDataSet);
begin
end;

procedure TfmPCardMovingsPage.cxCB_ShowOldPropertiesChange(
  Sender: TObject);
begin
     OnDate.Visible:=not cxCB_ShowOld.Checked;
     GetData;

    if DInfoDataSet.Active then DInfoDataSet.Close;

    if cxCheckBox5.Checked
    then DInfoDataSet.ParamByName('ID_LEVEL').Value:=id_level
    else DInfoDataSet.ParamByName('ID_LEVEL').Value:=null;

    DInfoDataSet.ParamByName('Id_PCard').AsInt64 :=Id_PCard;

    if cxCB_ShowOld.Checked
    then DInfoDataSet.ParamByName('Actual_date').Value:=null
    else DInfoDataSet.ParamByName('Actual_date').AsDate:=OnDate.Value;

    DInfoDataSet.Open;
     
end;

procedure TfmPCardMovingsPage.OnDateChange(Sender: TObject);
begin
    Screen.Cursor:=crHourGlass;

    GetData;

    if not cxCB_ShowOld.Checked
    then begin
              ReportDataView.ViewData.Expand(true);
    end
    else begin
              ReportDataView.ViewData.Expand(true);
    end;

    if DInfoDataSet.Active then DInfoDataSet.Close;

    if cxCheckBox5.Checked
    then DInfoDataSet.ParamByName('ID_LEVEL').Value:=id_level
    else DInfoDataSet.ParamByName('ID_LEVEL').Value:=null;

    DInfoDataSet.ParamByName('Id_PCard').AsInt64 :=Id_PCard;

    if cxCB_ShowOld.Checked
    then DInfoDataSet.ParamByName('Actual_date').Value:=null
    else DInfoDataSet.ParamByName('Actual_date').asDate:=OnDate.Value;

    DInfoDataSet.Open;

    Screen.Cursor:=crDefault;
end;

procedure TfmPCardMovingsPage.cxCheckBox1PropertiesChange(Sender: TObject);
begin
     Panel3.Visible:=cxCheckBox1.Checked;
     cxSplitter1.Visible:=cxCheckBox1.Checked;

     if cxCheckBox1.Checked
     then begin
               cxSplitter1.Top:=Panel3.Top-1;
     end;

     KYVSaveIntoRegistry('TfmPCardMovingsPage_cxCheckBox1',IntToStr(Integer(cxCheckBox1.Checked)),GetUserId);
end;

procedure TfmPCardMovingsPage.cxCheckBox3PropertiesChange(Sender: TObject);
begin
     ReportDataView.OptionsView.GroupByBox:=cxCheckBox3.Checked;
     SmView.OptionsView.GroupByBox        :=cxCheckBox3.Checked;

     KYVSaveIntoRegistry('TfmPCardMovingsPage_cxCheckBox3',IntToStr(Integer(cxCheckBox3.Checked)),GetUserId);
end;

procedure TfmPCardMovingsPage.cxButton2Click(Sender: TObject);
begin
     if (MovingsSelect.RecordCount>0)
     then begin
               with TMovingsRedact_Form.Create(self,fmModify,StrToInt64(MovingsSelect.FieldByName('ID_MAN_MOVING').AsString)) do
               begin
                    ShowModal;
                    Free;
               end;
     end;
end;

procedure TfmPCardMovingsPage.cxButton1Click(Sender: TObject);
  var T:TfrmMovingBonuses;
begin
     if (MovingsSelect.RecordCount>0)
     then begin
               if cxCheckBox5.Checked
               then T:=TfrmMovingBonuses.Create(self,
                                                StrToInt64(MovingsSelect.FieldByName('ID_MOVING_FOR_BONUS').AsString),
                                                id_level,
                                                LevelEdit.EditValue,
                                                id_level,
                                                Integer(isPCardView.Checked),
                                                MovingsSelect.FieldByName('DATE_BEG').Value,
                                                MovingsSelect.FieldByName('DATE_END').Value)
               else T:=TfrmMovingBonuses.Create(self,
                                                StrToInt64(MovingsSelect.FieldByName('ID_MOVING_FOR_BONUS').AsString),
                                                null,
                                                LevelEdit.EditValue,
                                                id_level,
                                                Integer(isPCardView.Checked),
                                                MovingsSelect.FieldByName('DATE_BEG').Value,
                                                MovingsSelect.FieldByName('DATE_END').Value);
               T.ShowModal;
               T.Free;
     end;
end;

procedure TfmPCardMovingsPage.ReportDataViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var T:TUP_uMovingDep;
    UpdateSP:TpFibStoredProc;
    SelectSP:TpFIBDataSet;
    MAY_EDIT:integer;
begin
     if (( Key = VK_F12) and (ssShift in Shift))
     then begin
               ShowInfo(MovingsSelect);
     end;

     if  (( Key = VK_F9) and (ssCtrl in Shift))
     then begin
             SelectSP:=TpFibDataset.Create(self);
             SelectSP.Database    :=DB;
             SelectSP.Transaction :=ReadTransaction;
             SelectSP.SelectSQL.Text:='select MAY_EDIT_MOV_DEP from UP_SYS_INI_CONSTS';
             SelectSP.Open;
             SelectSP.FetchAll;
             if  VarIsNull(SelectSP.FieldByName('MAY_EDIT_MOV_DEP').Value)
             then MAY_EDIT:=0
             else MAY_EDIT:=SelectSP.FieldByName('MAY_EDIT_MOV_DEP').Value;
             SelectSP.Close;
             
           if (MAY_EDIT=1) then
           begin
            if (MovingsSelect.RecordCount>0)
             then begin
                       T:=TUP_uMovingDep.Create(self,DB.Handle, StrToInt64(MovingsSelect.FieldByName('ID_MAN_MOVING').AsString));
                       if T.ShowModal=mrOk  then
                       begin
                           UpdateSP:=TpFibStoredProc.Create(self);
                           UpdateSP.Database    :=DB;
                           UpdateSP.Transaction :=WriteTransaction;
                           WriteTransaction.StartTransaction;
                           UpdateSP.StoredProcName:='UP_DT_MOV_DEP_UPDATE';
                           UpdateSP.Prepare;
                           UpdateSP.ParamByName('id_man_moving').asInt64  :=StrToInt64(MovingsSelect.FieldByName('ID_MAN_MOVING').AsString);
                           UpdateSP.ParamByName('id_department').Value           :=T.Per_Department.Value;
                           UpdateSP.ExecProc;
                           UpdateSP.Close;
                           UpdateSP.Free;
                           WriteTransaction.Commit;

                       end;
                       T.Free;
                       MovingsSelect.Close;
                       MovingsSelect.Open;
                       SmetsDataSet.Close;
                       SmetsDataSet.Open;
                       ReportDataView.ViewData.Expand(true);

             end;
           end;
     end;
end;

procedure TfmPCardMovingsPage.SmViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (( Key = VK_F12) and (ssShift in Shift))
     then begin
               ShowInfo(SmetsDataSet);
     end;


end;

procedure TfmPCardMovingsPage.cxCheckBox4PropertiesChange(Sender: TObject);
begin
     DateBegCol.Visible:=cxCheckBox4.Checked;
     DateEndCol.Visible:=cxCheckBox4.Checked;
     cxgrdbclmnOkladCol.Visible:=cxCheckBox4.Checked;
     SmViewDBColumn1.Visible:=cxCheckBox1.Checked;
     SmViewDBColumn1.Visible:=cxCheckBox3.Checked;
     SmViewDBColumn1.Visible:=cxCheckBox4.Checked;

     KYVSaveIntoRegistry('TfmPCardMovingsPage_cxCheckBox4',IntToStr(Integer(cxCheckBox4.Checked)),GetUserId);
end;

procedure TfmPCardMovingsPage.cxgrdbclmnReportDataViewDBColumn3StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
var LocStyle:TcxStyle;
begin
    LocStyle:=TcxStyle.Create(nil);
    LocStyle.TextColor:=clRed;
    AStyle:=LocStyle;
end;

procedure TfmPCardMovingsPage.cxCheckBox5PropertiesChange(Sender: TObject);
begin
    LevelEdit.Enabled:=cxCheckBox5.Checked;

    Screen.Cursor:=crHourGlass;
    //OnDate.Visible:=cxCB_ShowOld.Checked;

    if DB.Connected
    then begin
              GetData;

              if not cxCB_ShowOld.Checked
              then begin
                        ReportDataView.ViewData.Expand(true);
              end
              else begin
                        ReportDataView.ViewData.Expand(true);
              end;
    end;          

    Screen.Cursor:=crDefault;

    KYVSaveIntoRegistry('TfmPCardMovingsPage_cxCheckBox5',IntToStr(Integer(cxCheckBox5.Checked)),GetUserId);
end;

procedure TfmPCardMovingsPage.LevelEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
      Params:TUnivParams;
      OutPut : TRxMemoryData;
begin
      Params.FormCaption:='Довідник рівнів актуальності';
      Params.ShowMode:=fsmSelect;
      Params.ShowButtons:=[fbExit];
      Params.TableName:='UP_SYS_LEVEL';
      Params.Fields:='LEVEL_ORDER,LEVEL_NAME,ID_LEVEL';
      Params.FieldsName:='Порядок,Назва';
      Params.KeyField:='ID_LEVEL';
      Params.ReturnFields:='LEVEL_ORDER,LEVEL_NAME,ID_LEVEL';
      Params.DBHandle:=Integer(DB.Handle);

      OutPut:=TRxMemoryData.Create(self);

      if GetUnivSprav(Params,OutPut)
      then begin
                id_level:=output['ID_LEVEL'];
                LevelEdit.Text:=VarToStr(output['LEVEL_NAME']);
                GetData;

                if not cxCB_ShowOld.Checked
                then begin
                          ReportDataView.ViewData.Expand(true);
                end
                else begin
                          ReportDataView.ViewData.Expand(true);
                end;
      end;
end;

procedure TfmPCardMovingsPage.GetData;
var id_man_mov:Int64;
begin

    Screen.Cursor:=crHourGlass;
    id_man_mov:=-1;


    if MovingsSelect.Active
    then begin
              if (MovingsSelect.RecordCount>0)
              then id_man_mov:=TFIBBCDField(MovingsSelect.FieldByName('ID_man_moving')).AsInt64
              else id_man_mov:=-1;

              MovingsSelect.Close;

    end;
    MovingsSelect.ParamByName('Id_PCard').AsInteger :=Id_PCard;
    if not cxCB_ShowOld.Checked
    then begin
              MovingsSelect.ParamByName('Act_date').AsDate    :=VarAsType(OnDate.Value, varDate);

              DateBegCol.DataBinding.FieldName:='DATE_BEG';
              DateEndCol.DataBinding.FieldName:='DATE_END';
    end
    else begin
              MovingsSelect.ParamByName('Act_date').Value     :=null;

              DateBegCol.DataBinding.FieldName:='DATE_BEG';
              DateEndCol.DataBinding.FieldName:='DATE_END';
    end;

    if not cxCheckBox5.Checked
    then MovingsSelect.ParamByName('id_level').Value     :=null
    else MovingsSelect.ParamByName('id_level').Value     :=id_level;

    if isPCardView.Checked
    then MovingsSelect.ParamByName('check_mode').Value:=1
    else MovingsSelect.ParamByName('check_mode').Value:=0;
    

    MovingsSelect.Open;

    ReportDataView.ViewData.Expand(true);

    MovingsSelect.Locate('id_man_moving',id_man_mov,[]);

    try
       ReportDataView.Controller.FocusedRowIndex:=ReportDataView.Controller.FocusedRowIndex+1;
    except
    end;

    Screen.Cursor:=crDefault;
end;

procedure TfmPCardMovingsPage.isPCardViewPropertiesChange(Sender: TObject);
begin
     cxCheckBox4.Enabled:=not isPCardView.Checked;
     GetData;
     KYVSaveIntoRegistry('TfmPCardMovingsPage_isPCardView',IntToStr(Integer(isPCardView.Checked)),GetUserId);
end;

procedure TfmPCardMovingsPage.DInfoDataSetAfterOpen(DataSet: TDataSet);
begin
     if (DInfoDataSet.RecordCount>0)
     then begin
               if DInfoDataSet.FieldByName('ID_DISMISS_NOW').Value=1
               then begin
                         TabSheet3.TabVisible:=true;
                         PageControl1.ActivePage:=TabSheet3;
               end
               else begin
                         TabSheet3.TabVisible:=false;
                         PageControl1.ActivePage:=TabSheet1;
               end;
     end
     else begin
               TabSheet3.TabVisible:=false;
               PageControl1.ActivePage:=TabSheet1;
     end;
end;

procedure TfmPCardMovingsPage.MovingsSelectEndScroll(DataSet: TDataSet);
begin
   DateWorkBeg.EditText:='';
   if not MovingsSelect.IsEmpty then
   begin
      //Showmessage('w='+IntToStr(MovingsSelect['id_work_dog_moving']));
      WorkDateBegDset.Close;
      WorkDateBegDset.SQLs.SelectSQL.Text:='select distinct * from UP_WORKDOG_JN_DATEBEG_SEL(:id_work_dog_moving)';
      WorkDateBegDset.ParamByName('id_work_dog_moving').AsInt64:=MovingsSelect['id_work_dog_moving'];
      WorkDateBegDset.Open;
      if not VarIsNull(WorkDateBegDset['Date_Beg']) then DateWorkBeg.Date:=WorkDateBegDset['Date_Beg'];
   end;
end;

procedure TfmPCardMovingsPage.SpeedButton1Click(Sender: TObject);
var sDate:TDate;
begin
   if MovingsSelect.IsEmpty then Exit;
   if DateWorkBeg.Text<>'' then
   begin
      try
        sDate:=StrToDate(DateWorkBeg.Text);
      except
         agMessageDlg('Увага!', 'Не вірний формат дати!', mtInformation, [mbOK]);
         Exit;
      end;
   end;
   if agMessageDlg('Увага!', 'Ви дійсно бажаєте внести зміни?', mtInformation, [mbYes, mbNo])=mrYes then
   begin
       StorProc.StoredProcName:='UP_WORKDOG_JN_DATEBEG_FILL';
       StorProc.Transaction.StartTransaction;
       StorProc.Prepare;
       StorProc.ParamByName('Id_Work_Dog_Moving').AsInt64:=MovingsSelect['id_work_dog_moving'];
       if DateWorkBeg.Text='' then StorProc.ParamByName('Date_Beg').Value:=null
       else StorProc.ParamByName('Date_Beg').AsDate:=sDate;
       try
          StorProc.ExecProc;
          StorProc.Transaction.Commit;
       except on E:Exception
              do begin
                   agMessageDlg('Увага!', E.Message, mtInformation, [mbOK]);
                   StorProc.Transaction.Rollback;
              end;
       end;
   end; 
end;

end.
