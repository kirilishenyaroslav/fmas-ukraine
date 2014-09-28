unit uNalogReestr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,uNalogReestrDM, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ExtCtrls,IBase, StdCtrls, Buttons, frxDesgn,
  frxClass, frxDBSet,ZMessages, frxExportXLS, ZProc;

type
  TNalogReestrForm = class(TForm)
    ToolPanel: TPanel;
    MainGridDBTableView1: TcxGridDBTableView;
    MainGridLevel1: TcxGridLevel;
    MainGrid: TcxGrid;
    MainGridDBTableView1DATE_REG: TcxGridDBColumn;
    MainGridDBTableView1YEAR_SET: TcxGridDBColumn;
    MainGridDBTableView1COUNT: TcxGridDBColumn;
    ShowReportBtn: TBitBtn;
    GroupBtn: TBitBtn;
    ExitBtn: TBitBtn;
    ReportDataSet: TfrxDBDataset;
    Designer: TfrxDesigner;
    Report: TfrxReport;
    DeleteBtn: TBitBtn;
    frxXLSExport1: TfrxXLSExport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ShowReportBtnClick(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure GroupBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function ShowNalogReCountReestr(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE):
                                                 Variant;stdcall;
  exports  ShowNalogReCountReestr;


var
  NalogReestrForm: TNalogReestrForm;

implementation
{$R *.dfm}

function ShowNalogReCountReestr(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE):Variant;
var
    form:TNalogReestrForm;
begin
    NalogReestrDM:=TNalogReestrDM.Create(AOwner);
    NalogReestrDM.MainDatabase.Handle:=DB_HANDLE;
    NalogReestrDM.MainDatabase.Connected:=True;

    form:=TNalogReestrForm.Create(AOWner);
    NalogReestrDM.ReestrDataSet.CloseOpen(True);
    form.Show;

    Result:=null;

end;

procedure TNalogReestrForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    NalogReestrDM.Free;
    Action:=caFree;
end;

procedure TNalogReestrForm.ShowReportBtnClick(Sender: TObject);
begin

   NalogReestrDM.PrintDataSet.ParamByName('ID_REESTR').Value:=
                                                NalogReestrDM.ReestrDataSet['ID_REESTR'];
   NalogReestrDM.PrintDataSet.CloseOpen(True);

   Report.LoadFromFile('Reports\Zarplata\NalogReestrList.fr3');
   Report.Variables['YEAR_SET']:=
                   QuotedStr(IntToStr(NalogReestrDM.ReestrDataSet['YEAR_SET']));
   Report.Variables['DATE_VIDAN']:=
                   QuotedStr(DateToStr(NalogReestrDM.ReestrDataSet['DATE_REG']));

   if zDesignReport then Report.DesignReport
                     else Report.ShowReport;

end;

procedure TNalogReestrForm.ExitBtnClick(Sender: TObject);
begin
    Close;
end;

procedure TNalogReestrForm.GroupBtnClick(Sender: TObject);
begin

    with NalogReestrDM do
    begin
        WriteTransaction.StartTransaction;
        FillCurrentProc.ParamByName('ID_REESTR').Value:=ReestrDataSet['ID_REESTR'];
        try
            FillCurrentProc.ExecProc;
            WriteTransaction.Commit;
        except on E:Exception
        do
        begin
            ShowMessage(E.Message);
            WriteTransaction.Rollback;
        end;
        end;

    end;
 ShowMessage('Дані додані до поточних операцій!');


end;

procedure TNalogReestrForm.DeleteBtnClick(Sender: TObject);
begin

    if (ZShowMessage('Вилучити',
        'Ви справді бажаєете вилучити цей реєстр?',
         mtConfirmation,[mbOk,MbCancel])=mrOk) then
    begin
        NalogReestrDm.DeleteReestrSP.ParamByName('ID_REESTR').Value:=
            NalogReestrDM.ReestrDataSet['ID_REESTR'];
        NalogReestrDm.WriteTransaction.StartTransaction;

        try
            NalogReestrDm.DeleteReestrSP.ExecProc;
            NalogReestrDM.WriteTransaction.Commit;
        except on E:Exception
        do
            begin
                ZShowMessage('Помилка!',E.Message,mtError,[mbOk]);
                NalogReestrDM.WriteTransaction.Rollback;
            end;
        end;
    NalogReestrDm.ReestrDataSet.CloseOpen(True);
    end;

end;

end.
