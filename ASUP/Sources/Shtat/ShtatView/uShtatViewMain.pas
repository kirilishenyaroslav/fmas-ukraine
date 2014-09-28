unit uShtatViewMain;

interface

uses uCommonSp, uShtatData, Forms;

type
    TShtatView = class(TSprav)
    private
        FData: TdmShtatView;

        procedure CheckDM;
    public
        constructor Create;
        destructor Destroy; override;
        procedure Show; override;

        property Data: TdmShtatView read FData;
    end;

function CreateSprav: TSprav; stdcall;
exports CreateSprav;

implementation

uses uShtatView, uShtatConsts, Controls, SysUtils, qFTools, Variants, DB,
    Registry;

function CreateSprav: TSprav; stdcall;
begin
    Result := TShtatView.Create;
end;

procedure TShtatView.CheckDM;
begin
    if FData = nil then
    begin
        FData := TdmShtatView.Create(Application.MainForm, Input['DBHandle']);
        FData.CurrSR.Open;
        FData.AllSR.Open;
        FData.Consts_Query.Open;

        if VarIsNull(Input['NewVersion']) then
            FData.NewVersion := False
        else FData.NewVersion := Input['NewVersion'];
    end;
end;

procedure TShtatView.Show;
var
    form: TfmShtatView;
begin
    CheckDM;

    {    if VarIsNull(Input['Id_SR']) then
        begin
            qFErrorDialog('Спочатку треба створити документ штатного розкладу!');
            Exit;
        end;}

    if not VarIsNull(Input['Id_SR']) and
        not FData.AllSR.Locate('Id_SR', Input['Id_SR'], []) then
    begin
        FData.AllSR.Last;
        if not FData.AllSR.IsEmpty then
        begin
            Input.Edit;
            Input['Id_SR'] := FData.AllSR['Id_SR'];
            Input.Post;
        end;
    end;

    form := TfmShtatView.Create(Application.MainForm, Self);

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

constructor TShtatView.Create;
begin
    inherited Create;

    Input.FieldDefs.Add('Id_SR', ftInteger);
    Input.FieldDefs.Add('NewVersion', ftBoolean);
    PrepareMemoryDataSets;

    ActualDate := Date;

    FData := nil;
end;

destructor TShtatView.Destroy;
begin
    FData.Free;
    inherited Destroy;
end;

end.
