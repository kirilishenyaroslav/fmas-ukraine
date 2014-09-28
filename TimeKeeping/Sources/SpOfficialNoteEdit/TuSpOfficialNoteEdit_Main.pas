unit TuSpOfficialNoteEdit_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxSpinEdit, cxTimeEdit, cxLabel,
  cxDropDownEdit, cxCalendar, cxCheckBox, cxMaskEdit, cxButtonEdit,
  cxContainer, cxEdit, cxTextEdit, cxControls, cxGroupBox, StdCtrls,
  cxButtons, ActnList, ExtCtrls,TuCommonLoader,TuMessages,dates,TuCommontypes,
  gr_uCommonLoader, Grids, cxMemo;

type
  TFormSpOfficialNoteEdit = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ActionList: TActionList;
    ButtonYes: TcxButton;
    ButtonCancel: TcxButton;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox4: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    EditMan: TcxButtonEdit;
    CheckBoxMan: TcxCheckBox;
    cxGroupBox3: TcxGroupBox;
    EditDog: TcxButtonEdit;
    CheckBoxDog: TcxCheckBox;
    ActionYES: TAction;
    ActionNo: TAction;
    ButtonDelete: TcxButton;
    ActionDelete: TAction;
    EditManOrDogInfo: TcxMemo;
    cxGroupBox8: TcxGroupBox;
    EditDataBeg: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    EditDataEnd: TcxDateEdit;
    cxLabel3: TcxLabel;
    cxGroupBox5: TcxGroupBox;
    cxGroupBox6: TcxGroupBox;
    CheckBoxWorkMode: TcxCheckBox;
    EditWorkModeShift: TcxSpinEdit;
    cxLabel8: TcxLabel;
    EditWorkMode: TcxButtonEdit;
    GridWorkMode: TStringGrid;
    cxGroupBox7: TcxGroupBox;
    CheckBoxNoWorkMode: TcxCheckBox;
    EditWorkBeg: TcxTimeEdit;
    EditWorkEnd: TcxTimeEdit;
    cxLabel4: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    EditBreakBeg: TcxTimeEdit;
    EditBreakEnd: TcxTimeEdit;
    cxLabel5: TcxLabel;
    EditVihod: TcxButtonEdit;
    EditNote: TcxMemo;
    LabelNum: TcxLabel;
    EditWM: TcxMemo;
    cxLabel9: TcxLabel;
    EditDate: TcxDateEdit;
    EditNum: TcxMaskEdit;
    LabelHours: TcxLabel;
    procedure Action1Execute(Sender: TObject);
    procedure ActionNoExecute(Sender: TObject);
    procedure EditWorkModePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure CheckBoxWorkModePropertiesChange(Sender: TObject);
    procedure EditDogPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure CheckBoxDogPropertiesChange(Sender: TObject);
    procedure CheckBoxDogClick(Sender: TObject);
    procedure CheckBoxManClick(Sender: TObject);
    procedure EditVihodPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure CheckBoxWorkModeClick(Sender: TObject);
    procedure CheckBoxNoWorkModeClick(Sender: TObject);
    procedure EditManPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ActionDeleteExecute(Sender: TObject);
    procedure GridWorkModeDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure EditDataBegPropertiesChange(Sender: TObject);
    procedure GridWorkModeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridWorkModeSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure EditWorkModeShiftPropertiesChange(Sender: TObject);
    procedure EditWorkBegPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
   Param: TTuSpOfficialNoteEditParam;
  ISActWorkModeFalse:Boolean;
   procedure MakeGridDays(ISActWorkMode:Boolean;IS_MaxValue:Boolean);
   constructor create (Aparam:TTuSpOfficialNoteEditParam); reintroduce;
  end;



implementation

uses TuSpOfficialNoteEdit_DM, FIBQuery;

{$R *.dfm}

{ TFormSpOfficialNoteEdit }

constructor TFormSpOfficialNoteEdit.create(
  Aparam: TTuSpOfficialNoteEditParam);
