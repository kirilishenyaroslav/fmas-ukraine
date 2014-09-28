unit csAcademicYears;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, dxBar, dxBarExtItems, AArray,
    cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
    cxClasses, cxControls, cxGridCustomView, cxGrid, ImgList, AppEvnts, AppStruClasses,
    iBase, csAcademicYearsDM, uCS_Resources, ib_externals, RxMemDS, FIBDataset,
    pFIBDataset, uCS_Constants;

type
    TcsFormAcademicYears = class(TForm)
        dxBarManager1: TdxBarManager;
        cxGrid1DBTableView1: TcxGridDBTableView;
        cxGrid1Level1: TcxGridLevel;
        cxGrid1: TcxGrid;
        col_IdAcademyYear: TcxGridDBColumn;
        col_NameAcademyYear: TcxGridDBColumn;
        col_IsActive: TcxGridDBColumn;
        btnSync: TdxBarLargeButton;
        btnSelect: TdxBarLargeButton;
        btnExit: TdxBarLargeButton;
        LargeImages: TImageList;
        DisabledLargeImages: TImageList;
        PopupImageList: TImageList;
        Styles: TcxStyleRepository;
        BackGround: TcxStyle;
        FocusedRecord: TcxStyle;
        Header: TcxStyle;
        DesabledRecord: TcxStyle;
        cxStyle15: TcxStyle;
        cxStyle16: TcxStyle;
        cxStyle17: TcxStyle;
        cxStyle18: TcxStyle;
        cxStyle19: TcxStyle;
        cxStyle20: TcxStyle;
        cxStyle21: TcxStyle;
        cxStyle22: TcxStyle;
        cxStyle23: TcxStyle;
        cxStyle24: TcxStyle;
        cxStyle25: TcxStyle;
        cxStyle26: TcxStyle;
        cxStyle27: TcxStyle;
        cxStyle28: TcxStyle;
        cxStyle29: TcxStyle;
        cxStyle30: TcxStyle;
        Default_StyleSheet: TcxGridTableViewStyleSheet;
        DevExpress_Style: TcxGridTableViewStyleSheet;
        dxBarGroup1: TdxBarGroup;
        procedure btnSyncClick(Sender: TObject);
    private
    { Private declarations }
        IdMode: Integer;
        EDBOGuidesIntf: TFMASAppModule;
        EDBOPersonIntf: TFMASAppModule;
        ResultArray: TAArray;
        CanConnectToEdbo: Boolean;
        procedure InitCaptions;
  //      procedure InitStyles;
        procedure InitMode(IdMode: Integer); //настройка формы в соответствии с режимом
        procedure GetAcademicYearsFromEDBO;
        function MyCsConnectToEdbo: Boolean;
    public
    { Public declarations }
        IndLangVWF: Integer;
        ID_User_Global: Int64;
        User_Name_Global: string;
        constructor Create(AOwner: TComponent; aParam: TAArray); reintroduce;
    end;

procedure ShowAllPrkBpl(aOwner: TComponent; aParam: TAArray); stdcall;
exports ShowAllPrkBpl;

var
    csFormAcademicYears: TcsFormAcademicYears;
    DM: TDM;

implementation

{$R *.dfm}

procedure ShowAllPrkBpl(aOwner: TComponent; aParam: TAArray);
var
    T: TcsFormAcademicYears;
begin
    T := TcsFormAcademicYears.Create(aOwner, aParam);
    T.FormStyle := aParam['Input']['aFrmStyle'].AsVariant;
    case T.FormStyle of
        fsNormal: begin
                T.ShowModal;
            end;
        fsMDIChild: begin
            end;
    else
        T.Free;
    end;
end;

function TcsFormAcademicYears.MyCsConnectToEdbo: Boolean;
var
    path_str: string;
