unit uOrdersCanc;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, Buttons, ExtCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter,
    cxData, cxDataStorage, cxEdit, DB, cxDBData, ComCtrls, StdCtrls,
    FIBDataSet, pFIBDataSet, ActnList, cxGridTableView, cxGridLevel,
    cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
    cxGridCustomView, cxGrid, uSearchFrame, PersonalCommon, uActionControl,
    uCommonSP, GoodfunctionsUnit;

type
    TfmOrdersCanc = class(TForm)
        Panel3: TPanel;
        CloseButton: TSpeedButton;
        OrderGrid: TcxGrid;
        OrderGridDBTableView1: TcxGridDBTableView;
        OrderGridDBTableView1DBColumn1: TcxGridDBColumn;
        OrderGridDBTableView1DBColumn6: TcxGridDBColumn;
        OrderGridDBTableView1DBColumn5: TcxGridDBColumn;
        OrderGridLevel1: TcxGridLevel;
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
        ActionList: TActionList;
        ModifyOrder: TAction;
        CloseForm: TAction;
        RefreshFilterAction: TAction;
        InputQuery: TpFIBDataSet;
        InputQueryID_ORDER: TFIBIntegerField;
        InputQueryNUM_ORDER: TFIBStringField;
        InputQueryDATE_ORDER: TFIBDateField;
        InputQueryNOTE: TFIBStringField;
        InputQueryID_STATUS: TFIBIntegerField;
        InputQueryEXEC_DATETIME: TFIBDateTimeField;
        InputQueryPRINT_NAME: TFIBStringField;
        InputQueryINTRO: TFIBStringField;
        InputQueryISPOLNITEL: TFIBStringField;
        InputQueryOWNER_ID_USER: TFIBIntegerField;
        InputQueryNUM_ORDER_INTERNAL: TFIBStringField;
        InputQueryNAME_STATUS: TFIBStringField;
        Source: TDataSource;
        FilterBox: TGroupBox;
        AcceptFilterButton: TSpeedButton;
        FilterDateEnd: TCheckBox;
        DateEnd: TDateTimePicker;
        DateBeg: TDateTimePicker;
        FilterDateBeg: TCheckBox;
        ModifyItemButton: TSpeedButton;
        OrderGridDBTableView1DBColumn2: TcxGridDBColumn;
        OrderGridDBTableView1DBColumn3: TcxGridDBColumn;
        fmSearch: TfmSearch;
        OrderGridDBTableView1DBColumn4: TcxGridDBColumn;
        OrderGridDBTableView1DBColumn7: TcxGridDBColumn;
        WorkQuery: TpFIBDataSet;
        InputQueryNUM_ORDER_KADR: TFIBStringField;
        InputQueryDATE_ORDER_KADR: TFIBDateField;
        OrderGridDBTableView1DBColumn8: TcxGridDBColumn;
        ActionControl: TqFActionControl;
        SpeedButton2: TSpeedButton;
        PrintOrder: TAction;
        SpeedButton1: TSpeedButton;
        PrintReestr: TAction;
        InputQueryOWNER_FIO: TFIBStringField;
        OrderGridDBTableView1DBColumn9: TcxGridDBColumn;
        procedure CloseFormExecute(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure FormCreate(Sender: TObject);
        procedure FilterAccept;
        procedure RefreshFilterActionExecute(Sender: TObject);
        procedure FormResize(Sender: TObject);
        procedure PrintOrderExecute(Sender: TObject);
        procedure PrintReestrExecute(Sender: TObject);
        procedure AcceptFilterButtonClick(Sender: TObject);
        procedure OrderGridDBTableView1CustomDrawCell(
            Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
            AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    fmOrdersCanc: TfmOrdersCanc;

implementation

uses NagScreenUnit;

{$R *.dfm}

procedure TfmOrdersCanc.CloseFormExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmOrdersCanc.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then
        Action := caFree;
end;

procedure TfmOrdersCanc.FormCreate(Sender: TObject);
begin
    InputQuery.Transaction := PersonalCommon.FIBReadTransaction;
    WorkQuery.Transaction := PersonalCommon.FIBWriteTransaction;
    fmSearch.Prepare(InputQuery);

    DateBeg.Date := Date - 2;
    DateEnd.Date := Date;

    FilterAccept;
end;

procedure TfmOrdersCanc.FilterAccept;
begin
    InputQuery.Close;

    InputQuery.ParamByName('ID_PCARD').AsVariant := null;

    if FilterDateBeg.Checked
        then
        InputQuery.ParamByName('FILTER_DATE_BEG').AsDate := DateBeg.Date
    else
        InputQuery.ParamByName('FILTER_DATE_BEG').AsVariant := null;

    if FilterDateEnd.Checked
        then
        InputQuery.ParamByName('FILTER_DATE_END').AsDate := DateEnd.Date
    else
        InputQuery.ParamByName('FILTER_DATE_END').AsVariant := null;

    NagScreen := TNagScreen.Create(Self);
    NagScreen.Show;
    NagScreen.SetStatusText('відбір даних...');

    InputQuery.Open;

    NagScreen.Free;
end;

procedure TfmOrdersCanc.RefreshFilterActionExecute(Sender: TObject);
begin
    FilterAccept;
end;

procedure TfmOrdersCanc.FormResize(Sender: TObject);
begin
    CloseButton.Left := Width - CloseButton.Width - 10;
end;

procedure TfmOrdersCanc.PrintOrderExecute(Sender: TObject);
var
    sp: TSprav;
    Params: string;

    // Exe
    Rlst: LongBool;
    StartUpInfo: TStartUpInfo;
    ProcessInfo: TProcessInformation;
    ExitCode: Cardinal;
begin
    if InputQuery.IsEmpty then begin
        ErrMsg('Немає наказів!');
        exit;
    end;

    { Неправильаня печать (через EXE) }

    Params := IntToStr(InputQueryID_ORDER.Value) + ' ' +
        'F' + ' ';

    if PersonalCommon.sDesignReport then
        Params := Params + 'T'
    else
        Params := Params + 'F';

    FillChar(StartUpInfo, SizeOf(TStartUpInfo), 0);

    with StartUpInfo do
    begin
        cb := SizeOf(TStartUpInfo);
        dwFlags := STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;
        wShowWindow := SW_SHOWNORMAL;
    end;

    Rlst := CreateProcess(PAnsiChar(ExtractFilePath(Application.ExeName) + 'PrintOrderEx.exe'),
        PAnsiChar(Params),
        nil,
        nil,
        false,
        NORMAL_PRIORITY_CLASS,
        nil,
        nil,
        StartUpInfo,
        ProcessInfo);

    if Rlst then
        with ProcessInfo do begin
            WaitForInputIdle(hProcess, INFINITE); // ждем завершения инициализации
            WaitforSingleObject(ProcessInfo.hProcess, INFINITE); // ждем завершения процесса
            GetExitCodeProcess(ProcessInfo.hProcess, ExitCode); // получаем код завершения
            CloseHandle(hThread); // закрываем дескриптор процесса
            CloseHandle(hProcess); //
        end;
end;

procedure TfmOrdersCanc.PrintReestrExecute(Sender: TObject);
var
    sp: TSprav;
begin
        // создать справочник
    sp := GetSprav('Asup\AsupReportZarPric');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(PersonalCommon.FIBDatabase.Handle);
            FieldValues['DesignReport'] := PersonalCOmmon.sDesignReport;
            Post;
        end;

                // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        sp.Free;
    end;
end;

procedure TfmOrdersCanc.AcceptFilterButtonClick(Sender: TObject);
begin
    FilterAccept;
end;

procedure TfmOrdersCanc.OrderGridDBTableView1CustomDrawCell(
    Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
    AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
    if AViewInfo.Selected then
    begin
        ACanvas.Brush.Color := clBlue;
        ACanvas.Font.Color := clWhite
    end
    else
        if AViewInfo.GridRecord.Values[OrderGridDBTableView1DBColumn8.Index] = 'нема'
            then
            ACanvas.Brush.Color := RGB(250, 163, 177)
        else
            ACanvas.Brush.Color := clWhite;
end;

end.
