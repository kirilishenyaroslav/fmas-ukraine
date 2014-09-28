unit SpWorkModeEditDays_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxMaskEdit, cxTextEdit, cxSpinEdit,
  cxTimeEdit, cxControls, cxContainer, cxEdit, cxLabel, ActnList, StdCtrls,
  cxButtons, ExtCtrls,TuCommonTypes,TuMessages,TuCommonProc,SpWorkModeEditDays_DM,
  cxCheckBox;

type TTuModeDay = class(TObject)
 public
  Owner:TComponent;
  CFStyle:TTuControlFormStyle;
  Id_Work_Mode   :Integer;
  Id_Day_Week   :Integer;
  Work_Beg      :TTime;
  Work_End      :TTime;
  Break_Beg     :TTime;
  Break_End     :TTime;
  Today_Hours   :Extended;
  Tomorrow_Hours:Extended;
 end;

type
  TFormDayEdit = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ButtonOK: TcxButton;
    ButtonCancel: TcxButton;
    ActionList: TActionList;
    ActionYes: TAction;
    ActionCancel: TAction;
    Label5: TcxLabel;
    Label4: TcxLabel;
    Label1: TcxLabel;
    Label2: TcxLabel;
    Label3: TcxLabel;
    EditNumDay: TcxSpinEdit;
    EditWorkBeg: TcxTimeEdit;
    EditWorkEnd: TcxTimeEdit;
    EditBreakBeg: TcxTimeEdit;
    EditBreakEnd: TcxTimeEdit;
    CheckBoxHoliday: TcxCheckBox;
    procedure ButtonOKClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure CheckBoxHolidayPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    Date: TTuModeDay;
    constructor Create(Param:TTuModeDay);reintroduce;
  end;
function View_SpWorkModeEditDays(Param:TTuModeDay):Boolean;


implementation

uses pFIBQuery;

//uses SysInit;

{$R *.dfm}

function View_SpWorkModeEditDays(Param:TTuModeDay):Boolean;
var FormDayEdit :TFormDayEdit;
Tm: TTime;
begin
   Tm:=EncodeTime(0,0,0,0);
  if Param.CFStyle=tcfsDelete then
  begin
    if   TuShowMessage(GetConst('Delete','Error'),GetConst('DeleteText','Error'),
                  mtWarning, [mbYes,mbNo])=6 then
      begin
        DModule.StProc.Transaction.StartTransaction;
        DModule.StProc.StoredProcName:='DT_WORKREG_DELETE';
        DModule.StProc.Prepare;
        DModule.StProc.ParamByName('ID_WORK_MODE').asinteger:=Param.Id_Work_Mode;
        DModule.StProc.ParamByName('ID_DAY_WEEK').asinteger :=Param.Id_Day_Week;
        DModule.StProc.ExecProc;
        DModule.StProc.Transaction.Commit;
        Result:=True;
      end
    else
      result:=False;
    Exit;
  end;

  FormDayEdit:=TFormDayEdit.Create(Param);
  if FormDayEdit.ShowModal=mrYes then
    with DModule.StProc do
    begin
      Transaction.StartTransaction;

      if Param.CFStyle=tcfsInsert then StoredProcName:='DT_WORKREG_INSERT'
      else  StoredProcName:='DT_WORKREG_UPDATE';
      Prepare;
      ParamByName('ID_DAY_WEEK').asinteger    :=FormDayEdit.Date.Id_Day_Week;
      ParamByName('WORK_BEG').AsString          :=TimeToStr( FormDayEdit.Date.Work_Beg);
      ParamByName('WORK_END').AsString          :=TimeToStr(FormDayEdit.Date.Work_End);
      if (FormDayEdit.Date.Break_Beg<>FormDayEdit.Date.Break_End) then
      begin
        ParamByName('BREAK_BEG').AsString         :=TimeToStr(FormDayEdit.Date.Break_Beg);
        ParamByName('BREAK_END').AsString         :=TimeToStr(FormDayEdit.Date.Break_End);
      end
      else
      begin
        ParamByName('BREAK_BEG').AsVariant         :=Null;
        ParamByName('BREAK_END').AsVariant         :=Null;
      end;
      ParamByName('TODAY_HOURS').AsExtended   :=FormDayEdit.Date.Today_Hours;
      ParamByName('TOMORROW_HOURS').AsExtended:=FormDayEdit.Date.Tomorrow_Hours;
      ParamByName('ID_WORK_MODE').Asinteger   :=FormDayEdit.Date.Id_Work_Mode;
      ExecProc;
      Transaction.Commit;
      Result:=True;
    end
  else
    result:=false;
end;



