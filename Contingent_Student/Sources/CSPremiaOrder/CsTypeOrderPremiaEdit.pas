unit CsTypeOrderPremiaEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, DB, FIBDataSet, pFIBDataSet, uFloatControl,
  uCharControl, uIntControl, StdCtrls, Buttons, uFControl,
  uLabeledFControl, uSpravControl, uCommonSP, GlobalSPR, AllPeopleUnit,
  cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxButtonEdit, cxLookAndFeelPainters, cxButtons, uCs_types, uCS_Loader,
  cxCheckBox;

type
  TFCsTypeOrderPremiaEdit = class(TForm)
    PubSprSmet: TpFIBDataSet;
    PubSprSmetID_SMETA: TFIBBCDField;
    PubSprSmetSMETA_TITLE: TFIBStringField;
    PubSprSmetSMETA_KOD: TFIBIntegerField;
    ActionList1: TActionList;
    OKBut: TAction;
    IdType: TcxComboBox;
    EditVidOpl: TcxButtonEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    BtnEditSmeta: TcxButtonEdit;
    cxLabel1: TcxLabel;
    LabelSmeta: TcxLabel;
    cxLabel5: TcxLabel;
    MaskEditSumma: TcxMaskEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxLabel4: TcxLabel;
    MEReason: TcxMaskEdit;
    cxLabel6: TcxLabel;
    MENote: TcxMaskEdit;
    CBReason: TcxCheckBox;
    procedure NumSmChange(Sender: TObject);
    procedure NumSmKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SummaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditVidOplPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure BtnEditSmetaPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure BtnEditSmetaPropertiesEditValueChanged(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure IdTypePropertiesEditValueChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function proverka : Boolean;
  private
    FIOText:String;
    ID_VIDOPL:Int64;
    ID_SMETA :Int64;
    ID_VIDOPL_CONTINGENT:Int64;
  public
    property PID_VIDOPL:Int64 read ID_VIDOPL write ID_VIDOPL;
    property pFIOText:String read FIOText write FIOText;
    property PID_SMETA:Int64 read ID_SMETA write ID_SMETA;
    property PID_VIDOPL_CONTINGENT:Int64 read ID_VIDOPL_CONTINGENT write ID_VIDOPL_CONTINGENT;
  end;

var
  FCsTypeOrderPremiaEdit: TFCsTypeOrderPremiaEdit;

implementation

uses CsTypeOrderPremiaDM;

{$R *.dfm}

procedure TFCsTypeOrderPremiaEdit.NumSmChange(Sender: TObject);
begin
    {}
end;

procedure TFCsTypeOrderPremiaEdit.NumSmKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    {If Key = VK_RETURN Then
        Summa.ShowFocus;}
end;

procedure TFCsTypeOrderPremiaEdit.SummaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    {If Key = VK_RETURN Then
        OkButton.SetFocus;}
end;

procedure TFCsTypeOrderPremiaEdit.EditVidOplPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Param:TcsPaymentTypeParam;
begin
  Param:=TcsPaymentTypeParam.Create;
  Param.DB_Handle:=DMFCsTypeOrderPremiaMain.WorkDatabase.Handle;
  Param.Owner := self;
  Param.ID_TYPE_CALC := IdType.ItemIndex;
  Param.Mode:=  [CSSelect,CSEdit];
  LoadPaymentTypePackage(Param, CSPaymentType);
  EditVidOpl.Text         :=Param.NAME_PAYMENT_TYPE;
  PID_VIDOPL_CONTINGENT   :=Param.ID_PAYMENT_TYPE;
  PID_VIDOPL              :=Param.ID_VIDOPL;
  IdType.ItemIndex        :=Param.ID_TYPE_CALC;
end;

procedure TFCsTypeOrderPremiaEdit.BtnEditSmetaPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
Var
    id: variant;
Begin
    id := GlobalSPR.GetSmets(Owner, DMFCsTypeOrderPremiaMain.WorkDatabase.Handle, Date, psmSmetWithoutPeriod);

    If (VarArrayDimCount(id) > 0) And (id[0] <> Null) Then
    Begin
        PId_Smeta := id[0];
        LabelSmeta.Caption := IntToStr(id[3]) + '. ' + id[2];
        BtnEditSmeta.Text:=IntToStr(id[3]);
    End;
end;

procedure TFCsTypeOrderPremiaEdit.BtnEditSmetaPropertiesEditValueChanged(
  Sender: TObject);
begin
  If (BtnEditSmeta.Text='')
        Then
        exit;

    Try

        PubSprSmet.Database := DMFCsTypeOrderPremiaMain.WorkDatabase;
        PubSprSmet.Transaction := DMFCsTypeOrderPremiaMain.ReadTransaction;
        PubSprSmet.UpdateTransaction := DMFCsTypeOrderPremiaMain.ReadTransaction;
        PubSprSmet.Close;
        PubSprSmet.SelectSQL.Text:='select *  from pub_spr_smeta where smeta_kod = :smeta_kod';
        PubSprSmet.ParamByName('smeta_kod').AsInteger := StrToInt(BtnEditSmeta.Text);
        PubSprSmet.Open;
        PubSprSmet.FetchAll;





        If PubSprSmet.RecordCount = 1 Then
        Begin
            PId_Smeta := PubSprSmet['ID_SMETA'];
            LabelSmeta.Caption := IntToStr(PubSprSmet['SMETA_KOD']) +
                '. ' + PubSprSmet['SMETA_TITLE'];
            BtnEditSmeta.Text:=IntToStr(PubSprSmet['SMETA_KOD'])
        End;

    Except On e: Exception Do
            ShowMessage(e.Message);
    End;
end;

procedure TFCsTypeOrderPremiaEdit.cxButton1Click(Sender: TObject);
begin
    if proverka then
    ModalResult:=mrOk;
end;

procedure TFCsTypeOrderPremiaEdit.cxButton2Click(Sender: TObject);
begin
    ModalResult:=mrCancel;
end;

procedure TFCsTypeOrderPremiaEdit.IdTypePropertiesEditValueChanged(
  Sender: TObject);
begin
  if TcxComboBox(Sender).ItemIndex=0 then
  begin
    MENote.Enabled:=True;
    CBReason.Enabled:=False;
    MEReason.Enabled:=False;
  end
  else if TcxComboBox(Sender).ItemIndex=1 then
  begin
    MENote.Enabled  :=False;
    CBReason.Enabled:=True;
    MEReason.Enabled:=True;
  end;

{  EditVidOpl.Text         :='';
  PID_VIDOPL_CONTINGENT   :=-1;
  PID_VIDOPL              :=-1;}
end;

procedure TFCsTypeOrderPremiaEdit.FormCreate(Sender: TObject);
begin

 IdType.ItemIndex  :=0; 

 MENote.Enabled    :=True;
 CBReason.Enabled  :=False;
 MEReason.Enabled  :=False;

 PId_Smeta:=-1;
 PID_VIDOPL_CONTINGENT:= -1;
 PID_VIDOPL := -1;

end;

function TFCsTypeOrderPremiaEdit.proverka: Boolean;
begin
  result:=True;
  if (PID_VIDOPL_CONTINGENT = -1) or (PID_VIDOPL = -1)  then
  begin
    showMessage('Не всі данні заповнені');
    result:=false;
  end;

  if (PId_Smeta = -1) then
  begin
    showMessage('Не всі данні заповнені');
    result:=false;
  end;

  if (MaskEditSumma.Text = '') then
  begin
    showMessage('Не всі данні заповнені');
    result:=false;
  end;



end;

end.
