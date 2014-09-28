//******************************************************************************
// Пакет для добавленя, изменения, удаления данных о свойствах людей
// параметры: ID - идентификатор, если добавление, то идентификатор человека, иначе
// идентификатор свойства человека.
//******************************************************************************
unit PeopleComandirovki_Ctrl_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, StdCtrls, cxButtons, cxCalendar,
  cxTextEdit, cxMaskEdit, cxContainer, cxEdit, cxLabel, ExtCtrls,
  cxControls, cxGroupBox,ZMessages, ZProc,
  Unit_ZGlobal_Consts, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, DB, FIBDataSet, pFIBDataSet, ZTypes, IBase, ActnList, PeopleComandiriovki_Ctrl_DM,
  cxCalc, cxButtonEdit, GlobalSpr, PackageLoad;

type
  TFSp_People_WorkMode_Control = class(TForm)
    IdentificationBox: TcxGroupBox;
    PeopleLabel: TcxLabel;
    PeopleEdit: TcxMaskEdit;
    PeriodBox: TcxGroupBox;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    DateBegLabel: TcxLabel;
    DateBeg: TcxDateEdit;
    DateEndLabel: TcxLabel;
    DateEnd: TcxDateEdit;
    Actions: TActionList;
    ActionYes: TAction;
    WorkDogLabel: TcxLabel;
    cxMaskEdit1: TcxMaskEdit;
    cxLabel1: TcxLabel;
    AvgCalc: TcxCalcEdit;
    EditSmeta: TcxButtonEdit;
    LabelSmetaName: TcxLabel;
    cxLabel2: TcxLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    EditVidOpl: TcxButtonEdit;
    LabelVidOplData: TcxLabel;
    cxLabel3: TcxLabel;
    procedure CancelBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionYesExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure EditSmetaPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditSmetaExit(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure EditVidOplExit(Sender: TObject);
    procedure EditVidOplPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    Ins_Id_Man:LongWord;
    PParameter:TZPeopleComandirovParameters;
    DM:TDMWorkMode_Ctrl;
    PLanguageIndex:Byte;
    pNumPredpr:integer;
    PId_Smeta:Integer;
    PId_VidOpl:Integer;
  public
    constructor Create(AOwner: TComponent;DB_Handle:TISC_DB_HANDLE;AParameters:TZPeopleComandirovParameters;Is_Grant: TZChildSystems);reintroduce;
    property ID_Man:LongWord read Ins_Id_Man write Ins_Id_Man;
    property Parameter:TZPeopleComandirovParameters read PParameter;
  end;

implementation

uses StrUtils;

{$R *.dfm}

constructor TFSp_People_WorkMode_Control.Create(AOwner: TComponent;DB_Handle:TISC_DB_HANDLE;AParameters:TZPeopleComandirovParameters;Is_Grant: TZChildSystems);
begin
 inherited Create(AOwner);
 PParameter := AParameters;
 DM := TDMWorkMode_Ctrl.Create(AOwner,DB_Handle,AParameters,Is_Grant);
 PLanguageIndex:=LanguageIndex;
 pNumPredpr := StrToInt(VarToStrDef(ValueFieldZSetup(DB_Handle,'NUM_PREDPR'),'1'));
//******************************************************************************
 PeopleLabel.Caption           := LabelMan_Caption[PLanguageIndex];
 WorkDogLabel.Caption          := 'Трудовий договір';
 DateBegLabel.Caption          := LabelDateBeg_Caption[PLanguageIndex]+' - ';
 DateEndLabel.Caption          := ' - '+AnsiLowerCase(LabelDateEnd_Caption[PLanguageIndex]);
 YesBtn.Caption                := YesBtn_Caption[PLanguageIndex];
 CancelBtn.Caption             := CancelBtn_Caption[PLanguageIndex];
//******************************************************************************
 case PParameter.ControlFormStyle of
  zcfsInsert:
   begin
    DateBeg.Properties.MaxDate := VarToDateTime(DM.DSetData['PER_DATE_BEG']);
    DateBeg.Properties.MinDate := VarToDateTime(DM.DSetData['PER_DATE_END']);
    DateEnd.Properties.MaxDate := VarToDateTime(DM.DSetData['PER_DATE_BEG']);
    DateEnd.Properties.MinDate := VarToDateTime(DM.DSetData['PER_DATE_END']);
    cxMaskEdit1.Text   :=DM.DSetData['NAME_POST'];
    Caption            := 'Додати відрядження';
    PeopleEdit.Text    := VarToStr(DM.DSetData.FieldValues['TN'])+' - '+VarToStr(DM.DSetData.FieldValues['FIO']);
    DateBeg.Date       := Date;
    DateEnd.Date       := Date;
    EditVidOpl.Text    := AParameters.kod_vidopl;
    //Pid_vidopl         := AParameters.id_vidopl;
    EditVidOplExit(self); //подгрузить заголовок и айди
   end;
  zcfsUpdate:
   begin
    DateBeg.Properties.MaxDate := VarToDateTime(DM.DSetData['PER_DATE_BEG']);
    DateBeg.Properties.MinDate := VarToDateTime(DM.DSetData['PER_DATE_END']);
    DateEnd.Properties.MaxDate := VarToDateTime(DM.DSetData['PER_DATE_BEG']);
    DateEnd.Properties.MinDate := VarToDateTime(DM.DSetData['PER_DATE_END']);
    cxMaskEdit1.Text   :=DM.DSetData['NAME_POST'];
    Caption            := 'Змінити відрядження';
    PeopleEdit.Text    := VarToStr(DM.DSetData['FIO']);
    DateBeg.Date       := AParameters.date_beg;
    DateEnd.Date       := AParameters.date_end;

    if AParameters.avg_sum=NULL
    then begin
               AvgCalc.Enabled:=false;
               CheckBox2.Checked:=true;
    end
    else begin
              AvgCalc.EditValue  := AParameters.avg_sum;
              AvgCalc.Enabled:=true;
              CheckBox2.Checked:=false;
    end;

    EditSmeta.Text     := AParameters.smeta_kod;
    PId_Smeta          := AParameters.id_smeta;
    EditVidOpl.Text    := AParameters.kod_vidopl;
    Pid_vidopl         := AParameters.id_vidopl;
    EditVidOplExit(self); //подгрузить заголовок


    if AParameters.id_smeta<>0
    then begin
              LabelSmetaName.Caption:=IntToStr(PId_Smeta);
              EditSmeta.Enabled:=true;
              LabelSmetaName.Enabled:=true;
              CheckBox1.Checked:=false;
    end
    else begin
              LabelSmetaName.Caption:='АВТО';
              EditSmeta.Enabled:=false;
              LabelSmetaName.Enabled:=false;
              CheckBox1.Checked:=true;
    end;

   end;
  zcfsShowDetails:
   begin
    cxMaskEdit1.Text   :=DM.DSetData['NAME_POST'];
    Caption            := 'Інформація по відрядженню';
    PeopleEdit.Text    := VarToStr(DM.DSetData['FIO']);
    DateBeg.Date       := AParameters.date_beg;
    DateEnd.Date       := AParameters.date_end;
    PeriodBox.Enabled  := False;
    YesBtn.Visible     := False;
    AvgCalc.EditValue  := AParameters.avg_sum;
    AvgCalc.Enabled    := False;
    CancelBtn.Caption  := ExitBtn_Caption[PLanguageIndex];
    EditVidOpl.Text    := AParameters.kod_vidopl;
    Pid_vidopl         := AParameters.id_vidopl;
    EditVidOplExit(self); //подгрузить заголовок
    EditVidOpl.Enabled := False;
    LabelVidOplData.Enabled    := False;

   end;
 end;
end;

procedure TFSp_People_WorkMode_Control.CancelBtnClick(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TFSp_People_WorkMode_Control.FormCreate(Sender: TObject);
begin
     if PParameter.ControlFormStyle = zcfsDelete
     then begin
               if ZShowMessage(ZPeopleWorkModeCtrl_Caption_Delete[PLanguageIndex],DeleteRecordQuestion_Text[PLanguageIndex],mtConfirmation,[mbYes,mbNo])=mrYes
               then begin
                          with DM do
                          try

                              StoredProc.Database := DB;
                              StoredProc.Transaction := WriteTransaction;
                              StoredProc.Transaction.StartTransaction;
                              StoredProc.StoredProcName := 'Z_COMANDIROVKI_DEL';
                              StoredProc.Prepare;
                              StoredProc.ParamByName('ID_COM').AsInteger := PParameter.ID;
                              StoredProc.ExecProc;
                              StoredProc.Transaction.Commit;
                              ModalResult:=mrYes;
                          except on E:Exception do
                               begin
                                    ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
                                    StoredProc.Transaction.Rollback;
                               end;
                          end
               end
               else ModalResult:=mrCancel;
     end;
end;

procedure TFSp_People_WorkMode_Control.ActionYesExecute(Sender: TObject);
var ID:integer;
begin
              if (AvgCalc.EditValue<0)
              then begin
                        ZShowMessage(Error_Caption[PLanguageIndex],'Не можна вводити від''''ємне середне!',mtWarning,[mbOK]);
                        AvgCalc.SetFocus;
                        Exit;
              end;


              if DateBeg.Date>DateEnd.Date
              then begin
                        ZShowMessage(Error_Caption[PLanguageIndex],ZeInputTerms_ErrorText[PLanguageIndex],mtWarning,[mbOK]);
                        DateBeg.SetFocus;
              end
              else begin
                        case PParameter.ControlFormStyle of
                        zcfsInsert:
                                    with DM do
                                    try
                                     StoredProc.Database := DB;
                                     StoredProc.Transaction := WriteTransaction;
                                     StoredProc.Transaction.StartTransaction;
                                     StoredProc.StoredProcName := 'Z_COMANDIROVKI_INS';
                                     StoredProc.Prepare;
                                     StoredProc.ParamByName('rmoving').AsInteger     := PParameter.rmoving;
                                     StoredProc.ParamByName('DATE_BEG').AsDate       := DateBeg.Date;
                                     StoredProc.ParamByName('DATE_END').AsDate       := DateEnd.Date;

                                     if CheckBox2.Checked
                                     then StoredProc.ParamByName('AVG_SUM').Value    :=NULL
                                     else StoredProc.ParamByName('AVG_SUM').Value    := AvgCalc.EditValue;

                                     if CheckBox1.Checked
                                     then StoredProc.ParamByName('ID_SMETA').Value   := 0
                                     else StoredProc.ParamByName('ID_SMETA').Value   := PId_Smeta;

                                     StoredProc.ParamByName('Id_VIDOPL').AsInteger   := PId_VidOpl;

                                     StoredProc.ExecProc;

                                     ID:=StoredProc.ParamByName('ID_com').AsInteger;
                                     StoredProc.Transaction.Commit;
                                     PParameter.ID := ID;
                                     ModalResult:=mrYes;
                                    except
                                    on E:Exception do
                                     begin
                                      ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
                                      StoredProc.Transaction.Rollback;
                                     end;
                                    end;
                        zcfsUpdate:
                                    with DM do
                                    try
                                     StoredProc.Database := DB;
                                     StoredProc.Transaction := WriteTransaction;
                                     StoredProc.Transaction.StartTransaction;
                                     StoredProc.StoredProcName := 'Z_COMANDIROVKI_UPD';
                                     StoredProc.Prepare;
                                     StoredProc.ParamByName('ID_com').AsInteger := PParameter.ID;
                                     StoredProc.ParamByName('rmoving').AsInteger:= PParameter.rmoving;
                                     StoredProc.ParamByName('DATE_BEG').AsDate  := DateBeg.Date;
                                     StoredProc.ParamByName('DATE_END').AsDate  := DateEnd.Date;
                                     
                                     if CheckBox2.Checked
                                     then StoredProc.ParamByName('AVG_SUM').Value:=NULL
                                     else StoredProc.ParamByName('AVG_SUM').Value    := AvgCalc.EditValue;

                                     if CheckBox1.Checked
                                     then StoredProc.ParamByName('ID_SMETA').Value    := 0
                                     else StoredProc.ParamByName('ID_SMETA').Value    := PId_Smeta;

                                     StoredProc.ParamByName('ID_VIDOPL').AsInteger    := PId_VidOpl;
                                     StoredProc.ExecProc;
                                     StoredProc.Transaction.Commit;
                                     ModalResult:=mrYes;
                                    except
                                    on E:Exception do
                                     begin
                                      ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
                                      StoredProc.Transaction.Rollback;
                                     end;
                                    end;
                        end;
              end;
end;

procedure TFSp_People_WorkMode_Control.FormDestroy(Sender: TObject);
begin
if DM<>nil then DM.Destroy;
end;

procedure TFSp_People_WorkMode_Control.EditSmetaPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Smeta:Variant;
begin

Smeta:=GetSmets(self,Dm.DB.Handle,Date,psmSmet);
if VarArrayDimCount(Smeta)> 0 then
 If Smeta[0]<>NULL then
  begin
   EditSmeta.Text         := Smeta[3];
   LabelSmetaName.Caption := Smeta[2];
   PId_Smeta              := Smeta[0];
  end;
end;

procedure TFSp_People_WorkMode_Control.EditSmetaExit(Sender: TObject);
var Smeta:variant;
begin
 if EditSmeta.Text<>'' then
  begin
   Smeta:=SmetaByKod(StrToInt(EditSmeta.Text),DM.db.Handle);
   if not VarIsNull(Smeta) then
    begin
     PId_Smeta:=Smeta[0];
     LabelSmetaName.Caption:=VarToStr(Smeta[2]);
    end
   else
    EditSmeta.SetFocus;
  end
end;

procedure TFSp_People_WorkMode_Control.CheckBox1Click(Sender: TObject);
begin
     EditSmeta.Enabled:=not CheckBox1.Checked;
     LabelSmetaName.Enabled:=not CheckBox1.Checked;
end;

procedure TFSp_People_WorkMode_Control.CheckBox2Click(Sender: TObject);
begin
     AvgCalc.Enabled:=not CheckBox2.Checked;
end;

procedure TFSp_People_WorkMode_Control.EditVidOplExit(Sender: TObject);
var VidOpl:Variant;
begin
if EditVidOpl.Text<>'' then
 begin
    VidOpl:=VoByKod(StrToInt(EditVidOpl.Text),date,DM.DB.Handle,ValueFieldZSetup(DM.DB.Handle,'Z_ID_SYSTEM'),0);
  if VarArrayDimCount(VidOpl)>0 then
   begin
    PId_VidOpl:=VidOpl[0];
    LabelVidOplData.Caption := VidOpl[2];
    EditVidOpl.EditValue:=VarToStrDef(VidOpl[1],'');
   end
  else
   EditVidOpl.SetFocus;
 end;
end;

procedure TFSp_People_WorkMode_Control.EditVidOplPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var VidOpl:Variant;
begin
  VidOPl:=LoadVidOpl(self,
                   DM.DB.Handle,zfsModal,
                   0,
                   ValueFieldZSetup(DM.DB.Handle,'Z_ID_SYSTEM'));
  if VarArrayDimCount(VidOpl)>0 then
  begin
   PId_VidOpl:=VidOpl[0];
   EditVidOpl.Text := VarToStrDef(VidOpl[2],'');
   LabelVidOplData.Caption := VidOpl[1];
  end
  else
    EditVidOpl.SetFocus;
end;

end.
