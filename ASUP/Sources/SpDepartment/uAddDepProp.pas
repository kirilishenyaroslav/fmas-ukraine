unit uAddDepProp;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uDateControl, uFControl, uLabeledFControl, uSpravControl,
    StdCtrls, Buttons, uDepartmentsData, uFormControl, uLogicCheck,
    uSimpleCheck, uBoolControl;

type
    TfmAddDepProp = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        Id_Property: TqFSpravControl;
        Date_Beg: TqFDateControl;
        Date_End: TqFDateControl;
        FormControl: TqFFormControl;
        qFSimpleCheck1: TqFSimpleCheck;
        Including: TqFBoolControl;
        procedure OkButtonClick(Sender: TObject);
        procedure Id_PropertyOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
    private
        { Private declarations }
    public
        DM: TdmDepartments;
    end;

var
    fmAddDepProp: TfmAddDepProp;

implementation

{$R *.dfm}

uses uSelectForm;

procedure TfmAddDepProp.OkButtonClick(Sender: TObject);
begin
    FormControl.Ok;
end;

procedure TfmAddDepProp.Id_PropertyOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
begin
    if qSelect(DM.SpDepProp) then
    begin
        Value := DM.SpDepProp['Id_Property'];
        DisplayText := DM.SpDepProp['Name_Property'];
    end;
end;

end.

