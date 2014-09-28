unit uHolidayFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, uCommonSp, HolidayDM, Buttons, ExtCtrls,
  ActnList, uHolidayAdd, uFormControl, cxTimeEdit, Holiday_Form,
                 
  uDateControl, uCharControl, uIntControl, uFControl,
  uLabeledFControl, uSpravControl, StdCtrls,
  FIBDataSet, pFIBDataSet, uSelectForm, qFTools,AutoMain, cxTL, cxMaskEdit,
  cxCalendar, cxInplaceContainer, cxDBTL, cxTLData, cxCheckBox,
  cxContainer, cxLabel, cxDBLabel;

type
  THolidayFrame = class(TFrame)
    Panel11: TPanel;
    SB_ModifHoliday: TSpeedButton;
    ActionList1: TActionList;
    ModifOther: TAction;
    SB_DelHoliday: TSpeedButton;
    SB_AddHoliday: TSpeedButton;
    AddHoliday: TAction;
    DelHoliday: TAction;
    SB_DetailsHoliday: TSpeedButton;
    DetailsHoliday: TAction;
    AutoPlan: TSpeedButton;
    SBRefresh: TSpeedButton;
    RefreshHoliday: TAction;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Num_Ord: TcxDBLabel;
    Date_ord: TcxDBLabel;
    DS_Holiday: TDataSource;
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
    cxDBTL_HolidaysTree: TcxDBTreeList;
    cxDBTL_HolidaysTreeCAPTION: TcxDBTreeListColumn;
    cxDBTL_HolidaysTreePERIOD_STR: TcxDBTreeListColumn;
    cxDBTL_HolidaysTreeTYPE_HOLIDAY: TcxDBTreeListColumn;
    cxDBTL_HolidaysTreeCOUNT_DAYS: TcxDBTreeListColumn;
    cxDBTL_HolidaysTreeCOUNT_DAYS_UNUSED: TcxDBTreeListColumn;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1ID: TcxGridDBColumn;
    cxGrid1DBTableView1ID_PARENT: TcxGridDBColumn;
    cxGrid1DBTableView1CAPTION: TcxGridDBColumn;
    cxGrid1DBTableView1PERIOD_STR: TcxGridDBColumn;
    cxGrid1DBTableView1TYPE_HOLIDAY: TcxGridDBColumn;
    cxGrid1DBTableView1COUNT_DAYS: TcxGridDBColumn;
    cxGrid1DBTableView1COUNT_DAYS_UNUSED: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_ORDER: TcxGridDBColumn;
    cxGrid1DBTableView1DATE_ORDER: TcxGridDBColumn;
    cxGrid1DBTableView1YEAR_BEG: TcxGridDBColumn;
    cxGrid1DBTableView1YEAR_END: TcxGridDBColumn;
    cxGrid1DBTableView1RMOVING: TcxGridDBColumn;
    cxGrid1DBTableView1IS_PPS: TcxGridDBColumn;
    procedure FrameEnter(Sender: TObject);
    procedure FrameExit(Sender: TObject);
    procedure AddHolidayExecute(Sender: TObject);
    procedure ModifOtherExecute(Sender: TObject);
    procedure DelHolidayExecute(Sender: TObject);
    procedure DetailsHolidayExecute(Sender: TObject);
    procedure AutoPlanClick(Sender: TObject);
    procedure RefreshHolidayExecute(Sender: TObject);
  private
    { Private declarations }
  public
    id_pcard:integer;
    constructor Create(AOwner: TComponent; DMod :TdmHoliday;  Id_PC: Integer; modify :integer); reintroduce;
  end;


implementation

{$R *.dfm}

constructor THolidayFrame.Create(AOwner: TComponent; DMod :TdmHoliday; Id_PC: Integer; modify :integer);
begin
    inherited Create(aOwner);
    DM:=DMod;
    Id_PCard := Id_PC;
    DM.ReadTransaction.Active:=True;
    DM.DefaultTransaction.Active:=True;
    DM.Holiday_Select.Close;
    DS_Holiday.DataSet:=DM.Holiday_Select;
    DM.Holiday_Select.ParamByName('Id_PCard').AsInteger := Id_PCard;
    DM.Holiday_Select.Open;
    if (modify=0) then
     begin
       Panel11.Enabled:=False;
       ModifOther.Enabled:=False;
     end;
end;

procedure THolidayFrame.FrameEnter(Sender: TObject);
begin
  DM.ReadTransaction.StartTransaction;
  DM.Holiday_Select.Close;
  DM.Holiday_Select.Open;
end;