begin
    try
        Result := True;
        with TFMASAppModuleCreator.Create do
        begin
            path_str := ExtractFilePath(Application.ExeName) + 'Contingent_Student\';

       //Ёкземпл€р дл€ работы с веб-сервисом EDBOGuides
            EDBOGuidesIntf := CreateFMASModule(path_str, 'EDBOIntf');
            if (EDBOGuidesIntf = nil)
                then begin
                csMessageDlg(nMsgBoxTitle[IndLangVWF], nMsgErrorWithEDBO[IndLangVWF], mtInformation, [mbOk], 0);
                Result := False;
            end;
       //Ёкземпл€р дл€ работы с веб-сервисом EDBOPerson
            EDBOPersonIntf := CreateFMASModule(path_str, 'EDBOIntf');
            if (EDBOPersonIntf = nil)
                then begin
                csMessageDlg(nMsgBoxTitle[IndLangVWF], nMsgErrorWithEDBO[IndLangVWF], mtInformation, [mbOk], 0);
                Result := False;
            end;
        end;

    except on E: Exception do
        begin
            ShowMessage(E.Message);
            Result := False;
        end;
    end;
end;

constructor TcsFormAcademicYears.Create(AOwner: TComponent; aParam: TAArray);
var
    DBHandle: TISC_DB_HANDLE;
begin
    if Assigned(PVoid(aParam['Input']['aDBHANDLE'])) then
    begin
        DBHandle := PVoid(aParam['Input']['aDBHANDLE'].asInteger);
        ID_User_Global := aParam['Input']['ID_USER_GLOBAL'].AsInt64;
        ResultArray := aParam;
        IndLangVWF := 0;
        if Assigned(aParam['Input']['ID_MODE']) then
            IdMode := aParam['Input']['ID_MODE'].AsInteger
        else IdMode := 0;
        inherited Create(aOwner);

        InitCaptions;

        WindowState := wsMaximized;

        DM := TDM.Create(self, DBHandle);
        //инициализаци€ режима должна происходить после создани€ DM формы,
        //т.к. при инициализации режима мы мен€ем селект датасета на ƒћ форме
        InitMode(IdMode);
    end
    else ShowMessage('ќшибка HANDLE`a Ѕазы');
end;

procedure TcsFormAcademicYears.InitCaptions;
begin
    csFormAcademicYears.Caption := nFormAcademicYears[IndLangVWF];
    btnSync.Caption := nAction_GetDataFromEDBO[IndLangVWF];
    btnSelect.Caption := nAction_Vibrat[IndLangVWF];
    btnExit.Caption := nAction_Exit[IndLangVWF];
    col_IdAcademyYear.Caption := nColKod[IndLangVWF] + nCol_AcademicYears[IndLangVWF];
    col_NameAcademyYear.Caption := nColName[IndLangVWF] + nCol_AcademicYears[IndLangVWF];
    col_IsActive.Caption := nCol_IsActive[IndLangVWF];
end;

procedure TcsFormAcademicYears.InitMode(IdMode: Integer); //настройка формы в соответствии с режимом
begin
    case IdMode of
        1: begin
                btnSelect.Visible := ivAlways;
            end
    else begin
            btnSelect.Visible := ivNever;
        end;
    end;
end;

procedure TcsFormAcademicYears.btnSyncClick(Sender: TObject);
begin
    if (csMessageDlg(nMsgBoxTitle[IndLangVWF], nMsgImportAcademyYears[IndLangVWF], mtInformation, [mbOK, mbCancel], 0) = mrOk)
        then begin
        if MyCsConnectToEdbo then
        begin
         //   ApplyFilter

            if DM.RxMemDataYearsEDBO.Active then
            begin
                DM.RxMemDataYearsEDBO.Close;
                DM.RxMemDataYearsEDBO.EmptyTable;
                DM.RxMemDataYearsEDBO.Open;
            end
            else
                DM.RxMemDataYearsEDBO.EmptyTable;
            if (EDBOGuidesIntf as IEDBOTools).InitEDBOConnection('EDBOGuides', DM.DB.Handle) then
            begin
                GetAcademicYearsFromEDBO;

                DM.DSetYears.Close;
                DM.DSetYears.Open;
            end
            else csMessageDlg(nMsgBoxTitle[IndLangVWF], nMsgErrorConnectEDBO[IndLangVWF], mtWarning, [mbOk], 0);
        end
        else
        begin
            csMessageDlg(nMsgBoxTitle[IndLangVWF], nMsgErrorConnectEDBO[IndLangVWF], mtError, [mbOK], 0);
            exit;
        end;
    end;
end;

procedure TcsFormAcademicYears.GetAcademicYearsFromEDBO;
var
    ActualDate: TDateTime;
    Id_AcademicYear: Integer;
    Filter: AnsiString;
    MemoryData_EDBO: TRxMemoryData;
    i: Integer;
    PubSysDataDSet: TpFIBDataset;
