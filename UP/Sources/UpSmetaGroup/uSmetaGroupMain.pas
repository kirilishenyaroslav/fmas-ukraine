unit uSmetaGroupMain;

interface

uses uCommonSp, Forms;

type
    TSmetaGroup = class(TSprav)
    private
    public
        constructor Create;
        procedure Show; override;
    end;

    function CreateSprav: TSprav;stdcall;
    exports CreateSprav;

implementation

uses uSmetaGroup, DB;

function CreateSprav: TSprav;stdcall;
begin
    Result := TSmetaGroup.Create;
end;

procedure TSmetaGroup.Show;
var
    form: TfmSmetaGroup;
begin
    form := TfmSmetaGroup.Create(Application.MainForm, Self);
//    form.SelectButton.Visible := Input['Select'] <> 0;

//    form.RefreshButton.Click;
    form.ShowModal;
    form.Free;
end;

constructor TSmetaGroup.Create;
begin
    inherited Create;

         // создание входных/выходных полей
    Input.FieldDefs.Add('Period_Beg', ftDate);
    Input.FieldDefs.Add('Period_End', ftDate);

    Output.FieldDefs.Add('Id_Group', ftInteger);
    Output.FieldDefs.Add('Group_Kod', ftInteger);
    Output.FieldDefs.Add('Group_Title', ftString, 100);

        // подготовить параметры
    PrepareMemoryDatasets;
end;

end.

