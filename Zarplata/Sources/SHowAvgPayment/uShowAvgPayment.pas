unit uShowAvgPayment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet,IBase,Dates,StrUtils,Math, ExtCtrls,uAvgPaymentConsts,
  StdCtrls, zProc;



type
  TShowAvgPaymentForm = class(TForm)
    AvgPaymentGridDBTableView: TcxGridDBTableView;
    AvgPaymentGridLevel: TcxGridLevel;
    AvgPaymentGrid: TcxGrid;
    StylesGrid: TcxStyleRepository;
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
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    MainDataBase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    AvgPaymentHolDataSet: TpFIBDataSet;
    DataSource: TDataSource;
    AvgSumColumn: TcxGridDBColumn;
    NumDaysColumn: TcxGridDBColumn;
    DateBegColumn: TcxGridDBColumn;
    AvgPaymentHospDataSet: TpFIBDataSet;
    AvgPaymentHospDataSetTOTAL_SUM: TFIBBCDField;
    AvgPaymentHospDataSetTOTAL_DAYS: TFIBIntegerField;
    AvgPaymentHospDataSetTOTAL_HOURS: TFIBBCDField;
    AvgPaymentHospDataSetKOD_SETUP: TFIBIntegerField;
    AvgPaymentHospDataSetDATE_BEG: TFIBDateField;
    AvgPaymentHospDataSetDATE_END: TFIBDateField;
    TotalHoursColumn: TcxGridDBColumn;
    GetHolBegDataSet: TpFIBDataSet;
    GetHospBegDataSet: TpFIBDataSet;
    GetHospBegDataSetFIRST_DATE_BEG: TFIBDateField;
    HospitalTableView: TcxGridDBTableView;
    HospitalTotalSumColumn: TcxGridDBColumn;
    HospitalTotalDaysColumn: TcxGridDBColumn;
    HospitalTotalHoursColumn: TcxGridDBColumn;
    HospitalDateBegColumn: TcxGridDBColumn;
    HospDataSource: TDataSource;
    ResultPanel: TPanel;
    HospitalDetailsDataSet: TpFIBDataSet;
    HospitalDetailsDataSetWORK_DAYS: TFIBIntegerField;
    HospitalDetailsDataSetWORK_HOURS: TFIBBCDField;
    HospitalDetailsDataSetIS_SMENA: TFIBStringField;
    HospDataGroupBox: TGroupBox;
    DaysLabel: TLabel;
    HoursLabel: TLabel;
    AvgPaymentLabel: TLabel;
    DaysCaption: TLabel;
    HoursCaption: TLabel;
    AvgPaymentCaption: TLabel;
    IsSmenaLabel: TLabel;
    ConstsDataSet: TpFIBDataSet;
    ConstsDataSetCURRENT_KOD: TFIBIntegerField;
    ConstsDataSetIS_UNIVER: TFIBStringField;
    SummaColumn: TcxGridDBColumn;
    KoeffColumn: TcxGridDBColumn;
    procedure AvgPaymentHolDataSetDATE_BEGGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure AvgPaymentGridDBTableViewDataControllerSummaryAfterSummary(
      ASender: TcxDataSummary);
    procedure HospitalTableViewDataControllerSummaryAfterSummary(
      ASender: TcxDataSummary);

  private

  public
      constructor Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE);reintroduce;

  end;

      function ShowHolidayAvg(AOwner:TComponent; DB_HANDLE:TISC_DB_HANDLE;
                                RMoving:Integer;StartingMonth:TDate;
                                KolMonth:Integer;IdVidopl:Integer;IdHol:integer):Variant; stdcall;

      function ShowHospitalAvg(AOwner:TComponent; DB_HANDLE:TISC_DB_HANDLE;
                               IdMan:Integer;StartingMonth:TDate;
                               KolMonth:Integer;IdHosp:Integer):Variant; stdcall;


      exports ShowHolidayAvg,ShowHospitalAvg;

      procedure FormPrepare(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE);


