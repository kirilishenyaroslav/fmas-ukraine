unit fmPochasFactUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, FIBDatabase, pFIBDatabase, ActnList, ExtCtrls, cxControls,
    cxSplitter, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses,
    cxGridCustomView, cxGridCustomTableView, cxGridTableView,
    cxGridDBTableView, cxGrid, uFControl, uLabeledFControl, uSpravControl,
    uCommonSp, AllPeopleUnit, qFTools, FIBDataSet, pFIBDataSet, StdCtrls,
    DBCtrls, Buttons, uActionControl, uFormControl, cxTextEdit,
    cxCurrencyEdit, dxBar, ImgList, dxBarExtItems, FIBQuery, pFIBQuery,
    pFIBStoredProc;

type
    TfmPochasFact = class(TForm)
        LocalDatabase: TpFIBDatabase;
        LocalReadTransaction: TpFIBTransaction;
        LocalWriteTransaction: TpFIBTransaction;
        KeyList: TActionList;
        OkAction: TAction;
        Cancel: TAction;
        AddPochas: TAction;
        ModifyPochas: TAction;
        DeletePochas: TAction;
        ViewPochas: TAction;
        TopPanel: TPanel;
        LeftPanel: TPanel;
        PeopleSplitter: TcxSplitter;
        RigthPanel: TPanel;
        ItemsGrid: TcxGrid;
        cxGridDBTableView6: TcxGridDBTableView;
        cxGridLevel6: TcxGridLevel;
        cxGrid1: TcxGrid;
        cxGridDBTableView1: TcxGridDBTableView;
        cxGridLevel1: TcxGridLevel;
        Panel1: TPanel;
        Panel2: TPanel;
        Man: TqFSpravControl;
        PlanQuery: TpFIBDataSet;
        PlanDataSource: TDataSource;
        cxGridDBTableView6DBColumn1: TcxGridDBColumn;
        cxGridDBTableView6DBColumn2: TcxGridDBColumn;
        cxGridDBTableView6DBColumn3: TcxGridDBColumn;
        cxGridDBTableView6DBColumn4: TcxGridDBColumn;
        Panel3: TPanel;
        FactQuery: TpFIBDataSet;
        FactDataSource: TDataSource;
        cxGridDBTableView1DBColumn1: TcxGridDBColumn;
        cxGridDBTableView1DBColumn2: TcxGridDBColumn;
        cxGridDBTableView1DBColumn3: TcxGridDBColumn;
        cxGridDBTableView1DBColumn4: TcxGridDBColumn;
        ClonePochas: TAction;
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
        Panel5: TPanel;
        PrintOrderAction: TAction;
        cxGridDBTableView6DBColumn5: TcxGridDBColumn;
        cxGridDBTableView6DBColumn6: TcxGridDBColumn;
        cxGridDBTableView1DBColumn5: TcxGridDBColumn;
        cxGridDBTableView6DBColumn7: TcxGridDBColumn;
        cxGrid2: TcxGrid;
        cxGridDBTableView2: TcxGridDBTableView;
        cxGridDBColumn1: TcxGridDBColumn;
        cxGridDBColumn2: TcxGridDBColumn;
        cxGridDBColumn4: TcxGridDBColumn;
        cxGridLevel2: TcxGridLevel;
        SmDataSets: TpFIBDataSet;
        SmDataSourse: TDataSource;
        cxGrid3: TcxGrid;
        cxGridDBTableView3: TcxGridDBTableView;
        cxGridDBColumn3: TcxGridDBColumn;
        cxGridDBColumn5: TcxGridDBColumn;
        cxGridDBColumn6: TcxGridDBColumn;
        cxGridLevel3: TcxGridLevel;
        cxSplitter2: TcxSplitter;
        FactSmetSource: TDataSource;
        FactSmets: TpFIBDataSet;
        dxBarManager1: TdxBarManager;
        IL_OrdAcc: TImageList;
        AddItemButton: TdxBarLargeButton;
        dxBarDockControl1: TdxBarDockControl;
        ModifyItemButton: TdxBarLargeButton;
        DeleteItemButton: TdxBarLargeButton;
        CloneButton: TdxBarLargeButton;
        StoredProc: TpFIBStoredProc;
        SelSet: TpFIBDataSet;
    cxSplitter1: TcxSplitter;
        procedure CancelExecute(Sender: TObject);
        procedure FioOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure ManOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure PlanQueryAfterScroll(DataSet: TDataSet);
        procedure PlanQueryAfterOpen(DataSet: TDataSet);
        procedure cxGridDBTableView6KeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure cxGridDBTableView1KeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure FactQueryAfterScroll(DataSet: TDataSet);
        procedure FactQueryAfterOpen(DataSet: TDataSet);
        procedure AddItemButtonClick(Sender: TObject);
        procedure DeleteItemButtonClick(Sender: TObject);
        procedure CloneButtonClick(Sender: TObject);
        procedure ModifyItemButtonClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

