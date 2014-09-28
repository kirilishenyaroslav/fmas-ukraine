unit uAdditionalPageFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uAdditionalPageData, uFormControl, uFControl, SpFormUnit,
  uLabeledFControl, uCharControl, ComCtrls, uIntControl, uSpravControl,
  uEnumControl, uDateControl, Buttons, SpCommon, ExtCtrls, uBoolControl,
  uInvisControl, uCommonSp, cxControls, cxContainer, cxEdit, cxLabel,
  cxDropDownEdit, cxMRUEdit, cxMaskEdit, cxCalendar, cxTextEdit, cxCheckBox,
  cxRadioGroup, cxMemo;

type
  TfmPCardAdditionalPage = class(TFrame)
    qFFC_Additional: TqFFormControl;
    Panel1: TPanel;
    SB_AdditionalApply: TSpeedButton;
    SB_AdditionalReset: TSpeedButton;
    qFSC_MedView: TqFSpravControl;
    lblShowInfo: TLabel;
    CameFromEdit: TcxTextEdit;
    lblCameFrom: TcxLabel;
    lblPostBefore: TcxLabel;
    PostBeforeEdit: TcxTextEdit;
    DateCame: TcxDateEdit;
    lblDateCame: TcxLabel;
    rgGraduate: TRadioGroup;
    lblDateAspir: TcxLabel;
    DateAspir: TcxDateEdit;
    IgdivEdit: TcxTextEdit;
    lblIgdiv: TcxLabel;
    lblPhone: TcxLabel;
    PhoneEdit: TcxTextEdit;
    lblDiscipline: TcxLabel;
    DisciplineEdit: TcxTextEdit;
    lblReKval: TcxLabel;
    ReKvalEdit: TcxTextEdit;
    lblDateLastMed: TcxLabel;
    DateLastMed: TcxDateEdit;
    cbAspir: TCheckBox;
    cbDoct: TCheckBox;
    lblDateDoct: TcxLabel;
    DateDoct: TcxDateEdit;
    NoteEdit: TcxMemo;
    lblNote: TcxLabel;
    lblAspir: TcxLabel;
    lblDoct: TcxLabel;
    lblPersData: TcxLabel;
    isGetProcPersData: TCheckBox;
    procedure SB_AdditionalApplyClick(Sender: TObject);
    procedure SB_AdditionalResetClick(Sender: TObject);
    procedure qFSC_MedViewOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure Came_fromChange(Sender: TObject);
    procedure cbAspirClick(Sender: TObject);
    procedure cbDoctClick(Sender: TObject);
    procedure CameFromEditPropertiesChange(Sender: TObject);
    procedure PostBeforeEditPropertiesChange(Sender: TObject);
    procedure DateCamePropertiesChange(Sender: TObject);
    procedure IgdivEditPropertiesChange(Sender: TObject);
    procedure PhoneEditPropertiesChange(Sender: TObject);
    procedure DisciplineEditPropertiesChange(Sender: TObject);
    procedure ReKvalEditPropertiesChange(Sender: TObject);
    procedure DateLastMedPropertiesChange(Sender: TObject);
    procedure IgdivEditKeyPress(Sender: TObject; var Key: Char);
    procedure ReKvalEditKeyPress(Sender: TObject; var Key: Char);
    procedure DateAspirPropertiesChange(Sender: TObject);
    procedure DateDoctPropertiesChange(Sender: TObject);
    procedure NoteEditPropertiesChange(Sender: TObject);
    procedure isGetProcPersDataPropertiesChange(Sender: TObject);
    procedure isGetProcPersDataClick(Sender: TObject);
  private
    DM: TdmPCAdditionalPage;
  public
  	Mode:TFormMode;
    IdPcard: Variant;
    IdManAddInfo:Variant;
    constructor Create(AOwner: TComponent; DM: TdmPCAdditionalPage; Mode:TFormMode; Id_PCard: Integer);
        reintroduce;
    procedure RefreshPage;
  end;

implementation

uses DateUtils, BaseTypes;

{$R *.dfm}

