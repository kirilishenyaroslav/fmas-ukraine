unit uPrKContractsStudy;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxDBEdit, cxContainer,
    cxLabel, dxBar, cxGridLevel, cxGridCustomTableView, cxGridTableView,
    cxGridDBTableView, cxClasses, cxControls,
    uPrK_Resources, cxGridCustomView, cxGrid,
    cxGroupBox, ImgList, ActnList, dxBarExtItems, RxMemDS, FIBQuery,
    pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, FIBDataSet,
    pFIBDataSet, cxSplitter, AArray, ib_externals, ibase, dxStatusBar;

type
    TFormPrkContractsStudy = class(TForm)
        dxBarManagerContractsStudy: TdxBarManager;
        dxBarLargeButtonAddCN: TdxBarLargeButton;
        dxBarLargeButtonChangeCN: TdxBarLargeButton;
        dxBarLargeButtonDelCN: TdxBarLargeButton;
        dxBarLargeButtonPrintCn: TdxBarLargeButton;
        dxBarLargeButtonChangeCN_Status: TdxBarLargeButton;
        ActionListViewWithFilter: TActionList;
        ActionObnov: TAction;
        ActionVibrat: TAction;
        ActionOtmena: TAction;
        ActionAddCN: TAction;
        ActionChangeCN: TAction;
        ActionDelCN: TAction;
        ActionPrintCn: TAction;
        ActionChangeCN_Status: TAction;
        StyleRepositoryViewWithFilter: TcxStyleRepository;
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
        ImageListViewWithFilter: TImageList;
        ActionDejstv: TAction;
        ActionCandidat: TAction;
        cxGroupBoxContracts: TcxGroupBox;
        cxGridPrKContracts: TcxGrid;
        cxGridPrKContractsDBTableView1: TcxGridDBTableView;
        colNUM_DOG: TcxGridDBColumn;
        colDATE_DOG: TcxGridDBColumn;
        colSUMMA: TcxGridDBColumn;
        cxGridPrKContractsLevel1: TcxGridLevel;
        dxBarDockControlContracts: TdxBarDockControl;
        cxGroupBoxDataDog: TcxGroupBox;
        cxLabelNAME_DOG_STATUS: TcxLabel;
        cxDBTextEditNAME_DOG_STATUS: TcxDBTextEdit;
        cxDBTextEditNAME_DOG_TYPE: TcxDBTextEdit;
        cxLabelNAME_DOG_TYPE: TcxLabel;
        cxLabelMFO: TcxLabel;
        cxDBTextEditMFO: TcxDBTextEdit;
        cxLabelFIO_PAYER: TcxLabel;
        cxDBTextEditFIO_PAYER: TcxDBTextEdit;
        cxGridPrKContractsStudy: TcxGrid;
        cxGridPrKContractsStudyDBTableView1: TcxGridDBTableView;
        colFIO: TcxGridDBColumn;
        colNOMER_DELA: TcxGridDBColumn;
        colSHORT_NAME_FAK: TcxGridDBColumn;
        colSHORT_NAME_SPEC: TcxGridDBColumn;
        colSHORT_NAME_FORM_STUD: TcxGridDBColumn;
        colSHORT_NAME_KAT_STUD: TcxGridDBColumn;
    colNAME_STATUS: TcxGridDBColumn;
    colIS_SELECTED: TcxGridDBColumn;
        cxGridPrKContractsStudyLevel1: TcxGridLevel;
        cxSplitterContracts: TcxSplitter;
        DataBasePrkContractsStudy: TpFIBDatabase;
        DataSetPrKContractsStudy: TpFIBDataSet;
        TransactionReadPrKContractsStudy: TpFIBTransaction;
        TransactionWritePrKContractsStudy: TpFIBTransaction;
        cxEditStyleControllerVWF: TcxEditStyleController;
        DataSourcePrKContractsStudy: TDataSource;
        StoredProcPrKContractsStudy: TpFIBStoredProc;
        RxMemoryDataPrKContractsStudy: TRxMemoryData;
        DataSetContrakts: TpFIBDataSet;
        DataSourceContrakts: TDataSource;
        StoredProcContracts: TpFIBStoredProc;
        dxBarLargeButtonDejstv: TdxBarLargeButton;
        dxBarLargeButtonCandidat: TdxBarLargeButton;
        dxBarLargeButtonVibrat: TdxBarLargeButton;
        dxBarLargeButtonObnov: TdxBarLargeButton;
        dxBarLargeButtonOtmena: TdxBarLargeButton;
        dxStatusBarVWF: TdxStatusBar;
        procedure FormCreate(Sender: TObject);
        procedure ActionAddCNExecute(Sender: TObject);
        procedure ActionChangeCNExecute(Sender: TObject);
        procedure ActionChangeCN_StatusExecute(Sender: TObject);
        procedure ActionDelCNExecute(Sender: TObject);
        procedure ActionPrintCnExecute(Sender: TObject);
        procedure ActionObnovExecute(Sender: TObject);
        procedure ActionOtmenaExecute(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure DataSetContraktsAfterOpen(DataSet: TDataSet);
    procedure ActionDejstvExecute(Sender: TObject);
    procedure ActionCandidatExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    private
        CanAfterScroll: Boolean;
        DBHANDLE: TISC_DB_HANDLE;
        ResultArray: TAArray;
        FInicFormCaption: string;
        FSelectSQLText: string;
        FID_NAME: string;
        FDATE_TO: TDate;
        FDATE_FROM: TDate;
        FSelectSQLTextCN: string;
        procedure SetInicFormCaption(const Value: string);
        procedure SetSelectSQLText(const Value: string);
        procedure InicalisationDataSet;
        procedure SetID_NAME(const Value: string);
        procedure SetSelectSQLTextCN(const Value: string);
    public
        Layout: array[0.. KL_NAMELENGTH] of char;
        IndLangVWF: Integer;
        TextViewColorVWF: TColor;
        ID_User_Global: Int64;
        User_Name_Global: string;
        constructor Create(aOwner: TComponent; aParam: TAArray); overload;
        procedure InicCaption; virtual;
        procedure Obnovit(id_obnovit: int64);
        procedure ObnovitCn(id_obnovit: int64);
        property ID_NAME: string read FID_NAME write SetID_NAME;
        property SelectSQLText: string read FSelectSQLText write SetSelectSQLText;
        property SelectSQLTextCN: string read FSelectSQLTextCN write SetSelectSQLTextCN;
        property InicFormCaption: string read FInicFormCaption write SetInicFormCaption;
    end;

procedure ShowAllPrkBpl(aOwner: TComponent; aParam: TAArray); stdcall;
exports ShowAllPrkBpl;

var
    FormPrkContractsStudy: TFormPrkContractsStudy;

implementation
uses
    uConstants, DateUtils, uPrK_Loader,
    cn_Common_Types, cn_Common_Loader;

{$R *.dfm}

procedure ShowAllPrkBpl(aOwner: TComponent; aParam: TAArray);
var
    T: TFormPrkContractsStudy;
begin
    T := TFormPrkContractsStudy.Create(aOwner, aParam);
    T.FormStyle := aParam['Input']['aFrmStyle'].AsVariant;
    case T.FormStyle of
        fsNormal: begin
                T.ShowModal;
                T.ActionVibrat.Enabled           := true;
                T.dxBarLargeButtonVibrat.Visible := ivAlways;
            end;
        fsMDIChild: begin
                T.ActionVibrat.Enabled           := false;
                T.dxBarLargeButtonVibrat.Visible := ivNever;
            end;
    else
        T.Free;
    end;

end;

procedure TFormPrkContractsStudy.FormCreate(Sender: TObject);
begin
    ID_NAME := 'ID_DT_ABIT';
{
  DATE_FROM :=today;
  DATE_TO   :=today;
  cxDateEditFrom.Date :=DATE_FROM;
  cxDateEditTo.Date   :=DATE_TO;
  cxCheckBoxFiltrOnDate.Checked :=true;
  cxCheckBoxFiltrOnPerekl.Checked:=True;
}
    CanAfterScroll   := False;

    SelectSQLText    := 'Select *  from PRK_ABIT_LST_PRIK_DOG_SEL(:ID_SP_GOD_NABORA, :ID_DT_PRIK_ZACH) where 1=1';
    SelectSQLTextCN  := 'Select * from PRK_ABIT_DOG_INFO_SELECT(:ID_DT_ABIT)';
//******
    InicFormCaption  := nFormPrkContractsStudy_Caption[IndLangVWF];
//******
    ID_USER_GLOBAL   := ResultArray['Input']['ID_USER_GLOBAL'].AsInt64;
    User_Name_Global := 'Abityrient';
  {DATE_FROM :=today;
  DATE_TO   :=today;
  cxDateEditFrom.Date :=DATE_FROM;
  cxDateEditTo.Date   :=DATE_TO;
  cxCheckBoxFiltrOnDate.Checked :=true;  }

    CanAfterScroll := True;
end;

constructor TFormPrkContractsStudy.Create(aOwner: TComponent; aParam: TAArray);
begin
    if Assigned(PVoid(aParam['Input']['aDBHANDLE'])) then
    begin
        DBHANDLE         := PVoid(aParam['Input']['aDBHANDLE'].asInteger);
        ResultArray      := aParam;
        IndLangVWF       := SelectLanguage;
        TextViewColorVWF := cl3DLight;
        inherited Create(aOwner);
        if SelectShemaColor = 1 then
        begin
            cxStyleBackGround_Content.Color      := $00EBC4A4;
            cxStyleInactive.Color                := $00F7EAD9;
            cxEditStyleControllerVWF.Style.Color := $00EBC4A4;
        end;
    end
    else ShowMessage('Ошибка HANDLE`a Базы');
end;

procedure TFormPrkContractsStudy.InicCaption;
begin
    dxBarManagerContractsStudy.Bars[0].BorderStyle           := bbsNone;
    dxBarManagerContractsStudy.Bars[0].ShowMark              := false;
    dxBarManagerContractsStudy.CanCustomize                  := false;
    dxBarManagerContractsStudy.Bars[0].AllowClose            := false;
    dxBarManagerContractsStudy.Bars[0].AllowCustomizing      := false;
    dxBarManagerContractsStudy.Bars[0].AllowQuickCustomizing := false;
    dxBarManagerContractsStudy.Bars[0].AllowReset            := false;

    TFormPrkContractsStudy(self).Caption := InicFormCaption;
    ActionDejstv.Caption                 := nActionDejstv[IndLangVWF];
    ActionCandidat.Caption               := nActionCandidat[IndLangVWF];
    ActionVibrat.Caption                 := nAction_Vibrat[IndLangVWF];
    ActionObnov.Caption                  := nActiont_Obnov[IndLangVWF];
    ActionOtmena.Caption                 := nAction_Exit[IndLangVWF];

    ActionDejstv.Hint                    := nHintActionDejstv[IndLangVWF];
    ActionCandidat.Hint                  := nHintActionCandidat[IndLangVWF];
    ActionVibrat.Hint                    := nHintAction_Vibrat[IndLangVWF];
    ActionObnov.Hint                     := nHintAction_Obnov[IndLangVWF];
    ActionOtmena.Hint                    := nHintAction_Exit[IndLangVWF];

    dxStatusBarVWF.Panels[0].Text        := nStatBarAdd[IndLangVWF];
    dxStatusBarVWF.Panels[1].Text        := nStatBarChange[IndLangVWF];
    dxStatusBarVWF.Panels[2].Text        := nStatBarDel[IndLangVWF];
    dxStatusBarVWF.Panels[3].Text        := nStatBarVibrat[IndLangVWF];
    dxStatusBarVWF.Panels[4].Text        := nStatBarObnov[IndLangVWF];
    dxStatusBarVWF.Panels[5].Text        := nStatBarExit[IndLangVWF];

    colFIO.Caption                       := ncolFIO[IndLangVWF];
    colNOMER_DELA.Caption                := ncolNOMER_DELA[IndLangVWF];
    colSHORT_NAME_FAK.Caption            := ncolNAME_FAK[IndLangVWF];
    colSHORT_NAME_SPEC.Caption           := ncolNAME_SPEC[IndLangVWF];
    colSHORT_NAME_FORM_STUD.Caption      := ncolSHORT_NAME_CN_FORM_STUD[IndLangVWF];
    colSHORT_NAME_KAT_STUD.Caption       := ncolSHORT_NAME_CN_KAT_STUD[IndLangVWF];
    colNAME_STATUS.Caption               := ncolNAME_STATUS[IndLangVWF];
    colIS_SELECTED.Caption               := ncolIS_SELECTED[IndLangVWF];

    ActionAddCN.Caption                  := nActionAddCN[IndLangVWF];
    ActionChangeCN.Caption               := nActionChangeCN[IndLangVWF];
    ActionDelCN.Caption                  := nActionDelCN[IndLangVWF];
    ActionPrintCn.Caption                := nActiontPrint[IndLangVWF];
    ActionChangeCN_Status.Caption        := nActionChangeCN_Status[IndLangVWF];
    ActionAddCN.Hint                     := nHintAction_Add[IndLangVWF];
    ActionChangeCN.Hint                  := nHintAction_Change[IndLangVWF];
    ActionDelCN.Hint                     := nHintAction_Del[IndLangVWF];
    ActionPrintCn.Hint                   := nHintActiontPrint[IndLangVWF];
    ActionChangeCN_Status.Hint           := nHintActionChangeCN_Status[IndLangVWF];

    cxGroupBoxContracts.Caption          := ncxGroupBoxContracts[IndLangVWF];
    colNUM_DOG.Caption                   := ncolNUM_DOG[IndLangVWF];
    colDATE_DOG.Caption                  := ncolDATE_DOG[IndLangVWF];
    colSUMMA.Caption                     := ncolSUMMA[IndLangVWF];

    cxLabelNAME_DOG_STATUS.Caption       := nLabelNAME_DOG_STATUS[IndLangVWF];
    cxLabelNAME_DOG_TYPE.Caption         := nLabelNAME_DOG_TYPE[IndLangVWF];
    cxLabelMFO.Caption                   := nLabelMFO[IndLangVWF];
    cxLabelFIO_PAYER.Caption             := nLabelFIO_PAYER[IndLangVWF];
end;

procedure TFormPrkContractsStudy.SetInicFormCaption(const Value: string);
begin
    FInicFormCaption := Value;
    InicCaption;
end;

{ вызывается при иниц. SelectSQLText }

procedure TFormPrkContractsStudy.InicalisationDataSet;
begin
    DataBasePrKContractsStudy.close;
    DataSetPrKContractsStudy.Active              := false;
    DataBasePrKContractsStudy.Handle             := DBHANDLE;
    DataBasePrKContractsStudy.DefaultTransaction := TransactionReadPrKContractsStudy;
    DataSetPrKContractsStudy.Database            := DataBasePrKContractsStudy;
    DataSetPrKContractsStudy.Transaction         := TransactionReadPrKContractsStudy;
    TransactionReadPrKContractsStudy.Active      := True;
    DataSetPrKContractsStudy.Close;
    DataSetPrKContractsStudy.SelectSQL.Clear;
    DataSetPrKContractsStudy.SQLs.SelectSQL.Text := FSelectSQLText;
{    if  cxCheckBoxFiltrOnDate.Checked =true
     then ChangeZaprosOnDate;

    cxCheckBoxFiltrOnPereklPropertiesChange(Self); }


    DataSetPrKContractsStudy.ParamByName('ID_SP_GOD_NABORA').AsInt64 := ResultArray['Input']['GodNabora'].AsInt64;
    DataSetPrKContractsStudy.ParamByName('ID_DT_PRIK_ZACH').AsInt64  := ResultArray['Input']['Id_Dt_Prik_Zach'].AsInt64;

    DataSetPrKContractsStudy.Open;
    DataSetPrKContractsStudy.FetchAll;
{    RxMemoryDataPrKViewWithFilter.LoadFromDataSet(DataSetPrKContractsStudy,DataSetPrKContractsStudy.RecordCount,lmCopy);
    DataSetPrKContractsStudy.Active:=false;}

   // ResultArray:=null;
end;

procedure TFormPrkContractsStudy.SetSelectSQLText(
    const Value: string);
begin
    FSelectSQLText := Value;
    InicalisationDataSet;
end;

procedure TFormPrkContractsStudy.SetSelectSQLTextCN(
    const Value: string);
begin
    FSelectSQLTextCN             := Value;
    DataSetContrakts.Active      := false;
    DataSetContrakts.Database    := DataBasePrKContractsStudy;
    DataSetContrakts.Transaction := TransactionReadPrKContractsStudy;

    DataSetContrakts.SelectSQL.Clear;
    DataSetContrakts.SQLs.SelectSQL.Text := FSelectSQLTextCN;

    if DataSetPrKContractsStudy.fieldValues['ID_DT_ABIT'] <> null
        then DataSetContrakts.ParamByName('ID_DT_ABIT').AsInt64 := DataSetPrKContractsStudy.fieldValues['ID_DT_ABIT']
    else DataSetContrakts.ParamByName('ID_DT_ABIT').AsInt64 := -1;

    DataSetContrakts.CloseOpen(false);
end;

procedure TFormPrkContractsStudy.SetID_NAME(const Value: string);
begin
    if Trim(Value) = '' then ShowMessage('Пустое имя id!!!' + CHR(13) +
            'Дальнейшая работа программы будет неверной!');
    FID_NAME := Value;
end;

procedure TFormPrkContractsStudy.Obnovit(id_obnovit: int64);
begin
    CanAfterScroll := false;
    DataSetPrKContractsStudy.CloseOpen(false);
    DataSetPrKContractsStudy.Locate(ID_NAME, id_obnovit, []);
    CanAfterScroll := true;
end;

procedure TFormPrkContractsStudy.ObnovitCn(id_obnovit: int64);
begin
    DataSetContrakts.Active := false;

    if {RxMemoryDataPrKViewWithFilter} DataSetPrKContractsStudy.fieldValues['ID_DT_ABIT'] <> null
        then DataSetContrakts.ParamByName('ID_DT_ABIT').AsInt64 := {RxMemoryDataPrKViewWithFilter} DataSetPrKContractsStudy.fieldValues['ID_DT_ABIT']
    else DataSetContrakts.ParamByName('ID_DT_ABIT').AsInt64 := -1;

    DataSetContrakts.CloseOpen(false);
    if DataSetContrakts.FieldValues['ID_DT_ABIT_DOG'] <> null
        then DataSetContrakts.Locate('ID_DT_ABIT_DOG', id_obnovit, []);
end;

procedure TFormPrkContractsStudy.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then Action := caFree;
end;


procedure TFormPrkContractsStudy.DataSetContraktsAfterOpen(
    DataSet: TDataSet);
begin
    if DataSetPrKContractsStudy.IsEmpty then Exit;
{    if DataSetPrKContractsStudy['IS_DOG_LOCKED'] = 0 then
    begin
        ActionAddCN.Enabled := True;
        ActionChangeCN.Enabled := True;
        ActionChangeCN_Status.Enabled := True;
        ActionDelCN.Enabled := True;
    end
    else
    begin
 }      ActionAddCN.Enabled           := False;
        ActionChangeCN.Enabled        := False;
        ActionChangeCN_Status.Enabled := False;
        ActionDelCN.Enabled           := False;
  //  end;
end;


procedure TFormPrkContractsStudy.ActionAddCNExecute(Sender: TObject);
var
    AParameter: TcnSimpleParamsAbiturient; // класс параметров для создания подключения
    cnParamsRecord: TcnParamsToAddContract; // тип-запись для входящих параметров по обучению
    res: Variant; //результат работы справочника
    id_dog_obnov: int64;
begin
    if {RxMemoryDataPrKViewWithFilter} DataSetPrKContractsStudy.FieldValues['ID_DT_ABIT'] <> Null then
    begin
      // запуск справочника
        AParameter                 := TcnSimpleParamsAbiturient.Create; // создать класс подключения
        AParameter.Owner           := self; // владелец
        AParameter.Db_Handle       := DataBasePrKContractsStudy.Handle; // хендл базы
        AParameter.ID_User         := ID_User_Global; //иде-р пользователя в системе ?
        AParameter.User_Name       := User_Name_Global; //имя пользователя  ?
        AParameter.Formstyle       := fsNormal; // тип формы
        AParameter.WaitPakageOwner := self; // владелец окна ожидания загрузки
        AParameter.WorkMode        := 'extra'; // тип вызова - "extra" означает для системы абитуриент
        AParameter.ActionMode      := 'add'; // режим работы в системе - "добавление контракта"
      // входящие параметры
        if DataSetContrakts.RecordCount = 0
            then cnParamsRecord.ID_DOG_STATUS := {RxMemoryDataPrKViewWithFilter} DataSetPrKContractsStudy.FieldValues['ID_DOG']
        else cnParamsRecord.ID_DOG_STATUS     := {RxMemoryDataPrKViewWithFilter} DataSetPrKContractsStudy.FieldValues['ID_DOG'];

        cnParamsRecord.ID_DEPARTMENT := {RxMemoryDataPrKViewWithFilter} DataSetPrKContractsStudy.FieldValues['ID_SP_DEPARTMENT_FAK'];
        cnParamsRecord.ID_SPEC       := {RxMemoryDataPrKViewWithFilter} DataSetPrKContractsStudy.FieldValues['ID_SP_SPEC'];
        cnParamsRecord.ID_GROUP      := {RxMemoryDataPrKViewWithFilter} DataSetPrKContractsStudy.FieldValues['ID_GROUP'];
        cnParamsRecord.ID_FORM_STUD  := {RxMemoryDataPrKViewWithFilter} DataSetPrKContractsStudy.FieldValues['ID_CN_SP_FORM_STUD'];
        cnParamsRecord.ID_KAT_STUD   := {RxMemoryDataPrKViewWithFilter} DataSetPrKContractsStudy.FieldValues['ID_CN_SP_KAT_STUD'];
        cnParamsRecord.ID_NATIONAL   := {RxMemoryDataPrKViewWithFilter} DataSetPrKContractsStudy.FieldValues['ID_NATIONAL'];
        cnParamsRecord.KURS          := {RxMemoryDataPrKViewWithFilter} DataSetPrKContractsStudy.FieldValues['KOD_KURS'];
        cnParamsRecord.DATE_BEG      := {RxMemoryDataPrKViewWithFilter} DataSetPrKContractsStudy.FieldValues['DATE_BEG'];
        cnParamsRecord.DATE_END      := {RxMemoryDataPrKViewWithFilter} DataSetPrKContractsStudy.FieldValues['DATE_END'];
        cnParamsRecord.ID_MAN        := {RxMemoryDataPrKViewWithFilter} DataSetPrKContractsStudy.FieldValues['ID_MAN'];

        AParameter.cnParamsToAddContract := cnParamsRecord;

        res := RunFunctionFromPackage(AParameter, 'Contracts\cn_Contracts.bpl', 'ShowContracts'); // вызов

    //если есть результат - вывожу
        if VarArrayDimCount(Res) > 0
            then begin
            if ((Res[0] <> 0) and (Res[0] <> -1)) then
            begin
                StoredProcContracts.Transaction.StartTransaction;
                StoredProcContracts.StoredProcName                        := 'PRK_DT_ABIT_DOG_CHANGE';
                StoredProcContracts.Prepare;
                StoredProcContracts.ParamByName('ID_DT_ABIT_DOG').AsInt64 := -1; //DataSetContrakts.FieldValues['ID_DT_ABIT_DOG'];
                StoredProcContracts.ParamByName('ID_DT_ABIT').AsInt64     := {RxMemoryDataPrKViewWithFilter} DataSetPrKContractsStudy.FieldValues['ID_DT_ABIT'];
                StoredProcContracts.ParamByName('ID_DOG').AsInt64         := Res[0];
                StoredProcContracts.ParamByName('ID_USER').AsInt64        := ID_User_Global;
                try
                    StoredProcContracts.ExecProc;
                    StoredProcContracts.Transaction.Commit;
                    id_dog_obnov := StoredProcContracts.FieldByName('ID_OUT').AsInt64;
                except on e: Exception do
                    begin
                        MessageBox(Handle, Pchar(nMsgErrorTransaction[IndLangVWF] + chr(13) +
                            nMsgTryAgain[IndLangVWF] + nMsgOr[IndLangVWF] + nMsgToAdmin[IndLangVWF] + chr(13) +
                            e.Message), Pchar(nMsgBoxTitle[IndLangVWF]), MB_OK or MB_ICONWARNING);
                        StoredProcContracts.Transaction.Rollback;
                    end;
                end;
                Obnovit({RxMemoryDataPrKViewWithFilter}DataSetPrKContractsStudy.FieldValues[ID_NAME]);
                ObnovitCn(id_dog_obnov);
            end;
        end;
        AParameter.Free;
    end;
end;

procedure TFormPrkContractsStudy.ActionChangeCNExecute(Sender: TObject);
var
    AParameter: TcnSimpleParamsAbiturient;
    cnParamsRecord: TcnParamsToAddContract;
    cnParamsIds: TcnParamsToPakage; //тип-запись для вх.параметров по контракту
    res: Variant;
    id_dog_obnov: int64;
begin
    if DataSetContrakts.FieldValues['ID_DOG'] <> Null then
    begin
      // запуск справочника
        AParameter                 := TcnSimpleParamsAbiturient.Create;
        AParameter.Owner           := self;
        AParameter.Db_Handle       := DataBasePrKContractsStudy.Handle;
        AParameter.ID_User         := ID_User_Global;
        AParameter.User_Name       := User_Name_Global;
        AParameter.Formstyle       := fsNormal;
        AParameter.WaitPakageOwner := self;
        AParameter.WorkMode        := 'extra';
        AParameter.ActionMode      := 'edit'; // редактирование

        cnParamsIds.ID_DOG               := DataSetContrakts.FieldValues['ID_DOG']; // вх. параметр
        AParameter.cnParamsToPakage      := cnParamsIds;
        AParameter.cnParamsToAddContract := cnParamsRecord;
        RunFunctionFromPackage(AParameter, 'Contracts\cn_Contracts.bpl', 'ShowContracts');
        AParameter.Free;
        id_dog_obnov := DataSetContrakts.FieldValues['ID_DT_ABIT_DOG'];
        Obnovit({RxMemoryDataPrKViewWithFilter}DataSetPrKContractsStudy.FieldValues[ID_NAME]);
        ObnovitCn(id_dog_obnov);
    end;
end;

procedure TFormPrkContractsStudy.ActionChangeCN_StatusExecute(
    Sender: TObject);
var
    id_dog_obnov: int64;
begin
    if DataSetContrakts.FieldValues['ID_DOG'] <> Null then
    begin
        if prkMessageDlg(nMsgBoxTitle[IndLangVWF], nMsgChangeCN_Status[IndLangVWF],
            mtInformation, mbOKCancel, IndLangVWF) = mrOK then
        begin
            id_dog_obnov := DataSetContrakts.FieldValues['ID_DT_ABIT_DOG'];

            StoredProcContracts.Transaction.StartTransaction;
            StoredProcContracts.StoredProcName                    := 'PRK_ABIT_DOG_SET_CANDIDATE';
            StoredProcContracts.Prepare;
            StoredProcContracts.ParamByName('ID_DT_ABIT').AsInt64 := {RxMemoryDataPrKViewWithFilter} DataSetPrKContractsStudy.FieldValues[ID_NAME];
            StoredProcContracts.ParamByName('ID_DOG').AsInt64     := DataSetContrakts.FieldValues['ID_DOG'];
            try
                StoredProcContracts.ExecProc;
                StoredProcContracts.Transaction.Commit;
            except on e: Exception do
                begin
                    MessageBox(Handle, Pchar(nMsgErrorTransaction[IndLangVWF] + chr(13) +
                        nMsgTryAgain[IndLangVWF] + nMsgOr[IndLangVWF] + nMsgToAdmin[IndLangVWF] + chr(13) +
                        e.Message), Pchar(nMsgBoxTitle[IndLangVWF]), MB_OK or MB_ICONWARNING);
                    StoredProcContracts.Transaction.Rollback;
                end;
            end;
        end;

         // Obnovit(StrToInt64(RxMemoryDataPrKViewWithFilter.FieldValues[ID_NAME]));
        ObnovitCn(id_dog_obnov);
    end;
end;


procedure TFormPrkContractsStudy.ActionDelCNExecute(Sender: TObject);
var
    id_dog_obnov: int64;
begin
    if DataSetContrakts.FieldValues['ID_DOG'] <> Null then
    begin
        if prkMessageDlg(nMsgBoxTitle[IndLangVWF], nMsgDelContract[IndLangVWF],
            mtInformation, mbOKCancel, IndLangVWF) = mrOK then
        begin
            StoredProcContracts.Transaction.StartTransaction;
            StoredProcContracts.StoredProcName                := 'CN_DELETE_CONTRACT_BY_ID_DOG';
            StoredProcContracts.Prepare;
            StoredProcContracts.ParamByName('ID_DOG').AsInt64 := DataSetContrakts.FieldValues['ID_DOG'];
            StoredProcContracts.ExecProc;


            StoredProcContracts.StoredProcName                        := 'PRK_DT_ABIT_DOG_DEL';
            StoredProcContracts.Prepare;
            StoredProcContracts.ParamByName('ID_USER').AsInt64        := ID_User_Global;
            StoredProcContracts.ParamByName('ID_DT_ABIT_DOG').AsInt64 := DataSetContrakts.FieldValues['ID_DT_ABIT_DOG'];
            StoredProcContracts.ExecProc;
            try
                StoredProcContracts.Transaction.Commit;
                cxGridPrKContractsDBTableView1.NavigatorButtons.Prior.Click;
                id_dog_obnov := DataSetContrakts.FieldValues['ID_DT_ABIT_DOG'];
            except on e: Exception do
                begin
                    MessageBox(Handle, Pchar(nMsgErrorTransaction[IndLangVWF] + chr(13) +
                        nMsgTryAgain[IndLangVWF] + nMsgOr[IndLangVWF] + nMsgToAdmin[IndLangVWF] + chr(13) +
                        e.Message), Pchar(nMsgBoxTitle[IndLangVWF]), MB_OK or MB_ICONWARNING);
                    StoredProcContracts.Transaction.Rollback;
                end;
            end;
        end;

        Obnovit(StrToInt64({RxMemoryDataPrKViewWithFilter}DataSetPrKContractsStudy.FieldValues[ID_NAME]));
        ObnovitCn(id_dog_obnov);
    end;
end;


procedure TFormPrkContractsStudy.ActionPrintCnExecute(Sender: TObject);
var
    AParam: TcnSimpleParamsEx;
begin
    if DataSetContrakts.FieldValues['ID_DOG'] = Null
        then exit;
    AParam                         := TcnSimpleParamsEx.Create;
    AParam.Owner                   := self;
    AParam.Db_Handle               := DataBasePrKContractsStudy.Handle;
    AParam.cnParamsToPakage.ID_DOG := DataSetContrakts.FieldValues['ID_DOG'];
    AParam.WaitPakageOwner         := self;
    RunFunctionFromPackage(AParam, 'Contracts\cn_PrintDogovor.bpl', 'PrintDogovor');
    AParam.Free;
end;

procedure TFormPrkContractsStudy.ActionObnovExecute(Sender: TObject);
var
    i: Int64;
    id_dog_obnov: int64;
begin
    cxGridPrKContractsStudy.SetFocus;
    if {RxMemoryDataPrKViewWithFilter} DataSetPrKContractsStudy.FieldValues[ID_NAME] <> null
        then i := StrToInt64({RxMemoryDataPrKViewWithFilter}DataSetPrKContractsStudy.FieldValues[ID_NAME]);
    if DataSetContrakts.FieldValues['ID_DT_ABIT_DOG'] <> null
        then id_dog_obnov := DataSetContrakts.FieldValues['ID_DT_ABIT_DOG'];
    Obnovit(i);
//   DataSetContrakts.CloseOpen(false);
    ObnovitCn(id_dog_obnov);
end;

procedure TFormPrkContractsStudy.ActionOtmenaExecute(Sender: TObject);
begin
    close;
end;

procedure TFormPrkContractsStudy.ActionDejstvExecute(Sender: TObject);
begin
 if DataSetPrKContractsStudy.FieldValues['ID_DT_ABIT'] <> Null then
        begin
        //    StoredProcPrKContractsStudy.Transaction.Active := True;
            StoredProcPrKContractsStudy.Transaction.StartTransaction;
            StoredProcPrKContractsStudy.StoredProcName                    := 'PRK_ABIT_DOG_SET_DEYSTV';
        //    StoredProcPrKContractsStudy.Transaction.Active := True;
            StoredProcPrKContractsStudy.Prepare;
        //    StoredProcPrKContractsStudy.Transaction.Active := True;
            StoredProcPrKContractsStudy.ParamByName('ID_DT_ABIT').AsInt64 := DataSetPrKContractsStudy.FieldValues['ID_DT_ABIT'];
            StoredProcPrKContractsStudy.ExecProc;
            try
                StoredProcPrKContractsStudy.Transaction.Commit;
            except on e: Exception do
                begin
                  { MessageBox(Handle, Pchar(nMsgErrorTransaction[IndLangVWF] + chr(13) +
                        nMsgTryAgain[IndLangVWF] + nMsgOr[IndLangVWF] + nMsgToAdmin[IndLangVWF] + chr(13) +
                        e.Message), Pchar(nMsgBoxTitle[IndLangVWF]), MB_OK or MB_ICONWARNING);           }
                    StoredProcPrKContractsStudy.Transaction.Rollback;
                end;
            end;
        //   DataSetPrKContractsStudy.Locate(ID_DT_ABIT, id_dog_obnov, []);
        end
 else exit;
 ActionObnovExecute(Sender);
end;

procedure TFormPrkContractsStudy.ActionCandidatExecute(Sender: TObject);
begin
 if DataSetPrKContractsStudy.FieldValues['ID_DT_ABIT'] <> Null then
        begin
        //    StoredProcPrKContractsStudy.Transaction.Active := True;
            StoredProcPrKContractsStudy.Transaction.StartTransaction;
            StoredProcPrKContractsStudy.StoredProcName                    := 'PRK_ABIT_DOG_RESET_DEYSTV';
            StoredProcPrKContractsStudy.Prepare;
            StoredProcPrKContractsStudy.ParamByName('ID_DT_ABIT').AsInt64 := DataSetPrKContractsStudy.FieldValues['ID_DT_ABIT'];
            StoredProcPrKContractsStudy.ExecProc;
            try
                StoredProcPrKContractsStudy.Transaction.Commit;
            except on e: Exception do
                begin
                  { MessageBox(Handle, Pchar(nMsgErrorTransaction[IndLangVWF] + chr(13) +
                        nMsgTryAgain[IndLangVWF] + nMsgOr[IndLangVWF] + nMsgToAdmin[IndLangVWF] + chr(13) +
                        e.Message), Pchar(nMsgBoxTitle[IndLangVWF]), MB_OK or MB_ICONWARNING);           }
                    StoredProcPrKContractsStudy.Transaction.Rollback;
                end;
            end;
        //   DataSetPrKContractsStudy.Locate(ID_DT_ABIT, id_dog_obnov, []);
        end
 else exit;
 ActionObnovExecute(Sender);
end;

procedure TFormPrkContractsStudy.FormShow(Sender: TObject);
begin
 LoadKeyboardLayout( StrCopy(Layout,nLayoutLang[IndLangVWF]),KLF_ACTIVATE);
end;

end.

