unit uAddDefaultSmeta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFControl, uLabeledFControl, uSpravControl, StdCtrls, Buttons,
  uFormControl, uInvisControl, uCharControl, uFloatControl, uShtatDocData,
  ActnList;

type
  TfmAddDefaultSmeta = class(TForm)
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    Smeta: TqFSpravControl;
    Percent: TqFFloatControl;
    Id_SR: TqFInvisControl;
    FormControl: TqFFormControl;
    ActionList: TActionList;
    AcceptAction: TAction;
    QuitAction: TAction;
    procedure SmetaOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure AcceptActionExecute(Sender: TObject);
    procedure QuitActionExecute(Sender: TObject);
  private
  public
     Data: TdmShtatDoc;
  end;

var
  fmAddDefaultSmeta: TfmAddDefaultSmeta;

implementation

{$R *.dfm}

uses GlobalSPR;

procedure TfmAddDefaultSmeta.SmetaOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    id:variant;
begin
    id := GlobalSPR.GetSmets(Owner, Data.DB.Handle, Date, psmSmet);

    if ( VarArrayDimCount(id)>0 ) and ( id[0] <> Null ) then
    begin
        Value := id[0];
        DisplayText := IntToStr(id[3]) + '. ' + id[2];
   end;
end;

procedure TfmAddDefaultSmeta.AcceptActionExecute(Sender: TObject);
begin
    FormControl.Ok;
end;

procedure TfmAddDefaultSmeta.QuitActionExecute(Sender: TObject);
begin
    Close;
end;

initialization
    RegisterClass(TfmAddDefaultSmeta);

end.
