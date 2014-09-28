unit Arnd_Sch_Add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxGroupBox, StdCtrls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxButtonEdit, cxGridBandedTableView, cxClasses,
  cxStyles, cxGridTableView, cxMemo, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxCurrencyEdit, cxLookAndFeelPainters, cxButtons,
  cxGridLevel, cxGridCustomTableView, cxGridCustomView, cxGrid, ExtCtrls,
  cxDropDownEdit, cxCalendar, DB, FIBDataSet, pFIBDataSet, LoadDogManedger,
  FIBQuery, pFIBQuery, pFIBStoredProc, cxRadioGroup, cxTL, ActnList,
  cxCheckBox;

type
  TPeriodRecord = packed record
   _id_Period : integer;
   _Date_Beg  : TDate;
   _Date_End  : TDate;
   _Sum       : currency;
   _arnd_summ       : currency;
  end;

 TSchRecord = packed record
   _id_sch : integer;
   _Date_Beg  : TDate;
   _Date_End  : TDate;
   _Sum       : currency;
  end;

  TSmetRecord = packed record
   _id_Period : integer;
   _Kod_S     : variant;
   _Kod_R     : variant;
   _Kod_St    : variant;
   _Kod_Kekv  : variant;
   _Sum       : currency;
   _S_Name    : variant;
   _R_Name    : variant;
   _St_Name   : variant;
   _Kekv_Name : variant;
   _id_S      : integer;
   _id_R      : integer;
   _id_St     : integer;
   _id_Kekv   : integer;
   _id_Fav    : integer;
   _fav_cnt   : double;
   _tarif     : extended;
   _arnd_sum  : extended;
   _id_sch_recalc : integer;
  end;

  TPeriodArray = array of TPeriodRecord;
  TSchArray  = array of TSchRecord;
  TSmetArray = array of TSmetRecord;

  TArnd_Sch_Add_Form = class(TForm)
    Panel: TPanel;
    DogGroupBox: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label11: TLabel;
    Label21: TLabel;
    DogNameEdit: TcxButtonEdit;
    NameCustEdit: TcxTextEdit;
    MFOEdit: TcxTextEdit;
    RateAccEdit: TcxTextEdit;
    NoteMemo: TcxMemo;
    RegNumEdit: TcxTextEdit;
    MainPanel: TPanel;
    SmetGrid: TcxGrid;
    SmetTableView: TcxGridBandedTableView;
    S_Column: TcxGridBandedColumn;
    R_Column: TcxGridBandedColumn;
    St_Column: TcxGridBandedColumn;
    Kekv_Column: TcxGridBandedColumn;
    Sum_Column: TcxGridBandedColumn;
    S_Name_Column: TcxGridBandedColumn;
    R_Name_Column: TcxGridBandedColumn;
    St_Name_Column: TcxGridBandedColumn;
    id_S_Column: TcxGridBandedColumn;
    id_R_Column: TcxGridBandedColumn;
    id_St_Column: TcxGridBandedColumn;
    id_Kekv_Column: TcxGridBandedColumn;
    Kekv_Name_Column: TcxGridBandedColumn;
    SmetGridLevel: TcxGridLevel;
    OldSGrid: TcxGrid;
    OldSTableView: TcxGridBandedTableView;
    Old_S_Column: TcxGridBandedColumn;
    Old_R_Column: TcxGridBandedColumn;
    Old_St_Column: TcxGridBandedColumn;
    Old_Kekv_Column: TcxGridBandedColumn;
    Old_Sum_Column: TcxGridBandedColumn;
    Old_S_Name_Column: TcxGridBandedColumn;
    Old_R_Name_Column: TcxGridBandedColumn;
    Old_St_Name_Column: TcxGridBandedColumn;
    Old_id_S_Column: TcxGridBandedColumn;
    Old_id_R_Column: TcxGridBandedColumn;
    Old_id_St_Column: TcxGridBandedColumn;
    Old_id_Kekv_Column: TcxGridBandedColumn;
    Old_Kekv_Name_Column: TcxGridBandedColumn;
    OldSGridLevel: TcxGridLevel;
    BottomPanel: TPanel;
    ApplyButton: TcxButton;
    CancelButton: TcxButton;
    DoCalcButton: TcxButton;
    SchGroupBox: TcxGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    TipDogEdit: TcxTextEdit;
    NumSchEdit: TcxTextEdit;
    SumEdit: TcxTextEdit;
    NDSEdit: TcxTextEdit;
    DateSchEdit: TcxDateEdit;
    DateEndEdit: TcxDateEdit;
    KindRadioGroup: TcxRadioGroup;
    DateBegEdit: TcxTextEdit;
    cxButton1: TcxButton;
    Panel2: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    St_Label2: TLabel;
    R_Label2: TLabel;
    S_Label2: TLabel;
    Label8: TLabel;
    Kekv_Label2: TLabel;
    Panel3: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    St_Label1: TLabel;
    R_Label1: TLabel;
    S_Label1: TLabel;
    Label5: TLabel;
    KEKV_Label1: TLabel;
    DataSet: TpFIBDataSet;
    StoredProc: TpFIBStoredProc;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    cxStyle47: TcxStyle;
    cxStyle48: TcxStyle;
    cxStyle49: TcxStyle;
    cxStyle50: TcxStyle;
    cxStyle51: TcxStyle;
    cxStyle52: TcxStyle;
    cxStyle53: TcxStyle;
    cxStyle54: TcxStyle;
    cxStyle55: TcxStyle;
    cxStyle56: TcxStyle;
    cxStyle57: TcxStyle;
    cxStyle58: TcxStyle;
    cxStyle59: TcxStyle;
    cxStyle60: TcxStyle;
    cxStyle61: TcxStyle;
    cxStyle62: TcxStyle;
    cxStyle63: TcxStyle;
    cxStyle64: TcxStyle;
    cxStyle65: TcxStyle;
    cxStyle66: TcxStyle;
    cxStyle67: TcxStyle;
    cxStyle68: TcxStyle;
    cxStyle69: TcxStyle;
    cxStyle70: TcxStyle;
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
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    cxGridBandedTableViewStyleSheet2: TcxGridBandedTableViewStyleSheet;
    ActionList1: TActionList;
    save: TAction;
    calc: TAction;
    Cancel: TAction;
    _id_fav: TcxGridBandedColumn;
    _fav_cnt: TcxGridBandedColumn;
    id_fav: TcxGridBandedColumn;
    fav_cnt: TcxGridBandedColumn;
    _tarif: TcxGridBandedColumn;
    tarif: TcxGridBandedColumn;
    _arnd_sum: TcxGridBandedColumn;
    arnd_sum: TcxGridBandedColumn;
    id_period: TcxGridBandedColumn;
    DateB: TcxGridBandedColumn;
    DateE: TcxGridBandedColumn;
    StPrc: TpFIBStoredProc;
    Id_recalc_per: TcxGridBandedColumn;
    DataSetPeriods: TpFIBDataSet;
    procedure FormCreate(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DogNameEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ApplyButtonClick(Sender: TObject);
    procedure SmetTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure OldSTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure KindRadioGroupPropertiesChange(Sender: TObject);
    procedure DoCalcButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure saveExecute(Sender: TObject);
    procedure calcExecute(Sender: TObject);
    procedure CancelExecute(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure SmetTableViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure OldSTableViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure NoteMemoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ApplyButtonKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RegNumEditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
   State       : string;
   id_Sch      : integer;

   id_Type_Doc : integer;
   PK_ID       : variant;
   WORKDATE    : TDate;
   SavedBeg    : TDate;
   SavedEnd    : TDate;
   NumDoc      : string;
   PerSumAll  : currency;

   id_Dog      : int64;
   kod_Dog     : int64;
   id_Tip_Dog  : integer;
   id_Customer : Int64;
   id_Sch_DB   : integer;

   StartOfPeriod : Variant;

   CanEmptyTableViews : boolean;

   constructor Create (Aowner: TComponent; id_group: Integer);overload;
   function    SaveSch : boolean;
   function    SaveSchToDoc : boolean;
   function    GetPkId : boolean;
   procedure   CalcSch;
   procedure   ReCalculation;
   procedure   RefreshPeriods;
   procedure   ReCalculationAll;
   procedure   ReCalculationAll2;


//   procedure   GetPlanForSch(D1:TDate;D2:TDate;id_sch:integer);

   function   CodeDayFormat(DateCon: TDate):String;

  end;

var
  Arnd_Sch_Add_Form: TArnd_Sch_Add_Form;
  hwn : THandle;
  group : Integer;

implementation

uses Arnd_Sch, DateUtils, Math, DogLoaderUnit,Kernel;

{$R *.dfm}

constructor TArnd_Sch_Add_Form.Create(Aowner: TComponent; id_group: Integer);
begin
  inherited Create (Aowner);
  group := id_group;
end;

procedure TArnd_Sch_Add_Form.FormCreate(Sender: TObject);
begin
  PerSumAll:=0;
 StartOfPeriod := null;

 CanEmptyTableViews := True;

 // Начальная инициализация гридов
 S_Column.DataBinding.ValueTypeClass        := TcxIntegerValueType;
 Old_S_Column.DataBinding.ValueTypeClass    := TcxIntegerValueType;
 R_Column.DataBinding.ValueTypeClass        := TcxIntegerValueType;
 Old_R_Column.DataBinding.ValueTypeClass    := TcxIntegerValueType;
 St_Column.DataBinding.ValueTypeClass       := TcxIntegerValueType;
 Old_St_Column.DataBinding.ValueTypeClass   := TcxIntegerValueType;
 Kekv_Column.DataBinding.ValueTypeClass     := TcxIntegerValueType;
 Old_Kekv_Column.DataBinding.ValueTypeClass := TcxIntegerValueType;

 Sum_Column.DataBinding.ValueTypeClass      := TcxCurrencyValueType;
 Old_Sum_Column.DataBinding.ValueTypeClass  := TcxCurrencyValueType;

 _id_fav.DataBinding.ValueTypeClass :=TcxIntegerValueType;
 id_fav.DataBinding.ValueTypeClass :=TcxIntegerValueType;
 id_period.DataBinding.ValueTypeClass :=TcxIntegerValueType;

 Id_recalc_per.DataBinding.ValueTypeClass :=TcxIntegerValueType;

 DateB.DataBinding.ValueTypeClass :=TcxStringValueType;
 DateE.DataBinding.ValueTypeClass :=TcxStringValueType;

 _fav_cnt.DataBinding.ValueTypeClass :=TcxFloatValueType;
 fav_cnt.DataBinding.ValueTypeClass :=TcxFloatValueType;
 _tarif.DataBinding.ValueTypeClass :=TcxFloatValueType;
 tarif.DataBinding.ValueTypeClass :=TcxFloatValueType;
 _arnd_sum.DataBinding.ValueTypeClass :=TcxFloatValueType;
 arnd_sum.DataBinding.ValueTypeClass :=TcxFloatValueType;


 S_Name_Column.DataBinding.ValueTypeClass      := TcxStringValueType;
 R_Name_Column.DataBinding.ValueTypeClass      := TcxStringValueType;
 St_Name_Column.DataBinding.ValueTypeClass     := TcxStringValueType;
 Kekv_Name_Column.DataBinding.ValueTypeClass   := TcxStringValueType;

 Old_S_Name_Column.DataBinding.ValueTypeClass    := TcxStringValueType;
 Old_R_Name_Column.DataBinding.ValueTypeClass    := TcxStringValueType;
 Old_St_Name_Column.DataBinding.ValueTypeClass   := TcxStringValueType;
 Old_Kekv_Name_Column.DataBinding.ValueTypeClass := TcxStringValueType;

 id_S_Column.DataBinding.ValueTypeClass        := TcxIntegerValueType;
 id_R_Column.DataBinding.ValueTypeClass        := TcxIntegerValueType;
 id_St_Column.DataBinding.ValueTypeClass       := TcxIntegerValueType;
 id_Kekv_Column.DataBinding.ValueTypeClass     := TcxIntegerValueType;

 Old_id_S_Column.DataBinding.ValueTypeClass    := TcxIntegerValueType;
 Old_id_R_Column.DataBinding.ValueTypeClass    := TcxIntegerValueType;
 Old_id_St_Column.DataBinding.ValueTypeClass   := TcxIntegerValueType;
 Old_id_Kekv_Column.DataBinding.ValueTypeClass := TcxIntegerValueType;

 S_Label1.Caption    := '';
 R_Label1.Caption    := '';
 St_Label1.Caption   := '';
 Kekv_Label1.Caption := '';

 S_Label2.Caption    := '';
 R_Label2.Caption    := '';
 St_Label2.Caption   := '';
 Kekv_Label2.Caption := '';

 DataSet.Database       := (Owner as TArnd_Sch_Form).Database;
 DataSetPeriods.Database       := (Owner as TArnd_Sch_Form).Database;

 StoredProc.Database    := (Owner as TArnd_Sch_Form).Database;
 StPrc.Database         := (Owner as TArnd_Sch_Form).Database;

 StoredProc.Transaction := (Owner as TArnd_Sch_Form).WriteTransaction;
 StPrc.Transaction := (Owner as TArnd_Sch_Form).WriteTransaction;
end;

procedure TArnd_Sch_Add_Form.CancelButtonClick(Sender: TObject);
begin
 if fsModal in FormState then ModalResult := mrCancel
 else Close;
end;

procedure TArnd_Sch_Add_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;

// Расчёт счёта
procedure TArnd_Sch_Add_Form.CalcSch;
var
 DateBeg : TDate;
 DateEnd : TDate;

 Periods : TPeriodArray;
 Smets   : TSmetArray;

 i, j, t : integer;
 PerSum  : currency;
 SSum    : currency;

 DBeg    : TDate;
 DEnd    : TDate;

 MaxSum  : currency;
 MaxNum  : integer;

 Flag    : boolean;
 // Поиск перечсечения перидов
 function FindCross(InDateBeg, InDateEnd : TDate; var OutDateBeg, OutDateEnd : TDate) : boolean;
 begin
  Result := True;

  if (InDateEnd >= DateBeg) and (InDateEnd <= DateEnd) then begin
   if InDateBeg > DateBeg then OutDateBeg := InDateBeg
   else OutDateBeg := DateBeg;

   OutDateEnd := InDateEnd;
  end
  else if (InDateBeg >= DateBeg) and (InDateBeg <= DateEnd) then begin
   OutDateBeg := InDateBeg;

   if InDateEnd < DateEnd then OutDateEnd := InDateEnd
   else OutDateEnd := DateEnd;
  end
  else Result := False;
 end;

 // Нахождение суммы периода
 function FindPeriodSum(DBeg, DEnd : TDate; InSum : currency) : currency;
 var
  Month : word;
  Year  : word;
 begin
  Result := 0;

  if (MonthOfTheYear(DBeg) = MonthOfTheYear(DEnd)) and (YearOf(DBeg) = YearOf(DEnd)) then
   Result := InSum * (DEnd - DBeg + 1) / DaysInMonth(DBeg)
  else begin
   Month := MonthOfTheYear(DBeg);
   Year  := YearOf(DBeg);

   while YearOf(DEnd) >= Year do begin
    while MonthOfTheYear(DEnd) >= Month do begin
     if (Month = MonthOfTheYear(DBeg)) and (Year = YearOf(DBeg)) then
      Result := Result + InSum * (DaysInMonth(DBeg) - DayOf(DBeg)+1) / DaysInMonth(DBeg)
     else if (Month = MonthOfTheYear(DEnd)) and (Year = YearOf(DEnd)) then
      Result := Result + InSum * DayOf(DEnd) / DaysInMonth(DEnd)
     else
      Result := Result + InSum;

     Inc(Month);
     if Month > 12 then begin
      Month := 1;
      Break;
     end;
    end;
    Inc(Year);
   end;
  end;
 end;
begin
 DateBeg := StrToDate(DateBegEdit.Text);
 DateEnd := DateEndEdit.Date;

 Periods := nil;
 Smets   := nil;

 SmetTableView.DataController.RecordCount := 0;
 OldSTableView.DataController.RecordCount := 0;

 // Выбираем периоды для счёта
 DataSet.SelectSQL.Text := 'select * from DOG_DT_ARENDA_P_SEL_FOR_SCH('
 + IntToStr(id_Dog) + ')';
 DataSet.Open;

 // Записываем их во временные массивы
 while not DataSet.Eof do begin
  SetLength(Periods, Length(Periods) + 1);
  with Periods[Length(Periods) - 1] do begin
   _id_Period := DataSet.Fields[0].AsInteger;
   _Date_Beg  := DataSet.Fields[1].AsDateTime;
   _Date_End  := DataSet.Fields[2].AsDateTime;
   _Sum       := DataSet.Fields[3].AsCurrency;
   _arnd_summ := DataSet.Fields[4].AsCurrency;
  end;
  DataSet.Next;
 end;

 DataSet.Close;

 // Выбираем сметы
 for i := 0 to Length(Periods) - 1 do begin
  DataSet.SelectSQL.Text := 'select * from DOG_DT_ARENDA_S_SEL('
  + IntToStr(Periods[i]._id_Period) + ')';
  DataSet.Open;
  // Записываем во временные массивы
  while not DataSet.Eof do begin
   SetLength(Smets, Length(Smets) + 1);
   // Md
   with Smets[Length(Smets) - 1] do begin
    _id_Period := Periods[i]._id_Period;
    _id_S      := DataSet['ID_S'];
    _id_R      := DataSet['ID_R'];
    _id_St     := DataSet['ID_ST'];
    _id_Kekv   := DataSet['ID_KEKV'];
    _Kod_S     := DataSet['KOD_S'];
    _Kod_R     := DataSet['KOD_R'];
    _Kod_St    := DataSet['KOD_ST'];
    _Kod_Kekv  := DataSet['KOD_KEKV'];
    _S_Name    := DataSet['NAME_S'];
    _R_Name    := DataSet['NAME_R'];
    _St_Name   := DataSet['NAME_ST'];
    _Kekv_Name := DataSet['NAME_KEKV'];
    _Sum       := DataSet['SUMMA'];
    if (DataSet['ID_FAV'] <> null ) then _id_Fav    := DataSet['ID_FAV'] else _id_Fav:=0;
    if (DataSet['FAV_CNT'] <> null ) then _fav_cnt   := DataSet['FAV_CNT'] else _fav_cnt:=0;
    if (DataSet['TARIF_VALUE'] <> null ) then _tarif     := DataSet['TARIF_VALUE'] else _tarif:=0;
    if (DataSet['ARND_SUM'] <> null ) then _arnd_sum  := DataSet['ARND_SUM'] else _arnd_sum:=0;
   end;
    DataSet.Next;
  end;
  DataSet.Close;
 end;
 // Проверяем пересечение периода со счётом
 for i := 0 to Length(Periods) - 1 do begin
      if not FindCross(Periods[i]._Date_Beg, Periods[i]._Date_End, DBeg, DEnd) then Continue;

      // По пропорции высчитываем сумму за период, если счёт за неполный период
      PerSum := RoundTo(FindPeriodSum(DBeg, DEnd, Periods[i]._Sum), -2);
      PerSumAll :=PerSumAll+ RoundTo(FindPeriodSum(DBeg, DEnd, Periods[i]._arnd_summ), -2);
      MaxSum := -1;   // Максимальная сумма
      MaxNum := -1;   // Максимальный номер периода в массиве
      // Находим максимальную сумму в периодах
      for j := 0 to Length(Smets) - 1 do begin
       if Smets[j]._id_Period <> Periods[i]._id_Period then Continue;

       if MaxSum < Smets[j]._Sum then begin
        MaxSum := Smets[j]._Sum;
        MaxNum := j;
       end;
      end;

      if MaxNum < 0 then Continue;

      SSum := 0;
      for j := 0 to Length(Smets) - 1 do begin
       if Smets[j]._id_Period <> Periods[i]._id_Period then Continue;
       // Если периодов несколько, находим общую сумму
       SSum := SSum + RoundTo(FindPeriodSum(DBeg, DEnd, Smets[j]._Sum), -2);

       with SmetTableView.DataController do begin
        Flag := False;
        // Группировка смет, если в разных периодах одни и те же сметы
        for t := 0 to RecordCount - 1 do
         if (Values[t, 8] = Smets[j]._id_S) and (Values[t, 9] = Smets[j]._id_R)
         and (Values[t, 10] = Smets[j]._id_St) and (Values[t, 11] = Smets[j]._id_Kekv) then begin
          Flag := True;
          Break;
         end;
        // Заполняем грид, если подобное найдено - просто меняем сумму, предварительно округлив
        if Flag then Values[t, 4] := Values[t, 4] + RoundTo(FindPeriodSum(DBeg, DEnd, Smets[j]._Sum), -2)
        else begin
         RecordCount := RecordCount +  1;
         Values[RecordCount - 1, 0]  := Smets[j]._Kod_S;
         Values[RecordCount - 1, 1]  := Smets[j]._Kod_R;
         Values[RecordCount - 1, 2]  := Smets[j]._Kod_St;
         Values[RecordCount - 1, 3]  := Smets[j]._Kod_Kekv;
         Values[RecordCount - 1, 4]  := RoundTo(FindPeriodSum(DBeg, DEnd, Smets[j]._Sum), -2);
         Values[RecordCount - 1, 5]  := Smets[j]._S_Name;
         Values[RecordCount - 1, 6]  := Smets[j]._R_Name;
         Values[RecordCount - 1, 7]  := Smets[j]._St_Name;
         Values[RecordCount - 1, 8]  := Smets[j]._id_S;
         Values[RecordCount - 1, 9]  := Smets[j]._id_R;
         Values[RecordCount - 1, 10] := Smets[j]._id_St;
         Values[RecordCount - 1, 11] := Smets[j]._id_Kekv;
         Values[RecordCount - 1, 12] := Smets[j]._Kekv_Name;
         // Дополнения, для учёта натуральных показателей
         if (Smets[j]._id_Fav <> null ) then Values[RecordCount - 1, 13]:= Smets[j]._id_Fav else Values[RecordCount - 1, 13]:=0;
         if (Smets[j]._fav_cnt <> null ) then Values[RecordCount - 1, 14]:= Smets[j]._fav_cnt else Values[RecordCount - 1, 14]:=0;
         if (Smets[j]._tarif <> null ) then Values[RecordCount - 1, 15]:= Smets[j]._tarif else Values[RecordCount - 1, 15]:=0;
         if (Smets[j]._arnd_sum <> null ) then Values[RecordCount - 1, 16]:= Smets[j]._arnd_sum else Values[RecordCount - 1, 16]:=0;
         Values[RecordCount - 1, 17] := Smets[j]._id_Period;
        end;

       end;

      end;
      // Делаем поиск смет с одинаковыми показателями
      with SmetTableView.DataController do begin
       Flag := False;
       for t := 0 to RecordCount - 1 do
        if (Values[t, 8] = Smets[MaxNum]._id_S) and (Values[t, 9] = Smets[MaxNum]._id_R)
         and (Values[t, 10] = Smets[MaxNum]._id_St) and (Values[t, 11] = Smets[MaxNum]._id_Kekv) and (Values[t, 13] = Smets[MaxNum]._id_Fav) then begin
         Flag := True;
         Break
        end;

       if Flag then Values[t, 4] := Values[t, 4] + PerSum - SSum;
      end;
 end;

 if SmetTableView.DataController.RecordCount > 0 then SmetTableView.DataController.FocusedRecordIndex := 0;
 // Переходим к проверке наличия пересчёта

 // Новая процедура формирования пересчёта
 ReCalculationAll2;
end;


// -----------------------------------------------------------------------------
// Процедура формирования перерасчёта
procedure   TArnd_Sch_Add_Form.ReCalculationAll2;
var
 i, j, t, jj, h  : integer;
 id_per   : integer;

 DBeg     : TDate;
 DEnd     : TDate;

 Flag     : boolean;

 Periods  : TPeriodArray;
 Smets    : TSmetArray;
 FactData : TSmetArray;
                          
 ResData  : TSmetArray;
 Curr_Sunm, Curr_Sunm1, Curr_Sunm2 : currency;       //Дополнительная переменная для перевода суммы ResData[t]._Sum в тип с фиксированной точкой

 MaxSum  : currency;
 MaxNum  : integer;
 PerSum  : currency;
 SSum,  SSum2    : currency;

 // Нахождение пересечения перидов
 function FindCross(InDateBeg, InDateEnd : TDate; var OutDateBeg, OutDateEnd : TDate) : boolean;
 var
  EndD : TDate;
 begin
  Result := True;
  ///// Присваиваю период для перерасчета!!!!!!!!!!!!!!!!!!!!!!!
  if KindRadioGroup.ItemIndex = 0 then
   EndD := StrToDate(DateBegEdit.Text) - 1
  else
   EndD := StrToDate(DateBegEdit.Text);
  if EndD >= InDateBeg then
  begin
   OutDateBeg := InDateBeg;
   if EndD <= InDateEnd then OutDateEnd := EndD
   else OutDateEnd := InDateEnd;
  end
  else Result := False;
 end;

 // Нахождение суммы под периодом (для случая счёта за несколько периодов или неполный период)
 function FindPeriodSum(DBeg, DEnd : TDate; InSum : currency) : currency;
 var
  Month : word;
  Year  : word;
 begin
  Result := 0;
  if (MonthOfTheYear(DBeg) = MonthOfTheYear(DEnd)) and (YearOf(DBeg) = YearOf(DEnd)) then
   Result := InSum * (DEnd - DBeg + 1) / DaysInMonth(DBeg)
  else begin
   Month := MonthOfTheYear(DBeg);
   Year  := YearOf(DBeg);

   while YearOf(DEnd) >= Year do begin
    while MonthOfTheYear(DEnd) >= Month do begin
     if (Month = MonthOfTheYear(DBeg)) and (Year = YearOf(DBeg)) then
      Result := Result + InSum * (DaysInMonth(DBeg) - DayOf(DBeg) + 1) / DaysInMonth(DBeg)
     else if (Month = MonthOfTheYear(DEnd)) and (Year = YearOf(DEnd)) then
      Result := Result + InSum * DayOf(DEnd) / DaysInMonth(DEnd)
     else
      Result := Result + InSum;

     Inc(Month);
     if Month > 12 then begin
      Month := 1;
      Break;
     end;
    end;
    Inc(Year);
   end;
  end;
 end;
begin
 Periods  := nil;
 Smets    := nil;
 FactData := nil;
// -----------------------------------------------------------------------------
// Выборка того, что должно быть по плану

// Выбираем периоды во временный массив
 DataSet.SelectSQL.Text := 'select * from DOG_DT_ARENDA_P_SEL_FOR_SCH('
 + IntToStr(id_Dog) + ')';
 DataSet.Open;

 // Записываем их во временные массивы
 while not DataSet.Eof do begin
  if (DataSet.Fields[2].AsDateTime<SavedBeg) then begin
    SetLength(Periods, Length(Periods) + 1);
    with Periods[Length(Periods) - 1] do begin
     _id_Period := DataSet.Fields[0].AsInteger;
     _Date_Beg  := DataSet.Fields[1].AsDateTime;
     _Date_End  := DataSet.Fields[2].AsDateTime;
     _Sum       := DataSet.Fields[3].AsCurrency;
    end;
  end;
  DataSet.Next;
 end;
 DataSet.Close;

 // Выбираем сметы во временный массив
 for i := 0 to Length(Periods) - 1 do begin
  DataSet.SelectSQL.Text := 'select * from DOG_DT_ARENDA_S_SEL('
  + IntToStr(Periods[i]._id_Period) + ')';
  DataSet.Open;
  // Записываем во временный массив
  while not DataSet.Eof do begin
   SetLength(Smets, Length(Smets) + 1);
  //Md
   with Smets[Length(Smets) - 1] do begin
    _id_Period := Periods[i]._id_Period;
    _id_S      := DataSet['ID_S'];
    _id_R      := DataSet['ID_R'];
    _id_St     := DataSet['ID_ST'];
    _id_Kekv   := DataSet['ID_KEKV'];
    _Kod_S     := DataSet['KOD_S'];
    _Kod_R     := DataSet['KOD_R'];
    _Kod_St    := DataSet['KOD_ST'];
    _Kod_Kekv  := DataSet['KOD_KEKV'];
    _S_Name    := DataSet['NAME_S'];
    _R_Name    := DataSet['NAME_R'];
    _St_Name   := DataSet['NAME_ST'];
    _Kekv_Name := DataSet['NAME_KEKV'];
    _Sum       := DataSet['SUMMA'];
    if (DataSet['ID_FAV'] <> null ) then _id_Fav    := DataSet['ID_FAV'] else _id_Fav:=0;
    if (DataSet['FAV_CNT'] <> null ) then _fav_cnt   := DataSet['FAV_CNT'] else _fav_cnt:=0;
    if (DataSet['TARIF_VALUE'] <> null ) then _tarif     := DataSet['TARIF_VALUE'] else _tarif:=0;
    if (DataSet['ARND_SUM'] <> null ) then _arnd_sum  := DataSet['ARND_SUM'] else _arnd_sum:=0;
    DataSet.Next;
   end;
  end;
  DataSet.Close;
 end;



  PerSum := 0;
  for i := 0 to Length(Periods) - 1 do begin
  if not FindCross(Periods[i]._Date_Beg, Periods[i]._Date_End, DBeg, DEnd) then Continue;
   // По пропорции высчитываем сумму за период, если счёт за неполный период
      PerSum := RoundTo(FindPeriodSum(DBeg, DEnd, Periods[i]._Sum), -2);
      PerSumAll :=PerSumAll+ RoundTo(FindPeriodSum(DBeg, DEnd, Periods[i]._arnd_summ), -2);
      MaxSum := -1;   // Максимальная сумма
      MaxNum := -1;   // Максимальный номер периода в массиве
      // Находим максимальную сумму в периодах
      for j := 0 to Length(Smets) - 1 do begin
       if Smets[j]._id_Period <> Periods[i]._id_Period then Continue;

       if MaxSum < Smets[j]._Sum then begin
        MaxSum := Smets[j]._Sum;
        MaxNum := j;
       end;
      end;
      if MaxNum < 0 then Continue;

      SSum := 0;
     for jj := 0 to Length(Smets) - 1 do
      begin
        if Smets[jj]._id_Period <> Periods[i]._id_Period then Continue;
        SSum := SSum + RoundTo(FindPeriodSum(DBeg, DEnd, Smets[jj]._Sum), -2);
      end;

     SSum2 := 0;
     //Осуществляем группировку для смет с одинаковыми параметрами
     for j := 0 to Length(Smets) - 1 do
     begin
     if Smets[j]._id_Period <> Periods[i]._id_Period then Continue;
     SSum2 := SSum2 + RoundTo(FindPeriodSum(DBeg, DEnd, Smets[j]._Sum), -2);
     Flag := False;
      for t := 0 to Length(ResData) - 1 do
        if (ResData[t]._id_S = Smets[j]._id_S) and (ResData[t]._id_R = Smets[j]._id_R)
        and (ResData[t]._id_St = Smets[j]._id_St) and (ResData[t]._id_Kekv = Smets[j]._id_Kekv) then
        begin
          Flag := True;
          Break;
        end;

        if Flag then
        begin
          SetLength(ResData, Length(ResData) + 1);
          ResData[t]._Kod_S  := Smets[j]._Kod_S;
          ResData[t]._Kod_R  := Smets[j]._Kod_R;
          ResData[t]._Kod_St  := Smets[j]._Kod_St;
          ResData[t]._Kod_Kekv  := Smets[j]._Kod_Kekv;
          ResData[t]._Sum := ResData[t]._Sum + RoundTo(FindPeriodSum(DBeg, DEnd, Smets[j]._Sum), -2); // + PerSum - SSum;
          ResData[t]._S_Name  := Smets[j]._S_Name;
          ResData[t]._R_Name  := Smets[j]._R_Name;
          ResData[t]._St_Name  := Smets[j]._St_Name;
          ResData[t]._id_S  := Smets[j]._id_S;
          ResData[t]._id_R  := Smets[j]._id_R;
          ResData[t]._id_St := Smets[j]._id_St;
          ResData[t]._id_Kekv := Smets[j]._id_Kekv;
          ResData[t]._id_Fav :=  Smets[j]._id_Fav;
          ResData[t]._Kekv_Name := Smets[j]._Kekv_Name;
          if (Smets[j]._id_Fav <> null ) then ResData[t]._id_Fav:= Smets[j]._id_Fav else ResData[t]._id_Fav:=0;
          if (Smets[j]._fav_cnt <> null ) then ResData[t]._fav_cnt:= Smets[j]._fav_cnt else ResData[t]._fav_cnt:=0;
          if (Smets[j]._tarif <> null ) then ResData[t]._tarif:= Smets[j]._tarif else ResData[t]._tarif:=0;
          if (Smets[j]._arnd_sum <> null ) then ResData[t]._arnd_sum:= Smets[j]._arnd_sum else ResData[t]._arnd_sum:=0;
          ResData[t]._id_Period := Smets[j]._id_Period;
        end
        else
        begin
          SetLength(ResData, Length(ResData) + 1);
          ResData[t]._Kod_S  := Smets[j]._Kod_S;
          ResData[t]._Kod_R  := Smets[j]._Kod_R;
          ResData[t]._Kod_St  := Smets[j]._Kod_St;
          ResData[t]._Kod_Kekv  := Smets[j]._Kod_Kekv;
          ResData[t]._Sum  := RoundTo(FindPeriodSum(DBeg, DEnd, Smets[j]._Sum), -2); // + PerSum - SSum;
          ResData[t]._S_Name  := Smets[j]._S_Name;
          ResData[t]._R_Name  := Smets[j]._R_Name;
          ResData[t]._St_Name  := Smets[j]._St_Name;
          ResData[t]._id_S  := Smets[j]._id_S;
          ResData[t]._id_R  := Smets[j]._id_R;
          ResData[t]._id_St := Smets[j]._id_St;
          ResData[t]._id_Kekv := Smets[j]._id_Kekv;
          ResData[t]._id_Fav :=  Smets[j]._id_Fav;
          ResData[t]._Kekv_Name := Smets[j]._Kekv_Name;
          // Дополнения, для учёта натуральных показателей
          if (Smets[j]._id_Fav <> null ) then ResData[t]._id_Fav:= Smets[j]._id_Fav else ResData[t]._id_Fav:=0;
          if (Smets[j]._fav_cnt <> null ) then ResData[t]._fav_cnt:= Smets[j]._fav_cnt else ResData[t]._fav_cnt:=0;
          if (Smets[j]._tarif <> null ) then ResData[t]._tarif:= Smets[j]._tarif else ResData[t]._tarif:=0;
          if (Smets[j]._arnd_sum <> null ) then ResData[t]._arnd_sum:= Smets[j]._arnd_sum else ResData[t]._arnd_sum:=0;
          ResData[t]._id_Period := Smets[j]._id_Period;
        end;

        Flag := False;
        for t := 0 to Length(ResData) - 1 do
          if (ResData[t]._id_S = Smets[MaxNum]._id_S) and (ResData[t]._id_R = Smets[MaxNum]._id_R)
            and (ResData[t]._id_St = Smets[MaxNum]._id_St) and (ResData[t]._id_Kekv = Smets[MaxNum]._id_Kekv) and
            (ResData[t]._id_Fav = Smets[MaxNum]._id_Fav) then
        begin
          Flag := True;
          Break
        end;

        if Flag then ResData[t]._Sum := ResData[t]._Sum + PerSum - SSum;                    // Гребенник М. 28.08.13
     end;
      //if Flag then ResData[t]._Sum := ResData[t]._Sum + PerSum - SSum;
     {Flag := False;
     for t := 0 to Length(ResData) - 1 do
     if (ResData[t]._id_S = Smets[MaxNum]._id_S) and (ResData[t]._id_R = Smets[MaxNum]._id_R)
      and (ResData[t]._id_St = Smets[MaxNum]._id_St) and (ResData[t]._id_Kekv = Smets[MaxNum]._id_Kekv) and
      (ResData[t]._id_Fav = Smets[MaxNum]._id_Fav) then
     begin
        Flag := True;
        Break
     end;

     if Flag then ResData[t]._Sum := ResData[t]._Sum + PerSum - SSum;}
     //if Flag then ResData[t]._Sum := ResData[t]._Sum + PerSum - SSum;
 end;


// -----------------------------------------------------------------------------
// Фактическая выборка, т.е того что есть
 // Выбираем все сметы по данному договору, даже по прошлым счетам
 DataSet.SelectSQL.Text := 'select * from DOG_DT_ARND_SCH_SEL_FOR_CALC(' + IntToStr(id_Dog) + ')';
 DataSet.Open;
 // Сохраняем перечни смет во временный массив
 while not DataSet.Eof do begin
  SetLength(FactData, Length(FactData) + 1);

  with FactData[Length(FactData) - 1] do begin
   _id_S      := DataSet['ID_S'];
   _id_R      := DataSet['ID_R'];
   _id_St     := DataSet['ID_ST'];
   _id_Kekv   := DataSet['ID_KEKV'];
   _Kod_S     := DataSet['KOD_S'];
   _Kod_R     := DataSet['KOD_R'];
   _Kod_St    := DataSet['KOD_ST'];
   _Kod_Kekv  := DataSet['KOD_KEKV'];
   _S_Name    := DataSet['NAME_S'];
   _R_Name    := DataSet['NAME_R'];
   _St_Name   := DataSet['NAME_ST'];
   _Kekv_Name := DataSet['NAME_KEKV'];
   _Sum       := DataSet['SUMMA'];

   if (DataSet['ID_FAV'] <> null ) then _id_Fav    := DataSet['ID_FAV'] else _id_Fav:=0;
   if (DataSet['FAV_CNT'] <> null ) then _fav_cnt   := DataSet['FAV_CNT'] else _fav_cnt:=0;
   if (DataSet['TARIF_VALUE'] <> null ) then _tarif     := DataSet['TARIF_VALUE'] else _tarif:=0;
   if (DataSet['ARND_SUM'] <> null ) then _arnd_sum  := DataSet['ARND_SUM'] else _arnd_sum:=0;

   _id_sch_recalc:=DataSet['id_sch'];
  end;
  DataSet.Next;
 end;
 DataSet.Close;


 // Заполняем OldSTableView
 for j := 0 to Length(FactData) - 1 do begin
  Flag := False;
  for t := 0 to length(ResData) - 1  do
   if (ResData[t]._id_S = FactData[j]._id_S) and (ResData[t]._id_R = FactData[j]._id_R)
   and (ResData[t]._id_St = FactData[j]._id_St) and (ResData[t]._id_Kekv = FactData[j]._id_Kekv) then
   begin
    Flag := True;
    Break;
   end;
  // Суммирование
  if Flag then
  begin
      //ShowMessage(CurrToStr(ResData[length(ResData)]._Sum));
      //ShowMessage(CurrToStr(ResData[t]._Sum));
      //ShowMessage(CurrToStr(FactData[j]._Sum));
      //ShowMessage(CurrToStr(ResData[t]._Sum - FactData[j]._Sum));
      Curr_Sunm:=ResData[t]._Sum - FactData[j]._Sum;
      //ShowMessage(CurrToStr(Curr_Sunm));
      //if (Curr_Sunm > 0.02) or (Curr_Sunm < -0.02) then  ShowMessage(CurrToStr(Curr_Sunm));
      if (Curr_Sunm > 0.03) or (Curr_Sunm < -0.03) then
        ResData[t]._Sum := ResData[t]._Sum - FactData[j]._Sum
      else ResData[t]._Sum := 0;
      ResData[t]._id_sch_recalc := FactData[j]._id_sch_recalc;
      //-Curr_Sunm:=ResData[t]._Sum;
      //ShowMessage(CurrToStr(Curr_Sunm));                          //Число с 4 знаками после запятой. RoundTo() округляет неправильно!!!
      //-Curr_Sunm:=StrToFloat(FloatToStrF(Curr_Sunm,ffFixed,20,3));   //Округляем до 3 знаков после запятой
      //ShowMessage(CurrToStr(Curr_Sunm));
      //-Curr_Sunm:=StrToFloat(FloatToStrF(Curr_Sunm,ffFixed,20,2));  //Округляем до 2 знаков после запятой
      //ShowMessage(CurrToStr(Curr_Sunm));
      //-ResData[t]._Sum := Curr_Sunm - FactData[j]._Sum;
      //ShowMessage(CurrToStr(Curr_Sunm - FactData[j]._Sum));
      //ResData[t]._id_sch_recalc := FactData[j]._id_sch_recalc;
      //ShowMessage(CurrToStr(Curr_Sunm));
      //ShowMessage(CurrToStr(FactData[j]._Sum));
      //ShowMessage(CurrToStr(Curr_Sunm - FactData[j]._Sum));
  end
  else
  begin
   SetLength(ResData, Length(ResData) + 1);
   ResData[Length(ResData) - 1] := FactData[j];
   ResData[Length(ResData) - 1]._Sum := -1 * ResData[Length(ResData) - 1]._Sum;
  end;
 end;

 // Заполняем таблицу с данными о пересчёте
 for t := 0 to length(ResData) - 1 do begin
  if RoundTo(ResData[t]._Sum, -2) = 0 then Continue;

  with OldSTableView.DataController do begin
   RecordCount := RecordCount + 1;
   Values[RecordCount - 1, 0]  := ResData[t]._Kod_S;
   Values[RecordCount - 1, 1]  := ResData[t]._Kod_R;
   Values[RecordCount - 1, 2]  := ResData[t]._Kod_St;
   Values[RecordCount - 1, 3]  := ResData[t]._Kod_Kekv;
   Values[RecordCount - 1, 4]  := ResData[t]._Sum;
   Values[RecordCount - 1, 5]  := ResData[t]._S_Name;
   Values[RecordCount - 1, 6]  := ResData[t]._R_Name;
   Values[RecordCount - 1, 7]  := ResData[t]._St_Name;
   Values[RecordCount - 1, 8]  := ResData[t]._id_S;
   Values[RecordCount - 1, 9]  := ResData[t]._id_R;
   Values[RecordCount - 1, 10] := ResData[t]._id_St;
   Values[RecordCount - 1, 11] := ResData[t]._id_Kekv;
   Values[RecordCount - 1, 12] := ResData[t]._Kekv_Name;
   if (ResData[t]._id_Fav <> null ) then Values[RecordCount - 1, 13]:= ResData[t]._id_Fav else Values[RecordCount - 1, 13]:=0;
   if (ResData[t]._fav_cnt <> null ) then Values[RecordCount - 1, 14]:= ResData[t]._fav_cnt else Values[RecordCount - 1, 14]:=0;
   if (ResData[t]._tarif <> null ) then Values[RecordCount - 1, 15]:= ResData[t]._tarif else Values[RecordCount - 1, 15]:=0;

   Values[RecordCount - 1, 19] := ResData[t]._id_sch_recalc;

   id_per := ResData[t]._id_Period;
   StPrc.Transaction.StartTransaction;
   StPrc.StoredProcName:='DOG_DT_ARENDA_SEL_P_DATE';
   StPrc.ParamByName('ID_SCH').AsInteger:=ResData[t]._id_sch_recalc;
   StPrc.ExecProc;

   Values[RecordCount - 1, 17] := CodeDayFormat(StPrc.FldByName['DATE_BEG'].AsDateTime);
   Values[RecordCount - 1, 18] := CodeDayFormat(StPrc.FldByName['DATE_END'].AsDateTime);
   StPrc.Close;
   StPrc.Transaction.Commit;
  end;
 end;

 if OldSTableView.DataController.RecordCount > 0 then OldSTableView.DataController.FocusedRecordIndex := 0;
end;


// -----------------------------------------------------------------------------
procedure TArnd_Sch_Add_Form.ReCalculationAll;
var
 i, j, t  : integer;
 id_per   : integer;

 DateBv   : string;
 DateEv   : string;

 DBeg     : TDate;
 DEnd     : TDate;

 Flag     : boolean;

 Periods  : TPeriodArray;
 Sch      : TSchArray;
 Smets    : TSmetArray;
 FactData : TSmetArray;

 ResData  : TSmetArray;

 function FindCross(InDateBeg, InDateEnd : TDate; var OutDateBeg, OutDateEnd : TDate) : boolean;
 var
  EndD : TDate;
 begin
  Result := True;

  ///// Присваиваю период для перерасчета!!!!!!!!!!!!!!!!!!!!!!!
  if KindRadioGroup.ItemIndex = 0 then
   EndD := StrToDate(DateBegEdit.Text) - 1
  else
   EndD := StrToDate(DateBegEdit.Text);

  if EndD >= InDateBeg then begin
   OutDateBeg := InDateBeg;

   if EndD <= InDateEnd then OutDateEnd := EndD
   else OutDateEnd := InDateEnd;
  end
  else Result := False;
 end;

 // Нахождение суммы под периодом (для случая счёта за несколько периодов или неполный период)
 function FindPeriodSum(DBeg, DEnd : TDate; InSum : currency) : currency;
 var
  Month : word;
  Year  : word;
 begin
  Result := 0;

  if (MonthOfTheYear(DBeg) = MonthOfTheYear(DEnd)) and (YearOf(DBeg) = YearOf(DEnd)) then
   Result := InSum * (DEnd - DBeg + 1) / DaysInMonth(DBeg)
  else begin
   Month := MonthOfTheYear(DBeg);
   Year  := YearOf(DBeg);

   while YearOf(DEnd) >= Year do begin
    while MonthOfTheYear(DEnd) >= Month do begin
     if (Month = MonthOfTheYear(DBeg)) and (Year = YearOf(DBeg)) then
      Result := Result + InSum * (DaysInMonth(DBeg) - DayOf(DBeg) + 1) / DaysInMonth(DBeg)
     else if (Month = MonthOfTheYear(DEnd)) and (Year = YearOf(DEnd)) then
      Result := Result + InSum * DayOf(DEnd) / DaysInMonth(DEnd)
     else
      Result := Result + InSum;
      Inc(Month);
     if Month > 12 then begin
      Month := 1;
      Break;
     end;
    end;
    Inc(Year);
   end;
  end;
 end;

 // Выборка периодов
 procedure GetPeriodsForSch(DateB,DateE:TDate;id_sch:integer);
 var
   t,k,n,m:integer;
 begin
  Periods:= nil;
  Smets:= nil;

  DataSetPeriods.SelectSQL.Text := 'select * from DOG_DT_ARENDA_P_SEL_FOR_SCH('
  + IntToStr(id_Dog)+')';
  DataSetPeriods.Open;

  while not DataSetPeriods.Eof do begin
   SetLength(Periods, Length(Periods) + 1);
   with Periods[Length(Periods) - 1] do begin
    if (DataSetPeriods.Fields[1].AsDateTime > DateE) or (DataSetPeriods.Fields[2].AsDateTime < DateB) then begin
     DataSetPeriods.Next;continue; end;
    _id_Period := DataSetPeriods.Fields[0].AsInteger;
    _Date_Beg  := DataSetPeriods.Fields[1].AsDateTime;
    _Date_End  := DataSetPeriods.Fields[2].AsDateTime;
    _Sum       := DataSetPeriods.Fields[3].AsCurrency;
   end;
   DataSetPeriods.Next;
  end;
  DataSetPeriods.Close;
  
  // Выбираем сметы во временный массив
  for t := 0 to Length(Periods) - 1 do begin
   DataSetPeriods.SelectSQL.Text := 'select * from DOG_DT_ARENDA_S_SEL('
   + IntToStr(Periods[t]._id_Period) + ')';
   DataSetPeriods.Open;
   while not DataSetPeriods.Eof do begin
    SetLength(Smets, Length(Smets) + 1);
    with Smets[Length(Smets) - 1] do begin
     _id_Period := Periods[t]._id_Period;
     _id_S      := DataSetPeriods['ID_S'];
     _id_R      := DataSetPeriods['ID_R'];
     _id_St     := DataSetPeriods['ID_ST'];
     _id_Kekv   := DataSetPeriods['ID_KEKV'];
     _Kod_S     := DataSetPeriods['KOD_S'];
     _Kod_R     := DataSetPeriods['KOD_R'];
     _Kod_St    := DataSetPeriods['KOD_ST'];
     _Kod_Kekv  := DataSetPeriods['KOD_KEKV'];
     _S_Name    := DataSetPeriods['NAME_S'];
     _R_Name    := DataSetPeriods['NAME_R'];
     _St_Name   := DataSetPeriods['NAME_ST'];
     _Kekv_Name := DataSetPeriods['NAME_KEKV'];
     _Sum       := DataSetPeriods['SUMMA'];
     if (DataSetPeriods['ID_FAV'] <> null ) then _id_Fav    := DataSetPeriods['ID_FAV'] else _id_Fav:=0;
     if (DataSetPeriods['FAV_CNT'] <> null ) then _fav_cnt   := DataSetPeriods['FAV_CNT'] else _fav_cnt:=0;
     if (DataSetPeriods['TARIF_VALUE'] <> null ) then _tarif     := DataSetPeriods['TARIF_VALUE'] else _tarif:=0;
     if (DataSetPeriods['ARND_SUM'] <> null ) then _arnd_sum  := DataSetPeriods['ARND_SUM'] else _arnd_sum:=0;
     _id_sch_recalc := id_sch;
     DataSetPeriods.Next;
    end;
   end;
   DataSetPeriods.Close;
  end;
 // Выполняем расчёт
  for t := 0 to Length(Periods) - 1 do begin
   if not FindCross(Periods[t]._Date_Beg, Periods[t]._Date_End, DateB, DateE) then Continue;

   for k := 0 to Length(Smets) - 1 do begin
    if Smets[k]._id_Period <> Periods[t]._id_Period then Continue;
    Flag := False;
    for m := 0 to length(ResData) - 1 do
    if (ResData[m]._id_S = Smets[k]._id_S) and (ResData[m]._id_R = Smets[k]._id_R)
     and (ResData[m]._id_St = Smets[k]._id_St) and (ResData[m]._id_Kekv = Smets[k]._id_Kekv) then begin
      Flag := True;
      Break;
    end;

    if Flag then ResData[m]._Sum := ResData[m]._Sum + FindPeriodSum(DateB, DateE, Smets[k]._Sum)
     else begin
     SetLength(ResData, Length(ResData) + 1);
     ResData[Length(ResData) - 1] := Smets[k];
     ResData[Length(ResData) - 1]._Sum := FindPeriodSum(DateB,DateE, Smets[k]._Sum);
    end;
   end;
  end;

 end;
begin
 Periods:= nil;
 Smets:= nil;
 FactData:=nil;
 Sch:=nil;

 DataSet.SelectSQL.Text := 'select * from DOG_DT_ARENDA_SCH_SEL_FOR_RECAL('
 + IntToStr(id_Dog) + ')';
 DataSet.Open;

 // -- Заголовки счетов в массив
 while not DataSet.Eof do begin
  SetLength(Sch, Length(Sch) + 1);
  with Sch[Length(Sch) - 1] do begin
   _id_sch := DataSet.Fields[0].AsInteger;
   _Date_Beg  := DataSet.Fields[1].AsDateTime;
   _Date_End  := DataSet.Fields[2].AsDateTime;
   _Sum       := DataSet.Fields[3].AsCurrency;
   GetPeriodsForSch(_Date_Beg,_Date_End,_id_sch);
  end;
  DataSet.Next;
 end;
  DataSet.Close;

 // -----------------------------------------------------------------------------
 // Выбираем все сметы по данному договору, даже по прошлым счетам
 DataSet.SelectSQL.Text := 'select * from DOG_DT_ARND_SCH_SEL_FOR_CALC(' + IntToStr(id_Dog) + ')';
 DataSet.Open;
 // Сохраняем перечни смет во временный массив
 while not DataSet.Eof do begin
  SetLength(FactData, Length(FactData) + 1);
  with FactData[Length(FactData) - 1] do begin
   _id_S      := DataSet['ID_S'];
   _id_R      := DataSet['ID_R'];
   _id_St     := DataSet['ID_ST'];
   _id_Kekv   := DataSet['ID_KEKV'];
   _Kod_S     := DataSet['KOD_S'];
   _Kod_R     := DataSet['KOD_R'];
   _Kod_St    := DataSet['KOD_ST'];
   _Kod_Kekv  := DataSet['KOD_KEKV'];
   _S_Name    := DataSet['NAME_S'];
   _R_Name    := DataSet['NAME_R'];
   _St_Name   := DataSet['NAME_ST'];
   _Kekv_Name := DataSet['NAME_KEKV'];
   _Sum       := DataSet['SUMMA'];
   if (DataSet['ID_FAV'] <> null ) then _id_Fav    := DataSet['ID_FAV'] else _id_Fav:=0;
   if (DataSet['FAV_CNT'] <> null ) then _fav_cnt   := DataSet['FAV_CNT'] else _fav_cnt:=0;
   if (DataSet['TARIF_VALUE'] <> null ) then _tarif     := DataSet['TARIF_VALUE'] else _tarif:=0;
   if (DataSet['ARND_SUM'] <> null ) then _arnd_sum  := DataSet['ARND_SUM'] else _arnd_sum:=0;
   _id_sch_recalc:=DataSet['id_sch'];
  end;
  DataSet.Next;
 end;
 DataSet.Close;

 for j := 0 to Length(FactData) - 1 do begin
  Flag := False;
  for t := 0 to length(ResData) - 1 do
   if (ResData[t]._id_S = FactData[j]._id_S) and (ResData[t]._id_R = FactData[j]._id_R)
   and (ResData[t]._id_St = FactData[j]._id_St) and (ResData[t]._id_Kekv = FactData[j]._id_Kekv)
//   and (ResData[t]._id_sch_recalc = FactData[j]._id_sch_recalc)
then begin
    Flag := True;
    Break;
   end;
   // Суммирование
   if Flag then begin
      ResData[t]._Sum := ResData[t]._Sum - FactData[j]._Sum;
      ResData[t]._arnd_sum:=FactData[j]._arnd_sum;
//    ResData[t]._id_sch_recalc:=FactData[j]._id_sch_recalc;
   end

  else begin
   SetLength(ResData, Length(ResData) + 1);
   ResData[Length(ResData) - 1] := FactData[j];

   ResData[Length(ResData) - 1]._id_sch_recalc := FactData[j]._id_sch_recalc;
   ResData[Length(ResData) - 1]._Sum := -1 * ResData[Length(ResData) - 1]._Sum;
  end;
  end;

 // Заполняем таблицу с данными о пересчёте
 for t := 0 to length(ResData) - 1 do begin
  if RoundTo(ResData[t]._Sum, -2) = 0 then Continue;

  with OldSTableView.DataController do begin
   RecordCount := RecordCount + 1;
   Values[RecordCount - 1, 0]  := ResData[t]._Kod_S;
   Values[RecordCount - 1, 1]  := ResData[t]._Kod_R;
   Values[RecordCount - 1, 2]  := ResData[t]._Kod_St;
   Values[RecordCount - 1, 3]  := ResData[t]._Kod_Kekv;
   Values[RecordCount - 1, 4]  := RoundTo(ResData[t]._Sum, -2);
   Values[RecordCount - 1, 5]  := ResData[t]._S_Name;
   Values[RecordCount - 1, 6]  := ResData[t]._R_Name;
   Values[RecordCount - 1, 7]  := ResData[t]._St_Name;
   Values[RecordCount - 1, 8]  := ResData[t]._id_S;
   Values[RecordCount - 1, 9]  := ResData[t]._id_R;
   Values[RecordCount - 1, 10] := ResData[t]._id_St;
   Values[RecordCount - 1, 11] := ResData[t]._id_Kekv;
   Values[RecordCount - 1, 12] := ResData[t]._Kekv_Name;
   if (ResData[t]._id_Fav <> null ) then Values[RecordCount - 1, 13]:= ResData[t]._id_Fav else Values[RecordCount - 1, 13]:=0;
   if (ResData[t]._fav_cnt <> null ) then Values[RecordCount - 1, 14]:= ResData[t]._fav_cnt else Values[RecordCount - 1, 14]:=0;
   if (ResData[t]._tarif <> null ) then Values[RecordCount - 1, 15]:= ResData[t]._tarif else Values[RecordCount - 1, 15]:=0;
   if (ResData[t]._arnd_sum <> null ) then Values[RecordCount - 1, 16]:= ResData[t]._arnd_sum else Values[RecordCount - 1, 16]:=0;

   Values[RecordCount - 1, 19] := ResData[t]._id_sch_recalc;

   id_per := ResData[t]._id_Period;
/// Выборка дат периода, для которого сделан перерасчёт
   StPrc.Transaction.StartTransaction;
   StPrc.StoredProcName:='DOG_DT_ARENDA_SEL_P_DATE';
   StPrc.ParamByName('ID_SCH').AsInteger:=ResData[t]._id_sch_recalc;
   StPrc.ExecProc;

   Values[RecordCount - 1, 17] :=CodeDayFormat(StPrc.FldByName['DATE_BEG'].AsDateTime);
   Values[RecordCount - 1, 18] :=CodeDayFormat(StPrc.FldByName['DATE_END'].AsDateTime);
   StPrc.Close;
   StPrc.Transaction.Commit;
  end;
 end;

 if OldSTableView.DataController.RecordCount > 0 then OldSTableView.DataController.FocusedRecordIndex := 0;
end;
// -----------------------------------------------------------------------------
// Старая процедура
// Формирование (для начала и поиск) пересчёта
procedure TArnd_Sch_Add_Form.ReCalculation;
var
 i, j, t  : integer;
 id_per   : integer;

 DateBv   : string;
 DateEv   : string;

 DBeg     : TDate;
 DEnd     : TDate;

 Flag     : boolean;

 Periods  : TPeriodArray;
 Smets    : TSmetArray;
 FactData : TSmetArray;

 ResData  : TSmetArray;
 // Нахождение пересечения перидов
 function FindCross(InDateBeg, InDateEnd : TDate; var OutDateBeg, OutDateEnd : TDate) : boolean;
 var
  EndD : TDate;
 begin
  Result := True;

  ///// Присваиваю период для перерасчета!!!!!!!!!!!!!!!!!!!!!!!
  if KindRadioGroup.ItemIndex = 0 then
   EndD := StrToDate(DateBegEdit.Text) - 1
  else
   EndD := StrToDate(DateBegEdit.Text);
//
  if EndD >= InDateBeg then begin
   OutDateBeg := InDateBeg;

   if EndD <= InDateEnd then OutDateEnd := EndD
   else OutDateEnd := InDateEnd;
  end
  else Result := False;
 end;

 // Нахождение суммы под периодом (для случая счёта за несколько периодов или неполный период)
 function FindPeriodSum(DBeg, DEnd : TDate; InSum : currency) : currency;
 var
  Month : word;
  Year  : word;
 begin
  Result := 0;

  if (MonthOfTheYear(DBeg) = MonthOfTheYear(DEnd)) and (YearOf(DBeg) = YearOf(DEnd)) then
   Result := InSum * (DEnd - DBeg + 1) / DaysInMonth(DBeg)
  else begin
   Month := MonthOfTheYear(DBeg);
   Year  := YearOf(DBeg);

   while YearOf(DEnd) >= Year do begin
    while MonthOfTheYear(DEnd) >= Month do begin
     if (Month = MonthOfTheYear(DBeg)) and (Year = YearOf(DBeg)) then
      Result := Result + InSum * (DaysInMonth(DBeg) - DayOf(DBeg) + 1) / DaysInMonth(DBeg)
     else if (Month = MonthOfTheYear(DEnd)) and (Year = YearOf(DEnd)) then
      Result := Result + InSum * DayOf(DEnd) / DaysInMonth(DEnd)
     else
      Result := Result + InSum;

     Inc(Month);
     if Month > 12 then begin
      Month := 1;
      Break;
     end;
    end;

    Inc(Year);
   end;
  end;
 end;
begin
 Periods  := nil;
 Smets    := nil;
 FactData := nil;
// -----------------------------------------------------------------------------
// Выборка того, что должно быть по плану

// Выбираем периоды во временный массив
 DataSet.SelectSQL.Text := 'select * from DOG_DT_ARENDA_P_SEL_FOR_SCH('
 + IntToStr(id_Dog) + ')';
 DataSet.Open;

 while not DataSet.Eof do begin
  SetLength(Periods, Length(Periods) + 1);
  with Periods[Length(Periods) - 1] do begin
   _id_Period := DataSet.Fields[0].AsInteger;
   _Date_Beg  := DataSet.Fields[1].AsDateTime;
   _Date_End  := DataSet.Fields[2].AsDateTime;
   _Sum       := DataSet.Fields[3].AsCurrency;
  end;
  DataSet.Next;
 end;
 DataSet.Close;

 // Выбираем сметы во временный массив
 for i := 0 to Length(Periods) - 1 do begin
  DataSet.SelectSQL.Text := 'select * from DOG_DT_ARENDA_S_SEL('
  + IntToStr(Periods[i]._id_Period) + ')';

  DataSet.Open;

  while not DataSet.Eof do begin
   SetLength(Smets, Length(Smets) + 1);
  //Md
   with Smets[Length(Smets) - 1] do begin
    _id_Period := Periods[i]._id_Period;
    _id_S      := DataSet['ID_S'];
    _id_R      := DataSet['ID_R'];
    _id_St     := DataSet['ID_ST'];
    _id_Kekv   := DataSet['ID_KEKV'];
    _Kod_S     := DataSet['KOD_S'];
    _Kod_R     := DataSet['KOD_R'];
    _Kod_St    := DataSet['KOD_ST'];
    _Kod_Kekv  := DataSet['KOD_KEKV'];
    _S_Name    := DataSet['NAME_S'];
    _R_Name    := DataSet['NAME_R'];
    _St_Name   := DataSet['NAME_ST'];
    _Kekv_Name := DataSet['NAME_KEKV'];
    _Sum       := DataSet['SUMMA'];
    if (DataSet['ID_FAV'] <> null ) then _id_Fav    := DataSet['ID_FAV'] else _id_Fav:=0;
    if (DataSet['FAV_CNT'] <> null ) then _fav_cnt   := DataSet['FAV_CNT'] else _fav_cnt:=0;
    if (DataSet['TARIF_VALUE'] <> null ) then _tarif     := DataSet['TARIF_VALUE'] else _tarif:=0;
    if (DataSet['ARND_SUM'] <> null ) then _arnd_sum  := DataSet['ARND_SUM'] else _arnd_sum:=0;
    DataSet.Next;
   end;
  end;
  DataSet.Close;
 end;
// -----------------------------------------------------------------------------
// Фактическая выборка, т.е того что есть
 // Выбираем все сметы по данному договору, даже по прошлым счетам
 DataSet.SelectSQL.Text := 'select * from DOG_DT_ARND_SCH_SEL_FOR_CALC(' + IntToStr(id_Dog) + ')';
 DataSet.Open;
 // Сохраняем перечни смет во временный массив
 while not DataSet.Eof do begin
  SetLength(FactData, Length(FactData) + 1);

  with FactData[Length(FactData) - 1] do begin
   _id_S      := DataSet['ID_S'];
   _id_R      := DataSet['ID_R'];
   _id_St     := DataSet['ID_ST'];
   _id_Kekv   := DataSet['ID_KEKV'];
   _Kod_S     := DataSet['KOD_S'];
   _Kod_R     := DataSet['KOD_R'];
   _Kod_St    := DataSet['KOD_ST'];
   _Kod_Kekv  := DataSet['KOD_KEKV'];
   _S_Name    := DataSet['NAME_S'];
   _R_Name    := DataSet['NAME_R'];
   _St_Name   := DataSet['NAME_ST'];
   _Kekv_Name := DataSet['NAME_KEKV'];
   _Sum       := DataSet['SUMMA'];

   if (DataSet['ID_FAV'] <> null ) then _id_Fav    := DataSet['ID_FAV'] else _id_Fav:=0;
   if (DataSet['FAV_CNT'] <> null ) then _fav_cnt   := DataSet['FAV_CNT'] else _fav_cnt:=0;
   if (DataSet['TARIF_VALUE'] <> null ) then _tarif     := DataSet['TARIF_VALUE'] else _tarif:=0;
   if (DataSet['ARND_SUM'] <> null ) then _arnd_sum  := DataSet['ARND_SUM'] else _arnd_sum:=0;
//   if (DataSet['ID_PERIOD'] <> null ) then _id_Period := DataSet['ID_PERIOD'] else _id_Period:=0;

  end;
  DataSet.Next;
 end;

 DataSet.Close;

 // Заполняем OldSTableView
 for i := 0 to Length(Periods) - 1 do begin
  if not FindCross(Periods[i]._Date_Beg, Periods[i]._Date_End, DBeg, DEnd) then Continue;
  // Осуществляем группировку для смет с одинаковыми параметрами
  for j := 0 to Length(Smets) - 1 do begin
   if Smets[j]._id_Period <> Periods[i]._id_Period then Continue;

   Flag := False;
   for t := 0 to length(ResData) - 1 do
    if (ResData[t]._id_S = Smets[j]._id_S) and (ResData[t]._id_R = Smets[j]._id_R)
    and (ResData[t]._id_St = Smets[j]._id_St) and (ResData[t]._id_Kekv = Smets[j]._id_Kekv) then begin
     Flag := True;
     Break;
    end;
   // Если сметы с одинаковыми параметрами найдены (суммируем)
   if Flag then ResData[t]._Sum := ResData[t]._Sum + FindPeriodSum(DBeg, DEnd, Smets[j]._Sum)
   else begin
    SetLength(ResData, Length(ResData) + 1);
    ResData[Length(ResData) - 1] := Smets[j];
    ResData[Length(ResData) - 1]._Sum := FindPeriodSum(DBeg, DEnd, Smets[j]._Sum);
   end;
  end;
 end;
 // Аналочиная группировка
 for j := 0 to Length(FactData) - 1 do begin
  Flag := False;
  for t := 0 to length(ResData) - 1 do
   if (ResData[t]._id_S = FactData[j]._id_S) and (ResData[t]._id_R = FactData[j]._id_R)
   and (ResData[t]._id_St = FactData[j]._id_St) and (ResData[t]._id_Kekv = FactData[j]._id_Kekv) then begin
    Flag := True;
    Break;
   end;
  // Суммирование
  if Flag then ResData[t]._Sum := ResData[t]._Sum - FactData[j]._Sum
  else begin
   SetLength(ResData, Length(ResData) + 1);
   ResData[Length(ResData) - 1] := FactData[j];
   ResData[Length(ResData) - 1]._Sum := -1 * ResData[Length(ResData) - 1]._Sum;
  end;
 end;

 // Заполняем таблицу с данными о пересчёте
 for t := 0 to length(ResData) - 1 do begin
  if RoundTo(ResData[t]._Sum, -2) = 0 then Continue;

  with OldSTableView.DataController do begin
   RecordCount := RecordCount + 1;
   Values[RecordCount - 1, 0]  := ResData[t]._Kod_S;
   Values[RecordCount - 1, 1]  := ResData[t]._Kod_R;
   Values[RecordCount - 1, 2]  := ResData[t]._Kod_St;
   Values[RecordCount - 1, 3]  := ResData[t]._Kod_Kekv;
   Values[RecordCount - 1, 4]  := RoundTo(ResData[t]._Sum, -2);
   Values[RecordCount - 1, 5]  := ResData[t]._S_Name;
   Values[RecordCount - 1, 6]  := ResData[t]._R_Name;
   Values[RecordCount - 1, 7]  := ResData[t]._St_Name;
   Values[RecordCount - 1, 8]  := ResData[t]._id_S;
   Values[RecordCount - 1, 9]  := ResData[t]._id_R;
   Values[RecordCount - 1, 10] := ResData[t]._id_St;
   Values[RecordCount - 1, 11] := ResData[t]._id_Kekv;
   Values[RecordCount - 1, 12] := ResData[t]._Kekv_Name;
   if (ResData[t]._id_Fav <> null ) then Values[RecordCount - 1, 13]:= ResData[t]._id_Fav else Values[RecordCount - 1, 13]:=0;
   if (ResData[t]._fav_cnt <> null ) then Values[RecordCount - 1, 14]:= ResData[t]._fav_cnt else Values[RecordCount - 1, 14]:=0;
   if (ResData[t]._tarif <> null ) then Values[RecordCount - 1, 15]:= ResData[t]._tarif else Values[RecordCount - 1, 15]:=0;

   Values[RecordCount - 1, 17] :=DateBv;
   Values[RecordCount - 1, 18] :=DateEv;
  end;
 end;

 if OldSTableView.DataController.RecordCount > 0 then OldSTableView.DataController.FocusedRecordIndex := 0;
end;

procedure TArnd_Sch_Add_Form.DogNameEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 Res : TDogResult;
 input : TDogInput;
 id_rate_acc: Int64;
 DataSet_Bank : TpFIBDataSet;
begin
 input              := SYS_DEFAULT_DOG_INPUT;
 input.Owner        := Self;
 input.DBHandle     := (Owner as TArnd_Sch_Form).Database.Handle;
 input.ReadTrans    := (Owner as TArnd_Sch_Form).ReadTransaction.Handle;
 input.WriteTrans   := (Owner as TArnd_Sch_Form).WriteTransaction.Handle;
 input.FormStyle    := fsNormal;
 input.isZayav      := false;
 input.id_Group_add := id_group;
 input.id_Group     := id_group;
 res := ShowDogMain(input);
 hwn := res.handle;



{ input.Owner      := Self;
 input.DBHandle   := (Owner as TArnd_Sch_Form).Database.Handle;
 input.ReadTrans  := (Owner as TArnd_Sch_Form).ReadTransaction.Handle;
 input.WriteTrans := (Owner as TArnd_Sch_Form).WriteTransaction.Handle;
 input.FormStyle  := fsNormal;
 }
// res := DogLoaderUnit.ShowDogMain(Input);

 if res.ModalResult <> mrOk then Exit;

 id_rate_acc       := res.id_rate_acc;

 DataSet_Bank := TpFIBDataSet.Create(self);
 DataSet_Bank.Database := (Owner as TArnd_Sch_Form).Database;
 DataSet_Bank.Transaction := (Owner as TArnd_Sch_Form).ReadTransaction;
 DataSet_Bank.SQLs.SelectSQL.Text := 'select * from   pub_sp_cust_rate_acc, pub_sp_bank ' +
                                     'where  pub_sp_cust_rate_acc.id_bank=pub_sp_bank.id_bank ' +
                                     'and    pub_sp_cust_rate_acc.id_rate_account=' + IntToStr(id_rate_acc);
 DataSet_Bank.Active := true;
 MFOEdit.Text := DataSet_Bank.FieldByName('mfo').AsString;
 DataSet_Bank.Free;

 id_Dog            := res.id_dog;
 kod_Dog           := res.kod_dog;
 DogNameEdit.Text  := res.n_dog;
 NameCustEdit.Text := res.name_customer;
 RateAccEdit.Text  := res.rate_acc;
// MFOEdit.Text      := res.mfo;
 NoteMemo.Text     := res.dog_note;
 id_Tip_Dog        := res.id_tip_dog;
 TipDogEdit.Text   := res.name_tip_dog;
 RegNumEdit.Text   := res.regest_num;
 id_Customer       := res.id_customer;


 DataSet.SelectSQL.Text := 'select max(Date_End) from DOG_DT_ARND_SCH s left join DOG_DT_ARND_SMT sm on (s.id_sch=sm.id_sch) where id_Dog=' + IntToStr(id_Dog)+
                ' and sm.IS_RECALC =0' ;
 DataSet.Open;

 if not VarIsNull(DataSet.Fields[0].AsVariant) then
  DateBegEdit.Text := DateToStr(DataSet.Fields[0].AsDateTime + 1)
 else begin
  DataSet.Close;
  DataSet.SelectSQL.Text := 'select min(Date_Beg) from DOG_DT_ARENDA_P where id_Dog=' + IntToStr(id_Dog);
  DataSet.Open;

  DateBegEdit.Text := DateToStr(DataSet.Fields[0].AsDateTime);
 end;

 DateEndEdit.Date := EndOfTheMonth(StrToDate(DateBegEdit.Text));

 DataSet.Close;

 SavedBeg := StrToDate(DateBegEdit.Text);
 SavedEnd := DateEndEdit.Date;

 {
 DataSet.SelectSQL.Text := 'select max(Date_End) from DOG_DT_ARND_SCH where id_Dog=' + IntToStr(id_Dog);
 DataSet.Open;

 if not VarIsNull(DataSet.Fields[0].AsVariant) then
  StartOfPeriod := DataSet.Fields[0].AsDateTime
 else begin
  DataSet.Close;
  DataSet.SelectSQL.Text := 'select min(Date_Beg) from DOG_DT_ARENDA_P where id_Dog=' + IntToStr(id_Dog);
  DataSet.Open;

  StartOfPeriod := DataSet.Fields[0].AsDateTime;
 end;

 DataSet.Close;

 RefreshPeriods;
}
end;

// Блок проверок перед сохранением счёта
procedure TArnd_Sch_Add_Form.ApplyButtonClick(Sender: TObject);
begin

 if (SmetTableView.DataController.RecordCount = 0)
 and (OldSTableView.DataController.RecordCount = 0) then begin
  ShowMessage('Неможливо зберегти порожній рахунок!');
  Exit;
 end;

 if DateSchEdit.Text = '' then begin
  ShowMessage('Уведіть дату виставляння рахунку!');
  DateSchEdit.SetFocus;
  Exit;
 end;

 StoredProc.Transaction.StartTransaction;

 if not GetPkId then begin
  StoredProc.Transaction.Rollback;
  Exit;
 end;

 if not SaveSch then begin
  StoredProc.Transaction.Rollback;
  Exit;
 end;

 if not SaveSchToDoc then begin
  StoredProc.Transaction.Rollback;
  Exit;
 end;

 StoredProc.Transaction.Commit;

 ModalResult := mrOk;
end;

procedure TArnd_Sch_Add_Form.SmetTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
 S_Label1.Caption    := '';
 R_Label1.Caption    := '';
 St_Label1.Caption   := '';
 KEKV_Label1.Caption := '';

 if AFocusedRecord <> nil then begin
  if not VarIsNull(AFocusedRecord.Values[5]) then S_Label1.Caption     := AFocusedRecord.Values[5];
  if not VarIsNull(AFocusedRecord.Values[6])  then R_Label1.Caption    := AFocusedRecord.Values[6];
  if not VarIsNull(AFocusedRecord.Values[7])  then St_Label1.Caption   := AFocusedRecord.Values[7];
  if not VarIsNull(AFocusedRecord.Values[12]) then KEKV_Label1.Caption := AFocusedRecord.Values[12];
 end;

 S_Label1.Hint    := S_Label1.Caption;
 R_Label1.Hint    := R_Label1.Caption;
 St_Label1.Hint   := St_Label1.Caption;
 KEKV_Label1.Hint := KEKV_Label1.Caption;
end;

procedure TArnd_Sch_Add_Form.OldSTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
 S_Label2.Caption    := '';
 R_Label2.Caption    := '';
 St_Label2.Caption   := '';
 KEKV_Label2.Caption := '';

 if AFocusedRecord <> nil then begin
  if not  VarIsNull(AFocusedRecord.Values[5])  then S_Label2.Caption    := AFocusedRecord.Values[5];
  if not  VarIsNull(AFocusedRecord.Values[6])  then R_Label2.Caption    := AFocusedRecord.Values[6];
  if not  VarIsNull(AFocusedRecord.Values[7])  then St_Label2.Caption   := AFocusedRecord.Values[7];
  if not  VarIsNull(AFocusedRecord.Values[12]) then KEKV_Label2.Caption := AFocusedRecord.Values[12];
 end;

 S_Label2.Hint    := S_Label2.Caption;
 R_Label2.Hint    := R_Label2.Caption;
 St_Label2.Hint   := St_Label2.Caption;
 KEKV_Label2.Hint := KEKV_Label2.Caption;
end;

procedure TArnd_Sch_Add_Form.KindRadioGroupPropertiesChange(
  Sender: TObject);
begin
 DateBegEdit.Enabled := (KindRadioGroup.ItemIndex = 0);
 DateEndEdit.Enabled := (KindRadioGroup.ItemIndex = 0);
 if (KindRadioGroup.ItemIndex = 1) then
 begin
  DateBegEdit.Text:=DateToStr(EndOfTheMonth(StrToDate(DateSchEdit.Text)));
  DateEndEdit.Date:=EndOfTheMonth(StrToDate(DateSchEdit.Text));
 end else
 begin
  DateBegEdit.Text:=DateToStr(SavedBeg);
  DateEndEdit.Date:=SavedEnd;
 end;
// DateEndEdit.Clear;

 if CanEmptyTableViews then begin
  SmetTableView.DataController.RecordCount := 0;
  OldSTableView.DataController.RecordCount := 0;
 end;

 RefreshPeriods;
end;

procedure TArnd_Sch_Add_Form.DoCalcButtonClick(Sender: TObject);
var
 Sum : Currency;
begin
 if DogNameEdit.Text = '' then begin
  ShowMessage('Ви не обрали договір, на підставі якого додається рахунок!');
  DogNameEdit.SetFocus;
  Exit;
 end;

 SmetTableView.DataController.RecordCount := 0;
 OldSTableView.DataController.RecordCount := 0;

 if KindRadioGroup.ItemIndex = 0 then begin
  if DateBegEdit.Text = '' then begin
   ShowMessage('Ви не ввели дату початку періоду виставляння рахунку!');
   DateBegEdit.SetFocus;
   Exit;
  end;

  if DateEndEdit.Text = '' then begin
   ShowMessage('Ви не ввели дату закінчення періоду виставляння рахунку!');
   DateEndEdit.SetFocus;
   Exit;
  end;

  if DateEndEdit.Date < StrToDate(DateBegEdit.Text) then begin
   ShowMessage('Дата початку періоду не може бути більше дати його закінчення!');
   DateEndEdit.SetFocus;
   Exit;
  end;

  CalcSch;
 end
 else if KindRadioGroup.ItemIndex = 1 then begin ReCalculationAll2; end;

 Sum := 0;
 if not VarIsNull(SmetTableView.DataController.Summary.FooterSummaryValues[1]) then Sum := Sum + SmetTableView.DataController.Summary.FooterSummaryValues[1];
 if not VarIsNull(OldSTableView.DataController.Summary.FooterSummaryValues[1]) then Sum := Sum + OldSTableView.DataController.Summary.FooterSummaryValues[1];

 SumEdit.Text := FloatToStr(Sum);
 NDSEdit.Text := FloatToStr(RoundTo(Sum / 6, -2));
end;

procedure TArnd_Sch_Add_Form.FormShow(Sender: TObject);
var
 Flag : boolean;
 Sum  : currency;
 DataSetNds: TpFIBDataSet;
 DateBv: String;
 DateEv: String;
 id_per: integer;

begin

 if State = 'add' then begin
  DateSchEdit.Date := Now;
 end
 else begin
  DataSet.SelectSQL.Text := 'select * from DOG_DT_ARND_SMT_SEL(' + IntToStr(id_Sch) + ')';
  DataSet.Open;

  Flag := False;

  while not DataSet.Eof do begin
   if DataSet.FieldValues['IS_RECALC'] = 0 then with SmetTableView.DataController do begin
    Flag := True;
    RecordCount := RecordCount + 1;
    Values[RecordCount - 1, 0]  := DataSet.FieldValues['KOD_S'];
    Values[RecordCount - 1, 1]  := DataSet.FieldValues['KOD_R'];
    Values[RecordCount - 1, 2]  := DataSet.FieldValues['KOD_St'];
    Values[RecordCount - 1, 3]  := DataSet.FieldValues['KOD_KEKV'];
    Values[RecordCount - 1, 4]  := DataSet.FieldValues['SUMMA'];
    Values[RecordCount - 1, 5]  := DataSet.FieldValues['NAME_SMETA'];
    Values[RecordCount - 1, 6]  := DataSet.FieldValues['NAME_RAZD'];
    Values[RecordCount - 1, 7]  := DataSet.FieldValues['NAME_ST'];
    Values[RecordCount - 1, 8]  := DataSet.FieldValues['ID_S'];
    Values[RecordCount - 1, 9]  := DataSet.FieldValues['ID_R'];
    Values[RecordCount - 1, 10] := DataSet.FieldValues['ID_ST'];
    Values[RecordCount - 1, 11] := DataSet.FieldValues['ID_KEKV'];
    Values[RecordCount - 1, 12] := DataSet.FieldValues['NAME_KEKV'];
    if (DataSet.FieldValues['ID_FAV'] <> null) then begin
     Values[RecordCount - 1, 13] := DataSet.FieldValues['ID_FAV'];
     Values[RecordCount - 1, 14] := DataSet.FieldValues['FAV_CNT'];
     Values[RecordCount - 1, 15] := DataSet.FieldValues['TARIF_VALUE'];
     Values[RecordCount - 1, 16] := DataSet.FieldValues['ARND_SUM'];
    end;
   end
   else if DataSet.FieldValues['IS_RECALC'] = 1 then with OldSTableView.DataController do begin
    RecordCount := RecordCount + 1;
//
    Values[RecordCount - 1, 0]  := DataSet.FieldValues['KOD_S'];
    Values[RecordCount - 1, 1]  := DataSet.FieldValues['KOD_R'];
    Values[RecordCount - 1, 2]  := DataSet.FieldValues['KOD_St'];
    Values[RecordCount - 1, 3]  := DataSet.FieldValues['KOD_KEKV'];
    Values[RecordCount - 1, 4]  := DataSet.FieldValues['SUMMA'];
    Values[RecordCount - 1, 5]  := DataSet.FieldValues['NAME_SMETA'];
    Values[RecordCount - 1, 6]  := DataSet.FieldValues['NAME_RAZD'];
    Values[RecordCount - 1, 7]  := DataSet.FieldValues['NAME_ST'];
    Values[RecordCount - 1, 8]  := DataSet.FieldValues['ID_S'];
    Values[RecordCount - 1, 9]  := DataSet.FieldValues['ID_R'];
    Values[RecordCount - 1, 10] := DataSet.FieldValues['ID_ST'];
    Values[RecordCount - 1, 11] := DataSet.FieldValues['ID_KEKV'];
    Values[RecordCount - 1, 12] := DataSet.FieldValues['NAME_KEKV'];
    if ( DataSet.FieldValues['ID_FAV'] <> null) then begin
     Values[RecordCount - 1, 13] := DataSet.FieldValues['ID_FAV'];
     Values[RecordCount - 1, 14] := DataSet.FieldValues['FAV_CNT'];
     Values[RecordCount - 1, 15] := DataSet.FieldValues['TARIF_VALUE'];
     Values[RecordCount - 1, 16] := DataSet.FieldValues['ARND_SUM'];
    end;

    StPrc.Transaction.StartTransaction;
    StPrc.StoredProcName:='DOG_DT_ARENDA_SEL_P_DATE';
    StPrc.ParamByName('ID_SCH').AsInteger:=DataSet.FieldValues['id_sch_recalc'];
    StPrc.ExecProc;

    Values[RecordCount - 1, 17] :=CodeDayFormat(StPrc.FldByName['DATE_BEG'].AsDateTime);
    Values[RecordCount - 1, 18] :=CodeDayFormat(StPrc.FldByName['DATE_END'].AsDateTime);
    StPrc.Close;
    StPrc.Transaction.Commit;
   end;

   DataSet.Next;
  end;

  DataSet.Close;

  CanEmptyTableViews := False;
  if Flag then KindRadioGroup.ItemIndex := 0 else KindRadioGroup.ItemIndex := 1;
  CanEmptyTableViews := True;

  KindRadioGroup.Enabled := False;
  DoCalcButton.Visible   := False;
  ApplyButton.Visible    := False;

  RegNumEdit.Properties.ReadOnly  := true;
  DogNameEdit.Properties.ReadOnly := True;
  DateSchEdit.Properties.ReadOnly := True;
  DateBegEdit.Properties.ReadOnly := True;
  DateEndEdit.Properties.ReadOnly := True;

  RegNumEdit.Style.Color  := $00D9EBE0;
  DogNameEdit.Style.Color := $00D9EBE0;
  DateSchEdit.Style.Color := $00D9EBE0;
  DateBegEdit.Style.Color := $00D9EBE0;
  DateEndEdit.Style.Color := $00D9EBE0;

  DateSchEdit.Style.ButtonTransparency := ebtAlways;
  DateBegEdit.Style.ButtonTransparency := ebtAlways;
  DateEndEdit.Style.ButtonTransparency := ebtAlways;

  DogNameEdit.Properties.Buttons[0].Visible := False;

  Sum := 0;
  if not VarIsNull(SmetTableView.DataController.Summary.FooterSummaryValues[1]) then Sum := Sum + SmetTableView.DataController.Summary.FooterSummaryValues[1];
  if not VarIsNull(OldSTableView.DataController.Summary.FooterSummaryValues[1]) then Sum := Sum + OldSTableView.DataController.Summary.FooterSummaryValues[1];

  SumEdit.Text := FloatToStr(Sum);

  //NDSEdit.Text := FloatToStr(RoundTo(Sum / 6, -2));
  //НДС расчитанный по свойствам статей
  DataSetNds                      := TpFIBDataSet.create(Self);
  DataSetNds.Database             := (Owner as TArnd_Sch_Form).Database;
  DataSetNds.Transaction          := (Owner as TArnd_Sch_Form).ReadTransaction;
  DataSetNds.SQLs.SelectSQL.Text  := 'select * from DOG_ARND_GET_SUM_NDS(' + IntToStr(id_Sch) + ')';
  DataSetNds.Active               := true;
  NDSEdit.Text                    := DataSetNds.FieldByName('sum_nds').AsString;
  DataSetNds.Free;
 end;
end;
// -----------------------------------------------------------------------------
// Процедура для преобразования дат
function TArnd_Sch_Add_Form.CodeDayFormat(DateCon: TDate):String;
var
 myYear, myMonth, myDay : word;
 YearNew : String;
 NewDate : String;
begin
 DecodeDate(DateCon, myYear, myMonth, myDay);
 YearNew:=IntToStr(myYear);
 delete(YearNew,1,1);
 delete(YearNew,1,1);
 NewDate:='';

 if (myDay < 10) then begin
  NewDate:='0'+IntToStr(myDay)+'.';
 end else
  NewDate:=IntToStr(myDay)+'.';

 if (myMonth < 10) then begin
  NewDate:=NewDate + '0'+IntToStr(myMonth)+'.';
 end else
 NewDate:=NewDate + IntToStr(myMonth)+'.';
 NewDate:=NewDate+YearNew;
 Result:=NewDate;

end;


function TArnd_Sch_Add_Form.GetPkId: boolean;
begin
 Result := False;

 DataSet.SelectSQL.Text := 'SELECT result from PUB_SP_TIP_DOG_BELONG_GROUP(' + IntToStr(ID_TIP_DOG) + ', 32)';
 DataSet.Open;

 if DataSet['RESULT'] <> 1 then begin
  DataSet.Close;
  Result := True;
  pk_id  := null;
  Exit;
 end;

 DataSet.Close;

// Выбираю тип документа

 DataSet.SelectSQL.Text := 'select ID_TYPE_DOC_ARND from DOG_SYS_OPTIONS';
 DataSet.Open;


 if VarIsNull(DataSet['ID_TYPE_DOC_ARND']) then begin
  ShowMessage('Тип документу не знайдено!');
  DataSet.Close;
  Exit;
 end;

 id_Type_Doc := DataSet.FieldByName('ID_TYPE_DOC_ARND').AsInteger;

 DataSet.Close;

 // Выбираю ИД документа

 DataSet.SelectSQL.Text := 'select RET_VALUE from PUB_GET_ID_DOC(' + IntToStr(id_Type_Doc) + ')';

 DataSet.Open;
 PK_id := DataSet.FieldByName('RET_VALUE').AsString;
 DataSet.Close;

 // Выбираю Дб счет

 DataSet.SelectSQL.Text := 'select ID_BL_ACCOUNT from PUB_SP_TIP_DOG_INFO('
 + IntToStr(ID_TIP_DOG) + ')';
 DataSet.Open;

 if DataSet.RecordCount = 0 then begin
  ShowMessage('Кореспондуючий рахунок не знайдено!');
  DataSet.Close;
  Exit;
 end;

 id_Sch_DB := DataSet['ID_BL_ACCOUNT'];

 DataSet.Close;

// Выбираю датy проводки

 DataSet.SelectSQL.Text := 'select DATE_START, RESULT_MESSAGE from KERNEL_GET_SCH_START_PERIOD('
 + IntToStr(id_Sch_DB) + ')';
 DataSet.Open;

 if DataSet.FieldByName('RESULT_MESSAGE').AsString = 'OK' then WORKDATE:= DataSet.FieldByName('DATE_START').AsDateTime
 else begin
  ShowMessage(DataSet.FieldByName('RESULT_MESSAGE').AsString);
  DataSet.Close;
  Exit;
 end;

 if StartOfTheMonth(StrToDate(DateBegEdit.Text)) > StartOfTheMonth(WORKDATE) then WORKDATE := StartOfTheMonth(StrToDate(DateBegEdit.Text));

 DataSet.Close;

 Result := True;
end;

function TArnd_Sch_Add_Form.SaveSch : boolean;
var
 i   : integer;
 mfo : variant;
begin
 if MFOEdit.Text = '' then mfo := null
 else mfo := StrToInt(MFOEdit.Text);

 if KindRadioGroup.ItemIndex = 0 then begin
  StoredProc.StoredProcName := 'DOG_DT_ARND_SCH_ADD';
  StoredProc.Prepare;

  StoredProc.ParamByName('OUT_SCH').AsInteger    := 0;
  StoredProc.ParamByName('ID_DOG').AsInt64       := id_Dog;
  StoredProc.ParamByName('TIP_DOG').AsInteger    := id_Tip_Dog;
  StoredProc.ParamByName('S_DATE_REG').AsVariant := null;
  StoredProc.ParamByName('DATE_CR').AsDate       := Now;
  StoredProc.ParamByName('DATE_SCH').AsDate      := DateSchEdit.Date;
  StoredProc.ParamByName('DATE_BEG').AsDate      := StrToDate(DateBegEdit.Text);
  StoredProc.ParamByName('DATE_END').AsDate      := DateEndEdit.Date;
  StoredProc.ParamByName('NUM_SCH').AsString     := '';
  StoredProc.ParamByName('KODP').AsVariant       := null;
  StoredProc.ParamByName('MFO').AsVariant        := mfo;
  StoredProc.ParamByName('RSCHET').AsString      := RateAccEdit.Text;
  StoredProc.ParamByName('SUMMA').AsCurrency     := StrToCurr(SumEdit.Text);
  StoredProc.ParamByName('PK_ID_DOC').AsInt64    := pk_id;
  StoredProc.ParamByName('WORKDATE').AsDate      := WORKDATE;

  StoredProc.ExecProc;
 end
 else begin
  StoredProc.StoredProcName := 'DOG_DT_ARND_SCH_ADD';
  StoredProc.Prepare;

  StoredProc.ParamByName('OUT_SCH').AsInteger    := 0;
  StoredProc.ParamByName('ID_DOG').AsInt64       := id_Dog;
  StoredProc.ParamByName('TIP_DOG').AsInteger    := id_Tip_Dog;
  StoredProc.ParamByName('S_DATE_REG').AsVariant := null;
  StoredProc.ParamByName('DATE_CR').AsDate       := Now;
  StoredProc.ParamByName('DATE_SCH').AsDate      := DateSchEdit.Date;
  StoredProc.ParamByName('DATE_BEG').AsDate      := Date;
  StoredProc.ParamByName('DATE_END').AsDate      := Date;
  StoredProc.ParamByName('NUM_SCH').AsString     := '';
  StoredProc.ParamByName('KODP').AsVariant       := null;
  StoredProc.ParamByName('MFO').AsVariant        := mfo;
  StoredProc.ParamByName('RSCHET').AsString      := RateAccEdit.Text;
  StoredProc.ParamByName('SUMMA').AsCurrency     := StrToCurr(SumEdit.Text);
  StoredProc.ParamByName('PK_ID_DOC').AsInt64    := pk_id;
  StoredProc.ParamByName('WORKDATE').AsDate      := WORKDATE;


  StoredProc.ExecProc;
 end;

 id_Sch := StoredProc.Fields[0].AsInteger;
 NumDoc := StoredProc.Fields[1].AsString;
 with SmetTableView.DataController do begin
  for i := 0 to RecordCount - 1 do
   StoredProc.ExecProcedure('DOG_DT_ARND_SMT_ADD', [id_Sch, Values[i, 8], Values[i, 9],
   Values[i, 10], Values[i, 11], Values[i, 4], 0,Values[i, 13],Values[i, 14],Values[i, 15],Values[i, 16],Values[i, 17],PerSumAll]);
 end;

 with OldSTableView.DataController do begin
  for i := 0 to RecordCount - 1 do
   StoredProc.ExecProcedure('DOG_DT_ARND_SMT_ADD', [id_Sch, Values[i, 8], Values[i, 9],
   Values[i, 10], Values[i, 11], Values[i, 4], 1,Values[i, 13],Values[i, 14],Values[i, 15],Values[i, 16],Values[i, 19],0]);
 end;

 Result := True;
end;

function TArnd_Sch_Add_Form.SaveSchToDoc : boolean;
var
 i           : integer;
 Sum         : currency;

 KEY_SESSION : Int64;
 STRU        : KERNEL_MODE_STRUCTURE;
 DoResult    : Boolean;
 ErrorList   : TStringList;

 id_Sch_KR   : integer;

 s           : string;
begin
 Result := False;

// Добавляю документ и проводки

 KEY_SESSION := DataSet.Database.Gen_Id('KERNEL_GEN_ID_SESSION', 1);


 //-----------

 Sum := 0;

 with SmetTableView.DataController do
  for i := 0 to RecordCount - 1 do Sum := Sum + Values[i, 4];

 with OldSTableView.DataController do
  for i := 0 to RecordCount - 1 do Sum := Sum + Values[i, 4];

 //-----------

 StoredProc.StoredProcName := 'JO9_DT_ALL_DOC_ADD';
 StoredProc.Prepare;

 StoredProc.ParamByName('KEY_SESSION').AsInt64   := KEY_SESSION;
 StoredProc.ParamByName('PK_ID').AsInt64         := PK_id;
 StoredProc.ParamByName('COMPUTER').AsString     := DogLoaderUnit.GetCompName;
 StoredProc.ParamByName('DATE_PROV').AsDate      := WORKDATE;
 StoredProc.ParamByName('DATE_DOC').AsDate       := DateSchEdit.Date;

 StoredProc.ParamByName('ID_TYPE_DOC').AsInteger := id_Type_Doc;
 StoredProc.ParamByName('REG_NUM').AsString      := NumDoc;
 StoredProc.ParamByName('SUMMA').AsCurrency      := Sum;
 StoredProc.ParamByName('ID_CUSTOMER').AsInt64   := id_Customer;
 StoredProc.ParamByName('NOTE').AsString         := 'Рахунок:' + NoteMemo.Text;
 StoredProc.ParamByName('KREDIT').AsInteger      := 0;

 StoredProc.ExecProc;

 with SmetTableView.DataController do begin
  for i := 0 to RecordCount - 1 do begin
   DataSet.SelectSQL.Text := 'select * from BU_GET_FOND_NDS(' + IntToStr(Values[i, 8])
   + ',' + IntToStr(Values[i, 9]) + ',' + IntToStr(Values[i, 10]) + ','
   + QuotedStr(DateToStr(WORKDATE)) + ')';
   DataSet.Open;

   if DataSet['RESULT'] = 0 then begin
    ShowMessage(DataSet['RESULT_MESSAGE']);
    DataSet.Close;
    Exit;
   end
   else id_Sch_KR := DataSet['ID_FOND'];

   DataSet.Close;

   StoredProc.StoredProcName := 'JO9_DT_ALL_PROV_ADD';
   StoredProc.Prepare;

   StoredProc.ParamByName('KEY_SESSION').AsInt64 := KEY_SESSION;
   StoredProc.ParamByName('KREDIT').AsInteger    := 0;
   StoredProc.ParamByName('DB_ID_SCH').AsInteger := id_Sch_DB;
   StoredProc.ParamByName('KR_ID_SCH').AsInteger := id_Sch_KR;
   StoredProc.ParamByName('ID_S').AsInteger      := Values[i, 8];
   StoredProc.ParamByName('ID_R').AsInteger      := Values[i, 9];
   StoredProc.ParamByName('ID_ST').AsInteger     := Values[i, 10];
   StoredProc.ParamByName('ID_KEKV').AsInteger   := Values[i, 11];
   StoredProc.ParamByName('SUMMA').AsCurrency    := Values[i, 4];
   StoredProc.ParamByName('ID_DOG').AsInt64      := id_Dog;
   StoredProc.ParamByName('KOD_DOG').AsInt64     := kod_Dog;
   StoredProc.ParamByName('IS_MAIN').AsInteger   := 1;

   StoredProc.ExecProc;
  end;
 end;

//------------------->>>>>>>>>>

 with OldSTableView.DataController do begin
  for i := 0 to RecordCount - 1 do begin
   DataSet.SelectSQL.Text := 'select * from BU_GET_FOND_NDS(' + IntToStr(Values[i, 8])
   + ',' + IntToStr(Values[i, 9]) + ',' + IntToStr(Values[i, 10]) + ','
   + QuotedStr(DateToStr(WORKDATE)) + ')';
   DataSet.Open;

   if DataSet['RESULT'] = 0 then begin
    ShowMessage(DataSet['RESULT_MESSAGE']);
    DataSet.Close;
    Exit;
   end
   else id_Sch_KR := DataSet['ID_FOND'];

   DataSet.Close;

   StoredProc.StoredProcName := 'JO9_DT_ALL_PROV_ADD';
   StoredProc.Prepare;

   StoredProc.ParamByName('KEY_SESSION').AsInt64 := KEY_SESSION;
   StoredProc.ParamByName('KREDIT').AsInteger    := 0;
   StoredProc.ParamByName('DB_ID_SCH').AsInteger := id_Sch_DB;
   StoredProc.ParamByName('KR_ID_SCH').AsInteger := id_Sch_KR;
   StoredProc.ParamByName('ID_S').AsInteger      := Values[i, 8];
   StoredProc.ParamByName('ID_R').AsInteger      := Values[i, 9];
   StoredProc.ParamByName('ID_ST').AsInteger     := Values[i, 10];
   StoredProc.ParamByName('ID_KEKV').AsInteger   := Values[i, 11];
   StoredProc.ParamByName('SUMMA').AsCurrency    := Values[i, 4];
   StoredProc.ParamByName('ID_DOG').AsInt64      := id_Dog;
   StoredProc.ParamByName('KOD_DOG').AsInt64     := kod_Dog;
   StoredProc.ParamByName('IS_MAIN').AsInteger   := 1;

   StoredProc.ExecProc;
  end;
 end;

// ______________________

 STRU.KEY_SESSION   := KEY_SESSION;
 STRU.WORKDATE      := WORKDATE;
 STRU.DBHANDLE      := StoredProc.Database.Handle;
 STRU.TRHANDLE      := StoredProc.Transaction.Handle;
 STRU.KERNEL_ACTION := 1;
 STRU.ID_USER       := DogLoaderUnit.SYS_ID_USER;

 try
  DoResult:=Kernel.KernelDo(@STRU);
 except
  on E:Exception do begin
   ShowMessage('Помилка ядра ' + E.Message);
   Exit;
  end;
 end;

 if not DoResult then begin
  ErrorList := Kernel.GetDocErrorsListEx(@STRU);

  s := '';
  for i := 0 to ErrorList.Count - 1 do begin
   if s <> '' then s := s + #13;
   s := s + ErrorList.Strings[i];
  end;

  ShowMessage(s);
  Exit;
 end;

 Result := True;
end;

procedure TArnd_Sch_Add_Form.saveExecute(Sender: TObject);
begin
  ApplyButtonClick(Self);
end;

procedure TArnd_Sch_Add_Form.calcExecute(Sender: TObject);
begin
  DoCalcButtonClick(Self);
end;

procedure TArnd_Sch_Add_Form.CancelExecute(Sender: TObject);
begin
  CancelButtonClick(Self);
end;

procedure TArnd_Sch_Add_Form.cxButton1Click(Sender: TObject);
var
  DataSetShablon : TpFIBDataSet;
begin
  DataSetShablon := TpFIBDataSet.Create(Self);
  DataSetShablon.Database    := (Owner as TArnd_Sch_Form).Database;
  DataSetShablon.Transaction := (Owner as TArnd_Sch_Form).ReadTransaction;
  DataSetShablon.SQLs.SelectSQL.Text := 'select * from dog_ini_shablon s, pub_sp_tip_dog p where p.id_ini_shablon=s.id_ini_shablon and p.id_tip_dog='+IntToStr(id_tip_dog);
  DataSetShablon.Active := true;
  LoadDogManedger.LoadShablon(Owner, (Owner as TArnd_Sch_Form).Database.Handle, fsNormal, ID_DOG, 'prosmotr', id_tip_dog, PChar(DataSetShablon.FieldByName('name_shablon').asString), nil);
  DataSetShablon.Active := false;
  DataSetShablon.Free;
end;

procedure TArnd_Sch_Add_Form.SmetTableViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 with SmetTableView.DataController do begin
  if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift) and (ssCtrl in Shift) then begin
   if FocusedRecordIndex < 0 then Exit;

   try
    ShowMessage('ID_SM: '     + IntToStr(Values[FocusedRecordIndex, 8]) + #13
              + 'ID_RZ: '     + IntToStr(Values[FocusedRecordIndex, 9]) + #13
              + 'ID_ST: '     + IntToStr(Values[FocusedRecordIndex, 10]) + #13
              + 'ID_KEKV: '   + IntToStr(Values[FocusedRecordIndex, 11])+ #13
              + 'ID_FAV: '    + IntToStr(Values[FocusedRecordIndex, 13]) + #13
              + 'CNT_FAV: '    + IntToStr(Values[FocusedRecordIndex, 14]));
   except
   end;
  end;
 end;
end;

procedure TArnd_Sch_Add_Form.OldSTableViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 with OldSTableView.DataController do begin
  if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift) and (ssCtrl in Shift) then begin
   if FocusedRecordIndex < 0 then Exit;

   try
    ShowMessage('ID_SM: '     + IntToStr(Values[FocusedRecordIndex, 8]) + #13
              + 'ID_RZ: '     + IntToStr(Values[FocusedRecordIndex, 9]) + #13
              + 'ID_ST: '     + IntToStr(Values[FocusedRecordIndex, 10]) + #13
              + 'ID_KEKV: '   + IntToStr(Values[FocusedRecordIndex, 11]));
   except
   end;
  end;
 end;
