unit uSpDismission;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, DB, RxMemDS, uCommonSp, uFormControl, Buttons, Grids, Spin,
    StdCtrls, SpComboBox, DBGrids, ExtCtrls, Mask, CheckEditUnit, ComCtrls,
    uFControl, uLabeledFControl, uSpravControl, uDateControl, uEnumControl,
    uCharControl, uIntControl, uBoolControl, FIBDatabase, pFIBDatabase,
    FIBDataSet, pFIBDataSet, ibase, uSelectForm, uFloatControl,
    ActnList, cxStyles, cxCustomData, cxGraphics, cxFilter,
    cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel,
    cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
    cxControls, cxGridCustomView, cxGrid, uActionControl, uLogicCheck,
    uSimpleCheck, qFTools, uSpDismissionView;

type
    TSpDismission = class(TSprav)
    private
        IsConnected: Boolean;
        Form: TfmSpDismissionView;
    public
        constructor Create;
        destructor Destroy; override;
        procedure Show; override;
    end;

function CreateSprav: TSprav; stdcall;
exports CreateSprav;

implementation

function CreateSprav: TSprav;
begin
    Result := TSpDismission.Create;
end;

constructor TSpDismission.Create;
begin
    inherited Create;

    // создание входных/выходных полей
    Input.FieldDefs.Add('FormStyle', ftInteger);
    Input.Open;

    Output.FieldDefs.Add('Id_Dismission', ftInteger);
    Output.FieldDefs.Add('Name_Dismission', ftString, 255);
    Output.FieldDefs.Add('Kzot_St', ftString, 255);    
end;

destructor TSpDismission.Destroy;
begin
    inherited Destroy;
end;

procedure TSpDismission.Show;
var
    hnd: Integer;
begin
    Form := TfmSpDismissionView.Create(Application.MainForm);

    Form.LocalReadTransaction.Active := False;
    Form.LocalWriteTransaction.Active := False;

    if Form.LocalDatabase.Connected then Form.LocalDatabase.Close;

    hnd := Input['DBHANDLE'];
    Form.LocalDatabase.Handle := TISC_DB_HANDLE(hnd);
    Form.ResultQuery.CloseOpen(False);
    Form.FormStyle := Input['FormStyle'];

    if (Form.FormStyle = fsNormal) and (Form.ShowModal = mrOk) then begin
        Output.Open;
        Output.Append;
        Output['Id_Dismission'] := Form.ResultQueryID_DISMISSION.Value;
        Output['Name_Dismission'] := Form.ResultQueryNAME_DISMISSION.Value;
        Output['Kzot_St'] := Form.ResultQueryKZOT_ST.Value;
        Output.Post;
    end;

    if (Form.FormStyle = fsNormal) then
        Form.Free;
end;

end.