constructor TFormDayEdit.Create(Param:TTuModeDay);
begin
  inherited Create(Param.Owner);
  Date:=TTuModeDay.Create;
  Date:=Param;
  EditNumDay.Value  :=Param.Id_Day_Week;
  if Param.CFStyle=tcfsUpdate then
  begin
    if (Param.Work_Beg=0) and (Param.Work_End=0) then
    begin
      CheckBoxHoliday.Checked:=True;
      CheckBoxHolidayPropertiesChange(self);
    end;
    EditWorkBeg.Time  :=Param.Work_Beg;
    EditWorkEnd.Time  :=Param.Work_End;
    EditBreakBeg.Time :=Param.Break_Beg;
    EditBreakEnd.Time :=Param.Break_End;
  end;
  if Param.CFStyle=tcfsUpdate then
    Caption           :=GetConst('Update','Button')+'['+GetConst('TranscriptWorkMode','Form')+']'
  else
    Caption           :=GetConst('Insert','Button')+'['+GetConst('TranscriptWorkMode','Form')+']';
  Label1.Caption      :=GetConst('Day','GridColumn')+':';
  Label2.Caption      :=GetConst('WorkBeg','GridColumn')+':';
  Label3.Caption      :=GetConst('WorkEnd','GridColumn')+':';
  Label4.Caption      :=GetConst('BreakBeg','GridColumn')+':';
  Label5.Caption      :=GetConst('BreakEnd','GridColumn')+':';
  ButtonOK.Caption    :=GetConst('Yes','Button');
  ButtonCancel.Caption    :=GetConst('Cancel','Button');
  CheckBoxHoliday.Properties.Caption:=GetConst('Holiday','CheckBox');

  end;

procedure TFormDayEdit.ButtonOKClick(Sender: TObject);
var //Tm:string;
    WorkHourBeg,WorkHourEnd, WorkMntBeg,WorkMntEnd, Sek,
    BreakHourBeg,BreakHourEnd, BreakMntBeg,BreakMntEnd, MSek:Word;
    Tm:TTime;
    WorkTime,TomorrowTime:Extended;
begin
  if (EditNumDay.Text=null)or
     (EditWorkBeg.Text=null)or
     (EditWorkEnd.Text=null)or
     (EditBreakBeg.Text=null)or
     (EditBreakEnd.Text=null) then
  begin
     TuShowMessage(GetConst('Delete','Error'),GetConst('DeleteText','Error'),
                  mtWarning, [mbOK]);
   Exit;
  end ;

  Date.Id_Day_Week :=EditNumDay.Value;

  if CheckBoxHoliday.Checked then
  begin
    Date.Work_Beg    :=0;
    Date.Work_End    :=0;
    Date.Break_Beg   :=0;
    Date.Break_End   :=0;
  end
  else
  begin
    Date.Work_Beg    :=EditWorkBeg.Time;
    Date.Work_End    :=EditWorkEnd.Time;
    Date.Break_Beg   :=EditBreakBeg.Time;
    Date.Break_End   :=EditBreakEnd.Time;
  end;






//Из времени считаем количество рабочих часов до и после  24часов///////////////
  DecodeTime(Date.Work_Beg, WorkHourBeg,  WorkMntBeg, Sek,MSek);
  DecodeTime(Date.Work_End, WorkHourEnd,  WorkMntEnd, Sek,MSek);
  DecodeTime(Date.Break_Beg,BreakHourBeg, BreakMntBeg,Sek,MSek);
  DecodeTime(Date.Break_End,BreakHourEnd, BreakMntEnd,Sek,MSek);
  if Date.Work_Beg>Date.Work_End   then
  begin
      WorkTime:= (24-WorkHourBeg)+(60-WorkMntBeg+WorkMntEnd)/60-1;
      TomorrowTime:=WorkHourEnd+WorkMntEnd/60;
      if Date.Break_Beg>Date.Break_End then
      begin
        WorkTime:=WorkTime-(24-BreakHourBeg+(60-BreakMntBeg)/60-1);
        TomorrowTime:=TomorrowTime-(BreakHourEnd+BreakMntEnd/60);
      end
      else
        if (Date.Work_Beg<Date.Break_Beg)and(Date.Break_Beg<Date.Break_End) then
          WorkTime:=WorkTime-(BreakHourEnd-BreakHourBeg+(BreakMntEnd-BreakMntBeg)/60);
        if (Date.Work_End>Date.Break_End)and(Date.Break_End>Date.Break_Beg) then
          TomorrowTime:=TomorrowTime-(BreakHourEnd-BreakHourBeg+(BreakMntEnd-BreakMntBeg)/60);
  end
  else
  begin
    WorkTime:=(WorkHourEnd-WorkHourBeg)+(60-WorkMntBeg+WorkMntEnd)/60;
    WorkTime:=WorkTime-((BreakHourEnd-BreakHourBeg)+(60-BreakMntBeg+BreakMntEnd)/60);
    TomorrowTime:=0;
  end;
////////////////////////////////////////////////////////////////////////////////
  Date.Today_Hours:=WorkTime;
  Date.Tomorrow_Hours:=TomorrowTime;
    ModalResult:=mrYes;
end;

procedure TFormDayEdit.ButtonCancelClick(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TFormDayEdit.CheckBoxHolidayPropertiesChange(Sender: TObject);
begin
If CheckBoxHoliday.Checked then
begin
  EditWorkBeg.Enabled:=False;
  EditWorkEnd.Enabled:=False;
  EditBreakBeg.Enabled:=False;
  EditBreakEnd.Enabled:=False;
end
else
begin
  EditWorkBeg.Enabled:=true;
  EditWorkEnd.Enabled:=true;
  EditBreakBeg.Enabled:=true;
  EditBreakEnd.Enabled:=true;
end
end;

end.
