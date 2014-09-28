unit fmAddPochasTarifUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, StdCtrls, Buttons, uFormControl, uCharControl,
  uFloatControl, uDateControl, uFControl, uLabeledFControl, uSpravControl,
  GlobalSPR, uSelectForm;

type
  TfmAddPochasTarif = class(TForm)
    FormControl: TqFFormControl;
    OkButton: TBitBtn;
    KeyList: TActionList;
    OkAction: TAction;
    CancelAction: TAction;
    CancelButton: TBitBtn;
    Smeta: TqFSpravControl;
    PeriodBeg: TqFDateControl;
    PeriodEnd: TqFDateControl;
    KolHours: TqFFloatControl;
    Tarif: TqFSpravControl;
    procedure SmetaOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure TarifOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure CancelActionExecute(Sender: TObject);
    procedure OkActionExecute(Sender: TObject);
    procedure FormControlNewRecordAfterPrepare(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmAddPochasTarif: TfmAddPochasTarif;

implementation

uses fmSpPochasTarifUnit;

{$R *.dfm}

procedure TfmAddPochasTarif.SmetaOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    id : Variant;
begin
    id := GlobalSPR.GetSmets(Owner, fmSpPochasTarif.LocalDatabase.Handle, fmSpPochasTarif.SpDate, psmSmet);

    if ( VarArrayDimCount(id)>0 ) and ( id[0] <> Null ) then
    begin
        Value := id[0];
        DisplayText := IntToStr(id[3]) + '. ' + id[2];
   end; 
end;

procedure TfmAddPochasTarif.TarifOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
begin
    if qSelect(fmSpPochasTarif.SelectTarifType , 'Виберіть тип тарифікації') then begin
        Value := fmSpPochasTarif.SelectTarifTypeID_TARIF_TYPE.Value;
        DisplayText := fmSpPochasTarif.SelectTarifTypeTARIF_TYPE_NAME.Value;
    end;
end;

procedure TfmAddPochasTarif.CancelActionExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmAddPochasTarif.OkActionExecute(Sender: TObject);
begin
    FormControl.Ok;
end;

procedure TfmAddPochasTarif.FormControlNewRecordAfterPrepare(
  Sender: TObject);
var
    y, d ,m : Word;
begin
    DecodeDate(Date, y, m, d);

    PeriodBeg.Value := EncodeDate(y, 1, 1);
    PeriodEnd.Value := StrToDate('31.12.2150');
end;

initialization
    RegisterClass(TfmAddPochasTarif);

end.
