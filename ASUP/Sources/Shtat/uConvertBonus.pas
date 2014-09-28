unit uConvertBonus;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, uFControl, uLabeledFControl, uSpravControl,
    FIBQuery, pFIBQuery, FIBDatabase, pFIBDatabase, uFormControl;

type
    TConvertBonusForm = class(TForm)
        ShtatDoc: TqFSpravControl;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        Smeta: TqFSpravControl;
    FormControl: TqFFormControl;
        procedure ShtatDocOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure OkButtonClick(Sender: TObject);
    procedure SmetaOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    private
        DB: TpFIBDatabase;
    public
        constructor Create(AOwner: TComponent;DB: TpFIBDatabase); reintroduce;
    end;

var
    ConvertBonusForm: TConvertBonusForm;

implementation

{$R *.dfm}

uses qFTools, uCommonSp, GlobalSPR;

{ TConvertBonusForm }

constructor TConvertBonusForm.Create(AOwner: TComponent;DB: TpFIBDatabase);
begin
    inherited Create(AOwner);
    Self.DB := DB;
    FormControl.Prepare(DB, fmAdd, Null, Null);
end;

procedure TConvertBonusForm.ShtatDocOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    sp: TSprav;
begin
        // создать справочник
    sp := GetSprav('ASUP\ShtatDoc');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(DB.Handle);
                // модальный показ
            FieldValues['ShowStyle'] := 0;
                // единичная выборка
            FieldValues['Select'] := 1;
            Post;
        end;

                // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['Id_SR'];
            DisplayText := sp.Output['Name'];
        end;
        sp.Free;
    end;
end;

procedure TConvertBonusForm.OkButtonClick(Sender: TObject);
begin
    FormControl.OK;
end;

procedure TConvertBonusForm.SmetaOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    id:variant;
begin
    id := GlobalSPR.GetSmets(Owner, DB.Handle, Date, psmSmet);

    if ( VarArrayDimCount(id)>0 ) and ( id[0] <> Null ) then
    begin
        Value := id[0];
        DisplayText := IntToStr(id[3]) + '. ' + id[2];
   end;
end;

end.

