unit HospReestrFill_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, FIBDatabase, pFIBDatabase, FIBQuery,
  pFIBQuery, pFIBStoredProc, Menus, IBStoredProc, IBCustomDataSet, IBQuery,
  Buttons, StdCtrls, ExtCtrls, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls, z_dmCommonStyles,
  cxGridCustomView, cxGrid, FIBDataSet, pFIBDataSet, dxBar, dxBarExtItems, IBase,
  dxStatusBar, Unit_zGlobal_Consts, zcxLocateBar;

const LabelListCount               :array[1..2] of string = ('Кількість листів','Количество листов');
const GridClSeria_Caption          :array[1..2] of string = ('Серія','Серия');
const AllToReestrBtn_Caption          :array[1..2] of string = ('Включити всі лікарняні в реєстр','Включить все больничные в реестр');
const OneToReestrBtn_Caption          :array[1..2] of string = ('Включити цей лікарняний в реєстр','Включить этот больничный в реестр');
const OneFromReestrBtn_Caption        :array[1..2] of string = ('Виключити цей лікарняний з реєстра','Исключить этот больничный из реестра');
const AllFromReestrBtn_Caption        :array[1..2] of string = ('Виключити всі лікарняні з реєстра','Исключить все больничные из реестра');

type
  TfHospReestrFill = class(TForm)
    RepHospGridDBTV: TcxGridDBTableView;
    RepHospGridLevel1: TcxGridLevel;
    RepHospGrid: TcxGrid;
    Label1: TLabel;
    HospListDataSource: TDataSource;
    ListSource: TDataSource;
    RepHospGridDBTVDATE_BEG: TcxGridDBColumn;
    RepHospGridDBTVDATE_END: TcxGridDBColumn;
    RepHospGridDBTVSERIA: TcxGridDBColumn;
    RepHospGridDBTVNOMER: TcxGridDBColumn;
    RepHospGridDBTVFIO: TcxGridDBColumn;
    RepHospGridDBTVTN: TcxGridDBColumn;
    PopupMenu: TPopupMenu;
    AddAllItem: TMenuItem;
    RemoveAllItem: TMenuItem;
    Panel1: TPanel;
    HospListGrid: TcxGrid;
    HospListGridDBTV: TcxGridDBTableView;
    HospListGridDBTVTN: TcxGridDBColumn;
    HospListGridDBTVFIO: TcxGridDBColumn;
    HospListGridDBTVDATE_BEG: TcxGridDBColumn;
    HospListGridDBTVDATE_END: TcxGridDBColumn;
    HospListGridDBTVSERIA: TcxGridDBColumn;
    HospListGridDBTVNOMER: TcxGridDBColumn;
    HospListGridLevel1: TcxGridLevel;
    HospListGridDBTVPERCENT: TcxGridDBColumn;
    Splitter1: TSplitter;
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    HospListQuery: TpFIBDataSet;
    AddHospToReestrProc: TpFIBStoredProc;
    ListQuery: TpFIBDataSet;
    DelHospFromReestrProc: TpFIBStoredProc;
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    BarDockControl: TdxBarDockControl;
    AllToReestrBtn: TdxBarLargeButton;
    OneToReestrBtn: TdxBarLargeButton;
    OneFromReestrBtn: TdxBarLargeButton;
    AllFromReestrBtn: TdxBarLargeButton;
    RepHospGridDBTVPERCENT: TcxGridDBColumn;
    Panel2: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure HospListGridDBTVDblClick(Sender: TObject);
    procedure AddAllItemClick(Sender: TObject);
    procedure RepHospGridDBTVDblClick(Sender: TObject);
    procedure RemoveAllItemClick(Sender: TObject);
    procedure DetailsButtonClick(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure OneToReestrBtnClick(Sender: TObject);
    procedure AllToReestrBtnClick(Sender: TObject);
    procedure OneFromReestrBtnClick(Sender: TObject);
    procedure AllFromReestrBtnClick(Sender: TObject);
    procedure HospListGridDBTVKeyPress(Sender: TObject; var Key: Char);
    procedure RepHospGridDBTVKeyPress(Sender: TObject; var Key: Char);
  private
    pLanguageIndex: Byte;
    pIdReestr: Integer;
    pStylesDM: TStylesDM;
   Procedure AddToList(IdHosp:Integer);
   procedure RemoveFromList(IdHosp:Integer);
  public
    constructor Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;IdReestr:Integer); reintroduce;
  end;

implementation

{$R *.dfm}

uses zProc;

constructor TfHospReestrFill.Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;IdReestr:Integer);
begin
  inherited Create(AOwner);
  pLanguageIndex:=LanguageIndex;
  pIdReestr:=IdReestr;
