unit UWMainOutputVedomost;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxTL, cxMaskEdit,
  cxInplaceContainer, cxDBTL, cxTLData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxSplitter, ActnList, ImgList, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, cxCalendar, ExtCtrls,
  cxLookAndFeelPainters, StdCtrls, cxButtons, RxMemDS, cxCurrencyEdit,
  cxSpinEdit, cxCheckBox, FIBQuery, pFIBQuery, pFIBStoredProc, cxTextEdit,
  cxLabel, cxContainer, cxDropDownEdit, cxGridBandedTableView,
  cxGridDBBandedTableView;

type
  TfmUWMainOutputVedomost = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    StyleRepository: TcxStyleRepository;
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
    cxStyleYellow: TcxStyle;
    cxStyleFontBlack: TcxStyle;
    cxStyleMalin: TcxStyle;
    cxStyleBorder: TcxStyle;
    cxStylemalinYellow: TcxStyle;
    cxStyleGrid: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    ImageList1: TImageList;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    DS: TpFIBDataSet;
    Tr: TpFIBTransaction;
    DBase: TpFIBDatabase;
    DataSource1: TDataSource;
    DSVED_NOMER: TFIBStringField;
    DSVED_DATE: TFIBDateField;
    DSID_DOG: TFIBBCDField;
    DSID_REESTR: TFIBBCDField;
    DSID_VEDOMOST: TFIBBCDField;
    DSID: TFIBBCDField;
    DSLINKTO: TFIBBCDField;
    DSNUMBER_REESTR: TFIBStringField;
    DSDATE_REESTR: TFIBDateField;
    DSGrid: TpFIBDataSet;
    DataSource2: TDataSource;
    DSNAME_REESTR: TFIBStringField;
    DSDATE_B: TFIBDateField;
    DSDATE_E: TFIBDateField;
    DSID_TYPE: TFIBBCDField;
    DSINTO_ALL_DOC: TFIBSmallIntField;
    DSV: TFIBStringField;
    Panel2: TPanel;
    cxSplitter1: TcxSplitter;
    Panel1: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1Level1: TcxGridLevel;
    cxSplitter2: TcxSplitter;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    DataSource3: TDataSource;
    RX: TRxMemoryData;
    DSSUMMA: TFIBBCDField;
    DSGridID_DOG: TFIBBCDField;
    DSGridID_KEKV: TFIBBCDField;
    DSGridID_MAN: TFIBBCDField;
    DSGridID_RAZD: TFIBBCDField;
    DSGridID_SCH: TFIBBCDField;
    DSGridID_SMETA: TFIBBCDField;
    DSGridID_SP_BANKCARD: TFIBBCDField;
    DSGridID_STATE: TFIBBCDField;
    DSGridKOD_DOG: TFIBBCDField;
    DSGridSUMA: TFIBBCDField;
    DSGridRAZ_KOD: TFIBIntegerField;
    DSGridRAZ_TITLE: TFIBStringField;
    DSGridST_KOD: TFIBIntegerField;
    DSGridST_TITLE: TFIBStringField;
    DSGridSM_KOD: TFIBIntegerField;
    DSGridSM_TITLE: TFIBStringField;
    DSGridKEKV_KOD: TFIBIntegerField;
    DSGridKEKV_TITLE: TFIBStringField;
    DSGridSCH_NUMBER: TFIBStringField;
    DSGridSCH_TITLE: TFIBStringField;
    DSGridFIO_MAN: TFIBStringField;
    DSGridTAB_NUM: TFIBStringField;
    DSGridLIC_BANKCARD: TFIBStringField;
    DSGridCOMENT_NANKCARD: TFIBStringField;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridDBTableView1DBColumn4: TcxGridDBColumn;
    cxGridDBTableView1DBColumn5: TcxGridDBColumn;
    cxGridDBTableView1DBColumn6: TcxGridDBColumn;
    cxGridDBTableView1DBColumn7: TcxGridDBColumn;
    cxGridDBTableView1DBColumn8: TcxGridDBColumn;
    cxGridDBTableView1DBColumn9: TcxGridDBColumn;
    ARight: TAction;
    ALeft: TAction;
    DSsh: TIntegerField;
    cxGrid3Level1: TcxGridLevel;
    cxGrid3: TcxGrid;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    ARightReestr: TAction;
    ALeftAll: TAction;
    SProc: TpFIBStoredProc;
    TWr: TpFIBTransaction;
    SelectlangExecute: TAction;
    cxGridDBTableView1DBColumn10: TcxGridDBColumn;
    Panel3: TPanel;
    cxDateEdit1: TcxDateEdit;
    cxDateEdit2: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn2: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn3: TcxGridDBBandedColumn;
    cxGrid3DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid3DBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn;
    cxGrid3DBBandedTableView1DBBandedColumn4: TcxGridDBBandedColumn;
    cxGrid3DBBandedTableView1DBBandedColumn5: TcxGridDBBandedColumn;
    cxGrid3DBBandedTableView1DBBandedColumn6: TcxGridDBBandedColumn;
    cxGrid3DBBandedTableView1DBBandedColumn7: TcxGridDBBandedColumn;
    cxGrid3DBBandedTableView1DBBandedColumn2: TcxGridDBBandedColumn;
    procedure DSGridAfterOpen(DataSet: TDataSet);
    procedure Action2Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure DSAfterScroll(DataSet: TDataSet);
    procedure cxGrid1Enter(Sender: TObject);
    procedure RXAfterScroll(DataSet: TDataSet);
    procedure ALeftExecute(Sender: TObject);
    procedure ARightExecute(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure cxGrid3Enter(Sender: TObject);
    procedure cxGrid3DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ARightReestrExecute(Sender: TObject);
    procedure ALeftAllExecute(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure LoadCaption;
    procedure SelectlangExecuteExecute(Sender: TObject);
    procedure cxGrid3DBTableView1MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Cell;
    procedure cxGrid3DBTableView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    flag_left, flag_right : boolean;
    ResValue         : Variant;
    index_lang       : integer;
    id_sp_type_ved   : int64;
  public
    constructor Create(Ao : Tcomponent; DB : TpfibDatabase; id_user, id_sp_type_vedom : int64; Date_beg, date_end : Tdate); reintroduce; overload;
  end;

function SelectVedomostOutput(Ao : Tcomponent; DB : TpfibDatabase; id_user, id_sp_type_vedom : int64; Date_beg, date_end : Tdate) : Variant; stdcall;
    exports SelectVedomostOutput;

implementation
uses Registry,
     UWResourcesUnit;

{$R *.dfm}
function SelectVedomostOutput(Ao : Tcomponent; DB : TpfibDatabase; id_user, id_sp_type_vedom : int64; Date_beg, date_end : Tdate) : Variant;
var
    T : TfmUWMainOutputVedomost;
begin
    T := TfmUWMainOutputVedomost.Create(Ao, DB, id_user, id_sp_type_vedom, Date_beg, date_end);
    T.FormStyle := fsNormal;
    T.ShowModal;
    Result := T.ResValue;
    T.Free;
end;

{ TfmUWMainOutputVedomost }

constructor TfmUWMainOutputVedomost.Create(Ao: Tcomponent;
  DB: TpfibDatabase; id_user, id_sp_type_vedom: int64; Date_beg,
  date_end: Tdate);
begin
    inherited Create(AO);
    id_sp_type_ved           := id_sp_type_vedom;
    LoadCaption;

    flag_left                := false;
    flag_right               := false;
    cxGrid3DBBandedTableView1.Items[0].DataBinding.ValueTypeClass := TcxIntegerValueType;


    DBase                    := DB;

    Tr.DefaultDatabase       := DBase;
    TWr.DefaultDatabase      := DBase;
    DBase.DefaultTransaction := Tr;

    DS.Database              := DBase;
    DS.Transaction           := Tr;

    DSGrid.Database          := DBase;
    DSGrid.Transaction       := Tr;


    Tr.StartTransaction;

    cxDateEdit1.Date         := Date_beg;
    cxDateEdit2.Date         := date_end;

//    DSGrid.SQLs.SelectSQL.Text  := 'select * from UW_SELECT_VEDOMOST_OUTPUT_R(?ID_REESTR, ?ID_VEDOMOST, ?DATE_B, ?DATE_E, ?ID_TYPE)';

    DS.Close;
    Ds.SQLs.SelectSQL.Text      := 'select * from UW_SELECT_VEDOMOST_OUTPUT_EXT('''+DateToStr(Date_beg)+''', '''+DateToStr(date_end)+''', '+IntToStr(id_sp_type_vedom)+')';
    Ds.Open;

    DS.First;
    while not DS.Eof do
    begin
//        Tree.DataController.Values[Tree.DataController.FocusedRecordIndex, 5] := 0;
        cxGrid3DBBandedTableView1.DataController.Values[cxGrid3DBBandedTableView1.DataController.FocusedRecordIndex, 0] := 0;
        DS.Next;
    end;

    flag_right                := true;
    flag_left                 := true;
end;

procedure TfmUWMainOutputVedomost.DSGridAfterOpen(DataSet: TDataSet);
begin
{    try
        if DSGrid.FBN('VAR').AsInteger = 1 then
        begin
            cxGrid1DBTableView1DBColumn1.Caption := 'Тип договору';
            cxGrid1DBTableView1DBColumn2.Caption := 'П.І.Б.';
            cxGrid1DBTableView1DBColumn3.Caption := 'Сума';
            cxGrid1DBTableView1DBColumn3.Visible := true;
        end;
        if DSGrid.FBN('VAR').AsInteger = 2 then
        begin
            cxGrid1DBTableView1DBColumn1.Caption := '№ відомості';
            cxGrid1DBTableView1DBColumn2.Caption := 'Дата відомості';
            cxGrid1DBTableView1DBColumn3.Caption := '';
            cxGrid1DBTableView1DBColumn3.Visible := false;
        end;
        if DSGrid.FBN('VAR').AsInteger = 3 then
        begin
            cxGrid1DBTableView1DBColumn1.Caption := 'Реєстр';
            cxGrid1DBTableView1DBColumn2.Caption := '№ відомості';
            cxGrid1DBTableView1DBColumn3.Caption := 'Дата відомості';
            cxGrid1DBTableView1DBColumn3.Visible := true;
        end;

    except
        begin
            cxGrid1DBTableView1DBColumn1.Caption := '';
            cxGrid1DBTableView1DBColumn2.Caption := '';
            cxGrid1DBTableView1DBColumn3.Caption := '';
            cxGrid1DBTableView1DBColumn3.Visible := true;
        end;
    end;}
end;

procedure TfmUWMainOutputVedomost.Action2Execute(Sender: TObject);
var
    id, id_r, id_s : int64;
begin
    flag_left  := false;
    flag_right := false;
    try id   := StrToInt64(DS.fbn('ID').AsString); except id   := -1; end;
    try id_r := RX.FieldByName('id').Value;        except id_r := -1; end;

    DS.Close;
    Ds.SQLs.SelectSQL.Text      := 'select * from UW_SELECT_VEDOMOST_OUTPUT_EXT('''+DateToStr(cxDateEdit1.Date)+''', '''+DateToStr(cxDateEdit2.Date)+''', '+IntToStr(id_sp_type_ved)+')';
    Ds.Open;

    if not DS.IsEmpty then
    begin
        cxGrid3DBBandedTableView1.DataController.GotoFirst;
        while not cxGrid3DBBandedTableView1.DataController.IsEOF do
        begin
            cxGrid3DBBandedTableView1.Controller.FocusedRecord.Expand(true);
            cxGrid3DBBandedTableView1.DataController.GotoNext;
        end;
        cxGrid3DBBandedTableView1.Controller.FocusedRecord.Expand(true);
        cxGrid3DBBandedTableView1.DataController.GotoFirst;
        while not cxGrid3DBBandedTableView1.DataController.IsEOF do
        begin
            try
                id_s := cxGrid3DBBandedTableView1.DataController.Values[cxGrid3DBBandedTableView1.DataController.FocusedRecordIndex, 5]
            except
                id_s := -12345;
            end;
            cxGrid3DBBandedTableView1.DataController.GetRecordId(cxGrid3DBBandedTableView1.DataController.FocusedRecordIndex);//cxGrid3DBBandedTableView1.Controller.SelectedRecords[k].RecordIndex)
            if not RX.ISEmpty then
            begin
                if RX.Locate('id', id_s, [])
                    then cxGrid3DBBandedTableView1.DataController.Values[cxGrid3DBBandedTableView1.DataController.FocusedRecordIndex, 0] := 1
                    else cxGrid3DBBandedTableView1.DataController.Values[cxGrid3DBBandedTableView1.DataController.FocusedRecordIndex, 0] := 0;
            end else
                cxGrid3DBBandedTableView1.DataController.Values[cxGrid3DBBandedTableView1.DataController.FocusedRecordIndex, 0] := 0;

            cxGrid3DBBandedTableView1.DataController.GotoNext;
        end;

        cxGrid3DBBandedTableView1.DataController.GotoFirst;
        while not cxGrid3DBBandedTableView1.DataController.IsEOF do
        begin
            if cxGrid3DBBandedTableView1.DataController.Values[cxGrid3DBBandedTableView1.DataController.FocusedRecordIndex, 5] <> id
                then cxGrid3DBBandedTableView1.DataController.GotoNext
                else Break;
        end;
        try
            RX.Locate('id', id_r, []);
        except
        end;
    end;
        flag_left  := true;
        flag_right := true;
end;

procedure TfmUWMainOutputVedomost.Action3Execute(Sender: TObject);
begin
    ResValue := -1;
    Close;
end;

procedure TfmUWMainOutputVedomost.DSAfterScroll(DataSet: TDataSet);
var
    id_r, id_v : Int64;
begin
    if flag_left then
    begin
        DSGrid.Close;
//        id_r := -1231;
//        id_v := -1231;

        try id_r := StrToInt64(DS.FBN('ID_REESTR').AsString);   except id_r := -1231; end;
        try id_v := StrToInt64(DS.FBN('ID_VEDOMOST').AsString); except id_v := 0; end;

        DSGrid.Sqls.SelectSQL.Text := 'Select * from UW_SELECT_VEDOMOST_OUTPUT_B('+IntToStr(id_r)+', '+IntToStr(id_v)+')';
        DSGrid.Open;
    end;
end;

procedure TfmUWMainOutputVedomost.cxGrid1Enter(Sender: TObject);
var
    id_r, id_v : Int64;
begin
    if not RX.IsEmpty then
    begin
        DSGrid.Close;
//    id_r := -1231;
//    id_v := -1231;

        try id_r := StrToInt64(RX.FieldByName('ID_REESTR').AsString);   except id_r := -1231; end;
        try id_v := StrToInt64(RX.FieldByName('ID_VEDOMOST').AsString); except id_v := 0; end;

        DSGrid.Sqls.SelectSQL.Text := 'Select * from UW_SELECT_VEDOMOST_OUTPUT_B('+IntToStr(id_r)+', '+IntToStr(id_v)+')';
        DSGrid.Open;
    end;
end;

procedure TfmUWMainOutputVedomost.RXAfterScroll(DataSet: TDataSet);
var
    id_r, id_v : Int64;
begin
    if flag_right then
    begin
        DSGrid.Close;
//    id_r := -1231;
//    id_v := -1231;

        try id_r := StrToInt64(RX.FieldByName('ID_REESTR').AsString);   except id_r := -1231; end;
        try id_v := StrToInt64(RX.FieldByName('ID_VEDOMOST').AsString); except id_v := 0; end;

        DSGrid.Sqls.SelectSQL.Text := 'Select * from UW_SELECT_VEDOMOST_OUTPUT_B('+IntToStr(id_r)+', '+IntToStr(id_v)+')';
        DSGrid.Open;
    end;
end;

procedure TfmUWMainOutputVedomost.ALeftExecute(Sender: TObject);
var
    s1, s2 : string;
begin
    if not RX.IsEmpty then
    begin
        s1 := UWResourcesUnit.VEDOMOST_VN_NOT_TAKE[index_lang];
        s2 := UWResourcesUnit.MY_CONST_MESSAGE_WARNING[index_lang];
        if not RX.IsEmpty then
            if MessageBox(Handle, PChar(s1), Pchar(s2), MB_YESNO + MB_DEFBUTTON2)=mrYes
                then Rx.Delete;
    end;
end;

procedure TfmUWMainOutputVedomost.ARightExecute(Sender: TObject);
var
    id : int64;
//    n : string;
begin
    if not DS.IsEmpty then
    begin
        flag_left  := false;
        flag_right := false;
//        showmessage(intToStr(cxGrid3DBTableView1.DataController.Groups.ItemGroupIndex[0]));


        if (not DS.FBN('id_vedomost').IsNull) and (cxGrid3DBBandedTableView1DBBandedColumn7.GroupIndex = 0) then
        begin
            if not RX.IsEmpty
                then begin
                    id := RX.FieldByName('id').Value;
                    RX.First;
                    while not RX.Eof do
                    begin
                        if RX.FieldByName('id').Value = StrToint64(ds.fbn('ID').AsString) then
                        begin
                             showmessage(UWResourcesUnit.VEDOMOST_VN_TAKE_ALLREADY[index_lang]);
                             exit;
                        end;
                        RX.Next;
                    end;
                    RX.Locate('id', id, []);
                end;

            RX.Open;
            RX.Insert;
            RX.FieldByName('id').Value          := StrToint64(ds.fbn('ID').AsString);
            RX.FieldByName('id_reestr').Value   := StrToint64(ds.fbn('ID_REESTR').AsString);
            RX.FieldByName('id_vedomost').Value := StrToint64(ds.fbn('ID_VEDOMOST').AsString);
            RX.FieldByName('summa').Value       := ds.fbn('SUMMA').AsFloat;
            RX.FieldByName('name_ved').Value    := 'Відомість №' + ds.fbn('VED_NOMER').AsString + ' від ' + ds.fbn('VED_DATE').AsString;
            {if ds.fbn('NUMBER_REESTR').AsString = 'Без реєстру'
                then RX.FieldByName('name').Value := 'Без реєстру'
                else begin
                    DS.Locate('ID', linkto, []);
                    if ds.fbn('NUMBER_REESTR').AsString = 'Без реєстру'
                        then }RX.FieldByName('name').Value := 'Без реєстру';
{                        else RX.FieldByName('name').Value := 'Реєстр №' + ds.fbn('NUMBER_REESTR').AsString + ' від ' + ds.fbn('DATE_REESTR').AsString;
                    DS.Locate('ID', id, []);
                end;}
            RX.Post;
//            ds.CacheEdit([15], [1]);
            cxGrid3DBBandedTableView1.DataController.Values[cxGrid3DBBandedTableView1.DataController.FocusedRecordIndex, 0] := 1;
            exit;
        end;


{        if cxGrid3DBTableView1DBColumn7.GroupIndex = null then
//        if (DS.FBN('id_reestr').IsNull) or (StrToInt64(DS.FBN('LINKTO').AsString)=-1) then
        begin
{            if not RX.IsEmpty
                then begin
                    id := RX.FieldByName('id').Value;
                    RX.First;
                    while not RX.Eof do
                    begin
                        if RX.FieldByName('id').Value = StrToint64(ds.fbn('ID').AsString) then
                        begin
                             showmessage('Ця відомість вже вибрана!');
                             exit;
                        end;
                        RX.Next;
                    end;
                    RX.Locate('id', id, []);
                end;


                repeat
                    RX.Open;
                    RX.Insert;
                    RX.FieldByName('id').Value          := StrToint64(ds.fbn('ID').AsString);
                    RX.FieldByName('id_reestr').Value   := StrToint64(ds.fbn('ID_REESTR').AsString);
                    RX.FieldByName('id_vedomost').Value := StrToint64(ds.fbn('ID_VEDOMOST').AsString);
                    RX.FieldByName('summa').Value       := ds.fbn('SUMMA').AsFloat;
                    RX.FieldByName('name_ved').Value    := 'Відомість №' + ds.fbn('VED_NOMER').AsString + ' від ' + ds.fbn('VED_DATE').AsString;
                    RX.FieldByName('name').Value        := ds.fbn('NUMBER_REESTR').AsString;
                    RX.Post;
                    cxGrid3DBTableView1.DataController.Values[cxGrid3DBTableView1.DataController.FocusedRecordIndex, 0] := 1;
                until not true;

        end;   }
        flag_left  := true;
        flag_right := true;
    end;
end;

procedure TfmUWMainOutputVedomost.cxGrid1DBTableView1DblClick(
  Sender: TObject);
begin
    ALeftExecute(Sender);
end;

procedure TfmUWMainOutputVedomost.cxGrid3Enter(Sender: TObject);
var
    id_r, id_v : Int64;
begin
    if not DS.IsEmpty then
    begin
        DSGrid.Close;
//    id_r := -1231;
//    id_v := -1231;

        try id_r := StrToInt64(DS.FBN('ID_REESTR').AsString);   except id_r := -1231; end;
        try id_v := StrToInt64(DS.FBN('ID_VEDOMOST').AsString); except id_v := 0; end;

        DSGrid.Sqls.SelectSQL.Text := 'Select * from UW_SELECT_VEDOMOST_OUTPUT_B('+IntToStr(id_r)+', '+IntToStr(id_v)+')';
        DSGrid.Open;
    end;

end;

procedure TfmUWMainOutputVedomost.cxGrid3DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
    flag_left  := false;
    flag_right := false;

    if not DS.IsEmpty then
    begin
        if (AViewInfo.GridRecord.Values[cxGrid3DBBandedTableView1DBBandedColumn1.Index] = 1) { and (not AViewInfo.GridRecord.Focused) } then
        begin
            ACanvas.Canvas.Font.Style  := [fsStrikeOut];
        end;
    end;
    flag_left  := true;
    flag_right := true;
end;

procedure TfmUWMainOutputVedomost.ARightReestrExecute(Sender: TObject);
var
    id, id2, id_s : int64;
    n : string;
    flag : boolean;
    l : integer;
begin
    if not DS.IsEmpty then
    begin
        flag_left  := false;
        flag_right := false;

        n  := DS.fbn('NAME_REESTR').AsString;
        id := StrToint64(ds.fbn('ID').AsString);

        DS.First;
        while not DS.Eof do
        begin
            try l := cxGrid3DBBandedTableView1.DataController.Values[cxGrid3DBBandedTableView1.DataController.FocusedRecordIndex, 0]; except l := 0; end;
            if DS.fbn('NAME_REESTR').AsString = n then
            begin
                flag := false;
                if not RX.IsEmpty then
                begin
                    id2 := Rx.FieldByName('id').Value;
                    RX.First;

                    while not RX.Eof do
                    begin
                        if RX.FieldByName('id').Value = StrToint64(ds.fbn('ID').AsString) then
                        begin
                             flag := true;
                             Break;
                        end;
                        RX.Next;
                    end;
                    RX.Locate('id', id2, []);
                end;
                if not flag then
                begin
                    RX.Open;
                    RX.Insert;
                    RX.FieldByName('id').Value          := StrToint64(ds.fbn('ID').AsString);
                    RX.FieldByName('id_reestr').Value   := StrToint64(ds.fbn('ID_REESTR').AsString);
                    RX.FieldByName('id_vedomost').Value := StrToint64(ds.fbn('ID_VEDOMOST').AsString);
                    RX.FieldByName('summa').Value       := ds.fbn('SUMMA').AsFloat;
                    RX.FieldByName('name_ved').Value    := 'Відомість №' + ds.fbn('VED_NOMER').AsString + ' від ' + ds.fbn('VED_DATE').AsString;
                    RX.FieldByName('name').Value        := 'Без реєстру';
                    RX.Post;
                    l := 1;
                end;
            end;
            cxGrid3DBBandedTableView1.DataController.Values[cxGrid3DBBandedTableView1.DataController.FocusedRecordIndex, 0] := l;
            DS.Next;
        end;

    if not DS.IsEmpty then
    begin
        cxGrid3DBBandedTableView1.DataController.GotoFirst;
        while not cxGrid3DBBandedTableView1.DataController.IsEOF do
        begin
            cxGrid3DBBandedTableView1.Controller.FocusedRecord.Expand(true);
            cxGrid3DBBandedTableView1.DataController.GotoNext;
        end;
        cxGrid3DBBandedTableView1.Controller.FocusedRecord.Expand(true);
        cxGrid3DBBandedTableView1.DataController.GotoFirst;
        while not cxGrid3DBBandedTableView1.DataController.IsEOF do
        begin
            try
                id_s := cxGrid3DBBandedTableView1.DataController.Values[cxGrid3DBBandedTableView1.DataController.FocusedRecordIndex, 5]
            except
                id_s := -12345;
            end;
            cxGrid3DBBandedTableView1.DataController.GetRecordId(cxGrid3DBBandedTableView1.DataController.FocusedRecordIndex);//cxGrid3DBBandedTableView1.Controller.SelectedRecords[k].RecordIndex)
            if not RX.ISEmpty then
            begin
                if RX.Locate('id', id_s, [])
                    then cxGrid3DBBandedTableView1.DataController.Values[cxGrid3DBBandedTableView1.DataController.FocusedRecordIndex, 0] := 1
                    else cxGrid3DBBandedTableView1.DataController.Values[cxGrid3DBBandedTableView1.DataController.FocusedRecordIndex, 0] := 0;
            end else
                cxGrid3DBBandedTableView1.DataController.Values[cxGrid3DBBandedTableView1.DataController.FocusedRecordIndex, 0] := 0;

            cxGrid3DBBandedTableView1.DataController.GotoNext;
        end;

        cxGrid3DBBandedTableView1.DataController.GotoFirst;
        while not cxGrid3DBBandedTableView1.DataController.IsEOF do
        begin
            if cxGrid3DBBandedTableView1.DataController.Values[cxGrid3DBBandedTableView1.DataController.FocusedRecordIndex, 5] <> id
                then cxGrid3DBBandedTableView1.DataController.GotoNext
                else Break;
        end;
    end;
        flag_left  := true;
        flag_right := true;


    end;
end;

procedure TfmUWMainOutputVedomost.ALeftAllExecute(Sender: TObject);
begin
    Rx.EmptyTable;
end;

procedure TfmUWMainOutputVedomost.Action1Execute(Sender: TObject);
var
    id_session : int64;
begin
    if not RX.IsEmpty then
    begin
        flag_left  := false;
        flag_right := false;
        SProc.Database           := DBase;
        SProc.Transaction        := TWr;
        TWr.StartTransaction;
        id_session := DBase.Gen_Id('GEN_UW_TEMP_SP', 1);
        try
            RX.First;
            while not RX.Eof do
            begin
                SProc.StoredProcName := 'UW_TEMP_SP_INSERT';
                SProc.Prepare;
                SProc.ParamByName('ID_SESSION').AsInt64  := id_session;
                SProc.ParamByName('ID_VEDOMOST').AsInt64 := RX.FieldByName('id_vedomost').Value;
                SProc.ExecProc;
                RX.Next;
            end;
            ResValue := id_session;
            TWr.Commit;
        except on E:Exception do begin
            TWr.Rollback;
            ShowMessage(E.Message);
            exit;
            end;
        end;
        {VarArrayCreate([0,StringGridSelect.RowCount-2], varVariant);
        For i := 0 to StringGridSelect.RowCount-2 do
        begin
           rec := PRecUnderTree(StringGridSelect.Objects[1, i+1]);
           id := rec.id_vetka;
           number := rec.number;
           name := rec.name;
           ResValue[i]:=VarArrayOf([id, number, name]);
        end;
        }


        flag_left  := true;
        flag_right := true;
        close;
    end;
end;

procedure TfmUWMainOutputVedomost.LoadCaption;
var
    reg : TRegistry;
begin
    reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_CURRENT_USER;
        if  reg.OpenKey('\Software\12303706759837\gnal\v\', False) then
        begin
            index_lang := StrToInt(reg.ReadString('index'));
        end else
            index_lang := 1;
    finally
        reg.Free;
    end;

    Caption                              := UWResourcesUnit.VEDOMOST_CAPTION[index_lang];
    Action2.Caption                      := UWResourcesUnit.MY_CONST_REFRESH[index_lang];
    Action3.Caption                      := UWResourcesUnit.MY_CONST_CLOSE[index_lang];
    Action1.Caption                      := UWResourcesUnit.MY_CONST_CHOOSE[index_lang];


//    AAdd.Hint                            := 'Ins-'    + UWResourcesUnit.MY_CONST_ADD[index_lang];
//    AEdit.Hint                           := 'F2-'     + UWResourcesUnit.MY_CONST_UPDATE[index_lang];
//    ADel.Hint                            := 'Del-'    + UWResourcesUnit.MY_CONST_DELETE[index_lang];
    Action2.Hint                         := 'F5-'     + UWResourcesUnit.MY_CONST_REFRESH[index_lang];
    Action3.Hint                         := 'Esc-'    + UWResourcesUnit.MY_CONST_CLOSE[index_lang];
//    Action1.Hint                           := 'Enter-'  + UWResourcesUnit.MY_CONST_CHOOSE[index_lang];

    cxGrid3DBBandedTableView1DBBandedColumn4.Caption := UWResourcesUnit.VEDOMOST_NOMBER_VEDOM[index_lang];
    cxGrid3DBBandedTableView1DBBandedColumn5.Caption := UWResourcesUnit.VEDOMOST_DATE[index_lang];
    cxGrid3DBBandedTableView1DBBandedColumn6.Caption := UWResourcesUnit.MY_CONST_SUMMA[index_lang];


    cxGrid1DBBandedTableView1DBBandedColumn1.Caption := UWResourcesUnit.VEDOMOST_VN_VEDOMOST[index_lang];
    cxGrid1DBBandedTableView1DBBandedColumn3.Caption := UWResourcesUnit.VEDOMOST_VN_PEESTR[index_lang];
    cxGrid1DBBandedTableView1DBBandedColumn2.Caption := UWResourcesUnit.MY_CONST_SUMMA[index_lang];

    cxGrid1DBBandedTableView1.Bands[0].Caption       := UWResourcesUnit.VEDOMOST_VN_R_GRID[index_lang];
    cxGrid3DBBandedTableView1.Bands[0].Caption       := UWResourcesUnit.VEDOMOST_VN_L_GRID[index_lang];


    cxGridDBTableView1DBColumn1.Caption  := UWResourcesUnit.MY_CONST_FIO[index_lang];
    cxGridDBTableView1DBColumn2.Caption  := UWResourcesUnit.MY_CONST_TAB_NUM[index_lang];
    cxGridDBTableView1DBColumn3.Caption  := UWResourcesUnit.MY_CONST_SCH[index_lang];
    cxGridDBTableView1DBColumn10.Caption := UWResourcesUnit.MY_CONST_SMETA[index_lang];
    cxGridDBTableView1DBColumn4.Caption  := UWResourcesUnit.MY_CONST_RAZD[index_lang];
    cxGridDBTableView1DBColumn5.Caption  := UWResourcesUnit.MY_CONST_STATE[index_lang];
    cxGridDBTableView1DBColumn6.Caption  := UWResourcesUnit.MY_CONST_KEKV[index_lang];
    cxGridDBTableView1DBColumn7.Caption  := UWResourcesUnit.MY_CONST_SUMMA[index_lang];
    cxGridDBTableView1DBColumn8.Caption  := UWResourcesUnit.MY_CONST_LIC_SCH[index_lang];
    cxGridDBTableView1DBColumn9.Caption  := UWResourcesUnit.MY_CONST_COMMENT[index_lang];

    cxLabel1.Caption                     := UWResourcesUnit.VEDOMOST_OTOBRAJAT[index_lang];
    cxLabel2.Caption                     := UWResourcesUnit.MY_CONST_PO[index_lang];


{    dxStatusBar1.Panels[0].Text          := 'Ins-'    + UWResourcesUnit.MY_CONST_ADD[index_lang];
    dxStatusBar1.Panels[1].Text          := 'F2-'     + UWResourcesUnit.MY_CONST_UPDATE[index_lang];
    dxStatusBar1.Panels[2].Text          := 'Del-'    + UWResourcesUnit.MY_CONST_DELETE[index_lang];
    dxStatusBar1.Panels[3].Text          := 'F5-'     + UWResourcesUnit.MY_CONST_REFRESH[index_lang];
    dxStatusBar1.Panels[4].Text          := 'Ctrl+P-' + UWResourcesUnit.MY_CONST_THE_PRINT[index_lang];
    dxStatusBar1.Panels[5].Text          := 'Esc-'    + UWResourcesUnit.MY_CONST_CLOSE[index_lang];
    dxStatusBar1.Panels[6].Text          := 'Enter-'  + UWResourcesUnit.MY_CONST_CHOOSE[index_lang];
}
end;

procedure TfmUWMainOutputVedomost.SelectlangExecuteExecute(
  Sender: TObject);
var
    reg : TRegistry;
begin
    reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_CURRENT_USER;
        if  reg.OpenKey('\Software\12303706759837\gnal\v\',true) then
        begin
            if index_lang + 1 > UWResourcesUnit.IndexLang
                then reg.writeString('index', '1')
                else reg.writeString('index', IntToStr(index_lang + 1));
            reg.CloseKey;
        end
    finally
        reg.Free;
    end;

    LoadCaption;
end;

procedure TfmUWMainOutputVedomost.cxGrid3DBTableView1MouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
    Cell;
end;

procedure TfmUWMainOutputVedomost.Cell;
begin
    if not DS.IsEmpty then
    if cxGrid3DBBandedTableView1.Controller.FocusedRecord.Expandable then
    begin
        cxButton1.Enabled       := false;
        ARightReestr.Enabled := true;
    end else
    begin
        cxButton1.Enabled       := true;
        ARightReestr.Enabled := false;
    end;
end;

procedure TfmUWMainOutputVedomost.cxGrid3DBTableView1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    Cell;
end;

end.