constructor TfmPCardAdditionalPage.Create(AOwner: TComponent; DM: TdmPCAdditionalPage; Mode:TFormMode; Id_PCard: Integer);
begin
    inherited Create(AOwner);
    Self.DM := DM;
    Self.Mode:=Mode;
    IdPcard:=Id_PCard;
    qFFC_Additional.Prepare(DM.DB, Mode, Id_PCard, Null);
    SB_AdditionalApply.Enabled:=(Mode=fmModify);
    SB_AdditionalReset.Enabled:=(Mode=fmModify);
    //qFBC_IsAspirChange(qFBC_IsAspir);
    NoteEdit.Lines.Text:='';
    RefreshPage;
    lblShowInfo.visible:=false;
    if Mode<>fmModify then
    begin
       CameFromEdit.Enabled:=False;
       PostBeforeEdit.Enabled:=False;
       DateCame.Enabled:=False;
       IgdivEdit.Enabled:=False;
       cbAspir.Enabled:=False;
       DateAspir.Enabled:=False;
       cbDoct.Enabled:=False;
       DateDoct.Enabled:=False;
       DisciplineEdit.Enabled:=False;
       ReKvalEdit.Enabled:=False;
       NoteEdit.Enabled:=False;
       DateLastMed.Enabled:=False;
    end;
end;

procedure TfmPCardAdditionalPage.RefreshPage;
begin
   with DM do
   begin
      ManDSet.Close;
      ManDSet.SQLs.SelectSQL.Text:='select distinct * from asup_man_addinfo_s(:id_pcard)';
      ManDSet.ParamByName('id_pcard').AsInt64:=IdPcard;
      ManDSet.Open;
      if not ManDSet.IsEmpty then
      begin
         if VarIsNull(ManDSet['Came_From']) then CameFromEdit.Text:=''
         else CameFromEdit.Text:=ManDSet['Came_From'];
         if VarIsNull(ManDSet['Were_Before']) then PostBeforeEdit.Text:=''
         else PostBeforeEdit.Text:=ManDSet['Were_Before'];
         if VarIsNull(ManDSet['Date_Came']) then DateCame.EditValue:=Null
         else DateCame.EditValue:=ManDSet['Date_Came'];
         if VarIsNull(ManDSet['Is_Aspir']) then cbAspir.Checked:=False
         else if ManDSet['Is_Aspir']='T' then cbAspir.Checked:=True
              else cbAspir.Checked:=False;
         if VarIsNull(ManDSet['Date_Aspir']) then DateAspir.EditValue:=Null
         else DateAspir.EditValue:=ManDSet['Date_Aspir'];
         if VarIsNull(ManDSet['Is_Doct']) then cbDoct.Checked:=False
         else if ManDSet['Is_Doct']='T' then cbDoct.Checked:=True
              else cbDoct.Checked:=False;
         if VarIsNull(ManDSet['Date_Doct']) then DateDoct.EditValue:=Null
         else DateDoct.EditValue:=ManDSet['Date_Doct'];
         if VarIsNull(ManDSet['Igdiv']) then IgdivEdit.Text:=''
         else IgdivEdit.Text:=IntToStr(ManDSet['Igdiv']);
         {if VarIsNull(ManDSet['Telefon']) then PhoneEdit.Text:=''
         else PhoneEdit.Text:=ManDSet['Telefon'];}
         if VarIsNull(ManDSet['Discipline']) then DisciplineEdit.Text:=''
         else DisciplineEdit.Text:=ManDSet['Discipline'];
         if not VarIsNull(ManDSet['Id_Medview']) then
         begin
            qFSC_MedView.Value:=ManDSet['Id_Medview'];
            qFSC_MedView.DisplayText:=ManDSet['Name_Medview'];
         end
         else
         begin
            qFSC_MedView.DisplayText:='';
            qFSC_MedView.Value:=null;
         end;
         if VarIsNull(ManDSet['Year_P']) then ReKvalEdit.Text:=''
         else ReKvalEdit.Text:=IntToStr(ManDSet['Year_P']);
         if VarIsNull(ManDSet['Date_Vut']) then DateLastMed.EditValue:=Null
         else DateLastMed.EditValue:=ManDSet['Date_Vut'];
         If VarIsNull(ManDSet['Note']) then NoteEdit.Lines.Text:=''
         else NoteEdit.Lines.Text:=ManDSet['Note'];
         cbAspirClick(Self);
         cbDoctClick(Self);
         IdManAddInfo:=ManDSet['Id_Man_Addinfo'];
         if VarIsNull(ManDSet['Is_Get_Proc_Pers_Data']) then isGetProcPersData.Checked:=False
         else
         begin
            if ManDSet['Is_Get_Proc_Pers_Data']='T' then isGetProcPersData.Checked:=True
            else isGetProcPersData.Checked:=False;
         end;
      end;
   end;
