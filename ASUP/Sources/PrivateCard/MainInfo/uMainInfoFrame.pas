unit uMainInfoFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uMainInfoData, uFormControl, uFControl, SpFormUnit,
  uLabeledFControl, uCharControl, ComCtrls, uIntControl, uSpravControl,
  uEnumControl, uDateControl, Buttons, SpCommon, ExtCtrls, uInvisControl,
  uMemoControl, uCommonSP;

type
  TfmPCardMainInfo = class(TFrame)
    qFFC_Main: TqFFormControl;
    FIO: TqFCharControl;
    RUS_FIO: TqFCharControl;
    CardNumber: TqFIntControl;
    TN: TqFIntControl;
    TIN: TqFCharControl;
    Sex: TqFEnumControl;
    Birth_Date: TqFDateControl;
    SB_ModifInfo: TSpeedButton;
    FamilyStatus: TqFSpravControl;
    Panel1: TPanel;
    Panel2: TPanel;
    SB_MainApply: TSpeedButton;
    SB_MainReset: TSpeedButton;
    qFIC_IdMan: TqFInvisControl;
    qFMC_BirthPl: TqFMemoControl;
    qFMC_LivePl: TqFMemoControl;
    Label1: TLabel;
    SB_Print: TSpeedButton;
    qFMC_FactLivePl: TqFMemoControl;
    WorkPhone: TqFCharControl;
    HomePhone: TqFCharControl;
    procedure NationalityOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure FamilyStatusOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure SB_MainApplyClick(Sender: TObject);
    procedure SB_MainResetClick(Sender: TObject);
    procedure SB_ModifInfoClick(Sender: TObject);
    procedure TNChange(Sender: TObject);
    procedure SB_PrintClick(Sender: TObject);
    procedure WorkPhoneChange(Sender: TObject);
    procedure HomePhoneChange(Sender: TObject);
  private
    DM: TdmPCMainInfo;
  public
    Id:Variant;
  	Mode:TFormMode;
    constructor Create(AOwner: TComponent; DM: TdmPCMainInfo; Mode:TFormMode; Id_PCard: Integer);
        reintroduce;
  end;

implementation

uses AllPeopleUnit;
{$R *.dfm}

constructor TfmPCardMainInfo.Create(AOwner: TComponent; DM: TdmPCMainInfo; Mode:TFormMode; Id_PCard: Integer);
begin
    inherited Create(AOwner);
    Self.DM := DM;
    Self.Mode:=Mode;
    id:=Id_PCard;
    qFFC_Main.Prepare(DM.DB, Mode, Id_PCard, Null);
    SB_MainApply.Enabled:=(Mode=fmModify);
    SB_MainReset.Enabled:=(Mode=fmModify);
    label1.visible:=false;
 //   SB_ModifInfo.Enabled:=(Mode=fmModify);
 //   qFFC_Additional.Prepare(DM.DB, fmInfo, Id_PCard, Null);

 
end;

procedure TfmPCardMainInfo.NationalityOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
	form: TSpForm;
 	PropParams: TSpParams;
begin
  PropParams:=TSpParams.Create;
	with PropParams do
	begin
		Table := 'Asup_Sp_Nationality';
		Title := 'Національність';
		IdField := 'Id_Nationality';
		SpFields := 'Name_Nationality';
		ColumnNames := 'Національність';
    SpMode := spmSelect;
	end;
	form := TSpForm.Create(Self);
	form.Init(PropParams);
	if (form.ShowModal=mrOk) then
   begin
     value:=form.ResultQuery['id_Nationality'];
     DisplayText:=form.ResultQuery['name_Nationality'];
   end;
	form.Free;
  PropParams.Free;
end;

procedure TfmPCardMainInfo.FamilyStatusOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
	form: TSpForm;
 	PropParams: TSpParams;
begin
  PropParams:=TSpParams.Create;
	with PropParams do
	begin
		Table := 'Ini_Family_Status';
		Title := 'Сімейне становище';
		IdField := 'Id_Family_Status';
		SpFields := 'Name_Status';
    SelectProcName := 'Ini_Family_Status';
		ColumnNames := 'Сімейне становище,-';
    ReadOnly:=True;
    SpMode := spmSelect;
	end;
	form := TSpForm.Create(Self);
	form.Init(PropParams);
	if (form.ShowModal=mrOk) then
   begin
     if (form.ResultQuery['Id_Sex']=Sex.Value) then
      begin
        value:=form.ResultQuery['Id_Family_Status'];
        DisplayText:=form.ResultQuery['Name_Status'];
      end
     else MessageDlg('Сімейне становище не відповідає статі!',mtError,[mbYes],0);
   end;
	form.Free;
  PropParams.Free;
end;

procedure TfmPCardMainInfo.SB_MainApplyClick(Sender: TObject);
begin
  if (qFFC_Main.Ok)
   then label1.visible:=false;
end;

procedure TfmPCardMainInfo.SB_MainResetClick(Sender: TObject);
begin
  qFFC_Main.Prepare(DM.DB, Mode, Id, Null);
  label1.visible:=false;
end;

procedure TfmPCardMainInfo.SB_ModifInfoClick(Sender: TObject);
begin
   AllPeopleUnit.ShowManEditForm(Self, DM.DB.Handle, qFIC_IdMan.GetValue, Mode=fmModify);
   qFFC_Main.Prepare(DM.DB, Mode, Id, Null);
   label1.visible:=false;
end;

procedure TfmPCardMainInfo.TNChange(Sender: TObject);
begin
     label1.visible:=true;
     
end;

procedure TfmPCardMainInfo.SB_PrintClick(Sender: TObject);
var
  sp: TSprav;
  new_vers:Boolean;
  i:integer;
begin
    new_vers := False;
    for i := 1 to ParamCount do if ParamStr(i) = 'newversion' then begin
     new_vers := True;
     Break;
    end;

    if  new_vers
    then begin
              sp := GetSprav('UP/UpReportCard');
              if sp <> nil then
              begin
                // заполнить входные параметры
                with sp.Input do
                begin
                  Append;
                  // присвоить хэндл базы данных
                  FieldValues['DBHandle'] := Integer(DM.DB.Handle);
                  // MDI-окно
                  FieldValues['id_pcard'] := id;
                  // без выборки
                  Post;
                end;
              end;
              // просто показать справочник
              sp.Show;
    end
    else begin
              // создать справочник
              sp := GetSprav('ASUP/AsupReportCard');
              if sp <> nil then
              begin
                // заполнить входные параметры
                with sp.Input do
                begin
                  Append;
                  // присвоить хэндл базы данных
                  FieldValues['DBHandle'] := Integer(DM.DB.Handle);
                  // MDI-окно
                  FieldValues['id_pcard'] := id;
                  // без выборки
                  Post;
                end;
              end;
              // просто показать справочник
              sp.Show;
    end;
end;

procedure TfmPCardMainInfo.WorkPhoneChange(Sender: TObject);
begin
   Label1.Visible:=true;
end;

procedure TfmPCardMainInfo.HomePhoneChange(Sender: TObject);
begin
   Label1.Visible:=true;
end;

end.
