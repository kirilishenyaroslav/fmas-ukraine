unit UMainReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, StdCtrls, cxLookAndFeelPainters, cxButtons,
  frxClass, frxDBSet, DB, FIBDataSet, pFIBDataSet, FIBDatabase,
  pFIBDatabase, cxCheckBox;

type
  TfrmSmMainReport = class(TForm)
    Label5: TLabel;
    cxDateEdit3: TcxDateEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    SmetPlusPeriodsDataSet: TpFIBDataSet;
    SmPlusPeriodsDataset: TfrxDBDataset;
    cxCheckBox1: TcxCheckBox;
    cxTextEdit1: TcxTextEdit;
    Label1: TLabel;
    cxCheckBox2: TcxCheckBox;
    frxReport1: TfrxReport;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent; DB_HANDLE:TISC_DB_HANDLE);reintroduce;
  end;

implementation

{$R *.dfm}

{ TfrmSmMainReport }

constructor TfrmSmMainReport.Create(AOwner: TComponent; DB_HANDLE: TISC_DB_HANDLE);
begin
     inherited Create(AOwner);
     cxDateEdit3.Date:=Date;
     WorkDatabase.Handle:=DB_HANDLE;
     ReadTransaction.StartTransaction;

end;

procedure TfrmSmMainReport.cxButton2Click(Sender: TObject);
begin
     close;
end;

procedure TfrmSmMainReport.cxButton1Click(Sender: TObject);
begin
      if not cxCheckBox2.Checked
      then begin
                if SmetPlusPeriodsDataSet.Active then SmetPlusPeriodsDataSet.Close;
                SmetPlusPeriodsDataSet.SelectSQL.Text:=' SELECT * FROM BU_MAIN_REPORT_FULL_INFO('+
                ''''+DateTimeToStr(cxDateEdit3.Date)+''''+',NULL, NULL,'+IntToStr(Integer(cxCheckBox1.checked))+') ORDER BY GROUP_KOD ASC , SMETA_KOD_INT ASC';
                SmetPlusPeriodsDataSet.Open;

                frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Budgeting\MainReport.fr3',true);

                frxReport1.Variables['DATE_BEG']:=''''+DateToStr(cxDateEdit3.Date)+'''';

                frxReport1.PrepareReport(true);
                Screen.Cursor:=crDefault;
                frxReport1.ShowPreparedReport;
      end
      else begin
                if SmetPlusPeriodsDataSet.Active then SmetPlusPeriodsDataSet.Close;
                SmetPlusPeriodsDataSet.SelectSQL.Text:=' SELECT * FROM BU_MAIN_REPORT_FULL_INFO_EX('+
                ''''+DateTimeToStr(cxDateEdit3.Date)+''''+',NULL,'+cxTextEdit1.EditValue+','+IntToStr(Integer(cxCheckBox1.checked))+') ORDER BY GROUP_KOD ASC , SMETA_KOD_INT ASC';
                SmetPlusPeriodsDataSet.Open;

                frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Budgeting\MainReportEx.fr3',true);

                frxReport1.Variables['DATE_BEG']:=''''+DateToStr(cxDateEdit3.Date)+'''';

                frxReport1.PrepareReport(true);
                Screen.Cursor:=crDefault;
                frxReport1.ShowPreparedReport;
      end;
end;

procedure TfrmSmMainReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

end.