procedure THolidayFrame.FrameExit(Sender: TObject);
begin
  DM.ReadTransaction.Commit;
end;

procedure THolidayFrame.AddHolidayExecute(Sender: TObject);
var
  HolidayForm: THolidayForm;
  PPS : Boolean;
  date : String;
  rmov : integer;
begin
  pps := True;

  if dm.Holiday_Select ['period_str'] = null then
     date := ''
  else
     date := dm.Holiday_Select ['period_str'];
  if (Length(date)>9) then
    pps := False
  else
    pps := True;
    HolidayForm:=THolidayForm.Create(fmAdd, DM.Holiday_Select['rmoving'], id_pcard, pps, '', '');
  if (HolidayForm.ShowModal=mrOk) then
   begin
     DM.Holiday_Select.Close;
     DM.Holiday_Select.Open;
   end;
end;

procedure THolidayFrame.ModifOtherExecute(Sender: TObject);
 var
  PPS : Boolean;
  date : String;
begin
   if DM.Holiday_Select['is_pps'] = 'T' then
      pps := True
   else
      pps := False;

  if DM.Holiday_Select['year_beg'] = null then

  date := dm.Holiday_Select ['period_str'];

   if DM.Holiday_Select['num_order']<>null then
   begin
     MessageDlg('Не можливо змінити запис iз наказом!',mtError,[mbYes],0);
     Exit;
   end;

   If DM.Holiday_Select.IsEmpty then
   begin
     MessageDlg('Не можливо змінити пустий запис!',mtError,[mbYes],0);
     Exit;
   end;
  HolidayForm:=THolidayForm.Create(fmModify,DM.Holiday_Select['id_man_holiday_plan'],id_pcard, pps, DM.Holiday_Select['year_beg'], DM.Holiday_Select['year_end']);
  if (HolidayForm.ShowModal=mrOk) then
   begin
     DM.Holiday_Select.Close;
     DM.Holiday_Select.Open;
   end;
end;

procedure THolidayFrame.DelHolidayExecute(Sender: TObject);
begin
   if DM.Holiday_Select['num_order']<>null then
   begin
     MessageDlg('Не можливо вилучити запис iз наказом!!',mtError,[mbYes],0);
     Exit;
   end;
  with DM do
  begin
    If Holiday_Select.IsEmpty then
     begin
       MessageDlg('Не можливо видалити пустий запис!',mtError,[mbYes],0);
       Exit;
     end;
    if (MessageDlg('Чи ви справді бажаєте вилучити цей запис?',mtConfirmation,[mbYes,mbNo],0) = mrNo) then Exit;
    try
      DefaultTransaction.StartTransaction;
      DeleteQ.ParamByName('Id_man_holiday_plan').AsInteger:=Holiday_Select['Id_man_holiday_plan'];
      DeleteQ.ExecProc;
      DefaultTransaction.Commit;
      Holiday_Select.Close;
      Holiday_Select.Open;
    except on e: Exception do
     begin
       MessageDlg('Не вдалося видалити запис: '+#13+e.Message,mtError,[mbYes],0);
       DefaultTransaction.Rollback;
     end;
    end;
  end;
end;

procedure THolidayFrame.DetailsHolidayExecute(Sender: TObject);
var
  PPS : Boolean;
  date : String;
begin
  pps := True;
  date := dm.Holiday_Select ['period_str'];

  if (Length(date)>9) then
    pps := False
  else
    pps := True;

   if DM.Holiday_Select['num_order']<>null then
   begin
     MessageDlg('Не можливо переглянути запис iз наказом!!',mtError,[mbYes],0);
     Exit;
   end;
   If DM.Holiday_Select.IsEmpty then
   begin
     MessageDlg('Не можливо подивитись пустий запис!',mtError,[mbYes],0);
     Exit;
   end;
  HolidayForm:=THolidayForm.Create(fmInfo,DM.Holiday_Select['id_man_holiday_plan'],id_pcard, pps, DM.Holiday_Select['year_beg'], DM.Holiday_Select['year_end']);
  if (HolidayForm.ShowModal=mrOk) then
   begin
     DM.Holiday_Select.Close;
     DM.Holiday_Select.Open;
   end;
end;


procedure THolidayFrame.AutoPlanClick(Sender: TObject);
  var
    Child:TForm1;
begin
    Child := TForm1.Create(self);
    Child.Free;
end;

procedure THolidayFrame.RefreshHolidayExecute(Sender: TObject);
begin
  Dm.Holiday_Select.Close;
  Dm.Holiday_Select.Open;
end;

end.
