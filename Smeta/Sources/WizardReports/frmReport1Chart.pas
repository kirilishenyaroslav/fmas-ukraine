unit frmReport1Chart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, ComCtrls, pFibDataSet,
  pFibdatabase,Fibdatabase;

type
  TfrmReport1Diagram = class(TForm)
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    Chart1: TChart;
    TabSheet1: TTabSheet;
    Chart2: TChart;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    LocalDS:TpFibDataSet;
  public
    { Public declarations }
    constructor Create(Aowner:TComponent;InfoDS:TpFibdataSet);reintroduce;
  end;



implementation

{$R *.dfm}

constructor TfrmReport1Diagram.Create(Aowner: TComponent;
  InfoDS: TpFibdataSet);
begin
     inherited Create(Aowner);
     LocalDS:=InfoDS;
end;

procedure TfrmReport1Diagram.FormCreate(Sender: TObject);

function GetSeries(Chart:TChart;Id:Integer):TBarSeries;
var i:Integer;
    Res:TBarSeries;
begin
     Res:=Nil;
     for i:=0 to Chart.SeriesList.Count-1 do
     begin
          if Chart.SeriesList[i].Tag=id
          then begin
                    Res:=TBarSeries(Chart.SeriesList[i]);
                    Break;
          end;
     end;
     Result:=Res;
end;

function GetPlanName(datebase:TFibdatabase;trans:tfibtransaction;id_plan:int64):string;
var Info:TpFibDataSet;
    Res:String;
begin
     Res:='';

     try
           Info:=TpFibDataSet.Create(self);
           Info.Database:=datebase;
           Info.Transaction:=trans;
           Info.SelectSQL.Text:='Select coalesce(note,'') as note from bu_smet_plus_periods where id_plan='+IntTostr(id_plan);
           Info.Open ;
           if Info.RecordCount>0
           then begin
                     Res:=Info.FieldByName('NOTE').Value;
           end;
           Info.Close;
           Info.Free;
     except on E:Exception do begin end;      
     end;

     Result:=Res;
end;

var i,s,j:Integer;
    Series:TBarSeries;
    _pos:Integer;
    s_l:Integer;
begin
       //Подсчитываем количество доходных разделов
       LocalDS.First;   s:=0;
       for i:=0 to LocalDS.RecordCount-1 do
       begin
            if  (LocalDS.FieldByName('IS_RAZDEL').value  =1)
            and (LocalDS.FieldByName('PROFIT_FLAG').value=1)
            then begin
                      Series:=TBarSeries.Create(self);
                      Series.MultiBar:=mbStacked;
                      Series.Title:=LocalDS.FieldByName('SHOW_TITLE').value;
                      Series.Tag  :=LocalDS.FieldByName('SHOW_ID').value;
                      Series.Marks.Visible:=false;
                      Chart1.AddSeries(Series);
                      Chart1.SeriesList[s] := Series;
                      s:=s+1;
            end;
            LocalDS.Next;
       end;

       LocalDS.First;
       for i:=0 to LocalDS.RecordCount-1 do
       begin
            if  (LocalDS.FieldByName('IS_RAZDEL').value  =1)
            and (LocalDS.FieldByName('PROFIT_FLAG').value=1)
            then begin
                      //Проходимся по всем полям бюджетов
                      for j:=0 to LocalDS.FieldCount-1 do
                      begin
                           if  (Pos('SM_',LocalDS.Fields[j].FieldName)>0)
                           and (Pos('_FC',LocalDS.Fields[j].FieldName)=0)
                           and (Pos('_PERCENT',LocalDS.Fields[j].FieldName)=0)
                           then begin
                                     Series:=GetSeries(Chart1,LocalDS.FieldByName('SHOW_ID').value);
                                     _pos:=Pos('_',LocalDS.Fields[j].FieldName);
                                     s_l:=Length(LocalDS.Fields[j].FieldName);

                                     if LocalDS.Fields[j].Value <>null
                                     then begin
                                               Series.AddY(LocalDS.Fields[j].Value,
                                               GetPlanName(LocalDS.database,
                                                           LocalDS.transaction,
                                                           StrToInt64(Copy(LocalDS.Fields[j].FieldName,_pos+1,s_l-_pos))),
                                               clTeeColor)
                                     end
                                     else begin
                                               Series.AddY(0,
                                               GetPlanName(LocalDS.database,
                                                           LocalDS.transaction,
                                                           StrToInt64(Copy(LocalDS.Fields[j].FieldName,_pos+1,s_l-_pos))),
                                               clTeeColor)
                                     end
                           end
                      end;
            end;
            LocalDS.Next;
       end;


       LocalDS.First;   s:=0;
       for i:=0 to LocalDS.RecordCount-1 do
       begin
            if  (LocalDS.FieldByName('IS_RAZDEL').value  =1)
            and (LocalDS.FieldByName('PROFIT_FLAG').value=0)
            then begin
                      Series:=TBarSeries.Create(self);
                      Series.MultiBar:=mbStacked;
                      Series.Title:=LocalDS.FieldByName('SHOW_TITLE').value;
                      Series.Tag  :=LocalDS.FieldByName('SHOW_ID').value;
                      Series.Marks.Visible:=false;
                      Chart2.AddSeries(Series);
                      Chart2.SeriesList[s] := Series;
                      s:=s+1;
            end;
            LocalDS.Next;
       end;

       LocalDS.First;
       for i:=0 to LocalDS.RecordCount-1 do
       begin
            if  (LocalDS.FieldByName('IS_RAZDEL').value  =1)
            and (LocalDS.FieldByName('PROFIT_FLAG').value=0)
            then begin
                      //Проходимся по всем полям бюджетов
                      for j:=0 to LocalDS.FieldCount-1 do
                      begin
                           if  (Pos('SM_',LocalDS.Fields[j].FieldName)>0)
                           and (Pos('_FC',LocalDS.Fields[j].FieldName)=0)
                           and (Pos('_PERCENT',LocalDS.Fields[j].FieldName)=0)
                           then begin
                                     Series:=GetSeries(Chart2,LocalDS.FieldByName('SHOW_ID').value);
                                     
                                     if LocalDS.Fields[j].Value <>null
                                     then begin
                                               Series.AddY(LocalDS.Fields[j].Value,
                                               GetPlanName(LocalDS.database,
                                                           LocalDS.transaction,
                                                           StrToInt64(Copy(LocalDS.Fields[j].FieldName,_pos+1,s_l-_pos))),clTeeColor)
                                     end
                                     else begin
                                               Series.AddY(0,
                                               GetPlanName(LocalDS.database,
                                                           LocalDS.transaction,
                                                           StrToInt64(Copy(LocalDS.Fields[j].FieldName,_pos+1,s_l-_pos))),clTeeColor)
                                     end
                           end
                      end;
            end;
            LocalDS.Next;
       end;

end;

end.