begin





 inherited create (Aparam.Owner);
 Param:=Aparam;
  ISActWorkModeFalse:=true;
 case Param.CFStyle of
   tfsOnU:
     begin
       CheckBoxDog.Enabled:=false;
       EditDog.Enabled:=false;
       CheckBoxMan.Enabled:=false;
       EditMan.Enabled:=false;
     //  EditManCaption.Enabled:=false;
       EditDataBeg.Enabled:=false;
       EditDataEnd.Enabled:=false;
       EditWorkMode.Enabled:=false;
       EditWM.Enabled:=false;
       CheckBoxWorkMode.Enabled:=false;
       EditVihod.Enabled:=false;
       EditWorkModeShift.Enabled:=false;
       CheckBoxNoWorkMode.Enabled:=false;
       EditWorkBeg.Enabled:=false;
       EditWorkEnd.Enabled:=false;
       EditBreakBeg.Enabled:=false;
       EditBreakEnd.Enabled:=false;
       EditNote.Text:=Param.Note;
       EditNum.Text:=inttostr(Param.Num);
       EditDate.Date:=Param.datedoc;
       LabelHours.Visible:=false;
     end;
   tfsOnI:
     begin
       EditDataBeg.Date:=Param.DateBeg;
       EditDataEnd.Date:=Param.DateBeg;
       Dm.StProc.Transaction.StartTransaction;

       Dm.StProc.StoredProcName:='TU_OFFICIAL_NOTE_GEN_CORRECT';
       Dm.StProc.prepare;
       DM.StProc.ExecProc;
       EditNum.Text:= Dm.StProc.ParamByName('ID_GEN').asstring;
       Param.IdOfficialNote:= Dm.StProc.ParamByName('ID_GEN').AsInteger;
       DM.StProc.Transaction.Commit;
        Editdate.Date:=EditDataBeg.Date;
     end;
   tfsOnFromTshI:
     begin
       EditDataBeg.Date:=Aparam.DateBeg;
       EditDataEnd.Date:=Aparam.DateBeg;
       EditDog.Text:=Param.FIO;
       EditMan.Text:=Param.FIO;
       EditVihod.Text:=Param.VihodName;
       EditNote.Text:=Param.Note;
         if Param.IsWork='T' then
    begin
      CheckBoxNoWorkMode.Enabled:=true;
      CheckBoxWorkMode.Enabled:=true;
      EditWorkMode.Enabled:=CheckBoxWorkMode.Checked;
      EditWM.Enabled:=CheckBoxWorkMode.Checked;
      EditWorkModeShift.Enabled:=CheckBoxWorkMode.Checked;
      GridWorkMode.Enabled:=CheckBoxWorkMode.Checked;
      EditWorkBeg.Enabled:=CheckBoxNoWorkMode.Checked;
      EditWorkEnd.Enabled:=CheckBoxNoWorkMode.Checked;
      EditBreakBeg.Enabled:=CheckBoxNoWorkMode.Checked;
      LabelHours.Visible:=CheckBoxNoWorkMode.Checked;
      EditBreakEnd.Enabled:=CheckBoxNoWorkMode.Checked;
      if  not  (CheckBoxWorkMode.Checked or  CheckBoxNoWorkMode.Checked) then
       CheckBoxWorkMode.Checked:=true;
    end
    else
    begin
      CheckBoxNoWorkMode.Enabled:=false;
      CheckBoxWorkMode.Enabled:=false;
      EditWorkMode.Enabled:=false;
      EditWM.Enabled:=false;
      EditWorkModeShift.Enabled:=false;
       GridWorkMode.Enabled:=false;
      EditWorkBeg.Enabled:=false;
      EditWorkEnd.Enabled:=false;
      EditBreakBeg.Enabled:=false;
      LabelHours.Visible:=false;
      EditBreakEnd.Enabled:=false;

    end;

       Dm.StProc.Transaction.StartTransaction;
       Dm.StProc.StoredProcName:='TU_OFFICIAL_NOTE_GEN_CORRECT';
       Dm.StProc.prepare;
       DM.StProc.ExecProc;
       EditNum.text:=Dm.StProc.ParamByName('ID_GEN').asstring;
       Param.IdOfficialNote:= Dm.StProc.ParamByName('ID_GEN').AsInteger;
       DM.StProc.Transaction.Commit;

        Editdate.Date:=EditDataBeg.Date;
     end;
   tfsOnTransI:
     begin
       EditDataBeg.Date:=Param.DateBeg;
       EditDataEnd.Date:=Param.DateBeg;
       EditNote.Text:=Param.Note;
       EditNote.Enabled:=false;
       EditNum.Enabled:=false;
       EditDate.Enabled:=false;
       EditNum.text:=inttostr(Param.Num);
        EditDate.Date:=Param.datedoc;
     end;
   tfsOnTransU, tfsOnTshE:
    with dm do
    begin
       if Param.CFStyle =tfsOnTransU then
       begin
         EditNote.Enabled:=false;
         EditNum.Enabled:=false;
         EditDate.Enabled:=false;
       end  ;
       DSet1.close;

       DSet1.SelectSQL.text:='select  * from    TU_OFFICIAL_NOTE_TRANS_S_BY_ID('+
              inttostr(Param.IdOfficialNoteTrans)+')';
       DSet1.Open;
       Param.IdVihod:=Dset1['ID_VIHOD'];
       Param.IdMan:=Dset1['ID_MAN'];
       Param.Rmoving:=Dset1['RMOVING'];
       Param.IdPostMoving:=Dset1['ID_POST_MOVING'];
       Param.IdWorkMode:=Dset1['ID_WORK_MODE'];
       EditNote.text:=Param.Note;
       EditVihod.text:=Dset1['VIHOD_NAME'];
       EditMan.text:=Dset1['FIO'];
       EditNum.text:=inttostr(Param.Num);
        EditDate.Date:=Param.datedoc;
       if Dset1['RMOVING']=null then
          CheckBoxMan.Checked:=true
       else
       begin
          CheckBoxDog.Checked:=true;
          EditDog.Text:=Dset1['FIO'];
       end;
       EditDataBeg.Date:=Dset1['DATE_BEG'];
       EditDataEnd.Date:=Dset1['DATE_END'];
       if Dset1['IS_WORK']='T' then
       if  Dset1['ID_WORK_MODE']=null  then
       begin
         CheckBoxNoWorkMode.Enabled:=True;
         CheckBoxWorkMode.Enabled:=True;
         CheckBoxNoWorkMode.Checked:=true;
         EditWorkBeg.Time:=Dset1['WORK_BEG'];
         EditWorkEnd.Time:=Dset1['WORK_END'];
         EditBreakBeg.Time:=Dset1['BREAK_BEG'];
         EditBreakEnd.Time:=Dset1['BREAK_END'];
       end
       else
       begin
         CheckBoxNoWorkMode.Enabled:=True;
         CheckBoxWorkMode.Enabled:=True;
         CheckBoxWorkMode.Checked:=true;
         EditWM.text:= Dset1['WM_NAME'];
       end
     end;
 end;

