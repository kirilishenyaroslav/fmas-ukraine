unit uTableSignerAdd;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, uSpravControl, uEnumControl, uFControl,
    uLabeledFControl, uCharControl, ExtCtrls, uTableSignersData, uFormControl;

type
    TfmTableSignerAdd = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        Panel: TPanel;
        FIO: TqFCharControl;
        Name_Post: TqFCharControl;
        Kind: TqFEnumControl;
        Id: TqFSpravControl;
        FormControl: TqFFormControl;
        procedure KindChange(Sender: TObject);
        procedure IdOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure OkButtonClick(Sender: TObject);
        procedure FormShow(Sender: TObject);
    private
    { Private declarations }
    public
    end;

var
    fmTableSignerAdd: TfmTableSignerAdd;

implementation

{$R *.dfm}

uses DepartmentsViewUnit, uDepartmentGroup, qFTools;

procedure TfmTableSignerAdd.KindChange(Sender: TObject);
begin
    case Kind.Value of
        0:
            begin
                Id.Value := 0;
                Id.Visible := False;
            end;
        1, 4:
            begin
                Id.DisplayName := 'Підрозділ';
                Id.Visible := True;
                Id.Clear;
            end;
        2:
            begin
                Id.DisplayName := 'Група підрозділів';
                Id.Visible := True;
                Id.Clear;
            end;
    end;
end;

procedure TfmTableSignerAdd.IdOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
begin
    case Kind.Value of
        1, 4: SelectDepartment(Value, DisplayText);
        2: SelectDepartmentGroup(Value, DisplayText);
    end;
end;

procedure TfmTableSignerAdd.OkButtonClick(Sender: TObject);
begin
    FormControl.Ok;
end;

procedure TfmTableSignerAdd.FormShow(Sender: TObject);
begin
    if Kind.Value = 0 then Id.Visible := False;
end;

initialization
    RegisterClass(TfmTableSignerAdd);

end.
