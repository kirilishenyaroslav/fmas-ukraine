unit uPrK_PROT_ZACH;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, cxContainer, FIBDatabase,
    pFIBDatabase, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery,
    pFIBStoredProc, Placemnt, dxBar, dxBarExtItems, ActnList, ImgList,
    dxStatusBar, cxGridLevel, cxGridCustomTableView, cxGridTableView,
    cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
    cxGroupBox, cxSplitter, AArray, ibase, ib_externals, cxTextEdit, cxMaskEdit,
    cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxLabel,
    cxCheckBox;

type
    TFormPrK_PROT_ZACH = class(TForm)
        cxSplitterNapr: TcxSplitter;
        cxGroupBoxPrKPrikZ: TcxGroupBox;
        dxBarDockControl1: TdxBarDockControl;
        cxGridPrKPZ_Right: TcxGrid;
        cxGridPrKPZ_RightDBTableView1: TcxGridDBTableView;
        colNOMER_Prikaz: TcxGridDBColumn;
        colDATE_PRIKAZ: TcxGridDBColumn;
        colDATE_ZARAX: TcxGridDBColumn;
        cxGridPrKPZ_RightLevel1: TcxGridLevel;
        dxStatusBarPi: TdxStatusBar;
        cxGroupBoxPerIspitLeft: TcxGroupBox;
        cxGridPrKPZ: TcxGrid;
        cxGridPrKPZDBTableView1: TcxGridDBTableView;
        colNOMER: TcxGridDBColumn;
        cxGridPrKPZLevel1: TcxGridLevel;
        ImageListPrk: TImageList;
        ActionListPrK: TActionList;
        ActionADD: TAction;
        ActionChange: TAction;
        ActionDEL: TAction;
        ActionView: TAction;
        ActionObnov: TAction;
        ActionVibrat: TAction;
        ActionOtmena: TAction;
        ActionAddPr: TAction;
        ActionChangePr: TAction;
        ActionDelPr: TAction;
        ActionViewPr: TAction;
        StyleRepositoryPrk: TcxStyleRepository;
        cxStyle1: TcxStyle;
        cxStyle2: TcxStyle;
        cxStyle3: TcxStyle;
        cxStyle4: TcxStyle;
        cxStyle5: TcxStyle;
        cxStyle6: TcxStyle;
        cxStyleHeader: TcxStyle;
        cxStyle8: TcxStyle;
        cxStyle9: TcxStyle;
        cxStyleInactive: TcxStyle;
        cxStyle11: TcxStyle;
        cxStyle12: TcxStyle;
        cxStyleBackGround_Content: TcxStyle;
        cxStyleSelection: TcxStyle;
        dxBarManagerPrk: TdxBarManager;
        dxBarLargeButtonAdd: TdxBarLargeButton;
        dxBarLargeButtonChange: TdxBarLargeButton;
        dxBarLargeButtonDel: TdxBarLargeButton;
        dxBarLargeButtonVibrat: TdxBarLargeButton;
        dxBarLargeButtonObnov: TdxBarLargeButton;
        dxBarLargeButtonOtmena: TdxBarLargeButton;
        dxBarLargeButtonView: TdxBarLargeButton;
        dxBarLargeButtonAddPi: TdxBarLargeButton;
        dxBarLargeButtonChangePi: TdxBarLargeButton;
        dxBarLargeButtonDelPi: TdxBarLargeButton;
        dxBarLargeButtonViewPi: TdxBarLargeButton;
        FormStoragePrKPZ: TFormStorage;
        TransactionWritePrK: TpFIBTransaction;
        StoredProcPrK: TpFIBStoredProc;
        DataSetPrKPZ: TpFIBDataSet;
        TransactionReadPrK: TpFIBTransaction;
        DataBasePrk: TpFIBDatabase;
        DataSourcePrKPZ: TDataSource;
        DataSetPZ_Right: TpFIBDataSet;
        DataSourcePZ_Right: TDataSource;
        cxEditStyleControllerPrK: TcxEditStyleController;
        colDATE_FORM: TcxGridDBColumn;
        DataSetFob_Prot: TpFIBDataSet;
        DataSourceFob_Prot: TDataSource;
        cxGroupBox1: TcxGroupBox;
        cxLookupComboBoxFob_Prot: TcxLookupComboBox;
        dxBarPopupMenuPrikazAdd: TdxBarPopupMenu;
        ActionAddExistPr: TAction;
        dxBarButtonAddExistPr: TdxBarButton;
        ActionPrint: TAction;
        dxBarLargeButtonPrint: TdxBarLargeButton;
        ActionPrintPr: TAction;
        dxBarLargeButtonPrintPr: TdxBarLargeButton;
        ActionAbitShow: TAction;
        ActionAbitShowPr: TAction;
        dxBarLargeButtonAbitShow: TdxBarLargeButton;
        dxBarLargeButtonAbitShowPr: TdxBarLargeButton;
        cxLabelFob_Prot: TcxLabel;
        dxBarPopupMenuPrikazPrint: TdxBarPopupMenu;
        dxBarButtonPrintVitag: TdxBarButton;
        ActionPrintVitag: TAction;
        dxBarLargeButton1: TdxBarLargeButton;
        dxBarLargeButton2: TdxBarLargeButton;
        ActionContractsStudy: TAction;
    dxBarButton1: TdxBarButton;
    ActionPrintPovidomlennya: TAction;
        procedure FormCreate(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure ActionADDExecute(Sender: TObject);
        procedure cxLookupComboBoxFob_ProtPropertiesChange(Sender: TObject);
        procedure ActionAddPrExecute(Sender: TObject);
        procedure ActionChangePrExecute(Sender: TObject);
        procedure ActionViewPrExecute(Sender: TObject);
        procedure ActionDelPrExecute(Sender: TObject);
        procedure ActionObnovExecute(Sender: TObject);
        procedure ActionAddExistPrExecute(Sender: TObject);
        procedure ActionOtmenaExecute(Sender: TObject);
        procedure ActionChangeExecute(Sender: TObject);
        procedure ActionDELExecute(Sender: TObject);
        procedure ActionPrintExecute(Sender: TObject);
        procedure ActionPrintPrExecute(Sender: TObject);
        procedure ActionAbitShowExecute(Sender: TObject);
        procedure ActionAbitShowPrExecute(Sender: TObject);
        procedure ActionPrintVitagExecute(Sender: TObject);
        procedure ActionContractsStudyExecute(Sender: TObject);
    procedure ActionPrintPovidomlennyaExecute(Sender: TObject);
    private
        ID_NAME_PZ: string;
        ID_NAME_PZ_Right: string;
        ResultArray: TAArray;
        DBHANDLE: TISC_DB_HANDLE;
        TextViewColor: TColor;
        FSelectSQLTextPZRight: string;
        FSelectSQLTextPZ: string;
        FSelectSQLTextFobProt: string;
        procedure SetSelectSQLTextPZ(const Value: string);
        procedure SetSelectSQLTextPZRight(const Value: string);
        procedure InicCaption;
        procedure WriteIdFobProt;
        function ReadIdFobProt: int64;
        procedure obnovit_Right(id_obnovit: int64);
        procedure obnovit(id_obnovit: int64);
        procedure SetSelectSQLTextFobProt(const Value: string);
    public
        IndLang: integer;
        ID_USER_GLOBAL: Int64;
        ID_GOD_NABORA_GLOBAL: Int64;
        constructor Create(aOwner: TComponent; aParam: TAArray); overload;
        property SelectSQLTextFobProt: string read FSelectSQLTextFobProt write SetSelectSQLTextFobProt;
        property SelectSQLTextPZ: string read FSelectSQLTextPZ write SetSelectSQLTextPZ;
        property SelectSQLTextPZRight: string read FSelectSQLTextPZRight write SetSelectSQLTextPZRight;
    end;

procedure ShowAllPrkBpl(aOwner: TComponent; aParam: TAArray); stdcall;
exports ShowAllPrkBpl;

var
    FormPrK_PROT_ZACH: TFormPrK_PROT_ZACH;

implementation
uses
    uPrK_Resources, uConstants, uPrK_PROT_ZACH_Add,
    registry, uAddNewPRIK_ZACH, uAddExistPRIK_ZACH,
    uPrK_PROT_ZACH_Change, uPrK_Loader, uPrK_PZ_Abit_Show,
    uPrK_PROT_ZACH_SelFakDep;

{$R *.dfm}

procedure ShowAllPrkBpl(aOwner: TComponent; aParam: TAArray);
var
    T: TFormPrK_PROT_ZACH;
begin
    T := TFormPrK_PROT_ZACH.Create(aOwner, aParam);

    T.FormStyle := aParam['Input']['aFrmStyle'].AsVariant;
    case T.FormStyle of
        fsNormal: begin
                T.ShowModal;
                T.ActionVibrat.Enabled := true;
                T.dxBarLargeButtonVibrat.Visible := ivAlways;
            end;
        fsMDIChild: begin
                T.ActionVibrat.Enabled := false;
                T.dxBarLargeButtonVibrat.Visible := ivNever;
            end;
    else
        T.Free;
    end;
end;
{ TFormPrK_PROT_ZACH }

constructor TFormPrK_PROT_ZACH.Create(aOwner: TComponent; aParam: TAArray);
begin
    if Assigned(PVoid(aParam['Input']['aDBHANDLE'])) then
    begin
        DBHANDLE := PVoid(aParam['Input']['aDBHANDLE'].asInteger);
        ResultArray := aParam;
        IndLang := SelectLanguage;
        TextViewColor := cl3DLight;
        ID_USER_GLOBAL := ResultArray['Input']['ID_USER_GLOBAL'].AsInt64;
        ID_GOD_NABORA_GLOBAL := ResultArray['Input']['GodNabora'].AsInt64;
        inherited Create(aOwner);
        if SelectShemaColor = 1 then
        begin
            cxStyleBackGround_Content.Color := $00EBC4A4;
            cxStyleInactive.Color := $00F7EAD9;
            cxEditStyleControllerPrK.Style.Color := $00EBC4A4;
        end;
    end
    else ShowMessage('Ошибка HANDLE`a Базы');
end;

procedure TFormPrK_PROT_ZACH.FormCreate(Sender: TObject);
begin
  {ID_NAME должен стоять первым так как в SelectSQLText может делаться CloseOpen}
    ID_NAME_PZ := 'ID_DT_PROT_ZACH';
    ID_NAME_PZ_Right := 'ID_DT_PRIK_ZACH';

    SelectSQLTextFobProt := 'Select * from PRK_SP_FOB_PROT_SELECT';
    SelectSQLTextPZ := 'Select * from PRK_DT_PROT_ZACH_SELECT(' + IntToStr(ID_GOD_NABORA_GLOBAL) + ') where ?Mas_ID_SP_FOB_PROT=ID_SP_FOB_PROT';
    SelectSQLTextPZRight := 'Select * from PRK_DT_PRIK_ZACH_SELECT(' + IntToStr(ID_GOD_NABORA_GLOBAL) + ') where ?Mas_ID_DT_PROT_ZACH=ID_DT_PROT_ZACH';
    InicCaption;

  //CheckAccessAdd    :='';
  //CheckAccessChange :='';
  //CheckAccessDel    :='';
end;

procedure TFormPrK_PROT_ZACH.InicCaption;
begin
    TFormPrK_PROT_ZACH(self).Caption := nFormPrK_PROT_ZACH_Caption[IndLang];
    dxBarManagerPrk.CanCustomize := false;
    dxBarManagerPrk.Bars[0].BorderStyle := bbsNone;
    dxBarManagerPrk.Bars[0].ShowMark := false;
    dxBarManagerPrk.Bars[0].AllowClose := false;
    dxBarManagerPrk.Bars[0].AllowCustomizing := false;
    dxBarManagerPrk.Bars[0].AllowQuickCustomizing := false;
    dxBarManagerPrk.Bars[0].AllowReset := false;

    dxBarManagerPrk.Bars[1].BorderStyle := bbsNone;
    dxBarManagerPrk.Bars[1].ShowMark := false;
    dxBarManagerPrk.Bars[1].AllowClose := false;
    dxBarManagerPrk.Bars[1].AllowCustomizing := false;
    dxBarManagerPrk.Bars[1].AllowQuickCustomizing := false;
    dxBarManagerPrk.Bars[1].AllowReset := false;

    ActionADD.Caption := nAction_Add[IndLang];
    ActionAddExistPr.Caption := nActionAddExistPr[IndLang];
    ActionChange.Caption := nAction_ChangeRekvizit[IndLang];
    ActionDEL.Caption := nAction_Del[IndLang];
    ActionView.Caption := nAction_View[IndLang];
    ActionVibrat.Caption := nAction_Vibrat[IndLang];
    ActionObnov.Caption := nActiont_Obnov[IndLang];
    ActionOtmena.Caption := nAction_Exit[IndLang];
    ActionPrint.Caption := nActiontPrint[IndLang];
    ActionAbitShow.Caption := nActionAbitShow[IndLang];

    ActionAddPr.Caption := nAction_Add[IndLang];
    ActionChangePr.Caption := nAction_ChangeRekvizit[IndLang];
    ActionDelPr.Caption := nAction_Del[IndLang];
    ActionViewPr.Caption := nAction_View[IndLang];
    ActionPrintPr.Caption := nActiontPrint[IndLang];
    ActionAbitShowPr.Caption := nActionAbitShow[IndLang];
    ActionPrintVitag.Caption := nActiontPrintVitiag[IndLang];
    ActionContractsStudy.Caption := nActionContractsStudy[IndLang];
    ActionPrintPovidomlennya.Caption := nActiontPrintPovidomlennya[IndLang];


    ActionADD.Hint := nHintAction_Add[IndLang];
    ActionChange.Hint := nHintAction_ChangeRekvizit[IndLang];
    ActionDEL.Hint := nHintAction_Del[IndLang];
    ActionView.Hint := nHintAction_View[IndLang];
    ActionVibrat.Hint := nHintAction_Vibrat[IndLang];
    ActionObnov.Hint := nHintAction_Obnov[IndLang];
    ActionOtmena.Hint := nHintAction_Exit[IndLang];
    ActionPrint.Hint := nHintActiontPrint[IndLang];
    ActionAbitShow.Hint := nHintActionAbitShowProtokol[IndLang];

    ActionAddPr.Hint := nHintAction_Add[IndLang];
    ActionChangePr.Hint := nHintAction_ChangeRekvizit[IndLang];
    ActionDelPr.Hint := nHintAction_Del[IndLang];
    ActionViewPr.Hint := nHintAction_View[IndLang];
    ActionAbitShowPr.Hint := nHintActionAbitShowPrikaz[IndLang];
    ActionPrintVitag.Hint := nHintActiontPrintVitiag[IndLang];
    ActionContractsStudy.Hint := nHintActionContractsStudy[IndLang];
    ActionPrintPovidomlennya.Hint := nHintActiontPrintPovidomlennya[IndLang];

    dxStatusBarPi.Panels[0].Text := nStatBarAdd[IndLang];
    dxStatusBarPi.Panels[1].Text := nStatBarChange[IndLang];
    dxStatusBarPi.Panels[2].Text := nStatBarDel[IndLang];
    dxStatusBarPi.Panels[3].Text := nStatBarVibrat[IndLang];
    dxStatusBarPi.Panels[4].Text := nStatBarObnov[IndLang];
    dxStatusBarPi.Panels[5].Text := nStatBarExit[IndLang];

    cxLabelFob_Prot.Caption := nLabelFOB_PROT[IndLang];
    cxGroupBoxPrKPrikZ.Caption := ncxGroupBoxPrKPrikZ[IndLang];

    colNOMER.Caption := ncolNOMER[IndLang];
    colDATE_FORM.Caption := ncolDATE_FORM[IndLang];

    colNOMER_Prikaz.Caption := ncolNOMER_Prikaz[IndLang];
    colDATE_PRIKAZ.Caption := ncolDATE_PRIKAZ[IndLang];
    colDATE_ZARAX.Caption := ncolDATE_ZARAX[IndLang];
end;

procedure TFormPrK_PROT_ZACH.SetSelectSQLTextFobProt(const Value: string);
begin
    FSelectSQLTextFobProt := Value;
    DataBasePrk.close;
    DataSetFob_Prot.Active := false;
    DataBasePrk.Handle := DBHANDLE;
    DataBasePrk.DefaultTransaction := TransactionReadPrK;
    DataSetFob_Prot.Database := DataBasePrk;
    DataSetFob_Prot.Transaction := TransactionReadPrK;
    DataSetFob_Prot.SelectSQL.Clear;
    DataSetFob_Prot.SQLs.SelectSQL.Text := FSelectSQLTextFobProt;
    DataSetFob_Prot.CloseOpen(false);

    DataSetFob_Prot.Locate('ID_SP_FOB_PROT', ReadIdFobProt, []);
    if DataSetFob_Prot.FieldValues['SHORT_NAME'] <> Null
        then cxLookupComboBoxFob_Prot.Text := DataSetFob_Prot.FieldValues['SHORT_NAME'];
end;

procedure TFormPrK_PROT_ZACH.SetSelectSQLTextPZ(const Value: string);
begin
    FSelectSQLTextPZ := Value;
    DataSetPrKPZ.Active := false;
    DataSetPrKPZ.Database := DataBasePrk;
    DataSetPrKPZ.Transaction := TransactionReadPrK;
    DataSetPrKPZ.SelectSQL.Clear;
    DataSetPrKPZ.SQLs.SelectSQL.Text := FSelectSQLTextPZ;
    DataSetPrKPZ.CloseOpen(false);
end;

procedure TFormPrK_PROT_ZACH.SetSelectSQLTextPZRight(const Value: string);
begin
    FSelectSQLTextPZRight := Value;
    DataSetPZ_Right.Active := false;
    DataSetPZ_Right.Database := DataBasePrk;
    DataSetPZ_Right.Transaction := TransactionReadPrK;
    DataSetPZ_Right.SelectSQL.Clear;
    DataSetPZ_Right.SQLs.SelectSQL.Text := FSelectSQLTextPZRight;
    DataSetPZ_Right.CloseOpen(false);
end;

procedure TFormPrK_PROT_ZACH.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then begin
        ResultArray.Free;
        ResultArray := nil;
        Action := caFree;
    end;
end;

procedure TFormPrK_PROT_ZACH.ActionADDExecute(Sender: TObject);
var
    T: TFormPrK_PROT_ZACH_Add;
    id_Locate: int64;
begin
    id_Locate := -1;
    T := TFormPrK_PROT_ZACH_Add.Create(self);
    if T.ShowModal = MrOk
        then id_Locate := T.Id_OutPZ_Global;
    T.Free;
    T := nil;

    if id_Locate > 0 then
    begin
        DataSetPrKPZ.CloseOpen(false);
        DataSetPrKPZ.Locate(ID_NAME_PZ, id_Locate, []);
        DataSetPZ_Right.CloseOpen(false);
    end;
end;

procedure TFormPrK_PROT_ZACH.ActionChangeExecute(Sender: TObject);
var
    DataPRChange: TAArray;
    T: TFormPrK_PROT_ZACH_Change;
    TryAgain: boolean;
begin

    TryAgain := false;
    if DataSetPrKPZ.FieldValues[ID_NAME_PZ] <> Null then
    begin
        DataPRChange := TAArray.Create;
        DataPRChange['ID'].AsInt64 := DataSetPrKPZ.FieldValues[ID_NAME_PZ];
        DataPRChange['DATE_FORM'].AsVariant := DataSetPrKPZ.FieldValues['DATE_FORM'];
        DataPRChange['NOMER'].AsString := DataSetPrKPZ.FieldValues['NOMER'];

        T := TFormPrK_PROT_ZACH_Change.Create(self, DataPRChange);
        T.Caption := nFormKlassSpravEdit_Change[IndLang] + ' ' + nFormPrK_PROT_ZACH_Caption_change[IndLang];

        if T.ShowModal = MrOk then
        begin
            StoredProcPrK.Transaction.StartTransaction;
            StoredProcPrK.StoredProcName := 'PRK_DT_PROT_ZACH_CHANGE';
            StoredProcPrK.Prepare;
            StoredProcPrK.ParamByName('ID_DT_PROT_ZACH').AsInt64 := DataPRChange['ID'].AsInt64;
            StoredProcPrK.ParamByName('DATE_FORM').AsDate := DataPRChange['DATE_FORM'].AsVariant;
            StoredProcPrK.ParamByName('NOMER').AsString := DataPRChange['NOMER'].AsString;
            StoredProcPrK.ParamByName('ID_USER').AsInt64 := ID_USER_GLOBAL;
            try
                StoredProcPrK.ExecProc;
                StoredProcPrK.Transaction.commit;
            except on e: Exception do
                begin
                    MessageBox(Handle, Pchar(nMsgErrorTransaction[IndLang] + chr(13) +
                        nMsgTryAgain[IndLang] + nMsgOr[IndLang] + nMsgToAdmin[IndLang] + chr(13) +
                        e.Message), Pchar(nMsgBoxTitle[IndLang]), MB_OK or MB_ICONWARNING);
                    StoredProcPrK.Transaction.Rollback;
                    TryAgain := true;
                end;
            end;
        end;

        T.Free;
        T := nil;
        if DataSetPZ_Right.FieldValues[ID_NAME_PZ_Right] <> null
            then DataPRChange['ID_right'].AsInt64 := DataSetPZ_Right.FieldValues[ID_NAME_PZ_Right]
        else DataPRChange['ID_right'].AsInt64 := -1;
        obnovit(DataPRChange['ID'].AsInt64);
        obnovit_Right(DataPRChange['ID_right'].AsInt64);
        DataPRChange.Free;
        DataPRChange := nil;
    end;
    if TryAgain = true
        then ActionChangeExecute(sender);
end;

procedure TFormPrK_PROT_ZACH.WriteIdFobProt;
var
    reg: TRegistry;
begin
    if DataSetFob_Prot.FieldValues['ID_SP_FOB_PROT'] <> Null then
    begin
        reg := TRegistry.Create;
        try
            reg.RootKey := HKEY_CURRENT_USER;
            if reg.OpenKey('\Software\PrK\DATA\', true) then
            begin
                reg.WriteString('ID_SP_FOB_PROT_ProtZach', VarToStr(DataSetFob_Prot.FieldValues['ID_SP_FOB_PROT']));
            end;
        finally
            reg.Free;
        end;
    end;
end;

procedure TFormPrK_PROT_ZACH.cxLookupComboBoxFob_ProtPropertiesChange(
    Sender: TObject);
begin
    WriteIdFobProt;
    if TFormPrK_PROT_ZACH(self).Showing = true
        then cxGridPrKPZ.SetFocus;
end;

function TFormPrK_PROT_ZACH.ReadIdFobProt: int64;
var
    reg: TRegistry;
    ReadRegistryValue: string;
begin
    reg := TRegistry.Create;
 // если '', то брать первую попавшуюся запись
    ReadRegistryValue := '';
    try
        reg.RootKey := HKEY_CURRENT_USER;
        if reg.OpenKey('\Software\PrK\Data\', false) then
        begin
            ReadRegistryValue := reg.ReadString('ID_SP_FOB_PROT_ProtZach');
        end;
    finally
        reg.Free;
    end;

    if Trim(ReadRegistryValue) = '' then
    begin
        Result := -1;
    end
    else begin
        Result := StrToInt64(ReadRegistryValue);
    end;
end;

procedure TFormPrK_PROT_ZACH.ActionAddPrExecute(Sender: TObject);
var
    DataPrAdd: TAArray;
    T: TFormAddNewPRIK_ZACH;
    TryAgain: boolean;
begin
    if DataSetPrKPZ.FieldValues[ID_NAME_PZ] = null
        then exit;

    TryAgain := false;
    DataPrAdd := TAArray.Create;
    DataPrAdd['Input']['Rejim'].AsVariant := AddPrK;
    DataPrAdd['IS_CEL_NABOR'].AsInteger := -1;
    DataPrAdd['DATE_ZARAX'].AsVariant := Date;
    DataPrAdd['DATE_PRIKAZ'].AsVariant := Date;
    DataPrAdd['NOMER'].AsString := '';

    if DataSetPZ_Right.FieldValues[ID_NAME_PZ_Right] <> Null
        then DataPrAdd['ID'].AsInt64 := StrToInt64(DataSetPZ_Right.FieldValues[ID_NAME_PZ_Right]);

    T := TFormAddNewPRIK_ZACH.Create(self, DataPrAdd);

    T.Caption := nFormKlassSpravEdit_Add[IndLang] + ' ' + nFormPRIK_ZACH_Caption_change[IndLang];

    if T.ShowModal = MrOk then
    begin
        StoredProcPrK.Transaction.StartTransaction;
        StoredProcPrK.StoredProcName := 'PRK_DT_PRIK_ZACH_FORM';
        StoredProcPrK.Prepare;
        StoredProcPrK.ParamByName('ID_DT_PRIK_ZACH').AsInt64 := -1;
        StoredProcPrK.ParamByName('ID_DT_PROT_ZACH').AsInt64 := DataSetPrKPZ.FieldValues['ID_DT_PROT_ZACH'];
        StoredProcPrK.ParamByName('IS_CEL_NABOR').AsInteger := DataPrAdd['IS_CEL_NABOR'].AsInteger;
        StoredProcPrK.ParamByName('DATE_ZARAX').AsDate := DataPrAdd['DATE_ZARAX'].AsVariant;
        StoredProcPrK.ParamByName('DATE_PRIKAZ').AsDate := DataPrAdd['DATE_PRIKAZ'].AsVariant;
        StoredProcPrK.ParamByName('NOMER').AsString := DataPrAdd['NOMER'].AsString;
        StoredProcPrK.ParamByName('ID_USER').AsInt64 := ID_USER_GLOBAL;
        try
            StoredProcPrK.ExecProc;
            StoredProcPrK.Transaction.commit;
            DataPrAdd['ID'].AsInt64 := StoredProcPrK.FieldByName('ID_OUT').AsInt64;
        except on e: Exception do
            begin
                MessageBox(Handle, Pchar(nMsgErrorTransaction[IndLang] + chr(13) +
                    nMsgTryAgain[IndLang] + nMsgOr[IndLang] + nMsgToAdmin[IndLang] + chr(13) +
                    e.Message), Pchar(nMsgBoxTitle[IndLang]), MB_OK or MB_ICONWARNING);
                StoredProcPrK.Transaction.Rollback;
                TryAgain := true;
            end;
        end;
    end;
    T.Free;
    T := nil;
    obnovit_Right(DataPrAdd['ID'].AsInt64);
    DataPrAdd.Free;
    DataPrAdd := nil;

    if TryAgain = true
        then ActionAddPrExecute(Sender);
end;

procedure TFormPrK_PROT_ZACH.obnovit_Right(id_obnovit: int64);
begin
    DataSetPZ_Right.CloseOpen(false);
    DataSetPZ_Right.Locate(ID_NAME_PZ_Right, id_obnovit, []);
end;

procedure TFormPrK_PROT_ZACH.obnovit(id_obnovit: int64);
begin
    DataSetPrKPZ.CloseOpen(false);
    DataSetPrKPZ.Locate(ID_NAME_PZ, id_obnovit, []);
end;

procedure TFormPrK_PROT_ZACH.ActionChangePrExecute(Sender: TObject);
var
    DataPRChange: TAArray;
    T: TFormAddNewPRIK_ZACH;
    TryAgain: boolean;
begin

    TryAgain := false;
    if DataSetPZ_Right.FieldValues[ID_NAME_PZ_Right] <> Null then
    begin
        DataPRChange := TAArray.Create;
        DataPRChange['ID'].AsInt64 := DataSetPZ_Right.FieldValues[ID_NAME_PZ_Right];
        DataPRChange['Input']['Rejim'].AsVariant := ChangePrK;
        DataPRChange['IS_CEL_NABOR'].AsInteger := DataSetPZ_Right.FieldValues['IS_CEL_NABOR'];
        DataPRChange['DATE_ZARAX'].AsVariant := DataSetPZ_Right.FieldValues['DATE_ZARAX'];
        DataPRChange['DATE_PRIKAZ'].AsVariant := DataSetPZ_Right.FieldValues['DATE_PRIKAZ'];
        DataPRChange['NOMER'].AsString := DataSetPZ_Right.FieldValues['NOMER'];

        T := TFormAddNewPRIK_ZACH.Create(self, DataPRChange);
        T.Caption := nFormKlassSpravEdit_Change[IndLang] + ' ' + nFormPRIK_ZACH_Caption_change[IndLang];
        T.cxGroupBoxCelNabor.Enabled := false;
        if T.ShowModal = MrOk then
        begin
            StoredProcPrK.Transaction.StartTransaction;
            StoredProcPrK.StoredProcName := 'PRK_DT_PRIK_ZACH_CHANGE';
            StoredProcPrK.Prepare;
            StoredProcPrK.ParamByName('ID_DT_PRIK_ZACH').AsInt64 := DataPRChange['ID'].AsInt64;
            StoredProcPrK.ParamByName('DATE_ZARAX').AsDate := DataPRChange['DATE_ZARAX'].AsVariant;
            StoredProcPrK.ParamByName('DATE_PRIKAZ').AsDate := DataPRChange['DATE_PRIKAZ'].AsVariant;
            StoredProcPrK.ParamByName('NOMER').AsString := DataPRChange['NOMER'].AsString;
            StoredProcPrK.ParamByName('ID_USER').AsInt64 := ID_USER_GLOBAL;
            try
                StoredProcPrK.ExecProc;
                StoredProcPrK.Transaction.commit;
            except on e: Exception do
                begin
                    MessageBox(Handle, Pchar(nMsgErrorTransaction[IndLang] + chr(13) +
                        nMsgTryAgain[IndLang] + nMsgOr[IndLang] + nMsgToAdmin[IndLang] + chr(13) +
                        e.Message), Pchar(nMsgBoxTitle[IndLang]), MB_OK or MB_ICONWARNING);
                    StoredProcPrK.Transaction.Rollback;
                    TryAgain := true;
                end;
            end;
        end;

        T.Free;
        T := nil;
        obnovit_Right(DataPRChange['ID'].AsInt64);
        DataPRChange.Free;
        DataPRChange := nil;
    end;
    if TryAgain = true
        then ActionChangePrExecute(sender);
end;

procedure TFormPrK_PROT_ZACH.ActionViewPrExecute(Sender: TObject);
var
    DataPrView: TAArray;
    T: TFormAddNewPRIK_ZACH;
begin
    if DataSetPZ_Right.FieldValues[ID_NAME_PZ_Right] <> Null then
    begin
        DataPrView := TAArray.Create;
        DataPrView['Input']['Rejim'].AsVariant := ViewPrK;
        DataPrView['IS_CEL_NABOR'].AsInteger := DataSetPZ_Right.FieldValues['IS_CEL_NABOR'];
        DataPrView['DATE_ZARAX'].AsVariant := DataSetPZ_Right.FieldValues['DATE_ZARAX'];
        DataPrView['DATE_PRIKAZ'].AsVariant := DataSetPZ_Right.FieldValues['DATE_PRIKAZ'];
        DataPrView['NOMER'].AsString := DataSetPZ_Right.FieldValues['NOMER'];

        T := TFormAddNewPRIK_ZACH.Create(self, DataPrView);

        T.Caption := nFormKlassSpravEdit_View[IndLang] + ' ' + nFormPRIK_ZACH_Caption_change[IndLang];
        T.cxGroupBoxCelNabor.Enabled := false;
        T.cxDateEditDateZarah.Properties.ReadOnly := true;
        T.cxDateEditDatePrikaz.Properties.ReadOnly := true;
        T.cxTextEditNomer.Properties.ReadOnly := true;

        T.cxDateEditDateZarah.Style.Color := TextViewColor;
        T.cxDateEditDatePrikaz.Style.Color := TextViewColor;
        T.cxTextEditNomer.Style.Color := TextViewColor;
        T.ShowModal;
        T.Free;
        T := nil;
        DataPrView.Free;
        DataPrView := nil;
    end;
end;

procedure TFormPrK_PROT_ZACH.ActionDelPrExecute(Sender: TObject);
begin
    if DataSetPZ_Right.FieldValues[ID_NAME_PZ_Right] <> Null then
    begin
        if prkMessageDlg(nMsgBoxTitle[IndLang], nMsgDel[IndLang],
            mtInformation, mbOKCancel, IndLang) = mrOK then
        begin
            StoredProcPrK.Transaction.StartTransaction;
            StoredProcPrK.StoredProcName := 'PRK_DT_PRIK_ZACH_DEL';
            StoredProcPrK.Prepare;
            StoredProcPrK.ParamByName(ID_NAME_PZ_Right).AsInt64 := DataSetPZ_Right.FieldValues[ID_NAME_PZ_Right];
            StoredProcPrK.ParamByName('ID_USER').AsInt64 := ID_USER_GLOBAL;
            try
                StoredProcPrK.ExecProc;
                StoredProcPrK.Transaction.Commit;
                cxGridPrKPZ_RightDBTableView1.NavigatorButtons.Prior.Click;
            except on e: Exception do
                begin
                    MessageBox(Handle, Pchar(nMsgErrorTransaction[IndLang] + chr(13) +
                        nMsgTryAgain[IndLang] + nMsgOr[IndLang] + nMsgToAdmin[IndLang] + chr(13) +
                        e.Message), Pchar(nMsgBoxTitle[IndLang]), MB_OK or MB_ICONWARNING);
                    StoredProcPrK.Transaction.Rollback;
                end;
            end;
        end;
        obnovit_Right(StrToInt64(DataSetPZ_Right.FieldValues[ID_NAME_PZ_Right]));
    end;
end;

procedure TFormPrK_PROT_ZACH.ActionObnovExecute(Sender: TObject);
var
    id_loc_right, id_loc: int64;
begin
    if DataSetPZ_Right.FieldValues[ID_NAME_PZ_Right] <> Null
        then id_loc_right := StrToInt64(DataSetPZ_Right.FieldValues[ID_NAME_PZ_Right])
    else id_loc_right := -1;
    if DataSetPrKPZ.FieldValues[ID_NAME_PZ] <> Null
        then id_loc := DataSetPrKPZ.FieldValues[ID_NAME_PZ]
    else id_loc := -1;

    obnovit(id_loc);
    obnovit_Right(id_loc_right);
end;

procedure TFormPrK_PROT_ZACH.ActionAddExistPrExecute(Sender: TObject);
var
    T: TFormAddExistPRIK_ZACH;
begin
    if DataSetPrKPZ.FieldValues[ID_NAME_PZ] = Null
        then exit;

    T := TFormAddExistPRIK_ZACH.Create(self);
    if T.ShowModal = MrOk then
    begin
        obnovit_Right(T.Return_Id_Out);
    end;
    T.Free;
    T := nil;
end;

procedure TFormPrK_PROT_ZACH.ActionOtmenaExecute(Sender: TObject);
begin
    close;
end;

procedure TFormPrK_PROT_ZACH.ActionDELExecute(Sender: TObject);
begin
    if DataSetPZ_Right.RecordCount > 0 then
    begin
        ShowMessage(nMsgCannotDelProtZach[IndLang]);
    end
    else begin
        if DataSetPrKPZ.FieldValues[ID_NAME_PZ] <> Null then
        begin
            if prkMessageDlg(nMsgBoxTitle[IndLang], nMsgDel[IndLang],
                mtInformation, mbOKCancel, IndLang) = mrOK then
            begin
                StoredProcPrK.Transaction.StartTransaction;
                StoredProcPrK.StoredProcName := 'PRK_DT_PROT_ZACH_DEL';
                StoredProcPrK.Prepare;
                StoredProcPrK.ParamByName(ID_NAME_PZ).AsInt64 := DataSetPrKPZ.FieldValues[ID_NAME_PZ];
                StoredProcPrK.ParamByName('ID_USER').AsInt64 := ID_USER_GLOBAL;
                try
                    StoredProcPrK.ExecProc;
                    StoredProcPrK.Transaction.Commit;
                    cxGridPrKPZDBTableView1.NavigatorButtons.Prior.Click;
                except on e: Exception do
                    begin
                        MessageBox(Handle, Pchar(nMsgErrorTransaction[IndLang] + chr(13) +
                            nMsgTryAgain[IndLang] + nMsgOr[IndLang] + nMsgToAdmin[IndLang] + chr(13) +
                            e.Message), Pchar(nMsgBoxTitle[IndLang]), MB_OK or MB_ICONWARNING);
                        StoredProcPrK.Transaction.Rollback;
                    end;
                end;
                obnovit(StrToInt64(DataSetPrKPZ.FieldValues[ID_NAME_PZ]));
                DataSetPZ_Right.CloseOpen(false);
            end;
        end;
    end;
end;

procedure TFormPrK_PROT_ZACH.ActionPrintExecute(Sender: TObject);
var
    InputParam: TAArray;
    i: integer;
    Id_Input: int64;
begin
    if DataSetPrKPZ.FieldValues[ID_NAME_PZ] <> Null then
    begin
        InputParam := TAArray.Create;
        InputParam['Name_Bpl'].AsString := 'PrK_rptLoader.bpl';
        InputParam['Input']['aDBHANDLE'].AsInteger := Integer(DataBasePrk.Handle);
        InputParam['Input']['aNameReport'].AsString := 'PROT_ZACH';
        i := 1;
        InputParam['Input']['ParamNames'][i].AsString := 'ID_DT_PROT_ZACH';
        InputParam['Input']['ParamValues'][i].AsVariant := StrToint(VarToStr(DataSetPrKPZ.FieldValues[ID_NAME_PZ]));
        i := 2;
        InputParam['Input']['ParamNames'][i].AsString := 'ID_DT_PROT_ZACH';
        InputParam['Input']['ParamValues'][i].AsVariant := StrToint(VarToStr(DataSetPrKPZ.FieldValues[ID_NAME_PZ]));

        InputParam['Input']['Count_Param'].AsInteger := 2;
        uPrK_Loader.ShowAllPrkBpl(self, InputParam);
    end;
end;

procedure TFormPrK_PROT_ZACH.ActionPrintPrExecute(Sender: TObject);
var
    InputParam: TAArray;
    i: integer;
    Id_Input: int64;
begin
    if DataSetPZ_Right.FieldValues[ID_NAME_PZ_Right] <> Null then
    begin
        InputParam := TAArray.Create;
        InputParam['Name_Bpl'].AsString := 'PrK_rptLoader.bpl';
        InputParam['Input']['aDBHANDLE'].AsInteger := Integer(DataBasePrk.Handle);
        InputParam['Input']['aNameReport'].AsString := 'PRIK_ZACH';
        i := 1;
        InputParam['Input']['ParamNames'][i].AsString := 'ID_DT_PRIK_ZACH';
        Id_Input := DataSetPZ_Right.FieldValues[ID_NAME_PZ_Right];
        InputParam['Input']['ParamValues'][i].AsVariant := Id_Input;
        i := 2;
        InputParam['Input']['ParamNames'][i].AsString := 'ID_DT_PRIK_ZACH';
        Id_Input := DataSetPZ_Right.FieldValues[ID_NAME_PZ_Right];
        InputParam['Input']['ParamValues'][i].AsVariant := Id_Input;

        InputParam['Input']['Count_Param'].AsInteger := 2;
        uPrK_Loader.ShowAllPrkBpl(self, InputParam);
    end;
end;

procedure TFormPrK_PROT_ZACH.ActionAbitShowExecute(Sender: TObject);
var
    T: TFormPrK_PZ_Abit_Show;
    InputParam: TAArray;
begin
    if DataSetPrKPZ.FieldValues['ID_DT_PROT_ZACH'] <> Null then
    begin
        InputParam := TAArray.Create;
        InputParam['SelectSQL_Text'].AsString := 'Select * from PRK_DT_PROT_ZACH_LIST_SELECT(:ID_DT_PROT_ZACH,:ID_SP_GOD_NABORA)';
        InputParam['SelectSQL_Text_Add'].AsString := 'Select * from PRK_DT_PROT_ZACH_ABIT_INS_SEL(:ID_SP_GOD_NABORA)';
        InputParam['StoredProcDelName'].AsString := 'PRK_DT_PROT_ZACH_ABIT_DEL';
        InputParam['StoredProcAddName'].AsString := 'PRK_DT_PROT_ZACH_ABIT_ADD';
        InputParam['Prot_Prikaz'].AsInteger := 1;
        InputParam['ParamName'].AsString := 'ID_DT_PROT_ZACH';
        InputParam['ParamValue'].AsInt64 := DataSetPrKPZ.FieldValues['ID_DT_PROT_ZACH'];
        T := TFormPrK_PZ_Abit_Show.Create(self, InputParam);
        T.Caption := nFormPrK_PZ_Abit_ShowProtokol_Caption[IndLang];
        T.ShowModal;
        T.Free;
        T := nil;
        InputParam.Free;
        InputParam := nil;
    end;
end;

procedure TFormPrK_PROT_ZACH.ActionAbitShowPrExecute(Sender: TObject);
var
    T: TFormPrK_PZ_Abit_Show;
    InputParam: TAArray;
begin
    if DataSetPZ_Right.FieldValues['ID_DT_PRIK_ZACH'] <> Null then
    begin
        InputParam := TAArray.Create;
        InputParam['SelectSQL_Text'].AsString := 'Select * from PRK_DT_PRIK_ZACH_LIST_SELECT(:ID_DT_PRIK_ZACH,:ID_SP_GOD_NABORA)';
        InputParam['SelectSQL_Text_Add'].AsString := 'Select * from PRK_DT_PRIK_ZACH_ABIT_INS_SEL(:ID_SP_GOD_NABORA)';
        InputParam['StoredProcDelName'].AsString := 'PRK_DT_PRIK_ZACH_ABIT_DEL';
        InputParam['StoredProcAddName'].AsString := 'PRK_DT_PRIK_ZACH_ABIT_ADD';
        InputParam['Prot_Prikaz'].AsInteger := 2;
        InputParam['ParamName'].AsString := 'ID_DT_PRIK_ZACH';
        InputParam['ParamValue'].AsInt64 := DataSetPZ_Right.FieldValues['ID_DT_PRIK_ZACH'];
        T := TFormPrK_PZ_Abit_Show.Create(self, InputParam);
        T.Caption := nFormPrK_PZ_Abit_ShowPrikaz_Caption[IndLang];
        T.ShowModal;
        T.Free;
        T := nil;
        InputParam.Free;
        InputParam := nil;
    end;
end;

procedure TFormPrK_PROT_ZACH.ActionPrintVitagExecute(Sender: TObject);
var T: TPrK_PROT_ZACH_SelFakDepForm;
    InputParam: TAArray;
    i: integer;
begin
    T := TPrK_PROT_ZACH_SelFakDepForm.Create(Self, DBHANDLE);
    if T.ShowModal <> mrOk then Exit;

    InputParam := TAArray.Create;
    InputParam['Name_Bpl'].AsString := 'PrK_rptLoader.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger := Integer(DataBasePrk.Handle);
    InputParam['Input']['aNameReport'].AsString := 'VITIAG_PRIK_ZACH';
    i := 1;
    InputParam['Input']['ParamNames'][i].AsString := 'ID_SP_GOD_NABORA';
    InputParam['Input']['ParamValues'][i].AsVariant := ID_GOD_NABORA_GLOBAL;
    i := 2;
    InputParam['Input']['ParamNames'][i].AsString := 'ID_SP_FORM_OBUCH_KATEGORY';
    InputParam['Input']['ParamValues'][i].AsVariant := DataSetFob_Prot['ID_SP_FORM_OBUCH_KATEGORY'];
    i := 3;
    InputParam['Input']['ParamNames'][i].AsString := 'ID_SP_DEPARTMENT_FAK';
    InputParam['Input']['ParamValues'][i].AsVariant := T.pID_SP_DEPARTMENT_FAK;
    i := 4;
    InputParam['Input']['ParamNames'][i].AsString := 'ID_SP_FORM_OBUCH_KATEGORY';
    InputParam['Input']['ParamValues'][i].AsVariant := DataSetFob_Prot['ID_SP_FORM_OBUCH_KATEGORY'];

    InputParam['Input']['Count_Param'].AsInteger := 4;

    uPrK_Loader.ShowAllPrkBpl(self, InputParam);

    T.Release;
end;

procedure TFormPrK_PROT_ZACH.ActionContractsStudyExecute(Sender: TObject);
var
    InputParam: TAArray;
begin

    if ID_GOD_NABORA_GLOBAL = -1 then
    begin
        ShowMessage(nMsgEmptyGodNabora[IndLang]);
    // dxBarButtonOptionWorkClick(Sender);
        exit;
    end;

    InputParam := TAArray.Create;
    InputParam['Name_Bpl'].AsString := 'PrK_ContractsStudy.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger := Integer(DataBasePrk.Handle);
    InputParam['Input']['aFrmStyle'].AsVariant := fsNormal;
    InputParam['Input']['GodNabora'].AsInt64 := ID_GOD_NABORA_GLOBAL;
    InputParam['Input']['ID_USER'].AsInt64 := ID_USER_GLOBAL;
    InputParam['Input']['Id_Dt_Prik_Zach'].AsInt64 := DataSetPZ_Right.FieldValues['ID_DT_PRIK_ZACH'];
    uPrK_Loader.ShowAllPrkBpl(self, InputParam);
end;

procedure TFormPrK_PROT_ZACH.ActionPrintPovidomlennyaExecute(
  Sender: TObject);
var InputParam: TAArray;
    i: integer;
begin
    InputParam := TAArray.Create;
    InputParam['Name_Bpl'].AsString := 'PrK_rptLoader.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger := Integer(DataBasePrk.Handle);
    InputParam['Input']['aNameReport'].AsString := 'PRK_RPT_PRIK_ZACH_POVIDOMLEN';
    i := 1;
    InputParam['Input']['ParamNames'][i].AsString := 'ID_DT_PRIK_ZACH';
    InputParam['Input']['ParamValues'][i].AsVariant := DataSetPZ_Right.FieldValues['ID_DT_PRIK_ZACH'];;

    InputParam['Input']['Count_Param'].AsInteger := i;

    uPrK_Loader.ShowAllPrkBpl(self, InputParam);
end;


end.