begin

    PubSysDataDSet := TpFIBDataset.Create(Self);
    PubSysDataDSet.Database := DM.DB;
    PubSysDataDSet.Transaction := DM.TransRead;

    if PubSysDataDSet.Active then PubSysDataDSet.Close;
    PubSysDataDSet.SQLs.SelectSQL.Text := 'Select Can_Connect_To_Edbo From Pub_Sys_Data';
    PubSysDataDSet.Open;
    if PubSysDataDSet['Can_Connect_To_Edbo'] = null then CanConnectToEdbo := False
    else CanConnectToEdbo := Boolean(PubSysDataDSet['Can_Connect_To_Edbo']);
    if CanConnectToEdbo then
    begin
        MemoryData_Edbo := TRxMemoryData.Create(Self);
        (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('AcademicYearsGet', DM.RxMemDataYearsEDBO);
        {try
            MemoryData_EDBO.Open;
            MemoryData_EDBO.First;
        except on E: Exception do Showmessage(E.Message);
        end;}
     {   DM.RxMemDataYearsEDBO.Close;
        DM.RxMemDataYearsEDBO.EmptyTable;
        //DM.RxMemDataYearsEDBO.CopyStructure(MemoryData_EDBO);
        try
            DM.RxMemDataYearsEDBO.LoadFromDataSet(MemoryData_EDBO, 0, lmAppend);
        except on E: Exception do Showmessage(E.Message);
        end;}
        DM.RxMemDataYearsEDBO.Open;
       { for i := 0 to MemoryData_EDBO.RecordCount - 1 do
        begin
            try
                DM.RxMemDataYearsEDBO.Insert;
                DM.RxMemDataYearsEDBO.FieldByName('fId_PersonEducationHistoryType ').AsInteger := MemoryData_EDBO['FId_PersonEducationHistoryType'];
                DM.RxMemDataYearsEDBO.FieldByName('fPersonEducationHistoryTypeName').AsString := MemoryData_EDBO['FPersonEducationHistoryTypeName'];

                DM.RxMemDataYearsEDBO.Post;
            except on E: Exception do
                begin
                    csMessageDlg('”вага', E.Message, mtInformation, [mbOk], 0);
                    exit;
                end;
            end;
            MemoryData_EDBO.Next;
        end;
        }
        DM.StorProc.Transaction.StartTransaction;
        DM.StorProc.StoredProcName := 'CS_GET_ACADEMIC_YEARS_FROM_EDBO';
        DM.StorProc.Prepare;

        DM.RxMemDataYearsEDBO.First;

        for i := 0 to DM.RxMemDataYearsEDBO.RecordCount - 1 do
        begin
            try
                DM.StorProc.ParamByName('ID_ACADEMIC_YEAR').AsInteger := DM.RxMemDataYearsEDBO.FieldByName('fId_AcademicYear').AsInteger;
                DM.StorProc.ParamByName('NAME_ACADEMIC_YEAR').AsString := DM.RxMemDataYearsEDBO.FieldByName('fAcademicYearName').AsString;
                DM.StorProc.ParamByName('IS_ACTIVE').AsInteger := DM.RxMemDataYearsEDBO.FieldByName('fAcademicYearIsActive').AsInteger;
                DM.StorProc.ExecProc;

                DM.RxMemDataYearsEDBO.Next;
            except on E: Exception do
                begin
                    csMessageDlg(nMsgBoxTitle[IndLangVWF], E.Message, mtInformation, [mbOk], 0);
                    DM.StorProc.Transaction.Rollback;
                    exit;
                end;
            end;
        end;

        try
            if DM.StorProc.Transaction.Active then
                DM.StorProc.Transaction.Commit;
        except on E: Exception do
            begin
                csMessageDlg(nMsgBoxTitle[IndLangVWF], nMsgErrorWithEDBO[IndLangVWF] + CHR(13) + E.Message, mtInformation, [mbOk], 0);
                DM.StorProc.Transaction.Rollback;
                exit;
            end;
        end;

        MemoryData_EDBO.Close;
        MemoryData_EDBO.Free;
        PubSysDataDSet.Free;
        DM.DSetYears.Close;
        DM.DSetYears.Open;
    end;
end;

end.

