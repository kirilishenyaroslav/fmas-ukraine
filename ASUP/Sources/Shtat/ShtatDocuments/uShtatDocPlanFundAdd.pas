unit uShtatDocPlanFundAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, uFControl, uLabeledFControl,
  uCharControl, uIntControl, uFloatControl, uSpravControl, uShtatDocData,
  uFormControl;

type
  TfmShtatDocPlanFundAdd = class(TForm)
    Panel1: TPanel;
    OkButton: TBitBtn;
    Panel2: TPanel;
    CancelButton: TBitBtn;
    IdSRFundType: TqFSpravControl;
    Smeta: TqFSpravControl;
    Summa: TqFFloatControl;
    FormControl: TqFFormControl;
    procedure SmetaOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String );
    procedure IdSRFundTypeOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure FormControlModifyRecordAfterPrepare(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure ReCalcButtonClick(Sender: TObject);
  private
  public
      DM: TdmShtatDoc;
  end;

var
  fmShtatDocPlanFundAdd: TfmShtatDocPlanFundAdd;

implementation

{$R *.dfm}

uses GlobalSPR, uSelectForm, NagScreenUnit;

procedure TfmShtatDocPlanFundAdd.SmetaOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    id:variant;
begin
    id := GlobalSPR.GetSmets(Owner, DM.DB.Handle, Date, psmSmet);

    if ( VarArrayDimCount(id)>0 ) and ( id[0] <> Null ) then
    begin
        Value := id[0];
        DisplayText := IntToStr(id[3]) + '. ' + id[2];
   end;
end;

procedure TfmShtatDocPlanFundAdd.IdSRFundTypeOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
begin
    if qSelect(DM.SRFundType) then
    begin
        Value := DM.SRFundType['Id_SR_Fund_Type'];
        DisplayText := DM.SRFundType['Name_SR_Fund_Type'];
    end;
end;

procedure TfmShtatDocPlanFundAdd.FormControlModifyRecordAfterPrepare(
  Sender: TObject);
begin
    Smeta.Blocked := True;
    IdSRFundType.Blocked := True;
end;

procedure TfmShtatDocPlanFundAdd.OkButtonClick(Sender: TObject);
begin
    FormControl.Ok;
end;

procedure TfmShtatDocPlanFundAdd.ReCalcButtonClick(Sender: TObject);
var
    NagScreen: TNagScreen;
begin
    with DM do
    begin
        NagScreen := TNagScreen.Create(Self);
        NagScreen.Show;
        NagScreen.SetStatusText('Відбувається підрахунок фондів...');

        if VarIsNull(Id_Session) then
        begin
            MakeMFundTable.ParamByName('Id_SR').AsInteger := ShtatDocSelect['Id_SR'];
            MakeMFundTable.Open;
            Id_Session := MakeMFundTable['Id_Session'];
        end;

        NagScreen.Free;

        with CalcFund do
        begin
            Close;
            ParamByName('Id_Session').AsInteger := Id_Session;
            ParamByName('Id_SR_Fund_Type').AsInteger := IdSRFundType.Value;
            ParamByName('Id_Smeta').AsInteger := Smeta.Value;
           // ParamByName('Percent').AsInteger := Percent.Value;
            Open;
            Summa.Value := FieldValues['Fund'];
        end;
    end;
end;

initialization
    RegisterClass(TfmShtatDocPlanFundAdd);

end.
