unit uTableSigners;

interface

uses uCommonSp, uTableSignersData, Forms;

type
    TTableSigners = class(TSprav)
    private
        FData: TdmTableSigners;

        procedure CheckDM;
    public
        constructor Create;
        destructor Destroy; override;
        procedure Show; override;

        property Data: TdmTableSigners read FData;
    end;

implementation

uses uTableSignersList, uCommonDB, uFIBCommonDB;

procedure TTableSigners.CheckDM;
begin
    if FData = nil then
        FData := TdmTableSigners.Create(Application.MainForm, Input['DBHandle']);
end;

procedure TTableSigners.Show;
var
    form: TfmTableSignersList;
begin
    CheckDM;

    form := TfmTableSignersList.Create(Application.MainForm, Self);

    form.RefreshButton.Click;
    if Input['ShowStyle'] = 0 then
    begin
        form.ShowModal;
        form.Free;
    end
    else form.Show;
end;

constructor TTableSigners.Create;
begin
    inherited Create;

    PrepareMemoryDataSets;

    FData := nil;
end;

destructor TTableSigners.Destroy;
begin
    FData.Free;
    inherited Destroy;
end;

end.
