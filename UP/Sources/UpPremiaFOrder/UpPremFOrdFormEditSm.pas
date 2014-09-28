unit UpPremFOrdFormEditSm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFControl, uLabeledFControl, uSpravControl, StdCtrls, Buttons,
  GlobalSPR, qFTools, uCommonSP, uCharControl, uFloatControl, uIntControl,
  DB, FIBDataSet, pFIBDataSet, cxControls, cxContainer, cxEdit, cxCheckBox,
  AppEvnts, cxLabel, cxDBLabel, ActnList;

type
  TfmChangeSmeta = class(TForm)
    Smeta: TqFSpravControl;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    NumSm: TqFIntControl;
    PubSprSmet: TpFIBDataSet;
    PubSprSmetID_SMETA: TFIBBCDField;
    PubSprSmetSMETA_TITLE: TFIBStringField;
    PubSprSmetSMETA_KOD: TFIBIntegerField;
    EditSumaForAll: TcxCheckBox;
    Summa: TqFFloatControl;
    ActionList1: TActionList;
    OKBut: TAction;
    EditBudgetForAll: TcxCheckBox;
    EditForAllPeople: TcxCheckBox;
    procedure SmetaOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure FormCreate(Sender: TObject);
    procedure NumSmChange(Sender: TObject);
    procedure OKButExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UpPremiaFOrderForm;

{$R *.dfm}

procedure TfmChangeSmeta.SmetaOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    id:variant; 
begin
    id := GlobalSPR.GetSmets(Owner, TfmPremiaOrder(Owner).WorkDatabase.Handle, Date, psmSmetWithoutPeriod);

    if ( VarArrayDimCount(id)>0 ) and ( id[0] <> Null ) then
    begin
        Value := id[0];
        DisplayText := IntToStr(id[3]) + '. ' + id[2];
    end;
end;

procedure TfmChangeSmeta.FormCreate(Sender: TObject);
begin
    //if (TfmPremiaOrder(self.Owner).IdType.Value=2) then Percent.Blocked:=True;
    //if (TfmPremiaOrder(self.Owner).IdType.Value=1) then Percent.Blocked:=False;
      {if  TfmPremiaOrder(Owner).RadioButton1.Checked
      then begin
                Summa.DisplayName   :='Відсоток';
      end
      else begin
                Summa.DisplayName   :='Сума';
      end;}
end;

procedure TfmChangeSmeta.NumSmChange(Sender: TObject);
begin
    if VarIsNull(NumSm.Value)
        then exit;

    try

        PubSprSmet.Database:=TfmPremiaOrder(self.Owner).WorkDatabase;
        PubSprSmet.Transaction:=TfmPremiaOrder(self.Owner).ReadTransaction;
        PubSprSmet.UpdateTransaction:=TfmPremiaOrder(self.Owner).ReadTransaction;
        PubSprSmet.Close;
        PubSprSmet.ParamByName('smeta_kod').AsInteger := StrToInt(NumSm.Value);
        PubSprSmet.Open;
        PubSprSmet.FetchAll;

        if PubSprSmet.RecordCount = 1 then
        begin
            Smeta.Value := PubSprSmet['ID_SMETA'];
            Smeta.DisplayText := IntToStr(PubSprSmet['SMETA_KOD']) +
                '. ' + PubSprSmet['SMETA_TITLE'];
        end;
        
    except on e: Exception do
            ShowMessage(e.Message);
    end;
end;

procedure TfmChangeSmeta.OKButExecute(Sender: TObject);
begin
     if not qFCheckAll(Self) then exit;
     ModalResult := mrOk;
end;

end.
