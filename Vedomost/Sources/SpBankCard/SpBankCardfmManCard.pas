unit SpBankCardfmManCard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, ActnList, ComCtrls, ToolWin,
  cxSplitter, ExtCtrls, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ImgList, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, cxContainer, cxTextEdit, MainSpBankCardUnit,
  cxLabel, FIBQuery, pFIBQuery, pFIBStoredProc, Registry, cxImage;

type
  TfmSpBankCardfmManCard = class(TForm)
    ImageList1: TImageList;
    ActionList1: TActionList;
    Panel1: TPanel;
    cxSplitter1: TcxSplitter;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ActionAddCard: TAction;
    ActionEditCard: TAction;
    ActionDel: TAction;
    ActionRefresh: TAction;
    ActionExit: TAction;
    ToolButton5: TToolButton;
    Panel2: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    Panel3: TPanel;
    Database: TpFIBDatabase;
    DataSetGrid: TpFIBDataSet;
    TransactionRead: TpFIBTransaction;
    TransactionWrite: TpFIBTransaction;
    DataSource1: TDataSource;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn3: TcxGridDBColumn;
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
    cxTextEdit1: TcxTextEdit;
    ActionFind: TAction;
    TimerP: TTimer;
    DataSetCard: TpFIBDataSet;
    DataSource2: TDataSource;
    cxLabel1: TcxLabel;
    Timer1: TTimer;
    cxGrid2DBTableView1DBColumn4: TcxGridDBColumn;
    StoredProc: TpFIBStoredProc;
    SelectLang: TAction;
    ToolButton6: TToolButton;
    ActionTake: TAction;
    cxGrid2DBTableView1DBColumn5: TcxGridDBColumn;
    DataSetCardR_DATE_OPEN: TFIBDateField;
    DataSetCardR_ID_BANKCARD: TFIBStringField;
    DataSetCardR_LIC_BANKSCH: TFIBStringField;
    DataSetCardR_N_COMMENT: TFIBStringField;
    DataSetCardR_ID_DOG_BANKCARD: TFIBBCDField;
    DataSetCardR_FLAG_CLOSE_CARD: TFIBIntegerField;
    DataSetCardR_DATE_DOG: TFIBDateField;
    DataSetCardR_NUM_DOG: TFIBStringField;
    DataSetCardR_SHORTNAME: TFIBStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionFindExecute(Sender: TObject);
    Procedure RefreshMan;
    procedure TimerPTimer(Sender: TObject);
    procedure cxTextEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    function TimeT(t1 : TdateTime; t2 : string): boolean;
    procedure cxGrid2DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ActionAddCardExecute(Sender: TObject);
    procedure ActionExitExecute(Sender: TObject);
    procedure cxGrid2DBTableView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ActionEditCardExecute(Sender: TObject);
    procedure ActionDelExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure LoadCaption;
    procedure SelectLangExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ActionTakeExecute(Sender: TObject);
    procedure cxGrid2DBTableView1DblClick(Sender: TObject);
    procedure cxGrid2DBTableView1DBColumn5CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  private
    find_letter : boolean;
    last_time_refresh : TTime;
    index_lang : smallint;
  public
    id_user : int64;
    Own : TComponent;
    mclass : TMainSpBankCardUnit;
    ResValue : Variant;
    constructor Create(my_class : TMainSpBankCardUnit); reintroduce; overload;
  end;

implementation
uses UWResourcesUnit,
     SpBankCardAddForm;
{$R *.dfm}

