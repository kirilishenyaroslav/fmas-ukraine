unit fmChangeSmetaUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFControl, uLabeledFControl, uSpravControl, StdCtrls, Buttons,
  GlobalSPR, qFTools, uCommonSP;

type
  TfmChangeSmeta = class(TForm)
    Smeta: TqFSpravControl;
    SmetaPps: TqFSpravControl;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    procedure SmetaOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure SmetaPpsOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure OkButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmChangeSmeta: TfmChangeSmeta;

implementation

uses fmBonusOrderUnit;

{$R *.dfm}

procedure TfmChangeSmeta.SmetaOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    id:variant;
begin
    id := GlobalSPR.GetSmets(Owner, fmBonusOrder.LocalDatabase.Handle, fmBonusOrder.DateOrder, psmSmet);

    if ( VarArrayDimCount(id)>0 ) and ( id[0] <> Null ) then
    begin
        Value := id[0];
        DisplayText := IntToStr(id[3]) + '. ' + id[2];
   end;
end;

procedure TfmChangeSmeta.SmetaPpsOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    id:variant;
begin
    id := GlobalSPR.GetSmets(Owner, fmBonusOrder.LocalDatabase.Handle, fmBonusOrder.DateOrder, psmSmet);

    if ( VarArrayDimCount(id)>0 ) and ( id[0] <> Null ) then
    begin
        Value := id[0];
        DisplayText := IntToStr(id[3]) + '. ' + id[2];
   end;
end;

procedure TfmChangeSmeta.OkButtonClick(Sender: TObject);
begin
    if not qFCheckAll(Self) then exit;

    ModalResult := mrOk;
end;

end.
