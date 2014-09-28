unit uFactShtatBonusForm;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uFControl, uLabeledFControl, uDateControl, StdCtrls, Buttons,
    IBase, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, frxClass,
    frxDBSet, frxExportRTF, frxExportPDF, frxExportHTML, frxExportXLS,
    uSpravControl, RxMemDS, cxStyles, cxCustomData, cxGraphics, cxFilter,
    cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxControls,
    cxGridCustomView, cxGridCustomTableView, cxGridTableView,
    cxGridDBTableView, cxGrid, cxClasses, pFIBStoredProc, ExtCtrls,
    frxExportXML, qFTools, uSelectForm;

type
    TfmFactShtatBonus = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        CurDate: TqFDateControl;
        DB: TpFIBDatabase;
        DefaultTransaction: TpFIBTransaction;
        ReadTransaction: TpFIBTransaction;
        FactShtatDS: TpFIBDataSet;
        frxFactShtatBonus: TfrxDBDataset;
        frxXLSExport1: TfrxXLSExport;
        frxHTMLExport1: TfrxHTMLExport;
        PDFExp: TfrxPDFExport;
        frxRTFExport1: TfrxRTFExport;
        Department: TqFSpravControl;
        RaiseDS: TRxMemoryData;
        RaiseDSId_Raise: TIntegerField;
        RaiseDSName_Raise: TStringField;
        RaiseSource: TDataSource;
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
        RaiseGrid: TcxGrid;
        RaiseView: TcxGridDBTableView;
        cxGridLevel1: TcxGridLevel;
        Label1: TLabel;
        RaiseViewId_Raise: TcxGridDBColumn;
        RaiseViewName_Raise: TcxGridDBColumn;
        Panel1: TPanel;
        AddSmetButton: TSpeedButton;
        DeleteSmetButton: TSpeedButton;
        RaiseSelect: TpFIBDataSet;
        Label2: TLabel;
        SmetaGrid: TcxGrid;
        SmetaView: TcxGridDBTableView;
        cxGridLevel2: TcxGridLevel;
        SmetDS: TRxMemoryData;
        SmetaSource: TDataSource;
        SmetDSId_Smeta: TIntegerField;
        SmetDSSmeta_Kod: TIntegerField;
        SmetDSSmeta_Name: TStringField;
        SmetaViewId_Smeta: TcxGridDBColumn;
        SmetaViewSmeta_Kod: TcxGridDBColumn;
        SmetaViewSmeta_Name: TcxGridDBColumn;
        Panel2: TPanel;
        AddBonusButton: TSpeedButton;
        DeleteBonusButton: TSpeedButton;
        SmetaSelect: TpFIBDataSet;
        IniAsupConstsDs: TpFIBDataSet;
        frxDBDataset1: TfrxDBDataset;
        XMLExp: TfrxXMLExport;
        qfLevel: TqFSpravControl;
        DSLevel: TpFIBDataSet;
        DSLevelID_LEVEL: TFIBBCDField;
        DSLevelLEVEL_ORDER: TFIBIntegerField;
        DSLevelLEVEL_NAME: TFIBStringField;
        WithDekret: TCheckBox;
        chBox_ShowPPS: TCheckBox;
    Report: TfrxReport;
        procedure CancelButtonClick(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure qfLevelOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure FormCreate(Sender: TObject);
        procedure AddBonusButtonClick(Sender: TObject);
        procedure DeleteBonusButtonClick(Sender: TObject);
        procedure DeleteSmetButtonClick(Sender: TObject);
        procedure AddSmetButtonClick(Sender: TObject);
        procedure DepartmentOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
    private
        FAddRaise: Boolean; //флаг фильтрации по надбавкам
        FAddSmet: Boolean; //флаг фильтрации по сметам
        KeySession: Int64;
        procedure AddRaiseById(Id_Raise: Integer);
        procedure AddSmetById(Id_Smeta: Integer);
    public
        constructor Create(AOwner: TComponent; Handle: Integer); reintroduce;
    end;

var
    fmFactShtatBonus: TfmFactShtatBonus;

implementation

{$R *.dfm}

uses NagScreenUnit, uCommonSp, GlobalSPR;

const
    SQLConst = 'Select * from INI_ASUP_CONSTS';

procedure TfmFactShtatBonus.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

constructor TfmFactShtatBonus.Create(AOwner: TComponent; Handle: Integer);
begin
    inherited Create(AOwner);
    DB.Handle := TISC_DB_HANDLE(Handle);
    ReadTransaction.Active := True;
    CurDate.Value := Date;
    IniAsupConstsDs.Close;
    IniAsupConstsDs.SQLs.SelectSQL.Text := SQLConst;
    IniAsupConstsDs.Open;
end;

procedure TfmFactShtatBonus.OkButtonClick(Sender: TObject);
var
    NagScreen: TNagScreen;
    raise_str, smeta_str: string;
    StoredProc: TpFIBStoredProc;
    SessionDataSet: TpFIBStoredProc;
begin
    NagScreen := TNagScreen.Create(Application.MainForm);
    NagScreen.Show;
    NagScreen.SetStatusText('Отримуються дані для звіту...');

    SessionDataSet := TpFIBStoredProc.Create(self);
    SessionDataSet.Database := DB;
    SessionDataSet.Transaction := ReadTransaction;
    SessionDataSet.Close;
    SessionDataSet.StoredProcName := 'PUB_GET_ID_BY_GEN';
    SessionDataSet.ParamByName('GENERATOR_NAME').AsString := 'GEN_FACT_SHTAT_BONUS';
    SessionDataSet.ParamByName('STEP').AsInteger := 1;
    SessionDataSet.ExecProc;
    KeySession := SessionDataSet.FieldByName('RET_VALUE').AsInt64;
    SessionDataSet.Close;
    SessionDataSet.Free;

    StoredProc := TpFibStoredProc.Create(self);
    StoredProc.Database := DB;
    StoredProc.Transaction := DefaultTransaction;
    StoredProc.Close;
  //  raise_str := '';
    if FAddRaise = True then
    begin
        RaiseDS.First;
        while not RaiseDS.Eof do
        begin
            StoredProc.Transaction.StartTransaction;
            StoredProc.StoredProcName := 'FACT_SHTAT_BONUS_PARAM_I';

            Storedproc.Prepare;
            StoredProc.ParamByName('Id_Session').AsInteger := KeySession;
            StoredProc.ParamByName('Id_Param').AsInteger := RaiseDS['Id_Raise'];
            StoredProc.ParamByName('Is_Bonus').AsInt64 := 1;

            StoredProc.ExecProc;
            StoredProc.Close;
            StoredProc.Transaction.Commit;

            RaiseDS.Next;
        end;
    end;

    smeta_str := '';
    if FAddSmet = True then
    begin
        SmetDS.First;
        while not SmetDS.Eof do
        begin
            StoredProc.Transaction.StartTransaction;

            StoredProc.StoredProcName := 'FACT_SHTAT_BONUS_PARAM_I';

            Storedproc.Prepare;
            StoredProc.ParamByName('Id_Session').AsInteger := KeySession;
            StoredProc.ParamByName('Id_Param').AsInteger := SmetDS['Id_Smeta'];
            StoredProc.ParamByName('Is_Bonus').AsInt64 := 0;

            StoredProc.ExecProc;
            StoredProc.Close;
            StoredProc.Transaction.Commit;

            SmetDS.Next;
        end;
    end;

    StoredProc.Free;

    FactShtatDS.Close;
    FactShtatDS.ParamByName('Id_Department').AsVariant := Department.Value;
    FactShtatDS.ParamByName('Id_Level').AsInteger := qfLevel.Value;
    FactShtatDS.ParamByName('Cur_Date').AsDate := CurDate.Value;
    FactShtatDS.ParamByName('Raise_Str').AsString := raise_str;
    FactShtatDS.ParamByName('Smeta_Str').AsString := smeta_str;
    FactShtatDS.ParamByName('Id_Session').AsInteger := KeySession;
    if WithDekret.Checked then
        FactShtatDS.ParamByName('With_Dekret').AsInteger := 1
    else FactShtatDS.ParamByName('With_Dekret').AsInteger := 0;

    FactShtatDS.Open;

    NagScreen.Free;
    if chBox_ShowPPS.Checked
        then Report.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\UP\UpFactShtatBonus.fr3', true)
    else
        Report.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\UP\FactShtatBonus.fr3', true);
//    Report.DesignReport;
    Report.Variables['Cur_Date'] := QuotedStr(DateToStr(CurDate.Value));
    Report.ShowReport;
end;

procedure TfmFactShtatBonus.qfLevelOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    sp: TSprav;
begin
    if qSelect(DSLevel) then
    begin
        Value := DSLevel['Id_Level'];
        DisplayText := IntToStr(DSLevel['Level_Order']) + '. ' +
            DSLevel['Level_Name'];
    end;
end;

procedure TfmFactShtatBonus.AddRaiseById(Id_Raise: Integer);
begin
    RaiseSelect.Close;
    RaiseSelect.ParamByName('Id_Raise').AsInteger := Id_Raise;
    RaiseSelect.ParamByName('Cur_Date').AsDate := CurDate.Value;
    RaiseSelect.Open;
    if not RaiseSelect.IsEmpty then
    begin
        if not RaiseDS.Active then RaiseDS.Open;
        RaiseDS.Append;
        RaiseDS.Edit;
        RaiseDS['Id_Raise'] := RaiseSelect['Id_Raise'];
        RaiseDS['Name_Raise'] := RaiseSelect['Name'];
        FAddRaise := True;
    end;

end;

procedure TfmFactShtatBonus.FormCreate(Sender: TObject);
begin
    FAddRaise := False;
    FAddSmet := False;
end;

procedure TfmFactShtatBonus.AddBonusButtonClick(Sender: TObject);
var
    sp: TSprav;
begin
        // создать справочник
    sp := GetSprav('ASUP\SpRaise');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(DB.Handle);
                // модальный показ
            FieldValues['ShowStyle'] := 0;
                // единичная выборка
            FieldValues['Select'] := 1;

            FieldValues['Raise_Select_Kind'] := 1;
            FieldValues['Actual_Date'] := CurDate.Value;
            Post;
        end;

        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
            if not RaiseDS.Active then RaiseDS.Open;
            RaiseDS.Append;
            RaiseDS.Edit;
            RaiseDS['Id_Raise'] := sp.Output['Id_Raise'];
            RaiseDS['Name_Raise'] := sp.Output['Name'];
            FAddRaise := True;
        end;
        sp.Free;
    end;

end;

procedure TfmFactShtatBonus.DeleteBonusButtonClick(Sender: TObject);
begin
    if not RaiseDS.IsEmpty then RaiseDS.Delete;
end;

procedure TfmFactShtatBonus.DeleteSmetButtonClick(Sender: TObject);
begin
    if not SmetDS.IsEmpty then SmetDS.Delete;
end;

procedure TfmFactShtatBonus.AddSmetButtonClick(Sender: TObject);
var
    id: variant;
begin
    id := GlobalSPR.GetSmets(Owner, DB.Handle, Date, psmSmet);

    if (VarArrayDimCount(id) > 0) and (id[0] <> Null) then
    begin
        if not SmetDS.Active then SmetDS.Open;

        SmetDS.Append;
        SmetDS.Edit;
        SmetDS['Id_Smeta'] := id[0];
        SmetDS['Smeta_Kod'] := id[3];
        SmetDS['Smeta_Name'] := id[2];
        SmetDS.Post;
        FAddSmet := True;
    end;
end;

procedure TfmFactShtatBonus.AddSmetById(Id_Smeta: Integer);
begin
    SmetaSelect.Close;
    SmetaSelect.ParamByName('Id_Smeta').AsInteger := Id_Smeta;
    SmetaSelect.Open;

    if not SmetaSelect.IsEmpty then
    begin
        if not SmetDS.Active then SmetDS.Open;
        SmetDS.Append;
        SmetDS.Edit;
        SmetDS['Id_Smeta'] := SmetaSelect['Id_Smeta'];
        SmetDS['Smeta_Kod'] := SmetaSelect['Smeta_Kod'];
        SmetDS['Smeta_Name'] := SmetaSelect['Smeta_Title'];
        FAddSmet := True;
    end;
end;

procedure TfmFactShtatBonus.DepartmentOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    sp: TSprav;
begin
        // создать справочник
    sp := GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(DB.Handle);
            FieldValues['Actual_Date'] := CurDate.Value;
            Post;
        end;

                // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['Id_Department'];
            DisplayText := sp.Output['Name_Full'];
        end;
        sp.Free;
    end;
end;

end.