constructor TfmSpBankCardfmManCard.Create(my_class : TMainSpBankCardUnit);
begin
    inherited Create(my_class.Owner);
    own        := my_class.Owner;
    id_user    := my_class.id_user;
    mclass     := my_class;
    Database   := my_class.Class_Database;

    TransactionRead.DefaultDatabase := Database;
    Database.DefaultTransaction     := TransactionRead;

    DataSetGrid.Database            := Database;
    DataSetGrid.Transaction         := TransactionRead;

    DataSetCard.Database            := Database;
    DataSetCard.Transaction         := TransactionRead;

    TransactionRead.StartTransaction;
    DataSetCard.SQLs.SelectSQL.Text := 'select * from PUB_BANKCARD_SELECT_INTO_GRID(?ID_MAN, '+IntToStr(my_class.id_dog)+')';

    DataSetGrid.Close;
    DataSetGrid.SQLs.SelectSQL.Text := 'select * from GET_ALL_PEOPLE_LIST(''' + 'А' + ''', null, null, null)';
    DataSetGrid.Open;

    if not mclass.editing then
    begin
        ActionAddCard.Enabled  := false;
        ActionEditCard.Enabled := false;
        ActionDel.Enabled      := false;
    end else
    begin
        ActionTake.Enabled     := false;
    end;
    if mclass.take_result
        then ActionTake.Enabled     := true
        else ActionTake.Enabled     := false;



    LoadCaption;
    find_letter := true;
end;

procedure TfmSpBankCardfmManCard.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TfmSpBankCardfmManCard.ActionFindExecute(Sender: TObject);
begin
    cxTextEdit1.SetFocus;
end;

procedure TfmSpBankCardfmManCard.RefreshMan;
var
    s : string;
    tab_n : integer;
begin
    DataSetGrid.Close;
    if cxTextEdit1.Text = ''
    then
    begin
        DataSetGrid.SQLs.SelectSQL.Text := 'select * from GET_ALL_PEOPLE_LIST(''' + 'А' + ''', null, null, null)';
    end else
    begin
        if TryStrToInt(cxTextEdit1.Text, tab_n) then find_letter := false;
        if find_letter
        then begin
             try s := Ansiuppercase(cxTextEdit1.Text); except s := ''; end;
             DataSetGrid.SQLs.SelectSQL.Text := 'select * from GET_ALL_PEOPLE_LIST(''' + s + ''', null, null, null)';
        end
        else begin
             try tab_n := strToInt(cxTextEdit1.Text); except tab_n := 0; end;
             if tab_n <> 0 then DataSetGrid.SQLs.SelectSQL.Text := 'select * from GET_ALL_PEOPLE_LIST(''' + '' + ''', '+IntToStr(tab_n)+', null, null)';
        end;
    end;
    DataSetGrid.Open;
end;

procedure TfmSpBankCardfmManCard.TimerPTimer(Sender: TObject);
begin
    RefreshMan;
end;

procedure TfmSpBankCardfmManCard.cxTextEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    last_time_refresh := Time;

    if key = vk_return then
    begin
        TimerP.Enabled := false;
        Timer1.Enabled := false;
        cxGrid1.SetFocus;
        RefreshMan;
    end else
    begin
        TimerP.Enabled := true;
        Timer1.Enabled := true;
        if ((Ord(Key) > 48) and (Ord(Key) < 57))
            then find_letter := false
            else find_letter := true;

    end;
end;

procedure TfmSpBankCardfmManCard.Timer1Timer(Sender: TObject);
begin
    if TimeT(last_time_refresh, timeToStr(time)) then
    begin
        TimerP.Enabled := false;
        Timer1.Enabled := false;
    end;
end;


function TfmSpBankCardfmManCard.TimeT(t1 : TdateTime; t2 : string): boolean;
var
    tt1, tt2 : array[1..2] of integer;
    s1, s2 : string;
begin
    s1 := TimeToStr(t1);
    s2 := t2;
    tt1[1] := strtoInt(copy(s1, 1, 2));
    tt1[2] := strtoInt(copy(s1, 7, 2));
//    tt1[3] := strtoInt(copy(s1, 7, 2));
    tt2[1] := strtoInt(copy(s2, 1, 2));
    tt2[2] := strtoInt(copy(s2, 7, 2));
//    tt2[3] := strtoInt(copy(s2, 7, 2));
    if (tt1[1]=tt2[1]) and (abs(tt1[2]-tt2[2])>=1)
        then Result := true
        else Result := false;
//
end;

procedure TfmSpBankCardfmManCard.cxGrid2DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
    Arect : TRect;
begin
    Arect:=AViewInfo.Bounds;
    if (AViewInfo.GridRecord.Values[cxGrid2DBTableView1DBColumn4.Index] = 1) and (not AViewInfo.GridRecord.Focused) then
    begin
        ACanvas.Canvas.Font.Color := RGB(204,107,0);//оранжевый;
        ACanvas.Canvas.Font.Style := [fsStrikeOut];
        ACanvas.Canvas.FillRect(Arect);
        exit;
    end;
    if (not AViewInfo.GridRecord.Focused) then
    begin
        ACanvas.Canvas.Font.Color := RGB(0, 0, 0);//оранжевый;
        ACanvas.Canvas.FillRect(Arect);
    end;
end;

procedure TfmSpBankCardfmManCard.ActionAddCardExecute(Sender: TObject);
var
    id : int64;
    T : TfmSpBankCardAddForm;
begin
    id := -1;
    if not DataSetGrid.IsEmpty then
    begin
        T := TfmSpBankCardAddForm.Create(self, id, self);
        T.ShowModal;
        T.Free;
        LoadCaption;
    end;
end;

procedure TfmSpBankCardfmManCard.ActionExitExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmSpBankCardfmManCard.cxGrid2DBTableView1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if key = VK_DELETE  then ActionDelExecute(Sender);
    if key = VK_F2      then ActionEditCardExecute(Sender);
    if key = VK_RETURN  then ActionTakeExecute(Sender);
end;

procedure TfmSpBankCardfmManCard.ActionEditCardExecute(Sender: TObject);
var
    id : int64;
    T : TfmSpBankCardAddForm;
begin
    id := StrToInt64(DataSetCard.fbn('R_ID_BANKCARD').AsString);
    if not DataSetCard.IsEmpty then
    begin
        T := TfmSpBankCardAddForm.Create(self, id, self);
        T.ShowModal;
        T.Free;
        LoadCaption;
    end;
end;

procedure TfmSpBankCardfmManCard.ActionDelExecute(Sender: TObject);
var
    id_del : int64;
    s : string;
begin
    if not DataSetCard.IsEmpty then
    begin
        s := UWResourcesUnit.MY_CONST_MESSAGE_WARNING[index_lang];
        if MessageBox(Handle, Pchar(UWResourcesUnit.SPBANKCARD_DELETE_BANKCARD[index_lang] + ' № ' + DataSetCard.fbn('R_LIC_BANKSCH').AsString ), Pchar(s), MB_YESNO + MB_DEFBUTTON2) = mrYes then
        begin
            TransactionWrite.DefaultDatabase := Database;
            StoredProc.Database              := Database;
            StoredProc.Transaction           := TransactionWrite;

            TransactionWrite.StartTransaction;

            try
                id_del := StrToInt64(DataSetCard.FBN('R_ID_BANKCARD').AsString);
                StoredProc.StoredProcName    := 'PUB_SP_BANKCARD_PEOPLE_DELETE';
                StoredProc.Prepare;
                StoredProc.ParamByName('ID_BANKCARD').AsInt64    := id_del;
                StoredProc.ExecProc;

                TransactionWrite.Commit;
                ActionRefreshExecute(Sender);
            except on E:Exception do begin
                TransactionWrite.Rollback;
                ShowMessage(E.Message);
            end;
            end;
        end;
    end;
end;

procedure TfmSpBankCardfmManCard.ActionRefreshExecute(Sender: TObject);
var
    id_man_loc : int64;
begin
    try id_man_loc := StrToInt64(DataSetGrid.FBN('ID_MAN').AsString); except id_man_loc := -1; end;
    RefreshMan;
    DataSetGrid.Locate('ID_MAN', id_man_loc, []);
end;

procedure TfmSpBankCardfmManCard.LoadCaption;
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

    cxLabel1.Caption                     := UWResourcesUnit.SPBANKCARD_FIO_TN[index_lang];
    cxGrid1DBTableView1DBColumn1.Caption := UWResourcesUnit.MY_CONST_TAB_NUM[index_lang];
    cxGrid1DBTableView1DBColumn2.Caption := UWResourcesUnit.MY_CONST_FIO[index_lang];

    cxGrid2DBTableView1DBColumn1.Caption := UWResourcesUnit.MY_CONST_LIC_SCH[index_lang];
    cxGrid2DBTableView1DBColumn2.Caption := UWResourcesUnit.MY_CONST_DATE_OPEN[index_lang];
    cxGrid2DBTableView1DBColumn3.Caption := UWResourcesUnit.MY_CONST_COMMENT[index_lang];

    Caption                              := UWResourcesUnit.SPBANKCARD_CAPTION[index_lang];
    ActionAddCard.Caption                := UWResourcesUnit.MY_CONST_ADD[index_lang];
    ActionEditCard.Caption               := UWResourcesUnit.MY_CONST_UPDATE[index_lang];
    ActionDel.Caption                    := UWResourcesUnit.MY_CONST_DELETE[index_lang];
    ActionRefresh.Caption                := UWResourcesUnit.MY_CONST_REFRESH[index_lang];
    ActionExit.Caption                   := UWResourcesUnit.MY_CONST_VIH[index_lang];
    ActionFind.Caption                   := UWResourcesUnit.MY_CONST_FIND[index_lang];
    ActionTake.Caption                   := UWResourcesUnit.MY_CONST_CHOOSE[index_lang];
end;

procedure TfmSpBankCardfmManCard.SelectLangExecute(Sender: TObject);
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

procedure TfmSpBankCardfmManCard.FormActivate(Sender: TObject);
begin
    LoadCaption;
end;

procedure TfmSpBankCardfmManCard.ActionTakeExecute(Sender: TObject);
begin

    if (not DataSetCard.IsEmpty) and (DataSetCard.fbn('R_FLAG_CLOSE_CARD').AsInteger = 0) then
    begin
        ResValue := VarArrayOf([DataSetCard.FieldByName('R_ID_BANKCARD').AsString,
                                DataSetGrid.FieldByName('ID_MAN').AsString,
                                DataSetGrid.FieldByName('FIO').AsString,
                                DataSetCard.FieldByName('R_LIC_BANKSCH').AsString,
                                DataSetCard.FieldByName('R_DATE_OPEN').AsDateTime,
                                DataSetCard.FieldByName('R_N_COMMENT').AsString,
                                DataSetCard.FieldByName('R_FLAG_CLOSE_CARD').AsInteger,
                                DataSetCard.FieldByName('R_ID_DOG_BANKCARD').AsString,
                                DataSetCard.FieldByName('R_DATE_DOG').AsDateTime,
                                DataSetCard.FieldByName('R_NUM_DOG').AsString,
                                DataSetCard.FieldByName('R_SHORTNAME').AsString
                                ]);
        Close;
    end;
end;

procedure TfmSpBankCardfmManCard.cxGrid2DBTableView1DblClick(
  Sender: TObject);
begin
    ActionTakeExecute(Sender);
end;

procedure TfmSpBankCardfmManCard.cxGrid2DBTableView1DBColumn5CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
    if (AviewInfo.GridRecord.Values[cxGrid2DBTableView1DBColumn4.Index] = 1) then
    begin
        ACanvas.FillRect(AViewInfo.Bounds);
        ACanvas.DrawImage(ImageList1, AViewInfo.Bounds.Left + Trunc((AViewInfo.Bounds.Right - AViewInfo.Bounds.Left) / 3),
                          AviewInfo.Bounds.Top, 7);
        ADone := True;
    end;
end;

end.
