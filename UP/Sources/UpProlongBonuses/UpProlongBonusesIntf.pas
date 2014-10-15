unit UpProlongBonusesIntf;

interface

uses uCommonSp, Forms, Ibase, Variants, Dialogs;

type
    TUP_FitchForOrder = class(TSprav)
    public
        constructor Create;
        procedure Show; override;
    end;

function CreateSprav: TSprav;stdcall;
 exports CreateSprav;

implementation

uses DB, UpProlongBonusesMain;

function CreateSprav: TSprav;
begin
    Result := TUP_FitchForOrder.Create;
end;

constructor TUP_FitchForOrder.Create;
begin
    inherited Create;
    //Параметр по которому передается идентификатор приказа
    Input.FieldDefs.Add('id_order', ftInteger);

    PrepareMemoryDatasets;
end;


procedure TUP_FitchForOrder.Show;
var frmProlongBonuses: TfrmProlongBonuses;
begin
     frmProlongBonuses:=TfrmProlongBonuses.Create(Application.MainForm,
                                             TISC_DB_HANDLE(Integer(Input['DBHandle'])),
                                             Input['ID_ORDER']);
     frmProlongBonuses.ShowModal;
     frmProlongBonuses.Free;
end;

end.
