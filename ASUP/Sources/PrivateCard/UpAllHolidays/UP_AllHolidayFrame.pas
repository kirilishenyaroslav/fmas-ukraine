unit UP_AllHolidayFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridDBTableView, cxGrid,  cxContainer, cxLabel,
  cxDBLabel, ExtCtrls, Buttons, cxCalendar, cxTL, //Clipbrd,
  cxInplaceContainer, cxTLData, cxDBTL, cxMaskEdit, cxCurrencyEdit,
  cxCheckBox, ActnList, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  Ibase, cxTextEdit, cxDropDownEdit, uFControl, uLabeledFControl,
  uDateControl, cxDBEdit, cxSplitter, cxLookAndFeelPainters, cxButtons;

type
  TfrAllHolidaysPage = class(TFrame)
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
    ActionList1: TActionList;
    BonusesAct: TAction;
    DB: TpFIBDatabase;
    HolidaysSelect: TpFIBDataSet;
    PlanTreeSource: TDataSource;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    HolidaysGrid: TcxGrid;
    ReportDataView: TcxGridDBTableView;
    ReportDataViewDBColumn1: TcxGridDBColumn;
    ReportDataViewDBColumn2: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    ReportDataViewDBColumn7: TcxGridDBColumn;
    Panel2: TPanel;
    cxCheckBox2: TcxCheckBox;
    cxCheckBox3: TcxCheckBox;
    ReportDataViewDBColumn4: TcxGridDBColumn;
    ReportDataViewDBColumn5: TcxGridDBColumn;
    ReportDataViewDBColumn3: TcxGridDBColumn;
    ReportDataViewDBColumn6: TcxGridDBColumn;
    ReportDataViewDBColumn8: TcxGridDBColumn;
    ReportDataViewDBColumn9: TcxGridDBColumn;
    ReportDataViewDBColumn10: TcxGridDBColumn;
    Panel1: TPanel;
    NoteLabel: TLabel;
    SelManHLF: TpFIBDataSet;
    EditNote: TSpeedButton;
    UpdSet: TpFIBDataSet;
    ReportDataViewDBColumn11: TcxGridDBColumn;
    cxCB_ShowOld: TcxCheckBox;
    cxDBTextEdit1: TcxDBTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    cxDBTextEdit8: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    procedure cxCheckBox2PropertiesChange(Sender: TObject);
    procedure cxCheckBox3PropertiesChange(Sender: TObject);
    procedure ReportDataViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ReportDataViewCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure EditNoteClick(Sender: TObject);
    procedure ReportDataViewKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxCB_ShowOldPropertiesChange(Sender: TObject);
  private
    Select_Type: Integer;
  public
    id_pcard:int64;
    procedure MovingsSelectAfterOpen(DataSet: TDataSet);
    constructor Create(AOwner: TComponent;DBHandle:TISC_DB_HANDLE;Id_PCard: Integer; ActualDate: TDate; Select_Type: Integer); reintroduce;
  end;

implementation

{$R *.dfm}

uses uFormControl, Registry, Clipbrd, UpKernelUnit, Math, uHolidayNote;

constructor TfrAllHolidaysPage.Create(AOwner: TComponent;
                                       DBHandle:TISC_DB_HANDLE;
                                       Id_PCard:Integer;
                                       ActualDate:TDate;
                                       Select_Type: Integer);
var D,M,Y,Hour, Min, Sec, MSec :Word;
begin
    inherited Create(AOwner);
    cxCheckBox3.Checked:=False;
    DecodeDate(Date,Y,M,D);
    DecodeTime(Time,Hour, Min, Sec, MSec);
    self.Name:=self.Name+IntToStr(Y)+IntToStr(M)+IntToStr(D)+IntToStr(Hour)+IntToStr(Min)+IntToStr(Sec);


    DB.Handle:=DBHandle;

    ReadTransaction.StartTransaction;

    HolidaysSelect.SelectSQL.Text:=' SELECT * FROM UP_KER_GET_RHOLIDAYS_BY_PCARD('+IntToStr(id_pcard)+','+IntToStr(Integer(not cxCB_ShowOld.Checked))+')';

    self.id_pcard:=Id_PCard;

    HolidaysSelect.Open;

    ReportDataView.ViewData.Expand(true);
    {if VarIsNull(HolidaysSelect['NOTE']) then NoteLabel.Caption:=''
    else NoteLabel.Caption:=HolidaysSelect['NOTE'];  }
end;



procedure TfrAllHolidaysPage.MovingsSelectAfterOpen(DataSet: TDataSet);
begin
end;

procedure TfrAllHolidaysPage.cxCheckBox2PropertiesChange(Sender: TObject);
var I:Integer;
begin
     for i:=0 to ReportDataView.ColumnCount-1 do
     begin
          ReportDataView.Columns[i].Options.Filtering:=cxCheckBox2.Checked;
     end;
end;

