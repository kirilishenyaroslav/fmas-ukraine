unit UBonusByMovig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxDBEdit, StdCtrls,
  cxSplitter, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxControls, cxGridCustomView, cxGrid, cxContainer,
  cxCheckBox, ExtCtrls, cxClasses, FIBDataSet, pFIBDataSet, ComCtrls,
  cxMaskEdit, cxButtonEdit;

type
  TfrmMovingBonuses = class(TForm)
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
    Panel2: TPanel;
    cxCheckBox2: TcxCheckBox;
    cxCheckBox4: TcxCheckBox;
    ItemsGrid: TcxGrid;
    ReportDataView: TcxGridDBTableView;
    ReportDataViewDBColumn1: TcxGridDBColumn;
    DateBegCol: TcxGridDBColumn;
    DateEndCol: TcxGridDBColumn;
    ReportDataViewDBColumn2: TcxGridDBColumn;
    ReportDataViewDBColumn7: TcxGridDBColumn;
    ReportDataViewDBColumn3: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    cxSplitter1: TcxSplitter;
    Panel1: TPanel;
    Panel3: TPanel;
    cxGrid1: TcxGrid;
    SmView: TcxGridDBTableView;
    SmViewDBColumn2: TcxGridDBColumn;
    cxGridDBColumn1: TcxGridDBColumn;
    SmViewDBColumn1: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    BonusSelect: TpFIBDataSet;
    SmetsDataSet: TpFIBDataSet;
    SmetsDataSource: TDataSource;
    BonusSource: TDataSource;
    pgc1: TPageControl;
    ts1: TTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    Label1: TLabel;
    Label8: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit8: TcxDBTextEdit;
    Label9: TLabel;
    cxDBTextEdit9: TcxDBTextEdit;
    Label10: TLabel;
    cxDBTextEdit10: TcxDBTextEdit;
    Label11: TLabel;
    Label12: TLabel;
    cxDBTextEdit11: TcxDBTextEdit;
    Label13: TLabel;
    cxDBTextEdit12: TcxDBTextEdit;
    Label14: TLabel;
    bvl1: TBevel;
    cxCheckBox5: TcxCheckBox;
    LevelEdit: TcxButtonEdit;
    procedure cxCheckBox4PropertiesChange(Sender: TObject);
    procedure cxCheckBox2PropertiesChange(Sender: TObject);
    procedure ReportDataViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SmViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LevelEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxCheckBox5PropertiesChange(Sender: TObject);
  private
    { Private declarations }
    lId_level:Integer;
    lid_moving:Int64;
    lfull_period_mode:Integer;
    ldate_beg:TDateTime;
    ldate_end:TDateTime;
    procedure Getdata;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;id_moving:int64;id_level:Variant;level_text:string;defid_level:integer;
                full_period_mode:Integer; date_beg, date_end:TDateTime);reintroduce;
  end;


implementation

uses Up_uMovingsFrame, UpKernelUnit, UUnivSprav, RxmemDs;

{$R *.dfm}

{ TfrmMovingBonuses }

constructor TfrmMovingBonuses.Create(AOwner:TComponent;id_moving:int64;id_level:Variant;level_text:string;defid_level:integer;
                full_period_mode:Integer; date_beg, date_end:TDateTime);
var D,M,Y,Hour, Min, Sec, MSec :Word;
begin
    inherited Create(Aowner);
    DecodeDate(Date,Y,M,D);
    DecodeTime(Time,Hour, Min, Sec, MSec);
    self.Name:=self.Name+IntToStr(Y)+IntToStr(M)+IntToStr(D)+IntToStr(Hour)+IntToStr(Min)+IntToStr(Sec);

    lid_level:=defid_level;
    LevelEdit.Text:=level_text;
    lid_moving:=id_moving;
    lfull_period_mode:=full_period_mode;
    ldate_beg:=date_beg;
    ldate_end:=date_end;

    SmetsDataSet.Database:=TfmPCardMovingsPage(Owner).DB;
    BonusSelect.Database:=TfmPCardMovingsPage(Owner).DB;
    SmetsDataSet.Transaction:=TfmPCardMovingsPage(Owner).ReadTransaction;
    BonusSelect.Transaction:=TfmPCardMovingsPage(Owner).ReadTransaction;

    SmetsDataSet.SelectSQL.Text:='SELECT * FROM UP_KER_GET_BONUS_SMET_INFO(?ID_MAN_BONUS)';

    if id_level=null
    then BonusSelect.SelectSQL.Text:='SELECT * FROM UP_KER_GET_BONUS_INFO_BY_MOVING('+IntToStr(lid_moving)+
                                                                                    ',null,'+
                                                                                    IntToStr(lfull_period_mode)+','+
                                                                                    ''''+DateToStr(ldate_beg)+''''+','+
                                                                                    ''''+DateToStr(ldate_end)+''''+')'
    else BonusSelect.SelectSQL.Text:='SELECT * FROM UP_KER_GET_BONUS_INFO_BY_MOVING('+IntToStr(lid_moving)+','+
                                                                                    VarToStr(id_level)+','+
                                                                                    IntToStr(lfull_period_mode)+','+
                                                                                    ''''+DateToStr(ldate_beg)+''''+','+
                                                                                    ''''+DateToStr(ldate_end)+''''+')';

    BonusSelect.Open;

    ReportDataView.ViewData.Expand(true);
end;

procedure TfrmMovingBonuses.cxCheckBox4PropertiesChange(Sender: TObject);
begin
     ReportDataView.OptionsView.GroupByBox:=cxCheckBox4.Checked;
     SmView.OptionsView.GroupByBox        :=cxCheckBox4.Checked;

end;

procedure TfrmMovingBonuses.cxCheckBox2PropertiesChange(Sender: TObject);
begin
     Panel3.Visible:=cxCheckBox2.Checked;
     cxSplitter1.Visible:=cxCheckBox2.Checked;

     if cxCheckBox2.Checked
     then begin
               cxSplitter1.Top:=Panel3.Top-1;
     end;
end;

procedure TfrmMovingBonuses.ReportDataViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if (( Key = VK_F12) and (ssShift in Shift))
     then begin
               ShowInfo(BonusSelect);
     end;

end;

procedure TfrmMovingBonuses.SmViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (( Key = VK_F12) and (ssShift in Shift))
     then begin
               ShowInfo(SmetsDataSet);
     end;

end;

procedure TfrmMovingBonuses.Getdata;
begin
    if BonusSelect.Active then BonusSelect.Close;

    BonusSelect.SelectSQL.Text:='SELECT * FROM UP_KER_GET_BONUS_INFO_BY_MOVING('+IntToStr(lid_moving)+','+
                                                                                 VarToStr(lid_level)+','+
                                                                                 IntToStr(lfull_period_mode)+','+
                                                                                 ''''+DateToStr(ldate_beg)+''''+','+
                                                                                 ''''+DateToStr(ldate_end)+''''+')';
    BonusSelect.Open;
end;

procedure TfrmMovingBonuses.LevelEditPropertiesButtonClick(Sender: TObject;
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
      Params.DBHandle:=Integer(TfmPCardMovingsPage(Owner).DB.Handle);

      OutPut:=TRxMemoryData.Create(self);

      if GetUnivSprav(Params,OutPut)
      then begin
                lid_level:=output['ID_LEVEL'];
                LevelEdit.Text:=VarToStr(output['LEVEL_NAME']);
                Getdata;
      end;
end;

procedure TfrmMovingBonuses.cxCheckBox5PropertiesChange(Sender: TObject);
begin
     LevelEdit.Enabled:=cxCheckBox5.Checked;
end;

end.
