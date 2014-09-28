unit UpOrderListSettings;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxCheckBox, cxControls, cxContainer, cxEdit, cxTextEdit,
    cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
    cxDBLookupComboBox, StdCtrls, Buttons, ExtCtrls, DB, FIBDataSet,
    pFIBDataSet, pFibStoredProc, cxCalendar, ComCtrls, cxCalc, cxStyles,
    cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData,
    ToolWin, ImgList, cxGridLevel, cxGridCustomTableView, cxGridTableView,
    cxGridDBTableView, cxGridCustomView, cxGrid, cxClasses, cxColorComboBox,
    cxButtonEdit, cxLookAndFeelPainters, cxButtons, cxSplitter, UpDefSignersFrame;
type
    TfrmGetSettings = class(TForm)
        Panel1: TPanel;
        Panel2: TPanel;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        PageControl1: TPageControl;
        TabSheet1: TTabSheet;
        TabSheet2: TTabSheet;
        Label2: TLabel;
        LevelsObject: TcxLookupComboBox;
        Label1: TLabel;
        TypesObject: TcxLookupComboBox;
        UseAccessInfo: TcxCheckBox;
        UseMaxRateCount: TcxCheckBox;
        MaxRateCount: TcxCalcEdit;
        TabSheet3: TTabSheet;
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
        ItemsGrid: TcxGrid;
        LevelsView: TcxGridDBTableView;
        cxGridDBColumn5: TcxGridDBColumn;
        cxGridDBColumn6: TcxGridDBColumn;
        cxGridDBColumn7: TcxGridDBColumn;
        cxGridLevel6: TcxGridLevel;
        IL_Orders: TImageList;
        ToolBar1: TToolBar;
        ToolButton2: TToolButton;
        RefreshButton: TToolButton;
        LevelsViewDBColumn1: TcxGridDBColumn;
        LevelsViewDBColumn2: TcxGridDBColumn;
        LevelsViewDBColumn3: TcxGridDBColumn;
        RETURN_DAY_COUNT: TcxTextEdit;
        Label3: TLabel;
        Label4: TLabel;
        Label5: TLabel;
        ReestrObject: TcxLookupComboBox;
        USE_CHECK_MAX_POCHAS_COUNT: TcxCheckBox;
        MAX_POCHAS_COUNT: TcxCalcEdit;
        USE_RAISE_ABSORB: TcxCheckBox;
        TabSheet4: TTabSheet;
        ToolBar2: TToolBar;
        ToolButton1: TToolButton;
        cxGrid1: TcxGrid;
        TypesView: TcxGridDBTableView;
        cxGridDBColumn1: TcxGridDBColumn;
        cxGridDBColumn2: TcxGridDBColumn;
        cxGridDBColumn3: TcxGridDBColumn;
        cxGridDBColumn4: TcxGridDBColumn;
        cxGridLevel1: TcxGridLevel;
        TypesViewDBColumn1: TcxGridDBColumn;
        TabSheet5: TTabSheet;
        Label6: TLabel;
        HOLIDAY_FOR_SOVMEST_FULL_NAME: TcxButtonEdit;
        USE_AUTO_HOLIDAY_FOR_SOVMEST: TcxCheckBox;
        Grid: TcxGrid;
        PlanBplView: TcxGridDBTableView;
        cxGridDBColumn8: TcxGridDBColumn;
        cxGridDBColumn9: TcxGridDBColumn;
        cxGridDBColumn10: TcxGridDBColumn;
        Level: TcxGridLevel;
        cxButton1: TcxButton;
        cxButton2: TcxButton;
        Label11: TLabel;
        TabSheet6: TTabSheet;
        Label7: TLabel;
        ACCEPT_SHADOW_ID_TYPE_TEXT: TcxButtonEdit;
        Label8: TLabel;
        SET_BONUS_SHADOW_ID_TYPE_TEXT: TcxButtonEdit;
        Label9: TLabel;
        SET_HOLIDAY_SHADOW_ID_TYPE_TEXT: TcxButtonEdit;
        Label10: TLabel;
        SET_COMPENSS_SHADOW_ID_TYPE_TEXT: TcxButtonEdit;
        Label12: TLabel;
        DEFAULT_WORK_LEVEL_TEXT: TcxButtonEdit;
        Label13: TLabel;
        SET_AWAY_HOLIDAY_SHADOW_TEXT: TcxButtonEdit;
        TabSheet7: TTabSheet;
        cxGrid2: TcxGrid;
        ExtRepView: TcxGridDBTableView;
        cxGridDBColumn11: TcxGridDBColumn;
        cxGridDBColumn12: TcxGridDBColumn;
        cxGridDBColumn13: TcxGridDBColumn;
        cxGridLevel2: TcxGridLevel;
        cxButton3: TcxButton;
        cxButton4: TcxButton;
        PERMIT_NOT_UNIQ_ORDER_NUM: TcxCheckBox;
        ToolButton4: TToolButton;
        Label14: TLabel;
        SET_FULL_AWAY_INST_NAME: TcxButtonEdit;
        ToolButton3: TToolButton;
        Label15: TLabel;
        CheckReestrAttr: TcxLookupComboBox;
        SignTypes: TpFIBDataSet;
        Label16: TLabel;
        CUR_PROJECT_NUM: TcxTextEdit;
        TabSheet8: TTabSheet;
        Panel3: TPanel;
        PageControl2: TPageControl;
        ENABLE_EDIT_PROJECT_NUM: TcxCheckBox;
        cxCheckBox1: TcxCheckBox;
        TypesViewDBColumn2: TcxGridDBColumn;
        Label17: TLabel;
        MOVE_SHADOW_NAME: TcxButtonEdit;
        Label18: TLabel;
        REMOVE_BONUS_SHADOW_NAME: TcxButtonEdit;
        cxgrdbclmnLevelsViewDBColumn4: TcxGridDBColumn;
        cxchckbxMAY_WORK_WITH_DISMISS: TcxCheckBox;
        ts1: TTabSheet;
        cxButton5: TcxButton;
        cxButton6: TcxButton;
        cxButton7: TcxButton;
        cxGrid3: TcxGrid;
        SpecModulesView: TcxGridDBTableView;
        cxGridDBColumn14: TcxGridDBColumn;
        cxGridDBColumn15: TcxGridDBColumn;
        cxGridDBColumn16: TcxGridDBColumn;
        cxGridLevel3: TcxGridLevel;
        TypesViewDBColumn3: TcxGridDBColumn;
        CancelDBColumn: TcxGridDBColumn;
        procedure OkButtonClick(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure ToolButton2Click(Sender: TObject);
        procedure cxGridDBColumn7StylesGetContentStyle(
            Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
            AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
        procedure LevelsViewDBColumn1StylesGetContentStyle(
            Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
            AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
        procedure RefreshButtonClick(Sender: TObject);
        procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
            AButtonIndex: Integer);
        procedure ACCEPT_SHADOW_ID_TYPE_TEXTPropertiesButtonClick(
            Sender: TObject; AButtonIndex: Integer);
        procedure SET_BONUS_SHADOW_ID_TYPE_TEXTPropertiesButtonClick(
            Sender: TObject; AButtonIndex: Integer);
        procedure SET_COMPENSS_SHADOW_ID_TYPE_TEXTPropertiesButtonClick(
            Sender: TObject; AButtonIndex: Integer);
        procedure cxButton1Click(Sender: TObject);
        procedure cxButton2Click(Sender: TObject);
        procedure SET_HOLIDAY_SHADOW_ID_TYPE_TEXTPropertiesButtonClick(
            Sender: TObject; AButtonIndex: Integer);
        procedure DEFAULT_WORK_LEVEL_TEXTPropertiesButtonClick(Sender: TObject;
            AButtonIndex: Integer);
        procedure SET_AWAY_HOLIDAY_SHADOW_TEXTPropertiesButtonClick(
            Sender: TObject; AButtonIndex: Integer);
        procedure cxButton3Click(Sender: TObject);
        procedure cxButton4Click(Sender: TObject);
        procedure ToolButton1Click(Sender: TObject);
        procedure ToolButton4Click(Sender: TObject);
        procedure SET_FULL_AWAY_INST_NAMEPropertiesButtonClick(Sender: TObject;
            AButtonIndex: Integer);
        procedure ToolButton3Click(Sender: TObject);
        procedure PageControl2Change(Sender: TObject);
        procedure MOVE_SHADOW_NAMEPropertiesButtonClick(Sender: TObject;
            AButtonIndex: Integer);
        procedure REMOVE_BONUS_SHADOW_NAMEPropertiesButtonClick(
            Sender: TObject; AButtonIndex: Integer);
        procedure cxButton5Click(Sender: TObject);
        procedure cxButton7Click(Sender: TObject);
        procedure cxButton6Click(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
        ID_TYPE_HOLIDAY: Integer;
        ACCEPT_SHADOW_ID_TYPE: Integer;
        SET_BONUS_SHADOW_ID_TYPE: Integer;
        SET_COMPENSS_SHADOW_ID_TYPE: Integer;
        SET_HOLIDAY_SHADOW_ID_TYPE: Integer;
        SET_AWAY_HOLIDAY_SHADOW_ID_TYPE: Integer;
        MOVE_SHADOW_ID_TYPE: Integer;
        REMOVE_BONUS_SHADOW_ID_TYPE: Integer;
        DEFAULT_WORK_LEVEL: Integer;
        SET_FULL_AWAY_INST: Integer;
        Modules: array of TUP_DefSignersFrame;
        ModTypes: array of Int64;
        procedure TabVisible;
    end;

implementation

uses UpOrderList, ULevelsEdit, RxmemDS, uUnivSprav, UEditPlanBpl, BaseTypes,
    UEditExtReport, UEditTypes, uFormControl, USpecModuleEdit;

{$R *.dfm}

procedure TfrmGetSettings.OkButtonClick(Sender: TObject);
begin
    ModalResult := mrYes;
end;

procedure TfrmGetSettings.CancelButtonClick(Sender: TObject);
begin
    ModalResult := mrNo;
end;

procedure TfrmGetSettings.FormCreate(Sender: TObject);
begin
    LevelsObject.Properties.ListSource := TUpOrderListForm(self.Owner).LevelsObjectPathDataSource;
    TypesObject.Properties.ListSource := TUpOrderListForm(self.Owner).TypesObjectDataSource;
    ReestrObject.Properties.ListSource := TUpOrderListForm(self.Owner).OrderViewObjectDataSet;
    CheckReestrAttr.Properties.ListSource := TUpOrderListForm(self.Owner).CheckReestrAttrDataSource;

    LevelsView.DataController.DataSource := TUpOrderListForm(self.Owner).LevelsDataSource;
    TypesView.DataController.DataSource := TUpOrderListForm(self.Owner).TypesDataSource;
    SpecModulesView.DataController.DataSource := TUpOrderListForm(self.Owner).dsSpecModuleDataSource;

    PlanBplView.DataController.DataSource := TUpOrderListForm(self.Owner).PlanBplDataSource;
    ExtRepView.DataController.DataSource := TUpOrderListForm(self.Owner).ExtRepDataSource;
    SignTypes.Database := TUpOrderListForm(self.Owner).WorkDatabase;
    SignTypes.Transaction := TUpOrderListForm(self.Owner).ReadTransaction;



    PageControl1.ActivePageIndex := 0;

    TabVisible;
    PageControl2.OnChange(PageControl2);
end;

procedure TfrmGetSettings.ToolButton2Click(Sender: TObject);
var T: TfrmUpLevelsEdit;
    UpdateSP: TpFibStoredProc;
    id_: Integer;
begin
    T := TfrmUpLevelsEdit.Create(self);
    if LevelsView.DataController.DataSource.DataSet.FieldByName('FONT_COLOR').Value <> null
        then T.FontColor.ColorValue := LevelsView.DataController.DataSource.DataSet.FieldByName('FONT_COLOR').Value;

    if LevelsView.DataController.DataSource.DataSet.FieldByName('CONTENT_COLOR').Value <> null
        then T.ContentColor.ColorValue := LevelsView.DataController.DataSource.DataSet.FieldByName('CONTENT_COLOR').Value;

    T.levelName.Text := LevelsView.DataController.DataSource.DataSet.FieldByName('LEVEL_NAME').AsString;

    if LevelsView.DataController.DataSource.DataSet.FieldByName('ID_LEVEL').Value = -1
        then T.levelName.Enabled := false;

    if LevelsView.DataController.DataSource.DataSet.FieldByName('MAY_EDIT_REG_ATTR').Value <> null
        then T.cxchckbx1.Checked := Boolean(LevelsView.DataController.DataSource.DataSet.FieldByName('MAY_EDIT_REG_ATTR').AsInteger);

    if T.ShowModal = mrOk
        then begin
        id_ := LevelsView.DataController.DataSource.DataSet.FieldByName('ID_LEVEL').Value;
        UpdateSP := TpFibStoredProc.Create(self);
        UpdateSP.Database := TUpOrderListForm(self.Owner).WorkDatabase;
        UpdateSP.Transaction := TUpOrderListForm(self.Owner).WriteTransaction;
        TUpOrderListForm(self.Owner).WriteTransaction.StartTransaction;
        UpdateSP.StoredProcName := 'UP_SYS_LEVEL_UPD';
        UpdateSP.Prepare;
        UpdateSP.ParamByName('LEVEL_NAME').Value := T.levelName.Text;
        UpdateSP.ParamByName('FONT_COLOR').Value := T.FontColor.ColorValue;
        UpdateSP.ParamByName('CONTENT_COLOR').Value := T.ContentColor.ColorValue;
        UpdateSP.ParamByName('MAY_EDIT_REG_ATTR').Value := Integer(T.cxchckbx1.Checked);
        UpdateSP.ParamByName('ID_LEVEL').Value := LevelsView.DataController.DataSource.DataSet.FieldByName('ID_LEVEL').Value;
        UpdateSP.ExecProc;
        UpdateSP.Close;
        UpdateSP.Free;
        TUpOrderListForm(self.Owner).WriteTransaction.Commit;
        TpFibDataSet(LevelsView.DataController.DataSource.DataSet).CloseOpen(true);
        LevelsView.DataController.DataSource.DataSet.Locate('id_level', id_, []);
    end;
    T.Free;
end;

procedure TfrmGetSettings.cxGridDBColumn7StylesGetContentStyle(
    Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
    AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
var LocStyle: TcxStyle;
begin
    if ARecord.Values[4] <> null
        then begin
        LocStyle := TcxStyle.Create(nil);
        LocStyle.Color := ARecord.Values[4];
        AStyle := LocStyle;
    end;
end;

procedure TfrmGetSettings.LevelsViewDBColumn1StylesGetContentStyle(
    Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
    AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
var LocStyle: TcxStyle;
begin
    if ARecord.Values[5] <> null
        then begin
        LocStyle := TcxStyle.Create(nil);
        LocStyle.Color := ARecord.Values[5];
        AStyle := LocStyle;
    end
end;

procedure TfrmGetSettings.RefreshButtonClick(Sender: TObject);
begin
    TpFibDataSet(LevelsView.DataController.DataSource.DataSet).CloseOpen(true);
end;

procedure TfrmGetSettings.cxButtonEdit1PropertiesButtonClick(
    Sender: TObject; AButtonIndex: Integer);
var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
begin
    Params.FormCaption := 'Довідник типів відпусток';
    Params.ShowMode := fsmSelect;
    Params.ShowButtons := [fbExit];
    Params.TableName := 'HL_SP_TYPE_HOLIDAY_SEL';
    Params.Fields := 'FULL_NAME,ID_TYPE_HOLIDAY';
    Params.FieldsName := 'Назва';
    Params.KeyField := 'ID_TYPE_HOLIDAY';
    Params.ReturnFields := 'FULL_NAME,ID_TYPE_HOLIDAY';
    Params.DBHandle := Integer(TUpOrderListForm(self.Owner).WorkDatabase.Handle);

    OutPut := TRxMemoryData.Create(self);

    if GetUnivSprav(Params, OutPut)
        then begin
        ID_TYPE_HOLIDAY := output['ID_TYPE_HOLIDAY'];
        HOLIDAY_FOR_SOVMEST_FULL_NAME.Text := VarToStr(output['FULL_NAME']);
    end;
end;

procedure TfrmGetSettings.ACCEPT_SHADOW_ID_TYPE_TEXTPropertiesButtonClick(
    Sender: TObject; AButtonIndex: Integer);
var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
begin
    Params.FormCaption := 'Довідник типів наказів';
    Params.ShowMode := fsmSelect;
    Params.ShowButtons := [fbExit];
    Params.TableName := 'UP_DT_ORDER_TYPE_SEL_EX';
    Params.Fields := 'TYPE_NAME,ID_TYPE';
    Params.FieldsName := 'Назва';
    Params.KeyField := 'ID_TYPE';
    Params.ReturnFields := 'TYPE_NAME,ID_TYPE';
    Params.DBHandle := Integer(TUpOrderListForm(self.Owner).WorkDatabase.Handle);

    OutPut := TRxMemoryData.Create(self);

    if GetUnivSprav(Params, OutPut)
        then begin
        ACCEPT_SHADOW_ID_TYPE := output['ID_TYPE'];
        ACCEPT_SHADOW_ID_TYPE_TEXT.Text := VarToStr(output['TYPE_NAME']);
    end;
end;

procedure TfrmGetSettings.SET_BONUS_SHADOW_ID_TYPE_TEXTPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
begin
    Params.FormCaption := 'Довідник типів наказів';
    Params.ShowMode := fsmSelect;
    Params.ShowButtons := [fbExit];
    Params.TableName := 'UP_DT_ORDER_TYPE_SEL_EX';
    Params.Fields := 'TYPE_NAME,ID_TYPE';
    Params.FieldsName := 'Назва';
    Params.KeyField := 'ID_TYPE';
    Params.ReturnFields := 'TYPE_NAME,ID_TYPE';
    Params.DBHandle := Integer(TUpOrderListForm(self.Owner).WorkDatabase.Handle);

    OutPut := TRxMemoryData.Create(self);

    if GetUnivSprav(Params, OutPut)
        then begin
        SET_BONUS_SHADOW_ID_TYPE := output['ID_TYPE'];
        SET_BONUS_SHADOW_ID_TYPE_TEXT.Text := VarToStr(output['TYPE_NAME']);
    end;
end;


procedure TfrmGetSettings.SET_COMPENSS_SHADOW_ID_TYPE_TEXTPropertiesButtonClick(
    Sender: TObject; AButtonIndex: Integer);
var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
begin
    Params.FormCaption := 'Довідник типів наказів';
    Params.ShowMode := fsmSelect;
    Params.ShowButtons := [fbExit];
    Params.TableName := 'UP_DT_ORDER_TYPE_SEL_EX';
    Params.Fields := 'TYPE_NAME,ID_TYPE';
    Params.FieldsName := 'Назва';
    Params.KeyField := 'ID_TYPE';
    Params.ReturnFields := 'TYPE_NAME,ID_TYPE';
    Params.DBHandle := Integer(TUpOrderListForm(self.Owner).WorkDatabase.Handle);

    OutPut := TRxMemoryData.Create(self);

    if GetUnivSprav(Params, OutPut)
        then begin
        SET_COMPENSS_SHADOW_ID_TYPE := output['ID_TYPE'];
        SET_COMPENSS_SHADOW_ID_TYPE_TEXT.Text := VarToStr(output['TYPE_NAME']);
    end;
end;

procedure TfrmGetSettings.cxButton1Click(Sender: TObject);
var T: TfrmEditPlanBpl;
    InsertSP: TpFibStoredProc;
begin
    T := TfrmEditPlanBpl.Create(self);
    if T.ShowModal = mrYes
        then begin
        InsertSP := TpFibStoredProc.Create(self);
        InsertSP.Database := TUpOrderListForm(self.Owner).WorkDatabase;
        InsertSP.Transaction := TUpOrderListForm(self.Owner).WriteTransaction;
        TUpOrderListForm(self.Owner).WriteTransaction.StartTransaction;
        InsertSP.StoredProcName := 'HL_SYS_BPL_INS';
        InsertSP.Prepare;
        InsertSP.ParamByName('BPL_NAME').Value := T.BplName.Text;
        InsertSP.ParamByName('DATE_BEG').Value := T.DateStart.Date;
        InsertSP.ExecProc;
        TUpOrderListForm(self.Owner).WriteTransaction.Commit;
        TUpOrderListForm(self.Owner).PlanBplDataSet.CloseOpen(true);
        InsertSP.Close;
        InsertSP.Free;
    end;
    T.Free;

end;

procedure TfrmGetSettings.cxButton2Click(Sender: TObject);
var DropSP: TpFibStoredProc;
begin
    if TUpOrderListForm(self.Owner).PlanBplDataSet.RecordCount > 0
        then begin
        if agMessageDlg('Увага!', 'Ви хочете видалити запис?', mtConfirmation, [mbYes, MbNo]) = mrYes
            then begin
            DropSP := TpFibStoredProc.Create(self);
            DropSP.Database := TUpOrderListForm(self.Owner).WorkDatabase;
            DropSP.Transaction := TUpOrderListForm(self.Owner).WriteTransaction;
            TUpOrderListForm(self.Owner).WriteTransaction.StartTransaction;
            DropSP.StoredProcName := 'HL_SYS_BPL_DEL';
            DropSP.Prepare;
            DropSP.ParamByName('ID_BPL').Value := TUpOrderListForm(self.Owner).PlanBplDataSet.FieldByName('ID_BPL').Value;
            DropSP.ExecProc;
            TUpOrderListForm(self.Owner).WriteTransaction.Commit;
            TUpOrderListForm(self.Owner).PlanBplDataSet.CloseOpen(true);
            DropSP.Close;
            DropSP.Free;
        end;
    end;
end;

procedure TfrmGetSettings.SET_HOLIDAY_SHADOW_ID_TYPE_TEXTPropertiesButtonClick(
    Sender: TObject; AButtonIndex: Integer);
var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
begin
    Params.FormCaption := 'Довідник типів наказів';
    Params.ShowMode := fsmSelect;
    Params.ShowButtons := [fbExit];
    Params.TableName := 'UP_DT_ORDER_TYPE_SEL_EX';
    Params.Fields := 'TYPE_NAME,ID_TYPE';
    Params.FieldsName := 'Назва';
    Params.KeyField := 'ID_TYPE';
    Params.ReturnFields := 'TYPE_NAME,ID_TYPE';
    Params.DBHandle := Integer(TUpOrderListForm(self.Owner).WorkDatabase.Handle);

    OutPut := TRxMemoryData.Create(self);

    if GetUnivSprav(Params, OutPut)
        then begin
        SET_HOLIDAY_SHADOW_ID_TYPE := output['ID_TYPE'];
        SET_HOLIDAY_SHADOW_ID_TYPE_TEXT.Text := VarToStr(output['TYPE_NAME']);
    end;
end;

procedure TfrmGetSettings.DEFAULT_WORK_LEVEL_TEXTPropertiesButtonClick(
    Sender: TObject; AButtonIndex: Integer);
var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
begin
    Params.FormCaption := 'Довідник рівнів актуальності';
    Params.ShowMode := fsmSelect;
    Params.ShowButtons := [fbExit];
    Params.TableName := 'UP_SYS_LEVEL';
    Params.Fields := 'LEVEL_ORDER,LEVEL_NAME,ID_LEVEL';
    Params.FieldsName := 'Порядок,Назва';
    Params.KeyField := 'ID_LEVEL';
    Params.ReturnFields := 'LEVEL_ORDER,LEVEL_NAME,ID_LEVEL';
    Params.DBHandle := Integer(TUpOrderListForm(self.Owner).WorkDatabase.Handle);

    OutPut := TRxMemoryData.Create(self);

    if GetUnivSprav(Params, OutPut)
        then begin
        DEFAULT_WORK_LEVEL := output['ID_LEVEL'];
        DEFAULT_WORK_LEVEL_TEXT.Text := VarToStr(output['LEVEL_NAME']);
    end;

end;

procedure TfrmGetSettings.SET_AWAY_HOLIDAY_SHADOW_TEXTPropertiesButtonClick(
    Sender: TObject; AButtonIndex: Integer);
var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
begin
    Params.FormCaption := 'Довідник типів наказів';
    Params.ShowMode := fsmSelect;
    Params.ShowButtons := [fbExit];
    Params.TableName := 'UP_DT_ORDER_TYPE_SEL_EX';
    Params.Fields := 'TYPE_NAME,ID_TYPE';
    Params.FieldsName := 'Назва';
    Params.KeyField := 'ID_TYPE';
    Params.ReturnFields := 'TYPE_NAME,ID_TYPE';
    Params.DBHandle := Integer(TUpOrderListForm(self.Owner).WorkDatabase.Handle);

    OutPut := TRxMemoryData.Create(self);

    if GetUnivSprav(Params, OutPut)
        then begin
        SET_AWAY_HOLIDAY_SHADOW_ID_TYPE := output['ID_TYPE'];
        SET_AWAY_HOLIDAY_SHADOW_TEXT.Text := VarToStr(output['TYPE_NAME']);
    end;
end;

procedure TfrmGetSettings.cxButton3Click(Sender: TObject);
var T: TfrmGetExtReport;
    InsertSp: TpFibStoredProc;
begin
    T := TfrmGetExtReport.Create(self);
    if T.ShowModal = mrYes
        then begin
        InsertSp := TpFibStoredProc.Create(self);
        InsertSp.Database := TUpOrderListForm(self.Owner).WorkDatabase;
        InsertSp.Transaction := TUpOrderListForm(self.Owner).WriteTransaction;
        TUpOrderListForm(self.Owner).WriteTransaction.StartTransaction;
        InsertSp.StoredProcName := 'UP_DT_ORDER_TYPE_EXT_REPORT_INS';
        InsertSp.Prepare;
        InsertSp.ParamByName('REPORT_TITLE').Value := T.ReportName.EditValue;
        InsertSp.ParamByName('ID_ORDER_TYPE').Value := T.id_order_type;
        InsertSp.ParamByName('MODULE').Value := T.ReportModule.EditValue;
        InsertSp.ExecProc;
        InsertSp.Close;
        InsertSp.Free;
        TUpOrderListForm(self.Owner).WriteTransaction.Commit;
        TUpOrderListForm(self.Owner).ExtRepDataSet.CloseOpen(true);
    end;
    T.Free;
end;

procedure TfrmGetSettings.cxButton4Click(Sender: TObject);
var InsertSp: TpFibStoredProc;
begin
    if TUpOrderListForm(self.Owner).ExtRepDataSet.RecordCount > 0
        then begin
        if agMessageDlg('Увага!', 'Ви хочете видалити запис?', mtConfirmation, [mbYes, mbNo]) = mryES
            then begin
            InsertSp := TpFibStoredProc.Create(self);
            InsertSp.Database := TUpOrderListForm(self.Owner).WorkDatabase;
            InsertSp.Transaction := TUpOrderListForm(self.Owner).WriteTransaction;
            TUpOrderListForm(self.Owner).WriteTransaction.StartTransaction;
            InsertSp.StoredProcName := 'UP_DT_ORDER_TYPE_EXT_REPORT_DEL';
            InsertSp.Prepare;
            InsertSp.ParamByName('ID_REPORT').Value := TUpOrderListForm(self.Owner).ExtRepDataSet.FieldByName('ID_REPORT').Value;
            InsertSp.ExecProc;
            InsertSp.Close;
            InsertSp.Free;
            TUpOrderListForm(self.Owner).WriteTransaction.Commit;
            TUpOrderListForm(self.Owner).ExtRepDataSet.CloseOpen(true);
        end;
    end;
end;

procedure TfrmGetSettings.ToolButton1Click(Sender: TObject);
var
    T: TfrmEditTypeInfo;
    InsertSp: TpFibStoredProc;
    id: integer;
begin
    if (TUpOrderListForm(self.Owner).TypesDataSet.RecordCount > 0)
        then begin
        T := TfrmEditTypeInfo.Create(self);
        T.Title.EditValue := TUpOrderListForm(self.Owner).TypesDataSet.FieldByName('TYPE_NAME').Value;
        T.BplName.EditValue := TUpOrderListForm(self.Owner).TypesDataSet.FieldByName('BPL_NAME').Value;
        T.PrintShablon.EditValue := TUpOrderListForm(self.Owner).TypesDataSet.FieldByName('SHABLON_NAME').Value;
        T.PrintProcedure.EditValue := TUpOrderListForm(self.Owner).TypesDataSet.FieldByName('PROCEDURE_NAME').Value;

        if TUpOrderListForm(self.Owner).TypesDataSet.FieldByName('IS_ACTIVE').Value <> NULL
            then T.Is_Active.Checked := TUpOrderListForm(self.Owner).TypesDataSet.FieldByName('IS_ACTIVE').Value;

        if TUpOrderListForm(self.Owner).TypesDataSet.FieldByName('USE_LOGICAL_LINK').Value <> NULL
            then T.use_logic_link.Checked := TUpOrderListForm(self.Owner).TypesDataSet.FieldByName('USE_LOGICAL_LINK').Value;

        if TUpOrderListForm(self.Owner).TypesDataSet.FieldByName('SHOW_IN_PCARD').Value <> NULL
            then T.SHOW_IN_PCARD.Checked := TUpOrderListForm(self.Owner).TypesDataSet.FieldByName('SHOW_IN_PCARD').Value;

        if TUpOrderListForm(self.Owner).TypesDataSet.FieldByName('IS_CANCEL').Value <> NULL
            then T.IS_CANCEL.Checked := TUpOrderListForm(self.Owner).TypesDataSet.FieldByName('IS_CANCEL').Value;

        if T.ShowModal = mrYes
            then begin
            InsertSp := TpFibStoredProc.Create(self);
            InsertSp.Database := TUpOrderListForm(self.Owner).WorkDatabase;
            InsertSp.Transaction := TUpOrderListForm(self.Owner).WriteTransaction;
            TUpOrderListForm(self.Owner).WriteTransaction.StartTransaction;
            InsertSp.StoredProcName := 'UP_DT_ORDER_TYPE_UPD';
            InsertSp.Prepare;
            id := TUpOrderListForm(self.Owner).TypesDataSet.FieldByName('ID_TYPE').Value;
            InsertSp.ParamByName('ID_TYPE').Value := TUpOrderListForm(self.Owner).TypesDataSet.FieldByName('ID_TYPE').Value;
            InsertSp.ParamByName('TYPE_NAME').Value := T.Title.EditValue;
            InsertSp.ParamByName('BPL_NAME').Value := T.BplName.EditValue;
            InsertSp.ParamByName('SHABLON_NAME').Value := T.PrintShablon.EditValue;
            InsertSp.ParamByName('PROCEDURE_NAME').Value := T.PrintProcedure.EditValue;
            InsertSp.ParamByName('IS_ACTIVE').Value := Integer(T.Is_Active.Checked);
            InsertSp.ParamByName('USE_LOGICAL_LINK').Value := Integer(T.use_logic_link.Checked);
            InsertSp.ParamByName('SHOW_IN_PCARD').Value := Integer(T.SHOW_IN_PCARD.Checked);
            InsertSp.ParamByName('IS_CANCEL').Value := Integer(T.IS_CANCEL.Checked);

            InsertSp.ExecProc;
            InsertSp.Close;
            InsertSp.Free;
            TUpOrderListForm(self.Owner).WriteTransaction.Commit;
            TUpOrderListForm(self.Owner).TypesDataSet.CloseOpen(true);
            TUpOrderListForm(self.Owner).TypesDataSet.Locate('ID_TYPE', id, []);

        end;
        T.Free;
    end;
end;

procedure TfrmGetSettings.ToolButton4Click(Sender: TObject);
var
    InsertSp: TpFibStoredProc;
    id: integer;
begin
    if (TUpOrderListForm(self.Owner).TypesDataSet.RecordCount > 0)
        then begin
        InsertSp := TpFibStoredProc.Create(self);
        InsertSp.Database := TUpOrderListForm(self.Owner).WorkDatabase;
        InsertSp.Transaction := TUpOrderListForm(self.Owner).WriteTransaction;
        TUpOrderListForm(self.Owner).WriteTransaction.StartTransaction;
        InsertSp.StoredProcName := 'UP_DT_ORDER_TYPE_CLONE';
        InsertSp.Prepare;
        InsertSp.ParamByName('ID_TYPE').Value := TUpOrderListForm(self.Owner).TypesDataSet.FieldByName('ID_TYPE').Value;
        InsertSp.ExecProc;
        id := InsertSp.ParamByName('NEW_ID').Value;
        InsertSp.Close;
        InsertSp.Free;
        TUpOrderListForm(self.Owner).WriteTransaction.Commit;
        TUpOrderListForm(self.Owner).TypesDataSet.CloseOpen(true);
        TUpOrderListForm(self.Owner).TypesDataSet.Locate('ID_TYPE', id, []);
    end;

end;

procedure TfrmGetSettings.SET_FULL_AWAY_INST_NAMEPropertiesButtonClick(
    Sender: TObject; AButtonIndex: Integer);
var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
begin
    Params.FormCaption := 'Довідник типів наказів';
    Params.ShowMode := fsmSelect;
    Params.ShowButtons := [fbExit];
    Params.TableName := 'UP_DT_ORDER_TYPE_SEL_EX';
    Params.Fields := 'TYPE_NAME,ID_TYPE';
    Params.FieldsName := 'Назва';
    Params.KeyField := 'ID_TYPE';
    Params.ReturnFields := 'TYPE_NAME,ID_TYPE';
    Params.DBHandle := Integer(TUpOrderListForm(self.Owner).WorkDatabase.Handle);

    OutPut := TRxMemoryData.Create(self);

    if GetUnivSprav(Params, OutPut)
        then begin
        SET_FULL_AWAY_INST := output['ID_TYPE'];
        SET_FULL_AWAY_INST_NAME.Text := VarToStr(output['TYPE_NAME']);
    end;
end;

procedure TfrmGetSettings.ToolButton3Click(Sender: TObject);
var
    InsertSp: TpFibStoredProc;
begin
    if (TUpOrderListForm(self.Owner).TypesDataSet.RecordCount > 0)
        then begin
        if agMessageDlg('Увага!', 'Ви хочете видалити запис?', mtConfirmation, [mbYes, mbNo]) = mrYes
            then begin
            InsertSp := TpFibStoredProc.Create(self);
            InsertSp.Database := TUpOrderListForm(self.Owner).WorkDatabase;
            InsertSp.Transaction := TUpOrderListForm(self.Owner).WriteTransaction;
            TUpOrderListForm(self.Owner).WriteTransaction.StartTransaction;
            InsertSp.StoredProcName := 'UP_DT_ORDER_TYPE_DEL';
            InsertSp.Prepare;
            InsertSp.ParamByName('ID_TYPE').Value := TUpOrderListForm(self.Owner).TypesDataSet.FieldByName('ID_TYPE').Value;
            InsertSp.ExecProc;
            InsertSp.Close;
            InsertSp.Free;
            TUpOrderListForm(self.Owner).WriteTransaction.Commit;
            TUpOrderListForm(self.Owner).TypesDataSet.CacheDelete;
        end;
    end;
end;

procedure TfrmGetSettings.TabVisible;
var TabSheet: TTabSheet;
begin
    SignTypes.Open;
    SignTypes.First;
    while not SignTypes.Eof do
    begin
        SetLength(Modules, Length(Modules) + 1);
        SetLength(ModTypes, Length(ModTypes) + 1);
        ModTypes[High(ModTypes)] := SignTypes['ID_SIGN_TYPE'];
        Modules[High(Modules)] := nil;
        TabSheet := TTabSheet.Create(Self);
        TabSheet.Caption := SignTypes['type_Name'];
        TabSheet.PageControl := PageControl2;
        TabSheet.Tag := High(Modules);
        SignTypes.Next;
    end;
    SignTypes.Close;
end;


procedure TfrmGetSettings.PageControl2Change(Sender: TObject);
var
    ind: Integer;
    SignFrame: TUP_DefSignersFrame;
begin
    if PageControl2.ActivePage = nil then Exit;

    if PageControl2.ActivePage.Tag = -1 then Exit;

    ind := PageControl2.ActivePage.Tag;
    if Modules[ind] = nil
        then begin
        SignFrame := TUP_DefSignersFrame.Create(Self, ModTypes[ind], TUpOrderListForm(self.Owner).WorkDatabase.Handle);
        SignFrame.Name := 'SignFrame' + IntToStr(ind);
        Modules[ind] := SignFrame;

        Modules[ind].Parent := PageControl2.ActivePage;
        Modules[ind].Align := alClient;
    end;
end;

procedure TfrmGetSettings.MOVE_SHADOW_NAMEPropertiesButtonClick(
    Sender: TObject; AButtonIndex: Integer);
var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
begin
    Params.FormCaption := 'Довідник типів наказів';
    Params.ShowMode := fsmSelect;
    Params.ShowButtons := [fbExit];
    Params.TableName := 'UP_DT_ORDER_TYPE_SEL_EX';
    Params.Fields := 'TYPE_NAME,ID_TYPE';
    Params.FieldsName := 'Назва';
    Params.KeyField := 'ID_TYPE';
    Params.ReturnFields := 'TYPE_NAME,ID_TYPE';
    Params.DBHandle := Integer(TUpOrderListForm(self.Owner).WorkDatabase.Handle);

    OutPut := TRxMemoryData.Create(self);

    if GetUnivSprav(Params, OutPut)
        then begin
        self.MOVE_SHADOW_ID_TYPE := output['ID_TYPE'];
        MOVE_SHADOW_NAME.Text := VarToStr(output['TYPE_NAME']);
    end;
end;

procedure TfrmGetSettings.REMOVE_BONUS_SHADOW_NAMEPropertiesButtonClick(
    Sender: TObject; AButtonIndex: Integer);
var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
begin
    Params.FormCaption := 'Довідник типів наказів';
    Params.ShowMode := fsmSelect;
    Params.ShowButtons := [fbExit];
    Params.TableName := 'UP_DT_ORDER_TYPE_SEL_EX';
    Params.Fields := 'TYPE_NAME,ID_TYPE';
    Params.FieldsName := 'Назва';
    Params.KeyField := 'ID_TYPE';
    Params.ReturnFields := 'TYPE_NAME,ID_TYPE';
    Params.DBHandle := Integer(TUpOrderListForm(self.Owner).WorkDatabase.Handle);

    OutPut := TRxMemoryData.Create(self);

    if GetUnivSprav(Params, OutPut)
        then begin
        REMOVE_BONUS_SHADOW_ID_TYPE := output['ID_TYPE'];
        REMOVE_BONUS_SHADOW_NAME.Text := VarToStr(output['TYPE_NAME']);
    end;
end;

procedure TfrmGetSettings.cxButton5Click(Sender: TObject);
var
    T: TfrmSpecModuleEdit;
    InsertSp: TpFibStoredProc;
begin
    T := TfrmSpecModuleEdit.Create(self);
    if T.ShowModal = mrYes
        then begin
        InsertSp := TpFibStoredProc.Create(self);
        InsertSp.Database := TUpOrderListForm(self.Owner).WorkDatabase;
        InsertSp.Transaction := TUpOrderListForm(self.Owner).WriteTransaction;
        TUpOrderListForm(self.Owner).WriteTransaction.StartTransaction;
        InsertSp.StoredProcName := 'UP_DT_SPECIAL_EDIT_MODULES_INS';
        InsertSp.Prepare;
        InsertSp.ParamByName('SPEC_MODULE_NAME').Value := T.BplName.EditValue;
        InsertSp.ParamByName('ID_TYPE').Value := T.id_order_type;
        InsertSp.ParamByName('COMMENT').Value := T.cxtxtdtComment.EditValue;
        InsertSp.ExecProc;
        InsertSp.Close;
        InsertSp.Free;
        TUpOrderListForm(self.Owner).WriteTransaction.Commit;
        TUpOrderListForm(self.Owner).SpecModulesDataSet.CloseOpen(true);
    end;
    T.Free;
end;

procedure TfrmGetSettings.cxButton7Click(Sender: TObject);
var
    T: TfrmSpecModuleEdit;
    InsertSp: TpFibStoredProc;
begin
    if (TUpOrderListForm(self.Owner).SpecModulesDataSet.RecordCount > 0)
        then begin
        T := TfrmSpecModuleEdit.Create(self);
        T.BplName.EditValue := TUpOrderListForm(self.Owner).SpecModulesDataSet.FieldByName('SPEC_MODULE_NAME').Value;
        T.id_order_type := TUpOrderListForm(self.Owner).SpecModulesDataSet.FieldByName('ID_TYPE').Value;
        T.cxtxtdtComment.EditValue := TUpOrderListForm(self.Owner).SpecModulesDataSet.FieldByName('COMMENT').Value;
        T.OrderTypeText.EditValue := TUpOrderListForm(self.Owner).SpecModulesDataSet.FieldByName('TYPE_NAME').Value;

        if T.ShowModal = mrYes
            then begin
            InsertSp := TpFibStoredProc.Create(self);
            InsertSp.Database := TUpOrderListForm(self.Owner).WorkDatabase;
            InsertSp.Transaction := TUpOrderListForm(self.Owner).WriteTransaction;
            TUpOrderListForm(self.Owner).WriteTransaction.StartTransaction;
            InsertSp.StoredProcName := 'UP_DT_SPECIAL_EDIT_MODULES_UPD';
            InsertSp.Prepare;
            InsertSp.ParamByName('ID_MODULE').Value := TUpOrderListForm(self.Owner).SpecModulesDataSet.FieldByName('ID_MODULE').Value;
            InsertSp.ParamByName('SPEC_MODULE_NAME').Value := T.BplName.EditValue;
            InsertSp.ParamByName('ID_TYPE').Value := T.id_order_type;
            InsertSp.ParamByName('COMMENT').Value := T.cxtxtdtComment.EditValue;
            InsertSp.ExecProc;
            InsertSp.Close;
            InsertSp.Free;
            TUpOrderListForm(self.Owner).WriteTransaction.Commit;
            TUpOrderListForm(self.Owner).SpecModulesDataSet.CloseOpen(true);
        end;
        T.Free;
    end;
end;

procedure TfrmGetSettings.cxButton6Click(Sender: TObject);
var
    InsertSp: TpFibStoredProc;
begin
    if (TUpOrderListForm(self.Owner).SpecModulesDataSet.RecordCount > 0)
        then begin
        if agMessageDlg('Увага!', 'Ви хочете видалити запис?', mtConfirmation, [mbYes, mbNo]) = mrYes
            then begin
            InsertSp := TpFibStoredProc.Create(self);
            InsertSp.Database := TUpOrderListForm(self.Owner).WorkDatabase;
            InsertSp.Transaction := TUpOrderListForm(self.Owner).WriteTransaction;
            TUpOrderListForm(self.Owner).WriteTransaction.StartTransaction;
            InsertSp.StoredProcName := 'UP_DT_SPECIAL_EDIT_MODULES_DEL';
            InsertSp.Prepare;
            InsertSp.ParamByName('ID_MODULE').Value := TUpOrderListForm(self.Owner).SpecModulesDataSet.FieldByName('ID_MODULE').Value;
            InsertSp.ExecProc;
            InsertSp.Close;
            InsertSp.Free;
            TUpOrderListForm(self.Owner).WriteTransaction.Commit;
            TUpOrderListForm(self.Owner).SpecModulesDataSet.CacheDelete;
        end;
    end;
end;

end.
