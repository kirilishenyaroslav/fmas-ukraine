unit PaymentTypeMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxCurrencyEdit,
  cxContainer, cxCheckBox, ImgList, dxBar, dxBarExtItems, cxGridTableView,
  ActnList, cxGridLevel, cxGridCustomTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, ExtCtrls, uCs_types,
  DMPaymentTypeMain, DateUtils, uCS_Proc, cxCheckComboBox;

type
  TFMainPaymentType = class(TForm)
    TopPanel: TPanel;
    Panel1: TPanel;
    Panel5: TPanel;
    Panel4: TPanel;
    Panel9: TPanel;
    ItemsGrid: TcxGrid;
    cxGridView: TcxGridDBTableView;
    cxGridViewDBColumn7: TcxGridDBColumn;
    cxGridViewDBColumn1: TcxGridDBColumn;
    cxGridViewDBColumn3: TcxGridDBColumn;
    cxGridViewDBColumn4: TcxGridDBColumn;
    cxGridViewDBColumn2: TcxGridDBColumn;
    cxGridViewDBColumn5: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    Panel2: TPanel;
    Panel12: TPanel;
    KeyList: TActionList;
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
    ContentError: TcxStyle;
    qizzStyle: TcxGridTableViewStyleSheet;
    dxBarManager1: TdxBarManager;
    dxAddPositionButton: TdxBarLargeButton;
    dxEditPositionButton: TdxBarLargeButton;
    dxReasonButton: TdxBarLargeButton;
    dxErrorButton: TdxBarLargeButton;
    dxAddPositionButtonW: TdxBarLargeButton;
    dxAddPositionButtonNW: TdxBarLargeButton;
    dxSmAddButton: TdxBarLargeButton;
    dxDelPositionButtonOne: TdxBarLargeButton;
    dxDelPositionButtonAll: TdxBarLargeButton;
    dxSmEditPositionButton: TdxBarLargeButton;
    dxCloneButton: TdxBarLargeButton;
    dxBtnRefresh: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBtnDel: TdxBarButton;
    dxBtnDelAll: TdxBarButton;
    IL_OrdAcc: TImageList;
    cxCBShowPremium: TcxCheckBox;
    cxCBShowMatPom: TcxCheckBox;
    dxLBtnSelect: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    ActionAdd: TAction;
    ActionUpd: TAction;
    ActionDel: TAction;
    ActionRef: TAction;
    ActionSel: TAction;
    procedure dxAddPositionButtonClick(Sender: TObject);
    procedure dxBtnRefreshClick(Sender: TObject);
    procedure dxEditPositionButtonClick(Sender: TObject);
    procedure dxDelPositionButtonOneClick(Sender: TObject);
    procedure dxLBtnSelectClick(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure cxCBShowPremiumPropertiesEditValueChanged(Sender: TObject);
    procedure cxCBShowMatPomPropertiesEditValueChanged(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionUpdExecute(Sender: TObject);
    procedure ActionDelExecute(Sender: TObject);
    procedure ActionRefExecute(Sender: TObject);
    procedure ActionSelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    ParamLoc :TcsPaymentTypeParam;
  public
    constructor create(Parameter:TcsPaymentTypeParam); reintroduce;
  end;

var
  FMainPaymentType: TFMainPaymentType;

implementation

uses EditPaymentType;

{$R *.dfm}



{ TFPaymentTypeMain }

constructor TFMainPaymentType.create(Parameter:TcsPaymentTypeParam);
begin
  inherited Create(Parameter.Owner);
  ParamLoc :=Parameter;
  if CSEdit in Parameter.Mode   then
  begin
    dxAddPositionButton.Visible     :=ivAlways;
    dxEditPositionButton.Visible    :=ivAlways;
    dxDelPositionButtonOne.Visible  :=ivAlways;
    dxBtnRefresh.Visible            :=ivAlways;
  end;

  if (CSSelect in Parameter.Mode)   then
  begin
    dxLBtnSelect.Visible  :=ivAlways;
    dxBtnRefresh.Visible  :=ivAlways;
    if ParamLoc.ID_TYPE_CALC =0 then
    begin
      cxCBShowPremium.Checked:=True;
      cxCBShowMatPom.Checked:=False;
      //cxCBShowPremiumPropertiesEditValueChanged(self);
    end
    else if ParamLoc.ID_TYPE_CALC =1 then
    begin
      cxCBShowPremium.Checked:=False;
      cxCBShowMatPom.Checked:=True;
      //cxCBShowMatPomPropertiesEditValueChanged(self);
    end;
  end;

  if CSShow in Parameter.Mode   then
  begin
    dxBtnRefresh.Visible  :=ivAlways;
  end;




  DMMainPaymentType.ReadTransaction.StartTransaction;
  DMMainPaymentType.MainDataSet.Close;
  DMMainPaymentType.MainDataSet.SelectSQL.Text:='SELECT ID_PAYMENT_TYPE, NAME_TYPE_CALC, NAME_PAYMENT_TYPE, FULL_NAME_PAYMENT_TYPE,ID_VIDOPL, ID_TYPE_CALC, USE_DATE_BEG,  USE_DATE_END,  DISPLAY_ORDER, REASON, NAME_VIDOPL, KOD_VIDOPL FROM CS_DT_PAYMENT_TYPE_S';
  DMMainPaymentType.MainDataSet.RefreshSQL.Text:='SELECT ID_PAYMENT_TYPE, NAME_TYPE_CALC, NAME_PAYMENT_TYPE, FULL_NAME_PAYMENT_TYPE,ID_VIDOPL, ID_TYPE_CALC, USE_DATE_BEG,  USE_DATE_END,  DISPLAY_ORDER, REASON, NAME_VIDOPL, KOD_VIDOPL FROM CS_DT_PAYMENT_TYPE_S ';
  DMMainPaymentType.MainDataSet.Open;
  DMMainPaymentType.MainDataSet.FetchAll;
  DMMainPaymentType.MainDataSource.DataSet:=DMMainPaymentType.MainDataSet;
  cxGridView.DataController.DataSource:=DMMainPaymentType.MainDataSource;
end;

procedure TFMainPaymentType.dxAddPositionButtonClick(Sender: TObject);
var  y, m, d:word;
ID_PAYMENT_TYPE:integer;
begin
    FEditPaymentType:= TFEditPaymentType.create(ParamLoc.Owner);
    DecodeDate(Date, y, m, d);
    FEditPaymentType.EditDateBeg.Date:=EncodeDate(y, m, 1);
    d:=DaysInAMonth(y, m);
    FEditPaymentType.EditDateEnd.Date:=EncodeDate(y+10, m, d);
    if   FEditPaymentType.ShowModal = mrOk then
    begin
      with DMMainPaymentType  do
      begin
        try
          WriteTransaction.StartTransaction;
          StoredProc.StoredProcName:='CS_DT_PAYMENT_TYPE_I';
          StoredProc.Prepare;
          StoredProc.ParamByName('FULL_NAME_PAYMENT_TYPE').AsString:=     FEditPaymentType.cxMENameTypeViplFULL.Text;
          StoredProc.ParamByName('NAME_PAYMENT_TYPE').AsString:=          FEditPaymentType.cxMENameTypeVipl.Text;
          StoredProc.ParamByName('ID_VIDOPL').AsInteger:=                 FEditPaymentType.pId_VidOpl;
          StoredProc.ParamByName('ID_TYPE_CALC').AsInteger:=              FEditPaymentType.cxCBType.ItemIndex;//ориентировочно с нуля начало
          StoredProc.ParamByName('USE_DATE_BEG').AsDate:=                 FEditPaymentType.EditDateBeg.Date;
          StoredProc.ParamByName('USE_DATE_END').AsDate:=                 FEditPaymentType.EditDateEnd.Date;
          StoredProc.ParamByName('DISPLAY_ORDER').AsInteger:=             0;
          StoredProc.ParamByName('REASON').AsVariant:=                    FEditPaymentType.cxMEReason.Text;
          StoredProc.ExecProc;
          ID_PAYMENT_TYPE:=                                               StoredProc.ParamByName('ID_PAYMENT_TYPE').AsInteger;
          WriteTransaction.Commit;
        except
          WriteTransaction.Rollback;
          ShowMessage('Помилка додання запису');
        end;
        MainDataSet.CloseOpen(True);
        MainDataSet.Locate('ID_PAYMENT_TYPE',ID_PAYMENT_TYPE,[]);
      end;

  end;

    FEditPaymentType.Free;
end;

procedure TFMainPaymentType.dxBtnRefreshClick(Sender: TObject);
begin
  DMMainPaymentType.MainDataSet.CloseOpen(True);
  DMMainPaymentType.MainDataSet.fetchAll;
end;

procedure TFMainPaymentType.dxEditPositionButtonClick(Sender: TObject);
var  y, m, d:word;
begin
    FEditPaymentType:= TFEditPaymentType.create(ParamLoc.Owner);
    with DMMainPaymentType do
    begin
      if MainDataSet.IsEmpty then exit;
      FEditPaymentType.cxMENameTypeViplFULL.Text:=    VarToStrDef(MainDataSet['FULL_NAME_PAYMENT_TYPE'],'');
      FEditPaymentType.cxMENameTypeVipl.Text:=        VarToStrDef(MainDataSet['NAME_PAYMENT_TYPE'],'');
      FEditPaymentType.EditVidOpl.Text:=              VarToStrDef(MainDataSet['KOD_VIDOPL'],'');
      FEditPaymentType.PId_VidOpl:=                   IfThen(MainDataSet['ID_VIDOPL'],-1);
      FEditPaymentType.LabelVidOplData.Caption:=      VarToStrDef(MainDataSet['NAME_VIDOPL'],'');
      FEditPaymentType.EditDateBeg.Date:=             VarToDateTime(MainDataSet['USE_DATE_BEG']);
      FEditPaymentType.EditDateEnd.Date:=             VarToDateTime(MainDataSet['USE_DATE_END']);
      FEditPaymentType.cxCBType.ItemIndex:=           IfThen(MainDataSet['ID_TYPE_CALC'],-1);
      FEditPaymentType.cxMEReason.Text:=              VarToStrDef(MainDataSet['REASON'],'');
      if FEditPaymentType.ShowModal = mrok then
      begin
        try
          WriteTransaction.StartTransaction;
          StoredProc.StoredProcName:='CS_DT_PAYMENT_TYPE_U';
          StoredProc.Prepare;
          StoredProc.ParamByName('ID_PAYMENT_TYPE').AsString:=            MainDataSet['ID_PAYMENT_TYPE'];
          StoredProc.ParamByName('FULL_NAME_PAYMENT_TYPE').AsString:=     FEditPaymentType.cxMENameTypeViplFULL.Text;
          StoredProc.ParamByName('NAME_PAYMENT_TYPE').AsString:=          FEditPaymentType.cxMENameTypeVipl.Text;
          StoredProc.ParamByName('ID_VIDOPL').AsInteger:=                 FEditPaymentType.pId_VidOpl;
          StoredProc.ParamByName('ID_TYPE_CALC').AsInteger:=              FEditPaymentType.cxCBType.ItemIndex;//ориентировочно с нуля начало
          StoredProc.ParamByName('USE_DATE_BEG').AsDate:=                 FEditPaymentType.EditDateBeg.Date;
          StoredProc.ParamByName('USE_DATE_END').AsDate:=                 FEditPaymentType.EditDateEnd.Date;
          StoredProc.ParamByName('DISPLAY_ORDER').AsInteger:=             0;
          StoredProc.ParamByName('REASON').AsVariant:=                    FEditPaymentType.cxMEReason.Text;
          StoredProc.ExecProc;
          WriteTransaction.Commit;
        except
          WriteTransaction.Rollback;
          ShowMessage('Помилка зміни запису');
        end;

        MainDataSet.RefreshSQL.Text:='SELECT ID_PAYMENT_TYPE, NAME_TYPE_CALC, NAME_PAYMENT_TYPE, FULL_NAME_PAYMENT_TYPE,ID_VIDOPL, ID_TYPE_CALC, USE_DATE_BEG,  USE_DATE_END,  DISPLAY_ORDER, REASON, NAME_VIDOPL, KOD_VIDOPL'+
        ' FROM CS_DT_PAYMENT_TYPE_S '+
        ' WHERE ID_PAYMENT_TYPE ='+varToStrDef(MainDataSet['ID_PAYMENT_TYPE'],'Null');
        MainDataSet.Refresh;
      end;

    end;
    FEditPaymentType.Free;

end;

procedure TFMainPaymentType.dxDelPositionButtonOneClick(Sender: TObject);
begin
  with DMMainPaymentType do
    begin
    try
      if MainDataSet.IsEmpty then exit;
      WriteTransaction.StartTransaction;
      StoredProc.StoredProcName:='CS_DT_PAYMENT_TYPE_D';
      StoredProc.Prepare;
      StoredProc.ParamByName('ID_PAYMENT_TYPE').AsString:=            MainDataSet['ID_PAYMENT_TYPE'];
      StoredProc.ExecProc;
      WriteTransaction.Commit;
    except
      WriteTransaction.Rollback;
      ShowMessage('Помилка видалення запису');
    end;
    MainDataSet.CloseOpen(True);
  end;

end;

procedure TFMainPaymentType.dxLBtnSelectClick(Sender: TObject);
begin
  if not DMMainPaymentType.MainDataSet.IsEmpty then
  begin
    ParamLoc.ID_PAYMENT_TYPE    := IfThen(DMMainPaymentType.MainDataSet['ID_PAYMENT_TYPE'],-1);
    ParamLoc.NAME_PAYMENT_TYPE  := varToStrDef(DMMainPaymentType.MainDataSet['NAME_PAYMENT_TYPE'],'');
    ParamLoc.ID_VIDOPL          := IfThen(DMMainPaymentType.MainDataSet['ID_VIDOPL'],'');
    ParamLoc.ID_TYPE_CALC       := IfThen(DMMainPaymentType.MainDataSet['ID_TYPE_CALC'],'');

    // предположительно изза сучьего фильтра не фокусируется завпись в гриде нахер такие компоненты!!
    //DataBinding.DataController.Values[i, 4]
    //cxGridView.DataController.FocusedRecord['ID_PAYMENT_TYPE'];
    //ParamLoc.NAME_PAYMENT_TYPE  := DMMainPaymentType.MainDataSet['NAME_PAYMENT_TYPE'];
    //ParamLoc.ID_VIDOPL          := DMMainPaymentType.MainDataSet['ID_VIDOPL'];
  end
  else ParamLoc.ID_PAYMENT_TYPE := -1;
  Close;
end;

procedure TFMainPaymentType.dxBarLargeButton3Click(Sender: TObject);
begin
  if (CSSelect in ParamLoc.Mode)   then
  begin
    modalresult:=mrcancel;
  end
  else
  if (CSEdit in ParamLoc.Mode)   then
  begin
     DMMainPaymentType.Free;
     Close;
  end
  else
  if (CSShow in ParamLoc.Mode)   then
  begin
    DMMainPaymentType.Free;
    Close;
  end;

end;

procedure TFMainPaymentType.cxCBShowPremiumPropertiesEditValueChanged(
  Sender: TObject);
begin
  if  not cxCBShowMatPom.Checked and not TcxCheckBox(Sender).Checked then
  begin
    TcxCheckBox(Sender).Checked:=True ;
    exit;
  end;

  if cxCBShowMatPom.Checked and TcxCheckBox(Sender).Checked then
    begin
      cxGridView.DataController.Filter.Root.Clear;
      cxGridView.DataController.Filter.Active:=False;
    end
  else if cxCBShowMatPom.Checked and not TcxCheckBox(Sender).Checked then
    begin
      cxGridView.DataController.Filter.Root.Clear;
      cxGridView.DataController.Filter.Root.AddItem(cxGridView.Columns[4], cxFilter.foEqual, 'Матдопомога' ,'Премія');
      cxGridView.DataController.Filter.Active:=true;
    end

end;

procedure TFMainPaymentType.cxCBShowMatPomPropertiesEditValueChanged(
  Sender: TObject);
begin

  if  not cxCBShowPremium.Checked and not TcxCheckBox(Sender).Checked then
  begin
    TcxCheckBox(Sender).Checked:=True ;
    exit;
  end;

  if cxCBShowPremium.Checked and TcxCheckBox(Sender).Checked then
    begin
      cxGridView.DataController.Filter.Root.Clear;
      cxGridView.DataController.Filter.Active:=False;
    end
  else if cxCBShowPremium.Checked and not TcxCheckBox(Sender).Checked then
    begin
      cxGridView.DataController.Filter.Root.Clear;
      cxGridView.DataController.Filter.Root.AddItem(cxGridView.Columns[4], cxFilter.foEqual, 'Премія' ,'Премія');
      cxGridView.DataController.Filter.Active:=true;
    end
end;

procedure TFMainPaymentType.ActionAddExecute(Sender: TObject);
begin
  if dxAddPositionButton.Enabled then dxAddPositionButtonClick(Sender); 
end;

procedure TFMainPaymentType.ActionUpdExecute(Sender: TObject);
begin
  if  dxEditPositionButton.Enabled then dxEditPositionButtonClick(Sender);
end;

procedure TFMainPaymentType.ActionDelExecute(Sender: TObject);
begin
  if ActionDel.Enabled then dxDelPositionButtonOneClick(Sender);
end;

procedure TFMainPaymentType.ActionRefExecute(Sender: TObject);
begin
  if dxBtnRefresh.Enabled then dxBtnRefreshClick(Sender);
end;

procedure TFMainPaymentType.ActionSelExecute(Sender: TObject);
begin
  if dxLBtnSelect.Enabled then  dxLBtnSelectClick(Sender);
end;

procedure TFMainPaymentType.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=CaFree;
end;

end.
