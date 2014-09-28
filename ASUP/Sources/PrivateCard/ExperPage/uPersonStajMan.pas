unit uPersonStajMan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, FIBDataSet, pFIBDataSet, cxLookAndFeelPainters,
  ActnList, cxLabel, StdCtrls, cxButtons, cxContainer, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, fibDataBase, IBase;

const ConstYear:Integer=2010;

type
  TfrmPersonStaj = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ViewStajGrid: TcxGrid;
    ViewStajGridDBTableView1: TcxGridDBTableView;
    ViewStajGridLevel1: TcxGridLevel;
    cxStyleRepository1: TcxStyleRepository;
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
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    ViewStajGridDBTableView1DBColumn1: TcxGridDBColumn;
    ViewStajGridDBTableView1DBColumn2: TcxGridDBColumn;
    ViewStajGridDBTableView1DBColumn3: TcxGridDBColumn;
    DataSource: TDataSource;
    DataSet: TpFIBDataSet;
    BtnCalc: TcxButton;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    BtnClose: TcxButton;
    Panel3: TPanel;
    ActionList1: TActionList;
    ActCalc: TAction;
    ActClose: TAction;
    PeriodBegCheck: TCheckBox;
    PeriodEndCheck: TCheckBox;
    cxLabel3: TcxLabel;
    PeriodBegEdit: TcxComboBox;
    PeriodEndEdit: TcxComboBox;
    CxLabel: TcxLabel;
    ShowAllStaj: TCheckBox;
    FilterLabel: TcxLabel;
    YearBegBox: TcxComboBox;
    YearEndBox: TcxComboBox;
    cxLabel4: TcxLabel;
    chPanelGroup: TCheckBox;
    lblPanelGroup: TcxLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActCalcExecute(Sender: TObject);
    procedure ActCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PeriodBegCheckClick(Sender: TObject);
    procedure PeriodEndCheckClick(Sender: TObject);
    procedure ShowAllStajClick(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure YearBegBoxPropertiesChange(Sender: TObject);
    procedure YearEndBoxPropertiesChange(Sender: TObject);
    procedure PeriodBegEditPropertiesChange(Sender: TObject);
    procedure PeriodEndEditPropertiesChange(Sender: TObject);
    procedure chPanelGroupClick(Sender: TObject);
  private
    IdPcard:Integer;
    { Private declarations }
  public
    { Public declarations }
     constructor Create(AOwner:TComponent; ID:Integer);
     function GetId:Integer;
     procedure DataSetOpen(ID_PC:Integer; DateBeg, DateEnd, YearB, YearE:Variant; CheckMode:Integer);
     procedure FilterVisible(ch:boolean);
  end;

var
  frmPersonStaj: TfrmPersonStaj;
  CurIndexB, CurIndexE:Integer;
  CurTextB, CurTextE:String;
implementation

{$R *.dfm}

uses uExperFrame, uExperDataModule, Math, BaseTypes;

constructor TfrmPersonStaj.Create(AOwner:TComponent; ID:Integer);
begin
    inherited Create(AOwner);
    IdPcard:=id;
end;

function TfrmPersonStaj.GetId:Integer;
begin
   Result:=Self.IdPcard;
end;

procedure TfrmPersonStaj.DataSetOpen(ID_PC:Integer; DateBeg, DateEnd, YearB, YearE:Variant; CheckMode:Integer);
begin
   DataSet.Close;
   DataSet.SQLs.SelectSQL.Text:='select distinct * '+
                                'from UP_PERS_STAJ_MAN_BY_DOC(:ID_PCARD, :PERIOD_MONTH_BEG, :PERIOD_MONTH_END, :PERIOD_YEAR_BEG, :PERIOD_YEAR_END, :SHOW_ALL)';
   DataSet.ParamByName('ID_PCARD').AsInteger:=ID_PC;
   if DateBeg=-1 then  DataSet.ParamByName('PERIOD_MONTH_BEG').Value:=null
   else DataSet.ParamByName('PERIOD_MONTH_BEG').AsInteger:=DateBeg;
   if DateEnd=-1 then DataSet.ParamByName('PERIOD_MONTH_END').Value:=null
   else DataSet.ParamByName('PERIOD_MONTH_END').AsInteger:=DateEnd;
   DataSet.ParamByName('PERIOD_YEAR_BEG').AsInteger:=YearB;
   DataSet.ParamByName('PERIOD_YEAR_END').AsInteger:=YearE;
   DataSet.ParamByName('SHOW_ALL').AsInteger:=CheckMode;
   try
     DataSet.Open;
   except on e:exception
   do begin
         agMessageDlg('Увага', e.Message, mtInformation, [mbOK]);
         DataSet.Close;
      end;
   end;
end;


procedure TfrmPersonStaj.FilterVisible(ch:boolean);
begin
   if ch=True then
   begin
      FilterLabel.Visible:=ch;
      DataSetOpen(GetId, -1, -1, -1, -1, 0);
   end
   else FilterLabel.Visible:=ch;
end;


procedure TfrmPersonStaj.FormShow(Sender: TObject);
Var CurYear, CurMonth, CurDay:Word;
    YearAdd:Integer;
begin
   PeriodBegEdit.Properties.Items.Add('Січень');
   PeriodBegEdit.Properties.Items.Add('Лютий');
   PeriodBegEdit.Properties.Items.Add('Березень');
   PeriodBegEdit.Properties.Items.Add('Квітень');
   PeriodBegEdit.Properties.Items.Add('Травень');
   PeriodBegEdit.Properties.Items.Add('Червень');
   PeriodBegEdit.Properties.Items.Add('Липень');
   PeriodBegEdit.Properties.Items.Add('Серпень');
   PeriodBegEdit.Properties.Items.Add('Вересень');
   PeriodBegEdit.Properties.Items.Add('Жовтень');
   PeriodBegEdit.Properties.Items.Add('Листопад');
   PeriodBegEdit.Properties.Items.Add('Грудень');

   PeriodEndEdit.Properties.Items.Add('Січень');
   PeriodEndEdit.Properties.Items.Add('Лютий');
   PeriodEndEdit.Properties.Items.Add('Березень');
   PeriodEndEdit.Properties.Items.Add('Квітень');
   PeriodEndEdit.Properties.Items.Add('Травень');
   PeriodEndEdit.Properties.Items.Add('Червень');
   PeriodEndEdit.Properties.Items.Add('Липень');
   PeriodEndEdit.Properties.Items.Add('Серпень');
   PeriodEndEdit.Properties.Items.Add('Вересень');
   PeriodEndEdit.Properties.Items.Add('Жовтень');
   PeriodEndEdit.Properties.Items.Add('Листопад');
   PeriodEndEdit.Properties.Items.Add('Грудень');

   YearAdd:=ConstYear;
   DecodeDate(Date, CurYear, CurMonth, CurDay);
   while (YearAdd<=CurYear) do
   begin
      YearBegBox.Properties.Items.Add(IntToStr(YearAdd));
      YearEndBox.Properties.Items.Add(IntToStr(YearAdd));
      YearAdd:=YearAdd+1;
   end;
   YearBegBox.ItemIndex:=0;
   CurIndexB:=0;
   YearEndBox.ItemIndex:=CurYear-ConstYear;
   CurIndexE:=YearEndBox.ItemIndex;
   PeriodBegEdit.ItemIndex:=0;
   PeriodEndEdit.ItemIndex:=CurMonth-1;
   DataSetOpen(GetId, PeriodBegEdit.ItemIndex+1, PeriodEndEdit.ItemIndex+1, YearBegBox.ItemIndex+ConstYear, YearEndBox.ItemIndex+ConstYear, Integer(ShowAllStaj.Checked));
   ViewStajGridDBTableView1.ViewData.Expand(True);
   FilterVisible(False);
end;

procedure TfrmPersonStaj.FormCreate(Sender: TObject);
begin
    ViewStajGrid.SetFocus;
end;

procedure TfrmPersonStaj.ActCalcExecute(Sender: TObject);
var DBeg, DEnd:Variant;
begin
    if ShowAllStaj.Checked=False then
    begin
       if PeriodBegEdit.ItemIndex>PeriodEndEdit.ItemIndex then
       begin
          agMessageDlg('Увага', '"Період з" не може бути більше, ніж "Період по"!', mtInformation, [mbOK]);
          YearBegBox.ItemIndex:=CurIndexB;
          YearBegBox.Properties.Items.ValueFromIndex[CurIndexB];
          Exit;
       end;
       if YearBegBox.ItemIndex>YearEndBox.ItemIndex then
       begin
          agMessageDlg('Увага', '"Рік з" не може бути більше, ніж "Рік по"!', mtInformation, [mbOK]);
          Exit;
       end;
    end;   
    Self.Cursor:=crHourGlass;
    if PeriodBegCheck.Checked then DBeg:=PeriodBegEdit.ItemIndex+1
    else DBeg:=-1;
    if PeriodEndCheck.Checked then DEnd:=PeriodEndEdit.ItemIndex+1
    else DEnd:=-1;
    DataSetOpen(GetId, DBeg, DEnd, YearBegBox.ItemIndex+ConstYear,YearEndBox.ItemIndex+ConstYear, Integer(ShowAllStaj.Checked));
    ViewStajGridDBTableView1.ViewData.Expand(True);
    Self.Cursor:=crDefault;
    FilterVisible(False);
end;

procedure TfrmPersonStaj.ActCloseExecute(Sender: TObject);
begin
    Close;
end;

procedure TfrmPersonStaj.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if FormStyle=fsMDIChild then Action:=caFree;
end;

procedure TfrmPersonStaj.PeriodBegCheckClick(Sender: TObject);
begin
   PeriodBegEdit.Enabled:=PeriodBegCheck.Checked;
  FilterVisible(True);
end;

procedure TfrmPersonStaj.PeriodEndCheckClick(Sender: TObject);
begin
   PeriodEndEdit.Enabled:=PeriodEndCheck.Checked;
   FilterVisible(True);
end;

procedure TfrmPersonStaj.ShowAllStajClick(Sender: TObject);
begin
   FilterVisible(False);
   YearBegBox.Enabled:=not ShowAllStaj.Checked;
   YearEndBox.Enabled:=not ShowAllStaj.Checked;
   PeriodBegCheck.Enabled:=not ShowAllStaj.Checked;
   PeriodBegEdit.Enabled:=not ShowAllStaj.Checked;
   PeriodEndCheck.Enabled:=not ShowAllStaj.Checked;
   PeriodEndEdit.Enabled:=not ShowAllStaj.Checked;
   ActCalcExecute(Self);
end;

procedure TfrmPersonStaj.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   FilterLabel.Top:=35;
end;

procedure TfrmPersonStaj.YearBegBoxPropertiesChange(Sender: TObject);
begin
    FilterVisible(True);
end;

procedure TfrmPersonStaj.YearEndBoxPropertiesChange(Sender: TObject);
begin
    FilterVisible(True);
end;

procedure TfrmPersonStaj.PeriodBegEditPropertiesChange(Sender: TObject);
begin
    if PeriodBegEdit.ItemIndex=-1 then
    begin
       PeriodBegEdit.ItemIndex:=CurIndexB;
       PeriodBegEdit.Properties.Items.ValueFromIndex[CurIndexB];
    end
    else
    begin
       CurIndexB:=PeriodBegEdit.ItemIndex;
       CurTextB:=PeriodBegEdit.Properties.Items.ValueFromIndex[CurIndexB];
    end;
    FilterVisible(True);
end;

procedure TfrmPersonStaj.PeriodEndEditPropertiesChange(Sender: TObject);
begin
    if PeriodEndEdit.ItemIndex=-1 then
    begin
       PeriodEndEdit.ItemIndex:=CurIndexE;
       PeriodEndEdit.Properties.Items.ValueFromIndex[CurIndexE];
    end
    else
    begin
       CurIndexE:=PeriodEndEdit.ItemIndex;
       CurTextE:=PeriodEndEdit.Properties.Items.ValueFromIndex[CurIndexE];
    end;
   FilterVisible(True);
end;

procedure TfrmPersonStaj.chPanelGroupClick(Sender: TObject);
begin
    ViewStajGridDBTableView1.OptionsView.GroupByBox:=chPanelGroup.Checked;
end;

end.