var
  ShowAvgPaymentForm: TShowAvgPaymentForm;

implementation

constructor TShowAvgPaymentForm.Create(AOwner:TComponent;
                                             DB_HANDLE:TISC_DB_HANDLE);
begin
    inherited Create(AOwner);
    MainDataBase.Handle:=DB_HANDLE;
end;


function GetAvg(DSet:TpFIBDataSet;IsClock:boolean):Double;
var Summa:Double;
    Hours:Double;
    Days: Integer;
begin

  DSet.First;
  Summa := 0;
  Hours := 0;
  Days := 0;

  while not DSet.Eof do
  begin
        if not VarIsNull(DSet['AVG_SUMMA']) then Summa := Summa + DSet['AVG_SUMMA'];
//        if not VarIsNull(DSet['SUM_HOURS']) then Hours := Hours + DSet['TOTAL_HOURS'];
        if not VarIsNull(DSet['NUM_DAYS']) then Days := Days + DSet['NUM_DAYS'];

        DSet.Next;
  end;

  Result := 0;

  if (IsClock) and (Hours<>0) then Result := zRoundTo(Summa/Hours,-2);
  if (not IsClock) and (Days<>0) then Result := zRoundTo(Summa/Days,-2);
end;

function ShowHolidayAvg(AOwner:TComponent; DB_HANDLE:TISC_DB_HANDLE;
                               RMoving:Integer;StartingMonth:TDate;
                               KolMonth:Integer;IdVidopl:Integer;IdHol:integer):Variant;
var

KodStart:Integer;
DateBeg:TDate;
IsUniver:String;
CurrentKod:Integer;