implementation

uses fmAddFactPochasUnit, UpKernelUnit, cxCalendar, BaseTypes;

{$R *.dfm}

procedure TfmPochasFact.CancelExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmPochasFact.FioOpenSprav(Sender: TObject; var Value: Variant;
    var DisplayText: string);
var
    sp: TSprav;
begin
    // создать справочник
    sp := GetSprav('asup\PCardsList');
    if sp <> nil then
    begin

        // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(LocalDatabase.Handle);
            FieldValues['ActualDate'] := Date;
            FieldValues['SecondDate'] := Date;
            FieldValues['ShowWorking'] := False;
            FieldValues['CanRemoveFilter'] := True;
            FieldValues['AdminMode'] := True;
            Post;
        end;

        // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['ID_PCARD'];
            DisplayText := sp.Output['FIO'];
        end;
        sp.Free;
    end;
end;

procedure TfmPochasFact.ManOpenSprav(Sender: TObject; var Value: Variant;
    var DisplayText: string);
var
    result: Variant;
begin
    try
        if not VarIsNull(Value) then
            result := AllPeopleUnit.GetMan(Self, LocalDatabase.Handle, False, True, Value)
        else
            result := AllPeopleUnit.GetMan(Self, LocalDatabase.Handle, False, True);

        if (not VarIsNull(result)) and not (VarType(result) = varNull) and
            not (VarArrayDimCount(result) = 0) then begin
            Value := result[0];
            DisplayText := result[1];

            PlanQuery.Close;
            PlanQuery.SelectSQL.Text := 'select * from UP_KER_GET_POCH_BY_ID_MAN(:ID_MAN)';
            PlanQuery.ParamByName('ID_MAN').Value := Man.Value;
            PlanQuery.Open;

            SmDataSets.Close;
            SmDataSets.SelectSQL.Text := 'SELECT * FROM UP_KER_GET_POCHAS_DETAIL(:ID_POCHAS_PLAN)';
            SmDataSets.ParamByName('Id_Pochas_Plan').Value := PlanQuery['Id_Pochas_Plan'];
            SmDataSets.Open;

            AddItemButton.Enabled := True;
            ModifyItemButton.Enabled := True;
            DeleteItemButton.Enabled := True;
            CloneButton.Enabled := True;

        end;

    except on e: Exception do begin
            qFErrorDialog('Неможливо завантажити довідник фізичних осіб! Виникла помилка: "' +
                e.Message + '"');
            AddItemButton.Enabled := False;
            ModifyItemButton.Enabled := False;
            DeleteItemButton.Enabled := False;
            CloneButton.Enabled := False;

            exit;
        end;
    end;
end;

procedure TfmPochasFact.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then
        Action := caFree;
end;