procedure TfrAllHolidaysPage.cxCheckBox3PropertiesChange(Sender: TObject);
begin
     ReportDataView.OptionsView.GroupByBox:=cxCheckBox3.Checked;
end;

procedure TfrAllHolidaysPage.ReportDataViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if (( Key = VK_F12) and (ssShift in Shift))
     then begin
               ShowInfo(HolidaysSelect);
     end;
     SelManHLF.Close;
     SelManHLF.SQLs.SelectSQL.Text:='select * from hl_dt_man_holiday_fact where ID_MAN_HOLIDAY_FACT=:id_m_hl_fact';
     SelManHLF.ParamByName('id_m_hl_fact').AsInteger:=HolidaysSelect['ID_MAN_HOLIDAY_FACT'];
     SelManHLF.Open;
     If VarIsNull(SelManHLF['NOTE']) then NoteLabel.Caption:=''
     else NoteLabel.Caption:=SelManHLF['NOTE'];
end;

procedure TfrAllHolidaysPage.ReportDataViewCellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
    SelManHLF.Close;
    SelManHLF.SQLs.SelectSQL.Text:='select * from hl_dt_man_holiday_fact where ID_MAN_HOLIDAY_FACT=:id_m_hl_fact';
    SelManHLF.ParamByName('id_m_hl_fact').AsInteger:=HolidaysSelect['ID_MAN_HOLIDAY_FACT'];
    SelManHLF.Open;
    If VarIsNull(SelManHLF['NOTE']) then NoteLabel.Caption:=''
    else NoteLabel.Caption:=SelManHLF['NOTE'];
end;

procedure TfrAllHolidaysPage.EditNoteClick(Sender: TObject);
Var frm:TfrmNote;
id_m_hf:Integer;
begin
    SelManHLF.Close;
    SelManHLF.SQLs.SelectSQL.Text:='select * from hl_dt_man_holiday_fact where ID_MAN_HOLIDAY_FACT=:id_m_hl_fact';
    SelManHLF.ParamByName('id_m_hl_fact').AsInteger:=HolidaysSelect['ID_MAN_HOLIDAY_FACT'];
    SelManHLF.Open;
    id_m_hf:=SelManHLF['ID_MAN_HOLIDAY_FACT'];
    frm:=TfrmNote.Create(Self);
    if VarIsNull(SelManHLF['NOTE']) then frm.NoteEdit.Text:=''
    else frm.NoteEdit.Text:=SelManHLF['NOTE'];
    if frm.ShowModal=mrOk then
    begin
        UpdSet.Close;
        UpdSet.SQLs.SelectSQL.Text:='update HL_DT_MAN_HOLIDAY_FACT mhf set mhf.note=:note where mhf.ID_MAN_HOLIDAY_FACT=:id_mh_f';
        UpdSet.ParamByName('note').AsString:=frm.NoteEdit.Text;
        UpdSet.ParamByName('id_mh_f').AsInteger:=id_m_hf;
        UpdSet.Open;
        UpdSet.Transaction.Commit;
    end;
    frm.Free;
    HolidaysSelect.CloseOpen(True);
    HolidaysSelect.Locate('id_man_holiday_fact',id_m_hf,[]);
    SelManHLF.Close;
    SelManHLF.SQLs.SelectSQL.Text:='select * from hl_dt_man_holiday_fact where ID_MAN_HOLIDAY_FACT=:id_m_hl_fact';
    SelManHLF.ParamByName('id_m_hl_fact').AsInteger:=id_m_hf;
    SelManHLF.Open;
    If VarIsNull(SelManHLF['NOTE']) then NoteLabel.Caption:=''
    else NoteLabel.Caption:=SelManHLF['NOTE'];
     ReportDataView.ViewData.Expand(true);  
end;

procedure TfrAllHolidaysPage.ReportDataViewKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    SelManHLF.Close;
    SelManHLF.SQLs.SelectSQL.Text:='select * from hl_dt_man_holiday_fact where ID_MAN_HOLIDAY_FACT=:id_m_hl_fact';
    SelManHLF.ParamByName('id_m_hl_fact').AsInteger:=HolidaysSelect['ID_MAN_HOLIDAY_FACT'];
    SelManHLF.Open;
    If VarIsNull(SelManHLF['NOTE']) then NoteLabel.Caption:=''
    else NoteLabel.Caption:=SelManHLF['NOTE'];
end;

procedure TfrAllHolidaysPage.cxCB_ShowOldPropertiesChange(Sender: TObject);
begin
  if HolidaysSelect.Active
     then HolidaysSelect.Close;

     HolidaysSelect.SelectSQL.Text:=' SELECT * FROM UP_KER_GET_RHOLIDAYS_BY_PCARD('+IntToStr(id_pcard)+','+IntToStr(Integer(not cxCB_ShowOld.Checked))+')';

     HolidaysSelect.Open;

     ReportDataView.ViewData.Expand(true);
end;

end.