end;


procedure TFormSpOfficialNoteEdit.Action1Execute(Sender: TObject);
begin
if (VarIsEmpty(Param.IdVihod)) or
   ((VarIsEmpty(Param.IdMan)) and (VarIsEmpty(Param.Rmoving)) and (VarIsEmpty(Param.IdPostMoving)))or
   (EditDataBeg.date>EditDataEnd.date)or
   (EditNum.Text ='')
then
  TuShowMessage('Увага', 'Помилка у введенні даних?', mtInformation, [mbOK])
else
begin
  Param.CFStyle:=tfsOnTransU;
  ModalResult:=mrYes;
end;
end;

procedure TFormSpOfficialNoteEdit.ActionNoExecute(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TFormSpOfficialNoteEdit.EditWorkModePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Parameter:TTuSimpleParam;
    res:variant;
begin
  Parameter := TTuSimpleParam.Create;
  Parameter.DB_Handle := DM.DB.Handle;
  Parameter.Owner := self;
  Parameter.CFStyle:=tfsModal;
  res:=DoFunctionFromPackage(Parameter,Tu_SpWorkMode_Pack);
  if VarIsArray(res)then
  begin
     Param.IdWorkMode:=res[0];
     EditWM.Text:=res[1];
     MakeGridDays(false,true) ;
     EditWorkModeShift.value:=0;

  end;
  Parameter.Destroy;
end;

procedure TFormSpOfficialNoteEdit.CheckBoxWorkModePropertiesChange(
  Sender: TObject);
begin
if   CheckBoxWorkMode.Enabled then
begin
  EditWorkMode.Enabled:=CheckBoxWorkMode.Checked;
  EditWM.Enabled:=CheckBoxWorkMode.Checked;
  EditWorkModeShift.Enabled:=CheckBoxWorkMode.Checked;
  GridWorkMode.Enabled:=CheckBoxWorkMode.Checked;
end;
if  CheckBoxNoWorkMode.Enabled then
begin
  EditWorkBeg.Enabled:=CheckBoxNoWorkMode.Checked;
  EditWorkEnd.Enabled:=CheckBoxNoWorkMode.Checked;
  EditBreakBeg.Enabled:=CheckBoxNoWorkMode.Checked;
  EditBreakEnd.Enabled:=CheckBoxNoWorkMode.Checked;
  LabelHours.Visible:=CheckBoxNoWorkMode.Checked;
end
end;

procedure TFormSpOfficialNoteEdit.EditDogPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var     res:variant;
    YearAct,    MonthAct, i :word;
begin
  DecodeDate(Param.DateBeg,YearAct,MonthAct,i);
  Res:=LoadTuSpDog(self,dm.db.Handle, Param.KodSetup , Null);
  if res[0]<>null then
  begin
    EditDog.Text:=Res[2];
    Param.Rmoving:=Res[0];
    Param.IdPostMoving:=Res[1];
    Param.IdMan:=null;
    EditDataBeg.Properties.MinDate:=Res[4];
    EditDataBeg.Properties.MaxDate:=Res[5];
    EditDataEnd.Properties.MinDate:=Res[4];
    EditDataEnd.Properties.MaxDate:=Res[5];
    ISActWorkModeFalse:=true;
    MakeGridDays(ISActWorkModeFalse,true);
     ISActWorkModeFalse:=false;
  end

end;

procedure TFormSpOfficialNoteEdit.CheckBoxDogPropertiesChange(
  Sender: TObject);
begin
 EditDog.Enabled:=CheckBoxDog.Checked;
// EditManCaption.Enabled:=CheckBoxMan.Checked;
 EditMan.Enabled:=CheckBoxMan.Checked;
end;

procedure TFormSpOfficialNoteEdit.CheckBoxDogClick(Sender: TObject);
begin
CheckBoxMan.Checked :=not CheckBoxDog.Checked;
end;

procedure TFormSpOfficialNoteEdit.CheckBoxManClick(Sender: TObject);
begin
CheckBoxDog.Checked:= not CheckBoxMan.Checked;
end;

procedure TFormSpOfficialNoteEdit.EditVihodPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Parameter:TTuSimpleParam;
    res:variant;
begin
   Parameter := TTuSimpleParam.Create;
  Parameter.DB_Handle := DM.DB.Handle;
  Parameter.Owner := self;
  Parameter.CFStyle:=tfsModal;
  res:=DoFunctionFromPackage(Parameter,Tu_SpTypeWork_Pack);
  if VarIsArray(res) then
  begin
    if res[2]='T' then
    begin
      CheckBoxNoWorkMode.Enabled:=true;
      CheckBoxWorkMode.Enabled:=true;
      EditWorkMode.Enabled:=CheckBoxWorkMode.Checked;
      EditWM.Enabled:=CheckBoxWorkMode.Checked;
      EditWorkModeShift.Enabled:=CheckBoxWorkMode.Checked;
      GridWorkMode.Enabled:=CheckBoxWorkMode.Checked;
      EditWorkBeg.Enabled:=CheckBoxNoWorkMode.Checked;
      EditWorkEnd.Enabled:=CheckBoxNoWorkMode.Checked;
      EditBreakBeg.Enabled:=CheckBoxNoWorkMode.Checked;
      LabelHours.Visible:=CheckBoxNoWorkMode.Checked;
      EditBreakEnd.Enabled:=CheckBoxNoWorkMode.Checked;
      if  not  (CheckBoxWorkMode.Checked or  CheckBoxNoWorkMode.Checked) then
       CheckBoxWorkMode.Checked:=true;
    end
    else
    begin
      CheckBoxNoWorkMode.Enabled:=false;
      CheckBoxWorkMode.Enabled:=false;
      EditWorkMode.Enabled:=false;
      EditWM.Enabled:=false;
      EditWorkModeShift.Enabled:=false;
       GridWorkMode.Enabled:=false;
      EditWorkBeg.Enabled:=false;
      EditWorkEnd.Enabled:=false;
      EditBreakBeg.Enabled:=false;
      EditBreakEnd.Enabled:=false;
      LabelHours.Visible:=false;

    end;
    Param.IdVihod:=res[0];
    EditVihod.text:=res[1];
  end;
  Parameter.Destroy;

end;

procedure TFormSpOfficialNoteEdit.CheckBoxWorkModeClick(Sender: TObject);
begin
CheckBoxNoWorkMode.Checked:=not CheckBoxWorkMode.Checked;
end;

procedure TFormSpOfficialNoteEdit.CheckBoxNoWorkModeClick(Sender: TObject);
begin
CheckBoxWorkMode.Checked:=not CheckBoxNoWorkMode.Checked;
end;

procedure TFormSpOfficialNoteEdit.EditManPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Res:Variant;
begin
Res:=ShowSpPeople(self, Dm.DB.handle);
  if VarIsArray(Res) then
  begin
    EditMan.Text:=Res[1]+' '+Res[2]+' '+Res[3];
    Param.idman:=Res[0];
  end
end;

procedure TFormSpOfficialNoteEdit.ActionDeleteExecute(Sender: TObject);
begin
Param.CFStyle:=tfsOnTransD;
ModalResult:=mrYes;
end;

procedure TFormSpOfficialNoteEdit.MakeGridDays(ISActWorkMode:Boolean; IS_MaxValue:Boolean);
var j,k:word;
    T:string;
begin
  j := DayOfWeek(EditDataBeg.date);
  dec(j);
  if j = 0 then j := 7;
  for k:=0 to 6 do
  begin
   case j of
    1:   GridWorkMode.Cells[k, 0] := 'пн';
    2:   GridWorkMode.Cells[k, 0] := 'вт';
    3:   GridWorkMode.Cells[k, 0] := 'ср';
    4:   GridWorkMode.Cells[k, 0] := 'чт';
    5:   GridWorkMode.Cells[k, 0] := 'пт';
    6:   GridWorkMode.Cells[k, 0] := 'сб';
    7:   GridWorkMode.Cells[k, 0] := 'нд';
   end;
   j:=j+1;
   if j=8 then j:=1;
  end;

  DM.DSetWorkMode.Close;
  if ISActWorkMode then
    DM.DSetWorkMode.selectsql.Text:='select * from TU_WORK_MODE_S_BY_PERIOD('''
                                               +datetostr(EditDataBeg.date)+''','''
                                               +datetostr(EditDataBeg.date+6)+''','
                                               +VarToStrDef(Param.Rmoving,'null')+','
                                               +'null'+','
                                               +'1'+','
                                               +VarToStrDef(Param.IdMan,'null')+','
                                               +VarToStrDef(Param.IdPostMoving,'null')
                                               +')'
  else
    DM.DSetWorkMode.selectsql.Text:='select * from TU_WORK_MODE_S_BY_PERIOD('''
                                               +datetostr(EditDataBeg.date)+''','''
                                               +datetostr(EditDataBeg.date+6)+''','
                                               +inttostr(Param.IdWorkMode)+','
                                               +EditWorkModeShift.Text+','
                                               +'0'+','
                                               +'null'+','
                                               +'null'+')';

  DM.DSetWorkMode.open;
  if IS_MaxValue then
  with  DM.StProc  do
  begin
    Transaction.StartTransaction;
    StoredProcName:='TU_WORK_MODE_COUNT_BY_KEY';
    Prepare;
    ParamByName('ID_WORK_MODE').AsInteger:=DM.DSetWorkMode['ID_WORK_MODE'];
    ExecProc;
    EditWorkModeShift.Properties.MaxValue:=ParamByName('COUNT_DAY').AsInteger-1;
    if  EditWorkModeShift.Properties.MaxValue=0 then  EditWorkModeShift.Properties.MaxValue:=1;
      if EditWorkModeShift.Properties.MaxValue<EditWorkModeShift.value then  EditWorkModeShift.value:=0;
    DM.StProc.Transaction.commit;
  end ;
  DM.DSetWorkMode.Locate('NUM_DAY',1,[]);
  Param.IdWorkMode:=DM.DSetWorkMode['ID_WORK_MODE'];
  EditWM.Text:=DM.DSetWorkMode['NAME_WORK_MODE'];
  EditWorkModeShift.Value:=DM.DSetWorkMode['SHIFT'];
  if DM.DSetWorkMode['WB']<>null then  EditWorkBeg.Time:=DM.DSetWorkMode['WB'] else EditWorkBeg.Time:=0;
  if DM.DSetWorkMode['We']<>null then EditWorkEnd.Time:=DM.DSetWorkMode['We']else EditWorkEnd.Time:=0;
  if DM.DSetWorkMode['bb']<>null then EditBreakBeg.Time:=DM.DSetWorkMode['bb']else EditBreakBeg.Time:=0;
  if DM.DSetWorkMode['be']<>null then EditBreakEnd.Time:=DM.DSetWorkMode['be']else EditBreakEnd.Time:=0;
  for k:=0 to 6 do
  begin
    T:=datetostr(EditDataBeg.date+k);
    Delete (T, 3, 10);
    GridWorkMode.Cells[k, 1]:=T;
  end

end;

procedure TFormSpOfficialNoteEdit.GridWorkModeDrawCell(Sender: TObject;
  ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
  var T:integer;
begin
  if (ARow=1) and DM.DSetWorkMode.active then
  begin
    GridWorkMode.canvas.Font.color:=clGreen;
    DM.DSetWorkMode.Locate('NUM_DAY',ACol+1,[]);
     GridWorkMode.canvas.MoveTo(Rect.TopLeft.x,Rect.BottomRight.y);
     GridWorkMode.canvas.LineTo(Rect.BottomRight.x, Rect.TopLeft.y);
     GridWorkMode.canvas.TextOut( Rect.TopLeft.X+26, Rect.BottomRight.y-16,DM.DSetWorkMode['HOURS_MIN']);
  end;
end;

procedure TFormSpOfficialNoteEdit.EditDataBegPropertiesChange(
  Sender: TObject);
begin

if not  VarIsEmpty(Param.Rmoving) then  MakeGridDays(ISActWorkModeFalse,true) ;
ISActWorkModeFalse:=False;
end;

procedure TFormSpOfficialNoteEdit.GridWorkModeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 // if (key=VK_Right)  or  (key=VK_Left)   then
 // begin

//  end
end;

procedure TFormSpOfficialNoteEdit.GridWorkModeSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
begin
  // Col:=ACol;
end;

procedure TFormSpOfficialNoteEdit.EditWorkModeShiftPropertiesChange(
  Sender: TObject);
begin
if not  VarIsEmpty(Param.Rmoving) then  MakeGridDays(false, false)
end;

procedure TFormSpOfficialNoteEdit.EditWorkBegPropertiesChange(
  Sender: TObject);
begin
  with  DM.StProc  do
  begin
    Transaction.StartTransaction;
    StoredProcName:='TIME_PERIOD_TO_HOURS';
    Prepare;
    ParamByName('NIGHT_BEG').Astime:=StrToTime('00:00:00');
    ParamByName('NIGHT_END').Astime:=StrToTime('00:00:00');
    ParamByName('work_beg').Astime:=EditWorkBeg.Time;
    ParamByName('work_end').Astime:=EditWorkEnd.Time;
    ParamByName('break_beg').Astime:=EditBreakBeg.Time;
    ParamByName('break_end').Astime:=EditBreakEnd.Time;
    ExecProc;
    LabelHours.Caption:=floattostr( ParamByName('Hours_Min').AsFloat)+'години';
    DM.StProc.Transaction.commit;
  end ;
end;

end.
