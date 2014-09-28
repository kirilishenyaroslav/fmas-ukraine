unit uTableRealSignerAdd;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, uSpravControl, uEnumControl, uFControl,
    uLabeledFControl, uCharControl, ExtCtrls, uTableSignersData, uFormControl,
    uDateControl, uLogicCheck, uSimpleCheck;

type
    TfmTableRealSignerAdd = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        Panel: TPanel;
        FormControl: TqFFormControl;
        Id_PCard: TqFSpravControl;
        DateBeg: TqFDateControl;
        DateEnd: TqFDateControl;
        qFSimpleCheck1: TqFSimpleCheck;
        procedure OkButtonClick(Sender: TObject);
        procedure Id_PCardOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
    private
    { Private declarations }
    public
    end;

var
    fmTableRealSignerAdd: TfmTableRealSignerAdd;

implementation

{$R *.dfm}

uses PCardsViewUnit, uDepartmentGroup, qFTools;

procedure TfmTableRealSignerAdd.OkButtonClick(Sender: TObject);
begin
    FormControl.Ok;
end;

procedure TfmTableRealSignerAdd.Id_PCardOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
begin
    SelectPCard(Value, DisplayText);
end;

initialization
    RegisterClass(TfmTableRealSignerAdd);

end.