procedure TfmPochasFact.PlanQueryAfterScroll(DataSet: TDataSet);
begin
    AddItemButton.Enabled := not PlanQuery.IsEmpty;
    ModifyItemButton.Enabled := not PlanQuery.IsEmpty;
    DeleteItemButton.Enabled := not PlanQuery.IsEmpty;
    CloneButton.Enabled := not PlanQuery.IsEmpty;

    if PlanQuery.IsEmpty then exit;

    FactQuery.Close;
    FactQuery.SelectSQL.Text := 'select * from UP_DT_POCHAS_FACT_SELECT(:Id_Pochas_Plan)';
    FactQuery.ParamByName('Id_Pochas_Plan').Value := PlanQuery['Id_Pochas_Plan'];
    FactQuery.Open;
end;

procedure TfmPochasFact.PlanQueryAfterOpen(DataSet: TDataSet);
begin
    DataSet.Last;
end;

procedure TfmPochasFact.cxGridDBTableView6KeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if PlanQuery.RecordCount > 0
        then
    begin
        if ((Key = VK_F12) and (ssShift in Shift))
            then ShowInfo(PlanQuery);
    end
end;

procedure TfmPochasFact.cxGridDBTableView1KeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if FactQuery.RecordCount > 0
        then
    begin
        if ((Key = VK_F12) and (ssShift in Shift))
            then ShowInfo(FactQuery);
    end
end;

procedure TfmPochasFact.FactQueryAfterScroll(DataSet: TDataSet);
begin
    if FactQuery.IsEmpty then exit;
    FactSmets.Close;
    FactSmets.SelectSQL.Text := 'SELECT * FROM UP_POCHAS_FACT_DETAIL(:ID_POCHAS_FACT)';
    FactSmets.ParamByName('Id_Pochas_Fact').Value := FactQuery['ID_POCHAS_FACT'];
    FactSmets.Open;

end;

procedure TfmPochasFact.FactQueryAfterOpen(DataSet: TDataSet);
begin
    //DataSet.Last;
end;

procedure TfmPochasFact.AddItemButtonClick(Sender: TObject);
var
    frm: TfmAddFactPochas;
    id_item: integer;
    id_pcard,id_item_fact: Variant;
    useFilter: boolean;
    Sel_Pcard: TpFIBDataSet;
    i: integer;
begin
    id_item := PlanQuery.FieldByName('ID_POCHAS_PLAN').AsInteger;
    frm := TfmAddFactPochas.Create(Self);
    frm.Caption := 'Додати ' + frm.Caption;
    if frm.ShowModal = mrOK then
    begin
        StoredProc.Close;
        StoredProc.Transaction.StartTransaction;
        {----}
        StoredProc.StoredProcName := 'UP_DT_POCHAS_FACT_INSERT';
        StoredProc.Prepare;

        StoredProc.ParamByName('PERIOD_BEG').AsDate := frm.DateBegEdit.Date;
        StoredProc.ParamByName('PERIOD_END').AsDate := frm.DateEndEdit.Date;
        StoredProc.ParamByName('NUM_ACT').AsString := frm.NumAct.Text;
        StoredProc.ParamByName('DATE_ACT').AsDate := frm.DateAct.Date;
        StoredProc.ParamByName('ID_POCHAS_PLAN').AsVariant := id_item; //PlanQuery['ID_POCHAS_PLAN'];

        try
            StoredProc.ExecProc;
            id_item_fact := StoredProc['ID_POCHAS_FACT'].Value;
            FactSmets.Close;
            FactSmets.SelectSQL.Text := 'SELECT * FROM UP_POCHAS_FACT_DETAIL(:ID_POCHAS_FACT)';
            FactSmets.ParamByName('ID_POCHAS_FACT').Value := id_item_fact;
            FactSmets.Open;
        except
            on e: exception do
            begin
                showmessage(e.message);
                StoredProc.Transaction.Rollback;
                exit;
            end;
        end;
        StoredProc.Close;
        StoredProc.StoredProcName := 'UP_DT_POCHAS_FACT_SM_INSERT';
        for i := 0 to frm.cxGrid1TableView1.DataController.Recordcount - 1 do
        begin
            StoredProc.Prepare;
            StoredProc.ParamByName('ID_SM').AsInt64 := frm.cxGrid1TableView1.DataController.Values[i, 0];
            StoredProc.ParamByName('HOURS').AsVariant := frm.cxGrid1TableView1.DataController.Values[i, 3];
            try
                StoredProc.ParamByName('ID_POCHAS_FACT').AsInt64 := id_item_fact;
                StoredProc.ExecProc;
            except
                on e: exception do
                begin
                    showmessage(e.message);
                    StoredProc.Transaction.Rollback;
                    exit;
                end;
            end;
        end;
        {----}
        StoredProc.Transaction.Commit;
        StoredProc.Close;
        //SelectAll;
        FactQuery.Close;
        FactQuery.Open;
    end;
    frm.Free;
