unit IniTypeStage_Add_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxCurrencyEdit, cxGroupBox,
  cnConsts, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid, RxMemDS,
  cxClasses, cxTL, DM_IniTypeStage, FIBDataSet, pFIBDataSet, cnConsts_Messages,
  cxLabel, cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TfrmIniTypeStage_AE = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    NameStage_Edit: TcxTextEdit;
    kol_parts_Edit: TcxCurrencyEdit;
    NameStage_Label: TLabel;
    CntMonth_Label: TLabel;
    Styles: TcxStyleRepository;
    BackGround: TcxStyle;
    FocusedRecord: TcxStyle;
    Header: TcxStyle;
    DesabledRecord: TcxStyle;
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
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    cxStyle47: TcxStyle;
    cxStyle48: TcxStyle;
    cxStyle49: TcxStyle;
    cxStyle50: TcxStyle;
    cxStyle51: TcxStyle;
    cxStyle52: TcxStyle;
    cxStyle53: TcxStyle;
    cxStyle54: TcxStyle;
    cxStyle55: TcxStyle;
    cxStyle56: TcxStyle;
    cxStyle57: TcxStyle;
    testColorStyle: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    MemoryData: TRxMemoryData;
    DataSourceSumm: TDataSource;
    cxGridKursSumm: TcxGrid;
    cxGridKursSummDBTableView1: TcxGridDBTableView;
    TableID: TcxGridDBColumn;
    TableMonth: TcxGridDBColumn;
    cxGridKursSummLevel1: TcxGridLevel;
    MemoryDatamrID: TIntegerField;
    MemoryDatamrMonth: TIntegerField;
    DataSet_parts: TpFIBDataSet;
    MemoryDataMrid_term_stage: TIntegerField;
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure NameStage_EditKeyPress(Sender: TObject; var Key: Char);
    procedure kol_parts_EditKeyPress(Sender: TObject; var Key: Char);
    procedure kol_parts_EditExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Select_for_Edit(id:int64);
    procedure get_parts(id_type_stage:int64);
  private
    PLanguageIndex : byte;
    procedure FormIniLanguage();
  public
    constructor Create(AOwner:TComponent; LanguageIndex : byte);reintroduce;
  end;

var
  frmIniTypeStage_AE: TfrmIniTypeStage_AE;

implementation

{$R *.dfm}
constructor TfrmIniTypeStage_AE.Create(AOwner:TComponent; LanguageIndex : byte);
begin
  Screen.Cursor:=crHourGlass;
  inherited Create(AOwner);
  PLanguageIndex:= LanguageIndex;
  FormIniLanguage();
  Screen.Cursor:=crDefault;
end;

procedure TfrmIniTypeStage_AE.Select_for_Edit(id : int64);
Begin
  DataSet_parts.Close;
  DataSet_parts.SQLs.SelectSQL.Text:='Select * from CN_INI_TYPE_STAGE_MONTH where ID_TYPE_STAGE=:ID_TYPE_STAGE';
  DataSet_parts.ParamByName('ID_TYPE_STAGE').AsInt64:= id;
  DataSet_parts.Open;
  DataSet_parts.FetchAll;
End;

procedure TfrmIniTypeStage_AE.FormIniLanguage;
begin
  NameStage_Label.caption:=    cnConsts.cn_Name_Column[PLanguageIndex];
  CntMonth_Label.caption:=     'Кількість частин';//cnConsts.cn_cntMonth_Column[PLanguageIndex];

  OkButton.Caption:=        cnConsts.cn_Accept[PLanguageIndex];
  CancelButton.Caption:=    cnConsts.cn_Cancel[PLanguageIndex];
end;

procedure TfrmIniTypeStage_AE.CancelButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmIniTypeStage_AE.Get_parts(id_type_stage:Int64);
var
  i:integer;
begin
  DataSet_parts.Close;
  DataSet_parts.SQLs.SelectSQL.Text:='SELECT * FROM CN_INI_TERM_STAGE WHERE id_type_stage=:id order by N_PART';
  DataSet_parts.ParamByName('id').asint64:= id_type_stage;
  DataSet_parts.Open;
  DataSet_parts.FetchAll;

  if DataSet_parts.IsEmpty then Exit;

  MemoryData.First;
  for i:=1 to MemoryData.RecordCount do
   Begin
     MemoryData.Delete;
     MemoryData.Next;
  end;

  DataSet_parts.First;
  MemoryData.First;
  For i:=1 to DataSet_parts.RecordCount do
   Begin
    MemoryData.Open;
    MemoryData.Insert;
    MemoryData.FieldByName('mrID').AsInteger:=i;
    MemoryData.FieldByName('mrMonth').AsInteger:=DataSet_parts['CNT_MONTH'];
    MemoryData.Post;
    MemoryData.Next;
    DataSet_parts.Next;
   End;
End;

procedure TfrmIniTypeStage_AE.OkButtonClick(Sender: TObject);
Var
  s,i:integer;
begin
  if NameStage_Edit.Text='' then
   Begin
    ShowMessage(cn_Name_Need[PLanguageIndex]);
    Exit;
   end;

  s:=0;
  MemoryData.first;
  For i:=1 to MemoryData.RecordCount do
   Begin
    s:=s+MemoryData['mrMonth'];
    MemoryData.next;
   End;

  If s <= 0 then
   Begin
    ShowMessage('Сумма частин пованна бути більше 0!');
    exit;
   End;
   
  ModalResult:=mrOk;
end;

procedure TfrmIniTypeStage_AE.FormShow(Sender: TObject);
begin
  NameStage_Edit.SetFocus;
end;

procedure TfrmIniTypeStage_AE.NameStage_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then kol_parts_Edit.SetFocus;
end;

procedure TfrmIniTypeStage_AE.kol_parts_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then OkButton.SetFocus;
end;

procedure TfrmIniTypeStage_AE.kol_parts_EditExit(Sender: TObject);
Var
  i:integer;
  k:integer;
begin
  MemoryData.Close;
  If kol_parts_Edit.EditValue<0 then kol_parts_Edit.EditValue:=0;

  K:=kol_parts_Edit.EditValue;

  if K=0 then K:=1;

  MemoryData.EmptyTable;
  For i:=0 to K-1 do
   Begin
    MemoryData.Open;
    MemoryData.Insert;
    MemoryData.FieldByName('mrid').AsInteger := k-i;
    MemoryData.FieldByName('mrMonth').AsInteger := 0;
    MemoryData.Post;
    MemoryData.Next;
   End;
  MemoryData.First;
  MemoryData.Open;
end;

procedure TfrmIniTypeStage_AE.FormCreate(Sender: TObject);
begin
  kol_parts_EditExit(self);
end;

end.
