
unit U4FormInsert;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxButtonEdit,PackageLoad,Pers4DModule, StdCtrls, cxDropDownEdit,
  cxCalendar, ExtCtrls, cxLookAndFeelPainters, cxButtons, ZMessages,
  cxSpinEdit, cxRadioGroup, ZProc ;

type TZControlFormStyle = (tcfsInsert, tcfsUpdate, tcfsDelete, tcfsShowDetails);

type TZPersModule4Param = class(TObject)
 AOwner:TComponent;
 Id_record  :Integer;
 id_anketa  :Integer;
 Id_report  :Integer;
 Date_Beg   :TDate;
 Date_End   :TDate;
 KodSetup   :Integer;
 TIN        :String;
 FStyle     :TZControlFormStyle;
end;
type
  TFormEdit = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    EditDateBeg: TcxDateEdit;
    EditDateEnd: TcxDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EditName: TcxTextEdit;
    EditFath: TcxTextEdit;
    Label4: TLabel;
    Label5: TLabel;
    EditNomerKart: TcxTextEdit;
    Label6: TLabel;
    EditFam: TcxButtonEdit;
    ButtonOk: TcxButton;
    ButtonCancel: TcxButton;
    Label7: TLabel;
    cxTextEdit1: TcxTextEdit;
    Label8: TLabel;
    cxSpinEdit1: TcxSpinEdit;
    cxDateEditDATE_NEW_WORK_PL: TcxDateEdit;
    Label9: TLabel;
    RBtnYes: TcxRadioButton;
    RBtnFalse: TcxRadioButton;
    Label10: TLabel;
    procedure ButtonAnketPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ButtonOkClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RBtnYesExit(Sender: TObject);
    procedure RBtnFalseExit(Sender: TObject);
  private
    { Private declarations }
  public
    Parameters:TZPersModule4Param;
  end;

function Viev_ZFormEdit(Param:TZPersModule4Param):Boolean;


implementation

uses FIBQuery, pFIBStoredProc, pFIBQuery;



{$R *.dfm}


function Viev_ZFormEdit(Param:TZPersModule4Param):Boolean;
var Form: TFormEdit;

begin
  if Param.FStyle=tcfsDelete then
    if ZShowMessage('Видалити','Ви дійсно бажаєте видалити обраний запис?',mtWarning,[mbYes,mbNo])=6 then
    with DModule.SProc do
    begin
      Transaction.StartTransaction;
      StoredProcName:='Z_PERSONIFICATION_WORK_DOG_D';
      Prepare;
      ParamByName('ID_RECORD').AsInteger:=Param.Id_record;
      ExecProc;
      Transaction.Commit;
      result:=True;
      Exit;
    end
  else
  begin
    result:=False;
    Exit;
  end ;

  Form:=TFormEdit.Create(Param.AOwner);
  Form.Parameters:=TZPersModule4Param.Create;
  Form.Parameters:=Param;
  if Param.FStyle=tcfsUpdate then
   with DModule do
   begin
     Form.EditFam.Text:=DSetWorkDog['FAM'];
     Form.EditName.Text:=DSetWorkDog['NAME'];
     Form.EditFath.Text:=DSetWorkDog['FATH'];
     if DSetWorkDog['DATE_BEG']<>null then
      Form.EditDateBeg.Date:=DSetWorkDog['DATE_BEG'];
     if DSetWorkDog['DATE_END']<>null then
      Form.EditDateEnd.Date:=DSetWorkDog['DATE_END'];
     if DSetWorkDog['DATE_NEW_WORK_PL']<>null then
      Form.cxDateEditDATE_NEW_WORK_PL.Date:=DSetWorkDog['DATE_NEW_WORK_PL'];
     Form.EditNomerKart.Text:=DSetWorkDog['TIN'];
     Form.EditFam.Enabled:=False;
     form.cxTextEdit1.Text:=VarToStr(DSetWorkDog['GROUNDS_OF_DISMISSAL']);
     form.cxSpinEdit1.EditValue:=DSetWorkDog['KOD_CAT'];

     if DSetWorkDog['DOG_CPH']<>null then
     begin
      form.RBtnYes.Checked:=IfThen(DSetWorkDog['DOG_CPH']=1,True,False);
      form.RBtnFalse.Checked:=IfThen(DSetWorkDog['DOG_CPH']=0,True,False);
     end


   end
   else
   Form.EditFam.Enabled:=True;
  if  Form.ShowModal=mrYes then
  begin
  Param.Id_record:=Form.Parameters.Id_record;
  Result:=True;
  end
  else Result:=False;
  Form.Free;

end ;




procedure TFormEdit.ButtonAnketPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var T:variant;
begin

  T:=VarArrayCreate([0,6],varVariant);

  T:= LoadPeopleModal(Self,DModule.DB.Handle) ;

  Parameters.TIN:=T[5];

  EditFam.Text:=T[1];

  EditName.Text:=T[2];

  EditFath.Text:=T[3];
 
  EditNomerKart.Text:=T[5];
end;

procedure TFormEdit.ButtonOkClick(Sender: TObject);
begin
if EditFam.Text='' then Exit;
   with DModule.SProc do
   begin
     Transaction.StartTransaction;
     if Parameters.FStyle=tcfsUpdate then
     begin
      StoredProcName:='Z_PERSONIFICATION_WORK_DOG_U';
      Prepare;
      ParamByName('ID_RECORD').AsInteger:=Parameters.Id_record;
     end
     else
     begin
      StoredProcName:='Z_PERSON_WORK_DOG_I';
      Prepare;
      ParamByName('ID_REPORT').AsInteger :=Parameters.Id_report;

      ParamByName('TIN').AsString        :=Parameters.TIN;
     end;

      if Length( EditDateBeg.text)>0
      then ParamByName('DATE_BEG').AsDate     :=EditDateBeg.Date
      else ParamByName('DATE_BEG').AsVariant:=null;

      if Length( EditDateEnd.text)>0
      then ParamByName('DATE_END').AsDate     :=EditDateEnd.Date
      else ParamByName('DATE_END').AsVariant:=null;

      if Length( cxDateEditDATE_NEW_WORK_PL.text)>0
      then ParamByName('DATE_NEW_WORK_PL').AsDate     :=cxDateEditDATE_NEW_WORK_PL.Date
      else ParamByName('DATE_NEW_WORK_PL').AsVariant  :=null;



      ParamByName('KOD_CAT').Value:=cxSpinEdit1.Value;
      ParamByName('GROUNDS_OF_DISMISSAL').AsVariant:=cxTextEdit1.Text;

      if (RBtnYes.Checked) or (RBtnFalse.Checked) then
        ParamByName('DOG_CPH').AsVariant:=IfThen(RBtnYes.Checked,1,0);

      ExecProc;
      
     if Parameters.FStyle=tcfsInsert then
       Parameters.Id_record:=ParamByName('ID_RECORD').asinteger;
      Transaction.Commit;
   end;

  ModalResult:=mrYes;
end;

procedure TFormEdit.ButtonCancelClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TFormEdit.FormShow(Sender: TObject);
begin
  EditFam.Focused;
end;

procedure TFormEdit.RBtnYesExit(Sender: TObject);
begin
  if  RBtnYes.Checked then RBtnFalse.Checked:=False;
end;

procedure TFormEdit.RBtnFalseExit(Sender: TObject);
begin
  if RBtnFalse.Checked then RBtnYes.Checked:=False;
end;

end.
