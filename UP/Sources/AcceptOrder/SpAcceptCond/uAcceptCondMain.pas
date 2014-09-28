unit uAcceptCondMain;

interface

uses uCommonSp, Forms;

type
    TAcceptCondSprav = class(TSprav)
    private
    public
        constructor Create;
        procedure Show; override;
    end;

    function CreateSprav: TSprav;stdcall;
    exports CreateSprav;

implementation

uses DB, Controls, uAcceptCondForm;

function CreateSprav: TSprav;stdcall;
begin
    Result :=  TAcceptCondSprav.Create;
end;

procedure TAcceptCondSprav.Show;
var
    form: TfmAcceptCond;
begin
    form := TfmAcceptCond.Create(Application.MainForm, Input['DBHandle']);
    form.SelectButton.Visible := Input['Select'] <> 0;
    if form.ShowModal = mrOk then
    begin
        Output.Append;
        Output['Id_Accept_Cond'] := form.AcceptCondSelect['Id_Accept_Cond'];
        Output['Name_Accept_Cond'] := form.AcceptCondSelect['Name_Accept_Cond'];
        Output['Name_Accept_Cond_Print'] := form.AcceptCondSelect['Name_Accept_Cond_Print'];
        Output.Post;
    end;
    form.Free;
end;

constructor TAcceptCondSprav.Create;
begin
    inherited Create;

         // создание входных/выходных полей
    Output.FieldDefs.Add('Id_Accept_Cond', ftInteger);
    Output.FieldDefs.Add('Name_Accept_Cond', ftString, 255);
    Output.FieldDefs.Add('Name_Accept_Cond_Print', ftString, 255);

        // подготовить параметры
    PrepareMemoryDatasets;
end;

end.

