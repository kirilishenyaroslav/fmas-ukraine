
{ -$Id: UniPrint.pas,v 1.2 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                          Модуль "Печать отчетов"                             }
{                    Печать присутствующих в системе отчетов                   ы}
{                                                  ответственный: Олег Волков  }

unit UniPrint;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    StdCtrls, Buttons, Db, IBCustomDataSet, IBQuery, PersonalCommon, Grids,
    DBGrids, ComCtrls, FR_Desgn, FR_DSet, FR_DBSet, FR_Class, SpCommon, Variants;

type
    TUniPrintForm = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        AllReportsQuery: TIBQuery;
        AllReportsQueryID_REPORT: TIntegerField;
        AllReportsQueryNAME_REPORT: TIBStringField;
        AllReportsQueryFRF_FILE: TIBStringField;
        AllReportsQueryPROC_NAME: TIBStringField;
        AllReportsQueryFORM_NAME: TIBStringField;
        AllReportsQueryNEED_PERIOD: TIBStringField;
        AllReportsSource: TDataSource;
        BonusGrid: TDBGrid;
        Label1: TLabel;
        Label2: TLabel;
        PeriodLabel: TLabel;
        DateBeg: TDateTimePicker;
        EndLabel: TLabel;
        DateEnd: TDateTimePicker;
        theReport: TfrReport;
        frDataset1: TfrDBDataSet;
        ReportQuery: TIBQuery;
        ReportDate: TDateTimePicker;
        AllReportsQueryACCESS_NAME: TIBStringField;
        procedure FormCreate(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure AllReportsSourceDataChange(Sender: TObject; Field: TField);
        procedure BonusGridDblClick(Sender: TObject);
        procedure FormShow(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    UniPrintForm: TUniPrintForm;

implementation

{$R *.DFM}

procedure TUniPrintForm.FormCreate(Sender: TObject);
begin
    AllReportsQuery.Transaction := PersonalCommon.ReadTransaction;
    AllReportsQuery.Open;
    ReportDate.Date := Date;
    DateBeg.Date := Date;
    DateEnd.Date := Date;
end;

procedure TUniPrintForm.OkButtonClick(Sender: TObject);
var
    form: TReportForm;
    fclass: TPersistentClass;
begin
    if AllReportsQuery.IsEmpty then Exit;
    if (not AllReportsQueryACCESS_NAME.IsNull) then
    begin
        if CheckAccess('/ROOT/REPORTS/' + AllReportsQuery['ACCESS_NAME'], 'View', True) <> 0
            then EXIT;

    end;

    if Trim(AllReportsQuery['Form_Name']) <> '' then
    begin
        try
            fclass := GetClass('T' + AllReportsQuery['Form_Name']);
            if fclass <> nil then
                Application.CreateForm(TFormClass(fclass), form);
        except
        end;
        if form = nil then
        begin
            MessageDlg('Неможливо знайти форму параметрів звіту!',
                mtError, [mbOk], 0);
            Exit;
        end;
        form.Prepare(ReportDate.Date, DateBeg.Date, DateEnd.Date);
        form.ShowModal;
        form.Free;
        Exit;
    end;

    ReportQuery.Transaction := PersonalCommon.ReadTransaction;
    with ReportQuery.SQL do
    begin
        Clear;
        Add('SELECT * FROM');
        Add(AllReportsQuery['PROC_NAME']);
        Add('(''' + DateToStr(ReportDate.Date) + '''');
        if AllReportsQuery['Need_Period'] = 'T' then
        begin
            Add(',''' + DateToStr(DateBeg.Date) + '''');
            Add(',''' + DateToStr(DateEnd.Date) + ''')');
        end
        else Add(')');
    end;
    ReportQuery.Open;

    frVariables['ReportDate'] := ReportDate.Date;
    theReport.LoadFromFile(ProgramPath + AllReportsQuery['frf_File']);
    if sDesignReport then theReport.DesignReport
    else theReport.ShowReport;
end;

procedure TUniPrintForm.AllReportsSourceDataChange(Sender: TObject;
    Field: TField);
var
    b: Boolean;
begin
    b := AllReportsQuery['Need_Period'] = 'T';
    PeriodLabel.Visible := b;
    DateBeg.Visible := b;
    EndLabel.Visible := b;
    DateEnd.Visible := b;
end;

procedure TUniPrintForm.BonusGridDblClick(Sender: TObject);
begin
    OkButton.Click;
end;

procedure TUniPrintForm.FormShow(Sender: TObject);
begin
    if CheckAccess('/ROOT/REPORTS', 'View', True) <> 0 then Close;
end;

end.
