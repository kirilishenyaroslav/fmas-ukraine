unit Gr_Stud_IndexEdit_Loader;

interface

uses Classes, IBase,
     Controls, gr_uCommonLoader,gr_uCommonTypes,gr_uCommonProc,Dates,variants,
     Gr_Stud_IndexEdit_mainForm,gr_uCommonConsts,ZTypes,gr_uMessage,Dialogs;

function View_Stud_IndexEdit(AParameter:TObject):Variant;stdcall;
exports View_Stud_IndexEdit;

implementation

function View_Stud_IndexEdit(AParameter:TObject):Variant;
var  Form:TFormStudIndex_Edit;
begin
if TgrStudIndexParam(AParameter).fs=zcfsDelete then
if grShowMessage(Caption_Delete[IndexLanguage],
                  DeleteRecordQuestion_Text[IndexLanguage],mtConfirmation,[mbYes,mbCancel])=mrYes then
begin
  result:=true;
  Exit;
end
else begin
  result:=False;
  Exit;
end;
Form:=TFormStudIndex_Edit.create(TgrStudIndexParam(AParameter).Owner);
Form.EditYear.Value         := YearMonthFromKodSetup(TgrStudIndexParam(AParameter).KodSetup);
Form.EditMonth.ItemIndex    := YearMonthFromKodSetup(TgrStudIndexParam(AParameter).KodSetup,False)-1;
Form.EditYearBase.Value     := YearMonthFromKodSetup(TgrStudIndexParam(AParameter).BaseKodSetup);
Form.EditMonthBase.ItemIndex:= YearMonthFromKodSetup(TgrStudIndexParam(AParameter).BaseKodSetup,False)-1;

if TgrStudIndexParam(AParameter).fs=zcfsInsert then
  begin
    Form.Caption                 := InsertBtn_Caption[IndexLanguage]+' ['+GrantIndexation_Text[IndexLanguage]+']';
    Form.EditYearBase.Enabled    :=false;
    Form.EditMonthBase.Enabled   :=false;
    form.cxCheckBox2.Checked:=False;
    form.cxCheckBox1.Checked:=False;
    form.cxMaskEdit1.enabled:=False;
    form.EditSumma.enabled:=False;
  end;
if TgrStudIndexParam(AParameter).fs=zcfsUpdate then
begin
  Form.Caption                      := UpdateBtn_Caption[IndexLanguage]+' ['+GrantIndexation_Text[IndexLanguage]+']';
  Form.EditMonth.Enabled:=false;
  Form.EditYear.Enabled:=false;
  if TgrStudIndexParam(AParameter).IS_HAND_EDIT then
    begin
      form.LabelBaseDate.Checked:=True;
      form.EditMonthBase.enabled:=True;
      form.EditYearBase.enabled:=True;
      form.cxCheckBox2.Checked:=False;
      form.cxCheckBox1.Checked:=False;
      form.cxMaskEdit1.enabled:=False;
      form.EditSumma.enabled:=False;
    end;

  if TgrStudIndexParam(AParameter).SUMMA_IND_FIX_BOOL then
    begin
      form.cxCheckBox2.Checked:=True;
      form.cxMaskEdit1.enabled:=True;
      form.cxMaskEdit1.text:= TgrStudIndexParam(AParameter).SUMMA_IND_FIX;
    end
  else
    begin
      form.cxCheckBox2.Checked:=False;
      form.cxMaskEdit1.enabled:=False;
    end;

  if TgrStudIndexParam(AParameter).SUMMA_IND_FACT_BOOL then
    begin
      form.cxCheckBox1.Checked:=True;
      form.EditSumma.enabled:=True;
      form.EditSumma.text:= TgrStudIndexParam(AParameter).SUMMA_IND_FACT;
    end
  else
    begin
      form.cxCheckBox1.Checked:=False;
      form.EditSumma.enabled:=False;
    end
end;

if TgrStudIndexParam(AParameter).fs=zcfsShowDetails then
begin
 Form.Caption                      := DetailBtn_Caption[IndexLanguage]+' ['+GrantIndexation_Text[IndexLanguage]+']';
 Form.EditMonth.Enabled:=false;
 Form.EditYear.Enabled:=false;
  if TgrStudIndexParam(AParameter).IS_HAND_EDIT then
    begin
      form.LabelBaseDate.Checked:=True;
      form.EditMonthBase.enabled:=True;
      form.EditYearBase.enabled:=True;
    end;

  if TgrStudIndexParam(AParameter).SUMMA_IND_FIX_BOOL then
    begin
      form.cxCheckBox2.Checked:=True;
      form.cxMaskEdit1.enabled:=True;
      form.cxMaskEdit1.text:= TgrStudIndexParam(AParameter).SUMMA_IND_FIX;
    end
  else
    begin
      form.cxCheckBox2.Checked:=False;
      form.cxMaskEdit1.enabled:=False;
    end;

  if TgrStudIndexParam(AParameter).SUMMA_IND_FACT_BOOL then
    begin
      form.cxCheckBox1.Checked:=True;
      form.EditSumma.enabled:=True;
      form.EditSumma.text:= TgrStudIndexParam(AParameter).SUMMA_IND_FACT;
    end
  else
    begin
      form.cxCheckBox1.Checked:=False;
      form.EditSumma.enabled:=False;
    end;
 Form.ButtonYes.Visible:=false;

 Form.EditMonth.Properties.ReadOnly:=true;
 Form.EditMonthBase.Properties.ReadOnly:=true;
 Form.EditYear.Properties.ReadOnly:=true;
 Form.EditYearBase.Properties.ReadOnly:=true;
 Form.cxMaskEdit1.Properties.ReadOnly:=true;
 Form.EditSumma.Properties.ReadOnly:=true;
 Form.LabelBaseDate.enabled:=false;
 Form.cxCheckBox2.enabled:=false;
 Form.cxCheckBox1.enabled:=false;

end;

if Form.ShowModal=mrYes then
begin
  TgrStudIndexParam(AParameter).KodSetup    :=PeriodToKodSetup(Form.EditYear.Value,Form.EditMonth.ItemIndex+1);
  TgrStudIndexParam(AParameter).BaseKodSetup:=PeriodToKodSetup(Form.EditYearBase.Value,Form.EditMonthBase.ItemIndex+1);
  TgrStudIndexParam(AParameter).SUMMA_IND_FIX:=Form.cxMaskEdit1.text;
  TgrStudIndexParam(AParameter).SUMMA_IND_FACT:=Form.EditSumma.text;

  TgrStudIndexParam(AParameter).IS_HAND_EDIT:=False;
  TgrStudIndexParam(AParameter).SUMMA_IND_FIX_BOOL:=False;
  TgrStudIndexParam(AParameter).SUMMA_IND_FACT_BOOL:=False;

  if Form.LabelBaseDate.checked then
    TgrStudIndexParam(AParameter).IS_HAND_EDIT:=true;
  if Form.cxCheckBox2.checked then
    TgrStudIndexParam(AParameter).SUMMA_IND_FIX_BOOL:=True;
  if Form.cxCheckBox1.checked then
    TgrStudIndexParam(AParameter).SUMMA_IND_FACT_BOOL:=True;

  result:=1;
end
else
  result:=0;
end;

end.