end;

procedure TfmPCardAdditionalPage.SB_AdditionalApplyClick(Sender: TObject);
begin
   with DM do
   begin
      StorProc.Transaction.StartTransaction;
      StorProc.StoredProcName:='ASUP_MAN_ADDINFO_IU';
      StorProc.Prepare;
      StorProc.ParamByName('Id_Man_Addinfo').Value:=IdManAddInfo;
      StorProc.ParamByName('Id_Pcard').AsInt64:=IdPcard;
      StorProc.ParamByName('Came_From').AsString:=CameFromEdit.Text;
      StorProc.ParamByName('Were_Before').AsString:=PostBeforeEdit.Text;
      if DateCame.Text='' then StorProc.ParamByName('Date_Came').Value:=null
      else StorProc.ParamByName('Date_Came').AsDate:=StrToDate(DateCame.Text);
      if cbAspir.Checked then StorProc.ParamByName('Is_Aspir').AsString:='T'
      else StorProc.ParamByName('Is_Aspir').AsString:='F';
      if DateAspir.Text='' then StorProc.ParamByName('Date_Aspir').Value:=null
      else StorProc.ParamByName('Date_Aspir').AsDate:=StrToDate(DateAspir.Text);
      if cbDoct.Checked then StorProc.ParamByName('Is_Doct').AsString:='T'
      else StorProc.ParamByName('Is_Doct').AsString:='F';
      if DateDoct.Text='' then StorProc.ParamByName('Date_Doct').Value:=null
      else StorProc.ParamByName('Date_Doct').AsDate:=StrToDate(DateDoct.Text);
      if IgdivEdit.Text<>'' then StorProc.ParamByName('Igdiv').AsInteger:=StrToInt(IgdivEdit.Text);
      StorProc.ParamByName('Telefon').AsString:='';
      StorProc.ParamByName('Discipline').AsString:=DisciplineEdit.Text;
      if VarIsNull(qFSC_MedView.Value) then StorProc.ParamByName('Id_Medview').Value:=null
      else StorProc.ParamByName('Id_Medview').AsInteger:=qFSC_MedView.Value;
      if ReKvalEdit.Text<>'' then StorProc.ParamByName('Year_P').AsInteger:=StrToInt(ReKvalEdit.Text);
      if DateLastMed.Text='' then StorProc.ParamByName('Date_Vut').Value:=Null
      else StorProc.ParamByName('Date_Vut').AsDate:=StrToDate(DateLastMed.Text);
      StorProc.ParamByName('Note').AsString:=NoteEdit.Lines.Text;
      if isGetProcPersData.Checked then StorProc.ParamByName('Is_Get_Proc_Pers_Data').AsString:='T'
      else StorProc.ParamByName('Is_Get_Proc_Pers_Data').AsString:='F';
      try
        StorProc.ExecProc;
        StorProc.Transaction.Commit;
      except on E: Exception
             do begin
                   agMessageDlg('Увага!', e.Message, mtInformation, [mbOK]);
                   StorProc.Transaction.Rollback;
             end;
      end;
   end;
   RefreshPage;
   lblShowInfo.visible:=false;
end;

procedure TfmPCardAdditionalPage.SB_AdditionalResetClick(Sender: TObject);
begin
  RefreshPage;
  lblShowInfo.visible:=false;
end;

procedure TfmPCardAdditionalPage.qFSC_MedViewOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
	form: TSpForm;
 	PropParams: TSpParams;
