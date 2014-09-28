unit UP_uBonusFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridDBTableView, cxGrid, Buttons, ExtCtrls,
  ActnList, ComCtrls,  uCommonSp, Mask,
  CheckEditUnit, cxContainer, cxLabel, cxDBLabel, cxCheckBox, cxTL,
  cxInplaceContainer, cxTLData, cxDBTL, cxMaskEdit, cxCalendar,
  FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, Ibase, uFControl,
  uLabeledFControl, uDateControl, cxTextEdit, cxSplitter, cxDBEdit,
  cxDropDownEdit, cxButtonEdit;

type

  TfmPCardBonusPage = class(TFrame)
    WriteTransaction: TpFIBTransaction;
    BonusSelect: TpFIBDataSet;
    BonusSource: TDataSource;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    Panel2: TPanel;
    cxCheckBox1: TcxCheckBox;
    cxCheckBox2: TcxCheckBox;
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
    ItemsGrid: TcxGrid;
    ReportDataView: TcxGridDBTableView;
    ReportDataViewDBColumn1: TcxGridDBColumn;
    ReportDataViewDBColumn2: TcxGridDBColumn;
    ReportDataViewDBColumn7: TcxGridDBColumn;
    DateBegCol: TcxGridDBColumn;
    DateEndCol: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    ReportDataViewDBColumn3: TcxGridDBColumn;
    Panel1: TPanel;
    Panel3: TPanel;
    cxGrid1: TcxGrid;
    SmView: TcxGridDBTableView;
    SmViewDBColumn2: TcxGridDBColumn;
    cxGridDBColumn1: TcxGridDBColumn;
    SmViewDBColumn1: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxSplitter1: TcxSplitter;
    SmetsDataSet: TpFIBDataSet;
    SmetsDataSource: TDataSource;
    OnDateEx: TcxDateEdit;
    pgc1: TPageControl;
    ts1: TTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    bvl1: TBevel;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit8: TcxDBTextEdit;
    cxDBTextEdit9: TcxDBTextEdit;
    cxDBTextEdit10: TcxDBTextEdit;
    cxDBTextEdit11: TcxDBTextEdit;
    cxDBTextEdit12: TcxDBTextEdit;
    cxCheckBox5: TcxCheckBox;
    LevelEdit: TcxButtonEdit;
    procedure BonusGridDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
    procedure cxCheckBox2PropertiesChange(Sender: TObject);
    procedure ReportDataViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SmViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure OnDatePropertiesChange(Sender: TObject);
    procedure cxCheckBox5PropertiesChange(Sender: TObject);
    procedure LevelEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
    id_level:Integer;
  public
    id_pcard:integer;
    constructor Create(AOwner: TComponent; DbHandle:TISC_DB_HANDLE ;Id_PC: Integer; modify :integer; ActualDate: TDate); reintroduce;
  end;

implementation

uses Registry, UpKernelUnit, uUnivSprav, RxmemDs;

{$R *.dfm}

constructor TfmPCardBonusPage.Create(AOwner: TComponent;DbHandle:TISC_DB_HANDLE; Id_PC: Integer; modify :integer; ActualDate: TDate);
var D,M,Y,Hour, Min, Sec, MSec :Word;
    DefLevevInfoDS:TpFIBDataSet;
begin
    inherited Create(AOwner);
    DecodeDate(Date,Y,M,D);
    DecodeTime(Time,Hour, Min, Sec, MSec);
    self.Name:=self.Name+IntToStr(Y)+IntToStr(M)+IntToStr(D)+IntToStr(Hour)+IntToStr(Min)+IntToStr(Sec);

    self.WorkDatabase.Handle:=DbHandle;
    ReadTransaction.StartTransaction;

    DefLevevInfoDS:=TpFIBDataSet.Create(self);
    DefLevevInfoDS.Database:=WorkDatabase;
    DefLevevInfoDS.Transaction:=ReadTransaction;
    DefLevevInfoDS.SelectSQL.Text:='SELECT * FROM UP_KER_UTIL_GET_DEF_LEVEL';
    DefLevevInfoDS.Open;
    if (DefLevevInfoDS.RecordCount>0)
    then begin
              LevelEdit.Text:=DefLevevInfoDS.FieldByName('LEVEL_NAME').AsString;
              id_level:=DefLevevInfoDS.FieldByName('ID_LEVEL').Value;
    end;
    DefLevevInfoDS.Close;
    DefLevevInfoDS.Free;

    id_pcard:=Id_PC;

    SmetsDataSet.SelectSQL.Text:='SELECT * FROM UP_KER_GET_BONUS_SMET_INFO(?ID_MAN_BONUS)';

    BonusSelect.ParamByName('Id_PCard').AsInteger := Id_PCard;

    if (not cxCheckBox1.Checked)
    then BonusSelect.ParamByName('Act_date').AsDate    :=Date
    else BonusSelect.ParamByName('Act_date').Value     :=null;

    if cxCheckBox5.Checked
    then BonusSelect.ParamByName('id_level').value:=id_level
    else BonusSelect.ParamByName('id_level').value:=null;

    BonusSelect.Open;

    if not cxCheckBox1.Checked
    then begin
              ReportDataView.ViewData.Expand(true);
    end
    else begin
              ReportDataView.ViewData.Collapse(true);
    end;

    ActualDate:=Date;
    OnDateEx.Visible:=not cxCheckBox1.Checked;
    Self.OnDateEx.Date := ActualDate;
end;



procedure TfmPCardBonusPage.BonusGridDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if  (( Key = VK_F12) and (ssShift in Shift))
  then ShowInfo(BonusSelect);
