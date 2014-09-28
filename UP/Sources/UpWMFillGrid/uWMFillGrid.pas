unit uWMFillGrid;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ComCtrls, ExtCtrls, cxGridTableView, pFIBDataSet, BaseTypes;

   procedure FillWorkModeDSet(LocDataSet:TpFIBDataSet;
                              DateBegIn, DateEndIn:TDate;
                              LocWorkMode, Id_Man, Id_Post_Moving:Variant;
                              LocShift, LocCntDays:Integer);stdcall;
   function GetNameDayByNumber(LocNumberDay:Integer):String;stdcall;
   function GetWorkModeInfo(LocDataSet:TpFIBDataSet; LocIdWorkMode:Variant):Variant;stdcall;
   function FillWorkModeGrid(LocWorkGrid:TcxGridTableView; LocDataSet:TpFIBDataSet):Boolean;

implementation

uses cxGridCustomTableView;

procedure FillWorkModeDSet(LocDataSet:TpFIBDataSet;
                           DateBegIn, DateEndIn:TDate;
                           LocWorkMode, Id_Man, Id_Post_Moving:Variant;
                           LocShift, LocCntDays:Integer);stdcall;
begin
  try
    If VarIsNull(LocWorkMode) then Exit;
    if ((VarIsNull(Id_Man)) And (VarIsNull(Id_Post_Moving))) then
    begin
       LocDataSet.Close;
       LocDataSet.SQLs.SelectSQL.Clear;
       LocDataSet.SQLs.SelectSQL.Text:='select first('+IntToStr(LocCntDays)+') *'+
                                       '  from tu_work_mode_s_by_period(:date_beg, :date_end, :id_work_mode, :shift, 0, null, null)';
       LocDataSet.ParamByName('date_beg').AsDate:=DateBegIn;
       LocDataSet.ParamByName('date_end').AsDate:=DateEndIn;
       LocDataSet.ParamByName('id_work_mode').AsInteger:=LocWorkMode;
       LocDataSet.ParamByName('shift').AsInteger:=LocShift;
       LocDataSet.Open;
    end
    else
    begin
       LocDataSet.Close;
       LocDataSet.SQLs.SelectSQL.Clear;
       LocDataSet.SQLs.SelectSQL.Text:='select first('+IntToStr(LocCntDays)+') *'+
                                       '  from tu_work_mode_s_by_period(:date_beg, :date_end, :id_work_mode, :shift, 1, :Id_Man, :Id_Post_Moving)';
       LocDataSet.ParamByName('date_beg').AsDate:=DateBegIn;
       LocDataSet.ParamByName('date_end').AsDate:=DateEndIn;
       LocDataSet.ParamByName('id_work_mode').AsInteger:=LocWorkMode;
       LocDataSet.ParamByName('shift').AsInteger:=LocShift;
       LocDataSet.ParamByName('Id_Man').AsInteger:=Id_Man;
       LocDataSet.ParamByName('Id_Post_Moving').AsInteger:=Id_Post_Moving;
       LocDataSet.Open;
    end;
  except on e:Exception
         do agMessageDlg('Увага', e.Message, mtInformation, [mbOK]);
  end;

end;

function FillWorkModeGrid(LocWorkGrid:TcxGridTableView; LocDataSet:TpFIBDataSet):Boolean;
var i, j, CntItems:Integer;
    DateStr, HoursStr:String;
begin
  if not LocDataSet.isEmpty then
  begin
    try
      LocDataSet.FetchAll;
      CntItems:=LocDataSet.RecordCount;
      with LocWorkGrid do
      begin
         DataController.BeginUpdate;
         If DataController.RecordCount=0 then
         begin
            DataController.InsertRecord(0);
            DataController.InsertRecord(1);
         end;
         for i:=0 to ColumnCount-1 do
         begin
            Columns[i].Caption:='';
            for j:=0 to DataController.RecordCount-1 do
                DataController.Values[j, i]:='';
         end;
         LocDataSet.First;
         for i:=0 to CntItems-1 do
         begin
            If VarIsNull(LocDataSet['Date_Loc']) then  DateStr:=''
            Else DateStr :=DateToStr(LocDataSet['Date_Loc']);
            If VarIsNull(LocDataSet['HOURS_MIN']) then HoursStr:=''
            Else HoursStr:=LocDataSet['HOURS_MIN'];
            DataController.Values[0, 0]:='Дата';
            DataController.Values[1, 0]:='Години';
            DataController.Values[0, i+1]:=DateStr;
            DataController.Values[1, i+1]:=HoursStr;
            Columns[i+1].Caption:=GetNameDayByNumber(LocDataSet['DAY_WEEK']);
            DateStr:='';
            HoursStr:='';
            LocDataSet.Next;
         end;
         DataController.EndUpdate;
         Result:=True;
      end;
    except on e:Exception
           do begin
                 agMessageDlg('Увага', e.Message, mtInformation, [mbOK]);
                 Result:=False;
           end;
    end;
  end;
end;

function GetNameDayByNumber(LocNumberDay:Integer):String;
begin
    case LocNumberDay of
        1: Result:='Пн';
        2: Result:='Вт';
        3: Result:='Ср';
        4: Result:='Чт';
        5: Result:='Пт';
        6: Result:='Сб';
        7: Result:='Вс';
    end;
end;


function GetWorkModeInfo(LocDataSet:TpFIBDataSet; LocIdWorkMode:Variant):Variant;stdcall;
begin
   Result:=VarArrayCreate([0,2], varVariant);
   LocDataSet.Close;
   LocDataSet.SQLs.SelectSQL.Text:='select name '+
                                   '  from dt_work_mode  '+
                                   ' where id_work_mode=:id_work_mode';
   LocDataSet.ParamByName('id_work_mode').Value:=LocIdWorkMode;
   LocDataSet.Open;
   If not LocDataSet.IsEmpty then
   begin
      If VarIsNull(LocDataSet['Name']) then Result[0]:=''
      Else Result[0]:=LocDataSet['Name'];
   end;

   LocDataSet.Close;
   LocDataSet.SQLs.SelectSQL.Text:='select max(id_day_week) '+
                                   '  from dt_workreg  '+
                                   ' where id_work_mode=:id_work_mode';
   LocDataSet.ParamByName('id_work_mode').Value:=LocIdWorkMode;
   LocDataSet.Open;
   If not LocDataSet.IsEmpty then
   begin
      If VarIsNull(LocDataSet['Max']) then Result[1]:=0
      Else Result[1]:=LocDataSet['Max'];
   end;
end;

end.