begin

    FormPrepare(AOwner,DB_HANDLE);

 with ShowAvgPaymentForm do
    begin
        //Определить версию системы и текущий код периода
        ConstsDataSet.Open;
        IsUniver:=ConstsDataSet['IS_UNIVER'];
        CurrentKod:=ConstsDataSet['CURRENT_KOD'];

        AvgPaymentGridLevel.GridView:=AvgPaymentGridDBTableView;
        //Нужно получит дату начала отпуска
        GetHolBegDataSet.
                Params.ParamByName('ID_VIDOPL').Value:=IdVidopl;

        GetHolBegDataSet.
                Params.ParamByName('RMOVING').Value:=RMoving;

        GetHolBegDataSet.
             ParamByName('DATE_BEG').Value:=DateToSTr(StartingMonth);

        ResultPanel.Visible:=False;



        GetHolBegDataSet.Open;

        DateBeg:=StrToDate(ShowAvgPaymentForm.
                    GetHolBegDataSet['FIRST_DATE_BEG']);

        KodStart:=Dates.ConvertDateToKod(DateBeg);

        GetHolBegDataSet.Close;


        //Загоняем параметры в запрос
        if (IsUniver='T') then
        begin

            AvgPaymentHolDataSet.SQLs.SelectSQL.Text:='SELECT * FROM Z_COUNT_AVARAGE_PAYMENT_UNIVER '+
                                        '('''+DateToStr(DateBeg)+''','+IntToStr(KolMonth)+','+IntToStr(RMoving)+','+
                                        IntToStr(CurrentKod)+','+IntToStr(IdHol)+')';
        end
        else
        begin
          AvgPaymentHolDataSet.
                  Params.ParamByName('RMOVING').Value:=RMoving;

          AvgPaymentHolDataSet.
                  Params.ParamByName('STARTING_MONTH').Value:=KodStart;

          AvgPaymentHolDataSet.
                  Params.ParamByName('KOL_MONTH').Value:=KolMonth;

        end;

        DataSource.DataSet:=
                ShowAvgPaymentForm.AvgPaymentHolDataSet;

        //Связываем поля запроса с колонгами грида
        DateBegColumn.DataBinding.FieldName:='DATE_BEG';
        NumDaysColumn.DataBinding.FieldName:='NUM_DAYS';
        AvgSumColumn.DataBinding.FieldName:='AVG_SUMMA';


        AvgPaymentHolDataSet.Filter:='AVG_SUMMA>0';
        AvgPaymentHolDataSet.Filtered:=True;
        AvgPaymentHolDataSet.Open;

        AvgPaymentHolDataSet.First;

        AvgPaymentGridDBTableView.DataController.Summary.FooterSummaryValues[2]:='Середній = '+FloatToStr(GetAvg(AvgPaymentHolDataSet,False));;

        ShowModal;
        Free;

    end;
end;


function ShowHospitalAvg(AOwner:TComponent; DB_HANDLE:TISC_DB_HANDLE;
                                IdMan:Integer;StartingMonth:TDate;
                                KolMonth:Integer;IdHosp:Integer):Variant;
var
KodStart:Integer;
DateBeg:TDate;
TotalDays:Variant;
TotalHours:Variant;
TotalSum:Variant;
begin

    FormPrepare(AOwner,DB_HANDLE);

  with ShowAvgPaymentForm do
    begin

        HospDataGroupBox.Caption:=HospDataGroupBoxCaption;

        AvgPaymentGridLevel.GridView:=HospitalTableView;

        GetHospBegDataSet.ParamByName('ID_HOSP').Value:=IdHosp;

        GetHospBegDataSet.Open;
        DateBeg:=GetHospBegDataSet['FIRST_DATE_BEG'];
        GetHospBegDataSet.Close;

        KodStart:=Dates.ConvertDateToKod(DateBeg);

        DataSource.DataSet:=AvgPaymentHospDataSet;
        AvgPaymentHospDataSet.Params.ParamByName('STARTING_MONTH').Value:=
                                                                    KodStart;
        AvgPaymentHospDataSet.Params.ParamByName('ID_MAN').Value:=IdMan;
        AvgPaymentHospDataSet.Params.ParamByName('KOL_MONTH').Value:=6;
        AvgPaymentHospDataSet.Params.ParamByName('ID_HOSP').Value:=IdHosp;



        //Связываем поля запроса с колонками грида
        DateBegColumn.DataBinding.FieldName:='DATE_BEG';
        NumDaysColumn.DataBinding.FieldName:='TOTAL_DAYS';
        AvgSumColumn.DataBinding.FieldName:='TOTAL_SUM';
        TotalHoursColumn.DataBinding.FieldName:='TOTAL_HOURS';

        AvgPaymentHospDataSet.Filter:='TOTAL_SUM>0';
        AvgPaymentHospDataSet.Filtered:=True;
        ShowMessage(AvgPaymentHospDataSet.SQLs.SelectSQL.Text);
        AvgPaymentHospDataSet.Open;


        //Получит кол-во рабочих дней/часов
        HospitalDetailsDataSet.ParamByName('ID_HOSP').Value:=IdHosp;

        HospitalDetailsDataSet.Open;
        DaysLabel.Caption:=
                    HospitalDetailsDataSet['WORK_DAYS'];
        DaysCaption.Caption:=DaysColumnCaption;
        HoursCaption.Caption:=HoursSumColumnCaption;
        AvgPaymentCaption.Caption:=uAvgPaymentConsts.AvgPaymentCaption;


        HoursLabel.Caption:=HospitalDetailsDataSet['WORK_HOURS'];

        TotalDays:=HospitalTableView.
                            DataController.Summary.FooterSummaryValues[1];
        TotalHours:=HospitalTableView.
                            DataController.Summary.FooterSummaryValues[2];
        TotalSum:=HospitalTableView.
                            DataController.Summary.FooterSummaryValues[0];

        if HospitalDetailsDataSet['IS_SMENA']='F' then
            AvgPaymentLabel.Caption:=
                    FloatToStr(SimpleRoundTo(TotalSum/TotalDays,-2))
                    else
                            begin
                            IsSmenaLabel.Caption:=IsSmenaCaption;
                            IsSmenaLabel.Visible:=True;
                            AvgPaymentLabel.Caption:=
                               FloatToStr(SimpleRoundTo(TotalSum/TotalHours,-2));
                            end;





        ShowModal;
        Free;

    end;






end;


{$R *.dfm}

procedure TShowAvgPaymentForm.AvgPaymentHolDataSetDATE_BEGGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
var
    S:string;
    i:integer;
begin
    S:=AvgPaymentHolDataSet['DATE_BEG'].AsString;
    i:=pos('.',S);

    S:=copy(S,i+1,Length(S));
    S:=AnsiReplaceStr(S,'.','/');
    Text:=S;
end;


procedure TShowAvgPaymentForm.AvgPaymentGridDBTableViewDataControllerSummaryAfterSummary(
  ASender: TcxDataSummary);

  var
    TotalDays:Variant;
    TotalSum:Variant;

begin
   TotalSum:=AvgPaymentGridDBTableView.DataController.
                                        Summary.FooterSummaryValues[0];

   TotalDays:=AvgPaymentGridDBTableView.DataController.
                                        Summary.FooterSummaryValues[1];


 if (not VarIsNull(TotalSum)) then
  ASender.DataController.Summary.FooterSummaryValues[2]:=
            uAvgPaymentConsts.AvgPaymentCaption+
                         FloatToStr(SimpleRoundTo(TotalSum/TotalDays,-2));

end;

procedure FormPrepare(AOwner: TComponent;
  DB_HANDLE: TISC_DB_HANDLE);
begin

  //Создаем форму
  ShowAvgPaymentForm:=TShowAvgPaymentForm.Create(AOwner,DB_HANDLE);

  with ShowAvgPaymentForm do
    begin


        //Прописываем константы
        Caption:=uAvgPaymentConsts.FormCaption;

        DateBegColumn.Caption:=
            uAvgPaymentConsts.PeriodColumnCaption;

        NumDaysColumn.Caption:=
            uAvgPaymentConsts.DaysColumnCaption;

{        AvgSumColumn.Caption:=
            uAvgPaymentConsts.SumColumnCaption;}

        TotalHoursColumn.Caption:=
            uAvgPaymentConsts.HoursSumColumnCaption;

        HospitalDateBegColumn.Caption:=
                uAvgPaymentConsts.PeriodColumnCaption;

        HospitalTotalDaysColumn.Caption:=
                     uAvgPaymentConsts.DaysColumnCaption;

        HospitalTotalSumColumn.Caption:=
                uAvgPaymentConsts.SumColumnCaption;

        HospitalTotalHoursColumn.Caption:=
                uAvgPaymentConsts.HoursSumColumnCaption;



        AvgPaymentGridDBTableView.DataController.
            Summary.FooterSummaryItems.Items[0].Format:=
                            uAvgPaymentConsts.TotalSumCaption+'0.00';

        AvgPaymentGridDBTableView.DataController.
            Summary.FooterSummaryItems.Items[1].Format:=
                        uAvgPaymentConsts.TotalDaysCaption+'0';

        HospitalTableView.DataController.Summary.
                FooterSummaryItems.Items[0].
                     Format:=uAvgPaymentConsts.TotalSumCaption+'0.00';

   end;

end;

procedure TShowAvgPaymentForm.HospitalTableViewDataControllerSummaryAfterSummary(
  ASender: TcxDataSummary);
var
    TotalDays : Variant;
    TotalHours: Variant;
    A,S   : string;
begin
{    TotalDays:=ASender.FooterSummaryValues[1];
    TotalHours:=ASender.FooterSummaryValues[2];

    if (not VarIsNull(TotalDays)) then
                begin
                   A:=TotalHours;
                   S:=TotalHours;

                   ASender.FooterSummaryValues[3]:=
                            uAvgPaymentConsts.
                                   DaysAndHoursCaption+S+' /'+A;

                end;}
end;

end.
