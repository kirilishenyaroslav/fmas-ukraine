unit uShtatDocMain;

interface

uses uCommonSp, uShtatDocData, Forms;

type
    TShtatDoc = class(TSprav)
    private
        FData: TdmShtatDoc;

        procedure CheckDM;
    public
        constructor Create;
        destructor Destroy; override;
        procedure Show; override;

        property Data: TdmShtatDoc read FData;
    end;

    function CreateSprav: TSprav;stdcall;
    exports CreateSprav;

implementation

uses uShtatDocView, DB;

function CreateSprav: TSprav;stdcall;
begin
    Result := TShtatDoc.Create;
end;

procedure TShtatDoc.CheckDM;
begin
    if FData = nil then
        FData := TdmShtatDoc.Create(Application.MainForm, Input['DBHandle']);
end;

procedure TShtatDoc.Show;
var
    form: TfmShtatDocView;
begin
    CheckDM;

    form := TfmShtatDocView.Create(Application.MainForm, Self);
    form.SelectButton.Visible := Input['Select'] <> 0;

    form.RefreshButton.Click;
    if Input['ShowStyle'] = 0 then
    begin
        form.ShowModal;
        form.Free;
    end
    else
    begin
        form.FormStyle := fsMDIChild;
        form.Show;
    end;
end;

constructor TShtatDoc.Create;
begin
    inherited Create;

         // создание входных/выходных полей
    Output.FieldDefs.Add('Id_SR', ftInteger);
    Output.FieldDefs.Add('Name', ftString, 255);
    Output.FieldDefs.Add('Date_Beg', ftDate);
    Output.FieldDefs.Add('Date_End', ftDate);

        // подготовить параметры
    PrepareMemoryDatasets;

    FData := nil;
end;

destructor TShtatDoc.Destroy;
begin
    FData.Free;
    inherited Destroy;
end;

end.
