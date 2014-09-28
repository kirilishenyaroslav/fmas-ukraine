unit uNalogReCountForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxSpinEdit, StdCtrls, cxLookAndFeelPainters, cxButtons, cxButtonEdit,
  IBase,PackageLoad,dmMain, frxDesgn, frxClass, frxDBSet,ZWait,
  cxProgressBar, DBCtrls, zProc, pFibStoredProc, pfibDataBase, zMessages,
  Dates, frxExportRTF, frxExportXLS;

type
  TNalogReCountForm = class(TForm)
    PeriodBox: TGroupBox;
    Label1: TLabel;
    YearSpinEdit: TcxSpinEdit;
    Label2: TLabel;
    MonthBegEdit: TcxSpinEdit;
    Label3: TLabel;
    MonthEndEdit: TcxSpinEdit;
    GroupBox1: TGroupBox;
    GetManRadioBtn: TRadioButton;
    AllPeopleRadioBtn: TRadioButton;
    ManEdit: TcxButtonEdit;
    Label4: TLabel;
    OkBtn: TcxButton;
    CancelBtn: TcxButton;
    ReportDataSet: TfrxDBDataset;
    frxDesigner: TfrxDesigner;
    GroupBox2: TGroupBox;
    ProgressBar: TcxProgressBar;
    FIOText: TDBText;
    Report: TfrxReport;
    frxRTFExport1: TfrxRTFExport;
    frxXLSExport1: TfrxXLSExport;
    procedure GetManRadioBtnClick(Sender: TObject);
    procedure AllPeopleRadioBtnClick(Sender: TObject);
    procedure ManEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure OkBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ReportGetValue(const VarName: String; var Value: Variant);
    procedure ReportAfterPrintReport(Sender: TObject);
  private
    FIdMan:Integer;
  public

  end;
  function ShowNalogReCountForm(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE):
                                                 Variant;stdcall;
  exports  ShowNalogReCountForm;

var
  NalogReCountForm: TNalogReCountForm;

implementation

uses pFIBDataSet;

{$R *.dfm}

function ShowNalogReCountForm(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE):Variant;
var
    form:TNalogReCountForm;
begin

    MainDM:=TMainDm.Create(AOwner);
    MainDM.MainDatabase.Handle:=DB_HANDLE;
    MainDM.MainDatabase.Connected:=True;
    form:=TNalogReCountForm.Create(AOWner);

    form.YearSpinEdit.Value:=YearMonthFromKodSetup(CurrentKodSetup(DB_HANDLE));

    form.FIdMan:=-1;
    form.ShowModal;

    Result:=null;

end;


procedure TNalogReCountForm.GetManRadioBtnClick(Sender: TObject);
begin
    ManEdit.Enabled:=True;

end;

procedure TNalogReCountForm.AllPeopleRadioBtnClick(Sender: TObject);
begin
    ManEdit.Enabled:=False;
    FIdMan:=-1;

end;

procedure TNalogReCountForm.ManEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
    PeopleArray:Variant;
begin

    PeopleArray:=LoadPeopleModal(self,MainDM.MainDataBase.Handle);
    ManEdit.Text:=PeopleArray[1]+' ' +PeopleArray[2]+' '+PeopleArray[3];
    FIdMan:=PeopleArray[0];

end;

procedure TNalogReCountForm.OkBtnClick(Sender: TObject);
var
WaitForm: TForm;
KodBeg,KodEnd,IdReestr:Integer;