end;
 { Процедура обновления периодов }
procedure TArnd_Sch_Add_Form.RefreshPeriods;
begin
// DateBegEdit.Text := '';
// DateEndEdit.Text := '';

 if VarIsNull(StartOfPeriod) then Exit;

 if KindRadioGroup.ItemIndex = 0 then begin
  DateBegEdit.Text := DateToStr(StartOfPeriod+1);
  DateEndEdit.Date := EndOfTheMonth(StartOfPeriod + 1);
 end
 else begin
  DateBegEdit.Text := DateToStr(StartOfPeriod);
  DateEndEdit.Date := StartOfPeriod;
 end;
end;

procedure TArnd_Sch_Add_Form.FormResize(Sender: TObject);
begin
 Panel.Left := (Width  - Panel.Width  - 7) div 2;
 Panel.Top  := (Height - Panel.Height - 32) div 2;
end;

procedure TArnd_Sch_Add_Form.NoteMemoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift) and (ssCtrl in Shift) then begin
   SmetTableView.OptionsData.Editing := not SmetTableView.OptionsData.Editing;
   SmetTableView.OptionsSelection.CellSelect := not SmetTableView.OptionsSelection.CellSelect;
  end;
end;

procedure TArnd_Sch_Add_Form.ApplyButtonKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F8 then
  begin
    ApplyButton.SetFocus;
  end;
