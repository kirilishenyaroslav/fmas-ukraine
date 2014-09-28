unit uAddToCountList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit, cxLookAndFeelPainters, cxButtons,
  dmPaymentCount,PackageLoad,uCommonSp,AllPeopleUnit, ExtCtrls, ComCtrls,
  ZProc, ZTypes;

type
  TAddPeopleToListForm = class(TForm)
    ManSelectBox: TGroupBox;
    ManEdit: TcxButtonEdit;
    AllPeopleBtn: TRadioButton;
    ManSelBtn: TRadioButton;
    Label1: TLabel;
    Label2: TLabel;
    DepNameBtn: TRadioButton;
    DepEdit: TcxButtonEdit;
    Panel1: TPanel;
    Label3: TLabel;
    Panel2: TPanel;
    OkBtn: TcxButton;
    CancelBtn: TcxButton;
    Label4: TLabel;
    RadioButton1: TRadioButton;
    Label5: TLabel;
    RadioButton2: TRadioButton;
    Label6: TLabel;
    RadioButton3: TRadioButton;
    Label7: TLabel;
    RadioButton5: TRadioButton;
    Label9: TLabel;
    HolDateBeg: TDateTimePicker;
    Label10: TLabel;
    HolDateEnd: TDateTimePicker;
    Label11: TLabel;
    ManEditCode: TcxTextEdit;
    DepEditCode: TcxTextEdit;
    Label12: TLabel;
    DateBeg: TDateTimePicker;
    Label13: TLabel;
    DateEnd: TDateTimePicker;
    VidOplPropButton: TcxButtonEdit;
    procedure OkBtnClick(Sender: TObject);
    procedure ManEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure DepEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure AllPeopleBtnClick(Sender: TObject);
    procedure ManSelBtnClick(Sender: TObject);
    procedure DepNameBtnClick(Sender: TObject);
    procedure ManEditCodeExit(Sender: TObject);
    procedure DepEditCodeExit(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure VidOplPropButtonPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    FIdMan:Integer;
    Fidvidoplprop:Integer;
    FIdDepartment:Integer;
  public
    DataModule:TMainDM;
    constructor Create(AOwner:TComponent;date_beg,date_end:TDateTime);reintroduce;
    procedure GetMan;
    procedure GetDepartment;
  end;

var
  AddPeopleToListForm: TAddPeopleToListForm;


implementation

uses FIBDatabase;

{$R *.dfm}
procedure TAddPeopleToListForm.GetMan;
var Man:Variant;
begin
  if (Trim(ManEditCode.Text)<>'')
  then begin
            Man:=ManByTn(StrToInt(ManEditCode.Text),MainDm.MainDatabase.Handle);
            if VarArrayDimCount(Man)>0
            then begin
                      ManEdit.Text:=VarAsType(Man[2], varString);
                      FIdMan:=Man[0];
              end;
  end
  else begin
            ManEdit.Text:='';
            FIdMan:=0;
  end;
end;


procedure TAddPeopleToListForm.GetDepartment;
var Dep:Variant;
begin
      if (Trim(DepEditCode.Text)<>'')
      then begin
                Dep:=DepartmentByKod(DepEditCode.Text,MainDm.MainDatabase.Handle);

                if VarArrayDimCount(Dep)>0
                then begin
                          FIdDepartment := Dep[0];
                          DepEdit.Text  := VarAsType(Dep[1],varString)+' '+VarAsType(Dep[2], varString);
                end;
      end
      else begin
                if (Trim(DepEditCode.Text)='')
                then begin
                          FIdDepartment := 0;
                          DepEdit.Text  := '';
                end;
      end;
end;





procedure TAddPeopleToListForm.OkBtnClick(Sender: TObject);
begin
         with MainDM do
            begin
               if AllPeopleBtn.Checked then FillSpisokForCountQuery.ParamByName('KIND_OF_CHOOSE').Value:='*';
               if ManSelBtn.Checked    then FillSpisokForCountQuery.ParamByName('KIND_OF_CHOOSE').Value:='F';
               if DepNameBtn.Checked   then FillSpisokForCountQuery.ParamByName('KIND_OF_CHOOSE').Value:='D';
               if RadioButton1.Checked then FillSpisokForCountQuery.ParamByName('KIND_OF_CHOOSE').Value:='H';
               if RadioButton2.Checked then FillSpisokForCountQuery.ParamByName('KIND_OF_CHOOSE').Value:='M';
               if RadioButton3.Checked then FillSpisokForCountQuery.ParamByName('KIND_OF_CHOOSE').Value:='A';
               if RadioButton5.Checked then FillSpisokForCountQuery.ParamByName('KIND_OF_CHOOSE').Value:='P';

               FillSpisokForCountQuery.ParamByName('HOL_DATE_BEG').Value   :=self.HolDateBeg.Date;
               FillSpisokForCountQuery.ParamByName('HOL_DATE_END').Value   :=self.HolDateEnd.Date;


               FillSpisokForCountQuery.ParamByName('DATE_BEG').Value   :=self.DateBeg.Date;
               FillSpisokForCountQuery.ParamByName('DATE_END').Value   :=self.DateEnd.Date;
               FillSpisokForCountQuery.ParamByName('KOD_SETUP2').Value :=MainDM.KodSetup2;

               if (ManSelBtn.Checked)
               then FillSpisokForCountQuery.ParamByName('IN_ID_MAN').Value:=FIdMan
               else FillSpisokForCountQuery.ParamByName('IN_ID_MAN').Value:=null;

               if (RadioButton5.Checked)
               then FillSpisokForCountQuery.ParamByName('ID_VID_OPL_PROP').Value:=Fidvidoplprop
               else FillSpisokForCountQuery.ParamByName('ID_VID_OPL_PROP').Value:=NUll;

               if (DepNameBtn.Checked)
               then FillSpisokForCountQuery.ParamByName('ID_DEPARTMENT').Value:= FIdDepartment
               else FillSpisokForCountQuery.ParamByName('ID_DEPARTMENT').Value:=null;

               WriteTransaction.StartTransaction;

               try
                FillSpisokForCountQuery.ExecProc;

                WriteTransaction.Commit;
                ModalResult:=mrOk;
               except on E:Exception
               do
               begin
                ShowMessage(E.Message);
                WriteTransaction.Rollback;
               end;
               end;
            end;


end;


procedure TAddPeopleToListForm.ManEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    PeopleArray:Variant;
begin
    PeopleArray:=LoadPeopleModal(self,MainDM.MainDataBase.Handle);
    ManEdit.Text:=PeopleArray[1]+' ' +PeopleArray[2]+' '+PeopleArray[3];
    FIdMan:=PeopleArray[0];

end;

procedure TAddPeopleToListForm.DepEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
     sp:TSprav;
begin
     sp:=GetSprav('SpDepartment.bpl');

    if sp<>nil then
    begin

        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] :=Integer(MainDm.MainDatabase.Handle);
            FieldValues['Actual_Date']:=Date();
            Post;
        end;

        sp.Show;
        if ( sp.Output <> nil ) and not sp.Output.IsEmpty then
        begin
            FIdDepartment := sp.Output['Id_Department'];
            DepEdit.Text  := sp.Output['Name_Full'];

        end;
    end;

   sp.Free;