end;

procedure TfmPCardBonusPage.cxCheckBox1PropertiesChange(Sender: TObject);
begin
    Screen.Cursor:=crHourGlass;

    OnDateEx.Visible:=not cxCheckBox1.Checked;

    if BonusSelect.Active then BonusSelect.Close;

    BonusSelect.ParamByName('Id_PCard').AsInteger :=Id_PCard;

    if not cxCheckBox1.Checked
    then begin
              BonusSelect.ParamByName('Act_date').AsDate:=OnDateEx.Date;
    end
    else begin
              BonusSelect.ParamByName('Act_date').Value :=null;
    end;
    
    BonusSelect.Open;

    if not cxCheckBox1.Checked
    then begin
              ReportDataView.ViewData.Expand(true);
    end
    else begin
              ReportDataView.ViewData.Collapse(true);
    end;

    Screen.Cursor:=crDefault;
end;

procedure TfmPCardBonusPage.cxCheckBox2PropertiesChange(Sender: TObject);
begin
     Panel3.Visible:=cxCheckBox2.Checked;
     cxSplitter1.Visible:=cxCheckBox2.Checked;

     if cxCheckBox1.Checked
     then begin
               cxSplitter1.Top:=Panel3.Top-1;
     end;

end;

procedure TfmPCardBonusPage.ReportDataViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if (( Key = VK_F12) and (ssShift in Shift))
     then begin
               ShowInfo(BonusSelect);
     end;
end;

procedure TfmPCardBonusPage.SmViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (( Key = VK_F12) and (ssShift in Shift))
     then begin
               ShowInfo(SmetsDataSet);
     end;

end;

procedure TfmPCardBonusPage.OnDatePropertiesChange(Sender: TObject);
begin
    Screen.Cursor:=crHourGlass;
    if BonusSelect.Active then BonusSelect.Close;
    BonusSelect.ParamByName('Id_PCard').AsInteger :=Id_PCard;
    if not cxCheckBox1.Checked
    then begin
              BonusSelect.ParamByName('Act_date').AsDate    :=OnDateEx.Date;
    end
    else begin
              BonusSelect.ParamByName('Act_date').Value     :=null;
    end;

    if cxCheckBox5.Checked
    then BonusSelect.ParamByName('ID_LEVEL').Value     :=id_level
    else BonusSelect.ParamByName('ID_LEVEL').Value     :=null;

    BonusSelect.Open;

    if not cxCheckBox1.Checked
    then begin
              ReportDataView.ViewData.Expand(true);
    end
    else begin
              ReportDataView.ViewData.Collapse(true);
    end;

    Screen.Cursor:=crDefault;

end;

procedure TfmPCardBonusPage.cxCheckBox5PropertiesChange(Sender: TObject);
begin
    LevelEdit.Enabled:=cxCheckBox5.Checked;


    Screen.Cursor:=crHourGlass;
    if BonusSelect.Active then BonusSelect.Close;
    BonusSelect.ParamByName('Id_PCard').AsInteger :=Id_PCard;
    if not cxCheckBox1.Checked
    then begin
              BonusSelect.ParamByName('Act_date').AsDate    :=OnDateEx.Date;
    end
    else begin
              BonusSelect.ParamByName('Act_date').Value     :=null;
    end;

    if cxCheckBox5.Checked
    then BonusSelect.ParamByName('ID_LEVEL').Value     :=id_level
    else BonusSelect.ParamByName('ID_LEVEL').Value     :=null;

    BonusSelect.Open;

    if not cxCheckBox1.Checked
    then begin
              ReportDataView.ViewData.Expand(true);
    end
    else begin
              ReportDataView.ViewData.Collapse(true);
    end;

    Screen.Cursor:=crDefault;
end;

procedure TfmPCardBonusPage.LevelEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
      Params:TUnivParams;
      OutPut : TRxMemoryData;
begin
      Params.FormCaption:='Довідник рівнів актуальності';
      Params.ShowMode:=fsmSelect;
      Params.ShowButtons:=[fbExit];
      Params.TableName:='UP_SYS_LEVEL';
      Params.Fields:='LEVEL_ORDER,LEVEL_NAME,ID_LEVEL';
      Params.FieldsName:='Порядок,Назва';
      Params.KeyField:='ID_LEVEL';
      Params.ReturnFields:='LEVEL_ORDER,LEVEL_NAME,ID_LEVEL';
      Params.DBHandle:=Integer(WorkDatabase.Handle);

      OutPut:=TRxMemoryData.Create(self);

      if GetUnivSprav(Params,OutPut)
      then begin
                id_level:=output['ID_LEVEL'];
                LevelEdit.Text:=VarToStr(output['LEVEL_NAME']);

                Screen.Cursor:=crHourGlass;
                if BonusSelect.Active then BonusSelect.Close;
                BonusSelect.ParamByName('Id_PCard').AsInteger :=Id_PCard;
                if not cxCheckBox1.Checked
                then begin
                          BonusSelect.ParamByName('Act_date').AsDate    :=OnDateEx.Date;
                end
                else begin
                          BonusSelect.ParamByName('Act_date').Value     :=null;
                end;

                if cxCheckBox5.Checked
                then BonusSelect.ParamByName('ID_LEVEL').Value     :=id_level
                else BonusSelect.ParamByName('ID_LEVEL').Value     :=null;

                BonusSelect.Open;

                if not cxCheckBox1.Checked
                then begin
                          ReportDataView.ViewData.Expand(true);
                end
                else begin
                          ReportDataView.ViewData.Collapse(true);
                end;

                Screen.Cursor:=crDefault;
      end;
end;

end.
