unit uPremiaOrder2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, RxMemDS, uCommonSp, uFormControl, Buttons, Grids, Spin,
  StdCtrls, SpComboBox, DBGrids, ExtCtrls, Mask, CheckEditUnit, ComCtrls,
  uFControl, uLabeledFControl, uSpravControl, uDateControl, uEnumControl,
  uCharControl, uIntControl, uBoolControl, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, ibase, uSelectForm, uFloatControl,
  ActnList, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, uActionControl, uLogicCheck,
  uSimpleCheck, qFTools, uPremiaOrderForm2, uShtatUtils,
  dmPremiaOrder2, SpFormUnit,SpCommon;

type

    TPremiaOrder = class(TSprav)
    private
//        IsConnected: Boolean;
        Form: TfmPremiaOrderList;
    public
        constructor Create;
        destructor  Destroy;override;
        procedure   Show;override;

    end;

    function CreateSprav: TSprav;stdcall;
    exports CreateSprav;

implementation

function CreateSprav: TSprav;
begin
    Result := TPremiaOrder.Create;
end;

constructor TPremiaOrder.Create;
begin
    inherited Create;
       // Input.FieldDefs.Add('DesignReport', ftBoolean);
        Input.FieldDefs.Add('AdminMode', ftBoolean);
    PrepareMemoryDatasets;
end;


destructor TPremiaOrder.Destroy;
begin
    inherited Destroy;
    Form.Free;
    Dm.Free;
end;

procedure TPremiaOrder.Show;
var
    hnd : Integer;
begin
        // DataModule prepare
    DM := TDM.Create(Application.MainForm);

    DM.LocalReadTransaction.Active := False;
    DM.LocalWriteTransaction.Active := False;

    hnd := Input['DBHANDLE'];
    
    if not VarIsNull(Input['AdminMode']) then
    AdminMode:=Input['AdminMode'];

    if DM.LocalDatabase.Connected then
        DM.LocalDatabase.Close;

    DM.LocalDatabase.Handle := TISC_DB_HANDLE(hnd);

        // Form prepare
    Form := TFMPremiaOrderList.Create(Application.MainForm);

//    Form.Show;

    if DM.IdOrder = -1 then begin

        if Dm.LocalWriteTransaction.Active then
            Dm.LocalWriteTransaction.Rollback;
    end;
    form.Visible:=False;
  //  form.Visible:=True;
  //  form.FormStyle := fsMDIChild;
//    form.Show;
    Form.ShowModal;
//    Form.Free;
//    Dm.Free;
end;

end.