end;

procedure TAddPeopleToListForm.AllPeopleBtnClick(Sender: TObject);
begin
    ManEdit.Enabled:=false;
    ManEditCode.Enabled:=false;
    DepEdit.Enabled:=False;
    DepEditCode.Enabled:=False;
    VidOplPropButton.Enabled:=false;
end;

procedure TAddPeopleToListForm.ManSelBtnClick(Sender: TObject);
begin
    ManEdit.Enabled:=True;
    ManEditCode.Enabled:=True;
    DepEdit.Enabled:=False;
    DepEditCode.Enabled:=False;
    VidOplPropButton.Enabled:=false;
end;

procedure TAddPeopleToListForm.DepNameBtnClick(Sender: TObject);
begin
    ManEdit.Enabled:=False;
    ManEditCode.Enabled:=False;
    DepEdit.Enabled:=True;
    DepEditCode.Enabled:=True;
    VidOplPropButton.Enabled:=false;
end;

constructor TAddPeopleToListForm.Create(AOwner: TComponent; date_beg,
  date_end: TDateTime);
begin
     inherited Create(AOwner);
     DateBeg.DateTime:=Date_Beg;
     DateBeg.MinDate :=Date_Beg;
     HolDateBeg.DateTime:=Date_Beg;
     HolDateEnd.DateTime:=Date_End;

     DateEnd.DateTime:=Date_End;
     DateEnd.MaxDate :=Date_End;
end;

procedure TAddPeopleToListForm.ManEditCodeExit(Sender: TObject);
begin
     if ManEditCode.Enabled
     then GetMan;
end;

procedure TAddPeopleToListForm.DepEditCodeExit(Sender: TObject);
begin
      if DepEditCode.Enabled then GetDepartment;
end;

procedure TAddPeopleToListForm.RadioButton4Click(Sender: TObject);
begin
    ManEdit.Enabled:=False;
    ManEditCode.Enabled:=False;
    DepEdit.Enabled:=False;
    DepEditCode.Enabled:=False;
end;

procedure TAddPeopleToListForm.RadioButton1Click(Sender: TObject);
begin
    ManEdit.Enabled:=False;
    ManEditCode.Enabled:=False;
    DepEdit.Enabled:=False;
    DepEditCode.Enabled:=False;
    VidOplPropButton.Enabled:=false;
end;

procedure TAddPeopleToListForm.RadioButton2Click(Sender: TObject);
begin
    ManEdit.Enabled:=False;
    ManEditCode.Enabled:=False;
    DepEdit.Enabled:=False;
    DepEditCode.Enabled:=False;
    VidOplPropButton.Enabled:=false;
end;

procedure TAddPeopleToListForm.RadioButton3Click(Sender: TObject);
begin
    ManEdit.Enabled:=False;
    ManEditCode.Enabled:=False;
    DepEdit.Enabled:=False;
    DepEditCode.Enabled:=False;
    VidOplPropButton.Enabled:=false;
end;

procedure TAddPeopleToListForm.RadioButton5Click(Sender: TObject);
begin
    ManEdit.Enabled:=False;
    ManEditCode.Enabled:=False;
    DepEdit.Enabled:=False;
    DepEditCode.Enabled:=False;
    VidOplPropButton.Enabled:=true;
end;

procedure TAddPeopleToListForm.VidOplPropButtonPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Result:Variant;
begin
     Result:=LoadVOplProp(self,MainDM.MainDataBase.Handle,zfsModal,Fidvidoplprop);
     if (VarArrayDimCount(Result)>0)
     then begin
               Fidvidoplprop        :=Result[0];
               VidOplPropButton.Text:=Result[1];
     end;
end;

end.