//******************************************************************************
  pStylesDM:=TStylesDM.Create(Self);
  HospListGridDBTV.Styles.StyleSheet:=pStylesDM.GridTableViewStyleSheetDevExpress;
  RepHospGridDBTV.Styles.StyleSheet :=pStylesDM.GridTableViewStyleSheetDevExpress;
//******************************************************************************
  DB.Handle:=ADB_Handle;
  ReadTransaction.Active:=True;
  RefreshBtnClick(self);
//******************************************************************************
  RepHospGridDBTVTN.Caption       := GridClTn_Caption[pLanguageIndex];
  RepHospGridDBTVFIO.Caption      := GridClFIO_Caption[pLanguageIndex];
  RepHospGridDBTVDATE_BEG.Caption := GridClBegPeriod_Caption[pLanguageIndex];
  RepHospGridDBTVDATE_END.Caption := GridClEndPeriod_Caption[pLanguageIndex];
  RepHospGridDBTVNOMER.Caption    := GridClNumber_Caption[pLanguageIndex];
  RepHospGridDBTVSERIA.Caption    := GridClSeria_Caption[pLanguageIndex];
  RepHospGridDBTVPERCENT.Caption := GridClPercentSiqn_Caption[pLanguageIndex];
  with RepHospGridDBTV.DataController.Summary.FooterSummaryItems.Items[0] do
    Format:=LabelListCount[pLanguageIndex]+' - '+Format;
//******************************************************************************
  HospListGridDBTVTN.Caption       := GridClTn_Caption[pLanguageIndex];
  HospListGridDBTVFIO.Caption      := GridClFIO_Caption[pLanguageIndex];
  HospListGridDBTVDATE_BEG.Caption := GridClBegPeriod_Caption[pLanguageIndex];
  HospListGridDBTVDATE_END.Caption := GridClEndPeriod_Caption[pLanguageIndex];
  HospListGridDBTVNOMER.Caption    := GridClNumber_Caption[pLanguageIndex];
  HospListGridDBTVSERIA.Caption    := GridClSeria_Caption[pLanguageIndex];
  HospListGridDBTVPERCENT.Caption  := GridClPercentSiqn_Caption[pLanguageIndex];
  with HospListGridDBTV.DataController.Summary.FooterSummaryItems.Items[0] do
    Format:=LabelListCount[pLanguageIndex]+' - '+Format;
//******************************************************************************
  ExitBtn.Caption    := ExitBtn_Caption[pLanguageIndex];
  RefreshBtn.Caption := RefreshBtn_Caption[pLanguageIndex];
  AllToReestrBtn.Caption := AllToReestrBtn_Caption[pLanguageIndex];
  OneToReestrBtn.Caption := OneToReestrBtn_Caption[pLanguageIndex];
  OneFromReestrBtn.Caption := OneFromReestrBtn_Caption[pLanguageIndex];
  AllFromReestrBtn.Caption := AllFromReestrBtn_Caption[pLanguageIndex];
//******************************************************************************
end;


procedure TfHospReestrFill.RemoveFromList(IdHosp:Integer);
begin
    DelHospFromReestrProc.ParamByName('Id_Reestr').Value:=pIdReestr;
    DelHospFromReestrProc.ParamByName('Id_Hosp').Value:=IdHosp;
    WriteTransaction.StartTransaction;
    DelHospFromReestrProc.ExecProc;
    WriteTransaction.Commit;

    ListQuery.DeleteSQL.Text:='execute procedure Z_EMPTY_PROC';
    ListQuery.Delete;

    HospListQuery.First;
    HospListQuery.SQLs.InsertSQL.Text := 'execute procedure Z_EMPTY_PROC';
    HospListQuery.SQLs.RefreshSQL.Text := 'select * from Z_GET_HOSP_BY_ID('+IntToStr(IdHosp)+')';
    HospListQuery.Insert;
    HospListQuery['ID_HOSP']:=IdHosp;
    HospListQuery.Post;
    HospListQuery.SQLs.InsertSQL.Clear;
    HospListQuery.SQLs.RefreshSQL.Clear;
end;


procedure TfHospReestrFill.AddToList(IdHosp:Integer);
begin
    AddHospToReestrProc.ParamByName('Id_Reestr').Value:=pIdReestr;
    AddHospToReestrProc.ParamByName('Id_Hosp').Value:=IdHosp;
    WriteTransaction.StartTransaction;
    AddHospToReestrProc.ExecProc;
    WriteTransaction.Commit;

    ListQuery.First;
    ListQuery.SQLs.InsertSQL.Text := 'execute procedure Z_EMPTY_PROC';
    ListQuery.SQLs.RefreshSQL.Text := 'select * from Z_GET_HOSP_BY_ID('+IntToStr(IdHosp)+')';
    ListQuery.Insert;
    ListQuery['ID_HOSP']:=IdHosp;
    ListQuery.Post;
    ListQuery.SQLs.InsertSQL.Clear;
    ListQuery.SQLs.RefreshSQL.Clear;

    HospListQuery.DeleteSQL.Text:='execute procedure Z_EMPTY_PROC';
    HospListQuery.Delete;
