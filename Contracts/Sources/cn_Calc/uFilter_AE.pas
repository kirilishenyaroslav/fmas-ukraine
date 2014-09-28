unit uFilter_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DM_Calc, IBase, cxLookAndFeelPainters, cxCurrencyEdit,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit,
  StdCtrls, cxButtons, ExtCtrls, cxDropDownEdit;

type
  TfrmFilter_AE = class(TForm)
    Label6: TLabel;
    Panel1: TPanel;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    Panel2: TPanel;
    FacLabel: TLabel;
    SpecLabel: TLabel;
    FormStudLabel: TLabel;
    NacLabel: TLabel;
    KatLabel: TLabel;
    FacultyText: TcxButtonEdit;
    SpecialityText: TcxButtonEdit;
    FormStudText: TcxButtonEdit;
    NacText: TcxButtonEdit;
    KatText: TcxButtonEdit;
    Label1: TLabel;
    KursStud: TcxComboBox;
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure FaculPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure SpecialityTextPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Form_StudPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure GragdTextPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure KategoryTextPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    DM:TDM_Calc;
  public
    id_facul, id_spec, id_form_stud, id_kat_stud, id_nac, kurs: int64;
    Db_Handle:TISC_DB_HANDLE;
  end;

var
  frmFilter_AE: TfrmFilter_AE;

implementation

uses uGetParamValue_calc, uCalc;
{$R *.dfm}


procedure TfrmFilter_AE.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmFilter_AE.OkButtonClick(Sender: TObject);
begin
  kurs:=StrToInt(KursStud.text);
  if (FacultyText.text='')and
     (SpecialityText.text='')and
     (NacText.text='')and
     (FormStudText.text='')and
     (KatText.text='')
   then
    begin
     ShowMessage('Необхідно заповнити хочаб одне з полів!!');
     Exit;
    end;

  ModalResult:=mrOk;
end;

procedure TfrmFilter_AE.FaculPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var T:TfrmGetParamValue_calc;
begin
  T:=TfrmGetParamValue_calc.Create(self, 0,nil,DB_Handle);
  if T.ShowModal=mrOk then
   begin
    FacultyText.Text      :=T.ResultText;
    id_facul              :=T.ResultId;
   end;
  T.Free;
end;

procedure TfrmFilter_AE.SpecialityTextPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var T:TfrmGetParamValue_calc;
begin
  T:=TfrmGetParamValue_calc.Create(self, 1,VarArrayOf([Id_Facul]),DB_Handle);
  if T.ShowModal=mrOk
   then
    begin
     SpecialityText.Text      :=T.ResultText;
     Id_Spec                  :=T.ResultId;
     NacText.SetFocus;
    end;
  T.Free;
end;

procedure TfrmFilter_AE.Form_StudPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var T:TfrmGetParamValue_calc;
begin
  T:=TfrmGetParamValue_calc.Create(self, 2,nil,DB_Handle);
  if T.ShowModal=mrOk
   then
    begin
     FormStudText.Text      :=T.ResultText;
     id_form_stud           :=T.ResultId;
     KatText.SetFocus;
    end;
  T.Free;
end;

procedure TfrmFilter_AE.GragdTextPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);

var
  T:TfrmGetParamValue_calc;
begin
  T:=TfrmGetParamValue_calc.Create(self, 3,nil,DB_Handle);
  if T.ShowModal=mrOk
   then
    begin
     NacText.Text      :=T.ResultText;
     id_Nac            :=T.ResultId;
     FormStudText.SetFocus;
    end;
  T.Free;
end;

procedure TfrmFilter_AE.KategoryTextPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var T:TfrmGetParamValue_calc;
begin
  T:=TfrmGetParamValue_calc.Create(self, 4,nil,DB_Handle);
  if T.ShowModal=mrOk
   then
    begin
     KatText.Text      :=T.ResultText;
     id_kat_stud       :=T.ResultId;
     KursStud.SetFocus;
    end;
  T.Free;
end;

procedure TfrmFilter_AE.FormCreate(Sender: TObject);
begin
  id_facul:=-1;
  id_spec:=-1;
  id_nac:=-1;
  id_form_stud:=-1;
  id_kat_stud:=-1;
  kurs:=-1;
end;

procedure TfrmFilter_AE.FormShow(Sender: TObject);
begin
  if kurs=-1
   then KursStud.ItemIndex:=0
   else KursStud.ItemIndex:=kurs;
end;

end.
