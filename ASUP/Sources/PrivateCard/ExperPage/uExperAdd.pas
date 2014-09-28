unit uExperAdd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, CheckEditUnit, ComCtrls, SpComboBox, Variants,
  DB, IBCustomDataSet, FIBDataSet, pFIBDataSet, FieldControl, SpFormUnit,
  EditControl, SpCommon, uCharControl, uDateControl, uCommonSp,
  uFControl, uLabeledFControl, uSpravControl, uFormControl, FIBDatabase,
  pFIBDatabase, uInvisControl, uExperDataModule, uIntControl, uBoolControl,
  cxControls, cxContainer, cxEdit, cxCheckBox;

type
  TExperForm = class(TForm)
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    qFDC_DBeg: TqFDateControl;
    qFSC_Type: TqFSpravControl;
    qFIC_Years: TqFIntControl;
    qFIC_Month: TqFIntControl;
    qFIC_Day: TqFIntControl;
    qFBC_Recalc: TcxCheckBox;
    procedure OkButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    procedure Focus(Sender: TObject);
    procedure qFSC_TypeOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
  private
    { Private declarations }
  public
 	  id,idpcard:Integer;
  	Mode:TFormMode;
    DM: TdmExper;
    BirthDate: TDate;
    constructor Create(DMod: TdmExper; Mode: TFormMode; Where: Variant; id_pcard:Variant);
  end;

var
  ExperForm: TExperForm;

implementation
uses  uUnivSprav, RxmemDs, uSP_Staj;
{$R *.DFM}

constructor TExperForm.Create(DMod: TdmExper; Mode: TFormMode; Where: Variant; id_pcard:Variant);
begin
  inherited Create(Nil);
	Self.Mode := Mode;
  Self.DM:=TdmExper.Create(Self);
  Self.DM:=DMod;
 // qFIC_Pcard.SetValue(id_pcard);
  id:=id_pcard;
 // qFFC_Exper.Prepare(DM.DB,Mode,Where,Null);
  //qFIC_Pcard.SetValue(id_pcard);
end;

procedure TExperForm.Focus(Sender: TObject);
begin
	if Sender is TWinControl then
		if (Sender as TWinControl).TabStop = False then
			OkButton.SetFocus;
end;

procedure TExperForm.FormActivate(Sender: TObject);
begin
	OkButton.SetFocus;
end;


procedure TExperForm.OkButtonClick(Sender: TObject);
begin
  ModalResult:=mrOK;
 // qFFC_Exper.Ok;
end;

procedure TExperForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	Action := caFree;
end;

procedure TExperForm.CancelButtonClick(Sender: TObject);
begin
	Close;
end;

procedure TExperForm.qFSC_TypeOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
      T:TfmSP_Staj;
begin
     T := TfmSP_Staj.Create(Self,1,DM.DB.Handle);
     T.Caption:='Вид стажу';
     if T.ShowModal=mrYes
     then begin
          // ShowMessage(T.staj_name);
           Value:=T.id_staj;
           DisplayText:=T.staj_name;
     end;
     T.Free;
{   InsertProcName:='Ini_Staj_Insert';
		UpdateProcName:='Ini_Satj__Update';
		DeleteProcName:='Ini_Satj_Delete';}
end;

end.