begin
 PropParams:=TSpParams.Create;
	with PropParams do
	begin
		Table := 'Asup_Sp_medview';
		Title := 'Медичний огляд';
		IdField := 'Id_medview';
		SpFields := 'Name_medview';
		ColumnNames := 'Назва';
    SpMode := [spfModify,spfFind,spfSelect,spfExt];
	end;
	form := TSpForm.Create(Self);
	form.Init(PropParams);
	if (form.ShowModal=mrOk) then
   begin
     value:=form.ResultQuery['Id_medview'];
     DisplayText:=form.ResultQuery['name_medview'];
   end;
	form.Free;
  PropParams.Free;
end;

procedure TfmPCardAdditionalPage.Came_fromChange(Sender: TObject);
begin
  if not VarIsNull(qFSC_MedView.Value) then lblShowInfo.visible:=true;
end;

procedure TfmPCardAdditionalPage.cbAspirClick(Sender: TObject);
begin
   lblShowInfo.visible:=True;
   if cbAspir.Checked then
   begin
      lblDateAspir.Visible:=True;
      DateAspir.Visible:=True;
   end
   else
   begin
      lblDateAspir.Visible:=False;
      DateAspir.Visible:=False;
   end;
end;

procedure TfmPCardAdditionalPage.cbDoctClick(Sender: TObject);
begin
   lblShowInfo.visible:=True;
   if cbDoct.Checked then
   begin
      lblDateDoct.Visible:=True;
      DateDoct.Visible:=True;
   end
   else
   begin
      lblDateDoct.Visible:=False;
      DateDoct.Visible:=False;
   end;
end;

procedure TfmPCardAdditionalPage.CameFromEditPropertiesChange(
  Sender: TObject);
begin
    lblShowInfo.visible:=True;
end;

procedure TfmPCardAdditionalPage.PostBeforeEditPropertiesChange(
  Sender: TObject);
begin
   lblShowInfo.visible:=True;
end;

procedure TfmPCardAdditionalPage.DateCamePropertiesChange(Sender: TObject);
begin
   lblShowInfo.visible:=True;
end;

procedure TfmPCardAdditionalPage.IgdivEditPropertiesChange(
  Sender: TObject);
begin
   lblShowInfo.visible:=True;
end;

procedure TfmPCardAdditionalPage.PhoneEditPropertiesChange(
  Sender: TObject);
begin
//   lblShowInfo.visible:=True;
end;

procedure TfmPCardAdditionalPage.DisciplineEditPropertiesChange(
  Sender: TObject);
begin
   lblShowInfo.visible:=True;
end;

procedure TfmPCardAdditionalPage.ReKvalEditPropertiesChange(
  Sender: TObject);
begin
   lblShowInfo.visible:=True;
end;

procedure TfmPCardAdditionalPage.DateLastMedPropertiesChange(
  Sender: TObject);
begin
   lblShowInfo.visible:=True;
end;

procedure TfmPCardAdditionalPage.IgdivEditKeyPress(Sender: TObject;
  var Key: Char);
begin
    if (key in ['0'..'9']) or (key=#8) then IgdivEdit.Properties.ReadOnly:=false
    else  IgdivEdit.Properties.ReadOnly:=true;
end;

procedure TfmPCardAdditionalPage.ReKvalEditKeyPress(Sender: TObject;
  var Key: Char);
begin
    if (key in ['0'..'9']) or (key=#8) then ReKvalEdit.Properties.ReadOnly:=false
    else  ReKvalEdit.Properties.ReadOnly:=true;
end;

procedure TfmPCardAdditionalPage.DateAspirPropertiesChange(
  Sender: TObject);
begin
   lblShowInfo.visible:=True;
end;

procedure TfmPCardAdditionalPage.DateDoctPropertiesChange(Sender: TObject);
begin
   lblShowInfo.visible:=True;
end;

procedure TfmPCardAdditionalPage.NoteEditPropertiesChange(Sender: TObject);
begin
   lblShowInfo.visible:=True;
end;

procedure TfmPCardAdditionalPage.isGetProcPersDataPropertiesChange(
  Sender: TObject);
begin
   lblShowInfo.visible:=True;
end;

procedure TfmPCardAdditionalPage.isGetProcPersDataClick(Sender: TObject);
begin
   lblShowInfo.visible:=True;
end;

end.