end;

procedure TfmPochasFact.DeleteItemButtonClick(Sender: TObject);
begin
    if FactQuery.RecordCount = 0 then exit;
    if (agMessageDlg('Увага!', 'Ви хочете видалити запис?', mtConfirmation, [mbYes, mbNo]) = mrYes)
        then
    begin
        LocalWriteTransaction.StartTransaction;
        StoredProc.StoredProcName := 'UP_DT_POCHAS_FACT_DEL';
        StoredProc.Prepare;
        StoredProc.ParamByName('ID_POCHAS_FACT').AsInt64 := FactQuery['ID_POCHAS_FACT'];
        try
            StoredProc.ExecProc;
        except
            LocalWriteTransaction.Rollback;
            exit;
        end;
        LocalWriteTransaction.Commit;
        FactQuery.CacheDelete;
    end;
end;

procedure TfmPochasFact.CloneButtonClick(Sender: TObject);
var i: integer;
    id_pochas_fact: int64;
begin
    if FactQuery.RecordCount = 0 then exit;
    LocalWriteTransaction.StartTransaction;
    StoredProc.StoredProcName := 'UP_DT_POCHAS_FACT_INSERT';
    StoredProc.Prepare;
    StoredProc.ParamByName('PERIOD_BEG').AsDate := FactQuery['PERIOD_BEG'];
    StoredProc.ParamByName('PERIOD_END').AsDate := FactQuery['PERIOD_END'];
    StoredProc.ParamByName('NUM_ACT').AsString := FactQuery['NUM_ACT'];
    StoredProc.ParamByName('DATE_ACT').AsDate := FactQuery['DATE_ACT'];
    StoredProc.ParamByName('ID_POCHAS_PLAN').AsInt64 := PlanQuery['ID_POCHAS_PLAN'];
    try
        StoredProc.ExecProc;
        id_pochas_fact := StoredProc.FldByName['ID_POCHAS_FACT'].AsInt64;
    except on e: Exception do
        begin
            ShowMessage(e.Message);
            LocalWriteTransaction.Rollback;
            exit;
        end;
    end;
  //LocalWriteTransaction.Commit;

 // LocalWriteTransaction.StartTransaction;
    if FactSmets.Recordcount > 0 then
    begin
        FactSmets.First;
        for i := 0 to FactSmets.Recordcount - 1 do
        begin
            StoredProc.StoredProcName := 'UP_DT_POCHAS_FACT_SM_INSERT';
            StoredProc.Prepare;
            StoredProc.ParamByName('ID_SM').AsInt64 := FactSmets['ID_SM'];
            StoredProc.ParamByName('HOURS').AsVariant := FactSmets['HOURS'];
            StoredProc.ParamByName('ID_POCHAS_FACT').AsInt64 := id_pochas_fact;
            try
                StoredProc.ExecProc;
            except on e: Exception do
            begin
             ShowMessage(e.Message);
                StoredProc.Transaction.Rollback;
                break;
            end;
            end;
            FactSmets.Next;
        end;
    end;
    LocalWriteTransaction.Commit;
    FactQuery.Close;
    FactQuery.Open;
end;

procedure TfmPochasFact.ModifyItemButtonClick(Sender: TObject);
var
    frm: TfmAddFactPochas;
    id, id_plan: variant;
    idx: integer;
    i, ii: integer;
