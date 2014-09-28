unit USetDateForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,Ibase,
  FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, frxClass,
  frxDBSet;

type
  TfrmSetDate = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cbMonthBeg: TComboBox;
    cbYearBeg: TComboBox;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Label3: TLabel;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    ReestrDS: TfrxDBDataset;
    DocsDataset: TfrxDBDataset;
    SpravDataSet: TpFIBDataSet;
    ReestrDataSet: TpFIBDataSet;
    frxReport1: TfrxReport;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ActualDate:TDateTime;
    id_user:Int64;
    constructor Create(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;ID_USER:Int64);reintroduce;
  end;

  procedure GetMBookReports(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;ID_USER:Int64);stdcall;
  exports GetMBookReports;

implementation

uses GlobalSpr,Resources_unitb,BaseTypes,DateUtils;

{$R *.dfm}
procedure GetMBookReports(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;ID_USER:Int64);
begin
     with TfrmSetDate.Create(AOwner,DBHandle,ID_USER) do
     begin
         ShowModal;
         Free;
     end;
end;

constructor TfrmSetDate.Create(AOwner: TComponent; DBHandle: TISC_DB_HANDLE; ID_USER: Int64);
var i:Integer;
begin
     inherited Create(AOwner);
     WorkDatabase.Handle:=DBHandle;
     ReadTransaction.StartTransaction;

     ActualDate:=Date;

     cbMonthBeg.Items.Add(TRIM(BU_Month_01));
     cbMonthBeg.Items.Add(TRIM(BU_Month_02));
     cbMonthBeg.Items.Add(TRIM(BU_Month_03));
     cbMonthBeg.Items.Add(TRIM(BU_Month_04));
     cbMonthBeg.Items.Add(TRIM(BU_Month_05));
     cbMonthBeg.Items.Add(TRIM(BU_Month_06));
     cbMonthBeg.Items.Add(TRIM(BU_Month_07));
     cbMonthBeg.Items.Add(TRIM(BU_Month_08));
     cbMonthBeg.Items.Add(TRIM(BU_Month_09));
     cbMonthBeg.Items.Add(TRIM(BU_Month_10));
     cbMonthBeg.Items.Add(TRIM(BU_Month_11));
     cbMonthBeg.Items.Add(TRIM(BU_Month_12));

     for i:=0 to YEARS_COUNT do
     begin
          cbYearBeg.Items.Add(TRIM(IntToStr(BASE_YEAR+i)));
     end;

     cbMonthBeg.ItemIndex:=MonthOf(ActualDate)-1;
     for i:=0 to cbYearBeg.Items.Count-1 do
     begin
           if pos(cbYearBeg.Items[i],IntToStr(YearOf(ActualDate)))>0
           then begin
              cbYearBeg.ItemIndex:=i;
              break;
           end;
     end;
end;

procedure TfrmSetDate.cxButton2Click(Sender: TObject);
begin
     Close;
end;

procedure TfrmSetDate.cxButton1Click(Sender: TObject);
begin
     ActualDate:=StrToDate('01.'+IntToStr(cbMonthBeg.ItemIndex+1)+'.'+cbYearBeg.Items[cbYearBeg.ItemIndex]);
     if ComboBox1.ItemIndex=0
     then begin //Реестр
                Screen.Cursor:=crSQLWait;
                if SpravDataSet.Active then SpravDataSet.Close;
                SpravDataSet.SelectSQL.Text:=' select * '+
                                              '  from MBOOK_GET_MONTH_PROVS_EX('+''''+DateToStr(ActualDate)+''''+')'+
                                              '  order by PK_ID ASC, DOC_DATE ASC , PROV_DB_SM ASC';
                SpravDataSet.Open;
                frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Mbook\ReportReestrMainBook.fr3',true);
                frxReport1.Variables['ActualDate']:=ActualDate;

                if (SpravDataSet.FieldByName('MAIN_BUHG_FIO').Value<>NULL)
                then frxReport1.Variables['MAIN_BUHG_FIO']:=''''+SpravDataSet.FieldByName('MAIN_BUHG_FIO').AsString+''''
                else frxReport1.Variables['MAIN_BUHG_FIO']:='';

                Screen.Cursor:=crDefault;
     end
     else begin //Агрегированный отчет
                Screen.Cursor:=crSQLWait;
                if ReestrDataSet.Active then ReestrDataSet.Close;
                ReestrDataSet.SelectSQL.Text:=' select sum(summa) as summa, db_sch, kr_sch , MAIN_BUHG_FIO'+
                                              '  from MBOOK_GET_MONTH_PROVS('+''''+DateToStr(ActualDate)+''''+')'+
                                              '  group by db_sch, kr_sch, MAIN_BUHG_FIO order by kr_sch, db_sch';
                ReestrDataSet.Open;
                frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Mbook\ReportSpravMainBook.fr3',true);
                frxReport1.Variables['ActualDate']:=ActualDate;

                if (ReestrDataSet.FieldByName('MAIN_BUHG_FIO').Value<>NULL)
                then frxReport1.Variables['MAIN_BUHG_FIO']:=''''+ReestrDataSet.FieldByName('MAIN_BUHG_FIO').AsString+''''
                else frxReport1.Variables['MAIN_BUHG_FIO']:='';


                Screen.Cursor:=crDefault;
     end;
     frxReport1.PrepareReport(true);
     frxReport1.ShowPreparedReport;
end;

end.
