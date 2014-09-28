unit ConfigStaj;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ExtCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, Buttons, cxGridLevel,
    cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
    cxControls, cxGridCustomView, cxGrid, cxLabel, cxContainer, cxMaskEdit,
    cxDropDownEdit, cxCalendar, cxSplitter, cxCheckBox, ActnList, FIBDataSet,
    pFIBDataSet, FIBQuery, pFIBQuery, pFIBStoredProc, IBase, ImgList, dxBar,
    dxBarExtItems;

type
    TfrmConfigStaj = class(TForm)
        Panel1: TPanel;
        Panel2: TPanel;
        Panel3: TPanel;
        cxGrid3: TcxGrid;
        RaiseView: TcxGridDBTableView;
        cxGridDBColumn4: TcxGridDBColumn;
        cxGridDBColumn6: TcxGridDBColumn;
        cxGridDBColumn7: TcxGridDBColumn;
        cxGridDBColumn5: TcxGridDBColumn;
        cxGridLevel2: TcxGridLevel;
        Panel5: TPanel;
        Panel6: TPanel;
        cxGrid1: TcxGrid;
        cxGridDBTableView1: TcxGridDBTableView;
        cxGridDBColumn1: TcxGridDBColumn;
        cxGridDBColumn2: TcxGridDBColumn;
        cxGridDBColumn3: TcxGridDBColumn;
        cxGridDBColumn8: TcxGridDBColumn;
        cxGridLevel1: TcxGridLevel;
        cxGrid2: TcxGrid;
        cxGridDBTableView2: TcxGridDBTableView;
        cxGridDBColumn9: TcxGridDBColumn;
        cxGridDBColumn10: TcxGridDBColumn;
        cxGridDBColumn11: TcxGridDBColumn;
        cxGridDBColumn12: TcxGridDBColumn;
        cxGridLevel3: TcxGridLevel;
        cxStyleRepository1: TcxStyleRepository;
        cxStyle1: TcxStyle;
        cxStyle2: TcxStyle;
        cxStyle3: TcxStyle;
        cxStyle4: TcxStyle;
        cxStyle5: TcxStyle;
        cxStyle6: TcxStyle;
        cxStyle7: TcxStyle;
        cxStyle8: TcxStyle;
        cxStyle9: TcxStyle;
        cxStyle10: TcxStyle;
        cxStyle11: TcxStyle;
        cxStyle12: TcxStyle;
        cxStyle13: TcxStyle;
        cxStyle14: TcxStyle;
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
        cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
        RaiseViewDBColumn1: TcxGridDBColumn;
        cxSplitter1: TcxSplitter;
        cxSplitter2: TcxSplitter;
        RaiseViewDBColumn2: TcxGridDBColumn;
        LocFilterBox1: TcxCheckBox;
        LocFilterBox2: TcxCheckBox;
        PanelGroup2: TcxCheckBox;
        PanelGroup3: TcxCheckBox;
        CaptionGrid2: TcxLabel;
        CaptionGrid3: TcxLabel;
        Panel9: TPanel;
        Panel10: TPanel;
        RaiseViewDBColumn3: TcxGridDBColumn;
        RaiseViewDBColumn4: TcxGridDBColumn;
        RaiseViewDBColumn5: TcxGridDBColumn;
        RaiseViewDBColumn6: TcxGridDBColumn;
        ActionList1: TActionList;
        InstypeAct: TAction;
        ModifyTypeAct: TAction;
        DelTypeAct: TAction;
        RefreshTypeAct: TAction;
        InsPCalcAct: TAction;
        DelPCalcAct: TAction;
        RefPCAlcAct: TAction;
        PeriodEditCalcAct: TAction;
        InsPNCalcAct: TAction;
        DelPNCalcAct: TAction;
        RefPNCalcAct: TAction;
        PeriodEditNCalcAct: TAction;
        FilterAct: TAction;
        CloseAct: TAction;
        FiltLab: TcxLabel;
        StajTypePostSet: TpFIBDataSet;
        DSStajTypePost: TDataSource;
        PeopleCalcDS: TDataSource;
        PeopleCalcSet: TpFIBDataSet;
        PeopleNCalcSet: TpFIBDataSet;
        PeopleNCalcDS: TDataSource;
        CatSet: TpFIBDataSet;
        CatDs: TDataSource;
        StorProc: TpFIBStoredProc;
        RaiseViewDBColumn7: TcxGridDBColumn;
        RaiseViewDBColumn8: TcxGridDBColumn;
        cxGridDBTableView1DBColumn1: TcxGridDBColumn;
        cxGridDBTableView1DBColumn2: TcxGridDBColumn;
        brManager: TdxBarManager;
        btnAddType: TdxBarLargeButton;
        btnEditType: TdxBarLargeButton;
        btnDelType: TdxBarLargeButton;
        btnRefType: TdxBarLargeButton;
        btnCLose: TdxBarLargeButton;
        ImgList1: TImageList;
        dxBarContainerItem1: TdxBarContainerItem;
        dxBarEdit1: TdxBarEdit;
        FilterDateBeg: TdxBarDateCombo;
        lblFilter: TdxBarStatic;
        dxBarStatic1: TdxBarStatic;
        FilterDateEnd: TdxBarDateCombo;
        btnFilter: TdxBarLargeButton;
        Panel4: TPanel;
        LocFilterBox: TcxCheckBox;
        PanelGroup1: TcxCheckBox;
        Panel8: TPanel;
        CaptionGrid1: TcxLabel;
        dbrType: TdxBarDockControl;
        dbrPCalc: TdxBarDockControl;
        btnPCalcIns: TdxBarLargeButton;
        btnPCalcDel: TdxBarLargeButton;
        btnPCalcRef: TdxBarLargeButton;
        btnPCalcEdit: TdxBarLargeButton;
        dbrPNCalc: TdxBarDockControl;
        btnPNCalcIns: TdxBarLargeButton;
        btnPNCalcDel: TdxBarLargeButton;
        btnPNCalcRef: TdxBarLargeButton;
        btnPNCalcEdit: TdxBarLargeButton;
        procedure FilterDateBegPropertiesChange(Sender: TObject);
        procedure FilterDateEndPropertiesChange(Sender: TObject);
        procedure RaiseViewKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure cxGridDBTableView1KeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure cxGridDBTableView2KeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure LocFilterBoxPropertiesChange(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure LocFilterBox1PropertiesChange(Sender: TObject);
        procedure LocFilterBox2PropertiesChange(Sender: TObject);
        procedure PanelGroup1PropertiesChange(Sender: TObject);
        procedure PanelGroup2PropertiesChange(Sender: TObject);
        procedure PanelGroup3PropertiesChange(Sender: TObject);
        procedure CloseActExecute(Sender: TObject);
        procedure InstypeActExecute(Sender: TObject);
        procedure ModifyTypeActExecute(Sender: TObject);
        procedure DelTypeActExecute(Sender: TObject);
        procedure RefreshTypeActExecute(Sender: TObject);
        procedure InsPCalcActExecute(Sender: TObject);
        procedure DelPCalcActExecute(Sender: TObject);
        procedure RefPCAlcActExecute(Sender: TObject);
        procedure PeriodEditCalcActExecute(Sender: TObject);
        procedure InsPNCalcActExecute(Sender: TObject);
        procedure DelPNCalcActExecute(Sender: TObject);
        procedure RefPNCalcActExecute(Sender: TObject);
        procedure PeriodEditNCalcActExecute(Sender: TObject);
        procedure FilterActExecute(Sender: TObject);
    private
        id_staj_: Int64;
        MinRateCount: Double;
        MinRateCountSovm: Double;
        KeySession: Int64;
        HND: TISC_DB_HANDLE;
    { Private declarations }
    public
        procedure SetIdStaj(id_st: Int64);
        procedure CloseOpenPostSet(id_staj: Integer; DateBeg, DateEnd: TDate);
        procedure CloseOpenPeopleCalcSet(id_staj: Integer; DateBeg, DateEnd: TDate);
        procedure CloseOpenPeopleNCalcSet(id_staj: Integer; DateBeg, DateEnd: TDate);
        procedure CloseOpenPeopleTempSet(key_session: Integer);
        procedure SetMinRateCount(MRCount: Double);
        procedure SetMinRateCountSovm(MRCountSovm: Double);
        function GetMinRateCount: Variant;
        function GetMinRateCountSovm: Variant;
        function GetKeySes: Variant;
        procedure SetKeySes(KeyS: Int64);
        procedure SetHND(hn: TISC_DB_HANDLE);
    { Public declarations }
    end;

var
    frmConfigStaj: TfrmConfigStaj;

implementation

{$R *.dfm}
{**}
uses SelectStaj, ConfPostEdit, cxDBLookupComboBox, BaseTypes, PeopleInfo,
    DateUtils, PeopleFilter, PeriodEdit, AccMgmt, UpKernelUnit;

procedure TfrmConfigStaj.SetHND(hn: TISC_DB_HANDLE);
begin
    Self.HND := hn;
end;

function TfrmConfigStaj.GetKeySes: Variant;
begin
    Result := Self.KeySession;
end;

procedure TfrmConfigStaj.SetKeySes(KeyS: Int64);
begin
    Self.KeySession := KeyS;
end;

function TfrmConfigStaj.GetMinRateCount: Variant;
begin
    Result := Self.MinRateCount;
end;

function TfrmConfigStaj.GetMinRateCountSovm: Variant;
begin
    Result := Self.MinRateCountSovm;
end;

procedure TfrmConfigStaj.SetMinRateCount(MRCount: Double);
begin
    Self.MinRateCount := MRCount;
end;

procedure TfrmConfigStaj.SetMinRateCountSovm(MRCountSovm: Double);
begin
    Self.MinRateCountSovm := MRCountSovm;
end;

procedure TfrmConfigStaj.CloseOpenPostSet(id_staj: Integer; DateBeg, DateEnd: TDate);
begin
    StajTypePostSet.Close;
    StajTypePostSet.ParamByName('id_staj').AsInt64 := id_staj;
    StajTypePostSet.ParamByName('date_beg').AsDate := DateBeg;
    StajTypePostSet.ParamByName('date_end').AsDate := DateEnd;
    StajTypePostSet.Open;
end;

procedure TfrmConfigStaj.CloseOpenPeopleCalcSet(id_staj: Integer; DateBeg, DateEnd: TDate);
begin
    PeopleCalcSet.Close;
    PeopleCalcSet.ParamByName('id_staj').AsInt64 := id_staj;
    PeopleCalcSet.ParamByName('date_beg').AsDate := DateBeg;
    PeopleCalcSet.ParamByName('date_end').AsDate := DateEnd;
    PeopleCalcSet.Open;
end;

procedure TfrmConfigStaj.CloseOpenPeopleNCalcSet(id_staj: Integer; DateBeg, DateEnd: TDate);
begin
    PeopleNCalcSet.Close;
    PeopleNCalcSet.ParamByName('id_staj').AsInt64 := id_staj;
    PeopleNCalcSet.ParamByName('date_beg').AsDate := DateBeg;
    PeopleNCalcSet.ParamByName('date_end').AsDate := DateEnd;
    PeopleNCalcSet.Open;
end;

procedure TfrmConfigStaj.CloseOpenPeopleTempSet(key_session: Integer);
begin
    {PeopleTempSet.Close;
    PeopleTempSet.ParamByName('key_session').AsInteger:=key_session;
    PeopleTempSet.Open; }
end;

procedure TfrmConfigStaj.SetIdStaj(id_st: Int64);
begin
    Self.id_staj_ := id_st;
end;

procedure TfrmConfigStaj.FilterDateBegPropertiesChange(Sender: TObject);
begin
    {StajTypePostSet.close;
    StajTypePostSet.ParamByName('id_staj').AsInt64:=Self.id_staj_;
    StajTypePostSet.ParamByName('date_beg').AsDate:=FilterDateBeg.Date;
    StajTypePostSet.ParamByName('date_end').AsDate:=FilterDateEnd.Date;
    StajTypePostSet.Open;}
    FiltLab.Visible := True;
end;

procedure TfrmConfigStaj.FilterDateEndPropertiesChange(Sender: TObject);
begin
    {StajTypePostSet.Close;
    StajTypePostSet.ParamByName('id_staj').AsInt64:=Self.id_staj_;
    StajTypePostSet.ParamByName('date_beg').AsDate:=FilterDateBeg.Date;
    StajTypePostSet.ParamByName('date_end').AsDate:=FilterDateEnd.Date;
    StajTypePostSet.Open;  }
    FiltLab.Visible := True;
end;

procedure TfrmConfigStaj.RaiseViewKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if ((Key = VK_F12) and (ssShift in Shift))
        then ShowInfo(StajTypePostSet);
end;

procedure TfrmConfigStaj.cxGridDBTableView1KeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if ((Key = VK_F12) and (ssShift in Shift))
        then ShowInfo(PeopleCalcSet);
end;

procedure TfrmConfigStaj.cxGridDBTableView2KeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if ((Key = VK_F12) and (ssShift in Shift))
        then ShowInfo(PeopleNCalcSet);
end;

procedure TfrmConfigStaj.LocFilterBoxPropertiesChange(Sender: TObject);
var
    i: Integer;
begin
    for i := 0 to RaiseView.ColumnCount - 1 do
    begin
        RaiseView.Columns[i].Options.Filtering := LocFilterBox.Checked;
    end;
end;

procedure TfrmConfigStaj.FormCreate(Sender: TObject);
var
    i: Integer;
begin
    LocFilterBox.Checked := False;
    for i := 0 to RaiseView.ColumnCount - 1 do
    begin
        RaiseView.Columns[i].Options.Filtering := LocFilterBox.Checked;
    end;
    for i := 0 to cxGridDBTableView1.ColumnCount - 1 do
    begin
        cxGridDBTableView1.Columns[i].Options.Filtering := LocFilterBox.Checked;
    end;
    for i := 0 to cxGridDBTableView2.ColumnCount - 1 do
    begin
        cxGridDBTableView2.Columns[i].Options.Filtering := LocFilterBox.Checked;
    end;
    PanelGroup1.Checked := False;
    RaiseView.OptionsView.GroupByBox := PanelGroup1.Checked;
    cxGridDBTableView1.OptionsView.GroupByBox := PanelGroup1.Checked;
    cxGridDBTableView2.OptionsView.GroupByBox := PanelGroup1.Checked;
    FiltLab.Visible := False;
    {StorProc.StoredProcName:='PUB_GET_ID_BY_GEN';
    StorProc.Transaction.StartTransaction;
    StorProc.Prepare;
    StorProc.ParamByName('GENERATOR_NAME').AsString:='GEN_UP_CONF_STAJ_BUF_ID';
    StorProc.ParamByName('STEP').AsInteger:=1;
    try
      StorProc.ExecProc;
      SetKeySes(StorProc.FieldByName('RET_VALUE').AsInt64);
      StorProc.Transaction.Commit;
    except on e:exception
    do begin
          agMessageDlg('Увага!',e.Message, mtInformation, [mbOK]);
          StorProc.Transaction.Rollback;
       end;
    end;    }
    //ShowMessage(inttostr(GetKeySes));
end;

procedure TfrmConfigStaj.LocFilterBox1PropertiesChange(Sender: TObject);
var
    i: integer;
begin
    for i := 0 to cxGridDBTableView1.ColumnCount - 1 do
    begin
        cxGridDBTableView1.Columns[i].Options.Filtering := LocFilterBox1.Checked;
    end;
end;

procedure TfrmConfigStaj.LocFilterBox2PropertiesChange(Sender: TObject);
var
    i: integer;
begin
    for i := 0 to cxGridDBTableView2.ColumnCount - 1 do
    begin
        cxGridDBTableView2.Columns[i].Options.Filtering := LocFilterBox2.Checked;
    end;
end;

procedure TfrmConfigStaj.PanelGroup1PropertiesChange(Sender: TObject);
begin
    RaiseView.OptionsView.GroupByBox := PanelGroup1.Checked;
end;

procedure TfrmConfigStaj.PanelGroup2PropertiesChange(Sender: TObject);
begin
    cxGridDBTableView1.OptionsView.GroupByBox := PanelGroup2.Checked;
end;

procedure TfrmConfigStaj.PanelGroup3PropertiesChange(Sender: TObject);
begin
    cxGridDBTableView2.OptionsView.GroupByBox := PanelGroup3.Checked;
end;

procedure TfrmConfigStaj.CloseActExecute(Sender: TObject);
begin
    Close;
end;

procedure TfrmConfigStaj.InstypeActExecute(Sender: TObject);
var
    frm: TfrmPostEdit;
    IsTypePost: string;
    Year_, Month_, Day_: Word;
begin
    frm := TfrmPostEdit.Create(Self);
    try
        DecodeDate(Date, Year_, Month_, Day_);
        frm.cDateBeg.Date := EncodeDate(Year_, 1, 1);
        frm.cDateEnd.Date := EncodeDate(9999, 12, 31);
        frm.DateOrder.Date := Date;
        CatSet.Close;
        CatSet.Open;
        frm.EditMode(1);
        frm.cMinOklad.Text := FloatToStr(GetMinRateCount);
        frm.cMinRateSovm.Text := FloatToStr(GetMinRateCountSovm);
    except on e: exception
        do begin
            ShowMessage(e.Message);
        end;
    end;
    if frm.ShowModal = mrOk then
    begin
        StorProc.StoredProcName := 'UP_CONF_TP_STAJ_INS';
        StorProc.Transaction.StartTransaction;
        StorProc.Prepare;
        StorProc.ParamByName('ID_STAJ').AsInt64 := Self.id_staj_;
        StorProc.ParamByName('ID_POST_SALARY').Value := frm.GetPostSalary;
        StorProc.ParamByName('DATE_BEG').Value := frm.cDateBeg.Date;
        StorProc.ParamByName('DATE_END').Value := frm.cDateEnd.Date;
        //StorProc.ParamByName('MIN_RATE_COUNT').Value:=StrToFloat(frm.cMinOklad.Text);
        StorProc.ParamByName('MIN_RATE_COUNT').Value := GetMinRateCount;
        StorProc.ParamByName('MIN_RATE_COUNT_SOVM').Value := GetMinRateCountSovm;
        StorProc.ParamByName('NUM_ORDER').AsString := frm.NumOrderEdit.Text;
        if DateToStr(frm.DateOrder.Date) = '00.00.0000' then
            StorProc.ParamByName('DATE_ORDER').Value := Null
        else StorProc.ParamByName('DATE_ORDER').AsDate := frm.DateOrder.Date;
        if frm.cxRadioButton1.Checked then
        begin
            IsTypePost := 'T';
            StorProc.ParamByName('ID_TYPE_POST').Value := frm.cxCategory.EditValue;
        end
        else
        begin
            IsTypePost := 'F';
            StorProc.ParamByName('ID_TYPE_POST').Value := frm.GetTypePost;
        end;
        StorProc.ParamByName('IS_TYPE_POST').AsString := IsTypePost;
        try
            StorProc.ExecProc;
            StorProc.Transaction.Commit;
        except on e: exception
            do begin
                agMessageDlg('Увага!', e.Message, mtInformation, [mbOK]);
                StorProc.Transaction.Rollback;
            end;
        end;
        CloseOpenPostSet(Self.id_staj_, FilterDateBeg.Date, FilterDateEnd.Date);
    end;
end;

procedure TfrmConfigStaj.ModifyTypeActExecute(Sender: TObject);
var
    frm: TfrmPostEdit;
    id_: Integer;
begin
    if StajTypePostSet.IsEmpty then Exit;
    frm := TfrmPostEdit.Create(Self);
    try
        frm.cDateBeg.Date := StajTypePostSet['DATE_BEG_OUT'];
        frm.cDateEnd.Date := StajTypePostSet['DATE_END_OUT'];
        id_ := StajTypePostSet['ID_CONF_TP_STAJ'];
        frm.EditMode(0);
        frm.cxCat.Visible := True;
        frm.cxCat.Enabled := False;
        frm.cxCat.Text := StajTypePostSet['NAME_TYPE_POST'];
        if StajTypePostSet['ID_POST_SALARY'] <> -1 then
        begin
            frm.PostSpr.Text := StajTypePostSet['NAME_POST'];
        end;
        frm.cxRadioButton1.Enabled := False;
        frm.cxRadioButton2.Enabled := False;
        frm.cxCategory.Visible := False;
        frm.PostSpr.Enabled := False;
        frm.cMinOklad.Text := FloatToStr(GetMinRateCount);
        frm.cMinRateSovm.Text := FloatToStr(GetMinRateCountSovm);
        if not VarIsNull(StajTypePostSet['DATE_ORDER'])
            then frm.DateOrder.Date := StajTypePostSet['DATE_ORDER'];
        if VarIsNull(StajTypePostSet['NUM_ORDER']) then frm.NumOrderEdit.Text := ''
        else frm.NumOrderEdit.Text := StajTypePostSet['NUM_ORDER'];
      //frm.cMinOklad.Text:=FloatToStr(StajTypePostSet['MIN_RATE_COUNT']);
    except on e: exception
        do begin
            ShowMessage(e.Message);
        end;
    end;
    if frm.ShowModal = mrOk then
    begin
        StorProc.StoredProcName := 'UP_CONF_TP_STAJ_UPD';
        StorProc.Transaction.StartTransaction;
        StorProc.Prepare;
        StorProc.ParamByName('ID_CONF_TP_STAJ').AsInt64 := id_;
        StorProc.ParamByName('DATE_BEG').Value := frm.cDateBeg.Date;
        StorProc.ParamByName('DATE_END').Value := frm.cDateEnd.Date;
        //StorProc.ParamByName('MIN_RATE_COUNT').Value:=StrToFloat(frm.cMinOklad.Text);
        StorProc.ParamByName('MIN_RATE_COUNT').Value := GetMinRateCount;
        StorProc.ParamByName('MIN_RATE_COUNT_SOVM').Value := GetMinRateCountSovm;
        StorProc.ParamByName('NUM_ORDER').AsString := frm.NumOrderEdit.Text;
        if DateToStr(frm.DateOrder.Date) = '00.00.0000' then
            StorProc.ParamByName('DATE_ORDER').Value := Null
        else StorProc.ParamByName('DATE_ORDER').AsDate := frm.DateOrder.Date;
        try
            StorProc.ExecProc;
            StorProc.Transaction.Commit;
        except on e: exception
            do begin
                agMessageDlg('Увага!', e.Message, mtInformation, [mbOK]);
                StorProc.Transaction.Rollback;
            end;
        end;
        CloseOpenPostSet(Self.id_staj_, FilterDateBeg.Date, FilterDateEnd.Date);
        StajTypePostSet.Locate('ID_CONF_TP_STAJ', id_, []);
    end;
end;

procedure TfrmConfigStaj.DelTypeActExecute(Sender: TObject);
var
    id_: Int64;
begin
    if StajTypePostSet.IsEmpty then Exit;
    id_ := StajTypePostSet['ID_CONF_TP_STAJ'];
    if agMessageDlg('Увага!', 'Ви дійсно бажаєте видалити запис?', mtInformation, [mbYes, mbNo]) = mrYes then
    begin
        StorProc.StoredProcName := 'UP_CONF_TP_STAJ_DEL';
        StorProc.Transaction.StartTransaction;
        StorProc.Prepare;
        StorProc.ParamByName('ID_CONF_TP_STAJ').AsInt64 := id_;
        try
            StorProc.ExecProc;
            StorProc.Transaction.Commit;
        except on e: exception
            do begin
                agMessageDlg('Увага!', e.Message, mtInformation, [mbOK]);
                StorProc.Transaction.Rollback;
            end;
        end;
    end;
    CloseOpenPostSet(Self.id_staj_, FilterDateBeg.Date, FilterDateEnd.Date);
end;

procedure TfrmConfigStaj.RefreshTypeActExecute(Sender: TObject);
begin
    CloseOpenPostSet(Self.id_staj_, FilterDateBeg.Date, FilterDateEnd.Date);
end;

procedure TfrmConfigStaj.InsPCalcActExecute(Sender: TObject);
var
    frm: TfrmPeopleFilter;
    sw: Integer;

begin
    frm := TfrmPeopleFilter.Create(Self);
    frm.Caption := 'Список осіб, яким розраховувати обраний стаж';
    frm.SetHandle(Self.HND);
    frm.PDateOrder.Date := Date;
    if frm.ShowModal = mrOk then
    begin
        StorProc.StoredProcName := 'UP_PEOPLE_CALC_STAJ_INS';
        StorProc.Transaction.StartTransaction;
        StorProc.Prepare;
        StorProc.ParamByName('ID_STAJ').AsInteger := Self.id_staj_;
        if frm.RadioButPeople.Checked = True then
        begin
            StorProc.ParamByName('ID_MAN').Value := frm.qfPeople.Value;
            sw := 0
        end
        else
        begin
            StorProc.ParamByName('KEY_SESSION').AsInteger := frm.GetKeySession;
            //ShowMessage(inttostr(frm.GetKeySession));
            sw := 1;
        end;
        StorProc.ParamByName('WHICH_FILTER').AsInteger := sw;
        StorProc.ParamByName('DATE_BEG').AsDate := frm.DateBegF.Date;
        StorProc.ParamByName('DATE_END').AsDate := frm.DateEndF.Date;
        StorProc.ParamByName('NUM_ORDER').AsString := frm.PNumOrderEdit.Text;
        if DateToStr(frm.PDateOrder.Date) = '00.00.0000' then
            StorProc.ParamByName('DATE_ORDER').Value := null
        else StorProc.ParamByName('DATE_ORDER').AsDate := frm.PDateOrder.Date;
        try
            StorProc.ExecProc;
            StorProc.Transaction.Commit;
        except on E: Exception
            do begin
                agMessageDlg('Увага!', E.Message, mtInformation, [mbOK]);
            //CloseOpenPeopleTempSet(frm.GetKeySession);
                StorProc.Transaction.Rollback;
            end;
        end;
    end;
    CloseOpenPeopleCalcSet(Self.id_staj_, FilterDateBeg.Date, FilterDateEnd.Date);
    //CloseOpenPeopleTempSet(frm.GetKeySession);
    frm.Free;
end;

procedure TfrmConfigStaj.DelPCalcActExecute(Sender: TObject);
var
    id_: Int64;
begin
    if PeopleCalcSet.IsEmpty then Exit;
    id_ := PeopleCalcSet['ID_PEOPLE_CALC_STAJ'];
    if agMessageDlg('Увага!', 'Ви дійсно бажаєте видалити запис?', mtInformation, [mbYes, mbNo]) = mrYes then
    begin
        StorProc.StoredProcName := 'UP_PEOPLE_CALC_STAJ_DEL';
        StorProc.Transaction.StartTransaction;
        StorProc.Prepare;
        StorProc.ParamByName('ID_PEOPLE_CALC_STAJ').AsInt64 := id_;
        try
            StorProc.ExecProc;
            StorProc.Transaction.Commit;
        except on e: exception
            do begin
                agMessageDlg('Увага!', e.Message, mtInformation, [mbOK]);
                StorProc.Transaction.Rollback;
            end;
        end;
    end;
    CloseOpenPeopleCalcSet(Self.id_staj_, FilterDateBeg.Date, FilterDateEnd.Date);
end;

procedure TfrmConfigStaj.RefPCAlcActExecute(Sender: TObject);
begin
    CloseOpenPeopleCalcSet(Self.id_staj_, FilterDateBeg.Date, FilterDateEnd.Date);
end;

procedure TfrmConfigStaj.PeriodEditCalcActExecute(Sender: TObject);
var
    frm: TfrmPeriodEdit;
    Id_: Integer;
begin
    if PeopleCalcSet.IsEmpty then exit;
    Id_ := PeopleCalcSet['id_people_calc_staj'];
    frm := TfrmPeriodEdit.Create(Self);
    frm.DatePeriodBeg.Date := PeopleCalcSet['DATE_BEG_OUT'];
    frm.DatePeriodEnd.Date := PeopleCalcSet['DATE_END_OUT'];
    if not VarIsNull(PeopleCalcSet['DATE_ORDER'])
        then frm.DateOrderE.Date := PeopleCalcSet['DATE_ORDER'];
    if VarIsNull(PeopleCalcSet['NUM_ORDER']) then frm.NumOrderE.Text := ''
    else frm.NumOrderE.Text := PeopleCalcSet['NUM_ORDER'];
    if frm.ShowModal = mrOk then
    begin
        StorProc.StoredProcName := 'UP_PEOPL_TMP_STAJ_PERIOD_UPD';
        StorProc.Transaction.StartTransaction;
        StorProc.Prepare;
        StorProc.ParamByName('date_beg').Value := frm.DatePeriodBeg.Date;
        StorProc.ParamByName('date_end').Value := frm.DatePeriodEnd.Date;
        StorProc.ParamByName('id_').AsInteger := id_;
        StorProc.ParamByName('which_tab').AsInteger := 0;
        StorProc.ParamByName('num_order').AsString := frm.NumOrderE.Text;
        if DateToStr(frm.DateOrderE.Date) = '00.00.0000' then
            StorProc.ParamByName('date_order').Value := null
        else StorProc.ParamByName('date_order').AsDate := frm.DateOrderE.Date;
        try
            StorProc.ExecProc;
            StorProc.Transaction.Commit;
        except on e: exception
            do begin
                agMessageDlg('Уага!', e.Message, mtInformation, [mbOK]);
                StorProc.Transaction.Rollback;
            end;
        end;
    end;
    CloseOpenPeopleCalcSet(Self.id_staj_, FilterDateBeg.Date, FilterDateEnd.Date);
    PeopleCalcSet.Locate('id_people_calc_staj', Id_, []);
    frm.Free;
end;

procedure TfrmConfigStaj.InsPNCalcActExecute(Sender: TObject);
var
    frm: TfrmPeopleFilter;
    sw: Integer;

begin
    frm := TfrmPeopleFilter.Create(Self);
    frm.Caption := 'Список осіб, яким не розраховувати обраний стаж';
    frm.SetHandle(Self.HND);
    frm.lblNumOrder.Visible := False;
    frm.PNumOrderEdit.Visible := False;
    frm.lblDateOrder.Visible := False;
    frm.PDateOrder.Visible := False;
    frm.Height := 240;
    frm.Panel1.Top := 205;
    if frm.ShowModal = mrOk then
    begin
        StorProc.StoredProcName := 'UP_PEOPLE_NCALC_STAJ_INS';
        StorProc.Transaction.StartTransaction;
        StorProc.Prepare;
        StorProc.ParamByName('ID_STAJ').AsInteger := Self.id_staj_;
        if frm.RadioButPeople.Checked = True then
        begin
            StorProc.ParamByName('ID_MAN').Value := frm.qfPeople.Value;
            sw := 0
        end
        else
        begin
            StorProc.ParamByName('KEY_SESSION').AsInteger := frm.GetKeySession;
            sw := 1;
        end;
        StorProc.ParamByName('WHICH_FILTER').AsInteger := sw;
        StorProc.ParamByName('DATE_BEG').AsDate := frm.DateBegF.Date;
        StorProc.ParamByName('DATE_END').AsDate := frm.DateEndF.Date;
        try
            StorProc.ExecProc;
            StorProc.Transaction.Commit;
        except on E: Exception
            do begin
                agMessageDlg('Увага!', E.Message, mtInformation, [mbOK]);
                StorProc.Transaction.Rollback;
            end;
        end;
    end;
    CloseOpenPeopleNCalcSet(Self.id_staj_, FilterDateBeg.Date, FilterDateEnd.Date);
    frm.Free;
end;

procedure TfrmConfigStaj.DelPNCalcActExecute(Sender: TObject);
var
    id_: Int64;
begin
    if PeopleNCalcSet.IsEmpty then Exit;
    id_ := PeopleNCalcSet['ID_PEOPLE_NCALC_STAJ'];
    if agMessageDlg('Увага!', 'Ви дійсно бажаєте видалити запис?', mtInformation, [mbYes, mbNo]) = mrYes then
    begin
        StorProc.StoredProcName := 'UP_PEOPLE_NCALC_STAJ_DEL';
        StorProc.Transaction.StartTransaction;
        StorProc.Prepare;
        StorProc.ParamByName('ID_PEOPLE_NCALC_STAJ').AsInt64 := id_;
        try
            StorProc.ExecProc;
            StorProc.Transaction.Commit;
        except on e: exception
            do begin
                agMessageDlg('Увага!', e.Message, mtInformation, [mbOK]);
                StorProc.Transaction.Rollback;
            end;
        end;
    end;
    CloseOpenPeopleNCalcSet(Self.id_staj_, FilterDateBeg.Date, FilterDateEnd.Date);
end;

procedure TfrmConfigStaj.RefPNCalcActExecute(Sender: TObject);
begin
    CloseOpenPeopleNCalcSet(Self.id_staj_, FilterDateBeg.Date, FilterDateEnd.Date);
end;

procedure TfrmConfigStaj.PeriodEditNCalcActExecute(Sender: TObject);
var
    frm: TfrmPeriodEdit;
    Id_: Integer;
begin
    if PeopleNCalcSet.IsEmpty then exit;
    Id_ := PeopleNCalcSet['id_people_ncalc_staj'];
    frm := TfrmPeriodEdit.Create(Self);
    frm.DatePeriodBeg.Date := PeopleNCalcSet['DATE_BEG_OUT'];
    frm.DatePeriodEnd.Date := PeopleNCalcSet['DATE_END_OUT'];
    frm.lbNumOrder.Visible := False;
    frm.NumOrderE.Visible := False;
    frm.lbDateOrder.Visible := False;
    frm.DateOrderE.Visible := False;
    frm.Height := 125;
    frm.btnOk.Top := 50;
    frm.btnCancel.Top := 50;
    if frm.ShowModal = mrOk then
    begin
        StorProc.StoredProcName := 'UP_PEOPL_TMP_STAJ_PERIOD_UPD';
        StorProc.Transaction.StartTransaction;
        StorProc.Prepare;
        StorProc.ParamByName('date_beg').Value := frm.DatePeriodBeg.Date;
        StorProc.ParamByName('date_end').Value := frm.DatePeriodEnd.Date;
        StorProc.ParamByName('id_').AsInteger := id_;
        StorProc.ParamByName('which_tab').AsInteger := 1;
        try
            StorProc.ExecProc;
            StorProc.Transaction.Commit;
        except on e: exception
            do begin
                agMessageDlg('Уага!', e.Message, mtInformation, [mbOK]);
                StorProc.Transaction.Rollback;
            end;
        end;
    end;
    CloseOpenPeopleNCalcSet(Self.id_staj_, FilterDateBeg.Date, FilterDateEnd.Date);
    PeopleNCalcSet.Locate('id_people_ncalc_staj', Id_, []);
    frm.Free;
end;

procedure TfrmConfigStaj.FilterActExecute(Sender: TObject);
begin
    CloseOpenPostSet(Self.id_staj_, FilterDateBeg.Date, FilterDateEnd.Date);
    CloseOpenPeopleCalcSet(Self.id_staj_, FilterDateBeg.Date, FilterDateEnd.Date);
    CloseOpenPeopleNCalcSet(Self.id_staj_, FilterDateBeg.Date, FilterDateEnd.Date);
    FiltLab.Visible := False;
end;

end.

