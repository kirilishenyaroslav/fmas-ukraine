unit uUpParamSvod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxDropDownEdit,
  cxCalendar, cxLabel, cxTextEdit, cxMaskEdit, cxButtonEdit, cxControls,
  cxContainer, cxEdit, cxCheckBox, ActnList, ExtCtrls;

type
  TDmParamSvod = class(TForm)
    cxButtonParam: TcxButton;
    cxButtonDraft: TcxButton;
    cxKodSm: TcxCheckBox;
    KodSmEdit: TcxButtonEdit;
    LabelDateForm: TcxLabel;
    WorkDay: TcxMaskEdit;
    ActionList1: TActionList;
    OKAction: TAction;
    CancelAction: TAction;
    SetkaButton: TcxButton;
    SetkaAction: TAction;
    MonthesList: TcxComboBox;
    RadioGroup1: TRadioGroup;
    PanelParam: TPanel;
    cxComboBox1: TcxComboBox;
    procedure SetkaActionExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxKodSmClick(Sender: TObject);
    procedure KodSmEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure CancelActionExecute(Sender: TObject);
    procedure OKActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    PKodSm:integer;
  end;

 const MonthesList_Text:string =('Січень'+#13+'Лютий'+#13+'Березень'+#13+
                             'Квітень'+#13+'Травень'+#13+'Червень'+#13+
                             'Липень'+#13+'Серпень'+#13+'Вересень'+#13+
                             'Жовтень'+#13+'Листопад'+#13+'Грудень');
var
  DmParamSvod: TDmParamSvod;

implementation

uses GlobalSPR, dmReportSvod,uUpSetkaSvod;

{$R *.dfm}

procedure TDmParamSvod.SetkaActionExecute(Sender: TObject);
begin
    with  TdmSetka.Create(self) do
     begin
          ShowModal;
          Free;
     end;
end;

procedure TDmParamSvod.FormCreate(Sender: TObject);
begin
   MonthesList.Properties.Items.Text     := MonthesList_Text;

  { DB.Handle := ADB_Handle;
  ReadTransaction.StartTransaction;
 if PParameter.Kod_Setup=0 then
  begin
   DSet.SQLs.SelectSQL.Text              := 'SELECT * FROM Z_KOD_SETUP_RETURN';
   DSet.Open;
   YearSpinEdit.Value:=YearMonthFromKodSetup(DSet.FieldValues['KOD_SETUP']);
   MonthesList.ItemIndex:= YearMonthFromKodSetup(DSet.FieldValues['KOD_SETUP'],false)-1;
  end
  else
  begin
   YearSpinEdit.Value:=YearMonthFromKodSetup(PParameter.Kod_Setup);
   MonthesList.ItemIndex:= YearMonthFromKodSetup(PParameter.Kod_Setup,false)-1;
   CheckBoxKodSetup.Checked := True;
   BoxKodSetup.Enabled := True;
  end;      }

end;

procedure TDmParamSvod.cxKodSmClick(Sender: TObject);
begin
 KodSmEdit.Enabled:=cxKodSm.Checked;
end;

procedure TDmParamSvod.KodSmEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Smeta:Variant;
begin
    Smeta:=GetSmets(self,DM.DB.Handle,Date,psmSmet);
    if VarArrayDimCount(Smeta)> 0 then
    If Smeta[0]<>NULL then
    begin
        KodSmEdit.Text := Smeta[2];
        PKodSm := Smeta[0];
        KodSmEdit.Text := Smeta[2];
    end;
end;

procedure TDmParamSvod.CancelActionExecute(Sender: TObject);
begin
   ModalResult:=mrNo;
end;

procedure TDmParamSvod.OKActionExecute(Sender: TObject);
begin
    ModalResult := mrOk;
end;

end.
