unit TuSpOfficialNoteEdit_Loader;

interface

uses SysUtils, Classes,Controls,Variants, TuSpOfficialNoteEdit_Main,   TuSpOfficialNoteEdit_DM,
TuCommonLoader,TuMessages,Dialogs,AccMGMT,Windows;
function View_TuSpOfficialNoteEdit(AParameter:TObject):Variant; stdcall;
 exports View_TuSpOfficialNoteEdit;

implementation

uses cxEdit;

function View_TuSpOfficialNoteEdit(AParameter:TObject):Variant;stdcall;
var
  Form: TFormSpOfficialNoteEdit;
  Res,ID_official_note:Variant;
  ParamLoc:TTuSpOfficialNoteEditParam;
  CFStyleLoc:TtuFormStyleOfficialNoteEdit;
begin
  Result:=mrCancel;
  ParamLoc:=TTuSpOfficialNoteEditParam(AParameter);
    if (((fibCheckPermission('/ROOT/TimeKeeping/TU_MainMenu/TU_Work/TU_OfficialNote','Del')<>0)
        and (fibCheckPermission('/ROOT/TimeKeeping/TU_MainMenu/TU_Work','Del')<>0))
        and ((ParamLoc.CFStyle=tfsOnTransD) or(ParamLoc.CFStyle=tfsOnD)))
      or (((fibCheckPermission('/ROOT/TimeKeeping/TU_MainMenu/TU_Work/TU_OfficialNote','Add')<>0)
        and (fibCheckPermission('/ROOT/TimeKeeping/TU_MainMenu/TU_Work','Add')<>0))
        and ((ParamLoc.CFStyle=tfsOnI) or(ParamLoc.CFStyle=tfsOnFromTshI) or (ParamLoc.CFStyle=tfsOnTransI)))
      or(((fibCheckPermission('/ROOT/TimeKeeping/TU_MainMenu/TU_Work/TU_OfficialNote','Edit')<>0)
        and (fibCheckPermission('/ROOT/TimeKeeping/TU_MainMenu/TU_Work','Edit')<>0))
        and ((ParamLoc.CFStyle=tfsOnU) or(ParamLoc.CFStyle=tfsOnTransU)or (ParamLoc.CFStyle=tfsOnTshE)))  then
    begin //yes
      MessageBox(null, 'Ви не маєте прав до цієї дії!','Увага!', MB_OK or MB_ICONWARNING);
      result:=null;
      exit
    end ;




  Dm:=TDm.create(ParamLoc.Owner) ;
  DM.DB.Handle:=ParamLoc.DB_Handle;
  Result:=VarArrayCreate([0,2],varInteger) ;




  case ParamLoc.CFStyle of
    tfsOnTransD:
      if TuShowMessage('Увага', 'Ви дійсно бажаєте видалити?', mtInformation, mbOKCancel)=MrOk then
      with DM.StProc do
        begin
          Transaction.StartTransaction;
          StoredProcName:='TU_OFFICIAL_NOTE_TRANS_D';
          Prepare;
          ParamByName('ID').AsInteger:=ParamLoc.IdOfficialNoteTrans;
          ExecProc;
          Transaction.commit;
          Result[2]:=mrYes;
        end;
    tfsOnD:
      if TuShowMessage('Увага', 'Ви дійсно бажаєте видалити?', mtInformation, mbOKCancel)=MrOk then
      with DM.StProc do
        begin
          Transaction.StartTransaction;
          StoredProcName:='TU_OFFICIAL_NOTE_D';
          Prepare;
          ParamByName('ID').AsInteger:=ParamLoc.IdOfficialNote;
          ExecProc;
          Transaction.commit;
          Result[2]:=mrYes;
        end;

    tfsOnU:
      begin
        Form:=TFormSpOfficialNoteEdit.create(ParamLoc);
        if Form.ShowModal=mrYes  then
        with  Form,DM.StProc  do
        begin
          Transaction.StartTransaction;
          StoredProcName:='TU_OFFICIAL_NOTE_U';
          Prepare;
          ParamByName('ID').AsInteger:=ParamLoc.IdOfficialNote;
          ParamByName('NOTE').AsString:=EditNote.text;
          ParamByName('NUM').AsInteger:=EditNum.EditValue;
          ParamByName('DATE_DOC').AsDATE:=EditDate.date;
          ExecProc;
          Transaction.commit;
          Result[2]:=mrYes;
        end
      end;
    tfsOnTransI:
      begin
        Form:=TFormSpOfficialNoteEdit.create(ParamLoc);
        if Form.ShowModal=mrYes  then
        with  Form,DM.StProc  do
        begin
          Transaction.StartTransaction;
          StoredProcName:='TU_OFFICIAL_NOTE_TRANS_I';
          Prepare;
          ParamByName('ID_OFFICIAL_NOTE').AsInteger:=Param.IdOfficialNote;
          if CheckBoxMan.checked then
             ParamByName('ID_MAN').AsInteger:=Param.IdMan
          else
          begin
            ParamByName('RMOVING').AsInteger:=Param.Rmoving;
            ParamByName('ID_POST_MOVING').AsInteger:=Param.IdPostMoving;
          end;
          if CheckBoxWorkMode.checked then
          begin
            ParamByName('ID_WORK_MODE').AsInteger:=Param.IdWorkMode;
            ParamByName('WORK_MODE_SHIFT').AsInteger:=Form.EditWorkModeShift.value;
          end;
          ParamByName('DATE_BEG').AsDate:=Param.DateBeg;
          ParamByName('DATE_END').AsDate:=Param.DateEnd;
          if CheckBoxNoWorkMode.Checked then
          begin
            ParamByName('WORK_BEG').AsTime:=Form.EditWorkBeg.Time;
            ParamByName('WORK_END').AsTime:=Form.EditWorkEnd.Time;
            ParamByName('BREAK_BEG').AsTime:=Form.EditBreakBeg.Time;
            ParamByName('BREAK_END').AsTime:=Form.EditbreakEnd.Time;
          end;
          ParamByName('ID_VIHOD').AsInteger:=Param.IdVihod;
          ExecProc;
          Result[2]:=mrYes;
          Result[1]:=ParamByName('ID').AsInteger;
          Result[0]:=Param.IdOfficialNote;
          Transaction.commit;

        end
      end ;
    tfsOnTransU,tfsOnTshE:
      begin

        Form:=TFormSpOfficialNoteEdit.create(ParamLoc);
        if ParamLoc.CFStyle=tfsOnTshE then
        begin
          Form.ActionDelete.visible:=True;
          Form.ButtonDelete.visible:=True;
          CFStyleLoc:= tfsOnTshE;
        end;
        if Form.ShowModal=mrYes  then

        with  Form,DM.StProc  do
        begin
          if CFStyleLoc=tfsOnTshE then
          begin
            Transaction.StartTransaction;
            StoredProcName:='TU_OFFICIAL_NOTE_U';
            Prepare;
            ParamByName('ID').AsInteger:=Param.IdOfficialNote;
            ParamByName('NOTE').AsString:=EditNote.text;
            ParamByName('NUM').AsInteger:=EditNum.EditValue;
            ParamByName('DATE_DOC').AsDATE:=EditDate.date;
            ExecProc;
            Transaction.commit;
           end ;

          if Form.Param.CFStyle=tfsOnTransD then
          begin
            Transaction.StartTransaction;
            StoredProcName:='TU_OFFICIAL_NOTE_TRANS_D';
            Prepare;
            ParamByName('ID').AsInteger:=Param.IdOfficialNoteTrans;
            ExecProc;
            Transaction.commit;
            Result[2]:=mrYes;
          end
          else
          begin
            Transaction.StartTransaction;
            StoredProcName:='TU_OFFICIAL_NOTE_TRANS_U';
            Prepare;
            ParamByName('ID_OFFICIAL_NOTE_TRANS').AsInteger:=Param.IdOfficialNoteTrans;
            if CheckBoxMan.checked then
               ParamByName('ID_MAN').AsInteger:=Param.IdMan
            else
            begin
              ParamByName('RMOVING').AsInteger:=Param.Rmoving;
              ParamByName('ID_POST_MOVING').AsInteger:=Param.IdPostMoving;
            end;
            if CheckBoxWorkMode.checked then
            begin
              ParamByName('ID_WORK_MODE').AsInteger:=Param.IdWorkMode;
              ParamByName('WORK_MODE_SHIFT').AsInteger:=Form.EditWorkModeShift.value;
            end
            else
            begin
              ParamByName('ID_WORK_MODE').AsVariant:=Null;
              ParamByName('WORK_MODE_SHIFT').AsVariant:=Null;
            end ;
            ParamByName('DATE_BEG').AsDate:=EditDataBeg.date;
            ParamByName('DATE_END').AsDate:=EditDataEnd.date;
            if CheckBoxNoWorkMode.Checked then
            begin
              ParamByName('WORK_BEG').AsTime:=Form.EditWorkBeg.Time;
              ParamByName('WORK_END').AsTime:=Form.EditWorkEnd.Time;
              ParamByName('BREAK_BEG').AsTime:=Form.EditBreakBeg.Time;
              ParamByName('BREAK_END').AsTime:=Form.EditbreakEnd.Time;
            end;
            ParamByName('ID_VIHOD').AsInteger:=Param.IdVihod;
            ExecProc;
            Transaction.commit;
            Result[2]:=mrYes;
          end
        end
      end;
   tfsOnI, tfsOnFromTshI:
      begin
        Form:=TFormSpOfficialNoteEdit.create(ParamLoc);
        if Form.ShowModal=mrYes  then
        with  Form,DM.StProc  do
        begin
          Transaction.StartTransaction;
          StoredProcName:='TU_OFFICIAL_NOTE_I';
          Prepare;
          ParamByName('NOTE').AsString:=Form.EditNote.text;
          ParamByName('ID_OFFICIAL_NOTE').AsInteger:=ParamLoc.IdOfficialNote;
          ParamByName('NUM').AsInteger:=EditNum.EditValue;
          ParamByName('DATE_DOC').AsDATE:=EditDate.date;
          ExecProc;
          ID_official_note:=ParamByName('ID').AsInteger;
          Transaction.commit;
          Transaction.StartTransaction;
          StoredProcName:='TU_OFFICIAL_NOTE_TRANS_I';
          Prepare;
          ParamByName('ID_OFFICIAL_NOTE').AsInteger:=ID_official_note;
          if CheckBoxMan.checked then
             ParamByName('ID_MAN').AsInteger:=ParamLoc.IdMan
          else
          begin
            ParamByName('RMOVING').AsInteger:=ParamLoc.Rmoving;
            ParamByName('ID_POST_MOVING').AsInteger:=ParamLoc.IdPostMoving;
          end;
          if CheckBoxWorkMode.checked then
          begin
            ParamByName('ID_WORK_MODE').AsInteger:=ParamLoc.IdWorkMode;
            ParamByName('WORK_MODE_SHIFT').AsInteger:=Form.EditWorkModeShift.value;
          end;
          ParamByName('DATE_BEG').AsDate:=Form.EditDataBeg.date;
          ParamByName('DATE_END').AsDate:=Form.EditDataEnd.date;
          if CheckBoxNoWorkMode.Checked then
          begin
            ParamByName('WORK_BEG').AsTime:=Form.EditWorkBeg.Time;
            ParamByName('WORK_END').AsTime:=Form.EditWorkEnd.Time;
            ParamByName('BREAK_BEG').AsTime:=Form.EditBreakBeg.Time;
            ParamByName('BREAK_END').AsTime:=Form.EditbreakEnd.Time;
          end;
          ParamByName('ID_VIHOD').AsInteger:=ParamLoc.IdVihod;
          ExecProc;
          Result[2]:=MrYes;
          Result[1]:=ParamByName('ID').AsInteger;
          Result[0]:=ID_official_note;
          Transaction.commit;
        end
      end

    end
end;


end.
