unit fmReqCertificateSmets;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ActnList, DB, FIBDataSet,
  pFIBDataSet,GlobalSPR, cxTextEdit, cxControls, cxContainer, cxEdit,
  cxCurrencyEdit, uCharControl, uFloatControl, uFControl, uLabeledFControl,
  uSpravControl, cxLabel;

type
  TReqCertificateSmets = class(TForm)
    ActionList1: TActionList;
    ok_act: TAction;
    cancel_act: TAction;
    Panel1: TPanel;
    Panel2: TPanel;
    SmetaSet: TpFIBDataSet;
    KodSmet: TEdit;
    NameSmet: TqFSpravControl;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    SumSmet: TcxTextEdit;
    cxLabel1: TcxLabel;
    SmetCheck: TCheckBox;
    procedure ok_actExecute(Sender: TObject);
    procedure cancel_actExecute(Sender: TObject);
    procedure OpenSpravSmetClick(Sender: TObject);
    procedure KodSmetChange(Sender: TObject);
    procedure KodSmetKeyPress(Sender: TObject; var Key: Char);
    procedure NameSmetOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure KodSmetKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SumSmetKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    id_smeta:integer;
  end;

var
  ReqCertificateSmets: TReqCertificateSmets;

implementation

{$R *.dfm}

uses fmAddReqCertificateUnit,fmReqCertificateUnit, fmHistSigns;

procedure TReqCertificateSmets.ok_actExecute(Sender: TObject);
begin
    //showmessage(inttostr(id_smeta));
    if NameSmet.DisplayText='' then
    begin
        showmessage('Ви не заповнили поле "Кошторис"');
        exit;
    end;
    if SumSmet.Text='' then
    begin
        showmessage('Ви не заповнили поле "Сума"');
        exit;
    end;

    ModalResult:=mrOk;
end;

procedure TReqCertificateSmets.cancel_actExecute(Sender: TObject);
begin
    ModalResult:=mrCancel;
end;

procedure TReqCertificateSmets.OpenSpravSmetClick(Sender: TObject);
var
    id: variant;

begin
 { id := GlobalSPR.GetSmets(Self, TfrmAddMoving(Owner).Database.Handle, now, psmSmet);

    If (VarArrayDimCount(id) > 0) And (id[0] <> Null)
        Then
        Begin                                      psmSmetWithoutPeriod
            Value := id[0];
            DisplayText := IntToStr(id[3]) + '. ' + id[2];
        End;
             }

    id := GlobalSPR.GetSmets(Self, {TfmReqCertificate(Owner).LocalDatabase.Handle}SmetaSet.Database.Handle, Date, psmSmetWithoutPeriod);
    if (VarArrayDimCount(id) > 0) and (id[0] <> Null) then
    begin
        //id_smeta:= strtoint();
        KodSmet.Text:=id[0];
        NameSmet.DisplayText := IntToStr(id[3]) + '. ' + id[2];
    end;
end;

procedure TReqCertificateSmets.KodSmetChange(Sender: TObject);
var sm:Integer;
begin
    if KodSmet.Text='' then exit;
    sm:=strtoint(kodSmet.Text);
    SmetaSet.close;
    SmetaSet.SQLs.SelectSQL.Text:='Select * from UP_REQ_CERT_SMET_SEL(:sm)';
    SmetaSet.ParamByName('sm').AsInteger:=sm;
    SmetaSet.Open;
    if  VarIsNull(SmetaSet['SM_NAME']) then exit else
    NameSmet.DisplayText:=SmetaSet['SM_NAME'];
    id_smeta:=SmetaSet['ID_SM'];
    if NameSmet.Value<>'' then   NameSmet.Asterisk:=false else  NameSmet.Asterisk:=true;
    //showmessage(inttostr(id_smeta));
end;

procedure TReqCertificateSmets.KodSmetKeyPress(Sender: TObject;
  var Key: Char);
begin

    if (key in ['0'..'9']) or (key=#8) then KodSmet.ReadOnly:=false
    else  KodSmet.ReadOnly:=true;
end;

procedure TReqCertificateSmets.NameSmetOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
  var id:Variant;
begin
    id := GlobalSPR.GetSmets(Self, {TfmReqCertificate(Owner).LocalDatabase.Handle}SmetaSet.Database.Handle, Date, psmSmetWithoutPeriod);
    if (VarArrayDimCount(id) > 0) and (id[0] <> Null) then
    begin
        //id_smeta:= strtoint();
        KodSmet.Text:=id[0];
        DisplayText := IntToStr(id[3]) + '. ' + id[2];
    end;
   if NameSmet.DisplayText<>'' then   NameSmet.Asterisk:=false else  NameSmet.Asterisk:=true;
end;

procedure TReqCertificateSmets.KodSmetKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = VK_Return then SumSmet.SetFocus;
end;

procedure TReqCertificateSmets.SumSmetKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = VK_Return then BtnOk.SetFocus;
end;

end.