begin
    MainDM.PrepareDataSet.ParamByName('YEAR_SET').Value:=YearSpinEdit.Value;
    MainDM.PrepareDataSet.ParamByName('MONTH_BEG').Value:=MonthBegEdit.Value;
    MainDM.PrepareDataSet.ParamByName('MONTH_END').Value:=MonthEndEdit.Value;

    MainDM.WriteTransaction.StartTransaction;

    try
        MainDm.PrepareDataSet.Open;
        KodBeg:=MainDM.PrepareDataSet['KOD_BEG'];
        KodEnd:=MainDM.PrepareDataSet['KOD_END'];
        IdReestr:=MainDM.PrepareDataSet['ID_REESTR'];
        MainDM.PrepareDataSet.Close;

        MainDM.WriteTransaction.Commit;
    except on E:Exception
    do
        begin
            ShowMessage(E.Message);
            MainDM.WriteTransaction.Rollback;
        end;
    end;


    MainDM.WriteTransaction.StartTransaction;

    try
        MainDM.ClearQuery.ExecQuery;
        MainDM.WriteTransaction.Commit;
    except on E:Exception
    do
        begin
            ShowMessage(E.Message);
            MainDM.WriteTransaction.Rollback;
        end;
    end;

    if (FIdMan<>-1) then
    begin
        MainDM.PeopleDataSet.SelectSQL.Text:='SELECT DISTINCT ID_MAN,FAMILIA FROM PEOPLE '+
                                ' WHERE ID_MAN='+IntToStr(FIdMan);
        FioText.DataField:='FAMILIA';
    end
    else
    begin
        //MainDM.PeopleDataSet.SelectSQL.Text:='SELECT DISTINCT ID_MAN,FAMILIA FROM PEOPLE ';
        MainDM.PeopleDataSet.SelectSQL.Text:='SELECT DISTINCT ID_MAN, FIO FROM Z_GET_PEOPLE_NALOG_FORMA('+VarToStr(YearSpinEdit.Value)+','+
        VarToStr(MonthBegEdit.Value)+','+vartostr(MonthEndEdit.Value)+') order by FIO';
        FioText.DataField:='FIO';
    end;
    MainDM.PeopleDataSet.Open;
    MainDM.PeopleDataSet.First;

    ProgressBar.Properties.Max:=MainDM.PeopleDataSet.RecordCountFromSrv;

    while (not MainDM.PeopleDataSet.Eof) do
    begin

        MainDM.WriteTransaction.StartTransaction;

        try
            MainDM.CreateSpravkiProc.ParamByName('ID_MAN').Value:=
                                                 MainDM.PeopleDataSet['ID_MAN'];
            MainDM.CreateSpravkiProc.ParamByName('KOD_BEG').Value:=KodBeg;
            MainDM.CreateSpravkiProc.ParamByName('KOD_END').Value:=KodEnd;
            MainDM.CreateSpravkiProc.ParamByName('ID_REESTR').Value:=IdReestr;
            MainDm.CreateSpravkiProc.ExecProc;
            MainDM.WriteTransaction.Commit;
        except on E:Exception
        do
        begin
            ShowMessage(E.Message);
            MainDM.WriteTransaction.Rollback;
        end;
        end;

        MainDM.PeopleDataSet.Next;
        ProgressBar.Position:=ProgressBar.Position+1;
        Application.ProcessMessages;
    end;

    WaitForm:=ShowWaitForm(Self);
    MainDm.SpravkiDataSet.CloseOpen(True);
    CloseWaitForm(WaitForm);

    Report.LoadFromFile('Reports\Zarplata\NalogReCountSpravka.fr3');
    if zDesignReport then Report.DesignReport
                     else Report.ShowReport;


end;

procedure TNalogReCountForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    MainDm.Free;
end;

procedure TNalogReCountForm.ReportGetValue(const VarName: String;
  var Value: Variant);
var tmpName:string;
begin
  tmpName := AnsiUpperCase(VarName);
  if pos('ZSETUP',tmpName)=1 then
  begin
     delete(tmpName,1,6);
     Value := ValueFieldZSetup(MainDM.MainDatabase.Handle,tmpName);
  end;
end;

procedure TNalogReCountForm.ReportAfterPrintReport(Sender: TObject);
var pStProc:TpFIBStoredProc;
    pTransaction:TpFIBTransaction;
    pDataBase:TpFIBDatabase;
begin
  pDataBase := TpFIBDatabase.Create(Application.MainForm);
  pTransaction := TpFIBTransaction.Create(Application.MainForm);
  pStProc := TpFIBStoredProc.Create(Application.MainForm);

    try
       pDataBase.SQLDialect := 3;
       pDataBase.DefaultTransaction := pTransaction;
       pTransaction.DefaultDatabase := pDataBase;
       pStProc.Database := pDataBase;
       pStProc.Transaction := pTransaction;

       pDataBase.Handle := MainDM.MainDatabase.Handle;
       pStProc.Transaction.StartTransaction;
       pStProc.StoredProcName := 'Z_SPRAVKA_NUMBER_INC';
       pStProc.Prepare;
       pStProc.ExecProc;
       pStProc.Transaction.Commit;
    except
      on e:exception do
       begin
        pStProc.Transaction.Rollback;
        zShowMessage('Помилка',e.Message,mtError,[mbOK]);
       end;
    end;

  pStProc.Destroy;
  pTransaction.Destroy;
  pDataBase.Destroy;
end;

end.