end;


procedure TfHospReestrFill.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action:=caFree;
end;

procedure TfHospReestrFill.HospListGridDBTVDblClick(Sender: TObject);
begin
       AddToList(HospListQuery['Id_Hosp']);
end;
procedure TfHospReestrFill.AddAllItemClick(Sender: TObject);
var
i,c:integer;
begin
   c:=HospListQuery.RecordCount;
   HospListQuery.First;

   for i:=1 to c do
   begin
         AddToList(HospListQuery['Id_Hosp']);
         Application.ProcessMessages;
   end;
end;

procedure TfHospReestrFill.RepHospGridDBTVDblClick(Sender: TObject);
begin

  if (not ListQuery.IsEmpty) then
    begin
        RemoveFromList(ListQuery['Id_Hosp']);
    end;

end;

procedure TfHospReestrFill.RemoveAllItemClick(Sender: TObject);
begin
    ListQuery.First;
    While(not ListQuery.IsEmpty) do
    begin
        RemoveFromList(ListQuery['Id_Hosp']);
        Application.ProcessMessages;

    end;
end;

procedure TfHospReestrFill.DetailsButtonClick(Sender: TObject);
begin
{ if not HospListQuery.IsEmpty then
   begin
     form:=TEditHospForm.Create(Self);
     form.IDPCARD:=HospListQuery['ID_PCARD'];
     form.Prepare(emView,HospListQuery['ID_HOSP']);
     form.ShowModal;

    end; }
end;


procedure TfHospReestrFill.ExitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TfHospReestrFill.RefreshBtnClick(Sender: TObject);
begin
  if HospListQuery.Active then HospListQuery.Close;
  if ListQuery.Active  then ListQuery.Close;
  HospListQuery.SQLs.SelectSQL.Text:='SELECT * FROM Z_GET_HOSP_FOR_REESTR(-1,NULL) ORDER BY tn';
  ListQuery.SQLs.SelectSQL.Text :='SELECT * FROM Z_GET_HOSP_IN_REESTR('+IntToStr(pIdReestr)+') ORDER BY tn';
  HospListQuery.Open;
  HospListQuery.First;
  ListQuery.Open;
  ListQuery.First;
end;

procedure TfHospReestrFill.FormResize(Sender: TObject);
begin
  Panel1.Width:=Width div 2;
end;

procedure TfHospReestrFill.OneToReestrBtnClick(Sender: TObject);
begin
  HospListGridDBTVDblClick(Self);
end;

procedure TfHospReestrFill.AllToReestrBtnClick(Sender: TObject);
begin
  AddAllItemClick(Self);
end;

procedure TfHospReestrFill.OneFromReestrBtnClick(Sender: TObject);
begin
  RepHospGridDBTVDblClick(Self);
end;

procedure TfHospReestrFill.AllFromReestrBtnClick(Sender: TObject);
begin
  RemoveAllItemClick(Self);
end;

procedure TfHospReestrFill.HospListGridDBTVKeyPress(Sender: TObject;
  var Key: Char);
begin
 If (Key in ['0'..'9']) then
  begin
   if (HospListGridDBTV.OptionsBehavior.IncSearchItem<>HospListGridDBTVTN)then
    begin
     HospListGridDBTV.Controller.IncSearchingText   := '';
     HospListGridDBTV.OptionsBehavior.IncSearchItem := HospListGridDBTVTN;
    end
  end
 else
  if (HospListGridDBTV.OptionsBehavior.IncSearchItem<>HospListGridDBTVFIO)then
   begin
    HospListGridDBTV.Controller.IncSearchingText   := '';
    HospListGridDBTV.OptionsBehavior.IncSearchItem := HospListGridDBTVFIO;
   end;

end;

procedure TfHospReestrFill.RepHospGridDBTVKeyPress(Sender: TObject;
  var Key: Char);
begin
 If (Key in ['0'..'9']) then
  begin
   if (RepHospGridDBTV.OptionsBehavior.IncSearchItem<>RepHospGridDBTVTN)then
    begin
     RepHospGridDBTV.Controller.IncSearchingText   := '';
     RepHospGridDBTV.OptionsBehavior.IncSearchItem := RepHospGridDBTVTN;
    end
  end
 else
  if (RepHospGridDBTV.OptionsBehavior.IncSearchItem<>RepHospGridDBTVFIO)then
   begin
    RepHospGridDBTV.Controller.IncSearchingText   := '';
    RepHospGridDBTV.OptionsBehavior.IncSearchItem := RepHospGridDBTVFIO;
   end;

end;

end.