end;

procedure TArnd_Sch_Add_Form.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if Key = VK_F8 then
  begin
    ApplyButton.SetFocus;
  end;

end;

procedure TArnd_Sch_Add_Form.RegNumEditKeyPress(Sender: TObject;
  var Key: Char);
var
 Res : TDogResult;
 input : TDogInput;
 id_rate_acc: Int64;
 id_dog_in:Int64;
 DataSet_Bank : TpFIBDataSet;
begin
 if Key = #13 then begin
  Key := #0;
  StPrc.Transaction.StartTransaction;
  StPrc.StoredProcName:='PROC_DOG_DT_DOCUMENT_FIND_BYNUM';
  StPrc.ParamByName('REG_NUM').AsString:=RegNumEdit.Text;
  StPrc.ParamByName('ID_GROUP_DOC').AsInteger:=id_group;
  StPrc.ExecProc;
  id_dog_in:=StPrc.FieldByName('ID_DOG').AsInt64;
  StPrc.Transaction.Commit;
 end
 else
 begin
  exit;
 end;

 if ((id_dog_in = 0) or (id_dog_in = null)) then
 begin
  exit;
 end;




 StPrc.Transaction.StartTransaction;
 StPrc.StoredProcName:='PROC_DOG_DT_DOCUMENT_GET_INFO';
 StPrc.ParamByName('IN_ID_DOG').AsInt64:=id_dog_in;
 StPrc.ParamByName('IN_KOD_DOG').AsInteger:=0;
 StPrc.ExecProc;

 id_rate_acc       := StPrc.FieldByName('ID_RATE_ACCOUNT').AsInt64;

 DataSet_Bank := TpFIBDataSet.Create(self);
 DataSet_Bank.Database := (Owner as TArnd_Sch_Form).Database;
 DataSet_Bank.Transaction := (Owner as TArnd_Sch_Form).ReadTransaction;
 DataSet_Bank.SQLs.SelectSQL.Text := 'select * from   pub_sp_cust_rate_acc, pub_sp_bank ' +
                                     'where  pub_sp_cust_rate_acc.id_bank=pub_sp_bank.id_bank ' +
                                     'and    pub_sp_cust_rate_acc.id_rate_account=' + IntToStr(id_rate_acc);
 DataSet_Bank.Active := true;
 MFOEdit.Text := DataSet_Bank.FieldByName('mfo').AsString;
 DataSet_Bank.Free;

 kod_Dog           := StPrc.FieldByName('KOD_DOG').AsInt64;
 DogNameEdit.Text  := StPrc.FieldByName('N_DOG').AsString;
 id_dog            := id_dog_in;
 NameCustEdit.Text := StPrc.FieldByName('NAME_CUSTOMER').AsString;
 RateAccEdit.Text  := StPrc.FieldByName('RATE_ACCOUNT').AsString;
 NoteMemo.Text     := StPrc.FieldByName('DOG_NOTE').AsString;

 id_Tip_Dog        := StPrc.FieldByName('ID_TIP_DOG').AsInteger;
 TipDogEdit.Text   := StPrc.FieldByName('NAME_TIP_DOG').AsString;
 if ((id_dog_in <> 0) and (id_dog_in <> null)) then
 begin
  RegNumEdit.Text   := StPrc.FieldByName('REGEST_NUM').AsString;
 end;
 id_Customer       := StPrc.FieldByName('id_customer').AsInt64;

 DataSet.SelectSQL.Text := 'select max(Date_End) from DOG_DT_ARND_SCH where id_Dog=' + IntToStr(id_Dog);
 DataSet.Open;

 if not VarIsNull(DataSet.Fields[0].AsVariant) then
  DateBegEdit.Text := DateToStr(DataSet.Fields[0].AsDateTime + 1)
 else begin
  DataSet.Close;
  DataSet.SelectSQL.Text := 'select min(Date_Beg) from DOG_DT_ARENDA_P where id_Dog=' + IntToStr(id_Dog);
  DataSet.Open;

  DateBegEdit.Text := DateToStr(DataSet.Fields[0].AsDateTime);
 end;

 DateEndEdit.Date := EndOfTheMonth(StrToDate(DateBegEdit.Text));

 DataSet.Close;
 StPrc.Transaction.Commit;

end;

end.


