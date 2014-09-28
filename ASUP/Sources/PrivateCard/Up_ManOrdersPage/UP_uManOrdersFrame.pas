unit UP_uManOrdersFrame;

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

  TfmManOrdersPage = class(TFrame)
    WriteTransaction: TpFIBTransaction;
    DSetManOrders: TpFIBDataSet;
    ManOrdersSource: TDataSource;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    Panel2: TPanel;
    ManOrdersGrid: TcxGrid;
    ManOrdersGridLevel: TcxGridLevel;
    cbLevels: TcxCheckBox;
    LevelEdit: TcxButtonEdit;
    cbAllOrders: TcxCheckBox;
    ManOrdersGridDBView: TcxGridDBTableView;
    ManOrdersGridDBViewDBColumn1: TcxGridDBColumn;
    ManOrdersGridDBViewDBColumn2: TcxGridDBColumn;
    ManOrdersGridDBViewDBColumn3: TcxGridDBColumn;
    ManOrdersGridDBViewDBColumn4: TcxGridDBColumn;
    ManOrdersGridDBViewDBColumn5: TcxGridDBColumn;
    ManOrdersGridDBViewDBColumn6: TcxGridDBColumn;
    ManOrdersGridDBViewDBColumn7: TcxGridDBColumn;
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
    procedure BonusGridDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ReportDataViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LevelEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ReportDataViewDblClick(Sender: TObject);
    procedure cbLevelsPropertiesChange(Sender: TObject);
    procedure cbAllOrdersPropertiesChange(Sender: TObject);
    procedure ManOrdersGridDBViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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

constructor TfmManOrdersPage.Create(AOwner: TComponent;DbHandle:TISC_DB_HANDLE; Id_PC: Integer; modify :integer; ActualDate: TDate);
var D,M,Y,Hour, Min, Sec, MSec :Word;
    DefLevelInfoDS:TpFIBDataSet;
begin
    inherited Create(AOwner);
    DecodeDate(Date,Y,M,D);
    DecodeTime(Time,Hour, Min, Sec, MSec);
    self.Name:=self.Name+IntToStr(Y)+IntToStr(M)+IntToStr(D)+IntToStr(Hour)+IntToStr(Min)+IntToStr(Sec);

    self.WorkDatabase.Handle:=DbHandle;
    ReadTransaction.StartTransaction;

    DefLevelInfoDS:=TpFIBDataSet.Create(self);
    DefLevelInfoDS.Database:=WorkDatabase;
    DefLevelInfoDS.Transaction:=ReadTransaction;
    DefLevelInfoDS.SelectSQL.Text:='SELECT * FROM UP_KER_UTIL_GET_DEF_LEVEL';
    DefLevelInfoDS.Open;
    if (DefLevelInfoDS.RecordCount>0)
    then begin
              LevelEdit.Text:=DefLevelInfoDS.FieldByName('LEVEL_NAME').AsString;
              id_level:=DefLevelInfoDS.FieldByName('ID_LEVEL').Value;
    end;
    DefLevelInfoDS.Close;
    DefLevelInfoDS.Free;

    id_pcard:=Id_PC;

    DSetManOrders.ParamByName('Id_PCard').AsInteger := Id_PCard;

    if cbLevels.Checked
    then DSetManOrders.ParamByName('Id_level').Value := id_level
    else DSetManOrders.ParamByName('Id_level').Value := null;

    if cbAllOrders.Checked
    then DSetManOrders.ParamByName('show_all').Value := 1
    else DSetManOrders.ParamByName('show_all').Value := 0;

    DSetManOrders.Open;

    ManOrdersGridDBView.ViewData.Expand(True);
end;



procedure TfmManOrdersPage.BonusGridDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if  (( Key = VK_F12) and (ssShift in Shift))
  then ShowInfo(DSetManOrders);
end;

procedure TfmManOrdersPage.ReportDataViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if (( Key = VK_F12) and (ssShift in Shift))
     then begin
               ShowInfo(DSetManOrders);
     end;
end;

procedure TfmManOrdersPage.LevelEditPropertiesButtonClick(Sender: TObject;
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

            if DSetManOrders.Active then DSetManOrders.Close;

            if cbLevels.Checked
            then DSetManOrders.ParamByName('Id_level').Value := id_level
            else DSetManOrders.ParamByName('Id_level').Value := null;

            if cbAllOrders.Checked
            then DSetManOrders.ParamByName('show_all').Value := 1
            else DSetManOrders.ParamByName('show_all').Value := 0;

            DSetManOrders.Open;

            ManOrdersGridDBView.ViewData.Expand(True);

            Screen.Cursor:=crDefault;
    end;
end;

procedure TfmManOrdersPage.ReportDataViewDblClick(Sender: TObject);
begin
     if (DSetManOrders.RecordCount>0)
     then begin


     end;
end;

procedure TfmManOrdersPage.cbLevelsPropertiesChange(Sender: TObject);
begin
    LevelEdit.Enabled:=cbLevels.Checked;

    Screen.Cursor:=crHourGlass;

    if DSetManOrders.Active then DSetManOrders.Close;

    if cbLevels.Checked
    then DSetManOrders.ParamByName('Id_level').Value := id_level
    else DSetManOrders.ParamByName('Id_level').Value := null;

    if cbAllOrders.Checked
    then DSetManOrders.ParamByName('show_all').Value := 1
    else DSetManOrders.ParamByName('show_all').Value := 0;

    DSetManOrders.Open;

    ManOrdersGridDBView.ViewData.Expand(True);

    Screen.Cursor:=crDefault;
end;

procedure TfmManOrdersPage.cbAllOrdersPropertiesChange(Sender: TObject);
begin
    Screen.Cursor:=crHourGlass;

    if DSetManOrders.Active then DSetManOrders.Close;

    if cbLevels.Checked
    then DSetManOrders.ParamByName('Id_level').Value := id_level
    else DSetManOrders.ParamByName('Id_level').Value := null;

    if cbAllOrders.Checked
    then DSetManOrders.ParamByName('show_all').Value := 1
    else DSetManOrders.ParamByName('show_all').Value := 0;

    DSetManOrders.Open;

    ManOrdersGridDBView.ViewData.Expand(True);

    Screen.Cursor:=crDefault;
end;

procedure TfmManOrdersPage.ManOrdersGridDBViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ((Chr(Key)='+') and (ssCtrl in Shift)) then ManOrdersGridDBView.ViewData.Expand(True);
  if ((Chr(Key)='-') and (ssCtrl in Shift)) then ManOrdersGridDBView.ViewData.Expand(False);
end;

end.
