
unit uPrK_Results_of_Filtr;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, AllPeopleDataModule, cxContainer, dxBar, dxBarExtItems, ActnList, ImgList, FIBDataSet, pFIBDataSet,
    FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase,
    cxGroupBox, cxGridLevel, cxGridCustomTableView, cxGridTableView,
    cxGridDBTableView, cxClasses, cxControls, {uPrK_Resources,} cxGridCustomView, cxGrid,
    dxStatusBar, RxMemDS, Placemnt, AArray, ibase, ib_externals, cxCheckBox,
    cxLabel, cxLookAndFeelPainters, StdCtrls, cxRadioGroup, cxButtons,
    cxDBLookupComboBox, Menus, cxSplitter, cxTextEdit, cxDBEdit, FileCtrl, Masks;

type
    TFormPrK_Results_of_Filtr = class(TForm)
        dxStatusBarPrK: TdxStatusBar;
        cxGroupBoxEDitData: TcxGroupBox;
        StyleRepositoryPrK: TcxStyleRepository;
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
        cxStyleSkyBlue: TcxStyle;
        cxStyleBackGround_Content: TcxStyle;
        cxStyleSelection: TcxStyle;
        DataBasePrK: TpFIBDatabase;
        TransactionReadPrK: TpFIBTransaction;
        TransactionWritePrK: TpFIBTransaction;
        StoredProcPrK: TpFIBStoredProc;
        DataSetPrK: TpFIBDataSet;
        DataSourcePrK: TDataSource;
        ImageListPrK: TImageList;
        ActionListPrK: TActionList;
        ActionADD: TAction;
        ActionChange: TAction;
        ActionDEL: TAction;
        ActionView: TAction;
        ActionObnov: TAction;
        ActionVibrat: TAction;
        ActionOtmena: TAction;
        ActionPrint: TAction;
        ActionEdit: TAction;
        dxBarManagerPrK: TdxBarManager;
        dxBarLargeButtonAdd: TdxBarLargeButton;
        dxBarLargeButtonChange: TdxBarLargeButton;
        dxBarLargeButtonVibrat: TdxBarLargeButton;
        dxBarLargeButtonObnov: TdxBarLargeButton;
        dxBarLargeButtonOtmena: TdxBarLargeButton;
        dxBarLargeButtonView: TdxBarLargeButton;
        dxBarLargeButtonDel: TdxBarLargeButton;
        cxEditStyleControllerPrK: TcxEditStyleController;
        RxMemoryDataPrK: TRxMemoryData;
        FormStoragePrK: TFormStorage;
        cxRadioGroupCaseEdit: TcxRadioGroup;
        PopupMenuMark: TPopupMenu;
        PopMenuMarkAll: TMenuItem;
        PopMenuNotMark: TMenuItem;
        dxBarLargeButtonEdit: TdxBarLargeButton;
        dxBarLargeButtonPrint: TdxBarLargeButton;
        cxGroupBoxPrint: TcxGroupBox;
        cxRadioButtonPovidProDopusk: TcxRadioButton;
        dxBarLargeButtonPerekl: TdxBarLargeButton;
        ActionPerekl: TAction;
        dxBarLargeButtonImportFoto: TdxBarLargeButton;
        ActionExportFoto: TAction;
        cxGroupBoxContracts: TcxGroupBox;
        cxGridPrKContracts: TcxGrid;
        cxGridPrKContractsDBTableView1: TcxGridDBTableView;
        colNUM_DOG: TcxGridDBColumn;
        colDATE_DOG: TcxGridDBColumn;
        colSUMMA: TcxGridDBColumn;
        cxGridPrKContractsLevel1: TcxGridLevel;
        cxGroupBoxDataDog: TcxGroupBox;
        cxLabelNAME_DOG_STATUS: TcxLabel;
        cxDBTextEditNAME_DOG_STATUS: TcxDBTextEdit;
        cxDBTextEditNAME_DOG_TYPE: TcxDBTextEdit;
        cxLabelNAME_DOG_TYPE: TcxLabel;
        cxLabelMFO: TcxLabel;
        cxDBTextEditMFO: TcxDBTextEdit;
        cxLabelFIO_PAYER: TcxLabel;
        cxDBTextEditFIO_PAYER: TcxDBTextEdit;
        cxSplitterContracts: TcxSplitter;
        dxBarButton1: TdxBarButton;
        dxBarDockControl1: TdxBarDockControl;
        dxBarLargeButton1: TdxBarLargeButton;
        dxBarLargeButton2: TdxBarLargeButton;
        dxBarLargeButton3: TdxBarLargeButton;
        dxBarLargeButton4: TdxBarLargeButton;
        dxBarLargeButton5: TdxBarLargeButton;
        ActionAddCN: TAction;
        ActionChangeCN: TAction;
        ActionChangeCN_Status: TAction;
        ActionDelCN: TAction;
        ActionPrintCN: TAction;
        DataSetContrakts: TpFIBDataSet;
        DataSourceContrakts: TDataSource;
        StoredProcContracts: TpFIBStoredProc;
        cxGridPrK: TcxGrid;
        cxGridPrKDBTableView1: TcxGridDBTableView;
        colIS_SELECTED: TcxGridDBColumn;
        colFIO: TcxGridDBColumn;
        colNOMER_DELA: TcxGridDBColumn;
        colSHORT_NAME_FAK: TcxGridDBColumn;
        colSHORT_NAME_SPEC: TcxGridDBColumn;
        colSHORT_NAME_FORM_STUD: TcxGridDBColumn;
        colIs_Locked: TcxGridDBColumn;
        cxGridPrKLevel1: TcxGridLevel;
        procedure FormCreate(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure FormShow(Sender: TObject);
        procedure ActionObnovExecute(Sender: TObject);
        procedure ActionOtmenaExecute(Sender: TObject);
        procedure ActionChangeExecute(Sender: TObject);
        procedure ActionViewExecute(Sender: TObject);
        procedure ActionEditExecute(Sender: TObject);
        procedure PopMenuMarkAllClick(Sender: TObject);
        procedure PopMenuNotMarkClick(Sender: TObject);
        procedure ActionPrintExecute(Sender: TObject);
        procedure dxBarLargeButtonPereklClick(Sender: TObject);
        procedure ActionPereklExecute(Sender: TObject);
        procedure ActionExportFotoExecute(Sender: TObject);
        procedure ActionAddCNExecute(Sender: TObject);
        procedure ActionChangeCNExecute(Sender: TObject);
        procedure ActionChangeCN_StatusExecute(Sender: TObject);
        procedure ActionDelCNExecute(Sender: TObject);
        procedure ActionPrintCNExecute(Sender: TObject);
        procedure DataSetContraktsAfterOpen(DataSet: TDataSet);
        procedure RxMemoryDataPrKAfterScroll(DataSet: TDataSet);
        procedure colIs_LockedCustomDrawCell(Sender: TcxCustomGridTableView;
            ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
            var ADone: Boolean);
    private
        CanAfterScroll: Boolean; //*
        DBHANDLE: TISC_DB_HANDLE;
        ResultArray: TAArray;
        TextViewColor: TColor;
        IndLang: integer;
        FID_NAME: string; //*
        Layout: array[0..KL_NAMELENGTH] of char;
        FSelectSQLTextPrK: AnsiString;
        FSelectSQLTextCN: string; //AnsiString;
        ExportFile: Text;
        procedure InicCaption;
        procedure Obnovit(id_obnovit: int64);
        procedure SetID_NAME(const Value: string); //*
        procedure SetSelectSQLTextPrK(const Value: AnsiString);
        procedure SetSelectSQLTextCN(const Value: string); //AnsiString;
        function Deleting(path: string): Boolean;
    public
        User_Name_Global: string; //*
        ID_USER_GLOBAL: Int64;
        ID_GOD_NABORA_GLOBAL: Int64;
        AParamArray: Variant; // Массив идентификаторов [0 - ID_MAN; 1 - ID_DT_ABIT]
        pID_RecCount: Integer;
        constructor Create(aOwner: TComponent; aParam: TAArray); overload;
        procedure ObnovitCn(id_obnovit: int64);
        property SelectSQLTextPrK: AnsiString read FSelectSQLTextPrK write SetSelectSQLTextPrK;
        property SelectSQLTextCN: string read FSelectSQLTExtCN write SetSelectSQLTextCN;
        property ID_NAME: string read FID_NAME write SetID_NAME;
    end;

procedure ShowAllPrkBpl(aOwner: TComponent; aParam: TAArray); stdcall;
exports ShowAllPrkBpl;

var
    FormPrK_Results_of_Filtr: TFormPrK_Results_of_Filtr;

implementation
uses
    uPrK_Resources, uConstants, DateUtils, uPrK_Loader,
    uPrK_Results_of_Filtr_Edit, cn_Common_Types, cn_Common_Loader,
    uPrK_Results_of_Filtr_ProgressBar;
{$R *.dfm}

procedure ShowAllPrkBpl(aOwner: TComponent; aParam: TAArray);
var
    T: TFormPrK_Results_of_Filtr;
begin
    T := TFormPrK_Results_of_Filtr.Create(aOwner, aParam);

    T.FormStyle := aParam['Input']['aFrmStyle'].AsVariant;
    case T.FormStyle of
        fsNormal: begin
                T.ShowModal;
                  // T.ActionVibrat.Enabled:=true;
                  // T.dxBarLargeButtonVibrat.Visible:=ivAlways;
            end;
        fsMDIChild: begin
                 //  T.ActionVibrat.Enabled:=false;
                 //  T.dxBarLargeButtonVibrat.Visible:=ivNever;
            end;
    else
        T.Free;
    end;
end;

{ TFormPrK_Results_of_Filtr }

constructor TFormPrK_Results_of_Filtr.Create(aOwner: TComponent;
    aParam: TAArray);
begin
    if Assigned(PVoid(aParam['Input']['aDBHANDLE'])) then
    begin
        DBHANDLE := PVoid(aParam['Input']['aDBHANDLE'].asInteger);
        ResultArray := aParam;
        IndLang := SelectLanguage;
        TextViewColor := cl3DLight;
        ID_USER_GLOBAL := ResultArray['Input']['ID_USER'].AsInt64;
        ID_GOD_NABORA_GLOBAL := ResultArray['Input']['ID_GOD_NABORA'].AsInt64;
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

procedure TFormPrK_Results_of_Filtr.FormCreate(Sender: TObject);
begin
    ID_NAME := 'ID_DT_ABIT';
    InicCaption;
  // возможно нужно будет переделать в VarToAnsiString(ResultArray['Input']['WHERE'].asVariant)
    SelectSQLTextPrK :='Select * from PRK_FND_ABIT_LIST_SELECT(:ID_SP_GOD_NABORA,:WHERE_STMT)';
    SelectSQLTextCN := 'Select * from PRK_ABIT_DOG_INFO_SELECT(:ID_DT_ABIT)';
    User_Name_Global := 'Abityrient';
    CanAfterScroll := True;
end;

procedure TFormPrK_Results_of_Filtr.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then begin
        ResultArray.Free;
        ResultArray := nil;
        Action := caFree;
    end;
end;

procedure TFormPrK_Results_of_Filtr.FormShow(Sender: TObject);
begin
                                {422-урк, 409-англ, 419-рус}
    LoadKeyboardLayout(StrCopy(Layout, nLayoutLang[IndLang]), KLF_ACTIVATE);

end;

procedure TFormPrK_Results_of_Filtr.InicCaption;
begin
    TFormPrK_Results_of_Filtr(self).Caption := nFormPrK_Results_of_Filtr_Caption[IndLang];
    ActionChange.Caption := nAction_Change[IndLang];
    ActionView.Caption := nAction_View[IndLang];
    ActionObnov.Caption := nActiont_Obnov[IndLang];
    ActionOtmena.Caption := nAction_Exit[IndLang];
    ActionEdit.Caption := nAction_Edit[IndLang];
    ActionPrint.Caption := nActiontPrint[IndLang];
    ActionPerekl.Caption := nActionPerekl[IndLang];
    ActionExportFoto.Caption := 'Экспорт DP2000';


    ActionChange.Hint := nHintAction_Change[IndLang];
    ActionView.Hint := nHintAction_View[IndLang];
    ActionObnov.Hint := nHintAction_Obnov[IndLang];
    ActionOtmena.Hint := nHintAction_Exit[IndLang];
    ActionEdit.Hint := nHintAction_Edit[IndLang];
    ActionPrint.Hint := nHintActiontPrint[IndLang];
    ActionPerekl.Hint := nActionPerekl[IndLang];
    ActionExportFoto.Hint := 'Экспорт DP2000';

    cxRadioGroupCaseEdit.Caption := nAction_Edit[IndLang];
    cxRadioGroupCaseEdit.Properties.Items[0].Caption := ncxRadioButtonNumDela[IndLang];
    cxRadioGroupCaseEdit.Properties.Items[1].Caption := ncxRadioButtonKatPriem[IndLang];
    cxRadioGroupCaseEdit.Properties.Items[2].Caption := ncxRadioButtonProtDop[IndLang];
    cxRadioGroupCaseEdit.Properties.Items[3].Caption := ncxRadioButtonProtZarah[IndLang];
    cxRadioGroupCaseEdit.Properties.Items[4].Caption := ncxRadioButtonPriznZarah[IndLang];
    cxRadioGroupCaseEdit.Properties.Items[5].Caption := ncxRadioButtonNakazi[IndLang];
    cxRadioGroupCaseEdit.Properties.Items[6].Caption := ncxRadioButtonNedopysk[IndLang];
    cxRadioGroupCaseEdit.Properties.Items[7].Caption := ncxRadioButtonZabrDok[IndLang];

    cxGroupBoxPrint.Caption := nActiontPrint[IndLang];
    cxRadioButtonPovidProDopusk.Caption := ncxRadioButtonPovidProDopusk[IndLang];

    colIS_SELECTED.Caption := ncolIS_SELECTED[IndLang];
    colFIO.Caption := ncolFIO[IndLang];
    colNOMER_DELA.Caption := ncolNOMER_DELA[IndLang];
    colSHORT_NAME_FAK.Caption := ncolNAME_FAK[IndLang];
    colSHORT_NAME_SPEC.Caption := ncolNAME_SPEC[IndLang];
    colSHORT_NAME_FORM_STUD.Caption := ncolSHORT_NAME_CN_FORM_STUD[IndLang];
    colIS_LOCKED.Caption := ncolIS_LOCKED[IndLang];

    ActionAddCN.Caption := nActionAddCN[IndLang];
    ActionChangeCN.Caption := nActionChangeCN[IndLang];
    ActionDelCN.Caption := nActionDelCN[IndLang];
    ActionPrintCn.Caption := nActiontPrint[IndLang];
    ActionChangeCN_Status.Caption := nActionChangeCN_Status[IndLang];
    ActionAddCN.Hint := nHintAction_Add[IndLang];
    ActionChangeCN.Hint := nHintAction_Change[IndLang];
    ActionDelCN.Hint := nHintAction_Del[IndLang];
    ActionPrintCn.Hint := nHintActiontPrint[IndLang];
    ActionChangeCN_Status.Hint := nHintActionChangeCN_Status[IndLang];

    cxGroupBoxContracts.Caption := ncxGroupBoxContracts[IndLang];
    //cxGroupBoxAllFilter.Caption            :=ncxGroupBoxFilter[IndLang];

    colNUM_DOG.Caption := ncolNUM_DOG[IndLang];
    colDATE_DOG.Caption := ncolDATE_DOG[IndLang];
    colSUMMA.Caption := ncolSUMMA[IndLang];

    cxLabelNAME_DOG_STATUS.Caption := nLabelNAME_DOG_STATUS[IndLang];
    cxLabelNAME_DOG_TYPE.Caption := nLabelNAME_DOG_TYPE[IndLang];
    cxLabelMFO.Caption := nLabelMFO[IndLang];
    cxLabelFIO_PAYER.Caption := nLabelFIO_PAYER[IndLang];
end;

procedure TFormPrK_Results_of_Filtr.SetSelectSQLTextPrK(
    const Value: AnsiString);
begin
    FSelectSQLTextPrK := Value;
    DataBasePrK.close;
    DataSetPrK.Active := false;
    DataBasePrK.Handle := DBHANDLE;
    DataBasePrK.DefaultTransaction := TransactionReadPrK;
    DataSetPrK.Database := DataBasePrK;
    DataSetPrK.Transaction := TransactionReadPrK;
    DataSetPrK.SelectSQL.Clear;
    DataSetPrK.SQLs.SelectSQL.Text := FSelectSQLTextPrK;
    DataSetPrK.ParamByName('ID_SP_GOD_NABORA').AsInt64 := ResultArray['Input']['ID_GOD_NABORA'].AsInt64;
    DataSetPrK.ParamByName('WHERE_STMT').AsString :=ResultArray['Input']['WHERE'].AsString;
    DataSetPrK.CloseOpen(false);
    DataSetPrK.fetchAll;
    dxStatusBarPrK.Panels[0].Text := nLabelKolVo_Records[IndLang] + ': ' + IntTostr(DataSetPrK.RecordCount);
    RxMemoryDataPrK.LoadFromDataSet(DataSetPrK, DataSetPrK.RecordCount, lmCopy);
    DataSetPrK.Active := false;
           // RxMemoryDataPrK.FieldDefs.Add('IS_SELECTED',ftVariant,2,true);
end;

procedure TFormPrK_Results_of_Filtr.SetSelectSQLTextCN(
    const Value: string);
begin
    FSelectSQLTextCN := Value;
    DataSetContrakts.Active := false;
    DataSetContrakts.Database := DataBasePrK;
    DataSetContrakts.Transaction := TransactionReadPrK;
    DataSetContrakts.SelectSQL.Clear;
    DataSetContrakts.SQLs.SelectSQL.Text := FSelectSQLTextCN;
    if {RxMemoryDataPrKViewWithFilter} RxMemoryDataPrK.fieldValues['ID_DT_ABIT'] <> null
        then DataSetContrakts.ParamByName('ID_DT_ABIT').AsInt64 := RxMemoryDataPrK.fieldValues['ID_DT_ABIT']
    else DataSetContrakts.ParamByName('ID_DT_ABIT').AsInt64 := -1;
    DataSetContrakts.CloseOpen(false);
end;

procedure TFormPrK_Results_of_Filtr.SetID_NAME(const Value: string);
begin
    if Trim(Value) = '' then ShowMessage('Пустое имя id!!!' + CHR(13) +
            'Дальнейшая работа программы будет неверной!');
    FID_NAME := Value;
end;

procedure TFormPrK_Results_of_Filtr.Obnovit(id_obnovit: int64);
begin
    CanAfterScroll := False;
    DataSetPrK.CloseOpen(false);
    DataSetPrK.fetchall;
    RxMemoryDataPrK.LoadFromDataSet(DataSetPrK, DataSetPrK.RecordCount, lmCopy);
    DataSetPrK.Active := false;
    RxMemoryDataPrK.Locate('ID_DT_ABIT', id_obnovit, []);
    CanAfterScroll := True;
      //RxMemoryDataPrK.Active:=false;
      //RxMemoryDataPrK.FieldDefs.Items[59].Create(RxMemoryDataPrK.FieldDefs,'IS_SELECTED',ftVariant,0,false, 60);
      //RxMemoryDataPrK.FieldDefs.Items[59].CreateField(self,nil,'IS_SELECTED');
      //RxMemoryDataPrK.Active:=true;

end;

procedure TFormPrK_Results_of_Filtr.ObnovitCn(id_obnovit: int64);
begin
    DataSetContrakts.Active := false;
    if {RxMemoryDataPrKViewWithFilter} RxMemoryDataPrK.fieldValues['ID_DT_ABIT'] <> null
        then DataSetContrakts.ParamByName('ID_DT_ABIT').AsInt64 := {RxMemoryDataPrKViewWithFilter} RxMemoryDataPrK.fieldValues['ID_DT_ABIT']
    else DataSetContrakts.ParamByName('ID_DT_ABIT').AsInt64 := -1;
    DataSetContrakts.CloseOpen(false);
    if DataSetContrakts.FieldValues['ID_DT_ABIT_DOG'] <> null
        then DataSetContrakts.Locate('ID_DT_ABIT_DOG', id_obnovit, []);
end;

procedure TFormPrK_Results_of_Filtr.ActionObnovExecute(Sender: TObject);
var
    i: int64;
    id_dog_obnov: int64;
begin
    cxGridPrK.SetFocus;
    if RxMemoryDataPrK.FieldValues['ID_DT_ABIT'] = null
        then i := -1
    else i := RxMemoryDataPrK.FieldValues['ID_DT_ABIT'];
    if DataSetContrakts.FieldValues['ID_DT_ABIT_DOG'] <> null
        then id_dog_obnov := DataSetContrakts.FieldValues['ID_DT_ABIT_DOG'];
    Obnovit(i);
    ObnovitCn(id_dog_obnov);
end;

procedure TFormPrK_Results_of_Filtr.ActionOtmenaExecute(Sender: TObject);
begin
    close;
end;

procedure TFormPrK_Results_of_Filtr.ActionChangeExecute(Sender: TObject);
var
    InputParam: TAArray;
begin
    if RxMemoryDataPrK.FieldValues['ID_DT_ABIT'] <> Null then
    begin
        InputParam := TAArray.Create;
        InputParam['Input']['aDBHANDLE'].AsInteger := Integer(DataBasePrK.Handle);
        InputParam['Input']['aFrmStyle'].AsVariant := fsNormal;
        InputParam['Input']['GodNabora'].AsInt64 := ID_GOD_NABORA_GLOBAL;
        InputParam['Input']['ID_DT_ABIT'].AsInt64 := RxMemoryDataPrK.FieldByName('ID_DT_ABIT').value;
        InputParam['Input']['Rejim'].AsVariant := ChangePrk;
        InputParam['Input']['ID_USER_GLOBAL'].AsInt64 := ID_USER_GLOBAL;
        uPrK_Loader.ShowAbit(self, InputParam);
        ActionObnovExecute(sender);
    end;

end;

procedure TFormPrK_Results_of_Filtr.ActionViewExecute(Sender: TObject);
var
    InputParam: TAArray;
begin
    if RxMemoryDataPrK.FieldValues['ID_DT_ABIT'] <> Null then
    begin
        InputParam := TAArray.Create;
        InputParam['Input']['aDBHANDLE'].AsInteger := Integer(DataBasePrK.Handle);
        InputParam['Input']['aFrmStyle'].AsVariant := fsNormal;
        InputParam['Input']['GodNabora'].AsInt64 := ID_GOD_NABORA_GLOBAL;
        InputParam['Input']['ID_DT_ABIT'].AsInt64 := RxMemoryDataPrK.FieldByName('ID_DT_ABIT').value;
        InputParam['Input']['Rejim'].AsVariant := ViewPrK;
        uPrK_Loader.ShowAbit(self, InputParam);
    end;
end;

procedure TFormPrK_Results_of_Filtr.ActionEditExecute(Sender: TObject);
var
    T: TFormPrK_Results_of_Filtr_Edit;
    TextWhere: AnsiString;
    InputParam: TAArray;
    Id_loc: Int64;
begin

    InputParam := TAArray.Create;
    RxMemoryDataPrK.edit;
    RxMemoryDataPrK.post;
    if RxMemoryDataPrK.FieldValues['ID_DT_ABIT'] = null then exit
    else Id_loc := RxMemoryDataPrK.FieldValues['ID_DT_ABIT'];
    TextWhere := '(';
    DataSourcePrK.Enabled := false;
    RxMemoryDataPrK.First;
    while not RxMemoryDataPrK.Eof do
    begin
        if RxMemoryDataPrK.FieldByName('IS_SELECTED').AsInteger = 1 then
        begin
            TextWhere := TextWhere + RxMemoryDataPrK.FieldByName('ID_DT_ABIT').AsString + ',';
        end;
        RxMemoryDataPrK.Next;
    end;
    if TextWhere = '(' then
    begin
        ShowMessage(nMsgEmptySelectAbit[IndLang]);
        RxMemoryDataPrK.Locate('ID_DT_ABIT', id_loc, []);
        DataSourcePrK.Enabled := true;
        exit;
    end
    else begin
        Delete(TextWhere, Length(TextWhere), 1);
        TextWhere := TextWhere + ')';
    end;
    InputParam['TextWhere'].AsString := TextWhere;
    T := TFormPrK_Results_of_Filtr_Edit.Create(self, InputParam);
    T.ShowModal;
    T.free;
    InputParam.Free;
    InputParam := nil;
    RxMemoryDataPrK.Locate('ID_DT_ABIT', id_loc, []);
    DataSourcePrK.Enabled := true;
end;

procedure TFormPrK_Results_of_Filtr.PopMenuMarkAllClick(Sender: TObject);
var
    Id_loc: Int64;
begin
  
    if RxMemoryDataPrK.FieldValues['ID_DT_ABIT'] = null then exit
    else Id_loc := RxMemoryDataPrK.FieldValues['ID_DT_ABIT'];
    DataSourcePrK.Enabled := false;
    RxMemoryDataPrK.First;
    while not RxMemoryDataPrK.Eof do
    begin
        RxMemoryDataPrK.Edit;
        RxMemoryDataPrK.FieldByName('IS_SELECTED').AsInteger := 1;
        RxMemoryDataPrK.Post;
        RxMemoryDataPrK.Next;
    end;
    RxMemoryDataPrK.Locate('ID_DT_ABIT', id_loc, []);
    DataSourcePrK.Enabled := true;
end;

procedure TFormPrK_Results_of_Filtr.PopMenuNotMarkClick(Sender: TObject);
var
    Id_loc: Int64;
begin
  
    if RxMemoryDataPrK.FieldValues['ID_DT_ABIT'] = null then exit
    else Id_loc := RxMemoryDataPrK.FieldValues['ID_DT_ABIT'];
    DataSourcePrK.Enabled := false;
    RxMemoryDataPrK.First;
    while not RxMemoryDataPrK.Eof do
    begin
        RxMemoryDataPrK.edit;
        RxMemoryDataPrK.FieldByName('IS_SELECTED').AsInteger := 0;
        RxMemoryDataPrK.Post;
        RxMemoryDataPrK.Next;
    end;
    RxMemoryDataPrK.Locate('ID_DT_ABIT', id_loc, []);
    DataSourcePrK.Enabled := true;
end;

procedure TFormPrK_Results_of_Filtr.ActionPrintExecute(Sender: TObject);
var
    InputParam: TAArray;
    i: integer;
    STR_ID_DT_ABITS: string;
    Id_loc: Int64;
begin

    if cxRadioButtonPovidProDopusk.Checked = true then
    begin
        RxMemoryDataPrK.edit;
        RxMemoryDataPrK.post;
        if RxMemoryDataPrK.FieldValues['ID_DT_ABIT'] = null then exit
        else Id_loc := RxMemoryDataPrK.FieldValues['ID_DT_ABIT'];

        STR_ID_DT_ABITS := '|';
        DataSourcePrK.Enabled := false;
        RxMemoryDataPrK.First;
        while not RxMemoryDataPrK.Eof do
        begin
            if RxMemoryDataPrK.FieldByName('IS_SELECTED').AsInteger = 1 then
            begin
                STR_ID_DT_ABITS := STR_ID_DT_ABITS + RxMemoryDataPrK.FieldByName('ID_DT_ABIT').AsString + '|';
            end;
            RxMemoryDataPrK.Next;
        end;
        if STR_ID_DT_ABITS = '|' then
        begin
            ShowMessage(nMsgEmptySelectAbit[IndLang]);
            RxMemoryDataPrK.Locate('ID_DT_ABIT', id_loc, []);
            DataSourcePrK.Enabled := true;
            exit;
        end;


        InputParam := TAArray.Create;
        InputParam['Name_Bpl'].AsString := 'PrK_rptLoader.bpl';
        InputParam['Input']['aDBHANDLE'].AsInteger := Integer(DataBasePrk.Handle);
        InputParam['Input']['aNameReport'].AsString := 'POVIDOMLEN_DOPUSK';
        i := 1;
        InputParam['Input']['ParamNames'][i].AsString := 'ID_SP_GOD_NABORA';
        InputParam['Input']['ParamValues'][i].AsVariant := ID_GOD_NABORA_GLOBAL;
        i := 2;
        InputParam['Input']['ParamNames'][i].AsString := 'STR_ID_DT_ABITS';
        InputParam['Input']['ParamValues'][i].AsVariant := STR_ID_DT_ABITS;
        InputParam['Input']['ParamTypes'][i].AsInteger := 2 {String};

     {  i:=3;
       InputParam['Input']['ParamNames'][i].AsString       := 'ID_SP_GOD_NABORA';
       InputParam['Input']['ParamValues'][i].AsVariant     := ID_GOD_NABORA_GLOBAL;
       i:=4;
       InputParam['Input']['ParamNames'][i].AsString       := 'STR_ID_DT_ABITS';
       InputParam['Input']['ParamValues'][i].AsVariant     := STR_ID_DT_ABITS;  }

        InputParam['Input']['Count_Param'].AsInteger := 2;
        uPrK_Loader.ShowAllPrkBpl(self, InputParam);


        RxMemoryDataPrK.Locate('ID_DT_ABIT', id_loc, []);
        DataSourcePrK.Enabled := true;
    end;

end;

procedure TFormPrK_Results_of_Filtr.dxBarLargeButtonPereklClick(Sender: TObject);
var
    InputParam: TAArray;
begin
    if RxMemoryDataPrK.FieldValues['ID_DT_ABIT'] <> Null then
    begin
        InputParam := TAArray.Create;
        InputParam['Input']['aDBHANDLE'].AsInteger := Integer(DataBasePrK.Handle);
        InputParam['Input']['aFrmStyle'].AsVariant := fsNormal;
        InputParam['Input']['GodNabora'].AsInt64 := ID_GOD_NABORA_GLOBAL;
        InputParam['Input']['ID_DT_ABIT'].AsInt64 := RxMemoryDataPrK.FieldByName('ID_DT_ABIT').value;
        InputParam['Input']['Rejim'].AsVariant := ChangePrk;
        InputParam['Input']['ID_USER_GLOBAL'].AsInt64 := ID_USER_GLOBAL;
        uPrK_Loader.ShowAbit(self, InputParam);
        ActionObnovExecute(sender);
    end;
end;

procedure TFormPrK_Results_of_Filtr.ActionPereklExecute(Sender: TObject);
var
    InputParam: TAArray;
    New_ID_DT_ABIT: Int64;
    V: Variant;
begin
    if RxMemoryDataPrK.FieldValues['ID_DT_ABIT'] <> Null then
    begin
        InputParam := TAArray.Create;
        InputParam['Input']['aDBHANDLE'].AsInteger := Integer(DataBasePrK.Handle);
        InputParam['Input']['aFrmStyle'].AsVariant := fsNormal;
        InputParam['Input']['GodNabora'].AsInt64 := ID_GOD_NABORA_GLOBAL;
        InputParam['Input']['ID_DT_ABIT'].AsInt64 := RxMemoryDataPrK.FieldByName('ID_DT_ABIT').value;
        InputParam['Input']['Rejim'].AsVariant := ChangePrk;
        InputParam['Input']['ID_USER_GLOBAL'].AsInt64 := ID_USER_GLOBAL;
// Получаем из функции новый ID_DT_ABIT и добавляем его в строку для фильтрации
        V := uPrK_Loader.LoadSimplePackage(self, InputParam, 'PrK\Prk_OperWithAbit.bpl', 'ViewPereklForm');
        if VarIsNull(V) then Exit;
        New_ID_DT_ABIT := v;
        DataSetPrK.ParamByName('WHERE_STMT').AsString := DataSetPrK.ParamByName('WHERE_STMT').AsString + ' OR ID_DT_ABIT = ' + IntToStr(New_ID_DT_ABIT);
        ActionObnovExecute(sender);
        RxMemoryDataPrK.Locate('ID_DT_ABIT', New_ID_DT_ABIT, []);
    end;
end;

procedure TFormPrK_Results_of_Filtr.ActionExportFotoExecute(
    Sender: TObject);
var {AParamArray:Variant;   }
    SelectedRecordCount: Integer;
    text: string;
    croot: WideString;
    cFile, cPath: string;
    i, Id_Loc: Integer;
 // InputArray:TAArray;
    ImportResult: Variant;
    ExportFileName: string;
    pImageDB_Handle: TISC_DB_HANDLE;
    DataBaseFOTO: TpFIBDatabase;
    TransactionReadFOTO: TpFIBTransaction;
    pFIBStoredProcFOTO: TpFIBStoredProc;
    DataBaseDATA: TpFIBDatabase;
    TransactionReadDATA: TpFIBTransaction;
    pFIBStoredProcData: TpFIBStoredProc;
    CountExpAbit: Integer;
    FormPrBar: TFormPrK_Results_of_Filtr_ProgressBar;
begin


    cPath := '';
    cRoot := '';
    CountExpAbit := 0;
    if SelectDirectory('Вибір директорії для експорту', cRoot, cPath) then
    begin
        cPath := cPath + '\';
        if not Deleting(cPath) then exit;
    end
    else exit;

 //   if cPath <> '' then cPath := cPath + '\';
 // cPath := ExtractFilePath(Application.ExeName)+'Export\'  ;
    text := '';

    pImageDB_Handle := uPrK_Resources.GetImageDBHandle(DBHANDLE);
    SelectedRecordCount := 0;
    if pImageDB_Handle <> nil then
    begin
        RxMemoryDataPrK.edit;
        RxMemoryDataPrK.post;

        if RxMemoryDataPrK.FieldValues['ID_DT_ABIT'] = null then exit
        else Id_loc := RxMemoryDataPrK.FieldValues['ID_DT_ABIT'];
        CountExpAbit := RxMemoryDataPrK.FieldCount;
        DataSourcePrK.Enabled := False;
//Создаем объекты для работы с DB_IMAGE
        DataBaseFOTO := TpFIBDatabase.Create(nil);
        TransactionReadFOTO := TpFIBTransaction.Create(nil);
        pFIBStoredProcFOTO := TpFIBStoredProc.Create(nil);
        TransactionReadFOTO.DefaultDataBase := DataBaseFOTO;
        pFIBStoredProcFOTO.DataBase := DataBaseFOTO;
        pFIBStoredProcFOTO.Transaction := TransactionReadFOTO;
        DataBaseFOTO.SQLDialect := 3;
        DataBaseFOTO.Handle := pImageDB_Handle;
        TransactionReadFOTO.Active := True;
        pFIBStoredProcFOTO.StoredProcName := 'FOTO_GET_CURRENT_BY_ID_MAN';
        pFIBStoredProcFOTO.Prepare;
        DataBaseDATA := TpFIBDatabase.Create(nil);
        TransactionReadDATA := TpFIBTransaction.Create(nil);
        pFIBStoredProcDATA := TpFIBStoredProc.Create(nil);
        TransactionReadDATA.DefaultDataBase := DataBaseDATA;
        pFIBStoredProcDATA.DataBase := DataBaseDATA;
        pFIBStoredProcDATA.Transaction := TransactionReadDATA;
        DataBaseDATA.SQLDialect := 3;
        DataBaseDATA.Handle := DBHANDLE;
        TransactionReadDATA.Active := True;
        pFIBStoredProcDATA.StoredProcName := 'PRK_ABIT_DP2000_SELECT';
        pFIBStoredProcDATA.Prepare;

        ExportFileName := cpath + 'Export.txt';
        AssignFile(ExportFile, ExportFileName);

        Rewrite(ExportFile);

        FormPrBar :=TFormPrK_Results_of_Filtr_ProgressBar.Create(CountExpAbit);
        FormPrBar.Show;

        RxMemoryDataPrK.First;
        while not RxMemoryDataPrK.Eof do
        begin
            if RxMemoryDataPrK.FieldByName('IS_SELECTED').AsInteger = 1 then
            begin
                text := '';
                pFIBStoredProcFOTO.ParamByName('IN_ID_MAN').AsInt64 := RxMemoryDataPrK.fieldValues['ID_MAN'];
                pFIBStoredProcFOTO.ExecProc;
                if not VarIsNull(pFIBStoredProcFOTO.FN('FOTO').AsVariant) then
                begin
                    cFile := 'f' + RxMemoryDataPrK.FieldByName('ID_DT_ABIT').AsString + '.jpg';
                    pFIBStoredProcFOTO.FN('FOTO').SaveToFile(cPath + cFile);
                end
                else cFile := '';
                pFIBStoredProcDATA.ParamByName('ID_DT_ABIT').AsInt64 := RxMemoryDataPrK.FieldValues['ID_DT_ABIT'];
                pFIBStoredProcDATA.ExecProc;
                with pFIBStoredProcDATA do
                    text := FN('FAMILIA').AsString + '|' + FN('IMYA').AsString + '|' + FN('OTCHESTVO').AsString + '|' +
                        FN('SEX').AsString + '|' + FN('BIRTH_DATE').AsString + '|' + FN('TYPE_DOK').AsString + '|' +
                        FN('PASS_SERIA').AsString + '|' + FN('PASS_NUMBER').AsString + '|' + FN('FINANSUVAN').AsString + '|' + FN('TIN').AsString + '|' +
                        FN('VIDZNAKA').AsString + '|' + FN('NAVCH_POCHATOK').AsString + '|' + FN('NAVCH_ZAKINCH').AsString + '|' + cFile + '|' +
                        FN('PRIMITKA_1').AsString + '|' + FN('PRIMITKA_2').AsString + '|' + FN('PRIMITKA_3').AsString + '|' + FN('FORM_STUD').AsString + '|' + FN('DATE_VIDACHI').AsString + '|' + FN('DATE_DIYSNIY_DO').AsString + '|' +
                        FN('NAME_FAK').AsString + '|' + Trim(FN('GRUPPA').AsString) + '|' + FN('SHIFR_SPEC').AsString + '|' + FN('NAME_SPEC').AsString + '|' + FN('KVALIFIKACIA').AsString + '|' + FN('GRADUATED').AsString + #13;
                write(ExportFile, text);
              FormPrBar.ProgressBarExport.StepIt;
            end;
            RxMemoryDataPrK.Next;
        end;
        write(ExportFile, #26);
        FormPrBar.Release;
        TransactionReadFOTO.Commit;
        TransactionReadFOTO.Active := False;
        pFIBStoredProcFOTO.Free;
        TransactionReadFOTO.Free;
        DataBaseFOTO.Free;
        TransactionReadDATA.Commit;
        pFIBStoredProcDATA.Free;
        TransactionReadFOTO.Active := False;
        TransactionReadDATA.Free;
        DataBaseDATA.Free;
        CloseFile(ExportFile);

        RxMemoryDataPrK.Locate('ID_DT_ABIT', id_loc, []);
        DataSourcePrK.Enabled := true;
    end;
end;

procedure TFormPrK_Results_of_Filtr.ActionAddCNExecute(Sender: TObject);
var
    AParameter: TcnSimpleParamsAbiturient; // класс параметров для создания подключения
    cnParamsRecord: TcnParamsToAddContract; // тип-запись для входящих параметров по обучению
    res: Variant; //результат работы справочника
    id_dog_obnov: int64;
begin
    if {RxMemoryDataPrKViewWithFilter} RxMemoryDataPrK.FieldValues['ID_DT_ABIT'] <> Null then
    begin
      // запуск справочника
        AParameter := TcnSimpleParamsAbiturient.Create; // создать класс подключения
        AParameter.Owner := self; // владелец
        AParameter.Db_Handle := DataBasePrK.Handle; // хендл базы
        AParameter.ID_User := ID_User_Global; //иде-р пользователя в системе ?
        AParameter.User_Name := User_Name_Global; //имя пользователя  ?
        AParameter.Formstyle := fsNormal; // тип формы
        AParameter.WaitPakageOwner := self; // владелец окна ожидания загрузки
        AParameter.WorkMode := 'extra'; // тип вызова - "extra" означает для системы абитуриент
        AParameter.ActionMode := 'add'; // режим работы в системе - "добавление контракта"
      // входящие параметры
        if DataSetContrakts.RecordCount = 0
            then cnParamsRecord.ID_DOG_STATUS := {RxMemoryDataPrKViewWithFilter} RxMemoryDataPrK.FieldValues['ID_DOG_STATUS_CANDIDATE']
        else cnParamsRecord.ID_DOG_STATUS := {RxMemoryDataPrKViewWithFilter} RxMemoryDataPrK.FieldValues['ID_DOG_STATUS_PROJECT'];

        cnParamsRecord.ID_DEPARTMENT := {RxMemoryDataPrKViewWithFilter} RxMemoryDataPrK.FieldValues['ID_SP_DEPARTMENT_FAK'];
        cnParamsRecord.ID_SPEC := {RxMemoryDataPrKViewWithFilter} RxMemoryDataPrK.FieldValues['ID_SP_SPEC'];
        cnParamsRecord.ID_GROUP := {RxMemoryDataPrKViewWithFilter} RxMemoryDataPrK.FieldValues['ID_GROUP'];
        cnParamsRecord.ID_FORM_STUD := {RxMemoryDataPrKViewWithFilter} RxMemoryDataPrK.FieldValues['ID_CN_SP_FORM_STUD'];
        cnParamsRecord.ID_KAT_STUD := {RxMemoryDataPrKViewWithFilter} RxMemoryDataPrK.FieldValues['ID_CN_SP_KAT_STUD'];
        cnParamsRecord.ID_NATIONAL := {RxMemoryDataPrKViewWithFilter} RxMemoryDataPrK.FieldValues['ID_NATIONAL'];
        cnParamsRecord.KURS := {RxMemoryDataPrKViewWithFilter} RxMemoryDataPrK.FieldValues['KOD_KURS'];
        cnParamsRecord.DATE_BEG := {RxMemoryDataPrKViewWithFilter} RxMemoryDataPrK.FieldValues['DATE_BEG'];
        cnParamsRecord.DATE_END := {RxMemoryDataPrKViewWithFilter} RxMemoryDataPrK.FieldValues['DATE_END'];
        cnParamsRecord.ID_MAN := {RxMemoryDataPrKViewWithFilter} RxMemoryDataPrK.FieldValues['ID_MAN'];
        AParameter.cnParamsToAddContract := cnParamsRecord;

        res := RunFunctionFromPackage(AParameter, 'Contracts\cn_Contracts.bpl', 'ShowContracts'); // вызов

    //если есть результат - вывожу
        if VarArrayDimCount(Res) > 0
            then begin
            if ((Res[0] <> 0) and (Res[0] <> -1)) then
            begin
                StoredProcContracts.Transaction.StartTransaction;
                StoredProcContracts.StoredProcName := 'PRK_DT_ABIT_DOG_CHANGE';
                StoredProcContracts.Prepare;
                StoredProcContracts.ParamByName('ID_DT_ABIT_DOG').AsInt64 := -1; //DataSetContrakts.FieldValues['ID_DT_ABIT_DOG'];
                StoredProcContracts.ParamByName('ID_DT_ABIT').AsInt64 := {RxMemoryDataPrKViewWithFilter} RxMemoryDataPrK.FieldValues['ID_DT_ABIT'];
                StoredProcContracts.ParamByName('ID_DOG').AsInt64 := Res[0];
                StoredProcContracts.ParamByName('ID_USER').AsInt64 := ID_User_Global;
                try
                    StoredProcContracts.ExecProc;
                    StoredProcContracts.Transaction.Commit;
                    id_dog_obnov := StoredProcContracts.FieldByName('ID_OUT').AsInt64;
                except on e: Exception do
                    begin
                        MessageBox(Handle, Pchar(nMsgErrorTransaction[IndLang] + chr(13) +
                            nMsgTryAgain[IndLang] + nMsgOr[IndLang] + nMsgToAdmin[IndLang] + chr(13) +
                            e.Message), Pchar(nMsgBoxTitle[IndLang]), MB_OK or MB_ICONWARNING);
                        StoredProcContracts.Transaction.Rollback;
                    end;
                end;
                Obnovit({RxMemoryDataPrKViewWithFilter}RxMemoryDataPrK.FieldValues[ID_NAME]);
                ObnovitCn(id_dog_obnov);
            end;
        end;
        AParameter.Free;
    end;
end;

procedure TFormPrK_Results_of_Filtr.ActionChangeCNExecute(Sender: TObject);
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
        AParameter := TcnSimpleParamsAbiturient.Create;
        AParameter.Owner := self;
        AParameter.Db_Handle := DataBasePrK.Handle;
        AParameter.ID_User := ID_User_Global;
        AParameter.User_Name := User_Name_Global;
        AParameter.Formstyle := fsNormal;
        AParameter.WaitPakageOwner := self;
        AParameter.WorkMode := 'extra';
        AParameter.ActionMode := 'edit'; // редактирование

        cnParamsIds.ID_DOG := DataSetContrakts.FieldValues['ID_DOG']; // вх. параметр
        AParameter.cnParamsToPakage := cnParamsIds;
        AParameter.cnParamsToAddContract := cnParamsRecord;
        RunFunctionFromPackage(AParameter, 'Contracts\cn_Contracts.bpl', 'ShowContracts');
        AParameter.Free;
        id_dog_obnov := DataSetContrakts.FieldValues['ID_DT_ABIT_DOG'];
        Obnovit({RxMemoryDataPrKViewWithFilter}RxMemoryDataPrK.FieldValues[ID_NAME]);
        ObnovitCn(id_dog_obnov);
    end;
end;

procedure TFormPrK_Results_of_Filtr.ActionChangeCN_StatusExecute(
    Sender: TObject);
var
    id_dog_obnov: int64;
begin
    if DataSetContrakts.FieldValues['ID_DOG'] <> Null then
    begin
        if prkMessageDlg(nMsgBoxTitle[IndLang], nMsgChangeCN_Status[IndLang],
            mtInformation, mbOKCancel, IndLang) = mrOK then
        begin
            id_dog_obnov := DataSetContrakts.FieldValues['ID_DT_ABIT_DOG'];

            StoredProcContracts.Transaction.StartTransaction;
            StoredProcContracts.StoredProcName := 'PRK_ABIT_DOG_SET_CANDIDATE';
            StoredProcContracts.Prepare;
            StoredProcContracts.ParamByName('ID_DT_ABIT').AsInt64 := {RxMemoryDataPrKViewWithFilter} RxMemoryDataPrK.FieldValues[ID_NAME];
            StoredProcContracts.ParamByName('ID_DOG').AsInt64 := DataSetContrakts.FieldValues['ID_DOG'];
            try
                StoredProcContracts.ExecProc;
                StoredProcContracts.Transaction.Commit;
            except on e: Exception do
                begin
                    MessageBox(Handle, Pchar(nMsgErrorTransaction[IndLang] + chr(13) +
                        nMsgTryAgain[IndLang] + nMsgOr[IndLang] + nMsgToAdmin[IndLang] + chr(13) +
                        e.Message), Pchar(nMsgBoxTitle[IndLang]), MB_OK or MB_ICONWARNING);
                    StoredProcContracts.Transaction.Rollback;
                end;
            end;
        end;

         // Obnovit(StrToInt64(RxMemoryDataPrKViewWithFilter.FieldValues[ID_NAME]));
        ObnovitCn(id_dog_obnov);
    end;
end;

procedure TFormPrK_Results_of_Filtr.ActionDelCNExecute(Sender: TObject);
var
    id_dog_obnov: int64;
begin
    if DataSetContrakts.FieldValues['ID_DOG'] <> Null then
    begin
        if prkMessageDlg(nMsgBoxTitle[IndLang], nMsgDelContract[IndLang],
            mtInformation, mbOKCancel, IndLang) = mrOK then
        begin
            StoredProcContracts.Transaction.StartTransaction;
            StoredProcContracts.StoredProcName := 'CN_DELETE_CONTRACT_BY_ID_DOG';
            StoredProcContracts.Prepare;
            StoredProcContracts.ParamByName('ID_DOG').AsInt64 := DataSetContrakts.FieldValues['ID_DOG'];
            StoredProcContracts.ExecProc;


            StoredProcContracts.StoredProcName := 'PRK_DT_ABIT_DOG_DEL';
            StoredProcContracts.Prepare;
            StoredProcContracts.ParamByName('ID_USER').AsInt64 := ID_User_Global;
            StoredProcContracts.ParamByName('ID_DT_ABIT_DOG').AsInt64 := DataSetContrakts.FieldValues['ID_DT_ABIT_DOG'];
            StoredProcContracts.ExecProc;
            try
                StoredProcContracts.Transaction.Commit;
                cxGridPrKContractsDBTableView1.NavigatorButtons.Prior.Click;
                id_dog_obnov := DataSetContrakts.FieldValues['ID_DT_ABIT_DOG'];
            except on e: Exception do
                begin
                    MessageBox(Handle, Pchar(nMsgErrorTransaction[IndLang] + chr(13) +
                        nMsgTryAgain[IndLang] + nMsgOr[IndLang] + nMsgToAdmin[IndLang] + chr(13) +
                        e.Message), Pchar(nMsgBoxTitle[IndLang]), MB_OK or MB_ICONWARNING);
                    StoredProcContracts.Transaction.Rollback;
                end;
            end;
        end;

        Obnovit(StrToInt64({RxMemoryDataPrKViewWithFilter}RxMemoryDataPrK.FieldValues[ID_NAME]));
        ObnovitCn(id_dog_obnov);
    end;
end;

procedure TFormPrK_Results_of_Filtr.ActionPrintCNExecute(Sender: TObject);
var
    AParam: TcnSimpleParamsEx;
begin
    if DataSetContrakts.FieldValues['ID_DOG'] = Null
        then exit;
    AParam := TcnSimpleParamsEx.Create;
    AParam.Owner := self;
    AParam.Db_Handle := DataBasePrK.Handle;
    AParam.cnParamsToPakage.ID_DOG := DataSetContrakts.FieldValues['ID_DOG'];
    AParam.WaitPakageOwner := self;
    RunFunctionFromPackage(AParam, 'Contracts\cn_PrintDogovor.bpl', 'PrintDogovor');
    AParam.Free;
end;

procedure TFormPrK_Results_of_Filtr.DataSetContraktsAfterOpen(
    DataSet: TDataSet);
begin
    if RxMemoryDataPrK.IsEmpty then Exit;
    if RxMemoryDataPrK['IS_DOG_LOCKED'] = 0 then
    begin
        ActionAddCN.Enabled := True;
        ActionChangeCN.Enabled := True;
        ActionChangeCN_Status.Enabled := True;
        ActionDelCN.Enabled := True;
    end
    else
    begin
        ActionAddCN.Enabled := False;
        ActionChangeCN.Enabled := False;
        ActionChangeCN_Status.Enabled := False;
        ActionDelCN.Enabled := False;
    end;
end;

procedure TFormPrK_Results_of_Filtr.RxMemoryDataPrKAfterScroll(
    DataSet: TDataSet);
begin
    if CanAfterScroll = true then
    begin
        DataSetContrakts.Active := false;
        if RxMemoryDataPrK.fieldValues['ID_DT_ABIT'] <> Null then
            DataSetContrakts.ParamByName('ID_DT_ABIT').AsInt64 := RxMemoryDataPrK.fieldValues['ID_DT_ABIT']
        else
            DataSetContrakts.ParamByName('ID_DT_ABIT').AsInt64 := -1;
       DataSetContrakts.CloseOpen(false);
     // Проверяем, можно ли работать с договорами
    end;
end;

procedure TFormPrK_Results_of_Filtr.colIs_LockedCustomDrawCell(
    Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
    AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
    if (AviewInfo.GridRecord.Values[cxGridPrKDBTableView1.IndexOfItem(
            cxGridPrKDBTableView1.FindItemByName('colIs_Locked'))]) = 1 then
    begin
        ACanvas.FillRect(AViewInfo.Bounds);
        ACanvas.DrawImage(ImageListPrK, AViewInfo.Bounds.Left + Trunc((AViewInfo.Bounds.Right - AViewInfo.Bounds.Left) / 3),
            AviewInfo.Bounds.Top, 0);
        ADone := True;
    end
    else begin
        ACanvas.FillRect(AViewInfo.Bounds);
        ADone := True;
    end;

end;

function TFormPrK_Results_of_Filtr.Deleting(Path: string): Boolean;
var
    cMessage: string;
    Mask: string;
    SearchRec: TSearchRec;
    FindResult: Integer;
    List: TStringList;
    i: Integer;
begin
    cMessage := 'ВНИМАНИЕ!!! Из папки "' + Path + '" будут удалены все все jpg файлы и Export.txt! Продолжить?';
    if MessageDlg(cMessage, mtConfirmation, mbYesNoCancel, 0) = mrYes then
    begin
        Mask := '*.jpg';
        Path := ExtractFilePath(Path);
        if Path = '' then
            Path := IncludeTrailingBackslash(GetCurrentDir);
        List := TStringList.Create;
        try
            FindResult := FindFirst(Path + '*.*', faAnyFile, SearchRec);
            try
                while FindResult = 0 do
                    with SearchRec do
                    begin
                        if ((Attr and faDirectory) = 0) and MatchesMask(Name, Mask) then
                            List.Add(Name);
                        FindResult := FindNext(SearchRec);
                    end;
                for i := 0 to List.Count - 1 do
                    DeleteFile(Path + List[i]);
            finally
                FindClose(SearchRec);
            end;
        finally
            List.Free;
        end;
        Result := True;
       end
    else Result := False;
end;

end.