begin
    if FactQuery.RecordCount = 0 then exit;
    id := FactQuery['Id_Pochas_Fact'];
    id_plan := PlanQuery['Id_Pochas_Plan'];

    frm := TfmAddFactPochas.Create(Self);
    frm.Caption := 'Змінити ' + frm.Caption;
    frm.DateBegEdit.Date := FactQuery['PERIOD_BEG'];
    frm.DateEndEdit.Date := FactQuery['PERIOD_END'];
    frm.NumAct.Text := FactQuery['NUM_ACT'];
    frm.DateAct.Date := FactQuery['DATE_ACT'];
    SelSet.Close;
    SelSet.SelectSQL.Text := 'SELECT * FROM UP_POCHAS_FACT_DETAIL(:ID_POCHAS_FACT)';
    SelSet.ParamByName('Id_Pochas_Fact').Value := FactQuery['ID_POCHAS_FACT'];
    SelSet.Open;
    SelSet.FetchAll;
    SelSet.First;
    idx := 0;
    while not SelSet.Eof do
    begin
        frm.cxGrid1TableView1.DataController.RecordCount := frm.cxGrid1TableView1.DataController.RecordCount + 1;
        idx := frm.cxGrid1TableView1.DataController.RecordCount - 1;
        frm.cxGrid1TableView1.DataController.Values[idx, 0] := SelSet['ID_SM'];
        frm.cxGrid1TableView1.DataController.Values[idx, 1] := SelSet['KOD_SM'];
        frm.cxGrid1TableView1.DataController.Values[idx, 2] := SelSet['SM_TITLE'];
        frm.cxGrid1TableView1.DataController.Values[idx, 3] := SelSet['HOURS'];
        SelSet.Next;
    end;

    if (frm.ShowModal = mrOK) then
    begin
        StoredProc.Transaction.StartTransaction;
        StoredProc.StoredProcName := 'UP_DT_POCHAS_FACT_UPD';
        StoredProc.Prepare;
        StoredProc.ParamByName('PERIOD_BEG').AsDate := frm.DateBegEdit.Date;
        StoredProc.ParamByName('PERIOD_END').AsDate := frm.DateEndEdit.Date;
        StoredProc.ParamByName('NUM_ACT').AsString := frm.NumAct.Text;
        StoredProc.ParamByName('DATE_ACT').AsDate := frm.DateAct.Date;
        StoredProc.ParamByName('ID_POCHAS_PLAN').AsVariant := id_plan;
        StoredProc.ParamByName('ID_POCHAS_FACT').AsVariant := id;
        try
            StoredProc.ExecProc;
        except
            on e: exception do
            begin
                Showmessage(e.message);
                StoredProc.Transaction.Rollback;
                exit;
            end;
        end;

        StoredProc.StoredProcName := 'UP_DT_POCHAS_FACT_SM_DEL';
        StoredProc.Prepare;
        StoredProc.ParamByName('ID_POCHAS_FACT').AsInt64 := id;
        try
            StoredProc.ExecProc;
        except
            StoredProc.Transaction.Rollback;
        end;

        for i := 0 to frm.cxGrid1TableView1.DataController.Recordcount - 1 do
        begin
            StoredProc.StoredProcName := 'UP_DT_POCHAS_FACT_SM_INSERT';
            StoredProc.Prepare;
            StoredProc.ParamByName('ID_SM').AsInt64 := frm.cxGrid1TableView1.DataController.Values[i, 0];
            StoredProc.ParamByName('HOURS').AsVariant := frm.cxGrid1TableView1.DataController.Values[i, 3];
            StoredProc.ParamByName('ID_POCHAS_FACT').AsVariant := id;

            try
                StoredProc.ExecProc;
            except
                on e: exception do
                begin
                    Showmessage(e.message);
                    StoredProc.Transaction.Rollback;
                    exit;
                end;
            end;
        end;

        StoredProc.Transaction.Commit;
        FactQuery.Close;
        FactQuery.Open;
        FactQuery.Locate('ID_POCHAS_FACT', id, []);
    end;
    SelSet.Close;
    frm.Free;
end;


end.

