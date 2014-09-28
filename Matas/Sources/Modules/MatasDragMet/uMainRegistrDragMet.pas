unit uMainRegistrDragMet;

interface

uses  ibase,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxCheckBox, DB, FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet, StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, Buttons, frxDesgn, frxClass,
  frxDBSet, cxSpinEdit, uMatasUtils, uMatasVars, ActnList,
  cxLookAndFeelPainters, cxButtons, uResources;

type
  TReportForm = class(TForm)
    WorkDatabase: TpFIBDatabase;
    ReportDataSet: TpFIBDataSet;
    WorkTransaction: TpFIBTransaction;
    ReportDataSource: TDataSource;
    frxDBDataset1: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    Label4: TLabel;
    cxCheckBox1: TcxCheckBox;
    cxCheckOnPrinter: TcxCheckBox;
    cxSelectPrinter: TcxCheckBox;
    cxCopies: TcxSpinEdit;
    ReportStileCB: TcxComboBox;
    cxMonthBeg: TcxComboBox;
    cxYearBeg: TcxSpinEdit;
    cxMonthEnd: TcxComboBox;
    cxYeartEnd: TcxSpinEdit;
    ActionList1: TActionList;
    ActionOk: TAction;
    ActionCansel: TAction;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SBOk: TcxButton;
    SBCansel: TcxButton;
    frxDBDataset2: TfrxDBDataset;
    frxDBDataset3: TfrxDBDataset;
    ZReport: TfrxReport;
    procedure SBCanselClick(Sender: TObject);
    procedure SBOkClick(Sender: TObject);
    //procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Report_type:Integer;
    DesignReport:Boolean;
    DBHANDLE:TISC_DB_HANDLE;
    MatasMonth, MatasYear: Word;
    PERIOD: TDateTime;
    DateBeg:TDate;
    DateEnd:TDate;
    constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_USER: int64);overload;
  end;
    procedure ShowRepForm(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
    exports ShowRepForm;

var
  ReportForm: TReportForm;

implementation

{$R *.dfm}
uses DateUtils;

//-------------------------------------------------------
procedure ShowRepForm(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
var
 fm:TReportForm;
begin

 fm:=TReportForm.Create(AOwner, DBHANDLE, aID_USER);
 fm.FormStyle:=fsNormal;
 fm.ShowModal;
 fm.Free;
end;

constructor TReportForm.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; ID_USER : Int64);
var
 dy, dm, dd: Word;
 str:String;
begin
    inherited Create(AOwner);
    if Assigned(DBHandle)
    then begin
    DBHANDLE := DBHandle;
    PERIOD:=_MATAS_PERIOD;

    WorkDatabase.Close;
    WorkDatabase.Handle:=DBHANDLE;
    WorkDatabase.Open;

    DecodeDate(PERIOD, dy, dm, dd);
    MatasYear:=dy;
    MatasMonth:=dm;
    LoadMonthTocxComboBox(cxMonthBeg);
    LoadMonthTocxComboBox(cxMonthEnd);

    cxMonthBeg.ItemIndex:=0;
    cxMonthEnd.ItemIndex:=0;
    cxCopies.Value:=1;
    cxCheckOnPrinter.Checked:=IntToBool(_SET_PRINT_ON_PRINTER);
    cxCheckBox1.Visible := IntToBool(_ALLOW_EDIT_TEMPLATE);
    cxMonthBeg.ItemIndex:=MatasMonth-1;
    cxMonthEnd.ItemIndex:=MatasMonth-1;
    cxYearBeg.Value:=MatasYear;
    cxYeartEnd.Value:=MatasYear;

    ReportStileCB.ItemIndex:=0;
    SBOk.Caption:=MAT_ACTION_PRINT_CONST;
    SBCansel.Caption:=MAT_BUTTON_CANCEL_CONST;

    ReportDataSet.Close;
 end;
end;

procedure TReportForm.SBCanselClick(Sender: TObject);
begin
    Close;
end;

procedure TReportForm.SBOkClick(Sender: TObject);
var
    m_s, g_s, m_po, g_po : integer;
    DateB, DateE : string;
    w: TForm;
begin
    w:=ShowWaitWindow(self);

    m_s   := cxMonthBeg.ItemIndex+1;
    g_s   := cxYearBeg.Value;
    m_po  := cxMonthEnd.ItemIndex+1;
    g_po  := cxYeartEnd.Value;
    DateB := cxMonthBeg.Text + ' ' + IntToStr(cxYearBeg.Value);
    DateE := cxMonthEnd.Text + ' ' + IntToStr(cxYeartEnd.Value);
    ReportDataSet.Close;

    Report_type:=ReportStileCB.ItemIndex+1;
    DesignReport:=cxCheckBox1.Checked;
    if cxMonthBeg.ItemIndex > cxMonthEnd.ItemIndex then
    begin
//        ShowMessage('ƒата к≥нц€ повинна бути бiльш пiзнiйшою за дату початка.');
//        Exit;
    end;

   if Report_type=1 then
   begin
       ReportDataSet.SQLs.SelectSQL.Text := 'select * from  MAT_DT_DRAG_GLOBAL_SEL_1('+IntToStr(m_s)+','+IntToStr(g_s)+','+IntToStr(m_po)+','+IntToStr(g_po)+')';
       ReportDataSet.Open;
       frxDBDataset1.dataset := ReportDataSet;

       ZReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\ReportMovingDragMetFull.fr3');
       ZReport.Variables['DateB']:= ''''+DateB+'''';
       ZReport.Variables['DateE']:= ''''+DateE+'''';
   end;

   if Report_type=2 then
   begin
       ReportDataSet.SQLs.SelectSQL.Text := 'select * from  MAT_DT_DRAG_GLOBAL_SEL_2('+IntToStr(m_s)+','+IntToStr(g_s)+','+IntToStr(m_po)+','+IntToStr(g_po)+')';
       ReportDataSet.Open;
       frxDBDataset2.dataset := ReportDataSet;

       ZReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\ReportMovingDragMetSumByMol.fr3');
       ZReport.Variables['DateB']:= ''''+DateB+'''';
       ZReport.Variables['DateE']:= ''''+DateE+'''';
   end;

   if Report_type=3 then
   begin
       ReportDataSet.SQLs.SelectSQL.Text := 'select * from  MAT_DT_DRAG_GLOBAL_SEL_3('+IntToStr(m_s)+','+IntToStr(g_s)+','+IntToStr(m_po)+','+IntToStr(g_po)+')';
       ReportDataSet.Open;
       frxDBDataset3.dataset := ReportDataSet;

       ZReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\ReportMovingDragMetSum.fr3');
       ZReport.Variables['DateB']:= ''''+DateB+'''';
       ZReport.Variables['DateE']:= ''''+DateE+'''';
   end;
   CloseWaitWindow(w);
   if cxCheckOnPrinter.Checked then ZReport.Print        else
   if DesignReport             then ZReport.DesignReport else ZReport.ShowReport;

end;

end.
