unit uPochasTarifPercAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFControl, uLabeledFControl, uCharControl, StdCtrls, Buttons,
  uSpravControl, uFloatControl, uDateControl, cxControls, cxGroupBox,
  uCommonSp;

type
  TfrmPochasPercAdd = class(TForm)
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    cxGroupBox1: TcxGroupBox;
    TarifTypeEdit: TqFSpravControl;
    DateBegEdit: TqFDateControl;
    DateEndEdit: TqFDateControl;
    PercentEdit: TqFFloatControl;
    procedure OkButtonClick(Sender: TObject);
    procedure TarifTypeEditOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation
uses qfTools, uPochasTarifPerc;
{$R *.dfm}

procedure TfrmPochasPercAdd.OkButtonClick(Sender: TObject);
begin
 if qFCheckAll(Self) then ModalResult := mrOk;
end;

procedure TfrmPochasPercAdd.TarifTypeEditOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
  sp: TSprav;
begin
  sp :=  GetSprav('up\PochasTarifType');
  if sp <> nil then
  begin
    sp.Input.Append;
    sp.Input.FieldValues['DBHandle'] := Integer(TfrmPochasPerc(owner).Database.Handle);
    sp.Input.FieldValues['FormStyle'] := fsNormal;
    sp.Input.Post;
    sp.Show;
    if (sp.Output <> nil) and (not sp.Output.IsEmpty) then
    begin
      Value := sp.Output['ID_TARIF_TYPE'];
      DisplayText := sp.Output['TARIF_TYPE_NAME'];
    end;
    sp.Free;
  end;
end;


end.
