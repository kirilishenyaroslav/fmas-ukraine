unit USmetChart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, TeeProcs, TeEngine, Chart, ComCtrls, Series, pFibDataSet;

type
  TChartForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Chart1: TChart;
    Series1: TPieSeries;
    Chart2: TChart;
    PieSeries1: TPieSeries;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;



implementation

uses USmetStru;

{$R *.dfm}

procedure TChartForm.FormCreate(Sender: TObject);
function GetColor(I:Integer):TColor;
begin
     Result:=clRed;
     if i mod 3 = 0
     then begin
               Result:=clGreen;
               Exit;
     end;
     if i mod 4 = 0
     then begin
               Result:=clYellow;
               Exit;
     end;
     if i mod 5 = 0
     then begin
               Result:=clBlue;
               Exit;
     end;
     if i mod 6 = 0
     then begin
               Result:=clGray;
               Exit;
     end;
     if i mod 7 = 0
     then begin
               Result:=clWhite;
               Exit;
     end;
end;
var i:Integer;
    Color:Integer;
    GetInfoDS:TpFibDataSet;
begin
     Self.Caption:=TfrmSmetaStru(owner).Caption;

     GetInfoDS:=TpFibDataSet.Create(self);
     GetInfoDS.Database   :=TfrmSmetaStru(owner).WorkDatabase;
     GetInfoDS.Transaction:=TfrmSmetaStru(owner).ReadTransaction;
     GetInfoDS.SelectSQL.Text:='SELECT * FROM BU_GET_BUDGET_STRU_VALUES('+IntToStr(TfrmSmetaStru(owner).CurIdSmeta)+','+''''+DateToStr(TfrmSmetaStru(owner).PlanDateBeg+1)+''''+')';
     GetInfoDS.Open;

     Color:=0;
     GetInfoDS.FetchAll;
     GetInfoDS.First;
     for i:=0 to GetInfoDS.RecordCount-1 do
     begin
          if GetInfoDS.FieldByName('PROFIT_FLAG').AsInteger=1
          then begin
                    Series1.Add(GetInfoDS.FieldByName('PLAN_VALUE').Value,
                                GetInfoDS.FieldByName('SHOW_TITLE').Value,
                                getColor(Color));
                    Color:=Color+1;
          end;
          GetInfoDS.Next;
     end;

     Color:=0;
     GetInfoDS.First;
     for i:=0 to GetInfoDS.RecordCount-1 do
     begin
          if GetInfoDS.FieldByName('PROFIT_FLAG').AsInteger=0
          then begin
                    PieSeries1.Add(GetInfoDS.FieldByName('PLAN_VALUE').Value,
                                   GetInfoDS.FieldByName('SHOW_TITLE').Value,
                                   getColor(Color));
                    Color:=Color+1;
          end;
          GetInfoDS.Next;
     end;


end;

end.
